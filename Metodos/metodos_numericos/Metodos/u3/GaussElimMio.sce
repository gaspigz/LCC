function [Af,bf, cont, P] = gauss(A, b)
    cont = 0;
    n = size(A)(1);
    m = size(A)(2);
    P = eye(n,m);
    for k=1:n-1
        if(A(k,k) == 0) // Chequeo que el pivote sea válido
            for j = k+1:n
                cont = cont + 1;
                if(A(j,k) <> 0)
                    aux = A(k,:);
                    aux2 = b(k);
                    A(k,:) = A(j,:);
                    b(k) = b(j);
                    A(j,:) = aux;
                    b(j) = aux2;
                    auxp = P(k,:);
                    P(k,:) = P(j,:);
                    P(j,:) = auxp;
                    break;
                end
            end
         end
         
         for i=k+1:n
             cont = cont + 1;
             m = A(i,k)/A(k,k);
             A(i,:) = A(i,:) - m*A(k,:);
             b(i) = b(i) - m*b(k);
         end
         cont = cont + 1;
    end
    Af = A;
    bf = b;
endfunction

function y = det_gauss(A)
    y = 1;
    n = size(A)(1);
    m = size(A)(2);
    cero_col = zeros(n,1);
    [A, cero_col] = gauss(A, cero_col);
    for i=1:n
        y = y * A(i,i);
    end
endfunction

function [P, x] = gauss_solver(A, b)
    P = eye(size(A)(1),size(A)(2));
    
    [A, b, c, P] = gauss(A,b);
    x = triang_sup(A);
endfunction
