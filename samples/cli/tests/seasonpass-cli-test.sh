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
    --limit '92' \
    --offset '8' \
    --status 'PUBLISHED,DRAFT,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "s8b7QYVN", "defaultRequiredExp": 2, "draftStoreId": "3a952Dgi", "end": "1979-10-11T00:00:00Z", "excessStrategy": {"currency": "w2TcWk7z", "method": "NONE", "percentPerExp": 55}, "images": [{"as": "AXxi9SZ5", "caption": "BACOQqwZ", "height": 87, "imageUrl": "2gnQylgs", "smallImageUrl": "PEuJ1FIJ", "width": 77}, {"as": "iE6rLjd5", "caption": "esnBM8r5", "height": 43, "imageUrl": "YSe7Vd1i", "smallImageUrl": "DhuqPeX0", "width": 85}, {"as": "OF2p0quN", "caption": "IXerAhpZ", "height": 24, "imageUrl": "QWUKxpNc", "smallImageUrl": "lIKD259q", "width": 72}], "localizations": {"YIspJPqt": {"description": "STBQrpi1", "title": "ozWjBhZd"}, "Sga89z0p": {"description": "PhEdjlkM", "title": "KT4ienRw"}, "STZcZy4j": {"description": "aL0SKM27", "title": "ydRZDKRF"}}, "name": "Vm6AKhyj", "start": "1990-06-26T00:00:00Z", "tierItemId": "gE7KqfVi"}' \
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
    --body '{"userIds": ["42W9Q0bM", "ISNjdVDo", "GzMQfUur"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3fAVeisp' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gyAdcHRr' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PkPZd4ZR' \
    --body '{"autoClaim": false, "defaultLanguage": "7euK0zdB", "defaultRequiredExp": 47, "draftStoreId": "CZ4X69Qw", "end": "1987-08-04T00:00:00Z", "excessStrategy": {"currency": "SXR22RX2", "method": "NONE", "percentPerExp": 68}, "images": [{"as": "nD6huVLA", "caption": "72uAzgpt", "height": 74, "imageUrl": "p5XM4dxZ", "smallImageUrl": "I2tHyuH2", "width": 23}, {"as": "dkjAUyCI", "caption": "AmHFJEbp", "height": 17, "imageUrl": "edxpSWkP", "smallImageUrl": "ZFjif3lp", "width": 17}, {"as": "nnsRW7aC", "caption": "HAqfWIE9", "height": 86, "imageUrl": "f60ai3gk", "smallImageUrl": "7Y5nvulD", "width": 47}], "localizations": {"ukUf0nPi": {"description": "Y3cZdeuJ", "title": "v61NWKZj"}, "JxwkF66V": {"description": "ge7OlFWW", "title": "5W14hKAE"}, "gMtHRYMM": {"description": "CModpPnr", "title": "YQyzYXgP"}}, "name": "CHCfVTFF", "start": "1989-05-22T00:00:00Z", "tierItemId": "YDLSH4nH"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oUSXoYMp' \
    --body '{"end": "1990-04-20T00:00:00Z", "name": "7kdSGwDU", "start": "1996-06-25T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'h1Q2spxl' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AM5IPEeY' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'y2lYZWZc' \
    --body '{"autoEnroll": false, "code": "aMXw9B7E", "displayOrder": 48, "images": [{"as": "0amP9t5u", "caption": "kxhxg3q5", "height": 57, "imageUrl": "hEp3MQXF", "smallImageUrl": "eJPJwTS0", "width": 0}, {"as": "N64eysZJ", "caption": "JttQV54U", "height": 96, "imageUrl": "JXBvm1HG", "smallImageUrl": "GlPT4UkD", "width": 58}, {"as": "csQNAXOb", "caption": "2iBeRroe", "height": 74, "imageUrl": "RGZmdSoR", "smallImageUrl": "i2ZovZjz", "width": 66}], "localizations": {"hIXUHnfm": {"description": "PGPUF23u", "title": "6O3mAUd7"}, "1SlhNT0q": {"description": "jqwQubxq", "title": "ACEbKH8z"}, "FJ2iqZol": {"description": "eTH5KcGW", "title": "rWjtWWlU"}}, "passItemId": "9Qfqdor3"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'J0UKL250' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2eIfV0QU' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'fPRrxUDC' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AUegaRCq' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code '8KClnuPW' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'FWPDtfdI' \
    --body '{"autoEnroll": true, "displayOrder": 66, "images": [{"as": "Lu8F30mc", "caption": "Meqjz6WE", "height": 19, "imageUrl": "HHBX6Z42", "smallImageUrl": "maWiy8Os", "width": 32}, {"as": "n6GQ4kS6", "caption": "1btKgwvs", "height": 46, "imageUrl": "ZhsSUBHI", "smallImageUrl": "FfrJrKbK", "width": 14}, {"as": "jnksymLl", "caption": "OehSY01d", "height": 11, "imageUrl": "wXzFRLOA", "smallImageUrl": "Nwnm8F8A", "width": 77}], "localizations": {"9CnefltM": {"description": "8l10yZbl", "title": "hiSj9xN4"}, "AHoMrtn4": {"description": "g9D31a9s", "title": "zfvSyaGJ"}, "iOPbf9nf": {"description": "BpiHv73r", "title": "JGls0K3j"}}, "passItemId": "npLfD5gt"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jOtBDfWf' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'G6Ye0WxW' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'eXLHjsQm' \
    --q 'EfLhHNA2' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Bbc8n7Js' \
    --body '{"code": "Vj2RPm9Q", "currency": {"currencyCode": "y67nrv9l", "namespace": "a2Np4Pvj"}, "image": {"as": "MAoyNCb0", "caption": "8oIkL5Vi", "height": 35, "imageUrl": "TuZWbNyQ", "smallImageUrl": "sYu24iIU", "width": 52}, "itemId": "Wfyl1Ml5", "quantity": 26, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '4kEztIs1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TL9AAOlC' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'j7R7Nt4D' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2IykfuMk' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'OAxODFob' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DmxVJEmm' \
    --body '{"currency": {"currencyCode": "gKvgqLhU", "namespace": "2iFil4oo"}, "image": {"as": "pzQQdZhM", "caption": "cKtX8vRD", "height": 28, "imageUrl": "AQySYUIl", "smallImageUrl": "oFEPSUo9", "width": 71}, "itemId": "St7wdnct", "nullFields": ["nLtWjDez", "e0gtoAj4", "4CoOVnc5"], "quantity": 95, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'jG49NkEc' \
    --limit '81' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'agukAP89' \
    --body '{"index": 99, "quantity": 85, "tier": {"requiredExp": 80, "rewards": {"5qBzffV5": ["3aZQUnb1", "HJcrowJz", "p8TuTdCM"], "bk2NbTgB": ["Y8mX6Qu2", "KWOcVaFG", "WNAyRrbM"], "eK7nmOBW": ["y1ydFz0X", "4kCpwkSb", "GPEqKE3C"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'VBjNalwX' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qXGHYFxO' \
    --body '{"requiredExp": 62, "rewards": {"vcZV8L17": ["FBNImjwm", "zboTIeuS", "0myLGJib"], "fiqwXy28": ["rlKR6ISr", "h90DlyMG", "dQVjct5R"], "lYNztx0L": ["ClsDOCTT", "Zow4wATX", "sxKqYBSs"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '33ppVEpN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ko5UNnZl' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'RGcQCvzm' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Iet1yK4Q' \
    --body '{"newIndex": 12}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'y6yfHt89' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'JCNQ5C55' \
    --limit '99' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'IuGSvWBV' \
    --body '{"exp": 47, "source": "SWEAT", "tags": ["R5EiJrV6", "LOQuM61W", "TPaQzyzq"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '6hcpYyGq' \
    --body '{"passCode": "7gdpGH1G", "passItemId": "MRgVIEul"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'dt6LbSMr' \
    --passCodes 'Fk00tSPQ,wx6GvizG,Rq8nLOoj' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'NnI0Byh1' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'wswLksM7' \
    --body '{"passItemId": "Sw5ZOjOu", "tierItemCount": 59, "tierItemId": "goOEzFdy"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'UteUZtTP' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ff2Tf4kB' \
    --body '{"count": 25, "source": "PAID_FOR", "tags": ["ZNoy2NHV", "Z35ehm2A", "lbSIRe5V"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'NysQpsAE' \
    --from 'sdothACx' \
    --limit '52' \
    --offset '12' \
    --seasonId 'Uo8hTtO3' \
    --source 'SWEAT' \
    --tags '1EYvvywC,l6FZokk8,WqlFiCca' \
    --to 'j4VBpYTR' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '616PIJg4' \
    --seasonId '54ynXork' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fS9abG0r' \
    --userId 'bBJYlPW5' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'k4kywC04' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'jnBrlJIh' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'BBCpKhan' \
    --body '{"passCode": "UkEWf5fP", "rewardCode": "wg68X4R7", "tierIndex": 11}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'y5mQTny5' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ycJXlxmr' \
    --userId 'p5RTLV0I' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE