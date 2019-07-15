% Aproximacao polinomial entre f(x) = x.^4 - 5*x
% e P2(x) = a0 + a1*x+ a2*x.^2
% x = [-1, 1]

clear
grau = 2;
a = -1;
b = 1;
n = 500;     % numero de sub intervalos
dx = (b-a)/n;   % valor de base do retangulo
x = a : dx : b;
L = grau + 1;
P = zeros(L,L);

% calculo da matriz P
for i = 1 : L
    for j = 1 : L
        A = 0;
        for t = 1 : n
            x1 = x(t);
            x2 = x(t+1);
            B1 = x1^(i-1)*x1^(j-1); % base do trapezio
            B2 = x2^(i-1)*x2^(j-1); % base do trapezio
            T = (B1+B2)*dx/2;
            A = A + T;      % calculo da area  
        end
        P(i,j) = A;
    end
end

% calculo do vetor B
B = zeros(L,1);
for k = 1 : L
    A = 0;
    for t = 1 : n
        x1 = x(t);
        x2 = x(t+1);
        B1 = (x1^4 - 5*x1)*(x1^(k-1));
        B2 = (x2^4 - 5*x2)*(x2^(k-1));
        T = (B1+B2)*dx/2;
        A = A + T;      
    end
    B(k) = A;
end

% calculo dos coeficientes
C = P\B;
P2 = P(1) + P(2)*x + P(3)*x.^2;
f = x.^4 - 5*x;
ERRO = f - P2;
figure
plot(x,f)
hold
plot(x,P2,'r')
figure
plot(x, ERRO)



% Aproximacao polinomial entre f(x) = x.^4 - 5*x
% e P4(x) = c0 + c1*x+ c2*x.^2 + c3*x.^3 + c4*x.^4
% x = [-1, 1]

clear
grau = 4;
a = -1;
b = 1;
n = 50;     % numero de sub intervalos
dx = (b-a)/n;   % valor de base do retangulo
x = a : dx : b;
L = grau + 1;
P = zeros(L,L);

% calculo da matriz P
for i = 1 : L
    for j = 1 : L
        A = 0;
        for t = 1 : n
            x1 = x(t);
            x2 = x(t+1);
            B1 = x1^(i-1)*x1^(j-1); % base do trapezio
            B2 = x2^(i-1)*x2^(j-1); % base do trapezio
            T = (B1+B2)*dx/2;
            A = A + T;      % calculo da area
        end
        P(i,j) = A;
    end
end

% calculo do vetor B
B = zeros(L,1);
for k = 1 : L
    A = 0;
    for t = 1 : n
        x1 = x(t);
        x2 = x(t+1);
        B1 = (x1^4 - 5*x1)*(x1^(k-1));
        B2 = (x2^4 - 5*x2)*(x2^(k-1));
        T = (B1+B2)*dx/2;
        A = A + T;      
    end
    B(k) = A;
end

% calculo dos coeficientes
C = P\B;
P4 = P(1) + P(2)*x + P(3)*x.^2 + P(4)*x.^3 + P(5)*x.^4;
f = x.^4 - 5*x;
ERRO = f - P4;
figure
plot(x,f)
hold
plot(x,P4,'r')
figure
plot(x, ERRO)



% Aproximacao polinomial entre f(x) = 1/(x+2)
% e P2(x) = a0 + a1*x+ a2*x.^2
% x = [-1, 1]

clear
grau = 2;
a = -1;
b = 1;
n = 50;     % numero de sub intervalos
dx = (b-a)/n;   % valor de base do retangulo
x = a : dx : b;
L = grau + 1;
P = zeros(L,L);

% calculo da matriz P
for i = 1 : L
    for j = 1 : L
        A = 0;
        for t = 1 : n
            x1 = x(t);
            x2 = x(t+1);
            B1 = x1^(i-1)*x1^(j-1); % base do trapezio
            B2 = x2^(i-1)*x2^(j-1); % base do trapezio
            T = (B1+B2)*dx/2;
            A = A + T;      % calculo da area  
        end
        P(i,j) = A;
    end
end

% calculo do vetor B
B = zeros(L,1);
for k = 1 : L
    A = 0;
    for t = 1 : n
        x1 = x(t);
        x2 = x(t+1);
        B1 = (1/(x1+2))*(x1^(k-1));
        B2 = (1/(x2+2))*(x2^(k-1));
        T = (B1+B2)*dx/2;
        A = A + T;      
    end
    B(k) = A;
end

% calculo dos coeficientes
C = P\B;
P2 = C(1) + C(2)*x + C(3)*x.^2;
f = 1./(x+2);
ERRO = f - P2;
figure
plot(x,f)
hold
plot(x,P2,'r')
figure
plot(x, ERRO)