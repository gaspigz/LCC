clc;
clear;
funcprot(0); // Para que no salte el Warning cuando se redefinen las funciones en minimos cudarados

// ----------------------------- METODOS UTILIZADOS PARA EL PROBLEMA ------------------

// Funcion que nos devuelve la solucion de un sistema con la eliminacion de Gauss (con pivoteo)
function [S,P,L,U] = eliminacionGaussCompleta(A, B)
    
    [nA,mA] = size(A);
    [nB, mB] = size(B);

    if nA<>mA then
        error('eliminacionGaussCompleta - La matriz A debe ser cuadrada');
        abort;
    end;

     if mA <> nB then
        error("eliminacionGaussCompleta - Dimensiones incompatibles entre A y b");
        abort;
    end;
    
    n = nA;    // Tamaño de la matriz
    a = [A B]; // Matriz del sistema aumentada
    
    // Inicializamos las matrices de la factorizacion
    L = eye(n,n);
    P = eye(n,n);

    // Escalonamos la matriz a (matriz del sistema aumentada)
    for k = [1 : n - 1]  
        
        kpivot = k; // Primero consideramos como el mayor pivot al actual
        maxpivot = abs(a(k,k)); // Valor absoluto del actual pivote
    
        for i = k + 1 : n // Encontramos el mayor pivot en la columna
            if abs(a(i,k)) > maxpivot then
                kpivot = i;
                maxpivot = abs(a(i,k));
            end
        end
        
        // Intercambiamos las filas de a
        temp = a(k, k: n + mB);
        a(k, k: n + mB) = a(kpivot, k: n + mB);
        a(kpivot, k:n + mB) = temp;
        
        // Intercambiamos las filas de L
        temp = L(k, 1:k-1);
        L(k, 1:k-1) = L(kpivot, 1:k-1);
        L(kpivot, 1:k-1) = temp;
                
        // Intercambiamos las filas de P
        temp = P(k,:);
        P(k,:) = P(kpivot,:);
        P(kpivot,:) = temp;
    
        for i = k + 1 : n // Eliminamos los elementos inferiores en la columna
            
            L(i,k) = a(i,k) / a(k,k);
            
            a(i,k : n + mB) = a(i, k : n + mB) - a(k, k : n + mB) * L(i,k);
        end
    end

    // Seteamos la matriz U luego de haber escalonado el sistema
    U = a(1:n , 1:n)

    B = a(1 : n, n + 1 : n + mB);
    
    S = zeros(n, mB);

    S(n , 1 : mB) = B(n, 1 : mB ) / U(n,n);

    for i = [n - 1 : -1 : 1]
        
        S(i, 1 : mB) = (B(i, 1 : mB) - U(i, i + 1 : n) * S(i + 1 : n, 1 : mB)) / U(i,i);
        
    end        


endfunction


// Realiza la aproximacion por minimos cuadrados, utilizando un conjunto de funciones pasados por parametro como strings
function [coeficientes, err] = minimosCuadrados(x, y, funciones);

  m = length(x);

  p = size(funciones)(2);

  A = zeros(m,p);

  // Definimos nuestra familia de funciones
  for j = [1 : p] 
  
    deff("y = f(x)", "y = " + funciones(j));

    // Construimos la primera columna de nuestra matriz
    for i = [1 : m] 
      A(i,j) = f(x(i));
    end
    
  end

  [coeficientes, P, L, U] = eliminacionGaussCompleta(A'*A, A'*y') // Vemos la solucion del sistema At*A*x = At*b

  err = norm(A*coeficientes-y', 2);

endfunction


// Toma los coeficientes y la familia de funciones y nos arma el cuerpo de la funcnion
// como combinacion lineal de la funciones y los coeficientes.
function stringFuncion = construirFuncion(funciones, coeficientes)

  p = size(funciones)(2);

  stringFuncion = "";

  for i = [1 : p - 1]

    stringFuncion = stringFuncion + string(coeficientes(i)) + "*" + funciones(i) + "+";

  end

  stringFuncion = stringFuncion + string(coeficientes(p)) + "*" + funciones(p);

endfunction


// ------------------ RESOLUCION DEL EJERCICIO ------------------

// Declaramos los datos del problema
x = [0 : 1 : 10];
y = [0.68, 0.85, -0.25, -0.76, -0.46, -0.28, 0.76, 0.16, 0.74, -0.42, -0.55];

// Item A: Representamoso graficamente los datos

a = gca();
a.x_location = "origin";
a.y_location = "origin";

subplot(1,3,1);
scatter(x,y); // Representamos los puntos en la grafica.

// Item B

polinomios= ["1" , "x", "x ** 2", "x ** 3"]; // Espacio de funciones polinomicas

// Obtenemos los coeficientes de cada polinomio, y los errores para cada aproximacion
// y luego definimos los polinomios.
[coeficientesP1,error1] = minimosCuadrados(x,y,polinomios(1,1:2)); // Error1 = 1.8651541
pol1 = poly(coeficientesP1, "x", "coeff"); // Pol1 =  0.2790909 -0.0472727x

[coeficientesP2,error2] = minimosCuadrados(x,y,polinomios(1,1:3)); // Error2 = 1.8463417
pol2 = poly(coeficientesP2, "x", "coeff"); // Pol1 =   0.4144056 -0.1374825x +0.009021x²

[coeficientesP3,error3] = minimosCuadrados(x,y,polinomios(1,1:4)); // Error3 =  1.2450390
pol3 = poly(coeficientesP3, "x", "coeff"); // Pol3 =   1.0388811 -1.1297047x +0.2692191x² -0.0173465x³


// Ploteamos los polinomios, para ver como se aproximan
rango = [0 : 0.001 : 10];
subplot(1,3,2);
scatter(x,y);
plot(rango, horner(pol1,rango), "green");
plot(rango, horner(pol2,rango), "red");
plot(rango, horner(pol3,rango), "blue");

// Item C: Hecho en la hoja

// Item D
// Declaro el espacio de funciones por las cuales voy a aproximar mis datos
trigonometricas = ["1", "cos(x)", "sin(x)"];

// Obtengo los coeficientes para cada funcion y el error asociado a la aproximacion

[coefTrig, errorTrig] = minimosCuadrados(x,y,trigonometricas); // coefTrig =[0.0275379, 0.619772, 0.3017352 ]
                                                               // errorTrig = 0.9201901
 
// Definimos la funcion obtenida
deff("y = g(x)", "y = " + construirFuncion(trigonometricas, coefTrig));

// Graficamos los puntos y la aproximacion por minimos cuadrados para ver como se relacionan con los puntos
subplot(1,3,3);
scatter(x,y);
plot(rango, g(rango));
