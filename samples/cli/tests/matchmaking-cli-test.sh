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
    --limit '95' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "w4fWuh8U", "description": "yHscrztH", "find_match_timeout_seconds": 8, "game_mode": "NdG0ahjZ", "joinable": true, "max_delay_ms": 53, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 87, "min": 85, "name": "6dhJfT5Q"}, {"max": 52, "min": 51, "name": "6YtlDR3A"}, {"max": 27, "min": 83, "name": "1Wj5Rvu8"}], "has_combination": true}, "max_number": 80, "min_number": 90, "player_max_number": 62, "player_min_number": 88}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 100, "min": 83, "name": "DQwiMEaX"}, {"max": 64, "min": 14, "name": "2taG9rHe"}, {"max": 19, "min": 66, "name": "kqZjDnxB"}], "has_combination": true}, "duration": 58, "max_number": 36, "min_number": 18, "player_max_number": 13, "player_min_number": 35}, {"combination": {"alliances": [{"max": 75, "min": 5, "name": "0dwXUZbU"}, {"max": 89, "min": 41, "name": "RzEw0VdN"}, {"max": 50, "min": 7, "name": "8mMCmp1B"}], "has_combination": true}, "duration": 57, "max_number": 69, "min_number": 66, "player_max_number": 41, "player_min_number": 82}, {"combination": {"alliances": [{"max": 18, "min": 24, "name": "QOgSkbQF"}, {"max": 1, "min": 83, "name": "Ons4gm17"}, {"max": 60, "min": 14, "name": "8QnuZrtb"}], "has_combination": false}, "duration": 85, "max_number": 74, "min_number": 78, "player_max_number": 25, "player_min_number": 35}], "flexing_rule": [{"attribute": "F8Noeno6", "criteria": "KrbBGQJx", "duration": 32, "reference": 0.652485505060563}, {"attribute": "8l9lxt9A", "criteria": "jhscHtJ7", "duration": 66, "reference": 0.3412588310216583}, {"attribute": "P3Cvz6oA", "criteria": "BKOwtQGp", "duration": 57, "reference": 0.7469633126293961}], "match_options": {"options": [{"name": "LMFal3vI", "type": "B7qP6gEP"}, {"name": "TJ7HO4xT", "type": "0Nsmiz2P"}, {"name": "2NPTM4WK", "type": "AefOAvch"}]}, "matching_rule": [{"attribute": "PYgreR2K", "criteria": "2Agn0Bkf", "reference": 0.6160663404500347}, {"attribute": "ctHXALRx", "criteria": "91ptmB56", "reference": 0.6546422983889878}, {"attribute": "haZLBDJx", "criteria": "U4DfEL7y", "reference": 0.7181760276598795}], "sub_game_modes": {"PFQsp1Kt": {"alliance": {"combination": {"alliances": [{"max": 100, "min": 69, "name": "nJj5TrTZ"}, {"max": 54, "min": 93, "name": "2P9MTyn0"}, {"max": 58, "min": 99, "name": "EYXDXb87"}], "has_combination": true}, "max_number": 56, "min_number": 27, "player_max_number": 42, "player_min_number": 66}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 92, "min": 68, "name": "kxQDhJyp"}, {"max": 77, "min": 62, "name": "9CgD43J1"}, {"max": 62, "min": 97, "name": "y0tTzqPt"}], "has_combination": false}, "duration": 46, "max_number": 22, "min_number": 80, "player_max_number": 97, "player_min_number": 56}, {"combination": {"alliances": [{"max": 27, "min": 50, "name": "e5DUSalh"}, {"max": 71, "min": 82, "name": "deval1fo"}, {"max": 17, "min": 1, "name": "QtXCm9Mz"}], "has_combination": false}, "duration": 14, "max_number": 98, "min_number": 45, "player_max_number": 40, "player_min_number": 20}, {"combination": {"alliances": [{"max": 29, "min": 50, "name": "3JI4YhTc"}, {"max": 43, "min": 94, "name": "dJaLP9cD"}, {"max": 100, "min": 19, "name": "Ueur8ITh"}], "has_combination": false}, "duration": 34, "max_number": 31, "min_number": 63, "player_max_number": 60, "player_min_number": 7}], "name": "OB1ywBHR"}, "LbGPal0A": {"alliance": {"combination": {"alliances": [{"max": 61, "min": 100, "name": "5hzHOtuW"}, {"max": 19, "min": 64, "name": "kFFOEAN0"}, {"max": 43, "min": 28, "name": "0ZCHUQqC"}], "has_combination": true}, "max_number": 37, "min_number": 89, "player_max_number": 63, "player_min_number": 18}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 84, "min": 36, "name": "CkhVzJKK"}, {"max": 57, "min": 2, "name": "04oCRgqS"}, {"max": 47, "min": 80, "name": "SJhTruPm"}], "has_combination": false}, "duration": 92, "max_number": 53, "min_number": 24, "player_max_number": 71, "player_min_number": 45}, {"combination": {"alliances": [{"max": 65, "min": 11, "name": "QjEGWpVl"}, {"max": 68, "min": 21, "name": "8csS0g0a"}, {"max": 96, "min": 69, "name": "cNsqIkpz"}], "has_combination": false}, "duration": 16, "max_number": 97, "min_number": 84, "player_max_number": 22, "player_min_number": 12}, {"combination": {"alliances": [{"max": 53, "min": 97, "name": "tWpxxN4H"}, {"max": 33, "min": 22, "name": "4dV95LpR"}, {"max": 50, "min": 69, "name": "28DESTZr"}], "has_combination": false}, "duration": 53, "max_number": 11, "min_number": 53, "player_max_number": 65, "player_min_number": 53}], "name": "YHEyUj67"}, "xpWZd3sT": {"alliance": {"combination": {"alliances": [{"max": 21, "min": 94, "name": "bvlmzUPv"}, {"max": 71, "min": 19, "name": "pLe9qteO"}, {"max": 71, "min": 19, "name": "o1heu1Zr"}], "has_combination": false}, "max_number": 69, "min_number": 44, "player_max_number": 46, "player_min_number": 43}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 93, "min": 47, "name": "ayIiIf8z"}, {"max": 17, "min": 98, "name": "XWMVxEaW"}, {"max": 27, "min": 14, "name": "APJHcWEk"}], "has_combination": false}, "duration": 12, "max_number": 58, "min_number": 54, "player_max_number": 33, "player_min_number": 5}, {"combination": {"alliances": [{"max": 73, "min": 32, "name": "v6cUyz7M"}, {"max": 84, "min": 82, "name": "ivdF4TUQ"}, {"max": 22, "min": 88, "name": "sw9uxBaJ"}], "has_combination": true}, "duration": 89, "max_number": 71, "min_number": 41, "player_max_number": 37, "player_min_number": 56}, {"combination": {"alliances": [{"max": 33, "min": 76, "name": "S1kM7SWk"}, {"max": 100, "min": 99, "name": "5yGlD0SN"}, {"max": 89, "min": 26, "name": "cqJV1V5O"}], "has_combination": false}, "duration": 82, "max_number": 61, "min_number": 40, "player_max_number": 66, "player_min_number": 83}], "name": "APUM622H"}}}, "session_queue_timeout_seconds": 26, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'V8D6sQ2O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "b1LSdZBv", "players": [{"results": [{"attribute": "fEfzDckV", "value": 0.9589217143901447}, {"attribute": "IqfuE4H5", "value": 0.6973471655492554}, {"attribute": "rKv9sNbz", "value": 0.48031164241578506}], "user_id": "ubjIvUS7"}, {"results": [{"attribute": "nC1M0gN1", "value": 0.37621568266266914}, {"attribute": "dGiHV5DI", "value": 0.7534022844195274}, {"attribute": "ll4YoSla", "value": 0.25404881668207924}], "user_id": "Ge8u3Agb"}, {"results": [{"attribute": "0H6NrYoW", "value": 0.6083851270295381}, {"attribute": "GBkzhQsK", "value": 0.7990847175443089}, {"attribute": "3Dr8yKFF", "value": 0.8914950243427489}], "user_id": "WXOV2TZl"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "qA9rpYsu"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "GU1RYjgC", "client_version": "fpbVwBTs", "deployment": "P5FqeyhG", "game_mode": "wMrpdPsq", "joinable": false, "match_id": "3twcQwLP", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 51, "party_attributes": {"2UkwqEcF": {}, "ATcoVPb6": {}, "CnLkgkIU": {}}, "party_id": "9NzjYDFA", "party_members": [{"extra_attributes": {"MOJjIpI1": {}, "PzNjR5vX": {}, "xNDUhqQW": {}}, "user_id": "dWfL4gur"}, {"extra_attributes": {"sN0Mxa4N": {}, "lJW7qvnA": {}, "X27s9L8V": {}}, "user_id": "mu79mxnN"}, {"extra_attributes": {"BqQSVRDM": {}, "hgSAuq9h": {}, "jiOow9DL": {}}, "user_id": "utALg8ra"}]}, {"first_ticket_created_at": 8, "party_attributes": {"CUSkBwKq": {}, "aIroPcvX": {}, "p8qKGwKP": {}}, "party_id": "3p9D8zkA", "party_members": [{"extra_attributes": {"QJIiLRXq": {}, "EZYCPnzV": {}, "W0eoTOFU": {}}, "user_id": "UnZHFCmq"}, {"extra_attributes": {"4uw09MAD": {}, "cLTNsjRm": {}, "HQ8oz38B": {}}, "user_id": "FsKVy985"}, {"extra_attributes": {"Y2goPyRw": {}, "uZz1OPvN": {}, "j0iqCAjc": {}}, "user_id": "fc8lnh55"}]}, {"first_ticket_created_at": 12, "party_attributes": {"Pw8Bxd2Z": {}, "XyxSbcuO": {}, "gD7s3u8a": {}}, "party_id": "MBeKzD3B", "party_members": [{"extra_attributes": {"mB5K7WYD": {}, "KdJOHxH4": {}, "qe7kUCVj": {}}, "user_id": "Ds4dmBGl"}, {"extra_attributes": {"15STCeQ8": {}, "l0Ko9hE9": {}, "WmAUAOpf": {}}, "user_id": "u6qjZ71m"}, {"extra_attributes": {"jMQ6WiNU": {}, "OzaKGFHa": {}, "4yaBr36u": {}}, "user_id": "TXRcXtId"}]}]}, {"matching_parties": [{"first_ticket_created_at": 80, "party_attributes": {"BbIbceGt": {}, "swle0DJt": {}, "uRByMdJa": {}}, "party_id": "IMIZuCz3", "party_members": [{"extra_attributes": {"q1MDUGqq": {}, "i0CugawU": {}, "AbQaz6sq": {}}, "user_id": "qoQz3imT"}, {"extra_attributes": {"E24kmbRD": {}, "ZrqyI7yZ": {}, "iyfLBrJP": {}}, "user_id": "i3wCIJDt"}, {"extra_attributes": {"FZ8Q0JQA": {}, "HeXmU2tG": {}, "P2dy25pO": {}}, "user_id": "SGXKY8qy"}]}, {"first_ticket_created_at": 9, "party_attributes": {"NCM0ifV0": {}, "9Fngea2z": {}, "XGAYieeK": {}}, "party_id": "qNVrTd8P", "party_members": [{"extra_attributes": {"SJoiVa35": {}, "5rKYKTGc": {}, "gbQwtmdj": {}}, "user_id": "gQtlgON8"}, {"extra_attributes": {"1xdrKb8x": {}, "JeQT19bq": {}, "rgK5RYYY": {}}, "user_id": "CiomPc0e"}, {"extra_attributes": {"IcvOBP8s": {}, "rRz7FRuW": {}, "s7N9h3qa": {}}, "user_id": "qUNTXMus"}]}, {"first_ticket_created_at": 60, "party_attributes": {"w0keicUy": {}, "XqpUjmIc": {}, "hkFBOLoP": {}}, "party_id": "ewwCZSEZ", "party_members": [{"extra_attributes": {"5BLgR5Mr": {}, "PZrBlejV": {}, "EDhIcjvD": {}}, "user_id": "ZU4hhPqY"}, {"extra_attributes": {"Nq0NkKoQ": {}, "WR6fH7rJ": {}, "hU6Wnjfd": {}}, "user_id": "3wygWhi4"}, {"extra_attributes": {"8C3yIb4j": {}, "7qu3jSsP": {}, "zfveTfUq": {}}, "user_id": "8D29gJG3"}]}]}, {"matching_parties": [{"first_ticket_created_at": 78, "party_attributes": {"5tovM1TB": {}, "MF7g7BT2": {}, "Wpstuniz": {}}, "party_id": "ny1ZV3Fs", "party_members": [{"extra_attributes": {"J30eTatw": {}, "RGAeSIbK": {}, "NjtcO2QI": {}}, "user_id": "MkKefpjc"}, {"extra_attributes": {"j9JbiciR": {}, "u83LjDeO": {}, "FPeVsOBr": {}}, "user_id": "govNfBNC"}, {"extra_attributes": {"jE622AZf": {}, "WRxRm8qU": {}, "2yeiidTE": {}}, "user_id": "XQ0MZ3lM"}]}, {"first_ticket_created_at": 62, "party_attributes": {"zoPp15VA": {}, "PqoowsCn": {}, "vwbXHSTw": {}}, "party_id": "yjy4xD71", "party_members": [{"extra_attributes": {"BAV2RT9c": {}, "lhp6ljfR": {}, "R3CaUqLM": {}}, "user_id": "GoY9TS0c"}, {"extra_attributes": {"L92ssYbX": {}, "mJEsa13z": {}, "eyVlyi7P": {}}, "user_id": "FeTDb4nR"}, {"extra_attributes": {"wydusXwb": {}, "xWchF5tb": {}, "YsuHq4mR": {}}, "user_id": "d4amD29t"}]}, {"first_ticket_created_at": 2, "party_attributes": {"D4jjU9Ia": {}, "YkHCKfYY": {}, "HTcchp0h": {}}, "party_id": "FWTTvkhm", "party_members": [{"extra_attributes": {"pCInK3U5": {}, "4J7j7cgR": {}, "uLzYtpuD": {}}, "user_id": "MuhHlQ9S"}, {"extra_attributes": {"SZEi6zSS": {}, "KLAIX930": {}, "uutzkFP0": {}}, "user_id": "UQvqbHRC"}, {"extra_attributes": {"Dl2MBz28": {}, "6WO0qLbA": {}, "PYmjTyWh": {}}, "user_id": "ow8ZYizO"}]}]}], "namespace": "LN7uJ0oK", "party_attributes": {"iz0wHSoW": {}, "OWYZI0Da": {}, "VUpOWotD": {}}, "party_id": "HNZwfdS8", "queued_at": 32, "region": "c6zOQmPh", "server_name": "OI9grFIC", "status": "0VbyUTjb", "updated_at": "1996-06-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "ghkkyov3"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'emTnns4Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 1, "userID": "qyi0aDSF", "weight": 0.6563340112334642}' \
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
    --matchIDs 'JGiAq6g5' \
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
    --strategy '8RLal7rm' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName '8Fcy0JhS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'l2qoApFH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "7F927LLj", "description": "gUMyMoJL", "findMatchTimeoutSeconds": 78, "joinable": true, "max_delay_ms": 27, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 0, "min": 25, "name": "g3aRmEBA"}, {"max": 27, "min": 78, "name": "vgWgtlm2"}, {"max": 90, "min": 25, "name": "RSL60HyF"}], "has_combination": false}, "maxNumber": 80, "minNumber": 69, "playerMaxNumber": 88, "playerMinNumber": 79}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 8, "min": 5, "name": "lwUqXYkn"}, {"max": 100, "min": 36, "name": "JOj2UNer"}, {"max": 19, "min": 92, "name": "yJ5FZhqc"}], "has_combination": false}, "duration": 12, "max_number": 32, "min_number": 47, "player_max_number": 92, "player_min_number": 64}, {"combination": {"alliances": [{"max": 96, "min": 59, "name": "5cPBVaez"}, {"max": 21, "min": 23, "name": "DYhVWS08"}, {"max": 34, "min": 54, "name": "3oWoZ5r4"}], "has_combination": false}, "duration": 54, "max_number": 36, "min_number": 21, "player_max_number": 6, "player_min_number": 97}, {"combination": {"alliances": [{"max": 27, "min": 37, "name": "zavDAuXY"}, {"max": 53, "min": 66, "name": "9GYqsgEG"}, {"max": 69, "min": 49, "name": "fD0MqNA2"}], "has_combination": true}, "duration": 78, "max_number": 8, "min_number": 57, "player_max_number": 43, "player_min_number": 79}], "flexingRules": [{"attribute": "X7LNxkC4", "criteria": "xuXkV678", "duration": 20, "reference": 0.05036578031435068}, {"attribute": "0zIlDkvd", "criteria": "SYDwqIir", "duration": 7, "reference": 0.5570046906195103}, {"attribute": "jDbwP0iG", "criteria": "drFcZyn3", "duration": 42, "reference": 0.44598746950484225}], "match_options": {"options": [{"name": "27ZvOqFD", "type": "4Ks8ZFo4"}, {"name": "UKU4Kjly", "type": "AjotzFvk"}, {"name": "3DFBUGPk", "type": "RKTqs3vv"}]}, "matchingRules": [{"attribute": "oyGFki6a", "criteria": "Ea5kCd4X", "reference": 0.22508455195791677}, {"attribute": "rmM4yLa2", "criteria": "SkBS07yj", "reference": 0.7901137279861853}, {"attribute": "UY6BsTSb", "criteria": "0imwwtvh", "reference": 0.5402717135140983}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 55, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'SAVyLsum' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'VBswX7CK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName '9AFueStH' \
    --matchID 'FxDJ11Rk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["GT3c0JLj", "eyx18lBN", "R2g8MXN8"], "party_id": "qcBcHJlp", "user_id": "BEGEvIpB"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'cyNTu7Ra' \
    --matchID 'GIx9Kyq9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'mOKZNN2N' \
    --matchID 'IrUE4hsa' \
    --namespace "$AB_NAMESPACE" \
    --userID 'tBezrE8n' \
    > test.out 2>&1
eval_tap $? 23 'DeleteUserFromSessionInChannel' test.out

#- 24 SearchSessions
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessions \
    --namespace "$AB_NAMESPACE" \
    --channel 'NXUFNecG' \
    --deleted  \
    --matchID 'S9O4U8Qb' \
    --partyID 'AWYy10ro' \
    --userID 'M5t0QEg1' \
    --limit '39' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 24 'SearchSessions' test.out

#- 25 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main matchmaking getSessionHistoryDetailed \
    --matchID 'V0eAETeu' \
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
    --channelName 'nz3duyUt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetSingleMatchmakingChannel' test.out

#- 29 SearchSessionsV2
./ng net.accelbyte.sdk.cli.Main matchmaking searchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel '6gXgEYEI' \
    --deleted  \
    --matchID 'wzNwqiYT' \
    --partyID 'aOcexI6h' \
    --userID 'iEIzBYrx' \
    --limit '10' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 29 'SearchSessionsV2' test.out

#- 30 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 30 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE