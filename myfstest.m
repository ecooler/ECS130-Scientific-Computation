%
% This script tests the correctness of three lower-triangular solvers
%
% -------------------
% 
% generate test matrix L and right hand size b; 
% 
n = 10; 
A = randn(n); 
[L,U,p] = lu(A); 
b = L*ones(n,1);   % Note that b is chosen so that we know 
                   % x = (1,...,1)^T is an exact solution 
%
% Method 1: Forward substitution, row-oriented, componentwise 
%
x1 = myfscomponent(L,b);  
error1 = norm(x1 - ones(n,1))/sqrt(n)  
%
% Method 2: Forward substitution, row-oriented, vectorized
%
x2 = myfsrow(L,b);  
error2 = norm(x2 - ones(n,1))/sqrt(n)  
%
% Method 3: Forward substitution, column-oriented, vectorized
%
x3 = myfsrow(L,b);  
error3 = norm(x3 - ones(n,1))/sqrt(n)  
