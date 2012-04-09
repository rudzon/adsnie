%%% -------------------------------------------------------------------
%%% Author  : ZyK_BotaN
%%% Description :
%%%
%%% Created : 9 квіт. 2012
%%% -------------------------------------------------------------------
-module(conf_srv).

-behaviour(gen_server).
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% External exports
-export([start_link/0, get_neibs/0, get_name/0, add_neib/1, rem_neib/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

%% ====================================================================
%% External functions
%% ====================================================================

get_neibs() -> gen_server:call(conf_srv, get_neibs).

get_name() -> gen_server:call(conf_srv, get_name).

add_neib(Neib) -> gen_server:cast(conf_srv, {add_neib, Neib}).

rem_neib(Neib) -> gen_server:cast(conf_srv, {rem_neib, Neib}).

start_link() ->
   gen_server:start_link({local, conf_srv}, conf_srv, [], []).

%% ====================================================================
%% Server functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function: init/1
%% Description: Initiates the server
%% Returns: {ok, State}          |
%%          {ok, State, Timeout} |
%%          ignore               |
%%          {stop, Reason}
%% --------------------------------------------------------------------
init([]) ->
	Name = {"vasya", node()},
	Neibs = [],
    {ok, {Name, Neibs}}.

%% --------------------------------------------------------------------
%% Function: handle_call/3
%% Description: Handling call messages
%% Returns: {reply, Reply, State}          |
%%          {reply, Reply, State, Timeout} |
%%          {noreply, State}               |
%%          {noreply, State, Timeout}      |
%%          {stop, Reason, Reply, State}   | (terminate/2 is called)
%%          {stop, Reason, State}            (terminate/2 is called)
%% --------------------------------------------------------------------
handle_call(get_neibs, _From, {_Name, Neibs} = State) ->
    Reply = Neibs,
    {reply, Reply, State};

handle_call(get_name, _From, {Name, _Neibs} = State) ->
    Reply = Name,
    {reply, Reply, State}.


%% --------------------------------------------------------------------
%% Function: handle_cast/2
%% Description: Handling cast messages
%% Returns: {noreply, State}          |
%%          {noreply, State, Timeout} |
%%          {stop, Reason, State}            (terminate/2 is called)
%% --------------------------------------------------------------------
handle_cast({add_neib, Naib}, {_Name, Neibs} = _State) ->
    {noreply, {_Name, [Naib|Neibs]}};

handle_cast({rem_neib, Neib}, {_Name, Neibs} = _State) ->
    NewNeibs = lists:delete(Neib, Neibs),
	{noreply, {_Name, NewNeibs}}.

%% --------------------------------------------------------------------
%% Function: handle_info/2
%% Description: Handling all non call/cast messages
%% Returns: {noreply, State}          |
%%          {noreply, State, Timeout} |
%%          {stop, Reason, State}            (terminate/2 is called)
%% --------------------------------------------------------------------
handle_info(Info, State) ->
    {noreply, State}.

%% --------------------------------------------------------------------
%% Function: terminate/2
%% Description: Shutdown the server
%% Returns: any (ignored by gen_server)
%% --------------------------------------------------------------------
terminate(Reason, State) ->
    ok.

%% --------------------------------------------------------------------
%% Func: code_change/3
%% Purpose: Convert process state when code is changed
%% Returns: {ok, NewState}
%% --------------------------------------------------------------------
code_change(OldVsn, State, Extra) ->
    {ok, State}.

%% --------------------------------------------------------------------
%%% Internal functions
%% --------------------------------------------------------------------

