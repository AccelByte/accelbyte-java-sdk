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
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 62, "SessionTitle": "twYCA9kPI6LZrkq6", "ShouldSync": true, "XboxServiceConfigID": "9UzVRiXbqlAw7r6W", "XboxSessionTemplateName": "2ktQG0h5JAav5kRa"}, "clientVersion": "62WopBJHPtcDs8bB", "deployment": "ZLCXLx8bbgorQeFb", "inactiveTimeout": 87, "inviteTimeout": 14, "joinability": "1g7qbPngUNB1vRod", "maxPlayers": 46, "minPlayers": 63, "name": "pzS6DaDpv8N7ZQVq", "persistent": false, "requestedRegions": ["j6oDLjWjkY1aXlFc", "DtgOjchIua5tWEIC", "32ogW7olvbTgrhRT"], "textChat": false, "type": "bCbPOyNQkT7NvyE3"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateConfigurationTemplateV1' test.out

#- 6 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAllConfigurationTemplatesV1' test.out

#- 7 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'mAQLnzjMf8GZ2WBZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetConfigurationTemplateV1' test.out

#- 8 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'qxYG3aREAu2D6QVK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"NativeSessionSetting": {"PSNServiceLabel": 81, "SessionTitle": "vdiRilZ7oFgx4c8O", "ShouldSync": true, "XboxServiceConfigID": "l0zRVW4EZG9m0Xcg", "XboxSessionTemplateName": "GVbMqSszE8GHavj7"}, "clientVersion": "AorKsxwkosAVerXp", "deployment": "c1C8XfwHuKeb9l3r", "inactiveTimeout": 67, "inviteTimeout": 25, "joinability": "N9A3sNm84hddSpHt", "maxPlayers": 7, "minPlayers": 85, "name": "W19m4eu6d5tA5jUm", "persistent": false, "requestedRegions": ["yZ0GhDogqrhBRd8l", "DR6qVNPRZYdFLIAj", "GGJddVCvu9vx5KQ7"], "textChat": false, "type": "S0lyuI9a2I9u6Vpb"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminUpdateConfigurationTemplateV1' test.out

#- 9 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'sx5w8hqUI06UpOXG' \
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
    --configurationName 'SLmCVuHOPlLlkvR8' \
    --dsPodName 'sKgnuRkgghGoYupD' \
    --fromTime '391C2qtPYokahFjk' \
    --gameMode 'QsfCaTmt1d67FXGk' \
    --isPersistent '2s9Q0mPVo3twu0Me' \
    --isSoftDeleted 'sTCf9x4rt69lna7q' \
    --joinability 'xNeIxPz6MbwL6IY6' \
    --limit '46' \
    --matchPool 'z1UaLqYSYWytLPzi' \
    --memberID 'ZMdjxcBZufQxGiHP' \
    --offset '24' \
    --order 'PlSC2uE4o5Vwdo3f' \
    --orderBy 'ePqIJA8IHtrkmu0h' \
    --sessionID 'pDDWVAla2l5BYNtI' \
    --status 'uS5S5XUdjsoqwGyz' \
    --statusV2 'zWi9gwQYv7t1o7TT' \
    --toTime 'r1DmrhZv15T7quIO' \
    > test.out 2>&1
eval_tap $? 12 'AdminQueryGameSessions' test.out

#- 13 AdminDeleteBulkGameSessions
./ng net.accelbyte.sdk.cli.Main session adminDeleteBulkGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"ids": ["vBMcaYmvCkGZ5dAg", "qxpBFmaLoxozr6wf", "NPX2bOItRMvqtlB2"]}' \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteBulkGameSessions' test.out

#- 14 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'jJCSQT279ZZPYGu0' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'rdlgdWyOtXi3choQ' \
    --statusType 'rpOsDBU5SepjChB3' \
    > test.out 2>&1
eval_tap $? 14 'AdminUpdateGameSessionMember' test.out

#- 15 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'V0v52Dlym6puQ23x' \
    --key 'oJ8aeCnaLpUKp44Y' \
    --leaderID 'UDjasWIPUvmEejtG' \
    --limit '8' \
    --memberID 'kILsSSyDdmykmoPY' \
    --memberStatus 'gc2L4jk4Lo0LSP0p' \
    --offset '10' \
    --order 'TvhZNkSQ70D0H6BX' \
    --orderBy 'ksUC9b6i5lZC9xv3' \
    --value '2e8c5csSovoqsZNB' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryParties' test.out

#- 16 AdminQueryPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminQueryPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --users 'dte9NDUPVJf6c2Z0' \
    > test.out 2>&1
eval_tap $? 16 'AdminQueryPlayerAttributes' test.out

#- 17 AdminGetPlayerAttributes
./ng net.accelbyte.sdk.cli.Main session adminGetPlayerAttributes \
    --namespace "$AB_NAMESPACE" \
    --userId 'QZxfgPubTDIHrvqA' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlayerAttributes' test.out

#- 18 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"ThuwjRHpKKTlmVr9": {}, "XuoJbRFQSKVPHbn4": {}, "Xxtu7LQRENjEEztx": {}}, "backfillTicketID": "1WsYSiZqan0nSBJr", "clientVersion": "oav91GXlvPG6bFYR", "configurationName": "eVHQipcCx9Zw5D2L", "deployment": "7vIYhGGSyEW4ZJJ4", "inactiveTimeout": 81, "inviteTimeout": 7, "joinability": "e4mhgo5QB65lSAiY", "matchPool": "nNjkfZrQvGgbLdLs", "maxPlayers": 65, "minPlayers": 5, "requestedRegions": ["zHkBMr1yrOMlNFSr", "UEirnjX9fDmIbeZx", "zfTcyiuATus9hsfp"], "serverName": "FDcSDG8aMVGLiBNr", "teams": [{"UserIDs": ["DjqoxcwgGLXpUL4p", "p2ncYAHdNzDmeIP6", "rOvDz9KOsb392k6Y"], "parties": [{"partyID": "mJFfRByjlBiuFM3F", "userIDs": ["IoVk8T3GpAnkCmBU", "qg2SCnqntX9y1aZS", "WMiVi10sG6vxkfUc"]}, {"partyID": "mqRRbceJ5i0EeDxO", "userIDs": ["gBnhhqElIaDml48w", "dNFLTm5T50x9WT0G", "fH2rtOa4EXsXzOXQ"]}, {"partyID": "Ak4mqrxzTtuLl4Xl", "userIDs": ["bGL8QOxtjzm8y2wN", "hmwoYZyI4EFZKBcY", "rCEAE7WIsfmx40NL"]}]}, {"UserIDs": ["Rc6m8heKnWhzfe2N", "ubeoKFeIaFQCYoDP", "ICpnduEEQlULdJz4"], "parties": [{"partyID": "mnRBkMNxvvKgAT8m", "userIDs": ["JrYq6hRkloqxM3gp", "wxcfMy9XzjjI5Ybs", "KoADkzJEN2VHzih3"]}, {"partyID": "bit0VWn3CO39PXDN", "userIDs": ["xtXgeO3FgkXhjDza", "QY3snn2ZkP7cFdP4", "3e5dC9XIBudfZgrb"]}, {"partyID": "HDIDm4hMzF4Txode", "userIDs": ["nSrUTvfqU0bfoMm5", "cTtFWbotQyXJRcQW", "smqPNs92epxk0i8V"]}]}, {"UserIDs": ["xsZNereSvf9699mC", "EHThUJkETAsSp7gh", "4TeUTkOkAYfJB8AT"], "parties": [{"partyID": "9t4Tv207Y2QD3oD5", "userIDs": ["fLCr3OOlXVv8ZGF7", "uYnGzpipNDigNJma", "1MbqqZtfNWql4nmw"]}, {"partyID": "Aft4gqkNNlWkD9eO", "userIDs": ["ziYRFOn0jJLHC9Lx", "hvNXTwGBCtohLtl9", "Zuhytm5UDrT6QXCs"]}, {"partyID": "5SPBbRPZTF6oQAXV", "userIDs": ["G7tnsZg5QgXjvyGJ", "PN4eXbJE5Vs2Gcyo", "mQoIXimBJehyxlNs"]}]}], "textChat": false, "ticketIDs": ["nGBt4P7WnbdSJtjX", "7ZshZyZl5x4bRXBH", "UTrDzZSKscfOcYu3"], "type": "dpCROYqUiGKXVFCm"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateGameSession' test.out

#- 19 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"po6sPwVOEDSJsEK5": {}, "QpNhlI2iS5EpGhhv": {}, "XYck0upMzUYnb76t": {}}' \
    > test.out 2>&1
eval_tap $? 19 'PublicQueryGameSessions' test.out

#- 20 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'FkEORV3bu1bNCtX7' \
    > test.out 2>&1
eval_tap $? 20 'GetGameSessionByPodName' test.out

#- 21 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'W40V6Do5sYadCCFr' \
    > test.out 2>&1
eval_tap $? 21 'GetGameSession' test.out

#- 22 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'HHC3DpZxkrQDXuNF' \
    --body '{"attributes": {"viMarv8mnfHK8CCm": {}, "E2lPnsbD3SGEdlwu": {}, "UccE536ugBp3HBve": {}}, "backfillTicketID": "pnDCjgyJlXe36mgW", "clientVersion": "jLfFmteue9nzJ6fH", "deployment": "24T805tVg8JqU0jZ", "inactiveTimeout": 31, "inviteTimeout": 44, "joinability": "jvsugAOS7u8RiWye", "matchPool": "rCSa8SRgwsAj1ik1", "maxPlayers": 20, "minPlayers": 12, "requestedRegions": ["NRsB1fPqqRRulpqp", "ymDkQhtrHWwRVnwV", "BOqOHi8pWGd1juYh"], "teams": [{"UserIDs": ["iqjRJOqB5F93zFQb", "JndUDpdONneAczbB", "dHb2slt71B1SmZp2"], "parties": [{"partyID": "JZp50CnPb71ORYcm", "userIDs": ["QbTU5JX8ccLjMXJR", "k0eaKQDOJvrTefgl", "Ss6g4iY9u02aCNYI"]}, {"partyID": "Wekp18lOC3mNqF7B", "userIDs": ["l0LcghVHfPEspxwh", "RON0bc1eMbEIjowL", "qc3ecjXJbZDKKoxL"]}, {"partyID": "E1Y3Dymtj3giPg4x", "userIDs": ["4yiPX6ues1Hhhkg1", "yLVbLFzHEP8cM4NT", "wr0KHaAsmTej52WK"]}]}, {"UserIDs": ["i6tArAURt9plCSVq", "8PdH6hJPUAc0RVwX", "gAgntLMCuaXBWQi6"], "parties": [{"partyID": "BqPg4xr0lCancUZG", "userIDs": ["CHsZYoLfR1KtOv7Z", "y0b65uvuKNuy0ytZ", "Q7M6Nzy1adnSKOLF"]}, {"partyID": "Kx1dX4LuWJu3pDMU", "userIDs": ["AeeZ97SBROPYuG6X", "qP6oo7G73zdxTgOf", "nwIdlNa29fDLh741"]}, {"partyID": "IslKHzGlLKWUtDQs", "userIDs": ["61OQAoxyyQpRWCii", "PDGQhNPEwiJCf2XJ", "VrlzqQls1ozhLVA3"]}]}, {"UserIDs": ["kE8jKvgatOEBM70T", "dlNBJYOmpu1VCarz", "BsV6xnZ5Jrzzjrca"], "parties": [{"partyID": "ug6CWVG8SWP3glU6", "userIDs": ["muswVJnNnN7kAa7j", "0riFc5HTHQIoVsGo", "7dwV9DBqFKHQkETJ"]}, {"partyID": "yTlUrwDTnoujQD4I", "userIDs": ["EiH9Z5qXn3aoRtlq", "OECohViHA5CzgFSy", "8X1A3PrIfapq5AAe"]}, {"partyID": "Me4L3mDWORBVXTII", "userIDs": ["JM9XsYIIZxiXNMR9", "BgaWcFX3SUBhyoTs", "MWPAxUMkawaGpAyr"]}]}], "ticketIDs": ["IwMif3BOdkocVTd4", "BxqGWV6mTJ0sQs6X", "NbjvqhnUVLWu8olK"], "type": "dxL6ozRmDD0jJvlf", "version": 98}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateGameSession' test.out

#- 23 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'PBom8F9GLLTG8phc' \
    > test.out 2>&1
eval_tap $? 23 'DeleteGameSession' test.out

#- 24 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '3n4iLoIllKlpO2pq' \
    --body '{"attributes": {"iXJF3WGRaoQomSJC": {}, "4DdrKF7SUQPLG59e": {}, "0k5ZtX6wK7PpUlcI": {}}, "backfillTicketID": "W32iK7MGt1ixY5rA", "clientVersion": "1WoVeJIePF8ZrQzP", "deployment": "4zvtdxdbZUpd6FJt", "inactiveTimeout": 69, "inviteTimeout": 73, "joinability": "yO2KTK9tmmOnYnOp", "matchPool": "as6ghP1y4Zi7s7QB", "maxPlayers": 23, "minPlayers": 12, "requestedRegions": ["k44Z44B1GZgKg4uK", "xaCgcGLuC3brWdTY", "CfHkIySok5DiXZtL"], "teams": [{"UserIDs": ["W87rGysryod3dNQr", "msApRA6HX3RwrKt2", "ecozL0TOg54vCE48"], "parties": [{"partyID": "L5oLF6M4lNa4JUMS", "userIDs": ["HNgqRqCV7usamANk", "ZlOX9Sfo95HgXqKh", "TPkwfLM9uSybRzWe"]}, {"partyID": "k2gZvRrvr0n9d9lv", "userIDs": ["ccKMLhrTrcBE2ItB", "S3KtKZWe8aoFzAyB", "ME74HUtipUWYhWV1"]}, {"partyID": "qx8CzPML52faXUr9", "userIDs": ["Sk4lq2faBcAXXKlh", "vyH8paOJtxqMPpcV", "fRwNj547fH0XrKED"]}]}, {"UserIDs": ["pEY8VnocGAjci0V3", "tBf2jnHGKXphn50c", "9tNLDljhZ2jxLRX3"], "parties": [{"partyID": "z46OCaGBeMfPlNos", "userIDs": ["4yBRjrERHEonAZR8", "GmEu0q1p6QCyY6vS", "kVFWdsbYuVEGVxYh"]}, {"partyID": "eR3j5mNZ6vwv7K8A", "userIDs": ["svt1j1Rx59hesNWy", "2NvZ85DDKDAF8KDs", "BZOuYQJ03BAHZ7c5"]}, {"partyID": "3q7akMpcmnnx6RVB", "userIDs": ["rop9v7aZK3h65hbN", "15zfQSfQrtfF3TQN", "0OcNDLr36vzohZyj"]}]}, {"UserIDs": ["MQAg5mPYhrLTyU8O", "hgfY9JQYGF4bYXEc", "ENx9xZlAchob44lO"], "parties": [{"partyID": "NDDwMvgI0HlyPR7w", "userIDs": ["ZNiVsF6xG2mXEQdb", "zIVy8alncV7vWgSH", "dfo07UctPErqxyMy"]}, {"partyID": "OK06MqQBErxgjVBy", "userIDs": ["cvU4PbmRDcrg0DjQ", "jBECXvea7H1m2lJF", "RZ3ZprZ60zMjhTHe"]}, {"partyID": "h94TSenE5hCFkIf5", "userIDs": ["weqZ18MH57l2Zsrh", "90ETtYmGukz3Mnlr", "jcHp6B8Vj7rXFgDn"]}]}], "ticketIDs": ["DkdZ9bpjb1tdA3Qh", "jCMW64f4XhIjSoTB", "2NMKtezapPr2QEPx"], "type": "3zTxBGtEJIYppuUS", "version": 37}' \
    > test.out 2>&1
eval_tap $? 24 'PatchUpdateGameSession' test.out

#- 25 UpdateGameSessionBackfillTicketID
./ng net.accelbyte.sdk.cli.Main session updateGameSessionBackfillTicketID \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7Rry0KK5rgAGO0dW' \
    --body '{"backfillTicketID": "8rX2MVUGKSZ4GcLk"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateGameSessionBackfillTicketID' test.out

#- 26 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 't4pK32sJxlZcCTpT' \
    --body '{"platformID": "dRtCHvuk6B6XTmSL", "userID": "yn50sigBVZxiKdV5"}' \
    > test.out 2>&1
eval_tap $? 26 'PublicGameSessionInvite' test.out

#- 27 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '7GvRyd9UuL02Le8H' \
    > test.out 2>&1
eval_tap $? 27 'JoinGameSession' test.out

#- 28 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'SCslsDd4M1F5qRIb' \
    > test.out 2>&1
eval_tap $? 28 'LeaveGameSession' test.out

#- 29 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'lS7Nz81GRazPAANj' \
    > test.out 2>&1
eval_tap $? 29 'PublicGameSessionReject' test.out

#- 30 AppendTeamGameSession
./ng net.accelbyte.sdk.cli.Main session appendTeamGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'fBoldFOyqA2clJ5g' \
    --body '{"additionalMembers": [{"partyID": "EOaCgM6Yn6RugbNE", "userIDs": ["IpGBFUjOn5mM7k8n", "bLzvtCIW5ynMKquU", "icAeIVXtoWAXhMlW"]}, {"partyID": "4tLqX7OICf5oD1e6", "userIDs": ["oI9FmYel0kOw72o8", "Zkgk0jS6rDWUwfhK", "vrf2AaH4yCWrHSpp"]}, {"partyID": "nIZkNnTn3rzH5NvA", "userIDs": ["tcvNedgS1fUfKmih", "Dbmu8ePWlQMVDXEH", "eiGTnwyEw6hIWDZr"]}], "proposedTeams": [{"UserIDs": ["pP7rz3ISW510kHr4", "isTKWjmv67nuHCXW", "fwnwGioVwVzmmBVV"], "parties": [{"partyID": "Ffpqx1AeLtzcPJ3j", "userIDs": ["tDYBo4FUTH7CGfKS", "yxgRR1DiCqSMzpqI", "FGLkDs7ACC1RgBfo"]}, {"partyID": "NrHlFi2qJLgmBLE3", "userIDs": ["5YhyiDV90SeI5ypp", "BHoytVznCgNyx9fb", "T63ShEh8PbGikLjg"]}, {"partyID": "jcj34uulU6FYBZsW", "userIDs": ["Fbr3RSP0W9nBhvhf", "8Q0DtJMcYQdN66bs", "wAgt65X4N1LQZmB6"]}]}, {"UserIDs": ["1JMdtwCVUrYQue84", "dwmbwFEnAZaWsQJt", "RYoagRJK5PX9UcOv"], "parties": [{"partyID": "hPyE11TRT2SKseoe", "userIDs": ["8VLie0LBa36KNzjf", "005CXNGehQ2aTjTD", "fKFDXC7eGL5YhJDW"]}, {"partyID": "h9YWqc0qgV6d9yOf", "userIDs": ["IMLds2DbPcaoMdtR", "LTmSvTkQQgB7exYv", "mHMxr5hPCJJztJBg"]}, {"partyID": "0tTJg46IewOXE2Ak", "userIDs": ["Ch3QIZsUf8lGFXcm", "wTERHclOdxIwqejx", "e18rNdb8Otq6j1mq"]}]}, {"UserIDs": ["Uav7k05HAQltnSoj", "V4jT65yclX2FtAz0", "vJjFIYWOaNdsimmk"], "parties": [{"partyID": "W2miH3xRHAKy4QxZ", "userIDs": ["kaXZ7vmiEd0JPxVy", "QpshaDwNqTbbFMXA", "MfVXe0GZeMgsRsmH"]}, {"partyID": "1EQrYmkPKTPOlhTt", "userIDs": ["SiZNCxuogFteTHJe", "4BhSSQkQD6WmOt6D", "7ufFVTOhvQpfbBke"]}, {"partyID": "8aEdd36xj6wySolt", "userIDs": ["DxsbzxrlaKEfkoYj", "Y2o6ouRW9UtNquwC", "3WgumrIz4NhGztZp"]}]}], "version": 37}' \
    > test.out 2>&1
eval_tap $? 30 'AppendTeamGameSession' test.out

#- 31 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Nf26UqkCfgCUYBn2"}' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoinCode' test.out

#- 32 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'xaOBdPF0JmX8qwU1' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetParty' test.out

#- 33 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'cTuHHPB5S3DvPRCz' \
    --body '{"attributes": {"BrVUxmDOj3cvRFaT": {}, "C11W0TGTCm4fZWuk": {}, "6pQxDQpKqxLGeMvr": {}}, "inactiveTimeout": 14, "inviteTimeout": 94, "joinability": "cRC7IVYa6iZ5uFRY", "maxPlayers": 82, "minPlayers": 38, "type": "n3SHiWxF0YbuU5ar", "version": 34}' \
    > test.out 2>&1
eval_tap $? 33 'PublicUpdateParty' test.out

#- 34 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'v1dMQ9Rrbk6C2cVW' \
    --body '{"attributes": {"f6ttvbU1PO6ApCD2": {}, "VXidT7w0Oc15N8WX": {}, "BPp17PAewqSm5x3B": {}}, "inactiveTimeout": 69, "inviteTimeout": 39, "joinability": "nRN06EjRwEQlNapJ", "maxPlayers": 89, "minPlayers": 82, "type": "fk4f9Zcw1pEHAyNF", "version": 48}' \
    > test.out 2>&1
eval_tap $? 34 'PublicPatchUpdateParty' test.out

#- 35 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'bct8puMybYGxD9IP' \
    > test.out 2>&1
eval_tap $? 35 'PublicGeneratePartyCode' test.out

#- 36 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'mmsLmu3kaPj0O4zd' \
    > test.out 2>&1
eval_tap $? 36 'PublicRevokePartyCode' test.out

#- 37 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '8Tb7cUNGPTBxiFFC' \
    --body '{"platformID": "rn7djjs69FTFVGUV", "userID": "hvKhJCmeisql14mU"}' \
    > test.out 2>&1
eval_tap $? 37 'PublicPartyInvite' test.out

#- 38 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'HVbMPimNhcZsU3VA' \
    --body '{"leaderID": "dMDcb4qlkiFAamqv"}' \
    > test.out 2>&1
eval_tap $? 38 'PublicPromotePartyLeader' test.out

#- 39 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZI2KwjqPBiWXade4' \
    > test.out 2>&1
eval_tap $? 39 'PublicPartyJoin' test.out

#- 40 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId '1s3rH34mB2yPlRpW' \
    > test.out 2>&1
eval_tap $? 40 'PublicPartyLeave' test.out

#- 41 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jmHZAAvKTH8MuqIg' \
    > test.out 2>&1
eval_tap $? 41 'PublicPartyReject' test.out

#- 42 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId '0CzkguwuJCW7EEFB' \
    --userId '67AODbi9BzupBsFp' \
    > test.out 2>&1
eval_tap $? 42 'PublicPartyKick' test.out

#- 43 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Yc77GtRUcCFeY5g4": {}, "XgBsbfzqxBPNe8ae": {}, "1Il4aAtEbu4IjGdq": {}}, "configurationName": "thRxTjQ7gkZEY8rG", "inactiveTimeout": 38, "inviteTimeout": 35, "joinability": "UmrV6kH4OotKwG3U", "maxPlayers": 58, "members": [{"ID": "dIjvBbA6bfbYaJCJ", "PlatformID": "jfk2TUvn95FhO7VW", "PlatformUserID": "3mbDVMDu87t0ldWf"}, {"ID": "7iSGIiKFtWtn4Yr2", "PlatformID": "svKM6pqLGZ0TBujE", "PlatformUserID": "LAUK6mQ5iZgbwwm5"}, {"ID": "iGzXtcknrgidKupv", "PlatformID": "XO6aj4hCmTC34jxW", "PlatformUserID": "4pIDwdqXpmRmut9H"}], "minPlayers": 72, "textChat": true, "type": "yWI8bp8fQxRuX91u"}' \
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
    --body '{"crossplayEnabled": true, "currentPlatform": "mtrHJbEGTUj7YjER", "data": {"L1rEQG02zccA8wvL": {}, "sWUNd6lPKvqDejvq": {}, "klTSvDwuOrP9lzpi": {}}, "platforms": [{"name": "X0VuFpZum7izxe7N", "userID": "PzjOa8E7wY76PxLv"}, {"name": "9HBEUe89AwEw1HO4", "userID": "FnKtx4XLKAmlDr19"}, {"name": "uJ3nq6VerzVCcI8y", "userID": "3Cz0YqCKUh5RD9vN"}]}' \
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
    --order 'Ap4jinFpnQ5xF9ww' \
    --orderBy 'bvMZyeDeRnVfPUa6' \
    --status 'xVVBcq3wZpFIYeAg' \
    > test.out 2>&1
eval_tap $? 47 'PublicQueryMyGameSessions' test.out

#- 48 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order '79HcLJXJ7mpVI6eT' \
    --orderBy 'YAjdPlCiQQC35cj4' \
    --status 'KyOVgvnWbfRJtsB7' \
    > test.out 2>&1
eval_tap $? 48 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE