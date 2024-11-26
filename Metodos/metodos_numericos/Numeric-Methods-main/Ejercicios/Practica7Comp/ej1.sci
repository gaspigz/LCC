clc;
clear;

exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\minimosCuadradosGeneral.sci");

X = [-2.0, -1.6, -1.2, -0.8, -0.4, 0, 0.4, 0.8, 1.2, 1.6, 2.0];
Y = [1.5, 0.99, 0.61, 0.27, 0.02, -0.0096, 0.065, 0.38, 0.63, 0.98, 1.50];

// Como sabemos que p4(0) = 0 y p4'(x) = 0, sabemos que los coeficientes lineal e independiente
// son nulos. Luego a la funcion g la podemos aproximar con la siguietne familia de funciones

funciones = ["x**2","x**3","x**4"];

coeficientes = minimosCuadrados(X,Y, funciones);

deff("y = p4(x)", "y =" + construirFuncion(funciones, coeficientes));

rango = [-2.5 : 0.001 : 2.5];

for i = [1 : length(rango)]

  imagen(i) = p4(rango(i));

end

a = gca();
a.x_location = "origin";
a.y_location = "origin";

scatter(X,Y);
plot(rango, imagen);