% INTRODUCAO AO PROCESSAMENTO DE IMAGENS - AULA 2

% FILTRAGEM ESPACIAL

% filtragem de forma manual
x = uint8(10*magic(5)) % matriz da imagem

mean2(x(1:3,1:3)) % media de determinada area da imagem
mean2(x(1:3,2:4))
mean2(x(1:3,3:5))
%--------------------------------------------------------------------

% filtro passa baixa
% filtragem a partir de uma funçao - parametros(imagem, filtro)
clear all
close all
clc
img = imread('cameraman.tif');
imshow(img);
imgd = im2double(img); % imgd in [0,1]
f = ones(3,3)/9;
f1 = ones(5,5)/25;
f2 = ones(7,7)/49;
img1 = filter2(f, imgd);
img2 = filter2(f1, imgd);
img3 = filter2(f2, imgd);
subplot(221);imshow(img);
subplot(222);imshow(img1);
subplot(223);imshow(img2);
subplot(224);imshow(img3);

% funcao 'fespecial' - cria um filtro a partir do parametro passado
clear all
close all
clclimg = imread('cameraman.tif');
c = im2double(img); % img in [0,1]
f1 = fspecial('average'); % especificar o tamanho desejado no segundo parametro, se nao o padrao e 3x3
f2 = fspecial('average', 5);
f3 = fspecial('average', 7);
cf1 = filter2(f1,c);
cf2 = filter2(f2,c);
cf3 = filter2(f3,c);
subplot(221);imshow(c);
subplot(222);imshow(cf1);
subplot(223);imshow(cf2);
subplot(224);imshow(cf3);

% filtro passa alta
clear all
close all
clc
f = imread('moon.tif');
w4 = fspecial('laplacian',0);
w8 = [-1 -1 -1; -1 +8 -1; -1 -1 -1];
g4 = imfilter(f, w4);
g8 = imfilter(f, w8);
imshow(f)
figure, imshow(g4)
figure, imshow(g8)
% Obtendo o complemento da imagem - fazendo a inversao de cores
g4i = imcomplement(g4);
g8i = imcomplement(g8);
figure, imshow(g4i)
figure, imshow(g8i)

% aplicando diferentes mascaras 'a b c d'
a = [0 1 0; 1 -4 1; 0 1 0];
b = [1 1 1; 1 -8 1; 1 1 1];
c = [0 -1 0; -1 4 -1; 0 -1 0];
d = [-1 -1 -1; -1 8 -1; -1 -1 -1];

t1 = imfilter(f,a);
t2 = imfilter(f,b);
t3 = imfilter(f,c);
t4 = imfilter(f,d);

subplot(231);imshow(f);
subplot(232);imshow(t1);
subplot(233);imshow(t2);
subplot(234);imshow(t3);
subplot(235);imshow(t4);

% Laplaceano e log
img = imread('cameraman.tif');
c = im2double(img); % imgd in [0,1]
f = fspecial('laplacian');
cf = filter2(f,c);
imshow(cf)
f1 = fspecial('log');
cf1 = filter2(f1,c);
figure,imshow(cf1)


% FILTRAGEM NO DOMINIO DA FREQUENCIA

% Transformada discreta de Fourier - analisando o esoectro de Fourier
% criando um imagem preta de 30x30
clear all
close all
clc
f = zeros(30,30);
% criando um retângulo branco
f(5:24,13:17)=1;
figure,
imshow(f,'InitialMagnification', 'fit');
% calculando a DFT
F =fft2(f);
% Existe no resultado uma parte real e uma parte imaginaria de F. A funcao
% abs calcula a magnitude dos componentes combinados.
F2 = abs(F);
figure,
imshow(F2,[ ] ,'InitialMagnification', 'fit');
% No dominio da frequencia os picos altos escondem os detalhes, é necessario
% reduzir o contraste atraves da funcao log
F2 = log(F);
figure,
imshow(F2,[-1, 5] ,'InitialMagnification', 'fit');
colormap jet; % atribui um mapa de cores da tollbox do matlab
colorbar; % insere uma legenda em barra de cores

% deslocar a componente DC para o centro - a partir da funcao fftshift
F3 = fftshift(F);
F2 = abs(F3);
figure,
imshow(F2,[ ] ,'InitialMagnification', 'fit');
figure;
imshow(F2,[-1, 5]);
colormap(jet);
colorbar;

% FFT de uma imagem - apresenta os espectro de uma imagem no dominio da
% frequencia
clear all
close all
clc
cm = imread('cameraman.tif');
cmf = fftshift(fft2(cm));
subplot(1,2,1), imshow(cm)
subplot(1,2,2), fftshow(cmf,'log')
%-----------------------------------------------------
im = imread('moon.tif');
ime = fftshift(fft2(im));
subplot(1,2,1), imshow(im)
subplot(1,2,2), fftshow(ime,'log')
% --> (apenas para demonstracao do espectro)
%-----------------------------------------------------
% criar um filtro passa baixa H
[x,y] = meshgrid(-128:127,-128:127);
z = sqrt(x.^2 + y.^2);
c = (z < 15); % frequencia de corte
cf = fftshift(fft2(z));
subplot(1,2,1), imshow(c)
subplot(1,2,2), fftshow(cf,'log')

cfh = cmf.*c; % convolucao
cfhi = ifft2(cfh);
subplot(1,2,1), fftshow(cfh,'log')
subplot(1,2,2), fftshow(cfhi,'abs')

% filtro gaussiano - paramentros(tamanho, desvio padrao)
clear all
close all
clc
cm = imread('cameraman.tif');
cmf = fftshift(fft2(cm));
g1 = mat2gray(fspecial('gaussian',256,50)); % --> cria o filtro gaussiano, 
cg = cmf.*g1; % convolucao                  % conforme o aumento do desvio 
subplot(1,2,1), fftshow(cg, 'log')          % padrao maior a nitidez
chi = ifft2(cg);
subplot(1,2,2), fftshow(chi,'abs')

% cirando um filtro passa alta
clear all
close all
clc
cm = imread('cameraman.tif');
cf = fftshift(fft2(cm));
bh = hbutter(cm,15,1); % criando o filtro passa alta, definindo seu tamanho
cfbh = cf.*bh; % convolucao
figure,fftshow(cfbh,'log');
cfbhi=ifft2(cfbh);
figure,fftshow(cfbhi,'abs')

% RUIDOS

% aplicando ruido sal e pimenta
clear all
close all
clc
img = imread('cameraman.tif');
imgd = im2double(img); % imgd in [0,1]
imgd = imnoise(imgd,'salt & pepper',0.01); % produz uma imagem com 20% de
subplot(121);imshow(img);                 % ruido
subplot(122);imshow(imgd);

% aplicando ruido gaussiano - parametros(imagem, gaussiana, media, variancia)
clear all
close all
clc
img = imread('cameraman.tif');
imgd = im2double(img); % imgd in [0,1]
imgd = imnoise(imgd,'gaussian'); % default com média 0 e variância 0,01
subplot(121);imshow(img);
subplot(122);imshow(imgd);

% suavizacao de ruidos
clear all
close all
clc
img = imread('cameraman.tif');
imgd = im2double(img); % imgd in [0,1]
imgd = imnoise(imgd,'salt & pepper',0.2);
f = ones(3,3)/9; %filtro da media
img1 = filter2(f, imgd);
subplot(131);imshow(imgd);
subplot(132);imshow(img1);
K = medfilt2(imgd); %filtro da mediana
subplot(133);imshow(K);

% removendo ruido de uma imagem RGB
clear all
close all
clc
I = imread('peppers.png');
J = imnoise(I,'salt & pepper',0.2);
%-----------------------------------------------------------------------
r = medfilt2(J(:, :, 1), [3 3]); % filtro em cada canal separadamente
g = medfilt2(J(:, :, 2), [5 5]);
b = medfilt2(J(:, :, 3), [7 7]);
%-----------------------------------------------------------------------
% reconstroi a imagem concatenando os canais r,g,b
K = cat(3, r, g, b);
figure
subplot(121);imshow(J);
subplot(122);imshow(K);


