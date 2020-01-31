function x = myfsrow(L, b)
%
% solves the lower triangular linear 
% system Lx=b in vectorized manner by 
% row oriented forward substitution. 
% 
% input L is a n x n lower triangular matrix
% input b is a vector of length n 
%
n = size(L,1);
x = zeros(n,1);
x(1) = b(1)/L(1,1);
for i =2:n
    x(i) = (b(i) - (L(i,1:i-1)*x(1:i-1)))/L(i,i);
end

end
