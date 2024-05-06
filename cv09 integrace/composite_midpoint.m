function I = composite_midpoint(f,a,b,n)
    % f = funkce
    % a = menší interval
    % b = vštší interval
    % n = počet dílů

    velikost_kroku = (b-a) / n ;%velikost jednoho obdelníku
    intervals = a:velikost_kroku:b-velikost_kroku;
    stredy_obdelniku = intervals + velikost_kroku/2;
    vysky_obdelniku = arrayfun(@(x) f(x), stredy_obdelniku); % pro každý obdelník spočítám jeho výšku dosazením do funkce
     I = sum(vysky_obdelniku) * velikost_kroku;%vynasobim obdelniky jejich šířkou
end