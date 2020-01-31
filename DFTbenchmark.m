%
% Script File: DFT Benchmark 
% Compare Direct DFT and Recursive Recurisve DFT (the simplest FFT)
%

  clear; 
  disp('      n      DFTDirect  DFTRecur   MATLB FFT')
  disp('  ------------------------------------------')
  for  k = 1:14;
     n =  2^k;
     x = rand(n,1); 
     tic; yd = DFTDirect(x);  t1 = toc;
     tic; yf = DFTRecur(x);   t2 = toc;
     tic; ym = fft(x);        t3 = toc;
     disp(sprintf('%10.0f %10.6f %10.6f %10.6f',n,t1,t2,t3))
  end
