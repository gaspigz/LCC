clc;
clear;

//exec("../../Metodos/Unidad7/diferenciasDivididas.sci");
//exec("../../Metodos/Unidad7/chebyshev.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\diferenciasDivididas.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad7\chebyshev.sci");


function x = particionar(inicio,fin,n) // Nos devuelve una particion regular de un intervalo

  l = (fin - inicio) / n;

  for i = [0:n];

    x(i+1) = inicio + l * i;
  
  end

endfunction


inicio = -5;
fin = 5;

deff("y = f(x)", "y = 1 / (1 + x**2)");

for n = [2,4,6,10,14]

  x = particionar(inicio,fin,n);
  
  for i = [1:length(x)]
    y(i) = f(x(i));
  end
  
  p(n) = interpolacionDiferenciasDivididas(x,y);

  phi(n) = poly(x, "x", "roots"); // Definimios las Phi


end


X = [-5:0.001:5]; // Rango de prueba

// Calculamos las imagenes de nuestra funcion
for i = [1:length(X)]
  fy(i) = f(X(i));
end

// Calculamos las imagenes de nuestros polinomios de interpolacion

// Calculamos los errores de interpolacion
fy' - horner(p(2), X)
fy' - horner(p(4), X)
fy' - horner(p(6), X)
fy' - horner(p(10), X)
fy' - horner(p(14), X)


a = gca();
a.x_location = "origin";
a.y_location = "origin";

// Ploteamos los errores
subplot(1,2,1);
plot(X, fy' - horner(p(2), X), "red");
plot(X, fy' - horner(p(4), X), "blue");
plot(X, fy' - horner(p(6), X), "green");
plot(X, fy' - horner(p(10), X), "cyan");
plot(X, fy' - horner(p(14), X), "black");


// Ploteamos las funciones Phi
subplot(1,2,2);
plot(X, horner(phi(2), X), "red");
plot(X, horner(phi(4), X), "blue");
plot(X, horner(phi(6), X), "green");
plot(X, horner(phi(10), X), "cyan");
plot(X, horner(phi(14), X), "black");


