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
    --limit '34' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "mQjkPdJU", "description": "Uz7FeQ8n", "find_match_timeout_seconds": 25, "game_mode": "bYKcppTu", "joinable": true, "max_delay_ms": 87, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 59, "min": 50, "name": "H2j7RtuN"}, {"max": 47, "min": 88, "name": "h62d4VCB"}, {"max": 25, "min": 48, "name": "cHDJ9NCt"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 70, "role_flexing_second": 31}, "max_number": 52, "min_number": 33, "player_max_number": 69, "player_min_number": 95}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 40, "min": 52, "name": "uknaLzPn"}, {"max": 59, "min": 57, "name": "fL1b2d4A"}, {"max": 24, "min": 6, "name": "fodWSer8"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 16}, "duration": 23, "max_number": 90, "min_number": 49, "player_max_number": 36, "player_min_number": 38}, {"combination": {"alliances": [{"max": 50, "min": 22, "name": "9LtzY1tq"}, {"max": 61, "min": 34, "name": "9fQg2E2d"}, {"max": 58, "min": 38, "name": "pNRuGLoE"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 35, "role_flexing_second": 31}, "duration": 83, "max_number": 97, "min_number": 0, "player_max_number": 43, "player_min_number": 45}, {"combination": {"alliances": [{"max": 95, "min": 16, "name": "MppqCHcF"}, {"max": 93, "min": 29, "name": "iMamu3Oi"}, {"max": 19, "min": 0, "name": "81Ou1o85"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 8, "role_flexing_second": 73}, "duration": 76, "max_number": 1, "min_number": 40, "player_max_number": 4, "player_min_number": 47}], "flexing_rule": [{"attribute": "KQLudJcV", "criteria": "AbF6HDiY", "duration": 97, "reference": 0.3191621825256703}, {"attribute": "GY9YfaD9", "criteria": "A9yN5ghA", "duration": 53, "reference": 0.49512190527229094}, {"attribute": "Whqe8clb", "criteria": "BhLPR2W8", "duration": 16, "reference": 0.6508608560927813}], "match_options": {"options": [{"name": "0f4ZqKYL", "type": "YiPPDqXo"}, {"name": "RrhOLYxo", "type": "iv1nXdNN"}, {"name": "CeallhC2", "type": "Mguv734t"}]}, "matching_rule": [{"attribute": "Ntv6chS0", "criteria": "YATRSeg4", "reference": 0.07423633090933524}, {"attribute": "EHQTAfI6", "criteria": "TfWavZoI", "reference": 0.7240695352422457}, {"attribute": "XSEk6gOK", "criteria": "DHxahfcc", "reference": 0.10320435520586457}], "sub_game_modes": {"TXNgXee6": {"alliance": {"combination": {"alliances": [{"max": 18, "min": 17, "name": "YLrMBLbu"}, {"max": 50, "min": 40, "name": "N6IL3rWi"}, {"max": 55, "min": 11, "name": "h5FrucJE"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 53, "role_flexing_second": 41}, "max_number": 7, "min_number": 33, "player_max_number": 2, "player_min_number": 60}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 99, "min": 8, "name": "hPfS40ai"}, {"max": 42, "min": 77, "name": "VfT7gRs8"}, {"max": 48, "min": 80, "name": "TNWgcIJo"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 14, "role_flexing_second": 12}, "duration": 87, "max_number": 15, "min_number": 52, "player_max_number": 88, "player_min_number": 23}, {"combination": {"alliances": [{"max": 28, "min": 74, "name": "BnwV79P8"}, {"max": 45, "min": 46, "name": "UAffvBtd"}, {"max": 85, "min": 54, "name": "fBb5i9uC"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 19, "role_flexing_second": 49}, "duration": 4, "max_number": 8, "min_number": 92, "player_max_number": 90, "player_min_number": 65}, {"combination": {"alliances": [{"max": 92, "min": 31, "name": "Bowgo3Gz"}, {"max": 23, "min": 58, "name": "sUoxn5nb"}, {"max": 8, "min": 77, "name": "m85TOKI7"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 29, "role_flexing_second": 87}, "duration": 44, "max_number": 93, "min_number": 80, "player_max_number": 87, "player_min_number": 13}], "name": "cAQIWT8y"}, "wTPuBKmq": {"alliance": {"combination": {"alliances": [{"max": 22, "min": 66, "name": "bzyp4X7H"}, {"max": 71, "min": 9, "name": "NVOFP6v0"}, {"max": 52, "min": 50, "name": "TGBBcJjS"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 68, "role_flexing_second": 78}, "max_number": 42, "min_number": 56, "player_max_number": 51, "player_min_number": 14}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 22, "min": 17, "name": "KQH9kCj0"}, {"max": 84, "min": 0, "name": "5Hx2Licg"}, {"max": 11, "min": 73, "name": "yVOnlq48"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 86}, "duration": 35, "max_number": 14, "min_number": 50, "player_max_number": 86, "player_min_number": 52}, {"combination": {"alliances": [{"max": 70, "min": 96, "name": "7muuh0AE"}, {"max": 21, "min": 89, "name": "bpUc4UkL"}, {"max": 86, "min": 80, "name": "CIDWXBzz"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 64, "role_flexing_second": 15}, "duration": 25, "max_number": 1, "min_number": 75, "player_max_number": 76, "player_min_number": 45}, {"combination": {"alliances": [{"max": 89, "min": 79, "name": "HahlsjlE"}, {"max": 7, "min": 83, "name": "i5QkYaBW"}, {"max": 7, "min": 70, "name": "kAq6Y7Yv"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 7, "role_flexing_second": 48}, "duration": 71, "max_number": 40, "min_number": 96, "player_max_number": 91, "player_min_number": 11}], "name": "I87UUnJH"}, "JtVjdGKG": {"alliance": {"combination": {"alliances": [{"max": 74, "min": 27, "name": "beHoSB9s"}, {"max": 11, "min": 77, "name": "41VuGzGP"}, {"max": 63, "min": 57, "name": "wv7aBNB0"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 65, "role_flexing_second": 89}, "max_number": 21, "min_number": 22, "player_max_number": 41, "player_min_number": 60}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 42, "min": 21, "name": "yzrsS1zd"}, {"max": 58, "min": 59, "name": "QVXJdiTD"}, {"max": 88, "min": 36, "name": "vwXf9lKS"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 11, "role_flexing_second": 20}, "duration": 38, "max_number": 32, "min_number": 7, "player_max_number": 9, "player_min_number": 62}, {"combination": {"alliances": [{"max": 43, "min": 46, "name": "7sJu2kw3"}, {"max": 65, "min": 5, "name": "UF40ieOB"}, {"max": 84, "min": 71, "name": "OWq91g8T"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 42, "role_flexing_second": 97}, "duration": 48, "max_number": 84, "min_number": 56, "player_max_number": 43, "player_min_number": 19}, {"combination": {"alliances": [{"max": 3, "min": 73, "name": "wlxlywv8"}, {"max": 5, "min": 64, "name": "usEIDVtz"}, {"max": 68, "min": 1, "name": "GLAKqyeJ"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 45, "role_flexing_second": 63}, "duration": 41, "max_number": 83, "min_number": 41, "player_max_number": 70, "player_min_number": 45}], "name": "Y1PhRPE3"}}}, "session_queue_timeout_seconds": 38, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel '6eA3ScqL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "qEdChSNH", "players": [{"results": [{"attribute": "L41rw8xo", "value": 0.39527111497169365}, {"attribute": "EWydNMN2", "value": 0.5246474940271403}, {"attribute": "33E9t3oc", "value": 0.521676879562135}], "user_id": "WDx53I4u"}, {"results": [{"attribute": "BW52Wlck", "value": 0.06735691348517414}, {"attribute": "wuIR4mpT", "value": 0.5391541435003301}, {"attribute": "6QbJW7uc", "value": 0.25464654305261436}], "user_id": "AlZg8wh3"}, {"results": [{"attribute": "LY7QvCT7", "value": 0.3359260621251249}, {"attribute": "2G0ZJIYx", "value": 0.2717412691744947}, {"attribute": "co31ljAY", "value": 0.7072317127839992}], "user_id": "s3PkgVN1"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "9yGELsnM"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "PKtTHa3D", "client_version": "z9nPuZuY", "deployment": "JvxmU1lI", "error_code": 59, "error_message": "EwfhDqVc", "game_mode": "A76t2Ja4", "joinable": true, "match_id": "F1FtrDD4", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 67, "party_attributes": {"HdJeWuaa": {}, "l7RIsUwS": {}, "1sNEGLNc": {}}, "party_id": "fNo0QbOg", "party_members": [{"extra_attributes": {"kXvSZe5C": {}, "MQfNgN68": {}, "u0qEni5w": {}}, "user_id": "NvxOAiGq"}, {"extra_attributes": {"AUli6DVA": {}, "icJzqOA4": {}, "S4Z87Hdc": {}}, "user_id": "s3ruAGJ2"}, {"extra_attributes": {"VRYBESsu": {}, "yi9ZOVI3": {}, "RHessZ8P": {}}, "user_id": "t6tkEZmJ"}], "ticket_id": "e4bAlOiI"}, {"first_ticket_created_at": 16, "party_attributes": {"77HngLHX": {}, "lTeJh5wu": {}, "o1LPuCvz": {}}, "party_id": "mNi848y9", "party_members": [{"extra_attributes": {"TQDsrm4B": {}, "eMO2OVvj": {}, "W9g3l6r9": {}}, "user_id": "sZ8RUxnr"}, {"extra_attributes": {"MggBq2jB": {}, "Jty7PHvC": {}, "72enKFAH": {}}, "user_id": "P1l4JS0N"}, {"extra_attributes": {"SXGW3HvR": {}, "zZCIQJJ7": {}, "72tmzx8M": {}}, "user_id": "kwAZp1Hr"}], "ticket_id": "LvurelOu"}, {"first_ticket_created_at": 85, "party_attributes": {"UcDq6FZj": {}, "iUsWe9Vd": {}, "nUb2Rjhn": {}}, "party_id": "ype4DDHR", "party_members": [{"extra_attributes": {"60WGski3": {}, "8qF477nm": {}, "Tkpw75YC": {}}, "user_id": "TPj5qint"}, {"extra_attributes": {"F4aEq5NK": {}, "wccgXwwB": {}, "j6J4M4oR": {}}, "user_id": "BPGvZzoq"}, {"extra_attributes": {"pLqzV8fG": {}, "HFenQZn5": {}, "UKR9sXFs": {}}, "user_id": "5u1SQj76"}], "ticket_id": "Mp4vM0YP"}]}, {"matching_parties": [{"first_ticket_created_at": 18, "party_attributes": {"UVPKZGvM": {}, "RRwLYObX": {}, "KAXRPF1q": {}}, "party_id": "60mcjrMC", "party_members": [{"extra_attributes": {"mbD1wF43": {}, "Ckw1nqd2": {}, "SIpaKZXj": {}}, "user_id": "GsvVRxaR"}, {"extra_attributes": {"bcgAGtrF": {}, "OXU3EUP4": {}, "dPbbeDqt": {}}, "user_id": "6aAqocse"}, {"extra_attributes": {"IhzLCEXl": {}, "TUkVjJwL": {}, "3jBGOJ7F": {}}, "user_id": "5tW6oPER"}], "ticket_id": "E5Jn3ejj"}, {"first_ticket_created_at": 43, "party_attributes": {"3dJUr35k": {}, "SsKISJK0": {}, "IUfgOlKK": {}}, "party_id": "Tn0Fft2h", "party_members": [{"extra_attributes": {"pl2QwfWT": {}, "SHMif90J": {}, "szBZIeYO": {}}, "user_id": "j6X4AWLE"}, {"extra_attributes": {"Dl1claZG": {}, "ADbgs26g": {}, "h3uvUZPq": {}}, "user_id": "BpmzUEVW"}, {"extra_attributes": {"jc4H66Vy": {}, "Y88jwvMX": {}, "b5pfZgWX": {}}, "user_id": "4Aom3JGp"}], "ticket_id": "70Q1daqv"}, {"first_ticket_created_at": 72, "party_attributes": {"Ywr2mo29": {}, "o3fwGk9h": {}, "jezLRn1s": {}}, "party_id": "7SSiFKxV", "party_members": [{"extra_attributes": {"3LvCTybI": {}, "qXK7pyS3": {}, "fMf9Xyw2": {}}, "user_id": "BhNcUv6F"}, {"extra_attributes": {"ex03NEpA": {}, "Y1Lu5LX2": {}, "VphQLYeA": {}}, "user_id": "wVnX2vSi"}, {"extra_attributes": {"zDSjxC2S": {}, "Kez92efZ": {}, "ZKwnqHWJ": {}}, "user_id": "rUFZXuwE"}], "ticket_id": "f1BdZSIf"}]}, {"matching_parties": [{"first_ticket_created_at": 48, "party_attributes": {"q6br3ZkH": {}, "zOIonHtj": {}, "qOG3bwVN": {}}, "party_id": "IhWaAXI1", "party_members": [{"extra_attributes": {"GVxHjkM8": {}, "hX5Z8E3h": {}, "gfGkpVUx": {}}, "user_id": "YPTTgiRB"}, {"extra_attributes": {"31zpe5kP": {}, "Z9XLS5gW": {}, "NOfmHLHS": {}}, "user_id": "ho2qrXsT"}, {"extra_attributes": {"C2dqzNiU": {}, "0GlxPm6A": {}, "up9xjjf8": {}}, "user_id": "DRjqDdXK"}], "ticket_id": "MVbXOnfe"}, {"first_ticket_created_at": 1, "party_attributes": {"mUz917DI": {}, "BZDeo7XJ": {}, "tEWwTcHW": {}}, "party_id": "phZrTOqj", "party_members": [{"extra_attributes": {"69xQgTjC": {}, "ziQlT5Zj": {}, "VBHIwu8a": {}}, "user_id": "JX4ZsfMB"}, {"extra_attributes": {"nyArgFbS": {}, "tHMWvv2r": {}, "KdPmx3Pv": {}}, "user_id": "yYTHDOFx"}, {"extra_attributes": {"jPhGsInt": {}, "kFIA7DId": {}, "6WuLLfR8": {}}, "user_id": "mbyt05Js"}], "ticket_id": "AdURzdVu"}, {"first_ticket_created_at": 90, "party_attributes": {"b8gMGyKa": {}, "DmzJwjEd": {}, "AGm9GyfW": {}}, "party_id": "XP64d4wO", "party_members": [{"extra_attributes": {"p6eghSiv": {}, "gABCMyLK": {}, "MOvBUuVk": {}}, "user_id": "EBzuJncM"}, {"extra_attributes": {"fxhi5eoU": {}, "La7SH2Wn": {}, "0YvB0jKJ": {}}, "user_id": "wBrYbYQt"}, {"extra_attributes": {"kzq06oFP": {}, "Zgjq5qUd": {}, "0o0y504j": {}}, "user_id": "LXRh3cEN"}], "ticket_id": "TbLsuvZP"}]}], "namespace": "cvLHZQZ5", "party_attributes": {"lDHV3Bg9": {}, "C0hj1Al7": {}, "rmgJ2M4v": {}}, "party_id": "zRD2NOHn", "queued_at": 95, "region": "msMu8BIt", "server_name": "rbiKBhAk", "status": "20ldUtyl", "ticket_id": "AdpYA9dP", "updated_at": "1990-08-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "f3l9Bnyr"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'CofU4wwA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 34, "userID": "UmhEGA4J", "weight": 0.061393567349299016}' \
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
    --matchIDs 'fbLFU0Is' \
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
    --strategy '6C9HNaq8' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'fiQToxci' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'lwGnQeTu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "1VIfnuCw", "description": "aUSkW6z3", "findMatchTimeoutSeconds": 49, "joinable": true, "max_delay_ms": 74, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 67, "min": 25, "name": "hGceYKbb"}, {"max": 11, "min": 84, "name": "liNhtLrk"}, {"max": 34, "min": 1, "name": "isvA0OcO"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 3, "role_flexing_second": 70}, "maxNumber": 59, "minNumber": 95, "playerMaxNumber": 48, "playerMinNumber": 86}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 62, "min": 54, "name": "bSZnDg1o"}, {"max": 97, "min": 6, "name": "5m9UMtRE"}, {"max": 98, "min": 40, "name": "RFQYfYMn"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 15, "role_flexing_second": 88}, "duration": 8, "max_number": 95, "min_number": 65, "player_max_number": 36, "player_min_number": 80}, {"combination": {"alliances": [{"max": 59, "min": 60, "name": "fWNf6qET"}, {"max": 64, "min": 79, "name": "pIXKrIcm"}, {"max": 96, "min": 60, "name": "C2sC96dr"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 19, "role_flexing_second": 96}, "duration": 14, "max_number": 92, "min_number": 100, "player_max_number": 86, "player_min_number": 10}, {"combination": {"alliances": [{"max": 18, "min": 18, "name": "c9XyQvpt"}, {"max": 76, "min": 44, "name": "zqId8BGW"}, {"max": 38, "min": 89, "name": "Sjqv2PfT"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 45, "role_flexing_second": 53}, "duration": 68, "max_number": 19, "min_number": 9, "player_max_number": 44, "player_min_number": 14}], "flexingRules": [{"attribute": "Vw8icuez", "criteria": "sSwAdi0x", "duration": 33, "reference": 0.4433810827564978}, {"attribute": "ZpEjxS1P", "criteria": "2dZGJFre", "duration": 4, "reference": 0.8039793783329202}, {"attribute": "q0LyBn0K", "criteria": "nbiNlsvn", "duration": 80, "reference": 0.11163774795690573}], "match_options": {"options": [{"name": "8Yeb7N8Q", "type": "dbSouPOR"}, {"name": "rGqvcXnR", "type": "mSi7jJzp"}, {"name": "C8afNWoP", "type": "mgwCdxLP"}]}, "matchingRules": [{"attribute": "A0f8Mk2y", "criteria": "V3lwRxOQ", "reference": 0.9207466783681459}, {"attribute": "VCkUqtOc", "criteria": "ibQ53P8c", "reference": 0.8093645649045785}, {"attribute": "5Wwy6pcU", "criteria": "ABAsGEgJ", "reference": 0.1380573261557405}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 15, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'XIPOvfiL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '6hFcFnKy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'HvY8CqU0' \
    --matchID 'lrstQ21L' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["Dv7vYwmb", "aCPgfVv8", "keHxjqEX"], "party_id": "NkfyNg2j", "user_id": "k4hfvt72"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'y2LFOw8F' \
    --matchID 'vEOjTAUg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'WlUFywNj' \
    --matchID 'lGgjR4Y6' \
    --namespace "$AB_NAMESPACE" \
    --userID '5ZpAzuj9' \
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
    --channelName 'qiIYzIvp' \
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