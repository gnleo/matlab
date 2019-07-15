 % Exemplo 2 - Graficos da resposta ao impulso 
 A = [4 7; -2 6]; % declara a primeira matriz
 B = [1; 0]; % declara a segunda matriz
 C = eye(2);     % C = matriz identidade de dimensao 2
 D = zeros(2,1);     % D = matriz nula 2 x 1 porque a saida y = x 
 impulse(A, B, C, D) % executa a solucao e plotagem do grafico para a equacao de espaco de estado