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
echo "1..29"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminGetChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '39' \
    --sortBy 'AxcVpFrttufHIRdH' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 95, "assignmentRule": "UNSCHEDULED", "code": "9nIW0Oaiw9B0D7eH", "description": "pzSn3ZPUdc0qh4n8", "endAfter": 26, "endDate": "1978-07-26T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "Z0m8SAMTwE6I56Ia", "randomizedPerRotation": true, "repeatAfter": 61, "resetConfig": {"resetDate": 56, "resetDay": 2, "resetTime": "XxyaNoMR6hkspInr"}, "rotation": "WEEKLY", "startDate": "1974-03-12T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'UNB1vRodwpzS6DaD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'pv8N7ZQVqGj6oDLj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 99, "assignmentRule": "FIXED", "description": "pUkHODpoMF78NY4Y", "endAfter": 21, "endDate": "1981-10-02T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "s1cnz1JSDgY1TXp3", "randomizedPerRotation": true, "repeatAfter": 12, "resetConfig": {"resetDate": 38, "resetDay": 36, "resetTime": "CTCrbCbPOyNQkT7N"}, "rotation": "NONE", "startDate": "1983-11-27T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'E3cwyALczNIicXm7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'agSrjJW2OQNOs1PX' \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '87' \
    --sortBy 'T5FvdiRilZ7oFgx4' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'c8OumKtPDKJDXn7Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "4U68su8XfqlqNiTv", "description": "B6SdAdIhUDrwoZ5M", "isActive": false, "name": "rXpc1C8XfwHuKeb9", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "3rGN9A3sNm84hddS", "parameterType": "ENTITLEMENT", "statCycleId": "AcBdW19m4eu6d5tA", "targetValue": 0.9314645749067942}, {"matcher": "GREATER_THAN", "parameterName": "duuyZ0GhDogqrhBR", "parameterType": "ACHIEVEMENT", "statCycleId": "N05MYzYiKWe5dNRl", "targetValue": 0.15600665973838967}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "jGGJddVCvu9vx5KQ", "parameterType": "USERACCOUNT", "statCycleId": "KYnIuMBvaO35llzQ", "targetValue": 0.6964642051477627}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "T5kPxUfofvnnSuB0", "parameterType": "STATISTIC_CYCLE", "statCycleId": "SLmCVuHOPlLlkvR8", "targetValue": 0.29191831733638607}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "BSxTeIv53HGCiljv", "parameterType": "ENTITLEMENT", "statCycleId": "1C2qtPYokahFjkQs", "targetValue": 0.0942576911439913}, {"matcher": "LESS_THAN", "parameterName": "QHAf8TgoNm03VLis", "parameterType": "ENTITLEMENT", "statCycleId": "zwPuo3td6TC6I3lM", "targetValue": 0.15319282496473985}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "WN2laRlxfcjHfYak", "parameterType": "ACHIEVEMENT", "statCycleId": "CTqGkE7wcWfDslpJ", "targetValue": 0.71417154205065}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "ytLPziZMdjxcBZuf", "parameterType": "STATISTIC_CYCLE", "statCycleId": "AQ6iiPlSC2uE4o5V", "targetValue": 0.36458520468327116}, {"matcher": "EQUAL", "parameterName": "Bm3MqHcUmLZZbSqb", "parameterType": "STATISTIC", "statCycleId": "RwNmn9HrNQy4uZAA", "targetValue": 0.14337826006146515}]}], "rewards": [{"itemId": "E0mit9RGCCHYzUOc", "itemName": "EdscKHPEqgA8yu7V", "qty": 0.17399474039181206, "type": "STATISTIC"}, {"itemId": "Jt4Ymos9Jcdos4fY", "itemName": "cTVU6RBt0zYoMcHy", "qty": 0.4548055408680831, "type": "ENTITLEMENT"}, {"itemId": "EXlAvxJMdalwSyli", "itemName": "WMNW5NyLu0M3VHh2", "qty": 0.48435798081743175, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1986-01-11T00:00:00Z", "order": 86, "startTime": "1997-12-05T00:00:00Z"}, "tags": ["bQ6Q9lNmqRBaAkLn", "vxkT1X68cmDc3fxU", "8MyKrQpM4hkkK6KK"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'XNB3Gv0IqmF51Tkh' \
    --code 'jYnaq6foWvXa3bMr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'XsDr6kILsSSyDdmy' \
    --code 'kmoPYgc2L4jk4Lo0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "LSP0pf4IxjUkl535", "isActive": false, "name": "6BXksUC9b6i5lZC9", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "gb3boLQQ1MzH7Qm8", "parameterType": "ACHIEVEMENT", "statCycleId": "Bdte9NDUPVJf6c2Z", "targetValue": 0.8395216845227446}, {"matcher": "LESS_THAN", "parameterName": "ZxfgPubTDIHrvqAT", "parameterType": "ENTITLEMENT", "statCycleId": "EeERmDnyeFoF7VSZ", "targetValue": 0.9402783158146515}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "JbRFQSKVPHbn4Xxt", "parameterType": "STATISTIC", "statCycleId": "UhAEtrmjqU6YE3p4", "targetValue": 0.18072800126000954}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "Zqan0nSBJroav91G", "parameterType": "USERACCOUNT", "statCycleId": "lvPG6bFYReVHQipc", "targetValue": 0.4669099169792119}, {"matcher": "LESS_THAN", "parameterName": "gWa24CKNS0GqVvUf", "parameterType": "USERACCOUNT", "statCycleId": "EW4ZJJ42d3PBddN8", "targetValue": 0.7139788005559538}, {"matcher": "GREATER_THAN", "parameterName": "lSAiYnNjkfZrQvGg", "parameterType": "ACHIEVEMENT", "statCycleId": "k03QXcKMDYDDxHSZ", "targetValue": 0.14893701811610782}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "FSrUEirnjX9fDmIb", "parameterType": "ACHIEVEMENT", "statCycleId": "kydwYWQG26yUZNmT", "targetValue": 0.45140416990647114}, {"matcher": "EQUAL", "parameterName": "pFDcSDG8aMVGLiBN", "parameterType": "STATISTIC", "statCycleId": "8ilbyDPUIj88cekd", "targetValue": 0.272837186189996}, {"matcher": "LESS_THAN", "parameterName": "2ncYAHdNzDmeIP6r", "parameterType": "STATISTIC", "statCycleId": "5cJcHm3SZLxoRDFu", "targetValue": 0.33710861273513726}]}], "rewards": [{"itemId": "uySj29a9LJE8HoRS", "itemName": "1X2PFAAMwzHPxB1U", "qty": 0.3039074127269502, "type": "ENTITLEMENT"}, {"itemId": "nqntX9y1aZSWMiVi", "itemName": "10sG6vxkfUcmqRRb", "qty": 0.04276320897749086, "type": "ENTITLEMENT"}, {"itemId": "BJCjfcnLRfxeCSz9", "itemName": "WEi8KlloeH0JT1yd", "qty": 0.32462326986279444, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1980-07-12T00:00:00Z", "order": 43, "startTime": "1993-12-21T00:00:00Z"}, "tags": ["T0GfH2rtOa4EXsXz", "OXQAk4mqrxzTtuLl", "4XlbGL8QOxtjzm8y"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '2wNhmwoYZyI4EFZK' \
    --code 'BcYrCEAE7WIsfmx4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode '0NLRc6m8heKnWhzf' \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode '2NubeoKFeIaFQCYo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'DPICpnduEEQlULdJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAssignmentPlugin' test.out

#- 16 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "z4mnRBkMNxvvKgAT", "extendType": "APP", "grpcServerAddress": "mJrYq6hRkloqxM3g"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateAssignmentPlugin' test.out

#- 17 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "pwxcfMy9XzjjI5Yb", "extendType": "CUSTOM", "grpcServerAddress": "aKDUL3sa13lk1dQB"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminCreateAssignmentPlugin' test.out

#- 18 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteAssignmentPlugin' test.out

#- 19 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["HO86IlBhnetU4RwT", "qUXlTDBzOuYsaZA2", "yyd4mbqoOfADMMAX"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminEvaluateProgress' test.out

#- 20 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["FaY9eKa699bRVhya", "KwwrAP2aMlu7WtjC", "toYetOO847g8OudO"], "userId": "fjnCuHZ3c46IjGa2"}, {"rewardIds": ["3YvYmmDg7VYPXIuv", "UYTZBRujIUE1Tq5j", "yAZvkRCMNFIurjh2"], "userId": "imdb4rbkXj0ZwsVC"}, {"rewardIds": ["0gL97ZVJSPqJiwv1", "qlYB1RSKs6gQxC3G", "b7S0o4zGYY7KQI1A"], "userId": "eFgPqaOkvo1aolB4"}]' \
    > test.out 2>&1
eval_tap $? 20 'AdminClaimUsersRewards' test.out

#- 21 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'lkKB4EYOkQ1jMD3c' \
    --limit '51' \
    --offset '53' \
    --sortBy 'm8xIfkOVW2grREOL' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetUserRewards' test.out

#- 22 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'vNXTwGBCtohLtl9Z' \
    --body '{"rewardIDs": ["uhytm5UDrT6QXCs5", "SPBbRPZTF6oQAXVG", "7tnsZg5QgXjvyGJP"]}' \
    > test.out 2>&1
eval_tap $? 22 'AdminClaimUserRewards' test.out

#- 23 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '1' \
    --sortBy '4eXbJE5Vs2GcyomQ' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 23 'GetChallenges' test.out

#- 24 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'cAx2K2zkRenmPZnG' \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '48' \
    --tags 't4P7WnbdSJtjX7Zs,hZyZl5x4bRXBHUTr,DzZSKscfOcYu3dpC' \
    > test.out 2>&1
eval_tap $? 24 'PublicGetScheduledGoals' test.out

#- 25 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'EvaluateMyProgress' test.out

#- 26 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'ROYqUiGKXVFCmpo6' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1980-01-03T00:00:00Z' \
    --goalCode 'PwVOEDSJsEK5QpNh' \
    --limit '24' \
    --offset '25' \
    --tags 'I2iS5EpGhhvXYck0,upMzUYnb76tFkEOR,V3bu1bNCtX7W40V6' \
    > test.out 2>&1
eval_tap $? 26 'PublicGetUserProgression' test.out

#- 27 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'Do5sYadCCFrHHC3D' \
    --index '31' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'JzPyrVEiOG4Ucqsu' \
    --limit '67' \
    --offset '75' \
    --tags 'mnfHK8CCmE2lPnsb,D3SGEdlwuUccE536,ugBp3HBvepnDCjgy' \
    > test.out 2>&1
eval_tap $? 27 'PublicGetPastUserProgression' test.out

#- 28 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '21' \
    --sortBy 'lXe36mgWjLfFmteu' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'PublicGetUserRewards' test.out

#- 29 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["GezKsDwG2omOR2nv", "YI9TVqJdvzcWbfUp", "aXp5JMl5LL4bTxBm"]}' \
    > test.out 2>&1
eval_tap $? 29 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE