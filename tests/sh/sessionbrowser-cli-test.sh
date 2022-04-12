#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

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

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..16"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetTotalActiveSession
java -jar "${CLI_JAR}" sessionbrowser getTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'GetTotalActiveSession' test.out

#- 3 GetActiveCustomGameSessions
java -jar "${CLI_JAR}" sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'GetActiveCustomGameSessions' test.out

#- 4 GetActiveMatchmakingGameSessions
java -jar "${CLI_JAR}" sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'GetActiveMatchmakingGameSessions' test.out

#- 5 AdminGetSession
java -jar "${CLI_JAR}" sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'FtBxyZcD' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetSession' test.out

#- 6 QuerySession
java -jar "${CLI_JAR}" sessionbrowser querySession \
    --namespace "$AB_NAMESPACE" \
    --sessionType 'XBpGlsQu' \
    > test.out 2>&1
eval_tap $? 6 'QuerySession' test.out

#- 7 CreateSession
java -jar "${CLI_JAR}" sessionbrowser createSession \
    --body '{"game_session_setting": {"allow_join_in_progress": true, "current_internal_player": 42, "current_player": 77, "map_name": "f0IsJkTr", "max_internal_player": 6, "max_player": 68, "mode": "DcV2zXnT", "num_bot": 72, "password": "jXY1bPqa", "settings": {"miBxx9Cs": {}}}, "game_version": "18EY84ek", "namespace": "ItqRzHU1", "session_type": "oh570KQB", "username": "Vaewc72k"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'CreateSession' test.out

#- 8 GetSessionByUserIDs
java -jar "${CLI_JAR}" sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'rSha68n3' \
    > test.out 2>&1
eval_tap $? 8 'GetSessionByUserIDs' test.out

#- 9 GetSession
java -jar "${CLI_JAR}" sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'Ynozp1C2' \
    > test.out 2>&1
eval_tap $? 9 'GetSession' test.out

#- 10 UpdateSession
java -jar "${CLI_JAR}" sessionbrowser updateSession \
    --body '{"game_current_player": 72, "game_max_player": 24}' \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'IQTuBdNE' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSession' test.out

#- 11 DeleteSession
java -jar "${CLI_JAR}" sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'UsxFb8CJ' \
    > test.out 2>&1
eval_tap $? 11 'DeleteSession' test.out

#- 12 JoinSession
java -jar "${CLI_JAR}" sessionbrowser joinSession \
    --body '{"password": "17M7DJZa"}' \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'MSxECbZb' \
    > test.out 2>&1
eval_tap $? 12 'JoinSession' test.out

#- 13 DeleteSessionLocalDS
java -jar "${CLI_JAR}" sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'ygyoarOR' \
    > test.out 2>&1
eval_tap $? 13 'DeleteSessionLocalDS' test.out

#- 14 AddPlayerToSession
java -jar "${CLI_JAR}" sessionbrowser addPlayerToSession \
    --body '{"as_spectator": false, "user_id": "eNHSb8Rh"}' \
    --namespace "$AB_NAMESPACE" \
    --sessionID '3kgs9qqJ' \
    > test.out 2>&1
eval_tap $? 14 'AddPlayerToSession' test.out

#- 15 RemovePlayerFromSession
java -jar "${CLI_JAR}" sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'bnQsoBgi' \
    --userID 'VpP8Cm3y' \
    > test.out 2>&1
eval_tap $? 15 'RemovePlayerFromSession' test.out

#- 16 GetRecentPlayer
java -jar "${CLI_JAR}" sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID 'vASUoxdx' \
    > test.out 2>&1
eval_tap $? 16 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE