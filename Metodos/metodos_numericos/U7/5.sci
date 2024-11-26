x = [0 1 2 3];
// y = [1 3 3 k]; // Tengo que ir encontrando los valores
// P0,1(0) = 1 y P0,1(1) = 3 por ser interpolado en 0 y 1 sabemos que es exacto en esos lugares
// P0,2(2) = 3
//P1,2,3(2.5) = 3
//p_123 = L1(x)*3 + L2(x) * 3 + L3(x) * k; pero L no depende de y, y como tengo todos los elementos de x puedo calcularlos L1, L2 y L3.
L1 = Lk(x,1);
L2 = Lk(x,2);
L3 = Lk(x,3);
c1 = horner(L1, 2.5) * 3; // Los coeficientes
c2 = horner(L2, 2.5) * 3;
c3 = horner(L3, 2.5) * 3;

k = (3 - c1 - c2)/c3;

y = [1 3 3 k];

p = interpolLagrange(x,y);
res = horner(p,2.5);
disp(res);
