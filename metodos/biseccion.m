function biseccion(error_esp)
  fprintf('\n');
  f=input('Ingrese la funci�un f(x):','s');
  a=input('ingrese extremo izquierdo:');
  b=input('ingrese extremo derecho:');
  ezplot(f,[a,b]);
  grid on;
  fprintf('\n');
  fprintf('iteraci�un\ta\tb\txn\terror \n');
  e=abs(b-a)/2;
  r=-1;
  i=1;
  while  e >= error_esp
    va= r;
    r=(a+b)/2;
    x=a;  fa=eval(f);
    x=b;  fb=eval(f);
    x=r;  fr=eval(f);
    fprintf('%3.0f\t%5.9f\t%5.9f\t%5.9f ',i,a,b,r) ;
    if sign(fa)*sign(fr)<=0
      b=r; e=abs(r-va); fprintf('%5.9f\n',e);
    else
      a=r;  e=abs(r-va);fprintf('%5.9f\n',e);
    endif
    i=i+1;
  endwhile
  fprintf('\n');
  fprintf('La aproximaci�un buscada es: %5.9f\n',r);
endfunction


