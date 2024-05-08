function x = plot_point(f, fp, g, a, b, tol, lim)
    [x_bisection] = bisection(f, a, b, tol, lim);
    [x_secna] = newton(f, fp, a, tol, lim);
    [x_newton] = newton_diff(f, a, b, tol, lim);
    plot([x_bisection x_secna x_newton], [f(x_bisection) f(x_secna) f(x_newton)], '.', 'markersize', 20);
    plot([x_bisection x_secna x_newton], [g(x_bisection) g(x_secna) g(x_newton)], '.', 'markersize', 20);
    x = (x_bisection + x_secna + x_newton) / 3;
end