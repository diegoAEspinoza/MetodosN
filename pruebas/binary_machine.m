function bin = binary_machine(n, count_dec)
    % Especificaciones de la máquina
    n_exp_bits = 6; % Número de bits para el exponente
    n_mantisa_bits = 12; % Número de bits para la mantisa

    % Validación del signo
    signo = 0;
    if n < 0
        n = abs(n);
        signo = 1;
    end

    % Separación
    n_int = floor(n);
    n_float = n - n_int;

    % Conversión de la parte entera
    if n_int ~= 0
        n_int_bin = binary_int(n_int);
    else
        n_int_bin = 0;
    end

    % Conversión de la parte decimal
    if n_float ~= 0
        [~, n_dec_bin] = binary_float(n_float, count_dec);
    else
        n_dec_bin = zeros(1, count_dec);
    end

    % Combinar parte entera y parte decimal (Mantisa)
    mantisa = [n_int_bin, n_dec_bin];

    % Limitar el tamaño de la mantisa si excede n_mantisa_bits
    if length(mantisa) > n_mantisa_bits
        mantisa = mantisa(1:n_mantisa_bits);
    end

    % Calcular el exponente
    if n_int ~= 0
        exp_bin = bin_int(length(n_int_bin) - 1);
    else
        exp_bin = zeros(1, length(n_dec_bin));
    end

    % Limitar el tamaño del exponente si excede n_exp_bits
    if length(exp_bin) > n_exp_bits
        exp_bin = exp_bin(1:n_exp_bits);
    end

    % Construir el número binario final
    bin = [signo, exp_bin, mantisa];
end

% Entero --> Binario
function bin_int = binary_int(n)
    p = floor(log(n) / log(2));
    bin_int = zeros(1, p + 1);
    for i = p:-1:0
        bin_int(p - i + 1) = floor(n / 2^i);
        n = mod(n, 2^i);
    end
end

% Decimal --> Binario
function [bin_dec, exp] = binary_float(n, count_dec)
    r = floor(log(n) / log(2)) * -1;
    exp = bin_int(r - 1);
    bin_dec = zeros(1, count_dec);
    for i = 1:count_dec
        n = n * 2;
        bin_dec(i) = floor(n);
        n = n - bin_dec(i);
    end
end

% Conversión de número a binario
function bin = bin_int(n)
    bin = binary_int(n);
end

