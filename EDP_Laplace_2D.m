% Solucao da EDP de Laplace 2D
% Uxx(x,y) + Uyy(x,y) = 0
% U(x,0) = U(x,60) = U(80,y) = 0 e U(0,y) = 100

clear
dx = 10;
dy = 10;
x = 0 : dx : 80;
y = 0 : dy : 60;
L = length(x);
C = length(y);
U = zeros(L,C);     % U(x,0) = U(x,60) = U(80,y) = 0
U(1,:) = 100;   % U(0,y) = 100
N = 20; % numero de iteracoes
for k = 1: N
    for I = 2 : L-1
        for J = 2 : C-1
            U(I,J) = (U(I+1,J) + U(I-1,J) + U(I,J+1) + U(I,J-1)) / 4;
        end
    end
end
figure
surf(U)