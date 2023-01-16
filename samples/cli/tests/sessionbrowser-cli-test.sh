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
echo "1..21"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminQuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminQuerySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode '11NMM3l4' \
    --gameVersion 'QpdQkc7j' \
    --joinable 'FXyM4gwu' \
    --limit '25' \
    --matchExist 'nVbnra4M' \
    --matchId 'L27zAJP4' \
    --offset '47' \
    --serverStatus 'NR4KRJFu' \
    --userId 'hHM5JyE2' \
    --sessionType 'S3JY0zcC' \
    > test.out 2>&1
eval_tap $? 2 'AdminQuerySession' test.out

#- 3 GetTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --sessionType 'CJIulyHY' \
    > test.out 2>&1
eval_tap $? 3 'GetTotalActiveSession' test.out

#- 4 GetActiveCustomGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '73' \
    --serverRegion 'B3BagFUO' \
    --sessionId 'B00UNtFu' \
    > test.out 2>&1
eval_tap $? 4 'GetActiveCustomGameSessions' test.out

#- 5 GetActiveMatchmakingGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --matchId 'Td4NPh8K' \
    --offset '9' \
    --serverRegion 'Cpi3KDVL' \
    --sessionId '9YwlbKoy' \
    > test.out 2>&1
eval_tap $? 5 'GetActiveMatchmakingGameSessions' test.out

#- 6 AdminGetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '18HiyOaf' \
    > test.out 2>&1
eval_tap $? 6 'AdminGetSession' test.out

#- 7 AdminDeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminDeleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '5nmAHxfE' \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteSession' test.out

#- 8 AdminSearchSessionsV2
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminSearchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'W1HYTEK0' \
    --deleted  \
    --matchID '631U1IBO' \
    --partyID '6HiPE3qe' \
    --userID 'E0h0bYd0' \
    --limit '65' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 8 'AdminSearchSessionsV2' test.out

#- 9 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionHistoryDetailed \
    --matchID '6XcYvASO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'GetSessionHistoryDetailed' test.out

#- 10 QuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser querySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode '65WEREZ9' \
    --gameVersion 'VBGoe2iw' \
    --joinable 'YyxgCANq' \
    --limit '59' \
    --matchExist 'AVDlL29m' \
    --matchId 'PThwcbIQ' \
    --offset '29' \
    --serverStatus 'vGZOCb0C' \
    --userId 'uo25R05b' \
    --sessionType 'BUgbDAow' \
    > test.out 2>&1
eval_tap $? 10 'QuerySession' test.out

#- 11 CreateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_session_setting": {"allow_join_in_progress": false, "current_internal_player": 99, "current_player": 89, "map_name": "fMGfPM4W", "max_internal_player": 93, "max_player": 82, "mode": "eYaeEEWN", "num_bot": 52, "password": "ZLu6qzNe", "settings": {"qyEr6BJW": {}, "X7cLNAoV": {}, "Vcp1dDrL": {}}}, "game_version": "KEYPUJIY", "namespace": "RrgifdPk", "session_type": "gydQKfcs", "username": "g60Hfbl1"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateSession' test.out

#- 12 GetSessionByUserIDs
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'CGJr2YYc' \
    > test.out 2>&1
eval_tap $? 12 'GetSessionByUserIDs' test.out

#- 13 GetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'w3lY0K7Z' \
    > test.out 2>&1
eval_tap $? 13 'GetSession' test.out

#- 14 UpdateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '7UnRvPUG' \
    --body '{"game_max_player": 67}' \
    > test.out 2>&1
eval_tap $? 14 'UpdateSession' test.out

#- 15 DeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'fPjztfem' \
    > test.out 2>&1
eval_tap $? 15 'DeleteSession' test.out

#- 16 JoinSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser joinSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'PbzRknlw' \
    --body '{"password": "nTRg29sb"}' \
    > test.out 2>&1
eval_tap $? 16 'JoinSession' test.out

#- 17 DeleteSessionLocalDS
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'CBjg4bHP' \
    > test.out 2>&1
eval_tap $? 17 'DeleteSessionLocalDS' test.out

#- 18 AddPlayerToSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser addPlayerToSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '5QvxEL7S' \
    --body '{"as_spectator": false, "user_id": "fubBlPQw"}' \
    > test.out 2>&1
eval_tap $? 18 'AddPlayerToSession' test.out

#- 19 RemovePlayerFromSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'aswfcdfm' \
    --userID 'wYlqyHjF' \
    > test.out 2>&1
eval_tap $? 19 'RemovePlayerFromSession' test.out

#- 20 UpdateSettings
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSettings \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'KuVD6CG9' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateSettings' test.out

#- 21 GetRecentPlayer
./ng net.accelbyte.sdk.cli.Main sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID 'WTJJ8lGb' \
    > test.out 2>&1
eval_tap $? 21 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE