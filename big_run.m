% Supper Run
% It will run optsiminit.m and systemamdl
clear all;
global hightz;
hightz= 10;
optsiminit;

simTime= '350'; % seconds 
simout=sim('systema.mdl', 'AbsTol','1e-5','StopTime',simTime,'SaveState','on',...
'StateSaveName','xoutNew',...
 'SaveOutput','on','OutputSaveName','youtNew');
simout.getSimulationMetadata.ExecutionInfo % Capture Simulation Errors
simoutVars = simout.who
yout = simout.youtNwew;
pause(2);
bigsave
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear all;
global hightz;

hightz= 15;
optsiminit; 

simTime= '350'; % seconds 
simout=sim('systema.mdl', 'AbsTol','1e-5','StopTime',simTime,'SaveState','on',...
'StateSaveName','xoutNew',...
 'SaveOutput','on','OutputSaveName','youtNew');
simout.getSimulationMetadata.ExecutionInfo % Capture Simulation Errors
simoutVars = simout.who
yout = simout.youtNwew;
pause(2);
bigsave

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
global hightz;

hightz= 20;
optsiminit;

simTime= '350'; % seconds 
simout=sim('systema.mdl', 'AbsTol','1e-5','StopTime',simTime,'SaveState','on',...
'StateSaveName','xoutNew',...
 'SaveOutput','on','OutputSaveName','youtNew');
simout.getSimulationMetadata.ExecutionInfo % Capture Simulation Errors
simoutVars = simout.who
yout = simout.youtNwew;
pause(2);
bigsave
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
global hightz;

hightz= 25;
optsiminit;

simTime= '350'; % seconds 
simout=sim('systema.mdl', 'AbsTol','1e-5','StopTime',simTime,'SaveState','on',...
'StateSaveName','xoutNew',...  
 'SaveOutput','on','OutputSaveName','youtNew');
simout.getSimulationMetadata.ExecutionInfo % Capture Simulation Errors
simoutVars = simout.who
yout = simout.youtNwew;
pause(2);
bigsave
