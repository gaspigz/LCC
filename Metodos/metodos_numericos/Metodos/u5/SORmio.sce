function x = SOR(A,b,xk,eps,w)
    x = xk;
    [n,m] = size(A);
    cont = 0;
    while cont==0 || norm(x-xk)>eps
        xk = x;
        for i = 1:n
            if(i == 1) then
                suma = 0
                for j=2:n
                    suma = suma + A(1,j)*xk(j);
                end
                x(1) = (1-w)*xk(1) + (w/A(i,i))*(b(1)-suma);
            else if(i<>n) then
                suma1 = 0;
                for j=1:i-1
                    suma1 = suma1 + A(i,j)*x(j);
                end
                suma2 = 0;
                for j=i+1:n
                    suma2 = suma2+ A(i,j)*xk(j);
                end
                x(i) = (1-w)*xk(i)+(w/A(i,i))*(b(i)-suma1-suma2);
            else
                suma = 0;
                for j=1:n-1
                    suma = suma+ A(n,j)*x(j);
                end
                x(n) = (1-w)*xk(n)+(w/A(n,n))*(b(n)-suma);
            end
            end
        end // Obtuve iteracion en x
        cont = cont + 1;
         
    end
    disp(cont);
endfunction

function w = omega_opt(A)
    // A es definida positiva y tridiagonal
    n = size(A)(1);
    T_j = eye(n,n)-diag(1./diag(A))*A;
    autovalores = spec(T_j);
    rho = max(abs(autovalores));
    w=2/(1+sqrt(1-rho**2));
endfunction
