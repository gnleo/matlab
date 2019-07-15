% INTRODUCAO AO PROCESSAMENTO DE IMAGENS - AULA 3

% MORFOLOGIA MATEMÁTICA

% DILATACAO
% dilatacao em imagem binaria, com elemento estruturante quadrado 3x3
BW = zeros(9,10);
BW(4:6,4:7) = 1;
SE = strel('square',3); % cria elemento estruturante - paramentros(forma, tamanho)
BW2 = imdilate(BW,SE); % executa a dilatacao - parametros(imagem, elemento estruturante)
figure, imshow(BW);
figure, imshow(BW2);

% dilatacao em imagem, com elemento estruturante 3x3 (forma manual)
clear all
close all
clc
bw = imread('text.png');
sq = ones(3,3); % cria 'ee' de forma manual
td = imdilate(bw,sq);
subplot(1,2,1); imshow(bw);
subplot(1,2,2); imshow(td);

%-------------------------------------------------------------------------
clear all
close all
clc
bw = imread('text.png');
sq = ones(4,4); % cria 'ee' de forma manual
td = imdilate(bw,sq);
subplot(1,2,1); imshow(bw);
subplot(1,2,2); imshow(td);

clear all
close all
clc
bw = imread('text.png');
sq = ones(5,5); % cria 'ee' de forma manual
td = imdilate(bw,sq);
subplot(1,2,1); imshow(bw);
subplot(1,2,2); imshow(td);
%exercicios extra
%-------------------------------------------------------------------------

% dilatacao em imagem (escala de cinza), 'ee' circular
clear all
close all
clc
I = imread('cameraman.tif');
% Criado o elemento esturrutante
se = strel('ball',5,5); % parametros(forma == ball, raio, altura)
I2 = imdilate(I,se);
imshow(I), title('Original')
figure, imshow(I2), title('Dilatado')

%-------------------------------------------------------------------------
clear all
close all
clc
I = imread('cameraman.tif');
% Criado o elemento esturrutante
se = strel('ball',8,5); % parametros(forma == ball, raio, altura)
I2 = imdilate(I,se);
imshow(I), title('Original')
figure, imshow(I2), title('Dilatado')
%exercicios extra
%-------------------------------------------------------------------------

% EROSAO

% 'ee' forma disco
clear all
close all
clc
originalBW = imread('circles.png');
se = strel('disk',11); % parametro(forma, raio)
erodedBW = imerode(originalBW,se);
subplot(121); imshow(originalBW);
subplot(122); imshow(erodedBW);

% 'ee' forma bola
clear all
close all
clc
I = imread('cameraman.tif');
se = strel('ball',5,5);
I2 = imerode(I,se);
subplot(121);imshow(I);
subplot(122);imshow(I2);

% 'ee' forma diagonal
clear all
close all
clc
BW1 = imread('circbw.tif');
SE = strel('arbitrary',eye(5)); 
BW2 = imerode(BW1,SE);
figure,
subplot(121); imshow(BW1);
subplot(122); imshow(BW2);

%-------------------------------------------------------------------------
clear all
close all
clc
BW1 = imread('circbw.tif');
SE = strel('arbitrary',eye(15)); 
BW2 = imerode(BW1,SE);
figure,
subplot(121); imshow(BW1);
subplot(122); imshow(BW2);
%exercicios extra
%-------------------------------------------------------------------------

% ABERTURA E FECHAMENTO
% abertura ---> erosao seguida de dilatacao
% fechamento ---> dilatacao seguida de erosao

% abertura (forma manual)
clear all
close all
clc
BW1 = imread('circbw.tif');
SE = strel('rectangle',[40 30]);
BW2 = imerode(BW1,SE);
BW3 = imdilate(BW2,SE);
figure;
subplot(131);imshow(BW1);
subplot(132);imshow(BW2);
subplot(133);imshow(BW3);

% abertura, utilizando a funcao imopen, que realiza uma abertura
% morfologica (forma automatica) --> paramentros(imagem, 'ee')
clear all
close all
clc
original = imread('snowflakes.png');
se = strel('disk',5);
afterOpening = imopen(original,se);
subplot(2,1,1); imshow(original);
subplot(2,1,2); imshow(afterOpening);

% fechamento de forma automatica, funcao imclose --> paramentros(imagem, 'ee')
clear all
close all
clc
originalBW = imread('circles.png');
se = strel('disk',10);
closeBW = imclose(originalBW, se);
subplot(121);imshow(originalBW);
subplot(122);imshow(closeBW);

% REMOVENDO RUIDO DE UMA IMAGEM
clear all
close all
clc
c = imread('circles.png');
x = rand(size(c));
d1 = find(x <= 0.05);
d2 = find(x >= 0.95);
c(d1) = 0;
c(d2) = 1;
sq = ones(4,4); % cria 'ee' de forma manual
cr = ones(5,5);
cf1 = imclose(imopen(c,sq),sq);
cf2 = imclose(imopen(c,cr),cr);
subplot(131); imshow(c);
subplot(132); imshow(cf1);
subplot(133); imshow(cf2);


% ESQUELETIZACAO
clear all
close all
clc
BW1 = imread('circbw.tif');
BW2 = bwmorph(BW1,'skel',Inf); % funcao que executa esqueletizacao
imshow(BW1)
figure, imshow(BW2)

%DETERMINACAO DE PERIMETROS
clear all
close all
clc
BW1 = imread('circbw.tif');
BW2 = bwperim(BW1);
imshow(BW1)
figure, imshow(BW2)

% PREENCHENDO BURACOS
clear all
close all
clc
BW4 = im2bw(imread('coins.png'));
BW5 = imfill(BW4,'holes');
subplot(121); imshow(BW4);
subplot(122); imshow(BW5);

% TRACA LIMITES DE IMAGEM BINARIA
clear all
close all
clc
I = imread('rice.png');
figure; imshow(I);
BW = im2bw(I, graythresh(I));
[B,L] = bwboundaries(BW,'noholes');
figure; imshow(label2rgb(L, @jet, [.5 .5 .5]));
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2);
end

% CONECTANDO COMPONENTES
clear all
close all
clc
BW = logical ([1 1 1 0 0 0 0 0;
1 1 1 0 1 1 0 0;
1 1 1 0 1 1 0 0;
1 1 1 0 0 0 1 0;
1 1 1 0 0 0 1 0;
1 1 1 0 0 0 1 0;
1 1 1 0 0 1 1 0;
1 1 1 0 0 0 0 0]);
X = bwlabel(BW,4);
RGB = label2rgb(X, @jet, 'k');
figure; imshow(BW,'InitialMagnification','fit');
figure; imshow(RGB,'InitialMagnification','fit');

% OBTENDO AREA DE OBJETOS DO PRIMEIRO PLANO ---> IMAGEM BINARIA
clear all
close all
clc
BW = imread('circbw.tif');
SE = ones(5);
figure; imshow(BW);
BW2 = imdilate(BW,SE);
increase = (bwarea(BW2) - bwarea(BW))/bwarea(BW);
