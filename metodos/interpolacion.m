function [lx, lfx, p] = interpolacion()
  pkg load symbolic
  syms x;

  n = input("Cuantos puntos ingresara: ");
  %f=input('Ingrese la función f(x):','s');

  lx = zeros(1, n);
  lfx = zeros(1, n);

  for i = 1:n
    lx(i) = input(sprintf("Ingrese el x%d: ", i));
    lfx(i)= input(sprintf("Ingrese el f(x%d): ",i),'s');
    %lfx(i) = eval(subs(sym(f), x, lx(i)));
  endfor

  p = 0;

  for i = 1:n
    L = 1;
    for j = 1:n
      if i != j
        L = L * (x - lx(j)) / (lx(i) - lx(j));
      endif
    endfor
    p = p + L * lfx(i);
  endfor

  disp('El polinomio de interpolación es:');
  disp(p);
endfunction
