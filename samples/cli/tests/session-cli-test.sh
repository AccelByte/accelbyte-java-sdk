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
echo "1..95"

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
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["KICK", "UPDATE_INVITABLE_USER_TYPE", "PROMOTE_TO_LEADER"], "PSNServiceLabel": 96, "PSNSupportedPlatforms": ["fvnnSuB0y5WUlrMd", "I4sNveabntBSxTeI", "v53HGCiljvjKoyD6"], "SessionTitle": "SCwGrncqmLtjQHAf", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "67FXGk2s9Q0mPVo3", "XboxServiceConfigID": "twu0MesTCf9x4rt6", "XboxSessionTemplateName": "9lna7qxNeIxPz6Mb", "XboxTitleID": "wL6IY69z1UaLqYSY", "localizedSessionName": {"WytLPziZMdjxcBZu": {}, "fQxGiHPllG4cYEzf": {}, "TD1ZBm3MqHcUmLZZ": {}}}, "PSNBaseUrl": "bSqb8RwNmn9HrNQy", "amsClaimTimeoutMinutes": 24, "appName": "uZAAiE0mit9RGCCH", "asyncProcessDSRequest": {"async": false, "timeout": 52}, "attributes": {"qwGyzzWi9gwQYv7t": {}, "1o7TTr1DmrhZv15T": {}, "7quIOvBMcaYmvCkG": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "cHyCUEXlAvxJMdal", "customURLGRPC": "wSyliWMNW5NyLu0M", "deployment": "3VHh2EI8JlDbPWbQ", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": false, "dsSource": "dlgdWyOtXi3choQr", "enableSecret": false, "fallbackClaimKeys": ["68cmDc3fxU8MyKrQ", "pM4hkkK6KKXNB3Gv", "0IqmF51TkhjYnaq6"], "grpcSessionConfig": {"appName": "foWvXa3bMrXsDr6k", "customURL": "ILsSSyDdmykmoPYg", "functionFlag": 4}, "immutableStorage": false, "inactiveTimeout": 80, "inviteTimeout": 18, "joinability": "FRIENDS_OF_FRIENDS", "leaderElectionGracePeriod": 29, "manualRejoin": true, "maxActiveSessions": 76, "maxPlayers": 79, "minPlayers": 30, "name": "Nqq98SjTvhZNkSQ7", "partyCodeGeneratorString": "0D0H6BXksUC9b6i5", "partyCodeLength": 23, "persistent": true, "preferredClaimKeys": ["ZC9xv32e8c5csSov", "oqsZNBdte9NDUPVJ", "f6c2Z0QZxfgPubTD"], "requestedRegions": ["IHrvqAThuwjRHpKK", "TlmVr9XuoJbRFQSK", "VPHbn4Xxtu7LQREN"], "textChat": false, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "ttlHours": 35, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --name 'ztx1WsYSiZqan0nS' \
    --offset '57' \
    --order 'I39YBHqaTHeKtW18' \
    --orderBy 'iGeUlc9d9sogWa24' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'CKNS0GqVvUfHQvsH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'XNUNe4mhgo5QB65l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNDisableSystemUIMenu": ["PROMOTE_TO_LEADER", "UPDATE_JOINABLE_USER_TYPE", "UPDATE_JOINABLE_USER_TYPE"], "PSNServiceLabel": 17, "PSNSupportedPlatforms": ["NApflxqMrj3oZk03", "QXcKMDYDDxHSZjtq", "XyJ58f7Gc26SaiGV"], "SessionTitle": "kydwYWQG26yUZNmT", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "cvrbYCwZtxFHyPLt", "XboxServiceConfigID": "I8ilbyDPUIj88cek", "XboxSessionTemplateName": "dqCt81P1ktfIovmv", "XboxTitleID": "9gsR5cJcHm3SZLxo", "localizedSessionName": {"RDFuuuySj29a9LJE": {}, "8HoRS1X2PFAAMwzH": {}, "PxB1UskYs4Yw20DO": {}}}, "PSNBaseUrl": "qOBSC2DKHRuPMMWH", "amsClaimTimeoutMinutes": 6, "appName": "Yb33T5UBJCjfcnLR", "asyncProcessDSRequest": {"async": false, "timeout": 14}, "attributes": {"xeCSz9WEi8KlloeH": {}, "0JT1yduat2vQR3bi": {}, "Bfsu4jmsRE2w1yEk": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "4mqrxzTtuLl4XlbG", "customURLGRPC": "L8QOxtjzm8y2wNhm", "deployment": "woYZyI4EFZKBcYrC", "disableCodeGeneration": true, "disableResendInvite": true, "dsManualSetReady": true, "dsSource": "reNDUWehwH3q31A8", "enableSecret": false, "fallbackClaimKeys": ["DJgas4b6z3LNUj7f", "dgLA84Z8YYk6QEgJ", "jBbEDoNf3n0hEoRC"], "grpcSessionConfig": {"appName": "Acf80zfFyabWAgIU", "customURL": "XiI07A68eaqC2J9j", "functionFlag": 51}, "immutableStorage": true, "inactiveTimeout": 100, "inviteTimeout": 53, "joinability": "FRIENDS_OF_FRIENDS", "leaderElectionGracePeriod": 68, "manualRejoin": false, "maxActiveSessions": 77, "maxPlayers": 70, "minPlayers": 3, "name": "5YbsKoADkzJEN2VH", "partyCodeGeneratorString": "zih3bit0VWn3CO39", "partyCodeLength": 85, "persistent": true, "preferredClaimKeys": ["DNxtXgeO3FgkXhjD", "zaQY3snn2ZkP7cFd", "P43e5dC9XIBudfZg"], "requestedRegions": ["rbHDIDm4hMzF4Txo", "denSrUTvfqU0bfoM", "m5cTtFWbotQyXJRc"], "textChat": true, "textChatMode": "GAME", "tieTeamsSessionLifetime": true, "ttlHours": 34, "type": "P2P"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'mmDg7VYPXIuvUYTZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'BRujIUE1Tq5jyAZv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kRCMNFIurjh2imdb' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name '4rbkXj0ZwsVC0gL9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "7ZVJSPqJiwv1qlYB"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminReconcileMaxActiveSession' test.out

#- 23 AdminGetDSMCConfiguration
eval_tap 0 23 'AdminGetDSMCConfiguration # SKIP deprecated' test.out

#- 24 AdminSyncDSMCConfiguration
eval_tap 0 24 'AdminSyncDSMCConfiguration # SKIP deprecated' test.out

#- 25 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '1RSKs6gQxC3Gb7S0' \
    --dsPodName 'o4zGYY7KQI1AeFgP' \
    --fromTime 'qaOkvo1aolB4lkKB' \
    --gameMode '4EYOkQ1jMD3cym8x' \
    --isPersistent 'IfkOVW2grREOLx0K' \
    --isSoftDeleted 'Oww3HICQLfl7MUBG' \
    --joinability 'FRIENDS_OF_LEADER' \
    --limit '34' \
    --matchPool 'm5UDrT6QXCs5SPBb' \
    --memberID 'RPZTF6oQAXVG7tns' \
    --offset '12' \
    --order 'fSiM9331m7Ta1PsK' \
    --orderBy 'c50Kv6ecnEevcAx2' \
    --sessionID 'K2zkRenmPZnGBt4P' \
    --status 'FAILED_TO_REQUEST' \
    --statusV2 'ENDED' \
    --toTime 'FPoJeQediogEhhM2' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"rIizGdKvOPdq5xrg": {}, "xSmy1DN9LFkYW5DQ": {}, "yj4bj5Ro2ogaKt2u": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["jQSa3Zdb65UXmy0Z", "p6iIaTIKUkmkk9QM", "0NBMA9ORxpzwLR2A"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'K6eXUGPJsw1fiP80' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateDSInformation
./ng net.accelbyte.sdk.cli.Main session adminUpdateDSInformation \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Pclxcft2ulIJzPyr' \
    --body '{"createdRegion": "VEiOG4UcqsuGKHhM", "deployment": "RWLVd3DlhLuIpomM", "description": "8sm1MiaI1mX2tJoA", "ip": "RtdbBe7udsMrok0W", "port": 44, "region": "36mgWjLfFmteue9n", "serverId": "zJ6fH24T805tVg8J", "source": "qU0jZpjvsugAOS7u", "status": "8RiWyerCSa8SRgws"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateDSInformation' test.out

#- 30 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'Aj1ik1jglaDXTvKC' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WwNTAhd2wrS0uPdj' \
    > test.out 2>&1
eval_tap $? 30 'AdminKickGameSessionMember' test.out

#- 31 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'hdinpng5BLy8wbhM' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ssAHjapIkY9Rf4wP' \
    --statusType '57dBZNR88YbCtmKy' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdateGameSessionMember' test.out

#- 32 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '79' \
    --order 'eAczbBdHb2slt71B' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetListNativeSession' test.out

#- 33 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --configurationName '1SmZp2JZp50CnPb7' \
    --fromTime '1ORYcmQbTU5JX8cc' \
    --isSoftDeleted 'LjMXJRk0eaKQDOJv' \
    --joinability 'FRIENDS_OF_LEADER' \
    --key 'xi4YKlONk2Q5Y4Jv' \
    --leaderID 'aizwiilatuUjjt9l' \
    --limit '70' \
    --memberID 'NqF7Bl0LcghVHfPE' \
    --memberStatus 'INVITED' \
    --offset '68' \
    --order 'pxwhRON0bc1eMbEI' \
    --orderBy 'jowLqc3ecjXJbZDK' \
    --partyID 'KoxLE1Y3Dymtj3gi' \
    --toTime 'Pg4x4yiPX6ues1Hh' \
    --value 'hkg1yLVbLFzHEP8c' \
    > test.out 2>&1
eval_tap $? 33 'AdminQueryParties' test.out

#- 34 AdminDeleteBulkParties
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkParties \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["M4NTwr0KHaAsmTej", "52WKi6tArAURt9pl", "CSVq8PdH6hJPUAc0"]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteBulkParties' test.out

#- 35 AdminReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'RVwXgAgntLMCuaXB' \
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
    --body '{"psn": {"clientId": "WQi6BqPg4xr0lCan", "clientSecret": "cUZGCHsZYoLfR1Kt", "scope": "Ov7Zy0b65uvuKNuy"}}' \
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
    --limit '39' \
    --userId 'Tam69qSZ7PC6f6Qk' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetRecentPlayer' test.out

#- 42 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --userId 'FKx1dX4LuWJu3pDM' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentTeamPlayer' test.out

#- 43 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UAeeZ97SBROPYuG6' \
    > test.out 2>&1
eval_tap $? 43 'AdminReadSessionStorage' test.out

#- 44 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XqP6oo7G73zdxTgO' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeleteUserSessionStorage' test.out

#- 45 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fnwIdlNa29fDLh74' \
    --userId '1IslKHzGlLKWUtDQ' \
    > test.out 2>&1
eval_tap $? 45 'AdminReadUserSessionStorage' test.out

#- 46 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 's61OQAoxyyQpRWCi' \
    > test.out 2>&1
eval_tap $? 46 'AdminQueryPlayerAttributes' test.out

#- 47 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'iPDGQhNPEwiJCf2X' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerAttributes' test.out

#- 48 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'JVrlzqQls1ozhLVA' \
    > test.out 2>&1
eval_tap $? 48 'AdminSyncNativeSession' test.out

#- 49 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "3kE8jKvgatOEBM70", "attributes": {"TdlNBJYOmpu1VCar": {}, "zBsV6xnZ5Jrzzjrc": {}, "aug6CWVG8SWP3glU": {}}, "autoJoin": false, "backfillTicketID": "hLOqQGhCUr6iTrjy", "clientVersion": "EgarAdNJOIG36I6t", "configurationName": "RbRcrEveMdAdiPKD", "customURLGRPC": "UVSC00PYeDcaggin", "deployment": "xnFIna3yddcbsPhe", "dsSource": "TH26IUJNvYuGRUvp", "fallbackClaimKeys": ["ZaHCuESOiIZsMfB4", "ZH3mtgWgU4pCAKxe", "E70CaunQNxot371W"], "inactiveTimeout": 13, "inviteTimeout": 67, "joinability": "CLOSED", "matchPool": "4AvQkqsGnmyo5JJT", "maxPlayers": 95, "minPlayers": 54, "preferredClaimKeys": ["Vmb8GEXFTlEMEsFz", "YqwgK1Np5nodqpLm", "7FhJBNXzAFdO0Khq"], "requestedRegions": ["f6kiTdSGv2LFjAKY", "7CbgsWqFWZX7kPBo", "m8F9GLLTG8phc3n4"], "serverName": "iLoIllKlpO2pqiXJ", "storage": {"leader": {"F3WGRaoQomSJC4Dd": {}, "rKF7SUQPLG59e0k5": {}, "ZtX6wK7PpUlcIW32": {}}}, "teams": [{"parties": [{"partyID": "iK7MGt1ixY5rA1Wo", "userIDs": ["VeJIePF8ZrQzP4zv", "tdxdbZUpd6FJtHJ1", "pyVwyKQLY6FEO65R"]}, {"partyID": "b3z7CYLM8IlsHqff", "userIDs": ["nrfsGlfPaZKBwa3D", "db60ufPpzwj1QGIF", "mlVf4jvapseE9LN9"]}, {"partyID": "bvhOrHflIOd6X3vi", "userIDs": ["LvtEk4mTIpUA9gxo", "8SV38nEhoXmM2W7l", "6jHMA2rG3nakopAy"]}], "teamID": "welu01nryEJ0NqoT", "userIDs": ["ow0qiOiC4j0iktm0", "ZPLkLOsp0LZ5njN8", "6Hl8kUXzt6bSc6bW"]}, {"parties": [{"partyID": "vgpVyW9dD1kOmvrA", "userIDs": ["ejcq2LgkQuaS7RBx", "3vim02jBOxrZDyvp", "cLYOWA8NjxOnaEok"]}, {"partyID": "4nOOCzfsflhjbngJ", "userIDs": ["OUn18G5MlfDTk8aG", "40NlncceIZSwgAIk", "gzh4pTU0Am4DZhl0"]}, {"partyID": "bQxFJ3sWCqQpQ2Fb", "userIDs": ["KPFMycMSQ4qfAacR", "0LgB5BUXvjcu2s6w", "3VifnKqmTSoGH1XE"]}], "teamID": "fY6QAYn6WQ5UBEU1", "userIDs": ["QAOHfZiGhxOdcuDX", "SxSc3aZPV87pna08", "gxefTYKhuxaEc7M4"]}, {"parties": [{"partyID": "P7UckSC6ePeN8i4G", "userIDs": ["rFES9z7xueHpATHc", "cee9GXhKcjmSEwdr", "kEnnqKzFsLfYalUl"]}, {"partyID": "fwEQKjU7eHGebSVu", "userIDs": ["0LQ40kepEaC4dfiO", "MZfEhHr39pysFO3Z", "vc1BZG99LyvfvHEs"]}, {"partyID": "JKQQewVLMUoAnaRc", "userIDs": ["Yp7FUjfIGaffoflE", "IByYqeKN0meGelYF", "5wWaDhukU4khGG4v"]}], "teamID": "ZFTYnPkmSu4PWam1", "userIDs": ["jxR7SETWjteoc8fg", "vZDDhoO05oKqymxL", "D1Lcvw6T6mZEiwxx"]}], "textChat": true, "textChatMode": "GAME", "ticketIDs": ["3ZprZ60zMjhTHeh9", "4TSenE5hCFkIf5we", "qZ18MH57l2Zsrh90"], "tieTeamsSessionLifetime": true, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateGameSession' test.out

#- 50 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"TtYmGukz3MnlrjcH": {}, "p6B8Vj7rXFgDnDkd": {}, "Z9bpjb1tdA3QhjCM": {}}' \
    > test.out 2>&1
eval_tap $? 50 'PublicQueryGameSessionsByAttributes' test.out

#- 51 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "W64f4XhIjSoTB2NM"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicSessionJoinCode' test.out

#- 52 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'KtezapPr2QEPx3zT' \
    > test.out 2>&1
eval_tap $? 52 'GetGameSessionByPodName' test.out

#- 53 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xBGtEJIYppuUSsKo' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSession' test.out

#- 54 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Hw2hyd12uSE7BEv3' \
    --body '{"attributes": {"aevq6iohU1cg4W1I": {}, "S3Uv1BpWoJBaqdg2": {}, "FHcunsS1lnaO2m9v": {}}, "backfillTicketID": "qjhbeK2qN8g6x2Py", "clientVersion": "YDo5R3hLiD5sf5y1", "deployment": "JsxJNGmyt0SQDUDo", "fallbackClaimKeys": ["WBZVGLlkUetzCAWc", "9x1aMjgGim51T107", "XIZRZ7tZdIs0xf4c"], "inactiveTimeout": 52, "inviteTimeout": 55, "joinability": "CLOSED", "matchPool": "FUjOn5mM7k8nbLzv", "maxPlayers": 40, "minPlayers": 66, "preferredClaimKeys": ["CIW5ynMKquUicAeI", "VXtoWAXhMlW4tLqX", "7OICf5oD1e6oI9Fm"], "requestedRegions": ["Yel0kOw72o8Zkgk0", "jS6rDWUwfhKvrf2A", "aH4yCWrHSppnIZkN"], "teams": [{"parties": [{"partyID": "nTn3rzH5NvAtcvNe", "userIDs": ["dgS1fUfKmihDbmu8", "ePWlQMVDXEHeiGTn", "wyEw6hIWDZrpP7rz"]}, {"partyID": "3ISW510kHr4isTKW", "userIDs": ["jmv67nuHCXWfwnwG", "ioVwVzmmBVVFfpqx", "1AeLtzcPJ3jtDYBo"]}, {"partyID": "4FUTH7CGfKSyxgRR", "userIDs": ["1DiCqSMzpqIFGLkD", "s7ACC1RgBfoNrHlF", "i2qJLgmBLE35Yhyi"]}], "teamID": "DV90SeI5yppBHoyt", "userIDs": ["VznCgNyx9fbT63Sh", "Eh8PbGikLjgjcj34", "uulU6FYBZsWFbr3R"]}, {"parties": [{"partyID": "SP0W9nBhvhf8Q0Dt", "userIDs": ["JMcYQdN66bswAgt6", "5X4N1LQZmB61JMdt", "wCVUrYQue84dwmbw"]}, {"partyID": "FEnAZaWsQJtRYoag", "userIDs": ["RJK5PX9UcOvhPyE1", "1TRT2SKseoe8VLie", "0LBa36KNzjf005CX"]}, {"partyID": "NGehQ2aTjTDfKFDX", "userIDs": ["C7eGL5YhJDWh9YWq", "c0qgV6d9yOfIMLds", "2DbPcaoMdtRLTmSv"]}], "teamID": "TkQQgB7exYvmHMxr", "userIDs": ["5hPCJJztJBg0tTJg", "46IewOXE2AkCh3QI", "ZsUf8lGFXcmwTERH"]}, {"parties": [{"partyID": "clOdxIwqejxe18rN", "userIDs": ["db8Otq6j1mqUav7k", "05HAQltnSojV4jT6", "5yclX2FtAz0vJjFI"]}, {"partyID": "YWOaNdsimmkW2miH", "userIDs": ["3xRHAKy4QxZkaXZ7", "vmiEd0JPxVyQpsha", "DwNqTbbFMXAMfVXe"]}, {"partyID": "0GZeMgsRsmH1EQrY", "userIDs": ["mkPKTPOlhTtSiZNC", "xuogFteTHJe4BhSS", "QkQD6WmOt6D7ufFV"]}], "teamID": "TOhvQpfbBke8aEdd", "userIDs": ["36xj6wySoltDxsbz", "xrlaKEfkoYjY2o6o", "uRW9UtNquwC3Wgum"]}], "ticketIDs": ["rIz4NhGztZpr4U4f", "wQIiLXgmRasvjO4l", "j8m3XEwP2b4gd3xO"], "tieTeamsSessionLifetime": false, "type": "P2P", "version": 18}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGameSession' test.out

#- 55 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'B5S3DvPRCzBrVUxm' \
    > test.out 2>&1
eval_tap $? 55 'DeleteGameSession' test.out

#- 56 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DOj3cvRFaTC11W0T' \
    --body '{"attributes": {"GTCm4fZWuk6pQxDQ": {}, "pKqxLGeMvr9TsvcM": {}, "Q7dBsaIecRxIsZvD": {}}, "backfillTicketID": "6rmzVr5XT1Nxw0v1", "clientVersion": "dMQ9Rrbk6C2cVWf6", "deployment": "ttvbU1PO6ApCD2VX", "fallbackClaimKeys": ["idT7w0Oc15N8WXBP", "p17PAewqSm5x3B4t", "7WQnp8jXZedgt5cy"], "inactiveTimeout": 82, "inviteTimeout": 10, "joinability": "CLOSED", "matchPool": "k4f9Zcw1pEHAyNFx", "maxPlayers": 6, "minPlayers": 5, "preferredClaimKeys": ["VTKuAQTGh5BxjWOo", "zGoDtsUuYo5p8ED5", "QZAufwNa8lzfjv9o"], "requestedRegions": ["YMXMjlVHY1AHwF3v", "Goav7MK0PcLnEkco", "kKwcQ0baDT9OyJ2h"], "teams": [{"parties": [{"partyID": "23GUS2amU7syGlEl", "userIDs": ["XdEAOrVSnLocLVVY", "amQc4wcG5nDBLJoJ", "HbiQ5duE5p4cfs2E"]}, {"partyID": "41cK8QTwiIAvxSvN", "userIDs": ["DlmM5nQFMGzs7fzj", "gyc44mEh9tRk8knY", "SV30lnroQehMDli6"]}, {"partyID": "t9unQLYXxm09wpGA", "userIDs": ["bpEmDY9vLh3u6EDs", "UmrV6kH4OotKwG3U", "C6XCnnZxF8CmQr17"]}], "teamID": "W65br34rBBN9tU6T", "userIDs": ["Dm5GloFSKWM1eym5", "ydC6p25xCWTqUOYZ", "ENJ1QHZQxPRXH7ux"]}, {"parties": [{"partyID": "BJEECQE1li3Bg7Jx", "userIDs": ["c9pUnZmvhidwCkZw", "qjYLfTiCO1NDBvQv", "RPnAz4VzW0CpoBCb"]}, {"partyID": "yJsF5IjF1c0W338H", "userIDs": ["S6CBgVRyihYNZ84C", "VhziXV8HwSmvcvcD", "KF19yVRafCjOuSYh"]}, {"partyID": "t83AdvBaagTiRJ8d", "userIDs": ["aGTVX3Bb7jlz5IfH", "gKjI9mwJSrN8jkIy", "kR2zbaI6PD7fEscS"]}], "teamID": "hnGUGUtV9GJ279GD", "userIDs": ["bLNwjm3FK0nnX2po", "MfZ1hDHtbh4HtMlF", "gvh2Dp2SoiIPp1yv"]}, {"parties": [{"partyID": "fAHS0VgLu11A3HTo", "userIDs": ["vFi4tPAGfleyCA6j", "EtcqsnzoVILjkwW6", "1duF87aUyrdt4XSp"]}, {"partyID": "WBAetsanzqP8oxfr", "userIDs": ["tbECD1CYPwaiBAxf", "YL8Avt70ZUT2fSk3", "LL0calqxEewuGS46"]}, {"partyID": "9k2hG0WKt4sUmanY", "userIDs": ["xM0UHZVNYzGMNIpW", "oSLkUrfuf4U3WeYe", "A9t2ENKKWrFtHIi1"]}], "teamID": "CMgKAOG5iDcCR5Pb", "userIDs": ["CvDLil8wj9cKM3Ar", "6MF35hCER4nGmWGg", "TJfHlJl4tHGa4XfZ"]}], "ticketIDs": ["cd9CVnGqMX9FieeE", "ssWEUl07bhwntCVq", "iYOJf5KwMZQjzvjS"], "tieTeamsSessionLifetime": false, "type": "P2P", "version": 52}' \
    > test.out 2>&1
eval_tap $? 56 'PatchUpdateGameSession' test.out

#- 57 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aGPGdqLE8Sohhhui' \
    --body '{"backfillTicketID": "TnJarYYkHBDdSzBX"}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateGameSessionBackfillTicketID' test.out

#- 58 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dxapwhd5IQYBQuxL' \
    > test.out 2>&1
eval_tap $? 58 'GameSessionGenerateCode' test.out

#- 59 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vPuWYvE3fsNy9Z9O' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokeGameSessionCode' test.out

#- 60 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hxXvCp9y7fLD2qfC' \
    --body '{"metadata": {"XnlUnqxT1WsRNMZc": "A92hzC7MNa8vVe4M", "HX6AgMep90AyyUJy": "AK5PRMRMwdvl0hv6", "g62GxBW2tQF5tkTj": "gJaMYvNQOsDa4bkc"}, "platformID": "gepqtxjbrztee7QL", "userID": "TGAak7Kaol01DK97"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionInvite' test.out

#- 61 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'D2xnik42miteR5eQ' \
    > test.out 2>&1
eval_tap $? 61 'JoinGameSession' test.out

#- 62 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ae1rzmmgqBPRmd6m' \
    --body '{"leaderID": "O4oI8KDqebm83raN"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromoteGameSessionLeader' test.out

#- 63 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BJ5y7axEkvI4oxZE' \
    > test.out 2>&1
eval_tap $? 63 'LeaveGameSession' test.out

#- 64 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'DxGiBnNbn0zaf7Ca' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OSlHXrUSA6sMJzA5' \
    > test.out 2>&1
eval_tap $? 64 'PublicKickGameSessionMember' test.out

#- 65 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mtqISQ83TTbtefXW' \
    > test.out 2>&1
eval_tap $? 65 'PublicGameSessionReject' test.out

#- 66 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'znDe4LQdXfFBii2R' \
    > test.out 2>&1
eval_tap $? 66 'GetSessionServerSecret' test.out

#- 67 AppendTeamGameSession
eval_tap 0 67 'AppendTeamGameSession # SKIP deprecated' test.out

#- 68 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AMEX5RMjBFVZGYzQ' \
    --userId 'qV8d9mDdUIoiIJFN' \
    > test.out 2>&1
eval_tap $? 68 'PublicGameSessionCancel' test.out

#- 69 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "xuNOmUSWw18T1IxV"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoinCode' test.out

#- 70 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WCxdvPL9e4P01vxP' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetParty' test.out

#- 71 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '8xj1LyEirURERnEM' \
    --body '{"attributes": {"zpImW6sjAHyCK5tN": {}, "anGBrkzUvck3xTtm": {}, "OFMebS4AdlNzwog2": {}}, "inactiveTimeout": 70, "inviteTimeout": 25, "joinability": "CLOSED", "maxPlayers": 62, "minPlayers": 35, "type": "P2P", "version": 22}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateParty' test.out

#- 72 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Th4gUoj8u2WRcLiE' \
    --body '{"attributes": {"tzVlnkflfn7pHY48": {}, "F1dl1q92m3iRlfnB": {}, "Ak0CwiAsR65yQ9ss": {}}, "inactiveTimeout": 41, "inviteTimeout": 37, "joinability": "INVITE_ONLY", "maxPlayers": 36, "minPlayers": 7, "type": "NONE", "version": 67}' \
    > test.out 2>&1
eval_tap $? 72 'PublicPatchUpdateParty' test.out

#- 73 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '3CUYATdqnQGbqiqO' \
    > test.out 2>&1
eval_tap $? 73 'PublicGeneratePartyCode' test.out

#- 74 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kNeATj7eGjodd7Cc' \
    > test.out 2>&1
eval_tap $? 74 'PublicRevokePartyCode' test.out

#- 75 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JUrI6MAugK5kypNr' \
    --body '{"metadata": {"p2nFe9FmN86sK5LO": "q4ft5jGcMICPUYnf", "G6jl9U4jReteIMgz": "ISomCsodJrhQW41q", "2OspCZbt3Uta5I0u": "GcL1koyHjCH5olYL"}, "platformID": "ETRpABAmO2EGvJ4U", "userID": "MS93yOxNInDByhno"}' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyInvite' test.out

#- 76 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'luO6ti0QP2ssiJ66' \
    --body '{"leaderID": "OzOj84O6tgohjtC7"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPromotePartyLeader' test.out

#- 77 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bzjPpucddXJ5zifF' \
    > test.out 2>&1
eval_tap $? 77 'PublicReadPartySessionStorage' test.out

#- 78 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId '8y959anrNSleywHb' \
    --userId 'Hig6IKWVZ77KeRWd' \
    --body '{"ECaFGzfZ2hxcJ2Fn": {}, "emn7M23SzUo4hNBD": {}, "h9ZFP1OW0nXOErQP": {}}' \
    > test.out 2>&1
eval_tap $? 78 'PublicUpdateInsertPartySessionStorage' test.out

#- 79 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'S4VsRoYIK69yg9AD' \
    --userId 'CGiXaLs2xjHkinOD' \
    --body '{"975nARHCmhNHSXuq": {}, "IHsxvaUoXDmwWsuk": {}, "xncuD3QxCXMd00YB": {}}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 80 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WCaVVmM45mfIZsWh' \
    > test.out 2>&1
eval_tap $? 80 'PublicPartyJoin' test.out

#- 81 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kS476dGGJwJ00UH1' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyLeave' test.out

#- 82 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '97MJ6zU7JLMQyMWz' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyReject' test.out

#- 83 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YQCAaPJgoxGJoJaS' \
    --userId 'zUtY4ZD0Xtb0U4pH' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyCancel' test.out

#- 84 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '16NUsVY21NVIs7NR' \
    --userId 'en2Y3Ns0QJQeaWyt' \
    > test.out 2>&1
eval_tap $? 84 'PublicPartyKick' test.out

#- 85 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Pfds1BYx0EaURydf": {}, "8ZyyZeHAWGgJUbUJ": {}, "RMbkcTglbU86FyOj": {}}, "configurationName": "ApNHBVfNOURcjY3Y", "inactiveTimeout": 93, "inviteTimeout": 50, "joinability": "FRIENDS_OF_FRIENDS", "maxPlayers": 93, "members": [{"ID": "L13Ornyx34luLdvt", "PlatformID": "sTKXMjiw6gYPvfn2", "PlatformUserID": "Qt9iyq3Nyk8ncu2Z"}, {"ID": "3eDHH9WaVO4iKhDc", "PlatformID": "J7TCcNIsQ3PuppUx", "PlatformUserID": "DSK8aOTGMudcxlCV"}, {"ID": "4cNbJGQ57lPdinpj", "PlatformID": "S2DRfGt9GlyZVQ4X", "PlatformUserID": "67tPZSTpPq3xjrEl"}], "minPlayers": 45, "textChat": true, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 85 'PublicCreateParty' test.out

#- 86 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    > test.out 2>&1
eval_tap $? 86 'PublicGetRecentPlayer' test.out

#- 87 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 87 'PublicGetRecentTeamPlayer' test.out

#- 88 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'THf1ANTJ9Yk997Xk' \
    --body '{"GOdC6ItxDT8p4n4X": {}, "CFkD1AJLCwszbZxu": {}, "HSgDOK8bjoF7bL26": {}}' \
    > test.out 2>&1
eval_tap $? 88 'PublicUpdateInsertSessionStorageLeader' test.out

#- 89 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '35KbtZTGJpqgl2Iz' \
    --userId 'NXGTuQPIDpor7t1a' \
    --body '{"JLNNz6QIVC9Mfuc8": {}, "VOsnmnlVljdWYmEL": {}, "e74p38vumnxAnYBT": {}}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUpdateInsertSessionStorage' test.out

#- 90 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["xaTIz0jcgDI8Pkz9", "6vd80msqIm5bufnB", "qrpLeqhwVhjnnjKM"]}' \
    > test.out 2>&1
eval_tap $? 90 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 91 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'PublicGetPlayerAttributes' test.out

#- 92 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "iXfLcxDC9Ynd02mE", "data": {"CIQhfIhHtADUQ9zi": {}, "mQTQT95pFJUAJsyA": {}, "feKOufV4f15NohXu": {}}, "platforms": [{"name": "6opxQGRt6PqlkL0d", "userID": "iRhLC10ih2EQfY3X"}, {"name": "Cv4hdOa6FdZhNMd1", "userID": "onFjGRbxtABPXDmg"}, {"name": "NEJBhgGq5GIDhNC6", "userID": "6szbCCf73IFbRkPS"}], "roles": ["SITz4TjCrJHXGXku", "2YVuOzhxHmnrrV9Z", "GWrZ05sxe6A6RpmK"], "simultaneousPlatform": "DebNkylbynkgT9va"}' \
    > test.out 2>&1
eval_tap $? 92 'PublicStorePlayerAttributes' test.out

#- 93 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'PublicDeletePlayerAttributes' test.out

#- 94 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'yLLiizac7Ge6zKJd' \
    --orderBy 'lt7rjF5RaJwvkWVc' \
    --status 'o2LTo5ijlvDF8qBW' \
    > test.out 2>&1
eval_tap $? 94 'PublicQueryMyGameSessions' test.out

#- 95 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'CQ9dLWYyS8zdhMeB' \
    --orderBy 'XH8x6HdVfZVDAiU6' \
    --status 'iJOF7JKZFNk2NKy5' \
    > test.out 2>&1
eval_tap $? 95 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE