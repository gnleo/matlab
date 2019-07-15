% Metodo de Monte Carlo
% Integral de (4x^2y + y^2) dxdy | x,y em [0 1]
clear
n = 1000; % numero de amostras
U = rand(2,n);  % gera uma matriz de 2 colunas e n linhas
x = U(1,:);     % preenche a primeira coluna da matriz 
y = U(2,:);     % preenche a segunda coluna da matriz 
g = 4*(x.^2).*y + y.^2; % funcao a ser integrada
I = mean(g)