% MDC - Algoritmo de Euclides
clear
% Valores iniciais
A = 420; B = 66;

% algotritmo
while B ~= 0
    C = rem(A,B); % rem(x,y) - RETORNA O RESTO DE x/y
    A = B;
    B = C;
end
A; % Resposta do algoritmo MDC