% TRANFORMADA DE LAPLACE

syms t % declara a variavel simbolica

f = sin(3*t) % escrita da função, considerar a exitencia de u(t) implicito ao programa

L = laplace(f); % executa a tranformada

pretty(L) % exibe o resultado identado