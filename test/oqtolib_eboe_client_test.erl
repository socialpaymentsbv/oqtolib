-module(oqtolib_eboe_client_test).
-compile(export_all).

-include("oqtolib_eboe.hrl").


'GetAdministraties'() -> 
    oqtolib_eboe_client:'GetAdministraties'(
        #'eboe:GetAdministraties'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?"},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetSaldo'() -> 
    oqtolib_eboe_client:'GetSaldo'(
        #'eboe:GetSaldo'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            cFilter = 
                #'eboe:cSaldoFilter'{
                    % Optional:
                    'GbCode' = "?",
                    'KostenPlaatsId' = "?",
                    'DatumVan' = "?",
                    'DatumTot' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'AddFactuur'() -> 
    oqtolib_eboe_client:'AddFactuur'(
        #'eboe:AddFactuur'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            oFact = 
                #'eboe:cFactuur'{
                    % Optional:
                    'Factuurnummer' = "?",
                    % Optional:
                    'Relatiecode' = "?",
                    'Datum' = "?",
                    'Betalingstermijn' = "?",
                    % Optional:
                    'Factuursjabloon' = "?",
                    'PerEmailVerzenden' = true,
                    % Optional:
                    'EmailOnderwerp' = "?",
                    % Optional:
                    'EmailBericht' = "?",
                    % Optional:
                    'EmailVanAdres' = "?",
                    % Optional:
                    'EmailVanNaam' = "?",
                    'AutomatischeIncasso' = true,
                    % Optional:
                    'IncassoIBAN' = "?",
                    % Optional:
                    'IncassoMachtigingSoort' = "?",
                    % Optional:
                    'IncassoMachtigingID' = "?",
                    'IncassoMachtigingDatumOndertekening' = "?",
                    'IncassoMachtigingFirst' = true,
                    % Optional:
                    'IncassoRekeningNummer' = "?",
                    % Optional:
                    'IncassoTnv' = "?",
                    % Optional:
                    'IncassoPlaats' = "?",
                    % Optional:
                    'IncassoOmschrijvingRegel1' = "?",
                    % Optional:
                    'IncassoOmschrijvingRegel2' = "?",
                    % Optional:
                    'IncassoOmschrijvingRegel3' = "?",
                    'InBoekhoudingPlaatsen' = true,
                    % Optional:
                    'BoekhoudmutatieOmschrijving' = "?",
                    % Optional:
                    'Regels' = 
                        #'eboe:ArrayOfCFactuurRegel'{
                            % List with zero or more elements:
                            cFactuurRegel = [
                                #'eboe:cFactuurRegel'{
                                    'Aantal' = "?",
                                    % Optional:
                                    'Eenheid' = "?",
                                    % Optional:
                                    'Code' = "?",
                                    % Optional:
                                    'Omschrijving' = "?",
                                    'PrijsPerEenheid' = "?",
                                    % Optional:
                                    'BTWCode' = "?",
                                    % Optional:
                                    'TegenrekeningCode' = "?",
                                    'KostenplaatsID' = "?"}]}}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetFacturen'() -> 
    oqtolib_eboe_client:'GetFacturen'(
        #'eboe:GetFacturen'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            cFilter = 
                #'eboe:cFactuurFilter'{
                    % Optional:
                    'Factuurnummer' = "?",
                    % Optional:
                    'Relatiecode' = "?",
                    'DatumVan' = "?",
                    'DatumTm' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'AddMutatie'() -> 
    oqtolib_eboe_client:'AddMutatie'(
        #'eboe:AddMutatie'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            oMut = 
                #'eboe:cMutatie'{
                    'MutatieNr' = "?",
                    'Soort' = "?",
                    'Datum' = "?",
                    % Optional:
                    'Rekening' = "?",
                    % Optional:
                    'RelatieCode' = "?",
                    % Optional:
                    'Factuurnummer' = "?",
                    % Optional:
                    'Boekstuk' = "?",
                    % Optional:
                    'Omschrijving' = "?",
                    % Optional:
                    'Betalingstermijn' = "?",
                    % Optional:
                    'Betalingskenmerk' = "?",
                    % Optional:
                    'InExBTW' = "?",
                    % Optional:
                    'MutatieRegels' = 
                        #'eboe:ArrayOfCMutatieRegel'{
                            % List with zero or more elements:
                            cMutatieRegel = [
                                #'eboe:cMutatieRegel'{
                                    'BedragInvoer' = "?",
                                    'BedragExclBTW' = "?",
                                    'BedragBTW' = "?",
                                    'BedragInclBTW' = "?",
                                    % Optional:
                                    'BTWCode' = "?",
                                    'BTWPercentage' = "?",
                                    % Optional:
                                    'TegenrekeningCode' = "?",
                                    'KostenplaatsID' = "?"}]}}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetMutaties'() -> 
    oqtolib_eboe_client:'GetMutaties'(
        #'eboe:GetMutaties'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            cFilter = 
                #'eboe:cMutatieFilter'{
                    'MutatieNr' = "?",
                    % Optional:
                    'MutatieNrVan' = "?",
                    % Optional:
                    'MutatieNrTm' = "?",
                    % Optional:
                    'Factuurnummer' = "?",
                    'DatumVan' = "?",
                    'DatumTm' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'AddGrootboekrekening'() -> 
    oqtolib_eboe_client:'AddGrootboekrekening'(
        #'eboe:AddGrootboekrekening'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            oGb = 
                #'eboe:cGrootboekrekening'{
                    'ID' = "?",
                    % Optional:
                    'Code' = "?",
                    % Optional:
                    'Omschrijving' = "?",
                    % Optional:
                    'Categorie' = "?",
                    % Optional:
                    'Groep' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'UpdateGrootboekrekening'() -> 
    oqtolib_eboe_client:'UpdateGrootboekrekening'(
        #'eboe:UpdateGrootboekrekening'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            oGb = 
                #'eboe:cGrootboekrekening'{
                    'ID' = "?",
                    % Optional:
                    'Code' = "?",
                    % Optional:
                    'Omschrijving' = "?",
                    % Optional:
                    'Categorie' = "?",
                    % Optional:
                    'Groep' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetGrootboekrekeningen'() -> 
    oqtolib_eboe_client:'GetGrootboekrekeningen'(
        #'eboe:GetGrootboekrekeningen'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            cFilter = 
                #'eboe:cGrootboekrekeningFilter'{
                    'ID' = "?",
                    % Optional:
                    'Code' = "?",
                    % Optional:
                    'Categorie' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'AddRelatie'() -> 
    oqtolib_eboe_client:'AddRelatie'(
        #'eboe:AddRelatie'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            oRel = 
                #'eboe:cRelatie'{
                    'ID' = "?",
                    'AddDatum' = "?",
                    % Optional:
                    'Code' = "?",
                    % Optional:
                    'Bedrijf' = "?",
                    % Optional:
                    'Contactpersoon' = "?",
                    % Optional:
                    'Geslacht' = "?",
                    % Optional:
                    'Adres' = "?",
                    % Optional:
                    'Postcode' = "?",
                    % Optional:
                    'Plaats' = "?",
                    % Optional:
                    'Land' = "?",
                    % Optional:
                    'Adres2' = "?",
                    % Optional:
                    'Postcode2' = "?",
                    % Optional:
                    'Plaats2' = "?",
                    % Optional:
                    'Land2' = "?",
                    % Optional:
                    'Telefoon' = "?",
                    % Optional:
                    'GSM' = "?",
                    % Optional:
                    'FAX' = "?",
                    % Optional:
                    'Email' = "?",
                    % Optional:
                    'Site' = "?",
                    % Optional:
                    'Notitie' = "?",
                    % Optional:
                    'Bankrekening' = "?",
                    % Optional:
                    'Girorekening' = "?",
                    % Optional:
                    'BTWNummer' = "?",
                    % Optional:
                    'Aanhef' = "?",
                    % Optional:
                    'IBAN' = "?",
                    % Optional:
                    'BIC' = "?",
                    % Optional:
                    'BP' = "?",
                    % Optional:
                    'Def1' = "?",
                    % Optional:
                    'Def2' = "?",
                    % Optional:
                    'Def3' = "?",
                    % Optional:
                    'Def4' = "?",
                    % Optional:
                    'Def5' = "?",
                    % Optional:
                    'Def6' = "?",
                    % Optional:
                    'Def7' = "?",
                    % Optional:
                    'Def8' = "?",
                    % Optional:
                    'Def9' = "?",
                    % Optional:
                    'Def10' = "?",
                    % Optional:
                    'LA' = "?",
                    'Gb_ID' = "?",
                    'GeenEmail' = "?",
                    'NieuwsbriefgroepenCount' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'UpdateRelatie'() -> 
    oqtolib_eboe_client:'UpdateRelatie'(
        #'eboe:UpdateRelatie'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            oRel = 
                #'eboe:cRelatie'{
                    'ID' = "?",
                    'AddDatum' = "?",
                    % Optional:
                    'Code' = "?",
                    % Optional:
                    'Bedrijf' = "?",
                    % Optional:
                    'Contactpersoon' = "?",
                    % Optional:
                    'Geslacht' = "?",
                    % Optional:
                    'Adres' = "?",
                    % Optional:
                    'Postcode' = "?",
                    % Optional:
                    'Plaats' = "?",
                    % Optional:
                    'Land' = "?",
                    % Optional:
                    'Adres2' = "?",
                    % Optional:
                    'Postcode2' = "?",
                    % Optional:
                    'Plaats2' = "?",
                    % Optional:
                    'Land2' = "?",
                    % Optional:
                    'Telefoon' = "?",
                    % Optional:
                    'GSM' = "?",
                    % Optional:
                    'FAX' = "?",
                    % Optional:
                    'Email' = "?",
                    % Optional:
                    'Site' = "?",
                    % Optional:
                    'Notitie' = "?",
                    % Optional:
                    'Bankrekening' = "?",
                    % Optional:
                    'Girorekening' = "?",
                    % Optional:
                    'BTWNummer' = "?",
                    % Optional:
                    'Aanhef' = "?",
                    % Optional:
                    'IBAN' = "?",
                    % Optional:
                    'BIC' = "?",
                    % Optional:
                    'BP' = "?",
                    % Optional:
                    'Def1' = "?",
                    % Optional:
                    'Def2' = "?",
                    % Optional:
                    'Def3' = "?",
                    % Optional:
                    'Def4' = "?",
                    % Optional:
                    'Def5' = "?",
                    % Optional:
                    'Def6' = "?",
                    % Optional:
                    'Def7' = "?",
                    % Optional:
                    'Def8' = "?",
                    % Optional:
                    'Def9' = "?",
                    % Optional:
                    'Def10' = "?",
                    % Optional:
                    'LA' = "?",
                    'Gb_ID' = "?",
                    'GeenEmail' = "?",
                    'NieuwsbriefgroepenCount' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetRelaties'() -> 
    oqtolib_eboe_client:'GetRelaties'(
        #'eboe:GetRelaties'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            cFilter = 
                #'eboe:cRelatieFilter'{
                    % Optional:
                    'Trefwoord' = "?",
                    % Optional:
                    'Code' = "?",
                    'ID' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetOpenPosten'() -> 
    oqtolib_eboe_client:'GetOpenPosten'(
        #'eboe:GetOpenPosten'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            'OpSoort' = "?"},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'OpenSession'() -> 
    oqtolib_eboe_client:'OpenSession'(
        #'eboe:OpenSession'{
            % Optional:
            'Username' = "?",
            % Optional:
            'SecurityCode1' = "?",
            % Optional:
            'SecurityCode2' = "?"},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'CloseSession'() -> 
    oqtolib_eboe_client:'CloseSession'(
        #'eboe:CloseSession'{
            % Optional:
            'SessionID' = "?"},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'AutoLogin'() -> 
    oqtolib_eboe_client:'AutoLogin'(
        #'eboe:AutoLogin'{
            % Optional:
            'Username' = "?",
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?"},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetKostenplaatsen'() -> 
    oqtolib_eboe_client:'GetKostenplaatsen'(
        #'eboe:GetKostenplaatsen'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            cFilter = 
                #'eboe:cKostenplaatsFilter'{
                    % Optional:
                    'KostenplaatsID' = "?",
                    % Optional:
                    'KostenplaatsParentID' = "?",
                    % Optional:
                    'Omschrijving' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

'GetArtikelen'() -> 
    oqtolib_eboe_client:'GetArtikelen'(
        #'eboe:GetArtikelen'{
            % Optional:
            'SessionID' = "?",
            % Optional:
            'SecurityCode2' = "?",
            % Optional:
            cFilter = 
                #'eboe:cArtikelFilter'{
                    % Optional:
                    'ArtikelID' = "?",
                    % Optional:
                    'ArtikelOmschrijving' = "?",
                    % Optional:
                    'ArtikelCode' = "?",
                    % Optional:
                    'GroepOmschrijving' = "?",
                    % Optional:
                    'GroepCode' = "?"}},
    _Soap_headers = [],
    _Soap_options = [{url,"http://soap.e-boekhouden.nl/soap.asmx"}]).

