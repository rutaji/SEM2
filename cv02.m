test_matrix = [
    1,2,3;
    4,5,6;
    7,8,9]
gauss_elim(test_matrix)
X,U = gaus(test_matrix)

function [x, U] = gauss_elim(A,b)
    tolerance = 0.1*10^-10
    for i = 1:size(A)
        A=sortrows(A,i,"descend")
        first_val = A(i,i) %vybral jsem první řádek
        if first_val < abs(tolerance)
            continue
        end
        for x = i+1:size(A)%počítám ostatní řádky
            multiplier = A(x,i)/first_val
            for xx = i:size(A)
                A(x,xx)= A(x,xx)-A(i,xx)*multiplier
            end
        end
    end
    U=A
end 