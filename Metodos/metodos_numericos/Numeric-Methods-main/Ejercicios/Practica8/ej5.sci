clc;
clear;

// exec("../../Metodos/Unidad8/integracionBidimensional.sci");
exec("D:\marti\Documents\Numeric-Methods\Metodos\Unidad8\integracionBidimensional.sci");


disp(integracionBidimensionalTrapecio("sin(x+y)", 0, 2, "0", "1", 1000, 1000));
