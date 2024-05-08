poloosa_A = 1;
poloosa_B = 0.5;
f = @(x) (x.^2 / 1) + (log(x + 0.5).^2 / 0.25) - 1;
g = @(x)log(x + 0.5);
tf = @(x) (log(x + 0.5).^2 / poloosa_B.^2) - 1;


g_domain = -0.4:0.1:1;
f_domain = -0.4:0.01:1;

clf;
hold on;
xlim([-1 1]);
ylim([-1 1]);
yline(0);
xline(0);

t = linspace(0, 2 * pi);
x = poloosa_A * cos(t);
y = poloosa_B * sin(t);
plot(x, y);

plot(f_domain, f(f_domain));
plot(g_domain, g(g_domain));
plot(f_domain,tf(f_domain));