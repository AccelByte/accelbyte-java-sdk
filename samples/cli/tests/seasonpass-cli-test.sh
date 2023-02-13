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
    --limit '7' \
    --offset '15' \
    --status 'PUBLISHED,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "BIZjy0xG", "defaultRequiredExp": 30, "draftStoreId": "L3QVWbOm", "end": "1996-12-14T00:00:00Z", "excessStrategy": {"currency": "sdX0ZUdW", "method": "CURRENCY", "percentPerExp": 15}, "images": [{"as": "3Ft0XRU0", "caption": "OXyfjfhd", "height": 55, "imageUrl": "v2SwZBTD", "smallImageUrl": "xpK4Mny7", "width": 77}, {"as": "KhXLZvRL", "caption": "61cnUff1", "height": 50, "imageUrl": "yx9KqVt5", "smallImageUrl": "Zfof7I2a", "width": 15}, {"as": "gqFv5rhG", "caption": "zjAXfCIr", "height": 1, "imageUrl": "bsXJQhXC", "smallImageUrl": "xxJrAAGp", "width": 53}], "localizations": {"f2m4CeVy": {"description": "Iqlt7Azs", "title": "n38bTLTL"}, "H6IfKH6J": {"description": "yUUerEeC", "title": "yL9Xjn36"}, "mo4rJasx": {"description": "ii0ugTWD", "title": "nYCm2KoE"}}, "name": "9NnFLJXT", "start": "1998-07-20T00:00:00Z", "tierItemId": "pTkyNCKf"}' \
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
    --body '{"userIds": ["RnGjP0L0", "KwUS12Cy", "nao27CE7"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RBi20W4R' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Burur7jV' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WYAxocfk' \
    --body '{"autoClaim": true, "defaultLanguage": "2jiog2mb", "defaultRequiredExp": 45, "draftStoreId": "jiXb1y8p", "end": "1971-10-25T00:00:00Z", "excessStrategy": {"currency": "EV0NXRxE", "method": "NONE", "percentPerExp": 2}, "images": [{"as": "OVi3rZGL", "caption": "LV5KNfX1", "height": 72, "imageUrl": "bJ8JhqAl", "smallImageUrl": "YRA6S6LQ", "width": 32}, {"as": "P9I4bPbH", "caption": "BN5wkIhK", "height": 45, "imageUrl": "ZemOeW3v", "smallImageUrl": "Q5MF9Ajw", "width": 79}, {"as": "REuzoNTi", "caption": "uvUdZFid", "height": 70, "imageUrl": "vUoJnyB8", "smallImageUrl": "NFd2F2Bh", "width": 99}], "localizations": {"OT5wIdrR": {"description": "hRqsUBre", "title": "pmQyq3IV"}, "9TMUlfmN": {"description": "H3xlXfWu", "title": "1WfNrWQN"}, "pg9WdUaZ": {"description": "7Tfrte1V", "title": "YWavFWKO"}}, "name": "Y7SWMG2L", "start": "1973-06-22T00:00:00Z", "tierItemId": "ZagZEDQV"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wSoT1t4e' \
    --body '{"end": "1983-07-18T00:00:00Z", "name": "exf00w64", "start": "1975-01-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8Ngi2n8b' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Rxguzwzi' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pnNmaNWi' \
    --body '{"autoEnroll": false, "code": "rvGLHq5a", "displayOrder": 34, "images": [{"as": "buxCjjdZ", "caption": "tfgHlnCQ", "height": 56, "imageUrl": "8UTGPDQH", "smallImageUrl": "tsEf12fm", "width": 76}, {"as": "bN35vzaV", "caption": "4ei4t2sQ", "height": 56, "imageUrl": "IFtbg5Qw", "smallImageUrl": "cTfKZL6g", "width": 80}, {"as": "ivvvT5oj", "caption": "Bal5YTE2", "height": 87, "imageUrl": "nekbMpPt", "smallImageUrl": "86eoGgbO", "width": 19}], "localizations": {"vzdEa6sh": {"description": "2zzgm18D", "title": "55RUYiyJ"}, "oA5K0AKd": {"description": "LTa18A6W", "title": "cxKMD9Bn"}, "JbC9MHtA": {"description": "JZ7Yp1dP", "title": "72EdbRQd"}}, "passItemId": "wcWywAAk"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'Lf6hu7y3' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ROQWWUOl' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'nuJV0qVM' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GgvF3uGy' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'VigKxidB' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ktjJcQks' \
    --body '{"autoEnroll": true, "displayOrder": 66, "images": [{"as": "bmv1MulN", "caption": "29PILNot", "height": 47, "imageUrl": "mhZoe6Dr", "smallImageUrl": "LxOdGh7l", "width": 47}, {"as": "QtsnZOrF", "caption": "ytsIe8yA", "height": 92, "imageUrl": "dgfhvMWt", "smallImageUrl": "vWn1hgJn", "width": 94}, {"as": "OlnJJDGd", "caption": "vWhvsYqP", "height": 9, "imageUrl": "WuWkXjcL", "smallImageUrl": "yy6am28n", "width": 38}], "localizations": {"FfjKYXTm": {"description": "4eP2N1D5", "title": "lu9LVdUl"}, "CH1p7bG8": {"description": "AD8mTwhD", "title": "fOqEFehg"}, "zXIbkDUs": {"description": "jDlhIvP8", "title": "uKPCPOlL"}}, "passItemId": "kASIXaJt"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ASFMU8fz' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'W39ziSpR' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Vy3hTmub' \
    --q 'l0iVFYdD' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iBmMjg9y' \
    --body '{"code": "Bxwjnrhf", "currency": {"currencyCode": "k5KBLYVp", "namespace": "GaZMi2Se"}, "image": {"as": "asnEggzC", "caption": "DjH06TAT", "height": 97, "imageUrl": "sC1ads46", "smallImageUrl": "brxwjpyv", "width": 30}, "itemId": "jlOGycLx", "quantity": 19, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '4SJGNgQo' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'd4LpcWkD' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'qV6t8r1n' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'prAPwdg1' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'SDdwNpNA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yF8EyH0P' \
    --body '{"currency": {"currencyCode": "Oi9EXJEY", "namespace": "P5jKPziY"}, "image": {"as": "2rdY87Cq", "caption": "tCmQfblz", "height": 27, "imageUrl": "dMiACC72", "smallImageUrl": "x55NECek", "width": 23}, "itemId": "MbU0679v", "nullFields": ["A7uPw6wp", "WngVutBG", "AYRoR98a"], "quantity": 31, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rKkD9Bbw' \
    --limit '48' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WljB9K4W' \
    --body '{"index": 23, "quantity": 53, "tier": {"requiredExp": 54, "rewards": {"GsJKQNhW": ["w6bTW4MJ", "l1QsSJ9M", "ClBocDs8"], "rPpa58mk": ["ZNjasPaT", "nAB3SbXM", "sKzPY1fE"], "Nr3T40Af": ["f9ZaaK9D", "J6tu50sR", "Fu2ABARN"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'UhT5xacY' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hJ1OUEMq' \
    --body '{"requiredExp": 40, "rewards": {"bunQ07S9": ["ZxNJEQ4u", "xd0dY05e", "hX5GRhUs"], "S8Ugr445": ["oeTDniKt", "AP3bGEtT", "UbtXezZi"], "3SVp1rVM": ["G3Ev1LPK", "pi569AcO", "yfiLVvd7"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'r9rHv7JI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9gNtiDKS' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '7ZCGRI6c' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IO0fVj5V' \
    --body '{"newIndex": 40}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0IT1sAqe' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnCuVJrI' \
    --limit '19' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '05wLEgIe' \
    --body '{"exp": 89, "source": "PAID_FOR", "tags": ["cmkLE3e1", "gg7StIqr", "RQoHQtG5"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'qT32OPAb' \
    --body '{"passCode": "jXhJwvIH", "passItemId": "QbGlJLyR"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'wtlg3AJo' \
    --passCodes 'TWHYILFt,8GnGIvxD,4OAPK5Hy' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRSTt5HM' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '18Es1Zis' \
    --body '{"passItemId": "lBjxDCiQ", "tierItemCount": 86, "tierItemId": "7peKYLmo"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'ITwYYmI7' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'n9WIkwjO' \
    --body '{"count": 80, "source": "PAID_FOR", "tags": ["Mcy2Za0c", "zWjCrKZn", "Er8Xupz8"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLJLzFbL' \
    --from 'TWzmtSza' \
    --limit '2' \
    --offset '38' \
    --seasonId 'yLzVbJj7' \
    --source 'PAID_FOR' \
    --tags 'iAWt2pGG,Idjkmt0d,D304NeGv' \
    --to 'Xwd5iqVU' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'qvQdBVt7' \
    --seasonId 'e5Cz2rtY' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3RcrZpba' \
    --userId 'iHbn9OAV' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '3ThAWOwU' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'TsQGpvh7' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'DO4xNR65' \
    --body '{"passCode": "SoJIETJJ", "rewardCode": "hjZydBdH", "tierIndex": 64}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'X3IqO2ci' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6VqeGfBY' \
    --userId '2iPBVQDZ' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE