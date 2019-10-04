close all
currentFolder =fileparts( 'C:\Users\Andrew Garcia\Box\MESA LAB- Battery Project\Data\Fall19\Data');
datename = datestr(now,'mm_dd_yy_HH_MM_SS');
Today_data= datestr(now,'mm_dd_yy');
newSubFolder = sprintf('%s\\Data\\%s\\%s', currentFolder,Today_data, datename);
% Finally, create the folder if it doesn't exist already.
if ~exist(newSubFolder, 'dir')
  mkdir(newSubFolder);
end
% Build the full file name with fullfile.
save(fullfile(newSubFolder, [datename '.mat']));


figure(1) %% x & y positons
plot(simout.x,simout.y)
hold on 
plot(simout.x(1,1),simout.y(1,1),'*g','MarkerSize',20) %plots first point
hold on
plot(simout.x(end),simout.y(end),'*r','MarkerSize',20) %plots end point 
hold on 
% p1= [ max(simout.x) 0 ] ; % First Point 
% p2= [min(simout.x) 0]; % Secound Point
% dp= p2-p1;  % Differnce 
% quiver(p1(1),p1(2),dp(1),dp(2),0) % Direction of wind 
hold off 
txt = sprintf('x & y Positons ');
title(txt)
xlabel('x position [m]') 
ylabel('y position [m]') 
hold off 

figure(2) %% 3D positons
plot3(simout.x,simout.y,simout.z)
hold on 
plot3(simout.x(1,1),simout.y(1,1),simout.z(1,1),'*g','MarkerSize',20) %plots first point
hold on
plot3(simout.x(end),simout.y(end),simout.z(end),'*r','MarkerSize',20) %plots end point 
hold on 
% p1_2= [ max(simout.x) 0 ] ; % First Point 
% p2_2= [min(simout.x) 0]; % Secound Point
% dp2= p2_2-p1_2;  % Differnce 
% quiver(p1_2(1),p1_2(2),dp2(1),dp2(2),0)
hold off 
title('3D positons ')
xlabel('x position [m]') 
ylabel('y position [m]') 
zlabel('z position [m]') 
hold off 

figure(3)
plot(simout.time,simout.Energy_Consumed(:,1))
title('Energy_Consumed[kJ] ')
xlabel('Time [sec]') 
ylabel('Energy_Consumed[kJ]') 
hold off 

figure(4) 
plot(simout.time,simout.Voltage)
title('Propeller  Voltage[V]')
xlabel('Time [sec]') 
ylabel('Voltage[V]') 
legend('prop 1','prop 2','prop 3','prop 4')
hold off 

figure(5)
plot(simout.Wind_Velocity)
title('Wind_Velocity [m/s] vs Time [sec]')
xlabel('Time [sec]') 
ylabel('Wind_Velocity[m/s]') 
hold off 


FolderName = newSubFolder;   % Your destination folder
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for k = 1:length(FigList)
  FigName= num2str(k);
  saveas(figure(k),fullfile(FolderName, [FigName '.jpg']));
  saveas(figure(k),fullfile(FolderName, [FigName '.fig']));

end
