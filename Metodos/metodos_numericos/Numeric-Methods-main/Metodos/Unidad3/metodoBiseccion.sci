clc // Limpia la consola
clear // Libera la memoria




//todo MEJORAR CON SELECTOR
function raiz = metodo_biseccion(fun, a, b, tolerancia, maxIteraciones)

  deff("y = f(x)", "y=" + fun);  // Definimos la funcion


  if (a >= b) then // Es un intervalo incorrecto
    
    raiz = %nan;

    disp("Intervalo incorrecto");
    
    return;

  end


  if f(a) * f(b) > 0 then // No es posible aplicar el metodo
    
    raiz = %nan;

    disp("f(a)f(b) > 0, no podemos aplicar Bolzano");

    return;

  
  elseif f(a) * f(b) == 0 // Algunas de los extremo es raiz
    
    if f(a) == 0 then raiz = a;
    
    else raiz = b; end


  else // f(a) * f(b) < 0

    raiz = (a + b) / 2; // Definimos el valor intermedio

    numIter = 0; // Numero de iteraciones

    while b - raiz > tolerancia && numIter < maxIteraciones
      
      numIter = numIter + 1;

      // Comparamos el f(c) con f(a) y f(b)

      if f(raiz) == 0 then // Calculamos justo la raiz

        return;
        
      else if f(b) * f(raiz) < 0
        
        a = raiz;
      
      else b = raiz;

      end


      raiz = (a + b) / 2; 

    end

  end


endfunction