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
    --body '{"clientVersion": "EewbG9k4", "deployment": "oWwgjnUo", "inactiveTimeout": 49, "inviteTimeout": 0, "joinability": "wTdHDnn7", "maxPlayers": 66, "minPlayers": 36, "name": "Kez2cRGg", "requestedRegions": ["7omgY0JN", "zlkQ38a0", "4kCY24BT"], "textChat": true, "type": "qZiRD5r3"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '2brmXuCb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'ZYbiNREY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "vUrgkjb9", "deployment": "ptSPu5nZ", "inactiveTimeout": 2, "inviteTimeout": 21, "joinability": "Icll5Xhe", "maxPlayers": 44, "minPlayers": 15, "name": "IhHDBobJ", "requestedRegions": ["rqs77cH2", "WDO9BXG5", "XysKMb0h"], "textChat": true, "type": "7WWqJT1k"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name '8EAQi11X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'cbJaNrGC' \
    --dsPodName 'uIzcQNLy' \
    --fromTime 'RWgAhqPd' \
    --gameMode 'YIPvL837' \
    --isSoftDeleted 'LelP2mzP' \
    --joinability 'tSlI7Th8' \
    --limit '31' \
    --matchPool 'prkQ4vfK' \
    --memberID 'BHj0Rcyk' \
    --offset '29' \
    --order '0kB3rjqf' \
    --orderBy 'GN5XvB9c' \
    --sessionID '5JeodxRa' \
    --status 'POiVQl1g' \
    --statusV2 'vbIRpqVl' \
    --toTime '13r6gTs0' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'Y54ZpwaX' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'O9I5o5oD' \
    --statusType '9gZT6xBR' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'LOYyNHAa' \
    --key 'iXDNMZ7V' \
    --leaderID '93OWfarg' \
    --limit '40' \
    --memberID 'KruKCDP5' \
    --memberStatus '3y53vfPE' \
    --offset '67' \
    --order 'NFW9o4xo' \
    --orderBy 'eAy6MXt4' \
    --value 'hWOta6Ab' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '5wXPWhzP' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryPlayerAttributes' test.out

#- 13 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'dsCr6hFY' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerAttributes' test.out

#- 14 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"DNYcAnjQ": {}, "zvWfXaIl": {}, "cLacVJPj": {}}, "backfillTicketID": "w53jxXjX", "clientVersion": "hI2DUlJy", "configurationName": "edaaLfJN", "deployment": "kb0ClT5J", "inactiveTimeout": 89, "inviteTimeout": 32, "joinability": "Es1PUxvl", "matchPool": "Y5O24Gxb", "maxPlayers": 98, "minPlayers": 37, "requestedRegions": ["Mt6aSzci", "a6XGHXSQ", "0UgCqLj7"], "serverName": "dzvYthTp", "teams": [{"UserIDs": ["VnxzEHVX", "PmMotx9L", "LL4VJTLD"], "parties": [{"partyID": "pCS02AJX", "userIDs": ["1qKKxeiR", "NnYQJX9N", "7gJJsBDV"]}, {"partyID": "ktUBtjUz", "userIDs": ["s5Flgy1k", "0HthFWUY", "MxTHWDbZ"]}, {"partyID": "115ZJyEd", "userIDs": ["Yg1nSPLu", "H4Ls9qoL", "QboBLZaB"]}]}, {"UserIDs": ["mkAG4yrk", "aySpgafb", "nGgxDsqG"], "parties": [{"partyID": "GYkiKOxH", "userIDs": ["VyAeWaE2", "uL26mO8c", "5A59hoA9"]}, {"partyID": "DnnZZ2wF", "userIDs": ["thTq9pa6", "FuEj6biT", "ogFAIHuB"]}, {"partyID": "vNADyTlW", "userIDs": ["FUnWfSUq", "LwhLWi2Q", "Hn4sOJMN"]}]}, {"UserIDs": ["5hXtTBke", "HShRVewR", "MyAm6Dcf"], "parties": [{"partyID": "5mGTVx1l", "userIDs": ["KOYc1yMM", "KWiDjWSb", "BEEIaUpM"]}, {"partyID": "RGj44sEU", "userIDs": ["JagJj8B1", "emPtct8R", "j8FfwlpM"]}, {"partyID": "ojRe7U68", "userIDs": ["anUDBmg4", "quyxO7at", "CJqHynX6"]}]}], "textChat": true, "ticketIDs": ["J05Qyuvu", "wRARU5Nn", "BDSusfX1"], "type": "HV1Ozfzh"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateGameSession' test.out

#- 15 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"xKXQu9Vx": {}, "9mKZP2gJ": {}, "xCJsJAtD": {}}' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessions' test.out

#- 16 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'M4vYhJre' \
    > test.out 2>&1
eval_tap $? 16 'GetGameSessionByPodName' test.out

#- 17 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7OILkyxt' \
    > test.out 2>&1
eval_tap $? 17 'GetGameSession' test.out

#- 18 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HrlbI23O' \
    --body '{"attributes": {"Nelj4uN4": {}, "PoBLvncr": {}, "pdTfyidY": {}}, "backfillTicketID": "CCIrq9H2", "clientVersion": "aR8PQMNU", "deployment": "4FBW2voB", "inactiveTimeout": 68, "inviteTimeout": 42, "joinability": "7GdDNRex", "matchPool": "vLUK8tjr", "maxPlayers": 97, "minPlayers": 77, "requestedRegions": ["Ej3bOQYA", "kzApFVp8", "IPnHyJZm"], "teams": [{"UserIDs": ["0JVBjxWN", "WK32ixl2", "sBZNPmIx"], "parties": [{"partyID": "LHdQs08J", "userIDs": ["XNYsuRBv", "zORNqYtu", "deaeleJA"]}, {"partyID": "IrbMi5PL", "userIDs": ["VRt83utv", "p14Kwb8E", "SI6N8o0E"]}, {"partyID": "9VLOKLgz", "userIDs": ["tK1ivxnL", "BuAF03Gt", "HWzwlbrx"]}]}, {"UserIDs": ["Rpcs7b02", "cmI10lrK", "cOF9tsId"], "parties": [{"partyID": "5Ld2dHR1", "userIDs": ["UkpIYCTz", "mEnM2bE3", "kiCrZiDt"]}, {"partyID": "rONZq1Nc", "userIDs": ["I1AjfePd", "VcCYiUas", "nJrg1rOG"]}, {"partyID": "Z49fzNfQ", "userIDs": ["H7d6lWwR", "7WzNosCd", "csHQPd1k"]}]}, {"UserIDs": ["YWs7VPYR", "mnK1Jmn8", "XPzMZ3jq"], "parties": [{"partyID": "EKemSeGd", "userIDs": ["I1BZoFFg", "iyjf4LHx", "QAlVXgCH"]}, {"partyID": "ytpSkCRg", "userIDs": ["MZnrTQA1", "KGIAImRp", "rpTSLNH5"]}, {"partyID": "Dfd9pAYe", "userIDs": ["TP0WiRYX", "iF5JT1za", "iIogzrRn"]}]}], "ticketIDs": ["RP6XBjRL", "LBUWm5Mf", "0WINsGET"], "type": "S5rcYdxF", "version": 44}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateGameSession' test.out

#- 19 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nXeAFfWt' \
    > test.out 2>&1
eval_tap $? 19 'DeleteGameSession' test.out

#- 20 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LhjRtwun' \
    --body '{"attributes": {"22IGNNWf": {}, "hxKrCHXJ": {}, "xZsxKrh3": {}}, "backfillTicketID": "Mzf93hR2", "clientVersion": "fnMQ5vmQ", "deployment": "pOdqXk2r", "inactiveTimeout": 24, "inviteTimeout": 41, "joinability": "Tw5xsjtc", "matchPool": "PDdQGVoF", "maxPlayers": 100, "minPlayers": 78, "requestedRegions": ["vdy2d7Zt", "pXYLPBY4", "Tfx8lzVw"], "teams": [{"UserIDs": ["45EXa4zg", "ozJ2rwV0", "yfKJToRV"], "parties": [{"partyID": "bW6P6NQx", "userIDs": ["ge0jpTrz", "RQtiTAlM", "jx2Pu19p"]}, {"partyID": "LMIaGV84", "userIDs": ["tdhgGkJG", "BVJ0v1nG", "H42expzv"]}, {"partyID": "OYjIMVOw", "userIDs": ["3HFR8Peb", "VLKEz4ec", "GsCefOyc"]}]}, {"UserIDs": ["PkCXyzPa", "HXe6PIXx", "FRdYv8Su"], "parties": [{"partyID": "pjCSfanu", "userIDs": ["o4PzCB7f", "Yxs0mRYJ", "UpTjlPLd"]}, {"partyID": "FqudWrnG", "userIDs": ["gZob7cMC", "7edaFpzL", "WPlBxidq"]}, {"partyID": "gbKPJzbS", "userIDs": ["FD1biraf", "tkIsCJYR", "S3ogeUcb"]}]}, {"UserIDs": ["q7ZPNf0D", "Yd6P47Iu", "E8OM72Bu"], "parties": [{"partyID": "ngzuaObk", "userIDs": ["dwH9P0D3", "noD6mzIB", "pCmOveio"]}, {"partyID": "cISVNgnr", "userIDs": ["5Wdk0RlH", "Ozj7pqBH", "PY1zbCCV"]}, {"partyID": "m6gAFUIq", "userIDs": ["GuYUgoeC", "nkDvtd7Z", "nFvQ1HNw"]}]}], "ticketIDs": ["p2PEpPkf", "qThGP8ax", "u7E2tgRD"], "type": "PDCeHgG0", "version": 0}' \
    > test.out 2>&1
eval_tap $? 20 'PatchUpdateGameSession' test.out

#- 21 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JjEIBTBE' \
    --body '{"userID": "7SzRSgQK"}' \
    > test.out 2>&1
eval_tap $? 21 'PublicGameSessionInvite' test.out

#- 22 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Vv9DtNtw' \
    > test.out 2>&1
eval_tap $? 22 'JoinGameSession' test.out

#- 23 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mweFrJXB' \
    > test.out 2>&1
eval_tap $? 23 'LeaveGameSession' test.out

#- 24 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'o8Thxn5S' \
    > test.out 2>&1
eval_tap $? 24 'PublicGameSessionReject' test.out

#- 25 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "TyzV3Zz6"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicPartyJoinCode' test.out

#- 26 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'P5sU6w1g' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetParty' test.out

#- 27 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'usPeIWAG' \
    --body '{"attributes": {"gZCAuNzv": {}, "FFV7p85K": {}, "nfLwEqVs": {}}, "inactiveTimeout": 74, "inviteTimeout": 66, "joinability": "l68dNsVs", "maxPlayers": 62, "minPlayers": 85, "type": "vsqGn3sR", "version": 64}' \
    > test.out 2>&1
eval_tap $? 27 'PublicUpdateParty' test.out

#- 28 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '56145gf2' \
    --body '{"attributes": {"PiiSXdIM": {}, "gOeM5NPM": {}, "9ZDc6HaD": {}}, "inactiveTimeout": 96, "inviteTimeout": 73, "joinability": "Mdth0Q2e", "maxPlayers": 86, "minPlayers": 100, "type": "rqw1VUoF", "version": 36}' \
    > test.out 2>&1
eval_tap $? 28 'PublicPatchUpdateParty' test.out

#- 29 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bNeOwJjL' \
    > test.out 2>&1
eval_tap $? 29 'PublicGeneratePartyCode' test.out

#- 30 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SVRE0K5O' \
    > test.out 2>&1
eval_tap $? 30 'PublicRevokePartyCode' test.out

#- 31 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MEb2lme2' \
    --body '{"userID": "xx4XMuWY"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyInvite' test.out

#- 32 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BKuuUQI0' \
    --body '{"leaderID": "AkDumz2q"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicPromotePartyLeader' test.out

#- 33 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KQtSlMNW' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyJoin' test.out

#- 34 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GV3SbA7O' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyLeave' test.out

#- 35 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lMUti464' \
    > test.out 2>&1
eval_tap $? 35 'PublicPartyReject' test.out

#- 36 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZDU0JlsA' \
    --userId 'O2iJPZvd' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyKick' test.out

#- 37 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"XwDurfwl": {}, "6KOhbeID": {}, "HWbVdAwt": {}}, "configurationName": "8S432DDj", "inactiveTimeout": 84, "inviteTimeout": 100, "joinability": "diiaLw3q", "maxPlayers": 47, "members": [{"ID": "vAvusLZG", "PlatformID": "ceY6eMZA", "PlatformUserID": "SYXLFmup"}, {"ID": "gUA3traq", "PlatformID": "Gc9x9kNx", "PlatformUserID": "UP3dhlI5"}, {"ID": "eF8sWjzV", "PlatformID": "vQqdbvSl", "PlatformUserID": "TjXieZD5"}], "minPlayers": 4, "textChat": false, "type": "7ReZZPLh"}' \
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
    --body '{"crossplayEnabled": true, "data": {"g5aU2rIo": {}, "yq2M5MK5": {}, "8eqAzLIM": {}}, "platforms": [{"name": "Dj4Ngh3W", "userID": "TDOnMep9"}, {"name": "bawZej5A", "userID": "dGNGL2AG"}, {"name": "O35O8yuE", "userID": "ZyBgUiOu"}]}' \
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
    --order 'XCNDGYTD' \
    --orderBy 'cObxiWri' \
    --status 'Nqps83kK' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryMyGameSessions' test.out

#- 42 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'NiU1pZk3' \
    --orderBy 'O8QMNXRm' \
    --status 'P7TE8472' \
    > test.out 2>&1
eval_tap $? 42 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE