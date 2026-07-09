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
echo "1..41"

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

#- 15 AdminMoveGoalToSlot
./ng net.accelbyte.sdk.cli.Main challenge adminMoveGoalToSlot \
    --challengeCode '6sPwVOEDSJsEK5Qp' \
    --code 'NhlI2iS5EpGhhvXY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"slotIndex": 6}' \
    > test.out 2>&1
eval_tap $? 15 'AdminMoveGoalToSlot' test.out

#- 16 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'mkk9QM0NBMA9ORxp' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPeriods' test.out

#- 17 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'wLR2AK6eXUGPJsw1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminRandomizeChallenge' test.out

#- 18 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'fiP80G9Pclxcft2u' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1976-09-02T00:00:00Z' \
    --limit '71' \
    --offset '31' \
    --userId 'JzPyrVEiOG4Ucqsu' \
    > test.out 2>&1
eval_tap $? 18 'AdminListSchedules' test.out

#- 19 AdminGetChallengeSlots
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallengeSlots \
    --challengeCode 'GKHhMRWLVd3DlhLu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminGetChallengeSlots' test.out

#- 20 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'IpomM8sm1MiaI1mX' \
    --namespace "$AB_NAMESPACE" \
    --safeDelete '2tJoARtdbBe7udsM' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTiedChallenge' test.out

#- 21 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'rok0WvGYYnx4V709' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1973-01-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateTiedChallengeSchedule' test.out

#- 22 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetAssignmentPlugin' test.out

#- 23 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "ue9nzJ6fH24T805t", "extendType": "CUSTOM", "grpcServerAddress": "g8JqU0jZpjvsugAO"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminUpdateAssignmentPlugin' test.out

#- 24 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "S7u8RiWyerCSa8SR", "extendType": "APP", "grpcServerAddress": "ZjdrrIxsB0NRsB1f"}' \
    > test.out 2>&1
eval_tap $? 24 'AdminCreateAssignmentPlugin' test.out

#- 25 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteAssignmentPlugin' test.out

#- 26 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'PqqRRulpqpymDkQh,trHWwRVnwVBOqOHi,8pWGd1juYhiqjRJO' \
    --includeOneTimeEvent 'qB5F93zFQbJndUDp' \
    --body '{"userIds": ["dONneAczbBdHb2sl", "t71B1SmZp2JZp50C", "nPb71ORYcmQbTU5J"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminEvaluateProgress' test.out

#- 27 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["X8ccLjMXJRk0eaKQ", "DOJvrTefglSs6g4i", "Y9u02aCNYIWekp18"], "userId": "lOC3mNqF7Bl0Lcgh"}, {"rewardIds": ["VHfPEspxwhRON0bc", "1eMbEIjowLqc3ecj", "XJbZDKKoxLE1Y3Dy"], "userId": "mtj3giPg4x4yiPX6"}, {"rewardIds": ["ues1Hhhkg1yLVbLF", "zHEP8cM4NTwr0KHa", "AsmTej52WKi6tArA"], "userId": "URt9plCSVq8PdH6h"}]' \
    > test.out 2>&1
eval_tap $? 27 'AdminClaimUsersRewards' test.out

#- 28 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'JPUAc0RVwXgAgntL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MCuaXBWQi6BqPg4x' \
    --body '{"goalCode": "r0lCancUZGCHsZYo"}' \
    > test.out 2>&1
eval_tap $? 28 'AdminClaimUserRewardsByGoalCode' test.out

#- 29 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'LfR1KtOv7Zy0b65u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vuKNuy0ytZQ7M6Nz' \
    --dateTime '1983-12-11T00:00:00Z' \
    --goalCode 'adnSKOLFKx1dX4Lu' \
    --limit '100' \
    --offset '91' \
    --tags 'Ju3pDMUAeeZ97SBR,OPYuG6XqP6oo7G73,zdxTgOfnwIdlNa29' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetUserProgression' test.out

#- 30 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'fDLh741IslKHzGlL' \
    --challengeCode 'KWUtDQs61OQAoxyy' \
    --goalProgressionId 'QpRWCiiPDGQhNPEw' \
    --limit '16' \
    --offset '40' \
    --sortBy 'updatedAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetUserRewards' test.out

#- 31 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'EJ7tnkY6Mca5afj1' \
    --body '{"rewardIDs": ["2K2IzrBvvWm4udE0", "OXudXgNne8kJATwl", "c6esUp6Sw1I98jeZ"]}' \
    > test.out 2>&1
eval_tap $? 31 'AdminClaimUserRewards' test.out

#- 32 PublicGetChallenges
./ng net.accelbyte.sdk.cli.Main challenge publicGetChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'Q7hfxnhLd3Knakno' \
    --limit '9' \
    --offset '12' \
    --sortBy 'code:asc' \
    --status 'INIT' \
    --tags '9DHhLOqQGhCUr6iT,rjyEgarAdNJOIG36,I6tRbRcrEveMdAdi' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetChallenges' test.out

#- 33 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'PKDUVSC00PYeDcag' \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '18' \
    --sortBy 'updatedAt:asc' \
    --tags 'nxnFIna3yddcbsPh,eTH26IUJNvYuGRUv,pZaHCuESOiIZsMfB' \
    > test.out 2>&1
eval_tap $? 33 'PublicGetScheduledGoals' test.out

#- 34 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode '4ZH3mtgWgU4pCAKx' \
    --code 'eE70CaunQNxot371' \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 34 'PublicListSchedulesByGoal' test.out

#- 35 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode '9G4AvQkqsGnmyo5J' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1989-12-06T00:00:00Z' \
    --limit '95' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 35 'PublicListSchedules' test.out

#- 36 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'Vmb8GEXFTlEMEsFz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "YqwgK1Np5nodqpLm"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicClaimUserRewardsByGoalCode' test.out

#- 37 PublicEvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge publicEvaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    --challengeCode '7FhJBNXzAFdO0Khq,f6kiTdSGv2LFjAKY,7CbgsWqFWZX7kPBo' \
    --includeOneTimeEvent 'm8F9GLLTG8phc3n4' \
    > test.out 2>&1
eval_tap $? 37 'PublicEvaluateMyProgress' test.out

#- 38 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'iLoIllKlpO2pqiXJ' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1987-11-26T00:00:00Z' \
    --goalCode '3WGRaoQomSJC4Ddr' \
    --limit '75' \
    --offset '37' \
    --tags 'F7SUQPLG59e0k5Zt,X6wK7PpUlcIW32iK,7MGt1ixY5rA1WoVe' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserProgression' test.out

#- 39 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'JIePF8ZrQzP4zvtd' \
    --index '48' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'MiHKxbWCYzo8yO2K' \
    --limit '93' \
    --offset '46' \
    --tags 'K9tmmOnYnOpas6gh,P1y4Zi7s7QBlk44Z,44B1GZgKg4uKxaCg' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetPastUserProgression' test.out

#- 40 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'cGLuC3brWdTYCfHk' \
    --goalProgressionId 'IySok5DiXZtLW87r' \
    --limit '67' \
    --offset '36' \
    --sortBy 'updatedAt' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetUserRewards' test.out

#- 41 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["flIOd6X3viLvtEk4", "mTIpUA9gxo8SV38n", "EhoXmM2W7l6jHMA2"]}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE