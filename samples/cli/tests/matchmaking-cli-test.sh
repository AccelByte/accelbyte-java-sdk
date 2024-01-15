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
echo "1..39"

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
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "wYCA9kPI6LZrkq6D", "description": "c09nIW0Oaiw9B0D7", "find_match_timeout_seconds": 9, "game_mode": "ktQG0h5JAav5kRa6", "joinable": false, "max_delay_ms": 29, "region_expansion_range_ms": 51, "region_expansion_rate_ms": 31, "region_latency_initial_range_ms": 56, "region_latency_max_ms": 72, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 68, "name": "8SAMTwE6I56IaRDB"}, {"max": 2, "min": 49, "name": "gorQeFbQ1g7qbPng"}, {"max": 95, "min": 31, "name": "NB1vRodwpzS6DaDp"}], [{"max": 44, "min": 73, "name": "N7ZQVqGj6oDLjWjk"}, {"max": 21, "min": 69, "name": "aXlFcDtgOjchIua5"}, {"max": 40, "min": 4, "name": "WEIC32ogW7olvbTg"}], [{"max": 36, "min": 58, "name": "hRTcPiSuL0Sly6XM"}, {"max": 50, "min": 83, "name": "E3cwyALczNIicXm7"}, {"max": 0, "min": 100, "name": "gSrjJW2OQNOs1PXh"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 17}, "max_number": 84, "min_number": 89, "player_max_number": 16, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 57, "name": "7oFgx4c8OumKtPDK"}, {"max": 74, "min": 62, "name": "DXn7Z4U68su8Xfql"}, {"max": 34, "min": 63, "name": "NiTvB6SdAdIhUDrw"}], [{"max": 29, "min": 39, "name": "Z5MecdKi5r6QEa1y"}, {"max": 38, "min": 9, "name": "LEzth6mXhzkzWkFe"}, {"max": 7, "min": 90, "name": "dSpHt0P7MIIR7Cky"}], [{"max": 66, "min": 40, "name": "6C7duuyZ0GhDogqr"}, {"max": 16, "min": 51, "name": "BRd8lDR6qVNPRZYd"}, {"max": 65, "min": 90, "name": "LIAjGGJddVCvu9vx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 22}, "duration": 76, "max_number": 75, "min_number": 66, "player_max_number": 79, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 91, "min": 70, "name": "0lyuI9a2I9u6Vpbs"}, {"max": 47, "min": 21, "name": "5w8hqUI06UpOXGSL"}, {"max": 25, "min": 96, "name": "CVuHOPlLlkvR8sKg"}], [{"max": 28, "min": 47, "name": "uRkgghGoYupD391C"}, {"max": 49, "min": 33, "name": "D6SCwGrncqmLtjQH"}, {"max": 54, "min": 25, "name": "f8TgoNm03VLisV6z"}], [{"max": 46, "min": 97, "name": "Puo3td6TC6I3lMjG"}, {"max": 91, "min": 39, "name": "WN2laRlxfcjHfYak"}, {"max": 95, "min": 3, "name": "CTqGkE7wcWfDslpJ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 40}, "duration": 55, "max_number": 77, "min_number": 85, "player_max_number": 88, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 18, "min": 50, "name": "ZMdjxcBZufQxGiHP"}, {"max": 24, "min": 86, "name": "lG4cYEzfTD1ZBm3M"}, {"max": 33, "min": 84, "name": "HcUmLZZbSqb8RwNm"}], [{"max": 27, "min": 59, "name": "9HrNQy4uZAAiE0mi"}, {"max": 39, "min": 91, "name": "9RGCCHYzUOcEdscK"}, {"max": 69, "min": 13, "name": "PEqgA8yu7Vk6Jt4Y"}], [{"max": 25, "min": 16, "name": "os9Jcdos4fYcTVU6"}, {"max": 90, "min": 25, "name": "Bt0zYoMcHyCUEXlA"}, {"max": 44, "min": 77, "name": "xJMdalwSyliWMNW5"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 41, "role_flexing_second": 33}, "duration": 39, "max_number": 79, "min_number": 23, "player_max_number": 56, "player_min_number": 98}], "batch_size": 68, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 16, "flex_flat_step_range": 72, "flex_immunity_count": 58, "flex_range_max": 61, "flex_rate_ms": 92, "flex_step_max": 70, "force_authority_match": false, "initial_step_range": 60, "mmr_max": 3, "mmr_mean": 86, "mmr_min": 99, "mmr_std_dev": 86, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "lNmqRBaAkLnvxkT1", "criteria": "X68cmDc3fxU8MyKr", "duration": 88, "reference": 0.8452748898931911}, {"attribute": "v52Dlym6puQ23xoJ", "criteria": "8aeCnaLpUKp44YUD", "duration": 20, "reference": 0.24185924236642597}, {"attribute": "WvXa3bMrXsDr6kIL", "criteria": "sSSyDdmykmoPYgc2", "duration": 76, "reference": 0.01667587390248748}], "match_options": {"options": [{"name": "N9oCMNqq98SjTvhZ", "type": "NkSQ70D0H6BXksUC"}, {"name": "9b6i5lZC9xv32e8c", "type": "5csSovoqsZNBdte9"}, {"name": "NDUPVJf6c2Z0QZxf", "type": "gPubTDIHrvqAThuw"}]}, "matching_rule": [{"attribute": "jRHpKKTlmVr9XuoJ", "criteria": "bRFQSKVPHbn4Xxtu", "reference": 0.9639977895854788}, {"attribute": "LQRENjEEztx1WsYS", "criteria": "iZqan0nSBJroav91", "reference": 0.5171230937144093}, {"attribute": "XlvPG6bFYReVHQip", "criteria": "cCx9Zw5D2L7vIYhG", "reference": 0.5235086363368513}], "rebalance_enable": false, "sort_ticket": {"search_result": "oldestTicketAge", "ticket_queue": "random"}, "sort_tickets": [{"search_result": "oldestTicketAge", "threshold": 87, "ticket_queue": "none"}, {"search_result": "none", "threshold": 68, "ticket_queue": "random"}, {"search_result": "random", "threshold": 81, "ticket_queue": "distance"}], "sub_game_modes": {"e4mhgo5QB65lSAiY": {"alliance": {"combination": {"alliances": [[{"max": 27, "min": 31, "name": "NjkfZrQvGgbLdLsF"}, {"max": 51, "min": 74, "name": "HkBMr1yrOMlNFSrU"}, {"max": 63, "min": 18, "name": "f7Gc26SaiGVkydwY"}], [{"max": 99, "min": 5, "name": "QG26yUZNmTBcvrbY"}, {"max": 59, "min": 60, "name": "wZtxFHyPLtI8ilby"}, {"max": 60, "min": 5, "name": "PUIj88cekdqCt81P"}], [{"max": 68, "min": 21, "name": "dNzDmeIP6rOvDz9K"}, {"max": 83, "min": 25, "name": "sb392k6YmJFfRByj"}, {"max": 24, "min": 56, "name": "a9LJE8HoRS1X2PFA"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 80, "role_flexing_second": 22}, "max_number": 47, "min_number": 59, "player_max_number": 51, "player_min_number": 26}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 68, "min": 57, "name": "PxB1UskYs4Yw20DO"}, {"max": 34, "min": 92, "name": "OBSC2DKHRuPMMWH8"}, {"max": 25, "min": 4, "name": "qRRbceJ5i0EeDxOg"}], [{"max": 55, "min": 8, "name": "nhhqElIaDml48wdN"}, {"max": 65, "min": 93, "name": "LTm5T50x9WT0GfH2"}, {"max": 36, "min": 41, "name": "tOa4EXsXzOXQAk4m"}], [{"max": 33, "min": 40, "name": "rxzTtuLl4XlbGL8Q"}, {"max": 84, "min": 60, "name": "xtjzm8y2wNhmwoYZ"}, {"max": 50, "min": 59, "name": "I4EFZKBcYrCEAE7W"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 10, "role_flexing_second": 25}, "duration": 15, "max_number": 48, "min_number": 46, "player_max_number": 70, "player_min_number": 82}, {"combination": {"alliances": [[{"max": 34, "min": 77, "name": "31A806DJgas4b6z3"}, {"max": 77, "min": 42, "name": "NUj7fdgLA84Z8YYk"}, {"max": 58, "min": 88, "name": "pnduEEQlULdJz4mn"}], [{"max": 88, "min": 30, "name": "BkMNxvvKgAT8mJrY"}, {"max": 33, "min": 70, "name": "6hRkloqxM3gpwxcf"}, {"max": 79, "min": 18, "name": "y9XzjjI5YbsKoADk"}], [{"max": 52, "min": 37, "name": "JEN2VHzih3bit0VW"}, {"max": 28, "min": 16, "name": "3CO39PXDNxtXgeO3"}, {"max": 64, "min": 83, "name": "gkXhjDzaQY3snn2Z"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 85, "role_flexing_second": 55}, "duration": 61, "max_number": 4, "min_number": 79, "player_max_number": 65, "player_min_number": 80}, {"combination": {"alliances": [[{"max": 8, "min": 54, "name": "P43e5dC9XIBudfZg"}, {"max": 35, "min": 1, "name": "bHDIDm4hMzF4Txod"}, {"max": 8, "min": 39, "name": "nSrUTvfqU0bfoMm5"}], [{"max": 5, "min": 20, "name": "TtFWbotQyXJRcQWs"}, {"max": 25, "min": 44, "name": "qPNs92epxk0i8Vxs"}, {"max": 82, "min": 57, "name": "ereSvf9699mCEHTh"}], [{"max": 95, "min": 88, "name": "JkETAsSp7gh4TeUT"}, {"max": 20, "min": 3, "name": "OkAYfJB8AT9t4Tv2"}, {"max": 73, "min": 91, "name": "Y2QD3oD5fLCr3OOl"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 47}, "duration": 58, "max_number": 68, "min_number": 64, "player_max_number": 67, "player_min_number": 3}], "name": "uYnGzpipNDigNJma"}, "1MbqqZtfNWql4nmw": {"alliance": {"combination": {"alliances": [[{"max": 54, "min": 21, "name": "ft4gqkNNlWkD9eOz"}, {"max": 17, "min": 49, "name": "RFOn0jJLHC9LxhvN"}, {"max": 82, "min": 94, "name": "ww3HICQLfl7MUBG7"}], [{"max": 34, "min": 25, "name": "tPu64yAtURKLRkb7"}, {"max": 84, "min": 69, "name": "TF6oQAXVG7tnsZg5"}, {"max": 86, "min": 16, "name": "gXjvyGJPN4eXbJE5"}], [{"max": 97, "min": 75, "name": "s2GcyomQoIXimBJe"}, {"max": 16, "min": 89, "name": "yxlNsjUgxBkF6wFP"}, {"max": 29, "min": 91, "name": "JeQediogEhhM2rIi"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 56, "role_flexing_second": 75}, "max_number": 68, "min_number": 43, "player_max_number": 96, "player_min_number": 83}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 86, "name": "rDzZSKscfOcYu3dp"}, {"max": 59, "min": 22, "name": "ROYqUiGKXVFCmpo6"}, {"max": 38, "min": 0, "name": "PwVOEDSJsEK5QpNh"}], [{"max": 24, "min": 25, "name": "I2iS5EpGhhvXYck0"}, {"max": 41, "min": 32, "name": "QM0NBMA9ORxpzwLR"}, {"max": 2, "min": 54, "name": "u1bNCtX7W40V6Do5"}], [{"max": 37, "min": 67, "name": "YadCCFrHHC3DpZxk"}, {"max": 37, "min": 35, "name": "QDXuNFviMarv8mnf"}, {"max": 69, "min": 89, "name": "K8CCmE2lPnsbD3SG"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 25}, "duration": 23, "max_number": 47, "min_number": 79, "player_max_number": 42, "player_min_number": 16}, {"combination": {"alliances": [[{"max": 96, "min": 0, "name": "ccE536ugBp3HBvep"}, {"max": 28, "min": 41, "name": "DCjgyJlXe36mgWjL"}, {"max": 11, "min": 64, "name": "09xbnGezKsDwG2om"}], [{"max": 83, "min": 89, "name": "5tVg8JqU0jZpjvsu"}, {"max": 13, "min": 10, "name": "AOS7u8RiWyerCSa8"}, {"max": 91, "min": 56, "name": "RgwsAj1ik1jglaDX"}], [{"max": 93, "min": 12, "name": "vKCWwNTAhd2wrS0u"}, {"max": 84, "min": 40, "name": "djhdinpng5BLy8wb"}, {"max": 15, "min": 31, "name": "MssAHjapIkY9Rf4w"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 65}, "duration": 81, "max_number": 87, "min_number": 89, "player_max_number": 2, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 27, "min": 6, "name": "bCtmKy8M9zVrjfGX"}, {"max": 28, "min": 38, "name": "qAQUoY1GjlIIk0iK"}, {"max": 29, "min": 59, "name": "TTS1j02o7JjTXAQN"}], [{"max": 34, "min": 6, "name": "ccLjMXJRk0eaKQDO"}, {"max": 74, "min": 48, "name": "vrTefglSs6g4iY9u"}, {"max": 44, "min": 0, "name": "aCNYIWekp18lOC3m"}], [{"max": 81, "min": 78, "name": "qF7Bl0LcghVHfPEs"}, {"max": 32, "min": 57, "name": "xwhRON0bc1eMbEIj"}, {"max": 29, "min": 64, "name": "wLqc3ecjXJbZDKKo"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 47, "role_flexing_second": 60}, "duration": 31, "max_number": 50, "min_number": 6, "player_max_number": 26, "player_min_number": 39}], "name": "pai0rYaT5hOPjaf3"}, "H0tYighU0VUfcYHJ": {"alliance": {"combination": {"alliances": [[{"max": 2, "min": 63, "name": "BfAKSiPW3VgsZXiR"}, {"max": 93, "min": 59, "name": "ej52WKi6tArAURt9"}, {"max": 32, "min": 64, "name": "lCSVq8PdH6hJPUAc"}], [{"max": 61, "min": 90, "name": "uAXI66bQ71w0deoV"}, {"max": 88, "min": 77, "name": "i6BqPg4xr0lCancU"}, {"max": 51, "min": 66, "name": "vSZIPkhSgORcz5S5"}], [{"max": 56, "min": 50, "name": "vmgBLxh4ijFnE3Ta"}, {"max": 26, "min": 79, "name": "9qSZ7PC6f6QkmZXE"}, {"max": 24, "min": 7, "name": "W9YfRSse6AAz3S4c"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 87}, "max_number": 57, "min_number": 75, "player_max_number": 89, "player_min_number": 64}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 82, "min": 24, "name": "PYuG6XqP6oo7G73z"}, {"max": 6, "min": 9, "name": "xTgOfnwIdlNa29fD"}, {"max": 77, "min": 15, "name": "h741IslKHzGlLKWU"}], [{"max": 40, "min": 68, "name": "DQs61OQAoxyyQpRW"}, {"max": 59, "min": 80, "name": "iiPDGQhNPEwiJCf2"}, {"max": 40, "min": 73, "name": "nkY6Mca5afj12K2I"}], [{"max": 51, "min": 22, "name": "rBvvWm4udE0OXudX"}, {"max": 13, "min": 22, "name": "Nne8kJATwlc6esUp"}, {"max": 98, "min": 91, "name": "6xnZ5Jrzzjrcaug6"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 97}, "duration": 75, "max_number": 67, "min_number": 28, "player_max_number": 0, "player_min_number": 92}, {"combination": {"alliances": [[{"max": 21, "min": 100, "name": "noed9DHhLOqQGhCU"}, {"max": 35, "min": 21, "name": "iTrjyEgarAdNJOIG"}, {"max": 97, "min": 38, "name": "I6tRbRcrEveMdAdi"}], [{"max": 85, "min": 94, "name": "KDUVSC00PYeDcagg"}, {"max": 18, "min": 70, "name": "nxnFIna3yddcbsPh"}, {"max": 8, "min": 84, "name": "TH26IUJNvYuGRUvp"}], [{"max": 1, "min": 69, "name": "A3PrIfapq5AAeMe4"}, {"max": 76, "min": 26, "name": "3mDWORBVXTIIJM9X"}, {"max": 38, "min": 1, "name": "YIIZxiXNMR9BgaWc"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 39}, "duration": 96, "max_number": 66, "min_number": 56, "player_max_number": 27, "player_min_number": 14}, {"combination": {"alliances": [[{"max": 25, "min": 50, "name": "yo5JJTUVmb8GEXFT"}, {"max": 24, "min": 54, "name": "EMEsFzYqwgK1Np5n"}, {"max": 30, "min": 7, "name": "dqpLm7FhJBNXzAFd"}], [{"max": 84, "min": 81, "name": "Khqf6kiTdSGv2LFj"}, {"max": 54, "min": 47, "name": "KY7CbgsWqFWZX7kP"}, {"max": 56, "min": 84, "name": "om8F9GLLTG8phc3n"}], [{"max": 65, "min": 16, "name": "MbAG9YI89hmguB8F"}, {"max": 83, "min": 93, "name": "WGRaoQomSJC4DdrK"}, {"max": 64, "min": 39, "name": "7SUQPLG59e0k5ZtX"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 74}, "duration": 46, "max_number": 98, "min_number": 85, "player_max_number": 8, "player_min_number": 32}], "name": "MK6MbGIVIu8vvwLc"}}, "ticket_flexing_selection": "pivot", "ticket_flexing_selections": [{"selection": "random", "threshold": 41}, {"selection": "oldest", "threshold": 30}, {"selection": "newest", "threshold": 93}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 39, "social_matchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'rQzP4zvtdxdbZUpd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel '6FJtHJ1pyVwyKQLY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "6FEO65Rb3z7CYLM8", "players": [{"results": [{"attribute": "IlsHqffnrfsGlfPa", "value": 0.833825142019673}, {"attribute": "KBwa3Ddb60ufPpzw", "value": 0.1480328759912779}, {"attribute": "1QGIFmlVf4jvapse", "value": 0.49876013250941786}], "user_id": "9LN9bvhOrHflIOd6"}, {"results": [{"attribute": "X3viLvtEk4mTIpUA", "value": 0.9849798872218339}, {"attribute": "gxo8SV38nEhoXmM2", "value": 0.7877075516628383}, {"attribute": "7l6jHMA2rG3nakop", "value": 0.43467633965292096}], "user_id": "ywelu01nryEJ0Nqo"}, {"results": [{"attribute": "Tow0qiOiC4j0iktm", "value": 0.8491578603681991}, {"attribute": "ZPLkLOsp0LZ5njN8", "value": 0.949860147176814}, {"attribute": "Hl8kUXzt6bSc6bWv", "value": 0.10634055433237155}], "user_id": "pVyW9dD1kOmvrAej"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "cq2LgkQuaS7RBx3v"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "im02jBOxrZDyvpcL", "client_version": "YOWA8NjxOnaEok4n", "deployment": "OOCzfsflhjbngJOU", "error_code": 27, "error_message": "8paOJtxqMPpcVfRw", "game_mode": "Nj547fH0XrKEDpEY", "is_mock": "8VnocGAjci0V3tBf", "joinable": false, "match_id": "J3sWCqQpQ2FbKPFM", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 50, "party_attributes": {"ljhZ2jxLRX3z46OC": {}, "aGBeMfPlNos4yBRj": {}, "rERHEonAZR8GmEu0": {}}, "party_id": "q1p6QCyY6vSkVFWd", "party_members": [{"extra_attributes": {"sbYuVEGVxYheR3j5": {}, "mNZ6vwv7K8Asvt1j": {}, "1Rx59hesNWy2NvZ8": {}}, "user_id": "5DDKDAF8KDsBZOuY"}, {"extra_attributes": {"QJ03BAHZ7c53q7ak": {}, "Mpcmnnx6RVBrop9v": {}, "7aZK3h65hbN15zfQ": {}}, "user_id": "SfQrtfF3TQN0OcND"}, {"extra_attributes": {"Lr36vzohZyjMQAg5": {}, "mPYhrLTyU8OhgfY9": {}, "JQYGF4bYXEcENx9x": {}}, "user_id": "ZlAchob44lONDDwM"}], "ticket_created_at": 44, "ticket_id": "jfIGaffoflEIByYq"}, {"first_ticket_created_at": 8, "party_attributes": {"6xG2mXEQdbzIVy8a": {}, "lncV7vWgSHdfo07U": {}, "ctPErqxyMyOK06Mq": {}}, "party_id": "QBErxgjVBycvU4Pb", "party_members": [{"extra_attributes": {"mRDcrg0DjQjBECXv": {}, "ea7H1m2lJFRZ3Zpr": {}, "Z60zMjhTHeh94TSe": {}}, "user_id": "nE5hCFkIf5weqZ18"}, {"extra_attributes": {"MH57l2Zsrh90ETtY": {}, "mGukz3MnlrjcHp6B": {}, "8Vj7rXFgDnDkdZ9b": {}}, "user_id": "pjb1tdA3QhjCMW64"}, {"extra_attributes": {"f4XhIjSoTB2NMKte": {}, "zapPr2QEPx3zTxBG": {}, "tEJIYppuUSsKoHw2": {}}, "user_id": "hyd12uSE7BEv3aev"}], "ticket_created_at": 33, "ticket_id": "UGKSZ4GcLkt4pK32"}, {"first_ticket_created_at": 37, "party_attributes": {"1BpWoJBaqdg2FHcu": {}, "nsS1lnaO2m9vqjhb": {}, "eK2qN8g6x2PyYDo5": {}}, "party_id": "R3hLiD5sf5y1JsxJ", "party_members": [{"extra_attributes": {"NGmyt0SQDUDoWBZV": {}, "GLlkUetzCAWc9x1a": {}, "MjgGim51T107XIZR": {}}, "user_id": "Z7tZdIs0xf4czdt7"}, {"extra_attributes": {"zqmSKxOEQlVcx6Gq": {}, "sBq8vdhWVnuYLgpZ": {}, "ehK0G2nmyuViB9kR": {}}, "user_id": "TcSQdTnNYGeAfYFG"}, {"extra_attributes": {"3wSkHKufBdS3ZOok": {}, "ZB4cXnAXyuGz6Llx": {}, "Hv8SwyagYvDJ3w3U": {}}, "user_id": "NgIGj2jZtEYT8sIP"}], "ticket_created_at": 92, "ticket_id": "S1fUfKmihDbmu8eP"}]}, {"matching_parties": [{"first_ticket_created_at": 99, "party_attributes": {"xCOWMpyh9pMsQgb6": {}, "4ELbzDMwyo4nIRys": {}, "QdbufXjYnSoIFeou": {}}, "party_id": "C2m38kXrDZWlGVE9", "party_members": [{"extra_attributes": {"sJ4NpUtKp6M9I6nE": {}, "wnZhsjwJeGwaPSDM": {}, "Zz95OYKiqaZD63xe": {}}, "user_id": "5rruJVfLGea0Ztlz"}, {"extra_attributes": {"UcuHAXz0UV31MfuG": {}, "aXsAuGsZaSHevO0T": {}, "QNEI3kfabxJWWSI1": {}}, "user_id": "ECUo1NPpeFhUztXD"}, {"extra_attributes": {"gB7n4C97uAPP8PAT": {}, "LpUpxeJlsBJT6Hh3": {}, "OMjAjq2mK8lbSEEe": {}}, "user_id": "lxnb5QxWG2HFnZlA"}], "ticket_created_at": 80, "ticket_id": "HKWW4fI1IQcoBQEL"}, {"first_ticket_created_at": 5, "party_attributes": {"rYQue84dwmbwFEnA": {}, "ZaWsQJtRYoagRJK5": {}, "PX9UcOvhPyE11TRT": {}}, "party_id": "2SKseoe8VLie0LBa", "party_members": [{"extra_attributes": {"36KNzjf005CXNGeh": {}, "Q2aTjTDfKFDXC7eG": {}, "L5YhJDWh9YWqc0qg": {}}, "user_id": "V6d9yOfIMLds2DbP"}, {"extra_attributes": {"caoMdtRLTmSvTkQQ": {}, "gB7exYvmHMxr5hPC": {}, "JJztJBg0tTJg46Ie": {}}, "user_id": "wOXE2AkCh3QIZsUf"}, {"extra_attributes": {"8lGFXcmwTERHclOd": {}, "xIwqejxe18rNdb8O": {}, "tq6j1mqUav7k05HA": {}}, "user_id": "QltnSojV4jT65ycl"}], "ticket_created_at": 54, "ticket_id": "2FtAz0vJjFIYWOaN"}, {"first_ticket_created_at": 8, "party_attributes": {"RvXfZ6rvgvEY3Hht": {}, "1SwqTsKKKo37NHDO": {}, "Qe91Ps3ztUIV0dS6": {}}, "party_id": "hIH9c4VfkyrwpuXx", "party_members": [{"extra_attributes": {"baERbfgPmi0eHkt1": {}, "mr9EOIFg0dnWIYN2": {}, "NVL70Iw157g00jr9": {}}, "user_id": "b8MuYmmeKTmBNvGY"}, {"extra_attributes": {"xEQdf3ewoGGoY7xm": {}, "FNAmjDDCvs78mcMd": {}, "iS76YApGJ9ufwLYk": {}}, "user_id": "qIgLuZS6hsQryiEt"}, {"extra_attributes": {"OAbpeUNf26UqkCfg": {}, "CUYBn2xaOBdPF0Jm": {}, "X8qwU1cTuHHPB5S3": {}}, "user_id": "DvPRCzBrVUxmDOj3"}], "ticket_created_at": 5, "ticket_id": "Gs9yxahld1pO0Gyf"}]}, {"matching_parties": [{"first_ticket_created_at": 10, "party_attributes": {"PO3COyMvczgEpzZ3": {}, "FbtxfhcRC7IVYa6i": {}, "Z5uFRYNn3SHiWxF0": {}}, "party_id": "YbuU5ar5qTLWUCy0", "party_members": [{"extra_attributes": {"Afgc050XIZRW491e": {}, "94mQjVOOBnIWhunE": {}, "lqZUodp3IhtCSHy1": {}}, "user_id": "ei1fIrPvfHnRN06E"}, {"extra_attributes": {"jRwEQlNapJRfk4f9": {}, "Zcw1pEHAyNFxcVTK": {}, "uAQTGh5BxjWOozGo": {}}, "user_id": "DtsUuYo5p8ED5QZA"}, {"extra_attributes": {"ufwNa8lzfjv9oYMX": {}, "MjlVHY1AHwF3vGoa": {}, "v7MK0PcLnEkcokKw": {}}, "user_id": "cQ0baDT9OyJ2h23G"}], "ticket_created_at": 95, "ticket_id": "4qlkiFAamqvZI2Kw"}, {"first_ticket_created_at": 20, "party_attributes": {"OrVSnLocLVVYamQc": {}, "4wcG5nDBLJoJHbiQ": {}, "5duE5p4cfs2E41cK": {}}, "party_id": "8QTwiIAvxSvNDlmM", "party_members": [{"extra_attributes": {"5nQFMGzs7fzjgyc4": {}, "4mEh9tRk8knYSV30": {}, "lnroQehMDli6t9un": {}}, "user_id": "QLYXxm09wpGAbpEm"}, {"extra_attributes": {"DY9vLh3u6EDsUmrV": {}, "6kH4OotKwG3UC6XC": {}, "nnZxF8CmQr17W65b": {}}, "user_id": "r34rBBN9tU6TDm5G"}, {"extra_attributes": {"loFSKWM1eym5ydC6": {}, "p25xCWTqUOYZENJ1": {}, "QHZQxPRXH7uxBJEE": {}}, "user_id": "CQE1li3Bg7Jxc9pU"}], "ticket_created_at": 27, "ticket_id": "tcknrgidKupvXO6a"}, {"first_ticket_created_at": 18, "party_attributes": {"TiCO1NDBvQvRPnAz": {}, "4VzW0CpoBCbyJsF5": {}, "IjF1c0W338HS6CBg": {}}, "party_id": "VRyihYNZ84CVhziX", "party_members": [{"extra_attributes": {"V8HwSmvcvcDKF19y": {}, "VRafCjOuSYht83Ad": {}, "vBaagTiRJ8daGTVX": {}}, "user_id": "3Bb7jlz5IfHgKjI9"}, {"extra_attributes": {"mwJSrN8jkIykR2zb": {}, "aI6PD7fEscShnGUG": {}, "UtV9GJ279GDbLNwj": {}}, "user_id": "m3FK0nnX2poMfZ1h"}, {"extra_attributes": {"DHtbh4HtMlFgvh2D": {}, "p2SoiIPp1yvfAHS0": {}, "VgLu11A3HTovFi4t": {}}, "user_id": "PAGfleyCA6jEtcqs"}], "ticket_created_at": 27, "ticket_id": "HcLJXJ7mpVI6eTYA"}]}], "namespace": "jdPlCiQQC35cj4Ky", "party_attributes": {"OVgvnWbfRJtsB7cU": {}, "QZ2QUAxJrINPXppP": {}, "NO3AfmXcgwC3IN6t": {}}, "party_id": "vKgLB9QmJIOq9dP5", "queued_at": 38, "region": "WKt4sUmanYxM0UHZ", "server_name": "VNYzGMNIpWoSLkUr", "status": "fuf4U3WeYeA9t2EN", "ticket_id": "KKWrFtHIi1CMgKAO", "ticket_ids": ["G5iDcCR5PbCvDLil", "8wj9cKM3Ar6MF35h", "CER4nGmWGgTJfHlJ"], "updated_at": "1976-05-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "4tHGa4XfZcd9CVnG"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'qMX9FieeEssWEUl0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 2, "userID": "uuoVdn9yVoSlKNch", "weight": 0.6716499390250769}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePlayTimeWeight' test.out

#- 14 GetAllPartyInAllChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInAllChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetAllPartyInAllChannel' test.out

#- 15 BulkGetSessions
./ng net.accelbyte.sdk.cli.Main matchmaking bulkGetSessions \
    --namespace "$AB_NAMESPACE" \
    --matchIDs 'HNL4X3LLaGPGdqLE' \
    > test.out 2>&1
eval_tap $? 15 'BulkGetSessions' test.out

#- 16 ExportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking exportChannels \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'ExportChannels' test.out

#- 17 ImportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking importChannels \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy '8SohhhuiTnJarYYk' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'HBDdSzBXdxapwhd5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'IQYBQuxLvPuWYvE3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "M6H6QXmpZ9X3fUSR", "description": "1l9xLPBsmAUrD9L1", "findMatchTimeoutSeconds": 70, "joinable": false, "max_delay_ms": 38, "region_expansion_range_ms": 60, "region_expansion_rate_ms": 90, "region_latency_initial_range_ms": 81, "region_latency_max_ms": 80, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 79, "min": 24, "name": "ZcA92hzC7MNa8vVe"}, {"max": 83, "min": 79, "name": "x2CXKlvIomU3pIxM"}, {"max": 55, "min": 28, "name": "K5PRMRMwdvl0hv6g"}], [{"max": 61, "min": 5, "name": "GxBW2tQF5tkTjgJa"}, {"max": 80, "min": 44, "name": "YvNQOsDa4bkcgepq"}, {"max": 40, "min": 48, "name": "XjdyRJunZPkp6ccI"}], [{"max": 57, "min": 75, "name": "nWyPw8mj7gyQ7XdI"}, {"max": 38, "min": 52, "name": "miteR5eQAe1rzmmg"}, {"max": 34, "min": 69, "name": "BPRmd6mO4oI8KDqe"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 25, "role_flexing_second": 81}, "maxNumber": 36, "minNumber": 67, "playerMaxNumber": 1, "playerMinNumber": 80}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 80, "min": 49, "name": "BJ5y7axEkvI4oxZE"}, {"max": 61, "min": 49, "name": "f1Ybgg8rdwY9bmrv"}, {"max": 68, "min": 24, "name": "mO07KNqX9LM2IwEs"}], [{"max": 7, "min": 71, "name": "OGBXBwnzDX8v3xgC"}, {"max": 66, "min": 76, "name": "e9PdbTTAJ2Gp1r0s"}, {"max": 97, "min": 80, "name": "Z6LJAOddIL2l3hPj"}], [{"max": 81, "min": 6, "name": "DKv2LWfXqjr8fS79"}, {"max": 62, "min": 46, "name": "n3wYowBdkaZ3y6i3"}, {"max": 85, "min": 87, "name": "01vxP8xj1LyEirUR"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 96, "role_flexing_second": 63}, "duration": 29, "max_number": 80, "min_number": 52, "player_max_number": 96, "player_min_number": 31}, {"combination": {"alliances": [[{"max": 57, "min": 71, "name": "JWodpdwsX1jorcyR"}, {"max": 57, "min": 47, "name": "rkzUvck3xTtmOFMe"}, {"max": 3, "min": 38, "name": "S4AdlNzwog2IhErk"}], [{"max": 81, "min": 15, "name": "hNcECWwchW6zL9Sk"}, {"max": 3, "min": 97, "name": "LlrNXnGanMazb8jv"}, {"max": 90, "min": 22, "name": "WenURH48aJuALEcS"}], [{"max": 34, "min": 46, "name": "cE15u6D31DjOsrs3"}, {"max": 58, "min": 48, "name": "UYATdqnQGbqiqOkN"}, {"max": 9, "min": 81, "name": "ATj7eGjodd7CcJUr"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 78, "role_flexing_second": 29}, "duration": 53, "max_number": 97, "min_number": 42, "player_max_number": 13, "player_min_number": 98}, {"combination": {"alliances": [[{"max": 75, "min": 82, "name": "5kypNrp2nFe9FmN8"}, {"max": 41, "min": 37, "name": "S6x9cLJ1APnNlsa2"}, {"max": 3, "min": 95, "name": "RBr27fVMWuAfDqLM"}], [{"max": 89, "min": 78, "name": "919IZPKOKiAVQXXO"}, {"max": 24, "min": 34, "name": "q2OspCZbt3Uta5I0"}, {"max": 42, "min": 27, "name": "GcL1koyHjCH5olYL"}], [{"max": 62, "min": 94, "name": "vHLjBJ9iqMcBL4Bz"}, {"max": 14, "min": 61, "name": "3yOxNInDByhnoluO"}, {"max": 2, "min": 40, "name": "XGFmPAnOkDiJq4xQ"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 83, "role_flexing_second": 68}, "duration": 39, "max_number": 33, "min_number": 12, "player_max_number": 28, "player_min_number": 30}], "batch_size": 97, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 74, "flex_flat_step_range": 19, "flex_immunity_count": 39, "flex_range_max": 58, "flex_rate_ms": 98, "flex_step_max": 10, "force_authority_match": false, "initial_step_range": 84, "mmr_max": 53, "mmr_mean": 100, "mmr_min": 20, "mmr_std_dev": 38, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "fVQh3jLBtn9pxpE7", "criteria": "BYtzB0B4CxyQrUpI", "duration": 65, "reference": 0.7896173249366922}, {"attribute": "VZ77KeRWdECaFGzf", "criteria": "Z2hxcJ2Fnemn7M23", "duration": 91, "reference": 0.4916437298804853}, {"attribute": "bqcNXSGCCvNowNmd", "criteria": "pcJgF88ySNq4Mj7m", "duration": 41, "reference": 0.9387328340989085}], "match_options": {"options": [{"name": "9yg9ADCGiXaLs2xj", "type": "HkinOD975nARHCmh"}, {"name": "NHSXuqIHsxvaUoXD", "type": "mwWsukxncuD3QxCX"}, {"name": "Md00YBWCaVVmM45m", "type": "fIZsWhkS476dGGJw"}]}, "matchingRules": [{"attribute": "J00UH197MJ6zU7JL", "criteria": "MQyMWzYQCAaPJgox", "reference": 0.5188019408538475}, {"attribute": "JoJaSzUtY4ZD0Xtb", "criteria": "0U4pH16NUsVY21NV", "reference": 0.553693089143121}, {"attribute": "s7NRen2Y3Ns0QJQe", "criteria": "aWytPfds1BYx0EaU", "reference": 0.6953453967909353}], "sort_ticket": {"search_result": "oldestTicketAge", "ticket_queue": "distance"}, "sort_tickets": [{"search_result": "distance", "threshold": 10, "ticket_queue": "random"}, {"search_result": "random", "threshold": 49, "ticket_queue": "none"}, {"search_result": "oldestTicketAge", "threshold": 84, "ticket_queue": "distance"}], "sub_game_modes": {}, "ticket_flexing_selection": "random", "ticket_flexing_selections": [{"selection": "random", "threshold": 55}, {"selection": "random", "threshold": 66}, {"selection": "newest", "threshold": 44}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 83, "socialMatchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'cTglbU86FyOjApNH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'BVfNOURcjY3YYT9o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'TynmfIuBWgJTNFfM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 37}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'M0IW4oe8KDgy0xZf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'AcNg14Ws8TIP1LKi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "FQoLDvumfqrgSfnx", "count": 16, "mmrMax": 0.735515109717915, "mmrMean": 0.4653936241874749, "mmrMin": 0.03867401034329854, "mmrStdDev": 0.6424373760581721}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'IsQ3PuppUxDSK8aO' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 94, "party_attributes": {"9qjNLwvI8JdiY3RR": {}, "iLilmOGF6dLLIeIV": {}, "IjMcdlbdRXTGIrdN": {}}, "party_id": "L5gJPqTAjgqaTHf1", "party_members": [{"extra_attributes": {"ANTJ9Yk997XkGOdC": {}, "6ItxDT8p4n4XCFkD": {}, "1AJLCwszbZxuHSgD": {}}, "user_id": "OK8bjoF7bL2635Kb"}, {"extra_attributes": {"tZTGJpqgl2IzNXGT": {}, "uQPIDpor7t1aJLNN": {}, "z6QIVC9Mfuc8VOsn": {}}, "user_id": "mnlVljdWYmELe74p"}, {"extra_attributes": {"38vumnxAnYBTxaTI": {}, "z0jcgDI8Pkz96vd8": {}, "0msqIm5bufnBqrpL": {}}, "user_id": "eqhwVhjnnjKMEmtb"}], "ticket_created_at": 18, "ticket_id": "cxDC9Ynd02mECIQh"}, {"first_ticket_created_at": 11, "party_attributes": {"SWCqZXHLLa31oQf7": {}, "BULnZDhutDM6Bqgu": {}, "qD5xxGxBWtnTKUe2": {}}, "party_id": "znsqPzPkwCBo2SwC", "party_members": [{"extra_attributes": {"UsTag4MLAo3m61P2": {}, "xaNfmn8Onb1a9gMz": {}, "0F2UBRmMhAbUWmFh": {}}, "user_id": "dYLWzMuv3zkUY0n0"}, {"extra_attributes": {"BAZkwbYkBLyO6A0F": {}, "qfhnaB3YxKNdOTac": {}, "CcJfIfXshuLUk5Wd": {}}, "user_id": "pxjZx5noXPhPUTKb"}, {"extra_attributes": {"onoucNmzwOZOK56s": {}, "Dkci5rZ8iMlOuksQ": {}, "JCiRFiZWwJ7NrTb1": {}}, "user_id": "XTB9YQzUJ9XlYJ8B"}], "ticket_created_at": 51, "ticket_id": "WYyS8zdhMeBXH8x6"}, {"first_ticket_created_at": 68, "party_attributes": {"j9lhbvuQdW2jwKUc": {}, "kc794ryY91lX8DD4": {}, "MYXlrJ81lHvv9rqv": {}}, "party_id": "EoM8YmVjAkO3HKsE", "party_members": [{"extra_attributes": {"p6KlqwW4djrexcbH": {}, "dEtoQvpV344RctmT": {}, "ozCi8HeV6jbalHmq": {}}, "user_id": "BBfi7sSF5BoGiTCV"}, {"extra_attributes": {"sXsygWbjE2opXtds": {}, "JQeJ1too0qvxphTL": {}, "EEBGTtZyTjdKNKgY": {}}, "user_id": "azujsmSmylT1YtxI"}, {"extra_attributes": {"q73aMb48jISd97KO": {}, "RRhxSWLWLNfHRD3V": {}, "15QaGGL46LuxJF3s": {}}, "user_id": "beqWBdQuWfgBAKx2"}], "ticket_created_at": 96, "ticket_id": "MSBqabUXOGkkoMUZ"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'n1YXj5zFZeOCOR9N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 44}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'SpPFnZBJZkDnEiyf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'a2LrnpZxNnLRH36b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'qS2oFY76PU1AziBO' \
    --matchID 'HEAj1cT3u6Zc2Fbr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["TFznTgDIwZIRWf6T", "3by2kYSCdnFKLc0x", "cTjqjdcEfU61OJYM"], "party_id": "nW49rWynp1ck1vT9", "user_id": "0C6o86cSRL9cgbUm"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'ulhe98oaFKlQicdr' \
    --matchID 'xVhrtwSd9QWVMYz7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'TU1TsxsChSclSkb5' \
    --matchID 'aBi9K9zyv6gFZXI5' \
    --namespace "$AB_NAMESPACE" \
    --userID 'nXJ7hLi6HweweRmy' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'o91dIn7QqXBDXJcr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetStatData' test.out

#- 33 SearchSessions
eval_tap 0 33 'SearchSessions # SKIP deprecated' test.out

#- 34 GetSessionHistoryDetailed
eval_tap 0 34 'GetSessionHistoryDetailed # SKIP deprecated' test.out

#- 35 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetMessages \
    > test.out 2>&1
eval_tap $? 35 'PublicGetMessages' test.out

#- 36 PublicGetAllMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetAllMatchmakingChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'PublicGetAllMatchmakingChannel' test.out

#- 37 PublicGetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetSingleMatchmakingChannel \
    --channelName 'qKmXDwoEV6tCdrxw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'PublicGetSingleMatchmakingChannel' test.out

#- 38 SearchSessionsV2
eval_tap 0 38 'SearchSessionsV2 # SKIP deprecated' test.out

#- 39 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 39 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE