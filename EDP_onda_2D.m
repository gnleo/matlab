% Solucao da EDP da onda 2D
% Utt(y,x,t) = a2.(Uyy(y,x,t) + Uyy(y,x,t)
% U(y,x,0) = 0 e U(5,10,0) = 100    dt < sqrt(2)*(dx/a) = 1.4142
clear
a = 0.5;
dx = 0.5;
dy = 0.5;
dt = 0.5;
x = 0 : dx : 20;
y = 0 : dy : 10;
L = length(y);
C = length(x);
U = zeros(L,C,3);     % U(y,x,0) = 0
U(10,20,2) = 0.3090;   % FONTE
N = 160; % numero de iteracoes
A = ((a^2)*(dt^2)/(dx^2));
B = 2*(1-2*A);
for K = 1: N
    for I = 2 : L-1
        for J = 2 : C-1
            U(I,J,3) = A*(U(I,J+1,2) + U(I,J-1,2) + U(I+1,J,2) + U(I-1,J,2)) + ...
                + B*U(I,J,2) - U(I,J,1);
        end
    end
    U(10,20,2) = sin(2*pi*(1/20)*(K+1));
    U(:,:,1) = U(:,:,2);
    U(:,:,2) = U(:,:,3);
end
figure
surf(U(:,:,3))
figure
contour(U(:,:,3))