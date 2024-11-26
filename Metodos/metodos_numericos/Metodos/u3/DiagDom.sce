function ToF = diag_dom(A)
    [n,m] = size(A);
    ToF = 1;
    for i=1:n
        suma = 0;
        for j=1:n
            if(j<>i) then
                suma = suma + abs(A(i,j));
            end
        end
        if (abs(A(i,i))<suma) then
            ToF = 0;
        end 
    end
endfunction
