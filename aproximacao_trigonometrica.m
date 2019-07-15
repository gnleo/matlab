% Aproximacao trigonometrica de ordem 4 para a funcao tabelada
% obetencao dos coeficientes a0 a1 b2 b2 a3 b3 a4 b4

clear
x  = pi/4 : pi/4 : 2*pi;
f = [126 159 191 178 183 179 176 149];
N = length(x);
ordem = 4;
% obtencao de a0
S = 0;
for t = 1 : N
    S = S + f(t);
end
A0 = (1/N)*S;

% obtencao de aL e bL
A = zeros(1,4);
for L = 1 : ordem
    SLS = 0;
    SLC = 0;
    for k = 1 : N
        SLS = SLS + f(k)*sin(L*x(k));
        SLC = SLC + f(k)*cos(L*x(k));
    end
    A(L) = (2/N)*SLS;
    B(L) = (2/N)*SLC;
end
F = ones(1, N);
F = F * A0;
for c = 1 : ordem
    F = F + A(c)*sin(c*x) + B(c)*cos(c*x);
end
figure
plot(x, f)
hold
plot (x, F, 'r')
Er = f - F;
figure 
plot (x, Er)