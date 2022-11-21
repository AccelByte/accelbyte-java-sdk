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
    --body '{"clientVersion": "SfBzwZEP", "deployment": "SZERMJcr", "inactiveTimeout": 20, "inviteTimeout": 54, "joinability": "M6JqhpkP", "maxPlayers": 24, "minPlayers": 32, "name": "p9lCgMc1", "requestedRegions": ["RJ8V1nSq", "csK6LW93", "LjZkorAF"], "type": "3rlkZFSa"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateConfigurationTemplateV1' test.out

#- 5 AdminGetAllConfigurationTemplatesV1
./ng net.accelbyte.sdk.cli.Main session adminGetAllConfigurationTemplatesV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetAllConfigurationTemplatesV1' test.out

#- 6 AdminGetConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminGetConfigurationTemplateV1 \
    --name '2v4Hwwsh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetConfigurationTemplateV1' test.out

#- 7 AdminUpdateConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminUpdateConfigurationTemplateV1 \
    --name 'Lx3T33cg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientVersion": "CiTj05Tq", "deployment": "8omAEU1u", "inactiveTimeout": 83, "inviteTimeout": 56, "joinability": "B7HAVcmy", "maxPlayers": 49, "minPlayers": 60, "name": "kGYfbrC2", "requestedRegions": ["Qk44nt3v", "gR6tlYpw", "9bPFqdhc"], "type": "PrLiRTrc"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateConfigurationTemplateV1' test.out

#- 8 AdminDeleteConfigurationTemplateV1
./ng net.accelbyte.sdk.cli.Main session adminDeleteConfigurationTemplateV1 \
    --name 'Na6UzIKp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteConfigurationTemplateV1' test.out

#- 9 AdminQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session adminQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --configurationName 'ESXENIqY' \
    --dsPodName 'AeA2srfi' \
    --fromTime 'qZFf8ttM' \
    --gameMode 'ey3Ewjz9' \
    --joinability 'fL895lAj' \
    --limit '2' \
    --matchPool '87dLSXov' \
    --memberID '9awQ42ek' \
    --offset '86' \
    --order 'Fp9DQRz4' \
    --orderBy 'LxpkSEYi' \
    --sessionID 'VdgjM4wt' \
    --status 'foWsDRD7' \
    --toTime 'cddqv1HV' \
    > test.out 2>&1
eval_tap $? 9 'AdminQueryGameSessions' test.out

#- 10 AdminUpdateGameSessionMember
./ng net.accelbyte.sdk.cli.Main session adminUpdateGameSessionMember \
    --memberId 'pRfrupM6' \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LEypCHPP' \
    --statusType 'Tn7GYJCm' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGameSessionMember' test.out

#- 11 AdminQueryParties
./ng net.accelbyte.sdk.cli.Main session adminQueryParties \
    --namespace "$AB_NAMESPACE" \
    --joinability 'Lg9702o7' \
    --key '8b4xH6rM' \
    --leaderID '3MgoT7Fd' \
    --limit '41' \
    --memberID 'LUoepbJe' \
    --memberStatus 'BkWVWgjP' \
    --offset '4' \
    --order 'PhEIZ8HY' \
    --orderBy 'VCnQKSRb' \
    --value 'T8bhIpA8' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryParties' test.out

#- 12 CreateGameSession
./ng net.accelbyte.sdk.cli.Main session createGameSession \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"JDD6az3D": {}, "zcHfg2qL": {}, "WLclGsGH": {}}, "backfillTicketID": "k83BPWzo", "clientVersion": "A6wTogMC", "configurationName": "bt8WshtA", "deployment": "oRMOvQqN", "inactiveTimeout": 38, "inviteTimeout": 65, "joinability": "kX3Fq9by", "matchPool": "9cPiGvhk", "maxPlayers": 35, "minPlayers": 94, "requestedRegions": ["44xmFAWI", "hQh4inZe", "5aXZU9Pi"], "serverName": "zf0zCbtE", "teams": [{"UserIDs": ["K4F2CmQy", "ZY4mL9P8", "YWpEnqQ1"]}, {"UserIDs": ["VMhj2j0e", "mQfrteWw", "TsHW8stE"]}, {"UserIDs": ["8YVLMzPA", "thfANjQ0", "cVlA96oP"]}], "ticketIDs": ["p3ykTDwj", "dhBE4oWY", "bavSBUX6"], "type": "TtMci0l8"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateGameSession' test.out

#- 13 PublicQueryGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryGameSessions \
    --namespace "$AB_NAMESPACE" \
    --body '{"tez2Kz0A": {}, "3jUBRA82": {}, "I9dDFnSF": {}}' \
    > test.out 2>&1
eval_tap $? 13 'PublicQueryGameSessions' test.out

#- 14 GetGameSessionByPodName
./ng net.accelbyte.sdk.cli.Main session getGameSessionByPodName \
    --namespace "$AB_NAMESPACE" \
    --podName 'mjBUk3QS' \
    > test.out 2>&1
eval_tap $? 14 'GetGameSessionByPodName' test.out

#- 15 GetGameSession
./ng net.accelbyte.sdk.cli.Main session getGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'bV2zdGMS' \
    > test.out 2>&1
eval_tap $? 15 'GetGameSession' test.out

#- 16 UpdateGameSession
./ng net.accelbyte.sdk.cli.Main session updateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'qTru62ne' \
    --body '{"attributes": {"jWNw4cW1": {}, "VQp1wjaC": {}, "XstlQe3E": {}}, "backfillTicketID": "O180SicV", "clientVersion": "Gugg0d9Z", "deployment": "jiXjXIQt", "inactiveTimeout": 22, "inviteTimeout": 45, "joinability": "csjZdWqd", "matchPool": "2PwyX2YO", "maxPlayers": 88, "minPlayers": 24, "requestedRegions": ["N2ar3qFt", "p07c0pb3", "b2DjLVsn"], "teams": [{"UserIDs": ["PQVvm0bX", "iIOC5eun", "45fc0DPQ"]}, {"UserIDs": ["IBobjPMH", "wMRY8Tuh", "oVcXgUZJ"]}, {"UserIDs": ["KJvMYi4T", "BAivDE9K", "mNI8Yn1z"]}], "ticketIDs": ["it6D3kKf", "T0QdZEcu", "hMMhpvcf"], "type": "aZOhtC9Y", "version": 77}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateGameSession' test.out

#- 17 DeleteGameSession
./ng net.accelbyte.sdk.cli.Main session deleteGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CjSSNu74' \
    > test.out 2>&1
eval_tap $? 17 'DeleteGameSession' test.out

#- 18 PatchUpdateGameSession
./ng net.accelbyte.sdk.cli.Main session patchUpdateGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'CH8I4TjU' \
    --body '{"attributes": {"AQYkYGQ0": {}, "hqmKBwCo": {}, "y7hYVhQx": {}}, "backfillTicketID": "eeZC9pRG", "clientVersion": "O0XOHLsc", "deployment": "Z0C5ZuTT", "inactiveTimeout": 17, "inviteTimeout": 44, "joinability": "Dp6Kovfn", "matchPool": "nt60Qa4b", "maxPlayers": 24, "minPlayers": 29, "requestedRegions": ["1YlcEt7U", "ZtGZFopp", "wYPLAGiH"], "teams": [{"UserIDs": ["NOTIe4Ag", "Sh178Wpa", "x0xdDECw"]}, {"UserIDs": ["ozN5xCwH", "1HKWXkXL", "0g9HYPCr"]}, {"UserIDs": ["H9bWw99m", "O8Dext0G", "EbnvS37j"]}], "ticketIDs": ["9PF7eAux", "anSkOaCJ", "vm4s08gs"], "type": "3wtMgu0K", "version": 83}' \
    > test.out 2>&1
eval_tap $? 18 'PatchUpdateGameSession' test.out

#- 19 PublicGameSessionInvite
./ng net.accelbyte.sdk.cli.Main session publicGameSessionInvite \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'eM0mAnPU' \
    --body '{"userID": "SsV1fKxq"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicGameSessionInvite' test.out

#- 20 JoinGameSession
./ng net.accelbyte.sdk.cli.Main session joinGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'UP5FmDpw' \
    > test.out 2>&1
eval_tap $? 20 'JoinGameSession' test.out

#- 21 LeaveGameSession
./ng net.accelbyte.sdk.cli.Main session leaveGameSession \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'FrrFy6EN' \
    > test.out 2>&1
eval_tap $? 21 'LeaveGameSession' test.out

#- 22 PublicGameSessionReject
./ng net.accelbyte.sdk.cli.Main session publicGameSessionReject \
    --namespace "$AB_NAMESPACE" \
    --sessionId 't7fW1YBW' \
    > test.out 2>&1
eval_tap $? 22 'PublicGameSessionReject' test.out

#- 23 PublicPartyJoinCode
./ng net.accelbyte.sdk.cli.Main session publicPartyJoinCode \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "82fhcw5H"}' \
    > test.out 2>&1
eval_tap $? 23 'PublicPartyJoinCode' test.out

#- 24 PublicGetParty
./ng net.accelbyte.sdk.cli.Main session publicGetParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'Kt3PMIZV' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetParty' test.out

#- 25 PublicUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DJ331mga' \
    --body '{"attributes": {"D029ddg4": {}, "nJGZGbU2": {}, "26RqB2aK": {}}, "inactiveTimeout": 34, "inviteTimeout": 31, "joinability": "5dB12M6k", "maxPlayers": 5, "minPlayers": 84, "type": "GSJcfvQD", "version": 42}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateParty' test.out

#- 26 PublicPatchUpdateParty
./ng net.accelbyte.sdk.cli.Main session publicPatchUpdateParty \
    --namespace "$AB_NAMESPACE" \
    --partyId 'SvolGyAV' \
    --body '{"attributes": {"hSO5bYwm": {}, "dp9rIM51": {}, "1LDU1zz6": {}}, "inactiveTimeout": 86, "inviteTimeout": 62, "joinability": "gV5idWRD", "maxPlayers": 13, "minPlayers": 31, "type": "ICwrd2Hz", "version": 33}' \
    > test.out 2>&1
eval_tap $? 26 'PublicPatchUpdateParty' test.out

#- 27 PublicGeneratePartyCode
./ng net.accelbyte.sdk.cli.Main session publicGeneratePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'DxyyvnTx' \
    > test.out 2>&1
eval_tap $? 27 'PublicGeneratePartyCode' test.out

#- 28 PublicRevokePartyCode
./ng net.accelbyte.sdk.cli.Main session publicRevokePartyCode \
    --namespace "$AB_NAMESPACE" \
    --partyId 'h5twoE8M' \
    > test.out 2>&1
eval_tap $? 28 'PublicRevokePartyCode' test.out

#- 29 PublicPartyInvite
./ng net.accelbyte.sdk.cli.Main session publicPartyInvite \
    --namespace "$AB_NAMESPACE" \
    --partyId 'ZLs062me' \
    --body '{"userID": "EITaOhuW"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicPartyInvite' test.out

#- 30 PublicPromotePartyLeader
./ng net.accelbyte.sdk.cli.Main session publicPromotePartyLeader \
    --namespace "$AB_NAMESPACE" \
    --partyId 'jTuIZBO0' \
    --body '{"leaderID": "GVgHxgQw"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicPromotePartyLeader' test.out

#- 31 PublicPartyJoin
./ng net.accelbyte.sdk.cli.Main session publicPartyJoin \
    --namespace "$AB_NAMESPACE" \
    --partyId 'uahvlBjG' \
    > test.out 2>&1
eval_tap $? 31 'PublicPartyJoin' test.out

#- 32 PublicPartyLeave
./ng net.accelbyte.sdk.cli.Main session publicPartyLeave \
    --namespace "$AB_NAMESPACE" \
    --partyId 'qvOUuYrB' \
    > test.out 2>&1
eval_tap $? 32 'PublicPartyLeave' test.out

#- 33 PublicPartyReject
./ng net.accelbyte.sdk.cli.Main session publicPartyReject \
    --namespace "$AB_NAMESPACE" \
    --partyId 'iGJEoUmh' \
    > test.out 2>&1
eval_tap $? 33 'PublicPartyReject' test.out

#- 34 PublicPartyKick
./ng net.accelbyte.sdk.cli.Main session publicPartyKick \
    --namespace "$AB_NAMESPACE" \
    --partyId 'dpNL0IQV' \
    --userId 'FamULQCp' \
    > test.out 2>&1
eval_tap $? 34 'PublicPartyKick' test.out

#- 35 PublicCreateParty
./ng net.accelbyte.sdk.cli.Main session publicCreateParty \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"KwixoxIS": {}, "uXrPvFJ7": {}, "20LDCoVK": {}}, "configurationName": "0IlSOt3n", "inactiveTimeout": 24, "inviteTimeout": 8, "joinability": "DbvmqkPq", "maxPlayers": 42, "members": [{"ID": "R1lADBkd", "PlatformID": "QxA8i6Tn", "PlatformUserID": "MJ1zgT0i"}, {"ID": "gIH0INsM", "PlatformID": "6T8AiwUP", "PlatformUserID": "mhOu78ax"}, {"ID": "pWcdGQ9M", "PlatformID": "w2R4qQIx", "PlatformUserID": "3hlS5bFw"}], "minPlayers": 70, "type": "HrpOAoj1"}' \
    > test.out 2>&1
eval_tap $? 35 'PublicCreateParty' test.out

#- 36 PublicQueryMyGameSessions
./ng net.accelbyte.sdk.cli.Main session publicQueryMyGameSessions \
    --namespace "$AB_NAMESPACE" \
    --order 'PVIvVLLG' \
    --orderBy 'O4b3EJKz' \
    --status 'Yf0IJnDb' \
    > test.out 2>&1
eval_tap $? 36 'PublicQueryMyGameSessions' test.out

#- 37 PublicQueryMyParties
./ng net.accelbyte.sdk.cli.Main session publicQueryMyParties \
    --namespace "$AB_NAMESPACE" \
    --order 'X8fvhspO' \
    --orderBy 'H0uNIyOx' \
    --status 'eXRLUbjg' \
    > test.out 2>&1
eval_tap $? 37 'PublicQueryMyParties' test.out


rm -f "tmp.dat"

exit $EXIT_CODE