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
echo "1..22"

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
    --body '{"activeGoalsPerRotation": 95, "assignmentRule": "RANDOMIZED", "code": "9nIW0Oaiw9B0D7eH", "description": "pzSn3ZPUdc0qh4n8", "endAfter": 26, "endDate": "1978-07-26T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "Z0m8SAMTwE6I56Ia", "rotation": "NONE", "startDate": "1986-08-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateChallenge' test.out

#- 4 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode 'bbgorQeFbQ1g7qbP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetChallenge' test.out

#- 5 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'ngUNB1vRodwpzS6D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 1, "assignmentRule": "FIXED", "description": "Dpv8N7ZQVqGj6oDL", "endAfter": 19, "endDate": "1975-03-16T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "kY1aXlFcDtgOjchI", "rotation": "NONE", "startDate": "1987-12-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 's1cnz1JSDgY1TXp3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode '8zsCTCrbCbPOyNQk' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '82' \
    --sortBy 'M4OI18mAQLnzjMf8' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'GZ2WBZqxYG3aREAu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "2D6QVKNCWP75TB0i", "description": "7pKxR8dl0zRVW4EZ", "isActive": false, "name": "9m0XcgGVbMqSszE8", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "B6SdAdIhUDrwoZ5M", "parameterType": "ACHIEVEMENT", "targetValue": 0.27966377165528733}, {"matcher": "EQUAL", "parameterName": "pc1C8XfwHuKeb9l3", "parameterType": "STATISTIC", "targetValue": 0.9368283340713266}, {"matcher": "GREATER_THAN", "parameterName": "N9A3sNm84hddSpHt", "parameterType": "ACHIEVEMENT", "targetValue": 0.6654241963326721}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "4eu6d5tA5jUmiTqp", "parameterType": "STATISTIC", "targetValue": 0.12252909778352261}, {"matcher": "LESS_THAN", "parameterName": "PFdxLzFQN05MYzYi", "parameterType": "USERACCOUNT", "targetValue": 0.671526989177618}, {"matcher": "EQUAL", "parameterName": "ZYdFLIAjGGJddVCv", "parameterType": "STATISTIC", "targetValue": 0.0049567892477863085}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "0SevkLGMS0lyuI9a", "parameterType": "USERACCOUNT", "targetValue": 0.18045261499548393}, {"matcher": "GREATER_THAN", "parameterName": "u6Vpbsx5w8hqUI06", "parameterType": "USERACCOUNT", "targetValue": 0.2532721485049817}, {"matcher": "LESS_THAN", "parameterName": "XGSLmCVuHOPlLlkv", "parameterType": "USERACCOUNT", "targetValue": 0.0173612533512133}]}], "rewards": [{"itemId": "ntBSxTeIv53HGCil", "itemName": "jvjKoyD6SCwGrncq", "qty": 0.1993808946407839, "type": "STATISTIC"}, {"itemId": "tjQHAf8TgoNm03VL", "itemName": "isV6zwPuo3td6TC6", "qty": 0.5617001388349081, "type": "ENTITLEMENT"}, {"itemId": "lMjGSWN2laRlxfcj", "itemName": "HfYakUCTqGkE7wcW", "qty": 0.08974343541515595, "type": "STATISTIC"}], "schedule": {"endTime": "1990-05-30T00:00:00Z", "order": 34, "startTime": "1976-05-04T00:00:00Z"}, "tags": ["SYWytLPziZMdjxcB", "ZufQxGiHPllG4cYE", "zfTD1ZBm3MqHcUmL"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'ZZbSqb8RwNmn9HrN' \
    --code 'Qy4uZAAiE0mit9RG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'CCHYzUOcEdscKHPE' \
    --code 'qgA8yu7Vk6Jt4Ymo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "s9Jcdos4fYcTVU6R", "isActive": true, "name": "vCkGZ5dAgqxpBFma", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "JMdalwSyliWMNW5N", "parameterType": "STATISTIC", "targetValue": 0.6130980968928829}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "u0M3VHh2EI8JlDbP", "parameterType": "USERACCOUNT", "targetValue": 0.02778086672628388}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "6Q9lNmqRBaAkLnvx", "parameterType": "ACHIEVEMENT", "targetValue": 0.2305211405371812}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "68cmDc3fxU8MyKrQ", "parameterType": "STATISTIC", "targetValue": 0.35077462067860576}, {"matcher": "GREATER_THAN", "parameterName": "Dlym6puQ23xoJ8ae", "parameterType": "STATISTIC", "targetValue": 0.5046353728477166}, {"matcher": "EQUAL", "parameterName": "1TkhjYnaq6foWvXa", "parameterType": "ACHIEVEMENT", "targetValue": 0.34991329621526146}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "EejtGeoyIPa8ZRrv", "parameterType": "ACHIEVEMENT", "targetValue": 0.16441222396944466}, {"matcher": "GREATER_THAN", "parameterName": "7il35MXbN9oCMNqq", "parameterType": "USERACCOUNT", "targetValue": 0.9740335333367675}, {"matcher": "GREATER_THAN", "parameterName": "jTvhZNkSQ70D0H6B", "parameterType": "STATISTIC", "targetValue": 0.1750964491930096}]}], "rewards": [{"itemId": "sUC9b6i5lZC9xv32", "itemName": "e8c5csSovoqsZNBd", "qty": 0.31293168814248296, "type": "ENTITLEMENT"}, {"itemId": "XgdAPh1EThG96gAF", "itemName": "KK2WDgCcxvONZm3E", "qty": 0.07912211386413359, "type": "STATISTIC"}, {"itemId": "jRHpKKTlmVr9XuoJ", "itemName": "bRFQSKVPHbn4Xxtu", "qty": 0.9639977895854788, "type": "STATISTIC"}], "schedule": {"endTime": "1993-09-03T00:00:00Z", "order": 90, "startTime": "1980-09-06T00:00:00Z"}, "tags": ["rmjqU6YE3p4lSck0", "ZHn5GI39YBHqaTHe", "KtW18iGeUlc9d9so"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'gWa24CKNS0GqVvUf' \
    --code 'HQvsHXNUNe4mhgo5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'QB65lSAiYnNjkfZr' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'vGgbLdLsFzHkBMr1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'yrOMlNFSrUEirnjX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["9fDmIbeZxzfTcyiu", "ATus9hsfpFDcSDG8", "aMVGLiBNrDjqoxcw"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGLXpUL4pp2ncYAH' \
    --limit '7' \
    --offset '39' \
    --sortBy 'NzDmeIP6rOvDz9KO' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserRewards' test.out

#- 17 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '91' \
    --sortBy '392k6YmJFfRByjlB' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 17 'GetChallenges' test.out

#- 18 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '9LJE8HoRS1X2PFAA' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '22' \
    --tags 'wzHPxB1UskYs4Yw2,0DOqOBSC2DKHRuPM,MWH8Yb33T5UBJCjf' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetScheduledGoals' test.out

#- 19 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'EvaluateMyProgress' test.out

#- 20 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'cnLRfxeCSz9WEi8K' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'lloeH0JT1yduat2v' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserProgression' test.out

#- 21 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '100' \
    --sortBy 'R3biBfsu4jmsRE2w' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserRewards' test.out

#- 22 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["XQAk4mqrxzTtuLl4", "XlbGL8QOxtjzm8y2", "wNhmwoYZyI4EFZKB"]}' \
    > test.out 2>&1
eval_tap $? 22 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE