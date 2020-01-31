%
% Demonstrate the secant method
%

clear;  
format long e;   
format compact; 

% definition of function and initial guesses

% Test 1 
%f = inline('x^2 - 2') 
%xprev = 3;
%x = -2;

% Test 2 
f = inline('tan(x/4) - 1') 
xprev = -2.5;
x = 0;

% Test 3 
%f = inline('x^3 - 3*x + 1') 
%xprev = 0; 
%x = 1; 

% Test 4  
% Wallis' example 
%f = inline('x^3 - 2*x - 5'); 
%xprev = 2; 
%x = 3; 

%----------------------------------------
%
%   Secant iteration .... 
%
kmax = 100; 
k = 0; 
while abs(x-xprev) > eps*abs(x)

   k = k+1 
   t = x;  
   s =  (f(x) - f(xprev))/(x-xprev);  
   x =  x - f(x)/s  
   xprev = t; 
   
   if k > kmax, 
      disp('exceeded the max number of iterations')
      return 
   end 
end 

approx_root = x 
f_at_approx_root = f(x) 

ezplot(f,-8,8) 
hold on; 
ezplot('0',-8,8) 
plot(x,0,'r*') 
hold off; 
