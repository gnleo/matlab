% Ordem decrescente

clear

 V = [5 20 10 15];
 for P = 1:3
     for Q = P + 1:4
         A = V(P);
         B = V(Q);
         if B>A
             V(P) = B;
             V(Q) = A;
         end
         [P Q A B V]
     end
 end