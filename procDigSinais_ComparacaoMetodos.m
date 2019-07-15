clear all

omega_c = 2*pi*3000;
N = 10;
poles = roots([(1i*omega_c)^(-2*N),zeros(1,2*N-1),1]);

% find(x);  retorna um vector contendo os indices lineares de cada elemento diferente de zero na matriz X.

poles = poles(find(poles<0));
B = 1;
A = poly(poles);
A = A/A(end);

Omega = linspace(0,pi,200);
T=1/10000;
Omega_c = omega_c*T;
[B1,A1] = procDigSinais_P3(B,A,T);
[B2,A2] = procDigSinais_P4(B,A,T);
[B3,A3] = procDigSinais_P4(B,A,2/omega_c*tan(Omega_c/2));

H1mag = abs(procDigSinais_P1(B1,A1,Omega));
H2mag = abs(procDigSinais_P1(B2,A2,Omega));
H3mag = abs(procDigSinais_P1(B3,A3,Omega));

plot(Omega,(Omega<=Omega_c),'k',Omega, H1mag,'k-',Omega,H2mag,'k--',Omega, H3mag,'k');
axis([0 pi -0.05 1.5]);
xlabel('\Omega [rad]');
ylabel('Resposta em Magnitude');
legend('Ideal','Diferença atrasada de primeira ordem','Bilinear', 'Bilinear com pré - warping');
