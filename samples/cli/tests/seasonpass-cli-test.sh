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
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "tBxyZcDX", "defaultRequiredExp": 55, "draftStoreId": "pGlsQuJu", "end": "1981-11-03T00:00:00Z", "excessStrategy": {"currency": "f0IsJkTr", "method": "NONE", "percentPerExp": 68}, "images": [{"as": "DcV2zXnT", "caption": "KjXY1bPq", "height": 1, "imageUrl": "miBxx9Cs", "smallImageUrl": "18EY84ek", "width": 69}], "localizations": {"tqRzHU1o": {"description": "h570KQBV", "title": "aewc72kr"}}, "name": "Sha68n3Y", "start": "1977-04-27T00:00:00Z", "tierItemId": "zp1C2KmI"}' \
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
    --seasonId 'QTuBdNEU' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sxFb8CJ1' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7M7DJZaM' \
    --body '{"autoClaim": true, "defaultLanguage": "ECbZbygy", "defaultRequiredExp": 29, "draftStoreId": "arORoeNH", "end": "1993-01-05T00:00:00Z", "excessStrategy": {"currency": "8Rh3kgs9", "method": "CURRENCY", "percentPerExp": 33}, "images": [{"as": "JbnQsoBg", "caption": "iVpP8Cm3", "height": 49, "imageUrl": "vASUoxdx", "smallImageUrl": "xFqmAGTJ", "width": 68}], "localizations": {"EdagEtp4": {"description": "w29KOu9c", "title": "19R6XDqW"}}, "name": "HkkP8npL", "start": "1986-10-17T00:00:00Z", "tierItemId": "MfjiX7jp"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kVZk3IaQ' \
    --body '{"end": "1996-08-25T00:00:00Z", "name": "mqGodOEG", "start": "1980-02-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'POj0c6i0' \
    > test.out 2>&1
eval_tap $? 9 'QueryPasses' test.out

#- 10 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JkvIas73' \
    --body '{"autoEnroll": true, "code": "cYnFAJ3D", "displayOrder": 72, "images": [{"as": "5T4Eogg0", "caption": "Y39UoYlp", "height": 43, "imageUrl": "5bVAgtsD", "smallImageUrl": "hUTDUscb", "width": 85}], "localizations": {"DjbTQuPM": {"description": "z2PTRlky", "title": "U89ZPOw6"}}, "passItemId": "zPFJ42cw"}' \
    > test.out 2>&1
eval_tap $? 10 'CreatePass' test.out

#- 11 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'mzBBSMNc' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oAAOjKNj' \
    > test.out 2>&1
eval_tap $? 11 'GetPass' test.out

#- 12 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'fcYHm093' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aYgBU1sq' \
    > test.out 2>&1
eval_tap $? 12 'DeletePass' test.out

#- 13 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'jyK0XH45' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PaRSOFQB' \
    --body '{"autoEnroll": true, "displayOrder": 41, "images": [{"as": "23REZ8hR", "caption": "VX7LGOvD", "height": 6, "imageUrl": "YiQS9i7m", "smallImageUrl": "V1C91pjG", "width": 13}], "localizations": {"pxL6ycTQ": {"description": "dvln2LAu", "title": "SQWEXL6L"}}, "passItemId": "FE1YHo9m"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePass' test.out

#- 14 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '126ZWc8h' \
    > test.out 2>&1
eval_tap $? 14 'PublishSeason' test.out

#- 15 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HtWvbNYq' \
    > test.out 2>&1
eval_tap $? 15 'RetireSeason' test.out

#- 16 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gUqslArF' \
    > test.out 2>&1
eval_tap $? 16 'QueryRewards' test.out

#- 17 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PiHUIvaC' \
    --body '{"code": "v8kU9dBB", "currency": {"currencyCode": "pdsJLhsV", "namespace": "yExrkxoo"}, "image": {"as": "t0B7WOfe", "caption": "rcZdpMci", "height": 58, "imageUrl": "s7YSfExa", "smallImageUrl": "I3uzLteM", "width": 3}, "itemId": "FAlt4hr7", "quantity": 67, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateReward' test.out

#- 18 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'OYiBA5lt' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AOXmlG6e' \
    > test.out 2>&1
eval_tap $? 18 'GetReward' test.out

#- 19 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'h1dTdoTF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pBIcuC1d' \
    > test.out 2>&1
eval_tap $? 19 'DeleteReward' test.out

#- 20 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'QY93OJnJ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6Te9vD8l' \
    --body '{"currency": {"currencyCode": "dz7Hu8AD", "namespace": "79kdWunv"}, "image": {"as": "izU0q1pH", "caption": "yhhERoGg", "height": 7, "imageUrl": "rysMizBG", "smallImageUrl": "SRdP2l7D", "width": 79}, "itemId": "SZ8Aq0Xi", "nullFields": ["PLQXSe07"], "quantity": 7, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateReward' test.out

#- 21 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OGTMlJjB' \
    > test.out 2>&1
eval_tap $? 21 'QueryTiers' test.out

#- 22 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wj9HJHQK' \
    --body '{"index": 36, "quantity": 8, "tier": {"requiredExp": 60, "rewards": {"dSXRDSvg": ["uauw1xT7"]}}}' \
    > test.out 2>&1
eval_tap $? 22 'CreateTier' test.out

#- 23 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'eMwSl9ML' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'H0NnTJ2u' \
    --body '{"requiredExp": 22, "rewards": {"NzBvwJaQ": ["a547Jllv"]}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateTier' test.out

#- 24 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'A8RWSpab' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ut7xk6Qx' \
    > test.out 2>&1
eval_tap $? 24 'DeleteTier' test.out

#- 25 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'yWhfqoWf' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Jw2o8oWU' \
    --body '{"newIndex": 32}' \
    > test.out 2>&1
eval_tap $? 25 'ReorderTier' test.out

#- 26 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vPCZ2HzT' \
    > test.out 2>&1
eval_tap $? 26 'UnpublishSeason' test.out

#- 27 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId '7NXmWDlX' \
    > test.out 2>&1
eval_tap $? 27 'GetUserParticipatedSeasons' test.out

#- 28 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'suNIdQJR' \
    --body '{"exp": 23, "source": "SWEAT", "tags": ["NOlvkfwa"]}' \
    > test.out 2>&1
eval_tap $? 28 'GrantUserExp' test.out

#- 29 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'SbnsuLCg' \
    --body '{"passCode": "ToxuVTek", "passItemId": "Jgvg6h5H"}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserPass' test.out

#- 30 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'IpH0Dvip' \
    > test.out 2>&1
eval_tap $? 30 'ExistsAnyPassByPassCodes' test.out

#- 31 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'lEk4vj3L' \
    > test.out 2>&1
eval_tap $? 31 'GetCurrentUserSeasonProgression' test.out

#- 32 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dp4yqDt8' \
    --body '{"passItemId": "QUZDpxlH", "tierItemCount": 1, "tierItemId": "sinGcjrk"}' \
    > test.out 2>&1
eval_tap $? 32 'CheckSeasonPurchasable' test.out

#- 33 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'mRMttgjD' \
    > test.out 2>&1
eval_tap $? 33 'ResetUserSeason' test.out

#- 34 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'SaIVBmft' \
    --body '{"count": 93, "source": "PAID_FOR", "tags": ["g7p9PGmY"]}' \
    > test.out 2>&1
eval_tap $? 34 'GrantUserTier' test.out

#- 35 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '2H5kX4Ms' \
    > test.out 2>&1
eval_tap $? 35 'QueryUserExpGrantHistory' test.out

#- 36 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'isSX28nA' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistoryTag' test.out

#- 37 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RxWRpv5o' \
    --userId 'u5xtvd28' \
    > test.out 2>&1
eval_tap $? 37 'GetUserSeason' test.out

#- 38 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'PublicGetCurrentSeason' test.out

#- 39 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'OUfCt8UJ' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentUserSeason' test.out

#- 40 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'C5flNyj6' \
    --body '{"passCode": "HsTtX8P3", "rewardCode": "llnaaS9l", "tierIndex": 33}' \
    > test.out 2>&1
eval_tap $? 40 'PublicClaimUserReward' test.out

#- 41 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'yygPcfkJ' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkClaimUserRewards' test.out

#- 42 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IxfQZza8' \
    --userId 'kNVbDxVM' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE