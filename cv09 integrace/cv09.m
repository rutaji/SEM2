clear all;
composite_midpoint_test_function = @(x) sin(x) ./ x;
rozliseni = arrayfun(@(x) 10^x, 1:6);
matlab_vysledek = integral(composite_midpoint_test_function,0,1);
moje_vysledky =  arrayfun(@(n) composite_midpoint(composite_midpoint_test_function, 0, 1, n), rozliseni);
rozdil = matlab_vysledek - moje_vysledky;

CMR_tabulka = array2table([rozliseni', moje_vysledky', rozdil'], "VariableNames",{'rozliseni', 'moje vysledky', 'chyba'})

adapt_trapz_test_function1 =  @(x) 2*x + 1;
adapt_trapz_test_function2 = @(x) (1/2 + cos(x)) .* sin(x);

integralG_value = integral(adapt_trapz_test_function1, -1, 1)
[I, k] = adapt_trapz(adapt_trapz_test_function1, -1, 1, 1000, 1e-10)

integralH_value = integral(adapt_trapz_test_function2, 0, 1);
[J, m] = adapt_trapz(adapt_trapz_test_function2, 0, 1, 1000, 1e-10)

array2table([[k m]', [I J]', ([I J] - [integralG_value integralH_value])'], "VariableNames",{'počet iterací', 'moje vysledky', 'chyba'})