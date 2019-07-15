% Raiz de sen(x^2) = 0 em [1,2]
% Metodo da bissecao

clear
a = 1.0;
b = 2.0;
fa = sin(a^2);
fb = sin(b^2);
k = 0; % valor inicial do contador
delta = 1e-4;
tic % inicio ideia de tempo de execucao
while (b-a)>delta
    k = k + 1; % contador
    x = (a+b)/2; % ponto medio entre 'a' e 'b'
    fx = sin(x^2);
    if sign(fa) == sign(fx) % Checa os sinais da funcao (+ ou -)
        a = x;
        fa = fx;
    else
        b = x;
        fb = fx;
    end
end
toc % fim ideia de tempo de execucao
[delta k x]