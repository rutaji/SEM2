clear;
A=[5 -2 3 0;-3 9 1 -2;2 -1 -7 1; 4 3 -5 7];
b=[-1 2 3 0.5]';
toler=1e-5;
maxIter=1000;
[x,flag,rr,itr,rv] = jacobi(A,b,toler,maxIter)
[x,flag,rr,itr,rv] = gauss_Seidel(A,b,toler,maxIter)