clc;
clear;

// ------------------ METODOS UTILIZADOS -----------------------

//Funcion que aproxima una integral por el metodo del trapecio Compuesto
function integral = metodoTrapecioCompuesto(fun, a, b, n)

  // Verificamos que el intervalo sea correcto
  if (b < a) then
    error("metodoTrapecioCompuesto: intervalo incorrecto");
    abort;
  end

  // Verificamos que el n sea correcto
  if (n <= 0) then
    error("metodoTrapecioCompuesto: Valor de n incorrecto");
    abort;
  end

  deff("y=f(x)","y=" + fun); // Definimos nuestra funcion

  h = (b - a) / n;

  integral = 0;

  xj = a;

  for j = [0 : n]

    if j == 0 || j == n then

      integral = integral + 1/2 * f(xj);
    
    else

      integral = integral + f(xj);
    
    end
    
    xj = xj + h; // Actualizamos el punto
  
  end

  integral = h * integral;

endfunction

// ------------------ RESOLUCION DE EJERCICIO -----------------


// Decalaramos las funciones del problema

deff("y = f1(x)", "y = x .** 2 + 1");
deff("y = f2(x)", "y = x + 3");

intervalo = [-1 : 0.001 : 2];

// Item A: Grafiquemos el corte longitudinal del solido de revolucion
a = gca();
a.x_location = "origin";
a.y_location = "origin";

y1 = f1(intervalo);
y2 = f2(intervalo);

plot(intervalo, y1);  // Parte por encima del eje de las x de la parabola
plot(intervalo, y2);  // Parte por encima del eje de las x de la funcion lineal
plot(intervalo, -y1); // Parte por debajo del eje de las x de la parabola
plot(intervalo, -y2); // Parte por debajo del eje de las x de la funcion lineal


// Item B: Hallemos el valor de la integral con una precision de 4 digitos empleando 
//         el metodo del trapecio compuesto.



// CALCULO EL MAXIMO DEL VALOR ABSOLUTO de f''(x) en [-1,2] para acotar el error de integracion
//deff("y = derivada(x)", "y = %pi * (12 * x.**2 -12 * x -6)");
//disp(max(abs(derivada(intervalo))))

// En la hoja de resolucion, obtuvimos que para obtener esa precision, necesitamos que 
// n >= 1128 .Usemos el minimo natural que cumpla dicha desigualdad.

n = 1128; 

// Definamos el cuerpo de la funcion que queremos integrar
f = "%pi * ((x+3) - (x .** 2 + 1)).**2";

// Definimos los limites de integracion
a = -1;
b = 2;

// Aproximamos la funcion 
V = metodoTrapecioCompuesto(f, a, b); // V  = 25.4469

// Cuando calculamos laiintegral a mano, podemos ver que nuestra aproximacion
// tiene 4 cifras de precision.
