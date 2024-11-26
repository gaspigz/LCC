//exec("../../Metodos/Unidad4/metodoQR.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad4\metodoQR.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad4\sustitucion.sci");

function [pol, error] = minimosCuadradosPolinomialQR(x,y,n)

  m = length(x);
  A = ones(m,1);

  for j =  1 : n // Construimos la matriz de Vandermonde

    A = [A ((x') ** j)]
  
  end
  
  [Q,R] = factorizacionQR(A);

  S = sustitucionRegresiva(R, Q' * y'); // R ya es una triangular superior

  pol = poly(S,"x","coeff");

  error = norm(A*S-y', 2);

endfunction
