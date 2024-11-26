function v = TnExt(f,a,b,c,d)
    h = (b-a)*(d-c)/4;
    v = h * (f(c,a)+f(c,b)+f(d,a)+f(d,b));
endfunction

function v = DobleTn(f,a,b,c,d,n,m)
    h = (b-a)/n;
    deff("z = fxa(y)","z=f("+string(a)+",y)");
    deff("z = fxb(y)","z=f("+string(b)+",y)");
    v = Tn(fxa,c(a),d(a),m)/2 + Tn(fxb,c(b),d(b),m)/2;
    for i =1:n-1
        xi = a + i*h;
        deff("z = fxi(y)","z=f("+string(xi)+",y)");
        v = v + Tn(fxi,c(xi),d(xi),m);
    end
    v = h*v;
endfunction

function y = cx(x)
    y = -sqrt(2*x-x*x);
endfunction

function y = dx(x)
    y = sqrt(2*x-x*x);
endfunction

function y = uno(x,y)
    y = 1;
    
endfunction
