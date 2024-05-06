function [fd] = backward_difference(hodnota, predchozi_hodnota,h)
    %hodnota = první bod (rychlost)
    %predchozi_hodnota = predchozi bod (rychlost)
    %h = vzdalenost mezi body 

    %h = čas od bodu a do bodu b
    fd = (hodnota - predchozi_hodnota) / h; % ( f(x0+h) - f(x0) ) / h 
end