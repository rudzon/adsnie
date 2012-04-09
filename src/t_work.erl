%% Author: rudzon
%% Created: 9 êâ³ò. 2012
%% Description: TODO: Add description to t_work
-module(t_work).
-behaviour(gen_server).
%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start_link/0,test/0]).
-export([alloc/0, free/1]).
-export([init/1, handle_call/3, handle_cast/2]).

%%
%% API Functions
%%
start_link() ->
   gen_server:start_link({local, t_work}, t_work, [], []).

alloc() ->
   gen_server:call(t_work, alloc).

free(Ch) ->
   gen_server:cast(t_work, {free, Ch}).

init(_Args) ->
   {ok, channels()}.

handle_call(alloc, _From, Chs) ->
   {Ch, Chs2} = alloc(Chs),
   {reply, Ch, Chs2}.

handle_cast({free, Ch}, Chs) ->
   Chs2 = free(Ch, Chs),
   {noreply, Chs2}.

test() -> 2.

%%
%% Local Functions
%%

channels() ->
   {_Allocated = [], _Free = lists:seq(5,10)}.

alloc({Allocated, [H|T] = _Free}) ->
   {H, {[H|Allocated], T}}.

free(Ch, {Alloc, Free} = Channels) ->
   case lists:member(Ch, Alloc) of
      true ->
         {lists:delete(Ch, Alloc), [Ch|Free]};
      false ->
         Channels
   end.