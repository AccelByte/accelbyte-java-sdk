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
echo "1..364"

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
    --body '{"context": {"item": {"appId": "HGCYPbfd", "appType": "SOFTWARE", "baseAppId": "wMkSQA8s", "boothName": "bDR4VEWU", "boundItemIds": ["AWkn3eUI", "21IyTOo6", "2wSkit2W"], "categoryPath": "hsEmGOlH", "clazz": "OfWmCsG3", "createdAt": "1996-08-29T00:00:00Z", "description": "cDHwCZ0m", "displayOrder": 66, "entitlementType": "DURABLE", "ext": {"dHGNnhWp": {}, "bQsMlRsA": {}, "HBT9K1rU": {}}, "features": ["6jybgGcc", "XN0rLOLo", "roOc0arB"], "fresh": true, "images": [{"as": "cyVjG09v", "caption": "S9ss5l4k", "height": 79, "imageUrl": "oh4rPj92", "smallImageUrl": "RxiEzAqb", "width": 29}, {"as": "Qn6EyGZU", "caption": "Gnqv7aUV", "height": 3, "imageUrl": "sKhmieet", "smallImageUrl": "CQc55sMC", "width": 88}, {"as": "N8C33N4G", "caption": "FOZnccRb", "height": 43, "imageUrl": "MGT5iCmc", "smallImageUrl": "48rH6vex", "width": 21}], "itemId": "STn3G1Yr", "itemIds": ["JPuVecTL", "2ur7JtQl", "FJQMDZI9"], "itemQty": {"VJYujvO8": 97, "Y9mnmt9S": 24, "7k3g74dI": 95}, "itemType": "APP", "language": "W3LR7S4C", "listable": false, "localExt": {"yHZXUIm0": {}, "KpEjG0b9": {}, "A1UxLMka": {}}, "longDescription": "LFPIppsa", "lootBoxConfig": {"rewardCount": 46, "rewards": [{"lootBoxItems": [{"count": 9, "itemId": "snPwhb3G", "itemSku": "6JWZDWp7", "itemType": "ct0HnXp7"}, {"count": 52, "itemId": "vi1EieEj", "itemSku": "oGQBvZ93", "itemType": "3AxbvmSJ"}, {"count": 70, "itemId": "z2l5QhM9", "itemSku": "hHLN87SY", "itemType": "62US8RYY"}], "name": "LkPKYnXY", "odds": 0.3765909996870126, "type": "REWARD", "weight": 4}, {"lootBoxItems": [{"count": 43, "itemId": "YscE85LZ", "itemSku": "nHl0GMFI", "itemType": "kk7cTvwR"}, {"count": 52, "itemId": "Gj1citrr", "itemSku": "8UcH1Md5", "itemType": "6d40YpYs"}, {"count": 39, "itemId": "3qCHMMUK", "itemSku": "hrBzmjPJ", "itemType": "9wAvz5P3"}], "name": "7C2uSpAj", "odds": 0.7158046722995323, "type": "REWARD", "weight": 1}, {"lootBoxItems": [{"count": 4, "itemId": "T9bDRbgK", "itemSku": "GC6m2n9V", "itemType": "7YVP0UZt"}, {"count": 88, "itemId": "kMUpBf2O", "itemSku": "nz5odbAR", "itemType": "22QBdsg3"}, {"count": 95, "itemId": "GByeeJaS", "itemSku": "q9iwRgMd", "itemType": "wM82Ncru"}], "name": "pO7rYbkm", "odds": 0.16988205006823065, "type": "REWARD", "weight": 57}]}, "maxCount": 2, "maxCountPerUser": 43, "name": "cY6S4fP1", "namespace": "cxOcRgUN", "optionBoxConfig": {"boxItems": [{"count": 26, "itemId": "9mElqKUl", "itemSku": "d2OxVZNh", "itemType": "wHoY5ylH"}, {"count": 31, "itemId": "EEkoeY0X", "itemSku": "j3KajdLh", "itemType": "UWMlGkGe"}, {"count": 99, "itemId": "r4OCHD73", "itemSku": "G3RkOBes", "itemType": "nX3usYw0"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 91, "comparison": "includes", "name": "GdaXtX2F", "predicateType": "SeasonTierPredicate", "value": "6vSNcZJW", "values": ["IGDXS7Z1", "4GnBcOLD", "zDvHgWFm"]}, {"anyOf": 90, "comparison": "isLessThan", "name": "nBemJiaq", "predicateType": "EntitlementPredicate", "value": "EBHrDck3", "values": ["2TcY2fI1", "YwqctLAP", "BOlfGIpR"]}, {"anyOf": 31, "comparison": "isGreaterThanOrEqual", "name": "k2rRHIyh", "predicateType": "EntitlementPredicate", "value": "rqpmYN9z", "values": ["q3zsN0PR", "esncFz9M", "ERcYO486"]}]}, {"operator": "and", "predicates": [{"anyOf": 12, "comparison": "isLessThanOrEqual", "name": "wIKIx0Gb", "predicateType": "EntitlementPredicate", "value": "LreAIFmi", "values": ["hyctaKrd", "Cx1QFj3A", "6FXB39Xe"]}, {"anyOf": 95, "comparison": "isLessThanOrEqual", "name": "SzBhc4Ji", "predicateType": "SeasonPassPredicate", "value": "qDtMwOyf", "values": ["ZPA8baOI", "2IIqsnJj", "EqseLK7t"]}, {"anyOf": 20, "comparison": "excludes", "name": "GwwCwKFU", "predicateType": "SeasonPassPredicate", "value": "1KmRAg6S", "values": ["AVp6XqSA", "VAjkRSmt", "6T8DTKOd"]}]}, {"operator": "or", "predicates": [{"anyOf": 28, "comparison": "isLessThan", "name": "zCBJs0Os", "predicateType": "EntitlementPredicate", "value": "ULnTtez2", "values": ["YiJMsjng", "J0H8ulYT", "wkkv5Krv"]}, {"anyOf": 32, "comparison": "isLessThanOrEqual", "name": "mOMV54nK", "predicateType": "SeasonPassPredicate", "value": "BENaNLGH", "values": ["0nvgz0ft", "7iZEJ7sW", "mq0QP948"]}, {"anyOf": 60, "comparison": "isLessThan", "name": "VV0tyQxH", "predicateType": "SeasonPassPredicate", "value": "lNQzU8cn", "values": ["n96pJDIP", "wHw2YDvY", "5wnFjUUK"]}]}]}, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 24, "fixedTrialCycles": 78, "graceDays": 85}, "region": "ylyZrtcV", "regionData": [{"currencyCode": "WhHpWkQs", "currencyNamespace": "IN8on7t5", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1984-03-27T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1989-12-12T00:00:00Z", "discountedPrice": 19, "expireAt": "1978-08-25T00:00:00Z", "price": 85, "purchaseAt": "1989-05-30T00:00:00Z", "trialPrice": 46}, {"currencyCode": "9lZ9TPsR", "currencyNamespace": "013IkqDb", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1978-01-13T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1981-12-03T00:00:00Z", "discountedPrice": 49, "expireAt": "1981-11-13T00:00:00Z", "price": 44, "purchaseAt": "1979-06-08T00:00:00Z", "trialPrice": 66}, {"currencyCode": "4xCtl4fr", "currencyNamespace": "NqeSDBSr", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1976-02-24T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1972-01-07T00:00:00Z", "discountedPrice": 80, "expireAt": "1977-07-27T00:00:00Z", "price": 36, "purchaseAt": "1995-07-21T00:00:00Z", "trialPrice": 72}], "seasonType": "PASS", "sku": "13Cd52NW", "stackable": false, "status": "ACTIVE", "tags": ["HsPO5b7I", "unMYg93Y", "E5CdaMhU"], "targetCurrencyCode": "H9DevJ1q", "targetItemId": "xBqJx4mf", "targetNamespace": "goqPBOAR", "thumbnailUrl": "YNaDWTka", "title": "k4dFegD9", "updatedAt": "1998-01-09T00:00:00Z", "useCount": 74}, "namespace": "vcIGXdvM", "order": {"currency": {"currencyCode": "IRrGZ0ei", "currencySymbol": "9RCfPHyQ", "currencyType": "REAL", "decimals": 18, "namespace": "93eY9RPs"}, "ext": {"ui1noUf6": {}, "KIjcEjj7": {}, "As6VIP11": {}}, "free": true}, "source": "PURCHASE"}, "script": "8R6B6aIP", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'HonbUCsr' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'QKWsqOcq' \
    --body '{"grantDays": "IobWwolF"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'sBCXqbla' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'pVbVYjcQ' \
    --body '{"grantDays": "70i81V2u"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "vQKGsMCD", "dryRun": true, "fulfillmentUrl": "CFleV6hx", "itemType": "SUBSCRIPTION", "purchaseConditionUrl": "FnM80ktw"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'JiDm3mdu' \
    --itemType 'LOOTBOX' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'AT9BiXE6' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '6rmzkFuO' \
    --body '{"clazz": "y4hTsHCf", "dryRun": false, "fulfillmentUrl": "56Nrgqd7", "purchaseConditionUrl": "3rBk7xzA"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'jO6TAx4b' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --name 'FKSJqSY3' \
    --offset '75' \
    --tag 'c4hQuntg' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8J5DTbTJ", "items": [{"extraSubscriptionDays": 77, "itemId": "1zJCJ93X", "itemName": "efaBylsd", "quantity": 100}, {"extraSubscriptionDays": 76, "itemId": "G5Fydsch", "itemName": "QMjYjkxX", "quantity": 24}, {"extraSubscriptionDays": 92, "itemId": "dLHPvmSD", "itemName": "k6JyDp5T", "quantity": 10}], "maxRedeemCountPerCampaignPerUser": 27, "maxRedeemCountPerCode": 50, "maxRedeemCountPerCodePerUser": 38, "maxSaleCount": 73, "name": "G9a9tWWv", "redeemEnd": "1977-08-12T00:00:00Z", "redeemStart": "1992-06-06T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["8LENOI14", "1yEMHVJa", "RVOBJfcR"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'XuWaksLG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '9pe0PmR7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bqTZlmIf", "items": [{"extraSubscriptionDays": 91, "itemId": "PEyXYMiq", "itemName": "IdARNdnb", "quantity": 88}, {"extraSubscriptionDays": 16, "itemId": "3DcZe6Zk", "itemName": "tDKnkjW6", "quantity": 86}, {"extraSubscriptionDays": 60, "itemId": "c8RXOoct", "itemName": "9CSigw4o", "quantity": 28}], "maxRedeemCountPerCampaignPerUser": 13, "maxRedeemCountPerCode": 77, "maxRedeemCountPerCodePerUser": 83, "maxSaleCount": 29, "name": "1hkOWBLP", "redeemEnd": "1974-09-17T00:00:00Z", "redeemStart": "1990-06-25T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["mSDm4IgB", "C6xforYP", "BqOvFfT0"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'FT590rPV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cOrW5uqT' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pygzZ4bq' \
    --body '{"categoryPath": "eLydok96", "localizationDisplayNames": {"usqWhWw5": "j003lw3f", "xZlqDurW": "2cqv8KLU", "vqLaDmr2": "qhwNKUpU"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '4b4el2DE' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'nxqCHxtN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O3ufxsQb' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'S2Tzvs05' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Vm3xgwPj' \
    --body '{"localizationDisplayNames": {"uSa63HN7": "WDRdA505", "01Q5zdUA": "uC6NKlxt", "braX7EIH": "bj3kdIMC"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'CL5rF6Uz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mynUDBWN' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '9sg4vQ50' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'en5Cn9Ky' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'eBjscwEA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WzJ0X1wr' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'DdHj8gBI' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '55' \
    --code '0GnRgPQG' \
    --limit '10' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'M8liBMLT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 77}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'nLJ2s9bh' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '20' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'Nc9VfdY4' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '59' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '6cK5S39N' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '25' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'OatL1ZeK' \
    --namespace "$AB_NAMESPACE" \
    --code 'tzP6ErUN' \
    --limit '89' \
    --offset '91' \
    --userId 'x1h0YSht' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Ubj7QxA5' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'DBa36Rwj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'Mg2cns3b' \
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
    --body '{"currencyCode": "SgPbJsIM", "currencySymbol": "LQGeT93K", "currencyType": "REAL", "decimals": 86, "localizationDescriptions": {"Azz3Yrxw": "tD6Nk5mG", "bw1AdDv7": "GnqLyUsQ", "Qk0zyW1x": "GbT7QShZ"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'DLcVno9O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"U2xhaOCX": "UjkKdhut", "4G3iLG5k": "XYDkkqnC", "T1rULFlD": "3mTxfhtI"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'jW4nAbc7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'YMmpFc7c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'OsH8gX3X' \
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
    --body '{"data": [{"id": "31oc02i8", "rewards": [{"currency": {"currencyCode": "4Sl2d8cV", "namespace": "ZIyYqJis"}, "item": {"itemId": "xvKKv8Eo", "itemSku": "SLtdSDVx", "itemType": "drs1uIRg"}, "quantity": 11, "type": "CURRENCY"}, {"currency": {"currencyCode": "vxBosBNk", "namespace": "lCX4qyyA"}, "item": {"itemId": "AkrWDCPE", "itemSku": "HWXLKPbx", "itemType": "IJmknf1Z"}, "quantity": 26, "type": "ITEM"}, {"currency": {"currencyCode": "BppfnPnn", "namespace": "WSL9OLcx"}, "item": {"itemId": "U3NpJhcW", "itemSku": "gXSl2ZTJ", "itemType": "gr4YWmFi"}, "quantity": 53, "type": "CURRENCY"}]}, {"id": "sle3I9po", "rewards": [{"currency": {"currencyCode": "SvDMqyj6", "namespace": "e8hSXKWQ"}, "item": {"itemId": "efNMpuJr", "itemSku": "w2sVgpPP", "itemType": "mCAlPmgE"}, "quantity": 99, "type": "CURRENCY"}, {"currency": {"currencyCode": "UO3tNkl4", "namespace": "NngMUJ6y"}, "item": {"itemId": "TMIJoGf9", "itemSku": "yiVeK9Pi", "itemType": "aXDFIaIY"}, "quantity": 64, "type": "ITEM"}, {"currency": {"currencyCode": "wuUvDG44", "namespace": "QXbRGB0c"}, "item": {"itemId": "rj33D6oS", "itemSku": "usdaALyQ", "itemType": "LJMEUDEJ"}, "quantity": 71, "type": "CURRENCY"}]}, {"id": "LgSELQLT", "rewards": [{"currency": {"currencyCode": "GOH70ec8", "namespace": "0EFJx8qn"}, "item": {"itemId": "vkUUP2N3", "itemSku": "bfHDEWan", "itemType": "9m2hnJQM"}, "quantity": 92, "type": "ITEM"}, {"currency": {"currencyCode": "Iri1OG5x", "namespace": "sDeqVEbr"}, "item": {"itemId": "yrE7UEVI", "itemSku": "O4dZV01p", "itemType": "HGHIMoQH"}, "quantity": 2, "type": "CURRENCY"}, {"currency": {"currencyCode": "IKFWGQU5", "namespace": "sYYX7mN7"}, "item": {"itemId": "WBy0iWsi", "itemSku": "OUVtrwcU", "itemType": "OIfAr14o"}, "quantity": 84, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"0taoiXWn": "47yimrUJ", "IEaDbSrS": "iYY6USGu", "lOWoC8jb": "BuO5hfXE"}}, {"platform": "PSN", "platformDlcIdMap": {"BCGFAWBq": "vUbKTFVK", "sJgnpN0S": "4LL6r2Qv", "HRFePWEd": "5a2MRwnI"}}, {"platform": "STEAM", "platformDlcIdMap": {"KdstRdxR": "Hdz8xKrc", "fn774kFE": "ld4fmHft", "SLr8ouvT": "HJCCceE2"}}]}' \
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
    --entitlementClazz 'APP' \
    --entitlementName 'RpmJt9ta' \
    --itemId 'MSiNtyg9,85vegLGZ,Z5NWi8fG' \
    --limit '16' \
    --offset '76' \
    --userId 'zPrv5gPA' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '8TmlxLcX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '58' \
    --status 'SUCCESS' \
    --userId 'lyMhqg0I' \
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
    --body '{"bundleId": "ccrkdfwy", "password": "mcKaRrVz"}' \
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
    --body '{"sandboxId": "1txsNjjD"}' \
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
    --body '{"applicationName": "hmbWvlGM", "serviceAccountId": "weRlgwD7"}' \
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
    --body '{"data": [{"itemIdentity": "uEocHVpB", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"FLVoZbrn": "abR6xm3U", "SXr9jvm4": "mUFvsfsD", "VXekaIpC": "pSpSz06j"}}, {"itemIdentity": "OHw3gcNl", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"wp0qkAzM": "gANsoLDv", "8sT3oWYi": "ZUh0RM0P", "68BkH4y5": "a6P9XEni"}}, {"itemIdentity": "39beK5z4", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"i7XipYfm": "cwf6YUo0", "ib1FdMkm": "lYbixp1o", "JaRPnjA5": "2MiLZZzm"}}]}' \
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
    --body '{"environment": "errIYrRt"}' \
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
    --body '{"appId": "NLK3Q1ok", "publisherAuthenticationKey": "UVmNjyfs"}' \
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
    --body '{"clientId": "xhbAe8n1", "clientSecret": "8PugWGcm", "organizationId": "WyMSKRnS"}' \
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
    --body '{"relyingPartyCert": "qxbYchSP"}' \
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
    --password 'ZuPe1POy' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature '3OgVP3Ab' \
    --itemId 'zPZnwOr8' \
    --itemType 'BUNDLE' \
    --endTime 'WzPaH4pR' \
    --startTime 'Jv9ZgWXI' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'J2pK58dz' \
    --itemId 'CeshaK7L' \
    --itemType 'MEDIA' \
    --endTime 'R3entVLL' \
    --startTime 'jeYs6At8' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'a2TAeVZJ' \
    --body '{"categoryPath": "IGJkTBx1", "targetItemId": "TWBgikt4", "targetNamespace": "RAAsvUS8"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '2gDSXOdY' \
    --body '{"appId": "sghw983f", "appType": "SOFTWARE", "baseAppId": "7khxhKp1", "boothName": "FVqIW7wW", "categoryPath": "iQ99VOWM", "clazz": "Okp6xOH2", "displayOrder": 74, "entitlementType": "DURABLE", "ext": {"HwHn9ToB": {}, "RwLpbzgH": {}, "pGLUVuz0": {}}, "features": ["WZjumbbj", "EeFrTkDz", "oPbVZU28"], "images": [{"as": "3ZnMB0rB", "caption": "sC6LWhBm", "height": 35, "imageUrl": "H8eP0Nix", "smallImageUrl": "r590IKQE", "width": 89}, {"as": "vUmpurxV", "caption": "TeqVqGJg", "height": 54, "imageUrl": "mC1WJ2mE", "smallImageUrl": "RzfusZst", "width": 18}, {"as": "jPQZV063", "caption": "f3DCx7lt", "height": 27, "imageUrl": "2aAM5hRS", "smallImageUrl": "h7JhlF9n", "width": 4}], "itemIds": ["mUmpLH3s", "m2MlSUQh", "47mws0n9"], "itemQty": {"YoKsIbgK": 56, "DdmjBRkR": 85, "OdQuDXeE": 57}, "itemType": "LOOTBOX", "listable": true, "localizations": {"gBTucvVG": {"description": "eYH2dt1w", "localExt": {"dg1CbmPA": {}, "4CMfRxxf": {}, "L0yXPZPD": {}}, "longDescription": "m8KZJk99", "title": "PoOQWjLd"}, "fYrzJF4c": {"description": "NIfMsghC", "localExt": {"JCRb6PfH": {}, "SHSxbFck": {}, "6pfA86UQ": {}}, "longDescription": "3XggrlbY", "title": "q7qgm1e1"}, "NKVaUSaZ": {"description": "c9iz6o6m", "localExt": {"QOCSyjL8": {}, "lmdQCcOS": {}, "s1B8nrHA": {}}, "longDescription": "gtWqtrlI", "title": "XZ6PNKNb"}}, "lootBoxConfig": {"rewardCount": 27, "rewards": [{"lootBoxItems": [{"count": 39, "itemId": "lO1pktCe", "itemSku": "5Qxm0YzA", "itemType": "PgMAmHvF"}, {"count": 56, "itemId": "sAwiPzEP", "itemSku": "5PNTPNeO", "itemType": "bS0Z1PxE"}, {"count": 4, "itemId": "uOBAj29j", "itemSku": "GZaidzCx", "itemType": "Rgyf1MP6"}], "name": "ZejlkkUf", "odds": 0.5574192366227557, "type": "REWARD", "weight": 19}, {"lootBoxItems": [{"count": 28, "itemId": "s1ieuffp", "itemSku": "WLa9ltbp", "itemType": "BzqwImSX"}, {"count": 20, "itemId": "sbNHtv7L", "itemSku": "OjaA5nji", "itemType": "gImdO0qQ"}, {"count": 69, "itemId": "OjYr71mC", "itemSku": "uxz7JNxn", "itemType": "LzlsoY8E"}], "name": "TS6jyDCc", "odds": 0.4569310818580725, "type": "PROBABILITY_GROUP", "weight": 69}, {"lootBoxItems": [{"count": 85, "itemId": "tMJSHoNK", "itemSku": "txcoMXLm", "itemType": "j8Xemq6W"}, {"count": 100, "itemId": "cCnaa30v", "itemSku": "py3zyzmq", "itemType": "pxNJOlr6"}, {"count": 65, "itemId": "XbC4pqY3", "itemSku": "I7Vt4QWy", "itemType": "QJhQN8I6"}], "name": "v1lKiFrE", "odds": 0.8971675967431314, "type": "PROBABILITY_GROUP", "weight": 0}]}, "maxCount": 11, "maxCountPerUser": 79, "name": "8Wftt53j", "optionBoxConfig": {"boxItems": [{"count": 80, "itemId": "QpNT6awI", "itemSku": "zGnZjTUv", "itemType": "nw0KSaiX"}, {"count": 13, "itemId": "49z71Ui2", "itemSku": "rMUdSuQ5", "itemType": "485Jj97O"}, {"count": 94, "itemId": "xpvFvbcg", "itemSku": "QAAqTtZW", "itemType": "yOXY9Vew"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 50, "fixedTrialCycles": 32, "graceDays": 13}, "regionData": {"QoHp2xHF": [{"currencyCode": "9cHh3n3s", "currencyNamespace": "r3TMcuIL", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1980-04-07T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1993-10-13T00:00:00Z", "discountedPrice": 48, "expireAt": "1982-04-10T00:00:00Z", "price": 90, "purchaseAt": "1979-10-26T00:00:00Z", "trialPrice": 21}, {"currencyCode": "ESK70nY7", "currencyNamespace": "XNcRrmzS", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1994-09-17T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1980-11-27T00:00:00Z", "discountedPrice": 45, "expireAt": "1978-08-10T00:00:00Z", "price": 14, "purchaseAt": "1984-07-17T00:00:00Z", "trialPrice": 1}, {"currencyCode": "gJw02wDC", "currencyNamespace": "8wea0IsF", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1992-09-04T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1978-02-28T00:00:00Z", "discountedPrice": 55, "expireAt": "1975-04-05T00:00:00Z", "price": 27, "purchaseAt": "1983-08-17T00:00:00Z", "trialPrice": 62}], "zJV9fOtl": [{"currencyCode": "mNlDfvPj", "currencyNamespace": "EAHUqlJF", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1990-09-24T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1989-04-19T00:00:00Z", "discountedPrice": 0, "expireAt": "1992-02-17T00:00:00Z", "price": 79, "purchaseAt": "1989-08-13T00:00:00Z", "trialPrice": 80}, {"currencyCode": "vT0Fg55x", "currencyNamespace": "UduIUZkQ", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1998-09-12T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1975-08-01T00:00:00Z", "discountedPrice": 55, "expireAt": "1999-02-09T00:00:00Z", "price": 65, "purchaseAt": "1993-07-04T00:00:00Z", "trialPrice": 38}, {"currencyCode": "E1f5lqqu", "currencyNamespace": "WiexznyF", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1986-02-13T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1980-09-29T00:00:00Z", "discountedPrice": 76, "expireAt": "1979-07-16T00:00:00Z", "price": 44, "purchaseAt": "1999-02-22T00:00:00Z", "trialPrice": 89}], "SKlu6J6y": [{"currencyCode": "43epAzD0", "currencyNamespace": "QOfcIm92", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1978-05-12T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1973-11-27T00:00:00Z", "discountedPrice": 28, "expireAt": "1978-03-05T00:00:00Z", "price": 46, "purchaseAt": "1994-11-11T00:00:00Z", "trialPrice": 72}, {"currencyCode": "KRl3CF3e", "currencyNamespace": "Ywu6xtGk", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1992-05-25T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1992-07-16T00:00:00Z", "discountedPrice": 34, "expireAt": "1996-02-19T00:00:00Z", "price": 82, "purchaseAt": "1998-09-24T00:00:00Z", "trialPrice": 22}, {"currencyCode": "61EVNzdH", "currencyNamespace": "jtBYry8z", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1998-07-27T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1989-05-22T00:00:00Z", "discountedPrice": 5, "expireAt": "1993-02-27T00:00:00Z", "price": 32, "purchaseAt": "1982-11-12T00:00:00Z", "trialPrice": 74}]}, "seasonType": "PASS", "sku": "XVAwWkO1", "stackable": false, "status": "ACTIVE", "tags": ["UhhRGE7u", "CZG0MT27", "lJMzTglj"], "targetCurrencyCode": "B1tQVHaf", "targetNamespace": "7sdukj4D", "thumbnailUrl": "9TjgmZE9", "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'mHm0cAf9' \
    --appId '1VJQlwVM' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'cPRrtp0d' \
    --baseAppId 'WgrVOlCA' \
    --categoryPath '7TubERD3' \
    --features 'G7AT0ZWS' \
    --includeSubCategoryItem  \
    --itemType 'EXTENSION' \
    --limit '59' \
    --offset '62' \
    --region 'NZCtDvZo' \
    --sortBy 'displayOrder,name:asc' \
    --storeId 'iSRVmzNn' \
    --tags 'yCKIAQys' \
    --targetNamespace 'V1QuZR4p' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'aKedcnPh,kjAhKWCy,gg0apfWJ' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Ovs79uES' \
    --sku 'iUEZAmGA' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'XkkyiIWY' \
    --populateBundle  \
    --region 'tlPPfR2k' \
    --storeId 'M7366axN' \
    --sku 'hgeW9tlL' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'k5yHydIV' \
    --sku 'FyvKL9pT' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'yuFoydnV,43n30GqW,VFqtZBMH' \
    --storeId 'RkpdPgoq' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'mfgOAZJj' \
    --region 'Tojx6exp' \
    --storeId 'EA03ROVH' \
    --itemIds 'pQGb7dzy' \
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
    --userId 'XPk1POI2' \
    --body '{"itemIds": ["XuYFuCkK", "daG36f6T", "q8c2L81Y"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'EXTENSION' \
    --limit '87' \
    --offset '85' \
    --sortBy 'qppQ2Nhv' \
    --storeId 's0vgJ79n' \
    --keyword 'jOZ8iuFD' \
    --language 'g6nzsrP0' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '88' \
    --offset '83' \
    --sortBy 'createdAt:desc,name' \
    --storeId 'yx0HQT6o' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'zPPt2Lae' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '42QTxScB' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'T9Ahb1mF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aGNBRNTi' \
    --body '{"appId": "2bj78aKD", "appType": "SOFTWARE", "baseAppId": "1zWjQUB0", "boothName": "LdmbrvIk", "categoryPath": "GmxQIArb", "clazz": "CE60A6pl", "displayOrder": 20, "entitlementType": "DURABLE", "ext": {"vAqMKO82": {}, "lVbDes8X": {}, "GTpuQx64": {}}, "features": ["K2rOZxAy", "8XFRp2eS", "T2R2BgaQ"], "images": [{"as": "vfqS6XZg", "caption": "QSLahKCv", "height": 16, "imageUrl": "ytT8gmRG", "smallImageUrl": "JpLcQ3CI", "width": 79}, {"as": "koxw5k0M", "caption": "1qXbFLcl", "height": 43, "imageUrl": "HuyDgENo", "smallImageUrl": "9Ru3Ab3X", "width": 64}, {"as": "rgJW76ab", "caption": "8nS0W41B", "height": 18, "imageUrl": "o8tzdzJQ", "smallImageUrl": "ktpCVhlH", "width": 5}], "itemIds": ["uMzWvqLe", "Jr1UTo05", "YKYusdQM"], "itemQty": {"2Mgbcj5Z": 32, "qGvI0UHM": 22, "pIpNKoS9": 84}, "itemType": "APP", "listable": true, "localizations": {"rRfjlB9r": {"description": "iivuyam1", "localExt": {"kVosAKhY": {}, "9jBe1aRW": {}, "qhoo6Xvy": {}}, "longDescription": "7Kwz5291", "title": "YrA6ih5c"}, "fuxUhMxD": {"description": "J8GXpoTI", "localExt": {"HlLAwJJE": {}, "JP2ke3uC": {}, "R3VZTlIj": {}}, "longDescription": "CFjXTVe6", "title": "zPswETYq"}, "qBBnDByi": {"description": "XEZP75Dn", "localExt": {"vIuepsdh": {}, "L7BLMQBo": {}, "1oRGRIqI": {}}, "longDescription": "MzsprtjU", "title": "pgxodk0K"}}, "lootBoxConfig": {"rewardCount": 54, "rewards": [{"lootBoxItems": [{"count": 21, "itemId": "LFJVkQjS", "itemSku": "0Rul9wmQ", "itemType": "yuB0PcfO"}, {"count": 90, "itemId": "5Ya9GdbH", "itemSku": "Z35nbpyK", "itemType": "va3TRsvw"}, {"count": 35, "itemId": "DWP3j3W7", "itemSku": "fbqYkxec", "itemType": "3QuR0ek0"}], "name": "rG05sDQD", "odds": 0.16332732211444723, "type": "REWARD_GROUP", "weight": 4}, {"lootBoxItems": [{"count": 27, "itemId": "RMfce9hm", "itemSku": "Oin9DfpI", "itemType": "94E5x6QK"}, {"count": 93, "itemId": "N18Uilbe", "itemSku": "4sFixBfT", "itemType": "jDDmBcxX"}, {"count": 29, "itemId": "P6ZMk03P", "itemSku": "1IaBdNdh", "itemType": "8UJ3BZDT"}], "name": "CeQ1FDHe", "odds": 0.30860809742808515, "type": "REWARD", "weight": 76}, {"lootBoxItems": [{"count": 92, "itemId": "pVW5VImu", "itemSku": "qVwLXZKV", "itemType": "2jqN6CrD"}, {"count": 36, "itemId": "uuCNWTX9", "itemSku": "3QRDyfo5", "itemType": "YzTIzWpA"}, {"count": 17, "itemId": "0taIMwce", "itemSku": "NQvjy5US", "itemType": "UjdbRIwt"}], "name": "0yDo5zDp", "odds": 0.48507206257961055, "type": "REWARD", "weight": 21}]}, "maxCount": 54, "maxCountPerUser": 92, "name": "hR3XGaGO", "optionBoxConfig": {"boxItems": [{"count": 35, "itemId": "xtdLuKXv", "itemSku": "BKiq1sYI", "itemType": "2TmfNBbh"}, {"count": 53, "itemId": "XYf70MvX", "itemSku": "lu4UFBYf", "itemType": "hXBqdIsJ"}, {"count": 86, "itemId": "aqOs6SCS", "itemSku": "9JegJy3X", "itemType": "56gnNI71"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 58, "fixedTrialCycles": 11, "graceDays": 77}, "regionData": {"FqL2eFz7": [{"currencyCode": "nRA2ZJys", "currencyNamespace": "QvqElKsu", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1990-06-10T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1991-01-28T00:00:00Z", "discountedPrice": 10, "expireAt": "1997-06-20T00:00:00Z", "price": 24, "purchaseAt": "1987-09-22T00:00:00Z", "trialPrice": 66}, {"currencyCode": "CfFUD9wh", "currencyNamespace": "R89OW8Ts", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1997-09-11T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1995-02-25T00:00:00Z", "discountedPrice": 11, "expireAt": "1982-02-03T00:00:00Z", "price": 16, "purchaseAt": "1974-09-17T00:00:00Z", "trialPrice": 62}, {"currencyCode": "5rOzB1G6", "currencyNamespace": "25QtAWov", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1991-11-13T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1983-12-19T00:00:00Z", "discountedPrice": 48, "expireAt": "1976-11-17T00:00:00Z", "price": 2, "purchaseAt": "1989-02-23T00:00:00Z", "trialPrice": 44}], "ChRUMZHb": [{"currencyCode": "bf8bu0gU", "currencyNamespace": "ag2xGmSz", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1999-02-19T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1984-12-09T00:00:00Z", "discountedPrice": 51, "expireAt": "1995-02-04T00:00:00Z", "price": 13, "purchaseAt": "1973-06-06T00:00:00Z", "trialPrice": 89}, {"currencyCode": "avwILwFp", "currencyNamespace": "2S0Tglql", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1990-12-15T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1984-12-13T00:00:00Z", "discountedPrice": 71, "expireAt": "1984-09-20T00:00:00Z", "price": 21, "purchaseAt": "1976-11-28T00:00:00Z", "trialPrice": 91}, {"currencyCode": "YSsKPflx", "currencyNamespace": "8FBAoTLt", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1981-02-15T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1996-03-24T00:00:00Z", "discountedPrice": 4, "expireAt": "1989-01-20T00:00:00Z", "price": 94, "purchaseAt": "1976-08-14T00:00:00Z", "trialPrice": 66}], "YWUNiYdp": [{"currencyCode": "o0kQSM6h", "currencyNamespace": "8pMyyZPX", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1987-05-02T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1983-07-14T00:00:00Z", "discountedPrice": 53, "expireAt": "1974-01-30T00:00:00Z", "price": 29, "purchaseAt": "1991-08-30T00:00:00Z", "trialPrice": 72}, {"currencyCode": "83dI6RYz", "currencyNamespace": "Cfu9T7TA", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1997-03-17T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1974-03-24T00:00:00Z", "discountedPrice": 39, "expireAt": "1985-03-20T00:00:00Z", "price": 6, "purchaseAt": "1994-07-20T00:00:00Z", "trialPrice": 96}, {"currencyCode": "SH9xzzEA", "currencyNamespace": "4SDjpil5", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1987-06-28T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1990-03-12T00:00:00Z", "discountedPrice": 10, "expireAt": "1974-08-01T00:00:00Z", "price": 68, "purchaseAt": "1985-06-20T00:00:00Z", "trialPrice": 61}]}, "seasonType": "TIER", "sku": "hMMSZsaX", "stackable": true, "status": "ACTIVE", "tags": ["987TUKti", "SyZhLpNf", "4SKnihDQ"], "targetCurrencyCode": "bpwYM8BT", "targetNamespace": "GSNfwizj", "thumbnailUrl": "NhmizLhe", "useCount": 27}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'BNbsIq4n' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'f9OVUvX1' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'bLTtejbk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 38, "orderNo": "ZLkfU2g1"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'sZdJ1kKN' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'cBzWLkr8' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'u8VYLxKr' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4c41jV8v' \
    --body '{"carousel": [{"alt": "wJLaBq23", "previewUrl": "tKEW2ekM", "thumbnailUrl": "PrnNmkP6", "type": "video", "url": "2VSH3Sn5", "videoSource": "generic"}, {"alt": "0iFXVBVd", "previewUrl": "Io7yHb4g", "thumbnailUrl": "3QSMicKt", "type": "video", "url": "jbe6dmJX", "videoSource": "generic"}, {"alt": "4AqyRuKB", "previewUrl": "3R90u30e", "thumbnailUrl": "F1Sb4sb5", "type": "image", "url": "2WqwEva2", "videoSource": "youtube"}], "developer": "31DU2RCe", "forumUrl": "lGt37SZQ", "genres": ["RPG", "Indie", "Indie"], "localizations": {"noDGaR7u": {"announcement": "ojTgs6On", "slogan": "DqHbezyv"}, "4OX4JrQ5": {"announcement": "vjRTHURS", "slogan": "q2qfJwjR"}, "dYLGmWgJ": {"announcement": "TIswgB8B", "slogan": "ZkCW0YBS"}}, "platformRequirements": {"8IAi5hvU": [{"additionals": "Tdi10IXr", "directXVersion": "81sFVRCz", "diskSpace": "JP6cUxqv", "graphics": "D5s5Jo18", "label": "ydUJ2Afz", "osVersion": "3UUEqrVq", "processor": "giQ8QttX", "ram": "ldSTJRyR", "soundCard": "pHPcoZK7"}, {"additionals": "JRBLbDyp", "directXVersion": "VurCcdzR", "diskSpace": "RgTgdiE1", "graphics": "N3tg0NZQ", "label": "8kPnKvoj", "osVersion": "5uTma0zk", "processor": "sw35ZbhG", "ram": "9pT6ibIo", "soundCard": "wiwpUJTg"}, {"additionals": "UBPbqMxe", "directXVersion": "dmqdVzfh", "diskSpace": "rGmWWfLb", "graphics": "isJqtTsi", "label": "DkL1SgUf", "osVersion": "9qwNDshk", "processor": "TA0XTxcN", "ram": "gI8vP6YN", "soundCard": "VuQJU3Mb"}], "f5gLVJUa": [{"additionals": "zap28lTv", "directXVersion": "q9Q8Ie6I", "diskSpace": "3YFCVOvG", "graphics": "OmxEfH9L", "label": "WfNCEhcY", "osVersion": "zbseb32b", "processor": "idWclMtu", "ram": "ru8vbvTs", "soundCard": "w8KNYfMV"}, {"additionals": "8wyVRz6L", "directXVersion": "yAtJYY8w", "diskSpace": "rrlZM3ei", "graphics": "Xze8Yzyc", "label": "YqR0LQP0", "osVersion": "sgctDRsl", "processor": "1iCOPCDV", "ram": "u7g9OZa1", "soundCard": "YB6X4259"}, {"additionals": "uqfGrT3j", "directXVersion": "JROgEcY3", "diskSpace": "Lr97QAOy", "graphics": "8MRqS9Hg", "label": "ZUx1zah0", "osVersion": "llfxXeeB", "processor": "sDXMEdwx", "ram": "rzSUOU0W", "soundCard": "zkUzKf5t"}], "6jgPmWD6": [{"additionals": "apmejv2m", "directXVersion": "UaPBPbC4", "diskSpace": "H0JyKItm", "graphics": "rS36r95m", "label": "eCBs1rYf", "osVersion": "mAQ88MBk", "processor": "5maaHX3X", "ram": "F2xWHAEM", "soundCard": "fMOkaMrn"}, {"additionals": "HOw4hpos", "directXVersion": "2Nxe0CCS", "diskSpace": "8T5VXVdv", "graphics": "7XT96bAb", "label": "1wDDYPd4", "osVersion": "fbEPSTtF", "processor": "srMnLxDX", "ram": "pL4ISgUl", "soundCard": "h7u75m1n"}, {"additionals": "yFnUulba", "directXVersion": "l6kOtcHG", "diskSpace": "SwWDrXiY", "graphics": "xF4Ytg1Q", "label": "TZfGGPia", "osVersion": "UccyJ8yf", "processor": "LvYDDVO0", "ram": "f0dIeueJ", "soundCard": "kIRYW67p"}]}, "platforms": ["Linux", "Windows", "Android"], "players": ["CrossPlatformMulti", "MMO", "Multi"], "primaryGenre": "Simulation", "publisher": "CtfQRd2j", "releaseDate": "1973-01-30T00:00:00Z", "websiteUrl": "jDm3IozF"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'FsumfBUs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'g9RIAGmu' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'YFIKjFBw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'PNSqZKND' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kz58Lo0h' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'XnVdifhv' \
    --itemId '0kmOEfMu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ByhIQjL5' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'KhhAkF9h' \
    --itemId 'TIhoEJ4Q' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GtaUow3O' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '8tu0UE2n' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'iA8V65Rx' \
    --populateBundle  \
    --region 'lA1gmWV5' \
    --storeId 'OByDAxZM' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'qcipVoFV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qc7b2Y0W' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 17, "comparison": "isLessThan", "name": "Z7hbxsIl", "predicateType": "EntitlementPredicate", "value": "41QV0Q35", "values": ["eEsBP9T2", "klG5VOvv", "AoRLimR6"]}, {"anyOf": 49, "comparison": "isNot", "name": "Nl3EX1Xn", "predicateType": "SeasonTierPredicate", "value": "zkxLPcLa", "values": ["mvvS9nVD", "dGqRpI5Y", "nXfX8Zav"]}, {"anyOf": 32, "comparison": "includes", "name": "HlN01O5x", "predicateType": "SeasonTierPredicate", "value": "T4n16gBd", "values": ["VX3BWraA", "K67txY7w", "PyFI3dma"]}]}, {"operator": "and", "predicates": [{"anyOf": 28, "comparison": "isNot", "name": "DLROwsjc", "predicateType": "SeasonPassPredicate", "value": "wtawDxBj", "values": ["uRjbEdoZ", "kTDoaLI9", "gWpNdVj0"]}, {"anyOf": 50, "comparison": "excludes", "name": "29LVF9Us", "predicateType": "EntitlementPredicate", "value": "mqyFzoF8", "values": ["WMhzMxnd", "Vw5WsKrF", "ljX6VYf9"]}, {"anyOf": 16, "comparison": "isGreaterThan", "name": "MTISgKRH", "predicateType": "SeasonTierPredicate", "value": "XgEUDkmx", "values": ["bZu2W4lh", "bemtcyA4", "Um0sn5z0"]}]}, {"operator": "or", "predicates": [{"anyOf": 95, "comparison": "is", "name": "qTvJGC8e", "predicateType": "SeasonTierPredicate", "value": "2FBPY3um", "values": ["ZMKfp63A", "DcKMy5zV", "r6KnCiGB"]}, {"anyOf": 83, "comparison": "isNot", "name": "gfxMG6Zd", "predicateType": "SeasonPassPredicate", "value": "bClriUT5", "values": ["XrJonMVK", "xLjZghgi", "28HBb9qn"]}, {"anyOf": 18, "comparison": "excludes", "name": "jD0aMGNF", "predicateType": "SeasonPassPredicate", "value": "6obZ18Am", "values": ["1GSLXS1Z", "VJPQLE9a", "FFPG8Sk8"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'OXhKwPgF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "0ddA5xAO"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --name 'uZOVgdu9' \
    --offset '65' \
    --tag 'uaDPXXLC' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "BHsUgV71", "name": "fAgCdqtS", "status": "INACTIVE", "tags": ["0j5wXpqh", "wwuVr99R", "oxJH6xGe"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '5ctC6iax' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'NcPD8gtL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "aC1NSb3h", "name": "fTtqcD2O", "status": "INACTIVE", "tags": ["XgGdiBvJ", "ahLz0Fdj", "4RIShwuP"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'KVU1NAaS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'DnBdVo51' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '81' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'OylCA6UT' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'a5AOzNXo' \
    --limit '64' \
    --offset '17' \
    --orderNos 'x8FQFo6a,wz87EkTP,AyETpYSf' \
    --sortBy 'mU09IDcz' \
    --startTime 'n4QyLv6T' \
    --status 'CHARGEBACK_REVERSED' \
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
    --orderNo 'IzRDNllq' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 's1XJ0KUz' \
    --body '{"description": "7FEfD4Xu"}' \
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
    --body '{"dryRun": false, "notifyUrl": "UZPFdK0u", "privateKey": "tJncJSTJ"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'ZxiKLS22' \
    --externalId 'a6Q8OoI1' \
    --limit '86' \
    --notificationSource 'XSOLLA' \
    --notificationType 'wPs4GCC6' \
    --offset '79' \
    --paymentOrderNo 'KMHVJDFb' \
    --startDate 'Bb8Qf25Q' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'yxpF4jMO' \
    --limit '57' \
    --offset '0' \
    --status 'NOTIFICATION_OF_CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "rvUV5G5n", "currencyNamespace": "QWVvkCyD", "customParameters": {"uY34h6be": {}, "vmPlTlE4": {}, "ZHqi9jjD": {}}, "description": "hPrVD1gp", "extOrderNo": "1vX5BF5L", "extUserId": "HQ0gEzBX", "itemType": "MEDIA", "language": "kg-967", "metadata": {"lDtz5IFA": "cnyLmnxI", "RqrpblVe": "GhLmDH2G", "y1WipRlB": "8y8ZrROL"}, "notifyUrl": "lKMezFSQ", "omitNotification": true, "platform": "u1aFVJ6n", "price": 0, "recurringPaymentOrderNo": "niVaO8hO", "region": "SCnRC4sa", "returnUrl": "bhLw4arY", "sandbox": false, "sku": "yL0QxR44", "subscriptionId": "F4uZ6y0k", "targetNamespace": "PhjkxDe7", "targetUserId": "ogsJKlKU", "title": "vTgMdIkQ"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'D7L291Vr' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'whFF4UDZ' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GjPhSRuW' \
    --body '{"extTxId": "XCZyd8Hi", "paymentMethod": "SRuqw5gS", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RCdD985i' \
    --body '{"description": "dxzUQEWs"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MW4ap7xZ' \
    --body '{"amount": 32, "currencyCode": "2oj7GNMt", "notifyType": "REFUND", "paymentProvider": "CHECKOUT", "salesTax": 55, "vat": 73}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lIhXK7Ov' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["System", "Stadia", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "7P7xWwcz", "eventTopic": "Blkg8vnC", "maxAwarded": 15, "maxAwardedPerUser": 75, "namespaceExpression": "UdKgdkHz", "rewardCode": "mXk7QyHS", "rewardConditions": [{"condition": "uwORxUup", "conditionName": "eGAmqJR3", "eventName": "7OIbyrb8", "rewardItems": [{"duration": 66, "itemId": "IojGypgP", "quantity": 20}, {"duration": 23, "itemId": "ZrIp9m6A", "quantity": 25}, {"duration": 18, "itemId": "sc8KjZph", "quantity": 66}]}, {"condition": "65kvbKnc", "conditionName": "YlHwZH5N", "eventName": "TNA7L7IB", "rewardItems": [{"duration": 21, "itemId": "HHQQDNXT", "quantity": 36}, {"duration": 57, "itemId": "lv7ODhit", "quantity": 75}, {"duration": 14, "itemId": "wNi0kvIY", "quantity": 23}]}, {"condition": "reiXpyrX", "conditionName": "GjQf2M72", "eventName": "lmOvcGbe", "rewardItems": [{"duration": 58, "itemId": "1yADDtj2", "quantity": 56}, {"duration": 56, "itemId": "5mgsL1is", "quantity": 58}, {"duration": 67, "itemId": "H55iI0Xn", "quantity": 44}]}], "userIdExpression": "Imja7zDD"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'vepwXTeR' \
    --limit '76' \
    --offset '60' \
    --sortBy 'rewardCode,rewardCode:desc,namespace:asc' \
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
    --rewardId 'Yp9xbpa0' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZAZrs4Ur' \
    --body '{"description": "AqPIU1Hb", "eventTopic": "0eivnACb", "maxAwarded": 36, "maxAwardedPerUser": 48, "namespaceExpression": "okMguXA0", "rewardCode": "mAXv6nSF", "rewardConditions": [{"condition": "raiFetqZ", "conditionName": "cPXVmfng", "eventName": "wDqGQr3T", "rewardItems": [{"duration": 55, "itemId": "vMrZOs9w", "quantity": 82}, {"duration": 9, "itemId": "FvtTcdGt", "quantity": 12}, {"duration": 93, "itemId": "fX6PeQfE", "quantity": 71}]}, {"condition": "vBHwuIT1", "conditionName": "mv8tpu24", "eventName": "CBStozUr", "rewardItems": [{"duration": 68, "itemId": "WCk8fJBf", "quantity": 52}, {"duration": 94, "itemId": "BzhOewBh", "quantity": 67}, {"duration": 72, "itemId": "5tShr0Gp", "quantity": 47}]}, {"condition": "lr53PBML", "conditionName": "KmjdnBTg", "eventName": "d4twk12y", "rewardItems": [{"duration": 73, "itemId": "G3Eio7Ha", "quantity": 82}, {"duration": 99, "itemId": "ZGFcYbz9", "quantity": 80}, {"duration": 54, "itemId": "bNrYow0b", "quantity": 20}]}], "userIdExpression": "MomLmKqJ"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'NQmqXPAY' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'j3xRFNnw' \
    --body '{"payload": {"wfPTiuBV": {}, "Nr0qBvVy": {}, "VSzptE71": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tr0NPhSz' \
    --body '{"conditionName": "Tbzj2lUZ", "userId": "bhF1AIlL"}' \
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
    --body '{"defaultLanguage": "YuMihwyo", "defaultRegion": "WtzIWRuh", "description": "CfnQQwSg", "supportedLanguages": ["IyRaW84b", "oSwiJN8J", "eGJxikUn"], "supportedRegions": ["56OandRF", "6jmbqbyI", "CaGGLWJb"], "title": "0vlnaTWy"}' \
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
    --storeId 'jL1Za5Wl' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UCHcPaHE' \
    --body '{"defaultLanguage": "riIFMPku", "defaultRegion": "ytoNQUIF", "description": "qom9jOCA", "supportedLanguages": ["KPA8RlMH", "KZ6Mo4pE", "oGWyDxBn"], "supportedRegions": ["G2kPXipT", "3qom4AfN", "9gjsDDPe"], "title": "uFyz84F8"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qtM9sRUO' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'y0ZMXRCJ' \
    --action 'UPDATE' \
    --itemSku '1A73jogc' \
    --itemType 'SEASON' \
    --limit '77' \
    --offset '14' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd '3E6h629H' \
    --updatedAtStart 'XKmLR4PT' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'D8qh2vXa' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Aip7B2Gb' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ywMS1wjl' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u0hCfttX' \
    --action 'DELETE' \
    --itemSku 'R8DCDjBq' \
    --itemType 'LOOTBOX' \
    --type 'CATEGORY' \
    --updatedAtEnd '8XTiXoUt' \
    --updatedAtStart 'hBEMYnEh' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QWBpZzKQ' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'SscXeOhh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZCuTUuRh' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'XH3mizYh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AmBdyLWT' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'o1U8TThi' \
    --targetStoreId 'KLoE9NbA' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'pMc3MFTd' \
    --limit '100' \
    --offset '85' \
    --sku 'T67YxZtc' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId '5z3qiVW0' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'F3DZnddh' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'dwYP2Ijq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'OXcypqsh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "IIJw7zBj"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'q3WVrq4u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'sgCSJRP7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 83, "orderNo": "loI3JZnj"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '0c2qu76B' \
    --body '{"achievements": [{"id": "5oMNxagU", "value": 54}, {"id": "VNl5FX3i", "value": 84}, {"id": "Q4Qe0vLM", "value": 12}], "steamUserId": "t1AmdpZg"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dik0Ra7E' \
    --xboxUserId 'NhPsX9f3' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ElFqHXyP' \
    --body '{"achievements": [{"id": "EkMM8Js4", "percentComplete": 33}, {"id": "2WYAJ5LH", "percentComplete": 64}, {"id": "ZUfFTW4u", "percentComplete": 76}], "serviceConfigId": "DxVdphJv", "titleId": "1te0EeFE", "xboxUserId": "77zBXYph"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '4o4tNZjs' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '97XjWAkr' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'pG7hOAvv' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'uCOILCcl' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'I1z2YR6y' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'gJgqei4S' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'jo9hPYkb' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'LgKmxzMm' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'HxKklbix' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 182 'GetUserDLC' test.out

#- 183 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QvYJ5YO8' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'llmpIUDY' \
    --features 'OORKVap7,22IFt8Wb,JhiXs86h' \
    --itemId 'DN89cA53,9pqwJr7c,9zCUWJDQ' \
    --limit '57' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 183 'QueryUserEntitlements' test.out

#- 184 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qQlh3gDs' \
    --body '[{"endDate": "1990-10-20T00:00:00Z", "grantedCode": "wEjUi2hf", "itemId": "zf8uXM7E", "itemNamespace": "CwCFz9IV", "language": "hD-LpNk-lA", "quantity": 12, "region": "bZM1TTjG", "source": "REWARD", "startDate": "1972-01-15T00:00:00Z", "storeId": "x4dxGSMG"}, {"endDate": "1973-04-18T00:00:00Z", "grantedCode": "4WCLPj5N", "itemId": "dhTi0WOx", "itemNamespace": "y6xjcuej", "language": "knCD", "quantity": 0, "region": "nV6vmPC5", "source": "OTHER", "startDate": "1982-01-02T00:00:00Z", "storeId": "Gm4Xn52B"}, {"endDate": "1994-11-23T00:00:00Z", "grantedCode": "5BcCIoNF", "itemId": "z9zH1w9C", "itemNamespace": "3kiKQeRA", "language": "XJCN", "quantity": 95, "region": "qSlm2HIO", "source": "GIFT", "startDate": "1994-05-04T00:00:00Z", "storeId": "wYVt6NUn"}]' \
    > test.out 2>&1
eval_tap $? 184 'GrantUserEntitlement' test.out

#- 185 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '5D85MhBD' \
    --activeOnly  \
    --appId 'TWj05d8p' \
    > test.out 2>&1
eval_tap $? 185 'GetUserAppEntitlementByAppId' test.out

#- 186 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'TfJqWk2m' \
    --activeOnly  \
    --limit '59' \
    --offset '69' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 186 'QueryUserEntitlementsByAppType' test.out

#- 187 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'yw1oBFdh' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'B0MRQIKP' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementByItemId' test.out

#- 188 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRzXP1bj' \
    --ids '5pSwDnkz,jWaxNl6d,JRYTJbtd' \
    > test.out 2>&1
eval_tap $? 188 'GetUserActiveEntitlementsByItemIds' test.out

#- 189 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'CJ0UaqA6' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku '6yB5J47s' \
    > test.out 2>&1
eval_tap $? 189 'GetUserEntitlementBySku' test.out

#- 190 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vluDhibz' \
    --appIds 'gFVWXL2p,bV0jGS4E,5CFX0x39' \
    --itemIds 'S85la5k7,0qjckP6b,zOIeoh2n' \
    --skus 'zu3pLU4A,uqgCLrVN,1UAB0mlc' \
    > test.out 2>&1
eval_tap $? 190 'ExistsAnyUserActiveEntitlement' test.out

#- 191 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'R42w5Zcf' \
    --itemIds 'CK6OC8hg,GzJsh1Qk,seS3e1sb' \
    > test.out 2>&1
eval_tap $? 191 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 192 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QcVGNtJx' \
    --appId 'jJEFs71u' \
    > test.out 2>&1
eval_tap $? 192 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 193 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'eOiox9ua' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '8fGTapJ3' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipByItemId' test.out

#- 194 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNW0Iq4m' \
    --ids 'RCqC6DFG,guexFLU6,fzqAqxKP' \
    > test.out 2>&1
eval_tap $? 194 'GetUserEntitlementOwnershipByItemIds' test.out

#- 195 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'KFyZa9s5' \
    --entitlementClazz 'MEDIA' \
    --sku 'bchQkTfl' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlementOwnershipBySku' test.out

#- 196 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'cxbxt4jy' \
    --entitlementIds 'XvpHUuMs' \
    > test.out 2>&1
eval_tap $? 196 'RevokeUserEntitlements' test.out

#- 197 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'hyBZKvYU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hp42NtIs' \
    > test.out 2>&1
eval_tap $? 197 'GetUserEntitlement' test.out

#- 198 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'K7ZzhBuY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mXpPzwWL' \
    --body '{"endDate": "1986-08-29T00:00:00Z", "nullFieldList": ["aMR7KcYr", "amKvhP4u", "Oi03JvWi"], "startDate": "1998-07-25T00:00:00Z", "status": "REVOKED", "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 198 'UpdateUserEntitlement' test.out

#- 199 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'QCegGcq6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O8qqwBQx' \
    --body '{"options": ["LvdSJAba", "VeutulxG", "6BIz5uGo"], "requestId": "ZrkhwV6Z", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 199 'ConsumeUserEntitlement' test.out

#- 200 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'UqYIkmBO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'plxBHez8' \
    > test.out 2>&1
eval_tap $? 200 'DisableUserEntitlement' test.out

#- 201 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'DdwuDtg0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NHHqXhw9' \
    > test.out 2>&1
eval_tap $? 201 'EnableUserEntitlement' test.out

#- 202 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'bq5FKJrv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'osW1Nuoz' \
    > test.out 2>&1
eval_tap $? 202 'GetUserEntitlementHistories' test.out

#- 203 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'ds4BpDPG' \
    --namespace "$AB_NAMESPACE" \
    --userId '6sTkKEXt' \
    > test.out 2>&1
eval_tap $? 203 'RevokeUserEntitlement' test.out

#- 204 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'BO4qo9Q6' \
    --body '{"duration": 65, "endDate": "1991-01-05T00:00:00Z", "itemId": "q5xne9pi", "itemSku": "i4PpPR2F", "language": "SNulu9Qs", "order": {"currency": {"currencyCode": "gu4dSE9v", "currencySymbol": "3SQqujqJ", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "sCUjIScc"}, "ext": {"DGCiZZjK": {}, "lEDHd2pN": {}, "mlQrtdsQ": {}}, "free": true}, "orderNo": "fDOJx54P", "origin": "GooglePlay", "quantity": 79, "region": "XbWfBW3n", "source": "ACHIEVEMENT", "startDate": "1997-03-26T00:00:00Z", "storeId": "MsKraTa6"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillItem' test.out

#- 205 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHI2IgIt' \
    --body '{"code": "zZf1wBdb", "language": "hG_Lt", "region": "XyiJUDlQ"}' \
    > test.out 2>&1
eval_tap $? 205 'RedeemCode' test.out

#- 206 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lg7rsqr0' \
    --body '{"origin": "Epic", "rewards": [{"currency": {"currencyCode": "XQhIP8qm", "namespace": "JmQuxbBD"}, "item": {"itemId": "9uGZCR0t", "itemSku": "3dpuvi6d", "itemType": "gRlazymI"}, "quantity": 66, "type": "CURRENCY"}, {"currency": {"currencyCode": "OiLKHiXn", "namespace": "77E9eeuU"}, "item": {"itemId": "rlRyolRC", "itemSku": "WpacXBL0", "itemType": "KrLaqBDu"}, "quantity": 96, "type": "CURRENCY"}, {"currency": {"currencyCode": "FLir1yW0", "namespace": "Ehn6dPLU"}, "item": {"itemId": "L3CuHngr", "itemSku": "ZaRqeaOh", "itemType": "mPtzKFSU"}, "quantity": 66, "type": "ITEM"}], "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 206 'FulfillRewards' test.out

#- 207 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'aZoxkCt9' \
    --endTime 'cMueA85D' \
    --limit '10' \
    --offset '66' \
    --productId 'BoSyO7R8' \
    --startTime 'asZPt7eC' \
    --status 'VERIFIED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserIAPOrders' test.out

#- 208 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'JtBCJSFD' \
    > test.out 2>&1
eval_tap $? 208 'QueryAllUserIAPOrders' test.out

#- 209 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWw08O3U' \
    --endTime 'olZ1Af9E' \
    --limit '26' \
    --offset '90' \
    --startTime 'JnfULppD' \
    --status 'FAIL' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserIAPConsumeHistory' test.out

#- 210 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYIlhjcQ' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "VAl-ScKO", "productId": "4TQEpwP7", "region": "GIMJG1nK", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 210 'MockFulfillIAPItem' test.out

#- 211 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cXrBrR1R' \
    --itemId 'Ynn99XlV' \
    --limit '89' \
    --offset '34' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 211 'QueryUserOrders' test.out

#- 212 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ruJPMoKt' \
    --body '{"currencyCode": "DjQPwEKm", "currencyNamespace": "1HXpirN2", "discountedPrice": 58, "ext": {"mEsnrJ3Q": {}, "hZZigOk6": {}, "GKBjhuPE": {}}, "itemId": "2eJul9Ui", "language": "MviBs6MI", "options": {"skipPriceValidation": true}, "platform": "GooglePlay", "price": 36, "quantity": 87, "region": "fG2o3rnO", "returnUrl": "i6hAWW0A", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 212 'AdminCreateUserOrder' test.out

#- 213 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'zs84ZNNX' \
    --itemId 'N1wFvCri' \
    > test.out 2>&1
eval_tap $? 213 'CountOfPurchasedItem' test.out

#- 214 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SkBpMEtM' \
    --userId 'TGkufqdX' \
    > test.out 2>&1
eval_tap $? 214 'GetUserOrder' test.out

#- 215 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WjYmnZlN' \
    --userId 'XUNq8vPV' \
    --body '{"status": "REFUNDING", "statusReason": "c207L8zg"}' \
    > test.out 2>&1
eval_tap $? 215 'UpdateUserOrderStatus' test.out

#- 216 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gWFK9dG8' \
    --userId 'ZOXHMmxs' \
    > test.out 2>&1
eval_tap $? 216 'FulfillUserOrder' test.out

#- 217 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1kZCc78G' \
    --userId '3cFRlCiI' \
    > test.out 2>&1
eval_tap $? 217 'GetUserOrderGrant' test.out

#- 218 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZMJyKHYR' \
    --userId 'VCUcb65I' \
    > test.out 2>&1
eval_tap $? 218 'GetUserOrderHistories' test.out

#- 219 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'o6dLPo8q' \
    --userId 'qBsN0ozy' \
    --body '{"additionalData": {"cardSummary": "yUqrQmmc"}, "authorisedTime": "1986-07-20T00:00:00Z", "chargebackReversedTime": "1988-08-04T00:00:00Z", "chargebackTime": "1989-05-30T00:00:00Z", "chargedTime": "1973-01-12T00:00:00Z", "createdTime": "1978-04-14T00:00:00Z", "currency": {"currencyCode": "5U0d4feq", "currencySymbol": "cmQlGckk", "currencyType": "VIRTUAL", "decimals": 26, "namespace": "NmVCMwFJ"}, "customParameters": {"u1k2glpt": {}, "rZwcEOh3": {}, "05qhhICJ": {}}, "extOrderNo": "iebn7Dlp", "extTxId": "DbxmQmSn", "extUserId": "ULDISYgA", "issuedAt": "1992-05-23T00:00:00Z", "metadata": {"AWPhkku0": "zZQqtNMe", "uZe4aq9S": "AZOQ3zRY", "b1kG9LOl": "URUhDQR2"}, "namespace": "zBS9BTqs", "nonceStr": "SJx52Iwj", "paymentMethod": "wzZe7tLs", "paymentMethodFee": 27, "paymentOrderNo": "aCi8yGxK", "paymentProvider": "WALLET", "paymentProviderFee": 60, "paymentStationUrl": "5QUHE0ts", "price": 65, "refundedTime": "1981-04-13T00:00:00Z", "salesTax": 46, "sandbox": false, "sku": "VI1jryqZ", "status": "AUTHORISED", "statusReason": "T7lrmBe2", "subscriptionId": "ktfPQfN3", "subtotalPrice": 87, "targetNamespace": "zvhYu2vC", "targetUserId": "KNOyZ7iA", "tax": 34, "totalPrice": 33, "totalTax": 59, "txEndTime": "1985-01-12T00:00:00Z", "type": "RZYkfeOg", "userId": "hXo7iJgH", "vat": 33}' \
    > test.out 2>&1
eval_tap $? 219 'ProcessUserOrderNotification' test.out

#- 220 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jifbKweT' \
    --userId 'w9HeJsyg' \
    > test.out 2>&1
eval_tap $? 220 'DownloadUserOrderReceipt' test.out

#- 221 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HukFXYIL' \
    --body '{"currencyCode": "JvAw8T9A", "currencyNamespace": "DvsuPO7e", "customParameters": {"WFqxm1m3": {}, "Jlcc2por": {}, "Crgq9Mum": {}}, "description": "7BgLL8cj", "extOrderNo": "iVevXbGn", "extUserId": "ugcwgMAH", "itemType": "CODE", "language": "HJa", "metadata": {"e7Ijz3DK": "7KQ6xkzn", "Bo4euZWs": "BnQukhtD", "qYPhc8Gg": "L6zISUUg"}, "notifyUrl": "Cp9u29Db", "omitNotification": true, "platform": "4e7RbZsr", "price": 100, "recurringPaymentOrderNo": "9Q64mfHK", "region": "g6Dga65D", "returnUrl": "nHoxoQ5d", "sandbox": false, "sku": "B6bnOP7v", "subscriptionId": "70E5Hrmi", "title": "Rm9gmQsk"}' \
    > test.out 2>&1
eval_tap $? 221 'CreateUserPaymentOrder' test.out

#- 222 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pkDbK2VU' \
    --userId 'L8CAQ4rn' \
    --body '{"description": "ITvEyWgV"}' \
    > test.out 2>&1
eval_tap $? 222 'RefundUserPaymentOrder' test.out

#- 223 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'nNdbMs5n' \
    --body '{"code": "xH2wRN8r", "orderNo": "bZy18hYK"}' \
    > test.out 2>&1
eval_tap $? 223 'ApplyUserRedemption' test.out

#- 224 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '7ZEJz1jB' \
    --chargeStatus 'CHARGED' \
    --itemId 'anXhUo0q' \
    --limit '55' \
    --offset '60' \
    --sku '4WXxC7mt' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 224 'QueryUserSubscriptions' test.out

#- 225 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'zYKpYNJN' \
    --excludeSystem  \
    --limit '14' \
    --offset '67' \
    --subscriptionId '2Mb9TAi7' \
    > test.out 2>&1
eval_tap $? 225 'GetUserSubscriptionActivities' test.out

#- 226 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '8eBMesVn' \
    --body '{"grantDays": 78, "itemId": "kP4D3GIj", "language": "tNNvDudL", "reason": "d8PO3nBo", "region": "oY8qGThQ", "source": "tzWiMgZ6"}' \
    > test.out 2>&1
eval_tap $? 226 'PlatformSubscribeSubscription' test.out

#- 227 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9ibEiK8' \
    --itemId 'GZTidopc' \
    > test.out 2>&1
eval_tap $? 227 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 228 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vIq8Hi1Y' \
    --userId 'bgjgc78o' \
    > test.out 2>&1
eval_tap $? 228 'GetUserSubscription' test.out

#- 229 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5gQokFo9' \
    --userId 'BNwI3uvi' \
    > test.out 2>&1
eval_tap $? 229 'DeleteUserSubscription' test.out

#- 230 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VirvXUMn' \
    --userId 'YsJLRUlC' \
    --force  \
    --body '{"immediate": false, "reason": "jzaEeJSx"}' \
    > test.out 2>&1
eval_tap $? 230 'CancelSubscription' test.out

#- 231 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PenZRDN2' \
    --userId 'vDFi9Q0U' \
    --body '{"grantDays": 64, "reason": "1tkKSTBH"}' \
    > test.out 2>&1
eval_tap $? 231 'GrantDaysToSubscription' test.out

#- 232 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0SJn2o5A' \
    --userId 'kY7LGQi9' \
    --excludeFree  \
    --limit '50' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 232 'GetUserSubscriptionBillingHistories' test.out

#- 233 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NYFoYPVn' \
    --userId 'QUYsbhDZ' \
    --body '{"additionalData": {"cardSummary": "57tlN7NN"}, "authorisedTime": "1974-07-23T00:00:00Z", "chargebackReversedTime": "1993-10-16T00:00:00Z", "chargebackTime": "1992-09-28T00:00:00Z", "chargedTime": "1995-10-23T00:00:00Z", "createdTime": "1998-08-05T00:00:00Z", "currency": {"currencyCode": "2EQd8zzy", "currencySymbol": "mjDcaVkh", "currencyType": "REAL", "decimals": 60, "namespace": "mL3jOY0W"}, "customParameters": {"kWTgFHEL": {}, "GTbZO7Sd": {}, "i8xzKB5Q": {}}, "extOrderNo": "ZweEBdYs", "extTxId": "hF0frVcH", "extUserId": "Ilj4CuFr", "issuedAt": "1992-08-15T00:00:00Z", "metadata": {"XBxr136z": "lVr9odCc", "kWtmeljG": "j2Q2osnI", "zycFCg9P": "C6VIW5YK"}, "namespace": "oyLcsYb4", "nonceStr": "bBy5DQj0", "paymentMethod": "NaVpBqst", "paymentMethodFee": 49, "paymentOrderNo": "DCQL8K0z", "paymentProvider": "STRIPE", "paymentProviderFee": 79, "paymentStationUrl": "MmLuPgdM", "price": 82, "refundedTime": "1995-10-29T00:00:00Z", "salesTax": 58, "sandbox": true, "sku": "FIC1ofKo", "status": "AUTHORISE_FAILED", "statusReason": "2rmCAJ01", "subscriptionId": "44p5NA2K", "subtotalPrice": 29, "targetNamespace": "reqMOXPB", "targetUserId": "OG5MO6gR", "tax": 67, "totalPrice": 48, "totalTax": 45, "txEndTime": "1979-03-03T00:00:00Z", "type": "LcxOmytS", "userId": "urwSva0B", "vat": 74}' \
    > test.out 2>&1
eval_tap $? 233 'ProcessUserSubscriptionNotification' test.out

#- 234 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'Mc2PECsi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kRLSupbt' \
    --body '{"count": 70, "orderNo": "iPAjYb4O"}' \
    > test.out 2>&1
eval_tap $? 234 'AcquireUserTicket' test.out

#- 235 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'pTcbzk8B' \
    > test.out 2>&1
eval_tap $? 235 'QueryUserCurrencyWallets' test.out

#- 236 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'WAj3OHb2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9wRo5D6' \
    --limit '26' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 236 'ListUserCurrencyTransactions' test.out

#- 237 CheckWallet
eval_tap 0 237 'CheckWallet # SKIP deprecated' test.out

#- 238 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'c77kyCYI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'B0IS7FXJ' \
    --body '{"amount": 88, "expireAt": "1998-03-23T00:00:00Z", "origin": "Nintendo", "reason": "TPcezsZN", "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 238 'CreditUserWallet' test.out

#- 239 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'n1D7urUR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NoKRyBLj' \
    --body '{"amount": 16, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 239 'PayWithUserWallet' test.out

#- 240 GetUserWallet
eval_tap 0 240 'GetUserWallet # SKIP deprecated' test.out

#- 241 DebitUserWallet
eval_tap 0 241 'DebitUserWallet # SKIP deprecated' test.out

#- 242 DisableUserWallet
eval_tap 0 242 'DisableUserWallet # SKIP deprecated' test.out

#- 243 EnableUserWallet
eval_tap 0 243 'EnableUserWallet # SKIP deprecated' test.out

#- 244 ListUserWalletTransactions
eval_tap 0 244 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 245 QueryWallets
eval_tap 0 245 'QueryWallets # SKIP deprecated' test.out

#- 246 GetWallet
eval_tap 0 246 'GetWallet # SKIP deprecated' test.out

#- 247 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'BIQ6p3j8' \
    --end 'GJ5LUUUv' \
    --start 'PbvtE7kH' \
    > test.out 2>&1
eval_tap $? 247 'SyncOrders' test.out

#- 248 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["T4GXtZNW", "H4agczYM", "RNcWbGUY"], "apiKey": "1emrWcQH", "authoriseAsCapture": false, "blockedPaymentMethods": ["zqIAkQ93", "Kms6gnde", "Dd3eIJLa"], "clientKey": "Iva0vYM7", "dropInSettings": "OxxEdNux", "liveEndpointUrlPrefix": "SdcSy2QW", "merchantAccount": "yNZwbsSp", "notificationHmacKey": "fKfp138y", "notificationPassword": "XLKOUckm", "notificationUsername": "S5SBaImy", "returnUrl": "TXFk2mxf", "settings": "guTIG4VD"}' \
    > test.out 2>&1
eval_tap $? 248 'TestAdyenConfig' test.out

#- 249 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "nMM2pa3y", "privateKey": "kJWjg0fT", "publicKey": "cumf9vUz", "returnUrl": "tuNLFG25"}' \
    > test.out 2>&1
eval_tap $? 249 'TestAliPayConfig' test.out

#- 250 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "jSJDL51X", "secretKey": "1xzYop6L"}' \
    > test.out 2>&1
eval_tap $? 250 'TestCheckoutConfig' test.out

#- 251 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'QLrFo9js' \
    > test.out 2>&1
eval_tap $? 251 'DebugMatchedPaymentMerchantConfig' test.out

#- 252 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "F2bqvMbW", "clientSecret": "lPsZp1MA", "returnUrl": "fnR5s482", "webHookId": "qebuNDwf"}' \
    > test.out 2>&1
eval_tap $? 252 'TestPayPalConfig' test.out

#- 253 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["MjtDhZVG", "oGVE9yDj", "USg6DI2E"], "publishableKey": "6ZAikIjS", "secretKey": "BFWrOSn3", "webhookSecret": "pRAoJNFM"}' \
    > test.out 2>&1
eval_tap $? 253 'TestStripeConfig' test.out

#- 254 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "yiv4VwMT", "key": "aHFp3HT6", "mchid": "d5ba6k2d", "returnUrl": "qZ5ojngm"}' \
    > test.out 2>&1
eval_tap $? 254 'TestWxPayConfig' test.out

#- 255 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "QwtTVnU0", "flowCompletionUrl": "Xtn9BCWv", "merchantId": 27, "projectId": 62, "projectSecretKey": "SZPV50s7"}' \
    > test.out 2>&1
eval_tap $? 255 'TestXsollaConfig' test.out

#- 256 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'wU0i5fvJ' \
    > test.out 2>&1
eval_tap $? 256 'GetPaymentMerchantConfig' test.out

#- 257 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'rKQzjf1U' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["a5aZ2D6p", "8PGQRJmx", "CnA8r5pR"], "apiKey": "lRgKgoyQ", "authoriseAsCapture": false, "blockedPaymentMethods": ["tE6TnzSR", "BLeunA44", "ORs5en98"], "clientKey": "92VLyefC", "dropInSettings": "r092NiIA", "liveEndpointUrlPrefix": "yfSmQzCb", "merchantAccount": "xD0E3uMQ", "notificationHmacKey": "nP72e9cr", "notificationPassword": "IOECtSds", "notificationUsername": "DoC8IZti", "returnUrl": "xnFMsfOA", "settings": "CQJBZ7Yw"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateAdyenConfig' test.out

#- 258 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'v5e5F0Nr' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestAdyenConfigById' test.out

#- 259 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'DgG3HLcr' \
    --sandbox  \
    --validate  \
    --body '{"appId": "viv4nQrk", "privateKey": "L0o11fcs", "publicKey": "xJ4CESxM", "returnUrl": "MzHySaEH"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateAliPayConfig' test.out

#- 260 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'NLUYb59G' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestAliPayConfigById' test.out

#- 261 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'B1Gv0zQU' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "V5KI3QGw", "secretKey": "7aiwZm2b"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateCheckoutConfig' test.out

#- 262 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'XXCVgn00' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestCheckoutConfigById' test.out

#- 263 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'uEMCu2hy' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "m9coNigx", "clientSecret": "iFm5NmTN", "returnUrl": "YAYSYqkE", "webHookId": "p4OJcz2C"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdatePayPalConfig' test.out

#- 264 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '1Ixu5V09' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 264 'TestPayPalConfigById' test.out

#- 265 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'scJDWwtm' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["Bl3nsRns", "RTprUOzP", "q1uuaSb8"], "publishableKey": "k3Cy03ca", "secretKey": "gECP8ItY", "webhookSecret": "N9X2qf7P"}' \
    > test.out 2>&1
eval_tap $? 265 'UpdateStripeConfig' test.out

#- 266 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'lsSwvmSJ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 266 'TestStripeConfigById' test.out

#- 267 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'hB1JOXEj' \
    --validate  \
    --body '{"appId": "S2SwI0oA", "key": "RHRDHHAX", "mchid": "mnSv3S5y", "returnUrl": "lZzX3KBn"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateWxPayConfig' test.out

#- 268 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'rj5hqiST' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 268 'UpdateWxPayConfigCert' test.out

#- 269 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'EdeVVRTi' \
    > test.out 2>&1
eval_tap $? 269 'TestWxPayConfigById' test.out

#- 270 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'JaNRBwqv' \
    --validate  \
    --body '{"apiKey": "TfyLG9Bt", "flowCompletionUrl": "enXxZo2G", "merchantId": 99, "projectId": 78, "projectSecretKey": "OdWuOiwq"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateXsollaConfig' test.out

#- 271 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '7jYikzgL' \
    > test.out 2>&1
eval_tap $? 271 'TestXsollaConfigById' test.out

#- 272 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'Q8ggGIMo' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 272 'UpdateXsollaUIConfig' test.out

#- 273 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '47' \
    --namespace "$AB_NAMESPACE" \
    --offset '92' \
    --region '1L5sbx6S' \
    > test.out 2>&1
eval_tap $? 273 'QueryPaymentProviderConfig' test.out

#- 274 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "jBaggNtc", "region": "gAEbPjaR", "sandboxTaxJarApiToken": "weYelduH", "specials": ["ALIPAY", "STRIPE", "ADYEN"], "taxJarApiToken": "9i63EnTR", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 274 'CreatePaymentProviderConfig' test.out

#- 275 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 275 'GetAggregatePaymentProviders' test.out

#- 276 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'mOKQiRyy' \
    > test.out 2>&1
eval_tap $? 276 'DebugMatchedPaymentProviderConfig' test.out

#- 277 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 277 'GetSpecialPaymentProviders' test.out

#- 278 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'nPiLQUjY' \
    --body '{"aggregate": "XSOLLA", "namespace": "P5kXXMb2", "region": "XrkeOFrS", "sandboxTaxJarApiToken": "oL0HyuZr", "specials": ["ADYEN", "WALLET", "WALLET"], "taxJarApiToken": "sgD6v8ah", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 278 'UpdatePaymentProviderConfig' test.out

#- 279 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'dYFUqNLk' \
    > test.out 2>&1
eval_tap $? 279 'DeletePaymentProviderConfig' test.out

#- 280 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 280 'GetPaymentTaxConfig' test.out

#- 281 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "I8RbWJWE", "taxJarApiToken": "7PoBvCYZ", "taxJarEnabled": true, "taxJarProductCodesMapping": {"pMnYzyz2": "prf4wssD", "5YXCtykE": "2ZYuz08g", "jF8x8IIi": "veoEYmst"}}' \
    > test.out 2>&1
eval_tap $? 281 'UpdatePaymentTaxConfig' test.out

#- 282 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'wvcEqzF5' \
    --end '0iHROn22' \
    --start 'ivf3Pvoy' \
    > test.out 2>&1
eval_tap $? 282 'SyncPaymentOrders' test.out

#- 283 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'WYTubcji' \
    --storeId 'pWQfrKIs' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetRootCategories' test.out

#- 284 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language '8H3TUZeA' \
    --storeId 'IHUWrEsZ' \
    > test.out 2>&1
eval_tap $? 284 'DownloadCategories' test.out

#- 285 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'RNPMmdRv' \
    --namespace "$AB_NAMESPACE" \
    --language '2sNi40sz' \
    --storeId 'uwoWPseM' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetCategory' test.out

#- 286 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '49so4qa2' \
    --namespace "$AB_NAMESPACE" \
    --language 'AdnTuflE' \
    --storeId 'Z764dHH1' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetChildCategories' test.out

#- 287 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'ZKbGIeUV' \
    --namespace "$AB_NAMESPACE" \
    --language 'an3HR1OS' \
    --storeId 'hxdQPmDw' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetDescendantCategories' test.out

#- 288 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 288 'PublicListCurrencies' test.out

#- 289 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'e5U7aDAi' \
    --region 'ExnRawwc' \
    --storeId 'u3sYz7J1' \
    --appId 'IIxa34Mx' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetItemByAppId' test.out

#- 290 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'kci6wF1s' \
    --categoryPath 'livUjL9S' \
    --features 'uzhrraLP' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'MXhys4ck' \
    --limit '60' \
    --offset '72' \
    --region 'mOtOkLLg' \
    --sortBy 'createdAt:asc,displayOrder,displayOrder:desc' \
    --storeId 'D2jhfRVu' \
    --tags 'RNwskQx8' \
    > test.out 2>&1
eval_tap $? 290 'PublicQueryItems' test.out

#- 291 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'ZdzlRiZB' \
    --region 'mLyOvJRq' \
    --storeId 'p7LrYCqV' \
    --sku 'VILlHptA' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetItemBySku' test.out

#- 292 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'S6wy2keR' \
    --region 'PwWwXmre' \
    --storeId 'NIpiQU9q' \
    --itemIds 'WGcVc9X1' \
    > test.out 2>&1
eval_tap $? 292 'PublicBulkGetItems' test.out

#- 293 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["Vk9lIOxr", "9Bj8njgn", "U9ZI9yP8"]}' \
    > test.out 2>&1
eval_tap $? 293 'PublicValidateItemPurchaseCondition' test.out

#- 294 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'INGAMEITEM' \
    --limit '50' \
    --offset '72' \
    --region 'vVXPbuVa' \
    --storeId 'dm75I6EL' \
    --keyword 'DE5RscUf' \
    --language '4T9WFDAS' \
    > test.out 2>&1
eval_tap $? 294 'PublicSearchItems' test.out

#- 295 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'djgrfvzk' \
    --namespace "$AB_NAMESPACE" \
    --language 'Fe1eQqfE' \
    --region 'EJNN9sxV' \
    --storeId 'FrCbT1f0' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetApp' test.out

#- 296 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'Rth5baOd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 296 'PublicGetItemDynamicData' test.out

#- 297 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'HaqAMUvs' \
    --namespace "$AB_NAMESPACE" \
    --language 'jCyAKFiS' \
    --populateBundle  \
    --region 'iBBIheR7' \
    --storeId 'tmea1UE8' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetItem' test.out

#- 298 GetPaymentCustomization
eval_tap 0 298 'GetPaymentCustomization # SKIP deprecated' test.out

#- 299 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "yeFZt7vQ", "paymentProvider": "STRIPE", "returnUrl": "myQ22Hc6", "ui": "5Lwd8sNs", "zipCode": "icFlXbpD"}' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetPaymentUrl' test.out

#- 300 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Td6M5woG' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetPaymentMethods' test.out

#- 301 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TZo346BS' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetUnpaidPaymentOrder' test.out

#- 302 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qtLamMxj' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'NFFSD1uf' \
    --body '{"token": "q4rbwQfE"}' \
    > test.out 2>&1
eval_tap $? 302 'Pay' test.out

#- 303 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2fealeDC' \
    > test.out 2>&1
eval_tap $? 303 'PublicCheckPaymentOrderPaidStatus' test.out

#- 304 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'Ez2w3reD' \
    > test.out 2>&1
eval_tap $? 304 'GetPaymentPublicConfig' test.out

#- 305 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'TwN0dIz4' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetQRCode' test.out

#- 306 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'sRHPc0UJ' \
    --foreinginvoice 'QIhnyU8H' \
    --invoiceId 'ApbAoqYL' \
    --payload 'Iyrx8G7p' \
    --redirectResult 'hJCmqlOw' \
    --resultCode 'eYB0feBe' \
    --sessionId 'rEvz4p57' \
    --status 'KxQ0KaCz' \
    --token 'uRSXO70N' \
    --type 'ehh8vm9K' \
    --userId 'DBP6VsCn' \
    --orderNo 'hIZuUfwL' \
    --paymentOrderNo 'qM1KSoW6' \
    --paymentProvider 'WALLET' \
    --returnUrl 'GfP5nvK5' \
    > test.out 2>&1
eval_tap $? 306 'PublicNormalizePaymentReturnUrl' test.out

#- 307 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '67l1Iue9' \
    --paymentOrderNo 'LOrVhsx6' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 307 'GetPaymentTaxValue' test.out

#- 308 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'bbnHU4zb' \
    > test.out 2>&1
eval_tap $? 308 'GetRewardByCode' test.out

#- 309 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'ZURW2ScD' \
    --limit '41' \
    --offset '87' \
    --sortBy 'rewardCode,namespace:asc' \
    > test.out 2>&1
eval_tap $? 309 'QueryRewards1' test.out

#- 310 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'DDyV5p9e' \
    > test.out 2>&1
eval_tap $? 310 'GetReward1' test.out

#- 311 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'PublicListStores' test.out

#- 312 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'bS7ZOuhg,ysYDRrUi,VDpnT6di' \
    --itemIds 'aQzplbQ0,uudWc7ZU,2aH6I9ci' \
    --skus '9JMqfgQZ,fWNiWr6D,VzvyuTwu' \
    > test.out 2>&1
eval_tap $? 312 'PublicExistsAnyMyActiveEntitlement' test.out

#- 313 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'eTWoy5cI' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 314 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'ywMXxQpt' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 315 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'DMJjJ45M' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 316 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'vLSm86un,8AVfYg9o,pFhnV1Zq' \
    --itemIds '3AkYBeNn,fgcP3X5U,N1nc6YxL' \
    --skus 'Iq0kkLXL,hRZA5Pbj,h44zznnm' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetEntitlementOwnershipToken' test.out

#- 317 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'kmtvbKUq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'PublicGetMyWallet' test.out

#- 318 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'yA8KIhD7' \
    --body '{"epicGamesJwtToken": "Xni8EqSh"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncEpicGameDLC' test.out

#- 319 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'EUVvYaLf' \
    --body '{"serviceLabel": 1}' \
    > test.out 2>&1
eval_tap $? 319 'PublicSyncPsnDlcInventory' test.out

#- 320 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '4GXqHgOV' \
    --body '{"serviceLabels": [60, 77, 76]}' \
    > test.out 2>&1
eval_tap $? 320 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 321 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'DRueL18h' \
    --body '{"appId": "8bEDcWkS", "steamId": "kVlDmXCC"}' \
    > test.out 2>&1
eval_tap $? 321 'SyncSteamDLC' test.out

#- 322 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'wzOMPF4m' \
    --body '{"xstsToken": "4U7WIen3"}' \
    > test.out 2>&1
eval_tap $? 322 'SyncXboxDLC' test.out

#- 323 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XhmJ0cix' \
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName '6nog78dD' \
    --features '63SdnFGF,wceT62iN,eHGFx2eG' \
    --itemId 'tmOMcfuc,dfWffeCq,q4Z0qwke' \
    --limit '67' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 323 'PublicQueryUserEntitlements' test.out

#- 324 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCylfKlc' \
    --appId 'gPgzkykQ' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserAppEntitlementByAppId' test.out

#- 325 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'gdTvi9Se' \
    --limit '26' \
    --offset '0' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 325 'PublicQueryUserEntitlementsByAppType' test.out

#- 326 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9r3pWWHK' \
    --entitlementClazz 'MEDIA' \
    --itemId 'P0ry5LzY' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserEntitlementByItemId' test.out

#- 327 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'jvTU0DHX' \
    --entitlementClazz 'MEDIA' \
    --sku 'lUIQ7rXE' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementBySku' test.out

#- 328 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QFJ1uwDe' \
    --appIds '3REdUIIs,FOLoFw6b,aSglRnx7' \
    --itemIds '5lmd1RsP,G0ug6CHr,KTMVolcx' \
    --skus 'pmEgBo7W,3ZtZ29zk,af2Rz95q' \
    > test.out 2>&1
eval_tap $? 328 'PublicExistsAnyUserActiveEntitlement' test.out

#- 329 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'nZDCOo67' \
    --appId 'H0ugJYg3' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 330 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'GpRXp8Pc' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'Fpr7co8o' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 331 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nCCfQ6WA' \
    --ids 'MntLR439,qDkhLBGF,m5vXK4cA' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 332 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'MoLRPvSu' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku '9DnWCIZI' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 333 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'SrGAHnAy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L2Ui9HcS' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetUserEntitlement' test.out

#- 334 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'Lcw7dikC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KB8BQAUx' \
    --body '{"options": ["ToUA5j0U", "hCADaGhC", "yfY1UZI8"], "requestId": "9HEYyiyE", "useCount": 36}' \
    > test.out 2>&1
eval_tap $? 334 'PublicConsumeUserEntitlement' test.out

#- 335 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'cRfyIncT' \
    --body '{"code": "ywICemrZ", "language": "XBvB-941", "region": "0Qg0B6gq"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicRedeemCode' test.out

#- 336 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiheLtGV' \
    --body '{"excludeOldTransactions": false, "language": "noni", "productId": "fO3RTIjV", "receiptData": "tHeqZlJX", "region": "F4Y5zlgY", "transactionId": "jet6VB4T"}' \
    > test.out 2>&1
eval_tap $? 336 'PublicFulfillAppleIAPItem' test.out

#- 337 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'lFzJj932' \
    --body '{"epicGamesJwtToken": "ub2Q2CBu"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncEpicGamesInventory' test.out

#- 338 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7oNLAbd' \
    --body '{"autoAck": true, "language": "kxXR", "orderId": "npQjfWyV", "packageName": "s8gRX2YH", "productId": "gWrNRNXr", "purchaseTime": 49, "purchaseToken": "1tBH6W8t", "region": "jPFGPyhS"}' \
    > test.out 2>&1
eval_tap $? 338 'PublicFulfillGoogleIAPItem' test.out

#- 339 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '2RHqNZOz' \
    --body '{"currencyCode": "Gy4M32a9", "price": 0.654369196062477, "productId": "C9XAJDJe", "serviceLabel": 64}' \
    > test.out 2>&1
eval_tap $? 339 'PublicReconcilePlayStationStore' test.out

#- 340 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'gVLr6eOH' \
    --body '{"currencyCode": "ZkN4qI6P", "price": 0.18145458301183715, "productId": "mV8mhQw5", "serviceLabels": [80, 3, 38]}' \
    > test.out 2>&1
eval_tap $? 340 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 341 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'U74bsT8D' \
    --body '{"appId": "qf4I2nG6", "language": "HbXV-XX", "region": "nGh056ev", "stadiaPlayerId": "Nxd1SFFu"}' \
    > test.out 2>&1
eval_tap $? 341 'SyncStadiaEntitlement' test.out

#- 342 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'sbmtStsf' \
    --body '{"appId": "bKpD4Pce", "currencyCode": "Wvq7VyAs", "language": "XWQO-788", "price": 0.36073945393311035, "productId": "YlOaquMJ", "region": "fER4FP6L", "steamId": "8MmbV7Z8"}' \
    > test.out 2>&1
eval_tap $? 342 'SyncSteamInventory' test.out

#- 343 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '0ghTODpd' \
    --body '{"gameId": "R8rS5YGS", "language": "OrDm", "region": "uPSyrTVC"}' \
    > test.out 2>&1
eval_tap $? 343 'SyncTwitchDropsEntitlement' test.out

#- 344 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'e4cBMRUM' \
    --body '{"currencyCode": "EsYXv9Uu", "price": 0.17865658354953007, "productId": "AjSZaMdH", "xstsToken": "4ZTZ1olL"}' \
    > test.out 2>&1
eval_tap $? 344 'SyncXboxInventory' test.out

#- 345 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'qtWQSUHQ' \
    --itemId 'LeLfepKm' \
    --limit '6' \
    --offset '40' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 345 'PublicQueryUserOrders' test.out

#- 346 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '702o2rMd' \
    --body '{"currencyCode": "5KNulfdy", "discountedPrice": 91, "ext": {"em1oWgAM": {}, "TsjrbNpv": {}, "PVnw5tME": {}}, "itemId": "y65p6oYg", "language": "sl_CBUs-758", "price": 33, "quantity": 23, "region": "nPCeuDs7", "returnUrl": "iyt10Y3r"}' \
    > test.out 2>&1
eval_tap $? 346 'PublicCreateUserOrder' test.out

#- 347 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oQtqO0f6' \
    --userId 'GlFBWjPY' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserOrder' test.out

#- 348 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'i0mDkc7S' \
    --userId 'iMgfeUDi' \
    > test.out 2>&1
eval_tap $? 348 'PublicCancelUserOrder' test.out

#- 349 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'h6xrOR5x' \
    --userId 'eP5cdUnz' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetUserOrderHistories' test.out

#- 350 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QyWBsLnB' \
    --userId 'Hd4cJAT4' \
    > test.out 2>&1
eval_tap $? 350 'PublicDownloadUserOrderReceipt' test.out

#- 351 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'Id7Hkqxw' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetPaymentAccounts' test.out

#- 352 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'mydXwvJI' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'KteTizuk' \
    > test.out 2>&1
eval_tap $? 352 'PublicDeletePaymentAccount' test.out

#- 353 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIsAGMdu' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'UpbgKDpY' \
    --limit '61' \
    --offset '20' \
    --sku 'qbqYmJ3d' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 353 'PublicQueryUserSubscriptions' test.out

#- 354 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '8sraIGYZ' \
    --body '{"currencyCode": "U8PG6Ua5", "itemId": "Lno35D7w", "language": "BGR_iFTF", "region": "DRkeMH1g", "returnUrl": "uMT4aInP", "source": "pjrYshfm"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicSubscribeSubscription' test.out

#- 355 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'I2Be825j' \
    --itemId 'NRCahV76' \
    > test.out 2>&1
eval_tap $? 355 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 356 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'leb0f16C' \
    --userId 'pX5wz92z' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetUserSubscription' test.out

#- 357 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'X8UjNIz2' \
    --userId 'G63D5sLg' \
    > test.out 2>&1
eval_tap $? 357 'PublicChangeSubscriptionBillingAccount' test.out

#- 358 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6mN25ZO0' \
    --userId '7tmeq7Ao' \
    --body '{"immediate": false, "reason": "Fk5GJgl9"}' \
    > test.out 2>&1
eval_tap $? 358 'PublicCancelSubscription' test.out

#- 359 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Osv4wVKj' \
    --userId 'yG67uyVd' \
    --excludeFree  \
    --limit '97' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetUserSubscriptionBillingHistories' test.out

#- 360 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'lCKGZ8FZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WaTsZwwk' \
    > test.out 2>&1
eval_tap $? 360 'PublicGetWallet' test.out

#- 361 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'kJTDiVOG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jnhp7NH3' \
    --limit '15' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 361 'PublicListUserWalletTransactions' test.out

#- 362 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate '2XnggGEd' \
    --baseAppId 'XtMQd9KE' \
    --categoryPath '114ksOZc' \
    --features 'XNXUxddj' \
    --includeSubCategoryItem  \
    --itemName '5bSXJNnd' \
    --itemStatus 'INACTIVE' \
    --itemType 'COINS' \
    --limit '6' \
    --offset '95' \
    --region 'DBjPZHhk' \
    --sortBy 'createdAt,name,displayOrder:asc' \
    --storeId 'SK8HSlX2' \
    --tags 'uG9yxbGV' \
    --targetNamespace 'Ht8UkxGL' \
    > test.out 2>&1
eval_tap $? 362 'QueryItems1' test.out

#- 363 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '88eI97ZX' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 363 'ImportStore1' test.out

#- 364 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YsRbWGKa' \
    --body '{"itemIds": ["7mN3YP4A", "aRZaSACS", "73OUInRm"]}' \
    > test.out 2>&1
eval_tap $? 364 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE