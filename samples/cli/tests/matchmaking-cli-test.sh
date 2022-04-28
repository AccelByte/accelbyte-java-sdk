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
echo "1..29"

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
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --body '{"deployment": "FtBxyZcD", "description": "XBpGlsQu", "find_match_timeout_seconds": 71, "game_mode": "u8vMf0Is", "joinable": false, "max_delay_ms": 90, "rule_set": {"alliance": {"max_number": 34, "min_number": 6, "player_max_number": 68, "player_min_number": 59}, "alliance_flexing_rule": [{"duration": 4, "max_number": 95, "min_number": 51, "player_max_number": 98, "player_min_number": 27}], "flexing_rule": [{"attribute": "TKjXY1bP", "criteria": "qamiBxx9", "duration": 57, "reference": 0.2813861209359233}], "match_options": {"options": [{"name": "8EY84ekI", "type": "tqRzHU1o"}]}, "matching_rule": [{"attribute": "h570KQBV", "criteria": "aewc72kr", "reference": 0.698496946052087}], "sub_game_modes": {"a68n3Yno": {"alliance": {"max_number": 51, "min_number": 31, "player_max_number": 56, "player_min_number": 72}, "alliance_flexing_rule": [{"duration": 24, "max_number": 68, "min_number": 85, "player_max_number": 91, "player_min_number": 41}], "name": "BdNEUsxF"}}}, "session_queue_timeout_seconds": 2, "social_matchmaking": true, "use_sub_gamemode": true}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'JZaMSxEC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --body '{"match_id": "bZbygyoa", "players": [{"results": [{"attribute": "rORoeNHS", "value": 0.019251152430858398}], "user_id": "Rh3kgs9q"}]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --body '{"channel": "qJbnQsoB", "client_version": "giVpP8Cm", "deployment": "3yvASUox", "game_mode": "dxxFqmAG", "joinable": true, "match_id": "dagEtp4w", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 73, "party_attributes": {"Ou9c19R6": {}}, "party_id": "XDqWHkkP", "party_members": [{"extra_attributes": {"8npLEKMf": {}}, "user_id": "jiX7jpkV"}]}]}], "namespace": "Zk3IaQYE", "party_attributes": {"mqGodOEG": {}}, "party_id": "t9gPOj0c", "queued_at": 16, "region": "0JkvIas7", "server_name": "3ucYnFAJ", "status": "3DK5T4Eo", "updated_at": "1974-02-20T00:00:00Z"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'QueueSessionHandler' test.out

#- 9 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --body '{"match_id": "0Y39UoYl"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DequeueSessionHandler' test.out

#- 10 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'pv5bVAgt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'QuerySessionHandler' test.out

#- 11 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --body '{"playtime": 36, "userID": "DhUTDUsc", "weight": 0.018605669361531185}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'UpdatePlayTimeWeight' test.out

#- 12 GetAllPartyInAllChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInAllChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetAllPartyInAllChannel' test.out

#- 13 BulkGetSessions
./ng net.accelbyte.sdk.cli.Main matchmaking bulkGetSessions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'BulkGetSessions' test.out

#- 14 ExportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking exportChannels \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'ExportChannels' test.out

#- 15 ImportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking importChannels \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'ImportChannels' test.out

#- 16 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'DjbTQuPM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMatchmakingChannel' test.out

#- 17 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --body '{"deployment": "z2PTRlky", "description": "U89ZPOw6", "findMatchTimeoutSeconds": 50, "joinable": true, "max_delay_ms": 71, "ruleSet": {"alliance": {"maxNumber": 5, "minNumber": 45, "playerMaxNumber": 25, "playerMinNumber": 50}, "alliance_flexing_rule": [{"duration": 55, "max_number": 54, "min_number": 88, "player_max_number": 76, "player_min_number": 78}], "flexingRules": [{"attribute": "coAAOjKN", "criteria": "jfcYHm09", "duration": 0, "reference": 0.7842530988331963}], "match_options": {"options": [{"name": "BU1sqjyK", "type": "0XH45PaR"}]}, "matchingRules": [{"attribute": "SOFQBtu2", "criteria": "3REZ8hRV", "reference": 0.772246792360384}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 74, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    --channelName 'dYiQS9i7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'UpdateMatchmakingChannel' test.out

#- 18 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'mV1C91pj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetAllPartyInChannel' test.out

#- 19 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'G9gpxL6y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllSessionsInChannel' test.out

#- 20 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --body '{"blocked_players": ["cTQdvln2"], "party_id": "LAuSQWEX", "user_id": "L6LFE1YH"}' \
    --channelName 'o9m126ZW' \
    --matchID 'c8hHtWvb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AddUserIntoSessionInChannel' test.out

#- 21 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'NYqgUqsl' \
    --matchID 'ArFPiHUI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'DeleteSessionInChannel' test.out

#- 22 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'vaCv8kU9' \
    --matchID 'dBBpdsJL' \
    --namespace "$AB_NAMESPACE" \
    --userID 'hsVyExrk' \
    > test.out 2>&1
eval_tap $? 22 'DeleteUserFromSessionInChannel' test.out

#- 23 SearchSessions
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessions \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 23 'SearchSessions' test.out

#- 24 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main matchmaking getSessionHistoryDetailed \
    --matchID 'ot0B7WOf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetSessionHistoryDetailed' test.out

#- 25 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetMessages \
    > test.out 2>&1
eval_tap $? 25 'PublicGetMessages' test.out

#- 26 PublicGetAllMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetAllMatchmakingChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'PublicGetAllMatchmakingChannel' test.out

#- 27 PublicGetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetSingleMatchmakingChannel \
    --channelName 'ercZdpMc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'PublicGetSingleMatchmakingChannel' test.out

#- 28 SearchSessionsV2
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 28 'SearchSessionsV2' test.out

#- 29 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 29 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE