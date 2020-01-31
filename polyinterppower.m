function v = polyinterppower(x,y,u) 
%
%  interpolating polynomail in power basis
%
%-----------------------------------------
%
% compute the coefficients 
%
n = length(x); 

V = vander(x);
a = V\y; 

% polynomial evaluation by horner's rule 
v = horner(n-1,a,u);  

