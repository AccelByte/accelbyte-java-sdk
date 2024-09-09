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
echo "1..98"

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

#- 3 PprofHandler
./ng net.accelbyte.sdk.cli.Main session pprofHandler \
    > test.out 2>&1
eval_tap $? 3 'PprofHandler' test.out

#- 4 AllocsHandler
./ng net.accelbyte.sdk.cli.Main session allocsHandler \
    > test.out 2>&1
eval_tap $? 4 'AllocsHandler' test.out

#- 5 BlockHandler
./ng net.accelbyte.sdk.cli.Main session blockHandler \
    > test.out 2>&1
eval_tap $? 5 'BlockHandler' test.out

#- 6 CmdlineHandler
./ng net.accelbyte.sdk.cli.Main session cmdlineHandler \
    > test.out 2>&1
eval_tap $? 6 'CmdlineHandler' test.out

#- 7 GoroutineHandler
./ng net.accelbyte.sdk.cli.Main session goroutineHandler \
    > test.out 2>&1
eval_tap $? 7 'GoroutineHandler' test.out

#- 8 HeapHandler
./ng net.accelbyte.sdk.cli.Main session heapHandler \
    > test.out 2>&1
eval_tap $? 8 'HeapHandler' test.out

#- 9 MutexHandler
./ng net.accelbyte.sdk.cli.Main session mutexHandler \
    > test.out 2>&1
eval_tap $? 9 'MutexHandler' test.out

#- 10 Profile
./ng net.accelbyte.sdk.cli.Main session profile \
    > test.out 2>&1
eval_tap $? 10 'Profile' test.out

#- 11 SymbolHandler
./ng net.accelbyte.sdk.cli.Main session symbolHandler \
    > test.out 2>&1
eval_tap $? 11 'SymbolHandler' test.out

#- 12 ThreadcreateHandler
./ng net.accelbyte.sdk.cli.Main session threadcreateHandler \
    > test.out 2>&1
eval_tap $? 12 'ThreadcreateHandler' test.out

#- 13 TraceHandler
./ng net.accelbyte.sdk.cli.Main session traceHandler \
    > test.out 2>&1
eval_tap $? 13 'TraceHandler' test.out

#- 14 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main session getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 14 'GetHealthcheckInfoV1' test.out

#- 15 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main session adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 15 'AdminGetLogConfig' test.out

#- 16 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main session adminPatchUpdateLogConfig \
    --body '{"logLevel": "info"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPatchUpdateLogConfig' test.out

#- 17 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 17 'AdminGetDSMCConfigurationDefault' test.out

#- 18 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 18 'AdminListEnvironmentVariables' test.out

#- 19 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 19 'AdminListGlobalConfiguration' test.out

#- 20 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"metricExcludedNamespaces": ["twYCA9kPI6LZrkq6", "Dc09nIW0Oaiw9B0D", "7eHpzSn3ZPUdc0qh"], "regionRetryMapping": {"4n8mzZ0m8SAMTwE6": ["I56IaRDBXxyaNoMR", "6hkspInrAip6lyzS", "xwElFHHdgs21Jub7"], "4CUkNmKJfh5pUkHO": ["DpoMF78NY4YkHs1c", "nz1JSDgY1TXp38zs", "CTCrbCbPOyNQkT7N"], "vyE3cwyALczNIicX": ["m7agSrjJW2OQNOs1", "PXhT5FvdiRilZ7oF", "gx4c8OumKtPDKJDX"]}, "regionURLMapping": ["n7Z4U68su8XfqlqN", "iTvB6SdAdIhUDrwo", "Z5MecdKi5r6QEa1y"], "testGameMode": "sLEzth6mXhzkzWkF", "testRegionURLMapping": ["eZSoEAcBdW19m4eu", "6d5tA5jUmiTqpyhP", "FdxLzFQN05MYzYiK"], "testTargetUserIDs": ["We5dNRljv7IPrDQQ", "Rgat0SevkLGMS0ly", "uI9a2I9u6Vpbsx5w"]}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateGlobalConfiguration' test.out

#- 21 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteGlobalConfiguration' test.out

#- 22 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetConfigurationAlertV1' test.out

#- 23 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 96}' \
    > test.out 2>&1
eval_tap $? 23 'AdminUpdateConfigurationAlertV1' test.out

#- 24 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 15}' \
    > test.out 2>&1
eval_tap $? 24 'AdminCreateConfigurationAlertV1' test.out

#- 25 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteConfigurationAlertV1' test.out

#- 26 HandleUploadXboxPFXCertificate
./ng net.accelbyte.sdk.cli.Main session handleUploadXboxPFXCertificate \
    --namespace "$AB_NAMESPACE" \
    --description 'fofvnnSuB0y5WUlr' \
    --certname 'MdI4sNveabntBSxT' \
    --file 'tmp.dat' \
    --password 'eIv53HGCiljvjKoy' \
    > test.out 2>&1
eval_tap $? 26 'HandleUploadXboxPFXCertificate' test.out

#- 27 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 59, "PSNSupportedPlatforms": ["tPYokahFjkQsfCaT", "mt1d67FXGk2s9Q0m", "PVo3twu0MesTCf9x"], "SessionTitle": "4rt69lna7qxNeIxP", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "6MbwL6IY69z1UaLq", "XboxServiceConfigID": "YSYWytLPziZMdjxc", "XboxSessionTemplateName": "BZufQxGiHPllG4cY", "XboxTitleID": "EzfTD1ZBm3MqHcUm", "localizedSessionName": {"LZZbSqb8RwNmn9Hr": {}, "NQy4uZAAiE0mit9R": {}, "GCCHYzUOcEdscKHP": {}}}, "PSNBaseUrl": "EqgA8yu7Vk6Jt4Ym", "appName": "os9Jcdos4fYcTVU6", "attributes": {"RBt0zYoMcHyCUEXl": {}, "AvxJMdalwSyliWMN": {}, "W5NyLu0M3VHh2EI8": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "9ZZPYGu0rdlgdWyO", "customURLGRPC": "tXi3choQrpOsDBU5", "deployment": "SepjChB3V0v52Dly", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "XNB3Gv0IqmF51Tkh", "enableSecret": false, "fallbackClaimKeys": ["p44YUDjasWIPUvmE", "ejtGeoyIPa8ZRrvj", "j7il35MXbN9oCMNq"], "immutableStorage": true, "inactiveTimeout": 91, "inviteTimeout": 84, "joinability": "8SjTvhZNkSQ70D0H", "leaderElectionGracePeriod": 40, "manualRejoin": true, "maxActiveSessions": 9, "maxPlayers": 62, "minPlayers": 22, "name": "KDpADz1x3poD3Qgb", "persistent": false, "preferredClaimKeys": ["boLQQ1MzH7Qm8bwb", "mXgdAPh1EThG96gA", "FKK2WDgCcxvONZm3"], "requestedRegions": ["EeERmDnyeFoF7VSZ", "6pf3vneSD2Tb3g7m", "SQUhAEtrmjqU6YE3"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "4lSck0ZHn5GI39YB"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminCreateConfigurationTemplateV1' test.out

#- 28 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --name '91GXlvPG6bFYReVH' \
    --offset '87' \
    --order '9d9sogWa24CKNS0G' \
    --orderBy 'qVvUfHQvsHXNUNe4' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetAllConfigurationTemplatesV1' test.out

#- 29 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'mhgo5QB65lSAiYnN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'AdminGetConfigurationTemplateV1' test.out

#- 30 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'jkfZrQvGgbLdLsFz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 69, "PSNSupportedPlatforms": ["MDYDDxHSZjtqXyJ5", "8f7Gc26SaiGVkydw", "YWQG26yUZNmTBcvr"], "SessionTitle": "bYCwZtxFHyPLtI8i", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "byDPUIj88cekdqCt", "XboxServiceConfigID": "81P1ktfIovmv9gsR", "XboxSessionTemplateName": "5cJcHm3SZLxoRDFu", "XboxTitleID": "uuySj29a9LJE8HoR", "localizedSessionName": {"S1X2PFAAMwzHPxB1": {}, "UskYs4Yw20DOqOBS": {}, "C2DKHRuPMMWH8Yb3": {}}}, "PSNBaseUrl": "3T5UBJCjfcnLRfxe", "appName": "CSz9WEi8KlloeH0J", "attributes": {"T1yduat2vQR3biBf": {}, "su4jmsRE2w1yEkLg": {}, "h3tIYt4SqYUTLDx9": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "Oxtjzm8y2wNhmwoY", "customURLGRPC": "ZyI4EFZKBcYrCEAE", "deployment": "7WIsfmx40NLRc6m8", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "Jgas4b6z3LNUj7fd", "enableSecret": false, "fallbackClaimKeys": ["IaFQCYoDPICpnduE", "EQlULdJz4mnRBkMN", "xvvKgAT8mJrYq6hR"], "immutableStorage": false, "inactiveTimeout": 71, "inviteTimeout": 23, "joinability": "07A68eaqC2J9jyEW", "leaderElectionGracePeriod": 19, "manualRejoin": false, "maxActiveSessions": 77, "maxPlayers": 70, "minPlayers": 3, "name": "5YbsKoADkzJEN2VH", "persistent": true, "preferredClaimKeys": ["dQBHO86IlBhnetU4", "RwTqUXlTDBzOuYsa", "ZA2yyd4mbqoOfADM"], "requestedRegions": ["MAXFaY9eKa699bRV", "hyaKwwrAP2aMlu7W", "tjCtoYetOO847g8O"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "m5cTtFWbotQyXJRc"}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateConfigurationTemplateV1' test.out

#- 31 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'QWsmqPNs92epxk0i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'AdminDeleteConfigurationTemplateV1' test.out

#- 32 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '8VxsZNereSvf9699' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mCEHThUJkETAsSp7' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetMemberActiveSession' test.out

#- 33 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'gh4TeUTkOkAYfJB8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "AT9t4Tv207Y2QD3o"}' \
    > test.out 2>&1
eval_tap $? 33 'AdminReconcileMaxActiveSession' test.out

#- 34 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminGetDSMCConfiguration' test.out

#- 35 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminSyncDSMCConfiguration' test.out

#- 36 AdminQueryGameSessions
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
eval_tap $? 36 'AdminQueryGameSessions' test.out

#- 37 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Ro2ogaKt2ujQSa3Z": {}, "db65UXmy0Zp6iIaT": {}, "IKUkmkk9QM0NBMA9": {}}' \
    > test.out 2>&1
eval_tap $? 37 'AdminQueryGameSessionsByAttributes' test.out

#- 38 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["ORxpzwLR2AK6eXUG", "PJsw1fiP80G9Pclx", "cft2ulIJzPyrVEiO"]}' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteBulkGameSessions' test.out

#- 39 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'G4UcqsuGKHhMRWLV' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 39 'AdminSetDSReady' test.out

#- 40 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'mE2lPnsbD3SGEdlw' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uUccE536ugBp3HBv' \
    > test.out 2>&1
eval_tap $? 40 'AdminKickGameSessionMember' test.out

#- 41 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'epnDCjgyJlXe36mg' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WjLfFmteue9nzJ6f' \
    --statusType 'H24T805tVg8JqU0j' \
    > test.out 2>&1
eval_tap $? 41 'AdminUpdateGameSessionMember' test.out

#- 42 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '31' \
    --order 'vzcWbfUpaXp5JMl5' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetListNativeSession' test.out

#- 43 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'LL4bTxBmZjdrrIxs' \
    --joinability 'B0NRsB1fPqqRRulp' \
    --key 'qpymDkQhtrHWwRVn' \
    --leaderID 'wVBOqOHi8pWGd1ju' \
    --limit '32' \
    --memberID 'hiqjRJOqB5F93zFQ' \
    --memberStatus 'bJndUDpdONneAczb' \
    --offset '57' \
    --order 'fGXZnqAQUoY1GjlI' \
    --orderBy 'Ik0iKoTTS1j02o7J' \
    --partyID 'jTXAQN0qdskdQV0T' \
    --value 'qI8EFnmDbxIxi4YK' \
    > test.out 2>&1
eval_tap $? 43 'AdminQueryParties' test.out

#- 44 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPlatformCredentials' test.out

#- 45 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "lONk2Q5Y4Jvaizwi", "clientSecret": "ilatuUjjt9lIMGql", "scope": "5ElEa9EIIlGcHB3C"}}' \
    > test.out 2>&1
eval_tap $? 45 'AdminUpdatePlatformCredentials' test.out

#- 46 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'AdminDeletePlatformCredentials' test.out

#- 47 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --userId 'RON0bc1eMbEIjowL' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetRecentPlayer' test.out

#- 48 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --userId 'KesKoELCpobBEG8X' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetRecentTeamPlayer' test.out

#- 49 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '645xpdXpai0rYaT5' \
    > test.out 2>&1
eval_tap $? 49 'AdminReadSessionStorage' test.out

#- 50 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hOPjaf3H0tYighU0' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeleteUserSessionStorage' test.out

#- 51 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VUfcYHJbBfAKSiPW' \
    --userId '3VgsZXiR1DJ7HVWq' \
    > test.out 2>&1
eval_tap $? 51 'AdminReadUserSessionStorage' test.out

#- 52 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'MkNSawQUWDFJvJBW' \
    > test.out 2>&1
eval_tap $? 52 'AdminQueryPlayerAttributes' test.out

#- 53 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ic7UkBeIXuqDuAXI' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetPlayerAttributes' test.out

#- 54 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId '66bQ71w0deoV9Lx5' \
    > test.out 2>&1
eval_tap $? 54 'AdminSyncNativeSession' test.out

#- 55 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "RDA1l2XcrciYNEzv", "attributes": {"SZIPkhSgORcz5S5B": {}, "vmgBLxh4ijFnE3Ta": {}, "m69qSZ7PC6f6QkmZ": {}}, "autoJoin": true, "backfillTicketID": "ElW9YfRSse6AAz3S", "clientVersion": "4czz0QKFlAVmVLu4", "configurationName": "AOec0z8eBeeoip68", "customURLGRPC": "J1nsv4W2OJhtafxM", "deployment": "SJlHeb34sZKHcl5L", "dsSource": "LLOexL4fZvWtND2t", "fallbackClaimKeys": ["cBFpX8lNtFEJ7tnk", "Y6Mca5afj12K2Izr", "BvvWm4udE0OXudXg"], "inactiveTimeout": 81, "inviteTimeout": 81, "joinability": "ne8kJATwlc6esUp6", "matchPool": "Sw1I98jeZQ7hfxnh", "maxPlayers": 76, "minPlayers": 59, "preferredClaimKeys": ["d3Knaknoed9DHhLO", "qQGhCUr6iTrjyEga", "rAdNJOIG36I6tRbR"], "requestedRegions": ["crEveMdAdiPKDUVS", "C00PYeDcagginxnF", "Ina3yddcbsPheTH2"], "serverName": "6IUJNvYuGRUvpZaH", "storage": {"leader": {"CuESOiIZsMfB4ZH3": {}, "mtgWgU4pCAKxeE70": {}, "CaunQNxot371W9G4": {}}}, "teams": [{"parties": [{"partyID": "AvQkqsGnmyo5JJTU", "userIDs": ["Vmb8GEXFTlEMEsFz", "YqwgK1Np5nodqpLm", "7FhJBNXzAFdO0Khq"]}, {"partyID": "f6kiTdSGv2LFjAKY", "userIDs": ["7CbgsWqFWZX7kPBo", "m8F9GLLTG8phc3n4", "iLoIllKlpO2pqiXJ"]}, {"partyID": "F3WGRaoQomSJC4Dd", "userIDs": ["rKF7SUQPLG59e0k5", "ZtX6wK7PpUlcIW32", "iK7MGt1ixY5rA1Wo"]}], "userIDs": ["VeJIePF8ZrQzP4zv", "tdxdbZUpd6FJtHJ1", "pyVwyKQLY6FEO65R"]}, {"parties": [{"partyID": "b3z7CYLM8IlsHqff", "userIDs": ["nrfsGlfPaZKBwa3D", "db60ufPpzwj1QGIF", "mlVf4jvapseE9LN9"]}, {"partyID": "bvhOrHflIOd6X3vi", "userIDs": ["LvtEk4mTIpUA9gxo", "8SV38nEhoXmM2W7l", "6jHMA2rG3nakopAy"]}, {"partyID": "welu01nryEJ0NqoT", "userIDs": ["ow0qiOiC4j0iktm0", "ZPLkLOsp0LZ5njN8", "6Hl8kUXzt6bSc6bW"]}], "userIDs": ["vgpVyW9dD1kOmvrA", "ejcq2LgkQuaS7RBx", "3vim02jBOxrZDyvp"]}, {"parties": [{"partyID": "cLYOWA8NjxOnaEok", "userIDs": ["4nOOCzfsflhjbngJ", "OUn18G5MlfDTk8aG", "40NlncceIZSwgAIk"]}, {"partyID": "gzh4pTU0Am4DZhl0", "userIDs": ["bQxFJ3sWCqQpQ2Fb", "KPFMycMSQ4qfAacR", "0LgB5BUXvjcu2s6w"]}, {"partyID": "3VifnKqmTSoGH1XE", "userIDs": ["fY6QAYn6WQ5UBEU1", "QAOHfZiGhxOdcuDX", "SxSc3aZPV87pna08"]}], "userIDs": ["gxefTYKhuxaEc7M4", "P7UckSC6ePeN8i4G", "rFES9z7xueHpATHc"]}], "textChat": false, "ticketIDs": ["q7akMpcmnnx6RVBr", "op9v7aZK3h65hbN1", "5zfQSfQrtfF3TQN0"], "tieTeamsSessionLifetime": false, "type": "Q40kepEaC4dfiOMZ"}' \
    > test.out 2>&1
eval_tap $? 55 'CreateGameSession' test.out

#- 56 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"fEhHr39pysFO3Zvc": {}, "1BZG99LyvfvHEsJK": {}, "QQewVLMUoAnaRcYp": {}}' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryGameSessionsByAttributes' test.out

#- 57 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "7FUjfIGaffoflEIB"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicSessionJoinCode' test.out

#- 58 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'yYqeKN0meGelYF5w' \
    > test.out 2>&1
eval_tap $? 58 'GetGameSessionByPodName' test.out

#- 59 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WaDhukU4khGG4vZF' \
    > test.out 2>&1
eval_tap $? 59 'GetGameSession' test.out

#- 60 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TYnPkmSu4PWam1jx' \
    --body '{"attributes": {"R7SETWjteoc8fgvZ": {}, "DDhoO05oKqymxLD1": {}, "Lcvw6T6mZEiwxxEl": {}}, "backfillTicketID": "pMYSWIeVzm7z9noo", "clientVersion": "wmlTIKVowi0RY2VN", "deployment": "4ZONJREdUQ3z9F1B", "fallbackClaimKeys": ["xNNgnke4akncw7wu", "9TmXfJWBPrx9Ns8e", "LzYEvwSWTaLQjctv"], "inactiveTimeout": 35, "inviteTimeout": 99, "joinability": "K2jhsYpKPlXn77At", "matchPool": "YoFzLAATPY8P8P3c", "maxPlayers": 10, "minPlayers": 55, "preferredClaimKeys": ["oivvQxevecWw7Rry", "0KK5rgAGO0dW8rX2", "MVUGKSZ4GcLkt4pK"], "requestedRegions": ["32sJxlZcCTpTdRtC", "Hvuk6B6XTmSLyn50", "sigBVZxiKdV57GvR"], "teams": [{"parties": [{"partyID": "yd9UuL02Le8HSCsl", "userIDs": ["sDd4M1F5qRIblS7N", "z81GRazPAANjfBol", "dFOyqA2clJ5gEOaC"]}, {"partyID": "gM6Yn6RugbNEIpGB", "userIDs": ["FUjOn5mM7k8nbLzv", "tCIW5ynMKquUicAe", "IVXtoWAXhMlW4tLq"]}, {"partyID": "X7OICf5oD1e6oI9F", "userIDs": ["mYel0kOw72o8Zkgk", "0jS6rDWUwfhKvrf2", "AaH4yCWrHSppnIZk"]}], "userIDs": ["NnTn3rzH5NvAtcvN", "edgS1fUfKmihDbmu", "8ePWlQMVDXEHeiGT"]}, {"parties": [{"partyID": "nwyEw6hIWDZrpP7r", "userIDs": ["z3ISW510kHr4isTK", "Wjmv67nuHCXWfwnw", "GioVwVzmmBVVFfpq"]}, {"partyID": "x1AeLtzcPJ3jtDYB", "userIDs": ["o4FUTH7CGfKSyxgR", "R1DiCqSMzpqIFGLk", "Ds7ACC1RgBfoNrHl"]}, {"partyID": "Fi2qJLgmBLE35Yhy", "userIDs": ["iDV90SeI5yppBHoy", "tVznCgNyx9fbT63S", "hEh8PbGikLjgjcj3"]}], "userIDs": ["4uulU6FYBZsWFbr3", "RSP0W9nBhvhf8Q0D", "tJMcYQdN66bswAgt"]}, {"parties": [{"partyID": "65X4N1LQZmB61JMd", "userIDs": ["twCVUrYQue84dwmb", "wFEnAZaWsQJtRYoa", "gRJK5PX9UcOvhPyE"]}, {"partyID": "11TRT2SKseoe8VLi", "userIDs": ["e0LBa36KNzjf005C", "XNGehQ2aTjTDfKFD", "XC7eGL5YhJDWh9YW"]}, {"partyID": "qc0qgV6d9yOfIMLd", "userIDs": ["s2DbPcaoMdtRLTmS", "vTkQQgB7exYvmHMx", "r5hPCJJztJBg0tTJ"]}], "userIDs": ["g46IewOXE2AkCh3Q", "IZsUf8lGFXcmwTER", "HclOdxIwqejxe18r"]}], "ticketIDs": ["Ndb8Otq6j1mqUav7", "k05HAQltnSojV4jT", "65yclX2FtAz0vJjF"], "tieTeamsSessionLifetime": false, "type": "YWOaNdsimmkW2miH", "version": 47}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGameSession' test.out

#- 61 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3Hht1SwqTsKKKo37' \
    > test.out 2>&1
eval_tap $? 61 'DeleteGameSession' test.out

#- 62 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NHDOQe91Ps3ztUIV' \
    --body '{"attributes": {"0dS6hIH9c4Vfkyrw": {}, "puXxbaERbfgPmi0e": {}, "Hkt1mr9EOIFg0dnW": {}}, "backfillTicketID": "IYN2NVL70Iw157g0", "clientVersion": "0jr9b8MuYmmeKTmB", "deployment": "NvGYxEQdf3ewoGGo", "fallbackClaimKeys": ["Y7xmFNAmjDDCvs78", "mcMdiS76YApGJ9uf", "wLYkqIgLuZS6hsQr"], "inactiveTimeout": 51, "inviteTimeout": 53, "joinability": "iEtOAbpeUNf26Uqk", "matchPool": "CfgCUYBn2xaOBdPF", "maxPlayers": 72, "minPlayers": 25, "preferredClaimKeys": ["EwP2b4gd3xOeii8J", "nmssep2xD2NY0kAB", "eGs9yxahld1pO0Gy"], "requestedRegions": ["f5PO3COyMvczgEpz", "Z3FbtxfhcRC7IVYa", "6iZ5uFRYNn3SHiWx"], "teams": [{"parties": [{"partyID": "F0YbuU5ar5qTLWUC", "userIDs": ["y0Afgc050XIZRW49", "1e94mQjVOOBnIWhu", "nElqZUodp3IhtCSH"]}, {"partyID": "y1ei1fIrPvfHnRN0", "userIDs": ["6EjRwEQlNapJRfk4", "f9Zcw1pEHAyNFxcV", "TKuAQTGh5BxjWOoz"]}, {"partyID": "GoDtsUuYo5p8ED5Q", "userIDs": ["ZAufwNa8lzfjv9oY", "MXMjlVHY1AHwF3vG", "oav7MK0PcLnEkcok"]}], "userIDs": ["KwcQ0baDT9OyJ2h2", "3GUS2amU7syGlElX", "dEAOrVSnLocLVVYa"]}, {"parties": [{"partyID": "mQc4wcG5nDBLJoJH", "userIDs": ["biQ5duE5p4cfs2E4", "1cK8QTwiIAvxSvND", "lmM5nQFMGzs7fzjg"]}, {"partyID": "yc44mEh9tRk8knYS", "userIDs": ["V30lnroQehMDli6t", "9unQLYXxm09wpGAb", "pEmDY9vLh3u6EDsU"]}, {"partyID": "mrV6kH4OotKwG3UC", "userIDs": ["6XCnnZxF8CmQr17W", "65br34rBBN9tU6TD", "m5GloFSKWM1eym5y"]}], "userIDs": ["dC6p25xCWTqUOYZE", "NJ1QHZQxPRXH7uxB", "JEECQE1li3Bg7Jxc"]}, {"parties": [{"partyID": "9pUnZmvhidwCkZwq", "userIDs": ["jYLfTiCO1NDBvQvR", "PnAz4VzW0CpoBCby", "JsF5IjF1c0W338HS"]}, {"partyID": "6CBgVRyihYNZ84CV", "userIDs": ["hziXV8HwSmvcvcDK", "F19yVRafCjOuSYht", "83AdvBaagTiRJ8da"]}, {"partyID": "GTVX3Bb7jlz5IfHg", "userIDs": ["KjI9mwJSrN8jkIyk", "R2zbaI6PD7fEscSh", "nGUGUtV9GJ279GDb"]}], "userIDs": ["LNwjm3FK0nnX2poM", "fZ1hDHtbh4HtMlFg", "vh2Dp2SoiIPp1yvf"]}], "ticketIDs": ["AHS0VgLu11A3HTov", "Fi4tPAGfleyCA6jE", "tcqsnzoVILjkwW61"], "tieTeamsSessionLifetime": false, "type": "eTYAjdPlCiQQC35c", "version": 20}' \
    > test.out 2>&1
eval_tap $? 62 'PatchUpdateGameSession' test.out

#- 63 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AetsanzqP8oxfrtb' \
    --body '{"backfillTicketID": "ECD1CYPwaiBAxfYL"}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateGameSessionBackfillTicketID' test.out

#- 64 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8Avt70ZUT2fSk3LL' \
    > test.out 2>&1
eval_tap $? 64 'GameSessionGenerateCode' test.out

#- 65 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0calqxEewuGS469k' \
    > test.out 2>&1
eval_tap $? 65 'PublicRevokeGameSessionCode' test.out

#- 66 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2hG0WKt4sUmanYxM' \
    --body '{"platformID": "0UHZVNYzGMNIpWoS", "userID": "LkUrfuf4U3WeYeA9"}' \
    > test.out 2>&1
eval_tap $? 66 'PublicGameSessionInvite' test.out

#- 67 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 't2ENKKWrFtHIi1CM' \
    > test.out 2>&1
eval_tap $? 67 'JoinGameSession' test.out

#- 68 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gKAOG5iDcCR5PbCv' \
    --body '{"leaderID": "DLil8wj9cKM3Ar6M"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPromoteGameSessionLeader' test.out

#- 69 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'F35hCER4nGmWGgTJ' \
    > test.out 2>&1
eval_tap $? 69 'LeaveGameSession' test.out

#- 70 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'fHlJl4tHGa4XfZcd' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9CVnGqMX9FieeEss' \
    > test.out 2>&1
eval_tap $? 70 'PublicKickGameSessionMember' test.out

#- 71 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WEUl07bhwntCVqiY' \
    > test.out 2>&1
eval_tap $? 71 'PublicGameSessionReject' test.out

#- 72 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OJf5KwMZQjzvjSoz' \
    > test.out 2>&1
eval_tap $? 72 'GetSessionServerSecret' test.out

#- 73 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'v6CTRDl0zp9CzHFw' \
    --body '{"additionalMembers": [{"partyID": "inkBNi4gvqgl6TZ9", "userIDs": ["TGVPmv34h6T7Esuf", "mfxKYB4LM6H6QXmp", "Z9X3fUSR1l9xLPBs"]}, {"partyID": "mAUrD9L1IiD6MlcE", "userIDs": ["PhMDFzjHZ3sIhzOx", "2CXKlvIomU3pIxM9", "n8D2eLMe3lt9qfx2"]}, {"partyID": "UDcgVE7L9FK6e0Mr", "userIDs": ["Pc4vtxk9hVKlG56H", "lzGr7XjdyRJunZPk", "p6ccIBnWyPw8mj7g"]}], "proposedTeams": [{"parties": [{"partyID": "yQ7XdIszGRj46COP", "userIDs": ["ipH1MWVTHG0qHJCW", "EfOJpZm9yEYWNGMy", "2pgSGSUOK68eqGJt"]}, {"partyID": "Wf1Ybgg8rdwY9bmr", "userIDs": ["vHmO07KNqX9LM2Iw", "EsdOGBXBwnzDX8v3", "xgC1Ge9PdbTTAJ2G"]}, {"partyID": "p1r0sVZ6LJAOddIL", "userIDs": ["2l3hPjNDKv2LWfXq", "jr8fS79En3wYowBd", "kaZ3y6i38XQjLDRq"]}], "userIDs": ["kpiFK5BtiQ272Uo9", "UBJWodpdwsX1jorc", "yR0x3YiHF8ITGPRQ"]}, {"parties": [{"partyID": "BCgIs1Q2lzxl0yF5", "userIDs": ["m77TTh4gUoj8u2WR", "cLiEtzVlnkflfn7p", "HY48F1dl1q92m3iR"]}, {"partyID": "lfnBAk0CwiAsR65y", "userIDs": ["Q9ssuHdGmxncCEr0", "KcgeqzGbruNB72HH", "MkjzyBB4UFKiaoV0"]}, {"partyID": "VOem2yqPsMFxKybP", "userIDs": ["kbuS6x9cLJ1APnNl", "sa2bRBr27fVMWuAf", "DqLMR919IZPKOKiA"]}], "userIDs": ["VQXXOmqFHLbyXmgC", "NiXH8uenbC5CphgM", "weexsIAP5vHLjBJ9"]}, {"parties": [{"partyID": "iqMcBL4BzhDUjhKP", "userIDs": ["wbwcvQU5kG8bXGFm", "PAnOkDiJq4xQye7H", "qnVK3YVeOWs9mfVQ"]}, {"partyID": "h3jLBtn9pxpE7BYt", "userIDs": ["zB0B4CxyQrUpIFvO", "RxTi79DpSjb39ukc", "R6c2E2r3vk3IfAKE"]}, {"partyID": "bqcNXSGCCvNowNmd", "userIDs": ["pcJgF88ySNq4Mj7m", "ulP4tQ6R1OqKVOTn", "iBgLsNhdgQ0JWZjN"]}], "userIDs": ["RSzOTqcVNX3ahvxw", "9gwwhTnjN6wKZGW4", "y3f0R9s2kndhhZhw"]}], "version": 55}' \
    > test.out 2>&1
eval_tap $? 73 'AppendTeamGameSession' test.out

#- 74 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mfIZsWhkS476dGGJ' \
    --userId 'wJ00UH197MJ6zU7J' \
    > test.out 2>&1
eval_tap $? 74 'PublicGameSessionCancel' test.out

#- 75 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LMQyMWzYQCAaPJgo"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyJoinCode' test.out

#- 76 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xGJoJaSzUtY4ZD0X' \
    > test.out 2>&1
eval_tap $? 76 'PublicGetParty' test.out

#- 77 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tb0U4pH16NUsVY21' \
    --body '{"attributes": {"NVIs7NRen2Y3Ns0Q": {}, "JQeaWytPfds1BYx0": {}, "EaURydf8ZyyZeHAW": {}}, "inactiveTimeout": 66, "inviteTimeout": 13, "joinability": "vMUOPG0iHDT8QbF7", "maxPlayers": 12, "minPlayers": 69, "type": "FyOjApNHBVfNOURc", "version": 18}' \
    > test.out 2>&1
eval_tap $? 77 'PublicUpdateParty' test.out

#- 78 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zLyH1y72L13Ornyx' \
    --body '{"attributes": {"34luLdvtsTKXMjiw": {}, "6gYPvfn2Qt9iyq3N": {}, "yk8ncu2Z3eDHH9Wa": {}}, "inactiveTimeout": 98, "inviteTimeout": 11, "joinability": "O4iKhDcJ7TCcNIsQ", "maxPlayers": 78, "minPlayers": 86, "type": "GRXBJ6mVV7JS9qjN", "version": 77}' \
    > test.out 2>&1
eval_tap $? 78 'PublicPatchUpdateParty' test.out

#- 79 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'cxlCV4cNbJGQ57lP' \
    > test.out 2>&1
eval_tap $? 79 'PublicGeneratePartyCode' test.out

#- 80 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dinpjS2DRfGt9Gly' \
    > test.out 2>&1
eval_tap $? 80 'PublicRevokePartyCode' test.out

#- 81 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZVQ4X67tPZSTpPq3' \
    --body '{"platformID": "xjrElvvDgw0ag7kS", "userID": "WE0Hiqm5IuLryiEX"}' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyInvite' test.out

#- 82 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qvUWDjU1G0EVjVZw' \
    --body '{"leaderID": "1ToLuPakQN1MpOs1"}' \
    > test.out 2>&1
eval_tap $? 82 'PublicPromotePartyLeader' test.out

#- 83 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RVFrcg2CXxepx78f' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyJoin' test.out

#- 84 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'vsyhE2BKtyTDSIM7' \
    > test.out 2>&1
eval_tap $? 84 'PublicPartyLeave' test.out

#- 85 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mkmvZ7Cmsh4US8o4' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyReject' test.out

#- 86 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jfMANPpmZDdMiCxm' \
    --userId 'uCCVuFjS1GC1d2b9' \
    > test.out 2>&1
eval_tap $? 86 'PublicPartyCancel' test.out

#- 87 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '2B4vEgj3HOmhcWm4' \
    --userId '28XejRF94NIY9nMr' \
    > test.out 2>&1
eval_tap $? 87 'PublicPartyKick' test.out

#- 88 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"BZo0lNUBDShHD32v": {}, "vL28FPwTiXfLcxDC": {}, "9Ynd02mECIQhfIhH": {}}, "configurationName": "tADUQ9zimQTQT95p", "inactiveTimeout": 64, "inviteTimeout": 73, "joinability": "DhutDM6BqguqD5xx", "maxPlayers": 66, "members": [{"ID": "5NohXu6opxQGRt6P", "PlatformID": "qlkL0diRhLC10ih2", "PlatformUserID": "EQfY3XCv4hdOa6Fd"}, {"ID": "ZhNMd1onFjGRbxtA", "PlatformID": "BPXDmgNEJBhgGq5G", "PlatformUserID": "IDhNC66szbCCf73I"}, {"ID": "FbRkPSSITz4TjCrJ", "PlatformID": "HXGXku2YVuOzhxHm", "PlatformUserID": "nrrV9ZGWrZ05sxe6"}], "minPlayers": 55, "textChat": false, "type": "6RpmKDebNkylbynk"}' \
    > test.out 2>&1
eval_tap $? 88 'PublicCreateParty' test.out

#- 89 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 89 'PublicGetRecentPlayer' test.out

#- 90 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    > test.out 2>&1
eval_tap $? 90 'PublicGetRecentTeamPlayer' test.out

#- 91 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'T9vayLLiizac7Ge6' \
    --body '{"zKJdlt7rjF5RaJwv": {}, "kWVco2LTo5ijlvDF": {}, "8qBWCQ9dLWYyS8zd": {}}' \
    > test.out 2>&1
eval_tap $? 91 'PublicUpdateInsertSessionStorageLeader' test.out

#- 92 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hMeBXH8x6HdVfZVD' \
    --userId 'AiU6iJOF7JKZFNk2' \
    --body '{"NKy59X8iOg2sVBiC": {}, "oeC5weXJl7PeiMH8": {}, "z8dVej8N2yv6VTnO": {}}' \
    > test.out 2>&1
eval_tap $? 92 'PublicUpdateInsertSessionStorage' test.out

#- 93 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["K7xAvM7tuL81lsR7", "xxSVp3Gd2TK0HzYv", "iTgYmx82JVBRLPZ6"]}' \
    > test.out 2>&1
eval_tap $? 93 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 94 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'PublicGetPlayerAttributes' test.out

#- 95 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "5BoGiTCVsXsygWbj", "data": {"E2opXtdsJQeJ1too": {}, "0qvxphTLEEBGTtZy": {}, "TjdKNKgYazujsmSm": {}}, "platforms": [{"name": "ylT1YtxIq73aMb48", "userID": "jISd97KORRhxSWLW"}, {"name": "LNfHRD3V15QaGGL4", "userID": "6LuxJF3sbeqWBdQu"}, {"name": "WfgBAKx27MSBqabU", "userID": "XOGkkoMUZn1YXj5z"}], "roles": ["FZeOCOR9NvBQZSJP", "OIKrRBrYVzi9ui3l", "vozTt9TsH7A0TuU2"], "simultaneousPlatform": "aL4bPkk11sys6Gdk"}' \
    > test.out 2>&1
eval_tap $? 95 'PublicStorePlayerAttributes' test.out

#- 96 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'PublicDeletePlayerAttributes' test.out

#- 97 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'Dcos5uVJ0BJfZ0jv' \
    --orderBy 'A54CSqZFDsO1skRj' \
    --status 'OU1SMfQVQa6blj9R' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryMyGameSessions' test.out

#- 98 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'dd85bdYUumPKVSZC' \
    --orderBy 'g3XTc9vQe0dHJfF6' \
    --status 'KIuvnRCa9JktyBdx' \
    > test.out 2>&1
eval_tap $? 98 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE