% processo Estocastico
% X(xi,ti) = exp(a*t) para t em [0,1] e [1,2]
% VA 'a' em [0,1] e [1,2]
clear
a = 0;
b = 1;
N = 200;
dt = (b-a)/N;
t = a : dt : b;
L = length(t);

% funçao exp(a*t)
% a constante
a = 1;
X = exp(a*t);

% Processo exp(a*t)
% VA 'a' uniforme em [0,1]
u = rand(1,L);
X1 = exp(u.*t);

% Processo exp(a*t)
% VA 'a' uniforme em [1,2]
u2 = u +1;
X2 = exp(u2.*t);

figure 
subplot(3,1,1)
plot(t, X)
title('X = exp(a*t)')
subplot(3,1,2)
plot(t, X1)
title('X = exp(u*t)')
subplot(3,1,3)
plot(t, X2)
title('X = exp(u2*t)')

figure
hold
plot(t, X, 'b')
plot(t, X1, 'g')
plot(t, X2, 'k')

