% Solucao da EDP parabolica. Equacao do calor 2D
% Ut(x,y,t) = a(Uxx(x,t,y) + Uyy(x,y,t)
% U(0,0,t) = U(0,1,t) = U(1,0,t) = U(1,1,t) = 100 e U(x,y,0) = 0
% Placa com fontes nas bordas
clear
dx = 0.1;
x = 0 : dx : 1;
y = x;
C = length(x);
T = 100;     % numero de iteracoes
U = zeros(C,C,2);     % U(x,y,0) = 0
U(1,:,:) = 100;   % U(0,0,t) = 100
U(C,:,:) = 100;   % U(0,1,t) = 100
U(:,1,:) = 100;     % U(1,0,t) = 100
U(:,C,:) = 100;     % U(1,1,t) = 100
m = 0.10;
for N = 1 : T
    for I = 2 : C-1
        for J = 2 : C-1
            U(I,J,2) = m*(U(I+1,J,1) + U(I-1,J,1) + U(I,J+1,1) + U(I,J-1,1)) + ... 
                + (1-4*m)*U(I,J,1);
        end
    end
    U(:,:,1) = U(:,:,2);
end
       
figure
surf(x,y,U(:,:,2))