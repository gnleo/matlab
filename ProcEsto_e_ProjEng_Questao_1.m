% PROCESSOS ESTOCASTICOS && PROJETO DE ENGENHARIA 3
% ALGORITMO DE RESOLUCAO QUESTAO 1

clear
dt = 1000;
t = 0 : 1/dt : 10;
N = 1;
tam = 10 * dt;
Nt = 0 : tam;

cont = 1;
B2 = 0;

for a = 1 : dt : tam
    
    % se atingiu a duração B2, calcula novo B1 e B2
    if cont > B2
        cont = 1;
        
        % determina quanto(B1) N vai subir ou descer atraves do processo de Bernoulli
        aleat = rand();
        if aleat < 0.5
            B1 = -1;
        else
            B1 = 1;
        end
        % não deixa N ser menor que 0
        if N + B1 < 0
            B1 = 0;
        end
        % não deixa N ser maior que 5
        if N + B1 > 5
            B1 = 5;                
        end
        % determina durante quantos(B2) dt o valor de N vai permanecer
        aleat = rand();
        if aleat < 0.25
            B2 = 1;
        else
            if aleat >= 0.25 && aleat < 0.5
                B2 = 2;
            else
                if aleat >= 0.5 && aleat < 0.75
                    B2 = 3;
                else
                    B2 = 4;
                end
            end
        end
        B2
    end

    % armazena o valor de N em dt posicoes de Nt
    for b = a : (a + dt)
        Nt(b) = N+B1;   
    end
    
    % se atingiu a duracao B2, atualiza N
    if cont >= B2
        N = N + B1;
    end
    cont = cont + 1;
    
end    
plot(t, Nt)
title('FUNÇÃO AMOSTRA');
axis([-1 11 -1 6])
%t
%Nt