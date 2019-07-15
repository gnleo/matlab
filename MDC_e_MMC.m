% MDC e MMC de dois numeros
clear
% Valores iniciais
A = 420; B = 66;
x = A; y = B; % Armazena para calculo de MMC
% algotritmo
while B ~= 0
    C = rem(A,B); % rem(x,y) - RETORNA O RESTO DE x/y
    A = B;
    B = C;
end
MDC = A; % Resposta MDC
MMC = (x*y)/MDC; % Resposa MMC
