function bin_int = binary_int(n)
  signo = 0;
    if n<0
      n= n*-1;
      signo= 1;
  endif

  p = floor(log(n)/log(2))
  y = n;
  b = [];
  for i=0:p-1
    x=floor(y/2);
    b(p-i)=y-2*x;
    y=x;
  endfor
    bin_int=[ [1] b];
 endfunction
