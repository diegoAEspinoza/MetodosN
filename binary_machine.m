function bin = binary_machine(n,count_dec)
  # Validacion de Signo
  signo = 0;
    if n<0
      n= n*-1;
      signo= 1;
  endif

  # Separacion
  n_int = floor(n)
  n_float = n-n_int

  if n_int != 0 && n_float != 0
    n_int_bin = binary_int(n_int);
    n_dec_bin = binary_float(n_float,count_dec);

  elseif n_int == 0
    n_int_bin = [0]
    n_dec_bin = binary_float(n_float,count_dec);

  else
    n_int_bin = binary_int(n_int);
    n_dec_bin = [0];
  endif

  bin = [[signo] [n_int_bin] [2] [n_dec_bin]];
endfunction

%Entero --> Binario
function bin_int = binary_int(n)
  p = floor(log(n)/log(2));
  y = n;
  b = [];
  for i=0:p-1
    x=floor(y/2);
    b(p-i)=y-2*x;
    y=x;
  endfor
    bin_int=[[1] b];
 endfunction

%Decimal --> Binario
function bin_dec = binary_float(n,count_dec)
  r = floor(log(n)/log(2))*-1;
  y = n*(2^r)-1;
  b=[];
  for i=0:count_dec
    x=2*y;
    b(i+1)=floor(x);
    y=x-b(i+1);
  endfor
  nulos = zeros(r-1)
  bin_dec=[[nulos] [1] [b]];
endfunction
