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
echo "1..21"

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
    --body '{"activeGoalsPerRotation": 95, "assignmentRule": "RANDOMIZED", "code": "9nIW0Oaiw9B0D7eH", "description": "pzSn3ZPUdc0qh4n8", "endDate": "1977-04-27T00:00:00Z", "goalsVisibility": "SHOWALL", "name": "pBJHPtcDs8bBZLCX", "rotation": "NONE", "startDate": "1986-08-10T00:00:00Z"}' \
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
    --body '{"activeGoalsPerRotation": 1, "assignmentRule": "FIXED", "description": "Dpv8N7ZQVqGj6oDL", "endDate": "1975-03-07T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "pUkHODpoMF78NY4Y", "rotation": "MONTHLY", "startDate": "1981-10-02T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'a5tWEIC32ogW7olv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'bTgrhRTcPiSuL0Sl' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '93' \
    --sortBy '6XM4OI18mAQLnzjM' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'f8GZ2WBZqxYG3aRE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "Au2D6QVKNCWP75TB", "description": "0i7pKxR8dl0zRVW4", "isActive": true, "name": "DXn7Z4U68su8Xfql", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "NiTvB6SdAdIhUDrw", "parameterType": "ACHIEVEMENT", "targetValue": 0.3049396338075151}, {"matcher": "LESS_THAN", "parameterName": "5MecdKi5r6QEa1ys", "parameterType": "USERACCOUNT", "targetValue": 0.029377918611924292}, {"matcher": "LESS_THAN", "parameterName": "l3rGN9A3sNm84hdd", "parameterType": "USERACCOUNT", "targetValue": 0.4982117433042538}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "cBdW19m4eu6d5tA5", "parameterType": "ACHIEVEMENT", "targetValue": 0.05851398968985977}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "miTqpyhPFdxLzFQN", "parameterType": "ACHIEVEMENT", "targetValue": 0.9348858033753057}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "R6qVNPRZYdFLIAjG", "parameterType": "USERACCOUNT", "targetValue": 0.6665184093079404}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "DQQRgat0SevkLGMS", "parameterType": "STATISTIC", "targetValue": 0.178873551029475}, {"matcher": "LESS_THAN", "parameterName": "BvaO35llzQRaT5kP", "parameterType": "STATISTIC", "targetValue": 0.9743045922889529}, {"matcher": "EQUAL", "parameterName": "fofvnnSuB0y5WUlr", "parameterType": "USERACCOUNT", "targetValue": 0.5432320240791549}]}], "rewards": [{"itemId": "OPlLlkvR8sKgnuRk", "itemName": "gghGoYupD391C2qt", "qty": 0.6651753762652467, "type": "STATISTIC"}, {"itemId": "okahFjkQsfCaTmt1", "itemName": "d67FXGk2s9Q0mPVo", "qty": 0.8989068361523939, "type": "STATISTIC"}, {"itemId": "3td6TC6I3lMjGSWN", "itemName": "2laRlxfcjHfYakUC", "qty": 0.7389144942567828, "type": "STATISTIC"}], "schedule": {"endTime": "1987-10-06T00:00:00Z", "order": 21, "startTime": "1997-08-31T00:00:00Z"}, "tags": ["69z1UaLqYSYWytLP", "ziZMdjxcBZufQxGi", "HPllG4cYEzfTD1ZB"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'm3MqHcUmLZZbSqb8' \
    --code 'RwNmn9HrNQy4uZAA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'iE0mit9RGCCHYzUO' \
    --code 'cEdscKHPEqgA8yu7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Vk6Jt4Ymos9Jcdos", "isActive": false, "name": "OvBMcaYmvCkGZ5dA", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "qxpBFmaLoxozr6wf", "parameterType": "USERACCOUNT", "targetValue": 0.18274871758398537}, {"matcher": "GREATER_THAN", "parameterName": "X2bOItRMvqtlB2jJ", "parameterType": "STATISTIC", "targetValue": 0.48435798081743175}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "QT279ZZPYGu0rdlg", "parameterType": "ACHIEVEMENT", "targetValue": 0.7036804018622793}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "aAkLnvxkT1X68cmD", "parameterType": "ACHIEVEMENT", "targetValue": 0.9350179873453849}, {"matcher": "EQUAL", "parameterName": "epjChB3V0v52Dlym", "parameterType": "USERACCOUNT", "targetValue": 0.24666892432892407}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "XNB3Gv0IqmF51Tkh", "parameterType": "ACHIEVEMENT", "targetValue": 0.2567886994347076}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "YUDjasWIPUvmEejt", "parameterType": "USERACCOUNT", "targetValue": 0.9414672111380048}, {"matcher": "GREATER_THAN", "parameterName": "oyIPa8ZRrvjj7il3", "parameterType": "ACHIEVEMENT", "targetValue": 0.629013529973899}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "bN9oCMNqq98SjTvh", "parameterType": "ACHIEVEMENT", "targetValue": 0.6405752133277357}]}], "rewards": [{"itemId": "kSQ70D0H6BXksUC9", "itemName": "b6i5lZC9xv32e8c5", "qty": 0.03357191897604872, "type": "STATISTIC"}, {"itemId": "1MzH7Qm8bwbmXgdA", "itemName": "Ph1EThG96gAFKK2W", "qty": 0.47052862510821836, "type": "ENTITLEMENT"}, {"itemId": "TDIHrvqAThuwjRHp", "itemName": "KKTlmVr9XuoJbRFQ", "qty": 0.7244724014473327, "type": "STATISTIC"}], "schedule": {"endTime": "1995-12-02T00:00:00Z", "order": 92, "startTime": "1988-01-11T00:00:00Z"}, "tags": ["bn4Xxtu7LQRENjEE", "ztx1WsYSiZqan0nS", "BJroav91GXlvPG6b"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'FYReVHQipcCx9Zw5' \
    --code 'D2L7vIYhGGSyEW4Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'JJ42d3PBddN8S48l' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'AiYnNjkfZrQvGgbL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["dLsFzHkBMr1yrOMl", "NFSrUEirnjX9fDmI", "beZxzfTcyiuATus9"]}' \
    > test.out 2>&1
eval_tap $? 14 'AdminEvaluateProgress' test.out

#- 15 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'hsfpFDcSDG8aMVGL' \
    --limit '18' \
    --offset '77' \
    --sortBy 'BNrDjqoxcwgGLXpU' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetUserRewards' test.out

#- 16 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '32' \
    --sortBy 'qCt81P1ktfIovmv9' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 16 'GetChallenges' test.out

#- 17 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'rOvDz9KOsb392k6Y' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '65' \
    --tags 'JFfRByjlBiuFM3FI,oVk8T3GpAnkCmBUq,g2SCnqntX9y1aZSW' \
    > test.out 2>&1
eval_tap $? 17 'PublicGetScheduledGoals' test.out

#- 18 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'EvaluateMyProgress' test.out

#- 19 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'MiVi10sG6vxkfUcm' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'qRRbceJ5i0EeDxOg' \
    > test.out 2>&1
eval_tap $? 19 'PublicGetUserProgression' test.out

#- 20 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '8' \
    --sortBy 'nhhqElIaDml48wdN' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserRewards' test.out

#- 21 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["m5T50x9WT0GfH2rt", "Oa4EXsXzOXQAk4mq", "rxzTtuLl4XlbGL8Q"]}' \
    > test.out 2>&1
eval_tap $? 21 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE