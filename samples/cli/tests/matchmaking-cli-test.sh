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
    --limit '10' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "BGk8MqFc", "description": "gEK6C1wN", "find_match_timeout_seconds": 10, "game_mode": "eKXFGzOr", "joinable": false, "max_delay_ms": 82, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 75, "min": 92, "name": "fwCkJlkg"}, {"max": 99, "min": 9, "name": "ST35rC9r"}, {"max": 12, "min": 35, "name": "X31O2B0b"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 71, "role_flexing_second": 79}, "max_number": 98, "min_number": 70, "player_max_number": 2, "player_min_number": 39}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 45, "min": 10, "name": "dQXWyZWc"}, {"max": 79, "min": 100, "name": "pxnrpmSQ"}, {"max": 76, "min": 98, "name": "NpDcyZsq"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 91, "role_flexing_second": 28}, "duration": 68, "max_number": 63, "min_number": 82, "player_max_number": 41, "player_min_number": 50}, {"combination": {"alliances": [{"max": 58, "min": 82, "name": "MIZ4jeKl"}, {"max": 77, "min": 96, "name": "7qYt68MT"}, {"max": 1, "min": 74, "name": "IlLuUtcL"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 89, "role_flexing_second": 20}, "duration": 28, "max_number": 60, "min_number": 38, "player_max_number": 12, "player_min_number": 68}, {"combination": {"alliances": [{"max": 98, "min": 76, "name": "Q3Q1h8O1"}, {"max": 97, "min": 70, "name": "XDir1Rja"}, {"max": 63, "min": 22, "name": "udL0Ec4b"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 90}, "duration": 61, "max_number": 31, "min_number": 38, "player_max_number": 73, "player_min_number": 69}], "flexing_rule": [{"attribute": "5bkG5B6O", "criteria": "TA9r6yQ4", "duration": 5, "reference": 0.6278803776882014}, {"attribute": "HMClmeYC", "criteria": "HsSjogxM", "duration": 84, "reference": 0.40561051165385387}, {"attribute": "CDRJYRPU", "criteria": "kFl2DPe5", "duration": 54, "reference": 0.38151268354072243}], "match_options": {"options": [{"name": "OLHC7V96", "type": "egwEalS8"}, {"name": "qhUKoysM", "type": "zOSeub0L"}, {"name": "aRAuc7ZR", "type": "nbfyQUFV"}]}, "matching_rule": [{"attribute": "QelIdDoX", "criteria": "KSZXwqfS", "reference": 0.7847417002700007}, {"attribute": "VITeUOnm", "criteria": "m2ynXo8i", "reference": 0.6418039660018593}, {"attribute": "5qsNVbTk", "criteria": "UlAKlRz4", "reference": 0.45330692229126346}], "rebalance_enable": false, "sub_game_modes": {"N7FLexK2": {"alliance": {"combination": {"alliances": [{"max": 50, "min": 60, "name": "mN7exspk"}, {"max": 50, "min": 2, "name": "ZF9PzNjW"}, {"max": 25, "min": 3, "name": "7g1AOpwP"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 7, "role_flexing_second": 46}, "max_number": 45, "min_number": 91, "player_max_number": 85, "player_min_number": 82}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 2, "min": 50, "name": "PgyQIpIF"}, {"max": 45, "min": 60, "name": "nzKK9kLX"}, {"max": 19, "min": 89, "name": "kLFKP0gG"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 42, "role_flexing_second": 25}, "duration": 72, "max_number": 72, "min_number": 8, "player_max_number": 52, "player_min_number": 15}, {"combination": {"alliances": [{"max": 48, "min": 3, "name": "V9SmKYnZ"}, {"max": 73, "min": 59, "name": "aT67uhm6"}, {"max": 11, "min": 3, "name": "b9SDCA5p"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 56}, "duration": 39, "max_number": 39, "min_number": 70, "player_max_number": 40, "player_min_number": 29}, {"combination": {"alliances": [{"max": 37, "min": 92, "name": "kWJprEg4"}, {"max": 59, "min": 73, "name": "sqsFdqw2"}, {"max": 73, "min": 43, "name": "ZXuGYHt9"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 78, "role_flexing_second": 25}, "duration": 15, "max_number": 73, "min_number": 45, "player_max_number": 5, "player_min_number": 13}], "name": "BxIOrNxz"}, "UsD2MVAB": {"alliance": {"combination": {"alliances": [{"max": 48, "min": 74, "name": "bM3cXlbe"}, {"max": 33, "min": 2, "name": "v5NoX9pm"}, {"max": 37, "min": 26, "name": "esSkiZ4d"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 63, "role_flexing_second": 55}, "max_number": 77, "min_number": 85, "player_max_number": 96, "player_min_number": 48}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 45, "min": 5, "name": "1yT7XspZ"}, {"max": 54, "min": 63, "name": "OwlAlErQ"}, {"max": 0, "min": 63, "name": "ooSXqMnX"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 84, "role_flexing_second": 95}, "duration": 8, "max_number": 27, "min_number": 82, "player_max_number": 90, "player_min_number": 50}, {"combination": {"alliances": [{"max": 47, "min": 21, "name": "E5oBiIeq"}, {"max": 62, "min": 47, "name": "oFABOphA"}, {"max": 12, "min": 15, "name": "EZP2Ndym"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 81, "role_flexing_second": 84}, "duration": 51, "max_number": 3, "min_number": 15, "player_max_number": 100, "player_min_number": 95}, {"combination": {"alliances": [{"max": 86, "min": 28, "name": "xtrJHxfo"}, {"max": 83, "min": 89, "name": "XSGaJYyR"}, {"max": 71, "min": 52, "name": "sqZHafRd"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 64, "role_flexing_second": 20}, "duration": 3, "max_number": 21, "min_number": 46, "player_max_number": 89, "player_min_number": 3}], "name": "PcmbhIEM"}, "blSPniP7": {"alliance": {"combination": {"alliances": [{"max": 100, "min": 77, "name": "szzLIn4K"}, {"max": 60, "min": 13, "name": "cOnM9v86"}, {"max": 96, "min": 40, "name": "VsFRigD6"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 16, "role_flexing_second": 11}, "max_number": 75, "min_number": 52, "player_max_number": 87, "player_min_number": 99}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 34, "min": 84, "name": "uOT873Lb"}, {"max": 93, "min": 6, "name": "jlQ8S2fM"}, {"max": 25, "min": 68, "name": "Nh74gF37"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 73, "role_flexing_second": 32}, "duration": 5, "max_number": 82, "min_number": 15, "player_max_number": 89, "player_min_number": 18}, {"combination": {"alliances": [{"max": 93, "min": 97, "name": "yGp4dUf5"}, {"max": 79, "min": 30, "name": "L2aBzz7y"}, {"max": 99, "min": 59, "name": "Icfe7tDL"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 39, "role_flexing_second": 58}, "duration": 57, "max_number": 72, "min_number": 94, "player_max_number": 86, "player_min_number": 33}, {"combination": {"alliances": [{"max": 66, "min": 43, "name": "WdEEy9KN"}, {"max": 88, "min": 53, "name": "6x8F75Zx"}, {"max": 6, "min": 26, "name": "XASy2FCu"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 48, "role_flexing_second": 64}, "duration": 2, "max_number": 42, "min_number": 40, "player_max_number": 6, "player_min_number": 58}], "name": "jn4MHIC4"}}}, "session_queue_timeout_seconds": 92, "social_matchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'Ry0dkQqm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "ZS6hyGNF", "players": [{"results": [{"attribute": "CpKFdO5A", "value": 0.7182804633725955}, {"attribute": "9tbFgw8p", "value": 0.35004380032795346}, {"attribute": "IUl7OFW2", "value": 0.6519994365428678}], "user_id": "nEv6lSwI"}, {"results": [{"attribute": "LD8Fk6fM", "value": 0.31686630283346695}, {"attribute": "QKXqHTbC", "value": 0.49585069042661223}, {"attribute": "V1JWubNS", "value": 0.5854905861973899}], "user_id": "hPAuW4ex"}, {"results": [{"attribute": "mhxSZGZj", "value": 0.5013787861787494}, {"attribute": "tvuN5x57", "value": 0.2732361531038632}, {"attribute": "KrdAa8k6", "value": 0.6893415257325787}], "user_id": "mgN0g0zo"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "FUay2Gx1"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "2UYYqc0S", "client_version": "9EJ1l0GC", "deployment": "1Xi19enJ", "error_code": 88, "error_message": "ZMGhZp5w", "game_mode": "utJXsd75", "joinable": true, "match_id": "CKEbWQ88", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 34, "party_attributes": {"7mBVPkAj": {}, "mJhmnUkW": {}, "TL87CD2R": {}}, "party_id": "FGmlrf9X", "party_members": [{"extra_attributes": {"lfpoG2Pz": {}, "EjV4Jv6M": {}, "3rcjnNhL": {}}, "user_id": "aXwJOjds"}, {"extra_attributes": {"ilXP4YzR": {}, "C1yVF1if": {}, "zwzlepEi": {}}, "user_id": "9Cr8FXZU"}, {"extra_attributes": {"ClL5JdZ3": {}, "2K5BcFVG": {}, "D6DB1hb5": {}}, "user_id": "Aw2cyjJx"}], "ticket_id": "iIOHbd9q"}, {"first_ticket_created_at": 10, "party_attributes": {"1XIJKiD9": {}, "bpvHu91K": {}, "F7F5f66V": {}}, "party_id": "M23oswiv", "party_members": [{"extra_attributes": {"M9yD24rR": {}, "Uqtm23FP": {}, "DPENZBfK": {}}, "user_id": "peplRIGk"}, {"extra_attributes": {"ezA5rjLu": {}, "M7r9t4m4": {}, "q7YFdL5x": {}}, "user_id": "7dWU1nOz"}, {"extra_attributes": {"dynULpyt": {}, "ziMTBoN0": {}, "4Mx67Lg8": {}}, "user_id": "74KI7UQg"}], "ticket_id": "j96KkJdT"}, {"first_ticket_created_at": 81, "party_attributes": {"h5FOHJDD": {}, "tUYGfnQK": {}, "nEU3IbSq": {}}, "party_id": "H98zkPox", "party_members": [{"extra_attributes": {"Qu8mlP5L": {}, "9IzjVZzF": {}, "UNAIeB5t": {}}, "user_id": "hNu5McMJ"}, {"extra_attributes": {"u3Snd8hI": {}, "1VRwtFtY": {}, "ioYUj52o": {}}, "user_id": "jbw1XFH0"}, {"extra_attributes": {"6jFnYgso": {}, "iTRH4F7h": {}, "06uGbMxU": {}}, "user_id": "Meq3ro28"}], "ticket_id": "q4w8BXvj"}]}, {"matching_parties": [{"first_ticket_created_at": 84, "party_attributes": {"4LWzkRoW": {}, "BIsDwjvx": {}, "5Vq9YiQx": {}}, "party_id": "JtUn8ZW5", "party_members": [{"extra_attributes": {"uESbmxUA": {}, "rWK0Kht0": {}, "mup8PHSb": {}}, "user_id": "aqOp1MDr"}, {"extra_attributes": {"peeewrXH": {}, "lvHsuLZA": {}, "tm4gAjot": {}}, "user_id": "YMOb3QEj"}, {"extra_attributes": {"lJcWLsxT": {}, "jv7w1Lse": {}, "5QWcO9AM": {}}, "user_id": "NaqscjFV"}], "ticket_id": "xLzil9et"}, {"first_ticket_created_at": 89, "party_attributes": {"FjVPrWwm": {}, "CbaIxOBi": {}, "YMlDB1Yy": {}}, "party_id": "buAM7Yzt", "party_members": [{"extra_attributes": {"JUGjf2DE": {}, "IR5H5gFG": {}, "wOxFL2Fr": {}}, "user_id": "AnM0ifC5"}, {"extra_attributes": {"pJOrQBLh": {}, "nwozBC2e": {}, "yFJYvUrE": {}}, "user_id": "GENm2ak8"}, {"extra_attributes": {"J6LVyKcm": {}, "wEKK79EO": {}, "uSYAz6vf": {}}, "user_id": "3C36T0tC"}], "ticket_id": "turuLS6j"}, {"first_ticket_created_at": 32, "party_attributes": {"Oyw5y4Eh": {}, "463Hk22v": {}, "cqqUDj1J": {}}, "party_id": "KwK2nwco", "party_members": [{"extra_attributes": {"VIAzTpLw": {}, "T71a0yRV": {}, "uLvx6Y9m": {}}, "user_id": "famxufzU"}, {"extra_attributes": {"tkEYzYmR": {}, "rI9EOsHG": {}, "hoEy7b9J": {}}, "user_id": "dpTNOlYc"}, {"extra_attributes": {"wDrj7H2z": {}, "jcIIFqaH": {}, "C0Srap0D": {}}, "user_id": "AwQmXN8w"}], "ticket_id": "TND6dMjg"}]}, {"matching_parties": [{"first_ticket_created_at": 12, "party_attributes": {"CT0sKkmD": {}, "6lBDlta6": {}, "kZLyktY8": {}}, "party_id": "0jTxSlVD", "party_members": [{"extra_attributes": {"xJ5fY6Sz": {}, "JpiCGNiC": {}, "V0OYmZA8": {}}, "user_id": "qg4JUAVw"}, {"extra_attributes": {"mgvH1L1h": {}, "YbZhs3dI": {}, "m3SuM89H": {}}, "user_id": "SsN9oMGO"}, {"extra_attributes": {"HraRfJyu": {}, "knUHXVMg": {}, "x8SkjHqT": {}}, "user_id": "qQSjkcMv"}], "ticket_id": "nEzwcKYC"}, {"first_ticket_created_at": 17, "party_attributes": {"1P9T0Djk": {}, "dVTRIyzd": {}, "SSRZR9km": {}}, "party_id": "8nEUIxFI", "party_members": [{"extra_attributes": {"GGRP9Roi": {}, "dUXOKv2J": {}, "SJsuyWJT": {}}, "user_id": "DJiSqA8B"}, {"extra_attributes": {"Ewet9wNq": {}, "ARWnViDA": {}, "2eZlbGnF": {}}, "user_id": "OSXRyOoS"}, {"extra_attributes": {"slYOtz4J": {}, "Jb6HN8U0": {}, "BUaySqLz": {}}, "user_id": "nuWsvg4K"}], "ticket_id": "9kZgpYz2"}, {"first_ticket_created_at": 5, "party_attributes": {"uxpfOLn7": {}, "8Ei8OL8r": {}, "EQtCpa4m": {}}, "party_id": "dLfzc3Cd", "party_members": [{"extra_attributes": {"dJrP4vKl": {}, "3oMov6fs": {}, "sxql8BFi": {}}, "user_id": "oTQcFAY0"}, {"extra_attributes": {"0sxbLCoh": {}, "FLuWJftl": {}, "thNTDW4q": {}}, "user_id": "pTCuDE4H"}, {"extra_attributes": {"vRDG7dlJ": {}, "QLQJaYr6": {}, "7AaubUfP": {}}, "user_id": "aHHVIx6x"}], "ticket_id": "BIud9vSr"}]}], "namespace": "lYt8EGLi", "party_attributes": {"qQdtVpJQ": {}, "gHC8UI6L": {}, "JpSU1U6Y": {}}, "party_id": "NPjAyWEP", "queued_at": 39, "region": "fwy7mLgF", "server_name": "cRoyyiCz", "status": "EJIXHgWf", "ticket_id": "Jh9gHhQ3", "updated_at": "1980-12-02T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "GMLlRs3O"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'iA6RC7oZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 48, "userID": "fifjBtEN", "weight": 0.7219043979194242}' \
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
    --matchIDs 'TTDfHnD6' \
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
    --strategy 'u8Hykad9' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'MWjSZnh6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '3OWE7M68' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "Mlw2wQyv", "description": "vpciqIpS", "findMatchTimeoutSeconds": 32, "joinable": true, "max_delay_ms": 47, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 81, "min": 4, "name": "mwVJv5KE"}, {"max": 31, "min": 77, "name": "kZeRJLEp"}, {"max": 91, "min": 52, "name": "D3ZII6zi"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 84, "role_flexing_second": 53}, "maxNumber": 99, "minNumber": 65, "playerMaxNumber": 95, "playerMinNumber": 57}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 8, "min": 59, "name": "2hOSNVxz"}, {"max": 65, "min": 44, "name": "mxwwmctA"}, {"max": 10, "min": 100, "name": "488GDNd6"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 25, "role_flexing_second": 2}, "duration": 30, "max_number": 59, "min_number": 70, "player_max_number": 30, "player_min_number": 19}, {"combination": {"alliances": [{"max": 55, "min": 82, "name": "pz9P5JR9"}, {"max": 0, "min": 17, "name": "166LQthB"}, {"max": 99, "min": 25, "name": "VRxUGIfN"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 33, "role_flexing_second": 35}, "duration": 51, "max_number": 25, "min_number": 31, "player_max_number": 66, "player_min_number": 3}, {"combination": {"alliances": [{"max": 85, "min": 36, "name": "g6ZTrXYN"}, {"max": 54, "min": 69, "name": "pPhTIcyF"}, {"max": 56, "min": 42, "name": "0mZwWYJs"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 83, "role_flexing_second": 0}, "duration": 72, "max_number": 22, "min_number": 75, "player_max_number": 82, "player_min_number": 15}], "flexingRules": [{"attribute": "RPQXNOw5", "criteria": "35CCxsc7", "duration": 17, "reference": 0.2074940462629986}, {"attribute": "OfvmPgGO", "criteria": "SmfWJTnn", "duration": 20, "reference": 0.9463130021508906}, {"attribute": "NmU7miD5", "criteria": "OsVd8y9Z", "duration": 18, "reference": 0.7997979725731906}], "match_options": {"options": [{"name": "7telnNpO", "type": "8zkfu9ZO"}, {"name": "4kbFzKmD", "type": "Zb6uxQV1"}, {"name": "4KXynnUy", "type": "LyG1Z3bV"}]}, "matchingRules": [{"attribute": "9eviknKK", "criteria": "ZGs2QqjU", "reference": 0.5127930014865747}, {"attribute": "OtjH2zZB", "criteria": "0hngtBB8", "reference": 0.511888121303187}, {"attribute": "rHPzQifn", "criteria": "r2Ibb4D1", "reference": 0.28901872607210477}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 75, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'qv9Ma426' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'NHpnkTiv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'BX57lbjQ' \
    --matchID 'SNpLLqcG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["Uu3TdPoV", "8Gy59zH3", "5EAKIyZL"], "party_id": "D7PtIhmS", "user_id": "YOywSNKQ"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'vs8vaxHi' \
    --matchID 'EzyAdQPt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'wVIWmqsK' \
    --matchID 'E4MTKCkS' \
    --namespace "$AB_NAMESPACE" \
    --userID 'LkF2mlFg' \
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
    --channelName 'AJwFzc6t' \
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