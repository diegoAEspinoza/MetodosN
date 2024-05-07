inter = true;

while inter
    g_str = input('Ingrese la función g(x): ', 's');
    g=str2func(['@(x)' g_str]);
    
    rangoMin = input('Ingrese el inicio del rango: ');
    rangoMax = input('Ingrese el final del rango: ');
    
    figure;
    ezplot(g, [rangoMin, rangoMax]);
    title('Gráfico de la función g(x)');
    grid on;
    opcion = input('¿Desea continuar (c), ingresar otra función (f) o finalizar (s)? ', 's');
    
    switch lower(opcion)
        case 'c'
            syms x;
            f_sym = sym(g(x)); % Convierte la cadena a una expresión simbólica
            g_prima = diff(f_sym); % Convierte la expresión simbólica en una función
            
            figure;
            ezplot(abs(g_prima), [rangoMin, rangoMax]);
            title('Gráfico de la derivada de la función g(x)');
            grid on;
            opcion = input('¿Desea ingresar otra función (f) o finalizar (s)? ', 's');
            switch lower(opcion)
                case 'f'
                    continue;
                case 's'
                    continuar = false;
            disp('Programa finalizado.');
            break;
                otherwise
                disp('Opción no válida. Por favor, ingrese c, f o s.');    
            end
        case 'f'
            continue;

        case 's'
            continuar = false;
            disp('Programa finalizado.');
            break;
            
        otherwise
            disp('Opción no válida. Por favor, ingrese c, f o s.');    
            
    end
end
