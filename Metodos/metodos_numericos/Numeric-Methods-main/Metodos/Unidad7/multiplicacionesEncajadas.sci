function result = multiplicacionesEncajadas(difDivididas, nodosInterpolacion, x)
    
  n = length(nodosInterpolacion);  

  result = difDivididas(n);

  for i = [n - 1: -1: 1]
    
    result = difDivididas(i) + (x - nodosInterpolacion(i)) * result;

  end
  
endfunction

