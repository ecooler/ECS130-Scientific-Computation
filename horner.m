function p = horner(n,a,u)
%
% Horner's rule for polynomial evaluation
%
% p(x) = a(1)*x^n + a(2)*x^(n-1) + ... + a(n)*x + a(n+1)
%
% at points u
%
%
k = length(u);
p = a(1)*ones(k,1);
for i = 1:n,
    p = u.*p + a(i+1)*ones(k,1);
end

