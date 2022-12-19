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
    --body '{"clientVersion": "8hEstLg3", "deployment": "X69obOPe", "inactiveTimeout": 35, "inviteTimeout": 19, "joinability": "9lZeH1T3", "maxPlayers": 61, "minPlayers": 21, "name": "b8bcJ6TQ", "requestedRegions": ["gkbWuSvT", "lm2YsGh8", "gBBXJgaa"], "textChat": true, "type": "OcMglC4a"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'P4m2vspx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'GKVljHly' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "zkj1cFNk", "deployment": "8OTPaoun", "inactiveTimeout": 81, "inviteTimeout": 15, "joinability": "bjcYmXxa", "maxPlayers": 16, "minPlayers": 18, "name": "nusJDgkM", "requestedRegions": ["1HoTGvJu", "LpURDnMj", "gbSQj9Fb"], "textChat": false, "type": "HhDUVyx8"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'XtcHiqQA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '1QSeaDha' \
    --dsPodName 'REuzuUAo' \
    --fromTime 'E3C88cL1' \
    --gameMode 'h4oXRxjh' \
    --joinability 'cYgKLavC' \
    --limit '12' \
    --matchPool 'z6d7N1Il' \
    --memberID 'friR8RMU' \
    --offset '57' \
    --order '3vgm4CCE' \
    --orderBy '2co5vgsR' \
    --sessionID 'xVeAlwYw' \
    --status 'BEaTRwg1' \
    --toTime '4XRW3aYc' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'xMb2Bmds' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lwSqjuBO' \
    --statusType 'ZDsU9uYJ' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability '06j4d8UY' \
    --key 'AWGYQnpM' \
    --leaderID 'O3niIaRH' \
    --limit '36' \
    --memberID 'dZvV6Z3y' \
    --memberStatus 'RO47QGaV' \
    --offset '12' \
    --order 'kpV5ShLu' \
    --orderBy 'A8zmSF7p' \
    --value '7mm4EcMn' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"93Xp9VkV": {}, "wSMlJYx0": {}, "asC79ILW": {}}, "backfillTicketID": "xG40fGCu", "clientVersion": "69gUjnSn", "configurationName": "PMIOF0a9", "deployment": "xCgIGtH7", "inactiveTimeout": 84, "inviteTimeout": 92, "joinability": "lt8vmmWx", "matchPool": "sJG5JX7W", "maxPlayers": 1, "minPlayers": 35, "requestedRegions": ["Zmkt7FVE", "sJf82SVs", "aI33yYXo"], "serverName": "GDVC8zMQ", "teams": [{"UserIDs": ["2cLLezO6", "fJ8T6pm3", "iud1CLmt"]}, {"UserIDs": ["iUDYNUMM", "PT4Rw5NX", "bk86qMph"]}, {"UserIDs": ["LQf3oAPr", "X59MZNBN", "5uihld3j"]}], "textChat": false, "ticketIDs": ["QZa68Xui", "Mw8rK8Ni", "CNzcft9u"], "type": "Ijp53DMf"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateGameSession' test.out

#- 13 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ltqEWINo": {}, "JcZ6vPVh": {}, "QvoKfy0Z": {}}' \
    > test.out 2>&1
eval_tap $? 13 'PublicQueryGameSessions' test.out

#- 14 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'nSS2vYaj' \
    > test.out 2>&1
eval_tap $? 14 'GetGameSessionByPodName' test.out

#- 15 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rxbBTnIa' \
    > test.out 2>&1
eval_tap $? 15 'GetGameSession' test.out

#- 16 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fhj07DWI' \
    --body '{"attributes": {"KjAOxBZ3": {}, "rsb3cxmA": {}, "CAF6Uix4": {}}, "backfillTicketID": "Mbt2weAE", "clientVersion": "E8xLQJ3c", "deployment": "nVNcvyji", "inactiveTimeout": 83, "inviteTimeout": 10, "joinability": "SHB1A4BA", "matchPool": "qTuVi5AO", "maxPlayers": 70, "minPlayers": 41, "requestedRegions": ["PIjDEL3A", "IJsQVsNK", "ZI7gNf4H"], "teams": [{"UserIDs": ["q8nZkfuS", "JjsmuyNk", "XCmyK3D2"]}, {"UserIDs": ["Mwmu3M1W", "SsFe90xx", "8Q4uPXYv"]}, {"UserIDs": ["Z3BH3RFy", "wN3WjVlB", "afm8WoCl"]}], "ticketIDs": ["TVRQlFfW", "7rl50t6x", "O56nK8Om"], "type": "71nVzf0e", "version": 0}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGameSession' test.out

#- 17 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CaenXyUt' \
    > test.out 2>&1
eval_tap $? 17 'DeleteGameSession' test.out

#- 18 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pxhPV1UK' \
    --body '{"attributes": {"72mMOyAP": {}, "i3jvbJpS": {}, "C75c4GpH": {}}, "backfillTicketID": "ZyeV1uo2", "clientVersion": "sXZD19dF", "deployment": "CtOlfbQE", "inactiveTimeout": 56, "inviteTimeout": 76, "joinability": "AnqwnnBs", "matchPool": "LyjdluUO", "maxPlayers": 63, "minPlayers": 60, "requestedRegions": ["JamPch7B", "hSdYowGd", "ufTN8UD6"], "teams": [{"UserIDs": ["cT4UVE2t", "GtfOlMBs", "2mxQIzMA"]}, {"UserIDs": ["sAJgxAbm", "bWBsdmZu", "PDA97hn0"]}, {"UserIDs": ["fFNxsGAa", "50AXl2S6", "j80arBbk"]}], "ticketIDs": ["WfAlu4bI", "F4FLBj3C", "DT24No02"], "type": "LeOLsQqs", "version": 5}' \
    > test.out 2>&1
eval_tap $? 18 'PatchUpdateGameSession' test.out

#- 19 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2zrpCgyq' \
    --body '{"userID": "abgDwoFq"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicGameSessionInvite' test.out

#- 20 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'e9kFO7HB' \
    > test.out 2>&1
eval_tap $? 20 'JoinGameSession' test.out

#- 21 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rgexMvHA' \
    > test.out 2>&1
eval_tap $? 21 'LeaveGameSession' test.out

#- 22 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FsmoyKy6' \
    > test.out 2>&1
eval_tap $? 22 'PublicGameSessionReject' test.out

#- 23 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0AzF2Pgu"}' \
    > test.out 2>&1
eval_tap $? 23 'PublicPartyJoinCode' test.out

#- 24 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Q95ATLBV' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetParty' test.out

#- 25 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'TO3gXn9l' \
    --body '{"attributes": {"EqgTsVG0": {}, "8miK29hR": {}, "0vTORrkF": {}}, "inactiveTimeout": 18, "inviteTimeout": 4, "joinability": "7KU1fVg1", "maxPlayers": 12, "minPlayers": 14, "type": "ngEhZTIY", "version": 99}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateParty' test.out

#- 26 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uS2InbYR' \
    --body '{"attributes": {"Qwf51z96": {}, "p9yUXTdX": {}, "bj40V72C": {}}, "inactiveTimeout": 71, "inviteTimeout": 89, "joinability": "xL8vVQEz", "maxPlayers": 67, "minPlayers": 95, "type": "tFE3eOXK", "version": 24}' \
    > test.out 2>&1
eval_tap $? 26 'PublicPatchUpdateParty' test.out

#- 27 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sKkCR6ay' \
    > test.out 2>&1
eval_tap $? 27 'PublicGeneratePartyCode' test.out

#- 28 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lF3UjeyD' \
    > test.out 2>&1
eval_tap $? 28 'PublicRevokePartyCode' test.out

#- 29 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '92L64r6f' \
    --body '{"userID": "J4c9KTsr"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicPartyInvite' test.out

#- 30 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FrBDbeHf' \
    --body '{"leaderID": "IfXDKkYm"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPromotePartyLeader' test.out

#- 31 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '7Sfjwc7Q' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoin' test.out

#- 32 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '7x02Ynxt' \
    > test.out 2>&1
eval_tap $? 32 'PublicPartyLeave' test.out

#- 33 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tQzechIc' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyReject' test.out

#- 34 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vNJsEtwY' \
    --userId 'dmSLgWz1' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyKick' test.out

#- 35 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"gra9FH9E": {}, "JHr9rz7b": {}, "jxBe8Wyz": {}}, "configurationName": "In9rX6Gq", "inactiveTimeout": 60, "inviteTimeout": 39, "joinability": "QSnHr1NE", "maxPlayers": 7, "members": [{"ID": "lN7AJJhM", "PlatformID": "kpLXqI9E", "PlatformUserID": "kVRXGJHZ"}, {"ID": "ZSZRt9n6", "PlatformID": "mNvzbFbk", "PlatformUserID": "TOm7DDE1"}, {"ID": "8KvfF6Ot", "PlatformID": "3HdJvrSu", "PlatformUserID": "XjJoxNzG"}], "minPlayers": 1, "textChat": false, "type": "4wPvcj2S"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicCreateParty' test.out

#- 36 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'hjiGF9hQ' \
    --orderBy 'FPP6nL3n' \
    --status 'TBvhfYzh' \
    > test.out 2>&1
eval_tap $? 36 'PublicQueryMyGameSessions' test.out

#- 37 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'MnSADeCn' \
    --orderBy 'GityXr8S' \
    --status '28zeAZJ1' \
    > test.out 2>&1
eval_tap $? 37 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE