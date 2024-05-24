%Newton-RApshon
function n_r(err)
  f = input('Ingrese la función f(x):','s');
  a = input('ingrese extremo izquierdo:');
  b = input('ingrese extremo derecho:');
  df = diff(sym(f));
  lx(1) = (a+b)/2;
  i=1;
  while aprox <err;
    x = i; fx = eval(f); dfx = eval(df);
    lx(i+1) = lx(i)- (fx/dfx);
    aprox = lx(i+1)-lx(i);
  endwhile

