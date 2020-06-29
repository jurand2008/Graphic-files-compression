% Czas wykonywania kompilacji programu zale�y od rozmiaru obrazu. Im
% wi�kszy obraz tym d�u�sza czas trwania programu.
clc
clear
close all;
format compact
tic;
%�adowanie obrazu z folderu
obraz = double(imread('images.jpg'));
% Obraz zostaje podzielony przez 255, poniewa� warto�ci RGB s� zapisywane w
% zakresie 255 co pozwoli otrzyma� warto�ci z przedzia�u (0-1)
obraz = obraz/255;
%Policzony zostaje rozmiar obrazu
rozmiar_obrazu = size(obraz);
%Przewymiarowanie macierzy z 3-wymiarowej do 2-wymiarowej, ten spos�b b�dzie
%tylko jedna warto�� piksela w rz�dzie
r = reshape(obraz, [], 3);
% Liczba klastr�w, nadana przez u�ytkownika. Jest to ilo�� kolor�w/klastrow jak�
% u�ytkownik chce otrzyma� na obrazie
K = 6;
%Maksymalna ilo�� iteracji k-�rednich wa�onych
max_iter = 10;
%Ustalanie pierwszych centroid�w
poczatkowe_centroidy = kSredniePoczatkoweCentroidy(r, K);
% Algorytm k-�rednich-
[centroidy] = uruchomkSrednie(r, poczatkowe_centroidy, max_iter);
% Ponowne znalezienie najbli�szych centroid�w
ik = znajdzNajblizszeCentroidy(r, centroidy);
%grupowanie warto�ci do konkretnych centroid�w oraz tworzenie ko�cowej
%macierzy r_odzyskane
r_odzyskane = centroidy(ik, :);

% Macierz 2d -> 3d, w celu uzyskania warto�ci RGB
r_odzyskane = reshape(r_odzyskane, rozmiar_obrazu(1),rozmiar_obrazu(2), 3);

% Obraz przed kompresj�
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