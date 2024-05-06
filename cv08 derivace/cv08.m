clear all;
data = load("velocity.mat", '-ascii');

cas = data(1, :);
rychlost = data(2, :);
rychlost = rychlost ./ 3.6; %převod z km/h na m/s

yyaxis left;
plot(cas, rychlost, "DisplayName", "Zrychlení");
xlabel("Čas");
ylabel("Rychlost");

a = zeros(1, length(cas));

a(1) = forward_difference(rychlost(1),rychlost(2),cas(2)-cas(1)); % první bod => popředná derivace

for i = 2:length(cas) - 1
    a(i) = central_difference(rychlost(i-1),rychlost(i+1),cas(i+1)-cas(i-1)); %centrální derivace,protože můžu
end

a(end) = backward_difference(rychlost(end),rychlost(end-1),cas(end)-cas(end -1)); %poslední bod => zpětná derivace

yyaxis right;
plot(cas, a, "DisplayName", "Závislost zrychlení na čase");
ylabel("Zrychlení");

z = find(sign(a(1:end-1)) ~= sign(a(2:end)));%vypíšu všechny časy kde se změnilo znaménko
z = arrayfun(@(x) (cas(x+1) + cas(x)) / 2, z);

for i=1:length(z)
    xline(z(i), 'HandleVisibility','off', "LineStyle", "--");
end
legend("Location", "best");

saveas(gcf, "graph_acceleration.png");

