% processo Estocastico
% X(xi,ti) = exp(-t^2/tau) para t em [0,1] e [-2,2]
% VA 'tau' em [1,2]
clear
a = -2;
b = 2;
N = 1000;
dt = (b-a)/N;
t = a : dt : b;
L = length(t);
% funcao exp(-t^2/tau)
% 'tau' constante
tau = 1;
X = exp(-t.^2/tau);
% Processo exp(-t^2/tau)
% VA 'tau' uniforme em [1,2]
u = rand(1,L) +1;
Xtau = exp( (-t.^2)./ u );

figure 
subplot(2,1,1)
plot(t, X)
title('X = exp(-t^2/tau)')
subplot(2,1,2)
plot(t, Xtau)
title('X = exp( (-t^2)/ u )')

figure
hold
plot(t, X, 'r')
plot(t, Xtau, 'k')
legend('X', 'Xtau')
