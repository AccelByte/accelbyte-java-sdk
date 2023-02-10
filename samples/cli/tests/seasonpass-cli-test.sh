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
    --limit '31' \
    --offset '86' \
    --status 'PUBLISHED,PUBLISHED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "JG4jX6Hy", "defaultRequiredExp": 20, "draftStoreId": "38j2oFy5", "end": "1973-10-10T00:00:00Z", "excessStrategy": {"currency": "356rq66R", "method": "CURRENCY", "percentPerExp": 66}, "images": [{"as": "dovubmE8", "caption": "tx02gfM1", "height": 99, "imageUrl": "n6jXeCeR", "smallImageUrl": "WJBd4yHa", "width": 87}, {"as": "35qqE7aL", "caption": "pX2UYLBT", "height": 83, "imageUrl": "XgxFl6qw", "smallImageUrl": "CJvAk2Rr", "width": 57}, {"as": "b33uxtYq", "caption": "pegi76bj", "height": 2, "imageUrl": "BIkGyfi6", "smallImageUrl": "PtiCOkak", "width": 70}], "localizations": {"X3Rno3nE": {"description": "Q55uaS17", "title": "uO6m2mOu"}, "7NLvWtzQ": {"description": "ARPWNAcd", "title": "3O2tw2l7"}, "KnMiWkaP": {"description": "sXSCUBss", "title": "X7glMdfP"}}, "name": "xRY0x9nh", "start": "1979-11-25T00:00:00Z", "tierItemId": "9MBY5zSb"}' \
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
    --body '{"userIds": ["qdfpXMMk", "rIPTj4Hv", "OG1QZulG"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vOz0arhO' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VcGcv06F' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Buaxs0pr' \
    --body '{"autoClaim": true, "defaultLanguage": "gKKbc9B6", "defaultRequiredExp": 35, "draftStoreId": "Sassl0dc", "end": "1980-03-10T00:00:00Z", "excessStrategy": {"currency": "MNJA3C5g", "method": "CURRENCY", "percentPerExp": 94}, "images": [{"as": "OZEMiH57", "caption": "JsQS9wSE", "height": 36, "imageUrl": "mtAyCfmK", "smallImageUrl": "RpqkIEPh", "width": 78}, {"as": "6Dqkr65G", "caption": "hH7dNio1", "height": 19, "imageUrl": "SUReve6K", "smallImageUrl": "9dfkYifz", "width": 88}, {"as": "hR5DAFcC", "caption": "Yxuwk0Od", "height": 47, "imageUrl": "SV7b2jdx", "smallImageUrl": "IPMsy1gP", "width": 34}], "localizations": {"oDeuTTCQ": {"description": "HxEUZJMr", "title": "5zo9JmrC"}, "qXfqPNv7": {"description": "Q5biDpU5", "title": "7sq1UO7Z"}, "OWK6TEd2": {"description": "GSw7muXz", "title": "ICpJHNVP"}}, "name": "rgkfLMC1", "start": "1998-09-28T00:00:00Z", "tierItemId": "8ivL501O"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zVUAV7Q5' \
    --body '{"end": "1999-10-11T00:00:00Z", "name": "U0gepN9g", "start": "1993-10-25T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5Atd0qeC' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'bj4iwHgK' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Oh09gh4l' \
    --body '{"autoEnroll": true, "code": "PHxEhpSO", "displayOrder": 100, "images": [{"as": "13mt5hfU", "caption": "i8wdUGfX", "height": 71, "imageUrl": "PKmvpgDo", "smallImageUrl": "qmgpAC3x", "width": 76}, {"as": "x1aua8Fg", "caption": "87vUwOqO", "height": 73, "imageUrl": "d3UNV4C1", "smallImageUrl": "Js4zwMjB", "width": 85}, {"as": "2sP2Je6P", "caption": "tVyOmLp2", "height": 42, "imageUrl": "Bkuo2kFO", "smallImageUrl": "DVpflXUg", "width": 81}], "localizations": {"ritGQI5a": {"description": "cnF9l1SX", "title": "qXx9kjYJ"}, "indZ949g": {"description": "YuvbXCwb", "title": "7L1QT5wc"}, "q5xO5Lbi": {"description": "5GPkWPuX", "title": "oJ7CvIcH"}}, "passItemId": "kWu2bC8g"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'u3qEF1lf' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cnRXd0QZ' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'zUMQwTa2' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aiAbE6oB' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'dH0HMxjO' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gDbG96xk' \
    --body '{"autoEnroll": true, "displayOrder": 0, "images": [{"as": "BuMe7cG7", "caption": "e0XmWrID", "height": 64, "imageUrl": "DaP0iSt7", "smallImageUrl": "1neZ0bWF", "width": 59}, {"as": "WmwesMiw", "caption": "eEmpM5Qt", "height": 64, "imageUrl": "1IQNsYo3", "smallImageUrl": "Xq36RZHr", "width": 50}, {"as": "oEkXhCku", "caption": "lOdQRgm9", "height": 67, "imageUrl": "B6C7ZcXR", "smallImageUrl": "bjl5rZYK", "width": 77}], "localizations": {"4Fn2KPQ3": {"description": "g9dKYZis", "title": "AhGR2bto"}, "ekR0IdXF": {"description": "8sQv2g3A", "title": "Yna6A0xt"}, "NlHRbsNq": {"description": "OJlFg0Jf", "title": "DFkwNNLY"}}, "passItemId": "ZRl4efAV"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5JQZDjTl' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DAfL4IP4' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wnzSUNk7' \
    --q 'S18SP9Ti' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AwMwkluj' \
    --body '{"code": "GmTdUqb3", "currency": {"currencyCode": "EnisFPhi", "namespace": "UQKxDeG2"}, "image": {"as": "Jo6gKvLo", "caption": "kH93aFSI", "height": 1, "imageUrl": "Zdd8TUO4", "smallImageUrl": "HLTOR8p2", "width": 27}, "itemId": "15ZdNZn1", "quantity": 67, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '8UmYBKhc' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9ecCYLRK' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'WjNRS64B' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BjWVvW46' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'KXM0YQuy' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UZXOH3Qb' \
    --body '{"currency": {"currencyCode": "ffo5z5gN", "namespace": "0OvAeZGw"}, "image": {"as": "XaSEgayY", "caption": "dQxpB5NB", "height": 13, "imageUrl": "ZmmViB8F", "smallImageUrl": "5yQPP3mn", "width": 96}, "itemId": "1PlqQS1m", "nullFields": ["gBEqElyX", "GHpZ1JIr", "kiWJsFqv"], "quantity": 78, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'MqFllo6p' \
    --limit '13' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'm6hk8rii' \
    --body '{"index": 38, "quantity": 82, "tier": {"requiredExp": 83, "rewards": {"1kYFSWB0": ["O6W5g1I0", "Iyrq9z10", "S0a5X5UO"], "elvQvWdg": ["8MfXxgKX", "JPzyNnAX", "EuSJtrJ0"], "JPbOyBOl": ["9MbdttLi", "1l3mCaC5", "L9CEh7Ns"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'l3xHmAhE' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AsEcxFcL' \
    --body '{"requiredExp": 81, "rewards": {"sGlNkxg0": ["HmrpPJ1a", "L5YpiMYR", "LmYtHe5w"], "xujEGFFk": ["qxzA9YBD", "qix3mBkM", "nl9sRswS"], "kjMUNqL1": ["tk73NzSQ", "b0O1PbqZ", "ZWNayVIB"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'HJ5upYqp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3en5g5FJ' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'UPRSdpjH' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'y0xycvqW' \
    --body '{"newIndex": 64}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1E59dwlv' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'JhRs08GB' \
    --limit '12' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'qLtVSpSR' \
    --body '{"exp": 4, "source": "PAID_FOR", "tags": ["E4l2leCo", "PImdSSlZ", "EewYdYno"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'MEOWCOot' \
    --body '{"passCode": "usg6rWvw", "passItemId": "TCoNlxTF"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'dFup9SaP' \
    --passCodes 'sKkTn1Wj,UxkQf0te,rGPROcdX' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'myb1z9EQ' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'zk8zflL2' \
    --body '{"passItemId": "JnHyp8RM", "tierItemCount": 1, "tierItemId": "L8hi3ZFe"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'SE1qW6cb' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'XjTR47GL' \
    --body '{"count": 56, "source": "SWEAT", "tags": ["DlReQrKJ", "g7pKlyGZ", "i8a0h6xx"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rwVLoaF3' \
    --from 'b5qDHAdI' \
    --limit '49' \
    --offset '68' \
    --seasonId 'FZHUjgVi' \
    --source 'PAID_FOR' \
    --tags 'LM1agqLR,fwgVHa0T,B21KcwgI' \
    --to 'XHkFu4cU' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId '056Cpwgm' \
    --seasonId 'E7hbC8eG' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8Hop62Fp' \
    --userId '0Zy7CEMG' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'RfJK9UUJ' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'xMaTZPRb' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'DqzcRPz6' \
    --body '{"passCode": "niZVlBd7", "rewardCode": "bouzUFBd", "tierIndex": 94}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'p8VKGNMW' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'es1XSAtg' \
    --userId 'apsh74Od' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE