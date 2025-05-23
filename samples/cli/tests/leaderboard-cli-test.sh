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
echo "1..64"

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
    --body '{"daily": {"resetTime": "AxcVpFrttufHIRdH"}, "descending": false, "iconURL": "UzVRiXbqlAw7r6W2", "leaderboardCode": "ktQG0h5JAav5kRa6", "monthly": {"resetDate": 100, "resetTime": "mzZ0m8SAMTwE6I56"}, "name": "IaRDBXxyaNoMR6hk", "seasonPeriod": 37, "startTime": "7qbPngUNB1vRodwp", "statCode": "zS6DaDpv8N7ZQVqG", "weekly": {"resetDay": 20, "resetTime": "NmKJfh5pUkHODpoM"}}' \
    > test.out 2>&1
eval_tap $? 3 'CreateLeaderboardConfigurationAdminV1' test.out

#- 4 AdminGetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard adminGetArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --slug 'F78NY4YkHs1cnz1J' \
    --leaderboardCodes 'SDgY1TXp38zsCTCr' \
    > test.out 2>&1
eval_tap $? 4 'AdminGetArchivedLeaderboardRankingDataV1Handler' test.out

#- 5 CreateArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard createArchivedLeaderboardRankingDataV1Handler \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["bCbPOyNQkT7NvyE3", "cwyALczNIicXm7ag", "SrjJW2OQNOs1PXhT"], "limit": 74, "slug": "FvdiRilZ7oFgx4c8"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateArchivedLeaderboardRankingDataV1Handler' test.out

#- 6 DeleteBulkLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["OumKtPDKJDXn7Z4U", "68su8XfqlqNiTvB6", "SdAdIhUDrwoZ5Mec"]}' \
    > test.out 2>&1
eval_tap $? 6 'DeleteBulkLeaderboardConfigurationAdminV1' test.out

#- 7 GetLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'dKi5r6QEa1ysLEzt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetLeaderboardConfigurationAdminV1' test.out

#- 8 UpdateLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'h6mXhzkzWkFeZSoE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "AcBdW19m4eu6d5tA"}, "descending": false, "iconURL": "duuyZ0GhDogqrhBR", "monthly": {"resetDate": 7, "resetTime": "N05MYzYiKWe5dNRl"}, "name": "jv7IPrDQQRgat0Se", "seasonPeriod": 44, "startTime": "Q7KYnIuMBvaO35ll", "statCode": "zQRaT5kPxUfofvnn", "weekly": {"resetDay": 92, "resetTime": "pOXGSLmCVuHOPlLl"}}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateLeaderboardConfigurationAdminV1' test.out

#- 9 DeleteLeaderboardConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV1 \
    --leaderboardCode 'kvR8sKgnuRkgghGo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteLeaderboardConfigurationAdminV1' test.out

#- 10 GetAllTimeLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV1 \
    --leaderboardCode 'YupD391C2qtPYoka' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 10 'GetAllTimeLeaderboardRankingAdminV1' test.out

#- 11 HardDeleteLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV1 \
    --leaderboardCode 'FjkQsfCaTmt1d67F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'HardDeleteLeaderboardAdminV1' test.out

#- 12 GetCurrentMonthLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingAdminV1 \
    --leaderboardCode 'XGk2s9Q0mPVo3twu' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '93' \
    --previousVersion '10' \
    > test.out 2>&1
eval_tap $? 12 'GetCurrentMonthLeaderboardRankingAdminV1' test.out

#- 13 DeleteUserRankingByLeaderboardCodeAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV1 \
    --leaderboardCode 'C6I3lMjGSWN2laRl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteUserRankingByLeaderboardCodeAdminV1' test.out

#- 14 GetCurrentSeasonLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingAdminV1 \
    --leaderboardCode 'xfcjHfYakUCTqGkE' \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '52' \
    --previousVersion '5' \
    > test.out 2>&1
eval_tap $? 14 'GetCurrentSeasonLeaderboardRankingAdminV1' test.out

#- 15 GetTodayLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingAdminV1 \
    --leaderboardCode '1UaLqYSYWytLPziZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '30' \
    --previousVersion '7' \
    > test.out 2>&1
eval_tap $? 15 'GetTodayLeaderboardRankingAdminV1' test.out

#- 16 GetUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV1 \
    --leaderboardCode 'NRKd3IL5TAQ6iiPl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SC2uE4o5Vwdo3feP' \
    --previousVersion '33' \
    > test.out 2>&1
eval_tap $? 16 'GetUserRankingAdminV1' test.out

#- 17 UpdateUserPointAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard updateUserPointAdminV1 \
    --leaderboardCode 'cUmLZZbSqb8RwNmn' \
    --namespace "$AB_NAMESPACE" \
    --userId '9HrNQy4uZAAiE0mi' \
    --body '{"inc": 0.3078069814474219, "latestValue": 0.9872765908317457}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateUserPointAdminV1' test.out

#- 18 DeleteUserRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV1 \
    --leaderboardCode 'RGCCHYzUOcEdscKH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PEqgA8yu7Vk6Jt4Y' \
    > test.out 2>&1
eval_tap $? 18 'DeleteUserRankingAdminV1' test.out

#- 19 GetCurrentWeekLeaderboardRankingAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingAdminV1 \
    --leaderboardCode 'mos9Jcdos4fYcTVU' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '25' \
    --previousVersion '56' \
    > test.out 2>&1
eval_tap $? 19 'GetCurrentWeekLeaderboardRankingAdminV1' test.out

#- 20 DeleteUserRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vCkGZ5dAgqxpBFma' \
    --leaderboardCode 'Loxozr6wfNPX2bOI,tRMvqtlB2jJCSQT2,79ZZPYGu0rdlgdWy' \
    > test.out 2>&1
eval_tap $? 20 'DeleteUserRankingsAdminV1' test.out

#- 21 AdminAnonymizeUserLeaderboardAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard adminAnonymizeUserLeaderboardAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OtXi3choQrpOsDBU' \
    > test.out 2>&1
eval_tap $? 21 'AdminAnonymizeUserLeaderboardAdminV1' test.out

#- 22 GetUserLeaderboardRankingsAdminV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5SepjChB3V0v52Dl' \
    --limit '50' \
    --offset '74' \
    --previousVersion '25' \
    > test.out 2>&1
eval_tap $? 22 'GetUserLeaderboardRankingsAdminV1' test.out

#- 23 GetLeaderboardConfigurationsPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --isArchived  \
    --isDeleted  \
    --limit '75' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 23 'GetLeaderboardConfigurationsPublicV1' test.out

#- 24 CreateLeaderboardConfigurationPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"daily": {"resetTime": "KXNB3Gv0IqmF51Tk"}, "descending": false, "iconURL": "Kp44YUDjasWIPUvm", "leaderboardCode": "EejtGeoyIPa8ZRrv", "monthly": {"resetDate": 19, "resetTime": "kmoPYgc2L4jk4Lo0"}, "name": "LSP0pf4IxjUkl535", "seasonPeriod": 69, "startTime": "ateEKDpADz1x3poD", "statCode": "3Qgb3boLQQ1MzH7Q", "weekly": {"resetDay": 26, "resetTime": "ZNBdte9NDUPVJf6c"}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateLeaderboardConfigurationPublicV1' test.out

#- 25 GetAllTimeLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV1 \
    --leaderboardCode '2Z0QZxfgPubTDIHr' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 25 'GetAllTimeLeaderboardRankingPublicV1' test.out

#- 26 GetArchivedLeaderboardRankingDataV1Handler
./ng net.accelbyte.sdk.cli.Main leaderboard getArchivedLeaderboardRankingDataV1Handler \
    --leaderboardCode 'qAThuwjRHpKKTlmV' \
    --namespace "$AB_NAMESPACE" \
    --slug 'r9XuoJbRFQSKVPHb' \
    --leaderboardCodes 'n4Xxtu7LQRENjEEz' \
    > test.out 2>&1
eval_tap $? 26 'GetArchivedLeaderboardRankingDataV1Handler' test.out

#- 27 GetCurrentMonthLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentMonthLeaderboardRankingPublicV1 \
    --leaderboardCode 'tx1WsYSiZqan0nSB' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '36' \
    --previousVersion '30' \
    > test.out 2>&1
eval_tap $? 27 'GetCurrentMonthLeaderboardRankingPublicV1' test.out

#- 28 GetCurrentSeasonLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentSeasonLeaderboardRankingPublicV1 \
    --leaderboardCode 'YBHqaTHeKtW18iGe' \
    --namespace "$AB_NAMESPACE" \
    --limit '96' \
    --offset '98' \
    --previousVersion '23' \
    > test.out 2>&1
eval_tap $? 28 'GetCurrentSeasonLeaderboardRankingPublicV1' test.out

#- 29 GetTodayLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getTodayLeaderboardRankingPublicV1 \
    --leaderboardCode 'HQipcCx9Zw5D2L7v' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '66' \
    --previousVersion '33' \
    > test.out 2>&1
eval_tap $? 29 'GetTodayLeaderboardRankingPublicV1' test.out

#- 30 GetUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV1 \
    --leaderboardCode 'hGGSyEW4ZJJ42d3P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BddN8S48l9lyNApf' \
    --previousVersion '23' \
    > test.out 2>&1
eval_tap $? 30 'GetUserRankingPublicV1' test.out

#- 31 DeleteUserRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingPublicV1 \
    --leaderboardCode 'kfZrQvGgbLdLsFzH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kBMr1yrOMlNFSrUE' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserRankingPublicV1' test.out

#- 32 GetCurrentWeekLeaderboardRankingPublicV1
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentWeekLeaderboardRankingPublicV1 \
    --leaderboardCode 'irnjX9fDmIbeZxzf' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '99' \
    --previousVersion '5' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentWeekLeaderboardRankingPublicV1' test.out

#- 33 GetHiddenUsersV2
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV2 \
    --leaderboardCode 'QG26yUZNmTBcvrbY' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 33 'GetHiddenUsersV2' test.out

#- 34 GetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV2 \
    --leaderboardCode 'wZtxFHyPLtI8ilby' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DPUIj88cekdqCt81' \
    > test.out 2>&1
eval_tap $? 34 'GetUserVisibilityStatusV2' test.out

#- 35 SetUserLeaderboardVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityStatusV2 \
    --leaderboardCode 'P1ktfIovmv9gsR5c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JcHm3SZLxoRDFuuu' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 35 'SetUserLeaderboardVisibilityStatusV2' test.out

#- 36 SetUserVisibilityStatusV2
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityStatusV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ByjlBiuFM3FIoVk8' \
    --body '{"visibility": false}' \
    > test.out 2>&1
eval_tap $? 36 'SetUserVisibilityStatusV2' test.out

#- 37 GetLeaderboardConfigurationsPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 37 'GetLeaderboardConfigurationsPublicV2' test.out

#- 38 GetAllTimeLeaderboardRankingPublicV2
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV2 \
    --leaderboardCode 'AMwzHPxB1UskYs4Y' \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 38 'GetAllTimeLeaderboardRankingPublicV2' test.out

#- 39 GetLeaderboardConfigurationsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '60' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 39 'GetLeaderboardConfigurationsAdminV3' test.out

#- 40 CreateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard createLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": true, "cycleIds": ["SWMiVi10sG6vxkfU", "cmqRRbceJ5i0EeDx", "OgBnhhqElIaDml48"], "descending": true, "description": "H0JT1yduat2vQR3b", "iconURL": "iBfsu4jmsRE2w1yE", "leaderboardCode": "kLgh3tIYt4SqYUTL", "name": "Dx9gIiDandpGT2t2", "statCode": "4aOMh5eC3IHeHSKL"}' \
    > test.out 2>&1
eval_tap $? 40 'CreateLeaderboardConfigurationAdminV3' test.out

#- 41 DeleteBulkLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteBulkLeaderboardConfigurationAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --body '{"leaderboardCodes": ["Ca3xreNDUWehwH3q", "31A806DJgas4b6z3", "LNUj7fdgLA84Z8YY"]}' \
    > test.out 2>&1
eval_tap $? 41 'DeleteBulkLeaderboardConfigurationAdminV3' test.out

#- 42 GetLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'k6QEgJjBbEDoNf3n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetLeaderboardConfigurationAdminV3' test.out

#- 43 UpdateLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard updateLeaderboardConfigurationAdminV3 \
    --leaderboardCode '0hEoRCAcf80zfFya' \
    --namespace "$AB_NAMESPACE" \
    --body '{"allTime": false, "cycleIds": ["JrYq6hRkloqxM3gp", "wxcfMy9XzjjI5Ybs", "KoADkzJEN2VHzih3"], "descending": false, "description": "O86IlBhnetU4RwTq", "iconURL": "UXlTDBzOuYsaZA2y", "name": "yd4mbqoOfADMMAXF"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateLeaderboardConfigurationAdminV3' test.out

#- 44 DeleteLeaderboardConfigurationAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteLeaderboardConfigurationAdminV3 \
    --leaderboardCode 'aY9eKa699bRVhyaK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteLeaderboardConfigurationAdminV3' test.out

#- 45 GetAllTimeLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingAdminV3 \
    --leaderboardCode 'wwrAP2aMlu7WtjCt' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 45 'GetAllTimeLeaderboardRankingAdminV3' test.out

#- 46 GetCurrentCycleLeaderboardRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingAdminV3 \
    --cycleId 'YetOO847g8OudOfj' \
    --leaderboardCode 'nCuHZ3c46IjGa23Y' \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '34' \
    --previousVersion '85' \
    > test.out 2>&1
eval_tap $? 46 'GetCurrentCycleLeaderboardRankingAdminV3' test.out

#- 47 DeleteAllUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteAllUserRankingByCycleIdAdminV3 \
    --cycleId 'mmDg7VYPXIuvUYTZ' \
    --leaderboardCode 'BRujIUE1Tq5jyAZv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAllUserRankingByCycleIdAdminV3' test.out

#- 48 DeleteUserRankingByCycleIdAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByCycleIdAdminV3 \
    --cycleId 'kRCMNFIurjh2imdb' \
    --leaderboardCode '4rbkXj0ZwsVC0gL9' \
    --namespace "$AB_NAMESPACE" \
    --userId '7ZVJSPqJiwv1qlYB' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserRankingByCycleIdAdminV3' test.out

#- 49 HardDeleteLeaderboardAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard hardDeleteLeaderboardAdminV3 \
    --leaderboardCode '1RSKs6gQxC3Gb7S0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'HardDeleteLeaderboardAdminV3' test.out

#- 50 DeleteUserRankingByLeaderboardCodeAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingByLeaderboardCodeAdminV3 \
    --leaderboardCode 'o4zGYY7KQI1AeFgP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteUserRankingByLeaderboardCodeAdminV3' test.out

#- 51 GetHiddenUsersV3
./ng net.accelbyte.sdk.cli.Main leaderboard getHiddenUsersV3 \
    --leaderboardCode 'qaOkvo1aolB4lkKB' \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 51 'GetHiddenUsersV3' test.out

#- 52 GetUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingAdminV3 \
    --leaderboardCode 'qkNNlWkD9eOziYRF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'On0jJLHC9LxhvNXT' \
    --previousVersion '45' \
    > test.out 2>&1
eval_tap $? 52 'GetUserRankingAdminV3' test.out

#- 53 DeleteUserRankingAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingAdminV3 \
    --leaderboardCode 'w3HICQLfl7MUBG7q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tPu64yAtURKLRkb7' \
    > test.out 2>&1
eval_tap $? 53 'DeleteUserRankingAdminV3' test.out

#- 54 GetUserVisibilityStatusV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserVisibilityStatusV3 \
    --leaderboardCode '38HGS6rDgMdIIlhS' \
    --namespace "$AB_NAMESPACE" \
    --userId '1fSiM9331m7Ta1Ps' \
    > test.out 2>&1
eval_tap $? 54 'GetUserVisibilityStatusV3' test.out

#- 55 SetUserLeaderboardVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserLeaderboardVisibilityV3 \
    --leaderboardCode 'Kc50Kv6ecnEevcAx' \
    --namespace "$AB_NAMESPACE" \
    --userId '2K2zkRenmPZnGBt4' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 55 'SetUserLeaderboardVisibilityV3' test.out

#- 56 DeleteUserRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard deleteUserRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nbdSJtjX7ZshZyZl' \
    --leaderboardCode '5x4bRXBHUTrDzZSK,scfOcYu3dpCROYqU,iGKXVFCmpo6sPwVO' \
    > test.out 2>&1
eval_tap $? 56 'DeleteUserRankingsAdminV3' test.out

#- 57 GetUserLeaderboardRankingsAdminV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserLeaderboardRankingsAdminV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EDSJsEK5QpNhlI2i' \
    --limit '91' \
    --offset '31' \
    --previousVersion '63' \
    > test.out 2>&1
eval_tap $? 57 'GetUserLeaderboardRankingsAdminV3' test.out

#- 58 SetUserVisibilityV3
./ng net.accelbyte.sdk.cli.Main leaderboard setUserVisibilityV3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iIaTIKUkmkk9QM0N' \
    --body '{"visibility": true}' \
    > test.out 2>&1
eval_tap $? 58 'SetUserVisibilityV3' test.out

#- 59 GetLeaderboardConfigurationsPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationsPublicV3 \
    --namespace "$AB_NAMESPACE" \
    --isDeleted  \
    --limit '28' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 59 'GetLeaderboardConfigurationsPublicV3' test.out

#- 60 GetLeaderboardConfigurationPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getLeaderboardConfigurationPublicV3 \
    --leaderboardCode 'b76tFkEORV3bu1bN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetLeaderboardConfigurationPublicV3' test.out

#- 61 GetAllTimeLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getAllTimeLeaderboardRankingPublicV3 \
    --leaderboardCode 'CtX7W40V6Do5sYad' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 61 'GetAllTimeLeaderboardRankingPublicV3' test.out

#- 62 GetCurrentCycleLeaderboardRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getCurrentCycleLeaderboardRankingPublicV3 \
    --cycleId 'CFrHHC3DpZxkrQDX' \
    --leaderboardCode 'uNFviMarv8mnfHK8' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '97' \
    --previousVersion '59' \
    > test.out 2>&1
eval_tap $? 62 'GetCurrentCycleLeaderboardRankingPublicV3' test.out

#- 63 BulkGetUsersRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard bulkGetUsersRankingPublicV3 \
    --leaderboardCode 'd3DlhLuIpomM8sm1' \
    --namespace "$AB_NAMESPACE" \
    --previousVersion '79' \
    --body '{"userIds": ["uUccE536ugBp3HBv", "epnDCjgyJlXe36mg", "WjLfFmteue9nzJ6f"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetUsersRankingPublicV3' test.out

#- 64 GetUserRankingPublicV3
./ng net.accelbyte.sdk.cli.Main leaderboard getUserRankingPublicV3 \
    --leaderboardCode 'H24T805tVg8JqU0j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZpjvsugAOS7u8RiW' \
    --previousVersion '50' \
    > test.out 2>&1
eval_tap $? 64 'GetUserRankingPublicV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE