-module(contador).
-export([suma/0 devuelve/0, init/0]).

devuelve() ->
    receive
        init -> io:fwrite("[MOSTRADOR] Inicializando...~n"),
                devuelve();
        {show, Actual} -> io:fwrite("[MOSTRADOR] El valor actual es: ~p~n",[Actual]),
                devuelve();
        stop -> io:fwrite("[MOSTRADOR] Cerrando mostrador... ~n"),
                stop
    end.

suma() -> 
    receive
        init -> io:fwrite("[SUMADOR] Inicializando... ~n"),
                suma();
        {suma, Actual} -> io:fwrite("[SUMADOR] Sumando... ~n"),
                suma();

funcionar(Sumador, Mostrador, Actual) ->
    Line = io:get_line("[MAIN] Ingrese suma, show o stop: "),
    TrimmedLine = string:trim(Line),
    if
        TrimmedLine == "suma" -> Sumador !


init() ->
    io:fwrite("[MAIN] Se inicializa el contador con valor 0~n"),
    Sumador = spawn(contador, suma, []),
    Mostrador = spawn(contador, devuelve, []),
    Sumador ! init,
    Mostrador ! init,
    funcionar(Sumador, Mostrador, 0).


