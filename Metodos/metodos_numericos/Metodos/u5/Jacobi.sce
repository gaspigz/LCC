// Jacobi
// xi^(k+1) = 
//      1/aii (bi - sum_{j = 1, j != i}_n(aij xj^k))

function x = jacobi(A, b, x0, eps)
    n = size(A,1); // Cantidad de filas
    x = x0;
    xk = x;
    cont = 0;
    for i=1:n
        suma = 0;
        for j=1:n
            if(j <> i)
                suma = suma + A(i,j)*xk(j);
            end
        end    
        x(i) = (1/A(i,i)) * (b(i) - suma);
    end
    cont = cont + 1; // Aca ya obtuve una primera iteracion
    while(norm(x-xk) > eps) // Iteracion actual (x) - Iteracion anterior (xk) (x = xk+1)
        xk = x;
        for i=1:n
            suma = 0;
            for j=1:n
                if(j <> i)
                    suma = suma + A(i,j)*xk(j);
                end
            end    
            x(i) = (1/A(i,i)) * (b(i) - suma);
        end
        cont = cont + 1;
        
    end
    disp(cont);
    
endfunction

// Gauss-Seidel
// xi^(k+1) = 
//      1/aii (bi - sum_{j = 1}_i-1(aij xj^(k+1))
//                 - sum_{j = i+1}_n(aij xj^k)

function x = gauss(A, b, x0, eps)
    n = size(A,1); // Cantidad de filas
    x = x0;
    xk = x;
    cont = 0;
    for i=1:n
        suma = 0;
        for j=1:n
            if(j <> i)
                suma = suma + A(i,j)*x(j); // Uso la iteracion actual (xk+1)
            end
        end    
        x(i) = (1/A(i,i)) * (b(i) - suma);
    end
    cont = cont + 1; // Aca ya obtuve una primera iteracion
    while(norm(x-xk) > eps) // Iteracion actual (x) - Iteracion anterior (xk) (x = xk+1)
        xk = x;
        for i=1:n
            suma = 0;
            for j=1:n
                if(j <> i)
                    suma = suma + A(i,j)*x(j); // Uso la iteracion actual
                end
            end    
            x(i) = (1/A(i,i)) * (b(i) - suma);
        end
        cont = cont + 1;
        
    end
    disp(cont);
    
endfunction

