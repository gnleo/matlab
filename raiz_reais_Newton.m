% Calculo das raizes da funcao x^3 - 2*x^2 + 2*x - 5
% Metodo de Newton-Raphson para raizes reais

clear
x = 2.5; % ponto de partida do intervalo
A = x;
B = x + 0.1;
delta = 0.01;
k = 0; % numero de iteracoes

while abs(B-A) > delta % abs é a funcao valor absoluto 
    f = x^3 - 2*x^2 + 2*x - 5; % f(xn)
    Df = 3*x^2 - 4*x +2;       % f'(xn)
    A = x;
    x = x - (f/Df);             % x(n+1) = f(xn)/f'(xn)
    B = x;
    k = k +1;
    [k delta abs(B-A) A B]
end