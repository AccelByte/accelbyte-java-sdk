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
    --limit '62' \
    --offset '39' \
    --status 'PUBLISHED,PUBLISHED,PUBLISHED' \
    > test.out 2>&1
eval_tap $? 2 'QuerySeasons' test.out

#- 3 CreateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass createSeason \
    --namespace "$AB_NAMESPACE" \
    --body '{"autoClaim": false, "defaultLanguage": "CA9kPI6LZrkq6Dc0", "defaultRequiredExp": 98, "draftStoreId": "nIW0Oaiw9B0D7eHp", "end": "1983-09-25T00:00:00Z", "excessStrategy": {"currency": "Sn3ZPUdc0qh4n8mz", "method": "NONE", "percentPerExp": 72}, "images": [{"as": "m8SAMTwE6I56IaRD", "caption": "BXxyaNoMR6hkspIn", "height": 36, "imageUrl": "ngUNB1vRodwpzS6D", "smallImageUrl": "aDpv8N7ZQVqGj6oD", "width": 76}, {"as": "fh5pUkHODpoMF78N", "caption": "Y4YkHs1cnz1JSDgY", "height": 93, "imageUrl": "olvbTgrhRTcPiSuL", "smallImageUrl": "0Sly6XM4OI18mAQL", "width": 28}, {"as": "zNIicXm7agSrjJW2", "caption": "OQNOs1PXhT5FvdiR", "height": 16, "imageUrl": "5TB0i7pKxR8dl0zR", "smallImageUrl": "VW4EZG9m0XcgGVbM", "width": 33}], "localizations": {"fqlqNiTvB6SdAdIh": {"description": "UDrwoZ5MecdKi5r6", "title": "QEa1ysLEzth6mXhz"}, "kzWkFeZSoEAcBdW1": {"description": "9m4eu6d5tA5jUmiT", "title": "qpyhPFdxLzFQN05M"}, "YzYiKWe5dNRljv7I": {"description": "PrDQQRgat0SevkLG", "title": "MS0lyuI9a2I9u6Vp"}}, "name": "bsx5w8hqUI06UpOX", "start": "1987-07-19T00:00:00Z", "tierItemId": "SLmCVuHOPlLlkvR8"}' \
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
    --body '{"userIds": ["sKgnuRkgghGoYupD", "391C2qtPYokahFjk", "QsfCaTmt1d67FXGk"]}' \
    > test.out 2>&1
eval_tap $? 5 'BulkGetUserSeasonProgression' test.out

#- 6 GetSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId '2s9Q0mPVo3twu0Me' \
    > test.out 2>&1
eval_tap $? 6 'GetSeason' test.out

#- 7 DeleteSeason
./ng net.accelbyte.sdk.cli.Main seasonpass deleteSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'sTCf9x4rt69lna7q' \
    > test.out 2>&1
eval_tap $? 7 'DeleteSeason' test.out

#- 8 UpdateSeason
./ng net.accelbyte.sdk.cli.Main seasonpass updateSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'xNeIxPz6MbwL6IY6' \
    --body '{"autoClaim": true, "defaultLanguage": "z1UaLqYSYWytLPzi", "defaultRequiredExp": 80, "draftStoreId": "oNRKd3IL5TAQ6iiP", "end": "1976-09-27T00:00:00Z", "excessStrategy": {"currency": "SC2uE4o5Vwdo3feP", "method": "NONE", "percentPerExp": 4}, "images": [{"as": "IJA8IHtrkmu0hpDD", "caption": "WVAla2l5BYNtIuS5", "height": 91, "imageUrl": "9RGCCHYzUOcEdscK", "smallImageUrl": "HPEqgA8yu7Vk6Jt4", "width": 36}, {"as": "mos9Jcdos4fYcTVU", "caption": "6RBt0zYoMcHyCUEX", "height": 24, "imageUrl": "maLoxozr6wfNPX2b", "smallImageUrl": "OItRMvqtlB2jJCSQ", "width": 94}, {"as": "JlDbPWbQ6Q9lNmqR", "caption": "BaAkLnvxkT1X68cm", "height": 60, "imageUrl": "U5SepjChB3V0v52D", "smallImageUrl": "lym6puQ23xoJ8aeC", "width": 27}], "localizations": {"51TkhjYnaq6foWvX": {"description": "a3bMrXsDr6kILsSS", "title": "yDdmykmoPYgc2L4j"}, "k4Lo0LSP0pf4IxjU": {"description": "kl535X3ateEKDpAD", "title": "z1x3poD3Qgb3boLQ"}, "Q1MzH7Qm8bwbmXgd": {"description": "APh1EThG96gAFKK2", "title": "WDgCcxvONZm3EeER"}}, "name": "mDnyeFoF7VSZ6pf3", "start": "1982-09-15T00:00:00Z", "tierItemId": "neSD2Tb3g7mSQUhA"}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateSeason' test.out

#- 9 CloneSeason
./ng net.accelbyte.sdk.cli.Main seasonpass cloneSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'EtrmjqU6YE3p4lSc' \
    --body '{"end": "1976-05-18T00:00:00Z", "name": "0ZHn5GI39YBHqaTH", "start": "1973-06-27T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 9 'CloneSeason' test.out

#- 10 GetFullSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getFullSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'KtW18iGeUlc9d9so' \
    > test.out 2>&1
eval_tap $? 10 'GetFullSeason' test.out

#- 11 QueryPasses
./ng net.accelbyte.sdk.cli.Main seasonpass queryPasses \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'gWa24CKNS0GqVvUf' \
    > test.out 2>&1
eval_tap $? 11 'QueryPasses' test.out

#- 12 CreatePass
./ng net.accelbyte.sdk.cli.Main seasonpass createPass \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'HQvsHXNUNe4mhgo5' \
    --body '{"autoEnroll": true, "code": "48l9lyNApflxqMrj", "displayOrder": 66, "images": [{"as": "oZk03QXcKMDYDDxH", "caption": "SZjtqXyJ58f7Gc26", "height": 92, "imageUrl": "DmIbeZxzfTcyiuAT", "smallImageUrl": "us9hsfpFDcSDG8aM", "width": 98}, {"as": "HyPLtI8ilbyDPUIj", "caption": "88cekdqCt81P1ktf", "height": 71, "imageUrl": "DmeIP6rOvDz9KOsb", "smallImageUrl": "392k6YmJFfRByjlB", "width": 16}, {"as": "9LJE8HoRS1X2PFAA", "caption": "MwzHPxB1UskYs4Yw", "height": 50, "imageUrl": "0DOqOBSC2DKHRuPM", "smallImageUrl": "MWH8Yb33T5UBJCjf", "width": 5}], "localizations": {"eDxOgBnhhqElIaDm": {"description": "l48wdNFLTm5T50x9", "title": "WT0GfH2rtOa4EXsX"}, "zOXQAk4mqrxzTtuL": {"description": "l4XlbGL8QOxtjzm8", "title": "y2wNhmwoYZyI4EFZ"}, "KBcYrCEAE7WIsfmx": {"description": "40NLRc6m8heKnWhz", "title": "fe2NubeoKFeIaFQC"}}, "passItemId": "YoDPICpnduEEQlUL"}' \
    > test.out 2>&1
eval_tap $? 12 'CreatePass' test.out

#- 13 GetPass
./ng net.accelbyte.sdk.cli.Main seasonpass getPass \
    --code 'dJz4mnRBkMNxvvKg' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'AT8mJrYq6hRkloqx' \
    > test.out 2>&1
eval_tap $? 13 'GetPass' test.out

#- 14 DeletePass
./ng net.accelbyte.sdk.cli.Main seasonpass deletePass \
    --code 'M3gpwxcfMy9XzjjI' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '5YbsKoADkzJEN2VH' \
    > test.out 2>&1
eval_tap $? 14 'DeletePass' test.out

#- 15 UpdatePass
./ng net.accelbyte.sdk.cli.Main seasonpass updatePass \
    --code 'zih3bit0VWn3CO39' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'PXDNxtXgeO3FgkXh' \
    --body '{"autoEnroll": false, "displayOrder": 60, "images": [{"as": "A2yyd4mbqoOfADMM", "caption": "AXFaY9eKa699bRVh", "height": 50, "imageUrl": "rbHDIDm4hMzF4Txo", "smallImageUrl": "denSrUTvfqU0bfoM", "width": 25}, {"as": "OfjnCuHZ3c46IjGa", "caption": "23YvYmmDg7VYPXIu", "height": 44, "imageUrl": "VxsZNereSvf9699m", "smallImageUrl": "CEHThUJkETAsSp7g", "width": 15}, {"as": "imdb4rbkXj0ZwsVC", "caption": "0gL97ZVJSPqJiwv1", "height": 34, "imageUrl": "fLCr3OOlXVv8ZGF7", "smallImageUrl": "uYnGzpipNDigNJma", "width": 64}], "localizations": {"MbqqZtfNWql4nmwA": {"description": "ft4gqkNNlWkD9eOz", "title": "iYRFOn0jJLHC9Lxh"}, "vNXTwGBCtohLtl9Z": {"description": "uhytm5UDrT6QXCs5", "title": "SPBbRPZTF6oQAXVG"}, "7tnsZg5QgXjvyGJP": {"description": "N4eXbJE5Vs2Gcyom", "title": "QoIXimBJehyxlNsj"}}, "passItemId": "UgxBkF6wFPoJeQed"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdatePass' test.out

#- 16 PublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'iogEhhM2rIizGdKv' \
    > test.out 2>&1
eval_tap $? 16 'PublishSeason' test.out

#- 17 RetireSeason
./ng net.accelbyte.sdk.cli.Main seasonpass retireSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'OPdq5xrgxSmy1DN9' \
    --force  \
    > test.out 2>&1
eval_tap $? 17 'RetireSeason' test.out

#- 18 QueryRewards
./ng net.accelbyte.sdk.cli.Main seasonpass queryRewards \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'LFkYW5DQyj4bj5Ro' \
    --q '2ogaKt2ujQSa3Zdb' \
    > test.out 2>&1
eval_tap $? 18 'QueryRewards' test.out

#- 19 CreateReward
./ng net.accelbyte.sdk.cli.Main seasonpass createReward \
    --namespace "$AB_NAMESPACE" \
    --seasonId '65UXmy0Zp6iIaTIK' \
    --body '{"code": "Ukmkk9QM0NBMA9OR", "currency": {"currencyCode": "xpzwLR2AK6eXUGPJ", "namespace": "sw1fiP80G9Pclxcf"}, "image": {"as": "t2ulIJzPyrVEiOG4", "caption": "UcqsuGKHhMRWLVd3", "height": 61, "imageUrl": "2lPnsbD3SGEdlwuU", "smallImageUrl": "ccE536ugBp3HBvep", "width": 28}, "itemId": "udsMrok0WvGYYnx4", "quantity": 99, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateReward' test.out

#- 20 GetReward
./ng net.accelbyte.sdk.cli.Main seasonpass getReward \
    --code '709xbnGezKsDwG2o' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'mOR2nvYI9TVqJdvz' \
    > test.out 2>&1
eval_tap $? 20 'GetReward' test.out

#- 21 DeleteReward
./ng net.accelbyte.sdk.cli.Main seasonpass deleteReward \
    --code 'cWbfUpaXp5JMl5LL' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '4bTxBmZjdrrIxsB0' \
    > test.out 2>&1
eval_tap $? 21 'DeleteReward' test.out

#- 22 UpdateReward
./ng net.accelbyte.sdk.cli.Main seasonpass updateReward \
    --code 'NRsB1fPqqRRulpqp' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'ymDkQhtrHWwRVnwV' \
    --body '{"currency": {"currencyCode": "BOqOHi8pWGd1juYh", "namespace": "iqjRJOqB5F93zFQb"}, "image": {"as": "JndUDpdONneAczbB", "caption": "dHb2slt71B1SmZp2", "height": 74, "imageUrl": "k0iKoTTS1j02o7Jj", "smallImageUrl": "TXAQN0qdskdQV0Tq", "width": 72}, "itemId": "0eaKQDOJvrTefglS", "nullFields": ["0LcghVHfPEspxwhR", "ekp18lOC3mNqF7Bl", "s6g4iY9u02aCNYIW"], "quantity": 84, "type": "CURRENCY"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdateReward' test.out

#- 23 QueryTiers
./ng net.accelbyte.sdk.cli.Main seasonpass queryTiers \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0bc1eMbEIjowLqc3' \
    --limit '10' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 23 'QueryTiers' test.out

#- 24 CreateTier
./ng net.accelbyte.sdk.cli.Main seasonpass createTier \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cjXJbZDKKoxLE1Y3' \
    --body '{"index": 60, "quantity": 31, "tier": {"requiredExp": 50, "rewards": {"dXpai0rYaT5hOPja": ["f3H0tYighU0VUfcY", "HJbBfAKSiPW3VgsZ", "XiR1DJ7HVWqMkNSa"], "wQUWDFJvJBWic7Uk": ["BeIXuqDuAXI66bQ7", "1w0deoV9Lx5RDA1l", "2XcrciYNEzvSZIPk"], "hSgORcz5S5BvmgBL": ["xh4ijFnE3Tam69qS", "Z7PC6f6QkmZXElW9", "YfRSse6AAz3S4czz"]}}}' \
    > test.out 2>&1
eval_tap $? 24 'CreateTier' test.out

#- 25 UpdateTier
./ng net.accelbyte.sdk.cli.Main seasonpass updateTier \
    --id '0QKFlAVmVLu4AOec' \
    --namespace "$AB_NAMESPACE" \
    --seasonId '0z8eBeeoip68J1ns' \
    --body '{"requiredExp": 44, "rewards": {"a29fDLh741IslKHz": ["GlLKWUtDQs61OQAo", "xyyQpRWCiiPDGQhN", "PEwiJCf2XJVrlzqQ"], "ls1ozhLVA3kE8jKv": ["gatOEBM70TdlNBJY", "Ompu1VCarzBsV6xn", "Z5Jrzzjrcaug6CWV"], "G8SWP3glU6muswVJ": ["nNnN7kAa7j0riFc5", "HTHQIoVsGo7dwV9D", "BqFKHQkETJyTlUrw"]}}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateTier' test.out

#- 26 DeleteTier
./ng net.accelbyte.sdk.cli.Main seasonpass deleteTier \
    --id 'DTnoujQD4IEiH9Z5' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'qXn3aoRtlqOECohV' \
    > test.out 2>&1
eval_tap $? 26 'DeleteTier' test.out

#- 27 ReorderTier
./ng net.accelbyte.sdk.cli.Main seasonpass reorderTier \
    --id 'iHA5CzgFSy8X1A3P' \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'rIfapq5AAeMe4L3m' \
    --body '{"newIndex": 61}' \
    > test.out 2>&1
eval_tap $? 27 'ReorderTier' test.out

#- 28 UnpublishSeason
./ng net.accelbyte.sdk.cli.Main seasonpass unpublishSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'WgU4pCAKxeE70Cau' \
    --force  \
    > test.out 2>&1
eval_tap $? 28 'UnpublishSeason' test.out

#- 29 GetUserParticipatedSeasons
./ng net.accelbyte.sdk.cli.Main seasonpass getUserParticipatedSeasons \
    --namespace "$AB_NAMESPACE" \
    --userId 'nQNxot371W9G4AvQ' \
    --limit '21' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 29 'GetUserParticipatedSeasons' test.out

#- 30 GrantUserExp
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserExp \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUBhyoTsMWPAxUMk' \
    --body '{"exp": 1, "source": "SWEAT", "tags": ["waGpAyrIwMif3BOd", "kocVTd4BxqGWV6mT", "J0sQs6XNbjvqhnUV"]}' \
    > test.out 2>&1
eval_tap $? 30 'GrantUserExp' test.out

#- 31 GrantUserPass
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserPass \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWu8olKdxL6ozRmD' \
    --body '{"passCode": "D0jJvlfV5OemPYdY", "passItemId": "T7DROCjtuzFMbAG9"}' \
    > test.out 2>&1
eval_tap $? 31 'GrantUserPass' test.out

#- 32 ExistsAnyPassByPassCodes
./ng net.accelbyte.sdk.cli.Main seasonpass existsAnyPassByPassCodes \
    --namespace "$AB_NAMESPACE" \
    --userId 'YI89hmguB8FOTjML' \
    --passCodes 'o4b9rIzqYkEpstyV,TBcrM8rG0rH0zcsw,wVeMK6MbGIVIu8vv' \
    > test.out 2>&1
eval_tap $? 32 'ExistsAnyPassByPassCodes' test.out

#- 33 GetCurrentUserSeasonProgression
./ng net.accelbyte.sdk.cli.Main seasonpass getCurrentUserSeasonProgression \
    --namespace "$AB_NAMESPACE" \
    --userId 'wLc7KY3uVoJXTIMt' \
    > test.out 2>&1
eval_tap $? 33 'GetCurrentUserSeasonProgression' test.out

#- 34 CheckSeasonPurchasable
./ng net.accelbyte.sdk.cli.Main seasonpass checkSeasonPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'pgkieDyF97lGdMiH' \
    --body '{"passItemId": "KxbWCYzo8yO2KTK9", "tierItemCount": 39, "tierItemId": "QLY6FEO65Rb3z7CY"}' \
    > test.out 2>&1
eval_tap $? 34 'CheckSeasonPurchasable' test.out

#- 35 ResetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass resetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'LM8IlsHqffnrfsGl' \
    > test.out 2>&1
eval_tap $? 35 'ResetUserSeason' test.out

#- 36 GrantUserTier
./ng net.accelbyte.sdk.cli.Main seasonpass grantUserTier \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPaZKBwa3Ddb60uf' \
    --body '{"count": 86, "source": "SWEAT", "tags": ["pzwj1QGIFmlVf4jv", "apseE9LN9bvhOrHf", "lIOd6X3viLvtEk4m"]}' \
    > test.out 2>&1
eval_tap $? 36 'GrantUserTier' test.out

#- 37 QueryUserExpGrantHistory
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'TIpUA9gxo8SV38nE' \
    --from 'hoXmM2W7l6jHMA2r' \
    --limit '67' \
    --offset '22' \
    --seasonId '3nakopAywelu01nr' \
    --source 'SWEAT' \
    --tags 'usamANkZlOX9Sfo9,5HgXqKhTPkwfLM9u,SybRzWek2gZvRrvr' \
    --to '0n9d9lvccKMLhrTr' \
    > test.out 2>&1
eval_tap $? 37 'QueryUserExpGrantHistory' test.out

#- 38 QueryUserExpGrantHistoryTag
./ng net.accelbyte.sdk.cli.Main seasonpass queryUserExpGrantHistoryTag \
    --namespace "$AB_NAMESPACE" \
    --userId 'cBE2ItBS3KtKZWe8' \
    --seasonId 'aoFzAyBME74HUtip' \
    > test.out 2>&1
eval_tap $? 38 'QueryUserExpGrantHistoryTag' test.out

#- 39 GetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass getUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'UWYhWV1qx8CzPML5' \
    --userId '2faXUr9Sk4lq2faB' \
    > test.out 2>&1
eval_tap $? 39 'GetUserSeason' test.out

#- 40 PublicGetCurrentSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentSeason \
    --namespace "$AB_NAMESPACE" \
    --language 'cAXXKlhvyH8paOJt' \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCurrentSeason' test.out

#- 41 PublicGetCurrentUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetCurrentUserSeason \
    --namespace "$AB_NAMESPACE" \
    --userId 'xqMPpcVfRwNj547f' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCurrentUserSeason' test.out

#- 42 PublicClaimUserReward
./ng net.accelbyte.sdk.cli.Main seasonpass publicClaimUserReward \
    --namespace "$AB_NAMESPACE" \
    --userId 'H0XrKEDpEY8VnocG' \
    --body '{"passCode": "Ajci0V3tBf2jnHGK", "rewardCode": "Xphn50c9tNLDljhZ", "tierIndex": 20}' \
    > test.out 2>&1
eval_tap $? 42 'PublicClaimUserReward' test.out

#- 43 PublicBulkClaimUserRewards
./ng net.accelbyte.sdk.cli.Main seasonpass publicBulkClaimUserRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'qfAacR0LgB5BUXvj' \
    > test.out 2>&1
eval_tap $? 43 'PublicBulkClaimUserRewards' test.out

#- 44 PublicGetUserSeason
./ng net.accelbyte.sdk.cli.Main seasonpass publicGetUserSeason \
    --namespace "$AB_NAMESPACE" \
    --seasonId 'cu2s6w3VifnKqmTS' \
    --userId 'oGH1XEfY6QAYn6WQ' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserSeason' test.out


rm -f "tmp.dat"

exit $EXIT_CODE