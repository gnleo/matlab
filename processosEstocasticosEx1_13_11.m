% processo Estocastico
clear
a = 0;
b = 4*pi;
N = 100;
dt = (b-a)/N;
t = a:dt:b;
L = length(t);
% funcao Acos(wt+teta)
% A, w e teta constante
A = 1;
w = 1;
teta = 0;
X = A*cos(w*t+teta);
% processo Acos(wt+teta)
% V.A. A uniforme sobre [-1.1]
u = rand(1,L);
Amp = 2*u-1;
XAmp = Amp.*cos(w*t+teta);
% processo Acos(wt + teta)
% V.A. w uniforme sobre [0,2]
omega = 2*u;
XW = A*cos(omega.*t + teta);
% processo Acos(wt + teta)
% V.A. teta uniforme sobre [0,2]
fase = 2*pi*u;
Xfase = A*cos(w*t + fase);

figure
subplot(4,1,1)
plot(t,X)
title('X = Acos(wt+teta)')
subplot(4,1,2)
plot(t,XAmp, 'g')
title('XAmp = Amp*cos(wt+teta)')
subplot(4,1,3)
plot(t,XW, 'r')
title('XW = Acos(omega*t + teta)')
subplot(4,1,4)
plot(t,Xfase, 'k')
title('Xfase = Acos(wt +fase)')