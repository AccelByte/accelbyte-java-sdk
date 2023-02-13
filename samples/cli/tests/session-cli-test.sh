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
    --body '{"clientVersion": "bwFUVxit", "deployment": "OR3Egy8h", "inactiveTimeout": 7, "inviteTimeout": 28, "joinability": "954A1P75", "maxPlayers": 23, "minPlayers": 68, "name": "zP3OedpF", "requestedRegions": ["21v7Iap7", "e2dj2S9d", "74qqomwa"], "textChat": true, "type": "p0t0kcKd"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '1vsDoSKA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'Q21giNM9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "SAcj4TJW", "deployment": "8hwIbT9X", "inactiveTimeout": 82, "inviteTimeout": 11, "joinability": "FsoyySMv", "maxPlayers": 43, "minPlayers": 23, "name": "h3CdzN8C", "requestedRegions": ["x4kTpCRC", "9DEQ7vu4", "nUGGv9bF"], "textChat": false, "type": "5kL66CA7"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'S2eq2vhl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'VwRN2uAX' \
    --dsPodName 'QCVqndbe' \
    --fromTime 'ciPxpQ3U' \
    --gameMode '1yAJO860' \
    --isSoftDeleted 'YOJWkgSt' \
    --joinability '5rp5ggh3' \
    --limit '46' \
    --matchPool 'PJs8OmXM' \
    --memberID 'fQBAdW7g' \
    --offset '86' \
    --order 'cuSCgAbr' \
    --orderBy 'KYxPZ3d8' \
    --sessionID 'qJ986drd' \
    --status 'Wtqj1fLg' \
    --statusV2 '9kSs9P9T' \
    --toTime 'JLu1fzR6' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '6fBbeBw0' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ehl8FkW2' \
    --statusType 'TrSXWKpP' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'fGPdAn5T' \
    --key 'DNtvUJeg' \
    --leaderID 'LeSsAvdQ' \
    --limit '67' \
    --memberID 'IpWqNnY8' \
    --memberStatus 'xhq0qxrp' \
    --offset '42' \
    --order '0D5xuolu' \
    --orderBy 'LDihRZUT' \
    --value 'A1qprd5j' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'RsTb7McE' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryPlayerAttributes' test.out

#- 13 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'CgtPhhrj' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerAttributes' test.out

#- 14 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"1R3yeN64": {}, "F54CL7mp": {}, "LEvgq0tD": {}}, "backfillTicketID": "IYjFdDrU", "clientVersion": "7596Olpl", "configurationName": "qZnVzHTn", "deployment": "FcIA9Jbf", "inactiveTimeout": 88, "inviteTimeout": 16, "joinability": "llKCxRS3", "matchPool": "HKB3aNZz", "maxPlayers": 81, "minPlayers": 25, "requestedRegions": ["ZRGnXzVq", "fzfECXzr", "KLYT6odW"], "serverName": "fELPz8Tz", "teams": [{"UserIDs": ["odHMGLLR", "maReh6Tb", "IgaBYoGV"], "parties": [{"partyID": "snNKXbfo", "userIDs": ["FEzheKoz", "55P6Hee3", "sMxbodh2"]}, {"partyID": "kVmxHVzo", "userIDs": ["GGxkH4xD", "sUnjZAZq", "lmPCC6JV"]}, {"partyID": "Xc9Tk8VW", "userIDs": ["eRnpM3mW", "CP2nSsGF", "U0bm58FS"]}]}, {"UserIDs": ["q3YvgA4N", "oKFnNqZl", "KjD1Q4H7"], "parties": [{"partyID": "ob2pjMdX", "userIDs": ["PJ5E1ikl", "bV3m1XMY", "mqTJgzkV"]}, {"partyID": "yzZhL2nA", "userIDs": ["XGRPHKal", "PLAxRecm", "gX7Dxetu"]}, {"partyID": "6FSivDQd", "userIDs": ["1VDSSM2G", "DV5wYZDr", "o5apbnzQ"]}]}, {"UserIDs": ["OpV6VAf1", "Tf2oxGdp", "qxbQy6L9"], "parties": [{"partyID": "DvWhNvuk", "userIDs": ["zPMC85Qq", "0Qm1pSKU", "djYDvPuE"]}, {"partyID": "fLpWyzeV", "userIDs": ["ksr5YsPR", "vFFjJDxq", "v1fGvdm8"]}, {"partyID": "SWt5Bogv", "userIDs": ["0OgTiW18", "pOT5os0S", "xSPJGetH"]}]}], "textChat": false, "ticketIDs": ["Z2vEVRYU", "sjz7lkab", "Q95UXNCV"], "type": "BRkMSBeM"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateGameSession' test.out

#- 15 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"3offo0Cs": {}, "3bDfAYMr": {}, "JuIhg2GS": {}}' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessions' test.out

#- 16 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '9uscxqEA' \
    > test.out 2>&1
eval_tap $? 16 'GetGameSessionByPodName' test.out

#- 17 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ixr1RAbj' \
    > test.out 2>&1
eval_tap $? 17 'GetGameSession' test.out

#- 18 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5oKy7diI' \
    --body '{"attributes": {"3Yn4drvS": {}, "rytauYAs": {}, "KZxDif4m": {}}, "backfillTicketID": "z8byLRiw", "clientVersion": "hl7t4Xs0", "deployment": "jhvCsOGp", "inactiveTimeout": 43, "inviteTimeout": 28, "joinability": "ZLdRk4Bk", "matchPool": "WKb2icEl", "maxPlayers": 96, "minPlayers": 35, "requestedRegions": ["fOxqAebc", "ZGrfS4oE", "NFGYdGXj"], "teams": [{"UserIDs": ["SWqPeaXV", "9KGBNMff", "wgFprogY"], "parties": [{"partyID": "7NhwrvBt", "userIDs": ["y4IuNTDj", "MbrR0xrg", "3px3aDyP"]}, {"partyID": "PhwA07WD", "userIDs": ["Vk8XSx7X", "1sFpH662", "ZyqOBzEZ"]}, {"partyID": "70tZAPT5", "userIDs": ["s3UuAdeP", "WSTmU6jr", "miYlr0ks"]}]}, {"UserIDs": ["74MN7uZB", "NiarI1M0", "Jj4XaVnZ"], "parties": [{"partyID": "YyilyNAM", "userIDs": ["3ZsYzbrg", "LG67iMe0", "V4Cv34TE"]}, {"partyID": "Rlqbt6NA", "userIDs": ["pHHSukpq", "vEehYx33", "4ElCSAtM"]}, {"partyID": "zJ2Kdi3w", "userIDs": ["lg6gFZfo", "eeRdZrPU", "dQMpyeWW"]}]}, {"UserIDs": ["5XkfS0DY", "STzIUzeK", "EVLqQuXM"], "parties": [{"partyID": "QCAO7QDq", "userIDs": ["1vXofkQW", "mjIHzzBs", "MIWcCcAe"]}, {"partyID": "zDdwovat", "userIDs": ["h1CjCVBJ", "olsUDzZ1", "mYssj5nw"]}, {"partyID": "UTfmAFbE", "userIDs": ["WOqJtNSq", "48pwAU9C", "Lkp9S8Af"]}]}], "ticketIDs": ["3a9Ns1Kx", "RuSrLyGz", "K28E7nxG"], "type": "WsLjWpTM", "version": 8}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateGameSession' test.out

#- 19 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JVXY73ON' \
    > test.out 2>&1
eval_tap $? 19 'DeleteGameSession' test.out

#- 20 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MjwSPJU3' \
    --body '{"attributes": {"IFVzdsyA": {}, "4rnyXiEz": {}, "xAMfQVbk": {}}, "backfillTicketID": "2N6YiFvC", "clientVersion": "NHDPCkps", "deployment": "qD9VIpyj", "inactiveTimeout": 52, "inviteTimeout": 35, "joinability": "scI0014a", "matchPool": "dUYjiTqN", "maxPlayers": 62, "minPlayers": 16, "requestedRegions": ["FnSKs0Cj", "Fl8ZS32e", "uRaUAbxa"], "teams": [{"UserIDs": ["ftE10HhL", "8CRu8rQ8", "QMqbBDiU"], "parties": [{"partyID": "Vm0UjD1i", "userIDs": ["a9SbPwt4", "WUY7S03C", "LzsBY6p8"]}, {"partyID": "IyCxTSNj", "userIDs": ["ymBadZM4", "IxEGq9qU", "v3fuww14"]}, {"partyID": "kceMSqmd", "userIDs": ["9mLT9DRQ", "FCZkSP8O", "9GsrZASC"]}]}, {"UserIDs": ["U1xVZ9op", "o7OWm5MO", "GYEOdy8O"], "parties": [{"partyID": "KLVV4EVa", "userIDs": ["5nq1C5ya", "YTaKuAkx", "MBdmtUA8"]}, {"partyID": "CQfWmlrk", "userIDs": ["lUBybWpY", "j8HDos5p", "mOKuVrK0"]}, {"partyID": "EqxVQgtw", "userIDs": ["NwzAr955", "ud3B0KVq", "U8fWxjWl"]}]}, {"UserIDs": ["lJt8LaLn", "efnSP6F9", "jvgtT1gM"], "parties": [{"partyID": "CCP1iFmO", "userIDs": ["upA3cA0j", "hFEStSB6", "eAR11dfy"]}, {"partyID": "hBDe7KoG", "userIDs": ["8GPQI1wE", "CPevxE0N", "Qx04RtW7"]}, {"partyID": "9qbDdRfe", "userIDs": ["APZAPJKD", "nDpDulLh", "aZdbmICY"]}]}], "ticketIDs": ["R9xtQ5bq", "cJ9UuILD", "NVT7iE2N"], "type": "Oysb5D7O", "version": 30}' \
    > test.out 2>&1
eval_tap $? 20 'PatchUpdateGameSession' test.out

#- 21 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gMKTq7rT' \
    --body '{"userID": "s5za8i4X"}' \
    > test.out 2>&1
eval_tap $? 21 'PublicGameSessionInvite' test.out

#- 22 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tNiuBsXO' \
    > test.out 2>&1
eval_tap $? 22 'JoinGameSession' test.out

#- 23 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'E4VeY4DE' \
    > test.out 2>&1
eval_tap $? 23 'LeaveGameSession' test.out

#- 24 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z9S5koHU' \
    > test.out 2>&1
eval_tap $? 24 'PublicGameSessionReject' test.out

#- 25 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ijvGRDGC"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicPartyJoinCode' test.out

#- 26 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QZtALpGf' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetParty' test.out

#- 27 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Cm6rVlNV' \
    --body '{"attributes": {"PTiS9F5x": {}, "fXIz4ATf": {}, "2PefAu5l": {}}, "inactiveTimeout": 70, "inviteTimeout": 39, "joinability": "NxhyH5Er", "maxPlayers": 62, "minPlayers": 99, "type": "EvTkS4hZ", "version": 13}' \
    > test.out 2>&1
eval_tap $? 27 'PublicUpdateParty' test.out

#- 28 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Sekx54Ev' \
    --body '{"attributes": {"ieCI7XLl": {}, "vgmWIdi4": {}, "wezI5oRD": {}}, "inactiveTimeout": 5, "inviteTimeout": 35, "joinability": "oTOsmtLv", "maxPlayers": 55, "minPlayers": 60, "type": "fdqol7H3", "version": 76}' \
    > test.out 2>&1
eval_tap $? 28 'PublicPatchUpdateParty' test.out

#- 29 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kOQ3uNqJ' \
    > test.out 2>&1
eval_tap $? 29 'PublicGeneratePartyCode' test.out

#- 30 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CmfLij8M' \
    > test.out 2>&1
eval_tap $? 30 'PublicRevokePartyCode' test.out

#- 31 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UjYjNVFt' \
    --body '{"userID": "ODNXSRJE"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyInvite' test.out

#- 32 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Eh6QdSkp' \
    --body '{"leaderID": "anPXF8Ys"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicPromotePartyLeader' test.out

#- 33 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nFilPNlZ' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyJoin' test.out

#- 34 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'L09QAWTD' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyLeave' test.out

#- 35 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qTELdiXN' \
    > test.out 2>&1
eval_tap $? 35 'PublicPartyReject' test.out

#- 36 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '1Qor7jP4' \
    --userId 'jhuXys5C' \
    > test.out 2>&1
eval_tap $? 36 'PublicPartyKick' test.out

#- 37 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"awNCQlfE": {}, "LeaO8GlP": {}, "l9jsCQch": {}}, "configurationName": "1wWj2BeR", "inactiveTimeout": 86, "inviteTimeout": 51, "joinability": "3EUzCa3h", "maxPlayers": 14, "members": [{"ID": "TeUbO1b1", "PlatformID": "3lPmgBLr", "PlatformUserID": "5243s4Qp"}, {"ID": "yMirmgtq", "PlatformID": "KwEBKUFA", "PlatformUserID": "AXUfMMnp"}, {"ID": "K5Cbjnoq", "PlatformID": "QampKQKH", "PlatformUserID": "byeqOqJ8"}], "minPlayers": 74, "textChat": true, "type": "KCRIHnaf"}' \
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
    --body '{"crossplayEnabled": false, "data": {"4fdnMYuX": {}, "R6OFKvnz": {}, "JcTFQdY5": {}}, "platforms": [{"name": "jP6c20Zg", "userID": "rswXU9YR"}, {"name": "LusIxJLH", "userID": "jnHFOfyV"}, {"name": "VVHptQWR", "userID": "jZZppt6I"}]}' \
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
    --order 'comXGdqd' \
    --orderBy 'y7qsSaf0' \
    --status 'fRntGC4u' \
    > test.out 2>&1
eval_tap $? 41 'PublicQueryMyGameSessions' test.out

#- 42 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'HHDGzDcL' \
    --orderBy 'YC1bJt86' \
    --status 'V6dOP8ye' \
    > test.out 2>&1
eval_tap $? 42 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE