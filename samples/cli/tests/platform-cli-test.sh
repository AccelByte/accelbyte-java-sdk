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
echo "1..362"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListFulfillmentScripts
./ng net.accelbyte.sdk.cli.Main platform listFulfillmentScripts \
    > test.out 2>&1
eval_tap $? 2 'ListFulfillmentScripts' test.out

#- 3 TestFulfillmentScriptEval
./ng net.accelbyte.sdk.cli.Main platform testFulfillmentScriptEval \
    --body '{"context": {"item": {"appId": "kA8wD5jd", "appType": "GAME", "baseAppId": "oTrWrIE1", "boothName": "uXUgbJsa", "boundItemIds": ["PlLJtTNA", "o0AxWk0J", "2WJ62uZo"], "categoryPath": "f0vIJQGq", "clazz": "QanMWm8n", "createdAt": "1997-11-25T00:00:00Z", "description": "d1TarUFm", "displayOrder": 0, "entitlementType": "DURABLE", "ext": {"fgKS5dZQ": {}, "W1lQ0LUz": {}, "syo3S3Y5": {}}, "features": ["6bG1PXTF", "z42qRybH", "w4JhFiAO"], "fresh": false, "images": [{"as": "dI8D3ryV", "caption": "hsqJ8iLs", "height": 94, "imageUrl": "S91DWivW", "smallImageUrl": "RJKcILSo", "width": 80}, {"as": "7oiB4oxS", "caption": "VEwxJQtO", "height": 20, "imageUrl": "TgRiYUID", "smallImageUrl": "o260AvHy", "width": 80}, {"as": "qYHuMtbx", "caption": "LKhCGuXm", "height": 34, "imageUrl": "HnovNIEH", "smallImageUrl": "B0qVt1Ux", "width": 69}], "itemId": "D9joVlnr", "itemIds": ["rHT8v8RD", "7jK6B59l", "IsX9hfMJ"], "itemQty": {"R5mrMxvZ": 55, "GD0ibQcd": 75, "hFx9qFTj": 7}, "itemType": "BUNDLE", "language": "vf8lnfWJ", "listable": true, "localExt": {"9LRgR4Sa": {}, "0VvqIWAE": {}, "GwEqy3Oq": {}}, "longDescription": "x9vN6jxS", "lootBoxConfig": {"rewardCount": 32, "rewards": [{"lootBoxItems": [{"count": 97, "itemId": "LFVl24dv", "itemSku": "g5uVyMZu", "itemType": "6vc8G6kn"}, {"count": 70, "itemId": "Tol3V5Ke", "itemSku": "bvQ0dvJZ", "itemType": "Oe0aCaFZ"}, {"count": 88, "itemId": "tOKcuWSH", "itemSku": "7mxS1wWB", "itemType": "Y2lhn3RG"}], "name": "raDrNtVo", "odds": 0.8659137909726623, "type": "PROBABILITY_GROUP", "weight": 27}, {"lootBoxItems": [{"count": 36, "itemId": "AOGINOWt", "itemSku": "qxwjT2HF", "itemType": "niLSffyL"}, {"count": 5, "itemId": "LjiLuCrv", "itemSku": "QaNkSaPG", "itemType": "vq6DchmH"}, {"count": 61, "itemId": "rLqFjExs", "itemSku": "E0RB2mHo", "itemType": "QQcB4TI3"}], "name": "KqdjU0sW", "odds": 0.902937504678494, "type": "REWARD_GROUP", "weight": 97}, {"lootBoxItems": [{"count": 85, "itemId": "QLtUKxx5", "itemSku": "CriVdrlZ", "itemType": "KGdwWezd"}, {"count": 82, "itemId": "6NOnE1MU", "itemSku": "zt6vxApp", "itemType": "FRaI3IvU"}, {"count": 3, "itemId": "UBcWp9wG", "itemSku": "SI3CVCGc", "itemType": "hngQHRYk"}], "name": "UycAL9Rm", "odds": 0.04270008299983985, "type": "REWARD", "weight": 14}]}, "maxCount": 63, "maxCountPerUser": 6, "name": "xDrCbyqk", "namespace": "SVPnYLrP", "optionBoxConfig": {"boxItems": [{"count": 23, "itemId": "65v7ZiM8", "itemSku": "zjGjRVKd", "itemType": "NdapNhHq"}, {"count": 64, "itemId": "OlFtxlnd", "itemSku": "pfcMcntw", "itemType": "kYQal7IE"}, {"count": 16, "itemId": "OALBiMnw", "itemSku": "Pc4N6ONN", "itemType": "mnYSCBbI"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 35, "comparison": "isNot", "name": "epL6NrGG", "predicateType": "SeasonTierPredicate", "value": "Fibiw7do", "values": ["X6yyHghy", "fz5dVyRO", "LK6n3VUR"]}, {"anyOf": 94, "comparison": "isLessThan", "name": "ofJgDhWi", "predicateType": "EntitlementPredicate", "value": "RQwI1j2D", "values": ["bh8y1z7F", "xdewl5XQ", "CinZbDIr"]}, {"anyOf": 7, "comparison": "isLessThan", "name": "1LuLkeWp", "predicateType": "SeasonTierPredicate", "value": "lJmYBbxE", "values": ["IaSrFyFG", "AcmtwV3a", "M6HqhdOT"]}]}, {"operator": "or", "predicates": [{"anyOf": 48, "comparison": "includes", "name": "YeVV3l8x", "predicateType": "SeasonTierPredicate", "value": "pPZ3Nu5b", "values": ["ROquGV9A", "I6FKfUbE", "pMOQSGfk"]}, {"anyOf": 62, "comparison": "excludes", "name": "BmmA0rbG", "predicateType": "SeasonPassPredicate", "value": "zkO0BVYK", "values": ["ReQC2QZJ", "Sgu6gVNf", "hP3NFvuY"]}, {"anyOf": 66, "comparison": "includes", "name": "t5iT0irq", "predicateType": "SeasonPassPredicate", "value": "o3FOrf4v", "values": ["kC6fl7TE", "SHtmo1ZU", "yp9Ij5rC"]}]}, {"operator": "or", "predicates": [{"anyOf": 88, "comparison": "includes", "name": "kLwmyWC2", "predicateType": "SeasonPassPredicate", "value": "nKBYUtZZ", "values": ["vdN09ZaD", "kW8TGM7b", "brvxp9oP"]}, {"anyOf": 83, "comparison": "isLessThan", "name": "npxkAYsT", "predicateType": "EntitlementPredicate", "value": "F21hKV9n", "values": ["YXppar4p", "Yl4NmEeS", "2ImNSebS"]}, {"anyOf": 68, "comparison": "includes", "name": "2qAOh2Ke", "predicateType": "EntitlementPredicate", "value": "tHWquO9j", "values": ["NyWmf0N8", "r325uEBk", "TltkFj0d"]}]}]}, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 56, "fixedTrialCycles": 54, "graceDays": 19}, "region": "yNMOvQMF", "regionData": [{"currencyCode": "7fOQVub1", "currencyNamespace": "PtfbFcoe", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1978-04-13T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1984-08-12T00:00:00Z", "discountedPrice": 100, "expireAt": "1988-09-10T00:00:00Z", "price": 56, "purchaseAt": "1990-08-20T00:00:00Z", "trialPrice": 45}, {"currencyCode": "9IwbCnca", "currencyNamespace": "p7AZfsDP", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1976-10-09T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1984-11-30T00:00:00Z", "discountedPrice": 68, "expireAt": "1996-07-30T00:00:00Z", "price": 55, "purchaseAt": "1995-10-09T00:00:00Z", "trialPrice": 46}, {"currencyCode": "GKUSwbLh", "currencyNamespace": "m98OTqHC", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1985-07-27T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1977-09-16T00:00:00Z", "discountedPrice": 64, "expireAt": "1993-11-16T00:00:00Z", "price": 20, "purchaseAt": "1983-03-06T00:00:00Z", "trialPrice": 43}], "seasonType": "TIER", "sku": "FPj0wDM4", "stackable": false, "status": "INACTIVE", "tags": ["7Ou6kCZB", "S3p9pA5g", "vpZ6DvjH"], "targetCurrencyCode": "R9AAf9b2", "targetItemId": "H86k3Khn", "targetNamespace": "dX84Bo1B", "thumbnailUrl": "EY0qaoDl", "title": "bEzOeef5", "updatedAt": "1987-02-22T00:00:00Z", "useCount": 86}, "namespace": "BBnj7rq4", "order": {"currency": {"currencyCode": "j4eQyK9p", "currencySymbol": "oXMAHRgf", "currencyType": "REAL", "decimals": 15, "namespace": "14MYkvCo"}, "ext": {"EEywg4jY": {}, "0sZUFoiS": {}, "sAgDBm4j": {}}, "free": true}, "source": "DLC"}, "script": "fJqXGDGm", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'FjvcW4aC' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 't8BP06Ay' \
    --body '{"grantDays": "J2VB3VGf"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'Yye8OZjz' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'TTMTFpN6' \
    --body '{"grantDays": "8KMbSzTX"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "Pg0dFNDI", "dryRun": false, "fulfillmentUrl": "SfQBn5TW", "itemType": "COINS", "purchaseConditionUrl": "AKyyrC8J"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'vYuDbQ3X' \
    --itemType 'EXTENSION' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'RDgpqy4h' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'LCrwiYep' \
    --body '{"clazz": "chQodu6D", "dryRun": true, "fulfillmentUrl": "YzQDrw26", "purchaseConditionUrl": "8RzVcYKd"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'Gc1UpSOp' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --name 'DWQqT3ib' \
    --offset '4' \
    --tag 'CPJtrUFr' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Ra0qcFhB", "items": [{"extraSubscriptionDays": 22, "itemId": "sfUxCgEQ", "itemName": "A64MR3nM", "quantity": 62}, {"extraSubscriptionDays": 20, "itemId": "FE5XXCMN", "itemName": "gDX8LWf3", "quantity": 45}, {"extraSubscriptionDays": 2, "itemId": "OpDNym3i", "itemName": "FM4tWCoz", "quantity": 100}], "maxRedeemCountPerCampaignPerUser": 92, "maxRedeemCountPerCode": 58, "maxRedeemCountPerCodePerUser": 32, "maxSaleCount": 99, "name": "L19gzpky", "redeemEnd": "1973-03-30T00:00:00Z", "redeemStart": "1990-02-11T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["1xUliDyq", "4OxZTKRJ", "IDrVfEK2"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'LniWqKh1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'WM0n8Kjv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "OIpOOu4d", "items": [{"extraSubscriptionDays": 9, "itemId": "xIaDgTWM", "itemName": "7fw1EKCx", "quantity": 69}, {"extraSubscriptionDays": 90, "itemId": "rEP9aOKC", "itemName": "Uch9OJ5k", "quantity": 37}, {"extraSubscriptionDays": 94, "itemId": "ZRRp8jzl", "itemName": "JlWh6urH", "quantity": 6}], "maxRedeemCountPerCampaignPerUser": 9, "maxRedeemCountPerCode": 23, "maxRedeemCountPerCodePerUser": 60, "maxSaleCount": 9, "name": "sC2NLUya", "redeemEnd": "1971-02-03T00:00:00Z", "redeemStart": "1993-08-26T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["1jZNdJa1", "tYKqWYq7", "pi0e3onz"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'PHg8Qp7T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tLlej6JI' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ylrm8xDr' \
    --body '{"categoryPath": "p3VAHZ24", "localizationDisplayNames": {"n931Sdzr": "hPSHfjwE", "1wEY6UOB": "k0TeZMib", "oHiq6iaM": "PtaWNvDe"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XqtbJq7s' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'sAZEoZ4v' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kuMjmEKO' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '7vnrXcyr' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'prmNXDQN' \
    --body '{"localizationDisplayNames": {"uTiXs4IW": "IZVQvFtf", "uD9vIA1A": "vq1Hqzrq", "IHVIybIR": "N5bOL9iP"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'AEhoiFO2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I0qU91RC' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'KJXTDUP9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OH0sLiLY' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '6RNknIAZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O658KCiK' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '67rKZqWk' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '76' \
    --code 'fRM7EQPM' \
    --limit '41' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'pGcIzo7F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 21}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'ObNB7LM2' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '49' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'xHKX1ovH' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '35' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'PiTariQX' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '51' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'o7GPHh3I' \
    --namespace "$AB_NAMESPACE" \
    --code 'HlBAbMyQ' \
    --limit '12' \
    --offset '30' \
    --userId 'hq3x6CIb' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'YB65Uvpa' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code '5weM5bAU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'IbNMlCty' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EnableCode' test.out

#- 36 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 36 'ListCurrencies' test.out

#- 37 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "mQECbCEX", "currencySymbol": "RkZgfoNT", "currencyType": "REAL", "decimals": 88, "localizationDescriptions": {"gSemWjM0": "4qXZQh7c", "X5D4JENr": "Rg77GTay", "a6Osr8AJ": "uPieelZi"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'xKcKNSLi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"ydZCMobG": "iDiHoQyC", "gn3hGDBZ": "hJHBKdCw", "yMC1ji3M": "7uVwJ7yc"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'IlfJRQFn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'MTEy4y03' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'Fq5JcMUu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'GetCurrencySummary' test.out

#- 42 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'GetDLCItemConfig' test.out

#- 43 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "96P3FOaR", "rewards": [{"currency": {"currencyCode": "ijwCsU3n", "namespace": "4VSF6fly"}, "item": {"itemId": "e2VDPXeP", "itemSku": "FrHYG8l3", "itemType": "H6wm6dfp"}, "quantity": 84, "type": "ITEM"}, {"currency": {"currencyCode": "m4ynxkMj", "namespace": "teGNObPK"}, "item": {"itemId": "CckzgwXT", "itemSku": "WYdworTX", "itemType": "UIwNo2ph"}, "quantity": 73, "type": "CURRENCY"}, {"currency": {"currencyCode": "9N8vnj0m", "namespace": "zwfv9o2G"}, "item": {"itemId": "JAQBkMOw", "itemSku": "cyEDUIHS", "itemType": "FI9l1Frf"}, "quantity": 84, "type": "ITEM"}]}, {"id": "ZXx4eZJR", "rewards": [{"currency": {"currencyCode": "JxG9ZYTk", "namespace": "eAT5RuEV"}, "item": {"itemId": "ty043xYU", "itemSku": "el2Jwhlh", "itemType": "2n4jq0Bi"}, "quantity": 0, "type": "ITEM"}, {"currency": {"currencyCode": "dTQCz7Vl", "namespace": "sbiDrqfV"}, "item": {"itemId": "kfmnhliJ", "itemSku": "llppCPBJ", "itemType": "IjpDnnj3"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "L2n5GDyG", "namespace": "gODbrv5c"}, "item": {"itemId": "0vG6OMtN", "itemSku": "nlhJ2T6j", "itemType": "OEIVKDcA"}, "quantity": 27, "type": "ITEM"}]}, {"id": "v4Qqrqz7", "rewards": [{"currency": {"currencyCode": "7rloSNLt", "namespace": "RncrZQMi"}, "item": {"itemId": "97Bs2BoC", "itemSku": "8Hwvi0zF", "itemType": "ItOX109H"}, "quantity": 89, "type": "CURRENCY"}, {"currency": {"currencyCode": "PVZCJpOw", "namespace": "WhhS1mjU"}, "item": {"itemId": "oVXDHQmF", "itemSku": "qzTTYl4w", "itemType": "caT0MdQb"}, "quantity": 67, "type": "CURRENCY"}, {"currency": {"currencyCode": "axHzMDPk", "namespace": "nFrEScdL"}, "item": {"itemId": "dQxmEw0i", "itemSku": "mnaBSK0H", "itemType": "IacqOKjw"}, "quantity": 60, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateDLCItemConfig' test.out

#- 44 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'DeleteDLCItemConfig' test.out

#- 45 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetPlatformDLCConfig' test.out

#- 46 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"j147S02n": "0FbWzH4p", "vsdkkP0R": "mkEW4w1Q", "jRIH2g95": "vICFmuFv"}}, {"platform": "PSN", "platformDlcIdMap": {"0NZZUX2U": "QFtuy5J4", "69A2YxtE": "S9jvEyFQ", "ciLu5d07": "8jJCtdCW"}}, {"platform": "XBOX", "platformDlcIdMap": {"f2V7vm96": "A7H1IZBt", "NLFvUUcE": "rlIbsrth", "IijIFe2z": "2ORRw1Wr"}}]}' \
    > test.out 2>&1
eval_tap $? 46 'UpdatePlatformDLCConfig' test.out

#- 47 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeletePlatformDLCConfig' test.out

#- 48 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'fkMrwgVZ' \
    --itemId 'WIgrAIv4,PIjWi7sg,CS4Gf8Xq' \
    --limit '16' \
    --offset '99' \
    --userId 'ti1NCgNW' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'tyq5dqdO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '54' \
    --status 'FAIL' \
    --userId '4E17qgMW' \
    > test.out 2>&1
eval_tap $? 50 'QueryFulfillmentHistories' test.out

#- 51 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetAppleIAPConfig' test.out

#- 52 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "2zlRAdwM", "password": "EUnuofq5"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateAppleIAPConfig' test.out

#- 53 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'DeleteAppleIAPConfig' test.out

#- 54 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetEpicGamesIAPConfig' test.out

#- 55 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "bHJvYmax"}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateEpicGamesIAPConfig' test.out

#- 56 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'DeleteEpicGamesIAPConfig' test.out

#- 57 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetGoogleIAPConfig' test.out

#- 58 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "hMFass9L", "serviceAccountId": "uOBLWqKI"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateGoogleIAPConfig' test.out

#- 59 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteGoogleIAPConfig' test.out

#- 60 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGoogleP12File' test.out

#- 61 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetIAPItemConfig' test.out

#- 62 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "7TbeTHhw", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"7ZnejDyG": "ObeYEUSn", "DRu8bL0c": "8MvFR2nX", "HdmnC9l2": "MVGpgUE3"}}, {"itemIdentity": "sNcO9OZt", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"mYfTYUwb": "PvvPVsuX", "47C6dfZK": "zNApomNm", "jGRTnZjd": "pV8B14Rv"}}, {"itemIdentity": "UAkOKBN9", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"CYBogJM1": "GE78pnzy", "72gibGBT": "K9J3ISCI", "opNM9Zfw": "uXzXzRZ9"}}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateIAPItemConfig' test.out

#- 63 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteIAPItemConfig' test.out

#- 64 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetPlayStationIAPConfig' test.out

#- 65 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "yUDKqtfH"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdatePlaystationIAPConfig' test.out

#- 66 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeletePlaystationIAPConfig' test.out

#- 67 GetStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStadiaIAPConfig' test.out

#- 68 DeleteStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'DeleteStadiaIAPConfig' test.out

#- 69 UpdateStadiaJsonConfigFile
./ng net.accelbyte.sdk.cli.Main platform updateStadiaJsonConfigFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 69 'UpdateStadiaJsonConfigFile' test.out

#- 70 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetSteamIAPConfig' test.out

#- 71 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "7e5Wtwgi", "publisherAuthenticationKey": "M8zKC4Jp"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateSteamIAPConfig' test.out

#- 72 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeleteSteamIAPConfig' test.out

#- 73 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetTwitchIAPConfig' test.out

#- 74 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "GGFI3Bca", "clientSecret": "10io88Vt", "organizationId": "yDmTg4hy"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateTwitchIAPConfig' test.out

#- 75 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteTwitchIAPConfig' test.out

#- 76 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetXblIAPConfig' test.out

#- 77 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "7pZFFtFe"}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateXblIAPConfig' test.out

#- 78 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteXblAPConfig' test.out

#- 79 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'OzaoMOQu' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature '9KgDAS51' \
    --itemId 'hpkvbZB3' \
    --itemType 'SEASON' \
    --endTime 'nGUytqOQ' \
    --startTime '0zyao9fn' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '6d8MEs9B' \
    --itemId 'gsw1LXTU' \
    --itemType 'COINS' \
    --endTime 'e2qPujv8' \
    --startTime 'NcWWLTtV' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h4UNbLjr' \
    --body '{"categoryPath": "IKm6TI8U", "targetItemId": "NVup4xwS", "targetNamespace": "7xYykevW"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kd8LKuws' \
    --body '{"appId": "SCiQm1Yr", "appType": "DEMO", "baseAppId": "EAzhNsm2", "boothName": "kYxEzikn", "categoryPath": "vl3xAPm5", "clazz": "tB0qIJvx", "displayOrder": 26, "entitlementType": "CONSUMABLE", "ext": {"NNMpdHSn": {}, "CHV2zU6u": {}, "UtSY01ku": {}}, "features": ["GA7SZ8SZ", "CdBZ4NP8", "xThc4YfQ"], "images": [{"as": "md2Bild4", "caption": "fxUjhuAg", "height": 86, "imageUrl": "ImEz2zbc", "smallImageUrl": "zYBxKMuP", "width": 43}, {"as": "e7eK3jUs", "caption": "hCv1f4qU", "height": 48, "imageUrl": "qqiCoRlU", "smallImageUrl": "Ghlmyrqk", "width": 46}, {"as": "vu2ab6fj", "caption": "Bb19fQWI", "height": 31, "imageUrl": "DtOarbrT", "smallImageUrl": "AxyUBfxl", "width": 68}], "itemIds": ["QBFmxRZf", "IXTu2BFP", "rJW0Dt4W"], "itemQty": {"H5I1UiMv": 98, "qmoJeWX7": 18, "HxxCLnB0": 0}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"AzkxBi1w": {"description": "frHMEm0m", "localExt": {"qwwusXEW": {}, "6FgBVjlA": {}, "XVLZHFBn": {}}, "longDescription": "ZeITt03w", "title": "liqcGJM4"}, "UopjWtBd": {"description": "jGdgnjjb", "localExt": {"xYyNwzL0": {}, "3S2sqjsw": {}, "zxfSPsGl": {}}, "longDescription": "r1EgK4az", "title": "XNnrqfHH"}, "5I3Tr5ox": {"description": "QS2EaxUo", "localExt": {"NAXW5V0w": {}, "vYxXcYkd": {}, "XDW37EvR": {}}, "longDescription": "wtQSX6yv", "title": "MrIiSlqU"}}, "lootBoxConfig": {"rewardCount": 96, "rewards": [{"lootBoxItems": [{"count": 6, "itemId": "HNyMQAmZ", "itemSku": "yxdhnssO", "itemType": "Rv7bkNke"}, {"count": 36, "itemId": "pwIgf697", "itemSku": "OKJ4rgal", "itemType": "b0KGTPGZ"}, {"count": 34, "itemId": "yZQisKks", "itemSku": "07Xg8r7z", "itemType": "6Pa5ydy9"}], "name": "PUralZZh", "odds": 0.8081165173806634, "type": "REWARD", "weight": 46}, {"lootBoxItems": [{"count": 45, "itemId": "czXXKyFT", "itemSku": "kdVQ1Qkw", "itemType": "LERAoGmd"}, {"count": 20, "itemId": "wwB7QNNN", "itemSku": "5Fd64KCx", "itemType": "5GsQwACu"}, {"count": 8, "itemId": "0zCpJKpZ", "itemSku": "T2KsCMPt", "itemType": "85KggNRp"}], "name": "F9obHozA", "odds": 0.5850384519734348, "type": "PROBABILITY_GROUP", "weight": 94}, {"lootBoxItems": [{"count": 59, "itemId": "PRPeufPK", "itemSku": "PpycbWRO", "itemType": "ZQkMXRNL"}, {"count": 68, "itemId": "K8fIVrCM", "itemSku": "MVDIMSx1", "itemType": "PLLJfXv4"}, {"count": 97, "itemId": "y71hJMbY", "itemSku": "QEdxP2Ul", "itemType": "9lbQRGH4"}], "name": "Ds9BQXqL", "odds": 0.6765543694409076, "type": "PROBABILITY_GROUP", "weight": 9}]}, "maxCount": 97, "maxCountPerUser": 59, "name": "W637DM8X", "optionBoxConfig": {"boxItems": [{"count": 30, "itemId": "LjtPpWAr", "itemSku": "XGnCmWWv", "itemType": "0u8IxzLQ"}, {"count": 90, "itemId": "wPEkZLQR", "itemSku": "AEJ0HDxh", "itemType": "R6mS86Ti"}, {"count": 20, "itemId": "FW7xk0jJ", "itemSku": "IfIklXdk", "itemType": "FHZt04rK"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 66, "fixedTrialCycles": 8, "graceDays": 7}, "regionData": {"svgxjdd0": [{"currencyCode": "4oOzURJy", "currencyNamespace": "22oSB1wz", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1996-04-03T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1997-07-20T00:00:00Z", "discountedPrice": 35, "expireAt": "1993-03-01T00:00:00Z", "price": 67, "purchaseAt": "1987-01-18T00:00:00Z", "trialPrice": 37}, {"currencyCode": "lwZSqTgC", "currencyNamespace": "CnydmJyp", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1999-11-15T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1988-08-14T00:00:00Z", "discountedPrice": 24, "expireAt": "1986-11-24T00:00:00Z", "price": 47, "purchaseAt": "1971-10-24T00:00:00Z", "trialPrice": 4}, {"currencyCode": "BYRXeP9X", "currencyNamespace": "mU8AMpWV", "currencyType": "VIRTUAL", "discountAmount": 59, "discountExpireAt": "1971-12-16T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1981-02-20T00:00:00Z", "discountedPrice": 9, "expireAt": "1991-10-29T00:00:00Z", "price": 66, "purchaseAt": "1980-01-31T00:00:00Z", "trialPrice": 42}], "L3bSKs3U": [{"currencyCode": "2KsluHaC", "currencyNamespace": "LvYxnNRj", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1992-04-18T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1994-06-12T00:00:00Z", "discountedPrice": 9, "expireAt": "1975-12-07T00:00:00Z", "price": 39, "purchaseAt": "1998-02-14T00:00:00Z", "trialPrice": 9}, {"currencyCode": "MI0MKT68", "currencyNamespace": "gGmlGlqH", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1984-03-31T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1988-07-08T00:00:00Z", "discountedPrice": 81, "expireAt": "1999-08-31T00:00:00Z", "price": 67, "purchaseAt": "1997-02-15T00:00:00Z", "trialPrice": 87}, {"currencyCode": "VYGkfeVn", "currencyNamespace": "4MRdU1R1", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1996-06-07T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1977-10-30T00:00:00Z", "discountedPrice": 10, "expireAt": "1997-05-10T00:00:00Z", "price": 85, "purchaseAt": "1991-05-17T00:00:00Z", "trialPrice": 82}], "V7VLXnKa": [{"currencyCode": "h7zSS6GR", "currencyNamespace": "baoGyLL8", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1982-08-11T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1980-12-18T00:00:00Z", "discountedPrice": 67, "expireAt": "1979-02-17T00:00:00Z", "price": 93, "purchaseAt": "1991-01-19T00:00:00Z", "trialPrice": 69}, {"currencyCode": "9vHxzHjH", "currencyNamespace": "xBg1KU0q", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1998-06-30T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1976-03-09T00:00:00Z", "discountedPrice": 19, "expireAt": "1995-12-17T00:00:00Z", "price": 55, "purchaseAt": "1980-11-11T00:00:00Z", "trialPrice": 78}, {"currencyCode": "8qusbhLs", "currencyNamespace": "Uz3RKM5p", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1972-09-01T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1977-02-26T00:00:00Z", "discountedPrice": 64, "expireAt": "1971-07-28T00:00:00Z", "price": 11, "purchaseAt": "1971-07-01T00:00:00Z", "trialPrice": 0}]}, "seasonType": "PASS", "sku": "Rc8Aq68F", "stackable": true, "status": "INACTIVE", "tags": ["N9HOBQNt", "8lMlt875", "aAnwUN5q"], "targetCurrencyCode": "IFykObdE", "targetNamespace": "4bdZ2qwT", "thumbnailUrl": "0OPZo4AS", "useCount": 3}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '9R8HNl9a' \
    --appId '92tbWxP3' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate '6CTTyztC' \
    --baseAppId 'hKiwNNEx' \
    --categoryPath 'DBqtUMP2' \
    --features '4hEbwSRZ' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --limit '6' \
    --offset '90' \
    --region '3Jnviy7n' \
    --sortBy 'name:desc,createdAt:asc,updatedAt' \
    --storeId 's03tJ67G' \
    --tags 'pJAz6GBs' \
    --targetNamespace 'jcEIjz3d' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '6Hohmd2k,4LiIAvSc,2Qs1rcCF' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2c9luaoK' \
    --sku 'Mn3iP8Zb' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'NzNkJN8E' \
    --populateBundle  \
    --region 'MyEC9Cj5' \
    --storeId '0CiAvBFp' \
    --sku 'G77Uyalo' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LWPa3V4K' \
    --sku 'm1BIFcT5' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'KQGneU5N,bc62PLIA,qflOjBow' \
    --storeId 'u8z58THf' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'T5qacCqF' \
    --region 'rDuEgWrx' \
    --storeId 'juDbnTgl' \
    --itemIds 'DPCzb9hv' \
    > test.out 2>&1
eval_tap $? 91 'BulkGetLocaleItems' test.out

#- 92 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'GetAvailablePredicateTypes' test.out

#- 93 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'UZQnRtGC' \
    --body '{"itemIds": ["yVXvhyp7", "ZTiAMZJs", "TKrxN6q9"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '62' \
    --offset '19' \
    --sortBy 'GRHcbrnF' \
    --storeId 'CiBL7sfF' \
    --keyword 'K6BwiTOc' \
    --language 'ZQBbpcLY' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '88' \
    --offset '35' \
    --sortBy 'displayOrder:asc,name:desc,createdAt' \
    --storeId 'TEz7BrOd' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'EeHsvHN3' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'ojrsAm1O' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'wbIYG6rU' \
    --namespace "$AB_NAMESPACE" \
    --storeId '36cXwNis' \
    --body '{"appId": "NXfdioxp", "appType": "DLC", "baseAppId": "CKXAhLZz", "boothName": "CPHWRK2q", "categoryPath": "KPmFbnWt", "clazz": "FPF7XoO9", "displayOrder": 1, "entitlementType": "DURABLE", "ext": {"d7aKtucL": {}, "rp3v12b1": {}, "F3g1vBiP": {}}, "features": ["nINifAyo", "9ljf0FyP", "qn6BvsoE"], "images": [{"as": "0wjw2OzC", "caption": "aZX0Mfjt", "height": 79, "imageUrl": "SBSov0pt", "smallImageUrl": "LSU0ZbDr", "width": 35}, {"as": "XNJXloeT", "caption": "1Mx0Bi64", "height": 67, "imageUrl": "oRjIPaN3", "smallImageUrl": "Xls0xHbg", "width": 50}, {"as": "NeDHZYIB", "caption": "iIWo6kYQ", "height": 81, "imageUrl": "RK89znS3", "smallImageUrl": "cCtiEAPs", "width": 11}], "itemIds": ["mXchaoX7", "ZakOqdh1", "otFZYLft"], "itemQty": {"aUkL8lk0": 30, "vv7nBcSo": 87, "X02vMCWK": 66}, "itemType": "MEDIA", "listable": false, "localizations": {"828eNmwN": {"description": "uwDfkdbL", "localExt": {"o40o2PmT": {}, "eJwj3moZ": {}, "JnIl0INC": {}}, "longDescription": "08xwVGEO", "title": "NyvuhWye"}, "Zu4u8EV1": {"description": "GvqICl9d", "localExt": {"voYHYUi2": {}, "f48sMd1a": {}, "MvBzh0tM": {}}, "longDescription": "q1ekaWL2", "title": "UwU8lhaq"}, "yhfKq9sA": {"description": "ElMIykxV", "localExt": {"spShQd6n": {}, "LtoM8Mwi": {}, "syOwVHmm": {}}, "longDescription": "QOZPz47H", "title": "CHdYoyWu"}}, "lootBoxConfig": {"rewardCount": 19, "rewards": [{"lootBoxItems": [{"count": 51, "itemId": "TgjbxQL3", "itemSku": "IVQ0LGt8", "itemType": "g9vFWUuS"}, {"count": 96, "itemId": "HNF8UYD8", "itemSku": "Q7WMlOUj", "itemType": "mSlNVatt"}, {"count": 92, "itemId": "CGSPMvDT", "itemSku": "b6eveRLI", "itemType": "9Ocqt5iY"}], "name": "RWwsAu60", "odds": 0.5081050372987436, "type": "REWARD_GROUP", "weight": 16}, {"lootBoxItems": [{"count": 100, "itemId": "KR5IvyRB", "itemSku": "ww6bdqpw", "itemType": "NNUnjHEQ"}, {"count": 28, "itemId": "SelT0zIH", "itemSku": "4tenSR8v", "itemType": "ML8wROCu"}, {"count": 3, "itemId": "LIqKRJxi", "itemSku": "xO2DXGnO", "itemType": "6nj0hEWa"}], "name": "t4nucaNZ", "odds": 0.7653893897617567, "type": "REWARD_GROUP", "weight": 9}, {"lootBoxItems": [{"count": 58, "itemId": "PytRAl0k", "itemSku": "JC4YDuAx", "itemType": "QqxeokMy"}, {"count": 43, "itemId": "T3jdIY1I", "itemSku": "rj3rZwPW", "itemType": "sugiBhZl"}, {"count": 53, "itemId": "V3Je2zfT", "itemSku": "L27SJC3t", "itemType": "kFE6YBma"}], "name": "tCfZonRs", "odds": 0.6385265975442015, "type": "REWARD_GROUP", "weight": 36}]}, "maxCount": 35, "maxCountPerUser": 43, "name": "z5iMADYL", "optionBoxConfig": {"boxItems": [{"count": 85, "itemId": "YEKAfo9i", "itemSku": "EH3Org6v", "itemType": "gp8wYmfg"}, {"count": 99, "itemId": "kzyHHQjS", "itemSku": "cfZswLQS", "itemType": "WJYg49ku"}, {"count": 10, "itemId": "FsFhk8F5", "itemSku": "gjZ8y0Bu", "itemType": "lhD6Yvae"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 55, "fixedTrialCycles": 92, "graceDays": 16}, "regionData": {"WJEeE4TC": [{"currencyCode": "MWFuxuVZ", "currencyNamespace": "Ys49X3He", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1976-06-19T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1989-01-13T00:00:00Z", "discountedPrice": 55, "expireAt": "1972-11-21T00:00:00Z", "price": 6, "purchaseAt": "1991-08-01T00:00:00Z", "trialPrice": 58}, {"currencyCode": "gKBYMiVL", "currencyNamespace": "IHDpQUOe", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1989-06-04T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1997-04-05T00:00:00Z", "discountedPrice": 6, "expireAt": "1992-04-29T00:00:00Z", "price": 57, "purchaseAt": "1994-08-08T00:00:00Z", "trialPrice": 48}, {"currencyCode": "3KqIF8L8", "currencyNamespace": "x4DpLmaO", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1973-06-17T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1977-03-27T00:00:00Z", "discountedPrice": 78, "expireAt": "1997-06-21T00:00:00Z", "price": 54, "purchaseAt": "1985-02-13T00:00:00Z", "trialPrice": 36}], "OQvGTgwz": [{"currencyCode": "wOIDP9DZ", "currencyNamespace": "yyg4Ugf5", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1979-10-15T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1974-03-24T00:00:00Z", "discountedPrice": 75, "expireAt": "1987-04-12T00:00:00Z", "price": 57, "purchaseAt": "1987-06-15T00:00:00Z", "trialPrice": 49}, {"currencyCode": "mJXA6jwA", "currencyNamespace": "D1TtulMi", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1998-05-24T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1997-06-15T00:00:00Z", "discountedPrice": 45, "expireAt": "1995-05-06T00:00:00Z", "price": 48, "purchaseAt": "1976-06-27T00:00:00Z", "trialPrice": 18}, {"currencyCode": "Fljd2fOv", "currencyNamespace": "U5e5sp18", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1994-05-12T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1983-10-18T00:00:00Z", "discountedPrice": 75, "expireAt": "1990-01-25T00:00:00Z", "price": 66, "purchaseAt": "1977-10-27T00:00:00Z", "trialPrice": 59}], "nstJA5Ij": [{"currencyCode": "Subw61sj", "currencyNamespace": "iFhjP4fd", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1996-01-29T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1992-08-30T00:00:00Z", "discountedPrice": 37, "expireAt": "1976-07-20T00:00:00Z", "price": 4, "purchaseAt": "1979-04-18T00:00:00Z", "trialPrice": 28}, {"currencyCode": "giAmJkuf", "currencyNamespace": "T0qx2r0H", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1989-03-19T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1993-03-13T00:00:00Z", "discountedPrice": 3, "expireAt": "1972-12-04T00:00:00Z", "price": 79, "purchaseAt": "1993-08-02T00:00:00Z", "trialPrice": 44}, {"currencyCode": "7ZA74yRb", "currencyNamespace": "JzxxTqwz", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1993-02-06T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1987-10-16T00:00:00Z", "discountedPrice": 8, "expireAt": "1992-08-07T00:00:00Z", "price": 1, "purchaseAt": "1992-01-24T00:00:00Z", "trialPrice": 26}]}, "seasonType": "PASS", "sku": "9yJuiuxZ", "stackable": true, "status": "INACTIVE", "tags": ["91DMqars", "Tr7Px0uo", "ckTlmHsp"], "targetCurrencyCode": "CZA7Bk4g", "targetNamespace": "mL4N0A8I", "thumbnailUrl": "r31LYh2T", "useCount": 61}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'VPc26H0i' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 's4tox7FG' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'WyBEqIT3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 35, "orderNo": "uLo5wJ5b"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'HvCxPv9F' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'cwQ1am2W' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'qSjx7yQY' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4f9T0SPm' \
    --body '{"carousel": [{"alt": "xHpS73ZR", "previewUrl": "kBfkf5bG", "thumbnailUrl": "HGcaQSuf", "type": "video", "url": "2uH121f8", "videoSource": "vimeo"}, {"alt": "5zc4g9xo", "previewUrl": "NpJoDYeQ", "thumbnailUrl": "FqCbczHY", "type": "video", "url": "QXWGQUjn", "videoSource": "youtube"}, {"alt": "ViVPEM4t", "previewUrl": "hFymzM7X", "thumbnailUrl": "ApwYPGRH", "type": "image", "url": "MPbEMD2m", "videoSource": "youtube"}], "developer": "61lOsIRV", "forumUrl": "hlQmTJNG", "genres": ["Sports", "Racing", "Strategy"], "localizations": {"d66xXozP": {"announcement": "YzJcyUNj", "slogan": "w7G2xtDc"}, "PRGL0uAf": {"announcement": "qjFriuJJ", "slogan": "gThQmmwc"}, "W3nDOlQF": {"announcement": "EIRDTiH4", "slogan": "cpjToZSU"}}, "platformRequirements": {"rlYOXlOC": [{"additionals": "mvSpdAKI", "directXVersion": "XiC366SP", "diskSpace": "EYpbn2s7", "graphics": "9cEHCEwI", "label": "3jRTTqhV", "osVersion": "PPa3fgzt", "processor": "lBN1rH0c", "ram": "vZ0TEv4O", "soundCard": "opDb5KlV"}, {"additionals": "bBgRxLRz", "directXVersion": "uxbrqLsj", "diskSpace": "r7DvymMD", "graphics": "qifjzmuk", "label": "wk697W2P", "osVersion": "H6Xs5tf9", "processor": "s27FdCVH", "ram": "BbFMLaWQ", "soundCard": "EdOJuIlq"}, {"additionals": "pwjX1Zr1", "directXVersion": "gOdlZdHq", "diskSpace": "FgzLntKW", "graphics": "pPMBNHej", "label": "jVTRJvsa", "osVersion": "GMsk75Du", "processor": "Sa4nwFmu", "ram": "nNMqv6mp", "soundCard": "SPcWGJbm"}], "FsgloiRn": [{"additionals": "Mu52HBPv", "directXVersion": "93GDq45e", "diskSpace": "SExr8fdp", "graphics": "rZ94gnwC", "label": "TxwmEpZf", "osVersion": "HTa7kkcX", "processor": "MEUun15I", "ram": "PmSvNzQn", "soundCard": "XFFMJddM"}, {"additionals": "2rMKtVvC", "directXVersion": "LRviIFkp", "diskSpace": "Gl49Jtfb", "graphics": "rxrP2Hna", "label": "g70p3HpI", "osVersion": "9KUFOKVQ", "processor": "5WzqKyqC", "ram": "tawter0G", "soundCard": "n8v212Xu"}, {"additionals": "8SzHcKUj", "directXVersion": "eaVhk81O", "diskSpace": "Rppo6gYU", "graphics": "ZiHIGAOc", "label": "MwcXyope", "osVersion": "Xm8Vt4tS", "processor": "tWXENq1O", "ram": "NTlUSV13", "soundCard": "kKVvpllE"}], "H9mf1bYy": [{"additionals": "d1ujts72", "directXVersion": "0GHtQJgs", "diskSpace": "w01UQPE6", "graphics": "5sdZ2P50", "label": "49JuP1tD", "osVersion": "oBSC7Xkw", "processor": "Dm7rbL9l", "ram": "SbaOvRXZ", "soundCard": "m52TwStJ"}, {"additionals": "hGnVrJeN", "directXVersion": "SUCqsu8A", "diskSpace": "fVZgfbJA", "graphics": "UMEelW7M", "label": "aR4W55kO", "osVersion": "rfowF0UE", "processor": "ntIa0lPc", "ram": "UIKeK2ek", "soundCard": "0MTWxviC"}, {"additionals": "zOPAQVly", "directXVersion": "V2XjurHD", "diskSpace": "bfl9CZG7", "graphics": "yspdd3Hy", "label": "XYMXVad0", "osVersion": "ZKIvGNgy", "processor": "d96o1UZU", "ram": "5Y8fijmu", "soundCard": "TphUZVKw"}]}, "platforms": ["IOS", "IOS", "Android"], "players": ["Single", "LocalCoop", "Coop"], "primaryGenre": "Strategy", "publisher": "GOD6jGRu", "releaseDate": "1997-11-08T00:00:00Z", "websiteUrl": "u7ZNNQxX"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'nMcQVcz1' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K0pbggTj' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'JTsYcQlp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'A0cpzViX' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1CpakxF2' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'a7OEUNKQ' \
    --itemId '27XHglR5' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tFXpZd11' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '97NpTmpj' \
    --itemId '3Csj6Nqa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w7toef0b' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '1cHjUv68' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '317vtuaq' \
    --populateBundle  \
    --region 'ACMjwa4p' \
    --storeId 'StogxXam' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'LUlQIkwZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId '85R1t9Dm' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 30, "comparison": "isGreaterThan", "name": "aFcSCDG2", "predicateType": "EntitlementPredicate", "value": "GB15O8RW", "values": ["bsXOMYlD", "Z0qHZpCD", "9gqtcAAn"]}, {"anyOf": 94, "comparison": "is", "name": "z7szk37A", "predicateType": "EntitlementPredicate", "value": "yKog0VMR", "values": ["C7lOVkrM", "VXxBqLhN", "7M4busDu"]}, {"anyOf": 67, "comparison": "includes", "name": "DyEEFBS5", "predicateType": "SeasonTierPredicate", "value": "BI1pbpmy", "values": ["QmI3IDij", "7nnqlN4i", "u9GJZiy7"]}]}, {"operator": "and", "predicates": [{"anyOf": 98, "comparison": "isGreaterThanOrEqual", "name": "Fzmtet64", "predicateType": "EntitlementPredicate", "value": "J8GSiPew", "values": ["5zyGBPql", "JFRJSOND", "nbbuuEav"]}, {"anyOf": 71, "comparison": "isGreaterThan", "name": "94SYEM31", "predicateType": "SeasonPassPredicate", "value": "mW9r4bww", "values": ["AiD0vOy1", "XCIjp73J", "8mEK1C5R"]}, {"anyOf": 57, "comparison": "is", "name": "b9MP9hTe", "predicateType": "SeasonPassPredicate", "value": "pplmfHZU", "values": ["KRFC2sFz", "obzesyfZ", "08h9DrEs"]}]}, {"operator": "or", "predicates": [{"anyOf": 17, "comparison": "isGreaterThanOrEqual", "name": "NGnEyRdQ", "predicateType": "SeasonTierPredicate", "value": "YstRBNmV", "values": ["3pvCwUqM", "ewDSBgQJ", "MmQ1wqbx"]}, {"anyOf": 82, "comparison": "isNot", "name": "2c0XWQ4u", "predicateType": "SeasonPassPredicate", "value": "RY9DM8mQ", "values": ["Jxu5xMR0", "vepMb84B", "p0DDF7Dp"]}, {"anyOf": 59, "comparison": "isGreaterThan", "name": "xbyWwbGG", "predicateType": "SeasonTierPredicate", "value": "DbrBd68Y", "values": ["vAubdRTp", "V7UPdW8c", "G7LwbaoV"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'mf1pb5Rl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "0flgJwdU"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --name 'QK9HyO7R' \
    --offset '81' \
    --tag '3s8hJY5k' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "zHeKCzYy", "name": "vJ8yrJlJ", "status": "ACTIVE", "tags": ["ZuHEXaAs", "9xzxGZvO", "vY6vt6Uh"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'Qz7bVrbS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'rNXFxggR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "1iW5sZrn", "name": "U4n8k1DM", "status": "INACTIVE", "tags": ["TIlE4Q2V", "634tKr2G", "LGKH0eUc"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'U5egCnEM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'gzqvxxJL' \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '48' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'tNv4zzWw' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'sJJQxq7I' \
    --limit '15' \
    --offset '42' \
    --orderNos 'ZEutZn8M,XwRArsEV,K6vMdqwN' \
    --sortBy '9wD7PlHv' \
    --startTime '7wsZ76Kw' \
    --status 'REFUND_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 118 'QueryOrders' test.out

#- 119 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'GetOrderStatistics' test.out

#- 120 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'R8vsBvHV' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OOLXR3Pm' \
    --body '{"description": "7cnSqrzn"}' \
    > test.out 2>&1
eval_tap $? 121 'RefundOrder' test.out

#- 122 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'GetPaymentCallbackConfig' test.out

#- 123 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "dnYjLr0O", "privateKey": "ST4bJu0G"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'X5arggsS' \
    --externalId '8ayOlec9' \
    --limit '94' \
    --notificationSource 'ALIPAY' \
    --notificationType 'QRMhRUse' \
    --offset '51' \
    --paymentOrderNo 'fiyhAbAU' \
    --startDate 'PqYD37F1' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'nD4GGJcO' \
    --limit '14' \
    --offset '75' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "P9WsVu4S", "currencyNamespace": "d5sN1elq", "customParameters": {"v4bD1Xtw": {}, "Gn72uegv": {}, "o0ktdmr8": {}}, "description": "aMJGRtA7", "extOrderNo": "U6Vu4wnn", "extUserId": "jmjwrmCG", "itemType": "APP", "language": "rgv-463", "metadata": {"qCvUUIt1": "zue57Crg", "GjjNc6ib": "EqjaSpu8", "uymhcjf8": "zDLZvmOG"}, "notifyUrl": "l3i0x2Xu", "omitNotification": false, "platform": "iBgw7msa", "price": 89, "recurringPaymentOrderNo": "DnGV1gmd", "region": "RtMRiVYw", "returnUrl": "dWtMMSY6", "sandbox": false, "sku": "hUv1m1rJ", "subscriptionId": "nGyoHj9j", "targetNamespace": "r0QKQjik", "targetUserId": "w3qPdfUB", "title": "tPJkfp3r"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'owdqKxca' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8NtHza7d' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'k5InydLu' \
    --body '{"extTxId": "41BTrJns", "paymentMethod": "ufrluukB", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'f63usW00' \
    --body '{"description": "JUdI10zp"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gWLqteqa' \
    --body '{"amount": 67, "currencyCode": "ZHwQtkLE", "notifyType": "REFUND", "paymentProvider": "XSOLLA", "salesTax": 43, "vat": 1}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TE7dk49j' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["System", "Other", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "B7UtYqjp", "eventTopic": "fl2M8GKO", "maxAwarded": 2, "maxAwardedPerUser": 97, "namespaceExpression": "mfOtyZLS", "rewardCode": "BJE58N6d", "rewardConditions": [{"condition": "i06gcYMu", "conditionName": "otRneNJv", "eventName": "FLK2zBMH", "rewardItems": [{"duration": 26, "itemId": "4KWU2Brv", "quantity": 71}, {"duration": 11, "itemId": "NuNE75sq", "quantity": 33}, {"duration": 93, "itemId": "iDgD6tJy", "quantity": 87}]}, {"condition": "pEaObqbn", "conditionName": "mCpIA2hs", "eventName": "Dv44DBtu", "rewardItems": [{"duration": 56, "itemId": "lWULWFdN", "quantity": 73}, {"duration": 59, "itemId": "hiEJ191K", "quantity": 79}, {"duration": 43, "itemId": "fQw3NLbl", "quantity": 40}]}, {"condition": "aKYjM8H0", "conditionName": "fHyOgwTn", "eventName": "P9MPiZv0", "rewardItems": [{"duration": 6, "itemId": "K6bBY5ee", "quantity": 23}, {"duration": 12, "itemId": "tF6ReRNk", "quantity": 74}, {"duration": 74, "itemId": "jK8O6roj", "quantity": 69}]}], "userIdExpression": "O27IJXwC"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'DjzvG8R4' \
    --limit '78' \
    --offset '68' \
    --sortBy 'rewardCode,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 137 'QueryRewards' test.out

#- 138 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'ExportRewards' test.out

#- 139 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 139 'ImportRewards' test.out

#- 140 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'oJXOoDdG' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'S4d8WHCt' \
    --body '{"description": "BZ2EC9KZ", "eventTopic": "DuAmXBmA", "maxAwarded": 23, "maxAwardedPerUser": 41, "namespaceExpression": "5vJlpnQU", "rewardCode": "O1UFwwSz", "rewardConditions": [{"condition": "1JiZFnSH", "conditionName": "ETsweblf", "eventName": "iCrL3KKg", "rewardItems": [{"duration": 93, "itemId": "F8UZJd1x", "quantity": 43}, {"duration": 18, "itemId": "LBbwXzGd", "quantity": 1}, {"duration": 16, "itemId": "N2WkErZw", "quantity": 93}]}, {"condition": "YkVzAp3Y", "conditionName": "J6FF6JXH", "eventName": "JyjGcNkP", "rewardItems": [{"duration": 65, "itemId": "3GExiACn", "quantity": 78}, {"duration": 97, "itemId": "pTAszP1A", "quantity": 90}, {"duration": 52, "itemId": "hvBkyIEQ", "quantity": 14}]}, {"condition": "wQDA9pvb", "conditionName": "8Eyqq26j", "eventName": "bJLEOTR7", "rewardItems": [{"duration": 32, "itemId": "ZqyVYNzE", "quantity": 46}, {"duration": 77, "itemId": "qmO4HNaC", "quantity": 46}, {"duration": 9, "itemId": "haHiwmjo", "quantity": 39}]}], "userIdExpression": "H9xMlDOs"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'KcAJz1D4' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'O1EL2kDW' \
    --body '{"payload": {"eSyorEhr": {}, "nPrfTgLu": {}, "FhGFTGXA": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'lEaQJ5d3' \
    --body '{"conditionName": "7YoHx85M", "userId": "4LAPwGtp"}' \
    > test.out 2>&1
eval_tap $? 144 'DeleteRewardConditionRecord' test.out

#- 145 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'ListStores' test.out

#- 146 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "WDTl3SoU", "defaultRegion": "B6AonKnq", "description": "hZalbWq4", "supportedLanguages": ["i6MlKZjO", "rD4AI5yj", "kMgpWT15"], "supportedRegions": ["HOci2W9g", "cY941EmX", "sTtsKo4z"], "title": "L6bgY7bV"}' \
    > test.out 2>&1
eval_tap $? 146 'CreateStore' test.out

#- 147 ImportStore
eval_tap 0 147 'ImportStore # SKIP deprecated' test.out

#- 148 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetPublishedStore' test.out

#- 149 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'DeletePublishedStore' test.out

#- 150 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 150 'GetPublishedStoreBackup' test.out

#- 151 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'RollbackPublishedStore' test.out

#- 152 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F6octDSd' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dZqRYHch' \
    --body '{"defaultLanguage": "cNwrWFy1", "defaultRegion": "bzuxRwIE", "description": "gSGvO94d", "supportedLanguages": ["jeNXCOqK", "zvSbieOa", "CMdS83rb"], "supportedRegions": ["rmB3tvr9", "ZzM2cMJX", "zPUpeK9Q"], "title": "3N8dYhnF"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'z0J1exxu' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TSXX9ltG' \
    --action 'CREATE' \
    --itemSku 'uO88Z8cD' \
    --itemType 'SEASON' \
    --limit '31' \
    --offset '12' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt:asc,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'bgJwIUbV' \
    --updatedAtStart 'iRI8Zvir' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yUls1nQ4' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bZkmwzYo' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'M9SGK9R9' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '4RbWYP8H' \
    --action 'CREATE' \
    --itemSku '93leNdqf' \
    --itemType 'BUNDLE' \
    --type 'STORE' \
    --updatedAtEnd 'FYaFzG2C' \
    --updatedAtStart 'VJzVNVfd' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GrvK4l4n' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'ZX0qLAHT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aAgq7mvj' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'ec0EuSlp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J6YreTQx' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ppsQTx45' \
    --targetStoreId '648oAOJx' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'YgQhMdzA' \
    --limit '56' \
    --offset '16' \
    --sku 'WGvaiZNE' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'H7UvL3H6' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'EHSJXuD2' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'ye4TBxFo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'W98roi8E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "r9RR1lmP"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'nV8KUA8V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'fd0vfyWp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 85, "orderNo": "RzSNwt5M"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'T6RJYYya' \
    --body '{"achievements": [{"id": "yJX1Sd4N", "value": 68}, {"id": "xH96OqIz", "value": 60}, {"id": "nKlKTNxd", "value": 41}], "steamUserId": "eagt8Y1U"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '1j4pyvdX' \
    --xboxUserId 'v52bnAdl' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'oxCC5Cg8' \
    --body '{"achievements": [{"id": "qVyEsIRF", "percentComplete": 34}, {"id": "VLMPC7qU", "percentComplete": 54}, {"id": "4R9KN5KQ", "percentComplete": 98}], "serviceConfigId": "11YqMXKT", "titleId": "XAbA5u0h", "xboxUserId": "k1rVlyPF"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'OSvtz5QV' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJjSQWuR' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'nfG28d1p' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'WHofcP2c' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'QrQGt4RC' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2VHbDxf' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'NxbuqtDV' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'AxwHkANV' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'mLTXQSBt' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'WDgOX06N' \
    --features 'hkETPX5b,gNz3iIxO,ZRxIE3BQ' \
    --itemId '9fpeqHHX,TyhN1Wj7,LICvgBuw' \
    --limit '26' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserEntitlements' test.out

#- 183 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'anbgvLhK' \
    --body '[{"endDate": "1977-08-10T00:00:00Z", "grantedCode": "YJfnGJF2", "itemId": "V7mDTph4", "itemNamespace": "bmvp4yTy", "language": "JZk_Hj", "quantity": 62, "region": "uqPYRDiz", "source": "ACHIEVEMENT", "startDate": "1985-08-27T00:00:00Z", "storeId": "mK1WnsDQ"}, {"endDate": "1983-05-12T00:00:00Z", "grantedCode": "vlPZ1ye4", "itemId": "hVvXjKFF", "itemNamespace": "njXVCK43", "language": "oN-jMVS_gX", "quantity": 34, "region": "2XSx8mFD", "source": "GIFT", "startDate": "1991-08-03T00:00:00Z", "storeId": "9uimP0N6"}, {"endDate": "1999-01-24T00:00:00Z", "grantedCode": "VtYs0R1s", "itemId": "adjyQ0Hw", "itemNamespace": "pn3Rh4S5", "language": "DPI-XFTx", "quantity": 62, "region": "yHHadRgK", "source": "GIFT", "startDate": "1975-06-08T00:00:00Z", "storeId": "BiaBg45T"}]' \
    > test.out 2>&1
eval_tap $? 183 'GrantUserEntitlement' test.out

#- 184 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qA2virjs' \
    --activeOnly  \
    --appId 'Dv2r12nG' \
    > test.out 2>&1
eval_tap $? 184 'GetUserAppEntitlementByAppId' test.out

#- 185 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '1gt7EZmc' \
    --activeOnly  \
    --limit '49' \
    --offset '68' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserEntitlementsByAppType' test.out

#- 186 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '2GD4V5tW' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId 'jQGXrQx8' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementByItemId' test.out

#- 187 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'FfLOdAWB' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku 'KuDWp8gm' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementBySku' test.out

#- 188 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uIj0I8lC' \
    --appIds 'U6go3BtO,Ql8KvSud,XYnQwSt2' \
    --itemIds 'bfz58pkK,GQpVHzE8,M6nw3vUK' \
    --skus 'PYxlH5nT,vD7NSTT8,4Sza60Xf' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlement' test.out

#- 189 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'LLfkCTQl' \
    --itemIds 'dY65mP25,9DfEXBac,PvcEcJmP' \
    > test.out 2>&1
eval_tap $? 189 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 190 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'W1AXKhMq' \
    --appId 'DlMsW1f0' \
    > test.out 2>&1
eval_tap $? 190 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 191 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'y2CV5DyE' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'Bod6Igjg' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemId' test.out

#- 192 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'oePZeXAx' \
    --ids 'gTU8a9P1,j3nqAeNt,NpkivJJU' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipByItemIds' test.out

#- 193 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'kkvjgs0l' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'uHBsX8wr' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipBySku' test.out

#- 194 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LtU7j8tv' \
    --entitlementIds 'pgFLrxRg' \
    > test.out 2>&1
eval_tap $? 194 'RevokeUserEntitlements' test.out

#- 195 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'BTyRAuYq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FzgGr4LC' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlement' test.out

#- 196 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'E0hFWDkc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQMatzy9' \
    --body '{"endDate": "1975-10-06T00:00:00Z", "nullFieldList": ["0EubToKF", "HLQd5xEm", "MmYqdDp4"], "startDate": "1984-12-05T00:00:00Z", "status": "REVOKED", "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 196 'UpdateUserEntitlement' test.out

#- 197 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'gxDjoea4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MUffPbhz' \
    --body '{"options": ["5fSldu5C", "7MgHfN6B", "rxEUVhSC"], "requestId": "v6JS1mxJ", "useCount": 21}' \
    > test.out 2>&1
eval_tap $? 197 'ConsumeUserEntitlement' test.out

#- 198 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'D73YFAwR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KTqCgpKq' \
    > test.out 2>&1
eval_tap $? 198 'DisableUserEntitlement' test.out

#- 199 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'qBdpJzwv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGiZa5xM' \
    > test.out 2>&1
eval_tap $? 199 'EnableUserEntitlement' test.out

#- 200 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'UsMWPf7s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r4pACtml' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementHistories' test.out

#- 201 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'guxDxMBO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DX4Vpu8j' \
    > test.out 2>&1
eval_tap $? 201 'RevokeUserEntitlement' test.out

#- 202 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'P8C1yhlc' \
    --body '{"duration": 8, "endDate": "1987-11-01T00:00:00Z", "itemId": "1nv807sN", "itemSku": "VQ6pCrmL", "language": "8uZFzwtG", "order": {"currency": {"currencyCode": "Z3qvLtrz", "currencySymbol": "GqEZurlw", "currencyType": "VIRTUAL", "decimals": 82, "namespace": "zU5ifsCM"}, "ext": {"j8U50RpM": {}, "9QSlGZUW": {}, "J7evvBWj": {}}, "free": false}, "orderNo": "uGrFMt49", "origin": "Stadia", "quantity": 86, "region": "CRFwZEw1", "source": "IAP", "startDate": "1997-06-15T00:00:00Z", "storeId": "GXA3Eefb"}' \
    > test.out 2>&1
eval_tap $? 202 'FulfillItem' test.out

#- 203 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'maAVJAMu' \
    --body '{"code": "9ZLlEBvv", "language": "iyOQ_CIec", "region": "s9uUfPn4"}' \
    > test.out 2>&1
eval_tap $? 203 'RedeemCode' test.out

#- 204 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '1HOQwDGA' \
    --body '{"origin": "Other", "rewards": [{"currency": {"currencyCode": "HXVFTVGo", "namespace": "bivq8R8G"}, "item": {"itemId": "SXhnGhhZ", "itemSku": "moczM2P2", "itemType": "lxuPKZ46"}, "quantity": 18, "type": "ITEM"}, {"currency": {"currencyCode": "iyM8GTvz", "namespace": "sU80d7A0"}, "item": {"itemId": "63Ch69Qz", "itemSku": "nwT8q2Of", "itemType": "BbEW4ahP"}, "quantity": 62, "type": "ITEM"}, {"currency": {"currencyCode": "7yd3Kigr", "namespace": "XeBlOeG6"}, "item": {"itemId": "Hjbf208p", "itemSku": "HK67c9Oy", "itemType": "zVdXb1ab"}, "quantity": 37, "type": "ITEM"}], "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillRewards' test.out

#- 205 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'rp9WWjZb' \
    --endTime 'z5G3Rx0w' \
    --limit '33' \
    --offset '83' \
    --productId 'PRWw6Q5S' \
    --startTime 'gEaHUFh0' \
    --status 'FAILED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 205 'QueryUserIAPOrders' test.out

#- 206 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'wewseJpo' \
    > test.out 2>&1
eval_tap $? 206 'QueryAllUserIAPOrders' test.out

#- 207 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJtEEdbc' \
    --endTime '9if9BAMy' \
    --limit '71' \
    --offset '24' \
    --startTime 'oTGRxpsO' \
    --status 'PENDING' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserIAPConsumeHistory' test.out

#- 208 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'iNImuuAk' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "Vum", "productId": "jGw9Ss5Q", "region": "YEH0Fkmq", "type": "APPLE"}' \
    > test.out 2>&1
eval_tap $? 208 'MockFulfillIAPItem' test.out

#- 209 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'JfkkvITm' \
    --itemId 'rqtQkAxL' \
    --limit '60' \
    --offset '45' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserOrders' test.out

#- 210 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'c45Jtr4Z' \
    --body '{"currencyCode": "n5jUnMIu", "currencyNamespace": "wUbnWXjd", "discountedPrice": 83, "ext": {"Fcmfz7jq": {}, "l8Psv9Lk": {}, "wKwrseui": {}}, "itemId": "hCUpvWyl", "language": "Syw1GIuD", "options": {"skipPriceValidation": false}, "platform": "Nintendo", "price": 30, "quantity": 45, "region": "WKY0dRDf", "returnUrl": "ry7WqiM2", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 210 'AdminCreateUserOrder' test.out

#- 211 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '9kES2TD9' \
    --itemId 'rYzsPQuo' \
    > test.out 2>&1
eval_tap $? 211 'CountOfPurchasedItem' test.out

#- 212 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NG89g8kD' \
    --userId 'i2Pwc435' \
    > test.out 2>&1
eval_tap $? 212 'GetUserOrder' test.out

#- 213 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7iA5syyi' \
    --userId 'aECUjMP0' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "xlBTPtkt"}' \
    > test.out 2>&1
eval_tap $? 213 'UpdateUserOrderStatus' test.out

#- 214 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'F6ph2P2W' \
    --userId 'RrRbDPAK' \
    > test.out 2>&1
eval_tap $? 214 'FulfillUserOrder' test.out

#- 215 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MbPuqAa7' \
    --userId 'ZEtkysmd' \
    > test.out 2>&1
eval_tap $? 215 'GetUserOrderGrant' test.out

#- 216 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qPCUQML4' \
    --userId 'hnAJ8rug' \
    > test.out 2>&1
eval_tap $? 216 'GetUserOrderHistories' test.out

#- 217 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'enXL9pXH' \
    --userId 'WeEUm7H6' \
    --body '{"additionalData": {"cardSummary": "NwhPqOtv"}, "authorisedTime": "1991-10-03T00:00:00Z", "chargebackReversedTime": "1989-03-24T00:00:00Z", "chargebackTime": "1981-08-23T00:00:00Z", "chargedTime": "1978-09-03T00:00:00Z", "createdTime": "1984-07-02T00:00:00Z", "currency": {"currencyCode": "8A4114iR", "currencySymbol": "EsJudbCN", "currencyType": "REAL", "decimals": 29, "namespace": "kYobULO2"}, "customParameters": {"9lpvZ2Jb": {}, "VU4JPqYf": {}, "jCfXVEnL": {}}, "extOrderNo": "69WqEsDp", "extTxId": "KFpEoGWb", "extUserId": "sexpCUVh", "issuedAt": "1996-03-09T00:00:00Z", "metadata": {"lvTNEsLh": "zw3rTLGD", "q4Kcg5qv": "MdSvnlCp", "FFa86LgI": "5kpjd4zz"}, "namespace": "5EaNJTF6", "nonceStr": "EV5gdB5Z", "paymentMethod": "lU5nBNxf", "paymentMethodFee": 79, "paymentOrderNo": "NIXEVE7D", "paymentProvider": "WALLET", "paymentProviderFee": 6, "paymentStationUrl": "rywETCig", "price": 47, "refundedTime": "1981-03-23T00:00:00Z", "salesTax": 82, "sandbox": true, "sku": "VxeLiEOt", "status": "REQUEST_FOR_INFORMATION", "statusReason": "nAsgVues", "subscriptionId": "m99TPD5X", "subtotalPrice": 19, "targetNamespace": "QfEKgwk2", "targetUserId": "Qawn4aDR", "tax": 28, "totalPrice": 24, "totalTax": 86, "txEndTime": "1994-11-04T00:00:00Z", "type": "OMBuElRg", "userId": "wcVEMWy8", "vat": 39}' \
    > test.out 2>&1
eval_tap $? 217 'ProcessUserOrderNotification' test.out

#- 218 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9P9E9z4N' \
    --userId 'zJpHfke8' \
    > test.out 2>&1
eval_tap $? 218 'DownloadUserOrderReceipt' test.out

#- 219 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'KrJuGMbi' \
    --body '{"currencyCode": "C6yrOxgN", "currencyNamespace": "mCHlyj8o", "customParameters": {"n8qtNrky": {}, "vjUerJjt": {}, "iKIH3xOI": {}}, "description": "TzXF37PV", "extOrderNo": "aX9EMFs3", "extUserId": "BmytsU0c", "itemType": "BUNDLE", "language": "pEdS_179", "metadata": {"KJYa4TB8": "PklPCW24", "gb6P8Aht": "bIYLMVVL", "BY3Qo9rQ": "iNOvlBL5"}, "notifyUrl": "qOU0fb2f", "omitNotification": false, "platform": "2IfQcTJe", "price": 22, "recurringPaymentOrderNo": "meWEfYxz", "region": "AeTtFFTe", "returnUrl": "xofTt9jt", "sandbox": true, "sku": "W3U4CGmK", "subscriptionId": "V0G3daDR", "title": "YlZ76iHz"}' \
    > test.out 2>&1
eval_tap $? 219 'CreateUserPaymentOrder' test.out

#- 220 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sQJWVqKW' \
    --userId 'dvgbM5Fa' \
    --body '{"description": "AAq4Y3Uv"}' \
    > test.out 2>&1
eval_tap $? 220 'RefundUserPaymentOrder' test.out

#- 221 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'XRz7UYeB' \
    --body '{"code": "BgajXh9W", "orderNo": "vvNnXoOd"}' \
    > test.out 2>&1
eval_tap $? 221 'ApplyUserRedemption' test.out

#- 222 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'U0PP8H3G' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'kIVtWYjp' \
    --limit '69' \
    --offset '82' \
    --sku 'xgR3Kq0b' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserSubscriptions' test.out

#- 223 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZjbr459' \
    --excludeSystem  \
    --limit '34' \
    --offset '17' \
    --subscriptionId '68K0cEcy' \
    > test.out 2>&1
eval_tap $? 223 'GetUserSubscriptionActivities' test.out

#- 224 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '3xi1Rb2f' \
    --body '{"grantDays": 51, "itemId": "mlvxVjOu", "language": "JT9wkqIJ", "reason": "W7pCGnmX", "region": "Zcc5X8Ja", "source": "UQoPZEpo"}' \
    > test.out 2>&1
eval_tap $? 224 'PlatformSubscribeSubscription' test.out

#- 225 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '8l1viXzW' \
    --itemId 'svAElPJm' \
    > test.out 2>&1
eval_tap $? 225 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 226 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jP2bGKby' \
    --userId 'Y90XBtGt' \
    > test.out 2>&1
eval_tap $? 226 'GetUserSubscription' test.out

#- 227 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Is7xN5UW' \
    --userId 'bmB17phL' \
    > test.out 2>&1
eval_tap $? 227 'DeleteUserSubscription' test.out

#- 228 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mXDNRaSA' \
    --userId '1e9Ee1qE' \
    --force  \
    --body '{"immediate": true, "reason": "DVSD5lUy"}' \
    > test.out 2>&1
eval_tap $? 228 'CancelSubscription' test.out

#- 229 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xSeiYLE8' \
    --userId 'lMWTqyAR' \
    --body '{"grantDays": 23, "reason": "tMSuBwS9"}' \
    > test.out 2>&1
eval_tap $? 229 'GrantDaysToSubscription' test.out

#- 230 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Rra7gxXk' \
    --userId 'EYZBBRWa' \
    --excludeFree  \
    --limit '6' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 230 'GetUserSubscriptionBillingHistories' test.out

#- 231 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'RY7OBCvp' \
    --userId 'FFZO4mU9' \
    --body '{"additionalData": {"cardSummary": "alDL7UlW"}, "authorisedTime": "1990-08-11T00:00:00Z", "chargebackReversedTime": "1989-08-25T00:00:00Z", "chargebackTime": "1996-05-13T00:00:00Z", "chargedTime": "1982-12-19T00:00:00Z", "createdTime": "1991-09-16T00:00:00Z", "currency": {"currencyCode": "fuRXvUcM", "currencySymbol": "n6OfhHib", "currencyType": "REAL", "decimals": 15, "namespace": "oEi2elZY"}, "customParameters": {"SOzFYSYU": {}, "hdpITqAE": {}, "fqS23NCO": {}}, "extOrderNo": "WU46dCUk", "extTxId": "2d6iEYqH", "extUserId": "DFCMX14A", "issuedAt": "1999-04-30T00:00:00Z", "metadata": {"0IOrXe1z": "fLEMJwoq", "JoqtQVIl": "q67jWJWk", "hDe7nu3h": "hjayvBLj"}, "namespace": "nMH6vp5A", "nonceStr": "tlYHlEbA", "paymentMethod": "UochsJpk", "paymentMethodFee": 50, "paymentOrderNo": "J0sjHrpG", "paymentProvider": "PAYPAL", "paymentProviderFee": 98, "paymentStationUrl": "PpDd4TOu", "price": 6, "refundedTime": "1977-03-31T00:00:00Z", "salesTax": 98, "sandbox": true, "sku": "ozDug93D", "status": "CHARGEBACK_REVERSED", "statusReason": "4ikdUraM", "subscriptionId": "aoef7c5z", "subtotalPrice": 9, "targetNamespace": "nwQicNMc", "targetUserId": "tr3PVSFa", "tax": 27, "totalPrice": 90, "totalTax": 75, "txEndTime": "1996-05-16T00:00:00Z", "type": "FjcwJtSH", "userId": "2VIUSzbz", "vat": 17}' \
    > test.out 2>&1
eval_tap $? 231 'ProcessUserSubscriptionNotification' test.out

#- 232 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'MH87IJkh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZgy13xy' \
    --body '{"count": 90, "orderNo": "KoRhJt02"}' \
    > test.out 2>&1
eval_tap $? 232 'AcquireUserTicket' test.out

#- 233 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'LJlr9L8z' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserCurrencyWallets' test.out

#- 234 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '8oQThs2n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fFAhTPl3' \
    --limit '75' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 234 'ListUserCurrencyTransactions' test.out

#- 235 CheckWallet
eval_tap 0 235 'CheckWallet # SKIP deprecated' test.out

#- 236 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'MjXySmcL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pNZeVyT0' \
    --body '{"amount": 30, "expireAt": "1976-11-27T00:00:00Z", "origin": "Xbox", "reason": "pXwVO3IQ", "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 236 'CreditUserWallet' test.out

#- 237 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'CSWcgOHM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjNNNxy7' \
    --body '{"amount": 0, "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 237 'PayWithUserWallet' test.out

#- 238 GetUserWallet
eval_tap 0 238 'GetUserWallet # SKIP deprecated' test.out

#- 239 DebitUserWallet
eval_tap 0 239 'DebitUserWallet # SKIP deprecated' test.out

#- 240 DisableUserWallet
eval_tap 0 240 'DisableUserWallet # SKIP deprecated' test.out

#- 241 EnableUserWallet
eval_tap 0 241 'EnableUserWallet # SKIP deprecated' test.out

#- 242 ListUserWalletTransactions
eval_tap 0 242 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 243 QueryWallets
eval_tap 0 243 'QueryWallets # SKIP deprecated' test.out

#- 244 GetWallet
eval_tap 0 244 'GetWallet # SKIP deprecated' test.out

#- 245 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '4LYuOZyA' \
    --end 'FnNz8ss6' \
    --start 'wBguUS9m' \
    > test.out 2>&1
eval_tap $? 245 'SyncOrders' test.out

#- 246 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["7WAFc3et", "8jIYT7MU", "Gw6QNwLf"], "apiKey": "L4My6FY8", "authoriseAsCapture": false, "blockedPaymentMethods": ["B42Kq9rx", "35agPy5N", "WU6FIHeU"], "clientKey": "lkiFWhwR", "dropInSettings": "lUatnvwj", "liveEndpointUrlPrefix": "eGOaqmo4", "merchantAccount": "I4tqcDpD", "notificationHmacKey": "2yWM5wEj", "notificationPassword": "t6HVDVES", "notificationUsername": "gsLXxZwJ", "returnUrl": "Sh6Fzwp1", "settings": "nsOaKSOT"}' \
    > test.out 2>&1
eval_tap $? 246 'TestAdyenConfig' test.out

#- 247 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "aPLt4ESs", "privateKey": "2mfeyTEH", "publicKey": "EI0NJqAO", "returnUrl": "BaT1RTyy"}' \
    > test.out 2>&1
eval_tap $? 247 'TestAliPayConfig' test.out

#- 248 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "vax3RImt", "secretKey": "yLod2zXH"}' \
    > test.out 2>&1
eval_tap $? 248 'TestCheckoutConfig' test.out

#- 249 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'oljsUVN1' \
    > test.out 2>&1
eval_tap $? 249 'DebugMatchedPaymentMerchantConfig' test.out

#- 250 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "30JQclkz", "clientSecret": "v2Peudqj", "returnUrl": "hXaMagQl", "webHookId": "tH1csKV5"}' \
    > test.out 2>&1
eval_tap $? 250 'TestPayPalConfig' test.out

#- 251 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["9Z7ZW5XU", "1xjlskp7", "ncjIe6fS"], "publishableKey": "6lLXzcPp", "secretKey": "8EXXZEaM", "webhookSecret": "90Sy2cmG"}' \
    > test.out 2>&1
eval_tap $? 251 'TestStripeConfig' test.out

#- 252 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "c1po4DnR", "key": "3vkTmFVm", "mchid": "3lchCaTS", "returnUrl": "1vfbAqSk"}' \
    > test.out 2>&1
eval_tap $? 252 'TestWxPayConfig' test.out

#- 253 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "oq5YHcre", "flowCompletionUrl": "xPxliXFJ", "merchantId": 100, "projectId": 83, "projectSecretKey": "G2A5MV6i"}' \
    > test.out 2>&1
eval_tap $? 253 'TestXsollaConfig' test.out

#- 254 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'O7HOHR8N' \
    > test.out 2>&1
eval_tap $? 254 'GetPaymentMerchantConfig' test.out

#- 255 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'WSlpxV5a' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["QszUKVvR", "lZBcLpTn", "rS5Q35h0"], "apiKey": "UXZDdsgb", "authoriseAsCapture": true, "blockedPaymentMethods": ["MTuBhmEl", "J3pPyv96", "OLgJByQL"], "clientKey": "U5mDqZ8I", "dropInSettings": "xRUJU1wz", "liveEndpointUrlPrefix": "gsAVe1Ax", "merchantAccount": "cACDZzKy", "notificationHmacKey": "Pr1MNsiZ", "notificationPassword": "nFGxAMG0", "notificationUsername": "yYunE6my", "returnUrl": "FnXmvkZk", "settings": "bnGhsQ5K"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateAdyenConfig' test.out

#- 256 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'NMnTwt2y' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 256 'TestAdyenConfigById' test.out

#- 257 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '9ONZ2Wxo' \
    --sandbox  \
    --validate  \
    --body '{"appId": "TYRHdLcO", "privateKey": "so5DJhqp", "publicKey": "thZiDqLM", "returnUrl": "ZUyfI5Er"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateAliPayConfig' test.out

#- 258 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '7sPbN9jH' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestAliPayConfigById' test.out

#- 259 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'RjKAL55V' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "q2VRmrXO", "secretKey": "hxRGgrop"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateCheckoutConfig' test.out

#- 260 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'ijlZKTGf' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestCheckoutConfigById' test.out

#- 261 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'wYqVbpPU' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "AeDTzcsK", "clientSecret": "oYJAPWiu", "returnUrl": "ColMvwFk", "webHookId": "kmzIqCg5"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdatePayPalConfig' test.out

#- 262 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '1S2Jrkcf' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestPayPalConfigById' test.out

#- 263 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'vcIHUHOF' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["YdEAkKyU", "9oDLX37Z", "uGUDm72H"], "publishableKey": "whoMQ7Hi", "secretKey": "YpEUmphj", "webhookSecret": "hMR6UrHj"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateStripeConfig' test.out

#- 264 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '4GxpDBsD' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 264 'TestStripeConfigById' test.out

#- 265 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'wq4CyhlM' \
    --validate  \
    --body '{"appId": "FEC5wXLg", "key": "heuQgEkb", "mchid": "tc7ad2nr", "returnUrl": "F4MmGzoz"}' \
    > test.out 2>&1
eval_tap $? 265 'UpdateWxPayConfig' test.out

#- 266 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'CwzqZY8m' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 266 'UpdateWxPayConfigCert' test.out

#- 267 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'o0wd1ZOA' \
    > test.out 2>&1
eval_tap $? 267 'TestWxPayConfigById' test.out

#- 268 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'u7gP1cd5' \
    --validate  \
    --body '{"apiKey": "l0Vf0bTO", "flowCompletionUrl": "ViTvKNGc", "merchantId": 61, "projectId": 91, "projectSecretKey": "pjmbjFPw"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateXsollaConfig' test.out

#- 269 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'NlIX1lkW' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfigById' test.out

#- 270 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'bNvjz9nn' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateXsollaUIConfig' test.out

#- 271 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '61' \
    --namespace "$AB_NAMESPACE" \
    --offset '14' \
    --region 'ycJoZkWk' \
    > test.out 2>&1
eval_tap $? 271 'QueryPaymentProviderConfig' test.out

#- 272 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "mMdR274v", "region": "3ufgxnQl", "sandboxTaxJarApiToken": "9OyAaLOk", "specials": ["CHECKOUT", "ADYEN", "STRIPE"], "taxJarApiToken": "rn1st6po", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 272 'CreatePaymentProviderConfig' test.out

#- 273 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 273 'GetAggregatePaymentProviders' test.out

#- 274 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'AziFmw2X' \
    > test.out 2>&1
eval_tap $? 274 'DebugMatchedPaymentProviderConfig' test.out

#- 275 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 275 'GetSpecialPaymentProviders' test.out

#- 276 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'ovu5x3im' \
    --body '{"aggregate": "ADYEN", "namespace": "zbyLyidK", "region": "yB1tYclY", "sandboxTaxJarApiToken": "TXXDPYav", "specials": ["XSOLLA", "STRIPE", "ADYEN"], "taxJarApiToken": "sg2IK82w", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 276 'UpdatePaymentProviderConfig' test.out

#- 277 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'c0b6QRFj' \
    > test.out 2>&1
eval_tap $? 277 'DeletePaymentProviderConfig' test.out

#- 278 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 278 'GetPaymentTaxConfig' test.out

#- 279 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "LO8biWdZ", "taxJarApiToken": "aPIWsBl7", "taxJarEnabled": true, "taxJarProductCodesMapping": {"wF5QC1kW": "9tfFAGXx", "slImJo0A": "RQrukJyF", "zOwOjLZa": "DGqrqg9p"}}' \
    > test.out 2>&1
eval_tap $? 279 'UpdatePaymentTaxConfig' test.out

#- 280 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '918fEIQs' \
    --end 'HyHAnab0' \
    --start 'UF9nRPl0' \
    > test.out 2>&1
eval_tap $? 280 'SyncPaymentOrders' test.out

#- 281 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '1Gwjecr1' \
    --storeId 'FZvEGIpa' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetRootCategories' test.out

#- 282 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'pE2hDM09' \
    --storeId 'UFOOouzI' \
    > test.out 2>&1
eval_tap $? 282 'DownloadCategories' test.out

#- 283 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '1mVwv37U' \
    --namespace "$AB_NAMESPACE" \
    --language 'daXkGQZ4' \
    --storeId 'zPVSZHYb' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetCategory' test.out

#- 284 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'Xs1KQbM2' \
    --namespace "$AB_NAMESPACE" \
    --language '51K05BQp' \
    --storeId 'IS8PSS7D' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetChildCategories' test.out

#- 285 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '735YiUYU' \
    --namespace "$AB_NAMESPACE" \
    --language '467tasWB' \
    --storeId 'vqZr2zUs' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetDescendantCategories' test.out

#- 286 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 286 'PublicListCurrencies' test.out

#- 287 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'fWkDGcvf' \
    --region 'qwUcR0TZ' \
    --storeId 'OGqmesOM' \
    --appId 'ISWJc9Jt' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetItemByAppId' test.out

#- 288 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId 'wmwtKes2' \
    --categoryPath 'YEZxLMKJ' \
    --features 'sBi8D6aZ' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'eY61icji' \
    --limit '48' \
    --offset '64' \
    --region 'XmpeCWde' \
    --sortBy 'name:desc,createdAt,name' \
    --storeId 'QQ2J03A4' \
    --tags 'REqR5E7M' \
    > test.out 2>&1
eval_tap $? 288 'PublicQueryItems' test.out

#- 289 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language '1b3LrXzV' \
    --region 'kUVCnCbw' \
    --storeId '9tjD4qqQ' \
    --sku 'CBlJ0GnF' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetItemBySku' test.out

#- 290 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language '4JGBuNeh' \
    --region 'tlqBpgOk' \
    --storeId 'YFDClKPZ' \
    --itemIds 'geL2xW52' \
    > test.out 2>&1
eval_tap $? 290 'PublicBulkGetItems' test.out

#- 291 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["TZiuEhG8", "LKTgOPhq", "exGHgGTy"]}' \
    > test.out 2>&1
eval_tap $? 291 'PublicValidateItemPurchaseCondition' test.out

#- 292 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'INGAMEITEM' \
    --limit '87' \
    --offset '61' \
    --region '1Ug9S7pq' \
    --storeId 'hJSyTOfn' \
    --keyword 'S8ABNbAI' \
    --language '8Ard9bCB' \
    > test.out 2>&1
eval_tap $? 292 'PublicSearchItems' test.out

#- 293 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'mr5tZmZK' \
    --namespace "$AB_NAMESPACE" \
    --language 'KTGRZ5Q7' \
    --region 'qvEoKiwB' \
    --storeId 'PKowI5PX' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetApp' test.out

#- 294 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'sD8IDeNa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'PublicGetItemDynamicData' test.out

#- 295 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '3EKFsQvg' \
    --namespace "$AB_NAMESPACE" \
    --language 'sg33zlch' \
    --populateBundle  \
    --region 'HJnMMvSY' \
    --storeId 'QXFGXUmD' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetItem' test.out

#- 296 GetPaymentCustomization
eval_tap 0 296 'GetPaymentCustomization # SKIP deprecated' test.out

#- 297 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "AjlfWQFj", "paymentProvider": "PAYPAL", "returnUrl": "tWIgyRPx", "ui": "VsFokIxK", "zipCode": "JlwoI5es"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetPaymentUrl' test.out

#- 298 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'W5QMOdJI' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetPaymentMethods' test.out

#- 299 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZpQXbrDq' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUnpaidPaymentOrder' test.out

#- 300 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jvxQm9nB' \
    --paymentProvider 'STRIPE' \
    --zipCode 'dLgxBIk3' \
    --body '{"token": "cE9h94c9"}' \
    > test.out 2>&1
eval_tap $? 300 'Pay' test.out

#- 301 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Q1cVUFXr' \
    > test.out 2>&1
eval_tap $? 301 'PublicCheckPaymentOrderPaidStatus' test.out

#- 302 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'STRIPE' \
    --region 'OLSDzHro' \
    > test.out 2>&1
eval_tap $? 302 'GetPaymentPublicConfig' test.out

#- 303 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '3YmJVlPA' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetQRCode' test.out

#- 304 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '0EBdX5yP' \
    --foreinginvoice '3FMhr95i' \
    --invoiceId 'qCBv2g6b' \
    --payload 'TuHnu1Pi' \
    --redirectResult 'qXe3R2PD' \
    --resultCode '4d5hPOU7' \
    --sessionId 'k9xSm1tE' \
    --status 'oCFeS9fq' \
    --token '7Tc7j1d5' \
    --type 'hWOTP0nt' \
    --userId 'u5OfjW8T' \
    --orderNo 'lU26IK9l' \
    --paymentOrderNo 'TXzUq3iM' \
    --paymentProvider 'CHECKOUT' \
    --returnUrl 'stGWaBip' \
    > test.out 2>&1
eval_tap $? 304 'PublicNormalizePaymentReturnUrl' test.out

#- 305 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '8GwOufdE' \
    --paymentOrderNo 'kqeLj5gv' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 305 'GetPaymentTaxValue' test.out

#- 306 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'S5S5qwfj' \
    > test.out 2>&1
eval_tap $? 306 'GetRewardByCode' test.out

#- 307 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'WWheWtJn' \
    --limit '48' \
    --offset '17' \
    --sortBy 'namespace:asc,namespace:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 307 'QueryRewards1' test.out

#- 308 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'TvyFfpd7' \
    > test.out 2>&1
eval_tap $? 308 'GetReward1' test.out

#- 309 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 309 'PublicListStores' test.out

#- 310 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'jIgxt1EB,u1yZLInC,JrMObPvr' \
    --itemIds 'Ce0i1FoW,dkGITb8q,5UQE7D5Z' \
    --skus 'YlcNjtrH,JU7jxKOp,Pqv57TbP' \
    > test.out 2>&1
eval_tap $? 310 'PublicExistsAnyMyActiveEntitlement' test.out

#- 311 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'kUyW7YMw' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 312 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'FYpz5zsP' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 313 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'qiwEIqUY' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 314 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'x3b5pLwP,2tMH2JON,u0CDF9yp' \
    --itemIds 'zgl8Ffgw,cXT0G1Yw,PIicdJul' \
    --skus 'YNwZhWYU,n2guPxha,fbSJgfH3' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetEntitlementOwnershipToken' test.out

#- 315 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'WeuWeuAC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyWallet' test.out

#- 316 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'SyZTVmo0' \
    --body '{"epicGamesJwtToken": "FPxQLSPv"}' \
    > test.out 2>&1
eval_tap $? 316 'SyncEpicGameDLC' test.out

#- 317 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'L7rrXpvn' \
    --body '{"serviceLabel": 87}' \
    > test.out 2>&1
eval_tap $? 317 'PublicSyncPsnDlcInventory' test.out

#- 318 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'VtamftEy' \
    --body '{"serviceLabels": [81, 98, 67]}' \
    > test.out 2>&1
eval_tap $? 318 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 319 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'FxBs5gvx' \
    --body '{"appId": "b6DbfvKZ", "steamId": "X549chMR"}' \
    > test.out 2>&1
eval_tap $? 319 'SyncSteamDLC' test.out

#- 320 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'F43FcncM' \
    --body '{"xstsToken": "zLEDrBqz"}' \
    > test.out 2>&1
eval_tap $? 320 'SyncXboxDLC' test.out

#- 321 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'koYQ97cK' \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'NPqCe3lL' \
    --features 'cDYJ3jtU,YDK47CpW,P1aqk3pJ' \
    --itemId 'GE4hm65Q,xOZA1wBu,4uvR75DM' \
    --limit '96' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 321 'PublicQueryUserEntitlements' test.out

#- 322 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KMeuDmKf' \
    --appId 'R6v3QtMj' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserAppEntitlementByAppId' test.out

#- 323 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'm1b8LJSl' \
    --limit '58' \
    --offset '47' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 323 'PublicQueryUserEntitlementsByAppType' test.out

#- 324 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LAUWIfBd' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'kLOtUg4f' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserEntitlementByItemId' test.out

#- 325 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'TEyvUuck' \
    --entitlementClazz 'MEDIA' \
    --sku 'oeNjCfjC' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserEntitlementBySku' test.out

#- 326 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'xNH8KZgY' \
    --appIds 'boHs4Bqb,4DROM9eW,cdPePR1m' \
    --itemIds '90ErJgRQ,dBsNQgRB,cdGNonVs' \
    --skus '7PCLCafF,olnD6c4x,KQoNyuHx' \
    > test.out 2>&1
eval_tap $? 326 'PublicExistsAnyUserActiveEntitlement' test.out

#- 327 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEvNu7YI' \
    --appId 'R3ke5uav' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 328 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cI1YPBIn' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'XPU7GyNE' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 329 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uc96UjQp' \
    --ids 'lu4Wmw4O,YVwEZfv8,Rxv4JAqj' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 330 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '9joWHROe' \
    --entitlementClazz 'CODE' \
    --sku 'XmM7tb0N' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 331 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'bhUidxNh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U5wOkcvv' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetUserEntitlement' test.out

#- 332 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'v3CaFvN9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xo6fmiaa' \
    --body '{"options": ["9aPfdA9i", "aoErW7WB", "4a3KMb8H"], "requestId": "qpq7jPvI", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 332 'PublicConsumeUserEntitlement' test.out

#- 333 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'roepDrfi' \
    --body '{"code": "awhzxJjT", "language": "gpz", "region": "7F86lzEz"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicRedeemCode' test.out

#- 334 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kGFHuXmD' \
    --body '{"excludeOldTransactions": true, "language": "Glib_nciz-118", "productId": "RDIaBygM", "receiptData": "6LX5kxEz", "region": "h3Itvm5F", "transactionId": "cOGILXGJ"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicFulfillAppleIAPItem' test.out

#- 335 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tLXo17Q6' \
    --body '{"epicGamesJwtToken": "lFPJpbeh"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncEpicGamesInventory' test.out

#- 336 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kIIKZzRf' \
    --body '{"autoAck": false, "language": "DMhT", "orderId": "lorjpze8", "packageName": "ZkiOlcHG", "productId": "Sqt0IbrL", "purchaseTime": 69, "purchaseToken": "mjnGrUMj", "region": "7kyDnmDL"}' \
    > test.out 2>&1
eval_tap $? 336 'PublicFulfillGoogleIAPItem' test.out

#- 337 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'ai96EoBY' \
    --body '{"currencyCode": "C0NHSsyw", "price": 0.054204539043954725, "productId": "EQT2WDVE", "serviceLabel": 77}' \
    > test.out 2>&1
eval_tap $? 337 'PublicReconcilePlayStationStore' test.out

#- 338 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '4cG1XmU4' \
    --body '{"currencyCode": "vp4jao9n", "price": 0.1193813031653842, "productId": "bqGJZSfC", "serviceLabels": [73, 91, 68]}' \
    > test.out 2>&1
eval_tap $? 338 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 339 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'B7kTZksh' \
    --body '{"appId": "mHi7TV1x", "language": "Tb_od", "region": "fTPlRcIM", "stadiaPlayerId": "wQlfrTa6"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncStadiaEntitlement' test.out

#- 340 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'uEctC6Ur' \
    --body '{"appId": "h1JtncT8", "currencyCode": "WvbFZ2IR", "language": "hBB", "price": 0.38430998364510915, "productId": "OlOYyhyK", "region": "HiegGcQh", "steamId": "s5i8WLJZ"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncSteamInventory' test.out

#- 341 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bkJT0eNS' \
    --body '{"gameId": "g0PrUac6", "language": "kQY_us", "region": "rEWk6S5O"}' \
    > test.out 2>&1
eval_tap $? 341 'SyncTwitchDropsEntitlement' test.out

#- 342 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'dTLXKDCH' \
    --body '{"currencyCode": "nK9alII3", "price": 0.3421514924894533, "productId": "366sKBIe", "xstsToken": "DHWVazqq"}' \
    > test.out 2>&1
eval_tap $? 342 'SyncXboxInventory' test.out

#- 343 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '9xFTa1pn' \
    --itemId '6I8WdQJy' \
    --limit '28' \
    --offset '17' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 343 'PublicQueryUserOrders' test.out

#- 344 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ad9CaAAw' \
    --body '{"currencyCode": "vQx7I8vd", "discountedPrice": 25, "ext": {"I9qEtnWx": {}, "FuTPuUBP": {}, "IeLmaqvd": {}}, "itemId": "51FpKkpN", "language": "Zx_Aw", "price": 44, "quantity": 82, "region": "wYMHv82S", "returnUrl": "b41kMA2e"}' \
    > test.out 2>&1
eval_tap $? 344 'PublicCreateUserOrder' test.out

#- 345 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HBnd1VEu' \
    --userId 'hngasUt5' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserOrder' test.out

#- 346 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TZjmOAav' \
    --userId 'YnmXF5Z6' \
    > test.out 2>&1
eval_tap $? 346 'PublicCancelUserOrder' test.out

#- 347 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MywjDEpV' \
    --userId 'OMcUrAwk' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserOrderHistories' test.out

#- 348 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TpRnrVsb' \
    --userId 'AMssuUkT' \
    > test.out 2>&1
eval_tap $? 348 'PublicDownloadUserOrderReceipt' test.out

#- 349 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'WaH1p0jj' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetPaymentAccounts' test.out

#- 350 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'W1lkN9NP' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'gSYLh9mA' \
    > test.out 2>&1
eval_tap $? 350 'PublicDeletePaymentAccount' test.out

#- 351 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '340gzBF1' \
    --chargeStatus 'CHARGED' \
    --itemId 'yl0ckvPD' \
    --limit '56' \
    --offset '67' \
    --sku 'NkXzeATZ' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 351 'PublicQueryUserSubscriptions' test.out

#- 352 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'JNP0Gg2p' \
    --body '{"currencyCode": "qkWkBO9l", "itemId": "ZEjeVTFu", "language": "yji_PW", "region": "DOVmChmB", "returnUrl": "isY24zQQ", "source": "WYwv2qbA"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicSubscribeSubscription' test.out

#- 353 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '1mEYQC31' \
    --itemId 'Q327J7m4' \
    > test.out 2>&1
eval_tap $? 353 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 354 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'v6dcAHLJ' \
    --userId 'OmsRYATM' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUserSubscription' test.out

#- 355 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PeGeabVx' \
    --userId 'KHxrvPdm' \
    > test.out 2>&1
eval_tap $? 355 'PublicChangeSubscriptionBillingAccount' test.out

#- 356 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '29W1WT8z' \
    --userId '7l3bkVjY' \
    --body '{"immediate": false, "reason": "ipTQtwPf"}' \
    > test.out 2>&1
eval_tap $? 356 'PublicCancelSubscription' test.out

#- 357 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Xa15beVx' \
    --userId 'Cg7rPSUH' \
    --excludeFree  \
    --limit '39' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetUserSubscriptionBillingHistories' test.out

#- 358 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '0iRiROs7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wgmN86H7' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetWallet' test.out

#- 359 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'zLrXulSt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'boFS2FR7' \
    --limit '77' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 359 'PublicListUserWalletTransactions' test.out

#- 360 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate '5LC1Im1s' \
    --baseAppId 'AhJZTIQK' \
    --categoryPath 'QkVRuuil' \
    --features 'hXyHDxZV' \
    --includeSubCategoryItem  \
    --itemName 'SEj37ddM' \
    --itemStatus 'INACTIVE' \
    --itemType 'LOOTBOX' \
    --limit '65' \
    --offset '47' \
    --region 'cxKSv3Se' \
    --sortBy 'createdAt:desc,createdAt:asc,updatedAt:desc' \
    --storeId '4mbEfuE4' \
    --tags '7timqgRe' \
    --targetNamespace 'OUAnVfvD' \
    > test.out 2>&1
eval_tap $? 360 'QueryItems1' test.out

#- 361 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fTtCHxDD' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 361 'ImportStore1' test.out

#- 362 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '4Vg2omZT' \
    --body '{"itemIds": ["NApBkIG6", "j6Vvcup5", "KzTF2PNl"]}' \
    > test.out 2>&1
eval_tap $? 362 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE