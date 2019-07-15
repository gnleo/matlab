% Geracao de amostras aleatorias

clear
w2 = rand(100,1);
w3 = rand(1000,1);
w4 = rand(10000,1);

figure
subplot(3,1,1) ; plot(w2) ; title('W2 100 AMOSTRAS')
subplot(3,1,2) ; plot(w3) ; title('W3 1000 AMOSTRAS')
subplot(3,1,3) ; plot(w4) ; title('W4 10000 AMOSTRAS')
