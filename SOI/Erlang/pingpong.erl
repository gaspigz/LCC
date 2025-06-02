-module(pingpong).
-export([creaDosProcesos/0, comunicacion/1]).

comunicacion(MyID) ->
    receive
        {start, Pid} -> Pid ! {ok, self()},
                              comunicacion(MyID);
        {ok, Pid} -> io:fwrite("Recibi un mensaje y soy ~p~n", [MyID]),
                     Pid ! {stop, "Te respondo"},
                     comunicacion(MyID);
        {stop, Texto} -> io:fwrite("Me respondio con: ~s~n",[Texto])
    end.


creaDosProcesos() ->
    Pid1 = spawn(pingpong, comunicacion, [1]),
    Pid2 = spawn(pingpong, comunicacion, [2]),
    Pid1 ! {start, Pid2},
    Pid2 ! {start, Pid1}.

