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
echo "1..43"

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
    --limit '43' \
    --offset '77' \
    --status 'DRAFT,RETIRED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "Rwqk2I8U", "defaultRequiredExp": 6, "draftStoreId": "8HSEamuF", "end": "1998-06-04T00:00:00Z", "excessStrategy": {"currency": "QFxB4zMH", "method": "NONE", "percentPerExp": 77}, "images": [{"as": "lvNpIcb4", "caption": "Vt8jEmy0", "height": 53, "imageUrl": "YnTJPeVK", "smallImageUrl": "ZnEQetrE", "width": 99}, {"as": "QfEVjmBf", "caption": "Zi31PUbr", "height": 68, "imageUrl": "Co6UWpBC", "smallImageUrl": "UnZRE99R", "width": 11}, {"as": "XUswCQn7", "caption": "K2xpTjrj", "height": 18, "imageUrl": "TFEaqb12", "smallImageUrl": "Cvjw7p5L", "width": 72}], "localizations": {"EgSQp5JS": {"description": "2kzfSzTy", "title": "fcOCbEAQ"}, "2pFtL41L": {"description": "wIoDDzw4", "title": "i4KVoh1Q"}, "7G5xxArr": {"description": "1yZbnIMr", "title": "4QOYFsdP"}}, "name": "5ZeseyiS", "start": "1989-02-26T00:00:00Z", "tierItemId": "dJgABw2q"}' \
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
    --seasonId 'GSp4OyTy' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QfRfdmAV' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GQj7btE6' \
    --body '{"autoClaim": false, "defaultLanguage": "FyKxsIGR", "defaultRequiredExp": 95, "draftStoreId": "dHEsz52Q", "end": "1999-12-12T00:00:00Z", "excessStrategy": {"currency": "zOq6uW7N", "method": "NONE", "percentPerExp": 10}, "images": [{"as": "SjtX8e1j", "caption": "TY8ZFKlb", "height": 15, "imageUrl": "QRSf0VvU", "smallImageUrl": "aeeI7vqf", "width": 45}, {"as": "tyQJ4gvg", "caption": "4UMXcZnV", "height": 59, "imageUrl": "qwyQGDQw", "smallImageUrl": "AaSn922K", "width": 60}, {"as": "wtiyC8ZH", "caption": "1Q8X9PqN", "height": 100, "imageUrl": "dmWuhH9q", "smallImageUrl": "LXww4Z7q", "width": 33}], "localizations": {"a0K8g6OM": {"description": "F2lB444b", "title": "4c1AV5kQ"}, "3DQltPSd": {"description": "cCIGuJ7b", "title": "7KAC98Qa"}, "4Nby1ZSD": {"description": "TlTV4D7X", "title": "cUSk8PYZ"}}, "name": "qjlQes9D", "start": "1984-08-06T00:00:00Z", "tierItemId": "mUkPOzuK"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zduZx53V' \
    --body '{"end": "1979-12-21T00:00:00Z", "name": "RGlmiFdB", "start": "1997-02-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HzPVL78H' \
    > test.out 2>&1
eval_tap $? 9 'GetFullSeason' test.out

#- 10 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'D0m7ksAa' \
    > test.out 2>&1
eval_tap $? 10 'QueryPasses' test.out

#- 11 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GxtchcBU' \
    --body '{"autoEnroll": true, "code": "p9egXk0I", "displayOrder": 60, "images": [{"as": "OEBMMw27", "caption": "dNSUrDpO", "height": 11, "imageUrl": "CawX6JrD", "smallImageUrl": "zSTTiACY", "width": 69}, {"as": "uJB5mEly", "caption": "W5TyzeTi", "height": 60, "imageUrl": "xCugkOzC", "smallImageUrl": "oEwMD4FS", "width": 23}, {"as": "KnL5QVxH", "caption": "ngQXs9vA", "height": 29, "imageUrl": "VwSpzIwQ", "smallImageUrl": "haz0Iude", "width": 29}], "localizations": {"qsb8bs8n": {"description": "OvvmRgbQ", "title": "DhN3iZZQ"}, "KgQZgR82": {"description": "c4rcbq5Y", "title": "p0XJsNoi"}, "oqZUIg33": {"description": "bFvpXx13", "title": "Lb8mLUSS"}}, "passItemId": "v77LV7PT"}' \
    > test.out 2>&1
eval_tap $? 11 'CreatePass' test.out

#- 12 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '9cyT87MM' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wFZTlorJ' \
    > test.out 2>&1
eval_tap $? 12 'GetPass' test.out

#- 13 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'K6CtOmei' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Vx7NnmXX' \
    > test.out 2>&1
eval_tap $? 13 'DeletePass' test.out

#- 14 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code '5tX9Bpqt' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Irklmzrj' \
    --body '{"autoEnroll": false, "displayOrder": 62, "images": [{"as": "BkHlP8iD", "caption": "uJ4WIIOc", "height": 8, "imageUrl": "AqQdnWwF", "smallImageUrl": "qMN4hnyM", "width": 71}, {"as": "IXFLi5z4", "caption": "yuNNitzu", "height": 26, "imageUrl": "MTurRqy5", "smallImageUrl": "pkaCxggt", "width": 52}, {"as": "niDQ6Opa", "caption": "HXeyaxDW", "height": 13, "imageUrl": "dJbjnCwP", "smallImageUrl": "DcDPvYS2", "width": 40}], "localizations": {"qmqjBezk": {"description": "erKIE539", "title": "mCJV27tW"}, "zxB7tE9O": {"description": "xXinIXjc", "title": "nNVSyoJq"}, "BEcX7c8X": {"description": "7TVwmQOF", "title": "J3YIEF5g"}}, "passItemId": "N9lhnwUU"}' \
    > test.out 2>&1
eval_tap $? 14 'UpdatePass' test.out

#- 15 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eVVv6FxE' \
    > test.out 2>&1
eval_tap $? 15 'PublishSeason' test.out

#- 16 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5ZHBH1Br' \
    --force  \
    > test.out 2>&1
eval_tap $? 16 'RetireSeason' test.out

#- 17 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3YvYttRY' \
    --q 'qCkWJN09' \
    > test.out 2>&1
eval_tap $? 17 'QueryRewards' test.out

#- 18 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'atQWkjNA' \
    --body '{"code": "hOBdUcOX", "currency": {"currencyCode": "pDkNFnzc", "namespace": "uU1BTNIC"}, "image": {"as": "zqzX7isv", "caption": "iscaHbIA", "height": 96, "imageUrl": "Hr9cT0pP", "smallImageUrl": "jgjshlQu", "width": 68}, "itemId": "IGAq7rwe", "quantity": 85, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateReward' test.out

#- 19 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'c9VT7jVZ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nphryuHI' \
    > test.out 2>&1
eval_tap $? 19 'GetReward' test.out

#- 20 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'YChHvDS0' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eMXrH8Qv' \
    > test.out 2>&1
eval_tap $? 20 'DeleteReward' test.out

#- 21 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'B1FRLBpc' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yvOPPJY4' \
    --body '{"currency": {"currencyCode": "8nLgIUve", "namespace": "Zpe8a8CZ"}, "image": {"as": "8ga0gx7i", "caption": "zwysaTib", "height": 60, "imageUrl": "gkpIJPie", "smallImageUrl": "uM9aYJEA", "width": 4}, "itemId": "IG1FJ0Yy", "nullFields": ["8andmsvz", "0Sm8eAfV", "zYCWyYgo"], "quantity": 87, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateReward' test.out

#- 22 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PxxuMhgV' \
    --limit '57' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 22 'QueryTiers' test.out

#- 23 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7NeXTzJo' \
    --body '{"index": 25, "quantity": 90, "tier": {"requiredExp": 51, "rewards": {"KUX49EW9": ["kQRGBdzx", "Rv8vERRg", "SDhQBqlA"], "0n7LO9x5": ["23eJtTzb", "idhxNPE8", "dSyf9N9N"], "NzjvDdDu": ["klNKMAFP", "VoDXGwoP", "63Vx0kus"]}}}' \
    > test.out 2>&1
eval_tap $? 23 'CreateTier' test.out

#- 24 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '8Uczjmjz' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7dQAaZ78' \
    --body '{"requiredExp": 82, "rewards": {"iMtyIyl9": ["yN9Eo7Pb", "HuuRXfcc", "Qk9oRIhh"], "wcSbeIMA": ["0Gm4Etdx", "WcLB34w9", "vE7GQXv8"], "w4UBUT8y": ["87usHEwg", "pVskIAdV", "1zxN2Cnr"]}}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateTier' test.out

#- 25 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'wwyM7mQ1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'v9h1ImQJ' \
    > test.out 2>&1
eval_tap $? 25 'DeleteTier' test.out

#- 26 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'tju2jKmh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7yr5rq7l' \
    --body '{"newIndex": 47}' \
    > test.out 2>&1
eval_tap $? 26 'ReorderTier' test.out

#- 27 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kS5mWfTp' \
    --force  \
    > test.out 2>&1
eval_tap $? 27 'UnpublishSeason' test.out

#- 28 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZUkfbGa' \
    --limit '77' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 28 'GetUserParticipatedSeasons' test.out

#- 29 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'wjwk5gdQ' \
    --body '{"exp": 77, "source": "SWEAT", "tags": ["eD2TUR5X", "2SifdqFQ", "4pqXY7Sm"]}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserExp' test.out

#- 30 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'QoSYaY0Z' \
    --body '{"passCode": "p2gf9voj", "passItemId": "HkKR3PiM"}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserPass' test.out

#- 31 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '5wRyh6lP' \
    --passCodes 'QMgIhsrk,gDy0MMJR,4sjJeWmU' \
    > test.out 2>&1
eval_tap $? 31 'ExistsAnyPassByPassCodes' test.out

#- 32 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'Geitx9X5' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentUserSeasonProgression' test.out

#- 33 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'zEjcaNtw' \
    --body '{"passItemId": "y1XcceDJ", "tierItemCount": 70, "tierItemId": "cUg6ErxQ"}' \
    > test.out 2>&1
eval_tap $? 33 'CheckSeasonPurchasable' test.out

#- 34 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'h82c8lIN' \
    > test.out 2>&1
eval_tap $? 34 'ResetUserSeason' test.out

#- 35 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'u2ijPGZh' \
    --body '{"count": 38, "source": "PAID_FOR", "tags": ["B1C3SlbS", "xFndkdR3", "3sT1hnyp"]}' \
    > test.out 2>&1
eval_tap $? 35 'GrantUserTier' test.out

#- 36 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'CyvartYp' \
    --from 'XjPRst1z' \
    --limit '94' \
    --offset '14' \
    --seasonId 'dOvx68op' \
    --source 'PAID_FOR' \
    --tags 'wHRZuIdJ,0sMkUUw9,AoSU7y8V' \
    --to 'IO8ZAWKN' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistory' test.out

#- 37 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'SElilCZK' \
    --seasonId 'Xnd1ssyy' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistoryTag' test.out

#- 38 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bekj8lIk' \
    --userId 'HFut1o4L' \
    > test.out 2>&1
eval_tap $? 38 'GetUserSeason' test.out

#- 39 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'lTwwUPxo' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentSeason' test.out

#- 40 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '4AxA78IF' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentUserSeason' test.out

#- 41 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'wykfvg0X' \
    --body '{"passCode": "r0jDq50F", "rewardCode": "fMST7ntj", "tierIndex": 95}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserReward' test.out

#- 42 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '2BicrILG' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkClaimUserRewards' test.out

#- 43 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dA7e6ML5' \
    --userId 'K1XzueEo' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE