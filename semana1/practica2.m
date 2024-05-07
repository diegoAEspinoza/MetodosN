function practica2(n,d)
  list_integral = [];
  list_redondeo = [];
  list_truncado = [];
  for i = 1:n
    list_integral(end+1) = integral(i);
    list_redondeo(end+1) = redondeo(i, d);
    list_truncado(end+1) = truncado(i, d);
  end

  listas = [list_integral' list_truncado' list_redondeo']
  error1 = list_integral - list_truncado;
  error2 = list_integral - list_redondeo;
  lista_errores = [error1' error2']

  end

function term = integral(n)
  if n == 1
    term = sin(1) - cos(1);
  elseif n == 2
    term = 2*sin(1) + cos(1) - 2;
  else
    term = -cos(1) + n*sin(1) - n*(n-1)*integral(n-2);
  endif
end

function term = redondeo(n, m)
  if n == 1
    term = sin(1) - cos(1);
  elseif n == 2
    term = 2*sin(1) + cos(1) - 2;
  else
    term = -cos(1) + n*sin(1) - n*(n-1)*redondeo(n-2, m);
  endif
  factor = 10^m;
  truncated_term = round(term * factor) / factor;
  term = truncated_term;
end

function term = truncado(n, m)
  if n == 1
    term = sin(1) - cos(1);
  elseif n == 2
    term = 2*sin(1) + cos(1) - 2;
  else
    term = -cos(1) + n*sin(1) - n*(n-1)*truncado(n-2, m);
  endif
  factor = 10^m;
  truncated_term = floor(term * factor) / factor;
  term = truncated_term;
end

