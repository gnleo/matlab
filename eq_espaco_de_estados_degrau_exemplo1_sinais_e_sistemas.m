% Exemplo 1 - Graficos da resposta ao degrau 
 A = [0 1; -2 -3]; % declara a primeira matriz
 B = [0; 1]; % declara a segunda matriz
 C = eye(2);     % C = matriz identidade de dimensao 2
 D = zeros(2,1);     % D = matriz nula 2 x 1 porque a saida y = x 
 step(A, B, C, D) % executa a solucao e plotagem do grafico para a equacao de espaco de estado