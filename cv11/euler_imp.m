function [t,y] = euler_imp(f,a,b,y0,h)
    
    n = (b-a)/h;
    yi = y0;
    ti = a;
    y = zeros([ceil(n)+1,1]);
    t = zeros([ceil(n)+1,1]);
    y(1) = y0;
    t(1) = a;

    for i = 2:n+1
    fn =  @(ynp1) yi + h * f(ti+h, ynp1) - ynp1;
    [yi1,~,~] = newton_diff(fn,yi-h,yi+h,1e-6,1000);
    yi = yi + h* f(ti + h,yi1);
    ti = ti  + h;
    y(i) = yi;
    t(i) = ti;
    end

    %code critic adaptzer
    y = y';
    t = t' ; 

end