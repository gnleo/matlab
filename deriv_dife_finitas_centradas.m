% derivada por diferenças finitas centradas

clear
a = 0;  % valor incial
b =1;    % valor final
n = 10;  % numero de subintervalos

dx = (b-a)/n;
% cria vetor x e y
x = a : dx : b;
y = exp(-x.^2);

DFCy = zeros(1,n-1);
for t = 2 : n
    DFCy(t-1) = ( y(t+1) - y(t-1) ) / (2*dx); % derivada centrada de y
end
y1 = -2*x.*exp(-x.^2);
Ec = y1(2:n) - DFCy; % erro centrado
figure
plot(x,y1)
title('Derivada centrada');
hold
plot(x(2:n),DFCy,'r')
figure
plot(x(2:n),Ec)
title('Erro da derivada centrada');