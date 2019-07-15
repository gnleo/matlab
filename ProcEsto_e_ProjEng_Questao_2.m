% PROCESSOS ESTOCASTICOS && PROJETO DE ENGENHARIA 3
% ALGORITMO DE RESOLUCAO QUESTAO 2

% ALTERNATIVA "A" 
clear
dt = 1; 
t = 0:dt:10;
C = length(t);      %tamanho do vetor t
X = zeros(C,C);     % Matriz X com tamanho C
for j=1:C           
    i=1;
    while i<=C  
        P = rand(1);    % obter um valor aleatorio para  realizar a 
        if P<0.25       % comparacao para qual funcao sera armazenada no Vetor
            b2=1;
        else
            if P<0.5
                b2=i;
            else
                if P<0.75
                    b2=-2;
                else
                    b2=-2*i;
                end
            end
        end
        X(j,i) = b2;
        i= 1 + i;
    end
end
figure
plot(t,X)
title('Funções Amostras');

% ALTERNATIVA "B"
S=0;
E=0;
VetorV = zeros(C);
VetorM = zeros(C);
% Calculo da variancia e Esperanca de cada Linha da matriz 
for b=1:C
    for a=1:C
        S = S + X(b,a);
        E = E + X(b,a)^2;
    end
    mi = S/C;               
    Var = E/C - mi^2;
    VetorV(b)= Var;
    VetorM(b)= mi;
end
figure
plot(t,VetorV)
title('Função Variância');
figure
plot(t,VetorM)
title('Função Experança');

% ALTERNATIVA "C"

E=0;
Rx=zeros(C);
for b=1:2
    S=0;
    for a=1:C
        S = S + X(a,b);
    end
    Rx(b)= S/C;
end
% Calcula da correlacao de t1=0 e t2 = 1
RX = Rx(1)*Rx(2);
RX

