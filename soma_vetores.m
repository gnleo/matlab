% Soma vetor com n e n^2

clear;
% Definacao de vetores
A=zeros(1,10);
B=zeros(1,10);
C=zeros(1,10);

for n=1:10
    A(n) = n;
    B(n) = n^2;
    C(n) = A(n) + B(n);
end
A, B, C