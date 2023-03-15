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
    --limit '62' \
    --offset '39' \
    --status 'PUBLISHED,PUBLISHED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "CA9kPI6L", "defaultRequiredExp": 69, "draftStoreId": "rkq6Dc09", "end": "1977-12-28T00:00:00Z", "excessStrategy": {"currency": "IW0Oaiw9", "method": "NONE", "percentPerExp": 36}, "images": [{"as": "0D7eHpzS", "caption": "n3ZPUdc0", "height": 35, "imageUrl": "Ra62WopB", "smallImageUrl": "JHPtcDs8", "width": 2}, {"as": "6I56IaRD", "caption": "BXxyaNoM", "height": 89, "imageUrl": "bQ1g7qbP", "smallImageUrl": "ngUNB1vR", "width": 29}, {"as": "xwElFHHd", "caption": "gs21Jub7", "height": 98, "imageUrl": "CUkNmKJf", "smallImageUrl": "h5pUkHOD", "width": 32}], "localizations": {"FcDtgOjc": {"description": "hIua5tWE", "title": "IC32ogW7"}, "olvbTgrh": {"description": "RTcPiSuL", "title": "0Sly6XM4"}, "OI18mAQL": {"description": "nzjMf8GZ", "title": "2WBZqxYG"}}, "name": "3aREAu2D", "start": "1974-12-17T00:00:00Z", "tierItemId": "T5FvdiRi"}' \
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
    --body '{"userIds": ["lZ7oFgx4", "c8OumKtP", "DKJDXn7Z"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4U68su8X' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fqlqNiTv' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'B6SdAdIh' \
    --body '{"autoClaim": true, "defaultLanguage": "DrwoZ5Me", "defaultRequiredExp": 4, "draftStoreId": "Xpc1C8Xf", "end": "1982-01-03T00:00:00Z", "excessStrategy": {"currency": "HuKeb9l3", "method": "NONE", "percentPerExp": 67}, "images": [{"as": "mXhzkzWk", "caption": "FeZSoEAc", "height": 57, "imageUrl": "0P7MIIR7", "smallImageUrl": "CkyF6C7d", "width": 41}, {"as": "miTqpyhP", "caption": "FdxLzFQN", "height": 23, "imageUrl": "5MYzYiKW", "smallImageUrl": "e5dNRljv", "width": 66}, {"as": "IPrDQQRg", "caption": "at0SevkL", "height": 66, "imageUrl": "YnIuMBva", "smallImageUrl": "O35llzQR", "width": 0}], "localizations": {"bsx5w8hq": {"description": "UI06UpOX", "title": "GSLmCVuH"}, "OPlLlkvR": {"description": "8sKgnuRk", "title": "gghGoYup"}, "D391C2qt": {"description": "PYokahFj", "title": "kQsfCaTm"}}, "name": "t1d67FXG", "start": "1976-11-07T00:00:00Z", "tierItemId": "s9Q0mPVo"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3twu0Mes' \
    --body '{"end": "1994-10-10T00:00:00Z", "name": "Cf9x4rt6", "start": "1998-03-30T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'laRlxfcj' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HfYakUCT' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qGkE7wcW' \
    --body '{"autoEnroll": false, "code": "aLqYSYWy", "displayOrder": 40, "images": [{"as": "AXQ0yYoN", "caption": "RKd3IL5T", "height": 54, "imageUrl": "GiHPllG4", "smallImageUrl": "cYEzfTD1", "width": 6}, {"as": "Bm3MqHcU", "caption": "mLZZbSqb", "height": 41, "imageUrl": "RwNmn9Hr", "smallImageUrl": "NQy4uZAA", "width": 18}, {"as": "tIuS5S5X", "caption": "UdjsoqwG", "height": 49, "imageUrl": "EdscKHPE", "smallImageUrl": "qgA8yu7V", "width": 22}], "localizations": {"Tr1DmrhZ": {"description": "v15T7quI", "title": "OvBMcaYm"}, "vCkGZ5dA": {"description": "gqxpBFma", "title": "Loxozr6w"}, "fNPX2bOI": {"description": "tRMvqtlB", "title": "2jJCSQT2"}}, "passItemId": "79ZZPYGu"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '0rdlgdWy' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OtXi3cho' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'QrpOsDBU' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5SepjChB' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code '3V0v52Dl' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ym6puQ23' \
    --body '{"autoEnroll": true, "displayOrder": 66, "images": [{"as": "oJ8aeCna", "caption": "LpUKp44Y", "height": 96, "imageUrl": "6foWvXa3", "smallImageUrl": "bMrXsDr6", "width": 22}, {"as": "oyIPa8ZR", "caption": "rvjj7il3", "height": 4, "imageUrl": "MXbN9oCM", "smallImageUrl": "Nqq98SjT", "width": 45}, {"as": "IxjUkl53", "caption": "5X3ateEK", "height": 60, "imageUrl": "UC9b6i5l", "smallImageUrl": "ZC9xv32e", "width": 30}], "localizations": {"c5csSovo": {"description": "qsZNBdte", "title": "9NDUPVJf"}, "6c2Z0QZx": {"description": "fgPubTDI", "title": "HrvqAThu"}, "wjRHpKKT": {"description": "lmVr9Xuo", "title": "JbRFQSKV"}}, "passItemId": "PHbn4Xxt"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'u7LQRENj' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EEztx1Ws' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YSiZqan0' \
    --q 'nSBJroav' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '91GXlvPG' \
    --body '{"code": "6bFYReVH", "currency": {"currencyCode": "QipcCx9Z", "namespace": "w5D2L7vI"}, "image": {"as": "YhGGSyEW", "caption": "4ZJJ42d3", "height": 85, "imageUrl": "mhgo5QB6", "smallImageUrl": "5lSAiYnN", "width": 20}, "itemId": "lxqMrj3o", "quantity": 3, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'LdLsFzHk' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BMr1yrOM' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'lNFSrUEi' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rnjX9fDm' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'IbeZxzfT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cyiuATus' \
    --body '{"currency": {"currencyCode": "9hsfpFDc", "namespace": "SDG8aMVG"}, "image": {"as": "LiBNrDjq", "caption": "oxcwgGLX", "height": 32, "imageUrl": "cekdqCt8", "smallImageUrl": "1P1ktfIo", "width": 44}, "itemId": "eIP6rOvD", "nullFields": ["RByjlBiu", "2k6YmJFf", "z9KOsb39"], "quantity": 65, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3FIoVk8T' \
    --limit '84' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FAAMwzHP' \
    --body '{"index": 48, "quantity": 33, "tier": {"requiredExp": 55, "rewards": {"g2SCnqnt": ["X9y1aZSW", "MiVi10sG", "6vxkfUcm"], "qRRbceJ5": ["i0EeDxOg", "BnhhqElI", "aDml48wd"], "NFLTm5T5": ["0x9WT0Gf", "H2rtOa4E", "XsXzOXQA"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'k4mqrxzT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tuLl4Xlb' \
    --body '{"requiredExp": 67, "rewards": {"9gIiDand": ["pGT2t24a", "OMh5eC3I", "HeHSKLCa"], "3xreNDUW": ["ehwH3q31", "A806DJga", "s4b6z3LN"], "Uj7fdgLA": ["84Z8YYk6", "QEgJjBbE", "DoNf3n0h"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'EoRCAcf8' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0zfFyabW' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'AgIUXiI0' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7A68eaqC' \
    --body '{"newIndex": 4}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'J9jyEW6G' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lbc0NaKD' \
    --limit '95' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'L3sa13lk' \
    --body '{"exp": 51, "source": "PAID_FOR", "tags": ["ih3bit0V", "Wn3CO39P", "XDNxtXge"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3FgkXhj' \
    --body '{"passCode": "DzaQY3sn", "passItemId": "n2ZkP7cF"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'dP43e5dC' \
    --passCodes '9XIBudfZ,grbHDIDm,4hMzF4Tx' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'odenSrUT' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'vfqU0bfo' \
    --body '{"passItemId": "Mm5cTtFW", "tierItemCount": 3, "tierItemId": "Z3c46IjG"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'a23YvYmm' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dg7VYPXI' \
    --body '{"count": 41, "source": "SWEAT", "tags": ["VxsZNere", "Svf9699m", "CEHThUJk"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ETAsSp7g' \
    --from 'h4TeUTkO' \
    --limit '21' \
    --offset '53' \
    --seasonId 'j0ZwsVC0' \
    --source 'PAID_FOR' \
    --tags 't4Tv207Y,2QD3oD5f,LCr3OOlX' \
    --to 'Vv8ZGF7u' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'YnGzpipN' \
    --seasonId 'DigNJma1' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MbqqZtfN' \
    --userId 'Wql4nmwA' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'ft4gqkNN' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'lWkD9eOz' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'iYRFOn0j' \
    --body '{"passCode": "JLHC9Lxh", "rewardCode": "vNXTwGBC", "tierIndex": 41}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'CQLfl7MU' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BG7qtPu6' \
    --userId '4yAtURKL' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE