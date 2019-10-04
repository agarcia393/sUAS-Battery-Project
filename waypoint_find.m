% BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
% FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
% OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
% PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
% OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
% MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
% TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
% PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
% REPAIR OR CORRECTION.
%
%   12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
% WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
% REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
% INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
% OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
% TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
% YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
% PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGES.

% Waypoint Finder function
% INPUT: glob, state, big_pam
% OUTPUT: Desired Position for path
function out=waypoint_find(in)
glob;
big_pam;
global Ni;

% ********* Operational Conditions *********
roll=in(1);     % [rad]
dotroll=in(2);  % [rad/s]
pitch=in(3);
dotpitch=in(4);
yaw=in(5);
dotyaw=in(6);
z=in(7);        % [m]
dotz=in(8);     % [m/s]
x=in(9);
dotx=in(10);
y=in(11);
doty=in(12);
Time_1=in(13);
% ********* Operational Conditions *********

Cur_pos=[ x y z yaw]; % Current UAS Postion
new_pos=[]; % Place holder for New Postion
size_waypoint=size(Waypont);% Size of waypoint Marix %%%How many Rolls


for i=Ni
    % Allows time for system to stablizes 
    if (Time_1<=5)
        new_pos=[0 0 0 0 ];
        % Check Ni isnt over allowable size of Wapooints Marix
    elseif(Ni==size_waypoint(:,1))
        Ni=size_waypoint(:,1);
        new_pos=Waypont(i,:);
        % Checks if current position is between waypoints with +/- of
        % raduis
    elseif ((Cur_pos>=(Waypont(i,:)- waypoint_raduis)) & (Cur_pos<=(Waypont(i,:)+ waypoint_raduis)  ))
        Ni= Ni+1;
        new_pos=Waypont(i+1,:);
        % If hasnt reached waypoint it keeps waypoint as desired Positon
    else
        Ni=Ni;
        new_pos=Waypont(i,:);
        
    end
    
end

Dis_posx=new_pos(:,1);
Dis_posy=new_pos(:,2);
Dis_posz=new_pos(:,3);
Dis_posyaw=new_pos(:,4);

out(1)=Dis_posx;
out(2)=Dis_posy;
out(3)=Dis_posz;
out(4)=Dis_posyaw;
