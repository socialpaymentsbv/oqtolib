%%%-------------------------------------------------------------------
%% @doc oqtolib public API
%% @end
%%%-------------------------------------------------------------------

-module(oqtolib_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    application:ensure_started(soap),
    application:ensure_started(ibrowse),
    oqtolib_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
