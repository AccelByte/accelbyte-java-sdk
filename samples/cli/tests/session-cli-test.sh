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
echo "1..85"

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

#- 4 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main session adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetLogConfig' test.out

#- 5 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main session adminPatchUpdateLogConfig \
    --body '{"logLevel": "info"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 6 'AdminGetDSMCConfigurationDefault' test.out

#- 7 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 7 'AdminListEnvironmentVariables' test.out

#- 8 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 8 'AdminListGlobalConfiguration' test.out

#- 9 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"metricExcludedNamespaces": ["twYCA9kPI6LZrkq6", "Dc09nIW0Oaiw9B0D", "7eHpzSn3ZPUdc0qh"], "regionRetryMapping": {"4n8mzZ0m8SAMTwE6": ["I56IaRDBXxyaNoMR", "6hkspInrAip6lyzS", "xwElFHHdgs21Jub7"], "4CUkNmKJfh5pUkHO": ["DpoMF78NY4YkHs1c", "nz1JSDgY1TXp38zs", "CTCrbCbPOyNQkT7N"], "vyE3cwyALczNIicX": ["m7agSrjJW2OQNOs1", "PXhT5FvdiRilZ7oF", "gx4c8OumKtPDKJDX"]}, "regionURLMapping": ["n7Z4U68su8XfqlqN", "iTvB6SdAdIhUDrwo", "Z5MecdKi5r6QEa1y"], "testGameMode": "sLEzth6mXhzkzWkF", "testRegionURLMapping": ["eZSoEAcBdW19m4eu", "6d5tA5jUmiTqpyhP", "FdxLzFQN05MYzYiK"], "testTargetUserIDs": ["We5dNRljv7IPrDQQ", "Rgat0SevkLGMS0ly", "uI9a2I9u6Vpbsx5w"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminUpdateGlobalConfiguration' test.out

#- 10 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 10 'AdminDeleteGlobalConfiguration' test.out

#- 11 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetConfigurationAlertV1' test.out

#- 12 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 96}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 15}' \
    > test.out 2>&1
eval_tap $? 13 'AdminCreateConfigurationAlertV1' test.out

#- 14 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteConfigurationAlertV1' test.out

#- 15 HandleUploadXboxPFXCertificate
./ng net.accelbyte.sdk.cli.Main session handleUploadXboxPFXCertificate \
    --namespace "$AB_NAMESPACE" \
    --description 'fofvnnSuB0y5WUlr' \
    --certname 'MdI4sNveabntBSxT' \
    --file 'tmp.dat' \
    --password 'eIv53HGCiljvjKoy' \
    > test.out 2>&1
eval_tap $? 15 'HandleUploadXboxPFXCertificate' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 59, "PSNSupportedPlatforms": ["tPYokahFjkQsfCaT", "mt1d67FXGk2s9Q0m", "PVo3twu0MesTCf9x"], "SessionTitle": "4rt69lna7qxNeIxP", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "6MbwL6IY69z1UaLq", "XboxServiceConfigID": "YSYWytLPziZMdjxc", "XboxSessionTemplateName": "BZufQxGiHPllG4cY", "XboxTitleID": "EzfTD1ZBm3MqHcUm", "localizedSessionName": {"LZZbSqb8RwNmn9Hr": {}, "NQy4uZAAiE0mit9R": {}, "GCCHYzUOcEdscKHP": {}}}, "PSNBaseUrl": "EqgA8yu7Vk6Jt4Ym", "appName": "os9Jcdos4fYcTVU6", "attributes": {"RBt0zYoMcHyCUEXl": {}, "AvxJMdalwSyliWMN": {}, "W5NyLu0M3VHh2EI8": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "9ZZPYGu0rdlgdWyO", "customURLGRPC": "tXi3choQrpOsDBU5", "deployment": "SepjChB3V0v52Dly", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "XNB3Gv0IqmF51Tkh", "enableSecret": false, "fallbackClaimKeys": ["p44YUDjasWIPUvmE", "ejtGeoyIPa8ZRrvj", "j7il35MXbN9oCMNq"], "immutableStorage": true, "inactiveTimeout": 91, "inviteTimeout": 84, "joinability": "8SjTvhZNkSQ70D0H", "leaderElectionGracePeriod": 40, "manualRejoin": true, "maxActiveSessions": 9, "maxPlayers": 62, "minPlayers": 22, "name": "KDpADz1x3poD3Qgb", "persistent": false, "preferredClaimKeys": ["boLQQ1MzH7Qm8bwb", "mXgdAPh1EThG96gA", "FKK2WDgCcxvONZm3"], "requestedRegions": ["EeERmDnyeFoF7VSZ", "6pf3vneSD2Tb3g7m", "SQUhAEtrmjqU6YE3"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "4lSck0ZHn5GI39YB"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --name '91GXlvPG6bFYReVH' \
    --offset '87' \
    --order '9d9sogWa24CKNS0G' \
    --orderBy 'qVvUfHQvsHXNUNe4' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'mhgo5QB65lSAiYnN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'jkfZrQvGgbLdLsFz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 69, "PSNSupportedPlatforms": ["MDYDDxHSZjtqXyJ5", "8f7Gc26SaiGVkydw", "YWQG26yUZNmTBcvr"], "SessionTitle": "bYCwZtxFHyPLtI8i", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "byDPUIj88cekdqCt", "XboxServiceConfigID": "81P1ktfIovmv9gsR", "XboxSessionTemplateName": "5cJcHm3SZLxoRDFu", "XboxTitleID": "uuySj29a9LJE8HoR", "localizedSessionName": {"S1X2PFAAMwzHPxB1": {}, "UskYs4Yw20DOqOBS": {}, "C2DKHRuPMMWH8Yb3": {}}}, "PSNBaseUrl": "3T5UBJCjfcnLRfxe", "appName": "CSz9WEi8KlloeH0J", "attributes": {"T1yduat2vQR3biBf": {}, "su4jmsRE2w1yEkLg": {}, "h3tIYt4SqYUTLDx9": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "Oxtjzm8y2wNhmwoY", "customURLGRPC": "ZyI4EFZKBcYrCEAE", "deployment": "7WIsfmx40NLRc6m8", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "Jgas4b6z3LNUj7fd", "enableSecret": false, "fallbackClaimKeys": ["IaFQCYoDPICpnduE", "EQlULdJz4mnRBkMN", "xvvKgAT8mJrYq6hR"], "immutableStorage": false, "inactiveTimeout": 71, "inviteTimeout": 23, "joinability": "07A68eaqC2J9jyEW", "leaderElectionGracePeriod": 19, "manualRejoin": false, "maxActiveSessions": 77, "maxPlayers": 70, "minPlayers": 3, "name": "5YbsKoADkzJEN2VH", "persistent": true, "preferredClaimKeys": ["dQBHO86IlBhnetU4", "RwTqUXlTDBzOuYsa", "ZA2yyd4mbqoOfADM"], "requestedRegions": ["MAXFaY9eKa699bRV", "hyaKwwrAP2aMlu7W", "tjCtoYetOO847g8O"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "m5cTtFWbotQyXJRc"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'QWsmqPNs92epxk0i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '8VxsZNereSvf9699' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mCEHThUJkETAsSp7' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'gh4TeUTkOkAYfJB8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "AT9t4Tv207Y2QD3o"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminGetDSMCConfiguration' test.out

#- 24 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'AdminSyncDSMCConfiguration' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'D5fLCr3OOlXVv8ZG' \
    --dsPodName 'F7uYnGzpipNDigNJ' \
    --fromTime 'ma1MbqqZtfNWql4n' \
    --gameMode 'mwAft4gqkNNlWkD9' \
    --isPersistent 'eOziYRFOn0jJLHC9' \
    --isSoftDeleted 'LxhvNXTwGBCtohLt' \
    --joinability 'l9Zuhytm5UDrT6QX' \
    --limit '58' \
    --matchPool 'RKLRkb738HGS6rDg' \
    --memberID 'MdIIlhS1fSiM9331' \
    --offset '25' \
    --order 'JPN4eXbJE5Vs2Gcy' \
    --orderBy 'omQoIXimBJehyxlN' \
    --sessionID 'sjUgxBkF6wFPoJeQ' \
    --status 'ediogEhhM2rIizGd' \
    --statusV2 'KvOPdq5xrgxSmy1D' \
    --toTime 'N9LFkYW5DQyj4bj5' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Ro2ogaKt2ujQSa3Z": {}, "db65UXmy0Zp6iIaT": {}, "IKUkmkk9QM0NBMA9": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["ORxpzwLR2AK6eXUG", "PJsw1fiP80G9Pclx", "cft2ulIJzPyrVEiO"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'G4UcqsuGKHhMRWLV' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'mE2lPnsbD3SGEdlw' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uUccE536ugBp3HBv' \
    --statusType 'epnDCjgyJlXe36mg' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateGameSessionMember' test.out

#- 30 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '48' \
    --order 'jLfFmteue9nzJ6fH' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetListNativeSession' test.out

#- 31 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted '24T805tVg8JqU0jZ' \
    --joinability 'pjvsugAOS7u8RiWy' \
    --key 'erCSa8SRgwsAj1ik' \
    --leaderID '1jglaDXTvKCWwNTA' \
    --limit '16' \
    --memberID 'qpymDkQhtrHWwRVn' \
    --memberStatus 'wVBOqOHi8pWGd1ju' \
    --offset '32' \
    --order 'hiqjRJOqB5F93zFQ' \
    --orderBy 'bJndUDpdONneAczb' \
    --partyID 'BdHb2slt71B1SmZp' \
    --value '2JZp50CnPb71ORYc' \
    > test.out 2>&1
eval_tap $? 31 'AdminQueryParties' test.out

#- 32 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlatformCredentials' test.out

#- 33 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "mQbTU5JX8ccLjMXJ", "clientSecret": "Rk0eaKQDOJvrTefg", "scope": "lSs6g4iY9u02aCNY"}}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdatePlatformCredentials' test.out

#- 34 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminDeletePlatformCredentials' test.out

#- 35 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --userId 'ilatuUjjt9lIMGql' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetRecentPlayer' test.out

#- 36 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --userId 'ElEa9EIIlGcHB3Cf' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentTeamPlayer' test.out

#- 37 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'R3ncDlwi3v3MFFJ1' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadSessionStorage' test.out

#- 38 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KesKoELCpobBEG8X' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteUserSessionStorage' test.out

#- 39 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '645xpdXpai0rYaT5' \
    --userId 'hOPjaf3H0tYighU0' \
    > test.out 2>&1
eval_tap $? 39 'AdminReadUserSessionStorage' test.out

#- 40 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'VUfcYHJbBfAKSiPW' \
    > test.out 2>&1
eval_tap $? 40 'AdminQueryPlayerAttributes' test.out

#- 41 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '3VgsZXiR1DJ7HVWq' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetPlayerAttributes' test.out

#- 42 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkNSawQUWDFJvJBW' \
    > test.out 2>&1
eval_tap $? 42 'AdminSyncNativeSession' test.out

#- 43 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "ic7UkBeIXuqDuAXI", "attributes": {"66bQ71w0deoV9Lx5": {}, "RDA1l2XcrciYNEzv": {}, "SZIPkhSgORcz5S5B": {}}, "autoJoin": true, "backfillTicketID": "0b65uvuKNuy0ytZQ", "clientVersion": "7M6Nzy1adnSKOLFK", "configurationName": "x1dX4LuWJu3pDMUA", "customURLGRPC": "eeZ97SBROPYuG6Xq", "deployment": "P6oo7G73zdxTgOfn", "dsSource": "wIdlNa29fDLh741I", "fallbackClaimKeys": ["slKHzGlLKWUtDQs6", "1OQAoxyyQpRWCiiP", "DGQhNPEwiJCf2XJV"], "inactiveTimeout": 36, "inviteTimeout": 24, "joinability": "6Mca5afj12K2IzrB", "matchPool": "vvWm4udE0OXudXgN", "maxPlayers": 28, "minPlayers": 57, "preferredClaimKeys": ["e8kJATwlc6esUp6S", "w1I98jeZQ7hfxnhL", "d3Knaknoed9DHhLO"], "requestedRegions": ["qQGhCUr6iTrjyEga", "rAdNJOIG36I6tRbR", "crEveMdAdiPKDUVS"], "serverName": "C00PYeDcagginxnF", "storage": {"leader": {"Ina3yddcbsPheTH2": {}, "6IUJNvYuGRUvpZaH": {}, "CuESOiIZsMfB4ZH3": {}}}, "teams": [{"UserIDs": ["mtgWgU4pCAKxeE70", "CaunQNxot371W9G4", "AvQkqsGnmyo5JJTU"], "parties": [{"partyID": "Vmb8GEXFTlEMEsFz", "userIDs": ["YqwgK1Np5nodqpLm", "7FhJBNXzAFdO0Khq", "f6kiTdSGv2LFjAKY"]}, {"partyID": "7CbgsWqFWZX7kPBo", "userIDs": ["m8F9GLLTG8phc3n4", "iLoIllKlpO2pqiXJ", "F3WGRaoQomSJC4Dd"]}, {"partyID": "rKF7SUQPLG59e0k5", "userIDs": ["ZtX6wK7PpUlcIW32", "iK7MGt1ixY5rA1Wo", "VeJIePF8ZrQzP4zv"]}]}, {"UserIDs": ["tdxdbZUpd6FJtHJ1", "pyVwyKQLY6FEO65R", "b3z7CYLM8IlsHqff"], "parties": [{"partyID": "nrfsGlfPaZKBwa3D", "userIDs": ["db60ufPpzwj1QGIF", "mlVf4jvapseE9LN9", "bvhOrHflIOd6X3vi"]}, {"partyID": "LvtEk4mTIpUA9gxo", "userIDs": ["8SV38nEhoXmM2W7l", "6jHMA2rG3nakopAy", "welu01nryEJ0NqoT"]}, {"partyID": "ow0qiOiC4j0iktm0", "userIDs": ["ZPLkLOsp0LZ5njN8", "6Hl8kUXzt6bSc6bW", "vgpVyW9dD1kOmvrA"]}]}, {"UserIDs": ["ejcq2LgkQuaS7RBx", "3vim02jBOxrZDyvp", "cLYOWA8NjxOnaEok"], "parties": [{"partyID": "4nOOCzfsflhjbngJ", "userIDs": ["OUn18G5MlfDTk8aG", "40NlncceIZSwgAIk", "gzh4pTU0Am4DZhl0"]}, {"partyID": "bQxFJ3sWCqQpQ2Fb", "userIDs": ["KPFMycMSQ4qfAacR", "0LgB5BUXvjcu2s6w", "3VifnKqmTSoGH1XE"]}, {"partyID": "fY6QAYn6WQ5UBEU1", "userIDs": ["QAOHfZiGhxOdcuDX", "SxSc3aZPV87pna08", "gxefTYKhuxaEc7M4"]}]}], "textChat": true, "ticketIDs": ["UckSC6ePeN8i4GrF", "ES9z7xueHpATHcce", "e9GXhKcjmSEwdrkE"], "tieTeamsSessionLifetime": false, "type": "9v7aZK3h65hbN15z"}' \
    > test.out 2>&1
eval_tap $? 43 'CreateGameSession' test.out

#- 44 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"fQSfQrtfF3TQN0Oc": {}, "NDLr36vzohZyjMQA": {}, "g5mPYhrLTyU8Ohgf": {}}' \
    > test.out 2>&1
eval_tap $? 44 'PublicQueryGameSessionsByAttributes' test.out

#- 45 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Y9JQYGF4bYXEcENx"}' \
    > test.out 2>&1
eval_tap $? 45 'PublicSessionJoinCode' test.out

#- 46 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '9xZlAchob44lONDD' \
    > test.out 2>&1
eval_tap $? 46 'GetGameSessionByPodName' test.out

#- 47 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wMvgI0HlyPR7wZNi' \
    > test.out 2>&1
eval_tap $? 47 'GetGameSession' test.out

#- 48 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VsF6xG2mXEQdbzIV' \
    --body '{"attributes": {"y8alncV7vWgSHdfo": {}, "07UctPErqxyMyOK0": {}, "6MqQBErxgjVBycvU": {}}, "backfillTicketID": "4PbmRDcrg0DjQjBE", "clientVersion": "CXvea7H1m2lJFRZ3", "deployment": "ZprZ60zMjhTHeh94", "fallbackClaimKeys": ["TSenE5hCFkIf5weq", "Z18MH57l2Zsrh90E", "TtYmGukz3MnlrjcH"], "inactiveTimeout": 31, "inviteTimeout": 94, "joinability": "6B8Vj7rXFgDnDkdZ", "matchPool": "9bpjb1tdA3QhjCMW", "maxPlayers": 18, "minPlayers": 10, "preferredClaimKeys": ["hsYpKPlXn77AtYoF", "zLAATPY8P8P3cfoi", "vvQxevecWw7Rry0K"], "requestedRegions": ["K5rgAGO0dW8rX2MV", "UGKSZ4GcLkt4pK32", "sJxlZcCTpTdRtCHv"], "teams": [{"UserIDs": ["uk6B6XTmSLyn50si", "gBVZxiKdV57GvRyd", "9UuL02Le8HSCslsD"], "parties": [{"partyID": "d4M1F5qRIblS7Nz8", "userIDs": ["1GRazPAANjfBoldF", "OyqA2clJ5gEOaCgM", "6Yn6RugbNEIpGBFU"]}, {"partyID": "jOn5mM7k8nbLzvtC", "userIDs": ["IW5ynMKquUicAeIV", "XtoWAXhMlW4tLqX7", "OICf5oD1e6oI9FmY"]}, {"partyID": "el0kOw72o8Zkgk0j", "userIDs": ["S6rDWUwfhKvrf2Aa", "H4yCWrHSppnIZkNn", "Tn3rzH5NvAtcvNed"]}]}, {"UserIDs": ["gS1fUfKmihDbmu8e", "PWlQMVDXEHeiGTnw", "yEw6hIWDZrpP7rz3"], "parties": [{"partyID": "ISW510kHr4isTKWj", "userIDs": ["mv67nuHCXWfwnwGi", "oVwVzmmBVVFfpqx1", "AeLtzcPJ3jtDYBo4"]}, {"partyID": "FUTH7CGfKSyxgRR1", "userIDs": ["DiCqSMzpqIFGLkDs", "7ACC1RgBfoNrHlFi", "2qJLgmBLE35YhyiD"]}, {"partyID": "V90SeI5yppBHoytV", "userIDs": ["znCgNyx9fbT63ShE", "h8PbGikLjgjcj34u", "ulU6FYBZsWFbr3RS"]}]}, {"UserIDs": ["P0W9nBhvhf8Q0DtJ", "McYQdN66bswAgt65", "X4N1LQZmB61JMdtw"], "parties": [{"partyID": "CVUrYQue84dwmbwF", "userIDs": ["EnAZaWsQJtRYoagR", "JK5PX9UcOvhPyE11", "TRT2SKseoe8VLie0"]}, {"partyID": "LBa36KNzjf005CXN", "userIDs": ["GehQ2aTjTDfKFDXC", "7eGL5YhJDWh9YWqc", "0qgV6d9yOfIMLds2"]}, {"partyID": "DbPcaoMdtRLTmSvT", "userIDs": ["kQQgB7exYvmHMxr5", "hPCJJztJBg0tTJg4", "6IewOXE2AkCh3QIZ"]}]}], "ticketIDs": ["sUf8lGFXcmwTERHc", "lOdxIwqejxe18rNd", "b8Otq6j1mqUav7k0"], "tieTeamsSessionLifetime": false, "type": "HAQltnSojV4jT65y", "version": 5}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateGameSession' test.out

#- 49 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'T4AbGptKaWNvPbpg' \
    > test.out 2>&1
eval_tap $? 49 'DeleteGameSession' test.out

#- 50 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7yrRvXfZ6rvgvEY3' \
    --body '{"attributes": {"Hht1SwqTsKKKo37N": {}, "HDOQe91Ps3ztUIV0": {}, "dS6hIH9c4Vfkyrwp": {}}, "backfillTicketID": "uXxbaERbfgPmi0eH", "clientVersion": "kt1mr9EOIFg0dnWI", "deployment": "YN2NVL70Iw157g00", "fallbackClaimKeys": ["jr9b8MuYmmeKTmBN", "vGYxEQdf3ewoGGoY", "7xmFNAmjDDCvs78m"], "inactiveTimeout": 5, "inviteTimeout": 1, "joinability": "MdiS76YApGJ9ufwL", "matchPool": "YkqIgLuZS6hsQryi", "maxPlayers": 62, "minPlayers": 80, "preferredClaimKeys": ["tOAbpeUNf26UqkCf", "gCUYBn2xaOBdPF0J", "mX8qwU1cTuHHPB5S"], "requestedRegions": ["3DvPRCzBrVUxmDOj", "3cvRFaTC11W0TGTC", "m4fZWuk6pQxDQpKq"], "teams": [{"UserIDs": ["xLGeMvr9TsvcMQ7d", "BsaIecRxIsZvD6rm", "zVr5XT1Nxw0v1dMQ"], "parties": [{"partyID": "9Rrbk6C2cVWf6ttv", "userIDs": ["bU1PO6ApCD2VXidT", "7w0Oc15N8WXBPp17", "PAewqSm5x3B4t7WQ"]}, {"partyID": "np8jXZedgt5cyNe2", "userIDs": ["7HLtwtVOaxgP6Jbc", "t8puMybYGxD9IPmm", "sLmu3kaPj0O4zd8T"]}, {"partyID": "b7cUNGPTBxiFFCrn", "userIDs": ["7djjs69FTFVGUVhv", "KhJCmeisql14mUHV", "bMPimNhcZsU3VAdM"]}]}, {"UserIDs": ["Dcb4qlkiFAamqvZI", "2KwjqPBiWXade41s", "3rH34mB2yPlRpWjm"], "parties": [{"partyID": "HZAAvKTH8MuqIg0C", "userIDs": ["zkguwuJCW7EEFB67", "AODbi9BzupBsFpYc", "77GtRUcCFeY5g4Xg"]}, {"partyID": "BsbfzqxBPNe8ae1I", "userIDs": ["l4aAtEbu4IjGdqth", "RxTjQ7gkZEY8rG0q", "0Q2Qd2JzRbkF2I03"]}, {"partyID": "dIjvBbA6bfbYaJCJ", "userIDs": ["jfk2TUvn95FhO7VW", "3mbDVMDu87t0ldWf", "7iSGIiKFtWtn4Yr2"]}]}, {"UserIDs": ["svKM6pqLGZ0TBujE", "LAUK6mQ5iZgbwwm5", "iGzXtcknrgidKupv"], "parties": [{"partyID": "XO6aj4hCmTC34jxW", "userIDs": ["4pIDwdqXpmRmut9H", "9XyWI8bp8fQxRuX9", "1uYmtrHJbEGTUj7Y"]}, {"partyID": "jERL1rEQG02zccA8", "userIDs": ["wvLsWUNd6lPKvqDe", "jvqklTSvDwuOrP9l", "zpiX0VuFpZum7izx"]}, {"partyID": "e7NPzjOa8E7wY76P", "userIDs": ["xLv9HBEUe89AwEw1", "HO4FnKtx4XLKAmlD", "r19uJ3nq6VerzVCc"]}]}], "ticketIDs": ["I8y3Cz0YqCKUh5RD", "9vNAp4jinFpnQ5xF", "9wwbvMZyeDeRnVfP"], "tieTeamsSessionLifetime": false, "type": "i4tPAGfleyCA6jEt", "version": 6}' \
    > test.out 2>&1
eval_tap $? 50 'PatchUpdateGameSession' test.out

#- 51 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'g79HcLJXJ7mpVI6e' \
    --body '{"backfillTicketID": "TYAjdPlCiQQC35cj"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateGameSessionBackfillTicketID' test.out

#- 52 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4KyOVgvnWbfRJtsB' \
    > test.out 2>&1
eval_tap $? 52 'GameSessionGenerateCode' test.out

#- 53 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7cUQZ2QUAxJrINPX' \
    > test.out 2>&1
eval_tap $? 53 'PublicRevokeGameSessionCode' test.out

#- 54 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ppPNO3AfmXcgwC3I' \
    --body '{"platformID": "N6tvKgLB9QmJIOq9", "userID": "dP5szG71utjsQ4Cr"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGameSessionInvite' test.out

#- 55 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Rb9gUCeVz7fWbZId' \
    > test.out 2>&1
eval_tap $? 55 'JoinGameSession' test.out

#- 56 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hevfZvyV7AcodcZw' \
    --body '{"leaderID": "KjYDdmJOlzwm9Su4"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPromoteGameSessionLeader' test.out

#- 57 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FnS98QqftSjq7sn8' \
    > test.out 2>&1
eval_tap $? 57 'LeaveGameSession' test.out

#- 58 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yreciPLfkVyyJsbG' \
    > test.out 2>&1
eval_tap $? 58 'PublicGameSessionReject' test.out

#- 59 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pO6JgehDJxEN7JlZ' \
    > test.out 2>&1
eval_tap $? 59 'GetSessionServerSecret' test.out

#- 60 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'c8LMq1o2jZWu4yA3' \
    --body '{"additionalMembers": [{"partyID": "r0u4q1bTHXIjfJKy", "userIDs": ["FlM0u1uuoVdn9yVo", "SlKNchPHNL4X3LLa", "GPGdqLE8SohhhuiT"]}, {"partyID": "nJarYYkHBDdSzBXd", "userIDs": ["xapwhd5IQYBQuxLv", "PuWYvE3fsNy9Z9Oh", "xXvCp9y7fLD2qfCX"]}, {"partyID": "nlUnqxT1WsRNMZcA", "userIDs": ["92hzC7MNa8vVe4MH", "X6AgMep90AyyUJyA", "K5PRMRMwdvl0hv6g"]}], "proposedTeams": [{"UserIDs": ["62GxBW2tQF5tkTjg", "JaMYvNQOsDa4bkcg", "epqtxjbrztee7QLT"], "parties": [{"partyID": "GAak7Kaol01DK97D", "userIDs": ["2xnik42miteR5eQA", "e1rzmmgqBPRmd6mO", "4oI8KDqebm83raNB"]}, {"partyID": "J5y7axEkvI4oxZED", "userIDs": ["xGiBnNbn0zaf7CaO", "SlHXrUSA6sMJzA5m", "tqISQ83TTbtefXWz"]}, {"partyID": "nDe4LQdXfFBii2RA", "userIDs": ["MEX5RMjBFVZGYzQq", "V8d9mDdUIoiIJFNx", "uNOmUSWw18T1IxVW"]}]}, {"UserIDs": ["CxdvPL9e4P01vxP8", "xj1LyEirURERnEMz", "pImW6sjAHyCK5tNa"], "parties": [{"partyID": "nGBrkzUvck3xTtmO", "userIDs": ["FMebS4AdlNzwog2I", "hErkNhNcECWwchW6", "zL9SkbLlrNXnGanM"]}, {"partyID": "azb8jvRWenURH48a", "userIDs": ["JuALEcSqcE15u6D3", "1DjOsrs3CUYATdqn", "QGbqiqOkNeATj7eG"]}, {"partyID": "jodd7CcJUrI6MAug", "userIDs": ["K5kypNrp2nFe9FmN", "86sK5LOq4ft5jGcM", "ICPUYnfG6jl9U4jR"]}]}, {"UserIDs": ["eteIMgzISomCsodJ", "rhQW41q2OspCZbt3", "Uta5I0uGcL1koyHj"], "parties": [{"partyID": "CH5olYLETRpABAmO", "userIDs": ["2EGvJ4UMS93yOxNI", "nDByhnoluO6ti0QP", "2ssiJ66OzOj84O6t"]}, {"partyID": "gohjtC7bzjPpucdd", "userIDs": ["XJ5zifF8y959anrN", "SleywHbHig6IKWVZ", "77KeRWdECaFGzfZ2"]}, {"partyID": "hxcJ2Fnemn7M23Sz", "userIDs": ["Uo4hNBDh9ZFP1OW0", "nXOErQPS4VsRoYIK", "69yg9ADCGiXaLs2x"]}]}], "version": 20}' \
    > test.out 2>&1
eval_tap $? 60 'AppendTeamGameSession' test.out

#- 61 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BgLsNhdgQ0JWZjNR' \
    --userId 'SzOTqcVNX3ahvxw9' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionCancel' test.out

#- 62 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gwwhTnjN6wKZGW4y"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyJoinCode' test.out

#- 63 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '3f0R9s2kndhhZhwA' \
    > test.out 2>&1
eval_tap $? 63 'PublicGetParty' test.out

#- 64 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iLsZs4pmLDIQch4I' \
    --body '{"attributes": {"jDq9aT3qZyI0rYsW": {}, "ucAkXsVJbXi7eRZa": {}, "7WwIc895ImqK6tVs": {}}, "inactiveTimeout": 0, "inviteTimeout": 3, "joinability": "Uq3stUh5J5Z9GiBi", "maxPlayers": 90, "minPlayers": 70, "type": "AylX5cS0IeHpWCug", "version": 25}' \
    > test.out 2>&1
eval_tap $? 64 'PublicUpdateParty' test.out

#- 65 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aWytPfds1BYx0EaU' \
    --body '{"attributes": {"Rydf8ZyyZeHAWGgJ": {}, "UbUJRMbkcTglbU86": {}, "FyOjApNHBVfNOURc": {}}, "inactiveTimeout": 18, "inviteTimeout": 53, "joinability": "Y3YYT9oTynmfIuBW", "maxPlayers": 13, "minPlayers": 73, "type": "luLdvtsTKXMjiw6g", "version": 14}' \
    > test.out 2>&1
eval_tap $? 65 'PublicPatchUpdateParty' test.out

#- 66 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Pvfn2Qt9iyq3Nyk8' \
    > test.out 2>&1
eval_tap $? 66 'PublicGeneratePartyCode' test.out

#- 67 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ncu2Z3eDHH9WaVO4' \
    > test.out 2>&1
eval_tap $? 67 'PublicRevokePartyCode' test.out

#- 68 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iKhDcJ7TCcNIsQ3P' \
    --body '{"platformID": "uppUxDSK8aOTGMud", "userID": "cxlCV4cNbJGQ57lP"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyInvite' test.out

#- 69 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dinpjS2DRfGt9Gly' \
    --body '{"leaderID": "ZVQ4X67tPZSTpPq3"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPromotePartyLeader' test.out

#- 70 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xjrElvvDgw0ag7kS' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyJoin' test.out

#- 71 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WE0Hiqm5IuLryiEX' \
    > test.out 2>&1
eval_tap $? 71 'PublicPartyLeave' test.out

#- 72 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qvUWDjU1G0EVjVZw' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyReject' test.out

#- 73 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId '1ToLuPakQN1MpOs1' \
    --userId 'RVFrcg2CXxepx78f' \
    > test.out 2>&1
eval_tap $? 73 'PublicPartyCancel' test.out

#- 74 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vsyhE2BKtyTDSIM7' \
    --userId 'mkmvZ7Cmsh4US8o4' \
    > test.out 2>&1
eval_tap $? 74 'PublicPartyKick' test.out

#- 75 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"jfMANPpmZDdMiCxm": {}, "uCCVuFjS1GC1d2b9": {}, "2B4vEgj3HOmhcWm4": {}}, "configurationName": "28XejRF94NIY9nMr", "inactiveTimeout": 57, "inviteTimeout": 24, "joinability": "Zo0lNUBDShHD32vv", "maxPlayers": 77, "members": [{"ID": "jnnjKMEmtbiWsAQH", "PlatformID": "bMrKYi0Zxs5SWCqZ", "PlatformUserID": "XHLLa31oQf7BULnZ"}, {"ID": "DhutDM6BqguqD5xx", "PlatformID": "GxBWtnTKUe2znsqP", "PlatformUserID": "zPkwCBo2SwCUsTag"}, {"ID": "4MLAo3m61P2xaNfm", "PlatformID": "n8Onb1a9gMz0F2UB", "PlatformUserID": "RmMhAbUWmFhdYLWz"}], "minPlayers": 80, "textChat": true, "type": "DhNC66szbCCf73IF"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicCreateParty' test.out

#- 76 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetRecentPlayer' test.out

#- 77 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetRecentTeamPlayer' test.out

#- 78 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RkPSSITz4TjCrJHX' \
    --body '{"GXku2YVuOzhxHmnr": {}, "rV9ZGWrZ05sxe6A6": {}, "RpmKDebNkylbynkg": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertSessionStorageLeader' test.out

#- 79 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'T9vayLLiizac7Ge6' \
    --userId 'zKJdlt7rjF5RaJwv' \
    --body '{"kWVco2LTo5ijlvDF": {}, "8qBWCQ9dLWYyS8zd": {}, "hMeBXH8x6HdVfZVD": {}}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdateInsertSessionStorage' test.out

#- 80 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["AiU6iJOF7JKZFNk2", "NKy59X8iOg2sVBiC", "oeC5weXJl7PeiMH8"]}' \
    > test.out 2>&1
eval_tap $? 80 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 81 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'PublicGetPlayerAttributes' test.out

#- 82 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "jAkO3HKsEp6KlqwW", "data": {"4djrexcbHdEtoQvp": {}, "V344RctmTozCi8He": {}, "V6jbalHmqBBfi7sS": {}}, "platforms": [{"name": "F5BoGiTCVsXsygWb", "userID": "jE2opXtdsJQeJ1to"}, {"name": "o0qvxphTLEEBGTtZ", "userID": "yTjdKNKgYazujsmS"}, {"name": "mylT1YtxIq73aMb4", "userID": "8jISd97KORRhxSWL"}], "roles": ["WLNfHRD3V15QaGGL", "46LuxJF3sbeqWBdQ", "uWfgBAKx27MSBqab"], "simultaneousPlatform": "UXOGkkoMUZn1YXj5"}' \
    > test.out 2>&1
eval_tap $? 82 'PublicStorePlayerAttributes' test.out

#- 83 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'PublicDeletePlayerAttributes' test.out

#- 84 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'zFZeOCOR9NvBQZSJ' \
    --orderBy 'POIKrRBrYVzi9ui3' \
    --status 'lvozTt9TsH7A0TuU' \
    > test.out 2>&1
eval_tap $? 84 'PublicQueryMyGameSessions' test.out

#- 85 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '2aL4bPkk11sys6Gd' \
    --orderBy 'kDcos5uVJ0BJfZ0j' \
    --status 'vA54CSqZFDsO1skR' \
    > test.out 2>&1
eval_tap $? 85 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE