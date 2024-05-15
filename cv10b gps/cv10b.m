clear all;

% pozice satelitu
X1 = [20180; 21800; 24600];
X2 = [25300; 21400; 23000];
X3 = [22200; 20200; 22600];

% vzdalenost satelitu
d1 = 3.853416925275540e+04;
d2 = 4.030272199244115e+04;
d3 = 3.753709365414429e+04;

syms y2 z1 x1 x2 y1 z2;
eur_vzdalenost_sym = sqrt((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2);
eur_vzdalenost = matlabFunction(eur_vzdalenost_sym);
d = @(a, b) eur_vzdalenost(a(1), b(1), a(2), b(2), a(3), b(3));

F = @(x) [
    d(x, X1) - d1;
    d(x, X2) - d2;
    d(x, X3) - d3];

Jac = jacobian(eur_vzdalenost_sym, [x1 y1 z1]);
J = @(x) [
    double(subs(Jac, [x1 y1 z1 x2 y2 z2], [x(1) x(2) x(3) X1(1) X1(2) X1(3)]));
    double(subs(Jac, [x1 y1 z1 x2 y2 z2], [x(1) x(2) x(3) X2(1) X2(2) X2(3)]));
    double(subs(Jac, [x1 y1 z1 x2 y2 z2], [x(1) x(2) x(3) X3(1) X3(2) X3(3)]))];

[x,k] = newton_raphson(F, J, [0; 0; 0;], 1e-7, 1000)

