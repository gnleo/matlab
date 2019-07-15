% Multiplicacao de vetores

clear
% Definacao de vetores
A = zeros(1,10);
B = zeros(1,10);
M = 0;

for n = 1:10
    A(n) = n;
    B(n) = n^2;
    M = M + A(n) * B(n);
end
A, B, M