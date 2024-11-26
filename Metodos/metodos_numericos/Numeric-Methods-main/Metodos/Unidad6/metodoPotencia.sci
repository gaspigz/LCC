function [autovalor, autovector] = metodoPotencia(A, z0, maxIter, tolerancia)

  iter = 1;

  autovalor = 0;

  // Primera iteracion del metodo
  w = A * z0; 

  zn = w / norm(w, %inf) // Normalizamos el vector con la norma infinito

  [m, k] = max(w); // Obtemos la maxima componente (abs) y su indidce

  autovalor = w(k) / zn(k); // Obtenemos la aproximacion del maximo autovalor

  while (norm(zn - z0, %inf) > tolerancia) && iter <= maxIter // Seguimos iterando

    z0 = zn;

    w = A * z0; 

    zn = w / norm(w, %inf) // Normalizamos el vector con la norma infinito
  
    [m, k] = max(w); // Obtemos la maxima componente (abs) y su indidce
  
    autovalor = w(k) / zn(k); // Obte
    
    iter = iter + 1;

  end

  autovector = zn; 

  disp("Numero iteraciones: ", iter);


endfunction
