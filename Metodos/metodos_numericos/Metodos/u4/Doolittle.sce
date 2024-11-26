function [L,U] = doolittle(A)
    
    /*sz = size(A,1)
    L = eye(sz,sz)
    U = zeros(sz,sz)
    
    U(1,:) = A(1,:)
    for k = 1:sz
           
        for j = k:sz
            suma = 0
            for m = 1:k-1
                suma = suma + L(k,m)*U(m,j)
            end
            U(k,j)=A(k,j) - suma
            
            for i = k+1:sz
                suma = 0
                for m = 1:k-1
                    suma = suma + L(i,m)*U(m,k)
                end    
                L(i,k)=(A(i,k) - suma)/U(k,k)
            end
        end
    end
    */
    
    n = size(A)(1);
    m = size(A)(2);
    L = eye(n,m);
    U = zeros(n,m);
    
    for i=1:n
        for j=1:m
           if(i<=j) then
               suma = 0;
               for k=1:i-1
                   suma = suma + L(i,k)*U(k,j);
               end
               
              U(i,j) = A(i,j) - suma; 
              
           else
               suma = 0;
               for k = 1: j-1
                   suma = suma + L(i,k)*U(k,j);
               end
               L(i,j) = (A(i,j)-suma)/U(j,j);
           end 
        end
    end
    
    /*for s=1:n
        
        // Calculo fila de U
        
        for j = s: n
           suma = 0;
           for k = 1: s-1
              suma = suma + L(s,k)*U(k,j); 
           end 
           U(s,j) = A(s,j) - suma;
        end
        
        // Calculo columna de L
        
        for i = s: n
            
            suma = 0;
            
            for k=1:s-1
                suma = suma + L(i,k) * U(k,s);
            end
            L(i, s) = (A(i,s)-suma)/U(s,s);
        end
                
        
    end*/
    
    
endfunction

function [L,U] = metodoDoolittle(A)
    
    [n,m] = size(A);
    
    if n <> m then
        error("metodoDoolittle - la matriz A debe ser cuadrada");
        abort;
    end
    
    L = zeros(n,n);
    U = zeros(n,n);
    
    for s = 1 : n 
        
        // Calculamos la siguiente fila de U
       for j = s : n
            
            suma = 0;
            
            for k = 1 : s - 1 
                suma = suma + L(s,k) * U(k,j);
            end
            
            U(s,j) = A(s,j) - suma
       end
        
        // Calculamos la siguiente columna de L
        for i = s : n
            
            suma = 0;
            
            for k = 1 : s - 1 
                suma = suma + L(i,k) * U(k,s);
            end
            
            L(i,s) = (A(i,s) - suma) / U(s,s);
       end 
    end
    
endfunction
