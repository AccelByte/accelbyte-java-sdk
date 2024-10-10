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
echo "1..34"

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

#- 4 AdminGetActiveChallenges
./ng net.accelbyte.sdk.cli.Main challenge adminGetActiveChallenges \
    --namespace "$AB_NAMESPACE" \
    --userId 'UNB1vRodwpzS6DaD' \
    --limit '31' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetActiveChallenges' test.out

#- 5 AdminGetChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminGetChallenge \
    --challengeCode '1Jub74CUkNmKJfh5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetChallenge' test.out

#- 6 AdminUpdateChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateChallenge \
    --challengeCode 'pUkHODpoMF78NY4Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"activeGoalsPerRotation": 21, "assignmentRule": "RANDOMIZED", "description": "Hs1cnz1JSDgY1TXp", "endAfter": 3, "endDate": "1994-07-28T00:00:00Z", "goalsVisibility": "PERIODONLY", "name": "sCTCrbCbPOyNQkT7", "randomizedPerRotation": true, "repeatAfter": 50, "resetConfig": {"resetDate": 83, "resetDay": 63, "resetTime": "I18mAQLnzjMf8GZ2"}, "rotation": "DAILY", "startDate": "1984-05-23T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateChallenge' test.out

#- 7 AdminDeleteChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteChallenge \
    --challengeCode 'qxYG3aREAu2D6QVK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteChallenge' test.out

#- 8 AdminGetGoals
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoals \
    --challengeCode 'NCWP75TB0i7pKxR8' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '42' \
    --sortBy 'l0zRVW4EZG9m0Xcg' \
    > test.out 2>&1
eval_tap $? 8 'AdminGetGoals' test.out

#- 9 AdminCreateGoal
./ng net.accelbyte.sdk.cli.Main challenge adminCreateGoal \
    --challengeCode 'GVbMqSszE8GHavj7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "AorKsxwkosAVerXp", "description": "c1C8XfwHuKeb9l3r", "isActive": false, "name": "N9A3sNm84hddSpHt", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "m4eu6d5tA5jUmiTq", "parameterType": "ENTITLEMENT", "statCycleId": "GhDogqrhBRd8lDR6", "targetValue": 0.2614624114028117}, {"matcher": "GREATER_THAN", "parameterName": "NPRZYdFLIAjGGJdd", "parameterType": "STATISTIC_CYCLE", "statCycleId": "Rgat0SevkLGMS0ly", "targetValue": 0.3296200435831247}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "aO35llzQRaT5kPxU", "parameterType": "ACHIEVEMENT", "statCycleId": "qUI06UpOXGSLmCVu", "targetValue": 0.5432320240791549}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "LlkvR8sKgnuRkggh", "parameterType": "USERACCOUNT", "statCycleId": "HGCiljvjKoyD6SCw", "targetValue": 0.5306406618255639}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "hFjkQsfCaTmt1d67", "parameterType": "USERACCOUNT", "statCycleId": "m03VLisV6zwPuo3t", "targetValue": 0.048563985910797025}, {"matcher": "EQUAL", "parameterName": "C6I3lMjGSWN2laRl", "parameterType": "STATISTIC_CYCLE", "statCycleId": "xNeIxPz6MbwL6IY6", "targetValue": 0.9878443729890739}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "1UaLqYSYWytLPziZ", "parameterType": "ENTITLEMENT", "statCycleId": "djxcBZufQxGiHPll", "targetValue": 0.5278113686882158}, {"matcher": "LESS_THAN", "parameterName": "cYEzfTD1ZBm3MqHc", "parameterType": "USERACCOUNT", "statCycleId": "mLZZbSqb8RwNmn9H", "targetValue": 0.2753946887139057}, {"matcher": "GREATER_THAN", "parameterName": "Qy4uZAAiE0mit9RG", "parameterType": "STATISTIC_CYCLE", "statCycleId": "djsoqwGyzzWi9gwQ", "targetValue": 0.820600391189876}]}], "rewards": [{"itemId": "v7t1o7TTr1DmrhZv", "itemName": "15T7quIOvBMcaYmv", "qty": 0.45601475130214997, "type": "ENTITLEMENT"}, {"itemId": "zYoMcHyCUEXlAvxJ", "itemName": "MdalwSyliWMNW5Ny", "qty": 0.606086606845668, "type": "STATISTIC"}, {"itemId": "qtlB2jJCSQT279ZZ", "itemName": "PYGu0rdlgdWyOtXi", "qty": 0.8889729555711825, "type": "ENTITLEMENT"}], "schedule": {"endTime": "1983-02-27T00:00:00Z", "order": 22, "startTime": "1978-12-18T00:00:00Z"}, "tags": ["1X68cmDc3fxU8MyK", "rQpM4hkkK6KKXNB3", "Gv0IqmF51TkhjYna"]}' \
    > test.out 2>&1
eval_tap $? 9 'AdminCreateGoal' test.out

#- 10 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode 'q6foWvXa3bMrXsDr' \
    --code '6kILsSSyDdmykmoP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGoal' test.out

#- 11 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'Ygc2L4jk4Lo0LSP0' \
    --code 'pf4IxjUkl535X3at' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "eEKDpADz1x3poD3Q", "isActive": false, "name": "32e8c5csSovoqsZN", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "dte9NDUPVJf6c2Z0", "parameterType": "STATISTIC_CYCLE", "statCycleId": "ZxfgPubTDIHrvqAT", "targetValue": 0.12821037690176018}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "eERmDnyeFoF7VSZ6", "parameterType": "STATISTIC", "statCycleId": "JbRFQSKVPHbn4Xxt", "targetValue": 0.3298842739394895}, {"matcher": "EQUAL", "parameterName": "LQRENjEEztx1WsYS", "parameterType": "ENTITLEMENT", "statCycleId": "ck0ZHn5GI39YBHqa", "targetValue": 0.734679108802337}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "vPG6bFYReVHQipcC", "parameterType": "STATISTIC_CYCLE", "statCycleId": "gWa24CKNS0GqVvUf", "targetValue": 0.5479072815833855}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "4ZJJ42d3PBddN8S4", "parameterType": "ENTITLEMENT", "statCycleId": "lSAiYnNjkfZrQvGg", "targetValue": 0.027834878675105257}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "03QXcKMDYDDxHSZj", "parameterType": "STATISTIC", "statCycleId": "NFSrUEirnjX9fDmI", "targetValue": 0.02436897729834009}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN", "parameterName": "ZxzfTcyiuATus9hs", "parameterType": "ACHIEVEMENT", "statCycleId": "cvrbYCwZtxFHyPLt", "targetValue": 0.5623322970279718}, {"matcher": "LESS_THAN", "parameterName": "ilbyDPUIj88cekdq", "parameterType": "STATISTIC_CYCLE", "statCycleId": "2ncYAHdNzDmeIP6r", "targetValue": 0.6583342306221371}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "5cJcHm3SZLxoRDFu", "parameterType": "STATISTIC", "statCycleId": "fRByjlBiuFM3FIoV", "targetValue": 0.17737483129716258}]}], "rewards": [{"itemId": "8T3GpAnkCmBUqg2S", "itemName": "CnqntX9y1aZSWMiV", "qty": 0.14303376876802776, "type": "STATISTIC"}, {"itemId": "RuPMMWH8Yb33T5UB", "itemName": "JCjfcnLRfxeCSz9W", "qty": 0.4965524938904313, "type": "ENTITLEMENT"}, {"itemId": "aDml48wdNFLTm5T5", "itemName": "0x9WT0GfH2rtOa4E", "qty": 0.7914921006938705, "type": "STATISTIC"}], "schedule": {"endTime": "1999-07-03T00:00:00Z", "order": 53, "startTime": "1998-11-21T00:00:00Z"}, "tags": ["yEkLgh3tIYt4SqYU", "TLDx9gIiDandpGT2", "t24aOMh5eC3IHeHS"]}' \
    > test.out 2>&1
eval_tap $? 11 'AdminUpdateGoals' test.out

#- 12 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'KLCa3xreNDUWehwH' \
    --code '3q31A806DJgas4b6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGoal' test.out

#- 13 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'z3LNUj7fdgLA84Z8' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPeriods' test.out

#- 14 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'k6QEgJjBbEDoNf3n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminRandomizeChallenge' test.out

#- 15 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode '0hEoRCAcf80zfFya' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminDeleteTiedChallenge' test.out

#- 16 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'bWAgIUXiI07A68ea' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "STOP", "endDate": "1982-08-23T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminUpdateTiedChallengeSchedule' test.out

#- 17 AdminGetAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminGetAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminGetAssignmentPlugin' test.out

#- 18 AdminUpdateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "xcfMy9XzjjI5YbsK", "extendType": "APP", "grpcServerAddress": "DUL3sa13lk1dQBHO"}' \
    > test.out 2>&1
eval_tap $? 18 'AdminUpdateAssignmentPlugin' test.out

#- 19 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "86IlBhnetU4RwTqU", "extendType": "APP", "grpcServerAddress": "geO3FgkXhjDzaQY3"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateAssignmentPlugin' test.out

#- 20 AdminDeleteAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteAssignmentPlugin' test.out

#- 21 AdminEvaluateProgress
./ng net.accelbyte.sdk.cli.Main challenge adminEvaluateProgress \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["snn2ZkP7cFdP43e5", "dC9XIBudfZgrbHDI", "Dm4hMzF4TxodenSr"]}' \
    > test.out 2>&1
eval_tap $? 21 'AdminEvaluateProgress' test.out

#- 22 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["UTvfqU0bfoMm5cTt", "FWbotQyXJRcQWsmq", "PNs92epxk0i8VxsZ"], "userId": "NereSvf9699mCEHT"}, {"rewardIds": ["hUJkETAsSp7gh4Te", "UTkOkAYfJB8AT9t4", "Tv207Y2QD3oD5fLC"], "userId": "r3OOlXVv8ZGF7uYn"}, {"rewardIds": ["GzpipNDigNJma1Mb", "qqZtfNWql4nmwAft", "4gqkNNlWkD9eOziY"], "userId": "RFOn0jJLHC9LxhvN"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminClaimUsersRewards' test.out

#- 23 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'XTwGBCtohLtl9Zuh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ytm5UDrT6QXCs5SP' \
    --body '{"goalCode": "BbRPZTF6oQAXVG7t"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminClaimUserRewardsByGoalCode' test.out

#- 24 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'nsZg5QgXjvyGJPN4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eXbJE5Vs2GcyomQo' \
    --dateTime '1988-08-07T00:00:00Z' \
    --goalCode 'XimBJehyxlNsjUgx' \
    --limit '56' \
    --offset '22' \
    --tags 'P7WnbdSJtjX7ZshZ,yZl5x4bRXBHUTrDz,ZSKscfOcYu3dpCRO' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetUserProgression' test.out

#- 25 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'YqUiGKXVFCmpo6sP' \
    --limit '47' \
    --offset '39' \
    --sortBy 'VOEDSJsEK5QpNhlI' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetUserRewards' test.out

#- 26 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zp6iIaTIKUkmkk9Q' \
    --body '{"rewardIDs": ["M0NBMA9ORxpzwLR2", "AK6eXUGPJsw1fiP8", "0G9Pclxcft2ulIJz"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewards' test.out

#- 27 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '22' \
    --sortBy 'yrVEiOG4UcqsuGKH' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 27 'GetChallenges' test.out

#- 28 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode 'fHK8CCmE2lPnsbD3' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '79' \
    --tags 'GEdlwuUccE536ugB,p3HBvepnDCjgyJlX,e36mgWjLfFmteue9' \
    > test.out 2>&1
eval_tap $? 28 'PublicGetScheduledGoals' test.out

#- 29 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'nzJ6fH24T805tVg8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "JqU0jZpjvsugAOS7"}' \
    > test.out 2>&1
eval_tap $? 29 'PublicClaimUserRewardsByGoalCode' test.out

#- 30 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'EvaluateMyProgress' test.out

#- 31 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'u8RiWyerCSa8SRgw' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1980-01-29T00:00:00Z' \
    --goalCode 'Aj1ik1jglaDXTvKC' \
    --limit '100' \
    --offset '89' \
    --tags 'wNTAhd2wrS0uPdjh,dinpng5BLy8wbhMs,sAHjapIkY9Rf4wP5' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetUserProgression' test.out

#- 32 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode '7dBZNR88YbCtmKy8' \
    --index '79' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'eAczbBdHb2slt71B' \
    --limit '92' \
    --offset '66' \
    --tags 'mZp2JZp50CnPb71O,RYcmQbTU5JX8ccLj,MXJRk0eaKQDOJvrT' \
    > test.out 2>&1
eval_tap $? 32 'PublicGetPastUserProgression' test.out

#- 33 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '10' \
    --sortBy 'YKlONk2Q5Y4Jvaiz' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 33 'PublicGetUserRewards' test.out

#- 34 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["YIWekp18lOC3mNqF", "7Bl0LcghVHfPEspx", "whRON0bc1eMbEIjo"]}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE