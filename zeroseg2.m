%
% Demonstrate Newton's method 
%
clear;  
format long e;   
format compact; 
% --------------------------------------- 
% definition of function and initial guess
% --------------------------------------- 

%Test 1 
f = inline('x^2 - 2') 
fprime = inline('2*x') 
xprev = 5; %initial value  

%Test 2 
%f = inline('tan(x/4) - 1') 
%fprime = inline('(1/4)*(1/(cos(x/4))^2)') 
%xprev = -2.5; %initial value  

%Test 3 
%f = inline('x^3 - 3*x + 1') 
%fprime = inline('3*x^2 - 3') 
%xprev = -3; 
%xprev = -1; % bad initial value  (why?)
%xprev = 0.5; % bad initial value (why?) 

% --------------------------------------- 
% Newton iteration
% --------------------------------------- 

x0 = xprev;  
x = xprev - f(xprev)/fprime(xprev); 

k = 1; 
kmax = 100; 
while abs(x-xprev) > eps*abs(x)
   xprev = x; 
   x = x - f(x)/fprime(x) 
   k = k+1;  
   if k > kmax,
     error('failed convergence after kmax steps')
   end 
end 

numberofiters = k 
approx_root = x
f_at_approx_root = f(x) 

% plot 

ezplot(f,-6,6)
hold on;
plot(x0,0,'bo',x,0,'r*')
plot([-6 6],[0 0],'g-')
hold off;
