% Gaussiana usando randn para 1000 amostras
% historiograma
% fdp real e estimada

% necessario executar por partes para ir alterando os valores de tamanho
% dos vetores 'gx' e 'gy' conforme o historiograma

clear
% VA x mu = 0; var = 1
x = randn(1000,1);
% VA y mu = 5; var = 1/2
aux = randn(1000,1);
y = 5 + (1/2)*aux;
figure
plot(x(1:100));
title('Variavel aleatoria - x | media = 0; var = 1');
figure
plot(y(1:100));
title('Variavel aleatoria - y | media = 5; var = 1/2');

% historiograma
barras = 40;
[Nx,eixoX] = hist(x, barras);
[Ny,eixoY] = hist(y, barras);

figure
bar(eixoX, Nx)
title('Historiograma de x')
figure
bar(eixoY, Ny)
title('Historiograma de y')

% Calculo FDP estimado do vetor 'x'
rangeX = max(x) - min(x);
deltaX = rangeX / barras;
somaX = sum(Nx); % soma todos os valores de Nx
areaX = somaX * deltaX;
fdpEstimadaX  = Nx / areaX;

% Calculo FDP real do vetor 'x'
gx = -4 : 0.1 : 3;
gaussX = (1/sqrt(2*pi)) * exp(-gx.^2/2);

figure
plot(eixoX, fdpEstimadaX)
hold
plot(gx, gaussX, 'r')
title('Grafico da FDP Estimada e FDP real (red) de x')
legend('estimada', 'real')

% Calculo FDP estimado do vetor 'y'
rangeY = max(y) - min(y);
deltaY = rangeY / barras;
somaY = sum(Ny); % soma todos os valores de Nx
areaY = somaY * deltaY;
fdpEstimadaY  = Ny / areaY;

% Calculo FDP real do vetor 'y'
gy = 3 : 0.1 : 6.5;
gaussY = (1/((1/2) * sqrt(2*pi))) * exp(-(gy - 5).^2 / (2*(1/2)^2));

figure
plot(eixoY, fdpEstimadaY)
hold
plot(gy, gaussY, 'r')
title('Grafico da FDP Estimada e FDP real (red) de y')
legend('estimada', 'real')