function b = getlowestpowerof2(number)
    power = 1;
    while number >= power
        power = power *2;
    end
    b = power / 2;
    if b < 1 
        b = 1;
    end
end