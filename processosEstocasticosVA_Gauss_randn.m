% Gaussiana usando randn
clear
% VA x mu = 0; var = 1
x = randn(10000,1);
% VA y mu = 5; var = 1/2
aux = randn(10000,1);
y = 5 + (1/2)*aux;
figure
plot(x(1:100));
title('Variavel aleatoria - x | méd = 0; var = 1');
figure
plot(y(1:100));
title('Variavel aleatoria - y | méd = 5; var = 1/2');