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
    --limit '78' \
    --offset '97' \
    --status 'DRAFT,RETIRED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "I4h7PHvi", "defaultRequiredExp": 60, "draftStoreId": "JXgtghGX", "end": "1983-06-18T00:00:00Z", "excessStrategy": {"currency": "BM5GgthZ", "method": "NONE", "percentPerExp": 5}, "images": [{"as": "jpUnkWxf", "caption": "7ditL8q3", "height": 100, "imageUrl": "RCwho7jH", "smallImageUrl": "B3WqimFw", "width": 91}, {"as": "ZfTZQEsO", "caption": "vZ8fO8tQ", "height": 25, "imageUrl": "0SgjrVj3", "smallImageUrl": "ySS2Qa8x", "width": 18}, {"as": "Vxa8FHBs", "caption": "6cUuSL0S", "height": 94, "imageUrl": "9nws9tNV", "smallImageUrl": "b1DJm0s1", "width": 38}], "localizations": {"B1YUfxke": {"description": "gzL0KU42", "title": "QP1gw9c6"}, "ky4veQ1Q": {"description": "r0b02aiT", "title": "7mcQIL7o"}, "ZI0erU3N": {"description": "SVqJWrTP", "title": "u2VOBp4d"}}, "name": "1tjJenyn", "start": "1993-02-16T00:00:00Z", "tierItemId": "l61fCNh5"}' \
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
    --body '{"userIds": ["B9WZ98Da", "AHaHStvj", "BpglqI8p"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6hFNuzpQ' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rg82Y8qa' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FqmJG19Y' \
    --body '{"autoClaim": false, "defaultLanguage": "rNBMZori", "defaultRequiredExp": 80, "draftStoreId": "W0u84SMl", "end": "1974-10-16T00:00:00Z", "excessStrategy": {"currency": "CzSzEzFW", "method": "CURRENCY", "percentPerExp": 35}, "images": [{"as": "kgQnVLPj", "caption": "AguYRyLB", "height": 68, "imageUrl": "b9cw0gES", "smallImageUrl": "bpil2zav", "width": 48}, {"as": "DjuyMjMm", "caption": "rumVDFbS", "height": 98, "imageUrl": "hqS7EcmN", "smallImageUrl": "r5jjeZ7w", "width": 45}, {"as": "o24999CY", "caption": "CGKILIH4", "height": 31, "imageUrl": "qvIJd6H1", "smallImageUrl": "ejsUAuI6", "width": 78}], "localizations": {"mJlw94O1": {"description": "23vOyktm", "title": "Dr9FlHJL"}, "AiyyTY3L": {"description": "dlRWb5fq", "title": "DjM6xnA3"}, "9gk7BcHi": {"description": "rVJlXdld", "title": "F7q2777Z"}}, "name": "6IfB928f", "start": "1995-03-16T00:00:00Z", "tierItemId": "wRQjNBO7"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CArHQR9O' \
    --body '{"end": "1985-04-23T00:00:00Z", "name": "jk4iN92H", "start": "1977-10-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZNSb8XOO' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uXgoWdX2' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'slNzRUMA' \
    --body '{"autoEnroll": true, "code": "OeT5tElU", "displayOrder": 67, "images": [{"as": "j4Br5Kk4", "caption": "uyovszwT", "height": 20, "imageUrl": "XYkIy7Vr", "smallImageUrl": "xsTqxtea", "width": 85}, {"as": "i3P89IpY", "caption": "sEVjP52U", "height": 35, "imageUrl": "Eaetqjsh", "smallImageUrl": "VAGwndO9", "width": 68}, {"as": "JXThqUIP", "caption": "UKdtcxr3", "height": 84, "imageUrl": "Q6o4783l", "smallImageUrl": "W6i2PVNe", "width": 86}], "localizations": {"Icv3aGF9": {"description": "lqFn4jMH", "title": "xqoqxrWF"}, "E63Hh2ly": {"description": "pimXG3GZ", "title": "2PaiWzyF"}, "IsMNeqWM": {"description": "qe4luuc8", "title": "XKdx59HN"}}, "passItemId": "KU4CzJM0"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'CTNv7zUv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7kDFGEx4' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'ZDlcHOua' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '29dVFJBS' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'j2VuUChK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZcMtpDTw' \
    --body '{"autoEnroll": false, "displayOrder": 44, "images": [{"as": "2BSb56cx", "caption": "WTkuOlZ7", "height": 25, "imageUrl": "03FrFQYQ", "smallImageUrl": "VKkzTRdt", "width": 45}, {"as": "YdyQAp6g", "caption": "GdaL2SaO", "height": 91, "imageUrl": "4C54wuKJ", "smallImageUrl": "UisEyaG8", "width": 35}, {"as": "mGnUw5ix", "caption": "XOC55ZM3", "height": 31, "imageUrl": "14AkQoxz", "smallImageUrl": "QiELBsig", "width": 28}], "localizations": {"UlYKU87V": {"description": "9epVNPSd", "title": "nLLup8Hk"}, "4kDA1CNx": {"description": "C3cqOfjb", "title": "Ii9jKfpQ"}, "A0NXJBNU": {"description": "v3vR6GjT", "title": "QCK8sdxL"}}, "passItemId": "Cfoy9vOH"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7OBUFyBf' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wUOJxYR4' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vwv6rEBQ' \
    --q 'w7O3NEGE' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5xOlg7Fc' \
    --body '{"code": "kWeRUIKa", "currency": {"currencyCode": "z14jvZAC", "namespace": "L1GoOG2X"}, "image": {"as": "fafJQNHr", "caption": "ozqCKPbi", "height": 30, "imageUrl": "jrFo85nA", "smallImageUrl": "mv83ivKU", "width": 82}, "itemId": "PqvG40Ds", "quantity": 31, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '0Q9pML16' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fA5B0FRr' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Tq25SynR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hijWBuDQ' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'odqbrpTC' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7wUtM2xh' \
    --body '{"currency": {"currencyCode": "3Wgct0DD", "namespace": "jzdcV8bm"}, "image": {"as": "4729YLQJ", "caption": "2p0UTIqm", "height": 75, "imageUrl": "yWxXdL5h", "smallImageUrl": "I1hLA2pK", "width": 52}, "itemId": "Vw6aQYKC", "nullFields": ["4q9zTMuy", "kg1NNnkJ", "2DJBnvEv"], "quantity": 80, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EagzOefC' \
    --limit '16' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lHUC452O' \
    --body '{"index": 99, "quantity": 86, "tier": {"requiredExp": 57, "rewards": {"WWuWWfQz": ["zu8j6GxX", "hJebpA2l", "gkSzUYVa"], "3JK0VWz3": ["ICjVAh9p", "fRSsSWRe", "JEBb4oB0"], "Ao1NdAHs": ["503i7s48", "pZeAJvE3", "NpERUabZ"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'rrUbghXl' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KYqPbZjw' \
    --body '{"requiredExp": 90, "rewards": {"hDu4fk6U": ["vJO8dMjQ", "ojPJz7RV", "49dcd9hw"], "zA3EH4g2": ["Y3fOAYxx", "cB72FdQl", "BM4fDG37"], "MeJEHbPB": ["uGh2vBWg", "1GonnpRt", "cDu9Finm"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'nJwjQuOp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'p8TbiO01' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '50QTqIZ3' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Zq8XZozr' \
    --body '{"newIndex": 89}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8kOhDaL8' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId '8LNJyVkr' \
    --limit '9' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'fqhBQeSl' \
    --body '{"exp": 82, "source": "SWEAT", "tags": ["FmBwidbE", "DIDSVyGD", "wY64sd2n"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'VcrIfFec' \
    --body '{"passCode": "H5MbulFI", "passItemId": "3gc2tEm5"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'HjqCbvof' \
    --passCodes '2ZuGfoff,kGIDC4LL,yHqS7xnl' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'dOboUDLS' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'OmRdtPiX' \
    --body '{"passItemId": "AHkT8HoN", "tierItemCount": 55, "tierItemId": "5TVNkM6P"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'j0P1AV4U' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'YifP7mZ1' \
    --body '{"count": 40, "source": "SWEAT", "tags": ["DHnrnJoF", "69JcXDS5", "dVMuGU02"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZgwPjkJ' \
    --from 'XcgGNcBt' \
    --limit '44' \
    --offset '14' \
    --seasonId '2rgHpeci' \
    --source 'PAID_FOR' \
    --tags 'ITOziZUx,1eqXssSP,vYC1UZZL' \
    --to 'TDWXcURz' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'JywuVtuc' \
    --seasonId 'lBsq2rxy' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ChLD6jce' \
    --userId 'Sl9oK8WT' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'zFnxWn3z' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '9UrJ8W7w' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'hk7syBJn' \
    --body '{"passCode": "vpyfJy3u", "rewardCode": "H2GrqbWg", "tierIndex": 7}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'kvAOl6iA' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EIe5QFYc' \
    --userId '0l8qDPzz' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE