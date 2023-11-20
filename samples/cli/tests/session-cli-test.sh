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
echo "1..74"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 96, "PSNSupportedPlatforms": ["hqUI06UpOXGSLmCV", "uHOPlLlkvR8sKgnu", "RkgghGoYupD391C2"], "SessionTitle": "qtPYokahFjkQsfCa", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "f8TgoNm03VLisV6z", "XboxServiceConfigID": "wPuo3td6TC6I3lMj", "XboxSessionTemplateName": "GSWN2laRlxfcjHfY", "XboxTitleID": "akUCTqGkE7wcWfDs", "localizedSessionName": {"lpJSqGAXQ0yYoNRK": {}, "d3IL5TAQ6iiPlSC2": {}, "uE4o5Vwdo3fePqIJ": {}}}, "PSNBaseUrl": "A8IHtrkmu0hpDDWV", "autoJoin": true, "clientVersion": "NQy4uZAAiE0mit9R", "deployment": "GCCHYzUOcEdscKHP", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "Yv7t1o7TTr1DmrhZ", "enableSecret": true, "fallbackClaimKeys": ["9Jcdos4fYcTVU6RB", "t0zYoMcHyCUEXlAv", "xJMdalwSyliWMNW5"], "immutableStorage": true, "inactiveTimeout": 78, "inviteTimeout": 77, "joinability": "vqtlB2jJCSQT279Z", "maxActiveSessions": 99, "maxPlayers": 86, "minPlayers": 3, "name": "YGu0rdlgdWyOtXi3", "persistent": false, "preferredClaimKeys": ["xkT1X68cmDc3fxU8", "MyKrQpM4hkkK6KKX", "NB3Gv0IqmF51Tkhj"], "requestedRegions": ["Ynaq6foWvXa3bMrX", "sDr6kILsSSyDdmyk", "moPYgc2L4jk4Lo0L"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "f4IxjUkl535X3ate"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name 'ksUC9b6i5lZC9xv3' \
    --offset '9' \
    --order 'boLQQ1MzH7Qm8bwb' \
    --orderBy 'mXgdAPh1EThG96gA' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'FKK2WDgCcxvONZm3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'EeERmDnyeFoF7VSZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 30, "PSNSupportedPlatforms": ["pf3vneSD2Tb3g7mS", "QUhAEtrmjqU6YE3p", "4lSck0ZHn5GI39YB"], "SessionTitle": "HqaTHeKtW18iGeUl", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "d9sogWa24CKNS0Gq", "XboxServiceConfigID": "VvUfHQvsHXNUNe4m", "XboxSessionTemplateName": "hgo5QB65lSAiYnNj", "XboxTitleID": "kfZrQvGgbLdLsFzH", "localizedSessionName": {"kBMr1yrOMlNFSrUE": {}, "irnjX9fDmIbeZxzf": {}, "TcyiuATus9hsfpFD": {}}}, "PSNBaseUrl": "cSDG8aMVGLiBNrDj", "autoJoin": true, "clientVersion": "byDPUIj88cekdqCt", "deployment": "81P1ktfIovmv9gsR", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "z9KOsb392k6YmJFf", "enableSecret": true, "fallbackClaimKeys": ["ByjlBiuFM3FIoVk8", "T3GpAnkCmBUqg2SC", "nqntX9y1aZSWMiVi"], "immutableStorage": true, "inactiveTimeout": 90, "inviteTimeout": 66, "joinability": "uPMMWH8Yb33T5UBJ", "maxActiveSessions": 59, "maxPlayers": 16, "minPlayers": 18, "name": "0EeDxOgBnhhqElIa", "persistent": true, "preferredClaimKeys": ["KlloeH0JT1yduat2", "vQR3biBfsu4jmsRE", "2w1yEkLgh3tIYt4S"], "requestedRegions": ["qYUTLDx9gIiDandp", "GT2t24aOMh5eC3IH", "eHSKLCa3xreNDUWe"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "wH3q31A806DJgas4"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'b6z3LNUj7fdgLA84' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'Z8YYk6QEgJjBbEDo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nf3n0hEoRCAcf80z' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'fFyabWAgIUXiI07A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "68eaqC2J9jyEW6GL"}' \
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
    --configurationName 'bc0NaKDUL3sa13lk' \
    --dsPodName '1dQBHO86IlBhnetU' \
    --fromTime '4RwTqUXlTDBzOuYs' \
    --gameMode 'aZA2yyd4mbqoOfAD' \
    --isPersistent 'MMAXFaY9eKa699bR' \
    --isSoftDeleted 'VhyaKwwrAP2aMlu7' \
    --joinability 'WtjCtoYetOO847g8' \
    --limit '82' \
    --matchPool 'oMm5cTtFWbotQyXJ' \
    --memberID 'RcQWsmqPNs92epxk' \
    --offset '70' \
    --order 'i8VxsZNereSvf969' \
    --orderBy '9mCEHThUJkETAsSp' \
    --sessionID '7gh4TeUTkOkAYfJB' \
    --status '8AT9t4Tv207Y2QD3' \
    --statusV2 'oD5fLCr3OOlXVv8Z' \
    --toTime 'GF7uYnGzpipNDigN' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Jma1MbqqZtfNWql4": {}, "nmwAft4gqkNNlWkD": {}, "9eOziYRFOn0jJLHC": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["9LxhvNXTwGBCtohL", "tl9Zuhytm5UDrT6Q", "XCs5SPBbRPZTF6oQ"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AXVG7tnsZg5QgXjv' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '1m7Ta1PsKc50Kv6e' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cnEevcAx2K2zkRen' \
    --statusType 'mPZnGBt4P7WnbdSJ' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'tjX7ZshZyZl5x4bR' \
    --key 'XBHUTrDzZSKscfOc' \
    --leaderID 'Yu3dpCROYqUiGKXV' \
    --limit '64' \
    --memberID '5Ro2ogaKt2ujQSa3' \
    --memberStatus 'Zdb65UXmy0Zp6iIa' \
    --offset '94' \
    --order 'hvXYck0upMzUYnb7' \
    --orderBy '6tFkEORV3bu1bNCt' \
    --partyID 'X7W40V6Do5sYadCC' \
    --value 'FrHHC3DpZxkrQDXu' \
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
    --body '{"psn": {"clientId": "NFviMarv8mnfHK8C", "clientSecret": "CmE2lPnsbD3SGEdl", "scope": "wuUccE536ugBp3HB"}}' \
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
    --sessionId 'vepnDCjgyJlXe36m' \
    > test.out 2>&1
eval_tap $? 32 'AdminReadSessionStorage' test.out

#- 33 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gWjLfFmteue9nzJ6' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteUserSessionStorage' test.out

#- 34 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fH24T805tVg8JqU0' \
    --userId 'jZpjvsugAOS7u8Ri' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadUserSessionStorage' test.out

#- 35 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'WyerCSa8SRgwsAj1' \
    > test.out 2>&1
eval_tap $? 35 'AdminQueryPlayerAttributes' test.out

#- 36 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ik1jglaDXTvKCWwN' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlayerAttributes' test.out

#- 37 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"TAhd2wrS0uPdjhdi": {}, "npng5BLy8wbhMssA": {}, "HjapIkY9Rf4wP57d": {}}, "autoJoin": true, "backfillTicketID": "zFQbJndUDpdONneA", "clientVersion": "czbBdHb2slt71B1S", "configurationName": "mZp2JZp50CnPb71O", "deployment": "RYcmQbTU5JX8ccLj", "dsSource": "MXJRk0eaKQDOJvrT", "fallbackClaimKeys": ["efglSs6g4iY9u02a", "CNYIWekp18lOC3mN", "qF7Bl0LcghVHfPEs"], "inactiveTimeout": 32, "inviteTimeout": 57, "joinability": "xwhRON0bc1eMbEIj", "matchPool": "owLqc3ecjXJbZDKK", "maxPlayers": 30, "minPlayers": 67, "preferredClaimKeys": ["xLE1Y3Dymtj3giPg", "4x4yiPX6ues1Hhhk", "g1yLVbLFzHEP8cM4"], "requestedRegions": ["NTwr0KHaAsmTej52", "WKi6tArAURt9plCS", "Vq8PdH6hJPUAc0RV"], "serverName": "wXgAgntLMCuaXBWQ", "teams": [{"UserIDs": ["i6BqPg4xr0lCancU", "ZGCHsZYoLfR1KtOv", "7Zy0b65uvuKNuy0y"], "parties": [{"partyID": "tZQ7M6Nzy1adnSKO", "userIDs": ["LFKx1dX4LuWJu3pD", "MUAeeZ97SBROPYuG", "6XqP6oo7G73zdxTg"]}, {"partyID": "OfnwIdlNa29fDLh7", "userIDs": ["41IslKHzGlLKWUtD", "Qs61OQAoxyyQpRWC", "iiPDGQhNPEwiJCf2"]}, {"partyID": "XJVrlzqQls1ozhLV", "userIDs": ["A3kE8jKvgatOEBM7", "0TdlNBJYOmpu1VCa", "rzBsV6xnZ5Jrzzjr"]}]}, {"UserIDs": ["caug6CWVG8SWP3gl", "U6muswVJnNnN7kAa", "7j0riFc5HTHQIoVs"], "parties": [{"partyID": "Go7dwV9DBqFKHQkE", "userIDs": ["TJyTlUrwDTnoujQD", "4IEiH9Z5qXn3aoRt", "lqOECohViHA5CzgF"]}, {"partyID": "Sy8X1A3PrIfapq5A", "userIDs": ["AeMe4L3mDWORBVXT", "IIJM9XsYIIZxiXNM", "R9BgaWcFX3SUBhyo"]}, {"partyID": "TsMWPAxUMkawaGpA", "userIDs": ["yrIwMif3BOdkocVT", "d4BxqGWV6mTJ0sQs", "6XNbjvqhnUVLWu8o"]}]}, {"UserIDs": ["lKdxL6ozRmDD0jJv", "lfV5OemPYdYT7DRO", "CjtuzFMbAG9YI89h"], "parties": [{"partyID": "mguB8FOTjMLo4b9r", "userIDs": ["IzqYkEpstyVTBcrM", "8rG0rH0zcswwVeMK", "6MbGIVIu8vvwLc7K"]}, {"partyID": "Y3uVoJXTIMtpgkie", "userIDs": ["DyF97lGdMiHKxbWC", "Yzo8yO2KTK9tmmOn", "YnOpas6ghP1y4Zi7"]}, {"partyID": "s7QBlk44Z44B1GZg", "userIDs": ["Kg4uKxaCgcGLuC3b", "rWdTYCfHkIySok5D", "iXZtLW87rGysryod"]}]}], "textChat": false, "ticketIDs": ["X3viLvtEk4mTIpUA", "9gxo8SV38nEhoXmM", "2W7l6jHMA2rG3nak"], "tieTeamsSessionLifetime": false, "type": "UMSHNgqRqCV7usam"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateGameSession' test.out

#- 38 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"ANkZlOX9Sfo95HgX": {}, "qKhTPkwfLM9uSybR": {}, "zWek2gZvRrvr0n9d": {}}' \
    > test.out 2>&1
eval_tap $? 38 'PublicQueryGameSessionsByAttributes' test.out

#- 39 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9lvccKMLhrTrcBE2"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicSessionJoinCode' test.out

#- 40 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'ItBS3KtKZWe8aoFz' \
    > test.out 2>&1
eval_tap $? 40 'GetGameSessionByPodName' test.out

#- 41 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'AyBME74HUtipUWYh' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSession' test.out

#- 42 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'WV1qx8CzPML52faX' \
    --body '{"attributes": {"Ur9Sk4lq2faBcAXX": {}, "KlhvyH8paOJtxqMP": {}, "pcVfRwNj547fH0Xr": {}}, "backfillTicketID": "KEDpEY8VnocGAjci", "clientVersion": "0V3tBf2jnHGKXphn", "deployment": "50c9tNLDljhZ2jxL", "fallbackClaimKeys": ["RX3z46OCaGBeMfPl", "Nos4yBRjrERHEonA", "ZR8GmEu0q1p6QCyY"], "inactiveTimeout": 62, "inviteTimeout": 43, "joinability": "U1QAOHfZiGhxOdcu", "matchPool": "DXSxSc3aZPV87pna", "maxPlayers": 54, "minPlayers": 38, "preferredClaimKeys": ["gxefTYKhuxaEc7M4", "P7UckSC6ePeN8i4G", "rFES9z7xueHpATHc"], "requestedRegions": ["cee9GXhKcjmSEwdr", "kEnnqKzFsLfYalUl", "fwEQKjU7eHGebSVu"], "teams": [{"UserIDs": ["0LQ40kepEaC4dfiO", "MZfEhHr39pysFO3Z", "vc1BZG99LyvfvHEs"], "parties": [{"partyID": "JKQQewVLMUoAnaRc", "userIDs": ["Yp7FUjfIGaffoflE", "IByYqeKN0meGelYF", "5wWaDhukU4khGG4v"]}, {"partyID": "ZFTYnPkmSu4PWam1", "userIDs": ["jxR7SETWjteoc8fg", "vZDDhoO05oKqymxL", "D1Lcvw6T6mZEiwxx"]}, {"partyID": "ElpMYSWIeVzm7z9n", "userIDs": ["oowmlTIKVowi0RY2", "VN4ZONJREdUQ3z9F", "1BxNNgnke4akncw7"]}]}, {"UserIDs": ["wu9TmXfJWBPrx9Ns", "8eLzYEvwSWTaLQjc", "tvrK2jhsYpKPlXn7"], "parties": [{"partyID": "7AtYoFzLAATPY8P8", "userIDs": ["P3cfoivvQxevecWw", "7Rry0KK5rgAGO0dW", "8rX2MVUGKSZ4GcLk"]}, {"partyID": "t4pK32sJxlZcCTpT", "userIDs": ["dRtCHvuk6B6XTmSL", "yn50sigBVZxiKdV5", "7GvRyd9UuL02Le8H"]}, {"partyID": "SCslsDd4M1F5qRIb", "userIDs": ["lS7Nz81GRazPAANj", "fBoldFOyqA2clJ5g", "EOaCgM6Yn6RugbNE"]}]}, {"UserIDs": ["IpGBFUjOn5mM7k8n", "bLzvtCIW5ynMKquU", "icAeIVXtoWAXhMlW"], "parties": [{"partyID": "4tLqX7OICf5oD1e6", "userIDs": ["oI9FmYel0kOw72o8", "Zkgk0jS6rDWUwfhK", "vrf2AaH4yCWrHSpp"]}, {"partyID": "nIZkNnTn3rzH5NvA", "userIDs": ["tcvNedgS1fUfKmih", "Dbmu8ePWlQMVDXEH", "eiGTnwyEw6hIWDZr"]}, {"partyID": "pP7rz3ISW510kHr4", "userIDs": ["isTKWjmv67nuHCXW", "fwnwGioVwVzmmBVV", "Ffpqx1AeLtzcPJ3j"]}]}], "ticketIDs": ["tDYBo4FUTH7CGfKS", "yxgRR1DiCqSMzpqI", "FGLkDs7ACC1RgBfo"], "tieTeamsSessionLifetime": true, "type": "31MfuGaXsAuGsZaS", "version": 68}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateGameSession' test.out

#- 43 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hyiDV90SeI5yppBH' \
    > test.out 2>&1
eval_tap $? 43 'DeleteGameSession' test.out

#- 44 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oytVznCgNyx9fbT6' \
    --body '{"attributes": {"3ShEh8PbGikLjgjc": {}, "j34uulU6FYBZsWFb": {}, "r3RSP0W9nBhvhf8Q": {}}, "backfillTicketID": "0DtJMcYQdN66bswA", "clientVersion": "gt65X4N1LQZmB61J", "deployment": "MdtwCVUrYQue84dw", "fallbackClaimKeys": ["mbwFEnAZaWsQJtRY", "oagRJK5PX9UcOvhP", "yE11TRT2SKseoe8V"], "inactiveTimeout": 77, "inviteTimeout": 14, "joinability": "ie0LBa36KNzjf005", "matchPool": "CXNGehQ2aTjTDfKF", "maxPlayers": 61, "minPlayers": 59, "preferredClaimKeys": ["XC7eGL5YhJDWh9YW", "qc0qgV6d9yOfIMLd", "s2DbPcaoMdtRLTmS"], "requestedRegions": ["vTkQQgB7exYvmHMx", "r5hPCJJztJBg0tTJ", "g46IewOXE2AkCh3Q"], "teams": [{"UserIDs": ["IZsUf8lGFXcmwTER", "HclOdxIwqejxe18r", "Ndb8Otq6j1mqUav7"], "parties": [{"partyID": "k05HAQltnSojV4jT", "userIDs": ["65yclX2FtAz0vJjF", "IYWOaNdsimmkW2mi", "H3xRHAKy4QxZkaXZ"]}, {"partyID": "7vmiEd0JPxVyQpsh", "userIDs": ["aDwNqTbbFMXAMfVX", "e0GZeMgsRsmH1EQr", "YmkPKTPOlhTtSiZN"]}, {"partyID": "CxuogFteTHJe4BhS", "userIDs": ["SQkQD6WmOt6D7ufF", "VTOhvQpfbBke8aEd", "d36xj6wySoltDxsb"]}]}, {"UserIDs": ["zxrlaKEfkoYjY2o6", "ouRW9UtNquwC3Wgu", "mrIz4NhGztZpr4U4"], "parties": [{"partyID": "fwQIiLXgmRasvjO4", "userIDs": ["lj8m3XEwP2b4gd3x", "Oeii8Jnmssep2xD2", "NY0kABeGs9yxahld"]}, {"partyID": "1pO0Gyf5PO3COyMv", "userIDs": ["czgEpzZ3FbtxfhcR", "C7IVYa6iZ5uFRYNn", "3SHiWxF0YbuU5ar5"]}, {"partyID": "qTLWUCy0Afgc050X", "userIDs": ["IZRW491e94mQjVOO", "BnIWhunElqZUodp3", "IhtCSHy1ei1fIrPv"]}]}, {"UserIDs": ["fHnRN06EjRwEQlNa", "pJRfk4f9Zcw1pEHA", "yNFxcVTKuAQTGh5B"], "parties": [{"partyID": "xjWOozGoDtsUuYo5", "userIDs": ["p8ED5QZAufwNa8lz", "fjv9oYMXMjlVHY1A", "HwF3vGoav7MK0PcL"]}, {"partyID": "nEkcokKwcQ0baDT9", "userIDs": ["OyJ2h23GUS2amU7s", "yGlElXdEAOrVSnLo", "cLVVYamQc4wcG5nD"]}, {"partyID": "BLJoJHbiQ5duE5p4", "userIDs": ["cfs2E41cK8QTwiIA", "vxSvNDlmM5nQFMGz", "s7fzjgyc44mEh9tR"]}]}], "ticketIDs": ["k8knYSV30lnroQeh", "MDli6t9unQLYXxm0", "9wpGAbpEmDY9vLh3"], "tieTeamsSessionLifetime": true, "type": "8rG0q0Q2Qd2JzRbk", "version": 64}' \
    > test.out 2>&1
eval_tap $? 44 'PatchUpdateGameSession' test.out

#- 45 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wG3UC6XCnnZxF8Cm' \
    --body '{"backfillTicketID": "Qr17W65br34rBBN9"}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateGameSessionBackfillTicketID' test.out

#- 46 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'tU6TDm5GloFSKWM1' \
    > test.out 2>&1
eval_tap $? 46 'GameSessionGenerateCode' test.out

#- 47 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eym5ydC6p25xCWTq' \
    > test.out 2>&1
eval_tap $? 47 'PublicRevokeGameSessionCode' test.out

#- 48 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UOYZENJ1QHZQxPRX' \
    --body '{"platformID": "H7uxBJEECQE1li3B", "userID": "g7Jxc9pUnZmvhidw"}' \
    > test.out 2>&1
eval_tap $? 48 'PublicGameSessionInvite' test.out

#- 49 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CkZwqjYLfTiCO1ND' \
    > test.out 2>&1
eval_tap $? 49 'JoinGameSession' test.out

#- 50 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BvQvRPnAz4VzW0Cp' \
    --body '{"leaderID": "oBCbyJsF5IjF1c0W"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPromoteGameSessionLeader' test.out

#- 51 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '338HS6CBgVRyihYN' \
    > test.out 2>&1
eval_tap $? 51 'LeaveGameSession' test.out

#- 52 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Z84CVhziXV8HwSmv' \
    > test.out 2>&1
eval_tap $? 52 'PublicGameSessionReject' test.out

#- 53 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cvcDKF19yVRafCjO' \
    --body '{"additionalMembers": [{"partyID": "uSYht83AdvBaagTi", "userIDs": ["RJ8daGTVX3Bb7jlz", "5IfHgKjI9mwJSrN8", "jkIykR2zbaI6PD7f"]}, {"partyID": "EscShnGUGUtV9GJ2", "userIDs": ["79GDbLNwjm3FK0nn", "X2poMfZ1hDHtbh4H", "tMlFgvh2Dp2SoiIP"]}, {"partyID": "p1yvfAHS0VgLu11A", "userIDs": ["3HTovFi4tPAGfley", "CA6jEtcqsnzoVILj", "kwW61duF87aUyrdt"]}], "proposedTeams": [{"UserIDs": ["4XSpWBAetsanzqP8", "oxfrtbECD1CYPwai", "BAxfYL8Avt70ZUT2"], "parties": [{"partyID": "fSk3LL0calqxEewu", "userIDs": ["GS469k2hG0WKt4sU", "manYxM0UHZVNYzGM", "NIpWoSLkUrfuf4U3"]}, {"partyID": "WeYeA9t2ENKKWrFt", "userIDs": ["HIi1CMgKAOG5iDcC", "R5PbCvDLil8wj9cK", "M3Ar6MF35hCER4nG"]}, {"partyID": "mWGgTJfHlJl4tHGa", "userIDs": ["4XfZcd9CVnGqMX9F", "ieeEssWEUl07bhwn", "tCVqiYOJf5KwMZQj"]}]}, {"UserIDs": ["zvjSozv6CTRDl0zp", "9CzHFwinkBNi4gvq", "gl6TZ9TGVPmv34h6"], "parties": [{"partyID": "T7EsufmfxKYB4LM6", "userIDs": ["H6QXmpZ9X3fUSR1l", "9xLPBsmAUrD9L1Ii", "D6MlcEPhMDFzjHZ3"]}, {"partyID": "sIhzOx2CXKlvIomU", "userIDs": ["3pIxM9n8D2eLMe3l", "t9qfx2UDcgVE7L9F", "K6e0MrPc4vtxk9hV"]}, {"partyID": "KlG56HlzGr7XjdyR", "userIDs": ["JunZPkp6ccIBnWyP", "w8mj7gyQ7XdIszGR", "j46COPipH1MWVTHG"]}]}, {"UserIDs": ["0qHJCWEfOJpZm9yE", "YWNGMy2pgSGSUOK6", "8eqGJtWf1Ybgg8rd"], "parties": [{"partyID": "wY9bmrvHmO07KNqX", "userIDs": ["9LM2IwEsdOGBXBwn", "zDX8v3xgC1Ge9Pdb", "TTAJ2Gp1r0sVZ6LJ"]}, {"partyID": "AOddIL2l3hPjNDKv", "userIDs": ["2LWfXqjr8fS79En3", "wYowBdkaZ3y6i38X", "QjLDRqkpiFK5BtiQ"]}, {"partyID": "272Uo9UBJWodpdws", "userIDs": ["X1jorcyR0x3YiHF8", "ITGPRQBCgIs1Q2lz", "xl0yF5m77TTh4gUo"]}]}], "version": 20}' \
    > test.out 2>&1
eval_tap $? 53 'AppendTeamGameSession' test.out

#- 54 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "WwchW6zL9SkbLlrN"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicPartyJoinCode' test.out

#- 55 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XnGanMazb8jvRWen' \
    > test.out 2>&1
eval_tap $? 55 'PublicGetParty' test.out

#- 56 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'URH48aJuALEcSqcE' \
    --body '{"attributes": {"15u6D31DjOsrs3CU": {}, "YATdqnQGbqiqOkNe": {}, "ATj7eGjodd7CcJUr": {}}, "inactiveTimeout": 71, "inviteTimeout": 18, "joinability": "6MAugK5kypNrp2nF", "maxPlayers": 10, "minPlayers": 75, "type": "9FmN86sK5LOq4ft5", "version": 20}' \
    > test.out 2>&1
eval_tap $? 56 'PublicUpdateParty' test.out

#- 57 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nNlsa2bRBr27fVMW' \
    --body '{"attributes": {"uAfDqLMR919IZPKO": {}, "KiAVQXXOmqFHLbyX": {}, "mgCNiXH8uenbC5Cp": {}}, "inactiveTimeout": 15, "inviteTimeout": 51, "joinability": "gMweexsIAP5vHLjB", "maxPlayers": 72, "minPlayers": 26, "type": "9iqMcBL4BzhDUjhK", "version": 84}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPatchUpdateParty' test.out

#- 58 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'InDByhnoluO6ti0Q' \
    > test.out 2>&1
eval_tap $? 58 'PublicGeneratePartyCode' test.out

#- 59 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'P2ssiJ66OzOj84O6' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokePartyCode' test.out

#- 60 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tgohjtC7bzjPpucd' \
    --body '{"platformID": "dXJ5zifF8y959anr", "userID": "NSleywHbHig6IKWV"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPartyInvite' test.out

#- 61 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Z77KeRWdECaFGzfZ' \
    --body '{"leaderID": "2hxcJ2Fnemn7M23S"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPromotePartyLeader' test.out

#- 62 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zUo4hNBDh9ZFP1OW' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyJoin' test.out

#- 63 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '0nXOErQPS4VsRoYI' \
    > test.out 2>&1
eval_tap $? 63 'PublicPartyLeave' test.out

#- 64 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'K69yg9ADCGiXaLs2' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyReject' test.out

#- 65 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xjHkinOD975nARHC' \
    --userId 'mhNHSXuqIHsxvaUo' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyKick' test.out

#- 66 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"XDmwWsukxncuD3Qx": {}, "CXMd00YBWCaVVmM4": {}, "5mfIZsWhkS476dGG": {}}, "configurationName": "JwJ00UH197MJ6zU7", "inactiveTimeout": 72, "inviteTimeout": 100, "joinability": "LMQyMWzYQCAaPJgo", "maxPlayers": 47, "members": [{"ID": "7WwIc895ImqK6tVs", "PlatformID": "aUq3stUh5J5Z9GiB", "PlatformUserID": "iSAylX5cS0IeHpWC"}, {"ID": "ugmfOL0QQpxsuD8P", "PlatformID": "Gqku59eFJrOXyDYz", "PlatformUserID": "9vMUOPG0iHDT8QbF"}, {"ID": "7gHPTPQbvLt2NRqJ", "PlatformID": "GIKzLyH1y72L13Or", "PlatformUserID": "nyx34luLdvtsTKXM"}], "minPlayers": 20, "textChat": false, "type": "iw6gYPvfn2Qt9iyq"}' \
    > test.out 2>&1
eval_tap $? 66 'PublicCreateParty' test.out

#- 67 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3Nyk8ncu2Z3eDHH9' \
    --body '{"WaVO4iKhDcJ7TCcN": {}, "IsQ3PuppUxDSK8aO": {}, "TGMudcxlCV4cNbJG": {}}' \
    > test.out 2>&1
eval_tap $? 67 'PublicUpdateInsertSessionStorageLeader' test.out

#- 68 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Q57lPdinpjS2DRfG' \
    --userId 't9GlyZVQ4X67tPZS' \
    --body '{"TpPq3xjrElvvDgw0": {}, "ag7kSWE0Hiqm5IuL": {}, "ryiEXqvUWDjU1G0E": {}}' \
    > test.out 2>&1
eval_tap $? 68 'PublicUpdateInsertSessionStorage' test.out

#- 69 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["VjVZw1ToLuPakQN1", "MpOs1RVFrcg2CXxe", "px78fvsyhE2BKtyT"]}' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 70 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'PublicGetPlayerAttributes' test.out

#- 71 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "uQPIDpor7t1aJLNN", "data": {"z6QIVC9Mfuc8VOsn": {}, "mnlVljdWYmELe74p": {}, "38vumnxAnYBTxaTI": {}}, "platforms": [{"name": "z0jcgDI8Pkz96vd8", "userID": "0msqIm5bufnBqrpL"}, {"name": "eqhwVhjnnjKMEmtb", "userID": "iWsAQHbMrKYi0Zxs"}, {"name": "5SWCqZXHLLa31oQf", "userID": "7BULnZDhutDM6Bqg"}], "roles": ["uqD5xxGxBWtnTKUe", "2znsqPzPkwCBo2Sw", "CUsTag4MLAo3m61P"]}' \
    > test.out 2>&1
eval_tap $? 71 'PublicStorePlayerAttributes' test.out

#- 72 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'PublicDeletePlayerAttributes' test.out

#- 73 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '2xaNfmn8Onb1a9gM' \
    --orderBy 'z0F2UBRmMhAbUWmF' \
    --status 'hdYLWzMuv3zkUY0n' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryMyGameSessions' test.out

#- 74 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '0BAZkwbYkBLyO6A0' \
    --orderBy 'FqfhnaB3YxKNdOTa' \
    --status 'cCcJfIfXshuLUk5W' \
    > test.out 2>&1
eval_tap $? 74 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE