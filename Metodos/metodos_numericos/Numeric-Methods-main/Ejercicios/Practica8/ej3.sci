clc;
clear;

exec("../../Metodos/Unidad8/metodoSimpson.sci");

function y = fa(x)
  y = 1 / x;
endfunction

function y = fb(x)
  y = x ^ 3;
endfunction

function y = fc(x)
  y = x * (1 + x ^ 2)^(1/2);
endfunction

function y = fd(x)
  y = sin(%pi * x);
endfunction

function y = fe(x)
  y = x * sin(x);
endfunction

function y = ff(x)
  y = x^2 * exp(x);
endfunction


simpA = reglaSimpsonCompuesta("1 / x", 1, 3, 4);
simpB = reglaSimpsonCompuesta("x ^ 3", 0, 2, 4);
simpC = reglaSimpsonCompuesta("x * (1 + x ^ 2)^(1/2)", 0, 3, 6);
simpD = reglaSimpsonCompuesta("sin(%pi * x)", 0, 1, 8);
simpE = reglaSimpsonCompuesta("x * sin(x)", 0, 2 * %pi, 8);
simpF = reglaSimpsonCompuesta("x^2 * exp(x)", 0, 1, 8);



intA = intg(1, 3, fa);
intB = intg(0, 2, fb);
intC = intg(0, 3, fc);
intD = intg(0, 1, fd);
intE = intg(0, 2*%pi, fe);
intF = intg(0, 1, ff);


disp("Valor integral A: " + string(intA) + " y Aproximacion integral A: " + string(simpA));
disp("Valor integral B: " + string(intB) + " y Aproximacion integral B: " + string(simpB));
disp("Valor integral C: " + string(intC) + " y Aproximacion integral C: " + string(simpC));
disp("Valor integral D: " + string(intD) + " y Aproximacion integral D: " + string(simpD));
disp("Valor integral E: " + string(intE) + " y Aproximacion integral E: " + string(simpE));
disp("Valor integral F: " + string(intF) + " y Aproximacion integral F: " + string(simpF));








