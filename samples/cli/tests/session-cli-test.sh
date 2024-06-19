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
echo "1..83"

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
    --body '{"regionRetryMapping": {"twYCA9kPI6LZrkq6": ["Dc09nIW0Oaiw9B0D", "7eHpzSn3ZPUdc0qh", "4n8mzZ0m8SAMTwE6"], "I56IaRDBXxyaNoMR": ["6hkspInrAip6lyzS", "xwElFHHdgs21Jub7", "4CUkNmKJfh5pUkHO"], "DpoMF78NY4YkHs1c": ["nz1JSDgY1TXp38zs", "CTCrbCbPOyNQkT7N", "vyE3cwyALczNIicX"]}, "regionURLMapping": ["m7agSrjJW2OQNOs1", "PXhT5FvdiRilZ7oF", "gx4c8OumKtPDKJDX"], "testGameMode": "n7Z4U68su8XfqlqN", "testRegionURLMapping": ["iTvB6SdAdIhUDrwo", "Z5MecdKi5r6QEa1y", "sLEzth6mXhzkzWkF"], "testTargetUserIDs": ["eZSoEAcBdW19m4eu", "6d5tA5jUmiTqpyhP", "FdxLzFQN05MYzYiK"]}' \
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
    --body '{"durationDays": 99}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationAlertV1' test.out

#- 13 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 89}' \
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
    --description 'e5dNRljv7IPrDQQR' \
    --certname 'gat0SevkLGMS0lyu' \
    --file 'tmp.dat' \
    --password 'I9a2I9u6Vpbsx5w8' \
    > test.out 2>&1
eval_tap $? 15 'HandleUploadXboxPFXCertificate' test.out

#- 16 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 15, "PSNSupportedPlatforms": ["fofvnnSuB0y5WUlr", "MdI4sNveabntBSxT", "eIv53HGCiljvjKoy"], "SessionTitle": "D6SCwGrncqmLtjQH", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "f8TgoNm03VLisV6z", "XboxServiceConfigID": "wPuo3td6TC6I3lMj", "XboxSessionTemplateName": "GSWN2laRlxfcjHfY", "XboxTitleID": "akUCTqGkE7wcWfDs", "localizedSessionName": {"lpJSqGAXQ0yYoNRK": {}, "d3IL5TAQ6iiPlSC2": {}, "uE4o5Vwdo3fePqIJ": {}}}, "PSNBaseUrl": "A8IHtrkmu0hpDDWV", "attributes": {"Ala2l5BYNtIuS5S5": {}, "XUdjsoqwGyzzWi9g": {}, "wQYv7t1o7TTr1Dmr": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "Zv15T7quIOvBMcaY", "customURLGRPC": "mvCkGZ5dAgqxpBFm", "deployment": "aLoxozr6wfNPX2bO", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "MvqtlB2jJCSQT279", "enableSecret": false, "fallbackClaimKeys": ["YGu0rdlgdWyOtXi3", "choQrpOsDBU5Sepj", "ChB3V0v52Dlym6pu"], "immutableStorage": true, "inactiveTimeout": 48, "inviteTimeout": 66, "joinability": "oJ8aeCnaLpUKp44Y", "leaderElectionGracePeriod": 96, "manualRejoin": true, "maxActiveSessions": 11, "maxPlayers": 20, "minPlayers": 30, "name": "asWIPUvmEejtGeoy", "persistent": true, "preferredClaimKeys": ["Pa8ZRrvjj7il35MX", "bN9oCMNqq98SjTvh", "ZNkSQ70D0H6BXksU"], "requestedRegions": ["C9b6i5lZC9xv32e8", "c5csSovoqsZNBdte", "9NDUPVJf6c2Z0QZx"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "2WDgCcxvONZm3EeE"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --name 'RHpKKTlmVr9XuoJb' \
    --offset '89' \
    --order 'vneSD2Tb3g7mSQUh' \
    --orderBy 'AEtrmjqU6YE3p4lS' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'ck0ZHn5GI39YBHqa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'THeKtW18iGeUlc9d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 5, "PSNSupportedPlatforms": ["sogWa24CKNS0GqVv", "UfHQvsHXNUNe4mhg", "o5QB65lSAiYnNjkf"], "SessionTitle": "ZrQvGgbLdLsFzHkB", "ShouldSync": true, "XboxAllowCrossPlatform": true, "XboxSandboxID": "DxHSZjtqXyJ58f7G", "XboxServiceConfigID": "c26SaiGVkydwYWQG", "XboxSessionTemplateName": "26yUZNmTBcvrbYCw", "XboxTitleID": "ZtxFHyPLtI8ilbyD", "localizedSessionName": {"PUIj88cekdqCt81P": {}, "1ktfIovmv9gsR5cJ": {}, "cHm3SZLxoRDFuuuy": {}}}, "PSNBaseUrl": "Sj29a9LJE8HoRS1X", "attributes": {"2PFAAMwzHPxB1Usk": {}, "Ys4Yw20DOqOBSC2D": {}, "KHRuPMMWH8Yb33T5": {}}, "autoJoin": false, "autoLeaveSession": true, "clientVersion": "J5i0EeDxOgBnhhqE", "customURLGRPC": "lIaDml48wdNFLTm5", "deployment": "T50x9WT0GfH2rtOa", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "RE2w1yEkLgh3tIYt", "enableSecret": true, "fallbackClaimKeys": ["SqYUTLDx9gIiDand", "pGT2t24aOMh5eC3I", "HeHSKLCa3xreNDUW"], "immutableStorage": false, "inactiveTimeout": 25, "inviteTimeout": 15, "joinability": "x40NLRc6m8heKnWh", "leaderElectionGracePeriod": 51, "manualRejoin": false, "maxActiveSessions": 11, "maxPlayers": 9, "minPlayers": 52, "name": "2NubeoKFeIaFQCYo", "persistent": true, "preferredClaimKeys": ["Yk6QEgJjBbEDoNf3", "n0hEoRCAcf80zfFy", "abWAgIUXiI07A68e"], "requestedRegions": ["aqC2J9jyEW6GLbc0", "NaKDUL3sa13lk1dQ", "BHO86IlBhnetU4Rw"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "UXlTDBzOuYsaZA2y"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'yd4mbqoOfADMMAXF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'aY9eKa699bRVhyaK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wwrAP2aMlu7WtjCt' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'oYetOO847g8OudOf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "jnCuHZ3c46IjGa23"}' \
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
    --configurationName 'YvYmmDg7VYPXIuvU' \
    --dsPodName 'YTZBRujIUE1Tq5jy' \
    --fromTime 'AZvkRCMNFIurjh2i' \
    --gameMode 'mdb4rbkXj0ZwsVC0' \
    --isPersistent 'gL97ZVJSPqJiwv1q' \
    --isSoftDeleted 'lYB1RSKs6gQxC3Gb' \
    --joinability '7S0o4zGYY7KQI1Ae' \
    --limit '64' \
    --matchPool 'MbqqZtfNWql4nmwA' \
    --memberID 'ft4gqkNNlWkD9eOz' \
    --offset '17' \
    --order '8xIfkOVW2grREOLx' \
    --orderBy '0KOww3HICQLfl7MU' \
    --sessionID 'BG7qtPu64yAtURKL' \
    --status 'Rkb738HGS6rDgMdI' \
    --statusV2 'IlhS1fSiM9331m7T' \
    --toTime 'a1PsKc50Kv6ecnEe' \
    > test.out 2>&1
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"vcAx2K2zkRenmPZn": {}, "GBt4P7WnbdSJtjX7": {}, "ZshZyZl5x4bRXBHU": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["TrDzZSKscfOcYu3d", "pCROYqUiGKXVFCmp", "o6sPwVOEDSJsEK5Q"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pNhlI2iS5EpGhhvX' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'ck0upMzUYnb76tFk' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EORV3bu1bNCtX7W4' \
    --statusType '0V6Do5sYadCCFrHH' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateGameSessionMember' test.out

#- 30 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '42' \
    --order '3DpZxkrQDXuNFviM' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetListNativeSession' test.out

#- 31 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --isSoftDeleted 'arv8mnfHK8CCmE2l' \
    --joinability 'PnsbD3SGEdlwuUcc' \
    --key 'E536ugBp3HBvepnD' \
    --leaderID 'CjgyJlXe36mgWjLf' \
    --limit '64' \
    --memberID '09xbnGezKsDwG2om' \
    --memberStatus 'OR2nvYI9TVqJdvzc' \
    --offset '100' \
    --order 'ugAOS7u8RiWyerCS' \
    --orderBy 'a8SRgwsAj1ik1jgl' \
    --partyID 'aDXTvKCWwNTAhd2w' \
    --value 'rS0uPdjhdinpng5B' \
    > test.out 2>&1
eval_tap $? 31 'AdminQueryParties' test.out

#- 32 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlatformCredentials' test.out

#- 33 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "Ly8wbhMssAHjapIk", "clientSecret": "Y9Rf4wP57dBZNR88", "scope": "YbCtmKy8M9zVrjfG"}}' \
    > test.out 2>&1
eval_tap $? 33 'AdminUpdatePlatformCredentials' test.out

#- 34 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'AdminDeletePlatformCredentials' test.out

#- 35 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --userId 'ZnqAQUoY1GjlIIk0' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetRecentPlayer' test.out

#- 36 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --userId '50CnPb71ORYcmQbT' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentTeamPlayer' test.out

#- 37 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'U5JX8ccLjMXJRk0e' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadSessionStorage' test.out

#- 38 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aKQDOJvrTefglSs6' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteUserSessionStorage' test.out

#- 39 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'g4iY9u02aCNYIWek' \
    --userId 'p18lOC3mNqF7Bl0L' \
    > test.out 2>&1
eval_tap $? 39 'AdminReadUserSessionStorage' test.out

#- 40 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'cghVHfPEspxwhRON' \
    > test.out 2>&1
eval_tap $? 40 'AdminQueryPlayerAttributes' test.out

#- 41 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '0bc1eMbEIjowLqc3' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetPlayerAttributes' test.out

#- 42 AdminSyncNativeSession
./ng net.accelbyte.sdk.cli.Main session adminSyncNativeSession \
    --namespace "$AB_NAMESPACE" \
    --userId 'ecjXJbZDKKoxLE1Y' \
    > test.out 2>&1
eval_tap $? 42 'AdminSyncNativeSession' test.out

#- 43 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"3Dymtj3giPg4x4yi": {}, "PX6ues1Hhhkg1yLV": {}, "bLFzHEP8cM4NTwr0": {}}, "autoJoin": true, "backfillTicketID": "HaAsmTej52WKi6tA", "clientVersion": "rAURt9plCSVq8PdH", "configurationName": "6hJPUAc0RVwXgAgn", "customURLGRPC": "tLMCuaXBWQi6BqPg", "deployment": "4xr0lCancUZGCHsZ", "dsSource": "YoLfR1KtOv7Zy0b6", "fallbackClaimKeys": ["5uvuKNuy0ytZQ7M6", "Nzy1adnSKOLFKx1d", "X4LuWJu3pDMUAeeZ"], "inactiveTimeout": 53, "inviteTimeout": 92, "joinability": "QKFlAVmVLu4AOec0", "matchPool": "z8eBeeoip68J1nsv", "maxPlayers": 100, "minPlayers": 12, "preferredClaimKeys": ["OJhtafxMSJlHeb34", "sZKHcl5LLLOexL4f", "ZvWtND2tcBFpX8lN"], "requestedRegions": ["tFEJ7tnkY6Mca5af", "j12K2IzrBvvWm4ud", "E0OXudXgNne8kJAT"], "serverName": "wlc6esUp6Sw1I98j", "teams": [{"UserIDs": ["eZQ7hfxnhLd3Knak", "noed9DHhLOqQGhCU", "r6iTrjyEgarAdNJO"], "parties": [{"partyID": "IG36I6tRbRcrEveM", "userIDs": ["dAdiPKDUVSC00PYe", "DcagginxnFIna3yd", "dcbsPheTH26IUJNv"]}, {"partyID": "YuGRUvpZaHCuESOi", "userIDs": ["IZsMfB4ZH3mtgWgU", "4pCAKxeE70CaunQN", "xot371W9G4AvQkqs"]}, {"partyID": "Gnmyo5JJTUVmb8GE", "userIDs": ["XFTlEMEsFzYqwgK1", "Np5nodqpLm7FhJBN", "XzAFdO0Khqf6kiTd"]}]}, {"UserIDs": ["SGv2LFjAKY7CbgsW", "qFWZX7kPBom8F9GL", "LTG8phc3n4iLoIll"], "parties": [{"partyID": "KlpO2pqiXJF3WGRa", "userIDs": ["oQomSJC4DdrKF7SU", "QPLG59e0k5ZtX6wK", "7PpUlcIW32iK7MGt"]}, {"partyID": "1ixY5rA1WoVeJIeP", "userIDs": ["F8ZrQzP4zvtdxdbZ", "Upd6FJtHJ1pyVwyK", "QLY6FEO65Rb3z7CY"]}, {"partyID": "LM8IlsHqffnrfsGl", "userIDs": ["fPaZKBwa3Ddb60uf", "Ppzwj1QGIFmlVf4j", "vapseE9LN9bvhOrH"]}]}, {"UserIDs": ["flIOd6X3viLvtEk4", "mTIpUA9gxo8SV38n", "EhoXmM2W7l6jHMA2"], "parties": [{"partyID": "rG3nakopAywelu01", "userIDs": ["nryEJ0NqoTow0qiO", "iC4j0iktm0ZPLkLO", "sp0LZ5njN86Hl8kU"]}, {"partyID": "Xzt6bSc6bWvgpVyW", "userIDs": ["9dD1kOmvrAejcq2L", "gkQuaS7RBx3vim02", "jBOxrZDyvpcLYOWA"]}, {"partyID": "8NjxOnaEok4nOOCz", "userIDs": ["fsflhjbngJOUn18G", "5MlfDTk8aG40Nlnc", "ceIZSwgAIkgzh4pT"]}]}], "textChat": false, "ticketIDs": ["0Am4DZhl0bQxFJ3s", "WCqQpQ2FbKPFMycM", "SQ4qfAacR0LgB5BU"], "tieTeamsSessionLifetime": false, "type": "vjcu2s6w3VifnKqm"}' \
    > test.out 2>&1
eval_tap $? 43 'CreateGameSession' test.out

#- 44 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"TSoGH1XEfY6QAYn6": {}, "WQ5UBEU1QAOHfZiG": {}, "hxOdcuDXSxSc3aZP": {}}' \
    > test.out 2>&1
eval_tap $? 44 'PublicQueryGameSessionsByAttributes' test.out

#- 45 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "V87pna08gxefTYKh"}' \
    > test.out 2>&1
eval_tap $? 45 'PublicSessionJoinCode' test.out

#- 46 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'uxaEc7M4P7UckSC6' \
    > test.out 2>&1
eval_tap $? 46 'GetGameSessionByPodName' test.out

#- 47 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ePeN8i4GrFES9z7x' \
    > test.out 2>&1
eval_tap $? 47 'GetGameSession' test.out

#- 48 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ueHpATHccee9GXhK' \
    --body '{"attributes": {"cjmSEwdrkEnnqKzF": {}, "sLfYalUlfwEQKjU7": {}, "eHGebSVu0LQ40kep": {}}, "backfillTicketID": "EaC4dfiOMZfEhHr3", "clientVersion": "9pysFO3Zvc1BZG99", "deployment": "LyvfvHEsJKQQewVL", "fallbackClaimKeys": ["MUoAnaRcYp7FUjfI", "GaffoflEIByYqeKN", "0meGelYF5wWaDhuk"], "inactiveTimeout": 96, "inviteTimeout": 98, "joinability": "4khGG4vZFTYnPkmS", "matchPool": "u4PWam1jxR7SETWj", "maxPlayers": 40, "minPlayers": 47, "preferredClaimKeys": ["eoc8fgvZDDhoO05o", "KqymxLD1Lcvw6T6m", "ZEiwxxElpMYSWIeV"], "requestedRegions": ["zm7z9noowmlTIKVo", "wi0RY2VN4ZONJREd", "UQ3z9F1BxNNgnke4"], "teams": [{"UserIDs": ["akncw7wu9TmXfJWB", "Prx9Ns8eLzYEvwSW", "TaLQjctvrK2jhsYp"], "parties": [{"partyID": "KPlXn77AtYoFzLAA", "userIDs": ["TPY8P8P3cfoivvQx", "evecWw7Rry0KK5rg", "AGO0dW8rX2MVUGKS"]}, {"partyID": "Z4GcLkt4pK32sJxl", "userIDs": ["ZcCTpTdRtCHvuk6B", "6XTmSLyn50sigBVZ", "xiKdV57GvRyd9UuL"]}, {"partyID": "02Le8HSCslsDd4M1", "userIDs": ["F5qRIblS7Nz81GRa", "zPAANjfBoldFOyqA", "2clJ5gEOaCgM6Yn6"]}]}, {"UserIDs": ["RugbNEIpGBFUjOn5", "mM7k8nbLzvtCIW5y", "nMKquUicAeIVXtoW"], "parties": [{"partyID": "AXhMlW4tLqX7OICf", "userIDs": ["5oD1e6oI9FmYel0k", "Ow72o8Zkgk0jS6rD", "WUwfhKvrf2AaH4yC"]}, {"partyID": "WrHSppnIZkNnTn3r", "userIDs": ["zH5NvAtcvNedgS1f", "UfKmihDbmu8ePWlQ", "MVDXEHeiGTnwyEw6"]}, {"partyID": "hIWDZrpP7rz3ISW5", "userIDs": ["10kHr4isTKWjmv67", "nuHCXWfwnwGioVwV", "zmmBVVFfpqx1AeLt"]}]}, {"UserIDs": ["zcPJ3jtDYBo4FUTH", "7CGfKSyxgRR1DiCq", "SMzpqIFGLkDs7ACC"], "parties": [{"partyID": "1RgBfoNrHlFi2qJL", "userIDs": ["gmBLE35YhyiDV90S", "eI5yppBHoytVznCg", "Nyx9fbT63ShEh8Pb"]}, {"partyID": "GikLjgjcj34uulU6", "userIDs": ["FYBZsWFbr3RSP0W9", "nBhvhf8Q0DtJMcYQ", "dN66bswAgt65X4N1"]}, {"partyID": "LQZmB61JMdtwCVUr", "userIDs": ["YQue84dwmbwFEnAZ", "aWsQJtRYoagRJK5P", "X9UcOvhPyE11TRT2"]}]}], "ticketIDs": ["SKseoe8VLie0LBa3", "6KNzjf005CXNGehQ", "2aTjTDfKFDXC7eGL"], "tieTeamsSessionLifetime": true, "type": "YhJDWh9YWqc0qgV6", "version": 8}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateGameSession' test.out

#- 49 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2kNjCMDtDMrentgn' \
    > test.out 2>&1
eval_tap $? 49 'DeleteGameSession' test.out

#- 50 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3DhqciwIeShF9RKb' \
    --body '{"attributes": {"9vvxuJlhXbWhbwPw": {}, "ToC6knjVwVnzaqSf": {}, "JiQFC2gXoda0kg16": {}}, "backfillTicketID": "yUSpSOAjHJWwfCjY", "clientVersion": "wWkLob9gKLqs2nEZ", "deployment": "hpByfHZinxNfgPAw", "fallbackClaimKeys": ["kMBsznlBUqnLT4Ab", "GptKaWNvPbpg7yrR", "vXfZ6rvgvEY3Hht1"], "inactiveTimeout": 91, "inviteTimeout": 46, "joinability": "QxZkaXZ7vmiEd0JP", "matchPool": "xVyQpshaDwNqTbbF", "maxPlayers": 80, "minPlayers": 5, "preferredClaimKeys": ["AMfVXe0GZeMgsRsm", "H1EQrYmkPKTPOlhT", "tSiZNCxuogFteTHJ"], "requestedRegions": ["e4BhSSQkQD6WmOt6", "D7ufFVTOhvQpfbBk", "e8aEdd36xj6wySol"], "teams": [{"UserIDs": ["tDxsbzxrlaKEfkoY", "jY2o6ouRW9UtNquw", "C3WgumrIz4NhGztZ"], "parties": [{"partyID": "pr4U4fwQIiLXgmRa", "userIDs": ["svjO4lj8m3XEwP2b", "4gd3xOeii8Jnmsse", "p2xD2NY0kABeGs9y"]}, {"partyID": "xahld1pO0Gyf5PO3", "userIDs": ["COyMvczgEpzZ3Fbt", "xfhcRC7IVYa6iZ5u", "FRYNn3SHiWxF0Ybu"]}, {"partyID": "U5ar5qTLWUCy0Afg", "userIDs": ["c050XIZRW491e94m", "QjVOOBnIWhunElqZ", "Uodp3IhtCSHy1ei1"]}]}, {"UserIDs": ["fIrPvfHnRN06EjRw", "EQlNapJRfk4f9Zcw", "1pEHAyNFxcVTKuAQ"], "parties": [{"partyID": "TGh5BxjWOozGoDts", "userIDs": ["UuYo5p8ED5QZAufw", "Na8lzfjv9oYMXMjl", "VHY1AHwF3vGoav7M"]}, {"partyID": "K0PcLnEkcokKwcQ0", "userIDs": ["baDT9OyJ2h23GUS2", "amU7syGlElXdEAOr", "VSnLocLVVYamQc4w"]}, {"partyID": "cG5nDBLJoJHbiQ5d", "userIDs": ["uE5p4cfs2E41cK8Q", "TwiIAvxSvNDlmM5n", "QFMGzs7fzjgyc44m"]}]}, {"UserIDs": ["Eh9tRk8knYSV30ln", "roQehMDli6t9unQL", "YXxm09wpGAbpEmDY"], "parties": [{"partyID": "9vLh3u6EDsUmrV6k", "userIDs": ["H4OotKwG3UC6XCnn", "ZxF8CmQr17W65br3", "4rBBN9tU6TDm5Glo"]}, {"partyID": "FSKWM1eym5ydC6p2", "userIDs": ["5xCWTqUOYZENJ1QH", "ZQxPRXH7uxBJEECQ", "E1li3Bg7Jxc9pUnZ"]}, {"partyID": "mvhidwCkZwqjYLfT", "userIDs": ["iCO1NDBvQvRPnAz4", "VzW0CpoBCbyJsF5I", "jF1c0W338HS6CBgV"]}]}], "ticketIDs": ["RyihYNZ84CVhziXV", "8HwSmvcvcDKF19yV", "RafCjOuSYht83Adv"], "tieTeamsSessionLifetime": true, "type": "SvDwuOrP9lzpiX0V", "version": 41}' \
    > test.out 2>&1
eval_tap $? 50 'PatchUpdateGameSession' test.out

#- 51 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'b7jlz5IfHgKjI9mw' \
    --body '{"backfillTicketID": "JSrN8jkIykR2zbaI"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateGameSessionBackfillTicketID' test.out

#- 52 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6PD7fEscShnGUGUt' \
    > test.out 2>&1
eval_tap $? 52 'GameSessionGenerateCode' test.out

#- 53 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'V9GJ279GDbLNwjm3' \
    > test.out 2>&1
eval_tap $? 53 'PublicRevokeGameSessionCode' test.out

#- 54 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FK0nnX2poMfZ1hDH' \
    --body '{"platformID": "tbh4HtMlFgvh2Dp2", "userID": "SoiIPp1yvfAHS0Vg"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicGameSessionInvite' test.out

#- 55 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Lu11A3HTovFi4tPA' \
    > test.out 2>&1
eval_tap $? 55 'JoinGameSession' test.out

#- 56 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GfleyCA6jEtcqsnz' \
    --body '{"leaderID": "oVILjkwW61duF87a"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPromoteGameSessionLeader' test.out

#- 57 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Uyrdt4XSpWBAetsa' \
    > test.out 2>&1
eval_tap $? 57 'LeaveGameSession' test.out

#- 58 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nzqP8oxfrtbECD1C' \
    > test.out 2>&1
eval_tap $? 58 'PublicGameSessionReject' test.out

#- 59 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YPwaiBAxfYL8Avt7' \
    > test.out 2>&1
eval_tap $? 59 'GetSessionServerSecret' test.out

#- 60 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0ZUT2fSk3LL0calq' \
    --body '{"additionalMembers": [{"partyID": "xEewuGS469k2hG0W", "userIDs": ["Kt4sUmanYxM0UHZV", "NYzGMNIpWoSLkUrf", "uf4U3WeYeA9t2ENK"]}, {"partyID": "KWrFtHIi1CMgKAOG", "userIDs": ["5iDcCR5PbCvDLil8", "wj9cKM3Ar6MF35hC", "ER4nGmWGgTJfHlJl"]}, {"partyID": "4tHGa4XfZcd9CVnG", "userIDs": ["qMX9FieeEssWEUl0", "7bhwntCVqiYOJf5K", "wMZQjzvjSozv6CTR"]}], "proposedTeams": [{"UserIDs": ["Dl0zp9CzHFwinkBN", "i4gvqgl6TZ9TGVPm", "v34h6T7EsufmfxKY"], "parties": [{"partyID": "B4LM6H6QXmpZ9X3f", "userIDs": ["USR1l9xLPBsmAUrD", "9L1IiD6MlcEPhMDF", "zjHZ3sIhzOx2CXKl"]}, {"partyID": "vIomU3pIxM9n8D2e", "userIDs": ["LMe3lt9qfx2UDcgV", "E7L9FK6e0MrPc4vt", "xk9hVKlG56HlzGr7"]}, {"partyID": "XjdyRJunZPkp6ccI", "userIDs": ["BnWyPw8mj7gyQ7Xd", "IszGRj46COPipH1M", "WVTHG0qHJCWEfOJp"]}]}, {"UserIDs": ["Zm9yEYWNGMy2pgSG", "SUOK68eqGJtWf1Yb", "gg8rdwY9bmrvHmO0"], "parties": [{"partyID": "7KNqX9LM2IwEsdOG", "userIDs": ["BXBwnzDX8v3xgC1G", "e9PdbTTAJ2Gp1r0s", "VZ6LJAOddIL2l3hP"]}, {"partyID": "jNDKv2LWfXqjr8fS", "userIDs": ["79En3wYowBdkaZ3y", "6i38XQjLDRqkpiFK", "5BtiQ272Uo9UBJWo"]}, {"partyID": "dpdwsX1jorcyR0x3", "userIDs": ["YiHF8ITGPRQBCgIs", "1Q2lzxl0yF5m77TT", "h4gUoj8u2WRcLiEt"]}]}, {"UserIDs": ["zVlnkflfn7pHY48F", "1dl1q92m3iRlfnBA", "k0CwiAsR65yQ9ssu"], "parties": [{"partyID": "HdGmxncCEr0Kcgeq", "userIDs": ["zGbruNB72HHMkjzy", "BB4UFKiaoV0VOem2", "yqPsMFxKybPkbuS6"]}, {"partyID": "x9cLJ1APnNlsa2bR", "userIDs": ["Br27fVMWuAfDqLMR", "919IZPKOKiAVQXXO", "mqFHLbyXmgCNiXH8"]}, {"partyID": "uenbC5CphgMweexs", "userIDs": ["IAP5vHLjBJ9iqMcB", "L4BzhDUjhKPwbwcv", "QU5kG8bXGFmPAnOk"]}]}], "version": 60}' \
    > test.out 2>&1
eval_tap $? 60 'AppendTeamGameSession' test.out

#- 61 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "66OzOj84O6tgohjt"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPartyJoinCode' test.out

#- 62 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'C7bzjPpucddXJ5zi' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetParty' test.out

#- 63 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'fF8y959anrNSleyw' \
    --body '{"attributes": {"HbHig6IKWVZ77KeR": {}, "WdECaFGzfZ2hxcJ2": {}, "Fnemn7M23SzUo4hN": {}}, "inactiveTimeout": 56, "inviteTimeout": 67, "joinability": "Dh9ZFP1OW0nXOErQ", "maxPlayers": 85, "minPlayers": 50, "type": "S4VsRoYIK69yg9AD", "version": 59}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateParty' test.out

#- 64 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '1OqKVOTniBgLsNhd' \
    --body '{"attributes": {"gQ0JWZjNRSzOTqcV": {}, "NX3ahvxw9gwwhTnj": {}, "N6wKZGW4y3f0R9s2": {}}, "inactiveTimeout": 20, "inviteTimeout": 57, "joinability": "ndhhZhwAiLsZs4pm", "maxPlayers": 77, "minPlayers": 60, "type": "76dGGJwJ00UH197M", "version": 72}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPatchUpdateParty' test.out

#- 65 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'I0rYsWucAkXsVJbX' \
    > test.out 2>&1
eval_tap $? 65 'PublicGeneratePartyCode' test.out

#- 66 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'i7eRZa7WwIc895Im' \
    > test.out 2>&1
eval_tap $? 66 'PublicRevokePartyCode' test.out

#- 67 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qK6tVsaUq3stUh5J' \
    --body '{"platformID": "5Z9GiBiSAylX5cS0", "userID": "IeHpWCugmfOL0QQp"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyInvite' test.out

#- 68 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xsuD8PGqku59eFJr' \
    --body '{"leaderID": "OXyDYz9vMUOPG0iH"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicPromotePartyLeader' test.out

#- 69 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DT8QbF7gHPTPQbvL' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyJoin' test.out

#- 70 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 't2NRqJGIKzLyH1y7' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyLeave' test.out

#- 71 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '2L13Ornyx34luLdv' \
    > test.out 2>&1
eval_tap $? 71 'PublicPartyReject' test.out

#- 72 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tsTKXMjiw6gYPvfn' \
    --userId '2Qt9iyq3Nyk8ncu2' \
    > test.out 2>&1
eval_tap $? 72 'PublicPartyKick' test.out

#- 73 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Z3eDHH9WaVO4iKhD": {}, "cJ7TCcNIsQ3PuppU": {}, "xDSK8aOTGMudcxlC": {}}, "configurationName": "V4cNbJGQ57lPdinp", "inactiveTimeout": 18, "inviteTimeout": 6, "joinability": "S2DRfGt9GlyZVQ4X", "maxPlayers": 94, "members": [{"ID": "7tPZSTpPq3xjrElv", "PlatformID": "vDgw0ag7kSWE0Hiq", "PlatformUserID": "m5IuLryiEXqvUWDj"}, {"ID": "U1G0EVjVZw1ToLuP", "PlatformID": "akQN1MpOs1RVFrcg", "PlatformUserID": "2CXxepx78fvsyhE2"}, {"ID": "BKtyTDSIM7mkmvZ7", "PlatformID": "Cmsh4US8o4jfMANP", "PlatformUserID": "pmZDdMiCxmuCCVuF"}], "minPlayers": 20, "textChat": false, "type": "1GC1d2b92B4vEgj3"}' \
    > test.out 2>&1
eval_tap $? 73 'PublicCreateParty' test.out

#- 74 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    > test.out 2>&1
eval_tap $? 74 'PublicGetRecentPlayer' test.out

#- 75 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    > test.out 2>&1
eval_tap $? 75 'PublicGetRecentTeamPlayer' test.out

#- 76 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OmhcWm428XejRF94' \
    --body '{"NIY9nMrBZo0lNUBD": {}, "ShHD32vvL28FPwTi": {}, "XfLcxDC9Ynd02mEC": {}}' \
    > test.out 2>&1
eval_tap $? 76 'PublicUpdateInsertSessionStorageLeader' test.out

#- 77 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IQhfIhHtADUQ9zim' \
    --userId 'QTQT95pFJUAJsyAf' \
    --body '{"eKOufV4f15NohXu6": {}, "opxQGRt6PqlkL0di": {}, "RhLC10ih2EQfY3XC": {}}' \
    > test.out 2>&1
eval_tap $? 77 'PublicUpdateInsertSessionStorage' test.out

#- 78 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["v4hdOa6FdZhNMd1o", "nFjGRbxtABPXDmgN", "EJBhgGq5GIDhNC66"]}' \
    > test.out 2>&1
eval_tap $? 78 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 79 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'PublicGetPlayerAttributes' test.out

#- 80 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "0n0BAZkwbYkBLyO6", "data": {"A0FqfhnaB3YxKNdO": {}, "TacCcJfIfXshuLUk": {}, "5WdpxjZx5noXPhPU": {}}, "platforms": [{"name": "TKbonoucNmzwOZOK", "userID": "56sDkci5rZ8iMlOu"}, {"name": "ksQJCiRFiZWwJ7Nr", "userID": "Tb1XTB9YQzUJ9XlY"}, {"name": "J8BzP6EUmUXGM5an", "userID": "Iloyj9lhbvuQdW2j"}], "roles": ["wKUckc794ryY91lX", "8DD4MYXlrJ81lHvv", "9rqvEoM8YmVjAkO3"], "simultaneousPlatform": "HKsEp6KlqwW4djre"}' \
    > test.out 2>&1
eval_tap $? 80 'PublicStorePlayerAttributes' test.out

#- 81 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'PublicDeletePlayerAttributes' test.out

#- 82 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'xcbHdEtoQvpV344R' \
    --orderBy 'ctmTozCi8HeV6jba' \
    --status 'lHmqBBfi7sSF5BoG' \
    > test.out 2>&1
eval_tap $? 82 'PublicQueryMyGameSessions' test.out

#- 83 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'iTCVsXsygWbjE2op' \
    --orderBy 'XtdsJQeJ1too0qvx' \
    --status 'phTLEEBGTtZyTjdK' \
    > test.out 2>&1
eval_tap $? 83 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE