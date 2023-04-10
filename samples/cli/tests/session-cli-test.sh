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
echo "1..48"

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

#- 4 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 4 'AdminGetDSMCConfigurationDefault' test.out

#- 5 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "EAxcVpFr", "deployment": "ttufHIRd", "inactiveTimeout": 68, "inviteTimeout": 59, "joinability": "9UzVRiXb", "maxPlayers": 33, "minPlayers": 1, "name": "lAw7r6W2", "persistent": false, "requestedRegions": ["HpzSn3ZP", "Udc0qh4n", "8mzZ0m8S"], "textChat": true, "type": "cDs8bBZL"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateConfigurationTemplateV1' test.out

#- 6 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAllConfigurationTemplatesV1' test.out

#- 7 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'XLx8bbgo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetConfigurationTemplateV1' test.out

#- 8 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'rQeFbQ1g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "7qbPngUN", "deployment": "B1vRodwp", "inactiveTimeout": 52, "inviteTimeout": 65, "joinability": "S6DaDpv8", "maxPlayers": 81, "minPlayers": 41, "name": "7ZQVqGj6", "persistent": false, "requestedRegions": ["KJfh5pUk", "HODpoMF7", "8NY4YkHs"], "textChat": true, "type": "cnz1JSDg"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminUpdateConfigurationTemplateV1' test.out

#- 9 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'Y1TXp38z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminDeleteConfigurationTemplateV1' test.out

#- 10 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetDSMCConfiguration' test.out

#- 11 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminSyncDSMCConfiguration' test.out

#- 12 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'sCTCrbCb' \
    --dsPodName 'POyNQkT7' \
    --fromTime 'NvyE3cwy' \
    --gameMode 'ALczNIic' \
    --isPersistent 'Xm7agSrj' \
    --isSoftDeleted 'JW2OQNOs' \
    --joinability '1PXhT5Fv' \
    --limit '6' \
    --matchPool 'WP75TB0i' \
    --memberID '7pKxR8dl' \
    --offset '74' \
    --order 'zRVW4EZG' \
    --orderBy '9m0XcgGV' \
    --sessionID 'bMqSszE8' \
    --status 'GHavj7Ao' \
    --statusV2 'rKsxwkos' \
    --toTime 'AVerXpc1' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryGameSessions' test.out

#- 13 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["C8XfwHuK", "eb9l3rGN", "9A3sNm84"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteBulkGameSessions' test.out

#- 14 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'hddSpHt0' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'P7MIIR7C' \
    --statusType 'kyF6C7du' \
    > test.out 2>&1
eval_tap $? 14 'AdminUpdateGameSessionMember' test.out

#- 15 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'uyZ0GhDo' \
    --key 'gqrhBRd8' \
    --leaderID 'lDR6qVNP' \
    --limit '89' \
    --memberID 'e5dNRljv' \
    --memberStatus '7IPrDQQR' \
    --offset '13' \
    --order 'u9vx5KQ7' \
    --orderBy 'KYnIuMBv' \
    --value 'aO35llzQ' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryParties' test.out

#- 16 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'RaT5kPxU' \
    > test.out 2>&1
eval_tap $? 16 'AdminQueryPlayerAttributes' test.out

#- 17 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'fofvnnSu' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlayerAttributes' test.out

#- 18 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"B0y5WUlr": {}, "MdI4sNve": {}, "abntBSxT": {}}, "backfillTicketID": "eIv53HGC", "clientVersion": "iljvjKoy", "configurationName": "D6SCwGrn", "deployment": "cqmLtjQH", "inactiveTimeout": 54, "inviteTimeout": 25, "joinability": "f8TgoNm0", "matchPool": "3VLisV6z", "maxPlayers": 46, "minPlayers": 97, "requestedRegions": ["Puo3td6T", "C6I3lMjG", "SWN2laRl"], "serverName": "xfcjHfYa", "teams": [{"UserIDs": ["kUCTqGkE", "7wcWfDsl", "pJSqGAXQ"], "parties": [{"partyID": "0yYoNRKd", "userIDs": ["3IL5TAQ6", "iiPlSC2u", "E4o5Vwdo"]}, {"partyID": "3fePqIJA", "userIDs": ["8IHtrkmu", "0hpDDWVA", "la2l5BYN"]}, {"partyID": "tIuS5S5X", "userIDs": ["UdjsoqwG", "yzzWi9gw", "QYv7t1o7"]}]}, {"UserIDs": ["TTr1Dmrh", "Zv15T7qu", "IOvBMcaY"], "parties": [{"partyID": "mvCkGZ5d", "userIDs": ["AgqxpBFm", "aLoxozr6", "wfNPX2bO"]}, {"partyID": "ItRMvqtl", "userIDs": ["B2jJCSQT", "279ZZPYG", "u0rdlgdW"]}, {"partyID": "yOtXi3ch", "userIDs": ["oQrpOsDB", "U5SepjCh", "B3V0v52D"]}]}, {"UserIDs": ["lym6puQ2", "3xoJ8aeC", "naLpUKp4"], "parties": [{"partyID": "4YUDjasW", "userIDs": ["IPUvmEej", "tGeoyIPa", "8ZRrvjj7"]}, {"partyID": "il35MXbN", "userIDs": ["9oCMNqq9", "8SjTvhZN", "kSQ70D0H"]}, {"partyID": "6BXksUC9", "userIDs": ["b6i5lZC9", "xv32e8c5", "csSovoqs"]}]}], "textChat": false, "ticketIDs": ["Bdte9NDU", "PVJf6c2Z", "0QZxfgPu"], "type": "bTDIHrvq"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateGameSession' test.out

#- 19 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"AThuwjRH": {}, "pKKTlmVr": {}, "9XuoJbRF": {}}' \
    > test.out 2>&1
eval_tap $? 19 'PublicQueryGameSessions' test.out

#- 20 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'QSKVPHbn' \
    > test.out 2>&1
eval_tap $? 20 'GetGameSessionByPodName' test.out

#- 21 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4Xxtu7LQ' \
    > test.out 2>&1
eval_tap $? 21 'GetGameSession' test.out

#- 22 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RENjEEzt' \
    --body '{"attributes": {"x1WsYSiZ": {}, "qan0nSBJ": {}, "roav91GX": {}}, "backfillTicketID": "lvPG6bFY", "clientVersion": "ReVHQipc", "deployment": "Cx9Zw5D2", "inactiveTimeout": 76, "inviteTimeout": 80, "joinability": "7vIYhGGS", "matchPool": "yEW4ZJJ4", "maxPlayers": 81, "minPlayers": 7, "requestedRegions": ["e4mhgo5Q", "B65lSAiY", "nNjkfZrQ"], "teams": [{"UserIDs": ["vGgbLdLs", "FzHkBMr1", "yrOMlNFS"], "parties": [{"partyID": "rUEirnjX", "userIDs": ["9fDmIbeZ", "xzfTcyiu", "ATus9hsf"]}, {"partyID": "pFDcSDG8", "userIDs": ["aMVGLiBN", "rDjqoxcw", "gGLXpUL4"]}, {"partyID": "pp2ncYAH", "userIDs": ["dNzDmeIP", "6rOvDz9K", "Osb392k6"]}]}, {"UserIDs": ["YmJFfRBy", "jlBiuFM3", "FIoVk8T3"], "parties": [{"partyID": "GpAnkCmB", "userIDs": ["Uqg2SCnq", "ntX9y1aZ", "SWMiVi10"]}, {"partyID": "sG6vxkfU", "userIDs": ["cmqRRbce", "J5i0EeDx", "OgBnhhqE"]}, {"partyID": "lIaDml48", "userIDs": ["wdNFLTm5", "T50x9WT0", "GfH2rtOa"]}]}, {"UserIDs": ["4EXsXzOX", "QAk4mqrx", "zTtuLl4X"], "parties": [{"partyID": "lbGL8QOx", "userIDs": ["tjzm8y2w", "NhmwoYZy", "I4EFZKBc"]}, {"partyID": "YrCEAE7W", "userIDs": ["Isfmx40N", "LRc6m8he", "KnWhzfe2"]}, {"partyID": "NubeoKFe", "userIDs": ["IaFQCYoD", "PICpnduE", "EQlULdJz"]}]}], "ticketIDs": ["4mnRBkMN", "xvvKgAT8", "mJrYq6hR"], "type": "kloqxM3g", "version": 31}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateGameSession' test.out

#- 23 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qC2J9jyE' \
    > test.out 2>&1
eval_tap $? 23 'DeleteGameSession' test.out

#- 24 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'W6GLbc0N' \
    --body '{"attributes": {"aKDUL3sa": {}, "13lk1dQB": {}, "HO86IlBh": {}}, "backfillTicketID": "netU4RwT", "clientVersion": "qUXlTDBz", "deployment": "OuYsaZA2", "inactiveTimeout": 50, "inviteTimeout": 87, "joinability": "yd4mbqoO", "matchPool": "fADMMAXF", "maxPlayers": 1, "minPlayers": 9, "requestedRegions": ["Y9eKa699", "bRVhyaKw", "wrAP2aMl"], "teams": [{"UserIDs": ["u7WtjCto", "YetOO847", "g8OudOfj"], "parties": [{"partyID": "nCuHZ3c4", "userIDs": ["6IjGa23Y", "vYmmDg7V", "YPXIuvUY"]}, {"partyID": "TZBRujIU", "userIDs": ["E1Tq5jyA", "ZvkRCMNF", "Iurjh2im"]}, {"partyID": "db4rbkXj", "userIDs": ["0ZwsVC0g", "L97ZVJSP", "qJiwv1ql"]}]}, {"UserIDs": ["YB1RSKs6", "gQxC3Gb7", "S0o4zGYY"], "parties": [{"partyID": "7KQI1AeF", "userIDs": ["gPqaOkvo", "1aolB4lk", "KB4EYOkQ"]}, {"partyID": "1jMD3cym", "userIDs": ["8xIfkOVW", "2grREOLx", "0KOww3HI"]}, {"partyID": "CQLfl7MU", "userIDs": ["BG7qtPu6", "4yAtURKL", "Rkb738HG"]}]}, {"UserIDs": ["S6rDgMdI", "IlhS1fSi", "M9331m7T"], "parties": [{"partyID": "a1PsKc50", "userIDs": ["Kv6ecnEe", "vcAx2K2z", "kRenmPZn"]}, {"partyID": "GBt4P7Wn", "userIDs": ["bdSJtjX7", "ZshZyZl5", "x4bRXBHU"]}, {"partyID": "TrDzZSKs", "userIDs": ["cfOcYu3d", "pCROYqUi", "GKXVFCmp"]}]}], "ticketIDs": ["o6sPwVOE", "DSJsEK5Q", "pNhlI2iS"], "type": "5EpGhhvX", "version": 20}' \
    > test.out 2>&1
eval_tap $? 24 'PatchUpdateGameSession' test.out

#- 25 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ck0upMzU' \
    --body '{"backfillTicketID": "Ynb76tFk"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateGameSessionBackfillTicketID' test.out

#- 26 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EORV3bu1' \
    --body '{"userID": "bNCtX7W4"}' \
    > test.out 2>&1
eval_tap $? 26 'PublicGameSessionInvite' test.out

#- 27 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0V6Do5sY' \
    > test.out 2>&1
eval_tap $? 27 'JoinGameSession' test.out

#- 28 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'adCCFrHH' \
    > test.out 2>&1
eval_tap $? 28 'LeaveGameSession' test.out

#- 29 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'C3DpZxkr' \
    > test.out 2>&1
eval_tap $? 29 'PublicGameSessionReject' test.out

#- 30 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QDXuNFvi' \
    --body '{"additionalMembers": [{"partyID": "Marv8mnf", "userIDs": ["HK8CCmE2", "lPnsbD3S", "GEdlwuUc"]}, {"partyID": "cE536ugB", "userIDs": ["p3HBvepn", "DCjgyJlX", "e36mgWjL"]}, {"partyID": "fFmteue9", "userIDs": ["nzJ6fH24", "T805tVg8", "JqU0jZpj"]}], "proposedTeams": [{"UserIDs": ["vsugAOS7", "u8RiWyer", "CSa8SRgw"], "parties": [{"partyID": "sAj1ik1j", "userIDs": ["glaDXTvK", "CWwNTAhd", "2wrS0uPd"]}, {"partyID": "jhdinpng", "userIDs": ["5BLy8wbh", "MssAHjap", "IkY9Rf4w"]}, {"partyID": "P57dBZNR", "userIDs": ["88YbCtmK", "y8M9zVrj", "fGXZnqAQ"]}]}, {"UserIDs": ["UoY1GjlI", "Ik0iKoTT", "S1j02o7J"], "parties": [{"partyID": "jTXAQN0q", "userIDs": ["dskdQV0T", "qI8EFnmD", "bxIxi4YK"]}, {"partyID": "lONk2Q5Y", "userIDs": ["4Jvaizwi", "ilatuUjj", "t9lIMGql"]}, {"partyID": "5ElEa9EI", "userIDs": ["IlGcHB3C", "fR3ncDlw", "i3v3MFFJ"]}]}, {"UserIDs": ["1KesKoEL", "CpobBEG8", "X645xpdX"], "parties": [{"partyID": "pai0rYaT", "userIDs": ["5hOPjaf3", "H0tYighU", "0VUfcYHJ"]}, {"partyID": "bBfAKSiP", "userIDs": ["W3VgsZXi", "R1DJ7HVW", "qMkNSawQ"]}, {"partyID": "UWDFJvJB", "userIDs": ["Wic7UkBe", "IXuqDuAX", "I66bQ71w"]}]}], "version": 41}' \
    > test.out 2>&1
eval_tap $? 30 'AppendTeamGameSession' test.out

#- 31 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "deoV9Lx5"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoinCode' test.out

#- 32 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RDA1l2Xc' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetParty' test.out

#- 33 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rciYNEzv' \
    --body '{"attributes": {"SZIPkhSg": {}, "ORcz5S5B": {}, "vmgBLxh4": {}}, "inactiveTimeout": 18, "inviteTimeout": 81, "joinability": "jFnE3Tam", "maxPlayers": 79, "minPlayers": 33, "type": "Nzy1adnS", "version": 74}' \
    > test.out 2>&1
eval_tap $? 33 'PublicUpdateParty' test.out

#- 34 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QkmZXElW' \
    --body '{"attributes": {"9YfRSse6": {}, "AAz3S4cz": {}, "z0QKFlAV": {}}, "inactiveTimeout": 26, "inviteTimeout": 67, "joinability": "VLu4AOec", "maxPlayers": 67, "minPlayers": 52, "type": "73zdxTgO", "version": 11}' \
    > test.out 2>&1
eval_tap $? 34 'PublicPatchUpdateParty' test.out

#- 35 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '68J1nsv4' \
    > test.out 2>&1
eval_tap $? 35 'PublicGeneratePartyCode' test.out

#- 36 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'W2OJhtaf' \
    > test.out 2>&1
eval_tap $? 36 'PublicRevokePartyCode' test.out

#- 37 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xMSJlHeb' \
    --body '{"userID": "34sZKHcl"}' \
    > test.out 2>&1
eval_tap $? 37 'PublicPartyInvite' test.out

#- 38 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '5LLLOexL' \
    --body '{"leaderID": "4fZvWtND"}' \
    > test.out 2>&1
eval_tap $? 38 'PublicPromotePartyLeader' test.out

#- 39 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '2tcBFpX8' \
    > test.out 2>&1
eval_tap $? 39 'PublicPartyJoin' test.out

#- 40 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lNtFEJ7t' \
    > test.out 2>&1
eval_tap $? 40 'PublicPartyLeave' test.out

#- 41 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nkY6Mca5' \
    > test.out 2>&1
eval_tap $? 41 'PublicPartyReject' test.out

#- 42 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'afj12K2I' \
    --userId 'zrBvvWm4' \
    > test.out 2>&1
eval_tap $? 42 'PublicPartyKick' test.out

#- 43 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"udE0OXud": {}, "XgNne8kJ": {}, "ATwlc6es": {}}, "configurationName": "Up6Sw1I9", "inactiveTimeout": 73, "inviteTimeout": 20, "joinability": "rzzjrcau", "maxPlayers": 14, "members": [{"ID": "hLd3Knak", "PlatformID": "noed9DHh", "PlatformUserID": "LOqQGhCU"}, {"ID": "r6iTrjyE", "PlatformID": "garAdNJO", "PlatformUserID": "IG36I6tR"}, {"ID": "bRcrEveM", "PlatformID": "dAdiPKDU", "PlatformUserID": "VSC00PYe"}], "minPlayers": 60, "textChat": true, "type": "cagginxn"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicCreateParty' test.out

#- 44 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'PublicGetPlayerAttributes' test.out

#- 45 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "data": {"5qXn3aoR": {}, "tlqOECoh": {}, "ViHA5Czg": {}}, "platforms": [{"name": "FSy8X1A3", "userID": "PrIfapq5"}, {"name": "AAeMe4L3", "userID": "mDWORBVX"}, {"name": "TIIJM9Xs", "userID": "YIIZxiXN"}]}' \
    > test.out 2>&1
eval_tap $? 45 'PublicStorePlayerAttributes' test.out

#- 46 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'PublicDeletePlayerAttributes' test.out

#- 47 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'MR9BgaWc' \
    --orderBy 'FX3SUBhy' \
    --status 'oTsMWPAx' \
    > test.out 2>&1
eval_tap $? 47 'PublicQueryMyGameSessions' test.out

#- 48 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'UMkawaGp' \
    --orderBy 'AyrIwMif' \
    --status '3BOdkocV' \
    > test.out 2>&1
eval_tap $? 48 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE