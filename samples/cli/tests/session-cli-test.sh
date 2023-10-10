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
echo "1..67"

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

#- 6 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationAlertV1' test.out

#- 7 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 62}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationAlertV1' test.out

#- 8 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 39}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateConfigurationAlertV1' test.out

#- 9 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminDeleteConfigurationAlertV1' test.out

#- 10 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 55, "PSNSupportedPlatforms": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"], "SessionTitle": "n8mzZ0m8SAMTwE6I", "ShouldSync": true, "XboxServiceConfigID": "IaRDBXxyaNoMR6hk", "XboxSessionTemplateName": "spInrAip6lyzSxwE", "localizedSessionName": {"lFHHdgs21Jub74CU": {}, "kNmKJfh5pUkHODpo": {}, "MF78NY4YkHs1cnz1": {}}}, "PSNBaseUrl": "JSDgY1TXp38zsCTC", "autoJoin": true, "clientVersion": "cPiSuL0Sly6XM4OI", "deployment": "18mAQLnzjMf8GZ2W", "dsSource": "BZqxYG3aREAu2D6Q", "fallbackClaimKeys": ["VKNCWP75TB0i7pKx", "R8dl0zRVW4EZG9m0", "XcgGVbMqSszE8GHa"], "immutableStorage": true, "inactiveTimeout": 20, "inviteTimeout": 92, "joinability": "7AorKsxwkosAVerX", "maxActiveSessions": 31, "maxPlayers": 76, "minPlayers": 5, "name": "i5r6QEa1ysLEzth6", "persistent": false, "preferredClaimKeys": ["N9A3sNm84hddSpHt", "0P7MIIR7CkyF6C7d", "uuyZ0GhDogqrhBRd"], "requestedRegions": ["8lDR6qVNPRZYdFLI", "AjGGJddVCvu9vx5K", "Q7KYnIuMBvaO35ll"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "aT5kPxUfofvnnSuB"}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateConfigurationTemplateV1' test.out

#- 11 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --name 'y5WUlrMdI4sNveab' \
    --offset '26' \
    --order 'sKgnuRkgghGoYupD' \
    --orderBy '391C2qtPYokahFjk' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetAllConfigurationTemplatesV1' test.out

#- 12 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'QsfCaTmt1d67FXGk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetConfigurationTemplateV1' test.out

#- 13 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '2s9Q0mPVo3twu0Me' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 38, "PSNSupportedPlatforms": ["6I3lMjGSWN2laRlx", "fcjHfYakUCTqGkE7", "wcWfDslpJSqGAXQ0"], "SessionTitle": "yYoNRKd3IL5TAQ6i", "ShouldSync": false, "XboxServiceConfigID": "llG4cYEzfTD1ZBm3", "XboxSessionTemplateName": "MqHcUmLZZbSqb8Rw", "localizedSessionName": {"Nmn9HrNQy4uZAAiE": {}, "0mit9RGCCHYzUOcE": {}, "dscKHPEqgA8yu7Vk": {}}}, "PSNBaseUrl": "6Jt4Ymos9Jcdos4f", "autoJoin": true, "clientVersion": "cTVU6RBt0zYoMcHy", "deployment": "CUEXlAvxJMdalwSy", "dsSource": "liWMNW5NyLu0M3VH", "fallbackClaimKeys": ["h2EI8JlDbPWbQ6Q9", "lNmqRBaAkLnvxkT1", "X68cmDc3fxU8MyKr"], "immutableStorage": true, "inactiveTimeout": 44, "inviteTimeout": 80, "joinability": "52Dlym6puQ23xoJ8", "maxActiveSessions": 1, "maxPlayers": 33, "minPlayers": 9, "name": "mF51TkhjYnaq6foW", "persistent": true, "preferredClaimKeys": ["WIPUvmEejtGeoyIP", "a8ZRrvjj7il35MXb", "N9oCMNqq98SjTvhZ"], "requestedRegions": ["NkSQ70D0H6BXksUC", "9b6i5lZC9xv32e8c", "5csSovoqsZNBdte9"], "textChat": false, "tieTeamsSessionLifetime": true, "type": "APh1EThG96gAFKK2"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateConfigurationTemplateV1' test.out

#- 14 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'WDgCcxvONZm3EeER' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteConfigurationTemplateV1' test.out

#- 15 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetDSMCConfiguration' test.out

#- 16 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminSyncDSMCConfiguration' test.out

#- 17 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'mDnyeFoF7VSZ6pf3' \
    --dsPodName 'vneSD2Tb3g7mSQUh' \
    --fromTime 'AEtrmjqU6YE3p4lS' \
    --gameMode 'ck0ZHn5GI39YBHqa' \
    --isPersistent 'THeKtW18iGeUlc9d' \
    --isSoftDeleted '9sogWa24CKNS0GqV' \
    --joinability 'vUfHQvsHXNUNe4mh' \
    --limit '13' \
    --matchPool 'dN8S48l9lyNApflx' \
    --memberID 'qMrj3oZk03QXcKMD' \
    --offset '80' \
    --order 'DDxHSZjtqXyJ58f7' \
    --orderBy 'Gc26SaiGVkydwYWQ' \
    --sessionID 'G26yUZNmTBcvrbYC' \
    --status 'wZtxFHyPLtI8ilby' \
    --statusV2 'DPUIj88cekdqCt81' \
    --toTime 'P1ktfIovmv9gsR5c' \
    > test.out 2>&1
eval_tap $? 17 'AdminQueryGameSessions' test.out

#- 18 AdminQueryGameSessionsByAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessionsByAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"JcHm3SZLxoRDFuuu": {}, "ySj29a9LJE8HoRS1": {}, "X2PFAAMwzHPxB1Us": {}}' \
    > test.out 2>&1
eval_tap $? 18 'AdminQueryGameSessionsByAttributes' test.out

#- 19 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["kYs4Yw20DOqOBSC2", "DKHRuPMMWH8Yb33T", "5UBJCjfcnLRfxeCS"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeleteBulkGameSessions' test.out

#- 20 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'z9WEi8KlloeH0JT1' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'yduat2vQR3biBfsu' \
    --statusType '4jmsRE2w1yEkLgh3' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateGameSessionMember' test.out

#- 21 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'tIYt4SqYUTLDx9gI' \
    --key 'iDandpGT2t24aOMh' \
    --leaderID '5eC3IHeHSKLCa3xr' \
    --limit '8' \
    --memberID '7WIsfmx40NLRc6m8' \
    --memberStatus 'heKnWhzfe2NubeoK' \
    --offset '65' \
    --order 'dgLA84Z8YYk6QEgJ' \
    --orderBy 'jBbEDoNf3n0hEoRC' \
    --partyID 'Acf80zfFyabWAgIU' \
    --value 'XiI07A68eaqC2J9j' \
    > test.out 2>&1
eval_tap $? 21 'AdminQueryParties' test.out

#- 22 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetPlatformCredentials' test.out

#- 23 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "yEW6GLbc0NaKDUL3", "clientSecret": "sa13lk1dQBHO86Il", "scope": "BhnetU4RwTqUXlTD"}}' \
    > test.out 2>&1
eval_tap $? 23 'AdminUpdatePlatformCredentials' test.out

#- 24 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'AdminDeletePlatformCredentials' test.out

#- 25 AdminReadSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BzOuYsaZA2yyd4mb' \
    > test.out 2>&1
eval_tap $? 25 'AdminReadSessionStorage' test.out

#- 26 AdminDeleteUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminDeleteUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qoOfADMMAXFaY9eK' \
    > test.out 2>&1
eval_tap $? 26 'AdminDeleteUserSessionStorage' test.out

#- 27 AdminReadUserSessionStorage
./ng net.accelbyte.sdk.cli.Main session adminReadUserSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'a699bRVhyaKwwrAP' \
    --userId '2aMlu7WtjCtoYetO' \
    > test.out 2>&1
eval_tap $? 27 'AdminReadUserSessionStorage' test.out

#- 28 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'O847g8OudOfjnCuH' \
    > test.out 2>&1
eval_tap $? 28 'AdminQueryPlayerAttributes' test.out

#- 29 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z3c46IjGa23YvYmm' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetPlayerAttributes' test.out

#- 30 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Dg7VYPXIuvUYTZBR": {}, "ujIUE1Tq5jyAZvkR": {}, "CMNFIurjh2imdb4r": {}}, "autoJoin": false, "backfillTicketID": "OkAYfJB8AT9t4Tv2", "clientVersion": "07Y2QD3oD5fLCr3O", "configurationName": "OlXVv8ZGF7uYnGzp", "deployment": "ipNDigNJma1MbqqZ", "dsSource": "tfNWql4nmwAft4gq", "fallbackClaimKeys": ["kNNlWkD9eOziYRFO", "n0jJLHC9LxhvNXTw", "GBCtohLtl9Zuhytm"], "inactiveTimeout": 84, "inviteTimeout": 96, "joinability": "u64yAtURKLRkb738", "matchPool": "HGS6rDgMdIIlhS1f", "maxPlayers": 91, "minPlayers": 86, "preferredClaimKeys": ["iM9331m7Ta1PsKc5", "0Kv6ecnEevcAx2K2", "zkRenmPZnGBt4P7W"], "requestedRegions": ["nbdSJtjX7ZshZyZl", "5x4bRXBHUTrDzZSK", "scfOcYu3dpCROYqU"], "serverName": "iGKXVFCmpo6sPwVO", "teams": [{"UserIDs": ["EDSJsEK5QpNhlI2i", "S5EpGhhvXYck0upM", "zUYnb76tFkEORV3b"], "parties": [{"partyID": "u1bNCtX7W40V6Do5", "userIDs": ["sYadCCFrHHC3DpZx", "krQDXuNFviMarv8m", "nfHK8CCmE2lPnsbD"]}, {"partyID": "3SGEdlwuUccE536u", "userIDs": ["gBp3HBvepnDCjgyJ", "lXe36mgWjLfFmteu", "e9nzJ6fH24T805tV"]}, {"partyID": "g8JqU0jZpjvsugAO", "userIDs": ["S7u8RiWyerCSa8SR", "gwsAj1ik1jglaDXT", "vKCWwNTAhd2wrS0u"]}]}, {"UserIDs": ["Pdjhdinpng5BLy8w", "bhMssAHjapIkY9Rf", "4wP57dBZNR88YbCt"], "parties": [{"partyID": "mKy8M9zVrjfGXZnq", "userIDs": ["AQUoY1GjlIIk0iKo", "TTS1j02o7JjTXAQN", "0qdskdQV0TqI8EFn"]}, {"partyID": "mDbxIxi4YKlONk2Q", "userIDs": ["5Y4JvaizwiilatuU", "jjt9lIMGql5ElEa9", "EIIlGcHB3CfR3ncD"]}, {"partyID": "lwi3v3MFFJ1KesKo", "userIDs": ["ELCpobBEG8X645xp", "dXpai0rYaT5hOPja", "f3H0tYighU0VUfcY"]}]}, {"UserIDs": ["HJbBfAKSiPW3VgsZ", "XiR1DJ7HVWqMkNSa", "wQUWDFJvJBWic7Uk"], "parties": [{"partyID": "BeIXuqDuAXI66bQ7", "userIDs": ["1w0deoV9Lx5RDA1l", "2XcrciYNEzvSZIPk", "hSgORcz5S5BvmgBL"]}, {"partyID": "xh4ijFnE3Tam69qS", "userIDs": ["Z7PC6f6QkmZXElW9", "YfRSse6AAz3S4czz", "0QKFlAVmVLu4AOec"]}, {"partyID": "0z8eBeeoip68J1ns", "userIDs": ["v4W2OJhtafxMSJlH", "eb34sZKHcl5LLLOe", "xL4fZvWtND2tcBFp"]}]}], "textChat": true, "ticketIDs": ["lNtFEJ7tnkY6Mca5", "afj12K2IzrBvvWm4", "udE0OXudXgNne8kJ"], "tieTeamsSessionLifetime": true, "type": "pu1VCarzBsV6xnZ5"}' \
    > test.out 2>&1
eval_tap $? 30 'CreateGameSession' test.out

#- 31 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"Jrzzjrcaug6CWVG8": {}, "SWP3glU6muswVJnN": {}, "nN7kAa7j0riFc5HT": {}}' \
    > test.out 2>&1
eval_tap $? 31 'PublicQueryGameSessions' test.out

#- 32 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "HQIoVsGo7dwV9DBq"}' \
    > test.out 2>&1
eval_tap $? 32 'PublicSessionJoinCode' test.out

#- 33 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'FKHQkETJyTlUrwDT' \
    > test.out 2>&1
eval_tap $? 33 'GetGameSessionByPodName' test.out

#- 34 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'noujQD4IEiH9Z5qX' \
    > test.out 2>&1
eval_tap $? 34 'GetGameSession' test.out

#- 35 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'n3aoRtlqOECohViH' \
    --body '{"attributes": {"A5CzgFSy8X1A3PrI": {}, "fapq5AAeMe4L3mDW": {}, "ORBVXTIIJM9XsYII": {}}, "backfillTicketID": "ZxiXNMR9BgaWcFX3", "clientVersion": "SUBhyoTsMWPAxUMk", "deployment": "awaGpAyrIwMif3BO", "fallbackClaimKeys": ["dkocVTd4BxqGWV6m", "TJ0sQs6XNbjvqhnU", "VLWu8olKdxL6ozRm"], "inactiveTimeout": 61, "inviteTimeout": 100, "joinability": "D0jJvlfV5OemPYdY", "matchPool": "T7DROCjtuzFMbAG9", "maxPlayers": 75, "minPlayers": 71, "preferredClaimKeys": ["lpO2pqiXJF3WGRao", "QomSJC4DdrKF7SUQ", "PLG59e0k5ZtX6wK7"], "requestedRegions": ["PpUlcIW32iK7MGt1", "ixY5rA1WoVeJIePF", "8ZrQzP4zvtdxdbZU"], "teams": [{"UserIDs": ["pd6FJtHJ1pyVwyKQ", "LY6FEO65Rb3z7CYL", "M8IlsHqffnrfsGlf"], "parties": [{"partyID": "PaZKBwa3Ddb60ufP", "userIDs": ["pzwj1QGIFmlVf4jv", "apseE9LN9bvhOrHf", "lIOd6X3viLvtEk4m"]}, {"partyID": "TIpUA9gxo8SV38nE", "userIDs": ["hoXmM2W7l6jHMA2r", "G3nakopAywelu01n", "ryEJ0NqoTow0qiOi"]}, {"partyID": "C4j0iktm0ZPLkLOs", "userIDs": ["p0LZ5njN86Hl8kUX", "zt6bSc6bWvgpVyW9", "dD1kOmvrAejcq2Lg"]}]}, {"UserIDs": ["kQuaS7RBx3vim02j", "BOxrZDyvpcLYOWA8", "NjxOnaEok4nOOCzf"], "parties": [{"partyID": "sflhjbngJOUn18G5", "userIDs": ["MlfDTk8aG40Nlncc", "eIZSwgAIkgzh4pTU", "0Am4DZhl0bQxFJ3s"]}, {"partyID": "WCqQpQ2FbKPFMycM", "userIDs": ["SQ4qfAacR0LgB5BU", "Xvjcu2s6w3VifnKq", "mTSoGH1XEfY6QAYn"]}, {"partyID": "6WQ5UBEU1QAOHfZi", "userIDs": ["GhxOdcuDXSxSc3aZ", "PV87pna08gxefTYK", "huxaEc7M4P7UckSC"]}]}, {"UserIDs": ["6ePeN8i4GrFES9z7", "xueHpATHccee9GXh", "KcjmSEwdrkEnnqKz"], "parties": [{"partyID": "FsLfYalUlfwEQKjU", "userIDs": ["7eHGebSVu0LQ40ke", "pEaC4dfiOMZfEhHr", "39pysFO3Zvc1BZG9"]}, {"partyID": "9LyvfvHEsJKQQewV", "userIDs": ["LMUoAnaRcYp7FUjf", "IGaffoflEIByYqeK", "N0meGelYF5wWaDhu"]}, {"partyID": "kU4khGG4vZFTYnPk", "userIDs": ["mSu4PWam1jxR7SET", "Wjteoc8fgvZDDhoO", "05oKqymxLD1Lcvw6"]}]}], "ticketIDs": ["T6mZEiwxxElpMYSW", "IeVzm7z9noowmlTI", "KVowi0RY2VN4ZONJ"], "tieTeamsSessionLifetime": true, "type": "7l2Zsrh90ETtYmGu", "version": 20}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateGameSession' test.out

#- 36 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '4akncw7wu9TmXfJW' \
    > test.out 2>&1
eval_tap $? 36 'DeleteGameSession' test.out

#- 37 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BPrx9Ns8eLzYEvwS' \
    --body '{"attributes": {"WTaLQjctvrK2jhsY": {}, "pKPlXn77AtYoFzLA": {}, "ATPY8P8P3cfoivvQ": {}}, "backfillTicketID": "xevecWw7Rry0KK5r", "clientVersion": "gAGO0dW8rX2MVUGK", "deployment": "SZ4GcLkt4pK32sJx", "fallbackClaimKeys": ["lZcCTpTdRtCHvuk6", "B6XTmSLyn50sigBV", "ZxiKdV57GvRyd9Uu"], "inactiveTimeout": 76, "inviteTimeout": 77, "joinability": "02Le8HSCslsDd4M1", "matchPool": "F5qRIblS7Nz81GRa", "maxPlayers": 53, "minPlayers": 96, "preferredClaimKeys": ["PAANjfBoldFOyqA2", "clJ5gEOaCgM6Yn6R", "ugbNEIpGBFUjOn5m"], "requestedRegions": ["M7k8nbLzvtCIW5yn", "MKquUicAeIVXtoWA", "XhMlW4tLqX7OICf5"], "teams": [{"UserIDs": ["oD1e6oI9FmYel0kO", "w72o8Zkgk0jS6rDW", "UwfhKvrf2AaH4yCW"], "parties": [{"partyID": "rHSppnIZkNnTn3rz", "userIDs": ["H5NvAtcvNedgS1fU", "fKmihDbmu8ePWlQM", "VDXEHeiGTnwyEw6h"]}, {"partyID": "IWDZrpP7rz3ISW51", "userIDs": ["0kHr4isTKWjmv67n", "uHCXWfwnwGioVwVz", "mmBVVFfpqx1AeLtz"]}, {"partyID": "cPJ3jtDYBo4FUTH7", "userIDs": ["CGfKSyxgRR1DiCqS", "MzpqIFGLkDs7ACC1", "RgBfoNrHlFi2qJLg"]}]}, {"UserIDs": ["mBLE35YhyiDV90Se", "I5yppBHoytVznCgN", "yx9fbT63ShEh8PbG"], "parties": [{"partyID": "ikLjgjcj34uulU6F", "userIDs": ["YBZsWFbr3RSP0W9n", "Bhvhf8Q0DtJMcYQd", "N66bswAgt65X4N1L"]}, {"partyID": "QZmB61JMdtwCVUrY", "userIDs": ["Que84dwmbwFEnAZa", "WsQJtRYoagRJK5PX", "9UcOvhPyE11TRT2S"]}, {"partyID": "Kseoe8VLie0LBa36", "userIDs": ["KNzjf005CXNGehQ2", "aTjTDfKFDXC7eGL5", "YhJDWh9YWqc0qgV6"]}]}, {"UserIDs": ["d9yOfIMLds2DbPca", "oMdtRLTmSvTkQQgB", "7exYvmHMxr5hPCJJ"], "parties": [{"partyID": "ztJBg0tTJg46IewO", "userIDs": ["XE2AkCh3QIZsUf8l", "GFXcmwTERHclOdxI", "wqejxe18rNdb8Otq"]}, {"partyID": "6j1mqUav7k05HAQl", "userIDs": ["tnSojV4jT65yclX2", "FtAz0vJjFIYWOaNd", "simmkW2miH3xRHAK"]}, {"partyID": "y4QxZkaXZ7vmiEd0", "userIDs": ["JPxVyQpshaDwNqTb", "bFMXAMfVXe0GZeMg", "sRsmH1EQrYmkPKTP"]}]}], "ticketIDs": ["OlhTtSiZNCxuogFt", "eTHJe4BhSSQkQD6W", "mOt6D7ufFVTOhvQp"], "tieTeamsSessionLifetime": false, "type": "EQdf3ewoGGoY7xmF", "version": 80}' \
    > test.out 2>&1
eval_tap $? 37 'PatchUpdateGameSession' test.out

#- 38 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SoltDxsbzxrlaKEf' \
    --body '{"backfillTicketID": "koYjY2o6ouRW9UtN"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateGameSessionBackfillTicketID' test.out

#- 39 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'quwC3WgumrIz4NhG' \
    > test.out 2>&1
eval_tap $? 39 'GameSessionGenerateCode' test.out

#- 40 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ztZpr4U4fwQIiLXg' \
    > test.out 2>&1
eval_tap $? 40 'PublicRevokeGameSessionCode' test.out

#- 41 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mRasvjO4lj8m3XEw' \
    --body '{"platformID": "P2b4gd3xOeii8Jnm", "userID": "ssep2xD2NY0kABeG"}' \
    > test.out 2>&1
eval_tap $? 41 'PublicGameSessionInvite' test.out

#- 42 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 's9yxahld1pO0Gyf5' \
    > test.out 2>&1
eval_tap $? 42 'JoinGameSession' test.out

#- 43 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PO3COyMvczgEpzZ3' \
    --body '{"leaderID": "FbtxfhcRC7IVYa6i"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicPromoteGameSessionLeader' test.out

#- 44 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Z5uFRYNn3SHiWxF0' \
    > test.out 2>&1
eval_tap $? 44 'LeaveGameSession' test.out

#- 45 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YbuU5ar5qTLWUCy0' \
    > test.out 2>&1
eval_tap $? 45 'PublicGameSessionReject' test.out

#- 46 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Afgc050XIZRW491e' \
    --body '{"additionalMembers": [{"partyID": "94mQjVOOBnIWhunE", "userIDs": ["lqZUodp3IhtCSHy1", "ei1fIrPvfHnRN06E", "jRwEQlNapJRfk4f9"]}, {"partyID": "Zcw1pEHAyNFxcVTK", "userIDs": ["uAQTGh5BxjWOozGo", "DtsUuYo5p8ED5QZA", "ufwNa8lzfjv9oYMX"]}, {"partyID": "MjlVHY1AHwF3vGoa", "userIDs": ["v7MK0PcLnEkcokKw", "cQ0baDT9OyJ2h23G", "US2amU7syGlElXdE"]}], "proposedTeams": [{"UserIDs": ["AOrVSnLocLVVYamQ", "c4wcG5nDBLJoJHbi", "Q5duE5p4cfs2E41c"], "parties": [{"partyID": "K8QTwiIAvxSvNDlm", "userIDs": ["M5nQFMGzs7fzjgyc", "44mEh9tRk8knYSV3", "0lnroQehMDli6t9u"]}, {"partyID": "nQLYXxm09wpGAbpE", "userIDs": ["mDY9vLh3u6EDsUmr", "V6kH4OotKwG3UC6X", "CnnZxF8CmQr17W65"]}, {"partyID": "br34rBBN9tU6TDm5", "userIDs": ["GloFSKWM1eym5ydC", "6p25xCWTqUOYZENJ", "1QHZQxPRXH7uxBJE"]}]}, {"UserIDs": ["ECQE1li3Bg7Jxc9p", "UnZmvhidwCkZwqjY", "LfTiCO1NDBvQvRPn"], "parties": [{"partyID": "Az4VzW0CpoBCbyJs", "userIDs": ["F5IjF1c0W338HS6C", "BgVRyihYNZ84CVhz", "iXV8HwSmvcvcDKF1"]}, {"partyID": "9yVRafCjOuSYht83", "userIDs": ["AdvBaagTiRJ8daGT", "VX3Bb7jlz5IfHgKj", "I9mwJSrN8jkIykR2"]}, {"partyID": "zbaI6PD7fEscShnG", "userIDs": ["UGUtV9GJ279GDbLN", "wjm3FK0nnX2poMfZ", "1hDHtbh4HtMlFgvh"]}]}, {"UserIDs": ["2Dp2SoiIPp1yvfAH", "S0VgLu11A3HTovFi", "4tPAGfleyCA6jEtc"], "parties": [{"partyID": "qsnzoVILjkwW61du", "userIDs": ["F87aUyrdt4XSpWBA", "etsanzqP8oxfrtbE", "CD1CYPwaiBAxfYL8"]}, {"partyID": "Avt70ZUT2fSk3LL0", "userIDs": ["calqxEewuGS469k2", "hG0WKt4sUmanYxM0", "UHZVNYzGMNIpWoSL"]}, {"partyID": "kUrfuf4U3WeYeA9t", "userIDs": ["2ENKKWrFtHIi1CMg", "KAOG5iDcCR5PbCvD", "Lil8wj9cKM3Ar6MF"]}]}], "version": 82}' \
    > test.out 2>&1
eval_tap $? 46 'AppendTeamGameSession' test.out

#- 47 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "5hCER4nGmWGgTJfH"}' \
    > test.out 2>&1
eval_tap $? 47 'PublicPartyJoinCode' test.out

#- 48 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lJl4tHGa4XfZcd9C' \
    > test.out 2>&1
eval_tap $? 48 'PublicGetParty' test.out

#- 49 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VnGqMX9FieeEssWE' \
    --body '{"attributes": {"Ul07bhwntCVqiYOJ": {}, "f5KwMZQjzvjSozv6": {}, "CTRDl0zp9CzHFwin": {}}, "inactiveTimeout": 22, "inviteTimeout": 0, "joinability": "BNi4gvqgl6TZ9TGV", "maxPlayers": 85, "minPlayers": 46, "type": "mv34h6T7EsufmfxK", "version": 45}' \
    > test.out 2>&1
eval_tap $? 49 'PublicUpdateParty' test.out

#- 50 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'B4LM6H6QXmpZ9X3f' \
    --body '{"attributes": {"USR1l9xLPBsmAUrD": {}, "9L1IiD6MlcEPhMDF": {}, "zjHZ3sIhzOx2CXKl": {}}, "inactiveTimeout": 44, "inviteTimeout": 9, "joinability": "IomU3pIxM9n8D2eL", "maxPlayers": 78, "minPlayers": 79, "type": "e3lt9qfx2UDcgVE7", "version": 76}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPatchUpdateParty' test.out

#- 51 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tQF5tkTjgJaMYvNQ' \
    > test.out 2>&1
eval_tap $? 51 'PublicGeneratePartyCode' test.out

#- 52 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OsDa4bkcgepqtxjb' \
    > test.out 2>&1
eval_tap $? 52 'PublicRevokePartyCode' test.out

#- 53 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'rztee7QLTGAak7Ka' \
    --body '{"platformID": "ol01DK97D2xnik42", "userID": "miteR5eQAe1rzmmg"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicPartyInvite' test.out

#- 54 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qBPRmd6mO4oI8KDq' \
    --body '{"leaderID": "ebm83raNBJ5y7axE"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicPromotePartyLeader' test.out

#- 55 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'kvI4oxZEDxGiBnNb' \
    > test.out 2>&1
eval_tap $? 55 'PublicPartyJoin' test.out

#- 56 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'n0zaf7CaOSlHXrUS' \
    > test.out 2>&1
eval_tap $? 56 'PublicPartyLeave' test.out

#- 57 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'A6sMJzA5mtqISQ83' \
    > test.out 2>&1
eval_tap $? 57 'PublicPartyReject' test.out

#- 58 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'TTbtefXWznDe4LQd' \
    --userId 'XfFBii2RAMEX5RMj' \
    > test.out 2>&1
eval_tap $? 58 'PublicPartyKick' test.out

#- 59 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"BFVZGYzQqV8d9mDd": {}, "UIoiIJFNxuNOmUSW": {}, "w18T1IxVWCxdvPL9": {}}, "configurationName": "e4P01vxP8xj1LyEi", "inactiveTimeout": 37, "inviteTimeout": 17, "joinability": "URERnEMzpImW6sjA", "maxPlayers": 69, "members": [{"ID": "sX1jorcyR0x3YiHF", "PlatformID": "8ITGPRQBCgIs1Q2l", "PlatformUserID": "zxl0yF5m77TTh4gU"}, {"ID": "oj8u2WRcLiEtzVln", "PlatformID": "kflfn7pHY48F1dl1", "PlatformUserID": "q92m3iRlfnBAk0Cw"}, {"ID": "iAsR65yQ9ssuHdGm", "PlatformID": "xncCEr0KcgeqzGbr", "PlatformUserID": "uNB72HHMkjzyBB4U"}], "minPlayers": 64, "textChat": true, "type": "KiaoV0VOem2yqPsM"}' \
    > test.out 2>&1
eval_tap $? 59 'PublicCreateParty' test.out

#- 60 PublicUpdateInsertSessionStorageLeader
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorageLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FxKybPkbuS6x9cLJ' \
    --body '{"1APnNlsa2bRBr27f": {}, "VMWuAfDqLMR919IZ": {}, "PKOKiAVQXXOmqFHL": {}}' \
    > test.out 2>&1
eval_tap $? 60 'PublicUpdateInsertSessionStorageLeader' test.out

#- 61 PublicUpdateInsertSessionStorage
./ng net.accelbyte.sdk.cli.Main session publicUpdateInsertSessionStorage \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'byXmgCNiXH8uenbC' \
    --userId '5CphgMweexsIAP5v' \
    --body '{"HLjBJ9iqMcBL4Bzh": {}, "DUjhKPwbwcvQU5kG": {}, "8bXGFmPAnOkDiJq4": {}}' \
    > test.out 2>&1
eval_tap $? 61 'PublicUpdateInsertSessionStorage' test.out

#- 62 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["xQye7HqnVK3YVeOW", "s9mfVQh3jLBtn9px", "pE7BYtzB0B4CxyQr"]}' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 63 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'PublicGetPlayerAttributes' test.out

#- 64 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "IKWVZ77KeRWdECaF", "data": {"GzfZ2hxcJ2Fnemn7": {}, "M23SzUo4hNBDh9ZF": {}, "P1OW0nXOErQPS4Vs": {}}, "platforms": [{"name": "RoYIK69yg9ADCGiX", "userID": "aLs2xjHkinOD975n"}, {"name": "ARHCmhNHSXuqIHsx", "userID": "vaUoXDmwWsukxncu"}, {"name": "D3QxCXMd00YBWCaV", "userID": "VmM45mfIZsWhkS47"}], "roles": ["6dGGJwJ00UH197MJ", "6zU7JLMQyMWzYQCA", "aPJgoxGJoJaSzUtY"]}' \
    > test.out 2>&1
eval_tap $? 64 'PublicStorePlayerAttributes' test.out

#- 65 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'PublicDeletePlayerAttributes' test.out

#- 66 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '4ZD0Xtb0U4pH16NU' \
    --orderBy 'sVY21NVIs7NRen2Y' \
    --status '3Ns0QJQeaWytPfds' \
    > test.out 2>&1
eval_tap $? 66 'PublicQueryMyGameSessions' test.out

#- 67 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '1BYx0EaURydf8Zyy' \
    --orderBy 'ZeHAWGgJUbUJRMbk' \
    --status 'cTglbU86FyOjApNH' \
    > test.out 2>&1
eval_tap $? 67 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE