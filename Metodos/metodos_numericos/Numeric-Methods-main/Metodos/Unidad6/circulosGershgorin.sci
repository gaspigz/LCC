function circ(r, x, y)

  w = 2 * r;
  h = 2 * r;

  xarc(x - r, y + r, w, h, 0, 360*64);

endfunction


function circulosGershgorin(A)

  [n, m] = size(A);

  centros = diag(A); // Vector con los elementos de la diagonal

  radios = sum(abs(A), 'c') - abs(centros); // Sumo los valores absolutos por filas 
                                            // y le resto los de la diagonal

  min_x = round(min(centros - radios) - 1)
  max_x = round (max(centros + radios) + 1)

  min_y = round(min(-radios) - 1)
  max_y = round(max(radios) + 1)

  rectangulo = [min_x, min_y, max_x, max_y]

  a = gca()
  a.x_location = "origin"
  a.y_location = "origin"

  plot2d(real(spec(A)), imag(spec(A)), - 1, "031", "", rectangulo);
  xgrid;

  for i = [1 : n]
      circ(radios(i), centros(i), 0)
  end

endfunction

A = [3 2 1 ; -1 0 1 ; -1 -1 2]
B = A'

circulosGershgorin(A)
circulosGershgorin(B)
