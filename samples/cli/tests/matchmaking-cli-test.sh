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
    --limit '3' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "oF01mbc7", "description": "MU56QF5c", "find_match_timeout_seconds": 41, "game_mode": "AolAiMM6", "joinable": true, "max_delay_ms": 60, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 48, "min": 73, "name": "fpbfFuNX"}, {"max": 79, "min": 95, "name": "oMqzP23f"}, {"max": 50, "min": 12, "name": "zrCxweFA"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 16, "role_flexing_second": 51}, "max_number": 23, "min_number": 43, "player_max_number": 45, "player_min_number": 36}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 68, "min": 40, "name": "vO2hrASx"}, {"max": 50, "min": 98, "name": "fGlFTzVP"}, {"max": 88, "min": 94, "name": "FhM23uf1"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 56, "role_flexing_second": 92}, "duration": 75, "max_number": 39, "min_number": 84, "player_max_number": 35, "player_min_number": 49}, {"combination": {"alliances": [{"max": 47, "min": 45, "name": "xOR41z4U"}, {"max": 88, "min": 22, "name": "Qb8gPImg"}, {"max": 17, "min": 97, "name": "zmPZ0V89"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 16, "role_flexing_second": 6}, "duration": 5, "max_number": 21, "min_number": 82, "player_max_number": 65, "player_min_number": 60}, {"combination": {"alliances": [{"max": 28, "min": 18, "name": "rCyQUHJv"}, {"max": 25, "min": 25, "name": "fRKDUaj0"}, {"max": 72, "min": 8, "name": "07MTwgES"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 5, "role_flexing_second": 35}, "duration": 33, "max_number": 48, "min_number": 30, "player_max_number": 24, "player_min_number": 80}], "flexing_rule": [{"attribute": "PyYYAMa9", "criteria": "7psq94jU", "duration": 19, "reference": 0.9310273506484381}, {"attribute": "Ougs9DjA", "criteria": "AqfFcCSa", "duration": 50, "reference": 0.21353507383201298}, {"attribute": "HO97b9O1", "criteria": "oqC1yiIL", "duration": 100, "reference": 0.7588715348624095}], "match_options": {"options": [{"name": "tZ4rJ677", "type": "9D1841XS"}, {"name": "iaZbybvs", "type": "Qy6546uc"}, {"name": "q9986Sxt", "type": "vs5ASymS"}]}, "matching_rule": [{"attribute": "PEEMWujJ", "criteria": "FsHAuvjH", "reference": 0.614849473906813}, {"attribute": "NZsScWP0", "criteria": "PYmAG5Si", "reference": 0.9651438084087038}, {"attribute": "hEHnIwDl", "criteria": "dxm3137r", "reference": 0.797298881278173}], "sub_game_modes": {"MHJ9WP21": {"alliance": {"combination": {"alliances": [{"max": 30, "min": 81, "name": "j9j5mTBV"}, {"max": 20, "min": 52, "name": "jmYbjeFP"}, {"max": 75, "min": 31, "name": "TaTo80R9"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 1, "role_flexing_second": 63}, "max_number": 73, "min_number": 16, "player_max_number": 99, "player_min_number": 92}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 64, "min": 78, "name": "xcdwHJ01"}, {"max": 29, "min": 0, "name": "vbRllmfs"}, {"max": 98, "min": 5, "name": "yVgycVAf"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 70, "role_flexing_second": 46}, "duration": 89, "max_number": 95, "min_number": 45, "player_max_number": 97, "player_min_number": 72}, {"combination": {"alliances": [{"max": 17, "min": 97, "name": "zdRylWCZ"}, {"max": 41, "min": 68, "name": "P8AovxHs"}, {"max": 61, "min": 10, "name": "IXMoOtsX"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 14, "role_flexing_second": 79}, "duration": 75, "max_number": 33, "min_number": 86, "player_max_number": 98, "player_min_number": 34}, {"combination": {"alliances": [{"max": 45, "min": 36, "name": "p97waBRo"}, {"max": 29, "min": 95, "name": "ITaVd2aT"}, {"max": 69, "min": 57, "name": "uZEXPfW6"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 88, "role_flexing_second": 53}, "duration": 99, "max_number": 99, "min_number": 79, "player_max_number": 67, "player_min_number": 91}], "name": "SAIoG7Mn"}, "aD1lczdZ": {"alliance": {"combination": {"alliances": [{"max": 20, "min": 67, "name": "REkYizsQ"}, {"max": 4, "min": 61, "name": "9BQMUNvs"}, {"max": 3, "min": 54, "name": "Pa2flT6d"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 75, "role_flexing_second": 74}, "max_number": 31, "min_number": 0, "player_max_number": 77, "player_min_number": 80}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 28, "min": 47, "name": "yLDNNpIS"}, {"max": 50, "min": 27, "name": "0ebhhEcW"}, {"max": 88, "min": 50, "name": "6w0dzVsQ"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 89, "role_flexing_second": 70}, "duration": 98, "max_number": 41, "min_number": 26, "player_max_number": 74, "player_min_number": 72}, {"combination": {"alliances": [{"max": 8, "min": 37, "name": "brFVJE0T"}, {"max": 13, "min": 11, "name": "nmZKK68z"}, {"max": 53, "min": 85, "name": "QzttwESy"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 68, "role_flexing_second": 77}, "duration": 45, "max_number": 43, "min_number": 95, "player_max_number": 34, "player_min_number": 62}, {"combination": {"alliances": [{"max": 95, "min": 22, "name": "e3kNpk6q"}, {"max": 40, "min": 45, "name": "eU04qHvC"}, {"max": 33, "min": 20, "name": "byAZPdXy"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 73, "role_flexing_second": 33}, "duration": 45, "max_number": 85, "min_number": 92, "player_max_number": 39, "player_min_number": 13}], "name": "eAJ0KlAz"}, "Kng0TWSr": {"alliance": {"combination": {"alliances": [{"max": 65, "min": 69, "name": "EQoYslas"}, {"max": 90, "min": 51, "name": "T9bKmG2B"}, {"max": 9, "min": 65, "name": "gGhwbRnL"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 70, "role_flexing_second": 19}, "max_number": 1, "min_number": 26, "player_max_number": 95, "player_min_number": 35}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 87, "min": 30, "name": "EIteoAem"}, {"max": 5, "min": 42, "name": "1zkZ2WLA"}, {"max": 92, "min": 22, "name": "WoK3Vkdj"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 37, "role_flexing_second": 84}, "duration": 70, "max_number": 16, "min_number": 9, "player_max_number": 12, "player_min_number": 35}, {"combination": {"alliances": [{"max": 79, "min": 77, "name": "ZjRN0YMA"}, {"max": 15, "min": 63, "name": "ChHuCmGh"}, {"max": 24, "min": 2, "name": "JwKkApZr"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 32, "role_flexing_second": 29}, "duration": 3, "max_number": 98, "min_number": 38, "player_max_number": 0, "player_min_number": 27}, {"combination": {"alliances": [{"max": 92, "min": 69, "name": "gKUBqGdW"}, {"max": 19, "min": 71, "name": "DfClha5T"}, {"max": 3, "min": 84, "name": "1yUI5dEC"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 51, "role_flexing_second": 9}, "duration": 12, "max_number": 80, "min_number": 51, "player_max_number": 4, "player_min_number": 76}], "name": "8MP91dUg"}}}, "session_queue_timeout_seconds": 91, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'K3LDcIz5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "ZMWBCd75", "players": [{"results": [{"attribute": "dVeHFneS", "value": 0.2725363768987632}, {"attribute": "0mxZyLdN", "value": 0.22628292302026132}, {"attribute": "TgaOEuOt", "value": 0.3775521075524916}], "user_id": "HRE74wWx"}, {"results": [{"attribute": "jhIS2Rt4", "value": 0.2975464735594381}, {"attribute": "IJkTJf6A", "value": 0.14391115974030122}, {"attribute": "6kPVJKt1", "value": 0.6882432817260209}], "user_id": "3PyzxyLl"}, {"results": [{"attribute": "m2E18fG0", "value": 0.8924652923023824}, {"attribute": "4KMpYgxO", "value": 0.607748883725237}, {"attribute": "RIJTfg5f", "value": 0.825763133144668}], "user_id": "nv41gVT9"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "D1unHmFR"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "hzcKoZ3D", "client_version": "bdRnnCyt", "deployment": "88ZaLRRV", "error_code": 68, "error_message": "PYkVJvdZ", "game_mode": "5POnZ5TZ", "joinable": false, "match_id": "is2MK5Kv", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 62, "party_attributes": {"0Dmozvj1": {}, "WFkIVAki": {}, "nfKVQWao": {}}, "party_id": "S1NDGNTQ", "party_members": [{"extra_attributes": {"qhdSZcmI": {}, "KWs7eQFp": {}, "GhLaA8Qk": {}}, "user_id": "q6iEoAIS"}, {"extra_attributes": {"dVRaOUps": {}, "Z1BfQoFE": {}, "TzZF4Zky": {}}, "user_id": "EFyc8yel"}, {"extra_attributes": {"ZxsELRk5": {}, "Q5O3QI7i": {}, "OHolteQf": {}}, "user_id": "huc9Vqmd"}], "ticket_id": "BJo3dePw"}, {"first_ticket_created_at": 84, "party_attributes": {"gE4UicZ3": {}, "HChyc5PI": {}, "NLd5amTO": {}}, "party_id": "jhe6oTrP", "party_members": [{"extra_attributes": {"3MSWwavb": {}, "bSLPaB6E": {}, "ZovN58eF": {}}, "user_id": "smqBNcyE"}, {"extra_attributes": {"v9K61zvP": {}, "CSfItYxK": {}, "V9tmO52t": {}}, "user_id": "HKNUkT2D"}, {"extra_attributes": {"3zBUGa65": {}, "adOGPpqk": {}, "jtPj9E1A": {}}, "user_id": "484As5Gz"}], "ticket_id": "jubPGcEc"}, {"first_ticket_created_at": 24, "party_attributes": {"AT4TNt2A": {}, "zG43uHLv": {}, "cVf2Wygr": {}}, "party_id": "5ilGKdNb", "party_members": [{"extra_attributes": {"JKZ6owYF": {}, "9lBaA6L5": {}, "dH33XPnG": {}}, "user_id": "5NmDO4P4"}, {"extra_attributes": {"cJ3PLS9K": {}, "pH9qe8sp": {}, "yKo2QoBq": {}}, "user_id": "Uk7CauTI"}, {"extra_attributes": {"uLa4WqXM": {}, "EMLcqLhT": {}, "zGGHO9ZL": {}}, "user_id": "cuYUd346"}], "ticket_id": "5mPD3Z9G"}]}, {"matching_parties": [{"first_ticket_created_at": 4, "party_attributes": {"E5PB03bl": {}, "P44dKiuq": {}, "qlXH0Krq": {}}, "party_id": "oovrsC8Q", "party_members": [{"extra_attributes": {"kc3ON9IA": {}, "PJoVOvzB": {}, "2xF6BDjr": {}}, "user_id": "BtflOAkj"}, {"extra_attributes": {"AvPFxfFw": {}, "8uSIwosL": {}, "mMKXugVJ": {}}, "user_id": "LxSMY2tj"}, {"extra_attributes": {"alYm620t": {}, "FhMK7Ywo": {}, "AnzhbWsm": {}}, "user_id": "rvvQBNek"}], "ticket_id": "q2GIRpg3"}, {"first_ticket_created_at": 9, "party_attributes": {"cJtdXK3j": {}, "4TbP7Mm8": {}, "bciAjynl": {}}, "party_id": "ghKbNglA", "party_members": [{"extra_attributes": {"oXW3Lg94": {}, "WK6wlkfc": {}, "cY1sxfpM": {}}, "user_id": "6xRRgmys"}, {"extra_attributes": {"JP4Gt9vt": {}, "SsPdWbO9": {}, "oiQYIO1E": {}}, "user_id": "8f27U0mV"}, {"extra_attributes": {"LIk8lFXF": {}, "A86bGRCX": {}, "zpUu3Sxm": {}}, "user_id": "AzbtO6Vo"}], "ticket_id": "u4SLyCAJ"}, {"first_ticket_created_at": 49, "party_attributes": {"OpqO8WTt": {}, "dPP2Iaph": {}, "01V8FZh1": {}}, "party_id": "oxwUavJn", "party_members": [{"extra_attributes": {"Cco9eafg": {}, "1v4hZNNJ": {}, "7HuIGT2S": {}}, "user_id": "JIeCn2yl"}, {"extra_attributes": {"duRcxRgA": {}, "COwCJEDI": {}, "A7rrozGQ": {}}, "user_id": "qoqMqsAG"}, {"extra_attributes": {"F8LNPmxQ": {}, "RI9j5yPu": {}, "q7DdvBcv": {}}, "user_id": "hZ2kROmT"}], "ticket_id": "YisK9PrU"}]}, {"matching_parties": [{"first_ticket_created_at": 15, "party_attributes": {"TpR0F1Fl": {}, "iSLpjDFw": {}, "zmFpPcYo": {}}, "party_id": "o4FrSKvD", "party_members": [{"extra_attributes": {"F2jnelam": {}, "tuXY356j": {}, "s8ZqkFkA": {}}, "user_id": "9kuJZETN"}, {"extra_attributes": {"qOioTsn0": {}, "rUpXNJLx": {}, "rL7GMEGA": {}}, "user_id": "jTcoD4dF"}, {"extra_attributes": {"XBOyCqmb": {}, "l8SN53Dw": {}, "EotGm4G7": {}}, "user_id": "JysVcKrm"}], "ticket_id": "UR6UePXA"}, {"first_ticket_created_at": 73, "party_attributes": {"JF8E6KII": {}, "89SF18eI": {}, "PhNqSm9q": {}}, "party_id": "fALum7Ei", "party_members": [{"extra_attributes": {"STZSXwoA": {}, "BKZsf699": {}, "NctJqadV": {}}, "user_id": "So3etkiZ"}, {"extra_attributes": {"1bIc03wm": {}, "svwDlXBL": {}, "Pw50g6Er": {}}, "user_id": "X5Ke28GT"}, {"extra_attributes": {"bcVT7xWG": {}, "x1tWyuTq": {}, "tFpKOZav": {}}, "user_id": "KEDHwjWo"}], "ticket_id": "AIHdbIRh"}, {"first_ticket_created_at": 39, "party_attributes": {"bNMGWlDC": {}, "e32tzNdq": {}, "jGpY8DBo": {}}, "party_id": "nSyJvRQo", "party_members": [{"extra_attributes": {"snFaZHaQ": {}, "uOEHJY1M": {}, "9DP2Xn7L": {}}, "user_id": "mPG1TeJV"}, {"extra_attributes": {"DsbYPWKz": {}, "wbWKXzwf": {}, "hVuXtuNa": {}}, "user_id": "gFlK8NZm"}, {"extra_attributes": {"1koFsVua": {}, "fJCiEeEu": {}, "UHEf04Yb": {}}, "user_id": "1sAkkmqF"}], "ticket_id": "LNUkxXw9"}]}], "namespace": "SjbSDvxj", "party_attributes": {"aY4WL60S": {}, "2vQh6nLg": {}, "ZChzl7P9": {}}, "party_id": "yZUMmqqh", "queued_at": 71, "region": "Zip0zewd", "server_name": "rJuLu5h2", "status": "U1SZy6kC", "ticket_id": "QPsbcnju", "updated_at": "1989-02-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "8AVJnXVd"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'CbQdYUIt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 28, "userID": "OMF5zDga", "weight": 0.7446605112736316}' \
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
    --matchIDs 'QEZyXk4o' \
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
    --strategy 'R2Rpqm9b' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'yNQ3p7UR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'ItYj20zk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "XdPJn6Ef", "description": "d9HFsywY", "findMatchTimeoutSeconds": 58, "joinable": true, "max_delay_ms": 94, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 26, "min": 70, "name": "AQcKC8SY"}, {"max": 72, "min": 84, "name": "utmwsTbL"}, {"max": 69, "min": 24, "name": "KbI2Xvjs"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 68, "role_flexing_second": 40}, "maxNumber": 50, "minNumber": 38, "playerMaxNumber": 33, "playerMinNumber": 92}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 40, "min": 60, "name": "tXlK3n61"}, {"max": 79, "min": 88, "name": "v5p3B9R7"}, {"max": 9, "min": 75, "name": "e4QqEH8A"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 63, "role_flexing_second": 89}, "duration": 41, "max_number": 0, "min_number": 58, "player_max_number": 43, "player_min_number": 19}, {"combination": {"alliances": [{"max": 50, "min": 0, "name": "lAr9d4Pd"}, {"max": 17, "min": 12, "name": "X9dAN0NP"}, {"max": 97, "min": 13, "name": "ULXHe07R"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 3, "role_flexing_second": 72}, "duration": 17, "max_number": 48, "min_number": 4, "player_max_number": 72, "player_min_number": 87}, {"combination": {"alliances": [{"max": 30, "min": 99, "name": "QJc5eWRH"}, {"max": 90, "min": 37, "name": "UaqiG5TU"}, {"max": 51, "min": 72, "name": "4RlfivoT"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 1}, "duration": 45, "max_number": 95, "min_number": 99, "player_max_number": 53, "player_min_number": 57}], "flexingRules": [{"attribute": "eUH4yBaB", "criteria": "ZrdM2EV8", "duration": 4, "reference": 0.7469165521684031}, {"attribute": "8DnL05wd", "criteria": "OD9Kz7G7", "duration": 4, "reference": 0.1010178567451957}, {"attribute": "CFTn0gLQ", "criteria": "Lhp1WBEM", "duration": 98, "reference": 0.573627040890786}], "match_options": {"options": [{"name": "pu0INLPs", "type": "E711J1uN"}, {"name": "pHhZ22Hv", "type": "irG4qioR"}, {"name": "MJbSGwsR", "type": "JLZTWJB8"}]}, "matchingRules": [{"attribute": "9AgQF0H9", "criteria": "hPd5vL00", "reference": 0.9365524450322864}, {"attribute": "XxfZPxpg", "criteria": "C36sWpzT", "reference": 0.3226124292858146}, {"attribute": "qjrk1e1f", "criteria": "fUtDv7OW", "reference": 0.23819595183694797}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 66, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'Um7992s4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '2D361mQ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'S9bxs4jY' \
    --matchID 'qMjrYkTF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["9LOfhWf7", "QivVhqJu", "XY8u9T9R"], "party_id": "2HeHOO5W", "user_id": "Ut2MX5lv"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'daKTSoDR' \
    --matchID 'T5tOlyP5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '0swvuYrA' \
    --matchID 'K8cJF7eu' \
    --namespace "$AB_NAMESPACE" \
    --userID 'O85WpAhC' \
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
    --channelName 'nw2bQbOt' \
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