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
echo "1..354"

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
    --body '{"context": {"item": {"appId": "292loNJZ", "appType": "DLC", "baseAppId": "VvelemC1", "boothName": "jtK9EElD", "boundItemIds": ["REtWZXR9", "LwYIGxj4", "UJIgod52"], "categoryPath": "YOGnMFPJ", "clazz": "F9qNq83p", "createdAt": "1976-10-06T00:00:00Z", "description": "R6SB0mFw", "displayOrder": 85, "entitlementType": "CONSUMABLE", "ext": {"SBJjXKmB": {}, "3ge5rfG3": {}, "eotuNtCW": {}}, "features": ["jZYfvFYG", "sv08pVK8", "3M7xeMLA"], "fresh": false, "images": [{"as": "hY08GKf7", "caption": "37nnktJJ", "height": 64, "imageUrl": "g3Z4dZ3D", "smallImageUrl": "keMgEFME", "width": 83}, {"as": "w8hlfhPy", "caption": "cVzJpWIa", "height": 72, "imageUrl": "38PhJ2yY", "smallImageUrl": "u3jxuiSm", "width": 35}, {"as": "SWxQxdeH", "caption": "oFSqa15z", "height": 33, "imageUrl": "ceRrkNTX", "smallImageUrl": "RkUkqGuT", "width": 100}], "itemId": "Rwq2q5SH", "itemIds": ["cn3Kxsfp", "9InnBwTd", "tSCJH7k2"], "itemQty": {"A5W9Pm1U": 86, "oto1mcjr": 97, "4qkAEK39": 76}, "itemType": "APP", "language": "w6IJXHll", "listable": false, "localExt": {"VZedSf58": {}, "POYPhrEr": {}, "Ma4JCHAq": {}}, "longDescription": "BrpEboF5", "maxCount": 34, "maxCountPerUser": 74, "name": "TwAVco8Q", "namespace": "rTThbMm4", "optionBoxConfig": {"boxItems": [{"count": 23, "itemId": "MbWZ2bef", "itemSku": "Lcf4xy68"}, {"count": 16, "itemId": "IT2llbto", "itemSku": "h7KVzGVj"}, {"count": 68, "itemId": "SiEAH1yh", "itemSku": "auz0gkw8"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 4, "comparison": "isLessThan", "name": "IQmS0Poj", "predicateType": "SeasonPassPredicate", "value": "tpv5LE9E", "values": ["Iy72XhOS", "ZiQxd53n", "0ez7u4xu"]}, {"anyOf": 20, "comparison": "isLessThan", "name": "H1BXzaeC", "predicateType": "EntitlementPredicate", "value": "VSuFJMm6", "values": ["3sdatq5P", "uINyTsuI", "87ceeUe3"]}, {"anyOf": 0, "comparison": "includes", "name": "4VIPGA1D", "predicateType": "EntitlementPredicate", "value": "wyTTHrb3", "values": ["D3ZQqQaH", "X12VjfPq", "yivlyptv"]}]}, {"operator": "or", "predicates": [{"anyOf": 85, "comparison": "is", "name": "FUlgy5I0", "predicateType": "SeasonTierPredicate", "value": "DKfQ2ba9", "values": ["tmhcIaQ3", "s2Pl6VtQ", "KjRw9pyB"]}, {"anyOf": 99, "comparison": "isGreaterThan", "name": "FXCWkwoA", "predicateType": "EntitlementPredicate", "value": "8CdyrQtv", "values": ["yPkQfUDj", "8G8kMBok", "JcPUqJPm"]}, {"anyOf": 25, "comparison": "isLessThan", "name": "YQATwMtV", "predicateType": "SeasonPassPredicate", "value": "sad4QMMV", "values": ["6WJExiJ7", "BX1MKOR3", "sdJ4qb3f"]}]}, {"operator": "or", "predicates": [{"anyOf": 23, "comparison": "excludes", "name": "R2QazT5o", "predicateType": "EntitlementPredicate", "value": "fZTyFWOB", "values": ["NUDw85tg", "NVAATeD5", "nZWCAD6D"]}, {"anyOf": 75, "comparison": "isLessThan", "name": "T0ILynnD", "predicateType": "EntitlementPredicate", "value": "EA3Vsn9T", "values": ["d8IK7Jjw", "Ti3NE9Xu", "5KnvDlse"]}, {"anyOf": 2, "comparison": "is", "name": "Kbh3IGtR", "predicateType": "SeasonTierPredicate", "value": "bgnWsokm", "values": ["b1BzYqcH", "kLWLD9yS", "lZUYeDIY"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 54, "fixedTrialCycles": 51, "graceDays": 7}, "region": "LtctfxnZ", "regionData": [{"currencyCode": "45fmEALU", "currencyNamespace": "jMFiTZQ0", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1981-11-02T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1975-08-10T00:00:00Z", "discountedPrice": 82, "expireAt": "1997-12-17T00:00:00Z", "price": 81, "purchaseAt": "1978-02-15T00:00:00Z", "trialPrice": 94}, {"currencyCode": "nZvzuWjI", "currencyNamespace": "0jzVLWQj", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1974-12-19T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1997-03-10T00:00:00Z", "discountedPrice": 56, "expireAt": "1994-02-16T00:00:00Z", "price": 76, "purchaseAt": "1982-02-01T00:00:00Z", "trialPrice": 94}, {"currencyCode": "k9s7uzLl", "currencyNamespace": "kSE4lxJd", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1998-09-11T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1995-07-06T00:00:00Z", "discountedPrice": 93, "expireAt": "1991-07-20T00:00:00Z", "price": 1, "purchaseAt": "1997-08-19T00:00:00Z", "trialPrice": 14}], "seasonType": "TIER", "sku": "BXeY9abK", "stackable": true, "status": "ACTIVE", "tags": ["9gHPxkRV", "KH3IuF37", "A2cnBfLY"], "targetCurrencyCode": "FADqorWK", "targetItemId": "Aw7COTA5", "targetNamespace": "w1S7nPZK", "thumbnailUrl": "64L8qCw5", "title": "EbqM0226", "updatedAt": "1998-08-08T00:00:00Z", "useCount": 17}, "namespace": "foaImkFC", "order": {"currency": {"currencyCode": "cm8NUTZM", "currencySymbol": "FJ2YfT5y", "currencyType": "REAL", "decimals": 74, "namespace": "taQECi6H"}, "ext": {"1jndpoWH": {}, "LMH25jYy": {}, "GMKpgjo8": {}}, "free": true}, "source": "ACHIEVEMENT"}, "script": "CiMR6C2F", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'twO3k9SO' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '5pE5mgEx' \
    --body '{"grantDays": "L6tNODiW"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'PIa3VGQt' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '15qc3EZl' \
    --body '{"grantDays": "A3MKxyUG"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "eueBoS5U", "dryRun": false, "fulfillmentUrl": "TizUh93s", "itemType": "OPTIONBOX", "purchaseConditionUrl": "5avDW7aX"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '9NK6Zn3D' \
    --itemType 'INGAMEITEM' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'bBWs79cq' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'ZLHC46re' \
    --body '{"clazz": "tNIF8Zdv", "dryRun": false, "fulfillmentUrl": "yaOzO3nP", "purchaseConditionUrl": "RhvBMoPu"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'KM5Ld6Mp' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --name 'aozyFOHp' \
    --offset '96' \
    --tag 'pF6Occtl' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Rk83OIA2", "items": [{"extraSubscriptionDays": 45, "itemId": "CSPifHXz", "itemName": "jidlpGXt", "quantity": 2}, {"extraSubscriptionDays": 30, "itemId": "0no7CQKt", "itemName": "OnoxOI9k", "quantity": 72}, {"extraSubscriptionDays": 53, "itemId": "4Z4EOLiv", "itemName": "oIdT4rnU", "quantity": 26}], "maxRedeemCountPerCampaignPerUser": 29, "maxRedeemCountPerCode": 47, "maxRedeemCountPerCodePerUser": 93, "maxSaleCount": 31, "name": "icud07gS", "redeemEnd": "1972-10-04T00:00:00Z", "redeemStart": "1991-03-04T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["Qh16Tlqr", "LSpm4Ojz", "qljtSfXy"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'jnQLnZRA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'rCNUhmmO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bTZA4EDk", "items": [{"extraSubscriptionDays": 38, "itemId": "x1cjhjFd", "itemName": "E48LfKFZ", "quantity": 43}, {"extraSubscriptionDays": 15, "itemId": "X0wPV3CY", "itemName": "eYk4lYhV", "quantity": 5}, {"extraSubscriptionDays": 91, "itemId": "wFvdtIhA", "itemName": "e9vVCRV0", "quantity": 69}], "maxRedeemCountPerCampaignPerUser": 42, "maxRedeemCountPerCode": 92, "maxRedeemCountPerCodePerUser": 8, "maxSaleCount": 82, "name": "KADL0KqX", "redeemEnd": "1995-07-21T00:00:00Z", "redeemStart": "1982-12-18T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["WgK2dP3k", "Joj3tNYZ", "rzNcoSxG"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'H5UJdpig' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '0WzpZacY' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H56HgiRN' \
    --body '{"categoryPath": "Kc41SElQ", "localizationDisplayNames": {"l1HplB73": "3PIMQP5M", "d64e5Bna": "qnZQbEz9", "qD3ub2gg": "mtLK4pGj"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eODlPJ1g' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'N1fjspsB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ybPS5g3Q' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'P1dB1uL8' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3PSJSe4A' \
    --body '{"localizationDisplayNames": {"hYYkyKOE": "qPhqN1Io", "nLMiEZr3": "V41pWyqO", "O8TrHgOY": "x7mavlzI"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'i4B4Y8T7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qhPksrUC' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'ImEMqrRr' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hebuH1fX' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'NkVGg06S' \
    --namespace "$AB_NAMESPACE" \
    --storeId '97gKqOEa' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'WcQz3Of6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '11' \
    --code 'wwZK12pe' \
    --limit '90' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'bdbTBkDD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 29}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '4f9aeaBz' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '100' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'a1XHaC7l' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '49' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'hkjqMKFY' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '57' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'RR71kXWm' \
    --namespace "$AB_NAMESPACE" \
    --code '0L3Gagz8' \
    --limit '46' \
    --offset '98' \
    --userId 'hXM5iVcG' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'oBlydz78' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'VJb8t6GU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'OGASudLC' \
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
    --body '{"currencyCode": "SXivGkY2", "currencySymbol": "676velQR", "currencyType": "REAL", "decimals": 85, "localizationDescriptions": {"vhaptzUM": "9IKqfdTT", "E9O9us2F": "R0G1zS1c", "WeAkcv7O": "vonpdGlz"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'tBQTh0vv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"Zwz9knwU": "rZ7sqSN4", "B8rJSbTO": "7d6vJAqr", "fsK8hXFj": "nrMVzQ4z"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'Kxgt9a09' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'QTFQmPxm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'yqETCr1A' \
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
    --body '{"data": [{"id": "GFTdf4au", "rewards": [{"currency": {"currencyCode": "X5AdwcG1", "namespace": "gjCvZQPy"}, "item": {"itemId": "VNJOS1KP", "itemSku": "eies2ZXI", "itemType": "LaSgjuzN"}, "quantity": 47, "type": "CURRENCY"}, {"currency": {"currencyCode": "8AC49ZCB", "namespace": "dj4DfVDC"}, "item": {"itemId": "zAJVpWdp", "itemSku": "hbh7OdZQ", "itemType": "leKUrym6"}, "quantity": 3, "type": "ITEM"}, {"currency": {"currencyCode": "CK20l3oU", "namespace": "CEWxOorx"}, "item": {"itemId": "0sCgFCra", "itemSku": "GlK7nQCi", "itemType": "Oa79kim8"}, "quantity": 58, "type": "ITEM"}]}, {"id": "3eKP9MWg", "rewards": [{"currency": {"currencyCode": "KACjwHww", "namespace": "MK1fnk2M"}, "item": {"itemId": "QqXuVTKE", "itemSku": "CB1rPVFR", "itemType": "tnZzdTKz"}, "quantity": 91, "type": "ITEM"}, {"currency": {"currencyCode": "W3OnBQgc", "namespace": "GpFE4cWl"}, "item": {"itemId": "H6URP8Td", "itemSku": "G3r7rBym", "itemType": "XiZhVdDn"}, "quantity": 82, "type": "ITEM"}, {"currency": {"currencyCode": "q049dg8y", "namespace": "VtGkn8AB"}, "item": {"itemId": "bR7KrIZ5", "itemSku": "72TWfY9i", "itemType": "OzAYD4dw"}, "quantity": 98, "type": "CURRENCY"}]}, {"id": "Bu1zdR6r", "rewards": [{"currency": {"currencyCode": "o1m154uP", "namespace": "b1ELwFV5"}, "item": {"itemId": "a7xKNBvV", "itemSku": "HFjdT7iW", "itemType": "vUrd7LBN"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "Fs9DCQu7", "namespace": "e6t2JnwJ"}, "item": {"itemId": "WAFxWzAZ", "itemSku": "UGo5DPlW", "itemType": "lbEl62hc"}, "quantity": 63, "type": "ITEM"}, {"currency": {"currencyCode": "S6urjBn0", "namespace": "g29ZicJ3"}, "item": {"itemId": "ExXi0oRA", "itemSku": "PFkT0ui1", "itemType": "ky6P1hc6"}, "quantity": 90, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"HPWoPzpg": "X2eG12fJ", "dpxg7jLD": "RIRDDgPd", "Y5G4mzFK": "yzjlsbgi"}}, {"platform": "STEAM", "platformDlcIdMap": {"eIKliSW8": "sWLPOl6d", "Bhxo6oif": "vonySCu0", "7zhcb2l0": "VnATZlBy"}}, {"platform": "STEAM", "platformDlcIdMap": {"fdGRo33B": "Pmwoq1wz", "2B6YHMKz": "cUn0qZeS", "iWbqkQId": "Ic4R8D18"}}]}' \
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
    --appType 'DEMO' \
    --entitlementClazz 'APP' \
    --entitlementName 'ioMO3uNY' \
    --itemId 'KNYsFvoC,7LpHFQkE,5Ge3I4oD' \
    --limit '63' \
    --offset '0' \
    --userId '1aXesdac' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId '8nXr3hUd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '12' \
    --status 'FAIL' \
    --userId '2hAro6iI' \
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
    --body '{"bundleId": "BClbRxQS", "password": "aBYTUfZZ"}' \
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
    --body '{"sandboxId": "MjnMfI0G"}' \
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
    --body '{"applicationName": "XMioDV2A", "serviceAccountId": "aLlrE2mH"}' \
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
    --body '{"data": [{"itemIdentity": "eSdI7SzU", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"SNkx3gXj": "xzLTIzxg", "Zr7KH9pT": "QGlSH4lD", "V0G4WRyz": "5C5434Cc"}}, {"itemIdentity": "So5kV9q4", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"8EYaOnCm": "BgRCysyO", "OisWW04i": "sNIizPnQ", "BaOERFG6": "Ed2pAhgC"}}, {"itemIdentity": "nyx15PrV", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"zX0EVI5G": "n1Io2NBJ", "BheQJhdi": "stk6ge0s", "6FNGp7rl": "AIHXCD0Z"}}]}' \
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
    --body '{"environment": "5xqikdyn"}' \
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
    --body '{"appId": "b8LblfDl", "publisherAuthenticationKey": "ZaI0Ra32"}' \
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
    --body '{"clientId": "6YijEeLX", "clientSecret": "ycZrvdIk", "organizationId": "jZ3xFIV0"}' \
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
    --body '{"relyingPartyCert": "BnzPq3yB"}' \
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
    --password 'y2A3aARu' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '8Sp5Z5mj' \
    --body '{"categoryPath": "2NuUCimK", "targetItemId": "N3TYoD3I", "targetNamespace": "LtchMlFB"}' \
    > test.out 2>&1
eval_tap $? 80 'SyncInGameItem' test.out

#- 81 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HDM3ieOa' \
    --body '{"appId": "iOMAxcns", "appType": "DLC", "baseAppId": "KLfJsEWN", "boothName": "2dSkNeTP", "categoryPath": "3WneMyPP", "clazz": "FKmTTWvk", "displayOrder": 36, "entitlementType": "CONSUMABLE", "ext": {"sOgoeesJ": {}, "Jr2WK2DR": {}, "Bmd8sPyh": {}}, "features": ["sobaGDty", "cKKVYTsW", "rT7U9kY3"], "images": [{"as": "ft7j3UnA", "caption": "N90FzEBz", "height": 58, "imageUrl": "KMS2ocG3", "smallImageUrl": "pRCsCDrp", "width": 74}, {"as": "6j0jI7CJ", "caption": "6Zd1Oxxa", "height": 46, "imageUrl": "URSH26pE", "smallImageUrl": "jUYDGeGx", "width": 69}, {"as": "xF0fz6JO", "caption": "2NrVgbC3", "height": 46, "imageUrl": "xUmdkqMQ", "smallImageUrl": "XwbTi3ff", "width": 22}], "itemIds": ["tDWIlCvJ", "nrvo6Je9", "7CSaAb9j"], "itemQty": {"fayLUyAB": 67, "ai3bzzQi": 32, "xls836Mt": 38}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"kE7ftsrA": {"description": "Klg4Ky73", "localExt": {"9ZbsNqWd": {}, "Vja3ijFJ": {}, "dW3AKm0y": {}}, "longDescription": "J7wC47Ft", "title": "XpDSWDlX"}, "LuRo8pci": {"description": "kbwKVwsr", "localExt": {"4EJsaNU2": {}, "7Xe8S8sQ": {}, "o99oGZxY": {}}, "longDescription": "8k5o6so0", "title": "2yhixhnQ"}, "SEoMRDda": {"description": "6LQ8hOCB", "localExt": {"kSqThtFV": {}, "KPFkNMPe": {}, "OzTGT1tU": {}}, "longDescription": "kszFfsd0", "title": "J7jwtdCQ"}}, "maxCount": 51, "maxCountPerUser": 48, "name": "FgDabzVV", "optionBoxConfig": {"boxItems": [{"count": 58, "itemId": "qbxH8VLI", "itemSku": "KjxbcXoI"}, {"count": 53, "itemId": "lODPrt3r", "itemSku": "r4CkMKMR"}, {"count": 9, "itemId": "6pO5I3Sn", "itemSku": "CKTC47VD"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 67, "fixedTrialCycles": 6, "graceDays": 48}, "regionData": {"GRMyz3OA": [{"currencyCode": "dijZRIei", "currencyNamespace": "RrWaply6", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1989-02-17T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1984-02-26T00:00:00Z", "discountedPrice": 88, "expireAt": "1980-05-17T00:00:00Z", "price": 93, "purchaseAt": "1997-06-07T00:00:00Z", "trialPrice": 59}, {"currencyCode": "pIZGGzIb", "currencyNamespace": "L9IP8sbR", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1977-02-15T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1985-07-31T00:00:00Z", "discountedPrice": 79, "expireAt": "1974-03-02T00:00:00Z", "price": 4, "purchaseAt": "1980-01-08T00:00:00Z", "trialPrice": 63}, {"currencyCode": "CG6REreq", "currencyNamespace": "HRUCykqf", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1972-05-07T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1971-05-19T00:00:00Z", "discountedPrice": 8, "expireAt": "1978-11-23T00:00:00Z", "price": 61, "purchaseAt": "1994-05-25T00:00:00Z", "trialPrice": 58}], "FeblCQTS": [{"currencyCode": "yWn6wKLP", "currencyNamespace": "ai51RrwS", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1981-06-24T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1997-07-25T00:00:00Z", "discountedPrice": 65, "expireAt": "1990-04-03T00:00:00Z", "price": 86, "purchaseAt": "1990-05-13T00:00:00Z", "trialPrice": 54}, {"currencyCode": "csA2eSyd", "currencyNamespace": "JcYAbpS7", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1989-02-04T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1987-08-03T00:00:00Z", "discountedPrice": 91, "expireAt": "1989-09-19T00:00:00Z", "price": 9, "purchaseAt": "1994-11-22T00:00:00Z", "trialPrice": 38}, {"currencyCode": "f0MpvqQ5", "currencyNamespace": "ZSbglJrt", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1977-10-28T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1997-05-07T00:00:00Z", "discountedPrice": 86, "expireAt": "1989-05-26T00:00:00Z", "price": 57, "purchaseAt": "1974-07-24T00:00:00Z", "trialPrice": 1}], "Zq0p2SKJ": [{"currencyCode": "fdMCeOQH", "currencyNamespace": "3eMZ5JOd", "currencyType": "REAL", "discountAmount": 40, "discountExpireAt": "1977-03-10T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1990-01-24T00:00:00Z", "discountedPrice": 42, "expireAt": "1972-07-24T00:00:00Z", "price": 59, "purchaseAt": "1983-04-26T00:00:00Z", "trialPrice": 21}, {"currencyCode": "4CoWHZBr", "currencyNamespace": "5AGB1ivo", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1991-05-24T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1980-02-20T00:00:00Z", "discountedPrice": 4, "expireAt": "1987-12-09T00:00:00Z", "price": 43, "purchaseAt": "1992-03-16T00:00:00Z", "trialPrice": 7}, {"currencyCode": "WjgJWw1w", "currencyNamespace": "JQBTWBzx", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1972-08-01T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1981-01-13T00:00:00Z", "discountedPrice": 55, "expireAt": "1985-03-02T00:00:00Z", "price": 84, "purchaseAt": "1988-11-05T00:00:00Z", "trialPrice": 78}]}, "seasonType": "PASS", "sku": "vWUEOfbH", "stackable": false, "status": "INACTIVE", "tags": ["PLn3ynAX", "Wf9dU4KS", "NQsTgv6S"], "targetCurrencyCode": "84MLWKUe", "targetNamespace": "67kbT1q6", "thumbnailUrl": "BkZBC4iH", "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 81 'CreateItem' test.out

#- 82 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'KKiKSiq0' \
    --appId 'vInxRmkn' \
    > test.out 2>&1
eval_tap $? 82 'GetItemByAppId' test.out

#- 83 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'kirpMWm5' \
    --baseAppId 'RLReEWXs' \
    --categoryPath 'zGqlYIe5' \
    --features 'VUxFR3wv' \
    --itemType 'INGAMEITEM' \
    --limit '96' \
    --offset '89' \
    --region '50Dc5ZhV' \
    --sortBy 'updatedAt,name:desc' \
    --storeId 'AFsq7wfC' \
    --tags 'voTa0VqE' \
    --targetNamespace 'H36QTmA9' \
    > test.out 2>&1
eval_tap $? 83 'QueryItems' test.out

#- 84 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'dlHrzUN9,jwUkKp0h,PzxS8yQc' \
    > test.out 2>&1
eval_tap $? 84 'ListBasicItemsByFeatures' test.out

#- 85 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'BIx9wA2E' \
    --sku 'Ye4QMCY7' \
    > test.out 2>&1
eval_tap $? 85 'GetItemBySku' test.out

#- 86 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'oj95FZxT' \
    --populateBundle  \
    --region 'Bacca5Tb' \
    --storeId 'hndd8att' \
    --sku '1hnBQWIX' \
    > test.out 2>&1
eval_tap $? 86 'GetLocaleItemBySku' test.out

#- 87 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'KuBthoqq' \
    --sku 'JfdmvBHe' \
    > test.out 2>&1
eval_tap $? 87 'GetItemIdBySku' test.out

#- 88 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'GVSD3D5O,MwQbS3wm,BxbHTjVG' \
    --storeId 'MW79XOkC' \
    > test.out 2>&1
eval_tap $? 88 'GetBulkItemIdBySkus' test.out

#- 89 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'JWn17GSG' \
    --region '9r8eEp70' \
    --storeId 'tCLaczS3' \
    --itemIds 'XsiMniVN' \
    > test.out 2>&1
eval_tap $? 89 'BulkGetLocaleItems' test.out

#- 90 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetAvailablePredicateTypes' test.out

#- 91 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'dgqXdRFx' \
    --body '{"itemIds": ["DBDnoN5c", "UKdbTHbE", "CJYGyhp2"]}' \
    > test.out 2>&1
eval_tap $? 91 'ValidateItemPurchaseCondition' test.out

#- 92 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'CODE' \
    --limit '53' \
    --offset '29' \
    --storeId 'HNhqlVmt' \
    --keyword 'FfawSHVs' \
    --language 'VwwhfBUy' \
    > test.out 2>&1
eval_tap $? 92 'SearchItems' test.out

#- 93 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '54' \
    --offset '66' \
    --sortBy 'createdAt:asc,displayOrder:asc,updatedAt:asc' \
    --storeId 'w384ia5e' \
    > test.out 2>&1
eval_tap $? 93 'QueryUncategorizedItems' test.out

#- 94 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'r9Wos5fC' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '9NtqXYln' \
    > test.out 2>&1
eval_tap $? 94 'GetItem' test.out

#- 95 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'JESTslBG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nNUcHRw7' \
    --body '{"appId": "1x6lpx3Y", "appType": "DEMO", "baseAppId": "ws0uhqid", "boothName": "gEqlqIXn", "categoryPath": "h0RMxtUq", "clazz": "tO8qQkte", "displayOrder": 44, "entitlementType": "DURABLE", "ext": {"FiWc0T7e": {}, "cWtLutD6": {}, "6BBOZ0Ji": {}}, "features": ["QxHMUbFT", "YCvrC3IC", "Jn0bj9OY"], "images": [{"as": "JJjLi7g6", "caption": "pEzEqCWQ", "height": 13, "imageUrl": "PYPvGbnD", "smallImageUrl": "HLWcp8U5", "width": 16}, {"as": "d4kE3PlO", "caption": "X58FylPt", "height": 23, "imageUrl": "AbTGWQB4", "smallImageUrl": "XeVDlGrD", "width": 9}, {"as": "fCCurSxY", "caption": "gysRmGCG", "height": 11, "imageUrl": "l25RVXma", "smallImageUrl": "WY6i2U1J", "width": 57}], "itemIds": ["xmtRRRH7", "ov9XVT1f", "5IbNVRh7"], "itemQty": {"PoN2meFu": 36, "MAMLBkrX": 31, "JqugCTae": 53}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"otd4V8j3": {"description": "m8vtpXQp", "localExt": {"ho5sPILI": {}, "iN21Qsqr": {}, "Kcv319kF": {}}, "longDescription": "0CKqVshX", "title": "3nDlx72c"}, "zqXqFj7S": {"description": "H4247gig", "localExt": {"sDljDP0g": {}, "XnPYTN4u": {}, "TSDRtQit": {}}, "longDescription": "ZQb2tiBz", "title": "lRO13kvc"}, "BpJev7fZ": {"description": "1tL7w8Hv", "localExt": {"GVn1YJ3g": {}, "HymYelEM": {}, "Q90leppr": {}}, "longDescription": "5J7bl31w", "title": "guzP1z60"}}, "maxCount": 83, "maxCountPerUser": 78, "name": "jBUohnxk", "optionBoxConfig": {"boxItems": [{"count": 1, "itemId": "e5j1DivZ", "itemSku": "MvEfrCux"}, {"count": 76, "itemId": "P32ANiX8", "itemSku": "4KzXnvZl"}, {"count": 14, "itemId": "o0M1pM5F", "itemSku": "HEJdLKrm"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 20, "fixedTrialCycles": 63, "graceDays": 66}, "regionData": {"S8461unl": [{"currencyCode": "wFQkji72", "currencyNamespace": "MTCgTkag", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1978-02-25T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1980-03-10T00:00:00Z", "discountedPrice": 25, "expireAt": "1983-07-15T00:00:00Z", "price": 78, "purchaseAt": "1992-06-03T00:00:00Z", "trialPrice": 17}, {"currencyCode": "1elI5XPJ", "currencyNamespace": "bqiFX4sP", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1989-10-03T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1997-03-02T00:00:00Z", "discountedPrice": 90, "expireAt": "1989-11-01T00:00:00Z", "price": 93, "purchaseAt": "1985-05-31T00:00:00Z", "trialPrice": 32}, {"currencyCode": "kV4Tc306", "currencyNamespace": "VfHa6G4f", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1979-07-14T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1992-10-07T00:00:00Z", "discountedPrice": 74, "expireAt": "1980-07-30T00:00:00Z", "price": 26, "purchaseAt": "1976-02-08T00:00:00Z", "trialPrice": 67}], "rkm2okMZ": [{"currencyCode": "Gr0ANSXG", "currencyNamespace": "Wg5XcoHu", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1981-08-15T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1985-02-08T00:00:00Z", "discountedPrice": 20, "expireAt": "1989-11-03T00:00:00Z", "price": 81, "purchaseAt": "1987-06-27T00:00:00Z", "trialPrice": 14}, {"currencyCode": "xZ3lfuqw", "currencyNamespace": "8of5sXex", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1984-02-09T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1982-06-11T00:00:00Z", "discountedPrice": 22, "expireAt": "1979-07-13T00:00:00Z", "price": 17, "purchaseAt": "1976-07-01T00:00:00Z", "trialPrice": 97}, {"currencyCode": "dsnaioCK", "currencyNamespace": "tIzBThcN", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1998-08-13T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1980-06-21T00:00:00Z", "discountedPrice": 31, "expireAt": "1972-04-19T00:00:00Z", "price": 1, "purchaseAt": "1975-04-08T00:00:00Z", "trialPrice": 32}], "WBsSaoig": [{"currencyCode": "kfFLDOCl", "currencyNamespace": "t1mGAfJ2", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1978-09-30T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1990-12-25T00:00:00Z", "discountedPrice": 10, "expireAt": "1988-01-20T00:00:00Z", "price": 53, "purchaseAt": "1982-01-11T00:00:00Z", "trialPrice": 85}, {"currencyCode": "3y3qmXq6", "currencyNamespace": "4BFeo6K1", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1977-03-01T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1977-06-03T00:00:00Z", "discountedPrice": 50, "expireAt": "1982-11-18T00:00:00Z", "price": 84, "purchaseAt": "1974-01-03T00:00:00Z", "trialPrice": 44}, {"currencyCode": "LZg5gNdN", "currencyNamespace": "THlHlGVK", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1977-03-24T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1972-12-22T00:00:00Z", "discountedPrice": 10, "expireAt": "1992-02-07T00:00:00Z", "price": 38, "purchaseAt": "1993-02-04T00:00:00Z", "trialPrice": 77}]}, "seasonType": "PASS", "sku": "z9FiJ3Ze", "stackable": true, "status": "ACTIVE", "tags": ["PkYaCB2V", "rKnqKMPE", "BCEPSENh"], "targetCurrencyCode": "u2OsywsW", "targetNamespace": "NHUVogu4", "thumbnailUrl": "ZqIk0Ag8", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateItem' test.out

#- 96 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'mqtJ86BU' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'xwIN72cL' \
    > test.out 2>&1
eval_tap $? 96 'DeleteItem' test.out

#- 97 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'B4JRpO33' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 12, "orderNo": "0jo0aEKw"}' \
    > test.out 2>&1
eval_tap $? 97 'AcquireItem' test.out

#- 98 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'Yc4SXoCq' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'McXE9GtX' \
    > test.out 2>&1
eval_tap $? 98 'GetApp' test.out

#- 99 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'ePQCX7ad' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6jfeDf3g' \
    --body '{"carousel": [{"alt": "cmysPKRn", "previewUrl": "tGPNI2wl", "thumbnailUrl": "Ai0iQvjH", "type": "video", "url": "yoyy24cr", "videoSource": "vimeo"}, {"alt": "KPEyqVeQ", "previewUrl": "yCM6qZdG", "thumbnailUrl": "tZKfo5KH", "type": "image", "url": "DET9XNMB", "videoSource": "vimeo"}, {"alt": "FDEDVIoi", "previewUrl": "OxceqKms", "thumbnailUrl": "ytEbfuZE", "type": "video", "url": "7QFp1nsP", "videoSource": "youtube"}], "developer": "HgoYGdQ2", "forumUrl": "c0Ajicyh", "genres": ["MassivelyMultiplayer", "RPG", "Casual"], "localizations": {"n4IkaygS": {"announcement": "lT3K5Vod", "slogan": "r2HONV7s"}, "cqTYZ0VT": {"announcement": "jf0ozstm", "slogan": "Sy7n8HOT"}, "dSDrdcee": {"announcement": "RiPVf92S", "slogan": "BvarjxH8"}}, "platformRequirements": {"rdqhf1Nj": [{"additionals": "NXfO7iiL", "directXVersion": "2b4fwthB", "diskSpace": "JEvchu9L", "graphics": "ApCIyJOV", "label": "D8YLBtOm", "osVersion": "wKFXSyT8", "processor": "yJl9C4xQ", "ram": "MM3jPIzU", "soundCard": "uAWDoMFE"}, {"additionals": "MLzWCcKi", "directXVersion": "g7Uyx5mb", "diskSpace": "enf4GB2h", "graphics": "3Ewv1N2n", "label": "P7BUxZRM", "osVersion": "aIhMVlgk", "processor": "JfsIlZGg", "ram": "7NUuOEJH", "soundCard": "uehw2wwA"}, {"additionals": "RokgE3Ta", "directXVersion": "293YL29A", "diskSpace": "cIEH9rrs", "graphics": "Kb55ugsL", "label": "GxhJ2pu9", "osVersion": "5tu5hHcr", "processor": "llRP0Swd", "ram": "GFzzYyCd", "soundCard": "5j5NLDJV"}], "irHSTiA9": [{"additionals": "MrN7g9VG", "directXVersion": "PgbCgpWG", "diskSpace": "E6rq2aHS", "graphics": "az5KW7kL", "label": "MJGAxpc1", "osVersion": "ZEvo9sDM", "processor": "2BS3K7y8", "ram": "7KB3LWZZ", "soundCard": "iWfoqoDg"}, {"additionals": "61zQ6DDL", "directXVersion": "YxkfoAmJ", "diskSpace": "BG9F5Q46", "graphics": "lNqqLrL9", "label": "X68iD3Aa", "osVersion": "jJFagd44", "processor": "R4cg8K3i", "ram": "vZqvJF2N", "soundCard": "0UBZZzue"}, {"additionals": "NrpBeutS", "directXVersion": "4NTW2oAz", "diskSpace": "q1NZ0PAy", "graphics": "BGtAzAPz", "label": "3Ba5rtri", "osVersion": "4jfF6N5J", "processor": "HGb32Txt", "ram": "2rsRIWY1", "soundCard": "nrJotGtz"}], "gUOWwLIm": [{"additionals": "2aK48N4p", "directXVersion": "5P2STlyb", "diskSpace": "bCQWIWAM", "graphics": "7q4lLT5E", "label": "Itj2Yryb", "osVersion": "tQ4htQSp", "processor": "lJfuR7dz", "ram": "lyTcQAV6", "soundCard": "00vS7Dse"}, {"additionals": "upyR42fg", "directXVersion": "CAXIjsBK", "diskSpace": "K7zNUL7Y", "graphics": "i0j5NbwL", "label": "lg3d4F6b", "osVersion": "9Uvd4fI1", "processor": "3aMdXxF0", "ram": "bWW3doWF", "soundCard": "7rnsNWnB"}, {"additionals": "7iAqo19O", "directXVersion": "Eo4eyE9h", "diskSpace": "4JVhsrSi", "graphics": "efRWmGme", "label": "9X9wrDFX", "osVersion": "orponmWk", "processor": "aLC08Uma", "ram": "YgTJdg2Z", "soundCard": "tw3SBOfr"}]}, "platforms": ["MacOS", "IOS", "Android"], "players": ["Coop", "LocalCoop", "MMO"], "primaryGenre": "MassivelyMultiplayer", "publisher": "2rgpUfz5", "releaseDate": "1987-11-30T00:00:00Z", "websiteUrl": "PxgGrWhh"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateApp' test.out

#- 100 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'rXgguxHk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TUjRI1qO' \
    > test.out 2>&1
eval_tap $? 100 'DisableItem' test.out

#- 101 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'PahJX6S4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'GetItemDynamicData' test.out

#- 102 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'aAwNmI5p' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WeQzDUVP' \
    > test.out 2>&1
eval_tap $? 102 'EnableItem' test.out

#- 103 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'vyZz5np7' \
    --itemId 'FuB8XAmm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U0DqIgZi' \
    > test.out 2>&1
eval_tap $? 103 'FeatureItem' test.out

#- 104 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'RUrXleqU' \
    --itemId '3hGnq5d6' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NXnenvZv' \
    > test.out 2>&1
eval_tap $? 104 'DefeatureItem' test.out

#- 105 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'c6VJabhE' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'MzgtffWU' \
    --populateBundle  \
    --region 'uvYwOI6H' \
    --storeId '6tzSydw9' \
    > test.out 2>&1
eval_tap $? 105 'GetLocaleItem' test.out

#- 106 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'G5NJ4NIc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X55bMUTf' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 94, "comparison": "isLessThanOrEqual", "name": "ZQrzW700", "predicateType": "SeasonTierPredicate", "value": "HSsndKVS", "values": ["ySURNArp", "1lrPzx9i", "SzFLBDJU"]}, {"anyOf": 3, "comparison": "isLessThanOrEqual", "name": "PMOuO4uR", "predicateType": "EntitlementPredicate", "value": "BP5YuZum", "values": ["IQMT6XLU", "KycIuu3B", "74c3Aos3"]}, {"anyOf": 71, "comparison": "isGreaterThan", "name": "p9P8Zfxu", "predicateType": "SeasonPassPredicate", "value": "9MQWbqGN", "values": ["cx51VD6H", "v9DZVgMT", "aLgam2FD"]}]}, {"operator": "or", "predicates": [{"anyOf": 77, "comparison": "isGreaterThan", "name": "mRKzBZHX", "predicateType": "EntitlementPredicate", "value": "3DcQ8bK8", "values": ["JlCQ4FQz", "2PRuY500", "vqnaUmgO"]}, {"anyOf": 31, "comparison": "includes", "name": "D4b6ivpK", "predicateType": "SeasonPassPredicate", "value": "228dxklj", "values": ["UAJAqzXc", "xA7d4lwe", "h0Qpw1nn"]}, {"anyOf": 29, "comparison": "isGreaterThanOrEqual", "name": "VUO98tAh", "predicateType": "EntitlementPredicate", "value": "uWp67n1q", "values": ["sxUpch89", "cOFPPr06", "XkVCw8Oz"]}]}, {"operator": "or", "predicates": [{"anyOf": 20, "comparison": "isLessThanOrEqual", "name": "qESSGwhv", "predicateType": "SeasonPassPredicate", "value": "TD6KXM9H", "values": ["7Aa33Dss", "Qa2aEjbn", "v1kdwAlN"]}, {"anyOf": 43, "comparison": "isGreaterThanOrEqual", "name": "L0r10eOl", "predicateType": "SeasonTierPredicate", "value": "2uvmGkAm", "values": ["Q34DPamG", "WOlViLp4", "7mtuDrIo"]}, {"anyOf": 1, "comparison": "isNot", "name": "O6hRHckI", "predicateType": "SeasonPassPredicate", "value": "Ic2ulPLu", "values": ["Qio33owR", "hbkGL62A", "klvCFzgg"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 106 'UpdateItemPurchaseCondition' test.out

#- 107 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'Fp7CviI9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "lHE9NahK"}' \
    > test.out 2>&1
eval_tap $? 107 'ReturnItem' test.out

#- 108 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --name 'Sme147sY' \
    --offset '58' \
    --tag 'I3GdmWrV' \
    > test.out 2>&1
eval_tap $? 108 'QueryKeyGroups' test.out

#- 109 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "mFsXpGKt", "name": "SXhW4K2A", "status": "ACTIVE", "tags": ["D2JWY4op", "arkHEq5Y", "9rHgOBhG"]}' \
    > test.out 2>&1
eval_tap $? 109 'CreateKeyGroup' test.out

#- 110 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'rXvlFzm2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetKeyGroup' test.out

#- 111 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'SbOJ0AIc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ujqufhPp", "name": "Hbc0IkTY", "status": "ACTIVE", "tags": ["xaRCULS1", "mQVBsd91", "e2JoKFEu"]}' \
    > test.out 2>&1
eval_tap $? 111 'UpdateKeyGroup' test.out

#- 112 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'prmgRmAg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'GetKeyGroupDynamic' test.out

#- 113 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'NPuvUmxb' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '84' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 113 'ListKeys' test.out

#- 114 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'zQ8Ujn2v' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 114 'UploadKeys' test.out

#- 115 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '0PfoMEqD' \
    --limit '62' \
    --offset '92' \
    --orderNos 't1If3xPd,a7rXLw0J,rGMf731s' \
    --sortBy 'JPL7lx4u' \
    --startTime 'bH1g0P1N' \
    --status 'FULFILL_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 115 'QueryOrders' test.out

#- 116 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetOrderStatistics' test.out

#- 117 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 't63h6uIM' \
    > test.out 2>&1
eval_tap $? 117 'GetOrder' test.out

#- 118 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vrrJG7nU' \
    --body '{"description": "ds2jDwf7"}' \
    > test.out 2>&1
eval_tap $? 118 'RefundOrder' test.out

#- 119 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 119 'GetPaymentCallbackConfig' test.out

#- 120 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "1fJuooMS", "privateKey": "7xVUH1L5"}' \
    > test.out 2>&1
eval_tap $? 120 'UpdatePaymentCallbackConfig' test.out

#- 121 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'll5iNH8B' \
    --externalId 'adZRBh24' \
    --limit '1' \
    --notificationSource 'STRIPE' \
    --notificationType 'JW4QQsd5' \
    --offset '1' \
    --paymentOrderNo 'BT4DLU5w' \
    --startDate 'UqgyaHDn' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 121 'QueryPaymentNotifications' test.out

#- 122 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'oYyHwtmk' \
    --limit '15' \
    --offset '25' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 122 'QueryPaymentOrders' test.out

#- 123 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "iFW7F49E", "currencyNamespace": "kkXykjpn", "customParameters": {"h9KQQrDM": {}, "h0eO8HUY": {}, "H8PfYkwr": {}}, "description": "s4DTvCSj", "extOrderNo": "hx4zr0jD", "extUserId": "u4xHaFRl", "itemType": "INGAMEITEM", "language": "SYQ-st", "metadata": {"OT0JPc1j": "XpLGUoVJ", "Hh8XJgFO": "gUY7E9tx", "eI8eZAaw": "XoZljYgU"}, "notifyUrl": "p78ABkzw", "omitNotification": false, "platform": "M0ve0ggQ", "price": 94, "recurringPaymentOrderNo": "hlVGieqy", "region": "R2XtsT2z", "returnUrl": "kFAcWsaS", "sandbox": false, "sku": "exmnnkk2", "subscriptionId": "gOGPFXuz", "targetNamespace": "lKRyrJyd", "targetUserId": "HmYdkQbV", "title": "bp8A7Lxo"}' \
    > test.out 2>&1
eval_tap $? 123 'CreatePaymentOrderByDedicated' test.out

#- 124 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '9bG7g1YN' \
    > test.out 2>&1
eval_tap $? 124 'ListExtOrderNoByExtTxId' test.out

#- 125 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vctLKUGv' \
    > test.out 2>&1
eval_tap $? 125 'GetPaymentOrder' test.out

#- 126 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AI8mYKyV' \
    --body '{"extTxId": "SmTOR1V2", "paymentMethod": "V1WUHJAW", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 126 'ChargePaymentOrder' test.out

#- 127 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3nYOIS73' \
    --body '{"description": "rnSqlYWE"}' \
    > test.out 2>&1
eval_tap $? 127 'RefundPaymentOrderByDedicated' test.out

#- 128 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'N8uX7I0J' \
    --body '{"amount": 61, "currencyCode": "s6eE9RZR", "notifyType": "REFUND", "paymentProvider": "ADYEN", "salesTax": 58, "vat": 87}' \
    > test.out 2>&1
eval_tap $? 128 'SimulatePaymentOrderNotification' test.out

#- 129 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Bu6PEuMR' \
    > test.out 2>&1
eval_tap $? 129 'GetPaymentOrderChargeStatus' test.out

#- 130 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 130 'GetPlatformWalletConfig' test.out

#- 131 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedBalanceOrigins": ["Steam", "Twitch", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 131 'UpdatePlatformWalletConfig' test.out

#- 132 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 132 'ResetPlatformWalletConfig' test.out

#- 133 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "oHHtbIrJ", "eventTopic": "vetLxnLw", "maxAwarded": 44, "maxAwardedPerUser": 43, "namespaceExpression": "OzkdDpeR", "rewardCode": "ex506HUO", "rewardConditions": [{"condition": "gnHRMIMB", "conditionName": "FdZXcss1", "eventName": "EhIJSwL7", "rewardItems": [{"duration": 98, "itemId": "4itYK38w", "quantity": 37}, {"duration": 11, "itemId": "D0kmktsw", "quantity": 1}, {"duration": 81, "itemId": "36bfqOFk", "quantity": 8}]}, {"condition": "wdZqYech", "conditionName": "0teeuITX", "eventName": "RXlGUU68", "rewardItems": [{"duration": 12, "itemId": "LpsAXSxA", "quantity": 92}, {"duration": 51, "itemId": "7a82nnK7", "quantity": 64}, {"duration": 95, "itemId": "Wjl6JnxL", "quantity": 100}]}, {"condition": "d6P7NAqD", "conditionName": "8wEpUueL", "eventName": "XsbsVSyI", "rewardItems": [{"duration": 90, "itemId": "nVhWj2tM", "quantity": 27}, {"duration": 42, "itemId": "pDlYojfk", "quantity": 27}, {"duration": 90, "itemId": "T11b0AhC", "quantity": 73}]}], "userIdExpression": "kWNkwUsn"}' \
    > test.out 2>&1
eval_tap $? 133 'CreateReward' test.out

#- 134 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'lYXvz0VN' \
    --limit '35' \
    --offset '94' \
    --sortBy 'namespace:asc,rewardCode,namespace:desc' \
    > test.out 2>&1
eval_tap $? 134 'QueryRewards' test.out

#- 135 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'ExportRewards' test.out

#- 136 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 136 'ImportRewards' test.out

#- 137 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'aTEsysFU' \
    > test.out 2>&1
eval_tap $? 137 'GetReward' test.out

#- 138 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'VFAe69Sq' \
    --body '{"description": "phN3AmUl", "eventTopic": "H5ri53nU", "maxAwarded": 69, "maxAwardedPerUser": 16, "namespaceExpression": "TwYSXeTI", "rewardCode": "Zfn9YHtD", "rewardConditions": [{"condition": "Piol1ZSO", "conditionName": "oqVqOe4B", "eventName": "NRvHYsjy", "rewardItems": [{"duration": 63, "itemId": "6t8FUTMk", "quantity": 47}, {"duration": 39, "itemId": "6sptGoWB", "quantity": 51}, {"duration": 64, "itemId": "TnF3qHOB", "quantity": 15}]}, {"condition": "9E0aJk0s", "conditionName": "kBz29fZt", "eventName": "oHvSkeBC", "rewardItems": [{"duration": 96, "itemId": "XpqkbZwD", "quantity": 46}, {"duration": 96, "itemId": "x7eNC4qS", "quantity": 2}, {"duration": 65, "itemId": "Kpr0K3Cn", "quantity": 14}]}, {"condition": "FQDR97Fe", "conditionName": "VN1xRUBZ", "eventName": "g27NyaMQ", "rewardItems": [{"duration": 99, "itemId": "3quekdbk", "quantity": 18}, {"duration": 84, "itemId": "StH16JJD", "quantity": 78}, {"duration": 51, "itemId": "vLaD21R8", "quantity": 56}]}], "userIdExpression": "hyptk8et"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateReward' test.out

#- 139 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'gvhs0KH1' \
    > test.out 2>&1
eval_tap $? 139 'DeleteReward' test.out

#- 140 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'HSTTxseH' \
    --body '{"payload": {"AXbNdC4N": {}, "jicOUZHl": {}, "E7SZmSfR": {}}}' \
    > test.out 2>&1
eval_tap $? 140 'CheckEventCondition' test.out

#- 141 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'sfbvtcRx' \
    --body '{"conditionName": "pcVrXj65", "userId": "aQUAVTzz"}' \
    > test.out 2>&1
eval_tap $? 141 'DeleteRewardConditionRecord' test.out

#- 142 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'ListStores' test.out

#- 143 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "O5MJVLAw", "defaultRegion": "veSoTyjD", "description": "1DrJOIUG", "supportedLanguages": ["1YANvWQU", "HC4oNUrA", "gUjMfpSu"], "supportedRegions": ["7f3nQPBF", "j4viNR9C", "8AWT6LcN"], "title": "ZqpgnbUL"}' \
    > test.out 2>&1
eval_tap $? 143 'CreateStore' test.out

#- 144 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'a9YR7WE1' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 144 'ImportStore' test.out

#- 145 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetPublishedStore' test.out

#- 146 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'DeletePublishedStore' test.out

#- 147 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetPublishedStoreBackup' test.out

#- 148 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'RollbackPublishedStore' test.out

#- 149 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'r4olLHMC' \
    > test.out 2>&1
eval_tap $? 149 'GetStore' test.out

#- 150 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pgQRgZvj' \
    --body '{"defaultLanguage": "vCPJSRb7", "defaultRegion": "msQvRhyU", "description": "lyzAmCLj", "supportedLanguages": ["VvaoKBy4", "ZlpLBP3a", "7K4vBWJK"], "supportedRegions": ["XliNvUR0", "qbXplF6K", "VG7PiCtJ"], "title": "qKnFizU0"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdateStore' test.out

#- 151 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NYlRynKh' \
    > test.out 2>&1
eval_tap $? 151 'DeleteStore' test.out

#- 152 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '8DzsjmT4' \
    --action 'UPDATE' \
    --itemSku 'g8RXOkbp' \
    --itemType 'CODE' \
    --limit '74' \
    --offset '5' \
    --selected  \
    --sortBy 'updatedAt:desc,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'C9FUOEug' \
    --updatedAtStart 'C6we4lfl' \
    > test.out 2>&1
eval_tap $? 152 'QueryChanges' test.out

#- 153 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'maq9zE7d' \
    > test.out 2>&1
eval_tap $? 153 'PublishAll' test.out

#- 154 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wUtDsmrj' \
    > test.out 2>&1
eval_tap $? 154 'PublishSelected' test.out

#- 155 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Pnn4hcya' \
    > test.out 2>&1
eval_tap $? 155 'SelectAllRecords' test.out

#- 156 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '3Ho9wb4M' \
    --action 'UPDATE' \
    --itemSku 'J1arHEaL' \
    --itemType 'BUNDLE' \
    --type 'STORE' \
    --updatedAtEnd 'Pm2bVsSk' \
    --updatedAtStart 'g4nXNZNb' \
    > test.out 2>&1
eval_tap $? 156 'GetStatistic' test.out

#- 157 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Pfln1q8C' \
    > test.out 2>&1
eval_tap $? 157 'UnselectAllRecords' test.out

#- 158 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '0rMyvlai' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7d2j4pUh' \
    > test.out 2>&1
eval_tap $? 158 'SelectRecord' test.out

#- 159 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'ZaQfAWr2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MEaWRsgj' \
    > test.out 2>&1
eval_tap $? 159 'UnselectRecord' test.out

#- 160 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rXsg3xmp' \
    --targetStoreId '8Avb6jlZ' \
    > test.out 2>&1
eval_tap $? 160 'CloneStore' test.out

#- 161 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'v3ZPspwA' \
    > test.out 2>&1
eval_tap $? 161 'ExportStore' test.out

#- 162 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'JO026xHU' \
    --limit '4' \
    --offset '99' \
    --sku '836cRtWN' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId 'yzQPyycu' \
    > test.out 2>&1
eval_tap $? 162 'QuerySubscriptions' test.out

#- 163 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'V4WSygJy' \
    > test.out 2>&1
eval_tap $? 163 'RecurringChargeSubscription' test.out

#- 164 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'gtRoZWkV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 164 'GetTicketDynamic' test.out

#- 165 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'oPDTA0e0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "Fd1KkiQL"}' \
    > test.out 2>&1
eval_tap $? 165 'DecreaseTicketSale' test.out

#- 166 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'tCesXuhX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 166 'GetTicketBoothID' test.out

#- 167 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'OtwkfWYe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 58, "orderNo": "r0L5hx7y"}' \
    > test.out 2>&1
eval_tap $? 167 'IncreaseTicketSale' test.out

#- 168 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'srhAdgeO' \
    --body '{"achievements": [{"id": "o26RSzbk", "value": 2}, {"id": "J3YBf3yQ", "value": 48}, {"id": "BpOMpvjw", "value": 3}], "steamUserId": "UksJOqPW"}' \
    > test.out 2>&1
eval_tap $? 168 'UnlockSteamUserAchievement' test.out

#- 169 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '0b5mLeDw' \
    --xboxUserId 'X8J14WWt' \
    > test.out 2>&1
eval_tap $? 169 'GetXblUserAchievements' test.out

#- 170 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'wHr6xK1t' \
    --body '{"achievements": [{"id": "9gb6JGDI", "percentComplete": 78}, {"id": "iVHkTlBp", "percentComplete": 43}, {"id": "uournWwJ", "percentComplete": 36}], "serviceConfigId": "IKOQwNtU", "titleId": "hvEpFwaw", "xboxUserId": "ScHGiEJO"}' \
    > test.out 2>&1
eval_tap $? 170 'UpdateXblUserAchievement' test.out

#- 171 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'NwvWgTN7' \
    > test.out 2>&1
eval_tap $? 171 'AnonymizeCampaign' test.out

#- 172 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 't6BxjTxy' \
    > test.out 2>&1
eval_tap $? 172 'AnonymizeEntitlement' test.out

#- 173 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZLHs2Pc' \
    > test.out 2>&1
eval_tap $? 173 'AnonymizeFulfillment' test.out

#- 174 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'pZepjxFI' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeIntegration' test.out

#- 175 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '6IB3k65j' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeOrder' test.out

#- 176 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hv8aGcoB' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizePayment' test.out

#- 177 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'YTtYFRHh' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeSubscription' test.out

#- 178 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'mlKbEsKT' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeWallet' test.out

#- 179 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ag6ILh4J' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'GaFFiVon' \
    --features 'ToKTyNrh,tm0RnsY9,vS7luwce' \
    --itemId 'c4XCJxQc,JL0A2Mia,qL2b5jQc' \
    --limit '18' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 179 'QueryUserEntitlements' test.out

#- 180 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BowwkpIl' \
    --body '[{"endDate": "1979-02-15T00:00:00Z", "grantedCode": "wb4QWTXO", "itemId": "n0n6OrNa", "itemNamespace": "mZlIwRNx", "language": "mAea-mPxD", "quantity": 32, "region": "wiMkn68s", "source": "REFERRAL_BONUS", "startDate": "1972-05-10T00:00:00Z", "storeId": "FmeEkr1d"}, {"endDate": "1979-12-07T00:00:00Z", "grantedCode": "Sv6viNNG", "itemId": "D1EOTrLj", "itemNamespace": "awzsEuR9", "language": "bRzu_gEaJ", "quantity": 8, "region": "iElpfrsS", "source": "IAP", "startDate": "1988-04-01T00:00:00Z", "storeId": "Av5BZs8a"}, {"endDate": "1980-04-22T00:00:00Z", "grantedCode": "W1CX2uRE", "itemId": "UhkbpWs8", "itemNamespace": "8j3DOxYS", "language": "jpH_bmDy", "quantity": 76, "region": "eSnXJ6cH", "source": "REWARD", "startDate": "1979-11-18T00:00:00Z", "storeId": "Snqmgwzk"}]' \
    > test.out 2>&1
eval_tap $? 180 'GrantUserEntitlement' test.out

#- 181 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'VryYgwxX' \
    --activeOnly  \
    --appId 'fX3IwvdF' \
    > test.out 2>&1
eval_tap $? 181 'GetUserAppEntitlementByAppId' test.out

#- 182 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'kGoFbIRN' \
    --activeOnly  \
    --limit '88' \
    --offset '4' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserEntitlementsByAppType' test.out

#- 183 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NHyjwFEB' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId 's6wiLIIf' \
    > test.out 2>&1
eval_tap $? 183 'GetUserEntitlementByItemId' test.out

#- 184 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xbu0vN9B' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'Oy3Vo9fg' \
    > test.out 2>&1
eval_tap $? 184 'GetUserEntitlementBySku' test.out

#- 185 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNSF6Zhg' \
    --appIds '6fji2yvb,CXaOqnUu,oUqHwuYa' \
    --itemIds 'KcHRI1i9,S7ncrS3e,M36B3N2H' \
    --skus 'ovqecA3B,TVJM01Bk,AUQI3oWu' \
    > test.out 2>&1
eval_tap $? 185 'ExistsAnyUserActiveEntitlement' test.out

#- 186 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCMIQbie' \
    --itemIds 'r9ZNFU4B,ntaUUmfM,rzXUpHOI' \
    > test.out 2>&1
eval_tap $? 186 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 187 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'y3GwYVv1' \
    --appId 'cLzbfshI' \
    > test.out 2>&1
eval_tap $? 187 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 188 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQTehHCI' \
    --entitlementClazz 'CODE' \
    --itemId 'gS58bq4V' \
    > test.out 2>&1
eval_tap $? 188 'GetUserEntitlementOwnershipByItemId' test.out

#- 189 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'hOWglBEX' \
    --ids 'qJdbiSO0,93B99dmd,R1hLV0IZ' \
    > test.out 2>&1
eval_tap $? 189 'GetUserEntitlementOwnershipByItemIds' test.out

#- 190 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nx7vnFG8' \
    --entitlementClazz 'MEDIA' \
    --sku 'xFiJ5FtI' \
    > test.out 2>&1
eval_tap $? 190 'GetUserEntitlementOwnershipBySku' test.out

#- 191 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ucOzZmh4' \
    --entitlementIds 'atmc7WWc' \
    > test.out 2>&1
eval_tap $? 191 'RevokeUserEntitlements' test.out

#- 192 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'jZkUVUCH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmvC64SF' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlement' test.out

#- 193 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId '4Znkk32h' \
    --namespace "$AB_NAMESPACE" \
    --userId '049dHXni' \
    --body '{"endDate": "1992-03-21T00:00:00Z", "nullFieldList": ["oaBdWZTn", "Qwbgbjih", "wleybCUB"], "startDate": "1982-02-01T00:00:00Z", "status": "ACTIVE", "useCount": 44}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateUserEntitlement' test.out

#- 194 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'hXt9TYJj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AVyAP9TZ' \
    --body '{"options": ["5i0fLcE2", "y0VIRHJD", "UybEwTEq"], "useCount": 27}' \
    > test.out 2>&1
eval_tap $? 194 'ConsumeUserEntitlement' test.out

#- 195 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '29vZLffL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lZmavBPH' \
    > test.out 2>&1
eval_tap $? 195 'DisableUserEntitlement' test.out

#- 196 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'wJCkHtCm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nShDnzJc' \
    > test.out 2>&1
eval_tap $? 196 'EnableUserEntitlement' test.out

#- 197 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'AuyvNqnR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K3qKJ5m6' \
    > test.out 2>&1
eval_tap $? 197 'GetUserEntitlementHistories' test.out

#- 198 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'CC2B0svh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XPmUpdrQ' \
    > test.out 2>&1
eval_tap $? 198 'RevokeUserEntitlement' test.out

#- 199 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '5XfY9n5o' \
    --body '{"duration": 41, "endDate": "1995-06-27T00:00:00Z", "itemId": "iWKzSMAU", "itemSku": "h4bjPyOu", "language": "iT83k0HO", "order": {"currency": {"currencyCode": "ctmDF5Ff", "currencySymbol": "Tt5T424X", "currencyType": "REAL", "decimals": 57, "namespace": "zIdU1s72"}, "ext": {"1mU7ASLc": {}, "QvqzWexh": {}, "OqKgXFT8": {}}, "free": true}, "orderNo": "8OTVXfnh", "origin": "Stadia", "quantity": 80, "region": "XNvAnrTj", "source": "PURCHASE", "startDate": "1989-01-14T00:00:00Z", "storeId": "LYXJ1g80"}' \
    > test.out 2>&1
eval_tap $? 199 'FulfillItem' test.out

#- 200 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'dq0mbgbi' \
    --body '{"code": "tLbr5Nwd", "language": "jZ-UrOl", "region": "N0TDII67"}' \
    > test.out 2>&1
eval_tap $? 200 'RedeemCode' test.out

#- 201 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '17OAofpS' \
    --body '{"origin": "System", "rewards": [{"currency": {"currencyCode": "ZwqYYkhz", "namespace": "ukf0XrYF"}, "item": {"itemId": "dLVcQkwH", "itemSku": "buaSn7wk", "itemType": "juu9mLvV"}, "quantity": 91, "type": "CURRENCY"}, {"currency": {"currencyCode": "OycIHGFZ", "namespace": "Jp0bycwX"}, "item": {"itemId": "YhCRBdBY", "itemSku": "LrpPffxo", "itemType": "vVq3jXte"}, "quantity": 23, "type": "CURRENCY"}, {"currency": {"currencyCode": "X6nM8tx7", "namespace": "0nh6CZ6v"}, "item": {"itemId": "BNUNtEcb", "itemSku": "00LFOpDk", "itemType": "pQ0az8Nv"}, "quantity": 18, "type": "ITEM"}], "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 201 'FulfillRewards' test.out

#- 202 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'UdiFu25u' \
    --endTime 'yZJ48JUI' \
    --limit '28' \
    --offset '100' \
    --productId '5Pkasxkt' \
    --startTime 'irEC7Hfs' \
    --status 'VERIFIED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 202 'QueryUserIAPOrders' test.out

#- 203 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'JoNel2uQ' \
    > test.out 2>&1
eval_tap $? 203 'QueryAllUserIAPOrders' test.out

#- 204 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'NAavaYJp' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "qf_lC", "productId": "Ut2lhqsD", "region": "FqHMGHiV", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 204 'MockFulfillIAPItem' test.out

#- 205 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'lqXBLMsw' \
    --itemId 'lU4Bd6PJ' \
    --limit '55' \
    --offset '81' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 205 'QueryUserOrders' test.out

#- 206 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'sABcC5M1' \
    --body '{"currencyCode": "e2oNQUdR", "currencyNamespace": "Sjkg9YU4", "discountedPrice": 56, "ext": {"4iq7byc2": {}, "dCL3ve3D": {}, "gaGVDI18": {}}, "itemId": "IppGGhaL", "language": "ndEnlNf8", "options": {"skipPriceValidation": true}, "platform": "Xbox", "price": 63, "quantity": 68, "region": "reVQN18y", "returnUrl": "iJxxshYv", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 206 'AdminCreateUserOrder' test.out

#- 207 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tj9JqMAT' \
    --itemId 'PCl9runZ' \
    > test.out 2>&1
eval_tap $? 207 'CountOfPurchasedItem' test.out

#- 208 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'T7zqPFzu' \
    --userId 'nPWEbNF9' \
    > test.out 2>&1
eval_tap $? 208 'GetUserOrder' test.out

#- 209 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xh8iv6it' \
    --userId 'QOvfupjt' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "Q72rRMef"}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateUserOrderStatus' test.out

#- 210 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'asiPtOKz' \
    --userId 'CvmXTiX7' \
    > test.out 2>&1
eval_tap $? 210 'FulfillUserOrder' test.out

#- 211 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'S9QRAMV8' \
    --userId 'xfmRWDzg' \
    > test.out 2>&1
eval_tap $? 211 'GetUserOrderGrant' test.out

#- 212 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zP2hg1Zs' \
    --userId 'RGsaeULq' \
    > test.out 2>&1
eval_tap $? 212 'GetUserOrderHistories' test.out

#- 213 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Q6skRDKA' \
    --userId 'OIILRJc1' \
    --body '{"additionalData": {"cardSummary": "lSVn16ei"}, "authorisedTime": "1975-06-25T00:00:00Z", "chargebackReversedTime": "1994-08-25T00:00:00Z", "chargebackTime": "1983-06-15T00:00:00Z", "chargedTime": "1987-12-14T00:00:00Z", "createdTime": "1994-06-26T00:00:00Z", "currency": {"currencyCode": "RqtCckb4", "currencySymbol": "KSJMms1r", "currencyType": "VIRTUAL", "decimals": 24, "namespace": "5pVv8gZL"}, "customParameters": {"HmlCgBjm": {}, "KRIUGIsp": {}, "NiPuVif1": {}}, "extOrderNo": "u4mtxPmK", "extTxId": "6Kw7Nzaj", "extUserId": "yxid8ikP", "issuedAt": "1997-09-15T00:00:00Z", "metadata": {"szUV0KrW": "830U6Xac", "Ww9vUrOs": "SEV53Wfe", "5A9CniSe": "DQrnP3FG"}, "namespace": "XPZBy8IN", "nonceStr": "Ft4Mo3us", "paymentMethod": "6GUwH15c", "paymentMethodFee": 91, "paymentOrderNo": "oyezuN4W", "paymentProvider": "WALLET", "paymentProviderFee": 39, "paymentStationUrl": "duboC1Mw", "price": 5, "refundedTime": "1979-12-08T00:00:00Z", "salesTax": 24, "sandbox": true, "sku": "wukM5Esn", "status": "REFUND_FAILED", "statusReason": "z4xifImK", "subscriptionId": "kJgJstud", "subtotalPrice": 18, "targetNamespace": "IxvB2G0X", "targetUserId": "u6tiS7QJ", "tax": 46, "totalPrice": 19, "totalTax": 34, "txEndTime": "1977-01-04T00:00:00Z", "type": "lEM6WiEA", "userId": "z4QQRmdV", "vat": 84}' \
    > test.out 2>&1
eval_tap $? 213 'ProcessUserOrderNotification' test.out

#- 214 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '74yH1LFi' \
    --userId 'kqo9Y3U3' \
    > test.out 2>&1
eval_tap $? 214 'DownloadUserOrderReceipt' test.out

#- 215 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'f6W6tErx' \
    --body '{"currencyCode": "ZcW0XgP2", "currencyNamespace": "54NEEVcf", "customParameters": {"RLI6IWU6": {}, "IfGndPtI": {}, "k3IELQ29": {}}, "description": "HdJzfhmw", "extOrderNo": "tX3ScVFK", "extUserId": "VikyxAOR", "itemType": "BUNDLE", "language": "Dy-HPCY", "metadata": {"4lVlJpDP": "WapDsuF1", "LDBO7lac": "F8XrhNxd", "vBS92oJo": "VPHqCD2x"}, "notifyUrl": "lBHRAbfb", "omitNotification": false, "platform": "0Pq1WKEK", "price": 49, "recurringPaymentOrderNo": "HrIBEjWr", "region": "Jmp0Svuq", "returnUrl": "ptfhLbjb", "sandbox": false, "sku": "AaQZGOGs", "subscriptionId": "ly51fJdW", "title": "zCcYWkPH"}' \
    > test.out 2>&1
eval_tap $? 215 'CreateUserPaymentOrder' test.out

#- 216 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '4xSABvLV' \
    --userId '3jGIaG79' \
    --body '{"description": "U3t4EGHa"}' \
    > test.out 2>&1
eval_tap $? 216 'RefundUserPaymentOrder' test.out

#- 217 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'FIykrH8s' \
    --body '{"code": "vV1UUgJG", "orderNo": "JxaPFc6f"}' \
    > test.out 2>&1
eval_tap $? 217 'ApplyUserRedemption' test.out

#- 218 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'JGAt5jpD' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'spbZVZKy' \
    --limit '63' \
    --offset '9' \
    --sku 'pp1TVT5m' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserSubscriptions' test.out

#- 219 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'ub6uXidg' \
    --excludeSystem  \
    --limit '29' \
    --offset '45' \
    --subscriptionId '1aXcH2sd' \
    > test.out 2>&1
eval_tap $? 219 'GetUserSubscriptionActivities' test.out

#- 220 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'yqczPnTP' \
    --body '{"grantDays": 77, "itemId": "IdtZyRYQ", "language": "wGNV5MKu", "reason": "WN6qu93i", "region": "vut1VN9G", "source": "5g43XWH7"}' \
    > test.out 2>&1
eval_tap $? 220 'PlatformSubscribeSubscription' test.out

#- 221 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xGkLBatF' \
    --itemId 'P84bVP1e' \
    > test.out 2>&1
eval_tap $? 221 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 222 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9xcI21nE' \
    --userId 'KjTHJfED' \
    > test.out 2>&1
eval_tap $? 222 'GetUserSubscription' test.out

#- 223 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8RYIeNMF' \
    --userId 'z9DWMiqi' \
    > test.out 2>&1
eval_tap $? 223 'DeleteUserSubscription' test.out

#- 224 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UyplzSlW' \
    --userId 'GqCbJbzF' \
    --force  \
    --body '{"immediate": false, "reason": "Cv4YrI2D"}' \
    > test.out 2>&1
eval_tap $? 224 'CancelSubscription' test.out

#- 225 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ttP3wNJI' \
    --userId 'ssgMtj4P' \
    --body '{"grantDays": 56, "reason": "bFfFJhNW"}' \
    > test.out 2>&1
eval_tap $? 225 'GrantDaysToSubscription' test.out

#- 226 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9yz3Nurd' \
    --userId 'N1FcvH0R' \
    --excludeFree  \
    --limit '1' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 226 'GetUserSubscriptionBillingHistories' test.out

#- 227 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UmFnWGHO' \
    --userId 'xN6O0Zc9' \
    --body '{"additionalData": {"cardSummary": "ue1hH8VH"}, "authorisedTime": "1974-02-04T00:00:00Z", "chargebackReversedTime": "1996-12-31T00:00:00Z", "chargebackTime": "1973-02-14T00:00:00Z", "chargedTime": "1981-08-02T00:00:00Z", "createdTime": "1987-02-28T00:00:00Z", "currency": {"currencyCode": "ZrviWVse", "currencySymbol": "v9Y5JVLO", "currencyType": "REAL", "decimals": 8, "namespace": "l9TK0wrV"}, "customParameters": {"JUknenl0": {}, "uN6jrjoj": {}, "sXGxIAU3": {}}, "extOrderNo": "U2md04AF", "extTxId": "lyWsg7pN", "extUserId": "KyYKoQVw", "issuedAt": "1995-10-02T00:00:00Z", "metadata": {"DQKpMSVh": "zuvCDjO9", "aFEw5GuY": "CPE0x6Pi", "n6eKcpou": "6KOrjcqa"}, "namespace": "EPn2Xidg", "nonceStr": "HJyIC71z", "paymentMethod": "eJa0t79P", "paymentMethodFee": 45, "paymentOrderNo": "RogPsc9r", "paymentProvider": "STRIPE", "paymentProviderFee": 32, "paymentStationUrl": "kgljOYBW", "price": 4, "refundedTime": "1999-08-03T00:00:00Z", "salesTax": 99, "sandbox": true, "sku": "cP8VJyLL", "status": "DELETED", "statusReason": "olgj4JEg", "subscriptionId": "shuxoMJa", "subtotalPrice": 57, "targetNamespace": "RLc3OuVW", "targetUserId": "Ha4h93Vx", "tax": 10, "totalPrice": 84, "totalTax": 39, "txEndTime": "1972-09-22T00:00:00Z", "type": "EtUPWGn1", "userId": "9TSfiNVO", "vat": 88}' \
    > test.out 2>&1
eval_tap $? 227 'ProcessUserSubscriptionNotification' test.out

#- 228 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'iAa0HjW0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oaDjHzrN' \
    --body '{"count": 17, "orderNo": "hAzkgTsJ"}' \
    > test.out 2>&1
eval_tap $? 228 'AcquireUserTicket' test.out

#- 229 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'OdMwY99Q' \
    > test.out 2>&1
eval_tap $? 229 'QueryUserCurrencyWallets' test.out

#- 230 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '8wdDXHpi' \
    --namespace "$AB_NAMESPACE" \
    --userId '8Ce3OyVJ' \
    --limit '87' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 230 'ListUserCurrencyTransactions' test.out

#- 231 CheckWallet
eval_tap 0 231 'CheckWallet # SKIP deprecated' test.out

#- 232 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'bXnt8jQg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UauNosh8' \
    --body '{"amount": 33, "expireAt": "1990-08-18T00:00:00Z", "origin": "Steam", "reason": "rXSrZnvs", "source": "REFUND"}' \
    > test.out 2>&1
eval_tap $? 232 'CreditUserWallet' test.out

#- 233 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'MuGKh6UE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQX4UTDO' \
    --body '{"amount": 84, "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 233 'PayWithUserWallet' test.out

#- 234 GetUserWallet
eval_tap 0 234 'GetUserWallet # SKIP deprecated' test.out

#- 235 DebitUserWallet
eval_tap 0 235 'DebitUserWallet # SKIP deprecated' test.out

#- 236 DisableUserWallet
eval_tap 0 236 'DisableUserWallet # SKIP deprecated' test.out

#- 237 EnableUserWallet
eval_tap 0 237 'EnableUserWallet # SKIP deprecated' test.out

#- 238 ListUserWalletTransactions
eval_tap 0 238 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 239 QueryWallets
eval_tap 0 239 'QueryWallets # SKIP deprecated' test.out

#- 240 GetWallet
eval_tap 0 240 'GetWallet # SKIP deprecated' test.out

#- 241 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'EYodd5zj' \
    --end 'I9lKoRdj' \
    --start 'Bsu1Dutf' \
    > test.out 2>&1
eval_tap $? 241 'SyncOrders' test.out

#- 242 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["VenVS1Vy", "AO54jEkp", "YrKVk5Sb"], "apiKey": "iimRbCIe", "authoriseAsCapture": true, "blockedPaymentMethods": ["aS74youy", "67GaXelb", "3nwSBSfh"], "clientKey": "Z91YFBxG", "dropInSettings": "89uJRWPz", "liveEndpointUrlPrefix": "w73OkjcA", "merchantAccount": "CKbeEWnZ", "notificationHmacKey": "7b8LdpVH", "notificationPassword": "DSAD3ycp", "notificationUsername": "oWbYMXjx", "returnUrl": "t9AOY0GX", "settings": "ahR7bOVR"}' \
    > test.out 2>&1
eval_tap $? 242 'TestAdyenConfig' test.out

#- 243 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "c1m7GyGj", "privateKey": "BXm5ewRY", "publicKey": "i1HQyjtr", "returnUrl": "UEPlR4Jv"}' \
    > test.out 2>&1
eval_tap $? 243 'TestAliPayConfig' test.out

#- 244 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "i3LMSpdf", "secretKey": "UGiVYKIb"}' \
    > test.out 2>&1
eval_tap $? 244 'TestCheckoutConfig' test.out

#- 245 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'WABmwpWg' \
    > test.out 2>&1
eval_tap $? 245 'DebugMatchedPaymentMerchantConfig' test.out

#- 246 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "pFZEaDf0", "clientSecret": "p7V2bfjc", "returnUrl": "mmjV86JN", "webHookId": "QX6ClTyg"}' \
    > test.out 2>&1
eval_tap $? 246 'TestPayPalConfig' test.out

#- 247 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["iEldWScY", "KD7jhVe0", "X93oe75q"], "publishableKey": "gMOkTyRs", "secretKey": "4zbLERLH", "webhookSecret": "rLzazGrv"}' \
    > test.out 2>&1
eval_tap $? 247 'TestStripeConfig' test.out

#- 248 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "o2eKFINZ", "key": "mxmGbVlI", "mchid": "kKZaWyBL", "returnUrl": "WrItF8nl"}' \
    > test.out 2>&1
eval_tap $? 248 'TestWxPayConfig' test.out

#- 249 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "fPRVIc4P", "flowCompletionUrl": "HsqeT0oW", "merchantId": 12, "projectId": 81, "projectSecretKey": "2EUqHZfR"}' \
    > test.out 2>&1
eval_tap $? 249 'TestXsollaConfig' test.out

#- 250 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'uvcE5hPj' \
    > test.out 2>&1
eval_tap $? 250 'GetPaymentMerchantConfig' test.out

#- 251 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'ctvgSW18' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["98cyFtR9", "4RFuc6kX", "9FDBCadJ"], "apiKey": "2sZGdY0B", "authoriseAsCapture": true, "blockedPaymentMethods": ["WgzYDXnW", "Zs7dZgjh", "nhceCtHO"], "clientKey": "GUI1H8YO", "dropInSettings": "zt7pYp1g", "liveEndpointUrlPrefix": "fMvdiQiA", "merchantAccount": "sNyhUBEI", "notificationHmacKey": "DGY55oI0", "notificationPassword": "0xLaKmpd", "notificationUsername": "G2D6b0iT", "returnUrl": "qPf6Eqd0", "settings": "6Ugb944B"}' \
    > test.out 2>&1
eval_tap $? 251 'UpdateAdyenConfig' test.out

#- 252 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '71sgfy2I' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 252 'TestAdyenConfigById' test.out

#- 253 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'h6R3FHck' \
    --sandbox  \
    --validate  \
    --body '{"appId": "mJnmkdsM", "privateKey": "XY3lnAcG", "publicKey": "qq6mkDlA", "returnUrl": "cFI6aLMn"}' \
    > test.out 2>&1
eval_tap $? 253 'UpdateAliPayConfig' test.out

#- 254 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 't2ycQ1I5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 254 'TestAliPayConfigById' test.out

#- 255 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '1gh6U0Lv' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "8q8oDTTw", "secretKey": "i1mHLykM"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateCheckoutConfig' test.out

#- 256 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'sZDV6Pi5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 256 'TestCheckoutConfigById' test.out

#- 257 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'UHB2DTim' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "e4jYmIy9", "clientSecret": "bGKlHyEV", "returnUrl": "zditkVFl", "webHookId": "Jgf15diS"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdatePayPalConfig' test.out

#- 258 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'ebwiKXb9' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestPayPalConfigById' test.out

#- 259 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'PgrE4EgI' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["rvgKIgeF", "lFSIkJGN", "DTqmvD6D"], "publishableKey": "5Zl2rNj3", "secretKey": "0DfSFs1d", "webhookSecret": "9ZflHGUy"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateStripeConfig' test.out

#- 260 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'ZsHrfDjp' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestStripeConfigById' test.out

#- 261 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'V7f6nk5v' \
    --validate  \
    --body '{"appId": "eENHO2bt", "key": "T6bXPEdq", "mchid": "fQ6hsdBC", "returnUrl": "E4zDmmRW"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateWxPayConfig' test.out

#- 262 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'WsITRuB2' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 262 'UpdateWxPayConfigCert' test.out

#- 263 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'SOILsiO3' \
    > test.out 2>&1
eval_tap $? 263 'TestWxPayConfigById' test.out

#- 264 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'uHcIB3Nv' \
    --validate  \
    --body '{"apiKey": "jGLHhSe9", "flowCompletionUrl": "9WVE4sz7", "merchantId": 75, "projectId": 65, "projectSecretKey": "fyJq5ylH"}' \
    > test.out 2>&1
eval_tap $? 264 'UpdateXsollaConfig' test.out

#- 265 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'lDBxm9vv' \
    > test.out 2>&1
eval_tap $? 265 'TestXsollaConfigById' test.out

#- 266 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'Bm6tDjLi' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 266 'UpdateXsollaUIConfig' test.out

#- 267 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '50' \
    --namespace "$AB_NAMESPACE" \
    --offset '17' \
    --region 'H0tCdWXt' \
    > test.out 2>&1
eval_tap $? 267 'QueryPaymentProviderConfig' test.out

#- 268 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "wLQcKg2l", "region": "pbkGoPea", "sandboxTaxJarApiToken": "WXNpvoQc", "specials": ["STRIPE", "ALIPAY", "STRIPE"], "taxJarApiToken": "wWV1VaCW", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 268 'CreatePaymentProviderConfig' test.out

#- 269 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 269 'GetAggregatePaymentProviders' test.out

#- 270 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'O3IZFUlL' \
    > test.out 2>&1
eval_tap $? 270 'DebugMatchedPaymentProviderConfig' test.out

#- 271 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 271 'GetSpecialPaymentProviders' test.out

#- 272 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'k8OiES4i' \
    --body '{"aggregate": "XSOLLA", "namespace": "gFG1eRM8", "region": "8P35f6s7", "sandboxTaxJarApiToken": "xRy6D2Vk", "specials": ["XSOLLA", "STRIPE", "WALLET"], "taxJarApiToken": "6bJWYehK", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 272 'UpdatePaymentProviderConfig' test.out

#- 273 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '6Dkq6gNO' \
    > test.out 2>&1
eval_tap $? 273 'DeletePaymentProviderConfig' test.out

#- 274 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 274 'GetPaymentTaxConfig' test.out

#- 275 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "2CG4Ayeh", "taxJarApiToken": "3XAs14O2", "taxJarEnabled": true, "taxJarProductCodesMapping": {"kf3sVgOP": "5nSRpIyK", "betp1TA9": "oyey2Sj8", "oJJZxWRy": "Oej1q8tQ"}}' \
    > test.out 2>&1
eval_tap $? 275 'UpdatePaymentTaxConfig' test.out

#- 276 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'ndXaPuGy' \
    --end 'EYEeG2tB' \
    --start 'Lhhl34vj' \
    > test.out 2>&1
eval_tap $? 276 'SyncPaymentOrders' test.out

#- 277 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'RRqKkUdq' \
    --storeId 'GkfRcwy0' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetRootCategories' test.out

#- 278 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'nL5xYDO4' \
    --storeId 's8aR7BYB' \
    > test.out 2>&1
eval_tap $? 278 'DownloadCategories' test.out

#- 279 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'Z5KoTCsD' \
    --namespace "$AB_NAMESPACE" \
    --language 'kb3Fzwvf' \
    --storeId 'JkahKKyv' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetCategory' test.out

#- 280 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'SWXd5N0e' \
    --namespace "$AB_NAMESPACE" \
    --language 'EKvKgZgw' \
    --storeId '3Y22rGUx' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetChildCategories' test.out

#- 281 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '2o8UYSJY' \
    --namespace "$AB_NAMESPACE" \
    --language 'Y2k1jfTo' \
    --storeId 'puJUp774' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetDescendantCategories' test.out

#- 282 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 282 'PublicListCurrencies' test.out

#- 283 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'yCr15DT3' \
    --region '9YRu5tLz' \
    --storeId 'OQfdxKOy' \
    --appId 'k7CK8z5S' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetItemByAppId' test.out

#- 284 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId 'W5C066rk' \
    --categoryPath 'qafKDf4M' \
    --features 'CjHyZiC3' \
    --itemType 'CODE' \
    --language 'qNsyX3eV' \
    --limit '73' \
    --offset '30' \
    --region 'n2oUeof7' \
    --sortBy 'name:asc,updatedAt:desc,createdAt:desc' \
    --storeId 'SykuiNmp' \
    --tags 'NyD1opVp' \
    > test.out 2>&1
eval_tap $? 284 'PublicQueryItems' test.out

#- 285 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'RJfPFUlb' \
    --region 'dZOfHNex' \
    --storeId 'h8YtbHka' \
    --sku '2HsMYxzq' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetItemBySku' test.out

#- 286 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'H9pZTh0g' \
    --region 'vry5etwR' \
    --storeId '6nVIuQLV' \
    --itemIds 'SKxbsCpU' \
    > test.out 2>&1
eval_tap $? 286 'PublicBulkGetItems' test.out

#- 287 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["RTPUiHWB", "w9Mt67dN", "phUhBgkV"]}' \
    > test.out 2>&1
eval_tap $? 287 'PublicValidateItemPurchaseCondition' test.out

#- 288 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '57' \
    --offset '100' \
    --region 'KuFzTE3a' \
    --storeId 'dm6r8Bwz' \
    --keyword '9x1jXmBx' \
    --language 'Fp8VRTuw' \
    > test.out 2>&1
eval_tap $? 288 'PublicSearchItems' test.out

#- 289 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '6EeBibLb' \
    --namespace "$AB_NAMESPACE" \
    --language 'zN2Wg0Tn' \
    --region 'Ep27s56h' \
    --storeId 'CbqDOlvJ' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetApp' test.out

#- 290 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'liwdw9hE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 290 'PublicGetItemDynamicData' test.out

#- 291 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'GiPL5jhc' \
    --namespace "$AB_NAMESPACE" \
    --language 'TPr3evMQ' \
    --populateBundle  \
    --region 'ZRRyCTiH' \
    --storeId 'Yt6aYPhp' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetItem' test.out

#- 292 GetPaymentCustomization
eval_tap 0 292 'GetPaymentCustomization # SKIP deprecated' test.out

#- 293 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "TgJ1IeDw", "paymentProvider": "STRIPE", "returnUrl": "hUaSCrOr", "ui": "0XGoAnIi", "zipCode": "yMQ7OxZM"}' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetPaymentUrl' test.out

#- 294 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fDb6WcYo' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetPaymentMethods' test.out

#- 295 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MMu05XFX' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetUnpaidPaymentOrder' test.out

#- 296 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'OdrnNgRL' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'zZUsWssg' \
    --body '{"token": "PAqVpSKY"}' \
    > test.out 2>&1
eval_tap $? 296 'Pay' test.out

#- 297 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gW6pMz5G' \
    > test.out 2>&1
eval_tap $? 297 'PublicCheckPaymentOrderPaidStatus' test.out

#- 298 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WALLET' \
    --region 'no4XVJQ8' \
    > test.out 2>&1
eval_tap $? 298 'GetPaymentPublicConfig' test.out

#- 299 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'cVaQJEmJ' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetQRCode' test.out

#- 300 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'iHOm8Wfu' \
    --foreinginvoice 'QTW51V5m' \
    --invoiceId 'cAtJZ6xj' \
    --payload 'SPKMJvKe' \
    --redirectResult '9EdmFcKX' \
    --resultCode 'Y0Dx9Cub' \
    --sessionId 'O7OUeJTV' \
    --status 'wpDAUyGY' \
    --token 'xaKMxcOi' \
    --type 'ytnzSPGq' \
    --userId 'qHfpBj3U' \
    --orderNo 'P4W2ys5D' \
    --paymentOrderNo 'NtLfQST4' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'lx8EN1Ke' \
    > test.out 2>&1
eval_tap $? 300 'PublicNormalizePaymentReturnUrl' test.out

#- 301 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'rh1x07XY' \
    --paymentOrderNo 'sJPXOSzj' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 301 'GetPaymentTaxValue' test.out

#- 302 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'dks0Cg4C' \
    > test.out 2>&1
eval_tap $? 302 'GetRewardByCode' test.out

#- 303 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '2JHwbhMV' \
    --limit '78' \
    --offset '1' \
    --sortBy 'namespace:asc,rewardCode' \
    > test.out 2>&1
eval_tap $? 303 'QueryRewards1' test.out

#- 304 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vN0CQS5T' \
    > test.out 2>&1
eval_tap $? 304 'GetReward1' test.out

#- 305 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'PublicListStores' test.out

#- 306 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'q4aDvY6X,8K4hTaBR,rr7IT1iv' \
    --itemIds 'mgjfdKrW,UNdWfUbv,jhlBaU9T' \
    --skus 'krkLjX0n,eSXo0sUj,B4BnrZjn' \
    > test.out 2>&1
eval_tap $? 306 'PublicExistsAnyMyActiveEntitlement' test.out

#- 307 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'NhWYzEPm' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 308 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'E9ejUqz9' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 309 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'D9SNy1mn' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 310 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'sf3Pli4n,ZeJycCT9,dGmmNC4I' \
    --itemIds 'DwZzurQm,BdTbNdNW,b5HbWccW' \
    --skus '3kKPKkP1,XVR4pbsz,JSATFTF4' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetEntitlementOwnershipToken' test.out

#- 311 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'brj0GWZ4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyWallet' test.out

#- 312 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'BdzMWu4w' \
    --body '{"epicGamesJwtToken": "TUynVCBr"}' \
    > test.out 2>&1
eval_tap $? 312 'SyncEpicGameDLC' test.out

#- 313 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'LpSqgSNq' \
    --body '{"serviceLabel": 60}' \
    > test.out 2>&1
eval_tap $? 313 'PublicSyncPsnDlcInventory' test.out

#- 314 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'FyKfqQbF' \
    --body '{"appId": "ggL8g08K", "steamId": "Uj6pJVQP"}' \
    > test.out 2>&1
eval_tap $? 314 'SyncSteamDLC' test.out

#- 315 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'I0zCfCx6' \
    --body '{"xstsToken": "ebr65Cg5"}' \
    > test.out 2>&1
eval_tap $? 315 'SyncXboxDLC' test.out

#- 316 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BXX1J7oa' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName '56WX9Ky4' \
    --features 'pXCc2FBr,OY1SbufA,GmSEMobQ' \
    --itemId 'hRi4mQHH,YOaW8YGW,qtrPgVDC' \
    --limit '31' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 316 'PublicQueryUserEntitlements' test.out

#- 317 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dOxE81oG' \
    --appId '9d1Jlq8w' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetUserAppEntitlementByAppId' test.out

#- 318 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'VMf50iDW' \
    --limit '16' \
    --offset '77' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 318 'PublicQueryUserEntitlementsByAppType' test.out

#- 319 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UbTTdAVe' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'ulwZlmhk' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserEntitlementByItemId' test.out

#- 320 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '2NP8glbw' \
    --entitlementClazz 'APP' \
    --sku 'FmoOvTPq' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetUserEntitlementBySku' test.out

#- 321 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'F42vui0t' \
    --appIds 'DY5VPUdu,SIiA4ILn,jS0QbbAc' \
    --itemIds 'gfMHPp3d,yf7lO2z5,xfKIo6FH' \
    --skus '1wq0O7wn,dSwVPFcE,I94C9Jr0' \
    > test.out 2>&1
eval_tap $? 321 'PublicExistsAnyUserActiveEntitlement' test.out

#- 322 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QGOxFras' \
    --appId 'AwfrPVLs' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 323 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8av5eWP' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'xtvQQ48v' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 324 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nGdv3Eut' \
    --ids 'aaxaDDOg,soUPK9Qz,Ta9sWYoO' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 325 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'RAmsaAEX' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '5TuvuV4u' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 326 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'NUjm7tXL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iDkvljM2' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserEntitlement' test.out

#- 327 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'vbm7siEm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LTk39C91' \
    --body '{"options": ["AYhmIKFo", "dKNQfXFi", "hmwFr97u"], "useCount": 95}' \
    > test.out 2>&1
eval_tap $? 327 'PublicConsumeUserEntitlement' test.out

#- 328 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ts6IMEVP' \
    --body '{"code": "nJAmCWy9", "language": "yMf-079", "region": "5uNubL3j"}' \
    > test.out 2>&1
eval_tap $? 328 'PublicRedeemCode' test.out

#- 329 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'DknIgYX0' \
    --body '{"excludeOldTransactions": true, "language": "yhPy", "productId": "55W2td24", "receiptData": "7gzB8SZs", "region": "JlGknr2N", "transactionId": "NZrvtTA1"}' \
    > test.out 2>&1
eval_tap $? 329 'PublicFulfillAppleIAPItem' test.out

#- 330 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'nsZgBJrE' \
    --body '{"epicGamesJwtToken": "CxjN7Cxx"}' \
    > test.out 2>&1
eval_tap $? 330 'SyncEpicGamesInventory' test.out

#- 331 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'AMqme0k2' \
    --body '{"autoAck": true, "language": "viLA-VD", "orderId": "ZUXmsePs", "packageName": "ITrSYnhw", "productId": "pcjR4nvw", "purchaseTime": 78, "purchaseToken": "rpMOFIOA", "region": "8mZItijo"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicFulfillGoogleIAPItem' test.out

#- 332 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaLS05Gn' \
    --body '{"currencyCode": "msE9Uerk", "price": 0.31217370886255813, "productId": "f8yeNSWV", "serviceLabel": 53}' \
    > test.out 2>&1
eval_tap $? 332 'PublicReconcilePlayStationStore' test.out

#- 333 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'pM5TpDkn' \
    --body '{"appId": "hEg5ULaq", "language": "yhZ-bdRD", "region": "kyJKICa1", "stadiaPlayerId": "767LOiMc"}' \
    > test.out 2>&1
eval_tap $? 333 'SyncStadiaEntitlement' test.out

#- 334 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'RkfFTxaK' \
    --body '{"appId": "RABE4o9Y", "currencyCode": "98CeSFsD", "language": "vQP", "price": 0.3683637073478331, "productId": "XrqYvpn4", "region": "nJUUbJ9O", "steamId": "NzV5Nfsy"}' \
    > test.out 2>&1
eval_tap $? 334 'SyncSteamInventory' test.out

#- 335 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'zcWCOxbg' \
    --body '{"gameId": "Op6exlrC", "language": "lx_693", "region": "bA6fJEi5"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncTwitchDropsEntitlement' test.out

#- 336 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1neWpse3' \
    --body '{"currencyCode": "8iYz1X3D", "price": 0.23090069318029904, "productId": "4uyMrVdx", "xstsToken": "zLcFLLuj"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncXboxInventory' test.out

#- 337 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ypBhutok' \
    --itemId 'Jn8n2BjD' \
    --limit '28' \
    --offset '78' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 337 'PublicQueryUserOrders' test.out

#- 338 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdfwaTMM' \
    --body '{"currencyCode": "XmB3DeV4", "discountedPrice": 61, "ext": {"cND2RFyN": {}, "sRfvnyXy": {}, "911ThQyZ": {}}, "itemId": "dFWlLN9o", "language": "FXfD_GMOR", "price": 71, "quantity": 12, "region": "V9rS7uhF", "returnUrl": "9a34R7QB"}' \
    > test.out 2>&1
eval_tap $? 338 'PublicCreateUserOrder' test.out

#- 339 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vaM2oWpj' \
    --userId 'DzWLMyHx' \
    > test.out 2>&1
eval_tap $? 339 'PublicGetUserOrder' test.out

#- 340 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dVgT1Qr6' \
    --userId 'lmCB7fda' \
    > test.out 2>&1
eval_tap $? 340 'PublicCancelUserOrder' test.out

#- 341 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'E6iqHevG' \
    --userId 'VfSTbi3W' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserOrderHistories' test.out

#- 342 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'we95eUHQ' \
    --userId 'AcLmMilE' \
    > test.out 2>&1
eval_tap $? 342 'PublicDownloadUserOrderReceipt' test.out

#- 343 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'wT4kEwWF' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetPaymentAccounts' test.out

#- 344 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'qf6W2hvp' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'jSOEIuzm' \
    > test.out 2>&1
eval_tap $? 344 'PublicDeletePaymentAccount' test.out

#- 345 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wo5pDcnu' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '2YqRkbsp' \
    --limit '80' \
    --offset '79' \
    --sku 'kkHQM9uU' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 345 'PublicQueryUserSubscriptions' test.out

#- 346 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 's1OhHtWO' \
    --body '{"currencyCode": "p02PYVJC", "itemId": "bLqLy4zD", "language": "EPn", "region": "h2s9o9Sq", "returnUrl": "dHGHxxQX", "source": "HvQ7lmBt"}' \
    > test.out 2>&1
eval_tap $? 346 'PublicSubscribeSubscription' test.out

#- 347 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '4p8taMAo' \
    --itemId 'XdBlL2ur' \
    > test.out 2>&1
eval_tap $? 347 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 348 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'd7ozP322' \
    --userId '808hOqaQ' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetUserSubscription' test.out

#- 349 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'z1jDGdL5' \
    --userId 'nkDMC5Mb' \
    > test.out 2>&1
eval_tap $? 349 'PublicChangeSubscriptionBillingAccount' test.out

#- 350 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HtMdyXRC' \
    --userId 'kuvcYVRG' \
    --body '{"immediate": true, "reason": "he1o19hf"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicCancelSubscription' test.out

#- 351 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Jg99K823' \
    --userId '7n78axnI' \
    --excludeFree  \
    --limit '16' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserSubscriptionBillingHistories' test.out

#- 352 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'PFKZ1x3x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sSGt9I1n' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetWallet' test.out

#- 353 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'F71Ec1td' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oQVNcGBU' \
    --limit '38' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 353 'PublicListUserWalletTransactions' test.out

#- 354 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'QTwXoy3f' \
    --baseAppId 'kocVqwdI' \
    --categoryPath 'NrzHkJYI' \
    --features 'Yh6gKyNd' \
    --itemStatus 'ACTIVE' \
    --itemType 'SEASON' \
    --limit '98' \
    --offset '7' \
    --region 'X4wtHzJK' \
    --sortBy 'nnn1CDnG' \
    --storeId 'LYHaHuva' \
    --tags 'ykSlnByK' \
    --targetNamespace '5kLdhMkc' \
    > test.out 2>&1
eval_tap $? 354 'QueryItems1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE