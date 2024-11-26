clc;
clear;

//exec("/home/martin/Documents/LCC/2do/R224 - Metodos Numericos/Metodos/Unidad8/integracionBidimensional.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad8\integracionBidimensional.sci");

limiteSuperior = "sqrt(1 - (x-1)**2)";
limiteInferior = "-sqrt(1 - (x-1)**2)";


disp(integracionBidimensionalSimpson("1", 0, 2, limiteInferior, limiteSuperior, 1000, 1000));
disp(integracionBidimensionalTrapecio("1", 0, 2, limiteInferior, limiteSuperior, 1000, 1000));
