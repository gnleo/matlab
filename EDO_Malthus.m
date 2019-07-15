% Modelo populacional de Malthus
% solucao numerica de dP/dt = KP em [0 5]
% diferenca centrada

clear
a = 0;          % valor inicial do intervalo
b = 5;          % valor final do intervalo
N = 100;        % numero de subintervalos

dt = (b-a)/N;
t = a : dt : b;
T = length(t);
PN(1:T) = 0.0;  % vetor da solucao numerica
P0 = 0.1;       % populacao inicial de 10%
K = 1.0;        % constante da equacao

PA = P0*exp(K*t);      % solucao analitica
PN(1) = PA(1);      % valores iniciais do PVI
PN(2) = PA(2);
A = 2*dt*K;

for n = 2 : N
    PN(n+1) = PN(n-1) + A*PN(n);
end
EV = PA - PN;       % erro
figure; plot(t, PA, 'r')
title('Solução Analítica (red) e Numérica de Malthus')
hold; plot(t, PN)
figure; plot(t, EV)
title('Erro entre as soluções analítica e numérica')