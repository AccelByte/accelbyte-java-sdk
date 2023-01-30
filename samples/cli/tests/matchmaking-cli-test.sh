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
    --limit '59' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "DRTvOp1e", "description": "4zEe3l4m", "find_match_timeout_seconds": 59, "game_mode": "heSUf4yH", "joinable": false, "max_delay_ms": 84, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 97, "min": 72, "name": "LO9IsQGD"}, {"max": 4, "min": 56, "name": "a1JM0k7n"}, {"max": 4, "min": 79, "name": "Xq8PbUMc"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 33, "role_flexing_second": 70}, "max_number": 10, "min_number": 60, "player_max_number": 84, "player_min_number": 44}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 97, "min": 80, "name": "frqgqoz2"}, {"max": 83, "min": 2, "name": "Fp24b0PD"}, {"max": 52, "min": 44, "name": "inLyRvwr"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 29, "role_flexing_second": 5}, "duration": 90, "max_number": 95, "min_number": 3, "player_max_number": 32, "player_min_number": 61}, {"combination": {"alliances": [{"max": 76, "min": 10, "name": "0EUMg55H"}, {"max": 30, "min": 54, "name": "Pv7cQziL"}, {"max": 10, "min": 40, "name": "zIIB5nIF"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 99, "role_flexing_second": 60}, "duration": 4, "max_number": 71, "min_number": 91, "player_max_number": 26, "player_min_number": 81}, {"combination": {"alliances": [{"max": 22, "min": 67, "name": "5zuhLiOd"}, {"max": 9, "min": 95, "name": "JS1XDPyY"}, {"max": 58, "min": 67, "name": "GDwr3fKy"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 89, "role_flexing_second": 78}, "duration": 29, "max_number": 35, "min_number": 10, "player_max_number": 74, "player_min_number": 14}], "flexing_rule": [{"attribute": "zCwv7Qep", "criteria": "1lk2EYvo", "duration": 44, "reference": 0.1335836319419531}, {"attribute": "h5NRlgOV", "criteria": "64e71gym", "duration": 44, "reference": 0.8038402772725974}, {"attribute": "gQ05mf7N", "criteria": "N7Q7SYMa", "duration": 26, "reference": 0.8519165738663897}], "match_options": {"options": [{"name": "VeHanMg2", "type": "l0G8jo58"}, {"name": "gtbolDeV", "type": "5ES3cfsN"}, {"name": "zKvSZG5d", "type": "Zf7oWL9z"}]}, "matching_rule": [{"attribute": "vh7jD41i", "criteria": "kZm7Zv3s", "reference": 0.8094770594370982}, {"attribute": "yGreWHSV", "criteria": "ArHR9Pz8", "reference": 0.23855126453232778}, {"attribute": "0X43VbaQ", "criteria": "etl9Lq2L", "reference": 0.7440294376517956}], "rebalance_enable": true, "sub_game_modes": {"2dtchcUt": {"alliance": {"combination": {"alliances": [{"max": 47, "min": 86, "name": "5VHc9naj"}, {"max": 95, "min": 80, "name": "EPqFtxrJ"}, {"max": 47, "min": 63, "name": "XQpG2uOZ"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 55, "role_flexing_second": 85}, "max_number": 91, "min_number": 95, "player_max_number": 26, "player_min_number": 93}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 66, "min": 4, "name": "JAcwt2Yo"}, {"max": 2, "min": 26, "name": "pgQ2QLIi"}, {"max": 87, "min": 91, "name": "KXhQCI2G"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 64, "role_flexing_second": 26}, "duration": 64, "max_number": 92, "min_number": 88, "player_max_number": 23, "player_min_number": 26}, {"combination": {"alliances": [{"max": 90, "min": 74, "name": "O6rNit2d"}, {"max": 8, "min": 26, "name": "BvWR0u1l"}, {"max": 53, "min": 12, "name": "WU0FDoqv"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 49, "role_flexing_second": 54}, "duration": 100, "max_number": 52, "min_number": 60, "player_max_number": 79, "player_min_number": 72}, {"combination": {"alliances": [{"max": 50, "min": 91, "name": "jBuzVGd6"}, {"max": 86, "min": 33, "name": "thWRKN9A"}, {"max": 58, "min": 42, "name": "ansNmQdU"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 65, "role_flexing_second": 79}, "duration": 45, "max_number": 10, "min_number": 66, "player_max_number": 78, "player_min_number": 91}], "name": "vWMp7Wji"}, "3BibGN9J": {"alliance": {"combination": {"alliances": [{"max": 74, "min": 16, "name": "GBTlVKjc"}, {"max": 39, "min": 52, "name": "O7GY147X"}, {"max": 2, "min": 83, "name": "85eDdSL1"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 8, "role_flexing_second": 83}, "max_number": 36, "min_number": 24, "player_max_number": 76, "player_min_number": 86}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 75, "min": 98, "name": "chZQCdcr"}, {"max": 27, "min": 90, "name": "eretHxhc"}, {"max": 32, "min": 82, "name": "7zAp78ut"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 18, "role_flexing_second": 59}, "duration": 12, "max_number": 64, "min_number": 67, "player_max_number": 69, "player_min_number": 41}, {"combination": {"alliances": [{"max": 44, "min": 25, "name": "zuTMs19Q"}, {"max": 90, "min": 58, "name": "6yg8iqcn"}, {"max": 82, "min": 19, "name": "b2Msw9An"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 100, "role_flexing_second": 77}, "duration": 34, "max_number": 15, "min_number": 73, "player_max_number": 60, "player_min_number": 6}, {"combination": {"alliances": [{"max": 34, "min": 48, "name": "iB8VST04"}, {"max": 44, "min": 83, "name": "qUzkWBo0"}, {"max": 48, "min": 15, "name": "Z2Qws33A"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 27, "role_flexing_second": 33}, "duration": 74, "max_number": 1, "min_number": 96, "player_max_number": 15, "player_min_number": 78}], "name": "T4kDOA1u"}, "iuIYBzdx": {"alliance": {"combination": {"alliances": [{"max": 49, "min": 1, "name": "8qRe5mFQ"}, {"max": 75, "min": 98, "name": "ODNQWfYb"}, {"max": 85, "min": 81, "name": "xqJhCvXm"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 99, "role_flexing_second": 65}, "max_number": 48, "min_number": 1, "player_max_number": 25, "player_min_number": 30}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 39, "min": 0, "name": "hdqQB3Eb"}, {"max": 2, "min": 45, "name": "qdoNUt5W"}, {"max": 38, "min": 19, "name": "XPsl5CRC"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 92, "role_flexing_second": 1}, "duration": 89, "max_number": 84, "min_number": 98, "player_max_number": 56, "player_min_number": 53}, {"combination": {"alliances": [{"max": 37, "min": 96, "name": "ehs2fNKj"}, {"max": 22, "min": 65, "name": "Xu6cv25y"}, {"max": 66, "min": 50, "name": "fLtRTPbv"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 23, "role_flexing_second": 81}, "duration": 30, "max_number": 73, "min_number": 65, "player_max_number": 75, "player_min_number": 29}, {"combination": {"alliances": [{"max": 17, "min": 34, "name": "4zp72l2W"}, {"max": 15, "min": 94, "name": "hRMvyMiK"}, {"max": 49, "min": 45, "name": "UDxOaHm6"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 20, "role_flexing_second": 39}, "duration": 9, "max_number": 69, "min_number": 34, "player_max_number": 37, "player_min_number": 1}], "name": "Xd15q0M8"}}}, "session_queue_timeout_seconds": 54, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'xyN1qCtY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "3FhAH2oq", "players": [{"results": [{"attribute": "kPCTrxqY", "value": 0.7203927840945527}, {"attribute": "WnPk3Vd4", "value": 0.696184198951932}, {"attribute": "1GdB10jS", "value": 0.5431349826080382}], "user_id": "F6Y1Sfm0"}, {"results": [{"attribute": "d8StCbrI", "value": 0.2595960350662949}, {"attribute": "T5zi4Y3s", "value": 0.8605387985320988}, {"attribute": "L27Td2Y8", "value": 0.5525677115719649}], "user_id": "gcpXpzNr"}, {"results": [{"attribute": "5OvfEv9M", "value": 0.0367406456991719}, {"attribute": "ckNlI2CK", "value": 0.5667081642001526}, {"attribute": "7wYgcI9i", "value": 0.5872992941876439}], "user_id": "J5B1NGJg"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "nMTDh4KO"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "oNvYp6wZ", "client_version": "6WyBIDR2", "deployment": "VHHIdkc5", "error_code": 39, "error_message": "oP9MLDlt", "game_mode": "mS03JQtq", "joinable": true, "match_id": "aCboH78D", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 25, "party_attributes": {"pk40CguU": {}, "aO6tW489": {}, "q3z4i7Bg": {}}, "party_id": "rP3EqiF7", "party_members": [{"extra_attributes": {"UhGjoeIx": {}, "CXPzuFZR": {}, "BKaTWoN5": {}}, "user_id": "XfuwZ1gX"}, {"extra_attributes": {"bvNdWtbS": {}, "rU31j9yk": {}, "cAoPntBe": {}}, "user_id": "VGKgGrh6"}, {"extra_attributes": {"DUZ1Pajp": {}, "2MzSDnlx": {}, "d5I2gB3o": {}}, "user_id": "inY8U1Ff"}], "ticket_id": "iSUDNuaZ"}, {"first_ticket_created_at": 16, "party_attributes": {"EHKpyBe6": {}, "MM9wy1c1": {}, "kfBRXe4e": {}}, "party_id": "Lld4HLOJ", "party_members": [{"extra_attributes": {"PBTuzgmq": {}, "DBpFobYC": {}, "wnYbx41D": {}}, "user_id": "2ZUTFnUi"}, {"extra_attributes": {"rr8O2g2Q": {}, "kXDr0seU": {}, "D7XOOATl": {}}, "user_id": "3pdKy2RM"}, {"extra_attributes": {"DKSgGfLu": {}, "d3myX0gi": {}, "uV84zj4R": {}}, "user_id": "9WGQPXha"}], "ticket_id": "Mg7BIJZf"}, {"first_ticket_created_at": 11, "party_attributes": {"XUvqEDbQ": {}, "rUZgmpmN": {}, "nwCNuxE4": {}}, "party_id": "3DO3mR39", "party_members": [{"extra_attributes": {"Lt6JKSVr": {}, "mZt5fvA0": {}, "JQh5PwlL": {}}, "user_id": "qBOTajxD"}, {"extra_attributes": {"vQ8bbDDF": {}, "BDd3dE8p": {}, "XuXbv5Jf": {}}, "user_id": "UdxfszKI"}, {"extra_attributes": {"a1msPb68": {}, "GO9nEp2x": {}, "Y08ZpDHL": {}}, "user_id": "vsgHCzz6"}], "ticket_id": "ndMJSxWK"}]}, {"matching_parties": [{"first_ticket_created_at": 38, "party_attributes": {"Nv0l49fe": {}, "KUaqSViQ": {}, "e2NbIgaZ": {}}, "party_id": "enLU4lLB", "party_members": [{"extra_attributes": {"1Z7QgsQJ": {}, "nifJgaew": {}, "qSaVBN4I": {}}, "user_id": "3XouNtY7"}, {"extra_attributes": {"4IV0NdyL": {}, "CEhUp0Mc": {}, "kPFeVzXu": {}}, "user_id": "wh9ppuSd"}, {"extra_attributes": {"US7vJf57": {}, "6zE6PJJU": {}, "OTOfudjl": {}}, "user_id": "V6R67OtV"}], "ticket_id": "9nxcrGmR"}, {"first_ticket_created_at": 61, "party_attributes": {"LO9YdS4D": {}, "Dzg6N3Vu": {}, "ifsVXbox": {}}, "party_id": "DUHlwOk0", "party_members": [{"extra_attributes": {"LrQ63UoA": {}, "RQRLUD1P": {}, "vJr0euWd": {}}, "user_id": "FEij2Zgd"}, {"extra_attributes": {"gZuhQurT": {}, "QnQcsCu3": {}, "Qt8r9Q2F": {}}, "user_id": "1kLDGmWq"}, {"extra_attributes": {"nR0IzmP9": {}, "CGeNuIGK": {}, "XXiIgNYs": {}}, "user_id": "UcncbI11"}], "ticket_id": "pmPrzj5f"}, {"first_ticket_created_at": 7, "party_attributes": {"x3SkXoie": {}, "jHRCLH2X": {}, "xUe6beex": {}}, "party_id": "QlKlmFY5", "party_members": [{"extra_attributes": {"D7N3nquS": {}, "7qrq446h": {}, "oL1ekeYl": {}}, "user_id": "k6Qm0dL0"}, {"extra_attributes": {"25zJY9Xa": {}, "gnGVUNyB": {}, "HfL00qjO": {}}, "user_id": "ihRsv19R"}, {"extra_attributes": {"AGmNzWjJ": {}, "EVrTasQs": {}, "zXbGfFPI": {}}, "user_id": "RArQ6eo9"}], "ticket_id": "j97wXdya"}]}, {"matching_parties": [{"first_ticket_created_at": 4, "party_attributes": {"OTchw5ro": {}, "8FHVBqm5": {}, "lmV0d1t1": {}}, "party_id": "ZSLSqn6V", "party_members": [{"extra_attributes": {"WjLxBgNi": {}, "0Qa9Q65c": {}, "gZIVfaVP": {}}, "user_id": "QEEXE8oI"}, {"extra_attributes": {"XNlnXWW0": {}, "WBsFusyc": {}, "aI3jEiZd": {}}, "user_id": "DLb9caiw"}, {"extra_attributes": {"MzGQEaiX": {}, "uAgPIar1": {}, "rvCmJWKh": {}}, "user_id": "QjNRLuew"}], "ticket_id": "Ym1LRIYi"}, {"first_ticket_created_at": 17, "party_attributes": {"BZql0Z4U": {}, "um4sm8TE": {}, "5ZNXQWd8": {}}, "party_id": "dWaYvsTB", "party_members": [{"extra_attributes": {"AzNmRviv": {}, "2NOWj7UZ": {}, "n63LwVgH": {}}, "user_id": "OtT7q8hJ"}, {"extra_attributes": {"PJ6lyMGS": {}, "CBK4GHIG": {}, "JVFyyWbx": {}}, "user_id": "SgQiO8zb"}, {"extra_attributes": {"w9AXCrCT": {}, "O6a8giE0": {}, "66P8EJPt": {}}, "user_id": "40Fn7xh6"}], "ticket_id": "SwvLhOCV"}, {"first_ticket_created_at": 5, "party_attributes": {"In01NN8F": {}, "aKqFL4vy": {}, "fTX72dy1": {}}, "party_id": "KVbMNLek", "party_members": [{"extra_attributes": {"VqYMK4Um": {}, "hqLFYupD": {}, "0ZnNmzkx": {}}, "user_id": "DMb7Z0hj"}, {"extra_attributes": {"hDxr2i3p": {}, "KAmMlO7s": {}, "UhKNwGHP": {}}, "user_id": "2cxFG3Gx"}, {"extra_attributes": {"lrkltffX": {}, "MGDcSVPn": {}, "GnW76sAF": {}}, "user_id": "ZzYnwYbL"}], "ticket_id": "nfwR9oXL"}]}], "namespace": "P6eOK3lh", "party_attributes": {"vCwatGtm": {}, "orbBbkao": {}, "EF2Q3kzW": {}}, "party_id": "4EwitXzO", "queued_at": 97, "region": "nTrKE0CP", "server_name": "r7Xpz7zb", "status": "Q1XlD2uR", "ticket_id": "GdihVAy2", "updated_at": "1988-08-06T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "PIvvyKGw"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID '4h3bMhII' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 35, "userID": "XymS4kpq", "weight": 0.7887381304126445}' \
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
    --matchIDs '57uJ4h68' \
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
    --strategy 'NVwTKKxt' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'veNCfXi5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'sDkMdy8p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "IxF2wtaz", "description": "ThwOcP4Z", "findMatchTimeoutSeconds": 0, "joinable": false, "max_delay_ms": 20, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 69, "min": 89, "name": "tthOli0v"}, {"max": 59, "min": 94, "name": "I6ljB0jk"}, {"max": 40, "min": 2, "name": "kYIcmdKi"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 99, "role_flexing_second": 94}, "maxNumber": 78, "minNumber": 21, "playerMaxNumber": 35, "playerMinNumber": 88}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 4, "min": 79, "name": "Jmf3y2AU"}, {"max": 67, "min": 28, "name": "F5Xumfqq"}, {"max": 54, "min": 17, "name": "ezLqJs41"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 32, "role_flexing_second": 87}, "duration": 95, "max_number": 81, "min_number": 73, "player_max_number": 10, "player_min_number": 58}, {"combination": {"alliances": [{"max": 74, "min": 76, "name": "6xHUk39H"}, {"max": 15, "min": 43, "name": "FD1YbZGZ"}, {"max": 55, "min": 75, "name": "J4VwfdGe"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 12, "role_flexing_second": 6}, "duration": 63, "max_number": 97, "min_number": 69, "player_max_number": 81, "player_min_number": 99}, {"combination": {"alliances": [{"max": 59, "min": 20, "name": "klxTdHmE"}, {"max": 68, "min": 59, "name": "G6abFWDJ"}, {"max": 8, "min": 14, "name": "NOnyALzE"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 87, "role_flexing_second": 100}, "duration": 52, "max_number": 23, "min_number": 71, "player_max_number": 52, "player_min_number": 18}], "flexingRules": [{"attribute": "loOVl2R7", "criteria": "27TXIY2r", "duration": 23, "reference": 0.03017240915310304}, {"attribute": "NBWxHR2m", "criteria": "ipNocmb4", "duration": 100, "reference": 0.8873170619345055}, {"attribute": "g1ZVRYof", "criteria": "iuf1xz28", "duration": 31, "reference": 0.2229902405141746}], "match_options": {"options": [{"name": "hgPVKevm", "type": "arHPB0vw"}, {"name": "nuLbGrHS", "type": "5SZpp2W1"}, {"name": "8028dog8", "type": "uejxpYL2"}]}, "matchingRules": [{"attribute": "x9IExztE", "criteria": "VJN0q3XI", "reference": 0.3233145298396233}, {"attribute": "7agB1q7v", "criteria": "L7O2MdUe", "reference": 0.5555994829766433}, {"attribute": "6wtLWfaS", "criteria": "16p0eInO", "reference": 0.476193704633037}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 65, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName '4N664xcz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'tjIcSYg5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'BczLUYZ3' \
    --matchID 'PgGXVMkr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["Bn3Le2m3", "hUVGzGZD", "l5Z2eW1S"], "party_id": "g6ClZO8w", "user_id": "H4POwnlN"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName '8M96itsp' \
    --matchID 'AGeKUoqK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'baQUXrFq' \
    --matchID 'JlWBiLMo' \
    --namespace "$AB_NAMESPACE" \
    --userID 'stfG3oZi' \
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
    --channelName '6wgfh5t4' \
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