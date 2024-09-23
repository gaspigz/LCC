function r = raices_robustas(p)
    a = coeff(p, 2);
    b = coeff(p, 1);
    c = coeff(p, 2);
    if b > 0 then
        r(1) = (2*c)/(-b + sqrt(b*b-4*a*c));
        r(2) = (-b + sqrt(b*b-4*a*c))/(2*a);
    else
        r(1) = (-b - sqrt(b*b-4*a*c))/(2*a);
        r(2) = (2*c)/(-b - sqrt(b*b-4*a*c));
    end
endfunction

function d = derivar(f, v, n, h)
    if n == 0 then
        d = f(v);
    else
        d = (derivar(f, v + h, n-1, h) - derivar(f, v, n-1, h))/h;
    end
endfunction

function y = cuadrado(x)
    y = x*x;
endfunction

function y = taylor(f, v, n, r)
    if n == 0 then
        y = f(r);
    else
        y = (derivar(f, r, n, 0.001)/factorial(n)) * (v - r) ^ n + taylor(f, v, n-1, r);
    end
endfunction

function y = taylor_exp(v, n, r)
    if n == 0 then
        y = exp(r);
    else
        y = (exp(r)/factorial(n)) * (v - r) ^ n + taylor_exp(v, n-1, r);
    end
endfunction
