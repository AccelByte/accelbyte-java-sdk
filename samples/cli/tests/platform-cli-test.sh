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
echo "1..347"

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
    --body '{"context": {"item": {"appId": "NcDogRsb", "appType": "DEMO", "baseAppId": "Qb0TttfG", "boothName": "G4KJW1Ze", "boundItemIds": ["or8bXl8S", "JM2mlNXw", "cAYKnKX5"], "categoryPath": "YC4SMifl", "clazz": "GJMCWVMh", "createdAt": "1983-03-25T00:00:00Z", "description": "crnIPCK5", "displayOrder": 94, "entitlementType": "CONSUMABLE", "ext": {"3ERDqHWS": {}, "nwgZIF1A": {}, "jP1VZGCH": {}}, "features": ["EMzAKwLT", "YvDuwv3n", "itPQSFba"], "fresh": false, "images": [{"as": "zN6ynRzK", "caption": "X1HS6mPe", "height": 35, "imageUrl": "SgxCLndf", "smallImageUrl": "syngSLLE", "width": 94}, {"as": "mOwlnGIc", "caption": "Hw7dVYsy", "height": 42, "imageUrl": "wbtYZVZV", "smallImageUrl": "nyJrJuUi", "width": 85}, {"as": "4igTuh73", "caption": "rBnbukdM", "height": 13, "imageUrl": "fUSmW2ky", "smallImageUrl": "GFfDgPNK", "width": 50}], "itemId": "ndpznh7l", "itemIds": ["dnHQVIFP", "aFOQu0Xw", "XTjmWFab"], "itemQty": {"i0vDdxHo": 26, "4IdPD6hc": 99, "4g3enbmw": 45}, "itemType": "INGAMEITEM", "language": "YynPP4TV", "listable": true, "localExt": {"OMt1V1cg": {}, "UGlkFfbr": {}, "oQM9MmQo": {}}, "longDescription": "bkI3s7dY", "maxCount": 32, "maxCountPerUser": 51, "name": "0NJg9ihs", "namespace": "EpzbXStP", "optionBoxConfig": {"boxItems": [{"count": 40, "itemId": "biqFjlPD", "itemSku": "5NnHwpzd"}, {"count": 75, "itemId": "RSkBzygm", "itemSku": "kTtoYssL"}, {"count": 35, "itemId": "B7GXpyDP", "itemSku": "OyKk3H5u"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 52, "comparison": "isGreaterThanOrEqual", "name": "mh1IEEmv", "predicateType": "EntitlementPredicate", "value": "1YlCzOAS", "values": ["7U2hsdm1", "16HPmXUq", "OYD8GgiB"]}, {"anyOf": 70, "comparison": "isGreaterThanOrEqual", "name": "flP61kT6", "predicateType": "EntitlementPredicate", "value": "ezIjaCXT", "values": ["2SxeHQV7", "qbgJwo46", "8H5QwqxF"]}, {"anyOf": 86, "comparison": "isGreaterThanOrEqual", "name": "yR9fKaWO", "predicateType": "SeasonTierPredicate", "value": "5C6iFEtC", "values": ["1fOeOaw1", "SOv9QCyg", "occR9338"]}]}, {"operator": "or", "predicates": [{"anyOf": 34, "comparison": "is", "name": "hH0ffgOV", "predicateType": "SeasonPassPredicate", "value": "Z89P436f", "values": ["JOeYMDoC", "x59CwJ9F", "wSQTqeWu"]}, {"anyOf": 59, "comparison": "isGreaterThanOrEqual", "name": "EmmKqHTJ", "predicateType": "SeasonTierPredicate", "value": "uMTeMFSL", "values": ["bxne8xdv", "ACP5U07U", "3PxmV6IW"]}, {"anyOf": 72, "comparison": "isLessThanOrEqual", "name": "nsInWnvB", "predicateType": "SeasonPassPredicate", "value": "M17NiocE", "values": ["nzPNJJiC", "Hqz7fmJY", "k3S5xZUZ"]}]}, {"operator": "or", "predicates": [{"anyOf": 17, "comparison": "isLessThan", "name": "Stu6Js5R", "predicateType": "EntitlementPredicate", "value": "zq6IdGcG", "values": ["ax90b6c9", "0JpFfIzb", "wprrU9FR"]}, {"anyOf": 88, "comparison": "isLessThanOrEqual", "name": "QULViRlf", "predicateType": "SeasonPassPredicate", "value": "ZoOVhVW0", "values": ["uaODLpZQ", "Frq3VuTb", "xB6R5LwB"]}, {"anyOf": 96, "comparison": "isGreaterThanOrEqual", "name": "mdbzDEzO", "predicateType": "SeasonPassPredicate", "value": "jvPVi22d", "values": ["iOUViRZl", "ymJv0XOe", "xfgFoppT"]}]}]}, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 40, "fixedTrialCycles": 45, "graceDays": 76}, "region": "ZtWIl1G7", "regionData": [{"currencyCode": "S0ibUBfH", "currencyNamespace": "cU3mApjt", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1998-06-11T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1982-10-24T00:00:00Z", "discountedPrice": 11, "expireAt": "1987-12-20T00:00:00Z", "price": 26, "purchaseAt": "1972-04-04T00:00:00Z", "trialPrice": 95}, {"currencyCode": "3G7zsFqV", "currencyNamespace": "0hzjLnvM", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1972-03-09T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1979-04-28T00:00:00Z", "discountedPrice": 74, "expireAt": "1993-09-22T00:00:00Z", "price": 8, "purchaseAt": "1996-06-12T00:00:00Z", "trialPrice": 28}, {"currencyCode": "JSqP7OUP", "currencyNamespace": "Y1ZYWo3P", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1992-11-06T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1988-01-15T00:00:00Z", "discountedPrice": 71, "expireAt": "1995-04-23T00:00:00Z", "price": 99, "purchaseAt": "1977-07-05T00:00:00Z", "trialPrice": 70}], "seasonType": "PASS", "sku": "oD9u7gXa", "stackable": true, "status": "ACTIVE", "tags": ["VumX3PKm", "HD5dEvK1", "FKlEbaGz"], "targetCurrencyCode": "eKfvxfiI", "targetItemId": "cEcT61hT", "targetNamespace": "E8IFkZGe", "thumbnailUrl": "NIKemY85", "title": "kdmNlLGe", "updatedAt": "1973-02-08T00:00:00Z", "useCount": 35}, "namespace": "B155bUJc", "order": {"currency": {"currencyCode": "33bVoHwW", "currencySymbol": "RdVBk2qi", "currencyType": "VIRTUAL", "decimals": 66, "namespace": "nV5wF23F"}, "ext": {"nC8RK9QQ": {}, "zrtfSom6": {}, "CKRymWRz": {}}, "free": true}, "source": "REWARD"}, "script": "5pIQX1v5", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'Y0wO2Afc' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '8ldRDhYC' \
    --body '{"grantDays": "3SVoWbp3"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'f1pialCp' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'hrE7f0xO' \
    --body '{"grantDays": "IjIu4QFa"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --name '6KG7v2mE' \
    --offset '59' \
    --tag 'mwI7G54D' \
    > test.out 2>&1
eval_tap $? 8 'QueryCampaigns' test.out

#- 9 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rQPf6AWG", "items": [{"extraSubscriptionDays": 78, "itemId": "n5XtZSbw", "itemName": "C0t6QxvO", "quantity": 38}, {"extraSubscriptionDays": 92, "itemId": "Erwo534a", "itemName": "Ap4W85hJ", "quantity": 47}, {"extraSubscriptionDays": 55, "itemId": "hMr24txb", "itemName": "zMEyKSfe", "quantity": 4}], "maxRedeemCountPerCampaignPerUser": 94, "maxRedeemCountPerCode": 33, "maxRedeemCountPerCodePerUser": 41, "maxSaleCount": 81, "name": "0Mc6zvgY", "redeemEnd": "1971-03-06T00:00:00Z", "redeemStart": "1979-05-10T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["Ahw4nhES", "IJ3SOora", "Co9RyMrl"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateCampaign' test.out

#- 10 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'TOpLeAd1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetCampaign' test.out

#- 11 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'B6dflblh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kH5ry9Z6", "items": [{"extraSubscriptionDays": 28, "itemId": "cAb0681i", "itemName": "ky2EfqWh", "quantity": 11}, {"extraSubscriptionDays": 68, "itemId": "6XVnITz5", "itemName": "eCxWqY4G", "quantity": 50}, {"extraSubscriptionDays": 46, "itemId": "6GghzB5r", "itemName": "uS5w7Yp3", "quantity": 24}], "maxRedeemCountPerCampaignPerUser": 60, "maxRedeemCountPerCode": 20, "maxRedeemCountPerCodePerUser": 60, "maxSaleCount": 15, "name": "H9uymVRq", "redeemEnd": "1984-12-27T00:00:00Z", "redeemStart": "1983-02-14T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["9Um6qBG5", "1XK3F5gC", "Oi4wSvOd"]}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateCampaign' test.out

#- 12 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'bHcsNd9B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetCampaignDynamic' test.out

#- 13 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '140LCThQ' \
    > test.out 2>&1
eval_tap $? 13 'GetRootCategories' test.out

#- 14 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ekqdiZJA' \
    --body '{"categoryPath": "Xz5TZI0n", "localizationDisplayNames": {"oUkqfzqw": "03xsd26w", "VMQI43SN": "nbxwuoLT", "AdwNWkZd": "kxXnKWNP"}}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCategory' test.out

#- 15 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XKFHehlH' \
    > test.out 2>&1
eval_tap $? 15 'ListCategoriesBasic' test.out

#- 16 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'FG6QWlaf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rM7FYvm5' \
    > test.out 2>&1
eval_tap $? 16 'GetCategory' test.out

#- 17 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'FV564fBl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mJJXJJhi' \
    --body '{"localizationDisplayNames": {"xVE9gHEM": "SfAB6WJy", "jHhw2mtr": "BKYWFavk", "IfsrZ0Mi": "acDvbj6t"}}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCategory' test.out

#- 18 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'INg24iv2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EIHZ85he' \
    > test.out 2>&1
eval_tap $? 18 'DeleteCategory' test.out

#- 19 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '39056kkl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZDd5Am5l' \
    > test.out 2>&1
eval_tap $? 19 'GetChildCategories' test.out

#- 20 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 't60fd0NY' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1TOlwe76' \
    > test.out 2>&1
eval_tap $? 20 'GetDescendantCategories' test.out

#- 21 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'DxBFCsT0' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '45' \
    --code 'MwcoDovC' \
    --limit '0' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 21 'QueryCodes' test.out

#- 22 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'KGLwnf7x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 28}' \
    > test.out 2>&1
eval_tap $? 22 'CreateCodes' test.out

#- 23 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'jmi9SK9x' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '81' \
    > test.out 2>&1
eval_tap $? 23 'Download' test.out

#- 24 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'BCMAy4Wa' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '57' \
    > test.out 2>&1
eval_tap $? 24 'BulkDisableCodes' test.out

#- 25 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'I2KlFTNU' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '0' \
    > test.out 2>&1
eval_tap $? 25 'BulkEnableCodes' test.out

#- 26 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'xd85MEzj' \
    --namespace "$AB_NAMESPACE" \
    --code 'w3PMlpIJ' \
    --limit '77' \
    --offset '24' \
    --userId 'DFFLQqvK' \
    > test.out 2>&1
eval_tap $? 26 'QueryRedeemHistory' test.out

#- 27 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 't27nWlJy' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 27 'GetCode' test.out

#- 28 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'DVB3yNeD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DisableCode' test.out

#- 29 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'buNUtnff' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'EnableCode' test.out

#- 30 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 30 'ListCurrencies' test.out

#- 31 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "vzf01s4F", "currencySymbol": "lof93O0r", "currencyType": "REAL", "decimals": 0, "localizationDescriptions": {"Htloy3iI": "26cbqywD", "RKYA2iEY": "UtkMPYRl", "Oxd0HDf9": "57eMzeGQ"}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateCurrency' test.out

#- 32 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'EONZUFg4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"MO7a6FZT": "p9jz7cyD", "o0j2Y5yw": "ptVFFTlu", "zbYJlCjD": "HPX7hL5V"}}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateCurrency' test.out

#- 33 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'oBmPqZgJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteCurrency' test.out

#- 34 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'TL625oRR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetCurrencyConfig' test.out

#- 35 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'cTJqx8wM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'GetCurrencySummary' test.out

#- 36 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetDLCItemConfig' test.out

#- 37 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "n8fVQzVD", "rewards": [{"currency": {"currencyCode": "QIytmdFM", "namespace": "Zv0xEzAR"}, "item": {"itemId": "3hIeTjGz", "itemSku": "igJYo0R0", "itemType": "4ckJ0emT"}, "quantity": 66, "type": "CURRENCY"}, {"currency": {"currencyCode": "mHf4v2NQ", "namespace": "34uGoiyx"}, "item": {"itemId": "FjQKOGJu", "itemSku": "5ZMmJCnO", "itemType": "nISYUlZS"}, "quantity": 9, "type": "CURRENCY"}, {"currency": {"currencyCode": "vUJfSspy", "namespace": "X0ZjHzlv"}, "item": {"itemId": "1oybZWNH", "itemSku": "z6pLRLiR", "itemType": "DQki6oC5"}, "quantity": 42, "type": "CURRENCY"}]}, {"id": "TJZnFmKt", "rewards": [{"currency": {"currencyCode": "Msq1p5Z7", "namespace": "Qq38AG57"}, "item": {"itemId": "9N21FE2S", "itemSku": "bkA91TVQ", "itemType": "B3PhFzla"}, "quantity": 10, "type": "ITEM"}, {"currency": {"currencyCode": "xZ47ciIg", "namespace": "OL0tWzNZ"}, "item": {"itemId": "9ySDS8nG", "itemSku": "9zyOhenm", "itemType": "fn59IUfX"}, "quantity": 24, "type": "CURRENCY"}, {"currency": {"currencyCode": "q8TNBPml", "namespace": "mjOuVyGG"}, "item": {"itemId": "K1y7LFZN", "itemSku": "T4IgJ3wH", "itemType": "zzae04AX"}, "quantity": 37, "type": "ITEM"}]}, {"id": "MkKHosIf", "rewards": [{"currency": {"currencyCode": "RODSoCLm", "namespace": "OXMQh1Cw"}, "item": {"itemId": "is7IE8vt", "itemSku": "Yg2KklRe", "itemType": "aIRkDydk"}, "quantity": 12, "type": "ITEM"}, {"currency": {"currencyCode": "S3AbgsWE", "namespace": "eJAz5yRP"}, "item": {"itemId": "SFmfZTKT", "itemSku": "SGnHh2F5", "itemType": "1VKAdbjj"}, "quantity": 17, "type": "ITEM"}, {"currency": {"currencyCode": "kw3UfTsU", "namespace": "w4JV0OvT"}, "item": {"itemId": "gotPLOd1", "itemSku": "VtZnrxRb", "itemType": "HkFq4NgO"}, "quantity": 6, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateDLCItemConfig' test.out

#- 38 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteDLCItemConfig' test.out

#- 39 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'GetPlatformDLCConfig' test.out

#- 40 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"Dmish2QQ": "KBObBXc3", "FiPgMPtc": "0FsZi7TP", "NyfXfUSS": "X1Vy6XS7"}}, {"platform": "PSN", "platformDlcIdMap": {"BkOLZEMd": "lR3IhRa0", "4CfDCNxn": "luGCP71S", "uTeFUj4S": "pgu25nE4"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"mMW3ON10": "0Kuh9CZm", "HzXcCsKZ": "esaYg4iJ", "YLOclJ6Z": "UeSP8F5O"}}]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdatePlatformDLCConfig' test.out

#- 41 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'DeletePlatformDLCConfig' test.out

#- 42 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'RuyTMI5n' \
    --itemId 'PSsLox19,Ykqmq6bu,2dXrmEIH' \
    --limit '59' \
    --offset '62' \
    --userId 'yBBSLoBC' \
    > test.out 2>&1
eval_tap $? 42 'QueryEntitlements' test.out

#- 43 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'HVQeht73' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetEntitlement' test.out

#- 44 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '33' \
    --status 'SUCCESS' \
    --userId 'BvHNG7Yj' \
    > test.out 2>&1
eval_tap $? 44 'QueryFulfillmentHistories' test.out

#- 45 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetAppleIAPConfig' test.out

#- 46 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "JEz4LJMK", "password": "hWZAzykN"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateAppleIAPConfig' test.out

#- 47 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAppleIAPConfig' test.out

#- 48 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetEpicGamesIAPConfig' test.out

#- 49 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "4q1nONif"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateEpicGamesIAPConfig' test.out

#- 50 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteEpicGamesIAPConfig' test.out

#- 51 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetGoogleIAPConfig' test.out

#- 52 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "oWEkZ9Vg", "serviceAccountId": "XZEgtXzP"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGoogleIAPConfig' test.out

#- 53 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'DeleteGoogleIAPConfig' test.out

#- 54 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGoogleP12File' test.out

#- 55 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetIAPItemConfig' test.out

#- 56 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "y9SRTh7a", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"ownUoqKz": "jmmigHwn", "oMg1cI0G": "gGs1kcYa", "gtj2gu46": "ZMHxhklB"}}, {"itemIdentity": "xsYVU3YS", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"jOFY3YV3": "RGtZ9HSP", "JFN8hBaI": "binnFxpI", "tRY0beJF": "sPBSknV8"}}, {"itemIdentity": "Qz95rAeP", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"Jj5vad9E": "s3UCCRpH", "44bP4lel": "3Ue4CXZs", "ItmhULMF": "5Ngz8Oz3"}}]}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateIAPItemConfig' test.out

#- 57 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeleteIAPItemConfig' test.out

#- 58 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetPlayStationIAPConfig' test.out

#- 59 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "PlXq71F3"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePlaystationIAPConfig' test.out

#- 60 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeletePlaystationIAPConfig' test.out

#- 61 GetStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetStadiaIAPConfig' test.out

#- 62 DeleteStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteStadiaIAPConfig' test.out

#- 63 UpdateStadiaJsonConfigFile
./ng net.accelbyte.sdk.cli.Main platform updateStadiaJsonConfigFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 63 'UpdateStadiaJsonConfigFile' test.out

#- 64 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetSteamIAPConfig' test.out

#- 65 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "rbN4m9zd", "publisherAuthenticationKey": "4X1Y75pi"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateSteamIAPConfig' test.out

#- 66 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteSteamIAPConfig' test.out

#- 67 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetTwitchIAPConfig' test.out

#- 68 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "0V230OsL", "clientSecret": "MSh1IKxp", "organizationId": "iXuSBtuV"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateTwitchIAPConfig' test.out

#- 69 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteTwitchIAPConfig' test.out

#- 70 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetXblIAPConfig' test.out

#- 71 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "Guvv6fKO"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateXblIAPConfig' test.out

#- 72 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeleteXblAPConfig' test.out

#- 73 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'pVmBHTrK' \
    > test.out 2>&1
eval_tap $? 73 'UpdateXblBPCertFile' test.out

#- 74 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CYDg139H' \
    --body '{"categoryPath": "z83sQIuk", "targetItemId": "EbL1dj1F", "targetNamespace": "Bvx0ZnOe"}' \
    > test.out 2>&1
eval_tap $? 74 'SyncInGameItem' test.out

#- 75 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '5L5ExQWb' \
    --body '{"appId": "8WHJpQKR", "appType": "DEMO", "baseAppId": "RpoRCYk8", "boothName": "O4XwujIR", "categoryPath": "QCZoxRzH", "clazz": "vL3MRnSP", "displayOrder": 91, "entitlementType": "CONSUMABLE", "ext": {"xHW59MLf": {}, "WlSWAZSI": {}, "6WLovtPZ": {}}, "features": ["J551phas", "dZ4aywxO", "sMiNjcOp"], "images": [{"as": "Jiz63NwI", "caption": "1r2Pkl3Q", "height": 83, "imageUrl": "bLYbntQc", "smallImageUrl": "169A2VJX", "width": 18}, {"as": "lAsn69xF", "caption": "OEXAXpVk", "height": 2, "imageUrl": "cGlAULHa", "smallImageUrl": "hHor062O", "width": 93}, {"as": "Tc8U6UV5", "caption": "RRg6fCSX", "height": 41, "imageUrl": "cKr69QBq", "smallImageUrl": "NdLgChW2", "width": 48}], "itemIds": ["LcYbmn4d", "s9LJlPPj", "E815HyD9"], "itemQty": {"RgKzhXc2": 70, "N07NOKbs": 9, "02TbNmyU": 19}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"hm5kWrt3": {"description": "kJO41FAN", "localExt": {"OXU0WT3o": {}, "NtMoUisy": {}, "wf87r1h9": {}}, "longDescription": "fdN1QSBy", "title": "yTMuY416"}, "dGTOWi1p": {"description": "soV5OA4p", "localExt": {"dwM1lUE0": {}, "zG4NlnFl": {}, "PW9ivWhR": {}}, "longDescription": "ql6n7gVn", "title": "eVt9p5hz"}, "yq3v2qdr": {"description": "L5YNt9Mq", "localExt": {"AaTi1qmk": {}, "Kj75epU0": {}, "X4e4zvBF": {}}, "longDescription": "fNQ6G6jm", "title": "Xz6dZzL2"}}, "maxCount": 9, "maxCountPerUser": 75, "name": "hatiegub", "optionBoxConfig": {"boxItems": [{"count": 57, "itemId": "GoG0I9UF", "itemSku": "xQPQLYOH"}, {"count": 12, "itemId": "urRgqivj", "itemSku": "6unh9tl4"}, {"count": 24, "itemId": "NZfpVMkO", "itemSku": "NYE1cVng"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 68, "fixedTrialCycles": 40, "graceDays": 27}, "regionData": {"wvnFfdHG": [{"currencyCode": "pMU1TTHr", "currencyNamespace": "dxofiDAA", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1994-12-16T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1986-07-16T00:00:00Z", "discountedPrice": 65, "expireAt": "1991-02-25T00:00:00Z", "price": 17, "purchaseAt": "1995-07-30T00:00:00Z", "trialPrice": 51}, {"currencyCode": "RYh7aqfm", "currencyNamespace": "C86Kf8U4", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1974-05-16T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1989-04-23T00:00:00Z", "discountedPrice": 41, "expireAt": "1972-04-25T00:00:00Z", "price": 64, "purchaseAt": "1983-11-10T00:00:00Z", "trialPrice": 36}, {"currencyCode": "JgH8lFt1", "currencyNamespace": "pHi7t2PY", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1985-08-31T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1980-08-27T00:00:00Z", "discountedPrice": 92, "expireAt": "1978-05-10T00:00:00Z", "price": 56, "purchaseAt": "1997-10-03T00:00:00Z", "trialPrice": 9}], "3UvjUsSI": [{"currencyCode": "cowFdWAm", "currencyNamespace": "6bs8mwFL", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1983-08-14T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1990-06-16T00:00:00Z", "discountedPrice": 19, "expireAt": "1975-06-02T00:00:00Z", "price": 54, "purchaseAt": "1996-06-09T00:00:00Z", "trialPrice": 9}, {"currencyCode": "ggzXRec2", "currencyNamespace": "LBHhmom0", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1989-10-21T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1993-06-04T00:00:00Z", "discountedPrice": 72, "expireAt": "1980-04-25T00:00:00Z", "price": 13, "purchaseAt": "1996-02-21T00:00:00Z", "trialPrice": 73}, {"currencyCode": "zK1tXJA8", "currencyNamespace": "xZCnLK5W", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1996-01-19T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1999-04-23T00:00:00Z", "discountedPrice": 44, "expireAt": "1986-03-06T00:00:00Z", "price": 43, "purchaseAt": "1981-10-04T00:00:00Z", "trialPrice": 4}], "kFldH8UF": [{"currencyCode": "ioMqVD9x", "currencyNamespace": "pVdx95Mb", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1982-10-04T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1979-07-08T00:00:00Z", "discountedPrice": 62, "expireAt": "1975-06-07T00:00:00Z", "price": 100, "purchaseAt": "1980-09-07T00:00:00Z", "trialPrice": 49}, {"currencyCode": "vtp6GU11", "currencyNamespace": "t3lzQiof", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1984-01-16T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1974-05-28T00:00:00Z", "discountedPrice": 27, "expireAt": "1980-03-04T00:00:00Z", "price": 64, "purchaseAt": "1980-12-29T00:00:00Z", "trialPrice": 91}, {"currencyCode": "RBmtkrFs", "currencyNamespace": "JHMEXf2c", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1982-10-31T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1983-02-28T00:00:00Z", "discountedPrice": 34, "expireAt": "1981-11-16T00:00:00Z", "price": 17, "purchaseAt": "1985-04-04T00:00:00Z", "trialPrice": 23}]}, "seasonType": "TIER", "sku": "G3B9HEYd", "stackable": false, "status": "ACTIVE", "tags": ["2T0i1tcw", "srHO0EsI", "cgJYaUOX"], "targetCurrencyCode": "WBY8Ps7C", "targetNamespace": "w9Vgyt1a", "thumbnailUrl": "flrLjU4y", "useCount": 36}' \
    > test.out 2>&1
eval_tap $? 75 'CreateItem' test.out

#- 76 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '8GNsXsHl' \
    --appId 'dApjmjVw' \
    > test.out 2>&1
eval_tap $? 76 'GetItemByAppId' test.out

#- 77 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'czQCWVi6' \
    --baseAppId 'CJdbWcgo' \
    --categoryPath 'EXWUDUoi' \
    --features 'wAquJkhs' \
    --itemType 'INGAMEITEM' \
    --limit '90' \
    --offset '26' \
    --region 'Uj6EndG9' \
    --sortBy 'name:desc,name:asc,name' \
    --storeId 'YAf13uCO' \
    --tags 'DxagLpUm' \
    --targetNamespace 'NeU8sI4B' \
    > test.out 2>&1
eval_tap $? 77 'QueryItems' test.out

#- 78 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'LzVg2fJH,xiepUz1S,vQFcFSep' \
    > test.out 2>&1
eval_tap $? 78 'ListBasicItemsByFeatures' test.out

#- 79 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'AO7Exx3p' \
    --sku 'svboohAv' \
    > test.out 2>&1
eval_tap $? 79 'GetItemBySku' test.out

#- 80 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '4b4Hp7wb' \
    --populateBundle  \
    --region 'fdSiETMP' \
    --storeId 't614lITz' \
    --sku 'w5i4B8qo' \
    > test.out 2>&1
eval_tap $? 80 'GetLocaleItemBySku' test.out

#- 81 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'EY7JunXU' \
    --sku '8Nc5tkSO' \
    > test.out 2>&1
eval_tap $? 81 'GetItemIdBySku' test.out

#- 82 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '4e3VFY1O,HYp9igNS,Q5ILhuAD' \
    --storeId 'FMFq16PR' \
    > test.out 2>&1
eval_tap $? 82 'GetBulkItemIdBySkus' test.out

#- 83 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '0615sAOR' \
    --region 'fEykOxmI' \
    --storeId 'auAS08zN' \
    --itemIds '8V78IsNA' \
    > test.out 2>&1
eval_tap $? 83 'BulkGetLocaleItems' test.out

#- 84 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetAvailablePredicateTypes' test.out

#- 85 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'KaSwcoVG' \
    --body '{"itemIds": ["KMHG2OB1", "n9MwDr9M", "pgzLCjip"]}' \
    > test.out 2>&1
eval_tap $? 85 'ValidateItemPurchaseCondition' test.out

#- 86 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'BUNDLE' \
    --limit '92' \
    --offset '66' \
    --storeId 'AueUd02v' \
    --keyword 'vFnmErsf' \
    --language '8uH06fTS' \
    > test.out 2>&1
eval_tap $? 86 'SearchItems' test.out

#- 87 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '76' \
    --offset '18' \
    --sortBy 'updatedAt:asc,name:asc,createdAt:desc' \
    --storeId 'WZibf2N9' \
    > test.out 2>&1
eval_tap $? 87 'QueryUncategorizedItems' test.out

#- 88 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'ujKYQoX6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'I8UIuGRf' \
    > test.out 2>&1
eval_tap $? 88 'GetItem' test.out

#- 89 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'qlwRlsql' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gnBczuHA' \
    --body '{"appId": "C5DtSw0F", "appType": "DEMO", "baseAppId": "ScpEr4iz", "boothName": "GfNmpOZ8", "categoryPath": "sDISKp2x", "clazz": "j0ZYZDGV", "displayOrder": 6, "entitlementType": "DURABLE", "ext": {"YDhqytDr": {}, "KPRjQcik": {}, "UekkMVkm": {}}, "features": ["SIYvBQzj", "8LDOP2eH", "wQPK71Tm"], "images": [{"as": "aWbCcEGX", "caption": "CovpMBDq", "height": 89, "imageUrl": "NK7oQvGn", "smallImageUrl": "JHKrKN7R", "width": 78}, {"as": "i7rZnAbu", "caption": "3QwXziML", "height": 0, "imageUrl": "kesp8fuZ", "smallImageUrl": "QpJDywVm", "width": 40}, {"as": "qWhZbouZ", "caption": "IReHN1xt", "height": 69, "imageUrl": "SxBrpPdW", "smallImageUrl": "sdl1G7k4", "width": 73}], "itemIds": ["CMFf0Cdc", "lNRIlvS0", "aFWEsrM6"], "itemQty": {"xg9GNyfN": 75, "c2zhNEZ8": 20, "Ymx5Ijpd": 8}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"qwx9JkXQ": {"description": "XsBmBvjL", "localExt": {"Rac13pQe": {}, "NsKrIwyg": {}, "sYLloLgR": {}}, "longDescription": "f8vVhIsU", "title": "RN3kWROr"}, "1veuPnrP": {"description": "nkqEhB6p", "localExt": {"naW59vxm": {}, "kWZsQE7Z": {}, "3ZUZHRJY": {}}, "longDescription": "TtGvEauX", "title": "DZRzhppD"}, "AEAb1G5l": {"description": "Nd1IPfKB", "localExt": {"MVHxfFYf": {}, "c3kUyWiw": {}, "qY4DkZRX": {}}, "longDescription": "nU7CuJTs", "title": "IAPqHAqO"}}, "maxCount": 3, "maxCountPerUser": 31, "name": "QLdOo1kk", "optionBoxConfig": {"boxItems": [{"count": 58, "itemId": "1OaPkQhe", "itemSku": "xouYTNVF"}, {"count": 4, "itemId": "6xpj2mmp", "itemSku": "hLwRKwnN"}, {"count": 78, "itemId": "siYBJ2G2", "itemSku": "OxEWk4ID"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 86, "fixedTrialCycles": 34, "graceDays": 95}, "regionData": {"sGtaMEac": [{"currencyCode": "GIA061rI", "currencyNamespace": "4outHuRo", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1979-01-09T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1994-05-08T00:00:00Z", "discountedPrice": 49, "expireAt": "1993-07-10T00:00:00Z", "price": 19, "purchaseAt": "1976-04-22T00:00:00Z", "trialPrice": 44}, {"currencyCode": "XYLvnmSc", "currencyNamespace": "buP0Aqfs", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1984-05-12T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1980-04-15T00:00:00Z", "discountedPrice": 51, "expireAt": "1983-04-14T00:00:00Z", "price": 88, "purchaseAt": "1984-11-27T00:00:00Z", "trialPrice": 74}, {"currencyCode": "gX3pGEte", "currencyNamespace": "VdlCHKk3", "currencyType": "VIRTUAL", "discountAmount": 9, "discountExpireAt": "1983-05-12T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1984-11-09T00:00:00Z", "discountedPrice": 44, "expireAt": "1980-10-28T00:00:00Z", "price": 57, "purchaseAt": "1995-04-05T00:00:00Z", "trialPrice": 14}], "Okf6Rf63": [{"currencyCode": "5uA59PxM", "currencyNamespace": "HVCkNbUo", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1973-03-27T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1980-02-23T00:00:00Z", "discountedPrice": 46, "expireAt": "1979-10-23T00:00:00Z", "price": 33, "purchaseAt": "1998-10-03T00:00:00Z", "trialPrice": 65}, {"currencyCode": "SHMTnBH3", "currencyNamespace": "h8PLWUZl", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1982-12-06T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1978-02-25T00:00:00Z", "discountedPrice": 60, "expireAt": "1986-01-26T00:00:00Z", "price": 98, "purchaseAt": "1995-03-11T00:00:00Z", "trialPrice": 10}, {"currencyCode": "83N96gb1", "currencyNamespace": "eO1VnETe", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1978-06-20T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1971-05-07T00:00:00Z", "discountedPrice": 19, "expireAt": "1990-02-11T00:00:00Z", "price": 77, "purchaseAt": "1973-10-10T00:00:00Z", "trialPrice": 24}], "3edo19OF": [{"currencyCode": "7MObdQ3O", "currencyNamespace": "xPjV6CVZ", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1998-10-19T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1990-03-21T00:00:00Z", "discountedPrice": 11, "expireAt": "1972-11-23T00:00:00Z", "price": 48, "purchaseAt": "1991-01-23T00:00:00Z", "trialPrice": 21}, {"currencyCode": "F2U2qjAV", "currencyNamespace": "AxflCDQj", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1981-02-05T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1982-05-23T00:00:00Z", "discountedPrice": 42, "expireAt": "1987-04-08T00:00:00Z", "price": 81, "purchaseAt": "1976-09-20T00:00:00Z", "trialPrice": 53}, {"currencyCode": "a3zlH1Wx", "currencyNamespace": "vc17sAS4", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1994-08-16T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1972-09-04T00:00:00Z", "discountedPrice": 56, "expireAt": "1982-01-13T00:00:00Z", "price": 64, "purchaseAt": "1971-08-15T00:00:00Z", "trialPrice": 96}]}, "seasonType": "PASS", "sku": "ID8QiUMb", "stackable": false, "status": "ACTIVE", "tags": ["vOEzJgRg", "LCXvOecn", "qdcVhGd1"], "targetCurrencyCode": "K27wvfUP", "targetNamespace": "23k50DLu", "thumbnailUrl": "SsNjtA6P", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateItem' test.out

#- 90 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'B25TQXTy' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'ib7FU57Y' \
    > test.out 2>&1
eval_tap $? 90 'DeleteItem' test.out

#- 91 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '3ZvBeYl0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 14, "orderNo": "B72Ci3lr"}' \
    > test.out 2>&1
eval_tap $? 91 'AcquireItem' test.out

#- 92 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'GPKrdNJj' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'pMx8t4xn' \
    > test.out 2>&1
eval_tap $? 92 'GetApp' test.out

#- 93 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'Gm5gfNXN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IxqV0tRn' \
    --body '{"carousel": [{"alt": "xWr8GR9v", "previewUrl": "C2fZJNi4", "thumbnailUrl": "G8OD8vje", "type": "video", "url": "ByWbHJoB", "videoSource": "youtube"}, {"alt": "XipOYu3X", "previewUrl": "6fTqpnyk", "thumbnailUrl": "U2pKKO0G", "type": "image", "url": "zuIPcUOI", "videoSource": "generic"}, {"alt": "xh5m79yd", "previewUrl": "c7P0Ux17", "thumbnailUrl": "dCdorG3n", "type": "video", "url": "Eu2WREul", "videoSource": "vimeo"}], "developer": "P48TG5BW", "forumUrl": "GtyUZlJj", "genres": ["Indie", "Strategy", "Strategy"], "localizations": {"vKY58Pib": {"announcement": "PoocGA8c", "slogan": "ZqPOJEh5"}, "CMfKtLQy": {"announcement": "N6MQSeKa", "slogan": "7mFoWl5Z"}, "O1ArPp4S": {"announcement": "K3Y2LT74", "slogan": "BVjy8g9g"}}, "platformRequirements": {"dubsGS0Z": [{"additionals": "TQ82A1Gz", "directXVersion": "LWLT1zIR", "diskSpace": "TVuWR7ne", "graphics": "i8YbHSN8", "label": "e1KsBcaW", "osVersion": "UPOZmVdi", "processor": "Jl81K9Zv", "ram": "8k70OxjL", "soundCard": "cuGO1j5j"}, {"additionals": "d9b3DCLp", "directXVersion": "zg554Ihe", "diskSpace": "2bwnHNXs", "graphics": "kZvyW3Ct", "label": "5oFxsAgA", "osVersion": "r0rmnjFm", "processor": "QyGMD2BN", "ram": "KElFtbyY", "soundCard": "3wx1g0yw"}, {"additionals": "lrQQvjgV", "directXVersion": "BPhxVuxR", "diskSpace": "mH9piMCQ", "graphics": "egfmKINU", "label": "lv3B9KHK", "osVersion": "JsBT0vPm", "processor": "4wPJOi4x", "ram": "aNwdMuAA", "soundCard": "k3wISwK0"}], "pA9qDCD1": [{"additionals": "oJwU5QIk", "directXVersion": "c1YxcVFJ", "diskSpace": "hye9VAlK", "graphics": "M4pxbqWG", "label": "XJLGyfDs", "osVersion": "1Oy1VsvD", "processor": "Y5K4ZCXI", "ram": "RkLNd4b5", "soundCard": "xH2J059z"}, {"additionals": "B4PMRrEr", "directXVersion": "dnj5zAdk", "diskSpace": "5eLXEvlz", "graphics": "eJ0d9hCB", "label": "q4alpokE", "osVersion": "i2VbJf0o", "processor": "0srB99tl", "ram": "IeV7VYMO", "soundCard": "z6t2Ad9t"}, {"additionals": "iuq5g3Zw", "directXVersion": "60eEObor", "diskSpace": "R32ijcwa", "graphics": "7LYa1od3", "label": "65fovMMa", "osVersion": "4ARZauxy", "processor": "ohVITVmX", "ram": "GPiff6NB", "soundCard": "WdDsvc1I"}], "lEwKlUTS": [{"additionals": "hTsIDvzw", "directXVersion": "9MFe8V7I", "diskSpace": "239MclF5", "graphics": "iw3TKwGG", "label": "MUOpBrvi", "osVersion": "QAqXchxC", "processor": "KF5mLBi2", "ram": "kYlbDfIT", "soundCard": "QTdr6pR3"}, {"additionals": "7E9AwHO3", "directXVersion": "iY8Rpilo", "diskSpace": "VGSdAbQj", "graphics": "NtA3LOMT", "label": "jNva4R3p", "osVersion": "GXvR30mX", "processor": "YxLEjcBi", "ram": "Pzl1ejIO", "soundCard": "xTkyJxYO"}, {"additionals": "6pPh7jG3", "directXVersion": "mA8AeYWt", "diskSpace": "7KUi9RFq", "graphics": "IY5vjSW3", "label": "8B4nVIhi", "osVersion": "JQHH8FIn", "processor": "Dmq961zz", "ram": "bUluKaSU", "soundCard": "S90UMy5x"}]}, "platforms": ["Linux", "Windows", "MacOS"], "players": ["Multi", "MMO", "Multi"], "primaryGenre": "Simulation", "publisher": "0mMnN3Fq", "releaseDate": "1981-10-19T00:00:00Z", "websiteUrl": "ujPeruwz"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateApp' test.out

#- 94 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '93dpXwYL' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1qWfg1z5' \
    > test.out 2>&1
eval_tap $? 94 'DisableItem' test.out

#- 95 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'Jdh2z21X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetItemDynamicData' test.out

#- 96 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '79fuvlE3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eJUxS1wZ' \
    > test.out 2>&1
eval_tap $? 96 'EnableItem' test.out

#- 97 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'cEtRqkmb' \
    --itemId 'f6ndSfkd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mxDx4wsr' \
    > test.out 2>&1
eval_tap $? 97 'FeatureItem' test.out

#- 98 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'ORDyMKC5' \
    --itemId 'WQHb36fE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c6aeCNA4' \
    > test.out 2>&1
eval_tap $? 98 'DefeatureItem' test.out

#- 99 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'IAz8DAJE' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'kyZsSFkw' \
    --populateBundle  \
    --region 'VvtRYrIF' \
    --storeId 'lzbnOkgw' \
    > test.out 2>&1
eval_tap $? 99 'GetLocaleItem' test.out

#- 100 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'l0xBNBTz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UvDUc39C' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 88, "comparison": "isLessThan", "name": "gCn0uwdc", "predicateType": "EntitlementPredicate", "value": "GJmWwVUt", "values": ["VObh4D5x", "H2TIH8AL", "xEbKKUhH"]}, {"anyOf": 74, "comparison": "isNot", "name": "xLxcijSu", "predicateType": "SeasonTierPredicate", "value": "yzHE5Xfw", "values": ["P4JKsNMT", "8EyklP3e", "NqPyJCQ7"]}, {"anyOf": 77, "comparison": "isNot", "name": "XsNArJmZ", "predicateType": "EntitlementPredicate", "value": "v4JanwiU", "values": ["Fx0hrXfJ", "K3I5P5AL", "bCzag9Fx"]}]}, {"operator": "and", "predicates": [{"anyOf": 72, "comparison": "isGreaterThan", "name": "C7YaXhrn", "predicateType": "SeasonTierPredicate", "value": "BoZDoHbz", "values": ["CvBPVo3l", "AMuLkwPf", "mLqd5uCU"]}, {"anyOf": 7, "comparison": "excludes", "name": "SZuWQz3A", "predicateType": "SeasonTierPredicate", "value": "0GOqWwvx", "values": ["D216Zl3A", "DB23owzp", "OGraHdvU"]}, {"anyOf": 72, "comparison": "isNot", "name": "w6BJEcsq", "predicateType": "EntitlementPredicate", "value": "unDsi16V", "values": ["Nbzk9900", "FVoy1RSD", "iZed7iqg"]}]}, {"operator": "and", "predicates": [{"anyOf": 20, "comparison": "isNot", "name": "badMr9sv", "predicateType": "SeasonTierPredicate", "value": "Cc2diF1O", "values": ["V6KaKw0y", "EVYskrsB", "SaUH5MSA"]}, {"anyOf": 78, "comparison": "excludes", "name": "XPRrQCFu", "predicateType": "EntitlementPredicate", "value": "luxuMbaX", "values": ["4GkcyFDA", "YEf086fK", "Ppsa1PLH"]}, {"anyOf": 65, "comparison": "isGreaterThanOrEqual", "name": "JnQb02jc", "predicateType": "SeasonTierPredicate", "value": "TwHduzOF", "values": ["CNw5fXgY", "OL2eWDVH", "gceX3DI4"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItemPurchaseCondition' test.out

#- 101 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '3pq0Ovw7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "J1HMvXxf"}' \
    > test.out 2>&1
eval_tap $? 101 'ReturnItem' test.out

#- 102 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --name 'vgLo9mtq' \
    --offset '7' \
    --tag 'nta6LodS' \
    > test.out 2>&1
eval_tap $? 102 'QueryKeyGroups' test.out

#- 103 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "I4exjEhy", "name": "abdUVBEB", "status": "INACTIVE", "tags": ["Tg0h4l4m", "7EvnGTw4", "TJDNtbXZ"]}' \
    > test.out 2>&1
eval_tap $? 103 'CreateKeyGroup' test.out

#- 104 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'jptvmYzt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetKeyGroup' test.out

#- 105 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'cP6ohqYb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "TUyBo27G", "name": "OA26y5uh", "status": "ACTIVE", "tags": ["nDcWVo5J", "lHMZG2fK", "C5nC6Hea"]}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateKeyGroup' test.out

#- 106 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'Avhrc0dC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetKeyGroupDynamic' test.out

#- 107 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'pKy5Zm5N' \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '3' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 107 'ListKeys' test.out

#- 108 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'kpLiGPkU' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 108 'UploadKeys' test.out

#- 109 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'hYjd70iT' \
    --limit '20' \
    --offset '93' \
    --orderNos 'dDhL59CS,e4SYSZMn,IMIaasTY' \
    --sortBy 'cQXFUMKM' \
    --startTime 'BrF5C6gk' \
    --status 'DELETED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 109 'QueryOrders' test.out

#- 110 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetOrderStatistics' test.out

#- 111 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CTvYjB7K' \
    > test.out 2>&1
eval_tap $? 111 'GetOrder' test.out

#- 112 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5V3JkCNN' \
    --body '{"description": "xPqDYQMs"}' \
    > test.out 2>&1
eval_tap $? 112 'RefundOrder' test.out

#- 113 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetPaymentCallbackConfig' test.out

#- 114 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "HBOdAcIw", "privateKey": "oXNjW0lu"}' \
    > test.out 2>&1
eval_tap $? 114 'UpdatePaymentCallbackConfig' test.out

#- 115 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'XzZfXizU' \
    --externalId 'MuEJBCPB' \
    --limit '61' \
    --notificationSource 'WXPAY' \
    --notificationType 'nFPXMC6T' \
    --offset '42' \
    --paymentOrderNo 'MG3MmU8G' \
    --startDate 'KTmHc1zQ' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 115 'QueryPaymentNotifications' test.out

#- 116 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'UGv4zZKu' \
    --limit '28' \
    --offset '66' \
    --status 'REQUEST_FOR_INFORMATION' \
    > test.out 2>&1
eval_tap $? 116 'QueryPaymentOrders' test.out

#- 117 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "xNEEf4BK", "currencyNamespace": "ju0Esmq4", "customParameters": {"8iGt0aMP": {}, "dD3XoPUW": {}, "ClQ1YWMc": {}}, "description": "gR4oWG1Z", "extOrderNo": "M20BPfHj", "extUserId": "2lfXyAvp", "itemType": "MEDIA", "language": "zN-up", "metadata": {"uR9XxZwp": "4JVs450p", "5sCFdd6n": "H9j3Cv1J", "sqB1W0Yn": "ObhjZ32U"}, "notifyUrl": "D9xOWpFN", "omitNotification": false, "platform": "6PVal37H", "price": 12, "recurringPaymentOrderNo": "3sz9WUDr", "region": "jJg34lPJ", "returnUrl": "e2FTUOMQ", "sandbox": true, "sku": "UmWT3UD9", "subscriptionId": "2E76813n", "targetNamespace": "IKSraDxL", "targetUserId": "MTEHT8zo", "title": "1Dg3uhaA"}' \
    > test.out 2>&1
eval_tap $? 117 'CreatePaymentOrderByDedicated' test.out

#- 118 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'NLZqJoD6' \
    > test.out 2>&1
eval_tap $? 118 'ListExtOrderNoByExtTxId' test.out

#- 119 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'L7JahGMB' \
    > test.out 2>&1
eval_tap $? 119 'GetPaymentOrder' test.out

#- 120 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SVIxHzvj' \
    --body '{"extTxId": "tF1SGLZJ", "paymentMethod": "I39iOJTK", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 120 'ChargePaymentOrder' test.out

#- 121 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gULfsfeK' \
    --body '{"description": "ZsEvE4CQ"}' \
    > test.out 2>&1
eval_tap $? 121 'RefundPaymentOrderByDedicated' test.out

#- 122 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gvltWH7z' \
    --body '{"amount": 61, "currencyCode": "XOEJKM7q", "notifyType": "CHARGE", "paymentProvider": "STRIPE", "salesTax": 58, "vat": 29}' \
    > test.out 2>&1
eval_tap $? 122 'SimulatePaymentOrderNotification' test.out

#- 123 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3Ef9idMP' \
    > test.out 2>&1
eval_tap $? 123 'GetPaymentOrderChargeStatus' test.out

#- 124 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 124 'GetPlatformWalletConfig' test.out

#- 125 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Other", "GooglePlay", "Stadia"]}' \
    > test.out 2>&1
eval_tap $? 125 'UpdatePlatformWalletConfig' test.out

#- 126 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 126 'ResetPlatformWalletConfig' test.out

#- 127 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "oH51Bdvl", "eventTopic": "5tHtmvnI", "maxAwarded": 42, "maxAwardedPerUser": 56, "namespaceExpression": "TaTA4zdk", "rewardCode": "QPWQcrAi", "rewardConditions": [{"condition": "FQcy1GOk", "conditionName": "j6bE3VMW", "eventName": "qOWm0ebb", "rewardItems": [{"duration": 26, "itemId": "HXTSOL2G", "quantity": 26}, {"duration": 60, "itemId": "JARIa5Lq", "quantity": 87}, {"duration": 33, "itemId": "K2oPY6YK", "quantity": 62}]}, {"condition": "Gif5xDSJ", "conditionName": "yL6whT23", "eventName": "F4ZND9Wj", "rewardItems": [{"duration": 93, "itemId": "y8TGKVyu", "quantity": 21}, {"duration": 48, "itemId": "e9sUBET8", "quantity": 29}, {"duration": 80, "itemId": "SRL8MHtM", "quantity": 51}]}, {"condition": "kX7JXu5n", "conditionName": "KcLnp9t1", "eventName": "mBCPcz7i", "rewardItems": [{"duration": 7, "itemId": "QJjFm7X5", "quantity": 42}, {"duration": 26, "itemId": "oK6Vq5Cc", "quantity": 68}, {"duration": 46, "itemId": "sglL6ZXX", "quantity": 66}]}], "userIdExpression": "rh5HIX7r"}' \
    > test.out 2>&1
eval_tap $? 127 'CreateReward' test.out

#- 128 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'h30mvba2' \
    --limit '45' \
    --offset '89' \
    --sortBy 'namespace,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 128 'QueryRewards' test.out

#- 129 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'ExportRewards' test.out

#- 130 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 130 'ImportRewards' test.out

#- 131 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'LUjM5g3N' \
    > test.out 2>&1
eval_tap $? 131 'GetReward' test.out

#- 132 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'LcFGJyxN' \
    --body '{"description": "5hIgNEQl", "eventTopic": "Hvcm3784", "maxAwarded": 28, "maxAwardedPerUser": 66, "namespaceExpression": "VG6MXZkD", "rewardCode": "dSDAIdks", "rewardConditions": [{"condition": "z5Y8slfL", "conditionName": "UwQ3XyJ9", "eventName": "h3hn5ilQ", "rewardItems": [{"duration": 98, "itemId": "djYRhFlZ", "quantity": 94}, {"duration": 22, "itemId": "SWsUptED", "quantity": 62}, {"duration": 39, "itemId": "BPav8NRM", "quantity": 93}]}, {"condition": "zDBmKUIJ", "conditionName": "8ChStTqQ", "eventName": "ldEItdup", "rewardItems": [{"duration": 2, "itemId": "3KqVBRqC", "quantity": 31}, {"duration": 84, "itemId": "vGU7gkGt", "quantity": 77}, {"duration": 64, "itemId": "fvRYJ42x", "quantity": 1}]}, {"condition": "zNTsTZqX", "conditionName": "PSdcbI8F", "eventName": "wYQGQenb", "rewardItems": [{"duration": 33, "itemId": "7odeUmpK", "quantity": 70}, {"duration": 5, "itemId": "mH1WvApV", "quantity": 86}, {"duration": 6, "itemId": "PIrXl25Z", "quantity": 57}]}], "userIdExpression": "YK7Q3b6e"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateReward' test.out

#- 133 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'aGz5ZY18' \
    > test.out 2>&1
eval_tap $? 133 'DeleteReward' test.out

#- 134 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'pR5e9l8O' \
    --body '{"payload": {"YLSSspJ2": {}, "N47UprhQ": {}, "T7nGAL6F": {}}}' \
    > test.out 2>&1
eval_tap $? 134 'CheckEventCondition' test.out

#- 135 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'YmV62wvM' \
    --body '{"conditionName": "b9DaUmc7", "userId": "2dYFfLE9"}' \
    > test.out 2>&1
eval_tap $? 135 'DeleteRewardConditionRecord' test.out

#- 136 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'ListStores' test.out

#- 137 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "1QtSRGBf", "defaultRegion": "934y1hDz", "description": "ggKVd3oQ", "supportedLanguages": ["iNCOj3VH", "1WPVqbzz", "m40Q3YUJ"], "supportedRegions": ["csuESEqO", "oxtNrqer", "Og8kQ1SH"], "title": "2diK8NvK"}' \
    > test.out 2>&1
eval_tap $? 137 'CreateStore' test.out

#- 138 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nOGxbe8D' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 138 'ImportStore' test.out

#- 139 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'GetPublishedStore' test.out

#- 140 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'DeletePublishedStore' test.out

#- 141 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'GetPublishedStoreBackup' test.out

#- 142 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'RollbackPublishedStore' test.out

#- 143 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zP4JOoR6' \
    > test.out 2>&1
eval_tap $? 143 'GetStore' test.out

#- 144 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '9Se8hpMI' \
    --body '{"defaultLanguage": "hXGQdIgj", "defaultRegion": "CKo9Uss8", "description": "dz0R8lMJ", "supportedLanguages": ["QOeqNByH", "51i7PloF", "KiU19iYM"], "supportedRegions": ["K3DB3jEi", "ujxqDOSu", "8lRbm6jc"], "title": "674W0ef4"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateStore' test.out

#- 145 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TEx7vBpR' \
    > test.out 2>&1
eval_tap $? 145 'DeleteStore' test.out

#- 146 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PKQ0hGqM' \
    --action 'UPDATE' \
    --itemSku '8snKmEuj' \
    --itemType 'CODE' \
    --limit '11' \
    --offset '20' \
    --selected  \
    --sortBy 'updatedAt,createdAt:asc,createdAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd '44eOqBV4' \
    --updatedAtStart 'YqFezWZo' \
    > test.out 2>&1
eval_tap $? 146 'QueryChanges' test.out

#- 147 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MjADf8B9' \
    > test.out 2>&1
eval_tap $? 147 'PublishAll' test.out

#- 148 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kfbsdpTc' \
    > test.out 2>&1
eval_tap $? 148 'PublishSelected' test.out

#- 149 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OuL71CXV' \
    > test.out 2>&1
eval_tap $? 149 'SelectAllRecords' test.out

#- 150 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aRJKDBdB' \
    --action 'CREATE' \
    --itemSku 'kTtl8QKR' \
    --itemType 'COINS' \
    --type 'CATEGORY' \
    --updatedAtEnd 'itwnCmNU' \
    --updatedAtStart 'FAMpnlxY' \
    > test.out 2>&1
eval_tap $? 150 'GetStatistic' test.out

#- 151 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vBpoNmmR' \
    > test.out 2>&1
eval_tap $? 151 'UnselectAllRecords' test.out

#- 152 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'ZhwyHRMa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IQ6pl9no' \
    > test.out 2>&1
eval_tap $? 152 'SelectRecord' test.out

#- 153 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'vbolmfWc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Q253dyRN' \
    > test.out 2>&1
eval_tap $? 153 'UnselectRecord' test.out

#- 154 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'owEFtykN' \
    --targetStoreId 'KZqUWKiG' \
    > test.out 2>&1
eval_tap $? 154 'CloneStore' test.out

#- 155 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gMIOhoDK' \
    > test.out 2>&1
eval_tap $? 155 'ExportStore' test.out

#- 156 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'KodIZUZt' \
    --limit '75' \
    --offset '91' \
    --sku 'U8NAO7vr' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'QQUyHe0l' \
    > test.out 2>&1
eval_tap $? 156 'QuerySubscriptions' test.out

#- 157 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xuO2EiZw' \
    > test.out 2>&1
eval_tap $? 157 'RecurringChargeSubscription' test.out

#- 158 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'y4HrZh5e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 158 'GetTicketDynamic' test.out

#- 159 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'U4BO8uqo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "j6TNreuj"}' \
    > test.out 2>&1
eval_tap $? 159 'DecreaseTicketSale' test.out

#- 160 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '8b39sihj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 160 'GetTicketBoothID' test.out

#- 161 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'VDWwLKjR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 78, "orderNo": "fet0gxt3"}' \
    > test.out 2>&1
eval_tap $? 161 'IncreaseTicketSale' test.out

#- 162 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '9HjK9Oh2' \
    --body '{"achievements": [{"id": "woM2pD9u", "value": 23}, {"id": "FbZxFPHR", "value": 86}, {"id": "8G3kuoI9", "value": 75}], "steamUserId": "wdVXftHR"}' \
    > test.out 2>&1
eval_tap $? 162 'UnlockSteamUserAchievement' test.out

#- 163 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'mif0g4TN' \
    --xboxUserId '1ugKPRCJ' \
    > test.out 2>&1
eval_tap $? 163 'GetXblUserAchievements' test.out

#- 164 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'h6u1o3SE' \
    --body '{"achievements": [{"id": "TOftRwTy", "percentComplete": 4}, {"id": "Amm2gx53", "percentComplete": 83}, {"id": "SDjw7rwV", "percentComplete": 43}], "serviceConfigId": "vSYQ9Dij", "titleId": "7ULnvl6v", "xboxUserId": "8kCKkpZK"}' \
    > test.out 2>&1
eval_tap $? 164 'UpdateXblUserAchievement' test.out

#- 165 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'vBkusKwm' \
    > test.out 2>&1
eval_tap $? 165 'AnonymizeCampaign' test.out

#- 166 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rD02ibiM' \
    > test.out 2>&1
eval_tap $? 166 'AnonymizeEntitlement' test.out

#- 167 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '4jlBDDHm' \
    > test.out 2>&1
eval_tap $? 167 'AnonymizeFulfillment' test.out

#- 168 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'k7ajwUpf' \
    > test.out 2>&1
eval_tap $? 168 'AnonymizeIntegration' test.out

#- 169 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '21fTQoFe' \
    > test.out 2>&1
eval_tap $? 169 'AnonymizeOrder' test.out

#- 170 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'm3SJ5yCK' \
    > test.out 2>&1
eval_tap $? 170 'AnonymizePayment' test.out

#- 171 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'FVFWKqCo' \
    > test.out 2>&1
eval_tap $? 171 'AnonymizeSubscription' test.out

#- 172 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'LlwInG8G' \
    > test.out 2>&1
eval_tap $? 172 'AnonymizeWallet' test.out

#- 173 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUwrKvAX' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'fVMSnyGm' \
    --features '03lh1I7r,EiRHKxZs,P3gW55wL' \
    --itemId 'bydrJLfH,vXv8m5z9,gxvnucJs' \
    --limit '94' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 173 'QueryUserEntitlements' test.out

#- 174 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'D6mXmXIZ' \
    --body '[{"endDate": "1974-11-04T00:00:00Z", "grantedCode": "Ti01XacE", "itemId": "vRsNw4Dz", "itemNamespace": "JtTRTHTv", "language": "nC_nkiv_zT", "quantity": 64, "region": "fHDXrs35", "source": "PURCHASE", "startDate": "1999-08-09T00:00:00Z", "storeId": "Rtb6SG42"}, {"endDate": "1983-04-09T00:00:00Z", "grantedCode": "zUUm5AX7", "itemId": "deabPVmp", "itemNamespace": "W4EmmsAj", "language": "Nqd-gygm_535", "quantity": 26, "region": "GXDbUHiM", "source": "OTHER", "startDate": "1983-05-20T00:00:00Z", "storeId": "BOp4xHdR"}, {"endDate": "1992-05-23T00:00:00Z", "grantedCode": "nhMgi45W", "itemId": "3gv2yZ1F", "itemNamespace": "7IRzZSIM", "language": "cMZ_780", "quantity": 22, "region": "7rZMbgUu", "source": "ACHIEVEMENT", "startDate": "1978-11-05T00:00:00Z", "storeId": "8pHQBA0f"}]' \
    > test.out 2>&1
eval_tap $? 174 'GrantUserEntitlement' test.out

#- 175 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WexEVSFx' \
    --activeOnly  \
    --appId 'Zd4GTXEe' \
    > test.out 2>&1
eval_tap $? 175 'GetUserAppEntitlementByAppId' test.out

#- 176 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'PRSijCii' \
    --activeOnly  \
    --limit '75' \
    --offset '71' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 176 'QueryUserEntitlementsByAppType' test.out

#- 177 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'OYZPBmyt' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --itemId 'NpldLlkk' \
    > test.out 2>&1
eval_tap $? 177 'GetUserEntitlementByItemId' test.out

#- 178 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'sYFYn11D' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'ObP5ehwx' \
    > test.out 2>&1
eval_tap $? 178 'GetUserEntitlementBySku' test.out

#- 179 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'pzJYyqo5' \
    --appIds 'hXBEyQ45,pnqsHi4x,r2jiyOXy' \
    --itemIds 'pNL9nzov,T2mkYlJd,5Rs2NoYJ' \
    --skus 'irUjJGM7,qD6Yaqwg,TO2SYdFT' \
    > test.out 2>&1
eval_tap $? 179 'ExistsAnyUserActiveEntitlement' test.out

#- 180 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'WJ2D3uYb' \
    --itemIds 'aY21CRiy,Ik2dNANi,c7NxubP2' \
    > test.out 2>&1
eval_tap $? 180 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 181 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DK5B3nnc' \
    --appId 'glZXkhln' \
    > test.out 2>&1
eval_tap $? 181 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 182 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hy2tMEv8' \
    --entitlementClazz 'CODE' \
    --itemId 'CwPQnMwH' \
    > test.out 2>&1
eval_tap $? 182 'GetUserEntitlementOwnershipByItemId' test.out

#- 183 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Op4xFcOw' \
    --ids 'HCP0c0RZ,KQk5SHdz,UsAdbrPf' \
    > test.out 2>&1
eval_tap $? 183 'GetUserEntitlementOwnershipByItemIds' test.out

#- 184 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'iJkGsYgx' \
    --entitlementClazz 'MEDIA' \
    --sku 'tnprXpbn' \
    > test.out 2>&1
eval_tap $? 184 'GetUserEntitlementOwnershipBySku' test.out

#- 185 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'D3AmOPJm' \
    --entitlementIds 'WmwHgBvH' \
    > test.out 2>&1
eval_tap $? 185 'RevokeUserEntitlements' test.out

#- 186 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'heKeH8vS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fstzAhgb' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlement' test.out

#- 187 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'X8rHVVyk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TCgmjnMn' \
    --body '{"endDate": "1992-08-13T00:00:00Z", "nullFieldList": ["QPusL4YV", "9yT1HCI6", "mC4MLE7u"], "startDate": "1975-03-21T00:00:00Z", "status": "ACTIVE", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateUserEntitlement' test.out

#- 188 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'G9lcxzlZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gmfkDwvU' \
    --body '{"options": ["RqI7GOTo", "9Uv2hW7H", "ixybXSm2"], "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 188 'ConsumeUserEntitlement' test.out

#- 189 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'keij21xP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tkHNaj4W' \
    > test.out 2>&1
eval_tap $? 189 'DisableUserEntitlement' test.out

#- 190 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'YkxOq2t1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZcn7WOV' \
    > test.out 2>&1
eval_tap $? 190 'EnableUserEntitlement' test.out

#- 191 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'GhPwngy6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UaRfvciT' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementHistories' test.out

#- 192 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'TefcKDxQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xjHj5OEL' \
    > test.out 2>&1
eval_tap $? 192 'RevokeUserEntitlement' test.out

#- 193 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'PoRe1Hrv' \
    --body '{"duration": 51, "endDate": "1973-06-05T00:00:00Z", "itemId": "ztjQnV2O", "itemSku": "EibrsIW6", "language": "xiAZiu5f", "order": {"currency": {"currencyCode": "HQIF0diE", "currencySymbol": "G2ou5VBd", "currencyType": "REAL", "decimals": 98, "namespace": "RHu8aBtI"}, "ext": {"DZYi6RDC": {}, "RD9H0IdQ": {}, "iNVvXxhw": {}}, "free": true}, "orderNo": "FTAeG2LP", "origin": "Epic", "quantity": 93, "region": "iEam8Iru", "source": "OTHER", "startDate": "1989-11-23T00:00:00Z", "storeId": "eurHeCkX"}' \
    > test.out 2>&1
eval_tap $? 193 'FulfillItem' test.out

#- 194 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2WKBgFJ' \
    --body '{"code": "l5kNYZHf", "language": "wkUO_Ne", "region": "ANRCFhqp"}' \
    > test.out 2>&1
eval_tap $? 194 'RedeemCode' test.out

#- 195 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '0AL3lgOC' \
    --body '{"origin": "Xbox", "rewards": [{"currency": {"currencyCode": "Ccw3Y7aR", "namespace": "PZLGRzj5"}, "item": {"itemId": "A6cfuyUf", "itemSku": "WzgrzNiG", "itemType": "BI57A3N7"}, "quantity": 87, "type": "ITEM"}, {"currency": {"currencyCode": "bEtU3rqq", "namespace": "FI0KfDs6"}, "item": {"itemId": "hj9DnIyW", "itemSku": "mvVhAFCQ", "itemType": "YkzbyzMz"}, "quantity": 81, "type": "CURRENCY"}, {"currency": {"currencyCode": "1WcHFvwS", "namespace": "sKLzEE8F"}, "item": {"itemId": "cgarxn0h", "itemSku": "yBVX7akg", "itemType": "5EHQV0Nh"}, "quantity": 10, "type": "CURRENCY"}], "source": "REWARD"}' \
    > test.out 2>&1
eval_tap $? 195 'FulfillRewards' test.out

#- 196 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '3kczwyOo' \
    --endTime '9uJ6Ev3O' \
    --limit '9' \
    --offset '76' \
    --productId 'AeI5LZoM' \
    --startTime 'HjKGNgPz' \
    --status 'FULFILLED' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 196 'QueryUserIAPOrders' test.out

#- 197 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ls8Q64SJ' \
    > test.out 2>&1
eval_tap $? 197 'QueryAllUserIAPOrders' test.out

#- 198 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wRVFkxPN' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "uv-PEgG", "productId": "8WwIopHq", "region": "YVwhhczK", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 198 'MockFulfillIAPItem' test.out

#- 199 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJWIRp8L' \
    --itemId 'whQQMfS6' \
    --limit '47' \
    --offset '33' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 199 'QueryUserOrders' test.out

#- 200 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'FHWFXoxi' \
    --body '{"currencyCode": "0S9QZTlq", "currencyNamespace": "6qVa7WES", "discountedPrice": 91, "ext": {"A70v1Jch": {}, "hqWyRE1V": {}, "UHZWbdeR": {}}, "itemId": "nPs1okWb", "language": "vRwcpa78", "options": {"skipPriceValidation": true}, "platform": "GooglePlay", "price": 73, "quantity": 18, "region": "hF7cvLEC", "returnUrl": "CdLa2XOq", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 200 'AdminCreateUserOrder' test.out

#- 201 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'b7i6qcIf' \
    --itemId 'qJiq6aAC' \
    > test.out 2>&1
eval_tap $? 201 'CountOfPurchasedItem' test.out

#- 202 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'a0w0DcCr' \
    --userId 'YLrhYwxB' \
    > test.out 2>&1
eval_tap $? 202 'GetUserOrder' test.out

#- 203 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PBRqZdg6' \
    --userId 'yVGPV5uP' \
    --body '{"status": "CHARGEBACK", "statusReason": "wVC9M2UU"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateUserOrderStatus' test.out

#- 204 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DQsNFrQe' \
    --userId 'K7R5N8A9' \
    > test.out 2>&1
eval_tap $? 204 'FulfillUserOrder' test.out

#- 205 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ikWZIZ8g' \
    --userId 'gWaYsaWl' \
    > test.out 2>&1
eval_tap $? 205 'GetUserOrderGrant' test.out

#- 206 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TeeC9cND' \
    --userId 'OjdBO6B2' \
    > test.out 2>&1
eval_tap $? 206 'GetUserOrderHistories' test.out

#- 207 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OzaBJRTN' \
    --userId 'JdgQO1cp' \
    --body '{"additionalData": {"cardSummary": "oKl6JdAh"}, "authorisedTime": "1993-08-29T00:00:00Z", "chargebackReversedTime": "1990-03-21T00:00:00Z", "chargebackTime": "1971-02-18T00:00:00Z", "chargedTime": "1988-12-05T00:00:00Z", "createdTime": "1975-08-03T00:00:00Z", "currency": {"currencyCode": "aojcBj8T", "currencySymbol": "IOM2wKHP", "currencyType": "VIRTUAL", "decimals": 28, "namespace": "9KQcfaZt"}, "customParameters": {"dpokuOOJ": {}, "FwneTu9K": {}, "FBkrhh45": {}}, "extOrderNo": "cwQIWWtq", "extTxId": "P8KCDSwF", "extUserId": "rNN2dOYg", "issuedAt": "1971-08-12T00:00:00Z", "metadata": {"UDlped5w": "620axWDI", "ZidkSr8D": "lFMMaCUO", "jbfTX7tH": "2Ef0Zzpv"}, "namespace": "YGBU9bxY", "nonceStr": "HEKSyVpU", "paymentMethod": "Ah3qxmla", "paymentMethodFee": 48, "paymentOrderNo": "0J8z1Njg", "paymentProvider": "STRIPE", "paymentProviderFee": 17, "paymentStationUrl": "0H5O6LDS", "price": 51, "refundedTime": "1974-09-19T00:00:00Z", "salesTax": 33, "sandbox": true, "sku": "zBrFAoGD", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "gJU2uSEf", "subscriptionId": "yjUsdtoM", "subtotalPrice": 15, "targetNamespace": "3KOXlSJb", "targetUserId": "W52BXxGN", "tax": 7, "totalPrice": 63, "totalTax": 81, "txEndTime": "1987-11-21T00:00:00Z", "type": "K7rk6EES", "userId": "waN1D7SW", "vat": 28}' \
    > test.out 2>&1
eval_tap $? 207 'ProcessUserOrderNotification' test.out

#- 208 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jb8vPSYN' \
    --userId 'oCvvLeyr' \
    > test.out 2>&1
eval_tap $? 208 'DownloadUserOrderReceipt' test.out

#- 209 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ChNFuap7' \
    --body '{"currencyCode": "pz88WG86", "currencyNamespace": "dlGjzYHl", "customParameters": {"DSWxDzZM": {}, "URHAYUyl": {}, "s2axKe1b": {}}, "description": "6T89eNak", "extOrderNo": "FmXr4fkJ", "extUserId": "ibiyPHIg", "itemType": "APP", "language": "UW_mrAB", "metadata": {"6UtoxqTv": "qMLmglrG", "MtRdHmWP": "TX7sCxl5", "qqpUoLsX": "lRIEkcqm"}, "notifyUrl": "LJgKLM76", "omitNotification": false, "platform": "amla5ILO", "price": 82, "recurringPaymentOrderNo": "IgbnHuz9", "region": "8LVLd0K5", "returnUrl": "ZhuwsviH", "sandbox": true, "sku": "wfHHTe33", "subscriptionId": "PyCbI89y", "title": "T4ZMp24C"}' \
    > test.out 2>&1
eval_tap $? 209 'CreateUserPaymentOrder' test.out

#- 210 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'x2CqSfE2' \
    --userId 'NYVlqtbX' \
    --body '{"description": "HU2KbMuA"}' \
    > test.out 2>&1
eval_tap $? 210 'RefundUserPaymentOrder' test.out

#- 211 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'LcMChTiO' \
    --body '{"code": "9BE2LPvy", "orderNo": "cf32L9WO"}' \
    > test.out 2>&1
eval_tap $? 211 'ApplyUserRedemption' test.out

#- 212 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '1u5LIFgv' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'cX0CiTsl' \
    --limit '31' \
    --offset '70' \
    --sku '2rfr7WE6' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 212 'QueryUserSubscriptions' test.out

#- 213 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '78ZeZsMv' \
    --excludeSystem  \
    --limit '18' \
    --offset '6' \
    --subscriptionId 'BGyfFSJe' \
    > test.out 2>&1
eval_tap $? 213 'GetUserSubscriptionActivities' test.out

#- 214 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '9BHMunnt' \
    --body '{"grantDays": 96, "itemId": "LnvPxuzn", "language": "JbHsfhS6", "reason": "cWNVGFg5", "region": "Ku5PsNJj", "source": "rQ3cMpmP"}' \
    > test.out 2>&1
eval_tap $? 214 'PlatformSubscribeSubscription' test.out

#- 215 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '6haWo1HM' \
    --itemId 'w9zfl5zj' \
    > test.out 2>&1
eval_tap $? 215 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 216 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9hulTKXm' \
    --userId '8Z7N9Jiw' \
    > test.out 2>&1
eval_tap $? 216 'GetUserSubscription' test.out

#- 217 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Lj36Scx2' \
    --userId 'uKg3Y5FH' \
    > test.out 2>&1
eval_tap $? 217 'DeleteUserSubscription' test.out

#- 218 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jR7l0nnI' \
    --userId 'WCDrzaGf' \
    --force  \
    --body '{"immediate": true, "reason": "6hbOq9pY"}' \
    > test.out 2>&1
eval_tap $? 218 'CancelSubscription' test.out

#- 219 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tWFRo9Yx' \
    --userId '40OpxaPS' \
    --body '{"grantDays": 27, "reason": "A2tn9srG"}' \
    > test.out 2>&1
eval_tap $? 219 'GrantDaysToSubscription' test.out

#- 220 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tpwQW6GA' \
    --userId 'icJ1oIlQ' \
    --excludeFree  \
    --limit '7' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 220 'GetUserSubscriptionBillingHistories' test.out

#- 221 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TBdMBFC8' \
    --userId 'dcMSPiMc' \
    --body '{"additionalData": {"cardSummary": "iFHzO8VC"}, "authorisedTime": "1994-03-13T00:00:00Z", "chargebackReversedTime": "1971-04-03T00:00:00Z", "chargebackTime": "1977-02-17T00:00:00Z", "chargedTime": "1997-10-24T00:00:00Z", "createdTime": "1984-06-09T00:00:00Z", "currency": {"currencyCode": "GUk9OA3Q", "currencySymbol": "2jrwXMOz", "currencyType": "VIRTUAL", "decimals": 26, "namespace": "grWGp39n"}, "customParameters": {"dSdhhFtt": {}, "sZG4nzjL": {}, "wvasUX7j": {}}, "extOrderNo": "Ey7rSR6I", "extTxId": "xavlvv3j", "extUserId": "aiK2TIPX", "issuedAt": "1983-09-24T00:00:00Z", "metadata": {"IcqEhYh6": "JzkHXr2t", "hFlSDHIU": "otUmGbkd", "VPi4iqvm": "UwqXoPW3"}, "namespace": "a1yOqasm", "nonceStr": "iANi4LLq", "paymentMethod": "YwWTg9oE", "paymentMethodFee": 96, "paymentOrderNo": "N3FD7nez", "paymentProvider": "PAYPAL", "paymentProviderFee": 26, "paymentStationUrl": "8OjZn9dT", "price": 74, "refundedTime": "1994-06-30T00:00:00Z", "salesTax": 77, "sandbox": false, "sku": "4zCateVQ", "status": "INIT", "statusReason": "ghEvm0RB", "subscriptionId": "IdV5oW72", "subtotalPrice": 97, "targetNamespace": "lpOrzoxo", "targetUserId": "kLnG8ner", "tax": 100, "totalPrice": 22, "totalTax": 88, "txEndTime": "1986-05-20T00:00:00Z", "type": "VKcLJYtx", "userId": "s4aSgw3H", "vat": 56}' \
    > test.out 2>&1
eval_tap $? 221 'ProcessUserSubscriptionNotification' test.out

#- 222 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'WwFLjZcq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uo3L8zfT' \
    --body '{"count": 62, "orderNo": "6mQuGVjz"}' \
    > test.out 2>&1
eval_tap $? 222 'AcquireUserTicket' test.out

#- 223 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'SztM3pSM' \
    > test.out 2>&1
eval_tap $? 223 'QueryUserCurrencyWallets' test.out

#- 224 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'TAekJAQk' \
    --namespace "$AB_NAMESPACE" \
    --userId '2V4Dba8g' \
    --limit '0' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 224 'ListUserCurrencyTransactions' test.out

#- 225 CheckWallet
eval_tap 0 225 'CheckWallet # SKIP deprecated' test.out

#- 226 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'nt3bYxht' \
    --namespace "$AB_NAMESPACE" \
    --userId '2Nm94HYh' \
    --body '{"amount": 31, "expireAt": "1988-08-01T00:00:00Z", "origin": "Playstation", "reason": "WECrOZhF", "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 226 'CreditUserWallet' test.out

#- 227 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'bTpw85kC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hbUhAChx' \
    --body '{"amount": 42, "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 227 'PayWithUserWallet' test.out

#- 228 GetUserWallet
eval_tap 0 228 'GetUserWallet # SKIP deprecated' test.out

#- 229 DebitUserWallet
eval_tap 0 229 'DebitUserWallet # SKIP deprecated' test.out

#- 230 DisableUserWallet
eval_tap 0 230 'DisableUserWallet # SKIP deprecated' test.out

#- 231 EnableUserWallet
eval_tap 0 231 'EnableUserWallet # SKIP deprecated' test.out

#- 232 ListUserWalletTransactions
eval_tap 0 232 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 233 QueryWallets
eval_tap 0 233 'QueryWallets # SKIP deprecated' test.out

#- 234 GetWallet
eval_tap 0 234 'GetWallet # SKIP deprecated' test.out

#- 235 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '58mLV5SN' \
    --end 'qujsmsBs' \
    --start 'fYPV7at5' \
    > test.out 2>&1
eval_tap $? 235 'SyncOrders' test.out

#- 236 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["hQs1juie", "JHlsWLqH", "pr46jnJK"], "apiKey": "B778R6lm", "authoriseAsCapture": true, "blockedPaymentMethods": ["vNwYSCsm", "oTwz8YSz", "b2fMgJP7"], "clientKey": "zmHxJKRI", "dropInSettings": "K7haVmxI", "liveEndpointUrlPrefix": "zk8JuzKq", "merchantAccount": "ewsJShNd", "notificationHmacKey": "0qc7MzEa", "notificationPassword": "dpimQYeU", "notificationUsername": "7mPaRwCr", "returnUrl": "h9aWAtl1", "settings": "tiygT8iW"}' \
    > test.out 2>&1
eval_tap $? 236 'TestAdyenConfig' test.out

#- 237 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "4qYwjEMv", "privateKey": "9P7krU5U", "publicKey": "0tt982a8", "returnUrl": "MtDo4r7V"}' \
    > test.out 2>&1
eval_tap $? 237 'TestAliPayConfig' test.out

#- 238 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "IddFlrGJ", "secretKey": "rA8YXd31"}' \
    > test.out 2>&1
eval_tap $? 238 'TestCheckoutConfig' test.out

#- 239 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'uN3TA4Kl' \
    > test.out 2>&1
eval_tap $? 239 'DebugMatchedPaymentMerchantConfig' test.out

#- 240 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "Z9wBqu0B", "clientSecret": "zZaQrCuD", "returnUrl": "9muiYN5l", "webHookId": "DDyYa5FG"}' \
    > test.out 2>&1
eval_tap $? 240 'TestPayPalConfig' test.out

#- 241 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["XJ2iFpMR", "uZOGA3Zg", "YCJ1Kd9t"], "publishableKey": "FcdqvKrK", "secretKey": "N28wGroj", "webhookSecret": "BD59igy8"}' \
    > test.out 2>&1
eval_tap $? 241 'TestStripeConfig' test.out

#- 242 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "HAWFmFUr", "key": "iwifuojp", "mchid": "dUHDFv5K", "returnUrl": "SzFjFWOU"}' \
    > test.out 2>&1
eval_tap $? 242 'TestWxPayConfig' test.out

#- 243 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Ftbo1ev6", "flowCompletionUrl": "IQUdmaiG", "merchantId": 93, "projectId": 47, "projectSecretKey": "GpdhyTNw"}' \
    > test.out 2>&1
eval_tap $? 243 'TestXsollaConfig' test.out

#- 244 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'TsOyZd0R' \
    > test.out 2>&1
eval_tap $? 244 'GetPaymentMerchantConfig' test.out

#- 245 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'gJCmjvvs' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["PP37vDVG", "I4qQGgEq", "3tAtig8I"], "apiKey": "gEzT3d2Y", "authoriseAsCapture": false, "blockedPaymentMethods": ["HbNS493B", "8BdxqqIl", "2TIgL4tO"], "clientKey": "Bt9Z40mQ", "dropInSettings": "WZcQAq4q", "liveEndpointUrlPrefix": "kpXoc2qe", "merchantAccount": "ZPp2qKSw", "notificationHmacKey": "sfPUszbT", "notificationPassword": "JU3TY6Pg", "notificationUsername": "msluPCS2", "returnUrl": "fItoqgCE", "settings": "Z1QsdCDQ"}' \
    > test.out 2>&1
eval_tap $? 245 'UpdateAdyenConfig' test.out

#- 246 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'h6otTYxj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 246 'TestAdyenConfigById' test.out

#- 247 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'JC28w8gY' \
    --sandbox  \
    --validate  \
    --body '{"appId": "fFiSg7aM", "privateKey": "eldcNYfJ", "publicKey": "KPuqE8gl", "returnUrl": "cAKViUlx"}' \
    > test.out 2>&1
eval_tap $? 247 'UpdateAliPayConfig' test.out

#- 248 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '35BICVxU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 248 'TestAliPayConfigById' test.out

#- 249 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '23WDMPC6' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "bI6B25e3", "secretKey": "jYNRsiJY"}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateCheckoutConfig' test.out

#- 250 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'uaUXcgdm' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 250 'TestCheckoutConfigById' test.out

#- 251 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '8lylCe4r' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "QEkEzuQy", "clientSecret": "m6xVT3X2", "returnUrl": "EUnx69KD", "webHookId": "cU7Rcm7c"}' \
    > test.out 2>&1
eval_tap $? 251 'UpdatePayPalConfig' test.out

#- 252 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'xG0euqNM' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 252 'TestPayPalConfigById' test.out

#- 253 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'G5eHPFTQ' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["zTfCyPgO", "U2ivtCm3", "Qzf2mVOl"], "publishableKey": "1PnxsGE5", "secretKey": "m5Y5IQiw", "webhookSecret": "Htu9oozI"}' \
    > test.out 2>&1
eval_tap $? 253 'UpdateStripeConfig' test.out

#- 254 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'KvSgXFCj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 254 'TestStripeConfigById' test.out

#- 255 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'kZqanp70' \
    --validate  \
    --body '{"appId": "Z1QnhhHg", "key": "2DWvMGOP", "mchid": "SqDyfnxd", "returnUrl": "BujAmGZW"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateWxPayConfig' test.out

#- 256 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'U1dEW6O4' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 256 'UpdateWxPayConfigCert' test.out

#- 257 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'fBCSkEYw' \
    > test.out 2>&1
eval_tap $? 257 'TestWxPayConfigById' test.out

#- 258 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'w1sbfIz9' \
    --validate  \
    --body '{"apiKey": "nlJwZplV", "flowCompletionUrl": "ttvuxU7c", "merchantId": 6, "projectId": 74, "projectSecretKey": "J89tfhe3"}' \
    > test.out 2>&1
eval_tap $? 258 'UpdateXsollaConfig' test.out

#- 259 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '3GkAUNHE' \
    > test.out 2>&1
eval_tap $? 259 'TestXsollaConfigById' test.out

#- 260 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'mpEtyw79' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 260 'UpdateXsollaUIConfig' test.out

#- 261 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '89' \
    --namespace "$AB_NAMESPACE" \
    --offset '95' \
    --region 'wY60Zd3h' \
    > test.out 2>&1
eval_tap $? 261 'QueryPaymentProviderConfig' test.out

#- 262 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "WiBg8YOH", "region": "doy6aXea", "sandboxTaxJarApiToken": "H8TM9TL2", "specials": ["ALIPAY", "CHECKOUT", "WALLET"], "taxJarApiToken": "UeGeH8S6", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 262 'CreatePaymentProviderConfig' test.out

#- 263 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 263 'GetAggregatePaymentProviders' test.out

#- 264 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'LrwJJkXk' \
    > test.out 2>&1
eval_tap $? 264 'DebugMatchedPaymentProviderConfig' test.out

#- 265 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 265 'GetSpecialPaymentProviders' test.out

#- 266 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'fNagD8wv' \
    --body '{"aggregate": "XSOLLA", "namespace": "VgGeCcus", "region": "9psaM8df", "sandboxTaxJarApiToken": "j52X865o", "specials": ["XSOLLA", "WXPAY", "ADYEN"], "taxJarApiToken": "y2egsShO", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 266 'UpdatePaymentProviderConfig' test.out

#- 267 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'KwKmR5ko' \
    > test.out 2>&1
eval_tap $? 267 'DeletePaymentProviderConfig' test.out

#- 268 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 268 'GetPaymentTaxConfig' test.out

#- 269 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "jH6eyFTY", "taxJarApiToken": "oZ0SVfOi", "taxJarEnabled": false, "taxJarProductCodesMapping": {"yelTgEwt": "rlvD9eFR", "l3CstDB5": "6lkqImYT", "lrNZY6vK": "wJb3fg67"}}' \
    > test.out 2>&1
eval_tap $? 269 'UpdatePaymentTaxConfig' test.out

#- 270 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'LaoXdO8w' \
    --end 'yzjSJJ4w' \
    --start '8IP0rJDX' \
    > test.out 2>&1
eval_tap $? 270 'SyncPaymentOrders' test.out

#- 271 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'yQJ5GIpd' \
    --storeId 'tTdsz9Di' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetRootCategories' test.out

#- 272 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'hyYqfSIN' \
    --storeId '9iQtaXhg' \
    > test.out 2>&1
eval_tap $? 272 'DownloadCategories' test.out

#- 273 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'LdBYvaAQ' \
    --namespace "$AB_NAMESPACE" \
    --language 'bDEjLsvQ' \
    --storeId 'LzCW9qq3' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCategory' test.out

#- 274 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'aMhHzk0j' \
    --namespace "$AB_NAMESPACE" \
    --language 'OcWcHPUw' \
    --storeId 'MuJRKFQJ' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetChildCategories' test.out

#- 275 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'TrsBiXkG' \
    --namespace "$AB_NAMESPACE" \
    --language 'x5V2utD2' \
    --storeId 'Jb0dh9Ut' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetDescendantCategories' test.out

#- 276 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 276 'PublicListCurrencies' test.out

#- 277 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'RzBvEEsy' \
    --region 'fFpWzCTW' \
    --storeId 'b5ZC4o4N' \
    --appId '9VnGTdCG' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetItemByAppId' test.out

#- 278 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'lZd9SCEY' \
    --categoryPath 'TkNeOfw0' \
    --features 'u8X3zvBE' \
    --itemType 'SEASON' \
    --language 'fj3YEVVD' \
    --limit '19' \
    --offset '27' \
    --region 'bGanioln' \
    --sortBy 'createdAt:desc,createdAt:asc,name:desc' \
    --storeId 'Rmvc0XAz' \
    --tags '5Ep3Gqey' \
    > test.out 2>&1
eval_tap $? 278 'PublicQueryItems' test.out

#- 279 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'cXOcN8ko' \
    --region 'ZfVXPvoh' \
    --storeId 'vBiSI3RQ' \
    --sku 'B62cp8t7' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetItemBySku' test.out

#- 280 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'poFNyrWR' \
    --region 'tGD8vieb' \
    --storeId 'Mm65D6G7' \
    --itemIds 'umXNZNmP' \
    > test.out 2>&1
eval_tap $? 280 'PublicBulkGetItems' test.out

#- 281 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["7Tt7hhpq", "ie2k9ytu", "mdW1xMwr"]}' \
    > test.out 2>&1
eval_tap $? 281 'PublicValidateItemPurchaseCondition' test.out

#- 282 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'CODE' \
    --limit '64' \
    --offset '28' \
    --region 'UOPGkow9' \
    --storeId 'qP6L2J3m' \
    --keyword 'SHS3Ab19' \
    --language 'myRiMput' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchItems' test.out

#- 283 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'HyqXCbZp' \
    --namespace "$AB_NAMESPACE" \
    --language '67c1y6Ux' \
    --region '7LYvSO1a' \
    --storeId '1ImWzWCA' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetApp' test.out

#- 284 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'O5qmNPui' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'PublicGetItemDynamicData' test.out

#- 285 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'oY2fXrkX' \
    --namespace "$AB_NAMESPACE" \
    --language 'BVfwZPpC' \
    --populateBundle  \
    --region '1l9atl89' \
    --storeId 'S0fBrE78' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetItem' test.out

#- 286 GetPaymentCustomization
eval_tap 0 286 'GetPaymentCustomization # SKIP deprecated' test.out

#- 287 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "LpuKFDST", "paymentProvider": "STRIPE", "returnUrl": "f31L8Jua", "ui": "RJCZFbfN", "zipCode": "QX9WXGB2"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetPaymentUrl' test.out

#- 288 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xXjCxHTx' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetPaymentMethods' test.out

#- 289 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ro68Yr5Y' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUnpaidPaymentOrder' test.out

#- 290 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uqXBu1az' \
    --paymentProvider 'ADYEN' \
    --zipCode 'kwZTKZ8L' \
    --body '{"token": "eBob48Kx"}' \
    > test.out 2>&1
eval_tap $? 290 'Pay' test.out

#- 291 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zV1ircIl' \
    > test.out 2>&1
eval_tap $? 291 'PublicCheckPaymentOrderPaidStatus' test.out

#- 292 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'STRIPE' \
    --region 'DFmsPZuL' \
    > test.out 2>&1
eval_tap $? 292 'GetPaymentPublicConfig' test.out

#- 293 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '73f4kg3S' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetQRCode' test.out

#- 294 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'lsPUXGQF' \
    --foreinginvoice 'szIEyQba' \
    --invoiceId 'ddhkkQMg' \
    --payload 'IqgnDJ86' \
    --redirectResult 'itmWE1Y8' \
    --resultCode '5CLJI01O' \
    --sessionId 'h1SMwbpR' \
    --status 'PUa7DRON' \
    --token 'MpAh3nYn' \
    --type 'MWTgMKIJ' \
    --userId '3bg4IAMS' \
    --orderNo 'l5Py6qVV' \
    --paymentOrderNo 'Z8dF1JdD' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'dirYjJ0C' \
    > test.out 2>&1
eval_tap $? 294 'PublicNormalizePaymentReturnUrl' test.out

#- 295 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'qi7eKbvk' \
    --paymentOrderNo 'r6MrWBG4' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 295 'GetPaymentTaxValue' test.out

#- 296 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'ly3zubwu' \
    > test.out 2>&1
eval_tap $? 296 'GetRewardByCode' test.out

#- 297 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'fJqtvIbk' \
    --limit '95' \
    --offset '87' \
    --sortBy 'namespace:asc,namespace,rewardCode' \
    > test.out 2>&1
eval_tap $? 297 'QueryRewards1' test.out

#- 298 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'xZwBHor0' \
    > test.out 2>&1
eval_tap $? 298 'GetReward1' test.out

#- 299 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicListStores' test.out

#- 300 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'MkmfikKj,rkQqWcIA,ir029ARe' \
    --itemIds 'GuStGVNU,bi5nFRHO,rhd0WEvB' \
    --skus 'HkZx5gJn,BjPxOXxl,W3ab9Gax' \
    > test.out 2>&1
eval_tap $? 300 'PublicExistsAnyMyActiveEntitlement' test.out

#- 301 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'QOI8DKJW' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 302 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId 'zvdun5Gs' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 303 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'lULJYVUe' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 304 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Em7je8Fw,RRTEMI5z,h2MUhLKq' \
    --itemIds 'FRRGXutg,Jg3pnSJw,rTlWtIXd' \
    --skus 'wDf00N1a,aU2qVIOo,fUicHcuz' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetEntitlementOwnershipToken' test.out

#- 305 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'UUbstrAw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'PublicGetMyWallet' test.out

#- 306 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'oFHW0Jld' \
    --body '{"epicGamesJwtToken": "NcMSGvWC"}' \
    > test.out 2>&1
eval_tap $? 306 'SyncEpicGameDLC' test.out

#- 307 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'RTnF4ilU' \
    --body '{"serviceLabel": 85}' \
    > test.out 2>&1
eval_tap $? 307 'PublicSyncPsnDlcInventory' test.out

#- 308 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'KP7unfSP' \
    --body '{"appId": "paoMfinG", "steamId": "WzjQWLbV"}' \
    > test.out 2>&1
eval_tap $? 308 'SyncSteamDLC' test.out

#- 309 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'nfZx9ZyE' \
    --body '{"xstsToken": "7X4Si5ax"}' \
    > test.out 2>&1
eval_tap $? 309 'SyncXboxDLC' test.out

#- 310 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JU51EVtZ' \
    --appType 'DEMO' \
    --entitlementClazz 'APP' \
    --entitlementName 'xx46oLKI' \
    --features 'eYO6fMvA,c9jdQzvW,VKMr5ytT' \
    --itemId 'Jg34culz,TGbphulm,RisFHHMP' \
    --limit '45' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 310 'PublicQueryUserEntitlements' test.out

#- 311 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WrJjVcmn' \
    --appId 'rcjX6HGL' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetUserAppEntitlementByAppId' test.out

#- 312 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ajg09uQ2' \
    --limit '52' \
    --offset '88' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 312 'PublicQueryUserEntitlementsByAppType' test.out

#- 313 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '2qaGSnVL' \
    --entitlementClazz 'MEDIA' \
    --itemId 'N2NXxC7Q' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserEntitlementByItemId' test.out

#- 314 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYYKFy0d' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'W0ICwvXg' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserEntitlementBySku' test.out

#- 315 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ie9mK3eS' \
    --appIds 'yKu51qcz,JAFzxA7T,YRKhHujY' \
    --itemIds 'KGblrPLr,xLNORxyx,fOsW625i' \
    --skus 'zMWlTZD0,XC5rwiB4,ODhjSzmU' \
    > test.out 2>&1
eval_tap $? 315 'PublicExistsAnyUserActiveEntitlement' test.out

#- 316 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kmvSfLBS' \
    --appId 'YrZzEvkt' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 317 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qGtGnbVx' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'Y0d2bhlw' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 318 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'D8XCv99U' \
    --ids '35rPGOFK,mIX5uKuX,2pLSJdes' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 319 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBHFAmyf' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'dEt6mAVf' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 320 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'DmG1CMlg' \
    --namespace "$AB_NAMESPACE" \
    --userId '4JPe0v9E' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetUserEntitlement' test.out

#- 321 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '8Er0NO1H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WAbP4zxb' \
    --body '{"options": ["ok650CjJ", "lRz6b5CC", "PmGn6j0I"], "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 321 'PublicConsumeUserEntitlement' test.out

#- 322 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'dVsVCo3l' \
    --body '{"code": "SHTs7fg2", "language": "lSo_686", "region": "MG9R7rdG"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicRedeemCode' test.out

#- 323 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'RdZbUYMU' \
    --body '{"excludeOldTransactions": false, "language": "of_MXKw-Ph", "productId": "wH1U7OIk", "receiptData": "znk4OjsZ", "region": "drpOEpp7", "transactionId": "ctXOfLgf"}' \
    > test.out 2>&1
eval_tap $? 323 'PublicFulfillAppleIAPItem' test.out

#- 324 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'keBGjUiZ' \
    --body '{"epicGamesJwtToken": "EcQ4pZ2b"}' \
    > test.out 2>&1
eval_tap $? 324 'SyncEpicGamesInventory' test.out

#- 325 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HnNtr3oh' \
    --body '{"autoAck": true, "language": "jQ", "orderId": "Rme8C7G0", "packageName": "8JlVa5RZ", "productId": "tY6fQtjC", "purchaseTime": 38, "purchaseToken": "Bdkk23BA", "region": "kpK3VgoM"}' \
    > test.out 2>&1
eval_tap $? 325 'PublicFulfillGoogleIAPItem' test.out

#- 326 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '3JOpD2Tk' \
    --body '{"currencyCode": "XqkEw7O6", "price": 0.5430047647676042, "productId": "jFCOaBRs", "serviceLabel": 67}' \
    > test.out 2>&1
eval_tap $? 326 'PublicReconcilePlayStationStore' test.out

#- 327 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'foRuhYZb' \
    --body '{"appId": "puvQgSSC", "language": "CRC_Lb", "region": "C0rTihmT", "stadiaPlayerId": "ZhmJFG8r"}' \
    > test.out 2>&1
eval_tap $? 327 'SyncStadiaEntitlement' test.out

#- 328 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCCFvBnx' \
    --body '{"appId": "RwrCs8L5", "currencyCode": "LsDqaZSG", "language": "QWvs-cWfU", "price": 0.36440060770406546, "productId": "ZsUMSG2Q", "region": "uAs2w0lZ", "steamId": "viGLo2PI"}' \
    > test.out 2>&1
eval_tap $? 328 'SyncSteamInventory' test.out

#- 329 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hR6LXNw5' \
    --body '{"gameId": "MTm0owlT", "language": "EH", "region": "wQnujzcy"}' \
    > test.out 2>&1
eval_tap $? 329 'SyncTwitchDropsEntitlement' test.out

#- 330 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'q5pcOLdZ' \
    --body '{"currencyCode": "IW5XBjmH", "price": 0.9810274247455972, "productId": "RsjMcMB6", "xstsToken": "Q4sr0xqc"}' \
    > test.out 2>&1
eval_tap $? 330 'SyncXboxInventory' test.out

#- 331 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cb9728Es' \
    --itemId 'U0os3wOC' \
    --limit '45' \
    --offset '71' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 331 'PublicQueryUserOrders' test.out

#- 332 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'BC9ct4pK' \
    --body '{"currencyCode": "AgSSdgsq", "discountedPrice": 82, "ext": {"gGmRQo4n": {}, "fuGA6J5H": {}, "X4bnjlMA": {}}, "itemId": "zVT6SAhV", "language": "du", "price": 40, "quantity": 25, "region": "xi8nmRJo", "returnUrl": "SAf5fvVt"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicCreateUserOrder' test.out

#- 333 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZXDLsJYV' \
    --userId 'wi7aQJ4n' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetUserOrder' test.out

#- 334 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QyaOv3a8' \
    --userId 'nMsdTVwQ' \
    > test.out 2>&1
eval_tap $? 334 'PublicCancelUserOrder' test.out

#- 335 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6jUysesl' \
    --userId 'lOs0lD1w' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetUserOrderHistories' test.out

#- 336 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'BC1oRY34' \
    --userId 'ervmp6if' \
    > test.out 2>&1
eval_tap $? 336 'PublicDownloadUserOrderReceipt' test.out

#- 337 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '3xJVmzsn' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetPaymentAccounts' test.out

#- 338 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'gVBpim0p' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'JdJyfxfv' \
    > test.out 2>&1
eval_tap $? 338 'PublicDeletePaymentAccount' test.out

#- 339 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'c4LyKqs3' \
    --chargeStatus 'SETUP' \
    --itemId 'nokSzAKi' \
    --limit '20' \
    --offset '3' \
    --sku '8kbEGrZh' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserSubscriptions' test.out

#- 340 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '1QVJB9A1' \
    --body '{"currencyCode": "GYMYuTw5", "itemId": "C7CwPVE9", "language": "zwi_KpwA-215", "region": "5DpnqkbM", "returnUrl": "1QitDtFW", "source": "NdRaVOjT"}' \
    > test.out 2>&1
eval_tap $? 340 'PublicSubscribeSubscription' test.out

#- 341 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '1rVrFDTo' \
    --itemId 'FZaf5tPn' \
    > test.out 2>&1
eval_tap $? 341 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 342 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JACMKV83' \
    --userId 'yD0JonqK' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserSubscription' test.out

#- 343 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uVLBQrd2' \
    --userId 'WzVPygpK' \
    > test.out 2>&1
eval_tap $? 343 'PublicChangeSubscriptionBillingAccount' test.out

#- 344 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0uEiSAU6' \
    --userId 'GwEtw1Gi' \
    --body '{"immediate": true, "reason": "dO6DyYQo"}' \
    > test.out 2>&1
eval_tap $? 344 'PublicCancelSubscription' test.out

#- 345 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bT7ZqJQI' \
    --userId '6HTTvJHZ' \
    --excludeFree  \
    --limit '2' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserSubscriptionBillingHistories' test.out

#- 346 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'JfvqpphM' \
    --namespace "$AB_NAMESPACE" \
    --userId '3Y10U8cQ' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetWallet' test.out

#- 347 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'hRQqOin0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oDbeTGUv' \
    --limit '92' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 347 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE