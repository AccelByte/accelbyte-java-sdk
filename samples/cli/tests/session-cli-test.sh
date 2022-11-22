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
    --body '{"clientVersion": "79GokzLH", "deployment": "LOmPYeRk", "inactiveTimeout": 43, "inviteTimeout": 62, "joinability": "SThYGEb4", "maxPlayers": 62, "minPlayers": 92, "name": "8mIfFIeB", "requestedRegions": ["bbsYG2s1", "nlCsJQKA", "Rz0v8PIP"], "type": "BuPdCb06"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'K0zvozlV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'TWqSVlq8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "IvX18hkG", "deployment": "GbpcVIhZ", "inactiveTimeout": 67, "inviteTimeout": 49, "joinability": "xWiWMkpb", "maxPlayers": 38, "minPlayers": 92, "name": "zbUu6EaU", "requestedRegions": ["6pJJqFMu", "YcYnXXBP", "GS4FvHmQ"], "type": "orHGs2lz"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name '6f8PqMf9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '9sRAG0h3' \
    --dsPodName 'ayoF7haE' \
    --fromTime '0vebwGeN' \
    --gameMode 'Uq0bbmui' \
    --joinability 'Dzy5DfIA' \
    --limit '44' \
    --matchPool 'xb423U0P' \
    --memberID 'PL01eMFe' \
    --offset '34' \
    --order '8ffLPLL0' \
    --orderBy 'ysWU0ROY' \
    --sessionID 'atKbJ93C' \
    --status '5k6EnvOu' \
    --toTime 'a21McPwa' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '9cZycHiX' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IPJHKcTy' \
    --statusType 'rHiy6rVJ' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'SA5i8zLJ' \
    --key 'fkOWet8r' \
    --leaderID '8tRP9365' \
    --limit '89' \
    --memberID '5Cg2fThU' \
    --memberStatus 'SFkePPCA' \
    --offset '21' \
    --order 'WimKxvnz' \
    --orderBy 'TxtN7h5g' \
    --value 'GXmMEIgC' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"MSXD019B": {}, "MLo3Earn": {}, "LpNMBpbW": {}}, "backfillTicketID": "g8wWiNDe", "clientVersion": "5aaQrCL0", "configurationName": "EoYgYIgH", "deployment": "0rKBLqjx", "inactiveTimeout": 1, "inviteTimeout": 33, "joinability": "OaryfbZ9", "matchPool": "mJXMWWWq", "maxPlayers": 18, "minPlayers": 53, "requestedRegions": ["IuejeBxy", "cFLBGt45", "DjLJdSvy"], "serverName": "8gAmg0NI", "teams": [{"UserIDs": ["6AeEhAmy", "qU2vgSxr", "f50zMPRN"]}, {"UserIDs": ["KDNaJkL7", "Fy8SCTrS", "XgndlHA8"]}, {"UserIDs": ["TW2uCaOb", "ooSAkuMY", "prZ8micR"]}], "ticketIDs": ["7WSgQLSR", "CpwqDw8s", "3pzr9xLi"], "type": "cOrQall0"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateGameSession' test.out

#- 13 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"vzXBkZxi": {}, "AgFZfjgm": {}, "qU8e9YPg": {}}' \
    > test.out 2>&1
eval_tap $? 13 'PublicQueryGameSessions' test.out

#- 14 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'Dzmm0LPe' \
    > test.out 2>&1
eval_tap $? 14 'GetGameSessionByPodName' test.out

#- 15 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ccKJFiVj' \
    > test.out 2>&1
eval_tap $? 15 'GetGameSession' test.out

#- 16 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z6vBJefg' \
    --body '{"attributes": {"1D0OmbpB": {}, "rNJbdBL6": {}, "EADNO9gm": {}}, "backfillTicketID": "clm4SsKg", "clientVersion": "eXVb1vX1", "deployment": "8PPxLw2K", "inactiveTimeout": 68, "inviteTimeout": 49, "joinability": "s7XakJg6", "matchPool": "yfbHdarm", "maxPlayers": 22, "minPlayers": 11, "requestedRegions": ["jbEcGnjc", "lEuNDTun", "bemQ4nXV"], "teams": [{"UserIDs": ["tC7Y9wd0", "7qGYzyar", "Ca8WqnUb"]}, {"UserIDs": ["ivu6J03c", "I8fqAFkF", "ZbZxjZsw"]}, {"UserIDs": ["j7z3CTNi", "n2HxHCYo", "8eXaOiT5"]}], "ticketIDs": ["ozi8ZvP6", "KAEPgIns", "g2bj1xfp"], "type": "NhT9qyqE", "version": 48}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGameSession' test.out

#- 17 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aB22nFhX' \
    > test.out 2>&1
eval_tap $? 17 'DeleteGameSession' test.out

#- 18 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ceCefmW5' \
    --body '{"attributes": {"ep8Db568": {}, "rffDAXWx": {}, "7IZ7J5Mi": {}}, "backfillTicketID": "dEWNdkr0", "clientVersion": "bzl47Y74", "deployment": "KkZXYV4T", "inactiveTimeout": 100, "inviteTimeout": 6, "joinability": "gYjml6VL", "matchPool": "52gbUeQB", "maxPlayers": 27, "minPlayers": 87, "requestedRegions": ["AJUH7Ypt", "9HFEjBDl", "EO8jH0Ff"], "teams": [{"UserIDs": ["BPW4dDnO", "V2hVtGFn", "damvnuTi"]}, {"UserIDs": ["SCUkpXr8", "FvLA7oOf", "zIi4RuVH"]}, {"UserIDs": ["REsRztki", "ezrk3Mat", "ZADTTTIT"]}], "ticketIDs": ["d8RZGAI9", "rm1NuGbE", "NLctCO4l"], "type": "rbzvyPuw", "version": 91}' \
    > test.out 2>&1
eval_tap $? 18 'PatchUpdateGameSession' test.out

#- 19 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XL8K1ygP' \
    --body '{"userID": "YujT7Aey"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicGameSessionInvite' test.out

#- 20 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0hD3lcby' \
    > test.out 2>&1
eval_tap $? 20 'JoinGameSession' test.out

#- 21 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1vbpbzrl' \
    > test.out 2>&1
eval_tap $? 21 'LeaveGameSession' test.out

#- 22 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1sBGsPfq' \
    > test.out 2>&1
eval_tap $? 22 'PublicGameSessionReject' test.out

#- 23 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "EeYvyDIf"}' \
    > test.out 2>&1
eval_tap $? 23 'PublicPartyJoinCode' test.out

#- 24 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zDj6Zyza' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetParty' test.out

#- 25 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GdnkuANa' \
    --body '{"attributes": {"k7aMRDZX": {}, "ChIOx8Zb": {}, "CYyYtwOY": {}}, "inactiveTimeout": 79, "inviteTimeout": 17, "joinability": "tiyjGa71", "maxPlayers": 26, "minPlayers": 18, "type": "F0QX8v7u", "version": 85}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateParty' test.out

#- 26 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'TrnExIGa' \
    --body '{"attributes": {"DvWW2YzV": {}, "KbLUhwv2": {}, "HG19x4Ey": {}}, "inactiveTimeout": 100, "inviteTimeout": 53, "joinability": "wICmN21I", "maxPlayers": 66, "minPlayers": 40, "type": "tPCcWjQh", "version": 75}' \
    > test.out 2>&1
eval_tap $? 26 'PublicPatchUpdateParty' test.out

#- 27 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wEMYkcUB' \
    > test.out 2>&1
eval_tap $? 27 'PublicGeneratePartyCode' test.out

#- 28 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'y7jhEHVN' \
    > test.out 2>&1
eval_tap $? 28 'PublicRevokePartyCode' test.out

#- 29 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FjBUBRtL' \
    --body '{"userID": "K3tCZQ90"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicPartyInvite' test.out

#- 30 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SWHLV05L' \
    --body '{"leaderID": "DtcnXsCm"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPromotePartyLeader' test.out

#- 31 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SZFN0TBy' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoin' test.out

#- 32 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KcXUSVvG' \
    > test.out 2>&1
eval_tap $? 32 'PublicPartyLeave' test.out

#- 33 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xwJSociJ' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyReject' test.out

#- 34 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LQsNCWH7' \
    --userId 'w3T9hAbc' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyKick' test.out

#- 35 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"DtyEcpZ8": {}, "qAXnAz9T": {}, "dFNbhsBx": {}}, "configurationName": "aX7tVsJQ", "inactiveTimeout": 1, "inviteTimeout": 37, "joinability": "aLIPhUtq", "maxPlayers": 93, "members": [{"ID": "4qdeXu7f", "PlatformID": "i0XbWlPt", "PlatformUserID": "oOk0BY0x"}, {"ID": "2vOhRmux", "PlatformID": "tFvQ74UA", "PlatformUserID": "JuU6shZ2"}, {"ID": "SPrYqnN0", "PlatformID": "xajetBCS", "PlatformUserID": "LgD2ZHGP"}], "minPlayers": 96, "type": "VnvI4Caz"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicCreateParty' test.out

#- 36 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '1xghjgml' \
    --orderBy 'A3AIMrQj' \
    --status 'lOxYPf6R' \
    > test.out 2>&1
eval_tap $? 36 'PublicQueryMyGameSessions' test.out

#- 37 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'jvlywMCl' \
    --orderBy 'FlBXG3nf' \
    --status 'ZWxMHp6c' \
    > test.out 2>&1
eval_tap $? 37 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE