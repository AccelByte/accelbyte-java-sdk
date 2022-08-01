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
    --limit '91' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "tAoM87SC", "description": "vlf2GteK", "find_match_timeout_seconds": 84, "game_mode": "JahciSlL", "joinable": true, "max_delay_ms": 42, "rule_set": {"alliance": {"max_number": 3, "min_number": 31, "player_max_number": 24, "player_min_number": 53}, "alliance_flexing_rule": [{"duration": 5, "max_number": 38, "min_number": 35, "player_max_number": 81, "player_min_number": 53}, {"duration": 99, "max_number": 72, "min_number": 9, "player_max_number": 90, "player_min_number": 99}, {"duration": 73, "max_number": 26, "min_number": 59, "player_max_number": 39, "player_min_number": 17}], "flexing_rule": [{"attribute": "79YxOIlz", "criteria": "ndcfF75g", "duration": 95, "reference": 0.20592324232817483}, {"attribute": "uHuLZx6E", "criteria": "mLkLpro8", "duration": 88, "reference": 0.6738289280897267}, {"attribute": "6v8XpvBq", "criteria": "1quUBJcK", "duration": 100, "reference": 0.7065170735992911}], "match_options": {"options": [{"name": "tcuOk2ke", "type": "wUOrj4vr"}, {"name": "z1hbzFcn", "type": "g6IyJULS"}, {"name": "3kTLVniN", "type": "1VyT3XfJ"}]}, "matching_rule": [{"attribute": "xt0l4SPl", "criteria": "ujqsunHY", "reference": 0.7324593571893522}, {"attribute": "QHjoLiTQ", "criteria": "tANa6BIx", "reference": 0.592710765613509}, {"attribute": "bz7kjohb", "criteria": "aUG8E8s3", "reference": 0.6974614984541524}], "sub_game_modes": {"Wzx5ZE9j": {"alliance": {"max_number": 18, "min_number": 77, "player_max_number": 45, "player_min_number": 71}, "alliance_flexing_rule": [{"duration": 66, "max_number": 80, "min_number": 50, "player_max_number": 53, "player_min_number": 19}, {"duration": 13, "max_number": 40, "min_number": 62, "player_max_number": 11, "player_min_number": 75}, {"duration": 99, "max_number": 16, "min_number": 95, "player_max_number": 0, "player_min_number": 38}], "name": "xUP8knUK"}, "fBe2HSA7": {"alliance": {"max_number": 76, "min_number": 17, "player_max_number": 26, "player_min_number": 89}, "alliance_flexing_rule": [{"duration": 44, "max_number": 89, "min_number": 50, "player_max_number": 99, "player_min_number": 57}, {"duration": 16, "max_number": 9, "min_number": 70, "player_max_number": 49, "player_min_number": 73}, {"duration": 86, "max_number": 78, "min_number": 40, "player_max_number": 74, "player_min_number": 90}], "name": "GwhaHd5X"}, "fvg9CCWI": {"alliance": {"max_number": 37, "min_number": 3, "player_max_number": 58, "player_min_number": 87}, "alliance_flexing_rule": [{"duration": 79, "max_number": 100, "min_number": 27, "player_max_number": 50, "player_min_number": 92}, {"duration": 32, "max_number": 40, "min_number": 97, "player_max_number": 68, "player_min_number": 75}, {"duration": 95, "max_number": 77, "min_number": 90, "player_max_number": 62, "player_min_number": 94}], "name": "ibaI14gR"}}}, "session_queue_timeout_seconds": 34, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'JCNycuHZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "rUsA5l70", "players": [{"results": [{"attribute": "VtQSt6Hr", "value": 0.864709071873063}, {"attribute": "GL1M8lhe", "value": 0.30656039223397114}, {"attribute": "2D7NLNB9", "value": 0.841697458637227}], "user_id": "b5wM0rWv"}, {"results": [{"attribute": "IkZaHHr9", "value": 0.554235027114639}, {"attribute": "HTYY586x", "value": 0.5103561906751555}, {"attribute": "6xUKojb1", "value": 0.5870800336586957}], "user_id": "0WTXw6OE"}, {"results": [{"attribute": "IEjSHETL", "value": 0.34146596927241946}, {"attribute": "LN3YjqDz", "value": 0.09600147280831872}, {"attribute": "JAGWiSxx", "value": 0.531006270251915}], "user_id": "QaFw8ncH"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "mLFpQVI0"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "UP7Ollbx", "client_version": "8BFJCTHG", "deployment": "Ukp6AR5c", "game_mode": "mJNCFDaG", "joinable": false, "match_id": "evRNqYiy", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 8, "party_attributes": {"xA5JMCgi": {}, "odhdFd4y": {}, "Kjzr7Cjf": {}}, "party_id": "8gGO5VOG", "party_members": [{"extra_attributes": {"JYudoQKz": {}, "4COXZJUW": {}, "d3whvZE0": {}}, "user_id": "FWwPemfM"}, {"extra_attributes": {"F8hxTadj": {}, "qO9wvfkc": {}, "gD0hhpWf": {}}, "user_id": "WkmJPpIE"}, {"extra_attributes": {"wbgWpIeT": {}, "LQA7ODVy": {}, "57SZCPn9": {}}, "user_id": "DbmHowMx"}]}, {"first_ticket_created_at": 16, "party_attributes": {"b9AzR7Zg": {}, "pNflf9yy": {}, "QvWnwU6S": {}}, "party_id": "jSwdL0mS", "party_members": [{"extra_attributes": {"zJcQxAJl": {}, "l1rPGx3n": {}, "2sC6sCA1": {}}, "user_id": "s5lB5zqu"}, {"extra_attributes": {"1AwP2AfE": {}, "wNa7Ehog": {}, "AwYNQ8P8": {}}, "user_id": "l6G3XAia"}, {"extra_attributes": {"ULSQy172": {}, "cKM6L2MO": {}, "GOTxrwcX": {}}, "user_id": "6ts5COP1"}]}, {"first_ticket_created_at": 46, "party_attributes": {"Ggg0wzMK": {}, "KV3ykbFG": {}, "PA4IUINw": {}}, "party_id": "tj1rFfsv", "party_members": [{"extra_attributes": {"T8vUNDio": {}, "suI6mrNx": {}, "WEPSyKHq": {}}, "user_id": "XO4yYDtk"}, {"extra_attributes": {"j5PvxJSf": {}, "BrIGTk3v": {}, "Chb4DSBu": {}}, "user_id": "1lCgnQlV"}, {"extra_attributes": {"Vrh8mDe7": {}, "f3mubZrs": {}, "jOZjTDZ6": {}}, "user_id": "v6Xd7dTI"}]}]}, {"matching_parties": [{"first_ticket_created_at": 97, "party_attributes": {"SEE4b6Lt": {}, "LdpPFdk1": {}, "kjmtfWEO": {}}, "party_id": "KuEmQvu1", "party_members": [{"extra_attributes": {"D7n6bH1D": {}, "0hBZIpgi": {}, "x2ELpdaH": {}}, "user_id": "WRQJrpj0"}, {"extra_attributes": {"ZTMRwWGG": {}, "RkhhirgP": {}, "ISg9akqF": {}}, "user_id": "IQRADJ1V"}, {"extra_attributes": {"LhlJ7Gg5": {}, "kSufYcyn": {}, "zibkzKcB": {}}, "user_id": "zosXuVJP"}]}, {"first_ticket_created_at": 96, "party_attributes": {"1GcRkSgR": {}, "cdqWKgeo": {}, "TgVAnwZO": {}}, "party_id": "tJmC2WdZ", "party_members": [{"extra_attributes": {"4KTBVtLC": {}, "rFzfQ7eh": {}, "eiRINb7U": {}}, "user_id": "wX4hGcKx"}, {"extra_attributes": {"YxmVNvV8": {}, "gJ5ThncL": {}, "a4EUDFZz": {}}, "user_id": "0uBzNv1L"}, {"extra_attributes": {"rDLFk37W": {}, "UJqpxuZv": {}, "ffQqNUUi": {}}, "user_id": "7xVe1VsX"}]}, {"first_ticket_created_at": 38, "party_attributes": {"gXpnD3F2": {}, "GXcRpKfV": {}, "9i5HFQ7L": {}}, "party_id": "HHtBL2kp", "party_members": [{"extra_attributes": {"2rXPzYM6": {}, "GA2qj63h": {}, "AqLbC6UM": {}}, "user_id": "DYRgTaGd"}, {"extra_attributes": {"5hyh7Bdx": {}, "cyqn6bEg": {}, "LVqlHHjg": {}}, "user_id": "n1hzdQ4S"}, {"extra_attributes": {"t2tbKQmM": {}, "tcR2nNsR": {}, "1Rlmikw4": {}}, "user_id": "6nWPrVgK"}]}]}, {"matching_parties": [{"first_ticket_created_at": 73, "party_attributes": {"1twlyqbx": {}, "uQ7eNgz9": {}, "tPTj7pSd": {}}, "party_id": "bD3IfvD5", "party_members": [{"extra_attributes": {"QnqstBwE": {}, "kQITDZMq": {}, "9PHw09cA": {}}, "user_id": "tDBQN5pr"}, {"extra_attributes": {"xO8G0hJw": {}, "QLSgQo0t": {}, "FsrnIvJr": {}}, "user_id": "cJsub6zw"}, {"extra_attributes": {"xAh6t9zS": {}, "U7l9W6Io": {}, "SBCrrE5P": {}}, "user_id": "R40fPDhk"}]}, {"first_ticket_created_at": 84, "party_attributes": {"Jc4bEwwb": {}, "4ckpzL5c": {}, "PhXt6pAs": {}}, "party_id": "qKSR3R2V", "party_members": [{"extra_attributes": {"TqL39dAw": {}, "Qcw5hKu9": {}, "hsRMSDzD": {}}, "user_id": "lNpGSmv7"}, {"extra_attributes": {"0rE3C62i": {}, "TUnQttzP": {}, "xBnpU9h2": {}}, "user_id": "FSrOwoHn"}, {"extra_attributes": {"Pxhi81uE": {}, "wL0jdeZD": {}, "a2YTXym3": {}}, "user_id": "gk78vKNN"}]}, {"first_ticket_created_at": 83, "party_attributes": {"as5LBnHl": {}, "pSSd1aCO": {}, "T57jsj0f": {}}, "party_id": "2SgeUayt", "party_members": [{"extra_attributes": {"AFxPaCRq": {}, "5f4yCKSp": {}, "U1akF9yT": {}}, "user_id": "Yni8Eb70"}, {"extra_attributes": {"zb2Bv70X": {}, "nLuOR9eB": {}, "CBGxMicx": {}}, "user_id": "Eg60474s"}, {"extra_attributes": {"ohqOq1L1": {}, "ywj5l4QT": {}, "rvMsuGmp": {}}, "user_id": "45LRe9rc"}]}]}], "namespace": "g8pz5QdB", "party_attributes": {"5CAKPUZi": {}, "3kLeA9NL": {}, "B0k9A0R8": {}}, "party_id": "4yiSlfZk", "queued_at": 47, "region": "ixqzKHMA", "server_name": "zZMdxEJw", "status": "QyGYjJVn", "updated_at": "1992-10-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "RM9uXOUw"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 's6ttfj4S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 75, "userID": "m9hNR4ja", "weight": 0.866985944269962}' \
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
    --matchIDs 'VcNIjpVF' \
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
    --strategy 'QXzeDGwc' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'veluPIwP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'KK9ss7CD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "iIgjrC3f", "description": "fuCSIXzU", "findMatchTimeoutSeconds": 3, "joinable": true, "max_delay_ms": 5, "ruleSet": {"alliance": {"maxNumber": 91, "minNumber": 33, "playerMaxNumber": 44, "playerMinNumber": 95}, "alliance_flexing_rule": [{"duration": 63, "max_number": 72, "min_number": 77, "player_max_number": 72, "player_min_number": 60}, {"duration": 94, "max_number": 52, "min_number": 72, "player_max_number": 71, "player_min_number": 26}, {"duration": 11, "max_number": 21, "min_number": 57, "player_max_number": 41, "player_min_number": 18}], "flexingRules": [{"attribute": "1thybNnd", "criteria": "AGgf2plr", "duration": 58, "reference": 0.6272631148486201}, {"attribute": "idakGXwh", "criteria": "XO2JR624", "duration": 23, "reference": 0.428474494778335}, {"attribute": "Z0c5CzKQ", "criteria": "5XC7pJgW", "duration": 16, "reference": 0.5788419284851763}], "match_options": {"options": [{"name": "gxr203MP", "type": "ipTpZxIW"}, {"name": "IR3N3HwZ", "type": "wrwbi7y8"}, {"name": "DKFzYNYo", "type": "Ew80xRtV"}]}, "matchingRules": [{"attribute": "uxDdZZCP", "criteria": "MCxczfA1", "reference": 0.30175735661106684}, {"attribute": "BqUQdD0K", "criteria": "hfGr4mM9", "reference": 0.30244704865555117}, {"attribute": "exFzBCDG", "criteria": "ranc16og", "reference": 0.17788681806031648}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 4, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'vyxH2ez3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'bGIjAHwc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'P0x4xOYz' \
    --matchID '7TBBoST7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["6NcwD38Z", "FFOKGro0", "oYo2UKSW"], "party_id": "AEhNHkVc", "user_id": "4kh9B8ML"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'yZEBEkYG' \
    --matchID 'dl5UpG5i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'AxnYXXRq' \
    --matchID 'gOdnZIkt' \
    --namespace "$AB_NAMESPACE" \
    --userID 'plJQYIv3' \
    > test.out 2>&1
eval_tap $? 23 'DeleteUserFromSessionInChannel' test.out

#- 24 SearchSessions
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessions \
    --namespace "$AB_NAMESPACE" \
    --channel 'F4ULfbHM' \
    --deleted  \
    --matchID 'LQe6qLsZ' \
    --partyID '3aPf0rIW' \
    --userID 'YT33W84B' \
    --limit '48' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 24 'SearchSessions' test.out

#- 25 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main matchmaking getSessionHistoryDetailed \
    --matchID 'pHE2OQYV' \
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
    --channelName 'i6SgXVxr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetSingleMatchmakingChannel' test.out

#- 29 SearchSessionsV2
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'qa8Ht2NR' \
    --deleted  \
    --matchID 'dq2omE8z' \
    --partyID 'V3VyzWAO' \
    --userID 'O4dF2vO1' \
    --limit '1' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 29 'SearchSessionsV2' test.out

#- 30 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 30 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE