function [fd] = central_difference(predchozi_hodnota,nasleduji_hodnota,h)
    %predchozi_hodnota = predchozi bod (rychlost)
    %nasleduji_hodnota = nasledujici bod (rychlost)
    %h = casovy rozdil predchoziho a nasledujiciho bodu

    fd = (nasleduji_hodnota - predchozi_hodnota) / h; % ( f(x0+h) - f(x0) ) / h 
end