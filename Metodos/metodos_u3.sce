function y = biseccion(f, precision, a, b, kmax, kactual)
    if kactual == kmax then
        printf("Se alcanzo el maximo de iteraciones. ");
    else
        c = (a+b)/2;
        if b-c <= precision then
            y = c
            printf("La raiz es %d alcanzada con %d iteraciones. ", c, kactual)
        else
            if f(a)*f(c) < 0 then
                y = biseccion(f, precision, a, c, kmax, kactual + 1)
            else
                y = biseccion(f, precision, c, b, kmax, kactual + 1)
            end
         end
    end
endfunction

function y = biseccion_it(f, precision, a, b, kmax)
    
    for kactual = 1 : kmax
        c = (a + b) / 2;
        if b-c <= precision then
            y = c;
            printf("La raiz es %f, y fue alcanzada con %d iteraciones. ", c, kactual);
            return
        else
            if f(a) * f(c) < 0 then
                b = c;
            else
                a = c;
            end
        end
    end
    printf("Se alcanzo el maximo de iteraciones. La raiz que quedo: %f", c);
        
endfunction

function y = secante_it(f, precision, a, b, kmax)
    for kactual = 1:kmax
        c = b - f(b) * ((b - a)/(f(b) - f(a)));
        if abs(f(c)) < precision then
            y = c;
            printf("La raiz es %f y fue alcanzada con %d iteraciones. ", c, kactual);
            break;
        end
        a = b;
        b = c;
        
    end
    printf("Se alcanzo el maximo de iteraciones. La raiz que quedo: %f", c);
endfunction

function y = newton_it(f, precision, a, kmax)
    for kactual = 1:kmax
        c = a - (f(a)/numderivative(f,a,0.000001));
        if abs(f(c)) < precision then
            y = c;
            printf("La raiz es %f y fue alcanzada con %d iteraciones. ", c, kactual);
            break;
        end
        a = c;
    end
    printf("Se alcanzo el maximo de iteraciones. La raiz que quedo: %f", c);
endfunction

function y = punto_fijo_it(f, precision, g, a, kmax)
    for kactual = 1:kmax
        c = g(a);
        if abs(f(c)) < precision then
            y = c;
            printf("La raiz es %f y fue alcanzada con %d iteraciones. ", c, kactual);
            break;
        end
        a = c;
    end
    printf("Se alcanzo el maximo de iteraciones. La raiz que quedo: %f", c);
endfunction

function result = metodo_newton_multivariable(f, x0, tolerancia, maxIter)  

    numIters = 0; // Numero de iteraciones del metodo

    J = numderivative(f, x0); // Calculamos la matriz Jacobiana de f en x0
    J = inv(J); // Inverimos la matriz

    xn = x0 - J * f(x0); // Calculamos una iteracion del metodo

    while norm(f(xn)) > tolerancia && numIters < maxIter then // Usamos norma Euclidea

        numIters = numIters + 1

        x0 = xn

        J = numderivative(f, x0);
        J = inv(J);

        xn = x0 - J * f(x0); // Calculamos otra iteracion del metodo

    end

    result = xn; // Resultado conseguido


end

function y = fbrian(x)
    y(1) = exp(x(1)) * x(2);
    y(2) = x(1) + x(2);
endfunction

function y = newton_multi_it(f, x0, iter, tol, h)
    J = numderivative(f,x0,h);
    x1 = x0 - (inv(J)*f(x0))';
    i = 1;
    
    while (norm(f(x0),2) > tol) && (i < iter)
        x0 = x1;
        J = numderivative(f,x0,h);
        x1 = x0 - (inv(J)*f(x0))';
        i = i + 1;
    end
    
    y = x1;
    
endfunction

function y = regular_falsi_it(f, precision, a, b, kmax)
    
    for kactual = 1:kmax
        c = b - f(b) * ((b - a)/(f(b) - f(a)));
        if abs(f(c)) < precision then
            y = c;
            printf("La raiz es %f y fue alcanzada con %d iteraciones. ", c, kactual);
            break;
        end
        if f(a)*f(c) < 0 then
            b = c;
        else
            a = c;
        end 
    end
    printf("La raiz que quedo es %f, no fue alcanzada. ", c );
    
    
    
    
endfunction
