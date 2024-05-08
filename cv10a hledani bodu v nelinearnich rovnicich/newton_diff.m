function [x, res, k] = newton_diff(f,x0,x1,tol,maxit)
    %sečná metoda
    % f = funkce
    % fp = derivace funkce f
    % x0 = počáteční odhad
    % x1 = počáteční odhad
    % tol = tolerance
    % maxit = maximální počet iterací
    % k = počet iterací
    % x = nalezená hodnota
    % res = vzdalenost od nuly = chyba

    v = zeros(1, maxit+2);
    v(1) = x0;
    v(2) = x1;
    i = 2; % index prvku = k+2
    for k= 1:maxit
        i = i + 1;

        %nahradíme derivaci diferencí
        %Xk = Xk-1 - f(Xk-1) * ( (Xk-1 -Xk-2) / (f(Xk-1) - f(Xk-2)) ) 
        v(i) = v(i-1) - (f(v(i-1))) * ( (v(i-1) - v(i-2)) / (f(v(i-1)) - f(v(i-2))) );

        res = abs(f(v(i)));
        if res < tol
            break;
        end
    end
    x = v(i);
end