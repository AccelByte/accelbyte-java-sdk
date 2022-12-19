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
    --limit '78' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "im7CpESt", "description": "bDcknzcH", "find_match_timeout_seconds": 99, "game_mode": "bKZAgq8R", "joinable": false, "max_delay_ms": 16, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 24, "min": 40, "name": "WeQPVlTf"}, {"max": 47, "min": 86, "name": "SEoZQX4I"}, {"max": 58, "min": 68, "name": "62fYPFmC"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 57}, "max_number": 1, "min_number": 36, "player_max_number": 34, "player_min_number": 48}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 78, "min": 64, "name": "ojGhx0bL"}, {"max": 23, "min": 28, "name": "BatT7QjV"}, {"max": 65, "min": 27, "name": "prccY9A9"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 56}, "duration": 85, "max_number": 32, "min_number": 77, "player_max_number": 80, "player_min_number": 40}, {"combination": {"alliances": [{"max": 63, "min": 80, "name": "lswWs2en"}, {"max": 48, "min": 36, "name": "XqNZVK66"}, {"max": 91, "min": 34, "name": "WTMZnvAO"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 95, "role_flexing_second": 61}, "duration": 80, "max_number": 96, "min_number": 80, "player_max_number": 26, "player_min_number": 100}, {"combination": {"alliances": [{"max": 39, "min": 20, "name": "SBOXxVhJ"}, {"max": 48, "min": 90, "name": "vNpywrNh"}, {"max": 62, "min": 11, "name": "YsQFdbfa"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 71}, "duration": 59, "max_number": 22, "min_number": 19, "player_max_number": 73, "player_min_number": 16}], "flexing_rule": [{"attribute": "hvaj4LNQ", "criteria": "sTUCoS8P", "duration": 84, "reference": 0.7524399030394221}, {"attribute": "BCEMAyha", "criteria": "LhB8O64u", "duration": 32, "reference": 0.3285030647707602}, {"attribute": "l7t1fQEx", "criteria": "HbDN0CNo", "duration": 8, "reference": 0.35375797449302415}], "match_options": {"options": [{"name": "9NUgKMmU", "type": "1mf01gQH"}, {"name": "3njX5WLa", "type": "EiR7dAY1"}, {"name": "u0yhBkHJ", "type": "2X1BGgoe"}]}, "matching_rule": [{"attribute": "lLWeoOTY", "criteria": "X0qoC0gW", "reference": 0.7133404035554894}, {"attribute": "9Cn7JCIm", "criteria": "kOGlvN40", "reference": 0.9487979256928257}, {"attribute": "aULOUN4Z", "criteria": "49qpYCcs", "reference": 0.7924968243028238}], "rebalance_enable": false, "sub_game_modes": {"LaPxSu3N": {"alliance": {"combination": {"alliances": [{"max": 29, "min": 99, "name": "uaOWawyG"}, {"max": 96, "min": 0, "name": "PBJjpI3G"}, {"max": 19, "min": 33, "name": "5Jkyhw8d"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 15}, "max_number": 14, "min_number": 80, "player_max_number": 35, "player_min_number": 56}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 58, "min": 82, "name": "x1l40nfr"}, {"max": 96, "min": 14, "name": "ferZvQSv"}, {"max": 54, "min": 51, "name": "ZrplnPq5"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 51, "role_flexing_second": 15}, "duration": 77, "max_number": 37, "min_number": 51, "player_max_number": 23, "player_min_number": 71}, {"combination": {"alliances": [{"max": 62, "min": 39, "name": "zlECXyWa"}, {"max": 72, "min": 58, "name": "51tpqmgW"}, {"max": 63, "min": 59, "name": "embNcY1h"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 43, "role_flexing_second": 91}, "duration": 2, "max_number": 33, "min_number": 92, "player_max_number": 54, "player_min_number": 47}, {"combination": {"alliances": [{"max": 88, "min": 13, "name": "EwrMD0Qa"}, {"max": 44, "min": 54, "name": "sqxJ7NU5"}, {"max": 60, "min": 86, "name": "ZpQcNCAF"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 90, "role_flexing_second": 68}, "duration": 72, "max_number": 23, "min_number": 20, "player_max_number": 96, "player_min_number": 52}], "name": "MAORfHTY"}, "h86iblqa": {"alliance": {"combination": {"alliances": [{"max": 71, "min": 73, "name": "iUuw2heM"}, {"max": 22, "min": 26, "name": "3pXtOTg7"}, {"max": 28, "min": 10, "name": "RQuAUSmm"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 25, "role_flexing_second": 88}, "max_number": 17, "min_number": 9, "player_max_number": 93, "player_min_number": 76}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 17, "min": 93, "name": "xq3CwsBd"}, {"max": 15, "min": 53, "name": "ShRPH3Dt"}, {"max": 39, "min": 18, "name": "c1IjRtqe"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 47, "role_flexing_second": 77}, "duration": 91, "max_number": 84, "min_number": 42, "player_max_number": 31, "player_min_number": 65}, {"combination": {"alliances": [{"max": 75, "min": 14, "name": "B54jQjZN"}, {"max": 34, "min": 53, "name": "ho2Bchw4"}, {"max": 39, "min": 23, "name": "l0kRaJmm"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 72, "role_flexing_second": 66}, "duration": 94, "max_number": 50, "min_number": 76, "player_max_number": 84, "player_min_number": 4}, {"combination": {"alliances": [{"max": 66, "min": 43, "name": "kIDasYvq"}, {"max": 64, "min": 0, "name": "vplWGJ5P"}, {"max": 83, "min": 54, "name": "IzMktypB"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 12, "role_flexing_second": 3}, "duration": 15, "max_number": 0, "min_number": 47, "player_max_number": 38, "player_min_number": 32}], "name": "KJKnhlIO"}, "Gs4Z0IS3": {"alliance": {"combination": {"alliances": [{"max": 85, "min": 73, "name": "1Z7nCups"}, {"max": 92, "min": 99, "name": "fIGgnsOH"}, {"max": 37, "min": 32, "name": "kRWxd5Jo"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 53, "role_flexing_second": 6}, "max_number": 65, "min_number": 25, "player_max_number": 4, "player_min_number": 66}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 58, "min": 98, "name": "m0VKyDC6"}, {"max": 5, "min": 85, "name": "8MQQZEm3"}, {"max": 42, "min": 86, "name": "0EQlk0MN"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 15, "role_flexing_second": 17}, "duration": 54, "max_number": 27, "min_number": 19, "player_max_number": 10, "player_min_number": 14}, {"combination": {"alliances": [{"max": 34, "min": 74, "name": "VuORNqiV"}, {"max": 90, "min": 50, "name": "o5p0RBPN"}, {"max": 16, "min": 31, "name": "y89x1iDK"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 77, "role_flexing_second": 52}, "duration": 42, "max_number": 67, "min_number": 60, "player_max_number": 78, "player_min_number": 41}, {"combination": {"alliances": [{"max": 39, "min": 100, "name": "PZSsQtBY"}, {"max": 9, "min": 30, "name": "KPSfMXZv"}, {"max": 91, "min": 47, "name": "w8sgZj4Z"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 2, "role_flexing_second": 71}, "duration": 9, "max_number": 54, "min_number": 25, "player_max_number": 29, "player_min_number": 87}], "name": "2XqrKRX9"}}}, "session_queue_timeout_seconds": 23, "social_matchmaking": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'UxXz6wiP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "VVdhBvGX", "players": [{"results": [{"attribute": "Dw8uxy0P", "value": 0.24792220609225002}, {"attribute": "nQE0FzSH", "value": 0.1588254869348752}, {"attribute": "xsXOYsOc", "value": 0.010013870267075564}], "user_id": "T82cHRAL"}, {"results": [{"attribute": "nSpzGZ0q", "value": 0.4264029792582913}, {"attribute": "69e1fxdm", "value": 0.014334210538492043}, {"attribute": "OIvYKfse", "value": 0.7399014801960353}], "user_id": "yP8JFTnH"}, {"results": [{"attribute": "S4juCwmX", "value": 0.7427817672026419}, {"attribute": "V44Qx7OW", "value": 0.04717759512845254}, {"attribute": "8db8pnfk", "value": 0.4014522310147032}], "user_id": "ii9Jtvo5"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "ev7ox5W1"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "ns4JiXL3", "client_version": "unxaYOBz", "deployment": "ElUz6PrS", "error_code": 80, "error_message": "r7hvn7PN", "game_mode": "BQuxFh8L", "joinable": true, "match_id": "RFcWKv3H", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 35, "party_attributes": {"7Uq8S6A1": {}, "PQS3PAoW": {}, "3WJXQGb6": {}}, "party_id": "hWRiDv3U", "party_members": [{"extra_attributes": {"e0UpIbhY": {}, "27xdoifb": {}, "5Qe4ZvY1": {}}, "user_id": "YYgfeuLc"}, {"extra_attributes": {"FS79AUQS": {}, "9O0OLka3": {}, "OQPBaHFp": {}}, "user_id": "nC0ckIOX"}, {"extra_attributes": {"Wu6awbCT": {}, "YSSnBNcS": {}, "9Mf5J7eS": {}}, "user_id": "Hok0TsyP"}], "ticket_id": "e4oisHbK"}, {"first_ticket_created_at": 22, "party_attributes": {"k1RpNFhQ": {}, "noUBVY1i": {}, "CwAH5NvJ": {}}, "party_id": "ms18ZOwL", "party_members": [{"extra_attributes": {"5F7wHTVb": {}, "GLqoXf3k": {}, "32zkJ6hO": {}}, "user_id": "VloNtwNt"}, {"extra_attributes": {"a6d1uEo9": {}, "4d9q2gdc": {}, "joBvjNWK": {}}, "user_id": "TuD5KjKc"}, {"extra_attributes": {"iPhyRtge": {}, "gQuyxie2": {}, "qZbK4cmT": {}}, "user_id": "rHHFml6J"}], "ticket_id": "1749YREA"}, {"first_ticket_created_at": 25, "party_attributes": {"Nmgmhfyf": {}, "vLsEhhPH": {}, "6s7rsMiq": {}}, "party_id": "mok6kRpI", "party_members": [{"extra_attributes": {"EoecjJFT": {}, "988ZeBES": {}, "0ZAyeHnx": {}}, "user_id": "2FOdmExW"}, {"extra_attributes": {"vDVWFrP5": {}, "xWPhQLEi": {}, "HPjPNky2": {}}, "user_id": "P1t7Z5Qb"}, {"extra_attributes": {"5CxOKNQM": {}, "jlzbIEsH": {}, "ZhpMLN7o": {}}, "user_id": "nffIT7cS"}], "ticket_id": "GLhbOH43"}]}, {"matching_parties": [{"first_ticket_created_at": 74, "party_attributes": {"bfronaul": {}, "rRKztE4x": {}, "t8oxm8qD": {}}, "party_id": "reBO73xv", "party_members": [{"extra_attributes": {"nxCLYKcU": {}, "RsG0laFP": {}, "M77TF3OF": {}}, "user_id": "qrp3dKTi"}, {"extra_attributes": {"bBRydzqB": {}, "hLbW3Ri2": {}, "wtp7efL6": {}}, "user_id": "4BXFQQoW"}, {"extra_attributes": {"ppRNGg6j": {}, "HpqY9uJ0": {}, "PLBYIf8B": {}}, "user_id": "cuG9XEjG"}], "ticket_id": "pzFi53RR"}, {"first_ticket_created_at": 25, "party_attributes": {"At02PB9B": {}, "cklW1NTi": {}, "KJ4cnZXh": {}}, "party_id": "o3Tr0VBH", "party_members": [{"extra_attributes": {"Z2UgK8V1": {}, "rj0W7x2h": {}, "eP86Z54t": {}}, "user_id": "FLZp9GAT"}, {"extra_attributes": {"mxrk0gkg": {}, "VuxPUfM5": {}, "qM9oQJF1": {}}, "user_id": "1825xJVE"}, {"extra_attributes": {"MfYyI1oU": {}, "xf2cIbKB": {}, "HkZutpYU": {}}, "user_id": "v8dZlHb2"}], "ticket_id": "MuHLyHxQ"}, {"first_ticket_created_at": 84, "party_attributes": {"Z47PbSv5": {}, "W5nOMwCZ": {}, "hWzcCuWw": {}}, "party_id": "MXhQuVty", "party_members": [{"extra_attributes": {"Ewe4w4EI": {}, "H5H5nfkj": {}, "Y5Qg5muF": {}}, "user_id": "ffb2fsXJ"}, {"extra_attributes": {"GDy9XrPy": {}, "5Qk04EFm": {}, "jqnVXJy8": {}}, "user_id": "Zdg9tTD3"}, {"extra_attributes": {"6DRFF7Mn": {}, "MYT07igs": {}, "0SQhqAzx": {}}, "user_id": "anXKNQ98"}], "ticket_id": "zCK6dOUJ"}]}, {"matching_parties": [{"first_ticket_created_at": 77, "party_attributes": {"Z1aOGQUj": {}, "3GtYuJZa": {}, "SlrioZSs": {}}, "party_id": "BTdzQTsE", "party_members": [{"extra_attributes": {"z9Ke7wVf": {}, "KOuAj9Ol": {}, "QPzipiGN": {}}, "user_id": "G9y4tKux"}, {"extra_attributes": {"wSTHtwRx": {}, "CHYrqPcE": {}, "yOkKMUBD": {}}, "user_id": "sfVr2yLw"}, {"extra_attributes": {"APaQIoA2": {}, "Xq7r8f8J": {}, "oi4p7OSQ": {}}, "user_id": "1Fsk7Cp8"}], "ticket_id": "aqBQUHka"}, {"first_ticket_created_at": 52, "party_attributes": {"X11878EF": {}, "FiiT4B6J": {}, "Ya5yogAr": {}}, "party_id": "xQHXrrXh", "party_members": [{"extra_attributes": {"Fd5zrPJU": {}, "2goCaZXU": {}, "ZH7RXQnx": {}}, "user_id": "bIdfesOf"}, {"extra_attributes": {"jGWciAmK": {}, "E8qxumqb": {}, "MuuRJeNi": {}}, "user_id": "aphloWJU"}, {"extra_attributes": {"gCgUmPE8": {}, "xTI0H2H3": {}, "BDALSAJp": {}}, "user_id": "z461Razg"}], "ticket_id": "o89nAHs4"}, {"first_ticket_created_at": 32, "party_attributes": {"4BxeeB1p": {}, "Zz5WmDAc": {}, "BJaUV79G": {}}, "party_id": "YcU8WoTm", "party_members": [{"extra_attributes": {"3b7r3OBl": {}, "sSzoAzE4": {}, "oGVeQiv9": {}}, "user_id": "rzHYY3lc"}, {"extra_attributes": {"n6206oWw": {}, "CSKFZP2Z": {}, "3BMLNp31": {}}, "user_id": "YJ6lPBw0"}, {"extra_attributes": {"fa31N9sT": {}, "IOz8OZUx": {}, "DMPKvkGO": {}}, "user_id": "GPzgDmnV"}], "ticket_id": "ARM2GsnP"}]}], "namespace": "fWgu3Ej2", "party_attributes": {"q3Xb22xL": {}, "72A98jKI": {}, "Wokliro1": {}}, "party_id": "I4S3tQhO", "queued_at": 8, "region": "qdvKxoi9", "server_name": "autTCDBj", "status": "Qa84r8Kc", "ticket_id": "YeySs214", "updated_at": "1991-07-31T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "c8su1ioe"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'Yd8T79lG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 82, "userID": "nx3DUPJZ", "weight": 0.7970973451235709}' \
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
    --matchIDs 'iEvzGJu1' \
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
    --strategy '5u4Vdkkr' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName '8u2VGMMn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'E1Biaqf8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "d8qFVH6S", "description": "uP4UO2Zw", "findMatchTimeoutSeconds": 14, "joinable": true, "max_delay_ms": 51, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 51, "min": 21, "name": "IUVL2jnv"}, {"max": 95, "min": 39, "name": "mjkvv4Xb"}, {"max": 63, "min": 81, "name": "7CXFfP3u"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 55, "role_flexing_second": 43}, "maxNumber": 84, "minNumber": 93, "playerMaxNumber": 3, "playerMinNumber": 26}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 16, "min": 77, "name": "YOc5ajmR"}, {"max": 73, "min": 80, "name": "65tjsK7j"}, {"max": 62, "min": 46, "name": "eLCJhyVV"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 21, "role_flexing_second": 98}, "duration": 79, "max_number": 99, "min_number": 60, "player_max_number": 23, "player_min_number": 82}, {"combination": {"alliances": [{"max": 94, "min": 90, "name": "VAV6izC3"}, {"max": 25, "min": 25, "name": "hvKwDXii"}, {"max": 63, "min": 60, "name": "kPNfoIEL"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 23, "role_flexing_second": 65}, "duration": 62, "max_number": 50, "min_number": 18, "player_max_number": 35, "player_min_number": 59}, {"combination": {"alliances": [{"max": 97, "min": 48, "name": "pKrSsTKA"}, {"max": 70, "min": 65, "name": "LlJFXJCr"}, {"max": 98, "min": 9, "name": "GtTGgEcT"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 91, "role_flexing_second": 82}, "duration": 60, "max_number": 28, "min_number": 27, "player_max_number": 92, "player_min_number": 65}], "flexingRules": [{"attribute": "VudazLxu", "criteria": "hhC4eyKC", "duration": 71, "reference": 0.5073880970514213}, {"attribute": "yC51ME0u", "criteria": "C3VApAnX", "duration": 76, "reference": 0.6282945755348467}, {"attribute": "UtHDJsQ3", "criteria": "Ju5k0syW", "duration": 74, "reference": 0.9754625865289935}], "match_options": {"options": [{"name": "6ks5v8L2", "type": "IvM3oU1q"}, {"name": "n9rDh0ps", "type": "KikrRlOG"}, {"name": "FlO56Ww6", "type": "DVKoQiyl"}]}, "matchingRules": [{"attribute": "ze2lczqb", "criteria": "LvdFWPn3", "reference": 0.33890395102133464}, {"attribute": "C4F5DOs1", "criteria": "J20WILNB", "reference": 0.4170235823712527}, {"attribute": "VbQQ0h9T", "criteria": "dyP1flTD", "reference": 0.7310614649663311}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 28, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'u0dILymE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'mrcBaO6w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'TECXG50P' \
    --matchID 'e5tR9Ua5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["D4UldLCo", "4rb6Epxy", "Fu4yegs0"], "party_id": "p1GBKmZ9", "user_id": "w68YYRiH"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'ZRLknQra' \
    --matchID 'xtrna2om' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '23GanZap' \
    --matchID '0dYtTNSc' \
    --namespace "$AB_NAMESPACE" \
    --userID '2O5XnocO' \
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
    --channelName 'Bw12BN5v' \
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