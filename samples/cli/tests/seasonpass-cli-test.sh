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
    --limit '82' \
    --offset '65' \
    --status 'RETIRED,DRAFT,RETIRED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "MtEazEIN", "defaultRequiredExp": 50, "draftStoreId": "wA2VYcXi", "end": "1988-11-13T00:00:00Z", "excessStrategy": {"currency": "7IIuBHh4", "method": "NONE", "percentPerExp": 88}, "images": [{"as": "MXziCcgO", "caption": "l4kLLIPP", "height": 42, "imageUrl": "mn9xnKWV", "smallImageUrl": "Seq6karM", "width": 10}, {"as": "DJ0I3YBl", "caption": "q4gXm5xS", "height": 47, "imageUrl": "AkkBTmdl", "smallImageUrl": "OT0pExHz", "width": 9}, {"as": "bp8iGEWZ", "caption": "ZTEwW20q", "height": 58, "imageUrl": "TGDQg19X", "smallImageUrl": "zOvo6Uya", "width": 36}], "localizations": {"u2FQrWiY": {"description": "K24v5dBD", "title": "Yq0yFn1f"}, "xegAvCrH": {"description": "xMG4CvTS", "title": "s3VjyhnS"}, "2nT6MWqs": {"description": "iWnjzovY", "title": "LL8FiugN"}}, "name": "zTeIlR2l", "start": "1999-06-09T00:00:00Z", "tierItemId": "xWfqo3TJ"}' \
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
    --seasonId '2wv5Tu5t' \
    > test.out 2>&1
eval_tap $? 5 'GetSeason' test.out

#- 6 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2MzlX1yx' \
    > test.out 2>&1
eval_tap $? 6 'DeleteSeason' test.out

#- 7 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'kHJo23Z2' \
    --body '{"autoClaim": true, "defaultLanguage": "NMgXSkcI", "defaultRequiredExp": 19, "draftStoreId": "0IGCSxqF", "end": "1980-09-11T00:00:00Z", "excessStrategy": {"currency": "9E8vxwI6", "method": "NONE", "percentPerExp": 95}, "images": [{"as": "HOfGgFEn", "caption": "LdXvt0od", "height": 98, "imageUrl": "mnYVME4g", "smallImageUrl": "GxBAZlJN", "width": 0}, {"as": "MUWE14hY", "caption": "nZcK7HWx", "height": 18, "imageUrl": "xGUoZgpX", "smallImageUrl": "eFOXIrRe", "width": 57}, {"as": "uCGEl6J6", "caption": "s3KgXLP8", "height": 23, "imageUrl": "FtnCLrTz", "smallImageUrl": "TwRArL3w", "width": 87}], "localizations": {"nUjU6jBt": {"description": "R1WN3ZyL", "title": "287O74YZ"}, "gBcSx160": {"description": "sKEr2PhE", "title": "JZWhoDR2"}, "UlAuKHf7": {"description": "9lzIciWP", "title": "sJoAM9cv"}}, "name": "40mZRjwj", "start": "1996-09-05T00:00:00Z", "tierItemId": "G6fszt2Z"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateSeason' test.out

#- 8 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'S07Pothv' \
    --body '{"end": "1974-07-14T00:00:00Z", "name": "wqpAWsKE", "start": "1986-03-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 8 'CloneSeason' test.out

#- 9 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'N6rxP9kw' \
    > test.out 2>&1
eval_tap $? 9 'QueryPasses' test.out

#- 10 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iRMkefg7' \
    --body '{"autoEnroll": false, "code": "q2zvgExb", "displayOrder": 19, "images": [{"as": "9Hmhb6XF", "caption": "cAq9IJDA", "height": 28, "imageUrl": "EORdRHTm", "smallImageUrl": "vubZABxr", "width": 24}, {"as": "xwPUWurH", "caption": "NW9MJKJu", "height": 50, "imageUrl": "wOxxY76s", "smallImageUrl": "e0aURlA3", "width": 64}, {"as": "KfgIs2qC", "caption": "6zIQF0ih", "height": 1, "imageUrl": "2HsfLb5N", "smallImageUrl": "C8W4kSYa", "width": 29}], "localizations": {"adjeSz8e": {"description": "RbRSFaxH", "title": "lcimZnln"}, "pmC4eJSP": {"description": "GOmhfN8C", "title": "fBh7qWHA"}, "86ao6Oew": {"description": "i3cznRAf", "title": "omOdu7xh"}}, "passItemId": "WGsd5ZEf"}' \
    > test.out 2>&1
eval_tap $? 10 'CreatePass' test.out

#- 11 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'C1JhNvGo' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 's2JMrmu7' \
    > test.out 2>&1
eval_tap $? 11 'GetPass' test.out

#- 12 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'MayCnS0z' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '24kzipFj' \
    > test.out 2>&1
eval_tap $? 12 'DeletePass' test.out

#- 13 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'RohvHVwL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SWtuOQ4I' \
    --body '{"autoEnroll": false, "displayOrder": 82, "images": [{"as": "F1eYldNn", "caption": "crTP7ZsM", "height": 16, "imageUrl": "dAv6kCRj", "smallImageUrl": "Ewg9aL2X", "width": 100}, {"as": "JUm0Bk0N", "caption": "0Oqf4acZ", "height": 25, "imageUrl": "TsZ7lCoJ", "smallImageUrl": "ytsdxhUw", "width": 73}, {"as": "yhlxRjJ3", "caption": "t5X21549", "height": 98, "imageUrl": "j2U7mJsG", "smallImageUrl": "91oeIxTF", "width": 37}], "localizations": {"FsDPxsbI": {"description": "lBQnq5mR", "title": "FyMe3vW2"}, "JLQSWt3M": {"description": "9Z3PqZwg", "title": "MIJyLSMS"}, "g0zooNxN": {"description": "nTVe8XUb", "title": "quNY4I6h"}}, "passItemId": "868bGjQf"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePass' test.out

#- 14 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PIVN89oB' \
    > test.out 2>&1
eval_tap $? 14 'PublishSeason' test.out

#- 15 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Yg7pTr5A' \
    --force  \
    > test.out 2>&1
eval_tap $? 15 'RetireSeason' test.out

#- 16 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'v4YkW4CB' \
    --q 'BRdrenQX' \
    > test.out 2>&1
eval_tap $? 16 'QueryRewards' test.out

#- 17 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'SD3mbIUi' \
    --body '{"code": "AM1Mlk6B", "currency": {"currencyCode": "bqmgymlA", "namespace": "Bx4pjH1j"}, "image": {"as": "exYx83x9", "caption": "XKBPGYIV", "height": 48, "imageUrl": "eysaLGWd", "smallImageUrl": "3Z0ZuBgD", "width": 52}, "itemId": "EIFfQJ1O", "quantity": 65, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateReward' test.out

#- 18 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '2gUqWxYN' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qAdcxv8q' \
    > test.out 2>&1
eval_tap $? 18 'GetReward' test.out

#- 19 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code '6PjrW9by' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pgeMthVi' \
    > test.out 2>&1
eval_tap $? 19 'DeleteReward' test.out

#- 20 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'rL4PATkw' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'zlYMvKco' \
    --body '{"currency": {"currencyCode": "sVOJT7pb", "namespace": "7JlF5Fbh"}, "image": {"as": "3ixzRJzX", "caption": "zCunEjOj", "height": 4, "imageUrl": "FkVIkeu7", "smallImageUrl": "CCrPtz9j", "width": 69}, "itemId": "2Zex17tv", "nullFields": ["t4eVrEK0", "GUHA06Xr", "FzTr2z8h"], "quantity": 39, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateReward' test.out

#- 21 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'DPnKY4QR' \
    --limit '34' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 21 'QueryTiers' test.out

#- 22 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'X76MebI4' \
    --body '{"index": 15, "quantity": 0, "tier": {"requiredExp": 79, "rewards": {"6ugNYkro": ["msQciIm5", "Pum7PzoC", "Z7iCbPcz"], "KMizwgwx": ["bnG0rU5s", "vHicqVnn", "ePeI5duy"], "UQLJs5YF": ["ELfrVh2T", "GEnngXL3", "oDN2Slwm"]}}}' \
    > test.out 2>&1
eval_tap $? 22 'CreateTier' test.out

#- 23 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'HPJl0Vr4' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qnFNQ6Wo' \
    --body '{"requiredExp": 6, "rewards": {"yuJMHkwq": ["TAlx6DQn", "1wsCLKmu", "noPFBDen"], "wFogmmbr": ["YK1Qnr8G", "aANK0nuK", "YPZWBR9Q"], "rZE1Wn9h": ["thPBD2rB", "bPaxCNa2", "K7Xg8m3k"]}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateTier' test.out

#- 24 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'lKRsZxsz' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'aex7VMm0' \
    > test.out 2>&1
eval_tap $? 24 'DeleteTier' test.out

#- 25 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id '79WkLMrL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '37NaMnZg' \
    --body '{"newIndex": 82}' \
    > test.out 2>&1
eval_tap $? 25 'ReorderTier' test.out

#- 26 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'Y6Q36oBV' \
    --force  \
    > test.out 2>&1
eval_tap $? 26 'UnpublishSeason' test.out

#- 27 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGxdQvuY' \
    --limit '0' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 27 'GetUserParticipatedSeasons' test.out

#- 28 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'K8jkDyBy' \
    --body '{"exp": 11, "source": "PAID_FOR", "tags": ["px8LIhVT", "MGH0kdee", "4hFE7eGR"]}' \
    > test.out 2>&1
eval_tap $? 28 'GrantUserExp' test.out

#- 29 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'oKPseQOp' \
    --body '{"passCode": "8dIpPLNR", "passItemId": "P63nNlNl"}' \
    > test.out 2>&1
eval_tap $? 29 'GrantUserPass' test.out

#- 30 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'eYFlM330' \
    --passCodes 'MaGULGnH,hUvPHM0f,y8FRM7qv' \
    > test.out 2>&1
eval_tap $? 30 'ExistsAnyPassByPassCodes' test.out

#- 31 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'InqPd7h1' \
    > test.out 2>&1
eval_tap $? 31 'GetCurrentUserSeasonProgression' test.out

#- 32 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId '3UBBoEni' \
    --body '{"passItemId": "5mAiZCle", "tierItemCount": 23, "tierItemId": "woQC30rW"}' \
    > test.out 2>&1
eval_tap $? 32 'CheckSeasonPurchasable' test.out

#- 33 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'IrfiGgvx' \
    > test.out 2>&1
eval_tap $? 33 'ResetUserSeason' test.out

#- 34 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId '7KZwlN4H' \
    --body '{"count": 49, "source": "PAID_FOR", "tags": ["5vcH2TRD", "OBBkgV9r", "eK4Vjz4q"]}' \
    > test.out 2>&1
eval_tap $? 34 'GrantUserTier' test.out

#- 35 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'da7h5zB6' \
    --from '5ChwuwYS' \
    --limit '27' \
    --offset '38' \
    --seasonId 'gZRimoab' \
    --source 'PAID_FOR' \
    --tags 'nb0WwcsV,Xxua1hOe,nCpKAPXg' \
    --to 'BqOGSLLg' \
    > test.out 2>&1
eval_tap $? 35 'QueryUserExpGrantHistory' test.out

#- 36 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXfYoeH6' \
    --seasonId '38gnLWcA' \
    > test.out 2>&1
eval_tap $? 36 'QueryUserExpGrantHistoryTag' test.out

#- 37 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'F2V3SLEH' \
    --userId '9KrZSVHb' \
    > test.out 2>&1
eval_tap $? 37 'GetUserSeason' test.out

#- 38 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'jehilcVH' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetCurrentSeason' test.out

#- 39 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'vRznLMm9' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetCurrentUserSeason' test.out

#- 40 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'F0uumude' \
    --body '{"passCode": "Kp2imXB4", "rewardCode": "BBsS1NtS", "tierIndex": 14}' \
    > test.out 2>&1
eval_tap $? 40 'PublicClaimUserReward' test.out

#- 41 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '0ZSAHFTp' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkClaimUserRewards' test.out

#- 42 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A43E1RGP' \
    --userId 'sVrhFPyF' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE