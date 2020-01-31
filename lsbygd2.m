%
% Using Gradient Descent to solve a 2D linear regression 
%
%
% load a 2D dataset X, 
% find the linear regression y = w'*x 

load data2D; 
[n,p]=size(X); 
X = X - ones(n,1)*mean(X); 
A = X(:,1);      %  design matrix 
b = X(:,2); 
m = 1;

%-------------

tau = 0.01; % learning rate
tol = 1e-4;    
kmax = 200; 

w = zeros(m,1);
for k = 1:kmax
    r = A'*(A*w - b); 
    wp = w - tau*r;
    res(k) = norm(r); 
    if res(k) <= tol,
       disp('GD converged at')
          k 
       break
    end
    w = wp; 

end
FinaRes = norm(A*w - b) 

wexact = A\b; 
ExactRes = norm(A*wexact - b) 

Solution = [w wexact]


figure(1);  
semilogy((1:k),res(1:k),'r+')
title('convergence history') 
xlabel('iter k') 
ylabel('residual norm') 

figure(2)
plot(X(:,1),X(:,2),'ro','MarkerSize',10,'MarkerFaceColor','r');
axis([-0.5 0.5 -0.5 0.5])
axis('square')
hold on
plot([-0.5 0.5],[0 0],'b--','LineWidth',1)
plot([0 0],[-0.5 0.5],'b--','LineWidth',1)
plot([-0.5 0.5],[-0.5 0.5],'b--','LineWidth',1)
plot([-0.5 0.5],w*[-0.5 0.5],'g-','LineWidth',2)
title('Linear regression')
xlabel('x')
ylabel('y')
hold off
