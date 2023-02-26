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
    --body '{"clientVersion": "3JLqOUoh", "deployment": "DvnK9CsJ", "inactiveTimeout": 77, "inviteTimeout": 50, "joinability": "2ahvc2GC", "maxPlayers": 63, "minPlayers": 87, "name": "78jtHCWn", "requestedRegions": ["xC1z6ra1", "bUJXn9HG", "ldO8Abya"], "textChat": false, "type": "ntl31uU7"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'MEkRwh7o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'raVoC8R3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "R72ie929", "deployment": "3BHqkk45", "inactiveTimeout": 17, "inviteTimeout": 18, "joinability": "Vrb0oASk", "maxPlayers": 55, "minPlayers": 95, "name": "Ht65zQGE", "requestedRegions": ["XdwPYgj4", "RoUH2cfS", "qDDlC56d"], "textChat": true, "type": "Lhb5OTBK"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'zBJ64GaK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'eXtBSUCf' \
    --dsPodName 'kItswlUp' \
    --fromTime 'nYSSxSdt' \
    --gameMode 'cZmjbyuu' \
    --isSoftDeleted 'aMd7dbHk' \
    --joinability 'RlrXxE1a' \
    --limit '83' \
    --matchPool 'bNidCMTR' \
    --memberID 'OpJZCaRM' \
    --offset '52' \
    --order '98seB8Qr' \
    --orderBy '5vMPX33c' \
    --sessionID 'jX6yfsDu' \
    --status 'hCrKfaqI' \
    --statusV2 'UAYI5wIY' \
    --toTime 'X1JRHjkN' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'xH6CSY4l' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FdTW72Cg' \
    --statusType 'kNqrS3ay' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'Xxza2mwN' \
    --key 'yjL8Nle9' \
    --leaderID 'pTJAmQ1H' \
    --limit '95' \
    --memberID 'tNp63oSM' \
    --memberStatus 'MoIU6nEP' \
    --offset '87' \
    --order 'xYwUmo60' \
    --orderBy '8ydwn5hP' \
    --value 'C5OwzOoC' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'dOr4GGWc' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryPlayerAttributes' test.out

#- 13 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'w7gribFe' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerAttributes' test.out

#- 14 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"saNo34C2": {}, "acmSUM89": {}, "woYp4qSW": {}}, "backfillTicketID": "ydHYp2Mm", "clientVersion": "v20PjRCw", "configurationName": "37ZtDqwh", "deployment": "yd1NFRHX", "inactiveTimeout": 83, "inviteTimeout": 42, "joinability": "22rN5YkP", "matchPool": "FQMvPDi7", "maxPlayers": 59, "minPlayers": 12, "requestedRegions": ["5xEoR7qL", "BwHKO2DB", "aioTH8wv"], "serverName": "e02PvDxF", "teams": [{"UserIDs": ["bQSCEwrQ", "LpaDcylx", "nrsGPTzw"], "parties": [{"partyID": "ycZLUdww", "userIDs": ["UNMZPlv3", "8XpX16id", "qAdkC4d8"]}, {"partyID": "s15dc1qN", "userIDs": ["NgoIw1JJ", "k96BppyO", "nzoN90a8"]}, {"partyID": "t53hEa7r", "userIDs": ["gblN7Ctk", "sCupZ0eG", "qZy0uzSz"]}]}, {"UserIDs": ["aUrsxfYX", "0Y3J0Hhv", "WzbfOeRh"], "parties": [{"partyID": "o1wiTKqx", "userIDs": ["XMoic2PY", "wuM8T9jZ", "LJWhPMCP"]}, {"partyID": "HFubLFcH", "userIDs": ["GzmJJ07g", "YMBBxzvX", "Le0uFeCx"]}, {"partyID": "6227eIHt", "userIDs": ["I81uHbGI", "Nh0H6xDz", "wyix7ali"]}]}, {"UserIDs": ["ySMsQZF5", "Sr28ac7t", "yL37VqOL"], "parties": [{"partyID": "87NNEExK", "userIDs": ["eOCO6Trp", "G5YDq3ZO", "G8zKQSZQ"]}, {"partyID": "1Ob4n4UW", "userIDs": ["ah4YEWRJ", "j6u50si8", "WFC20Q0W"]}, {"partyID": "6QAYBxrV", "userIDs": ["8INL8BDj", "b9sNAlAv", "crBQ3Qnj"]}]}], "textChat": true, "ticketIDs": ["KmajhiEX", "d6JUVRiD", "thVoGeQ6"], "type": "Y8K6Lkw0"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateGameSession' test.out

#- 15 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"6AvzQTVj": {}, "ONn1u4bW": {}, "3GDVShfm": {}}' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessions' test.out

#- 16 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'UBNEvJmx' \
    > test.out 2>&1
eval_tap $? 16 'GetGameSessionByPodName' test.out

#- 17 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UhdYcHcW' \
    > test.out 2>&1
eval_tap $? 17 'GetGameSession' test.out

#- 18 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'r8Q4WWFn' \
    --body '{"attributes": {"H50IP60V": {}, "fEuA53Kk": {}, "qncsIitj": {}}, "backfillTicketID": "PQ1eIm2g", "clientVersion": "897VHWes", "deployment": "Iiot4aDL", "inactiveTimeout": 50, "inviteTimeout": 28, "joinability": "EJU8o9gO", "matchPool": "gyT5DnNg", "maxPlayers": 75, "minPlayers": 9, "requestedRegions": ["mGHxiBTF", "s7CJJ5hk", "bW4hVrEe"], "teams": [{"UserIDs": ["KWldgqU0", "WL7f25wr", "a4f3xdPE"], "parties": [{"partyID": "Rpy0PIE0", "userIDs": ["YUpVwrAi", "J6GXOgWe", "jEb1RZTP"]}, {"partyID": "7N8lJj7L", "userIDs": ["BDdrv6fm", "PKTy4bQM", "NTSfbWjY"]}, {"partyID": "50zrUJIS", "userIDs": ["ENcBsKws", "5zcNZ8pP", "lgYZecX2"]}]}, {"UserIDs": ["MQMS2QwD", "9OrZPzCX", "gsLQoDly"], "parties": [{"partyID": "Jb0SXSYt", "userIDs": ["xjwPmdW1", "RK8porRl", "gNeZnOpy"]}, {"partyID": "arR14mVR", "userIDs": ["o2xkarah", "rw4qxudk", "yQJe744U"]}, {"partyID": "Q6xEVPeN", "userIDs": ["b0Bvk3IG", "jFqkVcET", "ebwfl4gA"]}]}, {"UserIDs": ["UTd0GkgI", "4M5wzuWF", "jie2X4ft"], "parties": [{"partyID": "wFX2jxBB", "userIDs": ["EV69DYij", "rPL8B45X", "DTh4lVW3"]}, {"partyID": "lfPsDqP2", "userIDs": ["Z2VewfcJ", "PeFEa2Kj", "51W4k48t"]}, {"partyID": "tds7Dpxd", "userIDs": ["y4VPDJ24", "GuCsasmM", "3WjpoF8n"]}]}], "ticketIDs": ["COGQ56sC", "0JgwsFTo", "cHYm5yJV"], "type": "5gLZJJbl", "version": 97}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateGameSession' test.out

#- 19 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ksmhsoZh' \
    > test.out 2>&1
eval_tap $? 19 'DeleteGameSession' test.out

#- 20 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ABOw5PyL' \
    --body '{"attributes": {"99U9JOR3": {}, "kWl5eAZR": {}, "RwCN8z3F": {}}, "backfillTicketID": "VXzAbaGt", "clientVersion": "QhGKvrhM", "deployment": "oUxgZeNj", "inactiveTimeout": 84, "inviteTimeout": 22, "joinability": "TFvMoRC1", "matchPool": "TI4eAbuP", "maxPlayers": 82, "minPlayers": 60, "requestedRegions": ["V2zKjJ8O", "lbcpOE2Z", "x4KAW9bS"], "teams": [{"UserIDs": ["ntEVrqqy", "24kRpx4m", "cejocaks"], "parties": [{"partyID": "QuCaPnrn", "userIDs": ["Azos7SCj", "CNsrs9BZ", "ffYwSXDJ"]}, {"partyID": "Ne4jKtx9", "userIDs": ["rJsC41WW", "6JMA0gOE", "dNPM8Va8"]}, {"partyID": "VjkQlwtK", "userIDs": ["DTAFIOwQ", "6VeI65U9", "3coZan0d"]}]}, {"UserIDs": ["tZVm9YTm", "PenzNRDx", "LwPSaqeS"], "parties": [{"partyID": "h0ji9rP4", "userIDs": ["U6DugkTA", "DF2And70", "OAS7VzCb"]}, {"partyID": "YuCaEznQ", "userIDs": ["W5No94ul", "HWHfRFDL", "X2Nf8XUe"]}, {"partyID": "D4kkXrB9", "userIDs": ["153mp5lJ", "qHrqTxVi", "PUJaHX7A"]}]}, {"UserIDs": ["aOZRMX3Y", "KnJSI2by", "gXx3gyZE"], "parties": [{"partyID": "g6cCSpgE", "userIDs": ["FNXXXso5", "KTvSaw7M", "7Jml3ARP"]}, {"partyID": "npVr485X", "userIDs": ["D6H6pbEo", "s6amTI9r", "VJFkfS5v"]}, {"partyID": "lRozLeQZ", "userIDs": ["Ypb5DafR", "xFHcAMR7", "kg5SPPm5"]}]}], "ticketIDs": ["W9k24ecd", "VmtDb1wm", "VUojlbh1"], "type": "rkizn0Z7", "version": 52}' \
    > test.out 2>&1
eval_tap $? 20 'PatchUpdateGameSession' test.out

#- 21 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CmdE3zda' \
    --body '{"userID": "wzYiXf41"}' \
    > test.out 2>&1
eval_tap $? 21 'PublicGameSessionInvite' test.out

#- 22 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '417Wki8s' \
    > test.out 2>&1
eval_tap $? 22 'JoinGameSession' test.out

#- 23 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wtoXjvPA' \
    > test.out 2>&1
eval_tap $? 23 'LeaveGameSession' test.out

#- 24 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AzuKM8sU' \
    > test.out 2>&1
eval_tap $? 24 'PublicGameSessionReject' test.out

#- 25 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dMB3iRAC"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicPartyJoinCode' test.out

#- 26 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sOmJdaJ5' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetParty' test.out

#- 27 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '4K1kcrOf' \
    --body '{"attributes": {"0IFI18ZC": {}, "xX6Phh4D": {}, "oZEGbYiE": {}}, "inactiveTimeout": 47, "inviteTimeout": 22, "joinability": "kXBYk3yN", "maxPlayers": 64, "minPlayers": 7, "type": "DXJLhXHn", "version": 10}' \
    > test.out 2>&1
eval_tap $? 27 'PublicUpdateParty' test.out

#- 28 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ODOaLspX' \
    --body '{"attributes": {"KoWlOeBX": {}, "hRrL5W7Q": {}, "buJ0ggT8": {}}, "inactiveTimeout": 47, "inviteTimeout": 53, "joinability": "5x53j7KY", "maxPlayers": 51, "minPlayers": 94, "type": "QAxUXdK4", "version": 47}' \
    > test.out 2>&1
eval_tap $? 28 'PublicPatchUpdateParty' test.out

#- 29 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BT8AJ1fx' \
    > test.out 2>&1
eval_tap $? 29 'PublicGeneratePartyCode' test.out

#- 30 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '3xJGqeXI' \
    > test.out 2>&1
eval_tap $? 30 'PublicRevokePartyCode' test.out

#- 31 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'p5cdhaFe' \
    --body '{"userID": "kS5CQU3p"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyInvite' test.out

#- 32 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'L52pLdZu' \
    --body '{"leaderID": "bN47CaUB"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicPromotePartyLeader' test.out

#- 33 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XmVc2T0K' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyJoin' test.out

#- 34 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WYFFErMW' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyLeave' test.out

#- 35 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xObqc12d' \
    > test.out 2>&1
eval_tap $? 35 'PublicPartyReject' test.out

#- 36 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'N9qj0vvO' \
    --userId 'q0J0i0zz' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyKick' test.out

#- 37 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"ZwE4feWC": {}, "WCTWkBjD": {}, "150RXIzf": {}}, "configurationName": "fgY1zmfw", "inactiveTimeout": 75, "inviteTimeout": 78, "joinability": "s2zCqHFt", "maxPlayers": 66, "members": [{"ID": "K8bjqISF", "PlatformID": "hSUQ3gbM", "PlatformUserID": "TV1ipa01"}, {"ID": "l7FXPZVb", "PlatformID": "gx6aJozL", "PlatformUserID": "l3AXaPIw"}, {"ID": "6nlsrOdu", "PlatformID": "CcaeTBAE", "PlatformUserID": "0TAUwuJ9"}], "minPlayers": 56, "textChat": false, "type": "1TyGGzNn"}' \
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
    --body '{"crossplayEnabled": true, "data": {"bl0seitn": {}, "Ph04ZSD0": {}, "1cm5Jtfz": {}}, "platforms": [{"name": "uLhXc8G0", "userID": "HyZ5IJZ6"}, {"name": "6xxYr7x6", "userID": "0OoZDzat"}, {"name": "916FrzPB", "userID": "oGGhx5JO"}]}' \
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
    --order 'yMDexAxf' \
    --orderBy 'VUFvSiOe' \
    --status '3wn9Jrna' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryMyGameSessions' test.out

#- 42 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'RR8w1F1a' \
    --orderBy 'XDUB1LNF' \
    --status 'CEOhsEhJ' \
    > test.out 2>&1
eval_tap $? 42 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE