% g(x) Variavel Aleatoria Gaussiana mi = 0 e sigma = 1

clear
x = -5 : 0.1 : 5;
gx = (1/sqrt(2*pi))*exp(-x.^2/2);
plot(x, gx)