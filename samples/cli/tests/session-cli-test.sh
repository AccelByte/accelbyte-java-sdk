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
echo "1..96"

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

#- 41 AdminUploadPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUploadPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --platformId 'XBOX' \
    --description 'Tam69qSZ7PC6f6Qk' \
    --file 'tmp.dat' \
    --password 'mZXElW9YfRSse6AA' \
    > test.out 2>&1
eval_tap $? 41 'AdminUploadPlatformCredentials' test.out

#- 42 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --userId 'UAeeZ97SBROPYuG6' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetRecentPlayer' test.out

#- 43 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --userId 'qP6oo7G73zdxTgOf' \
    > test.out 2>&1
eval_tap $? 43 'AdminGetRecentTeamPlayer' test.out

#- 44 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nwIdlNa29fDLh741' \
    > test.out 2>&1
eval_tap $? 44 'AdminReadSessionStorage' test.out

#- 45 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IslKHzGlLKWUtDQs' \
    > test.out 2>&1
eval_tap $? 45 'AdminDeleteUserSessionStorage' test.out

#- 46 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '61OQAoxyyQpRWCii' \
    --userId 'PDGQhNPEwiJCf2XJ' \
    > test.out 2>&1
eval_tap $? 46 'AdminReadUserSessionStorage' test.out

#- 47 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'VrlzqQls1ozhLVA3' \
    > test.out 2>&1
eval_tap $? 47 'AdminQueryPlayerAttributes' test.out

#- 48 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'kE8jKvgatOEBM70T' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerAttributes' test.out

#- 49 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'dlNBJYOmpu1VCarz' \
    > test.out 2>&1
eval_tap $? 49 'AdminSyncNativeSession' test.out

#- 50 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --resolveMaxActiveSession  \
    --body '{"appName": "BsV6xnZ5Jrzzjrca", "attributes": {"ug6CWVG8SWP3glU6": {}, "muswVJnNnN7kAa7j": {}, "0riFc5HTHQIoVsGo": {}}, "autoJoin": false, "backfillTicketID": "bRcrEveMdAdiPKDU", "clientVersion": "VSC00PYeDcagginx", "configurationName": "nFIna3yddcbsPheT", "customURLGRPC": "H26IUJNvYuGRUvpZ", "deployment": "aHCuESOiIZsMfB4Z", "dsSource": "H3mtgWgU4pCAKxeE", "fallbackClaimKeys": ["70CaunQNxot371W9", "G4AvQkqsGnmyo5JJ", "TUVmb8GEXFTlEMEs"], "inactiveTimeout": 64, "inviteTimeout": 79, "joinability": "FRIENDS_OF_MEMBERS", "matchPool": "if3BOdkocVTd4Bxq", "maxPlayers": 66, "minPlayers": 100, "preferredClaimKeys": ["FhJBNXzAFdO0Khqf", "6kiTdSGv2LFjAKY7", "CbgsWqFWZX7kPBom"], "requestedRegions": ["8F9GLLTG8phc3n4i", "LoIllKlpO2pqiXJF", "3WGRaoQomSJC4Ddr"], "serverName": "KF7SUQPLG59e0k5Z", "storage": {"leader": {"tX6wK7PpUlcIW32i": {}, "K7MGt1ixY5rA1WoV": {}, "eJIePF8ZrQzP4zvt": {}}}, "teams": [{"parties": [{"partyID": "dxdbZUpd6FJtHJ1p", "userIDs": ["yVwyKQLY6FEO65Rb", "3z7CYLM8IlsHqffn", "rfsGlfPaZKBwa3Dd"]}, {"partyID": "b60ufPpzwj1QGIFm", "userIDs": ["lVf4jvapseE9LN9b", "vhOrHflIOd6X3viL", "vtEk4mTIpUA9gxo8"]}, {"partyID": "SV38nEhoXmM2W7l6", "userIDs": ["jHMA2rG3nakopAyw", "elu01nryEJ0NqoTo", "w0qiOiC4j0iktm0Z"]}], "teamID": "PLkLOsp0LZ5njN86", "userIDs": ["Hl8kUXzt6bSc6bWv", "gpVyW9dD1kOmvrAe", "jcq2LgkQuaS7RBx3"]}, {"parties": [{"partyID": "vim02jBOxrZDyvpc", "userIDs": ["LYOWA8NjxOnaEok4", "nOOCzfsflhjbngJO", "Un18G5MlfDTk8aG4"]}, {"partyID": "0NlncceIZSwgAIkg", "userIDs": ["zh4pTU0Am4DZhl0b", "QxFJ3sWCqQpQ2FbK", "PFMycMSQ4qfAacR0"]}, {"partyID": "LgB5BUXvjcu2s6w3", "userIDs": ["VifnKqmTSoGH1XEf", "Y6QAYn6WQ5UBEU1Q", "AOHfZiGhxOdcuDXS"]}], "teamID": "xSc3aZPV87pna08g", "userIDs": ["xefTYKhuxaEc7M4P", "7UckSC6ePeN8i4Gr", "FES9z7xueHpATHcc"]}, {"parties": [{"partyID": "ee9GXhKcjmSEwdrk", "userIDs": ["EnnqKzFsLfYalUlf", "wEQKjU7eHGebSVu0", "LQ40kepEaC4dfiOM"]}, {"partyID": "ZfEhHr39pysFO3Zv", "userIDs": ["c1BZG99LyvfvHEsJ", "KQQewVLMUoAnaRcY", "p7FUjfIGaffoflEI"]}, {"partyID": "ByYqeKN0meGelYF5", "userIDs": ["wWaDhukU4khGG4vZ", "FTYnPkmSu4PWam1j", "xR7SETWjteoc8fgv"]}], "teamID": "ZDDhoO05oKqymxLD", "userIDs": ["1Lcvw6T6mZEiwxxE", "lpMYSWIeVzm7z9no", "owmlTIKVowi0RY2V"]}], "textChat": true, "textChatMode": "TEAM", "ticketIDs": ["8MH57l2Zsrh90ETt", "YmGukz3MnlrjcHp6", "B8Vj7rXFgDnDkdZ9"], "tieTeamsSessionLifetime": false, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 50 'CreateGameSession' test.out

#- 51 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"pjb1tdA3QhjCMW64": {}, "f4XhIjSoTB2NMKte": {}, "zapPr2QEPx3zTxBG": {}}' \
    > test.out 2>&1
eval_tap $? 51 'PublicQueryGameSessionsByAttributes' test.out

#- 52 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tEJIYppuUSsKoHw2"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicSessionJoinCode' test.out

#- 53 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'hyd12uSE7BEv3aev' \
    > test.out 2>&1
eval_tap $? 53 'GetGameSessionByPodName' test.out

#- 54 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'q6iohU1cg4W1IS3U' \
    > test.out 2>&1
eval_tap $? 54 'GetGameSession' test.out

#- 55 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'v1BpWoJBaqdg2FHc' \
    --body '{"attributes": {"unsS1lnaO2m9vqjh": {}, "beK2qN8g6x2PyYDo": {}, "5R3hLiD5sf5y1Jsx": {}}, "backfillTicketID": "JNGmyt0SQDUDoWBZ", "clientVersion": "VGLlkUetzCAWc9x1", "deployment": "aMjgGim51T107XIZ", "fallbackClaimKeys": ["RZ7tZdIs0xf4czdt", "7zqmSKxOEQlVcx6G", "qsBq8vdhWVnuYLgp"], "inactiveTimeout": 9, "inviteTimeout": 40, "joinability": "CLOSED", "matchPool": "oWAXhMlW4tLqX7OI", "maxPlayers": 58, "minPlayers": 91, "preferredClaimKeys": ["f5oD1e6oI9FmYel0", "kOw72o8Zkgk0jS6r", "DWUwfhKvrf2AaH4y"], "requestedRegions": ["CWrHSppnIZkNnTn3", "rzH5NvAtcvNedgS1", "fUfKmihDbmu8ePWl"], "teams": [{"parties": [{"partyID": "QMVDXEHeiGTnwyEw", "userIDs": ["6hIWDZrpP7rz3ISW", "510kHr4isTKWjmv6", "7nuHCXWfwnwGioVw"]}, {"partyID": "VzmmBVVFfpqx1AeL", "userIDs": ["tzcPJ3jtDYBo4FUT", "H7CGfKSyxgRR1DiC", "qSMzpqIFGLkDs7AC"]}, {"partyID": "C1RgBfoNrHlFi2qJ", "userIDs": ["LgmBLE35YhyiDV90", "SeI5yppBHoytVznC", "gNyx9fbT63ShEh8P"]}], "teamID": "bGikLjgjcj34uulU", "userIDs": ["6FYBZsWFbr3RSP0W", "9nBhvhf8Q0DtJMcY", "QdN66bswAgt65X4N"]}, {"parties": [{"partyID": "1LQZmB61JMdtwCVU", "userIDs": ["rYQue84dwmbwFEnA", "ZaWsQJtRYoagRJK5", "PX9UcOvhPyE11TRT"]}, {"partyID": "2SKseoe8VLie0LBa", "userIDs": ["36KNzjf005CXNGeh", "Q2aTjTDfKFDXC7eG", "L5YhJDWh9YWqc0qg"]}, {"partyID": "V6d9yOfIMLds2DbP", "userIDs": ["caoMdtRLTmSvTkQQ", "gB7exYvmHMxr5hPC", "JJztJBg0tTJg46Ie"]}], "teamID": "wOXE2AkCh3QIZsUf", "userIDs": ["8lGFXcmwTERHclOd", "xIwqejxe18rNdb8O", "tq6j1mqUav7k05HA"]}, {"parties": [{"partyID": "QltnSojV4jT65ycl", "userIDs": ["X2FtAz0vJjFIYWOa", "NdsimmkW2miH3xRH", "AKy4QxZkaXZ7vmiE"]}, {"partyID": "d0JPxVyQpshaDwNq", "userIDs": ["TbbFMXAMfVXe0GZe", "MgsRsmH1EQrYmkPK", "TPOlhTtSiZNCxuog"]}, {"partyID": "FteTHJe4BhSSQkQD", "userIDs": ["6WmOt6D7ufFVTOhv", "QpfbBke8aEdd36xj", "6wySoltDxsbzxrla"]}], "teamID": "KEfkoYjY2o6ouRW9", "userIDs": ["UtNquwC3WgumrIz4", "NhGztZpr4U4fwQIi", "LXgmRasvjO4lj8m3"]}], "ticketIDs": ["XEwP2b4gd3xOeii8", "Jnmssep2xD2NY0kA", "BeGs9yxahld1pO0G"], "tieTeamsSessionLifetime": true, "type": "DS", "version": 11}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateGameSession' test.out

#- 56 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4fZWuk6pQxDQpKqx' \
    > test.out 2>&1
eval_tap $? 56 'DeleteGameSession' test.out

#- 57 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LGeMvr9TsvcMQ7dB' \
    --body '{"attributes": {"saIecRxIsZvD6rmz": {}, "Vr5XT1Nxw0v1dMQ9": {}, "Rrbk6C2cVWf6ttvb": {}}, "backfillTicketID": "U1PO6ApCD2VXidT7", "clientVersion": "w0Oc15N8WXBPp17P", "deployment": "AewqSm5x3B4t7WQn", "fallbackClaimKeys": ["p8jXZedgt5cyNe27", "HLtwtVOaxgP6Jbct", "8puMybYGxD9IPmms"], "inactiveTimeout": 76, "inviteTimeout": 30, "joinability": "FRIENDS_OF_FRIENDS", "matchPool": "DtsUuYo5p8ED5QZA", "maxPlayers": 42, "minPlayers": 96, "preferredClaimKeys": ["fwNa8lzfjv9oYMXM", "jlVHY1AHwF3vGoav", "7MK0PcLnEkcokKwc"], "requestedRegions": ["Q0baDT9OyJ2h23GU", "S2amU7syGlElXdEA", "OrVSnLocLVVYamQc"], "teams": [{"parties": [{"partyID": "4wcG5nDBLJoJHbiQ", "userIDs": ["5duE5p4cfs2E41cK", "8QTwiIAvxSvNDlmM", "5nQFMGzs7fzjgyc4"]}, {"partyID": "4mEh9tRk8knYSV30", "userIDs": ["lnroQehMDli6t9un", "QLYXxm09wpGAbpEm", "DY9vLh3u6EDsUmrV"]}, {"partyID": "6kH4OotKwG3UC6XC", "userIDs": ["nnZxF8CmQr17W65b", "r34rBBN9tU6TDm5G", "loFSKWM1eym5ydC6"]}], "teamID": "p25xCWTqUOYZENJ1", "userIDs": ["QHZQxPRXH7uxBJEE", "CQE1li3Bg7Jxc9pU", "nZmvhidwCkZwqjYL"]}, {"parties": [{"partyID": "fTiCO1NDBvQvRPnA", "userIDs": ["z4VzW0CpoBCbyJsF", "5IjF1c0W338HS6CB", "gVRyihYNZ84CVhzi"]}, {"partyID": "XV8HwSmvcvcDKF19", "userIDs": ["yVRafCjOuSYht83A", "dvBaagTiRJ8daGTV", "X3Bb7jlz5IfHgKjI"]}, {"partyID": "9mwJSrN8jkIykR2z", "userIDs": ["baI6PD7fEscShnGU", "GUtV9GJ279GDbLNw", "jm3FK0nnX2poMfZ1"]}], "teamID": "hDHtbh4HtMlFgvh2", "userIDs": ["Dp2SoiIPp1yvfAHS", "0VgLu11A3HTovFi4", "tPAGfleyCA6jEtcq"]}, {"parties": [{"partyID": "snzoVILjkwW61duF", "userIDs": ["87aUyrdt4XSpWBAe", "tsanzqP8oxfrtbEC", "D1CYPwaiBAxfYL8A"]}, {"partyID": "vt70ZUT2fSk3LL0c", "userIDs": ["alqxEewuGS469k2h", "G0WKt4sUmanYxM0U", "HZVNYzGMNIpWoSLk"]}, {"partyID": "Urfuf4U3WeYeA9t2", "userIDs": ["ENKKWrFtHIi1CMgK", "AOG5iDcCR5PbCvDL", "il8wj9cKM3Ar6MF3"]}], "teamID": "5hCER4nGmWGgTJfH", "userIDs": ["lJl4tHGa4XfZcd9C", "VnGqMX9FieeEssWE", "Ul07bhwntCVqiYOJ"]}], "ticketIDs": ["f5KwMZQjzvjSozv6", "CTRDl0zp9CzHFwin", "kBNi4gvqgl6TZ9TG"], "tieTeamsSessionLifetime": true, "type": "P2P", "version": 46}' \
    > test.out 2>&1
eval_tap $? 57 'PatchUpdateGameSession' test.out

#- 58 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mv34h6T7EsufmfxK' \
    --body '{"backfillTicketID": "YB4LM6H6QXmpZ9X3"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateGameSessionBackfillTicketID' test.out

#- 59 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fUSR1l9xLPBsmAUr' \
    > test.out 2>&1
eval_tap $? 59 'GameSessionGenerateCode' test.out

#- 60 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'D9L1IiD6MlcEPhMD' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokeGameSessionCode' test.out

#- 61 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FzjHZ3sIhzOx2CXK' \
    --body '{"metadata": {"lvIomU3pIxM9n8D2": "eLMe3lt9qfx2UDcg", "VE7L9FK6e0MrPc4v": "txk9hVKlG56HlzGr", "7XjdyRJunZPkp6cc": "IBnWyPw8mj7gyQ7X"}, "platformID": "dIszGRj46COPipH1", "userID": "MWVTHG0qHJCWEfOJ"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicGameSessionInvite' test.out

#- 62 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pZm9yEYWNGMy2pgS' \
    > test.out 2>&1
eval_tap $? 62 'JoinGameSession' test.out

#- 63 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GSUOK68eqGJtWf1Y' \
    --body '{"leaderID": "bgg8rdwY9bmrvHmO"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromoteGameSessionLeader' test.out

#- 64 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '07KNqX9LM2IwEsdO' \
    > test.out 2>&1
eval_tap $? 64 'LeaveGameSession' test.out

#- 65 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'GBXBwnzDX8v3xgC1' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ge9PdbTTAJ2Gp1r0' \
    > test.out 2>&1
eval_tap $? 65 'PublicKickGameSessionMember' test.out

#- 66 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sVZ6LJAOddIL2l3h' \
    > test.out 2>&1
eval_tap $? 66 'PublicGameSessionReject' test.out

#- 67 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PjNDKv2LWfXqjr8f' \
    > test.out 2>&1
eval_tap $? 67 'GetSessionServerSecret' test.out

#- 68 AppendTeamGameSession
eval_tap 0 68 'AppendTeamGameSession # SKIP deprecated' test.out

#- 69 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'S79En3wYowBdkaZ3' \
    --userId 'y6i38XQjLDRqkpiF' \
    > test.out 2>&1
eval_tap $? 69 'PublicGameSessionCancel' test.out

#- 70 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "K5BtiQ272Uo9UBJW"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyJoinCode' test.out

#- 71 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'odpdwsX1jorcyR0x' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetParty' test.out

#- 72 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '3YiHF8ITGPRQBCgI' \
    --body '{"attributes": {"s1Q2lzxl0yF5m77T": {}, "Th4gUoj8u2WRcLiE": {}, "tzVlnkflfn7pHY48": {}}, "inactiveTimeout": 64, "inviteTimeout": 19, "joinability": "FRIENDS_OF_LEADER", "maxPlayers": 8, "minPlayers": 90, "type": "DS", "version": 99}' \
    > test.out 2>&1
eval_tap $? 72 'PublicUpdateParty' test.out

#- 73 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '1q92m3iRlfnBAk0C' \
    --body '{"attributes": {"wiAsR65yQ9ssuHdG": {}, "mxncCEr0KcgeqzGb": {}, "ruNB72HHMkjzyBB4": {}}, "inactiveTimeout": 96, "inviteTimeout": 96, "joinability": "INVITE_ONLY", "maxPlayers": 35, "minPlayers": 75, "type": "P2P", "version": 18}' \
    > test.out 2>&1
eval_tap $? 73 'PublicPatchUpdateParty' test.out

#- 74 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '6MAugK5kypNrp2nF' \
    > test.out 2>&1
eval_tap $? 74 'PublicGeneratePartyCode' test.out

#- 75 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'e9FmN86sK5LOq4ft' \
    > test.out 2>&1
eval_tap $? 75 'PublicRevokePartyCode' test.out

#- 76 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '5jGcMICPUYnfG6jl' \
    --body '{"metadata": {"9U4jReteIMgzISom": "CsodJrhQW41q2Osp", "CZbt3Uta5I0uGcL1": "koyHjCH5olYLETRp", "ABAmO2EGvJ4UMS93": "yOxNInDByhnoluO6"}, "platformID": "ti0QP2ssiJ66OzOj", "userID": "84O6tgohjtC7bzjP"}' \
    > test.out 2>&1
eval_tap $? 76 'PublicPartyInvite' test.out

#- 77 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pucddXJ5zifF8y95' \
    --body '{"leaderID": "9anrNSleywHbHig6"}' \
    > test.out 2>&1
eval_tap $? 77 'PublicPromotePartyLeader' test.out

#- 78 PublicReadPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicReadPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IKWVZ77KeRWdECaF' \
    > test.out 2>&1
eval_tap $? 78 'PublicReadPartySessionStorage' test.out

#- 79 PublicUpdateInsertPartySessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorage \
    --namespace "$AB_NAMESPACE" \
    --partyId 'GzfZ2hxcJ2Fnemn7' \
    --userId 'M23SzUo4hNBDh9ZF' \
    --body '{"P1OW0nXOErQPS4Vs": {}, "RoYIK69yg9ADCGiX": {}, "aLs2xjHkinOD975n": {}}' \
    > test.out 2>&1
eval_tap $? 79 'PublicUpdateInsertPartySessionStorage' test.out

#- 80 PublicUpdateInsertPartySessionStorageReserved
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertPartySessionStorageReserved \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ARHCmhNHSXuqIHsx' \
    --userId 'vaUoXDmwWsukxncu' \
    --body '{"D3QxCXMd00YBWCaV": {}, "VmM45mfIZsWhkS47": {}, "6dGGJwJ00UH197MJ": {}}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateInsertPartySessionStorageReserved' test.out

#- 81 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '6zU7JLMQyMWzYQCA' \
    > test.out 2>&1
eval_tap $? 81 'PublicPartyJoin' test.out

#- 82 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aPJgoxGJoJaSzUtY' \
    > test.out 2>&1
eval_tap $? 82 'PublicPartyLeave' test.out

#- 83 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '4ZD0Xtb0U4pH16NU' \
    > test.out 2>&1
eval_tap $? 83 'PublicPartyReject' test.out

#- 84 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId 'sVY21NVIs7NRen2Y' \
    --userId '3Ns0QJQeaWytPfds' \
    > test.out 2>&1
eval_tap $? 84 'PublicPartyCancel' test.out

#- 85 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '1BYx0EaURydf8Zyy' \
    --userId 'ZeHAWGgJUbUJRMbk' \
    > test.out 2>&1
eval_tap $? 85 'PublicPartyKick' test.out

#- 86 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"cTglbU86FyOjApNH": {}, "BVfNOURcjY3YYT9o": {}, "TynmfIuBWgJTNFfM": {}}, "configurationName": "8M0IW4oe8KDgy0xZ", "inactiveTimeout": 11, "inviteTimeout": 88, "joinability": "FRIENDS_OF_MEMBERS", "maxPlayers": 40, "members": [{"ID": "cNg14Ws8TIP1LKiF", "PlatformID": "QoLDvumfqrgSfnx2", "PlatformUserID": "h61X9dN1MGRXBJ6m"}, {"ID": "VV7JS9qjNLwvI8Jd", "PlatformID": "iY3RRiLilmOGF6dL", "PlatformUserID": "LIeIVIjMcdlbdRXT"}, {"ID": "GIrdNL5gJPqTAjgq", "PlatformID": "aTHf1ANTJ9Yk997X", "PlatformUserID": "kGOdC6ItxDT8p4n4"}], "minPlayers": 59, "textChat": false, "type": "NONE"}' \
    > test.out 2>&1
eval_tap $? 86 'PublicCreateParty' test.out

#- 87 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    > test.out 2>&1
eval_tap $? 87 'PublicGetRecentPlayer' test.out

#- 88 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    > test.out 2>&1
eval_tap $? 88 'PublicGetRecentTeamPlayer' test.out

#- 89 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1AJLCwszbZxuHSgD' \
    --body '{"OK8bjoF7bL2635Kb": {}, "tZTGJpqgl2IzNXGT": {}, "uQPIDpor7t1aJLNN": {}}' \
    > test.out 2>&1
eval_tap $? 89 'PublicUpdateInsertSessionStorageLeader' test.out

#- 90 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z6QIVC9Mfuc8VOsn' \
    --userId 'mnlVljdWYmELe74p' \
    --body '{"38vumnxAnYBTxaTI": {}, "z0jcgDI8Pkz96vd8": {}, "0msqIm5bufnBqrpL": {}}' \
    > test.out 2>&1
eval_tap $? 90 'PublicUpdateInsertSessionStorage' test.out

#- 91 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["eqhwVhjnnjKMEmtb", "iWsAQHbMrKYi0Zxs", "5SWCqZXHLLa31oQf"]}' \
    > test.out 2>&1
eval_tap $? 91 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 92 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'PublicGetPlayerAttributes' test.out

#- 93 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "95pFJUAJsyAfeKOu", "data": {"fV4f15NohXu6opxQ": {}, "GRt6PqlkL0diRhLC": {}, "10ih2EQfY3XCv4hd": {}}, "platforms": [{"name": "Oa6FdZhNMd1onFjG", "userID": "RbxtABPXDmgNEJBh"}, {"name": "gGq5GIDhNC66szbC", "userID": "Cf73IFbRkPSSITz4"}, {"name": "TjCrJHXGXku2YVuO", "userID": "zhxHmnrrV9ZGWrZ0"}], "roles": ["5sxe6A6RpmKDebNk", "ylbynkgT9vayLLii", "zac7Ge6zKJdlt7rj"], "simultaneousPlatform": "F5RaJwvkWVco2LTo"}' \
    > test.out 2>&1
eval_tap $? 93 'PublicStorePlayerAttributes' test.out

#- 94 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'PublicDeletePlayerAttributes' test.out

#- 95 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '5ijlvDF8qBWCQ9dL' \
    --orderBy 'WYyS8zdhMeBXH8x6' \
    --status 'HdVfZVDAiU6iJOF7' \
    > test.out 2>&1
eval_tap $? 95 'PublicQueryMyGameSessions' test.out

#- 96 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'JKZFNk2NKy59X8iO' \
    --orderBy 'g2sVBiCoeC5weXJl' \
    --status '7PeiMH8z8dVej8N2' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE