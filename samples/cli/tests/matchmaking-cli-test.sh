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
    --limit '64' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "oU1XTP3x", "description": "1uneqG5o", "find_match_timeout_seconds": 20, "game_mode": "d6Zou2SC", "joinable": true, "max_delay_ms": 94, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 27, "min": 10, "name": "8QF88bM3"}, {"max": 14, "min": 78, "name": "oZpvHD5D"}, {"max": 60, "min": 100, "name": "3siAzLtw"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 89, "role_flexing_second": 31}, "max_number": 89, "min_number": 31, "player_max_number": 73, "player_min_number": 34}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 24, "min": 97, "name": "ibiDN8GJ"}, {"max": 19, "min": 49, "name": "sbGAiKAD"}, {"max": 83, "min": 56, "name": "JcMFhYD4"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 71, "role_flexing_second": 0}, "duration": 20, "max_number": 36, "min_number": 59, "player_max_number": 64, "player_min_number": 41}, {"combination": {"alliances": [{"max": 89, "min": 0, "name": "hU6LSkRs"}, {"max": 98, "min": 63, "name": "eant1IhK"}, {"max": 62, "min": 94, "name": "lPzRnBPM"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 15, "role_flexing_second": 82}, "duration": 22, "max_number": 91, "min_number": 23, "player_max_number": 11, "player_min_number": 34}, {"combination": {"alliances": [{"max": 93, "min": 48, "name": "MlYDk16Y"}, {"max": 41, "min": 99, "name": "C9UuCxE5"}, {"max": 56, "min": 90, "name": "YJiiC10R"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 58, "role_flexing_second": 49}, "duration": 37, "max_number": 39, "min_number": 80, "player_max_number": 94, "player_min_number": 51}], "flexing_rule": [{"attribute": "030UsLaZ", "criteria": "RHiWBqXP", "duration": 25, "reference": 0.885677938812257}, {"attribute": "DJ6d9muc", "criteria": "tw6ceKd0", "duration": 97, "reference": 0.4578984707285956}, {"attribute": "UxZtVETo", "criteria": "d4eSVEF1", "duration": 57, "reference": 0.6591340796203764}], "match_options": {"options": [{"name": "BuFutmsK", "type": "Ql4grwIy"}, {"name": "iQZfNOly", "type": "LC5wkjZO"}, {"name": "rYGkMes1", "type": "S8ZdE95I"}]}, "matching_rule": [{"attribute": "5gTnAtFs", "criteria": "4RtN38Va", "reference": 0.9128061397261511}, {"attribute": "jpTJ5P8G", "criteria": "z1EYNo9u", "reference": 0.6118085660667163}, {"attribute": "01z6cewL", "criteria": "6WSD1Ja5", "reference": 0.8707806366224423}], "sub_game_modes": {"Tjekw1qE": {"alliance": {"combination": {"alliances": [{"max": 11, "min": 0, "name": "Qd6QldWM"}, {"max": 41, "min": 79, "name": "ODylMROL"}, {"max": 70, "min": 93, "name": "fsAUOtdq"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 2, "role_flexing_second": 5}, "max_number": 69, "min_number": 28, "player_max_number": 19, "player_min_number": 97}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 67, "min": 91, "name": "0mpdA1Y4"}, {"max": 24, "min": 87, "name": "s7ootr9f"}, {"max": 30, "min": 66, "name": "YAuCk1Bw"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 73, "role_flexing_second": 71}, "duration": 31, "max_number": 9, "min_number": 58, "player_max_number": 43, "player_min_number": 73}, {"combination": {"alliances": [{"max": 16, "min": 97, "name": "KguBPMmt"}, {"max": 68, "min": 36, "name": "X66exl4Q"}, {"max": 94, "min": 93, "name": "zGZUeNYC"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 100, "role_flexing_second": 50}, "duration": 55, "max_number": 54, "min_number": 40, "player_max_number": 69, "player_min_number": 35}, {"combination": {"alliances": [{"max": 31, "min": 65, "name": "uRVr6cbA"}, {"max": 35, "min": 20, "name": "Mou84CF6"}, {"max": 58, "min": 30, "name": "VAtC4GKp"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 11, "role_flexing_second": 40}, "duration": 36, "max_number": 60, "min_number": 84, "player_max_number": 71, "player_min_number": 40}], "name": "QG140t2c"}, "X2JmZx2Y": {"alliance": {"combination": {"alliances": [{"max": 90, "min": 92, "name": "rNAFIm82"}, {"max": 17, "min": 92, "name": "urXA68sV"}, {"max": 93, "min": 43, "name": "QlQtd6vc"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 13, "role_flexing_second": 34}, "max_number": 63, "min_number": 48, "player_max_number": 55, "player_min_number": 37}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 93, "min": 69, "name": "PiHIpkEi"}, {"max": 62, "min": 62, "name": "WdBbh2xv"}, {"max": 19, "min": 57, "name": "uOlMQGPG"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 49, "role_flexing_second": 19}, "duration": 42, "max_number": 4, "min_number": 25, "player_max_number": 17, "player_min_number": 100}, {"combination": {"alliances": [{"max": 45, "min": 3, "name": "qOTvuuOo"}, {"max": 68, "min": 61, "name": "FPcidOsU"}, {"max": 59, "min": 34, "name": "BmtKfTSc"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 18, "role_flexing_second": 77}, "duration": 39, "max_number": 66, "min_number": 23, "player_max_number": 33, "player_min_number": 57}, {"combination": {"alliances": [{"max": 37, "min": 62, "name": "OfHtbqFv"}, {"max": 84, "min": 45, "name": "fR4w6GAM"}, {"max": 48, "min": 19, "name": "u2AET09D"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 89, "role_flexing_second": 82}, "duration": 37, "max_number": 20, "min_number": 38, "player_max_number": 92, "player_min_number": 81}], "name": "UeDIPgOL"}, "cBIv6rCy": {"alliance": {"combination": {"alliances": [{"max": 82, "min": 34, "name": "nv4mTykt"}, {"max": 49, "min": 15, "name": "EMbx4gx2"}, {"max": 8, "min": 54, "name": "611A42YI"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 84, "role_flexing_second": 47}, "max_number": 22, "min_number": 91, "player_max_number": 26, "player_min_number": 38}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 21, "min": 71, "name": "iOZ2hX4f"}, {"max": 5, "min": 6, "name": "7qBvettS"}, {"max": 95, "min": 88, "name": "hBuSzpyk"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 18}, "duration": 4, "max_number": 5, "min_number": 4, "player_max_number": 69, "player_min_number": 38}, {"combination": {"alliances": [{"max": 92, "min": 23, "name": "8qGXwVNQ"}, {"max": 88, "min": 61, "name": "wVCXz3V1"}, {"max": 22, "min": 43, "name": "zPEWl7pS"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 82}, "duration": 86, "max_number": 14, "min_number": 96, "player_max_number": 81, "player_min_number": 75}, {"combination": {"alliances": [{"max": 58, "min": 25, "name": "didchQO9"}, {"max": 8, "min": 54, "name": "jfC3tpBP"}, {"max": 94, "min": 93, "name": "FHPDfIyy"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 45, "role_flexing_second": 79}, "duration": 55, "max_number": 4, "min_number": 85, "player_max_number": 61, "player_min_number": 78}], "name": "wBIGljEN"}}}, "session_queue_timeout_seconds": 93, "social_matchmaking": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'ns8x9O76' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "S2R4BzyG", "players": [{"results": [{"attribute": "L1Zkf1xF", "value": 0.8681671321126534}, {"attribute": "lLurxh8g", "value": 0.012055442508649539}, {"attribute": "fDUTQvWH", "value": 0.35582795836828685}], "user_id": "2T8fLJJt"}, {"results": [{"attribute": "lB8uToAs", "value": 0.11498319541411073}, {"attribute": "exUGY32b", "value": 0.4072971859646999}, {"attribute": "wZbx6eoj", "value": 0.585137079633582}], "user_id": "FPCrvoS4"}, {"results": [{"attribute": "l05HXUPJ", "value": 0.5478241358799725}, {"attribute": "LQvMUvFn", "value": 0.28868667959758143}, {"attribute": "9HQD4bQE", "value": 0.4104775416871247}], "user_id": "VSJ7PfGF"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "zrZgeY0I"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "lRjK0We9", "client_version": "60wMPFHL", "deployment": "GwdK3jQB", "error_code": 26, "error_message": "rQSWVzGQ", "game_mode": "we85oW0n", "joinable": false, "match_id": "u6dd7gVh", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 91, "party_attributes": {"Y5HgBN94": {}, "Orp28Nu2": {}, "BwEIbVPb": {}}, "party_id": "KO5gmpUd", "party_members": [{"extra_attributes": {"PZy3oPhL": {}, "bTbIifYq": {}, "SzvTEVkl": {}}, "user_id": "7J2aGhZM"}, {"extra_attributes": {"15h1JOkV": {}, "jsku5aK6": {}, "9J0WmmKn": {}}, "user_id": "Eq1mjMdm"}, {"extra_attributes": {"W24JHicw": {}, "eOjCBoUT": {}, "wxneKbE1": {}}, "user_id": "RMSNJ449"}], "ticket_id": "0c1e3z3X"}, {"first_ticket_created_at": 76, "party_attributes": {"GII2NLJh": {}, "0NifGhVh": {}, "lxh9eT69": {}}, "party_id": "M4qvXmfI", "party_members": [{"extra_attributes": {"dpgJ1ILE": {}, "rbDbQMuJ": {}, "TjGqShbb": {}}, "user_id": "c00xy2Sz"}, {"extra_attributes": {"MrXDWMBA": {}, "ablvOTbh": {}, "Lz7ZUIUT": {}}, "user_id": "OHQTVOoj"}, {"extra_attributes": {"Ortv6RRP": {}, "iPEDR9lL": {}, "vLvgVVh0": {}}, "user_id": "w4CCn565"}], "ticket_id": "ojDwDXmi"}, {"first_ticket_created_at": 100, "party_attributes": {"QAfJcaTM": {}, "zZ3XSSdT": {}, "dAn2x0RA": {}}, "party_id": "6MgrYV8H", "party_members": [{"extra_attributes": {"ioyo4RdE": {}, "75kGC73q": {}, "18O1PKoj": {}}, "user_id": "s6YcR858"}, {"extra_attributes": {"I4MhrBQL": {}, "8aph3hK4": {}, "fG719iOD": {}}, "user_id": "e6V65xOn"}, {"extra_attributes": {"YtiDIFQR": {}, "OUGAk0PF": {}, "toa6GXbY": {}}, "user_id": "vXEF3pfv"}], "ticket_id": "FkBqzUhs"}]}, {"matching_parties": [{"first_ticket_created_at": 11, "party_attributes": {"cEx5V62R": {}, "n7UONbas": {}, "Bt2i6zGi": {}}, "party_id": "kdqtgeRJ", "party_members": [{"extra_attributes": {"Z4wgxURf": {}, "jgmyqESA": {}, "UyWivU0I": {}}, "user_id": "pDZYBH9V"}, {"extra_attributes": {"aJ6VGEqM": {}, "QhmkyRLK": {}, "cNa78h4n": {}}, "user_id": "VEAOzy19"}, {"extra_attributes": {"isqBuAqL": {}, "GhBfVp8C": {}, "gywrUp3I": {}}, "user_id": "SdcSp1HC"}], "ticket_id": "ncfXV82X"}, {"first_ticket_created_at": 88, "party_attributes": {"ZSip7UcP": {}, "LNt9wI7D": {}, "5t932Z3V": {}}, "party_id": "EG53ZnYq", "party_members": [{"extra_attributes": {"rXUuvc8s": {}, "EZ0rZQWv": {}, "9YtdiSPU": {}}, "user_id": "7WWuyhyQ"}, {"extra_attributes": {"zNmhrhZN": {}, "ZUISSfiq": {}, "6KPeG6VA": {}}, "user_id": "3aTK6cyx"}, {"extra_attributes": {"QDRODdY5": {}, "ijeu55ab": {}, "z2sk6L6y": {}}, "user_id": "QyPadgBy"}], "ticket_id": "W5Qp3qRi"}, {"first_ticket_created_at": 60, "party_attributes": {"GL5ZdACa": {}, "Gevqr8zK": {}, "EE8kTtBA": {}}, "party_id": "oa2yOUoG", "party_members": [{"extra_attributes": {"vz8jSDda": {}, "JfqVqbZJ": {}, "zYi4dpZx": {}}, "user_id": "6aruyfEq"}, {"extra_attributes": {"s548GaUi": {}, "h06jp39E": {}, "65U73sYo": {}}, "user_id": "DXwCCMCc"}, {"extra_attributes": {"Al6cKaY1": {}, "Y4ivM08z": {}, "W1KxsPzq": {}}, "user_id": "pYWn1gn4"}], "ticket_id": "ufzUjQZX"}]}, {"matching_parties": [{"first_ticket_created_at": 65, "party_attributes": {"zbhmTbF0": {}, "wSENHMJe": {}, "kwhf9l1S": {}}, "party_id": "wtAjwkc5", "party_members": [{"extra_attributes": {"ebU9YCh0": {}, "vxalA6S6": {}, "EwhfwZoU": {}}, "user_id": "3jV0QN5w"}, {"extra_attributes": {"ZfbU2sRG": {}, "tFzhBW5v": {}, "LcEW0UqT": {}}, "user_id": "9smHHFT3"}, {"extra_attributes": {"pdnlgMXX": {}, "UHLiRA7h": {}, "hrcMAgIq": {}}, "user_id": "byZKYupz"}], "ticket_id": "bWg2ivh3"}, {"first_ticket_created_at": 35, "party_attributes": {"xTnLTeHC": {}, "2cRD06Zi": {}, "wI04EfG5": {}}, "party_id": "nv7dSBFM", "party_members": [{"extra_attributes": {"5nwZMtmI": {}, "STUDdeKM": {}, "9rqavMR2": {}}, "user_id": "zmwAg2zN"}, {"extra_attributes": {"KBHgHtK6": {}, "w54SbY92": {}, "9oJzaMzF": {}}, "user_id": "tO5QswVS"}, {"extra_attributes": {"hukAXPGd": {}, "y7qqtUdu": {}, "nNZqCksG": {}}, "user_id": "XCd8Kanv"}], "ticket_id": "HSaKe8W4"}, {"first_ticket_created_at": 39, "party_attributes": {"NBpoRd16": {}, "oo1iNiNh": {}, "sHuv7QIQ": {}}, "party_id": "0l8y7Rqi", "party_members": [{"extra_attributes": {"B4txTG09": {}, "Q0aOSLjd": {}, "aDqmtW1p": {}}, "user_id": "uHFY1gzb"}, {"extra_attributes": {"zEg7HSMB": {}, "xZnI13r1": {}, "pLL6TCxy": {}}, "user_id": "XMOWZ9xm"}, {"extra_attributes": {"X96ca8GG": {}, "BfEpIlzG": {}, "x2qvAX4k": {}}, "user_id": "afoqr0kv"}], "ticket_id": "S7AAyNB9"}]}], "namespace": "MNJyNdtu", "party_attributes": {"A8v42zLr": {}, "JtGiHIYk": {}, "YsRGzura": {}}, "party_id": "z4ejfNXA", "queued_at": 65, "region": "bDXzptNR", "server_name": "bsXyaJzu", "status": "WoXZzKuu", "ticket_id": "POBFAK9Y", "updated_at": "1990-06-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Kmlas6Ch"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'Wku66edd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 92, "userID": "IDKJAipK", "weight": 0.0941126892386639}' \
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
    --matchIDs 'AX5456ko' \
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
    --strategy 'CsNHqT9I' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'dOpsrNjB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'oIXAeQxi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "suxxf21b", "description": "xODbzmyN", "findMatchTimeoutSeconds": 53, "joinable": false, "max_delay_ms": 37, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 45, "min": 58, "name": "ZEiJyA7o"}, {"max": 18, "min": 21, "name": "SgvkGprK"}, {"max": 80, "min": 63, "name": "XBgYWWsV"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 53, "role_flexing_second": 60}, "maxNumber": 26, "minNumber": 87, "playerMaxNumber": 86, "playerMinNumber": 38}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 56, "min": 32, "name": "7z9UsBtu"}, {"max": 86, "min": 100, "name": "VmlUjFOz"}, {"max": 83, "min": 81, "name": "rxQH9z4X"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 95, "role_flexing_second": 32}, "duration": 68, "max_number": 80, "min_number": 12, "player_max_number": 19, "player_min_number": 49}, {"combination": {"alliances": [{"max": 70, "min": 81, "name": "WHCNbKlG"}, {"max": 63, "min": 68, "name": "SPIX3jKQ"}, {"max": 5, "min": 17, "name": "ZlEprkyU"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 99, "role_flexing_second": 82}, "duration": 22, "max_number": 30, "min_number": 69, "player_max_number": 77, "player_min_number": 22}, {"combination": {"alliances": [{"max": 68, "min": 43, "name": "OBL8XlQY"}, {"max": 19, "min": 74, "name": "9Jq6xWsb"}, {"max": 14, "min": 23, "name": "t7RiC62j"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 48, "role_flexing_second": 50}, "duration": 57, "max_number": 39, "min_number": 71, "player_max_number": 32, "player_min_number": 78}], "flexingRules": [{"attribute": "RF0rr3lt", "criteria": "ch76ns44", "duration": 47, "reference": 0.30707776145145216}, {"attribute": "9LK2Vc2A", "criteria": "RhKwJ0SW", "duration": 82, "reference": 0.2672704909634598}, {"attribute": "CMGZdae3", "criteria": "jT0WOd5n", "duration": 46, "reference": 0.038331932305402217}], "match_options": {"options": [{"name": "NVur328H", "type": "6hhoWaUR"}, {"name": "pbw9NjMC", "type": "Z5ADN2A0"}, {"name": "sI8wvEhS", "type": "mxdw9na9"}]}, "matchingRules": [{"attribute": "8jXfoEB0", "criteria": "hixrHYBp", "reference": 0.071570215947373}, {"attribute": "xTAzGciG", "criteria": "cgYsG5KT", "reference": 0.8902308020147904}, {"attribute": "vEmir1MF", "criteria": "6B6m5mMY", "reference": 0.7851763644823897}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 89, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'jxjsfXjL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'kdfFPNDY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'QBz6rllR' \
    --matchID '27Sa37z3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["YVHDUekx", "bUBknBTP", "NtEfg8gz"], "party_id": "70xpuFyI", "user_id": "VHXnoLyQ"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'w8GtdOUJ' \
    --matchID 'y7Ybg3AX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'yEGb8FNi' \
    --matchID 'ltbAk1d0' \
    --namespace "$AB_NAMESPACE" \
    --userID 'GYkGGJLV' \
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
    --channelName 'aTbw4Gog' \
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