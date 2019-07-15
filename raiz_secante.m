% Calculo da menor raiz positiva da funcao sen(x^2) = 0
% em [1 2]
% Metodo da secante para raizes reais

clear
A = 1.0;
B = 2.0;
delta = 0.0001;
K = 0;  % numero de iteracoes
tic
while abs(B-A) > delta
    f1 = sin(A^2);  % f(n-1)[x(n-1)]
    f2 = sin(B^2);  % f(n)[x(n)]
    x = (A*f2 - B*f1) / (f2 - f1);
    K = K + 1;
    A = B;
    B = x;
end
toc
[delta K x]


% Calculo da menor raiz positiva da funcao sen(x^2) = 0
% em [1 2]
% Metodo da secante para raizes reais outra resolucao

clear
A = 1.0;
B = 2.0;
delta = 0.0001;
K = 0;  % numero de iteracoes
tic
while abs(B-A) > delta
    f1 = sin(A^2);  
    f2 = sin(B^2);  
    m = (B - A) / (f2-f1);
    x = B - f2*m;
    K = K + 1;
    A = B;
    B = x;
end
toc
[delta K x]