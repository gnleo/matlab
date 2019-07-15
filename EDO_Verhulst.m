% Modelo populacional de Verhulst
% solução numerica de dP/dt = KP(1 - P/L) em [0 5]
% diferenca centrada

clear
a = 0;          % valor inicial do intervalo
b = 5;          % valor final do intervalo
N = 100;        % numero de subintervalos

dt = (b-a)/N;
t = a : dt : b;     % tamanho N+1
T = length(t);
P0 = 0.1;       % populacao inicial de 10%
L = 1.0;        % liminte imposto pelo ambiente
K = 1.0;        % constante da equacao

PA = (L*P0)*(P0 + (L-P0)*exp(-K*t)).^(-1);      % solucao analitica
PN(1:N) = 0.0;      % vetor da solucao numerica
PN(1) = PA(1);      % valores iniciais do PVI
PN(2) = PA(2);
A = 2*dt*K;
B = A/L;

for n = 2 : N
    PN(n+1) = PN(n-1) + A*PN(n) - B*PN(n)^2;
end
EV = PA - PN;       % erro
figure
plot(t, PA, 'r')
title('Solução Analítica (red) e Numérica de Verhulst')
hold
plot(t, PN)
figure
plot(t, EV)
title('Erro entre as soluções analítica e numérica')