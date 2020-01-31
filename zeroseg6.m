
%
% This example shows how to use the function ``fzerotx'' 
% f(a) and f(b) must have opposite signs
%

% Test 1
%f = inline('x^2 - 2')
%a = 0
%b = 2

% Test 2
f = inline('tan(x/4) - 1')
a = -2.5
b = 4

% Test 3 
%f = inline('cos(x)') 
%a = 0 
%b = 3*pi 

% Test 4 
%f = inline('besselj(0,x)');  % Bassel function of the first kind 
%a = 0;
%b = 9*pi;   

%-----------------------------------

z = fzerotx(f,[a b]) 

%-----------------------------------

figure(1); 
ezplot(f,a,b);
hold on; 
plot(z,0,'r*');
plot([a b],[0,0],'g-');  
hold off; 

