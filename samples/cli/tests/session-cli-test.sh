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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 96, "PSNSupportedPlatforms": ["fvnnSuB0y5WUlrMd", "I4sNveabntBSxTeI", "v53HGCiljvjKoyD6"], "SessionTitle": "SCwGrncqmLtjQHAf", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "67FXGk2s9Q0mPVo3", "XboxServiceConfigID": "twu0MesTCf9x4rt6", "XboxSessionTemplateName": "9lna7qxNeIxPz6Mb", "XboxTitleID": "wL6IY69z1UaLqYSY", "localizedSessionName": {"WytLPziZMdjxcBZu": {}, "fQxGiHPllG4cYEzf": {}, "TD1ZBm3MqHcUmLZZ": {}}}, "PSNBaseUrl": "bSqb8RwNmn9HrNQy", "amsClaimTimeoutMinutes": 24, "appName": "uZAAiE0mit9RGCCH", "asyncProcessDSRequest": {"async": false, "timeout": 52}, "attributes": {"qwGyzzWi9gwQYv7t": {}, "1o7TTr1DmrhZv15T": {}, "7quIOvBMcaYmvCkG": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "cHyCUEXlAvxJMdal", "customURLGRPC": "wSyliWMNW5NyLu0M", "deployment": "3VHh2EI8JlDbPWbQ", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "dlgdWyOtXi3choQr", "enableSecret": false, "fallbackClaimKeys": ["68cmDc3fxU8MyKrQ", "pM4hkkK6KKXNB3Gv", "0IqmF51TkhjYnaq6"], "grpcSessionConfig": {"appName": "foWvXa3bMrXsDr6k", "customURL": "ILsSSyDdmykmoPYg", "functionFlag": 4}, "immutableStorage": false, "inactiveTimeout": 80, "inviteTimeout": 18, "joinability": "FRIENDS_OF_FRIENDS", "leaderElectionGracePeriod": 29, "manualRejoin": true, "maxActiveSessions": 76, "maxPlayers": 79, "minPlayers": 30, "name": "Nqq98SjTvhZNkSQ7", "persistent": true, "preferredClaimKeys": ["X3ateEKDpADz1x3p", "oD3Qgb3boLQQ1MzH", "7Qm8bwbmXgdAPh1E"], "requestedRegions": ["ThG96gAFKK2WDgCc", "xvONZm3EeERmDnye", "FoF7VSZ6pf3vneSD"], "textChat": false, "textChatMode": "GAME", "tieTeamsSessionLifetime": false, "ttlHours": 14, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --name 'SQUhAEtrmjqU6YE3' \
    --offset '31' \
    --order 'sYSiZqan0nSBJroa' \
    --orderBy 'v91GXlvPG6bFYReV' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'HQipcCx9Zw5D2L7v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'IYhGGSyEW4ZJJ42d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "UPDATE_JOINABLE_USER_TYPE", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 7, "PSNSupportedPlatforms": ["go5QB65lSAiYnNjk", "fZrQvGgbLdLsFzHk", "BMr1yrOMlNFSrUEi"], "SessionTitle": "rnjX9fDmIbeZxzfT", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "G26yUZNmTBcvrbYC", "XboxServiceConfigID": "wZtxFHyPLtI8ilby", "XboxSessionTemplateName": "DPUIj88cekdqCt81", "XboxTitleID": "P1ktfIovmv9gsR5c", "localizedSessionName": {"JcHm3SZLxoRDFuuu": {}, "ySj29a9LJE8HoRS1": {}, "X2PFAAMwzHPxB1Us": {}}}, "PSNBaseUrl": "kYs4Yw20DOqOBSC2", "amsClaimTimeoutMinutes": 60, "appName": "10sG6vxkfUcmqRRb", "asyncProcessDSRequest": {"async": false, "timeout": 96}, "attributes": {"eJ5i0EeDxOgBnhhq": {}, "ElIaDml48wdNFLTm": {}, "5T50x9WT0GfH2rtO": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "4EXsXzOXQAk4mqrx", "customURLGRPC": "zTtuLl4XlbGL8QOx", "deployment": "tjzm8y2wNhmwoYZy", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "KLCa3xreNDUWehwH", "enableSecret": true, "fallbackClaimKeys": ["LRc6m8heKnWhzfe2", "NubeoKFeIaFQCYoD", "PICpnduEEQlULdJz"], "grpcSessionConfig": {"appName": "4mnRBkMNxvvKgAT8", "customURL": "mJrYq6hRkloqxM3g", "functionFlag": 31}, "immutableStorage": true, "inactiveTimeout": 46, "inviteTimeout": 59, "joinability": "FRIENDS_OF_MEMBERS", "leaderElectionGracePeriod": 4, "manualRejoin": false, "maxActiveSessions": 79, "maxPlayers": 18, "minPlayers": 51, "name": "yEW6GLbc0NaKDUL3", "persistent": true, "preferredClaimKeys": ["JEN2VHzih3bit0VW", "n3CO39PXDNxtXgeO", "3FgkXhjDzaQY3snn"], "requestedRegions": ["2ZkP7cFdP43e5dC9", "XIBudfZgrbHDIDm4", "hMzF4TxodenSrUTv"], "textChat": false, "textChatMode": "NONE", "tieTeamsSessionLifetime": false, "ttlHours": 2, "type": "DS"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'OudOfjnCuHZ3c46I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'jGa23YvYmmDg7VYP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIuvUYTZBRujIUE1' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'Tq5jyAZvkRCMNFIu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "rjh2imdb4rbkXj0Z"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'wsVC0gL97ZVJSPqJ' \
    --dsPodName 'iwv1qlYB1RSKs6gQ' \
    --fromTime 'xC3Gb7S0o4zGYY7K' \
    --gameMode 'QI1AeFgPqaOkvo1a' \
    --isPersistent 'olB4lkKB4EYOkQ1j' \
    --isSoftDeleted 'MD3cym8xIfkOVW2g' \
    --joinability 'FRIENDS_OF_LEADER' \
    --limit '58' \
    --matchPool 'REOLx0KOww3HICQL' \
    --memberID 'fl7MUBG7qtPu64yA' \
    --offset '40' \
    --order 'XCs5SPBbRPZTF6oQ' \
    --orderBy 'AXVG7tnsZg5QgXjv' \
    --sessionID 'yGJPN4eXbJE5Vs2G' \
    --status 'AVAILABLE' \
    --statusV2 'AVAILABLE' \
    --toTime 'yomQoIXimBJehyxl' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"NsjUgxBkF6wFPoJe": {}, "QediogEhhM2rIizG": {}, "dKvOPdq5xrgxSmy1": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["DN9LFkYW5DQyj4bj", "5Ro2ogaKt2ujQSa3", "Zdb65UXmy0Zp6iIa"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TIKUkmkk9QM0NBMA' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RxpzwLR2AK6eXUGP' \
    --body '{"createdRegion": "Jsw1fiP80G9Pclxc", "deployment": "ft2ulIJzPyrVEiOG", "description": "4UcqsuGKHhMRWLVd", "ip": "3DlhLuIpomM8sm1M", "port": 16, "region": "UccE536ugBp3HBve", "serverId": "pnDCjgyJlXe36mgW", "source": "jLfFmteue9nzJ6fH", "status": "24T805tVg8JqU0jZ"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'pjvsugAOS7u8RiWy' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'erCSa8SRgwsAj1ik' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '1jglaDXTvKCWwNTA' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hd2wrS0uPdjhdinp' \
    --statusType 'ng5BLy8wbhMssAHj' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '32' \
    --order 'hiqjRJOqB5F93zFQ' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'bJndUDpdONneAczb' \
    --fromTime 'BdHb2slt71B1SmZp' \
    --isSoftDeleted '2JZp50CnPb71ORYc' \
    --joinability 'FRIENDS_OF_FRIENDS' \
    --key 'jTXAQN0qdskdQV0T' \
    --leaderID 'qI8EFnmDbxIxi4YK' \
    --limit '23' \
    --memberID 'Ss6g4iY9u02aCNYI' \
    --memberStatus 'DISCONNECTED' \
    --offset '9' \
    --order 'atuUjjt9lIMGql5E' \
    --orderBy 'lEa9EIIlGcHB3CfR' \
    --partyID '3ncDlwi3v3MFFJ1K' \
    --toTime 'esKoELCpobBEG8X6' \
    --value '45xpdXpai0rYaT5h' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["OPjaf3H0tYighU0V", "UfcYHJbBfAKSiPW3", "VgsZXiR1DJ7HVWqM"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kNSawQUWDFJvJBWi' \
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
    --body '{"psn": {"clientId": "c7UkBeIXuqDuAXI6", "clientSecret": "6bQ71w0deoV9Lx5R", "scope": "DA1l2XcrciYNEzvS"}}' \
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
    --limit '30' \
    --userId 'hSgORcz5S5BvmgBL' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --userId 'vuKNuy0ytZQ7M6Nz' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'y1adnSKOLFKx1dX4' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LuWJu3pDMUAeeZ97' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SBROPYuG6XqP6oo7' \
    --userId 'G73zdxTgOfnwIdlN' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'a29fDLh741IslKHz' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'GlLKWUtDQs61OQAo' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'xyyQpRWCiiPDGQhN' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "PEwiJCf2XJVrlzqQ", "attributes": {"ls1ozhLVA3kE8jKv": {}, "gatOEBM70TdlNBJY": {}, "Ompu1VCarzBsV6xn": {}}, "autoJoin": false, "backfillTicketID": "rzzjrcaug6CWVG8S", "clientVersion": "WP3glU6muswVJnNn", "configurationName": "N7kAa7j0riFc5HTH", "customURLGRPC": "QIoVsGo7dwV9DBqF", "deployment": "KHQkETJyTlUrwDTn", "dsSource": "oujQD4IEiH9Z5qXn", "fallbackClaimKeys": ["3aoRtlqOECohViHA", "5CzgFSy8X1A3PrIf", "apq5AAeMe4L3mDWO"], "inactiveTimeout": 90, "inviteTimeout": 56, "joinability": "FRIENDS_OF_LEADER", "matchPool": "VXTIIJM9XsYIIZxi", "maxPlayers": 40, "minPlayers": 81, "preferredClaimKeys": ["371W9G4AvQkqsGnm", "yo5JJTUVmb8GEXFT", "lEMEsFzYqwgK1Np5"], "requestedRegions": ["nodqpLm7FhJBNXzA", "FdO0Khqf6kiTdSGv", "2LFjAKY7CbgsWqFW"], "serverName": "ZX7kPBom8F9GLLTG", "storage": {"leader": {"8phc3n4iLoIllKlp": {}, "O2pqiXJF3WGRaoQo": {}, "mSJC4DdrKF7SUQPL": {}}}, "teams": [{"parties": [{"partyID": "G59e0k5ZtX6wK7Pp", "userIDs": ["UlcIW32iK7MGt1ix", "Y5rA1WoVeJIePF8Z", "rQzP4zvtdxdbZUpd"]}, {"partyID": "6FJtHJ1pyVwyKQLY", "userIDs": ["6FEO65Rb3z7CYLM8", "IlsHqffnrfsGlfPa", "ZKBwa3Ddb60ufPpz"]}, {"partyID": "wj1QGIFmlVf4jvap", "userIDs": ["seE9LN9bvhOrHflI", "Od6X3viLvtEk4mTI", "pUA9gxo8SV38nEho"]}], "teamID": "XmM2W7l6jHMA2rG3", "userIDs": ["nakopAywelu01nry", "EJ0NqoTow0qiOiC4", "j0iktm0ZPLkLOsp0"]}, {"parties": [{"partyID": "LZ5njN86Hl8kUXzt", "userIDs": ["6bSc6bWvgpVyW9dD", "1kOmvrAejcq2LgkQ", "uaS7RBx3vim02jBO"]}, {"partyID": "xrZDyvpcLYOWA8Nj", "userIDs": ["xOnaEok4nOOCzfsf", "lhjbngJOUn18G5Ml", "fDTk8aG40NlncceI"]}, {"partyID": "ZSwgAIkgzh4pTU0A", "userIDs": ["m4DZhl0bQxFJ3sWC", "qQpQ2FbKPFMycMSQ", "4qfAacR0LgB5BUXv"]}], "teamID": "jcu2s6w3VifnKqmT", "userIDs": ["SoGH1XEfY6QAYn6W", "Q5UBEU1QAOHfZiGh", "xOdcuDXSxSc3aZPV"]}, {"parties": [{"partyID": "87pna08gxefTYKhu", "userIDs": ["xaEc7M4P7UckSC6e", "PeN8i4GrFES9z7xu", "eHpATHccee9GXhKc"]}, {"partyID": "jmSEwdrkEnnqKzFs", "userIDs": ["LfYalUlfwEQKjU7e", "HGebSVu0LQ40kepE", "aC4dfiOMZfEhHr39"]}, {"partyID": "pysFO3Zvc1BZG99L", "userIDs": ["yvfvHEsJKQQewVLM", "UoAnaRcYp7FUjfIG", "affoflEIByYqeKN0"]}], "teamID": "meGelYF5wWaDhukU", "userIDs": ["4khGG4vZFTYnPkmS", "u4PWam1jxR7SETWj", "teoc8fgvZDDhoO05"]}], "textChat": false, "textChatMode": "NONE", "ticketIDs": ["KqymxLD1Lcvw6T6m", "ZEiwxxElpMYSWIeV", "zm7z9noowmlTIKVo"], "tieTeamsSessionLifetime": true, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"i0RY2VN4ZONJREdU": {}, "Q3z9F1BxNNgnke4a": {}, "kncw7wu9TmXfJWBP": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "rx9Ns8eLzYEvwSWT"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'aLQjctvrK2jhsYpK' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PlXn77AtYoFzLAAT' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PY8P8P3cfoivvQxe' \
    --body '{"attributes": {"vecWw7Rry0KK5rgA": {}, "GO0dW8rX2MVUGKSZ": {}, "4GcLkt4pK32sJxlZ": {}}, "backfillTicketID": "cCTpTdRtCHvuk6B6", "clientVersion": "XTmSLyn50sigBVZx", "deployment": "iKdV57GvRyd9UuL0", "fallbackClaimKeys": ["2Le8HSCslsDd4M1F", "5qRIblS7Nz81GRaz", "PAANjfBoldFOyqA2"], "inactiveTimeout": 4, "inviteTimeout": 25, "joinability": "FRIENDS_OF_FRIENDS", "matchPool": "51T107XIZRZ7tZdI", "maxPlayers": 37, "minPlayers": 3, "preferredClaimKeys": ["0xf4czdt7zqmSKxO", "EQlVcx6GqsBq8vdh", "WVnuYLgpZehK0G2n"], "requestedRegions": ["myuViB9kRTcSQdTn", "NYGeAfYFG3wSkHKu", "fBdS3ZOokZB4cXnA"], "teams": [{"parties": [{"partyID": "XyuGz6LlxHv8Swya", "userIDs": ["gYvDJ3w3UNgIGj2j", "ZtEYT8sIPSE1XXPz", "ySa0sZoFS6xCOWMp"]}, {"partyID": "yh9pMsQgb64ELbzD", "userIDs": ["Mwyo4nIRysQdbufX", "jYnSoIFeouC2m38k", "XrDZWlGVE9sJ4NpU"]}, {"partyID": "tKp6M9I6nEwnZhsj", "userIDs": ["wJeGwaPSDMZz95OY", "KiqaZD63xe5rruJV", "fLGea0ZtlzUcuHAX"]}], "teamID": "z0UV31MfuGaXsAuG", "userIDs": ["sZaSHevO0TQNEI3k", "fabxJWWSI1ECUo1N", "PpeFhUztXDgB7n4C"]}, {"parties": [{"partyID": "97uAPP8PATLpUpxe", "userIDs": ["JlsBJT6Hh3OMjAjq", "2mK8lbSEEelxnb5Q", "xWG2HFnZlA6HKWW4"]}, {"partyID": "fI1IQcoBQELcNlZk", "userIDs": ["qTZrKgXNwvm4e5GX", "6H742OixhtAoKiVm", "6URT95XhnUcvWB28"]}, {"partyID": "MpusuhhDJ5slzgiW", "userIDs": ["ZEtyd56LfxnbY97j", "jYgXchCbkXX26uEd", "CfQaMAQuTKfC0I2k"]}], "teamID": "NjCMDtDMrentgn3D", "userIDs": ["hqciwIeShF9RKb9v", "vxuJlhXbWhbwPwTo", "C6knjVwVnzaqSfJi"]}, {"parties": [{"partyID": "QFC2gXoda0kg16yU", "userIDs": ["SpSOAjHJWwfCjYwW", "kLob9gKLqs2nEZhp", "ByfHZinxNfgPAwkM"]}, {"partyID": "BsznlBUqnLT4AbGp", "userIDs": ["tKaWNvPbpg7yrRvX", "fZ6rvgvEY3Hht1Sw", "qTsKKKo37NHDOQe9"]}, {"partyID": "1Ps3ztUIV0dS6hIH", "userIDs": ["9c4VfkyrwpuXxbaE", "RbfgPmi0eHkt1mr9", "EOIFg0dnWIYN2NVL"]}], "teamID": "70Iw157g00jr9b8M", "userIDs": ["uYmmeKTmBNvGYxEQ", "df3ewoGGoY7xmFNA", "mjDDCvs78mcMdiS7"]}], "ticketIDs": ["6YApGJ9ufwLYkqIg", "LuZS6hsQryiEtOAb", "peUNf26UqkCfgCUY"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 28}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'svjO4lj8m3XEwP2b' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4gd3xOeii8Jnmsse' \
    --body '{"attributes": {"p2xD2NY0kABeGs9y": {}, "xahld1pO0Gyf5PO3": {}, "COyMvczgEpzZ3Fbt": {}}, "backfillTicketID": "xfhcRC7IVYa6iZ5u", "clientVersion": "FRYNn3SHiWxF0Ybu", "deployment": "U5ar5qTLWUCy0Afg", "fallbackClaimKeys": ["c050XIZRW491e94m", "QjVOOBnIWhunElqZ", "Uodp3IhtCSHy1ei1"], "inactiveTimeout": 10, "inviteTimeout": 26, "joinability": "INVITE_ONLY", "matchPool": "5x3B4t7WQnp8jXZe", "maxPlayers": 7, "minPlayers": 24, "preferredClaimKeys": ["gt5cyNe27HLtwtVO", "axgP6Jbct8puMybY", "GxD9IPmmsLmu3kaP"], "requestedRegions": ["j0O4zd8Tb7cUNGPT", "BxiFFCrn7djjs69F", "TFVGUVhvKhJCmeis"], "teams": [{"parties": [{"partyID": "ql14mUHVbMPimNhc", "userIDs": ["ZsU3VAdMDcb4qlki", "FAamqvZI2KwjqPBi", "WXade41s3rH34mB2"]}, {"partyID": "yPlRpWjmHZAAvKTH", "userIDs": ["8MuqIg0CzkguwuJC", "W7EEFB67AODbi9Bz", "upBsFpYc77GtRUcC"]}, {"partyID": "FeY5g4XgBsbfzqxB", "userIDs": ["PNe8ae1Il4aAtEbu", "4IjGdqthRxTjQ7gk", "ZEY8rG0q0Q2Qd2Jz"]}], "teamID": "RbkF2I03dIjvBbA6", "userIDs": ["bfbYaJCJjfk2TUvn", "95FhO7VW3mbDVMDu", "87t0ldWf7iSGIiKF"]}, {"parties": [{"partyID": "tWtn4Yr2svKM6pqL", "userIDs": ["GZ0TBujELAUK6mQ5", "iZgbwwm5iGzXtckn", "rgidKupvXO6aj4hC"]}, {"partyID": "mTC34jxW4pIDwdqX", "userIDs": ["pmRmut9H9XyWI8bp", "8fQxRuX91uYmtrHJ", "bEGTUj7YjERL1rEQ"]}, {"partyID": "G02zccA8wvLsWUNd", "userIDs": ["6lPKvqDejvqklTSv", "DwuOrP9lzpiX0VuF", "pZum7izxe7NPzjOa"]}], "teamID": "8E7wY76PxLv9HBEU", "userIDs": ["e89AwEw1HO4FnKtx", "4XLKAmlDr19uJ3nq", "6VerzVCcI8y3Cz0Y"]}, {"parties": [{"partyID": "qCKUh5RD9vNAp4ji", "userIDs": ["nFpnQ5xF9wwbvMZy", "eDeRnVfPUa6xVVBc", "q3wZpFIYeAg79HcL"]}, {"partyID": "JXJ7mpVI6eTYAjdP", "userIDs": ["lCiQQC35cj4KyOVg", "vnWbfRJtsB7cUQZ2", "QUAxJrINPXppPNO3"]}, {"partyID": "AfmXcgwC3IN6tvKg", "userIDs": ["LB9QmJIOq9dP5szG", "71utjsQ4CrRb9gUC", "eVz7fWbZIdhevfZv"]}], "teamID": "yV7AcodcZwKjYDdm", "userIDs": ["JOlzwm9Su4FnS98Q", "qftSjq7sn8yreciP", "LfkVyyJsbGpO6Jge"]}], "ticketIDs": ["hDJxEN7JlZc8LMq1", "o2jZWu4yA3r0u4q1", "bTHXIjfJKyFlM0u1"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 41}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wntCVqiYOJf5KwMZ' \
    --body '{"backfillTicketID": "QjzvjSozv6CTRDl0"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zp9CzHFwinkBNi4g' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vqgl6TZ9TGVPmv34' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'h6T7EsufmfxKYB4L' \
    --body '{"metadata": {"M6H6QXmpZ9X3fUSR": "1l9xLPBsmAUrD9L1", "IiD6MlcEPhMDFzjH": "Z3sIhzOx2CXKlvIo", "mU3pIxM9n8D2eLMe": "3lt9qfx2UDcgVE7L"}, "platformID": "9FK6e0MrPc4vtxk9", "userID": "hVKlG56HlzGr7Xjd"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yRJunZPkp6ccIBnW' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yPw8mj7gyQ7XdIsz' \
    --body '{"leaderID": "GRj46COPipH1MWVT"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HG0qHJCWEfOJpZm9' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'yEYWNGMy2pgSGSUO' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'K68eqGJtWf1Ybgg8' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rdwY9bmrvHmO07KN' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qX9LM2IwEsdOGBXB' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wnzDX8v3xgC1Ge9P' \
    --userId 'dbTTAJ2Gp1r0sVZ6' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LJAOddIL2l3hPjND"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Kv2LWfXqjr8fS79E' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'n3wYowBdkaZ3y6i3' \
    --body '{"attributes": {"8XQjLDRqkpiFK5Bt": {}, "iQ272Uo9UBJWodpd": {}, "wsX1jorcyR0x3YiH": {}}, "inactiveTimeout": 65, "inviteTimeout": 5, "joinability": "FRIENDS_OF_FRIENDS", "maxPlayers": 70, "minPlayers": 93, "type": "NONE", "version": 67}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'TtmOFMebS4AdlNzw' \
    --body '{"attributes": {"og2IhErkNhNcECWw": {}, "chW6zL9SkbLlrNXn": {}, "GanMazb8jvRWenUR": {}}, "inactiveTimeout": 69, "inviteTimeout": 16, "joinability": "OPEN", "maxPlayers": 0, "minPlayers": 24, "type": "P2P", "version": 10}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uALEcSqcE15u6D31' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DjOsrs3CUYATdqnQ' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GbqiqOkNeATj7eGj' \
    --body '{"metadata": {"odd7CcJUrI6MAugK": "5kypNrp2nFe9FmN8", "6sK5LOq4ft5jGcMI": "CPUYnfG6jl9U4jRe", "teIMgzISomCsodJr": "hQW41q2OspCZbt3U"}, "platformID": "ta5I0uGcL1koyHjC", "userID": "H5olYLETRpABAmO2"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'EGvJ4UMS93yOxNIn' \
    --body '{"leaderID": "DByhnoluO6ti0QP2"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ssiJ66OzOj84O6tg' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ohjtC7bzjPpucddX' \
    --userId 'J5zifF8y959anrNS' \
    --body '{"leywHbHig6IKWVZ7": {}, "7KeRWdECaFGzfZ2h": {}, "xcJ2Fnemn7M23SzU": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 79 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'o4hNBDh9ZFP1OW0n' \
    > test.out 2>&1
eval_tap $? 79 'PublicPartyJoin' test.out

#- 80 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XOErQPS4VsRoYIK6' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyLeave' test.out

#- 81 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '9yg9ADCGiXaLs2xj' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyReject' test.out

#- 82 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'HkinOD975nARHCmh' \
    --userId 'NHSXuqIHsxvaUoXD' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyCancel' test.out

#- 83 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mwWsukxncuD3QxCX' \
    --userId 'Md00YBWCaVVmM45m' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyKick' test.out

#- 84 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"fIZsWhkS476dGGJw": {}, "J00UH197MJ6zU7JL": {}, "MQyMWzYQCAaPJgox": {}}, "configurationName": "GJoJaSzUtY4ZD0Xt", "inactiveTimeout": 3, "inviteTimeout": 95, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 96, "members": [{"ID": "3stUh5J5Z9GiBiSA", "PlatformID": "ylX5cS0IeHpWCugm", "PlatformUserID": "fOL0QQpxsuD8PGqk"}, {"ID": "u59eFJrOXyDYz9vM", "PlatformID": "UOPG0iHDT8QbF7gH", "PlatformUserID": "PTPQbvLt2NRqJGIK"}, {"ID": "zLyH1y72L13Ornyx", "PlatformID": "34luLdvtsTKXMjiw", "PlatformUserID": "6gYPvfn2Qt9iyq3N"}], "minPlayers": 50, "textChat": false, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateParty' test.out

#- 85 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 85 'PublicGetRecentPlayer' test.out

#- 86 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentTeamPlayer' test.out

#- 87 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'P1LKiFQoLDvumfqr' \
    --body '{"gSfnx2h61X9dN1MG": {}, "RXBJ6mVV7JS9qjNL": {}, "wvI8JdiY3RRiLilm": {}}' \
    > test.out 2>&1
eval_tap $? 87 'PublicUpdateInsertSessionStorageLeader' test.out

#- 88 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OGF6dLLIeIVIjMcd' \
    --userId 'lbdRXTGIrdNL5gJP' \
    --body '{"qTAjgqaTHf1ANTJ9": {}, "Yk997XkGOdC6ItxD": {}, "T8p4n4XCFkD1AJLC": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorage' test.out

#- 89 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["wszbZxuHSgDOK8bj", "oF7bL2635KbtZTGJ", "pqgl2IzNXGTuQPID"]}' \
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
    --body '{"crossplayEnabled": false, "currentPlatform": "kmvZ7Cmsh4US8o4j", "data": {"fMANPpmZDdMiCxmu": {}, "CCVuFjS1GC1d2b92": {}, "B4vEgj3HOmhcWm42": {}}, "platforms": [{"name": "8XejRF94NIY9nMrB", "userID": "Zo0lNUBDShHD32vv"}, {"name": "L28FPwTiXfLcxDC9", "userID": "Ynd02mECIQhfIhHt"}, {"name": "ADUQ9zimQTQT95pF", "userID": "JUAJsyAfeKOufV4f"}], "roles": ["15NohXu6opxQGRt6", "PqlkL0diRhLC10ih", "2EQfY3XCv4hdOa6F"], "simultaneousPlatform": "dZhNMd1onFjGRbxt"}' \
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
    --order 'ABPXDmgNEJBhgGq5' \
    --orderBy 'GIDhNC66szbCCf73' \
    --status 'IFbRkPSSITz4TjCr' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryMyGameSessions' test.out

#- 94 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'JHXGXku2YVuOzhxH' \
    --orderBy 'mnrrV9ZGWrZ05sxe' \
    --status '6A6RpmKDebNkylby' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE