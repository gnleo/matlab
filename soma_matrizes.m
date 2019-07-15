% Soma de matrizes

clear

A = [1 3; 5 7];
B = [2 4; 6 8];

[l c] = size(A);

C = zeros(l,c);

for linha = 1:l
    for coluna = 1:c
        C(linha, coluna) = A(linha, coluna) + B(linha, coluna);
    end
end
C
