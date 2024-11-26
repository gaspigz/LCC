clc;
clear;

exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\minimosCuadrados.sci");

precio2021 = [145.61, 151.12, 157.27, 164.72, 172.29, 182.91, 185.12, 188.62, 190.09, 197.99, 204.32, 207.97];

precio2022 = [209.92, 225.82, 265.71, 295.24, 301.62, 311.8, 327.39, 343.10, 366.54, 385.20, 407.77, 428.42];

meses = [1 : 12];

[p1_2021, error1_2021] = minimosCuadradosPolinomial(meses, precio2021, 1);
[p2_2021, error2_2021] = minimosCuadradosPolinomial(meses, precio2021, 2);
[p3_2021, error3_2021] = minimosCuadradosPolinomial(meses, precio2021, 3);

[p1_2022, error1_2022] = minimosCuadradosPolinomial(meses, precio2022, 1);
[p2_2022, error2_2022] = minimosCuadradosPolinomial(meses, precio2022, 2);
[p3_2022, error3_2022] = minimosCuadradosPolinomial(meses, precio2022, 3);

// Grafiquemos los datos y los polinomios obtenidos
a = gca();
a.x_location = "origin";
a.y_location = "origin";

tiempo = [1 : 0.001 :12];


subplot(1,2,1); // Ploteamos el primer anio

scatter(meses, precio2021);
plot(tiempo, horner(p1_2021, tiempo), "green");
plot(tiempo, horner(p2_2021, tiempo), "blue");
plot(tiempo, horner(p3_2021, tiempo), "red");

subplot(1,2,2); // Ploteamos el segundo anio

scatter(meses, precio2022);
plot(tiempo, horner(p1_2022, tiempo), "green");
plot(tiempo, horner(p2_2022, tiempo), "blue");
plot(tiempo, horner(p3_2022, tiempo), "red");


// Vemos los errores de cada una de las aproximaciones
disp("Error aproximacion lineal 2021: " + string(error1_2021));
disp("Error aproximacion cuadratica 2021: " + string(error3_2021));
disp("Error aproximacion cubica 2021: " + string(error2_2021));

// Vemos los errores de cada una de las aproximaciones
disp("Error aproximacion lineal 2022: " + string(error1_2022));
disp("Error aproximacion cuadratica 2022: " + string(error3_2022));
disp("Error aproximacion cubica 2022: " + string(error2_2022));

// A partir de esto podemos decir que:
// - En 2021 y 2022 la mejor aproximacion es la cuadratica, por lo que podemos decir
//   que el precio tuvo un aumento cuadratico.