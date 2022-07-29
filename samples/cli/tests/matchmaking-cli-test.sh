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
    --limit '70' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "bGQfJ974", "description": "gUktjvkc", "find_match_timeout_seconds": 46, "game_mode": "kX4nsIRj", "joinable": true, "max_delay_ms": 48, "rule_set": {"alliance": {"max_number": 67, "min_number": 25, "player_max_number": 68, "player_min_number": 75}, "alliance_flexing_rule": [{"duration": 88, "max_number": 52, "min_number": 82, "player_max_number": 75, "player_min_number": 46}, {"duration": 37, "max_number": 49, "min_number": 44, "player_max_number": 27, "player_min_number": 22}, {"duration": 23, "max_number": 85, "min_number": 91, "player_max_number": 94, "player_min_number": 62}], "flexing_rule": [{"attribute": "JsGO1ImY", "criteria": "FRt2eYOu", "duration": 15, "reference": 0.524772309221123}, {"attribute": "VLyuWbEk", "criteria": "Ad8C5cI8", "duration": 50, "reference": 0.9592413055929125}, {"attribute": "OeAMIfyI", "criteria": "WWL7JdNX", "duration": 56, "reference": 0.7272856411039361}], "match_options": {"options": [{"name": "VBOdf8AN", "type": "VXOQa5gO"}, {"name": "3GLydS1i", "type": "5euDOgPC"}, {"name": "4TFmH3Ak", "type": "4AP5QbxT"}]}, "matching_rule": [{"attribute": "blrwnoZM", "criteria": "sZ3sarxw", "reference": 0.7137938986270074}, {"attribute": "Tfq2EM7x", "criteria": "8CzqI4AU", "reference": 0.3207978283390964}, {"attribute": "8HHcs8YY", "criteria": "NbK7jD0Q", "reference": 0.2938947461716397}], "sub_game_modes": {"saX53lNF": {"alliance": {"max_number": 43, "min_number": 30, "player_max_number": 78, "player_min_number": 22}, "alliance_flexing_rule": [{"duration": 37, "max_number": 33, "min_number": 0, "player_max_number": 72, "player_min_number": 19}, {"duration": 27, "max_number": 96, "min_number": 44, "player_max_number": 17, "player_min_number": 77}, {"duration": 13, "max_number": 90, "min_number": 76, "player_max_number": 58, "player_min_number": 36}], "name": "HL65PQTA"}, "8LSjOS62": {"alliance": {"max_number": 13, "min_number": 5, "player_max_number": 52, "player_min_number": 78}, "alliance_flexing_rule": [{"duration": 81, "max_number": 49, "min_number": 78, "player_max_number": 48, "player_min_number": 90}, {"duration": 77, "max_number": 77, "min_number": 3, "player_max_number": 53, "player_min_number": 12}, {"duration": 8, "max_number": 79, "min_number": 51, "player_max_number": 68, "player_min_number": 88}], "name": "dkixtOvJ"}, "eUCirrl0": {"alliance": {"max_number": 61, "min_number": 34, "player_max_number": 58, "player_min_number": 63}, "alliance_flexing_rule": [{"duration": 72, "max_number": 69, "min_number": 100, "player_max_number": 34, "player_min_number": 9}, {"duration": 44, "max_number": 60, "min_number": 67, "player_max_number": 14, "player_min_number": 57}, {"duration": 27, "max_number": 92, "min_number": 63, "player_max_number": 18, "player_min_number": 56}], "name": "Ej5KV14t"}}}, "session_queue_timeout_seconds": 32, "social_matchmaking": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'qEsATMiS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "74DcRn3K", "players": [{"results": [{"attribute": "wzYep3OH", "value": 0.49432326863025844}, {"attribute": "fI58MQWd", "value": 0.5219815870219119}, {"attribute": "SHWipZQU", "value": 0.221701504834102}], "user_id": "MPvZEjAG"}, {"results": [{"attribute": "UO4NCAdX", "value": 0.21924292508804688}, {"attribute": "CzzcAxQs", "value": 0.9646034840133275}, {"attribute": "632mI9dz", "value": 0.61011894732071}], "user_id": "aNZx3V9O"}, {"results": [{"attribute": "ewb8B2Sz", "value": 0.3809211481207382}, {"attribute": "mK3Pnqxp", "value": 0.7700617069676243}, {"attribute": "CYOp3nTM", "value": 0.5056284466614555}], "user_id": "n0BZFZLK"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "kwWLRTYc"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "RUsSWOQ0", "client_version": "JJyClBk0", "deployment": "lY7as4JE", "game_mode": "D1cn4TfX", "joinable": false, "match_id": "hcu9Z9cp", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 29, "party_attributes": {"DQp0IH0K": {}, "2BILmmq2": {}, "ByBU4ShN": {}}, "party_id": "yPosuK31", "party_members": [{"extra_attributes": {"yK7BiJvM": {}, "LkT7akB3": {}, "yNn72p04": {}}, "user_id": "lbbKwTYr"}, {"extra_attributes": {"qt2LVXq9": {}, "UdddEbmZ": {}, "73fnCtGu": {}}, "user_id": "wqUcQx4h"}, {"extra_attributes": {"iR5EdEvK": {}, "VTa12yKT": {}, "qrHovDBg": {}}, "user_id": "CYVyU1WS"}]}, {"first_ticket_created_at": 58, "party_attributes": {"bChQUENw": {}, "6GaHt1Tv": {}, "ifJ8jLlC": {}}, "party_id": "SFQQcwng", "party_members": [{"extra_attributes": {"EiWmzfwH": {}, "pdUyxwZI": {}, "t3LqX3T6": {}}, "user_id": "JSxbET24"}, {"extra_attributes": {"TXTegENr": {}, "a5dZQ0Ul": {}, "aDBju7e8": {}}, "user_id": "vAal7cS4"}, {"extra_attributes": {"kjvYbsfS": {}, "jCUseGvG": {}, "NBiWXgPI": {}}, "user_id": "YxJf8Q7K"}]}, {"first_ticket_created_at": 45, "party_attributes": {"DNSKMNc9": {}, "ZcLEmvRw": {}, "HuZ10QFQ": {}}, "party_id": "vMSP7Hqr", "party_members": [{"extra_attributes": {"ge2BERsw": {}, "p6gTJLql": {}, "vENyyL0I": {}}, "user_id": "yRmykapX"}, {"extra_attributes": {"mC2xHW2h": {}, "lre0W4Ve": {}, "qZTazxgB": {}}, "user_id": "5qd6I5Wj"}, {"extra_attributes": {"sMzj52RU": {}, "Nq63XGfJ": {}, "zVyeE3zw": {}}, "user_id": "ejCeCTgA"}]}]}, {"matching_parties": [{"first_ticket_created_at": 39, "party_attributes": {"2O4VRJnT": {}, "1R6QUrWa": {}, "2okYv5tR": {}}, "party_id": "PDJZ2RHV", "party_members": [{"extra_attributes": {"mzt2NL9G": {}, "qTVvnSNM": {}, "Wg9GhUBt": {}}, "user_id": "Z7n9LlDa"}, {"extra_attributes": {"tDOfIQus": {}, "LI7xLoET": {}, "45opF8Ko": {}}, "user_id": "xkrKaKyL"}, {"extra_attributes": {"mG7Io7h2": {}, "BuzzP7I3": {}, "ebhiDx4E": {}}, "user_id": "YNieAOnZ"}]}, {"first_ticket_created_at": 79, "party_attributes": {"4JzvP3Ar": {}, "uTDLKnNu": {}, "kdVa9TFw": {}}, "party_id": "rJU9rCF3", "party_members": [{"extra_attributes": {"di7nI4BF": {}, "R4Opjij9": {}, "xVQMxtgE": {}}, "user_id": "YDxHcYOj"}, {"extra_attributes": {"7Mja75pB": {}, "NJg6jeph": {}, "LnuJDYWC": {}}, "user_id": "EraPbqMw"}, {"extra_attributes": {"F3317vhS": {}, "qbYWoWb4": {}, "Py1ScSrv": {}}, "user_id": "8HqTLBtw"}]}, {"first_ticket_created_at": 16, "party_attributes": {"oxcLjODM": {}, "VsSpur3f": {}, "Qtgoa9lS": {}}, "party_id": "8yvTCgvO", "party_members": [{"extra_attributes": {"DF3iFHJ2": {}, "9KMTbx2k": {}, "mhfEq7Yx": {}}, "user_id": "CXOUOo7n"}, {"extra_attributes": {"FcXqCC1g": {}, "XVjhW9Ot": {}, "Cuw7x45w": {}}, "user_id": "fkc2f1DT"}, {"extra_attributes": {"l4a5rsTu": {}, "d5djsB4B": {}, "qVV2C82v": {}}, "user_id": "Jp7Lpdx8"}]}]}, {"matching_parties": [{"first_ticket_created_at": 13, "party_attributes": {"50iAWGa7": {}, "21iSwjYe": {}, "5jk4mtn6": {}}, "party_id": "BgJMj1A1", "party_members": [{"extra_attributes": {"dP948zuf": {}, "yRnErksk": {}, "IGKmN6QP": {}}, "user_id": "mXA1qWbZ"}, {"extra_attributes": {"YopmNrOM": {}, "MTfSIYzP": {}, "TQbnD5fg": {}}, "user_id": "22HtHVyZ"}, {"extra_attributes": {"2u8M7Mim": {}, "LAUzptU5": {}, "CFLnpiou": {}}, "user_id": "RDslJDto"}]}, {"first_ticket_created_at": 25, "party_attributes": {"SSRousCH": {}, "ZnTnhLMF": {}, "FjsCWuOi": {}}, "party_id": "ZlmwSXCO", "party_members": [{"extra_attributes": {"yG2kdmm9": {}, "ewKCzfbO": {}, "lcSI32rc": {}}, "user_id": "KMlCHmhD"}, {"extra_attributes": {"8bASsjep": {}, "h1r920j6": {}, "0iV7ISRN": {}}, "user_id": "Zo3fjdMF"}, {"extra_attributes": {"DEghkUC3": {}, "cDSKNu84": {}, "WdcA8vch": {}}, "user_id": "SAulBQkA"}]}, {"first_ticket_created_at": 12, "party_attributes": {"I6QPXxuF": {}, "QN0Plx6T": {}, "ocFhslp8": {}}, "party_id": "we0tkYNh", "party_members": [{"extra_attributes": {"PW5x5JsD": {}, "MhYuyiFO": {}, "tvHzXMFV": {}}, "user_id": "atPbvRff"}, {"extra_attributes": {"abAobC0D": {}, "DwRFWh4C": {}, "kW5bELK9": {}}, "user_id": "66wqFBF5"}, {"extra_attributes": {"lnbDGGaM": {}, "2U0qDB9I": {}, "bfim5kaT": {}}, "user_id": "G0rSuCZB"}]}]}], "namespace": "NyH6yYrN", "party_attributes": {"eBuW9oIq": {}, "1ckeQ3CA": {}, "RabRcSWe": {}}, "party_id": "wfNdQzqZ", "queued_at": 60, "region": "5x8T81yE", "server_name": "2lpgw6LT", "status": "cyrdl8o8", "updated_at": "1991-09-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "PTOvi0Xk"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'K0gKbh97' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 84, "userID": "L7KWCHQK", "weight": 0.8016907011456381}' \
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
    --matchIDs 'YX9cMigE' \
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
    --strategy 'mS17toMu' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'PY25xESW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '0Q9K7xa0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "XfsySts9", "description": "NeRFYPqA", "findMatchTimeoutSeconds": 7, "joinable": true, "max_delay_ms": 89, "ruleSet": {"alliance": {"maxNumber": 93, "minNumber": 42, "playerMaxNumber": 96, "playerMinNumber": 78}, "alliance_flexing_rule": [{"duration": 23, "max_number": 55, "min_number": 44, "player_max_number": 22, "player_min_number": 89}, {"duration": 50, "max_number": 100, "min_number": 17, "player_max_number": 82, "player_min_number": 95}, {"duration": 63, "max_number": 79, "min_number": 52, "player_max_number": 90, "player_min_number": 42}], "flexingRules": [{"attribute": "uYAnx1zy", "criteria": "bAu9cCAs", "duration": 64, "reference": 0.9306104574257622}, {"attribute": "domLe07s", "criteria": "fEBmdHRr", "duration": 39, "reference": 0.09212455014091703}, {"attribute": "TSXuXWNv", "criteria": "CODrrEpW", "duration": 73, "reference": 0.6092993942562847}], "match_options": {"options": [{"name": "EAm52c35", "type": "IkaNxm8l"}, {"name": "lyrSdJt2", "type": "IU2AstRF"}, {"name": "dL2q2Np7", "type": "9dZPxUU5"}]}, "matchingRules": [{"attribute": "cv4H8NmZ", "criteria": "iIGUDUnw", "reference": 0.632876851364864}, {"attribute": "u1caomAe", "criteria": "3hdAp3Zf", "reference": 0.09972649760498697}, {"attribute": "3DAdTrEP", "criteria": "cflaD43c", "reference": 0.7544320701544867}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 90, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'eC9eylXx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'ntXOHzQT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'r1PCvGHq' \
    --matchID '9J79rNKW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["vLTdYLYA", "dop3hCBo", "QBMmFz14"], "party_id": "7EfIcELE", "user_id": "csh9lJ3Y"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'WmSqc22L' \
    --matchID '7zEkaPMn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'P9MlkiNV' \
    --matchID '2idc9y21' \
    --namespace "$AB_NAMESPACE" \
    --userID 'coKJOzsY' \
    > test.out 2>&1
eval_tap $? 23 'DeleteUserFromSessionInChannel' test.out

#- 24 SearchSessions
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessions \
    --namespace "$AB_NAMESPACE" \
    --channel 'WUpNOToC' \
    --deleted  \
    --matchID 'Qc5C9fKS' \
    --partyID 'YDLDSw26' \
    --userID 'KB2Houdf' \
    --limit '61' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 24 'SearchSessions' test.out

#- 25 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main matchmaking getSessionHistoryDetailed \
    --matchID '20tJwMRs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'GetSessionHistoryDetailed' test.out

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
    --channelName '7zSpNBNc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetSingleMatchmakingChannel' test.out

#- 29 SearchSessionsV2
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'SfcTMiEj' \
    --deleted  \
    --matchID 'dkNUHorf' \
    --partyID 'AVYXffi1' \
    --userID 'LqKjAcuN' \
    --limit '7' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 29 'SearchSessionsV2' test.out

#- 30 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 30 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE