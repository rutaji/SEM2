function b = float2bin(number,dec_length)
    whole = floor(abs(number));
    decimal = abs(number) - whole;
    nodecimal = ~decimal == 0;
    %% celé číslo
    index= getlowestpowerof2(whole);
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
    if nodecimal
        for i = 1:dec_length
            result = decimal * 2;
            if result >= 1 
                decimalBin(end + 1) = 1;
            else
                decimalBin(end +1) = 0;
            end
            decimal = result - floor(result);
            
        end
        while true
            if  length(decimalBin) < 1
                break
            end
            if decimalBin(end) == 0
                decimalBin = decimalBin(1:end-1);
            else
                break
            end
        end
    end
    %% výpis
    b =  num2str(wholeBin);
    if length(decimalBin) > 1
        b = append(b,'.', num2str(decimalBin));
    end
    if number < 0
        b = append('-',b);
    end
    b = b(b ~= ' ');
end