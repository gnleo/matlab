% Probalidade P(w > 0.5) e P(w < 0.3) 
clear
W2 = rand(100,1);
W3 = rand(1000,1);
W4 = rand(10000,1);
cont1_2 = 0;
cont2_2 = 0;
for a=1 : 100
    if  W2(a) > 0.5
        cont1_2 = cont1_2 +1;
    end
    if W2(a) < 0.3
        cont2_2 = cont2_2 +1;
    end
end
P1_2 = cont1_2/100;
P2_2 = cont2_2/100;

cont1_3 = 0;
cont2_3 = 0;
for b=1 : 1000
    if  W3(b) > 0.5
        cont1_3 = cont1_3 +1;
    end
    if W3(b) < 0.3
        cont2_3 = cont2_3 +1;
    end
end
P1_3 = cont1_3/1000;
P2_3 = cont2_3/1000;

cont1_4 = 0;
cont2_4 = 0;
for c=1 : 1000
    if  W4(c) > 0.5
        cont1_4 = cont1_4 +1;
    end
    if W4(c) < 0.3
        cont2_4 = cont2_4 +1;
    end
end
P1_4 = cont1_4/10000;
P2_4 = cont2_4/10000;