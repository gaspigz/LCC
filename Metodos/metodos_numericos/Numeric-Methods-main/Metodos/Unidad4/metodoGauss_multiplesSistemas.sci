function [x,a] = eliminacionGaussSinPPSistemas(A,B)
    
    [nA, mA] = size(A);
    [nB, mB] = size(B);
    
    if nA <> mA then
        error("eliminacionGaussSinPPSistemas - La matriz debe ser cuadrada");
        abort;
    end
    
    if mA <> nB then
        error("eliminacionGaussSinPPSistemas - Dimensiones incompatibles entre A y b");
        abort;
    end;
    

    a = [A B] // Matriz aumentada del sistema   
     
    n = nA;
    
    // Escalonamos la matriz
    for k = [1 : n - 1]  
    
        for i = k + 1 : n 
            
            a(i,k : n + mB) = a(i, k : n + mB) - (a(k, k : n + mB) * a(i,k) / a(k,k));

            a(i,1 : k) = 0; // No sirve para calcular la solucion, solo para
                            // construir la matriz escalonada.
            
        end

    end
    
    // Realizamos la sustitucion regresiva 
    
    B = a(1 : n, n + 1 : n + mB);
    
    x = zeros(n, mB);

    x(n , 1 : mB) = B(n, 1 : mB ) / a(n,n);

    for i = [n - 1 : -1 : 1]
        
        x(i, 1 : mB) = (B(i, 1 : mB) - a(i, i + 1 : n) * x(i + 1 : n, 1 : mB)) / a(i,i);
        
    end         
    
endfunction



// Ejemplos de aplicación
A = [3 -2 -1; 6 -2 2; -9 7 1]
b = [1 0 0 ; 0 1 0 ; 0 0 1]'

[x,a] = eliminacionGaussSinPP(A,b)
disp(x);
disp(a);
