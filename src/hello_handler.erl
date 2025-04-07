-module(hello_handler).
-behaviour(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
   
    %% Default body, replace with required behaviour 
    %% See https://ninenines.eu/docs/en/cowboy/2.6/guide/handlers/
    NewState = [integer_to_list(rand:uniform(1000))| State],
    Body = "Response body" ++ NewState,
   	Res = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        list_to_binary(Body),
        Req0),
    io:format("incomming request! ~p ~n",[{Res, Req0, State}]),
    {ok, Res, NewState}.