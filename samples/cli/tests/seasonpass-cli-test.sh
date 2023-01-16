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
    --limit '86' \
    --offset '10' \
    --status 'PUBLISHED,RETIRED,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "65wGs54k", "defaultRequiredExp": 83, "draftStoreId": "z9e4HOhV", "end": "1980-06-01T00:00:00Z", "excessStrategy": {"currency": "adcupL19", "method": "CURRENCY", "percentPerExp": 64}, "images": [{"as": "IT1NAk6l", "caption": "sPgl00gE", "height": 77, "imageUrl": "T19fo1yJ", "smallImageUrl": "rnUiDUSr", "width": 77}, {"as": "BUCP0n8o", "caption": "0vz9sOvQ", "height": 5, "imageUrl": "gCom3oD3", "smallImageUrl": "0pP0H1Gq", "width": 17}, {"as": "H69B4f94", "caption": "Q54iIEww", "height": 9, "imageUrl": "9Uvvhkqt", "smallImageUrl": "I8FR2PUH", "width": 5}], "localizations": {"zp2p1SLa": {"description": "o4O8WhV8", "title": "riLBmkoq"}, "Il2A0Dbz": {"description": "N0xgfEy2", "title": "lfq0ViZ4"}, "NbRdUoTl": {"description": "O60HgKAL", "title": "XPs7qBvF"}}, "name": "wshAK5q5", "start": "1973-12-26T00:00:00Z", "tierItemId": "v3OGljz9"}' \
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
    --body '{"userIds": ["DbiEvppF", "ylctl0oS", "6ic8g7Wa"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ov1mDUDY' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PSdZPKRn' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9LAPNlj4' \
    --body '{"autoClaim": false, "defaultLanguage": "MHGqxyqW", "defaultRequiredExp": 50, "draftStoreId": "1dqP0h7q", "end": "1978-10-26T00:00:00Z", "excessStrategy": {"currency": "qy2bqpQs", "method": "NONE", "percentPerExp": 11}, "images": [{"as": "KalQqkZP", "caption": "qrTnNDPA", "height": 70, "imageUrl": "5P5tXgpd", "smallImageUrl": "nSP1mXxn", "width": 1}, {"as": "UVUgK9IV", "caption": "9aWUaOlQ", "height": 70, "imageUrl": "umIaEajf", "smallImageUrl": "ksrYf2Gb", "width": 8}, {"as": "feaGgJMb", "caption": "6bOHzQd3", "height": 98, "imageUrl": "GFzgJEXQ", "smallImageUrl": "H2eBRNUH", "width": 25}], "localizations": {"AofKdGCt": {"description": "eirg5NBx", "title": "rEYn2o8M"}, "TKBZNt3m": {"description": "YmNJP1G1", "title": "DQrTjfrc"}, "FGQ2nbBu": {"description": "PdwnoDKK", "title": "XrZu0cb3"}}, "name": "uRAAnF64", "start": "1988-05-28T00:00:00Z", "tierItemId": "hdHNIKjH"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'n5HUzccU' \
    --body '{"end": "1976-02-07T00:00:00Z", "name": "ccqwmaG1", "start": "1991-04-03T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kTSud5Hc' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rITospSx' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8WqTNEzo' \
    --body '{"autoEnroll": true, "code": "HEZrA5Bj", "displayOrder": 26, "images": [{"as": "VHbCdacv", "caption": "PHu1AjBo", "height": 85, "imageUrl": "Wud2Z2Qk", "smallImageUrl": "xT7ec3yn", "width": 26}, {"as": "85TvHAEP", "caption": "R4QkqeXw", "height": 16, "imageUrl": "dKjow60T", "smallImageUrl": "GWMK2tHs", "width": 86}, {"as": "Eia93hxK", "caption": "hlOxxtqk", "height": 19, "imageUrl": "H2Y0UHrl", "smallImageUrl": "ipVCT1BE", "width": 36}], "localizations": {"BYXA4Yno": {"description": "hpImYKAu", "title": "JbsAsd0O"}, "ujdb1vGr": {"description": "uzbX4oWc", "title": "9mk9XHGE"}, "E2pD5xSX": {"description": "WpvGVywX", "title": "iHrX6HdP"}}, "passItemId": "G1DYxFFT"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'JhXjCDvC' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VRYblqYs' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'inE4qh3n' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jWKnrnec' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'Rp0gxfqe' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jZFmEeVP' \
    --body '{"autoEnroll": false, "displayOrder": 13, "images": [{"as": "bMPz3XrG", "caption": "AenWkDY4", "height": 38, "imageUrl": "jBdNeCBu", "smallImageUrl": "czijDaKD", "width": 95}, {"as": "Y78B7fqJ", "caption": "N5x78191", "height": 42, "imageUrl": "COhHkkQc", "smallImageUrl": "rOkKtww8", "width": 45}, {"as": "fEVaDFt6", "caption": "psYpSw4o", "height": 40, "imageUrl": "LEeuuoP9", "smallImageUrl": "kKfgEOop", "width": 72}], "localizations": {"pCNovK6p": {"description": "hiX8Juhq", "title": "DCxaae8H"}, "liYPZTeD": {"description": "8g40wBNz", "title": "mTfAiZuX"}, "kpJK0Q5y": {"description": "BG4W4viA", "title": "P5nxzf8r"}}, "passItemId": "tmAT0uCg"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZW01AfGu' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3WY7v6XP' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2ViuGWUN' \
    --q 'EcoagK9J' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oDxOlCyy' \
    --body '{"code": "hXa8MtTa", "currency": {"currencyCode": "rxd5ElA8", "namespace": "Jja3K1Z9"}, "image": {"as": "TitsiqXz", "caption": "abMxCSsU", "height": 65, "imageUrl": "TxL5r4Im", "smallImageUrl": "AyHZe5N7", "width": 32}, "itemId": "4opyIuXQ", "quantity": 58, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '19n40TOE' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hk8WzR4B' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Sw8GRlkG' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Vgo2ypAU' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'IsUoxF6R' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JfLTqTcp' \
    --body '{"currency": {"currencyCode": "bFVDP8uR", "namespace": "Ccf4AM4f"}, "image": {"as": "m1iRtDN9", "caption": "nQ7KFW2x", "height": 64, "imageUrl": "0h8SX4Q1", "smallImageUrl": "Uyr5tQfA", "width": 2}, "itemId": "QmQvorXR", "nullFields": ["VieEJcEz", "MbfdP4Ce", "i9kjSUGM"], "quantity": 28, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'x1eZRm45' \
    --limit '24' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nonWYvMA' \
    --body '{"index": 28, "quantity": 67, "tier": {"requiredExp": 47, "rewards": {"brKWG6Lr": ["bOmuZRuB", "WE3LbvUX", "KTw1y3Go"], "0WMPrvFQ": ["IGS4XYUs", "CkhXNDx6", "77K3jKzp"], "OT2uwUBf": ["uWkrIe2G", "MmxiOtFE", "6P48Ib2U"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'PLsVLajm' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rl4U9p6a' \
    --body '{"requiredExp": 61, "rewards": {"Veg01Dh1": ["utMZngIh", "Q0MTt3Os", "Xe4HM3hJ"], "ZunNFh7X": ["iKLUxBe5", "Z47oToXx", "5j08oQ5L"], "tqHfyG1g": ["E8zU2GF0", "fYuXkpZs", "OdjdON7d"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'dMANuwmT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fF9ZItam' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'vm4l9WVU' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kSZ5Ze3i' \
    --body '{"newIndex": 66}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gfVa4Ogf' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'nJH2ASYN' \
    --limit '85' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'zLTQfwaU' \
    --body '{"exp": 22, "source": "PAID_FOR", "tags": ["wXRQO0lO", "3rbeHkBt", "csZU1kbQ"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'SVYI3v2x' \
    --body '{"passCode": "YAwDHBg2", "passItemId": "sSgMGwEl"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'urOJaZWN' \
    --passCodes 'Rgdkl35H,Qz6XTDaC,P2PYnbLU' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'G7Y3B41W' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'PIOsMvnY' \
    --body '{"passItemId": "tRYPCAgi", "tierItemCount": 93, "tierItemId": "amOWu7GZ"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'CIP6GByt' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '6oJPd6GF' \
    --body '{"count": 8, "source": "SWEAT", "tags": ["TVFt4Yxl", "z6mz6qTp", "lnSNWtqh"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nr1MoSKB' \
    --from 'zJS3i32x' \
    --limit '57' \
    --offset '67' \
    --seasonId 'lBZBlKFW' \
    --source 'PAID_FOR' \
    --tags '4GQGnJoL,d6AoVr9u,EFoC6Qt8' \
    --to '6xaL9YYp' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tyrnsuwt' \
    --seasonId 'vOym11CV' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'osy4CJnO' \
    --userId 'mI87xPMu' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language '2ko0oUv9' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'yWeyJYC3' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'cHX3bSfj' \
    --body '{"passCode": "dZdvhnEg", "rewardCode": "QWLnv1pp", "tierIndex": 47}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWVaVrh6' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PVCTpfaa' \
    --userId 'bluIQXF5' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE