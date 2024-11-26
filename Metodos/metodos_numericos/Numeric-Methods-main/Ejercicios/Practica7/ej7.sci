clc;
clear;

exec("../../Metodos/Unidad7/minimosCuadrados.sci"); // Cargamos el metodo de minimos cuadrados (polinomios)

X = [0, 0.15, 0.31, 0.5, 0.6, 0.75];
Y = [1, 1.004, 1.31, 1.117, 1.223, 1.422]; 

[p1, error1] = minimosCuadradosPolinomial(X,Y, 1);
[p2, error2] = minimosCuadradosPolinomial(X,Y, 2);
[p3, error3] = minimosCuadradosPolinomial(X,Y, 3);

// Ploteamos los resultados
rango = [0:0.001:0.75];
plot(rango, horner(p1, rango), "red");
plot(rango, horner(p2, rango), "blue");
plot(rango, horner(p3, rango), "yellow");
plot(x,y,"go");

// Vemos cual es el minimo error de los 3 grados con los que calculamos los datos
[m, index] = min([error1, error2, error3]);

disp("El polinomio con menor error es el de grado " + string(index));