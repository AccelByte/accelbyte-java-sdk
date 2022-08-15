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
    --limit '39' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "2wvI5YWR", "description": "CMARAgKM", "find_match_timeout_seconds": 89, "game_mode": "AT0uobeE", "joinable": true, "max_delay_ms": 51, "rule_set": {"alliance": {"max_number": 79, "min_number": 56, "player_max_number": 84, "player_min_number": 44}, "alliance_flexing_rule": [{"duration": 50, "max_number": 31, "min_number": 10, "player_max_number": 31, "player_min_number": 99}, {"duration": 47, "max_number": 23, "min_number": 57, "player_max_number": 64, "player_min_number": 77}, {"duration": 35, "max_number": 34, "min_number": 81, "player_max_number": 32, "player_min_number": 46}], "flexing_rule": [{"attribute": "hn3JcNjJ", "criteria": "u3uQa269", "duration": 1, "reference": 0.18425592768562216}, {"attribute": "eDSpxHMt", "criteria": "KB4b9M1t", "duration": 31, "reference": 0.6830195570458624}, {"attribute": "gXxRqKd4", "criteria": "0OrADtV0", "duration": 44, "reference": 0.8130009854121204}], "match_options": {"options": [{"name": "Q91JpxBI", "type": "vNRlURlb"}, {"name": "lVNGxVAv", "type": "Giw6KFXK"}, {"name": "Hi0Z3N9l", "type": "Ak4kKqUy"}]}, "matching_rule": [{"attribute": "F5o3mail", "criteria": "5CzttkWt", "reference": 0.29277212195088875}, {"attribute": "AM7w0a9C", "criteria": "ZKdFtt3l", "reference": 0.47379842762650903}, {"attribute": "rsjyKCQM", "criteria": "xEiPC0wA", "reference": 0.8706100522803023}], "sub_game_modes": {"2afJgREp": {"alliance": {"max_number": 43, "min_number": 3, "player_max_number": 10, "player_min_number": 96}, "alliance_flexing_rule": [{"duration": 86, "max_number": 87, "min_number": 70, "player_max_number": 25, "player_min_number": 70}, {"duration": 34, "max_number": 4, "min_number": 35, "player_max_number": 2, "player_min_number": 10}, {"duration": 84, "max_number": 32, "min_number": 95, "player_max_number": 12, "player_min_number": 59}], "name": "UjI6ILUr"}, "2EPukseb": {"alliance": {"max_number": 81, "min_number": 20, "player_max_number": 57, "player_min_number": 91}, "alliance_flexing_rule": [{"duration": 28, "max_number": 36, "min_number": 75, "player_max_number": 87, "player_min_number": 67}, {"duration": 56, "max_number": 97, "min_number": 47, "player_max_number": 20, "player_min_number": 43}, {"duration": 5, "max_number": 39, "min_number": 36, "player_max_number": 74, "player_min_number": 30}], "name": "hp4okILI"}, "HKXLYuuX": {"alliance": {"max_number": 64, "min_number": 28, "player_max_number": 76, "player_min_number": 17}, "alliance_flexing_rule": [{"duration": 24, "max_number": 3, "min_number": 74, "player_max_number": 42, "player_min_number": 52}, {"duration": 22, "max_number": 78, "min_number": 90, "player_max_number": 13, "player_min_number": 96}, {"duration": 14, "max_number": 21, "min_number": 49, "player_max_number": 31, "player_min_number": 50}], "name": "h8GXHdYq"}}}, "session_queue_timeout_seconds": 28, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'EzdX08sI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "9vwScMzh", "players": [{"results": [{"attribute": "YGz4JFdn", "value": 0.07659340867867448}, {"attribute": "6zbBa8yS", "value": 0.37801367960363097}, {"attribute": "EMyc5S6a", "value": 0.8113383664774625}], "user_id": "S5pBdVzh"}, {"results": [{"attribute": "SjEipqfq", "value": 0.25580744130880817}, {"attribute": "GcaZyxNc", "value": 0.7290039581616558}, {"attribute": "wR2HTQQh", "value": 0.5098509687655303}], "user_id": "q82Y6Fb5"}, {"results": [{"attribute": "kmoYOZwR", "value": 0.3878373501462816}, {"attribute": "VAPFuBgx", "value": 0.46252059465090334}, {"attribute": "eSgoXmM6", "value": 0.3745295403798934}], "user_id": "nxPqlwhD"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "tH8TNSu8"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "Ci5zcrAy", "client_version": "vU6QwQDV", "deployment": "XCKGRX7N", "game_mode": "ufdbwJRc", "joinable": true, "match_id": "KjOvsRzV", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 79, "party_attributes": {"63ZthD0A": {}, "SQjBqzOQ": {}, "5tkJ7evL": {}}, "party_id": "QoeZy5ka", "party_members": [{"extra_attributes": {"AlInhwfB": {}, "0rNM9Gnc": {}, "NGCTmxFS": {}}, "user_id": "PFVk0kZ0"}, {"extra_attributes": {"ln0Zuk7H": {}, "rZxRXo2y": {}, "iUUIFU9F": {}}, "user_id": "BPRIy4dH"}, {"extra_attributes": {"r9mNEOTJ": {}, "R2lFUOtH": {}, "x2Nlt2E3": {}}, "user_id": "AG0rFX0u"}]}, {"first_ticket_created_at": 30, "party_attributes": {"TZjSjb7C": {}, "Qkl7O743": {}, "9sV24Izb": {}}, "party_id": "QRRywGOG", "party_members": [{"extra_attributes": {"W33nXoZ1": {}, "IMwkTsTr": {}, "kRT4ZN53": {}}, "user_id": "wLe3ppoF"}, {"extra_attributes": {"iNc6GduQ": {}, "AQBusPDm": {}, "mnaC6Af7": {}}, "user_id": "qCd3VRCg"}, {"extra_attributes": {"NeMbv62D": {}, "Mz1TelNe": {}, "8Bu8nR5V": {}}, "user_id": "5ZPKFs7O"}]}, {"first_ticket_created_at": 15, "party_attributes": {"Ru8NQATL": {}, "Y8FaqA2P": {}, "8rfU8wyD": {}}, "party_id": "7SAi8Ia7", "party_members": [{"extra_attributes": {"qQLkSIA5": {}, "cI8vkmgF": {}, "YFb1DvwU": {}}, "user_id": "lOsqeZuY"}, {"extra_attributes": {"g3AHZitl": {}, "kLzLLsK4": {}, "xHLbkKuT": {}}, "user_id": "g198UdDo"}, {"extra_attributes": {"zoaW9uu8": {}, "vfGWzNtr": {}, "SpS9Hzcp": {}}, "user_id": "jljbiwIY"}]}]}, {"matching_parties": [{"first_ticket_created_at": 25, "party_attributes": {"ZDMmPVxT": {}, "BqG5c9CN": {}, "aFgbZNTD": {}}, "party_id": "9xnihjbj", "party_members": [{"extra_attributes": {"IAe7YQvv": {}, "QevSXzbm": {}, "aVVzDw7q": {}}, "user_id": "yJo4g4cq"}, {"extra_attributes": {"KXs2QUOj": {}, "DNh3o1Sz": {}, "WVgvFpW1": {}}, "user_id": "IosLWI72"}, {"extra_attributes": {"nNEA4IO3": {}, "GpumoB4k": {}, "4xc2AkX5": {}}, "user_id": "KxYGAsM2"}]}, {"first_ticket_created_at": 98, "party_attributes": {"hZW1oWjU": {}, "L0d018bl": {}, "7GTuP61C": {}}, "party_id": "QsrVhZqP", "party_members": [{"extra_attributes": {"JQV1rqHm": {}, "JzNDaS7W": {}, "GhX4pn4s": {}}, "user_id": "lxqrnghx"}, {"extra_attributes": {"dd8VwF8a": {}, "r0CghbJU": {}, "7vhP9MKZ": {}}, "user_id": "6OO4GNpE"}, {"extra_attributes": {"ORnhC6X4": {}, "6HFQdyFo": {}, "SP25Pijl": {}}, "user_id": "otmAw32A"}]}, {"first_ticket_created_at": 58, "party_attributes": {"lqoiF2TP": {}, "3rNAA6Sg": {}, "LmEPCqED": {}}, "party_id": "y05Z5Uwo", "party_members": [{"extra_attributes": {"tSI0U9zS": {}, "IyMnA7Jd": {}, "YRLwyu3k": {}}, "user_id": "YOdA4RHS"}, {"extra_attributes": {"Vkf5cbrV": {}, "T7a8BFCq": {}, "oivfaYeb": {}}, "user_id": "98TfITGM"}, {"extra_attributes": {"GASM0DWO": {}, "TTCiFjih": {}, "Um2mcsvs": {}}, "user_id": "EEC0XE8V"}]}]}, {"matching_parties": [{"first_ticket_created_at": 21, "party_attributes": {"nVo3kuae": {}, "LLYCyrWj": {}, "oYoIVCI5": {}}, "party_id": "FtypdjqQ", "party_members": [{"extra_attributes": {"XboQHsZV": {}, "0Ou5yit0": {}, "IAPdrUvT": {}}, "user_id": "q8EhQ8xW"}, {"extra_attributes": {"1mvJqNyB": {}, "oNqxGQ0Z": {}, "T7vi2l4s": {}}, "user_id": "UdweeC8C"}, {"extra_attributes": {"IvlHRqdK": {}, "94IfkRG8": {}, "VStjJhMb": {}}, "user_id": "rnfHiOWy"}]}, {"first_ticket_created_at": 4, "party_attributes": {"Tzcmm62R": {}, "1w2C2yhk": {}, "kvM59nVX": {}}, "party_id": "I9hWiVtx", "party_members": [{"extra_attributes": {"jRQrwAuj": {}, "EuGOn73P": {}, "Th2JEHnl": {}}, "user_id": "ZbTXkzEU"}, {"extra_attributes": {"rKAkJUCZ": {}, "mKbqS2sl": {}, "8C1dEtOS": {}}, "user_id": "zXhcxRKf"}, {"extra_attributes": {"30XnpdJT": {}, "OmJ4HygR": {}, "1D2upS6F": {}}, "user_id": "qwPeI0H6"}]}, {"first_ticket_created_at": 78, "party_attributes": {"DMaCsTip": {}, "QKhM49Bo": {}, "XnKBNpIQ": {}}, "party_id": "6PTJJZLJ", "party_members": [{"extra_attributes": {"0i3h7TZD": {}, "Nv2yfqdS": {}, "x5mXhKDI": {}}, "user_id": "tMl5a6yW"}, {"extra_attributes": {"jQZ14b5G": {}, "FDfGBvDk": {}, "GL3j4tmj": {}}, "user_id": "Nkbmpykh"}, {"extra_attributes": {"p8Ge5csA": {}, "g3UmYJZR": {}, "AWq0P5Rd": {}}, "user_id": "qqnHmfgm"}]}]}], "namespace": "fBcT9Ffi", "party_attributes": {"SsuOnSGl": {}, "YT5uo6fS": {}, "3cReqgIG": {}}, "party_id": "kGC7naNi", "queued_at": 88, "region": "bHl7v4od", "server_name": "IbYHJw7v", "status": "PN9Wn19M", "updated_at": "1995-10-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "QGqdSVRt"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'XUPRMBMp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 38, "userID": "pQvT0uzS", "weight": 0.5100823028369564}' \
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
    --matchIDs 'jr4UHJfp' \
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
    --strategy 'nDyZTwOg' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'vxlkEgMs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'C3jn5qoR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "NLHRlDkO", "description": "K9cedvZm", "findMatchTimeoutSeconds": 43, "joinable": false, "max_delay_ms": 28, "ruleSet": {"alliance": {"maxNumber": 51, "minNumber": 4, "playerMaxNumber": 30, "playerMinNumber": 54}, "alliance_flexing_rule": [{"duration": 11, "max_number": 68, "min_number": 73, "player_max_number": 50, "player_min_number": 80}, {"duration": 65, "max_number": 96, "min_number": 8, "player_max_number": 39, "player_min_number": 30}, {"duration": 26, "max_number": 86, "min_number": 49, "player_max_number": 54, "player_min_number": 24}], "flexingRules": [{"attribute": "b2w9JTeW", "criteria": "vcR7DiZ7", "duration": 34, "reference": 0.37670560898383276}, {"attribute": "9QP6ZwPl", "criteria": "jBehcaXM", "duration": 20, "reference": 0.8753835876498675}, {"attribute": "3lh3yC3U", "criteria": "WX7qVQqk", "duration": 39, "reference": 0.6892255926822694}], "match_options": {"options": [{"name": "K5b6TNwW", "type": "p8d9Uks2"}, {"name": "wupGvCLc", "type": "IPNisiFg"}, {"name": "4MxFv7jB", "type": "IK8pOsDE"}]}, "matchingRules": [{"attribute": "anspZwUC", "criteria": "2wHH5vkQ", "reference": 0.37493255616494436}, {"attribute": "1SnzKbcJ", "criteria": "BrJWS4cU", "reference": 0.18459697821581245}, {"attribute": "ofbJpAFD", "criteria": "iwwKElCi", "reference": 0.5010542450001115}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 11, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'sNMdlC6L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'Bxf2JtoF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'Ba5kRWS0' \
    --matchID 'GDUrlfJx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["qYUmXchn", "oSZuAzp5", "s98wxRCw"], "party_id": "P1A7IWVo", "user_id": "eQoHSP6H"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'jJMQpIzR' \
    --matchID 'gLEy8t3v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'eKutVLUq' \
    --matchID 'A5mS1MGV' \
    --namespace "$AB_NAMESPACE" \
    --userID 'uzPzjWfa' \
    > test.out 2>&1
eval_tap $? 23 'DeleteUserFromSessionInChannel' test.out

#- 24 SearchSessions
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessions \
    --namespace "$AB_NAMESPACE" \
    --channel 'iKY0kS74' \
    --deleted  \
    --matchID '1AZ3MRSN' \
    --partyID 'IaIsDOgH' \
    --userID 'PN0VqdvK' \
    --limit '81' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 24 'SearchSessions' test.out

#- 25 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main matchmaking getSessionHistoryDetailed \
    --matchID 'X2wnvzmd' \
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
    --channelName 'dPLPXeBd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetSingleMatchmakingChannel' test.out

#- 29 SearchSessionsV2
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'xwMMaIBO' \
    --deleted  \
    --matchID 'ZhTR8htf' \
    --partyID 'tYGlAh7o' \
    --userID 'Um1YJOPm' \
    --limit '66' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 29 'SearchSessionsV2' test.out

#- 30 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 30 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE