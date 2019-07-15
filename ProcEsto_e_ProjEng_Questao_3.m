% PROCESSOS ESTOCASTICOS && PROJETO DE ENGENHARIA 3
% ALGORITMO DE RESOLUCAO QUESTAO 3

clear
dx = 0.001;
dy = dx;
x = 0:dx:10;
y = 0:dy:10;
Tx = length(x);     % tamanho de X
Ty = Tx;            % tamanho do Y

auxA = randn(Tx,1);   % vetor A com valores aletorios gaussianas.
auxB = randn(Ty,1);   % vetor B com valores aletorios gaussianas
Z = zeros(Tx,1);
T = 4/dx;              % periodo

X = zeros(1,Tx);    % vetor X(t) com tamanho Tx
Y = zeros(1,Ty);    % vetor Y(t) com tamanho Ty
% preencher o vetor X com os valores 1 se 0 < t < T/2 e -1 se T/2< t < T
% preencher o vetor Y com os valores 1 se 0 < t < T/4 e -1 se T/4< t < T/2
contA = 0;
contB = 0;
valorA = 1;             % Valor que sera armazenado no periodo do X
valorB = 1;             % Valor que sera armazenado no periodo do Y
i=1;
while (i<=Tx)                   
    if(contB==(T/4))        % verificar o periodo no vetor Y se for igual a T/4      
        valorB =(-1)*valorB;% obter o valor que sera armazenado no perido 
        Y(1,i) = valorB;    % armazenar no vetor Y o valor obtido
        contB = 1;
    else
        contB = contB+1;   % senao o valor armazenado sera o mesmo do anterior
        Y(1,i) = valorB;
    end
    if(contA==T/2)
        valorA =(-1)*valorA;
        X(1,i) = valorA;
        contA = 1;
    else
        contA = contA+1;
        X(1,i) = valorA;
    end
    i=i+1;
end
% Calculo da variancia do vetor A e B
va = var(auxA);
vb = var(auxB);
% V.A de A e B com mu = 0  e var= va e vb
A = (va)*auxA;
B = (vb)*auxB;

% Calculo do Z(t) = A*X + B*Y
for j=1:Tx
    Z(j,1)=(A(j,1).*X(1,j))+(B(j,1).*Y(1,j));
end

% Calculo da Esperanca do vetor Z
EZ = mean(Z)
% Calculo da varianca do vetor Z
varZ = var(Z)

figure
plot(x,Z)
title('FUNÇÃO Z(t)');

% FDP do vetor Z
barras = 40;
[Nz,eixoZ] = hist(Z, barras);
rangeZ = max(Z) - min(Z);
deltaZ = rangeZ / barras;
somaZ = sum(Nz);
areaZ = somaZ * deltaZ;
fdpEstimadaZ  = Nz / areaZ;
  
figure
plot(eixoZ, fdpEstimadaZ)
title('FDP ESTIMADA DE Z');