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
