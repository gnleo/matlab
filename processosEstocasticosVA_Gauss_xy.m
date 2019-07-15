% g(x) Variavel Aleatoria Gaussiana 
% conjunta x = (mi = 0 e sigma = 1) e
% y = (mi = 5 e sigma = 1/2)

clear
x = -5 : 0.1 : 5;
y = 0 : 0.1 : 10;
gx = (1/sqrt(2*pi))*exp(-x.^2/2);
gy = (1/((1/2)*sqrt(2*pi)))*exp(-(y-5).^2/(2*(1/2)^2));
G = gx'*gy;
figure
plot(y,gy, 'r')
hold
plot(x,gx)
grid
figure
mesh(x,y,G)