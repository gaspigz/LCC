function [N,rho,x] = p5com_1(n)
    b = zeros(n,1);
    b(n,1) = 1;
    A = zeros(n,n);
    for i=1:n
        for j=1:n
            if(i == j) then
                A(i,j) = 2;
            else if(i == j+1 || i == j-1) then
                    A(i,j) = -1;
            end
            end
                
        end
    end
    A(n,1) = 1;
    A(1,n) = 1;
    x = gauss_seidel(A,b,zeros(n,1),0.00001);
    N = zeros(n,n);
    for i=1:n
        for j=1:n
            if(i == j) then
                N(i,j) = A(i,j);
            else if(i == j+1) then
                    N(i,j) = A(i,j);
            end
            end
                
        end
    end
    rho = max(abs(spec(N)));
endfunction
