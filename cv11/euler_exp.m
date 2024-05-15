function [t,y] = euler_exp(f,a,b,y0,h)
    % f - je funkce f(t,y) diferenční rovnice závislá na t (nezávislá proměná) a y (závislá proměná)
    % a b - interval
    % y0 - počáteční podmínka
    % h - diskreditační krok
    % t - diskretizace
    % y - hodnoty y v diskrétních časech t


    n = (b-a)/h;
    yi = y0;
    ti = a;
    y = zeros([ceil(n)+1,1]);
    t = zeros([ceil(n)+1,1]);
    y(1) = y0;
    t(1) = a;

    for i = 2:n+1
    yi = yi + h* f(ti,yi);
    ti = ti  + h;
    y(i) = yi;
    t(i) = ti;
    end

    %code critic adaptzer
    y = y';
    t = t' ;   

end