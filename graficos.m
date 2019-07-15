% Grafico da funcao x^3 - 2*x^2 + 2*x - 5
% para x em [-10 10]
clear
x = -10:0.5:10;
y = x.^3 - 2*x.^2 + 2*x - 5;
figure
plot(x,y)
title('função x^3 - 2*x^2 + 2*x - 5') % impressao nome da layout
xlabel('abcissa') % impressao no eixo horizontal
ylabel('ordenada')% impressao no eixo vertical

% Grafico de 1/(x.^2 + 5*x - 6)
clear
x = -10.1:0.2:10.1;
z = x.^2 + 5*x - 6;
y = 1./z;
figure
plot(x,y)

% Grafico de (5-3*t)/(t^2+3*t-4)
clear
t = -10.1:0.2:10.1;
N = (5-3*t);
D = t.^2+3*t-4;
y = N./D;
figure
plot(t,y)

% Grafico de ((x+3)/(x-3)^(1/2)
clear
x = -10.1:0.2:10.1;
N = sqrt(x+3);
D = sqrt(x-3);
y = N./D;
figure
plot(x,y)

% Grafico de (s-1)/(s^2-4)
clear
s = -10.1:0.2:10.1;
N = s-1;
D = s.^2-4;
y = N./D;
figure
plot(s,y)

% Grafico de (5-3*t)/(t^2+3*t-4)
clear
t = -6.1:0.2:3.1;
N = 5-3*t;
D = t.^2+3*t-4;
y = N./D;
figure 
plot(t,y)

% Grafico de (2*t^2-3*t)/(t+1)
clear
t = -5.1:0.2:5.1;
N = 2*t.^2-3*t;
D = t+1;
y = N./D;
figure
plot(t,y)

% Grafico IAME 2012
% y = (x.^2)*sin(1./x)
clear
x = -0.5005:0.0010:0.5005; %ZOOM - basta alterar a dimensao do grafico "-0.1005:0.0010:0.1005"
y1 = x.^2;
y2 = 1./x;
y3 = sin(y2);
y = y1.*y3;
figure
plot(x,y)
axis([-0.51 0.51 -0.25 0.25]) % essa funçao limita o espaco de exibicao | E preciso redefinir aqui tambem a dimensao de escala "-0.11 0.11 -0.010 0.010"
grid
title('y = (x.^2)*sin(1./x)')
xlabel('x = -0.5005:0.0010:0.5005')

% y = x.^x
clear
x = -1.0050:0.0100:1.0050;
y = x.^x;
figure
plot(x,y)
grid
title('x.^x')
xlabel('-1.0050:0.0100:1.0050')

% y = (1./x).^x
clear
x = -1.0050:0.0100:1.0050;
y1 = (1./x);
y = (y1).^x;
figure
plot(x,y)
grid
title('y = (1./x).^x')
xlabel('-1.0050:0.0100:1.0050')

% y = (1+(1./x)).^x
clear
x = -10.10:0.20:10.10;
y1 = (1./x);
y2 = 1 + y1;
y = (y2).^x;
figure
plot(x,y)
grid
title('y = (1+(1./x)).^x')
xlabel('-10.10:0.20:10.10')

% Grafico da semi esfera
clear
x = -1:.1:1;
y = x;
N = length(x);
z = zeros(N,N);

for I=1:N
    for J=1:N
        R = x(I)^2 + y(J)^2;
        if R <= 1
        z(I,J) = sqrt(1 - R);
        end
    end
end

figure
surf(z) % mesh(z)  surf(x,y,z)

% Grafico da paraboloide
clear
x = -1:.1:1;
y = x;
N = length(x);
z = zeros(N,N);

for I=1:N
    for J=1:N
        z(I,J) = x(I)^2 + y(J)^2;
    end
end

figure
% surf(z) % mesh(z)  
surf(x,y,z)