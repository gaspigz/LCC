//exec("/home/martin/Documents/LCC/2do/R224 - Metodos Numericos/Metodos/Unidad8/metodoSimpson.sci");
//exec("/home/martin/Documents/LCC/2do/R224 - Metodos Numericos/Metodos/Unidad8/metodoTrapecio.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad8\metodoSimpson.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad8\metodoTrapecio.sci");


// a y b son constantes, d y c son strings de funciones de una variable.
// n y m cantidad de particiones por intervalo.
function integral = integracionBidimensionalTrapecio (fun, a, b, c, d, n ,m)

  h = (b - a) / n;

  deff("y = c(x)", "y = " + c); // Defino la funcion C
  deff("y = d(x)", "y = " + d); // Defino la funcion D

  integral = 0

  xj = a;
    
  for j = 0 : n - 1

    if j == 0 then
        
        integral = integral  + 1/2 * metodoTrapecioCompuesto(construirFuncion(fun, xj), c(xj), d(xj), m);

    else

        integral = integral  + metodoTrapecioCompuesto(construirFuncion(fun, xj), c(xj), d(xj), m);

    end
  
    xj = xj + h;

  end

  // Hacemos la ultima suma con b, debido al error de redondeo cuando sumamos H
  integral = integral  + reglaSimpsonCompuesta(construirFuncion(fun, b), c(b), d(b), m); 

  integral = h * integral;

endfunction






// a y b son constantes, d y c son strings funciones de una variable.
// n y m cantidad de particiones por intervalo.
function integral = integracionBidimensionalSimpson (fun, a, b, c, d, n, m)

  h = (b - a) / n;

  deff("y = c(x)", "y = " + c); // Defino la funcion C
  deff("y = d(x)", "y = " + d); // Defino la funcion D

  integral = 0

  xj = a;

  for j = 0 : n - 1

     if j == 0 then

      integral = integral  + reglaSimpsonCompuesta(construirFuncion(fun, xj), c(xj), d(xj), m); 
    
    elseif (modulo(j,2) == 1) then

      integral = integral  + 4 * reglaSimpsonCompuesta(construirFuncion(fun, xj), c(xj), d(xj), m); 
    
    else

      integral = integral  + 2 * reglaSimpsonCompuesta(construirFuncion(fun, xj), c(xj), d(xj), m); 

    end

    xj = xj + h;
  
  end

  // Hacemos la ultima suma con b, debido al error de redondeo cuando sumamos H
  integral = integral  + reglaSimpsonCompuesta(construirFuncion(fun, b), c(b), d(b), m); 

  integral = (h / 3) * integral;
  
endfunction





// Tome el string de una funcion, y reemplaza las ocurrencias de 'x' por el valor xj
function fxj = construirFuncion(fun, xj)

  fxj = strsubst(fun, 'x', string(xj));
  fxj = strsubst(fxj, 'y', "x");

endfunction

