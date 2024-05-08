function [x,flag,rr,it,rv] = gauss_seidel(A,b,toler,maxIter)
    x = b;
    n=size(x,1);
    it=0;
    rv = zeros(maxIter,1);
    rv(1) = norm(b - A * x) / norm(b);
    flag = 1;
    while it<maxIter

        xold=x;
        for i=1:n% pro každýřádek
            no_diagonal_sum=0; %suma prvku na diagonale * hodnota proměnné
            % pro sloupce
            for j=1:i-1
                no_diagonal_sum=no_diagonal_sum+A(i,j)*x(j);
            end
            for j=i+1:n
                no_diagonal_sum=no_diagonal_sum+A(i,j)*xold(j);
            end

             x(i)= -1/A(i,i) * (no_diagonal_sum - b(i));  % vypočítam nove x
        end
        it=it+1;
        rr= norm(b - A * x) / norm(b); % vypočítam rozdíl stareho x s novym a porovnam s toleranci
        rv(it+1) = rr;
        if rr < toler
            flag = 0;
            break
        end
        if isnan(rr) || isinf(rr)
            flag = 4;
            break;
        end
        

    end
    rv = rv(rv ~= 0);
    
end