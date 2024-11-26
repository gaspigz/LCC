clc // Limpiamos la consola
clear // Liberamos la memoria


function b = better_horner(p, x) // Toma un polinomio p y evalua p en x

  n = degree(p)  

  b = 0;

  for i = [n: -1: 0]
    
    b = coeff(p,i) + x * b;

  end

endfunction


function b = horner_d(p, x) // Toma un polinomio p y evalua p y p' en x

    n = degree(p);

    b(1) = 0
    b(2) = 0

    for i = [n: -1: 0]

      b(1) = coeff(p,i) + x * b(1);

      if (i >= 1) then 
      
        b(2) = b(1) + x * b(2);
      
      end
      
    end

endfunction

