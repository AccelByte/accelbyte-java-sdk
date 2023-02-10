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
    --body '{"clientVersion": "taE2cxV9", "deployment": "PpYUPF1k", "inactiveTimeout": 29, "inviteTimeout": 32, "joinability": "QcTjEfW2", "maxPlayers": 10, "minPlayers": 47, "name": "Iq4tCZK1", "requestedRegions": ["AXMeDc4R", "CaNYTVNx", "TZOHG53m"], "textChat": false, "type": "nquLzENH"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'gWg17cIW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'ElGOOBAf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "BahSiHlP", "deployment": "113O7BCU", "inactiveTimeout": 79, "inviteTimeout": 1, "joinability": "uYBLPKlk", "maxPlayers": 96, "minPlayers": 52, "name": "dQPfZZvw", "requestedRegions": ["gLvAv7bq", "QWezRx0c", "Pn8WG5S4"], "textChat": false, "type": "U4Edsxka"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'UOnBc6aq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '4SubF3Vc' \
    --dsPodName 'S36lDAXW' \
    --fromTime '85oOi7T9' \
    --gameMode 'yY0HfFpF' \
    --isSoftDeleted 'mTCfoNtt' \
    --joinability 'ImFxUqdk' \
    --limit '74' \
    --matchPool 'h7nmuOEm' \
    --memberID '1Y1d5cYM' \
    --offset '69' \
    --order 'CzW6Qd5F' \
    --orderBy 'wospEjfS' \
    --sessionID 'ikvivaKQ' \
    --status 'sYZPn197' \
    --statusV2 'FGPN1Uve' \
    --toTime 'jRwWMacp' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'v48dT023' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '24qDv3ky' \
    --statusType 'nT8ElXTS' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'otiYJ5Cu' \
    --key '8R23h2hm' \
    --leaderID '8uEGG84W' \
    --limit '73' \
    --memberID 'n3D9J02b' \
    --memberStatus 'nthXqPmv' \
    --offset '91' \
    --order 'zvaPwAlJ' \
    --orderBy 'zvS5xdoi' \
    --value 'fnZ0wCeO' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '8GvmwY5P' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryPlayerAttributes' test.out

#- 13 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'vkJByDLO' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerAttributes' test.out

#- 14 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"MSx0YX6e": {}, "NTrUWeRV": {}, "Hbbky9T1": {}}, "backfillTicketID": "mAvaXXJc", "clientVersion": "hTZr3e8F", "configurationName": "D8bSRsXn", "deployment": "QJARYNOa", "inactiveTimeout": 18, "inviteTimeout": 61, "joinability": "64MJDytF", "matchPool": "qctAskpd", "maxPlayers": 11, "minPlayers": 33, "requestedRegions": ["WkKlQULj", "LzfZ5WdE", "9AkaI46A"], "serverName": "6NAD1dhN", "teams": [{"UserIDs": ["5bfkCTKX", "LTqxI9So", "NWvkpudG"], "parties": [{"partyID": "A7dGWO60", "userIDs": ["rAHU3zhf", "ize9GCYO", "6v3bWjhi"]}, {"partyID": "fDYVtHkc", "userIDs": ["Jn3niKup", "H3BXfFFS", "rakue2jS"]}, {"partyID": "9QAy6ktV", "userIDs": ["mAfyoDZr", "EhEeXN6z", "ZGh9oQWX"]}]}, {"UserIDs": ["9auJrSVY", "FpMj3QX8", "gCxSFwc1"], "parties": [{"partyID": "iEFVQIM7", "userIDs": ["Y6MrXcva", "lvpG9dgI", "Nw9AF4Rv"]}, {"partyID": "l9KqzIxe", "userIDs": ["r5eLzAd7", "DWB2ld19", "PHRcxI8G"]}, {"partyID": "dA1AwApY", "userIDs": ["xPbQSuS3", "8m2Ul7Ql", "7mmJ25Vh"]}]}, {"UserIDs": ["fFovKGLR", "8J6afknv", "vqKl7T07"], "parties": [{"partyID": "AFpGH5lE", "userIDs": ["bbS731UC", "3lxNof4J", "94DMsFxy"]}, {"partyID": "QdoXfpY1", "userIDs": ["zZXHBrQT", "MHhhSGgu", "mcLhhPYP"]}, {"partyID": "ILkrLZKj", "userIDs": ["MJwauyP1", "LlgUSQIP", "kGqGurJU"]}]}], "textChat": true, "ticketIDs": ["iGPBZ8SU", "pQrzCDTS", "05v6RMcv"], "type": "ghISPHUN"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateGameSession' test.out

#- 15 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"c1dMn5fg": {}, "X6Tboh0O": {}, "c06SjKsF": {}}' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessions' test.out

#- 16 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'iBOA7a6G' \
    > test.out 2>&1
eval_tap $? 16 'GetGameSessionByPodName' test.out

#- 17 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iw6NuKUk' \
    > test.out 2>&1
eval_tap $? 17 'GetGameSession' test.out

#- 18 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nB1PA3sR' \
    --body '{"attributes": {"g7MRoNk7": {}, "hpIbTdPO": {}, "5ZtsSVcg": {}}, "backfillTicketID": "Dir6INXc", "clientVersion": "mLVDgxCo", "deployment": "m3Ly2Wil", "inactiveTimeout": 5, "inviteTimeout": 43, "joinability": "UFqIruBb", "matchPool": "lDwDXML0", "maxPlayers": 65, "minPlayers": 39, "requestedRegions": ["PL7hZuJE", "U5YRwCOG", "l8l6DERN"], "teams": [{"UserIDs": ["6s8ZG7AD", "Kre8ebua", "6YbLMOI5"], "parties": [{"partyID": "iWIbkmyr", "userIDs": ["icLb08bM", "AUnu3ezk", "bBtFRAns"]}, {"partyID": "l7WgAuRV", "userIDs": ["0wpi1IRB", "FDnhFWEX", "Ygb29Z1Z"]}, {"partyID": "sYKNqH8H", "userIDs": ["wSLLNbKd", "BxMRufgQ", "TbdvxbG7"]}]}, {"UserIDs": ["qjPPEGPo", "yKYlvBUi", "9PVqLKMs"], "parties": [{"partyID": "8FMyiW9A", "userIDs": ["mtYzAX2c", "OePAZ2uw", "zPR5JuF0"]}, {"partyID": "iLE4wMEA", "userIDs": ["Krr0cpPQ", "tWUHx3JF", "3SssCCbS"]}, {"partyID": "GofDyjG3", "userIDs": ["5w2eGIIi", "6W6wfWtT", "dB61SeRc"]}]}, {"UserIDs": ["gUXLTtbB", "sfB3HbP4", "3GW4sAgT"], "parties": [{"partyID": "qX5duVSd", "userIDs": ["yLOwNXNj", "DBVwUsSp", "wvDZlYFa"]}, {"partyID": "MA22pNfZ", "userIDs": ["OnF5S0Pk", "CcV4ZMmq", "jVpMVCWg"]}, {"partyID": "bu6CcPcf", "userIDs": ["WvEJZuXO", "PjTeP0Gv", "tAXuZyib"]}]}], "ticketIDs": ["ewQL13qU", "IsJIRx0t", "N3dDOHcc"], "type": "8bok3F3F", "version": 71}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateGameSession' test.out

#- 19 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9apKg1MX' \
    > test.out 2>&1
eval_tap $? 19 'DeleteGameSession' test.out

#- 20 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'S5JBqOfv' \
    --body '{"attributes": {"KAJGeqlo": {}, "uibrrjd3": {}, "zsvZp1pX": {}}, "backfillTicketID": "OJ9x1MfE", "clientVersion": "EOopDLSt", "deployment": "8nuawD1B", "inactiveTimeout": 24, "inviteTimeout": 77, "joinability": "yzz3D5VT", "matchPool": "8dWunXE2", "maxPlayers": 66, "minPlayers": 27, "requestedRegions": ["2nYmEVnq", "hrl3RU8I", "pyfMPWxw"], "teams": [{"UserIDs": ["o6BXF4Og", "XafM96hD", "ag5uthm3"], "parties": [{"partyID": "8rrcCZDI", "userIDs": ["5hZ3KTRi", "VXb4PF6I", "uf6hY0zP"]}, {"partyID": "ZV4bV2Y2", "userIDs": ["oVdCn1Qg", "rnMi02YV", "dkRtc7Xd"]}, {"partyID": "kwTzOpd5", "userIDs": ["ur2d72ld", "2s7RfseH", "OUXExRDa"]}]}, {"UserIDs": ["Ycenfukb", "rfgiyDii", "GfQ97GZZ"], "parties": [{"partyID": "5XVoeQhh", "userIDs": ["qdnfqBnh", "C4U3Sd9C", "PJHMtuAy"]}, {"partyID": "bfjEb93T", "userIDs": ["mWxclN2h", "aQU58Wl2", "ROzVbFE6"]}, {"partyID": "CcrGn033", "userIDs": ["FDDmHvZc", "V5FOGo39", "FbwAI0D8"]}]}, {"UserIDs": ["tzn5wVEl", "qqLTqAac", "U1xDAZx3"], "parties": [{"partyID": "kkjEhVk0", "userIDs": ["oiQgQg6l", "LXfDTagr", "HdPMxgnZ"]}, {"partyID": "GleMCisX", "userIDs": ["x16LueBt", "G0PUF2X3", "icMRQMkB"]}, {"partyID": "dscNVCvs", "userIDs": ["NezxVErc", "QKA81Mrw", "r5FbadCf"]}]}], "ticketIDs": ["NzLiVShp", "l8NlpE1Y", "z6xSLBrq"], "type": "l3myPUaC", "version": 92}' \
    > test.out 2>&1
eval_tap $? 20 'PatchUpdateGameSession' test.out

#- 21 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'x40OAwgH' \
    --body '{"userID": "UOfo70JI"}' \
    > test.out 2>&1
eval_tap $? 21 'PublicGameSessionInvite' test.out

#- 22 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KKfKoeHx' \
    > test.out 2>&1
eval_tap $? 22 'JoinGameSession' test.out

#- 23 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'j9P9bz58' \
    > test.out 2>&1
eval_tap $? 23 'LeaveGameSession' test.out

#- 24 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Um0EJ0de' \
    > test.out 2>&1
eval_tap $? 24 'PublicGameSessionReject' test.out

#- 25 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "R6C4Dz36"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicPartyJoinCode' test.out

#- 26 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UxJCR00O' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetParty' test.out

#- 27 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BpOKjJBH' \
    --body '{"attributes": {"RVy7blzg": {}, "hy77tLzN": {}, "f1SXhBGb": {}}, "inactiveTimeout": 70, "inviteTimeout": 4, "joinability": "rvdupwkn", "maxPlayers": 79, "minPlayers": 81, "type": "JDcI9WtB", "version": 72}' \
    > test.out 2>&1
eval_tap $? 27 'PublicUpdateParty' test.out

#- 28 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EqBrPUvN' \
    --body '{"attributes": {"BmQEoBpE": {}, "2KCMmpfX": {}, "kgKVTM1E": {}}, "inactiveTimeout": 28, "inviteTimeout": 81, "joinability": "GNOUl3Sm", "maxPlayers": 2, "minPlayers": 61, "type": "2Ew7UnL9", "version": 15}' \
    > test.out 2>&1
eval_tap $? 28 'PublicPatchUpdateParty' test.out

#- 29 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OKH4k7zn' \
    > test.out 2>&1
eval_tap $? 29 'PublicGeneratePartyCode' test.out

#- 30 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '8NLhHcai' \
    > test.out 2>&1
eval_tap $? 30 'PublicRevokePartyCode' test.out

#- 31 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hr0d48qr' \
    --body '{"userID": "wlOs3DNM"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyInvite' test.out

#- 32 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pttMWXNh' \
    --body '{"leaderID": "UMMiXC0H"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicPromotePartyLeader' test.out

#- 33 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sLfBGEtA' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyJoin' test.out

#- 34 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ibb5BY4r' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyLeave' test.out

#- 35 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aSmyf8k5' \
    > test.out 2>&1
eval_tap $? 35 'PublicPartyReject' test.out

#- 36 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qW39dSz0' \
    --userId 'Z6OTmVk0' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyKick' test.out

#- 37 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"UIadkkda": {}, "M67qv8Ux": {}, "Tuf9FeWu": {}}, "configurationName": "7F2hELuu", "inactiveTimeout": 61, "inviteTimeout": 72, "joinability": "6W1ld21H", "maxPlayers": 12, "members": [{"ID": "DT5sdcHD", "PlatformID": "peZ1ghEm", "PlatformUserID": "UikMcbAw"}, {"ID": "XCPgyL0R", "PlatformID": "AQvcCPhk", "PlatformUserID": "iS4Tmtpm"}, {"ID": "B7aX4CGz", "PlatformID": "6FCVfAFY", "PlatformUserID": "LgpsjtNM"}], "minPlayers": 45, "textChat": false, "type": "d5zlzuCj"}' \
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
    --body '{"crossplayEnabled": false, "data": {"YhDfmT71": {}, "rW9oRM7U": {}, "5hDEUkgs": {}}, "platforms": [{"name": "llc2ErGY", "userID": "zf8ZAzfq"}, {"name": "rxPemmEc", "userID": "o3UKMoqk"}, {"name": "Z5xxMc3p", "userID": "QOlgtdfW"}]}' \
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
    --order '0Ti14kqN' \
    --orderBy 'UfAbijWP' \
    --status 'RxRhVLLS' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryMyGameSessions' test.out

#- 42 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'iGe8VVY5' \
    --orderBy '18nWXhff' \
    --status 'Eh4a7KBN' \
    > test.out 2>&1
eval_tap $? 42 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE