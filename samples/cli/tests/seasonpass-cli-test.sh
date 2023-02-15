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
    --limit '48' \
    --offset '31' \
    --status 'RETIRED,DRAFT,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "zYeKNqaz", "defaultRequiredExp": 60, "draftStoreId": "MnQMANcI", "end": "1973-07-24T00:00:00Z", "excessStrategy": {"currency": "IJUHHtqQ", "method": "CURRENCY", "percentPerExp": 11}, "images": [{"as": "c5cKROnR", "caption": "IPh4NTeJ", "height": 93, "imageUrl": "FxLlfKuQ", "smallImageUrl": "bZXyOwqv", "width": 46}, {"as": "OtEH8Rxq", "caption": "wZMzsLbR", "height": 65, "imageUrl": "VcxrS8TX", "smallImageUrl": "GstQ1i7B", "width": 87}, {"as": "Tppyvgtp", "caption": "3KIxO4sB", "height": 52, "imageUrl": "x5Lrpx4I", "smallImageUrl": "9hKBFgzM", "width": 18}], "localizations": {"8B1CvRmh": {"description": "atnPASOJ", "title": "lT8ZuAy7"}, "lJAwBA6f": {"description": "Iren5wD3", "title": "5rzY0CQE"}, "8SFy2z14": {"description": "iEkrePww", "title": "BPRwicA8"}}, "name": "wrUqE1Xx", "start": "1976-01-13T00:00:00Z", "tierItemId": "CG0L0y3r"}' \
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
    --body '{"userIds": ["QV4ngyv1", "iu4qy4lf", "Lcqc87Zo"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IxX2Mwgv' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kj3O82YM' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4itlEaqX' \
    --body '{"autoClaim": true, "defaultLanguage": "cayBrZ0C", "defaultRequiredExp": 6, "draftStoreId": "qD3r5o1a", "end": "1999-09-28T00:00:00Z", "excessStrategy": {"currency": "y6kBkWxs", "method": "CURRENCY", "percentPerExp": 26}, "images": [{"as": "YnENVjKS", "caption": "Byz2kxo0", "height": 15, "imageUrl": "jNMe4h6L", "smallImageUrl": "5oIiDmcf", "width": 8}, {"as": "qO35BFnc", "caption": "zl4Ea9UR", "height": 25, "imageUrl": "QUOx7bzH", "smallImageUrl": "T9iDuT6n", "width": 60}, {"as": "ul8tHuk9", "caption": "ILrZKVKT", "height": 48, "imageUrl": "tE2F25zU", "smallImageUrl": "1Ky6PYBM", "width": 7}], "localizations": {"d8o5KIw4": {"description": "O0jD5RGe", "title": "yO4RbcWk"}, "pG0Fhpy3": {"description": "WmFuYQ9I", "title": "gDMbsggv"}, "VVUXmhhy": {"description": "sO9nEIKO", "title": "nqBh3hVe"}}, "name": "jr3orXkY", "start": "1976-04-02T00:00:00Z", "tierItemId": "KBzxmrLL"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZzuhAFZh' \
    --body '{"end": "1995-04-14T00:00:00Z", "name": "2yEuX8lB", "start": "1995-12-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fSvF1hJI' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HY6QQa4D' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'X80W9bSw' \
    --body '{"autoEnroll": true, "code": "WX4Ab3rH", "displayOrder": 73, "images": [{"as": "7DxNyXcN", "caption": "VR86OeV9", "height": 27, "imageUrl": "Dfhp0435", "smallImageUrl": "7JjmF88v", "width": 100}, {"as": "QKbrF26E", "caption": "KSc34Rwe", "height": 56, "imageUrl": "QCGNVqBU", "smallImageUrl": "Tma030vu", "width": 38}, {"as": "2m1PobjR", "caption": "0H8VTkPI", "height": 75, "imageUrl": "NiwZny61", "smallImageUrl": "ofRCUZDS", "width": 91}], "localizations": {"XxpD53DA": {"description": "URH54SxG", "title": "6Npd6h9U"}, "YYSxr57s": {"description": "tUGMkqI1", "title": "a1O1LAx2"}, "rQCtmSxu": {"description": "B7ahbXSD", "title": "hj8VHDNL"}}, "passItemId": "n1Aj8tqX"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'a5BOBGPs' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RuhgBLgJ' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code '79TkD4lH' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5yrUNoGu' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'lU3g2uNs' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '00ptFCis' \
    --body '{"autoEnroll": true, "displayOrder": 98, "images": [{"as": "u25GSvSR", "caption": "bSg8DrJj", "height": 38, "imageUrl": "3C75IBy0", "smallImageUrl": "J5BuBkbY", "width": 48}, {"as": "Yl4b457U", "caption": "5eDvTjOx", "height": 25, "imageUrl": "GyJzms9j", "smallImageUrl": "MQSIkWnd", "width": 5}, {"as": "kaqTIYqr", "caption": "ZFkh0nZm", "height": 91, "imageUrl": "OSYTTzpV", "smallImageUrl": "JQpEsiQO", "width": 8}], "localizations": {"dQSoa5ks": {"description": "XyUCAD4E", "title": "vpWmQzpL"}, "XFYeBcju": {"description": "e1RHOAQG", "title": "NHdLfAh0"}, "i0oIRjUE": {"description": "agzPJcUF", "title": "eg3HaNfY"}}, "passItemId": "NVaTkQzL"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qAd3SMNE' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'f85uVHLq' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'I4NQmRR1' \
    --q 'kmBpgYB0' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0JWcW8TD' \
    --body '{"code": "sTEn0s6g", "currency": {"currencyCode": "lp8IwNEU", "namespace": "VU6xumyT"}, "image": {"as": "FJ09Nc3u", "caption": "1nyXjMWd", "height": 86, "imageUrl": "mJePNgvp", "smallImageUrl": "qqHrmwgl", "width": 68}, "itemId": "ulxrckMn", "quantity": 47, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'fGgtscF0' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'IpUMEzZm' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '2SfQc64Z' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oArX5rvR' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'WTdDfi1b' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '6Khq6ivo' \
    --body '{"currency": {"currencyCode": "zQ4IvYAM", "namespace": "dMlURd5x"}, "image": {"as": "7Mcpp0Lq", "caption": "nkAvOUOa", "height": 51, "imageUrl": "suwzBOIl", "smallImageUrl": "obcKhd2S", "width": 97}, "itemId": "0YrnwfAK", "nullFields": ["Iakvwfsu", "gIWKicny", "a7nUipqc"], "quantity": 14, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wji8J0mD' \
    --limit '57' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'w23oQSxw' \
    --body '{"index": 88, "quantity": 87, "tier": {"requiredExp": 94, "rewards": {"7ojix4JO": ["5sckaAgm", "ArKzci0g", "g7aPCiQ2"], "3LLBGhhE": ["dPJb4E81", "O5XTHowb", "HRPIwrWg"], "Lethsko1": ["3FoZbH8x", "x5ZPHfzD", "iybrW4Eq"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'SS9cag0Z' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ILHnDx3n' \
    --body '{"requiredExp": 6, "rewards": {"kHidMv3l": ["gQ1hrqSl", "VJ8Gxbbj", "x9Xn0bzK"], "k5qpKErE": ["wArUN8up", "2cNuZc3Z", "xPahvLF5"], "zhbISbL9": ["JTkWL7Re", "52n1D6bo", "k9lqxei0"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'Wjgg3YEa' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mQ4Msy3H' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '5TjSm1k4' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Hev7Qmoy' \
    --body '{"newIndex": 24}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '69aRJN5F' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'p6cxhXUV' \
    --limit '89' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'JOXisoqc' \
    --body '{"exp": 20, "source": "SWEAT", "tags": ["DT3nfodE", "5nghpLux", "RHST2nUz"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '7raxxr73' \
    --body '{"passCode": "F5fmjCpI", "passItemId": "pvYeQ9Gq"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'fKzPN5GD' \
    --passCodes 'Ai3TjfRM,8depFFAN,0Y4nnWJv' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '8fxQD4q0' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '56TeE1cL' \
    --body '{"passItemId": "Sybj5tmk", "tierItemCount": 5, "tierItemId": "sWvd1Y6V"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '5FwHad1Q' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '1sypqVb4' \
    --body '{"count": 61, "source": "PAID_FOR", "tags": ["yYX4t2kl", "lrGTDEbT", "c1bDBCRr"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'xJOjTpVg' \
    --from 'sAS4A8i7' \
    --limit '84' \
    --offset '74' \
    --seasonId 'eSotclm9' \
    --source 'SWEAT' \
    --tags 'djhjYFxo,TfWqzxB3,PqFKuW7j' \
    --to 'vJR7nP6X' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'eSPwi81o' \
    --seasonId '8sYfPFpx' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uHhuItID' \
    --userId 'jsII2WgG' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'qaufJhNE' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'FrH3AA8c' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId '55wksV1r' \
    --body '{"passCode": "yinfIKW4", "rewardCode": "thWMP8KR", "tierIndex": 47}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'nlrIJ5oz' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7eNVCFDw' \
    --userId 'jXmbOt4N' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE