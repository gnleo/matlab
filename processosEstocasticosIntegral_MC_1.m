% Metodo de Monte Carlo
% Integral de x^3 dx em [0 1]
clear
n = 10; % numero de amostras
u = rand(1,n);
g = u.^3;   % funcao a ser integrada
I = mean(g)