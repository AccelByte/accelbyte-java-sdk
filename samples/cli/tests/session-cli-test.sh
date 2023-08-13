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
echo "1..61"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 55, "PSNSupportedPlatforms": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"], "SessionTitle": "n8mzZ0m8SAMTwE6I", "ShouldSync": true, "XboxServiceConfigID": "IaRDBXxyaNoMR6hk", "XboxSessionTemplateName": "spInrAip6lyzSxwE", "localizedSessionName": {"lFHHdgs21Jub74CU": {}, "kNmKJfh5pUkHODpo": {}, "MF78NY4YkHs1cnz1": {}}}, "PSNBaseUrl": "JSDgY1TXp38zsCTC", "autoJoin": true, "clientVersion": "cPiSuL0Sly6XM4OI", "deployment": "18mAQLnzjMf8GZ2W", "dsSource": "BZqxYG3aREAu2D6Q", "fallbackClaimKeys": ["VKNCWP75TB0i7pKx", "R8dl0zRVW4EZG9m0", "XcgGVbMqSszE8GHa"], "inactiveTimeout": 43, "inviteTimeout": 20, "joinability": "SdAdIhUDrwoZ5Mec", "maxActiveSessions": 7, "maxPlayers": 31, "minPlayers": 76, "name": "c1C8XfwHuKeb9l3r", "persistent": false, "preferredClaimKeys": ["N9A3sNm84hddSpHt", "0P7MIIR7CkyF6C7d", "uuyZ0GhDogqrhBRd"], "requestedRegions": ["8lDR6qVNPRZYdFLI", "AjGGJddVCvu9vx5K", "Q7KYnIuMBvaO35ll"], "textChat": true, "tieTeamsSessionLifetime": false, "type": "aT5kPxUfofvnnSuB"}' \
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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 38, "PSNSupportedPlatforms": ["6I3lMjGSWN2laRlx", "fcjHfYakUCTqGkE7", "wcWfDslpJSqGAXQ0"], "SessionTitle": "yYoNRKd3IL5TAQ6i", "ShouldSync": false, "XboxServiceConfigID": "llG4cYEzfTD1ZBm3", "XboxSessionTemplateName": "MqHcUmLZZbSqb8Rw", "localizedSessionName": {"Nmn9HrNQy4uZAAiE": {}, "0mit9RGCCHYzUOcE": {}, "dscKHPEqgA8yu7Vk": {}}}, "PSNBaseUrl": "6Jt4Ymos9Jcdos4f", "autoJoin": true, "clientVersion": "cTVU6RBt0zYoMcHy", "deployment": "CUEXlAvxJMdalwSy", "dsSource": "liWMNW5NyLu0M3VH", "fallbackClaimKeys": ["h2EI8JlDbPWbQ6Q9", "lNmqRBaAkLnvxkT1", "X68cmDc3fxU8MyKr"], "inactiveTimeout": 88, "inviteTimeout": 32, "joinability": "v52Dlym6puQ23xoJ", "maxActiveSessions": 70, "maxPlayers": 1, "minPlayers": 33, "name": "eCnaLpUKp44YUDja", "persistent": true, "preferredClaimKeys": ["vXa3bMrXsDr6kILs", "SSyDdmykmoPYgc2L", "4jk4Lo0LSP0pf4Ix"], "requestedRegions": ["jUkl535X3ateEKDp", "ADz1x3poD3Qgb3bo", "LQQ1MzH7Qm8bwbmX"], "textChat": false, "tieTeamsSessionLifetime": false, "type": "DUPVJf6c2Z0QZxfg"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateConfigurationTemplateV1' test.out

#- 14 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'PubTDIHrvqAThuwj' \
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
    --configurationName 'RHpKKTlmVr9XuoJb' \
    --dsPodName 'RFQSKVPHbn4Xxtu7' \
    --fromTime 'LQRENjEEztx1WsYS' \
    --gameMode 'iZqan0nSBJroav91' \
    --isPersistent 'GXlvPG6bFYReVHQi' \
    --isSoftDeleted 'pcCx9Zw5D2L7vIYh' \
    --joinability 'GGSyEW4ZJJ42d3PB' \
    --limit '7' \
    --matchPool 'go5QB65lSAiYnNjk' \
    --memberID 'fZrQvGgbLdLsFzHk' \
    --offset '57' \
    --order 'YDDxHSZjtqXyJ58f' \
    --orderBy '7Gc26SaiGVkydwYW' \
    --sessionID 'QG26yUZNmTBcvrbY' \
    --status 'CwZtxFHyPLtI8ilb' \
    --statusV2 'yDPUIj88cekdqCt8' \
    --toTime '1P1ktfIovmv9gsR5' \
    > test.out 2>&1
eval_tap $? 17 'AdminQueryGameSessions' test.out

#- 18 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["cJcHm3SZLxoRDFuu", "uySj29a9LJE8HoRS", "1X2PFAAMwzHPxB1U"]}' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteBulkGameSessions' test.out

#- 19 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'skYs4Yw20DOqOBSC' \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2DKHRuPMMWH8Yb33' \
    --statusType 'T5UBJCjfcnLRfxeC' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateGameSessionMember' test.out

#- 20 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'Sz9WEi8KlloeH0JT' \
    --key '1yduat2vQR3biBfs' \
    --leaderID 'u4jmsRE2w1yEkLgh' \
    --limit '33' \
    --memberID 'tIYt4SqYUTLDx9gI' \
    --memberStatus 'iDandpGT2t24aOMh' \
    --offset '8' \
    --order 'yI4EFZKBcYrCEAE7' \
    --orderBy 'WIsfmx40NLRc6m8h' \
    --partyID 'eKnWhzfe2NubeoKF' \
    --value 'eIaFQCYoDPICpndu' \
    > test.out 2>&1
eval_tap $? 20 'AdminQueryParties' test.out

#- 21 AdminGetPlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminGetPlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlatformCredentials' test.out

#- 22 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "EEQlULdJz4mnRBkM", "clientSecret": "NxvvKgAT8mJrYq6h", "scope": "RkloqxM3gpwxcfMy"}}' \
    > test.out 2>&1
eval_tap $? 22 'AdminUpdatePlatformCredentials' test.out

#- 23 AdminDeletePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminDeletePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminDeletePlatformCredentials' test.out

#- 24 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '9XzjjI5YbsKoADkz' \
    > test.out 2>&1
eval_tap $? 24 'AdminQueryPlayerAttributes' test.out

#- 25 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'JEN2VHzih3bit0VW' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetPlayerAttributes' test.out

#- 26 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"n3CO39PXDNxtXgeO": {}, "3FgkXhjDzaQY3snn": {}, "2ZkP7cFdP43e5dC9": {}}, "autoJoin": true, "backfillTicketID": "9bRVhyaKwwrAP2aM", "clientVersion": "lu7WtjCtoYetOO84", "configurationName": "7g8OudOfjnCuHZ3c", "deployment": "46IjGa23YvYmmDg7", "dsSource": "VYPXIuvUYTZBRujI", "fallbackClaimKeys": ["UE1Tq5jyAZvkRCMN", "FIurjh2imdb4rbkX", "j0ZwsVC0gL97ZVJS"], "inactiveTimeout": 85, "inviteTimeout": 33, "joinability": "QD3oD5fLCr3OOlXV", "matchPool": "v8ZGF7uYnGzpipND", "maxPlayers": 17, "minPlayers": 75, "preferredClaimKeys": ["gNJma1MbqqZtfNWq", "l4nmwAft4gqkNNlW", "kD9eOziYRFOn0jJL"], "requestedRegions": ["HC9LxhvNXTwGBCto", "hLtl9Zuhytm5UDrT", "6QXCs5SPBbRPZTF6"], "serverName": "oQAXVG7tnsZg5QgX", "teams": [{"UserIDs": ["jvyGJPN4eXbJE5Vs", "2GcyomQoIXimBJeh", "yxlNsjUgxBkF6wFP"], "parties": [{"partyID": "oJeQediogEhhM2rI", "userIDs": ["izGdKvOPdq5xrgxS", "my1DN9LFkYW5DQyj", "4bj5Ro2ogaKt2ujQ"]}, {"partyID": "Sa3Zdb65UXmy0Zp6", "userIDs": ["iIaTIKUkmkk9QM0N", "BMA9ORxpzwLR2AK6", "eXUGPJsw1fiP80G9"]}, {"partyID": "Pclxcft2ulIJzPyr", "userIDs": ["VEiOG4UcqsuGKHhM", "RWLVd3DlhLuIpomM", "8sm1MiaI1mX2tJoA"]}]}, {"UserIDs": ["RtdbBe7udsMrok0W", "vGYYnx4V709xbnGe", "zKsDwG2omOR2nvYI"], "parties": [{"partyID": "9TVqJdvzcWbfUpaX", "userIDs": ["p5JMl5LL4bTxBmZj", "drrIxsB0NRsB1fPq", "qRRulpqpymDkQhtr"]}, {"partyID": "HWwRVnwVBOqOHi8p", "userIDs": ["WGd1juYhiqjRJOqB", "5F93zFQbJndUDpdO", "NneAczbBdHb2slt7"]}, {"partyID": "1B1SmZp2JZp50CnP", "userIDs": ["b71ORYcmQbTU5JX8", "ccLjMXJRk0eaKQDO", "JvrTefglSs6g4iY9"]}]}, {"UserIDs": ["u02aCNYIWekp18lO", "C3mNqF7Bl0LcghVH", "fPEspxwhRON0bc1e"], "parties": [{"partyID": "MbEIjowLqc3ecjXJ", "userIDs": ["bZDKKoxLE1Y3Dymt", "j3giPg4x4yiPX6ue", "s1Hhhkg1yLVbLFzH"]}, {"partyID": "EP8cM4NTwr0KHaAs", "userIDs": ["mTej52WKi6tArAUR", "t9plCSVq8PdH6hJP", "UAc0RVwXgAgntLMC"]}, {"partyID": "uaXBWQi6BqPg4xr0", "userIDs": ["lCancUZGCHsZYoLf", "R1KtOv7Zy0b65uvu", "KNuy0ytZQ7M6Nzy1"]}]}], "textChat": false, "ticketIDs": ["C6f6QkmZXElW9YfR", "Sse6AAz3S4czz0QK", "FlAVmVLu4AOec0z8"], "tieTeamsSessionLifetime": false, "type": "zdxTgOfnwIdlNa29"}' \
    > test.out 2>&1
eval_tap $? 26 'CreateGameSession' test.out

#- 27 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"fDLh741IslKHzGlL": {}, "KWUtDQs61OQAoxyy": {}, "QpRWCiiPDGQhNPEw": {}}' \
    > test.out 2>&1
eval_tap $? 27 'PublicQueryGameSessions' test.out

#- 28 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "iJCf2XJVrlzqQls1"}' \
    > test.out 2>&1
eval_tap $? 28 'PublicSessionJoinCode' test.out

#- 29 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'ozhLVA3kE8jKvgat' \
    > test.out 2>&1
eval_tap $? 29 'GetGameSessionByPodName' test.out

#- 30 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OEBM70TdlNBJYOmp' \
    > test.out 2>&1
eval_tap $? 30 'GetGameSession' test.out

#- 31 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'u1VCarzBsV6xnZ5J' \
    --body '{"attributes": {"rzzjrcaug6CWVG8S": {}, "WP3glU6muswVJnNn": {}, "N7kAa7j0riFc5HTH": {}}, "backfillTicketID": "QIoVsGo7dwV9DBqF", "clientVersion": "KHQkETJyTlUrwDTn", "deployment": "oujQD4IEiH9Z5qXn", "fallbackClaimKeys": ["3aoRtlqOECohViHA", "5CzgFSy8X1A3PrIf", "apq5AAeMe4L3mDWO"], "inactiveTimeout": 90, "inviteTimeout": 56, "joinability": "pCAKxeE70CaunQNx", "matchPool": "ot371W9G4AvQkqsG", "maxPlayers": 27, "minPlayers": 14, "preferredClaimKeys": ["myo5JJTUVmb8GEXF", "TlEMEsFzYqwgK1Np", "5nodqpLm7FhJBNXz"], "requestedRegions": ["AFdO0Khqf6kiTdSG", "v2LFjAKY7CbgsWqF", "WZX7kPBom8F9GLLT"], "teams": [{"UserIDs": ["G8phc3n4iLoIllKl", "pO2pqiXJF3WGRaoQ", "omSJC4DdrKF7SUQP"], "parties": [{"partyID": "LG59e0k5ZtX6wK7P", "userIDs": ["pUlcIW32iK7MGt1i", "xY5rA1WoVeJIePF8", "ZrQzP4zvtdxdbZUp"]}, {"partyID": "d6FJtHJ1pyVwyKQL", "userIDs": ["Y6FEO65Rb3z7CYLM", "8IlsHqffnrfsGlfP", "aZKBwa3Ddb60ufPp"]}, {"partyID": "zwj1QGIFmlVf4jva", "userIDs": ["pseE9LN9bvhOrHfl", "IOd6X3viLvtEk4mT", "IpUA9gxo8SV38nEh"]}]}, {"UserIDs": ["oXmM2W7l6jHMA2rG", "3nakopAywelu01nr", "yEJ0NqoTow0qiOiC"], "parties": [{"partyID": "4j0iktm0ZPLkLOsp", "userIDs": ["0LZ5njN86Hl8kUXz", "t6bSc6bWvgpVyW9d", "D1kOmvrAejcq2Lgk"]}, {"partyID": "QuaS7RBx3vim02jB", "userIDs": ["OxrZDyvpcLYOWA8N", "jxOnaEok4nOOCzfs", "flhjbngJOUn18G5M"]}, {"partyID": "lfDTk8aG40Nlncce", "userIDs": ["IZSwgAIkgzh4pTU0", "Am4DZhl0bQxFJ3sW", "CqQpQ2FbKPFMycMS"]}]}, {"UserIDs": ["Q4qfAacR0LgB5BUX", "vjcu2s6w3VifnKqm", "TSoGH1XEfY6QAYn6"], "parties": [{"partyID": "WQ5UBEU1QAOHfZiG", "userIDs": ["hxOdcuDXSxSc3aZP", "V87pna08gxefTYKh", "uxaEc7M4P7UckSC6"]}, {"partyID": "ePeN8i4GrFES9z7x", "userIDs": ["ueHpATHccee9GXhK", "cjmSEwdrkEnnqKzF", "sLfYalUlfwEQKjU7"]}, {"partyID": "eHGebSVu0LQ40kep", "userIDs": ["EaC4dfiOMZfEhHr3", "9pysFO3Zvc1BZG99", "LyvfvHEsJKQQewVL"]}]}], "ticketIDs": ["MUoAnaRcYp7FUjfI", "GaffoflEIByYqeKN", "0meGelYF5wWaDhuk"], "tieTeamsSessionLifetime": false, "type": "vWgSHdfo07UctPEr", "version": 34}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateGameSession' test.out

#- 32 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PWam1jxR7SETWjte' \
    > test.out 2>&1
eval_tap $? 32 'DeleteGameSession' test.out

#- 33 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oc8fgvZDDhoO05oK' \
    --body '{"attributes": {"qymxLD1Lcvw6T6mZ": {}, "EiwxxElpMYSWIeVz": {}, "m7z9noowmlTIKVow": {}}, "backfillTicketID": "i0RY2VN4ZONJREdU", "clientVersion": "Q3z9F1BxNNgnke4a", "deployment": "kncw7wu9TmXfJWBP", "fallbackClaimKeys": ["rx9Ns8eLzYEvwSWT", "aLQjctvrK2jhsYpK", "PlXn77AtYoFzLAAT"], "inactiveTimeout": 86, "inviteTimeout": 88, "joinability": "Y8P8P3cfoivvQxev", "matchPool": "ecWw7Rry0KK5rgAG", "maxPlayers": 83, "minPlayers": 62, "preferredClaimKeys": ["0dW8rX2MVUGKSZ4G", "cLkt4pK32sJxlZcC", "TpTdRtCHvuk6B6XT"], "requestedRegions": ["mSLyn50sigBVZxiK", "dV57GvRyd9UuL02L", "e8HSCslsDd4M1F5q"], "teams": [{"UserIDs": ["RIblS7Nz81GRazPA", "ANjfBoldFOyqA2cl", "J5gEOaCgM6Yn6Rug"], "parties": [{"partyID": "bNEIpGBFUjOn5mM7", "userIDs": ["k8nbLzvtCIW5ynMK", "quUicAeIVXtoWAXh", "MlW4tLqX7OICf5oD"]}, {"partyID": "1e6oI9FmYel0kOw7", "userIDs": ["2o8Zkgk0jS6rDWUw", "fhKvrf2AaH4yCWrH", "SppnIZkNnTn3rzH5"]}, {"partyID": "NvAtcvNedgS1fUfK", "userIDs": ["mihDbmu8ePWlQMVD", "XEHeiGTnwyEw6hIW", "DZrpP7rz3ISW510k"]}]}, {"UserIDs": ["Hr4isTKWjmv67nuH", "CXWfwnwGioVwVzmm", "BVVFfpqx1AeLtzcP"], "parties": [{"partyID": "J3jtDYBo4FUTH7CG", "userIDs": ["fKSyxgRR1DiCqSMz", "pqIFGLkDs7ACC1Rg", "BfoNrHlFi2qJLgmB"]}, {"partyID": "LE35YhyiDV90SeI5", "userIDs": ["yppBHoytVznCgNyx", "9fbT63ShEh8PbGik", "Ljgjcj34uulU6FYB"]}, {"partyID": "ZsWFbr3RSP0W9nBh", "userIDs": ["vhf8Q0DtJMcYQdN6", "6bswAgt65X4N1LQZ", "mB61JMdtwCVUrYQu"]}]}, {"UserIDs": ["e84dwmbwFEnAZaWs", "QJtRYoagRJK5PX9U", "cOvhPyE11TRT2SKs"], "parties": [{"partyID": "eoe8VLie0LBa36KN", "userIDs": ["zjf005CXNGehQ2aT", "jTDfKFDXC7eGL5Yh", "JDWh9YWqc0qgV6d9"]}, {"partyID": "yOfIMLds2DbPcaoM", "userIDs": ["dtRLTmSvTkQQgB7e", "xYvmHMxr5hPCJJzt", "JBg0tTJg46IewOXE"]}, {"partyID": "2AkCh3QIZsUf8lGF", "userIDs": ["XcmwTERHclOdxIwq", "ejxe18rNdb8Otq6j", "1mqUav7k05HAQltn"]}]}], "ticketIDs": ["SojV4jT65yclX2Ft", "Az0vJjFIYWOaNdsi", "mmkW2miH3xRHAKy4"], "tieTeamsSessionLifetime": true, "type": "xZkaXZ7vmiEd0JPx", "version": 97}' \
    > test.out 2>&1
eval_tap $? 33 'PatchUpdateGameSession' test.out

#- 34 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ps3ztUIV0dS6hIH9' \
    --body '{"backfillTicketID": "c4VfkyrwpuXxbaER"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGameSessionBackfillTicketID' test.out

#- 35 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bfgPmi0eHkt1mr9E' \
    > test.out 2>&1
eval_tap $? 35 'GameSessionGenerateCode' test.out

#- 36 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'OIFg0dnWIYN2NVL7' \
    > test.out 2>&1
eval_tap $? 36 'PublicRevokeGameSessionCode' test.out

#- 37 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0Iw157g00jr9b8Mu' \
    --body '{"platformID": "YmmeKTmBNvGYxEQd", "userID": "f3ewoGGoY7xmFNAm"}' \
    > test.out 2>&1
eval_tap $? 37 'PublicGameSessionInvite' test.out

#- 38 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'jDDCvs78mcMdiS76' \
    > test.out 2>&1
eval_tap $? 38 'JoinGameSession' test.out

#- 39 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YApGJ9ufwLYkqIgL' \
    --body '{"leaderID": "uZS6hsQryiEtOAbp"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicPromoteGameSessionLeader' test.out

#- 40 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eUNf26UqkCfgCUYB' \
    > test.out 2>&1
eval_tap $? 40 'LeaveGameSession' test.out

#- 41 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'n2xaOBdPF0JmX8qw' \
    > test.out 2>&1
eval_tap $? 41 'PublicGameSessionReject' test.out

#- 42 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'U1cTuHHPB5S3DvPR' \
    --body '{"additionalMembers": [{"partyID": "CzBrVUxmDOj3cvRF", "userIDs": ["aTC11W0TGTCm4fZW", "uk6pQxDQpKqxLGeM", "vr9TsvcMQ7dBsaIe"]}, {"partyID": "cRxIsZvD6rmzVr5X", "userIDs": ["T1Nxw0v1dMQ9Rrbk", "6C2cVWf6ttvbU1PO", "6ApCD2VXidT7w0Oc"]}, {"partyID": "15N8WXBPp17PAewq", "userIDs": ["Sm5x3B4t7WQnp8jX", "Zedgt5cyNe27HLtw", "tVOaxgP6Jbct8puM"]}], "proposedTeams": [{"UserIDs": ["ybYGxD9IPmmsLmu3", "kaPj0O4zd8Tb7cUN", "GPTBxiFFCrn7djjs"], "parties": [{"partyID": "69FTFVGUVhvKhJCm", "userIDs": ["eisql14mUHVbMPim", "NhcZsU3VAdMDcb4q", "lkiFAamqvZI2Kwjq"]}, {"partyID": "PBiWXade41s3rH34", "userIDs": ["mB2yPlRpWjmHZAAv", "KTH8MuqIg0Czkguw", "uJCW7EEFB67AODbi"]}, {"partyID": "9BzupBsFpYc77GtR", "userIDs": ["UcCFeY5g4XgBsbfz", "qxBPNe8ae1Il4aAt", "Ebu4IjGdqthRxTjQ"]}]}, {"UserIDs": ["7gkZEY8rG0q0Q2Qd", "2JzRbkF2I03dIjvB", "bA6bfbYaJCJjfk2T"], "parties": [{"partyID": "Uvn95FhO7VW3mbDV", "userIDs": ["MDu87t0ldWf7iSGI", "iKFtWtn4Yr2svKM6", "pqLGZ0TBujELAUK6"]}, {"partyID": "mQ5iZgbwwm5iGzXt", "userIDs": ["cknrgidKupvXO6aj", "4hCmTC34jxW4pIDw", "dqXpmRmut9H9XyWI"]}, {"partyID": "8bp8fQxRuX91uYmt", "userIDs": ["rHJbEGTUj7YjERL1", "rEQG02zccA8wvLsW", "UNd6lPKvqDejvqkl"]}]}, {"UserIDs": ["TSvDwuOrP9lzpiX0", "VuFpZum7izxe7NPz", "jOa8E7wY76PxLv9H"], "parties": [{"partyID": "BEUe89AwEw1HO4Fn", "userIDs": ["Ktx4XLKAmlDr19uJ", "3nq6VerzVCcI8y3C", "z0YqCKUh5RD9vNAp"]}, {"partyID": "4jinFpnQ5xF9wwbv", "userIDs": ["MZyeDeRnVfPUa6xV", "VBcq3wZpFIYeAg79", "HcLJXJ7mpVI6eTYA"]}, {"partyID": "jdPlCiQQC35cj4Ky", "userIDs": ["OVgvnWbfRJtsB7cU", "QZ2QUAxJrINPXppP", "NO3AfmXcgwC3IN6t"]}]}], "version": 44}' \
    > test.out 2>&1
eval_tap $? 42 'AppendTeamGameSession' test.out

#- 43 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qxEewuGS469k2hG0"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicPartyJoinCode' test.out

#- 44 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'WKt4sUmanYxM0UHZ' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetParty' test.out

#- 45 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VNYzGMNIpWoSLkUr' \
    --body '{"attributes": {"fuf4U3WeYeA9t2EN": {}, "KKWrFtHIi1CMgKAO": {}, "G5iDcCR5PbCvDLil": {}}, "inactiveTimeout": 18, "inviteTimeout": 47, "joinability": "PLfkVyyJsbGpO6Jg", "maxPlayers": 9, "minPlayers": 89, "type": "hDJxEN7JlZc8LMq1", "version": 30}' \
    > test.out 2>&1
eval_tap $? 45 'PublicUpdateParty' test.out

#- 46 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'HGa4XfZcd9CVnGqM' \
    --body '{"attributes": {"X9FieeEssWEUl07b": {}, "hwntCVqiYOJf5KwM": {}, "ZQjzvjSozv6CTRDl": {}}, "inactiveTimeout": 53, "inviteTimeout": 92, "joinability": "p9CzHFwinkBNi4gv", "maxPlayers": 34, "minPlayers": 60, "type": "gl6TZ9TGVPmv34h6", "version": 93}' \
    > test.out 2>&1
eval_tap $? 46 'PublicPatchUpdateParty' test.out

#- 47 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'BQuxLvPuWYvE3fsN' \
    > test.out 2>&1
eval_tap $? 47 'PublicGeneratePartyCode' test.out

#- 48 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'y9Z9OhxXvCp9y7fL' \
    > test.out 2>&1
eval_tap $? 48 'PublicRevokePartyCode' test.out

#- 49 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'D2qfCXnlUnqxT1Ws' \
    --body '{"platformID": "RNMZcA92hzC7MNa8", "userID": "vVe4MHX6AgMep90A"}' \
    > test.out 2>&1
eval_tap $? 49 'PublicPartyInvite' test.out

#- 50 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yyUJyAK5PRMRMwdv' \
    --body '{"leaderID": "l0hv6g62GxBW2tQF"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicPromotePartyLeader' test.out

#- 51 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '5tkTjgJaMYvNQOsD' \
    > test.out 2>&1
eval_tap $? 51 'PublicPartyJoin' test.out

#- 52 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'a4bkcgepqtxjbrzt' \
    > test.out 2>&1
eval_tap $? 52 'PublicPartyLeave' test.out

#- 53 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ee7QLTGAak7Kaol0' \
    > test.out 2>&1
eval_tap $? 53 'PublicPartyReject' test.out

#- 54 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '1DK97D2xnik42mit' \
    --userId 'eR5eQAe1rzmmgqBP' \
    > test.out 2>&1
eval_tap $? 54 'PublicPartyKick' test.out

#- 55 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Rmd6mO4oI8KDqebm": {}, "83raNBJ5y7axEkvI": {}, "4oxZEDxGiBnNbn0z": {}}, "configurationName": "af7CaOSlHXrUSA6s", "inactiveTimeout": 80, "inviteTimeout": 77, "joinability": "JzA5mtqISQ83TTbt", "maxPlayers": 9, "members": [{"ID": "X8v3xgC1Ge9PdbTT", "PlatformID": "AJ2Gp1r0sVZ6LJAO", "PlatformUserID": "ddIL2l3hPjNDKv2L"}, {"ID": "WfXqjr8fS79En3wY", "PlatformID": "owBdkaZ3y6i38XQj", "PlatformUserID": "LDRqkpiFK5BtiQ27"}, {"ID": "2Uo9UBJWodpdwsX1", "PlatformID": "jorcyR0x3YiHF8IT", "PlatformUserID": "GPRQBCgIs1Q2lzxl"}], "minPlayers": 30, "textChat": true, "type": "g2IhErkNhNcECWwc"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicCreateParty' test.out

#- 56 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["hW6zL9SkbLlrNXnG", "anMazb8jvRWenURH", "48aJuALEcSqcE15u"]}' \
    > test.out 2>&1
eval_tap $? 56 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 57 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'PublicGetPlayerAttributes' test.out

#- 58 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": true, "currentPlatform": "yQ9ssuHdGmxncCEr", "data": {"0KcgeqzGbruNB72H": {}, "HMkjzyBB4UFKiaoV": {}, "0VOem2yqPsMFxKyb": {}}, "platforms": [{"name": "PkbuS6x9cLJ1APnN", "userID": "lsa2bRBr27fVMWuA"}, {"name": "fDqLMR919IZPKOKi", "userID": "AVQXXOmqFHLbyXmg"}, {"name": "CNiXH8uenbC5Cphg", "userID": "MweexsIAP5vHLjBJ"}], "roles": ["9iqMcBL4BzhDUjhK", "PwbwcvQU5kG8bXGF", "mPAnOkDiJq4xQye7"]}' \
    > test.out 2>&1
eval_tap $? 58 'PublicStorePlayerAttributes' test.out

#- 59 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'PublicDeletePlayerAttributes' test.out

#- 60 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'HqnVK3YVeOWs9mfV' \
    --orderBy 'Qh3jLBtn9pxpE7BY' \
    --status 'tzB0B4CxyQrUpIFv' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryMyGameSessions' test.out

#- 61 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'ORxTi79DpSjb39uk' \
    --orderBy 'cR6c2E2r3vk3IfAK' \
    --status 'EbqcNXSGCCvNowNm' \
    > test.out 2>&1
eval_tap $? 61 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE