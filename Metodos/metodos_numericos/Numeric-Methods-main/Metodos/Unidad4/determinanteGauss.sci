function determinante = determinanteGauss(A)
    
    [nA, mA] = size(A);
    
    if nA <> mA then
        error("determinanteGauss - La matriz debe ser cuadrada");
        abort;
    end
    
    n = nA;
    
    determinante = 1;
    
    // Escalonamos la matriz
    for k = [1 : n - 1]  
    
        for i = k + 1 : n 
            
            A(i,k : n) = A(i, k : n) - (A(k, k : n) * A(i,k) / A(k,k));

            A(i,1 : k) = 0; // No sirve para calcular la solucion, solo para
                            // construir la matriz escalonada.
            
        end
        
        determinante = determinante * A(k,k);

    end

    determinante = determinante * A(n,n);


    
endfunction



// Ejemplos de aplicación
A = [3 -2 -1; 6 -2 2; -9 7 1];

determinanteGauss(A);
