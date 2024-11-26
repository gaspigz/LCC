clc;
clear;

//exec("../../Metodos/Unidad7/minimosCuadrados.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\minimosCuadrados.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\minimosCuadradosGeneral.sci");

X = [4, 4.2, 4.5, 4.7, 5.1, 5.5, 5.9, 6.3, 6.8, 7.1];
Y = [102.56, 113.18, 130.11, 142.05, 167.53, 195.14, 224.87, 256.73, 299.5, 326.72];

[p1, error1] = minimosCuadradosPolinomial(X, Y, 1);
[p2, error2] = minimosCuadradosPolinomial(X, Y, 2);
[p3, error3] = minimosCuadradosPolinomial(X, Y, 3);

disp("error1: " + string(error1));
disp("error2: " + string(error2));
disp("error3: " + string(error3));

a = gca();
a.x_location = "origin";
a.y_location = "origin";

scatter(X,Y); // Graficamos los puntos

rango = [3.5 : 0.001 : 7.5];

y1 = horner(p1, rango);
y2 = horner(p2, rango);
y3 = horner(p3, rango);

plot(rango, y1,"red");
plot(rango, y2,"blue");
plot(rango, y3,"green");


// PROBAMOS COMO NOS QUEDA CON LA FUNCION GENERAL
polinomios = ["1", "x","x**2", "x**3"]; 

[coeficientes1, e1] = minimosCuadrados(X, Y, polinomios(1, 1:2));
[coeficientes2, e2] = minimosCuadrados(X, Y, polinomios(1, 1:3));
[coeficientes3, e3] = minimosCuadrados(X, Y, polinomios(1, 1:4));

deff("y = pol1(x)", "y =" + construirFuncion(polinomios(1, 1:2), coeficientes1));
deff("y = pol2(x)", "y =" + construirFuncion(polinomios(1, 1:3), coeficientes1));
deff("y = pol3(x)", "y =" + construirFuncion(polinomios(1, 1:4), coeficientes1));
