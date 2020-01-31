function x = myfscolumn(L, b)
%
% solves the lower triangular linear 
% system Lx=b by column oriented 
% forward substitution. 
%
% input L is a n x n lower triangular matrix
% input b is a vector of length n 
%
n = size(L,1);
x = zeros(n,1);
for j = 1:n-1
    x(j) = b(j)/L(j,j);
    b(j+1:n) = b(j+1:n) - L(j+1:n,j)*x(j);
end
x(n) = b(n)/L(n,n);

end
