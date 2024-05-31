function p = interpolacion
    pkg load symbolic
    syms x L;

    l = input("Ingresara \n 1.- Puntos\n 2.- Funcion\n Ingrese opcion: ");

    if l == 1
        n = input("Cuantos puntos ingresara: ");
        lx = cell(1, n);  % Inicializa lx como una celda
        lfx = cell(1, n);  % Inicializa lfx como una celda
        for i = 1:n
            a = input(sprintf("Ingrese el x%d: ", i));
            b = input(sprintf("Ingrese el f(x%d): ", i),'s');
            if a == 0
                lx{i} = a;
            else
                lx{i} = a;
            endif
            if b == 0
                lfx{i} = b;
            else
                lfx{i} = b;
            endif
        endfor

    elseif l == 2
        n = input("Cuantos puntos ingresara: ");
        lx = zeros(1, n);
        for i = 1:n
            lx(i) = input(sprintf("Ingrese el x%d: ", i));
        endfor
        lfx = puntos(lx);
    else
        disp("Opcion incorrecta");
        p = interpolacion();
        return;
    endif

    p = 0;

    for i = 1:n
        L = 1;
        for j = 1:n
            if i != j
                L = L * (x - lx{j}) / (lx{i} - lx{j});
            endif
        endfor
        p = p + L * lfx{i};
    endfor

    disp('El polinomio de interpolación es:');
    disp(p);
endfunction

function lfx = puntos(lx)
    syms x;
    lfx = zeros(1, length(lx));
    f = input('Ingrese la función f(x): ','s');

    for i = 1:length(lx)
        lfx(i) = eval(subs(sym(f), x, lx(i)));
    endfor
endfunction

