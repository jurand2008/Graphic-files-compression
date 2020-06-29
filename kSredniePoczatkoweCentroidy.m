function [centroidy] = kSredniePoczatkoweCentroidy(r, K)
%Ustawienie pocz¹towego centroidu
centroidy = zeros(K, size(r, 2));
% liczba losowo utworzonych punktów o wartoœæi 1-rozmiar(r)
idxrand = randperm(size(r, 1));
% Punkty zostaj¹ ograniczone do iloœci wybranej przez u¿ytkownika, pierwsze
% k rzêdy zostaj¹ wybrane jako centroidy, wiêæ iloœæ centroidów maleje do
% wartoœci k.
centroidy = r(idxrand(1:K), :);
end




