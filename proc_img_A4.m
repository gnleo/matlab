% INTRODUCAO AO PROCESSAMENTO DE IMAGENS - AULA 4

% SEGMENTACAO

% deteccao de pontos
f = imread('C:\Users\gnleo\Documents\ENG COMPUTACAO\8 SEMESTRE\Processamento de imagens\Figuras\point.tif');
fg = rgb2gray(f);
w = [-1 -1 -1;-1 8 -1;-1 -1 -1];
g = imfilter(fg,w);
BW = im2bw(g);
figure, 
subplot(2,1,1); imshow(fg);
subplot(2,1,2); imshow(BW);


% deteccao de linhas
I = imread('circuit.tif');
px = [-1 0 1;-1 0 1;-1 0 1];
icx = filter2(px,I);
py = px';
icy = filter2(py,I);
figure,
subplot(1,3,1); imshow(I)
subplot(1,3,2); imshow(icy/255)
subplot(1,3,3); imshow(icx/255)

% forma manual, aplicando-se filtros em forma matricial
clear all
f1 = imread('wirebond_mask.tif');
%w = [2 -1 -1; -1 2 -1; -1 -1 2];
%w = [-1 -1 -1; 2 2 2; -1 -1 -1]; % horizontal
%w = [-1 -1 2; -1 2 -1; 2 -1 -1]; % 45 graus
%w = [-1 2 -1; -1 2 -1; -1 2 -1]; % vertical
w = [2 -1 -1; -1 2 -1; -1 -1 2]; % -45 graus
g1 = imfilter(double(f1),w);
T = max(g1(:));
g1 = g1 >= T-40;
figure,imshow([double(f1) double(g1)]);


% deteccao de bordas
% SOBEL
f2 = imread('C:\Users\gnleo\Documents\ENG COMPUTACAO\8 SEMESTRE\Processamento de imagens\Figuras\igreja.tif');
%f2 = imread('C:\Users\gnleo\Pictures\tcc_images\base_dados\neg\WP_20180606_06_54_56_Pro.jpg')
[g2,t] = edge(f2,'sobel');
figure,
subplot(1,2,1); imshow(f2);
subplot(1,2,2); imshow(g2);
% ROBERTS
[g3,t] = edge(f2,'roberts');
figure,
subplot(1,2,1); imshow(f2);
subplot(1,2,2); imshow(g3);
% PREWITT
[g4,t] = edge(f2,'prewitt');
figure,
subplot(1,2,1); imshow(f2);
subplot(1,2,2); imshow(g4);
% LOG
[g5,t] = edge(f2,'log');
figure,
subplot(1,2,1); imshow(f2);
subplot(1,2,2); imshow(g5);
% CANNY
[g6,t] = edge(f2,'canny');
figure,
subplot(1,2,1); imshow(f2);
subplot(1,2,2); imshow(g6);


% SEGMENTACAO DE IMAGENS
f = imread('C:\Users\gnleo\Documents\ENG COMPUTACAO\8 SEMESTRE\Processamento de imagens\Figuras\texto.bmp');
hf = imhist(f);
figure, imshow(f),
figure, plot(hf);
T1 = 0.5*(double(min(f(:)))+double(max(f(:)))); done = false;
while ~done
    g = f >= T1;
    T1next = 0.5*(mean(f(g)) + mean(f(~g))); done = abs(T1 - T1next) < 0.5;
    T1 = T1next;
end
T2 = T1/255;
s1 = im2bw(f,T2); figure, imshow(s1)

