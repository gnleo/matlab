% Multiplicacao de matrizes

clear
N1 = 1; % numero de linhas da primeira matriz
N2 = 3; % numero de colunas da segunda matriz

% MATRIZES
%A1 = [10 12; 20 21];
%A2 = [5 4; 2 16];

A1 = [30 20 50];
A2 = [0.8 0.1 0.1; 0.1 0.7 0.2; 0.0 0.1 0.9];

M = zeros(N1,N2); % inicializacao matriz resultado

for I = 1 : N1
    for J = 1 : N2
        for K = 1 : N2
            %[I J K] Aqui temos a execucao passo a passo
            M(I,J) = M(I,J) + A1(I,K)*A2(K,J);
        end
    end
end
M