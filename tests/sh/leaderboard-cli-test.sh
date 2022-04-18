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

echo "TAP version 13"
echo "1..35"

#- 1 Login
build/install/cli/bin/cli loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetLeaderboardConfigurationsAdminV1
build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
build/install/cli/bin/cli leaderboard createLeaderboardConfigurationAdminV1 \
    --body '{"daily": {"resetTime": "FtBxyZcD"}, "descending": true, "iconURL": "pGlsQuJu", "leaderboardCode": "8vMf0IsJ", "monthly": {"resetDate": 20, "resetTime": "Trd8IDcV"}, "name": "2zXnTKjX", "seasonPeriod": 3, "startTime": "PqamiBxx", "statCode": "9Cs18EY8", "weekly": {"resetDay": 9, "resetTime": "kItqRzHU"}}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
build/install/cli/bin/cli leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --leaderboardCodes '1oh570KQ' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
build/install/cli/bin/cli leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --body '{"leaderboardCodes": ["BVaewc72"], "limit": 21, "slug": "rSha68n3"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
build/install/cli/bin/cli leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --body '{"leaderboardCodes": ["Ynozp1C2"]}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
build/install/cli/bin/cli leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'KmIQTuBd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
build/install/cli/bin/cli leaderboard updateLeaderboardConfigurationAdminV1 \
    --body '{"daily": {"resetTime": "NEUsxFb8"}, "descending": true, "iconURL": "J17M7DJZ", "monthly": {"resetDate": 0, "resetTime": "MSxECbZb"}, "name": "ygyoarOR", "seasonPeriod": 29, "startTime": "eNHSb8Rh", "statCode": "3kgs9qqJ", "weekly": {"resetDay": 2, "resetTime": "nQsoBgiV"}}' \
    --leaderboardCode 'pP8Cm3yv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
build/install/cli/bin/cli leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'ASUoxdxx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'FqmAGTJ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 GetCurrentMonthLeaderboardRankingAdminV1
build/install/cli/bin/cli leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'IEdagEtp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 12 GetCurrentSeasonLeaderboardRankingAdminV1
build/install/cli/bin/cli leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode '4w29KOu9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 13 GetTodayLeaderboardRankingAdminV1
build/install/cli/bin/cli leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'c19R6XDq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetTodayLeaderboardRankingAdminV1' test.out

#- 14 GetUserRankingAdminV1
build/install/cli/bin/cli leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'WHkkP8np' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEKMfjiX' \
    > test.out 2>&1
eval_tap $? 14 'GetUserRankingAdminV1' test.out

#- 15 UpdateUserPointAdminV1
build/install/cli/bin/cli leaderboard updateUserPointAdminV1 \
    --body '{"inc": 0.9319948639373902, "latestValue": 0.2472405520592631}' \
    --leaderboardCode 'VZk3IaQY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EmqGodOE' \
    > test.out 2>&1
eval_tap $? 15 'UpdateUserPointAdminV1' test.out

#- 16 DeleteUserRankingAdminV1
build/install/cli/bin/cli leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'Gt9gPOj0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c6i0JkvI' \
    > test.out 2>&1
eval_tap $? 16 'DeleteUserRankingAdminV1' test.out

#- 17 GetCurrentWeekLeaderboardRankingAdminV1
build/install/cli/bin/cli leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'as73ucYn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 18 DeleteUserRankingsAdminV1
build/install/cli/bin/cli leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FAJ3DK5T' \
    --leaderboardCode '["4Eogg0Y3"]' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingsAdminV1' test.out

#- 19 GetUserLeaderboardRankingsAdminV1
build/install/cli/bin/cli leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9UoYlpv5' \
    > test.out 2>&1
eval_tap $? 19 'GetUserLeaderboardRankingsAdminV1' test.out

#- 20 GetLeaderboardConfigurationsPublicV1
build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetLeaderboardConfigurationsPublicV1' test.out

#- 21 CreateLeaderboardConfigurationPublicV1
build/install/cli/bin/cli leaderboard createLeaderboardConfigurationPublicV1 \
    --body '{"daily": {"resetTime": "bVAgtsDh"}, "descending": true, "iconURL": "UscbQDjb", "leaderboardCode": "TQuPMz2P", "monthly": {"resetDate": 91, "resetTime": "RlkyU89Z"}, "name": "POw6zPFJ", "seasonPeriod": 5, "startTime": "wmzBBSMN", "statCode": "coAAOjKN", "weekly": {"resetDay": 18, "resetTime": "fcYHm093"}}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'CreateLeaderboardConfigurationPublicV1' test.out

#- 22 GetAllTimeLeaderboardRankingPublicV1
build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'aYgBU1sq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 23 GetArchivedLeaderboardRankingDataV1Handler
build/install/cli/bin/cli leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'jyK0XH45' \
    --namespace "$AB_NAMESPACE" \
    --leaderboardCodes 'PaRSOFQB' \
    > test.out 2>&1
eval_tap $? 23 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 24 GetCurrentMonthLeaderboardRankingPublicV1
build/install/cli/bin/cli leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'tu23REZ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 25 GetCurrentSeasonLeaderboardRankingPublicV1
build/install/cli/bin/cli leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'hRVX7LGO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 26 GetTodayLeaderboardRankingPublicV1
build/install/cli/bin/cli leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'vDdYiQS9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetTodayLeaderboardRankingPublicV1' test.out

#- 27 GetUserRankingPublicV1
build/install/cli/bin/cli leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'i7mV1C91' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pjG9gpxL' \
    > test.out 2>&1
eval_tap $? 27 'GetUserRankingPublicV1' test.out

#- 28 DeleteUserRankingPublicV1
build/install/cli/bin/cli leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode '6ycTQdvl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n2LAuSQW' \
    > test.out 2>&1
eval_tap $? 28 'DeleteUserRankingPublicV1' test.out

#- 29 GetCurrentWeekLeaderboardRankingPublicV1
build/install/cli/bin/cli leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'EXL6LFE1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 30 GetHiddenUsersV2
build/install/cli/bin/cli leaderboard getHiddenUsersV2 \
    --leaderboardCode 'YHo9m126' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetHiddenUsersV2' test.out

#- 31 GetUserVisibilityStatusV2
build/install/cli/bin/cli leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'ZWc8hHtW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vbNYqgUq' \
    > test.out 2>&1
eval_tap $? 31 'GetUserVisibilityStatusV2' test.out

#- 32 SetUserLeaderboardVisibilityStatusV2
build/install/cli/bin/cli leaderboard setUserLeaderboardVisibilityStatusV2 \
    --body '{"visibility": true}' \
    --leaderboardCode 'lArFPiHU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IvaCv8kU' \
    > test.out 2>&1
eval_tap $? 32 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 33 SetUserVisibilityStatusV2
build/install/cli/bin/cli leaderboard setUserVisibilityStatusV2 \
    --body '{"visibility": false}' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BBpdsJLh' \
    > test.out 2>&1
eval_tap $? 33 'SetUserVisibilityStatusV2' test.out

#- 34 GetLeaderboardConfigurationsPublicV2
build/install/cli/bin/cli leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetLeaderboardConfigurationsPublicV2' test.out

#- 35 GetAllTimeLeaderboardRankingPublicV2
build/install/cli/bin/cli leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'sVyExrkx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'GetAllTimeLeaderboardRankingPublicV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE