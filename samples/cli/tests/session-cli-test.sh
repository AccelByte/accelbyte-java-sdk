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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 96, "PSNSupportedPlatforms": ["hqUI06UpOXGSLmCV", "uHOPlLlkvR8sKgnu", "RkgghGoYupD391C2"], "SessionTitle": "qtPYokahFjkQsfCa", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "f8TgoNm03VLisV6z", "XboxServiceConfigID": "wPuo3td6TC6I3lMj", "XboxSessionTemplateName": "GSWN2laRlxfcjHfY", "XboxTitleID": "akUCTqGkE7wcWfDs", "localizedSessionName": {"lpJSqGAXQ0yYoNRK": {}, "d3IL5TAQ6iiPlSC2": {}, "uE4o5Vwdo3fePqIJ": {}}}, "PSNBaseUrl": "A8IHtrkmu0hpDDWV", "attributes": {"Ala2l5BYNtIuS5S5": {}, "XUdjsoqwGyzzWi9g": {}, "wQYv7t1o7TTr1Dmr": {}}, "autoJoin": false, "clientVersion": "os9Jcdos4fYcTVU6", "deployment": "RBt0zYoMcHyCUEXl", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "vxJMdalwSyliWMNW", "enableSecret": true, "fallbackClaimKeys": ["NyLu0M3VHh2EI8Jl", "DbPWbQ6Q9lNmqRBa", "AkLnvxkT1X68cmDc"], "immutableStorage": false, "inactiveTimeout": 9, "inviteTimeout": 48, "joinability": "pjChB3V0v52Dlym6", "leaderElectionGracePeriod": 31, "manualRejoin": true, "maxActiveSessions": 86, "maxPlayers": 81, "minPlayers": 57, "name": "3xoJ8aeCnaLpUKp4", "persistent": false, "preferredClaimKeys": ["YUDjasWIPUvmEejt", "GeoyIPa8ZRrvjj7i", "l35MXbN9oCMNqq98"], "requestedRegions": ["SjTvhZNkSQ70D0H6", "BXksUC9b6i5lZC9x", "v32e8c5csSovoqsZ"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "wbmXgdAPh1EThG96"}' \
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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 0, "PSNSupportedPlatforms": ["BHqaTHeKtW18iGeU", "lc9d9sogWa24CKNS", "0GqVvUfHQvsHXNUN"], "SessionTitle": "e4mhgo5QB65lSAiY", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "NjkfZrQvGgbLdLsF", "XboxServiceConfigID": "zHkBMr1yrOMlNFSr", "XboxSessionTemplateName": "UEirnjX9fDmIbeZx", "XboxTitleID": "zfTcyiuATus9hsfp", "localizedSessionName": {"FDcSDG8aMVGLiBNr": {}, "DjqoxcwgGLXpUL4p": {}, "p2ncYAHdNzDmeIP6": {}}}, "PSNBaseUrl": "rOvDz9KOsb392k6Y", "attributes": {"mJFfRByjlBiuFM3F": {}, "IoVk8T3GpAnkCmBU": {}, "qg2SCnqntX9y1aZS": {}}, "autoJoin": true, "clientVersion": "MiVi10sG6vxkfUcm", "deployment": "qRRbceJ5i0EeDxOg", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "nhhqElIaDml48wdN", "enableSecret": true, "fallbackClaimKeys": ["m5T50x9WT0GfH2rt", "Oa4EXsXzOXQAk4mq", "rxzTtuLl4XlbGL8Q"], "immutableStorage": true, "inactiveTimeout": 47, "inviteTimeout": 1, "joinability": "tjzm8y2wNhmwoYZy", "leaderElectionGracePeriod": 72, "manualRejoin": true, "maxActiveSessions": 68, "maxPlayers": 65, "minPlayers": 8, "name": "ZKBcYrCEAE7WIsfm", "persistent": true, "preferredClaimKeys": ["wH3q31A806DJgas4", "b6z3LNUj7fdgLA84", "Z8YYk6QEgJjBbEDo"], "requestedRegions": ["Nf3n0hEoRCAcf80z", "fFyabWAgIUXiI07A", "68eaqC2J9jyEW6GL"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "YbsKoADkzJEN2VHz"}' \
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
    --isSoftDeleted 'Jsw1fiP80G9Pclxc' \
    --joinability 'ft2ulIJzPyrVEiOG' \
    --key '4UcqsuGKHhMRWLVd' \
    --leaderID '3DlhLuIpomM8sm1M' \
    --limit '16' \
    --memberID 'UccE536ugBp3HBve' \
    --memberStatus 'pnDCjgyJlXe36mgW' \
    --offset '19' \
    --order '4V709xbnGezKsDwG' \
    --orderBy '2omOR2nvYI9TVqJd' \
    --partyID 'vzcWbfUpaXp5JMl5' \
    --value 'LL4bTxBmZjdrrIxs' \
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
    --body '{"psn": {"clientId": "B0NRsB1fPqqRRulp", "clientSecret": "qpymDkQhtrHWwRVn", "scope": "wVBOqOHi8pWGd1ju"}}' \
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
    --sessionId 'YhiqjRJOqB5F93zF' \
    > test.out 2>&1
eval_tap $? 33 'AdminReadSessionStorage' test.out

#- 34 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QbJndUDpdONneAcz' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteUserSessionStorage' test.out

#- 35 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bBdHb2slt71B1SmZ' \
    --userId 'p2JZp50CnPb71ORY' \
    > test.out 2>&1
eval_tap $? 35 'AdminReadUserSessionStorage' test.out

#- 36 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'cmQbTU5JX8ccLjMX' \
    > test.out 2>&1
eval_tap $? 36 'AdminQueryPlayerAttributes' test.out

#- 37 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'JRk0eaKQDOJvrTef' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerAttributes' test.out

#- 38 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"glSs6g4iY9u02aCN": {}, "YIWekp18lOC3mNqF": {}, "7Bl0LcghVHfPEspx": {}}, "autoJoin": true, "backfillTicketID": "CfR3ncDlwi3v3MFF", "clientVersion": "J1KesKoELCpobBEG", "configurationName": "8X645xpdXpai0rYa", "deployment": "T5hOPjaf3H0tYigh", "dsSource": "U0VUfcYHJbBfAKSi", "fallbackClaimKeys": ["PW3VgsZXiR1DJ7HV", "WqMkNSawQUWDFJvJ", "BWic7UkBeIXuqDuA"], "inactiveTimeout": 70, "inviteTimeout": 14, "joinability": "66bQ71w0deoV9Lx5", "matchPool": "RDA1l2XcrciYNEzv", "maxPlayers": 91, "minPlayers": 68, "preferredClaimKeys": ["ZIPkhSgORcz5S5Bv", "mgBLxh4ijFnE3Tam", "69qSZ7PC6f6QkmZX"], "requestedRegions": ["ElW9YfRSse6AAz3S", "4czz0QKFlAVmVLu4", "AOec0z8eBeeoip68"], "serverName": "J1nsv4W2OJhtafxM", "teams": [{"UserIDs": ["SJlHeb34sZKHcl5L", "LLOexL4fZvWtND2t", "cBFpX8lNtFEJ7tnk"], "parties": [{"partyID": "Y6Mca5afj12K2Izr", "userIDs": ["BvvWm4udE0OXudXg", "Nne8kJATwlc6esUp", "6Sw1I98jeZQ7hfxn"]}, {"partyID": "hLd3Knaknoed9DHh", "userIDs": ["LOqQGhCUr6iTrjyE", "garAdNJOIG36I6tR", "bRcrEveMdAdiPKDU"]}, {"partyID": "VSC00PYeDcagginx", "userIDs": ["nFIna3yddcbsPheT", "H26IUJNvYuGRUvpZ", "aHCuESOiIZsMfB4Z"]}]}, {"UserIDs": ["H3mtgWgU4pCAKxeE", "70CaunQNxot371W9", "G4AvQkqsGnmyo5JJ"], "parties": [{"partyID": "TUVmb8GEXFTlEMEs", "userIDs": ["FzYqwgK1Np5nodqp", "Lm7FhJBNXzAFdO0K", "hqf6kiTdSGv2LFjA"]}, {"partyID": "KY7CbgsWqFWZX7kP", "userIDs": ["Bom8F9GLLTG8phc3", "n4iLoIllKlpO2pqi", "XJF3WGRaoQomSJC4"]}, {"partyID": "DdrKF7SUQPLG59e0", "userIDs": ["k5ZtX6wK7PpUlcIW", "32iK7MGt1ixY5rA1", "WoVeJIePF8ZrQzP4"]}]}, {"UserIDs": ["zvtdxdbZUpd6FJtH", "J1pyVwyKQLY6FEO6", "5Rb3z7CYLM8IlsHq"], "parties": [{"partyID": "ffnrfsGlfPaZKBwa", "userIDs": ["3Ddb60ufPpzwj1QG", "IFmlVf4jvapseE9L", "N9bvhOrHflIOd6X3"]}, {"partyID": "viLvtEk4mTIpUA9g", "userIDs": ["xo8SV38nEhoXmM2W", "7l6jHMA2rG3nakop", "Aywelu01nryEJ0Nq"]}, {"partyID": "oTow0qiOiC4j0ikt", "userIDs": ["m0ZPLkLOsp0LZ5nj", "N86Hl8kUXzt6bSc6", "bWvgpVyW9dD1kOmv"]}]}], "textChat": true, "ticketIDs": ["BS3KtKZWe8aoFzAy", "BME74HUtipUWYhWV", "1qx8CzPML52faXUr"], "tieTeamsSessionLifetime": false, "type": "Sk4lq2faBcAXXKlh"}' \
    > test.out 2>&1
eval_tap $? 38 'CreateGameSession' test.out

#- 39 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"vyH8paOJtxqMPpcV": {}, "fRwNj547fH0XrKED": {}, "pEY8VnocGAjci0V3": {}}' \
    > test.out 2>&1
eval_tap $? 39 'PublicQueryGameSessionsByAttributes' test.out

#- 40 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "tBf2jnHGKXphn50c"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicSessionJoinCode' test.out

#- 41 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '9tNLDljhZ2jxLRX3' \
    > test.out 2>&1
eval_tap $? 41 'GetGameSessionByPodName' test.out

#- 42 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'z46OCaGBeMfPlNos' \
    > test.out 2>&1
eval_tap $? 42 'GetGameSession' test.out

#- 43 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4yBRjrERHEonAZR8' \
    --body '{"attributes": {"GmEu0q1p6QCyY6vS": {}, "kVFWdsbYuVEGVxYh": {}, "eR3j5mNZ6vwv7K8A": {}}, "backfillTicketID": "svt1j1Rx59hesNWy", "clientVersion": "2NvZ85DDKDAF8KDs", "deployment": "BZOuYQJ03BAHZ7c5", "fallbackClaimKeys": ["3q7akMpcmnnx6RVB", "rop9v7aZK3h65hbN", "15zfQSfQrtfF3TQN"], "inactiveTimeout": 82, "inviteTimeout": 77, "joinability": "cNDLr36vzohZyjMQ", "matchPool": "Ag5mPYhrLTyU8Ohg", "maxPlayers": 11, "minPlayers": 56, "preferredClaimKeys": ["9JQYGF4bYXEcENx9", "xZlAchob44lONDDw", "MvgI0HlyPR7wZNiV"], "requestedRegions": ["sF6xG2mXEQdbzIVy", "8alncV7vWgSHdfo0", "7UctPErqxyMyOK06"], "teams": [{"UserIDs": ["MqQBErxgjVBycvU4", "PbmRDcrg0DjQjBEC", "Xvea7H1m2lJFRZ3Z"], "parties": [{"partyID": "prZ60zMjhTHeh94T", "userIDs": ["SenE5hCFkIf5weqZ", "18MH57l2Zsrh90ET", "tYmGukz3MnlrjcHp"]}, {"partyID": "6B8Vj7rXFgDnDkdZ", "userIDs": ["9bpjb1tdA3QhjCMW", "64f4XhIjSoTB2NMK", "tezapPr2QEPx3zTx"]}, {"partyID": "BGtEJIYppuUSsKoH", "userIDs": ["w2hyd12uSE7BEv3a", "evq6iohU1cg4W1IS", "3Uv1BpWoJBaqdg2F"]}]}, {"UserIDs": ["HcunsS1lnaO2m9vq", "jhbeK2qN8g6x2PyY", "Do5R3hLiD5sf5y1J"], "parties": [{"partyID": "sxJNGmyt0SQDUDoW", "userIDs": ["BZVGLlkUetzCAWc9", "x1aMjgGim51T107X", "IZRZ7tZdIs0xf4cz"]}, {"partyID": "dt7zqmSKxOEQlVcx", "userIDs": ["6GqsBq8vdhWVnuYL", "gpZehK0G2nmyuViB", "9kRTcSQdTnNYGeAf"]}, {"partyID": "YFG3wSkHKufBdS3Z", "userIDs": ["OokZB4cXnAXyuGz6", "LlxHv8SwyagYvDJ3", "w3UNgIGj2jZtEYT8"]}]}, {"UserIDs": ["sIPSE1XXPzySa0sZ", "oFS6xCOWMpyh9pMs", "Qgb64ELbzDMwyo4n"], "parties": [{"partyID": "IRysQdbufXjYnSoI", "userIDs": ["FeouC2m38kXrDZWl", "GVE9sJ4NpUtKp6M9", "I6nEwnZhsjwJeGwa"]}, {"partyID": "PSDMZz95OYKiqaZD", "userIDs": ["63xe5rruJVfLGea0", "ZtlzUcuHAXz0UV31", "MfuGaXsAuGsZaSHe"]}, {"partyID": "vO0TQNEI3kfabxJW", "userIDs": ["WSI1ECUo1NPpeFhU", "ztXDgB7n4C97uAPP", "8PATLpUpxeJlsBJT"]}]}], "ticketIDs": ["6Hh3OMjAjq2mK8lb", "SEEelxnb5QxWG2HF", "nZlA6HKWW4fI1IQc"], "tieTeamsSessionLifetime": false, "type": "twCVUrYQue84dwmb", "version": 46}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateGameSession' test.out

#- 44 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Nwvm4e5GX6H742Oi' \
    > test.out 2>&1
eval_tap $? 44 'DeleteGameSession' test.out

#- 45 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xhtAoKiVm6URT95X' \
    --body '{"attributes": {"hnUcvWB28Mpusuhh": {}, "DJ5slzgiWZEtyd56": {}, "LfxnbY97jjYgXchC": {}}, "backfillTicketID": "bkXX26uEdCfQaMAQ", "clientVersion": "uTKfC0I2kNjCMDtD", "deployment": "Mrentgn3DhqciwIe", "fallbackClaimKeys": ["ShF9RKb9vvxuJlhX", "bWhbwPwToC6knjVw", "VnzaqSfJiQFC2gXo"], "inactiveTimeout": 6, "inviteTimeout": 1, "joinability": "sUf8lGFXcmwTERHc", "matchPool": "lOdxIwqejxe18rNd", "maxPlayers": 3, "minPlayers": 39, "preferredClaimKeys": ["8Otq6j1mqUav7k05", "HAQltnSojV4jT65y", "clX2FtAz0vJjFIYW"], "requestedRegions": ["OaNdsimmkW2miH3x", "RHAKy4QxZkaXZ7vm", "iEd0JPxVyQpshaDw"], "teams": [{"UserIDs": ["NqTbbFMXAMfVXe0G", "ZeMgsRsmH1EQrYmk", "PKTPOlhTtSiZNCxu"], "parties": [{"partyID": "ogFteTHJe4BhSSQk", "userIDs": ["QD6WmOt6D7ufFVTO", "hvQpfbBke8aEdd36", "xj6wySoltDxsbzxr"]}, {"partyID": "laKEfkoYjY2o6ouR", "userIDs": ["W9UtNquwC3WgumrI", "z4NhGztZpr4U4fwQ", "IiLXgmRasvjO4lj8"]}, {"partyID": "m3XEwP2b4gd3xOei", "userIDs": ["i8Jnmssep2xD2NY0", "kABeGs9yxahld1pO", "0Gyf5PO3COyMvczg"]}]}, {"UserIDs": ["EpzZ3FbtxfhcRC7I", "VYa6iZ5uFRYNn3SH", "iWxF0YbuU5ar5qTL"], "parties": [{"partyID": "WUCy0Afgc050XIZR", "userIDs": ["W491e94mQjVOOBnI", "WhunElqZUodp3Iht", "CSHy1ei1fIrPvfHn"]}, {"partyID": "RN06EjRwEQlNapJR", "userIDs": ["fk4f9Zcw1pEHAyNF", "xcVTKuAQTGh5BxjW", "OozGoDtsUuYo5p8E"]}, {"partyID": "D5QZAufwNa8lzfjv", "userIDs": ["9oYMXMjlVHY1AHwF", "3vGoav7MK0PcLnEk", "cokKwcQ0baDT9OyJ"]}]}, {"UserIDs": ["2h23GUS2amU7syGl", "ElXdEAOrVSnLocLV", "VYamQc4wcG5nDBLJ"], "parties": [{"partyID": "oJHbiQ5duE5p4cfs", "userIDs": ["2E41cK8QTwiIAvxS", "vNDlmM5nQFMGzs7f", "zjgyc44mEh9tRk8k"]}, {"partyID": "nYSV30lnroQehMDl", "userIDs": ["i6t9unQLYXxm09wp", "GAbpEmDY9vLh3u6E", "DsUmrV6kH4OotKwG"]}, {"partyID": "3UC6XCnnZxF8CmQr", "userIDs": ["17W65br34rBBN9tU", "6TDm5GloFSKWM1ey", "m5ydC6p25xCWTqUO"]}]}], "ticketIDs": ["YZENJ1QHZQxPRXH7", "uxBJEECQE1li3Bg7", "Jxc9pUnZmvhidwCk"], "tieTeamsSessionLifetime": false, "type": "wqjYLfTiCO1NDBvQ", "version": 45}' \
    > test.out 2>&1
eval_tap $? 45 'PatchUpdateGameSession' test.out

#- 46 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'W4pIDwdqXpmRmut9' \
    --body '{"backfillTicketID": "H9XyWI8bp8fQxRuX"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateGameSessionBackfillTicketID' test.out

#- 47 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '91uYmtrHJbEGTUj7' \
    > test.out 2>&1
eval_tap $? 47 'GameSessionGenerateCode' test.out

#- 48 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YjERL1rEQG02zccA' \
    > test.out 2>&1
eval_tap $? 48 'PublicRevokeGameSessionCode' test.out

#- 49 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8wvLsWUNd6lPKvqD' \
    --body '{"platformID": "ejvqklTSvDwuOrP9", "userID": "lzpiX0VuFpZum7iz"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicGameSessionInvite' test.out

#- 50 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xe7NPzjOa8E7wY76' \
    > test.out 2>&1
eval_tap $? 50 'JoinGameSession' test.out

#- 51 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PxLv9HBEUe89AwEw' \
    --body '{"leaderID": "1HO4FnKtx4XLKAml"}' \
    > test.out 2>&1
eval_tap $? 51 'PublicPromoteGameSessionLeader' test.out

#- 52 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Dr19uJ3nq6VerzVC' \
    > test.out 2>&1
eval_tap $? 52 'LeaveGameSession' test.out

#- 53 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cI8y3Cz0YqCKUh5R' \
    > test.out 2>&1
eval_tap $? 53 'PublicGameSessionReject' test.out

#- 54 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'D9vNAp4jinFpnQ5x' \
    > test.out 2>&1
eval_tap $? 54 'GetSessionServerSecret' test.out

#- 55 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'F9wwbvMZyeDeRnVf' \
    --body '{"additionalMembers": [{"partyID": "PUa6xVVBcq3wZpFI", "userIDs": ["YeAg79HcLJXJ7mpV", "I6eTYAjdPlCiQQC3", "5cj4KyOVgvnWbfRJ"]}, {"partyID": "tsB7cUQZ2QUAxJrI", "userIDs": ["NPXppPNO3AfmXcgw", "C3IN6tvKgLB9QmJI", "Oq9dP5szG71utjsQ"]}, {"partyID": "4CrRb9gUCeVz7fWb", "userIDs": ["ZIdhevfZvyV7Acod", "cZwKjYDdmJOlzwm9", "Su4FnS98QqftSjq7"]}], "proposedTeams": [{"UserIDs": ["sn8yreciPLfkVyyJ", "sbGpO6JgehDJxEN7", "JlZc8LMq1o2jZWu4"], "parties": [{"partyID": "yA3r0u4q1bTHXIjf", "userIDs": ["JKyFlM0u1uuoVdn9", "yVoSlKNchPHNL4X3", "LLaGPGdqLE8Sohhh"]}, {"partyID": "uiTnJarYYkHBDdSz", "userIDs": ["BXdxapwhd5IQYBQu", "xLvPuWYvE3fsNy9Z", "9OhxXvCp9y7fLD2q"]}, {"partyID": "fCXnlUnqxT1WsRNM", "userIDs": ["ZcA92hzC7MNa8vVe", "4MHX6AgMep90AyyU", "JyAK5PRMRMwdvl0h"]}]}, {"UserIDs": ["v6g62GxBW2tQF5tk", "TjgJaMYvNQOsDa4b", "kcgepqtxjbrztee7"], "parties": [{"partyID": "QLTGAak7Kaol01DK", "userIDs": ["97D2xnik42miteR5", "eQAe1rzmmgqBPRmd", "6mO4oI8KDqebm83r"]}, {"partyID": "aNBJ5y7axEkvI4ox", "userIDs": ["ZEDxGiBnNbn0zaf7", "CaOSlHXrUSA6sMJz", "A5mtqISQ83TTbtef"]}, {"partyID": "XWznDe4LQdXfFBii", "userIDs": ["2RAMEX5RMjBFVZGY", "zQqV8d9mDdUIoiIJ", "FNxuNOmUSWw18T1I"]}]}, {"UserIDs": ["xVWCxdvPL9e4P01v", "xP8xj1LyEirURERn", "EMzpImW6sjAHyCK5"], "parties": [{"partyID": "tNanGBrkzUvck3xT", "userIDs": ["tmOFMebS4AdlNzwo", "g2IhErkNhNcECWwc", "hW6zL9SkbLlrNXnG"]}, {"partyID": "anMazb8jvRWenURH", "userIDs": ["48aJuALEcSqcE15u", "6D31DjOsrs3CUYAT", "dqnQGbqiqOkNeATj"]}, {"partyID": "7eGjodd7CcJUrI6M", "userIDs": ["AugK5kypNrp2nFe9", "FmN86sK5LOq4ft5j", "GcMICPUYnfG6jl9U"]}]}], "version": 55}' \
    > test.out 2>&1
eval_tap $? 55 'AppendTeamGameSession' test.out

#- 56 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jReteIMgzISomCso"}' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyJoinCode' test.out

#- 57 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dJrhQW41q2OspCZb' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetParty' test.out

#- 58 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 't3Uta5I0uGcL1koy' \
    --body '{"attributes": {"HjCH5olYLETRpABA": {}, "mO2EGvJ4UMS93yOx": {}, "NInDByhnoluO6ti0": {}}, "inactiveTimeout": 87, "inviteTimeout": 25, "joinability": "P2ssiJ66OzOj84O6", "maxPlayers": 39, "minPlayers": 33, "type": "gohjtC7bzjPpucdd", "version": 72}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateParty' test.out

#- 59 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jLBtn9pxpE7BYtzB' \
    --body '{"attributes": {"0B4CxyQrUpIFvORx": {}, "Ti79DpSjb39ukcR6": {}, "c2E2r3vk3IfAKEbq": {}}, "inactiveTimeout": 6, "inviteTimeout": 80, "joinability": "hNBDh9ZFP1OW0nXO", "maxPlayers": 63, "minPlayers": 65, "type": "rQPS4VsRoYIK69yg", "version": 86}' \
    > test.out 2>&1
eval_tap $? 59 'PublicPatchUpdateParty' test.out

#- 60 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ADCGiXaLs2xjHkin' \
    > test.out 2>&1
eval_tap $? 60 'PublicGeneratePartyCode' test.out

#- 61 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OD975nARHCmhNHSX' \
    > test.out 2>&1
eval_tap $? 61 'PublicRevokePartyCode' test.out

#- 62 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uqIHsxvaUoXDmwWs' \
    --body '{"platformID": "ukxncuD3QxCXMd00", "userID": "YBWCaVVmM45mfIZs"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicPartyInvite' test.out

#- 63 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WhkS476dGGJwJ00U' \
    --body '{"leaderID": "H197MJ6zU7JLMQyM"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPromotePartyLeader' test.out

#- 64 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WzYQCAaPJgoxGJoJ' \
    > test.out 2>&1
eval_tap $? 64 'PublicPartyJoin' test.out

#- 65 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'aSzUtY4ZD0Xtb0U4' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyLeave' test.out

#- 66 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pH16NUsVY21NVIs7' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyReject' test.out

#- 67 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'NRen2Y3Ns0QJQeaW' \
    --userId 'ytPfds1BYx0EaURy' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyKick' test.out

#- 68 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"df8ZyyZeHAWGgJUb": {}, "UJRMbkcTglbU86Fy": {}, "OjApNHBVfNOURcjY": {}}, "configurationName": "3YYT9oTynmfIuBWg", "inactiveTimeout": 73, "inviteTimeout": 24, "joinability": "TNFfM8M0IW4oe8KD", "maxPlayers": 14, "members": [{"ID": "Pvfn2Qt9iyq3Nyk8", "PlatformID": "ncu2Z3eDHH9WaVO4", "PlatformUserID": "iKhDcJ7TCcNIsQ3P"}, {"ID": "uppUxDSK8aOTGMud", "PlatformID": "cxlCV4cNbJGQ57lP", "PlatformUserID": "dinpjS2DRfGt9Gly"}, {"ID": "ZVQ4X67tPZSTpPq3", "PlatformID": "xjrElvvDgw0ag7kS", "PlatformUserID": "WE0Hiqm5IuLryiEX"}], "minPlayers": 35, "textChat": true, "type": "8p4n4XCFkD1AJLCw"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicCreateParty' test.out

#- 69 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --userId 'oLuPakQN1MpOs1RV' \
    > test.out 2>&1
eval_tap $? 69 'PublicGetRecentPlayer' test.out

#- 70 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Frcg2CXxepx78fvs' \
    --body '{"yhE2BKtyTDSIM7mk": {}, "mvZ7Cmsh4US8o4jf": {}, "MANPpmZDdMiCxmuC": {}}' \
    > test.out 2>&1
eval_tap $? 70 'PublicUpdateInsertSessionStorageLeader' test.out

#- 71 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CVuFjS1GC1d2b92B' \
    --userId '4vEgj3HOmhcWm428' \
    --body '{"XejRF94NIY9nMrBZ": {}, "o0lNUBDShHD32vvL": {}, "28FPwTiXfLcxDC9Y": {}}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateInsertSessionStorage' test.out

#- 72 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["nd02mECIQhfIhHtA", "DUQ9zimQTQT95pFJ", "UAJsyAfeKOufV4f1"]}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "NohXu6opxQGRt6Pq", "data": {"lkL0diRhLC10ih2E": {}, "QfY3XCv4hdOa6FdZ": {}, "hNMd1onFjGRbxtAB": {}}, "platforms": [{"name": "PXDmgNEJBhgGq5GI", "userID": "DhNC66szbCCf73IF"}, {"name": "bRkPSSITz4TjCrJH", "userID": "XGXku2YVuOzhxHmn"}, {"name": "rrV9ZGWrZ05sxe6A", "userID": "6RpmKDebNkylbynk"}], "roles": ["gT9vayLLiizac7Ge", "6zKJdlt7rjF5RaJw", "vkWVco2LTo5ijlvD"]}' \
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
    --order 'F8qBWCQ9dLWYyS8z' \
    --orderBy 'dhMeBXH8x6HdVfZV' \
    --status 'DAiU6iJOF7JKZFNk' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryMyGameSessions' test.out

#- 77 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '2NKy59X8iOg2sVBi' \
    --orderBy 'CoeC5weXJl7PeiMH' \
    --status '8z8dVej8N2yv6VTn' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE