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
    --limit '97' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "MyzUZnGb", "description": "2oojOa2h", "find_match_timeout_seconds": 5, "game_mode": "UeIyIlpN", "joinable": false, "max_delay_ms": 1, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 12, "min": 65, "name": "yrgvqSf5"}, {"max": 75, "min": 27, "name": "LOfAOKwr"}, {"max": 28, "min": 83, "name": "TyvyWLc9"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 4, "role_flexing_second": 20}, "max_number": 2, "min_number": 90, "player_max_number": 69, "player_min_number": 28}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 83, "min": 10, "name": "xjdy6PYC"}, {"max": 9, "min": 41, "name": "2TgVckDE"}, {"max": 19, "min": 2, "name": "uZe0B4kX"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 46, "role_flexing_second": 55}, "duration": 77, "max_number": 70, "min_number": 7, "player_max_number": 90, "player_min_number": 12}, {"combination": {"alliances": [{"max": 51, "min": 92, "name": "fSdPZ6Ol"}, {"max": 4, "min": 48, "name": "RmqnmSB4"}, {"max": 20, "min": 29, "name": "UipEt2Dz"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 27, "role_flexing_second": 37}, "duration": 89, "max_number": 31, "min_number": 40, "player_max_number": 26, "player_min_number": 83}, {"combination": {"alliances": [{"max": 45, "min": 79, "name": "MaeAqFLb"}, {"max": 90, "min": 17, "name": "c06bCHQQ"}, {"max": 43, "min": 60, "name": "NNrXRGJ1"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 83, "role_flexing_second": 5}, "duration": 9, "max_number": 35, "min_number": 30, "player_max_number": 62, "player_min_number": 87}], "flexing_rule": [{"attribute": "odOF6XwV", "criteria": "GjvjVVWO", "duration": 17, "reference": 0.4399446402157361}, {"attribute": "DS7vgsLx", "criteria": "iOCYX8xm", "duration": 10, "reference": 0.913052883849984}, {"attribute": "sFUTTl3k", "criteria": "hBbwrOLT", "duration": 7, "reference": 0.636917576039574}], "match_options": {"options": [{"name": "CPJRnJMu", "type": "ocsIFKN5"}, {"name": "d19cywLc", "type": "Gr8ThZF1"}, {"name": "W9ijthFs", "type": "YgeLE2VO"}]}, "matching_rule": [{"attribute": "vPgM688u", "criteria": "QUHWfcVQ", "reference": 0.9152521145066602}, {"attribute": "mrso5w9l", "criteria": "6a5iWXG6", "reference": 0.33895534742756206}, {"attribute": "KdiH6FFo", "criteria": "XDPsslBi", "reference": 0.09488944007445366}], "rebalance_enable": false, "sub_game_modes": {"TsryazeS": {"alliance": {"combination": {"alliances": [{"max": 73, "min": 59, "name": "Mn3D6DYE"}, {"max": 27, "min": 72, "name": "TSvfK4KS"}, {"max": 62, "min": 65, "name": "p1JSfXEP"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 46}, "max_number": 28, "min_number": 28, "player_max_number": 11, "player_min_number": 7}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 34, "min": 42, "name": "tRp2EL4S"}, {"max": 19, "min": 1, "name": "hU4vWruj"}, {"max": 35, "min": 53, "name": "TVUxClUs"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 24, "role_flexing_second": 76}, "duration": 82, "max_number": 89, "min_number": 34, "player_max_number": 93, "player_min_number": 0}, {"combination": {"alliances": [{"max": 89, "min": 25, "name": "T8hS2GKZ"}, {"max": 50, "min": 9, "name": "lGIhDbAF"}, {"max": 24, "min": 30, "name": "wi1xcC2C"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 94, "role_flexing_second": 7}, "duration": 10, "max_number": 88, "min_number": 85, "player_max_number": 63, "player_min_number": 100}, {"combination": {"alliances": [{"max": 59, "min": 49, "name": "syiAkoqk"}, {"max": 2, "min": 83, "name": "Ar0jwxjH"}, {"max": 81, "min": 65, "name": "lYHgxsLz"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 71, "role_flexing_second": 53}, "duration": 66, "max_number": 1, "min_number": 5, "player_max_number": 65, "player_min_number": 58}], "name": "KZSSnKyk"}, "KG129LGY": {"alliance": {"combination": {"alliances": [{"max": 5, "min": 69, "name": "lJ5y6qRF"}, {"max": 17, "min": 21, "name": "8hfOIOKW"}, {"max": 75, "min": 90, "name": "qUCHhncF"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 69, "role_flexing_second": 2}, "max_number": 26, "min_number": 50, "player_max_number": 45, "player_min_number": 61}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 15, "min": 94, "name": "kFtWuv0A"}, {"max": 17, "min": 5, "name": "l8PqwZU9"}, {"max": 24, "min": 15, "name": "LlNFHEzj"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 74, "role_flexing_second": 44}, "duration": 49, "max_number": 82, "min_number": 91, "player_max_number": 89, "player_min_number": 6}, {"combination": {"alliances": [{"max": 20, "min": 9, "name": "30bNTw6O"}, {"max": 42, "min": 35, "name": "tPXM9zpp"}, {"max": 54, "min": 70, "name": "dJGjg6EL"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 84, "role_flexing_second": 48}, "duration": 20, "max_number": 64, "min_number": 49, "player_max_number": 33, "player_min_number": 43}, {"combination": {"alliances": [{"max": 94, "min": 68, "name": "C4QNDzHw"}, {"max": 62, "min": 100, "name": "x8fwQHtO"}, {"max": 34, "min": 83, "name": "rAwMrE3V"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 47, "role_flexing_second": 53}, "duration": 43, "max_number": 7, "min_number": 8, "player_max_number": 33, "player_min_number": 26}], "name": "O1Px0SVd"}, "NwWFBLwD": {"alliance": {"combination": {"alliances": [{"max": 6, "min": 11, "name": "fxgXhrAP"}, {"max": 59, "min": 98, "name": "ciY1fZtD"}, {"max": 30, "min": 56, "name": "tQQYh4Do"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 69, "role_flexing_second": 27}, "max_number": 74, "min_number": 41, "player_max_number": 66, "player_min_number": 4}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 98, "min": 58, "name": "90blRCiK"}, {"max": 39, "min": 19, "name": "A4ubb6IK"}, {"max": 70, "min": 100, "name": "juvrnfkq"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 19, "role_flexing_second": 30}, "duration": 85, "max_number": 72, "min_number": 13, "player_max_number": 43, "player_min_number": 15}, {"combination": {"alliances": [{"max": 18, "min": 19, "name": "BjWHSYLN"}, {"max": 36, "min": 60, "name": "SFYDmomE"}, {"max": 32, "min": 82, "name": "mBTyrxL8"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 97, "role_flexing_second": 51}, "duration": 21, "max_number": 70, "min_number": 67, "player_max_number": 65, "player_min_number": 32}, {"combination": {"alliances": [{"max": 65, "min": 12, "name": "TsVQ4ILf"}, {"max": 96, "min": 98, "name": "TLp8Clay"}, {"max": 60, "min": 66, "name": "2XmYFqP4"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 11}, "duration": 61, "max_number": 5, "min_number": 28, "player_max_number": 7, "player_min_number": 26}], "name": "IR8Y6lRe"}}}, "session_queue_timeout_seconds": 21, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel '5tan04cO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "NvuZT3Eb", "players": [{"results": [{"attribute": "xywmOpas", "value": 0.6652237836397777}, {"attribute": "ml6f28HB", "value": 0.5580928362392473}, {"attribute": "D07Fxwqq", "value": 0.845631165564959}], "user_id": "D6Ck8Woc"}, {"results": [{"attribute": "vdLySEgH", "value": 0.3394503645782536}, {"attribute": "Fmrx5fbZ", "value": 0.13311813857389754}, {"attribute": "n3bXJPK9", "value": 0.9884029273796409}], "user_id": "hlwXgRp8"}, {"results": [{"attribute": "sB6cVLDp", "value": 0.5761529580398846}, {"attribute": "tjNaB9tm", "value": 0.7703716585017514}, {"attribute": "CHVbyWZA", "value": 0.264870969690969}], "user_id": "O6cuk6nh"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "GeQ6Foy3"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "K9XHOXFs", "client_version": "asgNReMA", "deployment": "iTfCmHZf", "error_code": 4, "error_message": "W69kIJS0", "game_mode": "bxJECsz7", "joinable": false, "match_id": "gK6dn4Qd", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 26, "party_attributes": {"K6HxUnh5": {}, "CyHItnKP": {}, "oxVihrSB": {}}, "party_id": "z4RIXzxd", "party_members": [{"extra_attributes": {"SIvrXImB": {}, "RnUDw4vl": {}, "mitLg5mW": {}}, "user_id": "HEQBSmZ9"}, {"extra_attributes": {"kliwW0B0": {}, "br5HSL3u": {}, "raFhAPg5": {}}, "user_id": "HWOfYKKy"}, {"extra_attributes": {"Mo0yMRtH": {}, "msPPDixT": {}, "Hh2pO8pE": {}}, "user_id": "tAsYOtu6"}], "ticket_id": "rb13ywkh"}, {"first_ticket_created_at": 81, "party_attributes": {"PPZjcsMT": {}, "Js3JiDeW": {}, "zM6ncef6": {}}, "party_id": "t51sSRyI", "party_members": [{"extra_attributes": {"C9u2podP": {}, "7DvsRLDv": {}, "DJv8Ps0u": {}}, "user_id": "BT0qSDM1"}, {"extra_attributes": {"pn8IbtLA": {}, "dnBEUir8": {}, "ZH9xc8yU": {}}, "user_id": "Ib2a3Sy2"}, {"extra_attributes": {"AkLaDDXX": {}, "EBONVcHs": {}, "K0pSkwEU": {}}, "user_id": "jmLCBblG"}], "ticket_id": "XnzvFBVE"}, {"first_ticket_created_at": 99, "party_attributes": {"m6yny4Uc": {}, "ODwjE4kY": {}, "zkZ5QOzh": {}}, "party_id": "DeH8hc13", "party_members": [{"extra_attributes": {"IXIOOFuF": {}, "HUs3UAKl": {}, "YwFw2BFo": {}}, "user_id": "M0gZSYtV"}, {"extra_attributes": {"Nhxbh1EA": {}, "AZ4wv4Z7": {}, "XQd9Rnds": {}}, "user_id": "w5oQXcZ2"}, {"extra_attributes": {"ewgq9tIb": {}, "JQ4wGocp": {}, "zdOPcYHQ": {}}, "user_id": "zgl08XU7"}], "ticket_id": "M0w7tC8m"}]}, {"matching_parties": [{"first_ticket_created_at": 37, "party_attributes": {"ovfZDqrM": {}, "v992RDyo": {}, "XIx5Xw8N": {}}, "party_id": "PfBV6bLC", "party_members": [{"extra_attributes": {"w0fgzovJ": {}, "KOxlHKUw": {}, "yjPS87Pa": {}}, "user_id": "BzlGgAle"}, {"extra_attributes": {"DWdCWuGM": {}, "SknmKuOl": {}, "J7us4C0p": {}}, "user_id": "XQY5nAPq"}, {"extra_attributes": {"0aLtU4SL": {}, "beqNGcTN": {}, "rBWrcPkB": {}}, "user_id": "7XQG58q8"}], "ticket_id": "bW3qvFrW"}, {"first_ticket_created_at": 90, "party_attributes": {"TxiiDuFO": {}, "MLQ73GGz": {}, "gtAaBDAl": {}}, "party_id": "tNO0DYpi", "party_members": [{"extra_attributes": {"oqiApcOe": {}, "UQc2upps": {}, "hMlNr1dJ": {}}, "user_id": "90MWgRgP"}, {"extra_attributes": {"jBRRjvUQ": {}, "7lNYA0ER": {}, "hZ0c8hbv": {}}, "user_id": "WFeaWe5A"}, {"extra_attributes": {"WOjNZc9d": {}, "xLIGYWZg": {}, "3NxC4wt9": {}}, "user_id": "DLZVyli6"}], "ticket_id": "flmG2N08"}, {"first_ticket_created_at": 85, "party_attributes": {"tnNqlJhp": {}, "mfWAO5KC": {}, "82aLiztk": {}}, "party_id": "k2dY1nBg", "party_members": [{"extra_attributes": {"NUGnYjLN": {}, "bMe7XlgV": {}, "R0fTwtK9": {}}, "user_id": "FvDqocVr"}, {"extra_attributes": {"BYCzQRyW": {}, "Dh6iCQ5v": {}, "LTCFf3cs": {}}, "user_id": "KRn7usCH"}, {"extra_attributes": {"e4IIkpet": {}, "NLRwk15h": {}, "cljpt4Jq": {}}, "user_id": "JMMCiXtq"}], "ticket_id": "lGT2UxcK"}]}, {"matching_parties": [{"first_ticket_created_at": 82, "party_attributes": {"UQnEw39M": {}, "HTO0Hytw": {}, "obFcnKAW": {}}, "party_id": "Pqshs4Oy", "party_members": [{"extra_attributes": {"rpqItwhc": {}, "n7S1vyJ1": {}, "kEri8dct": {}}, "user_id": "vK1aWLrr"}, {"extra_attributes": {"Sr1BYLnO": {}, "YEPUqHyT": {}, "pyAA6Mb2": {}}, "user_id": "dYzESLT4"}, {"extra_attributes": {"mKwZEVD5": {}, "40ACHTUR": {}, "jfx4lU7R": {}}, "user_id": "VtNf2ozy"}], "ticket_id": "znu5Ozwo"}, {"first_ticket_created_at": 93, "party_attributes": {"TolcUtqG": {}, "fns2l5lK": {}, "oNw6ikpW": {}}, "party_id": "eLM8Wt8f", "party_members": [{"extra_attributes": {"qvY3Yg3a": {}, "Q1oGqDhN": {}, "yqlU5eh3": {}}, "user_id": "VBmdkUkj"}, {"extra_attributes": {"ydVXmG2O": {}, "gdLqZxhW": {}, "dNaW3GB4": {}}, "user_id": "V923pZI1"}, {"extra_attributes": {"OBVVQnej": {}, "e3wBliBf": {}, "XXZIiPdu": {}}, "user_id": "1M6vkXjy"}], "ticket_id": "IcKZqnJE"}, {"first_ticket_created_at": 25, "party_attributes": {"gcyf35tS": {}, "YnYspcto": {}, "c5kYvLMq": {}}, "party_id": "Aqmm6kHi", "party_members": [{"extra_attributes": {"GwaYCwl6": {}, "uVJsLIyt": {}, "2F6kVpqr": {}}, "user_id": "QZ82tEUt"}, {"extra_attributes": {"xle58k1v": {}, "nM2ICO1m": {}, "rwdw88MG": {}}, "user_id": "xMpLSvWP"}, {"extra_attributes": {"Igf2iamW": {}, "4gI5NCw0": {}, "SbNLAxnC": {}}, "user_id": "QZZeLmAs"}], "ticket_id": "XdI9Eyl5"}]}], "namespace": "sQtFs8A5", "party_attributes": {"EA5dUkfn": {}, "M6bd1W8k": {}, "CSbAnNDb": {}}, "party_id": "COLZeHfW", "queued_at": 14, "region": "liVywzpU", "server_name": "XjsTKgiG", "status": "Mq5nP523", "ticket_id": "U5SBMpEw", "updated_at": "1999-09-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "baOi7Dc3"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'ZZ95Uleq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 49, "userID": "VyXRRKWd", "weight": 0.09304957265046254}' \
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
    --matchIDs 'VgCYTq6C' \
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
    --strategy 'tv3LNDit' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'BXSqgiMz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'GggL1LvV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "trmB4JnM", "description": "TdFgHbsE", "findMatchTimeoutSeconds": 27, "joinable": true, "max_delay_ms": 46, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 25, "min": 27, "name": "FjmaLKXT"}, {"max": 98, "min": 87, "name": "sPAHptkn"}, {"max": 83, "min": 87, "name": "tAtXKClS"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 7, "role_flexing_second": 14}, "maxNumber": 43, "minNumber": 76, "playerMaxNumber": 0, "playerMinNumber": 96}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 22, "min": 58, "name": "MHpkqLNS"}, {"max": 66, "min": 53, "name": "03rVGH5N"}, {"max": 91, "min": 51, "name": "iUYPcXm8"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 6, "role_flexing_second": 31}, "duration": 44, "max_number": 80, "min_number": 59, "player_max_number": 19, "player_min_number": 40}, {"combination": {"alliances": [{"max": 16, "min": 13, "name": "0oFPTVjl"}, {"max": 33, "min": 77, "name": "LJcTWHZq"}, {"max": 90, "min": 14, "name": "3p3dAYpq"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 22, "role_flexing_second": 41}, "duration": 100, "max_number": 51, "min_number": 61, "player_max_number": 22, "player_min_number": 9}, {"combination": {"alliances": [{"max": 65, "min": 89, "name": "W4vSaODK"}, {"max": 75, "min": 50, "name": "628A3VgQ"}, {"max": 9, "min": 12, "name": "u2ijSWzu"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 0, "role_flexing_second": 11}, "duration": 79, "max_number": 61, "min_number": 16, "player_max_number": 65, "player_min_number": 37}], "flexingRules": [{"attribute": "K03ecta9", "criteria": "mBPcoOUM", "duration": 96, "reference": 0.954133006364885}, {"attribute": "pX7adErp", "criteria": "L2mMfMZI", "duration": 61, "reference": 0.942800233852002}, {"attribute": "w2PNlMK4", "criteria": "WpfRHP7j", "duration": 50, "reference": 0.25852531216134156}], "match_options": {"options": [{"name": "NUwHIA5k", "type": "8MainAvJ"}, {"name": "Id5OiPTl", "type": "wQlztMCZ"}, {"name": "j67dH2SD", "type": "O1rXsXoH"}]}, "matchingRules": [{"attribute": "W81hulGE", "criteria": "SMdtkWF4", "reference": 0.4592693602277832}, {"attribute": "cBXnmV7B", "criteria": "aalJPo9k", "reference": 0.7309518523440687}, {"attribute": "EEhf6pbz", "criteria": "Mx1PaGem", "reference": 0.2721781794947684}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 23, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'Gv9R1FO3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'MHkD9T6z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'KuOjC951' \
    --matchID 'TAbHowgh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["1BRfr6l7", "v4ipJbtL", "ZZZbioqG"], "party_id": "HhwGd2c6", "user_id": "Oh35ZoaB"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'xuzQ9rgn' \
    --matchID 'O4ubMbnD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'VEwFSWQJ' \
    --matchID '34Cx8aT7' \
    --namespace "$AB_NAMESPACE" \
    --userID 'RAFeyvmT' \
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
    --channelName 'ozbxBZa3' \
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