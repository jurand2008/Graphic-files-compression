function [centroidy] = uruchomkSrednie(r, poczatkowe_centroidy, max_iter)

[kol rzad] = size(r);
%Rozmiar centroid�w
K = size(poczatkowe_centroidy, 1);
centroidy = poczatkowe_centroidy;
% macierz zerowa
ik = zeros(kol, 1);
%P�tla iteracji k-�rednich, w p�tli wykonywane s� 2 funkcje
for i = 1 : max_iter
%     fprintf('iteracja %d/%d|||', i, max_iter);
    ik = znajdzNajblizszeCentroidy(r, centroidy);
    centroidy = obliczCentroidy(r, ik, K);
end
end
