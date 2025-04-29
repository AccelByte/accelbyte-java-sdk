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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 96, "PSNSupportedPlatforms": ["fvnnSuB0y5WUlrMd", "I4sNveabntBSxTeI", "v53HGCiljvjKoyD6"], "SessionTitle": "SCwGrncqmLtjQHAf", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "67FXGk2s9Q0mPVo3", "XboxServiceConfigID": "twu0MesTCf9x4rt6", "XboxSessionTemplateName": "9lna7qxNeIxPz6Mb", "XboxTitleID": "wL6IY69z1UaLqYSY", "localizedSessionName": {"WytLPziZMdjxcBZu": {}, "fQxGiHPllG4cYEzf": {}, "TD1ZBm3MqHcUmLZZ": {}}}, "PSNBaseUrl": "bSqb8RwNmn9HrNQy", "amsClaimTimeoutMinutes": 24, "appName": "uZAAiE0mit9RGCCH", "asyncProcessDSRequest": {"async": false, "timeout": 52}, "attributes": {"qwGyzzWi9gwQYv7t": {}, "1o7TTr1DmrhZv15T": {}, "7quIOvBMcaYmvCkG": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "cHyCUEXlAvxJMdal", "customURLGRPC": "wSyliWMNW5NyLu0M", "deployment": "3VHh2EI8JlDbPWbQ", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "dlgdWyOtXi3choQr", "enableSecret": false, "fallbackClaimKeys": ["68cmDc3fxU8MyKrQ", "pM4hkkK6KKXNB3Gv", "0IqmF51TkhjYnaq6"], "grpcSessionConfig": {"appName": "foWvXa3bMrXsDr6k", "customURL": "ILsSSyDdmykmoPYg", "functionFlag": 4}, "immutableStorage": false, "inactiveTimeout": 80, "inviteTimeout": 18, "joinability": "9oCMNqq98SjTvhZN", "leaderElectionGracePeriod": 21, "manualRejoin": false, "maxActiveSessions": 92, "maxPlayers": 23, "minPlayers": 88, "name": "535X3ateEKDpADz1", "persistent": true, "preferredClaimKeys": ["5lZC9xv32e8c5csS", "ovoqsZNBdte9NDUP", "VJf6c2Z0QZxfgPub"], "requestedRegions": ["TDIHrvqAThuwjRHp", "KKTlmVr9XuoJbRFQ", "SKVPHbn4Xxtu7LQR"], "textChat": true, "textChatMode": "NONE", "tieTeamsSessionLifetime": false, "ttlHours": 19, "type": "jqU6YE3p4lSck0ZH"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --name 'nSBJroav91GXlvPG' \
    --offset '3' \
    --order '8iGeUlc9d9sogWa2' \
    --orderBy '4CKNS0GqVvUfHQvs' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'HXNUNe4mhgo5QB65' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'lSAiYnNjkfZrQvGg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "PROMOTE_TO_LEADER", "KICK"], "PSNServiceLabel": 77, "PSNSupportedPlatforms": ["QXcKMDYDDxHSZjtq", "XyJ58f7Gc26SaiGV", "kydwYWQG26yUZNmT"], "SessionTitle": "BcvrbYCwZtxFHyPL", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "8ilbyDPUIj88cekd", "XboxServiceConfigID": "qCt81P1ktfIovmv9", "XboxSessionTemplateName": "gsR5cJcHm3SZLxoR", "XboxTitleID": "DFuuuySj29a9LJE8", "localizedSessionName": {"HoRS1X2PFAAMwzHP": {}, "xB1UskYs4Yw20DOq": {}, "OBSC2DKHRuPMMWH8": {}}}, "PSNBaseUrl": "Yb33T5UBJCjfcnLR", "amsClaimTimeoutMinutes": 11, "appName": "gBnhhqElIaDml48w", "asyncProcessDSRequest": {"async": false, "timeout": 81}, "attributes": {"JT1yduat2vQR3biB": {}, "fsu4jmsRE2w1yEkL": {}, "gh3tIYt4SqYUTLDx": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "Oxtjzm8y2wNhmwoY", "customURLGRPC": "ZyI4EFZKBcYrCEAE", "deployment": "7WIsfmx40NLRc6m8", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "Jgas4b6z3LNUj7fd", "enableSecret": false, "fallbackClaimKeys": ["IaFQCYoDPICpnduE", "EQlULdJz4mnRBkMN", "xvvKgAT8mJrYq6hR"], "grpcSessionConfig": {"appName": "kloqxM3gpwxcfMy9", "customURL": "XzjjI5YbsKoADkzJ", "functionFlag": 62}, "immutableStorage": false, "inactiveTimeout": 98, "inviteTimeout": 20, "joinability": "Hzih3bit0VWn3CO3", "leaderElectionGracePeriod": 85, "manualRejoin": true, "maxActiveSessions": 61, "maxPlayers": 94, "minPlayers": 81, "name": "qUXlTDBzOuYsaZA2", "persistent": true, "preferredClaimKeys": ["QY3snn2ZkP7cFdP4", "3e5dC9XIBudfZgrb", "HDIDm4hMzF4Txode"], "requestedRegions": ["nSrUTvfqU0bfoMm5", "cTtFWbotQyXJRcQW", "smqPNs92epxk0i8V"], "textChat": true, "textChatMode": "NONE", "tieTeamsSessionLifetime": true, "ttlHours": 9, "type": "RujIUE1Tq5jyAZvk"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'RCMNFIurjh2imdb4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'rbkXj0ZwsVC0gL97' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZVJSPqJiwv1qlYB1' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'RSKs6gQxC3Gb7S0o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "4zGYY7KQI1AeFgPq"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'aOkvo1aolB4lkKB4' \
    --dsPodName 'EYOkQ1jMD3cym8xI' \
    --fromTime 'fkOVW2grREOLx0KO' \
    --gameMode 'ww3HICQLfl7MUBG7' \
    --isPersistent 'qtPu64yAtURKLRkb' \
    --isSoftDeleted '738HGS6rDgMdIIlh' \
    --joinability 'S1fSiM9331m7Ta1P' \
    --limit '38' \
    --matchPool 'bJE5Vs2GcyomQoIX' \
    --memberID 'imBJehyxlNsjUgxB' \
    --offset '22' \
    --order 'P7WnbdSJtjX7ZshZ' \
    --orderBy 'yZl5x4bRXBHUTrDz' \
    --sessionID 'ZSKscfOcYu3dpCRO' \
    --status 'YqUiGKXVFCmpo6sP' \
    --statusV2 'wVOEDSJsEK5QpNhl' \
    --toTime 'I2iS5EpGhhvXYck0' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"upMzUYnb76tFkEOR": {}, "V3bu1bNCtX7W40V6": {}, "Do5sYadCCFrHHC3D": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["pZxkrQDXuNFviMar", "v8mnfHK8CCmE2lPn", "sbD3SGEdlwuUccE5"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '36ugBp3HBvepnDCj' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rok0WvGYYnx4V709' \
    --body '{"createdRegion": "xbnGezKsDwG2omOR", "deployment": "2nvYI9TVqJdvzcWb", "description": "fUpaXp5JMl5LL4bT", "ip": "xBmZjdrrIxsB0NRs", "port": 56, "region": "XTvKCWwNTAhd2wrS", "serverId": "0uPdjhdinpng5BLy", "source": "8wbhMssAHjapIkY9", "status": "Rf4wP57dBZNR88Yb"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'CtmKy8M9zVrjfGXZ' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nqAQUoY1GjlIIk0i' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'KoTTS1j02o7JjTXA' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QN0qdskdQV0TqI8E' \
    --statusType 'FnmDbxIxi4YKlONk' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '16' \
    --order '5Y4JvaizwiilatuU' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --fromTime 'jjt9lIMGql5ElEa9' \
    --isSoftDeleted 'EIIlGcHB3CfR3ncD' \
    --joinability 'lwi3v3MFFJ1KesKo' \
    --key 'ELCpobBEG8X645xp' \
    --leaderID 'dXpai0rYaT5hOPja' \
    --limit '11' \
    --memberID 'ues1Hhhkg1yLVbLF' \
    --memberStatus 'zHEP8cM4NTwr0KHa' \
    --offset '54' \
    --order 'iR1DJ7HVWqMkNSaw' \
    --orderBy 'QUWDFJvJBWic7UkB' \
    --partyID 'eIXuqDuAXI66bQ71' \
    --toTime 'w0deoV9Lx5RDA1l2' \
    --value 'XcrciYNEzvSZIPkh' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["SgORcz5S5BvmgBLx", "h4ijFnE3Tam69qSZ", "7PC6f6QkmZXElW9Y"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fRSse6AAz3S4czz0' \
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
    --body '{"psn": {"clientId": "QKFlAVmVLu4AOec0", "clientSecret": "z8eBeeoip68J1nsv", "scope": "4W2OJhtafxMSJlHe"}}' \
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
    --platformId 'PSN' \
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
    --limit '77' \
    --userId '4sZKHcl5LLLOexL4' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --userId 'QpRWCiiPDGQhNPEw' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'iJCf2XJVrlzqQls1' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ozhLVA3kE8jKvgat' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OEBM70TdlNBJYOmp' \
    --userId 'u1VCarzBsV6xnZ5J' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'rzzjrcaug6CWVG8S' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'WP3glU6muswVJnNn' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7kAa7j0riFc5HTH' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "QIoVsGo7dwV9DBqF", "attributes": {"KHQkETJyTlUrwDTn": {}, "oujQD4IEiH9Z5qXn": {}, "3aoRtlqOECohViHA": {}}, "autoJoin": true, "backfillTicketID": "uGRUvpZaHCuESOiI", "clientVersion": "ZsMfB4ZH3mtgWgU4", "configurationName": "pCAKxeE70CaunQNx", "customURLGRPC": "ot371W9G4AvQkqsG", "deployment": "nmyo5JJTUVmb8GEX", "dsSource": "FTlEMEsFzYqwgK1N", "fallbackClaimKeys": ["p5nodqpLm7FhJBNX", "zAFdO0Khqf6kiTdS", "Gv2LFjAKY7CbgsWq"], "inactiveTimeout": 64, "inviteTimeout": 20, "joinability": "WZX7kPBom8F9GLLT", "matchPool": "G8phc3n4iLoIllKl", "maxPlayers": 31, "minPlayers": 83, "preferredClaimKeys": ["hmguB8FOTjMLo4b9", "rIzqYkEpstyVTBcr", "M8rG0rH0zcswwVeM"], "requestedRegions": ["K6MbGIVIu8vvwLc7", "KY3uVoJXTIMtpgki", "eDyF97lGdMiHKxbW"], "serverName": "CYzo8yO2KTK9tmmO", "storage": {"leader": {"nYnOpas6ghP1y4Zi": {}, "7s7QBlk44Z44B1GZ": {}, "gKg4uKxaCgcGLuC3": {}}}, "teams": [{"parties": [{"partyID": "brWdTYCfHkIySok5", "userIDs": ["DiXZtLW87rGysryo", "d3dNQrmsApRA6HX3", "RwrKt2ecozL0TOg5"]}, {"partyID": "4vCE48L5oLF6M4lN", "userIDs": ["a4JUMSHNgqRqCV7u", "samANkZlOX9Sfo95", "HgXqKhTPkwfLM9uS"]}, {"partyID": "ybRzWek2gZvRrvr0", "userIDs": ["n9d9lvccKMLhrTrc", "BE2ItBS3KtKZWe8a", "oFzAyBME74HUtipU"]}], "teamID": "WYhWV1qx8CzPML52", "userIDs": ["faXUr9Sk4lq2faBc", "AXXKlhvyH8paOJtx", "qMPpcVfRwNj547fH"]}, {"parties": [{"partyID": "0XrKEDpEY8VnocGA", "userIDs": ["jci0V3tBf2jnHGKX", "phn50c9tNLDljhZ2", "jxLRX3z46OCaGBeM"]}, {"partyID": "fPlNos4yBRjrERHE", "userIDs": ["onAZR8GmEu0q1p6Q", "CyY6vSkVFWdsbYuV", "EGVxYheR3j5mNZ6v"]}, {"partyID": "wv7K8Asvt1j1Rx59", "userIDs": ["hesNWy2NvZ85DDKD", "AF8KDsBZOuYQJ03B", "AHZ7c53q7akMpcmn"]}], "teamID": "nx6RVBrop9v7aZK3", "userIDs": ["h65hbN15zfQSfQrt", "fF3TQN0OcNDLr36v", "zohZyjMQAg5mPYhr"]}, {"parties": [{"partyID": "LTyU8OhgfY9JQYGF", "userIDs": ["4bYXEcENx9xZlAch", "ob44lONDDwMvgI0H", "lyPR7wZNiVsF6xG2"]}, {"partyID": "mXEQdbzIVy8alncV", "userIDs": ["7vWgSHdfo07UctPE", "rqxyMyOK06MqQBEr", "xgjVBycvU4PbmRDc"]}, {"partyID": "rg0DjQjBECXvea7H", "userIDs": ["1m2lJFRZ3ZprZ60z", "MjhTHeh94TSenE5h", "CFkIf5weqZ18MH57"]}], "teamID": "l2Zsrh90ETtYmGuk", "userIDs": ["z3MnlrjcHp6B8Vj7", "rXFgDnDkdZ9bpjb1", "tdA3QhjCMW64f4Xh"]}], "textChat": false, "textChatMode": "TEAM", "ticketIDs": ["SoTB2NMKtezapPr2", "QEPx3zTxBGtEJIYp", "puUSsKoHw2hyd12u"], "tieTeamsSessionLifetime": true, "type": "0dW8rX2MVUGKSZ4G"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"cLkt4pK32sJxlZcC": {}, "TpTdRtCHvuk6B6XT": {}, "mSLyn50sigBVZxiK": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dV57GvRyd9UuL02L"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'e8HSCslsDd4M1F5q' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RIblS7Nz81GRazPA' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ANjfBoldFOyqA2cl' \
    --body '{"attributes": {"J5gEOaCgM6Yn6Rug": {}, "bNEIpGBFUjOn5mM7": {}, "k8nbLzvtCIW5ynMK": {}}, "backfillTicketID": "quUicAeIVXtoWAXh", "clientVersion": "MlW4tLqX7OICf5oD", "deployment": "1e6oI9FmYel0kOw7", "fallbackClaimKeys": ["2o8Zkgk0jS6rDWUw", "fhKvrf2AaH4yCWrH", "SppnIZkNnTn3rzH5"], "inactiveTimeout": 81, "inviteTimeout": 45, "joinability": "tEYT8sIPSE1XXPzy", "matchPool": "Sa0sZoFS6xCOWMpy", "maxPlayers": 14, "minPlayers": 68, "preferredClaimKeys": ["9pMsQgb64ELbzDMw", "yo4nIRysQdbufXjY", "nSoIFeouC2m38kXr"], "requestedRegions": ["DZWlGVE9sJ4NpUtK", "p6M9I6nEwnZhsjwJ", "eGwaPSDMZz95OYKi"], "teams": [{"parties": [{"partyID": "qaZD63xe5rruJVfL", "userIDs": ["Gea0ZtlzUcuHAXz0", "UV31MfuGaXsAuGsZ", "aSHevO0TQNEI3kfa"]}, {"partyID": "bxJWWSI1ECUo1NPp", "userIDs": ["eFhUztXDgB7n4C97", "uAPP8PATLpUpxeJl", "sBJT6Hh3OMjAjq2m"]}, {"partyID": "K8lbSEEelxnb5QxW", "userIDs": ["G2HFnZlA6HKWW4fI", "1IQcoBQELcNlZkqT", "ZrKgXNwvm4e5GX6H"]}], "teamID": "742OixhtAoKiVm6U", "userIDs": ["RT95XhnUcvWB28Mp", "usuhhDJ5slzgiWZE", "tyd56LfxnbY97jjY"]}, {"parties": [{"partyID": "gXchCbkXX26uEdCf", "userIDs": ["QaMAQuTKfC0I2kNj", "CMDtDMrentgn3Dhq", "ciwIeShF9RKb9vvx"]}, {"partyID": "uJlhXbWhbwPwToC6", "userIDs": ["knjVwVnzaqSfJiQF", "C2gXoda0kg16yUSp", "SOAjHJWwfCjYwWkL"]}, {"partyID": "ob9gKLqs2nEZhpBy", "userIDs": ["fHZinxNfgPAwkMBs", "znlBUqnLT4AbGptK", "aWNvPbpg7yrRvXfZ"]}], "teamID": "6rvgvEY3Hht1SwqT", "userIDs": ["sKKKo37NHDOQe91P", "s3ztUIV0dS6hIH9c", "4VfkyrwpuXxbaERb"]}, {"parties": [{"partyID": "fgPmi0eHkt1mr9EO", "userIDs": ["IFg0dnWIYN2NVL70", "Iw157g00jr9b8MuY", "mmeKTmBNvGYxEQdf"]}, {"partyID": "3ewoGGoY7xmFNAmj", "userIDs": ["DDCvs78mcMdiS76Y", "ApGJ9ufwLYkqIgLu", "ZS6hsQryiEtOAbpe"]}, {"partyID": "UNf26UqkCfgCUYBn", "userIDs": ["2xaOBdPF0JmX8qwU", "1cTuHHPB5S3DvPRC", "zBrVUxmDOj3cvRFa"]}], "teamID": "TC11W0TGTCm4fZWu", "userIDs": ["k6pQxDQpKqxLGeMv", "r9TsvcMQ7dBsaIec", "RxIsZvD6rmzVr5XT"]}], "ticketIDs": ["1Nxw0v1dMQ9Rrbk6", "C2cVWf6ttvbU1PO6", "ApCD2VXidT7w0Oc1"], "tieTeamsSessionLifetime": false, "type": "N8WXBPp17PAewqSm", "version": 35}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'x3B4t7WQnp8jXZed' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gt5cyNe27HLtwtVO' \
    --body '{"attributes": {"axgP6Jbct8puMybY": {}, "GxD9IPmmsLmu3kaP": {}, "j0O4zd8Tb7cUNGPT": {}}, "backfillTicketID": "BxiFFCrn7djjs69F", "clientVersion": "TFVGUVhvKhJCmeis", "deployment": "ql14mUHVbMPimNhc", "fallbackClaimKeys": ["ZsU3VAdMDcb4qlki", "FAamqvZI2KwjqPBi", "WXade41s3rH34mB2"], "inactiveTimeout": 50, "inviteTimeout": 28, "joinability": "PlRpWjmHZAAvKTH8", "matchPool": "MuqIg0CzkguwuJCW", "maxPlayers": 54, "minPlayers": 62, "preferredClaimKeys": ["vxSvNDlmM5nQFMGz", "s7fzjgyc44mEh9tR", "k8knYSV30lnroQeh"], "requestedRegions": ["MDli6t9unQLYXxm0", "9wpGAbpEmDY9vLh3", "u6EDsUmrV6kH4Oot"], "teams": [{"parties": [{"partyID": "KwG3UC6XCnnZxF8C", "userIDs": ["mQr17W65br34rBBN", "9tU6TDm5GloFSKWM", "1eym5ydC6p25xCWT"]}, {"partyID": "qUOYZENJ1QHZQxPR", "userIDs": ["XH7uxBJEECQE1li3", "Bg7Jxc9pUnZmvhid", "wCkZwqjYLfTiCO1N"]}, {"partyID": "DBvQvRPnAz4VzW0C", "userIDs": ["poBCbyJsF5IjF1c0", "W338HS6CBgVRyihY", "NZ84CVhziXV8HwSm"]}], "teamID": "vcvcDKF19yVRafCj", "userIDs": ["OuSYht83AdvBaagT", "iRJ8daGTVX3Bb7jl", "z5IfHgKjI9mwJSrN"]}, {"parties": [{"partyID": "8jkIykR2zbaI6PD7", "userIDs": ["fEscShnGUGUtV9GJ", "279GDbLNwjm3FK0n", "nX2poMfZ1hDHtbh4"]}, {"partyID": "HtMlFgvh2Dp2SoiI", "userIDs": ["Pp1yvfAHS0VgLu11", "A3HTovFi4tPAGfle", "yCA6jEtcqsnzoVIL"]}, {"partyID": "jkwW61duF87aUyrd", "userIDs": ["t4XSpWBAetsanzqP", "8oxfrtbECD1CYPwa", "iBAxfYL8Avt70ZUT"]}], "teamID": "2fSk3LL0calqxEew", "userIDs": ["uGS469k2hG0WKt4s", "UmanYxM0UHZVNYzG", "MNIpWoSLkUrfuf4U"]}, {"parties": [{"partyID": "3WeYeA9t2ENKKWrF", "userIDs": ["tHIi1CMgKAOG5iDc", "CR5PbCvDLil8wj9c", "KM3Ar6MF35hCER4n"]}, {"partyID": "GmWGgTJfHlJl4tHG", "userIDs": ["a4XfZcd9CVnGqMX9", "FieeEssWEUl07bhw", "ntCVqiYOJf5KwMZQ"]}, {"partyID": "jzvjSozv6CTRDl0z", "userIDs": ["p9CzHFwinkBNi4gv", "qgl6TZ9TGVPmv34h", "6T7EsufmfxKYB4LM"]}], "teamID": "6H6QXmpZ9X3fUSR1", "userIDs": ["l9xLPBsmAUrD9L1I", "iD6MlcEPhMDFzjHZ", "3sIhzOx2CXKlvIom"]}], "ticketIDs": ["U3pIxM9n8D2eLMe3", "lt9qfx2UDcgVE7L9", "FK6e0MrPc4vtxk9h"], "tieTeamsSessionLifetime": true, "type": "KlG56HlzGr7XjdyR", "version": 74}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ee7QLTGAak7Kaol0' \
    --body '{"backfillTicketID": "1DK97D2xnik42mit"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eR5eQAe1rzmmgqBP' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Rmd6mO4oI8KDqebm' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '83raNBJ5y7axEkvI' \
    --body '{"metadata": {"4oxZEDxGiBnNbn0z": "af7CaOSlHXrUSA6s", "MJzA5mtqISQ83TTb": "tefXWznDe4LQdXfF", "Bii2RAMEX5RMjBFV": "ZGYzQqV8d9mDdUIo"}, "platformID": "iIJFNxuNOmUSWw18", "userID": "T1IxVWCxdvPL9e4P"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '01vxP8xj1LyEirUR' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ERnEMzpImW6sjAHy' \
    --body '{"leaderID": "CK5tNanGBrkzUvck"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3xTtmOFMebS4AdlN' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'zwog2IhErkNhNcEC' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WwchW6zL9SkbLlrN' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XnGanMazb8jvRWen' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'URH48aJuALEcSqcE' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId '15u6D31DjOsrs3CU' \
    --userId 'YATdqnQGbqiqOkNe' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ATj7eGjodd7CcJUr"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I6MAugK5kypNrp2n' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Fe9FmN86sK5LOq4f' \
    --body '{"attributes": {"t5jGcMICPUYnfG6j": {}, "l9U4jReteIMgzISo": {}, "mCsodJrhQW41q2Os": {}}, "inactiveTimeout": 31, "inviteTimeout": 50, "joinability": "CZbt3Uta5I0uGcL1", "maxPlayers": 21, "minPlayers": 32, "type": "oyHjCH5olYLETRpA", "version": 56}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BJ9iqMcBL4BzhDUj' \
    --body '{"attributes": {"hKPwbwcvQU5kG8bX": {}, "GFmPAnOkDiJq4xQy": {}, "e7HqnVK3YVeOWs9m": {}}, "inactiveTimeout": 11, "inviteTimeout": 5, "joinability": "VQh3jLBtn9pxpE7B", "maxPlayers": 36, "minPlayers": 39, "type": "NSleywHbHig6IKWV", "version": 90}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '77KeRWdECaFGzfZ2' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'hxcJ2Fnemn7M23Sz' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Uo4hNBDh9ZFP1OW0' \
    --body '{"metadata": {"nXOErQPS4VsRoYIK": "69yg9ADCGiXaLs2x", "jHkinOD975nARHCm": "hNHSXuqIHsxvaUoX", "DmwWsukxncuD3QxC": "XMd00YBWCaVVmM45"}, "platformID": "mfIZsWhkS476dGGJ", "userID": "wJ00UH197MJ6zU7J"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LMQyMWzYQCAaPJgo' \
    --body '{"leaderID": "xGJoJaSzUtY4ZD0X"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tb0U4pH16NUsVY21' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NVIs7NRen2Y3Ns0Q' \
    --userId 'JQeaWytPfds1BYx0' \
    --body '{"EaURydf8ZyyZeHAW": {}, "GgJUbUJRMbkcTglb": {}, "U86FyOjApNHBVfNO": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'URcjY3YYT9oTynmf' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IuBWgJTNFfM8M0IW' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '4oe8KDgy0xZfAcNg' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId '14Ws8TIP1LKiFQoL' \
    --userId 'DvumfqrgSfnx2h61' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'X9dN1MGRXBJ6mVV7' \
    --userId 'JS9qjNLwvI8JdiY3' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"RRiLilmOGF6dLLIe": {}, "IVIjMcdlbdRXTGIr": {}, "dNL5gJPqTAjgqaTH": {}}, "configurationName": "f1ANTJ9Yk997XkGO", "inactiveTimeout": 8, "inviteTimeout": 76, "joinability": "C6ItxDT8p4n4XCFk", "maxPlayers": 60, "members": [{"ID": "VjVZw1ToLuPakQN1", "PlatformID": "MpOs1RVFrcg2CXxe", "PlatformUserID": "px78fvsyhE2BKtyT"}, {"ID": "DSIM7mkmvZ7Cmsh4", "PlatformID": "US8o4jfMANPpmZDd", "PlatformUserID": "MiCxmuCCVuFjS1GC"}, {"ID": "1d2b92B4vEgj3HOm", "PlatformID": "hcWm428XejRF94NI", "PlatformUserID": "Y9nMrBZo0lNUBDSh"}], "minPlayers": 68, "textChat": false, "type": "D32vvL28FPwTiXfL"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xDC9Ynd02mECIQhf' \
    --body '{"IhHtADUQ9zimQTQT": {}, "95pFJUAJsyAfeKOu": {}, "fV4f15NohXu6opxQ": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GRt6PqlkL0diRhLC' \
    --userId '10ih2EQfY3XCv4hd' \
    --body '{"Oa6FdZhNMd1onFjG": {}, "RbxtABPXDmgNEJBh": {}, "gGq5GIDhNC66szbC": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["Cf73IFbRkPSSITz4", "TjCrJHXGXku2YVuO", "zhxHmnrrV9ZGWrZ0"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "sxe6A6RpmKDebNky", "data": {"lbynkgT9vayLLiiz": {}, "ac7Ge6zKJdlt7rjF": {}, "5RaJwvkWVco2LTo5": {}}, "platforms": [{"name": "ijlvDF8qBWCQ9dLW", "userID": "YyS8zdhMeBXH8x6H"}, {"name": "dVfZVDAiU6iJOF7J", "userID": "KZFNk2NKy59X8iOg"}, {"name": "2sVBiCoeC5weXJl7", "userID": "PeiMH8z8dVej8N2y"}], "roles": ["v6VTnOK7xAvM7tuL", "81lsR7xxSVp3Gd2T", "K0HzYviTgYmx82JV"], "simultaneousPlatform": "BRLPZ6Iz8tne5dbg"}' \
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
    --order 'uBF6Gsvvdl8jHz9x' \
    --orderBy '7XZIjU4IK9lOLaZa' \
    --status 'MphKCqTq3EVheJjo' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'EEXBLIxGnNuhoJM3' \
    --orderBy 'WWPvvCiCf33ViEdq' \
    --status 'QpoGkUWNizk5UcPA' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE