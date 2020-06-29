function [centroidy] = obliczCentroidy(r, ik, K)
    [kol rzad] = size(r);
    centroidy = zeros(K, rzad);
    %P�tla 1-K
    for i = 1:K
        %dla macierzy iwartosc zostaj� wybrane rz�dy macierzy o warto�ci
        %r�wnej i
        iwartosc = ik == i;
        %nast�upje zsumowanie wszytkich tych warto�ci
        suma = sum (iwartosc );
        %iwartosc zostaje poszerzona o dwie dodatkowe kolumny
        iwartosc_mac = repmat(iwartosc, 1, rzad);
        %zostaje policzona warto�� centroidu poprzez przydzielenie warto�ci
        %do konkretnych rz�d�w
        centroidy(i, :) = sum(r .* iwartosc_mac) ./ suma;
    end
end