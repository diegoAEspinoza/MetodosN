x=[0:0.01:5];
subplot(2,2,1)
plot(2*x+3);
title("HOla")
xlabel("Eje X")
ylabel("Eje Y")
legend("Curva 1")
grid()


subplot(2,2,2)
plot(x.^2+3*x)
title("COmo estas")
legend()
grid()

subplot(2,2,3)
plot(x.^2 - 4)

subplot(2,2,4)
hold on;
plot(x.^3+4)
plot(x.^2 - 4)
plot(x.^2+3*x)
plot(2*x+3)
legend()
grid()
