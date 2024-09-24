//Graficadora de funciones
function ploty(fn, l, in, r, col) // Funcion, Limite Izq, Intervalo, Limite Der, Color
    x = [l:in:r];
    y = fn(x);
    n = size(x);
    yy = zeros(1,n(2)); // Vector de ceros con el tamaño de x. Sirve como eje x = 0.
    plot(x,yy,'k') // Eje x
    plot(yy, x, 'k') // Eje y
    plot(x,y, col)
    xgrid();
    a = gca();
    a.auto_scale = "off"; 
endfunction
function plot_functions_v2(func_list, left_limit, right_limit, step_size, colors)
    // Definir el vector de puntos x
    x = left_limit:step_size:right_limit;
    
    // Limpiar el gráfico previo
    clf();
    
    // Graficar cada función de la lista
    for i = 1:length(func_list)
        // Evaluar la función i en los puntos x
        y = feval(func_list(i), x); 
        
        // Graficar con el color especificado
        plot(x, y, colors(i));
        
        // Mantener el gráfico activo para la siguiente función
        plot2d();
    end
    
    // Añadir etiquetas y cuadrícula
    xtitle("Gráfico de múltiples funciones", "Eje X", "Eje Y");
    xgrid();
endfunction

