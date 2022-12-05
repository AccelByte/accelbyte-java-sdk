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
    --limit '0' \
    --offset '73' \
    --status 'RETIRED,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "GcmfeGdI", "defaultRequiredExp": 22, "draftStoreId": "RD9Drm90", "end": "1985-11-14T00:00:00Z", "excessStrategy": {"currency": "wrSk6Rlt", "method": "CURRENCY", "percentPerExp": 99}, "images": [{"as": "5HQyJvy3", "caption": "6RsM8EML", "height": 91, "imageUrl": "BkcOOZaV", "smallImageUrl": "TLGpmOAl", "width": 32}, {"as": "GmQuT47Z", "caption": "UBD8chJP", "height": 3, "imageUrl": "WICsIsIC", "smallImageUrl": "aL4uUAzG", "width": 76}, {"as": "G4zeqUqE", "caption": "qpoQDHJg", "height": 17, "imageUrl": "ksxNtVEH", "smallImageUrl": "OssJJiBC", "width": 4}], "localizations": {"qF354B7Q": {"description": "dri8Os6M", "title": "N6U4trZm"}, "yTDGuqLc": {"description": "W9c0yxmY", "title": "EUmNEoFP"}, "xLtGpsXv": {"description": "YlPD7Ka0", "title": "WVUDOkkQ"}}, "name": "BvxJ0NEz", "start": "1983-07-01T00:00:00Z", "tierItemId": "X7mqSA0o"}' \
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
    --body '{"userIds": ["lVHsucQP", "7Q50PyyP", "aogAsq8i"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qmZ1r9DK' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7gusfbsp' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7RkwoPJz' \
    --body '{"autoClaim": false, "defaultLanguage": "4xywimQH", "defaultRequiredExp": 98, "draftStoreId": "4TkzCLjb", "end": "1989-10-14T00:00:00Z", "excessStrategy": {"currency": "5joFr27Q", "method": "NONE", "percentPerExp": 90}, "images": [{"as": "Dq7lkJHB", "caption": "vP2JgYsE", "height": 59, "imageUrl": "PkBHlc2u", "smallImageUrl": "usSRt32w", "width": 9}, {"as": "GoV3qCZx", "caption": "TwsFRVQH", "height": 62, "imageUrl": "UaZTpKYl", "smallImageUrl": "pS7jiMjG", "width": 55}, {"as": "9SFVYNJ7", "caption": "nt6CS3xI", "height": 79, "imageUrl": "sCCoQdlx", "smallImageUrl": "jdlPO7JN", "width": 47}], "localizations": {"bKsZpEmG": {"description": "dNCiEPWb", "title": "k70OjuO7"}, "PN9iCB1X": {"description": "iLN6BqJC", "title": "aY7EjHbz"}, "9T5nnrPz": {"description": "oHkLXm62", "title": "hqb0JP9s"}}, "name": "SRkbu9rE", "start": "1984-12-13T00:00:00Z", "tierItemId": "0Ji5mQaT"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6Qa5tVqJ' \
    --body '{"end": "1984-09-05T00:00:00Z", "name": "YlBoT5bW", "start": "1990-12-26T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5ZnkluZo' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'l66TlhPi' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A7A8kUgQ' \
    --body '{"autoEnroll": true, "code": "QDsAyla3", "displayOrder": 71, "images": [{"as": "kjAikL5l", "caption": "EIOzupxL", "height": 40, "imageUrl": "u9Ywq8lR", "smallImageUrl": "P86zpgeC", "width": 35}, {"as": "4CAyoyb0", "caption": "ZLzsxDTn", "height": 59, "imageUrl": "yYcEVn7f", "smallImageUrl": "iwW2VyaX", "width": 40}, {"as": "oNUAnufP", "caption": "WF7f2IlW", "height": 18, "imageUrl": "1EFRko9c", "smallImageUrl": "I38KHoGh", "width": 67}], "localizations": {"RZUebuoL": {"description": "NeTmlbKk", "title": "CxyE8FEb"}, "gFNPHqAN": {"description": "CjglaWn4", "title": "cyZhzREG"}, "WVFICuoE": {"description": "nZhBsLVY", "title": "ONuc3Azn"}}, "passItemId": "W3u7MbSU"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '1vixtrmT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MeCsi3EK' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'iJX8k7RP' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7MmuLgrp' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'gkcvKF1O' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'm9Nv9pHf' \
    --body '{"autoEnroll": false, "displayOrder": 49, "images": [{"as": "JM0zEjlI", "caption": "6fu4wcEH", "height": 6, "imageUrl": "PxBXtLz0", "smallImageUrl": "cSgw1j6K", "width": 20}, {"as": "gQhQANsu", "caption": "12nJ1Iua", "height": 42, "imageUrl": "J572s6us", "smallImageUrl": "2XyP9QkG", "width": 68}, {"as": "q5gIttZR", "caption": "RMF2k4Eo", "height": 41, "imageUrl": "6YGF8seK", "smallImageUrl": "2ESyc5sx", "width": 84}], "localizations": {"wA4KqKer": {"description": "ow8DtR9Q", "title": "VpHpKqzn"}, "TgjaMYHa": {"description": "csaFJZtg", "title": "zM8xydrJ"}, "e36vYbYq": {"description": "vflnxpbP", "title": "lvNsKfXP"}}, "passItemId": "rZJZbAKV"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lXZADMFa' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Qbd0SpEE' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2QlMkIHS' \
    --q 'cpTHxY04' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Bao3IIB6' \
    --body '{"code": "HMz9pWCw", "currency": {"currencyCode": "sl43GEwj", "namespace": "CfQlUjBs"}, "image": {"as": "ArCVRW0l", "caption": "TKY3f8oA", "height": 5, "imageUrl": "w7rlN8jV", "smallImageUrl": "ICNlJFzH", "width": 28}, "itemId": "Wm6txrJd", "quantity": 20, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'kU60bOFA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zLGnFPwQ' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'cqltluPY' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '17bFHHvM' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'keWN7fQa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CQMW5Ema' \
    --body '{"currency": {"currencyCode": "nGq9jJky", "namespace": "Z5IgAumE"}, "image": {"as": "R6kCQO8p", "caption": "L0x2irxC", "height": 30, "imageUrl": "kGYmfcyA", "smallImageUrl": "lOti3om7", "width": 57}, "itemId": "kxKeVPVa", "nullFields": ["MyIH8U3T", "NlgsuIKM", "qGLYduEe"], "quantity": 92, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HxkN10Cf' \
    --limit '60' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QDziSTuI' \
    --body '{"index": 96, "quantity": 95, "tier": {"requiredExp": 72, "rewards": {"6O5gitzL": ["6DikLGFz", "fGaN5Kd9", "JNzaRLlz"], "5GJgpOPb": ["tuSV3Mi9", "Kl91ClDo", "Nom9N6RI"], "ZkGxmGxf": ["rTrHD7qo", "vQ4uGBXf", "HWmAGPRs"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'vqGz6HmR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9PQBOnEI' \
    --body '{"requiredExp": 27, "rewards": {"B8lz8gTj": ["1knkPO0n", "0lBfIDII", "LVYtUtUR"], "zagFr7Ub": ["X3JNvkVk", "VJFXdzHm", "t93IPIDs"], "V55LzHgF": ["U2CkbpWf", "4vcFlanc", "HkkmZf0x"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'OBqTBBmL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1QMtlvuf' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'FLkcEtmA' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'hYRepcTd' \
    --body '{"newIndex": 42}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fJ5gEiZ4' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId '488lzRHs' \
    --limit '37' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '2EltK1uB' \
    --body '{"exp": 74, "source": "SWEAT", "tags": ["572olbBz", "E4Ek2Vnw", "tVUQuLzB"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJ76b4E7' \
    --body '{"passCode": "WxmeFeLx", "passItemId": "FFaCc4Ic"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'zQtLLMfb' \
    --passCodes 'syWQUIqk,qSDPloAo,FbsVAvCA' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '44kvzecT' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'T7OQmvuv' \
    --body '{"passItemId": "JKYpzWTS", "tierItemCount": 26, "tierItemId": "WlndMU46"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'uZbDG0Yy' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '7CkwCkZ2' \
    --body '{"count": 54, "source": "SWEAT", "tags": ["A90Xo9Xo", "PLcejCqN", "5y8ZUXAe"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'wDjxVVzK' \
    --from '2TCjK2K0' \
    --limit '59' \
    --offset '94' \
    --seasonId 'XAuI48iX' \
    --source 'SWEAT' \
    --tags 'PN88asrP,lOumHkCE,k39Fsusd' \
    --to 'GtogVKb3' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'hpj6FQK8' \
    --seasonId 'MHGsZUoS' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OANZiyr1' \
    --userId 'RnXRf1jL' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'dnIBPsyq' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'CzgGf1i4' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId '8Dixo2n8' \
    --body '{"passCode": "zke50zkS", "rewardCode": "STNJ4p5T", "tierIndex": 54}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'opTC4AqB' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qbP2BT7O' \
    --userId 'xL6NaPrk' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE