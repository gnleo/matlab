% Calculo da menor raiz positiva de sen(x^2) = 0 em [1 2]
% Metodo de Newton- Raphson para raizes reais

clear
x = 2.0; % ponto de partida do intervalo
A = x;
B = x + 0.1;
delta = 0.0001;
k = 0; % numero de iteracoes
tic
while abs(B-A) > delta
    f = sin(x^2); % f(xn)
    Df = 2*x*cos(x^2); % f'(xn)
    A = x;
    x = x - (f/Df); % x(n+1) = f(xn)/f'(xn)
    B = x;
    k = k +1;
end
toc
[delta k x]