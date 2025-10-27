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
echo "1..46"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ExportSeason
./ng net.accelbyte.sdk.cli.Main seasonpass exportSeason \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'ExportSeason' test.out

#- 3 QuerySeasons
./ng net.accelbyte.sdk.cli.Main seasonpass querySeasons \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '39' \
    --status 'PUBLISHED,PUBLISHED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 3 'QuerySeasons' test.out

#- 4 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "CA9kPI6LZrkq6Dc0", "defaultRequiredExp": 98, "draftStoreId": "nIW0Oaiw9B0D7eHp", "end": "1983-09-25T00:00:00Z", "excessStrategy": {"currency": "Sn3ZPUdc0qh4n8mz", "method": "NONE", "percentPerExp": 72}, "images": [{"as": "m8SAMTwE6I56IaRD", "caption": "BXxyaNoMR6hkspIn", "height": 36, "imageUrl": "ngUNB1vRodwpzS6D", "smallImageUrl": "aDpv8N7ZQVqGj6oD", "width": 76}, {"as": "fh5pUkHODpoMF78N", "caption": "Y4YkHs1cnz1JSDgY", "height": 93, "imageUrl": "olvbTgrhRTcPiSuL", "smallImageUrl": "0Sly6XM4OI18mAQL", "width": 28}, {"as": "zNIicXm7agSrjJW2", "caption": "OQNOs1PXhT5FvdiR", "height": 16, "imageUrl": "5TB0i7pKxR8dl0zR", "smallImageUrl": "VW4EZG9m0XcgGVbM", "width": 33}], "localizations": {"fqlqNiTvB6SdAdIh": {"description": "UDrwoZ5MecdKi5r6", "title": "QEa1ysLEzth6mXhz"}, "kzWkFeZSoEAcBdW1": {"description": "9m4eu6d5tA5jUmiT", "title": "qpyhPFdxLzFQN05M"}, "YzYiKWe5dNRljv7I": {"description": "PrDQQRgat0SevkLG", "title": "MS0lyuI9a2I9u6Vp"}}, "name": "bsx5w8hqUI06UpOX", "start": "1987-07-19T00:00:00Z", "tierItemId": "SLmCVuHOPlLlkvR8"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateSeason' test.out

#- 5 GetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetCurrentSeason' test.out

#- 6 BulkGetUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass bulkGetUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["sKgnuRkgghGoYupD", "391C2qtPYokahFjk", "QsfCaTmt1d67FXGk"]}' \
    > test.out 2>&1
eval_tap $? 6 'BulkGetUserSeasonProgression' test.out

#- 7 GetItemReferences
./ng net.accelbyte.sdk.cli.Main seasonpass getItemReferences \
    --namespace "$AB_NAMESPACE" \
    --itemId '2s9Q0mPVo3twu0Me' \
    > test.out 2>&1
eval_tap $? 7 'GetItemReferences' test.out

#- 8 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sTCf9x4rt69lna7q' \
    > test.out 2>&1
eval_tap $? 8 'GetSeason' test.out

#- 9 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xNeIxPz6MbwL6IY6' \
    > test.out 2>&1
eval_tap $? 9 'DeleteSeason' test.out

#- 10 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '9z1UaLqYSYWytLPz' \
    --body '{"autoClaim": false, "defaultLanguage": "yYoNRKd3IL5TAQ6i", "defaultRequiredExp": 17, "draftStoreId": "llG4cYEzfTD1ZBm3", "end": "1991-01-31T00:00:00Z", "excessStrategy": {"currency": "qHcUmLZZbSqb8RwN", "method": "CURRENCY", "percentPerExp": 60}, "images": [{"as": "n9HrNQy4uZAAiE0m", "caption": "it9RGCCHYzUOcEds", "height": 5, "imageUrl": "i9gwQYv7t1o7TTr1", "smallImageUrl": "DmrhZv15T7quIOvB", "width": 80}, {"as": "VU6RBt0zYoMcHyCU", "caption": "EXlAvxJMdalwSyli", "height": 100, "imageUrl": "2bOItRMvqtlB2jJC", "smallImageUrl": "SQT279ZZPYGu0rdl", "width": 13}, {"as": "qRBaAkLnvxkT1X68", "caption": "cmDc3fxU8MyKrQpM", "height": 16, "imageUrl": "Dlym6puQ23xoJ8ae", "smallImageUrl": "CnaLpUKp44YUDjas", "width": 100}], "localizations": {"Xa3bMrXsDr6kILsS": {"description": "SyDdmykmoPYgc2L4", "title": "jk4Lo0LSP0pf4Ixj"}, "Ukl535X3ateEKDpA": {"description": "Dz1x3poD3Qgb3boL", "title": "QQ1MzH7Qm8bwbmXg"}, "dAPh1EThG96gAFKK": {"description": "2WDgCcxvONZm3EeE", "title": "RmDnyeFoF7VSZ6pf"}}, "name": "3vneSD2Tb3g7mSQU", "start": "1974-11-09T00:00:00Z", "tierItemId": "AEtrmjqU6YE3p4lS"}' \
    > test.out 2>&1
eval_tap $? 10 'UpdateSeason' test.out

#- 11 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ck0ZHn5GI39YBHqa' \
    --body '{"end": "1994-09-28T00:00:00Z", "name": "lvPG6bFYReVHQipc", "start": "1985-04-29T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 11 'CloneSeason' test.out

#- 12 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'x9Zw5D2L7vIYhGGS' \
    > test.out 2>&1
eval_tap $? 12 'GetFullSeason' test.out

#- 13 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'yEW4ZJJ42d3PBddN' \
    > test.out 2>&1
eval_tap $? 13 'QueryPasses' test.out

#- 14 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId '8S48l9lyNApflxqM' \
    --body '{"autoEnroll": true, "code": "QvGgbLdLsFzHkBMr", "displayOrder": 48, "images": [{"as": "yrOMlNFSrUEirnjX", "caption": "9fDmIbeZxzfTcyiu", "height": 54, "imageUrl": "yUZNmTBcvrbYCwZt", "smallImageUrl": "xFHyPLtI8ilbyDPU", "width": 71}, {"as": "GLXpUL4pp2ncYAHd", "caption": "NzDmeIP6rOvDz9KO", "height": 37, "imageUrl": "3SZLxoRDFuuuySj2", "smallImageUrl": "9a9LJE8HoRS1X2PF", "width": 54}, {"as": "AnkCmBUqg2SCnqnt", "caption": "X9y1aZSWMiVi10sG", "height": 85, "imageUrl": "vxkfUcmqRRbceJ5i", "smallImageUrl": "0EeDxOgBnhhqElIa", "width": 60}], "localizations": {"KlloeH0JT1yduat2": {"description": "vQR3biBfsu4jmsRE", "title": "2w1yEkLgh3tIYt4S"}, "qYUTLDx9gIiDandp": {"description": "GT2t24aOMh5eC3IH", "title": "eHSKLCa3xreNDUWe"}, "hwH3q31A806DJgas": {"description": "4b6z3LNUj7fdgLA8", "title": "4Z8YYk6QEgJjBbED"}}, "passItemId": "oNf3n0hEoRCAcf80"}' \
    > test.out 2>&1
eval_tap $? 14 'CreatePass' test.out

#- 15 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'zfFyabWAgIUXiI07' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'A68eaqC2J9jyEW6G' \
    > test.out 2>&1
eval_tap $? 15 'GetPass' test.out

#- 16 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'Lbc0NaKDUL3sa13l' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'k1dQBHO86IlBhnet' \
    > test.out 2>&1
eval_tap $? 16 'DeletePass' test.out

#- 17 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'U4RwTqUXlTDBzOuY' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'saZA2yyd4mbqoOfA' \
    --body '{"autoEnroll": true, "displayOrder": 4, "images": [{"as": "MMAXFaY9eKa699bR", "caption": "VhyaKwwrAP2aMlu7", "height": 100, "imageUrl": "xodenSrUTvfqU0bf", "smallImageUrl": "oMm5cTtFWbotQyXJ", "width": 88}, {"as": "Ga23YvYmmDg7VYPX", "caption": "IuvUYTZBRujIUE1T", "height": 34, "imageUrl": "9mCEHThUJkETAsSp", "smallImageUrl": "7gh4TeUTkOkAYfJB", "width": 97}, {"as": "AT9t4Tv207Y2QD3o", "caption": "D5fLCr3OOlXVv8ZG", "height": 64, "imageUrl": "Gb7S0o4zGYY7KQI1", "smallImageUrl": "AeFgPqaOkvo1aolB", "width": 47}], "localizations": {"lkKB4EYOkQ1jMD3c": {"description": "ym8xIfkOVW2grREO", "title": "Lx0KOww3HICQLfl7"}, "MUBG7qtPu64yAtUR": {"description": "KLRkb738HGS6rDgM", "title": "dIIlhS1fSiM9331m"}, "7Ta1PsKc50Kv6ecn": {"description": "EevcAx2K2zkRenmP", "title": "ZnGBt4P7WnbdSJtj"}}, "passItemId": "X7ZshZyZl5x4bRXB"}' \
    > test.out 2>&1
eval_tap $? 17 'UpdatePass' test.out

#- 18 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HUTrDzZSKscfOcYu' \
    > test.out 2>&1
eval_tap $? 18 'PublishSeason' test.out

#- 19 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '3dpCROYqUiGKXVFC' \
    --force  \
    > test.out 2>&1
eval_tap $? 19 'RetireSeason' test.out

#- 20 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mpo6sPwVOEDSJsEK' \
    --q '5QpNhlI2iS5EpGhh' \
    > test.out 2>&1
eval_tap $? 20 'QueryRewards' test.out

#- 21 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'vXYck0upMzUYnb76' \
    --body '{"code": "tFkEORV3bu1bNCtX", "currency": {"currencyCode": "7W40V6Do5sYadCCF", "namespace": "rHHC3DpZxkrQDXuN"}, "image": {"as": "FviMarv8mnfHK8CC", "caption": "mE2lPnsbD3SGEdlw", "height": 42, "imageUrl": "iaI1mX2tJoARtdbB", "smallImageUrl": "e7udsMrok0WvGYYn", "width": 48}, "itemId": "jLfFmteue9nzJ6fH", "quantity": 29, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateReward' test.out

#- 22 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '805tVg8JqU0jZpjv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sugAOS7u8RiWyerC' \
    > test.out 2>&1
eval_tap $? 22 'GetReward' test.out

#- 23 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'Sa8SRgwsAj1ik1jg' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'laDXTvKCWwNTAhd2' \
    > test.out 2>&1
eval_tap $? 23 'DeleteReward' test.out

#- 24 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'wrS0uPdjhdinpng5' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'BLy8wbhMssAHjapI' \
    --body '{"currency": {"currencyCode": "kY9Rf4wP57dBZNR8", "namespace": "8YbCtmKy8M9zVrjf"}, "image": {"as": "GXZnqAQUoY1GjlII", "caption": "k0iKoTTS1j02o7Jj", "height": 93, "imageUrl": "bTU5JX8ccLjMXJRk", "smallImageUrl": "0eaKQDOJvrTefglS", "width": 37}, "itemId": "Nk2Q5Y4Jvaizwiil", "nullFields": ["atuUjjt9lIMGql5E", "3ncDlwi3v3MFFJ1K", "lEa9EIIlGcHB3CfR"], "quantity": 9, "type": "ITEM"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateReward' test.out

#- 25 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ecjXJbZDKKoxLE1Y' \
    --limit '47' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 25 'QueryTiers' test.out

#- 26 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'pdXpai0rYaT5hOPj' \
    --body '{"index": 1, "quantity": 11, "tier": {"requiredExp": 43, "rewards": {"3H0tYighU0VUfcYH": ["JbBfAKSiPW3VgsZX", "iR1DJ7HVWqMkNSaw", "QUWDFJvJBWic7UkB"], "eIXuqDuAXI66bQ71": ["w0deoV9Lx5RDA1l2", "XcrciYNEzvSZIPkh", "SgORcz5S5BvmgBLx"], "h4ijFnE3Tam69qSZ": ["7PC6f6QkmZXElW9Y", "fRSse6AAz3S4czz0", "QKFlAVmVLu4AOec0"]}}}' \
    > test.out 2>&1
eval_tap $? 26 'CreateTier' test.out

#- 27 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id 'z8eBeeoip68J1nsv' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4W2OJhtafxMSJlHe' \
    --body '{"requiredExp": 3, "rewards": {"lLKWUtDQs61OQAox": ["yyQpRWCiiPDGQhNP", "EwiJCf2XJVrlzqQl", "s1ozhLVA3kE8jKvg"], "atOEBM70TdlNBJYO": ["mpu1VCarzBsV6xnZ", "5Jrzzjrcaug6CWVG", "8SWP3glU6muswVJn"], "NnN7kAa7j0riFc5H": ["THQIoVsGo7dwV9DB", "qFKHQkETJyTlUrwD", "TnoujQD4IEiH9Z5q"]}}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTier' test.out

#- 28 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'Xn3aoRtlqOECohVi' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HA5CzgFSy8X1A3Pr' \
    > test.out 2>&1
eval_tap $? 28 'DeleteTier' test.out

#- 29 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'Ifapq5AAeMe4L3mD' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WORBVXTIIJM9XsYI' \
    --body '{"newIndex": 72}' \
    > test.out 2>&1
eval_tap $? 29 'ReorderTier' test.out

#- 30 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'QNxot371W9G4AvQk' \
    --force  \
    > test.out 2>&1
eval_tap $? 30 'UnpublishSeason' test.out

#- 31 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'qsGnmyo5JJTUVmb8' \
    --limit '66' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 31 'GetUserParticipatedSeasons' test.out

#- 32 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'EXFTlEMEsFzYqwgK' \
    --body '{"exp": 22, "source": "PAID_FOR", "tags": ["p5nodqpLm7FhJBNX", "zAFdO0Khqf6kiTdS", "Gv2LFjAKY7CbgsWq"]}' \
    > test.out 2>&1
eval_tap $? 32 'GrantUserExp' test.out

#- 33 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'FWZX7kPBom8F9GLL' \
    --body '{"passCode": "TG8phc3n4iLoIllK", "passItemId": "lpO2pqiXJF3WGRao"}' \
    > test.out 2>&1
eval_tap $? 33 'GrantUserPass' test.out

#- 34 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'QomSJC4DdrKF7SUQ' \
    --passCodes 'PLG59e0k5ZtX6wK7,PpUlcIW32iK7MGt1,ixY5rA1WoVeJIePF' \
    > test.out 2>&1
eval_tap $? 34 'ExistsAnyPassByPassCodes' test.out

#- 35 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId '8ZrQzP4zvtdxdbZU' \
    > test.out 2>&1
eval_tap $? 35 'GetCurrentUserSeasonProgression' test.out

#- 36 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'pd6FJtHJ1pyVwyKQ' \
    --body '{"passItemId": "LY6FEO65Rb3z7CYL", "tierItemCount": 79, "tierItemId": "Zi7s7QBlk44Z44B1"}' \
    > test.out 2>&1
eval_tap $? 36 'CheckSeasonPurchasable' test.out

#- 37 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZgKg4uKxaCgcGLu' \
    > test.out 2>&1
eval_tap $? 37 'ResetUserSeason' test.out

#- 38 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'C3brWdTYCfHkIySo' \
    --body '{"count": 20, "source": "SWEAT", "tags": ["5DiXZtLW87rGysry", "od3dNQrmsApRA6HX", "3RwrKt2ecozL0TOg"]}' \
    > test.out 2>&1
eval_tap $? 38 'GrantUserTier' test.out

#- 39 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '54vCE48L5oLF6M4l' \
    --from 'Na4JUMSHNgqRqCV7' \
    --limit '42' \
    --offset '62' \
    --seasonId 'samANkZlOX9Sfo95' \
    --source 'PAID_FOR' \
    --tags 'iktm0ZPLkLOsp0LZ,5njN86Hl8kUXzt6b,Sc6bWvgpVyW9dD1k' \
    --to 'OmvrAejcq2LgkQua' \
    > test.out 2>&1
eval_tap $? 39 'QueryUserExpGrantHistory' test.out

#- 40 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'S7RBx3vim02jBOxr' \
    --seasonId 'ZDyvpcLYOWA8NjxO' \
    > test.out 2>&1
eval_tap $? 40 'QueryUserExpGrantHistoryTag' test.out

#- 41 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'naEok4nOOCzfsflh' \
    --userId 'jbngJOUn18G5MlfD' \
    > test.out 2>&1
eval_tap $? 41 'GetUserSeason' test.out

#- 42 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'Tk8aG40NlncceIZS' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCurrentSeason' test.out

#- 43 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'wgAIkgzh4pTU0Am4' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetCurrentUserSeason' test.out

#- 44 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'DZhl0bQxFJ3sWCqQ' \
    --body '{"passCode": "pQ2FbKPFMycMSQ4q", "rewardCode": "fAacR0LgB5BUXvjc", "tierIndex": 42}' \
    > test.out 2>&1
eval_tap $? 44 'PublicClaimUserReward' test.out

#- 45 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'lNos4yBRjrERHEon' \
    > test.out 2>&1
eval_tap $? 45 'PublicBulkClaimUserRewards' test.out

#- 46 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AZR8GmEu0q1p6QCy' \
    --userId 'Y6vSkVFWdsbYuVEG' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE