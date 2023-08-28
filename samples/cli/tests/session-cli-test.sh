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
echo "1..66"

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

#- 6 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationAlertV1' test.out

#- 7 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 62}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationAlertV1' test.out

#- 8 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 39}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateConfigurationAlertV1' test.out

#- 9 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminDeleteConfigurationAlertV1' test.out

#- 10 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 55, "PSNSupportedPlatforms": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"], "SessionTitle": "n8mzZ0m8SAMTwE6I", "ShouldSync": true, "XboxServiceConfigID": "IaRDBXxyaNoMR6hk", "XboxSessionTemplateName": "spInrAip6lyzSxwE", "localizedSessionName": {"lFHHdgs21Jub74CU": {}, "kNmKJfh5pUkHODpo": {}, "MF78NY4YkHs1cnz1": {}}}, "PSNBaseUrl": "JSDgY1TXp38zsCTC", "autoJoin": true, "clientVersion": "cPiSuL0Sly6XM4OI", "deployment": "18mAQLnzjMf8GZ2W", "dsSource": "BZqxYG3aREAu2D6Q", "fallbackClaimKeys": ["VKNCWP75TB0i7pKx", "R8dl0zRVW4EZG9m0", "XcgGVbMqSszE8GHa"], "immutableStorage": true, "inactiveTimeout": 20, "inviteTimeout": 92, "joinability": "7AorKsxwkosAVerX", "maxActiveSessions": 31, "maxPlayers": 76, "minPlayers": 5, "name": "i5r6QEa1ysLEzth6", "persistent": false, "preferredClaimKeys": ["N9A3sNm84hddSpHt", "0P7MIIR7CkyF6C7d", "uuyZ0GhDogqrhBRd"], "requestedRegions": ["8lDR6qVNPRZYdFLI", "AjGGJddVCvu9vx5K", "Q7KYnIuMBvaO35ll"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "aT5kPxUfofvnnSuB"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateConfigurationTemplateV1' test.out

#- 11 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --name 'y5WUlrMdI4sNveab' \
    --offset '26' \
    --order 'sKgnuRkgghGoYupD' \
    --orderBy '391C2qtPYokahFjk' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetAllConfigurationTemplatesV1' test.out

#- 12 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'QsfCaTmt1d67FXGk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetConfigurationTemplateV1' test.out

#- 13 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '2s9Q0mPVo3twu0Me' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 38, "PSNSupportedPlatforms": ["6I3lMjGSWN2laRlx", "fcjHfYakUCTqGkE7", "wcWfDslpJSqGAXQ0"], "SessionTitle": "yYoNRKd3IL5TAQ6i", "ShouldSync": false, "XboxServiceConfigID": "llG4cYEzfTD1ZBm3", "XboxSessionTemplateName": "MqHcUmLZZbSqb8Rw", "localizedSessionName": {"Nmn9HrNQy4uZAAiE": {}, "0mit9RGCCHYzUOcE": {}, "dscKHPEqgA8yu7Vk": {}}}, "PSNBaseUrl": "6Jt4Ymos9Jcdos4f", "autoJoin": true, "clientVersion": "cTVU6RBt0zYoMcHy", "deployment": "CUEXlAvxJMdalwSy", "dsSource": "liWMNW5NyLu0M3VH", "fallbackClaimKeys": ["h2EI8JlDbPWbQ6Q9", "lNmqRBaAkLnvxkT1", "X68cmDc3fxU8MyKr"], "immutableStorage": true, "inactiveTimeout": 44, "inviteTimeout": 80, "joinability": "52Dlym6puQ23xoJ8", "maxActiveSessions": 1, "maxPlayers": 33, "minPlayers": 9, "name": "mF51TkhjYnaq6foW", "persistent": true, "preferredClaimKeys": ["WIPUvmEejtGeoyIP", "a8ZRrvjj7il35MXb", "N9oCMNqq98SjTvhZ"], "requestedRegions": ["NkSQ70D0H6BXksUC", "9b6i5lZC9xv32e8c", "5csSovoqsZNBdte9"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "APh1EThG96gAFKK2"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateConfigurationTemplateV1' test.out

#- 14 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'WDgCcxvONZm3EeER' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteConfigurationTemplateV1' test.out

#- 15 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetDSMCConfiguration' test.out

#- 16 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminSyncDSMCConfiguration' test.out

#- 17 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'mDnyeFoF7VSZ6pf3' \
    --dsPodName 'vneSD2Tb3g7mSQUh' \
    --fromTime 'AEtrmjqU6YE3p4lS' \
    --gameMode 'ck0ZHn5GI39YBHqa' \
    --isPersistent 'THeKtW18iGeUlc9d' \
    --isSoftDeleted '9sogWa24CKNS0GqV' \
    --joinability 'vUfHQvsHXNUNe4mh' \
    --limit '13' \
    --matchPool 'dN8S48l9lyNApflx' \
    --memberID 'qMrj3oZk03QXcKMD' \
    --offset '80' \
    --order 'DDxHSZjtqXyJ58f7' \
    --orderBy 'Gc26SaiGVkydwYWQ' \
    --sessionID 'G26yUZNmTBcvrbYC' \
    --status 'wZtxFHyPLtI8ilby' \
    --statusV2 'DPUIj88cekdqCt81' \
    --toTime 'P1ktfIovmv9gsR5c' \
    > test.out 2>&1
eval_tap $? 17 'AdminQueryGameSessions' test.out

#- 18 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["JcHm3SZLxoRDFuuu", "ySj29a9LJE8HoRS1", "X2PFAAMwzHPxB1Us"]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteBulkGameSessions' test.out

#- 19 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'kYs4Yw20DOqOBSC2' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DKHRuPMMWH8Yb33T' \
    --statusType '5UBJCjfcnLRfxeCS' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateGameSessionMember' test.out

#- 20 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'z9WEi8KlloeH0JT1' \
    --key 'yduat2vQR3biBfsu' \
    --leaderID '4jmsRE2w1yEkLgh3' \
    --limit '40' \
    --memberID 'rxzTtuLl4XlbGL8Q' \
    --memberStatus 'Oxtjzm8y2wNhmwoY' \
    --offset '8' \
    --order 'yI4EFZKBcYrCEAE7' \
    --orderBy 'WIsfmx40NLRc6m8h' \
    --partyID 'eKnWhzfe2NubeoKF' \
    --value 'eIaFQCYoDPICpndu' \
    > test.out 2>&1
eval_tap $? 20 'AdminQueryParties' test.out

#- 21 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlatformCredentials' test.out

#- 22 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "EEQlULdJz4mnRBkM", "clientSecret": "NxvvKgAT8mJrYq6h", "scope": "RkloqxM3gpwxcfMy"}}' \
    > test.out 2>&1
eval_tap $? 22 'AdminUpdatePlatformCredentials' test.out

#- 23 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminDeletePlatformCredentials' test.out

#- 24 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9XzjjI5YbsKoADkz' \
    > test.out 2>&1
eval_tap $? 24 'AdminReadSessionStorage' test.out

#- 25 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JEN2VHzih3bit0VW' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteUserSessionStorage' test.out

#- 26 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'n3CO39PXDNxtXgeO' \
    --userId '3FgkXhjDzaQY3snn' \
    > test.out 2>&1
eval_tap $? 26 'AdminReadUserSessionStorage' test.out

#- 27 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '2ZkP7cFdP43e5dC9' \
    > test.out 2>&1
eval_tap $? 27 'AdminQueryPlayerAttributes' test.out

#- 28 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIBudfZgrbHDIDm4' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetPlayerAttributes' test.out

#- 29 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"hMzF4TxodenSrUTv": {}, "fqU0bfoMm5cTtFWb": {}, "otQyXJRcQWsmqPNs": {}}, "autoJoin": false, "backfillTicketID": "2epxk0i8VxsZNere", "clientVersion": "Svf9699mCEHThUJk", "configurationName": "ETAsSp7gh4TeUTkO", "deployment": "kAYfJB8AT9t4Tv20", "dsSource": "7Y2QD3oD5fLCr3OO", "fallbackClaimKeys": ["lXVv8ZGF7uYnGzpi", "pNDigNJma1MbqqZt", "fNWql4nmwAft4gqk"], "inactiveTimeout": 81, "inviteTimeout": 21, "joinability": "NlWkD9eOziYRFOn0", "matchPool": "jJLHC9LxhvNXTwGB", "maxPlayers": 59, "minPlayers": 71, "preferredClaimKeys": ["tohLtl9Zuhytm5UD", "rT6QXCs5SPBbRPZT", "F6oQAXVG7tnsZg5Q"], "requestedRegions": ["gXjvyGJPN4eXbJE5", "Vs2GcyomQoIXimBJ", "ehyxlNsjUgxBkF6w"], "serverName": "FPoJeQediogEhhM2", "teams": [{"UserIDs": ["rIizGdKvOPdq5xrg", "xSmy1DN9LFkYW5DQ", "yj4bj5Ro2ogaKt2u"], "parties": [{"partyID": "jQSa3Zdb65UXmy0Z", "userIDs": ["p6iIaTIKUkmkk9QM", "0NBMA9ORxpzwLR2A", "K6eXUGPJsw1fiP80"]}, {"partyID": "G9Pclxcft2ulIJzP", "userIDs": ["yrVEiOG4UcqsuGKH", "hMRWLVd3DlhLuIpo", "mM8sm1MiaI1mX2tJ"]}, {"partyID": "oARtdbBe7udsMrok", "userIDs": ["0WvGYYnx4V709xbn", "GezKsDwG2omOR2nv", "YI9TVqJdvzcWbfUp"]}]}, {"UserIDs": ["aXp5JMl5LL4bTxBm", "ZjdrrIxsB0NRsB1f", "PqqRRulpqpymDkQh"], "parties": [{"partyID": "trHWwRVnwVBOqOHi", "userIDs": ["8pWGd1juYhiqjRJO", "qB5F93zFQbJndUDp", "dONneAczbBdHb2sl"]}, {"partyID": "t71B1SmZp2JZp50C", "userIDs": ["nPb71ORYcmQbTU5J", "X8ccLjMXJRk0eaKQ", "DOJvrTefglSs6g4i"]}, {"partyID": "Y9u02aCNYIWekp18", "userIDs": ["lOC3mNqF7Bl0Lcgh", "VHfPEspxwhRON0bc", "1eMbEIjowLqc3ecj"]}]}, {"UserIDs": ["XJbZDKKoxLE1Y3Dy", "mtj3giPg4x4yiPX6", "ues1Hhhkg1yLVbLF"], "parties": [{"partyID": "zHEP8cM4NTwr0KHa", "userIDs": ["AsmTej52WKi6tArA", "URt9plCSVq8PdH6h", "JPUAc0RVwXgAgntL"]}, {"partyID": "MCuaXBWQi6BqPg4x", "userIDs": ["r0lCancUZGCHsZYo", "LfR1KtOv7Zy0b65u", "vuKNuy0ytZQ7M6Nz"]}, {"partyID": "y1adnSKOLFKx1dX4", "userIDs": ["LuWJu3pDMUAeeZ97", "SBROPYuG6XqP6oo7", "G73zdxTgOfnwIdlN"]}]}], "textChat": false, "ticketIDs": ["4W2OJhtafxMSJlHe", "b34sZKHcl5LLLOex", "L4fZvWtND2tcBFpX"], "tieTeamsSessionLifetime": true, "type": "lNtFEJ7tnkY6Mca5"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateGameSession' test.out

#- 30 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"afj12K2IzrBvvWm4": {}, "udE0OXudXgNne8kJ": {}, "ATwlc6esUp6Sw1I9": {}}' \
    > test.out 2>&1
eval_tap $? 30 'PublicQueryGameSessions' test.out

#- 31 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "8jeZQ7hfxnhLd3Kn"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicSessionJoinCode' test.out

#- 32 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'aknoed9DHhLOqQGh' \
    > test.out 2>&1
eval_tap $? 32 'GetGameSessionByPodName' test.out

#- 33 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CUr6iTrjyEgarAdN' \
    > test.out 2>&1
eval_tap $? 33 'GetGameSession' test.out

#- 34 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JOIG36I6tRbRcrEv' \
    --body '{"attributes": {"eMdAdiPKDUVSC00P": {}, "YeDcagginxnFIna3": {}, "yddcbsPheTH26IUJ": {}}, "backfillTicketID": "NvYuGRUvpZaHCuES", "clientVersion": "OiIZsMfB4ZH3mtgW", "deployment": "gU4pCAKxeE70Caun", "fallbackClaimKeys": ["QNxot371W9G4AvQk", "qsGnmyo5JJTUVmb8", "GEXFTlEMEsFzYqwg"], "inactiveTimeout": 75, "inviteTimeout": 7, "joinability": "1Np5nodqpLm7FhJB", "matchPool": "NXzAFdO0Khqf6kiT", "maxPlayers": 7, "minPlayers": 76, "preferredClaimKeys": ["SGv2LFjAKY7CbgsW", "qFWZX7kPBom8F9GL", "LTG8phc3n4iLoIll"], "requestedRegions": ["KlpO2pqiXJF3WGRa", "oQomSJC4DdrKF7SU", "QPLG59e0k5ZtX6wK"], "teams": [{"UserIDs": ["7PpUlcIW32iK7MGt", "1ixY5rA1WoVeJIeP", "F8ZrQzP4zvtdxdbZ"], "parties": [{"partyID": "Upd6FJtHJ1pyVwyK", "userIDs": ["QLY6FEO65Rb3z7CY", "LM8IlsHqffnrfsGl", "fPaZKBwa3Ddb60uf"]}, {"partyID": "Ppzwj1QGIFmlVf4j", "userIDs": ["vapseE9LN9bvhOrH", "flIOd6X3viLvtEk4", "mTIpUA9gxo8SV38n"]}, {"partyID": "EhoXmM2W7l6jHMA2", "userIDs": ["rG3nakopAywelu01", "nryEJ0NqoTow0qiO", "iC4j0iktm0ZPLkLO"]}]}, {"UserIDs": ["sp0LZ5njN86Hl8kU", "Xzt6bSc6bWvgpVyW", "9dD1kOmvrAejcq2L"], "parties": [{"partyID": "gkQuaS7RBx3vim02", "userIDs": ["jBOxrZDyvpcLYOWA", "8NjxOnaEok4nOOCz", "fsflhjbngJOUn18G"]}, {"partyID": "5MlfDTk8aG40Nlnc", "userIDs": ["ceIZSwgAIkgzh4pT", "U0Am4DZhl0bQxFJ3", "sWCqQpQ2FbKPFMyc"]}, {"partyID": "MSQ4qfAacR0LgB5B", "userIDs": ["UXvjcu2s6w3VifnK", "qmTSoGH1XEfY6QAY", "n6WQ5UBEU1QAOHfZ"]}]}, {"UserIDs": ["iGhxOdcuDXSxSc3a", "ZPV87pna08gxefTY", "KhuxaEc7M4P7UckS"], "parties": [{"partyID": "C6ePeN8i4GrFES9z", "userIDs": ["7xueHpATHccee9GX", "hKcjmSEwdrkEnnqK", "zFsLfYalUlfwEQKj"]}, {"partyID": "U7eHGebSVu0LQ40k", "userIDs": ["epEaC4dfiOMZfEhH", "r39pysFO3Zvc1BZG", "99LyvfvHEsJKQQew"]}, {"partyID": "VLMUoAnaRcYp7FUj", "userIDs": ["fIGaffoflEIByYqe", "KN0meGelYF5wWaDh", "ukU4khGG4vZFTYnP"]}]}], "ticketIDs": ["kmSu4PWam1jxR7SE", "TWjteoc8fgvZDDho", "O05oKqymxLD1Lcvw"], "tieTeamsSessionLifetime": false, "type": "T6mZEiwxxElpMYSW", "version": 71}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGameSession' test.out

#- 35 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0zMjhTHeh94TSenE' \
    > test.out 2>&1
eval_tap $? 35 'DeleteGameSession' test.out

#- 36 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5hCFkIf5weqZ18MH' \
    --body '{"attributes": {"57l2Zsrh90ETtYmG": {}, "ukz3MnlrjcHp6B8V": {}, "j7rXFgDnDkdZ9bpj": {}}, "backfillTicketID": "b1tdA3QhjCMW64f4", "clientVersion": "XhIjSoTB2NMKteza", "deployment": "pPr2QEPx3zTxBGtE", "fallbackClaimKeys": ["JIYppuUSsKoHw2hy", "d12uSE7BEv3aevq6", "iohU1cg4W1IS3Uv1"], "inactiveTimeout": 56, "inviteTimeout": 49, "joinability": "pWoJBaqdg2FHcuns", "matchPool": "S1lnaO2m9vqjhbeK", "maxPlayers": 33, "minPlayers": 48, "preferredClaimKeys": ["N8g6x2PyYDo5R3hL", "iD5sf5y1JsxJNGmy", "t0SQDUDoWBZVGLlk"], "requestedRegions": ["UetzCAWc9x1aMjgG", "im51T107XIZRZ7tZ", "dIs0xf4czdt7zqmS"], "teams": [{"UserIDs": ["KxOEQlVcx6GqsBq8", "vdhWVnuYLgpZehK0", "G2nmyuViB9kRTcSQ"], "parties": [{"partyID": "dTnNYGeAfYFG3wSk", "userIDs": ["HKufBdS3ZOokZB4c", "XnAXyuGz6LlxHv8S", "wyagYvDJ3w3UNgIG"]}, {"partyID": "j2jZtEYT8sIPSE1X", "userIDs": ["XPzySa0sZoFS6xCO", "WMpyh9pMsQgb64EL", "bzDMwyo4nIRysQdb"]}, {"partyID": "ufXjYnSoIFeouC2m", "userIDs": ["38kXrDZWlGVE9sJ4", "NpUtKp6M9I6nEwnZ", "hsjwJeGwaPSDMZz9"]}]}, {"UserIDs": ["5OYKiqaZD63xe5rr", "uJVfLGea0ZtlzUcu", "HAXz0UV31MfuGaXs"], "parties": [{"partyID": "AuGsZaSHevO0TQNE", "userIDs": ["I3kfabxJWWSI1ECU", "o1NPpeFhUztXDgB7", "n4C97uAPP8PATLpU"]}, {"partyID": "pxeJlsBJT6Hh3OMj", "userIDs": ["Ajq2mK8lbSEEelxn", "b5QxWG2HFnZlA6HK", "WW4fI1IQcoBQELcN"]}, {"partyID": "lZkqTZrKgXNwvm4e", "userIDs": ["5GX6H742OixhtAoK", "iVm6URT95XhnUcvW", "B28MpusuhhDJ5slz"]}]}, {"UserIDs": ["giWZEtyd56LfxnbY", "97jjYgXchCbkXX26", "uEdCfQaMAQuTKfC0"], "parties": [{"partyID": "I2kNjCMDtDMrentg", "userIDs": ["n3DhqciwIeShF9RK", "b9vvxuJlhXbWhbwP", "wToC6knjVwVnzaqS"]}, {"partyID": "fJiQFC2gXoda0kg1", "userIDs": ["6yUSpSOAjHJWwfCj", "YwWkLob9gKLqs2nE", "ZhpByfHZinxNfgPA"]}, {"partyID": "wkMBsznlBUqnLT4A", "userIDs": ["bGptKaWNvPbpg7yr", "RvXfZ6rvgvEY3Hht", "1SwqTsKKKo37NHDO"]}]}], "ticketIDs": ["Qe91Ps3ztUIV0dS6", "hIH9c4VfkyrwpuXx", "baERbfgPmi0eHkt1"], "tieTeamsSessionLifetime": false, "type": "OlhTtSiZNCxuogFt", "version": 9}' \
    > test.out 2>&1
eval_tap $? 36 'PatchUpdateGameSession' test.out

#- 37 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VL70Iw157g00jr9b' \
    --body '{"backfillTicketID": "8MuYmmeKTmBNvGYx"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateGameSessionBackfillTicketID' test.out

#- 38 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EQdf3ewoGGoY7xmF' \
    > test.out 2>&1
eval_tap $? 38 'GameSessionGenerateCode' test.out

#- 39 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NAmjDDCvs78mcMdi' \
    > test.out 2>&1
eval_tap $? 39 'PublicRevokeGameSessionCode' test.out

#- 40 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'S76YApGJ9ufwLYkq' \
    --body '{"platformID": "IgLuZS6hsQryiEtO", "userID": "AbpeUNf26UqkCfgC"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicGameSessionInvite' test.out

#- 41 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UYBn2xaOBdPF0JmX' \
    > test.out 2>&1
eval_tap $? 41 'JoinGameSession' test.out

#- 42 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8qwU1cTuHHPB5S3D' \
    --body '{"leaderID": "vPRCzBrVUxmDOj3c"}' \
    > test.out 2>&1
eval_tap $? 42 'PublicPromoteGameSessionLeader' test.out

#- 43 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vRFaTC11W0TGTCm4' \
    > test.out 2>&1
eval_tap $? 43 'LeaveGameSession' test.out

#- 44 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fZWuk6pQxDQpKqxL' \
    > test.out 2>&1
eval_tap $? 44 'PublicGameSessionReject' test.out

#- 45 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GeMvr9TsvcMQ7dBs' \
    --body '{"additionalMembers": [{"partyID": "aIecRxIsZvD6rmzV", "userIDs": ["r5XT1Nxw0v1dMQ9R", "rbk6C2cVWf6ttvbU", "1PO6ApCD2VXidT7w"]}, {"partyID": "0Oc15N8WXBPp17PA", "userIDs": ["ewqSm5x3B4t7WQnp", "8jXZedgt5cyNe27H", "LtwtVOaxgP6Jbct8"]}, {"partyID": "puMybYGxD9IPmmsL", "userIDs": ["mu3kaPj0O4zd8Tb7", "cUNGPTBxiFFCrn7d", "jjs69FTFVGUVhvKh"]}], "proposedTeams": [{"UserIDs": ["JCmeisql14mUHVbM", "PimNhcZsU3VAdMDc", "b4qlkiFAamqvZI2K"], "parties": [{"partyID": "wjqPBiWXade41s3r", "userIDs": ["H34mB2yPlRpWjmHZ", "AAvKTH8MuqIg0Czk", "guwuJCW7EEFB67AO"]}, {"partyID": "Dbi9BzupBsFpYc77", "userIDs": ["GtRUcCFeY5g4XgBs", "bfzqxBPNe8ae1Il4", "aAtEbu4IjGdqthRx"]}, {"partyID": "TjQ7gkZEY8rG0q0Q", "userIDs": ["2Qd2JzRbkF2I03dI", "jvBbA6bfbYaJCJjf", "k2TUvn95FhO7VW3m"]}]}, {"UserIDs": ["bDVMDu87t0ldWf7i", "SGIiKFtWtn4Yr2sv", "KM6pqLGZ0TBujELA"], "parties": [{"partyID": "UK6mQ5iZgbwwm5iG", "userIDs": ["zXtcknrgidKupvXO", "6aj4hCmTC34jxW4p", "IDwdqXpmRmut9H9X"]}, {"partyID": "yWI8bp8fQxRuX91u", "userIDs": ["YmtrHJbEGTUj7YjE", "RL1rEQG02zccA8wv", "LsWUNd6lPKvqDejv"]}, {"partyID": "qklTSvDwuOrP9lzp", "userIDs": ["iX0VuFpZum7izxe7", "NPzjOa8E7wY76PxL", "v9HBEUe89AwEw1HO"]}]}, {"UserIDs": ["4FnKtx4XLKAmlDr1", "9uJ3nq6VerzVCcI8", "y3Cz0YqCKUh5RD9v"], "parties": [{"partyID": "NAp4jinFpnQ5xF9w", "userIDs": ["wbvMZyeDeRnVfPUa", "6xVVBcq3wZpFIYeA", "g79HcLJXJ7mpVI6e"]}, {"partyID": "TYAjdPlCiQQC35cj", "userIDs": ["4KyOVgvnWbfRJtsB", "7cUQZ2QUAxJrINPX", "ppPNO3AfmXcgwC3I"]}, {"partyID": "N6tvKgLB9QmJIOq9", "userIDs": ["dP5szG71utjsQ4Cr", "Rb9gUCeVz7fWbZId", "hevfZvyV7AcodcZw"]}]}], "version": 74}' \
    > test.out 2>&1
eval_tap $? 45 'AppendTeamGameSession' test.out

#- 46 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2ENKKWrFtHIi1CMg"}' \
    > test.out 2>&1
eval_tap $? 46 'PublicPartyJoinCode' test.out

#- 47 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KAOG5iDcCR5PbCvD' \
    > test.out 2>&1
eval_tap $? 47 'PublicGetParty' test.out

#- 48 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Lil8wj9cKM3Ar6MF' \
    --body '{"attributes": {"35hCER4nGmWGgTJf": {}, "HlJl4tHGa4XfZcd9": {}, "CVnGqMX9FieeEssW": {}}, "inactiveTimeout": 63, "inviteTimeout": 23, "joinability": "Ul07bhwntCVqiYOJ", "maxPlayers": 11, "minPlayers": 76, "type": "5KwMZQjzvjSozv6C", "version": 94}' \
    > test.out 2>&1
eval_tap $? 48 'PublicUpdateParty' test.out

#- 49 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dqLE8SohhhuiTnJa' \
    --body '{"attributes": {"rYYkHBDdSzBXdxap": {}, "whd5IQYBQuxLvPuW": {}, "YvE3fsNy9Z9OhxXv": {}}, "inactiveTimeout": 59, "inviteTimeout": 12, "joinability": "p9y7fLD2qfCXnlUn", "maxPlayers": 33, "minPlayers": 47, "type": "L1IiD6MlcEPhMDFz", "version": 20}' \
    > test.out 2>&1
eval_tap $? 49 'PublicPatchUpdateParty' test.out

#- 50 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MNa8vVe4MHX6AgMe' \
    > test.out 2>&1
eval_tap $? 50 'PublicGeneratePartyCode' test.out

#- 51 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'p90AyyUJyAK5PRMR' \
    > test.out 2>&1
eval_tap $? 51 'PublicRevokePartyCode' test.out

#- 52 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Mwdvl0hv6g62GxBW' \
    --body '{"platformID": "2tQF5tkTjgJaMYvN", "userID": "QOsDa4bkcgepqtxj"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicPartyInvite' test.out

#- 53 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'brztee7QLTGAak7K' \
    --body '{"leaderID": "aol01DK97D2xnik4"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicPromotePartyLeader' test.out

#- 54 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '2miteR5eQAe1rzmm' \
    > test.out 2>&1
eval_tap $? 54 'PublicPartyJoin' test.out

#- 55 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gqBPRmd6mO4oI8KD' \
    > test.out 2>&1
eval_tap $? 55 'PublicPartyLeave' test.out

#- 56 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qebm83raNBJ5y7ax' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyReject' test.out

#- 57 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EkvI4oxZEDxGiBnN' \
    --userId 'bn0zaf7CaOSlHXrU' \
    > test.out 2>&1
eval_tap $? 57 'PublicPartyKick' test.out

#- 58 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"SA6sMJzA5mtqISQ8": {}, "3TTbtefXWznDe4LQ": {}, "dXfFBii2RAMEX5RM": {}}, "configurationName": "jBFVZGYzQqV8d9mD", "inactiveTimeout": 6, "inviteTimeout": 60, "joinability": "UIoiIJFNxuNOmUSW", "maxPlayers": 46, "members": [{"ID": "n3wYowBdkaZ3y6i3", "PlatformID": "8XQjLDRqkpiFK5Bt", "PlatformUserID": "iQ272Uo9UBJWodpd"}, {"ID": "wsX1jorcyR0x3YiH", "PlatformID": "F8ITGPRQBCgIs1Q2", "PlatformUserID": "lzxl0yF5m77TTh4g"}, {"ID": "Uoj8u2WRcLiEtzVl", "PlatformID": "nkflfn7pHY48F1dl", "PlatformUserID": "1q92m3iRlfnBAk0C"}], "minPlayers": 46, "textChat": false, "type": "iAsR65yQ9ssuHdGm"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicCreateParty' test.out

#- 59 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xncCEr0KcgeqzGbr' \
    --body '{"uNB72HHMkjzyBB4U": {}, "FKiaoV0VOem2yqPs": {}, "MFxKybPkbuS6x9cL": {}}' \
    > test.out 2>&1
eval_tap $? 59 'PublicUpdateInsertSessionStorageLeader' test.out

#- 60 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'J1APnNlsa2bRBr27' \
    --userId 'fVMWuAfDqLMR919I' \
    --body '{"ZPKOKiAVQXXOmqFH": {}, "LbyXmgCNiXH8uenb": {}, "C5CphgMweexsIAP5": {}}' \
    > test.out 2>&1
eval_tap $? 60 'PublicUpdateInsertSessionStorage' test.out

#- 61 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["vHLjBJ9iqMcBL4Bz", "hDUjhKPwbwcvQU5k", "G8bXGFmPAnOkDiJq"]}' \
    > test.out 2>&1
eval_tap $? 61 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 62 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'PublicGetPlayerAttributes' test.out

#- 63 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "j84O6tgohjtC7bzj", "data": {"PpucddXJ5zifF8y9": {}, "59anrNSleywHbHig": {}, "6IKWVZ77KeRWdECa": {}}, "platforms": [{"name": "FGzfZ2hxcJ2Fnemn", "userID": "7M23SzUo4hNBDh9Z"}, {"name": "FP1OW0nXOErQPS4V", "userID": "sRoYIK69yg9ADCGi"}, {"name": "XaLs2xjHkinOD975", "userID": "nARHCmhNHSXuqIHs"}], "roles": ["xvaUoXDmwWsukxnc", "uD3QxCXMd00YBWCa", "VVmM45mfIZsWhkS4"]}' \
    > test.out 2>&1
eval_tap $? 63 'PublicStorePlayerAttributes' test.out

#- 64 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'PublicDeletePlayerAttributes' test.out

#- 65 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '76dGGJwJ00UH197M' \
    --orderBy 'J6zU7JLMQyMWzYQC' \
    --status 'AaPJgoxGJoJaSzUt' \
    > test.out 2>&1
eval_tap $? 65 'PublicQueryMyGameSessions' test.out

#- 66 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'Y4ZD0Xtb0U4pH16N' \
    --orderBy 'UsVY21NVIs7NRen2' \
    --status 'Y3Ns0QJQeaWytPfd' \
    > test.out 2>&1
eval_tap $? 66 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE