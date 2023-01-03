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
    --limit '87' \
    --offset '21' \
    --status 'PUBLISHED,DRAFT,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "icifnsqW", "defaultRequiredExp": 43, "draftStoreId": "xZr4D5fE", "end": "1974-07-29T00:00:00Z", "excessStrategy": {"currency": "iZm8ZKVd", "method": "CURRENCY", "percentPerExp": 16}, "images": [{"as": "fvCPLRt9", "caption": "DRpewVQj", "height": 28, "imageUrl": "WYk0Vwhm", "smallImageUrl": "rziu3Ggl", "width": 37}, {"as": "jo2tlEee", "caption": "w3zbCb1n", "height": 45, "imageUrl": "nxEifjeI", "smallImageUrl": "6zE9wAxC", "width": 1}, {"as": "1GgoOhnp", "caption": "pzWV0ydD", "height": 100, "imageUrl": "EbZC4tt0", "smallImageUrl": "55LanuUI", "width": 3}], "localizations": {"meR4awW0": {"description": "eZkOizZh", "title": "RKY4ae4A"}, "pykE3kY5": {"description": "03qCScXf", "title": "nWqnhltR"}, "TFOR6kxw": {"description": "1Hh9sd5G", "title": "k6X6U5nH"}}, "name": "znBvVEqn", "start": "1985-01-06T00:00:00Z", "tierItemId": "Pbkm4WWn"}' \
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
    --body '{"userIds": ["dsBODYED", "Jzy1b4Wn", "lP3mgscR"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RwB0xcvY' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZsRGnIfI' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ONa71dv1' \
    --body '{"autoClaim": true, "defaultLanguage": "4T5Tprr0", "defaultRequiredExp": 36, "draftStoreId": "T458iVxY", "end": "1988-12-12T00:00:00Z", "excessStrategy": {"currency": "qSUunPnl", "method": "NONE", "percentPerExp": 56}, "images": [{"as": "UgA9KQsY", "caption": "qTXaQw3j", "height": 63, "imageUrl": "9LGJzXKP", "smallImageUrl": "lgw0e7JV", "width": 44}, {"as": "tQpl0ao9", "caption": "XwVAqlXK", "height": 64, "imageUrl": "e6InDGBp", "smallImageUrl": "QS3KFUFl", "width": 3}, {"as": "qpW675Gv", "caption": "W2YgzFgp", "height": 94, "imageUrl": "X9YxLk57", "smallImageUrl": "2UTc9ots", "width": 62}], "localizations": {"SSwHxIGR": {"description": "AIxzkpyI", "title": "lQBWdbWy"}, "rFHDZ6kp": {"description": "fRrLJMaW", "title": "xxuOoUDa"}, "vIH2Vh62": {"description": "oaX4dyeX", "title": "5RLZfHFP"}}, "name": "auAmIfbj", "start": "1990-05-30T00:00:00Z", "tierItemId": "RxSgSCwO"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gihTVbmJ' \
    --body '{"end": "1990-05-12T00:00:00Z", "name": "o2XP7jAp", "start": "1998-03-16T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3QBXbjTm' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId '629O4LZi' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mhJbs7QQ' \
    --body '{"autoEnroll": false, "code": "FXJtOeZX", "displayOrder": 82, "images": [{"as": "jiL0uF2f", "caption": "SwBsMORy", "height": 76, "imageUrl": "65CdJNKV", "smallImageUrl": "LN5JD0Hx", "width": 65}, {"as": "mign4Fn5", "caption": "F1Z8DFXW", "height": 20, "imageUrl": "2iAakVWE", "smallImageUrl": "DK4zxhxT", "width": 42}, {"as": "ng10FUV6", "caption": "7giLwtQY", "height": 100, "imageUrl": "8iNdcwZG", "smallImageUrl": "iF7lirYQ", "width": 90}], "localizations": {"WXkj801O": {"description": "L1pfO7fN", "title": "qcIbJfaT"}, "wqg1y3AA": {"description": "6ZniVqRw", "title": "9zP15Rgz"}, "Kw2CSLGF": {"description": "vB7RnMLO", "title": "OvaeL4b9"}}, "passItemId": "Bts61P2k"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'vBzPWDyF' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WUUsvMBK' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'XRCy2V36' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uMq5rFYE' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'PXBsua3G' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vRRO2fIk' \
    --body '{"autoEnroll": true, "displayOrder": 79, "images": [{"as": "KjgO5NQt", "caption": "btFb5xZf", "height": 92, "imageUrl": "02IoHtQK", "smallImageUrl": "si8qDlja", "width": 1}, {"as": "gE6uh1Rg", "caption": "DMdc4eIP", "height": 55, "imageUrl": "99NMQz3Z", "smallImageUrl": "9566TDGM", "width": 95}, {"as": "6bdGv5EB", "caption": "BbtJjqN7", "height": 93, "imageUrl": "IGvuSI6X", "smallImageUrl": "bg9aHwHR", "width": 8}], "localizations": {"YhVWENdq": {"description": "1sSz0iRb", "title": "5f681zlg"}, "IUKQRmTu": {"description": "9kJhZ3ED", "title": "QdWgUnrp"}, "AOUAtrTI": {"description": "xBgwMpBM", "title": "vUiw0GGt"}}, "passItemId": "aJBdbhBM"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AhiVspUn' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lx7IkXAT' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'm8Ps4pgo' \
    --q 'Pn6ijwN4' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GQ0HKSZy' \
    --body '{"code": "jlvAgbCd", "currency": {"currencyCode": "5kqDzv2g", "namespace": "vBpqLTsV"}, "image": {"as": "ls5c6Jks", "caption": "ixCiQCs7", "height": 86, "imageUrl": "FmhZjFAF", "smallImageUrl": "VJFcEt2A", "width": 19}, "itemId": "clI3Upri", "quantity": 39, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'MMBZKhkY' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oPlcc3mY' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '5B2LHReI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oMSlQKz6' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '8FAlGnGZ' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WIrm41RW' \
    --body '{"currency": {"currencyCode": "9Tluetrz", "namespace": "FLifMZsH"}, "image": {"as": "QPvFA5Na", "caption": "zEtAxFxg", "height": 47, "imageUrl": "Ih32NPuV", "smallImageUrl": "ReEozRFe", "width": 22}, "itemId": "gKs2Ecl3", "nullFields": ["9lb35MFq", "7RLyXkq1", "7HIJFCDP"], "quantity": 14, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vCAP6trJ' \
    --limit '91' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kXen5rdL' \
    --body '{"index": 12, "quantity": 7, "tier": {"requiredExp": 50, "rewards": {"alOziMv0": ["on6iZv0C", "2iX4VW43", "ppQauhuN"], "cG4yorCo": ["EQuKKbWE", "pmIno831", "rKbcFbtD"], "8vBRKeyN": ["R2SLuCTx", "mirzONqb", "McD3Tl0X"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'Bm5hQzcR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dCV3nS39' \
    --body '{"requiredExp": 72, "rewards": {"RtCTrT9X": ["kfIcruc6", "jNeUlDE5", "FEAy2xbf"], "etekUwT2": ["MJSgI44P", "KPpacYCR", "COrGcbJE"], "uJ48TxBr": ["Qn1sYrvS", "t0EBKIQm", "STqSjzk1"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'smtKcos6' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aUUrdBca' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'a47IGJ7F' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RGVAQiGt' \
    --body '{"newIndex": 69}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fwyW1ULF' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'FWd3JOMj' \
    --limit '53' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'bzLD7HMk' \
    --body '{"exp": 93, "source": "PAID_FOR", "tags": ["cRD48YyP", "6ZwyPTC4", "2qp8LVHE"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'do0vi5Vf' \
    --body '{"passCode": "7XpPqknD", "passItemId": "ASA5oqHU"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '9hVltSrd' \
    --passCodes 'vn0pNRTY,kmYutUtw,yoUkNXNb' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'r6kXwp8f' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'jyZBtOeh' \
    --body '{"passItemId": "fkYvARMG", "tierItemCount": 51, "tierItemId": "ROwF4S85"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'PXA4WAX8' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'MbqzrTvE' \
    --body '{"count": 63, "source": "PAID_FOR", "tags": ["C4Dyzmlx", "mtBq4Mag", "vVebpMyw"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'gsUh0CLW' \
    --from '2FdCUpEY' \
    --limit '40' \
    --offset '43' \
    --seasonId 'bawlyf5q' \
    --source 'PAID_FOR' \
    --tags 'vWuZFtp4,abc2PUnt,WGlrFn69' \
    --to 'jJznJehf' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'RdhyzoX0' \
    --seasonId 'RL3jnR6O' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tzQAf4JY' \
    --userId 'iloj256s' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'kg9dkfGP' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'o4U8lXhr' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'pvx6uod3' \
    --body '{"passCode": "EdkR5fHV", "rewardCode": "wRKeMOf5", "tierIndex": 87}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'wCplFtOF' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'k3k8Qbaz' \
    --userId 'NAgqZt8h' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE