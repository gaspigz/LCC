// Grafica y nos devuelve las coordenadas x e y del maximo de abs(Phin(x)) = (x - x0)...(x - xn) 
// en el intervalo [x0, xn].
// Consideramos que los nodos de interpolacion estan bien ordenados.
function [x_maximo, y_maximo] = graficarAbsPhi(nodosInterpolacion)
   
    l = length(nodosInterpolacion); 
   
    cuerpoFuncion = "";
    
    for i = [1 : l - 1]
        cuerpoFuncion = cuerpoFuncion + "(x - " + string(nodosInterpolacion(i)) + ") .*";
    end
    
    cuerpoFuncion = cuerpoFuncion + "(x - " + string(nodosInterpolacion(l)) + ")";
    
    deff("y = phi(x)", "y =" + cuerpoFuncion);
    
    rango = [nodosInterpolacion(1):0.001:nodosInterpolacion(l)];
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";    
    
    imagenes = abs(phi(rango));
    
    plot(rango, imagenes);
    
    [maximo, indice] = max(imagenes);
    
    x_maximo = rango(indice);
    y_maximo = maximo;
   
endfunction
