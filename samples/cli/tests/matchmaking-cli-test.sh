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
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "AxcVpFrttufHIRdH", "description": "9UzVRiXbqlAw7r6W", "find_match_timeout_seconds": 9, "game_mode": "ktQG0h5JAav5kRa6", "joinable": false, "max_delay_ms": 29, "region_expansion_rate_ms": 51, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 31, "min": 56, "name": "0m8SAMTwE6I56IaR"}, {"max": 61, "min": 56, "name": "bbgorQeFbQ1g7qbP"}, {"max": 28, "min": 54, "name": "gUNB1vRodwpzS6Da"}], [{"max": 60, "min": 38, "name": "pv8N7ZQVqGj6oDLj"}, {"max": 99, "min": 18, "name": "pUkHODpoMF78NY4Y"}, {"max": 21, "min": 42, "name": "Hs1cnz1JSDgY1TXp"}], [{"max": 3, "min": 94, "name": "zsCTCrbCbPOyNQkT"}, {"max": 82, "min": 80, "name": "vyE3cwyALczNIicX"}, {"max": 25, "min": 0, "name": "WBZqxYG3aREAu2D6"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 17}, "max_number": 84, "min_number": 89, "player_max_number": 16, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 94, "min": 57, "name": "7oFgx4c8OumKtPDK"}, {"max": 74, "min": 62, "name": "DXn7Z4U68su8Xfql"}, {"max": 34, "min": 63, "name": "NiTvB6SdAdIhUDrw"}], [{"max": 29, "min": 39, "name": "Z5MecdKi5r6QEa1y"}, {"max": 38, "min": 9, "name": "LEzth6mXhzkzWkFe"}, {"max": 7, "min": 90, "name": "dSpHt0P7MIIR7Cky"}], [{"max": 66, "min": 40, "name": "6C7duuyZ0GhDogqr"}, {"max": 16, "min": 51, "name": "BRd8lDR6qVNPRZYd"}, {"max": 65, "min": 90, "name": "LIAjGGJddVCvu9vx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 22}, "duration": 76, "max_number": 75, "min_number": 66, "player_max_number": 79, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 91, "min": 70, "name": "0lyuI9a2I9u6Vpbs"}, {"max": 47, "min": 21, "name": "5w8hqUI06UpOXGSL"}, {"max": 25, "min": 96, "name": "CVuHOPlLlkvR8sKg"}], [{"max": 28, "min": 47, "name": "uRkgghGoYupD391C"}, {"max": 49, "min": 33, "name": "D6SCwGrncqmLtjQH"}, {"max": 54, "min": 25, "name": "f8TgoNm03VLisV6z"}], [{"max": 46, "min": 97, "name": "Puo3td6TC6I3lMjG"}, {"max": 91, "min": 39, "name": "WN2laRlxfcjHfYak"}, {"max": 95, "min": 3, "name": "CTqGkE7wcWfDslpJ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 40}, "duration": 55, "max_number": 77, "min_number": 85, "player_max_number": 88, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 18, "min": 50, "name": "ZMdjxcBZufQxGiHP"}, {"max": 24, "min": 86, "name": "lG4cYEzfTD1ZBm3M"}, {"max": 33, "min": 84, "name": "HcUmLZZbSqb8RwNm"}], [{"max": 27, "min": 59, "name": "9HrNQy4uZAAiE0mi"}, {"max": 39, "min": 91, "name": "9RGCCHYzUOcEdscK"}, {"max": 69, "min": 13, "name": "PEqgA8yu7Vk6Jt4Y"}], [{"max": 25, "min": 16, "name": "os9Jcdos4fYcTVU6"}, {"max": 90, "min": 25, "name": "Bt0zYoMcHyCUEXlA"}, {"max": 44, "min": 77, "name": "xJMdalwSyliWMNW5"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 41, "role_flexing_second": 33}, "duration": 39, "max_number": 79, "min_number": 23, "player_max_number": 56, "player_min_number": 98}], "flexing_rule": [{"attribute": "2jJCSQT279ZZPYGu", "criteria": "0rdlgdWyOtXi3cho", "duration": 88, "reference": 0.8649910709310511}, {"attribute": "X68cmDc3fxU8MyKr", "criteria": "QpM4hkkK6KKXNB3G", "duration": 45, "reference": 0.5767944816744368}, {"attribute": "8aeCnaLpUKp44YUD", "criteria": "jasWIPUvmEejtGeo", "duration": 51, "reference": 0.6114481580463396}], "match_options": {"options": [{"name": "sSSyDdmykmoPYgc2", "type": "L4jk4Lo0LSP0pf4I"}, {"name": "xjUkl535X3ateEKD", "type": "pADz1x3poD3Qgb3b"}, {"name": "oLQQ1MzH7Qm8bwbm", "type": "XgdAPh1EThG96gAF"}]}, "matching_rule": [{"attribute": "KK2WDgCcxvONZm3E", "criteria": "eERmDnyeFoF7VSZ6", "reference": 0.2504161639501601}, {"attribute": "f3vneSD2Tb3g7mSQ", "criteria": "UhAEtrmjqU6YE3p4", "reference": 0.18072800126000954}, {"attribute": "Sck0ZHn5GI39YBHq", "criteria": "aTHeKtW18iGeUlc9", "reference": 0.05054968042208763}], "rebalance_enable": false, "sub_game_modes": {"sogWa24CKNS0GqVv": {"alliance": {"combination": {"alliances": [[{"max": 96, "min": 91, "name": "fHQvsHXNUNe4mhgo"}, {"max": 87, "min": 91, "name": "B65lSAiYnNjkfZrQ"}, {"max": 44, "min": 66, "name": "oZk03QXcKMDYDDxH"}], [{"max": 92, "min": 83, "name": "ZjtqXyJ58f7Gc26S"}, {"max": 0, "min": 26, "name": "iGVkydwYWQG26yUZ"}, {"max": 81, "min": 25, "name": "hsfpFDcSDG8aMVGL"}], [{"max": 18, "min": 77, "name": "BNrDjqoxcwgGLXpU"}, {"max": 76, "min": 22, "name": "4pp2ncYAHdNzDmeI"}, {"max": 85, "min": 13, "name": "rOvDz9KOsb392k6Y"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 65, "role_flexing_second": 43}, "max_number": 11, "min_number": 41, "player_max_number": 89, "player_min_number": 49}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 56, "min": 91, "name": "yjlBiuFM3FIoVk8T"}, {"max": 84, "min": 67, "name": "FAAMwzHPxB1UskYs"}, {"max": 39, "min": 47, "name": "9y1aZSWMiVi10sG6"}], [{"max": 44, "min": 79, "name": "xkfUcmqRRbceJ5i0"}, {"max": 63, "min": 5, "name": "eDxOgBnhhqElIaDm"}, {"max": 23, "min": 23, "name": "48wdNFLTm5T50x9W"}], [{"max": 94, "min": 3, "name": "GfH2rtOa4EXsXzOX"}, {"max": 86, "min": 20, "name": "Ak4mqrxzTtuLl4Xl"}, {"max": 2, "min": 47, "name": "GL8QOxtjzm8y2wNh"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 78, "role_flexing_second": 29}, "duration": 16, "max_number": 8, "min_number": 50, "player_max_number": 59, "player_min_number": 72}, {"combination": {"alliances": [[{"max": 71, "min": 63, "name": "HeHSKLCa3xreNDUW"}, {"max": 10, "min": 25, "name": "hwH3q31A806DJgas"}, {"max": 51, "min": 4, "name": "fe2NubeoKFeIaFQC"}], [{"max": 29, "min": 60, "name": "Yk6QEgJjBbEDoNf3"}, {"max": 27, "min": 25, "name": "hEoRCAcf80zfFyab"}, {"max": 36, "min": 55, "name": "Yq6hRkloqxM3gpwx"}], [{"max": 4, "min": 74, "name": "fMy9XzjjI5YbsKoA"}, {"max": 61, "min": 77, "name": "kzJEN2VHzih3bit0"}, {"max": 97, "min": 23, "name": "Wn3CO39PXDNxtXge"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 64, "role_flexing_second": 83}, "duration": 12, "max_number": 42, "min_number": 21, "player_max_number": 38, "player_min_number": 14}, {"combination": {"alliances": [[{"max": 1, "min": 18, "name": "ZA2yyd4mbqoOfADM"}, {"max": 80, "min": 8, "name": "AXFaY9eKa699bRVh"}, {"max": 50, "min": 35, "name": "aKwwrAP2aMlu7Wtj"}], [{"max": 58, "min": 8, "name": "toYetOO847g8OudO"}, {"max": 10, "min": 5, "name": "jnCuHZ3c46IjGa23"}, {"max": 25, "min": 44, "name": "qPNs92epxk0i8Vxs"}], [{"max": 82, "min": 57, "name": "ereSvf9699mCEHTh"}, {"max": 95, "min": 88, "name": "JkETAsSp7gh4TeUT"}, {"max": 20, "min": 3, "name": "OkAYfJB8AT9t4Tv2"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 45}, "duration": 29, "max_number": 45, "min_number": 61, "player_max_number": 34, "player_min_number": 11}], "name": "lYB1RSKs6gQxC3Gb"}, "7S0o4zGYY7KQI1Ae": {"alliance": {"combination": {"alliances": [[{"max": 64, "min": 80, "name": "gPqaOkvo1aolB4lk"}, {"max": 76, "min": 39, "name": "B4EYOkQ1jMD3cym8"}, {"max": 49, "min": 89, "name": "IfkOVW2grREOLx0K"}], [{"max": 82, "min": 94, "name": "ww3HICQLfl7MUBG7"}, {"max": 34, "min": 25, "name": "tPu64yAtURKLRkb7"}, {"max": 84, "min": 69, "name": "TF6oQAXVG7tnsZg5"}], [{"max": 86, "min": 16, "name": "gXjvyGJPN4eXbJE5"}, {"max": 97, "min": 75, "name": "s2GcyomQoIXimBJe"}, {"max": 16, "min": 89, "name": "yxlNsjUgxBkF6wFP"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 40, "role_flexing_second": 88}, "max_number": 19, "min_number": 10, "player_max_number": 8, "player_min_number": 16}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 29, "min": 37, "name": "gEhhM2rIizGdKvOP"}, {"max": 7, "min": 61, "name": "q5xrgxSmy1DN9LFk"}, {"max": 83, "min": 100, "name": "YqUiGKXVFCmpo6sP"}], [{"max": 47, "min": 39, "name": "VOEDSJsEK5QpNhlI"}, {"max": 17, "min": 91, "name": "p6iIaTIKUkmkk9QM"}, {"max": 95, "min": 80, "name": "Ynb76tFkEORV3bu1"}], [{"max": 2, "min": 9, "name": "NCtX7W40V6Do5sYa"}, {"max": 6, "min": 5, "name": "CCFrHHC3DpZxkrQD"}, {"max": 16, "min": 42, "name": "OG4UcqsuGKHhMRWL"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 25, "role_flexing_second": 62}, "duration": 61, "max_number": 22, "min_number": 23, "player_max_number": 16, "player_min_number": 85}, {"combination": {"alliances": [[{"max": 77, "min": 27, "name": "uIpomM8sm1MiaI1m"}, {"max": 40, "min": 41, "name": "JoARtdbBe7udsMro"}, {"max": 21, "min": 24, "name": "0WvGYYnx4V709xbn"}], [{"max": 67, "min": 9, "name": "nzJ6fH24T805tVg8"}, {"max": 73, "min": 33, "name": "TVqJdvzcWbfUpaXp"}, {"max": 90, "min": 73, "name": "iWyerCSa8SRgwsAj"}], [{"max": 72, "min": 16, "name": "xsB0NRsB1fPqqRRu"}, {"max": 23, "min": 54, "name": "pqpymDkQhtrHWwRV"}, {"max": 27, "min": 27, "name": "wVBOqOHi8pWGd1ju"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 71, "role_flexing_second": 17}, "duration": 22, "max_number": 34, "min_number": 20, "player_max_number": 88, "player_min_number": 89}, {"combination": {"alliances": [[{"max": 73, "min": 12, "name": "OqB5F93zFQbJndUD"}, {"max": 31, "min": 25, "name": "dONneAczbBdHb2sl"}, {"max": 40, "min": 88, "name": "71B1SmZp2JZp50Cn"}], [{"max": 86, "min": 92, "name": "b71ORYcmQbTU5JX8"}, {"max": 4, "min": 37, "name": "cLjMXJRk0eaKQDOJ"}, {"max": 44, "min": 70, "name": "rTefglSs6g4iY9u0"}], [{"max": 0, "min": 0, "name": "izwiilatuUjjt9lI"}, {"max": 78, "min": 33, "name": "Gql5ElEa9EIIlGcH"}, {"max": 57, "min": 49, "name": "3CfR3ncDlwi3v3MF"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 76, "role_flexing_second": 5}, "duration": 9, "max_number": 38, "min_number": 10, "player_max_number": 74, "player_min_number": 4}], "name": "oELCpobBEG8X645x"}, "pdXpai0rYaT5hOPj": {"alliance": {"combination": {"alliances": [[{"max": 1, "min": 11, "name": "ues1Hhhkg1yLVbLF"}, {"max": 53, "min": 74, "name": "HEP8cM4NTwr0KHaA"}, {"max": 38, "min": 89, "name": "mTej52WKi6tArAUR"}], [{"max": 41, "min": 100, "name": "9plCSVq8PdH6hJPU"}, {"max": 55, "min": 42, "name": "c0RVwXgAgntLMCua"}, {"max": 30, "min": 56, "name": "V9Lx5RDA1l2Xcrci"}], [{"max": 5, "min": 81, "name": "UZGCHsZYoLfR1KtO"}, {"max": 43, "min": 92, "name": "7Zy0b65uvuKNuy0y"}, {"max": 39, "min": 93, "name": "ZQ7M6Nzy1adnSKOL"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 24, "role_flexing_second": 7}, "max_number": 100, "min_number": 77, "player_max_number": 11, "player_min_number": 41}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 90, "min": 100, "name": "Sse6AAz3S4czz0QK"}, {"max": 64, "min": 82, "name": "lAVmVLu4AOec0z8e"}, {"max": 57, "min": 6, "name": "eeoip68J1nsv4W2O"}], [{"max": 73, "min": 77, "name": "htafxMSJlHeb34sZ"}, {"max": 76, "min": 40, "name": "Hcl5LLLOexL4fZvW"}, {"max": 39, "min": 59, "name": "ND2tcBFpX8lNtFEJ"}], [{"max": 40, "min": 73, "name": "nkY6Mca5afj12K2I"}, {"max": 51, "min": 22, "name": "rBvvWm4udE0OXudX"}, {"max": 13, "min": 22, "name": "Nne8kJATwlc6esUp"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 26, "role_flexing_second": 71}, "duration": 73, "max_number": 20, "min_number": 36, "player_max_number": 9, "player_min_number": 52}, {"combination": {"alliances": [[{"max": 52, "min": 87, "name": "jrcaug6CWVG8SWP3"}, {"max": 12, "min": 6, "name": "lU6muswVJnNnN7kA"}, {"max": 0, "min": 37, "name": "7j0riFc5HTHQIoVs"}], [{"max": 67, "min": 29, "name": "tRbRcrEveMdAdiPK"}, {"max": 61, "min": 50, "name": "UVSC00PYeDcaggin"}, {"max": 47, "min": 17, "name": "nFIna3yddcbsPheT"}], [{"max": 69, "min": 59, "name": "26IUJNvYuGRUvpZa"}, {"max": 69, "min": 54, "name": "CuESOiIZsMfB4ZH3"}, {"max": 26, "min": 39, "name": "mDWORBVXTIIJM9Xs"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 72, "role_flexing_second": 88}, "duration": 80, "max_number": 47, "min_number": 48, "player_max_number": 17, "player_min_number": 30}, {"combination": {"alliances": [[{"max": 40, "min": 81, "name": "371W9G4AvQkqsGnm"}, {"max": 50, "min": 30, "name": "o5JJTUVmb8GEXFTl"}, {"max": 62, "min": 49, "name": "MEsFzYqwgK1Np5no"}], [{"max": 7, "min": 34, "name": "BxqGWV6mTJ0sQs6X"}, {"max": 81, "min": 75, "name": "bjvqhnUVLWu8olKd"}, {"max": 47, "min": 75, "name": "L6ozRmDD0jJvlfV5"}], [{"max": 84, "min": 29, "name": "emPYdYT7DROCjtuz"}, {"max": 65, "min": 16, "name": "MbAG9YI89hmguB8F"}, {"max": 83, "min": 93, "name": "WGRaoQomSJC4DdrK"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 91, "role_flexing_second": 98}, "duration": 96, "max_number": 93, "min_number": 88, "player_max_number": 56, "player_min_number": 85}], "name": "crM8rG0rH0zcswwV"}}}, "session_queue_timeout_seconds": 8, "social_matchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel '6MbGIVIu8vvwLc7K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Y3uVoJXTIMtpgkie", "players": [{"results": [{"attribute": "DyF97lGdMiHKxbWC", "value": 0.8089448628992986}, {"attribute": "zo8yO2KTK9tmmOnY", "value": 0.22121505186650559}, {"attribute": "Opas6ghP1y4Zi7s7", "value": 0.6856975276862539}], "user_id": "Blk44Z44B1GZgKg4"}, {"results": [{"attribute": "uKxaCgcGLuC3brWd", "value": 0.7314008738815447}, {"attribute": "YCfHkIySok5DiXZt", "value": 0.6113768666121397}, {"attribute": "W87rGysryod3dNQr", "value": 0.20785309829937804}], "user_id": "sApRA6HX3RwrKt2e"}, {"results": [{"attribute": "cozL0TOg54vCE48L", "value": 0.9280503180107562}, {"attribute": "oLF6M4lNa4JUMSHN", "value": 0.10556295648598735}, {"attribute": "qRqCV7usamANkZlO", "value": 0.7954512631360885}], "user_id": "9Sfo95HgXqKhTPkw"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "fLM9uSybRzWek2gZ"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "vRrvr0n9d9lvccKM", "client_version": "LhrTrcBE2ItBS3Kt", "deployment": "KZWe8aoFzAyBME74", "error_code": 68, "error_message": "02jBOxrZDyvpcLYO", "game_mode": "WA8NjxOnaEok4nOO", "joinable": true, "match_id": "2faBcAXXKlhvyH8p", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 0, "party_attributes": {"G5MlfDTk8aG40Nln": {}, "cceIZSwgAIkgzh4p": {}, "TU0Am4DZhl0bQxFJ": {}}, "party_id": "3sWCqQpQ2FbKPFMy", "party_members": [{"extra_attributes": {"cMSQ4qfAacR0LgB5": {}, "BUXvjcu2s6w3Vifn": {}, "KqmTSoGH1XEfY6QA": {}}, "user_id": "Yn6WQ5UBEU1QAOHf"}, {"extra_attributes": {"ZiGhxOdcuDXSxSc3": {}, "aZPV87pna08gxefT": {}, "YKhuxaEc7M4P7Uck": {}}, "user_id": "SC6ePeN8i4GrFES9"}, {"extra_attributes": {"z7xueHpATHccee9G": {}, "XhKcjmSEwdrkEnnq": {}, "KzFsLfYalUlfwEQK": {}}, "user_id": "jU7eHGebSVu0LQ40"}], "ticket_created_at": 21, "ticket_id": "r36vzohZyjMQAg5m"}, {"first_ticket_created_at": 86, "party_attributes": {"r39pysFO3Zvc1BZG": {}, "99LyvfvHEsJKQQew": {}, "VLMUoAnaRcYp7FUj": {}}, "party_id": "fIGaffoflEIByYqe", "party_members": [{"extra_attributes": {"KN0meGelYF5wWaDh": {}, "ukU4khGG4vZFTYnP": {}, "kmSu4PWam1jxR7SE": {}}, "user_id": "TWjteoc8fgvZDDho"}, {"extra_attributes": {"O05oKqymxLD1Lcvw": {}, "6T6mZEiwxxElpMYS": {}, "WIeVzm7z9noowmlT": {}}, "user_id": "IKVowi0RY2VN4ZON"}, {"extra_attributes": {"JREdUQ3z9F1BxNNg": {}, "nke4akncw7wu9TmX": {}, "fJWBPrx9Ns8eLzYE": {}}, "user_id": "vwSWTaLQjctvrK2j"}], "ticket_created_at": 14, "ticket_id": "4XhIjSoTB2NMKtez"}, {"first_ticket_created_at": 0, "party_attributes": {"LAATPY8P8P3cfoiv": {}, "vQxevecWw7Rry0KK": {}, "5rgAGO0dW8rX2MVU": {}}, "party_id": "GKSZ4GcLkt4pK32s", "party_members": [{"extra_attributes": {"JxlZcCTpTdRtCHvu": {}, "k6B6XTmSLyn50sig": {}, "BVZxiKdV57GvRyd9": {}}, "user_id": "UuL02Le8HSCslsDd"}, {"extra_attributes": {"4M1F5qRIblS7Nz81": {}, "GRazPAANjfBoldFO": {}, "yqA2clJ5gEOaCgM6": {}}, "user_id": "Yn6RugbNEIpGBFUj"}, {"extra_attributes": {"On5mM7k8nbLzvtCI": {}, "W5ynMKquUicAeIVX": {}, "toWAXhMlW4tLqX7O": {}}, "user_id": "ICf5oD1e6oI9FmYe"}], "ticket_created_at": 23, "ticket_id": "wSkHKufBdS3ZOokZ"}]}, {"matching_parties": [{"first_ticket_created_at": 56, "party_attributes": {"rDWUwfhKvrf2AaH4": {}, "yCWrHSppnIZkNnTn": {}, "3rzH5NvAtcvNedgS": {}}, "party_id": "1fUfKmihDbmu8ePW", "party_members": [{"extra_attributes": {"lQMVDXEHeiGTnwyE": {}, "w6hIWDZrpP7rz3IS": {}, "W510kHr4isTKWjmv": {}}, "user_id": "67nuHCXWfwnwGioV"}, {"extra_attributes": {"wVzmmBVVFfpqx1Ae": {}, "LtzcPJ3jtDYBo4FU": {}, "TH7CGfKSyxgRR1Di": {}}, "user_id": "CqSMzpqIFGLkDs7A"}, {"extra_attributes": {"CC1RgBfoNrHlFi2q": {}, "JLgmBLE35YhyiDV9": {}, "0SeI5yppBHoytVzn": {}}, "user_id": "CgNyx9fbT63ShEh8"}], "ticket_created_at": 84, "ticket_id": "B7n4C97uAPP8PATL"}, {"first_ticket_created_at": 31, "party_attributes": {"6FYBZsWFbr3RSP0W": {}, "9nBhvhf8Q0DtJMcY": {}, "QdN66bswAgt65X4N": {}}, "party_id": "1LQZmB61JMdtwCVU", "party_members": [{"extra_attributes": {"rYQue84dwmbwFEnA": {}, "ZaWsQJtRYoagRJK5": {}, "PX9UcOvhPyE11TRT": {}}, "user_id": "2SKseoe8VLie0LBa"}, {"extra_attributes": {"36KNzjf005CXNGeh": {}, "Q2aTjTDfKFDXC7eG": {}, "L5YhJDWh9YWqc0qg": {}}, "user_id": "V6d9yOfIMLds2DbP"}, {"extra_attributes": {"caoMdtRLTmSvTkQQ": {}, "gB7exYvmHMxr5hPC": {}, "JJztJBg0tTJg46Ie": {}}, "user_id": "wOXE2AkCh3QIZsUf"}], "ticket_created_at": 22, "ticket_id": "6yUSpSOAjHJWwfCj"}, {"first_ticket_created_at": 45, "party_attributes": {"wWkLob9gKLqs2nEZ": {}, "hpByfHZinxNfgPAw": {}, "kMBsznlBUqnLT4Ab": {}}, "party_id": "GptKaWNvPbpg7yrR", "party_members": [{"extra_attributes": {"vXfZ6rvgvEY3Hht1": {}, "SwqTsKKKo37NHDOQ": {}, "e91Ps3ztUIV0dS6h": {}}, "user_id": "IH9c4VfkyrwpuXxb"}, {"extra_attributes": {"aERbfgPmi0eHkt1m": {}, "r9EOIFg0dnWIYN2N": {}, "VL70Iw157g00jr9b": {}}, "user_id": "8MuYmmeKTmBNvGYx"}, {"extra_attributes": {"EQdf3ewoGGoY7xmF": {}, "NAmjDDCvs78mcMdi": {}, "S76YApGJ9ufwLYkq": {}}, "user_id": "IgLuZS6hsQryiEtO"}], "ticket_created_at": 54, "ticket_id": "ztZpr4U4fwQIiLXg"}]}, {"matching_parties": [{"first_ticket_created_at": 25, "party_attributes": {"YBn2xaOBdPF0JmX8": {}, "qwU1cTuHHPB5S3Dv": {}, "PRCzBrVUxmDOj3cv": {}}, "party_id": "RFaTC11W0TGTCm4f", "party_members": [{"extra_attributes": {"ZWuk6pQxDQpKqxLG": {}, "eMvr9TsvcMQ7dBsa": {}, "IecRxIsZvD6rmzVr": {}}, "user_id": "5XT1Nxw0v1dMQ9Rr"}, {"extra_attributes": {"bk6C2cVWf6ttvbU1": {}, "PO6ApCD2VXidT7w0": {}, "Oc15N8WXBPp17PAe": {}}, "user_id": "wqSm5x3B4t7WQnp8"}, {"extra_attributes": {"jXZedgt5cyNe27HL": {}, "twtVOaxgP6Jbct8p": {}, "uMybYGxD9IPmmsLm": {}}, "user_id": "u3kaPj0O4zd8Tb7c"}], "ticket_created_at": 96, "ticket_id": "fwNa8lzfjv9oYMXM"}, {"first_ticket_created_at": 19, "party_attributes": {"s69FTFVGUVhvKhJC": {}, "meisql14mUHVbMPi": {}, "mNhcZsU3VAdMDcb4": {}}, "party_id": "qlkiFAamqvZI2Kwj", "party_members": [{"extra_attributes": {"qPBiWXade41s3rH3": {}, "4mB2yPlRpWjmHZAA": {}, "vKTH8MuqIg0Czkgu": {}}, "user_id": "wuJCW7EEFB67AODb"}, {"extra_attributes": {"i9BzupBsFpYc77Gt": {}, "RUcCFeY5g4XgBsbf": {}, "zqxBPNe8ae1Il4aA": {}}, "user_id": "tEbu4IjGdqthRxTj"}, {"extra_attributes": {"Q7gkZEY8rG0q0Q2Q": {}, "d2JzRbkF2I03dIjv": {}, "BbA6bfbYaJCJjfk2": {}}, "user_id": "TUvn95FhO7VW3mbD"}], "ticket_created_at": 98, "ticket_id": "oFSKWM1eym5ydC6p"}, {"first_ticket_created_at": 18, "party_attributes": {"5xCWTqUOYZENJ1QH": {}, "ZQxPRXH7uxBJEECQ": {}, "E1li3Bg7Jxc9pUnZ": {}}, "party_id": "mvhidwCkZwqjYLfT", "party_members": [{"extra_attributes": {"iCO1NDBvQvRPnAz4": {}, "VzW0CpoBCbyJsF5I": {}, "jF1c0W338HS6CBgV": {}}, "user_id": "RyihYNZ84CVhziXV"}, {"extra_attributes": {"8HwSmvcvcDKF19yV": {}, "RafCjOuSYht83Adv": {}, "BaagTiRJ8daGTVX3": {}}, "user_id": "Bb7jlz5IfHgKjI9m"}, {"extra_attributes": {"wJSrN8jkIykR2zba": {}, "I6PD7fEscShnGUGU": {}, "tV9GJ279GDbLNwjm": {}}, "user_id": "3FK0nnX2poMfZ1hD"}], "ticket_created_at": 68, "ticket_id": "0YqCKUh5RD9vNAp4"}]}], "namespace": "jinFpnQ5xF9wwbvM", "party_attributes": {"ZyeDeRnVfPUa6xVV": {}, "Bcq3wZpFIYeAg79H": {}, "cLJXJ7mpVI6eTYAj": {}}, "party_id": "dPlCiQQC35cj4KyO", "queued_at": 98, "region": "nzqP8oxfrtbECD1C", "server_name": "YPwaiBAxfYL8Avt7", "status": "0ZUT2fSk3LL0calq", "ticket_id": "xEewuGS469k2hG0W", "updated_at": "1990-09-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "t4sUmanYxM0UHZVN"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'YzGMNIpWoSLkUrfu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 10, "userID": "yV7AcodcZwKjYDdm", "weight": 0.569719793528665}' \
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
    --matchIDs 'Olzwm9Su4FnS98Qq' \
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
    --strategy 'ftSjq7sn8yreciPL' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'fkVyyJsbGpO6Jgeh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'DJxEN7JlZc8LMq1o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "2jZWu4yA3r0u4q1b", "description": "THXIjfJKyFlM0u1u", "findMatchTimeoutSeconds": 41, "joinable": true, "max_delay_ms": 30, "region_expansion_rate_ms": 27, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 97, "min": 40, "name": "dn9yVoSlKNchPHNL"}, {"max": 44, "min": 19, "name": "3LLaGPGdqLE8Sohh"}, {"max": 14, "min": 70, "name": "uiTnJarYYkHBDdSz"}], [{"max": 57, "min": 8, "name": "TGVPmv34h6T7Esuf"}, {"max": 26, "min": 84, "name": "fxKYB4LM6H6QXmpZ"}, {"max": 44, "min": 59, "name": "fUSR1l9xLPBsmAUr"}], [{"max": 61, "min": 33, "name": "9L1IiD6MlcEPhMDF"}, {"max": 53, "min": 20, "name": "MNa8vVe4MHX6AgMe"}, {"max": 31, "min": 30, "name": "90AyyUJyAK5PRMRM"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 23, "role_flexing_second": 44}, "maxNumber": 40, "minNumber": 23, "playerMaxNumber": 33, "playerMinNumber": 15}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 11, "min": 44, "name": "x2UDcgVE7L9FK6e0"}, {"max": 78, "min": 19, "name": "rPc4vtxk9hVKlG56"}, {"max": 68, "min": 14, "name": "lzGr7XjdyRJunZPk"}], [{"max": 31, "min": 67, "name": "6ccIBnWyPw8mj7gy"}, {"max": 88, "min": 48, "name": "7XdIszGRj46COPip"}, {"max": 68, "min": 36, "name": "1MWVTHG0qHJCWEfO"}], [{"max": 73, "min": 32, "name": "KDqebm83raNBJ5y7"}, {"max": 0, "min": 91, "name": "xEkvI4oxZEDxGiBn"}, {"max": 80, "min": 14, "name": "bn0zaf7CaOSlHXrU"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 37, "role_flexing_second": 80}, "duration": 77, "max_number": 74, "min_number": 78, "player_max_number": 53, "player_min_number": 55}, {"combination": {"alliances": [[{"max": 70, "min": 46, "name": "mtqISQ83TTbtefXW"}, {"max": 52, "min": 47, "name": "nDe4LQdXfFBii2RA"}, {"max": 78, "min": 62, "name": "r0sVZ6LJAOddIL2l"}], [{"max": 6, "min": 15, "name": "9mDdUIoiIJFNxuNO"}, {"max": 26, "min": 92, "name": "USWw18T1IxVWCxdv"}, {"max": 85, "min": 77, "name": "i38XQjLDRqkpiFK5"}], [{"max": 57, "min": 16, "name": "tiQ272Uo9UBJWodp"}, {"max": 7, "min": 53, "name": "wsX1jorcyR0x3YiH"}, {"max": 65, "min": 5, "name": "8ITGPRQBCgIs1Q2l"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 23}, "duration": 46, "max_number": 30, "min_number": 50, "player_max_number": 13, "player_min_number": 66}, {"combination": {"alliances": [[{"max": 70, "min": 25, "name": "hErkNhNcECWwchW6"}, {"max": 52, "min": 76, "name": "L9SkbLlrNXnGanMa"}, {"max": 53, "min": 3, "name": "8F1dl1q92m3iRlfn"}], [{"max": 56, "min": 78, "name": "Ak0CwiAsR65yQ9ss"}, {"max": 41, "min": 37, "name": "HdGmxncCEr0Kcgeq"}, {"max": 52, "min": 34, "name": "GbruNB72HHMkjzyB"}], [{"max": 56, "min": 4, "name": "4UFKiaoV0VOem2yq"}, {"max": 86, "min": 31, "name": "sMFxKybPkbuS6x9c"}, {"max": 78, "min": 72, "name": "ft5jGcMICPUYnfG6"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 79, "role_flexing_second": 100}, "duration": 95, "max_number": 42, "min_number": 55, "player_max_number": 19, "player_min_number": 11}], "flexingRules": [{"attribute": "ReteIMgzISomCsod", "criteria": "JrhQW41q2OspCZbt", "duration": 81, "reference": 0.7435731599734648}, {"attribute": "ta5I0uGcL1koyHjC", "criteria": "H5olYLETRpABAmO2", "duration": 62, "reference": 0.62392437108158}, {"attribute": "cBL4BzhDUjhKPwbw", "criteria": "cvQU5kG8bXGFmPAn", "duration": 83, "reference": 0.13813937585472924}], "match_options": {"options": [{"name": "J66OzOj84O6tgohj", "type": "tC7bzjPpucddXJ5z"}, {"name": "ifF8y959anrNSley", "type": "wHbHig6IKWVZ77Ke"}, {"name": "RWdECaFGzfZ2hxcJ", "type": "2Fnemn7M23SzUo4h"}]}, "matchingRules": [{"attribute": "NBDh9ZFP1OW0nXOE", "criteria": "rQPS4VsRoYIK69yg", "reference": 0.9915387010516548}, {"attribute": "ADCGiXaLs2xjHkin", "criteria": "OD975nARHCmhNHSX", "reference": 0.3278202417439666}, {"attribute": "qIHsxvaUoXDmwWsu", "criteria": "kxncuD3QxCXMd00Y", "reference": 0.43891293463645675}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 100, "socialMatchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'ndhhZhwAiLsZs4pm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'LDIQch4IjDq9aT3q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'ZyI0rYsWucAkXsVJ' \
    --matchID 'bXi7eRZa7WwIc895' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["ImqK6tVsaUq3stUh", "5J5Z9GiBiSAylX5c", "S0IeHpWCugmfOL0Q"], "party_id": "QpxsuD8PGqku59eF", "user_id": "JrOXyDYz9vMUOPG0"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'iHDT8QbF7gHPTPQb' \
    --matchID 'vLt2NRqJGIKzLyH1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'y72L13Ornyx34luL' \
    --matchID 'dvtsTKXMjiw6gYPv' \
    --namespace "$AB_NAMESPACE" \
    --userID 'fn2Qt9iyq3Nyk8nc' \
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
    --channelName 'u2Z3eDHH9WaVO4iK' \
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