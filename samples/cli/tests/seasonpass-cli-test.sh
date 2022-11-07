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
    --limit '11' \
    --offset '91' \
    --status 'DRAFT,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "7gqfmM79", "defaultRequiredExp": 31, "draftStoreId": "0PmGi5j8", "end": "1979-04-10T00:00:00Z", "excessStrategy": {"currency": "zZFmzfQv", "method": "CURRENCY", "percentPerExp": 58}, "images": [{"as": "FHgUVRDg", "caption": "H0GhJmZl", "height": 67, "imageUrl": "tevn7ol2", "smallImageUrl": "rkzqNSfs", "width": 35}, {"as": "YfygjfMq", "caption": "Ja16I3ZB", "height": 87, "imageUrl": "TPbRGw5T", "smallImageUrl": "c2W1X8tt", "width": 11}, {"as": "Zv6XWvky", "caption": "eCcdwVgI", "height": 99, "imageUrl": "SSrdRXRW", "smallImageUrl": "YSes6BgD", "width": 66}], "localizations": {"i2n4lrFh": {"description": "6jdtVSOc", "title": "UbNbzzL0"}, "1lSrLgo7": {"description": "NKWwaBk8", "title": "MeeD6Y8b"}, "7RaUMRRb": {"description": "IM5Uydgp", "title": "jyfKcmP3"}}, "name": "D95OhqDu", "start": "1984-09-21T00:00:00Z", "tierItemId": "HuKdG0sh"}' \
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
    --body '{"userIds": ["wlOraice", "SIgyCFTT", "qwtqfMnf"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MLWB5sgi' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'P0C9VTSN' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7Tr1z1qv' \
    --body '{"autoClaim": true, "defaultLanguage": "sOY5NVCp", "defaultRequiredExp": 39, "draftStoreId": "vVAry4NF", "end": "1974-06-30T00:00:00Z", "excessStrategy": {"currency": "lJJL0uO7", "method": "NONE", "percentPerExp": 59}, "images": [{"as": "ts1wppFv", "caption": "DaSB1a06", "height": 98, "imageUrl": "Afnm9mRQ", "smallImageUrl": "3fQ5O4kN", "width": 42}, {"as": "SH7SyUNx", "caption": "vzGgi51A", "height": 30, "imageUrl": "BVXF9Sp0", "smallImageUrl": "BxrcuFqB", "width": 6}, {"as": "OaMXBxbL", "caption": "5WOng6N4", "height": 40, "imageUrl": "ZSNZqbUH", "smallImageUrl": "cRVJDVj8", "width": 27}], "localizations": {"RSjjiz5p": {"description": "hjqpoi0L", "title": "Hv20DMGG"}, "hPVrZJjM": {"description": "MMYrRpyz", "title": "NCBSGzyJ"}, "NNYMedhq": {"description": "jf65Sudk", "title": "AsOinf7z"}}, "name": "rFY0tRvP", "start": "1980-08-06T00:00:00Z", "tierItemId": "VZLxuhgX"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'edsXwK4D' \
    --body '{"end": "1977-07-02T00:00:00Z", "name": "pGhYw00B", "start": "1973-07-25T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NGcLEuXu' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MqKR6Vzn' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Iv2tBSMQ' \
    --body '{"autoEnroll": false, "code": "HfpCLp2f", "displayOrder": 69, "images": [{"as": "Uxqli47A", "caption": "IJhLlMUU", "height": 5, "imageUrl": "Gnj7YL0Z", "smallImageUrl": "ARhxtVXj", "width": 23}, {"as": "vchC85Wg", "caption": "SUWVErZR", "height": 97, "imageUrl": "q8P6POAW", "smallImageUrl": "q9iXNN1J", "width": 77}, {"as": "RyU6ahUd", "caption": "3QGdk3R8", "height": 93, "imageUrl": "FvvPbNC6", "smallImageUrl": "XLihLu2O", "width": 89}], "localizations": {"8YjPIuzP": {"description": "MYR8ONRg", "title": "dGWWQEt7"}, "mdIjjBCI": {"description": "qoAy4v8m", "title": "bNrJKNUY"}, "fW9Xtetf": {"description": "R1E9F2s9", "title": "V6vGvSLk"}}, "passItemId": "XhO8Ahvh"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'FNyt6GF4' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nZnk8mJf' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'osi8wYw7' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UCZXdQ5X' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'qdZUfW8e' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DQCn4Qv9' \
    --body '{"autoEnroll": true, "displayOrder": 70, "images": [{"as": "owCLyLKN", "caption": "iwNOKcsv", "height": 59, "imageUrl": "ANzOzjiQ", "smallImageUrl": "O1fbXDYJ", "width": 85}, {"as": "QdCiLQDH", "caption": "dTr37BT7", "height": 45, "imageUrl": "WU2Ij5fg", "smallImageUrl": "q4S4TUpL", "width": 88}, {"as": "Wb9Bo68U", "caption": "PCS5sY2n", "height": 64, "imageUrl": "lJ0AXOb3", "smallImageUrl": "18AuY54v", "width": 83}], "localizations": {"Jf5sMWoq": {"description": "wptGvsjL", "title": "AsLmIuJM"}, "c9skMZQt": {"description": "13FosTld", "title": "SYyciiBP"}, "2lvKUXVN": {"description": "RNUcHtWa", "title": "rMrQHVOp"}}, "passItemId": "TOVTWHbk"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZwvoBymp' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JRsw8lLv' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KU3sVmDb' \
    --q 'aTs8Nr3d' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NQlo92Lj' \
    --body '{"code": "2Cr8n7Me", "currency": {"currencyCode": "nSHiQd25", "namespace": "xxPQkjX9"}, "image": {"as": "sKFN5IGv", "caption": "s2VZa1n8", "height": 2, "imageUrl": "LDnK1lYk", "smallImageUrl": "hVgToy6l", "width": 79}, "itemId": "tnChB0Dl", "quantity": 83, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'XggcjlVT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8BGlYZWS' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '3BaOCMzw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'x3txtsnL' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'TT9WAcUO' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'B4Th1pJo' \
    --body '{"currency": {"currencyCode": "uWzm1LS3", "namespace": "BM8uzGen"}, "image": {"as": "PAzjMSGF", "caption": "rIqBL0Yj", "height": 98, "imageUrl": "KjN9NYOp", "smallImageUrl": "eqjqAh8z", "width": 47}, "itemId": "uRQ99vjO", "nullFields": ["NJCW6L6e", "K9ve4EV6", "Glz6Vjsl"], "quantity": 82, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pkdtLZLT' \
    --limit '26' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '23QexBFP' \
    --body '{"index": 87, "quantity": 66, "tier": {"requiredExp": 12, "rewards": {"l3hyTwtt": ["yNb9qCpw", "a54DZxYH", "sRLg5Vt5"], "VysMFafd": ["fqXGgEQr", "6RvDTSLm", "v72Pvv4f"], "ogtCV3rp": ["abx0RWAW", "e0aKUKiC", "3Qqt5NaH"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 's4nj1a7C' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EiLrsB4E' \
    --body '{"requiredExp": 38, "rewards": {"mTyqtTBX": ["JUg4uevw", "NMkPp56t", "OHhQthem"], "kjgnrDke": ["SabzYXzx", "ewGZH8Oh", "tUksuiUb"], "k4mXHnsh": ["7aoArUmu", "OBPedhxp", "WtD0pwk7"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'DHy5EiFa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6JNR9JTT' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '5Et0npab' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'H214O1ix' \
    --body '{"newIndex": 38}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7CbtcUL2' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId '0ecXAP5G' \
    --limit '32' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '2WD5SOM7' \
    --body '{"exp": 98, "source": "PAID_FOR", "tags": ["S5dr8zfY", "8kfBjIza", "tQIBziLX"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '7uvI78ox' \
    --body '{"passCode": "G8c3Bm2y", "passItemId": "4k2jpWNL"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'GR85DlhW' \
    --passCodes 'ztLvv7aa,31Z0kANo,8Mm6IgRz' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'p7xdHQ11' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '5EJNzz0N' \
    --body '{"passItemId": "uuMilETR", "tierItemCount": 99, "tierItemId": "FutENaiu"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'jwlfISWG' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '53dimTAW' \
    --body '{"count": 7, "source": "SWEAT", "tags": ["ZsDzYqmn", "V0RdN971", "tNhnCcYc"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '1yQNgl0C' \
    --from 'l7SvqHnq' \
    --limit '13' \
    --offset '40' \
    --seasonId 'mKiXJmTV' \
    --source 'SWEAT' \
    --tags 'eG0BbWQ2,vETD60lu,UUBve7BP' \
    --to 'UJ5g3VJI' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'BmkQ67kX' \
    --seasonId 'DaMJFElT' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'E3IbG39K' \
    --userId 'hN8cfJFZ' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'CrAcac0J' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'C5OjBXbV' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'yNw3qLPT' \
    --body '{"passCode": "6U3ad98S", "rewardCode": "SKQyk0yn", "tierIndex": 42}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '6bNHfECE' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CrOe1DP7' \
    --userId 'coBHy48s' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE