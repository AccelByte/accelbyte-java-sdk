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
    --body '{"activeGoalsPerRotation": 95, "assignmentRule": "RANDOMIZED", "code": "9nIW0Oaiw9B0D7eH", "description": "pzSn3ZPUdc0qh4n8", "endAfter": 26, "endDate": "1978-07-26T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "Z0m8SAMTwE6I56Ia", "repeatAfter": 89, "rotation": "NONE", "startDate": "1986-08-10T00:00:00Z"}' \
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
    --body '{"activeGoalsPerRotation": 1, "assignmentRule": "FIXED", "description": "Dpv8N7ZQVqGj6oDL", "endAfter": 19, "endDate": "1975-03-16T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "kY1aXlFcDtgOjchI", "repeatAfter": 42, "rotation": "DAILY", "startDate": "1980-06-11T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateChallenge' test.out

#- 6 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'cnz1JSDgY1TXp38z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminDeleteChallenge' test.out

#- 7 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'sCTCrbCbPOyNQkT7' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '80' \
    --sortBy 'vyE3cwyALczNIicX' \
    > test.out 2>&1
eval_tap $? 7 'AdminGetGoals' test.out

#- 8 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'm7agSrjJW2OQNOs1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "PXhT5FvdiRilZ7oF", "description": "gx4c8OumKtPDKJDX", "isActive": false, "name": "9m0XcgGVbMqSszE8", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "B6SdAdIhUDrwoZ5M", "parameterType": "ACHIEVEMENT", "statCycleId": "rXpc1C8XfwHuKeb9", "targetValue": 0.18532990893992962}, {"matcher": "EQUAL", "parameterName": "rGN9A3sNm84hddSp", "parameterType": "ACHIEVEMENT", "statCycleId": "t0P7MIIR7CkyF6C7", "targetValue": 0.05851398968985977}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "miTqpyhPFdxLzFQN", "parameterType": "STATISTIC", "statCycleId": "5MYzYiKWe5dNRljv", "targetValue": 0.9552728348709659}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "DQQRgat0SevkLGMS", "parameterType": "STATISTIC_CYCLE", "statCycleId": "lyuI9a2I9u6Vpbsx", "targetValue": 0.9216002871488022}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "xUfofvnnSuB0y5WU", "parameterType": "STATISTIC", "statCycleId": "VuHOPlLlkvR8sKgn", "targetValue": 0.32483365190921987}, {"matcher": "EQUAL", "parameterName": "kgghGoYupD391C2q", "parameterType": "STATISTIC_CYCLE", "statCycleId": "6SCwGrncqmLtjQHA", "targetValue": 0.08835878454411339}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "67FXGk2s9Q0mPVo3", "parameterType": "STATISTIC_CYCLE", "statCycleId": "3td6TC6I3lMjGSWN", "targetValue": 0.872326435040707}, {"matcher": "GREATER_THAN", "parameterName": "na7qxNeIxPz6MbwL", "parameterType": "STATISTIC", "statCycleId": "Y69z1UaLqYSYWytL", "targetValue": 0.671011810680385}, {"matcher": "LESS_THAN", "parameterName": "0yYoNRKd3IL5TAQ6", "parameterType": "STATISTIC", "statCycleId": "PllG4cYEzfTD1ZBm", "targetValue": 0.8955390162339444}]}], "rewards": [{"itemId": "MqHcUmLZZbSqb8Rw", "itemName": "Nmn9HrNQy4uZAAiE", "qty": 0.8522037441678852, "type": "ENTITLEMENT"}, {"itemId": "S5S5XUdjsoqwGyzz", "itemName": "Wi9gwQYv7t1o7TTr", "qty": 0.8700319476932833, "type": "STATISTIC"}, {"itemId": "4Ymos9Jcdos4fYcT", "itemName": "VU6RBt0zYoMcHyCU", "qty": 0.49213754711268565, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1977-08-08T00:00:00Z", "order": 1, "startTime": "1982-11-04T00:00:00Z"}, "tags": ["xJMdalwSyliWMNW5", "NyLu0M3VHh2EI8Jl", "DbPWbQ6Q9lNmqRBa"]}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateGoal' test.out

#- 9 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'AkLnvxkT1X68cmDc' \
    --code '3fxU8MyKrQpM4hkk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetGoal' test.out

#- 10 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'K6KKXNB3Gv0IqmF5' \
    --code '1TkhjYnaq6foWvXa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "3bMrXsDr6kILsSSy", "isActive": true, "name": "Rrvjj7il35MXbN9o", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "MNqq98SjTvhZNkSQ", "parameterType": "USERACCOUNT", "statCycleId": "X3ateEKDpADz1x3p", "targetValue": 0.24100830001534967}, {"matcher": "LESS_THAN", "parameterName": "9xv32e8c5csSovoq", "parameterType": "STATISTIC_CYCLE", "statCycleId": "m8bwbmXgdAPh1ETh", "targetValue": 0.5286924755635234}, {"matcher": "EQUAL", "parameterName": "QZxfgPubTDIHrvqA", "parameterType": "STATISTIC", "statCycleId": "EeERmDnyeFoF7VSZ", "targetValue": 0.9402783158146515}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "f3vneSD2Tb3g7mSQ", "parameterType": "ACHIEVEMENT", "statCycleId": "LQRENjEEztx1WsYS", "targetValue": 0.13302522177831455}, {"matcher": "GREATER_THAN", "parameterName": "qan0nSBJroav91GX", "parameterType": "STATISTIC", "statCycleId": "eKtW18iGeUlc9d9s", "targetValue": 0.23761844917164}, {"matcher": "EQUAL", "parameterName": "9Zw5D2L7vIYhGGSy", "parameterType": "USERACCOUNT", "statCycleId": "QvsHXNUNe4mhgo5Q", "targetValue": 0.4507852562022244}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "9lyNApflxqMrj3oZ", "parameterType": "STATISTIC", "statCycleId": "LdLsFzHkBMr1yrOM", "targetValue": 0.18663883442719165}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "FSrUEirnjX9fDmIb", "parameterType": "ACHIEVEMENT", "statCycleId": "kydwYWQG26yUZNmT", "targetValue": 0.45140416990647114}, {"matcher": "EQUAL", "parameterName": "pFDcSDG8aMVGLiBN", "parameterType": "STATISTIC_CYCLE", "statCycleId": "8ilbyDPUIj88cekd", "targetValue": 0.272837186189996}]}], "rewards": [{"itemId": "Ct81P1ktfIovmv9g", "itemName": "sR5cJcHm3SZLxoRD", "qty": 0.5132029993783356, "type": "STATISTIC"}, {"itemId": "FfRByjlBiuFM3FIo", "itemName": "Vk8T3GpAnkCmBUqg", "qty": 0.8832726534631615, "type": "STATISTIC"}, {"itemId": "CnqntX9y1aZSWMiV", "itemName": "i10sG6vxkfUcmqRR", "qty": 0.03130710811997095, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1995-02-06T00:00:00Z", "order": 56, "startTime": "1989-10-18T00:00:00Z"}, "tags": ["5i0EeDxOgBnhhqEl", "IaDml48wdNFLTm5T", "50x9WT0GfH2rtOa4"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateGoals' test.out

#- 11 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'EXsXzOXQAk4mqrxz' \
    --code 'TtuLl4XlbGL8QOxt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminDeleteGoal' test.out

#- 12 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'jzm8y2wNhmwoYZyI' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPeriods' test.out

#- 13 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'HeHSKLCa3xreNDUW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminRandomizeChallenge' test.out

#- 14 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'ehwH3q31A806DJga' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteTiedChallenge' test.out

#- 15 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["s4b6z3LNUj7fdgLA", "84Z8YYk6QEgJjBbE", "DoNf3n0hEoRCAcf8"]}' \
    > test.out 2>&1
eval_tap $? 15 'AdminEvaluateProgress' test.out

#- 16 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '0zfFyabWAgIUXiI0' \
    --limit '34' \
    --offset '54' \
    --sortBy 'xM3gpwxcfMy9Xzjj' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUserRewards' test.out

#- 17 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '3' \
    --sortBy 'NaKDUL3sa13lk1dQ' \
    --status 'RETIRED' \
    > test.out 2>&1
eval_tap $? 17 'GetChallenges' test.out

#- 18 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '3bit0VWn3CO39PXD' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '34' \
    --tags 'xtXgeO3FgkXhjDza,QY3snn2ZkP7cFdP4,3e5dC9XIBudfZgrb' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetScheduledGoals' test.out

#- 19 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'EvaluateMyProgress' test.out

#- 20 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'HDIDm4hMzF4Txode' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'nSrUTvfqU0bfoMm5' \
    --limit '5' \
    --offset '20' \
    --tags 'TtFWbotQyXJRcQWs,mqPNs92epxk0i8Vx,sZNereSvf9699mCE' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserProgression' test.out

#- 21 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '94' \
    --sortBy 'vkRCMNFIurjh2imd' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 21 'PublicGetUserRewards' test.out

#- 22 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["UTkOkAYfJB8AT9t4", "Tv207Y2QD3oD5fLC", "r3OOlXVv8ZGF7uYn"]}' \
    > test.out 2>&1
eval_tap $? 22 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE