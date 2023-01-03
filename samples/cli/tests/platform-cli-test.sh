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
echo "1..377"

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
    --body '{"context": {"item": {"appId": "wsiTXMxp", "appType": "DEMO", "baseAppId": "VQTytn18", "boothName": "Q5O8eyXm", "boundItemIds": ["0XKZAX8b", "CT1NjbPD", "gQvf6NMx"], "categoryPath": "mhzOiiLz", "clazz": "BthUnhPQ", "createdAt": "1991-09-19T00:00:00Z", "description": "e71ncrO4", "displayOrder": 40, "entitlementType": "DURABLE", "ext": {"EIWyQDCh": {}, "g8mAPGfR": {}, "41pFGYsU": {}}, "features": ["NA4PRsW0", "GEF6Cg1y", "YPwJKrGJ"], "fresh": false, "images": [{"as": "RxsIY44E", "caption": "jlFIfUvZ", "height": 65, "imageUrl": "tHFjVzwu", "smallImageUrl": "03qLGNm5", "width": 32}, {"as": "wXvb5reL", "caption": "jtIqYUlZ", "height": 36, "imageUrl": "1vEeZhoa", "smallImageUrl": "OqzRwOP3", "width": 84}, {"as": "kGDtLxH1", "caption": "qmbdgKi5", "height": 67, "imageUrl": "C7FCzngT", "smallImageUrl": "1WuuOvHG", "width": 4}], "itemId": "cnaoSI0z", "itemIds": ["6jSzuZ3i", "TgG3rHkZ", "moMIUReC"], "itemQty": {"j3LpdbBE": 56, "QAGJL74P": 81, "R6Y0TzKP": 32}, "itemType": "MEDIA", "language": "M69weDYp", "listable": false, "localExt": {"DZRZSV9v": {}, "ITv70Qe6": {}, "EP1UxisR": {}}, "longDescription": "9FLvienn", "lootBoxConfig": {"rewardCount": 53, "rewards": [{"lootBoxItems": [{"count": 51, "itemId": "rOOyRnIz", "itemSku": "747RaaxP", "itemType": "LBEIiAuw"}, {"count": 68, "itemId": "7KiMmLKr", "itemSku": "73kmKZMX", "itemType": "7FxtJirZ"}, {"count": 80, "itemId": "8M0POWP2", "itemSku": "wOXl6IgE", "itemType": "dQhSdsle"}], "name": "N3DaeyCl", "odds": 0.42856150710736385, "type": "PROBABILITY_GROUP", "weight": 77}, {"lootBoxItems": [{"count": 3, "itemId": "fU12vjDX", "itemSku": "HNgcDxJG", "itemType": "B4ZUDqc8"}, {"count": 64, "itemId": "3RlXpXKT", "itemSku": "jSL4Y15H", "itemType": "9u4c4SDj"}, {"count": 54, "itemId": "QD0ZIF6h", "itemSku": "JUwoyUg3", "itemType": "mzR1spZV"}], "name": "yxmRKw0R", "odds": 0.7034163391289562, "type": "REWARD", "weight": 8}, {"lootBoxItems": [{"count": 68, "itemId": "0afFXMF3", "itemSku": "58IAFujY", "itemType": "yJFuQCE4"}, {"count": 88, "itemId": "sYmI9WQt", "itemSku": "d8EHGOAn", "itemType": "zKBeWFIz"}, {"count": 50, "itemId": "y7wgqGjx", "itemSku": "KeyfRSWq", "itemType": "78qBNAqa"}], "name": "fL4lFeRC", "odds": 0.1269259297956028, "type": "PROBABILITY_GROUP", "weight": 45}]}, "maxCount": 13, "maxCountPerUser": 94, "name": "TPpmOKeG", "namespace": "43ap9zc1", "optionBoxConfig": {"boxItems": [{"count": 1, "itemId": "8f4dkUv0", "itemSku": "0wDOjmFl", "itemType": "8ulNb3XV"}, {"count": 11, "itemId": "hqj4BRwE", "itemSku": "7CQ3YyiL", "itemType": "0pYyWqCN"}, {"count": 61, "itemId": "PPOM8XNi", "itemSku": "4XDRoqst", "itemType": "JGbUlk1C"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 6, "comparison": "isNot", "name": "3nbWUnI7", "predicateType": "EntitlementPredicate", "value": "nC1k7phs", "values": ["zvXAeyvE", "n7Nf2fa2", "epGOPbbX"]}, {"anyOf": 11, "comparison": "is", "name": "F18bTEus", "predicateType": "SeasonPassPredicate", "value": "MmUZpssA", "values": ["A2gexBqC", "siRxDnRI", "Ypi8j7uu"]}, {"anyOf": 75, "comparison": "includes", "name": "zIm2ZYXI", "predicateType": "EntitlementPredicate", "value": "HiEaRi6x", "values": ["8zyHHZXm", "3IUzr1fy", "lmXi1nie"]}]}, {"operator": "and", "predicates": [{"anyOf": 75, "comparison": "is", "name": "89G7x2Vy", "predicateType": "SeasonTierPredicate", "value": "BCradewY", "values": ["0JpLdql5", "E24pYtMO", "OMYskNb9"]}, {"anyOf": 91, "comparison": "isGreaterThan", "name": "7jdf4k2t", "predicateType": "EntitlementPredicate", "value": "fGVWwXDk", "values": ["AQ98Ztci", "vsn7iAIV", "JLw8ZmvT"]}, {"anyOf": 24, "comparison": "isGreaterThan", "name": "IzPb8E3F", "predicateType": "SeasonPassPredicate", "value": "pEcyDyPo", "values": ["MqPCXIXt", "jw1BOjb8", "lHPrQotC"]}]}, {"operator": "and", "predicates": [{"anyOf": 79, "comparison": "is", "name": "lvZeMBd3", "predicateType": "EntitlementPredicate", "value": "v3hYaOjq", "values": ["8NcZTVNq", "m8vN3uOO", "T8056xcX"]}, {"anyOf": 20, "comparison": "isLessThanOrEqual", "name": "hU02i3fJ", "predicateType": "SeasonPassPredicate", "value": "RzcqfTWg", "values": ["iztN8KVL", "OEE43FNJ", "AR8XQ9ij"]}, {"anyOf": 28, "comparison": "isNot", "name": "oujdJaYp", "predicateType": "SeasonTierPredicate", "value": "p4HPdSJ4", "values": ["SqzClDvz", "FTg5Njng", "2VhNQy4b"]}]}]}, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 97, "fixedTrialCycles": 50, "graceDays": 83}, "region": "V15t3I2w", "regionData": [{"currencyCode": "QqKZ4uJm", "currencyNamespace": "JQYSMcRu", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1992-01-05T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1973-02-01T00:00:00Z", "discountedPrice": 56, "expireAt": "1982-05-26T00:00:00Z", "price": 2, "purchaseAt": "1986-05-16T00:00:00Z", "trialPrice": 6}, {"currencyCode": "iZ7iL2wy", "currencyNamespace": "bPM4N0dd", "currencyType": "VIRTUAL", "discountAmount": 65, "discountExpireAt": "1994-03-25T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1975-11-19T00:00:00Z", "discountedPrice": 20, "expireAt": "1988-10-07T00:00:00Z", "price": 4, "purchaseAt": "1995-08-27T00:00:00Z", "trialPrice": 86}, {"currencyCode": "kS15OX40", "currencyNamespace": "SZrE8XB0", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1971-06-18T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1991-08-31T00:00:00Z", "discountedPrice": 24, "expireAt": "1981-09-02T00:00:00Z", "price": 41, "purchaseAt": "1993-12-19T00:00:00Z", "trialPrice": 13}], "seasonType": "TIER", "sku": "kudokC6y", "stackable": true, "status": "INACTIVE", "tags": ["Jy9BIqx2", "HoxQpJwj", "rnhhdWz3"], "targetCurrencyCode": "MufeUv8Y", "targetItemId": "rxeMDhOz", "targetNamespace": "pFZ8sEOC", "thumbnailUrl": "2Qm0NH72", "title": "gP57Hw62", "updatedAt": "1978-01-28T00:00:00Z", "useCount": 28}, "namespace": "UpNWxCDm", "order": {"currency": {"currencyCode": "5U03xpso", "currencySymbol": "ftPlWQyk", "currencyType": "VIRTUAL", "decimals": 8, "namespace": "RYfAVmXJ"}, "ext": {"M8Xp7V8A": {}, "AAKj5HUw": {}, "edsodo02": {}}, "free": true}, "source": "REWARD"}, "script": "N2TkO2Ka", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id '8QS7ZxCZ' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '1h3jyifC' \
    --body '{"grantDays": "htLvHSP1"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'GGu8liNo' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'DoCfrGPL' \
    --body '{"grantDays": "j5uDOOsn"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "79FzHiDV", "dryRun": true, "fulfillmentUrl": "UYkELJ7a", "itemType": "CODE", "purchaseConditionUrl": "7zui40in"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'aygwxyUs' \
    --itemType 'BUNDLE' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'TqPERGId' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'l3JIOeVn' \
    --body '{"clazz": "jXnCXvZU", "dryRun": false, "fulfillmentUrl": "xerwSBxY", "purchaseConditionUrl": "QTr7GEyG"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'GM53zuEh' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --name 'Inth4nm2' \
    --offset '35' \
    --tag 'LF14i2Gr' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "CvKQ5T8G", "items": [{"extraSubscriptionDays": 84, "itemId": "gF0afKDW", "itemName": "wxspr0Yf", "quantity": 11}, {"extraSubscriptionDays": 32, "itemId": "zIC6pAq7", "itemName": "feAiC8wf", "quantity": 90}, {"extraSubscriptionDays": 7, "itemId": "VGR6bmNu", "itemName": "WdEOVdjv", "quantity": 66}], "maxRedeemCountPerCampaignPerUser": 12, "maxRedeemCountPerCode": 69, "maxRedeemCountPerCodePerUser": 19, "maxSaleCount": 63, "name": "qD2TRC28", "redeemEnd": "1983-11-12T00:00:00Z", "redeemStart": "1999-03-16T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["GXZVPmmq", "hLs30oII", "4ztpPnp3"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '6oRuhWdd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'BJfxDp4j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "4llhpwFX", "items": [{"extraSubscriptionDays": 58, "itemId": "uwh6MDxZ", "itemName": "1M6cscSP", "quantity": 91}, {"extraSubscriptionDays": 79, "itemId": "z4OPqZnb", "itemName": "Ab89FFWk", "quantity": 4}, {"extraSubscriptionDays": 89, "itemId": "DD4liSZz", "itemName": "k7vzhuZk", "quantity": 96}], "maxRedeemCountPerCampaignPerUser": 25, "maxRedeemCountPerCode": 85, "maxRedeemCountPerCodePerUser": 45, "maxSaleCount": 12, "name": "kKW074GJ", "redeemEnd": "1990-02-20T00:00:00Z", "redeemStart": "1972-03-04T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["wdH588Xq", "1013XylP", "Fl27KgvH"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'o9Rpw7TF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'anb6eD77' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ode1k9Da' \
    --body '{"categoryPath": "VEqpech2", "localizationDisplayNames": {"drBnfBXF": "bwd7OaE7", "fGHhbWbC": "pYyRtG00", "YYeMOyfY": "fxtMVkk4"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '44h50hZv' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'spOlO68q' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cx6djvhJ' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'XyxTReK0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y2SVSI8v' \
    --body '{"localizationDisplayNames": {"bQNWEfou": "RQhq32d2", "l2m2O63N": "PVk3vnv8", "F9oxBy6l": "0bmVF2fX"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'mje234jD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BUw3rUGz' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'qsSB0ZrA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pwLwjC8T' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'At7mHeKn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'y2CM7Lb7' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'reryHN2H' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '20' \
    --code 'YXzfJGzq' \
    --limit '49' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '4uTlmz5h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 90}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'EdGiELZ2' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '2' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '9qhB0xLL' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '55' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'JHZC2gxn' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '92' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'smScOkkM' \
    --namespace "$AB_NAMESPACE" \
    --code 'VYHPRABB' \
    --limit '79' \
    --offset '94' \
    --userId 'nZSVAx0B' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'RJd6tbij' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'BkjEZizr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'jQ9LQyEe' \
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
    --body '{"currencyCode": "ujO81d1Z", "currencySymbol": "alCKI207", "currencyType": "REAL", "decimals": 89, "localizationDescriptions": {"WnQY2tvg": "N1dzEUsV", "ecUgzNIy": "KomfbSQI", "u5kjbsOY": "XFeadGnO"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'mIjVYfBk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"1RSvc2kK": "ZpbSVWyv", "pl13x63Z": "AnPJ1wtY", "Tc1ctD2G": "nhosEj0M"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'b69KVYsu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'TsACWDoR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'zYkGlXDJ' \
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
    --body '{"data": [{"id": "eDoh9j3W", "rewards": [{"currency": {"currencyCode": "Yq8ySsgn", "namespace": "PTtP4Xt4"}, "item": {"itemId": "6euYfVE5", "itemSku": "FEIBxzQ7", "itemType": "lrk549wm"}, "quantity": 13, "type": "ITEM"}, {"currency": {"currencyCode": "I4bxmWt1", "namespace": "5CEleAIJ"}, "item": {"itemId": "SNswSIV8", "itemSku": "3CRaBHoS", "itemType": "yiivFjMx"}, "quantity": 55, "type": "ITEM"}, {"currency": {"currencyCode": "mX9jIqOz", "namespace": "KbKNDOeK"}, "item": {"itemId": "vzxoPnRV", "itemSku": "qKMst5us", "itemType": "WlitbSeP"}, "quantity": 88, "type": "CURRENCY"}]}, {"id": "XUhwhSaK", "rewards": [{"currency": {"currencyCode": "PA8tJCQk", "namespace": "kIIQXmAC"}, "item": {"itemId": "jhPG3N1T", "itemSku": "VyT7Y2rF", "itemType": "8jdbTmUZ"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "RTWeFHru", "namespace": "7X6hHIqu"}, "item": {"itemId": "YTO1qoQT", "itemSku": "mxqNmO0O", "itemType": "0en6FjCJ"}, "quantity": 96, "type": "ITEM"}, {"currency": {"currencyCode": "SzOn1Osy", "namespace": "5Rkek2H2"}, "item": {"itemId": "KSPnizqT", "itemSku": "KjJ7oxA2", "itemType": "Qj8H3pNE"}, "quantity": 76, "type": "ITEM"}]}, {"id": "5uxnd4ZG", "rewards": [{"currency": {"currencyCode": "oO8jywaP", "namespace": "Ore5eBe4"}, "item": {"itemId": "LyZ6yLkS", "itemSku": "tHoIlZxq", "itemType": "gKfHoRag"}, "quantity": 39, "type": "CURRENCY"}, {"currency": {"currencyCode": "24O9xfNv", "namespace": "QRZPFzlC"}, "item": {"itemId": "A3ikjsVs", "itemSku": "U9Tnqy4k", "itemType": "6BTwb1GW"}, "quantity": 12, "type": "CURRENCY"}, {"currency": {"currencyCode": "gKprtjHl", "namespace": "51EIWyXe"}, "item": {"itemId": "APjBECvO", "itemSku": "ult7TxZ0", "itemType": "3BMAPhHB"}, "quantity": 10, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"D1QBSk54": "jhCendsR", "hLabEHX1": "wOqWRBmx", "bw3abuCo": "C7KZXTA0"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"Cr2kiCSU": "DS00N6KJ", "ggwyFOBc": "AP6YhbWV", "fqyiCC2a": "AsvorkZ7"}}, {"platform": "STEAM", "platformDlcIdMap": {"hUuHNKIH": "LKt6MdiY", "Qm0gX26o": "TqjRRI3o", "pxmLCQ5t": "fCFkDS8k"}}]}' \
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
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'CQD6yGr0' \
    --itemId 'oeuucncJ,pBt9R0Sx,A8v5d2aQ' \
    --limit '26' \
    --offset '74' \
    --userId 'bK53RPFh' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'lZ1giwnb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '53' \
    --status 'FAIL' \
    --userId '9sWO7Ido' \
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
    --body '{"bundleId": "dkLyxjzJ", "password": "rrLZv9SW"}' \
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
    --body '{"sandboxId": "RUajZWI4"}' \
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
    --body '{"applicationName": "SOPnVMF5", "serviceAccountId": "rQSWNSLH"}' \
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
    --body '{"data": [{"itemIdentity": "YzuVU3dx", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"LHnObQjB": "e2TzdXRy", "kPqQZSdq": "YwCwPOvp", "JofTXbmP": "JbvUjlAa"}}, {"itemIdentity": "9EO41153", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"Qfp5ZWpp": "RtJMYHPB", "VZNmJBRc": "VZYdxhrv", "SMNntp3a": "C9cbQ5tG"}}, {"itemIdentity": "CY3SF2YF", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"vi3ZP4TV": "3ddiUacb", "2wNyCYEY": "UV2kxMCR", "EVBjZsJR": "22i5BrH0"}}]}' \
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
    --body '{"environment": "RxcN37ex"}' \
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
    --body '{"appId": "M6vK1GfQ", "publisherAuthenticationKey": "1ekNAyvb"}' \
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
    --body '{"clientId": "jfcRNRTo", "clientSecret": "Flwb8sXZ", "organizationId": "FWkfFMbY"}' \
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
    --body '{"relyingPartyCert": "42oFEVPA"}' \
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
    --password 'rIExtYpU' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'Akw0Bg3l' \
    --itemId 'YuI5xTJQ' \
    --itemType 'BUNDLE' \
    --endTime 'hPjpsPkQ' \
    --startTime 'cEzcQv42' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '0aCmEPxW' \
    --itemId 'dOVVUUxx' \
    --itemType 'OPTIONBOX' \
    --endTime 'dRnnmWl9' \
    --startTime 'ahPzCzun' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zx43Ww2o' \
    --body '{"categoryPath": "5sGSdac3", "targetItemId": "olWXRsrn", "targetNamespace": "aQIv2gSM"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tNruZm3Q' \
    --body '{"appId": "mpQsYG67", "appType": "SOFTWARE", "baseAppId": "tCNRF4Kj", "boothName": "7ND8wJpg", "categoryPath": "pDY78CJP", "clazz": "P8LeWwIY", "displayOrder": 2, "entitlementType": "DURABLE", "ext": {"u1f7fyuI": {}, "kHJQp1qN": {}, "GykymTdk": {}}, "features": ["IcnQvegR", "d6flaks3", "0NJDKGEU"], "images": [{"as": "wOGHj7Xu", "caption": "z3kVzILz", "height": 64, "imageUrl": "lAtT7LIw", "smallImageUrl": "No1Hp3xj", "width": 65}, {"as": "wqPx10Fx", "caption": "LsIdgygu", "height": 36, "imageUrl": "UplhwrSy", "smallImageUrl": "KGu40Vqu", "width": 34}, {"as": "HhVIsAPY", "caption": "zC3KuxQj", "height": 19, "imageUrl": "HvrzOb7M", "smallImageUrl": "KkaNxqcK", "width": 2}], "itemIds": ["wtBVpFcs", "2NKqBHxl", "tSySB0IW"], "itemQty": {"EoAGedqN": 74, "VnlljVcU": 19, "ESr12GsM": 42}, "itemType": "CODE", "listable": false, "localizations": {"v55gaZ2O": {"description": "iaq2us8I", "localExt": {"GREbJesu": {}, "FNCiYYTP": {}, "TZHeYhNP": {}}, "longDescription": "xpnuziX6", "title": "VttVp9KK"}, "Us9nkM8u": {"description": "wPk6vsRP", "localExt": {"1xqZ6hiA": {}, "S7OQWKf5": {}, "pRCybfvJ": {}}, "longDescription": "7TebvFun", "title": "UDuBrhz9"}, "XWOZYzwq": {"description": "nTw9X3Tb", "localExt": {"sUBLOGvy": {}, "1EKCg8fD": {}, "2jOxNu35": {}}, "longDescription": "CwaUOEe3", "title": "o20Rg2J2"}}, "lootBoxConfig": {"rewardCount": 94, "rewards": [{"lootBoxItems": [{"count": 46, "itemId": "9RGbTwQo", "itemSku": "gf4z9usU", "itemType": "YR2evCz3"}, {"count": 97, "itemId": "pLGS4Ybv", "itemSku": "frFs1rk6", "itemType": "iPtpTO47"}, {"count": 57, "itemId": "AQH54M5U", "itemSku": "MjpeWvJO", "itemType": "SO8ZQfgW"}], "name": "JpnYMRz6", "odds": 0.3982374825674547, "type": "REWARD", "weight": 70}, {"lootBoxItems": [{"count": 7, "itemId": "PfCt5F6f", "itemSku": "DYtqh2xF", "itemType": "3RKOSm99"}, {"count": 94, "itemId": "JCigHCfC", "itemSku": "GPHtJ4HK", "itemType": "xyjvHaTr"}, {"count": 83, "itemId": "Gj6wtRur", "itemSku": "bLSPZOaN", "itemType": "99FdkAHG"}], "name": "L7L4iv3n", "odds": 0.09003081491557863, "type": "REWARD", "weight": 99}, {"lootBoxItems": [{"count": 38, "itemId": "jVfuAfMB", "itemSku": "puCFO1PN", "itemType": "4USoY5tZ"}, {"count": 39, "itemId": "RkGEWju9", "itemSku": "GL34sK0x", "itemType": "CrDZtohe"}, {"count": 4, "itemId": "LMZQNrVV", "itemSku": "kSgdqRut", "itemType": "9lp5UMWg"}], "name": "MiC5dTO5", "odds": 0.1293819247898047, "type": "PROBABILITY_GROUP", "weight": 29}]}, "maxCount": 13, "maxCountPerUser": 8, "name": "mTCMifFn", "optionBoxConfig": {"boxItems": [{"count": 71, "itemId": "yq1Tu186", "itemSku": "J4ST9vj4", "itemType": "MdkGkFk2"}, {"count": 10, "itemId": "KCcuEVap", "itemSku": "XjzCurH1", "itemType": "GotZoOu6"}, {"count": 78, "itemId": "eZ3dDSPT", "itemSku": "qhNLKnkM", "itemType": "LVCaA10M"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 5, "fixedTrialCycles": 38, "graceDays": 34}, "regionData": {"1QmOSeaO": [{"currencyCode": "W5M6hOGr", "currencyNamespace": "fbgsCsKU", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1972-12-11T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1992-06-24T00:00:00Z", "discountedPrice": 38, "expireAt": "1975-02-06T00:00:00Z", "price": 63, "purchaseAt": "1983-07-25T00:00:00Z", "trialPrice": 40}, {"currencyCode": "9sdsb6vE", "currencyNamespace": "t2Nz7kNb", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1991-07-10T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1984-08-29T00:00:00Z", "discountedPrice": 33, "expireAt": "1998-07-23T00:00:00Z", "price": 57, "purchaseAt": "1992-07-22T00:00:00Z", "trialPrice": 27}, {"currencyCode": "oFD0eQWM", "currencyNamespace": "CjherpOg", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1974-03-11T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1987-09-20T00:00:00Z", "discountedPrice": 31, "expireAt": "1993-09-29T00:00:00Z", "price": 65, "purchaseAt": "1979-12-17T00:00:00Z", "trialPrice": 65}], "TuFIcSKa": [{"currencyCode": "Er1wmv8x", "currencyNamespace": "RJp7Idco", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1993-08-09T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1997-12-29T00:00:00Z", "discountedPrice": 13, "expireAt": "1988-10-04T00:00:00Z", "price": 20, "purchaseAt": "1977-01-21T00:00:00Z", "trialPrice": 95}, {"currencyCode": "QH0e01xl", "currencyNamespace": "Kfi09qkc", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1977-07-09T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1999-05-21T00:00:00Z", "discountedPrice": 89, "expireAt": "1991-10-20T00:00:00Z", "price": 83, "purchaseAt": "1974-02-11T00:00:00Z", "trialPrice": 46}, {"currencyCode": "YLd7S9Du", "currencyNamespace": "pHl5iWbg", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1985-05-06T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1978-01-27T00:00:00Z", "discountedPrice": 45, "expireAt": "1973-07-01T00:00:00Z", "price": 53, "purchaseAt": "1993-02-21T00:00:00Z", "trialPrice": 1}], "tUHmWpXr": [{"currencyCode": "Lin43ZCp", "currencyNamespace": "xLN2n0Qv", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1996-02-25T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1986-04-12T00:00:00Z", "discountedPrice": 42, "expireAt": "1972-01-14T00:00:00Z", "price": 24, "purchaseAt": "1975-05-25T00:00:00Z", "trialPrice": 10}, {"currencyCode": "caNSCLXQ", "currencyNamespace": "RFr6hCTM", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1993-07-28T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1990-02-16T00:00:00Z", "discountedPrice": 99, "expireAt": "1982-03-24T00:00:00Z", "price": 16, "purchaseAt": "1981-08-12T00:00:00Z", "trialPrice": 62}, {"currencyCode": "kdjOOVap", "currencyNamespace": "uhTJd8mT", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1971-05-03T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1987-04-28T00:00:00Z", "discountedPrice": 0, "expireAt": "1990-12-28T00:00:00Z", "price": 73, "purchaseAt": "1979-06-20T00:00:00Z", "trialPrice": 49}]}, "seasonType": "PASS", "sku": "j2u11Oac", "stackable": true, "status": "INACTIVE", "tags": ["ZLtQxuS1", "2i9AHjHV", "p9DsVjtb"], "targetCurrencyCode": "j93NqI46", "targetNamespace": "KjNlLsMK", "thumbnailUrl": "4pQ6Ubh8", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'dVrSEj4H' \
    --appId '8ViNPlys' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'tRLQfiAu' \
    --baseAppId 'xx5lNqFX' \
    --categoryPath 'PGak5RFU' \
    --features '6mHaLBJ0' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --limit '68' \
    --offset '83' \
    --region '33Q09YbL' \
    --sortBy 'displayOrder:desc,updatedAt:desc,createdAt' \
    --storeId '6XOKDkQx' \
    --tags '9LXw7OBY' \
    --targetNamespace 'ANufiQJU' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '8PnYcQ5l,LTPXj5Oo,OGca6zct' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'A2tD8XvN' \
    --sku 'NPKsEvpa' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'GUVTl2rZ' \
    --populateBundle  \
    --region 'fm5urkLv' \
    --storeId 't55BeBKc' \
    --sku 'DtyQmshU' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'YVgFAz6I' \
    --sku 'R7ZF26wn' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'HgkVQjJL,33S201qr,brmMG0NU' \
    --storeId 'xNw3t4Y5' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'joZrGYLv' \
    --region 'PWgHtCfx' \
    --storeId 'k0OjSnTL' \
    --itemIds 'AC93g6pi' \
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
    --userId '42WpIMdX' \
    --body '{"itemIds": ["V8XXZjkO", "43lWFrxA", "lwYSBa38"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'INGAMEITEM' \
    --limit '61' \
    --offset '25' \
    --sortBy 'sXb40BGp' \
    --storeId 'mablsfZd' \
    --keyword 'dT4yTA6N' \
    --language 'xhL5YG8g' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '68' \
    --offset '56' \
    --sortBy 'createdAt:desc,displayOrder:asc' \
    --storeId 'YFYLzUhM' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'qFObaxBY' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yqJTm38W' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'qvUrf79J' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fs5EXQhs' \
    --body '{"appId": "8gDgjKN6", "appType": "DLC", "baseAppId": "AgNtV2Cy", "boothName": "tpofFg4e", "categoryPath": "WN3OEfbM", "clazz": "FTKvNk2f", "displayOrder": 77, "entitlementType": "DURABLE", "ext": {"e7tsWP95": {}, "KnFXyple": {}, "eRdfkpfG": {}}, "features": ["0fwS1euH", "0jEG3qUY", "tkbM1906"], "images": [{"as": "ZlLVfLHn", "caption": "RiXgCXs3", "height": 65, "imageUrl": "vvmPQJT3", "smallImageUrl": "D2d9FyAV", "width": 10}, {"as": "PR44ZBQv", "caption": "fZ950b4D", "height": 91, "imageUrl": "tqgzooxX", "smallImageUrl": "ulyl3eqq", "width": 68}, {"as": "lvNxbipP", "caption": "cnng1uhS", "height": 16, "imageUrl": "fW46xyE4", "smallImageUrl": "zxbkFBjZ", "width": 57}], "itemIds": ["9jFCUWmt", "PeHzOFR1", "04l3oRc4"], "itemQty": {"ynG9g9QM": 74, "NffVeZQw": 81, "5RxN4PzB": 99}, "itemType": "EXTENSION", "listable": false, "localizations": {"eX64dILD": {"description": "mcP27OkN", "localExt": {"qmtUCvrz": {}, "8z0I4s1w": {}, "YQzgKnLe": {}}, "longDescription": "vs9DtZC0", "title": "MjmeZoEp"}, "9ZOaNu96": {"description": "jbV511z5", "localExt": {"hQQ47BUf": {}, "W69RVpBP": {}, "LPJRWZcv": {}}, "longDescription": "UL21ACtQ", "title": "kcrTvl9i"}, "OSz6vPeb": {"description": "e2F5hNAl", "localExt": {"hr0l7aia": {}, "e3re5ZpR": {}, "X3tMrTd0": {}}, "longDescription": "EwI9ceKL", "title": "MBV4WatW"}}, "lootBoxConfig": {"rewardCount": 38, "rewards": [{"lootBoxItems": [{"count": 94, "itemId": "Boll16E9", "itemSku": "yXW9fHHJ", "itemType": "LPzOrzDD"}, {"count": 6, "itemId": "6HOatnZM", "itemSku": "ifH0pJfb", "itemType": "frSw57pb"}, {"count": 30, "itemId": "PMcMUkut", "itemSku": "S9iwEYgc", "itemType": "vxJUrqfx"}], "name": "uQDxtnf6", "odds": 0.6459416721933936, "type": "REWARD", "weight": 30}, {"lootBoxItems": [{"count": 74, "itemId": "P0rg3CaC", "itemSku": "3baDsa4f", "itemType": "BBEDLeUt"}, {"count": 26, "itemId": "gGzxlOIz", "itemSku": "HUnX5DaD", "itemType": "7opgxfFb"}, {"count": 76, "itemId": "CNeLOxKC", "itemSku": "FXEt5KRS", "itemType": "Xx4SNpZX"}], "name": "SiW5dBS5", "odds": 0.8169117090719059, "type": "REWARD", "weight": 23}, {"lootBoxItems": [{"count": 57, "itemId": "Ch44Rnxk", "itemSku": "y0GQE8ov", "itemType": "8xlnEqW9"}, {"count": 79, "itemId": "Q2RSRSsW", "itemSku": "ZeZjgVQs", "itemType": "1PQ5leRw"}, {"count": 42, "itemId": "pF8KV2qo", "itemSku": "uqPyDjFm", "itemType": "reIhNJKi"}], "name": "LmvSEmWv", "odds": 0.9280863694956523, "type": "PROBABILITY_GROUP", "weight": 6}]}, "maxCount": 45, "maxCountPerUser": 100, "name": "QRol4Zsk", "optionBoxConfig": {"boxItems": [{"count": 21, "itemId": "d5ej4vOh", "itemSku": "N2m27NZ4", "itemType": "WcFKNpgp"}, {"count": 91, "itemId": "3oW4F8lG", "itemSku": "NkBoPLT4", "itemType": "BQgrmsvV"}, {"count": 69, "itemId": "o0hN40cl", "itemSku": "2B0kuERG", "itemType": "xHy4W88t"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 57, "fixedTrialCycles": 16, "graceDays": 79}, "regionData": {"ci7OMII2": [{"currencyCode": "6iTaRmu1", "currencyNamespace": "ix4W00Ki", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1984-09-22T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1984-06-05T00:00:00Z", "discountedPrice": 65, "expireAt": "1984-09-21T00:00:00Z", "price": 54, "purchaseAt": "1973-10-31T00:00:00Z", "trialPrice": 0}, {"currencyCode": "kWnfBFDu", "currencyNamespace": "JbRwr0kP", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1995-09-09T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1972-12-03T00:00:00Z", "discountedPrice": 45, "expireAt": "1983-11-26T00:00:00Z", "price": 19, "purchaseAt": "1988-11-09T00:00:00Z", "trialPrice": 0}, {"currencyCode": "yptIq9Au", "currencyNamespace": "EOVyr1yc", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1981-01-27T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1999-01-03T00:00:00Z", "discountedPrice": 38, "expireAt": "1985-06-27T00:00:00Z", "price": 44, "purchaseAt": "1988-08-14T00:00:00Z", "trialPrice": 21}], "ncpbAlrD": [{"currencyCode": "hR6a5Xpg", "currencyNamespace": "p2Ejd2D9", "currencyType": "VIRTUAL", "discountAmount": 89, "discountExpireAt": "1991-11-09T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1983-07-02T00:00:00Z", "discountedPrice": 52, "expireAt": "1994-12-27T00:00:00Z", "price": 3, "purchaseAt": "1980-03-09T00:00:00Z", "trialPrice": 46}, {"currencyCode": "AKXVvNht", "currencyNamespace": "YK8Wgt56", "currencyType": "VIRTUAL", "discountAmount": 72, "discountExpireAt": "1995-11-29T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1977-07-14T00:00:00Z", "discountedPrice": 50, "expireAt": "1980-05-13T00:00:00Z", "price": 62, "purchaseAt": "1993-05-25T00:00:00Z", "trialPrice": 55}, {"currencyCode": "VKBnqlaT", "currencyNamespace": "Yp9DrBvL", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1984-01-19T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1996-04-16T00:00:00Z", "discountedPrice": 36, "expireAt": "1988-01-27T00:00:00Z", "price": 66, "purchaseAt": "1986-08-21T00:00:00Z", "trialPrice": 47}], "nuAY9JjZ": [{"currencyCode": "A0Uo3r49", "currencyNamespace": "52nPe0lm", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1979-06-17T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1999-01-14T00:00:00Z", "discountedPrice": 91, "expireAt": "1978-05-08T00:00:00Z", "price": 71, "purchaseAt": "1986-01-03T00:00:00Z", "trialPrice": 79}, {"currencyCode": "NXkTmzYH", "currencyNamespace": "kaGIvQPD", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1980-04-13T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1979-12-25T00:00:00Z", "discountedPrice": 6, "expireAt": "1997-05-23T00:00:00Z", "price": 33, "purchaseAt": "1989-04-07T00:00:00Z", "trialPrice": 60}, {"currencyCode": "V33nUPbA", "currencyNamespace": "zKtPFePl", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1987-09-08T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1977-08-18T00:00:00Z", "discountedPrice": 84, "expireAt": "1983-09-14T00:00:00Z", "price": 58, "purchaseAt": "1984-08-12T00:00:00Z", "trialPrice": 34}]}, "seasonType": "TIER", "sku": "lO2Ieimk", "stackable": true, "status": "ACTIVE", "tags": ["uC9thv8g", "T1MxAc6e", "FEjtcG3O"], "targetCurrencyCode": "jqJL1JBH", "targetNamespace": "UeOQTdYP", "thumbnailUrl": "uqN1a2x9", "useCount": 26}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'FI9m6DO0' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'ReovfEl7' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'JqRt0hVa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 72, "orderNo": "BCEtliq7"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'nvhaxRJV' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'C2TrwCDI' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'fC3bAuCB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iX466kRg' \
    --body '{"carousel": [{"alt": "fbVPwjvl", "previewUrl": "10qJ3M7l", "thumbnailUrl": "Hl9Lsvaw", "type": "image", "url": "T01T9PQV", "videoSource": "vimeo"}, {"alt": "QXYytme2", "previewUrl": "FPh1MM1J", "thumbnailUrl": "bAwWvZ1S", "type": "image", "url": "WrfvB2Va", "videoSource": "generic"}, {"alt": "iydHM3HI", "previewUrl": "su9KHdhG", "thumbnailUrl": "M0AxCORT", "type": "image", "url": "UHrDcAzH", "videoSource": "youtube"}], "developer": "woY6rizZ", "forumUrl": "TeFyuZee", "genres": ["Simulation", "Indie", "Indie"], "localizations": {"mlh6VZk8": {"announcement": "hv6nYy47", "slogan": "2T5sWE5c"}, "vxIkh17S": {"announcement": "Tf8sv6HM", "slogan": "QPshKpcj"}, "hPFW6Wle": {"announcement": "A4myuXLe", "slogan": "OAOA6hrR"}}, "platformRequirements": {"4EpviRy9": [{"additionals": "mfGzoA7N", "directXVersion": "OcnEQlhR", "diskSpace": "HD3t3ZkA", "graphics": "TgAXwFSD", "label": "ka6tz6Jp", "osVersion": "ZkafmbU0", "processor": "VARM5ydt", "ram": "9CoGOdci", "soundCard": "q0J08T1r"}, {"additionals": "qNn41VLQ", "directXVersion": "9eYXvROy", "diskSpace": "qCSEASnX", "graphics": "OtlciCDg", "label": "3iqrxBE9", "osVersion": "LndRHG4W", "processor": "NnciWR65", "ram": "V0rI54Pc", "soundCard": "tFChoIjb"}, {"additionals": "Qv4zdD38", "directXVersion": "2GiqKEsi", "diskSpace": "nyZn4b48", "graphics": "WzRG9jYK", "label": "lhRraEXf", "osVersion": "TArUIf7E", "processor": "zHTDmO9W", "ram": "uOrdlyRt", "soundCard": "O9mfCbJ3"}], "kn6VbIcp": [{"additionals": "B5Gcg92d", "directXVersion": "1xBqIAG9", "diskSpace": "Kg1COlbE", "graphics": "eio3JA6I", "label": "kjQxirPe", "osVersion": "QKweAql7", "processor": "nIWh5z3h", "ram": "3O6rZZfZ", "soundCard": "b0NyERHN"}, {"additionals": "9NjkavPV", "directXVersion": "PfJdFlX7", "diskSpace": "6viCgNd8", "graphics": "yH01KQVk", "label": "MZfAqVv7", "osVersion": "aNJIBn1t", "processor": "vy62ozij", "ram": "O2VhIMHZ", "soundCard": "7wY1PQjy"}, {"additionals": "PG6sm8EM", "directXVersion": "aG71ljRv", "diskSpace": "66RbKNCW", "graphics": "xfhROwoT", "label": "J3Qwoy7x", "osVersion": "wIZgY4K8", "processor": "WLU5GiJM", "ram": "6ksMHk14", "soundCard": "JjduOMtB"}], "z14jLVm7": [{"additionals": "zvoCKlDm", "directXVersion": "KmwkN9G8", "diskSpace": "dVEpdPm8", "graphics": "vZB6Bhe5", "label": "ec3shnY2", "osVersion": "YjuWQyQs", "processor": "976EbWBt", "ram": "JBr923RF", "soundCard": "MpIDPCtq"}, {"additionals": "dLdTubxa", "directXVersion": "DA4deZE8", "diskSpace": "BklykK38", "graphics": "rj8a0IAy", "label": "8wsJb3OW", "osVersion": "GhIaR5gs", "processor": "cOEX31QP", "ram": "ZWHP81SM", "soundCard": "cYaRAMt1"}, {"additionals": "e6rycvpA", "directXVersion": "L1wuNNBn", "diskSpace": "S8VHdOMM", "graphics": "ratWWjRn", "label": "TX0wrkNn", "osVersion": "GjkfY5np", "processor": "bynJT4Vw", "ram": "wDERNRgF", "soundCard": "Yr3Tn0Je"}]}, "platforms": ["Windows", "Linux", "IOS"], "players": ["Coop", "LocalCoop", "CrossPlatformMulti"], "primaryGenre": "Simulation", "publisher": "tacGAmcc", "releaseDate": "1978-07-26T00:00:00Z", "websiteUrl": "IM2oCMCp"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'tfywwwD2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wPu9wFr1' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '3Kx9UZk2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'J1x0jzBL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xz14sl1z' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'ZmVWczW5' \
    --itemId '56kto6BN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O3fDoGIF' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '6IzV6L38' \
    --itemId 'wasDXWLG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WY9pu9aO' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '0F1N8cvf' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ZbZ7jcka' \
    --populateBundle  \
    --region 'BkaHM8vZ' \
    --storeId 'yG4SRVlW' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'oy8ccIkP' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6GICoVl2' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 37, "comparison": "isNot", "name": "j1i97VlO", "predicateType": "EntitlementPredicate", "value": "m7x8uxlW", "values": ["Q7OyyMVj", "yrbEtmfu", "pxGXUwf7"]}, {"anyOf": 64, "comparison": "isGreaterThan", "name": "H8Vl9VYK", "predicateType": "SeasonPassPredicate", "value": "RZVpfFJy", "values": ["Yx6jepgU", "WUp5cdpv", "rfGHfKGT"]}, {"anyOf": 62, "comparison": "excludes", "name": "2bVhzkgJ", "predicateType": "EntitlementPredicate", "value": "mje7RBSu", "values": ["GhhlX8jJ", "BzQl3QUT", "AZYAaL0q"]}]}, {"operator": "and", "predicates": [{"anyOf": 39, "comparison": "isNot", "name": "Gqz4i1jD", "predicateType": "EntitlementPredicate", "value": "hrgP2Ug6", "values": ["Eh4xLr3G", "G1pCURXg", "POPH0Yki"]}, {"anyOf": 91, "comparison": "isGreaterThanOrEqual", "name": "labfZ4iz", "predicateType": "SeasonPassPredicate", "value": "YUYWMgBa", "values": ["NXE1FbgM", "djWEjY1N", "Ae4L6KdF"]}, {"anyOf": 36, "comparison": "excludes", "name": "M2Jneg1D", "predicateType": "SeasonPassPredicate", "value": "qyiTfuRU", "values": ["FjhYv6kJ", "fR2qyfF4", "5PCZphzz"]}]}, {"operator": "and", "predicates": [{"anyOf": 53, "comparison": "isNot", "name": "J4ceRIUE", "predicateType": "SeasonTierPredicate", "value": "8IdeUKqD", "values": ["IQcmtlW3", "o3IHYPYp", "39nS8heF"]}, {"anyOf": 92, "comparison": "isGreaterThan", "name": "i6vtuuBV", "predicateType": "SeasonPassPredicate", "value": "6oioA3yM", "values": ["ixtPYDyd", "cEnDvc5s", "c2s9SHU6"]}, {"anyOf": 63, "comparison": "isGreaterThanOrEqual", "name": "PyQMeBIp", "predicateType": "EntitlementPredicate", "value": "QhtGUJSw", "values": ["5AYXnuHT", "I6eHAErG", "F3cNLNfT"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'GAcCVsdV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "sslxWEd4"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --name '86YnwfFF' \
    --offset '68' \
    --tag '6IZU0zBk' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bfzOLTnV", "name": "HegDo3tR", "status": "INACTIVE", "tags": ["4lIeCnbm", "LjhwPePy", "RRbpgioU"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'Kin35Rcv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'SB3XDKMx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Id5lAymZ", "name": "69CgYrtR", "status": "ACTIVE", "tags": ["XrKK6v3a", "ZmwiC9mr", "1i6F6FEk"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'MlPlR4Ej' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'mppA1oel' \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '91' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'FUERmf0e' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ebifhUL9' \
    --limit '48' \
    --offset '1' \
    --orderNos 'tAtqeqMM,qtu2e4fv,DMhvV0ZF' \
    --sortBy 'rNflAdqA' \
    --startTime 'KUZwbVbM' \
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
    --orderNo 'VcvLPuTh' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GpRsN7ND' \
    --body '{"description": "tbS6af6S"}' \
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
    --body '{"dryRun": true, "notifyUrl": "OyFYXpKj", "privateKey": "QBS7zl0J"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'tvEHbP8W' \
    --externalId 's6ICylaX' \
    --limit '74' \
    --notificationSource 'PAYPAL' \
    --notificationType 'iXJzR6RK' \
    --offset '72' \
    --paymentOrderNo 'DBUGnhXa' \
    --startDate '9WmeHIfw' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'QjYu7dPK' \
    --limit '25' \
    --offset '27' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "7CbU9EfA", "currencyNamespace": "Cn6MsvDN", "customParameters": {"QRH5RoOl": {}, "coiOV9VL": {}, "IVceD8tw": {}}, "description": "rXq55GGP", "extOrderNo": "l2faPZHm", "extUserId": "kpSQGvwB", "itemType": "OPTIONBOX", "language": "rpb", "metadata": {"gMa0Yi0f": "pvEyti9W", "MZoodB8g": "anmgpaLz", "HzlSqObx": "gBTHG4a4"}, "notifyUrl": "yaEyoobr", "omitNotification": true, "platform": "cZxCP3Qk", "price": 77, "recurringPaymentOrderNo": "iJiNBo79", "region": "tt3SI1zX", "returnUrl": "wgCcGdxV", "sandbox": true, "sku": "zwtm1Sq5", "subscriptionId": "CxmZp7gD", "targetNamespace": "i4JiRDUF", "targetUserId": "S75zja5P", "title": "EDkS8jEz"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'IONcF53X' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8BEo3f7q' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tLYsJQhv' \
    --body '{"extTxId": "sYPfWPWn", "paymentMethod": "n2Wje5bU", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xkzuBMbO' \
    --body '{"description": "w11bowlB"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mA5qTVhG' \
    --body '{"amount": 34, "currencyCode": "tWTtdNsd", "notifyType": "REFUND", "paymentProvider": "CHECKOUT", "salesTax": 89, "vat": 86}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sCyje32E' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Other", "System", "GooglePlay"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "XTdb33D0", "eventTopic": "Ry3ussEv", "maxAwarded": 71, "maxAwardedPerUser": 26, "namespaceExpression": "KCgvZm7U", "rewardCode": "TzUhUiaj", "rewardConditions": [{"condition": "KT2eKpld", "conditionName": "fmbIMIGj", "eventName": "fArmiU3m", "rewardItems": [{"duration": 73, "itemId": "T5JvbRP0", "quantity": 8}, {"duration": 19, "itemId": "TARJGUsB", "quantity": 72}, {"duration": 68, "itemId": "PQRy8tx5", "quantity": 35}]}, {"condition": "AZvqlj0h", "conditionName": "94eKKl1V", "eventName": "MugyPRaN", "rewardItems": [{"duration": 52, "itemId": "tfMTzRcy", "quantity": 34}, {"duration": 92, "itemId": "yd88oJI5", "quantity": 98}, {"duration": 10, "itemId": "AZywxEmN", "quantity": 53}]}, {"condition": "xPuqEjOk", "conditionName": "yOX1kdg8", "eventName": "5E1YMVId", "rewardItems": [{"duration": 77, "itemId": "ls4bBKpV", "quantity": 34}, {"duration": 5, "itemId": "ggyMY562", "quantity": 1}, {"duration": 3, "itemId": "pY6GryvY", "quantity": 13}]}], "userIdExpression": "mVpTnkxv"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'nrlvzTA3' \
    --limit '31' \
    --offset '1' \
    --sortBy 'rewardCode,namespace:asc' \
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
    --rewardId 'pdmem0Rc' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'gQOukiJA' \
    --body '{"description": "hMmg4TDD", "eventTopic": "0gxIF5lH", "maxAwarded": 84, "maxAwardedPerUser": 17, "namespaceExpression": "UOyKVE83", "rewardCode": "0v2QQXnv", "rewardConditions": [{"condition": "ZX5uvHIr", "conditionName": "w89OXZ52", "eventName": "yFuveYx4", "rewardItems": [{"duration": 4, "itemId": "7Sb7YEya", "quantity": 75}, {"duration": 100, "itemId": "8J9rUCrR", "quantity": 69}, {"duration": 30, "itemId": "47gA38Kw", "quantity": 68}]}, {"condition": "vLGoKE0D", "conditionName": "wkZAeDhC", "eventName": "tDwwDWWJ", "rewardItems": [{"duration": 74, "itemId": "RjHZ5LM3", "quantity": 73}, {"duration": 44, "itemId": "N62sDXc8", "quantity": 27}, {"duration": 57, "itemId": "7mLk3udb", "quantity": 10}]}, {"condition": "nESOw84G", "conditionName": "4WACOcAV", "eventName": "Rz77DR9T", "rewardItems": [{"duration": 6, "itemId": "AJnd5Cbk", "quantity": 84}, {"duration": 34, "itemId": "5ZTGVR3A", "quantity": 43}, {"duration": 17, "itemId": "ziyYqY6G", "quantity": 48}]}], "userIdExpression": "KsfrQJP0"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'POu2xuAn' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'W55oTngf' \
    --body '{"payload": {"jxGHVbpB": {}, "OwzrYxAh": {}, "3euCzTOd": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7Y29lkfz' \
    --body '{"conditionName": "Vvip488X", "userId": "kAjcVXFK"}' \
    > test.out 2>&1
eval_tap $? 144 'DeleteRewardConditionRecord' test.out

#- 145 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'btgJOWQi' \
    --limit '35' \
    --offset '63' \
    --start 'Kawhpjde' \
    --storeId 'VeoO6qC2' \
    --viewId 'Yy6kXHa4' \
    > test.out 2>&1
eval_tap $? 145 'QuerySections' test.out

#- 146 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xntwflq6' \
    --body '{"active": false, "displayOrder": 58, "endDate": "1993-08-20T00:00:00Z", "ext": {"6Hz11xB6": {}, "kNuPn7jz": {}, "yRmmAoym": {}}, "fixedPeriodRotationConfig": {"duration": 67, "itemCount": 9, "rule": "SEQUENCE"}, "items": [{"id": "UGfYKp2D"}, {"id": "IrAnUmIh"}, {"id": "NR8bS0xX"}], "localizations": {"Paz1tTEH": {"description": "J95eTm67", "localExt": {"skU6kMZC": {}, "WAAWK9Kj": {}, "KabeCPoC": {}}, "longDescription": "7gv8hEW8", "title": "EWfsOPaD"}, "Bri41vcs": {"description": "O0MWgBOt", "localExt": {"jjL2E5rU": {}, "hys9Ffb7": {}, "2nPwmGGg": {}}, "longDescription": "rdxVCKtN", "title": "tcEyJDrT"}, "DFQEauis": {"description": "an1FEyrV", "localExt": {"SAyPh37f": {}, "qfd78CgI": {}, "MRNr2c7C": {}}, "longDescription": "xziZiVs4", "title": "5zwFPEGY"}}, "name": "uJalNRaQ", "rotationType": "FIXED_PERIOD", "startDate": "1973-09-09T00:00:00Z", "viewId": "DXLiirkt"}' \
    > test.out 2>&1
eval_tap $? 146 'CreateSection' test.out

#- 147 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TMbOs796' \
    > test.out 2>&1
eval_tap $? 147 'PurgeExpiredSection' test.out

#- 148 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '1U8xTklj' \
    --storeId 'EBr2KG3b' \
    > test.out 2>&1
eval_tap $? 148 'GetSection' test.out

#- 149 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'arqkzMn7' \
    --storeId 'zRsDoW54' \
    --body '{"active": true, "displayOrder": 90, "endDate": "1980-04-08T00:00:00Z", "ext": {"QC7shup2": {}, "7qi7vwP5": {}, "IA3w5KlZ": {}}, "fixedPeriodRotationConfig": {"duration": 8, "itemCount": 37, "rule": "SEQUENCE"}, "items": [{"id": "hhFkEDUH"}, {"id": "pjBfAQHg"}, {"id": "WLdPQRzH"}], "localizations": {"T5AHGslH": {"description": "exOpotmN", "localExt": {"hGd52w3A": {}, "ZO9DTqTM": {}, "4BXODy8g": {}}, "longDescription": "hhoW5zFA", "title": "ZQTOrO3I"}, "aoIAxDj7": {"description": "c090bao3", "localExt": {"pgqJrMWR": {}, "6z15Zh1k": {}, "nA8IiVYI": {}}, "longDescription": "y3RArZ5E", "title": "9DfjChAJ"}, "b0SFrHDx": {"description": "PjV3RDRA", "localExt": {"2j9BG5yu": {}, "AoG7rQGM": {}, "HvnkUyC7": {}}, "longDescription": "8llNKytr", "title": "2s3abP3j"}}, "name": "WMyksLJy", "rotationType": "NONE", "startDate": "1985-08-02T00:00:00Z", "viewId": "ogipla7i"}' \
    > test.out 2>&1
eval_tap $? 149 'UpdateSection' test.out

#- 150 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '7yF9FK8o' \
    --storeId 'ZuO9PlYW' \
    > test.out 2>&1
eval_tap $? 150 'DeleteSection' test.out

#- 151 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'ListStores' test.out

#- 152 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "3oipNcI9", "defaultRegion": "O7rSw6Tp", "description": "aVvf6k6j", "supportedLanguages": ["LBJtnWFc", "RgEIj7se", "6uFBkdy9"], "supportedRegions": ["5rzKHbuG", "csUa1q8k", "dYNYsjpz"], "title": "Z0VOR8UX"}' \
    > test.out 2>&1
eval_tap $? 152 'CreateStore' test.out

#- 153 ImportStore
eval_tap 0 153 'ImportStore # SKIP deprecated' test.out

#- 154 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'GetPublishedStore' test.out

#- 155 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'DeletePublishedStore' test.out

#- 156 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetPublishedStoreBackup' test.out

#- 157 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'RollbackPublishedStore' test.out

#- 158 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wL7G3PDm' \
    > test.out 2>&1
eval_tap $? 158 'GetStore' test.out

#- 159 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CbZ4811z' \
    --body '{"defaultLanguage": "7v4iFHIa", "defaultRegion": "8OpCrNPl", "description": "FElZwUaF", "supportedLanguages": ["M6LD4RKp", "2JzzByiH", "d8zziOW4"], "supportedRegions": ["WheWGZgz", "Bx8Udpo5", "9LOlD4rW"], "title": "9XQLnlCy"}' \
    > test.out 2>&1
eval_tap $? 159 'UpdateStore' test.out

#- 160 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LLCRfUO0' \
    > test.out 2>&1
eval_tap $? 160 'DeleteStore' test.out

#- 161 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lQYgn9pp' \
    --action 'CREATE' \
    --itemSku 'dnjScDCL' \
    --itemType 'CODE' \
    --limit '32' \
    --offset '80' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt,updatedAt' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'RnnhN9Vk' \
    --updatedAtStart 'xroiokG2' \
    > test.out 2>&1
eval_tap $? 161 'QueryChanges' test.out

#- 162 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SkDWmiWv' \
    > test.out 2>&1
eval_tap $? 162 'PublishAll' test.out

#- 163 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y6WLbOG5' \
    > test.out 2>&1
eval_tap $? 163 'PublishSelected' test.out

#- 164 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zurhvXgc' \
    > test.out 2>&1
eval_tap $? 164 'SelectAllRecords' test.out

#- 165 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'y9DciW0G' \
    --action 'CREATE' \
    --itemSku 'yfLmr3mj' \
    --itemType 'COINS' \
    --type 'ITEM' \
    --updatedAtEnd 'tOplvMRx' \
    --updatedAtStart '1Nk4niAg' \
    > test.out 2>&1
eval_tap $? 165 'GetStatistic' test.out

#- 166 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ns7EKIDP' \
    > test.out 2>&1
eval_tap $? 166 'UnselectAllRecords' test.out

#- 167 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'B2TjIM2W' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PWrPeq5m' \
    > test.out 2>&1
eval_tap $? 167 'SelectRecord' test.out

#- 168 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId '3D6TRvpT' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9hx2utSL' \
    > test.out 2>&1
eval_tap $? 168 'UnselectRecord' test.out

#- 169 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EkCwA9kT' \
    --targetStoreId 'BnOFt3fY' \
    > test.out 2>&1
eval_tap $? 169 'CloneStore' test.out

#- 170 ExportStore
eval_tap 0 170 'ExportStore # SKIP deprecated' test.out

#- 171 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId '0f4axglm' \
    --limit '77' \
    --offset '30' \
    --sku 'F3pukK0D' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'EQO3tuY9' \
    > test.out 2>&1
eval_tap $? 171 'QuerySubscriptions' test.out

#- 172 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AwgU8n1P' \
    > test.out 2>&1
eval_tap $? 172 'RecurringChargeSubscription' test.out

#- 173 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'XgCZq44N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'GetTicketDynamic' test.out

#- 174 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'Y2fzLaKq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "GiKdRix0"}' \
    > test.out 2>&1
eval_tap $? 174 'DecreaseTicketSale' test.out

#- 175 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '0NC0tdj6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 175 'GetTicketBoothID' test.out

#- 176 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'EpkjRM4u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 65, "orderNo": "rB7pTGtp"}' \
    > test.out 2>&1
eval_tap $? 176 'IncreaseTicketSale' test.out

#- 177 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '75pFwhn6' \
    --body '{"achievements": [{"id": "O9cWenEY", "value": 92}, {"id": "ovOvyvDp", "value": 18}, {"id": "cbXe2xVi", "value": 55}], "steamUserId": "KaRexnso"}' \
    > test.out 2>&1
eval_tap $? 177 'UnlockSteamUserAchievement' test.out

#- 178 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hp6xbwBZ' \
    --xboxUserId 'MHkCvspO' \
    > test.out 2>&1
eval_tap $? 178 'GetXblUserAchievements' test.out

#- 179 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mw3SGWI8' \
    --body '{"achievements": [{"id": "cXpEpuIq", "percentComplete": 96}, {"id": "2LnKvcNR", "percentComplete": 99}, {"id": "KTms1vQ7", "percentComplete": 17}], "serviceConfigId": "gh9GLyW6", "titleId": "l8nWLQdn", "xboxUserId": "Gq9z3Ae2"}' \
    > test.out 2>&1
eval_tap $? 179 'UpdateXblUserAchievement' test.out

#- 180 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'XzYwoHIU' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeCampaign' test.out

#- 181 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'nif5pYDO' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeEntitlement' test.out

#- 182 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGXLR0oq' \
    > test.out 2>&1
eval_tap $? 182 'AnonymizeFulfillment' test.out

#- 183 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'BU8LIr5K' \
    > test.out 2>&1
eval_tap $? 183 'AnonymizeIntegration' test.out

#- 184 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'GwSimWQB' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeOrder' test.out

#- 185 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'cYrHqHGz' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizePayment' test.out

#- 186 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'DVE9sy5z' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeSubscription' test.out

#- 187 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'X9Atr4OQ' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeWallet' test.out

#- 188 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'm5SWjIlx' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 188 'GetUserDLC' test.out

#- 189 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '0L3jCh2b' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'Il5H4Ll1' \
    --features 'PDZbYSEK,5aToqN09,CtZHQ7Xb' \
    --itemId 'LUMEq0nn,ttwM0EoU,wLzuYuHq' \
    --limit '89' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 189 'QueryUserEntitlements' test.out

#- 190 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6sc9YDV' \
    --body '[{"endDate": "1986-12-02T00:00:00Z", "grantedCode": "TW55TRnM", "itemId": "g0FoXFJD", "itemNamespace": "pzWGDr0z", "language": "dj-PsIF", "quantity": 95, "region": "ibc3Zg50", "source": "REDEEM_CODE", "startDate": "1985-03-28T00:00:00Z", "storeId": "xbkWEq6V"}, {"endDate": "1971-07-12T00:00:00Z", "grantedCode": "dqvobA9q", "itemId": "kXMD9nRt", "itemNamespace": "gPdpF18k", "language": "WjPG_AFjH", "quantity": 77, "region": "CksGNnAo", "source": "PROMOTION", "startDate": "1995-03-11T00:00:00Z", "storeId": "wTxt9OQa"}, {"endDate": "1972-07-28T00:00:00Z", "grantedCode": "SUek6e89", "itemId": "mxlVhkcV", "itemNamespace": "u7lsaimX", "language": "sG_cdlT_483", "quantity": 16, "region": "S3VKA7xN", "source": "IAP", "startDate": "1979-07-22T00:00:00Z", "storeId": "YnwnOGLc"}]' \
    > test.out 2>&1
eval_tap $? 190 'GrantUserEntitlement' test.out

#- 191 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QTxK7fxd' \
    --activeOnly  \
    --appId 'VQAHwdL1' \
    > test.out 2>&1
eval_tap $? 191 'GetUserAppEntitlementByAppId' test.out

#- 192 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'uvZ87bB9' \
    --activeOnly  \
    --limit '92' \
    --offset '84' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 192 'QueryUserEntitlementsByAppType' test.out

#- 193 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jxKpaEpP' \
    --activeOnly  \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'OANGriOM' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementByItemId' test.out

#- 194 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Etk8giug' \
    --ids 'xKQyXOPJ,lpClBQJR,XLDeaboh' \
    > test.out 2>&1
eval_tap $? 194 'GetUserActiveEntitlementsByItemIds' test.out

#- 195 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'lX7vT0GA' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku '2l33M3EK' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlementBySku' test.out

#- 196 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'dGtL8OWp' \
    --appIds 'YkGxcmug,gywyAg6U,W6y0fnJF' \
    --itemIds 'b7QzyZSu,rRFW5z9j,c56QvUoX' \
    --skus 'XmLdGRsV,xGAuOVNn,EyASIGUw' \
    > test.out 2>&1
eval_tap $? 196 'ExistsAnyUserActiveEntitlement' test.out

#- 197 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'w2tV9QUv' \
    --itemIds 'SN9no5RW,7ULBwDj3,lHdis0Ic' \
    > test.out 2>&1
eval_tap $? 197 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 198 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ggGHZoKS' \
    --appId 'uRK0Eq3k' \
    > test.out 2>&1
eval_tap $? 198 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 199 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 's5CyAk8v' \
    --entitlementClazz 'CODE' \
    --itemId 'HQuiWYkE' \
    > test.out 2>&1
eval_tap $? 199 'GetUserEntitlementOwnershipByItemId' test.out

#- 200 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9uywTbW' \
    --ids 'doQzgKdy,Mty60zEZ,Pismfk4k' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementOwnershipByItemIds' test.out

#- 201 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'KIyMJ0ab' \
    --entitlementClazz 'CODE' \
    --sku 'UjJwERQN' \
    > test.out 2>&1
eval_tap $? 201 'GetUserEntitlementOwnershipBySku' test.out

#- 202 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QGF6kTxf' \
    --entitlementIds 'zaNDdRmv' \
    > test.out 2>&1
eval_tap $? 202 'RevokeUserEntitlements' test.out

#- 203 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '4oTCMyOR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MxkbDXcK' \
    > test.out 2>&1
eval_tap $? 203 'GetUserEntitlement' test.out

#- 204 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'bOyvFiwe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xh4OziJF' \
    --body '{"endDate": "1973-02-11T00:00:00Z", "nullFieldList": ["CsrzbxON", "pSvyyzEZ", "Az4t5VNO"], "startDate": "1986-08-12T00:00:00Z", "status": "REVOKED", "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 204 'UpdateUserEntitlement' test.out

#- 205 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '1vKnVhQY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LkuX1INQ' \
    --body '{"options": ["LGZQQ3y3", "mduZa6JT", "hUFqACal"], "requestId": "jLVOvBIm", "useCount": 8}' \
    > test.out 2>&1
eval_tap $? 205 'ConsumeUserEntitlement' test.out

#- 206 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'vGFgiTHr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NEQUskaR' \
    > test.out 2>&1
eval_tap $? 206 'DisableUserEntitlement' test.out

#- 207 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'eE1HnK6w' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fJHLiBkh' \
    > test.out 2>&1
eval_tap $? 207 'EnableUserEntitlement' test.out

#- 208 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'lnCRnUnC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tcJD4mmd' \
    > test.out 2>&1
eval_tap $? 208 'GetUserEntitlementHistories' test.out

#- 209 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'pOP9e1hq' \
    --namespace "$AB_NAMESPACE" \
    --userId '52lv9Rbo' \
    > test.out 2>&1
eval_tap $? 209 'RevokeUserEntitlement' test.out

#- 210 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'VwvA6iRH' \
    --body '{"duration": 38, "endDate": "1996-05-31T00:00:00Z", "itemId": "6f141Gej", "itemSku": "IOiIq6pC", "language": "Sw2rf75S", "order": {"currency": {"currencyCode": "YxHW7KWW", "currencySymbol": "TQhVd8dt", "currencyType": "REAL", "decimals": 9, "namespace": "jdFZCNVC"}, "ext": {"YwTFuLCs": {}, "flkAVdTS": {}, "AljEXD3a": {}}, "free": false}, "orderNo": "FUnFvDVw", "origin": "Twitch", "quantity": 50, "region": "uWaeu6u7", "source": "PURCHASE", "startDate": "1992-08-09T00:00:00Z", "storeId": "zcoRPpYj"}' \
    > test.out 2>&1
eval_tap $? 210 'FulfillItem' test.out

#- 211 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGmgd5hc' \
    --body '{"code": "wo8ceRlf", "language": "qVTg_dEaG", "region": "3CYcO3yu"}' \
    > test.out 2>&1
eval_tap $? 211 'RedeemCode' test.out

#- 212 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'amzr6w2p' \
    --body '{"origin": "Stadia", "rewards": [{"currency": {"currencyCode": "AdGrmGzQ", "namespace": "pcpK9IDw"}, "item": {"itemId": "RYmRnIE2", "itemSku": "Rs3lpt7m", "itemType": "zvRnlLiO"}, "quantity": 40, "type": "ITEM"}, {"currency": {"currencyCode": "vaZGFtlZ", "namespace": "11ooF82V"}, "item": {"itemId": "070C0GFJ", "itemSku": "FF6xrhie", "itemType": "wII4bF5G"}, "quantity": 40, "type": "ITEM"}, {"currency": {"currencyCode": "SJbrArcR", "namespace": "tSVy0nR6"}, "item": {"itemId": "02gOi9Pm", "itemSku": "r0nEozJv", "itemType": "sJDZxwH5"}, "quantity": 100, "type": "CURRENCY"}], "source": "REWARD"}' \
    > test.out 2>&1
eval_tap $? 212 'FulfillRewards' test.out

#- 213 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ROhLhejs' \
    --endTime 'DxrOdxP6' \
    --limit '57' \
    --offset '93' \
    --productId 'hn2VbBoh' \
    --startTime 'CyCfcf2A' \
    --status 'VERIFIED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 213 'QueryUserIAPOrders' test.out

#- 214 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'wdSejDIJ' \
    > test.out 2>&1
eval_tap $? 214 'QueryAllUserIAPOrders' test.out

#- 215 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'uoken6n4' \
    --endTime 'ZSteqCiH' \
    --limit '86' \
    --offset '48' \
    --startTime 'Ginm0r65' \
    --status 'FAIL' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 215 'QueryUserIAPConsumeHistory' test.out

#- 216 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'F6JOWhfs' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "aj", "productId": "kYOqA33L", "region": "UkJHDsiM", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 216 'MockFulfillIAPItem' test.out

#- 217 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'l658bcSr' \
    --itemId 'Pz4PX6tN' \
    --limit '79' \
    --offset '83' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 217 'QueryUserOrders' test.out

#- 218 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'aWTnzGIV' \
    --body '{"currencyCode": "92KlPLUG", "currencyNamespace": "vGHQVCnt", "discountedPrice": 63, "ext": {"rp58olp2": {}, "7q1KXC3j": {}, "hK9lIcTA": {}}, "itemId": "f7rlEqp2", "language": "xwJKg30u", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 99, "quantity": 69, "region": "goIsai8V", "returnUrl": "goGJeaSI", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 218 'AdminCreateUserOrder' test.out

#- 219 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'aggG9ZuF' \
    --itemId 'KGm4sRyw' \
    > test.out 2>&1
eval_tap $? 219 'CountOfPurchasedItem' test.out

#- 220 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iUc0t2Qm' \
    --userId 'g9Rp47gK' \
    > test.out 2>&1
eval_tap $? 220 'GetUserOrder' test.out

#- 221 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mQvDe3ba' \
    --userId 'xjalnfiG' \
    --body '{"status": "REFUND_FAILED", "statusReason": "kq3mbbNg"}' \
    > test.out 2>&1
eval_tap $? 221 'UpdateUserOrderStatus' test.out

#- 222 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gaMRUKWH' \
    --userId 'nEXMwOyc' \
    > test.out 2>&1
eval_tap $? 222 'FulfillUserOrder' test.out

#- 223 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QdOora3l' \
    --userId '7BF5aq1G' \
    > test.out 2>&1
eval_tap $? 223 'GetUserOrderGrant' test.out

#- 224 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ojVo9eAH' \
    --userId 'vaQCd8Ci' \
    > test.out 2>&1
eval_tap $? 224 'GetUserOrderHistories' test.out

#- 225 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'z2hIlCk0' \
    --userId '3wuQs5qJ' \
    --body '{"additionalData": {"cardSummary": "9RnzbK9g"}, "authorisedTime": "1997-06-26T00:00:00Z", "chargebackReversedTime": "1979-11-13T00:00:00Z", "chargebackTime": "1981-06-25T00:00:00Z", "chargedTime": "1993-01-24T00:00:00Z", "createdTime": "1979-08-24T00:00:00Z", "currency": {"currencyCode": "1Pljj8Su", "currencySymbol": "aggzxC3r", "currencyType": "VIRTUAL", "decimals": 19, "namespace": "tujv8QWT"}, "customParameters": {"2Z986UMb": {}, "vj0mZas7": {}, "MkLXhVxK": {}}, "extOrderNo": "ddBiS5RK", "extTxId": "0P1ELbsI", "extUserId": "vMakTHiW", "issuedAt": "1991-05-23T00:00:00Z", "metadata": {"33ZPBC3X": "dSnlvehz", "Vy1Xs9Jp": "xadEh0Hi", "wRQTUKO4": "ADwW9GS7"}, "namespace": "G6Qf6a06", "nonceStr": "ldE5mCQ5", "paymentMethod": "nR1NyMoZ", "paymentMethodFee": 61, "paymentOrderNo": "mZ5ziB49", "paymentProvider": "ALIPAY", "paymentProviderFee": 4, "paymentStationUrl": "rpwNi5Mx", "price": 30, "refundedTime": "1973-05-14T00:00:00Z", "salesTax": 67, "sandbox": true, "sku": "VoXJq1si", "status": "CHARGEBACK_REVERSED", "statusReason": "oHQclccf", "subscriptionId": "loqQT1M1", "subtotalPrice": 82, "targetNamespace": "2fChGrP5", "targetUserId": "qgf72OsX", "tax": 6, "totalPrice": 72, "totalTax": 48, "txEndTime": "1986-03-12T00:00:00Z", "type": "ziukfnqO", "userId": "xIBIvAV8", "vat": 86}' \
    > test.out 2>&1
eval_tap $? 225 'ProcessUserOrderNotification' test.out

#- 226 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'x6qYqWFU' \
    --userId 'KipLEoLK' \
    > test.out 2>&1
eval_tap $? 226 'DownloadUserOrderReceipt' test.out

#- 227 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'qj2evOuU' \
    --body '{"currencyCode": "47Ik8ZBp", "currencyNamespace": "hoLMd0Dy", "customParameters": {"b321AYHZ": {}, "ztwOujf2": {}, "udNMsTAZ": {}}, "description": "WQhsz7ef", "extOrderNo": "RICBJi04", "extUserId": "9g7XFUlX", "itemType": "MEDIA", "language": "suHA-xdpw_467", "metadata": {"M3jJMOj7": "VnEnIv0N", "MJPt7ObT": "oDApLqz0", "GPlzreQ0": "NPSQ9XRy"}, "notifyUrl": "BDrQWJzv", "omitNotification": true, "platform": "qHO6WW7j", "price": 31, "recurringPaymentOrderNo": "lX9TNc1h", "region": "kahncKGf", "returnUrl": "EvgoswZc", "sandbox": true, "sku": "jGPsCCzY", "subscriptionId": "6c9IJ3aj", "title": "i8gO85FX"}' \
    > test.out 2>&1
eval_tap $? 227 'CreateUserPaymentOrder' test.out

#- 228 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HagcR8Sx' \
    --userId 'qCeg8dB5' \
    --body '{"description": "wDQZ0HjG"}' \
    > test.out 2>&1
eval_tap $? 228 'RefundUserPaymentOrder' test.out

#- 229 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'VAfFec0Z' \
    --body '{"code": "Llfvq52c", "orderNo": "ZmWr7ZQh"}' \
    > test.out 2>&1
eval_tap $? 229 'ApplyUserRedemption' test.out

#- 230 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIYpdKIm' \
    --chargeStatus 'SETUP' \
    --itemId 'lfBexqyu' \
    --limit '27' \
    --offset '16' \
    --sku 'kJy1yavH' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 230 'QueryUserSubscriptions' test.out

#- 231 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'wWXlJBwb' \
    --excludeSystem  \
    --limit '81' \
    --offset '8' \
    --subscriptionId 'Ep9If91F' \
    > test.out 2>&1
eval_tap $? 231 'GetUserSubscriptionActivities' test.out

#- 232 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukkafwbr' \
    --body '{"grantDays": 8, "itemId": "dsH25Gro", "language": "0OafSYey", "reason": "cqAAZ7Rf", "region": "ZnPdLZzG", "source": "6YcWKUtb"}' \
    > test.out 2>&1
eval_tap $? 232 'PlatformSubscribeSubscription' test.out

#- 233 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qK8zBP9B' \
    --itemId 'l69i54mv' \
    > test.out 2>&1
eval_tap $? 233 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 234 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ACPpBczL' \
    --userId 'YdNHwCAs' \
    > test.out 2>&1
eval_tap $? 234 'GetUserSubscription' test.out

#- 235 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0E7brXpP' \
    --userId '3SfMIMvD' \
    > test.out 2>&1
eval_tap $? 235 'DeleteUserSubscription' test.out

#- 236 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7hzCB8Od' \
    --userId 'C2hqS9Jw' \
    --force  \
    --body '{"immediate": false, "reason": "xO1lJ5VG"}' \
    > test.out 2>&1
eval_tap $? 236 'CancelSubscription' test.out

#- 237 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dpIxVowO' \
    --userId 'V69KP10y' \
    --body '{"grantDays": 83, "reason": "AvmsF8vd"}' \
    > test.out 2>&1
eval_tap $? 237 'GrantDaysToSubscription' test.out

#- 238 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yeZsEoLz' \
    --userId 'jObCCLR9' \
    --excludeFree  \
    --limit '99' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 238 'GetUserSubscriptionBillingHistories' test.out

#- 239 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8vuO5l8q' \
    --userId '8TkLjqP7' \
    --body '{"additionalData": {"cardSummary": "qKprrBkc"}, "authorisedTime": "1991-11-19T00:00:00Z", "chargebackReversedTime": "1971-08-11T00:00:00Z", "chargebackTime": "1983-03-01T00:00:00Z", "chargedTime": "1992-12-20T00:00:00Z", "createdTime": "1980-09-13T00:00:00Z", "currency": {"currencyCode": "GnOUBU56", "currencySymbol": "SsbcCsv7", "currencyType": "VIRTUAL", "decimals": 24, "namespace": "SkRh91YP"}, "customParameters": {"UDevM9vF": {}, "prPe0rQS": {}, "WYOqZVta": {}}, "extOrderNo": "OHsVkXAv", "extTxId": "rb5SSnTz", "extUserId": "vAQU5gkM", "issuedAt": "1998-02-01T00:00:00Z", "metadata": {"m0y7e4pG": "XGzFCRx1", "KqGwqppN": "h4myBomD", "gTdMZxyA": "3ZNXeNTp"}, "namespace": "vZbjXmq4", "nonceStr": "7GVQlLpk", "paymentMethod": "WUSkzZXe", "paymentMethodFee": 1, "paymentOrderNo": "QOA0W1e0", "paymentProvider": "STRIPE", "paymentProviderFee": 29, "paymentStationUrl": "Ur98Xkyc", "price": 3, "refundedTime": "1985-02-17T00:00:00Z", "salesTax": 43, "sandbox": true, "sku": "BbwoXhAw", "status": "DELETED", "statusReason": "cvep9Acs", "subscriptionId": "fupbWxgd", "subtotalPrice": 6, "targetNamespace": "0xcKSqFc", "targetUserId": "afxIAtot", "tax": 69, "totalPrice": 51, "totalTax": 61, "txEndTime": "1982-01-24T00:00:00Z", "type": "gUPYiaME", "userId": "pi29PbyK", "vat": 91}' \
    > test.out 2>&1
eval_tap $? 239 'ProcessUserSubscriptionNotification' test.out

#- 240 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'QV7V0mgh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lgcyJ5Jf' \
    --body '{"count": 81, "orderNo": "nUroQbu5"}' \
    > test.out 2>&1
eval_tap $? 240 'AcquireUserTicket' test.out

#- 241 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'tn643jjc' \
    > test.out 2>&1
eval_tap $? 241 'QueryUserCurrencyWallets' test.out

#- 242 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '4jZX2ZMV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WHlYnY6O' \
    --limit '74' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 242 'ListUserCurrencyTransactions' test.out

#- 243 CheckWallet
eval_tap 0 243 'CheckWallet # SKIP deprecated' test.out

#- 244 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'mGsoClgo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TkUpOFdB' \
    --body '{"amount": 36, "expireAt": "1975-02-16T00:00:00Z", "origin": "GooglePlay", "reason": "adO4Hn7H", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 244 'CreditUserWallet' test.out

#- 245 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'x3X7PlbW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b7EUKCPV' \
    --body '{"amount": 66, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 245 'PayWithUserWallet' test.out

#- 246 GetUserWallet
eval_tap 0 246 'GetUserWallet # SKIP deprecated' test.out

#- 247 DebitUserWallet
eval_tap 0 247 'DebitUserWallet # SKIP deprecated' test.out

#- 248 DisableUserWallet
eval_tap 0 248 'DisableUserWallet # SKIP deprecated' test.out

#- 249 EnableUserWallet
eval_tap 0 249 'EnableUserWallet # SKIP deprecated' test.out

#- 250 ListUserWalletTransactions
eval_tap 0 250 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 251 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gGAAnXZw' \
    > test.out 2>&1
eval_tap $? 251 'ListViews' test.out

#- 252 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'y3YQIHWG' \
    --body '{"displayOrder": 37, "localizations": {"0JuCj8ik": {"description": "rCjXQc0i", "localExt": {"m6jVF06M": {}, "kLccaEgX": {}, "Tk82JQ0U": {}}, "longDescription": "jlswN96F", "title": "c39Bwnp6"}, "r8a2dFPp": {"description": "CGna4F2A", "localExt": {"Cj9y93tS": {}, "PjvBjYYx": {}, "GiULPYQn": {}}, "longDescription": "Wc9JOzA1", "title": "iQ6008Ys"}, "rL5tm6Sw": {"description": "MHl0DfXR", "localExt": {"7UmKQVmm": {}, "jNHN951H": {}, "kpogFKdp": {}}, "longDescription": "sJs4Nt1H", "title": "J4uLEUow"}}, "name": "o3Cpjh9N"}' \
    > test.out 2>&1
eval_tap $? 252 'CreateView' test.out

#- 253 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'IUp8JJsj' \
    --storeId 'M72MhwmK' \
    > test.out 2>&1
eval_tap $? 253 'GetView' test.out

#- 254 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'BqVfXkPg' \
    --storeId 'u3xPMfHe' \
    --body '{"displayOrder": 24, "localizations": {"ztZnpqSL": {"description": "yFvhkfTf", "localExt": {"vuzUDn3b": {}, "zmG1cb9M": {}, "AfY6rrxI": {}}, "longDescription": "Avtz73aG", "title": "HMCkTlNt"}, "kYX8UG8T": {"description": "Elz9lA9a", "localExt": {"U8OYSSBm": {}, "M1xxf29J": {}, "KoxOsxEN": {}}, "longDescription": "rqsFak40", "title": "ja6T85yU"}, "ibIsaPgx": {"description": "EkR1jhYC", "localExt": {"uIgn62xr": {}, "BGBZMpNW": {}, "1Sl05Ffd": {}}, "longDescription": "ZhnFMiVx", "title": "XCUBVZU5"}}, "name": "PruqW0dc"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateView' test.out

#- 255 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'uI55yh2a' \
    --storeId 'gr0ytmRn' \
    > test.out 2>&1
eval_tap $? 255 'DeleteView' test.out

#- 256 QueryWallets
eval_tap 0 256 'QueryWallets # SKIP deprecated' test.out

#- 257 GetWallet
eval_tap 0 257 'GetWallet # SKIP deprecated' test.out

#- 258 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '1s9Gib18' \
    --end 'mM7f8sE0' \
    --start 'uY2vmojg' \
    > test.out 2>&1
eval_tap $? 258 'SyncOrders' test.out

#- 259 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["jPWd5gMH", "e6uT2hkr", "csJ5j1LD"], "apiKey": "uWSCs6tJ", "authoriseAsCapture": true, "blockedPaymentMethods": ["PZu5nSeM", "u5wmzGH6", "rZU5SQdr"], "clientKey": "J7yHb80p", "dropInSettings": "cOags79U", "liveEndpointUrlPrefix": "eTaAWUjU", "merchantAccount": "HMr0DrvK", "notificationHmacKey": "FxM6PvzZ", "notificationPassword": "k9UVTHi5", "notificationUsername": "ICZFpX8N", "returnUrl": "nTlwXANB", "settings": "dTR7GJK9"}' \
    > test.out 2>&1
eval_tap $? 259 'TestAdyenConfig' test.out

#- 260 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "0OYgZVZb", "privateKey": "B4l6QevG", "publicKey": "rCeNXZNq", "returnUrl": "alZLKfmc"}' \
    > test.out 2>&1
eval_tap $? 260 'TestAliPayConfig' test.out

#- 261 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "bSfKEcNn", "secretKey": "4yYErL1V"}' \
    > test.out 2>&1
eval_tap $? 261 'TestCheckoutConfig' test.out

#- 262 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'UXdM2mpT' \
    > test.out 2>&1
eval_tap $? 262 'DebugMatchedPaymentMerchantConfig' test.out

#- 263 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "0qy17MyY", "clientSecret": "Pfq1Dl2Q", "returnUrl": "nqIgmFmT", "webHookId": "sb20phUn"}' \
    > test.out 2>&1
eval_tap $? 263 'TestPayPalConfig' test.out

#- 264 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["H3iXEaZT", "vPBObHTi", "G3PgCcj0"], "publishableKey": "UjAkCjyB", "secretKey": "VGOcLAC9", "webhookSecret": "yMDvJyWJ"}' \
    > test.out 2>&1
eval_tap $? 264 'TestStripeConfig' test.out

#- 265 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "xCfvOLYp", "key": "beMqRoC4", "mchid": "AZT2DH2d", "returnUrl": "dTgVRMKr"}' \
    > test.out 2>&1
eval_tap $? 265 'TestWxPayConfig' test.out

#- 266 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "5NNYxJv2", "flowCompletionUrl": "dzKbPamH", "merchantId": 37, "projectId": 38, "projectSecretKey": "reIfZyY5"}' \
    > test.out 2>&1
eval_tap $? 266 'TestXsollaConfig' test.out

#- 267 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'DSTXP0Hw' \
    > test.out 2>&1
eval_tap $? 267 'GetPaymentMerchantConfig' test.out

#- 268 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'SaQp8JHo' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["YgIUqcb6", "bUwUa0CN", "hxc1dQKf"], "apiKey": "234MpDC2", "authoriseAsCapture": false, "blockedPaymentMethods": ["s9fSDKkb", "XTWzczsV", "uBpaPo6N"], "clientKey": "KHRdwo22", "dropInSettings": "rIXVanWM", "liveEndpointUrlPrefix": "TLdacU1C", "merchantAccount": "YHAXFrFU", "notificationHmacKey": "yYLyJp8s", "notificationPassword": "TYGqpwEu", "notificationUsername": "N6AVbHIf", "returnUrl": "J4TczgZ3", "settings": "bPwHqx2h"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateAdyenConfig' test.out

#- 269 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'btXfoQM1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 269 'TestAdyenConfigById' test.out

#- 270 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '7CkJIbay' \
    --sandbox  \
    --validate  \
    --body '{"appId": "u56aQU5H", "privateKey": "pHd9zyFc", "publicKey": "CRtIYtXG", "returnUrl": "QyocG9OX"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateAliPayConfig' test.out

#- 271 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'S7PhfLkO' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 271 'TestAliPayConfigById' test.out

#- 272 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'droe2Tw9' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "019Uuw38", "secretKey": "owriBV7t"}' \
    > test.out 2>&1
eval_tap $? 272 'UpdateCheckoutConfig' test.out

#- 273 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'pmBvOGrK' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 273 'TestCheckoutConfigById' test.out

#- 274 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'iEUmvWmz' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "TRaQLCvI", "clientSecret": "dkXd0FRk", "returnUrl": "zWSZTyIQ", "webHookId": "E7mPPe7m"}' \
    > test.out 2>&1
eval_tap $? 274 'UpdatePayPalConfig' test.out

#- 275 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'bqK7lDiK' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 275 'TestPayPalConfigById' test.out

#- 276 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '5CCDYDD8' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["O2TlGzTc", "XnCcoVyS", "epDZSE9R"], "publishableKey": "IacKmN3O", "secretKey": "VzD0hQcv", "webhookSecret": "mgvWHAFL"}' \
    > test.out 2>&1
eval_tap $? 276 'UpdateStripeConfig' test.out

#- 277 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'w7FSe9PY' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 277 'TestStripeConfigById' test.out

#- 278 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'uKOQUCoq' \
    --validate  \
    --body '{"appId": "JcohsP0b", "key": "X2bwXpBR", "mchid": "n48xeDcg", "returnUrl": "TfvqMrIq"}' \
    > test.out 2>&1
eval_tap $? 278 'UpdateWxPayConfig' test.out

#- 279 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'jMPBu3jS' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 279 'UpdateWxPayConfigCert' test.out

#- 280 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'Vyyi2t65' \
    > test.out 2>&1
eval_tap $? 280 'TestWxPayConfigById' test.out

#- 281 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'mI36EQKY' \
    --validate  \
    --body '{"apiKey": "g08FL3PH", "flowCompletionUrl": "cqiIzIju", "merchantId": 64, "projectId": 11, "projectSecretKey": "E8jRj6za"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdateXsollaConfig' test.out

#- 282 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'm2eZQD7c' \
    > test.out 2>&1
eval_tap $? 282 'TestXsollaConfigById' test.out

#- 283 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'zET5cte6' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "LARGE", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdateXsollaUIConfig' test.out

#- 284 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '18' \
    --namespace "$AB_NAMESPACE" \
    --offset '34' \
    --region 'tiQTIAH4' \
    > test.out 2>&1
eval_tap $? 284 'QueryPaymentProviderConfig' test.out

#- 285 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "8D4zCqRr", "region": "aWKMcC4F", "sandboxTaxJarApiToken": "cnIwDN6s", "specials": ["WXPAY", "WXPAY", "PAYPAL"], "taxJarApiToken": "4EcxmPd9", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 285 'CreatePaymentProviderConfig' test.out

#- 286 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 286 'GetAggregatePaymentProviders' test.out

#- 287 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'oLDH8eUT' \
    > test.out 2>&1
eval_tap $? 287 'DebugMatchedPaymentProviderConfig' test.out

#- 288 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 288 'GetSpecialPaymentProviders' test.out

#- 289 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'pMDS0eFG' \
    --body '{"aggregate": "XSOLLA", "namespace": "1s6SZ77Z", "region": "dav57snK", "sandboxTaxJarApiToken": "weJv4BOi", "specials": ["WALLET", "WALLET", "ADYEN"], "taxJarApiToken": "DtORskWG", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 289 'UpdatePaymentProviderConfig' test.out

#- 290 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'DOZRHW4h' \
    > test.out 2>&1
eval_tap $? 290 'DeletePaymentProviderConfig' test.out

#- 291 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 291 'GetPaymentTaxConfig' test.out

#- 292 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "GcMWkiB4", "taxJarApiToken": "JoMfjmTe", "taxJarEnabled": false, "taxJarProductCodesMapping": {"t4aicoLZ": "x3pW8yPq", "e2tH03FJ": "tcdUdChD", "X0xNxwIK": "F7b1MeQM"}}' \
    > test.out 2>&1
eval_tap $? 292 'UpdatePaymentTaxConfig' test.out

#- 293 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'w13nIbQ4' \
    --end 'pFDViaYi' \
    --start 'qvgg6ZHL' \
    > test.out 2>&1
eval_tap $? 293 'SyncPaymentOrders' test.out

#- 294 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'cYwcqZ6A' \
    --storeId 'jXkPanZz' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetRootCategories' test.out

#- 295 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'He97Qnqt' \
    --storeId '102UTUUn' \
    > test.out 2>&1
eval_tap $? 295 'DownloadCategories' test.out

#- 296 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'gE6dtgeP' \
    --namespace "$AB_NAMESPACE" \
    --language 'daqoBMx6' \
    --storeId 'gdhOQIQe' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetCategory' test.out

#- 297 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'jd1jpZ2b' \
    --namespace "$AB_NAMESPACE" \
    --language 'TlkDq7IJ' \
    --storeId 'ucuu4AYi' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetChildCategories' test.out

#- 298 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'Tf6lHNzf' \
    --namespace "$AB_NAMESPACE" \
    --language '7rEwWmNW' \
    --storeId 'FqEXjIp8' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetDescendantCategories' test.out

#- 299 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 299 'PublicListCurrencies' test.out

#- 300 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'p49GcdSY' \
    --region 'DDkVfSe1' \
    --storeId 'K1LI8R57' \
    --appId 'WLc7JhKv' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetItemByAppId' test.out

#- 301 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId '47oBTxtg' \
    --categoryPath 'ZHDXDir6' \
    --features 'VPwSghta' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'UPxW1AWO' \
    --limit '17' \
    --offset '100' \
    --region '0TtMUurP' \
    --sortBy 'name:asc,name:desc,updatedAt:asc' \
    --storeId 'n2sSHj8y' \
    --tags 'ecJIQoB6' \
    > test.out 2>&1
eval_tap $? 301 'PublicQueryItems' test.out

#- 302 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'CgejY8qT' \
    --region 'gWtxKn5u' \
    --storeId 'eY58kc2k' \
    --sku 'zdy3P7pQ' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetItemBySku' test.out

#- 303 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'swQoEpdd' \
    --region 'UFFEnhNk' \
    --storeId 'BrkDeHGA' \
    --itemIds 'tVucG3t3' \
    > test.out 2>&1
eval_tap $? 303 'PublicBulkGetItems' test.out

#- 304 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["zddIOW3Z", "uxAYfH7l", "a67bCyVC"]}' \
    > test.out 2>&1
eval_tap $? 304 'PublicValidateItemPurchaseCondition' test.out

#- 305 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '64' \
    --offset '16' \
    --region '8PyxAqJV' \
    --storeId 'qDDAgG06' \
    --keyword 'pEFNZutK' \
    --language 'DM83YNQt' \
    > test.out 2>&1
eval_tap $? 305 'PublicSearchItems' test.out

#- 306 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'URB9FSNw' \
    --namespace "$AB_NAMESPACE" \
    --language 'hF0wb1rt' \
    --region 'XpmCh5kd' \
    --storeId 'yHvfWGIs' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetApp' test.out

#- 307 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'GIYRIPsS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'PublicGetItemDynamicData' test.out

#- 308 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'u9bznGZQ' \
    --namespace "$AB_NAMESPACE" \
    --language '7F9aBS5N' \
    --populateBundle  \
    --region '4bH0JdVe' \
    --storeId 'VZ9gZk4J' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetItem' test.out

#- 309 GetPaymentCustomization
eval_tap 0 309 'GetPaymentCustomization # SKIP deprecated' test.out

#- 310 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "6SEYmcf6", "paymentProvider": "XSOLLA", "returnUrl": "Viiws3rY", "ui": "164F8tPm", "zipCode": "XkAFJ0CA"}' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetPaymentUrl' test.out

#- 311 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sckXI8xj' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetPaymentMethods' test.out

#- 312 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hgtCDwQw' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUnpaidPaymentOrder' test.out

#- 313 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'n9QPodjZ' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'B4Scno2q' \
    --body '{"token": "5dHdkVLG"}' \
    > test.out 2>&1
eval_tap $? 313 'Pay' test.out

#- 314 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7NADX6mN' \
    > test.out 2>&1
eval_tap $? 314 'PublicCheckPaymentOrderPaidStatus' test.out

#- 315 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'STRIPE' \
    --region 'PQ8S4ira' \
    > test.out 2>&1
eval_tap $? 315 'GetPaymentPublicConfig' test.out

#- 316 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'y2Usdsdg' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetQRCode' test.out

#- 317 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'U02CHQ53' \
    --foreinginvoice 'vV4ABZXu' \
    --invoiceId '0AYQFkIE' \
    --payload 'Ut81gKfo' \
    --redirectResult 'swcWcJ5q' \
    --resultCode 'yQNrWD8D' \
    --sessionId 'mKEZR6Aw' \
    --status 'aWvnfwJt' \
    --token 'UzlNpc4R' \
    --type 'QJgUL6eG' \
    --userId 'CnjlYbFh' \
    --orderNo 'XbkraPOH' \
    --paymentOrderNo 'k8ofpuMu' \
    --paymentProvider 'XSOLLA' \
    --returnUrl 'SrXL0bFC' \
    > test.out 2>&1
eval_tap $? 317 'PublicNormalizePaymentReturnUrl' test.out

#- 318 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'ru2vFcUW' \
    --paymentOrderNo 'EaPVAStq' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 318 'GetPaymentTaxValue' test.out

#- 319 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'fBfzyw20' \
    > test.out 2>&1
eval_tap $? 319 'GetRewardByCode' test.out

#- 320 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'VGj4BgZ6' \
    --limit '96' \
    --offset '92' \
    --sortBy 'rewardCode,rewardCode:asc,namespace' \
    > test.out 2>&1
eval_tap $? 320 'QueryRewards1' test.out

#- 321 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6P7oeJPn' \
    > test.out 2>&1
eval_tap $? 321 'GetReward1' test.out

#- 322 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 322 'PublicListStores' test.out

#- 323 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'm8cC5JL3,gifVnKAp,zX1LSQ0K' \
    --itemIds '8Xp8M6dW,LJk6ueaa,YuJ3MXPk' \
    --skus 'PsM7fR0q,MBKW3XlE,CJKNTfMx' \
    > test.out 2>&1
eval_tap $? 323 'PublicExistsAnyMyActiveEntitlement' test.out

#- 324 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'fx07tMIN' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 325 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'X85KeL4Q' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 326 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku 'KEWuLxVq' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 327 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'eyZqqYVs,cDViwIms,yWoqdwVb' \
    --itemIds 'aQ9fB2P7,lTLaRN6w,6Xsd9szO' \
    --skus 'orzIht2T,D4XQOd0D,EK6DsR0A' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetEntitlementOwnershipToken' test.out

#- 328 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'quJd2tvl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyWallet' test.out

#- 329 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'GUhvOFy9' \
    --body '{"epicGamesJwtToken": "UqLPcrj2"}' \
    > test.out 2>&1
eval_tap $? 329 'SyncEpicGameDLC' test.out

#- 330 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'p5cYFkmC' \
    --body '{"serviceLabel": 33}' \
    > test.out 2>&1
eval_tap $? 330 'PublicSyncPsnDlcInventory' test.out

#- 331 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lr3tJH88' \
    --body '{"serviceLabels": [43, 44, 47]}' \
    > test.out 2>&1
eval_tap $? 331 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 332 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'XNNZxkOC' \
    --body '{"appId": "MpFirWsM", "steamId": "oYvleszb"}' \
    > test.out 2>&1
eval_tap $? 332 'SyncSteamDLC' test.out

#- 333 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'k9QAYy0q' \
    --body '{"xstsToken": "TkBTgi5f"}' \
    > test.out 2>&1
eval_tap $? 333 'SyncXboxDLC' test.out

#- 334 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OKOgtA3e' \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'h6JQqJtF' \
    --features 'ZPa9Irfx,lAQDk2C6,urbx0BFM' \
    --itemId 'Evm4ZVek,veaOmax7,Clf5e9pV' \
    --limit '73' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 334 'PublicQueryUserEntitlements' test.out

#- 335 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PwpiIINO' \
    --appId 'I94hI7cF' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetUserAppEntitlementByAppId' test.out

#- 336 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xod0mjIT' \
    --limit '12' \
    --offset '100' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 336 'PublicQueryUserEntitlementsByAppType' test.out

#- 337 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WXHx9hg9' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'TDPr4SBC' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetUserEntitlementByItemId' test.out

#- 338 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'PX2Y1hNs' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'JXsscVFT' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetUserEntitlementBySku' test.out

#- 339 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'm1H0WRrH' \
    --appIds 'ZtNHEFPL,9c3zn8dq,PvlKNr2N' \
    --itemIds 'PZFKOi6X,UC4a9Sbo,C6qfHgc1' \
    --skus 'fuT1y0ry,6RPgAnn1,1cV24zHM' \
    > test.out 2>&1
eval_tap $? 339 'PublicExistsAnyUserActiveEntitlement' test.out

#- 340 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'dPFFmgWL' \
    --appId 'wpNmX507' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 341 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzC6XE5H' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'StHNXtut' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 342 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '5xa1tZaC' \
    --ids 'LtOTfyha,btfz5d9K,oSgO9tPa' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 343 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'V2zNsd9P' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'yiO6KS7b' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 344 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '0pAhDYIr' \
    --namespace "$AB_NAMESPACE" \
    --userId '4qVzxMR2' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlement' test.out

#- 345 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '0yyDpiOK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ffBreG7t' \
    --body '{"options": ["ceSi4DzZ", "jdqUlgNk", "ndtzRcwG"], "requestId": "HfzJESph", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 345 'PublicConsumeUserEntitlement' test.out

#- 346 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'QvGlyXGw' \
    --body '{"code": "kVEL6ymA", "language": "pcT", "region": "Ge8THEan"}' \
    > test.out 2>&1
eval_tap $? 346 'PublicRedeemCode' test.out

#- 347 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XJLLTF7u' \
    --body '{"excludeOldTransactions": false, "language": "nl-OVtT-HJ", "productId": "d3cnLWrG", "receiptData": "FTj7vA8j", "region": "8bbMu5B0", "transactionId": "UrgcGRZX"}' \
    > test.out 2>&1
eval_tap $? 347 'PublicFulfillAppleIAPItem' test.out

#- 348 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '4VjcF9WK' \
    --body '{"epicGamesJwtToken": "JX8ZyfYS"}' \
    > test.out 2>&1
eval_tap $? 348 'SyncEpicGamesInventory' test.out

#- 349 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZbKp5yf5' \
    --body '{"autoAck": false, "language": "XKE", "orderId": "qahBgD9t", "packageName": "TFBxKlBS", "productId": "Z5IdB95M", "purchaseTime": 66, "purchaseToken": "IhpU4fFM", "region": "4vAW1y0M"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicFulfillGoogleIAPItem' test.out

#- 350 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'mH5nyjOI' \
    --body '{"currencyCode": "h177L8CD", "price": 0.16698841863831315, "productId": "gJt7N6jN", "serviceLabel": 74}' \
    > test.out 2>&1
eval_tap $? 350 'PublicReconcilePlayStationStore' test.out

#- 351 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'DJjmJZ3F' \
    --body '{"currencyCode": "fIlpGFbc", "price": 0.992996459172508, "productId": "YT16QRgT", "serviceLabels": [88, 33, 7]}' \
    > test.out 2>&1
eval_tap $? 351 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 352 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '8wygpXP2' \
    --body '{"appId": "KLbl3DZX", "language": "aC_904", "region": "9csgPwgA", "stadiaPlayerId": "cL2wbp5a"}' \
    > test.out 2>&1
eval_tap $? 352 'SyncStadiaEntitlement' test.out

#- 353 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'J4rxAoG0' \
    --body '{"appId": "uMlYmI1a", "currencyCode": "q8uBbNGh", "language": "gqF", "price": 0.3056788359660153, "productId": "flsgrzI3", "region": "GgweoFHV", "steamId": "Ku2a2oXc"}' \
    > test.out 2>&1
eval_tap $? 353 'SyncSteamInventory' test.out

#- 354 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KQvo5xu9' \
    --body '{"gameId": "mjcxnYWK", "language": "Cj_Ukng_aI", "region": "bCH4uA8M"}' \
    > test.out 2>&1
eval_tap $? 354 'SyncTwitchDropsEntitlement' test.out

#- 355 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'w6iyvkjE' \
    --body '{"currencyCode": "t3emYvm1", "price": 0.27236521466646746, "productId": "fciwTn1u", "xstsToken": "0vNVdda9"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncXboxInventory' test.out

#- 356 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijxD1ZU9' \
    --itemId 'NRRW4F7X' \
    --limit '93' \
    --offset '27' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 356 'PublicQueryUserOrders' test.out

#- 357 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'jAS0QsK7' \
    --body '{"currencyCode": "wqXzHztG", "discountedPrice": 80, "ext": {"HzMX7slt": {}, "pSZk1mNi": {}, "MSexykI1": {}}, "itemId": "JMsu3Bcm", "language": "IR_EOtp", "price": 4, "quantity": 91, "region": "GR2cT4ji", "returnUrl": "mbu3GFBr"}' \
    > test.out 2>&1
eval_tap $? 357 'PublicCreateUserOrder' test.out

#- 358 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ltQ07XSd' \
    --userId 'sPYRG0vs' \
    > test.out 2>&1
eval_tap $? 358 'PublicGetUserOrder' test.out

#- 359 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JtSVvgJm' \
    --userId '9XaA3nR8' \
    > test.out 2>&1
eval_tap $? 359 'PublicCancelUserOrder' test.out

#- 360 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dOSdFz0Z' \
    --userId '7R1IIvKt' \
    > test.out 2>&1
eval_tap $? 360 'PublicGetUserOrderHistories' test.out

#- 361 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eeJTTTFR' \
    --userId 'd1xmVZus' \
    > test.out 2>&1
eval_tap $? 361 'PublicDownloadUserOrderReceipt' test.out

#- 362 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhA0qqTt' \
    > test.out 2>&1
eval_tap $? 362 'PublicGetPaymentAccounts' test.out

#- 363 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'czhfuhPl' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'rltG1Bdg' \
    > test.out 2>&1
eval_tap $? 363 'PublicDeletePaymentAccount' test.out

#- 364 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'ssI0QfEd' \
    --language 'h2391K7h' \
    --region 'Ti07eY5g' \
    --storeId '086xI2qS' \
    --viewId 'zS7gkApr' \
    > test.out 2>&1
eval_tap $? 364 'PublicListActiveSections' test.out

#- 365 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'TPOiYig8' \
    --chargeStatus 'CHARGED' \
    --itemId 'bk2bgn0k' \
    --limit '12' \
    --offset '93' \
    --sku '9Y13dZXV' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 365 'PublicQueryUserSubscriptions' test.out

#- 366 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'c0HVBWce' \
    --body '{"currencyCode": "q3IjSdXe", "itemId": "r0qeW2vG", "language": "nzMy-zz", "region": "ORNemy5Q", "returnUrl": "uERSaDgV", "source": "s7FMNdmq"}' \
    > test.out 2>&1
eval_tap $? 366 'PublicSubscribeSubscription' test.out

#- 367 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FlIj5ctx' \
    --itemId 'EDy3RDQt' \
    > test.out 2>&1
eval_tap $? 367 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 368 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mzSIbnTx' \
    --userId 'qd8P4ryn' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetUserSubscription' test.out

#- 369 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AmEMix08' \
    --userId '9lAcH4Ua' \
    > test.out 2>&1
eval_tap $? 369 'PublicChangeSubscriptionBillingAccount' test.out

#- 370 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HjDnnCUy' \
    --userId 'ykadTn1l' \
    --body '{"immediate": false, "reason": "OPEKT6Uw"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCancelSubscription' test.out

#- 371 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JuJt2jyZ' \
    --userId 'bMcan1Ur' \
    --excludeFree  \
    --limit '60' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserSubscriptionBillingHistories' test.out

#- 372 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'WoUowpvR' \
    --language 'WdiXgGIz' \
    --storeId 'VOoJBiUn' \
    > test.out 2>&1
eval_tap $? 372 'PublicListViews' test.out

#- 373 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'WhmuC8yU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ftygREoz' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetWallet' test.out

#- 374 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'mlUlmkg2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IT5ze1Qp' \
    --limit '61' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 374 'PublicListUserWalletTransactions' test.out

#- 375 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'wnSasYy2' \
    --baseAppId 'Rgv1tbtF' \
    --categoryPath 'FuvJ1SNX' \
    --features 'GEXB8T3x' \
    --includeSubCategoryItem  \
    --itemName 'qopnK0Sr' \
    --itemStatus 'INACTIVE' \
    --itemType 'BUNDLE' \
    --limit '72' \
    --offset '83' \
    --region 'cqxzyQt9' \
    --sortBy 'createdAt:desc,displayOrder' \
    --storeId '0Aa3dYiN' \
    --tags 'VcDvIYx6' \
    --targetNamespace 'X2Dr4izR' \
    > test.out 2>&1
eval_tap $? 375 'QueryItems1' test.out

#- 376 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LFcxWAUG' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 376 'ImportStore1' test.out

#- 377 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WH8soEhK' \
    --body '{"itemIds": ["kynaFS4b", "pXb5nSHv", "3HAHKISR"]}' \
    > test.out 2>&1
eval_tap $? 377 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE