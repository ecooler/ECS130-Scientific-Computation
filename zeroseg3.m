%
% A perverse example to show Newton's method cycles forever,
% neither converging nor diverging
%
clear;  
format long e;   
format compact; 

% definition of function and search interval 

f = inline('sign(x-2)*sqrt(abs(x-2))') 
fprime = inline('sign(x-2)*sqrt(abs(x-2))/(2*(x-2))') 
xprev = 3; %initial value  

% First Newton iteration

x = xprev - f(xprev)/fprime(xprev)

% save initial two approximations 
x0 = xprev; 
x1 = x; 

% Plot: Newton's method cycles forever.  
ezplot(f,0,4) 
hold on;  
plot([0 4],[0 0]) 
plot(x0,0,'r*') 
plot(x1,0,'b*') 
plot([x0 x1],[f(x0) 0],'m--'); 
plot([x1 x0],[f(x1) 0],'m--'); 
plot([x0 x0],[0 f(x0)],'g:') 
plot([x1 x1],[0 f(x1)],'g:') 
hold off; 

% Newton iterations 

kmax = 100; 
k = 1; 
while abs(x-xprev) > eps*abs(x)
   xprev = x; 
   x = x - f(x)/fprime(x)
   k = k+1;  
   if k > kmax, 
      disp('exceeding the max. number of iterations, quit'); 
      return
   end
end 
