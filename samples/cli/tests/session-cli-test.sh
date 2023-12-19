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
echo "1..76"

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

#- 28 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'ORxpzwLR2AK6eXUG' \
    --key 'PJsw1fiP80G9Pclx' \
    --leaderID 'cft2ulIJzPyrVEiO' \
    --limit '66' \
    --memberID 'FviMarv8mnfHK8CC' \
    --memberStatus 'mE2lPnsbD3SGEdlw' \
    --offset '42' \
    --order 'iaI1mX2tJoARtdbB' \
    --orderBy 'e7udsMrok0WvGYYn' \
    --partyID 'x4V709xbnGezKsDw' \
    --value 'G2omOR2nvYI9TVqJ' \
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
    --body '{"psn": {"clientId": "dvzcWbfUpaXp5JMl", "clientSecret": "5LL4bTxBmZjdrrIx", "scope": "sB0NRsB1fPqqRRul"}}' \
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
    --sessionId 'pqpymDkQhtrHWwRV' \
    > test.out 2>&1
eval_tap $? 32 'AdminReadSessionStorage' test.out

#- 33 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nwVBOqOHi8pWGd1j' \
    > test.out 2>&1
eval_tap $? 33 'AdminDeleteUserSessionStorage' test.out

#- 34 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uYhiqjRJOqB5F93z' \
    --userId 'FQbJndUDpdONneAc' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadUserSessionStorage' test.out

#- 35 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'zbBdHb2slt71B1Sm' \
    > test.out 2>&1
eval_tap $? 35 'AdminQueryPlayerAttributes' test.out

#- 36 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zp2JZp50CnPb71OR' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlayerAttributes' test.out

#- 37 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"YcmQbTU5JX8ccLjM": {}, "XJRk0eaKQDOJvrTe": {}, "fglSs6g4iY9u02aC": {}}, "autoJoin": true, "backfillTicketID": "YIWekp18lOC3mNqF", "clientVersion": "7Bl0LcghVHfPEspx", "configurationName": "whRON0bc1eMbEIjo", "deployment": "wLqc3ecjXJbZDKKo", "dsSource": "xLE1Y3Dymtj3giPg", "fallbackClaimKeys": ["4x4yiPX6ues1Hhhk", "g1yLVbLFzHEP8cM4", "NTwr0KHaAsmTej52"], "inactiveTimeout": 99, "inviteTimeout": 74, "joinability": "qMkNSawQUWDFJvJB", "matchPool": "Wic7UkBeIXuqDuAX", "maxPlayers": 70, "minPlayers": 14, "preferredClaimKeys": ["66bQ71w0deoV9Lx5", "RDA1l2XcrciYNEzv", "SZIPkhSgORcz5S5B"], "requestedRegions": ["vmgBLxh4ijFnE3Ta", "m69qSZ7PC6f6QkmZ", "XElW9YfRSse6AAz3"], "serverName": "S4czz0QKFlAVmVLu", "teams": [{"UserIDs": ["4AOec0z8eBeeoip6", "8J1nsv4W2OJhtafx", "MSJlHeb34sZKHcl5"], "parties": [{"partyID": "LLLOexL4fZvWtND2", "userIDs": ["tcBFpX8lNtFEJ7tn", "kY6Mca5afj12K2Iz", "rBvvWm4udE0OXudX"]}, {"partyID": "gNne8kJATwlc6esU", "userIDs": ["p6Sw1I98jeZQ7hfx", "nhLd3Knaknoed9DH", "hLOqQGhCUr6iTrjy"]}, {"partyID": "EgarAdNJOIG36I6t", "userIDs": ["RbRcrEveMdAdiPKD", "UVSC00PYeDcaggin", "xnFIna3yddcbsPhe"]}]}, {"UserIDs": ["TH26IUJNvYuGRUvp", "ZaHCuESOiIZsMfB4", "ZH3mtgWgU4pCAKxe"], "parties": [{"partyID": "E70CaunQNxot371W", "userIDs": ["9G4AvQkqsGnmyo5J", "JTUVmb8GEXFTlEME", "sFzYqwgK1Np5nodq"]}, {"partyID": "pLm7FhJBNXzAFdO0", "userIDs": ["Khqf6kiTdSGv2LFj", "AKY7CbgsWqFWZX7k", "PBom8F9GLLTG8phc"]}, {"partyID": "3n4iLoIllKlpO2pq", "userIDs": ["iXJF3WGRaoQomSJC", "4DdrKF7SUQPLG59e", "0k5ZtX6wK7PpUlcI"]}]}, {"UserIDs": ["W32iK7MGt1ixY5rA", "1WoVeJIePF8ZrQzP", "4zvtdxdbZUpd6FJt"], "parties": [{"partyID": "HJ1pyVwyKQLY6FEO", "userIDs": ["65Rb3z7CYLM8IlsH", "qffnrfsGlfPaZKBw", "a3Ddb60ufPpzwj1Q"]}, {"partyID": "GIFmlVf4jvapseE9", "userIDs": ["LN9bvhOrHflIOd6X", "3viLvtEk4mTIpUA9", "gxo8SV38nEhoXmM2"]}, {"partyID": "W7l6jHMA2rG3nako", "userIDs": ["pAywelu01nryEJ0N", "qoTow0qiOiC4j0ik", "tm0ZPLkLOsp0LZ5n"]}]}], "textChat": false, "ticketIDs": ["Wek2gZvRrvr0n9d9", "lvccKMLhrTrcBE2I", "tBS3KtKZWe8aoFzA"], "tieTeamsSessionLifetime": true, "type": "Bx3vim02jBOxrZDy"}' \
    > test.out 2>&1
eval_tap $? 37 'CreateGameSession' test.out

#- 38 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"vpcLYOWA8NjxOnaE": {}, "ok4nOOCzfsflhjbn": {}, "gJOUn18G5MlfDTk8": {}}' \
    > test.out 2>&1
eval_tap $? 38 'PublicQueryGameSessionsByAttributes' test.out

#- 39 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "aG40NlncceIZSwgA"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicSessionJoinCode' test.out

#- 40 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'Ikgzh4pTU0Am4DZh' \
    > test.out 2>&1
eval_tap $? 40 'GetGameSessionByPodName' test.out

#- 41 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'l0bQxFJ3sWCqQpQ2' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSession' test.out

#- 42 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FbKPFMycMSQ4qfAa' \
    --body '{"attributes": {"cR0LgB5BUXvjcu2s": {}, "6w3VifnKqmTSoGH1": {}, "XEfY6QAYn6WQ5UBE": {}}, "backfillTicketID": "U1QAOHfZiGhxOdcu", "clientVersion": "DXSxSc3aZPV87pna", "deployment": "08gxefTYKhuxaEc7", "fallbackClaimKeys": ["M4P7UckSC6ePeN8i", "4GrFES9z7xueHpAT", "Hccee9GXhKcjmSEw"], "inactiveTimeout": 6, "inviteTimeout": 56, "joinability": "rkEnnqKzFsLfYalU", "matchPool": "lfwEQKjU7eHGebSV", "maxPlayers": 42, "minPlayers": 82, "preferredClaimKeys": ["LQ40kepEaC4dfiOM", "ZfEhHr39pysFO3Zv", "c1BZG99LyvfvHEsJ"], "requestedRegions": ["KQQewVLMUoAnaRcY", "p7FUjfIGaffoflEI", "ByYqeKN0meGelYF5"], "teams": [{"UserIDs": ["wWaDhukU4khGG4vZ", "FTYnPkmSu4PWam1j", "xR7SETWjteoc8fgv"], "parties": [{"partyID": "ZDDhoO05oKqymxLD", "userIDs": ["1Lcvw6T6mZEiwxxE", "lpMYSWIeVzm7z9no", "owmlTIKVowi0RY2V"]}, {"partyID": "N4ZONJREdUQ3z9F1", "userIDs": ["BxNNgnke4akncw7w", "u9TmXfJWBPrx9Ns8", "eLzYEvwSWTaLQjct"]}, {"partyID": "vrK2jhsYpKPlXn77", "userIDs": ["AtYoFzLAATPY8P8P", "3cfoivvQxevecWw7", "Rry0KK5rgAGO0dW8"]}]}, {"UserIDs": ["rX2MVUGKSZ4GcLkt", "4pK32sJxlZcCTpTd", "RtCHvuk6B6XTmSLy"], "parties": [{"partyID": "n50sigBVZxiKdV57", "userIDs": ["GvRyd9UuL02Le8HS", "CslsDd4M1F5qRIbl", "S7Nz81GRazPAANjf"]}, {"partyID": "BoldFOyqA2clJ5gE", "userIDs": ["OaCgM6Yn6RugbNEI", "pGBFUjOn5mM7k8nb", "LzvtCIW5ynMKquUi"]}, {"partyID": "cAeIVXtoWAXhMlW4", "userIDs": ["tLqX7OICf5oD1e6o", "I9FmYel0kOw72o8Z", "kgk0jS6rDWUwfhKv"]}]}, {"UserIDs": ["rf2AaH4yCWrHSppn", "IZkNnTn3rzH5NvAt", "cvNedgS1fUfKmihD"], "parties": [{"partyID": "bmu8ePWlQMVDXEHe", "userIDs": ["iGTnwyEw6hIWDZrp", "P7rz3ISW510kHr4i", "sTKWjmv67nuHCXWf"]}, {"partyID": "wnwGioVwVzmmBVVF", "userIDs": ["fpqx1AeLtzcPJ3jt", "DYBo4FUTH7CGfKSy", "xgRR1DiCqSMzpqIF"]}, {"partyID": "GLkDs7ACC1RgBfoN", "userIDs": ["rHlFi2qJLgmBLE35", "YhyiDV90SeI5yppB", "HoytVznCgNyx9fbT"]}]}], "ticketIDs": ["63ShEh8PbGikLjgj", "cj34uulU6FYBZsWF", "br3RSP0W9nBhvhf8"], "tieTeamsSessionLifetime": false, "type": "0DtJMcYQdN66bswA", "version": 12}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateGameSession' test.out

#- 43 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FnZlA6HKWW4fI1IQ' \
    > test.out 2>&1
eval_tap $? 43 'DeleteGameSession' test.out

#- 44 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'coBQELcNlZkqTZrK' \
    --body '{"attributes": {"gXNwvm4e5GX6H742": {}, "OixhtAoKiVm6URT9": {}, "5XhnUcvWB28Mpusu": {}}, "backfillTicketID": "hhDJ5slzgiWZEtyd", "clientVersion": "56LfxnbY97jjYgXc", "deployment": "hCbkXX26uEdCfQaM", "fallbackClaimKeys": ["AQuTKfC0I2kNjCMD", "tDMrentgn3Dhqciw", "IeShF9RKb9vvxuJl"], "inactiveTimeout": 15, "inviteTimeout": 49, "joinability": "XbWhbwPwToC6knjV", "matchPool": "wVnzaqSfJiQFC2gX", "maxPlayers": 29, "minPlayers": 70, "preferredClaimKeys": ["da0kg16yUSpSOAjH", "JWwfCjYwWkLob9gK", "Lqs2nEZhpByfHZin"], "requestedRegions": ["xNfgPAwkMBsznlBU", "qnLT4AbGptKaWNvP", "bpg7yrRvXfZ6rvgv"], "teams": [{"UserIDs": ["EY3Hht1SwqTsKKKo", "37NHDOQe91Ps3ztU", "IV0dS6hIH9c4Vfky"], "parties": [{"partyID": "rwpuXxbaERbfgPmi", "userIDs": ["0eHkt1mr9EOIFg0d", "nWIYN2NVL70Iw157", "g00jr9b8MuYmmeKT"]}, {"partyID": "mBNvGYxEQdf3ewoG", "userIDs": ["GoY7xmFNAmjDDCvs", "78mcMdiS76YApGJ9", "ufwLYkqIgLuZS6hs"]}, {"partyID": "QryiEtOAbpeUNf26", "userIDs": ["UqkCfgCUYBn2xaOB", "dPF0JmX8qwU1cTuH", "HPB5S3DvPRCzBrVU"]}]}, {"UserIDs": ["xmDOj3cvRFaTC11W", "0TGTCm4fZWuk6pQx", "DQpKqxLGeMvr9Tsv"], "parties": [{"partyID": "cMQ7dBsaIecRxIsZ", "userIDs": ["vD6rmzVr5XT1Nxw0", "v1dMQ9Rrbk6C2cVW", "f6ttvbU1PO6ApCD2"]}, {"partyID": "VXidT7w0Oc15N8WX", "userIDs": ["BPp17PAewqSm5x3B", "4t7WQnp8jXZedgt5", "cyNe27HLtwtVOaxg"]}, {"partyID": "P6Jbct8puMybYGxD", "userIDs": ["9IPmmsLmu3kaPj0O", "4zd8Tb7cUNGPTBxi", "FFCrn7djjs69FTFV"]}]}, {"UserIDs": ["GUVhvKhJCmeisql1", "4mUHVbMPimNhcZsU", "3VAdMDcb4qlkiFAa"], "parties": [{"partyID": "mqvZI2KwjqPBiWXa", "userIDs": ["de41s3rH34mB2yPl", "RpWjmHZAAvKTH8Mu", "qIg0CzkguwuJCW7E"]}, {"partyID": "EFB67AODbi9BzupB", "userIDs": ["sFpYc77GtRUcCFeY", "5g4XgBsbfzqxBPNe", "8ae1Il4aAtEbu4Ij"]}, {"partyID": "GdqthRxTjQ7gkZEY", "userIDs": ["8rG0q0Q2Qd2JzRbk", "F2I03dIjvBbA6bfb", "YaJCJjfk2TUvn95F"]}]}], "ticketIDs": ["hO7VW3mbDVMDu87t", "0ldWf7iSGIiKFtWt", "n4Yr2svKM6pqLGZ0"], "tieTeamsSessionLifetime": true, "type": "7uxBJEECQE1li3Bg", "version": 45}' \
    > test.out 2>&1
eval_tap $? 44 'PatchUpdateGameSession' test.out

#- 45 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Jxc9pUnZmvhidwCk' \
    --body '{"backfillTicketID": "ZwqjYLfTiCO1NDBv"}' \
    > test.out 2>&1
eval_tap $? 45 'UpdateGameSessionBackfillTicketID' test.out

#- 46 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QvRPnAz4VzW0CpoB' \
    > test.out 2>&1
eval_tap $? 46 'GameSessionGenerateCode' test.out

#- 47 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CbyJsF5IjF1c0W33' \
    > test.out 2>&1
eval_tap $? 47 'PublicRevokeGameSessionCode' test.out

#- 48 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8HS6CBgVRyihYNZ8' \
    --body '{"platformID": "4CVhziXV8HwSmvcv", "userID": "cDKF19yVRafCjOuS"}' \
    > test.out 2>&1
eval_tap $? 48 'PublicGameSessionInvite' test.out

#- 49 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Yht83AdvBaagTiRJ' \
    > test.out 2>&1
eval_tap $? 49 'JoinGameSession' test.out

#- 50 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8daGTVX3Bb7jlz5I' \
    --body '{"leaderID": "fHgKjI9mwJSrN8jk"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPromoteGameSessionLeader' test.out

#- 51 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IykR2zbaI6PD7fEs' \
    > test.out 2>&1
eval_tap $? 51 'LeaveGameSession' test.out

#- 52 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cShnGUGUtV9GJ279' \
    > test.out 2>&1
eval_tap $? 52 'PublicGameSessionReject' test.out

#- 53 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GDbLNwjm3FK0nnX2' \
    > test.out 2>&1
eval_tap $? 53 'GetSessionServerSecret' test.out

#- 54 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'poMfZ1hDHtbh4HtM' \
    --body '{"additionalMembers": [{"partyID": "lFgvh2Dp2SoiIPp1", "userIDs": ["yvfAHS0VgLu11A3H", "TovFi4tPAGfleyCA", "6jEtcqsnzoVILjkw"]}, {"partyID": "W61duF87aUyrdt4X", "userIDs": ["SpWBAetsanzqP8ox", "frtbECD1CYPwaiBA", "xfYL8Avt70ZUT2fS"]}, {"partyID": "k3LL0calqxEewuGS", "userIDs": ["469k2hG0WKt4sUma", "nYxM0UHZVNYzGMNI", "pWoSLkUrfuf4U3We"]}], "proposedTeams": [{"UserIDs": ["YeA9t2ENKKWrFtHI", "i1CMgKAOG5iDcCR5", "PbCvDLil8wj9cKM3"], "parties": [{"partyID": "Ar6MF35hCER4nGmW", "userIDs": ["GgTJfHlJl4tHGa4X", "fZcd9CVnGqMX9Fie", "eEssWEUl07bhwntC"]}, {"partyID": "VqiYOJf5KwMZQjzv", "userIDs": ["jSozv6CTRDl0zp9C", "zHFwinkBNi4gvqgl", "6TZ9TGVPmv34h6T7"]}, {"partyID": "EsufmfxKYB4LM6H6", "userIDs": ["QXmpZ9X3fUSR1l9x", "LPBsmAUrD9L1IiD6", "MlcEPhMDFzjHZ3sI"]}]}, {"UserIDs": ["hzOx2CXKlvIomU3p", "IxM9n8D2eLMe3lt9", "qfx2UDcgVE7L9FK6"], "parties": [{"partyID": "e0MrPc4vtxk9hVKl", "userIDs": ["G56HlzGr7XjdyRJu", "nZPkp6ccIBnWyPw8", "mj7gyQ7XdIszGRj4"]}, {"partyID": "6COPipH1MWVTHG0q", "userIDs": ["HJCWEfOJpZm9yEYW", "NGMy2pgSGSUOK68e", "qGJtWf1Ybgg8rdwY"]}, {"partyID": "9bmrvHmO07KNqX9L", "userIDs": ["M2IwEsdOGBXBwnzD", "X8v3xgC1Ge9PdbTT", "AJ2Gp1r0sVZ6LJAO"]}]}, {"UserIDs": ["ddIL2l3hPjNDKv2L", "WfXqjr8fS79En3wY", "owBdkaZ3y6i38XQj"], "parties": [{"partyID": "LDRqkpiFK5BtiQ27", "userIDs": ["2Uo9UBJWodpdwsX1", "jorcyR0x3YiHF8IT", "GPRQBCgIs1Q2lzxl"]}, {"partyID": "0yF5m77TTh4gUoj8", "userIDs": ["u2WRcLiEtzVlnkfl", "fn7pHY48F1dl1q92", "m3iRlfnBAk0CwiAs"]}, {"partyID": "R65yQ9ssuHdGmxnc", "userIDs": ["CEr0KcgeqzGbruNB", "72HHMkjzyBB4UFKi", "aoV0VOem2yqPsMFx"]}]}], "version": 75}' \
    > test.out 2>&1
eval_tap $? 54 'AppendTeamGameSession' test.out

#- 55 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "9FmN86sK5LOq4ft5"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicPartyJoinCode' test.out

#- 56 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jGcMICPUYnfG6jl9' \
    > test.out 2>&1
eval_tap $? 56 'PublicGetParty' test.out

#- 57 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'U4jReteIMgzISomC' \
    --body '{"attributes": {"sodJrhQW41q2OspC": {}, "Zbt3Uta5I0uGcL1k": {}, "oyHjCH5olYLETRpA": {}}, "inactiveTimeout": 56, "inviteTimeout": 57, "joinability": "AmO2EGvJ4UMS93yO", "maxPlayers": 48, "minPlayers": 74, "type": "NInDByhnoluO6ti0", "version": 87}' \
    > test.out 2>&1
eval_tap $? 57 'PublicUpdateParty' test.out

#- 58 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mPAnOkDiJq4xQye7' \
    --body '{"attributes": {"HqnVK3YVeOWs9mfV": {}, "Qh3jLBtn9pxpE7BY": {}, "tzB0B4CxyQrUpIFv": {}}, "inactiveTimeout": 84, "inviteTimeout": 90, "joinability": "77KeRWdECaFGzfZ2", "maxPlayers": 15, "minPlayers": 47, "type": "c2E2r3vk3IfAKEbq", "version": 6}' \
    > test.out 2>&1
eval_tap $? 58 'PublicPatchUpdateParty' test.out

#- 59 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '4hNBDh9ZFP1OW0nX' \
    > test.out 2>&1
eval_tap $? 59 'PublicGeneratePartyCode' test.out

#- 60 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OErQPS4VsRoYIK69' \
    > test.out 2>&1
eval_tap $? 60 'PublicRevokePartyCode' test.out

#- 61 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yg9ADCGiXaLs2xjH' \
    --body '{"platformID": "kinOD975nARHCmhN", "userID": "HSXuqIHsxvaUoXDm"}' \
    > test.out 2>&1
eval_tap $? 61 'PublicPartyInvite' test.out

#- 62 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wWsukxncuD3QxCXM' \
    --body '{"leaderID": "d00YBWCaVVmM45mf"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPromotePartyLeader' test.out

#- 63 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IZsWhkS476dGGJwJ' \
    > test.out 2>&1
eval_tap $? 63 'PublicPartyJoin' test.out

#- 64 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '00UH197MJ6zU7JLM' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyLeave' test.out

#- 65 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QyMWzYQCAaPJgoxG' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyReject' test.out

#- 66 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JoJaSzUtY4ZD0Xtb' \
    --userId '0U4pH16NUsVY21NV' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyKick' test.out

#- 67 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Is7NRen2Y3Ns0QJQ": {}, "eaWytPfds1BYx0Ea": {}, "URydf8ZyyZeHAWGg": {}}, "configurationName": "JUbUJRMbkcTglbU8", "inactiveTimeout": 69, "inviteTimeout": 64, "joinability": "PTPQbvLt2NRqJGIK", "maxPlayers": 53, "members": [{"ID": "Y3YYT9oTynmfIuBW", "PlatformID": "gJTNFfM8M0IW4oe8", "PlatformUserID": "KDgy0xZfAcNg14Ws"}, {"ID": "8TIP1LKiFQoLDvum", "PlatformID": "fqrgSfnx2h61X9dN", "PlatformUserID": "1MGRXBJ6mVV7JS9q"}, {"ID": "jNLwvI8JdiY3RRiL", "PlatformID": "ilmOGF6dLLIeIVIj", "PlatformUserID": "McdlbdRXTGIrdNL5"}], "minPlayers": 14, "textChat": true, "type": "JPqTAjgqaTHf1ANT"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicCreateParty' test.out

#- 68 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --userId 'J9Yk997XkGOdC6It' \
    --limit '47' \
    > test.out 2>&1
eval_tap $? 68 'PublicGetRecentPlayer' test.out

#- 69 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'XqvUWDjU1G0EVjVZ' \
    --body '{"w1ToLuPakQN1MpOs": {}, "1RVFrcg2CXxepx78": {}, "fvsyhE2BKtyTDSIM": {}}' \
    > test.out 2>&1
eval_tap $? 69 'PublicUpdateInsertSessionStorageLeader' test.out

#- 70 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7mkmvZ7Cmsh4US8o' \
    --userId '4jfMANPpmZDdMiCx' \
    --body '{"muCCVuFjS1GC1d2b": {}, "92B4vEgj3HOmhcWm": {}, "428XejRF94NIY9nM": {}}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateInsertSessionStorage' test.out

#- 71 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["rBZo0lNUBDShHD32", "vvL28FPwTiXfLcxD", "C9Ynd02mECIQhfIh"]}' \
    > test.out 2>&1
eval_tap $? 71 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 72 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'PublicGetPlayerAttributes' test.out

#- 73 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "tADUQ9zimQTQT95p", "data": {"FJUAJsyAfeKOufV4": {}, "f15NohXu6opxQGRt": {}, "6PqlkL0diRhLC10i": {}}, "platforms": [{"name": "h2EQfY3XCv4hdOa6", "userID": "FdZhNMd1onFjGRbx"}, {"name": "tABPXDmgNEJBhgGq", "userID": "5GIDhNC66szbCCf7"}, {"name": "3IFbRkPSSITz4TjC", "userID": "rJHXGXku2YVuOzhx"}], "roles": ["HmnrrV9ZGWrZ05sx", "e6A6RpmKDebNkylb", "ynkgT9vayLLiizac"]}' \
    > test.out 2>&1
eval_tap $? 73 'PublicStorePlayerAttributes' test.out

#- 74 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'PublicDeletePlayerAttributes' test.out

#- 75 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '7Ge6zKJdlt7rjF5R' \
    --orderBy 'aJwvkWVco2LTo5ij' \
    --status 'lvDF8qBWCQ9dLWYy' \
    > test.out 2>&1
eval_tap $? 75 'PublicQueryMyGameSessions' test.out

#- 76 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'S8zdhMeBXH8x6HdV' \
    --orderBy 'fZVDAiU6iJOF7JKZ' \
    --status 'FNk2NKy59X8iOg2s' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE