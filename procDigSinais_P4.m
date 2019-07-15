function [Bd, Ad] = MS5P4(B, A, T)

% MS5P4.m: Matlab Secao 5, Programa4 - LIVRO LATHI
% Arquivo.m de função para transformacao bilinear de um filtro em tempo
% continuo descrito por 'B' e 'A' em um filtro de tempo discreto.
% O tamanho de 'B' nao pode exceder 'A'.
% Entradas:     B = vetor de coeficientes de realimentacao
%               A = vetor de coeficientes de malha direta
%               T = intervalo de amostragem
% Saidas:       Bd = vetor dos coeficientes de realimentacao do filtro em tempo discreto
%               Ad = vetor dos coeficientes de malha direta do filtro em tempo discreto

if(length(B) > length(A))
    disp('Ordem do numerador não pode exceder a ordem do denominador');
    return;
end
z = roots(B); p = roots(A); % raizes no dominio 's'
gain = real(B(1) / A(1) * prod(2/T-z)/prod(2/T-p));
zd = (1+z*T/2);
pd = (1+p*T/2)./(1-p*T/2); % raizes no dominio 'z'
Bd = gain*poly([zd, - ones(length(A) - length(B), 1)]);
% # poly(x);  retorna os coeficientes do polinomio cujas raizes sao os elementos de r.
Ad = poly(pd);
