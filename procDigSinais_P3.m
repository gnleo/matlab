function [Bd, Ad] = MS5P3(B, A, T)

% MS5P3.m: Matlab Secao 5, Programa3 - LIVRO LATHI
% Arquivo.m de funcao para a transformacao pela diferenca atrasada de
% primeira ordem de um filtro em tempo contínuo descrito por 'B' e 'A' em um
% filtro de tempo discreto
% Entradas:     B = vetor de coeficientes de realimentacao
%               A = vetor de coeficientes de malha direta
%               T = intervalo de amostragem
% Saidas:       Bd = vetor dos coeficientes de realimentacao do filtro em tempo discreto
%               Ad = vetor dos coeficientes de malha direta do filtro em tempo discreto

z = roots(B); p = roots(A); % raizes no dominio 's'
gain = B(1)/A(1)*prod(1/T-z)/prod(1/T-p);
zd = 1./(1-T*z); pd = 1./(1-T*p); % raizes no dominio 'z'
Bd = gain * poly(zd);
% # poly(x);  retorna os coeficientes do polinomio cujas raizes sao os elementos de r.
Ad = poly(pd);
