function t = secante()
  f_s = input('Ingrese la función f(x):','s'); #x^3+4*x^2-10
  a = input('Ingrese extremo izquierdo:'); #1
  b = input('Ingrese extremo derecho:'); #2
  err = input('Ingrese la tolerancia: '); # 0.000001

  aprox = 0;
  f = sym(f_s);  df = diff(f);

  x0 = (a + b) / 2;
  x = x0;  f0 = eval(f);  df0 = eval(df);
  fprintf('n \t x_n \t f_n \t err\n');
  fprintf('%d \t %.9f \t %.9f \t %.9f\n', 0, x0, f0, aprox);


  x1 = x0 - (f0 / df0);
  x = x1;  f1 = eval(f);
  aprox = abs(f1 - f0);
  fprintf('%d \t %.9f \t %.9f \t %.9f\n', 1, x1, f1, aprox);

  lx  = [x0, x1];
  fx  = [f0, f1];

  i = 3;
  while true

    lx(i)  = ( lx(i-2)*fx(i - 1) - lx(i - 1) * fx(i-2)) / (fx(i - 1) - fx(i-2));

    x = lx(i);    fx(i) = eval(f);


    aprox = abs(fx(i)-fx(i-1));
    fprintf('%d \t %.9f \t %.9f \t %.9f\n', i, lx(i), fx(i), aprox);

    if aprox < err
            break;
    endif

    i += 1;
  endwhile

  fprintf('La aproximación buscada es: %.9f\n',lx(end));
endfunction

