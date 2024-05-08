function [x,res,k] = newton(f,fp,x0,tol,maxit)
    % f = funkce
    % fp = derivace funkce f
    % x0 = počáteční odhad
    % tol = tolerance
    % maxit = maximální počet iterací
    % k = počet iterací
    % x = nalezená hodnota
    % res = vzdalenost od nuly (chyba)

    posledni_X = x0;
    for k = 1:maxit
        x = posledni_X - (f(posledni_X)/fp(posledni_X)); %xk = xk-1 - f(fk-1)/f'(fk-1)
        res = abs(posledni_X - x);
        if res < tol
            break
        end
        posledni_X = x;
    end
end