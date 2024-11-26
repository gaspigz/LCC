clc // Limpia la consola
clear // Limpia la memoria

function d = derivar_cociente_incremental(fun, v, h, n)


  if (n == 1) then

    deff("y = f(x)", "y=" + fun); // Definimos la funcion

    d = (f(v + h) - f(v)) / h;

  else
    
    d1 = derivar_cociente_incremental(fun, v + h, h, n - 1);
    d2 = derivar_cociente_incremental(fun, v, h, n - 1);

    d = (d1 - d2) / h;

  end

endfunction




function d = derivar_numderivative(fun, v, n, h)

  deff("y = f(x)", "y=" + fun); // Definimos la funcion

  if (n == 1 || n == 2 || n == 4) then

    d = numderivative(f, v, n, h); //? Solo hace con n = 1,2,4

  else // No acepto dichos valores de orden

    disp("Los valores de n deben ser 1,2,4.");
    d = %nan;

  end

endfunction

