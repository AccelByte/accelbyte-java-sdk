#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..30"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetHealthcheckInfo
./ng net.accelbyte.sdk.cli.Main matchmaking getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 HandlerV3Healthz
./ng net.accelbyte.sdk.cli.Main matchmaking handlerV3Healthz \
    > test.out 2>&1
eval_tap $? 3 'HandlerV3Healthz' test.out

#- 4 GetAllChannelsHandler
./ng net.accelbyte.sdk.cli.Main matchmaking getAllChannelsHandler \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "KzOrC8Rw", "description": "2PxesflK", "find_match_timeout_seconds": 29, "game_mode": "386vz7Lf", "joinable": false, "max_delay_ms": 99, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 12, "min": 60, "name": "XaWwzLfg"}, {"max": 9, "min": 75, "name": "pw0SLtgC"}, {"max": 96, "min": 7, "name": "bftwK86I"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 88, "role_flexing_second": 84}, "max_number": 9, "min_number": 67, "player_max_number": 58, "player_min_number": 73}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 46, "min": 91, "name": "xMNeBvHO"}, {"max": 48, "min": 98, "name": "MlJYq21V"}, {"max": 30, "min": 97, "name": "siKcFZMO"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 2, "role_flexing_second": 95}, "duration": 38, "max_number": 38, "min_number": 2, "player_max_number": 10, "player_min_number": 51}, {"combination": {"alliances": [{"max": 79, "min": 53, "name": "tT6LFS92"}, {"max": 65, "min": 83, "name": "NxfopWmp"}, {"max": 62, "min": 47, "name": "kucamHDP"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 94, "role_flexing_second": 81}, "duration": 25, "max_number": 20, "min_number": 39, "player_max_number": 47, "player_min_number": 62}, {"combination": {"alliances": [{"max": 83, "min": 94, "name": "Z0W9i2xU"}, {"max": 61, "min": 42, "name": "hfvyaxB3"}, {"max": 61, "min": 81, "name": "VEUlb0Vz"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 8, "role_flexing_second": 56}, "duration": 56, "max_number": 0, "min_number": 25, "player_max_number": 96, "player_min_number": 25}], "flexing_rule": [{"attribute": "ILGOburE", "criteria": "IGDQgVO7", "duration": 90, "reference": 0.4474785058651395}, {"attribute": "M0EoAQLr", "criteria": "6ZW5lXBL", "duration": 3, "reference": 0.9246083860574721}, {"attribute": "NZFRJPOv", "criteria": "jENwt6g2", "duration": 43, "reference": 0.28345380827169886}], "match_options": {"options": [{"name": "1OXB7fmX", "type": "cMcBEZfX"}, {"name": "3bbZNYfB", "type": "gHlyaqPe"}, {"name": "ayhdItm7", "type": "RUGHEjP7"}]}, "matching_rule": [{"attribute": "ypQ9vjRp", "criteria": "OcYB1JuQ", "reference": 0.12261633733609267}, {"attribute": "S6n918JT", "criteria": "LtbqLVDF", "reference": 0.6728124516954687}, {"attribute": "g4muVufx", "criteria": "SORStx9F", "reference": 0.40162235728222473}], "rebalance_enable": false, "sub_game_modes": {"Ze3W4BRb": {"alliance": {"combination": {"alliances": [{"max": 5, "min": 91, "name": "myISvZbF"}, {"max": 33, "min": 51, "name": "Mfd7eJ8X"}, {"max": 47, "min": 83, "name": "iPGzpzOV"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 64, "role_flexing_second": 74}, "max_number": 9, "min_number": 14, "player_max_number": 26, "player_min_number": 47}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 82, "min": 34, "name": "S7cORWrY"}, {"max": 10, "min": 73, "name": "mtYBc0ut"}, {"max": 67, "min": 84, "name": "FKPHL92E"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 34, "role_flexing_second": 12}, "duration": 13, "max_number": 75, "min_number": 72, "player_max_number": 7, "player_min_number": 24}, {"combination": {"alliances": [{"max": 54, "min": 50, "name": "JOZLfAON"}, {"max": 12, "min": 94, "name": "S89COJrd"}, {"max": 84, "min": 47, "name": "1kUbK0xy"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 39, "role_flexing_second": 48}, "duration": 46, "max_number": 5, "min_number": 53, "player_max_number": 64, "player_min_number": 12}, {"combination": {"alliances": [{"max": 50, "min": 83, "name": "yO4DIlxy"}, {"max": 94, "min": 17, "name": "VLuWPha7"}, {"max": 98, "min": 89, "name": "TjwGIGUk"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 3, "role_flexing_second": 87}, "duration": 13, "max_number": 71, "min_number": 43, "player_max_number": 51, "player_min_number": 87}], "name": "cMM9Azob"}, "aIxWGH5t": {"alliance": {"combination": {"alliances": [{"max": 31, "min": 54, "name": "WllJlbpc"}, {"max": 75, "min": 75, "name": "KPE08HYV"}, {"max": 66, "min": 75, "name": "YcAsuE1t"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 60, "role_flexing_second": 12}, "max_number": 39, "min_number": 2, "player_max_number": 17, "player_min_number": 4}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 24, "min": 81, "name": "xHDNrOkH"}, {"max": 22, "min": 75, "name": "ElS3v4xm"}, {"max": 36, "min": 23, "name": "Yvr8o4Jx"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 91, "role_flexing_second": 16}, "duration": 74, "max_number": 60, "min_number": 86, "player_max_number": 66, "player_min_number": 2}, {"combination": {"alliances": [{"max": 12, "min": 61, "name": "wueeten3"}, {"max": 8, "min": 50, "name": "epKQ7iDW"}, {"max": 99, "min": 10, "name": "yjCRgYn2"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 29, "role_flexing_second": 64}, "duration": 14, "max_number": 6, "min_number": 34, "player_max_number": 27, "player_min_number": 74}, {"combination": {"alliances": [{"max": 87, "min": 69, "name": "kks73gKx"}, {"max": 34, "min": 87, "name": "EshhqNei"}, {"max": 43, "min": 72, "name": "elX6MtPT"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 21, "role_flexing_second": 29}, "duration": 64, "max_number": 89, "min_number": 30, "player_max_number": 37, "player_min_number": 17}], "name": "srr2oxDG"}, "TZ6sGnZU": {"alliance": {"combination": {"alliances": [{"max": 56, "min": 38, "name": "vLlKgDTE"}, {"max": 84, "min": 3, "name": "olWRvuOt"}, {"max": 26, "min": 55, "name": "aIJu2muP"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 37, "role_flexing_second": 6}, "max_number": 42, "min_number": 68, "player_max_number": 3, "player_min_number": 44}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 21, "min": 62, "name": "UPFgAHZU"}, {"max": 17, "min": 93, "name": "RMdrKkmq"}, {"max": 15, "min": 52, "name": "2ifDhPFr"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 76, "role_flexing_second": 24}, "duration": 2, "max_number": 35, "min_number": 46, "player_max_number": 6, "player_min_number": 72}, {"combination": {"alliances": [{"max": 88, "min": 53, "name": "8Wud9nSF"}, {"max": 60, "min": 87, "name": "6vdUIReT"}, {"max": 16, "min": 64, "name": "TRSFxfo3"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 80, "role_flexing_second": 24}, "duration": 13, "max_number": 89, "min_number": 18, "player_max_number": 82, "player_min_number": 52}, {"combination": {"alliances": [{"max": 90, "min": 69, "name": "PTtza0Wz"}, {"max": 27, "min": 28, "name": "T18sa2cO"}, {"max": 59, "min": 72, "name": "uIyn3Leu"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 16, "role_flexing_second": 79}, "duration": 35, "max_number": 95, "min_number": 6, "player_max_number": 29, "player_min_number": 72}], "name": "KKSwo5VE"}}}, "session_queue_timeout_seconds": 20, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel '4O15uVMn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "8u5vvdyP", "players": [{"results": [{"attribute": "BeCAlnso", "value": 0.05945658502129303}, {"attribute": "Z5CqZuRK", "value": 0.659696512353899}, {"attribute": "3F8r1L0W", "value": 0.1826355660731397}], "user_id": "oSAxea4G"}, {"results": [{"attribute": "sEBXwSMG", "value": 0.5184045178173254}, {"attribute": "eanqOELs", "value": 0.915247257580787}, {"attribute": "Jh7IdpAP", "value": 0.11929302433754219}], "user_id": "jAUrR7mE"}, {"results": [{"attribute": "rEkGbagA", "value": 0.8912908214076336}, {"attribute": "txliqo6t", "value": 0.2835537832192303}, {"attribute": "Fe5Z55Sw", "value": 0.6552084945930955}], "user_id": "ixdE0hcj"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "BfsTlNbB"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "5uVP1UyL", "client_version": "FLl3y0TS", "deployment": "YwEB18AS", "error_code": 46, "error_message": "5bTkMOa9", "game_mode": "ZaBjkd5C", "joinable": true, "match_id": "ykyaRWLG", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 78, "party_attributes": {"I61wWg8T": {}, "wlQyIy7F": {}, "htYF5Hxi": {}}, "party_id": "SaKGU1Qq", "party_members": [{"extra_attributes": {"CkGncG0t": {}, "tMX5M5ym": {}, "ZVGF8phR": {}}, "user_id": "jGnIAS7m"}, {"extra_attributes": {"qsJrIoq2": {}, "GmE9X0Qg": {}, "ZFfLIsL4": {}}, "user_id": "NDAWU24k"}, {"extra_attributes": {"QvSOu4rK": {}, "HwGiNTpp": {}, "QGF8XBcT": {}}, "user_id": "DZF2ED8h"}], "ticket_created_at": 100, "ticket_id": "ZTtSHCsl"}, {"first_ticket_created_at": 37, "party_attributes": {"C3hHG2wu": {}, "U1AQ0ta7": {}, "dvhrXZAn": {}}, "party_id": "DsPkVeAO", "party_members": [{"extra_attributes": {"oBeVS2ti": {}, "Ge4yZjY5": {}, "kfq1jr9y": {}}, "user_id": "iGetilMd"}, {"extra_attributes": {"q8haTqOn": {}, "ZcAfOEk2": {}, "ABYPytsn": {}}, "user_id": "oFtNgnAC"}, {"extra_attributes": {"q6z5gMaX": {}, "jTl5qRiG": {}, "Bl0k8707": {}}, "user_id": "5SGh2Jb5"}], "ticket_created_at": 4, "ticket_id": "aAaNAw5v"}, {"first_ticket_created_at": 0, "party_attributes": {"YwCNFiAQ": {}, "TnpLl5An": {}, "KTU9fXqb": {}}, "party_id": "Cosov6Ia", "party_members": [{"extra_attributes": {"COulooVY": {}, "Ebmzdg5o": {}, "0lwZNJIN": {}}, "user_id": "omIfuWGa"}, {"extra_attributes": {"6RqQjqGE": {}, "MPqjFCu4": {}, "B0UH1PTx": {}}, "user_id": "BTN0YAKA"}, {"extra_attributes": {"X2njF0g6": {}, "X1WhlpmA": {}, "sHxwwN1m": {}}, "user_id": "EJjo1X9o"}], "ticket_created_at": 78, "ticket_id": "3ar6eh0u"}]}, {"matching_parties": [{"first_ticket_created_at": 34, "party_attributes": {"uqdu5RUA": {}, "JchRNoPV": {}, "fAFgaU7r": {}}, "party_id": "G1r0P94n", "party_members": [{"extra_attributes": {"xGszdUq3": {}, "0IwZOa9X": {}, "I1t2zox7": {}}, "user_id": "zBHy7nq9"}, {"extra_attributes": {"99Xvf0uR": {}, "hoelcqY7": {}, "4VRFNbzR": {}}, "user_id": "RPUL6EyL"}, {"extra_attributes": {"srbFzRqf": {}, "MAXI4JsX": {}, "kVVYn5iT": {}}, "user_id": "W6iAn3IP"}], "ticket_created_at": 22, "ticket_id": "K29aOi7B"}, {"first_ticket_created_at": 36, "party_attributes": {"6bQmipCu": {}, "VFEHIC4p": {}, "9RiiMfTt": {}}, "party_id": "Wj1sRGn7", "party_members": [{"extra_attributes": {"dmaxaWcp": {}, "jl9SjynO": {}, "c7DAlJnd": {}}, "user_id": "9lxoNHav"}, {"extra_attributes": {"I4czsE34": {}, "H3cuZjOA": {}, "hi405GdP": {}}, "user_id": "g7Q0Jav2"}, {"extra_attributes": {"MD47tpOV": {}, "52KykyqD": {}, "oQZzM6Pa": {}}, "user_id": "3bmnUSL9"}], "ticket_created_at": 9, "ticket_id": "nsNQRkrb"}, {"first_ticket_created_at": 87, "party_attributes": {"rrYh5lvE": {}, "NgE8QRZZ": {}, "BvGXSC8F": {}}, "party_id": "QsdByF8X", "party_members": [{"extra_attributes": {"mxOWZtR6": {}, "R1ogGwsF": {}, "Ipk2668z": {}}, "user_id": "jWPwp6Fh"}, {"extra_attributes": {"T3UxuOLD": {}, "qUkANR5P": {}, "OlZ3l1xI": {}}, "user_id": "bTbUtlm0"}, {"extra_attributes": {"zNZtqrBy": {}, "MgKuJph9": {}, "gVipFo6y": {}}, "user_id": "81xRktoM"}], "ticket_created_at": 53, "ticket_id": "witSbaf9"}]}, {"matching_parties": [{"first_ticket_created_at": 29, "party_attributes": {"yKA1wwIT": {}, "fdSIUt86": {}, "AzEFfoGB": {}}, "party_id": "XEUr7YLT", "party_members": [{"extra_attributes": {"2yuyK8Ne": {}, "C1pWiHqP": {}, "CbM8EK0e": {}}, "user_id": "whp18Qbb"}, {"extra_attributes": {"454N2WL4": {}, "W4AUmwaz": {}, "0xqdIiUo": {}}, "user_id": "ZY9Zotkj"}, {"extra_attributes": {"FEP4Vf2x": {}, "EBJOUtUI": {}, "5BSgmr9D": {}}, "user_id": "z3CYH66i"}], "ticket_created_at": 14, "ticket_id": "HW8eJVaC"}, {"first_ticket_created_at": 53, "party_attributes": {"AnbImxHl": {}, "zpp8zcPY": {}, "2ceegq07": {}}, "party_id": "cwRhxVEY", "party_members": [{"extra_attributes": {"ARsf2o6I": {}, "LdFIqurH": {}, "o48xSz4q": {}}, "user_id": "IFfAQeQf"}, {"extra_attributes": {"dumqbHAp": {}, "T8Iw1kw4": {}, "Q3JLjuQj": {}}, "user_id": "EjLrnUT8"}, {"extra_attributes": {"l9lBNf0T": {}, "HtpAeloO": {}, "7lH3ddvI": {}}, "user_id": "5UFRvUOc"}], "ticket_created_at": 6, "ticket_id": "PmtU9lod"}, {"first_ticket_created_at": 36, "party_attributes": {"nUVhVs84": {}, "IJHPj561": {}, "NWL6an1C": {}}, "party_id": "PbiebJHu", "party_members": [{"extra_attributes": {"iGr4Dr8I": {}, "jscE30lJ": {}, "Eq2SoFKR": {}}, "user_id": "1Yyxi8lm"}, {"extra_attributes": {"qnR1vrEm": {}, "8ixVWshF": {}, "HRKM4cnC": {}}, "user_id": "UdIbZxBi"}, {"extra_attributes": {"guOTJJc5": {}, "pZJm2QhZ": {}, "ZmiN5zXU": {}}, "user_id": "cPtfIfI3"}], "ticket_created_at": 39, "ticket_id": "y3Mu61mP"}]}], "namespace": "zRJB3jbn", "party_attributes": {"T2Q6QgBg": {}, "2HuF9UGo": {}, "mgNe2uCM": {}}, "party_id": "jOC4JB09", "queued_at": 39, "region": "qMcf44z1", "server_name": "fLRum9E8", "status": "pTFz38oK", "ticket_id": "N2o8Tbu6", "updated_at": "1993-12-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "I9RTKYB9"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID '8vYv0BRq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 43, "userID": "RixztcgG", "weight": 0.2625850445590917}' \
    > test.out 2>&1
eval_tap $? 12 'UpdatePlayTimeWeight' test.out

#- 13 GetAllPartyInAllChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInAllChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetAllPartyInAllChannel' test.out

#- 14 BulkGetSessions
./ng net.accelbyte.sdk.cli.Main matchmaking bulkGetSessions \
    --namespace "$AB_NAMESPACE" \
    --matchIDs '3JRlRh7v' \
    > test.out 2>&1
eval_tap $? 14 'BulkGetSessions' test.out

#- 15 ExportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking exportChannels \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'ExportChannels' test.out

#- 16 ImportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking importChannels \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'dFcLwxWm' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'XSOIrKyI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'caeLVmch' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "DJLCqbRO", "description": "2m96a69A", "findMatchTimeoutSeconds": 87, "joinable": true, "max_delay_ms": 13, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 55, "min": 3, "name": "sOjpMOc9"}, {"max": 22, "min": 85, "name": "xSnhy2uz"}, {"max": 1, "min": 22, "name": "kDDPm51m"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 34, "role_flexing_second": 24}, "maxNumber": 14, "minNumber": 72, "playerMaxNumber": 39, "playerMinNumber": 44}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 89, "min": 19, "name": "ONp6cqpb"}, {"max": 18, "min": 27, "name": "Mm7mdx2E"}, {"max": 100, "min": 45, "name": "uaYIEvE1"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 12, "role_flexing_second": 62}, "duration": 77, "max_number": 94, "min_number": 46, "player_max_number": 45, "player_min_number": 37}, {"combination": {"alliances": [{"max": 53, "min": 30, "name": "x2qJ9fYL"}, {"max": 35, "min": 36, "name": "BwNeM0Lp"}, {"max": 3, "min": 45, "name": "54ccBajJ"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 40, "role_flexing_second": 11}, "duration": 43, "max_number": 29, "min_number": 37, "player_max_number": 45, "player_min_number": 89}, {"combination": {"alliances": [{"max": 66, "min": 72, "name": "4LVOSzwo"}, {"max": 63, "min": 72, "name": "IwkyBAat"}, {"max": 17, "min": 99, "name": "1Q956Zyw"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 3}, "duration": 35, "max_number": 31, "min_number": 79, "player_max_number": 88, "player_min_number": 8}], "flexingRules": [{"attribute": "fhXEgBTt", "criteria": "9XqWgaCm", "duration": 14, "reference": 0.20710167830444448}, {"attribute": "lgNCo80P", "criteria": "Z37kjeC4", "duration": 72, "reference": 0.44214953543888036}, {"attribute": "1Gu7fKAy", "criteria": "iB5fosOK", "duration": 3, "reference": 0.306541906070836}], "match_options": {"options": [{"name": "I8E3zAuy", "type": "GBHyM6LE"}, {"name": "mc11J8BZ", "type": "H4jj9PrQ"}, {"name": "MaZPSPzX", "type": "vBzTBka3"}]}, "matchingRules": [{"attribute": "fJZrRgJq", "criteria": "3ihUu2KS", "reference": 0.01565756477328295}, {"attribute": "2DniD1el", "criteria": "aCLNDE9e", "reference": 0.5826098019034833}, {"attribute": "SoaE88cB", "criteria": "g1XU6U0n", "reference": 0.1637196760417181}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 14, "socialMatchmaking": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'IZfpGLuR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'zKSUzCyi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName '4g2HSyXC' \
    --matchID 'nPLXBq8c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["ZKy94Fv7", "zcRsfzlC", "cWocv2dq"], "party_id": "eqjMQmED", "user_id": "hqHA5FcZ"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName '1vbKp24z' \
    --matchID 'kbtnM7Dh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'FpXs1Cda' \
    --matchID 'Bb1J8s0E' \
    --namespace "$AB_NAMESPACE" \
    --userID '8j6nqhq5' \
    > test.out 2>&1
eval_tap $? 23 'DeleteUserFromSessionInChannel' test.out

#- 24 SearchSessions
eval_tap 0 24 'SearchSessions # SKIP deprecated' test.out

#- 25 GetSessionHistoryDetailed
eval_tap 0 25 'GetSessionHistoryDetailed # SKIP deprecated' test.out

#- 26 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetMessages \
    > test.out 2>&1
eval_tap $? 26 'PublicGetMessages' test.out

#- 27 PublicGetAllMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetAllMatchmakingChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'PublicGetAllMatchmakingChannel' test.out

#- 28 PublicGetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetSingleMatchmakingChannel \
    --channelName 'xMoY5DR0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetSingleMatchmakingChannel' test.out

#- 29 SearchSessionsV2
eval_tap 0 29 'SearchSessionsV2 # SKIP deprecated' test.out

#- 30 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 30 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE