clc;
clear;

I = 0.9262907;

exec("../../Metodos/Unidad8/metodoSimpson.sci");
exec("../../Metodos/Unidad8/metodoTrapecio.sci");

n = 10;

intTrapecio = metodoTrapecioCompuesto("1 / (x+1)", 0, 1.5, 10);
intMetodos = reglaSimpsonCompuesta("1 / (x+1)", 0, 1.5, 10);