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
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "wYCA9kPI6LZrkq6D", "description": "c09nIW0Oaiw9B0D7", "find_match_timeout_seconds": 9, "game_mode": "ktQG0h5JAav5kRa6", "joinable": false, "max_delay_ms": 29, "region_expansion_range_ms": 51, "region_expansion_rate_ms": 31, "region_latency_initial_range_ms": 56, "region_latency_max_ms": 72, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 68, "name": "8SAMTwE6I56IaRDB"}, {"max": 2, "min": 49, "name": "gorQeFbQ1g7qbPng"}, {"max": 95, "min": 31, "name": "NB1vRodwpzS6DaDp"}], [{"max": 44, "min": 73, "name": "N7ZQVqGj6oDLjWjk"}, {"max": 21, "min": 69, "name": "aXlFcDtgOjchIua5"}, {"max": 40, "min": 4, "name": "WEIC32ogW7olvbTg"}], [{"max": 36, "min": 58, "name": "hRTcPiSuL0Sly6XM"}, {"max": 50, "min": 83, "name": "E3cwyALczNIicXm7"}, {"max": 0, "min": 100, "name": "gSrjJW2OQNOs1PXh"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 17}, "max_number": 84, "min_number": 89, "player_max_number": 16, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 57, "name": "7oFgx4c8OumKtPDK"}, {"max": 74, "min": 62, "name": "DXn7Z4U68su8Xfql"}, {"max": 34, "min": 63, "name": "NiTvB6SdAdIhUDrw"}], [{"max": 29, "min": 39, "name": "Z5MecdKi5r6QEa1y"}, {"max": 38, "min": 9, "name": "LEzth6mXhzkzWkFe"}, {"max": 7, "min": 90, "name": "dSpHt0P7MIIR7Cky"}], [{"max": 66, "min": 40, "name": "6C7duuyZ0GhDogqr"}, {"max": 16, "min": 51, "name": "BRd8lDR6qVNPRZYd"}, {"max": 65, "min": 90, "name": "LIAjGGJddVCvu9vx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 22}, "duration": 76, "max_number": 75, "min_number": 66, "player_max_number": 79, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 91, "min": 70, "name": "0lyuI9a2I9u6Vpbs"}, {"max": 47, "min": 21, "name": "5w8hqUI06UpOXGSL"}, {"max": 25, "min": 96, "name": "CVuHOPlLlkvR8sKg"}], [{"max": 28, "min": 47, "name": "uRkgghGoYupD391C"}, {"max": 49, "min": 33, "name": "D6SCwGrncqmLtjQH"}, {"max": 54, "min": 25, "name": "f8TgoNm03VLisV6z"}], [{"max": 46, "min": 97, "name": "Puo3td6TC6I3lMjG"}, {"max": 91, "min": 39, "name": "WN2laRlxfcjHfYak"}, {"max": 95, "min": 3, "name": "CTqGkE7wcWfDslpJ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 40}, "duration": 55, "max_number": 77, "min_number": 85, "player_max_number": 88, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 18, "min": 50, "name": "ZMdjxcBZufQxGiHP"}, {"max": 24, "min": 86, "name": "lG4cYEzfTD1ZBm3M"}, {"max": 33, "min": 84, "name": "HcUmLZZbSqb8RwNm"}], [{"max": 27, "min": 59, "name": "9HrNQy4uZAAiE0mi"}, {"max": 39, "min": 91, "name": "9RGCCHYzUOcEdscK"}, {"max": 69, "min": 13, "name": "PEqgA8yu7Vk6Jt4Y"}], [{"max": 25, "min": 16, "name": "os9Jcdos4fYcTVU6"}, {"max": 90, "min": 25, "name": "Bt0zYoMcHyCUEXlA"}, {"max": 44, "min": 77, "name": "xJMdalwSyliWMNW5"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 41, "role_flexing_second": 33}, "duration": 39, "max_number": 79, "min_number": 23, "player_max_number": 56, "player_min_number": 98}], "batch_size": 68, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 16, "flex_flat_step_range": 72, "flex_immunity_count": 58, "flex_range_max": 61, "flex_rate_ms": 92, "flex_step_max": 70, "force_authority_match": false, "initial_step_range": 60, "mmr_max": 3, "mmr_mean": 86, "mmr_min": 99, "mmr_std_dev": 86, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "lNmqRBaAkLnvxkT1", "criteria": "X68cmDc3fxU8MyKr", "duration": 88, "reference": 0.8452748898931911}, {"attribute": "v52Dlym6puQ23xoJ", "criteria": "8aeCnaLpUKp44YUD", "duration": 20, "reference": 0.24185924236642597}, {"attribute": "WvXa3bMrXsDr6kIL", "criteria": "sSSyDdmykmoPYgc2", "duration": 76, "reference": 0.01667587390248748}], "match_options": {"options": [{"name": "N9oCMNqq98SjTvhZ", "type": "NkSQ70D0H6BXksUC"}, {"name": "9b6i5lZC9xv32e8c", "type": "5csSovoqsZNBdte9"}, {"name": "NDUPVJf6c2Z0QZxf", "type": "gPubTDIHrvqAThuw"}]}, "matching_rule": [{"attribute": "jRHpKKTlmVr9XuoJ", "criteria": "bRFQSKVPHbn4Xxtu", "reference": 0.9639977895854788}, {"attribute": "LQRENjEEztx1WsYS", "criteria": "iZqan0nSBJroav91", "reference": 0.5171230937144093}, {"attribute": "XlvPG6bFYReVHQip", "criteria": "cCx9Zw5D2L7vIYhG", "reference": 0.5235086363368513}], "rebalance_enable": false, "sort_ticket": {"search_result": "yEW4ZJJ42d3PBddN", "ticket_queue": "8S48l9lyNApflxqM"}, "sort_tickets": [{"search_result": "rj3oZk03QXcKMDYD", "threshold": 60, "ticket_queue": "1yrOMlNFSrUEirnj"}, {"search_result": "X9fDmIbeZxzfTcyi", "threshold": 41, "ticket_queue": "6yUZNmTBcvrbYCwZ"}, {"search_result": "txFHyPLtI8ilbyDP", "threshold": 95, "ticket_queue": "gGLXpUL4pp2ncYAH"}], "sub_game_modes": {"dNzDmeIP6rOvDz9K": {"alliance": {"combination": {"alliances": [[{"max": 83, "min": 25, "name": "sb392k6YmJFfRByj"}, {"max": 24, "min": 56, "name": "a9LJE8HoRS1X2PFA"}, {"max": 54, "min": 27, "name": "MwzHPxB1UskYs4Yw"}], [{"max": 50, "min": 60, "name": "aZSWMiVi10sG6vxk"}, {"max": 10, "min": 69, "name": "UcmqRRbceJ5i0EeD"}, {"max": 48, "min": 89, "name": "OgBnhhqElIaDml48"}], [{"max": 47, "min": 68, "name": "dNFLTm5T50x9WT0G"}, {"max": 11, "min": 56, "name": "H2rtOa4EXsXzOXQA"}, {"max": 22, "min": 13, "name": "4mqrxzTtuLl4XlbG"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 84, "role_flexing_second": 60}, "max_number": 47, "min_number": 1, "player_max_number": 40, "player_min_number": 27}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 19, "min": 7, "name": "zm8y2wNhmwoYZyI4"}, {"max": 63, "min": 68, "name": "FZKBcYrCEAE7WIsf"}, {"max": 25, "min": 15, "name": "x40NLRc6m8heKnWh"}], [{"max": 51, "min": 4, "name": "fe2NubeoKFeIaFQC"}, {"max": 29, "min": 60, "name": "Yk6QEgJjBbEDoNf3"}, {"max": 27, "min": 25, "name": "hEoRCAcf80zfFyab"}], [{"max": 36, "min": 55, "name": "Yq6hRkloqxM3gpwx"}, {"max": 4, "min": 74, "name": "fMy9XzjjI5YbsKoA"}, {"max": 61, "min": 77, "name": "kzJEN2VHzih3bit0"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 28, "role_flexing_second": 16}, "duration": 27, "max_number": 59, "min_number": 10, "player_max_number": 83, "player_min_number": 41}, {"combination": {"alliances": [[{"max": 94, "min": 85, "name": "RwTqUXlTDBzOuYsa"}, {"max": 60, "min": 54, "name": "zaQY3snn2ZkP7cFd"}, {"max": 86, "min": 65, "name": "3e5dC9XIBudfZgrb"}], [{"max": 70, "min": 47, "name": "DIDm4hMzF4Txoden"}, {"max": 91, "min": 35, "name": "etOO847g8OudOfjn"}, {"max": 59, "min": 65, "name": "uHZ3c46IjGa23YvY"}], [{"max": 25, "min": 81, "name": "mDg7VYPXIuvUYTZB"}, {"max": 89, "min": 35, "name": "ujIUE1Tq5jyAZvkR"}, {"max": 59, "min": 22, "name": "MNFIurjh2imdb4rb"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 53, "role_flexing_second": 20}, "duration": 10, "max_number": 73, "min_number": 47, "player_max_number": 56, "player_min_number": 38}, {"combination": {"alliances": [[{"max": 97, "min": 53, "name": "C0gL97ZVJSPqJiwv"}, {"max": 34, "min": 11, "name": "lYB1RSKs6gQxC3Gb"}, {"max": 91, "min": 28, "name": "0o4zGYY7KQI1AeFg"}], [{"max": 85, "min": 34, "name": "qaOkvo1aolB4lkKB"}, {"max": 14, "min": 62, "name": "qkNNlWkD9eOziYRF"}, {"max": 83, "min": 22, "name": "n0jJLHC9LxhvNXTw"}], [{"max": 67, "min": 55, "name": "HICQLfl7MUBG7qtP"}, {"max": 42, "min": 61, "name": "64yAtURKLRkb738H"}, {"max": 67, "min": 64, "name": "S6rDgMdIIlhS1fSi"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 49, "role_flexing_second": 67}, "duration": 25, "max_number": 73, "min_number": 85, "player_max_number": 94, "player_min_number": 80}], "name": "a1PsKc50Kv6ecnEe"}, "vcAx2K2zkRenmPZn": {"alliance": {"combination": {"alliances": [[{"max": 67, "min": 13, "name": "Bt4P7WnbdSJtjX7Z"}, {"max": 37, "min": 13, "name": "hZyZl5x4bRXBHUTr"}, {"max": 61, "min": 33, "name": "zZSKscfOcYu3dpCR"}], [{"max": 83, "min": 100, "name": "YqUiGKXVFCmpo6sP"}, {"max": 47, "min": 39, "name": "VOEDSJsEK5QpNhlI"}, {"max": 17, "min": 91, "name": "p6iIaTIKUkmkk9QM"}], [{"max": 95, "min": 80, "name": "Ynb76tFkEORV3bu1"}, {"max": 2, "min": 9, "name": "NCtX7W40V6Do5sYa"}, {"max": 6, "min": 5, "name": "CCFrHHC3DpZxkrQD"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 84, "role_flexing_second": 81}, "max_number": 66, "min_number": 64, "player_max_number": 44, "player_min_number": 95}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 16, "min": 4, "name": "Marv8mnfHK8CCmE2"}, {"max": 23, "min": 16, "name": "PnsbD3SGEdlwuUcc"}, {"max": 63, "min": 25, "name": "536ugBp3HBvepnDC"}], [{"max": 19, "min": 80, "name": "gyJlXe36mgWjLfFm"}, {"max": 39, "min": 49, "name": "eue9nzJ6fH24T805"}, {"max": 40, "min": 26, "name": "Vg8JqU0jZpjvsugA"}], [{"max": 83, "min": 31, "name": "S7u8RiWyerCSa8SR"}, {"max": 13, "min": 46, "name": "jdrrIxsB0NRsB1fP"}, {"max": 33, "min": 59, "name": "qRRulpqpymDkQhtr"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 46, "role_flexing_second": 17}, "duration": 89, "max_number": 28, "min_number": 97, "player_max_number": 31, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 27, "min": 47, "name": "g5BLy8wbhMssAHja"}, {"max": 32, "min": 14, "name": "IkY9Rf4wP57dBZNR"}, {"max": 74, "min": 27, "name": "YbCtmKy8M9zVrjfG"}], [{"max": 2, "min": 28, "name": "slt71B1SmZp2JZp5"}, {"max": 29, "min": 59, "name": "TTS1j02o7JjTXAQN"}, {"max": 34, "min": 6, "name": "ccLjMXJRk0eaKQDO"}], [{"max": 74, "min": 48, "name": "vrTefglSs6g4iY9u"}, {"max": 44, "min": 0, "name": "aCNYIWekp18lOC3m"}, {"max": 81, "min": 78, "name": "qF7Bl0LcghVHfPEs"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 49, "role_flexing_second": 47}, "duration": 58, "max_number": 16, "min_number": 11, "player_max_number": 89, "player_min_number": 89}, {"combination": {"alliances": [[{"max": 84, "min": 80, "name": "ncDlwi3v3MFFJ1Ke"}, {"max": 38, "min": 10, "name": "KoELCpobBEG8X645"}, {"max": 47, "min": 60, "name": "pdXpai0rYaT5hOPj"}], [{"max": 1, "min": 11, "name": "ues1Hhhkg1yLVbLF"}, {"max": 53, "min": 74, "name": "HEP8cM4NTwr0KHaA"}, {"max": 38, "min": 89, "name": "mTej52WKi6tArAUR"}], [{"max": 41, "min": 100, "name": "9plCSVq8PdH6hJPU"}, {"max": 55, "min": 42, "name": "c0RVwXgAgntLMCua"}, {"max": 30, "min": 56, "name": "V9Lx5RDA1l2Xcrci"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 51, "role_flexing_second": 66}, "duration": 45, "max_number": 58, "min_number": 91, "player_max_number": 68, "player_min_number": 37}], "name": "IPkhSgORcz5S5Bvm"}, "gBLxh4ijFnE3Tam6": {"alliance": {"combination": {"alliances": [[{"max": 33, "min": 81, "name": "SZ7PC6f6QkmZXElW"}, {"max": 77, "min": 11, "name": "uWJu3pDMUAeeZ97S"}, {"max": 57, "min": 75, "name": "ROPYuG6XqP6oo7G7"}], [{"max": 8, "min": 53, "name": "Beeoip68J1nsv4W2"}, {"max": 83, "min": 61, "name": "JhtafxMSJlHeb34s"}, {"max": 95, "min": 76, "name": "tDQs61OQAoxyyQpR"}], [{"max": 100, "min": 39, "name": "CiiPDGQhNPEwiJCf"}, {"max": 40, "min": 73, "name": "nkY6Mca5afj12K2I"}, {"max": 51, "min": 22, "name": "rBvvWm4udE0OXudX"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 81, "role_flexing_second": 81}, "max_number": 28, "min_number": 57, "player_max_number": 8, "player_min_number": 72}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 20, "min": 83, "name": "JATwlc6esUp6Sw1I"}, {"max": 73, "min": 20, "name": "rzzjrcaug6CWVG8S"}, {"max": 100, "min": 27, "name": "P3glU6muswVJnNnN"}], [{"max": 21, "min": 18, "name": "Aa7j0riFc5HTHQIo"}, {"max": 97, "min": 38, "name": "I6tRbRcrEveMdAdi"}, {"max": 85, "min": 94, "name": "KDUVSC00PYeDcagg"}], [{"max": 18, "min": 70, "name": "nxnFIna3yddcbsPh"}, {"max": 8, "min": 84, "name": "TH26IUJNvYuGRUvp"}, {"max": 1, "min": 69, "name": "A3PrIfapq5AAeMe4"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 26, "role_flexing_second": 12}, "duration": 61, "max_number": 100, "min_number": 99, "player_max_number": 13, "player_min_number": 83}, {"combination": {"alliances": [[{"max": 95, "min": 90, "name": "4pCAKxeE70CaunQN"}, {"max": 48, "min": 17, "name": "ot371W9G4AvQkqsG"}, {"max": 27, "min": 14, "name": "myo5JJTUVmb8GEXF"}], [{"max": 93, "min": 31, "name": "lEMEsFzYqwgK1Np5"}, {"max": 28, "min": 94, "name": "odqpLm7FhJBNXzAF"}, {"max": 7, "min": 84, "name": "XNbjvqhnUVLWu8ol"}], [{"max": 75, "min": 19, "name": "dxL6ozRmDD0jJvlf"}, {"max": 98, "min": 84, "name": "5OemPYdYT7DROCjt"}, {"max": 43, "min": 27, "name": "zFMbAG9YI89hmguB"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 30}, "duration": 88, "max_number": 3, "min_number": 29, "player_max_number": 26, "player_min_number": 37}, {"combination": {"alliances": [[{"max": 92, "min": 71, "name": "JC4DdrKF7SUQPLG5"}, {"max": 35, "min": 9, "name": "G0rH0zcswwVeMK6M"}, {"max": 3, "min": 100, "name": "GIVIu8vvwLc7KY3u"}], [{"max": 98, "min": 100, "name": "oJXTIMtpgkieDyF9"}, {"max": 45, "min": 24, "name": "tdxdbZUpd6FJtHJ1"}, {"max": 31, "min": 50, "name": "KTK9tmmOnYnOpas6"}], [{"max": 13, "min": 52, "name": "hP1y4Zi7s7QBlk44"}, {"max": 37, "min": 66, "name": "4B1GZgKg4uKxaCgc"}, {"max": 66, "min": 11, "name": "LuC3brWdTYCfHkIy"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 1, "role_flexing_second": 20}, "duration": 32, "max_number": 37, "min_number": 60, "player_max_number": 9, "player_min_number": 18}], "name": "E9LN9bvhOrHflIOd"}}, "ticket_flexing_selection": "6X3viLvtEk4mTIpU", "ticket_flexing_selections": [{"selection": "A9gxo8SV38nEhoXm", "threshold": 78}, {"selection": "CE48L5oLF6M4lNa4", "threshold": 73}, {"selection": "opAywelu01nryEJ0", "threshold": 80}], "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 33, "social_matchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'w0qiOiC4j0iktm0Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'PLkLOsp0LZ5njN86' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Hl8kUXzt6bSc6bWv", "players": [{"results": [{"attribute": "gpVyW9dD1kOmvrAe", "value": 0.1572555645246526}, {"attribute": "cq2LgkQuaS7RBx3v", "value": 0.13759618931287587}, {"attribute": "m02jBOxrZDyvpcLY", "value": 0.6518823088343955}], "user_id": "WA8NjxOnaEok4nOO"}, {"results": [{"attribute": "CzfsflhjbngJOUn1", "value": 0.9790376201648259}, {"attribute": "G5MlfDTk8aG40Nln", "value": 0.04156447878215774}, {"attribute": "ceIZSwgAIkgzh4pT", "value": 0.7478386688742953}], "user_id": "0Am4DZhl0bQxFJ3s"}, {"results": [{"attribute": "WCqQpQ2FbKPFMycM", "value": 0.7167464556310568}, {"attribute": "Q4qfAacR0LgB5BUX", "value": 0.3411643179087347}, {"attribute": "jcu2s6w3VifnKqmT", "value": 0.7252814116557456}], "user_id": "oGH1XEfY6QAYn6WQ"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "5UBEU1QAOHfZiGhx"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "OdcuDXSxSc3aZPV8", "client_version": "7pna08gxefTYKhux", "deployment": "aEc7M4P7UckSC6eP", "error_code": 8, "error_message": "F8KDsBZOuYQJ03BA", "game_mode": "HZ7c53q7akMpcmnn", "is_mock": "x6RVBrop9v7aZK3h", "joinable": false, "match_id": "hbN15zfQSfQrtfF3", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 93, "party_attributes": {"SVu0LQ40kepEaC4d": {}, "fiOMZfEhHr39pysF": {}, "O3Zvc1BZG99Lyvfv": {}}, "party_id": "HEsJKQQewVLMUoAn", "party_members": [{"extra_attributes": {"aRcYp7FUjfIGaffo": {}, "flEIByYqeKN0meGe": {}, "lYF5wWaDhukU4khG": {}}, "user_id": "G4vZFTYnPkmSu4PW"}, {"extra_attributes": {"am1jxR7SETWjteoc": {}, "8fgvZDDhoO05oKqy": {}, "mxLD1Lcvw6T6mZEi": {}}, "user_id": "wxxElpMYSWIeVzm7"}, {"extra_attributes": {"z9noowmlTIKVowi0": {}, "RY2VN4ZONJREdUQ3": {}, "z9F1BxNNgnke4akn": {}}, "user_id": "cw7wu9TmXfJWBPrx"}], "ticket_created_at": 60, "ticket_id": "Ns8eLzYEvwSWTaLQ"}, {"first_ticket_created_at": 18, "party_attributes": {"hjCMW64f4XhIjSoT": {}, "B2NMKtezapPr2QEP": {}, "x3zTxBGtEJIYppuU": {}}, "party_id": "SsKoHw2hyd12uSE7", "party_members": [{"extra_attributes": {"BEv3aevq6iohU1cg": {}, "4W1IS3Uv1BpWoJBa": {}, "qdg2FHcunsS1lnaO": {}}, "user_id": "2m9vqjhbeK2qN8g6"}, {"extra_attributes": {"x2PyYDo5R3hLiD5s": {}, "f5y1JsxJNGmyt0SQ": {}, "DUDoWBZVGLlkUetz": {}}, "user_id": "CAWc9x1aMjgGim51"}, {"extra_attributes": {"T107XIZRZ7tZdIs0": {}, "xf4czdt7zqmSKxOE": {}, "QlVcx6GqsBq8vdhW": {}}, "user_id": "VnuYLgpZehK0G2nm"}], "ticket_created_at": 49, "ticket_id": "W4tLqX7OICf5oD1e"}, {"first_ticket_created_at": 67, "party_attributes": {"oI9FmYel0kOw72o8": {}, "Zkgk0jS6rDWUwfhK": {}, "vrf2AaH4yCWrHSpp": {}}, "party_id": "nIZkNnTn3rzH5NvA", "party_members": [{"extra_attributes": {"tcvNedgS1fUfKmih": {}, "Dbmu8ePWlQMVDXEH": {}, "eiGTnwyEw6hIWDZr": {}}, "user_id": "pP7rz3ISW510kHr4"}, {"extra_attributes": {"isTKWjmv67nuHCXW": {}, "fwnwGioVwVzmmBVV": {}, "Ffpqx1AeLtzcPJ3j": {}}, "user_id": "tDYBo4FUTH7CGfKS"}, {"extra_attributes": {"yxgRR1DiCqSMzpqI": {}, "FGLkDs7ACC1RgBfo": {}, "NrHlFi2qJLgmBLE3": {}}, "user_id": "5YhyiDV90SeI5ypp"}], "ticket_created_at": 55, "ticket_id": "xJWWSI1ECUo1NPpe"}]}, {"matching_parties": [{"first_ticket_created_at": 64, "party_attributes": {"63ShEh8PbGikLjgj": {}, "cj34uulU6FYBZsWF": {}, "br3RSP0W9nBhvhf8": {}}, "party_id": "Q0DtJMcYQdN66bsw", "party_members": [{"extra_attributes": {"Agt65X4N1LQZmB61": {}, "JMdtwCVUrYQue84d": {}, "wmbwFEnAZaWsQJtR": {}}, "user_id": "YoagRJK5PX9UcOvh"}, {"extra_attributes": {"PyE11TRT2SKseoe8": {}, "VLie0LBa36KNzjf0": {}, "05CXNGehQ2aTjTDf": {}}, "user_id": "KFDXC7eGL5YhJDWh"}, {"extra_attributes": {"9YWqc0qgV6d9yOfI": {}, "MLds2DbPcaoMdtRL": {}, "TmSvTkQQgB7exYvm": {}}, "user_id": "HMxr5hPCJJztJBg0"}], "ticket_created_at": 39, "ticket_id": "jVwVnzaqSfJiQFC2"}, {"first_ticket_created_at": 13, "party_attributes": {"3QIZsUf8lGFXcmwT": {}, "ERHclOdxIwqejxe1": {}, "8rNdb8Otq6j1mqUa": {}}, "party_id": "v7k05HAQltnSojV4", "party_members": [{"extra_attributes": {"jT65yclX2FtAz0vJ": {}, "jFIYWOaNdsimmkW2": {}, "miH3xRHAKy4QxZka": {}}, "user_id": "XZ7vmiEd0JPxVyQp"}, {"extra_attributes": {"shaDwNqTbbFMXAMf": {}, "VXe0GZeMgsRsmH1E": {}, "QrYmkPKTPOlhTtSi": {}}, "user_id": "ZNCxuogFteTHJe4B"}, {"extra_attributes": {"hSSQkQD6WmOt6D7u": {}, "fFVTOhvQpfbBke8a": {}, "Edd36xj6wySoltDx": {}}, "user_id": "sbzxrlaKEfkoYjY2"}], "ticket_created_at": 30, "ticket_id": "J9ufwLYkqIgLuZS6"}, {"first_ticket_created_at": 14, "party_attributes": {"umrIz4NhGztZpr4U": {}, "4fwQIiLXgmRasvjO": {}, "4lj8m3XEwP2b4gd3": {}}, "party_id": "xOeii8Jnmssep2xD", "party_members": [{"extra_attributes": {"2NY0kABeGs9yxahl": {}, "d1pO0Gyf5PO3COyM": {}, "vczgEpzZ3Fbtxfhc": {}}, "user_id": "RC7IVYa6iZ5uFRYN"}, {"extra_attributes": {"n3SHiWxF0YbuU5ar": {}, "5qTLWUCy0Afgc050": {}, "XIZRW491e94mQjVO": {}}, "user_id": "OBnIWhunElqZUodp"}, {"extra_attributes": {"3IhtCSHy1ei1fIrP": {}, "vfHnRN06EjRwEQlN": {}, "apJRfk4f9Zcw1pEH": {}}, "user_id": "AyNFxcVTKuAQTGh5"}], "ticket_created_at": 56, "ticket_id": "D9IPmmsLmu3kaPj0"}]}, {"matching_parties": [{"first_ticket_created_at": 84, "party_attributes": {"p8ED5QZAufwNa8lz": {}, "fjv9oYMXMjlVHY1A": {}, "HwF3vGoav7MK0PcL": {}}, "party_id": "nEkcokKwcQ0baDT9", "party_members": [{"extra_attributes": {"OyJ2h23GUS2amU7s": {}, "yGlElXdEAOrVSnLo": {}, "cLVVYamQc4wcG5nD": {}}, "user_id": "BLJoJHbiQ5duE5p4"}, {"extra_attributes": {"cfs2E41cK8QTwiIA": {}, "vxSvNDlmM5nQFMGz": {}, "s7fzjgyc44mEh9tR": {}}, "user_id": "k8knYSV30lnroQeh"}, {"extra_attributes": {"MDli6t9unQLYXxm0": {}, "9wpGAbpEmDY9vLh3": {}, "u6EDsUmrV6kH4Oot": {}}, "user_id": "KwG3UC6XCnnZxF8C"}], "ticket_created_at": 26, "ticket_id": "YaJCJjfk2TUvn95F"}, {"first_ticket_created_at": 14, "party_attributes": {"tU6TDm5GloFSKWM1": {}, "eym5ydC6p25xCWTq": {}, "UOYZENJ1QHZQxPRX": {}}, "party_id": "H7uxBJEECQE1li3B", "party_members": [{"extra_attributes": {"g7Jxc9pUnZmvhidw": {}, "CkZwqjYLfTiCO1ND": {}, "BvQvRPnAz4VzW0Cp": {}}, "user_id": "oBCbyJsF5IjF1c0W"}, {"extra_attributes": {"338HS6CBgVRyihYN": {}, "Z84CVhziXV8HwSmv": {}, "cvcDKF19yVRafCjO": {}}, "user_id": "uSYht83AdvBaagTi"}, {"extra_attributes": {"RJ8daGTVX3Bb7jlz": {}, "5IfHgKjI9mwJSrN8": {}, "jkIykR2zbaI6PD7f": {}}, "user_id": "EscShnGUGUtV9GJ2"}], "ticket_created_at": 54, "ticket_id": "9GDbLNwjm3FK0nnX"}, {"first_ticket_created_at": 98, "party_attributes": {"poMfZ1hDHtbh4HtM": {}, "lFgvh2Dp2SoiIPp1": {}, "yvfAHS0VgLu11A3H": {}}, "party_id": "TovFi4tPAGfleyCA", "party_members": [{"extra_attributes": {"6jEtcqsnzoVILjkw": {}, "W61duF87aUyrdt4X": {}, "SpWBAetsanzqP8ox": {}}, "user_id": "frtbECD1CYPwaiBA"}, {"extra_attributes": {"xfYL8Avt70ZUT2fS": {}, "k3LL0calqxEewuGS": {}, "469k2hG0WKt4sUma": {}}, "user_id": "nYxM0UHZVNYzGMNI"}, {"extra_attributes": {"pWoSLkUrfuf4U3We": {}, "YeA9t2ENKKWrFtHI": {}, "i1CMgKAOG5iDcCR5": {}}, "user_id": "PbCvDLil8wj9cKM3"}], "ticket_created_at": 55, "ticket_id": "JsbGpO6JgehDJxEN"}]}], "namespace": "7JlZc8LMq1o2jZWu", "party_attributes": {"4yA3r0u4q1bTHXIj": {}, "fJKyFlM0u1uuoVdn": {}, "9yVoSlKNchPHNL4X": {}}, "party_id": "3LLaGPGdqLE8Sohh", "queued_at": 14, "region": "HFwinkBNi4gvqgl6", "server_name": "TZ9TGVPmv34h6T7E", "status": "sufmfxKYB4LM6H6Q", "ticket_id": "XmpZ9X3fUSR1l9xL", "ticket_ids": ["PBsmAUrD9L1IiD6M", "lcEPhMDFzjHZ3sIh", "zOx2CXKlvIomU3pI"], "updated_at": "1983-10-19T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "M9n8D2eLMe3lt9qf"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'x2UDcgVE7L9FK6e0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 78, "userID": "jgJaMYvNQOsDa4bk", "weight": 0.03374636574569834}' \
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
    --matchIDs 'gepqtxjbrztee7QL' \
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
    --strategy 'TGAak7Kaol01DK97' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'D2xnik42miteR5eQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'Ae1rzmmgqBPRmd6m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "EfOJpZm9yEYWNGMy", "description": "2pgSGSUOK68eqGJt", "findMatchTimeoutSeconds": 49, "joinable": false, "max_delay_ms": 66, "region_expansion_range_ms": 17, "region_expansion_rate_ms": 57, "region_latency_initial_range_ms": 3, "region_latency_max_ms": 27, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 13, "min": 80, "name": "g8rdwY9bmrvHmO07"}, {"max": 75, "min": 92, "name": "NqX9LM2IwEsdOGBX"}, {"max": 57, "min": 93, "name": "wnzDX8v3xgC1Ge9P"}], [{"max": 6, "min": 10, "name": "bTTAJ2Gp1r0sVZ6L"}, {"max": 73, "min": 98, "name": "AOddIL2l3hPjNDKv"}, {"max": 18, "min": 78, "name": "IJFNxuNOmUSWw18T"}], [{"max": 29, "min": 70, "name": "wBdkaZ3y6i38XQjL"}, {"max": 60, "min": 48, "name": "RqkpiFK5BtiQ272U"}, {"max": 29, "min": 80, "name": "9UBJWodpdwsX1jor"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 50, "role_flexing_second": 27}, "maxNumber": 89, "minNumber": 67, "playerMaxNumber": 57, "playerMinNumber": 47}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 36, "min": 21, "name": "YiHF8ITGPRQBCgIs"}, {"max": 86, "min": 55, "name": "2lzxl0yF5m77TTh4"}, {"max": 13, "min": 4, "name": "Uoj8u2WRcLiEtzVl"}], [{"max": 28, "min": 36, "name": "kflfn7pHY48F1dl1"}, {"max": 34, "min": 27, "name": "92m3iRlfnBAk0Cwi"}, {"max": 54, "min": 38, "name": "5u6D31DjOsrs3CUY"}], [{"max": 53, "min": 59, "name": "TdqnQGbqiqOkNeAT"}, {"max": 20, "min": 68, "name": "eGjodd7CcJUrI6MA"}, {"max": 42, "min": 13, "name": "VOem2yqPsMFxKybP"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 41, "role_flexing_second": 37}, "duration": 91, "max_number": 75, "min_number": 47, "player_max_number": 76, "player_min_number": 83}, {"combination": {"alliances": [[{"max": 5, "min": 33, "name": "LJ1APnNlsa2bRBr2"}, {"max": 12, "min": 18, "name": "VMWuAfDqLMR919IZ"}, {"max": 85, "min": 26, "name": "KOKiAVQXXOmqFHLb"}], [{"max": 50, "min": 59, "name": "XmgCNiXH8uenbC5C"}, {"max": 32, "min": 29, "name": "hgMweexsIAP5vHLj"}, {"max": 57, "min": 55, "name": "J9iqMcBL4BzhDUjh"}], [{"max": 74, "min": 81, "name": "PwbwcvQU5kG8bXGF"}, {"max": 25, "min": 85, "name": "PAnOkDiJq4xQye7H"}, {"max": 33, "min": 12, "name": "nVK3YVeOWs9mfVQh"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 57, "role_flexing_second": 17}, "duration": 40, "max_number": 10, "min_number": 26, "player_max_number": 65, "player_min_number": 32}, {"combination": {"alliances": [[{"max": 49, "min": 48, "name": "959anrNSleywHbHi"}, {"max": 13, "min": 96, "name": "6IKWVZ77KeRWdECa"}, {"max": 65, "min": 66, "name": "9ukcR6c2E2r3vk3I"}], [{"max": 10, "min": 55, "name": "3SzUo4hNBDh9ZFP1"}, {"max": 84, "min": 25, "name": "W0nXOErQPS4VsRoY"}, {"max": 71, "min": 26, "name": "K69yg9ADCGiXaLs2"}], [{"max": 48, "min": 18, "name": "jHkinOD975nARHCm"}, {"max": 15, "min": 92, "name": "NHSXuqIHsxvaUoXD"}, {"max": 25, "min": 47, "name": "wWsukxncuD3QxCXM"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 56, "role_flexing_second": 100}, "duration": 20, "max_number": 57, "min_number": 28, "player_max_number": 1, "player_min_number": 6}], "batch_size": 99, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 97, "flex_flat_step_range": 16, "flex_immunity_count": 26, "flex_range_max": 78, "flex_rate_ms": 15, "flex_step_max": 46, "force_authority_match": true, "initial_step_range": 25, "mmr_max": 17, "mmr_mean": 11, "mmr_min": 76, "mmr_std_dev": 72, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "WhkS476dGGJwJ00U", "criteria": "H197MJ6zU7JLMQyM", "duration": 100, "reference": 0.2904902726659444}, {"attribute": "VJbXi7eRZa7WwIc8", "criteria": "95ImqK6tVsaUq3st", "duration": 95, "reference": 0.8694546231501797}, {"attribute": "6NUsVY21NVIs7NRe", "criteria": "n2Y3Ns0QJQeaWytP", "duration": 11, "reference": 0.6811168272897666}], "match_options": {"options": [{"name": "pxsuD8PGqku59eFJ", "type": "rOXyDYz9vMUOPG0i"}, {"name": "HDT8QbF7gHPTPQbv", "type": "Lt2NRqJGIKzLyH1y"}, {"name": "72L13Ornyx34luLd", "type": "vtsTKXMjiw6gYPvf"}]}, "matchingRules": [{"attribute": "n2Qt9iyq3Nyk8ncu", "criteria": "2Z3eDHH9WaVO4iKh", "reference": 0.4766056107198515}, {"attribute": "cJ7TCcNIsQ3PuppU", "criteria": "xDSK8aOTGMudcxlC", "reference": 0.7698960049446094}, {"attribute": "4cNbJGQ57lPdinpj", "criteria": "S2DRfGt9GlyZVQ4X", "reference": 0.9480168725224126}], "sort_ticket": {"search_result": "7tPZSTpPq3xjrElv", "ticket_queue": "vDgw0ag7kSWE0Hiq"}, "sort_tickets": [{"search_result": "m5IuLryiEXqvUWDj", "threshold": 95, "ticket_queue": "XCFkD1AJLCwszbZx"}, {"search_result": "uHSgDOK8bjoF7bL2", "threshold": 58, "ticket_queue": "35KbtZTGJpqgl2Iz"}, {"search_result": "NXGTuQPIDpor7t1a", "threshold": 72, "ticket_queue": "sh4US8o4jfMANPpm"}], "sub_game_modes": {}, "ticket_flexing_selection": "ZDdMiCxmuCCVuFjS", "ticket_flexing_selections": [{"selection": "1GC1d2b92B4vEgj3", "threshold": 69}, {"selection": "aTIz0jcgDI8Pkz96", "threshold": 44}, {"selection": "NIY9nMrBZo0lNUBD", "threshold": 92}], "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 14, "socialMatchmaking": false, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName '2vvL28FPwTiXfLcx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'DC9Ynd02mECIQhfI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'hHtADUQ9zimQTQT9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 77}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'pFJUAJsyAfeKOufV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName '4f15NohXu6opxQGR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "t6PqlkL0diRhLC10", "count": 17, "mmrMax": 0.008199528702261927, "mmrMean": 0.10102551343474331, "mmrMin": 0.9051598794643098, "mmrStdDev": 0.619302762177249}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'LAo3m61P2xaNfmn8' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 83, "party_attributes": {"NMd1onFjGRbxtABP": {}, "XDmgNEJBhgGq5GID": {}, "hNC66szbCCf73IFb": {}}, "party_id": "RkPSSITz4TjCrJHX", "party_members": [{"extra_attributes": {"GXku2YVuOzhxHmnr": {}, "rV9ZGWrZ05sxe6A6": {}, "RpmKDebNkylbynkg": {}}, "user_id": "T9vayLLiizac7Ge6"}, {"extra_attributes": {"zKJdlt7rjF5RaJwv": {}, "kWVco2LTo5ijlvDF": {}, "8qBWCQ9dLWYyS8zd": {}}, "user_id": "hMeBXH8x6HdVfZVD"}, {"extra_attributes": {"AiU6iJOF7JKZFNk2": {}, "NKy59X8iOg2sVBiC": {}, "oeC5weXJl7PeiMH8": {}}, "user_id": "z8dVej8N2yv6VTnO"}], "ticket_created_at": 75, "ticket_id": "4djrexcbHdEtoQvp"}, {"first_ticket_created_at": 97, "party_attributes": {"xSVp3Gd2TK0HzYvi": {}, "TgYmx82JVBRLPZ6I": {}, "z8tne5dbguBF6Gsv": {}}, "party_id": "vdl8jHz9x7XZIjU4", "party_members": [{"extra_attributes": {"IK9lOLaZaMphKCqT": {}, "q3EVheJjoEEXBLIx": {}, "GnNuhoJM3WWPvvCi": {}}, "user_id": "Cf33ViEdqQpoGkUW"}, {"extra_attributes": {"Nizk5UcPAGv6c1ES": {}, "C6hZYTYZbzf5aANN": {}, "Ns5kgSZZNUHbIT9s": {}}, "user_id": "zApmWJO5vzzXZj08"}, {"extra_attributes": {"a6K1XRVfriSpPFnZ": {}, "BJZkDnEiyfa2Lrnp": {}, "ZxNnLRH36bqS2oFY": {}}, "user_id": "76PU1AziBOHEAj1c"}], "ticket_created_at": 94, "ticket_id": "Dcos5uVJ0BJfZ0jv"}, {"first_ticket_created_at": 55, "party_attributes": {"IwZIRWf6T3by2kYS": {}, "CdnFKLc0xcTjqjdc": {}, "EfU61OJYMnW49rWy": {}}, "party_id": "np1ck1vT90C6o86c", "party_members": [{"extra_attributes": {"SRL9cgbUmulhe98o": {}, "aFKlQicdrxVhrtwS": {}, "d9QWVMYz7TU1Tsxs": {}}, "user_id": "ChSclSkb5aBi9K9z"}, {"extra_attributes": {"yv6gFZXI5nXJ7hLi": {}, "6HweweRmyo91dIn7": {}, "QqXBDXJcrqKmXDwo": {}}, "user_id": "EV6tCdrxw1KOPhuv"}, {"extra_attributes": {"HuYrGWDK41uMOC0m": {}, "RvSoaGk4ktF5wnJD": {}, "g9Q3WXiydCOInVol": {}}, "user_id": "sr6CHmj763vLwtYE"}], "ticket_created_at": 72, "ticket_id": "meFpvtDtetoQVFL8"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'LNW11vtpaTxi7k48' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 18}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'DbkVs3qFTi1t530W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'j1WfzIvc3VlSXrA3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'XUGud4tVjmxEf4Xv' \
    --matchID 'VhFJTxFHITBg9x4u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["nq3eOMHIKeTyBG5d", "CUoExnKfV3869IN4", "V1OdhH4GVU7Exlkm"], "party_id": "c4xYiLjLyZrXr9Bh", "user_id": "tzn8jAdTn6xBhrci"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'ryLm67rkadH5Y41S' \
    --matchID 'LjCPrFa05Xl5TPC5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'GODS44bmm7jPdKLd' \
    --matchID 'dfdsUqjXVzW1Qqxn' \
    --namespace "$AB_NAMESPACE" \
    --userID 'WR5sheLgsAF4ctv5' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'guycGiq9j2EyIknf' \
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
    --channelName 'LDpgHnMOn8nc3gUZ' \
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