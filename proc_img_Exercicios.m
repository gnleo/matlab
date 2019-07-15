% UNIVERSIDADE FEDERAL DO PARA - CAMPUS TUCURUI
% LEONARDO NUNES GONCALVES - 201333840012

% INTRODUCAO AO PROCESSAMENTO DE IMAGENS
% LISTA DE EXECICIOS 1
% QUESTAO 1
A = logical([0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
0 0 0 1 1 1 1 0 0 1 1 1 1 1 1 0 0 0 0 0 0 1 1 0;
0 0 0 1 1 1 1 0 0 1 1 1 1 1 1 0 0 1 1 1 0 1 1 0;
0 1 1 1 1 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1 0 1 1 0;
0 1 1 1 1 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1 0 1 1 0;
0 1 1 1 1 0 0 0 0 1 1 1 1 1 1 0 0 1 1 1 0 0 0 0;
0 1 1 1 1 0 0 0 0 1 1 1 1 1 1 0 0 1 1 1 0 0 0 0;
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);

B = logical([0 1 0 1 1 1 1 0 0;
1 1 1 1 1 1 0 0 0;
0 1 0 1 1 1 0 0 1]);

% ALTERNATIVA A
% EROSAO A x B
E_AB = imerode(A,B);
figure, 
subplot(2,1,1); imshow(A);
title('EROSAO A x B');
subplot(2,1,2); imshow(E_AB);

% DILATACAO A x B
D_AB = imdilate(A,B);
figure,
subplot(2,1,1); imshow(A);
title('DILATACAO A x B');
subplot(2,1,2); imshow(D_AB);

% ABERTURA A x B
A_AB = imopen(A,B);
figure, 
subplot(2,1,1); imshow(A);
title('ABERTURA A x B');
subplot(2,1,2); imshow(A_AB);

% FECHAMENTO A x B
F_AB = imclose(A, B);
figure, 
subplot(2,1,1); imshow(A);
title('FECHAMENTO A x B');
subplot(2,1,2); imshow(F_AB);

% ALTERNATIVA B
E_C = bwlabel(A);
RGB = label2rgb(E_C, @jet, 'k');
figure, 
subplot(2,1,1); imshow(E_C, 'InitialMagnification','fit');
title('ELEMENTOS CONECTADOS');
subplot(2,1,2); imshow(RGB);


% QUESTAO 2
% EROSAO / DILATACAO 'SQUARE'
ee = strel('square',3); % elemento estruturante
erosao = imerode(A,ee);
dilatacao = imdilate(A,ee);
figure,
subplot(3,1,1); imshow(A);
title('ORIGINAL');
subplot(3,1,2); imshow(erosao);
title('EROSAO SQUARE');
subplot(3,1,3); imshow(dilatacao);
title('DILATACAO SQUARE');

% EROSAO / DILATACAO 'DISK'
ee1 = strel('disk',2); % elemento estruturante
erosao1 = imerode(A,ee1);
dilatacao1 = imdilate(A,ee1);
figure,
subplot(3,1,1); imshow(A);
title('ORIGINAL');
subplot(3,1,2); imshow(erosao1);
title('EROSAO DISK');
subplot(3,1,3); imshow(dilatacao1);
title('DILATACAO DISK');


% QUESTAO 3
% ESQUELETIZACAO
img = imread('spine.tif');
imgc = mat2gray(img);
imge = bwmorph(imgc,'skel',Inf);
figure,
subplot(3,1,1); imshow(img);
title('ORIGINAL');
subplot(3,1,2); imshow(imgc);
title('ESCALA DE CINZA');
subplot(3,1,3); imshow(imge);
title('ESQUELETIZACAO');


% QUESTAO 4
% ESQUELETIZACAO / DILATACAO IMAGEM ANTERIOR
img1 = imread('spine.tif');
imgc1 = mat2gray(img1);
imge1 = bwmorph(imgc1,'skel',Inf);
ee2 = strel('square',2);
dilatacao2 = imdilate(imge1,ee2);
figure,
subplot(4,1,1); imshow(img1);
title('ORIGINAL');
subplot(4,1,2); imshow(imgc1);
title('ESCALA DE CINZA');
subplot(4,1,3); imshow(imge1);
title('ESQUELETIZACAO');
subplot(4,1,4); imshow(dilatacao2);
title('DILATACAO DA ESQUELETIZACAO');


% QUESTAO 5
% ALTERNATIVA A
% EROSAO ATÉ CIRCULOS SE DESCONECTAREM
img2 = imread('circles.png');
ee3 = strel('disk',10); % elemento estruturante
erosao2 = imerode(img2,ee3);
figure, 
subplot(2,1,1); imshow(img2);
subplot(2,1,2); imshow(erosao2);

% ALTERNATIVA B
% AVALIACAO DOS ELEMENTOS CONECTADOS RESULTADO ANTERIOR
AV = bwlabel(erosao2);
RGB = label2rgb(AV, @jet, 'k');
figure, 
subplot(2,1,1); imshow(AV, 'InitialMagnification','fit');
subplot(2,1,2); imshow(RGB);


% QUESTAO 6

img3 = imread('pillsetc.png');
BW = im2bw(img3, graythresh(img3));
[B,L] = bwboundaries(BW,'noholes');
figure,
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

% LISTA DE EXECICIOS 2
% QUESTAO 1
img4 = imread('circuit.tif');
[c,t] = edge(img4,'prewitt');
[c1,t] = edge(img4,'canny');
figure,
subplot(1,3,1); imshow(img4);
title('ORIGINAL');
subplot(1,3,2); imshow(c);
title('CONTORNO PREWITT');
subplot(1,3,3); imshow(c1);
title('CONTORNO CANNY');

% QUESTAO 2
img5 = imread('coins.png');
[c2,t] = edge(img5,'sobel');
[c3,t] = edge(img5,'canny');
figure,
subplot(1,3,1); imshow(img4);
title('ORIGINAL');
subplot(1,3,2); imshow(c2);
title('CONTORNO SOBEL');
subplot(1,3,3); imshow(c3);
title('CONTORNO CANNY');

% QUESTAO 3
clear all
img6 = imread('igreja.tif');
w1 = [-1 -1 -1; 2 2 2; -1 -1 -1]; % horizontal
w2 = [-1 -1 2; -1 2 -1; 2 -1 -1]; % 45 graus
w3 = [-1 2 -1; -1 2 -1; -1 2 -1]; % vertical
% alterar a variavel 'w' para cada modo
g1 = imfilter(double(img6),w3);
T = graythresh(img6);
g1 = g1 >= T-40;
figure,imshow(double(g1));
title('RESULTADO');
