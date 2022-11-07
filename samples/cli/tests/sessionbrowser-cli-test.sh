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
echo "1..20"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --sessionType 'YnYR9M6T' \
    > test.out 2>&1
eval_tap $? 2 'GetTotalActiveSession' test.out

#- 3 GetActiveCustomGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    --serverRegion 'P1VkAUmq' \
    --sessionId 'KO7kmLo0' \
    > test.out 2>&1
eval_tap $? 3 'GetActiveCustomGameSessions' test.out

#- 4 GetActiveMatchmakingGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    --matchId 'Ia75HCRz' \
    --serverRegion '7xzwKbNu' \
    --sessionId '5ofUVAZe' \
    > test.out 2>&1
eval_tap $? 4 'GetActiveMatchmakingGameSessions' test.out

#- 5 AdminGetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'cWItBpAY' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetSession' test.out

#- 6 AdminDeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminDeleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'DU7rYJ1u' \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteSession' test.out

#- 7 AdminSearchSessionsV2
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminSearchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'fGB9L0y4' \
    --deleted  \
    --matchID '40jd4CCZ' \
    --partyID 'h73nRRcD' \
    --userID 'BQ2NvoEf' \
    --limit '17' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 7 'AdminSearchSessionsV2' test.out

#- 8 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionHistoryDetailed \
    --matchID 'y25waJqz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'GetSessionHistoryDetailed' test.out

#- 9 QuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser querySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode 'l2sJogJF' \
    --gameVersion '5gF1prND' \
    --joinable 'Nk3vgaAv' \
    --limit '23' \
    --matchExist 'nVBj6Of4' \
    --matchId '9WcVkDJQ' \
    --offset '75' \
    --serverStatus 'IaEusSMI' \
    --userId '8VEUIisc' \
    --sessionType 'v3WL3oqZ' \
    > test.out 2>&1
eval_tap $? 9 'QuerySession' test.out

#- 10 CreateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_session_setting": {"allow_join_in_progress": false, "current_internal_player": 45, "current_player": 2, "map_name": "jzfCOU8Q", "max_internal_player": 53, "max_player": 32, "mode": "Lw1TtYFP", "num_bot": 60, "password": "TqC4S0Rm", "settings": {"gFxkvi0a": {}, "vdNB41Mg": {}, "RODVsf7Y": {}}}, "game_version": "P0pQciCw", "namespace": "MV1Tq2GD", "session_type": "XCTZgLcH", "username": "fLYjwbuo"}' \
    > test.out 2>&1
eval_tap $? 10 'CreateSession' test.out

#- 11 GetSessionByUserIDs
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'SNDutKSo' \
    > test.out 2>&1
eval_tap $? 11 'GetSessionByUserIDs' test.out

#- 12 GetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'fW1HACV5' \
    > test.out 2>&1
eval_tap $? 12 'GetSession' test.out

#- 13 UpdateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Vm2I9JqF' \
    --body '{"game_max_player": 32}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateSession' test.out

#- 14 DeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'PbCXiI5j' \
    > test.out 2>&1
eval_tap $? 14 'DeleteSession' test.out

#- 15 JoinSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser joinSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6YC7AVPw' \
    --body '{"password": "T1LonBin"}' \
    > test.out 2>&1
eval_tap $? 15 'JoinSession' test.out

#- 16 DeleteSessionLocalDS
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'oQy6l0i0' \
    > test.out 2>&1
eval_tap $? 16 'DeleteSessionLocalDS' test.out

#- 17 AddPlayerToSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser addPlayerToSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '0rwrlmUn' \
    --body '{"as_spectator": false, "user_id": "Jt7IaZ8s"}' \
    > test.out 2>&1
eval_tap $? 17 'AddPlayerToSession' test.out

#- 18 RemovePlayerFromSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'wwccxo8e' \
    --userID 'U1pxr83j' \
    > test.out 2>&1
eval_tap $? 18 'RemovePlayerFromSession' test.out

#- 19 UpdateSettings
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSettings \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'iLTxaEAJ' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateSettings' test.out

#- 20 GetRecentPlayer
./ng net.accelbyte.sdk.cli.Main sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID '4rrLfIiz' \
    > test.out 2>&1
eval_tap $? 20 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE