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
    --gameMode 'EAxcVpFrttufHIRd' \
    --gameVersion 'H9UzVRiXbqlAw7r6' \
    --joinable 'W2ktQG0h5JAav5kR' \
    --limit '0' \
    --matchExist '4n8mzZ0m8SAMTwE6' \
    --matchId 'I56IaRDBXxyaNoMR' \
    --offset '87' \
    --serverStatus 'hkspInrAip6lyzSx' \
    --userId 'wElFHHdgs21Jub74' \
    --sessionType 'CUkNmKJfh5pUkHOD' \
    > test.out 2>&1
eval_tap $? 2 'AdminQuerySession' test.out

#- 3 GetTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --sessionType 'poMF78NY4YkHs1cn' \
    > test.out 2>&1
eval_tap $? 3 'GetTotalActiveSession' test.out

#- 4 GetActiveCustomGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveCustomGameSessions \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '71' \
    --serverRegion '1JSDgY1TXp38zsCT' \
    --sessionId 'CrbCbPOyNQkT7Nvy' \
    > test.out 2>&1
eval_tap $? 4 'GetActiveCustomGameSessions' test.out

#- 5 GetActiveMatchmakingGameSessions
./ng net.accelbyte.sdk.cli.Main sessionbrowser getActiveMatchmakingGameSessions \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --matchId 'I18mAQLnzjMf8GZ2' \
    --offset '100' \
    --serverRegion 'gSrjJW2OQNOs1PXh' \
    --sessionId 'T5FvdiRilZ7oFgx4' \
    > test.out 2>&1
eval_tap $? 5 'GetActiveMatchmakingGameSessions' test.out

#- 6 AdminGetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminGetSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'c8OumKtPDKJDXn7Z' \
    > test.out 2>&1
eval_tap $? 6 'AdminGetSession' test.out

#- 7 AdminDeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminDeleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '4U68su8XfqlqNiTv' \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteSession' test.out

#- 8 AdminSearchSessionsV2
./ng net.accelbyte.sdk.cli.Main sessionbrowser adminSearchSessionsV2 \
    --namespace "$AB_NAMESPACE" \
    --channel 'B6SdAdIhUDrwoZ5M' \
    --deleted  \
    --matchID 'ecdKi5r6QEa1ysLE' \
    --partyID 'zth6mXhzkzWkFeZS' \
    --sessionType 'oEAcBdW19m4eu6d5' \
    --status 'tA5jUmiTqpyhPFdx' \
    --userID 'LzFQN05MYzYiKWe5' \
    --limit '7' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 8 'AdminSearchSessionsV2' test.out

#- 9 GetSessionHistoryDetailed
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionHistoryDetailed \
    --matchID 'NRljv7IPrDQQRgat' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'GetSessionHistoryDetailed' test.out

#- 10 UserQuerySession
./ng net.accelbyte.sdk.cli.Main sessionbrowser userQuerySession \
    --namespace "$AB_NAMESPACE" \
    --gameMode '0SevkLGMS0lyuI9a' \
    --gameVersion '2I9u6Vpbsx5w8hqU' \
    --joinable 'I06UpOXGSLmCVuHO' \
    --limit '86' \
    --matchExist '4sNveabntBSxTeIv' \
    --matchId '53HGCiljvjKoyD6S' \
    --offset '59' \
    --serverStatus 'okahFjkQsfCaTmt1' \
    --userId 'd67FXGk2s9Q0mPVo' \
    --sessionType '3twu0MesTCf9x4rt' \
    > test.out 2>&1
eval_tap $? 10 'UserQuerySession' test.out

#- 11 CreateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser createSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"game_session_setting": {"allow_join_in_progress": false, "current_internal_player": 23, "current_player": 27, "map_name": "aRlxfcjHfYakUCTq", "max_internal_player": 67, "max_player": 70, "mode": "kE7wcWfDslpJSqGA", "num_bot": 85, "password": "Q0yYoNRKd3IL5TAQ", "settings": {"6iiPlSC2uE4o5Vwd": {}, "o3fePqIJA8IHtrkm": {}, "u0hpDDWVAla2l5BY": {}}}, "game_version": "NtIuS5S5XUdjsoqw", "namespace": "GyzzWi9gwQYv7t1o", "session_type": "7TTr1DmrhZv15T7q", "username": "uIOvBMcaYmvCkGZ5"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateSession' test.out

#- 12 GetSessionByUserIDs
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSessionByUserIDs \
    --namespace "$AB_NAMESPACE" \
    --userIds 'dAgqxpBFmaLoxozr' \
    > test.out 2>&1
eval_tap $? 12 'GetSessionByUserIDs' test.out

#- 13 GetSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser getSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6wfNPX2bOItRMvqt' \
    > test.out 2>&1
eval_tap $? 13 'GetSession' test.out

#- 14 UpdateSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'lB2jJCSQT279ZZPY' \
    --body '{"game_max_player": 66}' \
    > test.out 2>&1
eval_tap $? 14 'UpdateSession' test.out

#- 15 DeleteSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6Q9lNmqRBaAkLnvx' \
    > test.out 2>&1
eval_tap $? 15 'DeleteSession' test.out

#- 16 JoinSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser joinSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'kT1X68cmDc3fxU8M' \
    --body '{"password": "yKrQpM4hkkK6KKXN"}' \
    > test.out 2>&1
eval_tap $? 16 'JoinSession' test.out

#- 17 DeleteSessionLocalDS
./ng net.accelbyte.sdk.cli.Main sessionbrowser deleteSessionLocalDS \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'B3Gv0IqmF51TkhjY' \
    > test.out 2>&1
eval_tap $? 17 'DeleteSessionLocalDS' test.out

#- 18 AddPlayerToSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser addPlayerToSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'naq6foWvXa3bMrXs' \
    --body '{"as_spectator": true, "user_id": "tGeoyIPa8ZRrvjj7"}' \
    > test.out 2>&1
eval_tap $? 18 'AddPlayerToSession' test.out

#- 19 RemovePlayerFromSession
./ng net.accelbyte.sdk.cli.Main sessionbrowser removePlayerFromSession \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'il35MXbN9oCMNqq9' \
    --userID '8SjTvhZNkSQ70D0H' \
    > test.out 2>&1
eval_tap $? 19 'RemovePlayerFromSession' test.out

#- 20 UpdateSettings
./ng net.accelbyte.sdk.cli.Main sessionbrowser updateSettings \
    --namespace "$AB_NAMESPACE" \
    --sessionID '6BXksUC9b6i5lZC9' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateSettings' test.out

#- 21 GetRecentPlayer
./ng net.accelbyte.sdk.cli.Main sessionbrowser getRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userID 'xv32e8c5csSovoqs' \
    > test.out 2>&1
eval_tap $? 21 'GetRecentPlayer' test.out


rm -f "tmp.dat"

exit $EXIT_CODE