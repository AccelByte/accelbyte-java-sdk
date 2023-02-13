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
    --limit '76' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "t7rnHtsH", "description": "F847PVQ7", "find_match_timeout_seconds": 82, "game_mode": "n3igh501", "joinable": true, "max_delay_ms": 47, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 94, "min": 63, "name": "0MuAkgdG"}, {"max": 67, "min": 35, "name": "e174V6HT"}, {"max": 86, "min": 61, "name": "U1dLNAJx"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 10}, "max_number": 59, "min_number": 80, "player_max_number": 15, "player_min_number": 39}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 58, "min": 12, "name": "IWsUOK70"}, {"max": 43, "min": 88, "name": "UYwNE7UQ"}, {"max": 7, "min": 38, "name": "34z6lQ7P"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 28, "role_flexing_second": 12}, "duration": 93, "max_number": 64, "min_number": 57, "player_max_number": 55, "player_min_number": 6}, {"combination": {"alliances": [{"max": 39, "min": 71, "name": "VUJTO29r"}, {"max": 20, "min": 44, "name": "IMHzpZ8e"}, {"max": 55, "min": 34, "name": "3bVddD3V"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 37, "role_flexing_second": 25}, "duration": 13, "max_number": 45, "min_number": 97, "player_max_number": 5, "player_min_number": 36}, {"combination": {"alliances": [{"max": 79, "min": 52, "name": "FLlEkA1T"}, {"max": 12, "min": 73, "name": "b2TfcnXC"}, {"max": 4, "min": 82, "name": "XbKfUWxo"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 43, "role_flexing_second": 77}, "duration": 87, "max_number": 86, "min_number": 38, "player_max_number": 88, "player_min_number": 92}], "flexing_rule": [{"attribute": "2owrLiy3", "criteria": "uVPv9Qbr", "duration": 10, "reference": 0.44906159363967435}, {"attribute": "KdxJlu5E", "criteria": "yOtczSh0", "duration": 22, "reference": 0.7952723496952443}, {"attribute": "9jbhzbvM", "criteria": "W8RWSCAH", "duration": 99, "reference": 0.41552981793054067}], "match_options": {"options": [{"name": "AmrY2c3C", "type": "tWqKbWou"}, {"name": "ZjmJdMSJ", "type": "XNFZqO9C"}, {"name": "JEf2S3oM", "type": "EAlr9qfl"}]}, "matching_rule": [{"attribute": "o5ROm3SJ", "criteria": "9j7kTE2F", "reference": 0.5354234663683403}, {"attribute": "t3msoPdc", "criteria": "j7taVbcG", "reference": 0.0641277390441436}, {"attribute": "q9g64VSC", "criteria": "e0sKxBEI", "reference": 0.335643751269478}], "rebalance_enable": false, "sub_game_modes": {"SIBwyYuk": {"alliance": {"combination": {"alliances": [{"max": 70, "min": 55, "name": "8X0CS10P"}, {"max": 58, "min": 35, "name": "ti9J4mbq"}, {"max": 13, "min": 11, "name": "QMpy6YZu"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 23, "role_flexing_second": 3}, "max_number": 10, "min_number": 8, "player_max_number": 59, "player_min_number": 8}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 79, "min": 40, "name": "5q4OIQHt"}, {"max": 80, "min": 72, "name": "fKsXPInd"}, {"max": 78, "min": 16, "name": "Iqd2VzYA"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 71}, "duration": 98, "max_number": 86, "min_number": 58, "player_max_number": 92, "player_min_number": 91}, {"combination": {"alliances": [{"max": 27, "min": 80, "name": "HQb6tZDK"}, {"max": 43, "min": 15, "name": "1bIevFgJ"}, {"max": 50, "min": 30, "name": "tsEz2rUp"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 97, "role_flexing_second": 32}, "duration": 86, "max_number": 52, "min_number": 17, "player_max_number": 22, "player_min_number": 24}, {"combination": {"alliances": [{"max": 3, "min": 66, "name": "XN8mHdiL"}, {"max": 83, "min": 7, "name": "ohCidnZN"}, {"max": 33, "min": 31, "name": "e7T99tUI"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 28, "role_flexing_second": 18}, "duration": 98, "max_number": 90, "min_number": 96, "player_max_number": 64, "player_min_number": 41}], "name": "igig82Bp"}, "u1oaAB6u": {"alliance": {"combination": {"alliances": [{"max": 53, "min": 10, "name": "so7xsdQF"}, {"max": 77, "min": 6, "name": "zjBx9NVk"}, {"max": 83, "min": 78, "name": "zPX8vysm"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 40, "role_flexing_second": 18}, "max_number": 55, "min_number": 8, "player_max_number": 91, "player_min_number": 51}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 67, "min": 17, "name": "qpAQyZRL"}, {"max": 64, "min": 98, "name": "mMn0MT0q"}, {"max": 15, "min": 30, "name": "nFEH1p6y"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 45, "role_flexing_second": 0}, "duration": 90, "max_number": 14, "min_number": 24, "player_max_number": 28, "player_min_number": 93}, {"combination": {"alliances": [{"max": 20, "min": 25, "name": "0Bc8KrZk"}, {"max": 73, "min": 91, "name": "aRRJOt7I"}, {"max": 62, "min": 92, "name": "GNu6LvIi"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 21, "role_flexing_second": 93}, "duration": 49, "max_number": 73, "min_number": 66, "player_max_number": 15, "player_min_number": 79}, {"combination": {"alliances": [{"max": 59, "min": 79, "name": "v1J5gKmj"}, {"max": 10, "min": 69, "name": "MFvWEGcc"}, {"max": 81, "min": 64, "name": "1Ck35yZS"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 44, "role_flexing_second": 50}, "duration": 22, "max_number": 32, "min_number": 16, "player_max_number": 0, "player_min_number": 16}], "name": "FGKAJwGb"}, "q083x9NJ": {"alliance": {"combination": {"alliances": [{"max": 7, "min": 88, "name": "BLdFgn9q"}, {"max": 20, "min": 89, "name": "V07knfMY"}, {"max": 18, "min": 55, "name": "NyFlR1Cz"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 33, "role_flexing_second": 92}, "max_number": 84, "min_number": 55, "player_max_number": 55, "player_min_number": 31}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 21, "min": 11, "name": "4DbWWoFR"}, {"max": 5, "min": 53, "name": "e3GN0v5n"}, {"max": 100, "min": 9, "name": "jFuMRDBb"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 68}, "duration": 6, "max_number": 94, "min_number": 54, "player_max_number": 11, "player_min_number": 49}, {"combination": {"alliances": [{"max": 95, "min": 29, "name": "KnDksXbu"}, {"max": 65, "min": 97, "name": "OwP6G3t1"}, {"max": 0, "min": 74, "name": "9MdaylnB"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 45, "role_flexing_second": 59}, "duration": 96, "max_number": 60, "min_number": 58, "player_max_number": 76, "player_min_number": 72}, {"combination": {"alliances": [{"max": 13, "min": 91, "name": "ikWhTScv"}, {"max": 12, "min": 63, "name": "eMQgqllY"}, {"max": 56, "min": 38, "name": "XInBvb2i"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 92}, "duration": 74, "max_number": 26, "min_number": 59, "player_max_number": 50, "player_min_number": 96}], "name": "lfwcCKuy"}}}, "session_queue_timeout_seconds": 25, "social_matchmaking": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'aAM7DIFq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "6kA3MTbc", "players": [{"results": [{"attribute": "YvQ6RZ5F", "value": 0.9072549194158714}, {"attribute": "KgrJtr7h", "value": 0.6428779561641415}, {"attribute": "TU16SgD3", "value": 0.34708690476717774}], "user_id": "oeEs3GzS"}, {"results": [{"attribute": "vNZpBdvo", "value": 0.6418536099538272}, {"attribute": "RatH6k8Z", "value": 0.15347986275416203}, {"attribute": "JQTxJ9HJ", "value": 0.009317275755386878}], "user_id": "6sLlP6hg"}, {"results": [{"attribute": "9Z0aGbU9", "value": 0.023237289292986518}, {"attribute": "vB5EbV2v", "value": 0.9638369212001419}, {"attribute": "ASgkU10p", "value": 0.9686854353414304}], "user_id": "Phid0m6K"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "8JCGs1aM"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "MFxwW2TT", "client_version": "599F06h8", "deployment": "Fq7cgkBF", "error_code": 84, "error_message": "eRrLNC6Q", "game_mode": "p5hyxArH", "joinable": false, "match_id": "FTDlzk91", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 23, "party_attributes": {"EK9G9crq": {}, "X2N4mYeW": {}, "FNOt3xQE": {}}, "party_id": "1nzFOruZ", "party_members": [{"extra_attributes": {"ZSOPDKHD": {}, "DDRi1bKk": {}, "MqQuViiA": {}}, "user_id": "R7Kj8X6L"}, {"extra_attributes": {"C36mr7MB": {}, "V6TrqHEI": {}, "rvgo6RHh": {}}, "user_id": "WRdJHlA5"}, {"extra_attributes": {"Gvxib69r": {}, "TM7ubZIA": {}, "JHdzgb5f": {}}, "user_id": "AwCzeXqC"}], "ticket_created_at": 9, "ticket_id": "2940DG40"}, {"first_ticket_created_at": 13, "party_attributes": {"yk7UO1Ml": {}, "Dv5lCD6R": {}, "bY0b8B2V": {}}, "party_id": "Ocv5ByFd", "party_members": [{"extra_attributes": {"1UJgRdsW": {}, "Oo4MsZGQ": {}, "7OZkAkve": {}}, "user_id": "BpHfzHpQ"}, {"extra_attributes": {"LqkrplIo": {}, "VvTUniRX": {}, "cpKO85GW": {}}, "user_id": "r3ZMetsm"}, {"extra_attributes": {"LwmtRv1t": {}, "vW4dBhJO": {}, "I5yoTjIU": {}}, "user_id": "OQzalgw3"}], "ticket_created_at": 42, "ticket_id": "dAmpDVe4"}, {"first_ticket_created_at": 56, "party_attributes": {"vjvX3Bs1": {}, "h2rd1Cwr": {}, "8w3nGP5w": {}}, "party_id": "mxKqwEju", "party_members": [{"extra_attributes": {"axpxjCtp": {}, "T4XxCKDn": {}, "CLWN60wU": {}}, "user_id": "jhpplQpe"}, {"extra_attributes": {"i5uBwlEf": {}, "WQUgH92d": {}, "3P7LooXS": {}}, "user_id": "Az2jjzcU"}, {"extra_attributes": {"5UUi8OHH": {}, "msA1MasA": {}, "5P5V8jL4": {}}, "user_id": "KBvGrriN"}], "ticket_created_at": 18, "ticket_id": "p5D9IpQT"}]}, {"matching_parties": [{"first_ticket_created_at": 44, "party_attributes": {"8NSEOrUH": {}, "3ivQc3Ba": {}, "lzgM5P8Q": {}}, "party_id": "Qcdo2WyF", "party_members": [{"extra_attributes": {"8OQ83RNS": {}, "8pAjW0Es": {}, "9zRasWDM": {}}, "user_id": "wpB7l90m"}, {"extra_attributes": {"fNBWH0cJ": {}, "NimQDRi5": {}, "gQ2VWzZZ": {}}, "user_id": "ArVdCVTC"}, {"extra_attributes": {"ja1DrRb6": {}, "CBfJPoVh": {}, "0M2v9d9N": {}}, "user_id": "joskSpPz"}], "ticket_created_at": 77, "ticket_id": "B7NiEfCH"}, {"first_ticket_created_at": 8, "party_attributes": {"ECj10Waj": {}, "yYkzpRh5": {}, "XSu29DJN": {}}, "party_id": "s7YUKrWM", "party_members": [{"extra_attributes": {"GH80Kx7C": {}, "a26QGrGN": {}, "z4pGs8p0": {}}, "user_id": "U3RXUfn6"}, {"extra_attributes": {"LwYcyXpA": {}, "JmkMaRB8": {}, "HwZjblnS": {}}, "user_id": "CMFpiVqb"}, {"extra_attributes": {"kKdTOnm9": {}, "3ERWR3gh": {}, "ZgsTIFpO": {}}, "user_id": "f27j3Jnl"}], "ticket_created_at": 98, "ticket_id": "r5VanSJk"}, {"first_ticket_created_at": 28, "party_attributes": {"H3EIMIBf": {}, "xdCUDOn6": {}, "mXCF2jgy": {}}, "party_id": "l9iWYOqJ", "party_members": [{"extra_attributes": {"bfME8dWH": {}, "Iau3j5ZM": {}, "x9pGzCP3": {}}, "user_id": "5oAMACd2"}, {"extra_attributes": {"sQCy8ZZ0": {}, "eJmQHBQX": {}, "c4I0H8Hf": {}}, "user_id": "Cvh9PkOD"}, {"extra_attributes": {"57tjrNJZ": {}, "bEAWfKFm": {}, "f7SCYQjV": {}}, "user_id": "0fptGkUi"}], "ticket_created_at": 66, "ticket_id": "p8JXMXMi"}]}, {"matching_parties": [{"first_ticket_created_at": 36, "party_attributes": {"czkLoDi0": {}, "PXfqMEtl": {}, "kbg4c9sq": {}}, "party_id": "ZMIue6ar", "party_members": [{"extra_attributes": {"KzHk3UK0": {}, "AifPX7Xd": {}, "yYdzRFnI": {}}, "user_id": "G3NcVqiR"}, {"extra_attributes": {"MWUWgOjD": {}, "mt8nBASb": {}, "dilCkgg8": {}}, "user_id": "vivwpqwN"}, {"extra_attributes": {"A9Met0vp": {}, "VYJSK66v": {}, "xWmLCvTi": {}}, "user_id": "OlPRiRfA"}], "ticket_created_at": 89, "ticket_id": "TvdY8nfT"}, {"first_ticket_created_at": 35, "party_attributes": {"fI2IvEDO": {}, "62B1k20p": {}, "UYwGeC0l": {}}, "party_id": "A6nfL8ay", "party_members": [{"extra_attributes": {"7WDknpjj": {}, "nuzv4biM": {}, "vxyjeQA6": {}}, "user_id": "hFcq2S0f"}, {"extra_attributes": {"CQu8t7fr": {}, "7jzGLvkN": {}, "WSym8xnw": {}}, "user_id": "5AWASWnv"}, {"extra_attributes": {"xmiYB3hk": {}, "duEi6W2b": {}, "GKkEBatH": {}}, "user_id": "S3JfIvlB"}], "ticket_created_at": 97, "ticket_id": "9MWItq5M"}, {"first_ticket_created_at": 41, "party_attributes": {"cFf97JNf": {}, "ASf2DK1D": {}, "ubxeHren": {}}, "party_id": "S1CV5hvp", "party_members": [{"extra_attributes": {"IcfiCMRZ": {}, "YVdEZU9H": {}, "pmAuHZQS": {}}, "user_id": "5WbPn4VU"}, {"extra_attributes": {"swuwOIAw": {}, "R49nLVjp": {}, "VDHnQHhT": {}}, "user_id": "sRNVxnzR"}, {"extra_attributes": {"c3Ee4P7k": {}, "cYxgG14C": {}, "D69QWNLC": {}}, "user_id": "c2ZhWvv2"}], "ticket_created_at": 86, "ticket_id": "D0nhko2i"}]}], "namespace": "hcUUpHPv", "party_attributes": {"jtlyDbsI": {}, "zzi2wRvT": {}, "b9Ef1gGR": {}}, "party_id": "Sa3M9fmZ", "queued_at": 75, "region": "GPxxR92u", "server_name": "FytmP0yY", "status": "JvY30jtK", "ticket_id": "kJbTPA2h", "updated_at": "1989-02-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "YyMn3icW"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'i8YGDwA5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 22, "userID": "gyvhdHB7", "weight": 0.2335225834965584}' \
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
    --matchIDs 'tMqPtAIB' \
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
    --strategy 'opuvM3Jx' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'dcvbqjW2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'UlcUnPOo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "YoFeGT0c", "description": "YrrK2i9b", "findMatchTimeoutSeconds": 57, "joinable": true, "max_delay_ms": 48, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 31, "min": 21, "name": "7fzuE9F1"}, {"max": 11, "min": 17, "name": "wiTlD99m"}, {"max": 8, "min": 98, "name": "7bl3Ogqr"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 72, "role_flexing_second": 66}, "maxNumber": 13, "minNumber": 90, "playerMaxNumber": 46, "playerMinNumber": 60}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 43, "min": 7, "name": "GH8Ud8YD"}, {"max": 83, "min": 1, "name": "SRTIG9dA"}, {"max": 0, "min": 47, "name": "ppaGll3f"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 9, "role_flexing_second": 98}, "duration": 11, "max_number": 76, "min_number": 31, "player_max_number": 20, "player_min_number": 6}, {"combination": {"alliances": [{"max": 95, "min": 53, "name": "Me7xpA3V"}, {"max": 79, "min": 37, "name": "R1qbnMZy"}, {"max": 15, "min": 42, "name": "5gDcbdTL"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 38, "role_flexing_second": 2}, "duration": 6, "max_number": 90, "min_number": 59, "player_max_number": 25, "player_min_number": 41}, {"combination": {"alliances": [{"max": 37, "min": 45, "name": "kLkltAiD"}, {"max": 18, "min": 3, "name": "3sMg1sBA"}, {"max": 94, "min": 89, "name": "DlN2YWRK"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 84, "role_flexing_second": 85}, "duration": 45, "max_number": 28, "min_number": 95, "player_max_number": 28, "player_min_number": 5}], "flexingRules": [{"attribute": "SpGXEYKD", "criteria": "LYqL8dJZ", "duration": 75, "reference": 0.8210792469164458}, {"attribute": "9CCl2qIx", "criteria": "foYYX0hp", "duration": 60, "reference": 0.11681238738386202}, {"attribute": "0cq0uKq8", "criteria": "wJZk86Vn", "duration": 25, "reference": 0.4517961830245256}], "match_options": {"options": [{"name": "z7dvKvYA", "type": "AX2gQmnJ"}, {"name": "m1tB9uzv", "type": "uxrx64fK"}, {"name": "HOhC9wPu", "type": "UOO00P8B"}]}, "matchingRules": [{"attribute": "JVcaYeQw", "criteria": "hbtedBaH", "reference": 0.5072134587864039}, {"attribute": "OSEVJ4H4", "criteria": "1QasUlCx", "reference": 0.3724056068552364}, {"attribute": "JLg9xIak", "criteria": "30vQZSZY", "reference": 0.6993287597517859}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 82, "socialMatchmaking": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'bu0MPDHo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '5BtHLMlC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName '5YiY97f2' \
    --matchID 'LhZAwohk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["yJwu3fsR", "HcAa12ya", "TGowXpSf"], "party_id": "M186jDVA", "user_id": "xstbCm0o"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'GBzmEoOf' \
    --matchID 'ozSay5vw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '7lHWPiLe' \
    --matchID 'GdGhsNJA' \
    --namespace "$AB_NAMESPACE" \
    --userID 'nKR5w1mk' \
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
    --channelName 'lUhnTXdq' \
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