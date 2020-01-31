function x = myfscomponent(L, b)
%
% solves the lower triangular linear 
% system Lx=b in componentwise manner by 
% row oriented forward substitution. 
% 
% input L is a n x n lower triangular matrix
% input b is a vector of length n 
%
n = size(L,1); 
x = zeros(n,1);
for i = 1:n
    x(i) = b(i);
    for j = 1:i-1
        x(i) = x(i) - L(i,j)*x(j);
    end
    x(i) = x(i)/L(i,i);
end

end
