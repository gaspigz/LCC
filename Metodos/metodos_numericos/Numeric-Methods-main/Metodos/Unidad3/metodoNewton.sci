clc // Limpia la consola
clear // Limpia la memoria


function salida = newton(fun, x0, tolerancia, maxIters)

  deff("y = f(x)", "y=" + fun); // Definimos la funcion

  numIters = 0; // Cantidad de iteraciones

  x1 = x0 - f(x0) / numderivative(f, x0);


  while abs(x1) > tolerancia && numIters < maxIters

    numIters = numIters + 1;

    x0 = x1;

    x1 = x0 - f(x0) / numderivative(f, x0);

  end

  // Vemos el motivo de corte
  if abs(x1 - x0) > tolerancia then disp("Se alcanzo el maximo de iteraciones");

  end

  salida = x1;
  
endfunction
