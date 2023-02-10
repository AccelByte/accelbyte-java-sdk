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
    --limit '72' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "jIaezK9J"}, "descending": true, "iconURL": "MDlv9w5l", "leaderboardCode": "WBoCq2Ix", "monthly": {"resetDate": 66, "resetTime": "3u2Adsnw"}, "name": "pd3Wwj9m", "seasonPeriod": 33, "startTime": "yvnzXyNY", "statCode": "nraZaslB", "weekly": {"resetDay": 64, "resetTime": "pQ48dSoO"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'AsPhpq2s' \
    --leaderboardCodes '1eMe6hEA' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["l5gvcX8V", "4zhULEuH", "nIK65ZoU"], "limit": 88, "slug": "o0IMqIjh"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["fcCqMvXh", "LPRUH5wq", "v6AOcyZD"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'd1kQcNtu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode '3nuJT6wB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "yjzrPQi7"}, "descending": true, "iconURL": "rnhqRcAR", "monthly": {"resetDate": 79, "resetTime": "tIjYxL0V"}, "name": "xuYrBfAE", "seasonPeriod": 60, "startTime": "pOctksHd", "statCode": "Ko9wO9R0", "weekly": {"resetDay": 4, "resetTime": "0U7bG3IX"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'uErB0Uku' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'dicdyHxJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'm4NI1fGm' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 11 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 12 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode '6sJ7iZTo' \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 13 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'of1KthF4' \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 13 'GetTodayLeaderboardRankingAdminV1' test.out

#- 14 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'g1gt3rmn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bGzJBWsn' \
    > test.out 2>&1
eval_tap $? 14 'GetUserRankingAdminV1' test.out

#- 15 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'pFM3cG84' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XbgSJF0E' \
    --body '{"inc": 0.2016182625612878, "latestValue": 0.5608909885754079}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateUserPointAdminV1' test.out

#- 16 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'C9LZJasP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMbY5vN7' \
    > test.out 2>&1
eval_tap $? 16 'DeleteUserRankingAdminV1' test.out

#- 17 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'ZJ7CaT2k' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 17 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 18 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8FPCRRsA' \
    --leaderboardCode 'DB7oCXy7,nhstTyG7,1gH8C99w' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingsAdminV1' test.out

#- 19 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a4qj5CPn' \
    --limit '42' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 19 'GetUserLeaderboardRankingsAdminV1' test.out

#- 20 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '38' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 20 'GetLeaderboardConfigurationsPublicV1' test.out

#- 21 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "BgOGrLWq"}, "descending": true, "iconURL": "ZSjnmG3z", "leaderboardCode": "iVesMqEe", "monthly": {"resetDate": 34, "resetTime": "Oi6G3Kgj"}, "name": "3qyJlAix", "seasonPeriod": 62, "startTime": "2WTTzeE5", "statCode": "3WuY9FuO", "weekly": {"resetDay": 87, "resetTime": "kTVH85ef"}}' \
    > test.out 2>&1
eval_tap $? 21 'CreateLeaderboardConfigurationPublicV1' test.out

#- 22 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'K5bvsoZt' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 22 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 23 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'W2RUvfES' \
    --namespace "$AB_NAMESPACE" \
    --slug 'lAEnv9IZ' \
    --leaderboardCodes 'EhdvavzL' \
    > test.out 2>&1
eval_tap $? 23 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 24 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode '5ROrwlwa' \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 24 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 25 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode '69VmE9Ze' \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 25 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 26 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'SW0hLaeC' \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 26 'GetTodayLeaderboardRankingPublicV1' test.out

#- 27 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'xbLqWWh3' \
    --namespace "$AB_NAMESPACE" \
    --userId '0B5gBWs0' \
    > test.out 2>&1
eval_tap $? 27 'GetUserRankingPublicV1' test.out

#- 28 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'tyiHndX9' \
    --namespace "$AB_NAMESPACE" \
    --userId '9I2ZZj3I' \
    > test.out 2>&1
eval_tap $? 28 'DeleteUserRankingPublicV1' test.out

#- 29 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'lTbFTun6' \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 29 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 30 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode 'JnXnNk41' \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 30 'GetHiddenUsersV2' test.out

#- 31 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'Z3c0icwl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S1x02ASE' \
    > test.out 2>&1
eval_tap $? 31 'GetUserVisibilityStatusV2' test.out

#- 32 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode 'DucALIcP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cpKyOeI5' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 32 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 33 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cbJTAIOQ' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 33 'SetUserVisibilityStatusV2' test.out

#- 34 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 34 'GetLeaderboardConfigurationsPublicV2' test.out

#- 35 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'SNyKJkj7' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 35 'GetAllTimeLeaderboardRankingPublicV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE