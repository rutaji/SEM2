
clear all

test_matrix = [
    1,2,3;
    4,5,6;
    7,8,1]
P = [1 1 2; 1+1e-16 1 2; 1 1 1];
T = [0 2 0;1 1 0;0 0 3];
A = full(gallery('lehmer',25));
S = full(gallery('poisson',10));%nefunguje au

rovnice(1,1:100) = 1;
rownice_sloup(1:100,1) = 1;

[x,U] = gauss_elim(S,rovnice);

[L,matlabU] = lu(S);
matlabX = linsolve(S,rownice_sloup)

function [B, U] = gauss_elim(A,b)
    tolerance = 0.1*10^-10
    for radek = 1:size(A)%pro každý řádek
        [A,index]=sortrows(A,radek,"descend");
        b=b(index);
        first_val = A(radek,radek) %vybral jsem kontrolní prvek
        if first_val < abs(tolerance)
            continue
        end
        for sloupec = radek+1:size(A)%pro všechny ostatní řádky
            multiplier = A(sloupec,radek)/first_val;
            for xx = radek:size(A,2) %odečtu od všech prvků v řádku
                A(sloupec,xx)= A(sloupec,xx)-A(radek,xx)*multiplier;
            end
            b(sloupec) = b(sloupec) - b(radek)*multiplier;
        end
    end
    
    [U,index]=sortrows(A,"descend");
    b=b(index);
    for promena=size(A):-1:1
        suma_promenych_na_radku = 0
        for prvky_v_radku = promena + 1:size(A)
            suma_promenych_na_radku = suma_promenych_na_radku + b(prvky_v_radku)*U(promena,prvky_v_radku)
        end
        b(promena) = b(promena) - suma_promenych_na_radku
        b(promena) = b(promena)/U(promena,promena)
    end
    B=b
end 