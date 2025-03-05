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
echo "1..94"

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
eval_tap 0 6 'AdminGetDSMCConfigurationDefault # SKIP deprecated' test.out

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

#- 15 AdminUploadXBoxCertificate
eval_tap 0 15 'AdminUploadXBoxCertificate # SKIP deprecated' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 11, "PSNSupportedPlatforms": ["qUI06UpOXGSLmCVu", "HOPlLlkvR8sKgnuR", "kgghGoYupD391C2q"], "SessionTitle": "tPYokahFjkQsfCaT", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "t1d67FXGk2s9Q0mP", "XboxServiceConfigID": "Vo3twu0MesTCf9x4", "XboxSessionTemplateName": "rt69lna7qxNeIxPz", "XboxTitleID": "6MbwL6IY69z1UaLq", "localizedSessionName": {"YSYWytLPziZMdjxc": {}, "BZufQxGiHPllG4cY": {}, "EzfTD1ZBm3MqHcUm": {}}}, "PSNBaseUrl": "LZZbSqb8RwNmn9Hr", "appName": "NQy4uZAAiE0mit9R", "asyncProcessDSRequest": {"async": true, "timeout": 6}, "attributes": {"CHYzUOcEdscKHPEq": {}, "gA8yu7Vk6Jt4Ymos": {}, "9Jcdos4fYcTVU6RB": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "0zYoMcHyCUEXlAvx", "customURLGRPC": "JMdalwSyliWMNW5N", "deployment": "yLu0M3VHh2EI8JlD", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "Q9lNmqRBaAkLnvxk", "enableSecret": true, "fallbackClaimKeys": ["X68cmDc3fxU8MyKr", "QpM4hkkK6KKXNB3G", "v0IqmF51TkhjYnaq"], "grpcSessionConfig": {"appName": "6foWvXa3bMrXsDr6", "customURL": "kILsSSyDdmykmoPY", "functionFlag": 13}, "immutableStorage": false, "inactiveTimeout": 80, "inviteTimeout": 76, "joinability": "bN9oCMNqq98SjTvh", "leaderElectionGracePeriod": 19, "manualRejoin": false, "maxActiveSessions": 20, "maxPlayers": 92, "minPlayers": 23, "name": "Q70D0H6BXksUC9b6", "persistent": false, "preferredClaimKeys": ["x3poD3Qgb3boLQQ1", "MzH7Qm8bwbmXgdAP", "h1EThG96gAFKK2WD"], "requestedRegions": ["gCcxvONZm3EeERmD", "nyeFoF7VSZ6pf3vn", "eSD2Tb3g7mSQUhAE"], "textChat": true, "textChatMode": "NONE", "tieTeamsSessionLifetime": true, "ttlHours": 81, "type": "mjqU6YE3p4lSck0Z"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --name '0nSBJroav91GXlvP' \
    --offset '67' \
    --order 'W18iGeUlc9d9sogW' \
    --orderBy 'a24CKNS0GqVvUfHQ' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'vsHXNUNe4mhgo5QB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '65lSAiYnNjkfZrQv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 66, "PSNSupportedPlatforms": ["oZk03QXcKMDYDDxH", "SZjtqXyJ58f7Gc26", "SaiGVkydwYWQG26y"], "SessionTitle": "UZNmTBcvrbYCwZtx", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "LtI8ilbyDPUIj88c", "XboxServiceConfigID": "ekdqCt81P1ktfIov", "XboxSessionTemplateName": "mv9gsR5cJcHm3SZL", "XboxTitleID": "xoRDFuuuySj29a9L", "localizedSessionName": {"JE8HoRS1X2PFAAMw": {}, "zHPxB1UskYs4Yw20": {}, "DOqOBSC2DKHRuPMM": {}}}, "PSNBaseUrl": "WH8Yb33T5UBJCjfc", "appName": "nLRfxeCSz9WEi8Kl", "asyncProcessDSRequest": {"async": false, "timeout": 29}, "attributes": {"8wdNFLTm5T50x9WT": {}, "0GfH2rtOa4EXsXzO": {}, "XQAk4mqrxzTtuLl4": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "bGL8QOxtjzm8y2wN", "customURLGRPC": "hmwoYZyI4EFZKBcY", "deployment": "rCEAE7WIsfmx40NL", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "06DJgas4b6z3LNUj", "enableSecret": false, "fallbackClaimKeys": ["FeIaFQCYoDPICpnd", "uEEQlULdJz4mnRBk", "MNxvvKgAT8mJrYq6"], "grpcSessionConfig": {"appName": "hRkloqxM3gpwxcfM", "customURL": "y9XzjjI5YbsKoADk", "functionFlag": 52}, "immutableStorage": true, "inactiveTimeout": 73, "inviteTimeout": 0, "joinability": "EN2VHzih3bit0VWn", "leaderElectionGracePeriod": 27, "manualRejoin": true, "maxActiveSessions": 10, "maxPlayers": 83, "minPlayers": 41, "name": "39PXDNxtXgeO3Fgk", "persistent": true, "preferredClaimKeys": ["hjDzaQY3snn2ZkP7", "cFdP43e5dC9XIBud", "fZgrbHDIDm4hMzF4"], "requestedRegions": ["TxodenSrUTvfqU0b", "foMm5cTtFWbotQyX", "JRcQWsmqPNs92epx"], "textChat": false, "textChatMode": "TEAM", "tieTeamsSessionLifetime": false, "ttlHours": 41, "type": "8VxsZNereSvf9699"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'mCEHThUJkETAsSp7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'gh4TeUTkOkAYfJB8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AT9t4Tv207Y2QD3o' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'D5fLCr3OOlXVv8ZG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "F7uYnGzpipNDigNJ"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'ma1MbqqZtfNWql4n' \
    --dsPodName 'mwAft4gqkNNlWkD9' \
    --fromTime 'eOziYRFOn0jJLHC9' \
    --gameMode 'LxhvNXTwGBCtohLt' \
    --isPersistent 'l9Zuhytm5UDrT6QX' \
    --isSoftDeleted 'Cs5SPBbRPZTF6oQA' \
    --joinability 'XVG7tnsZg5QgXjvy' \
    --limit '67' \
    --matchPool 'm7Ta1PsKc50Kv6ec' \
    --memberID 'nEevcAx2K2zkRenm' \
    --offset '85' \
    --order 'sjUgxBkF6wFPoJeQ' \
    --orderBy 'ediogEhhM2rIizGd' \
    --sessionID 'KvOPdq5xrgxSmy1D' \
    --status 'N9LFkYW5DQyj4bj5' \
    --statusV2 'Ro2ogaKt2ujQSa3Z' \
    --toTime 'db65UXmy0Zp6iIaT' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"IKUkmkk9QM0NBMA9": {}, "ORxpzwLR2AK6eXUG": {}, "PJsw1fiP80G9Pclx": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["cft2ulIJzPyrVEiO", "G4UcqsuGKHhMRWLV", "d3DlhLuIpomM8sm1"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MiaI1mX2tJoARtdb' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'epnDCjgyJlXe36mg' \
    --body '{"createdRegion": "WjLfFmteue9nzJ6f", "deployment": "H24T805tVg8JqU0j", "description": "ZpjvsugAOS7u8RiW", "ip": "yerCSa8SRgwsAj1i", "port": 21, "region": "sB0NRsB1fPqqRRul", "serverId": "pqpymDkQhtrHWwRV", "source": "nwVBOqOHi8pWGd1j", "status": "uYhiqjRJOqB5F93z"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'FQbJndUDpdONneAc' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zbBdHb2slt71B1Sm' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'Zp2JZp50CnPb71OR' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YcmQbTU5JX8ccLjM' \
    --statusType 'XJRk0eaKQDOJvrTe' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '12' \
    --order 'KlONk2Q5Y4Jvaizw' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --fromTime 'iilatuUjjt9lIMGq' \
    --isSoftDeleted 'l5ElEa9EIIlGcHB3' \
    --joinability 'CfR3ncDlwi3v3MFF' \
    --key 'J1KesKoELCpobBEG' \
    --leaderID '8X645xpdXpai0rYa' \
    --limit '94' \
    --memberID 'x4yiPX6ues1Hhhkg' \
    --memberStatus '1yLVbLFzHEP8cM4N' \
    --offset '94' \
    --order 'W3VgsZXiR1DJ7HVW' \
    --orderBy 'qMkNSawQUWDFJvJB' \
    --partyID 'Wic7UkBeIXuqDuAX' \
    --toTime 'I66bQ71w0deoV9Lx' \
    --value '5RDA1l2XcrciYNEz' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["vSZIPkhSgORcz5S5", "BvmgBLxh4ijFnE3T", "am69qSZ7PC6f6Qkm"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZXElW9YfRSse6AAz' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadPartySessionStorage' test.out

#- 36 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlatformCredentials' test.out

#- 37 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "3S4czz0QKFlAVmVL", "clientSecret": "u4AOec0z8eBeeoip", "scope": "68J1nsv4W2OJhtaf"}}' \
    > test.out 2>&1
eval_tap $? 37 'AdminUpdatePlatformCredentials' test.out

#- 38 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'AdminDeletePlatformCredentials' test.out

#- 39 AdminDeletePlatformCredentialsByPlatformId
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentialsByPlatformId \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeletePlatformCredentialsByPlatformId' test.out

#- 40 AdminSyncPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminSyncPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 40 'AdminSyncPlatformCredentials' test.out

#- 41 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --userId 'lKHzGlLKWUtDQs61' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --userId 'LOexL4fZvWtND2tc' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BFpX8lNtFEJ7tnkY' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6Mca5afj12K2IzrB' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vvWm4udE0OXudXgN' \
    --userId 'ne8kJATwlc6esUp6' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'Sw1I98jeZQ7hfxnh' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ld3Knaknoed9DHhL' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'OqQGhCUr6iTrjyEg' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "arAdNJOIG36I6tRb", "attributes": {"RcrEveMdAdiPKDUV": {}, "SC00PYeDcagginxn": {}, "FIna3yddcbsPheTH": {}}, "autoJoin": false, "backfillTicketID": "6IUJNvYuGRUvpZaH", "clientVersion": "CuESOiIZsMfB4ZH3", "configurationName": "mtgWgU4pCAKxeE70", "customURLGRPC": "CaunQNxot371W9G4", "deployment": "AvQkqsGnmyo5JJTU", "dsSource": "Vmb8GEXFTlEMEsFz", "fallbackClaimKeys": ["YqwgK1Np5nodqpLm", "7FhJBNXzAFdO0Khq", "f6kiTdSGv2LFjAKY"], "inactiveTimeout": 30, "inviteTimeout": 58, "joinability": "zRmDD0jJvlfV5Oem", "matchPool": "PYdYT7DROCjtuzFM", "maxPlayers": 2, "minPlayers": 29, "preferredClaimKeys": ["AG9YI89hmguB8FOT", "jMLo4b9rIzqYkEps", "tyVTBcrM8rG0rH0z"], "requestedRegions": ["cswwVeMK6MbGIVIu", "8vvwLc7KY3uVoJXT", "IMtpgkieDyF97lGd"], "serverName": "MiHKxbWCYzo8yO2K", "storage": {"leader": {"TK9tmmOnYnOpas6g": {}, "hP1y4Zi7s7QBlk44": {}, "Z44B1GZgKg4uKxaC": {}}}, "teams": [{"parties": [{"partyID": "gcGLuC3brWdTYCfH", "userIDs": ["kIySok5DiXZtLW87", "rGysryod3dNQrmsA", "pRA6HX3RwrKt2eco"]}, {"partyID": "zL0TOg54vCE48L5o", "userIDs": ["LF6M4lNa4JUMSHNg", "qRqCV7usamANkZlO", "X9Sfo95HgXqKhTPk"]}, {"partyID": "wfLM9uSybRzWek2g", "userIDs": ["ZvRrvr0n9d9lvccK", "MLhrTrcBE2ItBS3K", "tKZWe8aoFzAyBME7"]}], "teamID": "4HUtipUWYhWV1qx8", "userIDs": ["CzPML52faXUr9Sk4", "lq2faBcAXXKlhvyH", "8paOJtxqMPpcVfRw"]}, {"parties": [{"partyID": "Nj547fH0XrKEDpEY", "userIDs": ["8VnocGAjci0V3tBf", "2jnHGKXphn50c9tN", "LDljhZ2jxLRX3z46"]}, {"partyID": "OCaGBeMfPlNos4yB", "userIDs": ["RjrERHEonAZR8GmE", "u0q1p6QCyY6vSkVF", "WdsbYuVEGVxYheR3"]}, {"partyID": "j5mNZ6vwv7K8Asvt", "userIDs": ["1j1Rx59hesNWy2Nv", "Z85DDKDAF8KDsBZO", "uYQJ03BAHZ7c53q7"]}], "teamID": "akMpcmnnx6RVBrop", "userIDs": ["9v7aZK3h65hbN15z", "fQSfQrtfF3TQN0Oc", "NDLr36vzohZyjMQA"]}, {"parties": [{"partyID": "g5mPYhrLTyU8Ohgf", "userIDs": ["Y9JQYGF4bYXEcENx", "9xZlAchob44lONDD", "wMvgI0HlyPR7wZNi"]}, {"partyID": "VsF6xG2mXEQdbzIV", "userIDs": ["y8alncV7vWgSHdfo", "07UctPErqxyMyOK0", "6MqQBErxgjVBycvU"]}, {"partyID": "4PbmRDcrg0DjQjBE", "userIDs": ["CXvea7H1m2lJFRZ3", "ZprZ60zMjhTHeh94", "TSenE5hCFkIf5weq"]}], "teamID": "Z18MH57l2Zsrh90E", "userIDs": ["TtYmGukz3MnlrjcH", "p6B8Vj7rXFgDnDkd", "Z9bpjb1tdA3QhjCM"]}], "textChat": false, "textChatMode": "GAME", "ticketIDs": ["hsYpKPlXn77AtYoF", "zLAATPY8P8P3cfoi", "vvQxevecWw7Rry0K"], "tieTeamsSessionLifetime": true, "type": "5rgAGO0dW8rX2MVU"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"GKSZ4GcLkt4pK32s": {}, "JxlZcCTpTdRtCHvu": {}, "k6B6XTmSLyn50sig": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "BVZxiKdV57GvRyd9"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'UuL02Le8HSCslsDd' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4M1F5qRIblS7Nz81' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GRazPAANjfBoldFO' \
    --body '{"attributes": {"yqA2clJ5gEOaCgM6": {}, "Yn6RugbNEIpGBFUj": {}, "On5mM7k8nbLzvtCI": {}}, "backfillTicketID": "W5ynMKquUicAeIVX", "clientVersion": "toWAXhMlW4tLqX7O", "deployment": "ICf5oD1e6oI9FmYe", "fallbackClaimKeys": ["l0kOw72o8Zkgk0jS", "6rDWUwfhKvrf2AaH", "4yCWrHSppnIZkNnT"], "inactiveTimeout": 27, "inviteTimeout": 13, "joinability": "3rzH5NvAtcvNedgS", "matchPool": "1fUfKmihDbmu8ePW", "maxPlayers": 24, "minPlayers": 59, "preferredClaimKeys": ["QMVDXEHeiGTnwyEw", "6hIWDZrpP7rz3ISW", "510kHr4isTKWjmv6"], "requestedRegions": ["7nuHCXWfwnwGioVw", "VzmmBVVFfpqx1AeL", "tzcPJ3jtDYBo4FUT"], "teams": [{"parties": [{"partyID": "H7CGfKSyxgRR1DiC", "userIDs": ["qSMzpqIFGLkDs7AC", "C1RgBfoNrHlFi2qJ", "LgmBLE35YhyiDV90"]}, {"partyID": "SeI5yppBHoytVznC", "userIDs": ["gNyx9fbT63ShEh8P", "bGikLjgjcj34uulU", "6FYBZsWFbr3RSP0W"]}, {"partyID": "9nBhvhf8Q0DtJMcY", "userIDs": ["QdN66bswAgt65X4N", "1LQZmB61JMdtwCVU", "rYQue84dwmbwFEnA"]}], "teamID": "ZaWsQJtRYoagRJK5", "userIDs": ["PX9UcOvhPyE11TRT", "2SKseoe8VLie0LBa", "36KNzjf005CXNGeh"]}, {"parties": [{"partyID": "Q2aTjTDfKFDXC7eG", "userIDs": ["L5YhJDWh9YWqc0qg", "V6d9yOfIMLds2DbP", "caoMdtRLTmSvTkQQ"]}, {"partyID": "gB7exYvmHMxr5hPC", "userIDs": ["JJztJBg0tTJg46Ie", "wOXE2AkCh3QIZsUf", "8lGFXcmwTERHclOd"]}, {"partyID": "xIwqejxe18rNdb8O", "userIDs": ["tq6j1mqUav7k05HA", "QltnSojV4jT65ycl", "X2FtAz0vJjFIYWOa"]}], "teamID": "NdsimmkW2miH3xRH", "userIDs": ["AKy4QxZkaXZ7vmiE", "d0JPxVyQpshaDwNq", "TbbFMXAMfVXe0GZe"]}, {"parties": [{"partyID": "MgsRsmH1EQrYmkPK", "userIDs": ["TPOlhTtSiZNCxuog", "FteTHJe4BhSSQkQD", "6WmOt6D7ufFVTOhv"]}, {"partyID": "QpfbBke8aEdd36xj", "userIDs": ["6wySoltDxsbzxrla", "KEfkoYjY2o6ouRW9", "UtNquwC3WgumrIz4"]}, {"partyID": "NhGztZpr4U4fwQIi", "userIDs": ["LXgmRasvjO4lj8m3", "XEwP2b4gd3xOeii8", "Jnmssep2xD2NY0kA"]}], "teamID": "BeGs9yxahld1pO0G", "userIDs": ["yf5PO3COyMvczgEp", "zZ3FbtxfhcRC7IVY", "a6iZ5uFRYNn3SHiW"]}], "ticketIDs": ["xF0YbuU5ar5qTLWU", "Cy0Afgc050XIZRW4", "91e94mQjVOOBnIWh"], "tieTeamsSessionLifetime": true, "type": "7w0Oc15N8WXBPp17", "version": 85}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'y1ei1fIrPvfHnRN0' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6EjRwEQlNapJRfk4' \
    --body '{"attributes": {"f9Zcw1pEHAyNFxcV": {}, "TKuAQTGh5BxjWOoz": {}, "GoDtsUuYo5p8ED5Q": {}}, "backfillTicketID": "ZAufwNa8lzfjv9oY", "clientVersion": "MXMjlVHY1AHwF3vG", "deployment": "oav7MK0PcLnEkcok", "fallbackClaimKeys": ["KwcQ0baDT9OyJ2h2", "3GUS2amU7syGlElX", "dEAOrVSnLocLVVYa"], "inactiveTimeout": 24, "inviteTimeout": 36, "joinability": "Qc4wcG5nDBLJoJHb", "matchPool": "iQ5duE5p4cfs2E41", "maxPlayers": 4, "minPlayers": 14, "preferredClaimKeys": ["K8QTwiIAvxSvNDlm", "M5nQFMGzs7fzjgyc", "44mEh9tRk8knYSV3"], "requestedRegions": ["0lnroQehMDli6t9u", "nQLYXxm09wpGAbpE", "mDY9vLh3u6EDsUmr"], "teams": [{"parties": [{"partyID": "V6kH4OotKwG3UC6X", "userIDs": ["CnnZxF8CmQr17W65", "br34rBBN9tU6TDm5", "GloFSKWM1eym5ydC"]}, {"partyID": "6p25xCWTqUOYZENJ", "userIDs": ["1QHZQxPRXH7uxBJE", "ECQE1li3Bg7Jxc9p", "UnZmvhidwCkZwqjY"]}, {"partyID": "LfTiCO1NDBvQvRPn", "userIDs": ["Az4VzW0CpoBCbyJs", "F5IjF1c0W338HS6C", "BgVRyihYNZ84CVhz"]}], "teamID": "iXV8HwSmvcvcDKF1", "userIDs": ["9yVRafCjOuSYht83", "AdvBaagTiRJ8daGT", "VX3Bb7jlz5IfHgKj"]}, {"parties": [{"partyID": "I9mwJSrN8jkIykR2", "userIDs": ["zbaI6PD7fEscShnG", "UGUtV9GJ279GDbLN", "wjm3FK0nnX2poMfZ"]}, {"partyID": "1hDHtbh4HtMlFgvh", "userIDs": ["2Dp2SoiIPp1yvfAH", "S0VgLu11A3HTovFi", "4tPAGfleyCA6jEtc"]}, {"partyID": "qsnzoVILjkwW61du", "userIDs": ["F87aUyrdt4XSpWBA", "etsanzqP8oxfrtbE", "CD1CYPwaiBAxfYL8"]}], "teamID": "Avt70ZUT2fSk3LL0", "userIDs": ["calqxEewuGS469k2", "hG0WKt4sUmanYxM0", "UHZVNYzGMNIpWoSL"]}, {"parties": [{"partyID": "kUrfuf4U3WeYeA9t", "userIDs": ["2ENKKWrFtHIi1CMg", "KAOG5iDcCR5PbCvD", "Lil8wj9cKM3Ar6MF"]}, {"partyID": "35hCER4nGmWGgTJf", "userIDs": ["HlJl4tHGa4XfZcd9", "CVnGqMX9FieeEssW", "EUl07bhwntCVqiYO"]}, {"partyID": "Jf5KwMZQjzvjSozv", "userIDs": ["6CTRDl0zp9CzHFwi", "nkBNi4gvqgl6TZ9T", "GVPmv34h6T7Esufm"]}], "teamID": "fxKYB4LM6H6QXmpZ", "userIDs": ["9X3fUSR1l9xLPBsm", "AUrD9L1IiD6MlcEP", "hMDFzjHZ3sIhzOx2"]}], "ticketIDs": ["CXKlvIomU3pIxM9n", "8D2eLMe3lt9qfx2U", "DcgVE7L9FK6e0MrP"], "tieTeamsSessionLifetime": false, "type": "aMYvNQOsDa4bkcge", "version": 31}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Gr7XjdyRJunZPkp6' \
    --body '{"backfillTicketID": "ccIBnWyPw8mj7gyQ"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7XdIszGRj46COPip' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'H1MWVTHG0qHJCWEf' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OJpZm9yEYWNGMy2p' \
    --body '{"metadata": {"gSGSUOK68eqGJtWf": "1Ybgg8rdwY9bmrvH", "mO07KNqX9LM2IwEs": "dOGBXBwnzDX8v3xg", "C1Ge9PdbTTAJ2Gp1": "r0sVZ6LJAOddIL2l"}, "platformID": "3hPjNDKv2LWfXqjr", "userID": "8fS79En3wYowBdka"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Z3y6i38XQjLDRqkp' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iFK5BtiQ272Uo9UB' \
    --body '{"leaderID": "JWodpdwsX1jorcyR"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0x3YiHF8ITGPRQBC' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'gIs1Q2lzxl0yF5m7' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7TTh4gUoj8u2WRcL' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iEtzVlnkflfn7pHY' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '48F1dl1q92m3iRlf' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nBAk0CwiAsR65yQ9' \
    --userId 'ssuHdGmxncCEr0Kc' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "geqzGbruNB72HHMk"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jzyBB4UFKiaoV0VO' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'em2yqPsMFxKybPkb' \
    --body '{"attributes": {"uS6x9cLJ1APnNlsa": {}, "2bRBr27fVMWuAfDq": {}, "LMR919IZPKOKiAVQ": {}}, "inactiveTimeout": 87, "inviteTimeout": 100, "joinability": "OmqFHLbyXmgCNiXH", "maxPlayers": 71, "minPlayers": 43, "type": "0uGcL1koyHjCH5ol", "version": 54}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LETRpABAmO2EGvJ4' \
    --body '{"attributes": {"UMS93yOxNInDByhn": {}, "oluO6ti0QP2ssiJ6": {}, "6OzOj84O6tgohjtC": {}}, "inactiveTimeout": 10, "inviteTimeout": 2, "joinability": "OWs9mfVQh3jLBtn9", "maxPlayers": 32, "minPlayers": 49, "type": "xpE7BYtzB0B4CxyQ", "version": 36}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'g6IKWVZ77KeRWdEC' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aFGzfZ2hxcJ2Fnem' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'n7M23SzUo4hNBDh9' \
    --body '{"metadata": {"ZFP1OW0nXOErQPS4": "VsRoYIK69yg9ADCG", "iXaLs2xjHkinOD97": "5nARHCmhNHSXuqIH", "sxvaUoXDmwWsukxn": "cuD3QxCXMd00YBWC"}, "platformID": "aVVmM45mfIZsWhkS", "userID": "476dGGJwJ00UH197"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MJ6zU7JLMQyMWzYQ' \
    --body '{"leaderID": "CAaPJgoxGJoJaSzU"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tY4ZD0Xtb0U4pH16' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NUsVY21NVIs7NRen' \
    --userId '2Y3Ns0QJQeaWytPf' \
    --body '{"ds1BYx0EaURydf8Z": {}, "yyZeHAWGgJUbUJRM": {}, "bkcTglbU86FyOjAp": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NHBVfNOURcjY3YYT' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '9oTynmfIuBWgJTNF' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fM8M0IW4oe8KDgy0' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xZfAcNg14Ws8TIP1' \
    --userId 'LKiFQoLDvumfqrgS' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fnx2h61X9dN1MGRX' \
    --userId 'BJ6mVV7JS9qjNLwv' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"I8JdiY3RRiLilmOG": {}, "F6dLLIeIVIjMcdlb": {}, "dRXTGIrdNL5gJPqT": {}}, "configurationName": "AjgqaTHf1ANTJ9Yk", "inactiveTimeout": 69, "inviteTimeout": 17, "joinability": "7XkGOdC6ItxDT8p4", "maxPlayers": 27, "members": [{"ID": "jU1G0EVjVZw1ToLu", "PlatformID": "PakQN1MpOs1RVFrc", "PlatformUserID": "g2CXxepx78fvsyhE"}, {"ID": "2BKtyTDSIM7mkmvZ", "PlatformID": "7Cmsh4US8o4jfMAN", "PlatformUserID": "PpmZDdMiCxmuCCVu"}, {"ID": "FjS1GC1d2b92B4vE", "PlatformID": "gj3HOmhcWm428Xej", "PlatformUserID": "RF94NIY9nMrBZo0l"}], "minPlayers": 82, "textChat": false, "type": "UBDShHD32vvL28FP"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TiXfLcxDC9Ynd02m' \
    --body '{"ECIQhfIhHtADUQ9z": {}, "imQTQT95pFJUAJsy": {}, "AfeKOufV4f15NohX": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'u6opxQGRt6PqlkL0' \
    --userId 'diRhLC10ih2EQfY3' \
    --body '{"XCv4hdOa6FdZhNMd": {}, "1onFjGRbxtABPXDm": {}, "gNEJBhgGq5GIDhNC": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["66szbCCf73IFbRkP", "SSITz4TjCrJHXGXk", "u2YVuOzhxHmnrrV9"]}' \
    > test.out 2>&1
eval_tap $? 89 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 90 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'PublicGetPlayerAttributes' test.out

#- 91 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "WrZ05sxe6A6RpmKD", "data": {"ebNkylbynkgT9vay": {}, "LLiizac7Ge6zKJdl": {}, "t7rjF5RaJwvkWVco": {}}, "platforms": [{"name": "2LTo5ijlvDF8qBWC", "userID": "Q9dLWYyS8zdhMeBX"}, {"name": "H8x6HdVfZVDAiU6i", "userID": "JOF7JKZFNk2NKy59"}, {"name": "X8iOg2sVBiCoeC5w", "userID": "eXJl7PeiMH8z8dVe"}], "roles": ["j8N2yv6VTnOK7xAv", "M7tuL81lsR7xxSVp", "3Gd2TK0HzYviTgYm"], "simultaneousPlatform": "x82JVBRLPZ6Iz8tn"}' \
    > test.out 2>&1
eval_tap $? 91 'PublicStorePlayerAttributes' test.out

#- 92 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'PublicDeletePlayerAttributes' test.out

#- 93 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'e5dbguBF6Gsvvdl8' \
    --orderBy 'jHz9x7XZIjU4IK9l' \
    --status 'OLaZaMphKCqTq3EV' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'heJjoEEXBLIxGnNu' \
    --orderBy 'hoJM3WWPvvCiCf33' \
    --status 'ViEdqQpoGkUWNizk' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE