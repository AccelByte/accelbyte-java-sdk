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
    --limit '55' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "F8hc5JBb", "description": "DPre1rtW", "find_match_timeout_seconds": 75, "game_mode": "E1GFpEqO", "joinable": true, "max_delay_ms": 36, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 7, "min": 29, "name": "671VTbbo"}, {"max": 61, "min": 77, "name": "TvHqWT0l"}, {"max": 51, "min": 60, "name": "1VHgxmql"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 94, "role_flexing_second": 26}, "max_number": 70, "min_number": 34, "player_max_number": 47, "player_min_number": 42}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 3, "min": 85, "name": "HKoY5uQp"}, {"max": 68, "min": 97, "name": "O5s2crX2"}, {"max": 44, "min": 80, "name": "vZgj2xs5"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 34, "role_flexing_second": 60}, "duration": 13, "max_number": 45, "min_number": 69, "player_max_number": 41, "player_min_number": 44}, {"combination": {"alliances": [{"max": 1, "min": 15, "name": "O9DV7xkK"}, {"max": 50, "min": 20, "name": "DFf8xGNy"}, {"max": 69, "min": 82, "name": "PcrzXmLH"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 68, "role_flexing_second": 79}, "duration": 87, "max_number": 96, "min_number": 52, "player_max_number": 52, "player_min_number": 35}, {"combination": {"alliances": [{"max": 49, "min": 7, "name": "efCi8k0J"}, {"max": 61, "min": 33, "name": "O8LDEShA"}, {"max": 24, "min": 20, "name": "9GcIlarq"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 43, "role_flexing_second": 43}, "duration": 54, "max_number": 15, "min_number": 2, "player_max_number": 27, "player_min_number": 10}], "flexing_rule": [{"attribute": "Tz32p7AN", "criteria": "RB31Iljd", "duration": 8, "reference": 0.25110468192764146}, {"attribute": "4G5O58to", "criteria": "4e64Vq2O", "duration": 16, "reference": 0.9678590353292231}, {"attribute": "dYHriDEn", "criteria": "x3Vg6Wn8", "duration": 62, "reference": 0.24973806229144935}], "match_options": {"options": [{"name": "9Bdxr8D7", "type": "E3e3Ukt3"}, {"name": "vO4bxtPB", "type": "O0jWIm3Q"}, {"name": "pg2EfvXW", "type": "BCU4CMav"}]}, "matching_rule": [{"attribute": "Qnw4gfWX", "criteria": "loedo5v7", "reference": 0.8822701879731368}, {"attribute": "Y949tZuF", "criteria": "sPpUmYhG", "reference": 0.5076377298465866}, {"attribute": "VArHzRuX", "criteria": "ytiZIaue", "reference": 0.16242112188665492}], "rebalance_enable": false, "sub_game_modes": {"t5JiKUyC": {"alliance": {"combination": {"alliances": [{"max": 34, "min": 22, "name": "yRCBsqML"}, {"max": 100, "min": 22, "name": "PphV2mNw"}, {"max": 70, "min": 73, "name": "O47v09iY"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 66, "role_flexing_second": 58}, "max_number": 38, "min_number": 67, "player_max_number": 17, "player_min_number": 31}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 23, "min": 89, "name": "D9ld5dTj"}, {"max": 35, "min": 8, "name": "knDF1DRH"}, {"max": 91, "min": 37, "name": "gR5okXUy"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 42, "role_flexing_second": 44}, "duration": 100, "max_number": 58, "min_number": 28, "player_max_number": 6, "player_min_number": 15}, {"combination": {"alliances": [{"max": 71, "min": 83, "name": "PtAkknZr"}, {"max": 19, "min": 21, "name": "gotG1Iwt"}, {"max": 93, "min": 57, "name": "UaVxKE4R"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 91, "role_flexing_second": 75}, "duration": 23, "max_number": 66, "min_number": 67, "player_max_number": 39, "player_min_number": 72}, {"combination": {"alliances": [{"max": 34, "min": 2, "name": "qOebo9nc"}, {"max": 31, "min": 56, "name": "QXVrbBrU"}, {"max": 66, "min": 72, "name": "5fWlxkqS"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 10, "role_flexing_second": 89}, "duration": 67, "max_number": 63, "min_number": 16, "player_max_number": 31, "player_min_number": 50}], "name": "O4RfLGDg"}, "Ia35P9eI": {"alliance": {"combination": {"alliances": [{"max": 85, "min": 13, "name": "NOWoLu1m"}, {"max": 66, "min": 68, "name": "wKC1jufr"}, {"max": 6, "min": 57, "name": "urDqbZBN"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 21, "role_flexing_second": 67}, "max_number": 53, "min_number": 99, "player_max_number": 27, "player_min_number": 58}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 30, "min": 38, "name": "oJcfuCB8"}, {"max": 42, "min": 32, "name": "jE2jIJHw"}, {"max": 31, "min": 69, "name": "fvvm9XxC"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 28, "role_flexing_second": 67}, "duration": 76, "max_number": 40, "min_number": 0, "player_max_number": 27, "player_min_number": 87}, {"combination": {"alliances": [{"max": 79, "min": 81, "name": "ZTGfzcfM"}, {"max": 81, "min": 1, "name": "SOtHO7gO"}, {"max": 15, "min": 70, "name": "KdqFpj45"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 86, "role_flexing_second": 46}, "duration": 26, "max_number": 36, "min_number": 20, "player_max_number": 38, "player_min_number": 74}, {"combination": {"alliances": [{"max": 35, "min": 45, "name": "7jZoYRh9"}, {"max": 64, "min": 92, "name": "ERaVGsDA"}, {"max": 91, "min": 92, "name": "0TokweLW"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 30}, "duration": 28, "max_number": 79, "min_number": 91, "player_max_number": 4, "player_min_number": 47}], "name": "GHUDMtIs"}, "7LMFTiKt": {"alliance": {"combination": {"alliances": [{"max": 87, "min": 35, "name": "zFxng8OO"}, {"max": 69, "min": 96, "name": "WpgDG3rg"}, {"max": 5, "min": 31, "name": "cOyRliXt"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 9, "role_flexing_second": 34}, "max_number": 84, "min_number": 51, "player_max_number": 12, "player_min_number": 26}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 84, "min": 5, "name": "bEjlu6Dk"}, {"max": 64, "min": 45, "name": "9qYt9ORx"}, {"max": 10, "min": 37, "name": "C5K9cVuq"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 35, "role_flexing_second": 7}, "duration": 77, "max_number": 20, "min_number": 27, "player_max_number": 17, "player_min_number": 4}, {"combination": {"alliances": [{"max": 77, "min": 4, "name": "S1vrSbhv"}, {"max": 87, "min": 32, "name": "MNnulS2g"}, {"max": 52, "min": 63, "name": "xPxen24b"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 47, "role_flexing_second": 22}, "duration": 96, "max_number": 36, "min_number": 76, "player_max_number": 88, "player_min_number": 44}, {"combination": {"alliances": [{"max": 42, "min": 93, "name": "GqYJJcVQ"}, {"max": 83, "min": 84, "name": "MbVgOTVH"}, {"max": 33, "min": 4, "name": "4emQfuyq"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 37, "role_flexing_second": 83}, "duration": 53, "max_number": 0, "min_number": 70, "player_max_number": 36, "player_min_number": 46}], "name": "58l9wraQ"}}}, "session_queue_timeout_seconds": 98, "social_matchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'm2H07IoY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "t7zDg0bi", "players": [{"results": [{"attribute": "rlab6LYE", "value": 0.2235315892164158}, {"attribute": "LQ15ZxCi", "value": 0.4781396134961582}, {"attribute": "WfhlI6Im", "value": 0.2720874702399213}], "user_id": "17pd8hsg"}, {"results": [{"attribute": "DzNmbEci", "value": 0.7642156913722113}, {"attribute": "bJpeNBMb", "value": 0.4481491803891844}, {"attribute": "ZJ6ViUKB", "value": 0.47774869566289424}], "user_id": "6bOiOI9l"}, {"results": [{"attribute": "xrVZptRC", "value": 0.9914688208623917}, {"attribute": "8pvb40J1", "value": 0.057620894162560776}, {"attribute": "e9Katfpo", "value": 0.820039004308997}], "user_id": "CU5gYQzS"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "itI95DBR"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "LwswBVZt", "client_version": "bm99vM6t", "deployment": "hcLf5jt0", "error_code": 11, "error_message": "UgVxzMmc", "game_mode": "h2jW9cEc", "joinable": false, "match_id": "iEZ1rl0A", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 72, "party_attributes": {"lfAuUpf6": {}, "dFuGIW7E": {}, "xGyIzLGO": {}}, "party_id": "Y7JqoMaC", "party_members": [{"extra_attributes": {"6nkmmSND": {}, "hU0aPgLo": {}, "vseFQP4h": {}}, "user_id": "qKW56ZcY"}, {"extra_attributes": {"ymyWxuxw": {}, "WuYBKesk": {}, "jz5aovRh": {}}, "user_id": "NvOFRhm8"}, {"extra_attributes": {"7heHkRAk": {}, "cyqGe7FP": {}, "GVXZLiIB": {}}, "user_id": "eVwf0a8r"}], "ticket_id": "Fab7yFCm"}, {"first_ticket_created_at": 39, "party_attributes": {"DzojOnXb": {}, "6tZzpvKE": {}, "eZ4N1UT7": {}}, "party_id": "IKqMw59X", "party_members": [{"extra_attributes": {"axEQHrMH": {}, "mGQK8pql": {}, "sWjQXS0i": {}}, "user_id": "Igopuuqc"}, {"extra_attributes": {"EZ5TRhn5": {}, "zEE6VF4A": {}, "57vRprQe": {}}, "user_id": "bDF0lCB0"}, {"extra_attributes": {"Bltc2dLC": {}, "xPjcENXO": {}, "9dOBrqrF": {}}, "user_id": "6sH2YbMw"}], "ticket_id": "BQ9YWVFg"}, {"first_ticket_created_at": 26, "party_attributes": {"mFgbMnPu": {}, "3IEQ6kjc": {}, "XcGkn4IN": {}}, "party_id": "jMp8dCgo", "party_members": [{"extra_attributes": {"TlptuKXM": {}, "NML18gZI": {}, "RUqUT2Mp": {}}, "user_id": "SckaHuI2"}, {"extra_attributes": {"4apFoENS": {}, "JFOvCz1D": {}, "sdo8nfT2": {}}, "user_id": "tEzgKFpB"}, {"extra_attributes": {"qLNl5BiY": {}, "VOYYwjON": {}, "GiOT1Jq8": {}}, "user_id": "2Subggym"}], "ticket_id": "90PIfcn9"}]}, {"matching_parties": [{"first_ticket_created_at": 14, "party_attributes": {"jvumDkEt": {}, "QLf38jlN": {}, "OEbZDuy0": {}}, "party_id": "pbRo9MTs", "party_members": [{"extra_attributes": {"ICW3Guei": {}, "Xnxo3Bgr": {}, "WYPtuOQZ": {}}, "user_id": "SqwcgEKr"}, {"extra_attributes": {"bNiFHQhX": {}, "XFibK5Zy": {}, "lmitJT2b": {}}, "user_id": "y9WX9jeQ"}, {"extra_attributes": {"vpRy8U34": {}, "PQHz7XcP": {}, "6jYCEC02": {}}, "user_id": "vFOJIr7E"}], "ticket_id": "8Bw6tj80"}, {"first_ticket_created_at": 51, "party_attributes": {"7DTExuxK": {}, "LL76jaZc": {}, "flZoJi9Y": {}}, "party_id": "8m5kvxTR", "party_members": [{"extra_attributes": {"bYDefSNH": {}, "SxVJTUN3": {}, "rqFyHevi": {}}, "user_id": "K6L1TzAX"}, {"extra_attributes": {"hizX1RWw": {}, "qKzLguFz": {}, "u9dwajnP": {}}, "user_id": "IJ3INl6j"}, {"extra_attributes": {"qur8wApR": {}, "PX2rcO8k": {}, "8vIYPzTo": {}}, "user_id": "xwDgG2Qs"}], "ticket_id": "AiewfBEu"}, {"first_ticket_created_at": 15, "party_attributes": {"r0esBYMd": {}, "ezauteQY": {}, "eYAsZOYC": {}}, "party_id": "HJ4CmAmM", "party_members": [{"extra_attributes": {"HxenG3Yc": {}, "nJO9JIYn": {}, "jkttJ3CM": {}}, "user_id": "wOfzkNXM"}, {"extra_attributes": {"tKoFkkXB": {}, "xbmX6Z6Z": {}, "H9z3k1K6": {}}, "user_id": "mkht3iOy"}, {"extra_attributes": {"p1IiKttF": {}, "djctgMkX": {}, "MoGJ8Nvf": {}}, "user_id": "CjTxDd0W"}], "ticket_id": "NyCSkh4k"}]}, {"matching_parties": [{"first_ticket_created_at": 69, "party_attributes": {"jeYqdex0": {}, "QEJ4epa9": {}, "gRwNIYbl": {}}, "party_id": "87s9crQA", "party_members": [{"extra_attributes": {"WxUfyL7n": {}, "e2APGl9u": {}, "rH4zVbeB": {}}, "user_id": "7R4KacVn"}, {"extra_attributes": {"sJVQoTCw": {}, "3wB25WHv": {}, "XYhQkaDg": {}}, "user_id": "nGDXFCEI"}, {"extra_attributes": {"WMnDN3kL": {}, "N3Us8Npv": {}, "pMDC9lS0": {}}, "user_id": "GBdYycTp"}], "ticket_id": "731V19SU"}, {"first_ticket_created_at": 33, "party_attributes": {"EyugnA6E": {}, "zXcws1VN": {}, "26VXJ5B0": {}}, "party_id": "XNj6mRjV", "party_members": [{"extra_attributes": {"Tz21aISr": {}, "o7BO6Fq8": {}, "hTFVgJQj": {}}, "user_id": "xZGSfGpn"}, {"extra_attributes": {"GTQm5mme": {}, "mKzqRTUG": {}, "LS8raNCR": {}}, "user_id": "4fpzgrqI"}, {"extra_attributes": {"k32ZVtxp": {}, "3SHfFqLj": {}, "nXtzBUcS": {}}, "user_id": "NNJIpPTo"}], "ticket_id": "kqh4v5JL"}, {"first_ticket_created_at": 43, "party_attributes": {"PZSeGCl1": {}, "t3iVDnDl": {}, "tjaFSbJx": {}}, "party_id": "j6juxUOC", "party_members": [{"extra_attributes": {"AZFGa3VS": {}, "4Hb5e0cB": {}, "cIBCK6Wq": {}}, "user_id": "KIza7nr4"}, {"extra_attributes": {"ohRjBRGU": {}, "5ze3G3KV": {}, "v5Tn5Y56": {}}, "user_id": "JlSA66RM"}, {"extra_attributes": {"5pq9fvhI": {}, "hJV6SH7V": {}, "7K7A9m3m": {}}, "user_id": "MyexXjSs"}], "ticket_id": "i1KE1dm6"}]}], "namespace": "Tjfkj6lV", "party_attributes": {"02ygYk7I": {}, "RDVzpjN0": {}, "skf4DWW8": {}}, "party_id": "hqlGrSk2", "queued_at": 90, "region": "TI5D8Nec", "server_name": "VSAR12ni", "status": "ns79WDU2", "ticket_id": "01MjQjsU", "updated_at": "1994-09-28T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "dSi6aEBy"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'Z9SRChOw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 23, "userID": "YobgGEYw", "weight": 0.5019838006599967}' \
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
    --matchIDs 'hAXTLQnu' \
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
    --strategy 'hOnNvuN8' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'oRZDHRNz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'u61Ox86F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "2Jri2iGh", "description": "tVCZZz0d", "findMatchTimeoutSeconds": 47, "joinable": false, "max_delay_ms": 5, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 38, "min": 62, "name": "rvhHO6I5"}, {"max": 65, "min": 92, "name": "B8iRPDUH"}, {"max": 72, "min": 20, "name": "kItZ7O9h"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 71, "role_flexing_second": 41}, "maxNumber": 94, "minNumber": 48, "playerMaxNumber": 57, "playerMinNumber": 46}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 63, "min": 40, "name": "GFrsK0lU"}, {"max": 73, "min": 90, "name": "RMSW9Ioq"}, {"max": 93, "min": 26, "name": "PARBdBS8"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 18, "role_flexing_second": 37}, "duration": 38, "max_number": 21, "min_number": 13, "player_max_number": 31, "player_min_number": 33}, {"combination": {"alliances": [{"max": 44, "min": 68, "name": "AGsQM034"}, {"max": 23, "min": 39, "name": "9SsBU6N4"}, {"max": 14, "min": 26, "name": "K9BedSlx"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 98, "role_flexing_second": 76}, "duration": 81, "max_number": 7, "min_number": 20, "player_max_number": 92, "player_min_number": 52}, {"combination": {"alliances": [{"max": 50, "min": 33, "name": "hnEya3rw"}, {"max": 10, "min": 100, "name": "xBBglTvp"}, {"max": 42, "min": 61, "name": "basCrM0K"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 83, "role_flexing_second": 38}, "duration": 72, "max_number": 51, "min_number": 15, "player_max_number": 8, "player_min_number": 97}], "flexingRules": [{"attribute": "bncwk5Fc", "criteria": "YZzt3O99", "duration": 93, "reference": 0.015544023896165271}, {"attribute": "xx0inH0B", "criteria": "VqeHMMXw", "duration": 98, "reference": 0.1356456340883363}, {"attribute": "dgrV5sR3", "criteria": "IxY1jb9Z", "duration": 75, "reference": 0.34327288399736033}], "match_options": {"options": [{"name": "sHwcIhRO", "type": "gMNUdwW9"}, {"name": "CXnSyzxt", "type": "rPNBp8FX"}, {"name": "EAk2S6Tb", "type": "y72WfAH1"}]}, "matchingRules": [{"attribute": "IxNpGgdC", "criteria": "AUz7DuU7", "reference": 0.14898350531785076}, {"attribute": "jvpAKYqc", "criteria": "Vq2ZD0gP", "reference": 0.2186289022631649}, {"attribute": "TVXKA8EQ", "criteria": "rjIfFTo3", "reference": 0.6857704177985077}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 23, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'uzogFxS4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'tiP8XoNZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'DdXUlEQY' \
    --matchID 'FwJ9Hc5r' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["ZKDBOUWb", "OV0fnTIB", "BrDM0gAx"], "party_id": "3cZUL8KR", "user_id": "skTZNbff"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'BIIurR5a' \
    --matchID 'X06ohAeY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'mLSOyvMF' \
    --matchID 'wEAu9Esf' \
    --namespace "$AB_NAMESPACE" \
    --userID 'bLygGOoH' \
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
    --channelName 'QieUmu4x' \
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