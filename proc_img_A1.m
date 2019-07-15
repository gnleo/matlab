% Introducao ao processamento de imagens - Aula 1

E = [0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40
0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40];

IE = mat2gray(E);   % escala de cinza
figure, imshow(IE,'initialmagnification','fit');  

% Convertendo Imagem de intensidade para imagem binária

IB = im2bw(IE); % escala de preto e branco(imagem binária)
figure, imshow(IB) %exibe propriedades da imagem
whos IE, whos IB
F = imread('pout.tif'); % carrega imagem 
figure, imshow(F);
img2 = imread('tire.tif');
whos img2
figure, imshow(img2);

% Arranjos Padrões

Z = zeros(1,10);
whos Z
U = ones(4);
whos U
M = magic(5);
whos M
sum(M(:,3)), sum(M(1,:));

R1 = rand(2,2);
R2 = randn(2,2);

close all
clc
clear

% Imagens RGB
%decompor a imagem em tres componentes RGB
f = imread('peppers.png');
figure, imshow(f);
whos f
fR = f(:,:,1);
fG = f(:,:,2);
fB = f(:,:,3);
figure;
subplot(2,3,1); imshow(f);
subplot(2,3,2); imshow(fR);
subplot(2,3,3); imshow(fG);
subplot(2,3,4); imshow(fB);

% Gerar imagem RGB a partir de tres componentes
figure;
g = cat(3, fR, fG, fB);
subplot(2,3,1);imshow(fR);
subplot(2,3,2);imshow(fG);
subplot(2,3,3);imshow(fB);
subplot(2,3,4);imshow(g);

% converter uma imagem RGB em uma imagem idexada
RGB = imread('peppers.png');
[X,map] = rgb2ind(RGB,256);
figure, imshow(X,map);
whos X

%mudar o numero de cores em uma imagem indexada
[Y,newmap] = imapprox(X,map,128);
figure, imshow(Y,newmap);
whos Y

%Manipulando imagens RGB e indexadas
% converter a imagem indexada X em escala de cinza e em RGB

GR = ind2gray(X,map);
figure,imshow(GR);
RGB2 = ind2rgb(X,map);
figure, imshow(RGB2);

% Processamento de imagens - pratica 2

p = imread('pout.tif');
imshow(p)
figure
imhist(p) % gera histograma da imagem
axis tight % arredendoda

ph = histeq(p); % equaliza o histograma da imagem
figure
imshow(ph),
figure
imhist(ph), axis tight

t = imread('tire.tif');  % ajustes com relacao ao gama
tl = imadjust(t,[],[],0.5); % expande o histograma
th = imadjust(t,[],[],1.5);

figure
subplot(2,3,1), imshow(t);
subplot(2,3,2), imshow(tl);
subplot(2,3,3), imshow(th);
subplot(2,3,4), imhist(t), axis tight;
subplot(2,3,5), imhist(tl), axis tight;
subplot(2,3,6), imhist(th), axis tight;

%Thresholding
a = imread('cameraman.tif');
figure, imhist(a), axis tight;
% Escolher uma frequência de corte , ex: 128
b = a < 60;
c = a >= 60;
figure,
subplot(1,3,1), imshow(a);
subplot(1,3,2), imshow(b);
subplot(1,3,3), imshow(c);

% TRABALHANDO COM IMGEM COLORIDA
a = imread('C:\Users\gnleo\Documents\ENG COMPUTACAO\8 SEMESTRE\Processamento de imagens\Figuras\igreja.png');
figure(1);imshow(a);
% Separando as 3 bandas de cor:
a1 = a(:, :, 1);
a2 = a(:, :, 2);
a3 = a(:, :, 3);
figure(2); imshow([a1 a2 a3]);
% Equalizando as tres bandas separadamente
b1 = histeq(a1);
b2 = histeq(a2);
b3 = histeq(a3);
b = cat (3, b1, b2, b3); % cat concatena vetores
figure(3);imshow(b);

% Equalização adaptativo de histograma (adapthisteq).
img = imread('pout.tif');
imgj = imadjust(img);
imghq = histeq(img);
imgdp = adapthisteq(img);
figure;
subplot(1, 2, 1 ); imshow(img);
subplot(1, 2, 2 ); imhist(img(:));
title('original');
figure;
subplot(1, 2, 1 ); imshow(imgj);
subplot(1, 2, 2 ); imhist(imgj(:));
title('imadjust');
figure;
subplot(1, 2, 1 ); imshow(imghq);
subplot(1, 2, 2 ); imhist(imghq(:));
title('histogram equalisation');
figure;
subplot(1, 2, 1 ); imshow(imgdp);
subplot(1, 2, 2 ); imhist(imgdp(:));
title('adaptive histogram equalisation');

