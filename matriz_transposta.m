% Matriz transposta

clear
% L - numero de linhas
% C - numero de colunas

A = [1 3 0; 2 4 -2];
[L C] = size(A);
B = ones(C,L);
for I = 1:L
    for J = 1:C
        B(J,I) = A(I, J);
    end
end
A; B; % Para nao impressao da matriz quanto inciar em linha, sempre utilizar ';' a cada instrucao