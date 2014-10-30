-module(travisci_test_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% Test
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    travisci_test_sup:start_link().

stop(_State) ->
    ok.

-ifdef(TEST).

simple_test() ->
	ok = application:start(travisci_test),
	?assertNot(undefined == whereis(travisci_test_sup)).

-endif.
