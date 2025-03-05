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
    --body '{"code": "jkQsfCaTmt1d67FX", "description": "Gk2s9Q0mPVo3twu0", "isActive": false, "name": "C6I3lMjGSWN2laRl", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "LESS_THAN", "parameterName": "fcjHfYakUCTqGkE7", "parameterType": "STATISTIC", "statCycleId": "z1UaLqYSYWytLPzi", "targetValue": 0.8285352350205489}, {"matcher": "GREATER_THAN", "parameterName": "djxcBZufQxGiHPll", "parameterType": "USERACCOUNT", "statCycleId": "SC2uE4o5Vwdo3feP", "targetValue": 0.2653606611144602}, {"matcher": "LESS_THAN_EQUAL", "parameterName": "UmLZZbSqb8RwNmn9", "parameterType": "USERACCOUNT", "statCycleId": "VAla2l5BYNtIuS5S", "targetValue": 0.9290225484196863}]}, {"operator": "AND", "predicates": [{"matcher": "EQUAL", "parameterName": "CHYzUOcEdscKHPEq", "parameterType": "ACHIEVEMENT", "statCycleId": "v7t1o7TTr1DmrhZv", "targetValue": 0.8666935904241546}, {"matcher": "EQUAL", "parameterName": "T7quIOvBMcaYmvCk", "parameterType": "USERACCOUNT", "statCycleId": "YoMcHyCUEXlAvxJM", "targetValue": 0.05782474141294325}, {"matcher": "EQUAL", "parameterName": "r6wfNPX2bOItRMvq", "parameterType": "STATISTIC", "statCycleId": "M3VHh2EI8JlDbPWb", "targetValue": 0.6790052095186395}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "lNmqRBaAkLnvxkT1", "parameterType": "ENTITLEMENT", "statCycleId": "68cmDc3fxU8MyKrQ", "targetValue": 0.2569142829684512}, {"matcher": "GREATER_THAN", "parameterName": "Dlym6puQ23xoJ8ae", "parameterType": "STATISTIC_CYCLE", "statCycleId": "F51TkhjYnaq6foWv", "targetValue": 0.7992755215754995}, {"matcher": "EQUAL", "parameterName": "PUvmEejtGeoyIPa8", "parameterType": "STATISTIC_CYCLE", "statCycleId": "Rrvjj7il35MXbN9o", "targetValue": 0.46200246811805545}]}], "rewards": [{"itemId": "MNqq98SjTvhZNkSQ", "itemName": "70D0H6BXksUC9b6i", "qty": 0.9318777091080298, "type": "ENTITLEMENT"}, {"itemId": "poD3Qgb3boLQQ1Mz", "itemName": "H7Qm8bwbmXgdAPh1", "qty": 0.49572597508359506, "type": "ENTITLEMENT"}, {"itemId": "c2Z0QZxfgPubTDIH", "itemName": "rvqAThuwjRHpKKTl", "qty": 0.20242472374082454, "type": "STATISTIC"}], "schedule": {"endTime": "1995-12-25T00:00:00Z", "order": 42, "startTime": "1978-05-08T00:00:00Z"}, "tags": ["JbRFQSKVPHbn4Xxt", "u7LQRENjEEztx1Ws", "YSiZqan0nSBJroav"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminCreateGoal' test.out

#- 11 AdminGetGoal
./ng net.accelbyte.sdk.cli.Main challenge adminGetGoal \
    --challengeCode '91GXlvPG6bFYReVH' \
    --code 'QipcCx9Zw5D2L7vI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGoal' test.out

#- 12 AdminUpdateGoals
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateGoals \
    --challengeCode 'YhGGSyEW4ZJJ42d3' \
    --code 'PBddN8S48l9lyNAp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "flxqMrj3oZk03QXc", "isActive": false, "name": "DYDDxHSZjtqXyJ58", "requirementGroups": [{"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "7Gc26SaiGVkydwYW", "parameterType": "STATISTIC_CYCLE", "statCycleId": "G26yUZNmTBcvrbYC", "targetValue": 0.36316707375806334}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "aMVGLiBNrDjqoxcw", "parameterType": "ACHIEVEMENT", "statCycleId": "Ij88cekdqCt81P1k", "targetValue": 0.3108052510094127}, {"matcher": "EQUAL", "parameterName": "zDmeIP6rOvDz9KOs", "parameterType": "ACHIEVEMENT", "statCycleId": "SZLxoRDFuuuySj29", "targetValue": 0.012506165576670725}]}, {"operator": "AND", "predicates": [{"matcher": "LESS_THAN_EQUAL", "parameterName": "FM3FIoVk8T3GpAnk", "parameterType": "STATISTIC_CYCLE", "statCycleId": "zHPxB1UskYs4Yw20", "targetValue": 0.47249145815444704}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "SWMiVi10sG6vxkfU", "parameterType": "ACHIEVEMENT", "statCycleId": "Yb33T5UBJCjfcnLR", "targetValue": 0.09078987770354718}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "BnhhqElIaDml48wd", "parameterType": "USERACCOUNT", "statCycleId": "FLTm5T50x9WT0GfH", "targetValue": 0.882232772568948}]}, {"operator": "AND", "predicates": [{"matcher": "GREATER_THAN_EQUAL", "parameterName": "tOa4EXsXzOXQAk4m", "parameterType": "STATISTIC", "statCycleId": "tIYt4SqYUTLDx9gI", "targetValue": 0.1355067540620255}, {"matcher": "LESS_THAN", "parameterName": "xtjzm8y2wNhmwoYZ", "parameterType": "STATISTIC_CYCLE", "statCycleId": "C3IHeHSKLCa3xreN", "targetValue": 0.48366378663675036}, {"matcher": "GREATER_THAN_EQUAL", "parameterName": "WehwH3q31A806DJg", "parameterType": "ACHIEVEMENT", "statCycleId": "Whzfe2NubeoKFeIa", "targetValue": 0.5002628637817491}]}], "rewards": [{"itemId": "QCYoDPICpnduEEQl", "itemName": "ULdJz4mnRBkMNxvv", "qty": 0.5918130905396677, "type": "ENTITLEMENT"}, {"itemId": "fFyabWAgIUXiI07A", "itemName": "68eaqC2J9jyEW6GL", "qty": 0.02426300140157056, "type": "ENTITLEMENT"}, {"itemId": "YbsKoADkzJEN2VHz", "itemName": "ih3bit0VWn3CO39P", "qty": 0.7933003780613611, "type": "STATISTIC"}], "schedule": {"endTime": "1994-11-19T00:00:00Z", "order": 34, "startTime": "1983-06-09T00:00:00Z"}, "tags": ["XlTDBzOuYsaZA2yy", "d4mbqoOfADMMAXFa", "Y9eKa699bRVhyaKw"]}' \
    > test.out 2>&1
eval_tap $? 12 'AdminUpdateGoals' test.out

#- 13 AdminDeleteGoal
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteGoal \
    --challengeCode 'wrAP2aMlu7WtjCto' \
    --code 'YetOO847g8OudOfj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGoal' test.out

#- 14 AdminListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedulesByGoal \
    --challengeCode 'nCuHZ3c46IjGa23Y' \
    --code 'vYmmDg7VYPXIuvUY' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '82' \
    --userId 'BRujIUE1Tq5jyAZv' \
    > test.out 2>&1
eval_tap $? 14 'AdminListSchedulesByGoal' test.out

#- 15 AdminGetPeriods
./ng net.accelbyte.sdk.cli.Main challenge adminGetPeriods \
    --challengeCode 'kRCMNFIurjh2imdb' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPeriods' test.out

#- 16 AdminRandomizeChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminRandomizeChallenge \
    --challengeCode 'kOkAYfJB8AT9t4Tv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminRandomizeChallenge' test.out

#- 17 AdminListSchedules
./ng net.accelbyte.sdk.cli.Main challenge adminListSchedules \
    --challengeCode '207Y2QD3oD5fLCr3' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1991-11-28T00:00:00Z' \
    --limit '75' \
    --offset '24' \
    --userId 's6gQxC3Gb7S0o4zG' \
    > test.out 2>&1
eval_tap $? 17 'AdminListSchedules' test.out

#- 18 AdminDeleteTiedChallenge
./ng net.accelbyte.sdk.cli.Main challenge adminDeleteTiedChallenge \
    --challengeCode 'YY7KQI1AeFgPqaOk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteTiedChallenge' test.out

#- 19 AdminUpdateTiedChallengeSchedule
./ng net.accelbyte.sdk.cli.Main challenge adminUpdateTiedChallengeSchedule \
    --challengeCode 'vo1aolB4lkKB4EYO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "ACCELERATE", "endDate": "1991-12-13T00:00:00Z"}' \
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
    --body '{"appName": "lWkD9eOziYRFOn0j", "extendType": "APP", "grpcServerAddress": "HC9LxhvNXTwGBCto"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminUpdateAssignmentPlugin' test.out

#- 22 AdminCreateAssignmentPlugin
./ng net.accelbyte.sdk.cli.Main challenge adminCreateAssignmentPlugin \
    --namespace "$AB_NAMESPACE" \
    --body '{"appName": "hLtl9Zuhytm5UDrT", "extendType": "CUSTOM", "grpcServerAddress": "QXCs5SPBbRPZTF6o"}' \
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
    --body '{"userIds": ["QAXVG7tnsZg5QgXj", "vyGJPN4eXbJE5Vs2", "GcyomQoIXimBJehy"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminEvaluateProgress' test.out

#- 25 AdminClaimUsersRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUsersRewards \
    --namespace "$AB_NAMESPACE" \
    --body '[{"rewardIds": ["xlNsjUgxBkF6wFPo", "JeQediogEhhM2rIi", "zGdKvOPdq5xrgxSm"], "userId": "y1DN9LFkYW5DQyj4"}, {"rewardIds": ["bj5Ro2ogaKt2ujQS", "a3Zdb65UXmy0Zp6i", "IaTIKUkmkk9QM0NB"], "userId": "MA9ORxpzwLR2AK6e"}, {"rewardIds": ["XUGPJsw1fiP80G9P", "clxcft2ulIJzPyrV", "EiOG4UcqsuGKHhMR"], "userId": "WLVd3DlhLuIpomM8"}]' \
    > test.out 2>&1
eval_tap $? 25 'AdminClaimUsersRewards' test.out

#- 26 AdminClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewardsByGoalCode \
    --challengeCode 'sm1MiaI1mX2tJoAR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tdbBe7udsMrok0Wv' \
    --body '{"goalCode": "GYYnx4V709xbnGez"}' \
    > test.out 2>&1
eval_tap $? 26 'AdminClaimUserRewardsByGoalCode' test.out

#- 27 AdminGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserProgression \
    --challengeCode 'KsDwG2omOR2nvYI9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVqJdvzcWbfUpaXp' \
    --dateTime '1993-10-17T00:00:00Z' \
    --goalCode 'iWyerCSa8SRgwsAj' \
    --limit '72' \
    --offset '16' \
    --tags 'xsB0NRsB1fPqqRRu,lpqpymDkQhtrHWwR,VnwVBOqOHi8pWGd1' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetUserProgression' test.out

#- 28 AdminGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'juYhiqjRJOqB5F93' \
    --challengeCode 'zFQbJndUDpdONneA' \
    --goalProgressionId 'czbBdHb2slt71B1S' \
    --limit '24' \
    --offset '20' \
    --sortBy 'createdAt:asc' \
    --status 'CLAIMED' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetUserRewards' test.out

#- 29 AdminClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge adminClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'IIk0iKoTTS1j02o7' \
    --body '{"rewardIDs": ["JjTXAQN0qdskdQV0", "TqI8EFnmDbxIxi4Y", "KlONk2Q5Y4Jvaizw"]}' \
    > test.out 2>&1
eval_tap $? 29 'AdminClaimUserRewards' test.out

#- 30 GetChallenges
./ng net.accelbyte.sdk.cli.Main challenge getChallenges \
    --namespace "$AB_NAMESPACE" \
    --keyword 'iilatuUjjt9lIMGq' \
    --limit '24' \
    --offset '55' \
    --sortBy 'createdAt:asc' \
    --status 'RETIRED' \
    --tags '0LcghVHfPEspxwhR,ON0bc1eMbEIjowLq,c3ecjXJbZDKKoxLE' \
    > test.out 2>&1
eval_tap $? 30 'GetChallenges' test.out

#- 31 PublicGetScheduledGoals
./ng net.accelbyte.sdk.cli.Main challenge publicGetScheduledGoals \
    --challengeCode '1Y3Dymtj3giPg4x4' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '83' \
    --sortBy 'createdAt:asc' \
    --tags 'Pjaf3H0tYighU0VU,fcYHJbBfAKSiPW3V,gsZXiR1DJ7HVWqMk' \
    > test.out 2>&1
eval_tap $? 31 'PublicGetScheduledGoals' test.out

#- 32 PublicListSchedulesByGoal
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedulesByGoal \
    --challengeCode 'NSawQUWDFJvJBWic' \
    --code '7UkBeIXuqDuAXI66' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 32 'PublicListSchedulesByGoal' test.out

#- 33 PublicListSchedules
./ng net.accelbyte.sdk.cli.Main challenge publicListSchedules \
    --challengeCode 'Q71w0deoV9Lx5RDA' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-04-03T00:00:00Z' \
    --limit '48' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 33 'PublicListSchedules' test.out

#- 34 PublicClaimUserRewardsByGoalCode
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewardsByGoalCode \
    --challengeCode 'XcrciYNEzvSZIPkh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"goalCode": "SgORcz5S5BvmgBLx"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicClaimUserRewardsByGoalCode' test.out

#- 35 EvaluateMyProgress
./ng net.accelbyte.sdk.cli.Main challenge evaluateMyProgress \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EvaluateMyProgress' test.out

#- 36 PublicGetUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserProgression \
    --challengeCode 'h4ijFnE3Tam69qSZ' \
    --namespace "$AB_NAMESPACE" \
    --dateTime '1998-12-07T00:00:00Z' \
    --goalCode 'adnSKOLFKx1dX4Lu' \
    --limit '100' \
    --offset '91' \
    --tags 'Ju3pDMUAeeZ97SBR,OPYuG6XqP6oo7G73,zdxTgOfnwIdlNa29' \
    > test.out 2>&1
eval_tap $? 36 'PublicGetUserProgression' test.out

#- 37 PublicGetPastUserProgression
./ng net.accelbyte.sdk.cli.Main challenge publicGetPastUserProgression \
    --challengeCode 'fDLh741IslKHzGlL' \
    --index '74' \
    --namespace "$AB_NAMESPACE" \
    --goalCode 'sZKHcl5LLLOexL4f' \
    --limit '31' \
    --offset '43' \
    --tags 'RWCiiPDGQhNPEwiJ,Cf2XJVrlzqQls1oz,hLVA3kE8jKvgatOE' \
    > test.out 2>&1
eval_tap $? 37 'PublicGetPastUserProgression' test.out

#- 38 PublicGetUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicGetUserRewards \
    --namespace "$AB_NAMESPACE" \
    --challengeCode 'BM70TdlNBJYOmpu1' \
    --goalProgressionId 'VCarzBsV6xnZ5Jrz' \
    --limit '52' \
    --offset '87' \
    --sortBy 'createdAt:asc' \
    --status 'UNCLAIMED' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetUserRewards' test.out

#- 39 PublicClaimUserRewards
./ng net.accelbyte.sdk.cli.Main challenge publicClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --body '{"rewardIDs": ["hfxnhLd3Knaknoed", "9DHhLOqQGhCUr6iT", "rjyEgarAdNJOIG36"]}' \
    > test.out 2>&1
eval_tap $? 39 'PublicClaimUserRewards' test.out


rm -f "tmp.dat"

exit $EXIT_CODE