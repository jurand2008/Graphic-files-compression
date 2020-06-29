function [centroidy] = obliczCentroidy(r, ik, K)
    [kol rzad] = size(r);
    centroidy = zeros(K, rzad);
    %Pêtla 1-K
    for i = 1:K
        %dla macierzy iwartosc zostaj¹ wybrane rzêdy macierzy o wartoœci
        %równej i
        iwartosc = ik == i;
        %nastêupje zsumowanie wszytkich tych wartoœci
        suma = sum (iwartosc );
        %iwartosc zostaje poszerzona o dwie dodatkowe kolumny
        iwartosc_mac = repmat(iwartosc, 1, rzad);
        %zostaje policzona wartoœæ centroidu poprzez przydzielenie wartoœci
        %do konkretnych rzêdów
        centroidy(i, :) = sum(r .* iwartosc_mac) ./ suma;
    end
end