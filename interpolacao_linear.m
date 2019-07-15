% Interpolacao Linear
% dados os pontos P0 = (x0,y0) e P1 = (x1,y1)
% obter a equacao  da reta que passa por P0 e P1
% x = [x0; 1 x1], a = [a0; a1] e y = [y0; y1]
% dados os pontos P0 = (0.2, 1.18221) e P1 = (0.3, 2.4596)

clear
x = [1 0.2; 1 0.3];
y = [1.822; 2.4596];
a = x\y;        % a = [a0;a1]   a(1) = a0 e a(2) = a1

% Equacao da reta e P(0.25)
t = 0.2 : 0.005 : 0.3;
P = a(1) + a(2)*t;
xk = 0.25;
yk = a(1) + a(2)*xk;
figure
plot(t,P)
title('reta de interpolação');
[xk yk]



% Interpolacao Linear
% dados os pontos P0 = (x0,y0), P1 = (x1,y1) e P2 = (x2,y2)
% obter o polinomio de grau 2 que passa por P0, P1 e P2
% x = [1 x0 x0^2; 1 x1 x1^2; 1 x2 x2^2], a = [a0; a1; a2] e y = [y0; y1; y2]
% dados os pontos P0 = (0.2, 1.18221), P1 = (0.3, 2.4596) e P2 = (0.4, 3.3201)

clear
x = [1 0.2 0.2^2; 1 0.3 0.3^2; 1 0.4 0.4^2];
y = [1.8221; 2.4596; 3.3201];
a = x\y;        % a = [a0;a1]   a(1) = a0,  a(2) = a1 e a(3)= a2

% Equacao da parabola e P(0.25)
t = 0.2 : 0.005 : 0.4;
P = a(1) + a(2)*t + a(3)*t.^2;
xk = 0.25;
yk = a(1) + a(2)*xk + a(3)*xk^2;
figure
plot(t,P)
title('parábola de interpolação');
[xk yk]