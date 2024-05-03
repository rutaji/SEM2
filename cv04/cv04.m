Stranky = [0 1 1 1 1; 1 0 1 0 0; 1 1 0 0 1; 1 0 1 0 1; 0 0 1 0 0];

function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)

    x = y0;
    
    if (isrow(x))
        x = x';
    end

    firstLambda = NaN;

    for j=1:maxit
        % Normalizovaní vektoru x
        u = x / norm(x);
        % Maticové násobení matice A a normalizovaného vektoru u
        x = A * u;
        % Násobení transponovaného normalizovaného vektoru u a (vektoru) aproximace x
        lambda = u' * x;
        % Samotný normalizovaný vektor je vlastním vektorem matice
        vec = u;

        if (isnan(firstLambda))
            firstLambda = lambda;
            continue;
        elseif (abs(lambda - firstLambda) < tol)
            break;
        end
    end
end
