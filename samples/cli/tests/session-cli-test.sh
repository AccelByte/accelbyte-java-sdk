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
echo "1..82"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 15, "PSNSupportedPlatforms": ["fofvnnSuB0y5WUlr", "MdI4sNveabntBSxT", "eIv53HGCiljvjKoy"], "SessionTitle": "D6SCwGrncqmLtjQH", "ShouldSync": true, "XboxAllowCrossPlatform": false, "XboxSandboxID": "f8TgoNm03VLisV6z", "XboxServiceConfigID": "wPuo3td6TC6I3lMj", "XboxSessionTemplateName": "GSWN2laRlxfcjHfY", "XboxTitleID": "akUCTqGkE7wcWfDs", "localizedSessionName": {"lpJSqGAXQ0yYoNRK": {}, "d3IL5TAQ6iiPlSC2": {}, "uE4o5Vwdo3fePqIJ": {}}}, "PSNBaseUrl": "A8IHtrkmu0hpDDWV", "attributes": {"Ala2l5BYNtIuS5S5": {}, "XUdjsoqwGyzzWi9g": {}, "wQYv7t1o7TTr1Dmr": {}}, "autoJoin": false, "autoLeaveSession": false, "clientVersion": "Zv15T7quIOvBMcaY", "deployment": "mvCkGZ5dAgqxpBFm", "disableCodeGeneration": false, "dsManualSetReady": true, "dsSource": "Loxozr6wfNPX2bOI", "enableSecret": true, "fallbackClaimKeys": ["NyLu0M3VHh2EI8Jl", "DbPWbQ6Q9lNmqRBa", "AkLnvxkT1X68cmDc"], "immutableStorage": false, "inactiveTimeout": 9, "inviteTimeout": 48, "joinability": "pjChB3V0v52Dlym6", "leaderElectionGracePeriod": 31, "manualRejoin": true, "maxActiveSessions": 86, "maxPlayers": 81, "minPlayers": 57, "name": "3xoJ8aeCnaLpUKp4", "persistent": false, "preferredClaimKeys": ["YUDjasWIPUvmEejt", "GeoyIPa8ZRrvjj7i", "l35MXbN9oCMNqq98"], "requestedRegions": ["SjTvhZNkSQ70D0H6", "BXksUC9b6i5lZC9x", "v32e8c5csSovoqsZ"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "wbmXgdAPh1EThG96"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateConfigurationTemplateV1' test.out

#- 17 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --name 'QZxfgPubTDIHrvqA' \
    --offset '94' \
    --order '3EeERmDnyeFoF7VS' \
    --orderBy 'Z6pf3vneSD2Tb3g7' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAllConfigurationTemplatesV1' test.out

#- 18 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'mSQUhAEtrmjqU6YE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminGetConfigurationTemplateV1' test.out

#- 19 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '3p4lSck0ZHn5GI39' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 0, "PSNSupportedPlatforms": ["BHqaTHeKtW18iGeU", "lc9d9sogWa24CKNS", "0GqVvUfHQvsHXNUN"], "SessionTitle": "e4mhgo5QB65lSAiY", "ShouldSync": false, "XboxAllowCrossPlatform": false, "XboxSandboxID": "NjkfZrQvGgbLdLsF", "XboxServiceConfigID": "zHkBMr1yrOMlNFSr", "XboxSessionTemplateName": "UEirnjX9fDmIbeZx", "XboxTitleID": "zfTcyiuATus9hsfp", "localizedSessionName": {"FDcSDG8aMVGLiBNr": {}, "DjqoxcwgGLXpUL4p": {}, "p2ncYAHdNzDmeIP6": {}}}, "PSNBaseUrl": "rOvDz9KOsb392k6Y", "attributes": {"mJFfRByjlBiuFM3F": {}, "IoVk8T3GpAnkCmBU": {}, "qg2SCnqntX9y1aZS": {}}, "autoJoin": true, "autoLeaveSession": false, "clientVersion": "C2DKHRuPMMWH8Yb3", "deployment": "3T5UBJCjfcnLRfxe", "disableCodeGeneration": true, "dsManualSetReady": false, "dsSource": "Sz9WEi8KlloeH0JT", "enableSecret": true, "fallbackClaimKeys": ["m5T50x9WT0GfH2rt", "Oa4EXsXzOXQAk4mq", "rxzTtuLl4XlbGL8Q"], "immutableStorage": true, "inactiveTimeout": 47, "inviteTimeout": 1, "joinability": "tjzm8y2wNhmwoYZy", "leaderElectionGracePeriod": 72, "manualRejoin": true, "maxActiveSessions": 68, "maxPlayers": 65, "minPlayers": 8, "name": "ZKBcYrCEAE7WIsfm", "persistent": true, "preferredClaimKeys": ["wH3q31A806DJgas4", "b6z3LNUj7fdgLA84", "Z8YYk6QEgJjBbEDo"], "requestedRegions": ["Nf3n0hEoRCAcf80z", "fFyabWAgIUXiI07A", "68eaqC2J9jyEW6GL"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "YbsKoADkzJEN2VHz"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateConfigurationTemplateV1' test.out

#- 20 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'ih3bit0VWn3CO39P' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteConfigurationTemplateV1' test.out

#- 21 AdminGetMemberActiveSession
./ng net.accelbyte.sdk.cli.Main session adminGetMemberActiveSession \
    --name 'XDNxtXgeO3FgkXhj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzaQY3snn2ZkP7cF' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetMemberActiveSession' test.out

#- 22 AdminReconcileMaxActiveSession
./ng net.accelbyte.sdk.cli.Main session adminReconcileMaxActiveSession \
    --name 'dP43e5dC9XIBudfZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userID": "grbHDIDm4hMzF4Tx"}' \
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
eval_tap $? 25 'AdminQueryGameSessions' test.out

#- 26 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"MdIIlhS1fSiM9331": {}, "m7Ta1PsKc50Kv6ec": {}, "nEevcAx2K2zkRenm": {}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminQueryGameSessionsByAttributes' test.out

#- 27 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["PZnGBt4P7WnbdSJt", "jX7ZshZyZl5x4bRX", "BHUTrDzZSKscfOcY"]}' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteBulkGameSessions' test.out

#- 28 AdminSetDSReady
./ng net.accelbyte.sdk.cli.Main session adminSetDSReady \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'u3dpCROYqUiGKXVF' \
    --body '{"ready": true}' \
    > test.out 2>&1
eval_tap $? 28 'AdminSetDSReady' test.out

#- 29 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'Ro2ogaKt2ujQSa3Z' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'db65UXmy0Zp6iIaT' \
    --statusType 'IKUkmkk9QM0NBMA9' \
    > test.out 2>&1
eval_tap $? 29 'AdminUpdateGameSessionMember' test.out

#- 30 AdminGetListNativeSession
./ng net.accelbyte.sdk.cli.Main session adminGetListNativeSession \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '40' \
    --order 'RxpzwLR2AK6eXUGP' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetListNativeSession' test.out

#- 31 AdminQueryParties
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
eval_tap $? 31 'AdminQueryParties' test.out

#- 32 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlatformCredentials' test.out

#- 33 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "B0NRsB1fPqqRRulp", "clientSecret": "qpymDkQhtrHWwRVn", "scope": "wVBOqOHi8pWGd1ju"}}' \
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
    --limit '32' \
    --userId 'hiqjRJOqB5F93zFQ' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetRecentPlayer' test.out

#- 36 AdminGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session adminGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --userId '88YbCtmKy8M9zVrj' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetRecentTeamPlayer' test.out

#- 37 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fGXZnqAQUoY1GjlI' \
    > test.out 2>&1
eval_tap $? 37 'AdminReadSessionStorage' test.out

#- 38 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ik0iKoTTS1j02o7J' \
    > test.out 2>&1
eval_tap $? 38 'AdminDeleteUserSessionStorage' test.out

#- 39 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jTXAQN0qdskdQV0T' \
    --userId 'qI8EFnmDbxIxi4YK' \
    > test.out 2>&1
eval_tap $? 39 'AdminReadUserSessionStorage' test.out

#- 40 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'lONk2Q5Y4Jvaizwi' \
    > test.out 2>&1
eval_tap $? 40 'AdminQueryPlayerAttributes' test.out

#- 41 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'ilatuUjjt9lIMGql' \
    > test.out 2>&1
eval_tap $? 41 'AdminGetPlayerAttributes' test.out

#- 42 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"5ElEa9EIIlGcHB3C": {}, "fR3ncDlwi3v3MFFJ": {}, "1KesKoELCpobBEG8": {}}, "autoJoin": true, "backfillTicketID": "645xpdXpai0rYaT5", "clientVersion": "hOPjaf3H0tYighU0", "configurationName": "VUfcYHJbBfAKSiPW", "deployment": "3VgsZXiR1DJ7HVWq", "dsSource": "MkNSawQUWDFJvJBW", "fallbackClaimKeys": ["ic7UkBeIXuqDuAXI", "66bQ71w0deoV9Lx5", "RDA1l2XcrciYNEzv"], "inactiveTimeout": 91, "inviteTimeout": 68, "joinability": "ZIPkhSgORcz5S5Bv", "matchPool": "mgBLxh4ijFnE3Tam", "maxPlayers": 79, "minPlayers": 33, "preferredClaimKeys": ["Nzy1adnSKOLFKx1d", "X4LuWJu3pDMUAeeZ", "97SBROPYuG6XqP6o"], "requestedRegions": ["o7G73zdxTgOfnwId", "lNa29fDLh741IslK", "HzGlLKWUtDQs61OQ"], "serverName": "AoxyyQpRWCiiPDGQ", "teams": [{"UserIDs": ["hNPEwiJCf2XJVrlz", "qQls1ozhLVA3kE8j", "KvgatOEBM70TdlNB"], "parties": [{"partyID": "JYOmpu1VCarzBsV6", "userIDs": ["xnZ5Jrzzjrcaug6C", "WVG8SWP3glU6musw", "VJnNnN7kAa7j0riF"]}, {"partyID": "c5HTHQIoVsGo7dwV", "userIDs": ["9DBqFKHQkETJyTlU", "rwDTnoujQD4IEiH9", "Z5qXn3aoRtlqOECo"]}, {"partyID": "hViHA5CzgFSy8X1A", "userIDs": ["3PrIfapq5AAeMe4L", "3mDWORBVXTIIJM9X", "sYIIZxiXNMR9BgaW"]}]}, {"UserIDs": ["cFX3SUBhyoTsMWPA", "xUMkawaGpAyrIwMi", "f3BOdkocVTd4BxqG"], "parties": [{"partyID": "WV6mTJ0sQs6XNbjv", "userIDs": ["qhnUVLWu8olKdxL6", "ozRmDD0jJvlfV5Oe", "mPYdYT7DROCjtuzF"]}, {"partyID": "MbAG9YI89hmguB8F", "userIDs": ["OTjMLo4b9rIzqYkE", "pstyVTBcrM8rG0rH", "0zcswwVeMK6MbGIV"]}, {"partyID": "Iu8vvwLc7KY3uVoJ", "userIDs": ["XTIMtpgkieDyF97l", "GdMiHKxbWCYzo8yO", "2KTK9tmmOnYnOpas"]}]}, {"UserIDs": ["6ghP1y4Zi7s7QBlk", "44Z44B1GZgKg4uKx", "aCgcGLuC3brWdTYC"], "parties": [{"partyID": "fHkIySok5DiXZtLW", "userIDs": ["87rGysryod3dNQrm", "sApRA6HX3RwrKt2e", "cozL0TOg54vCE48L"]}, {"partyID": "5oLF6M4lNa4JUMSH", "userIDs": ["NgqRqCV7usamANkZ", "lOX9Sfo95HgXqKhT", "PkwfLM9uSybRzWek"]}, {"partyID": "2gZvRrvr0n9d9lvc", "userIDs": ["cKMLhrTrcBE2ItBS", "3KtKZWe8aoFzAyBM", "E74HUtipUWYhWV1q"]}]}], "textChat": true, "ticketIDs": ["LYOWA8NjxOnaEok4", "nOOCzfsflhjbngJO", "Un18G5MlfDTk8aG4"], "tieTeamsSessionLifetime": true, "type": "NlncceIZSwgAIkgz"}' \
    > test.out 2>&1
eval_tap $? 42 'CreateGameSession' test.out

#- 43 PublicQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"h4pTU0Am4DZhl0bQ": {}, "xFJ3sWCqQpQ2FbKP": {}, "FMycMSQ4qfAacR0L": {}}' \
    > test.out 2>&1
eval_tap $? 43 'PublicQueryGameSessionsByAttributes' test.out

#- 44 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "gB5BUXvjcu2s6w3V"}' \
    > test.out 2>&1
eval_tap $? 44 'PublicSessionJoinCode' test.out

#- 45 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'ifnKqmTSoGH1XEfY' \
    > test.out 2>&1
eval_tap $? 45 'GetGameSessionByPodName' test.out

#- 46 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6QAYn6WQ5UBEU1QA' \
    > test.out 2>&1
eval_tap $? 46 'GetGameSession' test.out

#- 47 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OHfZiGhxOdcuDXSx' \
    --body '{"attributes": {"Sc3aZPV87pna08gx": {}, "efTYKhuxaEc7M4P7": {}, "UckSC6ePeN8i4GrF": {}}, "backfillTicketID": "ES9z7xueHpATHcce", "clientVersion": "e9GXhKcjmSEwdrkE", "deployment": "nnqKzFsLfYalUlfw", "fallbackClaimKeys": ["EQKjU7eHGebSVu0L", "Q40kepEaC4dfiOMZ", "fEhHr39pysFO3Zvc"], "inactiveTimeout": 56, "inviteTimeout": 73, "joinability": "G99LyvfvHEsJKQQe", "matchPool": "wVLMUoAnaRcYp7FU", "maxPlayers": 20, "minPlayers": 13, "preferredClaimKeys": ["fIGaffoflEIByYqe", "KN0meGelYF5wWaDh", "ukU4khGG4vZFTYnP"], "requestedRegions": ["kmSu4PWam1jxR7SE", "TWjteoc8fgvZDDho", "O05oKqymxLD1Lcvw"], "teams": [{"UserIDs": ["6T6mZEiwxxElpMYS", "WIeVzm7z9noowmlT", "IKVowi0RY2VN4ZON"], "parties": [{"partyID": "JREdUQ3z9F1BxNNg", "userIDs": ["nke4akncw7wu9TmX", "fJWBPrx9Ns8eLzYE", "vwSWTaLQjctvrK2j"]}, {"partyID": "hsYpKPlXn77AtYoF", "userIDs": ["zLAATPY8P8P3cfoi", "vvQxevecWw7Rry0K", "K5rgAGO0dW8rX2MV"]}, {"partyID": "UGKSZ4GcLkt4pK32", "userIDs": ["sJxlZcCTpTdRtCHv", "uk6B6XTmSLyn50si", "gBVZxiKdV57GvRyd"]}]}, {"UserIDs": ["9UuL02Le8HSCslsD", "d4M1F5qRIblS7Nz8", "1GRazPAANjfBoldF"], "parties": [{"partyID": "OyqA2clJ5gEOaCgM", "userIDs": ["6Yn6RugbNEIpGBFU", "jOn5mM7k8nbLzvtC", "IW5ynMKquUicAeIV"]}, {"partyID": "XtoWAXhMlW4tLqX7", "userIDs": ["OICf5oD1e6oI9FmY", "el0kOw72o8Zkgk0j", "S6rDWUwfhKvrf2Aa"]}, {"partyID": "H4yCWrHSppnIZkNn", "userIDs": ["Tn3rzH5NvAtcvNed", "gS1fUfKmihDbmu8e", "PWlQMVDXEHeiGTnw"]}]}, {"UserIDs": ["yEw6hIWDZrpP7rz3", "ISW510kHr4isTKWj", "mv67nuHCXWfwnwGi"], "parties": [{"partyID": "oVwVzmmBVVFfpqx1", "userIDs": ["AeLtzcPJ3jtDYBo4", "FUTH7CGfKSyxgRR1", "DiCqSMzpqIFGLkDs"]}, {"partyID": "7ACC1RgBfoNrHlFi", "userIDs": ["2qJLgmBLE35YhyiD", "V90SeI5yppBHoytV", "znCgNyx9fbT63ShE"]}, {"partyID": "h8PbGikLjgjcj34u", "userIDs": ["ulU6FYBZsWFbr3RS", "P0W9nBhvhf8Q0DtJ", "McYQdN66bswAgt65"]}]}], "ticketIDs": ["X4N1LQZmB61JMdtw", "CVUrYQue84dwmbwF", "EnAZaWsQJtRYoagR"], "tieTeamsSessionLifetime": true, "type": "K5PX9UcOvhPyE11T", "version": 89}' \
    > test.out 2>&1
eval_tap $? 47 'UpdateGameSession' test.out

#- 48 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cvWB28MpusuhhDJ5' \
    > test.out 2>&1
eval_tap $? 48 'DeleteGameSession' test.out

#- 49 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'slzgiWZEtyd56Lfx' \
    --body '{"attributes": {"nbY97jjYgXchCbkX": {}, "X26uEdCfQaMAQuTK": {}, "fC0I2kNjCMDtDMre": {}}, "backfillTicketID": "ntgn3DhqciwIeShF", "clientVersion": "9RKb9vvxuJlhXbWh", "deployment": "bwPwToC6knjVwVnz", "fallbackClaimKeys": ["aqSfJiQFC2gXoda0", "kg16yUSpSOAjHJWw", "fCjYwWkLob9gKLqs"], "inactiveTimeout": 83, "inviteTimeout": 27, "joinability": "tq6j1mqUav7k05HA", "matchPool": "QltnSojV4jT65ycl", "maxPlayers": 54, "minPlayers": 3, "preferredClaimKeys": ["FtAz0vJjFIYWOaNd", "simmkW2miH3xRHAK", "y4QxZkaXZ7vmiEd0"], "requestedRegions": ["JPxVyQpshaDwNqTb", "bFMXAMfVXe0GZeMg", "sRsmH1EQrYmkPKTP"], "teams": [{"UserIDs": ["OlhTtSiZNCxuogFt", "eTHJe4BhSSQkQD6W", "mOt6D7ufFVTOhvQp"], "parties": [{"partyID": "fbBke8aEdd36xj6w", "userIDs": ["ySoltDxsbzxrlaKE", "fkoYjY2o6ouRW9Ut", "NquwC3WgumrIz4Nh"]}, {"partyID": "GztZpr4U4fwQIiLX", "userIDs": ["gmRasvjO4lj8m3XE", "wP2b4gd3xOeii8Jn", "mssep2xD2NY0kABe"]}, {"partyID": "Gs9yxahld1pO0Gyf", "userIDs": ["5PO3COyMvczgEpzZ", "3FbtxfhcRC7IVYa6", "iZ5uFRYNn3SHiWxF"]}]}, {"UserIDs": ["0YbuU5ar5qTLWUCy", "0Afgc050XIZRW491", "e94mQjVOOBnIWhun"], "parties": [{"partyID": "ElqZUodp3IhtCSHy", "userIDs": ["1ei1fIrPvfHnRN06", "EjRwEQlNapJRfk4f", "9Zcw1pEHAyNFxcVT"]}, {"partyID": "KuAQTGh5BxjWOozG", "userIDs": ["oDtsUuYo5p8ED5QZ", "AufwNa8lzfjv9oYM", "XMjlVHY1AHwF3vGo"]}, {"partyID": "av7MK0PcLnEkcokK", "userIDs": ["wcQ0baDT9OyJ2h23", "GUS2amU7syGlElXd", "EAOrVSnLocLVVYam"]}]}, {"UserIDs": ["Qc4wcG5nDBLJoJHb", "iQ5duE5p4cfs2E41", "cK8QTwiIAvxSvNDl"], "parties": [{"partyID": "mM5nQFMGzs7fzjgy", "userIDs": ["c44mEh9tRk8knYSV", "30lnroQehMDli6t9", "unQLYXxm09wpGAbp"]}, {"partyID": "EmDY9vLh3u6EDsUm", "userIDs": ["rV6kH4OotKwG3UC6", "XCnnZxF8CmQr17W6", "5br34rBBN9tU6TDm"]}, {"partyID": "5GloFSKWM1eym5yd", "userIDs": ["C6p25xCWTqUOYZEN", "J1QHZQxPRXH7uxBJ", "EECQE1li3Bg7Jxc9"]}]}], "ticketIDs": ["pUnZmvhidwCkZwqj", "YLfTiCO1NDBvQvRP", "nAz4VzW0CpoBCbyJ"], "tieTeamsSessionLifetime": true, "type": "yWI8bp8fQxRuX91u", "version": 56}' \
    > test.out 2>&1
eval_tap $? 49 'PatchUpdateGameSession' test.out

#- 50 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mtrHJbEGTUj7YjER' \
    --body '{"backfillTicketID": "L1rEQG02zccA8wvL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateGameSessionBackfillTicketID' test.out

#- 51 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sWUNd6lPKvqDejvq' \
    > test.out 2>&1
eval_tap $? 51 'GameSessionGenerateCode' test.out

#- 52 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'klTSvDwuOrP9lzpi' \
    > test.out 2>&1
eval_tap $? 52 'PublicRevokeGameSessionCode' test.out

#- 53 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'X0VuFpZum7izxe7N' \
    --body '{"platformID": "PzjOa8E7wY76PxLv", "userID": "9HBEUe89AwEw1HO4"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGameSessionInvite' test.out

#- 54 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FnKtx4XLKAmlDr19' \
    > test.out 2>&1
eval_tap $? 54 'JoinGameSession' test.out

#- 55 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uJ3nq6VerzVCcI8y' \
    --body '{"leaderID": "3Cz0YqCKUh5RD9vN"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicPromoteGameSessionLeader' test.out

#- 56 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ap4jinFpnQ5xF9ww' \
    > test.out 2>&1
eval_tap $? 56 'LeaveGameSession' test.out

#- 57 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bvMZyeDeRnVfPUa6' \
    > test.out 2>&1
eval_tap $? 57 'PublicGameSessionReject' test.out

#- 58 GetSessionServerSecret
./ng net.accelbyte.sdk.cli.Main session getSessionServerSecret \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'xVVBcq3wZpFIYeAg' \
    > test.out 2>&1
eval_tap $? 58 'GetSessionServerSecret' test.out

#- 59 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '79HcLJXJ7mpVI6eT' \
    --body '{"additionalMembers": [{"partyID": "YAjdPlCiQQC35cj4", "userIDs": ["KyOVgvnWbfRJtsB7", "cUQZ2QUAxJrINPXp", "pPNO3AfmXcgwC3IN"]}, {"partyID": "6tvKgLB9QmJIOq9d", "userIDs": ["P5szG71utjsQ4CrR", "b9gUCeVz7fWbZIdh", "evfZvyV7AcodcZwK"]}, {"partyID": "jYDdmJOlzwm9Su4F", "userIDs": ["nS98QqftSjq7sn8y", "reciPLfkVyyJsbGp", "O6JgehDJxEN7JlZc"]}], "proposedTeams": [{"UserIDs": ["8LMq1o2jZWu4yA3r", "0u4q1bTHXIjfJKyF", "lM0u1uuoVdn9yVoS"], "parties": [{"partyID": "lKNchPHNL4X3LLaG", "userIDs": ["PGdqLE8SohhhuiTn", "JarYYkHBDdSzBXdx", "apwhd5IQYBQuxLvP"]}, {"partyID": "uWYvE3fsNy9Z9Ohx", "userIDs": ["XvCp9y7fLD2qfCXn", "lUnqxT1WsRNMZcA9", "2hzC7MNa8vVe4MHX"]}, {"partyID": "6AgMep90AyyUJyAK", "userIDs": ["5PRMRMwdvl0hv6g6", "2GxBW2tQF5tkTjgJ", "aMYvNQOsDa4bkcge"]}]}, {"UserIDs": ["pqtxjbrztee7QLTG", "Aak7Kaol01DK97D2", "xnik42miteR5eQAe"], "parties": [{"partyID": "1rzmmgqBPRmd6mO4", "userIDs": ["oI8KDqebm83raNBJ", "5y7axEkvI4oxZEDx", "GiBnNbn0zaf7CaOS"]}, {"partyID": "lHXrUSA6sMJzA5mt", "userIDs": ["qISQ83TTbtefXWzn", "De4LQdXfFBii2RAM", "EX5RMjBFVZGYzQqV"]}, {"partyID": "8d9mDdUIoiIJFNxu", "userIDs": ["NOmUSWw18T1IxVWC", "xdvPL9e4P01vxP8x", "j1LyEirURERnEMzp"]}]}, {"UserIDs": ["ImW6sjAHyCK5tNan", "GBrkzUvck3xTtmOF", "MebS4AdlNzwog2Ih"], "parties": [{"partyID": "ErkNhNcECWwchW6z", "userIDs": ["L9SkbLlrNXnGanMa", "zb8jvRWenURH48aJ", "uALEcSqcE15u6D31"]}, {"partyID": "DjOsrs3CUYATdqnQ", "userIDs": ["GbqiqOkNeATj7eGj", "odd7CcJUrI6MAugK", "5kypNrp2nFe9FmN8"]}, {"partyID": "6sK5LOq4ft5jGcMI", "userIDs": ["CPUYnfG6jl9U4jRe", "teIMgzISomCsodJr", "hQW41q2OspCZbt3U"]}]}], "version": 40}' \
    > test.out 2>&1
eval_tap $? 59 'AppendTeamGameSession' test.out

#- 60 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "XH8uenbC5CphgMwe"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicPartyJoinCode' test.out

#- 61 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'exsIAP5vHLjBJ9iq' \
    > test.out 2>&1
eval_tap $? 61 'PublicGetParty' test.out

#- 62 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'McBL4BzhDUjhKPwb' \
    --body '{"attributes": {"wcvQU5kG8bXGFmPA": {}, "nOkDiJq4xQye7Hqn": {}, "VK3YVeOWs9mfVQh3": {}}, "inactiveTimeout": 18, "inviteTimeout": 77, "joinability": "zifF8y959anrNSle", "maxPlayers": 49, "minPlayers": 47, "type": "CxyQrUpIFvORxTi7", "version": 100}' \
    > test.out 2>&1
eval_tap $? 62 'PublicUpdateParty' test.out

#- 63 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DpSjb39ukcR6c2E2' \
    --body '{"attributes": {"r3vk3IfAKEbqcNXS": {}, "GCCvNowNmdpcJgF8": {}, "8ySNq4Mj7mulP4tQ": {}}, "inactiveTimeout": 61, "inviteTimeout": 90, "joinability": "CGiXaLs2xjHkinOD", "maxPlayers": 12, "minPlayers": 87, "type": "5nARHCmhNHSXuqIH", "version": 38}' \
    > test.out 2>&1
eval_tap $? 63 'PublicPatchUpdateParty' test.out

#- 64 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '3ahvxw9gwwhTnjN6' \
    > test.out 2>&1
eval_tap $? 64 'PublicGeneratePartyCode' test.out

#- 65 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'wKZGW4y3f0R9s2kn' \
    > test.out 2>&1
eval_tap $? 65 'PublicRevokePartyCode' test.out

#- 66 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dhhZhwAiLsZs4pmL' \
    --body '{"platformID": "DIQch4IjDq9aT3qZ", "userID": "yI0rYsWucAkXsVJb"}' \
    > test.out 2>&1
eval_tap $? 66 'PublicPartyInvite' test.out

#- 67 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Xi7eRZa7WwIc895I' \
    --body '{"leaderID": "mqK6tVsaUq3stUh5"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicPromotePartyLeader' test.out

#- 68 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'J5Z9GiBiSAylX5cS' \
    > test.out 2>&1
eval_tap $? 68 'PublicPartyJoin' test.out

#- 69 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '0IeHpWCugmfOL0QQ' \
    > test.out 2>&1
eval_tap $? 69 'PublicPartyLeave' test.out

#- 70 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pxsuD8PGqku59eFJ' \
    > test.out 2>&1
eval_tap $? 70 'PublicPartyReject' test.out

#- 71 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rOXyDYz9vMUOPG0i' \
    --userId 'HDT8QbF7gHPTPQbv' \
    > test.out 2>&1
eval_tap $? 71 'PublicPartyKick' test.out

#- 72 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Lt2NRqJGIKzLyH1y": {}, "72L13Ornyx34luLd": {}, "vtsTKXMjiw6gYPvf": {}}, "configurationName": "n2Qt9iyq3Nyk8ncu", "inactiveTimeout": 75, "inviteTimeout": 17, "joinability": "3eDHH9WaVO4iKhDc", "maxPlayers": 73, "members": [{"ID": "2h61X9dN1MGRXBJ6", "PlatformID": "mVV7JS9qjNLwvI8J", "PlatformUserID": "diY3RRiLilmOGF6d"}, {"ID": "LLIeIVIjMcdlbdRX", "PlatformID": "TGIrdNL5gJPqTAjg", "PlatformUserID": "qaTHf1ANTJ9Yk997"}, {"ID": "XkGOdC6ItxDT8p4n", "PlatformID": "4XCFkD1AJLCwszbZ", "PlatformUserID": "xuHSgDOK8bjoF7bL"}], "minPlayers": 58, "textChat": true, "type": "KbtZTGJpqgl2IzNX"}' \
    > test.out 2>&1
eval_tap $? 72 'PublicCreateParty' test.out

#- 73 PublicGetRecentPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    > test.out 2>&1
eval_tap $? 73 'PublicGetRecentPlayer' test.out

#- 74 PublicGetRecentTeamPlayer
./ng net.accelbyte.sdk.cli.Main session publicGetRecentTeamPlayer \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 74 'PublicGetRecentTeamPlayer' test.out

#- 75 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TuQPIDpor7t1aJLN' \
    --body '{"Nz6QIVC9Mfuc8VOs": {}, "nmnlVljdWYmELe74": {}, "p38vumnxAnYBTxaT": {}}' \
    > test.out 2>&1
eval_tap $? 75 'PublicUpdateInsertSessionStorageLeader' test.out

#- 76 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Iz0jcgDI8Pkz96vd' \
    --userId '80msqIm5bufnBqrp' \
    --body '{"LeqhwVhjnnjKMEmt": {}, "biWsAQHbMrKYi0Zx": {}, "s5SWCqZXHLLa31oQ": {}}' \
    > test.out 2>&1
eval_tap $? 76 'PublicUpdateInsertSessionStorage' test.out

#- 77 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["f7BULnZDhutDM6Bq", "guqD5xxGxBWtnTKU", "e2znsqPzPkwCBo2S"]}' \
    > test.out 2>&1
eval_tap $? 77 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 78 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'PublicGetPlayerAttributes' test.out

#- 79 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "LC10ih2EQfY3XCv4", "data": {"hdOa6FdZhNMd1onF": {}, "jGRbxtABPXDmgNEJ": {}, "BhgGq5GIDhNC66sz": {}}, "platforms": [{"name": "bCCf73IFbRkPSSIT", "userID": "z4TjCrJHXGXku2YV"}, {"name": "uOzhxHmnrrV9ZGWr", "userID": "Z05sxe6A6RpmKDeb"}, {"name": "NkylbynkgT9vayLL", "userID": "iizac7Ge6zKJdlt7"}], "roles": ["rjF5RaJwvkWVco2L", "To5ijlvDF8qBWCQ9", "dLWYyS8zdhMeBXH8"], "simultaneousPlatform": "x6HdVfZVDAiU6iJO"}' \
    > test.out 2>&1
eval_tap $? 79 'PublicStorePlayerAttributes' test.out

#- 80 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'PublicDeletePlayerAttributes' test.out

#- 81 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'F7JKZFNk2NKy59X8' \
    --orderBy 'iOg2sVBiCoeC5weX' \
    --status 'Jl7PeiMH8z8dVej8' \
    > test.out 2>&1
eval_tap $? 81 'PublicQueryMyGameSessions' test.out

#- 82 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'N2yv6VTnOK7xAvM7' \
    --orderBy 'tuL81lsR7xxSVp3G' \
    --status 'd2TK0HzYviTgYmx8' \
    > test.out 2>&1
eval_tap $? 82 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE