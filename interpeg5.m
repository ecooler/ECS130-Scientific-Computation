%
% Example for 
%
%   (1) Piecewise Linear interpolation, 
%   (2) PCHIP: Piecewise Cubic Hermite Interpolating Polynomial 
%   (3) SPLINE: Piecewise Cubic Spline Interpolating
%

% Data points 
x = 1:6; 
y = [16 18 21 17 15 12]; 

% Evaluation points 
u = (1:0.01:6); 

% ----------------------------
% (1) Piecewise Linear Spline
% ----------------------------

vpl = piecelin(x,y,u);  

% ----------------------------
% (2) PCHIP: Piecewise Cubic Hermite Interpolating Polynomial
% ----------------------------

vpchip = pchiptx(x,y,u);  

% ----------------------------
% (3) SPLINE: Piecewise Cubic Spline Interpolating'
% ----------------------------

vspline = splinetx(x,y,u);  

% -----------
% plots 
% -----------

subplot(2,2,1)
plot(x,y,'ro',u,vpl,'b-','LineWidth',2);  
%legend('Data','Piecewise Linear')
title('piecewise linear') 

subplot(2,2,2) 
plot(x,y,'ro',u,vpchip,'r-.','LineWidth',2);
%legend('Data','pchip')
title('pchip') 

subplot(2,2,3) 
plot(x,y,'ro',u,vspline,'g--','LineWidth',2) 
%legend('Data','spline')
title('cubic spline') 

subplot(2,2,4) 
plot(x,y,'ro',u,vpl,'b-',...
     u,vpchip,'r-.',...
     u,vspline,'g--','LineWidth',2) 
legend('Data','Linear','PCHIP','Cubic spline') 
%title('all interpolants') 

