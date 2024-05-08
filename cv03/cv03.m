clear all;

create_plot(full(gallery('poisson',5)),ones(25,1))
saveas(gcf, "graph_poisson.png");

create_plot(full(gallery('lehmer',20)),ones(20,1))
saveas(gcf, "graph_lehmer.png");

create_plot(full(gallery('dorr',5)),ones(5,1))
saveas(gcf, "graph_dorr.png");


