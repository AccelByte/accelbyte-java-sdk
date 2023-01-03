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
echo "1..37"

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
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "4OpxOLSU", "deployment": "QqrV58Yq", "inactiveTimeout": 65, "inviteTimeout": 14, "joinability": "DmQJF6g1", "maxPlayers": 48, "minPlayers": 60, "name": "7R6HGqFY", "requestedRegions": ["Xd4YuWwG", "uwuXgWAm", "YtxDsvUX"], "textChat": false, "type": "jmicoU94"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'Smn0BQi4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'O0KpS6UA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "ARmNfKqr", "deployment": "tzqEwgkK", "inactiveTimeout": 96, "inviteTimeout": 21, "joinability": "VaTYyA52", "maxPlayers": 51, "minPlayers": 19, "name": "iuoXwn94", "requestedRegions": ["LnLgxYsB", "68WhQ5d4", "QcT83gsQ"], "textChat": false, "type": "EKLlTI1I"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'zONQ71PV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '5OxXkLOY' \
    --dsPodName 'QfoRNLw5' \
    --fromTime 'Mf2YlYLk' \
    --gameMode 'KI7IjU4L' \
    --joinability 'LMFUhlps' \
    --limit '100' \
    --matchPool '5h63jJr4' \
    --memberID 'kX7Asb8f' \
    --offset '66' \
    --order 'UgMoJKZJ' \
    --orderBy 'lbsA5Y0s' \
    --sessionID 'FYcg2vie' \
    --status 'pJowYYLE' \
    --toTime '00RTRcYs' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'eV1p406G' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Y8pJqJjc' \
    --statusType 'HBRWeKiJ' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'wuhO3ald' \
    --key 'UcDFkSWo' \
    --leaderID 'DLNE3Ltl' \
    --limit '74' \
    --memberID 'l383yU6X' \
    --memberStatus 'XbBij2Y6' \
    --offset '66' \
    --order 'a1PdJUME' \
    --orderBy 'nKG9fMg6' \
    --value 'yAP8A8Gj' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"sGrr6AEi": {}, "DIitCUlw": {}, "kN0aoHTr": {}}, "backfillTicketID": "FVxTxIi9", "clientVersion": "kgT80oAO", "configurationName": "DN9glarZ", "deployment": "qTijTkxt", "inactiveTimeout": 70, "inviteTimeout": 93, "joinability": "8RllWeAM", "matchPool": "NWWiuiVm", "maxPlayers": 91, "minPlayers": 34, "requestedRegions": ["vsHAGO11", "T1qNp2mF", "GHAVrwJ3"], "serverName": "UllgoCau", "teams": [{"UserIDs": ["qRQis9I7", "ojX0TUgk", "oCLK3FSo"]}, {"UserIDs": ["fkZQjyIr", "jIHLSGuJ", "mj43FDmj"]}, {"UserIDs": ["ucZea0jn", "EARMGryV", "54lqSPLJ"]}], "textChat": true, "ticketIDs": ["Q8d20QQz", "71Ue8mqe", "qy3yFDwd"], "type": "pWBvMKpU"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateGameSession' test.out

#- 13 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"6OSHM00b": {}, "mWpAnxfx": {}, "pmm601G7": {}}' \
    > test.out 2>&1
eval_tap $? 13 'PublicQueryGameSessions' test.out

#- 14 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'y2EEUr9f' \
    > test.out 2>&1
eval_tap $? 14 'GetGameSessionByPodName' test.out

#- 15 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4gtzd1Ge' \
    > test.out 2>&1
eval_tap $? 15 'GetGameSession' test.out

#- 16 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6bm7cmU7' \
    --body '{"attributes": {"aqFQivpG": {}, "jhtr2Iin": {}, "eWul3Gjq": {}}, "backfillTicketID": "ZRqlZX82", "clientVersion": "Fi4ZvXZc", "deployment": "DMOox88Z", "inactiveTimeout": 3, "inviteTimeout": 1, "joinability": "552XNNMh", "matchPool": "FP2QIYFy", "maxPlayers": 86, "minPlayers": 93, "requestedRegions": ["yCRxSaYz", "rH1uC7dy", "VYQzJvIP"], "teams": [{"UserIDs": ["rbHyRnGn", "a9Zc6tCu", "bU31eLww"]}, {"UserIDs": ["ebI6PAyN", "U29Iuy4O", "9iDarRZw"]}, {"UserIDs": ["gc7xnIq2", "0tqCYZOY", "fVeJYM5u"]}], "ticketIDs": ["xEId6xm2", "FnbCHXmn", "BrPBG9lk"], "type": "ZbUY90Nd", "version": 34}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGameSession' test.out

#- 17 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2VnScokh' \
    > test.out 2>&1
eval_tap $? 17 'DeleteGameSession' test.out

#- 18 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5CDSIDlr' \
    --body '{"attributes": {"SVEJccls": {}, "FrmvUX7G": {}, "8nd8qMZW": {}}, "backfillTicketID": "tE5dG7xr", "clientVersion": "YJkL8Jx4", "deployment": "OcBZAC0f", "inactiveTimeout": 32, "inviteTimeout": 76, "joinability": "GClap4tR", "matchPool": "94XQv361", "maxPlayers": 99, "minPlayers": 80, "requestedRegions": ["QHcT4U1P", "L1ddzexc", "0cwI7RNO"], "teams": [{"UserIDs": ["ZDaxTZRO", "ulYXweRT", "ClMmaveo"]}, {"UserIDs": ["D2qPD2Bn", "MiFIRUKe", "XdsArn4t"]}, {"UserIDs": ["P04YS8JC", "zmluTr6N", "HHuat29D"]}], "ticketIDs": ["FoxrKRHO", "ymaGgHj4", "gCBqCiDd"], "type": "UxFxUKFS", "version": 36}' \
    > test.out 2>&1
eval_tap $? 18 'PatchUpdateGameSession' test.out

#- 19 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BxtLZOAO' \
    --body '{"userID": "1QuQcYjj"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicGameSessionInvite' test.out

#- 20 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1ZiaI99z' \
    > test.out 2>&1
eval_tap $? 20 'JoinGameSession' test.out

#- 21 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ofwc60UA' \
    > test.out 2>&1
eval_tap $? 21 'LeaveGameSession' test.out

#- 22 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Wq2o6mBX' \
    > test.out 2>&1
eval_tap $? 22 'PublicGameSessionReject' test.out

#- 23 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "q0Og0nnD"}' \
    > test.out 2>&1
eval_tap $? 23 'PublicPartyJoinCode' test.out

#- 24 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rrHCRFgb' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetParty' test.out

#- 25 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xETb9P4M' \
    --body '{"attributes": {"QhjoFIOe": {}, "OkhOwQkr": {}, "lHJFD1Of": {}}, "inactiveTimeout": 60, "inviteTimeout": 88, "joinability": "SnJkxhRl", "maxPlayers": 6, "minPlayers": 22, "type": "tRg8jMVt", "version": 48}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateParty' test.out

#- 26 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sM2WIhvs' \
    --body '{"attributes": {"yU6BMiIM": {}, "J6dU1n93": {}, "1UjyrBpC": {}}, "inactiveTimeout": 45, "inviteTimeout": 63, "joinability": "2zJxuSNU", "maxPlayers": 71, "minPlayers": 92, "type": "SRF9CzUd", "version": 12}' \
    > test.out 2>&1
eval_tap $? 26 'PublicPatchUpdateParty' test.out

#- 27 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'clOePSTC' \
    > test.out 2>&1
eval_tap $? 27 'PublicGeneratePartyCode' test.out

#- 28 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ug1CiRqP' \
    > test.out 2>&1
eval_tap $? 28 'PublicRevokePartyCode' test.out

#- 29 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hRS8sjtG' \
    --body '{"userID": "TTC9HHGO"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicPartyInvite' test.out

#- 30 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rL8OzHZq' \
    --body '{"leaderID": "PubxYt84"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPromotePartyLeader' test.out

#- 31 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '1W9KC4Cf' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoin' test.out

#- 32 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tC047zSi' \
    > test.out 2>&1
eval_tap $? 32 'PublicPartyLeave' test.out

#- 33 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'TBZzYfqY' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyReject' test.out

#- 34 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XODlwSOv' \
    --userId 'YrqV8uJ9' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyKick' test.out

#- 35 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"6eQahRj2": {}, "ZguaFzyF": {}, "cRKDdpdZ": {}}, "configurationName": "xSNhk3PZ", "inactiveTimeout": 24, "inviteTimeout": 93, "joinability": "VpH1nGU0", "maxPlayers": 28, "members": [{"ID": "HuJRRiOA", "PlatformID": "DT5GyufX", "PlatformUserID": "N6uz9MsG"}, {"ID": "6NltSZ9i", "PlatformID": "X1d71hrw", "PlatformUserID": "5XqNNnho"}, {"ID": "QdnhCuYA", "PlatformID": "9qVJHeJx", "PlatformUserID": "bEfUmEQQ"}], "minPlayers": 95, "textChat": false, "type": "6d2t3riJ"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicCreateParty' test.out

#- 36 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'F7T8XbvI' \
    --orderBy 'R4DxvfKN' \
    --status 'aJaL7yux' \
    > test.out 2>&1
eval_tap $? 36 'PublicQueryMyGameSessions' test.out

#- 37 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'EVaph97l' \
    --orderBy 'uMPKI0gJ' \
    --status 'WQSlrB9t' \
    > test.out 2>&1
eval_tap $? 37 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE