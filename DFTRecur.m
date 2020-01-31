  function y = DFTRecur(x)
%
% y = DFTRecur(x)
% y is the discrete Fourier transform of a column n-vector x 
% where n must be a power of two. 
%
% This is the simplest version of FFT 
%
  n = length(x);
  if n ==1
     y = x;
  else
     m = n/2;
     yT = DFTRecur(x(1:2:n));
     yB = DFTRecur(x(2:2:n));
     d = exp(-2*pi*sqrt(-1)/n).^(0:m-1)';
     z = d.*yB;
     y = [ yT+z ; yT-z ];
  end
