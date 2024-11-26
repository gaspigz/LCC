function pol = polCaracteristico(A)

  [n, m] = size(A)

  x = poly([0,1], "x", "coeff");

  pol = det(x * eye(n, n) - A);

endfunction


function Ae = epsilon(A, e)

  [n, m] = size(A);

  Ae = A;

  Ae(n, n) = A(n, n) + e;

endfunction



A = [1 -1 0 ; -2 4 -2 ; 0 -1 1]

for k = [0 : 10]

  pol = polCaracteristico(epsilon(A, 0.1 * k));
  disp(pol);
  disp(roots(pol));

end