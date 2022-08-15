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
    --limit '12' \
    --offset '16' \
    --status 'RETIRED,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "Th576VLI", "defaultRequiredExp": 24, "draftStoreId": "Jv8B3zPX", "end": "1977-03-17T00:00:00Z", "excessStrategy": {"currency": "J99nVvC6", "method": "NONE", "percentPerExp": 28}, "images": [{"as": "01Gtfphs", "caption": "64mMHiqh", "height": 42, "imageUrl": "NGDnXw1O", "smallImageUrl": "3lfpWVkD", "width": 82}, {"as": "h0RRl6b6", "caption": "C3iPLFXZ", "height": 0, "imageUrl": "LYYoE6BM", "smallImageUrl": "CnQukfIv", "width": 43}, {"as": "Lxna5TkD", "caption": "w3klnLNs", "height": 36, "imageUrl": "udsWMDkP", "smallImageUrl": "sLUkE5qt", "width": 76}], "localizations": {"nSPuQmKW": {"description": "INIlL778", "title": "oxRmnBq7"}, "FcBhdIoe": {"description": "1i2yeAkv", "title": "hmfJEdol"}, "bjr1AURJ": {"description": "y42Eyizn", "title": "xEbJqHZ4"}}, "name": "LrJHVUHb", "start": "1988-01-20T00:00:00Z", "tierItemId": "JcJuNYRg"}' \
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
    --seasonId 'musUJ75K' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3Q70dObM' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zCFxvnuJ' \
    --body '{"autoClaim": true, "defaultLanguage": "ZnrUonHw", "defaultRequiredExp": 12, "draftStoreId": "kQbKYZTn", "end": "1972-06-18T00:00:00Z", "excessStrategy": {"currency": "5yvkr7eN", "method": "NONE", "percentPerExp": 77}, "images": [{"as": "OqAb6qQ9", "caption": "Ms2co0ju", "height": 68, "imageUrl": "nrdSZEgw", "smallImageUrl": "vikRvS5I", "width": 69}, {"as": "oHbkhWNl", "caption": "xfEb0JMI", "height": 77, "imageUrl": "ss8vkYJb", "smallImageUrl": "qpMcrHE3", "width": 94}, {"as": "O88gib1x", "caption": "Y9vV1FN3", "height": 58, "imageUrl": "Ut7PvZTs", "smallImageUrl": "Y54xYDHC", "width": 6}], "localizations": {"VmI5RhnG": {"description": "sb2ib36U", "title": "yFhETuB8"}, "JeOobsVR": {"description": "8Q7ecOXG", "title": "NPEoLRnR"}, "bI7PO8UR": {"description": "ZV6WbdGP", "title": "sjmoCcJo"}}, "name": "1CGQXERJ", "start": "1974-12-28T00:00:00Z", "tierItemId": "tln8RubT"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EUmkexsm' \
    --body '{"end": "1979-08-26T00:00:00Z", "name": "Omi19Chb", "start": "1975-08-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mPsdkZ4B' \
    > test.out 2>&1
eval_tap $? 9 'QueryPasses' test.out

#- 10 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qR0XbRpq' \
    --body '{"autoEnroll": true, "code": "CkeTqSiI", "displayOrder": 49, "images": [{"as": "N93x097N", "caption": "XRKHfaos", "height": 48, "imageUrl": "xKljcsgx", "smallImageUrl": "PUOng18D", "width": 82}, {"as": "ThWdFZTU", "caption": "EtZEeoY7", "height": 73, "imageUrl": "MNDeUwh2", "smallImageUrl": "L83tM3p6", "width": 19}, {"as": "lF3EzAcD", "caption": "cOhWRbye", "height": 59, "imageUrl": "IY1F4uxo", "smallImageUrl": "U1UiWXzH", "width": 48}], "localizations": {"KUAYTzck": {"description": "lXPW4Qib", "title": "X8LNVIPt"}, "DxPLWL3Y": {"description": "RUPCBIPl", "title": "RMEbhuJ1"}, "rlgFTFop": {"description": "X5OFyool", "title": "UcKpFFcp"}}, "passItemId": "pDz5JYVn"}' \
    > test.out 2>&1
eval_tap $? 10 'CreatePass' test.out

#- 11 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'D2TuAieB' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FVbWXabh' \
    > test.out 2>&1
eval_tap $? 11 'GetPass' test.out

#- 12 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'W7qU2IcQ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'n4p8rNVG' \
    > test.out 2>&1
eval_tap $? 12 'DeletePass' test.out

#- 13 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'ZeT1G4QI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'u7POana9' \
    --body '{"autoEnroll": false, "displayOrder": 34, "images": [{"as": "Ui28i7Kx", "caption": "RGhjHU9q", "height": 77, "imageUrl": "ZfjHbpJb", "smallImageUrl": "gHfhfDbk", "width": 79}, {"as": "CrppMQVh", "caption": "VxssqX7a", "height": 8, "imageUrl": "NQ8me4Cw", "smallImageUrl": "WIZWLPqo", "width": 41}, {"as": "n0IqDyYe", "caption": "cYC5cg7q", "height": 88, "imageUrl": "RSB8oPvj", "smallImageUrl": "gVbjtkOP", "width": 38}], "localizations": {"5wOV7z7H": {"description": "UlmGzG1o", "title": "CbcaBtAA"}, "VkmlOzap": {"description": "LRmX25ez", "title": "tVBo6mft"}, "OSXjpgyq": {"description": "7mTqLrsW", "title": "oBQZydQD"}}, "passItemId": "LOeC3N23"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePass' test.out

#- 14 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cEAQRZKF' \
    > test.out 2>&1
eval_tap $? 14 'PublishSeason' test.out

#- 15 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '58ZeyJTl' \
    --force  \
    > test.out 2>&1
eval_tap $? 15 'RetireSeason' test.out

#- 16 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MsDtWk3I' \
    --q 'QRE9nfnR' \
    > test.out 2>&1
eval_tap $? 16 'QueryRewards' test.out

#- 17 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yIyei2IA' \
    --body '{"code": "lz6s9ou2", "currency": {"currencyCode": "njMUhL9K", "namespace": "iHuYYte4"}, "image": {"as": "7TQlcsi6", "caption": "jrmcdtI5", "height": 11, "imageUrl": "QBRVkx4U", "smallImageUrl": "86JA5O35", "width": 61}, "itemId": "JlkUbgZO", "quantity": 94, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateReward' test.out

#- 18 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'vC42EPnh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Si7n4VJT' \
    > test.out 2>&1
eval_tap $? 18 'GetReward' test.out

#- 19 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'rv21jJoa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jiTYKu7O' \
    > test.out 2>&1
eval_tap $? 19 'DeleteReward' test.out

#- 20 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '3ObRUR2s' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'y71agDSk' \
    --body '{"currency": {"currencyCode": "cffMDRzb", "namespace": "7mNEkaZk"}, "image": {"as": "9Z7KKaGi", "caption": "15y7xE6w", "height": 76, "imageUrl": "VFyOnRSW", "smallImageUrl": "MXnRpzvF", "width": 23}, "itemId": "LA6uMojV", "nullFields": ["ViJbgpZV", "47sAclnC", "oaUuZk74"], "quantity": 10, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateReward' test.out

#- 21 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OlzrgNUb' \
    --limit '32' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 21 'QueryTiers' test.out

#- 22 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dPTTkdMz' \
    --body '{"index": 100, "quantity": 0, "tier": {"requiredExp": 82, "rewards": {"XoTbOeO1": ["1FhE59m8", "h2aFpkix", "TzgkSeS3"], "apq5rarn": ["3SRP4aOU", "ogpGQOT1", "FkNDT7ET"], "qDJPJRtO": ["zgcyEEvc", "yBMl0nSg", "eEDmviym"]}}}' \
    > test.out 2>&1
eval_tap $? 22 'CreateTier' test.out

#- 23 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'IaWH59Gv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'D4L83WGA' \
    --body '{"requiredExp": 87, "rewards": {"wNhuSbK9": ["hNGQDAv8", "OjDoFk1z", "ZJIK3H4G"], "QAieyjyO": ["Lv9gQ6KC", "eH8fkiKb", "l2NOWgdE"], "XEmqzPeg": ["07D4FpWT", "zKE7LYfG", "ip48icvK"]}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateTier' test.out

#- 24 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '6d2Yn8GX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vJxqiZ1i' \
    > test.out 2>&1
eval_tap $? 24 'DeleteTier' test.out

#- 25 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'OzbAck6p' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FJp3ricT' \
    --body '{"newIndex": 82}' \
    > test.out 2>&1
eval_tap $? 25 'ReorderTier' test.out

#- 26 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'K3eVZDkR' \
    --force  \
    > test.out 2>&1
eval_tap $? 26 'UnpublishSeason' test.out

#- 27 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'oxa9t7kI' \
    --limit '94' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 27 'GetUserParticipatedSeasons' test.out

#- 28 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId '5fNcmSHM' \
    --body '{"exp": 88, "source": "PAID_FOR", "tags": ["xuXmnuqE", "rYsST5dE", "iPX60VYJ"]}' \
    > test.out 2>&1
eval_tap $? 28 'GrantUserExp' test.out

#- 29 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWTtXhhy' \
    --body '{"passCode": "pt8HjB4m", "passItemId": "y9pNEAsR"}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserPass' test.out

#- 30 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '7RoqZVjA' \
    --passCodes '6dUvW3x7,SAR4tMj9,1nhaFlSI' \
    > test.out 2>&1
eval_tap $? 30 'ExistsAnyPassByPassCodes' test.out

#- 31 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9pa4vJy' \
    > test.out 2>&1
eval_tap $? 31 'GetCurrentUserSeasonProgression' test.out

#- 32 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'M43EJUPi' \
    --body '{"passItemId": "Z7Emr2UK", "tierItemCount": 69, "tierItemId": "4PJrKQ4g"}' \
    > test.out 2>&1
eval_tap $? 32 'CheckSeasonPurchasable' test.out

#- 33 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'Brnox6Ml' \
    > test.out 2>&1
eval_tap $? 33 'ResetUserSeason' test.out

#- 34 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '6RD1gJKu' \
    --body '{"count": 59, "source": "PAID_FOR", "tags": ["iHgPXUt7", "xyOJCCKp", "pdd0gvFI"]}' \
    > test.out 2>&1
eval_tap $? 34 'GrantUserTier' test.out

#- 35 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bUPAqgle' \
    --from 'Bfa0CH7d' \
    --limit '52' \
    --offset '83' \
    --seasonId 'yvR5QPi2' \
    --source 'SWEAT' \
    --tags 'NMzjHA4K,EKNvsxTS,SagKxYU2' \
    --to 'jg9lKtP4' \
    > test.out 2>&1
eval_tap $? 35 'QueryUserExpGrantHistory' test.out

#- 36 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'vieUZyYd' \
    --seasonId 'IdNQSZWz' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistoryTag' test.out

#- 37 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ikcmp3Gx' \
    --userId 'vz4dai0S' \
    > test.out 2>&1
eval_tap $? 37 'GetUserSeason' test.out

#- 38 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'sXyFD3kc' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetCurrentSeason' test.out

#- 39 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'hCphCZ6q' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentUserSeason' test.out

#- 40 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'ck51l4I4' \
    --body '{"passCode": "RnuXJFUz", "rewardCode": "9SjXxGMx", "tierIndex": 66}' \
    > test.out 2>&1
eval_tap $? 40 'PublicClaimUserReward' test.out

#- 41 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'AfoO4b5P' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkClaimUserRewards' test.out

#- 42 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lrflifLi' \
    --userId 'dUf0Jp2A' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE