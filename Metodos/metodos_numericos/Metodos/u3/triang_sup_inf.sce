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


