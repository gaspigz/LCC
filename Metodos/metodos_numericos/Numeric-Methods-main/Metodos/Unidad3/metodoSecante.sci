clc // Limpia la consola
clear // Limpia la memori

function raiz = metodo_secante(fun, x0, x1, tolerancia, maxIters)

  deff("y=f(x)", "y=" + fun);

  numIters = 0;

  raiz = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));  

  while abs(raiz - x1) > tolerancia && numIters <= maxIters

    numIters = numIters + 1;
  
    x0 = x1;

    x1 = raiz;
  
    raiz = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));  
  
  end

  
  if abs(raiz - x1) > tolerancia then disp("Se alcanzo el maximo de iteraciones"); end

endfunction