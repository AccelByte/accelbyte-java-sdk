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
echo "1..48"

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

#- 5 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "EAxcVpFrttufHIRd", "deployment": "H9UzVRiXbqlAw7r6", "inactiveTimeout": 100, "inviteTimeout": 9, "joinability": "ktQG0h5JAav5kRa6", "maxPlayers": 100, "minPlayers": 26, "name": "opBJHPtcDs8bBZLC", "persistent": false, "requestedRegions": ["Lx8bbgorQeFbQ1g7", "qbPngUNB1vRodwpz", "S6DaDpv8N7ZQVqGj"], "textChat": false, "type": "oDLjWjkY1aXlFcDt"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateConfigurationTemplateV1' test.out

#- 6 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAllConfigurationTemplatesV1' test.out

#- 7 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'NY4YkHs1cnz1JSDg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetConfigurationTemplateV1' test.out

#- 8 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'Y1TXp38zsCTCrbCb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "POyNQkT7NvyE3cwy", "deployment": "ALczNIicXm7agSrj", "inactiveTimeout": 72, "inviteTimeout": 99, "joinability": "G3aREAu2D6QVKNCW", "maxPlayers": 84, "minPlayers": 89, "name": "75TB0i7pKxR8dl0z", "persistent": true, "requestedRegions": ["W4EZG9m0XcgGVbMq", "SszE8GHavj7AorKs", "xwkosAVerXpc1C8X"], "textChat": false, "type": "Ea1ysLEzth6mXhzk"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminUpdateConfigurationTemplateV1' test.out

#- 9 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'zWkFeZSoEAcBdW19' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminDeleteConfigurationTemplateV1' test.out

#- 10 AdminGetDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminGetDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetDSMCConfiguration' test.out

#- 11 AdminSyncDSMCConfiguration
./ng net.accelbyte.sdk.cli.Main session adminSyncDSMCConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminSyncDSMCConfiguration' test.out

#- 12 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'm4eu6d5tA5jUmiTq' \
    --dsPodName 'pyhPFdxLzFQN05MY' \
    --fromTime 'zYiKWe5dNRljv7IP' \
    --gameMode 'rDQQRgat0SevkLGM' \
    --isPersistent 'S0lyuI9a2I9u6Vpb' \
    --isSoftDeleted 'sx5w8hqUI06UpOXG' \
    --joinability 'SLmCVuHOPlLlkvR8' \
    --limit '37' \
    --matchPool 'tBSxTeIv53HGCilj' \
    --memberID 'vjKoyD6SCwGrncqm' \
    --offset '77' \
    --order 'sfCaTmt1d67FXGk2' \
    --orderBy 's9Q0mPVo3twu0Mes' \
    --sessionID 'TCf9x4rt69lna7qx' \
    --status 'NeIxPz6MbwL6IY69' \
    --statusV2 'z1UaLqYSYWytLPzi' \
    --toTime 'ZMdjxcBZufQxGiHP' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryGameSessions' test.out

#- 13 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["llG4cYEzfTD1ZBm3", "MqHcUmLZZbSqb8Rw", "Nmn9HrNQy4uZAAiE"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteBulkGameSessions' test.out

#- 14 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '0mit9RGCCHYzUOcE' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dscKHPEqgA8yu7Vk' \
    --statusType '6Jt4Ymos9Jcdos4f' \
    > test.out 2>&1
eval_tap $? 14 'AdminUpdateGameSessionMember' test.out

#- 15 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'YcTVU6RBt0zYoMcH' \
    --key 'yCUEXlAvxJMdalwS' \
    --leaderID 'yliWMNW5NyLu0M3V' \
    --limit '68' \
    --memberID 'jJCSQT279ZZPYGu0' \
    --memberStatus 'rdlgdWyOtXi3choQ' \
    --offset '35' \
    --order 'X68cmDc3fxU8MyKr' \
    --orderBy 'QpM4hkkK6KKXNB3G' \
    --value 'v0IqmF51TkhjYnaq' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryParties' test.out

#- 16 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users '6foWvXa3bMrXsDr6' \
    > test.out 2>&1
eval_tap $? 16 'AdminQueryPlayerAttributes' test.out

#- 17 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'kILsSSyDdmykmoPY' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlayerAttributes' test.out

#- 18 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"gc2L4jk4Lo0LSP0p": {}, "f4IxjUkl535X3ate": {}, "EKDpADz1x3poD3Qg": {}}, "backfillTicketID": "b3boLQQ1MzH7Qm8b", "clientVersion": "wbmXgdAPh1EThG96", "configurationName": "gAFKK2WDgCcxvONZ", "deployment": "m3EeERmDnyeFoF7V", "inactiveTimeout": 90, "inviteTimeout": 42, "joinability": "6pf3vneSD2Tb3g7m", "matchPool": "SQUhAEtrmjqU6YE3", "maxPlayers": 31, "minPlayers": 38, "requestedRegions": ["4lSck0ZHn5GI39YB", "HqaTHeKtW18iGeUl", "c9d9sogWa24CKNS0"], "serverName": "GqVvUfHQvsHXNUNe", "teams": [{"UserIDs": ["4mhgo5QB65lSAiYn", "NjkfZrQvGgbLdLsF", "zHkBMr1yrOMlNFSr"], "parties": [{"partyID": "UEirnjX9fDmIbeZx", "userIDs": ["zfTcyiuATus9hsfp", "FDcSDG8aMVGLiBNr", "DjqoxcwgGLXpUL4p"]}, {"partyID": "p2ncYAHdNzDmeIP6", "userIDs": ["rOvDz9KOsb392k6Y", "mJFfRByjlBiuFM3F", "IoVk8T3GpAnkCmBU"]}, {"partyID": "qg2SCnqntX9y1aZS", "userIDs": ["WMiVi10sG6vxkfUc", "mqRRbceJ5i0EeDxO", "gBnhhqElIaDml48w"]}]}, {"UserIDs": ["dNFLTm5T50x9WT0G", "fH2rtOa4EXsXzOXQ", "Ak4mqrxzTtuLl4Xl"], "parties": [{"partyID": "bGL8QOxtjzm8y2wN", "userIDs": ["hmwoYZyI4EFZKBcY", "rCEAE7WIsfmx40NL", "Rc6m8heKnWhzfe2N"]}, {"partyID": "ubeoKFeIaFQCYoDP", "userIDs": ["ICpnduEEQlULdJz4", "mnRBkMNxvvKgAT8m", "JrYq6hRkloqxM3gp"]}, {"partyID": "wxcfMy9XzjjI5Ybs", "userIDs": ["KoADkzJEN2VHzih3", "bit0VWn3CO39PXDN", "xtXgeO3FgkXhjDza"]}]}, {"UserIDs": ["QY3snn2ZkP7cFdP4", "3e5dC9XIBudfZgrb", "HDIDm4hMzF4Txode"], "parties": [{"partyID": "nSrUTvfqU0bfoMm5", "userIDs": ["cTtFWbotQyXJRcQW", "smqPNs92epxk0i8V", "xsZNereSvf9699mC"]}, {"partyID": "EHThUJkETAsSp7gh", "userIDs": ["4TeUTkOkAYfJB8AT", "9t4Tv207Y2QD3oD5", "fLCr3OOlXVv8ZGF7"]}, {"partyID": "uYnGzpipNDigNJma", "userIDs": ["1MbqqZtfNWql4nmw", "Aft4gqkNNlWkD9eO", "ziYRFOn0jJLHC9Lx"]}]}], "textChat": false, "ticketIDs": ["x0KOww3HICQLfl7M", "UBG7qtPu64yAtURK", "LRkb738HGS6rDgMd"], "type": "IIlhS1fSiM9331m7"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateGameSession' test.out

#- 19 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"Ta1PsKc50Kv6ecnE": {}, "evcAx2K2zkRenmPZ": {}, "nGBt4P7WnbdSJtjX": {}}' \
    > test.out 2>&1
eval_tap $? 19 'PublicQueryGameSessions' test.out

#- 20 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName '7ZshZyZl5x4bRXBH' \
    > test.out 2>&1
eval_tap $? 20 'GetGameSessionByPodName' test.out

#- 21 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UTrDzZSKscfOcYu3' \
    > test.out 2>&1
eval_tap $? 21 'GetGameSession' test.out

#- 22 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dpCROYqUiGKXVFCm' \
    --body '{"attributes": {"po6sPwVOEDSJsEK5": {}, "QpNhlI2iS5EpGhhv": {}, "XYck0upMzUYnb76t": {}}, "backfillTicketID": "FkEORV3bu1bNCtX7", "clientVersion": "W40V6Do5sYadCCFr", "deployment": "HHC3DpZxkrQDXuNF", "inactiveTimeout": 44, "inviteTimeout": 95, "joinability": "iMarv8mnfHK8CCmE", "matchPool": "2lPnsbD3SGEdlwuU", "maxPlayers": 4, "minPlayers": 71, "requestedRegions": ["cE536ugBp3HBvepn", "DCjgyJlXe36mgWjL", "fFmteue9nzJ6fH24"], "teams": [{"UserIDs": ["T805tVg8JqU0jZpj", "vsugAOS7u8RiWyer", "CSa8SRgwsAj1ik1j"], "parties": [{"partyID": "glaDXTvKCWwNTAhd", "userIDs": ["2wrS0uPdjhdinpng", "5BLy8wbhMssAHjap", "IkY9Rf4wP57dBZNR"]}, {"partyID": "88YbCtmKy8M9zVrj", "userIDs": ["fGXZnqAQUoY1GjlI", "Ik0iKoTTS1j02o7J", "jTXAQN0qdskdQV0T"]}, {"partyID": "qI8EFnmDbxIxi4YK", "userIDs": ["lONk2Q5Y4Jvaizwi", "ilatuUjjt9lIMGql", "5ElEa9EIIlGcHB3C"]}]}, {"UserIDs": ["fR3ncDlwi3v3MFFJ", "1KesKoELCpobBEG8", "X645xpdXpai0rYaT"], "parties": [{"partyID": "5hOPjaf3H0tYighU", "userIDs": ["0VUfcYHJbBfAKSiP", "W3VgsZXiR1DJ7HVW", "qMkNSawQUWDFJvJB"]}, {"partyID": "Wic7UkBeIXuqDuAX", "userIDs": ["I66bQ71w0deoV9Lx", "5RDA1l2XcrciYNEz", "vSZIPkhSgORcz5S5"]}, {"partyID": "BvmgBLxh4ijFnE3T", "userIDs": ["am69qSZ7PC6f6Qkm", "ZXElW9YfRSse6AAz", "3S4czz0QKFlAVmVL"]}]}, {"UserIDs": ["u4AOec0z8eBeeoip", "68J1nsv4W2OJhtaf", "xMSJlHeb34sZKHcl"], "parties": [{"partyID": "5LLLOexL4fZvWtND", "userIDs": ["2tcBFpX8lNtFEJ7t", "nkY6Mca5afj12K2I", "zrBvvWm4udE0OXud"]}, {"partyID": "XgNne8kJATwlc6es", "userIDs": ["Up6Sw1I98jeZQ7hf", "xnhLd3Knaknoed9D", "HhLOqQGhCUr6iTrj"]}, {"partyID": "yEgarAdNJOIG36I6", "userIDs": ["tRbRcrEveMdAdiPK", "DUVSC00PYeDcaggi", "nxnFIna3yddcbsPh"]}]}], "ticketIDs": ["eTH26IUJNvYuGRUv", "pZaHCuESOiIZsMfB", "4ZH3mtgWgU4pCAKx"], "type": "eE70CaunQNxot371", "version": 100}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateGameSession' test.out

#- 23 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'BgaWcFX3SUBhyoTs' \
    > test.out 2>&1
eval_tap $? 23 'DeleteGameSession' test.out

#- 24 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MWPAxUMkawaGpAyr' \
    --body '{"attributes": {"IwMif3BOdkocVTd4": {}, "BxqGWV6mTJ0sQs6X": {}, "NbjvqhnUVLWu8olK": {}}, "backfillTicketID": "dxL6ozRmDD0jJvlf", "clientVersion": "V5OemPYdYT7DROCj", "deployment": "tuzFMbAG9YI89hmg", "inactiveTimeout": 41, "inviteTimeout": 17, "joinability": "B8FOTjMLo4b9rIzq", "matchPool": "YkEpstyVTBcrM8rG", "maxPlayers": 21, "minPlayers": 36, "requestedRegions": ["5ZtX6wK7PpUlcIW3", "2iK7MGt1ixY5rA1W", "oVeJIePF8ZrQzP4z"], "teams": [{"UserIDs": ["vtdxdbZUpd6FJtHJ", "1pyVwyKQLY6FEO65", "Rb3z7CYLM8IlsHqf"], "parties": [{"partyID": "fnrfsGlfPaZKBwa3", "userIDs": ["Ddb60ufPpzwj1QGI", "FmlVf4jvapseE9LN", "9bvhOrHflIOd6X3v"]}, {"partyID": "iLvtEk4mTIpUA9gx", "userIDs": ["o8SV38nEhoXmM2W7", "l6jHMA2rG3nakopA", "ywelu01nryEJ0Nqo"]}, {"partyID": "Tow0qiOiC4j0iktm", "userIDs": ["0ZPLkLOsp0LZ5njN", "86Hl8kUXzt6bSc6b", "WvgpVyW9dD1kOmvr"]}]}, {"UserIDs": ["Aejcq2LgkQuaS7RB", "x3vim02jBOxrZDyv", "pcLYOWA8NjxOnaEo"], "parties": [{"partyID": "k4nOOCzfsflhjbng", "userIDs": ["JOUn18G5MlfDTk8a", "G40NlncceIZSwgAI", "kgzh4pTU0Am4DZhl"]}, {"partyID": "0bQxFJ3sWCqQpQ2F", "userIDs": ["bKPFMycMSQ4qfAac", "R0LgB5BUXvjcu2s6", "w3VifnKqmTSoGH1X"]}, {"partyID": "EfY6QAYn6WQ5UBEU", "userIDs": ["1QAOHfZiGhxOdcuD", "XSxSc3aZPV87pna0", "8gxefTYKhuxaEc7M"]}]}, {"UserIDs": ["4P7UckSC6ePeN8i4", "GrFES9z7xueHpATH", "ccee9GXhKcjmSEwd"], "parties": [{"partyID": "rkEnnqKzFsLfYalU", "userIDs": ["lfwEQKjU7eHGebSV", "u0LQ40kepEaC4dfi", "OMZfEhHr39pysFO3"]}, {"partyID": "Zvc1BZG99LyvfvHE", "userIDs": ["sJKQQewVLMUoAnaR", "cYp7FUjfIGaffofl", "EIByYqeKN0meGelY"]}, {"partyID": "F5wWaDhukU4khGG4", "userIDs": ["vZFTYnPkmSu4PWam", "1jxR7SETWjteoc8f", "gvZDDhoO05oKqymx"]}]}], "ticketIDs": ["LD1Lcvw6T6mZEiwx", "xElpMYSWIeVzm7z9", "noowmlTIKVowi0RY"], "type": "2VN4ZONJREdUQ3z9", "version": 65}' \
    > test.out 2>&1
eval_tap $? 24 'PatchUpdateGameSession' test.out

#- 25 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '90ETtYmGukz3Mnlr' \
    --body '{"backfillTicketID": "jcHp6B8Vj7rXFgDn"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateGameSessionBackfillTicketID' test.out

#- 26 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'DkdZ9bpjb1tdA3Qh' \
    --body '{"userID": "jCMW64f4XhIjSoTB"}' \
    > test.out 2>&1
eval_tap $? 26 'PublicGameSessionInvite' test.out

#- 27 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2NMKtezapPr2QEPx' \
    > test.out 2>&1
eval_tap $? 27 'JoinGameSession' test.out

#- 28 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3zTxBGtEJIYppuUS' \
    > test.out 2>&1
eval_tap $? 28 'LeaveGameSession' test.out

#- 29 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'sKoHw2hyd12uSE7B' \
    > test.out 2>&1
eval_tap $? 29 'PublicGameSessionReject' test.out

#- 30 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'Ev3aevq6iohU1cg4' \
    --body '{"additionalMembers": [{"partyID": "W1IS3Uv1BpWoJBaq", "userIDs": ["dg2FHcunsS1lnaO2", "m9vqjhbeK2qN8g6x", "2PyYDo5R3hLiD5sf"]}, {"partyID": "5y1JsxJNGmyt0SQD", "userIDs": ["UDoWBZVGLlkUetzC", "AWc9x1aMjgGim51T", "107XIZRZ7tZdIs0x"]}, {"partyID": "f4czdt7zqmSKxOEQ", "userIDs": ["lVcx6GqsBq8vdhWV", "nuYLgpZehK0G2nmy", "uViB9kRTcSQdTnNY"]}], "proposedTeams": [{"UserIDs": ["GeAfYFG3wSkHKufB", "dS3ZOokZB4cXnAXy", "uGz6LlxHv8SwyagY"], "parties": [{"partyID": "vDJ3w3UNgIGj2jZt", "userIDs": ["EYT8sIPSE1XXPzyS", "a0sZoFS6xCOWMpyh", "9pMsQgb64ELbzDMw"]}, {"partyID": "yo4nIRysQdbufXjY", "userIDs": ["nSoIFeouC2m38kXr", "DZWlGVE9sJ4NpUtK", "p6M9I6nEwnZhsjwJ"]}, {"partyID": "eGwaPSDMZz95OYKi", "userIDs": ["qaZD63xe5rruJVfL", "Gea0ZtlzUcuHAXz0", "UV31MfuGaXsAuGsZ"]}]}, {"UserIDs": ["aSHevO0TQNEI3kfa", "bxJWWSI1ECUo1NPp", "eFhUztXDgB7n4C97"], "parties": [{"partyID": "uAPP8PATLpUpxeJl", "userIDs": ["sBJT6Hh3OMjAjq2m", "K8lbSEEelxnb5QxW", "G2HFnZlA6HKWW4fI"]}, {"partyID": "1IQcoBQELcNlZkqT", "userIDs": ["ZrKgXNwvm4e5GX6H", "742OixhtAoKiVm6U", "RT95XhnUcvWB28Mp"]}, {"partyID": "usuhhDJ5slzgiWZE", "userIDs": ["tyd56LfxnbY97jjY", "gXchCbkXX26uEdCf", "QaMAQuTKfC0I2kNj"]}]}, {"UserIDs": ["CMDtDMrentgn3Dhq", "ciwIeShF9RKb9vvx", "uJlhXbWhbwPwToC6"], "parties": [{"partyID": "knjVwVnzaqSfJiQF", "userIDs": ["C2gXoda0kg16yUSp", "SOAjHJWwfCjYwWkL", "ob9gKLqs2nEZhpBy"]}, {"partyID": "fHZinxNfgPAwkMBs", "userIDs": ["znlBUqnLT4AbGptK", "aWNvPbpg7yrRvXfZ", "6rvgvEY3Hht1SwqT"]}, {"partyID": "sKKKo37NHDOQe91P", "userIDs": ["s3ztUIV0dS6hIH9c", "4VfkyrwpuXxbaERb", "fgPmi0eHkt1mr9EO"]}]}], "version": 70}' \
    > test.out 2>&1
eval_tap $? 30 'AppendTeamGameSession' test.out

#- 31 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "SiZNCxuogFteTHJe"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoinCode' test.out

#- 32 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '4BhSSQkQD6WmOt6D' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetParty' test.out

#- 33 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '7ufFVTOhvQpfbBke' \
    --body '{"attributes": {"8aEdd36xj6wySolt": {}, "DxsbzxrlaKEfkoYj": {}, "Y2o6ouRW9UtNquwC": {}}, "inactiveTimeout": 92, "inviteTimeout": 100, "joinability": "6hsQryiEtOAbpeUN", "maxPlayers": 11, "minPlayers": 96, "type": "26UqkCfgCUYBn2xa", "version": 83}' \
    > test.out 2>&1
eval_tap $? 33 'PublicUpdateParty' test.out

#- 34 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '4lj8m3XEwP2b4gd3' \
    --body '{"attributes": {"xOeii8Jnmssep2xD": {}, "2NY0kABeGs9yxahl": {}, "d1pO0Gyf5PO3COyM": {}}, "inactiveTimeout": 44, "inviteTimeout": 48, "joinability": "czgEpzZ3FbtxfhcR", "maxPlayers": 58, "minPlayers": 4, "type": "7IVYa6iZ5uFRYNn3", "version": 91}' \
    > test.out 2>&1
eval_tap $? 34 'PublicPatchUpdateParty' test.out

#- 35 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'D6rmzVr5XT1Nxw0v' \
    > test.out 2>&1
eval_tap $? 35 'PublicGeneratePartyCode' test.out

#- 36 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId '1dMQ9Rrbk6C2cVWf' \
    > test.out 2>&1
eval_tap $? 36 'PublicRevokePartyCode' test.out

#- 37 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '6ttvbU1PO6ApCD2V' \
    --body '{"userID": "XidT7w0Oc15N8WXB"}' \
    > test.out 2>&1
eval_tap $? 37 'PublicPartyInvite' test.out

#- 38 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Pp17PAewqSm5x3B4' \
    --body '{"leaderID": "t7WQnp8jXZedgt5c"}' \
    > test.out 2>&1
eval_tap $? 38 'PublicPromotePartyLeader' test.out

#- 39 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'yNe27HLtwtVOaxgP' \
    > test.out 2>&1
eval_tap $? 39 'PublicPartyJoin' test.out

#- 40 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '6Jbct8puMybYGxD9' \
    > test.out 2>&1
eval_tap $? 40 'PublicPartyLeave' test.out

#- 41 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'IPmmsLmu3kaPj0O4' \
    > test.out 2>&1
eval_tap $? 41 'PublicPartyReject' test.out

#- 42 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'zd8Tb7cUNGPTBxiF' \
    --userId 'FCrn7djjs69FTFVG' \
    > test.out 2>&1
eval_tap $? 42 'PublicPartyKick' test.out

#- 43 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"UVhvKhJCmeisql14": {}, "mUHVbMPimNhcZsU3": {}, "VAdMDcb4qlkiFAam": {}}, "configurationName": "qvZI2KwjqPBiWXad", "inactiveTimeout": 10, "inviteTimeout": 98, "joinability": "41s3rH34mB2yPlRp", "maxPlayers": 100, "members": [{"ID": "oJHbiQ5duE5p4cfs", "PlatformID": "2E41cK8QTwiIAvxS", "PlatformUserID": "vNDlmM5nQFMGzs7f"}, {"ID": "zjgyc44mEh9tRk8k", "PlatformID": "nYSV30lnroQehMDl", "PlatformUserID": "i6t9unQLYXxm09wp"}, {"ID": "GAbpEmDY9vLh3u6E", "PlatformID": "DsUmrV6kH4OotKwG", "PlatformUserID": "3UC6XCnnZxF8CmQr"}], "minPlayers": 59, "textChat": false, "type": "65br34rBBN9tU6TD"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicCreateParty' test.out

#- 44 PublicGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'PublicGetPlayerAttributes' test.out

#- 45 PublicStorePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicStorePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossplayEnabled": false, "data": {"mbDVMDu87t0ldWf7": {}, "iSGIiKFtWtn4Yr2s": {}, "vKM6pqLGZ0TBujEL": {}}, "platforms": [{"name": "AUK6mQ5iZgbwwm5i", "userID": "GzXtcknrgidKupvX"}, {"name": "O6aj4hCmTC34jxW4", "userID": "pIDwdqXpmRmut9H9"}, {"name": "XyWI8bp8fQxRuX91", "userID": "uYmtrHJbEGTUj7Yj"}]}' \
    > test.out 2>&1
eval_tap $? 45 'PublicStorePlayerAttributes' test.out

#- 46 PublicDeletePlayerAttributes
./ng net.accelbyte.sdk.cli.Main session publicDeletePlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'PublicDeletePlayerAttributes' test.out

#- 47 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'ERL1rEQG02zccA8w' \
    --orderBy 'vLsWUNd6lPKvqDej' \
    --status 'vqklTSvDwuOrP9lz' \
    > test.out 2>&1
eval_tap $? 47 'PublicQueryMyGameSessions' test.out

#- 48 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'piX0VuFpZum7izxe' \
    --orderBy '7NPzjOa8E7wY76Px' \
    --status 'Lv9HBEUe89AwEw1H' \
    > test.out 2>&1
eval_tap $? 48 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE