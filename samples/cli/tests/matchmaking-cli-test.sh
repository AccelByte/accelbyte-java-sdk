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
    --limit '72' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "oTTTME7p", "description": "x9ZgG5Mp", "find_match_timeout_seconds": 71, "game_mode": "0IkgnGhf", "joinable": true, "max_delay_ms": 72, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 1, "min": 15, "name": "urN5cYHn"}, {"max": 8, "min": 54, "name": "mgYhEZZs"}, {"max": 13, "min": 7, "name": "z5OeinmW"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 96, "role_flexing_second": 53}, "max_number": 95, "min_number": 9, "player_max_number": 7, "player_min_number": 87}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 82, "min": 98, "name": "Ov3wCdKt"}, {"max": 13, "min": 3, "name": "SA3exFRY"}, {"max": 13, "min": 26, "name": "kVcmMDMR"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 84, "role_flexing_second": 95}, "duration": 27, "max_number": 7, "min_number": 55, "player_max_number": 87, "player_min_number": 66}, {"combination": {"alliances": [{"max": 48, "min": 92, "name": "a1DzBzRr"}, {"max": 64, "min": 38, "name": "NjZPVusK"}, {"max": 66, "min": 93, "name": "CEz5vFVe"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 9, "role_flexing_second": 10}, "duration": 14, "max_number": 83, "min_number": 40, "player_max_number": 77, "player_min_number": 10}, {"combination": {"alliances": [{"max": 53, "min": 77, "name": "BVlp3lP6"}, {"max": 79, "min": 73, "name": "Dh3ZPdzd"}, {"max": 83, "min": 65, "name": "Bq7YQLe9"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 93, "role_flexing_second": 19}, "duration": 24, "max_number": 72, "min_number": 65, "player_max_number": 30, "player_min_number": 35}], "flexing_rule": [{"attribute": "6FS8kKl9", "criteria": "vUS9CbDm", "duration": 14, "reference": 0.7576584822016246}, {"attribute": "LYjpDyyE", "criteria": "vDYazLYJ", "duration": 89, "reference": 0.33406370641324834}, {"attribute": "x0atxdZY", "criteria": "AOpT29TS", "duration": 36, "reference": 0.6437651407300374}], "match_options": {"options": [{"name": "Er7HKkFe", "type": "wP3qjFIa"}, {"name": "Q9fOcBIi", "type": "hOpE98Wb"}, {"name": "jAQMVaPJ", "type": "Rj4sdMKY"}]}, "matching_rule": [{"attribute": "JHBeKy74", "criteria": "bHGaBMP1", "reference": 0.20534816695363134}, {"attribute": "Mvp07QaJ", "criteria": "I5htcpgy", "reference": 0.7894019620771598}, {"attribute": "09T2Gj7Q", "criteria": "TW9Bk7C1", "reference": 0.6965925223226287}], "rebalance_enable": false, "sub_game_modes": {"1MQez4Hd": {"alliance": {"combination": {"alliances": [{"max": 91, "min": 42, "name": "Pye4XwK6"}, {"max": 23, "min": 64, "name": "PIC57gL0"}, {"max": 20, "min": 44, "name": "OYKWCVkb"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 59, "role_flexing_second": 16}, "max_number": 31, "min_number": 100, "player_max_number": 76, "player_min_number": 46}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 74, "min": 79, "name": "UamNlx8L"}, {"max": 50, "min": 73, "name": "MzIxQS7S"}, {"max": 44, "min": 100, "name": "wowCppbv"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 75, "role_flexing_second": 55}, "duration": 4, "max_number": 1, "min_number": 19, "player_max_number": 33, "player_min_number": 53}, {"combination": {"alliances": [{"max": 23, "min": 28, "name": "C7ZCoqYW"}, {"max": 79, "min": 91, "name": "javdaiHU"}, {"max": 97, "min": 69, "name": "T1Vel4Bq"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 20, "role_flexing_second": 92}, "duration": 17, "max_number": 21, "min_number": 26, "player_max_number": 28, "player_min_number": 97}, {"combination": {"alliances": [{"max": 90, "min": 15, "name": "vdXMrAH3"}, {"max": 100, "min": 93, "name": "XWsLHWsw"}, {"max": 44, "min": 41, "name": "toTeVFF4"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 38}, "duration": 32, "max_number": 1, "min_number": 86, "player_max_number": 44, "player_min_number": 86}], "name": "cAxGEhdA"}, "G8fSPNWz": {"alliance": {"combination": {"alliances": [{"max": 78, "min": 75, "name": "yRc5X85t"}, {"max": 27, "min": 62, "name": "Zg5ElWU4"}, {"max": 78, "min": 98, "name": "Wq0yTJwT"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 64, "role_flexing_second": 32}, "max_number": 58, "min_number": 39, "player_max_number": 40, "player_min_number": 58}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 48, "min": 46, "name": "2jlwvdz1"}, {"max": 52, "min": 86, "name": "U6T9uz1d"}, {"max": 75, "min": 67, "name": "OgisHy7p"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 2, "role_flexing_second": 73}, "duration": 72, "max_number": 30, "min_number": 44, "player_max_number": 79, "player_min_number": 54}, {"combination": {"alliances": [{"max": 35, "min": 96, "name": "UQFL5D5b"}, {"max": 85, "min": 93, "name": "Nt8Ya3Hh"}, {"max": 44, "min": 89, "name": "Bkwmr1cX"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 35, "role_flexing_second": 64}, "duration": 6, "max_number": 19, "min_number": 91, "player_max_number": 16, "player_min_number": 90}, {"combination": {"alliances": [{"max": 21, "min": 19, "name": "e7pI4THd"}, {"max": 52, "min": 35, "name": "3aSCsZvJ"}, {"max": 44, "min": 33, "name": "GpFIaGhF"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 20, "role_flexing_second": 74}, "duration": 59, "max_number": 1, "min_number": 95, "player_max_number": 40, "player_min_number": 75}], "name": "dmlRlQna"}, "dzWM9beB": {"alliance": {"combination": {"alliances": [{"max": 100, "min": 13, "name": "kiVojsGI"}, {"max": 95, "min": 21, "name": "eAxQpKP3"}, {"max": 57, "min": 84, "name": "eq4d5TVx"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 77, "role_flexing_second": 25}, "max_number": 14, "min_number": 23, "player_max_number": 51, "player_min_number": 65}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 92, "min": 45, "name": "UmygiqD1"}, {"max": 97, "min": 43, "name": "JG8A3CbZ"}, {"max": 41, "min": 27, "name": "OWB3C3MM"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 26, "role_flexing_second": 2}, "duration": 49, "max_number": 92, "min_number": 27, "player_max_number": 9, "player_min_number": 57}, {"combination": {"alliances": [{"max": 72, "min": 46, "name": "yjz5zS3G"}, {"max": 26, "min": 100, "name": "7qK3w3kO"}, {"max": 70, "min": 43, "name": "t7180Ovo"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 17, "role_flexing_second": 50}, "duration": 48, "max_number": 5, "min_number": 46, "player_max_number": 98, "player_min_number": 91}, {"combination": {"alliances": [{"max": 9, "min": 42, "name": "yREOLL4s"}, {"max": 40, "min": 11, "name": "6NteB7yY"}, {"max": 26, "min": 91, "name": "0mO4rCOU"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 0, "role_flexing_second": 42}, "duration": 72, "max_number": 0, "min_number": 9, "player_max_number": 99, "player_min_number": 77}], "name": "HLdKBH5q"}}}, "session_queue_timeout_seconds": 80, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'ad783yBk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "aBPjH4X9", "players": [{"results": [{"attribute": "aNqfb9nU", "value": 0.37574081428313144}, {"attribute": "NWx3tRFv", "value": 0.37879503952757654}, {"attribute": "9ypPcqEk", "value": 0.26722928473398655}], "user_id": "Ak9D04Uq"}, {"results": [{"attribute": "jJmpF6JF", "value": 0.44644174866538966}, {"attribute": "jQfInAF9", "value": 0.5046437968258605}, {"attribute": "yBaTugc2", "value": 0.8686678282630582}], "user_id": "uDvwNWNg"}, {"results": [{"attribute": "gM0IAzXY", "value": 0.9669353548514568}, {"attribute": "4Qn0tCbx", "value": 0.1260359159911899}, {"attribute": "GpJfBtnV", "value": 0.7217263082247743}], "user_id": "oJoOQyhI"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "lrdJXpgu"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "vcCZV93h", "client_version": "bFhf6aMR", "deployment": "jtTorRjb", "error_code": 11, "error_message": "ASAANZq5", "game_mode": "5Zu98YSX", "joinable": true, "match_id": "UyzoV5Sk", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 19, "party_attributes": {"OvkTFVM6": {}, "gKZEUGaT": {}, "tb7wAJST": {}}, "party_id": "OouhmDJs", "party_members": [{"extra_attributes": {"sxMcdoYK": {}, "V1bfmfHx": {}, "s3VisZjk": {}}, "user_id": "4qH4qQSy"}, {"extra_attributes": {"BNjaTQBE": {}, "ahOnhucm": {}, "Zwz4cSIA": {}}, "user_id": "agofO9m8"}, {"extra_attributes": {"AzIHwDau": {}, "wxpb5p4K": {}, "RouShFng": {}}, "user_id": "KvtCDa3L"}], "ticket_id": "deZ5gSfv"}, {"first_ticket_created_at": 76, "party_attributes": {"mWBpSCK1": {}, "4x0Cle0r": {}, "5zNgTngn": {}}, "party_id": "TKIudwbB", "party_members": [{"extra_attributes": {"TXt6y0vi": {}, "Fhtgck4f": {}, "e9uQY9JN": {}}, "user_id": "ejrT9lQk"}, {"extra_attributes": {"894PZMVA": {}, "zoCBGeZv": {}, "8pL0Fuqs": {}}, "user_id": "bcLYjnDh"}, {"extra_attributes": {"7vj7im69": {}, "Juiuy21x": {}, "cZZEHO9J": {}}, "user_id": "YXEHpigW"}], "ticket_id": "o7EuEgPQ"}, {"first_ticket_created_at": 27, "party_attributes": {"xmY8UN7x": {}, "DmsHxJFF": {}, "fMIdrmOV": {}}, "party_id": "9zh2u8vd", "party_members": [{"extra_attributes": {"4sq4PawU": {}, "QW5P5MU0": {}, "b4QcLOv3": {}}, "user_id": "akMT6pUD"}, {"extra_attributes": {"lozi3B8F": {}, "3Cbxkh2R": {}, "SqMy52R2": {}}, "user_id": "86THMlWJ"}, {"extra_attributes": {"gjirjJkQ": {}, "XISBGwKC": {}, "nkRmqOMM": {}}, "user_id": "SKcQcQUW"}], "ticket_id": "f2AXp2RH"}]}, {"matching_parties": [{"first_ticket_created_at": 22, "party_attributes": {"0RWrEvhI": {}, "eJKI0WNs": {}, "tUFujrNl": {}}, "party_id": "c3nZ8Kz8", "party_members": [{"extra_attributes": {"wDGh9q0f": {}, "g4REENEI": {}, "e2t1XjTW": {}}, "user_id": "ujM4dM1q"}, {"extra_attributes": {"8dxveFAG": {}, "xXYT6x94": {}, "35f3fb9w": {}}, "user_id": "x9mvyZ5x"}, {"extra_attributes": {"OGGQMBxR": {}, "naMOuFcY": {}, "ZmM7ly58": {}}, "user_id": "Ni6zDDpj"}], "ticket_id": "os5HP68h"}, {"first_ticket_created_at": 47, "party_attributes": {"4lVsJyMS": {}, "47rlDGvG": {}, "sEUKvHrK": {}}, "party_id": "ZJmNYIBf", "party_members": [{"extra_attributes": {"VBB4UMye": {}, "f7XFK4z9": {}, "wMvQTZKq": {}}, "user_id": "Nqy6HMoc"}, {"extra_attributes": {"lSDeyQjo": {}, "NamNnT0Q": {}, "RpiRIfLP": {}}, "user_id": "V1wY2gGc"}, {"extra_attributes": {"F8130ezz": {}, "tAlJuG4B": {}, "iu6XLd56": {}}, "user_id": "oPAwaEw9"}], "ticket_id": "UhDnSHyT"}, {"first_ticket_created_at": 94, "party_attributes": {"xYvTfM5d": {}, "Cff3bU7r": {}, "pbYI5O0a": {}}, "party_id": "YbQOxcWz", "party_members": [{"extra_attributes": {"Mu2rkGdf": {}, "9Wg9NA2Z": {}, "7Cd9u4YK": {}}, "user_id": "rEZatSw5"}, {"extra_attributes": {"zpjmarcr": {}, "waA0Q6GA": {}, "vs4o6s6D": {}}, "user_id": "UeD9E4Ca"}, {"extra_attributes": {"FQGjmTds": {}, "epQjCvC9": {}, "9RSTCgdL": {}}, "user_id": "7d9mSkr6"}], "ticket_id": "FddSh9bp"}]}, {"matching_parties": [{"first_ticket_created_at": 13, "party_attributes": {"cVVHhBKX": {}, "nfBy0gif": {}, "2Q54K8s5": {}}, "party_id": "O6VRExrK", "party_members": [{"extra_attributes": {"vx8h4TML": {}, "xxu4Ki7T": {}, "m9vDycPs": {}}, "user_id": "vfhX2Fyj"}, {"extra_attributes": {"haVVuQmz": {}, "atZ0UftO": {}, "KaviMYHh": {}}, "user_id": "E2FzqOiV"}, {"extra_attributes": {"KP8cDNeP": {}, "UdzrK6wl": {}, "gfsbBtOr": {}}, "user_id": "LMZ0ZmiR"}], "ticket_id": "EArtP1HR"}, {"first_ticket_created_at": 4, "party_attributes": {"JxekawjI": {}, "rgr3y4u3": {}, "wwyzRZaI": {}}, "party_id": "i7inE0YU", "party_members": [{"extra_attributes": {"hUIpSx7r": {}, "8xfeKwsh": {}, "agJluQp7": {}}, "user_id": "6FWxSOHy"}, {"extra_attributes": {"9VDhh5rf": {}, "2tkp9gjc": {}, "CMrsyeJY": {}}, "user_id": "S21iSEKI"}, {"extra_attributes": {"3aYBviDR": {}, "GXF57DBB": {}, "alTOGSOn": {}}, "user_id": "jbnzwgfO"}], "ticket_id": "8ZSLlEPu"}, {"first_ticket_created_at": 82, "party_attributes": {"Am2Ij31q": {}, "2zKwFuLF": {}, "GqlLIVzy": {}}, "party_id": "H8wQIpZT", "party_members": [{"extra_attributes": {"H35Nhi4E": {}, "aoIWfKEt": {}, "5diWrCXd": {}}, "user_id": "UHMke6mO"}, {"extra_attributes": {"yC8lOni7": {}, "rPJiTFQv": {}, "4fRaWRfs": {}}, "user_id": "tCvq3FSB"}, {"extra_attributes": {"okOdoslk": {}, "hZyohVO7": {}, "7k2Qt8Wx": {}}, "user_id": "Z9EAsfs9"}], "ticket_id": "VPqGfQ6y"}]}], "namespace": "fA3Q1mkI", "party_attributes": {"S1BwPpA1": {}, "VBkcw8Mg": {}, "coVGgkJQ": {}}, "party_id": "EWSakDmO", "queued_at": 38, "region": "vclKjn8g", "server_name": "BeelUksW", "status": "0pYZCdiF", "ticket_id": "2Zdrse3v", "updated_at": "1975-07-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "DLW4OcNd"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'rri2WWMT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 40, "userID": "cMzRFt52", "weight": 0.4304993195927347}' \
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
    --matchIDs '7udvSpeO' \
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
    --strategy '9YivYVra' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'J3ox3auJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'TTYLC5LS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "2X3nXjDw", "description": "LqBvVWS8", "findMatchTimeoutSeconds": 2, "joinable": false, "max_delay_ms": 50, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 12, "min": 35, "name": "hAFXXfjX"}, {"max": 73, "min": 18, "name": "sKcR5mPj"}, {"max": 44, "min": 95, "name": "5f5ZhMKH"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 93, "role_flexing_second": 91}, "maxNumber": 67, "minNumber": 36, "playerMaxNumber": 36, "playerMinNumber": 82}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 52, "min": 19, "name": "ngAw6MOm"}, {"max": 44, "min": 3, "name": "kJ5StIGu"}, {"max": 23, "min": 25, "name": "CmDIHEFy"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 86, "role_flexing_second": 21}, "duration": 43, "max_number": 69, "min_number": 82, "player_max_number": 34, "player_min_number": 84}, {"combination": {"alliances": [{"max": 24, "min": 29, "name": "41JXqcE7"}, {"max": 32, "min": 41, "name": "9iiUKfJX"}, {"max": 97, "min": 91, "name": "lbBECIxt"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 46}, "duration": 85, "max_number": 65, "min_number": 29, "player_max_number": 92, "player_min_number": 41}, {"combination": {"alliances": [{"max": 91, "min": 56, "name": "35Neu6AB"}, {"max": 28, "min": 87, "name": "grpHh2Ii"}, {"max": 20, "min": 86, "name": "gVYjyqfc"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 99, "role_flexing_second": 97}, "duration": 40, "max_number": 36, "min_number": 97, "player_max_number": 30, "player_min_number": 99}], "flexingRules": [{"attribute": "eGwY8sLJ", "criteria": "1k28EgSu", "duration": 83, "reference": 0.6270327851926678}, {"attribute": "6nP9grpe", "criteria": "P1fyxaWP", "duration": 61, "reference": 0.08965768474899649}, {"attribute": "2jUG5zxl", "criteria": "TS5Dpk3E", "duration": 9, "reference": 0.1844542498294206}], "match_options": {"options": [{"name": "xhzGlbrd", "type": "IRDrTH96"}, {"name": "NEecbbhG", "type": "CLZPydz7"}, {"name": "q71EAj66", "type": "IeLjcBWL"}]}, "matchingRules": [{"attribute": "UBDgpRXK", "criteria": "tbtUQnxf", "reference": 0.6065952443584518}, {"attribute": "WOkG7jKC", "criteria": "E9u25cyI", "reference": 0.0018674025659038973}, {"attribute": "twRpHLvJ", "criteria": "SUF2vvi8", "reference": 0.5587777297886637}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 73, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'm5sGRMVS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'ouJlDCD8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'Yh2keLKJ' \
    --matchID 'iQGY0lzX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["hfNI6IVK", "gZyEx2FR", "cgVI9dZV"], "party_id": "R0GEMfFv", "user_id": "jVyzlDth"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'FrIq9t0c' \
    --matchID 'vpvzPeOs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'BjHHoG9s' \
    --matchID 'SD8SsGRI' \
    --namespace "$AB_NAMESPACE" \
    --userID 'FNbwVZCy' \
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
    --channelName 'CqusreVM' \
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