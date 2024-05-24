function bin_dec = binary_float(n,count_dec)
  r = floor(log(n)/log(2))*-1;
  y = n*(2^r)-1;
  b=[];
  for i=0:count_dec
    x=2*y;
    b(i+1)=floor(x);
    y=x-b(i+1);
  endfor
  z = zeros(1,r-1);
  printf("0,")
  bin_dec=[[z] [1] [b]];
endfunction
