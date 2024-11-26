clc // Limpiamos la consola
clear // Limpiamos la memoria

function resultado = puntoFijo(fun, x0, tolerancia, maxIters)

  deff("y = f(x)", "y=" + fun)


  resultado = f(x0); // Primera iteracion

  numIter = 1;

  while abs(x0 - resultado) > tolerancia && numIter < maxIters

    x0 = resultado; 

    resultado = f(x0); // Recalculamos valor

    numIter = numIter + 1;

  end

  if abs(x0 - resultado) > tolerancia then disp("Maximo numero de iteraciones") end;


endfunction


g = 9.8
T = 5
h = 4
w = 2 * %pi / T

function l = longitud_onda(d)

    l = 2 * %pi * g * tanh(2 * %pi * h / d) / (w ^ 2);

endfunction



// Valor inicial
d = 1;

func = "g * 2 * %pi * tanh(h * 2 * %pi / x) / (w ^ 2)"

first_l = puntoFijo(func, d, 0.01, 100000000)
l =puntoFijo(func, first_l, 0.00001, 100000)

disp(first_l)
disp(l)
