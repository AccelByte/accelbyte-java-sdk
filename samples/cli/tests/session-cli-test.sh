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
echo "1..93"

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

#- 15 AdminUploadXBoxCertificate
eval_tap 0 15 'AdminUploadXBoxCertificate # SKIP deprecated' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 11, "PSNSupportedPlatforms": ["qUI06UpOXGSLmCVu", "HOPlLlkvR8sKgnuR", "kgghGoYupD391C2q"], "SessionTitle": "tPYokahFjkQsfCaT", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "t1d67FXGk2s9Q0mP", "XboxServiceConfigID": "Vo3twu0MesTCf9x4", "XboxSessionTemplateName": "rt69lna7qxNeIxPz", "XboxTitleID": "6MbwL6IY69z1UaLq", "localizedSessionName": {"YSYWytLPziZMdjxc": {}, "BZufQxGiHPllG4cY": {}, "EzfTD1ZBm3MqHcUm": {}}}, "PSNBaseUrl": "LZZbSqb8RwNmn9Hr", "appName": "NQy4uZAAiE0mit9R", "attributes": {"GCCHYzUOcEdscKHP": {}, "EqgA8yu7Vk6Jt4Ym": {}, "os9Jcdos4fYcTVU6": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "vCkGZ5dAgqxpBFma", "customURLGRPC": "Loxozr6wfNPX2bOI", "deployment": "tRMvqtlB2jJCSQT2", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": false, "dsSource": "YGu0rdlgdWyOtXi3", "enableSecret": false, "fallbackClaimKeys": ["xkT1X68cmDc3fxU8", "MyKrQpM4hkkK6KKX", "NB3Gv0IqmF51Tkhj"], "grpcSessionConfig": {"appName": "Ynaq6foWvXa3bMrX", "customURL": "sDr6kILsSSyDdmyk", "functionFlag": 26}, "immutableStorage": false, "inactiveTimeout": 17, "inviteTimeout": 84, "joinability": "l35MXbN9oCMNqq98", "leaderElectionGracePeriod": 92, "manualRejoin": false, "maxActiveSessions": 19, "maxPlayers": 10, "minPlayers": 93, "name": "4IxjUkl535X3ateE", "persistent": true, "preferredClaimKeys": ["DpADz1x3poD3Qgb3", "boLQQ1MzH7Qm8bwb", "mXgdAPh1EThG96gA"], "requestedRegions": ["FKK2WDgCcxvONZm3", "EeERmDnyeFoF7VSZ", "6pf3vneSD2Tb3g7m"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "UhAEtrmjqU6YE3p4"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --name 'SiZqan0nSBJroav9' \
    --offset '1' \
    --order 'GXlvPG6bFYReVHQi' \
    --orderBy 'pcCx9Zw5D2L7vIYh' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'GGSyEW4ZJJ42d3PB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'ddN8S48l9lyNApfl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 47, "PSNSupportedPlatforms": ["fZrQvGgbLdLsFzHk", "BMr1yrOMlNFSrUEi", "rnjX9fDmIbeZxzfT"], "SessionTitle": "cyiuATus9hsfpFDc", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "wZtxFHyPLtI8ilby", "XboxServiceConfigID": "DPUIj88cekdqCt81", "XboxSessionTemplateName": "P1ktfIovmv9gsR5c", "XboxTitleID": "JcHm3SZLxoRDFuuu", "localizedSessionName": {"ySj29a9LJE8HoRS1": {}, "X2PFAAMwzHPxB1Us": {}, "kYs4Yw20DOqOBSC2": {}}}, "PSNBaseUrl": "DKHRuPMMWH8Yb33T", "appName": "5UBJCjfcnLRfxeCS", "attributes": {"z9WEi8KlloeH0JT1": {}, "yduat2vQR3biBfsu": {}, "4jmsRE2w1yEkLgh3": {}}, "autoJoin": true, "autoLeaveSession": true, "clientVersion": "IYt4SqYUTLDx9gIi", "customURLGRPC": "DandpGT2t24aOMh5", "deployment": "eC3IHeHSKLCa3xre", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "ehwH3q31A806DJga", "enableSecret": true, "fallbackClaimKeys": ["hzfe2NubeoKFeIaF", "QCYoDPICpnduEEQl", "ULdJz4mnRBkMNxvv"], "grpcSessionConfig": {"appName": "KgAT8mJrYq6hRklo", "customURL": "qxM3gpwxcfMy9Xzj", "functionFlag": 20}, "immutableStorage": false, "inactiveTimeout": 5, "inviteTimeout": 3, "joinability": "NaKDUL3sa13lk1dQ", "leaderElectionGracePeriod": 56, "manualRejoin": false, "maxActiveSessions": 83, "maxPlayers": 16, "minPlayers": 39, "name": "6IlBhnetU4RwTqUX", "persistent": false, "preferredClaimKeys": ["geO3FgkXhjDzaQY3", "snn2ZkP7cFdP43e5", "dC9XIBudfZgrbHDI"], "requestedRegions": ["Dm4hMzF4TxodenSr", "UTvfqU0bfoMm5cTt", "FWbotQyXJRcQWsmq"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "s92epxk0i8VxsZNe"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'reSvf9699mCEHThU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'JkETAsSp7gh4TeUT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kOkAYfJB8AT9t4Tv' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name '207Y2QD3oD5fLCr3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "OOlXVv8ZGF7uYnGz"}' \
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
    --configurationName 'pipNDigNJma1Mbqq' \
    --dsPodName 'ZtfNWql4nmwAft4g' \
    --fromTime 'qkNNlWkD9eOziYRF' \
    --gameMode 'On0jJLHC9LxhvNXT' \
    --isPersistent 'wGBCtohLtl9Zuhyt' \
    --isSoftDeleted 'm5UDrT6QXCs5SPBb' \
    --joinability 'RPZTF6oQAXVG7tns' \
    --limit '12' \
    --matchPool 'fSiM9331m7Ta1PsK' \
    --memberID 'c50Kv6ecnEevcAx2' \
    --offset '74' \
    --order 'BJehyxlNsjUgxBkF' \
    --orderBy '6wFPoJeQediogEhh' \
    --sessionID 'M2rIizGdKvOPdq5x' \
    --status 'rgxSmy1DN9LFkYW5' \
    --statusV2 'DQyj4bj5Ro2ogaKt' \
    --toTime '2ujQSa3Zdb65UXmy' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"0Zp6iIaTIKUkmkk9": {}, "QM0NBMA9ORxpzwLR": {}, "2AK6eXUGPJsw1fiP": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["80G9Pclxcft2ulIJ", "zPyrVEiOG4UcqsuG", "KHhMRWLVd3DlhLuI"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pomM8sm1MiaI1mX2' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'ugBp3HBvepnDCjgy' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JlXe36mgWjLfFmte' \
    > test.out 2>&1
eval_tap $? 29 'AdminKickGameSessionMember' test.out

#- 30 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'ue9nzJ6fH24T805t' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Vg8JqU0jZpjvsugA' \
    --statusType 'OS7u8RiWyerCSa8S' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateGameSessionMember' test.out

#- 31 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '26' \
    --order 'gwsAj1ik1jglaDXT' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetListNativeSession' test.out

#- 32 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'vKCWwNTAhd2wrS0u' \
    --joinability 'Pdjhdinpng5BLy8w' \
    --key 'bhMssAHjapIkY9Rf' \
    --leaderID '4wP57dBZNR88YbCt' \
    --limit '25' \
    --memberID 'dONneAczbBdHb2sl' \
    --memberStatus 't71B1SmZp2JZp50C' \
    --offset '28' \
    --order 'TS1j02o7JjTXAQN0' \
    --orderBy 'qdskdQV0TqI8EFnm' \
    --partyID 'DbxIxi4YKlONk2Q5' \
    --value 'Y4JvaizwiilatuUj' \
    > test.out 2>&1
eval_tap $? 32 'AdminQueryParties' test.out

#- 33 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["jt9lIMGql5ElEa9E", "IIlGcHB3CfR3ncDl", "wi3v3MFFJ1KesKoE"]}' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteBulkParties' test.out

#- 34 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LCpobBEG8X645xpd' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadPartySessionStorage' test.out

#- 35 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminGetPlatformCredentials' test.out

#- 36 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "Xpai0rYaT5hOPjaf", "clientSecret": "3H0tYighU0VUfcYH", "scope": "JbBfAKSiPW3VgsZX"}}' \
    > test.out 2>&1
eval_tap $? 36 'AdminUpdatePlatformCredentials' test.out

#- 37 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'AdminDeletePlatformCredentials' test.out

#- 38 AdminDeletePlatformCredentialsByPlatformId
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentialsByPlatformId \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PSN' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeletePlatformCredentialsByPlatformId' test.out

#- 39 AdminSyncPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminSyncPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 39 'AdminSyncPlatformCredentials' test.out

#- 40 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --userId 'mTej52WKi6tArAUR' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetRecentPlayer' test.out

#- 41 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --userId 'WDFJvJBWic7UkBeI' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentTeamPlayer' test.out

#- 42 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XuqDuAXI66bQ71w0' \
    > test.out 2>&1
eval_tap $? 42 'AdminReadSessionStorage' test.out

#- 43 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'deoV9Lx5RDA1l2Xc' \
    > test.out 2>&1
eval_tap $? 43 'AdminDeleteUserSessionStorage' test.out

#- 44 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rciYNEzvSZIPkhSg' \
    --userId 'ORcz5S5BvmgBLxh4' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadUserSessionStorage' test.out

#- 45 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'ijFnE3Tam69qSZ7P' \
    > test.out 2>&1
eval_tap $? 45 'AdminQueryPlayerAttributes' test.out

#- 46 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'C6f6QkmZXElW9YfR' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetPlayerAttributes' test.out

#- 47 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sse6AAz3S4czz0QK' \
    > test.out 2>&1
eval_tap $? 47 'AdminSyncNativeSession' test.out

#- 48 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "FlAVmVLu4AOec0z8", "attributes": {"eBeeoip68J1nsv4W": {}, "2OJhtafxMSJlHeb3": {}, "4sZKHcl5LLLOexL4": {}}, "autoJoin": false, "backfillTicketID": "QpRWCiiPDGQhNPEw", "clientVersion": "iJCf2XJVrlzqQls1", "configurationName": "ozhLVA3kE8jKvgat", "customURLGRPC": "OEBM70TdlNBJYOmp", "deployment": "u1VCarzBsV6xnZ5J", "dsSource": "rzzjrcaug6CWVG8S", "fallbackClaimKeys": ["WP3glU6muswVJnNn", "N7kAa7j0riFc5HTH", "QIoVsGo7dwV9DBqF"], "inactiveTimeout": 74, "inviteTimeout": 6, "joinability": "HQkETJyTlUrwDTno", "matchPool": "ujQD4IEiH9Z5qXn3", "maxPlayers": 0, "minPlayers": 5, "preferredClaimKeys": ["oRtlqOECohViHA5C", "zgFSy8X1A3PrIfap", "q5AAeMe4L3mDWORB"], "requestedRegions": ["VXTIIJM9XsYIIZxi", "XNMR9BgaWcFX3SUB", "hyoTsMWPAxUMkawa"], "serverName": "GpAyrIwMif3BOdko", "storage": {"leader": {"cVTd4BxqGWV6mTJ0": {}, "sQs6XNbjvqhnUVLW": {}, "u8olKdxL6ozRmDD0": {}}}, "teams": [{"parties": [{"partyID": "jJvlfV5OemPYdYT7", "userIDs": ["DROCjtuzFMbAG9YI", "89hmguB8FOTjMLo4", "b9rIzqYkEpstyVTB"]}, {"partyID": "crM8rG0rH0zcswwV", "userIDs": ["eMK6MbGIVIu8vvwL", "c7KY3uVoJXTIMtpg", "kieDyF97lGdMiHKx"]}, {"partyID": "bWCYzo8yO2KTK9tm", "userIDs": ["mOnYnOpas6ghP1y4", "Zi7s7QBlk44Z44B1", "GZgKg4uKxaCgcGLu"]}], "teamID": "C3brWdTYCfHkIySo", "userIDs": ["k5DiXZtLW87rGysr", "yod3dNQrmsApRA6H", "X3RwrKt2ecozL0TO"]}, {"parties": [{"partyID": "g54vCE48L5oLF6M4", "userIDs": ["lNa4JUMSHNgqRqCV", "7usamANkZlOX9Sfo", "95HgXqKhTPkwfLM9"]}, {"partyID": "uSybRzWek2gZvRrv", "userIDs": ["r0n9d9lvccKMLhrT", "rcBE2ItBS3KtKZWe", "8aoFzAyBME74HUti"]}, {"partyID": "pUWYhWV1qx8CzPML", "userIDs": ["52faXUr9Sk4lq2fa", "BcAXXKlhvyH8paOJ", "txqMPpcVfRwNj547"]}], "teamID": "fH0XrKEDpEY8Vnoc", "userIDs": ["GAjci0V3tBf2jnHG", "KXphn50c9tNLDljh", "Z2jxLRX3z46OCaGB"]}, {"parties": [{"partyID": "eMfPlNos4yBRjrER", "userIDs": ["HEonAZR8GmEu0q1p", "6QCyY6vSkVFWdsbY", "uVEGVxYheR3j5mNZ"]}, {"partyID": "6vwv7K8Asvt1j1Rx", "userIDs": ["59hesNWy2NvZ85DD", "KDAF8KDsBZOuYQJ0", "3BAHZ7c53q7akMpc"]}, {"partyID": "mnnx6RVBrop9v7aZ", "userIDs": ["K3h65hbN15zfQSfQ", "rtfF3TQN0OcNDLr3", "6vzohZyjMQAg5mPY"]}], "teamID": "hrLTyU8OhgfY9JQY", "userIDs": ["GF4bYXEcENx9xZlA", "chob44lONDDwMvgI", "0HlyPR7wZNiVsF6x"]}], "textChat": false, "ticketIDs": ["mXEQdbzIVy8alncV", "7vWgSHdfo07UctPE", "rqxyMyOK06MqQBEr"], "tieTeamsSessionLifetime": true, "type": "eoc8fgvZDDhoO05o"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateGameSession' test.out

#- 49 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"KqymxLD1Lcvw6T6m": {}, "ZEiwxxElpMYSWIeV": {}, "zm7z9noowmlTIKVo": {}}' \
    > test.out 2>&1
eval_tap $? 49 'PublicQueryGameSessionsByAttributes' test.out

#- 50 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wi0RY2VN4ZONJREd"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicSessionJoinCode' test.out

#- 51 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'UQ3z9F1BxNNgnke4' \
    > test.out 2>&1
eval_tap $? 51 'GetGameSessionByPodName' test.out

#- 52 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'akncw7wu9TmXfJWB' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSession' test.out

#- 53 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Prx9Ns8eLzYEvwSW' \
    --body '{"attributes": {"TaLQjctvrK2jhsYp": {}, "KPlXn77AtYoFzLAA": {}, "TPY8P8P3cfoivvQx": {}}, "backfillTicketID": "evecWw7Rry0KK5rg", "clientVersion": "AGO0dW8rX2MVUGKS", "deployment": "Z4GcLkt4pK32sJxl", "fallbackClaimKeys": ["ZcCTpTdRtCHvuk6B", "6XTmSLyn50sigBVZ", "xiKdV57GvRyd9UuL"], "inactiveTimeout": 17, "inviteTimeout": 59, "joinability": "Le8HSCslsDd4M1F5", "matchPool": "qRIblS7Nz81GRazP", "maxPlayers": 55, "minPlayers": 40, "preferredClaimKeys": ["ANjfBoldFOyqA2cl", "J5gEOaCgM6Yn6Rug", "bNEIpGBFUjOn5mM7"], "requestedRegions": ["k8nbLzvtCIW5ynMK", "quUicAeIVXtoWAXh", "MlW4tLqX7OICf5oD"], "teams": [{"parties": [{"partyID": "1e6oI9FmYel0kOw7", "userIDs": ["2o8Zkgk0jS6rDWUw", "fhKvrf2AaH4yCWrH", "SppnIZkNnTn3rzH5"]}, {"partyID": "NvAtcvNedgS1fUfK", "userIDs": ["mihDbmu8ePWlQMVD", "XEHeiGTnwyEw6hIW", "DZrpP7rz3ISW510k"]}, {"partyID": "Hr4isTKWjmv67nuH", "userIDs": ["CXWfwnwGioVwVzmm", "BVVFfpqx1AeLtzcP", "J3jtDYBo4FUTH7CG"]}], "teamID": "fKSyxgRR1DiCqSMz", "userIDs": ["pqIFGLkDs7ACC1Rg", "BfoNrHlFi2qJLgmB", "LE35YhyiDV90SeI5"]}, {"parties": [{"partyID": "yppBHoytVznCgNyx", "userIDs": ["9fbT63ShEh8PbGik", "Ljgjcj34uulU6FYB", "ZsWFbr3RSP0W9nBh"]}, {"partyID": "vhf8Q0DtJMcYQdN6", "userIDs": ["6bswAgt65X4N1LQZ", "mB61JMdtwCVUrYQu", "e84dwmbwFEnAZaWs"]}, {"partyID": "QJtRYoagRJK5PX9U", "userIDs": ["cOvhPyE11TRT2SKs", "eoe8VLie0LBa36KN", "zjf005CXNGehQ2aT"]}], "teamID": "jTDfKFDXC7eGL5Yh", "userIDs": ["JDWh9YWqc0qgV6d9", "yOfIMLds2DbPcaoM", "dtRLTmSvTkQQgB7e"]}, {"parties": [{"partyID": "xYvmHMxr5hPCJJzt", "userIDs": ["JBg0tTJg46IewOXE", "2AkCh3QIZsUf8lGF", "XcmwTERHclOdxIwq"]}, {"partyID": "ejxe18rNdb8Otq6j", "userIDs": ["1mqUav7k05HAQltn", "SojV4jT65yclX2Ft", "Az0vJjFIYWOaNdsi"]}, {"partyID": "mmkW2miH3xRHAKy4", "userIDs": ["QxZkaXZ7vmiEd0JP", "xVyQpshaDwNqTbbF", "MXAMfVXe0GZeMgsR"]}], "teamID": "smH1EQrYmkPKTPOl", "userIDs": ["hTtSiZNCxuogFteT", "HJe4BhSSQkQD6WmO", "t6D7ufFVTOhvQpfb"]}], "ticketIDs": ["Bke8aEdd36xj6wyS", "oltDxsbzxrlaKEfk", "oYjY2o6ouRW9UtNq"], "tieTeamsSessionLifetime": true, "type": "LuZS6hsQryiEtOAb", "version": 31}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateGameSession' test.out

#- 54 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Zpr4U4fwQIiLXgmR' \
    > test.out 2>&1
eval_tap $? 54 'DeleteGameSession' test.out

#- 55 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'asvjO4lj8m3XEwP2' \
    --body '{"attributes": {"b4gd3xOeii8Jnmss": {}, "ep2xD2NY0kABeGs9": {}, "yxahld1pO0Gyf5PO": {}}, "backfillTicketID": "3COyMvczgEpzZ3Fb", "clientVersion": "txfhcRC7IVYa6iZ5", "deployment": "uFRYNn3SHiWxF0Yb", "fallbackClaimKeys": ["uU5ar5qTLWUCy0Af", "gc050XIZRW491e94", "mQjVOOBnIWhunElq"], "inactiveTimeout": 96, "inviteTimeout": 29, "joinability": "N8WXBPp17PAewqSm", "matchPool": "5x3B4t7WQnp8jXZe", "maxPlayers": 7, "minPlayers": 24, "preferredClaimKeys": ["gt5cyNe27HLtwtVO", "axgP6Jbct8puMybY", "GxD9IPmmsLmu3kaP"], "requestedRegions": ["j0O4zd8Tb7cUNGPT", "BxiFFCrn7djjs69F", "TFVGUVhvKhJCmeis"], "teams": [{"parties": [{"partyID": "ql14mUHVbMPimNhc", "userIDs": ["ZsU3VAdMDcb4qlki", "FAamqvZI2KwjqPBi", "WXade41s3rH34mB2"]}, {"partyID": "yPlRpWjmHZAAvKTH", "userIDs": ["8MuqIg0CzkguwuJC", "W7EEFB67AODbi9Bz", "upBsFpYc77GtRUcC"]}, {"partyID": "FeY5g4XgBsbfzqxB", "userIDs": ["PNe8ae1Il4aAtEbu", "4IjGdqthRxTjQ7gk", "ZEY8rG0q0Q2Qd2Jz"]}], "teamID": "RbkF2I03dIjvBbA6", "userIDs": ["bfbYaJCJjfk2TUvn", "95FhO7VW3mbDVMDu", "87t0ldWf7iSGIiKF"]}, {"parties": [{"partyID": "tWtn4Yr2svKM6pqL", "userIDs": ["GZ0TBujELAUK6mQ5", "iZgbwwm5iGzXtckn", "rgidKupvXO6aj4hC"]}, {"partyID": "mTC34jxW4pIDwdqX", "userIDs": ["pmRmut9H9XyWI8bp", "8fQxRuX91uYmtrHJ", "bEGTUj7YjERL1rEQ"]}, {"partyID": "G02zccA8wvLsWUNd", "userIDs": ["6lPKvqDejvqklTSv", "DwuOrP9lzpiX0VuF", "pZum7izxe7NPzjOa"]}], "teamID": "8E7wY76PxLv9HBEU", "userIDs": ["e89AwEw1HO4FnKtx", "4XLKAmlDr19uJ3nq", "6VerzVCcI8y3Cz0Y"]}, {"parties": [{"partyID": "qCKUh5RD9vNAp4ji", "userIDs": ["nFpnQ5xF9wwbvMZy", "eDeRnVfPUa6xVVBc", "q3wZpFIYeAg79HcL"]}, {"partyID": "JXJ7mpVI6eTYAjdP", "userIDs": ["lCiQQC35cj4KyOVg", "vnWbfRJtsB7cUQZ2", "QUAxJrINPXppPNO3"]}, {"partyID": "AfmXcgwC3IN6tvKg", "userIDs": ["LB9QmJIOq9dP5szG", "71utjsQ4CrRb9gUC", "eVz7fWbZIdhevfZv"]}], "teamID": "yV7AcodcZwKjYDdm", "userIDs": ["JOlzwm9Su4FnS98Q", "qftSjq7sn8yreciP", "LfkVyyJsbGpO6Jge"]}], "ticketIDs": ["hDJxEN7JlZc8LMq1", "o2jZWu4yA3r0u4q1", "bTHXIjfJKyFlM0u1"], "tieTeamsSessionLifetime": true, "type": "hwntCVqiYOJf5KwM", "version": 69}' \
    > test.out 2>&1
eval_tap $? 55 'PatchUpdateGameSession' test.out

#- 56 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QjzvjSozv6CTRDl0' \
    --body '{"backfillTicketID": "zp9CzHFwinkBNi4g"}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateGameSessionBackfillTicketID' test.out

#- 57 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vqgl6TZ9TGVPmv34' \
    > test.out 2>&1
eval_tap $? 57 'GameSessionGenerateCode' test.out

#- 58 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'h6T7EsufmfxKYB4L' \
    > test.out 2>&1
eval_tap $? 58 'PublicRevokeGameSessionCode' test.out

#- 59 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'M6H6QXmpZ9X3fUSR' \
    --body '{"metadata": {"1l9xLPBsmAUrD9L1": "IiD6MlcEPhMDFzjH", "Z3sIhzOx2CXKlvIo": "mU3pIxM9n8D2eLMe", "3lt9qfx2UDcgVE7L": "9FK6e0MrPc4vtxk9"}, "platformID": "hVKlG56HlzGr7Xjd", "userID": "yRJunZPkp6ccIBnW"}' \
    > test.out 2>&1
eval_tap $? 59 'PublicGameSessionInvite' test.out

#- 60 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yPw8mj7gyQ7XdIsz' \
    > test.out 2>&1
eval_tap $? 60 'JoinGameSession' test.out

#- 61 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GRj46COPipH1MWVT' \
    --body '{"leaderID": "HG0qHJCWEfOJpZm9"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPromoteGameSessionLeader' test.out

#- 62 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yEYWNGMy2pgSGSUO' \
    > test.out 2>&1
eval_tap $? 62 'LeaveGameSession' test.out

#- 63 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'K68eqGJtWf1Ybgg8' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rdwY9bmrvHmO07KN' \
    > test.out 2>&1
eval_tap $? 63 'PublicKickGameSessionMember' test.out

#- 64 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qX9LM2IwEsdOGBXB' \
    > test.out 2>&1
eval_tap $? 64 'PublicGameSessionReject' test.out

#- 65 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wnzDX8v3xgC1Ge9P' \
    > test.out 2>&1
eval_tap $? 65 'GetSessionServerSecret' test.out

#- 66 AppendTeamGameSession
eval_tap 0 66 'AppendTeamGameSession # SKIP deprecated' test.out

#- 67 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dbTTAJ2Gp1r0sVZ6' \
    --userId 'LJAOddIL2l3hPjND' \
    > test.out 2>&1
eval_tap $? 67 'PublicGameSessionCancel' test.out

#- 68 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Kv2LWfXqjr8fS79E"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyJoinCode' test.out

#- 69 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'n3wYowBdkaZ3y6i3' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetParty' test.out

#- 70 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '8XQjLDRqkpiFK5Bt' \
    --body '{"attributes": {"iQ272Uo9UBJWodpd": {}, "wsX1jorcyR0x3YiH": {}, "F8ITGPRQBCgIs1Q2": {}}, "inactiveTimeout": 23, "inviteTimeout": 23, "joinability": "zxl0yF5m77TTh4gU", "maxPlayers": 29, "minPlayers": 58, "type": "j8u2WRcLiEtzVlnk", "version": 11}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateParty' test.out

#- 71 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XnGanMazb8jvRWen' \
    --body '{"attributes": {"URH48aJuALEcSqcE": {}, "15u6D31DjOsrs3CU": {}, "YATdqnQGbqiqOkNe": {}}, "inactiveTimeout": 54, "inviteTimeout": 55, "joinability": "Tj7eGjodd7CcJUrI", "maxPlayers": 1, "minPlayers": 78, "type": "oV0VOem2yqPsMFxK", "version": 51}' \
    > test.out 2>&1
eval_tap $? 71 'PublicPatchUpdateParty' test.out

#- 72 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FmN86sK5LOq4ft5j' \
    > test.out 2>&1
eval_tap $? 72 'PublicGeneratePartyCode' test.out

#- 73 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GcMICPUYnfG6jl9U' \
    > test.out 2>&1
eval_tap $? 73 'PublicRevokePartyCode' test.out

#- 74 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '4jReteIMgzISomCs' \
    --body '{"metadata": {"odJrhQW41q2OspCZ": "bt3Uta5I0uGcL1ko", "yHjCH5olYLETRpAB": "AmO2EGvJ4UMS93yO", "xNInDByhnoluO6ti": "0QP2ssiJ66OzOj84"}, "platformID": "O6tgohjtC7bzjPpu", "userID": "cddXJ5zifF8y959a"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicPartyInvite' test.out

#- 75 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nrNSleywHbHig6IK' \
    --body '{"leaderID": "WVZ77KeRWdECaFGz"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPromotePartyLeader' test.out

#- 76 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fZ2hxcJ2Fnemn7M2' \
    > test.out 2>&1
eval_tap $? 76 'PublicReadPartySessionStorage' test.out

#- 77 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId '3SzUo4hNBDh9ZFP1' \
    --userId 'OW0nXOErQPS4VsRo' \
    --body '{"YIK69yg9ADCGiXaL": {}, "s2xjHkinOD975nAR": {}, "HCmhNHSXuqIHsxva": {}}' \
    > test.out 2>&1
eval_tap $? 77 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 78 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UoXDmwWsukxncuD3' \
    > test.out 2>&1
eval_tap $? 78 'PublicPartyJoin' test.out

#- 79 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QxCXMd00YBWCaVVm' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyLeave' test.out

#- 80 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'M45mfIZsWhkS476d' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyReject' test.out

#- 81 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GGJwJ00UH197MJ6z' \
    --userId 'U7JLMQyMWzYQCAaP' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyCancel' test.out

#- 82 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JgoxGJoJaSzUtY4Z' \
    --userId 'D0Xtb0U4pH16NUsV' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyKick' test.out

#- 83 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Y21NVIs7NRen2Y3N": {}, "s0QJQeaWytPfds1B": {}, "Yx0EaURydf8ZyyZe": {}}, "configurationName": "HAWGgJUbUJRMbkcT", "inactiveTimeout": 13, "inviteTimeout": 87, "joinability": "lbU86FyOjApNHBVf", "maxPlayers": 80, "members": [{"ID": "qJGIKzLyH1y72L13", "PlatformID": "Ornyx34luLdvtsTK", "PlatformUserID": "XMjiw6gYPvfn2Qt9"}, {"ID": "iyq3Nyk8ncu2Z3eD", "PlatformID": "HH9WaVO4iKhDcJ7T", "PlatformUserID": "CcNIsQ3PuppUxDSK"}, {"ID": "8aOTGMudcxlCV4cN", "PlatformID": "bJGQ57lPdinpjS2D", "PlatformUserID": "RfGt9GlyZVQ4X67t"}], "minPlayers": 85, "textChat": true, "type": "ZSTpPq3xjrElvvDg"}' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateParty' test.out

#- 84 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    > test.out 2>&1
eval_tap $? 84 'PublicGetRecentPlayer' test.out

#- 85 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentTeamPlayer' test.out

#- 86 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0ag7kSWE0Hiqm5Iu' \
    --body '{"LryiEXqvUWDjU1G0": {}, "EVjVZw1ToLuPakQN": {}, "1MpOs1RVFrcg2CXx": {}}' \
    > test.out 2>&1
eval_tap $? 86 'PublicUpdateInsertSessionStorageLeader' test.out

#- 87 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'epx78fvsyhE2BKty' \
    --userId 'TDSIM7mkmvZ7Cmsh' \
    --body '{"4US8o4jfMANPpmZD": {}, "dMiCxmuCCVuFjS1G": {}, "C1d2b92B4vEgj3HO": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorage' test.out

#- 88 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["mhcWm428XejRF94N", "IY9nMrBZo0lNUBDS", "hHD32vvL28FPwTiX"]}' \
    > test.out 2>&1
eval_tap $? 88 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 89 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'PublicGetPlayerAttributes' test.out

#- 90 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "biWsAQHbMrKYi0Zx", "data": {"s5SWCqZXHLLa31oQ": {}, "f7BULnZDhutDM6Bq": {}, "guqD5xxGxBWtnTKU": {}}, "platforms": [{"name": "e2znsqPzPkwCBo2S", "userID": "wCUsTag4MLAo3m61"}, {"name": "P2xaNfmn8Onb1a9g", "userID": "Mz0F2UBRmMhAbUWm"}, {"name": "FhdYLWzMuv3zkUY0", "userID": "n0BAZkwbYkBLyO6A"}], "roles": ["0FqfhnaB3YxKNdOT", "acCcJfIfXshuLUk5", "WdpxjZx5noXPhPUT"], "simultaneousPlatform": "KbonoucNmzwOZOK5"}' \
    > test.out 2>&1
eval_tap $? 90 'PublicStorePlayerAttributes' test.out

#- 91 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'PublicDeletePlayerAttributes' test.out

#- 92 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '6sDkci5rZ8iMlOuk' \
    --orderBy 'sQJCiRFiZWwJ7NrT' \
    --status 'b1XTB9YQzUJ9XlYJ' \
    > test.out 2>&1
eval_tap $? 92 'PublicQueryMyGameSessions' test.out

#- 93 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '8BzP6EUmUXGM5anI' \
    --orderBy 'loyj9lhbvuQdW2jw' \
    --status 'KUckc794ryY91lX8' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE