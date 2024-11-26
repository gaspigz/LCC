exec()

x = -5 : 0.001 : 5 // Valores de entrada

// Valores de salida para cada funcion
y1 = cos(x) .* cosh(x) + 1 ;
y2 = 2 .* sin(x) - x .^2 ;
y3 = (%e .^(-x)) - x .^4 ;
y4 = log(x) -x + 1 ;
y5 = (x .^2) / 4 - sin(x) ;


// Centramos los ejes de cada uno de los subplots
for i = 1:6
    subplot(2,3,i)
    a = gca()
    a.x_location = "origin"
    a.y_location = "origin"
end

// Ploteamos todas las funciones
subplot(2,3,1);
plot(x, y1);

subplot(2,3,2);
plot(x, y2);

subplot(2,3,3);
plot(x, y3);

subplot(2,3,4);
plot(x, y4);

subplot(2,3,5);
plot(x, y5);
