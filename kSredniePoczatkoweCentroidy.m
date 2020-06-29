function [centroidy] = kSredniePoczatkoweCentroidy(r, K)
%Ustawienie pocz�towego centroidu
centroidy = zeros(K, size(r, 2));
% liczba losowo utworzonych punkt�w o warto��i 1-rozmiar(r)
idxrand = randperm(size(r, 1));
% Punkty zostaj� ograniczone do ilo�ci wybranej przez u�ytkownika, pierwsze
% k rz�dy zostaj� wybrane jako centroidy, wi�� ilo�� centroid�w maleje do
% warto�ci k.
centroidy = r(idxrand(1:K), :);
end




