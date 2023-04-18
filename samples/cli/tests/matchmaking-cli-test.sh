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
    --body '{"deployment": "AxcVpFrttufHIRdH", "description": "9UzVRiXbqlAw7r6W", "find_match_timeout_seconds": 9, "game_mode": "ktQG0h5JAav5kRa6", "joinable": false, "max_delay_ms": 29, "region_expansion_rate_ms": 51, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 31, "min": 56, "name": "0m8SAMTwE6I56IaR"}, {"max": 61, "min": 56, "name": "bbgorQeFbQ1g7qbP"}, {"max": 28, "min": 54, "name": "gUNB1vRodwpzS6Da"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 31, "role_flexing_second": 44}, "max_number": 73, "min_number": 81, "player_max_number": 41, "player_min_number": 4}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 87, "min": 98, "name": "CUkNmKJfh5pUkHOD"}, {"max": 32, "min": 64, "name": "oMF78NY4YkHs1cnz"}, {"max": 59, "min": 72, "name": "32ogW7olvbTgrhRT"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 85, "role_flexing_second": 59}, "duration": 18, "max_number": 3, "min_number": 91, "player_max_number": 85, "player_min_number": 41}, {"combination": {"alliances": [{"max": 83, "min": 76, "name": "yNQkT7NvyE3cwyAL"}, {"max": 4, "min": 28, "name": "zNIicXm7agSrjJW2"}, {"max": 83, "min": 0, "name": "QNOs1PXhT5FvdiRi"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 30, "role_flexing_second": 18}, "duration": 64, "max_number": 13, "min_number": 31, "player_max_number": 47, "player_min_number": 75}, {"combination": {"alliances": [{"max": 48, "min": 4, "name": "R8dl0zRVW4EZG9m0"}, {"max": 96, "min": 4, "name": "68su8XfqlqNiTvB6"}, {"max": 92, "min": 6, "name": "AorKsxwkosAVerXp"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 36}, "duration": 88, "max_number": 10, "min_number": 61, "player_max_number": 46, "player_min_number": 1}], "flexing_rule": [{"attribute": "HuKeb9l3rGN9A3sN", "criteria": "m84hddSpHt0P7MII", "duration": 90, "reference": 0.07272405144936134}, {"attribute": "u6d5tA5jUmiTqpyh", "criteria": "PFdxLzFQN05MYzYi", "duration": 75, "reference": 0.671526989177618}, {"attribute": "RZYdFLIAjGGJddVC", "criteria": "vu9vx5KQ7KYnIuMB", "duration": 45, "reference": 0.5499042496799169}], "match_options": {"options": [{"name": "9a2I9u6Vpbsx5w8h", "type": "qUI06UpOXGSLmCVu"}, {"name": "HOPlLlkvR8sKgnuR", "type": "kgghGoYupD391C2q"}, {"name": "tPYokahFjkQsfCaT", "type": "mt1d67FXGk2s9Q0m"}]}, "matching_rule": [{"attribute": "PVo3twu0MesTCf9x", "criteria": "4rt69lna7qxNeIxP", "reference": 0.4038632586866233}, {"attribute": "6MbwL6IY69z1UaLq", "criteria": "YSYWytLPziZMdjxc", "reference": 0.43583001859639603}, {"attribute": "ZufQxGiHPllG4cYE", "criteria": "zfTD1ZBm3MqHcUmL", "reference": 0.8383773680814949}], "rebalance_enable": false, "sub_game_modes": {"trkmu0hpDDWVAla2": {"alliance": {"combination": {"alliances": [{"max": 24, "min": 43, "name": "5BYNtIuS5S5XUdjs"}, {"max": 29, "min": 52, "name": "qwGyzzWi9gwQYv7t"}, {"max": 42, "min": 30, "name": "7Vk6Jt4Ymos9Jcdo"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 70, "role_flexing_second": 11}, "max_number": 83, "min_number": 44, "player_max_number": 5, "player_min_number": 57}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 94, "min": 80, "name": "VU6RBt0zYoMcHyCU"}, {"max": 62, "min": 55, "name": "XlAvxJMdalwSyliW"}, {"max": 79, "min": 3, "name": "NW5NyLu0M3VHh2EI"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 3, "role_flexing_second": 86}, "duration": 99, "max_number": 86, "min_number": 3, "player_max_number": 86, "player_min_number": 66}, {"combination": {"alliances": [{"max": 43, "min": 88, "name": "0rdlgdWyOtXi3cho"}, {"max": 88, "min": 35, "name": "X68cmDc3fxU8MyKr"}, {"max": 88, "min": 32, "name": "v52Dlym6puQ23xoJ"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 9, "role_flexing_second": 26}, "duration": 58, "max_number": 64, "min_number": 27, "player_max_number": 1, "player_min_number": 78}, {"combination": {"alliances": [{"max": 93, "min": 31, "name": "khjYnaq6foWvXa3b"}, {"max": 78, "min": 25, "name": "rXsDr6kILsSSyDdm"}, {"max": 51, "min": 19, "name": "kmoPYgc2L4jk4Lo0"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 19, "role_flexing_second": 10}, "duration": 93, "max_number": 45, "min_number": 70, "player_max_number": 15, "player_min_number": 49}], "name": "ZNkSQ70D0H6BXksU"}, "C9b6i5lZC9xv32e8": {"alliance": {"combination": {"alliances": [{"max": 5, "min": 77, "name": "5csSovoqsZNBdte9"}, {"max": 80, "min": 7, "name": "DUPVJf6c2Z0QZxfg"}, {"max": 86, "min": 100, "name": "ubTDIHrvqAThuwjR"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 28, "role_flexing_second": 74}, "max_number": 49, "min_number": 74, "player_max_number": 9, "player_min_number": 93}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 65, "min": 24, "name": "oF7VSZ6pf3vneSD2"}, {"max": 92, "min": 68, "name": "b3g7mSQUhAEtrmjq"}, {"max": 95, "min": 52, "name": "6YE3p4lSck0ZHn5G"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 0, "role_flexing_second": 57}, "duration": 43, "max_number": 69, "min_number": 33, "player_max_number": 1, "player_min_number": 66}, {"combination": {"alliances": [{"max": 94, "min": 68, "name": "lvPG6bFYReVHQipc"}, {"max": 59, "min": 30, "name": "x9Zw5D2L7vIYhGGS"}, {"max": 50, "min": 70, "name": "EW4ZJJ42d3PBddN8"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 24, "role_flexing_second": 92}, "duration": 24, "max_number": 55, "min_number": 50, "player_max_number": 17, "player_min_number": 82}, {"combination": {"alliances": [{"max": 55, "min": 27, "name": "pflxqMrj3oZk03QX"}, {"max": 5, "min": 51, "name": "KMDYDDxHSZjtqXyJ"}, {"max": 63, "min": 18, "name": "f7Gc26SaiGVkydwY"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 67, "role_flexing_second": 16}, "duration": 41, "max_number": 54, "min_number": 50, "player_max_number": 94, "player_min_number": 96}], "name": "us9hsfpFDcSDG8aM"}, "VGLiBNrDjqoxcwgG": {"alliance": {"combination": {"alliances": [{"max": 77, "min": 32, "name": "cekdqCt81P1ktfIo"}, {"max": 44, "min": 9, "name": "mv9gsR5cJcHm3SZL"}, {"max": 49, "min": 21, "name": "oRDFuuuySj29a9LJ"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 29, "role_flexing_second": 89}, "max_number": 99, "min_number": 92, "player_max_number": 22, "player_min_number": 93}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 84, "min": 67, "name": "FAAMwzHPxB1UskYs"}, {"max": 39, "min": 47, "name": "9y1aZSWMiVi10sG6"}, {"max": 44, "min": 79, "name": "xkfUcmqRRbceJ5i0"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 9, "role_flexing_second": 27}, "duration": 60, "max_number": 77, "min_number": 48, "player_max_number": 89, "player_min_number": 83}, {"combination": {"alliances": [{"max": 11, "min": 14, "name": "xeCSz9WEi8KlloeH"}, {"max": 81, "min": 73, "name": "FLTm5T50x9WT0GfH"}, {"max": 38, "min": 36, "name": "u4jmsRE2w1yEkLgh"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 37, "role_flexing_second": 72}, "duration": 48, "max_number": 52, "min_number": 40, "player_max_number": 94, "player_min_number": 40}, {"combination": {"alliances": [{"max": 92, "min": 42, "name": "qYUTLDx9gIiDandp"}, {"max": 67, "min": 93, "name": "y2wNhmwoYZyI4EFZ"}, {"max": 76, "min": 92, "name": "BcYrCEAE7WIsfmx4"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 54, "role_flexing_second": 24}, "duration": 15, "max_number": 60, "min_number": 9, "player_max_number": 74, "player_min_number": 74}], "name": "gas4b6z3LNUj7fdg"}}}, "session_queue_timeout_seconds": 77, "social_matchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'FQCYoDPICpnduEEQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "lULdJz4mnRBkMNxv", "players": [{"results": [{"attribute": "vKgAT8mJrYq6hRkl", "value": 0.24034188656472655}, {"attribute": "qxM3gpwxcfMy9Xzj", "value": 0.15898631216785641}, {"attribute": "I5YbsKoADkzJEN2V", "value": 0.5343795185031112}], "user_id": "zih3bit0VWn3CO39"}, {"results": [{"attribute": "PXDNxtXgeO3FgkXh", "value": 0.14579033722764922}, {"attribute": "DzaQY3snn2ZkP7cF", "value": 0.06346052457946583}, {"attribute": "P43e5dC9XIBudfZg", "value": 0.2805088610052118}], "user_id": "bHDIDm4hMzF4Txod"}, {"results": [{"attribute": "enSrUTvfqU0bfoMm", "value": 0.9294006979866903}, {"attribute": "cTtFWbotQyXJRcQW", "value": 0.3060222700728029}, {"attribute": "mqPNs92epxk0i8Vx", "value": 0.30364291915506203}], "user_id": "ZNereSvf9699mCEH"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "ThUJkETAsSp7gh4T"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "eUTkOkAYfJB8AT9t", "client_version": "4Tv207Y2QD3oD5fL", "deployment": "Cr3OOlXVv8ZGF7uY", "error_code": 28, "error_message": "0o4zGYY7KQI1AeFg", "game_mode": "PqaOkvo1aolB4lkK", "joinable": true, "match_id": "4gqkNNlWkD9eOziY", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 89, "party_attributes": {"IfkOVW2grREOLx0K": {}, "Oww3HICQLfl7MUBG": {}, "7qtPu64yAtURKLRk": {}}, "party_id": "b738HGS6rDgMdIIl", "party_members": [{"extra_attributes": {"hS1fSiM9331m7Ta1": {}, "PsKc50Kv6ecnEevc": {}, "Ax2K2zkRenmPZnGB": {}}, "user_id": "t4P7WnbdSJtjX7Zs"}, {"extra_attributes": {"hZyZl5x4bRXBHUTr": {}, "DzZSKscfOcYu3dpC": {}, "ROYqUiGKXVFCmpo6": {}}, "user_id": "sPwVOEDSJsEK5QpN"}, {"extra_attributes": {"hlI2iS5EpGhhvXYc": {}, "k0upMzUYnb76tFkE": {}, "ORV3bu1bNCtX7W40": {}}, "user_id": "V6Do5sYadCCFrHHC"}], "ticket_created_at": 23, "ticket_id": "DpZxkrQDXuNFviMa"}, {"first_ticket_created_at": 37, "party_attributes": {"uGKHhMRWLVd3DlhL": {}, "uIpomM8sm1MiaI1m": {}, "X2tJoARtdbBe7uds": {}}, "party_id": "Mrok0WvGYYnx4V70", "party_members": [{"extra_attributes": {"9xbnGezKsDwG2omO": {}, "R2nvYI9TVqJdvzcW": {}, "bfUpaXp5JMl5LL4b": {}}, "user_id": "TxBmZjdrrIxsB0NR"}, {"extra_attributes": {"sB1fPqqRRulpqpym": {}, "DkQhtrHWwRVnwVBO": {}, "qOHi8pWGd1juYhiq": {}}, "user_id": "jRJOqB5F93zFQbJn"}, {"extra_attributes": {"dUDpdONneAczbBdH": {}, "b2slt71B1SmZp2JZ": {}, "p50CnPb71ORYcmQb": {}}, "user_id": "TU5JX8ccLjMXJRk0"}], "ticket_created_at": 9, "ticket_id": "EFnmDbxIxi4YKlON"}, {"first_ticket_created_at": 22, "party_attributes": {"g4iY9u02aCNYIWek": {}, "p18lOC3mNqF7Bl0L": {}, "cghVHfPEspxwhRON": {}}, "party_id": "0bc1eMbEIjowLqc3", "party_members": [{"extra_attributes": {"ecjXJbZDKKoxLE1Y": {}, "3Dymtj3giPg4x4yi": {}, "PX6ues1Hhhkg1yLV": {}}, "user_id": "bLFzHEP8cM4NTwr0"}, {"extra_attributes": {"KHaAsmTej52WKi6t": {}, "ArAURt9plCSVq8Pd": {}, "H6hJPUAc0RVwXgAg": {}}, "user_id": "ntLMCuaXBWQi6BqP"}, {"extra_attributes": {"g4xr0lCancUZGCHs": {}, "ZYoLfR1KtOv7Zy0b": {}, "65uvuKNuy0ytZQ7M": {}}, "user_id": "6Nzy1adnSKOLFKx1"}], "ticket_created_at": 7, "ticket_id": "W9YfRSse6AAz3S4c"}]}, {"matching_parties": [{"first_ticket_created_at": 51, "party_attributes": {"97SBROPYuG6XqP6o": {}, "o7G73zdxTgOfnwId": {}, "lNa29fDLh741IslK": {}}, "party_id": "HzGlLKWUtDQs61OQ", "party_members": [{"extra_attributes": {"AoxyyQpRWCiiPDGQ": {}, "hNPEwiJCf2XJVrlz": {}, "qQls1ozhLVA3kE8j": {}}, "user_id": "KvgatOEBM70TdlNB"}, {"extra_attributes": {"JYOmpu1VCarzBsV6": {}, "xnZ5Jrzzjrcaug6C": {}, "WVG8SWP3glU6musw": {}}, "user_id": "VJnNnN7kAa7j0riF"}, {"extra_attributes": {"c5HTHQIoVsGo7dwV": {}, "9DBqFKHQkETJyTlU": {}, "rwDTnoujQD4IEiH9": {}}, "user_id": "Z5qXn3aoRtlqOECo"}], "ticket_created_at": 15, "ticket_id": "IUJNvYuGRUvpZaHC"}, {"first_ticket_created_at": 42, "party_attributes": {"PrIfapq5AAeMe4L3": {}, "mDWORBVXTIIJM9Xs": {}, "YIIZxiXNMR9BgaWc": {}}, "party_id": "FX3SUBhyoTsMWPAx", "party_members": [{"extra_attributes": {"UMkawaGpAyrIwMif": {}, "3BOdkocVTd4BxqGW": {}, "V6mTJ0sQs6XNbjvq": {}}, "user_id": "hnUVLWu8olKdxL6o"}, {"extra_attributes": {"zRmDD0jJvlfV5Oem": {}, "PYdYT7DROCjtuzFM": {}, "bAG9YI89hmguB8FO": {}}, "user_id": "TjMLo4b9rIzqYkEp"}, {"extra_attributes": {"styVTBcrM8rG0rH0": {}, "zcswwVeMK6MbGIVI": {}, "u8vvwLc7KY3uVoJX": {}}, "user_id": "TIMtpgkieDyF97lG"}], "ticket_created_at": 7, "ticket_id": "xdbZUpd6FJtHJ1py"}, {"first_ticket_created_at": 97, "party_attributes": {"TK9tmmOnYnOpas6g": {}, "hP1y4Zi7s7QBlk44": {}, "Z44B1GZgKg4uKxaC": {}}, "party_id": "gcGLuC3brWdTYCfH", "party_members": [{"extra_attributes": {"kIySok5DiXZtLW87": {}, "rGysryod3dNQrmsA": {}, "pRA6HX3RwrKt2eco": {}}, "user_id": "zL0TOg54vCE48L5o"}, {"extra_attributes": {"LF6M4lNa4JUMSHNg": {}, "qRqCV7usamANkZlO": {}, "X9Sfo95HgXqKhTPk": {}}, "user_id": "wfLM9uSybRzWek2g"}, {"extra_attributes": {"ZvRrvr0n9d9lvccK": {}, "MLhrTrcBE2ItBS3K": {}, "tKZWe8aoFzAyBME7": {}}, "user_id": "4HUtipUWYhWV1qx8"}], "ticket_created_at": 59, "ticket_id": "OWA8NjxOnaEok4nO"}]}, {"matching_parties": [{"first_ticket_created_at": 83, "party_attributes": {"q2faBcAXXKlhvyH8": {}, "paOJtxqMPpcVfRwN": {}, "j547fH0XrKEDpEY8": {}}, "party_id": "VnocGAjci0V3tBf2", "party_members": [{"extra_attributes": {"jnHGKXphn50c9tNL": {}, "DljhZ2jxLRX3z46O": {}, "CaGBeMfPlNos4yBR": {}}, "user_id": "jrERHEonAZR8GmEu"}, {"extra_attributes": {"0q1p6QCyY6vSkVFW": {}, "dsbYuVEGVxYheR3j": {}, "5mNZ6vwv7K8Asvt1": {}}, "user_id": "j1Rx59hesNWy2NvZ"}, {"extra_attributes": {"85DDKDAF8KDsBZOu": {}, "YQJ03BAHZ7c53q7a": {}, "kMpcmnnx6RVBrop9": {}}, "user_id": "v7aZK3h65hbN15zf"}], "ticket_created_at": 87, "ticket_id": "KjU7eHGebSVu0LQ4"}, {"first_ticket_created_at": 77, "party_attributes": {"kepEaC4dfiOMZfEh": {}, "Hr39pysFO3Zvc1BZ": {}, "G99LyvfvHEsJKQQe": {}}, "party_id": "wVLMUoAnaRcYp7FU", "party_members": [{"extra_attributes": {"jfIGaffoflEIByYq": {}, "eKN0meGelYF5wWaD": {}, "hukU4khGG4vZFTYn": {}}, "user_id": "PkmSu4PWam1jxR7S"}, {"extra_attributes": {"ETWjteoc8fgvZDDh": {}, "oO05oKqymxLD1Lcv": {}, "w6T6mZEiwxxElpMY": {}}, "user_id": "SWIeVzm7z9noowml"}, {"extra_attributes": {"TIKVowi0RY2VN4ZO": {}, "NJREdUQ3z9F1BxNN": {}, "gnke4akncw7wu9Tm": {}}, "user_id": "XfJWBPrx9Ns8eLzY"}], "ticket_created_at": 62, "ticket_id": "pjb1tdA3QhjCMW64"}, {"first_ticket_created_at": 10, "party_attributes": {"hsYpKPlXn77AtYoF": {}, "zLAATPY8P8P3cfoi": {}, "vvQxevecWw7Rry0K": {}}, "party_id": "K5rgAGO0dW8rX2MV", "party_members": [{"extra_attributes": {"UGKSZ4GcLkt4pK32": {}, "sJxlZcCTpTdRtCHv": {}, "uk6B6XTmSLyn50si": {}}, "user_id": "gBVZxiKdV57GvRyd"}, {"extra_attributes": {"9UuL02Le8HSCslsD": {}, "d4M1F5qRIblS7Nz8": {}, "1GRazPAANjfBoldF": {}}, "user_id": "OyqA2clJ5gEOaCgM"}, {"extra_attributes": {"6Yn6RugbNEIpGBFU": {}, "jOn5mM7k8nbLzvtC": {}, "IW5ynMKquUicAeIV": {}}, "user_id": "XtoWAXhMlW4tLqX7"}], "ticket_created_at": 82, "ticket_id": "TcSQdTnNYGeAfYFG"}]}], "namespace": "3wSkHKufBdS3ZOok", "party_attributes": {"ZB4cXnAXyuGz6Llx": {}, "Hv8SwyagYvDJ3w3U": {}, "NgIGj2jZtEYT8sIP": {}}, "party_id": "SE1XXPzySa0sZoFS", "queued_at": 99, "region": "xCOWMpyh9pMsQgb6", "server_name": "4ELbzDMwyo4nIRys", "status": "QdbufXjYnSoIFeou", "ticket_id": "C2m38kXrDZWlGVE9", "updated_at": "1980-07-01T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "J4NpUtKp6M9I6nEw"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'nZhsjwJeGwaPSDMZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 52, "userID": "H7CGfKSyxgRR1DiC", "weight": 0.2645905038889429}' \
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
    --matchIDs 'SMzpqIFGLkDs7ACC' \
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
    --strategy '1RgBfoNrHlFi2qJL' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'gmBLE35YhyiDV90S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'eI5yppBHoytVznCg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "Nyx9fbT63ShEh8Pb", "description": "GikLjgjcj34uulU6", "findMatchTimeoutSeconds": 65, "joinable": false, "max_delay_ms": 47, "region_expansion_rate_ms": 56, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 8, "min": 73, "name": "sWFbr3RSP0W9nBhv"}, {"max": 15, "min": 25, "name": "f8Q0DtJMcYQdN66b"}, {"max": 37, "min": 67, "name": "wAgt65X4N1LQZmB6"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 40}, "maxNumber": 56, "minNumber": 46, "playerMaxNumber": 88, "playerMinNumber": 59}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 62, "min": 97, "name": "LcNlZkqTZrKgXNwv"}, {"max": 25, "min": 55, "name": "4e5GX6H742OixhtA"}, {"max": 30, "min": 85, "name": "KiVm6URT95XhnUcv"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 8, "role_flexing_second": 80}, "duration": 30, "max_number": 32, "min_number": 9, "player_max_number": 42, "player_min_number": 37}, {"combination": {"alliances": [{"max": 97, "min": 42, "name": "Lie0LBa36KNzjf00"}, {"max": 58, "min": 78, "name": "NGehQ2aTjTDfKFDX"}, {"max": 58, "min": 22, "name": "7eGL5YhJDWh9YWqc"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 13, "role_flexing_second": 57}, "duration": 98, "max_number": 71, "min_number": 8, "player_max_number": 21, "player_min_number": 49}, {"combination": {"alliances": [{"max": 82, "min": 84, "name": "jCMDtDMrentgn3Dh"}, {"max": 34, "min": 88, "name": "ciwIeShF9RKb9vvx"}, {"max": 41, "min": 26, "name": "JlhXbWhbwPwToC6k"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 18, "role_flexing_second": 93}, "duration": 97, "max_number": 73, "min_number": 47, "player_max_number": 12, "player_min_number": 97}], "flexingRules": [{"attribute": "46IewOXE2AkCh3QI", "criteria": "ZsUf8lGFXcmwTERH", "duration": 4, "reference": 0.7744367806525446}, {"attribute": "wfCjYwWkLob9gKLq", "criteria": "s2nEZhpByfHZinxN", "duration": 11, "reference": 0.5356320671721547}, {"attribute": "AQltnSojV4jT65yc", "criteria": "lX2FtAz0vJjFIYWO", "duration": 1, "reference": 0.39858648654805306}], "match_options": {"options": [{"name": "rRvXfZ6rvgvEY3Hh", "type": "t1SwqTsKKKo37NHD"}, {"name": "OQe91Ps3ztUIV0dS", "type": "6hIH9c4VfkyrwpuX"}, {"name": "xbaERbfgPmi0eHkt", "type": "1mr9EOIFg0dnWIYN"}]}, "matchingRules": [{"attribute": "2NVL70Iw157g00jr", "criteria": "9b8MuYmmeKTmBNvG", "reference": 0.81627740903051}, {"attribute": "xEQdf3ewoGGoY7xm", "criteria": "FNAmjDDCvs78mcMd", "reference": 0.1299407712541253}, {"attribute": "S76YApGJ9ufwLYkq", "criteria": "IgLuZS6hsQryiEtO", "reference": 0.4258827821748853}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 3, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'Zpr4U4fwQIiLXgmR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'asvjO4lj8m3XEwP2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'b4gd3xOeii8Jnmss' \
    --matchID 'ep2xD2NY0kABeGs9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["yxahld1pO0Gyf5PO", "3COyMvczgEpzZ3Fb", "txfhcRC7IVYa6iZ5"], "party_id": "uFRYNn3SHiWxF0Yb", "user_id": "uU5ar5qTLWUCy0Af"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'gc050XIZRW491e94' \
    --matchID 'mQjVOOBnIWhunElq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'ZUodp3IhtCSHy1ei' \
    --matchID '1fIrPvfHnRN06EjR' \
    --namespace "$AB_NAMESPACE" \
    --userID 'wEQlNapJRfk4f9Zc' \
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
    --channelName 'w1pEHAyNFxcVTKuA' \
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