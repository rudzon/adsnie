%% Author: ZyK_BotaN
%% Created: 9 квіт. 2012
%% Description: TODO: Add description to dialog
-module(dialog).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([find_friend/3]).

%%
%% API Functions
%%

find_friend(Finder,Ttl, {_Nick, Addr} = _Recipient) ->
	rpc:call(Addr, reconf_srv, find_friend, [Finder, Ttl]).
	
%%
%% Local Functions
%%

