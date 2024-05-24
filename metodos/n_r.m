%Newton-RApshon
function  n_r(err)
  f = input('Ingrese la función f(x):','s');
  a = input('Ingrese extremo izquierdo:');
  b = input('Ingrese extremo derecho:');
  df = diff(sym(f));
  lx(1) = (a + b) / 2;

  aprox = 0;

  i = 1;
  fprintf('Iter \t x_n \t\t err\n');
  fprintf('%d \t %.9f \t %.9e\n', i-1, lx(i), aprox);
  while aprox > err
    x = lx(i);
    fx = eval(f);
    dfx = eval(df);
    lx(i + 1) = lx(i) - (fx / dfx);
    aprox = abs(lx(i + 1) - lx(i));
    fprintf('%d \t %.9f \t %.9e\n', i, lx(i + 1), aprox);
    i = i + 1;
  endwhile

  fprintf('EL numero buscado es %d \n', lx(length(lx)));
endfunction

