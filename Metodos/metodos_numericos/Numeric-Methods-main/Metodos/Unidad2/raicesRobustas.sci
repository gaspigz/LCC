clc // Limpiamos la consola
clear // Liberamos la memoria

function r = cuadratic_roots(p)

  // Obtenemos los coeficientes de la cuadratica
  c = coeff(p, 0);
  b = coeff(p, 1);
  a = coeff(p ,2);

  discr = b^2 - 4 * a * c // Calculamos discriminante
  
  if discr > 0 then // Usamos el metodo de racies robustas
    
    if b < 0 then 
    
      r(1) = (2 * c) / (-b + sqrt(discr));
    
      r(2) = (-b + sqrt(discr)) / (2 * a);

    elseif b > 0 then

      r(1) = (-b - sqrt(discr)) / (2 * a)
    
      r(2) = (2 * c) / (-b - sqrt(discr));

    else // b == 0

      r(1) = (-sqrt(discr)) / (2 * a)

      r(2) = sqrt(discr) / (2 * a);

    end
    
  elseif discr == 0 then // Las dos raices coinciden
    
    root = -b / (2 * a);

    r(1) = root;

    r(2) = root;

  else // Calculamos las raices complejas, de manera normal

    r(1) = (-b + sqrt(discr)) / (2 * a);

    r(2) = (-b-+ sqrt(discr)) / (2 * a);


  end

endfunction


e = 0.0001

p = poly([-e, 1/e, e],"x","coeff"); // Definimos el polinomio deseado

roots = cuadratic_roots(p); // Calculamos las raices del polinomio

disp("cuadratic_roots: (primera) %e : (segunda) %e\n",roots(1),roots(2));