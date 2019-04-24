-module(oqtolib_utils).
-author("moein").

%% API
-export([get_fix_now_date/0]).

get_fix_now_date()->


  {Y0 , M0 ,D0} = erlang:date(),

  M =  if
    M0 < 10  ->"0"++erlang:integer_to_list(M0);
    true -> erlang:integer_to_list(M0)
  end ,

  D =  if
         D0 < 10  ->"0"++erlang:integer_to_list(D0);
         true -> erlang:integer_to_list(D0)
       end ,

 Y = erlang:integer_to_list(Y0) ,

  Y++"-"++M++"-"++D.