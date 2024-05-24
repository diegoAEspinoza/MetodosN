% Primero cargar el paquete symbolic
% pkg load symbolic
%Newton-RApshon
function  n_r()
  f = input('Ingrese la función f(x):','s');
  a = input('Ingrese extremo izquierdo:');
  b = input('Ingrese extremo derecho:');
  err = input ('Ingrese la tolerancia: ')
  df = diff(sym(f));

  lx(1) = (a + b) / 2;

  aprox = 0;

  i = 1;
  fprintf('Iter \t x_n \t\t err\n');
  fprintf('%d \t %.9f \t %.9e\n', i-1, lx(i), aprox);
  while true
    x = lx(i);
    fx = eval(f);
    dfx = eval(df);
    lx(i + 1) = lx(i) - (fx / dfx);
    aprox = abs(lx(i + 1) - lx(i));
    fprintf('%d \t %.9f \t %.9e\n', i, lx(i + 1), aprox);
     if aprox < err
            break;
        end
    i = i + 1;
  endwhile

  fprintf('La aproximación buscada es: %.9f\n',lx(end);
endfunction

