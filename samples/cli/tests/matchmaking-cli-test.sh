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
echo "1..31"

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
    --body '{"deployment": "AxcVpFrttufHIRdH", "description": "9UzVRiXbqlAw7r6W", "find_match_timeout_seconds": 9, "game_mode": "ktQG0h5JAav5kRa6", "joinable": false, "max_delay_ms": 29, "region_expansion_range_ms": 51, "region_expansion_rate_ms": 31, "region_latency_initial_range_ms": 56, "region_latency_max_ms": 72, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 68, "name": "8SAMTwE6I56IaRDB"}, {"max": 2, "min": 49, "name": "gorQeFbQ1g7qbPng"}, {"max": 95, "min": 31, "name": "NB1vRodwpzS6DaDp"}], [{"max": 44, "min": 73, "name": "N7ZQVqGj6oDLjWjk"}, {"max": 21, "min": 69, "name": "aXlFcDtgOjchIua5"}, {"max": 40, "min": 4, "name": "WEIC32ogW7olvbTg"}], [{"max": 36, "min": 58, "name": "hRTcPiSuL0Sly6XM"}, {"max": 50, "min": 83, "name": "E3cwyALczNIicXm7"}, {"max": 0, "min": 100, "name": "gSrjJW2OQNOs1PXh"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 17}, "max_number": 84, "min_number": 89, "player_max_number": 16, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 57, "name": "7oFgx4c8OumKtPDK"}, {"max": 74, "min": 62, "name": "DXn7Z4U68su8Xfql"}, {"max": 34, "min": 63, "name": "NiTvB6SdAdIhUDrw"}], [{"max": 29, "min": 39, "name": "Z5MecdKi5r6QEa1y"}, {"max": 38, "min": 9, "name": "LEzth6mXhzkzWkFe"}, {"max": 7, "min": 90, "name": "dSpHt0P7MIIR7Cky"}], [{"max": 66, "min": 40, "name": "6C7duuyZ0GhDogqr"}, {"max": 16, "min": 51, "name": "BRd8lDR6qVNPRZYd"}, {"max": 65, "min": 90, "name": "LIAjGGJddVCvu9vx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 22}, "duration": 76, "max_number": 75, "min_number": 66, "player_max_number": 79, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 91, "min": 70, "name": "0lyuI9a2I9u6Vpbs"}, {"max": 47, "min": 21, "name": "5w8hqUI06UpOXGSL"}, {"max": 25, "min": 96, "name": "CVuHOPlLlkvR8sKg"}], [{"max": 28, "min": 47, "name": "uRkgghGoYupD391C"}, {"max": 49, "min": 33, "name": "D6SCwGrncqmLtjQH"}, {"max": 54, "min": 25, "name": "f8TgoNm03VLisV6z"}], [{"max": 46, "min": 97, "name": "Puo3td6TC6I3lMjG"}, {"max": 91, "min": 39, "name": "WN2laRlxfcjHfYak"}, {"max": 95, "min": 3, "name": "CTqGkE7wcWfDslpJ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 40}, "duration": 55, "max_number": 77, "min_number": 85, "player_max_number": 88, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 18, "min": 50, "name": "ZMdjxcBZufQxGiHP"}, {"max": 24, "min": 86, "name": "lG4cYEzfTD1ZBm3M"}, {"max": 33, "min": 84, "name": "HcUmLZZbSqb8RwNm"}], [{"max": 27, "min": 59, "name": "9HrNQy4uZAAiE0mi"}, {"max": 39, "min": 91, "name": "9RGCCHYzUOcEdscK"}, {"max": 69, "min": 13, "name": "PEqgA8yu7Vk6Jt4Y"}], [{"max": 25, "min": 16, "name": "os9Jcdos4fYcTVU6"}, {"max": 90, "min": 25, "name": "Bt0zYoMcHyCUEXlA"}, {"max": 44, "min": 77, "name": "xJMdalwSyliWMNW5"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 41, "role_flexing_second": 33}, "duration": 39, "max_number": 79, "min_number": 23, "player_max_number": 56, "player_min_number": 98}], "flexing_rule": [{"attribute": "2jJCSQT279ZZPYGu", "criteria": "0rdlgdWyOtXi3cho", "duration": 88, "reference": 0.8649910709310511}, {"attribute": "X68cmDc3fxU8MyKr", "criteria": "QpM4hkkK6KKXNB3G", "duration": 45, "reference": 0.5767944816744368}, {"attribute": "8aeCnaLpUKp44YUD", "criteria": "jasWIPUvmEejtGeo", "duration": 51, "reference": 0.6114481580463396}], "match_options": {"options": [{"name": "sSSyDdmykmoPYgc2", "type": "L4jk4Lo0LSP0pf4I"}, {"name": "xjUkl535X3ateEKD", "type": "pADz1x3poD3Qgb3b"}, {"name": "oLQQ1MzH7Qm8bwbm", "type": "XgdAPh1EThG96gAF"}]}, "matching_rule": [{"attribute": "KK2WDgCcxvONZm3E", "criteria": "eERmDnyeFoF7VSZ6", "reference": 0.2504161639501601}, {"attribute": "f3vneSD2Tb3g7mSQ", "criteria": "UhAEtrmjqU6YE3p4", "reference": 0.18072800126000954}, {"attribute": "Sck0ZHn5GI39YBHq", "criteria": "aTHeKtW18iGeUlc9", "reference": 0.05054968042208763}], "rebalance_enable": false, "sub_game_modes": {"sogWa24CKNS0GqVv": {"alliance": {"combination": {"alliances": [[{"max": 96, "min": 91, "name": "fHQvsHXNUNe4mhgo"}, {"max": 87, "min": 91, "name": "B65lSAiYnNjkfZrQ"}, {"max": 44, "min": 66, "name": "oZk03QXcKMDYDDxH"}], [{"max": 92, "min": 83, "name": "ZjtqXyJ58f7Gc26S"}, {"max": 0, "min": 26, "name": "iGVkydwYWQG26yUZ"}, {"max": 81, "min": 25, "name": "hsfpFDcSDG8aMVGL"}], [{"max": 18, "min": 77, "name": "BNrDjqoxcwgGLXpU"}, {"max": 76, "min": 22, "name": "4pp2ncYAHdNzDmeI"}, {"max": 85, "min": 13, "name": "rOvDz9KOsb392k6Y"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 65, "role_flexing_second": 43}, "max_number": 11, "min_number": 41, "player_max_number": 89, "player_min_number": 49}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 56, "min": 91, "name": "yjlBiuFM3FIoVk8T"}, {"max": 84, "min": 67, "name": "FAAMwzHPxB1UskYs"}, {"max": 39, "min": 47, "name": "9y1aZSWMiVi10sG6"}], [{"max": 44, "min": 79, "name": "xkfUcmqRRbceJ5i0"}, {"max": 63, "min": 5, "name": "eDxOgBnhhqElIaDm"}, {"max": 23, "min": 23, "name": "48wdNFLTm5T50x9W"}], [{"max": 94, "min": 3, "name": "GfH2rtOa4EXsXzOX"}, {"max": 86, "min": 20, "name": "Ak4mqrxzTtuLl4Xl"}, {"max": 2, "min": 47, "name": "GL8QOxtjzm8y2wNh"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 78, "role_flexing_second": 29}, "duration": 16, "max_number": 8, "min_number": 50, "player_max_number": 59, "player_min_number": 72}, {"combination": {"alliances": [[{"max": 71, "min": 63, "name": "HeHSKLCa3xreNDUW"}, {"max": 10, "min": 25, "name": "hwH3q31A806DJgas"}, {"max": 51, "min": 4, "name": "fe2NubeoKFeIaFQC"}], [{"max": 29, "min": 60, "name": "Yk6QEgJjBbEDoNf3"}, {"max": 27, "min": 25, "name": "hEoRCAcf80zfFyab"}, {"max": 36, "min": 55, "name": "Yq6hRkloqxM3gpwx"}], [{"max": 4, "min": 74, "name": "fMy9XzjjI5YbsKoA"}, {"max": 61, "min": 77, "name": "kzJEN2VHzih3bit0"}, {"max": 97, "min": 23, "name": "Wn3CO39PXDNxtXge"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 64, "role_flexing_second": 83}, "duration": 12, "max_number": 42, "min_number": 21, "player_max_number": 38, "player_min_number": 14}, {"combination": {"alliances": [[{"max": 1, "min": 18, "name": "ZA2yyd4mbqoOfADM"}, {"max": 80, "min": 8, "name": "AXFaY9eKa699bRVh"}, {"max": 50, "min": 35, "name": "aKwwrAP2aMlu7Wtj"}], [{"max": 58, "min": 8, "name": "toYetOO847g8OudO"}, {"max": 10, "min": 5, "name": "jnCuHZ3c46IjGa23"}, {"max": 25, "min": 44, "name": "qPNs92epxk0i8Vxs"}], [{"max": 82, "min": 57, "name": "ereSvf9699mCEHTh"}, {"max": 95, "min": 88, "name": "JkETAsSp7gh4TeUT"}, {"max": 20, "min": 3, "name": "OkAYfJB8AT9t4Tv2"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 45}, "duration": 29, "max_number": 45, "min_number": 61, "player_max_number": 34, "player_min_number": 11}], "name": "lYB1RSKs6gQxC3Gb"}, "7S0o4zGYY7KQI1Ae": {"alliance": {"combination": {"alliances": [[{"max": 64, "min": 80, "name": "gPqaOkvo1aolB4lk"}, {"max": 76, "min": 39, "name": "B4EYOkQ1jMD3cym8"}, {"max": 49, "min": 89, "name": "IfkOVW2grREOLx0K"}], [{"max": 82, "min": 94, "name": "ww3HICQLfl7MUBG7"}, {"max": 34, "min": 25, "name": "tPu64yAtURKLRkb7"}, {"max": 84, "min": 69, "name": "TF6oQAXVG7tnsZg5"}], [{"max": 86, "min": 16, "name": "gXjvyGJPN4eXbJE5"}, {"max": 97, "min": 75, "name": "s2GcyomQoIXimBJe"}, {"max": 16, "min": 89, "name": "yxlNsjUgxBkF6wFP"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 40, "role_flexing_second": 88}, "max_number": 19, "min_number": 10, "player_max_number": 8, "player_min_number": 16}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 29, "min": 37, "name": "gEhhM2rIizGdKvOP"}, {"max": 7, "min": 61, "name": "q5xrgxSmy1DN9LFk"}, {"max": 83, "min": 100, "name": "YqUiGKXVFCmpo6sP"}], [{"max": 47, "min": 39, "name": "VOEDSJsEK5QpNhlI"}, {"max": 17, "min": 91, "name": "p6iIaTIKUkmkk9QM"}, {"max": 95, "min": 80, "name": "Ynb76tFkEORV3bu1"}], [{"max": 2, "min": 9, "name": "NCtX7W40V6Do5sYa"}, {"max": 6, "min": 5, "name": "CCFrHHC3DpZxkrQD"}, {"max": 16, "min": 42, "name": "OG4UcqsuGKHhMRWL"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 25, "role_flexing_second": 62}, "duration": 61, "max_number": 22, "min_number": 23, "player_max_number": 16, "player_min_number": 85}, {"combination": {"alliances": [[{"max": 77, "min": 27, "name": "uIpomM8sm1MiaI1m"}, {"max": 40, "min": 41, "name": "JoARtdbBe7udsMro"}, {"max": 21, "min": 24, "name": "0WvGYYnx4V709xbn"}], [{"max": 67, "min": 9, "name": "nzJ6fH24T805tVg8"}, {"max": 73, "min": 33, "name": "TVqJdvzcWbfUpaXp"}, {"max": 90, "min": 73, "name": "iWyerCSa8SRgwsAj"}], [{"max": 72, "min": 16, "name": "xsB0NRsB1fPqqRRu"}, {"max": 23, "min": 54, "name": "pqpymDkQhtrHWwRV"}, {"max": 27, "min": 27, "name": "wVBOqOHi8pWGd1ju"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 71, "role_flexing_second": 17}, "duration": 22, "max_number": 34, "min_number": 20, "player_max_number": 88, "player_min_number": 89}, {"combination": {"alliances": [[{"max": 73, "min": 12, "name": "OqB5F93zFQbJndUD"}, {"max": 31, "min": 25, "name": "dONneAczbBdHb2sl"}, {"max": 40, "min": 88, "name": "71B1SmZp2JZp50Cn"}], [{"max": 86, "min": 92, "name": "b71ORYcmQbTU5JX8"}, {"max": 4, "min": 37, "name": "cLjMXJRk0eaKQDOJ"}, {"max": 44, "min": 70, "name": "rTefglSs6g4iY9u0"}], [{"max": 0, "min": 0, "name": "izwiilatuUjjt9lI"}, {"max": 78, "min": 33, "name": "Gql5ElEa9EIIlGcH"}, {"max": 57, "min": 49, "name": "3CfR3ncDlwi3v3MF"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 76, "role_flexing_second": 5}, "duration": 9, "max_number": 38, "min_number": 10, "player_max_number": 74, "player_min_number": 4}], "name": "oELCpobBEG8X645x"}, "pdXpai0rYaT5hOPj": {"alliance": {"combination": {"alliances": [[{"max": 1, "min": 11, "name": "ues1Hhhkg1yLVbLF"}, {"max": 53, "min": 74, "name": "HEP8cM4NTwr0KHaA"}, {"max": 38, "min": 89, "name": "mTej52WKi6tArAUR"}], [{"max": 41, "min": 100, "name": "9plCSVq8PdH6hJPU"}, {"max": 55, "min": 42, "name": "c0RVwXgAgntLMCua"}, {"max": 30, "min": 56, "name": "V9Lx5RDA1l2Xcrci"}], [{"max": 5, "min": 81, "name": "UZGCHsZYoLfR1KtO"}, {"max": 43, "min": 92, "name": "7Zy0b65uvuKNuy0y"}, {"max": 39, "min": 93, "name": "ZQ7M6Nzy1adnSKOL"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 24, "role_flexing_second": 7}, "max_number": 100, "min_number": 77, "player_max_number": 11, "player_min_number": 41}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 90, "min": 100, "name": "Sse6AAz3S4czz0QK"}, {"max": 64, "min": 82, "name": "lAVmVLu4AOec0z8e"}, {"max": 57, "min": 6, "name": "eeoip68J1nsv4W2O"}], [{"max": 73, "min": 77, "name": "htafxMSJlHeb34sZ"}, {"max": 76, "min": 40, "name": "Hcl5LLLOexL4fZvW"}, {"max": 39, "min": 59, "name": "ND2tcBFpX8lNtFEJ"}], [{"max": 40, "min": 73, "name": "nkY6Mca5afj12K2I"}, {"max": 51, "min": 22, "name": "rBvvWm4udE0OXudX"}, {"max": 13, "min": 22, "name": "Nne8kJATwlc6esUp"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 26, "role_flexing_second": 71}, "duration": 73, "max_number": 20, "min_number": 36, "player_max_number": 9, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 52, "min": 87, "name": "jrcaug6CWVG8SWP3"}, {"max": 12, "min": 6, "name": "lU6muswVJnNnN7kA"}, {"max": 0, "min": 37, "name": "7j0riFc5HTHQIoVs"}], [{"max": 67, "min": 29, "name": "tRbRcrEveMdAdiPK"}, {"max": 61, "min": 50, "name": "UVSC00PYeDcaggin"}, {"max": 47, "min": 17, "name": "nFIna3yddcbsPheT"}], [{"max": 69, "min": 59, "name": "26IUJNvYuGRUvpZa"}, {"max": 69, "min": 54, "name": "CuESOiIZsMfB4ZH3"}, {"max": 26, "min": 39, "name": "mDWORBVXTIIJM9Xs"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 72, "role_flexing_second": 88}, "duration": 80, "max_number": 47, "min_number": 48, "player_max_number": 17, "player_min_number": 30}, {"combination": {"alliances": [[{"max": 40, "min": 81, "name": "371W9G4AvQkqsGnm"}, {"max": 50, "min": 30, "name": "o5JJTUVmb8GEXFTl"}, {"max": 62, "min": 49, "name": "MEsFzYqwgK1Np5no"}], [{"max": 7, "min": 34, "name": "BxqGWV6mTJ0sQs6X"}, {"max": 81, "min": 75, "name": "bjvqhnUVLWu8olKd"}, {"max": 47, "min": 75, "name": "L6ozRmDD0jJvlfV5"}], [{"max": 84, "min": 29, "name": "emPYdYT7DROCjtuz"}, {"max": 65, "min": 16, "name": "MbAG9YI89hmguB8F"}, {"max": 83, "min": 93, "name": "WGRaoQomSJC4DdrK"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 91, "role_flexing_second": 98}, "duration": 96, "max_number": 93, "min_number": 88, "player_max_number": 56, "player_min_number": 85}], "name": "crM8rG0rH0zcswwV"}}}, "session_queue_timeout_seconds": 8, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName '6MbGIVIu8vvwLc7K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'Y3uVoJXTIMtpgkie' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "DyF97lGdMiHKxbWC", "players": [{"results": [{"attribute": "Yzo8yO2KTK9tmmOn", "value": 0.8190844170554401}, {"attribute": "nOpas6ghP1y4Zi7s", "value": 0.9563387971122524}, {"attribute": "QBlk44Z44B1GZgKg", "value": 0.9042049647327567}], "user_id": "uKxaCgcGLuC3brWd"}, {"results": [{"attribute": "TYCfHkIySok5DiXZ", "value": 0.31123975394054504}, {"attribute": "LW87rGysryod3dNQ", "value": 0.2782456065482112}, {"attribute": "msApRA6HX3RwrKt2", "value": 0.07190610455309188}], "user_id": "cozL0TOg54vCE48L"}, {"results": [{"attribute": "5oLF6M4lNa4JUMSH", "value": 0.629614160062952}, {"attribute": "gqRqCV7usamANkZl", "value": 0.6571855310479416}, {"attribute": "X9Sfo95HgXqKhTPk", "value": 0.36432263381896324}], "user_id": "fLM9uSybRzWek2gZ"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "vRrvr0n9d9lvccKM"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "LhrTrcBE2ItBS3Kt", "client_version": "KZWe8aoFzAyBME74", "deployment": "HUtipUWYhWV1qx8C", "error_code": 53, "error_message": "WA8NjxOnaEok4nOO", "game_mode": "CzfsflhjbngJOUn1", "joinable": false, "match_id": "G5MlfDTk8aG40Nln", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 5, "party_attributes": {"47fH0XrKEDpEY8Vn": {}, "ocGAjci0V3tBf2jn": {}, "HGKXphn50c9tNLDl": {}}, "party_id": "jhZ2jxLRX3z46OCa", "party_members": [{"extra_attributes": {"GBeMfPlNos4yBRjr": {}, "ERHEonAZR8GmEu0q": {}, "1p6QCyY6vSkVFWds": {}}, "user_id": "bYuVEGVxYheR3j5m"}, {"extra_attributes": {"NZ6vwv7K8Asvt1j1": {}, "Rx59hesNWy2NvZ85": {}, "DDKDAF8KDsBZOuYQ": {}}, "user_id": "J03BAHZ7c53q7akM"}, {"extra_attributes": {"pcmnnx6RVBrop9v7": {}, "aZK3h65hbN15zfQS": {}, "fQrtfF3TQN0OcNDL": {}}, "user_id": "r36vzohZyjMQAg5m"}], "ticket_created_at": 86, "ticket_id": "r39pysFO3Zvc1BZG"}, {"first_ticket_created_at": 67, "party_attributes": {"LyvfvHEsJKQQewVL": {}, "MUoAnaRcYp7FUjfI": {}, "GaffoflEIByYqeKN": {}}, "party_id": "0meGelYF5wWaDhuk", "party_members": [{"extra_attributes": {"U4khGG4vZFTYnPkm": {}, "Su4PWam1jxR7SETW": {}, "jteoc8fgvZDDhoO0": {}}, "user_id": "5oKqymxLD1Lcvw6T"}, {"extra_attributes": {"6mZEiwxxElpMYSWI": {}, "eVzm7z9noowmlTIK": {}, "Vowi0RY2VN4ZONJR": {}}, "user_id": "EdUQ3z9F1BxNNgnk"}, {"extra_attributes": {"e4akncw7wu9TmXfJ": {}, "WBPrx9Ns8eLzYEvw": {}, "SWTaLQjctvrK2jhs": {}}, "user_id": "YpKPlXn77AtYoFzL"}], "ticket_created_at": 54, "ticket_id": "Pr2QEPx3zTxBGtEJ"}, {"first_ticket_created_at": 70, "party_attributes": {"xevecWw7Rry0KK5r": {}, "gAGO0dW8rX2MVUGK": {}, "SZ4GcLkt4pK32sJx": {}}, "party_id": "lZcCTpTdRtCHvuk6", "party_members": [{"extra_attributes": {"B6XTmSLyn50sigBV": {}, "ZxiKdV57GvRyd9Uu": {}, "L02Le8HSCslsDd4M": {}}, "user_id": "1F5qRIblS7Nz81GR"}, {"extra_attributes": {"azPAANjfBoldFOyq": {}, "A2clJ5gEOaCgM6Yn": {}, "6RugbNEIpGBFUjOn": {}}, "user_id": "5mM7k8nbLzvtCIW5"}, {"extra_attributes": {"ynMKquUicAeIVXto": {}, "WAXhMlW4tLqX7OIC": {}, "f5oD1e6oI9FmYel0": {}}, "user_id": "kOw72o8Zkgk0jS6r"}], "ticket_created_at": 59, "ticket_id": "cXnAXyuGz6LlxHv8"}]}, {"matching_parties": [{"first_ticket_created_at": 91, "party_attributes": {"WrHSppnIZkNnTn3r": {}, "zH5NvAtcvNedgS1f": {}, "UfKmihDbmu8ePWlQ": {}}, "party_id": "MVDXEHeiGTnwyEw6", "party_members": [{"extra_attributes": {"hIWDZrpP7rz3ISW5": {}, "10kHr4isTKWjmv67": {}, "nuHCXWfwnwGioVwV": {}}, "user_id": "zmmBVVFfpqx1AeLt"}, {"extra_attributes": {"zcPJ3jtDYBo4FUTH": {}, "7CGfKSyxgRR1DiCq": {}, "SMzpqIFGLkDs7ACC": {}}, "user_id": "1RgBfoNrHlFi2qJL"}, {"extra_attributes": {"gmBLE35YhyiDV90S": {}, "eI5yppBHoytVznCg": {}, "Nyx9fbT63ShEh8Pb": {}}, "user_id": "GikLjgjcj34uulU6"}], "ticket_created_at": 65, "ticket_id": "pxeJlsBJT6Hh3OMj"}, {"first_ticket_created_at": 55, "party_attributes": {"Bhvhf8Q0DtJMcYQd": {}, "N66bswAgt65X4N1L": {}, "QZmB61JMdtwCVUrY": {}}, "party_id": "Que84dwmbwFEnAZa", "party_members": [{"extra_attributes": {"WsQJtRYoagRJK5PX": {}, "9UcOvhPyE11TRT2S": {}, "Kseoe8VLie0LBa36": {}}, "user_id": "KNzjf005CXNGehQ2"}, {"extra_attributes": {"aTjTDfKFDXC7eGL5": {}, "YhJDWh9YWqc0qgV6": {}, "d9yOfIMLds2DbPca": {}}, "user_id": "oMdtRLTmSvTkQQgB"}, {"extra_attributes": {"7exYvmHMxr5hPCJJ": {}, "ztJBg0tTJg46IewO": {}, "XE2AkCh3QIZsUf8l": {}}, "user_id": "GFXcmwTERHclOdxI"}], "ticket_created_at": 45, "ticket_id": "wWkLob9gKLqs2nEZ"}, {"first_ticket_created_at": 16, "party_attributes": {"j1mqUav7k05HAQlt": {}, "nSojV4jT65yclX2F": {}, "tAz0vJjFIYWOaNds": {}}, "party_id": "immkW2miH3xRHAKy", "party_members": [{"extra_attributes": {"4QxZkaXZ7vmiEd0J": {}, "PxVyQpshaDwNqTbb": {}, "FMXAMfVXe0GZeMgs": {}}, "user_id": "RsmH1EQrYmkPKTPO"}, {"extra_attributes": {"lhTtSiZNCxuogFte": {}, "THJe4BhSSQkQD6Wm": {}, "Ot6D7ufFVTOhvQpf": {}}, "user_id": "bBke8aEdd36xj6wy"}, {"extra_attributes": {"SoltDxsbzxrlaKEf": {}, "koYjY2o6ouRW9UtN": {}, "quwC3WgumrIz4NhG": {}}, "user_id": "ztZpr4U4fwQIiLXg"}], "ticket_created_at": 25, "ticket_id": "YBn2xaOBdPF0JmX8"}]}, {"matching_parties": [{"first_ticket_created_at": 34, "party_attributes": {"2b4gd3xOeii8Jnms": {}, "sep2xD2NY0kABeGs": {}, "9yxahld1pO0Gyf5P": {}}, "party_id": "O3COyMvczgEpzZ3F", "party_members": [{"extra_attributes": {"btxfhcRC7IVYa6iZ": {}, "5uFRYNn3SHiWxF0Y": {}, "buU5ar5qTLWUCy0A": {}}, "user_id": "fgc050XIZRW491e9"}, {"extra_attributes": {"4mQjVOOBnIWhunEl": {}, "qZUodp3IhtCSHy1e": {}, "i1fIrPvfHnRN06Ej": {}}, "user_id": "RwEQlNapJRfk4f9Z"}, {"extra_attributes": {"cw1pEHAyNFxcVTKu": {}, "AQTGh5BxjWOozGoD": {}, "tsUuYo5p8ED5QZAu": {}}, "user_id": "fwNa8lzfjv9oYMXM"}], "ticket_created_at": 19, "ticket_id": "s69FTFVGUVhvKhJC"}, {"first_ticket_created_at": 26, "party_attributes": {"MK0PcLnEkcokKwcQ": {}, "0baDT9OyJ2h23GUS": {}, "2amU7syGlElXdEAO": {}}, "party_id": "rVSnLocLVVYamQc4", "party_members": [{"extra_attributes": {"wcG5nDBLJoJHbiQ5": {}, "duE5p4cfs2E41cK8": {}, "QTwiIAvxSvNDlmM5": {}}, "user_id": "nQFMGzs7fzjgyc44"}, {"extra_attributes": {"mEh9tRk8knYSV30l": {}, "nroQehMDli6t9unQ": {}, "LYXxm09wpGAbpEmD": {}}, "user_id": "Y9vLh3u6EDsUmrV6"}, {"extra_attributes": {"kH4OotKwG3UC6XCn": {}, "nZxF8CmQr17W65br": {}, "34rBBN9tU6TDm5Gl": {}}, "user_id": "oFSKWM1eym5ydC6p"}], "ticket_created_at": 18, "ticket_id": "5xCWTqUOYZENJ1QH"}, {"first_ticket_created_at": 34, "party_attributes": {"QxPRXH7uxBJEECQE": {}, "1li3Bg7Jxc9pUnZm": {}, "vhidwCkZwqjYLfTi": {}}, "party_id": "CO1NDBvQvRPnAz4V", "party_members": [{"extra_attributes": {"zW0CpoBCbyJsF5Ij": {}, "F1c0W338HS6CBgVR": {}, "yihYNZ84CVhziXV8": {}}, "user_id": "HwSmvcvcDKF19yVR"}, {"extra_attributes": {"afCjOuSYht83AdvB": {}, "aagTiRJ8daGTVX3B": {}, "b7jlz5IfHgKjI9mw": {}}, "user_id": "JSrN8jkIykR2zbaI"}, {"extra_attributes": {"6PD7fEscShnGUGUt": {}, "V9GJ279GDbLNwjm3": {}, "FK0nnX2poMfZ1hDH": {}}, "user_id": "tbh4HtMlFgvh2Dp2"}], "ticket_created_at": 90, "ticket_id": "inFpnQ5xF9wwbvMZ"}]}], "namespace": "yeDeRnVfPUa6xVVB", "party_attributes": {"cq3wZpFIYeAg79Hc": {}, "LJXJ7mpVI6eTYAjd": {}, "PlCiQQC35cj4KyOV": {}}, "party_id": "gvnWbfRJtsB7cUQZ", "queued_at": 86, "region": "QUAxJrINPXppPNO3", "server_name": "AfmXcgwC3IN6tvKg", "status": "LB9QmJIOq9dP5szG", "ticket_id": "71utjsQ4CrRb9gUC", "updated_at": "1973-08-02T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Vz7fWbZIdhevfZvy"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'V7AcodcZwKjYDdmJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 83, "userID": "FtHIi1CMgKAOG5iD", "weight": 0.0415639826379296}' \
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
    --matchIDs 'CR5PbCvDLil8wj9c' \
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
    --strategy 'KM3Ar6MF35hCER4n' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'GmWGgTJfHlJl4tHG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'a4XfZcd9CVnGqMX9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "FieeEssWEUl07bhw", "description": "ntCVqiYOJf5KwMZQ", "findMatchTimeoutSeconds": 19, "joinable": true, "max_delay_ms": 44, "region_expansion_range_ms": 19, "region_expansion_rate_ms": 91, "region_latency_initial_range_ms": 78, "region_latency_max_ms": 29, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 76, "min": 52, "name": "aGPGdqLE8Sohhhui"}, {"max": 94, "min": 17, "name": "nJarYYkHBDdSzBXd"}, {"max": 48, "min": 67, "name": "apwhd5IQYBQuxLvP"}], [{"max": 42, "min": 49, "name": "WYvE3fsNy9Z9OhxX"}, {"max": 44, "min": 59, "name": "fUSR1l9xLPBsmAUr"}, {"max": 61, "min": 33, "name": "9L1IiD6MlcEPhMDF"}], [{"max": 53, "min": 20, "name": "MNa8vVe4MHX6AgMe"}, {"max": 31, "min": 30, "name": "90AyyUJyAK5PRMRM"}, {"max": 46, "min": 7, "name": "lt9qfx2UDcgVE7L9"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 21, "role_flexing_second": 93}, "maxNumber": 78, "minNumber": 19, "playerMaxNumber": 37, "playerMinNumber": 13}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 84, "min": 73, "name": "c4vtxk9hVKlG56Hl"}, {"max": 52, "min": 31, "name": "Gr7XjdyRJunZPkp6"}, {"max": 4, "min": 1, "name": "cIBnWyPw8mj7gyQ7"}], [{"max": 16, "min": 6, "name": "k42miteR5eQAe1rz"}, {"max": 25, "min": 100, "name": "mgqBPRmd6mO4oI8K"}, {"max": 61, "min": 24, "name": "qebm83raNBJ5y7ax"}], [{"max": 63, "min": 84, "name": "kvI4oxZEDxGiBnNb"}, {"max": 27, "min": 35, "name": "0zaf7CaOSlHXrUSA"}, {"max": 37, "min": 80, "name": "LM2IwEsdOGBXBwnz"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 12, "role_flexing_second": 44}, "duration": 99, "max_number": 52, "min_number": 47, "player_max_number": 27, "player_min_number": 14}, {"combination": {"alliances": [[{"max": 59, "min": 58, "name": "e4LQdXfFBii2RAME"}, {"max": 37, "min": 90, "name": "VZ6LJAOddIL2l3hP"}, {"max": 19, "min": 61, "name": "NDKv2LWfXqjr8fS7"}], [{"max": 100, "min": 62, "name": "w18T1IxVWCxdvPL9"}, {"max": 9, "min": 85, "name": "QjLDRqkpiFK5BtiQ"}, {"max": 62, "min": 90, "name": "2Uo9UBJWodpdwsX1"}], [{"max": 19, "min": 29, "name": "tNanGBrkzUvck3xT"}, {"max": 40, "min": 89, "name": "mOFMebS4AdlNzwog"}, {"max": 70, "min": 25, "name": "hErkNhNcECWwchW6"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 63, "role_flexing_second": 92}, "duration": 40, "max_number": 21, "min_number": 53, "player_max_number": 3, "player_min_number": 97}, {"combination": {"alliances": [[{"max": 76, "min": 22, "name": "lrNXnGanMazb8jvR"}, {"max": 99, "min": 10, "name": "q92m3iRlfnBAk0Cw"}, {"max": 17, "min": 62, "name": "AsR65yQ9ssuHdGmx"}], [{"max": 27, "min": 6, "name": "ATdqnQGbqiqOkNeA"}, {"max": 94, "min": 20, "name": "2HHMkjzyBB4UFKia"}, {"max": 29, "min": 53, "name": "V0VOem2yqPsMFxKy"}], [{"max": 3, "min": 25, "name": "PkbuS6x9cLJ1APnN"}, {"max": 22, "min": 80, "name": "sa2bRBr27fVMWuAf"}, {"max": 61, "min": 9, "name": "qLMR919IZPKOKiAV"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 34, "role_flexing_second": 33}, "duration": 65, "max_number": 69, "min_number": 82, "player_max_number": 77, "player_min_number": 37}], "flexingRules": [{"attribute": "byXmgCNiXH8uenbC", "criteria": "5CphgMweexsIAP5v", "duration": 69, "reference": 0.2538206845822095}, {"attribute": "ABAmO2EGvJ4UMS93", "criteria": "yOxNInDByhnoluO6", "duration": 40, "reference": 0.7993066470224016}, {"attribute": "GFmPAnOkDiJq4xQy", "criteria": "e7HqnVK3YVeOWs9m", "duration": 11, "reference": 0.04127930670771551}], "match_options": {"options": [{"name": "ddXJ5zifF8y959an", "type": "rNSleywHbHig6IKW"}, {"name": "VZ77KeRWdECaFGzf", "type": "Z2hxcJ2Fnemn7M23"}, {"name": "SzUo4hNBDh9ZFP1O", "type": "W0nXOErQPS4VsRoY"}]}, "matchingRules": [{"attribute": "IK69yg9ADCGiXaLs", "criteria": "2xjHkinOD975nARH", "reference": 0.45864268127534036}, {"attribute": "mhNHSXuqIHsxvaUo", "criteria": "XDmwWsukxncuD3Qx", "reference": 0.45277208379402156}, {"attribute": "XMd00YBWCaVVmM45", "criteria": "mfIZsWhkS476dGGJ", "reference": 0.36883042123163545}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 74, "socialMatchmaking": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName '0UH197MJ6zU7JLMQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllPartyInChannel' test.out

#- 21 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'yMWzYQCAaPJgoxGJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllSessionsInChannel' test.out

#- 22 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'oJaSzUtY4ZD0Xtb0' \
    --matchID 'U4pH16NUsVY21NVI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["s7NRen2Y3Ns0QJQe", "aWytPfds1BYx0EaU", "Rydf8ZyyZeHAWGgJ"], "party_id": "UbUJRMbkcTglbU86", "user_id": "FyOjApNHBVfNOURc"}' \
    > test.out 2>&1
eval_tap $? 22 'AddUserIntoSessionInChannel' test.out

#- 23 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'jY3YYT9oTynmfIuB' \
    --matchID 'WgJTNFfM8M0IW4oe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'DeleteSessionInChannel' test.out

#- 24 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '8KDgy0xZfAcNg14W' \
    --matchID 's8TIP1LKiFQoLDvu' \
    --namespace "$AB_NAMESPACE" \
    --userID 'mfqrgSfnx2h61X9d' \
    > test.out 2>&1
eval_tap $? 24 'DeleteUserFromSessionInChannel' test.out

#- 25 SearchSessions
eval_tap 0 25 'SearchSessions # SKIP deprecated' test.out

#- 26 GetSessionHistoryDetailed
eval_tap 0 26 'GetSessionHistoryDetailed # SKIP deprecated' test.out

#- 27 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetMessages \
    > test.out 2>&1
eval_tap $? 27 'PublicGetMessages' test.out

#- 28 PublicGetAllMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetAllMatchmakingChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicGetAllMatchmakingChannel' test.out

#- 29 PublicGetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetSingleMatchmakingChannel \
    --channelName 'N1MGRXBJ6mVV7JS9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'PublicGetSingleMatchmakingChannel' test.out

#- 30 SearchSessionsV2
eval_tap 0 30 'SearchSessionsV2 # SKIP deprecated' test.out

#- 31 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 31 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE