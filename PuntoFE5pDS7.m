inter = true;

while inter
    g_str = input('Ingrese la funci�n g(x): ', 's');
    g=str2func(['@(x)' g_str]);
    
    rangoMin = input('Ingrese el inicio del rango: ');
    rangoMax = input('Ingrese el final del rango: ');
    
    figure;
    ezplot(g, [rangoMin, rangoMax]);
    title('Gr�fico de la funci�n g(x)');
    grid on;
    opcion = input('�Desea continuar (c), ingresar otra funci�n (f) o finalizar (s)? ', 's');
    
    switch lower(opcion)
        case 'c'
            syms x;
            f_sym = sym(g(x)); % Convierte la cadena a una expresi�n simb�lica
            g_prima = diff(f_sym); % Convierte la expresi�n simb�lica en una funci�n
            
            figure;
            ezplot(abs(g_prima), [rangoMin, rangoMax]);
            title('Gr�fico de la derivada de la funci�n g(x)');
            grid on;
            opcion = input('�Desea ingresar otra funci�n (f) o finalizar (s)? ', 's');
            switch lower(opcion)
                case 'f'
                    continue;
                case 's'
                    continuar = false;
            disp('Programa finalizado.');
            break;
                otherwise
                disp('Opci�n no v�lida. Por favor, ingrese c, f o s.');    
            end
        case 'f'
            continue;

        case 's'
            continuar = false;
            disp('Programa finalizado.');
            break;
            
        otherwise
            disp('Opci�n no v�lida. Por favor, ingrese c, f o s.');    
            
    end
end
