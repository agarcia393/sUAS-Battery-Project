%%% Master Pramenter Control %%%%
%::::::::::::::::::::::::::::::;
%%% Static--Wind Speed Inputs 
%%%%%%%%%%%%%%%%%%%%  %%%%%%%%%%%%%%%%%%%%%
global hightz;

% Upper Limit Wind Speed(Saturation Block) 
[xwind_u, ywind_u, zwind_u]= windspeed(0,0,0); 
% Lower Limit Wind Speed(Saturation Block
[xwind_l, ywind_l, zwind_l]= windspeed(-3.2,0,0);
 % rate of speen incrases to final value 
[rate_x,rate_y,rate_z]= windspeed(-0.5,0,0); % Must repersent direction of wind (+ or -)
% Time when slop starts (sec)
[xt_start,yt_start,zt_start]=windspeed(5,0,0);

windmatreiz= [xwind_u, ywind_u, zwind_u;xwind_l,ywind_l,zwind_l];

%::::::::::::::::::::::::::::::

%%% Wind Speed Inputs 
wind_env=switching('off');
wind_state=switching('off');

%::::::::::::::::::::::::::::::;
%%% Waypoins [x,y,z,yaw]
Waypont=[ 0	0	hightz	0	;...
20	0	hightz	0	;...
20	5	hightz	0	;...
0	5	hightz	0	;...
0	10	hightz	0	;...
20	10	hightz	0	;...
20	15	hightz	0	;...
0	15	hightz	0	;...
0	20	hightz	0	;...
20	20	hightz	0	;...
20	25	hightz	0	;...
0	25	hightz	0	]; % [x,y,z,yaw]
%%% Lookahead distance along the path
Lookah_distance=40; %[m]
waypoint_raduis= 1.5;