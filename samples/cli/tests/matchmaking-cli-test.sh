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
    --limit '1' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "3GJu3DmR", "description": "fyo7nZIF", "find_match_timeout_seconds": 88, "game_mode": "CrEgRPjM", "joinable": true, "max_delay_ms": 20, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 16, "min": 92, "name": "SJgtlYGA"}, {"max": 63, "min": 35, "name": "SIQGVM2k"}, {"max": 83, "min": 51, "name": "KgeTv40J"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 99, "role_flexing_second": 41}, "max_number": 53, "min_number": 22, "player_max_number": 38, "player_min_number": 5}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 70, "min": 8, "name": "ZtcXMUP1"}, {"max": 54, "min": 98, "name": "EoHtZINs"}, {"max": 42, "min": 26, "name": "hbt7x2OK"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 82, "role_flexing_second": 52}, "duration": 8, "max_number": 1, "min_number": 84, "player_max_number": 31, "player_min_number": 8}, {"combination": {"alliances": [{"max": 12, "min": 58, "name": "vIGbmadG"}, {"max": 30, "min": 8, "name": "i7CEbp2s"}, {"max": 39, "min": 49, "name": "gzclcMLh"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 80, "role_flexing_second": 32}, "duration": 96, "max_number": 51, "min_number": 16, "player_max_number": 49, "player_min_number": 2}, {"combination": {"alliances": [{"max": 75, "min": 42, "name": "aElNWWRe"}, {"max": 41, "min": 95, "name": "A6guxKQV"}, {"max": 82, "min": 30, "name": "dFYwV1qK"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 43, "role_flexing_second": 12}, "duration": 36, "max_number": 10, "min_number": 76, "player_max_number": 49, "player_min_number": 73}], "flexing_rule": [{"attribute": "Wey49EfJ", "criteria": "6bowFPWq", "duration": 24, "reference": 0.022809209142350073}, {"attribute": "vp8eJTLT", "criteria": "7bDshgVQ", "duration": 29, "reference": 0.5278419670617014}, {"attribute": "7Rtp6E23", "criteria": "blwP1do6", "duration": 57, "reference": 0.7849736525065397}], "match_options": {"options": [{"name": "2PwFe1QR", "type": "CZ2VvFyL"}, {"name": "yDAKTBTw", "type": "mkP8JKnn"}, {"name": "CA4DWS1E", "type": "NS4p3hLE"}]}, "matching_rule": [{"attribute": "SNnbCWhK", "criteria": "sJOYmBgH", "reference": 0.2014063152946426}, {"attribute": "8dQEQnyr", "criteria": "YlhMCKCp", "reference": 0.25190644624865366}, {"attribute": "ilXkPaUq", "criteria": "anNwZx1f", "reference": 0.573671617127282}], "rebalance_enable": true, "sub_game_modes": {"pGcpcnq5": {"alliance": {"combination": {"alliances": [{"max": 1, "min": 94, "name": "wkSkaH0B"}, {"max": 11, "min": 68, "name": "jHgAnnN5"}, {"max": 62, "min": 96, "name": "SLTIiMi6"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 11, "role_flexing_second": 65}, "max_number": 20, "min_number": 12, "player_max_number": 92, "player_min_number": 60}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 96, "min": 91, "name": "4Ao3ZDGR"}, {"max": 57, "min": 43, "name": "ZJVkBhpB"}, {"max": 100, "min": 81, "name": "tM3OI3B8"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 16}, "duration": 39, "max_number": 26, "min_number": 65, "player_max_number": 53, "player_min_number": 76}, {"combination": {"alliances": [{"max": 83, "min": 69, "name": "9dHleoo0"}, {"max": 0, "min": 92, "name": "p0V0HBpF"}, {"max": 39, "min": 1, "name": "joTqslyY"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 76, "role_flexing_second": 26}, "duration": 73, "max_number": 75, "min_number": 18, "player_max_number": 66, "player_min_number": 37}, {"combination": {"alliances": [{"max": 24, "min": 20, "name": "BQbKr0UD"}, {"max": 61, "min": 21, "name": "gQKyo6Pi"}, {"max": 92, "min": 22, "name": "4mzzWY7K"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 35, "role_flexing_second": 26}, "duration": 85, "max_number": 92, "min_number": 29, "player_max_number": 92, "player_min_number": 29}], "name": "gtgcfCWb"}, "e32ZN0gR": {"alliance": {"combination": {"alliances": [{"max": 51, "min": 40, "name": "SIqexEEE"}, {"max": 81, "min": 3, "name": "U8HrV3VW"}, {"max": 93, "min": 95, "name": "GKgsRblk"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 91, "role_flexing_second": 83}, "max_number": 74, "min_number": 67, "player_max_number": 73, "player_min_number": 21}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 53, "min": 47, "name": "M2OlL4Vm"}, {"max": 82, "min": 64, "name": "rbI6sZiA"}, {"max": 12, "min": 59, "name": "y57suQWk"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 67, "role_flexing_second": 19}, "duration": 94, "max_number": 8, "min_number": 40, "player_max_number": 25, "player_min_number": 24}, {"combination": {"alliances": [{"max": 61, "min": 96, "name": "zCpuc60N"}, {"max": 61, "min": 2, "name": "eMNKHVLX"}, {"max": 21, "min": 66, "name": "sf9g1KFZ"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 78, "role_flexing_second": 86}, "duration": 82, "max_number": 73, "min_number": 80, "player_max_number": 11, "player_min_number": 61}, {"combination": {"alliances": [{"max": 5, "min": 91, "name": "WIU6wWHT"}, {"max": 4, "min": 29, "name": "AhdKwK3q"}, {"max": 42, "min": 42, "name": "jjBcfIye"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 4, "role_flexing_second": 26}, "duration": 69, "max_number": 19, "min_number": 66, "player_max_number": 36, "player_min_number": 59}], "name": "xS52ruAK"}, "jRIUO39F": {"alliance": {"combination": {"alliances": [{"max": 62, "min": 79, "name": "XiuZZ1xd"}, {"max": 15, "min": 24, "name": "pXDXAjW7"}, {"max": 34, "min": 98, "name": "cENpZXnX"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 94}, "max_number": 19, "min_number": 79, "player_max_number": 96, "player_min_number": 85}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 61, "min": 24, "name": "iTVwEjkT"}, {"max": 39, "min": 53, "name": "UjqcZk57"}, {"max": 1, "min": 61, "name": "fsUIaceG"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 10, "role_flexing_second": 27}, "duration": 71, "max_number": 89, "min_number": 56, "player_max_number": 34, "player_min_number": 33}, {"combination": {"alliances": [{"max": 69, "min": 81, "name": "io8Jwgsk"}, {"max": 23, "min": 90, "name": "hzNRkvnd"}, {"max": 52, "min": 20, "name": "qNcuJ7Q9"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 67, "role_flexing_second": 99}, "duration": 92, "max_number": 72, "min_number": 43, "player_max_number": 32, "player_min_number": 57}, {"combination": {"alliances": [{"max": 27, "min": 63, "name": "km7VpLpo"}, {"max": 66, "min": 50, "name": "fwvGYquh"}, {"max": 84, "min": 68, "name": "waJARDD0"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 68, "role_flexing_second": 12}, "duration": 69, "max_number": 21, "min_number": 16, "player_max_number": 13, "player_min_number": 44}], "name": "BEnJ3B5F"}}}, "session_queue_timeout_seconds": 63, "social_matchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'JH8TuSrL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "lmjQRuVx", "players": [{"results": [{"attribute": "T3Ahwnea", "value": 0.8129185045141869}, {"attribute": "F7pwrLlD", "value": 0.6773612219076082}, {"attribute": "mex6gB0S", "value": 0.39741352526692053}], "user_id": "YXDIxxpi"}, {"results": [{"attribute": "gW8kyXyw", "value": 0.8737364954613627}, {"attribute": "4rvq8ljH", "value": 0.7969571069723503}, {"attribute": "lrp1cAy6", "value": 0.6877621952046448}], "user_id": "FsneDR1P"}, {"results": [{"attribute": "x266MJnC", "value": 0.9164165447336448}, {"attribute": "2mwURRMF", "value": 0.5401500193896659}, {"attribute": "miabIRyu", "value": 0.2696718773189314}], "user_id": "2cV8deXh"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "yhKaiqkS"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "NXdQDucb", "client_version": "JRQWbGTe", "deployment": "BEKmnCKA", "error_code": 93, "error_message": "NoeHqrq9", "game_mode": "sIiwXrUH", "joinable": true, "match_id": "0ryL3nON", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 5, "party_attributes": {"aV7iyzri": {}, "1RCHwW3g": {}, "LOMPMTne": {}}, "party_id": "3IT3SLQh", "party_members": [{"extra_attributes": {"eu1myxCD": {}, "NlyVXiOu": {}, "4xS8yFTi": {}}, "user_id": "RkHfJCpu"}, {"extra_attributes": {"WZ5gc1Uy": {}, "FwivUcOR": {}, "CagVuvbM": {}}, "user_id": "ZuiasGNn"}, {"extra_attributes": {"I6AZZDAX": {}, "KuUxiKHL": {}, "lRYe0LUN": {}}, "user_id": "XhRgJFbZ"}], "ticket_id": "7WcJaiea"}, {"first_ticket_created_at": 44, "party_attributes": {"HSyt0MFF": {}, "zgrsdaoN": {}, "Wvqh5lVK": {}}, "party_id": "vH3qgrdj", "party_members": [{"extra_attributes": {"vAncSbgV": {}, "wAiNKQQr": {}, "MWp8xP5X": {}}, "user_id": "SuohwWCj"}, {"extra_attributes": {"9K6Bol4a": {}, "ddhH96GK": {}, "jXwzizLw": {}}, "user_id": "ty9KELJt"}, {"extra_attributes": {"XpUKSa5H": {}, "di7L8JIi": {}, "Ct3RwBax": {}}, "user_id": "DH79n04x"}], "ticket_id": "DyzIRmDm"}, {"first_ticket_created_at": 44, "party_attributes": {"HNuQ8Qgs": {}, "rLTHru56": {}, "7JteFGqr": {}}, "party_id": "LxxrSurF", "party_members": [{"extra_attributes": {"fvuuithU": {}, "9bUg4FjN": {}, "Eu2lTcDe": {}}, "user_id": "9RRN918B"}, {"extra_attributes": {"cBVooRZ7": {}, "nBP5wJeL": {}, "M8tDRG3R": {}}, "user_id": "XscHeAEZ"}, {"extra_attributes": {"l06UDOep": {}, "HkEZeGsz": {}, "BZn9APoJ": {}}, "user_id": "lSeHXa4v"}], "ticket_id": "H1UN8XYo"}]}, {"matching_parties": [{"first_ticket_created_at": 92, "party_attributes": {"uyuTIMJT": {}, "H2wTnqRC": {}, "RQqyf7G0": {}}, "party_id": "D6X9wuZK", "party_members": [{"extra_attributes": {"CTxLl7ee": {}, "EQB7U38o": {}, "NeMgtXoq": {}}, "user_id": "z2qso810"}, {"extra_attributes": {"fLhYgVsG": {}, "5xH4jPfK": {}, "iJeyqA8t": {}}, "user_id": "OY2vWWGo"}, {"extra_attributes": {"WqQRAn6k": {}, "Md4so4zs": {}, "giqknVRJ": {}}, "user_id": "FVVV5iLq"}], "ticket_id": "VRenpyDT"}, {"first_ticket_created_at": 70, "party_attributes": {"STSzNQXL": {}, "kfqWNLTK": {}, "ALXP5uKY": {}}, "party_id": "QlHfZ3a1", "party_members": [{"extra_attributes": {"jTe9uQaM": {}, "rtY9EEQJ": {}, "mnEgCfex": {}}, "user_id": "5hQkiIOu"}, {"extra_attributes": {"P1DpE8q5": {}, "51YsNMWi": {}, "xlaT9KQI": {}}, "user_id": "VMNxAVTS"}, {"extra_attributes": {"s1QxD4FT": {}, "if6gTbHZ": {}, "jfqVCi3C": {}}, "user_id": "ioxyBhxb"}], "ticket_id": "Sj33MAoO"}, {"first_ticket_created_at": 62, "party_attributes": {"EPefc9sq": {}, "MIERLsyw": {}, "xCXnGVke": {}}, "party_id": "TvtIKHNp", "party_members": [{"extra_attributes": {"Fp9VcsW6": {}, "DMTAfqLa": {}, "03MBh22c": {}}, "user_id": "T5IOx0iM"}, {"extra_attributes": {"H6ImzLLZ": {}, "8gVej4Cd": {}, "Li6EUmve": {}}, "user_id": "BRstMNMj"}, {"extra_attributes": {"2SV92nF4": {}, "Bz2lTEWb": {}, "RpPZsymu": {}}, "user_id": "INMhXlgU"}], "ticket_id": "rMZ8e7XE"}]}, {"matching_parties": [{"first_ticket_created_at": 76, "party_attributes": {"tcjZSjBc": {}, "V2lYhf48": {}, "6wllQYiX": {}}, "party_id": "kcEqQSF2", "party_members": [{"extra_attributes": {"uqmgL5XH": {}, "8p4aEjnn": {}, "hWTqkuqU": {}}, "user_id": "ZVEAl0eG"}, {"extra_attributes": {"2Dystygn": {}, "LcNoRSA1": {}, "SUyKxrrs": {}}, "user_id": "h51jvRgp"}, {"extra_attributes": {"SngsBviE": {}, "H74NpvkX": {}, "Eny3IQHy": {}}, "user_id": "xIsuYIFk"}], "ticket_id": "OBvkuslH"}, {"first_ticket_created_at": 93, "party_attributes": {"k3jLS4FH": {}, "YLdUlX6x": {}, "taAx5LKK": {}}, "party_id": "0S4HLsT5", "party_members": [{"extra_attributes": {"NRFSdJJw": {}, "krkX1Z6S": {}, "oBSplgiM": {}}, "user_id": "X930jbBr"}, {"extra_attributes": {"3HbTyXpm": {}, "waa4ds9a": {}, "KJvEJRCp": {}}, "user_id": "fmUfBLFh"}, {"extra_attributes": {"dPcN71Lh": {}, "GUo0JmLW": {}, "EvLUgNiz": {}}, "user_id": "H2nwy9EZ"}], "ticket_id": "KfRaebhn"}, {"first_ticket_created_at": 51, "party_attributes": {"LspzVJs0": {}, "fX2UHAe5": {}, "zlIDB7rh": {}}, "party_id": "YR3am7ZH", "party_members": [{"extra_attributes": {"TA0gjRQj": {}, "j9InKfYx": {}, "nS7i09sE": {}}, "user_id": "hIgrsb66"}, {"extra_attributes": {"W7TcaUxx": {}, "9UnENfk8": {}, "VOpMuOwW": {}}, "user_id": "kl0aHgYM"}, {"extra_attributes": {"4QLK48KA": {}, "WZfbDQ1H": {}, "MCFjdLCH": {}}, "user_id": "e1xSYw8k"}], "ticket_id": "rHRd77xi"}]}], "namespace": "xcG24UoH", "party_attributes": {"nonr2ljy": {}, "71rDz7ol": {}, "mVQRYPgz": {}}, "party_id": "cYp8QB0b", "queued_at": 19, "region": "mZ4wO2SP", "server_name": "h9ywWDYi", "status": "3YLXgRpw", "ticket_id": "xNULu6oW", "updated_at": "1999-06-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "kI72XQ6c"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'laGwRbx6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 8, "userID": "7UQBZh3U", "weight": 0.14846902838179876}' \
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
    --matchIDs 'gn5Za52Y' \
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
    --strategy '5ZKFyO24' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'qJkYxS4w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'j49fE4pf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "KffUDQvS", "description": "Jnme0nnP", "findMatchTimeoutSeconds": 82, "joinable": false, "max_delay_ms": 0, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 9, "min": 59, "name": "qbiRMxts"}, {"max": 75, "min": 24, "name": "IMEso1mc"}, {"max": 87, "min": 70, "name": "TXPtBQzO"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 23, "role_flexing_second": 19}, "maxNumber": 70, "minNumber": 63, "playerMaxNumber": 94, "playerMinNumber": 11}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 19, "min": 50, "name": "ZtfXbmTt"}, {"max": 32, "min": 13, "name": "QFvItMRw"}, {"max": 9, "min": 34, "name": "149MqRJZ"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 61, "role_flexing_second": 85}, "duration": 85, "max_number": 75, "min_number": 58, "player_max_number": 86, "player_min_number": 13}, {"combination": {"alliances": [{"max": 92, "min": 1, "name": "3YZrJrH6"}, {"max": 91, "min": 17, "name": "RAbArbaB"}, {"max": 74, "min": 60, "name": "eQTiQun8"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 50, "role_flexing_second": 31}, "duration": 18, "max_number": 80, "min_number": 70, "player_max_number": 82, "player_min_number": 33}, {"combination": {"alliances": [{"max": 65, "min": 6, "name": "a0nnQWI2"}, {"max": 80, "min": 43, "name": "pfdlHbvT"}, {"max": 100, "min": 68, "name": "I8oy54Qu"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 81, "role_flexing_second": 49}, "duration": 82, "max_number": 34, "min_number": 93, "player_max_number": 15, "player_min_number": 4}], "flexingRules": [{"attribute": "Io6aI9Zk", "criteria": "6dVsCbAT", "duration": 66, "reference": 0.662173590619004}, {"attribute": "xLqpFMka", "criteria": "TF1gPTUf", "duration": 31, "reference": 0.5462338608222422}, {"attribute": "rA3oVDpI", "criteria": "22lv2Geo", "duration": 55, "reference": 0.21987855537043577}], "match_options": {"options": [{"name": "fg7fe46E", "type": "NltRLmXS"}, {"name": "e8dljmav", "type": "kZylKt2f"}, {"name": "tmPhBigr", "type": "ojSqOw7P"}]}, "matchingRules": [{"attribute": "AxsfnKIJ", "criteria": "slteIiqa", "reference": 0.956262303222374}, {"attribute": "jwBiwsch", "criteria": "6tvwDHdP", "reference": 0.5749084400402518}, {"attribute": "diumEuCs", "criteria": "0mwnVFMK", "reference": 0.03748471333946435}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 0, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName '7j5W8BQW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'cghPeMC6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'qFdxlqFD' \
    --matchID 'AXiuzDYh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["0qfe7tbP", "ESNRNylA", "Zs0TmQ4N"], "party_id": "wxz4xUnw", "user_id": "dY4l0I2a"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'zblp7dCH' \
    --matchID 'Rv90iGlS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'QiKpeihT' \
    --matchID 'expYCFDE' \
    --namespace "$AB_NAMESPACE" \
    --userID 'TRGnTrRa' \
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
    --channelName 'FSPZG8Pt' \
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