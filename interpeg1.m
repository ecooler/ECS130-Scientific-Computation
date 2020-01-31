%
% This example that the interpolating polynomails 
% presented in power basis and Lagrange basis
%
% if necessary, addpath C:\cygwin\home\bai\ECS130\NCM\
%

x = (0:3)'; 
y = [-5, -6, -1, 16]';
n = 3;    % degree of the interpolating polynomial 
u = (-0.5:0.1:3.5)';    % evaluate the inter. poly. at u. 

% -----------------------------------------
%  interpolating polynomail in power basis
% ------------------------------------------

vp = polyinterppower(x,y,u);  

% -------------------------------------------
%  interpolating polynomail in Lagrange basis
% -------------------------------------------

vl = polyinterp(x,y,u); 

% -------------------------------------------
%  plots
% -------------------------------------------

plot(x,y,'ro');
hold on 
plot(u,vp,'b-',u,vl,'r--');  
legend('data','power basis','Lagrange basis') 
hold off; 

