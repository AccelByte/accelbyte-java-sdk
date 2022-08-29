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
    --limit '54' \
    --offset '22' \
    --status 'RETIRED,PUBLISHED,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "598NqUV6", "defaultRequiredExp": 27, "draftStoreId": "PQBJHFES", "end": "1973-08-22T00:00:00Z", "excessStrategy": {"currency": "XQx137Ze", "method": "NONE", "percentPerExp": 29}, "images": [{"as": "Sry9XkXC", "caption": "n4XVWxTv", "height": 63, "imageUrl": "5AC88PmH", "smallImageUrl": "6WYNARHP", "width": 91}, {"as": "seKKEuZX", "caption": "AaFjA08d", "height": 54, "imageUrl": "UQjX81N5", "smallImageUrl": "MVUCLmyW", "width": 74}, {"as": "tfeWI1X6", "caption": "DTNnhgvC", "height": 33, "imageUrl": "qPfB27wh", "smallImageUrl": "2BMtWQ93", "width": 54}], "localizations": {"mYVYjqh7": {"description": "Ckxh8l49", "title": "GAyEmi5T"}, "3jCedgPp": {"description": "EEij1qXQ", "title": "osyBXMgy"}, "dOyFM0Fp": {"description": "PQO9O3sS", "title": "rcwJaiQT"}}, "name": "KIs5XskJ", "start": "1983-10-18T00:00:00Z", "tierItemId": "o5lnKupX"}' \
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
    --seasonId 'BXtIZ306' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AijjdmgI' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EAYJ0GKE' \
    --body '{"autoClaim": false, "defaultLanguage": "IK4Et2aL", "defaultRequiredExp": 5, "draftStoreId": "djkz8kBy", "end": "1985-03-18T00:00:00Z", "excessStrategy": {"currency": "Raf8a4eu", "method": "CURRENCY", "percentPerExp": 16}, "images": [{"as": "feg84rZx", "caption": "QR2TNuUV", "height": 26, "imageUrl": "kiiTrQBH", "smallImageUrl": "iS1rIyqG", "width": 59}, {"as": "qSNVK0au", "caption": "7HpTHxMS", "height": 54, "imageUrl": "q3sVCJVS", "smallImageUrl": "7jN6aHaE", "width": 29}, {"as": "6haidKoi", "caption": "jhMQADfR", "height": 3, "imageUrl": "Cn06Ty6z", "smallImageUrl": "00Z0hGMa", "width": 76}], "localizations": {"elcIH4oG": {"description": "fjboeVb7", "title": "uy4RWtNr"}, "ooKchkkJ": {"description": "voWuzlY4", "title": "uADrYVbq"}, "gAzv9Xk6": {"description": "tuTIT2BQ", "title": "RRt6kaZm"}}, "name": "diKfkMIy", "start": "1986-03-26T00:00:00Z", "tierItemId": "vz7SvTeW"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dTjR97ko' \
    --body '{"end": "1982-09-14T00:00:00Z", "name": "GW6fILab", "start": "1994-01-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BA9UTJQP' \
    > test.out 2>&1
eval_tap $? 9 'GetFullSeason' test.out

#- 10 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'GotzU8ot' \
    > test.out 2>&1
eval_tap $? 10 'QueryPasses' test.out

#- 11 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9jtICV5o' \
    --body '{"autoEnroll": true, "code": "eHcuG5X5", "displayOrder": 25, "images": [{"as": "VjYQkMrB", "caption": "FHXd6HgL", "height": 44, "imageUrl": "5fFYKSMA", "smallImageUrl": "IGiNAqfw", "width": 45}, {"as": "pH4cByn2", "caption": "dFO3z5x8", "height": 55, "imageUrl": "OnHilH4E", "smallImageUrl": "WLxBUSxT", "width": 76}, {"as": "0CGMMhJ8", "caption": "COvfOiRU", "height": 10, "imageUrl": "uXvzu9SY", "smallImageUrl": "TAJZ2j9H", "width": 45}], "localizations": {"lfuMAdJv": {"description": "JKuROrko", "title": "HtrBf6Ej"}, "iloFmHB0": {"description": "CbZH3f67", "title": "OOHLvkYH"}, "Tw7X7KFf": {"description": "bEgFwnSt", "title": "azMdglLP"}}, "passItemId": "kGkmsBLf"}' \
    > test.out 2>&1
eval_tap $? 11 'CreatePass' test.out

#- 12 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'EsQ5lv5l' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OZjAOZDy' \
    > test.out 2>&1
eval_tap $? 12 'GetPass' test.out

#- 13 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'HPBdsgTD' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SqNv7Orr' \
    > test.out 2>&1
eval_tap $? 13 'DeletePass' test.out

#- 14 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'lOjZesIa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'YHHbXAuS' \
    --body '{"autoEnroll": true, "displayOrder": 10, "images": [{"as": "NGVoGE7z", "caption": "E0xnVk5V", "height": 14, "imageUrl": "FrBo7XDh", "smallImageUrl": "M2V1Azkv", "width": 40}, {"as": "a2cW7jkS", "caption": "g7EWo6mH", "height": 43, "imageUrl": "AsBHoQPq", "smallImageUrl": "8VX2QTmr", "width": 28}, {"as": "hrjVY3Rs", "caption": "DH6jJCk9", "height": 13, "imageUrl": "jVaCpDn3", "smallImageUrl": "Ic6Q6cKX", "width": 74}], "localizations": {"blDQHmQT": {"description": "g9oL6W9r", "title": "LNOg9IeU"}, "hUA9o97p": {"description": "etW3GvWL", "title": "Rt57dwVG"}, "86hBc815": {"description": "ekqD4ZZC", "title": "feOfipv4"}}, "passItemId": "YARHH58m"}' \
    > test.out 2>&1
eval_tap $? 14 'UpdatePass' test.out

#- 15 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'XqkEBr30' \
    > test.out 2>&1
eval_tap $? 15 'PublishSeason' test.out

#- 16 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'k9Ogv374' \
    --force  \
    > test.out 2>&1
eval_tap $? 16 'RetireSeason' test.out

#- 17 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AGtvCLrh' \
    --q 'xhU5MfjM' \
    > test.out 2>&1
eval_tap $? 17 'QueryRewards' test.out

#- 18 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DfOHJkQ6' \
    --body '{"code": "qTtcUbU3", "currency": {"currencyCode": "AuaZ3Qtf", "namespace": "yFuxFgo5"}, "image": {"as": "d7HJgJwN", "caption": "dwfO79PM", "height": 5, "imageUrl": "yE5aQPPO", "smallImageUrl": "i1rZjDtH", "width": 92}, "itemId": "6TC39QK2", "quantity": 6, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateReward' test.out

#- 19 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'lFCAzVuR' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3IuEhdCy' \
    > test.out 2>&1
eval_tap $? 19 'GetReward' test.out

#- 20 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '8Vjbx1OT' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'O8udB2QV' \
    > test.out 2>&1
eval_tap $? 20 'DeleteReward' test.out

#- 21 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'ssJnIbXr' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JB6qLqGE' \
    --body '{"currency": {"currencyCode": "oZRO43io", "namespace": "HZtCDTVj"}, "image": {"as": "bNlbmeLM", "caption": "0Vz4KqhI", "height": 22, "imageUrl": "PPpUUjkc", "smallImageUrl": "c2OW1eNg", "width": 57}, "itemId": "HWoMpqR7", "nullFields": ["9byc10hO", "ffq9FSIn", "TyzZ9DSr"], "quantity": 96, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateReward' test.out

#- 22 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OMoA4V0w' \
    --limit '56' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 22 'QueryTiers' test.out

#- 23 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QXtBZmIl' \
    --body '{"index": 1, "quantity": 41, "tier": {"requiredExp": 71, "rewards": {"yOqEcrqR": ["0OmUV055", "dsoStVsj", "3TJzdWYr"], "7p9pG5KY": ["NBoCt6Zo", "PvgZ8U5I", "f0qUxAqK"], "csXadJIW": ["1Xhobh36", "XGKtDatm", "pozPL6De"]}}}' \
    > test.out 2>&1
eval_tap $? 23 'CreateTier' test.out

#- 24 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'coj2EmHS' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'er8yMWnh' \
    --body '{"requiredExp": 26, "rewards": {"EhEB3pVR": ["yE0k2VvX", "A3X7NEMb", "dmePCUpI"], "U8Q1jtLk": ["M91a8eup", "n1ebuyFm", "m68pySFE"], "OH5KZZCL": ["fdWrbSlY", "cWS0afB5", "ukLUQzou"]}}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateTier' test.out

#- 25 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'um5N0VPh' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JnVCwZoH' \
    > test.out 2>&1
eval_tap $? 25 'DeleteTier' test.out

#- 26 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'WsxtUlVk' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dMJ1zSKU' \
    --body '{"newIndex": 37}' \
    > test.out 2>&1
eval_tap $? 26 'ReorderTier' test.out

#- 27 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EuX9Giqw' \
    --force  \
    > test.out 2>&1
eval_tap $? 27 'UnpublishSeason' test.out

#- 28 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'NnWXK05P' \
    --limit '70' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 28 'GetUserParticipatedSeasons' test.out

#- 29 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'NkJot7e4' \
    --body '{"exp": 80, "source": "SWEAT", "tags": ["tejGAq3o", "7WtWoats", "OFps4gJc"]}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserExp' test.out

#- 30 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'UYtreeD0' \
    --body '{"passCode": "GyobeL34", "passItemId": "UEdHO8Il"}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserPass' test.out

#- 31 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xmjx7lwW' \
    --passCodes 'v33hI5DH,RWHYcien,EDwIJBXg' \
    > test.out 2>&1
eval_tap $? 31 'ExistsAnyPassByPassCodes' test.out

#- 32 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'dCLywsMw' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentUserSeasonProgression' test.out

#- 33 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'bkTozuer' \
    --body '{"passItemId": "dUZAak3K", "tierItemCount": 73, "tierItemId": "ByQSuF7Q"}' \
    > test.out 2>&1
eval_tap $? 33 'CheckSeasonPurchasable' test.out

#- 34 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'xgMSfXJd' \
    > test.out 2>&1
eval_tap $? 34 'ResetUserSeason' test.out

#- 35 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'GJ04UMH7' \
    --body '{"count": 7, "source": "PAID_FOR", "tags": ["SEgjSGwW", "5lhTa9F4", "PCxj2sMz"]}' \
    > test.out 2>&1
eval_tap $? 35 'GrantUserTier' test.out

#- 36 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bQuLWiqE' \
    --from 'yM8astsj' \
    --limit '31' \
    --offset '9' \
    --seasonId 'QcB5vII1' \
    --source 'PAID_FOR' \
    --tags 'z2o2JOvI,ON3hMFdn,EkOBWP5M' \
    --to 'ZKhJ1yOF' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistory' test.out

#- 37 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '3338mUiF' \
    --seasonId 'fTbSFP5l' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistoryTag' test.out

#- 38 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EZV99KZP' \
    --userId 'LOMIGww4' \
    > test.out 2>&1
eval_tap $? 38 'GetUserSeason' test.out

#- 39 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'EwPSUQdz' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentSeason' test.out

#- 40 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTkEBzwi' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentUserSeason' test.out

#- 41 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q6qGH6bm' \
    --body '{"passCode": "DlYXoMZu", "rewardCode": "MExbLqne", "tierIndex": 88}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserReward' test.out

#- 42 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'nvuWukb5' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkClaimUserRewards' test.out

#- 43 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cmXiBe0H' \
    --userId 'p21J1WtS' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE