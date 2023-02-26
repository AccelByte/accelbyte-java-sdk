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
echo "1..44"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 QuerySeasons
./ng net.accelbyte.sdk.cli.Main seasonpass querySeasons \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '50' \
    --status 'DRAFT,PUBLISHED,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "7gipqV3l", "defaultRequiredExp": 82, "draftStoreId": "cRdv6I2J", "end": "1985-06-18T00:00:00Z", "excessStrategy": {"currency": "YX5UaCmd", "method": "CURRENCY", "percentPerExp": 18}, "images": [{"as": "TA278zNl", "caption": "t4xcACH4", "height": 100, "imageUrl": "4lcLH5j4", "smallImageUrl": "AMAL5xby", "width": 88}, {"as": "zRP7o9Tl", "caption": "PbZhc4s7", "height": 95, "imageUrl": "hXR6QDwT", "smallImageUrl": "7UQOiMds", "width": 89}, {"as": "Cq4dNaYX", "caption": "rmODch79", "height": 63, "imageUrl": "BtJCosU8", "smallImageUrl": "1RcFnE5u", "width": 80}], "localizations": {"OLmK58ZY": {"description": "gAXwdopR", "title": "kHqyfHDb"}, "W30RFREQ": {"description": "nLSetLKP", "title": "xo1qzV9K"}, "5zAaULwE": {"description": "lhGhFUl9", "title": "PU6021Ec"}}, "name": "KjT4aQBe", "start": "1995-05-22T00:00:00Z", "tierItemId": "FeQDhbZc"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateSeason' test.out

#- 4 GetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'GetCurrentSeason' test.out

#- 5 BulkGetUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass bulkGetUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["aXZejYnF", "wwNuOj6X", "utvw5uZP"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jiikA7mK' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vgPIiZ07' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wyp7wIEq' \
    --body '{"autoClaim": true, "defaultLanguage": "EHrWDNJV", "defaultRequiredExp": 50, "draftStoreId": "mXHF65v9", "end": "1971-11-08T00:00:00Z", "excessStrategy": {"currency": "OYOwhfzq", "method": "CURRENCY", "percentPerExp": 44}, "images": [{"as": "HRjpTcWX", "caption": "Sk7MmByY", "height": 75, "imageUrl": "QqhOtj20", "smallImageUrl": "g0mgn8aN", "width": 62}, {"as": "DTjDx8su", "caption": "Yw7hPHBH", "height": 94, "imageUrl": "O9xpD8aA", "smallImageUrl": "BjfJkarW", "width": 51}, {"as": "9pzVMzyS", "caption": "AX8YbvbW", "height": 37, "imageUrl": "OJstyBpG", "smallImageUrl": "wa8wQdTq", "width": 3}], "localizations": {"OPDK1GVm": {"description": "SSV4h2NC", "title": "PhSXSR6s"}, "Slyz8KAg": {"description": "L53zn5Hs", "title": "FKEwkgYn"}, "6zDxtQCV": {"description": "xUczSRcW", "title": "BUPKFZZG"}}, "name": "yicCsFvv", "start": "1997-02-23T00:00:00Z", "tierItemId": "boFL649Q"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tg4aMdzJ' \
    --body '{"end": "1971-06-19T00:00:00Z", "name": "dqlzkB4R", "start": "1995-05-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5ItVt6bs' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BKNZqQCE' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2jIfZjIg' \
    --body '{"autoEnroll": false, "code": "rlrTjJax", "displayOrder": 85, "images": [{"as": "P7t3CkBx", "caption": "Y5LWLiZT", "height": 30, "imageUrl": "ClDahHcD", "smallImageUrl": "Qbzc3Uxo", "width": 28}, {"as": "2OINkhNj", "caption": "ROMdFq1X", "height": 24, "imageUrl": "iRoNmt9K", "smallImageUrl": "yPFYC3R6", "width": 75}, {"as": "X4OsAUSP", "caption": "0hQ6excE", "height": 96, "imageUrl": "AvFUlv8U", "smallImageUrl": "Bc1xnvGq", "width": 27}], "localizations": {"yjEbGY4c": {"description": "KRe0S3nw", "title": "5zIxEdvN"}, "TkQ5j8XC": {"description": "GuORXo0e", "title": "qnM1pUUO"}, "3QVtUvs2": {"description": "PnNtY3rs", "title": "EdVw4gtT"}}, "passItemId": "H0B2DAz1"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'pfFkb7oF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vbyyJic7' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'SJbAduF8' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zyhfrGL7' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'YmAJg3xF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'd0KAWhxY' \
    --body '{"autoEnroll": true, "displayOrder": 4, "images": [{"as": "bsLj57B3", "caption": "x9Wl3vTo", "height": 55, "imageUrl": "VJ35MILh", "smallImageUrl": "nIUKCrOy", "width": 38}, {"as": "vYXXeXJS", "caption": "guKe8lGQ", "height": 38, "imageUrl": "1ofsz6IR", "smallImageUrl": "QoI13tEn", "width": 55}, {"as": "pEiAjvsJ", "caption": "TWrbOprq", "height": 46, "imageUrl": "U6KzsmEj", "smallImageUrl": "TG3ThLsR", "width": 76}], "localizations": {"uZ6ki3CM": {"description": "y1Ls3MBr", "title": "MkI45hxn"}, "bvYktMEK": {"description": "PXDntOwD", "title": "no6umN7M"}, "ATJjhCxW": {"description": "rsLM8Zqz", "title": "SzyGqGIk"}}, "passItemId": "mbEeFlXr"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'm6mP6TqZ' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FINXcy4K' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'g69GQe1l' \
    --q 'mCLD8EXM' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vnZ2MZRW' \
    --body '{"code": "F8tcqvNy", "currency": {"currencyCode": "8UEdngAZ", "namespace": "VjuCbhnh"}, "image": {"as": "8rkIzba3", "caption": "QSUdTGu5", "height": 30, "imageUrl": "OidwklWl", "smallImageUrl": "JhbJUrf7", "width": 19}, "itemId": "jJmKWZE8", "quantity": 39, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'LdfZkdVl' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nnCZR1qy' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '7M75bl9m' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0HhVtNnQ' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'xLrFv6yT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'anN5UBRX' \
    --body '{"currency": {"currencyCode": "P5L06QR6", "namespace": "Cqt2QbJB"}, "image": {"as": "ZlucS9Xz", "caption": "Sq0nJJhZ", "height": 82, "imageUrl": "x8u9koVk", "smallImageUrl": "0m5nV4fB", "width": 48}, "itemId": "cV38zrXa", "nullFields": ["YB87Eu1C", "GMQIrmMA", "EHfUfHY3"], "quantity": 89, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ejveLjL4' \
    --limit '68' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bPt5uCVC' \
    --body '{"index": 0, "quantity": 48, "tier": {"requiredExp": 51, "rewards": {"agmOJBHJ": ["dzZNEyBZ", "IbSuEVZw", "CbfWkzI9"], "eEqPHhQS": ["bDdpisoW", "CJ1zJO8y", "e58DOBBl"], "pZvYc6Ks": ["mANA4q8K", "oWKHSFCv", "SudPr7ks"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'BhZlUcXA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A5TdDBe6' \
    --body '{"requiredExp": 99, "rewards": {"CRBCFEqp": ["zOQYeVF5", "xH7ErlNq", "IhT1Rg8o"], "G6xHV9lH": ["Vu8CQcrX", "3JRTyvam", "oKhDmW2M"], "0DHIkJBv": ["mSeFovV2", "fqB734j6", "L3URMzGG"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'nLXmzST7' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KAQFaCAd' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'LvJMBSOi' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2PZomYq4' \
    --body '{"newIndex": 59}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UaWPLPJZ' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJiZFnPc' \
    --limit '36' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'GFS83khF' \
    --body '{"exp": 54, "source": "SWEAT", "tags": ["CzfPmyWQ", "TxZTOQuv", "25TFitvw"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'qyCfjQBc' \
    --body '{"passCode": "y6xJB1Nh", "passItemId": "1j0PePXW"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bta8grs8' \
    --passCodes '1UGyWcY2,4WmSIjFu,QT0vN6pH' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'aogTmjFD' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'zcVuyt8K' \
    --body '{"passItemId": "dibFjNZl", "tierItemCount": 3, "tierItemId": "xWh5tM48"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '6uZnPzcy' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '3JvvYfPY' \
    --body '{"count": 24, "source": "SWEAT", "tags": ["NvoIasyx", "4n3XXqcI", "DdKwTfVF"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YCBGuEMw' \
    --from 'sGXbBK2o' \
    --limit '39' \
    --offset '52' \
    --seasonId 'zY6qG4Mm' \
    --source 'SWEAT' \
    --tags 'f28NB6aA,DIdLyzOX,0Pk9y26p' \
    --to 'B4SZQHRX' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKzMNSco' \
    --seasonId 'Dpm5Isp8' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0njGhgaG' \
    --userId '9jhnAyFh' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'mpYD8M4g' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '1on3xb8n' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'O9LsVVWU' \
    --body '{"passCode": "Hnaj2FIl", "rewardCode": "Rluelkfs", "tierIndex": 50}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRPPvbL2' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Pp88njP9' \
    --userId 'XxEFsy1U' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE