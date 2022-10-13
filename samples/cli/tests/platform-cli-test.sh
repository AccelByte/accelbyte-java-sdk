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
echo "1..360"

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
    --body '{"context": {"item": {"appId": "VE10p7eP", "appType": "DLC", "baseAppId": "3XLjcXR2", "boothName": "bBqh3Bf8", "boundItemIds": ["lsZoOPxr", "A80aT7mC", "ZrKqWNCj"], "categoryPath": "UW88214x", "clazz": "MO6r9g95", "createdAt": "1999-11-09T00:00:00Z", "description": "q1zYAUye", "displayOrder": 66, "entitlementType": "CONSUMABLE", "ext": {"N02x81az": {}, "y9SZiwBi": {}, "QM8Q8rtf": {}}, "features": ["oHoKHAGc", "mYJvcwEC", "jIKznC3K"], "fresh": false, "images": [{"as": "FfkEekAS", "caption": "5yumwmQI", "height": 98, "imageUrl": "eJHThX9B", "smallImageUrl": "WMojBm86", "width": 79}, {"as": "sTH6Axsz", "caption": "oGz3alSP", "height": 23, "imageUrl": "bT0dHErT", "smallImageUrl": "nCTSWNyw", "width": 63}, {"as": "I0kdkF81", "caption": "a3XV3ct8", "height": 62, "imageUrl": "VmzXjDPf", "smallImageUrl": "YwijhKlc", "width": 48}], "itemId": "PvT8rJgQ", "itemIds": ["KFRlGMSp", "zjndDDr3", "KlQ7qFqM"], "itemQty": {"k4VJliX0": 72, "CTiO0Zyu": 91, "5GJuRneY": 22}, "itemType": "EXTENSION", "language": "XmoeXiWq", "listable": false, "localExt": {"ZSLEIY4l": {}, "959uLB6T": {}, "1gBV0ndu": {}}, "longDescription": "Hrqtb5yi", "maxCount": 55, "maxCountPerUser": 54, "name": "6etXla7M", "namespace": "9kucSQKV", "optionBoxConfig": {"boxItems": [{"count": 100, "itemId": "hmx7rznA", "itemSku": "zK143zx8"}, {"count": 69, "itemId": "y4RZqT3Q", "itemSku": "a9C9cfxh"}, {"count": 26, "itemId": "iNwqV4YO", "itemSku": "bsXYRSfi"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 31, "comparison": "isLessThan", "name": "DweSb2AT", "predicateType": "SeasonTierPredicate", "value": "CtjXtKjE", "values": ["d8QtufJj", "l3Ml4dXm", "0hLIE3Ci"]}, {"anyOf": 44, "comparison": "isLessThan", "name": "oFvRu7ug", "predicateType": "SeasonPassPredicate", "value": "Zo8XbvoJ", "values": ["C7Y3N7Ar", "I7BoFBnS", "uxEGwRO9"]}, {"anyOf": 47, "comparison": "isNot", "name": "M444g3lP", "predicateType": "SeasonTierPredicate", "value": "NqYCFJpy", "values": ["jBPyi7Wu", "g51vpEmj", "YzLNBvO3"]}]}, {"operator": "and", "predicates": [{"anyOf": 91, "comparison": "isLessThan", "name": "8oEEE3hO", "predicateType": "EntitlementPredicate", "value": "qSYKqWsh", "values": ["HeIIecwD", "XUoZT1IV", "dxAXDFBc"]}, {"anyOf": 17, "comparison": "isGreaterThan", "name": "iZ3CPm1b", "predicateType": "EntitlementPredicate", "value": "m0y9T3ll", "values": ["1plnWgSi", "IcVD8Nk9", "d8dMfd36"]}, {"anyOf": 82, "comparison": "isGreaterThanOrEqual", "name": "96X5ZULa", "predicateType": "SeasonPassPredicate", "value": "7N0OIX7q", "values": ["cualekFM", "IyF9URri", "VbLQdE2h"]}]}, {"operator": "or", "predicates": [{"anyOf": 19, "comparison": "isLessThan", "name": "IyWDL1Qy", "predicateType": "SeasonTierPredicate", "value": "vbH8haUk", "values": ["5iACGAdI", "kHun9gco", "WMeaKOoQ"]}, {"anyOf": 61, "comparison": "isGreaterThan", "name": "8wPlc9wC", "predicateType": "EntitlementPredicate", "value": "gCxAVEGY", "values": ["Q4mQxVBp", "6J1QhV5g", "QtR5G89q"]}, {"anyOf": 26, "comparison": "isGreaterThan", "name": "u8wR8FSt", "predicateType": "SeasonPassPredicate", "value": "ymdhFITv", "values": ["dOS1lLWu", "PQEGU11S", "dyxinz1q"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 12, "fixedTrialCycles": 67, "graceDays": 67}, "region": "wAaXFQqH", "regionData": [{"currencyCode": "RXG4xBvi", "currencyNamespace": "SGQBzs06", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1976-06-08T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1975-04-23T00:00:00Z", "discountedPrice": 69, "expireAt": "1976-05-27T00:00:00Z", "price": 55, "purchaseAt": "1985-11-28T00:00:00Z", "trialPrice": 87}, {"currencyCode": "eZcJtw6r", "currencyNamespace": "tXwzfURz", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1989-08-20T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1984-11-03T00:00:00Z", "discountedPrice": 8, "expireAt": "1982-05-09T00:00:00Z", "price": 55, "purchaseAt": "1987-09-09T00:00:00Z", "trialPrice": 58}, {"currencyCode": "dsw2l1AT", "currencyNamespace": "x7BiLU7j", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1990-12-30T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1987-06-30T00:00:00Z", "discountedPrice": 100, "expireAt": "1988-11-19T00:00:00Z", "price": 15, "purchaseAt": "1984-05-25T00:00:00Z", "trialPrice": 3}], "seasonType": "TIER", "sku": "nnBJpGWa", "stackable": false, "status": "INACTIVE", "tags": ["KXBFKhoM", "u4TPBnXC", "4V5WhOck"], "targetCurrencyCode": "thDxMuEs", "targetItemId": "hO5foVOF", "targetNamespace": "gTp1X9Jz", "thumbnailUrl": "XLW6uwRg", "title": "vTK8jINq", "updatedAt": "1982-05-11T00:00:00Z", "useCount": 65}, "namespace": "uUeJP4F1", "order": {"currency": {"currencyCode": "waJMuBca", "currencySymbol": "60q0g3Pg", "currencyType": "REAL", "decimals": 14, "namespace": "K345LBXf"}, "ext": {"hLzDMgVs": {}, "b7MMXVdT": {}, "U0fhVOac": {}}, "free": true}, "source": "OTHER"}, "script": "BmJzIzJZ", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'Uaswk7Le' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '17k8Et2U' \
    --body '{"grantDays": "SAK1se51"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '31KUjMK7' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'pngZoi6g' \
    --body '{"grantDays": "i1C8oWoS"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "IzzDBCZg", "dryRun": true, "fulfillmentUrl": "dvOwm7Kz", "itemType": "BUNDLE", "purchaseConditionUrl": "zmopBL9h"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'IS75E7WE' \
    --itemType 'SUBSCRIPTION' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'vatANXif' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'hoJbTXiG' \
    --body '{"clazz": "iNFJoxaE", "dryRun": true, "fulfillmentUrl": "RWeireFt", "purchaseConditionUrl": "oZ9LAjxb"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '2ekV1Fn5' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --name 'wmusZIfM' \
    --offset '75' \
    --tag '9SWmp1dr' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "WQqYU3bp", "items": [{"extraSubscriptionDays": 3, "itemId": "mFXpHbkG", "itemName": "mHXrSONr", "quantity": 10}, {"extraSubscriptionDays": 83, "itemId": "4VegA8l0", "itemName": "jZBNSaxr", "quantity": 12}, {"extraSubscriptionDays": 47, "itemId": "NsC6L13G", "itemName": "z5OHBNH8", "quantity": 27}], "maxRedeemCountPerCampaignPerUser": 43, "maxRedeemCountPerCode": 38, "maxRedeemCountPerCodePerUser": 71, "maxSaleCount": 37, "name": "AgqRMz0Z", "redeemEnd": "1998-01-30T00:00:00Z", "redeemStart": "1974-02-22T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["LUQ7f0QC", "CXHP2Neo", "IMeB1Z0E"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'ANeHVZLP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'buhameqG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lSnwsVTn", "items": [{"extraSubscriptionDays": 75, "itemId": "zQ2yrA4A", "itemName": "6DdJJF1b", "quantity": 94}, {"extraSubscriptionDays": 97, "itemId": "rn5hJvwW", "itemName": "w0vYXNFN", "quantity": 71}, {"extraSubscriptionDays": 54, "itemId": "Jyg19M5B", "itemName": "tB7yi7x6", "quantity": 1}], "maxRedeemCountPerCampaignPerUser": 90, "maxRedeemCountPerCode": 14, "maxRedeemCountPerCodePerUser": 34, "maxSaleCount": 55, "name": "eMDro8nH", "redeemEnd": "1995-10-07T00:00:00Z", "redeemStart": "1992-05-24T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["hNesuHgg", "CYTid6EF", "ZxPH8FqG"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '9R3TZavY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FFiEYaka' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JgAgEmug' \
    --body '{"categoryPath": "UtsWvNhm", "localizationDisplayNames": {"eHPUBzvk": "Tfe9h2gn", "4ZjKsYat": "9nHGP5aG", "7lDpZWDE": "fZTcVUtN"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hXlHGIST' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'BHhAkySf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tzFblWXN' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'nQeqqMkS' \
    --namespace "$AB_NAMESPACE" \
    --storeId '95rzYCgv' \
    --body '{"localizationDisplayNames": {"v7PU1JjI": "f71veQWr", "108q4n7x": "Oq4zzKYU", "Vh4qtENt": "BYpRA9Dr"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '2rMMrdM9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bRXrx3q6' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'gY44r0Uj' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VcMyNT58' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'PMF3SB2N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'M1vcxLXS' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'DhcxVqz3' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '32' \
    --code 'yFaTgWli' \
    --limit '56' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'fKiSwjGJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 13}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'O3QWQ6KF' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '7' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'FjjErjJn' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '77' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'OX0YrFsN' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '42' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'pUOcnVhN' \
    --namespace "$AB_NAMESPACE" \
    --code 'jaO0qBXM' \
    --limit '70' \
    --offset '27' \
    --userId '7547sC0y' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'XFHIyMos' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code '3005vEv7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '2DgOArJ8' \
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
    --body '{"currencyCode": "GzCPfwIJ", "currencySymbol": "hijztz95", "currencyType": "REAL", "decimals": 11, "localizationDescriptions": {"0W3d6yYH": "P8Bdq0W7", "Z1n15na3": "mXuFLfJV", "NfmzSXNF": "DNufiM7K"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '9XXjb9gG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"1rlcQTw3": "ZT8Ydh0J", "hjuAkDBJ": "yn5wAPr6", "HSqvDAfi": "o99CvaP2"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'AoThNQda' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'YIAj6g7i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'uoVqfeBI' \
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
    --body '{"data": [{"id": "tJXjPoyD", "rewards": [{"currency": {"currencyCode": "Wr7JVVvp", "namespace": "86scoAkF"}, "item": {"itemId": "ZFerJ8eH", "itemSku": "DYWDutOQ", "itemType": "4lIvynlh"}, "quantity": 76, "type": "ITEM"}, {"currency": {"currencyCode": "rDoTsuh6", "namespace": "z1DMnII9"}, "item": {"itemId": "jar9qZJL", "itemSku": "KgSbSxDj", "itemType": "FaYFewMf"}, "quantity": 10, "type": "CURRENCY"}, {"currency": {"currencyCode": "gao31zIQ", "namespace": "FO9n68Qo"}, "item": {"itemId": "zTowLxDB", "itemSku": "sEd4Yut8", "itemType": "Dilz8QdM"}, "quantity": 51, "type": "ITEM"}]}, {"id": "cINMbjef", "rewards": [{"currency": {"currencyCode": "rIewOYES", "namespace": "npV58F1F"}, "item": {"itemId": "IBRp2HrG", "itemSku": "Uux6JBqy", "itemType": "SMlT7jNm"}, "quantity": 74, "type": "CURRENCY"}, {"currency": {"currencyCode": "ms0ayoeB", "namespace": "dIMa8pNr"}, "item": {"itemId": "9yWXtKto", "itemSku": "mUkwbG0L", "itemType": "CscVN4tG"}, "quantity": 18, "type": "ITEM"}, {"currency": {"currencyCode": "kLNRzQW8", "namespace": "naPqdITJ"}, "item": {"itemId": "PDYF2jBN", "itemSku": "1l5Irf4y", "itemType": "23NElL0Q"}, "quantity": 89, "type": "ITEM"}]}, {"id": "x3DxNokv", "rewards": [{"currency": {"currencyCode": "cIUMXwUE", "namespace": "lGHQgt97"}, "item": {"itemId": "ja5aVVcb", "itemSku": "0QUFrphr", "itemType": "bZuQZVZT"}, "quantity": 26, "type": "CURRENCY"}, {"currency": {"currencyCode": "WLz0f719", "namespace": "yZMyNmcn"}, "item": {"itemId": "gV0BWC2P", "itemSku": "ogDNuvqG", "itemType": "KNAdnIrX"}, "quantity": 61, "type": "ITEM"}, {"currency": {"currencyCode": "pFjn8d0j", "namespace": "ALUJEXsr"}, "item": {"itemId": "uEciayIb", "itemSku": "f9o2OeP8", "itemType": "jAIlfe17"}, "quantity": 17, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"rA6kNhqk": "v0wBvsma", "ICVxTBXP": "6qMxwPom", "axFtIIvw": "WWfSlDt6"}}, {"platform": "XBOX", "platformDlcIdMap": {"ex6KZRSv": "x27oK8BI", "0mb4KTJv": "PlcTP1OM", "Wx8NWQVq": "CBMJP0a5"}}, {"platform": "PSN", "platformDlcIdMap": {"g9XHvqBw": "8I1Vdvgf", "yumSlHnJ": "TkpjhJL6", "42K7i0fh": "1u6WIKuy"}}]}' \
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
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'oko7SCPQ' \
    --itemId 'qCj3ai8z,ExabfcTg,g3EvEgLS' \
    --limit '41' \
    --offset '9' \
    --userId 'A12iUvnV' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'KKAJXrxx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '97' \
    --status 'SUCCESS' \
    --userId 'CN4dFhxY' \
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
    --body '{"bundleId": "W3st9ujg", "password": "rfmuwZFb"}' \
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
    --body '{"sandboxId": "LfVdcCfu"}' \
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
    --body '{"applicationName": "rjlRKOkJ", "serviceAccountId": "78TL1Gki"}' \
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
    --body '{"data": [{"itemIdentity": "mD5gBeEb", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"hcLg9ze7": "maVtnFna", "rUWRG9zM": "GXji2Hyq", "Nn6vq6Se": "xSEbd2WQ"}}, {"itemIdentity": "wsGdbiLq", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"M62YW6yc": "Di9wl2t9", "Ek1lTE6P": "lbxKAuk7", "KHxDAFod": "VW2T3jVw"}}, {"itemIdentity": "z03vpqOp", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"T1r5Cakr": "KZw344T8", "uhZrrhF0": "DIQFmuFf", "qDZ0r7hv": "fzObs2J3"}}]}' \
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
    --body '{"environment": "WuXqyUop"}' \
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
    --body '{"appId": "2fvKgK0N", "publisherAuthenticationKey": "iEciSxcT"}' \
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
    --body '{"clientId": "BL3QDVVD", "clientSecret": "NVuLAc0u", "organizationId": "WfbRIFdv"}' \
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
    --body '{"relyingPartyCert": "wRE4Mrgu"}' \
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
    --password 'C6TKUoWS' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'PKwWd3hW' \
    --itemId 'ZzNLPk0Z' \
    --itemType 'SEASON' \
    --endTime 'lwavWB1q' \
    --startTime 'tTuFcrDR' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'xUc63SUl' \
    --itemId '6J8Jh9jq' \
    --itemType 'APP' \
    --endTime 'ndsWZZXV' \
    --startTime 'NneNTxNW' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Xj3iMwNF' \
    --body '{"categoryPath": "tol1pHCm", "targetItemId": "vDRQyma2", "targetNamespace": "K5GvtAlG"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZJLTkKsd' \
    --body '{"appId": "rTbPmRie", "appType": "DLC", "baseAppId": "bJ28GKtA", "boothName": "VMkqrmZs", "categoryPath": "866X3Q8K", "clazz": "HCrS3rC8", "displayOrder": 16, "entitlementType": "DURABLE", "ext": {"mBJ2Ga9a": {}, "hmPGWCws": {}, "4qkb0XVx": {}}, "features": ["KwCfihdP", "C12MyNLE", "1WU0XDq4"], "images": [{"as": "Qw8QbbQb", "caption": "BxygwvTc", "height": 72, "imageUrl": "iHxpEjx7", "smallImageUrl": "21ITtFRM", "width": 35}, {"as": "LLHpci1V", "caption": "h641yTl8", "height": 42, "imageUrl": "mJMDgvah", "smallImageUrl": "lSxZsq64", "width": 20}, {"as": "tfgFGz3m", "caption": "cu8hHEm2", "height": 62, "imageUrl": "Lu86v5ZC", "smallImageUrl": "x30c2xBl", "width": 73}], "itemIds": ["kvD3yQ8e", "ALerFcRt", "rnymqYE8"], "itemQty": {"SF6M1uTq": 85, "WxHSpidw": 63, "UF0SgiD1": 93}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"0UlcEf7g": {"description": "QM0RDRbR", "localExt": {"si8NI0Rn": {}, "opaNuVBk": {}, "Pn9ThVZv": {}}, "longDescription": "MKvmpFte", "title": "YP6Xkf0M"}, "eu18X43m": {"description": "3TePwUlO", "localExt": {"SJf5fVhR": {}, "PI91C5Fp": {}, "qG9eLQ2D": {}}, "longDescription": "5ZSaFEWm", "title": "Ljin9g65"}, "N1V66x3a": {"description": "Bp8La1dD", "localExt": {"3OTFWj6T": {}, "kXl9RorY": {}, "2ZqrxRaD": {}}, "longDescription": "lEXkdtQu", "title": "dUTAwwxg"}}, "maxCount": 25, "maxCountPerUser": 43, "name": "3okt9oB4", "optionBoxConfig": {"boxItems": [{"count": 34, "itemId": "dnOHp4V3", "itemSku": "uRCRi1Rl"}, {"count": 9, "itemId": "FJcagLBC", "itemSku": "CN0MC2D0"}, {"count": 52, "itemId": "43zydJ8s", "itemSku": "suJsxXvD"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 93, "fixedTrialCycles": 59, "graceDays": 12}, "regionData": {"02aCIf2B": [{"currencyCode": "WMMsIAZX", "currencyNamespace": "7LnxrWBy", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1991-03-19T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1987-11-23T00:00:00Z", "discountedPrice": 94, "expireAt": "1995-10-06T00:00:00Z", "price": 57, "purchaseAt": "1990-02-02T00:00:00Z", "trialPrice": 43}, {"currencyCode": "h6vOuGu4", "currencyNamespace": "C5qAP27I", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1988-03-26T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1976-08-09T00:00:00Z", "discountedPrice": 41, "expireAt": "1972-12-06T00:00:00Z", "price": 30, "purchaseAt": "1994-05-09T00:00:00Z", "trialPrice": 43}, {"currencyCode": "OVvv3t0Z", "currencyNamespace": "Sh77lvM8", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1996-07-17T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1975-09-16T00:00:00Z", "discountedPrice": 94, "expireAt": "1981-11-27T00:00:00Z", "price": 7, "purchaseAt": "1975-11-29T00:00:00Z", "trialPrice": 44}], "d4PgM8WI": [{"currencyCode": "sYwLUJmk", "currencyNamespace": "jPJpRFqW", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1995-06-09T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1978-08-02T00:00:00Z", "discountedPrice": 25, "expireAt": "1975-02-27T00:00:00Z", "price": 83, "purchaseAt": "1979-05-23T00:00:00Z", "trialPrice": 69}, {"currencyCode": "FwdLqe31", "currencyNamespace": "1ovVDJLj", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1993-05-17T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1974-04-06T00:00:00Z", "discountedPrice": 55, "expireAt": "1978-04-14T00:00:00Z", "price": 18, "purchaseAt": "1975-09-30T00:00:00Z", "trialPrice": 7}, {"currencyCode": "Z8rrQKzb", "currencyNamespace": "KDYZ7HL7", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1976-07-27T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1975-05-19T00:00:00Z", "discountedPrice": 82, "expireAt": "1986-03-20T00:00:00Z", "price": 56, "purchaseAt": "1998-02-19T00:00:00Z", "trialPrice": 80}], "3d5oy4k1": [{"currencyCode": "Nr2XZmq0", "currencyNamespace": "GLTtZQXg", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1994-09-07T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1995-06-22T00:00:00Z", "discountedPrice": 23, "expireAt": "1986-12-25T00:00:00Z", "price": 51, "purchaseAt": "1974-06-14T00:00:00Z", "trialPrice": 92}, {"currencyCode": "qNUZMzJf", "currencyNamespace": "TL3brPY5", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1990-03-22T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1972-12-20T00:00:00Z", "discountedPrice": 78, "expireAt": "1979-02-06T00:00:00Z", "price": 82, "purchaseAt": "1976-08-13T00:00:00Z", "trialPrice": 68}, {"currencyCode": "N89HxC3R", "currencyNamespace": "eRicGPzA", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1972-07-17T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1994-01-07T00:00:00Z", "discountedPrice": 13, "expireAt": "1980-03-26T00:00:00Z", "price": 13, "purchaseAt": "1998-08-23T00:00:00Z", "trialPrice": 89}]}, "seasonType": "PASS", "sku": "iPYOu8YD", "stackable": false, "status": "INACTIVE", "tags": ["TOXuOQJj", "IyX6ukzR", "NqdrWYbY"], "targetCurrencyCode": "P7TnsptA", "targetNamespace": "uccnErPa", "thumbnailUrl": "MzFIfuwU", "useCount": 25}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'wC1td6SQ' \
    --appId 'F7Iuoxlu' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'Xf514mPc' \
    --baseAppId 'sqN4u47h' \
    --categoryPath 'YJX9UMgs' \
    --features 'wFlZta5O' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --limit '47' \
    --offset '83' \
    --region 'bhYdoeSs' \
    --sortBy 'createdAt:asc,displayOrder:desc' \
    --storeId 'inGSw0nC' \
    --tags 'YMdS0gIZ' \
    --targetNamespace 'Elf3n8u5' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'M1r4eNaC,M8IVZr7E,oNvTHw3A' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'k5SZ3vUi' \
    --sku 'n1b7qHjF' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '9yrdc9ZN' \
    --populateBundle  \
    --region 'VtwQVh7x' \
    --storeId 'DBgqFKUa' \
    --sku 'YJFeBdyn' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'MOkR9u84' \
    --sku 'N0pZU7XD' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'xAc4Ah6o,tHC1VUN3,3UugA2Hz' \
    --storeId 'l98eG38H' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '1deBl63z' \
    --region 'SVNgl1hW' \
    --storeId 'xOMYNDJ8' \
    --itemIds 'aS8VVZo7' \
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
    --userId 'frMjx0j5' \
    --body '{"itemIds": ["xRzpeHvn", "HPxW2C6w", "8KC4nVjp"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'BUNDLE' \
    --limit '17' \
    --offset '82' \
    --sortBy 'yD4CGy8v' \
    --storeId 'MrgeFNZD' \
    --keyword 'pHKblYqh' \
    --language 'roQGubCS' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '58' \
    --offset '65' \
    --sortBy 'updatedAt:desc,displayOrder:asc,createdAt' \
    --storeId 'wiNBs4dZ' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'oH0bzNJF' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '4j25VWH5' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'XwxlpAGm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FJbEla1R' \
    --body '{"appId": "J7yd5Pce", "appType": "DLC", "baseAppId": "Zl00ZAtl", "boothName": "uPK52Ycg", "categoryPath": "24GzhOyJ", "clazz": "CCdaWGdN", "displayOrder": 86, "entitlementType": "DURABLE", "ext": {"QXcT7msm": {}, "X412tbO9": {}, "UjU0fVaG": {}}, "features": ["l97QJ0nB", "u6bkpwep", "B1ktTFCv"], "images": [{"as": "p9NiyrWT", "caption": "XVuVxjIg", "height": 92, "imageUrl": "2so9JUkV", "smallImageUrl": "odIK4USq", "width": 91}, {"as": "QlHdfnQ2", "caption": "u3iw3afk", "height": 14, "imageUrl": "rWZRIebH", "smallImageUrl": "w40xjLCv", "width": 2}, {"as": "okGszh2n", "caption": "XXgo2ees", "height": 34, "imageUrl": "q1B9k4ou", "smallImageUrl": "AGSmaV9R", "width": 73}], "itemIds": ["T0kEGWG5", "y2T2aMrq", "PunCAUSU"], "itemQty": {"Rp6U4cwc": 71, "Km3zRjDd": 40, "zaydzmxU": 57}, "itemType": "APP", "listable": false, "localizations": {"3lAOgm4k": {"description": "pFZuT4ui", "localExt": {"JmxRJIvJ": {}, "ngm1gpqy": {}, "wp1uL6Wb": {}}, "longDescription": "KepNlrxt", "title": "fFc7mYRQ"}, "bvSNzAn0": {"description": "0ZHFx2o1", "localExt": {"Kr2RCEJu": {}, "nVyW1Kjy": {}, "qQnjR7y1": {}}, "longDescription": "qIrHaAEp", "title": "x1QjN1w3"}, "zywZkIaP": {"description": "KCzRPnda", "localExt": {"zE8KKcou": {}, "399YDTnb": {}, "W2nOgOm6": {}}, "longDescription": "DynAbTa0", "title": "KEjYGCnk"}}, "maxCount": 67, "maxCountPerUser": 44, "name": "JRlROYeU", "optionBoxConfig": {"boxItems": [{"count": 54, "itemId": "OYRohrUg", "itemSku": "ckLwvlnY"}, {"count": 33, "itemId": "24UYKGQZ", "itemSku": "Ei8tFIlW"}, {"count": 80, "itemId": "HhxavGWA", "itemSku": "N14KLHd2"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 23, "fixedTrialCycles": 14, "graceDays": 23}, "regionData": {"94XUtDGF": [{"currencyCode": "S8XuzPqq", "currencyNamespace": "16gOnb9Z", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1993-10-24T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1976-03-17T00:00:00Z", "discountedPrice": 46, "expireAt": "1990-10-28T00:00:00Z", "price": 61, "purchaseAt": "1997-11-13T00:00:00Z", "trialPrice": 97}, {"currencyCode": "udAwRuen", "currencyNamespace": "26ff8Ah2", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1990-04-19T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1984-06-23T00:00:00Z", "discountedPrice": 91, "expireAt": "1986-05-17T00:00:00Z", "price": 95, "purchaseAt": "1975-07-29T00:00:00Z", "trialPrice": 35}, {"currencyCode": "785e3Z17", "currencyNamespace": "ikhDLvAF", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1982-07-20T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1973-05-28T00:00:00Z", "discountedPrice": 76, "expireAt": "1989-02-28T00:00:00Z", "price": 55, "purchaseAt": "1979-03-22T00:00:00Z", "trialPrice": 5}], "l7S2jACg": [{"currencyCode": "3INjy2pT", "currencyNamespace": "kXgSyQnH", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1971-04-02T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1974-06-02T00:00:00Z", "discountedPrice": 75, "expireAt": "1986-03-13T00:00:00Z", "price": 49, "purchaseAt": "1980-05-05T00:00:00Z", "trialPrice": 88}, {"currencyCode": "hwnZVNEh", "currencyNamespace": "7Waf4yVn", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1984-11-05T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1996-10-05T00:00:00Z", "discountedPrice": 26, "expireAt": "1999-09-03T00:00:00Z", "price": 29, "purchaseAt": "1997-03-27T00:00:00Z", "trialPrice": 17}, {"currencyCode": "kGO9XTYQ", "currencyNamespace": "X7VX4MvA", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1985-06-16T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1987-11-22T00:00:00Z", "discountedPrice": 16, "expireAt": "1994-09-24T00:00:00Z", "price": 69, "purchaseAt": "1997-06-27T00:00:00Z", "trialPrice": 50}], "2TEA0Dpy": [{"currencyCode": "AFP8VwWQ", "currencyNamespace": "gGPbCtyu", "currencyType": "REAL", "discountAmount": 85, "discountExpireAt": "1989-08-23T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1982-11-13T00:00:00Z", "discountedPrice": 63, "expireAt": "1977-04-15T00:00:00Z", "price": 27, "purchaseAt": "1994-06-22T00:00:00Z", "trialPrice": 43}, {"currencyCode": "ObJYdTmM", "currencyNamespace": "ISMM4SiF", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1993-09-26T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1974-01-23T00:00:00Z", "discountedPrice": 48, "expireAt": "1999-03-19T00:00:00Z", "price": 55, "purchaseAt": "1971-08-17T00:00:00Z", "trialPrice": 34}, {"currencyCode": "VbygbQtw", "currencyNamespace": "H2ptOW6P", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1996-01-03T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1997-11-07T00:00:00Z", "discountedPrice": 46, "expireAt": "1977-03-01T00:00:00Z", "price": 31, "purchaseAt": "1996-05-03T00:00:00Z", "trialPrice": 6}]}, "seasonType": "TIER", "sku": "ek876Pyc", "stackable": true, "status": "ACTIVE", "tags": ["6Slh4AaX", "zsPxDz8n", "Yx2lt2YR"], "targetCurrencyCode": "5nEmMsPW", "targetNamespace": "xiUyl7Z0", "thumbnailUrl": "SZVg8eNu", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'DxpP9bRb' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'nKqyPC8t' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'MwSjKQP1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 12, "orderNo": "vDyIdUHP"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'uNYtF1UW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'CJroLRd8' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'vDLE4dbA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xFosuoIN' \
    --body '{"carousel": [{"alt": "TVxXOgHj", "previewUrl": "fT8TQXb9", "thumbnailUrl": "kYxNpf5D", "type": "video", "url": "r8q7fIIt", "videoSource": "youtube"}, {"alt": "DLDB8grc", "previewUrl": "PNt0CjUv", "thumbnailUrl": "Hhgm8WSI", "type": "image", "url": "r7uuR58O", "videoSource": "vimeo"}, {"alt": "r4dYuz1L", "previewUrl": "FjQQV4d1", "thumbnailUrl": "8LJytj91", "type": "video", "url": "Fvqsajgg", "videoSource": "youtube"}], "developer": "FGn6dsNz", "forumUrl": "9qlMRm9L", "genres": ["Action", "Indie", "RPG"], "localizations": {"QyZvLh0B": {"announcement": "tzMwJ0G6", "slogan": "AIaiVUtd"}, "c9KIKk1f": {"announcement": "ZuUuvkOV", "slogan": "IoOMexCZ"}, "UK3YSidU": {"announcement": "NltzM6oM", "slogan": "IAuqrvyW"}}, "platformRequirements": {"X89cynfW": [{"additionals": "QMV853A5", "directXVersion": "LZ83G0z0", "diskSpace": "7lmIigJS", "graphics": "arLHAHus", "label": "aN7yrYoQ", "osVersion": "u6O35HIp", "processor": "RSsV16tX", "ram": "oMPHYqFq", "soundCard": "lY29tSVq"}, {"additionals": "4BnkbhMU", "directXVersion": "YnfI29nn", "diskSpace": "adDgJGzo", "graphics": "I7EE8ajx", "label": "nI8nEesX", "osVersion": "XVJ835G0", "processor": "3FBpmnge", "ram": "w5oEUfit", "soundCard": "nQ3oWXPL"}, {"additionals": "xrj9Q7qZ", "directXVersion": "u2qVBm8w", "diskSpace": "vWzNwgRX", "graphics": "N45c3Alt", "label": "guFygG1a", "osVersion": "z2Vc0xZR", "processor": "0269afPj", "ram": "F5Sk1264", "soundCard": "SSWUZlhj"}], "6kFM6YSD": [{"additionals": "y4RzUiWF", "directXVersion": "ppFZuaH1", "diskSpace": "vTW0xyqb", "graphics": "lLTgYOkT", "label": "EEydcYAd", "osVersion": "gbNq1RKd", "processor": "9N7qvYut", "ram": "BV4lg0py", "soundCard": "MpdnIip9"}, {"additionals": "eTmgRl9d", "directXVersion": "whyR9Kjo", "diskSpace": "eHbf2RPk", "graphics": "vNDwdO4d", "label": "F6cUPtqU", "osVersion": "pejWT0Qq", "processor": "buUtXLKq", "ram": "THQ4A2fc", "soundCard": "ZBY8xdV1"}, {"additionals": "7YXByrA0", "directXVersion": "clock3Jd", "diskSpace": "BErQTXBj", "graphics": "u2TxtyrT", "label": "vZVPqtp3", "osVersion": "WbPheU6H", "processor": "imNxShxu", "ram": "0kjc4CCo", "soundCard": "DfuyudQO"}], "8G8jpkEB": [{"additionals": "F0xb7FUj", "directXVersion": "YPj7B2RT", "diskSpace": "GGbN01SY", "graphics": "yiKaUuy0", "label": "ddWJCqie", "osVersion": "PnJp78rJ", "processor": "Z2EKZgD3", "ram": "naQfjcNI", "soundCard": "7JHQHcg5"}, {"additionals": "TlbWlcY6", "directXVersion": "aO0ok5F3", "diskSpace": "5if0ndkQ", "graphics": "oVqVjpzg", "label": "l0gRIpNB", "osVersion": "z2Qk6H1f", "processor": "9IyLiddJ", "ram": "txP303X2", "soundCard": "NWVM4Dcf"}, {"additionals": "2WAmHWcG", "directXVersion": "rmpfPJ9f", "diskSpace": "BS99UYCD", "graphics": "j0FjGzAy", "label": "8tedEBi1", "osVersion": "HNPtBmvi", "processor": "R4kpJ8Yf", "ram": "R42FsPWV", "soundCard": "BYBoo1M6"}]}, "platforms": ["Windows", "Linux", "IOS"], "players": ["MMO", "Coop", "Coop"], "primaryGenre": "Sports", "publisher": "F5t4RRzc", "releaseDate": "1974-09-01T00:00:00Z", "websiteUrl": "zwOYy4Ti"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'c1Wv2B0K' \
    --namespace "$AB_NAMESPACE" \
    --storeId '65YvXmJF' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '0W9Ci8vy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'hTgOHFCZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FKuVgSzG' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'KqHKNx3K' \
    --itemId 'VSCHWEry' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qdfRX6Jn' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'ss9SfnGf' \
    --itemId 'O1Wjb2fy' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ANFN55zJ' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'Z18tKc1i' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '1Bejc90j' \
    --populateBundle  \
    --region 'LGL16o8x' \
    --storeId 'lxqtsPSE' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'd55khH3J' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JFLHPFUJ' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 64, "comparison": "isGreaterThan", "name": "fJI8F8s5", "predicateType": "SeasonPassPredicate", "value": "56PGow6n", "values": ["mKiNvn0o", "Cc21CrJi", "1PcoeJ02"]}, {"anyOf": 98, "comparison": "excludes", "name": "LCa83cd2", "predicateType": "SeasonTierPredicate", "value": "9mgYwnif", "values": ["Ky47XRlr", "RkrTxNu5", "jrgPUN0Q"]}, {"anyOf": 53, "comparison": "excludes", "name": "CBa8h9yd", "predicateType": "EntitlementPredicate", "value": "guKO1wgD", "values": ["8MrQNUvM", "cWVSmvhQ", "mQXUDnJw"]}]}, {"operator": "or", "predicates": [{"anyOf": 32, "comparison": "isGreaterThan", "name": "SDc1tumm", "predicateType": "SeasonTierPredicate", "value": "7PLNead0", "values": ["DGj0lhWK", "FqMXe0QE", "f98eqJGI"]}, {"anyOf": 65, "comparison": "excludes", "name": "vXdvxig5", "predicateType": "SeasonPassPredicate", "value": "nfnHGeYl", "values": ["ZXqqFlKl", "QuT4jzs3", "2xjrfuca"]}, {"anyOf": 60, "comparison": "isLessThanOrEqual", "name": "LLoC8XAa", "predicateType": "SeasonTierPredicate", "value": "fnYxeBJK", "values": ["78Prj45l", "rTpyU9s6", "YLZWe1mU"]}]}, {"operator": "and", "predicates": [{"anyOf": 48, "comparison": "isGreaterThanOrEqual", "name": "L9PkQdzY", "predicateType": "SeasonPassPredicate", "value": "S9M6tVYn", "values": ["3JowZywI", "rVjjnP7L", "uYABPFYU"]}, {"anyOf": 69, "comparison": "isLessThan", "name": "Urc6U23v", "predicateType": "SeasonTierPredicate", "value": "pBXOrryz", "values": ["5SFEOST6", "FOflFPAT", "97NrpeSu"]}, {"anyOf": 5, "comparison": "isLessThanOrEqual", "name": "neMovscw", "predicateType": "EntitlementPredicate", "value": "XWSKShFH", "values": ["BGcm9ce6", "kREe2pDt", "SQir20tm"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'OS5R8Vru' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "26tuoWv1"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --name '25x9m7bp' \
    --offset '40' \
    --tag 'nr9rHkVy' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "dJVVV2aE", "name": "fHmE73U2", "status": "ACTIVE", "tags": ["QdsukSg4", "egMSRikW", "g74bPLtT"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupByBoothName \
    --namespace "$AB_NAMESPACE" \
    --boothName 'P4KF1Qgd' \
    > test.out 2>&1
eval_tap $? 112 'GetKeyGroupByBoothName' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'X1SjvEBr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'ewFTw8Rn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "yXu4M39f", "name": "q7nZtKKZ", "status": "ACTIVE", "tags": ["O5Ww4r9r", "T9RELfqQ", "rh6fNS5g"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'v6S309o5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'Fb53VrUN' \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '7' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'PrQaDtIy' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'MhUjQCTd' \
    --limit '10' \
    --offset '19' \
    --orderNos 'KzB0Weds,4VYJD2Sb,N4kz3cY3' \
    --sortBy 'DhBAapha' \
    --startTime 'eY6jG8fI' \
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
    --orderNo 'FbdjGava' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mtfhdpbn' \
    --body '{"description": "n8qvoCDx"}' \
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
    --body '{"dryRun": false, "notifyUrl": "n8Vi6Hvd", "privateKey": "4q5qG6Xe"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'EBgvIXcE' \
    --externalId 'zVJmoQxj' \
    --limit '27' \
    --notificationSource 'STRIPE' \
    --notificationType 'Tin9BOiE' \
    --offset '88' \
    --paymentOrderNo '6iMFUG4y' \
    --startDate 'qbU9XfJx' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'F80ExgBm' \
    --limit '54' \
    --offset '10' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "axDGsCXd", "currencyNamespace": "MKRLo30k", "customParameters": {"uwhpt131": {}, "xVUDvJPY": {}, "oq0TYfDB": {}}, "description": "ujZdVo9Q", "extOrderNo": "MEDnYRNo", "extUserId": "FZ07EPLP", "itemType": "EXTENSION", "language": "hd_ZSUR", "metadata": {"1oqop5Oh": "XfWMOgh5", "xJbxLSzr": "tLkBaMwz", "L8OoNAHD": "bltvSald"}, "notifyUrl": "4CCxZffB", "omitNotification": false, "platform": "kNBNjpNI", "price": 15, "recurringPaymentOrderNo": "BvAvqElA", "region": "hV8woAKw", "returnUrl": "CicPkUpi", "sandbox": true, "sku": "MoAk29SC", "subscriptionId": "XmEaVMe1", "targetNamespace": "e5s42plM", "targetUserId": "TMBDiVU7", "title": "tJIBqXOM"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'cXxjV8rG' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'R9QHH6Rk' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jWxkW7gy' \
    --body '{"extTxId": "EwHaSu3f", "paymentMethod": "SivWBOXI", "paymentProvider": "STRIPE"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vws7XRia' \
    --body '{"description": "y2gMWTtX"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QtPuAOoX' \
    --body '{"amount": 26, "currencyCode": "B6MPmm8V", "notifyType": "CHARGE", "paymentProvider": "WXPAY", "salesTax": 38, "vat": 80}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ER59721T' \
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
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["IOS", "IOS", "GooglePlay"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ikNAKVt3", "eventTopic": "qRecZNuK", "maxAwarded": 62, "maxAwardedPerUser": 49, "namespaceExpression": "xcVK8L1w", "rewardCode": "bizKDaOr", "rewardConditions": [{"condition": "xF1p3lNA", "conditionName": "OH1hQOqG", "eventName": "eekOStSA", "rewardItems": [{"duration": 68, "itemId": "C1fSpYOK", "quantity": 60}, {"duration": 62, "itemId": "dvAYvF9h", "quantity": 12}, {"duration": 84, "itemId": "sUqGKzkt", "quantity": 66}]}, {"condition": "9onhjDsR", "conditionName": "yZSWXpfg", "eventName": "yw1qAEsp", "rewardItems": [{"duration": 34, "itemId": "v2RGHXLK", "quantity": 76}, {"duration": 42, "itemId": "uINqNtbg", "quantity": 44}, {"duration": 50, "itemId": "PhurxSZH", "quantity": 39}]}, {"condition": "2thC7rUa", "conditionName": "KurMNT8Q", "eventName": "v8Uls5DQ", "rewardItems": [{"duration": 43, "itemId": "184cszLg", "quantity": 82}, {"duration": 76, "itemId": "39nhuh1R", "quantity": 48}, {"duration": 71, "itemId": "9L2ltvy8", "quantity": 7}]}], "userIdExpression": "yg0WVYXJ"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'dri08UNv' \
    --limit '52' \
    --offset '77' \
    --sortBy 'namespace,namespace:desc,namespace:asc' \
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
    --rewardId 'XanZGy44' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'DjW4Dcc5' \
    --body '{"description": "NYzHC0as", "eventTopic": "bWGo9edg", "maxAwarded": 15, "maxAwardedPerUser": 70, "namespaceExpression": "VZam2gK4", "rewardCode": "835gzaNM", "rewardConditions": [{"condition": "zvu0hbRf", "conditionName": "n0eyYWVR", "eventName": "7yZaAv5y", "rewardItems": [{"duration": 5, "itemId": "LobgLZlj", "quantity": 60}, {"duration": 72, "itemId": "03J28NZK", "quantity": 2}, {"duration": 75, "itemId": "oSfvmSNA", "quantity": 19}]}, {"condition": "PTrPNxXD", "conditionName": "Ba4H5Dse", "eventName": "ophKR3sf", "rewardItems": [{"duration": 44, "itemId": "Zyn22V5I", "quantity": 29}, {"duration": 85, "itemId": "Bxsac1gl", "quantity": 13}, {"duration": 75, "itemId": "vr9tuaqC", "quantity": 99}]}, {"condition": "RWs1z1WK", "conditionName": "3QLCBDpU", "eventName": "fMMqYyEJ", "rewardItems": [{"duration": 18, "itemId": "NqnxhHEd", "quantity": 55}, {"duration": 62, "itemId": "IkCRWDnC", "quantity": 41}, {"duration": 17, "itemId": "QyTOcH0O", "quantity": 24}]}], "userIdExpression": "2aDqzKvC"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '68D2OUxV' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'hSvKXy0g' \
    --body '{"payload": {"20RCKKj2": {}, "JAcBduaL": {}, "faddhph6": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'h3afToTz' \
    --body '{"conditionName": "4itNSVFU", "userId": "mGe8BMxV"}' \
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
    --body '{"defaultLanguage": "pRQXOPpi", "defaultRegion": "sHoqOa7W", "description": "xg47EGFh", "supportedLanguages": ["2VKufEfc", "bArKn9Gi", "5rhyl7f9"], "supportedRegions": ["mfDzYjQ7", "8xZsA5N1", "wln5ODEY"], "title": "4tJarIFT"}' \
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
    --storeId '9enHZ2gU' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iFJ2V9qh' \
    --body '{"defaultLanguage": "aUWnYkzl", "defaultRegion": "blTFPX3q", "description": "RputzNoV", "supportedLanguages": ["SDhQBCYP", "I0XT3kWG", "0UJqIVmR"], "supportedRegions": ["Mn9CffIF", "quSjTjZ6", "xS3FTp4Y"], "title": "eXMC9nDU"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sEPWl3gr' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Mqd5FHfV' \
    --action 'UPDATE' \
    --itemSku 'gBiTeao5' \
    --itemType 'INGAMEITEM' \
    --limit '29' \
    --offset '52' \
    --selected  \
    --sortBy 'createdAt:asc,updatedAt:desc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd '7sWTTaJT' \
    --updatedAtStart 'mrthgYPa' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cVTGXvvZ' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BHIfoQk0' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jc1V5N7x' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hsAKLakv' \
    --action 'CREATE' \
    --itemSku 'onI0SVbO' \
    --itemType 'CODE' \
    --type 'CATEGORY' \
    --updatedAtEnd 'bJv0mZg3' \
    --updatedAtStart 'qfujumiU' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nFYS0BAO' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '7uhzjrjh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Bh2Uub3e' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'K8JbE3Ck' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0bROXrYR' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h0yXBo01' \
    --targetStoreId 'p5zRfWQe' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'jDGb6tWw' \
    --limit '65' \
    --offset '84' \
    --sku 'za64SFM7' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'r99d5MWm' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2XbqpTys' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'UHpsreYW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'uTnUyuEX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "Z3TZELI8"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'jKBmWqHI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'BAC8jH7V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 7, "orderNo": "Yir2WyH5"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'tQtCLsGC' \
    --body '{"achievements": [{"id": "va9xXk54", "value": 99}, {"id": "OJdE0J9e", "value": 94}, {"id": "h30xbHkQ", "value": 46}], "steamUserId": "N8QoHeay"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tmuh2AXn' \
    --xboxUserId 'bZyX1X5N' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'p9xzxymb' \
    --body '{"achievements": [{"id": "soHcmaYl", "percentComplete": 81}, {"id": "aIB8SVeW", "percentComplete": 14}, {"id": "1kt8v2vn", "percentComplete": 25}], "serviceConfigId": "7cIvAEXh", "titleId": "7ZkUU4tc", "xboxUserId": "FhwheRmS"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'JQmxvtvg' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '6HQSaUX2' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'R1Ci3tHW' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'nCwZ9kZU' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '1TTa4BDk' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCpx9cel' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'LfOEaewL' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLSfYQFC' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'InpnkJ8C' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName '7vreoQAV' \
    --features 'pfi75NnU,WmaHbY0R,nq5s9qv6' \
    --itemId 'iDq789wF,ttingVoq,oEv5QLZF' \
    --limit '86' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserEntitlements' test.out

#- 183 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qXGos6gf' \
    --body '[{"endDate": "1992-09-25T00:00:00Z", "grantedCode": "zXuBb3KZ", "itemId": "19EnlyU8", "itemNamespace": "6GGcS8gW", "language": "TMSV-jqEX-ee", "quantity": 75, "region": "CTGN6DP9", "source": "REFERRAL_BONUS", "startDate": "1981-09-21T00:00:00Z", "storeId": "v5ndTlF7"}, {"endDate": "1993-08-12T00:00:00Z", "grantedCode": "bYNIr6jF", "itemId": "IiaYOoOw", "itemNamespace": "ldOnbN0Z", "language": "SkMa_ZaQv", "quantity": 23, "region": "kqvYrcUn", "source": "ACHIEVEMENT", "startDate": "1990-06-04T00:00:00Z", "storeId": "IhAPOn5N"}, {"endDate": "1971-11-29T00:00:00Z", "grantedCode": "uxlFO0gU", "itemId": "mlzlpoMa", "itemNamespace": "bVnkq54r", "language": "yTty", "quantity": 0, "region": "vyy5i98P", "source": "REDEEM_CODE", "startDate": "1985-10-14T00:00:00Z", "storeId": "WY8IUsC1"}]' \
    > test.out 2>&1
eval_tap $? 183 'GrantUserEntitlement' test.out

#- 184 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BPowtfBb' \
    --activeOnly  \
    --appId 'eJ3GSh1F' \
    > test.out 2>&1
eval_tap $? 184 'GetUserAppEntitlementByAppId' test.out

#- 185 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'p3Nu13Jf' \
    --activeOnly  \
    --limit '70' \
    --offset '2' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserEntitlementsByAppType' test.out

#- 186 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'obUZcClx' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --itemId 'qxOsT3pZ' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementByItemId' test.out

#- 187 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vc30BJU0' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'iSMaML9O' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementBySku' test.out

#- 188 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'CM7WiL05' \
    --appIds 'DHoQqBpd,V8Kp3xhI,MiX1dLLz' \
    --itemIds 'CC0qtJT6,gXrENZNu,AdkVgZyH' \
    --skus 'BGTAigTJ,bC5SFqCO,Z02kOOPJ' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlement' test.out

#- 189 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'UqaqDoT6' \
    --itemIds 'UgHHkbrM,QMzJztJi,lbu2RIMQ' \
    > test.out 2>&1
eval_tap $? 189 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 190 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cZemrcXW' \
    --appId 'z44lwwPm' \
    > test.out 2>&1
eval_tap $? 190 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 191 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '58fq8y30' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'NduQbXR7' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemId' test.out

#- 192 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'b4He9xTD' \
    --ids 'sR8Hb83q,q2d5MajA,lh55SGWA' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipByItemIds' test.out

#- 193 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'UAMksW1u' \
    --entitlementClazz 'MEDIA' \
    --sku '9crCFP9Y' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipBySku' test.out

#- 194 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'sYvlISDy' \
    --entitlementIds '1X7bDBIL' \
    > test.out 2>&1
eval_tap $? 194 'RevokeUserEntitlements' test.out

#- 195 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'Mh2iQ6Ep' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y55TWcnA' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlement' test.out

#- 196 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'CEw3UUCG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOd61I0f' \
    --body '{"endDate": "1989-08-03T00:00:00Z", "nullFieldList": ["nYGhphG4", "AVxSTeCL", "pPpIeSlC"], "startDate": "1997-10-26T00:00:00Z", "status": "REVOKED", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 196 'UpdateUserEntitlement' test.out

#- 197 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '4neICFUJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '1JWdpM8m' \
    --body '{"options": ["ykHFModO", "MR9ZhuCs", "NhSwHrXc"], "requestId": "8WnDEjNu", "useCount": 44}' \
    > test.out 2>&1
eval_tap $? 197 'ConsumeUserEntitlement' test.out

#- 198 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '3zQMxxLF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsGnVoBt' \
    > test.out 2>&1
eval_tap $? 198 'DisableUserEntitlement' test.out

#- 199 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'LvK0FO5j' \
    --namespace "$AB_NAMESPACE" \
    --userId '8hTgkJYG' \
    > test.out 2>&1
eval_tap $? 199 'EnableUserEntitlement' test.out

#- 200 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'vD8SDgz7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jplg4oRC' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementHistories' test.out

#- 201 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'qP92HgkJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pz63q7WI' \
    > test.out 2>&1
eval_tap $? 201 'RevokeUserEntitlement' test.out

#- 202 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'DRKNEqfA' \
    --body '{"duration": 41, "endDate": "1989-10-01T00:00:00Z", "itemId": "ctd4nAXF", "itemSku": "lGIy4YXT", "language": "SZ1erldc", "order": {"currency": {"currencyCode": "wrgobqKS", "currencySymbol": "DZyLh1Ga", "currencyType": "REAL", "decimals": 91, "namespace": "hXPW0GOz"}, "ext": {"wP7Jov6q": {}, "zR59MoYg": {}, "PVuoo4F1": {}}, "free": true}, "orderNo": "vCzpS2yn", "origin": "Nintendo", "quantity": 58, "region": "9j6s3ew0", "source": "REWARD", "startDate": "1991-04-29T00:00:00Z", "storeId": "becv45P9"}' \
    > test.out 2>&1
eval_tap $? 202 'FulfillItem' test.out

#- 203 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '8BBEzIcW' \
    --body '{"code": "qnUdYZGy", "language": "pI_lrCJ_920", "region": "qblRJA7o"}' \
    > test.out 2>&1
eval_tap $? 203 'RedeemCode' test.out

#- 204 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '6xiGS4P4' \
    --body '{"origin": "Playstation", "rewards": [{"currency": {"currencyCode": "72bVFFnu", "namespace": "L9rKdXMq"}, "item": {"itemId": "hMXdihBJ", "itemSku": "E1Wjg3Q5", "itemType": "NDREivK5"}, "quantity": 57, "type": "CURRENCY"}, {"currency": {"currencyCode": "pUTB5b7G", "namespace": "ykNakNs5"}, "item": {"itemId": "84hgCyna", "itemSku": "zBaAAYeY", "itemType": "i5eBMMFX"}, "quantity": 91, "type": "ITEM"}, {"currency": {"currencyCode": "XMaOZcLl", "namespace": "EnF6OsLa"}, "item": {"itemId": "76IpggKo", "itemSku": "juO6cCNl", "itemType": "8fPOD6kb"}, "quantity": 13, "type": "CURRENCY"}], "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillRewards' test.out

#- 205 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '6XsGLr8C' \
    --endTime 'jLZRgkeW' \
    --limit '50' \
    --offset '60' \
    --productId 'HiW9nQrK' \
    --startTime 'uMFt6CGq' \
    --status 'FULFILLED' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 205 'QueryUserIAPOrders' test.out

#- 206 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'hotuUWn5' \
    > test.out 2>&1
eval_tap $? 206 'QueryAllUserIAPOrders' test.out

#- 207 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'hIgdRD2W' \
    --endTime 'PnOLfLwZ' \
    --limit '96' \
    --offset '61' \
    --startTime 'D6zHHSsw' \
    --status 'FAIL' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserIAPConsumeHistory' test.out

#- 208 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HOlRdbr0' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "cs_MUCk", "productId": "pRYmCv85", "region": "2Nsbeh8I", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 208 'MockFulfillIAPItem' test.out

#- 209 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '3YmH16KJ' \
    --itemId 'VBhAMaer' \
    --limit '26' \
    --offset '92' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserOrders' test.out

#- 210 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ppIfkuMO' \
    --body '{"currencyCode": "pXrPsOZ1", "currencyNamespace": "kWDI7iIm", "discountedPrice": 25, "ext": {"gajLtD6h": {}, "UoThvYyo": {}, "bDeC8Cgi": {}}, "itemId": "1OmJQeAP", "language": "VNuBP9ZR", "options": {"skipPriceValidation": false}, "platform": "GooglePlay", "price": 40, "quantity": 15, "region": "gZhvIGsR", "returnUrl": "549fiSM8", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 210 'AdminCreateUserOrder' test.out

#- 211 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mkmwciXz' \
    --itemId 'v5a2eiKk' \
    > test.out 2>&1
eval_tap $? 211 'CountOfPurchasedItem' test.out

#- 212 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'fRO89mYy' \
    --userId 'sIUE5FgI' \
    > test.out 2>&1
eval_tap $? 212 'GetUserOrder' test.out

#- 213 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FVpZT3eT' \
    --userId 'Rh61TMtd' \
    --body '{"status": "REFUNDED", "statusReason": "HwCUgDsu"}' \
    > test.out 2>&1
eval_tap $? 213 'UpdateUserOrderStatus' test.out

#- 214 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kUSxkqBb' \
    --userId 'OrojzEKy' \
    > test.out 2>&1
eval_tap $? 214 'FulfillUserOrder' test.out

#- 215 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'W5Z4BqAk' \
    --userId 'pikx2BR8' \
    > test.out 2>&1
eval_tap $? 215 'GetUserOrderGrant' test.out

#- 216 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7LaU5zTv' \
    --userId 'L9Bn0Aiu' \
    > test.out 2>&1
eval_tap $? 216 'GetUserOrderHistories' test.out

#- 217 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Agrz8CsK' \
    --userId 'MkpYZSsP' \
    --body '{"additionalData": {"cardSummary": "NhYVhRQM"}, "authorisedTime": "1981-07-16T00:00:00Z", "chargebackReversedTime": "1988-07-18T00:00:00Z", "chargebackTime": "1994-11-01T00:00:00Z", "chargedTime": "1980-10-24T00:00:00Z", "createdTime": "1974-09-05T00:00:00Z", "currency": {"currencyCode": "fFrxcjqv", "currencySymbol": "l6a3qMcr", "currencyType": "REAL", "decimals": 24, "namespace": "DdqhZGVb"}, "customParameters": {"s91ujbIN": {}, "dCU9OzlX": {}, "T5M13vu1": {}}, "extOrderNo": "p4TZS34c", "extTxId": "6e9ZO5NV", "extUserId": "MUJY7Zrh", "issuedAt": "1994-05-06T00:00:00Z", "metadata": {"jLeDD4zq": "Vd9fHCbI", "W20TD8yB": "6leHVy98", "ESuwbPlz": "cJg2P6nn"}, "namespace": "JyLvdfBv", "nonceStr": "MM5naBQA", "paymentMethod": "8x3UvF8o", "paymentMethodFee": 72, "paymentOrderNo": "Oqf1viYe", "paymentProvider": "PAYPAL", "paymentProviderFee": 6, "paymentStationUrl": "62FI56lh", "price": 4, "refundedTime": "1972-08-24T00:00:00Z", "salesTax": 65, "sandbox": true, "sku": "lfHPDtqY", "status": "REQUEST_FOR_INFORMATION", "statusReason": "WsYuNERf", "subscriptionId": "tQPm8QK0", "subtotalPrice": 54, "targetNamespace": "HvMGY5ns", "targetUserId": "itQylrfb", "tax": 41, "totalPrice": 36, "totalTax": 61, "txEndTime": "1994-01-24T00:00:00Z", "type": "akQVPwsM", "userId": "rEZO2pg6", "vat": 78}' \
    > test.out 2>&1
eval_tap $? 217 'ProcessUserOrderNotification' test.out

#- 218 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'D7yFWLc2' \
    --userId 'ZEU2V61c' \
    > test.out 2>&1
eval_tap $? 218 'DownloadUserOrderReceipt' test.out

#- 219 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'YXiecaBf' \
    --body '{"currencyCode": "Wh5Oa6Ux", "currencyNamespace": "ZG5vZawL", "customParameters": {"LQoRhaxa": {}, "KeeLH8FF": {}, "f3bUw44K": {}}, "description": "kTeqh8Vp", "extOrderNo": "ZxZGDcud", "extUserId": "mexe5Ozq", "itemType": "SEASON", "language": "iSX_UKNw-625", "metadata": {"r48yHeyl": "8PRKnGYx", "5PF9j0tI": "fLDdlBWR", "SMgYJljq": "vE2pNuq9"}, "notifyUrl": "wBU8BeQS", "omitNotification": false, "platform": "NbH7hxrh", "price": 74, "recurringPaymentOrderNo": "Und9cgym", "region": "3WXFXuEE", "returnUrl": "rW2jEhHB", "sandbox": true, "sku": "w1eKPutL", "subscriptionId": "Os43ox4t", "title": "AhzEJquU"}' \
    > test.out 2>&1
eval_tap $? 219 'CreateUserPaymentOrder' test.out

#- 220 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kSG7pLf6' \
    --userId 'wtYPYYv7' \
    --body '{"description": "6ahqVyzi"}' \
    > test.out 2>&1
eval_tap $? 220 'RefundUserPaymentOrder' test.out

#- 221 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPuUseOq' \
    --body '{"code": "PabAk4Mx", "orderNo": "CcOLhykT"}' \
    > test.out 2>&1
eval_tap $? 221 'ApplyUserRedemption' test.out

#- 222 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'xZFRNI5l' \
    --chargeStatus 'CHARGED' \
    --itemId 'nzxxaIyd' \
    --limit '100' \
    --offset '98' \
    --sku 'I39vhwBv' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserSubscriptions' test.out

#- 223 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'L2sBTDkN' \
    --excludeSystem  \
    --limit '1' \
    --offset '85' \
    --subscriptionId 'hOaEjBqn' \
    > test.out 2>&1
eval_tap $? 223 'GetUserSubscriptionActivities' test.out

#- 224 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '27tezLzM' \
    --body '{"grantDays": 53, "itemId": "6l1lCshZ", "language": "0pedoB6Y", "reason": "b5vfZqtX", "region": "AGBYFDEr", "source": "CLCARePM"}' \
    > test.out 2>&1
eval_tap $? 224 'PlatformSubscribeSubscription' test.out

#- 225 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FvcMrU1u' \
    --itemId 'Za6n0Lpz' \
    > test.out 2>&1
eval_tap $? 225 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 226 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jua64ASL' \
    --userId 'vpfUKXZX' \
    > test.out 2>&1
eval_tap $? 226 'GetUserSubscription' test.out

#- 227 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hjWpLdGX' \
    --userId 'F2Buswin' \
    > test.out 2>&1
eval_tap $? 227 'DeleteUserSubscription' test.out

#- 228 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XAGOhH4F' \
    --userId 'CaumcYOT' \
    --force  \
    --body '{"immediate": false, "reason": "wMgKqXtr"}' \
    > test.out 2>&1
eval_tap $? 228 'CancelSubscription' test.out

#- 229 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UeOXuDpS' \
    --userId 'RK0uLWxQ' \
    --body '{"grantDays": 83, "reason": "3KQDYhHS"}' \
    > test.out 2>&1
eval_tap $? 229 'GrantDaysToSubscription' test.out

#- 230 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AGiAtqDv' \
    --userId '7aziQipI' \
    --excludeFree  \
    --limit '14' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 230 'GetUserSubscriptionBillingHistories' test.out

#- 231 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LdcNioHN' \
    --userId 'ufBEmqnx' \
    --body '{"additionalData": {"cardSummary": "xsisD3N5"}, "authorisedTime": "1984-07-30T00:00:00Z", "chargebackReversedTime": "1992-05-09T00:00:00Z", "chargebackTime": "1977-12-09T00:00:00Z", "chargedTime": "1990-08-07T00:00:00Z", "createdTime": "1986-05-08T00:00:00Z", "currency": {"currencyCode": "4VUH7xg6", "currencySymbol": "pK6tzv7a", "currencyType": "REAL", "decimals": 19, "namespace": "25Xr7dzV"}, "customParameters": {"F4jbSU7V": {}, "pXof2Xjt": {}, "3reBPS7G": {}}, "extOrderNo": "7jhONJFZ", "extTxId": "2mBW6Kzh", "extUserId": "gIQO0To0", "issuedAt": "1984-12-16T00:00:00Z", "metadata": {"IO7AK7vr": "i1xCepBg", "BwwQJlQI": "pkbPke25", "MzdzqslZ": "XOUAZnqe"}, "namespace": "szdoVJys", "nonceStr": "1s7eE10p", "paymentMethod": "MIxyVqaK", "paymentMethodFee": 29, "paymentOrderNo": "Y8Cfqcu0", "paymentProvider": "ALIPAY", "paymentProviderFee": 74, "paymentStationUrl": "KPcsU0ic", "price": 13, "refundedTime": "1977-09-10T00:00:00Z", "salesTax": 47, "sandbox": false, "sku": "K8SnD6wQ", "status": "REFUND_FAILED", "statusReason": "6hcAAH8O", "subscriptionId": "poS4QHii", "subtotalPrice": 73, "targetNamespace": "3Rn8tnDX", "targetUserId": "lIFPOQFw", "tax": 48, "totalPrice": 100, "totalTax": 69, "txEndTime": "1999-11-11T00:00:00Z", "type": "Il9JyTHZ", "userId": "K9kZXkTZ", "vat": 17}' \
    > test.out 2>&1
eval_tap $? 231 'ProcessUserSubscriptionNotification' test.out

#- 232 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '2jD1bh5g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LQdZXxY9' \
    --body '{"count": 13, "orderNo": "qpwFA5wn"}' \
    > test.out 2>&1
eval_tap $? 232 'AcquireUserTicket' test.out

#- 233 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNO1gzTl' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserCurrencyWallets' test.out

#- 234 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'C4RC5eiV' \
    --namespace "$AB_NAMESPACE" \
    --userId '2LbkxBcn' \
    --limit '85' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 234 'ListUserCurrencyTransactions' test.out

#- 235 CheckWallet
eval_tap 0 235 'CheckWallet # SKIP deprecated' test.out

#- 236 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'wZpzJHKn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNqY1AaP' \
    --body '{"amount": 55, "expireAt": "1986-07-20T00:00:00Z", "origin": "Stadia", "reason": "Lj0RkHNQ", "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 236 'CreditUserWallet' test.out

#- 237 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'ZdPbvVsy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZpUuDcNI' \
    --body '{"amount": 87, "walletPlatform": "Steam"}' \
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
    --nextEvaluatedKey 'oSOaixCV' \
    --end '3yuRc80j' \
    --start 'dDXyVzEf' \
    > test.out 2>&1
eval_tap $? 245 'SyncOrders' test.out

#- 246 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["qXzKBLiY", "mnhYbA75", "FGjvT7KY"], "apiKey": "kuMZxjNB", "authoriseAsCapture": true, "blockedPaymentMethods": ["QQZdGnbN", "gtUTdQEU", "RwFsEosC"], "clientKey": "4Kd8KqXK", "dropInSettings": "OEZkVeft", "liveEndpointUrlPrefix": "SQWryHbD", "merchantAccount": "xX999PlR", "notificationHmacKey": "LUgT11w9", "notificationPassword": "59V0C1TY", "notificationUsername": "oJc90YeR", "returnUrl": "dSfbAq9o", "settings": "iJFVUf4F"}' \
    > test.out 2>&1
eval_tap $? 246 'TestAdyenConfig' test.out

#- 247 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "Hr1cdfGI", "privateKey": "Sl0iBTHC", "publicKey": "OyuIAGma", "returnUrl": "YUB9gAwF"}' \
    > test.out 2>&1
eval_tap $? 247 'TestAliPayConfig' test.out

#- 248 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "ZqGh24Uv", "secretKey": "L58TBft3"}' \
    > test.out 2>&1
eval_tap $? 248 'TestCheckoutConfig' test.out

#- 249 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'p0iLj4tA' \
    > test.out 2>&1
eval_tap $? 249 'DebugMatchedPaymentMerchantConfig' test.out

#- 250 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "cyNqN03E", "clientSecret": "kw9CA7jZ", "returnUrl": "EMSh4nUb", "webHookId": "lFnphvhY"}' \
    > test.out 2>&1
eval_tap $? 250 'TestPayPalConfig' test.out

#- 251 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["3QAlhfSv", "Xd1aSatK", "K41N1X2D"], "publishableKey": "owppn3TP", "secretKey": "oebTLT2g", "webhookSecret": "C1vRzc4d"}' \
    > test.out 2>&1
eval_tap $? 251 'TestStripeConfig' test.out

#- 252 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "LD8wjwdg", "key": "ABOcq7YY", "mchid": "wIKexp88", "returnUrl": "I5E6bZQU"}' \
    > test.out 2>&1
eval_tap $? 252 'TestWxPayConfig' test.out

#- 253 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "CXPYgwP5", "flowCompletionUrl": "7ClLg1XY", "merchantId": 78, "projectId": 0, "projectSecretKey": "XhZDlg8S"}' \
    > test.out 2>&1
eval_tap $? 253 'TestXsollaConfig' test.out

#- 254 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '7gr1MOmT' \
    > test.out 2>&1
eval_tap $? 254 'GetPaymentMerchantConfig' test.out

#- 255 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'KK4DVlij' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["eGX4Zpc7", "K7pRQ0G1", "ml2GaCcb"], "apiKey": "i4UVGeeH", "authoriseAsCapture": true, "blockedPaymentMethods": ["rgYKZyqF", "VvykrRms", "ufsfKBMh"], "clientKey": "4R6GPmT7", "dropInSettings": "WKOGztp8", "liveEndpointUrlPrefix": "ITO2o3v2", "merchantAccount": "y71h9iGZ", "notificationHmacKey": "Y0cM2S3U", "notificationPassword": "1MyTgqe9", "notificationUsername": "jMsSW1Dt", "returnUrl": "B0fwK4yL", "settings": "X1ofZzWU"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateAdyenConfig' test.out

#- 256 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'S9y7TwLm' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 256 'TestAdyenConfigById' test.out

#- 257 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'kiDdLnqj' \
    --sandbox  \
    --validate  \
    --body '{"appId": "xfkXt8KP", "privateKey": "U8VumxxS", "publicKey": "BguyEny4", "returnUrl": "yzlnzuvA"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateAliPayConfig' test.out

#- 258 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'TMlYErvP' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestAliPayConfigById' test.out

#- 259 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '3SUDlY78' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "NVdI0vMb", "secretKey": "FMQpTGAi"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateCheckoutConfig' test.out

#- 260 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 't2Cq3ww6' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestCheckoutConfigById' test.out

#- 261 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'zpUEf5MK' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "HILYAdF4", "clientSecret": "ZfMbIGXN", "returnUrl": "SrsHeGWa", "webHookId": "elqdW4Ut"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdatePayPalConfig' test.out

#- 262 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '3cT1Cf68' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestPayPalConfigById' test.out

#- 263 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '2QX4Z2kK' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["ENGI6yrY", "Z6wCd36o", "6FdSqGb1"], "publishableKey": "FdhyFkCz", "secretKey": "CnRLTnDO", "webhookSecret": "jFiK0yb9"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateStripeConfig' test.out

#- 264 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'mFE4HGGc' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 264 'TestStripeConfigById' test.out

#- 265 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'fcNuTRjE' \
    --validate  \
    --body '{"appId": "EBwetc0O", "key": "2o1vkvx6", "mchid": "fynkODj2", "returnUrl": "dEsW5jPp"}' \
    > test.out 2>&1
eval_tap $? 265 'UpdateWxPayConfig' test.out

#- 266 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'aAvot0xY' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 266 'UpdateWxPayConfigCert' test.out

#- 267 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'CzASTPDu' \
    > test.out 2>&1
eval_tap $? 267 'TestWxPayConfigById' test.out

#- 268 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'fvtSVskc' \
    --validate  \
    --body '{"apiKey": "cr48K3lX", "flowCompletionUrl": "7f28oWu2", "merchantId": 83, "projectId": 64, "projectSecretKey": "WdPERxMt"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateXsollaConfig' test.out

#- 269 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '8oLGLJUM' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfigById' test.out

#- 270 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'ZFqzDPKa' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateXsollaUIConfig' test.out

#- 271 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '22' \
    --namespace "$AB_NAMESPACE" \
    --offset '29' \
    --region '35vaIbfl' \
    > test.out 2>&1
eval_tap $? 271 'QueryPaymentProviderConfig' test.out

#- 272 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "aWXBbFnm", "region": "jbFvg5MD", "sandboxTaxJarApiToken": "DiB30vJy", "specials": ["WXPAY", "XSOLLA", "ADYEN"], "taxJarApiToken": "9MVrQZlk", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 272 'CreatePaymentProviderConfig' test.out

#- 273 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 273 'GetAggregatePaymentProviders' test.out

#- 274 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'lxMIAoBr' \
    > test.out 2>&1
eval_tap $? 274 'DebugMatchedPaymentProviderConfig' test.out

#- 275 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 275 'GetSpecialPaymentProviders' test.out

#- 276 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'nPam5U61' \
    --body '{"aggregate": "XSOLLA", "namespace": "YEMxlQjh", "region": "6mPkn3xV", "sandboxTaxJarApiToken": "rBeiv1F4", "specials": ["XSOLLA", "CHECKOUT", "WALLET"], "taxJarApiToken": "OdGTyPrY", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 276 'UpdatePaymentProviderConfig' test.out

#- 277 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'K0KUCw0y' \
    > test.out 2>&1
eval_tap $? 277 'DeletePaymentProviderConfig' test.out

#- 278 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 278 'GetPaymentTaxConfig' test.out

#- 279 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "q3QvRjia", "taxJarApiToken": "PXB6drdD", "taxJarEnabled": false, "taxJarProductCodesMapping": {"y1EYCeUp": "8G2p50we", "muBVR51m": "0oTdBWv6", "P640lnkA": "3RJpS9Hu"}}' \
    > test.out 2>&1
eval_tap $? 279 'UpdatePaymentTaxConfig' test.out

#- 280 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'D492LeYr' \
    --end 'DJrjpHsT' \
    --start 'R8lkcj2x' \
    > test.out 2>&1
eval_tap $? 280 'SyncPaymentOrders' test.out

#- 281 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'LhLeC93J' \
    --storeId 'ZprhhviP' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetRootCategories' test.out

#- 282 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'fRpsgY5h' \
    --storeId 'YEueJGTr' \
    > test.out 2>&1
eval_tap $? 282 'DownloadCategories' test.out

#- 283 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'zC6KZtJT' \
    --namespace "$AB_NAMESPACE" \
    --language 'oQTSBoz5' \
    --storeId 'DciOmQDI' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetCategory' test.out

#- 284 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'aUP1JkWQ' \
    --namespace "$AB_NAMESPACE" \
    --language 'k2BQ9BBq' \
    --storeId 'g2CfZgY0' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetChildCategories' test.out

#- 285 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '8VqLwxlF' \
    --namespace "$AB_NAMESPACE" \
    --language 'PSD0oRJO' \
    --storeId 'XptedpB1' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetDescendantCategories' test.out

#- 286 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 286 'PublicListCurrencies' test.out

#- 287 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '0wIDqJVW' \
    --region 'fMLHmrY8' \
    --storeId 'Nx9WJCHD' \
    --appId '1GY11Eo7' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetItemByAppId' test.out

#- 288 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'eqVDVugq' \
    --categoryPath 'V2CAa10L' \
    --features 'r8P2ao31' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --language 'cB9y2WAl' \
    --limit '89' \
    --offset '92' \
    --region 'zXGvMkga' \
    --sortBy 'updatedAt,updatedAt:desc,displayOrder' \
    --storeId 'bZLC1dwc' \
    --tags 'CWB0T05I' \
    > test.out 2>&1
eval_tap $? 288 'PublicQueryItems' test.out

#- 289 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'ACFv8VeP' \
    --region 'CmcB3Q4L' \
    --storeId 'VafFbsc8' \
    --sku 'tnepGKKj' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetItemBySku' test.out

#- 290 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'GKZpTm3C' \
    --region 'Zc4Nq00s' \
    --storeId 'p6rGnEQh' \
    --itemIds 'ZkPJzSWV' \
    > test.out 2>&1
eval_tap $? 290 'PublicBulkGetItems' test.out

#- 291 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["Vlo4DnST", "xzAYCwbL", "UOhuPZSy"]}' \
    > test.out 2>&1
eval_tap $? 291 'PublicValidateItemPurchaseCondition' test.out

#- 292 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'OPTIONBOX' \
    --limit '85' \
    --offset '83' \
    --region 'S8wInjXO' \
    --storeId 'QdWvbLBY' \
    --keyword 'oDQEAfZe' \
    --language 'owjAPjCE' \
    > test.out 2>&1
eval_tap $? 292 'PublicSearchItems' test.out

#- 293 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'DpPmdexj' \
    --namespace "$AB_NAMESPACE" \
    --language 'MgoHlYEa' \
    --region 'Cx3C5EmR' \
    --storeId 'IojOzv2P' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetApp' test.out

#- 294 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'VZyMpYyc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'PublicGetItemDynamicData' test.out

#- 295 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'eud91xiH' \
    --namespace "$AB_NAMESPACE" \
    --language '37Xyh39m' \
    --populateBundle  \
    --region 'SMou4fUe' \
    --storeId 'NFE8wtva' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetItem' test.out

#- 296 GetPaymentCustomization
eval_tap 0 296 'GetPaymentCustomization # SKIP deprecated' test.out

#- 297 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "0sdy7QHT", "paymentProvider": "STRIPE", "returnUrl": "8oMKQiXL", "ui": "7ZKPZxgE", "zipCode": "UOS3I2CW"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetPaymentUrl' test.out

#- 298 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'n8yh5Snz' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetPaymentMethods' test.out

#- 299 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zxerFteU' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUnpaidPaymentOrder' test.out

#- 300 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zbcaP5Vo' \
    --paymentProvider 'PAYPAL' \
    --zipCode 'adNEqqAi' \
    --body '{"token": "dJgYdPVk"}' \
    > test.out 2>&1
eval_tap $? 300 'Pay' test.out

#- 301 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jQjjjTRp' \
    > test.out 2>&1
eval_tap $? 301 'PublicCheckPaymentOrderPaidStatus' test.out

#- 302 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'STRIPE' \
    --region 'ufFKKGJY' \
    > test.out 2>&1
eval_tap $? 302 'GetPaymentPublicConfig' test.out

#- 303 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'dJ8rUyHE' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetQRCode' test.out

#- 304 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'oU6nTUyy' \
    --foreinginvoice '4OTAQFGF' \
    --invoiceId 'xtDQhBlP' \
    --payload 'HBD8v6Xh' \
    --redirectResult 'PLSBv1zm' \
    --resultCode 'qwAK37Al' \
    --sessionId 'E8hNIm9t' \
    --status 'Sg0jyHSv' \
    --token 'J1g2qOtk' \
    --type 'JEZwGvCa' \
    --userId 'YTOeNZY2' \
    --orderNo '8sjrqv8R' \
    --paymentOrderNo '34doni49' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'WjRbAHt1' \
    > test.out 2>&1
eval_tap $? 304 'PublicNormalizePaymentReturnUrl' test.out

#- 305 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '0JrZLQVP' \
    --paymentOrderNo 'W2VIebxl' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 305 'GetPaymentTaxValue' test.out

#- 306 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '2Yp2as8I' \
    > test.out 2>&1
eval_tap $? 306 'GetRewardByCode' test.out

#- 307 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'QqIeUDHs' \
    --limit '99' \
    --offset '45' \
    --sortBy 'namespace:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 307 'QueryRewards1' test.out

#- 308 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Fe1H4Csm' \
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
    --appIds 'D32zERPa,LXslqh8P,k9BStUIj' \
    --itemIds 'OjZWaFKB,eh6iZ28j,PQc8ReQm' \
    --skus 'XC4vwyDx,IDJajDck,3Q6bW2GQ' \
    > test.out 2>&1
eval_tap $? 310 'PublicExistsAnyMyActiveEntitlement' test.out

#- 311 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'wxLXq2Vy' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 312 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'xyBpNpsh' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 313 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku '7EusP4w8' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 314 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'kWK4ddFl,jf4MwayR,6HxJ0uya' \
    --itemIds 'Q4D2ju5u,X2mQVdEE,EnCsOj4v' \
    --skus 'JFrGdsR6,xcypscje,zmY80Apm' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetEntitlementOwnershipToken' test.out

#- 315 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'BRfHO0wq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyWallet' test.out

#- 316 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'asHS3he1' \
    --body '{"epicGamesJwtToken": "9KRJPKje"}' \
    > test.out 2>&1
eval_tap $? 316 'SyncEpicGameDLC' test.out

#- 317 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vHDn4rrg' \
    --body '{"serviceLabel": 97}' \
    > test.out 2>&1
eval_tap $? 317 'PublicSyncPsnDlcInventory' test.out

#- 318 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '8RJLaK1S' \
    --body '{"appId": "sRrdXZpM", "steamId": "0ivXY3xF"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncSteamDLC' test.out

#- 319 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '1Sr3zIA1' \
    --body '{"xstsToken": "2gT9RbaL"}' \
    > test.out 2>&1
eval_tap $? 319 'SyncXboxDLC' test.out

#- 320 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XIqjz8xQ' \
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName 'qVz17R0V' \
    --features 'QlaLgIXX,gxCKPW8Y,prK6WQqD' \
    --itemId '5m0LgoOq,8PbgOhkS,arTS0CZg' \
    --limit '29' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 320 'PublicQueryUserEntitlements' test.out

#- 321 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IhsElBIc' \
    --appId 'ELg2A4fM' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetUserAppEntitlementByAppId' test.out

#- 322 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'a1FBjOET' \
    --limit '87' \
    --offset '9' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 322 'PublicQueryUserEntitlementsByAppType' test.out

#- 323 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHENOzQW' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'WZHzM5yx' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetUserEntitlementByItemId' test.out

#- 324 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'XezmPSpF' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '8VnJRJKW' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserEntitlementBySku' test.out

#- 325 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '8BdFiQgg' \
    --appIds 'IvvjawA4,McIXtsBY,al50ZqFC' \
    --itemIds 'pAZw24uG,hvnpFiLu,WhvNlmz7' \
    --skus 'hxoh5B66,cnb0Uu69,fIWPBHst' \
    > test.out 2>&1
eval_tap $? 325 'PublicExistsAnyUserActiveEntitlement' test.out

#- 326 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '2RoK6seF' \
    --appId 'dHz7y9tK' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 327 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3CjZBZh' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '2ucUdqUY' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 328 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'YQTfJdHL' \
    --ids 'MsxzrV1Y,mvrhMoiM,Onvs1ZbP' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 329 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ptpisz6v' \
    --entitlementClazz 'CODE' \
    --sku 'fPVPHz9s' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 330 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '5fGZ8N0Q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIQ6EZjy' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetUserEntitlement' test.out

#- 331 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'liCyKAa7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ba0n6fvJ' \
    --body '{"options": ["7RJcBft5", "dWigc2VL", "WxiLLTCN"], "requestId": "IF7gXVTi", "useCount": 49}' \
    > test.out 2>&1
eval_tap $? 331 'PublicConsumeUserEntitlement' test.out

#- 332 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNjeb8MV' \
    --body '{"code": "FSbalF9V", "language": "InMN_wuxM", "region": "iAnxN29R"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicRedeemCode' test.out

#- 333 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vXacA1ox' \
    --body '{"excludeOldTransactions": true, "language": "zpa-eLUX", "productId": "m4ogwQwt", "receiptData": "ZrjIqwdM", "region": "YlkwwmoK", "transactionId": "44vmERi1"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicFulfillAppleIAPItem' test.out

#- 334 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '5npk8eFk' \
    --body '{"epicGamesJwtToken": "DsUmfEor"}' \
    > test.out 2>&1
eval_tap $? 334 'SyncEpicGamesInventory' test.out

#- 335 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'iIWbiTAQ' \
    --body '{"autoAck": true, "language": "PLQf_paHm", "orderId": "VPDpm20U", "packageName": "2yB667mF", "productId": "r0lz8tII", "purchaseTime": 92, "purchaseToken": "EJR56484", "region": "PCD9UNbj"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicFulfillGoogleIAPItem' test.out

#- 336 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIA4QaK2' \
    --body '{"currencyCode": "RUB3E3WG", "price": 0.8176932631279816, "productId": "vUF9bwrL", "serviceLabel": 87}' \
    > test.out 2>&1
eval_tap $? 336 'PublicReconcilePlayStationStore' test.out

#- 337 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'S1wjVHRs' \
    --body '{"appId": "uhHyC07h", "language": "PDE-jl", "region": "9ODTmKmr", "stadiaPlayerId": "DM9IVHIn"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncStadiaEntitlement' test.out

#- 338 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'XpE8YbwK' \
    --body '{"appId": "1WyZVTaj", "currencyCode": "P9ySOl94", "language": "uLQc", "price": 0.37086987282532335, "productId": "mdcqSkvF", "region": "drCGh29j", "steamId": "hNaJbSW7"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncSteamInventory' test.out

#- 339 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZMjoZAws' \
    --body '{"gameId": "YLO4Gddm", "language": "IzV-rhIF", "region": "XMUjCGbF"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncTwitchDropsEntitlement' test.out

#- 340 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '0n4dfgze' \
    --body '{"currencyCode": "6i2JvlUT", "price": 0.5397860649022452, "productId": "Seeg5Va4", "xstsToken": "GuGjlMWs"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncXboxInventory' test.out

#- 341 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'R7oAGwAp' \
    --itemId 'MjHKSFu8' \
    --limit '77' \
    --offset '52' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 341 'PublicQueryUserOrders' test.out

#- 342 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'h5onYvH5' \
    --body '{"currencyCode": "ljM6FTkY", "discountedPrice": 19, "ext": {"LKT9K4D5": {}, "4MpXvI8c": {}, "KUHAH1iS": {}}, "itemId": "6r3fBQTN", "language": "Xg-HPtW", "price": 73, "quantity": 74, "region": "zVpcXRrJ", "returnUrl": "ZF3C1IyE"}' \
    > test.out 2>&1
eval_tap $? 342 'PublicCreateUserOrder' test.out

#- 343 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dAlJBrE3' \
    --userId 'pzSFtQdF' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserOrder' test.out

#- 344 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cidLZFsf' \
    --userId 'Fb7llKou' \
    > test.out 2>&1
eval_tap $? 344 'PublicCancelUserOrder' test.out

#- 345 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yq4v3QPr' \
    --userId 'RouIaAiz' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserOrderHistories' test.out

#- 346 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NtaGAYU4' \
    --userId 'QOBG0dmd' \
    > test.out 2>&1
eval_tap $? 346 'PublicDownloadUserOrderReceipt' test.out

#- 347 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'vREUJ9ll' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetPaymentAccounts' test.out

#- 348 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'V7EK9ZQ8' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'fsJYGJBu' \
    > test.out 2>&1
eval_tap $? 348 'PublicDeletePaymentAccount' test.out

#- 349 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'AOrdYIGg' \
    --chargeStatus 'NEVER' \
    --itemId 'q8NwFwi5' \
    --limit '6' \
    --offset '16' \
    --sku '2406Ck02' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 349 'PublicQueryUserSubscriptions' test.out

#- 350 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '8wxUvpwa' \
    --body '{"currencyCode": "NAWdlbLl", "itemId": "vpumfXEj", "language": "eU-ozSz", "region": "5evrHJAM", "returnUrl": "VyCm8ffe", "source": "1RCDqR9C"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicSubscribeSubscription' test.out

#- 351 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuppvkL4' \
    --itemId 'Cj6ADX5j' \
    > test.out 2>&1
eval_tap $? 351 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 352 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ShvcjfEk' \
    --userId 'f1OTtyYQ' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetUserSubscription' test.out

#- 353 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wjxFaAfr' \
    --userId 'FadReZKE' \
    > test.out 2>&1
eval_tap $? 353 'PublicChangeSubscriptionBillingAccount' test.out

#- 354 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BzmEkf1F' \
    --userId 'nUpGYsoJ' \
    --body '{"immediate": false, "reason": "YcUb10dT"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicCancelSubscription' test.out

#- 355 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'neScOMq3' \
    --userId 'RXYb4Cgz' \
    --excludeFree  \
    --limit '29' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetUserSubscriptionBillingHistories' test.out

#- 356 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'K6vymFio' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zm2Pa4QN' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetWallet' test.out

#- 357 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'TADtUQNp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qEyCyFct' \
    --limit '58' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 357 'PublicListUserWalletTransactions' test.out

#- 358 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'rkaOtAFR' \
    --baseAppId 'SwAXK4Yu' \
    --categoryPath 'mUJTSsjX' \
    --features 'S22CNSHy' \
    --includeSubCategoryItem  \
    --itemStatus 'INACTIVE' \
    --itemType 'SEASON' \
    --limit '57' \
    --offset '16' \
    --region 'JSF5NsLh' \
    --sortBy 'updatedAt,createdAt:desc' \
    --storeId 'ef9gYgvs' \
    --tags 'IistFgJ2' \
    --targetNamespace 'uM1iBOx6' \
    > test.out 2>&1
eval_tap $? 358 'QueryItems1' test.out

#- 359 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U7brV7ZO' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 359 'ImportStore1' test.out

#- 360 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OHcH7XKE' \
    --body '{"itemIds": ["6D2kx9Sl", "fpuRio8T", "5J7gqd1O"]}' \
    > test.out 2>&1
eval_tap $? 360 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE