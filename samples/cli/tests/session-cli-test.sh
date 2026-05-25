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
echo "1..104"

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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 96, "PSNSupportedPlatforms": ["fvnnSuB0y5WUlrMd", "I4sNveabntBSxTeI", "v53HGCiljvjKoyD6"], "SessionTitle": "SCwGrncqmLtjQHAf", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "67FXGk2s9Q0mPVo3", "XboxServiceConfigID": "twu0MesTCf9x4rt6", "XboxSessionTemplateName": "9lna7qxNeIxPz6Mb", "XboxTitleID": "wL6IY69z1UaLqYSY", "activePlatforms": ["WytLPziZMdjxcBZu", "fQxGiHPllG4cYEzf", "TD1ZBm3MqHcUmLZZ"], "localizedSessionName": {"bSqb8RwNmn9HrNQy": {}, "4uZAAiE0mit9RGCC": {}, "HYzUOcEdscKHPEqg": {}}}, "PSNBaseUrl": "A8yu7Vk6Jt4Ymos9", "amsClaimTimeoutMinutes": 74, "appName": "5T7quIOvBMcaYmvC", "asyncProcessDSRequest": {"async": false, "timeout": 52}, "attributes": {"GZ5dAgqxpBFmaLox": {}, "ozr6wfNPX2bOItRM": {}, "vqtlB2jJCSQT279Z": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "Q9lNmqRBaAkLnvxk", "customURLGRPC": "T1X68cmDc3fxU8My", "deployment": "KrQpM4hkkK6KKXNB", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "J8aeCnaLpUKp44YU", "enableSecret": true, "fallbackClaimKeys": ["foWvXa3bMrXsDr6k", "ILsSSyDdmykmoPYg", "c2L4jk4Lo0LSP0pf"], "grpcSessionConfig": {"appName": "4IxjUkl535X3ateE", "customURL": "KDpADz1x3poD3Qgb", "functionFlag": 9}, "immutableStorage": false, "inactiveTimeout": 30, "inviteTimeout": 5, "joinability": "INVITE_ONLY", "leaderElectionGracePeriod": 88, "manualRejoin": false, "maxActiveSessions": 88, "maxPlayers": 37, "minPlayers": 92, "name": "MzH7Qm8bwbmXgdAP", "partyCodeGeneratorString": "h1EThG96gAFKK2WD", "partyCodeLength": 12, "persistent": true, "preferredClaimKeys": ["DIHrvqAThuwjRHpK", "KTlmVr9XuoJbRFQS", "KVPHbn4Xxtu7LQRE"], "requestedRegions": ["NjEEztx1WsYSiZqa", "n0nSBJroav91GXlv", "PG6bFYReVHQipcCx"], "textChat": false, "textChatMode": "NONE", "tieTeamsSessionLifetime": true, "ttlHours": 59, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --name 'NS0GqVvUfHQvsHXN' \
    --offset '95' \
    --order '2d3PBddN8S48l9ly' \
    --orderBy 'NApflxqMrj3oZk03' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'QXcKMDYDDxHSZjtq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'XyJ58f7Gc26SaiGV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "UPDATE_JOINABLE_USER_TYPE", "UPDATE_INVITABLE_USER_TYPE"], "PSNServiceLabel": 7, "PSNSupportedPlatforms": ["zfTcyiuATus9hsfp", "FDcSDG8aMVGLiBNr", "DjqoxcwgGLXpUL4p"], "SessionTitle": "p2ncYAHdNzDmeIP6", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "OvDz9KOsb392k6Ym", "XboxServiceConfigID": "JFfRByjlBiuFM3FI", "XboxSessionTemplateName": "oVk8T3GpAnkCmBUq", "XboxTitleID": "g2SCnqntX9y1aZSW", "activePlatforms": ["MiVi10sG6vxkfUcm", "qRRbceJ5i0EeDxOg", "BnhhqElIaDml48wd"], "localizedSessionName": {"NFLTm5T50x9WT0Gf": {}, "H2rtOa4EXsXzOXQA": {}, "k4mqrxzTtuLl4Xlb": {}}}, "PSNBaseUrl": "GL8QOxtjzm8y2wNh", "amsClaimTimeoutMinutes": 25, "appName": "OMh5eC3IHeHSKLCa", "asyncProcessDSRequest": {"async": true, "timeout": 48}, "attributes": {"AE7WIsfmx40NLRc6": {}, "m8heKnWhzfe2Nube": {}, "oKFeIaFQCYoDPICp": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "duEEQlULdJz4mnRB", "customURLGRPC": "kMNxvvKgAT8mJrYq", "deployment": "6hRkloqxM3gpwxcf", "disableCodeGeneration": false, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "9XzjjI5YbsKoADkz", "enableSecret": false, "fallbackClaimKeys": ["EN2VHzih3bit0VWn", "3CO39PXDNxtXgeO3", "FgkXhjDzaQY3snn2"], "grpcSessionConfig": {"appName": "ZkP7cFdP43e5dC9X", "customURL": "IBudfZgrbHDIDm4h", "functionFlag": 79}, "immutableStorage": true, "inactiveTimeout": 22, "inviteTimeout": 64, "joinability": "FRIENDS_OF_LEADER", "leaderElectionGracePeriod": 93, "manualRejoin": true, "maxActiveSessions": 40, "maxPlayers": 30, "minPlayers": 18, "name": "denSrUTvfqU0bfoM", "partyCodeGeneratorString": "m5cTtFWbotQyXJRc", "partyCodeLength": 87, "persistent": true, "preferredClaimKeys": ["YvYmmDg7VYPXIuvU", "YTZBRujIUE1Tq5jy", "AZvkRCMNFIurjh2i"], "requestedRegions": ["mdb4rbkXj0ZwsVC0", "gL97ZVJSPqJiwv1q", "lYB1RSKs6gQxC3Gb"], "textChat": false, "textChatMode": "GAME_AND_TEAM", "tieTeamsSessionLifetime": true, "ttlHours": 31, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'ipNDigNJma1MbqqZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'tfNWql4nmwAft4gq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kNNlWkD9eOziYRFO' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'n0jJLHC9LxhvNXTw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "GBCtohLtl9Zuhytm"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '5UDrT6QXCs5SPBbR' \
    --dsPodName 'PZTF6oQAXVG7tnsZ' \
    --fromTime 'g5QgXjvyGJPN4eXb' \
    --gameMode 'JE5Vs2GcyomQoIXi' \
    --isPersistent 'mBJehyxlNsjUgxBk' \
    --isSoftDeleted 'F6wFPoJeQediogEh' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --limit '79' \
    --matchPool 'l5x4bRXBHUTrDzZS' \
    --memberID 'KscfOcYu3dpCROYq' \
    --offset '95' \
    --order 'Qyj4bj5Ro2ogaKt2' \
    --orderBy 'ujQSa3Zdb65UXmy0' \
    --sessionID 'Zp6iIaTIKUkmkk9Q' \
    --status 'REQUESTED' \
    --statusV2 'PREPARING' \
    --toTime '0NBMA9ORxpzwLR2A' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"K6eXUGPJsw1fiP80": {}, "G9Pclxcft2ulIJzP": {}, "yrVEiOG4UcqsuGKH": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["hMRWLVd3DlhLuIpo", "mM8sm1MiaI1mX2tJ", "oARtdbBe7udsMrok"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0WvGYYnx4V709xbn' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nzJ6fH24T805tVg8' \
    --body '{"createdRegion": "JqU0jZpjvsugAOS7", "deployment": "u8RiWyerCSa8SRgw", "description": "sAj1ik1jglaDXTvK", "ip": "CWwNTAhd2wrS0uPd", "port": 19, "region": "HWwRVnwVBOqOHi8p", "serverId": "WGd1juYhiqjRJOqB", "source": "5F93zFQbJndUDpdO", "status": "DS_ERROR"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'M9zVrjfGXZnqAQUo' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Y1GjlIIk0iKoTTS1' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'j02o7JjTXAQN0qds' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kdQV0TqI8EFnmDbx' \
    --statusType 'Ixi4YKlONk2Q5Y4J' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '0' \
    --order 'aCNYIWekp18lOC3m' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'NqF7Bl0LcghVHfPE' \
    --fromTime 'spxwhRON0bc1eMbE' \
    --isSoftDeleted 'IjowLqc3ecjXJbZD' \
    --joinability 'INVITE_ONLY' \
    --key 'BEG8X645xpdXpai0' \
    --leaderID 'rYaT5hOPjaf3H0tY' \
    --limit '18' \
    --memberID 'hkg1yLVbLFzHEP8c' \
    --memberStatus 'TIMEOUT' \
    --offset '90' \
    --order '4NTwr0KHaAsmTej5' \
    --orderBy '2WKi6tArAURt9plC' \
    --partyID 'SVq8PdH6hJPUAc0R' \
    --toTime 'VwXgAgntLMCuaXBW' \
    --value 'Qi6BqPg4xr0lCanc' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["UZGCHsZYoLfR1KtO", "v7Zy0b65uvuKNuy0", "ytZQ7M6Nzy1adnSK"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OLFKx1dX4LuWJu3p' \
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
    --body '{"psn": {"clientId": "DMUAeeZ97SBROPYu", "clientSecret": "G6XqP6oo7G73zdxT", "scope": "gOfnwIdlNa29fDLh"}}' \
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

#- 41 AdminUploadPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUploadPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    --description 'IslKHzGlLKWUtDQs' \
    --file 'tmp.dat' \
    --password '61OQAoxyyQpRWCii' \
    > test.out 2>&1
eval_tap $? 41 'AdminUploadPlatformCredentials' test.out

#- 42 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --userId 'tcBFpX8lNtFEJ7tn' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentPlayer' test.out

#- 43 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --userId 'rlzqQls1ozhLVA3k' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetRecentTeamPlayer' test.out

#- 44 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'E8jKvgatOEBM70Td' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadSessionStorage' test.out

#- 45 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lNBJYOmpu1VCarzB' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteUserSessionStorage' test.out

#- 46 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sV6xnZ5Jrzzjrcau' \
    --userId 'g6CWVG8SWP3glU6m' \
    > test.out 2>&1
eval_tap $? 46 'AdminReadUserSessionStorage' test.out

#- 47 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'uswVJnNnN7kAa7j0' \
    > test.out 2>&1
eval_tap $? 47 'AdminQueryPlayerAttributes' test.out

#- 48 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'riFc5HTHQIoVsGo7' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerAttributes' test.out

#- 49 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'dwV9DBqFKHQkETJy' \
    > test.out 2>&1
eval_tap $? 49 'AdminSyncNativeSession' test.out

#- 50 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "TlUrwDTnoujQD4IE", "attributes": {"iH9Z5qXn3aoRtlqO": {}, "ECohViHA5CzgFSy8": {}, "X1A3PrIfapq5AAeM": {}}, "autoJoin": false, "backfillTicketID": "H3mtgWgU4pCAKxeE", "clientVersion": "70CaunQNxot371W9", "configurationName": "G4AvQkqsGnmyo5JJ", "customURLGRPC": "TUVmb8GEXFTlEMEs", "deployment": "FzYqwgK1Np5nodqp", "dsSource": "Lm7FhJBNXzAFdO0K", "fallbackClaimKeys": ["hqf6kiTdSGv2LFjA", "KY7CbgsWqFWZX7kP", "Bom8F9GLLTG8phc3"], "inactiveTimeout": 27, "inviteTimeout": 51, "joinability": "INVITE_ONLY", "matchPool": "iLoIllKlpO2pqiXJ", "maxPlayers": 64, "minPlayers": 83, "password": "3WGRaoQomSJC4Ddr", "preferredClaimKeys": ["KF7SUQPLG59e0k5Z", "tX6wK7PpUlcIW32i", "K7MGt1ixY5rA1WoV"], "requestedRegions": ["eJIePF8ZrQzP4zvt", "dxdbZUpd6FJtHJ1p", "yVwyKQLY6FEO65Rb"], "serverName": "3z7CYLM8IlsHqffn", "storage": {"leader": {"rfsGlfPaZKBwa3Dd": {}, "b60ufPpzwj1QGIFm": {}, "lVf4jvapseE9LN9b": {}}}, "teams": [{"parties": [{"partyID": "vhOrHflIOd6X3viL", "userIDs": ["vtEk4mTIpUA9gxo8", "SV38nEhoXmM2W7l6", "jHMA2rG3nakopAyw"]}, {"partyID": "elu01nryEJ0NqoTo", "userIDs": ["w0qiOiC4j0iktm0Z", "PLkLOsp0LZ5njN86", "Hl8kUXzt6bSc6bWv"]}, {"partyID": "gpVyW9dD1kOmvrAe", "userIDs": ["jcq2LgkQuaS7RBx3", "vim02jBOxrZDyvpc", "LYOWA8NjxOnaEok4"]}], "teamID": "nOOCzfsflhjbngJO", "userIDs": ["Un18G5MlfDTk8aG4", "0NlncceIZSwgAIkg", "zh4pTU0Am4DZhl0b"]}, {"parties": [{"partyID": "QxFJ3sWCqQpQ2FbK", "userIDs": ["PFMycMSQ4qfAacR0", "LgB5BUXvjcu2s6w3", "VifnKqmTSoGH1XEf"]}, {"partyID": "Y6QAYn6WQ5UBEU1Q", "userIDs": ["AOHfZiGhxOdcuDXS", "xSc3aZPV87pna08g", "xefTYKhuxaEc7M4P"]}, {"partyID": "7UckSC6ePeN8i4Gr", "userIDs": ["FES9z7xueHpATHcc", "ee9GXhKcjmSEwdrk", "EnnqKzFsLfYalUlf"]}], "teamID": "wEQKjU7eHGebSVu0", "userIDs": ["LQ40kepEaC4dfiOM", "ZfEhHr39pysFO3Zv", "c1BZG99LyvfvHEsJ"]}, {"parties": [{"partyID": "KQQewVLMUoAnaRcY", "userIDs": ["p7FUjfIGaffoflEI", "ByYqeKN0meGelYF5", "wWaDhukU4khGG4vZ"]}, {"partyID": "FTYnPkmSu4PWam1j", "userIDs": ["xR7SETWjteoc8fgv", "ZDDhoO05oKqymxLD", "1Lcvw6T6mZEiwxxE"]}, {"partyID": "lpMYSWIeVzm7z9no", "userIDs": ["owmlTIKVowi0RY2V", "N4ZONJREdUQ3z9F1", "BxNNgnke4akncw7w"]}], "teamID": "u9TmXfJWBPrx9Ns8", "userIDs": ["eLzYEvwSWTaLQjct", "vrK2jhsYpKPlXn77", "AtYoFzLAATPY8P8P"]}], "textChat": false, "textChatMode": "TEAM", "ticketIDs": ["foivvQxevecWw7Rr", "y0KK5rgAGO0dW8rX", "2MVUGKSZ4GcLkt4p"], "tieTeamsSessionLifetime": true, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 50 'CreateGameSession' test.out

#- 51 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"1BpWoJBaqdg2FHcu": {}, "nsS1lnaO2m9vqjhb": {}, "eK2qN8g6x2PyYDo5": {}}' \
    > test.out 2>&1
eval_tap $? 51 'PublicQueryGameSessionsByAttributes' test.out

#- 52 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "R3hLiD5sf5y1JsxJ"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicSessionJoinCode' test.out

#- 53 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'NGmyt0SQDUDoWBZV' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSessionByPodName' test.out

#- 54 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GLlkUetzCAWc9x1a' \
    > test.out 2>&1
eval_tap $? 54 'GetGameSession' test.out

#- 55 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MjgGim51T107XIZR' \
    --body '{"attributes": {"Z7tZdIs0xf4czdt7": {}, "zqmSKxOEQlVcx6Gq": {}, "sBq8vdhWVnuYLgpZ": {}}, "backfillTicketID": "ehK0G2nmyuViB9kR", "clientVersion": "TcSQdTnNYGeAfYFG", "deployment": "3wSkHKufBdS3ZOok", "fallbackClaimKeys": ["ZB4cXnAXyuGz6Llx", "Hv8SwyagYvDJ3w3U", "NgIGj2jZtEYT8sIP"], "inactiveTimeout": 92, "inviteTimeout": 91, "joinability": "FRIENDS_OF_MEMBERS", "matchPool": "1fUfKmihDbmu8ePW", "maxPlayers": 24, "minPlayers": 59, "password": "QMVDXEHeiGTnwyEw", "preferredClaimKeys": ["6hIWDZrpP7rz3ISW", "510kHr4isTKWjmv6", "7nuHCXWfwnwGioVw"], "requestedRegions": ["VzmmBVVFfpqx1AeL", "tzcPJ3jtDYBo4FUT", "H7CGfKSyxgRR1DiC"], "teams": [{"parties": [{"partyID": "qSMzpqIFGLkDs7AC", "userIDs": ["C1RgBfoNrHlFi2qJ", "LgmBLE35YhyiDV90", "SeI5yppBHoytVznC"]}, {"partyID": "gNyx9fbT63ShEh8P", "userIDs": ["bGikLjgjcj34uulU", "6FYBZsWFbr3RSP0W", "9nBhvhf8Q0DtJMcY"]}, {"partyID": "QdN66bswAgt65X4N", "userIDs": ["1LQZmB61JMdtwCVU", "rYQue84dwmbwFEnA", "ZaWsQJtRYoagRJK5"]}], "teamID": "PX9UcOvhPyE11TRT", "userIDs": ["2SKseoe8VLie0LBa", "36KNzjf005CXNGeh", "Q2aTjTDfKFDXC7eG"]}, {"parties": [{"partyID": "L5YhJDWh9YWqc0qg", "userIDs": ["V6d9yOfIMLds2DbP", "caoMdtRLTmSvTkQQ", "gB7exYvmHMxr5hPC"]}, {"partyID": "JJztJBg0tTJg46Ie", "userIDs": ["wOXE2AkCh3QIZsUf", "8lGFXcmwTERHclOd", "xIwqejxe18rNdb8O"]}, {"partyID": "tq6j1mqUav7k05HA", "userIDs": ["QltnSojV4jT65ycl", "X2FtAz0vJjFIYWOa", "NdsimmkW2miH3xRH"]}], "teamID": "AKy4QxZkaXZ7vmiE", "userIDs": ["d0JPxVyQpshaDwNq", "TbbFMXAMfVXe0GZe", "MgsRsmH1EQrYmkPK"]}, {"parties": [{"partyID": "TPOlhTtSiZNCxuog", "userIDs": ["FteTHJe4BhSSQkQD", "6WmOt6D7ufFVTOhv", "QpfbBke8aEdd36xj"]}, {"partyID": "6wySoltDxsbzxrla", "userIDs": ["KEfkoYjY2o6ouRW9", "UtNquwC3WgumrIz4", "NhGztZpr4U4fwQIi"]}, {"partyID": "LXgmRasvjO4lj8m3", "userIDs": ["XEwP2b4gd3xOeii8", "Jnmssep2xD2NY0kA", "BeGs9yxahld1pO0G"]}], "teamID": "yf5PO3COyMvczgEp", "userIDs": ["zZ3FbtxfhcRC7IVY", "a6iZ5uFRYNn3SHiW", "xF0YbuU5ar5qTLWU"]}], "ticketIDs": ["Cy0Afgc050XIZRW4", "91e94mQjVOOBnIWh", "unElqZUodp3IhtCS"], "tieTeamsSessionLifetime": true, "type": "NONE", "version": 9}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSession' test.out

#- 56 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ei1fIrPvfHnRN06E' \
    > test.out 2>&1
eval_tap $? 56 'DeleteGameSession' test.out

#- 57 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jRwEQlNapJRfk4f9' \
    --body '{"attributes": {"Zcw1pEHAyNFxcVTK": {}, "uAQTGh5BxjWOozGo": {}, "DtsUuYo5p8ED5QZA": {}}, "backfillTicketID": "ufwNa8lzfjv9oYMX", "clientVersion": "MjlVHY1AHwF3vGoa", "deployment": "v7MK0PcLnEkcokKw", "fallbackClaimKeys": ["cQ0baDT9OyJ2h23G", "US2amU7syGlElXdE", "AOrVSnLocLVVYamQ"], "inactiveTimeout": 6, "inviteTimeout": 47, "joinability": "FRIENDS_OF_FRIENDS", "matchPool": "cG5nDBLJoJHbiQ5d", "maxPlayers": 43, "minPlayers": 93, "password": "E5p4cfs2E41cK8QT", "preferredClaimKeys": ["wiIAvxSvNDlmM5nQ", "FMGzs7fzjgyc44mE", "h9tRk8knYSV30lnr"], "requestedRegions": ["oQehMDli6t9unQLY", "Xxm09wpGAbpEmDY9", "vLh3u6EDsUmrV6kH"], "teams": [{"parties": [{"partyID": "4OotKwG3UC6XCnnZ", "userIDs": ["xF8CmQr17W65br34", "rBBN9tU6TDm5GloF", "SKWM1eym5ydC6p25"]}, {"partyID": "xCWTqUOYZENJ1QHZ", "userIDs": ["QxPRXH7uxBJEECQE", "1li3Bg7Jxc9pUnZm", "vhidwCkZwqjYLfTi"]}, {"partyID": "CO1NDBvQvRPnAz4V", "userIDs": ["zW0CpoBCbyJsF5Ij", "F1c0W338HS6CBgVR", "yihYNZ84CVhziXV8"]}], "teamID": "HwSmvcvcDKF19yVR", "userIDs": ["afCjOuSYht83AdvB", "aagTiRJ8daGTVX3B", "b7jlz5IfHgKjI9mw"]}, {"parties": [{"partyID": "JSrN8jkIykR2zbaI", "userIDs": ["6PD7fEscShnGUGUt", "V9GJ279GDbLNwjm3", "FK0nnX2poMfZ1hDH"]}, {"partyID": "tbh4HtMlFgvh2Dp2", "userIDs": ["SoiIPp1yvfAHS0Vg", "Lu11A3HTovFi4tPA", "GfleyCA6jEtcqsnz"]}, {"partyID": "oVILjkwW61duF87a", "userIDs": ["Uyrdt4XSpWBAetsa", "nzqP8oxfrtbECD1C", "YPwaiBAxfYL8Avt7"]}], "teamID": "0ZUT2fSk3LL0calq", "userIDs": ["xEewuGS469k2hG0W", "Kt4sUmanYxM0UHZV", "NYzGMNIpWoSLkUrf"]}, {"parties": [{"partyID": "uf4U3WeYeA9t2ENK", "userIDs": ["KWrFtHIi1CMgKAOG", "5iDcCR5PbCvDLil8", "wj9cKM3Ar6MF35hC"]}, {"partyID": "ER4nGmWGgTJfHlJl", "userIDs": ["4tHGa4XfZcd9CVnG", "qMX9FieeEssWEUl0", "7bhwntCVqiYOJf5K"]}, {"partyID": "wMZQjzvjSozv6CTR", "userIDs": ["Dl0zp9CzHFwinkBN", "i4gvqgl6TZ9TGVPm", "v34h6T7EsufmfxKY"]}], "teamID": "B4LM6H6QXmpZ9X3f", "userIDs": ["USR1l9xLPBsmAUrD", "9L1IiD6MlcEPhMDF", "zjHZ3sIhzOx2CXKl"]}], "ticketIDs": ["vIomU3pIxM9n8D2e", "LMe3lt9qfx2UDcgV", "E7L9FK6e0MrPc4vt"], "tieTeamsSessionLifetime": true, "type": "P2P", "version": 21}' \
    > test.out 2>&1
eval_tap $? 57 'PatchUpdateGameSession' test.out

#- 58 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QOsDa4bkcgepqtxj' \
    --body '{"backfillTicketID": "brztee7QLTGAak7K"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateGameSessionBackfillTicketID' test.out

#- 59 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aol01DK97D2xnik4' \
    > test.out 2>&1
eval_tap $? 59 'GameSessionGenerateCode' test.out

#- 60 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2miteR5eQAe1rzmm' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokeGameSessionCode' test.out

#- 61 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gqBPRmd6mO4oI8KD' \
    --body '{"metadata": {"qebm83raNBJ5y7ax": "EkvI4oxZEDxGiBnN", "bn0zaf7CaOSlHXrU": "SA6sMJzA5mtqISQ8", "3TTbtefXWznDe4LQ": "dXfFBii2RAMEX5RM"}, "platformID": "jBFVZGYzQqV8d9mD", "userID": "dUIoiIJFNxuNOmUS"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionInvite' test.out

#- 62 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ww18T1IxVWCxdvPL' \
    --body '{"password": "9e4P01vxP8xj1LyE"}' \
    > test.out 2>&1
eval_tap $? 62 'JoinGameSession' test.out

#- 63 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'irURERnEMzpImW6s' \
    --body '{"leaderID": "jAHyCK5tNanGBrkz"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromoteGameSessionLeader' test.out

#- 64 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Uvck3xTtmOFMebS4' \
    > test.out 2>&1
eval_tap $? 64 'LeaveGameSession' test.out

#- 65 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'AdlNzwog2IhErkNh' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NcECWwchW6zL9Skb' \
    > test.out 2>&1
eval_tap $? 65 'PublicKickGameSessionMember' test.out

#- 66 PublicGetGameSessionPassword
./ng net.accelbyte.sdk.cli.Main session publicGetGameSessionPassword \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LlrNXnGanMazb8jv' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetGameSessionPassword' test.out

#- 67 PublicUpdateGameSessionPassword
./ng net.accelbyte.sdk.cli.Main session publicUpdateGameSessionPassword \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RWenURH48aJuALEc' \
    --body '{"newPassword": "SqcE15u6D31DjOsr"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicUpdateGameSessionPassword' test.out

#- 68 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 's3CUYATdqnQGbqiq' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionReject' test.out

#- 69 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OkNeATj7eGjodd7C' \
    > test.out 2>&1
eval_tap $? 69 'GetSessionServerSecret' test.out

#- 70 AppendTeamGameSession
eval_tap 0 70 'AppendTeamGameSession # SKIP deprecated' test.out

#- 71 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cJUrI6MAugK5kypN' \
    --userId 'rp2nFe9FmN86sK5L' \
    > test.out 2>&1
eval_tap $? 71 'PublicGameSessionCancel' test.out

#- 72 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Oq4ft5jGcMICPUYn"}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyJoinCode' test.out

#- 73 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fG6jl9U4jReteIMg' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetParty' test.out

#- 74 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zISomCsodJrhQW41' \
    --body '{"attributes": {"q2OspCZbt3Uta5I0": {}, "uGcL1koyHjCH5olY": {}, "LETRpABAmO2EGvJ4": {}}, "inactiveTimeout": 95, "inviteTimeout": 56, "joinability": "INVITE_ONLY", "maxPlayers": 52, "minPlayers": 91, "password": "hDUjhKPwbwcvQU5k", "type": "P2P", "version": 83}' \
    > test.out 2>&1
eval_tap $? 74 'PublicUpdateParty' test.out

#- 75 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '8bXGFmPAnOkDiJq4' \
    --body '{"attributes": {"xQye7HqnVK3YVeOW": {}, "s9mfVQh3jLBtn9px": {}, "pE7BYtzB0B4CxyQr": {}}, "inactiveTimeout": 96, "inviteTimeout": 32, "joinability": "INVITE_ONLY", "maxPlayers": 72, "minPlayers": 75, "password": "FvORxTi79DpSjb39", "type": "NONE", "version": 11}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPatchUpdateParty' test.out

#- 76 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kcR6c2E2r3vk3IfA' \
    > test.out 2>&1
eval_tap $? 76 'PublicGeneratePartyCode' test.out

#- 77 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KEbqcNXSGCCvNowN' \
    > test.out 2>&1
eval_tap $? 77 'PublicRevokePartyCode' test.out

#- 78 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mdpcJgF88ySNq4Mj' \
    --body '{"metadata": {"7mulP4tQ6R1OqKVO": "TniBgLsNhdgQ0JWZ", "jNRSzOTqcVNX3ahv": "xw9gwwhTnjN6wKZG", "W4y3f0R9s2kndhhZ": "hwAiLsZs4pmLDIQc"}, "platformID": "h4IjDq9aT3qZyI0r", "userID": "YsWucAkXsVJbXi7e"}' \
    > test.out 2>&1
eval_tap $? 78 'PublicPartyInvite' test.out

#- 79 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RZa7WwIc895ImqK6' \
    --body '{"leaderID": "tVsaUq3stUh5J5Z9"}' \
    > test.out 2>&1
eval_tap $? 79 'PublicPromotePartyLeader' test.out

#- 80 PublicGetPartyPassword
./ng net.accelbyte.sdk.cli.Main session publicGetPartyPassword \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GiBiSAylX5cS0IeH' \
    > test.out 2>&1
eval_tap $? 80 'PublicGetPartyPassword' test.out

#- 81 PublicUpdatePartyPassword
./ng net.accelbyte.sdk.cli.Main session publicUpdatePartyPassword \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pWCugmfOL0QQpxsu' \
    --body '{"newPassword": "D8PGqku59eFJrOXy"}' \
    > test.out 2>&1
eval_tap $? 81 'PublicUpdatePartyPassword' test.out

#- 82 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DYz9vMUOPG0iHDT8' \
    > test.out 2>&1
eval_tap $? 82 'PublicReadPartySessionStorage' test.out

#- 83 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QbF7gHPTPQbvLt2N' \
    --userId 'RqJGIKzLyH1y72L1' \
    --body '{"3Ornyx34luLdvtsT": {}, "KXMjiw6gYPvfn2Qt": {}, "9iyq3Nyk8ncu2Z3e": {}}' \
    > test.out 2>&1
eval_tap $? 83 'PublicUpdateInsertPartySessionStorage' test.out

#- 84 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DHH9WaVO4iKhDcJ7' \
    --userId 'TCcNIsQ3PuppUxDS' \
    --body '{"K8aOTGMudcxlCV4c": {}, "NbJGQ57lPdinpjS2": {}, "DRfGt9GlyZVQ4X67": {}}' \
    > test.out 2>&1
eval_tap $? 84 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 85 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tPZSTpPq3xjrElvv' \
    --body '{"password": "Dgw0ag7kSWE0Hiqm"}' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyJoin' test.out

#- 86 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '5IuLryiEXqvUWDjU' \
    > test.out 2>&1
eval_tap $? 86 'PublicPartyLeave' test.out

#- 87 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '1G0EVjVZw1ToLuPa' \
    > test.out 2>&1
eval_tap $? 87 'PublicPartyReject' test.out

#- 88 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kQN1MpOs1RVFrcg2' \
    --userId 'CXxepx78fvsyhE2B' \
    > test.out 2>&1
eval_tap $? 88 'PublicPartyCancel' test.out

#- 89 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KtyTDSIM7mkmvZ7C' \
    --userId 'msh4US8o4jfMANPp' \
    > test.out 2>&1
eval_tap $? 89 'PublicPartyKick' test.out

#- 90 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"mZDdMiCxmuCCVuFj": {}, "S1GC1d2b92B4vEgj": {}, "3HOmhcWm428XejRF": {}}, "configurationName": "94NIY9nMrBZo0lNU", "inactiveTimeout": 57, "inviteTimeout": 33, "joinability": "FRIENDS_OF_MEMBERS", "maxPlayers": 36, "members": [{"ID": "ShHD32vvL28FPwTi", "PlatformID": "XfLcxDC9Ynd02mEC", "PlatformUserID": "IQhfIhHtADUQ9zim"}, {"ID": "QTQT95pFJUAJsyAf", "PlatformID": "eKOufV4f15NohXu6", "PlatformUserID": "opxQGRt6PqlkL0di"}, {"ID": "RhLC10ih2EQfY3XC", "PlatformID": "v4hdOa6FdZhNMd1o", "PlatformUserID": "nFjGRbxtABPXDmgN"}], "minPlayers": 62, "password": "mFhdYLWzMuv3zkUY", "textChat": true, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 90 'PublicCreateParty' test.out

#- 91 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    > test.out 2>&1
eval_tap $? 91 'PublicGetRecentPlayer' test.out

#- 92 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 92 'PublicGetRecentTeamPlayer' test.out

#- 93 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BAZkwbYkBLyO6A0F' \
    --body '{"qfhnaB3YxKNdOTac": {}, "CcJfIfXshuLUk5Wd": {}, "pxjZx5noXPhPUTKb": {}}' \
    > test.out 2>&1
eval_tap $? 93 'PublicUpdateInsertSessionStorageLeader' test.out

#- 94 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'onoucNmzwOZOK56s' \
    --userId 'Dkci5rZ8iMlOuksQ' \
    --body '{"JCiRFiZWwJ7NrTb1": {}, "XTB9YQzUJ9XlYJ8B": {}, "zP6EUmUXGM5anIlo": {}}' \
    > test.out 2>&1
eval_tap $? 94 'PublicUpdateInsertSessionStorage' test.out

#- 95 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["yj9lhbvuQdW2jwKU", "ckc794ryY91lX8DD", "4MYXlrJ81lHvv9rq"]}' \
    > test.out 2>&1
eval_tap $? 95 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 96 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'PublicGetPlayerAttributes' test.out

#- 97 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "7PeiMH8z8dVej8N2", "data": {"yv6VTnOK7xAvM7tu": {}, "L81lsR7xxSVp3Gd2": {}, "TK0HzYviTgYmx82J": {}}, "platforms": [{"name": "VBRLPZ6Iz8tne5db", "userID": "guBF6Gsvvdl8jHz9"}, {"name": "x7XZIjU4IK9lOLaZ", "userID": "aMphKCqTq3EVheJj"}, {"name": "oEEXBLIxGnNuhoJM", "userID": "3WWPvvCiCf33ViEd"}], "roles": ["qQpoGkUWNizk5UcP", "AGv6c1ESC6hZYTYZ", "bzf5aANNNs5kgSZZ"], "simultaneousPlatform": "NUHbIT9szApmWJO5"}' \
    > test.out 2>&1
eval_tap $? 97 'PublicStorePlayerAttributes' test.out

#- 98 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'PublicDeletePlayerAttributes' test.out

#- 99 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'vzzXZj08a6K1XRVf' \
    --orderBy 'riSpPFnZBJZkDnEi' \
    --status 'yfa2LrnpZxNnLRH3' \
    > test.out 2>&1
eval_tap $? 99 'PublicQueryMyGameSessions' test.out

#- 100 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '6bqS2oFY76PU1Azi' \
    --orderBy 'BOHEAj1cT3u6Zc2F' \
    --status 'brTFznTgDIwZIRWf' \
    > test.out 2>&1
eval_tap $? 100 'PublicQueryMyParties' test.out

#- 101 PublicReplaceSessionStorageLeaderV2
./ng net.accelbyte.sdk.cli.Main session publicReplaceSessionStorageLeaderV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6T3by2kYSCdnFKLc' \
    --body '{"0xcTjqjdcEfU61OJ": {}, "YMnW49rWynp1ck1v": {}, "T90C6o86cSRL9cgb": {}}' \
    > test.out 2>&1
eval_tap $? 101 'PublicReplaceSessionStorageLeaderV2' test.out

#- 102 PublicUpdateInsertSessionStorageLeaderV2
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeaderV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Umulhe98oaFKlQic' \
    --body '{"drxVhrtwSd9QWVMY": {}, "z7TU1TsxsChSclSk": {}, "b5aBi9K9zyv6gFZX": {}}' \
    > test.out 2>&1
eval_tap $? 102 'PublicUpdateInsertSessionStorageLeaderV2' test.out

#- 103 PublicReplaceSessionStorageUserV2
./ng net.accelbyte.sdk.cli.Main session publicReplaceSessionStorageUserV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'I5nXJ7hLi6HweweR' \
    --userId 'myo91dIn7QqXBDXJ' \
    --body '{"crqKmXDwoEV6tCdr": {}, "xw1KOPhuvHuYrGWD": {}, "K41uMOC0mRvSoaGk": {}}' \
    > test.out 2>&1
eval_tap $? 103 'PublicReplaceSessionStorageUserV2' test.out

#- 104 PublicUpdateInsertSessionStorageUserV2
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageUserV2 \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4ktF5wnJDg9Q3WXi' \
    --userId 'ydCOInVolsr6CHmj' \
    --body '{"763vLwtYEJTSiXjc": {}, "Y5ZPkv90lyKSTWLx": {}, "SFZ0LpupEi5DbkVs": {}}' \
    > test.out 2>&1
eval_tap $? 104 'PublicUpdateInsertSessionStorageUserV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE