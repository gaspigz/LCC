clc;
clear;

//exec("../../Metodos/Unidad7/minimosCuadrados.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad4\metodoQR.sci");


x_meses = [1 : 10]

tmax = [32.9 30.8 26.4 24.2 19.2 16.5 19.3 21 23 26.2]
tmin = [19.5 15.5 13.1 9.8 5.7 2.2 5.3 4.7 6 10.5]

tprom = (tmax + tmin) ./ 2;


// Iteam A
m = length(x_meses);

A = ones(m,1);

for i = [1 : 9]

  A = [A ((x_meses') ** i)]; // Vamos calculando la matriz por columnas

end

// Definimos los polinomios de distintos grados inviertiendo la matriz A'A
// y tambien definimos los polinomios invitiendo la matriz R
A3 = A(:,1:4);
pol3 = poly(inv(A3' * A3) * A3' * tmax', "x", "coeff");

[Q,R] = factorizacionQR(A3);
pol3R = poly(inv(R) * Q' * tmax', "x", "coeff");

// ------------------------------------------------------

A5 = A(:,1:6);
pol5 = poly(inv(A5' * A5) * A5' * tmax', "x", "coeff");

[Q,R] = factorizacionQR(A5);
pol5R = poly(inv(R) * Q' * tmax', "x", "coeff");

// ------------------------------------------------------

A7 = A(:,1:8);
pol7 = poly(inv(A7' * A7) * A7' * tmax' ,"x", "coeff");

[Q,R] = factorizacionQR(A7);
pol7R = poly(inv(R) * Q' * tmax', "x", "coeff");

// ------------------------------------------------------

A9 = A(:,1:10);
pol9 = poly(inv(A9' * A9) * A9' * tmax' ,"x", "coeff");

[Q,R] = factorizacionQR(A9);
pol9R = poly(inv(R) * Q' * tmax', "x", "coeff");

// ------------------------------------------------------

// Ahora imprimimos todos los datos

a = gca();
a.x_location = "origin";
a.y_location = "origin";

x = [1:0.1:10]; // Anio 2022

// Imprimimos los polinomios que surgen de invertir A'A
disp(pol3);
disp(pol5);
disp(pol7);
disp(pol9);

subplot(1,2,1);

scatter(x_meses, tprom); // Ploteamos los puntos
scatter(x_meses, tmin);
scatter(x_meses, tmax);

plot(x, horner(pol3, x), "red"); // Ploteamos los polinomios
plot(x, horner(pol5, x),"blue");
plot(x, horner(pol7, x),"green");
plot(x, horner(pol9, x),"black");

// Imprimimos los polinomios que surgen de invertir R
disp(pol3R); 
disp(pol5R);
disp(pol7R);
disp(pol9R);

subplot(1,2,2);
scatter(x_meses, tprom); // Ploteamos los puntos
scatter(x_meses, tmin);
scatter(x_meses, tmax);

plot(x, horner(pol3R, x), "red"); // Ploteamos los polinomios
plot(x, horner(pol5R, x),"blue");
plot(x, horner(pol7R, x),"green");
plot(x, horner(pol9R, x),"black");





