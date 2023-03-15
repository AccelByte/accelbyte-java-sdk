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
echo "1..36"

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
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "AxcVpFrt"}, "descending": true, "iconURL": "6LZrkq6D", "leaderboardCode": "c09nIW0O", "monthly": {"resetDate": 1, "resetTime": "lAw7r6W2"}, "name": "ktQG0h5J", "seasonPeriod": 54, "startTime": "Udc0qh4n", "statCode": "8mzZ0m8S", "weekly": {"resetDay": 54, "resetTime": "cDs8bBZL"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'CXLx8bbg' \
    --leaderboardCodes 'orQeFbQ1' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["g7qbPngU", "NB1vRodw", "pzS6DaDp"], "limit": 44, "slug": "1Jub74CU"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["kNmKJfh5", "pUkHODpo", "MF78NY4Y"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'kHs1cnz1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'JSDgY1TX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "p38zsCTC"}, "descending": true, "iconURL": "cPiSuL0S", "monthly": {"resetDate": 23, "resetTime": "kT7NvyE3"}, "name": "cwyALczN", "seasonPeriod": 72, "startTime": "Mf8GZ2WB", "statCode": "ZqxYG3aR", "weekly": {"resetDay": 63, "resetTime": "Os1PXhT5"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'FvdiRilZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode '7oFgx4c8' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'umKtPDKJ' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 11 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 12 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode 'n7Z4U68s' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 13 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode '8XfqlqNi' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 13 'GetTodayLeaderboardRankingAdminV1' test.out

#- 14 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'vB6SdAdI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUDrwoZ5' \
    > test.out 2>&1
eval_tap $? 14 'GetUserRankingAdminV1' test.out

#- 15 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'MecdKi5r' \
    --namespace "$AB_NAMESPACE" \
    --userId '6QEa1ysL' \
    --body '{"inc": 0.4894613995941054, "latestValue": 0.4192333831290148}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateUserPointAdminV1' test.out

#- 16 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'th6mXhzk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWkFeZSo' \
    > test.out 2>&1
eval_tap $? 16 'DeleteUserRankingAdminV1' test.out

#- 17 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'EAcBdW19' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 17 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 18 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4eu6d5tA' \
    --leaderboardCode '5jUmiTqp,yhPFdxLz,FQN05MYz' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingsAdminV1' test.out

#- 19 AdminAnonymizeUserLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard adminAnonymizeUserLeaderboardAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YiKWe5dN' \
    > test.out 2>&1
eval_tap $? 19 'AdminAnonymizeUserLeaderboardAdminV1' test.out

#- 20 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rljv7IPr' \
    --limit '60' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 20 'GetUserLeaderboardRankingsAdminV1' test.out

#- 21 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '88' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 21 'GetLeaderboardConfigurationsPublicV1' test.out

#- 22 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "QRgat0Se"}, "descending": true, "iconURL": "Q7KYnIuM", "leaderboardCode": "BvaO35ll", "monthly": {"resetDate": 52, "resetTime": "6Vpbsx5w"}, "name": "8hqUI06U", "seasonPeriod": 32, "startTime": "uB0y5WUl", "statCode": "rMdI4sNv", "weekly": {"resetDay": 10, "resetTime": "vR8sKgnu"}}' \
    > test.out 2>&1
eval_tap $? 22 'CreateLeaderboardConfigurationPublicV1' test.out

#- 23 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'RkgghGoY' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 23 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 24 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'pD391C2q' \
    --namespace "$AB_NAMESPACE" \
    --slug 'tPYokahF' \
    --leaderboardCodes 'jkQsfCaT' \
    > test.out 2>&1
eval_tap $? 24 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 25 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'mt1d67FX' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 25 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 26 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'VLisV6zw' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 26 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 27 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'uo3td6TC' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 27 'GetTodayLeaderboardRankingPublicV1' test.out

#- 28 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'Cf9x4rt6' \
    --namespace "$AB_NAMESPACE" \
    --userId '9lna7qxN' \
    > test.out 2>&1
eval_tap $? 28 'GetUserRankingPublicV1' test.out

#- 29 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'eIxPz6Mb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wL6IY69z' \
    > test.out 2>&1
eval_tap $? 29 'DeleteUserRankingPublicV1' test.out

#- 30 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode '1UaLqYSY' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 30 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 31 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode 'ytLPziZM' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 31 'GetHiddenUsersV2' test.out

#- 32 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'jxcBZufQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xGiHPllG' \
    > test.out 2>&1
eval_tap $? 32 'GetUserVisibilityStatusV2' test.out

#- 33 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode '4cYEzfTD' \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZBm3MqH' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 33 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 34 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IJA8IHtr' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 34 'SetUserVisibilityStatusV2' test.out

#- 35 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 35 'GetLeaderboardConfigurationsPublicV2' test.out

#- 36 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode '8RwNmn9H' \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 36 'GetAllTimeLeaderboardRankingPublicV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE