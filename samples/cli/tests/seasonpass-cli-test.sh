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
    --offset '56' \
    --status 'DRAFT,PUBLISHED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "0BM6yqzR", "defaultRequiredExp": 86, "draftStoreId": "rkUSAJAV", "end": "1975-09-19T00:00:00Z", "excessStrategy": {"currency": "yvtVpE6n", "method": "NONE", "percentPerExp": 4}, "images": [{"as": "3QmmYx5a", "caption": "ykWXsH7m", "height": 84, "imageUrl": "tcgblKkn", "smallImageUrl": "kercK2bv", "width": 100}, {"as": "19Y140E5", "caption": "0mskg97r", "height": 3, "imageUrl": "tPSlu4YL", "smallImageUrl": "uEx3d9OC", "width": 48}, {"as": "nAyHrMZk", "caption": "qKZmIsiL", "height": 91, "imageUrl": "BlP7r8Be", "smallImageUrl": "sThlvxYM", "width": 38}], "localizations": {"TXXaImvB": {"description": "vFK7iBoi", "title": "bCnaDy7z"}, "wpQoLD0H": {"description": "iUeQ9p0L", "title": "8d0eJcNJ"}, "qVTcguip": {"description": "UY3myndp", "title": "lYRKH279"}}, "name": "P0od7Sut", "start": "1993-10-02T00:00:00Z", "tierItemId": "4b01SU2i"}' \
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
    --seasonId 'AX1VEHp8' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Ezq1o3bO' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'buWgzOF5' \
    --body '{"autoClaim": false, "defaultLanguage": "c6nQc6iz", "defaultRequiredExp": 79, "draftStoreId": "UUthZfnn", "end": "1992-12-23T00:00:00Z", "excessStrategy": {"currency": "edDrGw5m", "method": "CURRENCY", "percentPerExp": 48}, "images": [{"as": "5DsCEnqY", "caption": "WFI8Q65M", "height": 34, "imageUrl": "QddJP32o", "smallImageUrl": "PQaaQSCT", "width": 29}, {"as": "DHzc0v43", "caption": "3qnU8ovQ", "height": 46, "imageUrl": "K6L65c8j", "smallImageUrl": "uN6CLr61", "width": 63}, {"as": "tTvxkoRA", "caption": "1fudp5Ja", "height": 61, "imageUrl": "0R5gizWy", "smallImageUrl": "KwVxrAdi", "width": 22}], "localizations": {"h922DtED": {"description": "O3y7YKPT", "title": "1gFMpWQC"}, "3p3AWgXP": {"description": "bPQT7tAD", "title": "gg8PDMa8"}, "vCxew3u6": {"description": "iN7tfZUO", "title": "RLXoQPRz"}}, "name": "P7I2vDSx", "start": "1987-10-24T00:00:00Z", "tierItemId": "6I1ry24t"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8T17OYiG' \
    --body '{"end": "1983-07-11T00:00:00Z", "name": "8yfogxnm", "start": "1971-08-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ypB1G0hN' \
    > test.out 2>&1
eval_tap $? 9 'GetFullSeason' test.out

#- 10 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TngA4wiS' \
    > test.out 2>&1
eval_tap $? 10 'QueryPasses' test.out

#- 11 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'V6JhmUeV' \
    --body '{"autoEnroll": false, "code": "yvb3TQfC", "displayOrder": 95, "images": [{"as": "DNCtYaRx", "caption": "cEo8yqy6", "height": 7, "imageUrl": "ehNua0wD", "smallImageUrl": "xNWNQy2z", "width": 68}, {"as": "81qnWODF", "caption": "r1bnmXSH", "height": 16, "imageUrl": "L7wwL5B9", "smallImageUrl": "p3pYczU2", "width": 38}, {"as": "1LLLoNt7", "caption": "QI9pDPsk", "height": 68, "imageUrl": "4iKuAsvV", "smallImageUrl": "bZ2vvFXS", "width": 64}], "localizations": {"GDNxMhoS": {"description": "rgFF4ywj", "title": "DLXGfPsJ"}, "DCDsC5Ie": {"description": "1oXWvVTb", "title": "stcGFTAh"}, "5udOp2Hy": {"description": "b61HxMbn", "title": "nlYxYZNS"}}, "passItemId": "loDppjQu"}' \
    > test.out 2>&1
eval_tap $? 11 'CreatePass' test.out

#- 12 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'W39RF8Io' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fkrzJAeO' \
    > test.out 2>&1
eval_tap $? 12 'GetPass' test.out

#- 13 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'KwxfJMQI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fcyRrsUY' \
    > test.out 2>&1
eval_tap $? 13 'DeletePass' test.out

#- 14 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'AdTiUmaw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'T6onKGJj' \
    --body '{"autoEnroll": true, "displayOrder": 28, "images": [{"as": "CGkahT1B", "caption": "P2H2Fmfs", "height": 24, "imageUrl": "gujKwqGv", "smallImageUrl": "zC2HC04q", "width": 2}, {"as": "CvCHbRcl", "caption": "fSNSk2Jt", "height": 73, "imageUrl": "fhLyGPX6", "smallImageUrl": "pBrXfZV5", "width": 79}, {"as": "CyHpu1Dn", "caption": "frDu0Fhj", "height": 15, "imageUrl": "qpiGNKQY", "smallImageUrl": "G2X2Oo17", "width": 44}], "localizations": {"ynJ3Yz6V": {"description": "7Gmx8rfv", "title": "pOGeZ0m9"}, "mBUOgwo0": {"description": "BHoE2eFF", "title": "by0JSjfL"}, "DWohhyqp": {"description": "JU8kTJeY", "title": "u6iLqpkF"}}, "passItemId": "RgiWgbmP"}' \
    > test.out 2>&1
eval_tap $? 14 'UpdatePass' test.out

#- 15 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KHXGx25Z' \
    > test.out 2>&1
eval_tap $? 15 'PublishSeason' test.out

#- 16 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iYnoVYjN' \
    --force  \
    > test.out 2>&1
eval_tap $? 16 'RetireSeason' test.out

#- 17 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iF0PBrUg' \
    --q '68UZJUbF' \
    > test.out 2>&1
eval_tap $? 17 'QueryRewards' test.out

#- 18 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7nBpV7l4' \
    --body '{"code": "sabvI26Y", "currency": {"currencyCode": "tfHU7XV8", "namespace": "sywvtI3p"}, "image": {"as": "WpijPJq1", "caption": "hzUQbxy1", "height": 76, "imageUrl": "A28P5ndZ", "smallImageUrl": "uk8wPiz4", "width": 91}, "itemId": "2iUzJYy8", "quantity": 42, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateReward' test.out

#- 19 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '15gFmqeL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OeVbPN4h' \
    > test.out 2>&1
eval_tap $? 19 'GetReward' test.out

#- 20 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '8Q5mWdh3' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8GpweGia' \
    > test.out 2>&1
eval_tap $? 20 'DeleteReward' test.out

#- 21 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'fit7QeBt' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UDAvqaqF' \
    --body '{"currency": {"currencyCode": "WWC0MHuE", "namespace": "genntDud"}, "image": {"as": "Uy5hT0V6", "caption": "9O2rGyQU", "height": 79, "imageUrl": "jPzY00sg", "smallImageUrl": "Pm5lMCId", "width": 25}, "itemId": "iajkvSo5", "nullFields": ["DEMYi2L0", "AvUhNCet", "d29qw9gR"], "quantity": 47, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateReward' test.out

#- 22 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'brlC8aM3' \
    --limit '80' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 22 'QueryTiers' test.out

#- 23 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qm8QNOyZ' \
    --body '{"index": 84, "quantity": 63, "tier": {"requiredExp": 77, "rewards": {"EofAQaZW": ["7dzssNOx", "iyswN6DN", "VIcSEWC3"], "dU3tkRDZ": ["G4bzuwg1", "jEaDoX1Y", "k2W0gQLJ"], "ZjZ8xVdU": ["mG6CSo0t", "CDHH7EsD", "1ocgctKw"]}}}' \
    > test.out 2>&1
eval_tap $? 23 'CreateTier' test.out

#- 24 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '16iwEH6B' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kAH8ShSm' \
    --body '{"requiredExp": 40, "rewards": {"8DCDcm2r": ["jnDSsocn", "K26gQufe", "3xM3PJW5"], "UUDlzOYK": ["F1pj4jHS", "CjwmYpgd", "ofLxIFzQ"], "kFMLrbbS": ["IjvCD36l", "MtTaKBy3", "JH29avPw"]}}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateTier' test.out

#- 25 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id '39QbcTpI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Z5WSWYpS' \
    > test.out 2>&1
eval_tap $? 25 'DeleteTier' test.out

#- 26 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'jZgqBxNt' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'RLMUdz4V' \
    --body '{"newIndex": 1}' \
    > test.out 2>&1
eval_tap $? 26 'ReorderTier' test.out

#- 27 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iqlcfsms' \
    --force  \
    > test.out 2>&1
eval_tap $? 27 'UnpublishSeason' test.out

#- 28 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'VhWIecEk' \
    --limit '66' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 28 'GetUserParticipatedSeasons' test.out

#- 29 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ij7eQq81' \
    --body '{"exp": 3, "source": "PAID_FOR", "tags": ["IQc8QIHl", "26EuemRZ", "A3hspd5k"]}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserExp' test.out

#- 30 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'nb01JKPz' \
    --body '{"passCode": "KlLlwvnV", "passItemId": "FA1ap0hZ"}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserPass' test.out

#- 31 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'rl2W6CEz' \
    --passCodes 'Tc30Qmgp,g6DI4Tlp,VRhEDbPp' \
    > test.out 2>&1
eval_tap $? 31 'ExistsAnyPassByPassCodes' test.out

#- 32 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'sV2WGQTi' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentUserSeasonProgression' test.out

#- 33 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '4ysTFcva' \
    --body '{"passItemId": "fd79cOW5", "tierItemCount": 66, "tierItemId": "211iQbVX"}' \
    > test.out 2>&1
eval_tap $? 33 'CheckSeasonPurchasable' test.out

#- 34 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'IKqKy0hj' \
    > test.out 2>&1
eval_tap $? 34 'ResetUserSeason' test.out

#- 35 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '499zDkjI' \
    --body '{"count": 57, "source": "SWEAT", "tags": ["E4EkfxhA", "M33E9Rww", "MnTtOyJy"]}' \
    > test.out 2>&1
eval_tap $? 35 'GrantUserTier' test.out

#- 36 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'OZENunRI' \
    --from 'Hxj6nzpx' \
    --limit '48' \
    --offset '14' \
    --seasonId 'DfhqDjez' \
    --source 'SWEAT' \
    --tags 'M5miKhyH,Art3oWkz,Jw1TLtXS' \
    --to 'hGXSLiOk' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistory' test.out

#- 37 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'UxkgCYcc' \
    --seasonId 'wRx4l3OA' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistoryTag' test.out

#- 38 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'VIhQJapy' \
    --userId 'vpg8FSuA' \
    > test.out 2>&1
eval_tap $? 38 'GetUserSeason' test.out

#- 39 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'Xra7kfMi' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentSeason' test.out

#- 40 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3Tqttbo' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentUserSeason' test.out

#- 41 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'leBuMa7Y' \
    --body '{"passCode": "ANoPuL5U", "rewardCode": "F4pwJbrm", "tierIndex": 7}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserReward' test.out

#- 42 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'scgcNzZK' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkClaimUserRewards' test.out

#- 43 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OJ04DuMG' \
    --userId 'zXw8o9UA' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE