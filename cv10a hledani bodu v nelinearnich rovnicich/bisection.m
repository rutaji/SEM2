function [x,res,k] = bisection(f,a,b,tol,maxit)
    % f = funkce
    % a = dolní hranice
    % b = horní hranice
    % tol = tolerance
    % maxit = maximální počet iterací
    % k = počet iterací
    % x = nalezená hodnota
    % res = abs(f(x)) vzdalenost od nuly

    for k = 1:maxit
        x = (a+b)*0.5; %rozpůlím interval => x je bod uprostřed intervalu
        res = abs(f(x));
        if res < tol
            break
        end

        if sign(f(x)) == sign(f(a))
            a = x;
        else
            b = x;
        end
        
    end
end