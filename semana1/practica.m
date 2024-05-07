function practica(n)
  tay = taylor(n);
  trun = truncado(n, 5);
  redo = redondeo(n, 5);
  error1 = tay - trun;
  error2 = tay - redo;
  lista = [tay' trun' redo' ]
  lista_errores = [error1' error2']
end

function r = taylor(n)
  r = [];
  for i = 0:n
    term = power(pi/2, i) / prod(1:i);
    r(i+1) = term;
  end
end

function r = truncado(n, m)
  r = [];
  for i = 0:n
    term = power(pi/2, i) / prod(1:i);
    % Introducir error por truncamiento
    factor = 10^m; % nˆymero de decimales que deseas mantener (m en este caso)
    truncated_term = floor(term * factor) / factor;
    r(i+1) = truncated_term;
  end
end

function r = redondeo(n, m)
  r = [];
  for i = 0:n
    term = power(pi/2, i) / prod(1:i);
    % Introducir error por redondeo
    factor = 10^m; % nˆymero de decimales que deseas mantener (m en este caso)
    rounded_term = round(term * factor) / factor;
    r(i+1) = rounded_term;
  end
end


