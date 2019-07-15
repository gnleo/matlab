% Gera numeros primos - Versao 1

clear
N = 10;
P = zeros(1,N);
P(1) = 2;
P(2) = 3;

n = 2; % posicao preenchida
k = 5; % proximo impar

while n<N
    B = 0; % contador
    for i = 2:n
        if rem(k,P(i)) ~= 0
            B = B+1;
        end
    end
    if B == n-1
        n = n+1;
        P(n) = k;
    end
    k = k+2;
end