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
    --limit '62' \
    --offset '39' \
    --status 'PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "yZcDXBpG", "defaultRequiredExp": 22, "draftStoreId": "sQuJu8vM", "end": "1973-10-06T00:00:00Z", "excessStrategy": {"currency": "sJkTrd8I", "method": "CURRENCY", "percentPerExp": 4}, "images": [{"as": "V2zXnTKj", "caption": "XY1bPqam", "height": 17, "imageUrl": "Bxx9Cs18", "smallImageUrl": "EY84ekIt", "width": 32}], "localizations": {"RzHU1oh5": {"description": "70KQBVae", "title": "wc72krSh"}}, "name": "a68n3Yno", "start": "1983-05-05T00:00:00Z", "tierItemId": "1C2KmIQT"}' \
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
    --seasonId 'uBdNEUsx' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Fb8CJ17M' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7DJZaMSx' \
    --body '{"autoClaim": true, "defaultLanguage": "CbZbygyo", "defaultRequiredExp": 1, "draftStoreId": "rORoeNHS", "end": "1971-12-17T00:00:00Z", "excessStrategy": {"currency": "h3kgs9qq", "method": "NONE", "percentPerExp": 27}, "images": [{"as": "QsoBgiVp", "caption": "P8Cm3yvA", "height": 89, "imageUrl": "UoxdxxFq", "smallImageUrl": "mAGTJ8IE", "width": 6}], "localizations": {"agEtp4w2": {"description": "9KOu9c19", "title": "R6XDqWHk"}}, "name": "kP8npLEK", "start": "1990-02-13T00:00:00Z", "tierItemId": "jiX7jpkV"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Zk3IaQYE' \
    --body '{"end": "1977-05-08T00:00:00Z", "name": "GodOEGt9", "start": "1974-11-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Oj0c6i0J' \
    > test.out 2>&1
eval_tap $? 9 'QueryPasses' test.out

#- 10 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kvIas73u' \
    --body '{"autoEnroll": false, "code": "YnFAJ3DK", "displayOrder": 91, "images": [{"as": "4Eogg0Y3", "caption": "9UoYlpv5", "height": 3, "imageUrl": "VAgtsDhU", "smallImageUrl": "TDUscbQD", "width": 18}], "localizations": {"bTQuPMz2": {"description": "PTRlkyU8", "title": "9ZPOw6zP"}}, "passItemId": "FJ42cwmz"}' \
    > test.out 2>&1
eval_tap $? 10 'CreatePass' test.out

#- 11 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'BBSMNcoA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AOjKNjfc' \
    > test.out 2>&1
eval_tap $? 11 'GetPass' test.out

#- 12 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'YHm093aY' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gBU1sqjy' \
    > test.out 2>&1
eval_tap $? 12 'DeletePass' test.out

#- 13 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'K0XH45Pa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RSOFQBtu' \
    --body '{"autoEnroll": true, "displayOrder": 15, "images": [{"as": "RVX7LGOv", "caption": "DdYiQS9i", "height": 24, "imageUrl": "V1C91pjG", "smallImageUrl": "9gpxL6yc", "width": 90}], "localizations": {"Qdvln2LA": {"description": "uSQWEXL6", "title": "LFE1YHo9"}}, "passItemId": "m126ZWc8"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePass' test.out

#- 14 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hHtWvbNY' \
    > test.out 2>&1
eval_tap $? 14 'PublishSeason' test.out

#- 15 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qgUqslAr' \
    --force  \
    > test.out 2>&1
eval_tap $? 15 'RetireSeason' test.out

#- 16 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FPiHUIva' \
    --q 'Cv8kU9dB' \
    > test.out 2>&1
eval_tap $? 16 'QueryRewards' test.out

#- 17 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BpdsJLhs' \
    --body '{"code": "VyExrkxo", "currency": {"currencyCode": "ot0B7WOf", "namespace": "ercZdpMc"}, "image": {"as": "i37Ds7YS", "caption": "fExaI3uz", "height": 74, "imageUrl": "teMbFAlt", "smallImageUrl": "4hr7HmOY", "width": 16}, "itemId": "BA5ltAOX", "quantity": 25, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateReward' test.out

#- 18 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'G6eh1dTd' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oTFpBIcu' \
    > test.out 2>&1
eval_tap $? 18 'GetReward' test.out

#- 19 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'C1dQY93O' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JnJ6Te9v' \
    > test.out 2>&1
eval_tap $? 19 'DeleteReward' test.out

#- 20 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'D8ldz7Hu' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8AD79kdW' \
    --body '{"currency": {"currencyCode": "unvizU0q", "namespace": "1pHyhhER"}, "image": {"as": "oGgdrysM", "caption": "izBGSRdP", "height": 23, "imageUrl": "7DNSZ8Aq", "smallImageUrl": "0XiPLQXS", "width": 9}, "itemId": "07ZddOGT", "nullFields": ["MlJjBwj9"], "quantity": 66, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateReward' test.out

#- 21 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eEdSXRDS' \
    --limit '43' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 21 'QueryTiers' test.out

#- 22 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uauw1xT7' \
    --body '{"index": 9, "quantity": 76, "tier": {"requiredExp": 44, "rewards": {"Sl9MLH0N": ["nTJ2ulNz"]}}}' \
    > test.out 2>&1
eval_tap $? 22 'CreateTier' test.out

#- 23 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'BvwJaQa5' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '47JllvA8' \
    --body '{"requiredExp": 86, "rewards": {"WSpabUt7": ["xk6QxyWh"]}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateTier' test.out

#- 24 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'fqoWfJw2' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'o8oWUqvP' \
    > test.out 2>&1
eval_tap $? 24 'DeleteTier' test.out

#- 25 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'CZ2HzT7N' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XmWDlXsu' \
    --body '{"newIndex": 79}' \
    > test.out 2>&1
eval_tap $? 25 'ReorderTier' test.out

#- 26 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IdQJR5ls' \
    --force  \
    > test.out 2>&1
eval_tap $? 26 'UnpublishSeason' test.out

#- 27 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'NOlvkfwa' \
    --limit '89' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 27 'GetUserParticipatedSeasons' test.out

#- 28 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'nsuLCgTo' \
    --body '{"exp": 47, "source": "SWEAT", "tags": ["VTekJgvg"]}' \
    > test.out 2>&1
eval_tap $? 28 'GrantUserExp' test.out

#- 29 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '6h5HIpH0' \
    --body '{"passCode": "DviplEk4", "passItemId": "vj3LDp4y"}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserPass' test.out

#- 30 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'qDt8QUZD' \
    --passCodes 'pxlHasin' \
    > test.out 2>&1
eval_tap $? 30 'ExistsAnyPassByPassCodes' test.out

#- 31 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'GcjrkmRM' \
    > test.out 2>&1
eval_tap $? 31 'GetCurrentUserSeasonProgression' test.out

#- 32 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'ttgjDSaI' \
    --body '{"passItemId": "VBmft3Ud", "tierItemCount": 12, "tierItemId": "7p9PGmY2"}' \
    > test.out 2>&1
eval_tap $? 32 'CheckSeasonPurchasable' test.out

#- 33 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'H5kX4Msi' \
    > test.out 2>&1
eval_tap $? 33 'ResetUserSeason' test.out

#- 34 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'sSX28nAR' \
    --body '{"count": 46, "source": "PAID_FOR", "tags": ["v5ou5xtv"]}' \
    > test.out 2>&1
eval_tap $? 34 'GrantUserTier' test.out

#- 35 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'd28OUfCt' \
    --from '8UJC5flN' \
    --limit '48' \
    --offset '19' \
    --seasonId '6HsTtX8P' \
    --source 'PAID_FOR' \
    --tags 'lnaaS9lq' \
    --to 'yygPcfkJ' \
    > test.out 2>&1
eval_tap $? 35 'QueryUserExpGrantHistory' test.out

#- 36 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'IxfQZza8' \
    --seasonId 'kNVbDxVM' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistoryTag' test.out

#- 37 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'q7HJk0F8' \
    --userId '9xAc3YVf' \
    > test.out 2>&1
eval_tap $? 37 'GetUserSeason' test.out

#- 38 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'aENtrl0p' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetCurrentSeason' test.out

#- 39 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'TKZTXqzH' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentUserSeason' test.out

#- 40 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'uBMYQSA2' \
    --body '{"passCode": "jz1ZOpdO", "rewardCode": "jSyMddB4", "tierIndex": 70}' \
    > test.out 2>&1
eval_tap $? 40 'PublicClaimUserReward' test.out

#- 41 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'uMf7RUyB' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkClaimUserRewards' test.out

#- 42 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HRj8IiRi' \
    --userId 'mRllHT6D' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE