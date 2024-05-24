function t = secante()
  f_s = input('Ingrese la función f(x):','s');
  a = input('Ingrese extremo izquierdo:');
  b = input('Ingrese extremo derecho:');
  tol = input('Ingrese la tolerancia: ');

  aprox = inf; % Inicializar aprox con un valor grande para que entre en el bucle
  f = sym(f_s);
  df = diff(f);

  x0 = (a + b) / 2;
  x = x0;
  f0 = eval(f);
  df0 = eval(df);

  x1 = x0 - (f0 / df0);
  x = x1;
  f1 = eval(f);

  lx  = [x0, x1];
  fx  = [f0, f1];
  err = [0, abs(x0 - x1)];
  i = 1;
  fprintf('n \t x_n \t f_n \t err\n');
  while abs(aprox) > tol % Corregido el criterio de convergencia
    lx(i + 2)  = (lx(i) * fx(i + 1) - lx(i + 1) * fx(i)) / (fx(i + 1) - fx(i));

    x = lx(i + 2);
    fx(i + 2) = eval(f);

    aprox = lx(i + 2) - lx(i + 1); % Calcula la aproximación actual
    err(i + 2) = abs(aprox); % Guarda el valor absoluto de la aproximación actual
    fprintf('%d \t %.6f \t %.6f \t %.6f\n', i, lx(i + 2), fx(i + 2), err(i + 2));
    i += 1;
  endwhile
  t = [[0:(length(lx) - 1)]' lx' fx' err'];
endfunction

