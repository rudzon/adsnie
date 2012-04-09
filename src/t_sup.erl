%% Author: rudzon
%% Created: 9 квіт. 2012
%% Description: TODO: Add description to test_sup
-module(t_sup).
-behaviour(supervisor).
%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start_link/0]).
-export([init/1]).
 
%%
%% API Functions
%%


start_link() ->
   supervisor:start_link(t_sup, []).

init(_Args) ->

   {ok, {{one_for_one, 1, 60},
         [{t_work, {t_work, start_link, []},
           permanent, brutal_kill, worker, [t_work]}]}}.   



%%
%% Local Functions
%%

