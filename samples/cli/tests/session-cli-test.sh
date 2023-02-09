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
echo "1..42"

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
    --body '{"clientVersion": "D2XqFw3l", "deployment": "kX709BLO", "inactiveTimeout": 14, "inviteTimeout": 65, "joinability": "uu6U18Jq", "maxPlayers": 61, "minPlayers": 90, "name": "Tk1bpYqp", "requestedRegions": ["Kvj9odI7", "isl7ZVN2", "dzB8XJBC"], "textChat": true, "type": "lrkXGsiJ"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'tjYgG6oM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'dHnx3Bbs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "YNxeeme3", "deployment": "LvKqYzOr", "inactiveTimeout": 35, "inviteTimeout": 65, "joinability": "NqkhRx5T", "maxPlayers": 53, "minPlayers": 71, "name": "wrzLdUH1", "requestedRegions": ["f8k3GkVG", "FkU7xioD", "R7uZGFAi"], "textChat": false, "type": "CzpFzblt"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'NM0k3uHO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'LGdUn8R4' \
    --dsPodName 'lcXDRHgd' \
    --fromTime 'J0WqRtd4' \
    --gameMode 'Gao9ygVd' \
    --isSoftDeleted 'X49vkvKU' \
    --joinability 'KZ5ZifaV' \
    --limit '38' \
    --matchPool 'ecj7ze6W' \
    --memberID 'iGeNCXdk' \
    --offset '98' \
    --order 'IoH0IkqT' \
    --orderBy 'SM7Ntz80' \
    --sessionID 'qfgnQ5hI' \
    --status 'm4BaIv21' \
    --statusV2 'FEa9EIIa' \
    --toTime 'ypqH4pH3' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'cIUSvhji' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7QWyWAQ2' \
    --statusType 'B0kkyoQV' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'DPiKqd9s' \
    --key 'D3nD63DF' \
    --leaderID 'IQnS7xsw' \
    --limit '42' \
    --memberID 'nNaa5F32' \
    --memberStatus 'Fs0WQxen' \
    --offset '46' \
    --order 'Yofyngye' \
    --orderBy 'wWaKCGeE' \
    --value 'WXFcwf3p' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'CfbMx06k' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryPlayerAttributes' test.out

#- 13 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'OAgz60yH' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerAttributes' test.out

#- 14 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"mQ9JSonO": {}, "NeGK5yQH": {}, "DRwiN30Z": {}}, "backfillTicketID": "0BzX5QbM", "clientVersion": "0fRmPAHh", "configurationName": "Dgzjek9h", "deployment": "xc8dV7bA", "inactiveTimeout": 51, "inviteTimeout": 10, "joinability": "Jt729SpB", "matchPool": "Q1lVaMsx", "maxPlayers": 13, "minPlayers": 74, "requestedRegions": ["ls8zTdNU", "9VE9nUIW", "IQTimtiX"], "serverName": "qMvTfQIy", "teams": [{"UserIDs": ["v1ZLbAGp", "XStUHM5g", "Mo6pLgQ0"], "parties": [{"partyID": "lPOnzF5f", "userIDs": ["6WhJ3xRi", "93qgFpfK", "2mB8ykB3"]}, {"partyID": "TR7QgEJG", "userIDs": ["8Whf8viB", "VEWmgCQK", "aDGV0h4w"]}, {"partyID": "vE6GbzlL", "userIDs": ["Rs4fERti", "3KP3yYK6", "74NMA434"]}]}, {"UserIDs": ["9LZ0JcON", "KlIcVrPU", "qoxQVt1j"], "parties": [{"partyID": "KEoDlmSo", "userIDs": ["CtYEfxjs", "YxE4frtf", "qQqt3BgA"]}, {"partyID": "KTmbZhdY", "userIDs": ["uW3VMgV9", "ZgDZAYPD", "L79Tg8Za"]}, {"partyID": "pgGSwEkR", "userIDs": ["zc7Hr99y", "H3HgOe4l", "wcRvWnbK"]}]}, {"UserIDs": ["P3e2FWfj", "x7rQ50dv", "zGQVPkxE"], "parties": [{"partyID": "eBlKMxA1", "userIDs": ["rpFMnwl2", "M1Mw4at5", "sPN3DQTx"]}, {"partyID": "ayanoRmI", "userIDs": ["tFex4xIk", "NytR8Xa5", "axF4GYNh"]}, {"partyID": "iQDniWyN", "userIDs": ["47KJUujB", "HEjJawg4", "BL7RVHxz"]}]}], "textChat": false, "ticketIDs": ["Xe7n02Z8", "pclg7FYW", "wNfoYTvf"], "type": "FOWWeZMs"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateGameSession' test.out

#- 15 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"L9AVMOeE": {}, "aWL0YsSP": {}, "dWhNvr6I": {}}' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessions' test.out

#- 16 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'v5WNTtOR' \
    > test.out 2>&1
eval_tap $? 16 'GetGameSessionByPodName' test.out

#- 17 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gy8QD2Sj' \
    > test.out 2>&1
eval_tap $? 17 'GetGameSession' test.out

#- 18 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'adcaQHyt' \
    --body '{"attributes": {"83Wse4ye": {}, "jQUor0Vs": {}, "gQJNGKT3": {}}, "backfillTicketID": "lKEleDxV", "clientVersion": "WtQUR6R4", "deployment": "M1VcstuB", "inactiveTimeout": 41, "inviteTimeout": 15, "joinability": "2P3kUBkG", "matchPool": "7SCF2FFK", "maxPlayers": 84, "minPlayers": 4, "requestedRegions": ["twn8kr49", "cONNcclv", "cQ6FpMPt"], "teams": [{"UserIDs": ["oTOvWs7I", "QPNhSSCf", "ou8ybB3Q"], "parties": [{"partyID": "gdOVWHVT", "userIDs": ["kR8ZY5O9", "DZVkxwAo", "zawMmbYw"]}, {"partyID": "OMnbagaP", "userIDs": ["oFlFVFq1", "zAdo316d", "QWi6YKDN"]}, {"partyID": "nDCnuMBY", "userIDs": ["OlteHsOt", "zX50Lyc7", "Zw4svOdk"]}]}, {"UserIDs": ["aJpPg6lk", "lcTWIzbN", "NRzvMtU7"], "parties": [{"partyID": "kK3ewfpF", "userIDs": ["mtra8aYx", "9fK3sow3", "2cJxFLmX"]}, {"partyID": "j8tV1oWP", "userIDs": ["hk4wUZnj", "0mW9Lx7e", "NN9t3iZC"]}, {"partyID": "zB5ZPx08", "userIDs": ["KJraxmTf", "nUwrWBHU", "CimZR3cL"]}]}, {"UserIDs": ["qxBpZA4C", "KLV2BfdF", "znn8jbnf"], "parties": [{"partyID": "AK0bbYXF", "userIDs": ["G3Kr9xXg", "XACDt9ad", "Xs1Nczfl"]}, {"partyID": "ZA9aSh4d", "userIDs": ["kjDLJgsu", "H0yNyNGy", "dqHPI9ao"]}, {"partyID": "UL2jxMZs", "userIDs": ["oIQwMKnD", "7u2XcOMT", "YwL21ATx"]}]}], "ticketIDs": ["O1bqKUff", "haTslCYL", "3I9b9toJ"], "type": "dl6En53N", "version": 31}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateGameSession' test.out

#- 19 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jJ8dxjek' \
    > test.out 2>&1
eval_tap $? 19 'DeleteGameSession' test.out

#- 20 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OTCb9d5W' \
    --body '{"attributes": {"i33feWPY": {}, "wZk7MyE0": {}, "0YjSku8e": {}}, "backfillTicketID": "YmB0rLYc", "clientVersion": "sh9AOmgN", "deployment": "s2j7Zvai", "inactiveTimeout": 37, "inviteTimeout": 2, "joinability": "uqAqaO8E", "matchPool": "lxhhXW1R", "maxPlayers": 47, "minPlayers": 78, "requestedRegions": ["3G5N0VTr", "5Ut2JNZt", "WkSXneBr"], "teams": [{"UserIDs": ["ToG8Vlzz", "XcoX2fMK", "OhDBBh5b"], "parties": [{"partyID": "IrZCALjv", "userIDs": ["VPP4QaUN", "5pmTHHT1", "Wpwl0xAd"]}, {"partyID": "wSRcZobv", "userIDs": ["EavCHauU", "JTYKagWA", "0MklVSO6"]}, {"partyID": "dJRtaitJ", "userIDs": ["8zXeGrn1", "oV7KIVVD", "VreBHMyw"]}]}, {"UserIDs": ["gHemHUjL", "suf6TynA", "T1MycxBh"], "parties": [{"partyID": "8xrJt0oB", "userIDs": ["FKhFOPYh", "kl8k3db7", "X6SYze8Q"]}, {"partyID": "E4QJSL5F", "userIDs": ["cYFpWtlr", "q1HGGhfh", "aDx9nMm0"]}, {"partyID": "GWhEZBW1", "userIDs": ["A3EqaVTM", "LR8VBX3O", "m3Ue0wyR"]}]}, {"UserIDs": ["RExMPngu", "COendsDN", "LhJldsUy"], "parties": [{"partyID": "Nt0PjrG6", "userIDs": ["EjWNtMrT", "2Q4DUjwG", "iScBcGnz"]}, {"partyID": "9L6GXr4L", "userIDs": ["Fsx9iZE2", "RvsUdrgJ", "CHgrykhP"]}, {"partyID": "ekzlaeCR", "userIDs": ["PYHPNtEU", "xwKdFvJk", "T5GJrt0v"]}]}], "ticketIDs": ["EIef6ab5", "szupCkXm", "9z5mycWj"], "type": "DaaoXS2b", "version": 5}' \
    > test.out 2>&1
eval_tap $? 20 'PatchUpdateGameSession' test.out

#- 21 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ZeFFTPhO' \
    --body '{"userID": "rMONHBfV"}' \
    > test.out 2>&1
eval_tap $? 21 'PublicGameSessionInvite' test.out

#- 22 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lofMAaKO' \
    > test.out 2>&1
eval_tap $? 22 'JoinGameSession' test.out

#- 23 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Z9vt3sHn' \
    > test.out 2>&1
eval_tap $? 23 'LeaveGameSession' test.out

#- 24 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JhqRrCpf' \
    > test.out 2>&1
eval_tap $? 24 'PublicGameSessionReject' test.out

#- 25 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ls8oXaeN"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicPartyJoinCode' test.out

#- 26 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Bz5qKXcF' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetParty' test.out

#- 27 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Bm55V6Og' \
    --body '{"attributes": {"dVLkUXPE": {}, "LKiMNHS5": {}, "gYSymlOO": {}}, "inactiveTimeout": 87, "inviteTimeout": 33, "joinability": "irnbiVVd", "maxPlayers": 64, "minPlayers": 69, "type": "Y7do3xJ7", "version": 16}' \
    > test.out 2>&1
eval_tap $? 27 'PublicUpdateParty' test.out

#- 28 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ywFY1h7s' \
    --body '{"attributes": {"B2CZXy9N": {}, "0H0D1Bzg": {}, "rWdZVGxV": {}}, "inactiveTimeout": 51, "inviteTimeout": 71, "joinability": "wFCCXxax", "maxPlayers": 65, "minPlayers": 52, "type": "9yIwI7KL", "version": 99}' \
    > test.out 2>&1
eval_tap $? 28 'PublicPatchUpdateParty' test.out

#- 29 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ro0h6OVg' \
    > test.out 2>&1
eval_tap $? 29 'PublicGeneratePartyCode' test.out

#- 30 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OlO3Qtr0' \
    > test.out 2>&1
eval_tap $? 30 'PublicRevokePartyCode' test.out

#- 31 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SL0aZxpr' \
    --body '{"userID": "XuIuGwJg"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyInvite' test.out

#- 32 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CfqZek56' \
    --body '{"leaderID": "M6bRK9o9"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicPromotePartyLeader' test.out

#- 33 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jXqhksUj' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyJoin' test.out

#- 34 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'K8iXWwkm' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyLeave' test.out

#- 35 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'B4kwZL2g' \
    > test.out 2>&1
eval_tap $? 35 'PublicPartyReject' test.out

#- 36 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XSy2GG7b' \
    --userId 'Cb4vCTP9' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyKick' test.out

#- 37 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"tl5u1bEe": {}, "75A7nVa5": {}, "zSWJr4yD": {}}, "configurationName": "h7QzOKdy", "inactiveTimeout": 72, "inviteTimeout": 70, "joinability": "y5bRD0HX", "maxPlayers": 50, "members": [{"ID": "81PsnHzW", "PlatformID": "HTwZ0a5H", "PlatformUserID": "HnLoebAm"}, {"ID": "GG8opzkk", "PlatformID": "8DvfnnbU", "PlatformUserID": "G1I2YvrA"}, {"ID": "r4u7LDGa", "PlatformID": "RO0xAIE9", "PlatformUserID": "ZZtvtBYL"}], "minPlayers": 34, "textChat": false, "type": "nGhszEOV"}' \
    > test.out 2>&1
eval_tap $? 37 'PublicCreateParty' test.out

#- 38 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'PublicGetPlayerAttributes' test.out

#- 39 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "data": {"Ay15d6Ye": {}, "GUVZHpTp": {}, "7LRyF28U": {}}, "platforms": [{"name": "UAoudqC2", "userID": "IKDsQTel"}, {"name": "kU3oKiiB", "userID": "EilAZeOv"}, {"name": "Ea7fYz9k", "userID": "OnHEl96e"}]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicStorePlayerAttributes' test.out

#- 40 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'PublicDeletePlayerAttributes' test.out

#- 41 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '1rEjryxY' \
    --orderBy 'HDO783g4' \
    --status 'jMnoLW2J' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryMyGameSessions' test.out

#- 42 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'f75jg24n' \
    --orderBy 'm0IOzedz' \
    --status 'D8NtXj8y' \
    > test.out 2>&1
eval_tap $? 42 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE