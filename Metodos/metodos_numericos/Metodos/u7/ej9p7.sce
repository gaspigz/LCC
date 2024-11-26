function w = roots_cheby(n)
    
    for i=0:(n-1) do
        w(i+1) = cos((2*i+1)*%pi/(2*n));
    end
endfunction

function w = roots_cheby_ab(n,a,b)
    
    for i=0:(n-1) do
        w(i+1) = cos((2*i+1)*%pi/(2*n));
    end
    w = ((b-a).*w + (b+a))./2;
endfunction

function w = cheby(n)
endfunction

function p = DD_newton(x,y)
    r = poly(0,"x");
    p = 0;
    n = length(x);
    for i=n:(-1):2
        p = (p+DD(x(1:i),y(1:i)))*(r-x(i-1));
    end
    p = p + y(1);
endfunction

// Eje 11:
n = 4;
nodos_cheby = roots_cheby_ab(n+1,0,%pi/2);
nodos_equidist = 0:%pi/(2*n):%pi/2;
p_cheby = DD_newton(nodos_cheby, cos(nodos_cheby));
p_equidist = DD_newton(nodos_equidist, cos(nodos_equidist));


xx = 0:0.01:(%pi/2)

er_cheby = cos(xx) - horner(p_cheby, xx);
er_equidist = cos(xx) - horner(p_equidist, xx);
plot2d(xx,[er_cheby' er_equidist'], leg="Cheby@equidist");

