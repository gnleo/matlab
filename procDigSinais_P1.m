function [H] = MS5P1(B, A, Omega)

% MS5P1.m: Matlab Secao 5, Programa1 - LIVRO LATHI
% Arquivo de funcao que calcula a resposta em frequencia para sistemas LDIT
% Entradas:     B = vetor de coeficientes de realimentacao
%               A = vetor de coeficientes de malha direta
%               Omega = vetor de frequencias [rad], tipicamente -pi <= Omega <= pi
% Saidas:       H = resposta em frequencia

N_1 = length(B)-1; 
N_2 = length(A)-1;
% # H = polyval(p,x); retorna o valor de um polinonimio de grau 'n' avaliado em x
H = polyval(B, exp(1i*Omega))./polyval(A, exp(1i*Omega)).*exp(1i*Omega*(N_2 - N_1));
