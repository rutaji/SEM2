clear all;
% elipsa
poloosa_A = 1;
poloosa_B = 0.5;
g = @(x)log(x + 0.5);
g_domain = -0.4:0.1:1;

% funkce F
f_domain = -0.4:0.01:1;
tolerance = 1e-7;
limit = 1000;
f = @(x) (x.^2 / poloosa_A.^2) + (log(x + 0.5).^2 / poloosa_B.^2) - 1; % popisuje hledané průsečíky - elipsa + g
fp = @(x) (2.*x / poloosa_A^2) + (2 .* g(x)) / (poloosa_B.^2 .* (x + 0.5));

clf;
hold on;
xlim([-1 1]);
ylim([-1 1]);
yline(0);
xline(0);

%elipsa plot
uhel = linspace(0,2*pi);
x = poloosa_A * cos(uhel);
y = poloosa_B * sin(uhel);
plot(x,y)

plot(f_domain,f(f_domain))
plot(g_domain,g(g_domain))

x1 = plot_point(f,fp,g,0,0.2,tolerance,limit);
x2 = plot_point(f,fp,g,0.7,0.95,tolerance,limit);
saveas(gcf, "graph.png");



