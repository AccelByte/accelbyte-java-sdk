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
    --limit '81' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "pAUjE4xp", "description": "B0Yn73RU", "find_match_timeout_seconds": 77, "game_mode": "65v5VBGL", "joinable": true, "max_delay_ms": 83, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 74, "min": 23, "name": "BAyZpWcA"}, {"max": 37, "min": 30, "name": "2usKZQcZ"}, {"max": 8, "min": 28, "name": "MkOfLyzH"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 70, "role_flexing_second": 81}, "max_number": 54, "min_number": 100, "player_max_number": 30, "player_min_number": 65}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 42, "min": 88, "name": "YChUdoV8"}, {"max": 28, "min": 64, "name": "l9cyxMdz"}, {"max": 22, "min": 82, "name": "ODi9qjwu"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 24}, "duration": 16, "max_number": 44, "min_number": 88, "player_max_number": 31, "player_min_number": 86}, {"combination": {"alliances": [{"max": 78, "min": 84, "name": "336g7xjS"}, {"max": 72, "min": 66, "name": "IvyzY8Tb"}, {"max": 3, "min": 58, "name": "zuYEomJv"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 81, "role_flexing_second": 65}, "duration": 53, "max_number": 52, "min_number": 93, "player_max_number": 55, "player_min_number": 35}, {"combination": {"alliances": [{"max": 97, "min": 57, "name": "auXjp8ZQ"}, {"max": 3, "min": 48, "name": "kRx9uvy2"}, {"max": 33, "min": 68, "name": "3JqACn9j"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 70, "role_flexing_second": 3}, "duration": 36, "max_number": 68, "min_number": 40, "player_max_number": 35, "player_min_number": 50}], "flexing_rule": [{"attribute": "iXguVZu4", "criteria": "Cze6nxm5", "duration": 15, "reference": 0.9761476185121273}, {"attribute": "21BiU6Na", "criteria": "i4NkbCV0", "duration": 46, "reference": 0.42659736627400313}, {"attribute": "2bJXdbi2", "criteria": "iru68Dl7", "duration": 50, "reference": 0.07065345126766742}], "match_options": {"options": [{"name": "3RTttp8B", "type": "hl1PaGcK"}, {"name": "j0JaUAp1", "type": "mconkv5a"}, {"name": "ojOmCaN1", "type": "83Ao1CDb"}]}, "matching_rule": [{"attribute": "cp8dsTWF", "criteria": "RiIZ0MJ8", "reference": 0.537824206761488}, {"attribute": "28875VJA", "criteria": "UdnLJxx1", "reference": 0.8678129601010051}, {"attribute": "RHWtxra1", "criteria": "cAufOLNH", "reference": 0.5355414471118739}], "sub_game_modes": {"3km3SrEn": {"alliance": {"combination": {"alliances": [{"max": 22, "min": 17, "name": "1VCpk1Vx"}, {"max": 69, "min": 4, "name": "lXH0l8V8"}, {"max": 41, "min": 11, "name": "Q7RjGiYm"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 69, "role_flexing_second": 31}, "max_number": 37, "min_number": 44, "player_max_number": 33, "player_min_number": 39}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 88, "min": 59, "name": "kKctHb2H"}, {"max": 48, "min": 95, "name": "9bt8WpQG"}, {"max": 14, "min": 19, "name": "41EpillY"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 28, "role_flexing_second": 11}, "duration": 76, "max_number": 57, "min_number": 55, "player_max_number": 22, "player_min_number": 79}, {"combination": {"alliances": [{"max": 45, "min": 25, "name": "AwOIAZct"}, {"max": 62, "min": 60, "name": "ABA3txcy"}, {"max": 0, "min": 11, "name": "eCLbi69I"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 66, "role_flexing_second": 77}, "duration": 2, "max_number": 97, "min_number": 67, "player_max_number": 100, "player_min_number": 37}, {"combination": {"alliances": [{"max": 59, "min": 81, "name": "alGK2zzb"}, {"max": 7, "min": 70, "name": "yYnhakWS"}, {"max": 27, "min": 55, "name": "2wxIUgi5"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 88, "role_flexing_second": 52}, "duration": 46, "max_number": 82, "min_number": 71, "player_max_number": 62, "player_min_number": 88}], "name": "QAIQTqCj"}, "tlEHR8Ow": {"alliance": {"combination": {"alliances": [{"max": 4, "min": 73, "name": "m4naA9dr"}, {"max": 61, "min": 2, "name": "kTbWMQrc"}, {"max": 50, "min": 14, "name": "xnbRkuoN"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 51, "role_flexing_second": 68}, "max_number": 44, "min_number": 15, "player_max_number": 1, "player_min_number": 79}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 1, "min": 92, "name": "4gTmeE0A"}, {"max": 88, "min": 89, "name": "H9jmSmCs"}, {"max": 44, "min": 0, "name": "p9xhQezX"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 29, "role_flexing_second": 94}, "duration": 29, "max_number": 25, "min_number": 90, "player_max_number": 10, "player_min_number": 88}, {"combination": {"alliances": [{"max": 18, "min": 70, "name": "PfUmhtII"}, {"max": 78, "min": 12, "name": "GDm0CnvA"}, {"max": 94, "min": 33, "name": "qMSEdJAW"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 77, "role_flexing_second": 24}, "duration": 92, "max_number": 33, "min_number": 12, "player_max_number": 70, "player_min_number": 54}, {"combination": {"alliances": [{"max": 45, "min": 80, "name": "gwXojJyW"}, {"max": 16, "min": 41, "name": "81UJAmGe"}, {"max": 46, "min": 60, "name": "xMrrcEf9"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 26, "role_flexing_second": 97}, "duration": 61, "max_number": 10, "min_number": 47, "player_max_number": 8, "player_min_number": 70}], "name": "3LecdBOy"}, "btUOOUXm": {"alliance": {"combination": {"alliances": [{"max": 45, "min": 22, "name": "eaubQhM9"}, {"max": 65, "min": 68, "name": "YqcNKxQY"}, {"max": 71, "min": 9, "name": "OCMW4b5y"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 89, "role_flexing_second": 78}, "max_number": 3, "min_number": 39, "player_max_number": 41, "player_min_number": 12}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 42, "min": 5, "name": "SwviteDp"}, {"max": 15, "min": 80, "name": "L6MYOLs6"}, {"max": 17, "min": 89, "name": "EqIrPDFJ"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 84, "role_flexing_second": 94}, "duration": 32, "max_number": 38, "min_number": 47, "player_max_number": 58, "player_min_number": 80}, {"combination": {"alliances": [{"max": 63, "min": 7, "name": "DUaDAidy"}, {"max": 31, "min": 92, "name": "SxiD2AYc"}, {"max": 38, "min": 25, "name": "0Jpt6FAi"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 33, "role_flexing_second": 84}, "duration": 20, "max_number": 74, "min_number": 3, "player_max_number": 50, "player_min_number": 46}, {"combination": {"alliances": [{"max": 79, "min": 35, "name": "KP6hfziR"}, {"max": 64, "min": 11, "name": "hBnPv6uW"}, {"max": 20, "min": 34, "name": "QBgHM28U"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 97, "role_flexing_second": 40}, "duration": 35, "max_number": 53, "min_number": 84, "player_max_number": 55, "player_min_number": 49}], "name": "9qLFIQYG"}}}, "session_queue_timeout_seconds": 64, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel '1YVjm8Hq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Bx6GiOIk", "players": [{"results": [{"attribute": "rue6kCXG", "value": 0.2528200644182318}, {"attribute": "b8OXgDv6", "value": 0.15475856998363735}, {"attribute": "R7oftkKo", "value": 0.21882708763224334}], "user_id": "ZGJcMOkS"}, {"results": [{"attribute": "RLIOXSoe", "value": 0.49836236545168733}, {"attribute": "TepmdHOx", "value": 0.16599365729901783}, {"attribute": "U7TA3Bdx", "value": 0.34744911369338605}], "user_id": "ZrNtfccg"}, {"results": [{"attribute": "tUrqLJZH", "value": 0.7910969317475973}, {"attribute": "j76kgVBf", "value": 0.12173803037681363}, {"attribute": "UEgl8muK", "value": 0.5918856700573121}], "user_id": "gV1jsMl0"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "nuJync6k"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "7dJ1J0SL", "client_version": "Qr1NnndQ", "deployment": "1sNVL9Sr", "game_mode": "zr45J0S0", "joinable": true, "match_id": "AEXyolcY", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 49, "party_attributes": {"YbdICscp": {}, "Ko9ZdHQ4": {}, "76d3H1fm": {}}, "party_id": "NOT2rIGO", "party_members": [{"extra_attributes": {"SCO8MqFE": {}, "FEMd6TsT": {}, "XOlVxbJt": {}}, "user_id": "govauF4Y"}, {"extra_attributes": {"5mcCWLus": {}, "2oWo210R": {}, "2OjZEvdu": {}}, "user_id": "oNmjRoyV"}, {"extra_attributes": {"vADf6wMH": {}, "QSlbsK83": {}, "v6IlAgYE": {}}, "user_id": "Kx2t2Swj"}], "ticket_id": "Dw7TpRiB"}, {"first_ticket_created_at": 50, "party_attributes": {"Br7EuPPZ": {}, "YvVXEFs1": {}, "cxP59NEv": {}}, "party_id": "ZzvmWRQg", "party_members": [{"extra_attributes": {"EsWHt9FE": {}, "vS8eClR2": {}, "pbUK2v5w": {}}, "user_id": "u6KJ4I1I"}, {"extra_attributes": {"awoTXaxh": {}, "MjwYhjXH": {}, "fRmbz7D3": {}}, "user_id": "WvSmaIuv"}, {"extra_attributes": {"BCGnk0JR": {}, "UcxKf1vK": {}, "G0zA4IFE": {}}, "user_id": "kvFUrwgr"}], "ticket_id": "C6Z9GsaR"}, {"first_ticket_created_at": 10, "party_attributes": {"Tn4KC4Py": {}, "JitAQbB9": {}, "yvGCX7gu": {}}, "party_id": "OxZAwhHG", "party_members": [{"extra_attributes": {"uOdQ3vzU": {}, "fCajK9Qo": {}, "mlaWQLqM": {}}, "user_id": "xm83RCCR"}, {"extra_attributes": {"yUBseewG": {}, "oElWgb6l": {}, "ZMCCGBXi": {}}, "user_id": "JBz0cUdb"}, {"extra_attributes": {"l36h9QpF": {}, "Tniy2MDI": {}, "IFonTK9M": {}}, "user_id": "2CQHoWnA"}], "ticket_id": "Q1MeU1DV"}]}, {"matching_parties": [{"first_ticket_created_at": 40, "party_attributes": {"yhAHrfpp": {}, "0lRbC4Y5": {}, "YkFKPaYP": {}}, "party_id": "JbQvRzv7", "party_members": [{"extra_attributes": {"5oD7zsaw": {}, "xftR74mq": {}, "gHwxWmwt": {}}, "user_id": "d536ySE2"}, {"extra_attributes": {"uUm94gmr": {}, "RBLBVDVP": {}, "nDFANYsA": {}}, "user_id": "pJy0VRQ7"}, {"extra_attributes": {"9z6kATjW": {}, "uVFKcSOF": {}, "QrGbABzA": {}}, "user_id": "Gmv7osGm"}], "ticket_id": "19nzRZZW"}, {"first_ticket_created_at": 98, "party_attributes": {"jBDL21Hs": {}, "pLlg0eN0": {}, "2wPg4B7v": {}}, "party_id": "Gdk7VUWA", "party_members": [{"extra_attributes": {"mzNUyLVx": {}, "UAd92iNj": {}, "9hBMTuDC": {}}, "user_id": "iAj9S6g3"}, {"extra_attributes": {"QqX3Wvnl": {}, "PAtleoKb": {}, "3tA1Mn3Z": {}}, "user_id": "4FXgdrQY"}, {"extra_attributes": {"WULIBIn5": {}, "38pkghUW": {}, "5oOQgnIx": {}}, "user_id": "7nZHfioC"}], "ticket_id": "ZM0ANuhm"}, {"first_ticket_created_at": 45, "party_attributes": {"Bv7D3SjE": {}, "Zw9W5bD7": {}, "jKg7m2em": {}}, "party_id": "ky3Uh8hZ", "party_members": [{"extra_attributes": {"xPfWFxPX": {}, "hnH6PsKT": {}, "Zw6Jzmo5": {}}, "user_id": "71OtBMOb"}, {"extra_attributes": {"EAdQCR5z": {}, "EVIe4tPs": {}, "uUkt1Pib": {}}, "user_id": "pD3YjRk4"}, {"extra_attributes": {"bhGmbe8l": {}, "TzmWOM66": {}, "Q3XXYeL2": {}}, "user_id": "MpiH0qnn"}], "ticket_id": "WzWWJL0D"}]}, {"matching_parties": [{"first_ticket_created_at": 47, "party_attributes": {"udNcguRJ": {}, "48Z7n8lk": {}, "qJQufHj2": {}}, "party_id": "PF0Mde88", "party_members": [{"extra_attributes": {"dpVPfQj5": {}, "VdrCBxX1": {}, "GAhaB06l": {}}, "user_id": "O97WAoiI"}, {"extra_attributes": {"bpcfSzNb": {}, "MG4Qbu4v": {}, "0cNefH1F": {}}, "user_id": "ExcMKse5"}, {"extra_attributes": {"LJGvM5Er": {}, "Q8MR0KxQ": {}, "LEW8SDHk": {}}, "user_id": "QZ7d0IBN"}], "ticket_id": "oGDu3TxE"}, {"first_ticket_created_at": 61, "party_attributes": {"6CmgwI3g": {}, "XfIu8ecv": {}, "YTWHEpaM": {}}, "party_id": "G8UDmfeS", "party_members": [{"extra_attributes": {"fyjIRHrc": {}, "QTHWAU5F": {}, "TA45MKL7": {}}, "user_id": "eiTinsOU"}, {"extra_attributes": {"rhjE0eKO": {}, "eKNrFvHF": {}, "tyQ8BPfn": {}}, "user_id": "NYgJHYbE"}, {"extra_attributes": {"LX4RfyVi": {}, "Nwsu1W8g": {}, "G0GEd3Sn": {}}, "user_id": "kd0lZm6R"}], "ticket_id": "5tDiKWaP"}, {"first_ticket_created_at": 34, "party_attributes": {"rjftN9nj": {}, "omi9LCus": {}, "LG7Oemr4": {}}, "party_id": "aze1nOgR", "party_members": [{"extra_attributes": {"4brNfcta": {}, "EalzNHaA": {}, "5j21Se0N": {}}, "user_id": "i9IcMWD8"}, {"extra_attributes": {"kuzbTe0H": {}, "V2w90Xe2": {}, "Huv8YBWy": {}}, "user_id": "M4YHoLUN"}, {"extra_attributes": {"PCCeg8Vn": {}, "ygu6LeHd": {}, "kdPsKBBu": {}}, "user_id": "CmZ2R6XR"}], "ticket_id": "hnRdUdsg"}]}], "namespace": "WfImU69i", "party_attributes": {"KvmiMtAi": {}, "Mv4SUbBw": {}, "mBmNIyV7": {}}, "party_id": "VswccNb6", "queued_at": 10, "region": "Qehan03g", "server_name": "bjgI5xOG", "status": "81bzYGEj", "ticket_id": "QakOBSCP", "updated_at": "1990-08-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "e9lz40xk"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'Em8W1O7A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 56, "userID": "RVGCG7eV", "weight": 0.715152680052792}' \
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
    --matchIDs 'eUBZlPpY' \
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
    --strategy 'NcwVgb69' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'OFKf4eNz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'NwOcA1In' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "PuJN9Gnu", "description": "Ed8AKVVA", "findMatchTimeoutSeconds": 19, "joinable": false, "max_delay_ms": 54, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 76, "min": 7, "name": "ocJeYGkM"}, {"max": 95, "min": 98, "name": "MUNWy33F"}, {"max": 72, "min": 95, "name": "jB853loF"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 60, "role_flexing_second": 43}, "maxNumber": 2, "minNumber": 91, "playerMaxNumber": 61, "playerMinNumber": 78}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 0, "min": 96, "name": "tRgmJs0o"}, {"max": 17, "min": 13, "name": "idtemsYQ"}, {"max": 66, "min": 65, "name": "H1BJOvPF"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 36, "role_flexing_second": 46}, "duration": 69, "max_number": 57, "min_number": 29, "player_max_number": 4, "player_min_number": 52}, {"combination": {"alliances": [{"max": 85, "min": 7, "name": "rZ2QAVOG"}, {"max": 25, "min": 30, "name": "UDwlmCwW"}, {"max": 87, "min": 37, "name": "xwFAIU2l"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 20, "role_flexing_second": 44}, "duration": 18, "max_number": 78, "min_number": 55, "player_max_number": 43, "player_min_number": 63}, {"combination": {"alliances": [{"max": 98, "min": 95, "name": "QlIFhBHK"}, {"max": 16, "min": 19, "name": "grgtlCvi"}, {"max": 43, "min": 21, "name": "9mGzkpYY"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 28, "role_flexing_second": 31}, "duration": 24, "max_number": 74, "min_number": 23, "player_max_number": 23, "player_min_number": 19}], "flexingRules": [{"attribute": "cCEVfC6t", "criteria": "y1F4To7T", "duration": 39, "reference": 0.2238698700320889}, {"attribute": "syh4AmlO", "criteria": "QnVig133", "duration": 86, "reference": 0.6351974530108639}, {"attribute": "cpvbSkrb", "criteria": "Eipdkmr5", "duration": 73, "reference": 0.8661965045111311}], "match_options": {"options": [{"name": "n9iqwrIh", "type": "UU7ZBci0"}, {"name": "nQ2YFPNp", "type": "QEjwBF5D"}, {"name": "eUr08eB8", "type": "sn8iSAHM"}]}, "matchingRules": [{"attribute": "xh7ges3D", "criteria": "2Um0h2xg", "reference": 0.13333232865168054}, {"attribute": "dou2zQPo", "criteria": "xKnTz9MY", "reference": 0.1272468370823454}, {"attribute": "MyVD1aAk", "criteria": "HjZBQPJR", "reference": 0.9559188124801243}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 41, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName '0xZBiUnV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '6ozYMIBL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'iNbvqPZm' \
    --matchID '1cdlDl85' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["qLKaykid", "C8dBBNg5", "c3mS12Vb"], "party_id": "miPI3Kqt", "user_id": "djnm7R5j"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'aK0GZZVE' \
    --matchID 'bC3munEY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'v7KhWivp' \
    --matchID 'VgdsrqZ7' \
    --namespace "$AB_NAMESPACE" \
    --userID 'RReOZ3CB' \
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
    --channelName 'QzpQHd9j' \
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