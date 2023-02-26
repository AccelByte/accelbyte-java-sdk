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
    --limit '77' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "MHtEy7L2", "description": "dylwCASi", "find_match_timeout_seconds": 68, "game_mode": "ufySCmWL", "joinable": false, "max_delay_ms": 95, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 19, "min": 46, "name": "x6jjT7Ei"}, {"max": 2, "min": 18, "name": "ftcllYm6"}, {"max": 8, "min": 16, "name": "iQwzgnZZ"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 32, "role_flexing_second": 39}, "max_number": 7, "min_number": 39, "player_max_number": 61, "player_min_number": 60}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 20, "min": 61, "name": "uuOSiGT8"}, {"max": 21, "min": 55, "name": "P1qHN0yQ"}, {"max": 61, "min": 78, "name": "qRbnrJxU"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 22, "role_flexing_second": 62}, "duration": 79, "max_number": 79, "min_number": 92, "player_max_number": 18, "player_min_number": 13}, {"combination": {"alliances": [{"max": 8, "min": 5, "name": "CrNrNOF3"}, {"max": 30, "min": 90, "name": "eoEHaciy"}, {"max": 61, "min": 87, "name": "emnPhfzd"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 5, "role_flexing_second": 44}, "duration": 41, "max_number": 0, "min_number": 3, "player_max_number": 36, "player_min_number": 68}, {"combination": {"alliances": [{"max": 1, "min": 68, "name": "prDRJM2V"}, {"max": 37, "min": 65, "name": "9J6Al3kT"}, {"max": 93, "min": 33, "name": "d67XcrQw"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 50}, "duration": 90, "max_number": 70, "min_number": 19, "player_max_number": 15, "player_min_number": 2}], "flexing_rule": [{"attribute": "1Gxdntpf", "criteria": "v3Y2A3Mu", "duration": 82, "reference": 0.3590623938545642}, {"attribute": "0BelNY4b", "criteria": "ew8NFOqF", "duration": 71, "reference": 0.8904954096108699}, {"attribute": "XUIhcI8R", "criteria": "iKA6Ngzk", "duration": 64, "reference": 0.1466278435128181}], "match_options": {"options": [{"name": "geQd4lhl", "type": "psPt0OSQ"}, {"name": "u8gmJAyh", "type": "gatL8Mai"}, {"name": "fNEXQYZg", "type": "cq8v6MBl"}]}, "matching_rule": [{"attribute": "EW6hodTM", "criteria": "F6qNfk1q", "reference": 0.03170378273291885}, {"attribute": "aa8p1cMl", "criteria": "kGGJqNhD", "reference": 0.05716273582222253}, {"attribute": "dNOQiQvq", "criteria": "GG7Alfes", "reference": 0.25683251455754164}], "rebalance_enable": false, "sub_game_modes": {"RYrMBb46": {"alliance": {"combination": {"alliances": [{"max": 26, "min": 81, "name": "Q8FDKmCD"}, {"max": 79, "min": 42, "name": "XAZc7DxF"}, {"max": 100, "min": 75, "name": "FZQyACuk"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 61, "role_flexing_second": 85}, "max_number": 24, "min_number": 12, "player_max_number": 99, "player_min_number": 70}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 15, "min": 100, "name": "WYVjdlof"}, {"max": 85, "min": 42, "name": "CR0dsdIA"}, {"max": 73, "min": 28, "name": "qzKWssmf"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 27, "role_flexing_second": 55}, "duration": 91, "max_number": 49, "min_number": 88, "player_max_number": 4, "player_min_number": 62}, {"combination": {"alliances": [{"max": 43, "min": 32, "name": "Nbi7SEti"}, {"max": 15, "min": 20, "name": "9EyqfIS9"}, {"max": 91, "min": 0, "name": "wP26rBek"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 3, "role_flexing_second": 51}, "duration": 73, "max_number": 57, "min_number": 10, "player_max_number": 22, "player_min_number": 89}, {"combination": {"alliances": [{"max": 94, "min": 52, "name": "aiO4oaus"}, {"max": 31, "min": 71, "name": "fKQefJWD"}, {"max": 14, "min": 66, "name": "XXQASjvB"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 25, "role_flexing_second": 0}, "duration": 19, "max_number": 53, "min_number": 6, "player_max_number": 36, "player_min_number": 53}], "name": "R7tvErla"}, "lfDArKpz": {"alliance": {"combination": {"alliances": [{"max": 37, "min": 77, "name": "oijJZiqH"}, {"max": 49, "min": 30, "name": "f8KPTrrr"}, {"max": 39, "min": 69, "name": "7rBbuTCc"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 10, "role_flexing_second": 54}, "max_number": 63, "min_number": 68, "player_max_number": 74, "player_min_number": 65}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 35, "min": 44, "name": "4TzGKJLx"}, {"max": 75, "min": 8, "name": "92zISNAA"}, {"max": 10, "min": 5, "name": "rTzk9JFE"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 33, "role_flexing_second": 14}, "duration": 98, "max_number": 96, "min_number": 13, "player_max_number": 20, "player_min_number": 33}, {"combination": {"alliances": [{"max": 52, "min": 27, "name": "Af8DmGTg"}, {"max": 77, "min": 75, "name": "ryMgNQsU"}, {"max": 25, "min": 29, "name": "8nQx5EdU"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 39, "role_flexing_second": 45}, "duration": 12, "max_number": 95, "min_number": 4, "player_max_number": 16, "player_min_number": 8}, {"combination": {"alliances": [{"max": 49, "min": 21, "name": "INEhfGxI"}, {"max": 69, "min": 43, "name": "li7qGEKa"}, {"max": 86, "min": 63, "name": "AbuuIh2C"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 30, "role_flexing_second": 96}, "duration": 58, "max_number": 69, "min_number": 53, "player_max_number": 38, "player_min_number": 63}], "name": "2HLK4lwZ"}, "KcnPyAMs": {"alliance": {"combination": {"alliances": [{"max": 34, "min": 54, "name": "2tZ1DzpQ"}, {"max": 65, "min": 53, "name": "p2A0cCzO"}, {"max": 66, "min": 65, "name": "adxJwpZx"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 73, "role_flexing_second": 61}, "max_number": 50, "min_number": 57, "player_max_number": 78, "player_min_number": 85}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 12, "min": 76, "name": "R4qigAop"}, {"max": 29, "min": 76, "name": "W5vyXPRB"}, {"max": 50, "min": 14, "name": "QHHjwk8v"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 28, "role_flexing_second": 50}, "duration": 26, "max_number": 29, "min_number": 81, "player_max_number": 27, "player_min_number": 9}, {"combination": {"alliances": [{"max": 51, "min": 89, "name": "L2WygVfZ"}, {"max": 38, "min": 75, "name": "9BWBlqcv"}, {"max": 91, "min": 83, "name": "HF1gEFox"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 26, "role_flexing_second": 22}, "duration": 11, "max_number": 68, "min_number": 64, "player_max_number": 60, "player_min_number": 75}, {"combination": {"alliances": [{"max": 97, "min": 84, "name": "6qm9BQnQ"}, {"max": 94, "min": 0, "name": "bPPuY67Z"}, {"max": 49, "min": 48, "name": "8gxg9H20"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 89, "role_flexing_second": 64}, "duration": 45, "max_number": 97, "min_number": 61, "player_max_number": 66, "player_min_number": 4}], "name": "1FloBmgX"}}}, "session_queue_timeout_seconds": 44, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'RoWaTVv0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "1az1nNcN", "players": [{"results": [{"attribute": "XlaSV7v2", "value": 0.06719237887916041}, {"attribute": "Jrv1Q4Zt", "value": 0.1897158197514751}, {"attribute": "Afnx0Zmn", "value": 0.3840186331402573}], "user_id": "aabwUnoB"}, {"results": [{"attribute": "I0qXXHwV", "value": 0.006156543710616802}, {"attribute": "MFucYmmD", "value": 0.4895415545839503}, {"attribute": "NzC8dGRw", "value": 0.040192510453752495}], "user_id": "qHT7UwQF"}, {"results": [{"attribute": "pdhzVq96", "value": 0.49060859196021245}, {"attribute": "eCBLiCYi", "value": 0.17956298837863138}, {"attribute": "IHjM727c", "value": 0.06988087420317979}], "user_id": "xyQ6bFUr"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "HQQyhQZ6"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "nJ2XGlDc", "client_version": "Ljyzd78w", "deployment": "G5TidgA1", "error_code": 94, "error_message": "q92J0808", "game_mode": "gHaSmclz", "joinable": false, "match_id": "nO0uCbMD", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 68, "party_attributes": {"NhYQNAYD": {}, "g24gg2l7": {}, "hNkUhbNT": {}}, "party_id": "CBWjHlh3", "party_members": [{"extra_attributes": {"ap4Ym6Ab": {}, "RThAdVde": {}, "f4KsooB7": {}}, "user_id": "J7j2HB2M"}, {"extra_attributes": {"YOefWjXq": {}, "vulpOE04": {}, "jfuvwLDi": {}}, "user_id": "hVyEoNlB"}, {"extra_attributes": {"LQKwf3oQ": {}, "Q3yQIzQX": {}, "bXQv3210": {}}, "user_id": "EzToJWSP"}], "ticket_created_at": 58, "ticket_id": "P11zYDMP"}, {"first_ticket_created_at": 89, "party_attributes": {"HC0ztR9H": {}, "qBv9mDZu": {}, "i6HYRKf7": {}}, "party_id": "7XIiGsCR", "party_members": [{"extra_attributes": {"b02cPcv0": {}, "Bqyv98ak": {}, "zfWGMrGg": {}}, "user_id": "ZpQVxI6l"}, {"extra_attributes": {"4ohQHIaj": {}, "ZLdTaTOH": {}, "3Jrn0UzO": {}}, "user_id": "tKmlqPgq"}, {"extra_attributes": {"BAOeIVrk": {}, "HkVrczvO": {}, "UZPgM9hY": {}}, "user_id": "hay1YZsW"}], "ticket_created_at": 24, "ticket_id": "NzyJEkhf"}, {"first_ticket_created_at": 94, "party_attributes": {"pO51kRTF": {}, "MYHCXEVb": {}, "vf85YNWA": {}}, "party_id": "hE97STZ7", "party_members": [{"extra_attributes": {"ZqzACZex": {}, "hRoR6N2M": {}, "erRFMxj5": {}}, "user_id": "Un5FOMHB"}, {"extra_attributes": {"t5GOEwtS": {}, "S927H3H3": {}, "oNqh95FK": {}}, "user_id": "7AXSMFcQ"}, {"extra_attributes": {"69AAJmJ6": {}, "qoA4dXPa": {}, "Aoh45vTN": {}}, "user_id": "NHs7puE6"}], "ticket_created_at": 21, "ticket_id": "6vOBAG2U"}]}, {"matching_parties": [{"first_ticket_created_at": 16, "party_attributes": {"XBmLLTLt": {}, "cTKIXnj4": {}, "oVN0assD": {}}, "party_id": "zbeAK3qV", "party_members": [{"extra_attributes": {"iktETEUI": {}, "RkqbA4Vl": {}, "KHZDqYCG": {}}, "user_id": "LN3XUv4U"}, {"extra_attributes": {"TNwkP1Ea": {}, "TrgXFdah": {}, "6XSFWAFx": {}}, "user_id": "4Sphau1P"}, {"extra_attributes": {"tVO6rR65": {}, "1ogPmPp1": {}, "bbZqqTBi": {}}, "user_id": "EEbi9FgV"}], "ticket_created_at": 79, "ticket_id": "SZ0LMq9c"}, {"first_ticket_created_at": 100, "party_attributes": {"lem2ZQoS": {}, "9havhjhi": {}, "gox0gGCM": {}}, "party_id": "zg02km5f", "party_members": [{"extra_attributes": {"tF0uZCBf": {}, "SVrcC5wW": {}, "IljPK0xV": {}}, "user_id": "ZqFA7x97"}, {"extra_attributes": {"w75rvUi3": {}, "Ls8zEahz": {}, "xPmurjSN": {}}, "user_id": "6tlKO6eF"}, {"extra_attributes": {"r1WdzoBu": {}, "kjOEyhjT": {}, "4m0ISEj8": {}}, "user_id": "nKYVxxV2"}], "ticket_created_at": 28, "ticket_id": "VMq0YeKc"}, {"first_ticket_created_at": 62, "party_attributes": {"2zCX8dAF": {}, "wl0y1Qz7": {}, "ORxDB9C4": {}}, "party_id": "HM3SS0d0", "party_members": [{"extra_attributes": {"21LFcTuZ": {}, "6NcGbtr4": {}, "mu4jvJIt": {}}, "user_id": "5degkCRX"}, {"extra_attributes": {"BqV9bkEO": {}, "TeSNvcYe": {}, "jH8lFMMe": {}}, "user_id": "d8TMIrCM"}, {"extra_attributes": {"ZE7DUBqG": {}, "166DfNWS": {}, "2IW6s7Iw": {}}, "user_id": "hH8Ly94M"}], "ticket_created_at": 82, "ticket_id": "PfMmwiR3"}]}, {"matching_parties": [{"first_ticket_created_at": 59, "party_attributes": {"PEjuQRey": {}, "bzudk8K5": {}, "QNXWZq58": {}}, "party_id": "5MPAIxNg", "party_members": [{"extra_attributes": {"uDsVPhPe": {}, "NEA5rvq7": {}, "lpK0ZDvv": {}}, "user_id": "B9ajnFX7"}, {"extra_attributes": {"29egWybz": {}, "a4l7nHMr": {}, "HSJyWM77": {}}, "user_id": "37Q0mOFt"}, {"extra_attributes": {"duJzIpAv": {}, "qCbyKR1p": {}, "tZxBLHiX": {}}, "user_id": "nzX8NDQy"}], "ticket_created_at": 55, "ticket_id": "BGUrFnDg"}, {"first_ticket_created_at": 6, "party_attributes": {"c7m665ul": {}, "QL2FNtHs": {}, "atmbmIyX": {}}, "party_id": "TtqdQ9oE", "party_members": [{"extra_attributes": {"5bfDW3nW": {}, "6Y849ILQ": {}, "3MnSpzIi": {}}, "user_id": "mvA2KXyH"}, {"extra_attributes": {"SRHfGsTk": {}, "vsbRcRlH": {}, "6DgMNl81": {}}, "user_id": "gHR3bdwW"}, {"extra_attributes": {"lz1lfqYf": {}, "mNRlofUW": {}, "tmk39uhV": {}}, "user_id": "a7Is6Vok"}], "ticket_created_at": 56, "ticket_id": "mT9t8FWJ"}, {"first_ticket_created_at": 90, "party_attributes": {"PGQEkxSV": {}, "at1T7KEN": {}, "SkxqyPK5": {}}, "party_id": "UImv9zIm", "party_members": [{"extra_attributes": {"ZPkgcPJR": {}, "zDdlWrpe": {}, "A87TdJXD": {}}, "user_id": "ieKtl23R"}, {"extra_attributes": {"QS9Y55Ex": {}, "1IdTFJb4": {}, "hyUXz3Za": {}}, "user_id": "bWEt967X"}, {"extra_attributes": {"fPt2jmOY": {}, "a0u6Ty9V": {}, "bgdCQHgJ": {}}, "user_id": "J35w50AN"}], "ticket_created_at": 20, "ticket_id": "jrV5Z4M8"}]}], "namespace": "wOL8zDjI", "party_attributes": {"CLS4Zjt4": {}, "w3bY7Hz3": {}, "OiTXPo8D": {}}, "party_id": "yxHrVhOf", "queued_at": 24, "region": "DvJ6NcFR", "server_name": "ixvESzRk", "status": "En1sLfuu", "ticket_id": "zQYlwPRO", "updated_at": "1994-10-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "MegSqrkM"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'CGGMkrc9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 51, "userID": "FHkMtw8O", "weight": 0.3378432648828984}' \
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
    --matchIDs 'd8luJYnj' \
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
    --strategy '3LffrWfL' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'VE640xnu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'ljmTemIx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "Czj9xscb", "description": "28lPEPdo", "findMatchTimeoutSeconds": 18, "joinable": true, "max_delay_ms": 43, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 51, "min": 24, "name": "4Aarz0rS"}, {"max": 75, "min": 20, "name": "eveMGGmr"}, {"max": 56, "min": 76, "name": "6lT1pOsx"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 78, "role_flexing_second": 98}, "maxNumber": 62, "minNumber": 9, "playerMaxNumber": 56, "playerMinNumber": 35}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 40, "min": 46, "name": "FRTJ92M2"}, {"max": 100, "min": 5, "name": "oaqueIsA"}, {"max": 29, "min": 32, "name": "o7XzfiHs"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 0, "role_flexing_second": 12}, "duration": 57, "max_number": 27, "min_number": 94, "player_max_number": 44, "player_min_number": 7}, {"combination": {"alliances": [{"max": 12, "min": 74, "name": "NkcYJXSn"}, {"max": 44, "min": 81, "name": "D2hPnG2O"}, {"max": 74, "min": 22, "name": "8DTjF2Ph"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 89, "role_flexing_second": 57}, "duration": 95, "max_number": 75, "min_number": 60, "player_max_number": 0, "player_min_number": 51}, {"combination": {"alliances": [{"max": 57, "min": 22, "name": "3NF36R1s"}, {"max": 72, "min": 78, "name": "QvDpUmmS"}, {"max": 64, "min": 0, "name": "5c3RkvT6"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 29, "role_flexing_second": 16}, "duration": 83, "max_number": 32, "min_number": 20, "player_max_number": 32, "player_min_number": 99}], "flexingRules": [{"attribute": "DCtHKeGo", "criteria": "dP5aEVFx", "duration": 7, "reference": 0.9942164831160724}, {"attribute": "tVgv07qe", "criteria": "n5cWHhd8", "duration": 66, "reference": 0.36343270206509704}, {"attribute": "3FgW29VN", "criteria": "CxwodUZe", "duration": 2, "reference": 0.1833591368935097}], "match_options": {"options": [{"name": "hikKsTDf", "type": "OSf4R0fj"}, {"name": "nwE1wSGd", "type": "ZlhRMZny"}, {"name": "c7Bqpp0Z", "type": "66VHZE10"}]}, "matchingRules": [{"attribute": "yv7CCT4h", "criteria": "R6y9hRhZ", "reference": 0.9211208739298464}, {"attribute": "CuuA3THK", "criteria": "4DwRmmHy", "reference": 0.5710494007372693}, {"attribute": "fF49sibG", "criteria": "v0OLQjw3", "reference": 0.842864566958291}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 75, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'PKPHFzrJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'hKh293gh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'p7FChm8U' \
    --matchID 'kC2kC0vK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["FSNt3qcO", "Vn6o3SzH", "L4j0EtXc"], "party_id": "HAfyRmd9", "user_id": "KU9KNBLL"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName '476R9BYB' \
    --matchID 'RNGQTsx7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'v0KVnZln' \
    --matchID 'ngH5H9Ke' \
    --namespace "$AB_NAMESPACE" \
    --userID 'X3cQqZwX' \
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
    --channelName '3a9jGuUb' \
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