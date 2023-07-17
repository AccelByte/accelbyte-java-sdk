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
echo "1..60"

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

#- 5 AdminGetConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetConfigurationAlertV1' test.out

#- 6 AdminUpdateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 62}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateConfigurationAlertV1' test.out

#- 7 AdminCreateConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"durationDays": 39}' \
    > test.out 2>&1
eval_tap $? 7 'AdminCreateConfigurationAlertV1' test.out

#- 8 AdminDeleteConfigurationAlertV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationAlertV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationAlertV1' test.out

#- 9 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 55, "PSNSupportedPlatforms": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"], "SessionTitle": "n8mzZ0m8SAMTwE6I", "ShouldSync": true, "XboxServiceConfigID": "IaRDBXxyaNoMR6hk", "XboxSessionTemplateName": "spInrAip6lyzSxwE", "localizedSessionName": {"lFHHdgs21Jub74CU": {}, "kNmKJfh5pUkHODpo": {}, "MF78NY4YkHs1cnz1": {}}}, "PSNBaseUrl": "JSDgY1TXp38zsCTC", "autoJoin": true, "clientVersion": "cPiSuL0Sly6XM4OI", "deployment": "18mAQLnzjMf8GZ2W", "dsSource": "BZqxYG3aREAu2D6Q", "fallbackClaimKeys": ["VKNCWP75TB0i7pKx", "R8dl0zRVW4EZG9m0", "XcgGVbMqSszE8GHa"], "inactiveTimeout": 43, "inviteTimeout": 20, "joinability": "SdAdIhUDrwoZ5Mec", "maxActiveSessions": 7, "maxPlayers": 31, "minPlayers": 76, "name": "c1C8XfwHuKeb9l3r", "persistent": false, "preferredClaimKeys": ["N9A3sNm84hddSpHt", "0P7MIIR7CkyF6C7d", "uuyZ0GhDogqrhBRd"], "requestedRegions": ["8lDR6qVNPRZYdFLI", "AjGGJddVCvu9vx5K", "Q7KYnIuMBvaO35ll"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "aT5kPxUfofvnnSuB"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateConfigurationTemplateV1' test.out

#- 10 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --name 'y5WUlrMdI4sNveab' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetAllConfigurationTemplatesV1' test.out

#- 11 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'sKgnuRkgghGoYupD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetConfigurationTemplateV1' test.out

#- 12 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '391C2qtPYokahFjk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 87, "PSNSupportedPlatforms": ["LtjQHAf8TgoNm03V", "LisV6zwPuo3td6TC", "6I3lMjGSWN2laRlx"], "SessionTitle": "fcjHfYakUCTqGkE7", "ShouldSync": true, "XboxServiceConfigID": "z1UaLqYSYWytLPzi", "XboxSessionTemplateName": "ZMdjxcBZufQxGiHP", "localizedSessionName": {"llG4cYEzfTD1ZBm3": {}, "MqHcUmLZZbSqb8Rw": {}, "Nmn9HrNQy4uZAAiE": {}}}, "PSNBaseUrl": "0mit9RGCCHYzUOcE", "autoJoin": false, "clientVersion": "zWi9gwQYv7t1o7TT", "deployment": "r1DmrhZv15T7quIO", "dsSource": "vBMcaYmvCkGZ5dAg", "fallbackClaimKeys": ["qxpBFmaLoxozr6wf", "NPX2bOItRMvqtlB2", "jJCSQT279ZZPYGu0"], "inactiveTimeout": 37, "inviteTimeout": 24, "joinability": "dlgdWyOtXi3choQr", "maxActiveSessions": 31, "maxPlayers": 84, "minPlayers": 38, "name": "cmDc3fxU8MyKrQpM", "persistent": false, "preferredClaimKeys": ["Dlym6puQ23xoJ8ae", "CnaLpUKp44YUDjas", "WIPUvmEejtGeoyIP"], "requestedRegions": ["a8ZRrvjj7il35MXb", "N9oCMNqq98SjTvhZ", "NkSQ70D0H6BXksUC"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "z1x3poD3Qgb3boLQ"}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationTemplateV1' test.out

#- 13 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'Q1MzH7Qm8bwbmXgd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteConfigurationTemplateV1' test.out

#- 14 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminGetDSMCConfiguration' test.out

#- 15 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminSyncDSMCConfiguration' test.out

#- 16 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'APh1EThG96gAFKK2' \
    --dsPodName 'WDgCcxvONZm3EeER' \
    --fromTime 'mDnyeFoF7VSZ6pf3' \
    --gameMode 'vneSD2Tb3g7mSQUh' \
    --isPersistent 'AEtrmjqU6YE3p4lS' \
    --isSoftDeleted 'ck0ZHn5GI39YBHqa' \
    --joinability 'THeKtW18iGeUlc9d' \
    --limit '5' \
    --matchPool 'sogWa24CKNS0GqVv' \
    --memberID 'UfHQvsHXNUNe4mhg' \
    --offset '30' \
    --order 'N8S48l9lyNApflxq' \
    --orderBy 'Mrj3oZk03QXcKMDY' \
    --sessionID 'DDxHSZjtqXyJ58f7' \
    --status 'Gc26SaiGVkydwYWQ' \
    --statusV2 'G26yUZNmTBcvrbYC' \
    --toTime 'wZtxFHyPLtI8ilby' \
    > test.out 2>&1
eval_tap $? 16 'AdminQueryGameSessions' test.out

#- 17 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["DPUIj88cekdqCt81", "P1ktfIovmv9gsR5c", "JcHm3SZLxoRDFuuu"]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteBulkGameSessions' test.out

#- 18 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'ySj29a9LJE8HoRS1' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'X2PFAAMwzHPxB1Us' \
    --statusType 'kYs4Yw20DOqOBSC2' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateGameSessionMember' test.out

#- 19 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'DKHRuPMMWH8Yb33T' \
    --key '5UBJCjfcnLRfxeCS' \
    --leaderID 'z9WEi8KlloeH0JT1' \
    --limit '51' \
    --memberID 'm5T50x9WT0GfH2rt' \
    --memberStatus 'Oa4EXsXzOXQAk4mq' \
    --offset '37' \
    --order 'IYt4SqYUTLDx9gIi' \
    --orderBy 'DandpGT2t24aOMh5' \
    --partyID 'eC3IHeHSKLCa3xre' \
    --value 'NDUWehwH3q31A806' \
    > test.out 2>&1
eval_tap $? 19 'AdminQueryParties' test.out

#- 20 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminGetPlatformCredentials' test.out

#- 21 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "DJgas4b6z3LNUj7f", "clientSecret": "dgLA84Z8YYk6QEgJ", "scope": "jBbEDoNf3n0hEoRC"}}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdatePlatformCredentials' test.out

#- 22 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminDeletePlatformCredentials' test.out

#- 23 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'Acf80zfFyabWAgIU' \
    > test.out 2>&1
eval_tap $? 23 'AdminQueryPlayerAttributes' test.out

#- 24 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'XiI07A68eaqC2J9j' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetPlayerAttributes' test.out

#- 25 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"yEW6GLbc0NaKDUL3": {}, "sa13lk1dQBHO86Il": {}, "BhnetU4RwTqUXlTD": {}}, "autoJoin": true, "backfillTicketID": "3FgkXhjDzaQY3snn", "clientVersion": "2ZkP7cFdP43e5dC9", "configurationName": "XIBudfZgrbHDIDm4", "deployment": "hMzF4TxodenSrUTv", "dsSource": "fqU0bfoMm5cTtFWb", "fallbackClaimKeys": ["otQyXJRcQWsmqPNs", "92epxk0i8VxsZNer", "eSvf9699mCEHThUJ"], "inactiveTimeout": 22, "inviteTimeout": 79, "joinability": "ETAsSp7gh4TeUTkO", "matchPool": "kAYfJB8AT9t4Tv20", "maxPlayers": 91, "minPlayers": 85, "preferredClaimKeys": ["2QD3oD5fLCr3OOlX", "Vv8ZGF7uYnGzpipN", "DigNJma1MbqqZtfN"], "requestedRegions": ["Wql4nmwAft4gqkNN", "lWkD9eOziYRFOn0j", "JLHC9LxhvNXTwGBC"], "serverName": "tohLtl9Zuhytm5UD", "teams": [{"UserIDs": ["rT6QXCs5SPBbRPZT", "F6oQAXVG7tnsZg5Q", "gXjvyGJPN4eXbJE5"], "parties": [{"partyID": "Vs2GcyomQoIXimBJ", "userIDs": ["ehyxlNsjUgxBkF6w", "FPoJeQediogEhhM2", "rIizGdKvOPdq5xrg"]}, {"partyID": "xSmy1DN9LFkYW5DQ", "userIDs": ["yj4bj5Ro2ogaKt2u", "jQSa3Zdb65UXmy0Z", "p6iIaTIKUkmkk9QM"]}, {"partyID": "0NBMA9ORxpzwLR2A", "userIDs": ["K6eXUGPJsw1fiP80", "G9Pclxcft2ulIJzP", "yrVEiOG4UcqsuGKH"]}]}, {"UserIDs": ["hMRWLVd3DlhLuIpo", "mM8sm1MiaI1mX2tJ", "oARtdbBe7udsMrok"], "parties": [{"partyID": "0WvGYYnx4V709xbn", "userIDs": ["GezKsDwG2omOR2nv", "YI9TVqJdvzcWbfUp", "aXp5JMl5LL4bTxBm"]}, {"partyID": "ZjdrrIxsB0NRsB1f", "userIDs": ["PqqRRulpqpymDkQh", "trHWwRVnwVBOqOHi", "8pWGd1juYhiqjRJO"]}, {"partyID": "qB5F93zFQbJndUDp", "userIDs": ["dONneAczbBdHb2sl", "t71B1SmZp2JZp50C", "nPb71ORYcmQbTU5J"]}]}, {"UserIDs": ["X8ccLjMXJRk0eaKQ", "DOJvrTefglSs6g4i", "Y9u02aCNYIWekp18"], "parties": [{"partyID": "lOC3mNqF7Bl0Lcgh", "userIDs": ["VHfPEspxwhRON0bc", "1eMbEIjowLqc3ecj", "XJbZDKKoxLE1Y3Dy"]}, {"partyID": "mtj3giPg4x4yiPX6", "userIDs": ["ues1Hhhkg1yLVbLF", "zHEP8cM4NTwr0KHa", "AsmTej52WKi6tArA"]}, {"partyID": "URt9plCSVq8PdH6h", "userIDs": ["JPUAc0RVwXgAgntL", "MCuaXBWQi6BqPg4x", "r0lCancUZGCHsZYo"]}]}], "textChat": false, "ticketIDs": ["gORcz5S5BvmgBLxh", "4ijFnE3Tam69qSZ7", "PC6f6QkmZXElW9Yf"], "tieTeamsSessionLifetime": true, "type": "u3pDMUAeeZ97SBRO"}' \
    > test.out 2>&1
eval_tap $? 25 'CreateGameSession' test.out

#- 26 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"PYuG6XqP6oo7G73z": {}, "dxTgOfnwIdlNa29f": {}, "DLh741IslKHzGlLK": {}}' \
    > test.out 2>&1
eval_tap $? 26 'PublicQueryGameSessions' test.out

#- 27 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "WUtDQs61OQAoxyyQ"}' \
    > test.out 2>&1
eval_tap $? 27 'PublicSessionJoinCode' test.out

#- 28 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'pRWCiiPDGQhNPEwi' \
    > test.out 2>&1
eval_tap $? 28 'GetGameSessionByPodName' test.out

#- 29 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'JCf2XJVrlzqQls1o' \
    > test.out 2>&1
eval_tap $? 29 'GetGameSession' test.out

#- 30 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'zhLVA3kE8jKvgatO' \
    --body '{"attributes": {"EBM70TdlNBJYOmpu": {}, "1VCarzBsV6xnZ5Jr": {}, "zzjrcaug6CWVG8SW": {}}, "backfillTicketID": "P3glU6muswVJnNnN", "clientVersion": "7kAa7j0riFc5HTHQ", "deployment": "IoVsGo7dwV9DBqFK", "fallbackClaimKeys": ["HQkETJyTlUrwDTno", "ujQD4IEiH9Z5qXn3", "aoRtlqOECohViHA5"], "inactiveTimeout": 59, "inviteTimeout": 43, "joinability": "zgFSy8X1A3PrIfap", "matchPool": "q5AAeMe4L3mDWORB", "maxPlayers": 98, "minPlayers": 58, "preferredClaimKeys": ["XTIIJM9XsYIIZxiX", "NMR9BgaWcFX3SUBh", "yoTsMWPAxUMkawaG"], "requestedRegions": ["pAyrIwMif3BOdkoc", "VTd4BxqGWV6mTJ0s", "Qs6XNbjvqhnUVLWu"], "teams": [{"UserIDs": ["8olKdxL6ozRmDD0j", "JvlfV5OemPYdYT7D", "ROCjtuzFMbAG9YI8"], "parties": [{"partyID": "9hmguB8FOTjMLo4b", "userIDs": ["9rIzqYkEpstyVTBc", "rM8rG0rH0zcswwVe", "MK6MbGIVIu8vvwLc"]}, {"partyID": "7KY3uVoJXTIMtpgk", "userIDs": ["ieDyF97lGdMiHKxb", "WCYzo8yO2KTK9tmm", "OnYnOpas6ghP1y4Z"]}, {"partyID": "i7s7QBlk44Z44B1G", "userIDs": ["ZgKg4uKxaCgcGLuC", "3brWdTYCfHkIySok", "5DiXZtLW87rGysry"]}]}, {"UserIDs": ["od3dNQrmsApRA6HX", "3RwrKt2ecozL0TOg", "54vCE48L5oLF6M4l"], "parties": [{"partyID": "Na4JUMSHNgqRqCV7", "userIDs": ["usamANkZlOX9Sfo9", "5HgXqKhTPkwfLM9u", "SybRzWek2gZvRrvr"]}, {"partyID": "0n9d9lvccKMLhrTr", "userIDs": ["cBE2ItBS3KtKZWe8", "aoFzAyBME74HUtip", "UWYhWV1qx8CzPML5"]}, {"partyID": "2faXUr9Sk4lq2faB", "userIDs": ["cAXXKlhvyH8paOJt", "xqMPpcVfRwNj547f", "H0XrKEDpEY8VnocG"]}]}, {"UserIDs": ["Ajci0V3tBf2jnHGK", "Xphn50c9tNLDljhZ", "2jxLRX3z46OCaGBe"], "parties": [{"partyID": "MfPlNos4yBRjrERH", "userIDs": ["EonAZR8GmEu0q1p6", "QCyY6vSkVFWdsbYu", "VEGVxYheR3j5mNZ6"]}, {"partyID": "vwv7K8Asvt1j1Rx5", "userIDs": ["9hesNWy2NvZ85DDK", "DAF8KDsBZOuYQJ03", "BAHZ7c53q7akMpcm"]}, {"partyID": "nnx6RVBrop9v7aZK", "userIDs": ["3h65hbN15zfQSfQr", "tfF3TQN0OcNDLr36", "vzohZyjMQAg5mPYh"]}]}], "ticketIDs": ["rLTyU8OhgfY9JQYG", "F4bYXEcENx9xZlAc", "hob44lONDDwMvgI0"], "tieTeamsSessionLifetime": false, "type": "lyPR7wZNiVsF6xG2", "version": 26}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateGameSession' test.out

#- 31 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eGelYF5wWaDhukU4' \
    > test.out 2>&1
eval_tap $? 31 'DeleteGameSession' test.out

#- 32 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'khGG4vZFTYnPkmSu' \
    --body '{"attributes": {"4PWam1jxR7SETWjt": {}, "eoc8fgvZDDhoO05o": {}, "KqymxLD1Lcvw6T6m": {}}, "backfillTicketID": "ZEiwxxElpMYSWIeV", "clientVersion": "zm7z9noowmlTIKVo", "deployment": "wi0RY2VN4ZONJREd", "fallbackClaimKeys": ["UQ3z9F1BxNNgnke4", "akncw7wu9TmXfJWB", "Prx9Ns8eLzYEvwSW"], "inactiveTimeout": 94, "inviteTimeout": 6, "joinability": "aLQjctvrK2jhsYpK", "matchPool": "PlXn77AtYoFzLAAT", "maxPlayers": 86, "minPlayers": 88, "preferredClaimKeys": ["Y8P8P3cfoivvQxev", "ecWw7Rry0KK5rgAG", "O0dW8rX2MVUGKSZ4"], "requestedRegions": ["GcLkt4pK32sJxlZc", "CTpTdRtCHvuk6B6X", "TmSLyn50sigBVZxi"], "teams": [{"UserIDs": ["KdV57GvRyd9UuL02", "Le8HSCslsDd4M1F5", "qRIblS7Nz81GRazP"], "parties": [{"partyID": "AANjfBoldFOyqA2c", "userIDs": ["lJ5gEOaCgM6Yn6Ru", "gbNEIpGBFUjOn5mM", "7k8nbLzvtCIW5ynM"]}, {"partyID": "KquUicAeIVXtoWAX", "userIDs": ["hMlW4tLqX7OICf5o", "D1e6oI9FmYel0kOw", "72o8Zkgk0jS6rDWU"]}, {"partyID": "wfhKvrf2AaH4yCWr", "userIDs": ["HSppnIZkNnTn3rzH", "5NvAtcvNedgS1fUf", "KmihDbmu8ePWlQMV"]}]}, {"UserIDs": ["DXEHeiGTnwyEw6hI", "WDZrpP7rz3ISW510", "kHr4isTKWjmv67nu"], "parties": [{"partyID": "HCXWfwnwGioVwVzm", "userIDs": ["mBVVFfpqx1AeLtzc", "PJ3jtDYBo4FUTH7C", "GfKSyxgRR1DiCqSM"]}, {"partyID": "zpqIFGLkDs7ACC1R", "userIDs": ["gBfoNrHlFi2qJLgm", "BLE35YhyiDV90SeI", "5yppBHoytVznCgNy"]}, {"partyID": "x9fbT63ShEh8PbGi", "userIDs": ["kLjgjcj34uulU6FY", "BZsWFbr3RSP0W9nB", "hvhf8Q0DtJMcYQdN"]}]}, {"UserIDs": ["66bswAgt65X4N1LQ", "ZmB61JMdtwCVUrYQ", "ue84dwmbwFEnAZaW"], "parties": [{"partyID": "sQJtRYoagRJK5PX9", "userIDs": ["UcOvhPyE11TRT2SK", "seoe8VLie0LBa36K", "Nzjf005CXNGehQ2a"]}, {"partyID": "TjTDfKFDXC7eGL5Y", "userIDs": ["hJDWh9YWqc0qgV6d", "9yOfIMLds2DbPcao", "MdtRLTmSvTkQQgB7"]}, {"partyID": "exYvmHMxr5hPCJJz", "userIDs": ["tJBg0tTJg46IewOX", "E2AkCh3QIZsUf8lG", "FXcmwTERHclOdxIw"]}]}], "ticketIDs": ["qejxe18rNdb8Otq6", "j1mqUav7k05HAQlt", "nSojV4jT65yclX2F"], "tieTeamsSessionLifetime": true, "type": "ptKaWNvPbpg7yrRv", "version": 24}' \
    > test.out 2>&1
eval_tap $? 32 'PatchUpdateGameSession' test.out

#- 33 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fZ6rvgvEY3Hht1Sw' \
    --body '{"backfillTicketID": "qTsKKKo37NHDOQe9"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGameSessionBackfillTicketID' test.out

#- 34 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '1Ps3ztUIV0dS6hIH' \
    > test.out 2>&1
eval_tap $? 34 'GameSessionGenerateCode' test.out

#- 35 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '9c4VfkyrwpuXxbaE' \
    > test.out 2>&1
eval_tap $? 35 'PublicRevokeGameSessionCode' test.out

#- 36 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'RbfgPmi0eHkt1mr9' \
    --body '{"platformID": "EOIFg0dnWIYN2NVL", "userID": "70Iw157g00jr9b8M"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicGameSessionInvite' test.out

#- 37 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'uYmmeKTmBNvGYxEQ' \
    > test.out 2>&1
eval_tap $? 37 'JoinGameSession' test.out

#- 38 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'df3ewoGGoY7xmFNA' \
    --body '{"leaderID": "mjDDCvs78mcMdiS7"}' \
    > test.out 2>&1
eval_tap $? 38 'PublicPromoteGameSessionLeader' test.out

#- 39 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6YApGJ9ufwLYkqIg' \
    > test.out 2>&1
eval_tap $? 39 'LeaveGameSession' test.out

#- 40 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LuZS6hsQryiEtOAb' \
    > test.out 2>&1
eval_tap $? 40 'PublicGameSessionReject' test.out

#- 41 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'peUNf26UqkCfgCUY' \
    --body '{"additionalMembers": [{"partyID": "Bn2xaOBdPF0JmX8q", "userIDs": ["wU1cTuHHPB5S3DvP", "RCzBrVUxmDOj3cvR", "FaTC11W0TGTCm4fZ"]}, {"partyID": "Wuk6pQxDQpKqxLGe", "userIDs": ["Mvr9TsvcMQ7dBsaI", "ecRxIsZvD6rmzVr5", "XT1Nxw0v1dMQ9Rrb"]}, {"partyID": "k6C2cVWf6ttvbU1P", "userIDs": ["O6ApCD2VXidT7w0O", "c15N8WXBPp17PAew", "qSm5x3B4t7WQnp8j"]}], "proposedTeams": [{"UserIDs": ["XZedgt5cyNe27HLt", "wtVOaxgP6Jbct8pu", "MybYGxD9IPmmsLmu"], "parties": [{"partyID": "3kaPj0O4zd8Tb7cU", "userIDs": ["NGPTBxiFFCrn7djj", "s69FTFVGUVhvKhJC", "meisql14mUHVbMPi"]}, {"partyID": "mNhcZsU3VAdMDcb4", "userIDs": ["qlkiFAamqvZI2Kwj", "qPBiWXade41s3rH3", "4mB2yPlRpWjmHZAA"]}, {"partyID": "vKTH8MuqIg0Czkgu", "userIDs": ["wuJCW7EEFB67AODb", "i9BzupBsFpYc77Gt", "RUcCFeY5g4XgBsbf"]}]}, {"UserIDs": ["zqxBPNe8ae1Il4aA", "tEbu4IjGdqthRxTj", "Q7gkZEY8rG0q0Q2Q"], "parties": [{"partyID": "d2JzRbkF2I03dIjv", "userIDs": ["BbA6bfbYaJCJjfk2", "TUvn95FhO7VW3mbD", "VMDu87t0ldWf7iSG"]}, {"partyID": "IiKFtWtn4Yr2svKM", "userIDs": ["6pqLGZ0TBujELAUK", "6mQ5iZgbwwm5iGzX", "tcknrgidKupvXO6a"]}, {"partyID": "j4hCmTC34jxW4pID", "userIDs": ["wdqXpmRmut9H9XyW", "I8bp8fQxRuX91uYm", "trHJbEGTUj7YjERL"]}]}, {"UserIDs": ["1rEQG02zccA8wvLs", "WUNd6lPKvqDejvqk", "lTSvDwuOrP9lzpiX"], "parties": [{"partyID": "0VuFpZum7izxe7NP", "userIDs": ["zjOa8E7wY76PxLv9", "HBEUe89AwEw1HO4F", "nKtx4XLKAmlDr19u"]}, {"partyID": "J3nq6VerzVCcI8y3", "userIDs": ["Cz0YqCKUh5RD9vNA", "p4jinFpnQ5xF9wwb", "vMZyeDeRnVfPUa6x"]}, {"partyID": "VVBcq3wZpFIYeAg7", "userIDs": ["9HcLJXJ7mpVI6eTY", "AjdPlCiQQC35cj4K", "yOVgvnWbfRJtsB7c"]}]}], "version": 95}' \
    > test.out 2>&1
eval_tap $? 41 'AppendTeamGameSession' test.out

#- 42 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "1CYPwaiBAxfYL8Av"}' \
    > test.out 2>&1
eval_tap $? 42 'PublicPartyJoinCode' test.out

#- 43 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 't70ZUT2fSk3LL0ca' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetParty' test.out

#- 44 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lqxEewuGS469k2hG' \
    --body '{"attributes": {"0WKt4sUmanYxM0UH": {}, "ZVNYzGMNIpWoSLkU": {}, "rfuf4U3WeYeA9t2E": {}}, "inactiveTimeout": 81, "inviteTimeout": 60, "joinability": "KKWrFtHIi1CMgKAO", "maxPlayers": 66, "minPlayers": 88, "type": "iDcCR5PbCvDLil8w", "version": 19}' \
    > test.out 2>&1
eval_tap $? 44 'PublicUpdateParty' test.out

#- 45 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'LfkVyyJsbGpO6Jge' \
    --body '{"attributes": {"hDJxEN7JlZc8LMq1": {}, "o2jZWu4yA3r0u4q1": {}, "bTHXIjfJKyFlM0u1": {}}, "inactiveTimeout": 42, "inviteTimeout": 15, "joinability": "uoVdn9yVoSlKNchP", "maxPlayers": 69, "minPlayers": 88, "type": "NL4X3LLaGPGdqLE8", "version": 92}' \
    > test.out 2>&1
eval_tap $? 45 'PublicPatchUpdateParty' test.out

#- 46 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'p9CzHFwinkBNi4gv' \
    > test.out 2>&1
eval_tap $? 46 'PublicGeneratePartyCode' test.out

#- 47 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qgl6TZ9TGVPmv34h' \
    > test.out 2>&1
eval_tap $? 47 'PublicRevokePartyCode' test.out

#- 48 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '6T7EsufmfxKYB4LM' \
    --body '{"platformID": "6H6QXmpZ9X3fUSR1", "userID": "l9xLPBsmAUrD9L1I"}' \
    > test.out 2>&1
eval_tap $? 48 'PublicPartyInvite' test.out

#- 49 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iD6MlcEPhMDFzjHZ' \
    --body '{"leaderID": "3sIhzOx2CXKlvIom"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicPromotePartyLeader' test.out

#- 50 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'U3pIxM9n8D2eLMe3' \
    > test.out 2>&1
eval_tap $? 50 'PublicPartyJoin' test.out

#- 51 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lt9qfx2UDcgVE7L9' \
    > test.out 2>&1
eval_tap $? 51 'PublicPartyLeave' test.out

#- 52 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'FK6e0MrPc4vtxk9h' \
    > test.out 2>&1
eval_tap $? 52 'PublicPartyReject' test.out

#- 53 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VKlG56HlzGr7Xjdy' \
    --userId 'RJunZPkp6ccIBnWy' \
    > test.out 2>&1
eval_tap $? 53 'PublicPartyKick' test.out

#- 54 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Pw8mj7gyQ7XdIszG": {}, "Rj46COPipH1MWVTH": {}, "G0qHJCWEfOJpZm9y": {}}, "configurationName": "EYWNGMy2pgSGSUOK", "inactiveTimeout": 72, "inviteTimeout": 9, "joinability": "oxZEDxGiBnNbn0za", "maxPlayers": 11, "members": [{"ID": "9bmrvHmO07KNqX9L", "PlatformID": "M2IwEsdOGBXBwnzD", "PlatformUserID": "X8v3xgC1Ge9PdbTT"}, {"ID": "AJ2Gp1r0sVZ6LJAO", "PlatformID": "ddIL2l3hPjNDKv2L", "PlatformUserID": "WfXqjr8fS79En3wY"}, {"ID": "owBdkaZ3y6i38XQj", "PlatformID": "LDRqkpiFK5BtiQ27", "PlatformUserID": "2Uo9UBJWodpdwsX1"}], "minPlayers": 19, "textChat": false, "type": "tNanGBrkzUvck3xT"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicCreateParty' test.out

#- 55 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["tmOFMebS4AdlNzwo", "g2IhErkNhNcECWwc", "hW6zL9SkbLlrNXnG"]}' \
    > test.out 2>&1
eval_tap $? 55 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 56 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'PublicGetPlayerAttributes' test.out

#- 57 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "7pHY48F1dl1q92m3", "data": {"iRlfnBAk0CwiAsR6": {}, "5yQ9ssuHdGmxncCE": {}, "r0KcgeqzGbruNB72": {}}, "platforms": [{"name": "HHMkjzyBB4UFKiao", "userID": "V0VOem2yqPsMFxKy"}, {"name": "bPkbuS6x9cLJ1APn", "userID": "Nlsa2bRBr27fVMWu"}, {"name": "AfDqLMR919IZPKOK", "userID": "iAVQXXOmqFHLbyXm"}], "roles": ["gCNiXH8uenbC5Cph", "gMweexsIAP5vHLjB", "J9iqMcBL4BzhDUjh"]}' \
    > test.out 2>&1
eval_tap $? 57 'PublicStorePlayerAttributes' test.out

#- 58 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'PublicDeletePlayerAttributes' test.out

#- 59 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'KPwbwcvQU5kG8bXG' \
    --orderBy 'FmPAnOkDiJq4xQye' \
    --status '7HqnVK3YVeOWs9mf' \
    > test.out 2>&1
eval_tap $? 59 'PublicQueryMyGameSessions' test.out

#- 60 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'VQh3jLBtn9pxpE7B' \
    --orderBy 'YtzB0B4CxyQrUpIF' \
    --status 'vORxTi79DpSjb39u' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE