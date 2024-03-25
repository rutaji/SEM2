function [x,flag,rr,itr,rv] = gauss_Seidel(A,b,toler,maxIter)
    x = zeros(size(b,1),1);
    n=size(x,1);
    itr=0;
    rv = zeros(maxIter,1);
    flag = 1;
    while itr<maxIter

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