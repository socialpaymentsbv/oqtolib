-module(oqtolib_eboe).
-author("moein").

-include("oqtolib_eboe.hrl").

%% API
-export([open_session/3]).


open_session(UserName, Sec1, Sec2) ->
    Request = #'eboe:OpenSession'{
                 'Username' = UserName,
                 'SecurityCode1' = Sec1,
                 'SecurityCode2' = Sec2},
    Url = {url, "http://soap.e-boekhouden.nl/soap.asmx"},
    case oqtolib_eboe_client:'OpenSession'(Request, [], [Url]) of
        {ok, 200, _, _, Body, _, _} ->
            case Body of
                #'eboe:OpenSessionResponse'{
                   'OpenSessionResult' =
                       #'eboe:cResultOpenSession'{
                          'ErrorMsg' =
                              #'eboe:cError'{
                                 'LastErrorCode' = [],
                                 'LastErrorDescription' = []},
                          'SessionID' = SessionID}} -> {ok, SessionID};

                #'eboe:OpenSessionResponse'{
                   'OpenSessionResult' =
                       #'eboe:cResultOpenSession'{
                          'ErrorMsg' =
                              #'eboe:cError'{
                                 'LastErrorCode' = Code,
                                 'LastErrorDescription' = Desc}}} ->
                    {error, {Code, Desc}};

                E ->
                    {error, io_lib:format("~p", [E])}
            end;

        E -> {error, io_lib:format("~p", [E])}
    end.
