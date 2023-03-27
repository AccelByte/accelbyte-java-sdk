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

#- 13 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'C8XfwHuK' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eb9l3rGN' \
    --statusType '9A3sNm84' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateGameSessionMember' test.out

#- 14 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'hddSpHt0' \
    --key 'P7MIIR7C' \
    --leaderID 'kyF6C7du' \
    --limit '42' \
    --memberID 'iTqpyhPF' \
    --memberStatus 'dxLzFQN0' \
    --offset '59' \
    --order 'MYzYiKWe' \
    --orderBy '5dNRljv7' \
    --value 'IPrDQQRg' \
    > test.out 2>&1
eval_tap $? 14 'AdminQueryParties' test.out

#- 15 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'at0SevkL' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryPlayerAttributes' test.out

#- 16 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'GMS0lyuI' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPlayerAttributes' test.out

#- 17 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"9a2I9u6V": {}, "pbsx5w8h": {}, "qUI06UpO": {}}, "backfillTicketID": "XGSLmCVu", "clientVersion": "HOPlLlkv", "configurationName": "R8sKgnuR", "deployment": "kgghGoYu", "inactiveTimeout": 31, "inviteTimeout": 23, "joinability": "D391C2qt", "matchPool": "PYokahFj", "maxPlayers": 21, "minPlayers": 25, "requestedRegions": ["QsfCaTmt", "1d67FXGk", "2s9Q0mPV"], "serverName": "o3twu0Me", "teams": [{"UserIDs": ["sTCf9x4r", "t69lna7q", "xNeIxPz6"], "parties": [{"partyID": "MbwL6IY6", "userIDs": ["9z1UaLqY", "SYWytLPz", "iZMdjxcB"]}, {"partyID": "ZufQxGiH", "userIDs": ["PllG4cYE", "zfTD1ZBm", "3MqHcUmL"]}, {"partyID": "ZZbSqb8R", "userIDs": ["wNmn9HrN", "Qy4uZAAi", "E0mit9RG"]}]}, {"UserIDs": ["CCHYzUOc", "EdscKHPE", "qgA8yu7V"], "parties": [{"partyID": "k6Jt4Ymo", "userIDs": ["s9Jcdos4", "fYcTVU6R", "Bt0zYoMc"]}, {"partyID": "HyCUEXlA", "userIDs": ["vxJMdalw", "SyliWMNW", "5NyLu0M3"]}, {"partyID": "VHh2EI8J", "userIDs": ["lDbPWbQ6", "Q9lNmqRB", "aAkLnvxk"]}]}, {"UserIDs": ["T1X68cmD", "c3fxU8My", "KrQpM4hk"], "parties": [{"partyID": "kK6KKXNB", "userIDs": ["3Gv0IqmF", "51TkhjYn", "aq6foWvX"]}, {"partyID": "a3bMrXsD", "userIDs": ["r6kILsSS", "yDdmykmo", "PYgc2L4j"]}, {"partyID": "k4Lo0LSP", "userIDs": ["0pf4IxjU", "kl535X3a", "teEKDpAD"]}]}], "textChat": true, "ticketIDs": ["6i5lZC9x", "v32e8c5c", "sSovoqsZ"], "type": "NBdte9ND"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateGameSession' test.out

#- 18 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"UPVJf6c2": {}, "Z0QZxfgP": {}, "ubTDIHrv": {}}' \
    > test.out 2>&1
eval_tap $? 18 'PublicQueryGameSessions' test.out

#- 19 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'qAThuwjR' \
    > test.out 2>&1
eval_tap $? 19 'GetGameSessionByPodName' test.out

#- 20 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HpKKTlmV' \
    > test.out 2>&1
eval_tap $? 20 'GetGameSession' test.out

#- 21 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'r9XuoJbR' \
    --body '{"attributes": {"FQSKVPHb": {}, "n4Xxtu7L": {}, "QRENjEEz": {}}, "backfillTicketID": "tx1WsYSi", "clientVersion": "Zqan0nSB", "deployment": "Jroav91G", "inactiveTimeout": 68, "inviteTimeout": 23, "joinability": "eKtW18iG", "matchPool": "eUlc9d9s", "maxPlayers": 30, "minPlayers": 48, "requestedRegions": ["gWa24CKN", "S0GqVvUf", "HQvsHXNU"], "teams": [{"UserIDs": ["Ne4mhgo5", "QB65lSAi", "YnNjkfZr"], "parties": [{"partyID": "QvGgbLdL", "userIDs": ["sFzHkBMr", "1yrOMlNF", "SrUEirnj"]}, {"partyID": "X9fDmIbe", "userIDs": ["ZxzfTcyi", "uATus9hs", "fpFDcSDG"]}, {"partyID": "8aMVGLiB", "userIDs": ["NrDjqoxc", "wgGLXpUL", "4pp2ncYA"]}]}, {"UserIDs": ["HdNzDmeI", "P6rOvDz9", "KOsb392k"], "parties": [{"partyID": "6YmJFfRB", "userIDs": ["yjlBiuFM", "3FIoVk8T", "3GpAnkCm"]}, {"partyID": "BUqg2SCn", "userIDs": ["qntX9y1a", "ZSWMiVi1", "0sG6vxkf"]}, {"partyID": "UcmqRRbc", "userIDs": ["eJ5i0EeD", "xOgBnhhq", "ElIaDml4"]}]}, {"UserIDs": ["8wdNFLTm", "5T50x9WT", "0GfH2rtO"], "parties": [{"partyID": "a4EXsXzO", "userIDs": ["XQAk4mqr", "xzTtuLl4", "XlbGL8QO"]}, {"partyID": "xtjzm8y2", "userIDs": ["wNhmwoYZ", "yI4EFZKB", "cYrCEAE7"]}, {"partyID": "WIsfmx40", "userIDs": ["NLRc6m8h", "eKnWhzfe", "2NubeoKF"]}]}], "ticketIDs": ["eIaFQCYo", "DPICpndu", "EEQlULdJ"], "type": "z4mnRBkM", "version": 81}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateGameSession' test.out

#- 22 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cf80zfFy' \
    > test.out 2>&1
eval_tap $? 22 'DeleteGameSession' test.out

#- 23 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'abWAgIUX' \
    --body '{"attributes": {"iI07A68e": {}, "aqC2J9jy": {}, "EW6GLbc0": {}}, "backfillTicketID": "NaKDUL3s", "clientVersion": "a13lk1dQ", "deployment": "BHO86IlB", "inactiveTimeout": 16, "inviteTimeout": 27, "joinability": "CO39PXDN", "matchPool": "xtXgeO3F", "maxPlayers": 12, "minPlayers": 42, "requestedRegions": ["kXhjDzaQ", "Y3snn2Zk", "P7cFdP43"], "teams": [{"UserIDs": ["e5dC9XIB", "udfZgrbH", "DIDm4hMz"], "parties": [{"partyID": "F4Txoden", "userIDs": ["SrUTvfqU", "0bfoMm5c", "TtFWbotQ"]}, {"partyID": "yXJRcQWs", "userIDs": ["mqPNs92e", "pxk0i8Vx", "sZNereSv"]}, {"partyID": "f9699mCE", "userIDs": ["HThUJkET", "AsSp7gh4", "TeUTkOkA"]}]}, {"UserIDs": ["YfJB8AT9", "t4Tv207Y", "2QD3oD5f"], "parties": [{"partyID": "LCr3OOlX", "userIDs": ["Vv8ZGF7u", "YnGzpipN", "DigNJma1"]}, {"partyID": "MbqqZtfN", "userIDs": ["Wql4nmwA", "ft4gqkNN", "lWkD9eOz"]}, {"partyID": "iYRFOn0j", "userIDs": ["JLHC9Lxh", "vNXTwGBC", "tohLtl9Z"]}]}, {"UserIDs": ["uhytm5UD", "rT6QXCs5", "SPBbRPZT"], "parties": [{"partyID": "F6oQAXVG", "userIDs": ["7tnsZg5Q", "gXjvyGJP", "N4eXbJE5"]}, {"partyID": "Vs2Gcyom", "userIDs": ["QoIXimBJ", "ehyxlNsj", "UgxBkF6w"]}, {"partyID": "FPoJeQed", "userIDs": ["iogEhhM2", "rIizGdKv", "OPdq5xrg"]}]}], "ticketIDs": ["xSmy1DN9", "LFkYW5DQ", "yj4bj5Ro"], "type": "2ogaKt2u", "version": 20}' \
    > test.out 2>&1
eval_tap $? 23 'PatchUpdateGameSession' test.out

#- 24 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DSJsEK5Q' \
    --body '{"backfillTicketID": "pNhlI2iS"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateGameSessionBackfillTicketID' test.out

#- 25 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5EpGhhvX' \
    --body '{"userID": "Yck0upMz"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicGameSessionInvite' test.out

#- 26 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UYnb76tF' \
    > test.out 2>&1
eval_tap $? 26 'JoinGameSession' test.out

#- 27 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kEORV3bu' \
    > test.out 2>&1
eval_tap $? 27 'LeaveGameSession' test.out

#- 28 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1bNCtX7W' \
    > test.out 2>&1
eval_tap $? 28 'PublicGameSessionReject' test.out

#- 29 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '40V6Do5s' \
    --body '{"additionalMembers": [{"partyID": "YadCCFrH", "userIDs": ["HC3DpZxk", "rQDXuNFv", "iMarv8mn"]}, {"partyID": "fHK8CCmE", "userIDs": ["2lPnsbD3", "SGEdlwuU", "ccE536ug"]}, {"partyID": "Bp3HBvep", "userIDs": ["nDCjgyJl", "Xe36mgWj", "LfFmteue"]}], "proposedTeams": [{"UserIDs": ["9nzJ6fH2", "4T805tVg", "8JqU0jZp"], "parties": [{"partyID": "jvsugAOS", "userIDs": ["7u8RiWye", "rCSa8SRg", "wsAj1ik1"]}, {"partyID": "jglaDXTv", "userIDs": ["KCWwNTAh", "d2wrS0uP", "djhdinpn"]}, {"partyID": "g5BLy8wb", "userIDs": ["hMssAHja", "pIkY9Rf4", "wP57dBZN"]}]}, {"UserIDs": ["R88YbCtm", "Ky8M9zVr", "jfGXZnqA"], "parties": [{"partyID": "QUoY1Gjl", "userIDs": ["IIk0iKoT", "TS1j02o7", "JjTXAQN0"]}, {"partyID": "qdskdQV0", "userIDs": ["TqI8EFnm", "DbxIxi4Y", "KlONk2Q5"]}, {"partyID": "Y4Jvaizw", "userIDs": ["iilatuUj", "jt9lIMGq", "l5ElEa9E"]}]}, {"UserIDs": ["IIlGcHB3", "CfR3ncDl", "wi3v3MFF"], "parties": [{"partyID": "J1KesKoE", "userIDs": ["LCpobBEG", "8X645xpd", "Xpai0rYa"]}, {"partyID": "T5hOPjaf", "userIDs": ["3H0tYigh", "U0VUfcYH", "JbBfAKSi"]}, {"partyID": "PW3VgsZX", "userIDs": ["iR1DJ7HV", "WqMkNSaw", "QUWDFJvJ"]}]}], "version": 55}' \
    > test.out 2>&1
eval_tap $? 29 'AppendTeamGameSession' test.out

#- 30 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "q8PdH6hJ"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPartyJoinCode' test.out

#- 31 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PUAc0RVw' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetParty' test.out

#- 32 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XgAgntLM' \
    --body '{"attributes": {"CuaXBWQi": {}, "6BqPg4xr": {}, "0lCancUZ": {}}, "inactiveTimeout": 66, "inviteTimeout": 45, "joinability": "CHsZYoLf", "maxPlayers": 88, "minPlayers": 82, "type": "1KtOv7Zy", "version": 26}' \
    > test.out 2>&1
eval_tap $? 32 'PublicUpdateParty' test.out

#- 33 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'b65uvuKN' \
    --body '{"attributes": {"uy0ytZQ7": {}, "M6Nzy1ad": {}, "nSKOLFKx": {}}, "inactiveTimeout": 24, "inviteTimeout": 7, "joinability": "W9YfRSse", "maxPlayers": 32, "minPlayers": 54, "type": "DMUAeeZ9", "version": 92}' \
    > test.out 2>&1
eval_tap $? 33 'PublicPatchUpdateParty' test.out

#- 34 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QKFlAVmV' \
    > test.out 2>&1
eval_tap $? 34 'PublicGeneratePartyCode' test.out

#- 35 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Lu4AOec0' \
    > test.out 2>&1
eval_tap $? 35 'PublicRevokePartyCode' test.out

#- 36 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'z8eBeeoi' \
    --body '{"userID": "p68J1nsv"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyInvite' test.out

#- 37 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '4W2OJhta' \
    --body '{"leaderID": "fxMSJlHe"}' \
    > test.out 2>&1
eval_tap $? 37 'PublicPromotePartyLeader' test.out

#- 38 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'b34sZKHc' \
    > test.out 2>&1
eval_tap $? 38 'PublicPartyJoin' test.out

#- 39 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'l5LLLOex' \
    > test.out 2>&1
eval_tap $? 39 'PublicPartyLeave' test.out

#- 40 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'L4fZvWtN' \
    > test.out 2>&1
eval_tap $? 40 'PublicPartyReject' test.out

#- 41 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'D2tcBFpX' \
    --userId '8lNtFEJ7' \
    > test.out 2>&1
eval_tap $? 41 'PublicPartyKick' test.out

#- 42 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"tnkY6Mca": {}, "5afj12K2": {}, "IzrBvvWm": {}}, "configurationName": "4udE0OXu", "inactiveTimeout": 7, "inviteTimeout": 94, "joinability": "XgNne8kJ", "maxPlayers": 55, "members": [{"ID": "pu1VCarz", "PlatformID": "BsV6xnZ5", "PlatformUserID": "Jrzzjrca"}, {"ID": "ug6CWVG8", "PlatformID": "SWP3glU6", "PlatformUserID": "muswVJnN"}, {"ID": "nN7kAa7j", "PlatformID": "0riFc5HT", "PlatformUserID": "HQIoVsGo"}], "minPlayers": 89, "textChat": false, "type": "bRcrEveM"}' \
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
    --body '{"crossplayEnabled": false, "data": {"HQkETJyT": {}, "lUrwDTno": {}, "ujQD4IEi": {}}, "platforms": [{"name": "H9Z5qXn3", "userID": "aoRtlqOE"}, {"name": "CohViHA5", "userID": "CzgFSy8X"}, {"name": "1A3PrIfa", "userID": "pq5AAeMe"}]}' \
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
    --order '4L3mDWOR' \
    --orderBy 'BVXTIIJM' \
    --status '9XsYIIZx' \
    > test.out 2>&1
eval_tap $? 46 'PublicQueryMyGameSessions' test.out

#- 47 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'iXNMR9Bg' \
    --orderBy 'aWcFX3SU' \
    --status 'BhyoTsMW' \
    > test.out 2>&1
eval_tap $? 47 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE