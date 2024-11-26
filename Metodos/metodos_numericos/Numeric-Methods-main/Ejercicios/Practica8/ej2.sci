clc;
clear;

exec("../../Metodos/Unidad8/metodoTrapecio.sci");

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


trapA = metodoTrapecioCompuesto("1 / x", 1, 3, 4);
trapB = metodoTrapecioCompuesto("x ^ 3", 0, 2, 4);
trapC = metodoTrapecioCompuesto("x * (1 + x ^ 2)^(1/2)", 0, 3, 6);
trapD = metodoTrapecioCompuesto("sin(%pi * x)", 0, 1, 8);
trapE = metodoTrapecioCompuesto("x * sin(x)", 0, 2 * %pi, 8);
trapF = metodoTrapecioCompuesto("x^2 * exp(x)", 0, 1, 8);



intA = intg(1, 3, fa);
intB = intg(0, 2, fb);
intC = intg(0, 3, fc);
intD = intg(0, 1, fd);
intE = intg(0, 2*%pi, fe);
intF = intg(0, 1, ff);


disp("Valor integral A: " + string(intA) + " y Aproximacion integral A: " + string(trapA));
disp("Valor integral B: " + string(intB) + " y Aproximacion integral B: " + string(trapB));
disp("Valor integral C: " + string(intC) + " y Aproximacion integral C: " + string(trapC));
disp("Valor integral D: " + string(intD) + " y Aproximacion integral D: " + string(trapD));
disp("Valor integral E: " + string(intE) + " y Aproximacion integral E: " + string(trapE));
disp("Valor integral F: " + string(intF) + " y Aproximacion integral F: " + string(trapF));








