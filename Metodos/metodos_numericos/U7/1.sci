function p6_1()
endfunction

// Para interpolacion lineal debo usar dos puntos
// Elijo 0.2 y 0.4 con 1.2214 y 1.4918.
// En la cubica uso 4 valores pues necestio n+1 nros. y n = 3.
x1 = [0.2,0.4];
y1 = [1.2214,1.4918];
rango = [-2:0.01:2];
lineal = interpolLagrange(x1,y1);
plot(rango, horner(lineal,rango),"r");
//plot(rango, horner(cubica,rango),"b");
plot(rango, exp(rango),"rg");
a = gca();
a.x_location = "origin";
a.y_location = "origin";
h1 = legend("Lineal","Cubico","e^x");
