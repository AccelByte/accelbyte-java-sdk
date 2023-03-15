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
echo "1..47"

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
    --body '{"clientVersion": "7qbPngUN", "deployment": "B1vRodwp", "inactiveTimeout": 52, "inviteTimeout": 65, "joinability": "S6DaDpv8", "maxPlayers": 81, "minPlayers": 41, "name": "7ZQVqGj6", "requestedRegions": ["oDLjWjkY", "1aXlFcDt", "gOjchIua"], "textChat": true, "type": "cnz1JSDg"}' \
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
    --isSoftDeleted 'Xm7agSrj' \
    --joinability 'JW2OQNOs' \
    --limit '86' \
    --matchPool 'D6QVKNCW' \
    --memberID 'P75TB0i7' \
    --offset '31' \
    --order 'x4c8OumK' \
    --orderBy 'tPDKJDXn' \
    --sessionID '7Z4U68su' \
    --status '8XfqlqNi' \
    --statusV2 'TvB6SdAd' \
    --toTime 'IhUDrwoZ' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryGameSessions' test.out

#- 13 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '5MecdKi5' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'r6QEa1ys' \
    --statusType 'LEzth6mX' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateGameSessionMember' test.out

#- 14 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'hzkzWkFe' \
    --key 'ZSoEAcBd' \
    --leaderID 'W19m4eu6' \
    --limit '7' \
    --memberID 'yF6C7duu' \
    --memberStatus 'yZ0GhDog' \
    --offset '34' \
    --order 'xLzFQN05' \
    --orderBy 'MYzYiKWe' \
    --value '5dNRljv7' \
    > test.out 2>&1
eval_tap $? 14 'AdminQueryParties' test.out

#- 15 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'IPrDQQRg' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryPlayerAttributes' test.out

#- 16 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'at0SevkL' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPlayerAttributes' test.out

#- 17 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"GMS0lyuI": {}, "9a2I9u6V": {}, "pbsx5w8h": {}}, "backfillTicketID": "qUI06UpO", "clientVersion": "XGSLmCVu", "configurationName": "HOPlLlkv", "deployment": "R8sKgnuR", "inactiveTimeout": 20, "inviteTimeout": 70, "joinability": "gghGoYup", "matchPool": "D391C2qt", "maxPlayers": 85, "minPlayers": 92, "persistent": true, "requestedRegions": ["okahFjkQ", "sfCaTmt1", "d67FXGk2"], "serverName": "s9Q0mPVo", "teams": [{"UserIDs": ["3twu0Mes", "TCf9x4rt", "69lna7qx"], "parties": [{"partyID": "NeIxPz6M", "userIDs": ["bwL6IY69", "z1UaLqYS", "YWytLPzi"]}, {"partyID": "ZMdjxcBZ", "userIDs": ["ufQxGiHP", "llG4cYEz", "fTD1ZBm3"]}, {"partyID": "MqHcUmLZ", "userIDs": ["ZbSqb8Rw", "Nmn9HrNQ", "y4uZAAiE"]}]}, {"UserIDs": ["0mit9RGC", "CHYzUOcE", "dscKHPEq"], "parties": [{"partyID": "gA8yu7Vk", "userIDs": ["6Jt4Ymos", "9Jcdos4f", "YcTVU6RB"]}, {"partyID": "t0zYoMcH", "userIDs": ["yCUEXlAv", "xJMdalwS", "yliWMNW5"]}, {"partyID": "NyLu0M3V", "userIDs": ["Hh2EI8Jl", "DbPWbQ6Q", "9lNmqRBa"]}]}, {"UserIDs": ["AkLnvxkT", "1X68cmDc", "3fxU8MyK"], "parties": [{"partyID": "rQpM4hkk", "userIDs": ["K6KKXNB3", "Gv0IqmF5", "1TkhjYna"]}, {"partyID": "q6foWvXa", "userIDs": ["3bMrXsDr", "6kILsSSy", "DdmykmoP"]}, {"partyID": "Ygc2L4jk", "userIDs": ["4Lo0LSP0", "pf4IxjUk", "l535X3at"]}]}], "textChat": false, "ticketIDs": ["XksUC9b6", "i5lZC9xv", "32e8c5cs"], "type": "SovoqsZN"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateGameSession' test.out

#- 18 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"Bdte9NDU": {}, "PVJf6c2Z": {}, "0QZxfgPu": {}}' \
    > test.out 2>&1
eval_tap $? 18 'PublicQueryGameSessions' test.out

#- 19 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'bTDIHrvq' \
    > test.out 2>&1
eval_tap $? 19 'GetGameSessionByPodName' test.out

#- 20 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AThuwjRH' \
    > test.out 2>&1
eval_tap $? 20 'GetGameSession' test.out

#- 21 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pKKTlmVr' \
    --body '{"attributes": {"9XuoJbRF": {}, "QSKVPHbn": {}, "4Xxtu7LQ": {}}, "backfillTicketID": "RENjEEzt", "clientVersion": "x1WsYSiZ", "deployment": "qan0nSBJ", "inactiveTimeout": 36, "inviteTimeout": 30, "joinability": "YBHqaTHe", "matchPool": "KtW18iGe", "maxPlayers": 96, "minPlayers": 98, "requestedRegions": ["lc9d9sog", "Wa24CKNS", "0GqVvUfH"], "teams": [{"UserIDs": ["QvsHXNUN", "e4mhgo5Q", "B65lSAiY"], "parties": [{"partyID": "nNjkfZrQ", "userIDs": ["vGgbLdLs", "FzHkBMr1", "yrOMlNFS"]}, {"partyID": "rUEirnjX", "userIDs": ["9fDmIbeZ", "xzfTcyiu", "ATus9hsf"]}, {"partyID": "pFDcSDG8", "userIDs": ["aMVGLiBN", "rDjqoxcw", "gGLXpUL4"]}]}, {"UserIDs": ["pp2ncYAH", "dNzDmeIP", "6rOvDz9K"], "parties": [{"partyID": "Osb392k6", "userIDs": ["YmJFfRBy", "jlBiuFM3", "FIoVk8T3"]}, {"partyID": "GpAnkCmB", "userIDs": ["Uqg2SCnq", "ntX9y1aZ", "SWMiVi10"]}, {"partyID": "sG6vxkfU", "userIDs": ["cmqRRbce", "J5i0EeDx", "OgBnhhqE"]}]}, {"UserIDs": ["lIaDml48", "wdNFLTm5", "T50x9WT0"], "parties": [{"partyID": "GfH2rtOa", "userIDs": ["4EXsXzOX", "QAk4mqrx", "zTtuLl4X"]}, {"partyID": "lbGL8QOx", "userIDs": ["tjzm8y2w", "NhmwoYZy", "I4EFZKBc"]}, {"partyID": "YrCEAE7W", "userIDs": ["Isfmx40N", "LRc6m8he", "KnWhzfe2"]}]}], "ticketIDs": ["NubeoKFe", "IaFQCYoD", "PICpnduE"], "type": "EQlULdJz", "version": 25}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateGameSession' test.out

#- 22 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hEoRCAcf' \
    > test.out 2>&1
eval_tap $? 22 'DeleteGameSession' test.out

#- 23 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '80zfFyab' \
    --body '{"attributes": {"WAgIUXiI": {}, "07A68eaq": {}, "C2J9jyEW": {}}, "backfillTicketID": "6GLbc0Na", "clientVersion": "KDUL3sa1", "deployment": "3lk1dQBH", "inactiveTimeout": 83, "inviteTimeout": 16, "joinability": "86IlBhne", "matchPool": "tU4RwTqU", "maxPlayers": 24, "minPlayers": 13, "requestedRegions": ["TDBzOuYs", "aZA2yyd4", "mbqoOfAD"], "teams": [{"UserIDs": ["MMAXFaY9", "eKa699bR", "VhyaKwwr"], "parties": [{"partyID": "AP2aMlu7", "userIDs": ["WtjCtoYe", "tOO847g8", "OudOfjnC"]}, {"partyID": "uHZ3c46I", "userIDs": ["jGa23YvY", "mmDg7VYP", "XIuvUYTZ"]}, {"partyID": "BRujIUE1", "userIDs": ["Tq5jyAZv", "kRCMNFIu", "rjh2imdb"]}]}, {"UserIDs": ["4rbkXj0Z", "wsVC0gL9", "7ZVJSPqJ"], "parties": [{"partyID": "iwv1qlYB", "userIDs": ["1RSKs6gQ", "xC3Gb7S0", "o4zGYY7K"]}, {"partyID": "QI1AeFgP", "userIDs": ["qaOkvo1a", "olB4lkKB", "4EYOkQ1j"]}, {"partyID": "MD3cym8x", "userIDs": ["IfkOVW2g", "rREOLx0K", "Oww3HICQ"]}]}, {"UserIDs": ["Lfl7MUBG", "7qtPu64y", "AtURKLRk"], "parties": [{"partyID": "b738HGS6", "userIDs": ["rDgMdIIl", "hS1fSiM9", "331m7Ta1"]}, {"partyID": "PsKc50Kv", "userIDs": ["6ecnEevc", "Ax2K2zkR", "enmPZnGB"]}, {"partyID": "t4P7Wnbd", "userIDs": ["SJtjX7Zs", "hZyZl5x4", "bRXBHUTr"]}]}], "ticketIDs": ["DzZSKscf", "OcYu3dpC", "ROYqUiGK"], "type": "XVFCmpo6", "version": 38}' \
    > test.out 2>&1
eval_tap $? 23 'PatchUpdateGameSession' test.out

#- 24 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aKt2ujQS' \
    --body '{"backfillTicketID": "a3Zdb65U"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateGameSessionBackfillTicketID' test.out

#- 25 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Xmy0Zp6i' \
    --body '{"userID": "IaTIKUkm"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicGameSessionInvite' test.out

#- 26 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kk9QM0NB' \
    > test.out 2>&1
eval_tap $? 26 'JoinGameSession' test.out

#- 27 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MA9ORxpz' \
    > test.out 2>&1
eval_tap $? 27 'LeaveGameSession' test.out

#- 28 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wLR2AK6e' \
    > test.out 2>&1
eval_tap $? 28 'PublicGameSessionReject' test.out

#- 29 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XUGPJsw1' \
    --body '{"additionalMembers": [{"partyID": "fiP80G9P", "userIDs": ["clxcft2u", "lIJzPyrV", "EiOG4Ucq"]}, {"partyID": "suGKHhMR", "userIDs": ["WLVd3Dlh", "LuIpomM8", "sm1MiaI1"]}, {"partyID": "mX2tJoAR", "userIDs": ["tdbBe7ud", "sMrok0Wv", "GYYnx4V7"]}], "proposedTeams": [{"UserIDs": ["09xbnGez", "KsDwG2om", "OR2nvYI9"], "parties": [{"partyID": "TVqJdvzc", "userIDs": ["WbfUpaXp", "5JMl5LL4", "bTxBmZjd"]}, {"partyID": "rrIxsB0N", "userIDs": ["RsB1fPqq", "RRulpqpy", "mDkQhtrH"]}, {"partyID": "WwRVnwVB", "userIDs": ["OqOHi8pW", "Gd1juYhi", "qjRJOqB5"]}]}, {"UserIDs": ["F93zFQbJ", "ndUDpdON", "neAczbBd"], "parties": [{"partyID": "Hb2slt71", "userIDs": ["B1SmZp2J", "Zp50CnPb", "71ORYcmQ"]}, {"partyID": "bTU5JX8c", "userIDs": ["cLjMXJRk", "0eaKQDOJ", "vrTefglS"]}, {"partyID": "s6g4iY9u", "userIDs": ["02aCNYIW", "ekp18lOC", "3mNqF7Bl"]}]}, {"UserIDs": ["0LcghVHf", "PEspxwhR", "ON0bc1eM"], "parties": [{"partyID": "bEIjowLq", "userIDs": ["c3ecjXJb", "ZDKKoxLE", "1Y3Dymtj"]}, {"partyID": "3giPg4x4", "userIDs": ["yiPX6ues", "1Hhhkg1y", "LVbLFzHE"]}, {"partyID": "P8cM4NTw", "userIDs": ["r0KHaAsm", "Tej52WKi", "6tArAURt"]}]}], "version": 60}' \
    > test.out 2>&1
eval_tap $? 29 'AppendTeamGameSession' test.out

#- 30 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "plCSVq8P"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPartyJoinCode' test.out

#- 31 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dH6hJPUA' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetParty' test.out

#- 32 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'c0RVwXgA' \
    --body '{"attributes": {"gntLMCua": {}, "XBWQi6Bq": {}, "Pg4xr0lC": {}}, "inactiveTimeout": 0, "inviteTimeout": 17, "joinability": "ncUZGCHs", "maxPlayers": 85, "minPlayers": 21, "type": "oLfR1KtO", "version": 43}' \
    > test.out 2>&1
eval_tap $? 32 'PublicUpdateParty' test.out

#- 33 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'S5BvmgBL' \
    --body '{"attributes": {"xh4ijFnE": {}, "3Tam69qS": {}, "Z7PC6f6Q": {}}, "inactiveTimeout": 21, "inviteTimeout": 77, "joinability": "mZXElW9Y", "maxPlayers": 11, "minPlayers": 41, "type": "RSse6AAz", "version": 54}' \
    > test.out 2>&1
eval_tap $? 33 'PublicPatchUpdateParty' test.out

#- 34 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'S4czz0QK' \
    > test.out 2>&1
eval_tap $? 34 'PublicGeneratePartyCode' test.out

#- 35 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FlAVmVLu' \
    > test.out 2>&1
eval_tap $? 35 'PublicRevokePartyCode' test.out

#- 36 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '4AOec0z8' \
    --body '{"userID": "eBeeoip6"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyInvite' test.out

#- 37 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '8J1nsv4W' \
    --body '{"leaderID": "2OJhtafx"}' \
    > test.out 2>&1
eval_tap $? 37 'PublicPromotePartyLeader' test.out

#- 38 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MSJlHeb3' \
    > test.out 2>&1
eval_tap $? 38 'PublicPartyJoin' test.out

#- 39 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '4sZKHcl5' \
    > test.out 2>&1
eval_tap $? 39 'PublicPartyLeave' test.out

#- 40 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LLLOexL4' \
    > test.out 2>&1
eval_tap $? 40 'PublicPartyReject' test.out

#- 41 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fZvWtND2' \
    --userId 'tcBFpX8l' \
    > test.out 2>&1
eval_tap $? 41 'PublicPartyKick' test.out

#- 42 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"NtFEJ7tn": {}, "kY6Mca5a": {}, "fj12K2Iz": {}}, "configurationName": "rBvvWm4u", "inactiveTimeout": 6, "inviteTimeout": 84, "joinability": "E0OXudXg", "maxPlayers": 81, "members": [{"ID": "NBJYOmpu", "PlatformID": "1VCarzBs", "PlatformUserID": "V6xnZ5Jr"}, {"ID": "zzjrcaug", "PlatformID": "6CWVG8SW", "PlatformUserID": "P3glU6mu"}, {"ID": "swVJnNnN", "PlatformID": "7kAa7j0r", "PlatformUserID": "iFc5HTHQ"}], "minPlayers": 71, "textChat": false, "type": "36I6tRbR"}' \
    > test.out 2>&1
eval_tap $? 42 'PublicCreateParty' test.out

#- 43 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'PublicGetPlayerAttributes' test.out

#- 44 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "data": {"9DBqFKHQ": {}, "kETJyTlU": {}, "rwDTnouj": {}}, "platforms": [{"name": "QD4IEiH9", "userID": "Z5qXn3ao"}, {"name": "RtlqOECo", "userID": "hViHA5Cz"}, {"name": "gFSy8X1A", "userID": "3PrIfapq"}]}' \
    > test.out 2>&1
eval_tap $? 44 'PublicStorePlayerAttributes' test.out

#- 45 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'PublicDeletePlayerAttributes' test.out

#- 46 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '5AAeMe4L' \
    --orderBy '3mDWORBV' \
    --status 'XTIIJM9X' \
    > test.out 2>&1
eval_tap $? 46 'PublicQueryMyGameSessions' test.out

#- 47 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'sYIIZxiX' \
    --orderBy 'NMR9BgaW' \
    --status 'cFX3SUBh' \
    > test.out 2>&1
eval_tap $? 47 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE