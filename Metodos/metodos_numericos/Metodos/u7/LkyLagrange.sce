function y = Lk(x,k)
    [Xn, Xm] = size(x);
    r = [x(1:k-1) x(k+1:Xm)]; // x0...xk-1 xk+1...xm raices del pol.
    p = poly(r,"x","roots"); // Variable x con las raices r
    pk = horner(p,x(k));
    y = p / pk;
endfunction

function z = interpolLagrange(x,y)
    [Xn,Xm] = size(x);
    pol = 0;
    for k=1:Xm
        pol = pol + (Lk(x,k)*y(k));
    end
    z = pol;
endfunction
