-module(oqtolib_eboe_convert_SUITE).
-author("moein").

-include_lib("common_test/include/ct.hrl").
%% Test server callbacks
-export([suite/0, all/0, init_per_suite/1, end_per_suite/1]).

%% Test cases
-export([list_to_float_1/1,list_to_float_2/1]).

suite() ->
  [].


init_per_suite(Config) ->
  application:start(oqtolib),

  Config.


end_per_suite(_Config) ->
  ok.

all() ->
  [list_to_float_1,list_to_float_1].


list_to_float_1(_Config)->
  2.1 ==oqtolib_eboe:change_list_to_float("2.1").

list_to_float_2(_Config)->
  2 ==oqtolib_eboe:change_list_to_float("2").