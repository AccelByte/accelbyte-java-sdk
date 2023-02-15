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
    --body '{"clientVersion": "cusUhERl", "deployment": "NAW3hxDA", "inactiveTimeout": 21, "inviteTimeout": 47, "joinability": "0EhW0GQq", "maxPlayers": 33, "minPlayers": 75, "name": "toNMQkFx", "requestedRegions": ["mHYhxuBx", "8rBnvVVf", "CEkrP6tc"], "textChat": true, "type": "iZAdaKfZ"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'XpXrHDsU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'nblYUkAF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "KCIQBCIm", "deployment": "3CWpEsHI", "inactiveTimeout": 71, "inviteTimeout": 85, "joinability": "whQTwqAT", "maxPlayers": 92, "minPlayers": 72, "name": "jcnIhJRu", "requestedRegions": ["MmkRISsm", "gobtpAPj", "rwTGuByH"], "textChat": false, "type": "KKZvxYJo"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'IGSDfM2r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'vMcIlTWZ' \
    --dsPodName 'XNYZVX6m' \
    --fromTime 'CtqBgqfC' \
    --gameMode 'vyRywnfj' \
    --isSoftDeleted 'DAcZrYl8' \
    --joinability 'wIES7iD8' \
    --limit '30' \
    --matchPool 'yfd2M2S0' \
    --memberID 'uxxCM7NP' \
    --offset '77' \
    --order 'jdmelHDn' \
    --orderBy 'jyr5O3wv' \
    --sessionID 'iGzZqaGY' \
    --status 'WmBApWXr' \
    --statusV2 'NFiaeipI' \
    --toTime '9BBRO5IE' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'Q4rdxPaq' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jsKaB91s' \
    --statusType 'ImWhvY5d' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability '7yDn869r' \
    --key 'xvc6oNqK' \
    --leaderID 'c1wLtFQa' \
    --limit '91' \
    --memberID 'gSHCKe4N' \
    --memberStatus 'gVAbkQtf' \
    --offset '58' \
    --order 'VvRU505B' \
    --orderBy 'YhhYrB27' \
    --value 'lELiYpDd' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'NEeZYCe1' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryPlayerAttributes' test.out

#- 13 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJW0m6fU' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerAttributes' test.out

#- 14 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"0clYZ9Ez": {}, "AKv4kXae": {}, "QDvbc5vg": {}}, "backfillTicketID": "CvGsYDbh", "clientVersion": "cwxcDExw", "configurationName": "PYY7tgrq", "deployment": "UMwwJEXQ", "inactiveTimeout": 99, "inviteTimeout": 4, "joinability": "fvbMh5lW", "matchPool": "f3KH1UMA", "maxPlayers": 75, "minPlayers": 14, "requestedRegions": ["9x1UB6JN", "95AhOvvm", "Aqic5pwb"], "serverName": "nMei7XQd", "teams": [{"UserIDs": ["Osl9xMbo", "pXQiaCT3", "ACTM3FOZ"], "parties": [{"partyID": "wBFy0puJ", "userIDs": ["Fi1hRPwH", "sPxQkhBO", "DkC61Qhk"]}, {"partyID": "t1uQwjgD", "userIDs": ["70sx84hw", "CZZ5v4Os", "nuMSTznk"]}, {"partyID": "QFAZnLCZ", "userIDs": ["19q6r4Mr", "XDC2Gaik", "MihlLPeH"]}]}, {"UserIDs": ["jTemr4yn", "dUxUkAix", "SHn5maoW"], "parties": [{"partyID": "AiewHgth", "userIDs": ["QzqkELNO", "ycfl7cCm", "hcdguHXR"]}, {"partyID": "PXAW9xBv", "userIDs": ["gBl63Hll", "eVRZSuWH", "6pw2T55E"]}, {"partyID": "npwkCGM5", "userIDs": ["jCBDZTKe", "3ljVDmN5", "DlFVExkU"]}]}, {"UserIDs": ["WydaOgRs", "3KEznJAF", "H2Oiv0zp"], "parties": [{"partyID": "OT6Gn7w8", "userIDs": ["iqZgGS7c", "it3Dvxvq", "szyt544s"]}, {"partyID": "wzJbq0eY", "userIDs": ["xsylA02K", "zit9RvPs", "iTy5UsdS"]}, {"partyID": "ixx0gB4d", "userIDs": ["t9Ty1uJt", "TgOIm49z", "0808rJZg"]}]}], "textChat": true, "ticketIDs": ["j40LuDwY", "0hhnAw4U", "gfxBoBPR"], "type": "low3RJaD"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateGameSession' test.out

#- 15 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"NoKrDrK1": {}, "N0yMklld": {}, "MB5YmOKk": {}}' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessions' test.out

#- 16 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'UY1xrUCk' \
    > test.out 2>&1
eval_tap $? 16 'GetGameSessionByPodName' test.out

#- 17 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OytTP20V' \
    > test.out 2>&1
eval_tap $? 17 'GetGameSession' test.out

#- 18 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'R0xM3Mow' \
    --body '{"attributes": {"tl18IphQ": {}, "Ufvk5Mmv": {}, "PvG5roOe": {}}, "backfillTicketID": "QZJ4Ofir", "clientVersion": "QiUyVkc2", "deployment": "26STXsd4", "inactiveTimeout": 7, "inviteTimeout": 100, "joinability": "9sQ3kwrT", "matchPool": "SWuQGMXD", "maxPlayers": 9, "minPlayers": 20, "requestedRegions": ["R9NJhGrK", "ovFM6Z0c", "xpIZzsx1"], "teams": [{"UserIDs": ["6uZISbJK", "CLSTWS9P", "4eCzmsll"], "parties": [{"partyID": "L9aVG4i3", "userIDs": ["jPWV3PPE", "SarMOcyS", "lIYh92C5"]}, {"partyID": "2rYFdg1f", "userIDs": ["qb8BuDqY", "zbYjTm1l", "88Lvr1vY"]}, {"partyID": "hp9oMmwx", "userIDs": ["gQCZxugs", "HdxFgyKc", "q2w0AqCm"]}]}, {"UserIDs": ["2KBoHRXC", "wsQTdiAD", "aqVlG7QY"], "parties": [{"partyID": "dju3Fh2u", "userIDs": ["hh95goDC", "CliBUE7J", "zMC165gj"]}, {"partyID": "BnXadD0v", "userIDs": ["CURL2E5v", "X5kSqFji", "04hWIY6M"]}, {"partyID": "Q5VLNhwa", "userIDs": ["MF8txu89", "3eLLkCC0", "TiPEcVQt"]}]}, {"UserIDs": ["jmVohbxv", "oL1r0NWs", "zRhHsjGV"], "parties": [{"partyID": "zegEY1c9", "userIDs": ["P7R1cEuR", "dpw5tEZ6", "WmQb2BQf"]}, {"partyID": "V2lv0fEf", "userIDs": ["SlRWv4xg", "L6C8N5Gv", "Yw3Z48kw"]}, {"partyID": "cUlxwNHT", "userIDs": ["MtMre4Pw", "YMVLotrv", "YK0pY3m1"]}]}], "ticketIDs": ["yOmhO9bs", "EZADCcLE", "hf8BJvRu"], "type": "inDM3aWb", "version": 41}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateGameSession' test.out

#- 19 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ucqmcEZx' \
    > test.out 2>&1
eval_tap $? 19 'DeleteGameSession' test.out

#- 20 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CvXXawUA' \
    --body '{"attributes": {"Zq3gciiA": {}, "U5W7ZZb7": {}, "pTYDdTyH": {}}, "backfillTicketID": "7SofcLbL", "clientVersion": "YifeluJx", "deployment": "O8FOvVBw", "inactiveTimeout": 92, "inviteTimeout": 5, "joinability": "DlS4KYOb", "matchPool": "LnSnjLBK", "maxPlayers": 4, "minPlayers": 79, "requestedRegions": ["UnNedwWz", "oA9WYPuW", "h1A0xJ0s"], "teams": [{"UserIDs": ["FMsV0Avi", "I9vTOl2X", "OJnrWwS8"], "parties": [{"partyID": "lLpmGv9R", "userIDs": ["eQYBYTEc", "lqYkwYPq", "ZJhgR4YK"]}, {"partyID": "tAMarcEE", "userIDs": ["Wi0iajeH", "Tm2Uurc6", "Tv8cqNmo"]}, {"partyID": "9EYpHkpC", "userIDs": ["Z9iFeiw5", "9L55q73M", "sZ4KyoYB"]}]}, {"UserIDs": ["502g587y", "VB0IUQGF", "WJf1lDAX"], "parties": [{"partyID": "fpocUkmT", "userIDs": ["FU7KbPyP", "vo3Qmgue", "s5ztYX8l"]}, {"partyID": "2psJTNaV", "userIDs": ["3q3SrnKh", "EA9PrLPW", "0PCaVYF7"]}, {"partyID": "VMZjGOsn", "userIDs": ["ndepEaSL", "5yM379g5", "jImBLukx"]}]}, {"UserIDs": ["OmpDauhV", "zXQTWaXc", "sjwsKxUe"], "parties": [{"partyID": "w7zgzNVz", "userIDs": ["EU9qu7AG", "O1pelYqS", "YNjLSRNn"]}, {"partyID": "LlJwoGfK", "userIDs": ["ZM4bbyoE", "nekkuYgw", "iXGPAew0"]}, {"partyID": "jU6dPefD", "userIDs": ["VGQDzNag", "MzjoKfb1", "R7cctXms"]}]}], "ticketIDs": ["cI6ytCC9", "DNYYaySO", "TkFhu4Oq"], "type": "MT9Ykq2b", "version": 5}' \
    > test.out 2>&1
eval_tap $? 20 'PatchUpdateGameSession' test.out

#- 21 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EftoZeGP' \
    --body '{"userID": "GVoLBazp"}' \
    > test.out 2>&1
eval_tap $? 21 'PublicGameSessionInvite' test.out

#- 22 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iWnLXNni' \
    > test.out 2>&1
eval_tap $? 22 'JoinGameSession' test.out

#- 23 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eDmEhqwQ' \
    > test.out 2>&1
eval_tap $? 23 'LeaveGameSession' test.out

#- 24 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DXIjaYZD' \
    > test.out 2>&1
eval_tap $? 24 'PublicGameSessionReject' test.out

#- 25 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Uumbtbz1"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicPartyJoinCode' test.out

#- 26 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'C4B99cEF' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetParty' test.out

#- 27 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DpZLFiI5' \
    --body '{"attributes": {"JkLBBUTo": {}, "Nog2xONd": {}, "d65lRCpd": {}}, "inactiveTimeout": 38, "inviteTimeout": 28, "joinability": "RRGdQuvp", "maxPlayers": 71, "minPlayers": 30, "type": "AnGv14Mj", "version": 53}' \
    > test.out 2>&1
eval_tap $? 27 'PublicUpdateParty' test.out

#- 28 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MpoL8spR' \
    --body '{"attributes": {"u2ALfKYE": {}, "x7fAKpBo": {}, "waapPQ6a": {}}, "inactiveTimeout": 93, "inviteTimeout": 33, "joinability": "pMtm0DiR", "maxPlayers": 86, "minPlayers": 36, "type": "CyhUR6nT", "version": 88}' \
    > test.out 2>&1
eval_tap $? 28 'PublicPatchUpdateParty' test.out

#- 29 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LPAfpBN6' \
    > test.out 2>&1
eval_tap $? 29 'PublicGeneratePartyCode' test.out

#- 30 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FHPGPAb7' \
    > test.out 2>&1
eval_tap $? 30 'PublicRevokePartyCode' test.out

#- 31 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'G3NeCCT5' \
    --body '{"userID": "AQzSLSe6"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyInvite' test.out

#- 32 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Jzk5vKgv' \
    --body '{"leaderID": "69zdBvuq"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicPromotePartyLeader' test.out

#- 33 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '9v8paGUK' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyJoin' test.out

#- 34 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'epPuLB5b' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyLeave' test.out

#- 35 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'g1GluRNd' \
    > test.out 2>&1
eval_tap $? 35 'PublicPartyReject' test.out

#- 36 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WoKzZVRI' \
    --userId 'MPNjSM70' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyKick' test.out

#- 37 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"cjd4a5Nr": {}, "lI34wAOA": {}, "v6FkqTC4": {}}, "configurationName": "6TMbZrbl", "inactiveTimeout": 9, "inviteTimeout": 45, "joinability": "tNtdfeIf", "maxPlayers": 67, "members": [{"ID": "IgKlaWpF", "PlatformID": "E06pcT8r", "PlatformUserID": "RvHUd04c"}, {"ID": "qRs16s6E", "PlatformID": "VpZHQDN0", "PlatformUserID": "XPrDJok6"}, {"ID": "h7NJQFjG", "PlatformID": "rkyq90Lz", "PlatformUserID": "qMl5ZKeL"}], "minPlayers": 40, "textChat": true, "type": "Y5rQF94Q"}' \
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
    --body '{"crossplayEnabled": true, "data": {"QzRT0srP": {}, "ZYM8Q5AK": {}, "Kz6s8CTc": {}}, "platforms": [{"name": "cuWtPe0K", "userID": "SIpNlHw0"}, {"name": "tkdTcBQb", "userID": "lRAjpihy"}, {"name": "aQAvSiNN", "userID": "jx45QeWh"}]}' \
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
    --order 'zOSblQnd' \
    --orderBy 'nIUdPrsj' \
    --status 'ZdY2fFsy' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryMyGameSessions' test.out

#- 42 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'xSR9NaaV' \
    --orderBy '8EnRwHnH' \
    --status 'fYriMn3x' \
    > test.out 2>&1
eval_tap $? 42 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE