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
echo "1..19"

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
    --sessionType '4AImzurs' \
    > test.out 2>&1
eval_tap $? 2 'GetTotalActiveSession' test.out

#- 3 GetActiveCustomGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    --serverRegion 'cr2roVwY' \
    --sessionId 'CmANfcgm' \
    > test.out 2>&1
eval_tap $? 3 'GetActiveCustomGameSessions' test.out

#- 4 GetActiveMatchmakingGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    --matchId 'PqN4PL4h' \
    --serverRegion 'FzhPjyEy' \
    --sessionId 'idxVd1Mc' \
    > test.out 2>&1
eval_tap $? 4 'GetActiveMatchmakingGameSessions' test.out

#- 5 AdminGetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '1qniSeNu' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetSession' test.out

#- 6 AdminSearchSessionsV2
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminSearchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'zmPNgXG5' \
    --deleted  \
    --matchID 'D4tE4HNc' \
    --partyID 'YYLDRipW' \
    --userID '4XyeGcLx' \
    --limit '62' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 6 'AdminSearchSessionsV2' test.out

#- 7 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionHistoryDetailed \
    --matchID 'tr2MWp24' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetSessionHistoryDetailed' test.out

#- 8 QuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser querySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode 'PzgBxp1k' \
    --gameVersion '8GKS6vGm' \
    --joinable 'He5XTUNI' \
    --limit '98' \
    --matchExist 'IScWpNuC' \
    --matchId 'Kl7pQPKJ' \
    --offset '85' \
    --serverStatus 'avBR4Io5' \
    --userId 'GdoIwAJl' \
    --sessionType 'Y1rx6zoO' \
    > test.out 2>&1
eval_tap $? 8 'QuerySession' test.out

#- 9 CreateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_session_setting": {"allow_join_in_progress": true, "current_internal_player": 91, "current_player": 69, "map_name": "OdZSrAgo", "max_internal_player": 91, "max_player": 57, "mode": "lFYRRAiW", "num_bot": 57, "password": "zDMZsniH", "settings": {"fyaRgwlO": {}, "Ha6AqISk": {}, "IEyz3oC7": {}}}, "game_version": "OVrAhUZB", "namespace": "MbXA6JHK", "session_type": "RUkUwwsE", "username": "BXRThFmJ"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateSession' test.out

#- 10 GetSessionByUserIDs
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'Cfrp3KBO' \
    > test.out 2>&1
eval_tap $? 10 'GetSessionByUserIDs' test.out

#- 11 GetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'xYoOqfNT' \
    > test.out 2>&1
eval_tap $? 11 'GetSession' test.out

#- 12 UpdateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Y60fd27p' \
    --body '{"game_max_player": 59}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateSession' test.out

#- 13 DeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'F7PWOPDH' \
    > test.out 2>&1
eval_tap $? 13 'DeleteSession' test.out

#- 14 JoinSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser joinSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'D5N0a3CV' \
    --body '{"password": "lEqGOunZ"}' \
    > test.out 2>&1
eval_tap $? 14 'JoinSession' test.out

#- 15 DeleteSessionLocalDS
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ld5h1ZRG' \
    > test.out 2>&1
eval_tap $? 15 'DeleteSessionLocalDS' test.out

#- 16 AddPlayerToSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser addPlayerToSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'BWPt2X4D' \
    --body '{"as_spectator": false, "user_id": "6SLDMNCb"}' \
    > test.out 2>&1
eval_tap $? 16 'AddPlayerToSession' test.out

#- 17 RemovePlayerFromSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '4hzzF8tK' \
    --userID 'mVTJRr4k' \
    > test.out 2>&1
eval_tap $? 17 'RemovePlayerFromSession' test.out

#- 18 UpdateSettings
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSettings \
    --namespace "$AB_NAMESPACE" \
    --sessionID '49N6WQRK' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateSettings' test.out

#- 19 GetRecentPlayer
./ng net.accelbyte.sdk.cli.Main sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID 'h2amBCER' \
    > test.out 2>&1
eval_tap $? 19 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE