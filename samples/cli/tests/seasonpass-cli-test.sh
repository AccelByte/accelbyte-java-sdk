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
    --limit '83' \
    --offset '29' \
    --status 'RETIRED,DRAFT,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "1oE4BUSs", "defaultRequiredExp": 45, "draftStoreId": "T0k7xinC", "end": "1987-06-12T00:00:00Z", "excessStrategy": {"currency": "dzjBvWui", "method": "NONE", "percentPerExp": 29}, "images": [{"as": "ZhAygXsG", "caption": "tto4ZziU", "height": 10, "imageUrl": "BNCYC0qa", "smallImageUrl": "iuUypd8o", "width": 43}, {"as": "3kAuKSwT", "caption": "bCogKRcO", "height": 18, "imageUrl": "SL32jt2l", "smallImageUrl": "7h2OfhJi", "width": 64}, {"as": "INef1f51", "caption": "F0icqaIR", "height": 8, "imageUrl": "Gh3xzjzw", "smallImageUrl": "SAVwk1Iy", "width": 38}], "localizations": {"cF9m2cfg": {"description": "vBqbKk6P", "title": "kzwKaX3a"}, "ECDfhc0h": {"description": "lINlK0qg", "title": "rIo6lGj0"}, "GrX8cbBz": {"description": "Ez2FPXpf", "title": "xllMC4aN"}}, "name": "QH0U8Fvh", "start": "1995-03-08T00:00:00Z", "tierItemId": "EMmg8HGe"}' \
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
    --seasonId 'ZK2rvz8i' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XPWyZ408' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VbN1xD82' \
    --body '{"autoClaim": false, "defaultLanguage": "Oa1EHGA7", "defaultRequiredExp": 40, "draftStoreId": "4RAWodNX", "end": "1976-01-01T00:00:00Z", "excessStrategy": {"currency": "QNhicr8w", "method": "NONE", "percentPerExp": 61}, "images": [{"as": "6tdUaOiz", "caption": "WKYQlAWq", "height": 55, "imageUrl": "S9LHHcim", "smallImageUrl": "nUAIZW3P", "width": 16}, {"as": "M4admPFY", "caption": "wZjQH9gf", "height": 25, "imageUrl": "bjO8wH6D", "smallImageUrl": "fKensrFF", "width": 56}, {"as": "T4XmIiGG", "caption": "i5bgkZb9", "height": 6, "imageUrl": "FZirMWoP", "smallImageUrl": "I5CODFH1", "width": 72}], "localizations": {"QcSdAzS4": {"description": "54bXMcjB", "title": "dnp1d8Az"}, "E7qZ85PH": {"description": "WRVumnaC", "title": "jyItAahA"}, "q8AfUPzB": {"description": "XzY5JJ9q", "title": "HZxUVpD2"}}, "name": "3iiLub1a", "start": "1987-12-14T00:00:00Z", "tierItemId": "TASzfKte"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zicejBsx' \
    --body '{"end": "1984-05-07T00:00:00Z", "name": "UAmHOJIU", "start": "1999-01-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Aq3vP0vr' \
    > test.out 2>&1
eval_tap $? 9 'GetFullSeason' test.out

#- 10 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Txp5aNvI' \
    > test.out 2>&1
eval_tap $? 10 'QueryPasses' test.out

#- 11 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'utTcoNKK' \
    --body '{"autoEnroll": true, "code": "JxK9YkGi", "displayOrder": 98, "images": [{"as": "KJVPaaz3", "caption": "xm1I08Hj", "height": 21, "imageUrl": "yst8Kqhj", "smallImageUrl": "RoWD04nH", "width": 22}, {"as": "OykzvST5", "caption": "LAfT0VWg", "height": 64, "imageUrl": "i6ywQDzl", "smallImageUrl": "xCOMXv81", "width": 49}, {"as": "hfICcHLU", "caption": "KCvsTT5n", "height": 56, "imageUrl": "KtGZ4hcy", "smallImageUrl": "1SD2yeMq", "width": 83}], "localizations": {"dViMX0mF": {"description": "bQ9RrbbB", "title": "7OPot59o"}, "p4z7TqZi": {"description": "ocKbTzhn", "title": "6LYNAX31"}, "ggTlscA4": {"description": "ZpvCwUCi", "title": "Zc3Oyxqd"}}, "passItemId": "qNZ4T3fh"}' \
    > test.out 2>&1
eval_tap $? 11 'CreatePass' test.out

#- 12 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'gu8VrwKX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '90ibRVLB' \
    > test.out 2>&1
eval_tap $? 12 'GetPass' test.out

#- 13 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'NOqLmKQc' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rqNyC3JH' \
    > test.out 2>&1
eval_tap $? 13 'DeletePass' test.out

#- 14 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'Yw9OE8df' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Q6cZb2vS' \
    --body '{"autoEnroll": false, "displayOrder": 58, "images": [{"as": "yyyxPgoh", "caption": "fmpD0vJ7", "height": 2, "imageUrl": "kznN6VGc", "smallImageUrl": "aFmpo4MT", "width": 100}, {"as": "kDuFn0f4", "caption": "m6olhroI", "height": 63, "imageUrl": "zVZN3gTl", "smallImageUrl": "Dajai2LB", "width": 52}, {"as": "IgNFYZOw", "caption": "lQaTsYQy", "height": 77, "imageUrl": "3qrFmd5x", "smallImageUrl": "8QiXfb3d", "width": 58}], "localizations": {"Zjvl4Ift": {"description": "o98tUSYT", "title": "UyAxsSgZ"}, "L6c5LPRH": {"description": "iVoGxVR0", "title": "hNmP56ut"}, "Dj7G36v9": {"description": "bLujo7Zd", "title": "m1CGo0qo"}}, "passItemId": "AkiiPJvI"}' \
    > test.out 2>&1
eval_tap $? 14 'UpdatePass' test.out

#- 15 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fB83gGJ8' \
    > test.out 2>&1
eval_tap $? 15 'PublishSeason' test.out

#- 16 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HVMSZTbW' \
    --force  \
    > test.out 2>&1
eval_tap $? 16 'RetireSeason' test.out

#- 17 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kUna7T0p' \
    --q 'AGphXRYx' \
    > test.out 2>&1
eval_tap $? 17 'QueryRewards' test.out

#- 18 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WPQoWAk1' \
    --body '{"code": "Tdzdnkw4", "currency": {"currencyCode": "JbxNbnKY", "namespace": "sMBg3RgM"}, "image": {"as": "XM0Dj5Z9", "caption": "jPSQvIuf", "height": 74, "imageUrl": "IMw7vJ5N", "smallImageUrl": "IovWMm81", "width": 53}, "itemId": "SHpNJZTD", "quantity": 79, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateReward' test.out

#- 19 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'OMhiQSsd' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '77kT6E1W' \
    > test.out 2>&1
eval_tap $? 19 'GetReward' test.out

#- 20 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'u24Jb8zu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KwAIAtkj' \
    > test.out 2>&1
eval_tap $? 20 'DeleteReward' test.out

#- 21 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '8SrRJcfh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'embJqKtA' \
    --body '{"currency": {"currencyCode": "DjCEP6Eh", "namespace": "mieFJaaC"}, "image": {"as": "SepKbb9x", "caption": "HGzemBP8", "height": 82, "imageUrl": "xYVkXAc5", "smallImageUrl": "3L8ldeLi", "width": 96}, "itemId": "D45xyHfZ", "nullFields": ["9k8iXR2p", "H0UxfH8Z", "ToJDUaHE"], "quantity": 18, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateReward' test.out

#- 22 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'l60ZfaAO' \
    --limit '19' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 22 'QueryTiers' test.out

#- 23 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pLGvd1El' \
    --body '{"index": 63, "quantity": 53, "tier": {"requiredExp": 41, "rewards": {"t9Qg4vZk": ["K2hFCZbX", "PJRkchIg", "Pt6nXu42"], "iu1Gl7t3": ["K51HdWty", "1x9mihwb", "btQXlIyX"], "ekyeI9KT": ["eqIO0bX0", "jGyF36pu", "Meemx1l4"]}}}' \
    > test.out 2>&1
eval_tap $? 23 'CreateTier' test.out

#- 24 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'rn0aMWV6' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6I96APwQ' \
    --body '{"requiredExp": 3, "rewards": {"kRTe1PPg": ["NUMUfUlW", "fWfQBIen", "OVeQJRcB"], "B021lDnQ": ["SIcC1ICG", "eSZdoRjT", "2AS2lXw4"], "dXRTu8rT": ["kL63Ly4f", "nrbwbguz", "tbTdbLZr"]}}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateTier' test.out

#- 25 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'Cij4jdGA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7XkIy5Hv' \
    > test.out 2>&1
eval_tap $? 25 'DeleteTier' test.out

#- 26 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '2frdFUjA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZxEpUE8x' \
    --body '{"newIndex": 90}' \
    > test.out 2>&1
eval_tap $? 26 'ReorderTier' test.out

#- 27 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UdOPAJuo' \
    --force  \
    > test.out 2>&1
eval_tap $? 27 'UnpublishSeason' test.out

#- 28 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'dRq7JMjC' \
    --limit '33' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 28 'GetUserParticipatedSeasons' test.out

#- 29 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'OovTEiov' \
    --body '{"exp": 60, "source": "PAID_FOR", "tags": ["iwaVRJfW", "HYgCjwWo", "389crCl4"]}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserExp' test.out

#- 30 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'u8u8YS90' \
    --body '{"passCode": "59QRtOX4", "passItemId": "eyoGCzYv"}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserPass' test.out

#- 31 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjOcp0BG' \
    --passCodes '26UQtI2G,llHYo3s6,Qyra1hoR' \
    > test.out 2>&1
eval_tap $? 31 'ExistsAnyPassByPassCodes' test.out

#- 32 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'cf3ivS1U' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentUserSeasonProgression' test.out

#- 33 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'm64gK7ja' \
    --body '{"passItemId": "oK5eVx98", "tierItemCount": 2, "tierItemId": "N8PaKPtL"}' \
    > test.out 2>&1
eval_tap $? 33 'CheckSeasonPurchasable' test.out

#- 34 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'MId8fTOS' \
    > test.out 2>&1
eval_tap $? 34 'ResetUserSeason' test.out

#- 35 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCg5aKSo' \
    --body '{"count": 86, "source": "SWEAT", "tags": ["9a0mWYtu", "WDOtwCHc", "ub23HFkC"]}' \
    > test.out 2>&1
eval_tap $? 35 'GrantUserTier' test.out

#- 36 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '7x7YIIzO' \
    --from 'tYbu8q3O' \
    --limit '53' \
    --offset '95' \
    --seasonId '3DFU3PdH' \
    --source 'SWEAT' \
    --tags 'xnIfOB5d,QtJISwbG,VEf7sRXs' \
    --to 'GZaYWiO7' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistory' test.out

#- 37 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '4F0ZDvPS' \
    --seasonId 'fQfKKkSo' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistoryTag' test.out

#- 38 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EoC1SEj9' \
    --userId 'nCZMe9F4' \
    > test.out 2>&1
eval_tap $? 38 'GetUserSeason' test.out

#- 39 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'pGTkYgb4' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentSeason' test.out

#- 40 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'y6Alku6d' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentUserSeason' test.out

#- 41 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'HsYCXpFu' \
    --body '{"passCode": "8Ulo1QB2", "rewardCode": "PvCm2l1m", "tierIndex": 86}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserReward' test.out

#- 42 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bb5g0qjp' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkClaimUserRewards' test.out

#- 43 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uGq2ooIl' \
    --userId 'H8aD5Bqi' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE