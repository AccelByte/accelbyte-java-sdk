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
    --limit '52' \
    --offset '12' \
    --status 'DRAFT,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "68xxP65e", "defaultRequiredExp": 8, "draftStoreId": "fiDOlclh", "end": "1986-05-21T00:00:00Z", "excessStrategy": {"currency": "x6JJOqIN", "method": "NONE", "percentPerExp": 78}, "images": [{"as": "pG8UHswl", "caption": "cL7ydiL7", "height": 72, "imageUrl": "zp9ydB8G", "smallImageUrl": "5f1C7q8V", "width": 90}, {"as": "mBWXbZQP", "caption": "gOqVB128", "height": 13, "imageUrl": "eLtRBOF5", "smallImageUrl": "MUT9jEJD", "width": 3}, {"as": "kgumOOXd", "caption": "mroPJHoc", "height": 14, "imageUrl": "4lpVupvU", "smallImageUrl": "rnHTWg42", "width": 90}], "localizations": {"WuLU6EeN": {"description": "HgPFe3Cm", "title": "TsVvJAIp"}, "yQxNnxo4": {"description": "dAehRA5C", "title": "zpm8fPXk"}, "VkKEWsJ7": {"description": "tmgeQ5L4", "title": "9pxffqm0"}}, "name": "sdQ5M36V", "start": "1972-10-17T00:00:00Z", "tierItemId": "yXbDYPy2"}' \
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
    --body '{"userIds": ["h4pq05xe", "QWI9lak0", "OmETtZSH"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4Qfgpv6V' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eFSvTLKR' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'csH9YlXB' \
    --body '{"autoClaim": false, "defaultLanguage": "K03JW9Zo", "defaultRequiredExp": 82, "draftStoreId": "QTVhmPPi", "end": "1973-09-09T00:00:00Z", "excessStrategy": {"currency": "1FiStlD3", "method": "CURRENCY", "percentPerExp": 69}, "images": [{"as": "icS3xrUK", "caption": "IMgYgDHC", "height": 35, "imageUrl": "FghEJToX", "smallImageUrl": "SUlRgwO6", "width": 27}, {"as": "9yYZe4I2", "caption": "IOXaELqU", "height": 7, "imageUrl": "7c50dnN7", "smallImageUrl": "7FyoZCT6", "width": 9}, {"as": "JpeZW7qO", "caption": "lsxU7Afh", "height": 22, "imageUrl": "BoKA7DsL", "smallImageUrl": "I3w77FRX", "width": 11}], "localizations": {"j5kSs3E0": {"description": "PVRD7tlS", "title": "vnVXEK9e"}, "TK6VZy28": {"description": "mhz3fc85", "title": "zwWR0YMn"}, "AR2cf1hL": {"description": "5Bi64BQJ", "title": "r6Boumqq"}}, "name": "gB6eKlye", "start": "1971-08-11T00:00:00Z", "tierItemId": "6ySaxlQu"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rvsHjNFB' \
    --body '{"end": "1997-08-13T00:00:00Z", "name": "KQ32r9sv", "start": "1990-01-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JUp3WekP' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pitovdNH' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nAmdDnEs' \
    --body '{"autoEnroll": true, "code": "oELSl3gG", "displayOrder": 98, "images": [{"as": "D92Rcpwx", "caption": "YEjeMrpU", "height": 28, "imageUrl": "GRf25dz0", "smallImageUrl": "DQBUcX6v", "width": 25}, {"as": "yd6mhnbg", "caption": "bFS2ipIo", "height": 80, "imageUrl": "yIqxw0JK", "smallImageUrl": "ZObcF5jy", "width": 9}, {"as": "O67lGMEP", "caption": "k4lUvdje", "height": 73, "imageUrl": "gntjEHfl", "smallImageUrl": "0AnmGJfX", "width": 98}], "localizations": {"98lkRWp8": {"description": "mnN8BV6w", "title": "UEyYXL0j"}, "ysuNeKLN": {"description": "BIEeIdpg", "title": "Y7oIJ9AY"}, "yBALkw44": {"description": "hwwPvYvQ", "title": "THXU9NkO"}}, "passItemId": "G279kKUA"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'OGRiXuoh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'giShx9XA' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code '0QblcUlP' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HHEy2JhV' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'SD8FbzWF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4qLzpZdN' \
    --body '{"autoEnroll": false, "displayOrder": 63, "images": [{"as": "kXTW7azX", "caption": "gLp5Up23", "height": 80, "imageUrl": "GuOFbq4K", "smallImageUrl": "pGzOuzRD", "width": 10}, {"as": "m3amCUfk", "caption": "kCEPsGEu", "height": 74, "imageUrl": "05zRVv80", "smallImageUrl": "nmclY2V6", "width": 35}, {"as": "Dxq0AHQy", "caption": "IdLHxDuJ", "height": 100, "imageUrl": "cAimp6WH", "smallImageUrl": "bLJYb0Ah", "width": 71}], "localizations": {"AfP5Tm8g": {"description": "Tl62fzxJ", "title": "llpffl02"}, "1ghdYA8F": {"description": "ngNWluEH", "title": "iKGih1em"}, "8ka9HbX9": {"description": "9S2fgAVI", "title": "X4nCTIO1"}}, "passItemId": "rIJ7ln1x"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RpzOr6sL' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IbjX1Oti' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fyzrr4nf' \
    --q '6nSZRZqT' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'REwz7q7a' \
    --body '{"code": "M10WLOyC", "currency": {"currencyCode": "W4BdJASJ", "namespace": "AItjHOF0"}, "image": {"as": "82rZCwYH", "caption": "9OJbYnRu", "height": 66, "imageUrl": "1ksVONnb", "smallImageUrl": "XHUGeDzw", "width": 93}, "itemId": "060nHQo3", "quantity": 48, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'p5HYj0Tx' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ipwQBDCd' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'YpovqyKw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2jLWmPrY' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'b7HxeUX3' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3oVAGqvl' \
    --body '{"currency": {"currencyCode": "sflekaKJ", "namespace": "vziU1XBh"}, "image": {"as": "kAkRY8AW", "caption": "3vLqHEIO", "height": 23, "imageUrl": "6Fq3giCl", "smallImageUrl": "klV06BFQ", "width": 20}, "itemId": "YfSNvY2Q", "nullFields": ["aLeMhaKH", "ZsrDp3yh", "gJfvjhxk"], "quantity": 37, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 't48Dj6QS' \
    --limit '62' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tV2JSzUp' \
    --body '{"index": 80, "quantity": 20, "tier": {"requiredExp": 26, "rewards": {"3z83ONPi": ["CdHzMrrY", "NIsuAPvF", "6zejywvB"], "CnKq8QHB": ["4caPmCQx", "u7dOZZZ5", "t3zCbV3i"], "auSD1dX3": ["dhQ6Cw2A", "oHn9Rz5U", "LXjZk7ZB"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'ULkZuIFF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RyR1Hydd' \
    --body '{"requiredExp": 24, "rewards": {"RS4xJRmH": ["xoEiorh6", "dMllXIEO", "StzTaVlV"], "ncTDdSsZ": ["kpTEeZZi", "W9bhGG1D", "zHJ6VB4R"], "2BGqHoEG": ["GweWQPZA", "YVeiVKIa", "KK9XmMHf"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'hp1U4k9r' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kaqsEo6O' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'OH07YR29' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mjF8spKi' \
    --body '{"newIndex": 8}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oCYGG0hg' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybDvrdbk' \
    --limit '83' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'MDwlq62p' \
    --body '{"exp": 39, "source": "SWEAT", "tags": ["82tqwvnA", "mf5e7NFT", "aQ7Gdve9"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'cF8HXbVP' \
    --body '{"passCode": "PrbGp4Xf", "passItemId": "CuavAteb"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '6GYXqqtx' \
    --passCodes 'wc2imp3x,ZziL2yjg,iU3HcbDv' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'taZNQy1h' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'oagmYAg8' \
    --body '{"passItemId": "3983s7gp", "tierItemCount": 100, "tierItemId": "RO9iafqN"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'UQqt5jOG' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'xyZx2nzJ' \
    --body '{"count": 13, "source": "SWEAT", "tags": ["N9yFhMYf", "S4T8paxu", "BUtqfsJ6"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'NDBpMX3u' \
    --from 'pNsPze7P' \
    --limit '73' \
    --offset '45' \
    --seasonId '55bhytGi' \
    --source 'PAID_FOR' \
    --tags 'MAhayJfq,SvHhU6kB,MhdWlwj5' \
    --to 'daA32WXt' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'SBl3MmfX' \
    --seasonId '2OJB6Ef1' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'g1taw2EO' \
    --userId 'LFW0J96F' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'A9tv1V04' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '8DoX12Bi' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'QrmfRCwt' \
    --body '{"passCode": "NrkLmscm", "rewardCode": "B8msm5L6", "tierIndex": 75}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'NjNVtakn' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uNZN1fh2' \
    --userId 'VpqhBGxu' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE