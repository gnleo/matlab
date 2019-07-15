% Verificacao do teorema do limite central
% distribuicao exponencial
clear
n = 16;  % numero de VA
a = 1000;
mu = 2;     % media
e = exprnd(mu,n,a);
S = sum(e);
M = mean(e);
muS = mean(S)
muM = mean(M)
sigmaS = var(S)
sigmaM = var(M)
V = var(e);
sigma_e = mean(V)
barras = 10;
[N eixo] = hist(M, barras);
figure
bar(eixo,N)
title(['Numero de VA: ', int2str(n)])