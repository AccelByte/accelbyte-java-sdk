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
echo "1..356"

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
    --body '{"context": {"item": {"appId": "wgjfIHrS", "appType": "GAME", "baseAppId": "kwSibdse", "boothName": "j8x5BRMo", "boundItemIds": ["UsrUHyP2", "LjkLeBLq", "hmsl8hws"], "categoryPath": "khYmXKo8", "clazz": "XazMegPF", "createdAt": "1981-02-26T00:00:00Z", "description": "2aAHz6nK", "displayOrder": 77, "entitlementType": "CONSUMABLE", "ext": {"7hQgqLhb": {}, "edVMqNoP": {}, "1rh8HFX0": {}}, "features": ["bRzfqVuv", "Ybs2PzNm", "x9I8ZomD"], "fresh": false, "images": [{"as": "ypYVmH27", "caption": "2Qq2DQlE", "height": 67, "imageUrl": "GeLuHEl8", "smallImageUrl": "RJ6Go2IZ", "width": 74}, {"as": "KTaFeAvA", "caption": "PQl1i3s2", "height": 93, "imageUrl": "z86MrYr4", "smallImageUrl": "RQDacroo", "width": 7}, {"as": "GYExisPJ", "caption": "TWVfGULw", "height": 64, "imageUrl": "8nX90znV", "smallImageUrl": "RdJ58wvg", "width": 65}], "itemId": "xfMV42ht", "itemIds": ["J0VFRUAm", "Wo6nE3DI", "NidJnv9T"], "itemQty": {"NRVljklX": 78, "4gtQEhbP": 14, "IYMAVpx6": 16}, "itemType": "SEASON", "language": "y9nySxxr", "listable": false, "localExt": {"v1Cjh4sQ": {}, "6kOiWLqY": {}, "a8QJJmK5": {}}, "longDescription": "k7RqHmvX", "maxCount": 27, "maxCountPerUser": 80, "name": "x5cOdN0g", "namespace": "zN0dkGgk", "optionBoxConfig": {"boxItems": [{"count": 18, "itemId": "QyR82W9x", "itemSku": "J4jqNIoD"}, {"count": 15, "itemId": "6eph7Y5d", "itemSku": "Wkik0MRJ"}, {"count": 34, "itemId": "58NZiFoH", "itemSku": "BwRgdXUl"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 12, "comparison": "isLessThanOrEqual", "name": "QvPcWpcV", "predicateType": "EntitlementPredicate", "value": "4jmPAQao", "values": ["8khg0Om7", "Ys8T3aB2", "FN19hpm5"]}, {"anyOf": 70, "comparison": "excludes", "name": "lVWwpaMF", "predicateType": "SeasonPassPredicate", "value": "AhZxWdjU", "values": ["Bb8IhsLF", "oofqCbz7", "6xmlxK0U"]}, {"anyOf": 27, "comparison": "isGreaterThan", "name": "phGzBkXj", "predicateType": "SeasonPassPredicate", "value": "R5B4UUFr", "values": ["pxIQfDP6", "IZUZ49As", "NsdoxLpR"]}]}, {"operator": "or", "predicates": [{"anyOf": 33, "comparison": "isLessThanOrEqual", "name": "YpwecTKM", "predicateType": "SeasonPassPredicate", "value": "gXmufDMC", "values": ["jOdtdv3l", "cr52wGmJ", "ACP3kZA5"]}, {"anyOf": 100, "comparison": "excludes", "name": "p6Ex8hHR", "predicateType": "EntitlementPredicate", "value": "q8cxybbW", "values": ["478tRf5K", "vywnVCNW", "XVoXhJIU"]}, {"anyOf": 40, "comparison": "is", "name": "WvEL0G5p", "predicateType": "SeasonPassPredicate", "value": "DY8Fr57E", "values": ["MwnY9xWz", "uVxa8uwo", "Go6ejrIv"]}]}, {"operator": "and", "predicates": [{"anyOf": 57, "comparison": "isGreaterThanOrEqual", "name": "20aceVXo", "predicateType": "EntitlementPredicate", "value": "ZQalNWUL", "values": ["KJirvLx8", "8jIooBE7", "w2AdDDDQ"]}, {"anyOf": 2, "comparison": "isLessThanOrEqual", "name": "92d2XAax", "predicateType": "EntitlementPredicate", "value": "4qg8irhg", "values": ["LAOaWUVZ", "jKarfEOS", "Fvw9eBT3"]}, {"anyOf": 79, "comparison": "isGreaterThan", "name": "WDBjM9pS", "predicateType": "EntitlementPredicate", "value": "9zAfW4pv", "values": ["i3Xuxiag", "JjeFwHLm", "REpxd2ky"]}]}]}, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 17, "fixedTrialCycles": 36, "graceDays": 5}, "region": "Qg6yhL5G", "regionData": [{"currencyCode": "JQxViYWq", "currencyNamespace": "CsI0QqDm", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1996-07-15T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1974-01-27T00:00:00Z", "discountedPrice": 69, "expireAt": "1996-12-22T00:00:00Z", "price": 95, "purchaseAt": "1976-01-05T00:00:00Z", "trialPrice": 72}, {"currencyCode": "4ImPPaxv", "currencyNamespace": "vzQJ3Q3G", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1972-07-25T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1994-12-16T00:00:00Z", "discountedPrice": 55, "expireAt": "1997-11-25T00:00:00Z", "price": 90, "purchaseAt": "1990-04-26T00:00:00Z", "trialPrice": 22}, {"currencyCode": "atIAfEVf", "currencyNamespace": "yHeZcPN1", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1990-08-10T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1972-07-14T00:00:00Z", "discountedPrice": 22, "expireAt": "1978-01-10T00:00:00Z", "price": 48, "purchaseAt": "1999-09-27T00:00:00Z", "trialPrice": 61}], "seasonType": "TIER", "sku": "n3y96tF6", "stackable": true, "status": "ACTIVE", "tags": ["zAd4o9rg", "Uw7jjFm6", "kbdMOPtd"], "targetCurrencyCode": "Zq3nFx5l", "targetItemId": "17EwpbEE", "targetNamespace": "VcOu3Xmq", "thumbnailUrl": "kqovt5Lb", "title": "H328dVDZ", "updatedAt": "1993-05-07T00:00:00Z", "useCount": 5}, "namespace": "Brwak6jD", "order": {"currency": {"currencyCode": "D6KP0huF", "currencySymbol": "lq04NRdv", "currencyType": "VIRTUAL", "decimals": 31, "namespace": "Rhi9fyzM"}, "ext": {"WzUtz03A": {}, "a4grOyGs": {}, "ipxigk9C": {}}, "free": true}, "source": "REWARD"}, "script": "QlLkbxp0", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'Ov5splju' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'IJFWxLCH' \
    --body '{"grantDays": "waHHYHH3"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'tjNkrIts' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'oBjt8z4k' \
    --body '{"grantDays": "Ib4jOn7T"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "wuuiSd5r", "dryRun": false, "fulfillmentUrl": "NwcuYUdV", "itemType": "SEASON", "purchaseConditionUrl": "mUUKMy9n"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'CYkLSusK' \
    --itemType 'APP' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'vNLXxmAB' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'XMCw0G0M' \
    --body '{"clazz": "RIZa3CAQ", "dryRun": true, "fulfillmentUrl": "7e50Aoet", "purchaseConditionUrl": "ljRkZJbM"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'rZdTTi92' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --name 'aZdxejAG' \
    --offset '47' \
    --tag 'SqdllZoU' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "mOShESgL", "items": [{"extraSubscriptionDays": 68, "itemId": "oG4tjWYH", "itemName": "u2our2st", "quantity": 18}, {"extraSubscriptionDays": 24, "itemId": "2U42B6Er", "itemName": "CVSNYd6T", "quantity": 27}, {"extraSubscriptionDays": 58, "itemId": "Z47osoCd", "itemName": "YBbgM4Ub", "quantity": 26}], "maxRedeemCountPerCampaignPerUser": 97, "maxRedeemCountPerCode": 83, "maxRedeemCountPerCodePerUser": 95, "maxSaleCount": 33, "name": "3ryHzdEq", "redeemEnd": "1981-07-20T00:00:00Z", "redeemStart": "1971-03-17T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["tLfQ7L9l", "JzbjvsPY", "pWfv7mwV"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'ElS8l2XT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '3pioDV2h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "vM4pwa9h", "items": [{"extraSubscriptionDays": 82, "itemId": "WRl6FNR5", "itemName": "oNuUK2cK", "quantity": 13}, {"extraSubscriptionDays": 75, "itemId": "RiW4QSi8", "itemName": "tDgIsoTz", "quantity": 22}, {"extraSubscriptionDays": 84, "itemId": "SPTadQFM", "itemName": "vn2m2GvT", "quantity": 32}], "maxRedeemCountPerCampaignPerUser": 14, "maxRedeemCountPerCode": 29, "maxRedeemCountPerCodePerUser": 33, "maxSaleCount": 87, "name": "oQ9LhupB", "redeemEnd": "1985-02-07T00:00:00Z", "redeemStart": "1977-09-01T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["6SbYWc9A", "FE7htZb7", "I6J1dU00"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'KH6XOSYJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '5800o1i3' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NPdQwsUx' \
    --body '{"categoryPath": "IdRaKSfN", "localizationDisplayNames": {"aQ3nu4wy": "YWcsVcuF", "l4Dp5O8b": "roW7bap5", "ACK9qXmk": "70EdbstU"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DLNodlgB' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'euSbUpNV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mCWbe5kC' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'Ee4S8T7B' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MetWNB3N' \
    --body '{"localizationDisplayNames": {"mDFVr0AV": "BXlx7Gqp", "wV9abSa6": "SPcQOhkb", "A2LMxPGa": "nMG94eMR"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '9mHP3nTr' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K6QTJgFy' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'DF7TzdJW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZJdXcbFO' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'JHjMD37E' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EMspLb3H' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '87J3slU5' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '4' \
    --code 'c9GI4tCk' \
    --limit '49' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'mjjDjKXp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 13}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '0u0BAEt0' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '86' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '8YUEzp4S' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '42' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'lcyfcScA' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '72' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'IyDVQRNQ' \
    --namespace "$AB_NAMESPACE" \
    --code 'c3UFpQxX' \
    --limit '25' \
    --offset '32' \
    --userId 'BDL2EXc2' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '22YrE8zN' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'wAsFfODq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'NrpOsmaT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EnableCode' test.out

#- 36 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 36 'ListCurrencies' test.out

#- 37 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "WvQndIWZ", "currencySymbol": "t4aV55W0", "currencyType": "REAL", "decimals": 4, "localizationDescriptions": {"ipLTVZ2H": "T2Ydg0Y1", "VMEW9AJN": "kIbonbNI", "hJNnpZ8v": "5Pj9uY2r"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'QxremLsM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"VrnFnSHe": "j3y8gZK9", "mhYhU1li": "CCvKS1fp", "Q4LUaZhf": "CirYjpE5"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'xDWc5Cqu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'oFCTJPJX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'iAUK6AoT' \
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
    --body '{"data": [{"id": "xf5X0eBF", "rewards": [{"currency": {"currencyCode": "EvZbsKVY", "namespace": "tzZC6kbF"}, "item": {"itemId": "AdWboJ86", "itemSku": "TeRySv93", "itemType": "xrc9y5kW"}, "quantity": 38, "type": "ITEM"}, {"currency": {"currencyCode": "HoVq5Ay4", "namespace": "qyzcaIol"}, "item": {"itemId": "D2wUSrR6", "itemSku": "xrwvOwf6", "itemType": "WxTx1mrP"}, "quantity": 84, "type": "ITEM"}, {"currency": {"currencyCode": "B5KWsYJO", "namespace": "R736VgQU"}, "item": {"itemId": "1QDEg2SM", "itemSku": "xfjKm9eT", "itemType": "BJ9XDqRV"}, "quantity": 29, "type": "ITEM"}]}, {"id": "YSvMUHDj", "rewards": [{"currency": {"currencyCode": "PtbKvG61", "namespace": "pisa1IRB"}, "item": {"itemId": "TZIFIqWv", "itemSku": "PclfYBgw", "itemType": "72LBYl4S"}, "quantity": 48, "type": "CURRENCY"}, {"currency": {"currencyCode": "F4lT6B0h", "namespace": "W4G0Xy4f"}, "item": {"itemId": "2QSK3wSC", "itemSku": "qd3euBoZ", "itemType": "8ETkNiZC"}, "quantity": 42, "type": "ITEM"}, {"currency": {"currencyCode": "I8Fsa457", "namespace": "S33rYKYD"}, "item": {"itemId": "6mZiUbSr", "itemSku": "qJWQJLqK", "itemType": "7QehjOVd"}, "quantity": 64, "type": "ITEM"}]}, {"id": "XOMVTjTU", "rewards": [{"currency": {"currencyCode": "RVbeH8LI", "namespace": "GzHUJpEF"}, "item": {"itemId": "zLHmYuC2", "itemSku": "SRKcS1xZ", "itemType": "E1141MOv"}, "quantity": 76, "type": "CURRENCY"}, {"currency": {"currencyCode": "8CBKgEYH", "namespace": "zCCS7Ter"}, "item": {"itemId": "feMzIY2k", "itemSku": "HTnHXQhM", "itemType": "SN1cQMwz"}, "quantity": 85, "type": "CURRENCY"}, {"currency": {"currencyCode": "A1PIyuN4", "namespace": "Nyet2S3I"}, "item": {"itemId": "fRU1KCdd", "itemSku": "78WPcEvk", "itemType": "WbaZ1R4U"}, "quantity": 74, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"C328xBrZ": "NpCuChBU", "l9NRnY1x": "5o8r0DhC", "dXPZbgeM": "O2rpeTke"}}, {"platform": "PSN", "platformDlcIdMap": {"vcgtmfpN": "YkoB9V1b", "rFhAV2Eq": "8TWcBH5c", "Hur7oUos": "jFu30c1l"}}, {"platform": "STEAM", "platformDlcIdMap": {"04AA5NTm": "dJl0X0xU", "NHHK2644": "cawYR6T9", "Janzwpz3": "HpN5ZT1W"}}]}' \
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
    --appType 'GAME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'LxMFn2bC' \
    --itemId 'pduoH6ON,dUWKzwxu,SctygxIm' \
    --limit '70' \
    --offset '10' \
    --userId 'GxttLQ5O' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'lhrYZ1GG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '95' \
    --status 'SUCCESS' \
    --userId 'ObWJzHB9' \
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
    --body '{"bundleId": "aGoz0YN8", "password": "Uhppo4xZ"}' \
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
    --body '{"sandboxId": "UCHuCPdI"}' \
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
    --body '{"applicationName": "VmTlM5vx", "serviceAccountId": "2OsXUtYb"}' \
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
    --body '{"data": [{"itemIdentity": "aoGKrxBL", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"axRa5crl": "36yr0SUB", "awug5Ouf": "yeLaq3p2", "Z9hu9UNw": "ZQ98P0QU"}}, {"itemIdentity": "UXRaYzrl", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"6gSqat0E": "iumR1yln", "XNDof1Gr": "ANdD8hPn", "0IEBC1oX": "YM7eOZ2g"}}, {"itemIdentity": "XhN8QeMG", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"fbHgwhwr": "4vfnCHyN", "ivp168zs": "6le92ZyK", "UyzQLDGk": "kxDy0puL"}}]}' \
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
    --body '{"environment": "W5zWoDiE"}' \
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
    --body '{"appId": "3fz9Nb3l", "publisherAuthenticationKey": "PbsW41OL"}' \
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
    --body '{"clientId": "h1lIFplU", "clientSecret": "xFQ4yEKK", "organizationId": "Gicoea3m"}' \
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
    --body '{"relyingPartyCert": "V4rbDx9G"}' \
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
    --password '2o6SArIh' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'pRZA017v' \
    --itemId 'xJewkfgK' \
    --itemType 'BUNDLE' \
    --endTime 'LheoI2Jb' \
    --startTime 'Rr4MH9ab' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'gWMo7BZv' \
    --itemId 'jWjR2BCk' \
    --itemType 'CODE' \
    --endTime 'Nnk9TGzt' \
    --startTime 'djsoj44T' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UndcmH8S' \
    --body '{"categoryPath": "RPZKqDE0", "targetItemId": "7ccZYPoC", "targetNamespace": "gaLXhHvr"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ocns5eWo' \
    --body '{"appId": "DrMqgKqx", "appType": "SOFTWARE", "baseAppId": "WKbCOjj2", "boothName": "CvUoRYGi", "categoryPath": "oX2suCLs", "clazz": "BfkmZIrI", "displayOrder": 14, "entitlementType": "CONSUMABLE", "ext": {"D5ihEC4g": {}, "ChAcHONm": {}, "v3kXugXS": {}}, "features": ["Suy2N17O", "wgaFQPDb", "JUxlOuRs"], "images": [{"as": "ugD6ykQZ", "caption": "yaQsf39x", "height": 79, "imageUrl": "uybLc5I2", "smallImageUrl": "36WmUR1L", "width": 55}, {"as": "p3uaJBqg", "caption": "nYU5L10r", "height": 29, "imageUrl": "aj9Gs6kc", "smallImageUrl": "QTLHulfZ", "width": 83}, {"as": "C5LXVXu7", "caption": "GmyLmOD7", "height": 6, "imageUrl": "ZZm2vGxQ", "smallImageUrl": "RiCgPOL4", "width": 75}], "itemIds": ["DCLtJyLX", "EPcSHSRL", "TvUc6exH"], "itemQty": {"iNOI3lLY": 94, "IipEtxoZ": 6, "4KxJAKhH": 49}, "itemType": "MEDIA", "listable": false, "localizations": {"ej1jMzPZ": {"description": "RsczNrgQ", "localExt": {"Xy5W0gCC": {}, "e2rXPY6S": {}, "45aBLLg0": {}}, "longDescription": "skYMPSL0", "title": "cuT5lWa4"}, "J4djCXVq": {"description": "vEsK8CnF", "localExt": {"cbDgnxs2": {}, "7edc6OWH": {}, "Pu0evbrv": {}}, "longDescription": "Iwf8Ybhy", "title": "y5WOPCEg"}, "VwfwuWvt": {"description": "cTdtNWOP", "localExt": {"6dHNulDO": {}, "5RT0Gc8Q": {}, "0T5ymDCY": {}}, "longDescription": "N5LiVpWm", "title": "f1qadla4"}}, "maxCount": 33, "maxCountPerUser": 38, "name": "do8ehctX", "optionBoxConfig": {"boxItems": [{"count": 48, "itemId": "Dep42NRB", "itemSku": "p4Cv2SEF"}, {"count": 96, "itemId": "VW9d50E6", "itemSku": "F5PQgeil"}, {"count": 0, "itemId": "VEpkJdx7", "itemSku": "tAfC3cEl"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 8, "fixedTrialCycles": 41, "graceDays": 69}, "regionData": {"tohz0YwJ": [{"currencyCode": "u7S92C5o", "currencyNamespace": "m33Tqt2H", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1988-10-03T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1992-02-26T00:00:00Z", "discountedPrice": 34, "expireAt": "1974-01-25T00:00:00Z", "price": 57, "purchaseAt": "1998-12-14T00:00:00Z", "trialPrice": 27}, {"currencyCode": "FVVn2c5X", "currencyNamespace": "QIVEfqDN", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1989-06-04T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1980-02-15T00:00:00Z", "discountedPrice": 3, "expireAt": "1980-04-24T00:00:00Z", "price": 15, "purchaseAt": "1972-01-16T00:00:00Z", "trialPrice": 48}, {"currencyCode": "TeAql4j4", "currencyNamespace": "40VHgmFg", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1975-03-14T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1984-05-23T00:00:00Z", "discountedPrice": 23, "expireAt": "1999-02-09T00:00:00Z", "price": 28, "purchaseAt": "1987-08-29T00:00:00Z", "trialPrice": 92}], "WUyME7gO": [{"currencyCode": "k4kozTLt", "currencyNamespace": "26fcWlC7", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1977-12-24T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1987-01-14T00:00:00Z", "discountedPrice": 26, "expireAt": "1978-11-09T00:00:00Z", "price": 60, "purchaseAt": "1979-03-03T00:00:00Z", "trialPrice": 6}, {"currencyCode": "jJDUqw1o", "currencyNamespace": "VJVvndcp", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1994-12-22T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1991-12-02T00:00:00Z", "discountedPrice": 68, "expireAt": "1987-04-11T00:00:00Z", "price": 23, "purchaseAt": "1982-04-03T00:00:00Z", "trialPrice": 96}, {"currencyCode": "x96DCrs5", "currencyNamespace": "s4knHbSz", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1984-01-05T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1992-06-29T00:00:00Z", "discountedPrice": 10, "expireAt": "1976-12-07T00:00:00Z", "price": 65, "purchaseAt": "1975-01-02T00:00:00Z", "trialPrice": 98}], "6tzHZpiR": [{"currencyCode": "t1zSLj3b", "currencyNamespace": "mMKs8h2e", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1999-07-18T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1971-03-26T00:00:00Z", "discountedPrice": 78, "expireAt": "1971-06-17T00:00:00Z", "price": 38, "purchaseAt": "1974-06-10T00:00:00Z", "trialPrice": 26}, {"currencyCode": "2wNe2EHs", "currencyNamespace": "EWpKKCFp", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1975-08-23T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1975-11-21T00:00:00Z", "discountedPrice": 98, "expireAt": "1987-01-31T00:00:00Z", "price": 70, "purchaseAt": "1999-03-13T00:00:00Z", "trialPrice": 16}, {"currencyCode": "XuWr4QI4", "currencyNamespace": "nP7fiamH", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1978-10-03T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1990-09-06T00:00:00Z", "discountedPrice": 39, "expireAt": "1976-12-31T00:00:00Z", "price": 38, "purchaseAt": "1975-10-13T00:00:00Z", "trialPrice": 72}]}, "seasonType": "PASS", "sku": "URpoKrlV", "stackable": true, "status": "ACTIVE", "tags": ["hjyHxnNT", "5qsfTya2", "BtdEo7m6"], "targetCurrencyCode": "5xqZNCMc", "targetNamespace": "iPiZOiH3", "thumbnailUrl": "g3SSoYjh", "useCount": 18}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'aBRRB86e' \
    --appId 'G04P6a8y' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate '20Zo5WYk' \
    --baseAppId 'M7Pv2Vqx' \
    --categoryPath 'BxjaaYGR' \
    --features 'msn4Pb0T' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --limit '52' \
    --offset '1' \
    --region 'E7UlfLYu' \
    --sortBy 'displayOrder:desc,name:asc,createdAt:asc' \
    --storeId '2oCLUvAo' \
    --tags 'gYLLBCuF' \
    --targetNamespace 'm1CPO25d' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'goxRhvff,GZOdc4Qt,1IVFbxKg' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hZW89Mqq' \
    --sku 'LfOvFSjD' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '3wVj9eME' \
    --populateBundle  \
    --region 'o1NH1LQ2' \
    --storeId 'wAgyruH4' \
    --sku '3FWT7KT9' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SrMUoqvJ' \
    --sku 'yGCJGNYm' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'XGajlRpL,h5yeNwvO,qnBOAA0V' \
    --storeId 'np8inb5p' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '7JWzd6Fw' \
    --region 'uW9aXR3B' \
    --storeId 'uJtKqtnP' \
    --itemIds 'HzZeHpgr' \
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
    --userId '0lFIUG6V' \
    --body '{"itemIds": ["DEVUqQ37", "I37pU7OR", "Vhf2IuSf"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '53' \
    --offset '4' \
    --storeId 'G4Ukl8mi' \
    --keyword '6SLYNzyM' \
    --language 'pF2oT57X' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '81' \
    --offset '94' \
    --sortBy 'updatedAt:asc,displayOrder:desc,updatedAt:desc' \
    --storeId 'fboSd499' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'h8X6NzJw' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'YRNjKBu1' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'sP45d3r6' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eeQAzjw3' \
    --body '{"appId": "ezSjzd04", "appType": "DEMO", "baseAppId": "xRoqsYPM", "boothName": "QGD7q603", "categoryPath": "7hn6NlES", "clazz": "kTl2loQP", "displayOrder": 47, "entitlementType": "DURABLE", "ext": {"EH7rZcC4": {}, "DWfLlUi9": {}, "y1YJ9nO5": {}}, "features": ["wiocq8kV", "DG8PyzE4", "kGiQb1hP"], "images": [{"as": "yopQRbPG", "caption": "VoP2e1MN", "height": 86, "imageUrl": "rYd1Yd9E", "smallImageUrl": "b22CJWAT", "width": 11}, {"as": "TCzkdhbi", "caption": "FPArVLT2", "height": 21, "imageUrl": "3MUUDQcZ", "smallImageUrl": "dewZCBUa", "width": 9}, {"as": "M7BYStfu", "caption": "G7Q93ZkT", "height": 32, "imageUrl": "pXqNFJxY", "smallImageUrl": "kyGCAn2H", "width": 90}], "itemIds": ["blb8LbeS", "RwhW2uyn", "0w9BZLx3"], "itemQty": {"gDjXZirs": 25, "zWPp5Emq": 18, "Aylps5yV": 99}, "itemType": "MEDIA", "listable": true, "localizations": {"Ek5OTNn2": {"description": "nUk2FYwg", "localExt": {"vtiZDzML": {}, "LjkDIpIb": {}, "tzpsy8RA": {}}, "longDescription": "fwp2d09w", "title": "SPHt0FvP"}, "EPsXLvDg": {"description": "RhiKHjMH", "localExt": {"VjSbzImS": {}, "tsYpt3z2": {}, "0GW1vK0d": {}}, "longDescription": "6lf46GtU", "title": "B6WQTLZ9"}, "ayxA6Q19": {"description": "eZkkTs0Q", "localExt": {"Sz6PFKvw": {}, "MR96IE8T": {}, "ybOS6Iiv": {}}, "longDescription": "VinF7SrG", "title": "DDeuMOCo"}}, "maxCount": 82, "maxCountPerUser": 5, "name": "ZYDpOA0Y", "optionBoxConfig": {"boxItems": [{"count": 13, "itemId": "0qCgcKmT", "itemSku": "IgkUayaF"}, {"count": 49, "itemId": "jB7YQ9j5", "itemSku": "tAwqQbuV"}, {"count": 39, "itemId": "YUUtYupV", "itemSku": "WDF1eBvr"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 75, "fixedTrialCycles": 76, "graceDays": 74}, "regionData": {"irOGnykF": [{"currencyCode": "Joj0p1rI", "currencyNamespace": "WfLfBjYx", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1996-04-09T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1977-08-26T00:00:00Z", "discountedPrice": 22, "expireAt": "1987-12-05T00:00:00Z", "price": 75, "purchaseAt": "1978-12-09T00:00:00Z", "trialPrice": 13}, {"currencyCode": "nKI6VuVU", "currencyNamespace": "OLY6Qs6b", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1983-09-15T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1995-06-03T00:00:00Z", "discountedPrice": 77, "expireAt": "1984-01-17T00:00:00Z", "price": 74, "purchaseAt": "1986-04-11T00:00:00Z", "trialPrice": 35}, {"currencyCode": "Q6eyrvX3", "currencyNamespace": "rgWWmjCg", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1989-04-10T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1976-08-10T00:00:00Z", "discountedPrice": 42, "expireAt": "1974-01-05T00:00:00Z", "price": 8, "purchaseAt": "1984-11-29T00:00:00Z", "trialPrice": 99}], "FuulksPy": [{"currencyCode": "ZaMa75k5", "currencyNamespace": "KM6o37gP", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1982-04-12T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1999-04-06T00:00:00Z", "discountedPrice": 25, "expireAt": "1976-01-19T00:00:00Z", "price": 41, "purchaseAt": "1989-01-21T00:00:00Z", "trialPrice": 35}, {"currencyCode": "HQ3D0FLH", "currencyNamespace": "0e7VRFcP", "currencyType": "VIRTUAL", "discountAmount": 59, "discountExpireAt": "1996-01-05T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1976-09-13T00:00:00Z", "discountedPrice": 2, "expireAt": "1985-11-08T00:00:00Z", "price": 88, "purchaseAt": "1985-07-27T00:00:00Z", "trialPrice": 24}, {"currencyCode": "tqG7P1j8", "currencyNamespace": "LT8xV7TQ", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1982-04-26T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1979-04-21T00:00:00Z", "discountedPrice": 20, "expireAt": "1974-07-19T00:00:00Z", "price": 52, "purchaseAt": "1984-10-15T00:00:00Z", "trialPrice": 77}], "4s1f6BVM": [{"currencyCode": "1qTt2HIO", "currencyNamespace": "gVS8nzDq", "currencyType": "REAL", "discountAmount": 61, "discountExpireAt": "1983-07-01T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1999-07-06T00:00:00Z", "discountedPrice": 47, "expireAt": "1997-12-21T00:00:00Z", "price": 48, "purchaseAt": "1982-01-02T00:00:00Z", "trialPrice": 0}, {"currencyCode": "1QyGjqhl", "currencyNamespace": "LiGCUJ1H", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1983-02-01T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-10-02T00:00:00Z", "discountedPrice": 27, "expireAt": "1981-04-09T00:00:00Z", "price": 57, "purchaseAt": "1976-07-24T00:00:00Z", "trialPrice": 12}, {"currencyCode": "MYrBPQAY", "currencyNamespace": "eM8pS6WH", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1973-02-23T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1974-09-08T00:00:00Z", "discountedPrice": 11, "expireAt": "1975-08-12T00:00:00Z", "price": 71, "purchaseAt": "1983-08-02T00:00:00Z", "trialPrice": 27}]}, "seasonType": "TIER", "sku": "eBAIDfiI", "stackable": false, "status": "INACTIVE", "tags": ["HAoRTjgE", "GGEoFPt1", "e2BqFohc"], "targetCurrencyCode": "ciMKvChp", "targetNamespace": "xuIs1jrT", "thumbnailUrl": "2DAcHGb8", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'BibuXIRR' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'HtDvCeAo' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'Jz7JhZnG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 75, "orderNo": "VgqpEMig"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '3KP2dn5y' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'y3sY2aGE' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'pc3AuF1M' \
    --namespace "$AB_NAMESPACE" \
    --storeId 't2YMEolo' \
    --body '{"carousel": [{"alt": "Z8p69ig2", "previewUrl": "kjoOyMYX", "thumbnailUrl": "VK2fcYLO", "type": "video", "url": "z794TQBc", "videoSource": "generic"}, {"alt": "e0bhXtYp", "previewUrl": "Pkw67xqr", "thumbnailUrl": "T0XoLBV9", "type": "image", "url": "gDAILClA", "videoSource": "vimeo"}, {"alt": "5HgsIGL5", "previewUrl": "uDv6shO9", "thumbnailUrl": "9DE2XCJI", "type": "image", "url": "e5xYDa03", "videoSource": "vimeo"}], "developer": "B659DpRg", "forumUrl": "4x68hOVU", "genres": ["Indie", "FreeToPlay", "Adventure"], "localizations": {"PqBTgek3": {"announcement": "KXVKM89J", "slogan": "hZzMm0pl"}, "CcbPLXCx": {"announcement": "dKg1NLg4", "slogan": "I1NWe4fS"}, "TfuKsiAe": {"announcement": "7JEOss9r", "slogan": "7Kn12lng"}}, "platformRequirements": {"zsv9p1cr": [{"additionals": "AUiKez6l", "directXVersion": "cz8FPwXW", "diskSpace": "W7FtyghL", "graphics": "9AGdXao4", "label": "4DQDMmlV", "osVersion": "pvtnwC2u", "processor": "i0Loj4rB", "ram": "P2V5kpO2", "soundCard": "U2kcFOSj"}, {"additionals": "ankwThNn", "directXVersion": "qUXCaDpN", "diskSpace": "8Fw2neJE", "graphics": "XZVwocl3", "label": "l1ydRqfc", "osVersion": "NoJUxC2O", "processor": "f0ptMFlu", "ram": "djcHy1QY", "soundCard": "xlCuNs1J"}, {"additionals": "V524NTh5", "directXVersion": "wQtc1IO9", "diskSpace": "InOkcGOL", "graphics": "ocVYCuzi", "label": "Do4ZCgb2", "osVersion": "wW8lfzLF", "processor": "dkYavHy6", "ram": "3sqebnBU", "soundCard": "Ek6wlYic"}], "t3XuzGBm": [{"additionals": "GyZzle4b", "directXVersion": "fNUv0K58", "diskSpace": "GGsin9pE", "graphics": "P6rzfDyf", "label": "O5QqBpHJ", "osVersion": "wCCcGZzB", "processor": "UH7t3DKz", "ram": "ZIE2Y2ox", "soundCard": "Bnhfh7rf"}, {"additionals": "KI8i4GdL", "directXVersion": "lzm703nj", "diskSpace": "t7lPh9fi", "graphics": "AzZvfesW", "label": "slhnRMuo", "osVersion": "XEe4RGWb", "processor": "mzCMqodS", "ram": "Wq5YBuE7", "soundCard": "SEqFU984"}, {"additionals": "UjS40VpF", "directXVersion": "wcQwlGdj", "diskSpace": "BoW6eqd3", "graphics": "Sdtt0Iiz", "label": "gsODRD3c", "osVersion": "5CSsFQFa", "processor": "QMlDymOQ", "ram": "DaMxRdLr", "soundCard": "tCxzIDeA"}], "2k5463wv": [{"additionals": "zPIpWUq8", "directXVersion": "faUh6Et8", "diskSpace": "ggg0z6J5", "graphics": "Y3aZZObK", "label": "aNNKrYto", "osVersion": "ni2sqiwY", "processor": "yTs7OoyY", "ram": "zidDZRw2", "soundCard": "DwfDeOJx"}, {"additionals": "uKNmxOXX", "directXVersion": "rEMyYZib", "diskSpace": "39aCXGhd", "graphics": "LTPwEvUH", "label": "A6CVCx9L", "osVersion": "bZKDallT", "processor": "g196DEDJ", "ram": "qXVmvE3m", "soundCard": "O8p1iu8t"}, {"additionals": "0RnCh45f", "directXVersion": "b3u6vuUJ", "diskSpace": "jBWHFJmp", "graphics": "X0ACtt9g", "label": "xP0z4EDb", "osVersion": "gVnqUjJC", "processor": "tkqIyANj", "ram": "1L1uBVSp", "soundCard": "AvwjDsq3"}]}, "platforms": ["Android", "Android", "IOS"], "players": ["Single", "Coop", "CrossPlatformMulti"], "primaryGenre": "Indie", "publisher": "HGbSMr4v", "releaseDate": "1997-10-25T00:00:00Z", "websiteUrl": "vvFMyeVB"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'sH058WP9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HW95zSph' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'BJ6N46W2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'tmIoTJLz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'g3x74xWn' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'jyHZWyLp' \
    --itemId 'J8HEetCr' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6MXiUuLu' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'bdAIwoVT' \
    --itemId 'ZGclkWXX' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2dRqK2Gp' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'So4xByuq' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'XTE3r2QG' \
    --populateBundle  \
    --region 'YxX04irY' \
    --storeId 'sOWTClkU' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'GrdMCq3O' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FDa8liKp' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 5, "comparison": "is", "name": "zQHE29Kp", "predicateType": "SeasonPassPredicate", "value": "ggouCMIu", "values": ["7veTAvKT", "srfTdhLz", "6iLlQBH4"]}, {"anyOf": 23, "comparison": "is", "name": "X0pw7S8a", "predicateType": "EntitlementPredicate", "value": "6lWR3PRn", "values": ["gDuNzokS", "iSPKw4h5", "Qm4CZ6aT"]}, {"anyOf": 6, "comparison": "isGreaterThanOrEqual", "name": "OqGPu802", "predicateType": "EntitlementPredicate", "value": "7j4O2eSa", "values": ["OPPPcnui", "9fCB0cTl", "eGx59F8y"]}]}, {"operator": "or", "predicates": [{"anyOf": 3, "comparison": "excludes", "name": "6GbqrNYM", "predicateType": "SeasonPassPredicate", "value": "s1BvCAwo", "values": ["a9niWeaj", "Ei1kVElc", "Dr4T6H1e"]}, {"anyOf": 59, "comparison": "isNot", "name": "eQCFzVvX", "predicateType": "EntitlementPredicate", "value": "DkogtMeW", "values": ["42DWOJ9z", "dLWsklHU", "JbXe8Rsa"]}, {"anyOf": 27, "comparison": "isNot", "name": "cBV0r64A", "predicateType": "SeasonTierPredicate", "value": "CxTepxmr", "values": ["DJF92tAF", "pytTPfBr", "YUWJ0gQ9"]}]}, {"operator": "and", "predicates": [{"anyOf": 65, "comparison": "isLessThanOrEqual", "name": "RQvy1NqX", "predicateType": "SeasonPassPredicate", "value": "G4vfY5Yo", "values": ["H0UCvplq", "81HpblZt", "REP4h53M"]}, {"anyOf": 0, "comparison": "isGreaterThan", "name": "uckEdwAy", "predicateType": "EntitlementPredicate", "value": "EmiqGsiB", "values": ["9wvBzM7r", "cWhSoFq7", "Y5RKSBIG"]}, {"anyOf": 64, "comparison": "is", "name": "kbFesqVo", "predicateType": "EntitlementPredicate", "value": "Na0bJ26S", "values": ["MpyTqHMG", "v0htjqxu", "Df5YqgZW"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'QZ6BKttV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "QlhVBaGs"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --name 'Lb0OaMkT' \
    --offset '54' \
    --tag '9ijI4hCb' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tfAXJuCv", "name": "BEWzExtm", "status": "ACTIVE", "tags": ["qoSSgPbf", "SMkQY73q", "LPsLcKF2"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'wsZpc9c4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'GetKeyGroup' test.out

#- 113 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'C2abcuoq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "K9xzksiX", "name": "aolD5MiG", "status": "ACTIVE", "tags": ["oKSrZjJo", "0sJJBIET", "6E7KwUO8"]}' \
    > test.out 2>&1
eval_tap $? 113 'UpdateKeyGroup' test.out

#- 114 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '5Slvif9S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'GetKeyGroupDynamic' test.out

#- 115 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'sKDvyg2g' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '15' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 115 'ListKeys' test.out

#- 116 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'EsJc6frg' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 116 'UploadKeys' test.out

#- 117 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'lcaUAVP5' \
    --limit '74' \
    --offset '7' \
    --orderNos 'F3NQLSVN,VHFjCtOq,FBnYFd44' \
    --sortBy 'OjZjUrLW' \
    --startTime 'xnNtpBiQ' \
    --status 'CHARGEBACK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 117 'QueryOrders' test.out

#- 118 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetOrderStatistics' test.out

#- 119 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xU4QGtT8' \
    > test.out 2>&1
eval_tap $? 119 'GetOrder' test.out

#- 120 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0JskL9Bk' \
    --body '{"description": "V9Lv5GuU"}' \
    > test.out 2>&1
eval_tap $? 120 'RefundOrder' test.out

#- 121 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetPaymentCallbackConfig' test.out

#- 122 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "pKYgv5p9", "privateKey": "dA6fKeJA"}' \
    > test.out 2>&1
eval_tap $? 122 'UpdatePaymentCallbackConfig' test.out

#- 123 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '9Ahdxomu' \
    --externalId 'RnGluifB' \
    --limit '62' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'IUKbGvwi' \
    --offset '93' \
    --paymentOrderNo 'ubF3Q2PY' \
    --startDate 'UAU6cn2J' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 123 'QueryPaymentNotifications' test.out

#- 124 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'R4QX6FVy' \
    --limit '55' \
    --offset '12' \
    --status 'NOTIFICATION_OF_CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentOrders' test.out

#- 125 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "cTStllYB", "currencyNamespace": "MDykL8ox", "customParameters": {"Daxv7r1h": {}, "TRQhfrc2": {}, "rtcLBr0r": {}}, "description": "FinkZgcm", "extOrderNo": "GAwh7Wx4", "extUserId": "l9nXbuDq", "itemType": "MEDIA", "language": "ykWK", "metadata": {"Gc8FVNeW": "2BMPxRp2", "8THu5UBI": "TbODG8t2", "L1zi0xS1": "IrxPQenO"}, "notifyUrl": "VEA0UbUw", "omitNotification": false, "platform": "jEc46RqX", "price": 75, "recurringPaymentOrderNo": "KnFqTCI8", "region": "z4jdQswk", "returnUrl": "Lq4tq0Nb", "sandbox": true, "sku": "jqb5Yw7m", "subscriptionId": "HJszvEHS", "targetNamespace": "lXBdscZM", "targetUserId": "lbBw7Rj4", "title": "jHseEpw0"}' \
    > test.out 2>&1
eval_tap $? 125 'CreatePaymentOrderByDedicated' test.out

#- 126 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'H47D32Ur' \
    > test.out 2>&1
eval_tap $? 126 'ListExtOrderNoByExtTxId' test.out

#- 127 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'x9TYGFlL' \
    > test.out 2>&1
eval_tap $? 127 'GetPaymentOrder' test.out

#- 128 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'UJgS0eqM' \
    --body '{"extTxId": "H7wVwAQZ", "paymentMethod": "OnJs86uD", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 128 'ChargePaymentOrder' test.out

#- 129 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'U49iUwjg' \
    --body '{"description": "34PRT8Pi"}' \
    > test.out 2>&1
eval_tap $? 129 'RefundPaymentOrderByDedicated' test.out

#- 130 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1bsGvT4I' \
    --body '{"amount": 26, "currencyCode": "5BbLyc2l", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 41, "vat": 57}' \
    > test.out 2>&1
eval_tap $? 130 'SimulatePaymentOrderNotification' test.out

#- 131 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DOZlEBVf' \
    > test.out 2>&1
eval_tap $? 131 'GetPaymentOrderChargeStatus' test.out

#- 132 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 132 'GetPlatformWalletConfig' test.out

#- 133 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Playstation", "Epic", "Other"]}' \
    > test.out 2>&1
eval_tap $? 133 'UpdatePlatformWalletConfig' test.out

#- 134 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 134 'ResetPlatformWalletConfig' test.out

#- 135 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "JlI9mszH", "eventTopic": "KPLB8LKe", "maxAwarded": 63, "maxAwardedPerUser": 78, "namespaceExpression": "o2SFs89Q", "rewardCode": "jcqqYoAv", "rewardConditions": [{"condition": "g6dSisgB", "conditionName": "n5qpHu43", "eventName": "QqMcUQSf", "rewardItems": [{"duration": 84, "itemId": "ForkDfkW", "quantity": 63}, {"duration": 90, "itemId": "RmrvQ1uO", "quantity": 6}, {"duration": 83, "itemId": "xSzy1xET", "quantity": 71}]}, {"condition": "tG1N6aWK", "conditionName": "utUitKoW", "eventName": "xYuu6tFa", "rewardItems": [{"duration": 1, "itemId": "kLX1y6JH", "quantity": 92}, {"duration": 77, "itemId": "dssMLALz", "quantity": 86}, {"duration": 85, "itemId": "7xOdUEWF", "quantity": 40}]}, {"condition": "FEOUkxWB", "conditionName": "OpbU6SDg", "eventName": "N5zE4XFM", "rewardItems": [{"duration": 55, "itemId": "hG3Zdddg", "quantity": 60}, {"duration": 11, "itemId": "elIcneSy", "quantity": 13}, {"duration": 8, "itemId": "A04tfx0X", "quantity": 6}]}], "userIdExpression": "ebIRVyHy"}' \
    > test.out 2>&1
eval_tap $? 135 'CreateReward' test.out

#- 136 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '1M9jQsop' \
    --limit '61' \
    --offset '5' \
    --sortBy 'rewardCode:desc,rewardCode:asc,rewardCode' \
    > test.out 2>&1
eval_tap $? 136 'QueryRewards' test.out

#- 137 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'ExportRewards' test.out

#- 138 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 138 'ImportRewards' test.out

#- 139 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'o2OvWsEJ' \
    > test.out 2>&1
eval_tap $? 139 'GetReward' test.out

#- 140 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6gbeDIfg' \
    --body '{"description": "mHhLpMla", "eventTopic": "rxbDfzBi", "maxAwarded": 52, "maxAwardedPerUser": 43, "namespaceExpression": "4Jx9l5XT", "rewardCode": "fJ0Eg5Qa", "rewardConditions": [{"condition": "Wqh2r3Md", "conditionName": "pVRBZ9hg", "eventName": "gweI0DI9", "rewardItems": [{"duration": 22, "itemId": "qFgSsftJ", "quantity": 40}, {"duration": 85, "itemId": "X9NN9LZj", "quantity": 17}, {"duration": 11, "itemId": "8mT4qaxG", "quantity": 54}]}, {"condition": "tq8JfPuZ", "conditionName": "3xk80UAw", "eventName": "t0RCcLmy", "rewardItems": [{"duration": 10, "itemId": "SChbcQ3W", "quantity": 74}, {"duration": 53, "itemId": "1mrn7gxS", "quantity": 54}, {"duration": 59, "itemId": "RTraDKaC", "quantity": 29}]}, {"condition": "KUQeIkMP", "conditionName": "NW9ZDnWs", "eventName": "sMms9eKM", "rewardItems": [{"duration": 46, "itemId": "ukesMQKN", "quantity": 86}, {"duration": 14, "itemId": "KlyPsynD", "quantity": 44}, {"duration": 44, "itemId": "C5Zx8Bqh", "quantity": 52}]}], "userIdExpression": "EQ3ZfgOX"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateReward' test.out

#- 141 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'pgEpbBsQ' \
    > test.out 2>&1
eval_tap $? 141 'DeleteReward' test.out

#- 142 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'xz1lWVMe' \
    --body '{"payload": {"5sl6qmra": {}, "VbZZ3qdo": {}, "NCkcszlw": {}}}' \
    > test.out 2>&1
eval_tap $? 142 'CheckEventCondition' test.out

#- 143 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RrFcIg6s' \
    --body '{"conditionName": "Zs5QLs7u", "userId": "4zKvDoAU"}' \
    > test.out 2>&1
eval_tap $? 143 'DeleteRewardConditionRecord' test.out

#- 144 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'ListStores' test.out

#- 145 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "ZxLPEmns", "defaultRegion": "VqAFPoJU", "description": "9AOjbjTI", "supportedLanguages": ["hhQEEZ1q", "PH4jY4oU", "A0WsB4Aq"], "supportedRegions": ["1trAzaqh", "dk5CkU6u", "xOFTlEx9"], "title": "3LdBnfnI"}' \
    > test.out 2>&1
eval_tap $? 145 'CreateStore' test.out

#- 146 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KwHhF4Y5' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 146 'ImportStore' test.out

#- 147 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetPublishedStore' test.out

#- 148 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'DeletePublishedStore' test.out

#- 149 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetPublishedStoreBackup' test.out

#- 150 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 150 'RollbackPublishedStore' test.out

#- 151 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '498d86iw' \
    > test.out 2>&1
eval_tap $? 151 'GetStore' test.out

#- 152 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MiK1LSbl' \
    --body '{"defaultLanguage": "tDmi36XS", "defaultRegion": "77XvhpO8", "description": "kiBGnxtS", "supportedLanguages": ["n8PeuHaf", "EphHjoqb", "ZDgi9QcI"], "supportedRegions": ["SY9rejTE", "MC4DxRR3", "Akj2sN3H"], "title": "NjBk6tNn"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateStore' test.out

#- 153 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ON7FvbHE' \
    > test.out 2>&1
eval_tap $? 153 'DeleteStore' test.out

#- 154 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'svKnEHzh' \
    --action 'UPDATE' \
    --itemSku 'vjtDL16o' \
    --itemType 'EXTENSION' \
    --limit '8' \
    --offset '39' \
    --selected  \
    --sortBy 'createdAt,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'Bfa5Pktd' \
    --updatedAtStart 'CWbWmXNu' \
    > test.out 2>&1
eval_tap $? 154 'QueryChanges' test.out

#- 155 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '3v3mTQn5' \
    > test.out 2>&1
eval_tap $? 155 'PublishAll' test.out

#- 156 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Hep2mLzV' \
    > test.out 2>&1
eval_tap $? 156 'PublishSelected' test.out

#- 157 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZsqHqhfr' \
    > test.out 2>&1
eval_tap $? 157 'SelectAllRecords' test.out

#- 158 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jmIG2nMq' \
    --action 'DELETE' \
    --itemSku 'lQLPV8lM' \
    --itemType 'CODE' \
    --type 'ITEM' \
    --updatedAtEnd 'hIDnegjM' \
    --updatedAtStart 'jtT1ZVlM' \
    > test.out 2>&1
eval_tap $? 158 'GetStatistic' test.out

#- 159 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bFA3UTan' \
    > test.out 2>&1
eval_tap $? 159 'UnselectAllRecords' test.out

#- 160 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'vqRfvNZm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'v2PBxb1z' \
    > test.out 2>&1
eval_tap $? 160 'SelectRecord' test.out

#- 161 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'sEODh0i8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'djiIMgsB' \
    > test.out 2>&1
eval_tap $? 161 'UnselectRecord' test.out

#- 162 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KgOsF7my' \
    --targetStoreId 'ecf66TF1' \
    > test.out 2>&1
eval_tap $? 162 'CloneStore' test.out

#- 163 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MbIBxqUo' \
    > test.out 2>&1
eval_tap $? 163 'ExportStore' test.out

#- 164 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId '8Wjwm8PT' \
    --limit '26' \
    --offset '82' \
    --sku 'EEcgwmMy' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    --userId 'i4trr28j' \
    > test.out 2>&1
eval_tap $? 164 'QuerySubscriptions' test.out

#- 165 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bF8419SM' \
    > test.out 2>&1
eval_tap $? 165 'RecurringChargeSubscription' test.out

#- 166 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'Ps1avqLr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 166 'GetTicketDynamic' test.out

#- 167 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'EnLurSHT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "S5iWEGCr"}' \
    > test.out 2>&1
eval_tap $? 167 'DecreaseTicketSale' test.out

#- 168 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'kqsvtA1V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 168 'GetTicketBoothID' test.out

#- 169 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'w1Mv5Jbl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 72, "orderNo": "Yv98uuE2"}' \
    > test.out 2>&1
eval_tap $? 169 'IncreaseTicketSale' test.out

#- 170 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'My907ZLP' \
    --body '{"achievements": [{"id": "aptztV8L", "value": 34}, {"id": "fTyI1zyU", "value": 21}, {"id": "igIheGyY", "value": 28}], "steamUserId": "nvIDklMK"}' \
    > test.out 2>&1
eval_tap $? 170 'UnlockSteamUserAchievement' test.out

#- 171 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'GVVPjCjp' \
    --xboxUserId 'HJmtUfiR' \
    > test.out 2>&1
eval_tap $? 171 'GetXblUserAchievements' test.out

#- 172 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'b5rfpMMV' \
    --body '{"achievements": [{"id": "ipnQQ3o3", "percentComplete": 53}, {"id": "wSrJdtgs", "percentComplete": 66}, {"id": "6ps3yzEv", "percentComplete": 65}], "serviceConfigId": "KtEtQRuV", "titleId": "W3gSBzCi", "xboxUserId": "eoHD4OtC"}' \
    > test.out 2>&1
eval_tap $? 172 'UpdateXblUserAchievement' test.out

#- 173 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'wZx53IYT' \
    > test.out 2>&1
eval_tap $? 173 'AnonymizeCampaign' test.out

#- 174 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'clxd8Gfd' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeEntitlement' test.out

#- 175 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'IBqW2jFU' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeFulfillment' test.out

#- 176 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'btwpDZ0F' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeIntegration' test.out

#- 177 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'AreNKvlI' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeOrder' test.out

#- 178 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'DbRVU5VX' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizePayment' test.out

#- 179 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'kqizqVVE' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizeSubscription' test.out

#- 180 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'kq40B1db' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeWallet' test.out

#- 181 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'oggTuJjK' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName '3d5IpTUF' \
    --features 'Tv026RqC,O5hHwVpX,wPARuDNb' \
    --itemId 'os95gw31,mzuqsuJN,ZsxgNNm5' \
    --limit '87' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 181 'QueryUserEntitlements' test.out

#- 182 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vEwgz8ib' \
    --body '[{"endDate": "1976-02-02T00:00:00Z", "grantedCode": "Q3JZIPD5", "itemId": "qxcAObm2", "itemNamespace": "s5lN9vjP", "language": "vP-676", "quantity": 30, "region": "BvK79RvR", "source": "REFERRAL_BONUS", "startDate": "1995-07-28T00:00:00Z", "storeId": "DMbrO3Aa"}, {"endDate": "1980-02-01T00:00:00Z", "grantedCode": "R9KoRFSq", "itemId": "WS33pzvz", "itemNamespace": "kUoChPec", "language": "tw-nrBG", "quantity": 74, "region": "28ou4wWj", "source": "REDEEM_CODE", "startDate": "1987-01-28T00:00:00Z", "storeId": "eBsBrQps"}, {"endDate": "1997-06-28T00:00:00Z", "grantedCode": "gPSfkji0", "itemId": "VNNwAQk4", "itemNamespace": "8vBhu521", "language": "xRS-jgiP_449", "quantity": 30, "region": "igbkGZ4c", "source": "REWARD", "startDate": "1995-03-21T00:00:00Z", "storeId": "9yPuGxPl"}]' \
    > test.out 2>&1
eval_tap $? 182 'GrantUserEntitlement' test.out

#- 183 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xASvCcCU' \
    --activeOnly  \
    --appId 'qYgUmYd8' \
    > test.out 2>&1
eval_tap $? 183 'GetUserAppEntitlementByAppId' test.out

#- 184 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'ahIzpiGN' \
    --activeOnly  \
    --limit '60' \
    --offset '61' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 184 'QueryUserEntitlementsByAppType' test.out

#- 185 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BYFsrSUo' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'J2RO1aMO' \
    > test.out 2>&1
eval_tap $? 185 'GetUserEntitlementByItemId' test.out

#- 186 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '6yD5pXUi' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'hz5Yd1yD' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementBySku' test.out

#- 187 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'elDMbJzS' \
    --appIds 'tj89Zbeb,AVL00adk,387NPSmX' \
    --itemIds 'Udb9gSoJ,eGx8pE9S,H5lS56Cm' \
    --skus 'qt4egOw5,alreoAEC,Rzr8ONTU' \
    > test.out 2>&1
eval_tap $? 187 'ExistsAnyUserActiveEntitlement' test.out

#- 188 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'h1GMbPIZ' \
    --itemIds '5oUUIVUS,RbfXwB47,57v7EX2p' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 189 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'waog9lUw' \
    --appId 'tQkAXqSA' \
    > test.out 2>&1
eval_tap $? 189 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 190 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '2PjM1gBT' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'qbGWAXru' \
    > test.out 2>&1
eval_tap $? 190 'GetUserEntitlementOwnershipByItemId' test.out

#- 191 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZGe2m0nC' \
    --ids 'ZEWwoRrq,V5kDqbY3,lKdh3LT2' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemIds' test.out

#- 192 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZETI2QzV' \
    --entitlementClazz 'APP' \
    --sku 'aQvJRyV6' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipBySku' test.out

#- 193 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUK14oHd' \
    --entitlementIds '798d3RLk' \
    > test.out 2>&1
eval_tap $? 193 'RevokeUserEntitlements' test.out

#- 194 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '6vfxWBvm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n5EuIPAv' \
    > test.out 2>&1
eval_tap $? 194 'GetUserEntitlement' test.out

#- 195 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'JMtqbLKs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YWc3ciHp' \
    --body '{"endDate": "1986-12-27T00:00:00Z", "nullFieldList": ["2ogR0ODB", "W4OD5Zbg", "h5VB6wnZ"], "startDate": "1977-02-02T00:00:00Z", "status": "CONSUMED", "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateUserEntitlement' test.out

#- 196 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'cEPoxDwt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ILXuSNva' \
    --body '{"options": ["uishD0Sm", "kMP4Ckju", "JaMWf3Tz"], "useCount": 44}' \
    > test.out 2>&1
eval_tap $? 196 'ConsumeUserEntitlement' test.out

#- 197 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'V0M57HDa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ThdWR3Qn' \
    > test.out 2>&1
eval_tap $? 197 'DisableUserEntitlement' test.out

#- 198 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'Dx3yQzDP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JwE4C7wA' \
    > test.out 2>&1
eval_tap $? 198 'EnableUserEntitlement' test.out

#- 199 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'IqiAajP1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'chKd7g8n' \
    > test.out 2>&1
eval_tap $? 199 'GetUserEntitlementHistories' test.out

#- 200 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'nUXvc1mR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UJ7f6DN9' \
    > test.out 2>&1
eval_tap $? 200 'RevokeUserEntitlement' test.out

#- 201 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'pRaU1DP9' \
    --body '{"duration": 13, "endDate": "1982-12-05T00:00:00Z", "itemId": "LvrJZhHz", "itemSku": "Y6KGQIvA", "language": "JFuegfff", "order": {"currency": {"currencyCode": "dvlKL53d", "currencySymbol": "0HlTF72P", "currencyType": "REAL", "decimals": 41, "namespace": "X0Z7b0Gy"}, "ext": {"VNSmiAun": {}, "03sMN2xd": {}, "9DROkuDu": {}}, "free": false}, "orderNo": "us3InpUI", "origin": "Playstation", "quantity": 15, "region": "jFrshG5i", "source": "REFERRAL_BONUS", "startDate": "1983-12-24T00:00:00Z", "storeId": "wFSkDo30"}' \
    > test.out 2>&1
eval_tap $? 201 'FulfillItem' test.out

#- 202 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'XuZof9R7' \
    --body '{"code": "09ZnjsOt", "language": "dwxv_Nfxf", "region": "hFsedwZR"}' \
    > test.out 2>&1
eval_tap $? 202 'RedeemCode' test.out

#- 203 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'MCGa1pHF' \
    --body '{"origin": "Epic", "rewards": [{"currency": {"currencyCode": "YV8dDUqx", "namespace": "eus713LA"}, "item": {"itemId": "fe8SX50V", "itemSku": "NUPf8BYi", "itemType": "CwMKt4jv"}, "quantity": 68, "type": "ITEM"}, {"currency": {"currencyCode": "TvyEA75b", "namespace": "eXK6Q0TR"}, "item": {"itemId": "X05iaQz1", "itemSku": "41l8n2Jz", "itemType": "BlhzjPHp"}, "quantity": 37, "type": "CURRENCY"}, {"currency": {"currencyCode": "QiekIH40", "namespace": "vI5wZYVM"}, "item": {"itemId": "amo9fjdj", "itemSku": "3GqB5wYe", "itemType": "fekw0gG8"}, "quantity": 13, "type": "CURRENCY"}], "source": "PROMOTION"}' \
    > test.out 2>&1
eval_tap $? 203 'FulfillRewards' test.out

#- 204 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '0tHLbzYa' \
    --endTime 'QCR4lFVw' \
    --limit '49' \
    --offset '84' \
    --productId 'b9rfF88w' \
    --startTime 'f0IjYzkc' \
    --status 'FAILED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 204 'QueryUserIAPOrders' test.out

#- 205 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'OqZVABTg' \
    > test.out 2>&1
eval_tap $? 205 'QueryAllUserIAPOrders' test.out

#- 206 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '9tT1iSBE' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "DXE_JOHN-443", "productId": "NvjH42Go", "region": "czSPSLsq", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 206 'MockFulfillIAPItem' test.out

#- 207 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'HsFZhMfh' \
    --itemId 'aiNopABI' \
    --limit '80' \
    --offset '17' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserOrders' test.out

#- 208 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gf6U2psG' \
    --body '{"currencyCode": "uGeKRumz", "currencyNamespace": "Jd6cx40e", "discountedPrice": 14, "ext": {"XofJTEYA": {}, "8BJqLvIl": {}, "JXaYlBGd": {}}, "itemId": "VRsGbNHR", "language": "kHwr29s1", "options": {"skipPriceValidation": false}, "platform": "Other", "price": 19, "quantity": 58, "region": "jS9EC4V3", "returnUrl": "NkgQcanR", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 208 'AdminCreateUserOrder' test.out

#- 209 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ho6yQRJD' \
    --itemId '4jLLi0Mg' \
    > test.out 2>&1
eval_tap $? 209 'CountOfPurchasedItem' test.out

#- 210 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'W1H2eaKP' \
    --userId '3LajIcoY' \
    > test.out 2>&1
eval_tap $? 210 'GetUserOrder' test.out

#- 211 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'W5ClSNPO' \
    --userId 'WFFjGWZ2' \
    --body '{"status": "CHARGEBACK", "statusReason": "FEZNW5sK"}' \
    > test.out 2>&1
eval_tap $? 211 'UpdateUserOrderStatus' test.out

#- 212 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'aHQzxh9T' \
    --userId '8Bi2MSqT' \
    > test.out 2>&1
eval_tap $? 212 'FulfillUserOrder' test.out

#- 213 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eMB5fOvA' \
    --userId 'cEB500eR' \
    > test.out 2>&1
eval_tap $? 213 'GetUserOrderGrant' test.out

#- 214 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7jQox87b' \
    --userId 'kVh6JOYL' \
    > test.out 2>&1
eval_tap $? 214 'GetUserOrderHistories' test.out

#- 215 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'b9erZLtf' \
    --userId 'nLc5LeIT' \
    --body '{"additionalData": {"cardSummary": "ZnrKWfpe"}, "authorisedTime": "1988-10-27T00:00:00Z", "chargebackReversedTime": "1994-04-01T00:00:00Z", "chargebackTime": "1994-09-27T00:00:00Z", "chargedTime": "1975-02-16T00:00:00Z", "createdTime": "1977-10-15T00:00:00Z", "currency": {"currencyCode": "nOYGODYD", "currencySymbol": "QdRvZBqK", "currencyType": "REAL", "decimals": 98, "namespace": "r3bu4cRi"}, "customParameters": {"ziyaGVNK": {}, "QELn6Pi7": {}, "qfVxPyl4": {}}, "extOrderNo": "y26w6mzn", "extTxId": "rWIcrT0T", "extUserId": "vAcewo2n", "issuedAt": "1987-06-02T00:00:00Z", "metadata": {"0WvUKRyD": "jAxjtuY3", "49NIPkyR": "2Ng5LJjB", "udJhilCJ": "lA0Gs19U"}, "namespace": "joHYSJfG", "nonceStr": "ZH7SB86L", "paymentMethod": "U962uE04", "paymentMethodFee": 72, "paymentOrderNo": "RyYazQ2r", "paymentProvider": "CHECKOUT", "paymentProviderFee": 45, "paymentStationUrl": "q9VEnWHY", "price": 40, "refundedTime": "1987-05-21T00:00:00Z", "salesTax": 100, "sandbox": false, "sku": "RVuMBPBH", "status": "REFUNDING", "statusReason": "lFUOMMMo", "subscriptionId": "hvi0pZ4d", "subtotalPrice": 97, "targetNamespace": "TCb0DvEf", "targetUserId": "9uV4ijxj", "tax": 35, "totalPrice": 40, "totalTax": 24, "txEndTime": "1974-06-22T00:00:00Z", "type": "0mRsf8XZ", "userId": "8VGrnX76", "vat": 96}' \
    > test.out 2>&1
eval_tap $? 215 'ProcessUserOrderNotification' test.out

#- 216 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rDumwpo5' \
    --userId 'Qn1jZjUc' \
    > test.out 2>&1
eval_tap $? 216 'DownloadUserOrderReceipt' test.out

#- 217 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ufBANp1I' \
    --body '{"currencyCode": "UJZQyzjI", "currencyNamespace": "fwF9EncE", "customParameters": {"8vKc8zqM": {}, "yo8o391k": {}, "QbeuGKKd": {}}, "description": "julk0yxR", "extOrderNo": "ydY0Vycx", "extUserId": "ovgaSVf7", "itemType": "INGAMEITEM", "language": "hutL", "metadata": {"aX0lhXJ3": "xHwDgvty", "TfBXX507": "yly1j5uh", "nmKMHeWb": "WTl3djjm"}, "notifyUrl": "XXOeNNnq", "omitNotification": true, "platform": "hfE4FDN8", "price": 23, "recurringPaymentOrderNo": "68o2PXKt", "region": "4jfitVYV", "returnUrl": "8hkRJTRO", "sandbox": true, "sku": "DHzZiRgz", "subscriptionId": "pIZYGGSW", "title": "VBjxXLd6"}' \
    > test.out 2>&1
eval_tap $? 217 'CreateUserPaymentOrder' test.out

#- 218 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zXgaS6JN' \
    --userId 'eUiG8IMq' \
    --body '{"description": "vaPnKB0W"}' \
    > test.out 2>&1
eval_tap $? 218 'RefundUserPaymentOrder' test.out

#- 219 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'k2vvFXFm' \
    --body '{"code": "Rx5Wz8UT", "orderNo": "uidxHubI"}' \
    > test.out 2>&1
eval_tap $? 219 'ApplyUserRedemption' test.out

#- 220 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'BZm0lW1R' \
    --chargeStatus 'CHARGED' \
    --itemId 'fWc7sFMI' \
    --limit '69' \
    --offset '27' \
    --sku 'ZTgVtO2E' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserSubscriptions' test.out

#- 221 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'zbXXCLZF' \
    --excludeSystem  \
    --limit '28' \
    --offset '37' \
    --subscriptionId 'k6D8x06I' \
    > test.out 2>&1
eval_tap $? 221 'GetUserSubscriptionActivities' test.out

#- 222 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'cbsU8pZG' \
    --body '{"grantDays": 56, "itemId": "qfu0CjzG", "language": "OFqTk4M6", "reason": "gmEYGH6F", "region": "D2uuunSc", "source": "RGmyRTcL"}' \
    > test.out 2>&1
eval_tap $? 222 'PlatformSubscribeSubscription' test.out

#- 223 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WjpQrr1j' \
    --itemId 'dAMaEZco' \
    > test.out 2>&1
eval_tap $? 223 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 224 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8WZaQjUC' \
    --userId 'BeoOzhis' \
    > test.out 2>&1
eval_tap $? 224 'GetUserSubscription' test.out

#- 225 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mZ7jrXVN' \
    --userId '6kfg0nnI' \
    > test.out 2>&1
eval_tap $? 225 'DeleteUserSubscription' test.out

#- 226 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kXFb8DoC' \
    --userId '2QjAgA6W' \
    --force  \
    --body '{"immediate": false, "reason": "PSmDvZzd"}' \
    > test.out 2>&1
eval_tap $? 226 'CancelSubscription' test.out

#- 227 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IYm6EKJA' \
    --userId '9iVeQsuP' \
    --body '{"grantDays": 20, "reason": "pulIfHSy"}' \
    > test.out 2>&1
eval_tap $? 227 'GrantDaysToSubscription' test.out

#- 228 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'A9BFhMFG' \
    --userId '8QGYxqxH' \
    --excludeFree  \
    --limit '43' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 228 'GetUserSubscriptionBillingHistories' test.out

#- 229 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '98suAKaN' \
    --userId 'kXHKyoaF' \
    --body '{"additionalData": {"cardSummary": "UZ11lO9d"}, "authorisedTime": "1991-12-09T00:00:00Z", "chargebackReversedTime": "1979-05-27T00:00:00Z", "chargebackTime": "1983-11-28T00:00:00Z", "chargedTime": "1975-06-03T00:00:00Z", "createdTime": "1975-02-14T00:00:00Z", "currency": {"currencyCode": "oTo2jH00", "currencySymbol": "Ii5kB09G", "currencyType": "REAL", "decimals": 55, "namespace": "z1CEbAUJ"}, "customParameters": {"9fZks8OE": {}, "fT3sJId1": {}, "RmqUUxb0": {}}, "extOrderNo": "Q4EPw2jn", "extTxId": "oXXEgdiP", "extUserId": "i5wryGr2", "issuedAt": "1985-04-28T00:00:00Z", "metadata": {"oZDTbOXg": "2Dz3M5Ih", "shcgDahw": "HZfL7XJy", "9TlVTY3l": "ShYv7wAp"}, "namespace": "yOAOe3oE", "nonceStr": "rJJQHmJk", "paymentMethod": "O0m1PTyc", "paymentMethodFee": 72, "paymentOrderNo": "QHhDAA6Q", "paymentProvider": "WXPAY", "paymentProviderFee": 21, "paymentStationUrl": "r9K8aadn", "price": 50, "refundedTime": "1988-02-07T00:00:00Z", "salesTax": 26, "sandbox": true, "sku": "4uOx64qH", "status": "INIT", "statusReason": "x81DvvF4", "subscriptionId": "ft9qjE9S", "subtotalPrice": 2, "targetNamespace": "XkN7v3rm", "targetUserId": "mtMJDSVm", "tax": 74, "totalPrice": 4, "totalTax": 51, "txEndTime": "1972-11-17T00:00:00Z", "type": "QbaFwFB4", "userId": "RJnOp0b7", "vat": 96}' \
    > test.out 2>&1
eval_tap $? 229 'ProcessUserSubscriptionNotification' test.out

#- 230 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'qCNdHMN3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GiwvvuHL' \
    --body '{"count": 27, "orderNo": "3TGBIcVc"}' \
    > test.out 2>&1
eval_tap $? 230 'AcquireUserTicket' test.out

#- 231 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'gY33ZiCl' \
    > test.out 2>&1
eval_tap $? 231 'QueryUserCurrencyWallets' test.out

#- 232 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '5NDp5Dtf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bwW7boZS' \
    --limit '83' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 232 'ListUserCurrencyTransactions' test.out

#- 233 CheckWallet
eval_tap 0 233 'CheckWallet # SKIP deprecated' test.out

#- 234 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '6L9Yqait' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ti9m0av' \
    --body '{"amount": 83, "expireAt": "1990-02-18T00:00:00Z", "origin": "Steam", "reason": "QuW2zNVG", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 234 'CreditUserWallet' test.out

#- 235 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'OIkwJSEd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ePkbi2Sn' \
    --body '{"amount": 90, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 235 'PayWithUserWallet' test.out

#- 236 GetUserWallet
eval_tap 0 236 'GetUserWallet # SKIP deprecated' test.out

#- 237 DebitUserWallet
eval_tap 0 237 'DebitUserWallet # SKIP deprecated' test.out

#- 238 DisableUserWallet
eval_tap 0 238 'DisableUserWallet # SKIP deprecated' test.out

#- 239 EnableUserWallet
eval_tap 0 239 'EnableUserWallet # SKIP deprecated' test.out

#- 240 ListUserWalletTransactions
eval_tap 0 240 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 241 QueryWallets
eval_tap 0 241 'QueryWallets # SKIP deprecated' test.out

#- 242 GetWallet
eval_tap 0 242 'GetWallet # SKIP deprecated' test.out

#- 243 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'ztUgv5mW' \
    --end 'BUl5moQg' \
    --start 'jv1hhO1V' \
    > test.out 2>&1
eval_tap $? 243 'SyncOrders' test.out

#- 244 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["u9yFcp6n", "bZBYipbY", "cqyWlOmS"], "apiKey": "YSLODMv3", "authoriseAsCapture": false, "blockedPaymentMethods": ["Di6NmRnM", "q4ttD9fU", "AAj2tmRz"], "clientKey": "EWLTXWJz", "dropInSettings": "X3Qg3buT", "liveEndpointUrlPrefix": "KWi5lk2o", "merchantAccount": "oawrLk0J", "notificationHmacKey": "oJxNCaO4", "notificationPassword": "z5LL7dbr", "notificationUsername": "9JHGoxAl", "returnUrl": "MWdADzd4", "settings": "5iZXqYmy"}' \
    > test.out 2>&1
eval_tap $? 244 'TestAdyenConfig' test.out

#- 245 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "LFyomLYx", "privateKey": "xB09ZAxR", "publicKey": "NAVsYbcb", "returnUrl": "vfvUqznJ"}' \
    > test.out 2>&1
eval_tap $? 245 'TestAliPayConfig' test.out

#- 246 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "GsPtupFS", "secretKey": "JMIARZvh"}' \
    > test.out 2>&1
eval_tap $? 246 'TestCheckoutConfig' test.out

#- 247 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'kVbIukBE' \
    > test.out 2>&1
eval_tap $? 247 'DebugMatchedPaymentMerchantConfig' test.out

#- 248 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "Gv9GNFDy", "clientSecret": "zqc2Wj7I", "returnUrl": "jmSqoE5L", "webHookId": "MbjSeO8q"}' \
    > test.out 2>&1
eval_tap $? 248 'TestPayPalConfig' test.out

#- 249 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["vreYstzA", "qFPqmOA3", "lDkE2RJ1"], "publishableKey": "whqRSfis", "secretKey": "cB4uevho", "webhookSecret": "czfMz8p2"}' \
    > test.out 2>&1
eval_tap $? 249 'TestStripeConfig' test.out

#- 250 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "kh7rNXFU", "key": "RE5rweg9", "mchid": "VaqaWRFJ", "returnUrl": "xwXM08E5"}' \
    > test.out 2>&1
eval_tap $? 250 'TestWxPayConfig' test.out

#- 251 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "QDO8efOg", "flowCompletionUrl": "tB5QpEyG", "merchantId": 91, "projectId": 74, "projectSecretKey": "82MfdCj0"}' \
    > test.out 2>&1
eval_tap $? 251 'TestXsollaConfig' test.out

#- 252 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'G5WpAPY2' \
    > test.out 2>&1
eval_tap $? 252 'GetPaymentMerchantConfig' test.out

#- 253 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'AaREOLBT' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["iBKiD1aZ", "jZgPIEjY", "hVzBgEeY"], "apiKey": "NPd9OIB2", "authoriseAsCapture": true, "blockedPaymentMethods": ["YcCqINFR", "4iukxJc8", "XtaIdMF1"], "clientKey": "8RLLGp1x", "dropInSettings": "EEfr2ivS", "liveEndpointUrlPrefix": "GrAeEAbb", "merchantAccount": "LXArDJkw", "notificationHmacKey": "ghAOnxVR", "notificationPassword": "rnDhma2Q", "notificationUsername": "Dq1a1kP7", "returnUrl": "pgXFMXnO", "settings": "canFuzjI"}' \
    > test.out 2>&1
eval_tap $? 253 'UpdateAdyenConfig' test.out

#- 254 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'r8C1cG0O' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 254 'TestAdyenConfigById' test.out

#- 255 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'aFAyDGEA' \
    --sandbox  \
    --validate  \
    --body '{"appId": "MIJANlOR", "privateKey": "aHydMViK", "publicKey": "iqRI7efF", "returnUrl": "MvH2DY9L"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateAliPayConfig' test.out

#- 256 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'Dx9YpwDh' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 256 'TestAliPayConfigById' test.out

#- 257 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'wq6W1uih' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "e4cC31ct", "secretKey": "N5dVwdRx"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateCheckoutConfig' test.out

#- 258 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'xGFaB6X2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestCheckoutConfigById' test.out

#- 259 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'qgr6CO3G' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "ps3QBNx0", "clientSecret": "T1hbawmv", "returnUrl": "mvg7dQhy", "webHookId": "KMu74WPZ"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdatePayPalConfig' test.out

#- 260 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 't4PJ4yV1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestPayPalConfigById' test.out

#- 261 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '9wNkx2bi' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["Ns87jOHd", "nImFN25V", "KqFEXdTh"], "publishableKey": "BzqmAMxs", "secretKey": "VeRET2hZ", "webhookSecret": "aBnDF06L"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateStripeConfig' test.out

#- 262 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'Ces5GugS' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestStripeConfigById' test.out

#- 263 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'JoMC8g74' \
    --validate  \
    --body '{"appId": "OmoJeFX7", "key": "oWQlTC4j", "mchid": "dW4jPMu7", "returnUrl": "aJQl9J1x"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateWxPayConfig' test.out

#- 264 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'OmAmGSLn' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 264 'UpdateWxPayConfigCert' test.out

#- 265 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'GCuHCCvH' \
    > test.out 2>&1
eval_tap $? 265 'TestWxPayConfigById' test.out

#- 266 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'jzqehFzq' \
    --validate  \
    --body '{"apiKey": "wEEEL1k8", "flowCompletionUrl": "T1OVLjMr", "merchantId": 33, "projectId": 67, "projectSecretKey": "23JTO8no"}' \
    > test.out 2>&1
eval_tap $? 266 'UpdateXsollaConfig' test.out

#- 267 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'R1yI9ITG' \
    > test.out 2>&1
eval_tap $? 267 'TestXsollaConfigById' test.out

#- 268 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'bDEoKKcB' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateXsollaUIConfig' test.out

#- 269 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '34' \
    --namespace "$AB_NAMESPACE" \
    --offset '86' \
    --region 'K62U7KQV' \
    > test.out 2>&1
eval_tap $? 269 'QueryPaymentProviderConfig' test.out

#- 270 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "13APQcjz", "region": "u7yFwwmQ", "sandboxTaxJarApiToken": "Yp69uVC5", "specials": ["ALIPAY", "CHECKOUT", "ALIPAY"], "taxJarApiToken": "6e3hwnhz", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 270 'CreatePaymentProviderConfig' test.out

#- 271 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 271 'GetAggregatePaymentProviders' test.out

#- 272 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'gu2y2VMj' \
    > test.out 2>&1
eval_tap $? 272 'DebugMatchedPaymentProviderConfig' test.out

#- 273 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 273 'GetSpecialPaymentProviders' test.out

#- 274 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'mIUUcVaZ' \
    --body '{"aggregate": "ADYEN", "namespace": "xCkXJ0H6", "region": "yA8vFN9B", "sandboxTaxJarApiToken": "1vn8VpO4", "specials": ["CHECKOUT", "STRIPE", "WXPAY"], "taxJarApiToken": "FvOCRaWh", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 274 'UpdatePaymentProviderConfig' test.out

#- 275 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'G4y0QYiN' \
    > test.out 2>&1
eval_tap $? 275 'DeletePaymentProviderConfig' test.out

#- 276 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 276 'GetPaymentTaxConfig' test.out

#- 277 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "uoqyxN0X", "taxJarApiToken": "G7TfzECd", "taxJarEnabled": true, "taxJarProductCodesMapping": {"W1pMwM9c": "oiUdNRYU", "8MymN5lD": "LtxG0j04", "v0XApOqU": "E9w55Xzd"}}' \
    > test.out 2>&1
eval_tap $? 277 'UpdatePaymentTaxConfig' test.out

#- 278 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'dfSTxx96' \
    --end 'NxMcKkDw' \
    --start 'N7qIDlXU' \
    > test.out 2>&1
eval_tap $? 278 'SyncPaymentOrders' test.out

#- 279 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'lW7NNO1K' \
    --storeId '3GmnMGY6' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetRootCategories' test.out

#- 280 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'cbjetDU9' \
    --storeId 'xlMm5KiV' \
    > test.out 2>&1
eval_tap $? 280 'DownloadCategories' test.out

#- 281 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'Eod4Yjmy' \
    --namespace "$AB_NAMESPACE" \
    --language 'v7JhcAAq' \
    --storeId 'MGUd8Rar' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetCategory' test.out

#- 282 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'ff7pmDfS' \
    --namespace "$AB_NAMESPACE" \
    --language 'bfeEoagC' \
    --storeId '290ZUzEO' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetChildCategories' test.out

#- 283 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'UjFkEIYj' \
    --namespace "$AB_NAMESPACE" \
    --language 'ESmZsifP' \
    --storeId '29GUDqHi' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetDescendantCategories' test.out

#- 284 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 284 'PublicListCurrencies' test.out

#- 285 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'Hoj6XBif' \
    --region 'LWuzTjVk' \
    --storeId 'c5IfNpC7' \
    --appId 'vNYN6ipW' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetItemByAppId' test.out

#- 286 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId 'iXRdqGBA' \
    --categoryPath 'uPIarG63' \
    --features '7h3zO6zq' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'KKSyxUQA' \
    --limit '3' \
    --offset '24' \
    --region 'pvDEOE7q' \
    --sortBy 'createdAt:asc,name:desc,name' \
    --storeId '2R6aqTBi' \
    --tags 'dMNklda9' \
    > test.out 2>&1
eval_tap $? 286 'PublicQueryItems' test.out

#- 287 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language '4eK5vart' \
    --region 'fn7NUaTO' \
    --storeId 'q1fRB98O' \
    --sku 'zntDCsaG' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetItemBySku' test.out

#- 288 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'nr6zkTPC' \
    --region 'kbkuVk6P' \
    --storeId '5cDSQlJR' \
    --itemIds 'cFG8trMk' \
    > test.out 2>&1
eval_tap $? 288 'PublicBulkGetItems' test.out

#- 289 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["wmCU9qsW", "kkAJXgQn", "hHBYnH1T"]}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateItemPurchaseCondition' test.out

#- 290 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'OPTIONBOX' \
    --limit '69' \
    --offset '52' \
    --region 'xdnwnNf5' \
    --storeId 'WB0hV8FS' \
    --keyword 'wkuJLoND' \
    --language 'NlV4DpL6' \
    > test.out 2>&1
eval_tap $? 290 'PublicSearchItems' test.out

#- 291 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '8RmmmXjk' \
    --namespace "$AB_NAMESPACE" \
    --language 'zmRO1xyY' \
    --region 'aUs5lAXo' \
    --storeId 'DAXvjGjH' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetApp' test.out

#- 292 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'DIz64fz9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'PublicGetItemDynamicData' test.out

#- 293 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'iZDvbgVa' \
    --namespace "$AB_NAMESPACE" \
    --language 'QiO0yqib' \
    --populateBundle  \
    --region 'HMfuAvCt' \
    --storeId 'eAYP1vlN' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetItem' test.out

#- 294 GetPaymentCustomization
eval_tap 0 294 'GetPaymentCustomization # SKIP deprecated' test.out

#- 295 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "8rG5MRj4", "paymentProvider": "ADYEN", "returnUrl": "JyOK2GWY", "ui": "GZQMmNdT", "zipCode": "okw9MagL"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetPaymentUrl' test.out

#- 296 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'p4bR8WV8' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetPaymentMethods' test.out

#- 297 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iHnjuL2w' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUnpaidPaymentOrder' test.out

#- 298 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'A8sqBu1P' \
    --paymentProvider 'XSOLLA' \
    --zipCode '4y2nk3QV' \
    --body '{"token": "HX30aEfk"}' \
    > test.out 2>&1
eval_tap $? 298 'Pay' test.out

#- 299 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'X1bIHLWJ' \
    > test.out 2>&1
eval_tap $? 299 'PublicCheckPaymentOrderPaidStatus' test.out

#- 300 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'HM9eNZLn' \
    > test.out 2>&1
eval_tap $? 300 'GetPaymentPublicConfig' test.out

#- 301 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'kMCQ786Z' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetQRCode' test.out

#- 302 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'nK7hSMs3' \
    --foreinginvoice 'xhPiAH30' \
    --invoiceId 'sqQsbvEJ' \
    --payload 'wzgnYnFS' \
    --redirectResult 'mDjDKsO8' \
    --resultCode 'FrjNJ8ki' \
    --sessionId 'KbBRW0uM' \
    --status 'I0VwovvO' \
    --token 'XrxI5Snt' \
    --type 'lo2W6QCR' \
    --userId 'iZQXteez' \
    --orderNo 'SyMZPQnP' \
    --paymentOrderNo 'J6RsJKXE' \
    --paymentProvider 'CHECKOUT' \
    --returnUrl 'lSFFAgPz' \
    > test.out 2>&1
eval_tap $? 302 'PublicNormalizePaymentReturnUrl' test.out

#- 303 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'aeIMEi5W' \
    --paymentOrderNo 'xjFClPXd' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 303 'GetPaymentTaxValue' test.out

#- 304 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'biarPRn1' \
    > test.out 2>&1
eval_tap $? 304 'GetRewardByCode' test.out

#- 305 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'dCNld8Cl' \
    --limit '75' \
    --offset '50' \
    --sortBy 'rewardCode:asc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 305 'QueryRewards1' test.out

#- 306 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'YjurBLQK' \
    > test.out 2>&1
eval_tap $? 306 'GetReward1' test.out

#- 307 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'PublicListStores' test.out

#- 308 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'YSrCo3hi,rQXckwPe,SnU3FLW6' \
    --itemIds 'ODwtzH60,dmJyILBS,nBFtHysz' \
    --skus 'cqAvPn7w,FeXDxWos,hrOyourl' \
    > test.out 2>&1
eval_tap $? 308 'PublicExistsAnyMyActiveEntitlement' test.out

#- 309 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'l7wOiGeU' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 310 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId '9SOC2RZr' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 311 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'Q12Ue1Gg' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 312 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'CMRVaktA,VdyeO2VT,iZlNaKmH' \
    --itemIds 'bqMiOMFO,0MNbZW5Y,SQJF1CtV' \
    --skus 'ygnXTdqy,cS0A7Poi,2S1JmVXg' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetEntitlementOwnershipToken' test.out

#- 313 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'AAgx2etp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyWallet' test.out

#- 314 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'qvfeU34I' \
    --body '{"epicGamesJwtToken": "PngdvzK3"}' \
    > test.out 2>&1
eval_tap $? 314 'SyncEpicGameDLC' test.out

#- 315 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vWewtfdL' \
    --body '{"serviceLabel": 92}' \
    > test.out 2>&1
eval_tap $? 315 'PublicSyncPsnDlcInventory' test.out

#- 316 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'sR6Kik05' \
    --body '{"appId": "jErPOXrp", "steamId": "dnQ3X8ao"}' \
    > test.out 2>&1
eval_tap $? 316 'SyncSteamDLC' test.out

#- 317 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVpP6qaB' \
    --body '{"xstsToken": "5GwWkWfF"}' \
    > test.out 2>&1
eval_tap $? 317 'SyncXboxDLC' test.out

#- 318 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'K4cY0cLT' \
    --appType 'DLC' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'StXK0Y4i' \
    --features 'cHj45X8r,Nmut3ycM,mgFo90dZ' \
    --itemId 'OCU1uaAJ,jVJit825,yPgJN9zV' \
    --limit '4' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 318 'PublicQueryUserEntitlements' test.out

#- 319 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'OqFey8TW' \
    --appId 'C7x379Yx' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserAppEntitlementByAppId' test.out

#- 320 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'QL56qbTP' \
    --limit '5' \
    --offset '39' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 320 'PublicQueryUserEntitlementsByAppType' test.out

#- 321 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iF1AFthb' \
    --entitlementClazz 'CODE' \
    --itemId 'RR1SDjtd' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetUserEntitlementByItemId' test.out

#- 322 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'jEzBHGg6' \
    --entitlementClazz 'APP' \
    --sku 'idMZzfqZ' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserEntitlementBySku' test.out

#- 323 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'xmr6dXC5' \
    --appIds 'p0LWnvgj,e0suRfyu,xR0lzswd' \
    --itemIds 'Wn5WpsNf,lgLxaWHz,IeNqYUA5' \
    --skus '2b8vdVbl,ctGWAfhQ,Zpg1qsBp' \
    > test.out 2>&1
eval_tap $? 323 'PublicExistsAnyUserActiveEntitlement' test.out

#- 324 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5eIgzZh' \
    --appId 'BqJFWLwm' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 325 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuI25al5' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'bH4hSD79' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 326 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'L5JiWrTV' \
    --ids 'QtVtaPfg,B3BcSyvY,07lEZN7Y' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 327 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'H0Sdx93f' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'ewb4kY8t' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 328 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'OGfOAQM5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KoPhqsig' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlement' test.out

#- 329 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'FfumpaBf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNb0ox2X' \
    --body '{"options": ["95zGkDkE", "XxFmLBLj", "Oyd7aamI"], "useCount": 64}' \
    > test.out 2>&1
eval_tap $? 329 'PublicConsumeUserEntitlement' test.out

#- 330 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'khrTp4ox' \
    --body '{"code": "VIXsR6bg", "language": "ATs", "region": "h868AOr1"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicRedeemCode' test.out

#- 331 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEcvYk4y' \
    --body '{"excludeOldTransactions": false, "language": "ZSU_fQyG", "productId": "MhcHySCt", "receiptData": "Gqc54ULP", "region": "5XMHKWjM", "transactionId": "vkKS6KCs"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicFulfillAppleIAPItem' test.out

#- 332 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'wp9sKUad' \
    --body '{"epicGamesJwtToken": "rUDYC4zX"}' \
    > test.out 2>&1
eval_tap $? 332 'SyncEpicGamesInventory' test.out

#- 333 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mtm3rWk6' \
    --body '{"autoAck": true, "language": "jgk-683", "orderId": "moW47PSQ", "packageName": "D4gmSBre", "productId": "xePaQLbV", "purchaseTime": 81, "purchaseToken": "mo8LcjzX", "region": "8Rr3VRkD"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicFulfillGoogleIAPItem' test.out

#- 334 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ca0pNU5m' \
    --body '{"currencyCode": "cJK5EpZz", "price": 0.5529980542368917, "productId": "jdjm1JRo", "serviceLabel": 46}' \
    > test.out 2>&1
eval_tap $? 334 'PublicReconcilePlayStationStore' test.out

#- 335 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '0F8bjK0d' \
    --body '{"appId": "EnyQV7N6", "language": "Apn", "region": "hCNuY8Pf", "stadiaPlayerId": "3SnEifXp"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncStadiaEntitlement' test.out

#- 336 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'j5QZyn6V' \
    --body '{"appId": "f4zTvTXm", "currencyCode": "hD0Qi5vw", "language": "jW-053", "price": 0.036930068086513446, "productId": "rAR9IoZm", "region": "Cn7MxMSK", "steamId": "g8TclS31"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncSteamInventory' test.out

#- 337 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'R0tJBdu0' \
    --body '{"gameId": "UCWwq01r", "language": "Kdz_560", "region": "mbRKlQwr"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncTwitchDropsEntitlement' test.out

#- 338 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'fv4CI3ww' \
    --body '{"currencyCode": "qnIUxLQa", "price": 0.7287187867087652, "productId": "peaMhzxl", "xstsToken": "PM7dNHB3"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncXboxInventory' test.out

#- 339 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'WIpQWH5M' \
    --itemId 'ZyHS2UvE' \
    --limit '95' \
    --offset '75' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserOrders' test.out

#- 340 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '0DBhY7Ow' \
    --body '{"currencyCode": "QHf0sC8I", "discountedPrice": 90, "ext": {"yKool1lr": {}, "NdiW8mza": {}, "hgZw5IJ9": {}}, "itemId": "XH9XyQuy", "language": "KD-MtOA", "price": 69, "quantity": 28, "region": "xNaKkQei", "returnUrl": "mPkNxHGo"}' \
    > test.out 2>&1
eval_tap $? 340 'PublicCreateUserOrder' test.out

#- 341 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YM3eHxRx' \
    --userId 'vuv43Kco' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserOrder' test.out

#- 342 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TWqE0jHW' \
    --userId 'jZoLZLNv' \
    > test.out 2>&1
eval_tap $? 342 'PublicCancelUserOrder' test.out

#- 343 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Xbpv32BG' \
    --userId 'zaZwSikn' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserOrderHistories' test.out

#- 344 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'L8GfesEu' \
    --userId 'GkNozYiL' \
    > test.out 2>&1
eval_tap $? 344 'PublicDownloadUserOrderReceipt' test.out

#- 345 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'IsLC3rXu' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetPaymentAccounts' test.out

#- 346 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'ImXoNwTT' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'JIzMDn1Z' \
    > test.out 2>&1
eval_tap $? 346 'PublicDeletePaymentAccount' test.out

#- 347 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'juBsT9WC' \
    --chargeStatus 'CHARGED' \
    --itemId 'N5ccl4YP' \
    --limit '77' \
    --offset '91' \
    --sku '3rrsMkbX' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 347 'PublicQueryUserSubscriptions' test.out

#- 348 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ttpKxYjs' \
    --body '{"currencyCode": "GhokyBEK", "itemId": "oEu1lZtb", "language": "zcGF-DpMt_563", "region": "Z2Tyl7Db", "returnUrl": "RifRVY8W", "source": "Affyr8DT"}' \
    > test.out 2>&1
eval_tap $? 348 'PublicSubscribeSubscription' test.out

#- 349 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FBcpY2PL' \
    --itemId 'utoM6iSd' \
    > test.out 2>&1
eval_tap $? 349 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 350 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5XUu0t0K' \
    --userId 'HyAU9Qzv' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUserSubscription' test.out

#- 351 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'deG1mmwb' \
    --userId 'rbQibWUs' \
    > test.out 2>&1
eval_tap $? 351 'PublicChangeSubscriptionBillingAccount' test.out

#- 352 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8ehNBt9a' \
    --userId 'OIASOgn7' \
    --body '{"immediate": true, "reason": "HQURdq84"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicCancelSubscription' test.out

#- 353 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qj0WkVVT' \
    --userId 'j4VR1rSq' \
    --excludeFree  \
    --limit '71' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetUserSubscriptionBillingHistories' test.out

#- 354 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '1iyVt9m8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K8rwTXD2' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetWallet' test.out

#- 355 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'DSXY1vV8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QIybg0NY' \
    --limit '69' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 355 'PublicListUserWalletTransactions' test.out

#- 356 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'MfFw40A6' \
    --baseAppId 'x4GQBW3P' \
    --categoryPath 'Qx4VvryH' \
    --features 'tUeZJpvv' \
    --includeSubCategoryItem  \
    --itemStatus 'INACTIVE' \
    --itemType 'APP' \
    --limit '63' \
    --offset '33' \
    --region '1n4HqRIi' \
    --sortBy 'updatedAt,createdAt:desc,createdAt:asc' \
    --storeId 'FzCIANpc' \
    --tags 'Lwr1sjRZ' \
    --targetNamespace '1dJBCfpw' \
    > test.out 2>&1
eval_tap $? 356 'QueryItems1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE