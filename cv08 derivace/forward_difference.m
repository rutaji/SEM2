function [fd] = forward_difference(hodnota, nasledujici_hodnota,h)
    %hodnota = první bod (rychlost)
    %nasledujici_hodnota = následující bod (rychlost)
    %h = vzdalenost mezi body 

    %h = čas od bodu a do bodu b
    fd = (nasledujici_hodnota - hodnota) / h; % ( f(x0+h) - f(x0) ) / h 
end