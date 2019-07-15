% Geracao de amostras aleatorias
% calculo de mi e sigma
clear
W2 = rand(100,1);
W3 = rand(1000,1);
W4 = rand(10000,1);

S2 = 0;
E2 = 0;
for a=1 : 100
    S2 = S2 + W2(a);
    E2 = E2 + W2(a)^2;
end
mi2 = S2/100;
sigma2 = E2/100 - mi2^2;

S3 = 0;
E3 = 0;
for b=1 : 1000
    S3 = S3 + W3(b);
    E3 = E3 + W3(b)^2;
end
mi3 = S3/1000;
sigma3 = E3/1000 - mi3^2;

S4 = 0;
E4 = 0;
for c=1 : 10000
    S4 = S4 + W4(c);
    E4 = E4 + W4(c)^2;
end
mi4 = S4/10000;
sigma4 = E4/10000 - mi4^2;

% OUTRO ALGORITMO usando mean e std

clear
W_2 = rand(100,1);
W_3 = rand(1000,1);
W_4 = rand(10000,1);

mi_2 = mean(W_2);
mi_3 = mean(W_3);
mi_4 = mean(W_4);

sigma_2 = std(W_2)^2;
sigma_3 = std(W_3)^2;
sigma_4 = std(W_4)^2;