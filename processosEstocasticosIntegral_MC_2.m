% Metodo de Monte Carlo
% Integral de (x^2 + x) dx em [1 3]
clear
n = 10000; % numero de amostras
u = rand(1,n);
x = 1 + 2*u;
g = x.^2 + x;   % funcao a ser integrada
I = 2*mean(g)