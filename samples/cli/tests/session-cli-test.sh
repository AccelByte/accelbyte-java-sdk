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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 96, "PSNSupportedPlatforms": ["hqUI06UpOXGSLmCV", "uHOPlLlkvR8sKgnu", "RkgghGoYupD391C2"], "SessionTitle": "qtPYokahFjkQsfCa", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "f8TgoNm03VLisV6z", "XboxServiceConfigID": "wPuo3td6TC6I3lMj", "XboxSessionTemplateName": "GSWN2laRlxfcjHfY", "XboxTitleID": "akUCTqGkE7wcWfDs", "localizedSessionName": {"lpJSqGAXQ0yYoNRK": {}, "d3IL5TAQ6iiPlSC2": {}, "uE4o5Vwdo3fePqIJ": {}}}, "PSNBaseUrl": "A8IHtrkmu0hpDDWV", "autoJoin": true, "clientVersion": "NQy4uZAAiE0mit9R", "deployment": "GCCHYzUOcEdscKHP", "disableCodeGeneration": true, "dsManualSetReady": true, "dsSource": "Yv7t1o7TTr1DmrhZ", "fallbackClaimKeys": ["v15T7quIOvBMcaYm", "vCkGZ5dAgqxpBFma", "Loxozr6wfNPX2bOI"], "immutableStorage": true, "inactiveTimeout": 81, "inviteTimeout": 90, "joinability": "yLu0M3VHh2EI8JlD", "maxActiveSessions": 3, "maxPlayers": 86, "minPlayers": 99, "name": "PYGu0rdlgdWyOtXi", "persistent": true, "preferredClaimKeys": ["choQrpOsDBU5Sepj", "ChB3V0v52Dlym6pu", "Q23xoJ8aeCnaLpUK"], "requestedRegions": ["p44YUDjasWIPUvmE", "ejtGeoyIPa8ZRrvj", "j7il35MXbN9oCMNq"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "jTvhZNkSQ70D0H6B"}' \
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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 30, "PSNSupportedPlatforms": ["pf3vneSD2Tb3g7mS", "QUhAEtrmjqU6YE3p", "4lSck0ZHn5GI39YB"], "SessionTitle": "HqaTHeKtW18iGeUl", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "d9sogWa24CKNS0Gq", "XboxServiceConfigID": "VvUfHQvsHXNUNe4m", "XboxSessionTemplateName": "hgo5QB65lSAiYnNj", "XboxTitleID": "kfZrQvGgbLdLsFzH", "localizedSessionName": {"kBMr1yrOMlNFSrUE": {}, "irnjX9fDmIbeZxzf": {}, "TcyiuATus9hsfpFD": {}}}, "PSNBaseUrl": "cSDG8aMVGLiBNrDj", "autoJoin": true, "clientVersion": "byDPUIj88cekdqCt", "deployment": "81P1ktfIovmv9gsR", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "z9KOsb392k6YmJFf", "fallbackClaimKeys": ["RByjlBiuFM3FIoVk", "8T3GpAnkCmBUqg2S", "CnqntX9y1aZSWMiV"], "immutableStorage": false, "inactiveTimeout": 60, "inviteTimeout": 76, "joinability": "0sG6vxkfUcmqRRbc", "maxActiveSessions": 10, "maxPlayers": 56, "minPlayers": 73, "name": "JCjfcnLRfxeCSz9W", "persistent": true, "preferredClaimKeys": ["IaDml48wdNFLTm5T", "50x9WT0GfH2rtOa4", "EXsXzOXQAk4mqrxz"], "requestedRegions": ["TtuLl4XlbGL8QOxt", "jzm8y2wNhmwoYZyI", "4EFZKBcYrCEAE7WI"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "ehwH3q31A806DJga"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 's4b6z3LNUj7fdgLA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name '84Z8YYk6QEgJjBbE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DoNf3n0hEoRCAcf8' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name '0zfFyabWAgIUXiI0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "7A68eaqC2J9jyEW6"}' \
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
    --configurationName 'GLbc0NaKDUL3sa13' \
    --dsPodName 'lk1dQBHO86IlBhne' \
    --fromTime 'tU4RwTqUXlTDBzOu' \
    --gameMode 'YsaZA2yyd4mbqoOf' \
    --isPersistent 'ADMMAXFaY9eKa699' \
    --isSoftDeleted 'bRVhyaKwwrAP2aMl' \
    --joinability 'u7WtjCtoYetOO847' \
    --limit '13' \
    --matchPool 'bfoMm5cTtFWbotQy' \
    --memberID 'XJRcQWsmqPNs92ep' \
    --offset '47' \
    --order 'PXIuvUYTZBRujIUE' \
    --orderBy '1Tq5jyAZvkRCMNFI' \
    --sessionID 'urjh2imdb4rbkXj0' \
    --status 'ZwsVC0gL97ZVJSPq' \
    --statusV2 'Jiwv1qlYB1RSKs6g' \
    --toTime 'QxC3Gb7S0o4zGYY7' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"KQI1AeFgPqaOkvo1": {}, "aolB4lkKB4EYOkQ1": {}, "jMD3cym8xIfkOVW2": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["grREOLx0KOww3HIC", "QLfl7MUBG7qtPu64", "yAtURKLRkb738HGS"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6rDgMdIIlhS1fSiM' \
    --body '{"ready": false}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '331m7Ta1PsKc50Kv' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6ecnEevcAx2K2zkR' \
    --statusType 'enmPZnGBt4P7Wnbd' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'SJtjX7ZshZyZl5x4' \
    --key 'bRXBHUTrDzZSKscf' \
    --leaderID 'OcYu3dpCROYqUiGK' \
    --limit '2' \
    --memberID 'VFCmpo6sPwVOEDSJ' \
    --memberStatus 'sEK5QpNhlI2iS5Ep' \
    --offset '66' \
    --order 'aTIKUkmkk9QM0NBM' \
    --orderBy 'A9ORxpzwLR2AK6eX' \
    --partyID 'UGPJsw1fiP80G9Pc' \
    --value 'lxcft2ulIJzPyrVE' \
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
    --body '{"psn": {"clientId": "iOG4UcqsuGKHhMRW", "clientSecret": "LVd3DlhLuIpomM8s", "scope": "m1MiaI1mX2tJoARt"}}' \
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
    --sessionId 'dbBe7udsMrok0WvG' \
    > test.out 2>&1
eval_tap $? 32 'AdminReadSessionStorage' test.out

#- 33 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YYnx4V709xbnGezK' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteUserSessionStorage' test.out

#- 34 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sDwG2omOR2nvYI9T' \
    --userId 'VqJdvzcWbfUpaXp5' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadUserSessionStorage' test.out

#- 35 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'JMl5LL4bTxBmZjdr' \
    > test.out 2>&1
eval_tap $? 35 'AdminQueryPlayerAttributes' test.out

#- 36 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'rIxsB0NRsB1fPqqR' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlayerAttributes' test.out

#- 37 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"RulpqpymDkQhtrHW": {}, "wRVnwVBOqOHi8pWG": {}, "d1juYhiqjRJOqB5F": {}}, "autoJoin": false, "backfillTicketID": "3zFQbJndUDpdONne", "clientVersion": "AczbBdHb2slt71B1", "configurationName": "SmZp2JZp50CnPb71", "deployment": "ORYcmQbTU5JX8ccL", "dsSource": "jMXJRk0eaKQDOJvr", "fallbackClaimKeys": ["TefglSs6g4iY9u02", "aCNYIWekp18lOC3m", "NqF7Bl0LcghVHfPE"], "inactiveTimeout": 37, "inviteTimeout": 68, "joinability": "pxwhRON0bc1eMbEI", "matchPool": "jowLqc3ecjXJbZDK", "maxPlayers": 75, "minPlayers": 63, "preferredClaimKeys": ["oxLE1Y3Dymtj3giP", "g4x4yiPX6ues1Hhh", "kg1yLVbLFzHEP8cM"], "requestedRegions": ["4NTwr0KHaAsmTej5", "2WKi6tArAURt9plC", "SVq8PdH6hJPUAc0R"], "serverName": "VwXgAgntLMCuaXBW", "teams": [{"UserIDs": ["Qi6BqPg4xr0lCanc", "UZGCHsZYoLfR1KtO", "v7Zy0b65uvuKNuy0"], "parties": [{"partyID": "ytZQ7M6Nzy1adnSK", "userIDs": ["OLFKx1dX4LuWJu3p", "DMUAeeZ97SBROPYu", "G6XqP6oo7G73zdxT"]}, {"partyID": "gOfnwIdlNa29fDLh", "userIDs": ["741IslKHzGlLKWUt", "DQs61OQAoxyyQpRW", "CiiPDGQhNPEwiJCf"]}, {"partyID": "2XJVrlzqQls1ozhL", "userIDs": ["VA3kE8jKvgatOEBM", "70TdlNBJYOmpu1VC", "arzBsV6xnZ5Jrzzj"]}]}, {"UserIDs": ["rcaug6CWVG8SWP3g", "lU6muswVJnNnN7kA", "a7j0riFc5HTHQIoV"], "parties": [{"partyID": "sGo7dwV9DBqFKHQk", "userIDs": ["ETJyTlUrwDTnoujQ", "D4IEiH9Z5qXn3aoR", "tlqOECohViHA5Czg"]}, {"partyID": "FSy8X1A3PrIfapq5", "userIDs": ["AAeMe4L3mDWORBVX", "TIIJM9XsYIIZxiXN", "MR9BgaWcFX3SUBhy"]}, {"partyID": "oTsMWPAxUMkawaGp", "userIDs": ["AyrIwMif3BOdkocV", "Td4BxqGWV6mTJ0sQ", "s6XNbjvqhnUVLWu8"]}]}, {"UserIDs": ["olKdxL6ozRmDD0jJ", "vlfV5OemPYdYT7DR", "OCjtuzFMbAG9YI89"], "parties": [{"partyID": "hmguB8FOTjMLo4b9", "userIDs": ["rIzqYkEpstyVTBcr", "M8rG0rH0zcswwVeM", "K6MbGIVIu8vvwLc7"]}, {"partyID": "KY3uVoJXTIMtpgki", "userIDs": ["eDyF97lGdMiHKxbW", "CYzo8yO2KTK9tmmO", "nYnOpas6ghP1y4Zi"]}, {"partyID": "7s7QBlk44Z44B1GZ", "userIDs": ["gKg4uKxaCgcGLuC3", "brWdTYCfHkIySok5", "DiXZtLW87rGysryo"]}]}], "textChat": false, "ticketIDs": ["d6X3viLvtEk4mTIp", "UA9gxo8SV38nEhoX", "mM2W7l6jHMA2rG3n"], "tieTeamsSessionLifetime": false, "type": "4JUMSHNgqRqCV7us"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateGameSession' test.out

#- 38 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"amANkZlOX9Sfo95H": {}, "gXqKhTPkwfLM9uSy": {}, "bRzWek2gZvRrvr0n": {}}' \
    > test.out 2>&1
eval_tap $? 38 'PublicQueryGameSessionsByAttributes' test.out

#- 39 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9d9lvccKMLhrTrcB"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicSessionJoinCode' test.out

#- 40 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'E2ItBS3KtKZWe8ao' \
    > test.out 2>&1
eval_tap $? 40 'GetGameSessionByPodName' test.out

#- 41 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FzAyBME74HUtipUW' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSession' test.out

#- 42 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YhWV1qx8CzPML52f' \
    --body '{"attributes": {"aXUr9Sk4lq2faBcA": {}, "XXKlhvyH8paOJtxq": {}, "MPpcVfRwNj547fH0": {}}, "backfillTicketID": "XrKEDpEY8VnocGAj", "clientVersion": "ci0V3tBf2jnHGKXp", "deployment": "hn50c9tNLDljhZ2j", "fallbackClaimKeys": ["xLRX3z46OCaGBeMf", "PlNos4yBRjrERHEo", "nAZR8GmEu0q1p6QC"], "inactiveTimeout": 51, "inviteTimeout": 95, "joinability": "Y6vSkVFWdsbYuVEG", "matchPool": "VxYheR3j5mNZ6vwv", "maxPlayers": 27, "minPlayers": 76, "preferredClaimKeys": ["a08gxefTYKhuxaEc", "7M4P7UckSC6ePeN8", "i4GrFES9z7xueHpA"], "requestedRegions": ["THccee9GXhKcjmSE", "wdrkEnnqKzFsLfYa", "lUlfwEQKjU7eHGeb"], "teams": [{"UserIDs": ["SVu0LQ40kepEaC4d", "fiOMZfEhHr39pysF", "O3Zvc1BZG99Lyvfv"], "parties": [{"partyID": "HEsJKQQewVLMUoAn", "userIDs": ["aRcYp7FUjfIGaffo", "flEIByYqeKN0meGe", "lYF5wWaDhukU4khG"]}, {"partyID": "G4vZFTYnPkmSu4PW", "userIDs": ["am1jxR7SETWjteoc", "8fgvZDDhoO05oKqy", "mxLD1Lcvw6T6mZEi"]}, {"partyID": "wxxElpMYSWIeVzm7", "userIDs": ["z9noowmlTIKVowi0", "RY2VN4ZONJREdUQ3", "z9F1BxNNgnke4akn"]}]}, {"UserIDs": ["cw7wu9TmXfJWBPrx", "9Ns8eLzYEvwSWTaL", "QjctvrK2jhsYpKPl"], "parties": [{"partyID": "Xn77AtYoFzLAATPY", "userIDs": ["8P8P3cfoivvQxeve", "cWw7Rry0KK5rgAGO", "0dW8rX2MVUGKSZ4G"]}, {"partyID": "cLkt4pK32sJxlZcC", "userIDs": ["TpTdRtCHvuk6B6XT", "mSLyn50sigBVZxiK", "dV57GvRyd9UuL02L"]}, {"partyID": "e8HSCslsDd4M1F5q", "userIDs": ["RIblS7Nz81GRazPA", "ANjfBoldFOyqA2cl", "J5gEOaCgM6Yn6Rug"]}]}, {"UserIDs": ["bNEIpGBFUjOn5mM7", "k8nbLzvtCIW5ynMK", "quUicAeIVXtoWAXh"], "parties": [{"partyID": "MlW4tLqX7OICf5oD", "userIDs": ["1e6oI9FmYel0kOw7", "2o8Zkgk0jS6rDWUw", "fhKvrf2AaH4yCWrH"]}, {"partyID": "SppnIZkNnTn3rzH5", "userIDs": ["NvAtcvNedgS1fUfK", "mihDbmu8ePWlQMVD", "XEHeiGTnwyEw6hIW"]}, {"partyID": "DZrpP7rz3ISW510k", "userIDs": ["Hr4isTKWjmv67nuH", "CXWfwnwGioVwVzmm", "BVVFfpqx1AeLtzcP"]}]}], "ticketIDs": ["J3jtDYBo4FUTH7CG", "fKSyxgRR1DiCqSMz", "pqIFGLkDs7ACC1Rg"], "tieTeamsSessionLifetime": true, "type": "z0UV31MfuGaXsAuG", "version": 38}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateGameSession' test.out

#- 43 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'E35YhyiDV90SeI5y' \
    > test.out 2>&1
eval_tap $? 43 'DeleteGameSession' test.out

#- 44 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ppBHoytVznCgNyx9' \
    --body '{"attributes": {"fbT63ShEh8PbGikL": {}, "jgjcj34uulU6FYBZ": {}, "sWFbr3RSP0W9nBhv": {}}, "backfillTicketID": "hf8Q0DtJMcYQdN66", "clientVersion": "bswAgt65X4N1LQZm", "deployment": "B61JMdtwCVUrYQue", "fallbackClaimKeys": ["84dwmbwFEnAZaWsQ", "JtRYoagRJK5PX9Uc", "OvhPyE11TRT2SKse"], "inactiveTimeout": 30, "inviteTimeout": 32, "joinability": "e8VLie0LBa36KNzj", "matchPool": "f005CXNGehQ2aTjT", "maxPlayers": 61, "minPlayers": 13, "preferredClaimKeys": ["fKFDXC7eGL5YhJDW", "h9YWqc0qgV6d9yOf", "IMLds2DbPcaoMdtR"], "requestedRegions": ["LTmSvTkQQgB7exYv", "mHMxr5hPCJJztJBg", "0tTJg46IewOXE2Ak"], "teams": [{"UserIDs": ["Ch3QIZsUf8lGFXcm", "wTERHclOdxIwqejx", "e18rNdb8Otq6j1mq"], "parties": [{"partyID": "Uav7k05HAQltnSoj", "userIDs": ["V4jT65yclX2FtAz0", "vJjFIYWOaNdsimmk", "W2miH3xRHAKy4QxZ"]}, {"partyID": "kaXZ7vmiEd0JPxVy", "userIDs": ["QpshaDwNqTbbFMXA", "MfVXe0GZeMgsRsmH", "1EQrYmkPKTPOlhTt"]}, {"partyID": "SiZNCxuogFteTHJe", "userIDs": ["4BhSSQkQD6WmOt6D", "7ufFVTOhvQpfbBke", "8aEdd36xj6wySolt"]}]}, {"UserIDs": ["DxsbzxrlaKEfkoYj", "Y2o6ouRW9UtNquwC", "3WgumrIz4NhGztZp"], "parties": [{"partyID": "r4U4fwQIiLXgmRas", "userIDs": ["vjO4lj8m3XEwP2b4", "gd3xOeii8Jnmssep", "2xD2NY0kABeGs9yx"]}, {"partyID": "ahld1pO0Gyf5PO3C", "userIDs": ["OyMvczgEpzZ3Fbtx", "fhcRC7IVYa6iZ5uF", "RYNn3SHiWxF0YbuU"]}, {"partyID": "5ar5qTLWUCy0Afgc", "userIDs": ["050XIZRW491e94mQ", "jVOOBnIWhunElqZU", "odp3IhtCSHy1ei1f"]}]}, {"UserIDs": ["IrPvfHnRN06EjRwE", "QlNapJRfk4f9Zcw1", "pEHAyNFxcVTKuAQT"], "parties": [{"partyID": "Gh5BxjWOozGoDtsU", "userIDs": ["uYo5p8ED5QZAufwN", "a8lzfjv9oYMXMjlV", "HY1AHwF3vGoav7MK"]}, {"partyID": "0PcLnEkcokKwcQ0b", "userIDs": ["aDT9OyJ2h23GUS2a", "mU7syGlElXdEAOrV", "SnLocLVVYamQc4wc"]}, {"partyID": "G5nDBLJoJHbiQ5du", "userIDs": ["E5p4cfs2E41cK8QT", "wiIAvxSvNDlmM5nQ", "FMGzs7fzjgyc44mE"]}]}], "ticketIDs": ["h9tRk8knYSV30lnr", "oQehMDli6t9unQLY", "Xxm09wpGAbpEmDY9"], "tieTeamsSessionLifetime": true, "type": "kZEY8rG0q0Q2Qd2J", "version": 52}' \
    > test.out 2>&1
eval_tap $? 44 'PatchUpdateGameSession' test.out

#- 45 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OotKwG3UC6XCnnZx' \
    --body '{"backfillTicketID": "F8CmQr17W65br34r"}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateGameSessionBackfillTicketID' test.out

#- 46 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BBN9tU6TDm5GloFS' \
    > test.out 2>&1
eval_tap $? 46 'GameSessionGenerateCode' test.out

#- 47 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KWM1eym5ydC6p25x' \
    > test.out 2>&1
eval_tap $? 47 'PublicRevokeGameSessionCode' test.out

#- 48 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CWTqUOYZENJ1QHZQ' \
    --body '{"platformID": "xPRXH7uxBJEECQE1", "userID": "li3Bg7Jxc9pUnZmv"}' \
    > test.out 2>&1
eval_tap $? 48 'PublicGameSessionInvite' test.out

#- 49 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hidwCkZwqjYLfTiC' \
    > test.out 2>&1
eval_tap $? 49 'JoinGameSession' test.out

#- 50 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'O1NDBvQvRPnAz4Vz' \
    --body '{"leaderID": "W0CpoBCbyJsF5IjF"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPromoteGameSessionLeader' test.out

#- 51 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1c0W338HS6CBgVRy' \
    > test.out 2>&1
eval_tap $? 51 'LeaveGameSession' test.out

#- 52 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ihYNZ84CVhziXV8H' \
    > test.out 2>&1
eval_tap $? 52 'PublicGameSessionReject' test.out

#- 53 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wSmvcvcDKF19yVRa' \
    --body '{"additionalMembers": [{"partyID": "fCjOuSYht83AdvBa", "userIDs": ["agTiRJ8daGTVX3Bb", "7jlz5IfHgKjI9mwJ", "SrN8jkIykR2zbaI6"]}, {"partyID": "PD7fEscShnGUGUtV", "userIDs": ["9GJ279GDbLNwjm3F", "K0nnX2poMfZ1hDHt", "bh4HtMlFgvh2Dp2S"]}, {"partyID": "oiIPp1yvfAHS0VgL", "userIDs": ["u11A3HTovFi4tPAG", "fleyCA6jEtcqsnzo", "VILjkwW61duF87aU"]}], "proposedTeams": [{"UserIDs": ["yrdt4XSpWBAetsan", "zqP8oxfrtbECD1CY", "PwaiBAxfYL8Avt70"], "parties": [{"partyID": "ZUT2fSk3LL0calqx", "userIDs": ["EewuGS469k2hG0WK", "t4sUmanYxM0UHZVN", "YzGMNIpWoSLkUrfu"]}, {"partyID": "f4U3WeYeA9t2ENKK", "userIDs": ["WrFtHIi1CMgKAOG5", "iDcCR5PbCvDLil8w", "j9cKM3Ar6MF35hCE"]}, {"partyID": "R4nGmWGgTJfHlJl4", "userIDs": ["tHGa4XfZcd9CVnGq", "MX9FieeEssWEUl07", "bhwntCVqiYOJf5Kw"]}]}, {"UserIDs": ["MZQjzvjSozv6CTRD", "l0zp9CzHFwinkBNi", "4gvqgl6TZ9TGVPmv"], "parties": [{"partyID": "34h6T7EsufmfxKYB", "userIDs": ["4LM6H6QXmpZ9X3fU", "SR1l9xLPBsmAUrD9", "L1IiD6MlcEPhMDFz"]}, {"partyID": "jHZ3sIhzOx2CXKlv", "userIDs": ["IomU3pIxM9n8D2eL", "Me3lt9qfx2UDcgVE", "7L9FK6e0MrPc4vtx"]}, {"partyID": "k9hVKlG56HlzGr7X", "userIDs": ["jdyRJunZPkp6ccIB", "nWyPw8mj7gyQ7XdI", "szGRj46COPipH1MW"]}]}, {"UserIDs": ["VTHG0qHJCWEfOJpZ", "m9yEYWNGMy2pgSGS", "UOK68eqGJtWf1Ybg"], "parties": [{"partyID": "g8rdwY9bmrvHmO07", "userIDs": ["KNqX9LM2IwEsdOGB", "XBwnzDX8v3xgC1Ge", "9PdbTTAJ2Gp1r0sV"]}, {"partyID": "Z6LJAOddIL2l3hPj", "userIDs": ["NDKv2LWfXqjr8fS7", "9En3wYowBdkaZ3y6", "i38XQjLDRqkpiFK5"]}, {"partyID": "BtiQ272Uo9UBJWod", "userIDs": ["pdwsX1jorcyR0x3Y", "iHF8ITGPRQBCgIs1", "Q2lzxl0yF5m77TTh"]}]}], "version": 80}' \
    > test.out 2>&1
eval_tap $? 53 'AppendTeamGameSession' test.out

#- 54 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gUoj8u2WRcLiEtzV"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicPartyJoinCode' test.out

#- 55 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lnkflfn7pHY48F1d' \
    > test.out 2>&1
eval_tap $? 55 'PublicGetParty' test.out

#- 56 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'l1q92m3iRlfnBAk0' \
    --body '{"attributes": {"CwiAsR65yQ9ssuHd": {}, "GmxncCEr0KcgeqzG": {}, "bruNB72HHMkjzyBB": {}}, "inactiveTimeout": 73, "inviteTimeout": 96, "joinability": "UrI6MAugK5kypNrp", "maxPlayers": 79, "minPlayers": 27, "type": "FxKybPkbuS6x9cLJ", "version": 40}' \
    > test.out 2>&1
eval_tap $? 56 'PublicUpdateParty' test.out

#- 57 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'APnNlsa2bRBr27fV' \
    --body '{"attributes": {"MWuAfDqLMR919IZP": {}, "KOKiAVQXXOmqFHLb": {}, "yXmgCNiXH8uenbC5": {}}, "inactiveTimeout": 59, "inviteTimeout": 21, "joinability": "phgMweexsIAP5vHL", "maxPlayers": 18, "minPlayers": 56, "type": "BJ9iqMcBL4BzhDUj", "version": 15}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPatchUpdateParty' test.out

#- 58 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xNInDByhnoluO6ti' \
    > test.out 2>&1
eval_tap $? 58 'PublicGeneratePartyCode' test.out

#- 59 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '0QP2ssiJ66OzOj84' \
    > test.out 2>&1
eval_tap $? 59 'PublicRevokePartyCode' test.out

#- 60 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'O6tgohjtC7bzjPpu' \
    --body '{"platformID": "cddXJ5zifF8y959a", "userID": "nrNSleywHbHig6IK"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPartyInvite' test.out

#- 61 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WVZ77KeRWdECaFGz' \
    --body '{"leaderID": "fZ2hxcJ2Fnemn7M2"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPromotePartyLeader' test.out

#- 62 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '3SzUo4hNBDh9ZFP1' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyJoin' test.out

#- 63 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OW0nXOErQPS4VsRo' \
    > test.out 2>&1
eval_tap $? 63 'PublicPartyLeave' test.out

#- 64 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'YIK69yg9ADCGiXaL' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyReject' test.out

#- 65 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 's2xjHkinOD975nAR' \
    --userId 'HCmhNHSXuqIHsxva' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyKick' test.out

#- 66 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"UoXDmwWsukxncuD3": {}, "QxCXMd00YBWCaVVm": {}, "M45mfIZsWhkS476d": {}}, "configurationName": "GGJwJ00UH197MJ6z", "inactiveTimeout": 95, "inviteTimeout": 37, "joinability": "JLMQyMWzYQCAaPJg", "maxPlayers": 30, "members": [{"ID": "a7WwIc895ImqK6tV", "PlatformID": "saUq3stUh5J5Z9Gi", "PlatformUserID": "BiSAylX5cS0IeHpW"}, {"ID": "CugmfOL0QQpxsuD8", "PlatformID": "PGqku59eFJrOXyDY", "PlatformUserID": "z9vMUOPG0iHDT8Qb"}, {"ID": "F7gHPTPQbvLt2NRq", "PlatformID": "JGIKzLyH1y72L13O", "PlatformUserID": "rnyx34luLdvtsTKX"}], "minPlayers": 80, "textChat": false, "type": "oe8KDgy0xZfAcNg1"}' \
    > test.out 2>&1
eval_tap $? 66 'PublicCreateParty' test.out

#- 67 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4Ws8TIP1LKiFQoLD' \
    --body '{"vumfqrgSfnx2h61X": {}, "9dN1MGRXBJ6mVV7J": {}, "S9qjNLwvI8JdiY3R": {}}' \
    > test.out 2>&1
eval_tap $? 67 'PublicUpdateInsertSessionStorageLeader' test.out

#- 68 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RiLilmOGF6dLLIeI' \
    --userId 'VIjMcdlbdRXTGIrd' \
    --body '{"NL5gJPqTAjgqaTHf": {}, "1ANTJ9Yk997XkGOd": {}, "C6ItxDT8p4n4XCFk": {}}' \
    > test.out 2>&1
eval_tap $? 68 'PublicUpdateInsertSessionStorage' test.out

#- 69 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["D1AJLCwszbZxuHSg", "DOK8bjoF7bL2635K", "btZTGJpqgl2IzNXG"]}' \
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