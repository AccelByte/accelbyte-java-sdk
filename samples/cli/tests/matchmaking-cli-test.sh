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
    --body '{"deployment": "AxcVpFrttufHIRdH", "description": "9UzVRiXbqlAw7r6W", "find_match_timeout_seconds": 9, "game_mode": "ktQG0h5JAav5kRa6", "joinable": false, "max_delay_ms": 29, "region_expansion_range_ms": 51, "region_expansion_rate_ms": 31, "region_latency_initial_range_ms": 56, "region_latency_max_ms": 72, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 68, "name": "8SAMTwE6I56IaRDB"}, {"max": 2, "min": 49, "name": "gorQeFbQ1g7qbPng"}, {"max": 95, "min": 31, "name": "NB1vRodwpzS6DaDp"}], [{"max": 44, "min": 73, "name": "N7ZQVqGj6oDLjWjk"}, {"max": 21, "min": 69, "name": "aXlFcDtgOjchIua5"}, {"max": 40, "min": 4, "name": "WEIC32ogW7olvbTg"}], [{"max": 36, "min": 58, "name": "hRTcPiSuL0Sly6XM"}, {"max": 50, "min": 83, "name": "E3cwyALczNIicXm7"}, {"max": 0, "min": 100, "name": "gSrjJW2OQNOs1PXh"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 17}, "max_number": 84, "min_number": 89, "player_max_number": 16, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 57, "name": "7oFgx4c8OumKtPDK"}, {"max": 74, "min": 62, "name": "DXn7Z4U68su8Xfql"}, {"max": 34, "min": 63, "name": "NiTvB6SdAdIhUDrw"}], [{"max": 29, "min": 39, "name": "Z5MecdKi5r6QEa1y"}, {"max": 38, "min": 9, "name": "LEzth6mXhzkzWkFe"}, {"max": 7, "min": 90, "name": "dSpHt0P7MIIR7Cky"}], [{"max": 66, "min": 40, "name": "6C7duuyZ0GhDogqr"}, {"max": 16, "min": 51, "name": "BRd8lDR6qVNPRZYd"}, {"max": 65, "min": 90, "name": "LIAjGGJddVCvu9vx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 22}, "duration": 76, "max_number": 75, "min_number": 66, "player_max_number": 79, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 91, "min": 70, "name": "0lyuI9a2I9u6Vpbs"}, {"max": 47, "min": 21, "name": "5w8hqUI06UpOXGSL"}, {"max": 25, "min": 96, "name": "CVuHOPlLlkvR8sKg"}], [{"max": 28, "min": 47, "name": "uRkgghGoYupD391C"}, {"max": 49, "min": 33, "name": "D6SCwGrncqmLtjQH"}, {"max": 54, "min": 25, "name": "f8TgoNm03VLisV6z"}], [{"max": 46, "min": 97, "name": "Puo3td6TC6I3lMjG"}, {"max": 91, "min": 39, "name": "WN2laRlxfcjHfYak"}, {"max": 95, "min": 3, "name": "CTqGkE7wcWfDslpJ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 40}, "duration": 55, "max_number": 77, "min_number": 85, "player_max_number": 88, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 18, "min": 50, "name": "ZMdjxcBZufQxGiHP"}, {"max": 24, "min": 86, "name": "lG4cYEzfTD1ZBm3M"}, {"max": 33, "min": 84, "name": "HcUmLZZbSqb8RwNm"}], [{"max": 27, "min": 59, "name": "9HrNQy4uZAAiE0mi"}, {"max": 39, "min": 91, "name": "9RGCCHYzUOcEdscK"}, {"max": 69, "min": 13, "name": "PEqgA8yu7Vk6Jt4Y"}], [{"max": 25, "min": 16, "name": "os9Jcdos4fYcTVU6"}, {"max": 90, "min": 25, "name": "Bt0zYoMcHyCUEXlA"}, {"max": 44, "min": 77, "name": "xJMdalwSyliWMNW5"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 41, "role_flexing_second": 33}, "duration": 39, "max_number": 79, "min_number": 23, "player_max_number": 56, "player_min_number": 98}], "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 16, "flex_flat_step_range": 72, "flex_immunity_count": 58, "flex_range_max": 61, "flex_rate_ms": 92, "flex_step_max": 70, "force_authority_match": false, "initial_step_range": 60, "mmr_max": 3, "mmr_mean": 86, "mmr_min": 99, "mmr_std_dev": 86, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "lNmqRBaAkLnvxkT1", "criteria": "X68cmDc3fxU8MyKr", "duration": 88, "reference": 0.8452748898931911}, {"attribute": "v52Dlym6puQ23xoJ", "criteria": "8aeCnaLpUKp44YUD", "duration": 20, "reference": 0.24185924236642597}, {"attribute": "WvXa3bMrXsDr6kIL", "criteria": "sSSyDdmykmoPYgc2", "duration": 76, "reference": 0.01667587390248748}], "match_options": {"options": [{"name": "N9oCMNqq98SjTvhZ", "type": "NkSQ70D0H6BXksUC"}, {"name": "9b6i5lZC9xv32e8c", "type": "5csSovoqsZNBdte9"}, {"name": "NDUPVJf6c2Z0QZxf", "type": "gPubTDIHrvqAThuw"}]}, "matching_rule": [{"attribute": "jRHpKKTlmVr9XuoJ", "criteria": "bRFQSKVPHbn4Xxtu", "reference": 0.9639977895854788}, {"attribute": "LQRENjEEztx1WsYS", "criteria": "iZqan0nSBJroav91", "reference": 0.5171230937144093}, {"attribute": "XlvPG6bFYReVHQip", "criteria": "cCx9Zw5D2L7vIYhG", "reference": 0.5235086363368513}], "rebalance_enable": false, "sub_game_modes": {"yEW4ZJJ42d3PBddN": {"alliance": {"combination": {"alliances": [[{"max": 87, "min": 91, "name": "B65lSAiYnNjkfZrQ"}, {"max": 44, "min": 66, "name": "oZk03QXcKMDYDDxH"}, {"max": 92, "min": 83, "name": "ZjtqXyJ58f7Gc26S"}], [{"max": 0, "min": 26, "name": "iGVkydwYWQG26yUZ"}, {"max": 81, "min": 25, "name": "hsfpFDcSDG8aMVGL"}, {"max": 18, "min": 77, "name": "BNrDjqoxcwgGLXpU"}], [{"max": 76, "min": 22, "name": "4pp2ncYAHdNzDmeI"}, {"max": 85, "min": 13, "name": "rOvDz9KOsb392k6Y"}, {"max": 26, "min": 65, "name": "JFfRByjlBiuFM3FI"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 93, "role_flexing_second": 84}, "max_number": 67, "min_number": 64, "player_max_number": 31, "player_min_number": 54}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 53, "min": 54, "name": "nkCmBUqg2SCnqntX"}, {"max": 50, "min": 60, "name": "aZSWMiVi10sG6vxk"}, {"max": 10, "min": 69, "name": "UcmqRRbceJ5i0EeD"}], [{"max": 48, "min": 89, "name": "OgBnhhqElIaDml48"}, {"max": 47, "min": 68, "name": "dNFLTm5T50x9WT0G"}, {"max": 11, "min": 56, "name": "H2rtOa4EXsXzOXQA"}], [{"max": 22, "min": 13, "name": "4mqrxzTtuLl4XlbG"}, {"max": 78, "min": 13, "name": "8QOxtjzm8y2wNhmw"}, {"max": 29, "min": 16, "name": "YZyI4EFZKBcYrCEA"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 80, "role_flexing_second": 100}, "duration": 61, "max_number": 71, "min_number": 95, "player_max_number": 37, "player_min_number": 100}, {"combination": {"alliances": [[{"max": 11, "min": 10, "name": "mx40NLRc6m8heKnW"}, {"max": 15, "min": 51, "name": "b6z3LNUj7fdgLA84"}, {"max": 29, "min": 60, "name": "Yk6QEgJjBbEDoNf3"}], [{"max": 27, "min": 25, "name": "hEoRCAcf80zfFyab"}, {"max": 36, "min": 55, "name": "Yq6hRkloqxM3gpwx"}, {"max": 4, "min": 74, "name": "fMy9XzjjI5YbsKoA"}], [{"max": 61, "min": 77, "name": "kzJEN2VHzih3bit0"}, {"max": 97, "min": 23, "name": "Wn3CO39PXDNxtXge"}, {"max": 83, "min": 55, "name": "3FgkXhjDzaQY3snn"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 12, "role_flexing_second": 85}, "duration": 55, "max_number": 61, "min_number": 4, "player_max_number": 79, "player_min_number": 65}, {"combination": {"alliances": [[{"max": 80, "min": 8, "name": "AXFaY9eKa699bRVh"}, {"max": 50, "min": 35, "name": "aKwwrAP2aMlu7Wtj"}, {"max": 58, "min": 8, "name": "toYetOO847g8OudO"}], [{"max": 10, "min": 5, "name": "jnCuHZ3c46IjGa23"}, {"max": 25, "min": 44, "name": "qPNs92epxk0i8Vxs"}, {"max": 82, "min": 57, "name": "ereSvf9699mCEHTh"}], [{"max": 95, "min": 88, "name": "JkETAsSp7gh4TeUT"}, {"max": 20, "min": 3, "name": "OkAYfJB8AT9t4Tv2"}, {"max": 73, "min": 91, "name": "Y2QD3oD5fLCr3OOl"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 47}, "duration": 58, "max_number": 68, "min_number": 64, "player_max_number": 67, "player_min_number": 3}], "name": "uYnGzpipNDigNJma"}, "1MbqqZtfNWql4nmw": {"alliance": {"combination": {"alliances": [[{"max": 54, "min": 21, "name": "ft4gqkNNlWkD9eOz"}, {"max": 17, "min": 49, "name": "RFOn0jJLHC9LxhvN"}, {"max": 82, "min": 94, "name": "ww3HICQLfl7MUBG7"}], [{"max": 34, "min": 25, "name": "tPu64yAtURKLRkb7"}, {"max": 84, "min": 69, "name": "TF6oQAXVG7tnsZg5"}, {"max": 86, "min": 16, "name": "gXjvyGJPN4eXbJE5"}], [{"max": 97, "min": 75, "name": "s2GcyomQoIXimBJe"}, {"max": 16, "min": 89, "name": "yxlNsjUgxBkF6wFP"}, {"max": 29, "min": 91, "name": "JeQediogEhhM2rIi"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 56, "role_flexing_second": 75}, "max_number": 68, "min_number": 43, "player_max_number": 96, "player_min_number": 83}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 86, "name": "rDzZSKscfOcYu3dp"}, {"max": 59, "min": 22, "name": "ROYqUiGKXVFCmpo6"}, {"max": 38, "min": 0, "name": "PwVOEDSJsEK5QpNh"}], [{"max": 24, "min": 25, "name": "I2iS5EpGhhvXYck0"}, {"max": 41, "min": 32, "name": "QM0NBMA9ORxpzwLR"}, {"max": 2, "min": 54, "name": "u1bNCtX7W40V6Do5"}], [{"max": 37, "min": 67, "name": "YadCCFrHHC3DpZxk"}, {"max": 37, "min": 35, "name": "QDXuNFviMarv8mnf"}, {"max": 69, "min": 89, "name": "K8CCmE2lPnsbD3SG"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 25}, "duration": 23, "max_number": 47, "min_number": 79, "player_max_number": 42, "player_min_number": 16}, {"combination": {"alliances": [[{"max": 96, "min": 0, "name": "ccE536ugBp3HBvep"}, {"max": 28, "min": 41, "name": "DCjgyJlXe36mgWjL"}, {"max": 11, "min": 64, "name": "09xbnGezKsDwG2om"}], [{"max": 83, "min": 89, "name": "5tVg8JqU0jZpjvsu"}, {"max": 13, "min": 10, "name": "AOS7u8RiWyerCSa8"}, {"max": 91, "min": 56, "name": "RgwsAj1ik1jglaDX"}], [{"max": 93, "min": 12, "name": "vKCWwNTAhd2wrS0u"}, {"max": 84, "min": 40, "name": "djhdinpng5BLy8wb"}, {"max": 15, "min": 31, "name": "MssAHjapIkY9Rf4w"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 65}, "duration": 81, "max_number": 87, "min_number": 89, "player_max_number": 2, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 27, "min": 6, "name": "bCtmKy8M9zVrjfGX"}, {"max": 28, "min": 38, "name": "qAQUoY1GjlIIk0iK"}, {"max": 29, "min": 59, "name": "TTS1j02o7JjTXAQN"}], [{"max": 34, "min": 6, "name": "ccLjMXJRk0eaKQDO"}, {"max": 74, "min": 48, "name": "vrTefglSs6g4iY9u"}, {"max": 44, "min": 0, "name": "aCNYIWekp18lOC3m"}], [{"max": 81, "min": 78, "name": "qF7Bl0LcghVHfPEs"}, {"max": 32, "min": 57, "name": "xwhRON0bc1eMbEIj"}, {"max": 29, "min": 64, "name": "wLqc3ecjXJbZDKKo"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 47, "role_flexing_second": 60}, "duration": 31, "max_number": 50, "min_number": 6, "player_max_number": 26, "player_min_number": 39}], "name": "pai0rYaT5hOPjaf3"}, "H0tYighU0VUfcYHJ": {"alliance": {"combination": {"alliances": [[{"max": 2, "min": 63, "name": "BfAKSiPW3VgsZXiR"}, {"max": 93, "min": 59, "name": "ej52WKi6tArAURt9"}, {"max": 32, "min": 64, "name": "lCSVq8PdH6hJPUAc"}], [{"max": 61, "min": 90, "name": "uAXI66bQ71w0deoV"}, {"max": 88, "min": 77, "name": "i6BqPg4xr0lCancU"}, {"max": 51, "min": 66, "name": "vSZIPkhSgORcz5S5"}], [{"max": 56, "min": 50, "name": "vmgBLxh4ijFnE3Ta"}, {"max": 26, "min": 79, "name": "9qSZ7PC6f6QkmZXE"}, {"max": 24, "min": 7, "name": "W9YfRSse6AAz3S4c"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 87}, "max_number": 57, "min_number": 75, "player_max_number": 89, "player_min_number": 64}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 82, "min": 24, "name": "PYuG6XqP6oo7G73z"}, {"max": 6, "min": 9, "name": "xTgOfnwIdlNa29fD"}, {"max": 77, "min": 15, "name": "h741IslKHzGlLKWU"}], [{"max": 40, "min": 68, "name": "DQs61OQAoxyyQpRW"}, {"max": 59, "min": 80, "name": "iiPDGQhNPEwiJCf2"}, {"max": 40, "min": 73, "name": "nkY6Mca5afj12K2I"}], [{"max": 51, "min": 22, "name": "rBvvWm4udE0OXudX"}, {"max": 13, "min": 22, "name": "Nne8kJATwlc6esUp"}, {"max": 98, "min": 91, "name": "6xnZ5Jrzzjrcaug6"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 97}, "duration": 75, "max_number": 67, "min_number": 28, "player_max_number": 0, "player_min_number": 92}, {"combination": {"alliances": [[{"max": 21, "min": 100, "name": "noed9DHhLOqQGhCU"}, {"max": 35, "min": 21, "name": "iTrjyEgarAdNJOIG"}, {"max": 97, "min": 38, "name": "I6tRbRcrEveMdAdi"}], [{"max": 85, "min": 94, "name": "KDUVSC00PYeDcagg"}, {"max": 18, "min": 70, "name": "nxnFIna3yddcbsPh"}, {"max": 8, "min": 84, "name": "TH26IUJNvYuGRUvp"}], [{"max": 1, "min": 69, "name": "A3PrIfapq5AAeMe4"}, {"max": 76, "min": 26, "name": "3mDWORBVXTIIJM9X"}, {"max": 38, "min": 1, "name": "YIIZxiXNMR9BgaWc"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 39}, "duration": 96, "max_number": 66, "min_number": 56, "player_max_number": 27, "player_min_number": 14}, {"combination": {"alliances": [[{"max": 25, "min": 50, "name": "yo5JJTUVmb8GEXFT"}, {"max": 24, "min": 54, "name": "EMEsFzYqwgK1Np5n"}, {"max": 30, "min": 7, "name": "dqpLm7FhJBNXzAFd"}], [{"max": 84, "min": 81, "name": "Khqf6kiTdSGv2LFj"}, {"max": 54, "min": 47, "name": "KY7CbgsWqFWZX7kP"}, {"max": 56, "min": 84, "name": "om8F9GLLTG8phc3n"}], [{"max": 65, "min": 16, "name": "MbAG9YI89hmguB8F"}, {"max": 83, "min": 93, "name": "WGRaoQomSJC4DdrK"}, {"max": 64, "min": 39, "name": "7SUQPLG59e0k5ZtX"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 74}, "duration": 46, "max_number": 98, "min_number": 85, "player_max_number": 8, "player_min_number": 32}], "name": "MK6MbGIVIu8vvwLc"}}, "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 55, "social_matchmaking": true, "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'JXTIMtpgkieDyF97' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'lGdMiHKxbWCYzo8y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "O2KTK9tmmOnYnOpa", "players": [{"results": [{"attribute": "s6ghP1y4Zi7s7QBl", "value": 0.17552019816002562}, {"attribute": "44Z44B1GZgKg4uKx", "value": 0.0042681248755167545}, {"attribute": "CgcGLuC3brWdTYCf", "value": 0.5410096852020236}], "user_id": "kIySok5DiXZtLW87"}, {"results": [{"attribute": "rGysryod3dNQrmsA", "value": 0.2530512324878068}, {"attribute": "RA6HX3RwrKt2ecoz", "value": 0.6063051892784135}, {"attribute": "0TOg54vCE48L5oLF", "value": 0.9466307973479822}], "user_id": "M4lNa4JUMSHNgqRq"}, {"results": [{"attribute": "CV7usamANkZlOX9S", "value": 0.0870175222888242}, {"attribute": "o95HgXqKhTPkwfLM", "value": 0.984480442524703}, {"attribute": "uSybRzWek2gZvRrv", "value": 0.28462644901643785}], "user_id": "0n9d9lvccKMLhrTr"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "cBE2ItBS3KtKZWe8"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "aoFzAyBME74HUtip", "client_version": "UWYhWV1qx8CzPML5", "deployment": "2faXUr9Sk4lq2faB", "error_code": 5, "error_message": "lhjbngJOUn18G5Ml", "game_mode": "fDTk8aG40NlncceI", "is_mock": "ZSwgAIkgzh4pTU0A", "joinable": false, "match_id": "jci0V3tBf2jnHGKX", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 31, "party_attributes": {"QpQ2FbKPFMycMSQ4": {}, "qfAacR0LgB5BUXvj": {}, "cu2s6w3VifnKqmTS": {}}, "party_id": "oGH1XEfY6QAYn6WQ", "party_members": [{"extra_attributes": {"5UBEU1QAOHfZiGhx": {}, "OdcuDXSxSc3aZPV8": {}, "7pna08gxefTYKhux": {}}, "user_id": "aEc7M4P7UckSC6eP"}, {"extra_attributes": {"eN8i4GrFES9z7xue": {}, "HpATHccee9GXhKcj": {}, "mSEwdrkEnnqKzFsL": {}}, "user_id": "fYalUlfwEQKjU7eH"}, {"extra_attributes": {"GebSVu0LQ40kepEa": {}, "C4dfiOMZfEhHr39p": {}, "ysFO3Zvc1BZG99Ly": {}}, "user_id": "vfvHEsJKQQewVLMU"}], "ticket_created_at": 29, "ticket_id": "b44lONDDwMvgI0Hl"}, {"first_ticket_created_at": 50, "party_attributes": {"foflEIByYqeKN0me": {}, "GelYF5wWaDhukU4k": {}, "hGG4vZFTYnPkmSu4": {}}, "party_id": "PWam1jxR7SETWjte", "party_members": [{"extra_attributes": {"oc8fgvZDDhoO05oK": {}, "qymxLD1Lcvw6T6mZ": {}, "EiwxxElpMYSWIeVz": {}}, "user_id": "m7z9noowmlTIKVow"}, {"extra_attributes": {"i0RY2VN4ZONJREdU": {}, "Q3z9F1BxNNgnke4a": {}, "kncw7wu9TmXfJWBP": {}}, "user_id": "rx9Ns8eLzYEvwSWT"}, {"extra_attributes": {"aLQjctvrK2jhsYpK": {}, "PlXn77AtYoFzLAAT": {}, "PY8P8P3cfoivvQxe": {}}, "user_id": "vecWw7Rry0KK5rgA"}], "ticket_created_at": 66, "ticket_id": "SE7BEv3aevq6iohU"}, {"first_ticket_created_at": 67, "party_attributes": {"cg4W1IS3Uv1BpWoJ": {}, "Baqdg2FHcunsS1ln": {}, "aO2m9vqjhbeK2qN8": {}}, "party_id": "g6x2PyYDo5R3hLiD", "party_members": [{"extra_attributes": {"5sf5y1JsxJNGmyt0": {}, "SQDUDoWBZVGLlkUe": {}, "tzCAWc9x1aMjgGim": {}}, "user_id": "51T107XIZRZ7tZdI"}, {"extra_attributes": {"s0xf4czdt7zqmSKx": {}, "OEQlVcx6GqsBq8vd": {}, "hWVnuYLgpZehK0G2": {}}, "user_id": "nmyuViB9kRTcSQdT"}, {"extra_attributes": {"nNYGeAfYFG3wSkHK": {}, "ufBdS3ZOokZB4cXn": {}, "AXyuGz6LlxHv8Swy": {}}, "user_id": "agYvDJ3w3UNgIGj2"}], "ticket_created_at": 19, "ticket_id": "NvAtcvNedgS1fUfK"}]}, {"matching_parties": [{"first_ticket_created_at": 26, "party_attributes": {"ySa0sZoFS6xCOWMp": {}, "yh9pMsQgb64ELbzD": {}, "Mwyo4nIRysQdbufX": {}}, "party_id": "jYnSoIFeouC2m38k", "party_members": [{"extra_attributes": {"XrDZWlGVE9sJ4NpU": {}, "tKp6M9I6nEwnZhsj": {}, "wJeGwaPSDMZz95OY": {}}, "user_id": "KiqaZD63xe5rruJV"}, {"extra_attributes": {"fLGea0ZtlzUcuHAX": {}, "z0UV31MfuGaXsAuG": {}, "sZaSHevO0TQNEI3k": {}}, "user_id": "fabxJWWSI1ECUo1N"}, {"extra_attributes": {"PpeFhUztXDgB7n4C": {}, "97uAPP8PATLpUpxe": {}, "JlsBJT6Hh3OMjAjq": {}}, "user_id": "2mK8lbSEEelxnb5Q"}], "ticket_created_at": 48, "ticket_id": "bswAgt65X4N1LQZm"}, {"first_ticket_created_at": 56, "party_attributes": {"I1IQcoBQELcNlZkq": {}, "TZrKgXNwvm4e5GX6": {}, "H742OixhtAoKiVm6": {}}, "party_id": "URT95XhnUcvWB28M", "party_members": [{"extra_attributes": {"pusuhhDJ5slzgiWZ": {}, "Etyd56LfxnbY97jj": {}, "YgXchCbkXX26uEdC": {}}, "user_id": "fQaMAQuTKfC0I2kN"}, {"extra_attributes": {"jCMDtDMrentgn3Dh": {}, "qciwIeShF9RKb9vv": {}, "xuJlhXbWhbwPwToC": {}}, "user_id": "6knjVwVnzaqSfJiQ"}, {"extra_attributes": {"FC2gXoda0kg16yUS": {}, "pSOAjHJWwfCjYwWk": {}, "Lob9gKLqs2nEZhpB": {}}, "user_id": "yfHZinxNfgPAwkMB"}], "ticket_created_at": 37, "ticket_id": "jV4jT65yclX2FtAz"}, {"first_ticket_created_at": 0, "party_attributes": {"vJjFIYWOaNdsimmk": {}, "W2miH3xRHAKy4QxZ": {}, "kaXZ7vmiEd0JPxVy": {}}, "party_id": "QpshaDwNqTbbFMXA", "party_members": [{"extra_attributes": {"MfVXe0GZeMgsRsmH": {}, "1EQrYmkPKTPOlhTt": {}, "SiZNCxuogFteTHJe": {}}, "user_id": "4BhSSQkQD6WmOt6D"}, {"extra_attributes": {"7ufFVTOhvQpfbBke": {}, "8aEdd36xj6wySolt": {}, "DxsbzxrlaKEfkoYj": {}}, "user_id": "Y2o6ouRW9UtNquwC"}, {"extra_attributes": {"3WgumrIz4NhGztZp": {}, "r4U4fwQIiLXgmRas": {}, "vjO4lj8m3XEwP2b4": {}}, "user_id": "gd3xOeii8Jnmssep"}], "ticket_created_at": 56, "ticket_id": "xD2NY0kABeGs9yxa"}]}, {"matching_parties": [{"first_ticket_created_at": 15, "party_attributes": {"11W0TGTCm4fZWuk6": {}, "pQxDQpKqxLGeMvr9": {}, "TsvcMQ7dBsaIecRx": {}}, "party_id": "IsZvD6rmzVr5XT1N", "party_members": [{"extra_attributes": {"xw0v1dMQ9Rrbk6C2": {}, "cVWf6ttvbU1PO6Ap": {}, "CD2VXidT7w0Oc15N": {}}, "user_id": "8WXBPp17PAewqSm5"}, {"extra_attributes": {"x3B4t7WQnp8jXZed": {}, "gt5cyNe27HLtwtVO": {}, "axgP6Jbct8puMybY": {}}, "user_id": "GxD9IPmmsLmu3kaP"}, {"extra_attributes": {"j0O4zd8Tb7cUNGPT": {}, "BxiFFCrn7djjs69F": {}, "TFVGUVhvKhJCmeis": {}}, "user_id": "ql14mUHVbMPimNhc"}], "ticket_created_at": 94, "ticket_id": "sU3VAdMDcb4qlkiF"}, {"first_ticket_created_at": 53, "party_attributes": {"syGlElXdEAOrVSnL": {}, "ocLVVYamQc4wcG5n": {}, "DBLJoJHbiQ5duE5p": {}}, "party_id": "4cfs2E41cK8QTwiI", "party_members": [{"extra_attributes": {"AvxSvNDlmM5nQFMG": {}, "zs7fzjgyc44mEh9t": {}, "Rk8knYSV30lnroQe": {}}, "user_id": "hMDli6t9unQLYXxm"}, {"extra_attributes": {"09wpGAbpEmDY9vLh": {}, "3u6EDsUmrV6kH4Oo": {}, "tKwG3UC6XCnnZxF8": {}}, "user_id": "CmQr17W65br34rBB"}, {"extra_attributes": {"N9tU6TDm5GloFSKW": {}, "M1eym5ydC6p25xCW": {}, "TqUOYZENJ1QHZQxP": {}}, "user_id": "RXH7uxBJEECQE1li"}], "ticket_created_at": 12, "ticket_id": "Bg7Jxc9pUnZmvhid"}, {"first_ticket_created_at": 45, "party_attributes": {"dKupvXO6aj4hCmTC": {}, "34jxW4pIDwdqXpmR": {}, "mut9H9XyWI8bp8fQ": {}}, "party_id": "xRuX91uYmtrHJbEG", "party_members": [{"extra_attributes": {"TUj7YjERL1rEQG02": {}, "zccA8wvLsWUNd6lP": {}, "KvqDejvqklTSvDwu": {}}, "user_id": "OrP9lzpiX0VuFpZu"}, {"extra_attributes": {"m7izxe7NPzjOa8E7": {}, "wY76PxLv9HBEUe89": {}, "AwEw1HO4FnKtx4XL": {}}, "user_id": "KAmlDr19uJ3nq6Ve"}, {"extra_attributes": {"rzVCcI8y3Cz0YqCK": {}, "Uh5RD9vNAp4jinFp": {}, "nQ5xF9wwbvMZyeDe": {}}, "user_id": "RnVfPUa6xVVBcq3w"}], "ticket_created_at": 59, "ticket_id": "pFIYeAg79HcLJXJ7"}]}], "namespace": "mpVI6eTYAjdPlCiQ", "party_attributes": {"QC35cj4KyOVgvnWb": {}, "fRJtsB7cUQZ2QUAx": {}, "JrINPXppPNO3AfmX": {}}, "party_id": "cgwC3IN6tvKgLB9Q", "queued_at": 25, "region": "S469k2hG0WKt4sUm", "server_name": "anYxM0UHZVNYzGMN", "status": "IpWoSLkUrfuf4U3W", "ticket_id": "eYeA9t2ENKKWrFtH", "ticket_ids": ["Ii1CMgKAOG5iDcCR", "5PbCvDLil8wj9cKM", "3Ar6MF35hCER4nGm"], "updated_at": "1995-11-18T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "GgTJfHlJl4tHGa4X"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'fZcd9CVnGqMX9Fie' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 9, "userID": "fJKyFlM0u1uuoVdn", "weight": 0.9972851370448936}' \
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
    --matchIDs 'yVoSlKNchPHNL4X3' \
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
    --strategy 'LLaGPGdqLE8Sohhh' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'uiTnJarYYkHBDdSz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'BXdxapwhd5IQYBQu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "xLvPuWYvE3fsNy9Z", "description": "9OhxXvCp9y7fLD2q", "findMatchTimeoutSeconds": 11, "joinable": true, "max_delay_ms": 58, "region_expansion_range_ms": 38, "region_expansion_rate_ms": 25, "region_latency_initial_range_ms": 26, "region_latency_max_ms": 55, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 96, "name": "UnqxT1WsRNMZcA92"}, {"max": 14, "min": 60, "name": "zC7MNa8vVe4MHX6A"}, {"max": 13, "min": 24, "name": "Mep90AyyUJyAK5PR"}], [{"max": 78, "min": 76, "name": "RMwdvl0hv6g62GxB"}, {"max": 99, "min": 76, "name": "tQF5tkTjgJaMYvNQ"}, {"max": 84, "min": 15, "name": "sDa4bkcgepqtxjbr"}], [{"max": 52, "min": 90, "name": "tee7QLTGAak7Kaol"}, {"max": 46, "min": 61, "name": "mj7gyQ7XdIszGRj4"}, {"max": 58, "min": 9, "name": "OPipH1MWVTHG0qHJ"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 82}, "maxNumber": 62, "minNumber": 12, "playerMaxNumber": 30, "playerMinNumber": 83}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 71, "min": 73, "name": "8KDqebm83raNBJ5y"}, {"max": 67, "min": 0, "name": "SUOK68eqGJtWf1Yb"}, {"max": 13, "min": 80, "name": "g8rdwY9bmrvHmO07"}], [{"max": 75, "min": 92, "name": "NqX9LM2IwEsdOGBX"}, {"max": 57, "min": 93, "name": "wnzDX8v3xgC1Ge9P"}, {"max": 6, "min": 10, "name": "bTTAJ2Gp1r0sVZ6L"}], [{"max": 73, "min": 98, "name": "AOddIL2l3hPjNDKv"}, {"max": 18, "min": 78, "name": "IJFNxuNOmUSWw18T"}, {"max": 29, "min": 70, "name": "wBdkaZ3y6i38XQjL"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 90, "role_flexing_second": 85}, "duration": 33, "max_number": 21, "min_number": 48, "player_max_number": 31, "player_min_number": 19}, {"combination": {"alliances": [[{"max": 18, "min": 65, "name": "LyEirURERnEMzpIm"}, {"max": 100, "min": 28, "name": "6sjAHyCK5tNanGBr"}, {"max": 21, "min": 52, "name": "iHF8ITGPRQBCgIs1"}], [{"max": 86, "min": 55, "name": "2lzxl0yF5m77TTh4"}, {"max": 13, "min": 4, "name": "Uoj8u2WRcLiEtzVl"}, {"max": 28, "min": 36, "name": "kflfn7pHY48F1dl1"}], [{"max": 34, "min": 27, "name": "92m3iRlfnBAk0Cwi"}, {"max": 54, "min": 38, "name": "5u6D31DjOsrs3CUY"}, {"max": 53, "min": 59, "name": "TdqnQGbqiqOkNeAT"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 69, "role_flexing_second": 67}, "duration": 79, "max_number": 19, "min_number": 20, "player_max_number": 29, "player_min_number": 19}, {"combination": {"alliances": [[{"max": 7, "min": 53, "name": "d7CcJUrI6MAugK5k"}, {"max": 50, "min": 32, "name": "yqPsMFxKybPkbuS6"}, {"max": 47, "min": 76, "name": "9cLJ1APnNlsa2bRB"}], [{"max": 36, "min": 11, "name": "27fVMWuAfDqLMR91"}, {"max": 71, "min": 70, "name": "SomCsodJrhQW41q2"}, {"max": 82, "min": 77, "name": "spCZbt3Uta5I0uGc"}], [{"max": 77, "min": 59, "name": "koyHjCH5olYLETRp"}, {"max": 54, "min": 18, "name": "BAmO2EGvJ4UMS93y"}, {"max": 83, "min": 15, "name": "xNInDByhnoluO6ti"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 38, "role_flexing_second": 27}, "duration": 38, "max_number": 83, "min_number": 17, "player_max_number": 22, "player_min_number": 74}], "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 17, "flex_flat_step_range": 73, "flex_immunity_count": 82, "flex_range_max": 34, "flex_rate_ms": 53, "flex_step_max": 83, "force_authority_match": true, "initial_step_range": 18, "mmr_max": 87, "mmr_mean": 51, "mmr_min": 9, "mmr_std_dev": 83, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "nVK3YVeOWs9mfVQh", "criteria": "3jLBtn9pxpE7BYtz", "duration": 56, "reference": 0.18213055918932586}, {"attribute": "eywHbHig6IKWVZ77", "criteria": "KeRWdECaFGzfZ2hx", "duration": 4, "reference": 0.886410546097596}, {"attribute": "E2r3vk3IfAKEbqcN", "criteria": "XSGCCvNowNmdpcJg", "duration": 65, "reference": 0.2758834807355015}], "match_options": {"options": [{"name": "QPS4VsRoYIK69yg9", "type": "ADCGiXaLs2xjHkin"}, {"name": "OD975nARHCmhNHSX", "type": "uqIHsxvaUoXDmwWs"}, {"name": "ukxncuD3QxCXMd00", "type": "YBWCaVVmM45mfIZs"}]}, "matchingRules": [{"attribute": "WhkS476dGGJwJ00U", "criteria": "H197MJ6zU7JLMQyM", "reference": 0.7852545253223946}, {"attribute": "zYQCAaPJgoxGJoJa", "criteria": "SzUtY4ZD0Xtb0U4p", "reference": 0.5417119618123889}, {"attribute": "16NUsVY21NVIs7NR", "criteria": "en2Y3Ns0QJQeaWyt", "reference": 0.6618612906835735}], "sub_game_modes": {}, "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 87, "socialMatchmaking": false, "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'xsuD8PGqku59eFJr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'OXyDYz9vMUOPG0iH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'DT8QbF7gHPTPQbvL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 39}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'BVfNOURcjY3YYT9o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'TynmfIuBWgJTNFfM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "8M0IW4oe8KDgy0xZ", "count": 11, "mmrMax": 0.6902393730093748, "mmrMean": 0.3178074660678747, "mmrMin": 0.9999624464107458, "mmrStdDev": 0.1369948468994845}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'yq3Nyk8ncu2Z3eDH' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 68, "party_attributes": {"DvumfqrgSfnx2h61": {}, "X9dN1MGRXBJ6mVV7": {}, "JS9qjNLwvI8JdiY3": {}}, "party_id": "RRiLilmOGF6dLLIe", "party_members": [{"extra_attributes": {"IVIjMcdlbdRXTGIr": {}, "dNL5gJPqTAjgqaTH": {}, "f1ANTJ9Yk997XkGO": {}}, "user_id": "dC6ItxDT8p4n4XCF"}, {"extra_attributes": {"kD1AJLCwszbZxuHS": {}, "gDOK8bjoF7bL2635": {}, "KbtZTGJpqgl2IzNX": {}}, "user_id": "GTuQPIDpor7t1aJL"}, {"extra_attributes": {"NNz6QIVC9Mfuc8VO": {}, "snmnlVljdWYmELe7": {}, "4p38vumnxAnYBTxa": {}}, "user_id": "TIz0jcgDI8Pkz96v"}], "ticket_created_at": 7, "ticket_id": "IY9nMrBZo0lNUBDS"}, {"first_ticket_created_at": 14, "party_attributes": {"LeqhwVhjnnjKMEmt": {}, "biWsAQHbMrKYi0Zx": {}, "s5SWCqZXHLLa31oQ": {}}, "party_id": "f7BULnZDhutDM6Bq", "party_members": [{"extra_attributes": {"guqD5xxGxBWtnTKU": {}, "e2znsqPzPkwCBo2S": {}, "wCUsTag4MLAo3m61": {}}, "user_id": "P2xaNfmn8Onb1a9g"}, {"extra_attributes": {"Mz0F2UBRmMhAbUWm": {}, "FhdYLWzMuv3zkUY0": {}, "n0BAZkwbYkBLyO6A": {}}, "user_id": "0FqfhnaB3YxKNdOT"}, {"extra_attributes": {"acCcJfIfXshuLUk5": {}, "WdpxjZx5noXPhPUT": {}, "KbonoucNmzwOZOK5": {}}, "user_id": "6sDkci5rZ8iMlOuk"}], "ticket_created_at": 39, "ticket_id": "rjF5RaJwvkWVco2L"}, {"first_ticket_created_at": 94, "party_attributes": {"1XTB9YQzUJ9XlYJ8": {}, "BzP6EUmUXGM5anIl": {}, "oyj9lhbvuQdW2jwK": {}}, "party_id": "Uckc794ryY91lX8D", "party_members": [{"extra_attributes": {"D4MYXlrJ81lHvv9r": {}, "qvEoM8YmVjAkO3HK": {}, "sEp6KlqwW4djrexc": {}}, "user_id": "bHdEtoQvpV344Rct"}, {"extra_attributes": {"mTozCi8HeV6jbalH": {}, "mqBBfi7sSF5BoGiT": {}, "CVsXsygWbjE2opXt": {}}, "user_id": "dsJQeJ1too0qvxph"}, {"extra_attributes": {"TLEEBGTtZyTjdKNK": {}, "gYazujsmSmylT1Yt": {}, "xIq73aMb48jISd97": {}}, "user_id": "KORRhxSWLWLNfHRD"}], "ticket_created_at": 85, "ticket_id": "V15QaGGL46LuxJF3"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'sbeqWBdQuWfgBAKx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 81}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName '7MSBqabUXOGkkoMU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'Zn1YXj5zFZeOCOR9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'NvBQZSJPOIKrRBrY' \
    --matchID 'Vzi9ui3lvozTt9Ts' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["H7A0TuU2aL4bPkk1", "1sys6GdkDcos5uVJ", "0BJfZ0jvA54CSqZF"], "party_id": "DsO1skRjOU1SMfQV", "user_id": "Qa6blj9Rdd85bdYU"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'umPKVSZCg3XTc9vQ' \
    --matchID 'e0dHJfF6KIuvnRCa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '9JktyBdxkZKrEWFw' \
    --matchID '9GYxjiiOQAD77ci0' \
    --namespace "$AB_NAMESPACE" \
    --userID 'vfWVZoRRMPi57HyK' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'Kz5nyI6ulKNKoXa0' \
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
    --channelName 'dgx1JgjC56pda3Yh' \
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