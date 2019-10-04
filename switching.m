function [x]=switching(result)
% Switching will trun on and off switch
% 'on'= 1
% 'off'= 0 
switch(result) 
    case 'on' 
       x=1;
    case 'off'
      x=0;
    otherwise
        error('No Command ')
end
