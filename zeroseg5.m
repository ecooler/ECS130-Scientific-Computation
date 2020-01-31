%
% Demonsrate the Inverse Quadratic Interpolation (IQI) method
%

clear;  
format long e;   
format compact; 

%definition of function and initial values 

% Test 1 
%f = inline('x^2 - 2') 
%a = 1;   % lead to NaN, find out why?  
%b = 1.1;
%c = -1;

% Test 2 
f = inline('tan(x/4) - 1') 
a = -2.5; 
b = -1;
c = 0;

% Test 3 
%f = inline('x^3 - 3*x + 1') 
%a = -1; 
%b = 0;
%c = 1;

%----------------------------

k = 0; 
kmax = 100; 

% IQI loop 

while abs(c-b) > eps*abs(c)

   x = polyinterp([f(a),f(b),f(c)],[a,b,c],0);  
   a = b; 
   b = c; 
   c = x; 
   
   k = k+1 
   if k > kmax, 
      disp('exceeded the max number of iterations, quit')
      return
   end 

end 

% check 
apprx_root = x 
f_at_approx_root = f(x) 

% plot 
ezplot(f,-8,8) 
hold on; 
plot([-4 4],[0 0],'g-'); 
plot(x,0,'r*') 
hold off; 
