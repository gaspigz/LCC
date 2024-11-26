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



// Punto de valor inicial
x0 = [-1 ; 4]


// Representamos el sistema:
// 1 + x^2 - y^2 + e^x cos y
// 2xy + e^x sin y
function res = sistema(X)
    res = [1 + X(1)^2 - X(2)^2 + (%e)^(X(1)) * cos(X(2)) ; 2*X(1)*X(2) + (%e)^X(1) * sin(X(2))];
endfunction


// Resolvemos el sistema
disp(metodo_newton_multivariable(sistema, x0, 0.0001, 100000));
