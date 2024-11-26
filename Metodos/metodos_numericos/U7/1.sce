function y = Lk(x,k)
    [Xn,Xm] = size(x)
    r = [x(1:k-1) x(k+1:Xm)]
    p = poly(r,"x","roots")
    pk = horner(p,x(k))
    y = p / pk
endfunction

function z = interpolLagrange(x,y)
    [Xn,Xm] = size(x)
    pol = 0
    for k = 1:Xm
        pol = pol + (Lk(x,k)*y(k))
    end
    z = pol
endfunction

function w = DD(x,y)
    // Diferencias divididas
    // y = [f(x0),f(x1),...]
    n = length(x);
    if n==1 then
        w = y(1);
    else
        w = (DD(x(2:n),y(2:n))-DD(x(1:n-1),y(1:n-1)))/(x(n)-x(1));
    end
endfunction

function p = DD_newton(x,y)
    n = length(x);
    xx = poly(0,"x");
    p = 0;
    for j=n:-1:2 // n n-1 n-2 ... 2
        p = (xx-x(j-1))*(DD(x(1:j),y(1:j)) + p);
        
    end
    p = p + y(1);
endfunction

// Lineal
x = [0.2 0.4];
y = [1.2214 1.4918]

pol_int_lag = interpolLagrange(x,y);
pol_int_new = DD_newton(x,y);

res_lag_lin = horner(pol_int_lag, 1/3);
res_new_lin = horner(pol_int_new, 1/3);

// Cubica
x = [0 0.2 0.4 0.6];
y = [1.0 1.2214 1.4918 1.8221]

pol_int_lag = interpolLagrange(x,y);
pol_int_new = DD_newton(x,y);

res_lag = horner(pol_int_lag, 1/3);
res_new = horner(pol_int_new, 1/3);

