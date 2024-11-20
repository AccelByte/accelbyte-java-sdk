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
echo "1..90"

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

#- 34 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminGetPlatformCredentials' test.out

#- 35 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "LCpobBEG8X645xpd", "clientSecret": "Xpai0rYaT5hOPjaf", "scope": "3H0tYighU0VUfcYH"}}' \
    > test.out 2>&1
eval_tap $? 35 'AdminUpdatePlatformCredentials' test.out

#- 36 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'AdminDeletePlatformCredentials' test.out

#- 37 AdminDeletePlatformCredentialsByPlatformId
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentialsByPlatformId \
    --namespace "$AB_NAMESPACE" \
    --platformId 'PSN' \
    > test.out 2>&1
eval_tap $? 37 'AdminDeletePlatformCredentialsByPlatformId' test.out

#- 38 AdminSyncPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminSyncPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    > test.out 2>&1
eval_tap $? 38 'AdminSyncPlatformCredentials' test.out

#- 39 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --userId 'P8cM4NTwr0KHaAsm' \
    > test.out 2>&1
eval_tap $? 39 'AdminGetRecentPlayer' test.out

#- 40 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --userId 'DJ7HVWqMkNSawQUW' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetRecentTeamPlayer' test.out

#- 41 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DFJvJBWic7UkBeIX' \
    > test.out 2>&1
eval_tap $? 41 'AdminReadSessionStorage' test.out

#- 42 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uqDuAXI66bQ71w0d' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteUserSessionStorage' test.out

#- 43 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eoV9Lx5RDA1l2Xcr' \
    --userId 'ciYNEzvSZIPkhSgO' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadUserSessionStorage' test.out

#- 44 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'Rcz5S5BvmgBLxh4i' \
    > test.out 2>&1
eval_tap $? 44 'AdminQueryPlayerAttributes' test.out

#- 45 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'jFnE3Tam69qSZ7PC' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetPlayerAttributes' test.out

#- 46 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId '6f6QkmZXElW9YfRS' \
    > test.out 2>&1
eval_tap $? 46 'AdminSyncNativeSession' test.out

#- 47 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "se6AAz3S4czz0QKF", "attributes": {"lAVmVLu4AOec0z8e": {}, "Beeoip68J1nsv4W2": {}, "OJhtafxMSJlHeb34": {}}, "autoJoin": true, "backfillTicketID": "WUtDQs61OQAoxyyQ", "clientVersion": "pRWCiiPDGQhNPEwi", "configurationName": "JCf2XJVrlzqQls1o", "customURLGRPC": "zhLVA3kE8jKvgatO", "deployment": "EBM70TdlNBJYOmpu", "dsSource": "1VCarzBsV6xnZ5Jr", "fallbackClaimKeys": ["zzjrcaug6CWVG8SW", "P3glU6muswVJnNnN", "7kAa7j0riFc5HTHQ"], "inactiveTimeout": 71, "inviteTimeout": 67, "joinability": "oVsGo7dwV9DBqFKH", "matchPool": "QkETJyTlUrwDTnou", "maxPlayers": 19, "minPlayers": 0, "preferredClaimKeys": ["QD4IEiH9Z5qXn3ao", "RtlqOECohViHA5Cz", "gFSy8X1A3PrIfapq"], "requestedRegions": ["5AAeMe4L3mDWORBV", "XTIIJM9XsYIIZxiX", "NMR9BgaWcFX3SUBh"], "serverName": "yoTsMWPAxUMkawaG", "storage": {"leader": {"pAyrIwMif3BOdkoc": {}, "VTd4BxqGWV6mTJ0s": {}, "Qs6XNbjvqhnUVLWu": {}}}, "teams": [{"parties": [{"partyID": "8olKdxL6ozRmDD0j", "userIDs": ["JvlfV5OemPYdYT7D", "ROCjtuzFMbAG9YI8", "9hmguB8FOTjMLo4b"]}, {"partyID": "9rIzqYkEpstyVTBc", "userIDs": ["rM8rG0rH0zcswwVe", "MK6MbGIVIu8vvwLc", "7KY3uVoJXTIMtpgk"]}, {"partyID": "ieDyF97lGdMiHKxb", "userIDs": ["WCYzo8yO2KTK9tmm", "OnYnOpas6ghP1y4Z", "i7s7QBlk44Z44B1G"]}], "userIDs": ["ZgKg4uKxaCgcGLuC", "3brWdTYCfHkIySok", "5DiXZtLW87rGysry"]}, {"parties": [{"partyID": "od3dNQrmsApRA6HX", "userIDs": ["3RwrKt2ecozL0TOg", "54vCE48L5oLF6M4l", "Na4JUMSHNgqRqCV7"]}, {"partyID": "usamANkZlOX9Sfo9", "userIDs": ["5HgXqKhTPkwfLM9u", "SybRzWek2gZvRrvr", "0n9d9lvccKMLhrTr"]}, {"partyID": "cBE2ItBS3KtKZWe8", "userIDs": ["aoFzAyBME74HUtip", "UWYhWV1qx8CzPML5", "2faXUr9Sk4lq2faB"]}], "userIDs": ["cAXXKlhvyH8paOJt", "xqMPpcVfRwNj547f", "H0XrKEDpEY8VnocG"]}, {"parties": [{"partyID": "Ajci0V3tBf2jnHGK", "userIDs": ["Xphn50c9tNLDljhZ", "2jxLRX3z46OCaGBe", "MfPlNos4yBRjrERH"]}, {"partyID": "EonAZR8GmEu0q1p6", "userIDs": ["QCyY6vSkVFWdsbYu", "VEGVxYheR3j5mNZ6", "vwv7K8Asvt1j1Rx5"]}, {"partyID": "9hesNWy2NvZ85DDK", "userIDs": ["DAF8KDsBZOuYQJ03", "BAHZ7c53q7akMpcm", "nnx6RVBrop9v7aZK"]}], "userIDs": ["3h65hbN15zfQSfQr", "tfF3TQN0OcNDLr36", "vzohZyjMQAg5mPYh"]}], "textChat": true, "ticketIDs": ["pysFO3Zvc1BZG99L", "yvfvHEsJKQQewVLM", "UoAnaRcYp7FUjfIG"], "tieTeamsSessionLifetime": false, "type": "lyPR7wZNiVsF6xG2"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateGameSession' test.out

#- 48 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"mXEQdbzIVy8alncV": {}, "7vWgSHdfo07UctPE": {}, "rqxyMyOK06MqQBEr": {}}' \
    > test.out 2>&1
eval_tap $? 48 'PublicQueryGameSessionsByAttributes' test.out

#- 49 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xgjVBycvU4PbmRDc"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicSessionJoinCode' test.out

#- 50 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'rg0DjQjBECXvea7H' \
    > test.out 2>&1
eval_tap $? 50 'GetGameSessionByPodName' test.out

#- 51 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1m2lJFRZ3ZprZ60z' \
    > test.out 2>&1
eval_tap $? 51 'GetGameSession' test.out

#- 52 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MjhTHeh94TSenE5h' \
    --body '{"attributes": {"CFkIf5weqZ18MH57": {}, "l2Zsrh90ETtYmGuk": {}, "z3MnlrjcHp6B8Vj7": {}}, "backfillTicketID": "rXFgDnDkdZ9bpjb1", "clientVersion": "tdA3QhjCMW64f4Xh", "deployment": "IjSoTB2NMKtezapP", "fallbackClaimKeys": ["r2QEPx3zTxBGtEJI", "YppuUSsKoHw2hyd1", "2uSE7BEv3aevq6io"], "inactiveTimeout": 16, "inviteTimeout": 96, "joinability": "4GcLkt4pK32sJxlZ", "matchPool": "cCTpTdRtCHvuk6B6", "maxPlayers": 28, "minPlayers": 93, "preferredClaimKeys": ["aO2m9vqjhbeK2qN8", "g6x2PyYDo5R3hLiD", "5sf5y1JsxJNGmyt0"], "requestedRegions": ["SQDUDoWBZVGLlkUe", "tzCAWc9x1aMjgGim", "51T107XIZRZ7tZdI"], "teams": [{"parties": [{"partyID": "s0xf4czdt7zqmSKx", "userIDs": ["OEQlVcx6GqsBq8vd", "hWVnuYLgpZehK0G2", "nmyuViB9kRTcSQdT"]}, {"partyID": "nNYGeAfYFG3wSkHK", "userIDs": ["ufBdS3ZOokZB4cXn", "AXyuGz6LlxHv8Swy", "agYvDJ3w3UNgIGj2"]}, {"partyID": "jZtEYT8sIPSE1XXP", "userIDs": ["zySa0sZoFS6xCOWM", "pyh9pMsQgb64ELbz", "DMwyo4nIRysQdbuf"]}], "userIDs": ["XjYnSoIFeouC2m38", "kXrDZWlGVE9sJ4Np", "UtKp6M9I6nEwnZhs"]}, {"parties": [{"partyID": "jwJeGwaPSDMZz95O", "userIDs": ["YKiqaZD63xe5rruJ", "VfLGea0ZtlzUcuHA", "Xz0UV31MfuGaXsAu"]}, {"partyID": "GsZaSHevO0TQNEI3", "userIDs": ["kfabxJWWSI1ECUo1", "NPpeFhUztXDgB7n4", "C97uAPP8PATLpUpx"]}, {"partyID": "eJlsBJT6Hh3OMjAj", "userIDs": ["q2mK8lbSEEelxnb5", "QxWG2HFnZlA6HKWW", "4fI1IQcoBQELcNlZ"]}], "userIDs": ["kqTZrKgXNwvm4e5G", "X6H742OixhtAoKiV", "m6URT95XhnUcvWB2"]}, {"parties": [{"partyID": "8MpusuhhDJ5slzgi", "userIDs": ["WZEtyd56LfxnbY97", "jjYgXchCbkXX26uE", "dCfQaMAQuTKfC0I2"]}, {"partyID": "kNjCMDtDMrentgn3", "userIDs": ["DhqciwIeShF9RKb9", "vvxuJlhXbWhbwPwT", "oC6knjVwVnzaqSfJ"]}, {"partyID": "iQFC2gXoda0kg16y", "userIDs": ["USpSOAjHJWwfCjYw", "WkLob9gKLqs2nEZh", "pByfHZinxNfgPAwk"]}], "userIDs": ["MBsznlBUqnLT4AbG", "ptKaWNvPbpg7yrRv", "XfZ6rvgvEY3Hht1S"]}], "ticketIDs": ["wqTsKKKo37NHDOQe", "91Ps3ztUIV0dS6hI", "H9c4VfkyrwpuXxba"], "tieTeamsSessionLifetime": true, "type": "smH1EQrYmkPKTPOl", "version": 14}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGameSession' test.out

#- 53 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EOIFg0dnWIYN2NVL' \
    > test.out 2>&1
eval_tap $? 53 'DeleteGameSession' test.out

#- 54 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '70Iw157g00jr9b8M' \
    --body '{"attributes": {"uYmmeKTmBNvGYxEQ": {}, "df3ewoGGoY7xmFNA": {}, "mjDDCvs78mcMdiS7": {}}, "backfillTicketID": "6YApGJ9ufwLYkqIg", "clientVersion": "LuZS6hsQryiEtOAb", "deployment": "peUNf26UqkCfgCUY", "fallbackClaimKeys": ["Bn2xaOBdPF0JmX8q", "wU1cTuHHPB5S3DvP", "RCzBrVUxmDOj3cvR"], "inactiveTimeout": 64, "inviteTimeout": 51, "joinability": "aTC11W0TGTCm4fZW", "matchPool": "uk6pQxDQpKqxLGeM", "maxPlayers": 43, "minPlayers": 48, "preferredClaimKeys": ["r9TsvcMQ7dBsaIec", "RxIsZvD6rmzVr5XT", "1Nxw0v1dMQ9Rrbk6"], "requestedRegions": ["C2cVWf6ttvbU1PO6", "ApCD2VXidT7w0Oc1", "5N8WXBPp17PAewqS"], "teams": [{"parties": [{"partyID": "m5x3B4t7WQnp8jXZ", "userIDs": ["edgt5cyNe27HLtwt", "VOaxgP6Jbct8puMy", "bYGxD9IPmmsLmu3k"]}, {"partyID": "aPj0O4zd8Tb7cUNG", "userIDs": ["PTBxiFFCrn7djjs6", "9FTFVGUVhvKhJCme", "isql14mUHVbMPimN"]}, {"partyID": "hcZsU3VAdMDcb4ql", "userIDs": ["kiFAamqvZI2KwjqP", "BiWXade41s3rH34m", "B2yPlRpWjmHZAAvK"]}], "userIDs": ["TH8MuqIg0Czkguwu", "JCW7EEFB67AODbi9", "BzupBsFpYc77GtRU"]}, {"parties": [{"partyID": "cCFeY5g4XgBsbfzq", "userIDs": ["xBPNe8ae1Il4aAtE", "bu4IjGdqthRxTjQ7", "gkZEY8rG0q0Q2Qd2"]}, {"partyID": "JzRbkF2I03dIjvBb", "userIDs": ["A6bfbYaJCJjfk2TU", "vn95FhO7VW3mbDVM", "Du87t0ldWf7iSGIi"]}, {"partyID": "KFtWtn4Yr2svKM6p", "userIDs": ["qLGZ0TBujELAUK6m", "Q5iZgbwwm5iGzXtc", "knrgidKupvXO6aj4"]}], "userIDs": ["hCmTC34jxW4pIDwd", "qXpmRmut9H9XyWI8", "bp8fQxRuX91uYmtr"]}, {"parties": [{"partyID": "HJbEGTUj7YjERL1r", "userIDs": ["EQG02zccA8wvLsWU", "Nd6lPKvqDejvqklT", "SvDwuOrP9lzpiX0V"]}, {"partyID": "uFpZum7izxe7NPzj", "userIDs": ["Oa8E7wY76PxLv9HB", "EUe89AwEw1HO4FnK", "tx4XLKAmlDr19uJ3"]}, {"partyID": "nq6VerzVCcI8y3Cz", "userIDs": ["0YqCKUh5RD9vNAp4", "jinFpnQ5xF9wwbvM", "ZyeDeRnVfPUa6xVV"]}], "userIDs": ["Bcq3wZpFIYeAg79H", "cLJXJ7mpVI6eTYAj", "dPlCiQQC35cj4KyO"]}], "ticketIDs": ["VgvnWbfRJtsB7cUQ", "Z2QUAxJrINPXppPN", "O3AfmXcgwC3IN6tv"], "tieTeamsSessionLifetime": true, "type": "gLB9QmJIOq9dP5sz", "version": 67}' \
    > test.out 2>&1
eval_tap $? 54 'PatchUpdateGameSession' test.out

#- 55 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 't4sUmanYxM0UHZVN' \
    --body '{"backfillTicketID": "YzGMNIpWoSLkUrfu"}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSessionBackfillTicketID' test.out

#- 56 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'f4U3WeYeA9t2ENKK' \
    > test.out 2>&1
eval_tap $? 56 'GameSessionGenerateCode' test.out

#- 57 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WrFtHIi1CMgKAOG5' \
    > test.out 2>&1
eval_tap $? 57 'PublicRevokeGameSessionCode' test.out

#- 58 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iDcCR5PbCvDLil8w' \
    --body '{"metadata": {"j9cKM3Ar6MF35hCE": "R4nGmWGgTJfHlJl4", "tHGa4XfZcd9CVnGq": "MX9FieeEssWEUl07", "bhwntCVqiYOJf5Kw": "MZQjzvjSozv6CTRD"}, "platformID": "l0zp9CzHFwinkBNi", "userID": "4gvqgl6TZ9TGVPmv"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicGameSessionInvite' test.out

#- 59 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '34h6T7EsufmfxKYB' \
    > test.out 2>&1
eval_tap $? 59 'JoinGameSession' test.out

#- 60 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4LM6H6QXmpZ9X3fU' \
    --body '{"leaderID": "SR1l9xLPBsmAUrD9"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPromoteGameSessionLeader' test.out

#- 61 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'L1IiD6MlcEPhMDFz' \
    > test.out 2>&1
eval_tap $? 61 'LeaveGameSession' test.out

#- 62 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'jHZ3sIhzOx2CXKlv' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IomU3pIxM9n8D2eL' \
    > test.out 2>&1
eval_tap $? 62 'PublicKickGameSessionMember' test.out

#- 63 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Me3lt9qfx2UDcgVE' \
    > test.out 2>&1
eval_tap $? 63 'PublicGameSessionReject' test.out

#- 64 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7L9FK6e0MrPc4vtx' \
    > test.out 2>&1
eval_tap $? 64 'GetSessionServerSecret' test.out

#- 65 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'k9hVKlG56HlzGr7X' \
    --body '{"additionalMembers": [{"partyID": "jdyRJunZPkp6ccIB", "userIDs": ["nWyPw8mj7gyQ7XdI", "szGRj46COPipH1MW", "VTHG0qHJCWEfOJpZ"]}, {"partyID": "m9yEYWNGMy2pgSGS", "userIDs": ["UOK68eqGJtWf1Ybg", "g8rdwY9bmrvHmO07", "KNqX9LM2IwEsdOGB"]}, {"partyID": "XBwnzDX8v3xgC1Ge", "userIDs": ["9PdbTTAJ2Gp1r0sV", "Z6LJAOddIL2l3hPj", "NDKv2LWfXqjr8fS7"]}], "proposedTeams": [{"parties": [{"partyID": "9En3wYowBdkaZ3y6", "userIDs": ["i38XQjLDRqkpiFK5", "BtiQ272Uo9UBJWod", "pdwsX1jorcyR0x3Y"]}, {"partyID": "iHF8ITGPRQBCgIs1", "userIDs": ["Q2lzxl0yF5m77TTh", "4gUoj8u2WRcLiEtz", "Vlnkflfn7pHY48F1"]}, {"partyID": "dl1q92m3iRlfnBAk", "userIDs": ["0CwiAsR65yQ9ssuH", "dGmxncCEr0Kcgeqz", "GbruNB72HHMkjzyB"]}], "userIDs": ["B4UFKiaoV0VOem2y", "qPsMFxKybPkbuS6x", "9cLJ1APnNlsa2bRB"]}, {"parties": [{"partyID": "r27fVMWuAfDqLMR9", "userIDs": ["19IZPKOKiAVQXXOm", "qFHLbyXmgCNiXH8u", "enbC5CphgMweexsI"]}, {"partyID": "AP5vHLjBJ9iqMcBL", "userIDs": ["4BzhDUjhKPwbwcvQ", "U5kG8bXGFmPAnOkD", "iJq4xQye7HqnVK3Y"]}, {"partyID": "VeOWs9mfVQh3jLBt", "userIDs": ["n9pxpE7BYtzB0B4C", "xyQrUpIFvORxTi79", "DpSjb39ukcR6c2E2"]}], "userIDs": ["r3vk3IfAKEbqcNXS", "GCCvNowNmdpcJgF8", "8ySNq4Mj7mulP4tQ"]}, {"parties": [{"partyID": "6R1OqKVOTniBgLsN", "userIDs": ["hdgQ0JWZjNRSzOTq", "cVNX3ahvxw9gwwhT", "njN6wKZGW4y3f0R9"]}, {"partyID": "s2kndhhZhwAiLsZs", "userIDs": ["4pmLDIQch4IjDq9a", "T3qZyI0rYsWucAkX", "sVJbXi7eRZa7WwIc"]}, {"partyID": "895ImqK6tVsaUq3s", "userIDs": ["tUh5J5Z9GiBiSAyl", "X5cS0IeHpWCugmfO", "L0QQpxsuD8PGqku5"]}], "userIDs": ["9eFJrOXyDYz9vMUO", "PG0iHDT8QbF7gHPT", "PQbvLt2NRqJGIKzL"]}], "version": 51}' \
    > test.out 2>&1
eval_tap $? 65 'AppendTeamGameSession' test.out

#- 66 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YYT9oTynmfIuBWgJ' \
    --userId 'TNFfM8M0IW4oe8KD' \
    > test.out 2>&1
eval_tap $? 66 'PublicGameSessionCancel' test.out

#- 67 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gy0xZfAcNg14Ws8T"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyJoinCode' test.out

#- 68 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IP1LKiFQoLDvumfq' \
    > test.out 2>&1
eval_tap $? 68 'PublicGetParty' test.out

#- 69 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rgSfnx2h61X9dN1M' \
    --body '{"attributes": {"GRXBJ6mVV7JS9qjN": {}, "LwvI8JdiY3RRiLil": {}, "mOGF6dLLIeIVIjMc": {}}, "inactiveTimeout": 6, "inviteTimeout": 23, "joinability": "VQ4X67tPZSTpPq3x", "maxPlayers": 19, "minPlayers": 93, "type": "rElvvDgw0ag7kSWE", "version": 69}' \
    > test.out 2>&1
eval_tap $? 69 'PublicUpdateParty' test.out

#- 70 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '97XkGOdC6ItxDT8p' \
    --body '{"attributes": {"4n4XCFkD1AJLCwsz": {}, "bZxuHSgDOK8bjoF7": {}, "bL2635KbtZTGJpqg": {}}, "inactiveTimeout": 22, "inviteTimeout": 63, "joinability": "2IzNXGTuQPIDpor7", "maxPlayers": 39, "minPlayers": 59, "type": "aJLNNz6QIVC9Mfuc", "version": 25}' \
    > test.out 2>&1
eval_tap $? 70 'PublicPatchUpdateParty' test.out

#- 71 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VOsnmnlVljdWYmEL' \
    > test.out 2>&1
eval_tap $? 71 'PublicGeneratePartyCode' test.out

#- 72 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'e74p38vumnxAnYBT' \
    > test.out 2>&1
eval_tap $? 72 'PublicRevokePartyCode' test.out

#- 73 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xaTIz0jcgDI8Pkz9' \
    --body '{"metadata": {"6vd80msqIm5bufnB": "qrpLeqhwVhjnnjKM", "EmtbiWsAQHbMrKYi": "0Zxs5SWCqZXHLLa3", "1oQf7BULnZDhutDM": "6BqguqD5xxGxBWtn"}, "platformID": "TKUe2znsqPzPkwCB", "userID": "o2SwCUsTag4MLAo3"}' \
    > test.out 2>&1
eval_tap $? 73 'PublicPartyInvite' test.out

#- 74 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'm61P2xaNfmn8Onb1' \
    --body '{"leaderID": "a9gMz0F2UBRmMhAb"}' \
    > test.out 2>&1
eval_tap $? 74 'PublicPromotePartyLeader' test.out

#- 75 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UWmFhdYLWzMuv3zk' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyJoin' test.out

#- 76 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'UY0n0BAZkwbYkBLy' \
    > test.out 2>&1
eval_tap $? 76 'PublicPartyLeave' test.out

#- 77 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'O6A0FqfhnaB3YxKN' \
    > test.out 2>&1
eval_tap $? 77 'PublicPartyReject' test.out

#- 78 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dOTacCcJfIfXshuL' \
    --userId 'Uk5WdpxjZx5noXPh' \
    > test.out 2>&1
eval_tap $? 78 'PublicPartyCancel' test.out

#- 79 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PUTKbonoucNmzwOZ' \
    --userId 'OK56sDkci5rZ8iMl' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyKick' test.out

#- 80 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"OuksQJCiRFiZWwJ7": {}, "NrTb1XTB9YQzUJ9X": {}, "lYJ8BzP6EUmUXGM5": {}}, "configurationName": "anIloyj9lhbvuQdW", "inactiveTimeout": 17, "inviteTimeout": 19, "joinability": "JOF7JKZFNk2NKy59", "maxPlayers": 60, "members": [{"ID": "iOg2sVBiCoeC5weX", "PlatformID": "Jl7PeiMH8z8dVej8", "PlatformUserID": "N2yv6VTnOK7xAvM7"}, {"ID": "tuL81lsR7xxSVp3G", "PlatformID": "d2TK0HzYviTgYmx8", "PlatformUserID": "2JVBRLPZ6Iz8tne5"}, {"ID": "dbguBF6Gsvvdl8jH", "PlatformID": "z9x7XZIjU4IK9lOL", "PlatformUserID": "aZaMphKCqTq3EVhe"}], "minPlayers": 72, "textChat": false, "type": "joEEXBLIxGnNuhoJ"}' \
    > test.out 2>&1
eval_tap $? 80 'PublicCreateParty' test.out

#- 81 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    > test.out 2>&1
eval_tap $? 81 'PublicGetRecentPlayer' test.out

#- 82 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 82 'PublicGetRecentTeamPlayer' test.out

#- 83 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3WWPvvCiCf33ViEd' \
    --body '{"qQpoGkUWNizk5UcP": {}, "AGv6c1ESC6hZYTYZ": {}, "bzf5aANNNs5kgSZZ": {}}' \
    > test.out 2>&1
eval_tap $? 83 'PublicUpdateInsertSessionStorageLeader' test.out

#- 84 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NUHbIT9szApmWJO5' \
    --userId 'vzzXZj08a6K1XRVf' \
    --body '{"riSpPFnZBJZkDnEi": {}, "yfa2LrnpZxNnLRH3": {}, "6bqS2oFY76PU1Azi": {}}' \
    > test.out 2>&1
eval_tap $? 84 'PublicUpdateInsertSessionStorage' test.out

#- 85 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["BOHEAj1cT3u6Zc2F", "brTFznTgDIwZIRWf", "6T3by2kYSCdnFKLc"]}' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 86 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'PublicGetPlayerAttributes' test.out

#- 87 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "a6blj9Rdd85bdYUu", "data": {"mPKVSZCg3XTc9vQe": {}, "0dHJfF6KIuvnRCa9": {}, "JktyBdxkZKrEWFw9": {}}, "platforms": [{"name": "GYxjiiOQAD77ci0v", "userID": "fWVZoRRMPi57HyKK"}, {"name": "z5nyI6ulKNKoXa0d", "userID": "gx1JgjC56pda3Yht"}, {"name": "QxpCYME6x21pdX2Q", "userID": "SPAd9sxoLnWGP1Pa"}], "roles": ["fIjLX8ce0KbNN7Yc", "l2JfmQplvGjVQ4ae", "bjfgGu472oWJlfgl"], "simultaneousPlatform": "LM4xjfkNL4lU6jaG"}' \
    > test.out 2>&1
eval_tap $? 87 'PublicStorePlayerAttributes' test.out

#- 88 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'PublicDeletePlayerAttributes' test.out

#- 89 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'fsD1cfswmeFpvtDt' \
    --orderBy 'etoQVFL8LNW11vtp' \
    --status 'aTxi7k489jRCn48b' \
    > test.out 2>&1
eval_tap $? 89 'PublicQueryMyGameSessions' test.out

#- 90 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'vkCPfKofwXOIZZQA' \
    --orderBy 'Jza84lKKmVOaTS6x' \
    --status 'BbNrSUAW2ak7ISDr' \
    > test.out 2>&1
eval_tap $? 90 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE