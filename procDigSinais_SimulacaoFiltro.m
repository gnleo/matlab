% MS5P5.m: MATLAB secao 5, programa 5
% arquivo.m de script para o projeto de um filtro passa-baixas discreto de
% Butterworth de ordem 180 com frequencia de corte Omega_c = 0,6*pi
% usando 90 secoes de segunda ordem em cascata.

omega_0 = 1; %  utiliza a frequencia de corte normalizada para prototipo analogico
psi = [0.5:1:90]*pi/180;    % angulos dos polos de Butterworth
Omega_c = 0.6*pi;   % frequencia de corte discreta
Omega = linspace(0,pi,1000); % faixa de frenquencias para a resposta em magnitude
Hmag = zeros(90,1000);  p = zeros(1,180); z = zeros(1,180);   % pre-alocacao para 
for secao = 1:90
    Q = 1/(2*cos(psi(secao))); % calcula Q para a secao
    B = omega_0^2;  A = [1 omega_0/Q omega_0^2];    % calcula os coeficientes da secao
    [B1, A1] = procDigSinais_P4(B,A,2/omega_0*tan(0.6*pi/2));  % transforma secao para TD
    p(secao*2-1:secao*2) = roots(A1); % calcula polos no dominio z da secao
    z(secao*2-1:secao*2) = roots(B1); % calcula zeros no dominio z da secao
    Hmag(secao,:) = abs(procDigSinais_P1(B1,A1,Omega)); % calcula resposta em mag da secao
end
ucirc = exp(1i*linspace(0,2*pi,200));    % calcula o circulo unitario para o grafico polos-zeros
figure;
    plot(real(p),imag(p), 'kx', real(z), imag(z), 'ok', real(ucirc), imag(ucirc), 'k:');
    title('Pólos e zeros');
    axis equal; xlabel('Real'); ylabel('Imaginário');
figure; 
    plot(Omega, Hmag,'k');  axis tight
    xlabel('\Omega [rad]'); ylabel('Resposta em Magnitude');
figure; 
    plot(Omega,prod(Hmag), 'k');    axis([0 pi -0.05 1.05]);
    xlabel('\Omega[rad]'); ylabel('Resposta em Magnitude');
    