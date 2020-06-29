function [ik] = znajdzNajblizszeCentroidy(r, centroidy)
    %Okre�lenie pocz�tkowych zmiennej i macierzy zer
    K = size(centroidy, 1);
    ik = zeros(size(r, 1), 1);
    %algorytm Euklidesa na znalezienie najbli�szego centroidu
    for i = 1:size(r, 1)
        index = zeros(1, K);
        for j = 1:K
            % Liczona jest odleg�o�� pomi�dzy danym punktem ( warto��i�
            % RGB) a ka�dym centroidem z osobna
            index(1, j) = sqrt(sum(power((r(i, :) - centroidy(j, :)), 2)));
        end 
        % Ustalana jest najbli�sza/najmniejsza odgleg�o�� pomi�dzy punktem
        % a centroidem a nast�pniej jest ona przyporz�dkowana do parametru
        % idx
        [d, id] = min(index);
        ik(i, 1) = id;
    end
end
