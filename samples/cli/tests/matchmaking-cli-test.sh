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
    --limit '61' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "cSCcgMJa", "description": "TWmeSxUM", "find_match_timeout_seconds": 6, "game_mode": "q0vsW7kJ", "joinable": false, "max_delay_ms": 55, "rule_set": {"alliance": {"combination": {"alliances": [{"max": 31, "min": 5, "name": "ZxX6grgk"}, {"max": 77, "min": 36, "name": "iZNeCYOE"}, {"max": 80, "min": 89, "name": "qNtoVnva"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 95, "role_flexing_second": 81}, "max_number": 35, "min_number": 17, "player_max_number": 88, "player_min_number": 83}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 60, "min": 7, "name": "xjicPK14"}, {"max": 33, "min": 29, "name": "71COvDAu"}, {"max": 69, "min": 45, "name": "EeRLSa2y"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 95}, "duration": 78, "max_number": 4, "min_number": 46, "player_max_number": 58, "player_min_number": 70}, {"combination": {"alliances": [{"max": 63, "min": 41, "name": "YDTa7rRc"}, {"max": 39, "min": 59, "name": "rHO6zT2E"}, {"max": 3, "min": 71, "name": "U2uww0PF"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 66, "role_flexing_second": 5}, "duration": 88, "max_number": 5, "min_number": 76, "player_max_number": 86, "player_min_number": 73}, {"combination": {"alliances": [{"max": 72, "min": 58, "name": "5Cl00acm"}, {"max": 37, "min": 40, "name": "pik8AXlg"}, {"max": 46, "min": 2, "name": "tVc3m4xb"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 27}, "duration": 77, "max_number": 10, "min_number": 51, "player_max_number": 59, "player_min_number": 63}], "flexing_rule": [{"attribute": "eLF5hA17", "criteria": "yh8jljRp", "duration": 29, "reference": 0.9116944247488551}, {"attribute": "Hw1UbEZa", "criteria": "5oJ5B7LP", "duration": 37, "reference": 0.2666405508150168}, {"attribute": "Ly5sa6O3", "criteria": "YbBSpjtu", "duration": 89, "reference": 0.9952207847422327}], "match_options": {"options": [{"name": "p50xJDD7", "type": "RBvmdQS8"}, {"name": "ZvMQLOzC", "type": "lN3J6njn"}, {"name": "ZqBSzda7", "type": "gapCP97W"}]}, "matching_rule": [{"attribute": "23JU0mzU", "criteria": "8B2ZQzcr", "reference": 0.723100987032436}, {"attribute": "QQQuBacl", "criteria": "lvP0i14R", "reference": 0.5816015869197193}, {"attribute": "q7Eajmok", "criteria": "TgkOTCBT", "reference": 0.5931609240143018}], "rebalance_enable": true, "sub_game_modes": {"8jc1UB74": {"alliance": {"combination": {"alliances": [{"max": 84, "min": 19, "name": "gQcqrCX5"}, {"max": 100, "min": 93, "name": "V8UEnoYu"}, {"max": 4, "min": 62, "name": "Bpkq1DFJ"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 77, "role_flexing_second": 82}, "max_number": 96, "min_number": 46, "player_max_number": 33, "player_min_number": 12}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 46, "min": 62, "name": "OIeitNhw"}, {"max": 64, "min": 22, "name": "wyemzNhq"}, {"max": 99, "min": 75, "name": "MwGGwy82"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 96, "role_flexing_second": 22}, "duration": 1, "max_number": 33, "min_number": 28, "player_max_number": 13, "player_min_number": 25}, {"combination": {"alliances": [{"max": 39, "min": 33, "name": "gFKJxjfS"}, {"max": 9, "min": 25, "name": "i7vR1A67"}, {"max": 37, "min": 59, "name": "1fuaFfTj"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 64, "role_flexing_second": 27}, "duration": 52, "max_number": 0, "min_number": 37, "player_max_number": 4, "player_min_number": 98}, {"combination": {"alliances": [{"max": 40, "min": 36, "name": "Ps6Bkenb"}, {"max": 95, "min": 58, "name": "uC2HNhyZ"}, {"max": 45, "min": 58, "name": "jWMQmlIw"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 98, "role_flexing_second": 95}, "duration": 40, "max_number": 20, "min_number": 9, "player_max_number": 95, "player_min_number": 16}], "name": "qdqrIGPx"}, "FU3LSwPx": {"alliance": {"combination": {"alliances": [{"max": 87, "min": 16, "name": "PN2orzR9"}, {"max": 87, "min": 10, "name": "XVee4bXT"}, {"max": 89, "min": 50, "name": "2Vyt9ELS"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 60, "role_flexing_second": 75}, "max_number": 34, "min_number": 18, "player_max_number": 47, "player_min_number": 38}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 79, "min": 56, "name": "87qxHmSa"}, {"max": 57, "min": 16, "name": "K6oFFK1U"}, {"max": 80, "min": 61, "name": "IRDf0rQs"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 31, "role_flexing_second": 55}, "duration": 15, "max_number": 90, "min_number": 63, "player_max_number": 25, "player_min_number": 6}, {"combination": {"alliances": [{"max": 61, "min": 0, "name": "445iOcox"}, {"max": 10, "min": 3, "name": "P4MbyraK"}, {"max": 86, "min": 31, "name": "szorXNia"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 45}, "duration": 45, "max_number": 42, "min_number": 88, "player_max_number": 94, "player_min_number": 28}, {"combination": {"alliances": [{"max": 4, "min": 66, "name": "f2amv0Aw"}, {"max": 16, "min": 5, "name": "BKiS7WuU"}, {"max": 61, "min": 45, "name": "BAFGFGaC"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 48, "role_flexing_second": 77}, "duration": 92, "max_number": 47, "min_number": 29, "player_max_number": 47, "player_min_number": 17}], "name": "EKMKt2Ye"}, "6j2jEK0a": {"alliance": {"combination": {"alliances": [{"max": 90, "min": 15, "name": "rZwIzuBV"}, {"max": 30, "min": 88, "name": "OFaEBw9H"}, {"max": 30, "min": 8, "name": "YLEBvMv1"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 32, "role_flexing_second": 34}, "max_number": 62, "min_number": 40, "player_max_number": 13, "player_min_number": 85}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 73, "min": 20, "name": "RbedjVME"}, {"max": 30, "min": 61, "name": "B0rimTaY"}, {"max": 29, "min": 76, "name": "PWi7V9aN"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 13}, "duration": 74, "max_number": 87, "min_number": 67, "player_max_number": 10, "player_min_number": 91}, {"combination": {"alliances": [{"max": 70, "min": 47, "name": "Oxkd0G4k"}, {"max": 89, "min": 66, "name": "Z6XOkCPm"}, {"max": 69, "min": 22, "name": "8VcIgQDx"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 49, "role_flexing_second": 92}, "duration": 56, "max_number": 62, "min_number": 33, "player_max_number": 52, "player_min_number": 98}, {"combination": {"alliances": [{"max": 57, "min": 96, "name": "I6yTJx95"}, {"max": 24, "min": 38, "name": "UN6xkTp7"}, {"max": 17, "min": 78, "name": "TEhoXuRz"}], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 29, "role_flexing_second": 73}, "duration": 26, "max_number": 86, "min_number": 76, "player_max_number": 70, "player_min_number": 40}], "name": "ZOiaJeNa"}}}, "session_queue_timeout_seconds": 45, "social_matchmaking": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'fmv49dAZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteChannelHandler' test.out

#- 7 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "fw6p2vjs", "players": [{"results": [{"attribute": "dbBSEGVi", "value": 0.19981665478832233}, {"attribute": "mKuXQHu6", "value": 0.28602230553240227}, {"attribute": "ZhSCnZoD", "value": 0.4448982644087658}], "user_id": "DpRMAwW9"}, {"results": [{"attribute": "BiPMUEBt", "value": 0.5353382160118533}, {"attribute": "Y3EYm4KP", "value": 0.17998368272640508}, {"attribute": "0ko3g9f2", "value": 0.8651058470562081}], "user_id": "l46Rftlm"}, {"results": [{"attribute": "F6CPU3W0", "value": 0.5555058546141993}, {"attribute": "U3FYDPaC", "value": 0.816111091756052}, {"attribute": "9aKPn4Jx", "value": 0.4608672772879794}], "user_id": "hU92XXud"}]}' \
    > test.out 2>&1
eval_tap $? 7 'StoreMatchResults' test.out

#- 8 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "rm9bWczL"}' \
    > test.out 2>&1
eval_tap $? 8 'Rebalance' test.out

#- 9 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "pzo6pU3O", "client_version": "9Pj6PWAp", "deployment": "6KQo3qll", "error_code": 3, "error_message": "4Rk65oKD", "game_mode": "XsdUidQo", "joinable": false, "match_id": "eOAZbiTX", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 5, "party_attributes": {"QL9vFsNv": {}, "4NzJTXuX": {}, "wTk9M1jt": {}}, "party_id": "IvAwn7qc", "party_members": [{"extra_attributes": {"w6WiJHO0": {}, "V2eHiO1a": {}, "ue6ioNu0": {}}, "user_id": "9WzUXwiV"}, {"extra_attributes": {"O3yC2Ohf": {}, "jQ3GahOb": {}, "dxv7CmYH": {}}, "user_id": "LH956MOW"}, {"extra_attributes": {"XbFw8X0p": {}, "6NgEKsqU": {}, "Fb2ywRNB": {}}, "user_id": "SqCURlEM"}], "ticket_id": "XnGWWEGv"}, {"first_ticket_created_at": 98, "party_attributes": {"UvDVOZfv": {}, "cWkagicw": {}, "8DT1hNhM": {}}, "party_id": "tk22VbaA", "party_members": [{"extra_attributes": {"YeAPaPUg": {}, "vYVolX4H": {}, "FUGHzf01": {}}, "user_id": "SyO8Pewd"}, {"extra_attributes": {"IWHzyBwA": {}, "2mPaBGF4": {}, "tsR61Ofr": {}}, "user_id": "wWRHIblH"}, {"extra_attributes": {"tW4p4aE6": {}, "gqPGFjGY": {}, "67Y1gs6D": {}}, "user_id": "Y8GsNjA2"}], "ticket_id": "ggsbMWuU"}, {"first_ticket_created_at": 54, "party_attributes": {"tQN3OgOG": {}, "5vR7juYH": {}, "3EEoE0OM": {}}, "party_id": "egsrDEQl", "party_members": [{"extra_attributes": {"b7N4dB7p": {}, "JhoFrrzc": {}, "m7LT10Oi": {}}, "user_id": "qhu4I2LX"}, {"extra_attributes": {"0PSdcObY": {}, "cAPhDgbU": {}, "KSnmZJbO": {}}, "user_id": "kTcdDa3d"}, {"extra_attributes": {"ucNkVX8g": {}, "1AAzoCsN": {}, "WZBlbRjH": {}}, "user_id": "p2ZPfqRw"}], "ticket_id": "esuA8MRl"}]}, {"matching_parties": [{"first_ticket_created_at": 48, "party_attributes": {"43ivXGOq": {}, "g8KcAei6": {}, "N6paEob1": {}}, "party_id": "sITGOQhF", "party_members": [{"extra_attributes": {"NROHfgXJ": {}, "LTHXA5fF": {}, "snHS3JNa": {}}, "user_id": "Fftu4WeN"}, {"extra_attributes": {"w8mHzXfl": {}, "d4XoK30B": {}, "hNF7wZNA": {}}, "user_id": "5fFlif7I"}, {"extra_attributes": {"1ry7VZZk": {}, "p6TEiL8B": {}, "ODmxDeqP": {}}, "user_id": "7cbQysUl"}], "ticket_id": "FZDf5sSS"}, {"first_ticket_created_at": 1, "party_attributes": {"ai0ti237": {}, "LWeaNmU0": {}, "61KqZ94S": {}}, "party_id": "axRm2daR", "party_members": [{"extra_attributes": {"nmWUfrR3": {}, "3TcdOzIU": {}, "AFMv6XI3": {}}, "user_id": "U3s8SuA9"}, {"extra_attributes": {"ddo2fHzY": {}, "PIhTez8I": {}, "RqXG5CIX": {}}, "user_id": "eJh960bf"}, {"extra_attributes": {"XGNexWUj": {}, "zUv0iHR0": {}, "lxtT1hzj": {}}, "user_id": "3p3mIZh8"}], "ticket_id": "hMMqeNMv"}, {"first_ticket_created_at": 24, "party_attributes": {"6wgAlLon": {}, "dAHJAxxD": {}, "D4N4OVdQ": {}}, "party_id": "WzJxySq7", "party_members": [{"extra_attributes": {"P9K0I7NS": {}, "6N9SgwlF": {}, "xBxWujIL": {}}, "user_id": "zr5MTWJ4"}, {"extra_attributes": {"P5AeCXS4": {}, "3KVqjGDg": {}, "7ZFtzZD8": {}}, "user_id": "Cb24CaWr"}, {"extra_attributes": {"jxLVELS3": {}, "jpY0cexQ": {}, "rl4IgURP": {}}, "user_id": "gC002UL0"}], "ticket_id": "ebI44C7R"}]}, {"matching_parties": [{"first_ticket_created_at": 96, "party_attributes": {"z6r1gEvm": {}, "h50Pnmc2": {}, "wZSOfZ1G": {}}, "party_id": "h5sAmxWp", "party_members": [{"extra_attributes": {"c7bOeaAC": {}, "upgbdPOs": {}, "0fsJeOVx": {}}, "user_id": "87URyvZU"}, {"extra_attributes": {"IYoYyBkt": {}, "qn3tK43X": {}, "pq7U8KVl": {}}, "user_id": "oatEBa8R"}, {"extra_attributes": {"oCgSv7FT": {}, "uTCctpbC": {}, "Ufp0JEK1": {}}, "user_id": "wyGvY40r"}], "ticket_id": "SORE0ncL"}, {"first_ticket_created_at": 41, "party_attributes": {"IS0v4K2o": {}, "WFdXloTr": {}, "Dv7nOXcd": {}}, "party_id": "nHhNp4h5", "party_members": [{"extra_attributes": {"jvagRYcg": {}, "dMtJC3D6": {}, "R8OsKqIZ": {}}, "user_id": "PIons0FS"}, {"extra_attributes": {"yd6K3VWg": {}, "ErK5SILg": {}, "hC0fJiNk": {}}, "user_id": "9mNy4b3i"}, {"extra_attributes": {"gjeWLBxd": {}, "1IzvMdwY": {}, "cQDAOdpM": {}}, "user_id": "wbJeiHVI"}], "ticket_id": "uCelJWlv"}, {"first_ticket_created_at": 89, "party_attributes": {"s4V4nDCt": {}, "yKDe7vUq": {}, "USzt0HqA": {}}, "party_id": "kEO3pB4d", "party_members": [{"extra_attributes": {"MT7QbnSG": {}, "dUPLOSau": {}, "rzTtmjnG": {}}, "user_id": "enBEjolG"}, {"extra_attributes": {"RxxfNU2R": {}, "US5hJTsK": {}, "of8Z3b1N": {}}, "user_id": "9cmoYsz2"}, {"extra_attributes": {"s53bRfMI": {}, "2wQLdDey": {}, "s6anLEPO": {}}, "user_id": "6WY4angd"}], "ticket_id": "92IL4B1A"}]}], "namespace": "eS3piAJJ", "party_attributes": {"rZ3C9KKE": {}, "GpaltQIs": {}, "lP02FsVJ": {}}, "party_id": "HhiHLr5y", "queued_at": 14, "region": "CCQ48BkW", "server_name": "Uc2RhwkN", "status": "K66anmYb", "ticket_id": "nFJPByHf", "updated_at": "1976-03-31T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'QueueSessionHandler' test.out

#- 10 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "5sf1Rxqe"}' \
    > test.out 2>&1
eval_tap $? 10 'DequeueSessionHandler' test.out

#- 11 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'MLwWvceR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'QuerySessionHandler' test.out

#- 12 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 41, "userID": "92316XaY", "weight": 0.09277849269744765}' \
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
    --matchIDs 'UokuCJnh' \
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
    --strategy 'DPw8bCIq' \
    > test.out 2>&1
eval_tap $? 16 'ImportChannels' test.out

#- 17 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'LbAGq9JP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetSingleMatchmakingChannel' test.out

#- 18 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'hkchAxeR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "3TbCfCCR", "description": "w1U2rxK1", "findMatchTimeoutSeconds": 60, "joinable": false, "max_delay_ms": 97, "ruleSet": {"alliance": {"combination": {"alliances": [{"max": 62, "min": 77, "name": "9oxkQjFA"}, {"max": 44, "min": 56, "name": "rmizEpjw"}, {"max": 94, "min": 18, "name": "Od3mPJSn"}], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 68, "role_flexing_second": 54}, "maxNumber": 86, "minNumber": 11, "playerMaxNumber": 24, "playerMinNumber": 90}, "alliance_flexing_rule": [{"combination": {"alliances": [{"max": 70, "min": 89, "name": "RijDFNBR"}, {"max": 48, "min": 97, "name": "91tkEJLt"}, {"max": 9, "min": 41, "name": "jY3gFebL"}], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 0, "role_flexing_second": 90}, "duration": 17, "max_number": 49, "min_number": 11, "player_max_number": 62, "player_min_number": 27}, {"combination": {"alliances": [{"max": 72, "min": 72, "name": "tCaYo6w2"}, {"max": 62, "min": 36, "name": "L5Y73yV0"}, {"max": 5, "min": 25, "name": "yIpfLLTE"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 59, "role_flexing_second": 75}, "duration": 20, "max_number": 5, "min_number": 87, "player_max_number": 58, "player_min_number": 64}, {"combination": {"alliances": [{"max": 92, "min": 22, "name": "UwtYJEj9"}, {"max": 35, "min": 24, "name": "0VqtGmTy"}, {"max": 89, "min": 100, "name": "WWKcykJK"}], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 70, "role_flexing_second": 92}, "duration": 35, "max_number": 60, "min_number": 53, "player_max_number": 40, "player_min_number": 89}], "flexingRules": [{"attribute": "XDge3fAk", "criteria": "Gvfg872b", "duration": 31, "reference": 0.2924518254089885}, {"attribute": "9h6Lo5fg", "criteria": "BYHOt69z", "duration": 96, "reference": 0.5259290720247441}, {"attribute": "FyyHvAv7", "criteria": "MzuQjfTH", "duration": 91, "reference": 0.13856315055233082}], "match_options": {"options": [{"name": "QVhfmwZe", "type": "LGXNnvgc"}, {"name": "x9uuupwd", "type": "eegSVpZv"}, {"name": "PZd2EMCB", "type": "yNJ8rbQI"}]}, "matchingRules": [{"attribute": "Nyvgci76", "criteria": "wDRFi0H5", "reference": 0.45159751442285634}, {"attribute": "ItsWhjos", "criteria": "d74HFUQo", "reference": 0.14091175265827727}, {"attribute": "tiK62sUQ", "criteria": "wMyNtHcT", "reference": 0.4322682023398272}], "sub_game_modes": {}}, "sessionQueueTimeoutSeconds": 48, "socialMatchmaking": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchmakingChannel' test.out

#- 19 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'Y3PljhvS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetAllPartyInChannel' test.out

#- 20 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '7KXfNRUq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetAllSessionsInChannel' test.out

#- 21 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'PzLFUb3c' \
    --matchID '9KWn48Ft' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["oCM1EWNO", "e7pETP0o", "dgzeowu1"], "party_id": "FlOa5kJ1", "user_id": "aLGAM199"}' \
    > test.out 2>&1
eval_tap $? 21 'AddUserIntoSessionInChannel' test.out

#- 22 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'DKwtue70' \
    --matchID 'J3ruklzo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteSessionInChannel' test.out

#- 23 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'S3M4oZAJ' \
    --matchID 'CvNQ7vTN' \
    --namespace "$AB_NAMESPACE" \
    --userID 'Yi1O3x2h' \
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
    --channelName 'ec7Xfqq7' \
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