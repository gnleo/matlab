% Serie de Fibinacci com 10 termos

clear
tamanho_Vetor = 5;
F(1:tamanho_Vetor) = 0; % Cria o vetor (linha) F a partir do tamanho informado
F(1) = 1;
F(2) = 1;
for n = 3 : tamanho_Vetor % executa o algoritmo ate o fim do tamanho do vetor
    F(n) = F(n -1) + F(n -2);
end
F
