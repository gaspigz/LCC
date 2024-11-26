exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad4\metodoGaussCompleto.sci");

// Realiza la aproximacion por minimos cuadrados, utilizando polinomios
function [pol, error] = minimosCuadradosPolinomial(x, y, n)

  m = length(x);

  A = ones(m,1);

  for i = [1 : n]

    A = [A ((x') ** i)]; // Vamos calculando la matriz por columnas

  end
    
  [S, P, L, U] = eliminacionGaussCompleta(A'*A, A'*y') // Vemos la solucion del sistema At*A*x = At*b

  pol = poly(S,"x","coeff");

  error = norm(A*S-y', 2);

endfunction
