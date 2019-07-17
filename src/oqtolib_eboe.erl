-module(oqtolib_eboe).
-author("moein").

-include("oqtolib_eboe.hrl").

%% API
-export([open_session/3, get_invoices/2]).


-spec open_session(string(), string(), string()) -> {ok, string()}| {error, term()}.

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


get_invoices(SessionID, Sec2) ->

  Request = #'eboe:GetFacturen'{'SessionID' = SessionID,
    'SecurityCode2' = Sec2,
    cFilter = #'eboe:cFactuurFilter'{'DatumVan' = "2019-01-01", 'DatumTm' = oqtolib_utils:get_fix_now_date()}},

  Url = {url, "http://soap.e-boekhouden.nl/soap.asmx"},
  case oqtolib_eboe_client:'GetFacturen'(Request, [], [Url]) of
    {ok, 200, _, _, Body, _, _} ->
      case Body of
        #'eboe:GetFacturenResponse'{
          'GetFacturenResult' = #'eboe:cResultGetFacturen'{
            'Facturen' = #'eboe:ArrayOfCFactuurList'{
              cFactuurList = ListInvoice}}} ->
          Items = [begin
                     {ok, Info} = get_customer_info(SessionID, Sec2, B),
                     {ok, Lines_Items} = get_invoice_lines(J),
                     #{<<"ex_i_num">> => erlang:list_to_binary(I),
                       <<"date">> => erlang:list_to_binary(C),
                       <<"unpaid">> => erlang:list_to_integer(H),
                       <<"total">> => erlang:list_to_integer(G),
                       <<"totalBTW">> => erlang:list_to_integer(F),
                       <<"customer_info">> => Info,
                       <<"lines">> => Lines_Items} end ||

            #'eboe:cFactuurList'{
              'Factuurnummer' = I,
              'Relatiecode' = B,
              'Datum' = C,
%%            'Betalingstermijn' = D,
%%            'TotaalExclBTW' = E,
              'TotaalBTW' = F,
              'TotaalInclBTW' = G,
              'TotaalOpenstaand' = H,
              'Regels' = #'eboe:ArrayOfCFactuurRegel'{cFactuurRegel = J}} <- ListInvoice],

          {ok, Items};

        _ -> error
      end;

    _ -> error

  end.

get_customer_info(SessionID, Sec2, Code) ->
  Body0 = #'eboe:GetRelaties'{
    'SessionID' = SessionID,
    'SecurityCode2' = Sec2,
    cFilter = #'eboe:cRelatieFilter'{
      'Code' = Code,
      'ID' = "0"}},

  Url = {url, "http://soap.e-boekhouden.nl/soap.asmx"},

  case oqtolib_eboe_client:'GetRelaties'(Body0, [], [Url]) of
    {ok, 200, _, _, Body, _, _} ->
      case Body of
        {_, {_, _, {_, [Item]}}} ->
          #'eboe:cRelatie'{
%%            'ID' = A,
%%            'AddDatum' = B,
%%            'Code' = C,
            'Bedrijf' = D,
%%            'Contactpersoon' = E,
            'Geslacht' = F,
            'Adres' = G,
            'Postcode' = H,
            'Plaats' = I,
%%            'Land' = J,
            'Adres2' = K,
            'Postcode2' = L,
            'Plaats2' = M,
%%            'Land2' = N,
            'Telefoon' = P,
%%            'GSM' = Q,
%%            'FAX' = R,
            'Email' = S
%%            'Site' = T,
%%            'Notitie' = U,
%%            'Bankrekening' = V,
%%            'Girorekening' = W,
%%            'BTWNummer' = X,
%%            'Aanhef' = Y,
%%            'IBAN' = Z,
%%            'BIC' = A1,
%%            'BP' = A2,
%%            'Def1' = A3,
%%            'LA' = A4,
%%            'Gb_ID' = A5,
%%            'GeenEmail' = A6,
%%            'NieuwsbriefgroepenCount' = A7
          } = Item,

          Prefix = if F == "m" -> "MR"; true -> "MIS" end,
          [First, Last] = string:split(D, " ", leading),
          PhoneNumber = if P == [] -> ""; true -> P end,
          ZCode = if H == [] -> L;true -> H end,
          City = if I == [] -> M;true -> I end,

          Address = case lists:merge([G, K]) of [] -> "Unknown"; Addr -> Addr end,

          Info =
            #{<<"name">> => #{<<"prefix">> =>erlang:list_to_binary(Prefix),
              <<"first_name">> => erlang:list_to_binary(First),
              <<"last_name">> => erlang:list_to_binary(Last)
            },
              <<"email">> => #{
                <<"email_address">> => erlang:list_to_binary(S)
              },
              <<"phone">>=> #{
                <<"phone_number">>=> if PhoneNumber == [] -> <<"">>;true -> erlang:list_to_binary(PhoneNumber) end,
                <<"country_code">>=> <<"NL">>
              },
              <<"address">> => #{
                <<"address1">> => erlang:list_to_binary(Address),
                <<"address2">> => <<"">>,
                <<"locality">> => <<"">>,
                <<"house_number">> => <<"">>,
                <<"state">> => <<"">>,
                <<"zipcode">> => erlang:list_to_binary(ZCode),
                <<"city">> => erlang:list_to_binary(City),
                <<"country_code">> => <<"NL">>
              }},
          {ok, Info};
        _ -> error
      end;
    _ -> error
  end.


get_invoice_lines(Lines) ->
  Items = [
    #{<<"id">> => erlang:list_to_integer(A1),
      <<"desc">> => erlang:list_to_binary(D1),
      <<"price">> => erlang:list_to_integer(E1),
      <<"BTWCode">> => F1,
      <<"Ledgernumber">> => H1} ||
    #'eboe:cFactuurRegel'{
      'Aantal' = A1,
%%    'Eenheid' = B1,
%%    'Code' = C1,
      'Omschrijving' = D1,
      'PrijsPerEenheid' = E1,
      'BTWCode' = F1,
%%    'TegenrekeningCode' = G1,
      'KostenplaatsID' = H1
    } <- Lines],
  {ok, Items}.