function x = gauss_seidel(A, b, xk, epsi)
    x = xk; // Estimacion actual
    [n,m] = size(A);
    cont = 0;
    while (cont == 0 || norm(x-xk)>epsi)
        xk = x;
        for i=1:n
            if(i == 1) then
                suma = 0;
                for j=2:n
                    suma = suma + A(1,j)*xk(j);
                end
                x(i) = (1/A(i,i))*(b(1)-suma);
            else if (i <> n) then
                suma1 = 0;
                for j=1:i-1
                    suma1 = suma1 + A(i,j)*x(j);
                end
                suma2 = 0;
                for j=i+1:n
                    suma2 = suma2 + A(i,j)*xk(j);
                end
                x(i) = (1/A(i,i))*(b(i)-suma1-suma2);
            else
                suma = 0;
                for j=1:n-1
                    suma = suma + A(n,j)*x(j);
                end
                x(n)=(1/A(n,n))*(b(n)-suma);
            end
            end
        end // Obtuve mi nueva iteracion   
        cont = cont + 1;
    end
    disp(cont);
endfunction
