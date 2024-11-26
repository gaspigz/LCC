function w = trapecio(f,a,b)
    w = (f(a)+f(b))*(b-a)/2;
    
endfunction

function w = trapecio_ext(f,a,b,n)
    h = (b-a)/n;
    w = (f(a)+f(b))/2;
    for i=1:(n-1)
        xi = a + i*h;
        w = w + f(xi);
    end
    w = h*w;
endfunction

// 1c)
function y = f(x)
    y = sin(x)^2;
    
endfunction
