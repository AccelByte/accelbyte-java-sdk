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
    --limit '42' \
    --offset '42' \
    --status 'DRAFT,DRAFT,DRAFT' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": true, "defaultLanguage": "s3vCARRd", "defaultRequiredExp": 73, "draftStoreId": "a2UjJ7md", "end": "1998-10-25T00:00:00Z", "excessStrategy": {"currency": "jyYUcKoQ", "method": "CURRENCY", "percentPerExp": 24}, "images": [{"as": "QObjwME4", "caption": "yOKxzTqP", "height": 48, "imageUrl": "i3pt0Tdo", "smallImageUrl": "P4gzWrC9", "width": 30}, {"as": "WARuTjdM", "caption": "0UWVhytJ", "height": 89, "imageUrl": "yR3P2LrE", "smallImageUrl": "SPiEewe2", "width": 58}, {"as": "R23Xcc2Q", "caption": "mIlw1xW9", "height": 28, "imageUrl": "FGrlmQsF", "smallImageUrl": "JeJ8aT1q", "width": 65}], "localizations": {"YMKJpbXm": {"description": "h9BKEePk", "title": "x91Xbaiw"}, "uczcbXwL": {"description": "MLROplVe", "title": "eEiyvSH6"}, "S94RzNFV": {"description": "dt0FhHUG", "title": "STJLBDgs"}}, "name": "xeyDNj1i", "start": "1992-07-02T00:00:00Z", "tierItemId": "qlfBwovF"}' \
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
    --seasonId 'MQps6DQ3' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ZOifDBzj' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4MI6zSh2' \
    --body '{"autoClaim": false, "defaultLanguage": "F9DYKTEG", "defaultRequiredExp": 89, "draftStoreId": "Ojmj5OvS", "end": "1994-11-25T00:00:00Z", "excessStrategy": {"currency": "lClSH8yF", "method": "CURRENCY", "percentPerExp": 80}, "images": [{"as": "8wdwML9r", "caption": "IUpyM87a", "height": 33, "imageUrl": "6BS09t7b", "smallImageUrl": "TOzEhime", "width": 71}, {"as": "D2RHMqXc", "caption": "kqMlkbev", "height": 47, "imageUrl": "JBPjRwlC", "smallImageUrl": "82asNrxf", "width": 98}, {"as": "Y4G4cEqE", "caption": "mqvqlccu", "height": 20, "imageUrl": "rsouOGTV", "smallImageUrl": "vxOKuc0t", "width": 78}], "localizations": {"wjqLNcZh": {"description": "qKDD5nZu", "title": "08SPW3fM"}, "o7ez46tK": {"description": "xrBEpFhw", "title": "RpvIecEo"}, "VRosKa0t": {"description": "p6ciwt3i", "title": "Ih7egPif"}}, "name": "hIMKzBXD", "start": "1971-08-23T00:00:00Z", "tierItemId": "5qk1JvGY"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '1tKbsRHL' \
    --body '{"end": "1972-10-09T00:00:00Z", "name": "iegobsb8", "start": "1986-08-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'fJS2NReq' \
    > test.out 2>&1
eval_tap $? 9 'GetFullSeason' test.out

#- 10 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aWncoA9l' \
    > test.out 2>&1
eval_tap $? 10 'QueryPasses' test.out

#- 11 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8cgh2OmD' \
    --body '{"autoEnroll": false, "code": "M9iO8ca3", "displayOrder": 63, "images": [{"as": "PxmjSt8J", "caption": "ozRKFyZ2", "height": 41, "imageUrl": "TZZY6EoE", "smallImageUrl": "ieYidpy9", "width": 5}, {"as": "9e1sAsQF", "caption": "C2ws24rB", "height": 23, "imageUrl": "9vk5ka0Y", "smallImageUrl": "upqTYMjr", "width": 93}, {"as": "mUAtwQuF", "caption": "wd5m17rg", "height": 45, "imageUrl": "oS22aFdg", "smallImageUrl": "H6Nxyg2r", "width": 98}], "localizations": {"PuT8NWZ3": {"description": "Gkxrlq33", "title": "MPJ7s7nj"}, "BU8JQ3A2": {"description": "YSkeye5q", "title": "yTLPTaqL"}, "sZsRpZhS": {"description": "FfYfmoVi", "title": "mZM3akIu"}}, "passItemId": "TLEwERjv"}' \
    > test.out 2>&1
eval_tap $? 11 'CreatePass' test.out

#- 12 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code '9ZfN67Y1' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0Sd6mJOy' \
    > test.out 2>&1
eval_tap $? 12 'GetPass' test.out

#- 13 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'b6USUTLf' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2xXO2SQ3' \
    > test.out 2>&1
eval_tap $? 13 'DeletePass' test.out

#- 14 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'OLGWWgpb' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Z8Zk7WgR' \
    --body '{"autoEnroll": true, "displayOrder": 65, "images": [{"as": "1oHiE1e2", "caption": "DpGHP0yG", "height": 90, "imageUrl": "j4ybpIds", "smallImageUrl": "d9oqlZTX", "width": 82}, {"as": "EAS82T5i", "caption": "Avgw7bim", "height": 43, "imageUrl": "Gd1WrNzX", "smallImageUrl": "rfZjn7CA", "width": 100}, {"as": "EFSNtip6", "caption": "32tRrDZA", "height": 47, "imageUrl": "aZYKtOil", "smallImageUrl": "JLMvC5WZ", "width": 23}], "localizations": {"sjohsotP": {"description": "8dAXP7Sk", "title": "51efqc60"}, "P07LfqNn": {"description": "gmHcnjiB", "title": "HqBHCxMq"}, "i7i3kY6G": {"description": "ECGxgc7k", "title": "7i0SRoUF"}}, "passItemId": "Thnaa4KD"}' \
    > test.out 2>&1
eval_tap $? 14 'UpdatePass' test.out

#- 15 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'O8b0B0g9' \
    > test.out 2>&1
eval_tap $? 15 'PublishSeason' test.out

#- 16 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Hr0TO9xh' \
    --force  \
    > test.out 2>&1
eval_tap $? 16 'RetireSeason' test.out

#- 17 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xHl8p9tZ' \
    --q '0pBSVKOw' \
    > test.out 2>&1
eval_tap $? 17 'QueryRewards' test.out

#- 18 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'q9On6472' \
    --body '{"code": "ylkfGkpC", "currency": {"currencyCode": "PmfO2PeP", "namespace": "sZDJ0WYc"}, "image": {"as": "UyRft1aU", "caption": "elfli7Vf", "height": 3, "imageUrl": "n84LIfLh", "smallImageUrl": "sAy3uhOX", "width": 71}, "itemId": "ou50LTbt", "quantity": 12, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateReward' test.out

#- 19 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code 'eI5xp7kU' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'NEc6fybr' \
    > test.out 2>&1
eval_tap $? 19 'GetReward' test.out

#- 20 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'iql0lDed' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Pn6YM7Ce' \
    > test.out 2>&1
eval_tap $? 20 'DeleteReward' test.out

#- 21 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'aNHJAL94' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'wnkqjvBp' \
    --body '{"currency": {"currencyCode": "Yq0pxKpN", "namespace": "4eyJebap"}, "image": {"as": "taeFYURw", "caption": "YstqIqkf", "height": 87, "imageUrl": "v8qHlAyj", "smallImageUrl": "YpdqjF0Y", "width": 72}, "itemId": "CYi5WysW", "nullFields": ["BnHV3siQ", "iTtxNNE9", "Fq0nz04k"], "quantity": 22, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateReward' test.out

#- 22 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'f8xqQbq8' \
    --limit '58' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 22 'QueryTiers' test.out

#- 23 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3omnDUgL' \
    --body '{"index": 57, "quantity": 20, "tier": {"requiredExp": 14, "rewards": {"wQ50Fkeg": ["lqjnJIXf", "8rsQfiGy", "9tGpmwMO"], "aGfpKaBL": ["t2GyDp2r", "fwQObQ99", "c0UlLdAz"], "x7c8ilMi": ["N4GRrQWl", "nYDTAmpu", "NBJmgPCd"]}}}' \
    > test.out 2>&1
eval_tap $? 23 'CreateTier' test.out

#- 24 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'I7f76XMH' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '7EMusdIg' \
    --body '{"requiredExp": 74, "rewards": {"koSdf4J3": ["TAkKIRz7", "6kHW9eRk", "1izhPxO4"], "sBAKwnBp": ["f1FcbJn8", "RblsoXpZ", "03x8c9pj"], "ELNsPBpY": ["lx7PeINf", "YRTV09L0", "1JaOzV0W"]}}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateTier' test.out

#- 25 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'byKODQes' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sbpVTPM0' \
    > test.out 2>&1
eval_tap $? 25 'DeleteTier' test.out

#- 26 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'ZBnf40um' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Dj32zgi4' \
    --body '{"newIndex": 83}' \
    > test.out 2>&1
eval_tap $? 26 'ReorderTier' test.out

#- 27 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HehisT0m' \
    --force  \
    > test.out 2>&1
eval_tap $? 27 'UnpublishSeason' test.out

#- 28 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'iiY58sAa' \
    --limit '19' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 28 'GetUserParticipatedSeasons' test.out

#- 29 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'rsjp0siM' \
    --body '{"exp": 9, "source": "SWEAT", "tags": ["uuGSdIhd", "rbaeiJaf", "79G0h9ww"]}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserExp' test.out

#- 30 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'pX9a5MvN' \
    --body '{"passCode": "egvANZ3I", "passItemId": "z4MXcWsu"}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserPass' test.out

#- 31 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'cWQEFPDw' \
    --passCodes 'vSk64Bms,KiIQf2PE,i4wuTuU1' \
    > test.out 2>&1
eval_tap $? 31 'ExistsAnyPassByPassCodes' test.out

#- 32 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'lsYNzpWh' \
    > test.out 2>&1
eval_tap $? 32 'GetCurrentUserSeasonProgression' test.out

#- 33 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'NuJI3uzP' \
    --body '{"passItemId": "YgOQXB2x", "tierItemCount": 10, "tierItemId": "MT3MeFPq"}' \
    > test.out 2>&1
eval_tap $? 33 'CheckSeasonPurchasable' test.out

#- 34 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId '9JxQt4LU' \
    > test.out 2>&1
eval_tap $? 34 'ResetUserSeason' test.out

#- 35 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'N3lHGIUa' \
    --body '{"count": 14, "source": "SWEAT", "tags": ["Z3Jco7tl", "j6mXRSde", "F948V2d3"]}' \
    > test.out 2>&1
eval_tap $? 35 'GrantUserTier' test.out

#- 36 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '3uU1DNSr' \
    --from 'o2Vpzq5h' \
    --limit '66' \
    --offset '39' \
    --seasonId 'lojFAbAT' \
    --source 'SWEAT' \
    --tags 'M4WKgNSE,HG3I2gcA,ljhGcLTg' \
    --to 'Q9lVD43Z' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistory' test.out

#- 37 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'pT8bLq5P' \
    --seasonId 'MZSebm8W' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistoryTag' test.out

#- 38 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HcXwHgPP' \
    --userId 'WUFkDTR5' \
    > test.out 2>&1
eval_tap $? 38 'GetUserSeason' test.out

#- 39 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'OB8V5jjf' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentSeason' test.out

#- 40 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'HvdRZS23' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentUserSeason' test.out

#- 41 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'oX0ymoih' \
    --body '{"passCode": "5OwlHess", "rewardCode": "W5wKRpfm", "tierIndex": 40}' \
    > test.out 2>&1
eval_tap $? 41 'PublicClaimUserReward' test.out

#- 42 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ImdnLMT7' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkClaimUserRewards' test.out

#- 43 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OVc3Vc7m' \
    --userId '7h7bNpme' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE