% DERIVADA POR DIFERENÇAS FINITAS EM AVANCO

clear
a = 0;  % valor incial
b =1;    % valor final
n = 10;  % numero de subintervalos

dx = (b-a)/n;
% cria vetor x e y
x = a : dx : b;
y = exp(-x.^2);

Davy = zeros(1,n);
for t = 1 : n
    Davy(t) = ( y(t+1) - y(t) ) / dx; % derivada em avanco de y
end
y1 = -2*x.*exp(-x.^2);
Eav = y1(1:n) - Davy(1:n); % erro em avanco
figure
plot(x,y1)
title('Derivada em avanço');
hold
plot(x(1:n),Davy,'r')
figure
plot(x(1:n),Eav)
title('Erro da derivada em avanço');
