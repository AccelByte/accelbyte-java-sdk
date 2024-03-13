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
echo "1..78"

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

#- 33 AdminGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --userId 'hiqjRJOqB5F93zFQ' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetRecentPlayer' test.out

#- 34 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bJndUDpdONneAczb' \
    > test.out 2>&1
eval_tap $? 34 'AdminReadSessionStorage' test.out

#- 35 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BdHb2slt71B1SmZp' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeleteUserSessionStorage' test.out

#- 36 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2JZp50CnPb71ORYc' \
    --userId 'mQbTU5JX8ccLjMXJ' \
    > test.out 2>&1
eval_tap $? 36 'AdminReadUserSessionStorage' test.out

#- 37 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'Rk0eaKQDOJvrTefg' \
    > test.out 2>&1
eval_tap $? 37 'AdminQueryPlayerAttributes' test.out

#- 38 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'lSs6g4iY9u02aCNY' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetPlayerAttributes' test.out

#- 39 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"IWekp18lOC3mNqF7": {}, "Bl0LcghVHfPEspxw": {}, "hRON0bc1eMbEIjow": {}}, "autoJoin": true, "backfillTicketID": "KesKoELCpobBEG8X", "clientVersion": "645xpdXpai0rYaT5", "configurationName": "hOPjaf3H0tYighU0", "deployment": "VUfcYHJbBfAKSiPW", "dsSource": "3VgsZXiR1DJ7HVWq", "fallbackClaimKeys": ["MkNSawQUWDFJvJBW", "ic7UkBeIXuqDuAXI", "66bQ71w0deoV9Lx5"], "inactiveTimeout": 90, "inviteTimeout": 33, "joinability": "DA1l2XcrciYNEzvS", "matchPool": "ZIPkhSgORcz5S5Bv", "maxPlayers": 26, "minPlayers": 3, "preferredClaimKeys": ["gBLxh4ijFnE3Tam6", "9qSZ7PC6f6QkmZXE", "lW9YfRSse6AAz3S4"], "requestedRegions": ["czz0QKFlAVmVLu4A", "Oec0z8eBeeoip68J", "1nsv4W2OJhtafxMS"], "serverName": "JlHeb34sZKHcl5LL", "teams": [{"UserIDs": ["LOexL4fZvWtND2tc", "BFpX8lNtFEJ7tnkY", "6Mca5afj12K2IzrB"], "parties": [{"partyID": "vvWm4udE0OXudXgN", "userIDs": ["ne8kJATwlc6esUp6", "Sw1I98jeZQ7hfxnh", "Ld3Knaknoed9DHhL"]}, {"partyID": "OqQGhCUr6iTrjyEg", "userIDs": ["arAdNJOIG36I6tRb", "RcrEveMdAdiPKDUV", "SC00PYeDcagginxn"]}, {"partyID": "FIna3yddcbsPheTH", "userIDs": ["26IUJNvYuGRUvpZa", "HCuESOiIZsMfB4ZH", "3mtgWgU4pCAKxeE7"]}]}, {"UserIDs": ["0CaunQNxot371W9G", "4AvQkqsGnmyo5JJT", "UVmb8GEXFTlEMEsF"], "parties": [{"partyID": "zYqwgK1Np5nodqpL", "userIDs": ["m7FhJBNXzAFdO0Kh", "qf6kiTdSGv2LFjAK", "Y7CbgsWqFWZX7kPB"]}, {"partyID": "om8F9GLLTG8phc3n", "userIDs": ["4iLoIllKlpO2pqiX", "JF3WGRaoQomSJC4D", "drKF7SUQPLG59e0k"]}, {"partyID": "5ZtX6wK7PpUlcIW3", "userIDs": ["2iK7MGt1ixY5rA1W", "oVeJIePF8ZrQzP4z", "vtdxdbZUpd6FJtHJ"]}]}, {"UserIDs": ["1pyVwyKQLY6FEO65", "Rb3z7CYLM8IlsHqf", "fnrfsGlfPaZKBwa3"], "parties": [{"partyID": "Ddb60ufPpzwj1QGI", "userIDs": ["FmlVf4jvapseE9LN", "9bvhOrHflIOd6X3v", "iLvtEk4mTIpUA9gx"]}, {"partyID": "o8SV38nEhoXmM2W7", "userIDs": ["l6jHMA2rG3nakopA", "ywelu01nryEJ0Nqo", "Tow0qiOiC4j0iktm"]}, {"partyID": "0ZPLkLOsp0LZ5njN", "userIDs": ["86Hl8kUXzt6bSc6b", "WvgpVyW9dD1kOmvr", "Aejcq2LgkQuaS7RB"]}]}], "textChat": true, "ticketIDs": ["ME74HUtipUWYhWV1", "qx8CzPML52faXUr9", "Sk4lq2faBcAXXKlh"], "tieTeamsSessionLifetime": true, "type": "OUn18G5MlfDTk8aG"}' \
    > test.out 2>&1
eval_tap $? 39 'CreateGameSession' test.out

#- 40 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"40NlncceIZSwgAIk": {}, "gzh4pTU0Am4DZhl0": {}, "bQxFJ3sWCqQpQ2Fb": {}}' \
    > test.out 2>&1
eval_tap $? 40 'PublicQueryGameSessionsByAttributes' test.out

#- 41 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "KPFMycMSQ4qfAacR"}' \
    > test.out 2>&1
eval_tap $? 41 'PublicSessionJoinCode' test.out

#- 42 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '0LgB5BUXvjcu2s6w' \
    > test.out 2>&1
eval_tap $? 42 'GetGameSessionByPodName' test.out

#- 43 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3VifnKqmTSoGH1XE' \
    > test.out 2>&1
eval_tap $? 43 'GetGameSession' test.out

#- 44 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fY6QAYn6WQ5UBEU1' \
    --body '{"attributes": {"QAOHfZiGhxOdcuDX": {}, "SxSc3aZPV87pna08": {}, "gxefTYKhuxaEc7M4": {}}, "backfillTicketID": "P7UckSC6ePeN8i4G", "clientVersion": "rFES9z7xueHpATHc", "deployment": "cee9GXhKcjmSEwdr", "fallbackClaimKeys": ["kEnnqKzFsLfYalUl", "fwEQKjU7eHGebSVu", "0LQ40kepEaC4dfiO"], "inactiveTimeout": 79, "inviteTimeout": 88, "joinability": "ZfEhHr39pysFO3Zv", "matchPool": "c1BZG99LyvfvHEsJ", "maxPlayers": 74, "minPlayers": 47, "preferredClaimKeys": ["QQewVLMUoAnaRcYp", "7FUjfIGaffoflEIB", "yYqeKN0meGelYF5w"], "requestedRegions": ["WaDhukU4khGG4vZF", "TYnPkmSu4PWam1jx", "R7SETWjteoc8fgvZ"], "teams": [{"UserIDs": ["DDhoO05oKqymxLD1", "Lcvw6T6mZEiwxxEl", "pMYSWIeVzm7z9noo"], "parties": [{"partyID": "wmlTIKVowi0RY2VN", "userIDs": ["4ZONJREdUQ3z9F1B", "xNNgnke4akncw7wu", "9TmXfJWBPrx9Ns8e"]}, {"partyID": "LzYEvwSWTaLQjctv", "userIDs": ["rK2jhsYpKPlXn77A", "tYoFzLAATPY8P8P3", "cfoivvQxevecWw7R"]}, {"partyID": "ry0KK5rgAGO0dW8r", "userIDs": ["X2MVUGKSZ4GcLkt4", "pK32sJxlZcCTpTdR", "tCHvuk6B6XTmSLyn"]}]}, {"UserIDs": ["50sigBVZxiKdV57G", "vRyd9UuL02Le8HSC", "slsDd4M1F5qRIblS"], "parties": [{"partyID": "7Nz81GRazPAANjfB", "userIDs": ["oldFOyqA2clJ5gEO", "aCgM6Yn6RugbNEIp", "GBFUjOn5mM7k8nbL"]}, {"partyID": "zvtCIW5ynMKquUic", "userIDs": ["AeIVXtoWAXhMlW4t", "LqX7OICf5oD1e6oI", "9FmYel0kOw72o8Zk"]}, {"partyID": "gk0jS6rDWUwfhKvr", "userIDs": ["f2AaH4yCWrHSppnI", "ZkNnTn3rzH5NvAtc", "vNedgS1fUfKmihDb"]}]}, {"UserIDs": ["mu8ePWlQMVDXEHei", "GTnwyEw6hIWDZrpP", "7rz3ISW510kHr4is"], "parties": [{"partyID": "TKWjmv67nuHCXWfw", "userIDs": ["nwGioVwVzmmBVVFf", "pqx1AeLtzcPJ3jtD", "YBo4FUTH7CGfKSyx"]}, {"partyID": "gRR1DiCqSMzpqIFG", "userIDs": ["LkDs7ACC1RgBfoNr", "HlFi2qJLgmBLE35Y", "hyiDV90SeI5yppBH"]}, {"partyID": "oytVznCgNyx9fbT6", "userIDs": ["3ShEh8PbGikLjgjc", "j34uulU6FYBZsWFb", "r3RSP0W9nBhvhf8Q"]}]}], "ticketIDs": ["0DtJMcYQdN66bswA", "gt65X4N1LQZmB61J", "MdtwCVUrYQue84dw"], "tieTeamsSessionLifetime": false, "type": "gXNwvm4e5GX6H742", "version": 83}' \
    > test.out 2>&1
eval_tap $? 44 'UpdateGameSession' test.out

#- 45 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'agRJK5PX9UcOvhPy' \
    > test.out 2>&1
eval_tap $? 45 'DeleteGameSession' test.out

#- 46 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'E11TRT2SKseoe8VL' \
    --body '{"attributes": {"ie0LBa36KNzjf005": {}, "CXNGehQ2aTjTDfKF": {}, "DXC7eGL5YhJDWh9Y": {}}, "backfillTicketID": "Wqc0qgV6d9yOfIML", "clientVersion": "ds2DbPcaoMdtRLTm", "deployment": "SvTkQQgB7exYvmHM", "fallbackClaimKeys": ["xr5hPCJJztJBg0tT", "Jg46IewOXE2AkCh3", "QIZsUf8lGFXcmwTE"], "inactiveTimeout": 90, "inviteTimeout": 69, "joinability": "HclOdxIwqejxe18r", "matchPool": "Ndb8Otq6j1mqUav7", "maxPlayers": 21, "minPlayers": 48, "preferredClaimKeys": ["05HAQltnSojV4jT6", "5yclX2FtAz0vJjFI", "YWOaNdsimmkW2miH"], "requestedRegions": ["3xRHAKy4QxZkaXZ7", "vmiEd0JPxVyQpsha", "DwNqTbbFMXAMfVXe"], "teams": [{"UserIDs": ["0GZeMgsRsmH1EQrY", "mkPKTPOlhTtSiZNC", "xuogFteTHJe4BhSS"], "parties": [{"partyID": "QkQD6WmOt6D7ufFV", "userIDs": ["TOhvQpfbBke8aEdd", "36xj6wySoltDxsbz", "xrlaKEfkoYjY2o6o"]}, {"partyID": "uRW9UtNquwC3Wgum", "userIDs": ["rIz4NhGztZpr4U4f", "wQIiLXgmRasvjO4l", "j8m3XEwP2b4gd3xO"]}, {"partyID": "eii8Jnmssep2xD2N", "userIDs": ["Y0kABeGs9yxahld1", "pO0Gyf5PO3COyMvc", "zgEpzZ3FbtxfhcRC"]}]}, {"UserIDs": ["7IVYa6iZ5uFRYNn3", "SHiWxF0YbuU5ar5q", "TLWUCy0Afgc050XI"], "parties": [{"partyID": "ZRW491e94mQjVOOB", "userIDs": ["nIWhunElqZUodp3I", "htCSHy1ei1fIrPvf", "HnRN06EjRwEQlNap"]}, {"partyID": "JRfk4f9Zcw1pEHAy", "userIDs": ["NFxcVTKuAQTGh5Bx", "jWOozGoDtsUuYo5p", "8ED5QZAufwNa8lzf"]}, {"partyID": "jv9oYMXMjlVHY1AH", "userIDs": ["wF3vGoav7MK0PcLn", "EkcokKwcQ0baDT9O", "yJ2h23GUS2amU7sy"]}]}, {"UserIDs": ["GlElXdEAOrVSnLoc", "LVVYamQc4wcG5nDB", "LJoJHbiQ5duE5p4c"], "parties": [{"partyID": "fs2E41cK8QTwiIAv", "userIDs": ["xSvNDlmM5nQFMGzs", "7fzjgyc44mEh9tRk", "8knYSV30lnroQehM"]}, {"partyID": "Dli6t9unQLYXxm09", "userIDs": ["wpGAbpEmDY9vLh3u", "6EDsUmrV6kH4OotK", "wG3UC6XCnnZxF8Cm"]}, {"partyID": "Qr17W65br34rBBN9", "userIDs": ["tU6TDm5GloFSKWM1", "eym5ydC6p25xCWTq", "UOYZENJ1QHZQxPRX"]}]}], "ticketIDs": ["H7uxBJEECQE1li3B", "g7Jxc9pUnZmvhidw", "CkZwqjYLfTiCO1ND"], "tieTeamsSessionLifetime": true, "type": "4jxW4pIDwdqXpmRm", "version": 42}' \
    > test.out 2>&1
eval_tap $? 46 'PatchUpdateGameSession' test.out

#- 47 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BCbyJsF5IjF1c0W3' \
    --body '{"backfillTicketID": "38HS6CBgVRyihYNZ"}' \
    > test.out 2>&1
eval_tap $? 47 'UpdateGameSessionBackfillTicketID' test.out

#- 48 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '84CVhziXV8HwSmvc' \
    > test.out 2>&1
eval_tap $? 48 'GameSessionGenerateCode' test.out

#- 49 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vcDKF19yVRafCjOu' \
    > test.out 2>&1
eval_tap $? 49 'PublicRevokeGameSessionCode' test.out

#- 50 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SYht83AdvBaagTiR' \
    --body '{"platformID": "J8daGTVX3Bb7jlz5", "userID": "IfHgKjI9mwJSrN8j"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicGameSessionInvite' test.out

#- 51 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'kIykR2zbaI6PD7fE' \
    > test.out 2>&1
eval_tap $? 51 'JoinGameSession' test.out

#- 52 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'scShnGUGUtV9GJ27' \
    --body '{"leaderID": "9GDbLNwjm3FK0nnX"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicPromoteGameSessionLeader' test.out

#- 53 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2poMfZ1hDHtbh4Ht' \
    > test.out 2>&1
eval_tap $? 53 'LeaveGameSession' test.out

#- 54 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MlFgvh2Dp2SoiIPp' \
    > test.out 2>&1
eval_tap $? 54 'PublicGameSessionReject' test.out

#- 55 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1yvfAHS0VgLu11A3' \
    > test.out 2>&1
eval_tap $? 55 'GetSessionServerSecret' test.out

#- 56 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HTovFi4tPAGfleyC' \
    --body '{"additionalMembers": [{"partyID": "A6jEtcqsnzoVILjk", "userIDs": ["wW61duF87aUyrdt4", "XSpWBAetsanzqP8o", "xfrtbECD1CYPwaiB"]}, {"partyID": "AxfYL8Avt70ZUT2f", "userIDs": ["Sk3LL0calqxEewuG", "S469k2hG0WKt4sUm", "anYxM0UHZVNYzGMN"]}, {"partyID": "IpWoSLkUrfuf4U3W", "userIDs": ["eYeA9t2ENKKWrFtH", "Ii1CMgKAOG5iDcCR", "5PbCvDLil8wj9cKM"]}], "proposedTeams": [{"UserIDs": ["3Ar6MF35hCER4nGm", "WGgTJfHlJl4tHGa4", "XfZcd9CVnGqMX9Fi"], "parties": [{"partyID": "eeEssWEUl07bhwnt", "userIDs": ["CVqiYOJf5KwMZQjz", "vjSozv6CTRDl0zp9", "CzHFwinkBNi4gvqg"]}, {"partyID": "l6TZ9TGVPmv34h6T", "userIDs": ["7EsufmfxKYB4LM6H", "6QXmpZ9X3fUSR1l9", "xLPBsmAUrD9L1IiD"]}, {"partyID": "6MlcEPhMDFzjHZ3s", "userIDs": ["IhzOx2CXKlvIomU3", "pIxM9n8D2eLMe3lt", "9qfx2UDcgVE7L9FK"]}]}, {"UserIDs": ["6e0MrPc4vtxk9hVK", "lG56HlzGr7XjdyRJ", "unZPkp6ccIBnWyPw"], "parties": [{"partyID": "8mj7gyQ7XdIszGRj", "userIDs": ["46COPipH1MWVTHG0", "qHJCWEfOJpZm9yEY", "WNGMy2pgSGSUOK68"]}, {"partyID": "eqGJtWf1Ybgg8rdw", "userIDs": ["Y9bmrvHmO07KNqX9", "LM2IwEsdOGBXBwnz", "DX8v3xgC1Ge9PdbT"]}, {"partyID": "TAJ2Gp1r0sVZ6LJA", "userIDs": ["OddIL2l3hPjNDKv2", "LWfXqjr8fS79En3w", "YowBdkaZ3y6i38XQ"]}]}, {"UserIDs": ["jLDRqkpiFK5BtiQ2", "72Uo9UBJWodpdwsX", "1jorcyR0x3YiHF8I"], "parties": [{"partyID": "TGPRQBCgIs1Q2lzx", "userIDs": ["l0yF5m77TTh4gUoj", "8u2WRcLiEtzVlnkf", "lfn7pHY48F1dl1q9"]}, {"partyID": "2m3iRlfnBAk0CwiA", "userIDs": ["sR65yQ9ssuHdGmxn", "cCEr0KcgeqzGbruN", "B72HHMkjzyBB4UFK"]}, {"partyID": "iaoV0VOem2yqPsMF", "userIDs": ["xKybPkbuS6x9cLJ1", "APnNlsa2bRBr27fV", "MWuAfDqLMR919IZP"]}]}], "version": 75}' \
    > test.out 2>&1
eval_tap $? 56 'AppendTeamGameSession' test.out

#- 57 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "CsodJrhQW41q2Osp"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicPartyJoinCode' test.out

#- 58 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'CZbt3Uta5I0uGcL1' \
    > test.out 2>&1
eval_tap $? 58 'PublicGetParty' test.out

#- 59 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'koyHjCH5olYLETRp' \
    --body '{"attributes": {"ABAmO2EGvJ4UMS93": {}, "yOxNInDByhnoluO6": {}, "ti0QP2ssiJ66OzOj": {}}, "inactiveTimeout": 51, "inviteTimeout": 9, "joinability": "O6tgohjtC7bzjPpu", "maxPlayers": 5, "minPlayers": 97, "type": "ddXJ5zifF8y959an", "version": 36}' \
    > test.out 2>&1
eval_tap $? 59 'PublicUpdateParty' test.out

#- 60 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tzB0B4CxyQrUpIFv' \
    --body '{"attributes": {"ORxTi79DpSjb39uk": {}, "cR6c2E2r3vk3IfAK": {}, "EbqcNXSGCCvNowNm": {}}, "inactiveTimeout": 8, "inviteTimeout": 32, "joinability": "nXOErQPS4VsRoYIK", "maxPlayers": 24, "minPlayers": 85, "type": "yg9ADCGiXaLs2xjH", "version": 21}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPatchUpdateParty' test.out

#- 61 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LsNhdgQ0JWZjNRSz' \
    > test.out 2>&1
eval_tap $? 61 'PublicGeneratePartyCode' test.out

#- 62 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OTqcVNX3ahvxw9gw' \
    > test.out 2>&1
eval_tap $? 62 'PublicRevokePartyCode' test.out

#- 63 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'whTnjN6wKZGW4y3f' \
    --body '{"platformID": "0R9s2kndhhZhwAiL", "userID": "sZs4pmLDIQch4IjD"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPartyInvite' test.out

#- 64 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'q9aT3qZyI0rYsWuc' \
    --body '{"leaderID": "AkXsVJbXi7eRZa7W"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicPromotePartyLeader' test.out

#- 65 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wIc895ImqK6tVsaU' \
    > test.out 2>&1
eval_tap $? 65 'PublicPartyJoin' test.out

#- 66 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'q3stUh5J5Z9GiBiS' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyLeave' test.out

#- 67 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'AylX5cS0IeHpWCug' \
    > test.out 2>&1
eval_tap $? 67 'PublicPartyReject' test.out

#- 68 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mfOL0QQpxsuD8PGq' \
    --userId 'ku59eFJrOXyDYz9v' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyKick' test.out

#- 69 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"MUOPG0iHDT8QbF7g": {}, "HPTPQbvLt2NRqJGI": {}, "KzLyH1y72L13Orny": {}}, "configurationName": "x34luLdvtsTKXMji", "inactiveTimeout": 45, "inviteTimeout": 74, "joinability": "gYPvfn2Qt9iyq3Ny", "maxPlayers": 21, "members": [{"ID": "TIP1LKiFQoLDvumf", "PlatformID": "qrgSfnx2h61X9dN1", "PlatformUserID": "MGRXBJ6mVV7JS9qj"}, {"ID": "NLwvI8JdiY3RRiLi", "PlatformID": "lmOGF6dLLIeIVIjM", "PlatformUserID": "cdlbdRXTGIrdNL5g"}, {"ID": "JPqTAjgqaTHf1ANT", "PlatformID": "J9Yk997XkGOdC6It", "PlatformUserID": "xDT8p4n4XCFkD1AJ"}], "minPlayers": 77, "textChat": true, "type": "CwszbZxuHSgDOK8b"}' \
    > test.out 2>&1
eval_tap $? 69 'PublicCreateParty' test.out

#- 70 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    > test.out 2>&1
eval_tap $? 70 'PublicGetRecentPlayer' test.out

#- 71 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RVFrcg2CXxepx78f' \
    --body '{"vsyhE2BKtyTDSIM7": {}, "mkmvZ7Cmsh4US8o4": {}, "jfMANPpmZDdMiCxm": {}}' \
    > test.out 2>&1
eval_tap $? 71 'PublicUpdateInsertSessionStorageLeader' test.out

#- 72 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uCCVuFjS1GC1d2b9' \
    --userId '2B4vEgj3HOmhcWm4' \
    --body '{"28XejRF94NIY9nMr": {}, "BZo0lNUBDShHD32v": {}, "vL28FPwTiXfLcxDC": {}}' \
    > test.out 2>&1
eval_tap $? 72 'PublicUpdateInsertSessionStorage' test.out

#- 73 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["9Ynd02mECIQhfIhH", "tADUQ9zimQTQT95p", "FJUAJsyAfeKOufV4"]}' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 74 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'PublicGetPlayerAttributes' test.out

#- 75 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "xGxBWtnTKUe2znsq", "data": {"PzPkwCBo2SwCUsTa": {}, "g4MLAo3m61P2xaNf": {}, "mn8Onb1a9gMz0F2U": {}}, "platforms": [{"name": "BRmMhAbUWmFhdYLW", "userID": "zMuv3zkUY0n0BAZk"}, {"name": "wbYkBLyO6A0Fqfhn", "userID": "aB3YxKNdOTacCcJf"}, {"name": "IfXshuLUk5WdpxjZ", "userID": "x5noXPhPUTKbonou"}], "roles": ["cNmzwOZOK56sDkci", "5rZ8iMlOuksQJCiR", "FiZWwJ7NrTb1XTB9"]}' \
    > test.out 2>&1
eval_tap $? 75 'PublicStorePlayerAttributes' test.out

#- 76 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicDeletePlayerAttributes' test.out

#- 77 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'YQzUJ9XlYJ8BzP6E' \
    --orderBy 'UmUXGM5anIloyj9l' \
    --status 'hbvuQdW2jwKUckc7' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryMyGameSessions' test.out

#- 78 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '94ryY91lX8DD4MYX' \
    --orderBy 'lrJ81lHvv9rqvEoM' \
    --status '8YmVjAkO3HKsEp6K' \
    > test.out 2>&1
eval_tap $? 78 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE