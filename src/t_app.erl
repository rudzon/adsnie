%% Author: rudzon
%% Created: 9 квіт. 2012
%% Description: TODO: Add description to test_app
-module(t_app).
-behaviour(application).
%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/2, stop/1, alloc/0]).

%%
%% API Functions
%%
start(_Type, _Args) ->
    t_sup:start_link().
	
 
stop(_State) ->
    ok.

alloc() -> 
	t_work:alloc().
%%
%% Local Functions
%%

