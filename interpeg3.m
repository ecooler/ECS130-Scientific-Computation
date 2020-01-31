%
% This example to illustrate that the interpolating polynomial 
% in power basis could be very ill-conditioned, but 
% Lagrange basis works fine. 
%
% Question: from the output of interpolating polynomial, can we use
%           it to predict the population of 2002 or 2010? 
%
% if necessary, addpath C:\cygwin\home\bai\ECS130\NCM\
%
%
% Census years
t = (1900:10:2000)';   

% US population in millions 
p = [  75.995  91.972 105.711 123.203 131.669 150.697 ...
      179.323 203.212 226.505 249.633 281.422]';  

n= 10;   % degree of interpolating polynomail 

% points where the polynomials is to be evaluated. 
um = (1900:1:2010)';

% -----------------------------------------
%  Power basis
% -----------------------------------------

vp = polyinterppower(t,p,um); 

% -----------------------------------------
%  Lagrange basis
% -----------------------------------------

vl = polyinterp(t,p,um);    % Lagrange from Moler/NCM 

% -----------------------------------------
%  Plot 
% -----------------------------------------

plot(t,p,'ro',um,vp,'b-',um,vl,'r-');  
legend('Census data','Power basis','Lagrange basis')
xlabel('year') 
ylabel('population (millions)') 
title('Full-degree polynomial interpolation of census data') 
