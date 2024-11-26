clc;
clear;

exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad4\metodoGaussCompleto.sci");

x = [0 0 1 2 2 2];
v = [0 1 0 0 1 2];
y = [1.42, 1.85, 0.78, 0.18, 0.6, 1.05];

l = length(x)

// Definimos nuestra matriz A
A = zeros(l, 3);

A(:,1) = ones(l,1);
A(:,2) = x';
A(:,3) = v';

S = eliminacionGaussCompleta(A' * A, A' * y');

// Obtengamos la expresion
deff("y = f(x,v)", "y = " + string(S(1)) + "+" + string(S(2)) + "*x +" + string(S(3)) + "*v")

// Grafiquemos

set(gca(), "auto_clear", "off");
a = gca();
a.x_location = "origin";
a.y_location = "origin";


rango = [-3 : 0.1 : 3]
l = length(rango);
// Construimos las imagenes

imagenes = zeros(l,l);

for i = [1 : l]
  for j = [1 : l]
    imagenes(i,j) = f(rango(i),rango(j));
  end
end

// Ploteamos el plano
plot3d(rango, rango, imagenes, flag=[2,2,3]);

// Ploteamos los puntos
scatter3d(x,v,y);
