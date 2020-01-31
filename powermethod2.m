% 
% Illustrate the power method for computing the PageRank
% of a tiny web   --- see Section 2.11 

% Data 
n = 6;  % number of webpages 
% adjacency matrix of the web 
G = [
0 0 0 1 0 1
1 0 0 0 0 0
0 1 0 0 0 0
0 1 1 0 0 0
0 0 1 0 0 0
1 0 1 0 0 0]
figure(1) 
spy(G) 
title('Adjacency (connection) matrix of the tiny web') 

% set up the PageRank model of the tiny web 
c = sum(G,1);
k = find(c~=0); 
D = sparse(k,k,1./c(k),n,n);  
e = ones(n,1);
I = speye(n); 
p = 0.85; 
delta = (1-p)/n; 
z = zeros(n,1); 
for i = 1:n,
   if c(i) == 0,
      z(i) = 1/n;
   else
      z(i) = delta
   end 
end 
A = p*G*D + e*z'; % Matrx model of the tiny web 

%------ power method ---------------------------

maxit = 10*n;   % maximum number of iterations 
tol = 1e-5; 
iterno = 0; 

u = ones(n,1);  % initial guess 
lambda0 = u'*(A*u)/(u'*u);  

for i = 1:maxit 

    iterno = iterno + 1; 

    v = A*u; 
    u = v/norm(v);          % approximate eigenvector
    lambda = u'*(A*u);      % approximate dominant eigenvalue 

    % check for convergence 
    if abs(lambda - lambda0)/abs(lambda0) <= tol, 
       break 
    end 

    lambda0 = lambda 

end 

No_of_Iterations  = iterno 
Computed_dominant_eigval = lambda 
Residual =  norm(A*u - lambda*u,1)/norm(A,1)   
Pagerank = u/sum(u) 
figure(2) 
bar(Pagerank)
title('Page rank for the tiny web')
