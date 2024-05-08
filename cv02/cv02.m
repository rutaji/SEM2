
clear all

test_matrix = [
    1,2,3;
    -4,5,6;
    7,8,1]
P = [1 1 2; 1+1e-16 1 2; 1 1 1];
T = [0 2 0;1 1 0;0 0 3];
A = full(gallery('lehmer',25));
S = full(gallery('poisson',10));%nefunguje au

%nastavení
vel_rovnice = 100
vybrana_matice = S

rovnice(1,1:vel_rovnice) = 1;
rownice_sloup(1:vel_rovnice,1) = 1;

[x,U] = gauss_elim(vybrana_matice,rovnice);

[L,matlabU] = lu(vybrana_matice);
matlabX = linsolve(vybrana_matice,rownice_sloup)

