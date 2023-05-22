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
echo "1..52"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 55, "SessionTitle": "wYCA9kPI6LZrkq6D", "ShouldSync": false, "XboxServiceConfigID": "UzVRiXbqlAw7r6W2", "XboxSessionTemplateName": "ktQG0h5JAav5kRa6"}, "clientVersion": "2WopBJHPtcDs8bBZ", "deployment": "LCXLx8bbgorQeFbQ", "dsSource": "1g7qbPngUNB1vRod", "fallbackClaimKeys": ["wpzS6DaDpv8N7ZQV", "qGj6oDLjWjkY1aXl", "FcDtgOjchIua5tWE"], "inactiveTimeout": 71, "inviteTimeout": 59, "joinability": "JSDgY1TXp38zsCTC", "maxPlayers": 36, "minPlayers": 5, "name": "bCbPOyNQkT7NvyE3", "persistent": false, "preferredClaimKeys": ["8mAQLnzjMf8GZ2WB", "ZqxYG3aREAu2D6QV", "KNCWP75TB0i7pKxR"], "requestedRegions": ["8dl0zRVW4EZG9m0X", "cgGVbMqSszE8GHav", "j7AorKsxwkosAVer"], "textChat": false, "type": "pc1C8XfwHuKeb9l3"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateConfigurationTemplateV1' test.out

#- 10 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetAllConfigurationTemplatesV1' test.out

#- 11 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'mXhzkzWkFeZSoEAc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetConfigurationTemplateV1' test.out

#- 12 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'BdW19m4eu6d5tA5j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 96, "SessionTitle": "uuyZ0GhDogqrhBRd", "ShouldSync": false, "XboxServiceConfigID": "5MYzYiKWe5dNRljv", "XboxSessionTemplateName": "7IPrDQQRgat0Sevk"}, "clientVersion": "LGMS0lyuI9a2I9u6", "deployment": "Vpbsx5w8hqUI06Up", "dsSource": "OXGSLmCVuHOPlLlk", "fallbackClaimKeys": ["vR8sKgnuRkgghGoY", "upD391C2qtPYokah", "FjkQsfCaTmt1d67F"], "inactiveTimeout": 67, "inviteTimeout": 20, "joinability": "VLisV6zwPuo3td6T", "maxPlayers": 57, "minPlayers": 38, "name": "6I3lMjGSWN2laRlx", "persistent": false, "preferredClaimKeys": ["NeIxPz6MbwL6IY69", "z1UaLqYSYWytLPzi", "ZMdjxcBZufQxGiHP"], "requestedRegions": ["llG4cYEzfTD1ZBm3", "MqHcUmLZZbSqb8Rw", "Nmn9HrNQy4uZAAiE"], "textChat": true, "type": "mit9RGCCHYzUOcEd"}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationTemplateV1' test.out

#- 13 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'scKHPEqgA8yu7Vk6' \
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
    --configurationName 'Jt4Ymos9Jcdos4fY' \
    --dsPodName 'cTVU6RBt0zYoMcHy' \
    --fromTime 'CUEXlAvxJMdalwSy' \
    --gameMode 'liWMNW5NyLu0M3VH' \
    --isPersistent 'h2EI8JlDbPWbQ6Q9' \
    --isSoftDeleted 'lNmqRBaAkLnvxkT1' \
    --joinability 'X68cmDc3fxU8MyKr' \
    --limit '88' \
    --matchPool '0v52Dlym6puQ23xo' \
    --memberID 'J8aeCnaLpUKp44YU' \
    --offset '60' \
    --order 'foWvXa3bMrXsDr6k' \
    --orderBy 'ILsSSyDdmykmoPYg' \
    --sessionID 'c2L4jk4Lo0LSP0pf' \
    --status '4IxjUkl535X3ateE' \
    --statusV2 'KDpADz1x3poD3Qgb' \
    --toTime '3boLQQ1MzH7Qm8bw' \
    > test.out 2>&1
eval_tap $? 16 'AdminQueryGameSessions' test.out

#- 17 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["bmXgdAPh1EThG96g", "AFKK2WDgCcxvONZm", "3EeERmDnyeFoF7VS"]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteBulkGameSessions' test.out

#- 18 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'Z6pf3vneSD2Tb3g7' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'mSQUhAEtrmjqU6YE' \
    --statusType '3p4lSck0ZHn5GI39' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateGameSessionMember' test.out

#- 19 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'YBHqaTHeKtW18iGe' \
    --key 'Ulc9d9sogWa24CKN' \
    --leaderID 'S0GqVvUfHQvsHXNU' \
    --limit '81' \
    --memberID 'd3PBddN8S48l9lyN' \
    --memberStatus 'ApflxqMrj3oZk03Q' \
    --offset '65' \
    --order 'cKMDYDDxHSZjtqXy' \
    --orderBy 'J58f7Gc26SaiGVky' \
    --value 'dwYWQG26yUZNmTBc' \
    > test.out 2>&1
eval_tap $? 19 'AdminQueryParties' test.out

#- 20 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'vrbYCwZtxFHyPLtI' \
    > test.out 2>&1
eval_tap $? 20 'AdminQueryPlayerAttributes' test.out

#- 21 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId '8ilbyDPUIj88cekd' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlayerAttributes' test.out

#- 22 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"qCt81P1ktfIovmv9": {}, "gsR5cJcHm3SZLxoR": {}, "DFuuuySj29a9LJE8": {}}, "backfillTicketID": "HoRS1X2PFAAMwzHP", "clientVersion": "xB1UskYs4Yw20DOq", "configurationName": "OBSC2DKHRuPMMWH8", "deployment": "Yb33T5UBJCjfcnLR", "dsSource": "fxeCSz9WEi8Klloe", "fallbackClaimKeys": ["H0JT1yduat2vQR3b", "iBfsu4jmsRE2w1yE", "kLgh3tIYt4SqYUTL"], "inactiveTimeout": 61, "inviteTimeout": 2, "joinability": "x9gIiDandpGT2t24", "matchPool": "aOMh5eC3IHeHSKLC", "maxPlayers": 1, "minPlayers": 58, "preferredClaimKeys": ["3xreNDUWehwH3q31", "A806DJgas4b6z3LN", "Uj7fdgLA84Z8YYk6"], "requestedRegions": ["QEgJjBbEDoNf3n0h", "EoRCAcf80zfFyabW", "AgIUXiI07A68eaqC"], "serverName": "2J9jyEW6GLbc0NaK", "teams": [{"UserIDs": ["DUL3sa13lk1dQBHO", "86IlBhnetU4RwTqU", "XlTDBzOuYsaZA2yy"], "parties": [{"partyID": "d4mbqoOfADMMAXFa", "userIDs": ["Y9eKa699bRVhyaKw", "wrAP2aMlu7WtjCto", "YetOO847g8OudOfj"]}, {"partyID": "nCuHZ3c46IjGa23Y", "userIDs": ["vYmmDg7VYPXIuvUY", "TZBRujIUE1Tq5jyA", "ZvkRCMNFIurjh2im"]}, {"partyID": "db4rbkXj0ZwsVC0g", "userIDs": ["L97ZVJSPqJiwv1ql", "YB1RSKs6gQxC3Gb7", "S0o4zGYY7KQI1AeF"]}]}, {"UserIDs": ["gPqaOkvo1aolB4lk", "KB4EYOkQ1jMD3cym", "8xIfkOVW2grREOLx"], "parties": [{"partyID": "0KOww3HICQLfl7MU", "userIDs": ["BG7qtPu64yAtURKL", "Rkb738HGS6rDgMdI", "IlhS1fSiM9331m7T"]}, {"partyID": "a1PsKc50Kv6ecnEe", "userIDs": ["vcAx2K2zkRenmPZn", "GBt4P7WnbdSJtjX7", "ZshZyZl5x4bRXBHU"]}, {"partyID": "TrDzZSKscfOcYu3d", "userIDs": ["pCROYqUiGKXVFCmp", "o6sPwVOEDSJsEK5Q", "pNhlI2iS5EpGhhvX"]}]}, {"UserIDs": ["Yck0upMzUYnb76tF", "kEORV3bu1bNCtX7W", "40V6Do5sYadCCFrH"], "parties": [{"partyID": "HC3DpZxkrQDXuNFv", "userIDs": ["iMarv8mnfHK8CCmE", "2lPnsbD3SGEdlwuU", "ccE536ugBp3HBvep"]}, {"partyID": "nDCjgyJlXe36mgWj", "userIDs": ["LfFmteue9nzJ6fH2", "4T805tVg8JqU0jZp", "jvsugAOS7u8RiWye"]}, {"partyID": "rCSa8SRgwsAj1ik1", "userIDs": ["jglaDXTvKCWwNTAh", "d2wrS0uPdjhdinpn", "g5BLy8wbhMssAHja"]}]}], "textChat": true, "ticketIDs": ["hiqjRJOqB5F93zFQ", "bJndUDpdONneAczb", "BdHb2slt71B1SmZp"], "type": "2JZp50CnPb71ORYc"}' \
    > test.out 2>&1
eval_tap $? 22 'CreateGameSession' test.out

#- 23 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"mQbTU5JX8ccLjMXJ": {}, "Rk0eaKQDOJvrTefg": {}, "lSs6g4iY9u02aCNY": {}}' \
    > test.out 2>&1
eval_tap $? 23 'PublicQueryGameSessions' test.out

#- 24 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'IWekp18lOC3mNqF7' \
    > test.out 2>&1
eval_tap $? 24 'GetGameSessionByPodName' test.out

#- 25 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Bl0LcghVHfPEspxw' \
    > test.out 2>&1
eval_tap $? 25 'GetGameSession' test.out

#- 26 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'hRON0bc1eMbEIjow' \
    --body '{"attributes": {"Lqc3ecjXJbZDKKox": {}, "LE1Y3Dymtj3giPg4": {}, "x4yiPX6ues1Hhhkg": {}}, "backfillTicketID": "1yLVbLFzHEP8cM4N", "clientVersion": "Twr0KHaAsmTej52W", "deployment": "Ki6tArAURt9plCSV", "fallbackClaimKeys": ["q8PdH6hJPUAc0RVw", "XgAgntLMCuaXBWQi", "6BqPg4xr0lCancUZ"], "inactiveTimeout": 66, "inviteTimeout": 45, "joinability": "CHsZYoLfR1KtOv7Z", "matchPool": "y0b65uvuKNuy0ytZ", "maxPlayers": 88, "minPlayers": 26, "preferredClaimKeys": ["7M6Nzy1adnSKOLFK", "x1dX4LuWJu3pDMUA", "eeZ97SBROPYuG6Xq"], "requestedRegions": ["P6oo7G73zdxTgOfn", "wIdlNa29fDLh741I", "slKHzGlLKWUtDQs6"], "teams": [{"UserIDs": ["1OQAoxyyQpRWCiiP", "DGQhNPEwiJCf2XJV", "rlzqQls1ozhLVA3k"], "parties": [{"partyID": "E8jKvgatOEBM70Td", "userIDs": ["lNBJYOmpu1VCarzB", "sV6xnZ5Jrzzjrcau", "g6CWVG8SWP3glU6m"]}, {"partyID": "uswVJnNnN7kAa7j0", "userIDs": ["riFc5HTHQIoVsGo7", "dwV9DBqFKHQkETJy", "TlUrwDTnoujQD4IE"]}, {"partyID": "iH9Z5qXn3aoRtlqO", "userIDs": ["ECohViHA5CzgFSy8", "X1A3PrIfapq5AAeM", "e4L3mDWORBVXTIIJ"]}]}, {"UserIDs": ["M9XsYIIZxiXNMR9B", "gaWcFX3SUBhyoTsM", "WPAxUMkawaGpAyrI"], "parties": [{"partyID": "wMif3BOdkocVTd4B", "userIDs": ["xqGWV6mTJ0sQs6XN", "bjvqhnUVLWu8olKd", "xL6ozRmDD0jJvlfV"]}, {"partyID": "5OemPYdYT7DROCjt", "userIDs": ["uzFMbAG9YI89hmgu", "B8FOTjMLo4b9rIzq", "YkEpstyVTBcrM8rG"]}, {"partyID": "0rH0zcswwVeMK6Mb", "userIDs": ["GIVIu8vvwLc7KY3u", "VoJXTIMtpgkieDyF", "97lGdMiHKxbWCYzo"]}]}, {"UserIDs": ["8yO2KTK9tmmOnYnO", "pas6ghP1y4Zi7s7Q", "Blk44Z44B1GZgKg4"], "parties": [{"partyID": "uKxaCgcGLuC3brWd", "userIDs": ["TYCfHkIySok5DiXZ", "tLW87rGysryod3dN", "QrmsApRA6HX3RwrK"]}, {"partyID": "t2ecozL0TOg54vCE", "userIDs": ["48L5oLF6M4lNa4JU", "MSHNgqRqCV7usamA", "NkZlOX9Sfo95HgXq"]}, {"partyID": "KhTPkwfLM9uSybRz", "userIDs": ["Wek2gZvRrvr0n9d9", "lvccKMLhrTrcBE2I", "tBS3KtKZWe8aoFzA"]}]}], "ticketIDs": ["yBME74HUtipUWYhW", "V1qx8CzPML52faXU", "r9Sk4lq2faBcAXXK"], "type": "lhvyH8paOJtxqMPp", "version": 4}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGameSession' test.out

#- 27 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'aG40NlncceIZSwgA' \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameSession' test.out

#- 28 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ikgzh4pTU0Am4DZh' \
    --body '{"attributes": {"l0bQxFJ3sWCqQpQ2": {}, "FbKPFMycMSQ4qfAa": {}, "cR0LgB5BUXvjcu2s": {}}, "backfillTicketID": "6w3VifnKqmTSoGH1", "clientVersion": "XEfY6QAYn6WQ5UBE", "deployment": "U1QAOHfZiGhxOdcu", "fallbackClaimKeys": ["DXSxSc3aZPV87pna", "08gxefTYKhuxaEc7", "M4P7UckSC6ePeN8i"], "inactiveTimeout": 38, "inviteTimeout": 67, "joinability": "BZOuYQJ03BAHZ7c5", "matchPool": "3q7akMpcmnnx6RVB", "maxPlayers": 36, "minPlayers": 21, "preferredClaimKeys": ["op9v7aZK3h65hbN1", "5zfQSfQrtfF3TQN0", "OcNDLr36vzohZyjM"], "requestedRegions": ["QAg5mPYhrLTyU8Oh", "gfY9JQYGF4bYXEcE", "Nx9xZlAchob44lON"], "teams": [{"UserIDs": ["DDwMvgI0HlyPR7wZ", "NiVsF6xG2mXEQdbz", "IVy8alncV7vWgSHd"], "parties": [{"partyID": "fo07UctPErqxyMyO", "userIDs": ["K06MqQBErxgjVByc", "vU4PbmRDcrg0DjQj", "BECXvea7H1m2lJFR"]}, {"partyID": "Z3ZprZ60zMjhTHeh", "userIDs": ["94TSenE5hCFkIf5w", "eqZ18MH57l2Zsrh9", "0ETtYmGukz3Mnlrj"]}, {"partyID": "cHp6B8Vj7rXFgDnD", "userIDs": ["kdZ9bpjb1tdA3Qhj", "CMW64f4XhIjSoTB2", "NMKtezapPr2QEPx3"]}]}, {"UserIDs": ["zTxBGtEJIYppuUSs", "KoHw2hyd12uSE7BE", "v3aevq6iohU1cg4W"], "parties": [{"partyID": "1IS3Uv1BpWoJBaqd", "userIDs": ["g2FHcunsS1lnaO2m", "9vqjhbeK2qN8g6x2", "PyYDo5R3hLiD5sf5"]}, {"partyID": "y1JsxJNGmyt0SQDU", "userIDs": ["DoWBZVGLlkUetzCA", "Wc9x1aMjgGim51T1", "07XIZRZ7tZdIs0xf"]}, {"partyID": "4czdt7zqmSKxOEQl", "userIDs": ["Vcx6GqsBq8vdhWVn", "uYLgpZehK0G2nmyu", "ViB9kRTcSQdTnNYG"]}]}, {"UserIDs": ["eAfYFG3wSkHKufBd", "S3ZOokZB4cXnAXyu", "Gz6LlxHv8SwyagYv"], "parties": [{"partyID": "DJ3w3UNgIGj2jZtE", "userIDs": ["YT8sIPSE1XXPzySa", "0sZoFS6xCOWMpyh9", "pMsQgb64ELbzDMwy"]}, {"partyID": "o4nIRysQdbufXjYn", "userIDs": ["SoIFeouC2m38kXrD", "ZWlGVE9sJ4NpUtKp", "6M9I6nEwnZhsjwJe"]}, {"partyID": "GwaPSDMZz95OYKiq", "userIDs": ["aZD63xe5rruJVfLG", "ea0ZtlzUcuHAXz0U", "V31MfuGaXsAuGsZa"]}]}], "ticketIDs": ["SHevO0TQNEI3kfab", "xJWWSI1ECUo1NPpe", "FhUztXDgB7n4C97u"], "type": "APP8PATLpUpxeJls", "version": 55}' \
    > test.out 2>&1
eval_tap $? 28 'PatchUpdateGameSession' test.out

#- 29 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'br3RSP0W9nBhvhf8' \
    --body '{"backfillTicketID": "Q0DtJMcYQdN66bsw"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateGameSessionBackfillTicketID' test.out

#- 30 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Agt65X4N1LQZmB61' \
    --body '{"platformID": "JMdtwCVUrYQue84d", "userID": "wmbwFEnAZaWsQJtR"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicGameSessionInvite' test.out

#- 31 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'YoagRJK5PX9UcOvh' \
    > test.out 2>&1
eval_tap $? 31 'JoinGameSession' test.out

#- 32 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PyE11TRT2SKseoe8' \
    > test.out 2>&1
eval_tap $? 32 'LeaveGameSession' test.out

#- 33 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'VLie0LBa36KNzjf0' \
    > test.out 2>&1
eval_tap $? 33 'PublicGameSessionReject' test.out

#- 34 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '05CXNGehQ2aTjTDf' \
    --body '{"additionalMembers": [{"partyID": "KFDXC7eGL5YhJDWh", "userIDs": ["9YWqc0qgV6d9yOfI", "MLds2DbPcaoMdtRL", "TmSvTkQQgB7exYvm"]}, {"partyID": "HMxr5hPCJJztJBg0", "userIDs": ["tTJg46IewOXE2AkC", "h3QIZsUf8lGFXcmw", "TERHclOdxIwqejxe"]}, {"partyID": "18rNdb8Otq6j1mqU", "userIDs": ["av7k05HAQltnSojV", "4jT65yclX2FtAz0v", "JjFIYWOaNdsimmkW"]}], "proposedTeams": [{"UserIDs": ["2miH3xRHAKy4QxZk", "aXZ7vmiEd0JPxVyQ", "pshaDwNqTbbFMXAM"], "parties": [{"partyID": "fVXe0GZeMgsRsmH1", "userIDs": ["EQrYmkPKTPOlhTtS", "iZNCxuogFteTHJe4", "BhSSQkQD6WmOt6D7"]}, {"partyID": "ufFVTOhvQpfbBke8", "userIDs": ["aEdd36xj6wySoltD", "xsbzxrlaKEfkoYjY", "2o6ouRW9UtNquwC3"]}, {"partyID": "WgumrIz4NhGztZpr", "userIDs": ["4U4fwQIiLXgmRasv", "jO4lj8m3XEwP2b4g", "d3xOeii8Jnmssep2"]}]}, {"UserIDs": ["xD2NY0kABeGs9yxa", "hld1pO0Gyf5PO3CO", "yMvczgEpzZ3Fbtxf"], "parties": [{"partyID": "hcRC7IVYa6iZ5uFR", "userIDs": ["YNn3SHiWxF0YbuU5", "ar5qTLWUCy0Afgc0", "50XIZRW491e94mQj"]}, {"partyID": "VOOBnIWhunElqZUo", "userIDs": ["dp3IhtCSHy1ei1fI", "rPvfHnRN06EjRwEQ", "lNapJRfk4f9Zcw1p"]}, {"partyID": "EHAyNFxcVTKuAQTG", "userIDs": ["h5BxjWOozGoDtsUu", "Yo5p8ED5QZAufwNa", "8lzfjv9oYMXMjlVH"]}]}, {"UserIDs": ["Y1AHwF3vGoav7MK0", "PcLnEkcokKwcQ0ba", "DT9OyJ2h23GUS2am"], "parties": [{"partyID": "U7syGlElXdEAOrVS", "userIDs": ["nLocLVVYamQc4wcG", "5nDBLJoJHbiQ5duE", "5p4cfs2E41cK8QTw"]}, {"partyID": "iIAvxSvNDlmM5nQF", "userIDs": ["MGzs7fzjgyc44mEh", "9tRk8knYSV30lnro", "QehMDli6t9unQLYX"]}, {"partyID": "xm09wpGAbpEmDY9v", "userIDs": ["Lh3u6EDsUmrV6kH4", "OotKwG3UC6XCnnZx", "F8CmQr17W65br34r"]}]}], "version": 57}' \
    > test.out 2>&1
eval_tap $? 34 'AppendTeamGameSession' test.out

#- 35 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "95FhO7VW3mbDVMDu"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicPartyJoinCode' test.out

#- 36 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '87t0ldWf7iSGIiKF' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetParty' test.out

#- 37 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'tWtn4Yr2svKM6pqL' \
    --body '{"attributes": {"GZ0TBujELAUK6mQ5": {}, "iZgbwwm5iGzXtckn": {}, "rgidKupvXO6aj4hC": {}}, "inactiveTimeout": 26, "inviteTimeout": 92, "joinability": "NDBvQvRPnAz4VzW0", "maxPlayers": 59, "minPlayers": 89, "type": "poBCbyJsF5IjF1c0", "version": 100}' \
    > test.out 2>&1
eval_tap $? 37 'PublicUpdateParty' test.out

#- 38 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xRuX91uYmtrHJbEG' \
    --body '{"attributes": {"TUj7YjERL1rEQG02": {}, "zccA8wvLsWUNd6lP": {}, "KvqDejvqklTSvDwu": {}}, "inactiveTimeout": 83, "inviteTimeout": 90, "joinability": "rP9lzpiX0VuFpZum", "maxPlayers": 70, "minPlayers": 17, "type": "fHgKjI9mwJSrN8jk", "version": 70}' \
    > test.out 2>&1
eval_tap $? 38 'PublicPatchUpdateParty' test.out

#- 39 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '6PxLv9HBEUe89AwE' \
    > test.out 2>&1
eval_tap $? 39 'PublicGeneratePartyCode' test.out

#- 40 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'w1HO4FnKtx4XLKAm' \
    > test.out 2>&1
eval_tap $? 40 'PublicRevokePartyCode' test.out

#- 41 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'lDr19uJ3nq6VerzV' \
    --body '{"platformID": "CcI8y3Cz0YqCKUh5", "userID": "RD9vNAp4jinFpnQ5"}' \
    > test.out 2>&1
eval_tap $? 41 'PublicPartyInvite' test.out

#- 42 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xF9wwbvMZyeDeRnV' \
    --body '{"leaderID": "fPUa6xVVBcq3wZpF"}' \
    > test.out 2>&1
eval_tap $? 42 'PublicPromotePartyLeader' test.out

#- 43 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IYeAg79HcLJXJ7mp' \
    > test.out 2>&1
eval_tap $? 43 'PublicPartyJoin' test.out

#- 44 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'VI6eTYAjdPlCiQQC' \
    > test.out 2>&1
eval_tap $? 44 'PublicPartyLeave' test.out

#- 45 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId '35cj4KyOVgvnWbfR' \
    > test.out 2>&1
eval_tap $? 45 'PublicPartyReject' test.out

#- 46 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'JtsB7cUQZ2QUAxJr' \
    --userId 'INPXppPNO3AfmXcg' \
    > test.out 2>&1
eval_tap $? 46 'PublicPartyKick' test.out

#- 47 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"wC3IN6tvKgLB9QmJ": {}, "IOq9dP5szG71utjs": {}, "Q4CrRb9gUCeVz7fW": {}}, "configurationName": "bZIdhevfZvyV7Aco", "inactiveTimeout": 8, "inviteTimeout": 9, "joinability": "cZwKjYDdmJOlzwm9", "maxPlayers": 92, "members": [{"ID": "CMgKAOG5iDcCR5Pb", "PlatformID": "CvDLil8wj9cKM3Ar", "PlatformUserID": "6MF35hCER4nGmWGg"}, {"ID": "TJfHlJl4tHGa4XfZ", "PlatformID": "cd9CVnGqMX9FieeE", "PlatformUserID": "ssWEUl07bhwntCVq"}, {"ID": "iYOJf5KwMZQjzvjS", "PlatformID": "ozv6CTRDl0zp9CzH", "PlatformUserID": "FwinkBNi4gvqgl6T"}], "minPlayers": 8, "textChat": true, "type": "GVPmv34h6T7Esufm"}' \
    > test.out 2>&1
eval_tap $? 47 'PublicCreateParty' test.out

#- 48 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'PublicGetPlayerAttributes' test.out

#- 49 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "uWYvE3fsNy9Z9Ohx", "data": {"XvCp9y7fLD2qfCXn": {}, "lUnqxT1WsRNMZcA9": {}, "2hzC7MNa8vVe4MHX": {}}, "platforms": [{"name": "6AgMep90AyyUJyAK", "userID": "5PRMRMwdvl0hv6g6"}, {"name": "2GxBW2tQF5tkTjgJ", "userID": "aMYvNQOsDa4bkcge"}, {"name": "pqtxjbrztee7QLTG", "userID": "Aak7Kaol01DK97D2"}], "roles": ["xnik42miteR5eQAe", "1rzmmgqBPRmd6mO4", "oI8KDqebm83raNBJ"]}' \
    > test.out 2>&1
eval_tap $? 49 'PublicStorePlayerAttributes' test.out

#- 50 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'PublicDeletePlayerAttributes' test.out

#- 51 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order '5y7axEkvI4oxZEDx' \
    --orderBy 'GiBnNbn0zaf7CaOS' \
    --status 'lHXrUSA6sMJzA5mt' \
    > test.out 2>&1
eval_tap $? 51 'PublicQueryMyGameSessions' test.out

#- 52 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'qISQ83TTbtefXWzn' \
    --orderBy 'De4LQdXfFBii2RAM' \
    --status 'EX5RMjBFVZGYzQqV' \
    > test.out 2>&1
eval_tap $? 52 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE