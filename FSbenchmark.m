%
% Performance comparison of three forward substitution algorithms 
% for solving lower triangular systems
%

% generate test matrix L and right hand size b;
%
n = 5000;
A = randn(n);
[L,U,p] = lu(A);
b = L*ones(n,1);   % Note that b is chosen so that we know
                   % x = (1,...,1)^T is an exact solution

disp(' n     Row-component    Row-vectorized     Col-vectorized')
disp('---------------------------------------------------------')
for n = [100 1000 2000 3000 4000 5000]
    tic; x1 = myfscomponent(L(1:n,1:n),b(1:n));  t1 = toc;
    tic; x2 = myfsrow(L(1:n,1:n),b(1:n)); t2 = toc;
    tic; x3 = myfscolumn(L(1:n,1:n),b(1:n)); t3 = toc;
    disp(sprintf('%2.0f \t %7.4f \t\t\t %7.4f \t\t\t %7.4f',n,t1,t2,t3)); 
end
