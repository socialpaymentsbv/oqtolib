-module(oqtolib_test).
-author("moein").

%% API
-export([test/0]).


-define(U , <<"PhilipCFO">>).
-define(S1 , <<"b34dc5f5f76ba207407309a661b36cb8">>).
-define(S2 , <<"D2EE7C93-8813-49AC-92BB-F213F8196042">>).

test()->
  {ok ,SS} =  oqtolib_eboe:open_session(?U, ?S1, ?S2) ,
  io:format("~n SS => ~p",[SS]),
  T = oqtolib_eboe:get_invoices(SS, ?S2) ,

  io:format("~n T => ~p",[T]).