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
echo "1..77"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 96, "PSNSupportedPlatforms": ["hqUI06UpOXGSLmCV", "uHOPlLlkvR8sKgnu", "RkgghGoYupD391C2"], "SessionTitle": "qtPYokahFjkQsfCa", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "f8TgoNm03VLisV6z", "XboxServiceConfigID": "wPuo3td6TC6I3lMj", "XboxSessionTemplateName": "GSWN2laRlxfcjHfY", "XboxTitleID": "akUCTqGkE7wcWfDs", "localizedSessionName": {"lpJSqGAXQ0yYoNRK": {}, "d3IL5TAQ6iiPlSC2": {}, "uE4o5Vwdo3fePqIJ": {}}}, "PSNBaseUrl": "A8IHtrkmu0hpDDWV", "attributes": {"Ala2l5BYNtIuS5S5": {}, "XUdjsoqwGyzzWi9g": {}, "wQYv7t1o7TTr1Dmr": {}}, "autoJoin": false, "clientVersion": "os9Jcdos4fYcTVU6", "deployment": "RBt0zYoMcHyCUEXl", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "vxJMdalwSyliWMNW", "enableSecret": true, "fallbackClaimKeys": ["NyLu0M3VHh2EI8Jl", "DbPWbQ6Q9lNmqRBa", "AkLnvxkT1X68cmDc"], "immutableStorage": false, "inactiveTimeout": 9, "inviteTimeout": 48, "joinability": "pjChB3V0v52Dlym6", "leaderElectionGracePeriod": 31, "maxActiveSessions": 75, "maxPlayers": 41, "minPlayers": 86, "name": "NB3Gv0IqmF51Tkhj", "persistent": false, "preferredClaimKeys": ["4YUDjasWIPUvmEej", "tGeoyIPa8ZRrvjj7", "il35MXbN9oCMNqq9"], "requestedRegions": ["8SjTvhZNkSQ70D0H", "6BXksUC9b6i5lZC9", "xv32e8c5csSovoqs"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "wbmXgdAPh1EThG96"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminCreateConfigurationTemplateV1' test.out

#- 15 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --name 'QZxfgPubTDIHrvqA' \
    --offset '94' \
    --order '3EeERmDnyeFoF7VS' \
    --orderBy 'Z6pf3vneSD2Tb3g7' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllConfigurationTemplatesV1' test.out

#- 16 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'mSQUhAEtrmjqU6YE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetConfigurationTemplateV1' test.out

#- 17 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '3p4lSck0ZHn5GI39' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 0, "PSNSupportedPlatforms": ["BHqaTHeKtW18iGeU", "lc9d9sogWa24CKNS", "0GqVvUfHQvsHXNUN"], "SessionTitle": "e4mhgo5QB65lSAiY", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "NjkfZrQvGgbLdLsF", "XboxServiceConfigID": "zHkBMr1yrOMlNFSr", "XboxSessionTemplateName": "UEirnjX9fDmIbeZx", "XboxTitleID": "zfTcyiuATus9hsfp", "localizedSessionName": {"FDcSDG8aMVGLiBNr": {}, "DjqoxcwgGLXpUL4p": {}, "p2ncYAHdNzDmeIP6": {}}}, "PSNBaseUrl": "rOvDz9KOsb392k6Y", "attributes": {"mJFfRByjlBiuFM3F": {}, "IoVk8T3GpAnkCmBU": {}, "qg2SCnqntX9y1aZS": {}}, "autoJoin": true, "clientVersion": "MiVi10sG6vxkfUcm", "deployment": "qRRbceJ5i0EeDxOg", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "nhhqElIaDml48wdN", "enableSecret": true, "fallbackClaimKeys": ["m5T50x9WT0GfH2rt", "Oa4EXsXzOXQAk4mq", "rxzTtuLl4XlbGL8Q"], "immutableStorage": true, "inactiveTimeout": 47, "inviteTimeout": 1, "joinability": "tjzm8y2wNhmwoYZy", "leaderElectionGracePeriod": 72, "maxActiveSessions": 71, "maxPlayers": 63, "minPlayers": 68, "name": "FZKBcYrCEAE7WIsf", "persistent": false, "preferredClaimKeys": ["hwH3q31A806DJgas", "4b6z3LNUj7fdgLA8", "4Z8YYk6QEgJjBbED"], "requestedRegions": ["oNf3n0hEoRCAcf80", "zfFyabWAgIUXiI07", "A68eaqC2J9jyEW6G"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "YbsKoADkzJEN2VHz"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateConfigurationTemplateV1' test.out

#- 18 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'ih3bit0VWn3CO39P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteConfigurationTemplateV1' test.out

#- 19 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'XDNxtXgeO3FgkXhj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzaQY3snn2ZkP7cF' \
    > test.out 2>&1
eval_tap $? 19 'AdminGetMemberActiveSession' test.out

#- 20 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'dP43e5dC9XIBudfZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "grbHDIDm4hMzF4Tx"}' \
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
    --configurationName 'odenSrUTvfqU0bfo' \
    --dsPodName 'Mm5cTtFWbotQyXJR' \
    --fromTime 'cQWsmqPNs92epxk0' \
    --gameMode 'i8VxsZNereSvf969' \
    --isPersistent '9mCEHThUJkETAsSp' \
    --isSoftDeleted '7gh4TeUTkOkAYfJB' \
    --joinability '8AT9t4Tv207Y2QD3' \
    --limit '29' \
    --matchPool 'v1qlYB1RSKs6gQxC' \
    --memberID '3Gb7S0o4zGYY7KQI' \
    --offset '26' \
    --order 'AeFgPqaOkvo1aolB' \
    --orderBy '4lkKB4EYOkQ1jMD3' \
    --sessionID 'cym8xIfkOVW2grRE' \
    --status 'OLx0KOww3HICQLfl' \
    --statusV2 '7MUBG7qtPu64yAtU' \
    --toTime 'RKLRkb738HGS6rDg' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryGameSessions' test.out

#- 24 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"MdIIlhS1fSiM9331": {}, "m7Ta1PsKc50Kv6ec": {}, "nEevcAx2K2zkRenm": {}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryGameSessionsByAttributes' test.out

#- 25 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["PZnGBt4P7WnbdSJt", "jX7ZshZyZl5x4bRX", "BHUTrDzZSKscfOcY"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteBulkGameSessions' test.out

#- 26 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'u3dpCROYqUiGKXVF' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 26 'AdminSetDSReady' test.out

#- 27 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'Ro2ogaKt2ujQSa3Z' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'db65UXmy0Zp6iIaT' \
    --statusType 'IKUkmkk9QM0NBMA9' \
    > test.out 2>&1
eval_tap $? 27 'AdminUpdateGameSessionMember' test.out

#- 28 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '40' \
    --order 'RxpzwLR2AK6eXUGP' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetListNativeSession' test.out

#- 29 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'Jsw1fiP80G9Pclxc' \
    --key 'ft2ulIJzPyrVEiOG' \
    --leaderID '4UcqsuGKHhMRWLVd' \
    --limit '62' \
    --memberID 'DlhLuIpomM8sm1Mi' \
    --memberStatus 'aI1mX2tJoARtdbBe' \
    --offset '28' \
    --order 'udsMrok0WvGYYnx4' \
    --orderBy 'V709xbnGezKsDwG2' \
    --partyID 'omOR2nvYI9TVqJdv' \
    --value 'zcWbfUpaXp5JMl5L' \
    > test.out 2>&1
eval_tap $? 29 'AdminQueryParties' test.out

#- 30 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'AdminGetPlatformCredentials' test.out

#- 31 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "L4bTxBmZjdrrIxsB", "clientSecret": "0NRsB1fPqqRRulpq", "scope": "pymDkQhtrHWwRVnw"}}' \
    > test.out 2>&1
eval_tap $? 31 'AdminUpdatePlatformCredentials' test.out

#- 32 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminDeletePlatformCredentials' test.out

#- 33 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VBOqOHi8pWGd1juY' \
    > test.out 2>&1
eval_tap $? 33 'AdminReadSessionStorage' test.out

#- 34 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hiqjRJOqB5F93zFQ' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteUserSessionStorage' test.out

#- 35 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bJndUDpdONneAczb' \
    --userId 'BdHb2slt71B1SmZp' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadUserSessionStorage' test.out

#- 36 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '2JZp50CnPb71ORYc' \
    > test.out 2>&1
eval_tap $? 36 'AdminQueryPlayerAttributes' test.out

#- 37 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'mQbTU5JX8ccLjMXJ' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerAttributes' test.out

#- 38 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Rk0eaKQDOJvrTefg": {}, "lSs6g4iY9u02aCNY": {}, "IWekp18lOC3mNqF7": {}}, "autoJoin": true, "backfillTicketID": "5ElEa9EIIlGcHB3C", "clientVersion": "fR3ncDlwi3v3MFFJ", "configurationName": "1KesKoELCpobBEG8", "deployment": "X645xpdXpai0rYaT", "dsSource": "5hOPjaf3H0tYighU", "fallbackClaimKeys": ["0VUfcYHJbBfAKSiP", "W3VgsZXiR1DJ7HVW", "qMkNSawQUWDFJvJB"], "inactiveTimeout": 99, "inviteTimeout": 17, "joinability": "PdH6hJPUAc0RVwXg", "matchPool": "AgntLMCuaXBWQi6B", "maxPlayers": 33, "minPlayers": 61, "preferredClaimKeys": ["Pg4xr0lCancUZGCH", "sZYoLfR1KtOv7Zy0", "b65uvuKNuy0ytZQ7"], "requestedRegions": ["M6Nzy1adnSKOLFKx", "1dX4LuWJu3pDMUAe", "eZ97SBROPYuG6XqP"], "serverName": "6oo7G73zdxTgOfnw", "teams": [{"UserIDs": ["IdlNa29fDLh741Is", "lKHzGlLKWUtDQs61", "OQAoxyyQpRWCiiPD"], "parties": [{"partyID": "GQhNPEwiJCf2XJVr", "userIDs": ["lzqQls1ozhLVA3kE", "8jKvgatOEBM70Tdl", "NBJYOmpu1VCarzBs"]}, {"partyID": "V6xnZ5Jrzzjrcaug", "userIDs": ["6CWVG8SWP3glU6mu", "swVJnNnN7kAa7j0r", "iFc5HTHQIoVsGo7d"]}, {"partyID": "wV9DBqFKHQkETJyT", "userIDs": ["lUrwDTnoujQD4IEi", "H9Z5qXn3aoRtlqOE", "CohViHA5CzgFSy8X"]}]}, {"UserIDs": ["1A3PrIfapq5AAeMe", "4L3mDWORBVXTIIJM", "9XsYIIZxiXNMR9Bg"], "parties": [{"partyID": "aWcFX3SUBhyoTsMW", "userIDs": ["PAxUMkawaGpAyrIw", "Mif3BOdkocVTd4Bx", "qGWV6mTJ0sQs6XNb"]}, {"partyID": "jvqhnUVLWu8olKdx", "userIDs": ["L6ozRmDD0jJvlfV5", "OemPYdYT7DROCjtu", "zFMbAG9YI89hmguB"]}, {"partyID": "8FOTjMLo4b9rIzqY", "userIDs": ["kEpstyVTBcrM8rG0", "rH0zcswwVeMK6MbG", "IVIu8vvwLc7KY3uV"]}]}, {"UserIDs": ["oJXTIMtpgkieDyF9", "7lGdMiHKxbWCYzo8", "yO2KTK9tmmOnYnOp"], "parties": [{"partyID": "as6ghP1y4Zi7s7QB", "userIDs": ["lk44Z44B1GZgKg4u", "KxaCgcGLuC3brWdT", "YCfHkIySok5DiXZt"]}, {"partyID": "LW87rGysryod3dNQ", "userIDs": ["rmsApRA6HX3RwrKt", "2ecozL0TOg54vCE4", "8L5oLF6M4lNa4JUM"]}, {"partyID": "SHNgqRqCV7usamAN", "userIDs": ["kZlOX9Sfo95HgXqK", "hTPkwfLM9uSybRzW", "ek2gZvRrvr0n9d9l"]}]}], "textChat": true, "ticketIDs": ["WvgpVyW9dD1kOmvr", "Aejcq2LgkQuaS7RB", "x3vim02jBOxrZDyv"], "tieTeamsSessionLifetime": true, "type": "qx8CzPML52faXUr9"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateGameSession' test.out

#- 39 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"Sk4lq2faBcAXXKlh": {}, "vyH8paOJtxqMPpcV": {}, "fRwNj547fH0XrKED": {}}' \
    > test.out 2>&1
eval_tap $? 39 'PublicQueryGameSessionsByAttributes' test.out

#- 40 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pEY8VnocGAjci0V3"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicSessionJoinCode' test.out

#- 41 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'tBf2jnHGKXphn50c' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSessionByPodName' test.out

#- 42 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9tNLDljhZ2jxLRX3' \
    > test.out 2>&1
eval_tap $? 42 'GetGameSession' test.out

#- 43 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z46OCaGBeMfPlNos' \
    --body '{"attributes": {"4yBRjrERHEonAZR8": {}, "GmEu0q1p6QCyY6vS": {}, "kVFWdsbYuVEGVxYh": {}}, "backfillTicketID": "eR3j5mNZ6vwv7K8A", "clientVersion": "svt1j1Rx59hesNWy", "deployment": "2NvZ85DDKDAF8KDs", "fallbackClaimKeys": ["BZOuYQJ03BAHZ7c5", "3q7akMpcmnnx6RVB", "rop9v7aZK3h65hbN"], "inactiveTimeout": 12, "inviteTimeout": 46, "joinability": "zfQSfQrtfF3TQN0O", "matchPool": "cNDLr36vzohZyjMQ", "maxPlayers": 54, "minPlayers": 11, "preferredClaimKeys": ["g5mPYhrLTyU8Ohgf", "Y9JQYGF4bYXEcENx", "9xZlAchob44lONDD"], "requestedRegions": ["wMvgI0HlyPR7wZNi", "VsF6xG2mXEQdbzIV", "y8alncV7vWgSHdfo"], "teams": [{"UserIDs": ["07UctPErqxyMyOK0", "6MqQBErxgjVBycvU", "4PbmRDcrg0DjQjBE"], "parties": [{"partyID": "CXvea7H1m2lJFRZ3", "userIDs": ["ZprZ60zMjhTHeh94", "TSenE5hCFkIf5weq", "Z18MH57l2Zsrh90E"]}, {"partyID": "TtYmGukz3MnlrjcH", "userIDs": ["p6B8Vj7rXFgDnDkd", "Z9bpjb1tdA3QhjCM", "W64f4XhIjSoTB2NM"]}, {"partyID": "KtezapPr2QEPx3zT", "userIDs": ["xBGtEJIYppuUSsKo", "Hw2hyd12uSE7BEv3", "aevq6iohU1cg4W1I"]}]}, {"UserIDs": ["S3Uv1BpWoJBaqdg2", "FHcunsS1lnaO2m9v", "qjhbeK2qN8g6x2Py"], "parties": [{"partyID": "YDo5R3hLiD5sf5y1", "userIDs": ["JsxJNGmyt0SQDUDo", "WBZVGLlkUetzCAWc", "9x1aMjgGim51T107"]}, {"partyID": "XIZRZ7tZdIs0xf4c", "userIDs": ["zdt7zqmSKxOEQlVc", "x6GqsBq8vdhWVnuY", "LgpZehK0G2nmyuVi"]}, {"partyID": "B9kRTcSQdTnNYGeA", "userIDs": ["fYFG3wSkHKufBdS3", "ZOokZB4cXnAXyuGz", "6LlxHv8SwyagYvDJ"]}]}, {"UserIDs": ["3w3UNgIGj2jZtEYT", "8sIPSE1XXPzySa0s", "ZoFS6xCOWMpyh9pM"], "parties": [{"partyID": "sQgb64ELbzDMwyo4", "userIDs": ["nIRysQdbufXjYnSo", "IFeouC2m38kXrDZW", "lGVE9sJ4NpUtKp6M"]}, {"partyID": "9I6nEwnZhsjwJeGw", "userIDs": ["aPSDMZz95OYKiqaZ", "D63xe5rruJVfLGea", "0ZtlzUcuHAXz0UV3"]}, {"partyID": "1MfuGaXsAuGsZaSH", "userIDs": ["evO0TQNEI3kfabxJ", "WWSI1ECUo1NPpeFh", "UztXDgB7n4C97uAP"]}]}], "ticketIDs": ["P8PATLpUpxeJlsBJ", "T6Hh3OMjAjq2mK8l", "bSEEelxnb5QxWG2H"], "tieTeamsSessionLifetime": true, "type": "nZlA6HKWW4fI1IQc", "version": 30}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateGameSession' test.out

#- 44 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'twCVUrYQue84dwmb' \
    > test.out 2>&1
eval_tap $? 44 'DeleteGameSession' test.out

#- 45 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wFEnAZaWsQJtRYoa' \
    --body '{"attributes": {"gRJK5PX9UcOvhPyE": {}, "11TRT2SKseoe8VLi": {}, "e0LBa36KNzjf005C": {}}, "backfillTicketID": "XNGehQ2aTjTDfKFD", "clientVersion": "XC7eGL5YhJDWh9YW", "deployment": "qc0qgV6d9yOfIMLd", "fallbackClaimKeys": ["s2DbPcaoMdtRLTmS", "vTkQQgB7exYvmHMx", "r5hPCJJztJBg0tTJ"], "inactiveTimeout": 12, "inviteTimeout": 97, "joinability": "46IewOXE2AkCh3QI", "matchPool": "ZsUf8lGFXcmwTERH", "maxPlayers": 4, "minPlayers": 99, "preferredClaimKeys": ["lOdxIwqejxe18rNd", "b8Otq6j1mqUav7k0", "5HAQltnSojV4jT65"], "requestedRegions": ["yclX2FtAz0vJjFIY", "WOaNdsimmkW2miH3", "xRHAKy4QxZkaXZ7v"], "teams": [{"UserIDs": ["miEd0JPxVyQpshaD", "wNqTbbFMXAMfVXe0", "GZeMgsRsmH1EQrYm"], "parties": [{"partyID": "kPKTPOlhTtSiZNCx", "userIDs": ["uogFteTHJe4BhSSQ", "kQD6WmOt6D7ufFVT", "OhvQpfbBke8aEdd3"]}, {"partyID": "6xj6wySoltDxsbzx", "userIDs": ["rlaKEfkoYjY2o6ou", "RW9UtNquwC3Wgumr", "Iz4NhGztZpr4U4fw"]}, {"partyID": "QIiLXgmRasvjO4lj", "userIDs": ["8m3XEwP2b4gd3xOe", "ii8Jnmssep2xD2NY", "0kABeGs9yxahld1p"]}]}, {"UserIDs": ["O0Gyf5PO3COyMvcz", "gEpzZ3FbtxfhcRC7", "IVYa6iZ5uFRYNn3S"], "parties": [{"partyID": "HiWxF0YbuU5ar5qT", "userIDs": ["LWUCy0Afgc050XIZ", "RW491e94mQjVOOBn", "IWhunElqZUodp3Ih"]}, {"partyID": "tCSHy1ei1fIrPvfH", "userIDs": ["nRN06EjRwEQlNapJ", "Rfk4f9Zcw1pEHAyN", "FxcVTKuAQTGh5Bxj"]}, {"partyID": "WOozGoDtsUuYo5p8", "userIDs": ["ED5QZAufwNa8lzfj", "v9oYMXMjlVHY1AHw", "F3vGoav7MK0PcLnE"]}]}, {"UserIDs": ["kcokKwcQ0baDT9Oy", "J2h23GUS2amU7syG", "lElXdEAOrVSnLocL"], "parties": [{"partyID": "VVYamQc4wcG5nDBL", "userIDs": ["JoJHbiQ5duE5p4cf", "s2E41cK8QTwiIAvx", "SvNDlmM5nQFMGzs7"]}, {"partyID": "fzjgyc44mEh9tRk8", "userIDs": ["knYSV30lnroQehMD", "li6t9unQLYXxm09w", "pGAbpEmDY9vLh3u6"]}, {"partyID": "EDsUmrV6kH4OotKw", "userIDs": ["G3UC6XCnnZxF8CmQ", "r17W65br34rBBN9t", "U6TDm5GloFSKWM1e"]}]}], "ticketIDs": ["ym5ydC6p25xCWTqU", "OYZENJ1QHZQxPRXH", "7uxBJEECQE1li3Bg"], "tieTeamsSessionLifetime": true, "type": "Jxc9pUnZmvhidwCk", "version": 30}' \
    > test.out 2>&1
eval_tap $? 45 'PatchUpdateGameSession' test.out

#- 46 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wqjYLfTiCO1NDBvQ' \
    --body '{"backfillTicketID": "vRPnAz4VzW0CpoBC"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateGameSessionBackfillTicketID' test.out

#- 47 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'byJsF5IjF1c0W338' \
    > test.out 2>&1
eval_tap $? 47 'GameSessionGenerateCode' test.out

#- 48 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HS6CBgVRyihYNZ84' \
    > test.out 2>&1
eval_tap $? 48 'PublicRevokeGameSessionCode' test.out

#- 49 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CVhziXV8HwSmvcvc' \
    --body '{"platformID": "DKF19yVRafCjOuSY", "userID": "ht83AdvBaagTiRJ8"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicGameSessionInvite' test.out

#- 50 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'daGTVX3Bb7jlz5If' \
    > test.out 2>&1
eval_tap $? 50 'JoinGameSession' test.out

#- 51 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HgKjI9mwJSrN8jkI' \
    --body '{"leaderID": "ykR2zbaI6PD7fEsc"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicPromoteGameSessionLeader' test.out

#- 52 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ShnGUGUtV9GJ279G' \
    > test.out 2>&1
eval_tap $? 52 'LeaveGameSession' test.out

#- 53 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DbLNwjm3FK0nnX2p' \
    > test.out 2>&1
eval_tap $? 53 'PublicGameSessionReject' test.out

#- 54 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oMfZ1hDHtbh4HtMl' \
    > test.out 2>&1
eval_tap $? 54 'GetSessionServerSecret' test.out

#- 55 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Fgvh2Dp2SoiIPp1y' \
    --body '{"additionalMembers": [{"partyID": "vfAHS0VgLu11A3HT", "userIDs": ["ovFi4tPAGfleyCA6", "jEtcqsnzoVILjkwW", "61duF87aUyrdt4XS"]}, {"partyID": "pWBAetsanzqP8oxf", "userIDs": ["rtbECD1CYPwaiBAx", "fYL8Avt70ZUT2fSk", "3LL0calqxEewuGS4"]}, {"partyID": "69k2hG0WKt4sUman", "userIDs": ["YxM0UHZVNYzGMNIp", "WoSLkUrfuf4U3WeY", "eA9t2ENKKWrFtHIi"]}], "proposedTeams": [{"UserIDs": ["1CMgKAOG5iDcCR5P", "bCvDLil8wj9cKM3A", "r6MF35hCER4nGmWG"], "parties": [{"partyID": "gTJfHlJl4tHGa4Xf", "userIDs": ["Zcd9CVnGqMX9Fiee", "EssWEUl07bhwntCV", "qiYOJf5KwMZQjzvj"]}, {"partyID": "Sozv6CTRDl0zp9Cz", "userIDs": ["HFwinkBNi4gvqgl6", "TZ9TGVPmv34h6T7E", "sufmfxKYB4LM6H6Q"]}, {"partyID": "XmpZ9X3fUSR1l9xL", "userIDs": ["PBsmAUrD9L1IiD6M", "lcEPhMDFzjHZ3sIh", "zOx2CXKlvIomU3pI"]}]}, {"UserIDs": ["xM9n8D2eLMe3lt9q", "fx2UDcgVE7L9FK6e", "0MrPc4vtxk9hVKlG"], "parties": [{"partyID": "56HlzGr7XjdyRJun", "userIDs": ["ZPkp6ccIBnWyPw8m", "j7gyQ7XdIszGRj46", "COPipH1MWVTHG0qH"]}, {"partyID": "JCWEfOJpZm9yEYWN", "userIDs": ["GMy2pgSGSUOK68eq", "GJtWf1Ybgg8rdwY9", "bmrvHmO07KNqX9LM"]}, {"partyID": "2IwEsdOGBXBwnzDX", "userIDs": ["8v3xgC1Ge9PdbTTA", "J2Gp1r0sVZ6LJAOd", "dIL2l3hPjNDKv2LW"]}]}, {"UserIDs": ["fXqjr8fS79En3wYo", "wBdkaZ3y6i38XQjL", "DRqkpiFK5BtiQ272"], "parties": [{"partyID": "Uo9UBJWodpdwsX1j", "userIDs": ["orcyR0x3YiHF8ITG", "PRQBCgIs1Q2lzxl0", "yF5m77TTh4gUoj8u"]}, {"partyID": "2WRcLiEtzVlnkflf", "userIDs": ["n7pHY48F1dl1q92m", "3iRlfnBAk0CwiAsR", "65yQ9ssuHdGmxncC"]}, {"partyID": "Er0KcgeqzGbruNB7", "userIDs": ["2HHMkjzyBB4UFKia", "oV0VOem2yqPsMFxK", "ybPkbuS6x9cLJ1AP"]}]}], "version": 28}' \
    > test.out 2>&1
eval_tap $? 55 'AppendTeamGameSession' test.out

#- 56 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "GcMICPUYnfG6jl9U"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyJoinCode' test.out

#- 57 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '4jReteIMgzISomCs' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetParty' test.out

#- 58 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'odJrhQW41q2OspCZ' \
    --body '{"attributes": {"bt3Uta5I0uGcL1ko": {}, "yHjCH5olYLETRpAB": {}, "AmO2EGvJ4UMS93yO": {}}, "inactiveTimeout": 48, "inviteTimeout": 74, "joinability": "NInDByhnoluO6ti0", "maxPlayers": 87, "minPlayers": 25, "type": "P2ssiJ66OzOj84O6", "version": 39}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateParty' test.out

#- 59 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qnVK3YVeOWs9mfVQ' \
    --body '{"attributes": {"h3jLBtn9pxpE7BYt": {}, "zB0B4CxyQrUpIFvO": {}, "RxTi79DpSjb39ukc": {}}, "inactiveTimeout": 89, "inviteTimeout": 15, "joinability": "6c2E2r3vk3IfAKEb", "maxPlayers": 33, "minPlayers": 30, "type": "cNXSGCCvNowNmdpc", "version": 73}' \
    > test.out 2>&1
eval_tap $? 59 'PublicPatchUpdateParty' test.out

#- 60 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OErQPS4VsRoYIK69' \
    > test.out 2>&1
eval_tap $? 60 'PublicGeneratePartyCode' test.out

#- 61 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yg9ADCGiXaLs2xjH' \
    > test.out 2>&1
eval_tap $? 61 'PublicRevokePartyCode' test.out

#- 62 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kinOD975nARHCmhN' \
    --body '{"platformID": "HSXuqIHsxvaUoXDm", "userID": "wWsukxncuD3QxCXM"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyInvite' test.out

#- 63 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'd00YBWCaVVmM45mf' \
    --body '{"leaderID": "IZsWhkS476dGGJwJ"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromotePartyLeader' test.out

#- 64 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '00UH197MJ6zU7JLM' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyJoin' test.out

#- 65 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QyMWzYQCAaPJgoxG' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyLeave' test.out

#- 66 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JoJaSzUtY4ZD0Xtb' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyReject' test.out

#- 67 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '0U4pH16NUsVY21NV' \
    --userId 'Is7NRen2Y3Ns0QJQ' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyKick' test.out

#- 68 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"eaWytPfds1BYx0Ea": {}, "URydf8ZyyZeHAWGg": {}, "JUbUJRMbkcTglbU8": {}}, "configurationName": "6FyOjApNHBVfNOUR", "inactiveTimeout": 4, "inviteTimeout": 75, "joinability": "jY3YYT9oTynmfIuB", "maxPlayers": 99, "members": [{"ID": "34luLdvtsTKXMjiw", "PlatformID": "6gYPvfn2Qt9iyq3N", "PlatformUserID": "yk8ncu2Z3eDHH9Wa"}, {"ID": "VO4iKhDcJ7TCcNIs", "PlatformID": "Q3PuppUxDSK8aOTG", "PlatformUserID": "MudcxlCV4cNbJGQ5"}, {"ID": "7lPdinpjS2DRfGt9", "PlatformID": "GlyZVQ4X67tPZSTp", "PlatformUserID": "Pq3xjrElvvDgw0ag"}], "minPlayers": 94, "textChat": false, "type": "J9Yk997XkGOdC6It"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateParty' test.out

#- 69 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --userId 'XqvUWDjU1G0EVjVZ' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetRecentPlayer' test.out

#- 70 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'w1ToLuPakQN1MpOs' \
    --body '{"1RVFrcg2CXxepx78": {}, "fvsyhE2BKtyTDSIM": {}, "7mkmvZ7Cmsh4US8o": {}}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateInsertSessionStorageLeader' test.out

#- 71 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4jfMANPpmZDdMiCx' \
    --userId 'muCCVuFjS1GC1d2b' \
    --body '{"92B4vEgj3HOmhcWm": {}, "428XejRF94NIY9nM": {}, "rBZo0lNUBDShHD32": {}}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateInsertSessionStorage' test.out

#- 72 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["vvL28FPwTiXfLcxD", "C9Ynd02mECIQhfIh", "HtADUQ9zimQTQT95"]}' \
    > test.out 2>&1
eval_tap $? 72 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 73 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'PublicGetPlayerAttributes' test.out

#- 74 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "nZDhutDM6BqguqD5", "data": {"xxGxBWtnTKUe2zns": {}, "qPzPkwCBo2SwCUsT": {}, "ag4MLAo3m61P2xaN": {}}, "platforms": [{"name": "fmn8Onb1a9gMz0F2", "userID": "UBRmMhAbUWmFhdYL"}, {"name": "WzMuv3zkUY0n0BAZ", "userID": "kwbYkBLyO6A0Fqfh"}, {"name": "naB3YxKNdOTacCcJ", "userID": "fIfXshuLUk5Wdpxj"}], "roles": ["Zx5noXPhPUTKbono", "ucNmzwOZOK56sDkc", "i5rZ8iMlOuksQJCi"]}' \
    > test.out 2>&1
eval_tap $? 74 'PublicStorePlayerAttributes' test.out

#- 75 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'PublicDeletePlayerAttributes' test.out

#- 76 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'RFiZWwJ7NrTb1XTB' \
    --orderBy '9YQzUJ9XlYJ8BzP6' \
    --status 'EUmUXGM5anIloyj9' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryMyGameSessions' test.out

#- 77 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'lhbvuQdW2jwKUckc' \
    --orderBy '794ryY91lX8DD4MY' \
    --status 'XlrJ81lHvv9rqvEo' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE