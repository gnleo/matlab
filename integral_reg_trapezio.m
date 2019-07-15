% Integral pela regra dos trapezios
% funcao exp(-x^2) em [0 1]

clear
a = 0;          % valor incial
b = 1;          % valor final
N = 16;          % numero de trapezios

dx = (b-a)/N;   % valor da altura do trapezio
x = a:dx:b;     % tamanho N+1
f = exp(-x.^2);
A = 0;

for n = 1 : N
   B1 = f(n);
   B2 = f(n+1);
   T = (B1+B2)*dx/2;     % area do trapezio
   A = A + T;            % calculo da area total
end
A


% funcao sen(x) em [0 pi]

clear
a = 0;          % valor incial
b = pi;          % valor final
N = 256;          % numero de trapezios

dx = (b-a)/N;   % valor da altura do trapezio
x = a:dx:b;     % tamanho N+1
f = sin(x);
A = 0;

for n = 1 : N
   B1 = f(n);
   B2 = f(n+1);
   T = (B1+B2)*dx/2;     % area do trapezio
   A = A + T;            % calculo da area total
end
A


% Calcule o valor aproximado de pi, usando 4|64 trapezios
% atraves da area do primeiro quadrante do circulo de raio unitario
% centrado na origem: X^2 + y^2 = 1

clear
a = 0;          % valor incial
b = 1;          % valor final
N = 64;          % numero de trapezios

dx = (b-a)/N;   % valor da altura do trapezio
x = a:dx:b;     % tamanho N+1
f = sqrt(1 - x.^2);
A = 0;

for n = 1 : N
   B1 = f(n);
   B2 = f(n+1);
   T = (B1+B2)*dx/2;     % area do trapezio
   A = A + 4*T;            % calculo da area total
end
A
ERRO = pi - A


% Calcule ln(x) para x = 0.3 : 0.3 : 3.0
% atraves da integral de dt/t de 1 a x

clear
x = 0.3 : 0.3 : 3.0;
L = length(x);
LOGN(1:L) = 0;
N = 2;          % numero de trapezios
a = 1;          % valor inicial
for k = 1 : L
    b = x(k);           % valor final
    dt = (b-a)/N;       % valor da altura do trapezio
    t = a : dt : b;     % tamanho N+1
    f = 1./t;
    A = 0;
    for n = 1 : N
        B1 = f(n);
        B2 = f(n+1);
        T = (B1+B2)*dt/2;
        A = A + T;
    end
    LOGN(k) = A;
end
LOGN


% Calcule ln(x) para x = 0.3 : 0.3 : 3.0
% atraves da integral de dt/t de 1 a x
% variando N e utilizando matriz LOGN

clear
x = 0.3 : 0.3 : 3.0;
L = length(x);
LOGN = zeros(5,L);
a = 1;          % valor inicial
for e = 1:5
    N = 2^e;          % numero de trapezios.

    for k = 1 : L
        b = x(k);           % valor final
        dt = (b-a)/N;       % valor da altura do trapezio
        t = a : dt : b;     % tamanho N+1
        f = 1./t;
        A = 0;
        for n = 1 : N
            B1 = f(n);
            B2 = f(n+1);
            T = (B1+B2)*dt/2;
            A = A + T;
        end
        LOGN(e,k) = A;
    end
end
LOGN


% Calcular a integral de (x^2 - X^3)*dx no intervalo [0 1]
% usando o metodo dos trapezios com dez intervalos

clear
a = 0;
b = 1;
N = 10;     % numero de subintervalos
dx = (b-a)/N;
x = a : dx : b;
y = ((x.^2) - (x.^3));  % funcao a integrar
A = 0;
for n = 1 : N
    B1 = y(n);
    B2 = y(n+1);
    T = (B1+B2)*dx/2;
    A = A + T;
end
A
