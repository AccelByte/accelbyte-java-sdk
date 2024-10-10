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
echo "1..87"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 59, "PSNSupportedPlatforms": ["tPYokahFjkQsfCaT", "mt1d67FXGk2s9Q0m", "PVo3twu0MesTCf9x"], "SessionTitle": "4rt69lna7qxNeIxP", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "6MbwL6IY69z1UaLq", "XboxServiceConfigID": "YSYWytLPziZMdjxc", "XboxSessionTemplateName": "BZufQxGiHPllG4cY", "XboxTitleID": "EzfTD1ZBm3MqHcUm", "localizedSessionName": {"LZZbSqb8RwNmn9Hr": {}, "NQy4uZAAiE0mit9R": {}, "GCCHYzUOcEdscKHP": {}}}, "PSNBaseUrl": "EqgA8yu7Vk6Jt4Ym", "appName": "os9Jcdos4fYcTVU6", "attributes": {"RBt0zYoMcHyCUEXl": {}, "AvxJMdalwSyliWMN": {}, "W5NyLu0M3VHh2EI8": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "9ZZPYGu0rdlgdWyO", "customURLGRPC": "tXi3choQrpOsDBU5", "deployment": "SepjChB3V0v52Dly", "disableCodeGeneration": false, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "XNB3Gv0IqmF51Tkh", "enableSecret": false, "fallbackClaimKeys": ["p44YUDjasWIPUvmE", "ejtGeoyIPa8ZRrvj", "j7il35MXbN9oCMNq"], "grpcSessionConfig": {"appName": "q98SjTvhZNkSQ70D", "customURL": "0H6BXksUC9b6i5lZ", "functionFlag": 58}, "immutableStorage": true, "inactiveTimeout": 47, "inviteTimeout": 87, "joinability": "v32e8c5csSovoqsZ", "leaderElectionGracePeriod": 82, "manualRejoin": false, "maxActiveSessions": 56, "maxPlayers": 46, "minPlayers": 6, "name": "bmXgdAPh1EThG96g", "persistent": true, "preferredClaimKeys": ["ZxfgPubTDIHrvqAT", "huwjRHpKKTlmVr9X", "uoJbRFQSKVPHbn4X"], "requestedRegions": ["xtu7LQRENjEEztx1", "WsYSiZqan0nSBJro", "av91GXlvPG6bFYRe"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "QipcCx9Zw5D2L7vI"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --name 'hGGSyEW4ZJJ42d3P' \
    --offset '57' \
    --order 'hgo5QB65lSAiYnNj' \
    --orderBy 'kfZrQvGgbLdLsFzH' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'kBMr1yrOMlNFSrUE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'irnjX9fDmIbeZxzf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 93, "PSNSupportedPlatforms": ["WQG26yUZNmTBcvrb", "YCwZtxFHyPLtI8il", "byDPUIj88cekdqCt"], "SessionTitle": "81P1ktfIovmv9gsR", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "z9KOsb392k6YmJFf", "XboxServiceConfigID": "RByjlBiuFM3FIoVk", "XboxSessionTemplateName": "8T3GpAnkCmBUqg2S", "XboxTitleID": "CnqntX9y1aZSWMiV", "localizedSessionName": {"i10sG6vxkfUcmqRR": {}, "bceJ5i0EeDxOgBnh": {}, "hqElIaDml48wdNFL": {}}}, "PSNBaseUrl": "Tm5T50x9WT0GfH2r", "appName": "tOa4EXsXzOXQAk4m", "attributes": {"qrxzTtuLl4XlbGL8": {}, "QOxtjzm8y2wNhmwo": {}, "YZyI4EFZKBcYrCEA": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "7WIsfmx40NLRc6m8", "customURLGRPC": "heKnWhzfe2NubeoK", "deployment": "FeIaFQCYoDPICpnd", "disableCodeGeneration": true, "disableResendInvite": false, "dsManualSetReady": true, "dsSource": "BbEDoNf3n0hEoRCA", "enableSecret": false, "fallbackClaimKeys": ["xvvKgAT8mJrYq6hR", "kloqxM3gpwxcfMy9", "XzjjI5YbsKoADkzJ"], "grpcSessionConfig": {"appName": "EN2VHzih3bit0VWn", "customURL": "3CO39PXDNxtXgeO3", "functionFlag": 64}, "immutableStorage": false, "inactiveTimeout": 42, "inviteTimeout": 21, "joinability": "YsaZA2yyd4mbqoOf", "leaderElectionGracePeriod": 55, "manualRejoin": true, "maxActiveSessions": 4, "maxPlayers": 79, "minPlayers": 65, "name": "MAXFaY9eKa699bRV", "persistent": false, "preferredClaimKeys": ["grbHDIDm4hMzF4Tx", "odenSrUTvfqU0bfo", "Mm5cTtFWbotQyXJR"], "requestedRegions": ["cQWsmqPNs92epxk0", "i8VxsZNereSvf969", "9mCEHThUJkETAsSp"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "2imdb4rbkXj0ZwsV"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'C0gL97ZVJSPqJiwv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '1qlYB1RSKs6gQxC3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gb7S0o4zGYY7KQI1' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'AeFgPqaOkvo1aolB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "4lkKB4EYOkQ1jMD3"}' \
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
    --configurationName 'cym8xIfkOVW2grRE' \
    --dsPodName 'OLx0KOww3HICQLfl' \
    --fromTime '7MUBG7qtPu64yAtU' \
    --gameMode 'RKLRkb738HGS6rDg' \
    --isPersistent 'MdIIlhS1fSiM9331' \
    --isSoftDeleted 'm7Ta1PsKc50Kv6ec' \
    --joinability 'nEevcAx2K2zkRenm' \
    --limit '85' \
    --matchPool 'sjUgxBkF6wFPoJeQ' \
    --memberID 'ediogEhhM2rIizGd' \
    --offset '75' \
    --order 'HUTrDzZSKscfOcYu' \
    --orderBy '3dpCROYqUiGKXVFC' \
    --sessionID 'mpo6sPwVOEDSJsEK' \
    --status '5QpNhlI2iS5EpGhh' \
    --statusV2 'vXYck0upMzUYnb76' \
    --toTime 'tFkEORV3bu1bNCtX' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"7W40V6Do5sYadCCF": {}, "rHHC3DpZxkrQDXuN": {}, "FviMarv8mnfHK8CC": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["mE2lPnsbD3SGEdlw", "uUccE536ugBp3HBv", "epnDCjgyJlXe36mg"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WjLfFmteue9nzJ6f' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminKickGameSessionMember \
    --memberId 'T805tVg8JqU0jZpj' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vsugAOS7u8RiWyer' \
    > test.out 2>&1
eval_tap $? 29 'AdminKickGameSessionMember' test.out

#- 30 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'CSa8SRgwsAj1ik1j' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'glaDXTvKCWwNTAhd' \
    --statusType '2wrS0uPdjhdinpng' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateGameSessionMember' test.out

#- 31 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '56' \
    --order 'OqOHi8pWGd1juYhi' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetListNativeSession' test.out

#- 32 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'qjRJOqB5F93zFQbJ' \
    --joinability 'ndUDpdONneAczbBd' \
    --key 'Hb2slt71B1SmZp2J' \
    --leaderID 'Zp50CnPb71ORYcmQ' \
    --limit '3' \
    --memberID 'XAQN0qdskdQV0TqI' \
    --memberStatus '8EFnmDbxIxi4YKlO' \
    --offset '80' \
    --order '6g4iY9u02aCNYIWe' \
    --orderBy 'kp18lOC3mNqF7Bl0' \
    --partyID 'LcghVHfPEspxwhRO' \
    --value 'N0bc1eMbEIjowLqc' \
    > test.out 2>&1
eval_tap $? 32 'AdminQueryParties' test.out

#- 33 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'AdminGetPlatformCredentials' test.out

#- 34 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "3ecjXJbZDKKoxLE1", "clientSecret": "Y3Dymtj3giPg4x4y", "scope": "iPX6ues1Hhhkg1yL"}}' \
    > test.out 2>&1
eval_tap $? 34 'AdminUpdatePlatformCredentials' test.out

#- 35 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'AdminDeletePlatformCredentials' test.out

#- 36 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --userId 'fcYHJbBfAKSiPW3V' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentPlayer' test.out

#- 37 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --userId 'KHaAsmTej52WKi6t' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetRecentTeamPlayer' test.out

#- 38 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ArAURt9plCSVq8Pd' \
    > test.out 2>&1
eval_tap $? 38 'AdminReadSessionStorage' test.out

#- 39 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'H6hJPUAc0RVwXgAg' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteUserSessionStorage' test.out

#- 40 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ntLMCuaXBWQi6BqP' \
    --userId 'g4xr0lCancUZGCHs' \
    > test.out 2>&1
eval_tap $? 40 'AdminReadUserSessionStorage' test.out

#- 41 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'ZYoLfR1KtOv7Zy0b' \
    > test.out 2>&1
eval_tap $? 41 'AdminQueryPlayerAttributes' test.out

#- 42 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '65uvuKNuy0ytZQ7M' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetPlayerAttributes' test.out

#- 43 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId '6Nzy1adnSKOLFKx1' \
    > test.out 2>&1
eval_tap $? 43 'AdminSyncNativeSession' test.out

#- 44 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "dX4LuWJu3pDMUAee", "attributes": {"Z97SBROPYuG6XqP6": {}, "oo7G73zdxTgOfnwI": {}, "dlNa29fDLh741Isl": {}}, "autoJoin": false, "backfillTicketID": "HzGlLKWUtDQs61OQ", "clientVersion": "AoxyyQpRWCiiPDGQ", "configurationName": "hNPEwiJCf2XJVrlz", "customURLGRPC": "qQls1ozhLVA3kE8j", "deployment": "KvgatOEBM70TdlNB", "dsSource": "JYOmpu1VCarzBsV6", "fallbackClaimKeys": ["xnZ5Jrzzjrcaug6C", "WVG8SWP3glU6musw", "VJnNnN7kAa7j0riF"], "inactiveTimeout": 4, "inviteTimeout": 54, "joinability": "5HTHQIoVsGo7dwV9", "matchPool": "DBqFKHQkETJyTlUr", "maxPlayers": 46, "minPlayers": 60, "preferredClaimKeys": ["PYeDcagginxnFIna", "3yddcbsPheTH26IU", "JNvYuGRUvpZaHCuE"], "requestedRegions": ["SOiIZsMfB4ZH3mtg", "WgU4pCAKxeE70Cau", "nQNxot371W9G4AvQ"], "serverName": "kqsGnmyo5JJTUVmb", "storage": {"leader": {"8GEXFTlEMEsFzYqw": {}, "gK1Np5nodqpLm7Fh": {}, "JBNXzAFdO0Khqf6k": {}}}, "teams": [{"parties": [{"partyID": "iTdSGv2LFjAKY7Cb", "userIDs": ["gsWqFWZX7kPBom8F", "9GLLTG8phc3n4iLo", "IllKlpO2pqiXJF3W"]}, {"partyID": "GRaoQomSJC4DdrKF", "userIDs": ["7SUQPLG59e0k5ZtX", "6wK7PpUlcIW32iK7", "MGt1ixY5rA1WoVeJ"]}, {"partyID": "IePF8ZrQzP4zvtdx", "userIDs": ["dbZUpd6FJtHJ1pyV", "wyKQLY6FEO65Rb3z", "7CYLM8IlsHqffnrf"]}], "userIDs": ["sGlfPaZKBwa3Ddb6", "0ufPpzwj1QGIFmlV", "f4jvapseE9LN9bvh"]}, {"parties": [{"partyID": "OrHflIOd6X3viLvt", "userIDs": ["Ek4mTIpUA9gxo8SV", "38nEhoXmM2W7l6jH", "MA2rG3nakopAywel"]}, {"partyID": "u01nryEJ0NqoTow0", "userIDs": ["qiOiC4j0iktm0ZPL", "kLOsp0LZ5njN86Hl", "8kUXzt6bSc6bWvgp"]}, {"partyID": "VyW9dD1kOmvrAejc", "userIDs": ["q2LgkQuaS7RBx3vi", "m02jBOxrZDyvpcLY", "OWA8NjxOnaEok4nO"]}], "userIDs": ["OCzfsflhjbngJOUn", "18G5MlfDTk8aG40N", "lncceIZSwgAIkgzh"]}, {"parties": [{"partyID": "4pTU0Am4DZhl0bQx", "userIDs": ["FJ3sWCqQpQ2FbKPF", "MycMSQ4qfAacR0Lg", "B5BUXvjcu2s6w3Vi"]}, {"partyID": "fnKqmTSoGH1XEfY6", "userIDs": ["QAYn6WQ5UBEU1QAO", "HfZiGhxOdcuDXSxS", "c3aZPV87pna08gxe"]}, {"partyID": "fTYKhuxaEc7M4P7U", "userIDs": ["ckSC6ePeN8i4GrFE", "S9z7xueHpATHccee", "9GXhKcjmSEwdrkEn"]}], "userIDs": ["nqKzFsLfYalUlfwE", "QKjU7eHGebSVu0LQ", "40kepEaC4dfiOMZf"]}], "textChat": true, "ticketIDs": ["5mPYhrLTyU8OhgfY", "9JQYGF4bYXEcENx9", "xZlAchob44lONDDw"], "tieTeamsSessionLifetime": true, "type": "jfIGaffoflEIByYq"}' \
    > test.out 2>&1
eval_tap $? 44 'CreateGameSession' test.out

#- 45 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"eKN0meGelYF5wWaD": {}, "hukU4khGG4vZFTYn": {}, "PkmSu4PWam1jxR7S": {}}' \
    > test.out 2>&1
eval_tap $? 45 'PublicQueryGameSessionsByAttributes' test.out

#- 46 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "ETWjteoc8fgvZDDh"}' \
    > test.out 2>&1
eval_tap $? 46 'PublicSessionJoinCode' test.out

#- 47 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'oO05oKqymxLD1Lcv' \
    > test.out 2>&1
eval_tap $? 47 'GetGameSessionByPodName' test.out

#- 48 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'w6T6mZEiwxxElpMY' \
    > test.out 2>&1
eval_tap $? 48 'GetGameSession' test.out

#- 49 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SWIeVzm7z9noowml' \
    --body '{"attributes": {"TIKVowi0RY2VN4ZO": {}, "NJREdUQ3z9F1BxNN": {}, "gnke4akncw7wu9Tm": {}}, "backfillTicketID": "XfJWBPrx9Ns8eLzY", "clientVersion": "EvwSWTaLQjctvrK2", "deployment": "jhsYpKPlXn77AtYo", "fallbackClaimKeys": ["FzLAATPY8P8P3cfo", "ivvQxevecWw7Rry0", "KK5rgAGO0dW8rX2M"], "inactiveTimeout": 97, "inviteTimeout": 33, "joinability": "UGKSZ4GcLkt4pK32", "matchPool": "sJxlZcCTpTdRtCHv", "maxPlayers": 41, "minPlayers": 28, "preferredClaimKeys": ["k6B6XTmSLyn50sig", "BVZxiKdV57GvRyd9", "UuL02Le8HSCslsDd"], "requestedRegions": ["4M1F5qRIblS7Nz81", "GRazPAANjfBoldFO", "yqA2clJ5gEOaCgM6"], "teams": [{"parties": [{"partyID": "Yn6RugbNEIpGBFUj", "userIDs": ["On5mM7k8nbLzvtCI", "W5ynMKquUicAeIVX", "toWAXhMlW4tLqX7O"]}, {"partyID": "ICf5oD1e6oI9FmYe", "userIDs": ["l0kOw72o8Zkgk0jS", "6rDWUwfhKvrf2AaH", "4yCWrHSppnIZkNnT"]}, {"partyID": "n3rzH5NvAtcvNedg", "userIDs": ["S1fUfKmihDbmu8eP", "WlQMVDXEHeiGTnwy", "Ew6hIWDZrpP7rz3I"]}], "userIDs": ["SW510kHr4isTKWjm", "v67nuHCXWfwnwGio", "VwVzmmBVVFfpqx1A"]}, {"parties": [{"partyID": "eLtzcPJ3jtDYBo4F", "userIDs": ["UTH7CGfKSyxgRR1D", "iCqSMzpqIFGLkDs7", "ACC1RgBfoNrHlFi2"]}, {"partyID": "qJLgmBLE35YhyiDV", "userIDs": ["90SeI5yppBHoytVz", "nCgNyx9fbT63ShEh", "8PbGikLjgjcj34uu"]}, {"partyID": "lU6FYBZsWFbr3RSP", "userIDs": ["0W9nBhvhf8Q0DtJM", "cYQdN66bswAgt65X", "4N1LQZmB61JMdtwC"]}], "userIDs": ["VUrYQue84dwmbwFE", "nAZaWsQJtRYoagRJ", "K5PX9UcOvhPyE11T"]}, {"parties": [{"partyID": "RT2SKseoe8VLie0L", "userIDs": ["Ba36KNzjf005CXNG", "ehQ2aTjTDfKFDXC7", "eGL5YhJDWh9YWqc0"]}, {"partyID": "qgV6d9yOfIMLds2D", "userIDs": ["bPcaoMdtRLTmSvTk", "QQgB7exYvmHMxr5h", "PCJJztJBg0tTJg46"]}, {"partyID": "IewOXE2AkCh3QIZs", "userIDs": ["Uf8lGFXcmwTERHcl", "OdxIwqejxe18rNdb", "8Otq6j1mqUav7k05"]}], "userIDs": ["HAQltnSojV4jT65y", "clX2FtAz0vJjFIYW", "OaNdsimmkW2miH3x"]}], "ticketIDs": ["RHAKy4QxZkaXZ7vm", "iEd0JPxVyQpshaDw", "NqTbbFMXAMfVXe0G"], "tieTeamsSessionLifetime": true, "type": "eMgsRsmH1EQrYmkP", "version": 74}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateGameSession' test.out

#- 50 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 't1mr9EOIFg0dnWIY' \
    > test.out 2>&1
eval_tap $? 50 'DeleteGameSession' test.out

#- 51 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'N2NVL70Iw157g00j' \
    --body '{"attributes": {"r9b8MuYmmeKTmBNv": {}, "GYxEQdf3ewoGGoY7": {}, "xmFNAmjDDCvs78mc": {}}, "backfillTicketID": "MdiS76YApGJ9ufwL", "clientVersion": "YkqIgLuZS6hsQryi", "deployment": "EtOAbpeUNf26UqkC", "fallbackClaimKeys": ["fgCUYBn2xaOBdPF0", "JmX8qwU1cTuHHPB5", "S3DvPRCzBrVUxmDO"], "inactiveTimeout": 19, "inviteTimeout": 56, "joinability": "3cvRFaTC11W0TGTC", "matchPool": "m4fZWuk6pQxDQpKq", "maxPlayers": 47, "minPlayers": 78, "preferredClaimKeys": ["3FbtxfhcRC7IVYa6", "iZ5uFRYNn3SHiWxF", "0YbuU5ar5qTLWUCy"], "requestedRegions": ["0Afgc050XIZRW491", "e94mQjVOOBnIWhun", "ElqZUodp3IhtCSHy"], "teams": [{"parties": [{"partyID": "1ei1fIrPvfHnRN06", "userIDs": ["EjRwEQlNapJRfk4f", "9Zcw1pEHAyNFxcVT", "KuAQTGh5BxjWOozG"]}, {"partyID": "oDtsUuYo5p8ED5QZ", "userIDs": ["AufwNa8lzfjv9oYM", "XMjlVHY1AHwF3vGo", "av7MK0PcLnEkcokK"]}, {"partyID": "wcQ0baDT9OyJ2h23", "userIDs": ["GUS2amU7syGlElXd", "EAOrVSnLocLVVYam", "Qc4wcG5nDBLJoJHb"]}], "userIDs": ["iQ5duE5p4cfs2E41", "cK8QTwiIAvxSvNDl", "mM5nQFMGzs7fzjgy"]}, {"parties": [{"partyID": "c44mEh9tRk8knYSV", "userIDs": ["30lnroQehMDli6t9", "unQLYXxm09wpGAbp", "EmDY9vLh3u6EDsUm"]}, {"partyID": "rV6kH4OotKwG3UC6", "userIDs": ["XCnnZxF8CmQr17W6", "5br34rBBN9tU6TDm", "5GloFSKWM1eym5yd"]}, {"partyID": "C6p25xCWTqUOYZEN", "userIDs": ["J1QHZQxPRXH7uxBJ", "EECQE1li3Bg7Jxc9", "pUnZmvhidwCkZwqj"]}], "userIDs": ["YLfTiCO1NDBvQvRP", "nAz4VzW0CpoBCbyJ", "sF5IjF1c0W338HS6"]}, {"parties": [{"partyID": "CBgVRyihYNZ84CVh", "userIDs": ["ziXV8HwSmvcvcDKF", "19yVRafCjOuSYht8", "3AdvBaagTiRJ8daG"]}, {"partyID": "TVX3Bb7jlz5IfHgK", "userIDs": ["jI9mwJSrN8jkIykR", "2zbaI6PD7fEscShn", "GUGUtV9GJ279GDbL"]}, {"partyID": "Nwjm3FK0nnX2poMf", "userIDs": ["Z1hDHtbh4HtMlFgv", "h2Dp2SoiIPp1yvfA", "HS0VgLu11A3HTovF"]}], "userIDs": ["i4tPAGfleyCA6jEt", "cqsnzoVILjkwW61d", "uF87aUyrdt4XSpWB"]}], "ticketIDs": ["AetsanzqP8oxfrtb", "ECD1CYPwaiBAxfYL", "8Avt70ZUT2fSk3LL"], "tieTeamsSessionLifetime": false, "type": "6tvKgLB9QmJIOq9d", "version": 85}' \
    > test.out 2>&1
eval_tap $? 51 'PatchUpdateGameSession' test.out

#- 52 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'G0WKt4sUmanYxM0U' \
    --body '{"backfillTicketID": "HZVNYzGMNIpWoSLk"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGameSessionBackfillTicketID' test.out

#- 53 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Urfuf4U3WeYeA9t2' \
    > test.out 2>&1
eval_tap $? 53 'GameSessionGenerateCode' test.out

#- 54 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ENKKWrFtHIi1CMgK' \
    > test.out 2>&1
eval_tap $? 54 'PublicRevokeGameSessionCode' test.out

#- 55 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AOG5iDcCR5PbCvDL' \
    --body '{"platformID": "il8wj9cKM3Ar6MF3", "userID": "5hCER4nGmWGgTJfH"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicGameSessionInvite' test.out

#- 56 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lJl4tHGa4XfZcd9C' \
    > test.out 2>&1
eval_tap $? 56 'JoinGameSession' test.out

#- 57 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VnGqMX9FieeEssWE' \
    --body '{"leaderID": "Ul07bhwntCVqiYOJ"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPromoteGameSessionLeader' test.out

#- 58 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'f5KwMZQjzvjSozv6' \
    > test.out 2>&1
eval_tap $? 58 'LeaveGameSession' test.out

#- 59 PublicKickGameSessionMember
./ng net.accelbyte.sdk.cli.Main session publicKickGameSessionMember \
    --memberId 'CTRDl0zp9CzHFwin' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kBNi4gvqgl6TZ9TG' \
    > test.out 2>&1
eval_tap $? 59 'PublicKickGameSessionMember' test.out

#- 60 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VPmv34h6T7Esufmf' \
    > test.out 2>&1
eval_tap $? 60 'PublicGameSessionReject' test.out

#- 61 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xKYB4LM6H6QXmpZ9' \
    > test.out 2>&1
eval_tap $? 61 'GetSessionServerSecret' test.out

#- 62 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'X3fUSR1l9xLPBsmA' \
    --body '{"additionalMembers": [{"partyID": "UrD9L1IiD6MlcEPh", "userIDs": ["MDFzjHZ3sIhzOx2C", "XKlvIomU3pIxM9n8", "D2eLMe3lt9qfx2UD"]}, {"partyID": "cgVE7L9FK6e0MrPc", "userIDs": ["4vtxk9hVKlG56Hlz", "Gr7XjdyRJunZPkp6", "ccIBnWyPw8mj7gyQ"]}, {"partyID": "7XdIszGRj46COPip", "userIDs": ["H1MWVTHG0qHJCWEf", "OJpZm9yEYWNGMy2p", "gSGSUOK68eqGJtWf"]}], "proposedTeams": [{"parties": [{"partyID": "1Ybgg8rdwY9bmrvH", "userIDs": ["mO07KNqX9LM2IwEs", "dOGBXBwnzDX8v3xg", "C1Ge9PdbTTAJ2Gp1"]}, {"partyID": "r0sVZ6LJAOddIL2l", "userIDs": ["3hPjNDKv2LWfXqjr", "8fS79En3wYowBdka", "Z3y6i38XQjLDRqkp"]}, {"partyID": "iFK5BtiQ272Uo9UB", "userIDs": ["JWodpdwsX1jorcyR", "0x3YiHF8ITGPRQBC", "gIs1Q2lzxl0yF5m7"]}], "userIDs": ["7TTh4gUoj8u2WRcL", "iEtzVlnkflfn7pHY", "48F1dl1q92m3iRlf"]}, {"parties": [{"partyID": "nBAk0CwiAsR65yQ9", "userIDs": ["ssuHdGmxncCEr0Kc", "geqzGbruNB72HHMk", "jzyBB4UFKiaoV0VO"]}, {"partyID": "em2yqPsMFxKybPkb", "userIDs": ["uS6x9cLJ1APnNlsa", "2bRBr27fVMWuAfDq", "LMR919IZPKOKiAVQ"]}, {"partyID": "XXOmqFHLbyXmgCNi", "userIDs": ["XH8uenbC5CphgMwe", "exsIAP5vHLjBJ9iq", "McBL4BzhDUjhKPwb"]}], "userIDs": ["wcvQU5kG8bXGFmPA", "nOkDiJq4xQye7Hqn", "VK3YVeOWs9mfVQh3"]}, {"parties": [{"partyID": "jLBtn9pxpE7BYtzB", "userIDs": ["0B4CxyQrUpIFvORx", "Ti79DpSjb39ukcR6", "c2E2r3vk3IfAKEbq"]}, {"partyID": "cNXSGCCvNowNmdpc", "userIDs": ["JgF88ySNq4Mj7mul", "P4tQ6R1OqKVOTniB", "gLsNhdgQ0JWZjNRS"]}, {"partyID": "zOTqcVNX3ahvxw9g", "userIDs": ["wwhTnjN6wKZGW4y3", "f0R9s2kndhhZhwAi", "LsZs4pmLDIQch4Ij"]}], "userIDs": ["Dq9aT3qZyI0rYsWu", "cAkXsVJbXi7eRZa7", "WwIc895ImqK6tVsa"]}], "version": 95}' \
    > test.out 2>&1
eval_tap $? 62 'AppendTeamGameSession' test.out

#- 63 PublicGameSessionCancel
./ng net.accelbyte.sdk.cli.Main session publicGameSessionCancel \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0U4pH16NUsVY21NV' \
    --userId 'Is7NRen2Y3Ns0QJQ' \
    > test.out 2>&1
eval_tap $? 63 'PublicGameSessionCancel' test.out

#- 64 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "eaWytPfds1BYx0Ea"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyJoinCode' test.out

#- 65 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'URydf8ZyyZeHAWGg' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetParty' test.out

#- 66 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JUbUJRMbkcTglbU8' \
    --body '{"attributes": {"6FyOjApNHBVfNOUR": {}, "cjY3YYT9oTynmfIu": {}, "BWgJTNFfM8M0IW4o": {}}, "inactiveTimeout": 9, "inviteTimeout": 45, "joinability": "8KDgy0xZfAcNg14W", "maxPlayers": 37, "minPlayers": 50, "type": "8TIP1LKiFQoLDvum", "version": 11}' \
    > test.out 2>&1
eval_tap $? 66 'PublicUpdateParty' test.out

#- 67 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'O4iKhDcJ7TCcNIsQ' \
    --body '{"attributes": {"3PuppUxDSK8aOTGM": {}, "udcxlCV4cNbJGQ57": {}, "lPdinpjS2DRfGt9G": {}}, "inactiveTimeout": 23, "inviteTimeout": 4, "joinability": "yZVQ4X67tPZSTpPq", "maxPlayers": 84, "minPlayers": 48, "type": "qTAjgqaTHf1ANTJ9", "version": 62}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPatchUpdateParty' test.out

#- 68 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'k997XkGOdC6ItxDT' \
    > test.out 2>&1
eval_tap $? 68 'PublicGeneratePartyCode' test.out

#- 69 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '8p4n4XCFkD1AJLCw' \
    > test.out 2>&1
eval_tap $? 69 'PublicRevokePartyCode' test.out

#- 70 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'szbZxuHSgDOK8bjo' \
    --body '{"platformID": "F7bL2635KbtZTGJp", "userID": "qgl2IzNXGTuQPIDp"}' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyInvite' test.out

#- 71 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'or7t1aJLNNz6QIVC' \
    --body '{"leaderID": "9Mfuc8VOsnmnlVlj"}' \
    > test.out 2>&1
eval_tap $? 71 'PublicPromotePartyLeader' test.out

#- 72 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dWYmELe74p38vumn' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyJoin' test.out

#- 73 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xAnYBTxaTIz0jcgD' \
    > test.out 2>&1
eval_tap $? 73 'PublicPartyLeave' test.out

#- 74 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I8Pkz96vd80msqIm' \
    > test.out 2>&1
eval_tap $? 74 'PublicPartyReject' test.out

#- 75 PublicPartyCancel
./ng net.accelbyte.sdk.cli.Main session publicPartyCancel \
    --namespace "$AB_NAMESPACE" \
    --partyId '5bufnBqrpLeqhwVh' \
    --userId 'jnnjKMEmtbiWsAQH' \
    > test.out 2>&1
eval_tap $? 75 'PublicPartyCancel' test.out

#- 76 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bMrKYi0Zxs5SWCqZ' \
    --userId 'XHLLa31oQf7BULnZ' \
    > test.out 2>&1
eval_tap $? 76 'PublicPartyKick' test.out

#- 77 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"DhutDM6BqguqD5xx": {}, "GxBWtnTKUe2znsqP": {}, "zPkwCBo2SwCUsTag": {}}, "configurationName": "4MLAo3m61P2xaNfm", "inactiveTimeout": 28, "inviteTimeout": 14, "joinability": "Onb1a9gMz0F2UBRm", "maxPlayers": 78, "members": [{"ID": "XDmgNEJBhgGq5GID", "PlatformID": "hNC66szbCCf73IFb", "PlatformUserID": "RkPSSITz4TjCrJHX"}, {"ID": "GXku2YVuOzhxHmnr", "PlatformID": "rV9ZGWrZ05sxe6A6", "PlatformUserID": "RpmKDebNkylbynkg"}, {"ID": "T9vayLLiizac7Ge6", "PlatformID": "zKJdlt7rjF5RaJwv", "PlatformUserID": "kWVco2LTo5ijlvDF"}], "minPlayers": 72, "textChat": true, "type": "9XlYJ8BzP6EUmUXG"}' \
    > test.out 2>&1
eval_tap $? 77 'PublicCreateParty' test.out

#- 78 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 78 'PublicGetRecentPlayer' test.out

#- 79 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    > test.out 2>&1
eval_tap $? 79 'PublicGetRecentTeamPlayer' test.out

#- 80 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '5anIloyj9lhbvuQd' \
    --body '{"W2jwKUckc794ryY9": {}, "1lX8DD4MYXlrJ81l": {}, "Hvv9rqvEoM8YmVjA": {}}' \
    > test.out 2>&1
eval_tap $? 80 'PublicUpdateInsertSessionStorageLeader' test.out

#- 81 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kO3HKsEp6KlqwW4d' \
    --userId 'jrexcbHdEtoQvpV3' \
    --body '{"44RctmTozCi8HeV6": {}, "jbalHmqBBfi7sSF5": {}, "BoGiTCVsXsygWbjE": {}}' \
    > test.out 2>&1
eval_tap $? 81 'PublicUpdateInsertSessionStorage' test.out

#- 82 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["2opXtdsJQeJ1too0", "qvxphTLEEBGTtZyT", "jdKNKgYazujsmSmy"]}' \
    > test.out 2>&1
eval_tap $? 82 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 83 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'PublicGetPlayerAttributes' test.out

#- 84 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "NuhoJM3WWPvvCiCf", "data": {"33ViEdqQpoGkUWNi": {}, "zk5UcPAGv6c1ESC6": {}, "hZYTYZbzf5aANNNs": {}}, "platforms": [{"name": "5kgSZZNUHbIT9szA", "userID": "pmWJO5vzzXZj08a6"}, {"name": "K1XRVfriSpPFnZBJ", "userID": "ZkDnEiyfa2LrnpZx"}, {"name": "NnLRH36bqS2oFY76", "userID": "PU1AziBOHEAj1cT3"}], "roles": ["u6Zc2FbrTFznTgDI", "wZIRWf6T3by2kYSC", "dnFKLc0xcTjqjdcE"], "simultaneousPlatform": "fU61OJYMnW49rWyn"}' \
    > test.out 2>&1
eval_tap $? 84 'PublicStorePlayerAttributes' test.out

#- 85 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'PublicDeletePlayerAttributes' test.out

#- 86 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'p1ck1vT90C6o86cS' \
    --orderBy 'RL9cgbUmulhe98oa' \
    --status 'FKlQicdrxVhrtwSd' \
    > test.out 2>&1
eval_tap $? 86 'PublicQueryMyGameSessions' test.out

#- 87 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '9QWVMYz7TU1TsxsC' \
    --orderBy 'hSclSkb5aBi9K9zy' \
    --status 'v6gFZXI5nXJ7hLi6' \
    > test.out 2>&1
eval_tap $? 87 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE