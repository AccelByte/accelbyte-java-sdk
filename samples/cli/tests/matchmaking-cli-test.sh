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
    --limit '25' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "ZFT9fhEo", "description": "HXuroD7q", "find_match_timeout_seconds": 37, "game_mode": "WaCBE0eg", "joinable": false, "max_delay_ms": 13, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 57, "min": 61, "name": "2FjTwUlg"}, {"max": 39, "min": 83, "name": "t6RT15ql"}, {"max": 72, "min": 13, "name": "Bhy1jRUa"}], "has_combination": true}, "max_number": 51, "min_number": 94, "player_max_number": 55, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 8, "min": 19, "name": "gspfYizi"}, {"max": 27, "min": 9, "name": "F7plefKv"}, {"max": 56, "min": 15, "name": "sAW9Klsz"}], "has_combination": true}, "duration": 17, "max_number": 56, "min_number": 56, "player_max_number": 91, "player_min_number": 73}, {"combination": {"alliances": [{"max": 87, "min": 54, "name": "wjwPOIgl"}, {"max": 43, "min": 95, "name": "my3xOSed"}, {"max": 63, "min": 60, "name": "KksQCcXe"}], "has_combination": false}, "duration": 46, "max_number": 45, "min_number": 54, "player_max_number": 10, "player_min_number": 38}, {"combination": {"alliances": [{"max": 83, "min": 64, "name": "DjB1m2SZ"}, {"max": 92, "min": 27, "name": "0QvQcBXO"}, {"max": 20, "min": 88, "name": "3bGDXYz4"}], "has_combination": false}, "duration": 84, "max_number": 58, "min_number": 32, "player_max_number": 66, "player_min_number": 95}], "flexing_rule": [{"attribute": "GFyIhueN", "criteria": "qYqCmP7R", "duration": 60, "reference": 0.3747287631006624}, {"attribute": "kNY2Rz4B", "criteria": "auZ1xbN4", "duration": 82, "reference": 0.8462222489522132}, {"attribute": "yVjhoS1T", "criteria": "XPdq0M0x", "duration": 96, "reference": 0.5722859422656178}], "match_options": {"options": [{"name": "R5qAOmZq", "type": "yrTLmqup"}, {"name": "JwWeMj27", "type": "Y7DasxH3"}, {"name": "UVmyFM89", "type": "Jk76FZgC"}]}, "matching_rule": [{"attribute": "74YoPTzz", "criteria": "LibmsAto", "reference": 0.1817410319710362}, {"attribute": "6XDfavbO", "criteria": "B9XswUOF", "reference": 0.694924931992508}, {"attribute": "8ocn5oMf", "criteria": "h3CQgrII", "reference": 0.3545671861999675}], "sub_game_modes": {"hY7zO1sZ": {"alliance": {"combination": {"alliances": [{"max": 43, "min": 41, "name": "tq1rapwy"}, {"max": 13, "min": 89, "name": "JvZRzI1F"}, {"max": 82, "min": 45, "name": "aUqZ6fc0"}], "has_combination": true}, "max_number": 70, "min_number": 39, "player_max_number": 2, "player_min_number": 0}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 53, "min": 46, "name": "jYSehsiu"}, {"max": 78, "min": 30, "name": "wulxm18d"}, {"max": 11, "min": 0, "name": "m3hPHS0o"}], "has_combination": true}, "duration": 66, "max_number": 89, "min_number": 76, "player_max_number": 29, "player_min_number": 98}, {"combination": {"alliances": [{"max": 22, "min": 48, "name": "VybXzwNx"}, {"max": 4, "min": 55, "name": "WSP3Pwsl"}, {"max": 74, "min": 1, "name": "9TCqGDTX"}], "has_combination": true}, "duration": 54, "max_number": 14, "min_number": 51, "player_max_number": 11, "player_min_number": 27}, {"combination": {"alliances": [{"max": 48, "min": 30, "name": "llsznXH9"}, {"max": 26, "min": 47, "name": "F5K1Amuf"}, {"max": 22, "min": 35, "name": "Qp3akWQG"}], "has_combination": true}, "duration": 92, "max_number": 27, "min_number": 46, "player_max_number": 1, "player_min_number": 61}], "name": "CPDPQbeO"}, "bMx4wXFc": {"alliance": {"combination": {"alliances": [{"max": 10, "min": 44, "name": "j4vA8n3H"}, {"max": 75, "min": 2, "name": "F1tdkRRn"}, {"max": 43, "min": 47, "name": "QoP8Q6cL"}], "has_combination": false}, "max_number": 9, "min_number": 16, "player_max_number": 13, "player_min_number": 68}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 84, "min": 24, "name": "8W0VvkY7"}, {"max": 49, "min": 50, "name": "D8vDYqBl"}, {"max": 72, "min": 84, "name": "6u1WOPC2"}], "has_combination": false}, "duration": 14, "max_number": 44, "min_number": 3, "player_max_number": 51, "player_min_number": 87}, {"combination": {"alliances": [{"max": 76, "min": 77, "name": "LnSP24c0"}, {"max": 34, "min": 79, "name": "UiE6MjU1"}, {"max": 89, "min": 0, "name": "zcCqTM6g"}], "has_combination": false}, "duration": 77, "max_number": 3, "min_number": 55, "player_max_number": 43, "player_min_number": 81}, {"combination": {"alliances": [{"max": 21, "min": 55, "name": "tcmdhUtl"}, {"max": 28, "min": 38, "name": "lwo3qXvJ"}, {"max": 12, "min": 53, "name": "utLzKxkq"}], "has_combination": true}, "duration": 63, "max_number": 82, "min_number": 95, "player_max_number": 65, "player_min_number": 60}], "name": "4eBaDLQQ"}, "Pfepzsba": {"alliance": {"combination": {"alliances": [{"max": 20, "min": 73, "name": "zPXoYxJX"}, {"max": 42, "min": 32, "name": "QawrrbBa"}, {"max": 4, "min": 28, "name": "4wYqSyds"}], "has_combination": false}, "max_number": 81, "min_number": 11, "player_max_number": 86, "player_min_number": 91}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 60, "min": 98, "name": "O3qdNm1r"}, {"max": 55, "min": 70, "name": "zYr2MHSl"}, {"max": 10, "min": 64, "name": "Nc4umylI"}], "has_combination": true}, "duration": 4, "max_number": 36, "min_number": 86, "player_max_number": 91, "player_min_number": 37}, {"combination": {"alliances": [{"max": 55, "min": 95, "name": "PcdRnvGD"}, {"max": 6, "min": 88, "name": "PbCLCSeV"}, {"max": 17, "min": 56, "name": "kAbyISTM"}], "has_combination": false}, "duration": 16, "max_number": 34, "min_number": 40, "player_max_number": 5, "player_min_number": 70}, {"combination": {"alliances": [{"max": 59, "min": 93, "name": "WNVQMaax"}, {"max": 45, "min": 29, "name": "nSDCRVhw"}, {"max": 54, "min": 72, "name": "EmHytecg"}], "has_combination": false}, "duration": 75, "max_number": 5, "min_number": 64, "player_max_number": 38, "player_min_number": 87}], "name": "FWZb2Rt6"}}}, "session_queue_timeout_seconds": 29, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'TxzuN4O9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "JPfJhw9B", "players": [{"results": [{"attribute": "d3ALAbsN", "value": 0.35848971878317004}, {"attribute": "GnikJEiL", "value": 0.07256206343372407}, {"attribute": "nw23Pvy6", "value": 0.5706988084201168}], "user_id": "H9q7YKFE"}, {"results": [{"attribute": "rGncAOA3", "value": 0.09818771263553427}, {"attribute": "nwq4Lfee", "value": 0.5830460438933684}, {"attribute": "q3gWuBQj", "value": 0.04893829805602945}], "user_id": "PmAFEHD9"}, {"results": [{"attribute": "ATKJi0PF", "value": 0.43942607913540965}, {"attribute": "wGUGFrFO", "value": 0.5594557866982659}, {"attribute": "U2QJrjek", "value": 0.2708067683903316}], "user_id": "OBhFcO29"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "a4HYcQ7x"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "GnT1pBkq", "client_version": "nbnzvC2N", "deployment": "2atwhNl5", "game_mode": "V6XRREid", "joinable": true, "match_id": "lwFyLhSY", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 61, "party_attributes": {"WBbW8flz": {}, "bM5OCW67": {}, "HLODEjuD": {}}, "party_id": "3TLQDRZ1", "party_members": [{"extra_attributes": {"4W4A3m5o": {}, "B7Af2xiF": {}, "pQLXAv5C": {}}, "user_id": "66qFas2Y"}, {"extra_attributes": {"o3DEDSpJ": {}, "S5nHPErt": {}, "6LMkPNtu": {}}, "user_id": "3AnylgUa"}, {"extra_attributes": {"rSwLN38X": {}, "h5Go7MPS": {}, "p6FO0E0u": {}}, "user_id": "K4LKMenU"}]}, {"first_ticket_created_at": 61, "party_attributes": {"YZu9NgMW": {}, "vibQh13j": {}, "CNVBghgN": {}}, "party_id": "3rZjKaos", "party_members": [{"extra_attributes": {"SaAXvyvq": {}, "bYbUxwlR": {}, "tXkScZu7": {}}, "user_id": "b36sd2oV"}, {"extra_attributes": {"aVMZx2pU": {}, "qL1XGoud": {}, "5QeJ8nZf": {}}, "user_id": "7oeem5yM"}, {"extra_attributes": {"HJKD8mGr": {}, "Mzczmi9r": {}, "mDQvb5BA": {}}, "user_id": "evjYdMDg"}]}, {"first_ticket_created_at": 70, "party_attributes": {"wPm7plM0": {}, "nIL3B8bW": {}, "M2CuMsUZ": {}}, "party_id": "3ABhYk6o", "party_members": [{"extra_attributes": {"YNQiKfvF": {}, "GnsSJC8K": {}, "ZlD4FSBf": {}}, "user_id": "wrSEy0Zg"}, {"extra_attributes": {"HppNoYz7": {}, "QeBbi4Cu": {}, "iftgCLbQ": {}}, "user_id": "xziEgqYO"}, {"extra_attributes": {"0D1LAveK": {}, "2cZANRsC": {}, "cQ70Gyul": {}}, "user_id": "nkKIUQxV"}]}]}, {"matching_parties": [{"first_ticket_created_at": 41, "party_attributes": {"B3Tfo8Cs": {}, "bxAm3yNZ": {}, "fPqbZ3P9": {}}, "party_id": "pslxdumH", "party_members": [{"extra_attributes": {"u1RAPqiC": {}, "WeQyEeBy": {}, "751LqVKX": {}}, "user_id": "qsqSSRda"}, {"extra_attributes": {"QPRIRuju": {}, "G3rQf8d5": {}, "VMnDGw0p": {}}, "user_id": "COI92PyY"}, {"extra_attributes": {"QFJQBKDk": {}, "EtnF51Co": {}, "aCimcGp3": {}}, "user_id": "MsVW6kjo"}]}, {"first_ticket_created_at": 17, "party_attributes": {"EylJvzZ2": {}, "f6Z3G3cP": {}, "XRoxXzrN": {}}, "party_id": "XJINdmsB", "party_members": [{"extra_attributes": {"fobYz6fV": {}, "VDHflb6M": {}, "IQQtT4kz": {}}, "user_id": "xsVB51do"}, {"extra_attributes": {"eSGf6j7t": {}, "MLkCtLg9": {}, "87bw8VPD": {}}, "user_id": "NTA5VYWx"}, {"extra_attributes": {"UFHQFK2h": {}, "c5ZuzOs2": {}, "ij4l9qSb": {}}, "user_id": "Kx05Jhpn"}]}, {"first_ticket_created_at": 41, "party_attributes": {"XScvLlmU": {}, "t3KvRrpY": {}, "OLk9TTtt": {}}, "party_id": "JyF9Xv8J", "party_members": [{"extra_attributes": {"NTBnl7Sq": {}, "saBZIRZB": {}, "TSWKGc4r": {}}, "user_id": "B0Mia5O0"}, {"extra_attributes": {"CVoWzGg3": {}, "IH2d47TE": {}, "j0HYFoe5": {}}, "user_id": "YvHtqKPu"}, {"extra_attributes": {"wGSBfPzp": {}, "CE8LD4mh": {}, "OMsocZ7F": {}}, "user_id": "0xVqpfs1"}]}]}, {"matching_parties": [{"first_ticket_created_at": 84, "party_attributes": {"BgF3bvea": {}, "xDMJpUlz": {}, "iudgFBdi": {}}, "party_id": "PQd95Hcz", "party_members": [{"extra_attributes": {"EZjmWjuM": {}, "LdPpWO14": {}, "VvO4ohZw": {}}, "user_id": "NFYtVMdJ"}, {"extra_attributes": {"gnBMOSv2": {}, "1Zw3BHQ9": {}, "FAOycv3G": {}}, "user_id": "fr5MT5Ie"}, {"extra_attributes": {"w0jB12t1": {}, "xVGNctZg": {}, "DPG3vKWW": {}}, "user_id": "zGLErRmz"}]}, {"first_ticket_created_at": 53, "party_attributes": {"FqLP0Oc1": {}, "cQTDIxk0": {}, "8dMmKfuH": {}}, "party_id": "Zi64zN8N", "party_members": [{"extra_attributes": {"f5Z5U8ev": {}, "GDc5LcIY": {}, "blEUfwwH": {}}, "user_id": "dhHoMQhQ"}, {"extra_attributes": {"vpEzQKBJ": {}, "KW8V8m63": {}, "1jIMyfV6": {}}, "user_id": "YB3u9LUN"}, {"extra_attributes": {"TQb4sg93": {}, "JUdLNHOD": {}, "a2JCtFuV": {}}, "user_id": "4DiU3P9x"}]}, {"first_ticket_created_at": 40, "party_attributes": {"TJ0Pf0BR": {}, "sSrSK1I1": {}, "fLKVjYFj": {}}, "party_id": "0uuYsI5X", "party_members": [{"extra_attributes": {"nRctBI7o": {}, "yW5Im86c": {}, "XgKGKdyR": {}}, "user_id": "d72cjHJ7"}, {"extra_attributes": {"lcmBtnxl": {}, "CiQz1pyJ": {}, "ZXAWkiQ4": {}}, "user_id": "8oqg3QrA"}, {"extra_attributes": {"7I1VkqgB": {}, "RfUCuOY1": {}, "k3DYuRHo": {}}, "user_id": "I9LFxZGo"}]}]}], "namespace": "NA3xioSG", "party_attributes": {"ZVsCDbgb": {}, "AnbYceUK": {}, "MXKbERdm": {}}, "party_id": "TYHa1xrF", "queued_at": 57, "region": "mSh7m4tr", "server_name": "MmFKFYq5", "status": "INynJ9qM", "updated_at": "1976-03-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "WUxRnWZu"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'quTKL8u1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 54, "userID": "2Y7gejLF", "weight": 0.8349452923906306}' \
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
    --matchIDs 'wRVZqaeW' \
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
    --strategy 'hr0eVVp3' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'vR8DtO3j' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '19KvSs6f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "3tlAvu7q", "description": "gkNIZRTB", "findMatchTimeoutSeconds": 39, "joinable": false, "max_delay_ms": 65, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 94, "min": 78, "name": "Yt4CiIqP"}, {"max": 19, "min": 38, "name": "kKAAlS8m"}, {"max": 25, "min": 74, "name": "GVBKWGBF"}], "has_combination": true}, "maxNumber": 6, "minNumber": 44, "playerMaxNumber": 33, "playerMinNumber": 53}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 98, "min": 69, "name": "z11pRnUC"}, {"max": 18, "min": 85, "name": "vQeylK67"}, {"max": 67, "min": 11, "name": "bMLRWsh9"}], "has_combination": true}, "duration": 0, "max_number": 17, "min_number": 60, "player_max_number": 40, "player_min_number": 19}, {"combination": {"alliances": [{"max": 25, "min": 41, "name": "emVyf2fh"}, {"max": 83, "min": 28, "name": "VNveMqXb"}, {"max": 11, "min": 65, "name": "4BAAqeYA"}], "has_combination": true}, "duration": 75, "max_number": 75, "min_number": 52, "player_max_number": 52, "player_min_number": 28}, {"combination": {"alliances": [{"max": 10, "min": 52, "name": "9HLjwbLV"}, {"max": 63, "min": 49, "name": "J172owik"}, {"max": 7, "min": 68, "name": "nSd9kdph"}], "has_combination": false}, "duration": 67, "max_number": 14, "min_number": 95, "player_max_number": 58, "player_min_number": 99}], "flexingRules": [{"attribute": "PXShs3F3", "criteria": "ItFAgifa", "duration": 92, "reference": 0.40568733601928986}, {"attribute": "RnQ5bvIj", "criteria": "cZOPOVSC", "duration": 1, "reference": 0.7279347432772988}, {"attribute": "aqFYtPDx", "criteria": "J9dGcYGZ", "duration": 54, "reference": 0.31549549725221093}], "match_options": {"options": [{"name": "xNrcFJWn", "type": "sP2L24JA"}, {"name": "azbUv23j", "type": "FY4Mgg7A"}, {"name": "4Jf1Ihme", "type": "zDB1CHTY"}]}, "matchingRules": [{"attribute": "fn2piigj", "criteria": "6jrH7VQL", "reference": 0.5988689072437687}, {"attribute": "gHRatG9T", "criteria": "QZZFrIci", "reference": 0.441444918478343}, {"attribute": "llfSB0Qm", "criteria": "eWMUuBST", "reference": 0.6795445196410835}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 75, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName '3N8znVQ1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'SSIPBYfI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'EZ5GDnN6' \
    --matchID 'aTDCg3VP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["L0x8qTk0", "WTGnfcHO", "w4DlcIkz"], "party_id": "6CXWfp1x", "user_id": "nQ6ap3Zr"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'DwIiZiCU' \
    --matchID 'nIb8hsth' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'is6ffJ3O' \
    --matchID 'SD8Jfmdw' \
    --namespace "$AB_NAMESPACE" \
    --userID '3l6NLQr8' \
    > test.out 2>&1
eval_tap $? 23 'DeleteUserFromSessionInChannel' test.out

#- 24 SearchSessions
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessions \
    --namespace "$AB_NAMESPACE" \
    --channel 'nzGCp78L' \
    --deleted  \
    --matchID 'weI7D6tk' \
    --partyID 'PbtxUbyt' \
    --userID 'ahUcSQqo' \
    --limit '91' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 24 'SearchSessions' test.out

#- 25 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main matchmaking getSessionHistoryDetailed \
    --matchID 'NjUUnBI8' \
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
    --channelName '481fJ9dv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetSingleMatchmakingChannel' test.out

#- 29 SearchSessionsV2
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'aUoJyo7U' \
    --deleted  \
    --matchID '3V122Kd4' \
    --partyID 'ryKwzeGL' \
    --userID 'J7d21XRT' \
    --limit '35' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 29 'SearchSessionsV2' test.out

#- 30 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 30 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE