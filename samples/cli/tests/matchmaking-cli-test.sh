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
    --limit '24' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "VdT3mAAn", "description": "1xFQgONl", "find_match_timeout_seconds": 70, "game_mode": "r0xUDH3h", "joinable": false, "max_delay_ms": 56, "rule_set": {"alliance": {"max_number": 10, "min_number": 20, "player_max_number": 5, "player_min_number": 15}, "alliance_flexing_rule": [{"duration": 3, "max_number": 5, "min_number": 52, "player_max_number": 7, "player_min_number": 39}, {"duration": 80, "max_number": 50, "min_number": 97, "player_max_number": 25, "player_min_number": 50}, {"duration": 23, "max_number": 54, "min_number": 49, "player_max_number": 50, "player_min_number": 24}], "flexing_rule": [{"attribute": "VVqYgJSo", "criteria": "fW9xtO0o", "duration": 66, "reference": 0.5637866020280581}, {"attribute": "GCCDMhHl", "criteria": "NzcOnJ1G", "duration": 25, "reference": 0.2386749397634753}, {"attribute": "G8mRXLbC", "criteria": "ViDYBnbI", "duration": 86, "reference": 0.04222907729633352}], "match_options": {"options": [{"name": "TanoUiQ2", "type": "hw2bGyoz"}, {"name": "J2gqOI2q", "type": "IHJn8ws9"}, {"name": "jkJEvsqG", "type": "ZMalK5BF"}]}, "matching_rule": [{"attribute": "PWUkyApm", "criteria": "edTVoPtO", "reference": 0.02247497176627511}, {"attribute": "cRp7JOhs", "criteria": "QP9WpfKd", "reference": 0.13961746399809105}, {"attribute": "cUc4isTk", "criteria": "dwNMNZN6", "reference": 0.03398565747169058}], "sub_game_modes": {"Kiezoa3Q": {"alliance": {"max_number": 58, "min_number": 45, "player_max_number": 88, "player_min_number": 10}, "alliance_flexing_rule": [{"duration": 30, "max_number": 16, "min_number": 75, "player_max_number": 39, "player_min_number": 100}, {"duration": 10, "max_number": 8, "min_number": 95, "player_max_number": 77, "player_min_number": 80}, {"duration": 100, "max_number": 28, "min_number": 40, "player_max_number": 36, "player_min_number": 32}], "name": "9sLWqgQ6"}, "nemOa7kj": {"alliance": {"max_number": 40, "min_number": 36, "player_max_number": 17, "player_min_number": 81}, "alliance_flexing_rule": [{"duration": 92, "max_number": 93, "min_number": 46, "player_max_number": 76, "player_min_number": 24}, {"duration": 65, "max_number": 68, "min_number": 97, "player_max_number": 77, "player_min_number": 3}, {"duration": 74, "max_number": 92, "min_number": 25, "player_max_number": 28, "player_min_number": 34}], "name": "fKLQSpyE"}, "ys5vEBNU": {"alliance": {"max_number": 66, "min_number": 4, "player_max_number": 4, "player_min_number": 16}, "alliance_flexing_rule": [{"duration": 82, "max_number": 25, "min_number": 9, "player_max_number": 33, "player_min_number": 36}, {"duration": 61, "max_number": 53, "min_number": 61, "player_max_number": 87, "player_min_number": 54}, {"duration": 6, "max_number": 75, "min_number": 18, "player_max_number": 74, "player_min_number": 27}], "name": "CV0sEkEk"}}}, "session_queue_timeout_seconds": 73, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'gfALeU9D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Pyd1V3Fk", "players": [{"results": [{"attribute": "7TLwi2A7", "value": 0.7673761383868108}, {"attribute": "6biAUwMm", "value": 0.6182223178806026}, {"attribute": "0tpGq9Xa", "value": 0.3137517763375266}], "user_id": "oUFvSyve"}, {"results": [{"attribute": "tZaOYzOH", "value": 0.5284655333250585}, {"attribute": "S2clz9f1", "value": 0.009671576150992123}, {"attribute": "NzEhHibs", "value": 0.7474045924984921}], "user_id": "gtdiLcil"}, {"results": [{"attribute": "7D8OemdK", "value": 0.35256665111306473}, {"attribute": "e3Nx6W0M", "value": 0.5658431797641699}, {"attribute": "0I2XYp8X", "value": 0.5694654382027471}], "user_id": "Y0hZp7DV"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "yNVAsRgX"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "Ygqu95Ju", "client_version": "Cn8xcwsS", "deployment": "AOPMmlbV", "game_mode": "wyOAHSm4", "joinable": true, "match_id": "Zc6gmdyR", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 65, "party_attributes": {"UKiO9EO9": {}, "bNcg9haF": {}, "xsbAgV3r": {}}, "party_id": "6mkkvIbz", "party_members": [{"extra_attributes": {"ewJjKuOE": {}, "NScgTTgJ": {}, "iJc1nZqQ": {}}, "user_id": "4IN3KdTA"}, {"extra_attributes": {"GldoW2rM": {}, "eE1tizJr": {}, "rHgLKsbc": {}}, "user_id": "8cDnBJLK"}, {"extra_attributes": {"HNqPW4tI": {}, "yEejDQdR": {}, "sT9utusz": {}}, "user_id": "bfQPjVBy"}]}, {"first_ticket_created_at": 30, "party_attributes": {"nbJq0da0": {}, "dUZIZOJj": {}, "BUAKqjIm": {}}, "party_id": "c7zpV1P9", "party_members": [{"extra_attributes": {"p7d7xQ8w": {}, "ACaNTxOu": {}, "EGR8ICrf": {}}, "user_id": "7DJ0o2ag"}, {"extra_attributes": {"yJdL5bZb": {}, "gTpMC6Zg": {}, "kjV7vcqu": {}}, "user_id": "OQP5QsVy"}, {"extra_attributes": {"fpqzlGMj": {}, "JFoZMiZj": {}, "z80ArMSW": {}}, "user_id": "0n0I3Rz0"}]}, {"first_ticket_created_at": 5, "party_attributes": {"kJfNkuNa": {}, "VSVPxjEE": {}, "2TnRhkbW": {}}, "party_id": "YStzMz6r", "party_members": [{"extra_attributes": {"yPxGrmAE": {}, "Td46TIFU": {}, "6GwjmfVo": {}}, "user_id": "wSG5UmZ6"}, {"extra_attributes": {"d82feP27": {}, "6oJpvm7V": {}, "1cTkAzpG": {}}, "user_id": "dA2eh9OU"}, {"extra_attributes": {"NopPkITy": {}, "TtVGGgG9": {}, "kL7b0ird": {}}, "user_id": "A0Ah4c9m"}]}]}, {"matching_parties": [{"first_ticket_created_at": 38, "party_attributes": {"Atv1AIyf": {}, "5wnQP3Nk": {}, "agcDHPdS": {}}, "party_id": "JIurbzl2", "party_members": [{"extra_attributes": {"tEpoMZE3": {}, "Xx5SwR8h": {}, "fb4QPxMW": {}}, "user_id": "upLmKgkw"}, {"extra_attributes": {"n6MuSV9t": {}, "lLRYPihY": {}, "7Ug206g5": {}}, "user_id": "vhuWXmh3"}, {"extra_attributes": {"yKLTinYU": {}, "Qvwt2wzI": {}, "k0RrnYPj": {}}, "user_id": "VAvJqwxu"}]}, {"first_ticket_created_at": 67, "party_attributes": {"FSLzz9Oh": {}, "IXRry7uM": {}, "ZrJOpG4n": {}}, "party_id": "CpkqB8uB", "party_members": [{"extra_attributes": {"jpvmLMWe": {}, "8qwr5WQN": {}, "uJ7bHvdS": {}}, "user_id": "PY01C83o"}, {"extra_attributes": {"1W4B6lpZ": {}, "XoDO49UC": {}, "kI3D3d2g": {}}, "user_id": "1oZ60k2I"}, {"extra_attributes": {"BPodEzVu": {}, "pnic81po": {}, "VnKIvJqv": {}}, "user_id": "kKmwTJed"}]}, {"first_ticket_created_at": 97, "party_attributes": {"2Qk4VSZ4": {}, "Jrk2zVSw": {}, "yfi48WPh": {}}, "party_id": "F2uPPJjq", "party_members": [{"extra_attributes": {"oFXe9D3i": {}, "FjUjCdrh": {}, "qEKKBckV": {}}, "user_id": "4IGvEjwf"}, {"extra_attributes": {"EI5vVI4M": {}, "SrRkhkCW": {}, "NayJ2HZm": {}}, "user_id": "0AjMN1tK"}, {"extra_attributes": {"B5m2rDmy": {}, "MQ7ZfpeF": {}, "lwMq6YJU": {}}, "user_id": "DDciORno"}]}]}, {"matching_parties": [{"first_ticket_created_at": 65, "party_attributes": {"kJV2imrS": {}, "SyfO8B3p": {}, "gGoOP1Ts": {}}, "party_id": "Ny04r0Gf", "party_members": [{"extra_attributes": {"qPx2fXLq": {}, "RBbk8XKr": {}, "gdMmtoEv": {}}, "user_id": "uXqQChAn"}, {"extra_attributes": {"1lpYLACd": {}, "vkB4NgsW": {}, "qUZSaJBw": {}}, "user_id": "MPyFYHiH"}, {"extra_attributes": {"itYsZ9dV": {}, "lR9PCG40": {}, "Do9KnoeA": {}}, "user_id": "mbzQz4tL"}]}, {"first_ticket_created_at": 95, "party_attributes": {"8NmoY1x8": {}, "teAnsp2e": {}, "OYek1P6S": {}}, "party_id": "6HwVk2bZ", "party_members": [{"extra_attributes": {"uHbOvDRT": {}, "ZFqhjGLO": {}, "dZFeT6Q6": {}}, "user_id": "FFWJEqPf"}, {"extra_attributes": {"Ragkovt5": {}, "kDAfNhny": {}, "ZbPCZyjq": {}}, "user_id": "MsUCXHJM"}, {"extra_attributes": {"D6v40IQ7": {}, "1xbLqeDn": {}, "307q46xM": {}}, "user_id": "ImFbRn5F"}]}, {"first_ticket_created_at": 58, "party_attributes": {"WNH2gY2v": {}, "TSDwF0NB": {}, "QMAafwUw": {}}, "party_id": "su2r9LAj", "party_members": [{"extra_attributes": {"gpi9NliA": {}, "HXUmVPpE": {}, "9UuKf1EG": {}}, "user_id": "VXLEKpgs"}, {"extra_attributes": {"hRUqIPGS": {}, "36dVp3sV": {}, "Dap00Tdw": {}}, "user_id": "C82sWhvj"}, {"extra_attributes": {"HAucI6Ig": {}, "UONqqpi5": {}, "UFxllvzo": {}}, "user_id": "bwxhC3wA"}]}]}], "namespace": "oVwFWrRz", "party_attributes": {"Anpcj7fm": {}, "FVSFOm39": {}, "xz9J2Q7h": {}}, "party_id": "fJk3byqn", "queued_at": 71, "region": "biGQ4NBx", "server_name": "jGotPsqw", "status": "aPg4uSUn", "updated_at": "1996-02-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "BOSC90SY"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID '47ECajJC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 79, "userID": "XtqV7j5H", "weight": 0.935327156836145}' \
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
    --matchIDs 'BbHRrVHj' \
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
    --strategy 'no7zOS1t' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'l48HfMO6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '6kBmDMwC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "78Gop0QL", "description": "k19l4rEm", "findMatchTimeoutSeconds": 25, "joinable": false, "max_delay_ms": 5, "ruleSet": {"alliance": {"maxNumber": 99, "minNumber": 41, "playerMaxNumber": 24, "playerMinNumber": 93}, "alliance_flexing_rule": [{"duration": 19, "max_number": 87, "min_number": 43, "player_max_number": 9, "player_min_number": 93}, {"duration": 39, "max_number": 80, "min_number": 26, "player_max_number": 4, "player_min_number": 67}, {"duration": 6, "max_number": 49, "min_number": 61, "player_max_number": 32, "player_min_number": 69}], "flexingRules": [{"attribute": "ZYBjPxYa", "criteria": "oS8s4DaR", "duration": 73, "reference": 0.42901374960942373}, {"attribute": "2TfplbnI", "criteria": "zwhmK0F5", "duration": 18, "reference": 0.6944774296471098}, {"attribute": "0jaJhvoZ", "criteria": "a7UAEuwP", "duration": 38, "reference": 0.3342143651039521}], "match_options": {"options": [{"name": "qjCSwXXo", "type": "o08iFdcw"}, {"name": "NapLyYBi", "type": "RWPRtcCy"}, {"name": "uuAXftH8", "type": "nypWxpXK"}]}, "matchingRules": [{"attribute": "fbOXxwr9", "criteria": "GZsdd7KM", "reference": 0.1713634745466256}, {"attribute": "cThAJu75", "criteria": "XV0sRY1h", "reference": 0.5526370853335875}, {"attribute": "hEPGFgWs", "criteria": "YugXsIg4", "reference": 0.4449285592028819}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 24, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'BbYgHtMS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'fikFNb4U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'Q0AcEjAY' \
    --matchID 'es7WKfOw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["Z22Ii9WI", "eJcVwt0n", "dMMJ9tZV"], "party_id": "cL137lHX", "user_id": "cqltfi7x"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'bZsHt6hR' \
    --matchID '9m7UHtZ0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'xNzpMaVL' \
    --matchID 'tkBKX35f' \
    --namespace "$AB_NAMESPACE" \
    --userID 'lBIv5SaU' \
    > test.out 2>&1
eval_tap $? 23 'DeleteUserFromSessionInChannel' test.out

#- 24 SearchSessions
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessions \
    --namespace "$AB_NAMESPACE" \
    --channel 'cxuds0UY' \
    --deleted  \
    --matchID 'iewjdMAw' \
    --partyID 'AVTtAWA4' \
    --userID 'JMaanRQZ' \
    --limit '43' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 24 'SearchSessions' test.out

#- 25 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main matchmaking getSessionHistoryDetailed \
    --matchID '5NYWKUH7' \
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
    --channelName 'P9JEsMHP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetSingleMatchmakingChannel' test.out

#- 29 SearchSessionsV2
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'RInd3ihf' \
    --deleted  \
    --matchID 'KUDBdPX8' \
    --partyID 'iyKz4heZ' \
    --userID 'h24Yjc6v' \
    --limit '39' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 29 'SearchSessionsV2' test.out

#- 30 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 30 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE