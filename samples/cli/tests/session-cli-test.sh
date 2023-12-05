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
echo "1..75"

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

#- 4 AdminGetDSMCConfigurationDefault
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfigurationDefault \
    > test.out 2>&1
eval_tap $? 4 'AdminGetDSMCConfigurationDefault' test.out

#- 5 AdminListEnvironmentVariables
./ng net.accelbyte.sdk.cli.Main session adminListEnvironmentVariables \
    > test.out 2>&1
eval_tap $? 5 'AdminListEnvironmentVariables' test.out

#- 6 AdminListGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminListGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 6 'AdminListGlobalConfiguration' test.out

#- 7 AdminUpdateGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminUpdateGlobalConfiguration \
    --body '{"regionRetryMapping": {"EAxcVpFrttufHIRd": ["H9UzVRiXbqlAw7r6", "W2ktQG0h5JAav5kR", "a62WopBJHPtcDs8b"], "BZLCXLx8bbgorQeF": ["bQ1g7qbPngUNB1vR", "odwpzS6DaDpv8N7Z", "QVqGj6oDLjWjkY1a"], "XlFcDtgOjchIua5t": ["WEIC32ogW7olvbTg", "rhRTcPiSuL0Sly6X", "M4OI18mAQLnzjMf8"]}, "regionURLMapping": ["GZ2WBZqxYG3aREAu", "2D6QVKNCWP75TB0i", "7pKxR8dl0zRVW4EZ"], "testGameMode": "G9m0XcgGVbMqSszE", "testRegionURLMapping": ["8GHavj7AorKsxwko", "sAVerXpc1C8XfwHu", "Keb9l3rGN9A3sNm8"], "testTargetUserIDs": ["4hddSpHt0P7MIIR7", "CkyF6C7duuyZ0GhD", "ogqrhBRd8lDR6qVN"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateGlobalConfiguration' test.out

#- 8 AdminDeleteGlobalConfiguration
./ng net.accelbyte.sdk.cli.Main session adminDeleteGlobalConfiguration \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteGlobalConfiguration' test.out

#- 9 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetConfigurationAlertV1' test.out

#- 10 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 85}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateConfigurationAlertV1' test.out

#- 11 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 99}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateConfigurationAlertV1' test.out

#- 12 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteConfigurationAlertV1' test.out

#- 13 HandleUploadXboxPFXCertificate
./ng net.accelbyte.sdk.cli.Main session handleUploadXboxPFXCertificate \
    --namespace "$AB_NAMESPACE" \
    --description 'RZYdFLIAjGGJddVC' \
    --certname 'vu9vx5KQ7KYnIuMB' \
    --file 'tmp.dat' \
    --password 'vaO35llzQRaT5kPx' \
    > test.out 2>&1
eval_tap $? 13 'HandleUploadXboxPFXCertificate' test.out

#- 14 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 96, "PSNSupportedPlatforms": ["hqUI06UpOXGSLmCV", "uHOPlLlkvR8sKgnu", "RkgghGoYupD391C2"], "SessionTitle": "qtPYokahFjkQsfCa", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "f8TgoNm03VLisV6z", "XboxServiceConfigID": "wPuo3td6TC6I3lMj", "XboxSessionTemplateName": "GSWN2laRlxfcjHfY", "XboxTitleID": "akUCTqGkE7wcWfDs", "localizedSessionName": {"lpJSqGAXQ0yYoNRK": {}, "d3IL5TAQ6iiPlSC2": {}, "uE4o5Vwdo3fePqIJ": {}}}, "PSNBaseUrl": "A8IHtrkmu0hpDDWV", "attributes": {"Ala2l5BYNtIuS5S5": {}, "XUdjsoqwGyzzWi9g": {}, "wQYv7t1o7TTr1Dmr": {}}, "autoJoin": false, "clientVersion": "os9Jcdos4fYcTVU6", "deployment": "RBt0zYoMcHyCUEXl", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "vxJMdalwSyliWMNW", "enableSecret": true, "fallbackClaimKeys": ["NyLu0M3VHh2EI8Jl", "DbPWbQ6Q9lNmqRBa", "AkLnvxkT1X68cmDc"], "immutableStorage": false, "inactiveTimeout": 9, "inviteTimeout": 48, "joinability": "pjChB3V0v52Dlym6", "maxActiveSessions": 31, "maxPlayers": 75, "minPlayers": 41, "name": "XNB3Gv0IqmF51Tkh", "persistent": false, "preferredClaimKeys": ["p44YUDjasWIPUvmE", "ejtGeoyIPa8ZRrvj", "j7il35MXbN9oCMNq"], "requestedRegions": ["q98SjTvhZNkSQ70D", "0H6BXksUC9b6i5lZ", "C9xv32e8c5csSovo"], "textChat": true, "tieTeamsSessionLifetime": true, "type": "m8bwbmXgdAPh1ETh"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --name '2Z0QZxfgPubTDIHr' \
    --offset '44' \
    --order 'NZm3EeERmDnyeFoF' \
    --orderBy '7VSZ6pf3vneSD2Tb' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '3g7mSQUhAEtrmjqU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '6YE3p4lSck0ZHn5G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 70, "PSNSupportedPlatforms": ["Jroav91GXlvPG6bF", "YReVHQipcCx9Zw5D", "2L7vIYhGGSyEW4ZJ"], "SessionTitle": "J42d3PBddN8S48l9", "ShouldSync": false, "XboxAllowCrossPlatform": true, "XboxSandboxID": "yNApflxqMrj3oZk0", "XboxServiceConfigID": "3QXcKMDYDDxHSZjt", "XboxSessionTemplateName": "qXyJ58f7Gc26SaiG", "XboxTitleID": "VkydwYWQG26yUZNm", "localizedSessionName": {"TBcvrbYCwZtxFHyP": {}, "LtI8ilbyDPUIj88c": {}, "ekdqCt81P1ktfIov": {}}}, "PSNBaseUrl": "mv9gsR5cJcHm3SZL", "attributes": {"xoRDFuuuySj29a9L": {}, "JE8HoRS1X2PFAAMw": {}, "zHPxB1UskYs4Yw20": {}}, "autoJoin": true, "clientVersion": "aZSWMiVi10sG6vxk", "deployment": "fUcmqRRbceJ5i0Ee", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "RfxeCSz9WEi8Kllo", "enableSecret": false, "fallbackClaimKeys": ["wdNFLTm5T50x9WT0", "GfH2rtOa4EXsXzOX", "QAk4mqrxzTtuLl4X"], "immutableStorage": false, "inactiveTimeout": 61, "inviteTimeout": 2, "joinability": "x9gIiDandpGT2t24", "maxActiveSessions": 1, "maxPlayers": 25, "minPlayers": 83, "name": "woYZyI4EFZKBcYrC", "persistent": true, "preferredClaimKeys": ["xreNDUWehwH3q31A", "806DJgas4b6z3LNU", "j7fdgLA84Z8YYk6Q"], "requestedRegions": ["EgJjBbEDoNf3n0hE", "oRCAcf80zfFyabWA", "gIUXiI07A68eaqC2"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "y9XzjjI5YbsKoADk"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'zJEN2VHzih3bit0V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'Wn3CO39PXDNxtXge' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3FgkXhjDzaQY3sn' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'n2ZkP7cFdP43e5dC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "9XIBudfZgrbHDIDm"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminReconcileMaxActiveSession' test.out

#- 21 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminGetDSMCConfiguration' test.out

#- 22 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminSyncDSMCConfiguration' test.out

#- 23 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName '4hMzF4TxodenSrUT' \
    --dsPodName 'vfqU0bfoMm5cTtFW' \
    --fromTime 'botQyXJRcQWsmqPN' \
    --gameMode 's92epxk0i8VxsZNe' \
    --isPersistent 'reSvf9699mCEHThU' \
    --isSoftDeleted 'JkETAsSp7gh4TeUT' \
    --joinability 'kOkAYfJB8AT9t4Tv' \
    --limit '97' \
    --matchPool '07Y2QD3oD5fLCr3O' \
    --memberID 'OlXVv8ZGF7uYnGzp' \
    --offset '18' \
    --order 'GYY7KQI1AeFgPqaO' \
    --orderBy 'kvo1aolB4lkKB4EY' \
    --sessionID 'OkQ1jMD3cym8xIfk' \
    --status 'OVW2grREOLx0KOww' \
    --statusV2 '3HICQLfl7MUBG7qt' \
    --toTime 'Pu64yAtURKLRkb73' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"8HGS6rDgMdIIlhS1": {}, "fSiM9331m7Ta1PsK": {}, "c50Kv6ecnEevcAx2": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["K2zkRenmPZnGBt4P", "7WnbdSJtjX7ZshZy", "Zl5x4bRXBHUTrDzZ"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SKscfOcYu3dpCROY' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'DQyj4bj5Ro2ogaKt' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2ujQSa3Zdb65UXmy' \
    --statusType '0Zp6iIaTIKUkmkk9' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'QM0NBMA9ORxpzwLR' \
    --key '2AK6eXUGPJsw1fiP' \
    --leaderID '80G9Pclxcft2ulIJ' \
    --limit '53' \
    --memberID 'xkrQDXuNFviMarv8' \
    --memberStatus 'mnfHK8CCmE2lPnsb' \
    --offset '60' \
    --order 'omM8sm1MiaI1mX2t' \
    --orderBy 'JoARtdbBe7udsMro' \
    --partyID 'k0WvGYYnx4V709xb' \
    --value 'nGezKsDwG2omOR2n' \
    > test.out 2>&1
eval_tap $? 28 'AdminQueryParties' test.out

#- 29 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'AdminGetPlatformCredentials' test.out

#- 30 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "vYI9TVqJdvzcWbfU", "clientSecret": "paXp5JMl5LL4bTxB", "scope": "mZjdrrIxsB0NRsB1"}}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdatePlatformCredentials' test.out

#- 31 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'AdminDeletePlatformCredentials' test.out

#- 32 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fPqqRRulpqpymDkQ' \
    > test.out 2>&1
eval_tap $? 32 'AdminReadSessionStorage' test.out

#- 33 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'htrHWwRVnwVBOqOH' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteUserSessionStorage' test.out

#- 34 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'i8pWGd1juYhiqjRJ' \
    --userId 'OqB5F93zFQbJndUD' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadUserSessionStorage' test.out

#- 35 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'pdONneAczbBdHb2s' \
    > test.out 2>&1
eval_tap $? 35 'AdminQueryPlayerAttributes' test.out

#- 36 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'lt71B1SmZp2JZp50' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlayerAttributes' test.out

#- 37 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"CnPb71ORYcmQbTU5": {}, "JX8ccLjMXJRk0eaK": {}, "QDOJvrTefglSs6g4": {}}, "autoJoin": false, "backfillTicketID": "5Y4JvaizwiilatuU", "clientVersion": "jjt9lIMGql5ElEa9", "configurationName": "EIIlGcHB3CfR3ncD", "deployment": "lwi3v3MFFJ1KesKo", "dsSource": "ELCpobBEG8X645xp", "fallbackClaimKeys": ["dXpai0rYaT5hOPja", "f3H0tYighU0VUfcY", "HJbBfAKSiPW3VgsZ"], "inactiveTimeout": 54, "inviteTimeout": 17, "joinability": "smTej52WKi6tArAU", "matchPool": "Rt9plCSVq8PdH6hJ", "maxPlayers": 85, "minPlayers": 71, "preferredClaimKeys": ["UAc0RVwXgAgntLMC", "uaXBWQi6BqPg4xr0", "lCancUZGCHsZYoLf"], "requestedRegions": ["R1KtOv7Zy0b65uvu", "KNuy0ytZQ7M6Nzy1", "adnSKOLFKx1dX4Lu"], "serverName": "WJu3pDMUAeeZ97SB", "teams": [{"UserIDs": ["ROPYuG6XqP6oo7G7", "3zdxTgOfnwIdlNa2", "9fDLh741IslKHzGl"], "parties": [{"partyID": "LKWUtDQs61OQAoxy", "userIDs": ["yQpRWCiiPDGQhNPE", "wiJCf2XJVrlzqQls", "1ozhLVA3kE8jKvga"]}, {"partyID": "tOEBM70TdlNBJYOm", "userIDs": ["pu1VCarzBsV6xnZ5", "Jrzzjrcaug6CWVG8", "SWP3glU6muswVJnN"]}, {"partyID": "nN7kAa7j0riFc5HT", "userIDs": ["HQIoVsGo7dwV9DBq", "FKHQkETJyTlUrwDT", "noujQD4IEiH9Z5qX"]}]}, {"UserIDs": ["n3aoRtlqOECohViH", "A5CzgFSy8X1A3PrI", "fapq5AAeMe4L3mDW"], "parties": [{"partyID": "ORBVXTIIJM9XsYII", "userIDs": ["ZxiXNMR9BgaWcFX3", "SUBhyoTsMWPAxUMk", "awaGpAyrIwMif3BO"]}, {"partyID": "dkocVTd4BxqGWV6m", "userIDs": ["TJ0sQs6XNbjvqhnU", "VLWu8olKdxL6ozRm", "DD0jJvlfV5OemPYd"]}, {"partyID": "YT7DROCjtuzFMbAG", "userIDs": ["9YI89hmguB8FOTjM", "Lo4b9rIzqYkEpsty", "VTBcrM8rG0rH0zcs"]}]}, {"UserIDs": ["wwVeMK6MbGIVIu8v", "vwLc7KY3uVoJXTIM", "tpgkieDyF97lGdMi"], "parties": [{"partyID": "HKxbWCYzo8yO2KTK", "userIDs": ["9tmmOnYnOpas6ghP", "1y4Zi7s7QBlk44Z4", "4B1GZgKg4uKxaCgc"]}, {"partyID": "GLuC3brWdTYCfHkI", "userIDs": ["ySok5DiXZtLW87rG", "ysryod3dNQrmsApR", "A6HX3RwrKt2ecozL"]}, {"partyID": "0TOg54vCE48L5oLF", "userIDs": ["6M4lNa4JUMSHNgqR", "qCV7usamANkZlOX9", "Sfo95HgXqKhTPkwf"]}]}], "textChat": true, "ticketIDs": ["9uSybRzWek2gZvRr", "vr0n9d9lvccKMLhr", "TrcBE2ItBS3KtKZW"], "tieTeamsSessionLifetime": false, "type": "kQuaS7RBx3vim02j"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateGameSession' test.out

#- 38 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"BOxrZDyvpcLYOWA8": {}, "NjxOnaEok4nOOCzf": {}, "sflhjbngJOUn18G5": {}}' \
    > test.out 2>&1
eval_tap $? 38 'PublicQueryGameSessionsByAttributes' test.out

#- 39 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MlfDTk8aG40Nlncc"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicSessionJoinCode' test.out

#- 40 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'eIZSwgAIkgzh4pTU' \
    > test.out 2>&1
eval_tap $? 40 'GetGameSessionByPodName' test.out

#- 41 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0Am4DZhl0bQxFJ3s' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSession' test.out

#- 42 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WCqQpQ2FbKPFMycM' \
    --body '{"attributes": {"SQ4qfAacR0LgB5BU": {}, "Xvjcu2s6w3VifnKq": {}, "mTSoGH1XEfY6QAYn": {}}, "backfillTicketID": "6WQ5UBEU1QAOHfZi", "clientVersion": "GhxOdcuDXSxSc3aZ", "deployment": "PV87pna08gxefTYK", "fallbackClaimKeys": ["huxaEc7M4P7UckSC", "6ePeN8i4GrFES9z7", "xueHpATHccee9GXh"], "inactiveTimeout": 75, "inviteTimeout": 26, "joinability": "cjmSEwdrkEnnqKzF", "matchPool": "sLfYalUlfwEQKjU7", "maxPlayers": 10, "minPlayers": 39, "preferredClaimKeys": ["HGebSVu0LQ40kepE", "aC4dfiOMZfEhHr39", "pysFO3Zvc1BZG99L"], "requestedRegions": ["yvfvHEsJKQQewVLM", "UoAnaRcYp7FUjfIG", "affoflEIByYqeKN0"], "teams": [{"UserIDs": ["meGelYF5wWaDhukU", "4khGG4vZFTYnPkmS", "u4PWam1jxR7SETWj"], "parties": [{"partyID": "teoc8fgvZDDhoO05", "userIDs": ["oKqymxLD1Lcvw6T6", "mZEiwxxElpMYSWIe", "Vzm7z9noowmlTIKV"]}, {"partyID": "owi0RY2VN4ZONJRE", "userIDs": ["dUQ3z9F1BxNNgnke", "4akncw7wu9TmXfJW", "BPrx9Ns8eLzYEvwS"]}, {"partyID": "WTaLQjctvrK2jhsY", "userIDs": ["pKPlXn77AtYoFzLA", "ATPY8P8P3cfoivvQ", "xevecWw7Rry0KK5r"]}]}, {"UserIDs": ["gAGO0dW8rX2MVUGK", "SZ4GcLkt4pK32sJx", "lZcCTpTdRtCHvuk6"], "parties": [{"partyID": "B6XTmSLyn50sigBV", "userIDs": ["ZxiKdV57GvRyd9Uu", "L02Le8HSCslsDd4M", "1F5qRIblS7Nz81GR"]}, {"partyID": "azPAANjfBoldFOyq", "userIDs": ["A2clJ5gEOaCgM6Yn", "6RugbNEIpGBFUjOn", "5mM7k8nbLzvtCIW5"]}, {"partyID": "ynMKquUicAeIVXto", "userIDs": ["WAXhMlW4tLqX7OIC", "f5oD1e6oI9FmYel0", "kOw72o8Zkgk0jS6r"]}]}, {"UserIDs": ["DWUwfhKvrf2AaH4y", "CWrHSppnIZkNnTn3", "rzH5NvAtcvNedgS1"], "parties": [{"partyID": "fUfKmihDbmu8ePWl", "userIDs": ["QMVDXEHeiGTnwyEw", "6hIWDZrpP7rz3ISW", "510kHr4isTKWjmv6"]}, {"partyID": "7nuHCXWfwnwGioVw", "userIDs": ["VzmmBVVFfpqx1AeL", "tzcPJ3jtDYBo4FUT", "H7CGfKSyxgRR1DiC"]}, {"partyID": "qSMzpqIFGLkDs7AC", "userIDs": ["C1RgBfoNrHlFi2qJ", "LgmBLE35YhyiDV90", "SeI5yppBHoytVznC"]}]}], "ticketIDs": ["gNyx9fbT63ShEh8P", "bGikLjgjcj34uulU", "6FYBZsWFbr3RSP0W"], "tieTeamsSessionLifetime": false, "type": "nBhvhf8Q0DtJMcYQ", "version": 7}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateGameSession' test.out

#- 43 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'b5QxWG2HFnZlA6HK' \
    > test.out 2>&1
eval_tap $? 43 'DeleteGameSession' test.out

#- 44 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WW4fI1IQcoBQELcN' \
    --body '{"attributes": {"lZkqTZrKgXNwvm4e": {}, "5GX6H742OixhtAoK": {}, "iVm6URT95XhnUcvW": {}}, "backfillTicketID": "B28MpusuhhDJ5slz", "clientVersion": "giWZEtyd56LfxnbY", "deployment": "97jjYgXchCbkXX26", "fallbackClaimKeys": ["uEdCfQaMAQuTKfC0", "I2kNjCMDtDMrentg", "n3DhqciwIeShF9RK"], "inactiveTimeout": 2, "inviteTimeout": 9, "joinability": "vvxuJlhXbWhbwPwT", "matchPool": "oC6knjVwVnzaqSfJ", "maxPlayers": 17, "minPlayers": 88, "preferredClaimKeys": ["AkCh3QIZsUf8lGFX", "cmwTERHclOdxIwqe", "jxe18rNdb8Otq6j1"], "requestedRegions": ["mqUav7k05HAQltnS", "ojV4jT65yclX2FtA", "z0vJjFIYWOaNdsim"], "teams": [{"UserIDs": ["mkW2miH3xRHAKy4Q", "xZkaXZ7vmiEd0JPx", "VyQpshaDwNqTbbFM"], "parties": [{"partyID": "XAMfVXe0GZeMgsRs", "userIDs": ["mH1EQrYmkPKTPOlh", "TtSiZNCxuogFteTH", "Je4BhSSQkQD6WmOt"]}, {"partyID": "6D7ufFVTOhvQpfbB", "userIDs": ["ke8aEdd36xj6wySo", "ltDxsbzxrlaKEfko", "YjY2o6ouRW9UtNqu"]}, {"partyID": "wC3WgumrIz4NhGzt", "userIDs": ["Zpr4U4fwQIiLXgmR", "asvjO4lj8m3XEwP2", "b4gd3xOeii8Jnmss"]}]}, {"UserIDs": ["ep2xD2NY0kABeGs9", "yxahld1pO0Gyf5PO", "3COyMvczgEpzZ3Fb"], "parties": [{"partyID": "txfhcRC7IVYa6iZ5", "userIDs": ["uFRYNn3SHiWxF0Yb", "uU5ar5qTLWUCy0Af", "gc050XIZRW491e94"]}, {"partyID": "mQjVOOBnIWhunElq", "userIDs": ["ZUodp3IhtCSHy1ei", "1fIrPvfHnRN06EjR", "wEQlNapJRfk4f9Zc"]}, {"partyID": "w1pEHAyNFxcVTKuA", "userIDs": ["QTGh5BxjWOozGoDt", "sUuYo5p8ED5QZAuf", "wNa8lzfjv9oYMXMj"]}]}, {"UserIDs": ["lVHY1AHwF3vGoav7", "MK0PcLnEkcokKwcQ", "0baDT9OyJ2h23GUS"], "parties": [{"partyID": "2amU7syGlElXdEAO", "userIDs": ["rVSnLocLVVYamQc4", "wcG5nDBLJoJHbiQ5", "duE5p4cfs2E41cK8"]}, {"partyID": "QTwiIAvxSvNDlmM5", "userIDs": ["nQFMGzs7fzjgyc44", "mEh9tRk8knYSV30l", "nroQehMDli6t9unQ"]}, {"partyID": "LYXxm09wpGAbpEmD", "userIDs": ["Y9vLh3u6EDsUmrV6", "kH4OotKwG3UC6XCn", "nZxF8CmQr17W65br"]}]}], "ticketIDs": ["34rBBN9tU6TDm5Gl", "oFSKWM1eym5ydC6p", "25xCWTqUOYZENJ1Q"], "tieTeamsSessionLifetime": true, "type": "ZQxPRXH7uxBJEECQ", "version": 62}' \
    > test.out 2>&1
eval_tap $? 44 'PatchUpdateGameSession' test.out

#- 45 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Q5iZgbwwm5iGzXtc' \
    --body '{"backfillTicketID": "knrgidKupvXO6aj4"}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateGameSessionBackfillTicketID' test.out

#- 46 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hCmTC34jxW4pIDwd' \
    > test.out 2>&1
eval_tap $? 46 'GameSessionGenerateCode' test.out

#- 47 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qXpmRmut9H9XyWI8' \
    > test.out 2>&1
eval_tap $? 47 'PublicRevokeGameSessionCode' test.out

#- 48 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bp8fQxRuX91uYmtr' \
    --body '{"platformID": "HJbEGTUj7YjERL1r", "userID": "EQG02zccA8wvLsWU"}' \
    > test.out 2>&1
eval_tap $? 48 'PublicGameSessionInvite' test.out

#- 49 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Nd6lPKvqDejvqklT' \
    > test.out 2>&1
eval_tap $? 49 'JoinGameSession' test.out

#- 50 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SvDwuOrP9lzpiX0V' \
    --body '{"leaderID": "uFpZum7izxe7NPzj"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPromoteGameSessionLeader' test.out

#- 51 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Oa8E7wY76PxLv9HB' \
    > test.out 2>&1
eval_tap $? 51 'LeaveGameSession' test.out

#- 52 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EUe89AwEw1HO4FnK' \
    > test.out 2>&1
eval_tap $? 52 'PublicGameSessionReject' test.out

#- 53 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tx4XLKAmlDr19uJ3' \
    --body '{"secret": "nq6VerzVCcI8y3Cz"}' \
    > test.out 2>&1
eval_tap $? 53 'GetSessionServerSecret' test.out

#- 54 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0YqCKUh5RD9vNAp4' \
    --body '{"additionalMembers": [{"partyID": "jinFpnQ5xF9wwbvM", "userIDs": ["ZyeDeRnVfPUa6xVV", "Bcq3wZpFIYeAg79H", "cLJXJ7mpVI6eTYAj"]}, {"partyID": "dPlCiQQC35cj4KyO", "userIDs": ["VgvnWbfRJtsB7cUQ", "Z2QUAxJrINPXppPN", "O3AfmXcgwC3IN6tv"]}, {"partyID": "KgLB9QmJIOq9dP5s", "userIDs": ["zG71utjsQ4CrRb9g", "UCeVz7fWbZIdhevf", "ZvyV7AcodcZwKjYD"]}], "proposedTeams": [{"UserIDs": ["dmJOlzwm9Su4FnS9", "8QqftSjq7sn8yrec", "iPLfkVyyJsbGpO6J"], "parties": [{"partyID": "gehDJxEN7JlZc8LM", "userIDs": ["q1o2jZWu4yA3r0u4", "q1bTHXIjfJKyFlM0", "u1uuoVdn9yVoSlKN"]}, {"partyID": "chPHNL4X3LLaGPGd", "userIDs": ["qLE8SohhhuiTnJar", "YYkHBDdSzBXdxapw", "hd5IQYBQuxLvPuWY"]}, {"partyID": "vE3fsNy9Z9OhxXvC", "userIDs": ["p9y7fLD2qfCXnlUn", "qxT1WsRNMZcA92hz", "C7MNa8vVe4MHX6Ag"]}]}, {"UserIDs": ["Mep90AyyUJyAK5PR", "MRMwdvl0hv6g62Gx", "BW2tQF5tkTjgJaMY"], "parties": [{"partyID": "vNQOsDa4bkcgepqt", "userIDs": ["xjbrztee7QLTGAak", "7Kaol01DK97D2xni", "k42miteR5eQAe1rz"]}, {"partyID": "mmgqBPRmd6mO4oI8", "userIDs": ["KDqebm83raNBJ5y7", "axEkvI4oxZEDxGiB", "nNbn0zaf7CaOSlHX"]}, {"partyID": "rUSA6sMJzA5mtqIS", "userIDs": ["Q83TTbtefXWznDe4", "LQdXfFBii2RAMEX5", "RMjBFVZGYzQqV8d9"]}]}, {"UserIDs": ["mDdUIoiIJFNxuNOm", "USWw18T1IxVWCxdv", "PL9e4P01vxP8xj1L"], "parties": [{"partyID": "yEirURERnEMzpImW", "userIDs": ["6sjAHyCK5tNanGBr", "kzUvck3xTtmOFMeb", "S4AdlNzwog2IhErk"]}, {"partyID": "NhNcECWwchW6zL9S", "userIDs": ["kbLlrNXnGanMazb8", "jvRWenURH48aJuAL", "EcSqcE15u6D31DjO"]}, {"partyID": "srs3CUYATdqnQGbq", "userIDs": ["iqOkNeATj7eGjodd", "7CcJUrI6MAugK5ky", "pNrp2nFe9FmN86sK"]}]}], "version": 47}' \
    > test.out 2>&1
eval_tap $? 54 'AppendTeamGameSession' test.out

#- 55 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "LOq4ft5jGcMICPUY"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicPartyJoinCode' test.out

#- 56 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nfG6jl9U4jReteIM' \
    > test.out 2>&1
eval_tap $? 56 'PublicGetParty' test.out

#- 57 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'gzISomCsodJrhQW4' \
    --body '{"attributes": {"1q2OspCZbt3Uta5I": {}, "0uGcL1koyHjCH5ol": {}, "YLETRpABAmO2EGvJ": {}}, "inactiveTimeout": 95, "inviteTimeout": 56, "joinability": "MS93yOxNInDByhno", "maxPlayers": 23, "minPlayers": 21, "type": "uO6ti0QP2ssiJ66O", "version": 53}' \
    > test.out 2>&1
eval_tap $? 57 'PublicUpdateParty' test.out

#- 58 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '4xQye7HqnVK3YVeO' \
    --body '{"attributes": {"Ws9mfVQh3jLBtn9p": {}, "xpE7BYtzB0B4CxyQ": {}, "rUpIFvORxTi79DpS": {}}, "inactiveTimeout": 18, "inviteTimeout": 1, "joinability": "b39ukcR6c2E2r3vk", "maxPlayers": 70, "minPlayers": 78, "type": "fAKEbqcNXSGCCvNo", "version": 47}' \
    > test.out 2>&1
eval_tap $? 58 'PublicPatchUpdateParty' test.out

#- 59 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '1OW0nXOErQPS4VsR' \
    > test.out 2>&1
eval_tap $? 59 'PublicGeneratePartyCode' test.out

#- 60 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'oYIK69yg9ADCGiXa' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokePartyCode' test.out

#- 61 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Ls2xjHkinOD975nA' \
    --body '{"platformID": "RHCmhNHSXuqIHsxv", "userID": "aUoXDmwWsukxncuD"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPartyInvite' test.out

#- 62 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '3QxCXMd00YBWCaVV' \
    --body '{"leaderID": "mM45mfIZsWhkS476"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromotePartyLeader' test.out

#- 63 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dGGJwJ00UH197MJ6' \
    > test.out 2>&1
eval_tap $? 63 'PublicPartyJoin' test.out

#- 64 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zU7JLMQyMWzYQCAa' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyLeave' test.out

#- 65 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PJgoxGJoJaSzUtY4' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyReject' test.out

#- 66 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZD0Xtb0U4pH16NUs' \
    --userId 'VY21NVIs7NRen2Y3' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyKick' test.out

#- 67 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Ns0QJQeaWytPfds1": {}, "BYx0EaURydf8ZyyZ": {}, "eHAWGgJUbUJRMbkc": {}}, "configurationName": "TglbU86FyOjApNHB", "inactiveTimeout": 98, "inviteTimeout": 82, "joinability": "fNOURcjY3YYT9oTy", "maxPlayers": 26, "members": [{"ID": "3Ornyx34luLdvtsT", "PlatformID": "KXMjiw6gYPvfn2Qt", "PlatformUserID": "9iyq3Nyk8ncu2Z3e"}, {"ID": "DHH9WaVO4iKhDcJ7", "PlatformID": "TCcNIsQ3PuppUxDS", "PlatformUserID": "K8aOTGMudcxlCV4c"}, {"ID": "NbJGQ57lPdinpjS2", "PlatformID": "DRfGt9GlyZVQ4X67", "PlatformUserID": "tPZSTpPq3xjrElvv"}], "minPlayers": 60, "textChat": false, "type": "Hf1ANTJ9Yk997XkG"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicCreateParty' test.out

#- 68 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OdC6ItxDT8p4n4XC' \
    --body '{"FkD1AJLCwszbZxuH": {}, "SgDOK8bjoF7bL263": {}, "5KbtZTGJpqgl2IzN": {}}' \
    > test.out 2>&1
eval_tap $? 68 'PublicUpdateInsertSessionStorageLeader' test.out

#- 69 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XGTuQPIDpor7t1aJ' \
    --userId 'LNNz6QIVC9Mfuc8V' \
    --body '{"OsnmnlVljdWYmELe": {}, "74p38vumnxAnYBTx": {}, "aTIz0jcgDI8Pkz96": {}}' \
    > test.out 2>&1
eval_tap $? 69 'PublicUpdateInsertSessionStorage' test.out

#- 70 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["vd80msqIm5bufnBq", "rpLeqhwVhjnnjKME", "mtbiWsAQHbMrKYi0"]}' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 71 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'PublicGetPlayerAttributes' test.out

#- 72 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "QhfIhHtADUQ9zimQ", "data": {"TQT95pFJUAJsyAfe": {}, "KOufV4f15NohXu6o": {}, "pxQGRt6PqlkL0diR": {}}, "platforms": [{"name": "hLC10ih2EQfY3XCv", "userID": "4hdOa6FdZhNMd1on"}, {"name": "FjGRbxtABPXDmgNE", "userID": "JBhgGq5GIDhNC66s"}, {"name": "zbCCf73IFbRkPSSI", "userID": "Tz4TjCrJHXGXku2Y"}], "roles": ["VuOzhxHmnrrV9ZGW", "rZ05sxe6A6RpmKDe", "bNkylbynkgT9vayL"]}' \
    > test.out 2>&1
eval_tap $? 72 'PublicStorePlayerAttributes' test.out

#- 73 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'PublicDeletePlayerAttributes' test.out

#- 74 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'Liizac7Ge6zKJdlt' \
    --orderBy '7rjF5RaJwvkWVco2' \
    --status 'LTo5ijlvDF8qBWCQ' \
    > test.out 2>&1
eval_tap $? 74 'PublicQueryMyGameSessions' test.out

#- 75 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '9dLWYyS8zdhMeBXH' \
    --orderBy '8x6HdVfZVDAiU6iJ' \
    --status 'OF7JKZFNk2NKy59X' \
    > test.out 2>&1
eval_tap $? 75 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE