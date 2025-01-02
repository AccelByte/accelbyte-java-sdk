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
    --limit '62' \
    --offset '39' \
    --sortBy 'updatedAt' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'AdminGetChallenges' test.out

#- 3 AdminCreateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminCreateChallenge \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 48, "assignmentRule": "CUSTOM", "code": "CA9kPI6LZrkq6Dc0", "description": "9nIW0Oaiw9B0D7eH", "endAfter": 32, "endDate": "1992-07-21T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "h5JAav5kRa62WopB", "randomizedPerRotation": false, "repeatAfter": 68, "resetConfig": {"resetDate": 85, "resetDay": 91, "resetTime": "tcDs8bBZLCXLx8bb"}, "rotation": "DAILY", "startDate": "1983-04-28T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'aNoMR6hkspInrAip' \
    --limit '56' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetActiveChallenges' test.out

#- 5 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '1vRodwpzS6DaDpv8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetChallenge' test.out

#- 6 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'N7ZQVqGj6oDLjWjk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 21, "assignmentRule": "CUSTOM", "description": "ODpoMF78NY4YkHs1", "endAfter": 4, "endDate": "1996-04-15T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "z1JSDgY1TXp38zsC", "randomizedPerRotation": true, "repeatAfter": 93, "resetConfig": {"resetDate": 36, "resetDay": 5, "resetTime": "bCbPOyNQkT7NvyE3"}, "rotation": "DAILY", "startDate": "1982-04-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateChallenge' test.out

#- 7 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'yALczNIicXm7agSr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteChallenge' test.out

#- 8 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'jJW2OQNOs1PXhT5F' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '58' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetGoals' test.out

#- 9 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'WP75TB0i7pKxR8dl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "0zRVW4EZG9m0XcgG", "description": "VbMqSszE8GHavj7A", "isActive": false, "name": "dIhUDrwoZ5MecdKi", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "8XfwHuKeb9l3rGN9", "parameterType": "STATISTIC_CYCLE", "statCycleId": "zkzWkFeZSoEAcBdW", "targetValue": 0.860671666465661}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "m4eu6d5tA5jUmiTq", "parameterType": "ENTITLEMENT", "statCycleId": "GhDogqrhBRd8lDR6", "targetValue": 0.2614624114028117}, {"matcher": "GREATER_THAN", "parameterName": "NPRZYdFLIAjGGJdd", "parameterType": "STATISTIC_CYCLE", "statCycleId": "Rgat0SevkLGMS0ly", "targetValue": 0.3296200435831247}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "35llzQRaT5kPxUfo", "parameterType": "ACHIEVEMENT", "statCycleId": "I06UpOXGSLmCVuHO", "targetValue": 0.6751155250161673}, {"matcher": "GREATER_THAN", "parameterName": "sNveabntBSxTeIv5", "parameterType": "USERACCOUNT", "statCycleId": "HGCiljvjKoyD6SCw", "targetValue": 0.5306406618255639}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "hFjkQsfCaTmt1d67", "parameterType": "USERACCOUNT", "statCycleId": "m03VLisV6zwPuo3t", "targetValue": 0.048563985910797025}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "sTCf9x4rt69lna7q", "parameterType": "STATISTIC_CYCLE", "statCycleId": "fcjHfYakUCTqGkE7", "targetValue": 0.3601780713574987}, {"matcher": "EQUAL", "parameterName": "1UaLqYSYWytLPziZ", "parameterType": "ENTITLEMENT", "statCycleId": "djxcBZufQxGiHPll", "targetValue": 0.5278113686882158}, {"matcher": "LESS_THAN", "parameterName": "cYEzfTD1ZBm3MqHc", "parameterType": "USERACCOUNT", "statCycleId": "mLZZbSqb8RwNmn9H", "targetValue": 0.2753946887139057}]}], "rewards": [{"itemId": "NQy4uZAAiE0mit9R", "itemName": "GCCHYzUOcEdscKHP", "qty": 0.49006656321603914, "type": "STATISTIC"}, {"itemId": "Yv7t1o7TTr1DmrhZ", "itemName": "v15T7quIOvBMcaYm", "qty": 0.34796128652696123, "type": "STATISTIC"}, {"itemId": "0zYoMcHyCUEXlAvx", "itemName": "JMdalwSyliWMNW5N", "qty": 0.39532719264252547, "type": "STATISTIC"}], "schedule": {"endTime": "1981-05-13T00:00:00Z", "order": 39, "startTime": "1990-03-30T00:00:00Z"}, "tags": ["3VHh2EI8JlDbPWbQ", "6Q9lNmqRBaAkLnvx", "kT1X68cmDc3fxU8M"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateGoal' test.out

#- 10 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'yKrQpM4hkkK6KKXN' \
    --code 'B3Gv0IqmF51TkhjY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGoal' test.out

#- 11 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'naq6foWvXa3bMrXs' \
    --code 'Dr6kILsSSyDdmykm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "oPYgc2L4jk4Lo0LS", "isActive": false, "name": "jTvhZNkSQ70D0H6B", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "KDpADz1x3poD3Qgb", "parameterType": "ACHIEVEMENT", "statCycleId": "boLQQ1MzH7Qm8bwb", "targetValue": 0.2016886105533926}, {"matcher": "EQUAL", "parameterName": "NDUPVJf6c2Z0QZxf", "parameterType": "ACHIEVEMENT", "statCycleId": "2WDgCcxvONZm3EeE", "targetValue": 0.7034650646372707}, {"matcher": "GREATER_THAN", "parameterName": "HpKKTlmVr9XuoJbR", "parameterType": "USERACCOUNT", "statCycleId": "neSD2Tb3g7mSQUhA", "targetValue": 0.4888548233080222}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "rmjqU6YE3p4lSck0", "parameterType": "ENTITLEMENT", "statCycleId": "Hn5GI39YBHqaTHeK", "targetValue": 0.319706332135565}, {"matcher": "EQUAL", "parameterName": "8iGeUlc9d9sogWa2", "parameterType": "STATISTIC_CYCLE", "statCycleId": "CKNS0GqVvUfHQvsH", "targetValue": 0.8001837550145668}, {"matcher": "EQUAL", "parameterName": "e4mhgo5QB65lSAiY", "parameterType": "ENTITLEMENT", "statCycleId": "pflxqMrj3oZk03QX", "targetValue": 0.04202393743639443}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "BMr1yrOMlNFSrUEi", "parameterType": "STATISTIC", "statCycleId": "7Gc26SaiGVkydwYW", "targetValue": 0.6781827463746384}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "iuATus9hsfpFDcSD", "parameterType": "USERACCOUNT", "statCycleId": "ZtxFHyPLtI8ilbyD", "targetValue": 0.6690689501743559}, {"matcher": "EQUAL", "parameterName": "Ij88cekdqCt81P1k", "parameterType": "STATISTIC", "statCycleId": "NzDmeIP6rOvDz9KO", "targetValue": 0.2932471699956113}]}], "rewards": [{"itemId": "b392k6YmJFfRByjl", "itemName": "BiuFM3FIoVk8T3Gp", "qty": 0.4217931063859738, "type": "ENTITLEMENT"}, {"itemId": "MwzHPxB1UskYs4Yw", "itemName": "20DOqOBSC2DKHRuP", "qty": 0.6179973809569348, "type": "ENTITLEMENT"}, {"itemId": "WH8Yb33T5UBJCjfc", "itemName": "nLRfxeCSz9WEi8Kl", "qty": 0.18304598265913485, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1973-07-09T00:00:00Z", "order": 68, "startTime": "1972-11-22T00:00:00Z"}, "tags": ["JT1yduat2vQR3biB", "fsu4jmsRE2w1yEkL", "gh3tIYt4SqYUTLDx"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminUpdateGoals' test.out

#- 12 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode '9gIiDandpGT2t24a' \
    --code 'OMh5eC3IHeHSKLCa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGoal' test.out

#- 13 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode '3xreNDUWehwH3q31' \
    --code 'A806DJgas4b6z3LN' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '9' \
    --userId 'j7fdgLA84Z8YYk6Q' \
    > test.out 2>&1
eval_tap $? 13 'AdminListSchedulesByGoal' test.out

#- 14 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'EgJjBbEDoNf3n0hE' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 14 'AdminGetPeriods' test.out

#- 15 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'RCAcf80zfFyabWAg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminRandomizeChallenge' test.out

#- 16 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode 'IUXiI07A68eaqC2J' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1990-03-12T00:00:00Z' \
    --limit '51' \
    --offset '51' \
    --userId '9XzjjI5YbsKoADkz' \
    > test.out 2>&1
eval_tap $? 16 'AdminListSchedules' test.out

#- 17 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'JEN2VHzih3bit0VW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteTiedChallenge' test.out

#- 18 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'n3CO39PXDNxtXgeO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1987-11-26T00:00:00Z"}' \
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
    --body '{"appName": "gkXhjDzaQY3snn2Z", "extendType": "APP", "grpcServerAddress": "fADMMAXFaY9eKa69"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminUpdateAssignmentPlugin' test.out

#- 21 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "9bRVhyaKwwrAP2aM", "extendType": "APP", "grpcServerAddress": "F4TxodenSrUTvfqU"}' \
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
    --body '{"userIds": ["0bfoMm5cTtFWbotQ", "yXJRcQWsmqPNs92e", "pxk0i8VxsZNereSv"]}' \
    > test.out 2>&1
eval_tap $? 23 'AdminEvaluateProgress' test.out

#- 24 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["f9699mCEHThUJkET", "AsSp7gh4TeUTkOkA", "YfJB8AT9t4Tv207Y"], "userId": "2QD3oD5fLCr3OOlX"}, {"rewardIds": ["Vv8ZGF7uYnGzpipN", "DigNJma1MbqqZtfN", "Wql4nmwAft4gqkNN"], "userId": "lWkD9eOziYRFOn0j"}, {"rewardIds": ["JLHC9LxhvNXTwGBC", "tohLtl9Zuhytm5UD", "rT6QXCs5SPBbRPZT"], "userId": "F6oQAXVG7tnsZg5Q"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminClaimUsersRewards' test.out

#- 25 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'gXjvyGJPN4eXbJE5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vs2GcyomQoIXimBJ' \
    --body '{"goalCode": "ehyxlNsjUgxBkF6w"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUserRewardsByGoalCode' test.out

#- 26 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'FPoJeQediogEhhM2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rIizGdKvOPdq5xrg' \
    --dateTime '1983-01-18T00:00:00Z' \
    --goalCode 'Smy1DN9LFkYW5DQy' \
    --limit '19' \
    --offset '75' \
    --tags '4bj5Ro2ogaKt2ujQ,Sa3Zdb65UXmy0Zp6,iIaTIKUkmkk9QM0N' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetUserProgression' test.out

#- 27 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'BMA9ORxpzwLR2AK6' \
    --challengeCode 'eXUGPJsw1fiP80G9' \
    --goalProgressionId 'Pclxcft2ulIJzPyr' \
    --limit '99' \
    --offset '60' \
    --sortBy 'updatedAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserRewards' test.out

#- 28 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'uNFviMarv8mnfHK8' \
    --body '{"rewardIDs": ["CCmE2lPnsbD3SGEd", "lwuUccE536ugBp3H", "BvepnDCjgyJlXe36"]}' \
    > test.out 2>&1
eval_tap $? 28 'AdminClaimUserRewards' test.out

#- 29 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '13' \
    --sortBy 'createdAt:asc' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 29 'GetChallenges' test.out

#- 30 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'jLfFmteue9nzJ6fH' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '93' \
    --tags 'mOR2nvYI9TVqJdvz,cWbfUpaXp5JMl5LL,4bTxBmZjdrrIxsB0' \
    > test.out 2>&1
eval_tap $? 30 'PublicGetScheduledGoals' test.out

#- 31 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'NRsB1fPqqRRulpqp' \
    --code 'ymDkQhtrHWwRVnwV' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 31 'PublicListSchedulesByGoal' test.out

#- 32 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'OqOHi8pWGd1juYhi' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1979-03-21T00:00:00Z' \
    --limit '88' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedules' test.out

#- 33 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'JOqB5F93zFQbJndU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "DpdONneAczbBdHb2"}' \
    > test.out 2>&1
eval_tap $? 33 'PublicClaimUserRewardsByGoalCode' test.out

#- 34 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'EvaluateMyProgress' test.out

#- 35 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'slt71B1SmZp2JZp5' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-04-23T00:00:00Z' \
    --goalCode 'CnPb71ORYcmQbTU5' \
    --limit '73' \
    --offset '34' \
    --tags '8ccLjMXJRk0eaKQD,OJvrTefglSs6g4iY,9u02aCNYIWekp18l' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetUserProgression' test.out

#- 36 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'OC3mNqF7Bl0LcghV' \
    --index '68' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'IlGcHB3CfR3ncDlw' \
    --limit '17' \
    --offset '80' \
    --tags '3v3MFFJ1KesKoELC,pobBEG8X645xpdXp,ai0rYaT5hOPjaf3H' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetPastUserProgression' test.out

#- 37 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode '0tYighU0VUfcYHJb' \
    --goalProgressionId 'BfAKSiPW3VgsZXiR' \
    --limit '93' \
    --offset '59' \
    --sortBy 'createdAt' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetUserRewards' test.out

#- 38 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["7HVWqMkNSawQUWDF", "JvJBWic7UkBeIXuq", "DuAXI66bQ71w0deo"]}' \
    > test.out 2>&1
eval_tap $? 38 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE