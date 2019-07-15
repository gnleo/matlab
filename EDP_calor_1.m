% Solucao da EDP parabolica. Equacao do calor 1D
% Ut(x,y) = Uxx(x,t)
% U(0,t) = U(1,t) = 100 e U(x,0) = 0
% Barra na vertical

clear
dx = 0.1;
x = 0 : dx : 1;
L = length(x);
T = 10;     % numero de iteracoes
U = zeros(L,T);     % U(x,0) = 0
U(1,:) = 100;   % U(0,t) = 100
U(L,:) = 100;   % U(1,t) = 100
m = 0.25;
for N = 1 : T
    for I = 2 : L-1
        U(I, N+1) = m*(U(I+1,N) + U(I-1,N)) + (1-2*m)*(U(I,N));
    end
end

figure
subplot(3,1,1) ; plot(x,U(:,1)) ; title('T = 1')
subplot(3,1,2) ; plot(x,U(:,5)) ; title('T = 5') 
subplot(3,1,3) ; plot(x,U(:,T)) ; title('T = 10') 