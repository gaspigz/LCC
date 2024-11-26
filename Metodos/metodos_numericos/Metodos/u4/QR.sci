function [Q,R] = factQR(A)
    [m,n] = size(A);
    if rank(A) <> n  then
        error("factorizacionQR - El rango de la matriz no es n");
    end
    Q = zeros(m,n);
    R = zeros(n,n);
    
    for k=1:n
    vectorProyectado = A(1:m, k);
        
        for i = 1 : k - 1 
            
            R(i,k) = A(1:m, k)' * Q(1:m, i);
            
            vectorProyectado = vectorProyectado - R(i,k) * Q(1:m, i);
        end
        
        Q(1:m, k) = vectorProyectado / norm(vectorProyectado);

        R(k,k) = norm(vectorProyectado);
        
    end
endfunction

function x = triang_sup(A, b)
    n = size(A)(1);
    m = size(A)(2);
    x(n) = b(n)/A(n,m);
    i = n-1;
    while i>=1
        suma = 0
        for j=i+1:n
            suma = suma + A(i,j)*x(j);
        end
        x(i) = (1/A(i,i))*(b(i)-suma);
        i = i-1;
    end
    
endfunction

function x = triang_inf(A, b)
    n = size(A)(1);
    m = size(A)(2);
    x(1) = b(1)/A(1,1);
    for i=2:n
        suma = 0
        for j = 1:i-1
            suma = suma + A(i,j)*x(j);
        end
        x(i) = (1/A(i,i))*(b(i)-suma);
    end
endfunction


function x = QR_solver(A, b)
        [Q, R] = factQR(A);
        x = triang_sup(R, Q'*b);
    
endfunction
