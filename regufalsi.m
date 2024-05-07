function regufalsi
  fprintf('\n');
  f=input('Ingrese la función f(x):','s');
  a=input('ingrese extremo izquierdo:');
  b=input('ingrese extremo derecho:');
  ezplot(f,[a,b]);
  grid on;
  fprintf('\n');
  fprintf('iteración      a                      b              xn              error \n');
  e=abs(b-a)/2;
  r=-1;
  i=1;
  while  e >= 0.0001
    x=a;  fa=eval(f);
    x=b;  fb=eval(f);
    va= r;
    r=(a*fb-b*fa)/(fb-fa);

    x=r;  fr=eval(f);
    fprintf('%3.0f       %5.9f              %5.9f             %5.9f ',i,a,b,r) ;
    if sign(fa)*sign(fr)<=0
      b=r; e=abs(r-va); fprintf('%5.9f\n',e);
    else
      a=r;  e=abs(r-va);
    fprintf('%5.9f\n',e);
    endif
    i=i+1;
  endwhile
  fprintf('\n');
  fprintf('La aproximación buscada es: %5.9f\n',r);
endfunction

