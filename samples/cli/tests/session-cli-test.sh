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
    --body '{"clientVersion": "3FgFEZld", "deployment": "rteRAiMZ", "inactiveTimeout": 8, "inviteTimeout": 58, "joinability": "rQiyNGlA", "maxPlayers": 31, "minPlayers": 18, "name": "uyW9qeHW", "requestedRegions": ["hhCJUTC5", "laYhj2yR", "nRqlEriO"], "type": "3kYR8LsU"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'QaM7O2VC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'BdEpIiFo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "CMVaSqOO", "deployment": "gNLSWTw7", "inactiveTimeout": 58, "inviteTimeout": 60, "joinability": "frDOfejL", "maxPlayers": 90, "minPlayers": 84, "name": "sA60BAte", "requestedRegions": ["aS1QmY5o", "xfxUMBL6", "CAT9o8Og"], "type": "9BQoK42s"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'IBB5boQN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'EmmqrehN' \
    --dsPodName 'YtoLgmQa' \
    --fromTime 'gXGZt3Ox' \
    --gameMode 'tZv71pwZ' \
    --joinability 'eUbOnBWU' \
    --limit '12' \
    --matchPool 'OzMZWD1L' \
    --memberID 'sUp5ywOW' \
    --offset '71' \
    --order 'sLhod86U' \
    --orderBy 'YVNIrJVU' \
    --sessionID 'iKzbUNsz' \
    --status 'cC82pwEx' \
    --toTime 'As9Vmdk4' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'laY6WfxE' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Sa9jQxck' \
    --statusType 'gKs63dXN' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'A28uzCJX' \
    --key 'v4ipmlNC' \
    --leaderID 'rqbl8Gbk' \
    --limit '65' \
    --memberID 'TCUZAz6v' \
    --memberStatus 'x0CWjZhW' \
    --offset '81' \
    --order '0tFa2ijy' \
    --orderBy '6U7G57Vm' \
    --value 'fIwO8H4c' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Qd6h7QBH": {}, "GBcEpbbH": {}, "MgLDlwa7": {}}, "backfillTicketID": "q9WcWspT", "clientVersion": "eH97oB8g", "configurationName": "IWE596A5", "deployment": "I1diX0mU", "inactiveTimeout": 7, "inviteTimeout": 81, "joinability": "DIaKXytx", "matchPool": "2SiYdHnb", "maxPlayers": 98, "minPlayers": 70, "requestedRegions": ["q3Vbm5uT", "8nndg2lG", "UJI11Acv"], "serverName": "j3YPGmxX", "teams": [{"UserIDs": ["EN7t3Wia", "AvhCODqC", "Kr2zkT8u"]}, {"UserIDs": ["bQQnYK9H", "L7dhUq8s", "gTuhjBd1"]}, {"UserIDs": ["xmNiZqJX", "knnkS1HU", "RSn7VS6v"]}], "ticketIDs": ["jLcn4jyf", "hRu2atfB", "xuH9hW1r"], "type": "KMWpAchN"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateGameSession' test.out

#- 13 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"QWslI9l9": {}, "97D2IDK6": {}, "f6NGFtel": {}}' \
    > test.out 2>&1
eval_tap $? 13 'PublicQueryGameSessions' test.out

#- 14 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'Z8dOIiCz' \
    > test.out 2>&1
eval_tap $? 14 'GetGameSessionByPodName' test.out

#- 15 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Jt90xqNN' \
    > test.out 2>&1
eval_tap $? 15 'GetGameSession' test.out

#- 16 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IoJ9ShGn' \
    --body '{"attributes": {"dBTcsr5u": {}, "UTjSWikW": {}, "YQW15qzc": {}}, "backfillTicketID": "D81SKMvI", "clientVersion": "srA6gq4c", "deployment": "baPg4NjS", "inactiveTimeout": 3, "inviteTimeout": 84, "joinability": "cOrNUz5z", "matchPool": "gTJizXC8", "maxPlayers": 99, "minPlayers": 72, "requestedRegions": ["2jdWomSW", "dx845ZR8", "QCaYgrE8"], "teams": [{"UserIDs": ["B0yS2eZX", "Abwxzsob", "rhFf54cd"]}, {"UserIDs": ["xuYCuK8y", "b0fpYwz8", "JVTrJWq8"]}, {"UserIDs": ["weJiffiI", "dho1BTuw", "nTk6Cnka"]}], "ticketIDs": ["j9KIh4mP", "hyNWX2pG", "GDwGtfBN"], "type": "i9kpVNqj", "version": 75}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGameSession' test.out

#- 17 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'o1X0C8Ts' \
    > test.out 2>&1
eval_tap $? 17 'DeleteGameSession' test.out

#- 18 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XNm7Epy5' \
    --body '{"attributes": {"tFUnwDy2": {}, "VVsl8rEt": {}, "UwyqVppu": {}}, "backfillTicketID": "7vSnrItB", "clientVersion": "0NUKfgkO", "deployment": "8rXwphYK", "inactiveTimeout": 56, "inviteTimeout": 19, "joinability": "T7IiOR05", "matchPool": "mO0VWMYJ", "maxPlayers": 17, "minPlayers": 69, "requestedRegions": ["VTfpRz98", "5bDJp1uX", "GoCkQcwi"], "teams": [{"UserIDs": ["yw3ue34Y", "uwhNBE2L", "Tbw25UhZ"]}, {"UserIDs": ["6aRZrrei", "c5oPhcA3", "ta5TI3fu"]}, {"UserIDs": ["iDseECda", "A1BbITI5", "MxOmiPtt"]}], "ticketIDs": ["0n0CkDrK", "r8LwzliH", "yiISSid0"], "type": "bSf3ruUP", "version": 11}' \
    > test.out 2>&1
eval_tap $? 18 'PatchUpdateGameSession' test.out

#- 19 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NrFOnmk8' \
    --body '{"userID": "QK3cDrsK"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicGameSessionInvite' test.out

#- 20 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'n0bUq9jE' \
    > test.out 2>&1
eval_tap $? 20 'JoinGameSession' test.out

#- 21 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'F8Pzv8Qu' \
    > test.out 2>&1
eval_tap $? 21 'LeaveGameSession' test.out

#- 22 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kdlw9hTg' \
    > test.out 2>&1
eval_tap $? 22 'PublicGameSessionReject' test.out

#- 23 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "6rSxWwL3"}' \
    > test.out 2>&1
eval_tap $? 23 'PublicPartyJoinCode' test.out

#- 24 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '8rpre5WJ' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetParty' test.out

#- 25 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'AYjcW32t' \
    --body '{"attributes": {"7sQEnx3E": {}, "KGjZjxM5": {}, "cQkwuK9r": {}}, "inactiveTimeout": 65, "inviteTimeout": 43, "joinability": "caOI1HCL", "maxPlayers": 58, "minPlayers": 57, "type": "P5IkjvvI", "version": 35}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateParty' test.out

#- 26 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '7xPxuNU3' \
    --body '{"attributes": {"cFaL3XlL": {}, "nFVlPa2b": {}, "K8P0tfsT": {}}, "inactiveTimeout": 63, "inviteTimeout": 86, "joinability": "Obuu76Ez", "maxPlayers": 63, "minPlayers": 74, "type": "2RYORuwD", "version": 96}' \
    > test.out 2>&1
eval_tap $? 26 'PublicPatchUpdateParty' test.out

#- 27 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bQ4eOQb2' \
    > test.out 2>&1
eval_tap $? 27 'PublicGeneratePartyCode' test.out

#- 28 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'F1bEBynD' \
    > test.out 2>&1
eval_tap $? 28 'PublicRevokePartyCode' test.out

#- 29 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '5kelXv2a' \
    --body '{"userID": "LIbYpH3S"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicPartyInvite' test.out

#- 30 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '4h7RHLba' \
    --body '{"leaderID": "BZ1dSBwb"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPromotePartyLeader' test.out

#- 31 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'b6ESE5Xc' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoin' test.out

#- 32 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zK6qdMhI' \
    > test.out 2>&1
eval_tap $? 32 'PublicPartyLeave' test.out

#- 33 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '4bvCfT6w' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyReject' test.out

#- 34 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '9Oy6eTTp' \
    --userId 'fc6EnhEO' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyKick' test.out

#- 35 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"OdVXDXsd": {}, "MTjebqot": {}, "nk9XwEeK": {}}, "configurationName": "1V6DgHAS", "inactiveTimeout": 20, "inviteTimeout": 80, "joinability": "03R0SPES", "maxPlayers": 31, "members": [{"ID": "7plkCUsI", "PlatformID": "ZptY13t9", "PlatformUserID": "4OA0LON3"}, {"ID": "Vd1h9Xwc", "PlatformID": "UDeVjLA6", "PlatformUserID": "lQ6e9CK6"}, {"ID": "dgTWCV1g", "PlatformID": "jRyZbPPv", "PlatformUserID": "6us9ziON"}], "minPlayers": 65, "type": "kSPFwShF"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicCreateParty' test.out

#- 36 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'jGOxwFTa' \
    --orderBy 'ByuPOw6g' \
    --status 'GjTZTEnt' \
    > test.out 2>&1
eval_tap $? 36 'PublicQueryMyGameSessions' test.out

#- 37 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'y9PCAznx' \
    --orderBy 'OXyFo4rn' \
    --status 'dYtUTcJj' \
    > test.out 2>&1
eval_tap $? 37 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE