function w = DD(x,y)
    // Diferencias divididas
    // y = [f(x0),f(x1),...]
    n = length(x);
    if n==1 then
        w = y(1);
    else
        w = (DD(x(2:n),y(2:n))-DD(x(1:n-1),y(1:n-1)))/(x(n)-x(1));
endfunction

function p = DD_newton(x,y)
    n = length(x);
    xx = poly(0,"x");
    p = 0;
    for j=n:-1:2 // n n- n-2 ... 2
        p = (xx-x(j-1))*(DD(x(1:j),y(1:j)) + p);
        
    end
    p = p + y(1);
endfunction
