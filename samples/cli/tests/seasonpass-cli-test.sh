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
    --limit '40' \
    --offset '55' \
    --status 'RETIRED,PUBLISHED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "ylT1pCqu", "defaultRequiredExp": 14, "draftStoreId": "ABjiN1Sv", "end": "1975-04-12T00:00:00Z", "excessStrategy": {"currency": "UjyHkFZk", "method": "NONE", "percentPerExp": 86}, "images": [{"as": "HylnMvSc", "caption": "vRFl4r8E", "height": 23, "imageUrl": "lmwXaTvt", "smallImageUrl": "DVJhlI6X", "width": 10}, {"as": "0sF2j0ir", "caption": "s9s4uVJp", "height": 84, "imageUrl": "BUNvHqP6", "smallImageUrl": "RnBxpPmq", "width": 53}, {"as": "h5xqKNI5", "caption": "Y1YhO2YM", "height": 19, "imageUrl": "TNDQFG1Z", "smallImageUrl": "E5qauIXh", "width": 14}], "localizations": {"vgAlUhIX": {"description": "KLmezH9R", "title": "ZY585RSi"}, "rH4VIT51": {"description": "auaVLpZY", "title": "E26f1PYR"}, "U6FxMCOp": {"description": "LKrBSqbT", "title": "WHvSdRWx"}}, "name": "YlM5YptO", "start": "1974-09-03T00:00:00Z", "tierItemId": "v21kZDSL"}' \
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
    --body '{"userIds": ["1uhlQveV", "z9wylRSe", "ffkPj1OJ"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Pn6tsId6' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NbX7GToA' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8Tf7FoNp' \
    --body '{"autoClaim": false, "defaultLanguage": "N0FvlIX8", "defaultRequiredExp": 49, "draftStoreId": "lzyfypco", "end": "1971-03-06T00:00:00Z", "excessStrategy": {"currency": "2lyUzIUd", "method": "CURRENCY", "percentPerExp": 1}, "images": [{"as": "BiUxLcR7", "caption": "yu1XN5Kl", "height": 26, "imageUrl": "nx6IAPJv", "smallImageUrl": "DRnn0CeW", "width": 38}, {"as": "Jz6285Af", "caption": "fpuDmJY8", "height": 27, "imageUrl": "0UDg6jbm", "smallImageUrl": "R5WlUA40", "width": 20}, {"as": "uPmskWBm", "caption": "OVonqyU5", "height": 50, "imageUrl": "JchDLVuB", "smallImageUrl": "7G0aTn76", "width": 11}], "localizations": {"W4IXzGJa": {"description": "Sj2VOWmh", "title": "Cy5vbmnn"}, "hsZJtCXi": {"description": "jKuRUNXJ", "title": "JhOHoRXN"}, "NnrnWYZx": {"description": "f0YYVjb3", "title": "ROBEGgsY"}}, "name": "aM5Uj3Zt", "start": "1974-03-12T00:00:00Z", "tierItemId": "To91tFNw"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eiu4Peow' \
    --body '{"end": "1978-05-03T00:00:00Z", "name": "ExDXB0LG", "start": "1984-05-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4UoiysJj' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 't6BEDGwM' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uO25s8o3' \
    --body '{"autoEnroll": true, "code": "9BphdmuP", "displayOrder": 33, "images": [{"as": "7JvbmeBR", "caption": "dKMWu2He", "height": 23, "imageUrl": "Iq50S3X9", "smallImageUrl": "thLIU7sh", "width": 33}, {"as": "0eJAEUmR", "caption": "1tIiFkJT", "height": 84, "imageUrl": "vJTUBhAN", "smallImageUrl": "MtxU97vS", "width": 44}, {"as": "1Qy3tk9d", "caption": "IxbG0aDM", "height": 30, "imageUrl": "PSQV0wUp", "smallImageUrl": "00IMTmZc", "width": 71}], "localizations": {"7kDCCOPd": {"description": "KCyI6oK2", "title": "F7m2BCLB"}, "zS6RDLVB": {"description": "dA6po2BI", "title": "YqWT3vgt"}, "KEjWf2d6": {"description": "fu3DO5ts", "title": "Y8n1B0xe"}}, "passItemId": "9fSSAxjF"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'mmSpPMe7' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3hO4QMFE' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'fFiwFWP1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aiy7bqTa' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'bd0aS5yb' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'X6tpjueg' \
    --body '{"autoEnroll": false, "displayOrder": 29, "images": [{"as": "39fjgMaO", "caption": "Ur76lG7k", "height": 86, "imageUrl": "D7VAK6Q5", "smallImageUrl": "IgW0KxsW", "width": 97}, {"as": "mE3h1uq0", "caption": "Urc2JNMJ", "height": 1, "imageUrl": "LziyApnv", "smallImageUrl": "YVLl1KnH", "width": 88}, {"as": "j6tjXjuq", "caption": "agzAO5vv", "height": 36, "imageUrl": "reTnf1KN", "smallImageUrl": "1jhpx21g", "width": 47}], "localizations": {"S38hIULu": {"description": "8T2sdV29", "title": "bdcFz7Fc"}, "cQegyanf": {"description": "KiNMNMvU", "title": "RKCWmg1N"}, "D7hS7jni": {"description": "auSujL4A", "title": "Sq4GVrnm"}}, "passItemId": "pCpfvJ90"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6JOe0CDH' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'i4T1oJHa' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'skANocCK' \
    --q '7LexO8yk' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2HIHeX2B' \
    --body '{"code": "m0vkPh4q", "currency": {"currencyCode": "G1B1ORJ1", "namespace": "4tDNgJsa"}, "image": {"as": "AHYHDEZu", "caption": "2YJj84s0", "height": 59, "imageUrl": "zuiveL9o", "smallImageUrl": "QN4f8a6Y", "width": 70}, "itemId": "6T7KxDGL", "quantity": 25, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '5gAxqF2o' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KBLsrK0q' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Y5gc2iqV' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '748wBlwQ' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'dBfszWlk' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3Oha6OZq' \
    --body '{"currency": {"currencyCode": "7PIArydD", "namespace": "YyOzWf9D"}, "image": {"as": "fK4mkOle", "caption": "L1LMe3od", "height": 41, "imageUrl": "TKJoiec2", "smallImageUrl": "GKitLeMj", "width": 8}, "itemId": "aBPEg6rV", "nullFields": ["FVJAu1JR", "1UITewTl", "B8PNF4r8"], "quantity": 47, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bCmLVuDd' \
    --limit '81' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aEHoTvP0' \
    --body '{"index": 91, "quantity": 22, "tier": {"requiredExp": 7, "rewards": {"t3PwkAIy": ["PidiTuwS", "P3cEsPc2", "VvsNvHJj"], "s1gbrKm6": ["MvxZZK5N", "DvhbW6LR", "G9cYJojF"], "s3KTvbIg": ["zr9LGEl5", "JfceJygh", "fTqGRtly"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'vv32ngiS' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yEJ65Pwn' \
    --body '{"requiredExp": 11, "rewards": {"acmLfg6w": ["9ewKCNAF", "KAekSxXY", "wZFtaPtJ"], "phPCtKLb": ["51JO9wgE", "Rylgmset", "bIE0kGx7"], "LxGXTzG1": ["u43kUpEe", "PGA4MvvY", "CVwTscIF"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'rOS0KK7O' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cvGr38v8' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'R6sitDwN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'I4jLitr5' \
    --body '{"newIndex": 51}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lwqCKCnn' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'BMJOGLBG' \
    --limit '21' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '8nxQuzJm' \
    --body '{"exp": 0, "source": "SWEAT", "tags": ["aqiHqpVe", "2a0sY0sh", "YZiHDXzW"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'FOjM90Xb' \
    --body '{"passCode": "hMjPO3Nx", "passItemId": "dDRajxD4"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'RJULqiKe' \
    --passCodes 'CbDX80oQ,GGcs1lec,Ql7NAo0L' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'vn9TJDb1' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'llKFuOmn' \
    --body '{"passItemId": "Lkb1Va9P", "tierItemCount": 76, "tierItemId": "8lmAJpH5"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'pwcvdeMa' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'JaP114E4' \
    --body '{"count": 37, "source": "PAID_FOR", "tags": ["VSTGCwFf", "BgUyoj4S", "pbwJDCeY"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'UeNNLTpV' \
    --from '0WtMPmes' \
    --limit '86' \
    --offset '3' \
    --seasonId 'WqVCVXdq' \
    --source 'SWEAT' \
    --tags 'RUqS55XW,KNsnM0To,ghwKjoj9' \
    --to 'MAsEGIjQ' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '7inYIJuY' \
    --seasonId 'EFSZCE5Z' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7oK0Fuug' \
    --userId 'S0VIgQ6p' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '9gnq7sRY' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'M7JKv7GC' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'ebrGH2dC' \
    --body '{"passCode": "2MI13Ytb", "rewardCode": "XiWZJvbF", "tierIndex": 89}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'JrwI83Ei' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'efWoV3E5' \
    --userId 'ire479qt' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE