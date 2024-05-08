function create_plot(A,B)
    hold off;
    clf;
    hold on;

    title('Konvergence rezidua');
    xlabel('Počet iterací');
    ylabel('Reziduum');
    legend('Location','northeastoutside')

    [x,flag,rr,it,rv] = jacobi(A,B, 1e-7, 1000);
    if (flag ~= 4)
        semilogx(rv, 'DisplayName','Jacobi');
    end
    [x,flag,rr,it,rv] = gauss_seidel(A, B, 1e-7, 1000);
    if (flag ~= 4)
        semilogx(rv, 'DisplayName','Gauss Seidel');
    end
    [x,flag,rr,it,rv] = pcg(A, B, 1e-7, 1000);
    if (flag ~= 4)
        semilogx(rv, 'DisplayName','PCG');
    end
    

end
    



