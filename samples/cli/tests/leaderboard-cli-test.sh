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
    --limit '80' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 2 'GetLeaderboardConfigurationsAdminV1' test.out

#- 3 CreateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "cssq8HST"}, "descending": false, "iconURL": "ePN1ZDqN", "leaderboardCode": "bgFxqnrh", "monthly": {"resetDate": 45, "resetTime": "sYjB3aHk"}, "name": "GRAxViXE", "seasonPeriod": 38, "startTime": "tiOVTsYi", "statCode": "UAYWlkkE", "weekly": {"resetDay": 26, "resetTime": "qWIOOLjb"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'vAPsud0K' \
    --leaderboardCodes 'IBVslSwM' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["AMjojYu5", "oSrNMu3v", "P0ZsSwze"], "limit": 70, "slug": "NY13FeXr"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["BoaqBEDW", "S4scGoaw", "yXR1lJiS"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'zV8IcxNg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode '66VoAxsZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "FEyWSzzg"}, "descending": false, "iconURL": "1J05a63s", "monthly": {"resetDate": 82, "resetTime": "aPOP7MZz"}, "name": "09DQ7zAs", "seasonPeriod": 8, "startTime": "atyfJfN3", "statCode": "i5w1OSsj", "weekly": {"resetDay": 24, "resetTime": "5N3knHKN"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'll73Amqv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'HjkTIfZZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'n1CxJob7' \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 11 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 12 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode 'jPCsjMvu' \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 13 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode 'AUATK5yj' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 13 'GetTodayLeaderboardRankingAdminV1' test.out

#- 14 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'Cy2aKNPv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3GH5GKR' \
    > test.out 2>&1
eval_tap $? 14 'GetUserRankingAdminV1' test.out

#- 15 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'iwjQWILs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p1wXihVB' \
    --body '{"inc": 0.9901037678219357, "latestValue": 0.25264547383426683}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateUserPointAdminV1' test.out

#- 16 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'ZMEYCnfM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r2NUCLZW' \
    > test.out 2>&1
eval_tap $? 16 'DeleteUserRankingAdminV1' test.out

#- 17 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'PlBAY2zo' \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 17 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 18 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hbos6OwH' \
    --leaderboardCode 'W8gZX8Q6", "0PTX4XUb", "OyYtHAed' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingsAdminV1' test.out

#- 19 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KtCFrzEh' \
    --limit '93' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 19 'GetUserLeaderboardRankingsAdminV1' test.out

#- 20 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '92' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 20 'GetLeaderboardConfigurationsPublicV1' test.out

#- 21 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "Yjs5EAwT"}, "descending": false, "iconURL": "YVeHFW9U", "leaderboardCode": "Pmgs95Fr", "monthly": {"resetDate": 53, "resetTime": "9tzZAtrX"}, "name": "WueAriMF", "seasonPeriod": 100, "startTime": "HaIzVAQm", "statCode": "OSMeA0Jd", "weekly": {"resetDay": 55, "resetTime": "RmGOLO9z"}}' \
    > test.out 2>&1
eval_tap $? 21 'CreateLeaderboardConfigurationPublicV1' test.out

#- 22 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode 'VKJtDcZj' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 22 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 23 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode '2jRg0u96' \
    --namespace "$AB_NAMESPACE" \
    --slug '8YdmutC7' \
    --leaderboardCodes 'rhEpvfAw' \
    > test.out 2>&1
eval_tap $? 23 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 24 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'ZHxvXztB' \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 24 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 25 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'P6T1BsIC' \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 25 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 26 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'PeR1ou4F' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 26 'GetTodayLeaderboardRankingPublicV1' test.out

#- 27 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode '5kNDcVui' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dS8CLRJM' \
    > test.out 2>&1
eval_tap $? 27 'GetUserRankingPublicV1' test.out

#- 28 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'mTmp1f71' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kzYEwcbn' \
    > test.out 2>&1
eval_tap $? 28 'DeleteUserRankingPublicV1' test.out

#- 29 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'K8IWgOIn' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 29 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 30 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode '4F7wbniF' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 30 'GetHiddenUsersV2' test.out

#- 31 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'WQBLT4Mr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4A9VsA6' \
    > test.out 2>&1
eval_tap $? 31 'GetUserVisibilityStatusV2' test.out

#- 32 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode '4IIWA3l1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T1RkfG1T' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 32 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 33 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '1iOOKoUK' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 33 'SetUserVisibilityStatusV2' test.out

#- 34 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '65' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 34 'GetLeaderboardConfigurationsPublicV2' test.out

#- 35 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'nmwtnCLp' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 35 'GetAllTimeLeaderboardRankingPublicV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE