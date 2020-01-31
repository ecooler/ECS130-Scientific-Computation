
% Illustrate the power method for computing 
% the dominant eigenvalue and the corresponding eigenvector. 

%
% Matrix data A = gallery(3)  
n = 3; 
A = [ 
-149 -50 -154
 537 180 546
-27 -9 -25];  

%------ power method ---------------------------

maxit = 10*n;   % maximum number of iterations 
tol = 1e-5;     % stopping threshold
iterno = 0;     % counter for number of iteration

%
u = rand(n,1);  % initial guess 
lambda0 = u'*(A*u)/(u'*u);  

for i = 1:maxit 

    iterno = iterno + 1; 

    v = A*u; 
    u = v/norm(v);     % approximate eigenvector
    lambda = u'*(A*u); % approximate eigenvalue 

    % check for convergence 
    if abs(lambda - lambda0)/abs(lambda0) <= tol, 
       break 
    end 

    lambda0 = lambda 

    residue = norm(A*u - lambda0*u)/(norm(A*u) + abs(lambda0))
    pause 

end 

% Summary 

No_of_Iterations  = iterno 
Computed_dominant_eigval = lambda 
Residual =  norm(A*u - lambda*u,1)/norm(A,1)   
