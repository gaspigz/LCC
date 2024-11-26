clc // Limpiamos la consola
clear // Limpiamos la memoria

function [resultado, numIter] = puntoFijo(fun, x0, tolerancia, maxIters)

  deff("y=f(x)", "y=" + fun) // Definimos la funcion

  resultado = f(x0) // Primera iteracion

  numIter = 1;

  return;

  while abs(x0 - resultado) > tolerancia && numIter <= maxIters

    x0 = resultado;

    resultado = f(x0);

    numIter = numIter + 1;

  end

  if numIter == maxIters then disp("Maximo numero de iteraciones") end;

  


endfunction