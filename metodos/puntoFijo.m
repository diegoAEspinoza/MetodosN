function puntoFijo()
    syms x;
    continuar = true;
    graficar_f();
    while continuar
        [g i]= graficar_g();
        % Solicitar la derivada de g si se desea
        fprintf("SI: 1 -- NO: 0\n");
        rpt = input('?Desea continuar con la derivada de g? (1/0): ');
        if rpt == 1
            graficar_dg(g,i);
            fprintf("SI: 1 -- NO: 0\n");
            rpt = input('?Desea continuar con la aproximacion? (1/0): ');
            if rpt == 1
                err = input("Ingrese el error que quiere: ");
                fixedPoint(g,i,err);
            end
        end

        % Consultar si se quiere ingresar otra funci�un g
        fprintf("SI: 1 -- NO: 0\n");
        rpt = input('?Desea ingresar otra función g? (1/0): ');
        if rpt == 0
            % Consultar si se quiere ingresar otra funci�un f
            fprintf("SI: 1 -- NO: 0\n");
            rpt = input('?Desea ingresar otra función f? (1/0): ');
            if rpt == 0
                % Consultar si se quiere finalizar el programa
                fprintf("SI: 1 -- NO: 0\n");
                rpt = input('?Desea finalizar el programa? (1/0): ');
                if rpt == 1
                    continuar = false;
                else
                    main();
                end
            else
                main();
            end
        end
    end
end

function graficar_f()
    f = input('Ingrese la función f: ', 's');
    ezplot(f);
    title('Gr�hfica de f');
    xlabel('x');
    ylabel('f(x)');
    grid on;
end

function [g, i] = graficar_g()
    g_str = input('Ingrese la función g: ', 's');
    a = input('Ingrese el valor de a: ');
    b = input('Ingrese el valor de b: ');

    % Definir la funci�un an�unima correctamente
    g = sym(g_str);
    ezplot(g,[a,b])
    title('Gr�hfica de g en el intervalo [a, b]');
    xlabel('x');
    ylabel('g(x)');
    grid on;

    i = [a, b];
end

function graficar_dg(g,i)
    dg = abs(diff(g))
    ezplot(dg,i);
    title('Gr�hfica de la derivada de g en el intervalo [a, b]');
    xlabel('x');
    ylabel('g''(x)');
    grid on;
end

function aprx = fixedPoint(f, interval, err)
    a = interval(1);
    b = interval(2);
    aprx = (a + b) / 2;
    fprintf('n\tx_n\t\tx_n+1\t\t|x_n+1 - x_n|\n');
    i = 1;
    while true
        prev = aprx;
        x = prev; aprx = eval(f);
        diff = abs(aprx - prev);
        fprintf('%d\t%.9f\t%.9f\t%.9f\n', i, prev, aprx, diff);
        if diff < err
            break;
        end
        i = i + 1;
    end
end

