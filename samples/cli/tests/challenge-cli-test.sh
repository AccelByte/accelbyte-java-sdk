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
echo "1..38"

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
    --sortBy 'createdAt' \
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

#- 4 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mf8GZ2WBZqxYG3aR' \
    --limit '63' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetActiveChallenges' test.out

#- 5 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'Au2D6QVKNCWP75TB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetChallenge' test.out

#- 6 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode '0i7pKxR8dl0zRVW4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 62, "assignmentRule": "UNSCHEDULED", "description": "ZG9m0XcgGVbMqSsz", "endAfter": 63, "endDate": "1991-03-08T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "avj7AorKsxwkosAV", "randomizedPerRotation": false, "repeatAfter": 8, "resetConfig": {"resetDate": 35, "resetDay": 4, "resetTime": "Xpc1C8XfwHuKeb9l"}, "rotation": "DAILY", "startDate": "1979-09-25T00:00:00Z", "tags": ["mXhzkzWkFeZSoEAc", "BdW19m4eu6d5tA5j", "UmiTqpyhPFdxLzFQ"]}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateChallenge' test.out

#- 7 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'N05MYzYiKWe5dNRl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteChallenge' test.out

#- 8 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'jv7IPrDQQRgat0Se' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '88' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetGoals' test.out

#- 9 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode '7KYnIuMBvaO35llz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "QRaT5kPxUfofvnnS", "description": "uB0y5WUlrMdI4sNv", "isActive": false, "name": "vR8sKgnuRkgghGoY", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "pD391C2qtPYokahF", "parameterType": "ENTITLEMENT", "statCycleId": "qmLtjQHAf8TgoNm0", "targetValue": 0.8957044270913745}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "s9Q0mPVo3twu0Mes", "parameterType": "USERACCOUNT", "statCycleId": "Cf9x4rt69lna7qxN", "targetValue": 0.07849455742049072}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "HfYakUCTqGkE7wcW", "parameterType": "ACHIEVEMENT", "statCycleId": "aLqYSYWytLPziZMd", "targetValue": 0.14874864147951028}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "cBZufQxGiHPllG4c", "parameterType": "STATISTIC", "statCycleId": "EzfTD1ZBm3MqHcUm", "targetValue": 0.5974234638997404}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "ZbSqb8RwNmn9HrNQ", "parameterType": "STATISTIC_CYCLE", "statCycleId": "2l5BYNtIuS5S5XUd", "targetValue": 0.15841057558012273}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "YzUOcEdscKHPEqgA", "parameterType": "STATISTIC", "statCycleId": "yu7Vk6Jt4Ymos9Jc", "targetValue": 0.05712378745471769}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "s4fYcTVU6RBt0zYo", "parameterType": "USERACCOUNT", "statCycleId": "dAgqxpBFmaLoxozr", "targetValue": 0.941332946488754}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "SyliWMNW5NyLu0M3", "parameterType": "USERACCOUNT", "statCycleId": "jJCSQT279ZZPYGu0", "targetValue": 0.2897257297331216}, {"matcher": "EQUAL", "parameterName": "NmqRBaAkLnvxkT1X", "parameterType": "STATISTIC", "statCycleId": "cmDc3fxU8MyKrQpM", "targetValue": 0.9087512930575277}]}], "rewards": [{"itemId": "hkkK6KKXNB3Gv0Iq", "itemName": "mF51TkhjYnaq6foW", "qty": 0.34727053930874796, "type": "ENTITLEMENT"}, {"itemId": "PUvmEejtGeoyIPa8", "itemName": "ZRrvjj7il35MXbN9", "qty": 0.22921784157443426, "type": "STATISTIC"}, {"itemId": "Lo0LSP0pf4IxjUkl", "itemName": "535X3ateEKDpADz1", "qty": 0.38407044061927276, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1979-05-03T00:00:00Z", "order": 58, "startTime": "1986-07-06T00:00:00Z"}, "tags": ["Qgb3boLQQ1MzH7Qm", "8bwbmXgdAPh1EThG", "96gAFKK2WDgCcxvO"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateGoal' test.out

#- 10 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'NZm3EeERmDnyeFoF' \
    --code '7VSZ6pf3vneSD2Tb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGoal' test.out

#- 11 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode '3g7mSQUhAEtrmjqU' \
    --code '6YE3p4lSck0ZHn5G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "I39YBHqaTHeKtW18", "isActive": false, "name": "YReVHQipcCx9Zw5D", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "GqVvUfHQvsHXNUNe", "parameterType": "ENTITLEMENT", "statCycleId": "BddN8S48l9lyNApf", "targetValue": 0.1864684982252216}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "fZrQvGgbLdLsFzHk", "parameterType": "STATISTIC_CYCLE", "statCycleId": "YDDxHSZjtqXyJ58f", "targetValue": 0.9661143363909342}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "jX9fDmIbeZxzfTcy", "parameterType": "ENTITLEMENT", "statCycleId": "26yUZNmTBcvrbYCw", "targetValue": 0.836738720337986}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "xFHyPLtI8ilbyDPU", "parameterType": "USERACCOUNT", "statCycleId": "GLXpUL4pp2ncYAHd", "targetValue": 0.6409530795111873}, {"matcher": "LESS_THAN", "parameterName": "Iovmv9gsR5cJcHm3", "parameterType": "USERACCOUNT", "statCycleId": "2k6YmJFfRByjlBiu", "targetValue": 0.5125396592251268}, {"matcher": "LESS_THAN", "parameterName": "3FIoVk8T3GpAnkCm", "parameterType": "STATISTIC_CYCLE", "statCycleId": "PxB1UskYs4Yw20DO", "targetValue": 0.2686637172033929}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "SC2DKHRuPMMWH8Yb", "parameterType": "ACHIEVEMENT", "statCycleId": "5UBJCjfcnLRfxeCS", "targetValue": 0.40723269627543657}, {"matcher": "LESS_THAN", "parameterName": "WEi8KlloeH0JT1yd", "parameterType": "STATISTIC", "statCycleId": "T50x9WT0GfH2rtOa", "targetValue": 0.9112399541107568}, {"matcher": "LESS_THAN", "parameterName": "RE2w1yEkLgh3tIYt", "parameterType": "STATISTIC", "statCycleId": "SqYUTLDx9gIiDand", "targetValue": 0.2510974795068833}]}], "rewards": [{"itemId": "GT2t24aOMh5eC3IH", "itemName": "eHSKLCa3xreNDUWe", "qty": 0.12017900780598734, "type": "STATISTIC"}, {"itemId": "40NLRc6m8heKnWhz", "itemName": "fe2NubeoKFeIaFQC", "qty": 0.8112622720868418, "type": "ENTITLEMENT"}, {"itemId": "YYk6QEgJjBbEDoNf", "itemName": "3n0hEoRCAcf80zfF", "qty": 0.39625271392208805, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1977-01-11T00:00:00Z", "order": 72, "startTime": "1996-05-20T00:00:00Z"}, "tags": ["AgIUXiI07A68eaqC", "2J9jyEW6GLbc0NaK", "DUL3sa13lk1dQBHO"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminUpdateGoals' test.out

#- 12 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '86IlBhnetU4RwTqU' \
    --code 'XlTDBzOuYsaZA2yy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGoal' test.out

#- 13 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'd4mbqoOfADMMAXFa' \
    --code 'Y9eKa699bRVhyaKw' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '71' \
    --userId 'rAP2aMlu7WtjCtoY' \
    > test.out 2>&1
eval_tap $? 13 'AdminListSchedulesByGoal' test.out

#- 14 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'etOO847g8OudOfjn' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetPeriods' test.out

#- 15 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'uHZ3c46IjGa23YvY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminRandomizeChallenge' test.out

#- 16 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'mmDg7VYPXIuvUYTZ' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1985-02-06T00:00:00Z' \
    --limit '89' \
    --offset '35' \
    --userId 'ujIUE1Tq5jyAZvkR' \
    > test.out 2>&1
eval_tap $? 16 'AdminListSchedules' test.out

#- 17 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'CMNFIurjh2imdb4r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteTiedChallenge' test.out

#- 18 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'bkXj0ZwsVC0gL97Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1992-10-19T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateTiedChallengeSchedule' test.out

#- 19 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'AdminGetAssignmentPlugin' test.out

#- 20 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "D3oD5fLCr3OOlXVv", "extendType": "CUSTOM", "grpcServerAddress": "ZGF7uYnGzpipNDig"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateAssignmentPlugin' test.out

#- 21 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "NJma1MbqqZtfNWql", "extendType": "APP", "grpcServerAddress": "nmwAft4gqkNNlWkD"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminCreateAssignmentPlugin' test.out

#- 22 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminDeleteAssignmentPlugin' test.out

#- 23 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["9eOziYRFOn0jJLHC", "9LxhvNXTwGBCtohL", "tl9Zuhytm5UDrT6Q"]}' \
    > test.out 2>&1
eval_tap $? 23 'AdminEvaluateProgress' test.out

#- 24 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["XCs5SPBbRPZTF6oQ", "AXVG7tnsZg5QgXjv", "yGJPN4eXbJE5Vs2G"], "userId": "cyomQoIXimBJehyx"}, {"rewardIds": ["lNsjUgxBkF6wFPoJ", "eQediogEhhM2rIiz", "GdKvOPdq5xrgxSmy"], "userId": "1DN9LFkYW5DQyj4b"}, {"rewardIds": ["j5Ro2ogaKt2ujQSa", "3Zdb65UXmy0Zp6iI", "aTIKUkmkk9QM0NBM"], "userId": "A9ORxpzwLR2AK6eX"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminClaimUsersRewards' test.out

#- 25 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'UGPJsw1fiP80G9Pc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lxcft2ulIJzPyrVE' \
    --body '{"goalCode": "iOG4UcqsuGKHhMRW"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUserRewardsByGoalCode' test.out

#- 26 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'LVd3DlhLuIpomM8s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm1MiaI1mX2tJoARt' \
    --dateTime '1972-08-18T00:00:00Z' \
    --goalCode 'bBe7udsMrok0WvGY' \
    --limit '13' \
    --offset '27' \
    --tags 'WjLfFmteue9nzJ6f,H24T805tVg8JqU0j,ZpjvsugAOS7u8RiW' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetUserProgression' test.out

#- 27 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'yerCSa8SRgwsAj1i' \
    --challengeCode 'k1jglaDXTvKCWwNT' \
    --goalProgressionId 'Ahd2wrS0uPdjhdin' \
    --limit '31' \
    --offset '27' \
    --sortBy 'createdAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserRewards' test.out

#- 28 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'g5BLy8wbhMssAHja' \
    --body '{"rewardIDs": ["pIkY9Rf4wP57dBZN", "R88YbCtmKy8M9zVr", "jfGXZnqAQUoY1Gjl"]}' \
    > test.out 2>&1
eval_tap $? 28 'AdminClaimUserRewards' test.out

#- 29 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'IIk0iKoTTS1j02o7' \
    --limit '73' \
    --offset '25' \
    --sortBy 'createdAt:asc' \
    --status 'TIED' \
    --tags 'TXAQN0qdskdQV0Tq,I8EFnmDbxIxi4YKl,ONk2Q5Y4Jvaizwii' \
    > test.out 2>&1
eval_tap $? 29 'GetChallenges' test.out

#- 30 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'latuUjjt9lIMGql5' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '23' \
    --tags 'LcghVHfPEspxwhRO,N0bc1eMbEIjowLqc,3ecjXJbZDKKoxLE1' \
    > test.out 2>&1
eval_tap $? 30 'PublicGetScheduledGoals' test.out

#- 31 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'Y3Dymtj3giPg4x4y' \
    --code 'iPX6ues1Hhhkg1yL' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 31 'PublicListSchedulesByGoal' test.out

#- 32 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'bLFzHEP8cM4NTwr0' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1990-05-28T00:00:00Z' \
    --limit '69' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedules' test.out

#- 33 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'XiR1DJ7HVWqMkNSa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "wQUWDFJvJBWic7Uk"}' \
    > test.out 2>&1
eval_tap $? 33 'PublicClaimUserRewardsByGoalCode' test.out

#- 34 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'EvaluateMyProgress' test.out

#- 35 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'BeIXuqDuAXI66bQ7' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-11-11T00:00:00Z' \
    --goalCode 'w0deoV9Lx5RDA1l2' \
    --limit '4' \
    --offset '22' \
    --tags 'rciYNEzvSZIPkhSg,ORcz5S5BvmgBLxh4,ijFnE3Tam69qSZ7P' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetUserProgression' test.out

#- 36 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'C6f6QkmZXElW9YfR' \
    --index '91' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'Ju3pDMUAeeZ97SBR' \
    --limit '82' \
    --offset '24' \
    --tags 'PYuG6XqP6oo7G73z,dxTgOfnwIdlNa29f,DLh741IslKHzGlLK' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetPastUserProgression' test.out

#- 37 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'WUtDQs61OQAoxyyQ' \
    --goalProgressionId 'pRWCiiPDGQhNPEwi' \
    --limit '72' \
    --offset '64' \
    --sortBy 'updatedAt' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetUserRewards' test.out

#- 38 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["f2XJVrlzqQls1ozh", "LVA3kE8jKvgatOEB", "M70TdlNBJYOmpu1V"]}' \
    > test.out 2>&1
eval_tap $? 38 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE