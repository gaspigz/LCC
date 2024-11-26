clc;
clear;

//exec("../../Metodos/Unidad7/lagrance.sci")
//exec("../../Metodos/Unidad7/diferenciasDivididas.sci")
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\lagrance.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\diferenciasDivididas.sci");

// Dados los siguientes datos para la funcion exponencial
x = [0, 0.2, 0.4, 0.6]
y = [1, exp(0.2), exp(0.4), exp(0.6)];

// Aproximemos e^(1\3) por interpolacion lineal y cubica utilizando
// los Metodos de Lagrange y Newton

// Por interpolacion lineal, como necesitamos dos puntos, usamos x0 = 0.2 y x1 = 0.4

lagrangeLineal = polinomioInterpoladorLagrange([0.2, 0.4], [exp(0.2), exp(0.4)]);
newtonLineal = interpolacionDiferenciasDivididas([0.2, 0.4], [exp(0.2), exp(0.4)]);

disp("valorLagrangeLineal: " + string(horner(lagrangeLineal,1/3)))
disp("valorNewtonLineal: " + string(horner(newtonLineal,1/3)))

lagrangeCubico = polinomioInterpoladorLagrange(x,y);
newtonCubico = interpolacionDiferenciasDivididas(x,y);

disp("valorLagrangeCubico: " + string(horner(lagrangeCubico,1/3)));
disp("valorNewtonCubico: " + string(horner(newtonCubico,1/3)));

// Calculamos la cota de los errores lineal y cubico
cotaErrorLineal = abs((1/3 - 0.2) * (1/3 - 0.4)  / 2 * exp(0.4));
cotaErrorCubico = abs((1/3) * (1/3 - 0.2) * (1/3 - 0.4) * (1/3 - 0.6) / 24 * exp(0.6));

disp("cotaErrorLineal: " + string(cotaErrorLineal));
disp("cotaErrorCubico: " + string(cotaErrorCubico));


disp("errorLinealLagrange: " + string(abs(horner(lagrangeLineal,1/3) - exp(1/3))));
disp("errorLinealNewton: " + string(abs(horner(newtonLineal,1/3)- exp(1/3))));

disp("errorCubicoLagrange: " + string(abs(horner(lagrangeCubico,1/3) - exp(1/3))));
disp("errorCubicoNewton: " + string(abs(horner(newtonCubico,1/3) - exp(1/3))));
