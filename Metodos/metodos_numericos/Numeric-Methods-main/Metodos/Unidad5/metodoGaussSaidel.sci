function x = gaussSaidel(matriz_coef, b, x0, tolerancia, max_iter)

  // Chequeamos que la matriz sea cuadrada
  [n,m] = size(matriz_coef)

  if n <> m then 
    disp("La matriz no es cuadrada")
    x = %nan
    return
  end

  // Chequeamos que coincidan las dimensiones de la matriz y los valores independientes
  size_b = length(b)

  if size_b <> n then
    disp("No coinciden la dimension de la matriz con la de valores")
    x = %nan
    return
  end

  // Chequeamos que no tenga elementos nulos en la diagonal
  for i = [1 : n]

  if matriz_coef(i,i) == 0 then 

    disp("Hay elementos nulos en la diagonal")
    x = %nan
    return
  
  end
end

x = x0 // Valor inicial de la iteracion

xk = x // Valor que iremos iterando

iter = 1 // Cantidad de iteraciones


for i = [1 : n] // Iteramos por fila

  suma = 0

  for j = [1 : n] // Calculamos la suma de la fila sin incluir la diagonal

    if j < i then suma = suma + matriz_coef(i,j) * x(j)

    elseif j > i then suma = suma + matriz_coef(i,j) * xk(j) 
    
    end
  
  end
    
  x(i) = (1 / matriz_coef(i,i)) * (b(i) - suma); // Calculamos el valor
      
end


while norm(x - xk) > tolerancia  && iter < max_iter 
  
  xk = x

  for i = [1 : n] // Iteramos por fila

    suma = 0
  
    for j = [1 : n] // Calculamos la suma de la fila sin incluir la diagonal
  
      if j < i then suma = suma + matriz_coef(i,j) * x(j)
  
      elseif j > i then suma = suma + matriz_coef(i,j) * xk(j) 
      
      end

    end
      
    x(i) = (1 / matriz_coef(i,i)) * (b(i) - suma); // Calculamos el valor
        
  end
  
  
  iter = iter + 1; // Aumentamos el numero de iteraciones

end

disp("Numero iteraciones:" + string(iter))

endfunction
