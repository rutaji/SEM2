function [k,q] = lin_regression(x,y)
    if (isrow(x)) x = x'; end %data dostanu jako řádek nebo sloupec <= oba případy ošetřete
    if (isrow(y)) y = y'; end

    n = length(x);

    sumX = sum(x); % Σxi
    sumY = sum(y); % Σyi
    sumXY = sum(x .* y); %  Σxiyi
    sum_X_squares = sum(x.^2); %   Σxi^2

    jmenovatel = n * sum_X_squares - sumX^2; % n *  Σxi^2 - ( Σxi)^2

    k = (n * sumXY - sumX * sumY) / jmenovatel; % n * Σxiyi - Σxi * Σyi
    q = (sum_X_squares * sumY - sumX * sumXY) / jmenovatel; % Σxi^2 * Σyi - Σxi * Σxiyi 
    
end