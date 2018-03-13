function C_point_1 = collocazione(wing)
% calcola i punti di controllo (collocazione)
% centro del pannello
 
   % trovo l'intersezione delle due rette che congiungono i vertici
for i = 1:size(wing,1)-1
    for j = 1:size(wing,2)-1
        C_point_1(i,j,:) = .5*(wing(i+1,j+1,:)+wing(i,j,:));
    end
end
   
end

