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
    --sessionType '53pBh8a0' \
    > test.out 2>&1
eval_tap $? 2 'GetTotalActiveSession' test.out

#- 3 GetActiveCustomGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    --serverRegion 'YF93kVjt' \
    --sessionId 'N2grRB5V' \
    > test.out 2>&1
eval_tap $? 3 'GetActiveCustomGameSessions' test.out

#- 4 GetActiveMatchmakingGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    --matchId '8qrqCOsj' \
    --serverRegion 'NzNtaNLv' \
    --sessionId 'hhurDwBx' \
    > test.out 2>&1
eval_tap $? 4 'GetActiveMatchmakingGameSessions' test.out

#- 5 AdminGetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'O4PrFbD0' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetSession' test.out

#- 6 AdminSearchSessionsV2
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminSearchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'UVrPPCCq' \
    --deleted  \
    --matchID 'c4SI8ANg' \
    --partyID 'GjkX4KlB' \
    --userID 'DN2EniUs' \
    --limit '2' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 6 'AdminSearchSessionsV2' test.out

#- 7 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionHistoryDetailed \
    --matchID 'jTVo4t3p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetSessionHistoryDetailed' test.out

#- 8 QuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser querySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode 'L09RG6D9' \
    --gameVersion '2WzuOmSx' \
    --joinable '2lkjCWkV' \
    --limit '22' \
    --matchExist '4jfkbpR4' \
    --matchId 'kZgHNdJz' \
    --offset '67' \
    --serverStatus 'JjhoxA0d' \
    --userId '3isUjlrx' \
    --sessionType 'uRi9QXGw' \
    > test.out 2>&1
eval_tap $? 8 'QuerySession' test.out

#- 9 CreateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_session_setting": {"allow_join_in_progress": false, "current_internal_player": 11, "current_player": 34, "map_name": "aHsjqFJZ", "max_internal_player": 89, "max_player": 9, "mode": "t3YuAQRq", "num_bot": 41, "password": "pigwZ8UR", "settings": {"zYCE65Vb": {}, "2Mn4ZSpk": {}, "iQwdxVHf": {}}}, "game_version": "qVYZCDJa", "namespace": "JuuYpysr", "session_type": "OF3qhhpL", "username": "y3PbfrGt"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateSession' test.out

#- 10 GetSessionByUserIDs
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'vADvnSBq' \
    > test.out 2>&1
eval_tap $? 10 'GetSessionByUserIDs' test.out

#- 11 GetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'tQukUniD' \
    > test.out 2>&1
eval_tap $? 11 'GetSession' test.out

#- 12 UpdateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'EPi6Qexi' \
    --body '{"game_max_player": 51}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateSession' test.out

#- 13 DeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'hByUou15' \
    > test.out 2>&1
eval_tap $? 13 'DeleteSession' test.out

#- 14 JoinSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser joinSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'qyUAZM5Y' \
    --body '{"password": "R2rZAsc1"}' \
    > test.out 2>&1
eval_tap $? 14 'JoinSession' test.out

#- 15 DeleteSessionLocalDS
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'EQzweNuU' \
    > test.out 2>&1
eval_tap $? 15 'DeleteSessionLocalDS' test.out

#- 16 AddPlayerToSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser addPlayerToSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'eDsJK1iS' \
    --body '{"as_spectator": true, "user_id": "09gZcyrN"}' \
    > test.out 2>&1
eval_tap $? 16 'AddPlayerToSession' test.out

#- 17 RemovePlayerFromSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'cJ9tP4J9' \
    --userID 'VKboL0Wo' \
    > test.out 2>&1
eval_tap $? 17 'RemovePlayerFromSession' test.out

#- 18 UpdateSettings
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSettings \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'PyiU8JCE' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateSettings' test.out

#- 19 GetRecentPlayer
./ng net.accelbyte.sdk.cli.Main sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID 'q9dfdFJr' \
    > test.out 2>&1
eval_tap $? 19 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE