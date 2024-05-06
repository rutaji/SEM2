function [I,k] = adapt_trapz(f,a,b,maxlevel,tol)
    % f = funkce
    % a = menší interval
    % b = větší interval
    % maxlevel = maximální počet iterací
    % tol = požadovaná tolerance
    % I = vaproximovaná hodnota integrálu
    % k = číslo iterace

     Posledni_aproximace = 0;
     for k = 0:maxlevel
        krok = (b-a)/2^k; % počet lichoběžníků se zdvojnásobí s každou iterací
        lichobezniky = a:krok:b;

        lichobeznik_vyska = arrayfun(@(x) f(x), lichobezniky);
        lichobeznik_vyska(2:end-1) = lichobeznik_vyska(2:end-1) .*2 ; %vynasobim všechny steny (krome prvni a posledni), protože se vyskytuji ve vzorci dvakrat s=(a+c)*v/2
        I = (sum(lichobeznik_vyska) * (krok))/2; % s=(a+c)*v / 2
        if (abs(I - Posledni_aproximace) < tol)
            break;
        end
        Posledni_aproximace = I;
     end
end