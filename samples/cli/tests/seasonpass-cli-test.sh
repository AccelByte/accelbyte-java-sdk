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
    --limit '95' \
    --offset '93' \
    --status 'PUBLISHED", "PUBLISHED", "RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "H20tvpje", "defaultRequiredExp": 79, "draftStoreId": "5wChqWus", "end": "1984-08-12T00:00:00Z", "excessStrategy": {"currency": "HF9AhdxR", "method": "NONE", "percentPerExp": 24}, "images": [{"as": "tlrkDgRh", "caption": "cBqzv0aU", "height": 27, "imageUrl": "Y7kvpevL", "smallImageUrl": "WF7F2cun", "width": 83}, {"as": "sDgxzNXF", "caption": "1n44upP6", "height": 2, "imageUrl": "EUNo5rBB", "smallImageUrl": "d7TBxnKV", "width": 68}, {"as": "xEY04YZ9", "caption": "n0UV6G3g", "height": 81, "imageUrl": "rl0VkWbw", "smallImageUrl": "aWEdkddf", "width": 39}], "localizations": {"hj1EpshL": {"description": "VPgpUFt7", "title": "V8JSc4XX"}, "45j97c4q": {"description": "I70aSyms", "title": "FsLmyd5o"}, "9FC2APDn": {"description": "wUJEEbLO", "title": "YHsPI7zn"}}, "name": "gA5dUTR1", "start": "1973-05-04T00:00:00Z", "tierItemId": "d6Fnl6WD"}' \
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
    --seasonId 'QSJvpVCZ' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qTaGjDXh' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PtXTdkSp' \
    --body '{"autoClaim": true, "defaultLanguage": "YXHj6bG1", "defaultRequiredExp": 45, "draftStoreId": "jf3YX9cO", "end": "1986-04-08T00:00:00Z", "excessStrategy": {"currency": "pokuhQ3s", "method": "CURRENCY", "percentPerExp": 12}, "images": [{"as": "LoUUr5Ph", "caption": "nBO4dVJb", "height": 54, "imageUrl": "lPy5luqP", "smallImageUrl": "PTQFRG12", "width": 41}, {"as": "ucWvKyVa", "caption": "sFql30Lf", "height": 48, "imageUrl": "yvmFfmQr", "smallImageUrl": "pZKfunKi", "width": 28}, {"as": "6w677b9a", "caption": "vLSWVc1o", "height": 99, "imageUrl": "35mdY1dA", "smallImageUrl": "7td9DuNS", "width": 82}], "localizations": {"Ow9UztMF": {"description": "3LeDoFhp", "title": "NjzmW9jh"}, "QiCGy5dl": {"description": "yhvgeAOK", "title": "yidXwC8b"}, "oKe13Cz2": {"description": "KBJjiLOo", "title": "e4hkcy7L"}}, "name": "uVXMPKhN", "start": "1992-03-05T00:00:00Z", "tierItemId": "KMiL2Dbt"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3VJ5oySa' \
    --body '{"end": "1991-08-18T00:00:00Z", "name": "p2qA8srU", "start": "1975-02-17T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wW2z4UtF' \
    > test.out 2>&1
eval_tap $? 9 'QueryPasses' test.out

#- 10 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NFOo1brZ' \
    --body '{"autoEnroll": true, "code": "VfKYEeej", "displayOrder": 23, "images": [{"as": "CQQB2tbT", "caption": "Ew9E9FQG", "height": 53, "imageUrl": "HeX0KRUK", "smallImageUrl": "1rnXdbfi", "width": 51}, {"as": "lZN5UC6a", "caption": "d92gbpaE", "height": 5, "imageUrl": "LQ6Ja41g", "smallImageUrl": "BGFJmrKr", "width": 70}, {"as": "k2j9pu2D", "caption": "a9AFfBVC", "height": 49, "imageUrl": "woShGC6A", "smallImageUrl": "e2V2h5Q0", "width": 8}], "localizations": {"4K8EEZnr": {"description": "6cCN3m3C", "title": "zLTM3VCv"}, "9objGKHp": {"description": "cgVgp3zf", "title": "yiSBiof8"}, "unyltBvY": {"description": "MQiItOTt", "title": "ZjXM1Cbj"}}, "passItemId": "xCFC4UhT"}' \
    > test.out 2>&1
eval_tap $? 10 'CreatePass' test.out

#- 11 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'aQXfawOh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8kZrt8gy' \
    > test.out 2>&1
eval_tap $? 11 'GetPass' test.out

#- 12 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'svkYsdiw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mDIiF7S8' \
    > test.out 2>&1
eval_tap $? 12 'DeletePass' test.out

#- 13 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'f78LSME0' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'R1BgrTwF' \
    --body '{"autoEnroll": true, "displayOrder": 45, "images": [{"as": "WPwQsy2s", "caption": "kTHQs2h4", "height": 59, "imageUrl": "Qin4fWut", "smallImageUrl": "fSkdUClp", "width": 43}, {"as": "tezW2YXS", "caption": "4F9ltfuh", "height": 99, "imageUrl": "omrewBpD", "smallImageUrl": "tyqqxuno", "width": 91}, {"as": "GHSoaHt9", "caption": "2XS6t0hY", "height": 84, "imageUrl": "UGTcrlVS", "smallImageUrl": "Arsd2wx3", "width": 81}], "localizations": {"skI1Hd3Q": {"description": "Z7B2o7Xx", "title": "nZhVvGwQ"}, "cgdKblYx": {"description": "LjwUW3kD", "title": "1zFr4Bzn"}, "TjRg429V": {"description": "6Bgi3P8n", "title": "9qtcGWVl"}}, "passItemId": "kibCzw3L"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePass' test.out

#- 14 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IO9LbUSZ' \
    > test.out 2>&1
eval_tap $? 14 'PublishSeason' test.out

#- 15 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'L0HMrRa1' \
    --force  \
    > test.out 2>&1
eval_tap $? 15 'RetireSeason' test.out

#- 16 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NRMPQozQ' \
    --q 'QHjYgCrM' \
    > test.out 2>&1
eval_tap $? 16 'QueryRewards' test.out

#- 17 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pzieJgWe' \
    --body '{"code": "L0p3Bif3", "currency": {"currencyCode": "y1zuAp77", "namespace": "9Ocd5Pop"}, "image": {"as": "pO2WgjBC", "caption": "Zp5Ii9yI", "height": 12, "imageUrl": "TwLaIoIS", "smallImageUrl": "B6zrugTJ", "width": 22}, "itemId": "bG3TIwcb", "quantity": 32, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateReward' test.out

#- 18 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'F6xDPhDS' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AKKgP1T2' \
    > test.out 2>&1
eval_tap $? 18 'GetReward' test.out

#- 19 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'qFF1tA4X' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pN0PI5jk' \
    > test.out 2>&1
eval_tap $? 19 'DeleteReward' test.out

#- 20 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code '6XJci0uN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gPjT65JE' \
    --body '{"currency": {"currencyCode": "JTTTfy3c", "namespace": "T3uU4Kmj"}, "image": {"as": "eCGB3VkN", "caption": "N6TJ2ZMz", "height": 97, "imageUrl": "akQuX3Gc", "smallImageUrl": "mYGNSEfl", "width": 93}, "itemId": "wtZAkPOe", "nullFields": ["ciWqTxb6", "1tSCXYMp", "wPZjVYeJ"], "quantity": 39, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateReward' test.out

#- 21 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4bDsRJus' \
    --limit '43' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 21 'QueryTiers' test.out

#- 22 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'muNqjvkl' \
    --body '{"index": 6, "quantity": 61, "tier": {"requiredExp": 39, "rewards": {"aKID7zKc": ["MZKLfJNk", "k6nmAbtF", "fAZWBf89"], "iFvNu0P8": ["MNyFlYD6", "qstV0Rlp", "4ZWp4OBe"], "98jb6dwE": ["0rOZtDzV", "EQlAhSVf", "1Ya8m0Ml"]}}}' \
    > test.out 2>&1
eval_tap $? 22 'CreateTier' test.out

#- 23 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'E16thWwe' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YD7f7lwE' \
    --body '{"requiredExp": 7, "rewards": {"bi4P9nDW": ["UO0X326x", "ia0T4Sie", "QcZdzRop"], "SGAspFjM": ["CvOdYata", "X9mFnKMp", "SGit3D7l"], "icPS8NV1": ["5iFSXHAC", "wOSDBxsf", "SKb7egYA"]}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateTier' test.out

#- 24 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '2NHd7Pyl' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rd4eS2SG' \
    > test.out 2>&1
eval_tap $? 24 'DeleteTier' test.out

#- 25 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'lakQGXCd' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YlRiehuV' \
    --body '{"newIndex": 85}' \
    > test.out 2>&1
eval_tap $? 25 'ReorderTier' test.out

#- 26 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5W2e9dqz' \
    --force  \
    > test.out 2>&1
eval_tap $? 26 'UnpublishSeason' test.out

#- 27 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kwy09L5l' \
    --limit '92' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 27 'GetUserParticipatedSeasons' test.out

#- 28 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'TsxHWWfu' \
    --body '{"exp": 19, "source": "PAID_FOR", "tags": ["5fzNeOtn", "zyp7rbqR", "G4925Gp7"]}' \
    > test.out 2>&1
eval_tap $? 28 'GrantUserExp' test.out

#- 29 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'szmiZBBq' \
    --body '{"passCode": "sqXll1eH", "passItemId": "gUNUNb0c"}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserPass' test.out

#- 30 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId '1MXWtBET' \
    --passCodes 'C6620mOH", "KZQdx3Rr", "tAX5AZwQ' \
    > test.out 2>&1
eval_tap $? 30 'ExistsAnyPassByPassCodes' test.out

#- 31 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'ygSJ6VTX' \
    > test.out 2>&1
eval_tap $? 31 'GetCurrentUserSeasonProgression' test.out

#- 32 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '0ER4Sfnu' \
    --body '{"passItemId": "BWEJqkMB", "tierItemCount": 35, "tierItemId": "nENsTZxs"}' \
    > test.out 2>&1
eval_tap $? 32 'CheckSeasonPurchasable' test.out

#- 33 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '6Ojz8ZrO' \
    > test.out 2>&1
eval_tap $? 33 'ResetUserSeason' test.out

#- 34 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '89a5UNcp' \
    --body '{"count": 94, "source": "PAID_FOR", "tags": ["Il7B6EYp", "eVSPcFPf", "jQOniFGd"]}' \
    > test.out 2>&1
eval_tap $? 34 'GrantUserTier' test.out

#- 35 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'WKVthPv5' \
    --from '6vhNeDaS' \
    --limit '13' \
    --offset '96' \
    --seasonId 'lm2BkQKg' \
    --source 'SWEAT' \
    --tags 'tQw9COnj", "p3yRnZBA", "WqZOgKsN' \
    --to '8HVoCzpI' \
    > test.out 2>&1
eval_tap $? 35 'QueryUserExpGrantHistory' test.out

#- 36 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'cll3tTDn' \
    --seasonId 'qZ0hCSxl' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistoryTag' test.out

#- 37 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CweDvNrR' \
    --userId 'MbDcFpV5' \
    > test.out 2>&1
eval_tap $? 37 'GetUserSeason' test.out

#- 38 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'sxku4MAG' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetCurrentSeason' test.out

#- 39 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'JB6aJ67C' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentUserSeason' test.out

#- 40 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId '8xcphW4t' \
    --body '{"passCode": "aK7ZLjQI", "rewardCode": "ODMz9wpk", "tierIndex": 95}' \
    > test.out 2>&1
eval_tap $? 40 'PublicClaimUserReward' test.out

#- 41 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'jhdKBYjq' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkClaimUserRewards' test.out

#- 42 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'tnfBzPVv' \
    --userId '4dlM0mWT' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE