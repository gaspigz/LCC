function x = jacobi(A,b, xk, epsi)
    [n,m] = size(A);
    x = xk; // xk iteracion actual (e inicial), x resultado final
    cont = 0;
    
    while(cont == 0 || norm(x-xk)>epsi)
        xk = x;
        for i=1:n
            suma = 0;
            for j=1:n
                if(j <> i) then
                    suma = suma + A(i,j)*xk(j);
                end
            end
            x(i) = (1/A(i,i))*(b(i)-suma); // Componente i de la iteracion
        end    
        //Iteracion x obtenida
        cont = cont + 1;
    end
    disp(cont);
endfunction
