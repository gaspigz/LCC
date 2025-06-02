-module(broadcast).
-export([iniciar/0, finalizar/1]).
-export([broadcast/2, registrar/1]).
-export([loopBroadcast/1]).

% Un servicio de Broadcast lo podemos pensar como un objeto concurrente que acepta dos
% funciones Registrar que registra al proceso que invoca la funcion y 
% Broadcast(Msg) que envia un mensaje a los procesos registrados.


iniciar() ->
    PidServer = spawn(broadcast, loopBroadcast, [[]]).


finalizar(PidServer) ->
    PidServer ! {fin}.

registrar(PidServer) ->
    PidServer ! {register, self()}.

broadcast(PidServer, Msg) ->
    PidServer ! {send, Msg}.

loopBroadcast(ListaClientes) ->
    receive
        {register, PidCliente} -> loopBroadcast([PidCliente | listaClientes]);
        {send, Msg} -> lists:foreach(fun(Pid) -> Pid ! Msg end, ListaClientes), 
                       loopBroadcast(ListaClientes);
        fin -> ok
    end.