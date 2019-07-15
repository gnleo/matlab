% segunda derivada por diferencas finitas
% da funcao y = exp(-x^2) em [0 1]

clear
a = 0;  % valor incial
b =1;    % valor final
n = 10;  % numero de subintervalos

dx = (b-a)/n;
% cria vetor x e y
x = a : dx : b;
y = exp(-x.^2);
% Segunda Derivada de y
D2y = zeros(1,n-1);
h = dx^2;
for t = 2 : n
    D2y(t-1) = ( y(t+1) - 2*y(t) + y(t-1) ) / h; % segunda derivada de y
end
y2 = 2*(2*x.^2 - 1).*exp(-x.^2);
Ed2 = y2(2:n) - D2y; % erro
figure
plot(x,y2)
title('Segunda Derivada');
hold
plot(x(2:n),D2y,'r')
figure
plot(x(2:n),Ed2)
title('Erro da segunda derivada');