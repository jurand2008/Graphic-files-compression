function [ik] = znajdzNajblizszeCentroidy(r, centroidy)
    %Okreœlenie pocz¹tkowych zmiennej i macierzy zer
    K = size(centroidy, 1);
    ik = zeros(size(r, 1), 1);
    %algorytm Euklidesa na znalezienie najbli¿szego centroidu
    for i = 1:size(r, 1)
        index = zeros(1, K);
        for j = 1:K
            % Liczona jest odleg³oœæ pomiêdzy danym punktem ( wartoœæi¹
            % RGB) a ka¿dym centroidem z osobna
            index(1, j) = sqrt(sum(power((r(i, :) - centroidy(j, :)), 2)));
        end 
        % Ustalana jest najbli¿sza/najmniejsza odgleg³oœæ pomiêdzy punktem
        % a centroidem a nastêpniej jest ona przyporz¹dkowana do parametru
        % idx
        [d, id] = min(index);
        ik(i, 1) = id;
    end
end
