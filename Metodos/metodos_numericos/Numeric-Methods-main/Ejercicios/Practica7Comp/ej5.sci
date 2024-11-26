clc;
clear;

exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\minimosCuadradosGeneral.sci");

// Informacion del problema
dias = [1 : 30];
casosPorDia = [35, 23, 47, 59, 82, 113, 143, 179, 233, 269, 303, 335, 371, 404, 434, 446, 457, 470, 481, 482, 476, 465, 454, 436, 424, 397, 385, 359, 340, 322, 303];

// Calculemos la cantidad de casos totales por dia
casosTotales(1) = casosPorDia(1);

for i = [2 : 30]
  casosTotales(i) = casosTotales(i - 1) + casosPorDia(i); 
end


// Parametro que ya conocemos el valor
theta1 = 13129.3;

// Construimos las imagenes de nuestra nueva funcion g'(x) que queremos aproximar
casosTotalesLinealizado = log(theta1) - log(casosTotales);

// Obtenemos ln(-theta2) y -theta3
parametros = minimosCuadrados(dias, log(casosTotalesLinealizado)',["1", "x"]); // Estamos aplicando minimos cuadrados en caso exp

// Conseguimos nuestros parametros originales
theta2 = exp(parametros(1));
theta3 = -parametros(2);

// Definimos nuestra funcion g(t) con los parametros obtenidos
deff("y = g(t)", "y = " + string(theta1) + " .* exp(-" + string(theta2) + ".* exp(-" + string(theta3) + " .*t))");

// Graficamos los resultados
rango = [1 : 0.001 : 30];

a = gca();
a.x_location = "origin";
a.y_location = "origin";

plot(rango, g(rango)); // Ploteamos la funcion g(t)

scatter(dias, casosTotales); // Ploteamos los casos totales por dia

