clear all;
xlim([0 5])

m = 70 + 15;
v = 30/3.6; %rychlost v m/s
P = 20;
k = 0.516;
tol = 1e-8;

f = @(t,vi) (P - k*vi^2);
y0 = v;
%matlab 
hold on;
[t,y] = ode45(f,[0,5],y0);
plot(t,y*3.6)
%implicitní
[t,y] = euler_imp(f,0,5,y0,0.001);
plot(t,y*3.6)
v_end = y(end) *3.6;
%zpětná/explicitní
[t,y] = euler_imp(f,0,5,y0,0.001);
plot(t,y*3.6)

stable_point = 0;
for i = 2:length(y)
    if abs(y(i) - y(i-1)) < tol
        stable_point = i;
        break;
    end
end
legend('ode45','implicitní','explicitní')
plot(t(stable_point),y(stable_point)*3.6,'r*')

saveas(gcf, "graph.png");
