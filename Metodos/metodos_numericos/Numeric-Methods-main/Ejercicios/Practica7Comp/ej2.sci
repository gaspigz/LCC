clc;
clear;

// exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\chebyshev.sci");
// exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\diferenciasDivididas.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\chebyshev.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\diferenciasDivididas.sci");

// Ejercicio A
x_uniformes = [-1, -1/3, 1/3, 1];
y_uniformes = exp(x_uniformes);

pol_interpolador = interpolacionDiferenciasDivididas(x_uniformes, y_uniformes);

// Ejercicio B
disp("P(-0.9) = " + string(horner(pol_interpolador, -0.9)));
disp("e^(-0.9) = " + string(exp(-0.9)));
disp("P(0.01) = " + string(horner(pol_interpolador, 0.01)));
disp("e^(0.01) = " + string(exp(0.01)));

// Ejercicio E
x_chebyshev = chebyshev(4);
y_chebyshev = exp(x_chebyshev);

pol_interpolador_chebyshev = interpolacionDiferenciasDivididas(x_chebyshev, y_chebyshev);

// Ejercicio G
x = [-1:0.001:1]
error_P = exp(x) - horner(pol_interpolador, x);
error_Q = exp(x) - horner(pol_interpolador_chebyshev, x);

a = gca();
a.x_location = "origin";
a.y_location = "origin";

plot(x, abs(error_P), "green");
plot(x, abs(error_Q));
