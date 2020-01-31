% 
% Example for Piecewise Linear Interpolation 
%

x = 1:6;
y = [16, 18, 21, 17, 15, 12]; 
disp([x;y])

u = 1:0.05:6; 
v = piecelin(x,y,u);  

plot(x,y,'o',u,v,'b-');  
title('Piecewise linear interpolation'); 
legend('data','piecelin') 
