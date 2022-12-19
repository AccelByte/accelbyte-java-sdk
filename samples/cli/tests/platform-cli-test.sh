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
    --body '{"context": {"item": {"appId": "qJ3gRMdd", "appType": "GAME", "baseAppId": "7h4hfvnj", "boothName": "LUF8JvIj", "boundItemIds": ["F5lrRiQF", "T1O2mEvf", "viPbGIvK"], "categoryPath": "PgCU0h2A", "clazz": "WV0O1TI3", "createdAt": "1981-01-30T00:00:00Z", "description": "kk84FJzu", "displayOrder": 41, "entitlementType": "CONSUMABLE", "ext": {"yckgKpzE": {}, "PxBQAGg3": {}, "uSB867Y4": {}}, "features": ["207fKzad", "WnmeBpbD", "ueCQ4NG5"], "fresh": true, "images": [{"as": "ZIatZaQZ", "caption": "cIeOIfaa", "height": 54, "imageUrl": "zMK2tnQF", "smallImageUrl": "3Ya5geB2", "width": 3}, {"as": "eEP2JXXT", "caption": "hN0uplXa", "height": 34, "imageUrl": "QWoOCHDp", "smallImageUrl": "03XoPtZ3", "width": 43}, {"as": "DmxTM5oC", "caption": "IrGQj4AW", "height": 13, "imageUrl": "AQt0PPzW", "smallImageUrl": "paekwktr", "width": 29}], "itemId": "S1Q5WBej", "itemIds": ["BfX5dbCT", "oNOSD6PO", "jC4aXVlK"], "itemQty": {"vNTmlp8K": 74, "WO5gaYhW": 56, "eINf4ylB": 24}, "itemType": "SUBSCRIPTION", "language": "fB7EzyTX", "listable": true, "localExt": {"NOCquOgT": {}, "5YJpBL0P": {}, "4ief4tAn": {}}, "longDescription": "0WzCIc4U", "lootBoxConfig": {"rewardCount": 22, "rewards": [{"lootBoxItems": [{"count": 94, "itemId": "CCZIQDvo", "itemSku": "8tgm8cjv", "itemType": "auLfJjdF"}, {"count": 24, "itemId": "FJPv6xqk", "itemSku": "ePpwo2Gd", "itemType": "6bLZBDs1"}, {"count": 88, "itemId": "1bfVXxtd", "itemSku": "XTwM52im", "itemType": "xyLNjLYT"}], "name": "5nCnwU6J", "odds": 0.9512709986763974, "type": "REWARD", "weight": 12}, {"lootBoxItems": [{"count": 34, "itemId": "fwXrvpxj", "itemSku": "JYW0n04W", "itemType": "pQrPkgxf"}, {"count": 16, "itemId": "Bn8bcFeR", "itemSku": "MVvz8myz", "itemType": "3mAkBWkk"}, {"count": 50, "itemId": "A3zf0iFC", "itemSku": "VOqms5po", "itemType": "X9go8stL"}], "name": "ZjlYnIAe", "odds": 0.5021980525514049, "type": "REWARD", "weight": 98}, {"lootBoxItems": [{"count": 18, "itemId": "GeDp01Wl", "itemSku": "Hq1prAPS", "itemType": "557A8V2P"}, {"count": 66, "itemId": "cADxXU9Q", "itemSku": "9Si9hhhq", "itemType": "aePR4pZm"}, {"count": 14, "itemId": "ZlzloWeJ", "itemSku": "LaMrl9Si", "itemType": "vMzIxvVQ"}], "name": "QfRNm2ps", "odds": 0.09712071865090566, "type": "REWARD", "weight": 32}]}, "maxCount": 64, "maxCountPerUser": 65, "name": "6AnJISee", "namespace": "cnmIPre7", "optionBoxConfig": {"boxItems": [{"count": 62, "itemId": "TfFKJ2Yc", "itemSku": "KnpJ4P5p", "itemType": "mrpLuIo3"}, {"count": 62, "itemId": "2UsoVqWB", "itemSku": "sd7GiSjv", "itemType": "jSK2tjcz"}, {"count": 6, "itemId": "P3L6iHrR", "itemSku": "jBEr503t", "itemType": "zo0EBNWc"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 27, "comparison": "isGreaterThanOrEqual", "name": "E57tFED8", "predicateType": "SeasonTierPredicate", "value": "lVHjCwbn", "values": ["hyKssemz", "2w5B3W6W", "auZOkDoY"]}, {"anyOf": 97, "comparison": "isNot", "name": "aSTKyoOY", "predicateType": "SeasonPassPredicate", "value": "44HM1ng5", "values": ["Lp882zS8", "PiC2DICF", "PFHDs5qE"]}, {"anyOf": 39, "comparison": "is", "name": "qJf45YFQ", "predicateType": "SeasonTierPredicate", "value": "I9S8kear", "values": ["UU1EYi7y", "jAMmk9PE", "zzhE9gVy"]}]}, {"operator": "or", "predicates": [{"anyOf": 5, "comparison": "isGreaterThanOrEqual", "name": "91qiMI7Q", "predicateType": "SeasonTierPredicate", "value": "37REFl6H", "values": ["jD2mzmwV", "coisErQZ", "zHMBKXRh"]}, {"anyOf": 36, "comparison": "isLessThanOrEqual", "name": "FgHxs5CT", "predicateType": "SeasonPassPredicate", "value": "enpRwZ1q", "values": ["zotuKe3p", "xc8eaDcf", "ySWyRVgC"]}, {"anyOf": 10, "comparison": "isLessThan", "name": "p3gReZNz", "predicateType": "EntitlementPredicate", "value": "ovDO5i1r", "values": ["cUzjUO99", "Y6rlPAtJ", "4vA8531l"]}]}, {"operator": "and", "predicates": [{"anyOf": 61, "comparison": "isGreaterThanOrEqual", "name": "MkPPRkkk", "predicateType": "SeasonTierPredicate", "value": "XU39LHwm", "values": ["Aisz5ySb", "EquImeJh", "umB8xREc"]}, {"anyOf": 59, "comparison": "isGreaterThan", "name": "VGfl503N", "predicateType": "SeasonTierPredicate", "value": "rDk6jT1b", "values": ["2OUqu1KN", "VRlV1PwO", "Tk9Csh2X"]}, {"anyOf": 15, "comparison": "isGreaterThanOrEqual", "name": "JJMxWqnO", "predicateType": "SeasonPassPredicate", "value": "790tUPEB", "values": ["QrNAe72d", "qXHpe5Lm", "8rxuU2Ne"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 16, "fixedTrialCycles": 68, "graceDays": 4}, "region": "5b0fy0U0", "regionData": [{"currencyCode": "1LiMLHEn", "currencyNamespace": "GPMCoYlv", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1994-11-09T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1971-12-18T00:00:00Z", "discountedPrice": 65, "expireAt": "1986-01-19T00:00:00Z", "price": 70, "purchaseAt": "1981-06-16T00:00:00Z", "trialPrice": 5}, {"currencyCode": "eDh6Guzv", "currencyNamespace": "ACBdBxfL", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1980-04-03T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1997-10-13T00:00:00Z", "discountedPrice": 37, "expireAt": "1996-12-09T00:00:00Z", "price": 8, "purchaseAt": "1985-08-07T00:00:00Z", "trialPrice": 59}, {"currencyCode": "NFNfyT7W", "currencyNamespace": "6dEMTfK2", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1982-11-11T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1980-06-28T00:00:00Z", "discountedPrice": 84, "expireAt": "1996-01-14T00:00:00Z", "price": 91, "purchaseAt": "1994-08-25T00:00:00Z", "trialPrice": 55}], "seasonType": "TIER", "sku": "w4ZQMFsm", "stackable": false, "status": "INACTIVE", "tags": ["4FyfilUN", "XEJuitvQ", "KwJcY3JS"], "targetCurrencyCode": "tKXLxRmS", "targetItemId": "4fjvlwz2", "targetNamespace": "8aNeSwA4", "thumbnailUrl": "hqH3GRhl", "title": "dLaBNvcX", "updatedAt": "1998-02-12T00:00:00Z", "useCount": 21}, "namespace": "knXucQFL", "order": {"currency": {"currencyCode": "olmcyx0W", "currencySymbol": "D3I6PF4u", "currencyType": "REAL", "decimals": 63, "namespace": "C3iEPd1B"}, "ext": {"7MOjLrDS": {}, "K8RMpeIV": {}, "u8oIpxVx": {}}, "free": false}, "source": "GIFT"}, "script": "1ZcXUapY", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id '1HC9Tb9W' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'yWBnpezV' \
    --body '{"grantDays": "XZUuYPYZ"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'VQxxE3xp' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'LwSPLRiD' \
    --body '{"grantDays": "1Vbf1yHV"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "QkuHWyS6", "dryRun": false, "fulfillmentUrl": "VYCsKNRj", "itemType": "INGAMEITEM", "purchaseConditionUrl": "rjyrS9bm"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'tAXg6xo4' \
    --itemType 'INGAMEITEM' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'WGSuf13q' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'usCZUYkS' \
    --body '{"clazz": "inRE6dYY", "dryRun": false, "fulfillmentUrl": "pFO026bg", "purchaseConditionUrl": "lL1HsEr0"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'AQaWJ1vH' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --name 'NsPWr6Pc' \
    --offset '39' \
    --tag 'Ry15Bg6E' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "yV0jxytZ", "items": [{"extraSubscriptionDays": 37, "itemId": "m0qj4acd", "itemName": "PEV74mb6", "quantity": 53}, {"extraSubscriptionDays": 81, "itemId": "zSdBWxa4", "itemName": "z8bN3nuN", "quantity": 45}, {"extraSubscriptionDays": 15, "itemId": "TZsQ4z7x", "itemName": "1ggo6znd", "quantity": 34}], "maxRedeemCountPerCampaignPerUser": 44, "maxRedeemCountPerCode": 70, "maxRedeemCountPerCodePerUser": 75, "maxSaleCount": 31, "name": "PS0kK4y3", "redeemEnd": "1971-05-04T00:00:00Z", "redeemStart": "1987-02-27T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["5hwKL95Y", "Lpt6WXBU", "tGNPrj2Z"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'v1tIaGmy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'mLA2HjIW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ytRNydjd", "items": [{"extraSubscriptionDays": 88, "itemId": "bj3GGZFC", "itemName": "orllKwnT", "quantity": 75}, {"extraSubscriptionDays": 43, "itemId": "NuULY87x", "itemName": "F9Fu1WDp", "quantity": 99}, {"extraSubscriptionDays": 49, "itemId": "1Bt6MrSt", "itemName": "pgAna64x", "quantity": 2}], "maxRedeemCountPerCampaignPerUser": 7, "maxRedeemCountPerCode": 28, "maxRedeemCountPerCodePerUser": 50, "maxSaleCount": 75, "name": "KkvHcPpF", "redeemEnd": "1971-04-07T00:00:00Z", "redeemStart": "1986-11-15T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["c5gmoDcd", "aI14RTYJ", "ZgcvC9dT"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'yBGckUPP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'f6UFW8ob' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vE2PS533' \
    --body '{"categoryPath": "ToPnp5V9", "localizationDisplayNames": {"MMtfQxQs": "nSvLJgNi", "aXNGyhOe": "HQlRAzpe", "eKqRn2ZL": "d2jfb0eQ"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jS2KuPbz' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'sJnecctF' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2jQSQYfN' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'lGRT2bPs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HXsNmY7A' \
    --body '{"localizationDisplayNames": {"FBCHvG1p": "pLoMvIak", "ACZUkfrL": "DYtuNcfj", "yqLMZHmT": "XIZIJySz"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '9M5DKbTF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BIkhlrcJ' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '8ET7mWOt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NUXkhobX' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'WLEdVLSl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uWhrsPop' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'Gczxn77S' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '69' \
    --code 'wgTJ87Dm' \
    --limit '29' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'Aj3F6Iwz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 71}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'VgRopGyW' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '59' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'T0tQqndT' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '65' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'BdzziZ1h' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '19' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'vyTckz59' \
    --namespace "$AB_NAMESPACE" \
    --code 'ifo9YJ3w' \
    --limit '82' \
    --offset '41' \
    --userId 'pSwXwzAM' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '0vIXkMns' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'FXQ5zKpv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'q3hgZYLl' \
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
    --body '{"currencyCode": "vr3ogTxS", "currencySymbol": "ldAOjxzo", "currencyType": "REAL", "decimals": 88, "localizationDescriptions": {"123Uh1Yq": "b57IhSpI", "4bm1jVA3": "zZibbd7d", "7cWbyWOP": "QE8ALUER"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'c2KtpQkr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"BZzHb8Z0": "Pp3euaCc", "ugkUL6ij": "knHqxMt7", "mpYvUrFD": "Kkjtj58x"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'nW6Biter' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'LfRW21SC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'xcltOp65' \
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
    --body '{"data": [{"id": "EawQLlMM", "rewards": [{"currency": {"currencyCode": "dDPUBsgQ", "namespace": "wEsSL6ft"}, "item": {"itemId": "E6mHXfg3", "itemSku": "lmGdIRqr", "itemType": "SXg2K7GF"}, "quantity": 35, "type": "CURRENCY"}, {"currency": {"currencyCode": "8bp31DnB", "namespace": "XLMOxE1B"}, "item": {"itemId": "xHKeVpB4", "itemSku": "LblrGonG", "itemType": "vyalEPnT"}, "quantity": 8, "type": "CURRENCY"}, {"currency": {"currencyCode": "C3Qolbrj", "namespace": "fJpnkYdM"}, "item": {"itemId": "45YO90Rg", "itemSku": "cdWhelNn", "itemType": "hK70i13v"}, "quantity": 33, "type": "ITEM"}]}, {"id": "MvsbX2J7", "rewards": [{"currency": {"currencyCode": "j3PQ3cVI", "namespace": "w2A5tiNL"}, "item": {"itemId": "1Al5w8uP", "itemSku": "WzbH7byL", "itemType": "gcVB8Fjb"}, "quantity": 34, "type": "ITEM"}, {"currency": {"currencyCode": "fDQqD130", "namespace": "IwQFVDut"}, "item": {"itemId": "6eRdgLeJ", "itemSku": "HoOBdWJf", "itemType": "Bqa3S0Dq"}, "quantity": 43, "type": "CURRENCY"}, {"currency": {"currencyCode": "j0VPZ4uB", "namespace": "wNXvS34h"}, "item": {"itemId": "gAXePXqO", "itemSku": "WZE3HDtQ", "itemType": "VrWIlaXN"}, "quantity": 51, "type": "CURRENCY"}]}, {"id": "Myk6hLV8", "rewards": [{"currency": {"currencyCode": "SpKf5Jw2", "namespace": "d5X0yhmJ"}, "item": {"itemId": "DEdATy60", "itemSku": "oCVyMQav", "itemType": "A68hp3Xc"}, "quantity": 82, "type": "CURRENCY"}, {"currency": {"currencyCode": "rWNc8WPN", "namespace": "ak6Uojs1"}, "item": {"itemId": "SlSMaBtB", "itemSku": "ri19DC9D", "itemType": "QmDqQCHm"}, "quantity": 25, "type": "ITEM"}, {"currency": {"currencyCode": "e5EkMXHN", "namespace": "wrRt9DVx"}, "item": {"itemId": "YKwHz8jX", "itemSku": "vknvfB6a", "itemType": "encecLgp"}, "quantity": 16, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"dU52R4zw": "7R5UgjKU", "DfCywCV6": "8jxKvlnO", "kmifG2Op": "caYS39c8"}}, {"platform": "XBOX", "platformDlcIdMap": {"LEp0b2LZ": "8jfiMpZR", "97ZLzYXn": "cMXZRONF", "e3oYtjk6": "CZvfNl5b"}}, {"platform": "PSN", "platformDlcIdMap": {"i4up4QFp": "0G3pmJ29", "5qDM0NG2": "zYCeqpv5", "1I61NW5z": "UKXUPIpU"}}]}' \
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
    --appType 'SOFTWARE' \
    --entitlementClazz 'CODE' \
    --entitlementName 'jPAEg3EH' \
    --itemId 'Vtd3ukuY,GNbcGIw3,dmRNcSpz' \
    --limit '70' \
    --offset '76' \
    --userId 'M1n93x1t' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'wJJo43c0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '24' \
    --status 'SUCCESS' \
    --userId 'uycfkp07' \
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
    --body '{"bundleId": "6L2l6VkL", "password": "vpiWUGE1"}' \
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
    --body '{"sandboxId": "IOV000oU"}' \
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
    --body '{"applicationName": "iVbJFgWV", "serviceAccountId": "fRQSmrvN"}' \
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
    --body '{"data": [{"itemIdentity": "ATRXuqmt", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"9Nm9L9rX": "CMP8De5J", "IFmij050": "YdADD8Qa", "5dPl1erp": "XpFaS7H3"}}, {"itemIdentity": "slIf3xQS", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"7tDzSvoh": "qbxC4Lpg", "LCsd5WPd": "vFhiov7C", "oJnsVyUI": "a2lNXphg"}}, {"itemIdentity": "jVT4J0tX", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"V4rWfWPS": "mQGlnRW5", "8FYpUJoN": "rto3P6w1", "ZnPu0Ukc": "ZtixOUr7"}}]}' \
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
    --body '{"environment": "SHpICUpO"}' \
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
    --body '{"appId": "bhNkFm2Z", "publisherAuthenticationKey": "aE0fKQQM"}' \
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
    --body '{"clientId": "L291Bre9", "clientSecret": "oH1Kcurt", "organizationId": "sOTjhCG3"}' \
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
    --body '{"relyingPartyCert": "5Ip7CCQ2"}' \
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
    --password 'XlcE6GiM' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'YUL6BukZ' \
    --itemId 'D5WToX5L' \
    --itemType 'MEDIA' \
    --endTime '8aTZwbdp' \
    --startTime 'Mj3RVtMb' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'rdlZRMev' \
    --itemId 'lnzGLp8a' \
    --itemType 'MEDIA' \
    --endTime '6hYqFQXR' \
    --startTime 'I3aHEWUm' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '95IYIMp8' \
    --body '{"categoryPath": "ItF2blHc", "targetItemId": "IStcOp5V", "targetNamespace": "LFFD3lnO"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PHXGh1oD' \
    --body '{"appId": "g6DynQN8", "appType": "DEMO", "baseAppId": "G1bQaTNv", "boothName": "xd0x0tb9", "categoryPath": "TgsGcTWF", "clazz": "XhUqj7sW", "displayOrder": 22, "entitlementType": "CONSUMABLE", "ext": {"vP9QeGUv": {}, "QgNRFUh2": {}, "l0rUB6bf": {}}, "features": ["VUXUP2cJ", "nB7LiSAF", "cELzuLlX"], "images": [{"as": "69SUC0qg", "caption": "RzEkgTHD", "height": 66, "imageUrl": "iufccKgl", "smallImageUrl": "97YDbB98", "width": 72}, {"as": "ADagiyky", "caption": "u99gnrsQ", "height": 56, "imageUrl": "0arrfe7N", "smallImageUrl": "dtAhiQxC", "width": 69}, {"as": "UO6EtBYt", "caption": "uAhTgYOi", "height": 98, "imageUrl": "Js3Ff4Xy", "smallImageUrl": "fPA1xINK", "width": 2}], "itemIds": ["2NxeLVsg", "loveVtpW", "dNjeHBvs"], "itemQty": {"n0glO0WE": 64, "1KQo555P": 15, "p7PCUMHE": 33}, "itemType": "BUNDLE", "listable": true, "localizations": {"QoEquAx2": {"description": "y32cuOTa", "localExt": {"J8dNZ6mz": {}, "E6bg77re": {}, "gqdUbWKr": {}}, "longDescription": "qPpHNfL9", "title": "C9chU3M9"}, "g0EX0ybD": {"description": "l1GowGvK", "localExt": {"EQLzhpux": {}, "8GTpnntR": {}, "t4bh8JpT": {}}, "longDescription": "axBvt213", "title": "igEkfEsp"}, "pwSr36Ip": {"description": "x9MpCmDD", "localExt": {"aejiIi8W": {}, "zn2yTWGL": {}, "Leg4UXoF": {}}, "longDescription": "thWsqyUE", "title": "0267YAve"}}, "lootBoxConfig": {"rewardCount": 47, "rewards": [{"lootBoxItems": [{"count": 24, "itemId": "Koak5BkA", "itemSku": "2RfBJk6o", "itemType": "WSnm57Ct"}, {"count": 20, "itemId": "YSGZUimJ", "itemSku": "kBKZUWR0", "itemType": "7DtuGfpU"}, {"count": 20, "itemId": "1EuC4rcy", "itemSku": "p8W7UP7R", "itemType": "Foeh0dAB"}], "name": "ZvblIsM5", "odds": 0.526696898740819, "type": "PROBABILITY_GROUP", "weight": 31}, {"lootBoxItems": [{"count": 97, "itemId": "xdQZsGvh", "itemSku": "zOWkxq71", "itemType": "ihMIVj5j"}, {"count": 54, "itemId": "5OjsEr0L", "itemSku": "P8nzx6T6", "itemType": "2FtoMTlp"}, {"count": 87, "itemId": "3vzZ0UK8", "itemSku": "hyXZLz3r", "itemType": "qxLnRavB"}], "name": "5MnycODw", "odds": 0.12389531454825642, "type": "REWARD", "weight": 100}, {"lootBoxItems": [{"count": 63, "itemId": "ST4pAeee", "itemSku": "uZXfMwBb", "itemType": "MGicByLu"}, {"count": 50, "itemId": "G7GBMQ5l", "itemSku": "SbYGZzEY", "itemType": "upNlJS0p"}, {"count": 27, "itemId": "49nthMj9", "itemSku": "W3Knoet6", "itemType": "OZKDgble"}], "name": "ARVjwO9K", "odds": 0.15459551138126393, "type": "REWARD", "weight": 49}]}, "maxCount": 97, "maxCountPerUser": 54, "name": "fmJMvfDG", "optionBoxConfig": {"boxItems": [{"count": 35, "itemId": "lfiomQ4r", "itemSku": "RBp1Jl0J", "itemType": "S3yY84RW"}, {"count": 7, "itemId": "ZrkN2hKX", "itemSku": "zcjWSFqf", "itemType": "GF6J8orH"}, {"count": 76, "itemId": "6oPnEcot", "itemSku": "GdJkY2pY", "itemType": "CSDCYQI6"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 72, "fixedTrialCycles": 9, "graceDays": 25}, "regionData": {"Rk4EUxLd": [{"currencyCode": "PntsRy1z", "currencyNamespace": "prW9On5k", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1975-09-22T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1981-04-20T00:00:00Z", "discountedPrice": 19, "expireAt": "1971-12-02T00:00:00Z", "price": 17, "purchaseAt": "1980-09-29T00:00:00Z", "trialPrice": 44}, {"currencyCode": "Lq80027r", "currencyNamespace": "sdZA52Zw", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1975-06-11T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1981-12-14T00:00:00Z", "discountedPrice": 94, "expireAt": "1977-04-08T00:00:00Z", "price": 13, "purchaseAt": "1985-08-14T00:00:00Z", "trialPrice": 39}, {"currencyCode": "tR2etF3e", "currencyNamespace": "v3amJjEV", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1980-04-20T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1979-01-25T00:00:00Z", "discountedPrice": 99, "expireAt": "1977-05-21T00:00:00Z", "price": 87, "purchaseAt": "1999-04-03T00:00:00Z", "trialPrice": 41}], "QBtmbS0X": [{"currencyCode": "LFVyEi6Q", "currencyNamespace": "kIIQBhYU", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1979-10-13T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1992-07-11T00:00:00Z", "discountedPrice": 19, "expireAt": "1977-06-26T00:00:00Z", "price": 1, "purchaseAt": "1980-10-07T00:00:00Z", "trialPrice": 97}, {"currencyCode": "TQ3skb4u", "currencyNamespace": "if0rOyim", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1989-02-20T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1994-09-01T00:00:00Z", "discountedPrice": 91, "expireAt": "1991-06-26T00:00:00Z", "price": 40, "purchaseAt": "1996-06-18T00:00:00Z", "trialPrice": 93}, {"currencyCode": "dOr0Jxie", "currencyNamespace": "85oe6mlj", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1977-06-15T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1978-08-04T00:00:00Z", "discountedPrice": 56, "expireAt": "1996-11-25T00:00:00Z", "price": 20, "purchaseAt": "1990-12-22T00:00:00Z", "trialPrice": 57}], "Bh2pR6Hj": [{"currencyCode": "VPbsjWSo", "currencyNamespace": "SrjLU8TZ", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1995-11-13T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1978-04-07T00:00:00Z", "discountedPrice": 8, "expireAt": "1999-07-19T00:00:00Z", "price": 96, "purchaseAt": "1985-06-06T00:00:00Z", "trialPrice": 92}, {"currencyCode": "rNybxea7", "currencyNamespace": "eKmanfzf", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1985-10-04T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1981-02-04T00:00:00Z", "discountedPrice": 41, "expireAt": "1995-09-10T00:00:00Z", "price": 83, "purchaseAt": "1992-04-20T00:00:00Z", "trialPrice": 84}, {"currencyCode": "cUzm3Zw6", "currencyNamespace": "J9D48F2K", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1985-04-09T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1993-03-10T00:00:00Z", "discountedPrice": 92, "expireAt": "1987-05-07T00:00:00Z", "price": 73, "purchaseAt": "1998-09-28T00:00:00Z", "trialPrice": 71}]}, "seasonType": "PASS", "sku": "MeXealev", "stackable": true, "status": "INACTIVE", "tags": ["ouB9Fq87", "eQE6S9qM", "FxTiJA8s"], "targetCurrencyCode": "WBccPqYi", "targetNamespace": "ao3SmnHC", "thumbnailUrl": "Bgiy7ayS", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '88E0b54l' \
    --appId 'ucwIWgTi' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate '00dUdYo5' \
    --baseAppId 'kckZQmGs' \
    --categoryPath 'wSowInKd' \
    --features '6igefK4T' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --limit '14' \
    --offset '72' \
    --region 'k02JSPn1' \
    --sortBy 'displayOrder,name:desc' \
    --storeId 'KZcG2yBY' \
    --tags 'Mr8AaxgB' \
    --targetNamespace '5v8sJApi' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'wQW5E9XH,OLrDk1zD,DDIfm0Ge' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LOMfC9JM' \
    --sku 'm31sAbXz' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'wdQUQjug' \
    --populateBundle  \
    --region 'OcDz4TuS' \
    --storeId 'PyDRJyLc' \
    --sku 'sSoNzQlZ' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'wrfPMHZR' \
    --sku 'XRNICjRA' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'CfejISAf,Lj1eGVVr,ClONZ6tV' \
    --storeId 'tdiFuK9Y' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'fTenSBAr' \
    --region 'eTvCE2go' \
    --storeId 'DGdja5jl' \
    --itemIds 'wPZuwGnN' \
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
    --userId 'ILNJkyJQ' \
    --body '{"itemIds": ["0BbNBBwK", "SGYuQu7B", "7RmWSsJu"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'COINS' \
    --limit '2' \
    --offset '40' \
    --sortBy 'GqIYNFb1' \
    --storeId 'TDFWxGBk' \
    --keyword 'sWw9RHVl' \
    --language 'krnar3XR' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '26' \
    --offset '82' \
    --sortBy 'name:desc,name:asc,createdAt:desc' \
    --storeId 'KynNeQ1n' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'LycnyvfS' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'IS99x2yz' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Ouid8NZN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Hma0Obba' \
    --body '{"appId": "mjTF541I", "appType": "SOFTWARE", "baseAppId": "v6jgirDV", "boothName": "g4DGO06l", "categoryPath": "pA9vvm6l", "clazz": "5Gvz5oI9", "displayOrder": 65, "entitlementType": "CONSUMABLE", "ext": {"l4SAim4f": {}, "wBDrlVoz": {}, "WcYOfLoC": {}}, "features": ["xOT1NL0i", "vSLjbL8G", "peuPtuv4"], "images": [{"as": "whw3gXjH", "caption": "qROmpEL6", "height": 31, "imageUrl": "jdmCJwgT", "smallImageUrl": "rh8e8Hpz", "width": 100}, {"as": "CbNq2cCb", "caption": "QTJqCGj5", "height": 81, "imageUrl": "M8IIFmRo", "smallImageUrl": "MKgLGWf2", "width": 15}, {"as": "yDwkpzip", "caption": "WRLl92cI", "height": 74, "imageUrl": "ml2GfyYb", "smallImageUrl": "4IR5Btuz", "width": 91}], "itemIds": ["4krK6wmD", "J7zJA04n", "yqfekwKp"], "itemQty": {"RCpEPAKO": 45, "fDmNGSCz": 60, "CXkI7lNg": 83}, "itemType": "BUNDLE", "listable": true, "localizations": {"owOTPOZ1": {"description": "06WZX7c3", "localExt": {"yFhZ49Ra": {}, "Xs0f3D5s": {}, "ETrCXjnW": {}}, "longDescription": "4eoyj5fS", "title": "m0lZDjQq"}, "NDRDnumz": {"description": "PXov08df", "localExt": {"q5Vid6Ma": {}, "lp0fOtRK": {}, "B4QIxJkz": {}}, "longDescription": "g6YiDi9M", "title": "KPyTOdfk"}, "rJUCEQPV": {"description": "jMUCFVwx", "localExt": {"puDJ4iFo": {}, "P9VlH9tO": {}, "fyxzxQK9": {}}, "longDescription": "2WsqAw0d", "title": "clxADcBf"}}, "lootBoxConfig": {"rewardCount": 19, "rewards": [{"lootBoxItems": [{"count": 77, "itemId": "QTTh6m9a", "itemSku": "KDGFG9Ee", "itemType": "CPJDq3mJ"}, {"count": 87, "itemId": "bg8PxdKF", "itemSku": "yUVI0lIT", "itemType": "1kgDYJr9"}, {"count": 5, "itemId": "IwLb2Ytt", "itemSku": "vll92hCX", "itemType": "zMl8EgOW"}], "name": "AKOi74Ag", "odds": 0.18446121806002103, "type": "REWARD", "weight": 97}, {"lootBoxItems": [{"count": 40, "itemId": "Wn7Z6ptI", "itemSku": "qAk8kOys", "itemType": "ia1h0fm7"}, {"count": 18, "itemId": "geHeKeT5", "itemSku": "JXkKZKM8", "itemType": "7DVfQwvE"}, {"count": 9, "itemId": "M8AfZUjY", "itemSku": "WkwVEnE2", "itemType": "9rs05ebl"}], "name": "tzE88sIh", "odds": 0.9302923627024255, "type": "REWARD", "weight": 77}, {"lootBoxItems": [{"count": 87, "itemId": "Sl1tLOLO", "itemSku": "f7dMfw3H", "itemType": "CHOocHDo"}, {"count": 96, "itemId": "gyjlhzfL", "itemSku": "7iceiRKD", "itemType": "jdgLR7Bd"}, {"count": 44, "itemId": "TKNjOHgm", "itemSku": "Dp2n4HLD", "itemType": "08PygSpy"}], "name": "4DAg7syx", "odds": 0.7606376526537703, "type": "REWARD", "weight": 42}]}, "maxCount": 11, "maxCountPerUser": 1, "name": "eAABuD0S", "optionBoxConfig": {"boxItems": [{"count": 11, "itemId": "VdcnNKxW", "itemSku": "BJeuTbEl", "itemType": "1Q3hnYF4"}, {"count": 94, "itemId": "UK0JlgZ1", "itemSku": "vJpV9TVz", "itemType": "qrOS6rUW"}, {"count": 40, "itemId": "AUCpiE8M", "itemSku": "oA73byGr", "itemType": "NGlUq9Tb"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 30, "fixedTrialCycles": 40, "graceDays": 7}, "regionData": {"mmqJk3QB": [{"currencyCode": "EmHRMk7s", "currencyNamespace": "0BoPxTBJ", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1978-12-03T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1989-08-29T00:00:00Z", "discountedPrice": 89, "expireAt": "1989-01-14T00:00:00Z", "price": 32, "purchaseAt": "1994-12-19T00:00:00Z", "trialPrice": 91}, {"currencyCode": "8LUCOn33", "currencyNamespace": "VJiId9vH", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1983-06-28T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1992-07-30T00:00:00Z", "discountedPrice": 18, "expireAt": "1979-06-02T00:00:00Z", "price": 11, "purchaseAt": "1973-07-05T00:00:00Z", "trialPrice": 89}, {"currencyCode": "sT7Qe4mj", "currencyNamespace": "Aw18yp2X", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1999-12-25T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1993-03-19T00:00:00Z", "discountedPrice": 50, "expireAt": "1983-06-13T00:00:00Z", "price": 6, "purchaseAt": "1971-09-28T00:00:00Z", "trialPrice": 21}], "DH6X9p1V": [{"currencyCode": "mDHPIM6F", "currencyNamespace": "aiOFsQlz", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1999-11-06T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1981-12-06T00:00:00Z", "discountedPrice": 93, "expireAt": "1993-10-16T00:00:00Z", "price": 68, "purchaseAt": "1999-09-25T00:00:00Z", "trialPrice": 85}, {"currencyCode": "Pf24i4q8", "currencyNamespace": "WmQJuykE", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1989-03-04T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1985-11-14T00:00:00Z", "discountedPrice": 7, "expireAt": "1978-07-28T00:00:00Z", "price": 97, "purchaseAt": "1973-06-16T00:00:00Z", "trialPrice": 53}, {"currencyCode": "tCD7CcVs", "currencyNamespace": "uFSVTuIK", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1971-03-22T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1990-06-20T00:00:00Z", "discountedPrice": 91, "expireAt": "1987-09-23T00:00:00Z", "price": 70, "purchaseAt": "1971-03-08T00:00:00Z", "trialPrice": 69}], "FoTmaRIk": [{"currencyCode": "W1tdJW4h", "currencyNamespace": "saKl3q1n", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1971-01-31T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1971-05-04T00:00:00Z", "discountedPrice": 86, "expireAt": "1978-06-10T00:00:00Z", "price": 78, "purchaseAt": "1980-12-27T00:00:00Z", "trialPrice": 53}, {"currencyCode": "joa451I8", "currencyNamespace": "kTSYvhiY", "currencyType": "REAL", "discountAmount": 22, "discountExpireAt": "1983-06-26T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1972-10-28T00:00:00Z", "discountedPrice": 27, "expireAt": "1972-07-19T00:00:00Z", "price": 33, "purchaseAt": "1994-05-01T00:00:00Z", "trialPrice": 28}, {"currencyCode": "EuX493VF", "currencyNamespace": "v0v7cG85", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1983-04-03T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1999-01-10T00:00:00Z", "discountedPrice": 90, "expireAt": "1981-04-28T00:00:00Z", "price": 61, "purchaseAt": "1977-12-04T00:00:00Z", "trialPrice": 8}]}, "seasonType": "TIER", "sku": "OE8Hvkj0", "stackable": false, "status": "ACTIVE", "tags": ["anoInBFP", "zvamrNke", "zvbnPzbG"], "targetCurrencyCode": "ioMkpfkX", "targetNamespace": "3y4JpMk7", "thumbnailUrl": "ZYYSNxTN", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'dbPgHrrm' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'ttLEy7wL' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'i4TxoTar' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 37, "orderNo": "MRkqFTaE"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'T3SIDoab' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'DtTBIsUx' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'x06qYPMf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I9DIHFoH' \
    --body '{"carousel": [{"alt": "ZjqaLFZK", "previewUrl": "0yufSPyu", "thumbnailUrl": "bGbEY89B", "type": "image", "url": "T5MB12Jy", "videoSource": "youtube"}, {"alt": "jYs4paEo", "previewUrl": "Ri3KlgqS", "thumbnailUrl": "fmXNq8HI", "type": "image", "url": "bMbfWtIq", "videoSource": "vimeo"}, {"alt": "rAPf0xVN", "previewUrl": "ne6SrhRE", "thumbnailUrl": "UOLyv2uE", "type": "video", "url": "juYmUkqY", "videoSource": "vimeo"}], "developer": "NN8BTuDR", "forumUrl": "WtvugRc0", "genres": ["Casual", "Racing", "Casual"], "localizations": {"NEeKn7rB": {"announcement": "wSnkEhyB", "slogan": "UFpgDNUs"}, "ZqqMaQqq": {"announcement": "Ubw6sSke", "slogan": "P444Tf7k"}, "4rbGsYdh": {"announcement": "uWa8dzDA", "slogan": "z1C3o2Fp"}}, "platformRequirements": {"97SXh7PH": [{"additionals": "IIOmS6V4", "directXVersion": "Uu4K1eLE", "diskSpace": "VtTPMp31", "graphics": "gRq9DU1K", "label": "yvi1lnty", "osVersion": "YlrBNlza", "processor": "cEcFl7l0", "ram": "mXwXj4aa", "soundCard": "loXYdjJJ"}, {"additionals": "2oFFNhZV", "directXVersion": "6HuJ28Of", "diskSpace": "rY9uRKsV", "graphics": "K1yplTWl", "label": "IX0IaQkV", "osVersion": "ioNie6nz", "processor": "CrMaoavA", "ram": "gU66vRxu", "soundCard": "hVRNRF1q"}, {"additionals": "MF4rWKG0", "directXVersion": "HMRHgWFh", "diskSpace": "WJnfVVog", "graphics": "5wVPaCrK", "label": "kFPNjFuj", "osVersion": "BkQlng2s", "processor": "a4cnLxNE", "ram": "d8ccOKBi", "soundCard": "8bfYfWQL"}], "oKoMAeBI": [{"additionals": "kfaxF0HA", "directXVersion": "AROI8Pv3", "diskSpace": "8UsyrhHI", "graphics": "txCks5aA", "label": "WlHh6GCL", "osVersion": "zf9iChmR", "processor": "fa6gPywz", "ram": "Mz4NHvbt", "soundCard": "6EzIv3QG"}, {"additionals": "XIfAt5Au", "directXVersion": "Hnhappjs", "diskSpace": "kjwSbqWV", "graphics": "KKmX9Nw0", "label": "ObJLwziZ", "osVersion": "VxEaAxYd", "processor": "8gRkTRI6", "ram": "awJ1V8UU", "soundCard": "vvRWl4OG"}, {"additionals": "1yWDj75q", "directXVersion": "tOgTrsUk", "diskSpace": "tAzEZq4B", "graphics": "1PKjVQC5", "label": "9KplPyqK", "osVersion": "TK55LCKK", "processor": "w8d7N0yR", "ram": "OSg9MyAp", "soundCard": "BOwwcoBJ"}], "IB4M1BMQ": [{"additionals": "Kz30mnRw", "directXVersion": "efBoUruU", "diskSpace": "Bstbsk99", "graphics": "MxG4Flno", "label": "DBpuuzTJ", "osVersion": "pyCzlIqw", "processor": "b2BikKNb", "ram": "gNQ74241", "soundCard": "nKMm0Giz"}, {"additionals": "fU3g80oP", "directXVersion": "Q7GanUkI", "diskSpace": "Hc8ZPGtG", "graphics": "WN7uqwd5", "label": "8zmUnMCF", "osVersion": "OCiGV3qX", "processor": "9oCgtxnD", "ram": "RP43MUky", "soundCard": "ZGsdcMPj"}, {"additionals": "YjZcmjII", "directXVersion": "wWJ4gh2g", "diskSpace": "ySRbGg7G", "graphics": "ZaQGX5s1", "label": "pd8pdrbv", "osVersion": "VY8ynIU8", "processor": "GOCW7wuh", "ram": "KzJOUJKT", "soundCard": "P1Itjyc2"}]}, "platforms": ["Android", "MacOS", "Android"], "players": ["Single", "MMO", "Coop"], "primaryGenre": "Action", "publisher": "Dx8fXEjE", "releaseDate": "1981-03-21T00:00:00Z", "websiteUrl": "UQNJpylG"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'yxvpvPVq' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4lIURCTH' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'dVYQuEkk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '2wJw2KVX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XEpqQ4BL' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'SW198VDK' \
    --itemId 'l76D4HWg' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5QnCHNJ3' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'wtL8e2iW' \
    --itemId 'DbeYK9eO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l9j5uWlD' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'xzygQyxr' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'tk7O0Vgv' \
    --populateBundle  \
    --region 'QeFIl5nY' \
    --storeId 'iaZweMIV' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'TROy7LFn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hGHvA0iD' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 49, "comparison": "excludes", "name": "nTMCqhg8", "predicateType": "SeasonTierPredicate", "value": "PT5NM0HL", "values": ["PifRsdDk", "LIRAl9vH", "E5y1Hst3"]}, {"anyOf": 40, "comparison": "is", "name": "qUd0fiF9", "predicateType": "SeasonTierPredicate", "value": "3llwP82x", "values": ["Lgn0H0KI", "ajXBZ0KX", "YjT51s3x"]}, {"anyOf": 36, "comparison": "isNot", "name": "lG0Wd7sv", "predicateType": "EntitlementPredicate", "value": "7Vsprzy8", "values": ["WLNZGnU7", "47Jr9WTU", "shNpBVMu"]}]}, {"operator": "and", "predicates": [{"anyOf": 16, "comparison": "isLessThan", "name": "Nc1LYJFo", "predicateType": "EntitlementPredicate", "value": "oM5s0KKT", "values": ["LCN8S7ha", "W2zafZxl", "ZGhFJZmB"]}, {"anyOf": 56, "comparison": "isGreaterThan", "name": "3FbineYy", "predicateType": "SeasonTierPredicate", "value": "IiVRbkmp", "values": ["zujh9j5A", "xk4W614H", "IJj72vmy"]}, {"anyOf": 45, "comparison": "isLessThanOrEqual", "name": "adbUQf7j", "predicateType": "SeasonPassPredicate", "value": "BNzawawC", "values": ["bRFfe95v", "GBYVo09j", "lpDYgFoQ"]}]}, {"operator": "and", "predicates": [{"anyOf": 28, "comparison": "isLessThan", "name": "NrbTF66z", "predicateType": "EntitlementPredicate", "value": "QB1XzDG0", "values": ["RhYhKngQ", "7T9mS9Cx", "iN6xRTBc"]}, {"anyOf": 44, "comparison": "isGreaterThan", "name": "rUREXUX9", "predicateType": "SeasonPassPredicate", "value": "iwklPj0q", "values": ["GbbwCL9q", "EkxaGyqK", "BOOTSPAH"]}, {"anyOf": 9, "comparison": "isLessThanOrEqual", "name": "JT2xVzEf", "predicateType": "SeasonPassPredicate", "value": "ll6Qk66d", "values": ["jo3X4sTq", "ZPPCT2c4", "24F0OAfn"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'XsaCun9y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "ItDdyp5T"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name 'ZG0l12wu' \
    --offset '40' \
    --tag 'xKvPTKdR' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "uuyPF1DW", "name": "Z1VZVUms", "status": "ACTIVE", "tags": ["Yvy9SI7C", "w9cLkONi", "EEjL48pw"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '3VtyM0Ba' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'qGWK2BzU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "xNIHJukJ", "name": "FZq0vGWI", "status": "ACTIVE", "tags": ["G8e6aSNN", "Bf6JznAa", "H7oZLbnu"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '7q7WRCW0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'ZAEpfxyu' \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '57' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'HE1UoyYu' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Gt7ROH1F' \
    --limit '27' \
    --offset '0' \
    --orderNos 'O9Gax0oj,yE55KTgi,EqGJuQYX' \
    --sortBy 'PSM01F1S' \
    --startTime 'VjWkvxGb' \
    --status 'REFUNDING' \
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
    --orderNo 'd6UvoPQ7' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8orkAb0I' \
    --body '{"description": "DrTedgQO"}' \
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
    --body '{"dryRun": true, "notifyUrl": "cglXk5BH", "privateKey": "0ojLhNco"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'L4KlZcvo' \
    --externalId 'ec7S6Bu4' \
    --limit '29' \
    --notificationSource 'WALLET' \
    --notificationType 'KZfeZtrn' \
    --offset '60' \
    --paymentOrderNo 'BTz8F2BN' \
    --startDate '3E0RmsoM' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId '0q9LKWbT' \
    --limit '76' \
    --offset '94' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "Ha9vjZtJ", "currencyNamespace": "BOKcDCQn", "customParameters": {"oVaSKDdk": {}, "ggXVgktl": {}, "DTcvBItJ": {}}, "description": "L7s3Gqzg", "extOrderNo": "BXmTDAwq", "extUserId": "eUR9VaUd", "itemType": "CODE", "language": "AO_191", "metadata": {"1eu6e6pt": "wKADIMhD", "XOZvnjWd": "ZYfDtbUb", "9FupRaLy": "RCxgqDCH"}, "notifyUrl": "VIr7sT1i", "omitNotification": false, "platform": "TpGckpt3", "price": 14, "recurringPaymentOrderNo": "p16VZeUW", "region": "LbvVkY1J", "returnUrl": "HyvFCX2i", "sandbox": false, "sku": "iconqfSz", "subscriptionId": "OndcLf7M", "targetNamespace": "2kJy57bE", "targetUserId": "LAJ2VVow", "title": "WnkJHF14"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'qUz6VovL' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '92eoojfi' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JwdYrzoX' \
    --body '{"extTxId": "bdiQLe3Y", "paymentMethod": "3GaqnK8O", "paymentProvider": "STRIPE"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '69P6sahU' \
    --body '{"description": "6Ovn4maF"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'l5pp9ing' \
    --body '{"amount": 71, "currencyCode": "MUNROl0T", "notifyType": "CHARGE", "paymentProvider": "STRIPE", "salesTax": 47, "vat": 34}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dHJBbCAZ' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["Epic", "System", "Other"]}' \
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
    --body '{"description": "wbHkpA8j", "eventTopic": "3OBrBLUZ", "maxAwarded": 1, "maxAwardedPerUser": 94, "namespaceExpression": "jJYKRwxC", "rewardCode": "graUs7Q4", "rewardConditions": [{"condition": "tPx2pqVF", "conditionName": "ZJlqiMl5", "eventName": "LRtWkIIy", "rewardItems": [{"duration": 73, "itemId": "IIm2EFEX", "quantity": 17}, {"duration": 88, "itemId": "YUhyk2ZR", "quantity": 62}, {"duration": 82, "itemId": "YvErOUfB", "quantity": 42}]}, {"condition": "nN3vRb3D", "conditionName": "owB1Jvyf", "eventName": "NGHaa989", "rewardItems": [{"duration": 51, "itemId": "IKDCb6dJ", "quantity": 86}, {"duration": 12, "itemId": "5YPNX6AQ", "quantity": 73}, {"duration": 73, "itemId": "sT7002z2", "quantity": 100}]}, {"condition": "UqqV4n1D", "conditionName": "DYnusHVw", "eventName": "7Y2LSgGv", "rewardItems": [{"duration": 19, "itemId": "vUnmcBLU", "quantity": 60}, {"duration": 98, "itemId": "C5cggNZN", "quantity": 9}, {"duration": 59, "itemId": "j1pFp5FS", "quantity": 71}]}], "userIdExpression": "PgnwmOeg"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'eNy7RG29' \
    --limit '0' \
    --offset '37' \
    --sortBy 'rewardCode:asc,namespace:asc,namespace:desc' \
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
    --rewardId 'oNywFzE0' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'nyz5QnzI' \
    --body '{"description": "gQR4SK6G", "eventTopic": "PKDMMnst", "maxAwarded": 79, "maxAwardedPerUser": 98, "namespaceExpression": "JUOJPKUm", "rewardCode": "BTYcji9U", "rewardConditions": [{"condition": "PIViHPsZ", "conditionName": "1HEtQBBP", "eventName": "I8Jr9uzW", "rewardItems": [{"duration": 65, "itemId": "RPCxbe8G", "quantity": 47}, {"duration": 44, "itemId": "ISV8WSGo", "quantity": 73}, {"duration": 17, "itemId": "rqdkQMfb", "quantity": 31}]}, {"condition": "4ajo3TL1", "conditionName": "dBr5MyUN", "eventName": "txNURRb2", "rewardItems": [{"duration": 19, "itemId": "PvU7r9dh", "quantity": 36}, {"duration": 11, "itemId": "XqeoH4OU", "quantity": 72}, {"duration": 73, "itemId": "dK9BNDAu", "quantity": 31}]}, {"condition": "BG2FN9A0", "conditionName": "4muizxA7", "eventName": "J0P4hd21", "rewardItems": [{"duration": 22, "itemId": "QmVu2YUt", "quantity": 12}, {"duration": 71, "itemId": "HU5eXgn3", "quantity": 51}, {"duration": 84, "itemId": "TPmDe6yG", "quantity": 57}]}], "userIdExpression": "z549FggS"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ahri2f58' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'k5bblLC7' \
    --body '{"payload": {"N8gfLSrF": {}, "wm8qWesb": {}, "L9ttT2Ia": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4jWfJIe6' \
    --body '{"conditionName": "Gz1FEhEh", "userId": "umoCIyGG"}' \
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
    --body '{"defaultLanguage": "5KaN9EAq", "defaultRegion": "KQCojVpJ", "description": "pYw7f0xV", "supportedLanguages": ["7jmRoObm", "bxqlWWOi", "8bRLZ3vD"], "supportedRegions": ["nLPWv0EK", "rzwgvfDN", "O7vQJVaf"], "title": "yiaHs73t"}' \
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
    --storeId 'ky9hceSf' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DKE0tu5N' \
    --body '{"defaultLanguage": "FvMThVHz", "defaultRegion": "UPv6LsJj", "description": "BgCgkBZn", "supportedLanguages": ["Ykx6Yh52", "hywuySUm", "2e633ylY"], "supportedRegions": ["53d2GVOf", "SBO2L1Ni", "2osJmVqr"], "title": "BA2VINMR"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YWfhmN48' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fJ0re77e' \
    --action 'UPDATE' \
    --itemSku 'uicHiNhx' \
    --itemType 'APP' \
    --limit '79' \
    --offset '83' \
    --selected  \
    --sortBy 'updatedAt:asc,updatedAt' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'fUGjuMSq' \
    --updatedAtStart '8mctbFyB' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'i8mNuOVa' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zlVt32Ql' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DAcZbh0M' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qg8WUQHT' \
    --action 'DELETE' \
    --itemSku 'Ro8cTSyB' \
    --itemType 'SEASON' \
    --type 'ITEM' \
    --updatedAtEnd 'ONXosnd8' \
    --updatedAtStart 'XYIHZtlV' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Jx6zOpzG' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'mkqfcgbw' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x0w5Bgb6' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'mH4guWaS' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3q4tel4v' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X4TERDTx' \
    --targetStoreId 'Ua1ZqBDm' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'aHGDOCit' \
    --limit '22' \
    --offset '87' \
    --sku 'tgQBj03z' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId 'GoGSQECx' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZewDf3hO' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'nY2EA7gD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'nJnYlZ2S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "H1n71EMj"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '7vgiGecX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'cvar9s9v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 96, "orderNo": "DutKUB5A"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWTkAOqd' \
    --body '{"achievements": [{"id": "mjz73QO7", "value": 70}, {"id": "1f4tVsBE", "value": 71}, {"id": "ag555JhM", "value": 80}], "steamUserId": "Qo5LJnWD"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '1xWEtEpg' \
    --xboxUserId 'DUXMb2N6' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MyPovSsH' \
    --body '{"achievements": [{"id": "8BfgvnRo", "percentComplete": 38}, {"id": "C3usR0KW", "percentComplete": 7}, {"id": "rhZTtHwx", "percentComplete": 1}], "serviceConfigId": "anC0Nlau", "titleId": "PgtxGdmK", "xboxUserId": "UVPaeqs6"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'CoLGLWbJ' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'DpAZwC44' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '6F8HIG2D' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ahp5EfeW' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9oh1d9t' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'EJVuBRSd' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'N6y7tmnc' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZxshOi5m' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'IHULu3G8' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 182 'GetUserDLC' test.out

#- 183 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '4YvVlvTX' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'hb51UoiB' \
    --features 'rLZiRjaF,Kjj89nvc,J6GEqIqS' \
    --itemId 'oLQgT1wt,htYUSTp9,rH7T15Zu' \
    --limit '19' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 183 'QueryUserEntitlements' test.out

#- 184 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'G3ayEhoE' \
    --body '[{"endDate": "1977-01-13T00:00:00Z", "grantedCode": "k3M3jQJE", "itemId": "6Vv2DZ1k", "itemNamespace": "l7SqdyFj", "language": "phgX_dmjh_535", "quantity": 3, "region": "aAwp5tVD", "source": "REWARD", "startDate": "1999-12-21T00:00:00Z", "storeId": "mebHVAgj"}, {"endDate": "1974-07-18T00:00:00Z", "grantedCode": "d8Xo9MDf", "itemId": "15uNo9pV", "itemNamespace": "CgJc5W99", "language": "cD_217", "quantity": 80, "region": "MvcwCOlO", "source": "GIFT", "startDate": "1982-02-03T00:00:00Z", "storeId": "mLQc8pLl"}, {"endDate": "1978-03-19T00:00:00Z", "grantedCode": "48Av41gd", "itemId": "aWkyEmDd", "itemNamespace": "e45o1V08", "language": "aU_SeqP_NY", "quantity": 21, "region": "Iglf8GLO", "source": "GIFT", "startDate": "1986-09-10T00:00:00Z", "storeId": "TeuWIo5I"}]' \
    > test.out 2>&1
eval_tap $? 184 'GrantUserEntitlement' test.out

#- 185 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'gvzyOspl' \
    --activeOnly  \
    --appId 'UOI5bmNs' \
    > test.out 2>&1
eval_tap $? 185 'GetUserAppEntitlementByAppId' test.out

#- 186 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'gadhxURK' \
    --activeOnly  \
    --limit '52' \
    --offset '89' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 186 'QueryUserEntitlementsByAppType' test.out

#- 187 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '1Ky95u1z' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --itemId 'iHWSWtga' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementByItemId' test.out

#- 188 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 's1LNl81G' \
    --ids 'muruOVLb,PwmvCv3k,DvpaAE0B' \
    > test.out 2>&1
eval_tap $? 188 'GetUserActiveEntitlementsByItemIds' test.out

#- 189 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'xfyFWoM1' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --sku 'eT8gDEcn' \
    > test.out 2>&1
eval_tap $? 189 'GetUserEntitlementBySku' test.out

#- 190 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjpXcJmR' \
    --appIds 'ZQbJqsnc,dFh3Yo0e,fHpSdRW7' \
    --itemIds 'j6incJM4,uuHdFFS0,1mIiqSrL' \
    --skus 'ayn10ExJ,3X75pBYN,bn6xNGtC' \
    > test.out 2>&1
eval_tap $? 190 'ExistsAnyUserActiveEntitlement' test.out

#- 191 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'pOQkcgDF' \
    --itemIds 'gDdRnyVo,y8L9Efal,CsWJ86BY' \
    > test.out 2>&1
eval_tap $? 191 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 192 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '09SGbrLr' \
    --appId 'HM0rjDxm' \
    > test.out 2>&1
eval_tap $? 192 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 193 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'axWfVQ3I' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'dzoUQN1d' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipByItemId' test.out

#- 194 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'RrJ0BKiO' \
    --ids 'doak2GoK,2OIz5W3G,PiZ7jWZR' \
    > test.out 2>&1
eval_tap $? 194 'GetUserEntitlementOwnershipByItemIds' test.out

#- 195 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'SeubJUuk' \
    --entitlementClazz 'CODE' \
    --sku 'rCd3IHFy' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlementOwnershipBySku' test.out

#- 196 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'QXQuWrLB' \
    --entitlementIds 'fpejRsfm' \
    > test.out 2>&1
eval_tap $? 196 'RevokeUserEntitlements' test.out

#- 197 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'YuYj8LoQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MdgxKO6f' \
    > test.out 2>&1
eval_tap $? 197 'GetUserEntitlement' test.out

#- 198 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'J0SUHczf' \
    --namespace "$AB_NAMESPACE" \
    --userId '48NGTsT7' \
    --body '{"endDate": "1972-08-26T00:00:00Z", "nullFieldList": ["ZU3wASN1", "vDVEVO0n", "4DJB0poD"], "startDate": "1987-06-11T00:00:00Z", "status": "REVOKED", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 198 'UpdateUserEntitlement' test.out

#- 199 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'IIgT5H6a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eemFzmvD' \
    --body '{"options": ["KAt6sPAf", "flEgt2qn", "dttO5C9I"], "requestId": "EPI44I30", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 199 'ConsumeUserEntitlement' test.out

#- 200 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '8bwwIIFr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GWQ4FCe1' \
    > test.out 2>&1
eval_tap $? 200 'DisableUserEntitlement' test.out

#- 201 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'Cdbifjzc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'piQabDOy' \
    > test.out 2>&1
eval_tap $? 201 'EnableUserEntitlement' test.out

#- 202 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'NgLXPY77' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZkwaWtxr' \
    > test.out 2>&1
eval_tap $? 202 'GetUserEntitlementHistories' test.out

#- 203 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'pf7t4Usg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OLIRteiq' \
    > test.out 2>&1
eval_tap $? 203 'RevokeUserEntitlement' test.out

#- 204 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'jDzyovyj' \
    --body '{"duration": 6, "endDate": "1995-07-15T00:00:00Z", "itemId": "N3IlW4Bd", "itemSku": "TNPnNDo9", "language": "xgKU5HSh", "order": {"currency": {"currencyCode": "OJq2g9iF", "currencySymbol": "IfwS50N4", "currencyType": "REAL", "decimals": 30, "namespace": "jsGuvLWO"}, "ext": {"6prcQKMY": {}, "tNIKQBuj": {}, "2SQG3tOJ": {}}, "free": false}, "orderNo": "HdNx8dB7", "origin": "IOS", "quantity": 56, "region": "t5A7I0Jo", "source": "GIFT", "startDate": "1981-02-28T00:00:00Z", "storeId": "CVVpwIPu"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillItem' test.out

#- 205 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '1jYW98DX' \
    --body '{"code": "NXdadIgU", "language": "YlUM-lDvh", "region": "uyqy8sU6"}' \
    > test.out 2>&1
eval_tap $? 205 'RedeemCode' test.out

#- 206 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '9REfaQqI' \
    --body '{"origin": "Other", "rewards": [{"currency": {"currencyCode": "eNFyn2n5", "namespace": "vhR2ajYm"}, "item": {"itemId": "qhSr0DGx", "itemSku": "jm6XqrFo", "itemType": "3zKPFTBd"}, "quantity": 17, "type": "CURRENCY"}, {"currency": {"currencyCode": "hpBmr4EL", "namespace": "mG4vIlyE"}, "item": {"itemId": "KDthI2Fk", "itemSku": "8pgm4Edk", "itemType": "f2NHr1Pl"}, "quantity": 13, "type": "CURRENCY"}, {"currency": {"currencyCode": "pwbRz67E", "namespace": "6EvDgBa5"}, "item": {"itemId": "6klDEuiM", "itemSku": "8S6GsWf7", "itemType": "p8vERSmB"}, "quantity": 37, "type": "ITEM"}], "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 206 'FulfillRewards' test.out

#- 207 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'a7qVcWdw' \
    --endTime 'o2d7Af7s' \
    --limit '50' \
    --offset '7' \
    --productId 'dvfGQPeI' \
    --startTime '3prpDbpj' \
    --status 'VERIFIED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserIAPOrders' test.out

#- 208 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'OH8Il2Il' \
    > test.out 2>&1
eval_tap $? 208 'QueryAllUserIAPOrders' test.out

#- 209 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'GOeByZSj' \
    --endTime '0DMqNQkk' \
    --limit '40' \
    --offset '7' \
    --startTime 'N6yt8te3' \
    --status 'PENDING' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserIAPConsumeHistory' test.out

#- 210 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'T4CNQrO8' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "Hh-LjDx_is", "productId": "DBVDlfmX", "region": "am546nEE", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 210 'MockFulfillIAPItem' test.out

#- 211 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '9nfaBxpq' \
    --itemId '808NJ0el' \
    --limit '4' \
    --offset '3' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 211 'QueryUserOrders' test.out

#- 212 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'yoUbjPdV' \
    --body '{"currencyCode": "pHprzNIS", "currencyNamespace": "qgp3donA", "discountedPrice": 56, "ext": {"lfrI2PuX": {}, "I7tsCfLn": {}, "yX4vTDRO": {}}, "itemId": "iFEGdxDS", "language": "Q3926lwD", "options": {"skipPriceValidation": true}, "platform": "Steam", "price": 45, "quantity": 34, "region": "FSZucJZ3", "returnUrl": "duMxLp4U", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 212 'AdminCreateUserOrder' test.out

#- 213 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdI5B1Ze' \
    --itemId 'o0wUU5fR' \
    > test.out 2>&1
eval_tap $? 213 'CountOfPurchasedItem' test.out

#- 214 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qqUY7sjB' \
    --userId 'CRyiLPWr' \
    > test.out 2>&1
eval_tap $? 214 'GetUserOrder' test.out

#- 215 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3rMdvF8O' \
    --userId 'VvMogiF1' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "bCYF1PkT"}' \
    > test.out 2>&1
eval_tap $? 215 'UpdateUserOrderStatus' test.out

#- 216 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'P8Upz9i4' \
    --userId 'rqZRshCb' \
    > test.out 2>&1
eval_tap $? 216 'FulfillUserOrder' test.out

#- 217 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tE0FB9Gz' \
    --userId 'NskZILpu' \
    > test.out 2>&1
eval_tap $? 217 'GetUserOrderGrant' test.out

#- 218 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kpYb7NM6' \
    --userId 'w9jb8eQR' \
    > test.out 2>&1
eval_tap $? 218 'GetUserOrderHistories' test.out

#- 219 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gKObPHOW' \
    --userId '0k8vjnD4' \
    --body '{"additionalData": {"cardSummary": "E0LLnT95"}, "authorisedTime": "1979-01-20T00:00:00Z", "chargebackReversedTime": "1973-10-08T00:00:00Z", "chargebackTime": "1994-06-21T00:00:00Z", "chargedTime": "1973-11-25T00:00:00Z", "createdTime": "1985-04-04T00:00:00Z", "currency": {"currencyCode": "1kkFS89D", "currencySymbol": "lWi90l0a", "currencyType": "REAL", "decimals": 33, "namespace": "ilyAhdRm"}, "customParameters": {"Y7fFZ6Tg": {}, "CwY6ryY4": {}, "PFp6YzAg": {}}, "extOrderNo": "AxkWklyH", "extTxId": "F7VKkMAZ", "extUserId": "D8jXwiNq", "issuedAt": "1982-07-16T00:00:00Z", "metadata": {"oRfnqXBG": "zzxsXFnw", "nyzmjNsW": "PjqOFsvE", "xbnTDCMz": "7iC6YkJz"}, "namespace": "nlKGNgaR", "nonceStr": "bo1MwKl0", "paymentMethod": "rqDQXWi7", "paymentMethodFee": 99, "paymentOrderNo": "1r9mtQ9E", "paymentProvider": "CHECKOUT", "paymentProviderFee": 99, "paymentStationUrl": "yRogJVgI", "price": 45, "refundedTime": "1972-11-11T00:00:00Z", "salesTax": 75, "sandbox": true, "sku": "0cTuHyOX", "status": "CHARGE_FAILED", "statusReason": "JZ3TyqVi", "subscriptionId": "SCyS7d73", "subtotalPrice": 98, "targetNamespace": "Ri7ValzE", "targetUserId": "TTujis7p", "tax": 51, "totalPrice": 65, "totalTax": 68, "txEndTime": "1999-12-25T00:00:00Z", "type": "dLtBfBY3", "userId": "fGvYCtSS", "vat": 66}' \
    > test.out 2>&1
eval_tap $? 219 'ProcessUserOrderNotification' test.out

#- 220 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FhJM9TQA' \
    --userId 'TOYji8a9' \
    > test.out 2>&1
eval_tap $? 220 'DownloadUserOrderReceipt' test.out

#- 221 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'fOaIaewh' \
    --body '{"currencyCode": "1XRxUYSS", "currencyNamespace": "pFEZUawU", "customParameters": {"CAqLXnjL": {}, "QeQEO9oM": {}, "EDNObh6K": {}}, "description": "YuUG1aCU", "extOrderNo": "1b3bNqUQ", "extUserId": "KWb8h7d0", "itemType": "COINS", "language": "aY_877", "metadata": {"wK2Goshj": "QcfYDPF2", "9kgxWprF": "XUO2oLg7", "KS9ApYa2": "vm62Shqa"}, "notifyUrl": "M3eYZYef", "omitNotification": true, "platform": "AqmICmeA", "price": 65, "recurringPaymentOrderNo": "osQKld05", "region": "a3Jva1yI", "returnUrl": "oN6ZTppu", "sandbox": false, "sku": "MhIKqWPQ", "subscriptionId": "oHYxbsOo", "title": "iBzRnchF"}' \
    > test.out 2>&1
eval_tap $? 221 'CreateUserPaymentOrder' test.out

#- 222 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2lzoZ4gp' \
    --userId '78R1WYuv' \
    --body '{"description": "EHqeQ54o"}' \
    > test.out 2>&1
eval_tap $? 222 'RefundUserPaymentOrder' test.out

#- 223 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '5W5ZZubL' \
    --body '{"code": "FaiNqI6x", "orderNo": "nrCZmE7I"}' \
    > test.out 2>&1
eval_tap $? 223 'ApplyUserRedemption' test.out

#- 224 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'nh5WsnK0' \
    --chargeStatus 'SETUP' \
    --itemId 'zqKXT5UT' \
    --limit '8' \
    --offset '74' \
    --sku 'CRq2bDeO' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 224 'QueryUserSubscriptions' test.out

#- 225 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'J8hHGawA' \
    --excludeSystem  \
    --limit '65' \
    --offset '93' \
    --subscriptionId 'kjdD0SZR' \
    > test.out 2>&1
eval_tap $? 225 'GetUserSubscriptionActivities' test.out

#- 226 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'n03xRmjH' \
    --body '{"grantDays": 53, "itemId": "M6euznHb", "language": "u4aU7eim", "reason": "09s8Lcq5", "region": "bZLmzL5m", "source": "aciUUvSD"}' \
    > test.out 2>&1
eval_tap $? 226 'PlatformSubscribeSubscription' test.out

#- 227 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'AkPWXgZI' \
    --itemId 'pmEIQBwo' \
    > test.out 2>&1
eval_tap $? 227 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 228 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'YNfZS5DG' \
    --userId '0VJHYNs0' \
    > test.out 2>&1
eval_tap $? 228 'GetUserSubscription' test.out

#- 229 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'D7TGRnLA' \
    --userId 'nKRJZsLA' \
    > test.out 2>&1
eval_tap $? 229 'DeleteUserSubscription' test.out

#- 230 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iqeCdxAb' \
    --userId 'ZfffWPDZ' \
    --force  \
    --body '{"immediate": false, "reason": "mJU4TUu0"}' \
    > test.out 2>&1
eval_tap $? 230 'CancelSubscription' test.out

#- 231 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'sOhprYtR' \
    --userId 'dXhxqAF6' \
    --body '{"grantDays": 81, "reason": "ilMMtHca"}' \
    > test.out 2>&1
eval_tap $? 231 'GrantDaysToSubscription' test.out

#- 232 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IrIOHIgP' \
    --userId 'dJoW877m' \
    --excludeFree  \
    --limit '14' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 232 'GetUserSubscriptionBillingHistories' test.out

#- 233 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0kFCgvDJ' \
    --userId 'EGEtRJu6' \
    --body '{"additionalData": {"cardSummary": "aJxoCkMp"}, "authorisedTime": "1992-02-23T00:00:00Z", "chargebackReversedTime": "1996-09-27T00:00:00Z", "chargebackTime": "1975-05-17T00:00:00Z", "chargedTime": "1975-12-03T00:00:00Z", "createdTime": "1974-09-02T00:00:00Z", "currency": {"currencyCode": "rfBTM2ZT", "currencySymbol": "JJK6LBnu", "currencyType": "REAL", "decimals": 78, "namespace": "qrYdWHIF"}, "customParameters": {"NQbzadtX": {}, "abeC2kZL": {}, "6BjnOioR": {}}, "extOrderNo": "hOFC7ROI", "extTxId": "aTNp3heH", "extUserId": "YGD0kucN", "issuedAt": "1985-01-02T00:00:00Z", "metadata": {"cscVzGnC": "ozdrMlaN", "hzbrm7wA": "zDwKCLn5", "vsUb8rWG": "aIwhlIzu"}, "namespace": "M9Toznm9", "nonceStr": "XVYRPCat", "paymentMethod": "47vuqVRy", "paymentMethodFee": 83, "paymentOrderNo": "knkn3j1v", "paymentProvider": "ADYEN", "paymentProviderFee": 16, "paymentStationUrl": "hwYt9RNF", "price": 68, "refundedTime": "1973-07-29T00:00:00Z", "salesTax": 63, "sandbox": false, "sku": "Ayb6umFm", "status": "REQUEST_FOR_INFORMATION", "statusReason": "2N6sCECC", "subscriptionId": "ydPP9YGm", "subtotalPrice": 66, "targetNamespace": "8oAYwKB2", "targetUserId": "fxOMAKbB", "tax": 75, "totalPrice": 88, "totalTax": 31, "txEndTime": "1972-11-24T00:00:00Z", "type": "LbbMnhYm", "userId": "RL7xmzhO", "vat": 76}' \
    > test.out 2>&1
eval_tap $? 233 'ProcessUserSubscriptionNotification' test.out

#- 234 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'Mh7o04sF' \
    --namespace "$AB_NAMESPACE" \
    --userId '8v2avmsE' \
    --body '{"count": 59, "orderNo": "o3Zt0itI"}' \
    > test.out 2>&1
eval_tap $? 234 'AcquireUserTicket' test.out

#- 235 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '7sKHYxM9' \
    > test.out 2>&1
eval_tap $? 235 'QueryUserCurrencyWallets' test.out

#- 236 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'ghlJKQvB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XAqi334N' \
    --limit '28' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 236 'ListUserCurrencyTransactions' test.out

#- 237 CheckWallet
eval_tap 0 237 'CheckWallet # SKIP deprecated' test.out

#- 238 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'ZHBBHg4Q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FsN2WFtv' \
    --body '{"amount": 86, "expireAt": "1976-02-16T00:00:00Z", "origin": "Other", "reason": "CZcK7ylk", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 238 'CreditUserWallet' test.out

#- 239 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'Aefu4e5D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kekIRs8q' \
    --body '{"amount": 56, "walletPlatform": "Xbox"}' \
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
    --nextEvaluatedKey 'Oq2V7v6r' \
    --end 'AJbFhnAn' \
    --start 'vvR3tog5' \
    > test.out 2>&1
eval_tap $? 247 'SyncOrders' test.out

#- 248 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["npDnCzu4", "EqGu1NKQ", "8UmDK7BO"], "apiKey": "VCWjOJUG", "authoriseAsCapture": true, "blockedPaymentMethods": ["p45MNNvU", "PtpiXSFN", "dn8t6KTN"], "clientKey": "prwSDFc0", "dropInSettings": "YQvtaqVh", "liveEndpointUrlPrefix": "Pk3dwOdZ", "merchantAccount": "ruQpVOGw", "notificationHmacKey": "u3nUahkW", "notificationPassword": "XvTAjCBm", "notificationUsername": "yqLlJ9v1", "returnUrl": "B0G7ucfO", "settings": "AxhNXNRZ"}' \
    > test.out 2>&1
eval_tap $? 248 'TestAdyenConfig' test.out

#- 249 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "PSUArSnJ", "privateKey": "Tme5d1Zs", "publicKey": "0euJawUp", "returnUrl": "AR5Lw1gF"}' \
    > test.out 2>&1
eval_tap $? 249 'TestAliPayConfig' test.out

#- 250 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "n9rIIoDV", "secretKey": "g113e528"}' \
    > test.out 2>&1
eval_tap $? 250 'TestCheckoutConfig' test.out

#- 251 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'IFKt6rwm' \
    > test.out 2>&1
eval_tap $? 251 'DebugMatchedPaymentMerchantConfig' test.out

#- 252 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "vIFqxXRk", "clientSecret": "MQ2Flh7T", "returnUrl": "oiZWUMlK", "webHookId": "hP63C9lv"}' \
    > test.out 2>&1
eval_tap $? 252 'TestPayPalConfig' test.out

#- 253 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["WClU3BHk", "SgPhgjCd", "1zWw2XJr"], "publishableKey": "t3B8c6ig", "secretKey": "vHghhjf3", "webhookSecret": "hjyVHkFJ"}' \
    > test.out 2>&1
eval_tap $? 253 'TestStripeConfig' test.out

#- 254 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "a8HJ8mFV", "key": "L9gTLmmZ", "mchid": "LEsxtIjO", "returnUrl": "GxLp5mX4"}' \
    > test.out 2>&1
eval_tap $? 254 'TestWxPayConfig' test.out

#- 255 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "GArbmkeI", "flowCompletionUrl": "yHoXl25C", "merchantId": 21, "projectId": 9, "projectSecretKey": "KsVt94s3"}' \
    > test.out 2>&1
eval_tap $? 255 'TestXsollaConfig' test.out

#- 256 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'vFZQH379' \
    > test.out 2>&1
eval_tap $? 256 'GetPaymentMerchantConfig' test.out

#- 257 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'ft4D9tTB' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["nUarjIVZ", "jFgrhcR8", "63EdLr4x"], "apiKey": "lz8ZH8Mt", "authoriseAsCapture": true, "blockedPaymentMethods": ["TewgrB7M", "mdilzE2p", "yaEubLep"], "clientKey": "1Up7uX4u", "dropInSettings": "nWEJNg3U", "liveEndpointUrlPrefix": "tlO2YiD0", "merchantAccount": "6PbULZyp", "notificationHmacKey": "XNQh7rXJ", "notificationPassword": "fGSRKuwG", "notificationUsername": "WyBm4eVg", "returnUrl": "7wPLavpx", "settings": "kn6JvShF"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateAdyenConfig' test.out

#- 258 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'WhDNckIR' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestAdyenConfigById' test.out

#- 259 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'S03pkJSc' \
    --sandbox  \
    --validate  \
    --body '{"appId": "F2J02WQW", "privateKey": "zFMmF2HZ", "publicKey": "c4CllEXd", "returnUrl": "xnl1blqc"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateAliPayConfig' test.out

#- 260 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '4iNCcYgj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestAliPayConfigById' test.out

#- 261 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'xxVebe3Z' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "PHzcJ4sP", "secretKey": "xsEshmzQ"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateCheckoutConfig' test.out

#- 262 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'TYs8NiON' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestCheckoutConfigById' test.out

#- 263 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'JuOGAp8h' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "34c00Z1f", "clientSecret": "7uav4tpE", "returnUrl": "9VoUvslI", "webHookId": "zwRcLsQA"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdatePayPalConfig' test.out

#- 264 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'f4NijmSR' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 264 'TestPayPalConfigById' test.out

#- 265 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'T3AZW6mS' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["nqFWEIIS", "SonHebfB", "uojCHrQc"], "publishableKey": "avMmoftz", "secretKey": "CjAwSPKg", "webhookSecret": "K7T6bDge"}' \
    > test.out 2>&1
eval_tap $? 265 'UpdateStripeConfig' test.out

#- 266 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'ct1QG7sU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 266 'TestStripeConfigById' test.out

#- 267 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'XmtJ8hGO' \
    --validate  \
    --body '{"appId": "UYYY7emm", "key": "E4oUtpTf", "mchid": "B2hY6Uuf", "returnUrl": "SQyVRx7I"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateWxPayConfig' test.out

#- 268 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'OMXFk1vG' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 268 'UpdateWxPayConfigCert' test.out

#- 269 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'hgR430Ev' \
    > test.out 2>&1
eval_tap $? 269 'TestWxPayConfigById' test.out

#- 270 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'lYzAI5cQ' \
    --validate  \
    --body '{"apiKey": "KNRyO3bK", "flowCompletionUrl": "jJDn5icf", "merchantId": 46, "projectId": 69, "projectSecretKey": "k12ht4bH"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateXsollaConfig' test.out

#- 271 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'rvYFm7zK' \
    > test.out 2>&1
eval_tap $? 271 'TestXsollaConfigById' test.out

#- 272 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'E6JElBFp' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 272 'UpdateXsollaUIConfig' test.out

#- 273 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '89' \
    --namespace "$AB_NAMESPACE" \
    --offset '76' \
    --region 'DAKbyLzH' \
    > test.out 2>&1
eval_tap $? 273 'QueryPaymentProviderConfig' test.out

#- 274 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "9oTdjN2u", "region": "Zhn8Yqjc", "sandboxTaxJarApiToken": "7njH8AqV", "specials": ["XSOLLA", "WALLET", "WALLET"], "taxJarApiToken": "j00mfsDp", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 274 'CreatePaymentProviderConfig' test.out

#- 275 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 275 'GetAggregatePaymentProviders' test.out

#- 276 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'KpH4xhGQ' \
    > test.out 2>&1
eval_tap $? 276 'DebugMatchedPaymentProviderConfig' test.out

#- 277 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 277 'GetSpecialPaymentProviders' test.out

#- 278 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'J9kqIfkK' \
    --body '{"aggregate": "XSOLLA", "namespace": "FeVWiLZX", "region": "qBcJzemq", "sandboxTaxJarApiToken": "dmo5mpiW", "specials": ["WALLET", "STRIPE", "PAYPAL"], "taxJarApiToken": "QSuEsG7U", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 278 'UpdatePaymentProviderConfig' test.out

#- 279 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'jV0JZyiK' \
    > test.out 2>&1
eval_tap $? 279 'DeletePaymentProviderConfig' test.out

#- 280 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 280 'GetPaymentTaxConfig' test.out

#- 281 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "eOFsfGRp", "taxJarApiToken": "5HUfOaGd", "taxJarEnabled": false, "taxJarProductCodesMapping": {"I10oOkQt": "ucVyPXP6", "NDc5OdWn": "XbfQqJ0b", "cZojoP5L": "T8fSlXsT"}}' \
    > test.out 2>&1
eval_tap $? 281 'UpdatePaymentTaxConfig' test.out

#- 282 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'kr2C149p' \
    --end 'RsBaJp16' \
    --start 'od47poG6' \
    > test.out 2>&1
eval_tap $? 282 'SyncPaymentOrders' test.out

#- 283 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'E501q8C4' \
    --storeId 'xFEo2j8g' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetRootCategories' test.out

#- 284 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'lrYDJSJv' \
    --storeId 'uvYJArTA' \
    > test.out 2>&1
eval_tap $? 284 'DownloadCategories' test.out

#- 285 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'RGar6ZOB' \
    --namespace "$AB_NAMESPACE" \
    --language 'lozzfh8j' \
    --storeId '6BgbVgtM' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetCategory' test.out

#- 286 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'Qu4Bloo1' \
    --namespace "$AB_NAMESPACE" \
    --language '2I1feiFl' \
    --storeId 'LENQ7jhL' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetChildCategories' test.out

#- 287 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'Thp5heWL' \
    --namespace "$AB_NAMESPACE" \
    --language 'aHm7BRi4' \
    --storeId '89v44yIE' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetDescendantCategories' test.out

#- 288 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 288 'PublicListCurrencies' test.out

#- 289 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'EF6ERl3G' \
    --region 'OayW6Ttd' \
    --storeId '5fTzI2fS' \
    --appId 'DQIQArJK' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetItemByAppId' test.out

#- 290 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --baseAppId 'NkAKLy7Q' \
    --categoryPath 'zZJfVtJW' \
    --features 'paMlHCtu' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'kYiC1rt9' \
    --limit '23' \
    --offset '50' \
    --region 'yyVUFbTI' \
    --sortBy 'name,displayOrder:asc,name:desc' \
    --storeId 'iGNC1VZT' \
    --tags 'SEx16kkT' \
    > test.out 2>&1
eval_tap $? 290 'PublicQueryItems' test.out

#- 291 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language '6fwts7Ds' \
    --region 'ohdGmmQz' \
    --storeId 'tOpe8eAo' \
    --sku 'g61Ajp3J' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetItemBySku' test.out

#- 292 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'BsTMykCp' \
    --region 'yVGRWAsC' \
    --storeId '5ib3zRcd' \
    --itemIds 'l44z8t3s' \
    > test.out 2>&1
eval_tap $? 292 'PublicBulkGetItems' test.out

#- 293 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["vzMTJAVQ", "eI0lMHu8", "1gBb8rDM"]}' \
    > test.out 2>&1
eval_tap $? 293 'PublicValidateItemPurchaseCondition' test.out

#- 294 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'INGAMEITEM' \
    --limit '34' \
    --offset '99' \
    --region 'iaGslXDn' \
    --storeId 'dYSDPO3c' \
    --keyword '4xCZTd3x' \
    --language 'RaqKf1yf' \
    > test.out 2>&1
eval_tap $? 294 'PublicSearchItems' test.out

#- 295 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'ICNQJrai' \
    --namespace "$AB_NAMESPACE" \
    --language 'LRZGuHgw' \
    --region 'GxYCTlVh' \
    --storeId 'cUIwLrIO' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetApp' test.out

#- 296 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'WfaHtFIu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 296 'PublicGetItemDynamicData' test.out

#- 297 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'An911qS6' \
    --namespace "$AB_NAMESPACE" \
    --language 'lKOqcKmJ' \
    --populateBundle  \
    --region 'fBPnNWP5' \
    --storeId 'eKAj5ogo' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetItem' test.out

#- 298 GetPaymentCustomization
eval_tap 0 298 'GetPaymentCustomization # SKIP deprecated' test.out

#- 299 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "iEfjNrBB", "paymentProvider": "XSOLLA", "returnUrl": "qiP7UXpv", "ui": "yak6htSi", "zipCode": "wBbIfaHu"}' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetPaymentUrl' test.out

#- 300 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DaVkilSk' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetPaymentMethods' test.out

#- 301 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Q56NcWQB' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetUnpaidPaymentOrder' test.out

#- 302 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DxTHlvAk' \
    --paymentProvider 'WXPAY' \
    --zipCode 'xeAwCQTc' \
    --body '{"token": "LAEOfw3y"}' \
    > test.out 2>&1
eval_tap $? 302 'Pay' test.out

#- 303 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9IBBnyB3' \
    > test.out 2>&1
eval_tap $? 303 'PublicCheckPaymentOrderPaidStatus' test.out

#- 304 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 'MVuxqzu1' \
    > test.out 2>&1
eval_tap $? 304 'GetPaymentPublicConfig' test.out

#- 305 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'KbK3YypB' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetQRCode' test.out

#- 306 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '2rPzuqot' \
    --foreinginvoice 'vWHRuU4D' \
    --invoiceId 'IY5r9Ycx' \
    --payload 'MyHKdigz' \
    --redirectResult 'x6qjf0g3' \
    --resultCode 'jtQxIVQc' \
    --sessionId 'VZkH49B1' \
    --status 'VaYZkomT' \
    --token 'yOsR3WhN' \
    --type 'pMZvJIPI' \
    --userId 'ob4IdZpB' \
    --orderNo '8use8Nte' \
    --paymentOrderNo 'YKPGFMgT' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'qtIKZSXf' \
    > test.out 2>&1
eval_tap $? 306 'PublicNormalizePaymentReturnUrl' test.out

#- 307 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '8g0yKrb2' \
    --paymentOrderNo 'OTVxwXZh' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 307 'GetPaymentTaxValue' test.out

#- 308 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'Ogi4917t' \
    > test.out 2>&1
eval_tap $? 308 'GetRewardByCode' test.out

#- 309 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'LvaD6ttQ' \
    --limit '94' \
    --offset '65' \
    --sortBy 'namespace:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 309 'QueryRewards1' test.out

#- 310 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '83qGfQoP' \
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
    --appIds 'Y0K46FzZ,BoeKayu8,Yfz6cVkG' \
    --itemIds 'AIwqYUAL,tngRU0lC,iad3LkDI' \
    --skus '7vvdhEfb,xaMqHy9E,0EJBiIM1' \
    > test.out 2>&1
eval_tap $? 312 'PublicExistsAnyMyActiveEntitlement' test.out

#- 313 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'pxcnGTkZ' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 314 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'vb8OI0XC' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 315 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku '7lktfyX6' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 316 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'BRy18vLR,MHOrpdtc,dew08RtG' \
    --itemIds 'DJqYINeW,VerM5u6o,jIESK933' \
    --skus 'uGerXZ6s,03fVQq2b,j5Ew5sdD' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetEntitlementOwnershipToken' test.out

#- 317 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'NpNMoa8Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'PublicGetMyWallet' test.out

#- 318 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'rbVWc9Tp' \
    --body '{"epicGamesJwtToken": "HjPxrSyy"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncEpicGameDLC' test.out

#- 319 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'jTXpqCcM' \
    --body '{"serviceLabel": 94}' \
    > test.out 2>&1
eval_tap $? 319 'PublicSyncPsnDlcInventory' test.out

#- 320 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'v3bHzVB2' \
    --body '{"serviceLabels": [50, 76, 58]}' \
    > test.out 2>&1
eval_tap $? 320 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 321 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'aFPD3yRV' \
    --body '{"appId": "2Mmhn2TV", "steamId": "MfJct0Tv"}' \
    > test.out 2>&1
eval_tap $? 321 'SyncSteamDLC' test.out

#- 322 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '4b2AunDk' \
    --body '{"xstsToken": "5Wbtf2aq"}' \
    > test.out 2>&1
eval_tap $? 322 'SyncXboxDLC' test.out

#- 323 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'EdiZsTXb' \
    --appType 'DEMO' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'mo1GYDdZ' \
    --features 'WcjM1ri5,PhN2zYQ6,eGWslKwU' \
    --itemId 'AxGi3t0h,A9qjMdvt,RZKL6Fki' \
    --limit '84' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 323 'PublicQueryUserEntitlements' test.out

#- 324 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kQ1gsklQ' \
    --appId 'AfTA9QC7' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserAppEntitlementByAppId' test.out

#- 325 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'OkvNCyZb' \
    --limit '63' \
    --offset '38' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 325 'PublicQueryUserEntitlementsByAppType' test.out

#- 326 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '8uwSGPAU' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '4MJAOzVE' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserEntitlementByItemId' test.out

#- 327 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'YMBVuhiG' \
    --entitlementClazz 'CODE' \
    --sku 'neUEjUpq' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementBySku' test.out

#- 328 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2Z2WKsz' \
    --appIds 'BLIEZqGp,RiV7hgUv,HuUVnip5' \
    --itemIds 'JsAUBmPu,exXeC18J,BggjDS9d' \
    --skus 'Ht3yQCk5,NmHf0beL,pMLHwpQg' \
    > test.out 2>&1
eval_tap $? 328 'PublicExistsAnyUserActiveEntitlement' test.out

#- 329 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '19G6qW59' \
    --appId 'VGCIs4h8' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 330 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JovsHMQ3' \
    --entitlementClazz 'APP' \
    --itemId 'F2VtPSeD' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 331 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '3UX7uttT' \
    --ids 'xO4Fa9Ya,Y7ZZse8n,De3lO9E3' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 332 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'FkgJOt9z' \
    --entitlementClazz 'MEDIA' \
    --sku 'jO9b7ME3' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 333 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'hxiCB685' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gilvuwrr' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetUserEntitlement' test.out

#- 334 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'TJCVhaos' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IM1r4sCs' \
    --body '{"options": ["EvnWvkbN", "nMATUykK", "ClFPGpnW"], "requestId": "nXn53pxn", "useCount": 5}' \
    > test.out 2>&1
eval_tap $? 334 'PublicConsumeUserEntitlement' test.out

#- 335 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'FriWReGw' \
    --body '{"code": "qzXAzzsI", "language": "nNyS", "region": "iXyTbmK8"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicRedeemCode' test.out

#- 336 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZATx7EHW' \
    --body '{"excludeOldTransactions": false, "language": "rQ", "productId": "ovbeiIcK", "receiptData": "lnXKy0WT", "region": "xkBScIhg", "transactionId": "dwNMXPEd"}' \
    > test.out 2>&1
eval_tap $? 336 'PublicFulfillAppleIAPItem' test.out

#- 337 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'x6tL46J0' \
    --body '{"epicGamesJwtToken": "C2Q24wiq"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncEpicGamesInventory' test.out

#- 338 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'tyAs8Mza' \
    --body '{"autoAck": true, "language": "Dig_TNRK", "orderId": "JeQY6Bsd", "packageName": "qpl3KgZT", "productId": "agmqO4nT", "purchaseTime": 76, "purchaseToken": "QJRSCgoP", "region": "15Ry1Bjg"}' \
    > test.out 2>&1
eval_tap $? 338 'PublicFulfillGoogleIAPItem' test.out

#- 339 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '68V0PbST' \
    --body '{"currencyCode": "rctVypaS", "price": 0.5127486425316277, "productId": "3niCZkii", "serviceLabel": 75}' \
    > test.out 2>&1
eval_tap $? 339 'PublicReconcilePlayStationStore' test.out

#- 340 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 's6tBzPr8' \
    --body '{"currencyCode": "g3g0l4w6", "price": 0.32999090450856616, "productId": "a2ZlErkr", "serviceLabels": [90, 5]}' \
    > test.out 2>&1
eval_tap $? 340 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 341 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'y0FTQjrj' \
    --body '{"appId": "T1sU5lZ6", "language": "Cc", "region": "uDwCU0mJ", "stadiaPlayerId": "zbeJwxm5"}' \
    > test.out 2>&1
eval_tap $? 341 'SyncStadiaEntitlement' test.out

#- 342 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'RR1gAI2K' \
    --body '{"appId": "26A90iKj", "currencyCode": "mIAPjx9M", "language": "zK-lpAH", "price": 0.17707779900670106, "productId": "lgcUqtCX", "region": "l76Xf8jJ", "steamId": "dL4XKMiU"}' \
    > test.out 2>&1
eval_tap $? 342 'SyncSteamInventory' test.out

#- 343 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '9n9a4cWQ' \
    --body '{"gameId": "HG2hpx0w", "language": "XR", "region": "4bump6xU"}' \
    > test.out 2>&1
eval_tap $? 343 'SyncTwitchDropsEntitlement' test.out

#- 344 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tdmhq76g' \
    --body '{"currencyCode": "dZOaBFRx", "price": 0.3866572057355705, "productId": "IWIWK3M4", "xstsToken": "AlaXrxjq"}' \
    > test.out 2>&1
eval_tap $? 344 'SyncXboxInventory' test.out

#- 345 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'zZLItree' \
    --itemId 'CQLzpMUI' \
    --limit '38' \
    --offset '45' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 345 'PublicQueryUserOrders' test.out

#- 346 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'vnKNLpCH' \
    --body '{"currencyCode": "2AhrhJ1t", "discountedPrice": 8, "ext": {"mdKmlWyz": {}, "alMtqVIk": {}, "HzKYhVTP": {}}, "itemId": "kBdJ0PWA", "language": "iwSv", "price": 76, "quantity": 24, "region": "YG3PvI8i", "returnUrl": "dreRAiWE"}' \
    > test.out 2>&1
eval_tap $? 346 'PublicCreateUserOrder' test.out

#- 347 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ntWomuXK' \
    --userId 'hdgxeUEv' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserOrder' test.out

#- 348 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Pe68R2cu' \
    --userId 'eCvDNpNt' \
    > test.out 2>&1
eval_tap $? 348 'PublicCancelUserOrder' test.out

#- 349 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6UEoCHGH' \
    --userId 'X6VyAW8N' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetUserOrderHistories' test.out

#- 350 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OXyulWFk' \
    --userId 'QJoaDqLZ' \
    > test.out 2>&1
eval_tap $? 350 'PublicDownloadUserOrderReceipt' test.out

#- 351 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'C1R4K7fJ' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetPaymentAccounts' test.out

#- 352 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'YRrFFOW7' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'w526pFA2' \
    > test.out 2>&1
eval_tap $? 352 'PublicDeletePaymentAccount' test.out

#- 353 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'JlOKoYVe' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'O4sZVwbq' \
    --limit '52' \
    --offset '28' \
    --sku 'UEAB5p7k' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 353 'PublicQueryUserSubscriptions' test.out

#- 354 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7Hr1v7m' \
    --body '{"currencyCode": "PxSsclmk", "itemId": "4dJNin9I", "language": "jWM_744", "region": "i7shH2dG", "returnUrl": "8opimMoY", "source": "4YCurVDG"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicSubscribeSubscription' test.out

#- 355 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'GugMCAQ3' \
    --itemId 'vNXfW7mg' \
    > test.out 2>&1
eval_tap $? 355 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 356 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wmz8vk4P' \
    --userId 'IjYfVMxH' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetUserSubscription' test.out

#- 357 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'r0LO7mBA' \
    --userId 'khClu1yI' \
    > test.out 2>&1
eval_tap $? 357 'PublicChangeSubscriptionBillingAccount' test.out

#- 358 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OJWKx6Ia' \
    --userId 'IxrZWtTe' \
    --body '{"immediate": true, "reason": "a5PKsnAY"}' \
    > test.out 2>&1
eval_tap $? 358 'PublicCancelSubscription' test.out

#- 359 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'owGIObfC' \
    --userId 'OGE25mrV' \
    --excludeFree  \
    --limit '29' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 359 'PublicGetUserSubscriptionBillingHistories' test.out

#- 360 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'GVYjn2R4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XRhhcUHB' \
    > test.out 2>&1
eval_tap $? 360 'PublicGetWallet' test.out

#- 361 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'JQBQ8nsz' \
    --namespace "$AB_NAMESPACE" \
    --userId '2yArLR1T' \
    --limit '35' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 361 'PublicListUserWalletTransactions' test.out

#- 362 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'dM0QqEgu' \
    --baseAppId 'KTcne160' \
    --categoryPath '6lxeTXH7' \
    --features 'pm4vf7YG' \
    --includeSubCategoryItem  \
    --itemName 'hOmbRTBT' \
    --itemStatus 'INACTIVE' \
    --itemType 'SEASON' \
    --limit '7' \
    --offset '25' \
    --region 'rGSl9JYS' \
    --sortBy 'updatedAt:asc,updatedAt,updatedAt:desc' \
    --storeId 's1UYuQYL' \
    --tags 'F4djdbNk' \
    --targetNamespace 'XdAnUq5R' \
    > test.out 2>&1
eval_tap $? 362 'QueryItems1' test.out

#- 363 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FjucyLaM' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 363 'ImportStore1' test.out

#- 364 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FcUbqMex' \
    --body '{"itemIds": ["JOFqTGgE", "Ecl8mQ1R", "1sXaFNV4"]}' \
    > test.out 2>&1
eval_tap $? 364 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE