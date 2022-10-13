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
    --limit '52' \
    --offset '71' \
    --status 'RETIRED,RETIRED,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "1mGPYf7s", "defaultRequiredExp": 60, "draftStoreId": "ZDd9ETJj", "end": "1976-11-26T00:00:00Z", "excessStrategy": {"currency": "fqOmIaAz", "method": "NONE", "percentPerExp": 54}, "images": [{"as": "M3NXDsYs", "caption": "f78iLhkJ", "height": 56, "imageUrl": "UqjdOqHD", "smallImageUrl": "8dQCXCks", "width": 91}, {"as": "ULH2SzMC", "caption": "HHfmICxi", "height": 71, "imageUrl": "JiGkubVT", "smallImageUrl": "gOdqwsJy", "width": 31}, {"as": "DMM7NRzi", "caption": "uCHYiZoE", "height": 50, "imageUrl": "1qDFJLd6", "smallImageUrl": "5jayaF2U", "width": 43}], "localizations": {"ODCwfRQF": {"description": "9Fhs9JEa", "title": "QgDlto32"}, "8tHeBJIU": {"description": "amw9fvAo", "title": "LP6J3JNA"}, "wJtCGJ07": {"description": "Wtj3pLyf", "title": "WZ30pomd"}}, "name": "YlYUrP3G", "start": "1995-11-14T00:00:00Z", "tierItemId": "tC0dR1k8"}' \
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
    --seasonId 'oGtLQlLZ' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1gthpjD4' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KwIx1kOv' \
    --body '{"autoClaim": true, "defaultLanguage": "9NwlvF75", "defaultRequiredExp": 54, "draftStoreId": "jamIT6rk", "end": "1987-01-09T00:00:00Z", "excessStrategy": {"currency": "1qbzlqrK", "method": "NONE", "percentPerExp": 56}, "images": [{"as": "XmS4G8Wd", "caption": "y7r2J8K3", "height": 70, "imageUrl": "G7H4K27c", "smallImageUrl": "M8Xc13co", "width": 78}, {"as": "Dro3OebB", "caption": "4METmzgu", "height": 86, "imageUrl": "e6Vfi7JA", "smallImageUrl": "xQ9VSo6j", "width": 0}, {"as": "4kwAUaPC", "caption": "ljCtPAo5", "height": 72, "imageUrl": "ghGs2Iik", "smallImageUrl": "BbVYrQWS", "width": 93}], "localizations": {"kGyXS6Tz": {"description": "CyNeDSaz", "title": "CKybhvrH"}, "zjdQg5mA": {"description": "UA2GYDAV", "title": "gIzLIUia"}, "2viln1Ec": {"description": "BfGknMYv", "title": "2cXfQQtL"}}, "name": "OyC5XdCa", "start": "1990-12-13T00:00:00Z", "tierItemId": "lhCmiV5A"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HHw7Qqv5' \
    --body '{"end": "1999-03-19T00:00:00Z", "name": "126uY86B", "start": "1978-12-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nzhDpJGN' \
    > test.out 2>&1
eval_tap $? 9 'GetFullSeason' test.out

#- 10 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId '79rdZTOI' \
    > test.out 2>&1
eval_tap $? 10 'QueryPasses' test.out

#- 11 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fbzHbBck' \
    --body '{"autoEnroll": true, "code": "wyLz0rzR", "displayOrder": 35, "images": [{"as": "pwIpacNN", "caption": "BFrWJZka", "height": 34, "imageUrl": "gWTf4Wdz", "smallImageUrl": "LME4vbVr", "width": 20}, {"as": "iLTzZ1LG", "caption": "LTMvK0kb", "height": 29, "imageUrl": "Ug4OfDlj", "smallImageUrl": "ZM07GkOz", "width": 96}, {"as": "BTzjcrdB", "caption": "2RWw1nlf", "height": 10, "imageUrl": "tjmMXM9m", "smallImageUrl": "FF49QomF", "width": 96}], "localizations": {"qkKhyuRw": {"description": "IIZEtHDS", "title": "9T1lmOgB"}, "rmxFoToX": {"description": "0CnUh8zn", "title": "o8mPoV2i"}, "AkFQMXZS": {"description": "DGuILc06", "title": "AfOJ3MTL"}}, "passItemId": "y8BUT7ok"}' \
    > test.out 2>&1
eval_tap $? 11 'CreatePass' test.out

#- 12 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'ADcppNqm' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Aln2ZFsD' \
    > test.out 2>&1
eval_tap $? 12 'GetPass' test.out

#- 13 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'SUQWWa43' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vPwTEpsK' \
    > test.out 2>&1
eval_tap $? 13 'DeletePass' test.out

#- 14 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'Pxo1evjb' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EzCCAxuI' \
    --body '{"autoEnroll": false, "displayOrder": 34, "images": [{"as": "yeczYvAG", "caption": "kKDs4Qvr", "height": 37, "imageUrl": "Ao0q2lfY", "smallImageUrl": "SjoaUZpg", "width": 36}, {"as": "1fLF8E1O", "caption": "PGvfVFzA", "height": 27, "imageUrl": "2ldEuNzx", "smallImageUrl": "DlpM8wzk", "width": 45}, {"as": "cOcblXap", "caption": "dBDXRfG3", "height": 53, "imageUrl": "RMhlXAQQ", "smallImageUrl": "GH3ViAGT", "width": 31}], "localizations": {"OaPSYjMs": {"description": "aT38Kowe", "title": "5FgkZf3B"}, "BVIy0SV1": {"description": "8IKd9UAd", "title": "SoCFVI9q"}, "uNInAbxO": {"description": "D4PPKcN8", "title": "arAHnVqO"}}, "passItemId": "syjNUwPN"}' \
    > test.out 2>&1
eval_tap $? 14 'UpdatePass' test.out

#- 15 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3DZleqRr' \
    > test.out 2>&1
eval_tap $? 15 'PublishSeason' test.out

#- 16 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vAzAD1II' \
    --force  \
    > test.out 2>&1
eval_tap $? 16 'RetireSeason' test.out

#- 17 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'B5ZbP0So' \
    --q '28eqC9Gy' \
    > test.out 2>&1
eval_tap $? 17 'QueryRewards' test.out

#- 18 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'W0c5eE24' \
    --body '{"code": "IzWStaUL", "currency": {"currencyCode": "KnTuwsav", "namespace": "YuSyouDg"}, "image": {"as": "yAbrYP9x", "caption": "puH015mC", "height": 62, "imageUrl": "byNXpVmN", "smallImageUrl": "RaXDpTqK", "width": 15}, "itemId": "tdYmgcWJ", "quantity": 12, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateReward' test.out

#- 19 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'eoXao4Wy' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '86kj0Cqy' \
    > test.out 2>&1
eval_tap $? 19 'GetReward' test.out

#- 20 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'udsX2HKX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nmPPWTiS' \
    > test.out 2>&1
eval_tap $? 20 'DeleteReward' test.out

#- 21 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ji4Ctb9R' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rGvjnKOP' \
    --body '{"currency": {"currencyCode": "28FL7N8Q", "namespace": "VB34OaPZ"}, "image": {"as": "RJfmIuTb", "caption": "N20NkrKs", "height": 19, "imageUrl": "uhEwx7Ii", "smallImageUrl": "QQUY7RwK", "width": 62}, "itemId": "DotNTN9H", "nullFields": ["9CQ2Vr9P", "Wt1iUhAI", "KXwTizmZ"], "quantity": 64, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateReward' test.out

#- 22 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'nRaC9eNo' \
    --limit '84' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 22 'QueryTiers' test.out

#- 23 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '87f6npGH' \
    --body '{"index": 25, "quantity": 47, "tier": {"requiredExp": 3, "rewards": {"xyzLzxwy": ["lZa5dUdq", "jnQheFJx", "DRWgnwLV"], "id584q4I": ["QUM1h2bz", "cmeVojR8", "XG5PiLPh"], "sdVhuyw0": ["AYIBy9Sa", "OSGD5zPN", "wWprPIhs"]}}}' \
    > test.out 2>&1
eval_tap $? 23 'CreateTier' test.out

#- 24 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'aDrDVbQK' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3yWumr1p' \
    --body '{"requiredExp": 27, "rewards": {"uV10Dut9": ["HE8FTzHn", "PFkSysSi", "TxcrJ4FB"], "yxAxqUD3": ["MdTHtm4z", "AxvQgAwE", "eWqUmwFD"], "4czZQCZD": ["MQEr6jkT", "UaqOjLnf", "wPXLC4It"]}}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateTier' test.out

#- 25 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'JPYnfBUT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xVXLq7fP' \
    > test.out 2>&1
eval_tap $? 25 'DeleteTier' test.out

#- 26 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'rI4GtQnj' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'T1rOT88s' \
    --body '{"newIndex": 54}' \
    > test.out 2>&1
eval_tap $? 26 'ReorderTier' test.out

#- 27 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1PnBy6Lh' \
    --force  \
    > test.out 2>&1
eval_tap $? 27 'UnpublishSeason' test.out

#- 28 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'dDgTMUE9' \
    --limit '17' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 28 'GetUserParticipatedSeasons' test.out

#- 29 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'dNuX6eRs' \
    --body '{"exp": 15, "source": "PAID_FOR", "tags": ["EL8nYzXo", "5VH6Ly3j", "PYVBvHY8"]}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserExp' test.out

#- 30 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '3Wcnfw6y' \
    --body '{"passCode": "LOCM2f2D", "passItemId": "MgGEK2Ni"}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserPass' test.out

#- 31 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'QMmSnjlg' \
    --passCodes 'zDqLezlU,mrSHD9lP,VoxM0wlq' \
    > test.out 2>&1
eval_tap $? 31 'ExistsAnyPassByPassCodes' test.out

#- 32 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'cFcdGTdL' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentUserSeasonProgression' test.out

#- 33 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'hZlAzOLj' \
    --body '{"passItemId": "ekz5zkzj", "tierItemCount": 7, "tierItemId": "YdZ8thct"}' \
    > test.out 2>&1
eval_tap $? 33 'CheckSeasonPurchasable' test.out

#- 34 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'RghfFxUK' \
    > test.out 2>&1
eval_tap $? 34 'ResetUserSeason' test.out

#- 35 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'RsXsSxBd' \
    --body '{"count": 23, "source": "SWEAT", "tags": ["u9b8s3UO", "o01Kd1NF", "3Fb8k2sB"]}' \
    > test.out 2>&1
eval_tap $? 35 'GrantUserTier' test.out

#- 36 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '65ywe1nx' \
    --from '7Qo1jYSw' \
    --limit '23' \
    --offset '34' \
    --seasonId 'G8zuFelI' \
    --source 'SWEAT' \
    --tags 'L5uLCI7T,ra87YoOp,C3MwjFyp' \
    --to 'Us2qfGtn' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistory' test.out

#- 37 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'VyAtmvkj' \
    --seasonId 'f7B26ePr' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistoryTag' test.out

#- 38 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LxYQABuu' \
    --userId 'UX78Ae6x' \
    > test.out 2>&1
eval_tap $? 38 'GetUserSeason' test.out

#- 39 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'm8pDVGp8' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentSeason' test.out

#- 40 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '6SwZ7T1m' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentUserSeason' test.out

#- 41 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'O2mzWW9y' \
    --body '{"passCode": "il4Q1YoE", "rewardCode": "fxOvyjOP", "tierIndex": 42}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserReward' test.out

#- 42 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'bSvjo1gU' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkClaimUserRewards' test.out

#- 43 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A72CkKfZ' \
    --userId 'nRo41Cou' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE