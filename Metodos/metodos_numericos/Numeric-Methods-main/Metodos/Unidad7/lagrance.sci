function pol = polinomioInterpoladorLagrange(x,y)

  pol = poly([0],"x", "coeff"); 
  
  n = length(x); // Suponemos que x e y tienen el mismo largo

  for i = [0 : n - 1]

    pol = pol + Lk(x,i) * y(i + 1);

  end

endfunction

// Funcion que calcula el Lk correspondiente
function pol = Lk(x,k) 

  xk = x(k + 1);

  n = length(x);

  pol = poly([1],"x", "coeff"); 

  varx = poly([0 1], "x", "coeff");

  for i = [1 : n] 

    if (i <> k + 1) then 
      pol = pol * (varx - x(i)) / (xk - x(i));
    end

  end

endfunction