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
    --body '{"deployment": "AxcVpFrttufHIRdH", "description": "9UzVRiXbqlAw7r6W", "find_match_timeout_seconds": 9, "game_mode": "ktQG0h5JAav5kRa6", "joinable": false, "max_delay_ms": 29, "region_expansion_range_ms": 51, "region_expansion_rate_ms": 31, "region_latency_initial_range_ms": 56, "region_latency_max_ms": 72, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 68, "name": "8SAMTwE6I56IaRDB"}, {"max": 2, "min": 49, "name": "gorQeFbQ1g7qbPng"}, {"max": 95, "min": 31, "name": "NB1vRodwpzS6DaDp"}], [{"max": 44, "min": 73, "name": "N7ZQVqGj6oDLjWjk"}, {"max": 21, "min": 69, "name": "aXlFcDtgOjchIua5"}, {"max": 40, "min": 4, "name": "WEIC32ogW7olvbTg"}], [{"max": 36, "min": 58, "name": "hRTcPiSuL0Sly6XM"}, {"max": 50, "min": 83, "name": "E3cwyALczNIicXm7"}, {"max": 0, "min": 100, "name": "gSrjJW2OQNOs1PXh"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 17}, "max_number": 84, "min_number": 89, "player_max_number": 16, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 57, "name": "7oFgx4c8OumKtPDK"}, {"max": 74, "min": 62, "name": "DXn7Z4U68su8Xfql"}, {"max": 34, "min": 63, "name": "NiTvB6SdAdIhUDrw"}], [{"max": 29, "min": 39, "name": "Z5MecdKi5r6QEa1y"}, {"max": 38, "min": 9, "name": "LEzth6mXhzkzWkFe"}, {"max": 7, "min": 90, "name": "dSpHt0P7MIIR7Cky"}], [{"max": 66, "min": 40, "name": "6C7duuyZ0GhDogqr"}, {"max": 16, "min": 51, "name": "BRd8lDR6qVNPRZYd"}, {"max": 65, "min": 90, "name": "LIAjGGJddVCvu9vx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 22}, "duration": 76, "max_number": 75, "min_number": 66, "player_max_number": 79, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 91, "min": 70, "name": "0lyuI9a2I9u6Vpbs"}, {"max": 47, "min": 21, "name": "5w8hqUI06UpOXGSL"}, {"max": 25, "min": 96, "name": "CVuHOPlLlkvR8sKg"}], [{"max": 28, "min": 47, "name": "uRkgghGoYupD391C"}, {"max": 49, "min": 33, "name": "D6SCwGrncqmLtjQH"}, {"max": 54, "min": 25, "name": "f8TgoNm03VLisV6z"}], [{"max": 46, "min": 97, "name": "Puo3td6TC6I3lMjG"}, {"max": 91, "min": 39, "name": "WN2laRlxfcjHfYak"}, {"max": 95, "min": 3, "name": "CTqGkE7wcWfDslpJ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 40}, "duration": 55, "max_number": 77, "min_number": 85, "player_max_number": 88, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 18, "min": 50, "name": "ZMdjxcBZufQxGiHP"}, {"max": 24, "min": 86, "name": "lG4cYEzfTD1ZBm3M"}, {"max": 33, "min": 84, "name": "HcUmLZZbSqb8RwNm"}], [{"max": 27, "min": 59, "name": "9HrNQy4uZAAiE0mi"}, {"max": 39, "min": 91, "name": "9RGCCHYzUOcEdscK"}, {"max": 69, "min": 13, "name": "PEqgA8yu7Vk6Jt4Y"}], [{"max": 25, "min": 16, "name": "os9Jcdos4fYcTVU6"}, {"max": 90, "min": 25, "name": "Bt0zYoMcHyCUEXlA"}, {"max": 44, "min": 77, "name": "xJMdalwSyliWMNW5"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 41, "role_flexing_second": 33}, "duration": 39, "max_number": 79, "min_number": 23, "player_max_number": 56, "player_min_number": 98}], "batch_size": 68, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 16, "flex_flat_step_range": 72, "flex_immunity_count": 58, "flex_range_max": 61, "flex_rate_ms": 92, "flex_step_max": 70, "force_authority_match": false, "initial_step_range": 60, "mmr_max": 3, "mmr_mean": 86, "mmr_min": 99, "mmr_std_dev": 86, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "lNmqRBaAkLnvxkT1", "criteria": "X68cmDc3fxU8MyKr", "duration": 88, "reference": 0.8452748898931911}, {"attribute": "v52Dlym6puQ23xoJ", "criteria": "8aeCnaLpUKp44YUD", "duration": 20, "reference": 0.24185924236642597}, {"attribute": "WvXa3bMrXsDr6kIL", "criteria": "sSSyDdmykmoPYgc2", "duration": 76, "reference": 0.01667587390248748}], "match_options": {"options": [{"name": "N9oCMNqq98SjTvhZ", "type": "NkSQ70D0H6BXksUC"}, {"name": "9b6i5lZC9xv32e8c", "type": "5csSovoqsZNBdte9"}, {"name": "NDUPVJf6c2Z0QZxf", "type": "gPubTDIHrvqAThuw"}]}, "matching_rule": [{"attribute": "jRHpKKTlmVr9XuoJ", "criteria": "bRFQSKVPHbn4Xxtu", "reference": 0.9639977895854788}, {"attribute": "LQRENjEEztx1WsYS", "criteria": "iZqan0nSBJroav91", "reference": 0.5171230937144093}, {"attribute": "XlvPG6bFYReVHQip", "criteria": "cCx9Zw5D2L7vIYhG", "reference": 0.5235086363368513}], "rebalance_enable": false, "sort_ticket": {"search_result": "oldestTicketAge", "ticket_queue": "random"}, "sort_tickets": [{"search_result": "oldestTicketAge", "threshold": 87, "ticket_queue": "none"}, {"search_result": "none", "threshold": 68, "ticket_queue": "random"}, {"search_result": "random", "threshold": 81, "ticket_queue": "distance"}], "sub_game_modes": {"e4mhgo5QB65lSAiY": {"alliance": {"combination": {"alliances": [[{"max": 27, "min": 31, "name": "NjkfZrQvGgbLdLsF"}, {"max": 51, "min": 74, "name": "HkBMr1yrOMlNFSrU"}, {"max": 63, "min": 18, "name": "f7Gc26SaiGVkydwY"}], [{"max": 99, "min": 5, "name": "QG26yUZNmTBcvrbY"}, {"max": 59, "min": 60, "name": "wZtxFHyPLtI8ilby"}, {"max": 60, "min": 5, "name": "PUIj88cekdqCt81P"}], [{"max": 68, "min": 21, "name": "dNzDmeIP6rOvDz9K"}, {"max": 83, "min": 25, "name": "sb392k6YmJFfRByj"}, {"max": 24, "min": 56, "name": "a9LJE8HoRS1X2PFA"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 80, "role_flexing_second": 22}, "max_number": 47, "min_number": 59, "player_max_number": 51, "player_min_number": 26}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 68, "min": 57, "name": "PxB1UskYs4Yw20DO"}, {"max": 34, "min": 92, "name": "OBSC2DKHRuPMMWH8"}, {"max": 25, "min": 4, "name": "qRRbceJ5i0EeDxOg"}], [{"max": 55, "min": 8, "name": "nhhqElIaDml48wdN"}, {"max": 65, "min": 93, "name": "LTm5T50x9WT0GfH2"}, {"max": 36, "min": 41, "name": "tOa4EXsXzOXQAk4m"}], [{"max": 33, "min": 40, "name": "rxzTtuLl4XlbGL8Q"}, {"max": 84, "min": 60, "name": "xtjzm8y2wNhmwoYZ"}, {"max": 50, "min": 59, "name": "I4EFZKBcYrCEAE7W"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 10, "role_flexing_second": 25}, "duration": 15, "max_number": 48, "min_number": 46, "player_max_number": 70, "player_min_number": 82}, {"combination": {"alliances": [[{"max": 34, "min": 77, "name": "31A806DJgas4b6z3"}, {"max": 77, "min": 42, "name": "NUj7fdgLA84Z8YYk"}, {"max": 58, "min": 88, "name": "pnduEEQlULdJz4mn"}], [{"max": 88, "min": 30, "name": "BkMNxvvKgAT8mJrY"}, {"max": 33, "min": 70, "name": "6hRkloqxM3gpwxcf"}, {"max": 79, "min": 18, "name": "y9XzjjI5YbsKoADk"}], [{"max": 52, "min": 37, "name": "JEN2VHzih3bit0VW"}, {"max": 28, "min": 16, "name": "3CO39PXDNxtXgeO3"}, {"max": 64, "min": 83, "name": "gkXhjDzaQY3snn2Z"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 85, "role_flexing_second": 55}, "duration": 61, "max_number": 4, "min_number": 79, "player_max_number": 65, "player_min_number": 80}, {"combination": {"alliances": [[{"max": 8, "min": 54, "name": "P43e5dC9XIBudfZg"}, {"max": 35, "min": 1, "name": "bHDIDm4hMzF4Txod"}, {"max": 8, "min": 39, "name": "nSrUTvfqU0bfoMm5"}], [{"max": 5, "min": 20, "name": "TtFWbotQyXJRcQWs"}, {"max": 25, "min": 44, "name": "qPNs92epxk0i8Vxs"}, {"max": 82, "min": 57, "name": "ereSvf9699mCEHTh"}], [{"max": 95, "min": 88, "name": "JkETAsSp7gh4TeUT"}, {"max": 20, "min": 3, "name": "OkAYfJB8AT9t4Tv2"}, {"max": 73, "min": 91, "name": "Y2QD3oD5fLCr3OOl"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 47}, "duration": 58, "max_number": 68, "min_number": 64, "player_max_number": 67, "player_min_number": 3}], "name": "uYnGzpipNDigNJma"}, "1MbqqZtfNWql4nmw": {"alliance": {"combination": {"alliances": [[{"max": 54, "min": 21, "name": "ft4gqkNNlWkD9eOz"}, {"max": 17, "min": 49, "name": "RFOn0jJLHC9LxhvN"}, {"max": 82, "min": 94, "name": "ww3HICQLfl7MUBG7"}], [{"max": 34, "min": 25, "name": "tPu64yAtURKLRkb7"}, {"max": 84, "min": 69, "name": "TF6oQAXVG7tnsZg5"}, {"max": 86, "min": 16, "name": "gXjvyGJPN4eXbJE5"}], [{"max": 97, "min": 75, "name": "s2GcyomQoIXimBJe"}, {"max": 16, "min": 89, "name": "yxlNsjUgxBkF6wFP"}, {"max": 29, "min": 91, "name": "JeQediogEhhM2rIi"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 56, "role_flexing_second": 75}, "max_number": 68, "min_number": 43, "player_max_number": 96, "player_min_number": 83}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 86, "name": "rDzZSKscfOcYu3dp"}, {"max": 59, "min": 22, "name": "ROYqUiGKXVFCmpo6"}, {"max": 38, "min": 0, "name": "PwVOEDSJsEK5QpNh"}], [{"max": 24, "min": 25, "name": "I2iS5EpGhhvXYck0"}, {"max": 41, "min": 32, "name": "QM0NBMA9ORxpzwLR"}, {"max": 2, "min": 54, "name": "u1bNCtX7W40V6Do5"}], [{"max": 37, "min": 67, "name": "YadCCFrHHC3DpZxk"}, {"max": 37, "min": 35, "name": "QDXuNFviMarv8mnf"}, {"max": 69, "min": 89, "name": "K8CCmE2lPnsbD3SG"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 25}, "duration": 23, "max_number": 47, "min_number": 79, "player_max_number": 42, "player_min_number": 16}, {"combination": {"alliances": [[{"max": 96, "min": 0, "name": "ccE536ugBp3HBvep"}, {"max": 28, "min": 41, "name": "DCjgyJlXe36mgWjL"}, {"max": 11, "min": 64, "name": "09xbnGezKsDwG2om"}], [{"max": 83, "min": 89, "name": "5tVg8JqU0jZpjvsu"}, {"max": 13, "min": 10, "name": "AOS7u8RiWyerCSa8"}, {"max": 91, "min": 56, "name": "RgwsAj1ik1jglaDX"}], [{"max": 93, "min": 12, "name": "vKCWwNTAhd2wrS0u"}, {"max": 84, "min": 40, "name": "djhdinpng5BLy8wb"}, {"max": 15, "min": 31, "name": "MssAHjapIkY9Rf4w"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 65}, "duration": 81, "max_number": 87, "min_number": 89, "player_max_number": 2, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 27, "min": 6, "name": "bCtmKy8M9zVrjfGX"}, {"max": 28, "min": 38, "name": "qAQUoY1GjlIIk0iK"}, {"max": 29, "min": 59, "name": "TTS1j02o7JjTXAQN"}], [{"max": 34, "min": 6, "name": "ccLjMXJRk0eaKQDO"}, {"max": 74, "min": 48, "name": "vrTefglSs6g4iY9u"}, {"max": 44, "min": 0, "name": "aCNYIWekp18lOC3m"}], [{"max": 81, "min": 78, "name": "qF7Bl0LcghVHfPEs"}, {"max": 32, "min": 57, "name": "xwhRON0bc1eMbEIj"}, {"max": 29, "min": 64, "name": "wLqc3ecjXJbZDKKo"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 47, "role_flexing_second": 60}, "duration": 31, "max_number": 50, "min_number": 6, "player_max_number": 26, "player_min_number": 39}], "name": "pai0rYaT5hOPjaf3"}, "H0tYighU0VUfcYHJ": {"alliance": {"combination": {"alliances": [[{"max": 2, "min": 63, "name": "BfAKSiPW3VgsZXiR"}, {"max": 93, "min": 59, "name": "ej52WKi6tArAURt9"}, {"max": 32, "min": 64, "name": "lCSVq8PdH6hJPUAc"}], [{"max": 61, "min": 90, "name": "uAXI66bQ71w0deoV"}, {"max": 88, "min": 77, "name": "i6BqPg4xr0lCancU"}, {"max": 51, "min": 66, "name": "vSZIPkhSgORcz5S5"}], [{"max": 56, "min": 50, "name": "vmgBLxh4ijFnE3Ta"}, {"max": 26, "min": 79, "name": "9qSZ7PC6f6QkmZXE"}, {"max": 24, "min": 7, "name": "W9YfRSse6AAz3S4c"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 87}, "max_number": 57, "min_number": 75, "player_max_number": 89, "player_min_number": 64}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 82, "min": 24, "name": "PYuG6XqP6oo7G73z"}, {"max": 6, "min": 9, "name": "xTgOfnwIdlNa29fD"}, {"max": 77, "min": 15, "name": "h741IslKHzGlLKWU"}], [{"max": 40, "min": 68, "name": "DQs61OQAoxyyQpRW"}, {"max": 59, "min": 80, "name": "iiPDGQhNPEwiJCf2"}, {"max": 40, "min": 73, "name": "nkY6Mca5afj12K2I"}], [{"max": 51, "min": 22, "name": "rBvvWm4udE0OXudX"}, {"max": 13, "min": 22, "name": "Nne8kJATwlc6esUp"}, {"max": 98, "min": 91, "name": "6xnZ5Jrzzjrcaug6"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 97}, "duration": 75, "max_number": 67, "min_number": 28, "player_max_number": 0, "player_min_number": 92}, {"combination": {"alliances": [[{"max": 21, "min": 100, "name": "noed9DHhLOqQGhCU"}, {"max": 35, "min": 21, "name": "iTrjyEgarAdNJOIG"}, {"max": 97, "min": 38, "name": "I6tRbRcrEveMdAdi"}], [{"max": 85, "min": 94, "name": "KDUVSC00PYeDcagg"}, {"max": 18, "min": 70, "name": "nxnFIna3yddcbsPh"}, {"max": 8, "min": 84, "name": "TH26IUJNvYuGRUvp"}], [{"max": 1, "min": 69, "name": "A3PrIfapq5AAeMe4"}, {"max": 76, "min": 26, "name": "3mDWORBVXTIIJM9X"}, {"max": 38, "min": 1, "name": "YIIZxiXNMR9BgaWc"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 39}, "duration": 96, "max_number": 66, "min_number": 56, "player_max_number": 27, "player_min_number": 14}, {"combination": {"alliances": [[{"max": 25, "min": 50, "name": "yo5JJTUVmb8GEXFT"}, {"max": 24, "min": 54, "name": "EMEsFzYqwgK1Np5n"}, {"max": 30, "min": 7, "name": "dqpLm7FhJBNXzAFd"}], [{"max": 84, "min": 81, "name": "Khqf6kiTdSGv2LFj"}, {"max": 54, "min": 47, "name": "KY7CbgsWqFWZX7kP"}, {"max": 56, "min": 84, "name": "om8F9GLLTG8phc3n"}], [{"max": 65, "min": 16, "name": "MbAG9YI89hmguB8F"}, {"max": 83, "min": 93, "name": "WGRaoQomSJC4DdrK"}, {"max": 64, "min": 39, "name": "7SUQPLG59e0k5ZtX"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 74}, "duration": 46, "max_number": 98, "min_number": 85, "player_max_number": 8, "player_min_number": 32}], "name": "MK6MbGIVIu8vvwLc"}}, "ticket_flexing_selection": "pivot", "ticket_flexing_selections": [{"selection": "random", "threshold": 41}, {"selection": "oldest", "threshold": 30}, {"selection": "newest", "threshold": 93}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 39, "social_matchmaking": false, "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'ZrQzP4zvtdxdbZUp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'd6FJtHJ1pyVwyKQL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Y6FEO65Rb3z7CYLM", "players": [{"results": [{"attribute": "8IlsHqffnrfsGlfP", "value": 0.012031591177371403}, {"attribute": "ZKBwa3Ddb60ufPpz", "value": 0.3694170939030531}, {"attribute": "j1QGIFmlVf4jvaps", "value": 0.07083368406806057}], "user_id": "E9LN9bvhOrHflIOd"}, {"results": [{"attribute": "6X3viLvtEk4mTIpU", "value": 0.4325177690887003}, {"attribute": "9gxo8SV38nEhoXmM", "value": 0.8821265287585471}, {"attribute": "W7l6jHMA2rG3nako", "value": 0.2538246409580327}], "user_id": "Aywelu01nryEJ0Nq"}, {"results": [{"attribute": "oTow0qiOiC4j0ikt", "value": 0.20864724455417716}, {"attribute": "0ZPLkLOsp0LZ5njN", "value": 0.9701707300846726}, {"attribute": "6Hl8kUXzt6bSc6bW", "value": 0.35298129201965833}], "user_id": "gpVyW9dD1kOmvrAe"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "jcq2LgkQuaS7RBx3"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "vim02jBOxrZDyvpc", "client_version": "LYOWA8NjxOnaEok4", "deployment": "nOOCzfsflhjbngJO", "error_code": 95, "error_message": "H8paOJtxqMPpcVfR", "game_mode": "wNj547fH0XrKEDpE", "is_mock": "Y8VnocGAjci0V3tB", "joinable": false, "match_id": "xFJ3sWCqQpQ2FbKP", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 64, "party_attributes": {"LDljhZ2jxLRX3z46": {}, "OCaGBeMfPlNos4yB": {}, "RjrERHEonAZR8GmE": {}}, "party_id": "u0q1p6QCyY6vSkVF", "party_members": [{"extra_attributes": {"WdsbYuVEGVxYheR3": {}, "j5mNZ6vwv7K8Asvt": {}, "1j1Rx59hesNWy2Nv": {}}, "user_id": "Z85DDKDAF8KDsBZO"}, {"extra_attributes": {"uYQJ03BAHZ7c53q7": {}, "akMpcmnnx6RVBrop": {}, "9v7aZK3h65hbN15z": {}}, "user_id": "fQSfQrtfF3TQN0Oc"}, {"extra_attributes": {"NDLr36vzohZyjMQA": {}, "g5mPYhrLTyU8Ohgf": {}, "Y9JQYGF4bYXEcENx": {}}, "user_id": "9xZlAchob44lONDD"}], "ticket_created_at": 45, "ticket_id": "FUjfIGaffoflEIBy"}, {"first_ticket_created_at": 38, "party_attributes": {"qeKN0meGelYF5wWa": {}, "DhukU4khGG4vZFTY": {}, "nPkmSu4PWam1jxR7": {}}, "party_id": "SETWjteoc8fgvZDD", "party_members": [{"extra_attributes": {"hoO05oKqymxLD1Lc": {}, "vw6T6mZEiwxxElpM": {}, "YSWIeVzm7z9noowm": {}}, "user_id": "lTIKVowi0RY2VN4Z"}, {"extra_attributes": {"ONJREdUQ3z9F1BxN": {}, "Ngnke4akncw7wu9T": {}, "mXfJWBPrx9Ns8eLz": {}}, "user_id": "YEvwSWTaLQjctvrK"}, {"extra_attributes": {"2jhsYpKPlXn77AtY": {}, "oFzLAATPY8P8P3cf": {}, "oivvQxevecWw7Rry": {}}, "user_id": "0KK5rgAGO0dW8rX2"}], "ticket_created_at": 80, "ticket_id": "vq6iohU1cg4W1IS3"}, {"first_ticket_created_at": 96, "party_attributes": {"2sJxlZcCTpTdRtCH": {}, "vuk6B6XTmSLyn50s": {}, "igBVZxiKdV57GvRy": {}}, "party_id": "d9UuL02Le8HSCsls", "party_members": [{"extra_attributes": {"Dd4M1F5qRIblS7Nz": {}, "81GRazPAANjfBold": {}, "FOyqA2clJ5gEOaCg": {}}, "user_id": "M6Yn6RugbNEIpGBF"}, {"extra_attributes": {"UjOn5mM7k8nbLzvt": {}, "CIW5ynMKquUicAeI": {}, "VXtoWAXhMlW4tLqX": {}}, "user_id": "7OICf5oD1e6oI9Fm"}, {"extra_attributes": {"Yel0kOw72o8Zkgk0": {}, "jS6rDWUwfhKvrf2A": {}, "aH4yCWrHSppnIZkN": {}}, "user_id": "nTn3rzH5NvAtcvNe"}], "ticket_created_at": 7, "ticket_id": "PSE1XXPzySa0sZoF"}]}, {"matching_parties": [{"first_ticket_created_at": 91, "party_attributes": {"PWlQMVDXEHeiGTnw": {}, "yEw6hIWDZrpP7rz3": {}, "ISW510kHr4isTKWj": {}}, "party_id": "mv67nuHCXWfwnwGi", "party_members": [{"extra_attributes": {"oVwVzmmBVVFfpqx1": {}, "AeLtzcPJ3jtDYBo4": {}, "FUTH7CGfKSyxgRR1": {}}, "user_id": "DiCqSMzpqIFGLkDs"}, {"extra_attributes": {"7ACC1RgBfoNrHlFi": {}, "2qJLgmBLE35YhyiD": {}, "V90SeI5yppBHoytV": {}}, "user_id": "znCgNyx9fbT63ShE"}, {"extra_attributes": {"h8PbGikLjgjcj34u": {}, "ulU6FYBZsWFbr3RS": {}, "P0W9nBhvhf8Q0DtJ": {}}, "user_id": "McYQdN66bswAgt65"}], "ticket_created_at": 53, "ticket_id": "4N1LQZmB61JMdtwC"}, {"first_ticket_created_at": 97, "party_attributes": {"LcNlZkqTZrKgXNwv": {}, "m4e5GX6H742Oixht": {}, "AoKiVm6URT95XhnU": {}}, "party_id": "cvWB28MpusuhhDJ5", "party_members": [{"extra_attributes": {"slzgiWZEtyd56Lfx": {}, "nbY97jjYgXchCbkX": {}, "X26uEdCfQaMAQuTK": {}}, "user_id": "fC0I2kNjCMDtDMre"}, {"extra_attributes": {"ntgn3DhqciwIeShF": {}, "9RKb9vvxuJlhXbWh": {}, "bwPwToC6knjVwVnz": {}}, "user_id": "aqSfJiQFC2gXoda0"}, {"extra_attributes": {"kg16yUSpSOAjHJWw": {}, "fCjYwWkLob9gKLqs": {}, "2nEZhpByfHZinxNf": {}}, "user_id": "gPAwkMBsznlBUqnL"}], "ticket_created_at": 94, "ticket_id": "lX2FtAz0vJjFIYWO"}, {"first_ticket_created_at": 1, "party_attributes": {"yrRvXfZ6rvgvEY3H": {}, "ht1SwqTsKKKo37NH": {}, "DOQe91Ps3ztUIV0d": {}}, "party_id": "S6hIH9c4Vfkyrwpu", "party_members": [{"extra_attributes": {"XxbaERbfgPmi0eHk": {}, "t1mr9EOIFg0dnWIY": {}, "N2NVL70Iw157g00j": {}}, "user_id": "r9b8MuYmmeKTmBNv"}, {"extra_attributes": {"GYxEQdf3ewoGGoY7": {}, "xmFNAmjDDCvs78mc": {}, "MdiS76YApGJ9ufwL": {}}, "user_id": "YkqIgLuZS6hsQryi"}, {"extra_attributes": {"EtOAbpeUNf26UqkC": {}, "fgCUYBn2xaOBdPF0": {}, "JmX8qwU1cTuHHPB5": {}}, "user_id": "S3DvPRCzBrVUxmDO"}], "ticket_created_at": 19, "ticket_id": "BeGs9yxahld1pO0G"}]}, {"matching_parties": [{"first_ticket_created_at": 50, "party_attributes": {"m4fZWuk6pQxDQpKq": {}, "xLGeMvr9TsvcMQ7d": {}, "BsaIecRxIsZvD6rm": {}}, "party_id": "zVr5XT1Nxw0v1dMQ", "party_members": [{"extra_attributes": {"9Rrbk6C2cVWf6ttv": {}, "bU1PO6ApCD2VXidT": {}, "7w0Oc15N8WXBPp17": {}}, "user_id": "PAewqSm5x3B4t7WQ"}, {"extra_attributes": {"np8jXZedgt5cyNe2": {}, "7HLtwtVOaxgP6Jbc": {}, "t8puMybYGxD9IPmm": {}}, "user_id": "sLmu3kaPj0O4zd8T"}, {"extra_attributes": {"b7cUNGPTBxiFFCrn": {}, "7djjs69FTFVGUVhv": {}, "KhJCmeisql14mUHV": {}}, "user_id": "bMPimNhcZsU3VAdM"}], "ticket_created_at": 60, "ticket_id": "3GUS2amU7syGlElX"}, {"first_ticket_created_at": 7, "party_attributes": {"KwjqPBiWXade41s3": {}, "rH34mB2yPlRpWjmH": {}, "ZAAvKTH8MuqIg0Cz": {}}, "party_id": "kguwuJCW7EEFB67A", "party_members": [{"extra_attributes": {"ODbi9BzupBsFpYc7": {}, "7GtRUcCFeY5g4XgB": {}, "sbfzqxBPNe8ae1Il": {}}, "user_id": "4aAtEbu4IjGdqthR"}, {"extra_attributes": {"xTjQ7gkZEY8rG0q0": {}, "Q2Qd2JzRbkF2I03d": {}, "IjvBbA6bfbYaJCJj": {}}, "user_id": "fk2TUvn95FhO7VW3"}, {"extra_attributes": {"mbDVMDu87t0ldWf7": {}, "iSGIiKFtWtn4Yr2s": {}, "vKM6pqLGZ0TBujEL": {}}, "user_id": "AUK6mQ5iZgbwwm5i"}], "ticket_created_at": 67, "ticket_id": "pUnZmvhidwCkZwqj"}, {"first_ticket_created_at": 77, "party_attributes": {"aj4hCmTC34jxW4pI": {}, "DwdqXpmRmut9H9Xy": {}, "WI8bp8fQxRuX91uY": {}}, "party_id": "mtrHJbEGTUj7YjER", "party_members": [{"extra_attributes": {"L1rEQG02zccA8wvL": {}, "sWUNd6lPKvqDejvq": {}, "klTSvDwuOrP9lzpi": {}}, "user_id": "X0VuFpZum7izxe7N"}, {"extra_attributes": {"PzjOa8E7wY76PxLv": {}, "9HBEUe89AwEw1HO4": {}, "FnKtx4XLKAmlDr19": {}}, "user_id": "uJ3nq6VerzVCcI8y"}, {"extra_attributes": {"3Cz0YqCKUh5RD9vN": {}, "Ap4jinFpnQ5xF9ww": {}, "bvMZyeDeRnVfPUa6": {}}, "user_id": "xVVBcq3wZpFIYeAg"}], "ticket_created_at": 38, "ticket_id": "9HcLJXJ7mpVI6eTY"}]}], "namespace": "AjdPlCiQQC35cj4K", "party_attributes": {"yOVgvnWbfRJtsB7c": {}, "UQZ2QUAxJrINPXpp": {}, "PNO3AfmXcgwC3IN6": {}}, "party_id": "tvKgLB9QmJIOq9dP", "queued_at": 38, "region": "WKt4sUmanYxM0UHZ", "server_name": "VNYzGMNIpWoSLkUr", "status": "fuf4U3WeYeA9t2EN", "ticket_id": "KKWrFtHIi1CMgKAO", "ticket_ids": ["G5iDcCR5PbCvDLil", "8wj9cKM3Ar6MF35h", "CER4nGmWGgTJfHlJ"], "updated_at": "1976-05-15T00:00:00Z"}' \
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
    --body '{"deployment": "fsNy9Z9OhxXvCp9y", "description": "7fLD2qfCXnlUnqxT", "findMatchTimeoutSeconds": 70, "joinable": false, "max_delay_ms": 38, "region_expansion_range_ms": 60, "region_expansion_rate_ms": 90, "region_latency_initial_range_ms": 81, "region_latency_max_ms": 80, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 79, "min": 24, "name": "ZcA92hzC7MNa8vVe"}, {"max": 83, "min": 79, "name": "x2CXKlvIomU3pIxM"}, {"max": 55, "min": 28, "name": "K5PRMRMwdvl0hv6g"}], [{"max": 61, "min": 5, "name": "GxBW2tQF5tkTjgJa"}, {"max": 80, "min": 44, "name": "YvNQOsDa4bkcgepq"}, {"max": 40, "min": 48, "name": "XjdyRJunZPkp6ccI"}], [{"max": 57, "min": 75, "name": "nWyPw8mj7gyQ7XdI"}, {"max": 38, "min": 52, "name": "miteR5eQAe1rzmmg"}, {"max": 34, "min": 69, "name": "BPRmd6mO4oI8KDqe"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 25, "role_flexing_second": 81}, "maxNumber": 36, "minNumber": 67, "playerMaxNumber": 1, "playerMinNumber": 80}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 80, "min": 49, "name": "BJ5y7axEkvI4oxZE"}, {"max": 61, "min": 49, "name": "f1Ybgg8rdwY9bmrv"}, {"max": 68, "min": 24, "name": "mO07KNqX9LM2IwEs"}], [{"max": 7, "min": 71, "name": "OGBXBwnzDX8v3xgC"}, {"max": 66, "min": 76, "name": "e9PdbTTAJ2Gp1r0s"}, {"max": 97, "min": 80, "name": "Z6LJAOddIL2l3hPj"}], [{"max": 81, "min": 6, "name": "DKv2LWfXqjr8fS79"}, {"max": 62, "min": 46, "name": "n3wYowBdkaZ3y6i3"}, {"max": 85, "min": 87, "name": "01vxP8xj1LyEirUR"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 96, "role_flexing_second": 63}, "duration": 29, "max_number": 80, "min_number": 52, "player_max_number": 96, "player_min_number": 31}, {"combination": {"alliances": [[{"max": 57, "min": 71, "name": "JWodpdwsX1jorcyR"}, {"max": 57, "min": 47, "name": "rkzUvck3xTtmOFMe"}, {"max": 3, "min": 38, "name": "S4AdlNzwog2IhErk"}], [{"max": 81, "min": 15, "name": "hNcECWwchW6zL9Sk"}, {"max": 3, "min": 97, "name": "LlrNXnGanMazb8jv"}, {"max": 90, "min": 22, "name": "WenURH48aJuALEcS"}], [{"max": 34, "min": 46, "name": "cE15u6D31DjOsrs3"}, {"max": 58, "min": 48, "name": "UYATdqnQGbqiqOkN"}, {"max": 9, "min": 81, "name": "ATj7eGjodd7CcJUr"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 78, "role_flexing_second": 29}, "duration": 53, "max_number": 97, "min_number": 42, "player_max_number": 13, "player_min_number": 98}, {"combination": {"alliances": [[{"max": 75, "min": 82, "name": "5kypNrp2nFe9FmN8"}, {"max": 41, "min": 37, "name": "S6x9cLJ1APnNlsa2"}, {"max": 3, "min": 95, "name": "RBr27fVMWuAfDqLM"}], [{"max": 89, "min": 78, "name": "919IZPKOKiAVQXXO"}, {"max": 24, "min": 34, "name": "q2OspCZbt3Uta5I0"}, {"max": 42, "min": 27, "name": "GcL1koyHjCH5olYL"}], [{"max": 62, "min": 94, "name": "vHLjBJ9iqMcBL4Bz"}, {"max": 14, "min": 61, "name": "3yOxNInDByhnoluO"}, {"max": 2, "min": 40, "name": "XGFmPAnOkDiJq4xQ"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 83, "role_flexing_second": 68}, "duration": 39, "max_number": 33, "min_number": 12, "player_max_number": 28, "player_min_number": 30}], "batch_size": 97, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 74, "flex_flat_step_range": 19, "flex_immunity_count": 39, "flex_range_max": 58, "flex_rate_ms": 98, "flex_step_max": 10, "force_authority_match": false, "initial_step_range": 84, "mmr_max": 53, "mmr_mean": 100, "mmr_min": 20, "mmr_std_dev": 38, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "fVQh3jLBtn9pxpE7", "criteria": "BYtzB0B4CxyQrUpI", "duration": 65, "reference": 0.7896173249366922}, {"attribute": "VZ77KeRWdECaFGzf", "criteria": "Z2hxcJ2Fnemn7M23", "duration": 91, "reference": 0.4916437298804853}, {"attribute": "bqcNXSGCCvNowNmd", "criteria": "pcJgF88ySNq4Mj7m", "duration": 41, "reference": 0.9387328340989085}], "match_options": {"options": [{"name": "9yg9ADCGiXaLs2xj", "type": "HkinOD975nARHCmh"}, {"name": "NHSXuqIHsxvaUoXD", "type": "mwWsukxncuD3QxCX"}, {"name": "Md00YBWCaVVmM45m", "type": "fIZsWhkS476dGGJw"}]}, "matchingRules": [{"attribute": "J00UH197MJ6zU7JL", "criteria": "MQyMWzYQCAaPJgox", "reference": 0.5188019408538475}, {"attribute": "JoJaSzUtY4ZD0Xtb", "criteria": "0U4pH16NUsVY21NV", "reference": 0.553693089143121}, {"attribute": "s7NRen2Y3Ns0QJQe", "criteria": "aWytPfds1BYx0EaU", "reference": 0.6953453967909353}], "sort_ticket": {"search_result": "oldestTicketAge", "ticket_queue": "distance"}, "sort_tickets": [{"search_result": "distance", "threshold": 10, "ticket_queue": "random"}, {"search_result": "random", "threshold": 49, "ticket_queue": "none"}, {"search_result": "oldestTicketAge", "threshold": 84, "ticket_queue": "distance"}], "sub_game_modes": {}, "ticket_flexing_selection": "random", "ticket_flexing_selections": [{"selection": "random", "threshold": 55}, {"selection": "random", "threshold": 66}, {"selection": "newest", "threshold": 44}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 83, "socialMatchmaking": false, "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'DT8QbF7gHPTPQbvL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 't2NRqJGIKzLyH1y7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName '2L13Ornyx34luLdv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 39}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName '8M0IW4oe8KDgy0xZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'fAcNg14Ws8TIP1LK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "iFQoLDvumfqrgSfn", "count": 48, "mmrMax": 0.5724531179740631, "mmrMean": 0.9522510403823706, "mmrMin": 0.735515109717915, "mmrStdDev": 0.4653936241874749}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'cNIsQ3PuppUxDSK8' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 0, "party_attributes": {"JS9qjNLwvI8JdiY3": {}, "RRiLilmOGF6dLLIe": {}, "IVIjMcdlbdRXTGIr": {}}, "party_id": "dNL5gJPqTAjgqaTH", "party_members": [{"extra_attributes": {"f1ANTJ9Yk997XkGO": {}, "dC6ItxDT8p4n4XCF": {}, "kD1AJLCwszbZxuHS": {}}, "user_id": "gDOK8bjoF7bL2635"}, {"extra_attributes": {"KbtZTGJpqgl2IzNX": {}, "GTuQPIDpor7t1aJL": {}, "NNz6QIVC9Mfuc8VO": {}}, "user_id": "snmnlVljdWYmELe7"}, {"extra_attributes": {"4p38vumnxAnYBTxa": {}, "TIz0jcgDI8Pkz96v": {}, "d80msqIm5bufnBqr": {}}, "user_id": "pLeqhwVhjnnjKMEm"}], "ticket_created_at": 40, "ticket_id": "fLcxDC9Ynd02mECI"}, {"first_ticket_created_at": 88, "party_attributes": {"s5SWCqZXHLLa31oQ": {}, "f7BULnZDhutDM6Bq": {}, "guqD5xxGxBWtnTKU": {}}, "party_id": "e2znsqPzPkwCBo2S", "party_members": [{"extra_attributes": {"wCUsTag4MLAo3m61": {}, "P2xaNfmn8Onb1a9g": {}, "Mz0F2UBRmMhAbUWm": {}}, "user_id": "FhdYLWzMuv3zkUY0"}, {"extra_attributes": {"n0BAZkwbYkBLyO6A": {}, "0FqfhnaB3YxKNdOT": {}, "acCcJfIfXshuLUk5": {}}, "user_id": "WdpxjZx5noXPhPUT"}, {"extra_attributes": {"KbonoucNmzwOZOK5": {}, "6sDkci5rZ8iMlOuk": {}, "sQJCiRFiZWwJ7NrT": {}}, "user_id": "b1XTB9YQzUJ9XlYJ"}], "ticket_created_at": 7, "ticket_id": "BzP6EUmUXGM5anIl"}, {"first_ticket_created_at": 30, "party_attributes": {"6HdVfZVDAiU6iJOF": {}, "7JKZFNk2NKy59X8i": {}, "Og2sVBiCoeC5weXJ": {}}, "party_id": "l7PeiMH8z8dVej8N", "party_members": [{"extra_attributes": {"2yv6VTnOK7xAvM7t": {}, "uL81lsR7xxSVp3Gd": {}, "2TK0HzYviTgYmx82": {}}, "user_id": "JVBRLPZ6Iz8tne5d"}, {"extra_attributes": {"bguBF6Gsvvdl8jHz": {}, "9x7XZIjU4IK9lOLa": {}, "ZaMphKCqTq3EVheJ": {}}, "user_id": "joEEXBLIxGnNuhoJ"}, {"extra_attributes": {"M3WWPvvCiCf33ViE": {}, "dqQpoGkUWNizk5Uc": {}, "PAGv6c1ESC6hZYTY": {}}, "user_id": "Zbzf5aANNNs5kgSZ"}], "ticket_created_at": 81, "ticket_id": "7MSBqabUXOGkkoMU"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'Zn1YXj5zFZeOCOR9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 82}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'iSpPFnZBJZkDnEiy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'fa2LrnpZxNnLRH36' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'bqS2oFY76PU1AziB' \
    --matchID 'OHEAj1cT3u6Zc2Fb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["rTFznTgDIwZIRWf6", "T3by2kYSCdnFKLc0", "xcTjqjdcEfU61OJY"], "party_id": "MnW49rWynp1ck1vT", "user_id": "90C6o86cSRL9cgbU"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'mulhe98oaFKlQicd' \
    --matchID 'rxVhrtwSd9QWVMYz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '7TU1TsxsChSclSkb' \
    --matchID '5aBi9K9zyv6gFZXI' \
    --namespace "$AB_NAMESPACE" \
    --userID '5nXJ7hLi6HweweRm' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'yo91dIn7QqXBDXJc' \
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
    --channelName 'rqKmXDwoEV6tCdrx' \
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