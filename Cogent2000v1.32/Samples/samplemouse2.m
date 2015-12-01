% SAMPLEMOUSE.M - Demonstrates how mouse position can be used to update display.
% Configure mouse in polling mode with 10ms interval
config_mouse(17);  
config_display(0);
start_cogent;
% Define variable map to contain current information about mouse
map = getmousemap; 
x = 100;
y = 0;
deltaX = 0; deltaY = 0;
radius = 100;
while 1
   
   % Draw text at position defined by mouse (0,0 at first).
   clearpict( 1 );
   preparestring( '+', 1, x, y );
   drawpict( 1 );
   
   % Update mouse map using readmouse.
   readmouse;     
   
   % Update coordinates for text.
   deltaX = sum(getmouse(map.X)); if isempty(deltaX), deltaX = 0; end
   deltaY = -sum(getmouse(map.Y)); if isempty(deltaY), deltaY = 0; end
   x = x + deltaX; y = y + deltaY;
   
   
   % Calculate angle from 0,0, and make sure mouse is on the implicit
   % circle
   if deltaX ~= 0 && deltaY ~= 0
       curRadius = sqrt((x)^2+(y)^2);
       x = x / curRadius; y = y / curRadius;
       theta = atan2d(y,x);
       if theta < 0
           theta = theta + 360;
       end
       x = 100 * cosd(theta);
       y = 100 * sind(theta);
%        [x,y] = pol2cart(theta,radius);
       deltaX = 0; deltaY = 0;
   end
   
   % Exit if left mouse button is pressed
   if ~isempty(getmouse(map.Button1)) && any(getmouse(map.Button1) == 128 ) 
      break;
   end
   
   clearmouse;
   
end

stop_cogent;   
   


   