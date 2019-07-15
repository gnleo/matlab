function [p,z] = MS5P2(B,A)

% MS5P2.m: Matlab Secao 5, Programa2 - LIVRO LATHI
% Arquivo.m de funcao que calcula e traça os polos e zeros de um sistema LDIT
% Entradas:     B = vetor de coeficientes de realimentacao
%               A = vetor de coeficientes de malha direta

N_1 = length(B)-1;
N_2 = length(A)-1;
p = roots([A, zeros(1, N_1 - N_2)]);
z = roots([B, zeros(1, N_2 - N_1)]); 
% # linspace(x,y,n); cria um vetor com primeiro nº x, o ultimo y com 'n' elemento
ucirc = exp(1i*linspace(0, 2*pi,200)); % calcula o circulo unitario para o grafico de polos - zeros
plot(real(p), imag(p), 'xk', real(z), 'ok', real(ucirc), imag(ucirc), 'k:');
xlabel('Real'); ylabel('Imaginary');
ax = axis; 
dx = 0.05*(ax(2) - ax(1));
dy = 0.05*(ax(4) - ax(3));
axis(ax + [-dx, dx, -dy, dy]);
