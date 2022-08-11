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
echo "1..42"

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
    --limit '30' \
    --offset '85' \
    --status 'PUBLISHED,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "8FhsmN7t", "defaultRequiredExp": 90, "draftStoreId": "njjY48wU", "end": "1986-04-09T00:00:00Z", "excessStrategy": {"currency": "1i5uHLSx", "method": "NONE", "percentPerExp": 31}, "images": [{"as": "uLNIptsr", "caption": "dfnHLo8v", "height": 7, "imageUrl": "GQ7U0bVK", "smallImageUrl": "YUAsxJDo", "width": 2}, {"as": "Wv1YRwNO", "caption": "HMtCv1Cd", "height": 88, "imageUrl": "Np17S1KV", "smallImageUrl": "rzjYzQEp", "width": 32}, {"as": "bo7KrtSi", "caption": "1tj1os8J", "height": 60, "imageUrl": "l0ih7GJ2", "smallImageUrl": "FtfuIwXp", "width": 25}], "localizations": {"3S2EZGyo": {"description": "xPC4HXad", "title": "ZyqFxUUN"}, "vuopM9MK": {"description": "yFl3aYlW", "title": "jfETsjKV"}, "lQ7l9Q1B": {"description": "ulra3MDf", "title": "yBfg2xQV"}}, "name": "BA6TZl2K", "start": "1985-05-08T00:00:00Z", "tierItemId": "eAHSsejm"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateSeason' test.out

#- 4 GetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'GetCurrentSeason' test.out

#- 5 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZTDqU0rl' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MaphmC5u' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8w0FB7TY' \
    --body '{"autoClaim": true, "defaultLanguage": "xWKyQMCT", "defaultRequiredExp": 89, "draftStoreId": "oSIp2QmJ", "end": "1991-01-06T00:00:00Z", "excessStrategy": {"currency": "p5AXcQDA", "method": "CURRENCY", "percentPerExp": 35}, "images": [{"as": "Kx8qBcnz", "caption": "9amgZ7FE", "height": 97, "imageUrl": "OetLVUVG", "smallImageUrl": "xI5Spx0e", "width": 65}, {"as": "tbCyJRZz", "caption": "4cDo4tQC", "height": 96, "imageUrl": "AyPf9E5C", "smallImageUrl": "i8qKoTK1", "width": 3}, {"as": "UVZKJwuX", "caption": "8duG3Rwk", "height": 32, "imageUrl": "vkRfv1Cm", "smallImageUrl": "KSO2XJKK", "width": 24}], "localizations": {"lA9MxLDL": {"description": "my05KVOc", "title": "nSbaETor"}, "cEx8QmHZ": {"description": "RqE4NyKb", "title": "vsswNPZl"}, "vuCPXzSN": {"description": "Bz5taqPX", "title": "cZFoYJJ4"}}, "name": "gKP8q2Ez", "start": "1998-01-28T00:00:00Z", "tierItemId": "tABwQHqG"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ULbNK3t4' \
    --body '{"end": "1981-05-17T00:00:00Z", "name": "lt0YOWdh", "start": "1987-04-18T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UZM6SdCr' \
    > test.out 2>&1
eval_tap $? 9 'QueryPasses' test.out

#- 10 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PgWiuFv2' \
    --body '{"autoEnroll": true, "code": "pJ3kzNpS", "displayOrder": 68, "images": [{"as": "kzBBMtfz", "caption": "WZ5GlTKQ", "height": 45, "imageUrl": "axst0MT7", "smallImageUrl": "XFAtXP5u", "width": 91}, {"as": "LGoRrTdL", "caption": "7dmweq3B", "height": 94, "imageUrl": "7G6ARGmm", "smallImageUrl": "EGJLQfGT", "width": 3}, {"as": "yGkoRqaB", "caption": "VnYmlGEg", "height": 39, "imageUrl": "113yd8HZ", "smallImageUrl": "3jzIDj4O", "width": 54}], "localizations": {"60Kl0nM7": {"description": "PyyevyPr", "title": "g4BIqf8p"}, "6qdYb0oF": {"description": "TkabDb28", "title": "T4SnaSqR"}, "zvpbHjPs": {"description": "MagSNHc9", "title": "i4HibgzA"}}, "passItemId": "LGEpTGyY"}' \
    > test.out 2>&1
eval_tap $? 10 'CreatePass' test.out

#- 11 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'h84A2sHR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ppuz7Y1O' \
    > test.out 2>&1
eval_tap $? 11 'GetPass' test.out

#- 12 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'HllteZ9m' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AC5F5USV' \
    > test.out 2>&1
eval_tap $? 12 'DeletePass' test.out

#- 13 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'ks0EdvhE' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xFNc3XKo' \
    --body '{"autoEnroll": true, "displayOrder": 76, "images": [{"as": "a1zL09y6", "caption": "IldqULwZ", "height": 77, "imageUrl": "M3C7Yx1t", "smallImageUrl": "9KhXMXHT", "width": 10}, {"as": "bpXmcaJ1", "caption": "WkORbp21", "height": 86, "imageUrl": "xAqG9IFV", "smallImageUrl": "6E7BK6Sz", "width": 78}, {"as": "KJVLJacm", "caption": "pvdoD1yp", "height": 68, "imageUrl": "POtZOpTD", "smallImageUrl": "YdqvAkYN", "width": 97}], "localizations": {"NO1rRpQK": {"description": "eFwhEKwA", "title": "8WN2hZG5"}, "hVocO9u3": {"description": "P6lXjz0c", "title": "eS7l40F0"}, "HlzZQXvx": {"description": "NUv9xEyQ", "title": "fpeJCObe"}}, "passItemId": "VX1bTXet"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePass' test.out

#- 14 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LYYAlqv7' \
    > test.out 2>&1
eval_tap $? 14 'PublishSeason' test.out

#- 15 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZXqyBmL7' \
    --force  \
    > test.out 2>&1
eval_tap $? 15 'RetireSeason' test.out

#- 16 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ocY8zUUN' \
    --q 'GcQbub7t' \
    > test.out 2>&1
eval_tap $? 16 'QueryRewards' test.out

#- 17 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hZoit5Lj' \
    --body '{"code": "FZxl73Uy", "currency": {"currencyCode": "wDpm9LRB", "namespace": "6NUEBw4j"}, "image": {"as": "T8VREwOL", "caption": "DQ4TP8wp", "height": 74, "imageUrl": "ajzBs9xy", "smallImageUrl": "sIAkjC9d", "width": 84}, "itemId": "YVlE3C9Q", "quantity": 88, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateReward' test.out

#- 18 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'SDhMeB4n' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'S6Blo4aq' \
    > test.out 2>&1
eval_tap $? 18 'GetReward' test.out

#- 19 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '53NSu2fr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qmZ54Tij' \
    > test.out 2>&1
eval_tap $? 19 'DeleteReward' test.out

#- 20 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'I98OuwnK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EG0eLXGH' \
    --body '{"currency": {"currencyCode": "fTo7XiZD", "namespace": "QNmhO043"}, "image": {"as": "SmEs9IJq", "caption": "o7LQpXtZ", "height": 49, "imageUrl": "Y3RymMsq", "smallImageUrl": "3lhcWgQM", "width": 56}, "itemId": "nKyM4Wtl", "nullFields": ["zyJJYGVB", "JnAcOpRg", "rLiTn4GY"], "quantity": 99, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateReward' test.out

#- 21 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oCNag8cw' \
    --limit '84' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 21 'QueryTiers' test.out

#- 22 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'y0Y7Gf27' \
    --body '{"index": 89, "quantity": 65, "tier": {"requiredExp": 62, "rewards": {"xLVgztWF": ["iOx88jLd", "ONN8OqX3", "Ig3TiJVc"], "r4wNBcFR": ["iIWgzlvk", "EJ8c1g1Z", "dhuD93nQ"], "XZgxbB6j": ["tHEqRR1g", "3XzjZVgE", "De7bARJt"]}}}' \
    > test.out 2>&1
eval_tap $? 22 'CreateTier' test.out

#- 23 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '37WwCVVn' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3gw4TfQy' \
    --body '{"requiredExp": 24, "rewards": {"aFbxstjG": ["l8elYMhg", "sAQVdeqU", "zJoIqnrE"], "04HgrOsy": ["MsR4kgdE", "o1ndMqNy", "pKNaNP8q"], "GLqTADpL": ["wW1cwkhv", "FbF4bmPu", "go7le53s"]}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateTier' test.out

#- 24 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'Qq5LBZ0W' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fnKKNtSt' \
    > test.out 2>&1
eval_tap $? 24 'DeleteTier' test.out

#- 25 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'cuiLrqgh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9hkfVom7' \
    --body '{"newIndex": 47}' \
    > test.out 2>&1
eval_tap $? 25 'ReorderTier' test.out

#- 26 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HkIENWOY' \
    --force  \
    > test.out 2>&1
eval_tap $? 26 'UnpublishSeason' test.out

#- 27 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'xPVK05yb' \
    --limit '15' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 27 'GetUserParticipatedSeasons' test.out

#- 28 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'Om7UC04d' \
    --body '{"exp": 58, "source": "SWEAT", "tags": ["VUsHvxcd", "qlQxto0y", "Wdwj722J"]}' \
    > test.out 2>&1
eval_tap $? 28 'GrantUserExp' test.out

#- 29 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '3Zpz0W01' \
    --body '{"passCode": "7B2xLGMr", "passItemId": "mHSgP5mM"}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserPass' test.out

#- 30 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'RGe7tqQo' \
    --passCodes 'hOMYVxuZ,noD3NiNh,5InoyEdP' \
    > test.out 2>&1
eval_tap $? 30 'ExistsAnyPassByPassCodes' test.out

#- 31 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 't5YE7FpJ' \
    > test.out 2>&1
eval_tap $? 31 'GetCurrentUserSeasonProgression' test.out

#- 32 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'BPeCi0o8' \
    --body '{"passItemId": "6ygGN5j6", "tierItemCount": 50, "tierItemId": "kULu9ljO"}' \
    > test.out 2>&1
eval_tap $? 32 'CheckSeasonPurchasable' test.out

#- 33 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'buFel9iT' \
    > test.out 2>&1
eval_tap $? 33 'ResetUserSeason' test.out

#- 34 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'KaQtfVng' \
    --body '{"count": 52, "source": "PAID_FOR", "tags": ["P1KScbFb", "d0Ljj2Nv", "AcGxJMi7"]}' \
    > test.out 2>&1
eval_tap $? 34 'GrantUserTier' test.out

#- 35 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'MDnjqgEb' \
    --from 'HNqUF8t4' \
    --limit '38' \
    --offset '16' \
    --seasonId 'KOLfqBIC' \
    --source 'PAID_FOR' \
    --tags 'qnSC8ls9,N1FWXtY0,nYFqTiNc' \
    --to 'KFTonjrv' \
    > test.out 2>&1
eval_tap $? 35 'QueryUserExpGrantHistory' test.out

#- 36 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'f2fUEmLk' \
    --seasonId 'pOYvquHp' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistoryTag' test.out

#- 37 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZdicbHT7' \
    --userId 'soxEYG3n' \
    > test.out 2>&1
eval_tap $? 37 'GetUserSeason' test.out

#- 38 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'FGPOfW0Q' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetCurrentSeason' test.out

#- 39 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'gp9480pX' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentUserSeason' test.out

#- 40 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'wEJ5PzEJ' \
    --body '{"passCode": "uETQOgIX", "rewardCode": "Kblre99F", "tierIndex": 80}' \
    > test.out 2>&1
eval_tap $? 40 'PublicClaimUserReward' test.out

#- 41 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '1Brpdpv9' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkClaimUserRewards' test.out

#- 42 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'g5lIcdek' \
    --userId '2JdbZHWI' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE