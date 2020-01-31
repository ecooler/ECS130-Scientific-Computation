%
% This script performs Newton and Steepest Descent iterations 
% to find the minimal of the function:
%
%      f(x,y)= (x-2)^4 + (x-2)^2 y^2 + (y+1)^2
%
% The true minimum of the function is (x,y)=(2,-1).
%
% Written by Luan Nguyen, March 2017 
%
% Use Directions:
% 1. Run Newton_SD_demo()
% 2. Click on the plot to initialize guess x0
% 3. Press <Enter>

%--------------------------------------------------------------

function Newton_SD_demo()
    %% Parameters
    maxiter = 7; 
    % Other parameters:
    % -Tolerance for SD's stepsize optimization problem
    % -

    %% Draw contour plot
    n=100; 
    x = linspace(-1,5,n);
    y = linspace(-4,2,n);
    [X,Y] = meshgrid(x,y);
    Z = f1(X,Y); mx= max(max(Z));
    figure; [~,h]=contour(X,Y,log(Z), 20); 
    a = get(h, 'Parent'); axis equal;
    
    %% Initialize data
    x0 = (ginput)';
    xnwtn = x0;
    xsd = x0;
    xtrue = [2;-1]; %for printing error
    
    %% Setting up graphics
    lnwtn = line('Parent',a, 'XData',xnwtn(1),'YData',xnwtn(2)...
             ,'Color','b', 'Marker','*');
    lsd = line('Parent',a, 'XData',xsd(1),'YData',xsd(2)...
             ,'Color','r', 'Marker','*');
    legend('level lines ','newton','steepest descent' );
    disp('Relative Error:');
    disp('    Newton      Steepest Descent');
    for i=1:maxiter

        %% Newton's method
        % Find the Hessian 
        H = h1(xnwtn(1),xnwtn(2));
        
        % Find the gradient
        grad1= g1(xnwtn(1),xnwtn(2));
        
        % Newton's iteration:
        xnwtn = xnwtn - (H\grad1);
        
        %% Steepest Descent iteration
        % Find step size, alpha, that minimize f( xsd - alpha*grad)
        [grad2, alpha]= stepsize(xsd(1),xsd(2));
        
        % Steepest Descent iteration
        xsd = xsd - alpha*grad2;
        
        %% Graphics
        set(lnwtn,'XData', [get(lnwtn,'XData') xnwtn(1)]...
             ,'YData', [get(lnwtn,'YData') xnwtn(2)] );
        set(lsd,'XData', [get(lsd,'XData') xsd(1)]...
             ,'YData', [get(lsd,'YData') xsd(2)] );       
        drawnow
        
        %% Prints error
        err1 = norm(xnwtn - xtrue)/norm(xtrue);
        err2 = norm(xsd - xtrue)/norm(xtrue);
        fprintf('%7.4e\t\t%7.4e\n',err1,err2);
        
        %pause;
        if ~ishghandle(h) break; end
    end     

end

%----------------------------------------------------------

% Original function  f 

function c= f1(x,y)
    c = (x-2).^4 + ((x-2).^2).*(y.^2) + (y+1).^2;
end

% the gradient of f
function y= g1(x,y)
    y = [4*(x-2)^3 + 2*(y^2)*(x-2);
         2*y*(x-2)^2 + 2*(y+1)];
end

% the Hessian of f
function H= h1(x,y)
%% computes the Hessian of f
    H = [12*((x-2)^2)+2*y^2     4*y*(x-2);
         4*y*(x-2)              2*(x-2)^2+2];
end

% one-variable optimization in SD method, 
% computes the gradient and optimal step size

function [g,alpha] =stepsize(x,y)
    
    % computes gradient
    g = [4*(x - 2)^3 + y^2*(2*x - 4);
         2*y + 2*y*(x - 2)^2 + 2];
    g = g/ norm(g); 
    g1=g(1); g2=g(2);
    
    % Fm = f( zk - alpha*gradient-at-zk)
    Fm = @(al) (y - al*g2 + 1)^2 + ...
        (y - al*g2)^2*(al*g1 - x + 2)^2 +...
        (al*g1 - x + 2)^4;
    % Find the alpha minimizes Fm = f( zk - alpha*gradient-at-zk)
    [alpha,~,flag] = fminbnd(Fm, -5, 5, struct('TolX',1e-12));
    % set limits that estimate the length | x0 - x*|
    % ,gradient is normalized
    
    if (flag~=1)
        warning('SD::fminbnd minimization failed to converge!');
    end
    
end

