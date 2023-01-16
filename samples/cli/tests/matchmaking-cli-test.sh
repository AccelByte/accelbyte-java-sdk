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
    --offset '95' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "ZMo0Pf5b", "description": "5Nb3Iph1", "find_match_timeout_seconds": 95, "game_mode": "ZS9QfMCy", "joinable": true, "max_delay_ms": 65, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 32, "min": 20, "name": "l51wCEHn"}, {"max": 93, "min": 89, "name": "AfeJSbFt"}, {"max": 32, "min": 10, "name": "lJKKlIuY"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 95, "role_flexing_second": 60}, "max_number": 0, "min_number": 17, "player_max_number": 22, "player_min_number": 81}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 54, "min": 9, "name": "ybgOKl54"}, {"max": 43, "min": 89, "name": "2ROrJhJS"}, {"max": 28, "min": 23, "name": "XPecB4Rg"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 68}, "duration": 92, "max_number": 40, "min_number": 54, "player_max_number": 4, "player_min_number": 68}, {"combination": {"alliances": [{"max": 17, "min": 12, "name": "OW8AkvWd"}, {"max": 96, "min": 1, "name": "ymCXkmmR"}, {"max": 51, "min": 26, "name": "KUbq8tYw"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 99}, "duration": 73, "max_number": 52, "min_number": 57, "player_max_number": 31, "player_min_number": 82}, {"combination": {"alliances": [{"max": 89, "min": 25, "name": "BHQCk8ku"}, {"max": 2, "min": 59, "name": "xFhL1LkP"}, {"max": 84, "min": 58, "name": "uUiwFQ6C"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 89, "role_flexing_second": 90}, "duration": 28, "max_number": 32, "min_number": 94, "player_max_number": 1, "player_min_number": 46}], "flexing_rule": [{"attribute": "TqAs6mS1", "criteria": "3Hhxi1fD", "duration": 6, "reference": 0.194366412114243}, {"attribute": "dsMXC9e4", "criteria": "4qLyNuFg", "duration": 55, "reference": 0.7798016543986349}, {"attribute": "Xg3Qfp5o", "criteria": "0mVyoo9k", "duration": 19, "reference": 0.25976372693451955}], "match_options": {"options": [{"name": "olhLp981", "type": "2lPWXVr8"}, {"name": "WAK0paAe", "type": "4GKB8XTt"}, {"name": "ritAnRhm", "type": "O6Gd2Z1F"}]}, "matching_rule": [{"attribute": "VBovXl3b", "criteria": "esdHXPxF", "reference": 0.471507504060965}, {"attribute": "ZASHrPqD", "criteria": "Ptr01peS", "reference": 0.6027062760548068}, {"attribute": "m2t5tUND", "criteria": "rqemJRUt", "reference": 0.7229795306243746}], "rebalance_enable": true, "sub_game_modes": {"TAaLvqFV": {"alliance": {"combination": {"alliances": [{"max": 15, "min": 9, "name": "dNUjGGzX"}, {"max": 5, "min": 67, "name": "LslxAPiD"}, {"max": 57, "min": 52, "name": "di0hRVPj"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 15, "role_flexing_second": 81}, "max_number": 45, "min_number": 79, "player_max_number": 4, "player_min_number": 3}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 80, "min": 82, "name": "TAolP1Dq"}, {"max": 87, "min": 98, "name": "pFdXv0Fq"}, {"max": 53, "min": 0, "name": "r6GqKAuj"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 31, "role_flexing_second": 80}, "duration": 66, "max_number": 7, "min_number": 16, "player_max_number": 1, "player_min_number": 19}, {"combination": {"alliances": [{"max": 78, "min": 95, "name": "vzHgXNn0"}, {"max": 85, "min": 18, "name": "hfA7FWjK"}, {"max": 16, "min": 49, "name": "dz8Z9uU7"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 31}, "duration": 2, "max_number": 10, "min_number": 74, "player_max_number": 49, "player_min_number": 82}, {"combination": {"alliances": [{"max": 53, "min": 17, "name": "yqfc0X4b"}, {"max": 70, "min": 8, "name": "nCLza0zh"}, {"max": 60, "min": 18, "name": "cFDCT82i"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 30, "role_flexing_second": 91}, "duration": 38, "max_number": 77, "min_number": 26, "player_max_number": 93, "player_min_number": 24}], "name": "ia2RVANK"}, "rgbgKHqs": {"alliance": {"combination": {"alliances": [{"max": 40, "min": 57, "name": "uZf8Fo12"}, {"max": 22, "min": 63, "name": "D6nZ4RAP"}, {"max": 71, "min": 93, "name": "B7bBjdpN"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 83, "role_flexing_second": 69}, "max_number": 90, "min_number": 6, "player_max_number": 40, "player_min_number": 16}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 80, "min": 84, "name": "YCMXhPwI"}, {"max": 73, "min": 70, "name": "sDDpjT2D"}, {"max": 72, "min": 81, "name": "l03JRwig"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 35, "role_flexing_second": 4}, "duration": 31, "max_number": 26, "min_number": 21, "player_max_number": 5, "player_min_number": 18}, {"combination": {"alliances": [{"max": 69, "min": 9, "name": "yx2DRlXh"}, {"max": 42, "min": 72, "name": "bRMwqA2C"}, {"max": 2, "min": 26, "name": "TLTCPH90"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 38, "role_flexing_second": 96}, "duration": 98, "max_number": 64, "min_number": 68, "player_max_number": 19, "player_min_number": 85}, {"combination": {"alliances": [{"max": 13, "min": 87, "name": "72xSGB9v"}, {"max": 4, "min": 22, "name": "SeoSzsbk"}, {"max": 93, "min": 31, "name": "CuHRsOaq"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 27, "role_flexing_second": 22}, "duration": 48, "max_number": 71, "min_number": 99, "player_max_number": 85, "player_min_number": 9}], "name": "jxu7dFMw"}, "bZrIj9nL": {"alliance": {"combination": {"alliances": [{"max": 51, "min": 53, "name": "cOTotFLX"}, {"max": 59, "min": 3, "name": "7KdIoqxb"}, {"max": 49, "min": 68, "name": "uONsKzCg"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 36, "role_flexing_second": 41}, "max_number": 9, "min_number": 71, "player_max_number": 5, "player_min_number": 17}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 16, "min": 72, "name": "IMT23aEK"}, {"max": 71, "min": 40, "name": "YYIjQy7S"}, {"max": 3, "min": 30, "name": "gc9DaSHT"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 48, "role_flexing_second": 13}, "duration": 89, "max_number": 3, "min_number": 35, "player_max_number": 84, "player_min_number": 94}, {"combination": {"alliances": [{"max": 59, "min": 67, "name": "jBDEesMD"}, {"max": 77, "min": 27, "name": "LtUZx66f"}, {"max": 40, "min": 36, "name": "BbHjCBZk"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 18, "role_flexing_second": 26}, "duration": 74, "max_number": 91, "min_number": 48, "player_max_number": 57, "player_min_number": 82}, {"combination": {"alliances": [{"max": 34, "min": 50, "name": "JOQohQlu"}, {"max": 44, "min": 72, "name": "PbUpEA65"}, {"max": 33, "min": 91, "name": "RZuP23pP"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 81, "role_flexing_second": 75}, "duration": 0, "max_number": 8, "min_number": 59, "player_max_number": 28, "player_min_number": 23}], "name": "3et6KVOm"}}}, "session_queue_timeout_seconds": 78, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel '1eoUgtm4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "ySXtd1Eo", "players": [{"results": [{"attribute": "6J2G0r1F", "value": 0.3094309487231961}, {"attribute": "aCkXgn9k", "value": 0.0457522341622999}, {"attribute": "klJscSxe", "value": 0.9299082122076457}], "user_id": "q96zOimf"}, {"results": [{"attribute": "5w78kv2l", "value": 0.3651450426873627}, {"attribute": "FGoPQE7C", "value": 0.20134525388928914}, {"attribute": "IPA9DE6F", "value": 0.2936600947239766}], "user_id": "HJ8peMAd"}, {"results": [{"attribute": "OzUsogqX", "value": 0.12108690599514904}, {"attribute": "ZRkVeg5g", "value": 0.3023164494259547}, {"attribute": "k1pc5Igy", "value": 0.34434799044600894}], "user_id": "r46JySCT"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "vZLHfAQC"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "xckBukAH", "client_version": "iitZlmgC", "deployment": "XO8ERU5p", "error_code": 64, "error_message": "lRe3n8M3", "game_mode": "As918KmQ", "joinable": true, "match_id": "ajdYWrF5", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 25, "party_attributes": {"6ygtdxld": {}, "M3WAETau": {}, "Gm5nv4xH": {}}, "party_id": "kxbjSHWV", "party_members": [{"extra_attributes": {"oz7cHTnZ": {}, "rkA2E5Rn": {}, "yeD8y2pP": {}}, "user_id": "HhmPvZWr"}, {"extra_attributes": {"gGsA0NaY": {}, "x8PlTyCl": {}, "727Q0epq": {}}, "user_id": "0IWycj4U"}, {"extra_attributes": {"mvoqi0Kq": {}, "eaYqIfA5": {}, "INJfqY6F": {}}, "user_id": "5RODJhaT"}], "ticket_id": "yAFjGVQ3"}, {"first_ticket_created_at": 98, "party_attributes": {"2C6pdzsp": {}, "CmRN0ITF": {}, "Tmd7fI8g": {}}, "party_id": "utoGv9zz", "party_members": [{"extra_attributes": {"3aHBMbfh": {}, "gqXxP5xk": {}, "fAFClKxo": {}}, "user_id": "B8ukHYlK"}, {"extra_attributes": {"z3HbzpLO": {}, "SOdYify8": {}, "zM8BGqk0": {}}, "user_id": "stF0w0kj"}, {"extra_attributes": {"H7PEna6X": {}, "xJBzyJ6z": {}, "H4fq9dCi": {}}, "user_id": "YYlydV5d"}], "ticket_id": "E55IUqbp"}, {"first_ticket_created_at": 92, "party_attributes": {"WRJi3gbi": {}, "2NIBEAQJ": {}, "XJKHzFUI": {}}, "party_id": "1AsLZFtS", "party_members": [{"extra_attributes": {"0TDyLIes": {}, "MYOcBxo1": {}, "loINkmrN": {}}, "user_id": "WqWvlxXc"}, {"extra_attributes": {"yNGgpsLw": {}, "eA1oXKF4": {}, "XB0YRjFG": {}}, "user_id": "4r4TSmpC"}, {"extra_attributes": {"3qenObog": {}, "eZi7eFII": {}, "dYENIOpR": {}}, "user_id": "HXBeAb04"}], "ticket_id": "zd2QSvup"}]}, {"matching_parties": [{"first_ticket_created_at": 98, "party_attributes": {"KftnpAqt": {}, "v139wlIy": {}, "OpIeCkeO": {}}, "party_id": "AL0lyqo5", "party_members": [{"extra_attributes": {"Erqj5qok": {}, "VRuzt5VJ": {}, "mk8WzZfc": {}}, "user_id": "Qcq5EQgj"}, {"extra_attributes": {"pdFkfrRw": {}, "FPtiwYkc": {}, "pzRQVxPV": {}}, "user_id": "ezHSQTqC"}, {"extra_attributes": {"afEvowCF": {}, "8pCR1hKJ": {}, "TcFEe0Cm": {}}, "user_id": "1KNRHSUw"}], "ticket_id": "9FHhM0ot"}, {"first_ticket_created_at": 73, "party_attributes": {"5l1xjAB6": {}, "Xh2KJMGY": {}, "tJeeEBpf": {}}, "party_id": "AiE345XG", "party_members": [{"extra_attributes": {"z0O26oaP": {}, "ucPZ9oVG": {}, "fDHgcgUk": {}}, "user_id": "oi6tva14"}, {"extra_attributes": {"IsMwU8QV": {}, "VfXQN6LJ": {}, "qVLKWGqT": {}}, "user_id": "ivYLkdd8"}, {"extra_attributes": {"wqbdzWSx": {}, "Y6Qo5Kp6": {}, "IWzFVQvj": {}}, "user_id": "zP0KUiHl"}], "ticket_id": "QSQCwNlB"}, {"first_ticket_created_at": 21, "party_attributes": {"ZLlgXoiY": {}, "08oYSY69": {}, "Bq7W8Hek": {}}, "party_id": "3O0wnLfT", "party_members": [{"extra_attributes": {"7g1pHJZ0": {}, "g6W3uOaZ": {}, "jCgkwn1S": {}}, "user_id": "jC2ODLjR"}, {"extra_attributes": {"Xu5td75f": {}, "vbjc4X4V": {}, "7OiQ7i5p": {}}, "user_id": "LH01eyhD"}, {"extra_attributes": {"H3fqXS7m": {}, "0lrAGPXc": {}, "HMYfrnC8": {}}, "user_id": "yBzAVxc3"}], "ticket_id": "t2Cq8JtM"}]}, {"matching_parties": [{"first_ticket_created_at": 67, "party_attributes": {"sXGyF0WD": {}, "oEFB61Hi": {}, "6uC9rxuo": {}}, "party_id": "Kpv3hGZX", "party_members": [{"extra_attributes": {"4DyNM28d": {}, "IaM4ZJKf": {}, "NNnDdFOV": {}}, "user_id": "KQO4HJtm"}, {"extra_attributes": {"joV6Z9gr": {}, "dIYcx43p": {}, "pBsbOJpZ": {}}, "user_id": "rMR0QTtq"}, {"extra_attributes": {"x9BDzRYs": {}, "IFVmRyY4": {}, "xIaBFeg3": {}}, "user_id": "kiJRJubz"}], "ticket_id": "0YwPecwh"}, {"first_ticket_created_at": 68, "party_attributes": {"17W6LmKJ": {}, "dZx0jWOz": {}, "RDzNlqBg": {}}, "party_id": "KsGOMQKU", "party_members": [{"extra_attributes": {"LW6xiMgd": {}, "hRbUN3ps": {}, "Ev7oJSlO": {}}, "user_id": "VQejdriq"}, {"extra_attributes": {"lgTVpH11": {}, "zCj0ai4r": {}, "BJLMGFvE": {}}, "user_id": "gg9nC0tb"}, {"extra_attributes": {"VqiBOViK": {}, "5Xt8lsdx": {}, "fYsUhFzG": {}}, "user_id": "qvM6BnkY"}], "ticket_id": "8pXgylCK"}, {"first_ticket_created_at": 36, "party_attributes": {"d0EE6dB9": {}, "A2LvGwU2": {}, "abaka69M": {}}, "party_id": "ZZ3ivd9A", "party_members": [{"extra_attributes": {"92bynskj": {}, "nuK7nHMT": {}, "sFbtgKd4": {}}, "user_id": "nsEUhRys"}, {"extra_attributes": {"6gnCz0IQ": {}, "kBohNOkm": {}, "DJvnf9iK": {}}, "user_id": "ptTmWkhC"}, {"extra_attributes": {"yefNt2WT": {}, "IJAaoTLs": {}, "NWcFE43X": {}}, "user_id": "SnPA5I3I"}], "ticket_id": "JIkC8RtY"}]}], "namespace": "urcUmKLN", "party_attributes": {"NTcFBjyW": {}, "upTsuNxO": {}, "sceMXvFl": {}}, "party_id": "gpRPIAR8", "queued_at": 64, "region": "owv6GDc9", "server_name": "lA3OCjuY", "status": "pkKp2afy", "ticket_id": "oXzCRNq4", "updated_at": "1990-11-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "RI8CsurP"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'Q3fpNf3Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 55, "userID": "L8rcJcGu", "weight": 0.007305992463330524}' \
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
    --matchIDs '4wNd6Hyt' \
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
    --strategy 'GjST0KEp' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'VgR7GNEF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'qETuXKz8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "ooPQ2L0e", "description": "3MjpRlNT", "findMatchTimeoutSeconds": 99, "joinable": false, "max_delay_ms": 85, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 87, "min": 47, "name": "PZm5AprJ"}, {"max": 53, "min": 56, "name": "MXwWadyV"}, {"max": 81, "min": 22, "name": "E7ooQ1pc"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 11, "role_flexing_second": 36}, "maxNumber": 33, "minNumber": 54, "playerMaxNumber": 96, "playerMinNumber": 42}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 57, "min": 47, "name": "ilyoGL5i"}, {"max": 21, "min": 17, "name": "KsaAQIfP"}, {"max": 45, "min": 17, "name": "FGEwGRFX"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 12, "role_flexing_second": 43}, "duration": 26, "max_number": 18, "min_number": 63, "player_max_number": 25, "player_min_number": 20}, {"combination": {"alliances": [{"max": 41, "min": 76, "name": "na1GjtjD"}, {"max": 94, "min": 94, "name": "QkAqMtuB"}, {"max": 96, "min": 24, "name": "EURlnSbw"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 58, "role_flexing_second": 54}, "duration": 57, "max_number": 73, "min_number": 13, "player_max_number": 24, "player_min_number": 90}, {"combination": {"alliances": [{"max": 1, "min": 79, "name": "XrlIbVEX"}, {"max": 42, "min": 47, "name": "nH9DHq5G"}, {"max": 90, "min": 70, "name": "63SK92MF"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 22}, "duration": 60, "max_number": 10, "min_number": 60, "player_max_number": 92, "player_min_number": 47}], "flexingRules": [{"attribute": "57oJryee", "criteria": "dW2fgKXD", "duration": 99, "reference": 0.5600982100805566}, {"attribute": "In68VTlF", "criteria": "lS6JD6wW", "duration": 78, "reference": 0.6144455775292555}, {"attribute": "NX7PLM65", "criteria": "Xi5uEZXE", "duration": 7, "reference": 0.6258871431513333}], "match_options": {"options": [{"name": "wBWPjVQ6", "type": "2EsiDhC8"}, {"name": "nStnp6iA", "type": "bSjjVBKg"}, {"name": "cPyZSDWS", "type": "PL2igWqn"}]}, "matchingRules": [{"attribute": "ZKierwuu", "criteria": "dsNz2ETy", "reference": 0.7115924412590593}, {"attribute": "Y3TwDqcB", "criteria": "DynS02TG", "reference": 0.5428888976372451}, {"attribute": "wzgGDeug", "criteria": "T9CGq5Sx", "reference": 0.41754665694287985}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 28, "socialMatchmaking": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'sUUsKKFu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'o05Q4LLT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'lfJymrPD' \
    --matchID 'rX3DNxP4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["heg8R0Fa", "VqEvpnUD", "qT86P7KL"], "party_id": "Q0qVdIvD", "user_id": "HDkMIoJa"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'TyL245B3' \
    --matchID 'UAiNBz5u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'H3u2hwRi' \
    --matchID 'ls3Mxatp' \
    --namespace "$AB_NAMESPACE" \
    --userID 'QmO3BNLf' \
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
    --channelName 'mcbg335d' \
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