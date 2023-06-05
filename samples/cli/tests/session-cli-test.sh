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
echo "1..56"

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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 55, "PSNSupportedPlatforms": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"], "SessionTitle": "n8mzZ0m8SAMTwE6I", "ShouldSync": true, "XboxServiceConfigID": "IaRDBXxyaNoMR6hk", "XboxSessionTemplateName": "spInrAip6lyzSxwE"}, "clientVersion": "lFHHdgs21Jub74CU", "deployment": "kNmKJfh5pUkHODpo", "dsSource": "MF78NY4YkHs1cnz1", "fallbackClaimKeys": ["JSDgY1TXp38zsCTC", "rbCbPOyNQkT7NvyE", "3cwyALczNIicXm7a"], "inactiveTimeout": 13, "inviteTimeout": 55, "joinability": "SrjJW2OQNOs1PXhT", "maxActiveSessions": 74, "maxPlayers": 64, "minPlayers": 81, "name": "vdiRilZ7oFgx4c8O", "persistent": true, "preferredClaimKeys": ["l0zRVW4EZG9m0Xcg", "GVbMqSszE8GHavj7", "AorKsxwkosAVerXp"], "requestedRegions": ["c1C8XfwHuKeb9l3r", "GN9A3sNm84hddSpH", "t0P7MIIR7CkyF6C7"], "textChat": false, "type": "UmiTqpyhPFdxLzFQ"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateConfigurationTemplateV1' test.out

#- 10 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetAllConfigurationTemplatesV1' test.out

#- 11 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '5MYzYiKWe5dNRljv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetConfigurationTemplateV1' test.out

#- 12 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name '7IPrDQQRgat0Sevk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 76, "PSNSupportedPlatforms": ["KYnIuMBvaO35llzQ", "RaT5kPxUfofvnnSu", "B0y5WUlrMdI4sNve"], "SessionTitle": "abntBSxTeIv53HGC", "ShouldSync": false, "XboxServiceConfigID": "pD391C2qtPYokahF", "XboxSessionTemplateName": "jkQsfCaTmt1d67FX"}, "clientVersion": "Gk2s9Q0mPVo3twu0", "deployment": "MesTCf9x4rt69lna", "dsSource": "7qxNeIxPz6MbwL6I", "fallbackClaimKeys": ["Y69z1UaLqYSYWytL", "PziZMdjxcBZufQxG", "iHPllG4cYEzfTD1Z"], "inactiveTimeout": 56, "inviteTimeout": 30, "joinability": "m3MqHcUmLZZbSqb8", "maxActiveSessions": 90, "maxPlayers": 45, "minPlayers": 15, "name": "Nmn9HrNQy4uZAAiE", "persistent": true, "preferredClaimKeys": ["mit9RGCCHYzUOcEd", "scKHPEqgA8yu7Vk6", "Jt4Ymos9Jcdos4fY"], "requestedRegions": ["cTVU6RBt0zYoMcHy", "CUEXlAvxJMdalwSy", "liWMNW5NyLu0M3VH"], "textChat": false, "type": "JCSQT279ZZPYGu0r"}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateConfigurationTemplateV1' test.out

#- 13 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'dlgdWyOtXi3choQr' \
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
    --configurationName 'pOsDBU5SepjChB3V' \
    --dsPodName '0v52Dlym6puQ23xo' \
    --fromTime 'J8aeCnaLpUKp44YU' \
    --gameMode 'DjasWIPUvmEejtGe' \
    --isPersistent 'oyIPa8ZRrvjj7il3' \
    --isSoftDeleted '5MXbN9oCMNqq98Sj' \
    --joinability 'TvhZNkSQ70D0H6BX' \
    --limit '22' \
    --matchPool 'KDpADz1x3poD3Qgb' \
    --memberID '3boLQQ1MzH7Qm8bw' \
    --offset '2' \
    --order 'te9NDUPVJf6c2Z0Q' \
    --orderBy 'ZxfgPubTDIHrvqAT' \
    --sessionID 'huwjRHpKKTlmVr9X' \
    --status 'uoJbRFQSKVPHbn4X' \
    --statusV2 'xtu7LQRENjEEztx1' \
    --toTime 'WsYSiZqan0nSBJro' \
    > test.out 2>&1
eval_tap $? 16 'AdminQueryGameSessions' test.out

#- 17 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["av91GXlvPG6bFYRe", "VHQipcCx9Zw5D2L7", "vIYhGGSyEW4ZJJ42"]}' \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteBulkGameSessions' test.out

#- 18 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'd3PBddN8S48l9lyN' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ApflxqMrj3oZk03Q' \
    --statusType 'XcKMDYDDxHSZjtqX' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateGameSessionMember' test.out

#- 19 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'yJ58f7Gc26SaiGVk' \
    --key 'ydwYWQG26yUZNmTB' \
    --leaderID 'cvrbYCwZtxFHyPLt' \
    --limit '71' \
    --memberID 'rDjqoxcwgGLXpUL4' \
    --memberStatus 'pp2ncYAHdNzDmeIP' \
    --offset '13' \
    --order 'rOvDz9KOsb392k6Y' \
    --orderBy 'mJFfRByjlBiuFM3F' \
    --partyID 'IoVk8T3GpAnkCmBU' \
    --value 'qg2SCnqntX9y1aZS' \
    > test.out 2>&1
eval_tap $? 19 'AdminQueryParties' test.out

#- 20 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'WMiVi10sG6vxkfUc' \
    > test.out 2>&1
eval_tap $? 20 'AdminQueryPlayerAttributes' test.out

#- 21 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'mqRRbceJ5i0EeDxO' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlayerAttributes' test.out

#- 22 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"gBnhhqElIaDml48w": {}, "dNFLTm5T50x9WT0G": {}, "fH2rtOa4EXsXzOXQ": {}}, "backfillTicketID": "Ak4mqrxzTtuLl4Xl", "clientVersion": "bGL8QOxtjzm8y2wN", "configurationName": "hmwoYZyI4EFZKBcY", "deployment": "rCEAE7WIsfmx40NL", "dsSource": "Rc6m8heKnWhzfe2N", "fallbackClaimKeys": ["ubeoKFeIaFQCYoDP", "ICpnduEEQlULdJz4", "mnRBkMNxvvKgAT8m"], "inactiveTimeout": 72, "inviteTimeout": 36, "joinability": "AgIUXiI07A68eaqC", "matchPool": "2J9jyEW6GLbc0NaK", "maxPlayers": 61, "minPlayers": 54, "preferredClaimKeys": ["UL3sa13lk1dQBHO8", "6IlBhnetU4RwTqUX", "lTDBzOuYsaZA2yyd"], "requestedRegions": ["4mbqoOfADMMAXFaY", "9eKa699bRVhyaKww", "rAP2aMlu7WtjCtoY"], "serverName": "etOO847g8OudOfjn", "teams": [{"UserIDs": ["CuHZ3c46IjGa23Yv", "YmmDg7VYPXIuvUYT", "ZBRujIUE1Tq5jyAZ"], "parties": [{"partyID": "vkRCMNFIurjh2imd", "userIDs": ["b4rbkXj0ZwsVC0gL", "97ZVJSPqJiwv1qlY", "B1RSKs6gQxC3Gb7S"]}, {"partyID": "0o4zGYY7KQI1AeFg", "userIDs": ["PqaOkvo1aolB4lkK", "B4EYOkQ1jMD3cym8", "xIfkOVW2grREOLx0"]}, {"partyID": "KOww3HICQLfl7MUB", "userIDs": ["G7qtPu64yAtURKLR", "kb738HGS6rDgMdII", "lhS1fSiM9331m7Ta"]}]}, {"UserIDs": ["1PsKc50Kv6ecnEev", "cAx2K2zkRenmPZnG", "Bt4P7WnbdSJtjX7Z"], "parties": [{"partyID": "shZyZl5x4bRXBHUT", "userIDs": ["rDzZSKscfOcYu3dp", "CROYqUiGKXVFCmpo", "6sPwVOEDSJsEK5Qp"]}, {"partyID": "NhlI2iS5EpGhhvXY", "userIDs": ["ck0upMzUYnb76tFk", "EORV3bu1bNCtX7W4", "0V6Do5sYadCCFrHH"]}, {"partyID": "C3DpZxkrQDXuNFvi", "userIDs": ["Marv8mnfHK8CCmE2", "lPnsbD3SGEdlwuUc", "cE536ugBp3HBvepn"]}]}, {"UserIDs": ["DCjgyJlXe36mgWjL", "fFmteue9nzJ6fH24", "T805tVg8JqU0jZpj"], "parties": [{"partyID": "vsugAOS7u8RiWyer", "userIDs": ["CSa8SRgwsAj1ik1j", "glaDXTvKCWwNTAhd", "2wrS0uPdjhdinpng"]}, {"partyID": "5BLy8wbhMssAHjap", "userIDs": ["IkY9Rf4wP57dBZNR", "88YbCtmKy8M9zVrj", "fGXZnqAQUoY1GjlI"]}, {"partyID": "Ik0iKoTTS1j02o7J", "userIDs": ["jTXAQN0qdskdQV0T", "qI8EFnmDbxIxi4YK", "lONk2Q5Y4Jvaizwi"]}]}], "textChat": false, "ticketIDs": ["Wekp18lOC3mNqF7B", "l0LcghVHfPEspxwh", "RON0bc1eMbEIjowL"], "type": "qc3ecjXJbZDKKoxL"}' \
    > test.out 2>&1
eval_tap $? 22 'CreateGameSession' test.out

#- 23 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"E1Y3Dymtj3giPg4x": {}, "4yiPX6ues1Hhhkg1": {}, "yLVbLFzHEP8cM4NT": {}}' \
    > test.out 2>&1
eval_tap $? 23 'PublicQueryGameSessions' test.out

#- 24 PublicSessionJoinCode
./ng net.accelbyte.sdk.cli.Main session publicSessionJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "wr0KHaAsmTej52WK"}' \
    > test.out 2>&1
eval_tap $? 24 'PublicSessionJoinCode' test.out

#- 25 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'i6tArAURt9plCSVq' \
    > test.out 2>&1
eval_tap $? 25 'GetGameSessionByPodName' test.out

#- 26 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '8PdH6hJPUAc0RVwX' \
    > test.out 2>&1
eval_tap $? 26 'GetGameSession' test.out

#- 27 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gAgntLMCuaXBWQi6' \
    --body '{"attributes": {"BqPg4xr0lCancUZG": {}, "CHsZYoLfR1KtOv7Z": {}, "y0b65uvuKNuy0ytZ": {}}, "backfillTicketID": "Q7M6Nzy1adnSKOLF", "clientVersion": "Kx1dX4LuWJu3pDMU", "deployment": "AeeZ97SBROPYuG6X", "fallbackClaimKeys": ["qP6oo7G73zdxTgOf", "nwIdlNa29fDLh741", "IslKHzGlLKWUtDQs"], "inactiveTimeout": 77, "inviteTimeout": 76, "joinability": "OQAoxyyQpRWCiiPD", "matchPool": "GQhNPEwiJCf2XJVr", "maxPlayers": 24, "minPlayers": 52, "preferredClaimKeys": ["Mca5afj12K2IzrBv", "vWm4udE0OXudXgNn", "e8kJATwlc6esUp6S"], "requestedRegions": ["w1I98jeZQ7hfxnhL", "d3Knaknoed9DHhLO", "qQGhCUr6iTrjyEga"], "teams": [{"UserIDs": ["rAdNJOIG36I6tRbR", "crEveMdAdiPKDUVS", "C00PYeDcagginxnF"], "parties": [{"partyID": "Ina3yddcbsPheTH2", "userIDs": ["6IUJNvYuGRUvpZaH", "CuESOiIZsMfB4ZH3", "mtgWgU4pCAKxeE70"]}, {"partyID": "CaunQNxot371W9G4", "userIDs": ["AvQkqsGnmyo5JJTU", "Vmb8GEXFTlEMEsFz", "YqwgK1Np5nodqpLm"]}, {"partyID": "7FhJBNXzAFdO0Khq", "userIDs": ["f6kiTdSGv2LFjAKY", "7CbgsWqFWZX7kPBo", "m8F9GLLTG8phc3n4"]}]}, {"UserIDs": ["iLoIllKlpO2pqiXJ", "F3WGRaoQomSJC4Dd", "rKF7SUQPLG59e0k5"], "parties": [{"partyID": "ZtX6wK7PpUlcIW32", "userIDs": ["iK7MGt1ixY5rA1Wo", "VeJIePF8ZrQzP4zv", "tdxdbZUpd6FJtHJ1"]}, {"partyID": "pyVwyKQLY6FEO65R", "userIDs": ["b3z7CYLM8IlsHqff", "nrfsGlfPaZKBwa3D", "db60ufPpzwj1QGIF"]}, {"partyID": "mlVf4jvapseE9LN9", "userIDs": ["bvhOrHflIOd6X3vi", "LvtEk4mTIpUA9gxo", "8SV38nEhoXmM2W7l"]}]}, {"UserIDs": ["6jHMA2rG3nakopAy", "welu01nryEJ0NqoT", "ow0qiOiC4j0iktm0"], "parties": [{"partyID": "ZPLkLOsp0LZ5njN8", "userIDs": ["6Hl8kUXzt6bSc6bW", "vgpVyW9dD1kOmvrA", "ejcq2LgkQuaS7RBx"]}, {"partyID": "3vim02jBOxrZDyvp", "userIDs": ["cLYOWA8NjxOnaEok", "4nOOCzfsflhjbngJ", "OUn18G5MlfDTk8aG"]}, {"partyID": "40NlncceIZSwgAIk", "userIDs": ["gzh4pTU0Am4DZhl0", "bQxFJ3sWCqQpQ2Fb", "KPFMycMSQ4qfAacR"]}]}], "ticketIDs": ["0LgB5BUXvjcu2s6w", "3VifnKqmTSoGH1XE", "fY6QAYn6WQ5UBEU1"], "type": "QAOHfZiGhxOdcuDX", "version": 92}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateGameSession' test.out

#- 28 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'R3j5mNZ6vwv7K8As' \
    > test.out 2>&1
eval_tap $? 28 'DeleteGameSession' test.out

#- 29 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vt1j1Rx59hesNWy2' \
    --body '{"attributes": {"NvZ85DDKDAF8KDsB": {}, "ZOuYQJ03BAHZ7c53": {}, "q7akMpcmnnx6RVBr": {}}, "backfillTicketID": "op9v7aZK3h65hbN1", "clientVersion": "5zfQSfQrtfF3TQN0", "deployment": "OcNDLr36vzohZyjM", "fallbackClaimKeys": ["QAg5mPYhrLTyU8Oh", "gfY9JQYGF4bYXEcE", "Nx9xZlAchob44lON"], "inactiveTimeout": 61, "inviteTimeout": 31, "joinability": "DwMvgI0HlyPR7wZN", "matchPool": "iVsF6xG2mXEQdbzI", "maxPlayers": 97, "minPlayers": 100, "preferredClaimKeys": ["y8alncV7vWgSHdfo", "07UctPErqxyMyOK0", "6MqQBErxgjVBycvU"], "requestedRegions": ["4PbmRDcrg0DjQjBE", "CXvea7H1m2lJFRZ3", "ZprZ60zMjhTHeh94"], "teams": [{"UserIDs": ["TSenE5hCFkIf5weq", "Z18MH57l2Zsrh90E", "TtYmGukz3MnlrjcH"], "parties": [{"partyID": "p6B8Vj7rXFgDnDkd", "userIDs": ["Z9bpjb1tdA3QhjCM", "W64f4XhIjSoTB2NM", "KtezapPr2QEPx3zT"]}, {"partyID": "xBGtEJIYppuUSsKo", "userIDs": ["Hw2hyd12uSE7BEv3", "aevq6iohU1cg4W1I", "S3Uv1BpWoJBaqdg2"]}, {"partyID": "FHcunsS1lnaO2m9v", "userIDs": ["qjhbeK2qN8g6x2Py", "YDo5R3hLiD5sf5y1", "JsxJNGmyt0SQDUDo"]}]}, {"UserIDs": ["WBZVGLlkUetzCAWc", "9x1aMjgGim51T107", "XIZRZ7tZdIs0xf4c"], "parties": [{"partyID": "zdt7zqmSKxOEQlVc", "userIDs": ["x6GqsBq8vdhWVnuY", "LgpZehK0G2nmyuVi", "B9kRTcSQdTnNYGeA"]}, {"partyID": "fYFG3wSkHKufBdS3", "userIDs": ["ZOokZB4cXnAXyuGz", "6LlxHv8SwyagYvDJ", "3w3UNgIGj2jZtEYT"]}, {"partyID": "8sIPSE1XXPzySa0s", "userIDs": ["ZoFS6xCOWMpyh9pM", "sQgb64ELbzDMwyo4", "nIRysQdbufXjYnSo"]}]}, {"UserIDs": ["IFeouC2m38kXrDZW", "lGVE9sJ4NpUtKp6M", "9I6nEwnZhsjwJeGw"], "parties": [{"partyID": "aPSDMZz95OYKiqaZ", "userIDs": ["D63xe5rruJVfLGea", "0ZtlzUcuHAXz0UV3", "1MfuGaXsAuGsZaSH"]}, {"partyID": "evO0TQNEI3kfabxJ", "userIDs": ["WWSI1ECUo1NPpeFh", "UztXDgB7n4C97uAP", "P8PATLpUpxeJlsBJ"]}, {"partyID": "T6Hh3OMjAjq2mK8l", "userIDs": ["bSEEelxnb5QxWG2H", "FnZlA6HKWW4fI1IQ", "coBQELcNlZkqTZrK"]}]}], "ticketIDs": ["gXNwvm4e5GX6H742", "OixhtAoKiVm6URT9", "5XhnUcvWB28Mpusu"], "type": "hhDJ5slzgiWZEtyd", "version": 58}' \
    > test.out 2>&1
eval_tap $? 29 'PatchUpdateGameSession' test.out

#- 30 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6LfxnbY97jjYgXch' \
    --body '{"backfillTicketID": "CbkXX26uEdCfQaMA"}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateGameSessionBackfillTicketID' test.out

#- 31 GameSessionGenerateCode
./ng net.accelbyte.sdk.cli.Main session gameSessionGenerateCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'QuTKfC0I2kNjCMDt' \
    > test.out 2>&1
eval_tap $? 31 'GameSessionGenerateCode' test.out

#- 32 PublicRevokeGameSessionCode
./ng net.accelbyte.sdk.cli.Main session publicRevokeGameSessionCode \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DMrentgn3DhqciwI' \
    > test.out 2>&1
eval_tap $? 32 'PublicRevokeGameSessionCode' test.out

#- 33 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eShF9RKb9vvxuJlh' \
    --body '{"platformID": "XbWhbwPwToC6knjV", "userID": "wVnzaqSfJiQFC2gX"}' \
    > test.out 2>&1
eval_tap $? 33 'PublicGameSessionInvite' test.out

#- 34 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'oda0kg16yUSpSOAj' \
    > test.out 2>&1
eval_tap $? 34 'JoinGameSession' test.out

#- 35 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HJWwfCjYwWkLob9g' \
    > test.out 2>&1
eval_tap $? 35 'LeaveGameSession' test.out

#- 36 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'KLqs2nEZhpByfHZi' \
    > test.out 2>&1
eval_tap $? 36 'PublicGameSessionReject' test.out

#- 37 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'nxNfgPAwkMBsznlB' \
    --body '{"additionalMembers": [{"partyID": "UqnLT4AbGptKaWNv", "userIDs": ["Pbpg7yrRvXfZ6rvg", "vEY3Hht1SwqTsKKK", "o37NHDOQe91Ps3zt"]}, {"partyID": "UIV0dS6hIH9c4Vfk", "userIDs": ["yrwpuXxbaERbfgPm", "i0eHkt1mr9EOIFg0", "dnWIYN2NVL70Iw15"]}, {"partyID": "7g00jr9b8MuYmmeK", "userIDs": ["TmBNvGYxEQdf3ewo", "GGoY7xmFNAmjDDCv", "s78mcMdiS76YApGJ"]}], "proposedTeams": [{"UserIDs": ["9ufwLYkqIgLuZS6h", "sQryiEtOAbpeUNf2", "6UqkCfgCUYBn2xaO"], "parties": [{"partyID": "BdPF0JmX8qwU1cTu", "userIDs": ["HHPB5S3DvPRCzBrV", "UxmDOj3cvRFaTC11", "W0TGTCm4fZWuk6pQ"]}, {"partyID": "xDQpKqxLGeMvr9Ts", "userIDs": ["vcMQ7dBsaIecRxIs", "ZvD6rmzVr5XT1Nxw", "0v1dMQ9Rrbk6C2cV"]}, {"partyID": "Wf6ttvbU1PO6ApCD", "userIDs": ["2VXidT7w0Oc15N8W", "XBPp17PAewqSm5x3", "B4t7WQnp8jXZedgt"]}]}, {"UserIDs": ["5cyNe27HLtwtVOax", "gP6Jbct8puMybYGx", "D9IPmmsLmu3kaPj0"], "parties": [{"partyID": "O4zd8Tb7cUNGPTBx", "userIDs": ["iFFCrn7djjs69FTF", "VGUVhvKhJCmeisql", "14mUHVbMPimNhcZs"]}, {"partyID": "U3VAdMDcb4qlkiFA", "userIDs": ["amqvZI2KwjqPBiWX", "ade41s3rH34mB2yP", "lRpWjmHZAAvKTH8M"]}, {"partyID": "uqIg0CzkguwuJCW7", "userIDs": ["EEFB67AODbi9Bzup", "BsFpYc77GtRUcCFe", "Y5g4XgBsbfzqxBPN"]}]}, {"UserIDs": ["e8ae1Il4aAtEbu4I", "jGdqthRxTjQ7gkZE", "Y8rG0q0Q2Qd2JzRb"], "parties": [{"partyID": "kF2I03dIjvBbA6bf", "userIDs": ["bYaJCJjfk2TUvn95", "FhO7VW3mbDVMDu87", "t0ldWf7iSGIiKFtW"]}, {"partyID": "tn4Yr2svKM6pqLGZ", "userIDs": ["0TBujELAUK6mQ5iZ", "gbwwm5iGzXtcknrg", "idKupvXO6aj4hCmT"]}, {"partyID": "C34jxW4pIDwdqXpm", "userIDs": ["Rmut9H9XyWI8bp8f", "QxRuX91uYmtrHJbE", "GTUj7YjERL1rEQG0"]}]}], "version": 43}' \
    > test.out 2>&1
eval_tap $? 37 'AppendTeamGameSession' test.out

#- 38 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "zccA8wvLsWUNd6lP"}' \
    > test.out 2>&1
eval_tap $? 38 'PublicPartyJoinCode' test.out

#- 39 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'KvqDejvqklTSvDwu' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetParty' test.out

#- 40 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'OrP9lzpiX0VuFpZu' \
    --body '{"attributes": {"m7izxe7NPzjOa8E7": {}, "wY76PxLv9HBEUe89": {}, "AwEw1HO4FnKtx4XL": {}}, "inactiveTimeout": 76, "inviteTimeout": 54, "joinability": "9GDbLNwjm3FK0nnX", "maxPlayers": 98, "minPlayers": 32, "type": "CcI8y3Cz0YqCKUh5", "version": 89}' \
    > test.out 2>&1
eval_tap $? 40 'PublicUpdateParty' test.out

#- 41 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Fgvh2Dp2SoiIPp1y' \
    --body '{"attributes": {"vfAHS0VgLu11A3HT": {}, "ovFi4tPAGfleyCA6": {}, "jEtcqsnzoVILjkwW": {}}, "inactiveTimeout": 71, "inviteTimeout": 8, "joinability": "eTYAjdPlCiQQC35c", "maxPlayers": 20, "minPlayers": 55, "type": "4KyOVgvnWbfRJtsB", "version": 59}' \
    > test.out 2>&1
eval_tap $? 41 'PublicPatchUpdateParty' test.out

#- 42 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'cUQZ2QUAxJrINPXp' \
    > test.out 2>&1
eval_tap $? 42 'PublicGeneratePartyCode' test.out

#- 43 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'pPNO3AfmXcgwC3IN' \
    > test.out 2>&1
eval_tap $? 43 'PublicRevokePartyCode' test.out

#- 44 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '6tvKgLB9QmJIOq9d' \
    --body '{"platformID": "P5szG71utjsQ4CrR", "userID": "b9gUCeVz7fWbZIdh"}' \
    > test.out 2>&1
eval_tap $? 44 'PublicPartyInvite' test.out

#- 45 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'evfZvyV7AcodcZwK' \
    --body '{"leaderID": "jYDdmJOlzwm9Su4F"}' \
    > test.out 2>&1
eval_tap $? 45 'PublicPromotePartyLeader' test.out

#- 46 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nS98QqftSjq7sn8y' \
    > test.out 2>&1
eval_tap $? 46 'PublicPartyJoin' test.out

#- 47 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'reciPLfkVyyJsbGp' \
    > test.out 2>&1
eval_tap $? 47 'PublicPartyLeave' test.out

#- 48 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'O6JgehDJxEN7JlZc' \
    > test.out 2>&1
eval_tap $? 48 'PublicPartyReject' test.out

#- 49 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '8LMq1o2jZWu4yA3r' \
    --userId '0u4q1bTHXIjfJKyF' \
    > test.out 2>&1
eval_tap $? 49 'PublicPartyKick' test.out

#- 50 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"lM0u1uuoVdn9yVoS": {}, "lKNchPHNL4X3LLaG": {}, "PGdqLE8SohhhuiTn": {}}, "configurationName": "JarYYkHBDdSzBXdx", "inactiveTimeout": 1, "inviteTimeout": 98, "joinability": "pwhd5IQYBQuxLvPu", "maxPlayers": 99, "members": [{"ID": "KYB4LM6H6QXmpZ9X", "PlatformID": "3fUSR1l9xLPBsmAU", "PlatformUserID": "rD9L1IiD6MlcEPhM"}, {"ID": "DFzjHZ3sIhzOx2CX", "PlatformID": "KlvIomU3pIxM9n8D", "PlatformUserID": "2eLMe3lt9qfx2UDc"}, {"ID": "gVE7L9FK6e0MrPc4", "PlatformID": "vtxk9hVKlG56HlzG", "PlatformUserID": "r7XjdyRJunZPkp6c"}], "minPlayers": 5, "textChat": false, "type": "IBnWyPw8mj7gyQ7X"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicCreateParty' test.out

#- 51 PublicGetBulkPlayerCurrentPlatform
./ng net.accelbyte.sdk.cli.Main session publicGetBulkPlayerCurrentPlatform \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIDs": ["dIszGRj46COPipH1", "MWVTHG0qHJCWEfOJ", "pZm9yEYWNGMy2pgS"]}' \
    > test.out 2>&1
eval_tap $? 51 'PublicGetBulkPlayerCurrentPlatform' test.out

#- 52 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'PublicGetPlayerAttributes' test.out

#- 53 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "currentPlatform": "SUOK68eqGJtWf1Yb", "data": {"gg8rdwY9bmrvHmO0": {}, "7KNqX9LM2IwEsdOG": {}, "BXBwnzDX8v3xgC1G": {}}, "platforms": [{"name": "e9PdbTTAJ2Gp1r0s", "userID": "VZ6LJAOddIL2l3hP"}, {"name": "jNDKv2LWfXqjr8fS", "userID": "79En3wYowBdkaZ3y"}, {"name": "6i38XQjLDRqkpiFK", "userID": "5BtiQ272Uo9UBJWo"}], "roles": ["dpdwsX1jorcyR0x3", "YiHF8ITGPRQBCgIs", "1Q2lzxl0yF5m77TT"]}' \
    > test.out 2>&1
eval_tap $? 53 'PublicStorePlayerAttributes' test.out

#- 54 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'PublicDeletePlayerAttributes' test.out

#- 55 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'h4gUoj8u2WRcLiEt' \
    --orderBy 'zVlnkflfn7pHY48F' \
    --status '1dl1q92m3iRlfnBA' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryMyGameSessions' test.out

#- 56 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'k0CwiAsR65yQ9ssu' \
    --orderBy 'HdGmxncCEr0Kcgeq' \
    --status 'zGbruNB72HHMkjzy' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE