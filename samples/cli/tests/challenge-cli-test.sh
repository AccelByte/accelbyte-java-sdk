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
echo "1..39"

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
    --keyword 'EAxcVpFrttufHIRd' \
    --limit '68' \
    --offset '59' \
    --sortBy 'code:asc' \
    --status 'TIED' \
    --tags '09nIW0Oaiw9B0D7e,HpzSn3ZPUdc0qh4n,8mzZ0m8SAMTwE6I5' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 59, "assignmentRule": "CUSTOM", "code": "Lx8bbgorQeFbQ1g7", "description": "qbPngUNB1vRodwpz", "endAfter": 91, "endDate": "1988-09-29T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "dgs21Jub74CUkNmK", "randomizedPerRotation": false, "repeatAfter": 19, "resetConfig": {"resetDate": 16, "resetDay": 99, "resetTime": "5pUkHODpoMF78NY4"}, "rotation": "MONTHLY", "startDate": "1981-10-02T00:00:00Z", "tags": ["a5tWEIC32ogW7olv", "bTgrhRTcPiSuL0Sl", "y6XM4OI18mAQLnzj"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetItemReferences
./ng net.accelbyte.sdk.cli.Main challenge adminGetItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId 'Mf8GZ2WBZqxYG3aR' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetItemReferences' test.out

#- 5 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'EAu2D6QVKNCWP75T' \
    --limit '57' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 5 'AdminGetActiveChallenges' test.out

#- 6 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'i7pKxR8dl0zRVW4E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetChallenge' test.out

#- 7 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'ZG9m0XcgGVbMqSsz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 63, "assignmentRule": "FIXED", "description": "GHavj7AorKsxwkos", "endAfter": 54, "endDate": "1995-11-12T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "ecdKi5r6QEa1ysLE", "randomizedPerRotation": true, "repeatAfter": 23, "resetConfig": {"resetDate": 39, "resetDay": 14, "resetTime": "rGN9A3sNm84hddSp"}, "rotation": "DAILY", "startDate": "1981-08-16T00:00:00Z", "tags": ["0P7MIIR7CkyF6C7d", "uuyZ0GhDogqrhBRd", "8lDR6qVNPRZYdFLI"]}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpdateChallenge' test.out

#- 8 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'AjGGJddVCvu9vx5K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeleteChallenge' test.out

#- 9 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'Q7KYnIuMBvaO35ll' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '86' \
    --sortBy 'updatedAt:desc' \
    --tags 'pbsx5w8hqUI06UpO,XGSLmCVuHOPlLlkv,R8sKgnuRkgghGoYu' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoals' test.out

#- 10 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'pD391C2qtPYokahF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "jkQsfCaTmt1d67FX", "description": "Gk2s9Q0mPVo3twu0", "isActive": false, "name": "C6I3lMjGSWN2laRl", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "xNeIxPz6MbwL6IY6", "matcher": "GREATER_THAN_EQUAL", "parameterName": "z1UaLqYSYWytLPzi", "parameterType": "ENTITLEMENT", "statCycleId": "djxcBZufQxGiHPll", "targetValue": 0.5278113686882158}, {"id": "4cYEzfTD1ZBm3MqH", "matcher": "EQUAL", "parameterName": "IJA8IHtrkmu0hpDD", "parameterType": "USERACCOUNT", "statCycleId": "VAla2l5BYNtIuS5S", "targetValue": 0.9290225484196863}, {"id": "XUdjsoqwGyzzWi9g", "matcher": "GREATER_THAN_EQUAL", "parameterName": "EqgA8yu7Vk6Jt4Ym", "parameterType": "ENTITLEMENT", "statCycleId": "Zv15T7quIOvBMcaY", "targetValue": 0.19653298292388632}]}, {"operator": "AND", "predicates": [{"id": "t0zYoMcHyCUEXlAv", "matcher": "LESS_THAN", "parameterName": "oxozr6wfNPX2bOIt", "parameterType": "STATISTIC_CYCLE", "statCycleId": "MvqtlB2jJCSQT279", "targetValue": 0.8253075009386222}, {"id": "ZPYGu0rdlgdWyOtX", "matcher": "GREATER_THAN", "parameterName": "nvxkT1X68cmDc3fx", "parameterType": "ENTITLEMENT", "statCycleId": "8MyKrQpM4hkkK6KK", "targetValue": 0.7907525128025318}, {"id": "NB3Gv0IqmF51Tkhj", "matcher": "GREATER_THAN", "parameterName": "4YUDjasWIPUvmEej", "parameterType": "STATISTIC", "statCycleId": "r6kILsSSyDdmykmo", "targetValue": 0.6614123968623837}]}, {"operator": "AND", "predicates": [{"id": "5MXbN9oCMNqq98Sj", "matcher": "GREATER_THAN_EQUAL", "parameterName": "IxjUkl535X3ateEK", "parameterType": "STATISTIC_CYCLE", "statCycleId": "UC9b6i5lZC9xv32e", "targetValue": 0.9724366533870137}, {"id": "c5csSovoqsZNBdte", "matcher": "EQUAL", "parameterName": "NDUPVJf6c2Z0QZxf", "parameterType": "ACHIEVEMENT", "statCycleId": "2WDgCcxvONZm3EeE", "targetValue": 0.7034650646372707}, {"id": "mDnyeFoF7VSZ6pf3", "matcher": "GREATER_THAN_EQUAL", "parameterName": "FQSKVPHbn4Xxtu7L", "parameterType": "STATISTIC_CYCLE", "statCycleId": "RENjEEztx1WsYSiZ", "targetValue": 0.2707198325256195}]}], "rewards": [{"itemId": "an0nSBJroav91GXl", "itemName": "vPG6bFYReVHQipcC", "qty": 0.3787010021828824, "type": "ENTITLEMENT"}, {"itemId": "w5D2L7vIYhGGSyEW", "itemName": "4ZJJ42d3PBddN8S4", "qty": 0.9737483928271218, "type": "ENTITLEMENT"}, {"itemId": "lSAiYnNjkfZrQvGg", "itemName": "bLdLsFzHkBMr1yrO", "qty": 0.6137746807108597, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1981-11-19T00:00:00Z", "order": 34, "startTime": "1987-07-20T00:00:00Z"}, "tags": ["rUEirnjX9fDmIbeZ", "xzfTcyiuATus9hsf", "pFDcSDG8aMVGLiBN"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'rDjqoxcwgGLXpUL4' \
    --code 'pp2ncYAHdNzDmeIP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode '6rOvDz9KOsb392k6' \
    --code 'YmJFfRByjlBiuFM3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "FIoVk8T3GpAnkCmB", "isActive": true, "name": "qg2SCnqntX9y1aZS", "requirementGroups": [{"operator": "AND", "predicates": [{"id": "MiVi10sG6vxkfUcm", "matcher": "GREATER_THAN_EQUAL", "parameterName": "33T5UBJCjfcnLRfx", "parameterType": "ACHIEVEMENT", "statCycleId": "nhhqElIaDml48wdN", "targetValue": 0.5117419938187778}, {"id": "LTm5T50x9WT0GfH2", "matcher": "GREATER_THAN_EQUAL", "parameterName": "u4jmsRE2w1yEkLgh", "parameterType": "STATISTIC", "statCycleId": "tIYt4SqYUTLDx9gI", "targetValue": 0.1355067540620255}, {"id": "DandpGT2t24aOMh5", "matcher": "EQUAL", "parameterName": "yI4EFZKBcYrCEAE7", "parameterType": "STATISTIC_CYCLE", "statCycleId": "Isfmx40NLRc6m8he", "targetValue": 0.5809699900251476}]}, {"operator": "AND", "predicates": [{"id": "as4b6z3LNUj7fdgL", "matcher": "LESS_THAN", "parameterName": "FQCYoDPICpnduEEQ", "parameterType": "ENTITLEMENT", "statCycleId": "DoNf3n0hEoRCAcf8", "targetValue": 0.8509210913763425}, {"id": "zfFyabWAgIUXiI07", "matcher": "LESS_THAN", "parameterName": "xM3gpwxcfMy9Xzjj", "parameterType": "USERACCOUNT", "statCycleId": "bc0NaKDUL3sa13lk", "targetValue": 0.8632215515173485}, {"id": "dQBHO86IlBhnetU4", "matcher": "GREATER_THAN_EQUAL", "parameterName": "DNxtXgeO3FgkXhjD", "parameterType": "STATISTIC_CYCLE", "statCycleId": "2yyd4mbqoOfADMMA", "targetValue": 0.7958795719596689}]}, {"operator": "AND", "predicates": [{"id": "e5dC9XIBudfZgrbH", "matcher": "LESS_THAN", "parameterName": "wrAP2aMlu7WtjCto", "parameterType": "STATISTIC", "statCycleId": "etOO847g8OudOfjn", "targetValue": 0.4654533155946895}, {"id": "uHZ3c46IjGa23YvY", "matcher": "GREATER_THAN", "parameterName": "Ns92epxk0i8VxsZN", "parameterType": "ACHIEVEMENT", "statCycleId": "RujIUE1Tq5jyAZvk", "targetValue": 0.6942760838322828}, {"id": "CMNFIurjh2imdb4r", "matcher": "EQUAL", "parameterName": "OkAYfJB8AT9t4Tv2", "parameterType": "USERACCOUNT", "statCycleId": "7Y2QD3oD5fLCr3OO", "targetValue": 0.18779564121425962}]}], "rewards": [{"itemId": "XVv8ZGF7uYnGzpip", "itemName": "NDigNJma1MbqqZtf", "qty": 0.6300869006016004, "type": "STATISTIC"}, {"itemId": "aolB4lkKB4EYOkQ1", "itemName": "jMD3cym8xIfkOVW2", "qty": 0.10205764720722665, "type": "STATISTIC"}, {"itemId": "C9LxhvNXTwGBCtoh", "itemName": "Ltl9Zuhytm5UDrT6", "qty": 0.6830774196981679, "type": "STATISTIC"}], "schedule": {"endTime": "1993-05-29T00:00:00Z", "order": 75, "startTime": "1990-12-27T00:00:00Z"}, "tags": ["Rkb738HGS6rDgMdI", "IlhS1fSiM9331m7T", "a1PsKc50Kv6ecnEe"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'vcAx2K2zkRenmPZn' \
    --code 'GBt4P7WnbdSJtjX7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'ZshZyZl5x4bRXBHU' \
    --code 'TrDzZSKscfOcYu3d' \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '65' \
    --userId 'CROYqUiGKXVFCmpo' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode '6sPwVOEDSJsEK5Qp' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'hlI2iS5EpGhhvXYc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'k0upMzUYnb76tFkE' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1991-06-29T00:00:00Z' \
    --limit '89' \
    --offset '77' \
    --userId 'V3bu1bNCtX7W40V6' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'Do5sYadCCFrHHC3D' \
    --namespace "$AB_NAMESPACE" \
    --safeDelete 'pZxkrQDXuNFviMar' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'v8mnfHK8CCmE2lPn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1988-01-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminUpdateTiedChallengeSchedule' test.out

#- 20 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminGetAssignmentPlugin' test.out

#- 21 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "pomM8sm1MiaI1mX2", "extendType": "CUSTOM", "grpcServerAddress": "ugBp3HBvepnDCjgy"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "JlXe36mgWjLfFmte", "extendType": "CUSTOM", "grpcServerAddress": "nGezKsDwG2omOR2n"}' \
    > test.out 2>&1
eval_tap $? 22 'AdminCreateAssignmentPlugin' test.out

#- 23 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminDeleteAssignmentPlugin' test.out

#- 24 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'vYI9TVqJdvzcWbfU,paXp5JMl5LL4bTxB,mZjdrrIxsB0NRsB1' \
    --includeOneTimeEvent 'fPqqRRulpqpymDkQ' \
    --body '{"userIds": ["htrHWwRVnwVBOqOH", "i8pWGd1juYhiqjRJ", "OqB5F93zFQbJndUD"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["pdONneAczbBdHb2s", "lt71B1SmZp2JZp50", "CnPb71ORYcmQbTU5"], "userId": "JX8ccLjMXJRk0eaK"}, {"rewardIds": ["QDOJvrTefglSs6g4", "iY9u02aCNYIWekp1", "8lOC3mNqF7Bl0Lcg"], "userId": "hVHfPEspxwhRON0b"}, {"rewardIds": ["c1eMbEIjowLqc3ec", "jXJbZDKKoxLE1Y3D", "ymtj3giPg4x4yiPX"], "userId": "6ues1Hhhkg1yLVbL"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'FzHEP8cM4NTwr0KH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aAsmTej52WKi6tAr' \
    --body '{"goalCode": "AURt9plCSVq8PdH6"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'hJPUAc0RVwXgAgnt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LMCuaXBWQi6BqPg4' \
    --dateTime '1983-05-23T00:00:00Z' \
    --goalCode 'XcrciYNEzvSZIPkh' \
    --limit '91' \
    --offset '12' \
    --tags 'gORcz5S5BvmgBLxh,4ijFnE3Tam69qSZ7,PC6f6QkmZXElW9Yf' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'RSse6AAz3S4czz0Q' \
    --challengeCode 'KFlAVmVLu4AOec0z' \
    --goalProgressionId '8eBeeoip68J1nsv4' \
    --limit '100' \
    --offset '12' \
    --sortBy 'updatedAt:desc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'JhtafxMSJlHeb34s' \
    --body '{"rewardIDs": ["ZKHcl5LLLOexL4fZ", "vWtND2tcBFpX8lNt", "FEJ7tnkY6Mca5afj"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword '12K2IzrBvvWm4udE' \
    --limit '57' \
    --offset '83' \
    --sortBy 'updatedAt:desc' \
    --status 'RETIRED' \
    --tags '0TdlNBJYOmpu1VCa,rzBsV6xnZ5Jrzzjr,caug6CWVG8SWP3gl' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'U6muswVJnNnN7kAa' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '18' \
    --sortBy 'updatedAt' \
    --tags '0riFc5HTHQIoVsGo,7dwV9DBqFKHQkETJ,yTlUrwDTnoujQD4I' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'EiH9Z5qXn3aoRtlq' \
    --code 'OECohViHA5CzgFSy' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'A3PrIfapq5AAeMe4' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1990-04-11T00:00:00Z' \
    --limit '39' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'gWgU4pCAKxeE70Ca' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "unQNxot371W9G4Av"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'QkqsGnmyo5JJTUVm,b8GEXFTlEMEsFzYq,wgK1Np5nodqpLm7F' \
    --includeOneTimeEvent 'hJBNXzAFdO0Khqf6' \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'kiTdSGv2LFjAKY7C' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1971-12-28T00:00:00Z' \
    --goalCode 'gsWqFWZX7kPBom8F' \
    --limit '6' \
    --offset '66' \
    --tags 'YT7DROCjtuzFMbAG,9YI89hmguB8FOTjM,Lo4b9rIzqYkEpsty' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'VTBcrM8rG0rH0zcs' \
    --index '46' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'K7PpUlcIW32iK7MG' \
    --limit '39' \
    --offset '45' \
    --tags '1ixY5rA1WoVeJIeP,F8ZrQzP4zvtdxdbZ,Upd6FJtHJ1pyVwyK' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'QLY6FEO65Rb3z7CY' \
    --goalProgressionId 'LM8IlsHqffnrfsGl' \
    --limit '11' \
    --offset '85' \
    --sortBy 'updatedAt:asc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["ZgKg4uKxaCgcGLuC", "3brWdTYCfHkIySok", "5DiXZtLW87rGysry"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE