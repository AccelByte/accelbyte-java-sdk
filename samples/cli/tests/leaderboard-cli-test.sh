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
echo "1..35"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetLeaderboardConfigurationsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '69' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "5oLrBWhw"}, "descending": false, "iconURL": "8Hdp1xw6", "leaderboardCode": "D8NiZDT1", "monthly": {"resetDate": 90, "resetTime": "i6lmA3Tl"}, "name": "ETq6BQHp", "seasonPeriod": 51, "startTime": "26bVMgBp", "statCode": "cfzjZv5f", "weekly": {"resetDay": 66, "resetTime": "CSyyieK9"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'BLpsnq4U' \
    --leaderboardCodes 'l4r1G7JK' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["cqJgMPhm", "r3HvcpXi", "41vlSj80"], "limit": 9, "slug": "NteskOLl"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["l5bWXKyq", "DSd2Db5s", "t0gdfyUQ"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'txfNeFaW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'hxdOqz6f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "tQ0MhXxt"}, "descending": true, "iconURL": "2TUm86hn", "monthly": {"resetDate": 3, "resetTime": "vqyKSgSP"}, "name": "sY01tmDW", "seasonPeriod": 83, "startTime": "ucD5ENrh", "statCode": "3RMZK7Dm", "weekly": {"resetDay": 92, "resetTime": "krVSyTcm"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'S5buh5B7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'I2TKHHxj' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'Vth6S1lf' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 11 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 12 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode '9nL95xYo' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 13 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'ecN8A9rO' \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 13 'GetTodayLeaderboardRankingAdminV1' test.out

#- 14 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'VEVrZ0kH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T3MoE8Bw' \
    > test.out 2>&1
eval_tap $? 14 'GetUserRankingAdminV1' test.out

#- 15 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'AevVZwTj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BLrCTnwg' \
    --body '{"inc": 0.5784449906215176, "latestValue": 0.21296127600543102}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateUserPointAdminV1' test.out

#- 16 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'Wco86j9L' \
    --namespace "$AB_NAMESPACE" \
    --userId '8Y2RUqL4' \
    > test.out 2>&1
eval_tap $? 16 'DeleteUserRankingAdminV1' test.out

#- 17 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode '3L33kTxE' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 17 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 18 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7kvxd50r' \
    --leaderboardCode 'VdArI2qS,JykQICoD,wxWW0eoF' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingsAdminV1' test.out

#- 19 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jP3hNbOP' \
    --limit '28' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 19 'GetUserLeaderboardRankingsAdminV1' test.out

#- 20 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '94' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 20 'GetLeaderboardConfigurationsPublicV1' test.out

#- 21 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "k6vhmMMf"}, "descending": true, "iconURL": "E2rxLbdE", "leaderboardCode": "dhvWIbTN", "monthly": {"resetDate": 61, "resetTime": "HgJzmOFi"}, "name": "T5qVpW8K", "seasonPeriod": 22, "startTime": "et9pdJr8", "statCode": "MNUC2nfV", "weekly": {"resetDay": 5, "resetTime": "4pfAMpX0"}}' \
    > test.out 2>&1
eval_tap $? 21 'CreateLeaderboardConfigurationPublicV1' test.out

#- 22 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'jhD43u2D' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 22 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 23 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'xLqjsb8l' \
    --namespace "$AB_NAMESPACE" \
    --slug '1iD9zSrF' \
    --leaderboardCodes 'c4cMmbl0' \
    > test.out 2>&1
eval_tap $? 23 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 24 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'Phjdu1pA' \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 24 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 25 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode '0DA5mkMT' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 25 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 26 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'bxf83MS2' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 26 'GetTodayLeaderboardRankingPublicV1' test.out

#- 27 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'lXfJ1zYf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tBYcJbhH' \
    > test.out 2>&1
eval_tap $? 27 'GetUserRankingPublicV1' test.out

#- 28 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'ZAPrb6jS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X8DcgYA8' \
    > test.out 2>&1
eval_tap $? 28 'DeleteUserRankingPublicV1' test.out

#- 29 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'Q4JEX6SX' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 29 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 30 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode 'tZnnhlRz' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 30 'GetHiddenUsersV2' test.out

#- 31 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'ou1DKcGh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JrZhdCzV' \
    > test.out 2>&1
eval_tap $? 31 'GetUserVisibilityStatusV2' test.out

#- 32 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode '89J66YXq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cJHNb7QW' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 32 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 33 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3FjnXhUn' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 33 'SetUserVisibilityStatusV2' test.out

#- 34 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 34 'GetLeaderboardConfigurationsPublicV2' test.out

#- 35 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'vO6GeIsA' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 35 'GetAllTimeLeaderboardRankingPublicV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE