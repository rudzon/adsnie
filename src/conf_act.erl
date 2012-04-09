%% Author: ZyK_BotaN
%% Created: 9 квіт. 2012
%% Description: TODO: Add description to conf_act
-module(conf_act).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0]).

%%
%% API Functions
%%

start() ->
	spawn(fun do/0).

%%
%% Local Functions
%%

do() -> 
	Neibs =  conf_srv:get_neibs(),
	Count = length(Neibs),
	if Count < 3 -> panic(Neibs);
	   Count < 5 -> find_friend(Neibs);
	   true -> timer:sleep(10000), do()
    end.
	
panic(Nodes) ->
	lists:map(Fun, List1)