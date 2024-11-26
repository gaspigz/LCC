clc
clear

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



// Vector de valor iniciales
x01 = [1.2 ; 2.5]
x02 = [-2 ; 2.5]
x03 = [-1.2 ; -2.5]
x04 = [2 ; -2.5]

// Representamos el sistema:
// x^2 - xy^3 - 9
// 3x^2y - 4 - y^3
function res = sistema(X)
    res = [X(1)^2 - X(1) * X(2)^3 - 9 ; 3*X(1)^2*X(2) - 4 - X(2)^3];
endfunction


// Resolvemos el sistema para cada punto incial

disp(metodo_newton_multivariable(sistema, x01, 0.0001, 10000000));
disp(metodo_newton_multivariable(sistema, x02, 0.0001, 100000));
disp(metodo_newton_multivariable(sistema, x03, 0.0001, 100000));
disp(metodo_newton_multivariable(sistema, x04, 0.0001, 100000)); 
