%
% Demonstrate the bisection method 
%
clear;  
format long e;   
format compact; 
% ------------------------------------------
% definition of function and search interval 
% ------------------------------------------

% Test 1 
%f = inline('x^2 - 2') 
%a = 0
%b = 2

% Test 2 
f = inline('tan(x/4) - 1') 
a = 2 
b = 4

% Test 3 
%f = inline('x^3 - 3*x + 1') 
%a = -3   
%b =  3  

% initial interval
a0 = a; 
b0 = b; 

% ------------------------------------------
% bisection procedure 
% ------------------------------------------


% Check 
if sign( f(a) ) == sign( f(b) )
   error('signfa and signfb are the same')
end 

k = 0; 
while abs(b-a) > eps*abs(b)
   x = (a+b)/2;
   if sign( f(x) ) == sign( f(b) )
      b = x; 
   else
      a = x; 
   end
   k = k+1;  
end 

% check 
numberofbisections = k 
approx_root = a 
f_at_approx_root = f(a) 


% Graphic output 

ezplot(f,a0,b0);
hold on;  
plot([-5,5],[0 0],'g-',a,0,'ro')
hold off
