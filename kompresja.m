% Czas wykonywania kompilacji programu zale¿y od rozmiaru obrazu. Im
% wiêkszy obraz tym d³u¿sza czas trwania programu.
clc
clear
close all;
format compact
tic;
%£adowanie obrazu z folderu
obraz = double(imread('images.jpg'));
% Obraz zostaje podzielony przez 255, poniewa¿ wartoœci RGB s¹ zapisywane w
% zakresie 255 co pozwoli otrzymaæ wartoœci z przedzia³u (0-1)
obraz = obraz/255;
%Policzony zostaje rozmiar obrazu
rozmiar_obrazu = size(obraz);
%Przewymiarowanie macierzy z 3-wymiarowej do 2-wymiarowej, ten sposób bêdzie
%tylko jedna wartoœæ piksela w rzêdzie
r = reshape(obraz, [], 3);
% Liczba klastrów, nadana przez u¿ytkownika. Jest to iloœæ kolorów/klastrow jak¹
% u¿ytkownik chce otrzymaæ na obrazie
K = 6;
%Maksymalna iloœæ iteracji k-œrednich wa¿onych
max_iter = 10;
%Ustalanie pierwszych centroidów
poczatkowe_centroidy = kSredniePoczatkoweCentroidy(r, K);
% Algorytm k-œrednich-
[centroidy] = uruchomkSrednie(r, poczatkowe_centroidy, max_iter);
% Ponowne znalezienie najbli¿szych centroidów
ik = znajdzNajblizszeCentroidy(r, centroidy);
%grupowanie wartoœci do konkretnych centroidów oraz tworzenie koñcowej
%macierzy r_odzyskane
r_odzyskane = centroidy(ik, :);

% Macierz 2d -> 3d, w celu uzyskania wartoœci RGB
r_odzyskane = reshape(r_odzyskane, rozmiar_obrazu(1),rozmiar_obrazu(2), 3);

% Obraz przed kompresj¹
subplot(1, 2, 1);
imagesc(obraz);
title('Obraz oryginalny');

% Obraz po kompresji
subplot(1,2,2);
imagesc(r_odzyskane);
title('Obraz skompresowany');
toc;
disp('czas operacji');
disp(toc);