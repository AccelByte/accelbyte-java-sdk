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
    --limit '31' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "AALR371A", "description": "mySacUIJ", "find_match_timeout_seconds": 47, "game_mode": "ILYXWQhE", "joinable": false, "max_delay_ms": 86, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 69, "min": 72, "name": "rPKAKj7L"}, {"max": 40, "min": 69, "name": "7nHXfIop"}, {"max": 98, "min": 18, "name": "euPofMk3"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 39, "role_flexing_second": 17}, "max_number": 36, "min_number": 5, "player_max_number": 53, "player_min_number": 50}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 71, "min": 46, "name": "KFwhzZO0"}, {"max": 26, "min": 13, "name": "MgPo7mGQ"}, {"max": 71, "min": 65, "name": "0UjA13aL"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 80, "role_flexing_second": 29}, "duration": 50, "max_number": 28, "min_number": 88, "player_max_number": 59, "player_min_number": 44}, {"combination": {"alliances": [{"max": 39, "min": 100, "name": "fzCeGWXc"}, {"max": 66, "min": 28, "name": "O9RX4Wg0"}, {"max": 59, "min": 73, "name": "y628EVli"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 31, "role_flexing_second": 44}, "duration": 49, "max_number": 32, "min_number": 59, "player_max_number": 49, "player_min_number": 58}, {"combination": {"alliances": [{"max": 48, "min": 12, "name": "BhbxDD7B"}, {"max": 97, "min": 77, "name": "Xk6QPv2T"}, {"max": 89, "min": 26, "name": "H1XTa1j4"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 86}, "duration": 61, "max_number": 59, "min_number": 49, "player_max_number": 49, "player_min_number": 63}], "flexing_rule": [{"attribute": "h8jI5cWD", "criteria": "JaF1s7l8", "duration": 25, "reference": 0.9217205781868726}, {"attribute": "nZakhx43", "criteria": "KgEsQ8yY", "duration": 1, "reference": 0.9190643431672532}, {"attribute": "WTLVoz88", "criteria": "N0HOxZCz", "duration": 12, "reference": 0.37935604534709044}], "match_options": {"options": [{"name": "HhfDvNzL", "type": "kOuxFvxv"}, {"name": "lfFWjaWA", "type": "HVGXH257"}, {"name": "zJZ3MzB9", "type": "lHV5QeYH"}]}, "matching_rule": [{"attribute": "oeieOQGU", "criteria": "uXhesfnp", "reference": 0.6802807866378368}, {"attribute": "wpzy74Dw", "criteria": "EvMtTPIe", "reference": 0.7582809857941315}, {"attribute": "zMRuOU3j", "criteria": "uuJ7wtRz", "reference": 0.3249995330351786}], "rebalance_enable": true, "sub_game_modes": {"ZDbHm0Jo": {"alliance": {"combination": {"alliances": [{"max": 7, "min": 21, "name": "Hko6xnEZ"}, {"max": 46, "min": 18, "name": "sWf9Y6in"}, {"max": 14, "min": 72, "name": "N1GhbIQP"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 85, "role_flexing_second": 25}, "max_number": 68, "min_number": 21, "player_max_number": 96, "player_min_number": 62}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 92, "min": 16, "name": "PReCphmw"}, {"max": 84, "min": 8, "name": "qeK4Ug3Y"}, {"max": 76, "min": 93, "name": "rJlzjRgV"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 41, "role_flexing_second": 91}, "duration": 18, "max_number": 21, "min_number": 61, "player_max_number": 70, "player_min_number": 30}, {"combination": {"alliances": [{"max": 76, "min": 82, "name": "b4zcoM1x"}, {"max": 89, "min": 18, "name": "8DKCSlz2"}, {"max": 8, "min": 58, "name": "tkNngzeo"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 27, "role_flexing_second": 51}, "duration": 18, "max_number": 61, "min_number": 35, "player_max_number": 28, "player_min_number": 59}, {"combination": {"alliances": [{"max": 85, "min": 35, "name": "6WJ1DsVf"}, {"max": 60, "min": 64, "name": "gmgtEunM"}, {"max": 20, "min": 53, "name": "MFQQJVGj"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 26, "role_flexing_second": 79}, "duration": 17, "max_number": 62, "min_number": 64, "player_max_number": 74, "player_min_number": 51}], "name": "kbJNraCZ"}, "5u1ijZtL": {"alliance": {"combination": {"alliances": [{"max": 17, "min": 53, "name": "bzIKVUYs"}, {"max": 41, "min": 31, "name": "frKQ4ePP"}, {"max": 7, "min": 17, "name": "0PtpJpSS"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 4, "role_flexing_second": 61}, "max_number": 60, "min_number": 74, "player_max_number": 51, "player_min_number": 81}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 20, "min": 95, "name": "zA1XBuDp"}, {"max": 94, "min": 94, "name": "U5qLTc07"}, {"max": 94, "min": 3, "name": "O8sjhAkZ"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 5, "role_flexing_second": 92}, "duration": 54, "max_number": 88, "min_number": 52, "player_max_number": 12, "player_min_number": 23}, {"combination": {"alliances": [{"max": 19, "min": 30, "name": "YwZi6FCF"}, {"max": 59, "min": 39, "name": "rTD3K32f"}, {"max": 40, "min": 57, "name": "9tONHD1M"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 63, "role_flexing_second": 65}, "duration": 85, "max_number": 48, "min_number": 71, "player_max_number": 19, "player_min_number": 53}, {"combination": {"alliances": [{"max": 99, "min": 36, "name": "fVdJ1hK0"}, {"max": 100, "min": 34, "name": "bNPQmPgj"}, {"max": 93, "min": 37, "name": "uTMUloBn"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 24, "role_flexing_second": 89}, "duration": 42, "max_number": 92, "min_number": 87, "player_max_number": 8, "player_min_number": 77}], "name": "7vVEmfSF"}, "bpoKkTDA": {"alliance": {"combination": {"alliances": [{"max": 39, "min": 84, "name": "Ql3FQQt9"}, {"max": 74, "min": 80, "name": "4k0pTcHK"}, {"max": 13, "min": 67, "name": "zfZL3kCM"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 55, "role_flexing_second": 61}, "max_number": 54, "min_number": 25, "player_max_number": 70, "player_min_number": 15}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 33, "min": 22, "name": "y1EXaT0m"}, {"max": 58, "min": 4, "name": "XRJky9FT"}, {"max": 95, "min": 2, "name": "eVIj3Hv7"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 21, "role_flexing_second": 88}, "duration": 40, "max_number": 94, "min_number": 22, "player_max_number": 26, "player_min_number": 77}, {"combination": {"alliances": [{"max": 41, "min": 25, "name": "vWvF5BZx"}, {"max": 94, "min": 31, "name": "iZKebCfO"}, {"max": 17, "min": 12, "name": "bSgRFyki"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 47, "role_flexing_second": 77}, "duration": 57, "max_number": 61, "min_number": 34, "player_max_number": 100, "player_min_number": 13}, {"combination": {"alliances": [{"max": 6, "min": 30, "name": "Jxt1unjN"}, {"max": 45, "min": 67, "name": "cd3cmsAX"}, {"max": 84, "min": 29, "name": "BrLamuYf"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 3, "role_flexing_second": 14}, "duration": 72, "max_number": 21, "min_number": 6, "player_max_number": 61, "player_min_number": 50}], "name": "IxKwOBx3"}}}, "session_queue_timeout_seconds": 64, "social_matchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'SkwXymHX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Ji7Rw1Ae", "players": [{"results": [{"attribute": "s6EcZ9lB", "value": 0.4695240327783998}, {"attribute": "fGFBDGOr", "value": 0.8311933707786083}, {"attribute": "J0IeAj2G", "value": 0.18974145849395263}], "user_id": "fveXIkbA"}, {"results": [{"attribute": "SMIYetPA", "value": 0.6082656542344259}, {"attribute": "6ieIcfGM", "value": 0.7148373766612889}, {"attribute": "rYAoevjK", "value": 0.902448101794932}], "user_id": "h2KWJsKb"}, {"results": [{"attribute": "Ow0PwiEb", "value": 0.20455732757915124}, {"attribute": "Qxs8hwIW", "value": 0.6250496189844901}, {"attribute": "8osursYU", "value": 0.5859254072553634}], "user_id": "nFKzMRSr"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "9ONKhY4D"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "3xY9aihi", "client_version": "3LumTrAI", "deployment": "hVdtAkb4", "error_code": 12, "error_message": "D7WMlErF", "game_mode": "sY687gG2", "joinable": false, "match_id": "VMjULY2v", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 55, "party_attributes": {"KeWUNkLB": {}, "Q54mNwkn": {}, "mBOgF8z3": {}}, "party_id": "kxIVqyri", "party_members": [{"extra_attributes": {"waEHthzV": {}, "RuouFw1V": {}, "kwIMqaDf": {}}, "user_id": "mdgIlGJ9"}, {"extra_attributes": {"kuClGIVa": {}, "3nf5eeYk": {}, "2bXEnvJ4": {}}, "user_id": "3pBa7ceA"}, {"extra_attributes": {"OT3RUJa4": {}, "Y4KlNsO1": {}, "mwk3yPpS": {}}, "user_id": "LbiA2DBJ"}], "ticket_id": "e7JQ7RvC"}, {"first_ticket_created_at": 15, "party_attributes": {"uvhhDC3X": {}, "9m43OUXf": {}, "SnjYAS5Y": {}}, "party_id": "xEbBKLOj", "party_members": [{"extra_attributes": {"CX7W54Tk": {}, "clnh8gCG": {}, "iZDVKR9M": {}}, "user_id": "arC30Xkv"}, {"extra_attributes": {"mHG3r6eg": {}, "nfsQke5F": {}, "kyblJxbP": {}}, "user_id": "gmMmrmHz"}, {"extra_attributes": {"1cY9o8pa": {}, "DMM1zm4h": {}, "ui9HgFbQ": {}}, "user_id": "ZyzeVVJf"}], "ticket_id": "esxRTV6X"}, {"first_ticket_created_at": 88, "party_attributes": {"vcPktkrF": {}, "P5dWaGxI": {}, "XNl5qirz": {}}, "party_id": "CxNMA8GQ", "party_members": [{"extra_attributes": {"NG3Iug0t": {}, "IMoOADX7": {}, "TZIPPd4L": {}}, "user_id": "4fiK2eK7"}, {"extra_attributes": {"7GwcpFjr": {}, "mcU9j4lH": {}, "QjDApFlf": {}}, "user_id": "fjU8Za7Q"}, {"extra_attributes": {"K2TYC35y": {}, "T6Qoi8VD": {}, "CzwT3hX4": {}}, "user_id": "sA0g5lWB"}], "ticket_id": "dPUn0CE7"}]}, {"matching_parties": [{"first_ticket_created_at": 40, "party_attributes": {"R5LVju25": {}, "SrNXoWoM": {}, "TMmYNfuw": {}}, "party_id": "58mDjiHn", "party_members": [{"extra_attributes": {"rzaE9TEC": {}, "BOhhcZfB": {}, "KBUq3BsW": {}}, "user_id": "fWGuHcYY"}, {"extra_attributes": {"HInJRZTX": {}, "zcpPzaIn": {}, "YuARTUo4": {}}, "user_id": "6wSDxCbT"}, {"extra_attributes": {"Tp3SiXal": {}, "YvVJtTCe": {}, "Z0GpkLln": {}}, "user_id": "mJb1a2hq"}], "ticket_id": "NwKDbATr"}, {"first_ticket_created_at": 2, "party_attributes": {"urq83c3h": {}, "z1mQzZVm": {}, "QEIpXMPX": {}}, "party_id": "3AfSnLk2", "party_members": [{"extra_attributes": {"E4QXmTXL": {}, "Jp5IcJ8C": {}, "BKzPOIh4": {}}, "user_id": "2Fb57VLN"}, {"extra_attributes": {"elhsB5n6": {}, "t7rZEVZE": {}, "8dwstk2h": {}}, "user_id": "zpSUgmsO"}, {"extra_attributes": {"MbYQsQLD": {}, "RIgTOqJI": {}, "qp2j9BB9": {}}, "user_id": "cpjMNSaV"}], "ticket_id": "xaqlSDEl"}, {"first_ticket_created_at": 80, "party_attributes": {"UYhBNdfi": {}, "MLmAL9Q7": {}, "jNs51o0j": {}}, "party_id": "VrMlc8oj", "party_members": [{"extra_attributes": {"cZOY7ce5": {}, "hdldXRWs": {}, "qG3Fvrs5": {}}, "user_id": "H4TdEcd5"}, {"extra_attributes": {"UXUQpGZa": {}, "ljz7SSS2": {}, "krUyzCQB": {}}, "user_id": "OIM3U2Ur"}, {"extra_attributes": {"SCQn3b4y": {}, "DZMZRRoh": {}, "NQwb8Wwk": {}}, "user_id": "LXlYsUW2"}], "ticket_id": "69I7nkys"}]}, {"matching_parties": [{"first_ticket_created_at": 75, "party_attributes": {"kuW7lGLs": {}, "GuK5E9kl": {}, "aL8b7KhJ": {}}, "party_id": "ts16cTWl", "party_members": [{"extra_attributes": {"XlMXg6yC": {}, "ONdUqO0d": {}, "SFyLBUHF": {}}, "user_id": "yCfu5q8n"}, {"extra_attributes": {"HiU9Q2VH": {}, "Tsx5fzrA": {}, "rmK3luay": {}}, "user_id": "B6Yrdloi"}, {"extra_attributes": {"h5tQEDMS": {}, "lwMX5tSb": {}, "VKL4I45S": {}}, "user_id": "DbjmQOkY"}], "ticket_id": "RidZaVmJ"}, {"first_ticket_created_at": 90, "party_attributes": {"hhsOWDOs": {}, "L8o9KWs7": {}, "mdCLrhRu": {}}, "party_id": "iqU4TG7g", "party_members": [{"extra_attributes": {"CephhKQq": {}, "UyxBLm47": {}, "06umqjDe": {}}, "user_id": "vGg8QKjp"}, {"extra_attributes": {"BEh8Rh2S": {}, "SF6AfqZA": {}, "xxswbHwz": {}}, "user_id": "RMICSeDQ"}, {"extra_attributes": {"60QLxlZ7": {}, "GRtPZhmT": {}, "pYj3cyuY": {}}, "user_id": "z9XZ3qeP"}], "ticket_id": "N37pqmlC"}, {"first_ticket_created_at": 41, "party_attributes": {"5IHTILU6": {}, "SGCm20mW": {}, "xGt4in1o": {}}, "party_id": "Gexh0r9t", "party_members": [{"extra_attributes": {"vnDYHc4O": {}, "uoIN8PxQ": {}, "VyKzQRZ7": {}}, "user_id": "lMHrdr3m"}, {"extra_attributes": {"ydUIK0rt": {}, "jUlZVLf9": {}, "cN4Yt9dw": {}}, "user_id": "BeHotdX0"}, {"extra_attributes": {"6G4d60op": {}, "3nM7o578": {}, "rq2xB5yl": {}}, "user_id": "H1ONxgEJ"}], "ticket_id": "wmU0by1g"}]}], "namespace": "fSpHvKoN", "party_attributes": {"nhwjwrxV": {}, "YyZus0dm": {}, "UjFr0gNN": {}}, "party_id": "sOhREMzE", "queued_at": 47, "region": "KzRei8pE", "server_name": "taDmuAzn", "status": "BnxaBA8k", "ticket_id": "AKYKMzk7", "updated_at": "1974-04-23T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "24DWCsAI"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'hMrjPk3U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 53, "userID": "1CS1kPAr", "weight": 0.03733348231499467}' \
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
    --matchIDs 'SMzyPynz' \
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
    --strategy 'd4ZJ7esm' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'kZDPAP9x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'YU8e5zoU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "C4nRz8Zw", "description": "qMmlWuhi", "findMatchTimeoutSeconds": 86, "joinable": true, "max_delay_ms": 98, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 53, "min": 7, "name": "evmdGk69"}, {"max": 99, "min": 39, "name": "N5x3IWHS"}, {"max": 15, "min": 60, "name": "lDXhrM5L"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 94, "role_flexing_second": 28}, "maxNumber": 25, "minNumber": 38, "playerMaxNumber": 11, "playerMinNumber": 16}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 99, "min": 79, "name": "z8irFH9H"}, {"max": 88, "min": 34, "name": "LIxEB2y6"}, {"max": 25, "min": 71, "name": "4Pf8XVB8"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 84, "role_flexing_second": 41}, "duration": 60, "max_number": 33, "min_number": 41, "player_max_number": 56, "player_min_number": 52}, {"combination": {"alliances": [{"max": 1, "min": 62, "name": "81BbSsqg"}, {"max": 26, "min": 64, "name": "jX5fEmZx"}, {"max": 31, "min": 69, "name": "CrSu9GxN"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 38, "role_flexing_second": 74}, "duration": 50, "max_number": 79, "min_number": 79, "player_max_number": 12, "player_min_number": 73}, {"combination": {"alliances": [{"max": 19, "min": 34, "name": "DtskJct9"}, {"max": 48, "min": 72, "name": "2BG9l4ke"}, {"max": 24, "min": 21, "name": "nGaSsREV"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 100, "role_flexing_second": 63}, "duration": 65, "max_number": 41, "min_number": 5, "player_max_number": 9, "player_min_number": 71}], "flexingRules": [{"attribute": "TapAls0c", "criteria": "bXVbRXh1", "duration": 49, "reference": 0.17442850466797}, {"attribute": "bdfbptyU", "criteria": "xZLXC0yk", "duration": 73, "reference": 0.6754770239627681}, {"attribute": "UP9AJfTs", "criteria": "td68GGTj", "duration": 52, "reference": 0.6448476668168794}], "match_options": {"options": [{"name": "pRBdXxSv", "type": "lAhscIRd"}, {"name": "nUBiuWY8", "type": "3jVyqz2F"}, {"name": "JGJmBqdg", "type": "jnUNtDYL"}]}, "matchingRules": [{"attribute": "iFz9LLF1", "criteria": "Xfg0UGt4", "reference": 0.7967241350609173}, {"attribute": "j45kaqDP", "criteria": "JFVBRVSR", "reference": 0.8577021775576735}, {"attribute": "IBXhGNA8", "criteria": "A3X9yyZN", "reference": 0.3768720073740327}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 64, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'OsUgpjLl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'qSTJmb7Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'HjvIRzR3' \
    --matchID 'ZQ7i07j0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["uDtd7CxN", "yN1zWxAi", "S29UpekK"], "party_id": "ycfMH6v2", "user_id": "XriP69Oh"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'l2y8WoMq' \
    --matchID 'xkgTNlYj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '3kOM76xN' \
    --matchID 'lAx473DD' \
    --namespace "$AB_NAMESPACE" \
    --userID 'dOAkUiTS' \
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
    --channelName 'Smt3TOp6' \
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