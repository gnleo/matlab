% Soma dos impares

clear
% Cria um vetor de 1 a 10, delegando numeros impares.
I(1:10)=0;
S=0;
for n=1:10
    I(n) = 2*n-1;
    S = S + I(n);
end
S % Comando de retorno da variavel S, sem esta linha o matlab, nao te mostra resultado