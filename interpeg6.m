
addpath C:\cygwin\home\bai\ECS130\NCM\

% 
% Example: my V-sign. 
%

% ---- collect data on screen -----
%figure
%set(gcf,'menubar','none');
%axes('position', [0 0 1 1]) 
%[x,y]=ginput;    % hit ``return'' to terminate 

% ---- load data that has been collected previously on screen -----
load interpeg6data;

% Interpolation data

n = length(x); 
s = (1:n)';
t = (1:0.05:n)';

% piecewise linear

upl = piecelin(s,x,t);
vpl = piecelin(s,y,t);  

% pchip

upchip = pchiptx(s,x,t);  
vpchip = pchiptx(s,y,t);  

% cubic spline

uspline = splinetx(s,x,t);  
vspline = splinetx(s,y,t);  

% plots  

figure(1)
axis('square') 
hold on  
plot(x,y,'r.','Markersize',20)
pause 
plot(upl,vpl,'b-','LineWidth',2)
pause 
plot(upchip,vpchip,'g-','LineWidth',2)
pause 
plot(uspline,vspline,'r','LineWidth',2); 
legend('data','piecelin', 'pchip','cubic spline')
hold off 
