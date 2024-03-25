function [x,flag,rr,itr,rv] = jacobi(A,b,toler,maxIter)
    x = zeros(size(b,1),1);
    n=size(x,1);
    itr=0;
    rv = zeros(maxIter,1);
    flag = 1;
    while itr<maxIter

        xold=x;
        for i=1:n% pro každýřádek
            no_diagonal_sum=0; %suma prvku na diagonale * hodnota proměnné
            for j=1:n %pro každý sloupec
                if j~=i %pro každý prvek co není na diagonále diagonale
                    no_diagonal_sum=no_diagonal_sum+A(i,j)*x(j);
                end
            end
            x(i)=(1/A(i,i))*(b(i)-no_diagonal_sum); % vypočítam nove x
        end
        itr=itr+1;
        normVal=abs(xold-x); % vypočítam rozdíl stareho x s novym a porovnam s toleranci
        rr = normVal;
        if normVal < toler
            flag = 0;
            break
        end
        
    end
    
end