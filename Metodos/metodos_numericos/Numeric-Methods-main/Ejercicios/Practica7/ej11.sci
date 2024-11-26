clc;
clear;

//exec("../../Metodos/Unidad7/chebyshev.sci");
//exec("../../Metodos/Unidad7/diferenciasDivididas.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\chebyshev.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\diferenciasDivididas.sci");

x = chebyshev_ab(4, 0, %pi / 2); // Calculamos las raices de Chebyshev ampliadas
pol = interpolacionDiferenciasDivididas(x, cos(x));

rango = [-%pi /2:0.001:%pi];

imagenes_coseno = cos(rango);
imagenes_polinomio = horner(pol, rango);

a = gca();
a.x_location = "origin";
a.y_location = "origin";

plot(rango, imagenes_coseno, "green");
plot(rango, imagenes_polinomio, "blue");
