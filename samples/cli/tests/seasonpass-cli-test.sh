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
    --limit '46' \
    --offset '38' \
    --status 'PUBLISHED,RETIRED,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "ON2cnNfg", "defaultRequiredExp": 7, "draftStoreId": "E2vTHSRz", "end": "1986-01-23T00:00:00Z", "excessStrategy": {"currency": "WZy6onJ6", "method": "CURRENCY", "percentPerExp": 29}, "images": [{"as": "gOAMGihL", "caption": "8mvpN2h7", "height": 2, "imageUrl": "Tm0fTLXS", "smallImageUrl": "fCh755gd", "width": 69}, {"as": "VikH3jQj", "caption": "OkZY4Eyy", "height": 53, "imageUrl": "iBvYN23M", "smallImageUrl": "OprdBKTJ", "width": 9}, {"as": "zlANCzZe", "caption": "dvn82AX8", "height": 56, "imageUrl": "SsLxAG2C", "smallImageUrl": "eqdodKdr", "width": 18}], "localizations": {"IKTldqBR": {"description": "18lgPkxM", "title": "wd6KjiyU"}, "14fV5qs7": {"description": "JpwpNsts", "title": "Zo3QJnMP"}, "k0rUmnZa": {"description": "1LbSFcjS", "title": "AqweyN17"}}, "name": "tRdJwTb1", "start": "1994-06-05T00:00:00Z", "tierItemId": "xWEDuCwN"}' \
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
    --body '{"userIds": ["bfkvuU7q", "wesKbFRJ", "xfeCr8lG"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xhHHQSH7' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'oQj84ZUL' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ftXTCpUa' \
    --body '{"autoClaim": false, "defaultLanguage": "YeO1bzwJ", "defaultRequiredExp": 26, "draftStoreId": "9SCU1YYW", "end": "1996-09-27T00:00:00Z", "excessStrategy": {"currency": "51t3iR21", "method": "CURRENCY", "percentPerExp": 20}, "images": [{"as": "9NKhBmOB", "caption": "HEducC1v", "height": 70, "imageUrl": "UlAXeuXP", "smallImageUrl": "drsjKzoc", "width": 80}, {"as": "QJhV0zar", "caption": "NkRBu3z6", "height": 47, "imageUrl": "dMQJITtV", "smallImageUrl": "9EIGDdAW", "width": 31}, {"as": "7qMgpG9g", "caption": "pJuVIlem", "height": 27, "imageUrl": "l3s0dGwO", "smallImageUrl": "Gq882Okf", "width": 3}], "localizations": {"c64Kv62H": {"description": "ShxRYTEp", "title": "lr4ii1xb"}, "bsWAt45Z": {"description": "MyVOaXgw", "title": "ozicVwdq"}, "huyJdLSk": {"description": "8HeJ9fDi", "title": "Bw8SmOVj"}}, "name": "jBSl1oSb", "start": "1975-05-09T00:00:00Z", "tierItemId": "Knfb2x4H"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'lZM4JtVx' \
    --body '{"end": "1991-04-24T00:00:00Z", "name": "06tW4pni", "start": "1977-03-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'TO42DVUI' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KQbF87iw' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'CSWYIUqE' \
    --body '{"autoEnroll": false, "code": "Xd59OoOD", "displayOrder": 79, "images": [{"as": "49Lu4JUq", "caption": "GShlOPRE", "height": 14, "imageUrl": "vjC9wgVa", "smallImageUrl": "E7bKAQXE", "width": 82}, {"as": "gzivegJh", "caption": "jQfTXB5e", "height": 34, "imageUrl": "7rjyCZNp", "smallImageUrl": "5gWNSWrC", "width": 21}, {"as": "NAUu5Ogx", "caption": "QK8in94T", "height": 18, "imageUrl": "mAgpV4FT", "smallImageUrl": "YRAzU1Ah", "width": 60}], "localizations": {"cr015Pb2": {"description": "aEUvlelA", "title": "NmPZkE2z"}, "aCFDgmC8": {"description": "LLf1pYQ1", "title": "yPRZeSZq"}, "XFlN7MDH": {"description": "mD9onsji", "title": "DRM8AFkj"}}, "passItemId": "ouJ1gmzp"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'PHVVTedv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iwzLduvm' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'wrzuKNIn' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'navXx2LO' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'AZzpROEI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'uLxIynQp' \
    --body '{"autoEnroll": false, "displayOrder": 90, "images": [{"as": "rBsxc0ni", "caption": "bB0sfk7d", "height": 97, "imageUrl": "oPPeadxy", "smallImageUrl": "WTOkCDdY", "width": 33}, {"as": "t0bGEYFO", "caption": "PvVkqIrJ", "height": 4, "imageUrl": "KnDQKGP1", "smallImageUrl": "dYRzNCMt", "width": 49}, {"as": "m2QuY59m", "caption": "oiYdXM6S", "height": 49, "imageUrl": "lQ2Vrw16", "smallImageUrl": "KPxS8i6k", "width": 46}], "localizations": {"xsMi0VS8": {"description": "GChgdKxS", "title": "9BH6UM5K"}, "RkXyksOj": {"description": "sOWybqE3", "title": "ZleAC4XY"}, "dCINIDaJ": {"description": "PTxGnA5J", "title": "AS64UNBP"}}, "passItemId": "llELUr9Q"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Kdr5ofyX' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ytEMlqQY' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QEru8vqj' \
    --q 'PumLfCqN' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kZ1yRXC5' \
    --body '{"code": "yV3qiBpt", "currency": {"currencyCode": "dDGHz4Eg", "namespace": "UaHaahwh"}, "image": {"as": "gvDsAcEu", "caption": "xhkmFV5O", "height": 37, "imageUrl": "tEcr3o8S", "smallImageUrl": "v4iyc5UH", "width": 83}, "itemId": "jVetHV7Z", "quantity": 24, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'Aesx2woO' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'JEIQ2bpp' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'qECXVrHq' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'khRrlzqe' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'uZ8S2pp9' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kA8OWIyP' \
    --body '{"currency": {"currencyCode": "ur70WS0N", "namespace": "rCjjlO0w"}, "image": {"as": "SY5Iafmy", "caption": "R1PPhY2i", "height": 70, "imageUrl": "eg920rSE", "smallImageUrl": "PLGjvpc1", "width": 35}, "itemId": "kRw9N3KQ", "nullFields": ["eQxNtQbc", "ruWNOQLb", "Ed4PmzQA"], "quantity": 15, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0t1E19Ew' \
    --limit '92' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UEn4leV1' \
    --body '{"index": 56, "quantity": 49, "tier": {"requiredExp": 0, "rewards": {"FvRjzfXL": ["ZfdPofu5", "HY9ppKx4", "1fEdwm35"], "s3YeLsKP": ["STTgVqa5", "GoKhrtjZ", "NUqukXal"], "ddD1X9i3": ["jGbUEMdK", "yFDq0Y8a", "Ev6Im6fS"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'Gi0w0W28' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4uZqnFCG' \
    --body '{"requiredExp": 9, "rewards": {"Z8wVdXIX": ["9TGKxHXx", "cVozcGnG", "om1R1fOE"], "NFahVkOo": ["ySUpbiMX", "HRUzgab3", "lDYsOTKM"], "GX5Jc5KO": ["WKy7QENi", "n4aUfOS2", "cv2Nmbv8"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'NCUVfG2O' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'dLN5r7kI' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '6aMmYnxL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0G4Ue9IM' \
    --body '{"newIndex": 77}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '96OzpM5Z' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVlN51WR' \
    --limit '24' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'ujTXeGrQ' \
    --body '{"exp": 44, "source": "PAID_FOR", "tags": ["52hYoVFR", "FU0XUaKe", "JJlqiZRD"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId '37tPgJzt' \
    --body '{"passCode": "BwlNkwn2", "passItemId": "KbFtYosD"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'K0Flkker' \
    --passCodes 'DcMuA9OY,LqunhxSO,eRCfx17M' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'G4h8I8sB' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'LZI5DmAa' \
    --body '{"passItemId": "i25jXkMD", "tierItemCount": 81, "tierItemId": "Ffacm1LQ"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'EhFkAfes' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '7iTcmP8F' \
    --body '{"count": 55, "source": "PAID_FOR", "tags": ["Qfu2xcI8", "F79EOYdP", "C3yw1KCj"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'x3dZgLc6' \
    --from 'lk9SJok5' \
    --limit '13' \
    --offset '16' \
    --seasonId '0CdIDxDJ' \
    --source 'SWEAT' \
    --tags 'zfEiyTvx,UHN9dM93,25w3VL2T' \
    --to 'EFb9lUqB' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANJQjDv5' \
    --seasonId 'w65XSVfL' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1uR6CCny' \
    --userId 'V8fcwVwo' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'O8oqGD15' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9PHQpAg' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'LruJpxcx' \
    --body '{"passCode": "JKSv56vm", "rewardCode": "ZKKMLtVf", "tierIndex": 88}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '2sAbostV' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'l81ghh9A' \
    --userId '5ZkC2SLF' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE