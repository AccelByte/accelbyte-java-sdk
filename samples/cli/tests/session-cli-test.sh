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
echo "1..37"

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

#- 4 AdminCreateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminCreateConfigurationTemplateV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "4YLJOsVy", "deployment": "pXZgxazK", "inactiveTimeout": 5, "inviteTimeout": 5, "joinability": "uwnJjVV5", "maxPlayers": 52, "minPlayers": 18, "name": "xKkWiOUl", "requestedRegions": ["wkMPnKR1", "jGT5SuCb", "Y1Y48myU"], "textChat": true, "type": "QbWYgGpf"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name 'WBAH6ZOl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'zyrCsk3A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "uAGisif3", "deployment": "QjTDkkxq", "inactiveTimeout": 76, "inviteTimeout": 29, "joinability": "29fIFgY2", "maxPlayers": 73, "minPlayers": 1, "name": "iKHNJevD", "requestedRegions": ["MRuFJcoQ", "pzjps4b3", "5WnmDLsB"], "textChat": true, "type": "GQinv8R4"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name '071zvyTy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'g6okse1q' \
    --dsPodName 'iQ6BdY8Y' \
    --fromTime 'tHSIuEpX' \
    --gameMode 'vkcancQZ' \
    --joinability 'D8IQqoxf' \
    --limit '17' \
    --matchPool 'h7Hlbv8R' \
    --memberID 'JtaxMt9j' \
    --offset '10' \
    --order 'oE4PWkb4' \
    --orderBy '5g9trQLK' \
    --sessionID 'ydk2P2Xi' \
    --status 'ILSvV8af' \
    --statusV2 'Bv3B977C' \
    --toTime '1gYKts9L' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId '2sZYLCSq' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'e8EUv3DM' \
    --statusType 'Qha2JHzt' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'KtG76H8e' \
    --key 'qnTLshm6' \
    --leaderID 'HMyr6lmz' \
    --limit '40' \
    --memberID '1i1oNBGj' \
    --memberStatus 'ujN4Wpqm' \
    --offset '13' \
    --order 'soUAL1cl' \
    --orderBy '6JBZv0a5' \
    --value 'NmCDsqtS' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"sgM2UddP": {}, "lhp6P6p4": {}, "1lNL0KnQ": {}}, "backfillTicketID": "2rqCHn2U", "clientVersion": "p2kPZJqs", "configurationName": "gvD1xLdd", "deployment": "3iz9PW5c", "inactiveTimeout": 67, "inviteTimeout": 30, "joinability": "IpPBvI0F", "matchPool": "oNXBgDgK", "maxPlayers": 5, "minPlayers": 49, "requestedRegions": ["UP81MH6s", "oQ1ciece", "irYRqCQt"], "serverName": "CVM6tUcv", "teams": [{"UserIDs": ["r9vfpeFb", "MaWYzCEd", "N54hMDzq"], "parties": [{"partyID": "cVqDWnot", "userIDs": ["cY7APzaX", "Uue7guBN", "IUND0gn4"]}, {"partyID": "SMZCTZ3s", "userIDs": ["BKChEqpr", "46Sho8Qa", "jyWzg4ai"]}, {"partyID": "sVdiuGjO", "userIDs": ["uwdzZ7Ww", "1xsBwZdC", "fqmNFGr7"]}]}, {"UserIDs": ["kDelfNzB", "celMoX1i", "M4UeU0Sd"], "parties": [{"partyID": "4ppijLL9", "userIDs": ["s6AAqcHa", "gIDV2w6k", "ytQ1LtMe"]}, {"partyID": "cHwuVkJv", "userIDs": ["ZTLbtqHi", "TPksFjj4", "bpviymjd"]}, {"partyID": "8AdGmlkv", "userIDs": ["9xbrVeT6", "Nc1B5w9P", "rVnDu4Vi"]}]}, {"UserIDs": ["4NeogQSo", "74Ijs4kH", "iJNKhK6v"], "parties": [{"partyID": "VQkmFcvW", "userIDs": ["Sw7s5wR6", "6dsjOQbD", "q8FKxD2Y"]}, {"partyID": "EM502uVZ", "userIDs": ["i1rB31R0", "MUNtdEnL", "Sd83LlcS"]}, {"partyID": "7cOEKgz7", "userIDs": ["7iwyCReC", "OegQKJsq", "WW5Kwtqc"]}]}], "textChat": false, "ticketIDs": ["pXgNCMgh", "VmilX29Q", "q0q4fc3L"], "type": "FbneLlGt"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateGameSession' test.out

#- 13 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"2OwDKvDE": {}, "X65xNU3h": {}, "VVd3PPeK": {}}' \
    > test.out 2>&1
eval_tap $? 13 'PublicQueryGameSessions' test.out

#- 14 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'gt1PcMJZ' \
    > test.out 2>&1
eval_tap $? 14 'GetGameSessionByPodName' test.out

#- 15 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '45acRogV' \
    > test.out 2>&1
eval_tap $? 15 'GetGameSession' test.out

#- 16 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'cdWKEvs1' \
    --body '{"attributes": {"DdowjQAU": {}, "5nOWQmpm": {}, "e8fBRpy3": {}}, "backfillTicketID": "dpblOE1U", "clientVersion": "i4yXQEZh", "deployment": "qx2sXJap", "inactiveTimeout": 18, "inviteTimeout": 60, "joinability": "z00UDOfb", "matchPool": "KpXvSlEW", "maxPlayers": 82, "minPlayers": 96, "requestedRegions": ["Ktblr6NH", "hoh6hv0r", "8WyKroai"], "teams": [{"UserIDs": ["L75KCKlQ", "2Od151f9", "WKQUA8Jv"], "parties": [{"partyID": "Es2j6SBF", "userIDs": ["YR9hZln0", "4Rs8fTs3", "Ue9uSrqS"]}, {"partyID": "LXDxffxq", "userIDs": ["Ts7ZOA0E", "OxENFxyP", "NwDPPrni"]}, {"partyID": "K0V2Ne0S", "userIDs": ["L2SeHj6h", "UTIbnXxk", "66VHq4cZ"]}]}, {"UserIDs": ["Y1DhJwfO", "SFPo5cwE", "sxXJ11Q1"], "parties": [{"partyID": "UEtN5jgP", "userIDs": ["hFgrZpQo", "xIUPCo6j", "txv0mhzl"]}, {"partyID": "C046NpkE", "userIDs": ["u5WlAInH", "y2dBkwNC", "KjirfpHh"]}, {"partyID": "yP4LkuG2", "userIDs": ["yMNDg80h", "0VgyOL0k", "ptEZTkIr"]}]}, {"UserIDs": ["UhEGzRJL", "kHZIWSE3", "b3asqvzs"], "parties": [{"partyID": "r3fYQJgY", "userIDs": ["iG3jm11F", "kwmJ5ClQ", "az0pSkgd"]}, {"partyID": "TW7VOWKQ", "userIDs": ["B0bz2nvT", "sGuCwT4A", "yiqen1wj"]}, {"partyID": "q7Tvdjwt", "userIDs": ["rAj0ZDtl", "KvFKSf6C", "rLziMchG"]}]}], "ticketIDs": ["4ud3O7rJ", "riLri8EB", "Hf2xCPo7"], "type": "1S7hqAGm", "version": 76}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGameSession' test.out

#- 17 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'MGn8jSQH' \
    > test.out 2>&1
eval_tap $? 17 'DeleteGameSession' test.out

#- 18 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId '2L6MnUj8' \
    --body '{"attributes": {"EccHzsZD": {}, "6ueENnnN": {}, "46UeJVQx": {}}, "backfillTicketID": "j5HJJe2O", "clientVersion": "P8HRh4p8", "deployment": "7W2wIwW2", "inactiveTimeout": 65, "inviteTimeout": 63, "joinability": "TjNBV4JQ", "matchPool": "ceOLdqz3", "maxPlayers": 37, "minPlayers": 46, "requestedRegions": ["fCIlRFjr", "C0UjIGQs", "HrYs9HOL"], "teams": [{"UserIDs": ["3M03byW9", "NLTj4sF0", "Oq29NacP"], "parties": [{"partyID": "FZg0whuS", "userIDs": ["yEaBo0uv", "tQn1GlkR", "5umSGea1"]}, {"partyID": "vQlmtaDV", "userIDs": ["KYbWgcMb", "JqNZG7BM", "CPYqUZ35"]}, {"partyID": "cLm3z2A8", "userIDs": ["s6BHNrcW", "sNPHzDJE", "TjvwiNNJ"]}]}, {"UserIDs": ["nWstl6yH", "fYbNYQpB", "dbylGiLE"], "parties": [{"partyID": "0cdI7sGf", "userIDs": ["QfWME5YP", "yIgwPQsD", "gP8Fw9Pq"]}, {"partyID": "0HSIS19M", "userIDs": ["ig170bXz", "rpULb2oD", "yQncd45M"]}, {"partyID": "5W7XbO1X", "userIDs": ["ORzHd8qe", "zZJOiKLG", "iEAvHYql"]}]}, {"UserIDs": ["NtQwPkl5", "qHgBYEOo", "LqYdESl6"], "parties": [{"partyID": "jmxIe5wT", "userIDs": ["v49yPLsD", "Se5eOG10", "Xnt2B7Yq"]}, {"partyID": "dheJMIpm", "userIDs": ["0RwqLvyF", "tsGUCaln", "HTqMfcuD"]}, {"partyID": "2NF03OGB", "userIDs": ["VizV43nq", "QSovv7UX", "AnyyiH71"]}]}], "ticketIDs": ["lThCG2w6", "mIm6Jcrf", "cVBjtpXT"], "type": "bVRZPmG0", "version": 25}' \
    > test.out 2>&1
eval_tap $? 18 'PatchUpdateGameSession' test.out

#- 19 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'wyOaX3Id' \
    --body '{"userID": "oQynko1k"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicGameSessionInvite' test.out

#- 20 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'GZ8EdQlo' \
    > test.out 2>&1
eval_tap $? 20 'JoinGameSession' test.out

#- 21 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'dV8xkmsL' \
    > test.out 2>&1
eval_tap $? 21 'LeaveGameSession' test.out

#- 22 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'EuwQsxgf' \
    > test.out 2>&1
eval_tap $? 22 'PublicGameSessionReject' test.out

#- 23 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "1fYUgzF0"}' \
    > test.out 2>&1
eval_tap $? 23 'PublicPartyJoinCode' test.out

#- 24 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId '5vH5TI1d' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetParty' test.out

#- 25 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'C6r4RvVY' \
    --body '{"attributes": {"nIKkbsMJ": {}, "41U3l2Li": {}, "jZnrB5fZ": {}}, "inactiveTimeout": 0, "inviteTimeout": 30, "joinability": "nUHKDwpy", "maxPlayers": 92, "minPlayers": 59, "type": "M0MTmyag", "version": 22}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateParty' test.out

#- 26 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dw88GYhY' \
    --body '{"attributes": {"RN9jWYTC": {}, "NbkfSnni": {}, "LgB01QVE": {}}, "inactiveTimeout": 52, "inviteTimeout": 78, "joinability": "RvPP4xcw", "maxPlayers": 88, "minPlayers": 59, "type": "7TxpSpcf", "version": 35}' \
    > test.out 2>&1
eval_tap $? 26 'PublicPatchUpdateParty' test.out

#- 27 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'cFhyHfMR' \
    > test.out 2>&1
eval_tap $? 27 'PublicGeneratePartyCode' test.out

#- 28 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'K8opVDvv' \
    > test.out 2>&1
eval_tap $? 28 'PublicRevokePartyCode' test.out

#- 29 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId '9ec4oKhV' \
    --body '{"userID": "PT8hZJ88"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicPartyInvite' test.out

#- 30 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId '8veXQ6GF' \
    --body '{"leaderID": "WQCmWaEM"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPromotePartyLeader' test.out

#- 31 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'QzuMiZXK' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoin' test.out

#- 32 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'MDUt1BzV' \
    > test.out 2>&1
eval_tap $? 32 'PublicPartyLeave' test.out

#- 33 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'nED2qU3C' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyReject' test.out

#- 34 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZuQa4rg0' \
    --userId 'VpiSy9sL' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyKick' test.out

#- 35 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"2lCrkVyA": {}, "CqU23nka": {}, "AKEXIrnx": {}}, "configurationName": "pmn8Hq9w", "inactiveTimeout": 49, "inviteTimeout": 8, "joinability": "YZxvGCEK", "maxPlayers": 49, "members": [{"ID": "Br3V5NJO", "PlatformID": "1REtHFyY", "PlatformUserID": "TfB8bsZu"}, {"ID": "meO7YQuD", "PlatformID": "O5EkNSnW", "PlatformUserID": "QYMMuE6q"}, {"ID": "ZlI4y15h", "PlatformID": "Q5ryHuC0", "PlatformUserID": "c4YOdZc8"}], "minPlayers": 18, "textChat": true, "type": "4BEsGeXb"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicCreateParty' test.out

#- 36 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'cDuIqOZP' \
    --orderBy 'rW41iglq' \
    --status 'Of325wjC' \
    > test.out 2>&1
eval_tap $? 36 'PublicQueryMyGameSessions' test.out

#- 37 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'w9poBSVa' \
    --orderBy '00NpEcv9' \
    --status 'jIucqowO' \
    > test.out 2>&1
eval_tap $? 37 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE