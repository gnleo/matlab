% Polinomio interpolador de Lagrange
% dados 6 pontos, obter um polinomio de grau 5

clear
x = [0 0.1 0.2 0.3 0.4 0.5];
y = [1 1.3499 1.8221 2.4596 3.3201 4.4817];
xk = 0.25;
s = 0; % incializacao soma
for i = 1 : 6
    p = 1; % incializacao produto
    for j = 1: 6
        if i ~= j
            a = (xk - x(j)) / (x(i) - x(j));
            p = p*a;
        end
    end
    s = s + y(i)*p; % resultado do polinomio de Lagrange
end
L = s;
L




% Polinomio interpolador de Lagrange
% dados 6 pontos, obter um polinomio de grau 5
% plotando o grafico

clear
x = [0 0.1 0.2 0.3 0.4 0.5];
y = [1 1.3499 1.8221 2.4596 3.3201 4.4817];

t = 0 : 0.005 : 0.5;

L(1:length(t)) = 0; % inicializa um vetor de armazenamento 'null' ; 'length()' retorna o tamanho do vetor

for n = 1 : 101 % executa para cada componente do vetor t
    
    s = 0; % incializacao soma
    for i = 1 : 6
        p = 1; % incializacao produto
        for j = 1: 6
            if i ~= j
                a = (t(n) - x(j)) / (x(i) - x(j));
                p = p*a;
            end
        end
        s = s + y(i)*p; % resultado do polinomio de Lagrange
    end
    L(n) = s;
end
figure
plot(t,L)
title('Polinômino Interpolador de Lagrange');