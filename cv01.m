
float2bin(149.311,10)

function b = float2bin(number,dec_length)
    whole = floor(number);
    decimal = number - whole;
    %% celé číslo
    index= getlowestpowerof2(whole)
    wholeBin = [];
    while index >= 1
        if whole - index >= 0
            wholeBin(end+1) = 1;
            whole = whole - index;
        else
            wholeBin(end+1) = 0;
        end
        index = index / 2;
    end
    %% desetiné číslo
    decimalBin=[];
    for i = 1:dec_length
        result = decimal * 2;
        if result >= 1 
            decimalBin(end + 1) = 1;
        else
            decimalBin(end +1) = 0;
        end
        decimal = result - floor(result);
        
    end
    %% výpis
    b = sprintf("%d",wholeBin) + "." + sprintf("%d",decimalBin);
end

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