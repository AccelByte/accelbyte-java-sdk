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
echo "1..58"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 55, "PSNSupportedPlatforms": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"], "SessionTitle": "n8mzZ0m8SAMTwE6I", "ShouldSync": true, "XboxServiceConfigID": "IaRDBXxyaNoMR6hk", "XboxSessionTemplateName": "spInrAip6lyzSxwE", "localizedSessionName": {"lFHHdgs21Jub74CU": {}, "kNmKJfh5pUkHODpo": {}, "MF78NY4YkHs1cnz1": {}}}, "PSNBaseUrl": "JSDgY1TXp38zsCTC", "clientVersion": "rbCbPOyNQkT7NvyE", "deployment": "3cwyALczNIicXm7a", "dsSource": "gSrjJW2OQNOs1PXh", "fallbackClaimKeys": ["T5FvdiRilZ7oFgx4", "c8OumKtPDKJDXn7Z", "4U68su8XfqlqNiTv"], "inactiveTimeout": 56, "inviteTimeout": 43, "joinability": "6SdAdIhUDrwoZ5Me", "maxActiveSessions": 4, "maxPlayers": 7, "minPlayers": 31, "name": "Ki5r6QEa1ysLEzth", "persistent": false, "preferredClaimKeys": ["N9A3sNm84hddSpHt", "0P7MIIR7CkyF6C7d", "uuyZ0GhDogqrhBRd"], "requestedRegions": ["8lDR6qVNPRZYdFLI", "AjGGJddVCvu9vx5K", "Q7KYnIuMBvaO35ll"], "textChat": true, "type": "6Vpbsx5w8hqUI06U"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateConfigurationTemplateV1' test.out

#- 10 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetAllConfigurationTemplatesV1' test.out

#- 11 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'OXGSLmCVuHOPlLlk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetConfigurationTemplateV1' test.out

#- 12 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'vR8sKgnuRkgghGoY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 42, "PSNSupportedPlatforms": ["iljvjKoyD6SCwGrn", "cqmLtjQHAf8TgoNm", "03VLisV6zwPuo3td"], "SessionTitle": "6TC6I3lMjGSWN2la", "ShouldSync": false, "XboxServiceConfigID": "qxNeIxPz6MbwL6IY", "XboxSessionTemplateName": "69z1UaLqYSYWytLP", "localizedSessionName": {"ziZMdjxcBZufQxGi": {}, "HPllG4cYEzfTD1ZB": {}, "m3MqHcUmLZZbSqb8": {}}}, "PSNBaseUrl": "RwNmn9HrNQy4uZAA", "clientVersion": "iE0mit9RGCCHYzUO", "deployment": "cEdscKHPEqgA8yu7", "dsSource": "Vk6Jt4Ymos9Jcdos", "fallbackClaimKeys": ["4fYcTVU6RBt0zYoM", "cHyCUEXlAvxJMdal", "wSyliWMNW5NyLu0M"], "inactiveTimeout": 56, "inviteTimeout": 98, "joinability": "2jJCSQT279ZZPYGu", "maxActiveSessions": 37, "maxPlayers": 24, "minPlayers": 8, "name": "NmqRBaAkLnvxkT1X", "persistent": true, "preferredClaimKeys": ["cmDc3fxU8MyKrQpM", "4hkkK6KKXNB3Gv0I", "qmF51TkhjYnaq6fo"], "requestedRegions": ["WvXa3bMrXsDr6kIL", "sSSyDdmykmoPYgc2", "L4jk4Lo0LSP0pf4I"], "textChat": true, "type": "ZNkSQ70D0H6BXksU"}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationTemplateV1' test.out

#- 13 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'C9b6i5lZC9xv32e8' \
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
    --configurationName 'c5csSovoqsZNBdte' \
    --dsPodName '9NDUPVJf6c2Z0QZx' \
    --fromTime 'fgPubTDIHrvqAThu' \
    --gameMode 'wjRHpKKTlmVr9Xuo' \
    --isPersistent 'JbRFQSKVPHbn4Xxt' \
    --isSoftDeleted 'u7LQRENjEEztx1Ws' \
    --joinability 'YSiZqan0nSBJroav' \
    --limit '33' \
    --matchPool '1GXlvPG6bFYReVHQ' \
    --memberID 'ipcCx9Zw5D2L7vIY' \
    --offset '15' \
    --order 'VvUfHQvsHXNUNe4m' \
    --orderBy 'hgo5QB65lSAiYnNj' \
    --sessionID 'kfZrQvGgbLdLsFzH' \
    --status 'kBMr1yrOMlNFSrUE' \
    --statusV2 'irnjX9fDmIbeZxzf' \
    --toTime 'TcyiuATus9hsfpFD' \
    > test.out 2>&1
eval_tap $? 16 'AdminQueryGameSessions' test.out

#- 17 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["cSDG8aMVGLiBNrDj", "qoxcwgGLXpUL4pp2", "ncYAHdNzDmeIP6rO"]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteBulkGameSessions' test.out

#- 18 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'vDz9KOsb392k6YmJ' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FfRByjlBiuFM3FIo' \
    --statusType 'Vk8T3GpAnkCmBUqg' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateGameSessionMember' test.out

#- 19 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability '2SCnqntX9y1aZSWM' \
    --key 'iVi10sG6vxkfUcmq' \
    --leaderID 'RRbceJ5i0EeDxOgB' \
    --limit '26' \
    --memberID 'CSz9WEi8KlloeH0J' \
    --memberStatus 'T1yduat2vQR3biBf' \
    --offset '38' \
    --order 'rtOa4EXsXzOXQAk4' \
    --orderBy 'mqrxzTtuLl4XlbGL' \
    --partyID '8QOxtjzm8y2wNhmw' \
    --value 'oYZyI4EFZKBcYrCE' \
    > test.out 2>&1
eval_tap $? 19 'AdminQueryParties' test.out

#- 20 AdminUpdatePlatformCredentials
./ng net.accelbyte.sdk.cli.Main session adminUpdatePlatformCredentials \
    --namespace "$AB_NAMESPACE" \
    --body '{"psn": {"clientId": "AE7WIsfmx40NLRc6", "clientSecret": "m8heKnWhzfe2Nube", "scope": "oKFeIaFQCYoDPICp"}}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdatePlatformCredentials' test.out

#- 21 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'nduEEQlULdJz4mnR' \
    > test.out 2>&1
eval_tap $? 21 'AdminQueryPlayerAttributes' test.out

#- 22 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'BkMNxvvKgAT8mJrY' \
    > test.out 2>&1
eval_tap $? 22 'AdminGetPlayerAttributes' test.out

#- 23 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"q6hRkloqxM3gpwxc": {}, "fMy9XzjjI5YbsKoA": {}, "DkzJEN2VHzih3bit": {}}, "backfillTicketID": "0VWn3CO39PXDNxtX", "clientVersion": "geO3FgkXhjDzaQY3", "configurationName": "snn2ZkP7cFdP43e5", "deployment": "dC9XIBudfZgrbHDI", "dsSource": "Dm4hMzF4TxodenSr", "fallbackClaimKeys": ["UTvfqU0bfoMm5cTt", "FWbotQyXJRcQWsmq", "PNs92epxk0i8VxsZ"], "inactiveTimeout": 82, "inviteTimeout": 57, "joinability": "ereSvf9699mCEHTh", "matchPool": "UJkETAsSp7gh4TeU", "maxPlayers": 93, "minPlayers": 36, "preferredClaimKeys": ["kOkAYfJB8AT9t4Tv", "207Y2QD3oD5fLCr3", "OOlXVv8ZGF7uYnGz"], "requestedRegions": ["pipNDigNJma1Mbqq", "ZtfNWql4nmwAft4g", "qkNNlWkD9eOziYRF"], "serverName": "On0jJLHC9LxhvNXT", "teams": [{"UserIDs": ["wGBCtohLtl9Zuhyt", "m5UDrT6QXCs5SPBb", "RPZTF6oQAXVG7tns"], "parties": [{"partyID": "Zg5QgXjvyGJPN4eX", "userIDs": ["bJE5Vs2GcyomQoIX", "imBJehyxlNsjUgxB", "kF6wFPoJeQediogE"]}, {"partyID": "hhM2rIizGdKvOPdq", "userIDs": ["5xrgxSmy1DN9LFkY", "W5DQyj4bj5Ro2oga", "Kt2ujQSa3Zdb65UX"]}, {"partyID": "my0Zp6iIaTIKUkmk", "userIDs": ["k9QM0NBMA9ORxpzw", "LR2AK6eXUGPJsw1f", "iP80G9Pclxcft2ul"]}]}, {"UserIDs": ["IJzPyrVEiOG4Ucqs", "uGKHhMRWLVd3DlhL", "uIpomM8sm1MiaI1m"], "parties": [{"partyID": "X2tJoARtdbBe7uds", "userIDs": ["Mrok0WvGYYnx4V70", "9xbnGezKsDwG2omO", "R2nvYI9TVqJdvzcW"]}, {"partyID": "bfUpaXp5JMl5LL4b", "userIDs": ["TxBmZjdrrIxsB0NR", "sB1fPqqRRulpqpym", "DkQhtrHWwRVnwVBO"]}, {"partyID": "qOHi8pWGd1juYhiq", "userIDs": ["jRJOqB5F93zFQbJn", "dUDpdONneAczbBdH", "b2slt71B1SmZp2JZ"]}]}, {"UserIDs": ["p50CnPb71ORYcmQb", "TU5JX8ccLjMXJRk0", "eaKQDOJvrTefglSs"], "parties": [{"partyID": "6g4iY9u02aCNYIWe", "userIDs": ["kp18lOC3mNqF7Bl0", "LcghVHfPEspxwhRO", "N0bc1eMbEIjowLqc"]}, {"partyID": "3ecjXJbZDKKoxLE1", "userIDs": ["Y3Dymtj3giPg4x4y", "iPX6ues1Hhhkg1yL", "VbLFzHEP8cM4NTwr"]}, {"partyID": "0KHaAsmTej52WKi6", "userIDs": ["tArAURt9plCSVq8P", "dH6hJPUAc0RVwXgA", "gntLMCuaXBWQi6Bq"]}]}], "textChat": true, "ticketIDs": ["g4xr0lCancUZGCHs", "ZYoLfR1KtOv7Zy0b", "65uvuKNuy0ytZQ7M"], "type": "6Nzy1adnSKOLFKx1"}' \
    > test.out 2>&1
eval_tap $? 23 'CreateGameSession' test.out

#- 24 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"dX4LuWJu3pDMUAee": {}, "Z97SBROPYuG6XqP6": {}, "oo7G73zdxTgOfnwI": {}}' \
    > test.out 2>&1
eval_tap $? 24 'PublicQueryGameSessions' test.out

#- 25 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "dlNa29fDLh741Isl"}' \
    > test.out 2>&1
eval_tap $? 25 'PublicSessionJoinCode' test.out

#- 26 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'KHzGlLKWUtDQs61O' \
    > test.out 2>&1
eval_tap $? 26 'GetGameSessionByPodName' test.out

#- 27 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QAoxyyQpRWCiiPDG' \
    > test.out 2>&1
eval_tap $? 27 'GetGameSession' test.out

#- 28 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QhNPEwiJCf2XJVrl' \
    --body '{"attributes": {"zqQls1ozhLVA3kE8": {}, "jKvgatOEBM70TdlN": {}, "BJYOmpu1VCarzBsV": {}}, "backfillTicketID": "6xnZ5Jrzzjrcaug6", "clientVersion": "CWVG8SWP3glU6mus", "deployment": "wVJnNnN7kAa7j0ri", "fallbackClaimKeys": ["Fc5HTHQIoVsGo7dw", "V9DBqFKHQkETJyTl", "UrwDTnoujQD4IEiH"], "inactiveTimeout": 71, "inviteTimeout": 28, "joinability": "5qXn3aoRtlqOECoh", "matchPool": "ViHA5CzgFSy8X1A3", "maxPlayers": 85, "minPlayers": 62, "preferredClaimKeys": ["rIfapq5AAeMe4L3m", "DWORBVXTIIJM9XsY", "IIZxiXNMR9BgaWcF"], "requestedRegions": ["X3SUBhyoTsMWPAxU", "MkawaGpAyrIwMif3", "BOdkocVTd4BxqGWV"], "teams": [{"UserIDs": ["6mTJ0sQs6XNbjvqh", "nUVLWu8olKdxL6oz", "RmDD0jJvlfV5OemP"], "parties": [{"partyID": "YdYT7DROCjtuzFMb", "userIDs": ["AG9YI89hmguB8FOT", "jMLo4b9rIzqYkEps", "tyVTBcrM8rG0rH0z"]}, {"partyID": "cswwVeMK6MbGIVIu", "userIDs": ["8vvwLc7KY3uVoJXT", "IMtpgkieDyF97lGd", "MiHKxbWCYzo8yO2K"]}, {"partyID": "TK9tmmOnYnOpas6g", "userIDs": ["hP1y4Zi7s7QBlk44", "Z44B1GZgKg4uKxaC", "gcGLuC3brWdTYCfH"]}]}, {"UserIDs": ["kIySok5DiXZtLW87", "rGysryod3dNQrmsA", "pRA6HX3RwrKt2eco"], "parties": [{"partyID": "zL0TOg54vCE48L5o", "userIDs": ["LF6M4lNa4JUMSHNg", "qRqCV7usamANkZlO", "X9Sfo95HgXqKhTPk"]}, {"partyID": "wfLM9uSybRzWek2g", "userIDs": ["ZvRrvr0n9d9lvccK", "MLhrTrcBE2ItBS3K", "tKZWe8aoFzAyBME7"]}, {"partyID": "4HUtipUWYhWV1qx8", "userIDs": ["CzPML52faXUr9Sk4", "lq2faBcAXXKlhvyH", "8paOJtxqMPpcVfRw"]}]}, {"UserIDs": ["Nj547fH0XrKEDpEY", "8VnocGAjci0V3tBf", "2jnHGKXphn50c9tN"], "parties": [{"partyID": "LDljhZ2jxLRX3z46", "userIDs": ["OCaGBeMfPlNos4yB", "RjrERHEonAZR8GmE", "u0q1p6QCyY6vSkVF"]}, {"partyID": "WdsbYuVEGVxYheR3", "userIDs": ["j5mNZ6vwv7K8Asvt", "1j1Rx59hesNWy2Nv", "Z85DDKDAF8KDsBZO"]}, {"partyID": "uYQJ03BAHZ7c53q7", "userIDs": ["akMpcmnnx6RVBrop", "9v7aZK3h65hbN15z", "fQSfQrtfF3TQN0Oc"]}]}], "ticketIDs": ["NDLr36vzohZyjMQA", "g5mPYhrLTyU8Ohgf", "Y9JQYGF4bYXEcENx"], "type": "9xZlAchob44lONDD", "version": 45}' \
    > test.out 2>&1
eval_tap $? 28 'UpdateGameSession' test.out

#- 29 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FUjfIGaffoflEIBy' \
    > test.out 2>&1
eval_tap $? 29 'DeleteGameSession' test.out

#- 30 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YqeKN0meGelYF5wW' \
    --body '{"attributes": {"aDhukU4khGG4vZFT": {}, "YnPkmSu4PWam1jxR": {}, "7SETWjteoc8fgvZD": {}}, "backfillTicketID": "DhoO05oKqymxLD1L", "clientVersion": "cvw6T6mZEiwxxElp", "deployment": "MYSWIeVzm7z9noow", "fallbackClaimKeys": ["mlTIKVowi0RY2VN4", "ZONJREdUQ3z9F1Bx", "NNgnke4akncw7wu9"], "inactiveTimeout": 94, "inviteTimeout": 25, "joinability": "B8Vj7rXFgDnDkdZ9", "matchPool": "bpjb1tdA3QhjCMW6", "maxPlayers": 18, "minPlayers": 10, "preferredClaimKeys": ["hsYpKPlXn77AtYoF", "zLAATPY8P8P3cfoi", "vvQxevecWw7Rry0K"], "requestedRegions": ["K5rgAGO0dW8rX2MV", "UGKSZ4GcLkt4pK32", "sJxlZcCTpTdRtCHv"], "teams": [{"UserIDs": ["uk6B6XTmSLyn50si", "gBVZxiKdV57GvRyd", "9UuL02Le8HSCslsD"], "parties": [{"partyID": "d4M1F5qRIblS7Nz8", "userIDs": ["1GRazPAANjfBoldF", "OyqA2clJ5gEOaCgM", "6Yn6RugbNEIpGBFU"]}, {"partyID": "jOn5mM7k8nbLzvtC", "userIDs": ["IW5ynMKquUicAeIV", "XtoWAXhMlW4tLqX7", "OICf5oD1e6oI9FmY"]}, {"partyID": "el0kOw72o8Zkgk0j", "userIDs": ["S6rDWUwfhKvrf2Aa", "H4yCWrHSppnIZkNn", "Tn3rzH5NvAtcvNed"]}]}, {"UserIDs": ["gS1fUfKmihDbmu8e", "PWlQMVDXEHeiGTnw", "yEw6hIWDZrpP7rz3"], "parties": [{"partyID": "ISW510kHr4isTKWj", "userIDs": ["mv67nuHCXWfwnwGi", "oVwVzmmBVVFfpqx1", "AeLtzcPJ3jtDYBo4"]}, {"partyID": "FUTH7CGfKSyxgRR1", "userIDs": ["DiCqSMzpqIFGLkDs", "7ACC1RgBfoNrHlFi", "2qJLgmBLE35YhyiD"]}, {"partyID": "V90SeI5yppBHoytV", "userIDs": ["znCgNyx9fbT63ShE", "h8PbGikLjgjcj34u", "ulU6FYBZsWFbr3RS"]}]}, {"UserIDs": ["P0W9nBhvhf8Q0DtJ", "McYQdN66bswAgt65", "X4N1LQZmB61JMdtw"], "parties": [{"partyID": "CVUrYQue84dwmbwF", "userIDs": ["EnAZaWsQJtRYoagR", "JK5PX9UcOvhPyE11", "TRT2SKseoe8VLie0"]}, {"partyID": "LBa36KNzjf005CXN", "userIDs": ["GehQ2aTjTDfKFDXC", "7eGL5YhJDWh9YWqc", "0qgV6d9yOfIMLds2"]}, {"partyID": "DbPcaoMdtRLTmSvT", "userIDs": ["kQQgB7exYvmHMxr5", "hPCJJztJBg0tTJg4", "6IewOXE2AkCh3QIZ"]}]}], "ticketIDs": ["sUf8lGFXcmwTERHc", "lOdxIwqejxe18rNd", "b8Otq6j1mqUav7k0"], "type": "5HAQltnSojV4jT65", "version": 49}' \
    > test.out 2>&1
eval_tap $? 30 'PatchUpdateGameSession' test.out

#- 31 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LT4AbGptKaWNvPbp' \
    --body '{"backfillTicketID": "g7yrRvXfZ6rvgvEY"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateGameSessionBackfillTicketID' test.out

#- 32 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3Hht1SwqTsKKKo37' \
    > test.out 2>&1
eval_tap $? 32 'GameSessionGenerateCode' test.out

#- 33 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'NHDOQe91Ps3ztUIV' \
    > test.out 2>&1
eval_tap $? 33 'PublicRevokeGameSessionCode' test.out

#- 34 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0dS6hIH9c4Vfkyrw' \
    --body '{"platformID": "puXxbaERbfgPmi0e", "userID": "Hkt1mr9EOIFg0dnW"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicGameSessionInvite' test.out

#- 35 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'IYN2NVL70Iw157g0' \
    > test.out 2>&1
eval_tap $? 35 'JoinGameSession' test.out

#- 36 PublicPromoteGameSessionLeader
./ng net.accelbyte.sdk.cli.Main session publicPromoteGameSessionLeader \
    --namespace "$AB_NAMESPACE" \
    --sessionId '0jr9b8MuYmmeKTmB' \
    --body '{"leaderID": "NvGYxEQdf3ewoGGo"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicPromoteGameSessionLeader' test.out

#- 37 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Y7xmFNAmjDDCvs78' \
    > test.out 2>&1
eval_tap $? 37 'LeaveGameSession' test.out

#- 38 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mcMdiS76YApGJ9uf' \
    > test.out 2>&1
eval_tap $? 38 'PublicGameSessionReject' test.out

#- 39 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wLYkqIgLuZS6hsQr' \
    --body '{"additionalMembers": [{"partyID": "yiEtOAbpeUNf26Uq", "userIDs": ["kCfgCUYBn2xaOBdP", "F0JmX8qwU1cTuHHP", "B5S3DvPRCzBrVUxm"]}, {"partyID": "DOj3cvRFaTC11W0T", "userIDs": ["GTCm4fZWuk6pQxDQ", "pKqxLGeMvr9TsvcM", "Q7dBsaIecRxIsZvD"]}, {"partyID": "6rmzVr5XT1Nxw0v1", "userIDs": ["dMQ9Rrbk6C2cVWf6", "ttvbU1PO6ApCD2VX", "idT7w0Oc15N8WXBP"]}], "proposedTeams": [{"UserIDs": ["p17PAewqSm5x3B4t", "7WQnp8jXZedgt5cy", "Ne27HLtwtVOaxgP6"], "parties": [{"partyID": "Jbct8puMybYGxD9I", "userIDs": ["PmmsLmu3kaPj0O4z", "d8Tb7cUNGPTBxiFF", "Crn7djjs69FTFVGU"]}, {"partyID": "VhvKhJCmeisql14m", "userIDs": ["UHVbMPimNhcZsU3V", "AdMDcb4qlkiFAamq", "vZI2KwjqPBiWXade"]}, {"partyID": "41s3rH34mB2yPlRp", "userIDs": ["WjmHZAAvKTH8MuqI", "g0CzkguwuJCW7EEF", "B67AODbi9BzupBsF"]}]}, {"UserIDs": ["pYc77GtRUcCFeY5g", "4XgBsbfzqxBPNe8a", "e1Il4aAtEbu4IjGd"], "parties": [{"partyID": "qthRxTjQ7gkZEY8r", "userIDs": ["G0q0Q2Qd2JzRbkF2", "I03dIjvBbA6bfbYa", "JCJjfk2TUvn95FhO"]}, {"partyID": "7VW3mbDVMDu87t0l", "userIDs": ["dWf7iSGIiKFtWtn4", "Yr2svKM6pqLGZ0TB", "ujELAUK6mQ5iZgbw"]}, {"partyID": "wm5iGzXtcknrgidK", "userIDs": ["upvXO6aj4hCmTC34", "jxW4pIDwdqXpmRmu", "t9H9XyWI8bp8fQxR"]}]}, {"UserIDs": ["uX91uYmtrHJbEGTU", "j7YjERL1rEQG02zc", "cA8wvLsWUNd6lPKv"], "parties": [{"partyID": "qDejvqklTSvDwuOr", "userIDs": ["P9lzpiX0VuFpZum7", "izxe7NPzjOa8E7wY", "76PxLv9HBEUe89Aw"]}, {"partyID": "Ew1HO4FnKtx4XLKA", "userIDs": ["mlDr19uJ3nq6Verz", "VCcI8y3Cz0YqCKUh", "5RD9vNAp4jinFpnQ"]}, {"partyID": "5xF9wwbvMZyeDeRn", "userIDs": ["VfPUa6xVVBcq3wZp", "FIYeAg79HcLJXJ7m", "pVI6eTYAjdPlCiQQ"]}]}], "version": 59}' \
    > test.out 2>&1
eval_tap $? 39 'AppendTeamGameSession' test.out

#- 40 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SpWBAetsanzqP8ox"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicPartyJoinCode' test.out

#- 41 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'frtbECD1CYPwaiBA' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetParty' test.out

#- 42 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xfYL8Avt70ZUT2fS' \
    --body '{"attributes": {"k3LL0calqxEewuGS": {}, "469k2hG0WKt4sUma": {}, "nYxM0UHZVNYzGMNI": {}}, "inactiveTimeout": 32, "inviteTimeout": 3, "joinability": "WoSLkUrfuf4U3WeY", "maxPlayers": 9, "minPlayers": 5, "type": "A9t2ENKKWrFtHIi1", "version": 59}' \
    > test.out 2>&1
eval_tap $? 42 'PublicUpdateParty' test.out

#- 43 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'u4FnS98QqftSjq7s' \
    --body '{"attributes": {"n8yreciPLfkVyyJs": {}, "bGpO6JgehDJxEN7J": {}, "lZc8LMq1o2jZWu4y": {}}, "inactiveTimeout": 55, "inviteTimeout": 6, "joinability": "3r0u4q1bTHXIjfJK", "maxPlayers": 51, "minPlayers": 65, "type": "EUl07bhwntCVqiYO", "version": 72}' \
    > test.out 2>&1
eval_tap $? 43 'PublicPatchUpdateParty' test.out

#- 44 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lKNchPHNL4X3LLaG' \
    > test.out 2>&1
eval_tap $? 44 'PublicGeneratePartyCode' test.out

#- 45 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'PGdqLE8SohhhuiTn' \
    > test.out 2>&1
eval_tap $? 45 'PublicRevokePartyCode' test.out

#- 46 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JarYYkHBDdSzBXdx' \
    --body '{"platformID": "apwhd5IQYBQuxLvP", "userID": "uWYvE3fsNy9Z9Ohx"}' \
    > test.out 2>&1
eval_tap $? 46 'PublicPartyInvite' test.out

#- 47 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'XvCp9y7fLD2qfCXn' \
    --body '{"leaderID": "lUnqxT1WsRNMZcA9"}' \
    > test.out 2>&1
eval_tap $? 47 'PublicPromotePartyLeader' test.out

#- 48 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId '2hzC7MNa8vVe4MHX' \
    > test.out 2>&1
eval_tap $? 48 'PublicPartyJoin' test.out

#- 49 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '6AgMep90AyyUJyAK' \
    > test.out 2>&1
eval_tap $? 49 'PublicPartyLeave' test.out

#- 50 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '5PRMRMwdvl0hv6g6' \
    > test.out 2>&1
eval_tap $? 50 'PublicPartyReject' test.out

#- 51 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '2GxBW2tQF5tkTjgJ' \
    --userId 'aMYvNQOsDa4bkcge' \
    > test.out 2>&1
eval_tap $? 51 'PublicPartyKick' test.out

#- 52 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"pqtxjbrztee7QLTG": {}, "Aak7Kaol01DK97D2": {}, "xnik42miteR5eQAe": {}}, "configurationName": "1rzmmgqBPRmd6mO4", "inactiveTimeout": 30, "inviteTimeout": 83, "joinability": "I8KDqebm83raNBJ5", "maxPlayers": 51, "members": [{"ID": "SGSUOK68eqGJtWf1", "PlatformID": "Ybgg8rdwY9bmrvHm", "PlatformUserID": "O07KNqX9LM2IwEsd"}, {"ID": "OGBXBwnzDX8v3xgC", "PlatformID": "1Ge9PdbTTAJ2Gp1r", "PlatformUserID": "0sVZ6LJAOddIL2l3"}, {"ID": "hPjNDKv2LWfXqjr8", "PlatformID": "fS79En3wYowBdkaZ", "PlatformUserID": "3y6i38XQjLDRqkpi"}], "minPlayers": 65, "textChat": true, "type": "5BtiQ272Uo9UBJWo"}' \
    > test.out 2>&1
eval_tap $? 52 'PublicCreateParty' test.out

#- 53 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["dpdwsX1jorcyR0x3", "YiHF8ITGPRQBCgIs", "1Q2lzxl0yF5m77TT"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 54 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'PublicGetPlayerAttributes' test.out

#- 55 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "hNcECWwchW6zL9Sk", "data": {"bLlrNXnGanMazb8j": {}, "vRWenURH48aJuALE": {}, "cSqcE15u6D31DjOs": {}}, "platforms": [{"name": "rs3CUYATdqnQGbqi", "userID": "qOkNeATj7eGjodd7"}, {"name": "CcJUrI6MAugK5kyp", "userID": "Nrp2nFe9FmN86sK5"}, {"name": "LOq4ft5jGcMICPUY", "userID": "nfG6jl9U4jReteIM"}], "roles": ["gzISomCsodJrhQW4", "1q2OspCZbt3Uta5I", "0uGcL1koyHjCH5ol"]}' \
    > test.out 2>&1
eval_tap $? 55 'PublicStorePlayerAttributes' test.out

#- 56 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'PublicDeletePlayerAttributes' test.out

#- 57 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'YLETRpABAmO2EGvJ' \
    --orderBy '4UMS93yOxNInDByh' \
    --status 'noluO6ti0QP2ssiJ' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryMyGameSessions' test.out

#- 58 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '66OzOj84O6tgohjt' \
    --orderBy 'C7bzjPpucddXJ5zi' \
    --status 'fF8y959anrNSleyw' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE