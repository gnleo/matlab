% Programa para variacao de sinal

% Equacao  x^3 - 2*x^2 + 2*x - 5 = 0
% INTERVALOS
% Mostra os intervalos onde existe pelo menos uma raiz

clear
x = 0:0.1:4;
y =  x.^3 - 2*x.^2 + 2*x - 5;
S = sign(y);
figure
plot(x,y)
grid
figure
plot(x,S)
grid

% Equacao  sen(x^2)=0
% INTERVALOS
% Mostra os intervalos onde existe pelo menos uma raiz

clear
x = 0:pi/50:2*pi;
y =  sin(x.^2);
S = sign(y);
figure
plot(x,y)
grid
figure
plot(x,S)
grid