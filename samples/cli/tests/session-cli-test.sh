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
echo "1..70"

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

#- 5 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 5 'AdminListEnvironmentVariables' test.out

#- 6 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 6 'AdminListGlobalConfiguration' test.out

#- 7 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"regionRetryMapping": {"EAxcVpFrttufHIRd": ["H9UzVRiXbqlAw7r6", "W2ktQG0h5JAav5kR", "a62WopBJHPtcDs8b"], "BZLCXLx8bbgorQeF": ["bQ1g7qbPngUNB1vR", "odwpzS6DaDpv8N7Z", "QVqGj6oDLjWjkY1a"], "XlFcDtgOjchIua5t": ["WEIC32ogW7olvbTg", "rhRTcPiSuL0Sly6X", "M4OI18mAQLnzjMf8"]}, "regionURLMapping": ["GZ2WBZqxYG3aREAu", "2D6QVKNCWP75TB0i", "7pKxR8dl0zRVW4EZ"], "testGameMode": "G9m0XcgGVbMqSszE", "testRegionURLMapping": ["8GHavj7AorKsxwko", "sAVerXpc1C8XfwHu", "Keb9l3rGN9A3sNm8"], "testTargetUserIDs": ["4hddSpHt0P7MIIR7", "CkyF6C7duuyZ0GhD", "ogqrhBRd8lDR6qVN"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateGlobalConfiguration' test.out

#- 8 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteGlobalConfiguration' test.out

#- 9 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetConfigurationAlertV1' test.out

#- 10 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 85}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 99}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateConfigurationAlertV1' test.out

#- 12 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 89, "PSNSupportedPlatforms": ["e5dNRljv7IPrDQQR", "gat0SevkLGMS0lyu", "I9a2I9u6Vpbsx5w8"], "SessionTitle": "hqUI06UpOXGSLmCV", "ShouldSync": true, "XboxServiceConfigID": "MdI4sNveabntBSxT", "XboxSessionTemplateName": "eIv53HGCiljvjKoy", "localizedSessionName": {"D6SCwGrncqmLtjQH": {}, "Af8TgoNm03VLisV6": {}, "zwPuo3td6TC6I3lM": {}}}, "PSNBaseUrl": "jGSWN2laRlxfcjHf", "autoJoin": true, "clientVersion": "akUCTqGkE7wcWfDs", "deployment": "lpJSqGAXQ0yYoNRK", "dsSource": "d3IL5TAQ6iiPlSC2", "fallbackClaimKeys": ["uE4o5Vwdo3fePqIJ", "A8IHtrkmu0hpDDWV", "Ala2l5BYNtIuS5S5"], "immutableStorage": true, "inactiveTimeout": 6, "inviteTimeout": 57, "joinability": "jsoqwGyzzWi9gwQY", "maxActiveSessions": 45, "maxPlayers": 54, "minPlayers": 39, "name": "yu7Vk6Jt4Ymos9Jc", "persistent": false, "preferredClaimKeys": ["7quIOvBMcaYmvCkG", "Z5dAgqxpBFmaLoxo", "zr6wfNPX2bOItRMv"], "requestedRegions": ["qtlB2jJCSQT279ZZ", "PYGu0rdlgdWyOtXi", "3choQrpOsDBU5Sep"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "MyKrQpM4hkkK6KKX"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminCreateConfigurationTemplateV1' test.out

#- 14 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --name '23xoJ8aeCnaLpUKp' \
    --offset '27' \
    --order '4YUDjasWIPUvmEej' \
    --orderBy 'tGeoyIPa8ZRrvjj7' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetAllConfigurationTemplatesV1' test.out

#- 15 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'il35MXbN9oCMNqq9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetConfigurationTemplateV1' test.out

#- 16 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '8SjTvhZNkSQ70D0H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 40, "PSNSupportedPlatforms": ["BXksUC9b6i5lZC9x", "v32e8c5csSovoqsZ", "NBdte9NDUPVJf6c2"], "SessionTitle": "Z0QZxfgPubTDIHrv", "ShouldSync": true, "XboxServiceConfigID": "Zm3EeERmDnyeFoF7", "XboxSessionTemplateName": "VSZ6pf3vneSD2Tb3", "localizedSessionName": {"g7mSQUhAEtrmjqU6": {}, "YE3p4lSck0ZHn5GI": {}, "39YBHqaTHeKtW18i": {}}}, "PSNBaseUrl": "GeUlc9d9sogWa24C", "autoJoin": true, "clientVersion": "0GqVvUfHQvsHXNUN", "deployment": "e4mhgo5QB65lSAiY", "dsSource": "nNjkfZrQvGgbLdLs", "fallbackClaimKeys": ["FzHkBMr1yrOMlNFS", "rUEirnjX9fDmIbeZ", "xzfTcyiuATus9hsf"], "immutableStorage": false, "inactiveTimeout": 43, "inviteTimeout": 65, "joinability": "rbYCwZtxFHyPLtI8", "maxActiveSessions": 17, "maxPlayers": 18, "minPlayers": 23, "name": "qoxcwgGLXpUL4pp2", "persistent": false, "preferredClaimKeys": ["81P1ktfIovmv9gsR", "5cJcHm3SZLxoRDFu", "uuySj29a9LJE8HoR"], "requestedRegions": ["S1X2PFAAMwzHPxB1", "UskYs4Yw20DOqOBS", "C2DKHRuPMMWH8Yb3"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "UBJCjfcnLRfxeCSz"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateConfigurationTemplateV1' test.out

#- 17 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name '9WEi8KlloeH0JT1y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteConfigurationTemplateV1' test.out

#- 18 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetDSMCConfiguration' test.out

#- 19 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminSyncDSMCConfiguration' test.out

#- 20 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'duat2vQR3biBfsu4' \
    --dsPodName 'jmsRE2w1yEkLgh3t' \
    --fromTime 'IYt4SqYUTLDx9gIi' \
    --gameMode 'DandpGT2t24aOMh5' \
    --isPersistent 'eC3IHeHSKLCa3xre' \
    --isSoftDeleted 'NDUWehwH3q31A806' \
    --joinability 'DJgas4b6z3LNUj7f' \
    --limit '8' \
    --matchPool 'eIaFQCYoDPICpndu' \
    --memberID 'EEQlULdJz4mnRBkM' \
    --offset '81' \
    --order 'cf80zfFyabWAgIUX' \
    --orderBy 'iI07A68eaqC2J9jy' \
    --sessionID 'EW6GLbc0NaKDUL3s' \
    --status 'a13lk1dQBHO86IlB' \
    --statusV2 'hnetU4RwTqUXlTDB' \
    --toTime 'zOuYsaZA2yyd4mbq' \
    > test.out 2>&1
eval_tap $? 20 'AdminQueryGameSessions' test.out

#- 21 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"oOfADMMAXFaY9eKa": {}, "699bRVhyaKwwrAP2": {}, "aMlu7WtjCtoYetOO": {}}' \
    > test.out 2>&1
eval_tap $? 21 'AdminQueryGameSessionsByAttributes' test.out

#- 22 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["847g8OudOfjnCuHZ", "3c46IjGa23YvYmmD", "g7VYPXIuvUYTZBRu"]}' \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteBulkGameSessions' test.out

#- 23 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'jIUE1Tq5jyAZvkRC' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MNFIurjh2imdb4rb' \
    --statusType 'kXj0ZwsVC0gL97ZV' \
    > test.out 2>&1
eval_tap $? 23 'AdminUpdateGameSessionMember' test.out

#- 24 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'JSPqJiwv1qlYB1RS' \
    --key 'Ks6gQxC3Gb7S0o4z' \
    --leaderID 'GYY7KQI1AeFgPqaO' \
    --limit '21' \
    --memberID 'fNWql4nmwAft4gqk' \
    --memberStatus 'NNlWkD9eOziYRFOn' \
    --offset '98' \
    --order 'jJLHC9LxhvNXTwGB' \
    --orderBy 'CtohLtl9Zuhytm5U' \
    --partyID 'DrT6QXCs5SPBbRPZ' \
    --value 'TF6oQAXVG7tnsZg5' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryParties' test.out

#- 25 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminGetPlatformCredentials' test.out

#- 26 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "QgXjvyGJPN4eXbJE", "clientSecret": "5Vs2GcyomQoIXimB", "scope": "JehyxlNsjUgxBkF6"}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminUpdatePlatformCredentials' test.out

#- 27 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AdminDeletePlatformCredentials' test.out

#- 28 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wFPoJeQediogEhhM' \
    > test.out 2>&1
eval_tap $? 28 'AdminReadSessionStorage' test.out

#- 29 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2rIizGdKvOPdq5xr' \
    > test.out 2>&1
eval_tap $? 29 'AdminDeleteUserSessionStorage' test.out

#- 30 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gxSmy1DN9LFkYW5D' \
    --userId 'Qyj4bj5Ro2ogaKt2' \
    > test.out 2>&1
eval_tap $? 30 'AdminReadUserSessionStorage' test.out

#- 31 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'ujQSa3Zdb65UXmy0' \
    > test.out 2>&1
eval_tap $? 31 'AdminQueryPlayerAttributes' test.out

#- 32 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zp6iIaTIKUkmkk9Q' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlayerAttributes' test.out

#- 33 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"M0NBMA9ORxpzwLR2": {}, "AK6eXUGPJsw1fiP8": {}, "0G9Pclxcft2ulIJz": {}}, "autoJoin": false, "backfillTicketID": "yrVEiOG4UcqsuGKH", "clientVersion": "hMRWLVd3DlhLuIpo", "configurationName": "mM8sm1MiaI1mX2tJ", "deployment": "oARtdbBe7udsMrok", "dsSource": "0WvGYYnx4V709xbn", "fallbackClaimKeys": ["GezKsDwG2omOR2nv", "YI9TVqJdvzcWbfUp", "aXp5JMl5LL4bTxBm"], "inactiveTimeout": 46, "inviteTimeout": 19, "joinability": "sAj1ik1jglaDXTvK", "matchPool": "CWwNTAhd2wrS0uPd", "maxPlayers": 19, "minPlayers": 68, "preferredClaimKeys": ["hdinpng5BLy8wbhM", "ssAHjapIkY9Rf4wP", "57dBZNR88YbCtmKy"], "requestedRegions": ["8M9zVrjfGXZnqAQU", "oY1GjlIIk0iKoTTS", "1j02o7JjTXAQN0qd"], "serverName": "skdQV0TqI8EFnmDb", "teams": [{"UserIDs": ["xIxi4YKlONk2Q5Y4", "JvaizwiilatuUjjt", "9lIMGql5ElEa9EII"], "parties": [{"partyID": "lGcHB3CfR3ncDlwi", "userIDs": ["3v3MFFJ1KesKoELC", "pobBEG8X645xpdXp", "ai0rYaT5hOPjaf3H"]}, {"partyID": "0tYighU0VUfcYHJb", "userIDs": ["BfAKSiPW3VgsZXiR", "1DJ7HVWqMkNSawQU", "WDFJvJBWic7UkBeI"]}, {"partyID": "XuqDuAXI66bQ71w0", "userIDs": ["deoV9Lx5RDA1l2Xc", "rciYNEzvSZIPkhSg", "ORcz5S5BvmgBLxh4"]}]}, {"UserIDs": ["ijFnE3Tam69qSZ7P", "C6f6QkmZXElW9YfR", "Sse6AAz3S4czz0QK"], "parties": [{"partyID": "FlAVmVLu4AOec0z8", "userIDs": ["eBeeoip68J1nsv4W", "2OJhtafxMSJlHeb3", "4sZKHcl5LLLOexL4"]}, {"partyID": "fZvWtND2tcBFpX8l", "userIDs": ["NtFEJ7tnkY6Mca5a", "fj12K2IzrBvvWm4u", "dE0OXudXgNne8kJA"]}, {"partyID": "Twlc6esUp6Sw1I98", "userIDs": ["jeZQ7hfxnhLd3Kna", "knoed9DHhLOqQGhC", "Ur6iTrjyEgarAdNJ"]}]}, {"UserIDs": ["OIG36I6tRbRcrEve", "MdAdiPKDUVSC00PY", "eDcagginxnFIna3y"], "parties": [{"partyID": "ddcbsPheTH26IUJN", "userIDs": ["vYuGRUvpZaHCuESO", "iIZsMfB4ZH3mtgWg", "U4pCAKxeE70CaunQ"]}, {"partyID": "Nxot371W9G4AvQkq", "userIDs": ["sGnmyo5JJTUVmb8G", "EXFTlEMEsFzYqwgK", "1Np5nodqpLm7FhJB"]}, {"partyID": "NXzAFdO0Khqf6kiT", "userIDs": ["dSGv2LFjAKY7Cbgs", "WqFWZX7kPBom8F9G", "LLTG8phc3n4iLoIl"]}]}], "textChat": false, "ticketIDs": ["YI89hmguB8FOTjML", "o4b9rIzqYkEpstyV", "TBcrM8rG0rH0zcsw"], "tieTeamsSessionLifetime": true, "type": "7PpUlcIW32iK7MGt"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateGameSession' test.out

#- 34 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"1ixY5rA1WoVeJIeP": {}, "F8ZrQzP4zvtdxdbZ": {}, "Upd6FJtHJ1pyVwyK": {}}' \
    > test.out 2>&1
eval_tap $? 34 'PublicQueryGameSessionsByAttributes' test.out

#- 35 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QLY6FEO65Rb3z7CY"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicSessionJoinCode' test.out

#- 36 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'LM8IlsHqffnrfsGl' \
    > test.out 2>&1
eval_tap $? 36 'GetGameSessionByPodName' test.out

#- 37 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fPaZKBwa3Ddb60uf' \
    > test.out 2>&1
eval_tap $? 37 'GetGameSession' test.out

#- 38 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ppzwj1QGIFmlVf4j' \
    --body '{"attributes": {"vapseE9LN9bvhOrH": {}, "flIOd6X3viLvtEk4": {}, "mTIpUA9gxo8SV38n": {}}, "backfillTicketID": "EhoXmM2W7l6jHMA2", "clientVersion": "rG3nakopAywelu01", "deployment": "nryEJ0NqoTow0qiO", "fallbackClaimKeys": ["iC4j0iktm0ZPLkLO", "sp0LZ5njN86Hl8kU", "Xzt6bSc6bWvgpVyW"], "inactiveTimeout": 94, "inviteTimeout": 7, "joinability": "rcBE2ItBS3KtKZWe", "matchPool": "8aoFzAyBME74HUti", "maxPlayers": 32, "minPlayers": 83, "preferredClaimKeys": ["UWYhWV1qx8CzPML5", "2faXUr9Sk4lq2faB", "cAXXKlhvyH8paOJt"], "requestedRegions": ["xqMPpcVfRwNj547f", "H0XrKEDpEY8VnocG", "Ajci0V3tBf2jnHGK"], "teams": [{"UserIDs": ["Xphn50c9tNLDljhZ", "2jxLRX3z46OCaGBe", "MfPlNos4yBRjrERH"], "parties": [{"partyID": "EonAZR8GmEu0q1p6", "userIDs": ["QCyY6vSkVFWdsbYu", "VEGVxYheR3j5mNZ6", "vwv7K8Asvt1j1Rx5"]}, {"partyID": "9hesNWy2NvZ85DDK", "userIDs": ["DAF8KDsBZOuYQJ03", "BAHZ7c53q7akMpcm", "nnx6RVBrop9v7aZK"]}, {"partyID": "3h65hbN15zfQSfQr", "userIDs": ["tfF3TQN0OcNDLr36", "vzohZyjMQAg5mPYh", "rLTyU8OhgfY9JQYG"]}]}, {"UserIDs": ["F4bYXEcENx9xZlAc", "hob44lONDDwMvgI0", "HlyPR7wZNiVsF6xG"], "parties": [{"partyID": "2mXEQdbzIVy8alnc", "userIDs": ["V7vWgSHdfo07UctP", "ErqxyMyOK06MqQBE", "rxgjVBycvU4PbmRD"]}, {"partyID": "crg0DjQjBECXvea7", "userIDs": ["H1m2lJFRZ3ZprZ60", "zMjhTHeh94TSenE5", "hCFkIf5weqZ18MH5"]}, {"partyID": "7l2Zsrh90ETtYmGu", "userIDs": ["kz3MnlrjcHp6B8Vj", "7rXFgDnDkdZ9bpjb", "1tdA3QhjCMW64f4X"]}]}, {"UserIDs": ["hIjSoTB2NMKtezap", "Pr2QEPx3zTxBGtEJ", "IYppuUSsKoHw2hyd"], "parties": [{"partyID": "12uSE7BEv3aevq6i", "userIDs": ["ohU1cg4W1IS3Uv1B", "pWoJBaqdg2FHcuns", "S1lnaO2m9vqjhbeK"]}, {"partyID": "2qN8g6x2PyYDo5R3", "userIDs": ["hLiD5sf5y1JsxJNG", "myt0SQDUDoWBZVGL", "lkUetzCAWc9x1aMj"]}, {"partyID": "gGim51T107XIZRZ7", "userIDs": ["tZdIs0xf4czdt7zq", "mSKxOEQlVcx6GqsB", "q8vdhWVnuYLgpZeh"]}]}], "ticketIDs": ["K0G2nmyuViB9kRTc", "SQdTnNYGeAfYFG3w", "SkHKufBdS3ZOokZB"], "tieTeamsSessionLifetime": true, "type": "cXnAXyuGz6LlxHv8", "version": 91}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateGameSession' test.out

#- 39 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WrHSppnIZkNnTn3r' \
    > test.out 2>&1
eval_tap $? 39 'DeleteGameSession' test.out

#- 40 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zH5NvAtcvNedgS1f' \
    --body '{"attributes": {"UfKmihDbmu8ePWlQ": {}, "MVDXEHeiGTnwyEw6": {}, "hIWDZrpP7rz3ISW5": {}}, "backfillTicketID": "10kHr4isTKWjmv67", "clientVersion": "nuHCXWfwnwGioVwV", "deployment": "zmmBVVFfpqx1AeLt", "fallbackClaimKeys": ["zcPJ3jtDYBo4FUTH", "7CGfKSyxgRR1DiCq", "SMzpqIFGLkDs7ACC"], "inactiveTimeout": 68, "inviteTimeout": 89, "joinability": "AXz0UV31MfuGaXsA", "matchPool": "uGsZaSHevO0TQNEI", "maxPlayers": 20, "minPlayers": 50, "preferredClaimKeys": ["fabxJWWSI1ECUo1N", "PpeFhUztXDgB7n4C", "97uAPP8PATLpUpxe"], "requestedRegions": ["JlsBJT6Hh3OMjAjq", "2mK8lbSEEelxnb5Q", "xWG2HFnZlA6HKWW4"], "teams": [{"UserIDs": ["fI1IQcoBQELcNlZk", "qTZrKgXNwvm4e5GX", "6H742OixhtAoKiVm"], "parties": [{"partyID": "6URT95XhnUcvWB28", "userIDs": ["MpusuhhDJ5slzgiW", "ZEtyd56LfxnbY97j", "jYgXchCbkXX26uEd"]}, {"partyID": "CfQaMAQuTKfC0I2k", "userIDs": ["NjCMDtDMrentgn3D", "hqciwIeShF9RKb9v", "vxuJlhXbWhbwPwTo"]}, {"partyID": "C6knjVwVnzaqSfJi", "userIDs": ["QFC2gXoda0kg16yU", "SpSOAjHJWwfCjYwW", "kLob9gKLqs2nEZhp"]}]}, {"UserIDs": ["ByfHZinxNfgPAwkM", "BsznlBUqnLT4AbGp", "tKaWNvPbpg7yrRvX"], "parties": [{"partyID": "fZ6rvgvEY3Hht1Sw", "userIDs": ["qTsKKKo37NHDOQe9", "1Ps3ztUIV0dS6hIH", "9c4VfkyrwpuXxbaE"]}, {"partyID": "RbfgPmi0eHkt1mr9", "userIDs": ["EOIFg0dnWIYN2NVL", "70Iw157g00jr9b8M", "uYmmeKTmBNvGYxEQ"]}, {"partyID": "df3ewoGGoY7xmFNA", "userIDs": ["mjDDCvs78mcMdiS7", "6YApGJ9ufwLYkqIg", "LuZS6hsQryiEtOAb"]}]}, {"UserIDs": ["peUNf26UqkCfgCUY", "Bn2xaOBdPF0JmX8q", "wU1cTuHHPB5S3DvP"], "parties": [{"partyID": "RCzBrVUxmDOj3cvR", "userIDs": ["FaTC11W0TGTCm4fZ", "Wuk6pQxDQpKqxLGe", "Mvr9TsvcMQ7dBsaI"]}, {"partyID": "ecRxIsZvD6rmzVr5", "userIDs": ["XT1Nxw0v1dMQ9Rrb", "k6C2cVWf6ttvbU1P", "O6ApCD2VXidT7w0O"]}, {"partyID": "c15N8WXBPp17PAew", "userIDs": ["qSm5x3B4t7WQnp8j", "XZedgt5cyNe27HLt", "wtVOaxgP6Jbct8pu"]}]}], "ticketIDs": ["MybYGxD9IPmmsLmu", "3kaPj0O4zd8Tb7cU", "NGPTBxiFFCrn7djj"], "tieTeamsSessionLifetime": true, "type": "lVHY1AHwF3vGoav7", "version": 79}' \
    > test.out 2>&1
eval_tap $? 40 'PatchUpdateGameSession' test.out

#- 41 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eisql14mUHVbMPim' \
    --body '{"backfillTicketID": "NhcZsU3VAdMDcb4q"}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateGameSessionBackfillTicketID' test.out

#- 42 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lkiFAamqvZI2Kwjq' \
    > test.out 2>&1
eval_tap $? 42 'GameSessionGenerateCode' test.out

#- 43 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PBiWXade41s3rH34' \
    > test.out 2>&1
eval_tap $? 43 'PublicRevokeGameSessionCode' test.out

#- 44 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mB2yPlRpWjmHZAAv' \
    --body '{"platformID": "KTH8MuqIg0Czkguw", "userID": "uJCW7EEFB67AODbi"}' \
    > test.out 2>&1
eval_tap $? 44 'PublicGameSessionInvite' test.out

#- 45 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9BzupBsFpYc77GtR' \
    > test.out 2>&1
eval_tap $? 45 'JoinGameSession' test.out

#- 46 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UcCFeY5g4XgBsbfz' \
    --body '{"leaderID": "qxBPNe8ae1Il4aAt"}' \
    > test.out 2>&1
eval_tap $? 46 'PublicPromoteGameSessionLeader' test.out

#- 47 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ebu4IjGdqthRxTjQ' \
    > test.out 2>&1
eval_tap $? 47 'LeaveGameSession' test.out

#- 48 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7gkZEY8rG0q0Q2Qd' \
    > test.out 2>&1
eval_tap $? 48 'PublicGameSessionReject' test.out

#- 49 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2JzRbkF2I03dIjvB' \
    --body '{"additionalMembers": [{"partyID": "bA6bfbYaJCJjfk2T", "userIDs": ["Uvn95FhO7VW3mbDV", "MDu87t0ldWf7iSGI", "iKFtWtn4Yr2svKM6"]}, {"partyID": "pqLGZ0TBujELAUK6", "userIDs": ["mQ5iZgbwwm5iGzXt", "cknrgidKupvXO6aj", "4hCmTC34jxW4pIDw"]}, {"partyID": "dqXpmRmut9H9XyWI", "userIDs": ["8bp8fQxRuX91uYmt", "rHJbEGTUj7YjERL1", "rEQG02zccA8wvLsW"]}], "proposedTeams": [{"UserIDs": ["UNd6lPKvqDejvqkl", "TSvDwuOrP9lzpiX0", "VuFpZum7izxe7NPz"], "parties": [{"partyID": "jOa8E7wY76PxLv9H", "userIDs": ["BEUe89AwEw1HO4Fn", "Ktx4XLKAmlDr19uJ", "3nq6VerzVCcI8y3C"]}, {"partyID": "z0YqCKUh5RD9vNAp", "userIDs": ["4jinFpnQ5xF9wwbv", "MZyeDeRnVfPUa6xV", "VBcq3wZpFIYeAg79"]}, {"partyID": "HcLJXJ7mpVI6eTYA", "userIDs": ["jdPlCiQQC35cj4Ky", "OVgvnWbfRJtsB7cU", "QZ2QUAxJrINPXppP"]}]}, {"UserIDs": ["NO3AfmXcgwC3IN6t", "vKgLB9QmJIOq9dP5", "szG71utjsQ4CrRb9"], "parties": [{"partyID": "gUCeVz7fWbZIdhev", "userIDs": ["fZvyV7AcodcZwKjY", "DdmJOlzwm9Su4FnS", "98QqftSjq7sn8yre"]}, {"partyID": "ciPLfkVyyJsbGpO6", "userIDs": ["JgehDJxEN7JlZc8L", "Mq1o2jZWu4yA3r0u", "4q1bTHXIjfJKyFlM"]}, {"partyID": "0u1uuoVdn9yVoSlK", "userIDs": ["NchPHNL4X3LLaGPG", "dqLE8SohhhuiTnJa", "rYYkHBDdSzBXdxap"]}]}, {"UserIDs": ["whd5IQYBQuxLvPuW", "YvE3fsNy9Z9OhxXv", "Cp9y7fLD2qfCXnlU"], "parties": [{"partyID": "nqxT1WsRNMZcA92h", "userIDs": ["zC7MNa8vVe4MHX6A", "gMep90AyyUJyAK5P", "RMRMwdvl0hv6g62G"]}, {"partyID": "xBW2tQF5tkTjgJaM", "userIDs": ["YvNQOsDa4bkcgepq", "txjbrztee7QLTGAa", "k7Kaol01DK97D2xn"]}, {"partyID": "ik42miteR5eQAe1r", "userIDs": ["zmmgqBPRmd6mO4oI", "8KDqebm83raNBJ5y", "7axEkvI4oxZEDxGi"]}]}], "version": 57}' \
    > test.out 2>&1
eval_tap $? 49 'AppendTeamGameSession' test.out

#- 50 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "bgg8rdwY9bmrvHmO"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPartyJoinCode' test.out

#- 51 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '07KNqX9LM2IwEsdO' \
    > test.out 2>&1
eval_tap $? 51 'PublicGetParty' test.out

#- 52 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GBXBwnzDX8v3xgC1' \
    --body '{"attributes": {"Ge9PdbTTAJ2Gp1r0": {}, "sVZ6LJAOddIL2l3h": {}, "PjNDKv2LWfXqjr8f": {}}, "inactiveTimeout": 92, "inviteTimeout": 96, "joinability": "79En3wYowBdkaZ3y", "maxPlayers": 77, "minPlayers": 16, "type": "9e4P01vxP8xj1LyE", "version": 16}' \
    > test.out 2>&1
eval_tap $? 52 'PublicUpdateParty' test.out

#- 53 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tiQ272Uo9UBJWodp' \
    --body '{"attributes": {"dwsX1jorcyR0x3Yi": {}, "HF8ITGPRQBCgIs1Q": {}, "2lzxl0yF5m77TTh4": {}}, "inactiveTimeout": 13, "inviteTimeout": 4, "joinability": "Uoj8u2WRcLiEtzVl", "maxPlayers": 28, "minPlayers": 36, "type": "kflfn7pHY48F1dl1", "version": 34}' \
    > test.out 2>&1
eval_tap $? 53 'PublicPatchUpdateParty' test.out

#- 54 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nURH48aJuALEcSqc' \
    > test.out 2>&1
eval_tap $? 54 'PublicGeneratePartyCode' test.out

#- 55 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'E15u6D31DjOsrs3C' \
    > test.out 2>&1
eval_tap $? 55 'PublicRevokePartyCode' test.out

#- 56 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UYATdqnQGbqiqOkN' \
    --body '{"platformID": "eATj7eGjodd7CcJU", "userID": "rI6MAugK5kypNrp2"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyInvite' test.out

#- 57 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nFe9FmN86sK5LOq4' \
    --body '{"leaderID": "ft5jGcMICPUYnfG6"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPromotePartyLeader' test.out

#- 58 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jl9U4jReteIMgzIS' \
    > test.out 2>&1
eval_tap $? 58 'PublicPartyJoin' test.out

#- 59 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'omCsodJrhQW41q2O' \
    > test.out 2>&1
eval_tap $? 59 'PublicPartyLeave' test.out

#- 60 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'spCZbt3Uta5I0uGc' \
    > test.out 2>&1
eval_tap $? 60 'PublicPartyReject' test.out

#- 61 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'L1koyHjCH5olYLET' \
    --userId 'RpABAmO2EGvJ4UMS' \
    > test.out 2>&1
eval_tap $? 61 'PublicPartyKick' test.out

#- 62 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"93yOxNInDByhnolu": {}, "O6ti0QP2ssiJ66Oz": {}, "Oj84O6tgohjtC7bz": {}}, "configurationName": "jPpucddXJ5zifF8y", "inactiveTimeout": 32, "inviteTimeout": 63, "joinability": "9anrNSleywHbHig6", "maxPlayers": 71, "members": [{"ID": "IFvORxTi79DpSjb3", "PlatformID": "9ukcR6c2E2r3vk3I", "PlatformUserID": "fAKEbqcNXSGCCvNo"}, {"ID": "wNmdpcJgF88ySNq4", "PlatformID": "Mj7mulP4tQ6R1OqK", "PlatformUserID": "VOTniBgLsNhdgQ0J"}, {"ID": "WZjNRSzOTqcVNX3a", "PlatformID": "hvxw9gwwhTnjN6wK", "PlatformUserID": "ZGW4y3f0R9s2kndh"}], "minPlayers": 16, "textChat": false, "type": "ZhwAiLsZs4pmLDIQ"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicCreateParty' test.out

#- 63 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ch4IjDq9aT3qZyI0' \
    --body '{"rYsWucAkXsVJbXi7": {}, "eRZa7WwIc895ImqK": {}, "6tVsaUq3stUh5J5Z": {}}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateInsertSessionStorageLeader' test.out

#- 64 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9GiBiSAylX5cS0Ie' \
    --userId 'HpWCugmfOL0QQpxs' \
    --body '{"uD8PGqku59eFJrOX": {}, "yDYz9vMUOPG0iHDT": {}, "8QbF7gHPTPQbvLt2": {}}' \
    > test.out 2>&1
eval_tap $? 64 'PublicUpdateInsertSessionStorage' test.out

#- 65 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["NRqJGIKzLyH1y72L", "13Ornyx34luLdvts", "TKXMjiw6gYPvfn2Q"]}' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 66 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'PublicGetPlayerAttributes' test.out

#- 67 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "cNg14Ws8TIP1LKiF", "data": {"QoLDvumfqrgSfnx2": {}, "h61X9dN1MGRXBJ6m": {}, "VV7JS9qjNLwvI8Jd": {}}, "platforms": [{"name": "iY3RRiLilmOGF6dL", "userID": "LIeIVIjMcdlbdRXT"}, {"name": "GIrdNL5gJPqTAjgq", "userID": "aTHf1ANTJ9Yk997X"}, {"name": "kGOdC6ItxDT8p4n4", "userID": "XCFkD1AJLCwszbZx"}], "roles": ["uHSgDOK8bjoF7bL2", "635KbtZTGJpqgl2I", "zNXGTuQPIDpor7t1"]}' \
    > test.out 2>&1
eval_tap $? 67 'PublicStorePlayerAttributes' test.out

#- 68 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'PublicDeletePlayerAttributes' test.out

#- 69 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'aJLNNz6QIVC9Mfuc' \
    --orderBy '8VOsnmnlVljdWYmE' \
    --status 'Le74p38vumnxAnYB' \
    > test.out 2>&1
eval_tap $? 69 'PublicQueryMyGameSessions' test.out

#- 70 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'TxaTIz0jcgDI8Pkz' \
    --orderBy '96vd80msqIm5bufn' \
    --status 'BqrpLeqhwVhjnnjK' \
    > test.out 2>&1
eval_tap $? 70 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE