function [U] = Cholesky(A)
    eps = 1.0e-8
    [n,m] = size(A);
    U = zeros(n,n)
    
    for k=1:n
        suma = 0;
        for i=1:k-1
           suma = suma + U(i,k) * U(i,k);
        end
        t = A(k,k)-suma;
        if t<eps then
            break;
        end
        U(k,k) = sqrt(t);
        for j=k+1:n
            suma = 0;
            for i=1:k-1
               suma = suma + U(i,k)*U(i,j);
            end
           U(k,j) = (A(k,j)- suma)/U(k,k); 
        end
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


function x = cholsolver(A,b)
    R = Cholesky(A);
    g = triang_inf(R',b);
    x = triang_sup(R,g);
    
endfunction



function [U, ind] = Cholesky2(A)
    eps = 1.0e-8
    n = size(A,1)
    U = zeros(n,n)
    for k = 1:n
        t = A(k,k) - U(1:k,k)'*(U(1:k,k))
        if (t <= eps)
            mprintf("Matriz no definida positiva.\n")
            ind = 0
            return
        end
        if (A <> A')
            mprintf("Matriz no simetrica. \n")
            ind = 0
            return 
        end
        disp(t);
        U(k,k)= sqrt(t)
        for j = k+1:n
            U(k,j) = ( A(k,j) - U(1:k,k)'*U(1:k,j) )/U(k,k)
        end
    end
    ind = 1
endfunction


