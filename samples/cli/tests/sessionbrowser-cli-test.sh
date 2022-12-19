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
    --sessionType 'jz0MfWKw' \
    > test.out 2>&1
eval_tap $? 2 'GetTotalActiveSession' test.out

#- 3 GetActiveCustomGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    --serverRegion 'F9GH9TCf' \
    --sessionId 'AWoS6Uvw' \
    > test.out 2>&1
eval_tap $? 3 'GetActiveCustomGameSessions' test.out

#- 4 GetActiveMatchmakingGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    --matchId 'n9mToLUB' \
    --serverRegion '1eA1qlWT' \
    --sessionId 'ACh5cIs0' \
    > test.out 2>&1
eval_tap $? 4 'GetActiveMatchmakingGameSessions' test.out

#- 5 AdminGetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6gixYtug' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetSession' test.out

#- 6 AdminDeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminDeleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'of7JGMOn' \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteSession' test.out

#- 7 AdminSearchSessionsV2
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminSearchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'r1IuXQvg' \
    --deleted  \
    --matchID 'E1PVdLne' \
    --partyID 'eSjiTSpu' \
    --userID 'NX01bMUe' \
    --limit '31' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 7 'AdminSearchSessionsV2' test.out

#- 8 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionHistoryDetailed \
    --matchID 'w3Mpsiiq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'GetSessionHistoryDetailed' test.out

#- 9 QuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser querySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode 'BCsPxaIc' \
    --gameVersion '9Vt91QT3' \
    --joinable '7no2D9km' \
    --limit '25' \
    --matchExist 'EDEnMMM5' \
    --matchId 'SesozFi4' \
    --offset '43' \
    --serverStatus 'EkPH6suv' \
    --userId 'hxE8gyCK' \
    --sessionType 'yRewhlkF' \
    > test.out 2>&1
eval_tap $? 9 'QuerySession' test.out

#- 10 CreateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_session_setting": {"allow_join_in_progress": true, "current_internal_player": 83, "current_player": 66, "map_name": "tiwmFUBF", "max_internal_player": 54, "max_player": 38, "mode": "AgulhsnW", "num_bot": 69, "password": "vXvBIWGA", "settings": {"IJkYEZUV": {}, "HwRGEDbj": {}, "pAUurEfG": {}}}, "game_version": "2KnStQDU", "namespace": "nSm8KfpO", "session_type": "q8FGu2oe", "username": "phhJGzJi"}' \
    > test.out 2>&1
eval_tap $? 10 'CreateSession' test.out

#- 11 GetSessionByUserIDs
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'UUKvTcyd' \
    > test.out 2>&1
eval_tap $? 11 'GetSessionByUserIDs' test.out

#- 12 GetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '2xnFQlyr' \
    > test.out 2>&1
eval_tap $? 12 'GetSession' test.out

#- 13 UpdateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '2WtOySn9' \
    --body '{"game_max_player": 47}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateSession' test.out

#- 14 DeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'vtoE7nzp' \
    > test.out 2>&1
eval_tap $? 14 'DeleteSession' test.out

#- 15 JoinSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser joinSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'kyJI3J2G' \
    --body '{"password": "Ib3cZH2u"}' \
    > test.out 2>&1
eval_tap $? 15 'JoinSession' test.out

#- 16 DeleteSessionLocalDS
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'M1ccfjuW' \
    > test.out 2>&1
eval_tap $? 16 'DeleteSessionLocalDS' test.out

#- 17 AddPlayerToSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser addPlayerToSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'c6GSzutv' \
    --body '{"as_spectator": false, "user_id": "YH6Vbd2J"}' \
    > test.out 2>&1
eval_tap $? 17 'AddPlayerToSession' test.out

#- 18 RemovePlayerFromSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'YpkQ5PIu' \
    --userID 'Ts9hBFv3' \
    > test.out 2>&1
eval_tap $? 18 'RemovePlayerFromSession' test.out

#- 19 UpdateSettings
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSettings \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'NRSAXTXC' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateSettings' test.out

#- 20 GetRecentPlayer
./ng net.accelbyte.sdk.cli.Main sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID '42pyLJxQ' \
    > test.out 2>&1
eval_tap $? 20 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE