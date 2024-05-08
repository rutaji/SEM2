function [x,flag,rr,it,rv] = jacobi(A,b,toler,maxIter)
    n = length(b); %počet rovnic
    x = zeros(n, 1); %momentální výsledek
    x_new = zeros(n, 1); % nový výsledek
    rv = zeros(maxIter+1,1);
    flag = 1;
    rv(1) = norm(b - A * x) / norm(b);

    for it= 1:maxIter
        x = x_new;
        for i = 1:n % pro každý řádek
            sum = 0;
            for j = 1:n % sečtu každý nediagonální prvek,vynásobený předchozím řešení rovnice
                if j ~= i
                    sum = sum + A(i, j) * x(j);
                end
            end
            x_new(i) = (b(i) - sum) / A(i, i); %vypočtu nové řešení rovnice
        end

        rr = norm(b - A * x) / norm(b); %vzdálenost od  vyřešení rovnic
        rv(it+1) = rr;
        if rr < toler
            flag = 0;
            break;
        end
        if isnan(rr) || isinf(rr)
            flag = 4;
            break;
        end
    end
     rv = rv(rv ~= 0);
end

