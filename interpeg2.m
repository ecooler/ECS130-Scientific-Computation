%
% Example from the textbook, page 97 
%
% Note that the function shows excessive variation, 
% especially in the first and last subintervals. 
%
% if necessary, addpath C:\cygwin\home\bai\ECS130\NCM\

% Interpolation points 
x = (1:6)'; 
y = [16, 18, 21, 17, 15, 12]'; 
disp([x;y])
n = 5; %degree of interp. poly.

% evaluation points of the interp. polys. 
u = (0.65:0.05:6.25)';    %make a column vector u

% -----------------------------------------
%  interpolating polynomail in power basis
% ------------------------------------------

vp = polyinterppower(x,y,u);  

% -------------------------------------------
%  interpolating polynomail in Lagrange basis
% -------------------------------------------

vl = polyinterp(x,y,u); 

% -------------------------------------------
%  plot
% -------------------------------------------

figure(1)
plot(x,y,'o',u,vp,'b-',u,vl,'r--');  
title('Full-degree polynomial interpolation'); 
legend('Data','power basis','Lagrange basis'); 

