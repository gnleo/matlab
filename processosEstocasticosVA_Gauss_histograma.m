% Historiograma
% VA's Gaussianas x e y
clear
% VA x mu = 0; var = 1
x = randn(10000,1);
% VA y mu = 5; var = 1/2
aux = randn(10000,1);
y = 5 + (1/2)*aux;

% historiograma
barras = 40;
[Nx,eixoX] = hist(x, barras);
[Ny,eixoY] = hist(y, barras);

figure
bar(eixoX, Nx)
title('Historiograma de x')
figure
bar(eixoY, Ny)
title('Historiograma de y')