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
echo "1..383"

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
    --body '{"context": {"item": {"appId": "J3LY77GB", "appType": "DLC", "baseAppId": "d3ivOjC1", "boothName": "it7Orp9x", "boundItemIds": ["aFzro22I", "dmsWVheS", "PSUBl4BJ"], "categoryPath": "IRAatvEA", "clazz": "VCfzaAQx", "createdAt": "1991-08-02T00:00:00Z", "description": "0xFdQVXL", "displayOrder": 54, "entitlementType": "DURABLE", "ext": {"fe4SDqFp": {}, "Fj6LUwiI": {}, "JxmvN1pT": {}}, "features": ["oo5Ikoq6", "vNQFz9xZ", "qXNu6rCx"], "fresh": true, "images": [{"as": "KnoKdYun", "caption": "o012Jzmp", "height": 96, "imageUrl": "SQjrJKiR", "smallImageUrl": "0a72Wbyh", "width": 76}, {"as": "PBqDYKP5", "caption": "xLd6qTMv", "height": 3, "imageUrl": "5CJkPQlQ", "smallImageUrl": "B8lCIzob", "width": 5}, {"as": "ucIEk4Hg", "caption": "hAsUwbvg", "height": 72, "imageUrl": "Zm65AMA6", "smallImageUrl": "v5wMhYFx", "width": 9}], "itemId": "HQgC6uAa", "itemIds": ["4RDlfd98", "ksOsTyr9", "D1zL1sHk"], "itemQty": {"UUsyvVn9": 93, "aebSHtgJ": 73, "6A4pa12I": 34}, "itemType": "SUBSCRIPTION", "language": "q999djJ7", "listable": true, "localExt": {"T0rJRUim": {}, "a6W2SwJH": {}, "dB8Heldw": {}}, "longDescription": "VbMg7gYJ", "lootBoxConfig": {"rewardCount": 79, "rewards": [{"lootBoxItems": [{"count": 34, "itemId": "EseHKySR", "itemSku": "M9UaXK5x", "itemType": "UiPs6EES"}, {"count": 68, "itemId": "XWh74mAQ", "itemSku": "mmpmIfBy", "itemType": "TYBcXMuz"}, {"count": 61, "itemId": "K9JsUkeT", "itemSku": "tF7Eg90N", "itemType": "rXKWXyLk"}], "name": "vpWWtQYs", "odds": 0.9281518466493869, "type": "REWARD_GROUP", "weight": 81}, {"lootBoxItems": [{"count": 77, "itemId": "Y5Wgbxnr", "itemSku": "waNWBhHu", "itemType": "lPaBvxZw"}, {"count": 19, "itemId": "YumF1GJZ", "itemSku": "fbmf3umS", "itemType": "KoZUvyPg"}, {"count": 37, "itemId": "4DJBmvhi", "itemSku": "CUf71zKf", "itemType": "lGf82qup"}], "name": "z6T50pYG", "odds": 0.9477280205451644, "type": "REWARD_GROUP", "weight": 30}, {"lootBoxItems": [{"count": 2, "itemId": "gVknwcVq", "itemSku": "o6PaGqOf", "itemType": "FKhIrPFn"}, {"count": 74, "itemId": "99x5VNG1", "itemSku": "3szHXZHx", "itemType": "kTngM0AF"}, {"count": 96, "itemId": "nAsdT0Eb", "itemSku": "BoFUtIkX", "itemType": "6yW808qK"}], "name": "pN7xJzY5", "odds": 0.8117708831179372, "type": "PROBABILITY_GROUP", "weight": 30}], "rollFunction": "CUSTOM"}, "maxCount": 90, "maxCountPerUser": 30, "name": "cQRzhnZS", "namespace": "vEfoPitu", "optionBoxConfig": {"boxItems": [{"count": 84, "itemId": "xhqnmdhH", "itemSku": "Nuvigew2", "itemType": "uzhXBUmG"}, {"count": 44, "itemId": "W18hKKhu", "itemSku": "B8BxaHrK", "itemType": "k3TdGelG"}, {"count": 36, "itemId": "XbdcudQU", "itemSku": "BUVgWG7H", "itemType": "F6LGkbzB"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 75, "comparison": "includes", "name": "rn6Ju6dp", "predicateType": "SeasonTierPredicate", "value": "TSbkBVjj", "values": ["nMakK2Gv", "AQ1jIxXc", "4XxnMG3w"]}, {"anyOf": 72, "comparison": "isGreaterThanOrEqual", "name": "64MQmBqW", "predicateType": "EntitlementPredicate", "value": "EDZmwrEC", "values": ["CWINoDpO", "BKs08NI5", "tCUR0WX5"]}, {"anyOf": 83, "comparison": "isLessThanOrEqual", "name": "bHPT1sGD", "predicateType": "EntitlementPredicate", "value": "wZ8pkwHU", "values": ["p6fO3BiX", "RzwqMkcX", "1mT6GHr2"]}]}, {"operator": "and", "predicates": [{"anyOf": 29, "comparison": "is", "name": "ioMpEtq5", "predicateType": "EntitlementPredicate", "value": "zMM5BWwU", "values": ["wd34cwHU", "xEDhguUQ", "r3gZkk6S"]}, {"anyOf": 31, "comparison": "is", "name": "aHIlk0Eu", "predicateType": "SeasonTierPredicate", "value": "jKi2UoR4", "values": ["D5bHydg3", "PDznoaUr", "VSBQH0IX"]}, {"anyOf": 82, "comparison": "isNot", "name": "3Bz73DOX", "predicateType": "EntitlementPredicate", "value": "Kkt0Kp8r", "values": ["MK6ISQag", "aus5zOFJ", "3dbe89BZ"]}]}, {"operator": "or", "predicates": [{"anyOf": 4, "comparison": "isLessThan", "name": "Xuh2nyGK", "predicateType": "EntitlementPredicate", "value": "G4KfnmGO", "values": ["sd0Haqay", "XgB9qCOi", "6RFUtOfB"]}, {"anyOf": 41, "comparison": "isGreaterThan", "name": "mDDnYgJU", "predicateType": "EntitlementPredicate", "value": "pnmUBkjP", "values": ["SxEHZYWI", "nXzlopnv", "lyp02jOP"]}, {"anyOf": 90, "comparison": "is", "name": "aJQ5r808", "predicateType": "EntitlementPredicate", "value": "71NNIMYl", "values": ["0DntRQEW", "dbXSav4S", "RELkDxfJ"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 68, "fixedTrialCycles": 8, "graceDays": 77}, "region": "JrRW0QDC", "regionData": [{"currencyCode": "PaV9naIO", "currencyNamespace": "bPbWJQ7K", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1989-10-11T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1986-12-16T00:00:00Z", "discountedPrice": 79, "expireAt": "1982-05-31T00:00:00Z", "price": 57, "purchaseAt": "1978-11-14T00:00:00Z", "trialPrice": 33}, {"currencyCode": "eKqE7cUt", "currencyNamespace": "cVMwEckk", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1980-12-23T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1976-01-25T00:00:00Z", "discountedPrice": 85, "expireAt": "1984-02-05T00:00:00Z", "price": 86, "purchaseAt": "1974-06-08T00:00:00Z", "trialPrice": 20}, {"currencyCode": "exhsfFn1", "currencyNamespace": "6NNMf56X", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1984-06-17T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1993-10-15T00:00:00Z", "discountedPrice": 44, "expireAt": "1987-11-02T00:00:00Z", "price": 21, "purchaseAt": "1975-04-27T00:00:00Z", "trialPrice": 60}], "seasonType": "PASS", "sku": "T3lYJ272", "stackable": true, "status": "INACTIVE", "tags": ["Lwaymj5h", "kF7SLebF", "Wlr1lq7s"], "targetCurrencyCode": "tNiVKEO5", "targetItemId": "e1NA6PJP", "targetNamespace": "MFqXMT3a", "thumbnailUrl": "O83S5oTJ", "title": "nTDMLvkz", "updatedAt": "1983-01-12T00:00:00Z", "useCount": 66}, "namespace": "SXkaYwCI", "order": {"currency": {"currencyCode": "VFjbRF36", "currencySymbol": "CkifrtW8", "currencyType": "REAL", "decimals": 76, "namespace": "n9MxpOoF"}, "ext": {"J7SZd96q": {}, "T5RJTVEJ": {}, "5WgCcTyj": {}}, "free": true}, "source": "REFERRAL_BONUS"}, "script": "J4I81PQY", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'buJxjWuq' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '4Efyte3V' \
    --body '{"grantDays": "vtv5GPXM"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'iedczsA4' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'I1TApZTc' \
    --body '{"grantDays": "6Dn5V1OM"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "cKPCaNaS", "dryRun": false, "fulfillmentUrl": "ag7Mpzlq", "itemType": "MEDIA", "purchaseConditionUrl": "EFRvn5gj"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '86WCwjp6' \
    --itemType 'SUBSCRIPTION' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'EswgHBk4' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '4YbDzVVl' \
    --body '{"clazz": "EW8HRclQ", "dryRun": true, "fulfillmentUrl": "JtvnEmzJ", "purchaseConditionUrl": "0taj7Rjp"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'bGDfJwQU' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'qO0sILmJ' \
    --offset '32' \
    --tag 'gtUsMqi4' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "6FiRc8fb", "items": [{"extraSubscriptionDays": 47, "itemId": "yquK4SjU", "itemName": "zYSbSIN0", "quantity": 46}, {"extraSubscriptionDays": 5, "itemId": "GJ6uJ3PI", "itemName": "qqJnMfN8", "quantity": 66}, {"extraSubscriptionDays": 50, "itemId": "BJRkb3a6", "itemName": "ZWP93pFp", "quantity": 18}], "maxRedeemCountPerCampaignPerUser": 56, "maxRedeemCountPerCode": 21, "maxRedeemCountPerCodePerUser": 45, "maxSaleCount": 7, "name": "1dZhjVzI", "redeemEnd": "1977-02-25T00:00:00Z", "redeemStart": "1972-06-01T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["FPzOqGoB", "77CDdSy8", "kSJrMLgO"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'oNMYrybD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'tQp2vimt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ph14LnxY", "items": [{"extraSubscriptionDays": 100, "itemId": "3U4t7mHO", "itemName": "LF3ZH1aQ", "quantity": 58}, {"extraSubscriptionDays": 86, "itemId": "BKwYQNk4", "itemName": "FU1E9Ddw", "quantity": 13}, {"extraSubscriptionDays": 74, "itemId": "IENVJds9", "itemName": "NKdWCkJs", "quantity": 68}], "maxRedeemCountPerCampaignPerUser": 87, "maxRedeemCountPerCode": 21, "maxRedeemCountPerCodePerUser": 60, "maxSaleCount": 100, "name": "jjxmeXCN", "redeemEnd": "1991-12-09T00:00:00Z", "redeemStart": "1999-05-17T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["a3y7LhBx", "33U7RSpl", "ZXCiAT7C"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'eWlflDVe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JIf6bid3' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tJb98MlZ' \
    --body '{"categoryPath": "XD2746ns", "localizationDisplayNames": {"JJBKfFwX": "WqUf47OR", "MWdLjctd": "LcoAnJCg", "qZ06Frv3": "cTSBKpUQ"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'b2Huknvf' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'Jz7AiVgJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rrd2xaFy' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'd2xo1WV9' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5OVQVr77' \
    --body '{"localizationDisplayNames": {"1YePVN5T": "mpSC6NpZ", "IlaJeUbI": "dy48Z5Wn", "iIRcMSX8": "wYhQEm8q"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'q8JpU1Hc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XSA0v7Tg' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'a4VOQnv9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YPM6Fqdz' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'jN94BA4D' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lxcafRbq' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '2NI0ENFx' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '37' \
    --code 'GINZsJJF' \
    --limit '63' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'tdK7Zhhk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 92}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'j6KMKgjC' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '96' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'f306n6Xt' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '60' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'M5mahBhV' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '60' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '5kV8QTKh' \
    --namespace "$AB_NAMESPACE" \
    --code 'N6dkjBre' \
    --limit '74' \
    --offset '66' \
    --userId 'ikkzKfzY' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'rA2RX9Jq' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'ZzxGtNrw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'LdxJjQzh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'EnableCode' test.out

#- 36 GetServicePluginConfig
./ng net.accelbyte.sdk.cli.Main platform getServicePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetServicePluginConfig' test.out

#- 37 UpdateServicePluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateServicePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"grpcServerAddress": "o4wr8wPf"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateServicePluginConfig' test.out

#- 38 DeleteServicePluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteServicePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteServicePluginConfig' test.out

#- 39 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 39 'ListCurrencies' test.out

#- 40 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "JNx1wuF7", "currencySymbol": "bU7Dr2kU", "currencyType": "VIRTUAL", "decimals": 69, "localizationDescriptions": {"IzYe2uRL": "wcnK9VJb", "8ed5bdrp": "YQPrAvIp", "ou44ZchX": "Xir2pQFn"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'UcXQmghR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"GJquFis3": "jh4MD5BA", "47ep99FA": "ebZdR8yq", "FY3IKdV8": "N6CzC1v4"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'FtGF1qr2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode '01d0cfbz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'NXb0foYH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'GetCurrencySummary' test.out

#- 45 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetDLCItemConfig' test.out

#- 46 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "80pqPo7n", "rewards": [{"currency": {"currencyCode": "ufijzVPU", "namespace": "XDdgjjV3"}, "item": {"itemId": "6qbY1z4B", "itemSku": "gYIPJOyT", "itemType": "CBI6RKGg"}, "quantity": 54, "type": "CURRENCY"}, {"currency": {"currencyCode": "mz8odjDV", "namespace": "LDlOEMFW"}, "item": {"itemId": "TjXkgc8U", "itemSku": "sloyGG2E", "itemType": "JwC2XUr1"}, "quantity": 55, "type": "CURRENCY"}, {"currency": {"currencyCode": "1SpS3IZu", "namespace": "ASnxpnRP"}, "item": {"itemId": "y6IAxlZU", "itemSku": "WCjwN2lr", "itemType": "zwwRzB37"}, "quantity": 3, "type": "CURRENCY"}]}, {"id": "409MxnjQ", "rewards": [{"currency": {"currencyCode": "iLuX4VXm", "namespace": "tPUZGQj3"}, "item": {"itemId": "GoYKbYBa", "itemSku": "rAPDO0UP", "itemType": "O7rE9XMC"}, "quantity": 31, "type": "ITEM"}, {"currency": {"currencyCode": "AjM4JiZt", "namespace": "t5amunon"}, "item": {"itemId": "JEvKh95r", "itemSku": "wI7Ga9tB", "itemType": "hoWe8l1P"}, "quantity": 75, "type": "CURRENCY"}, {"currency": {"currencyCode": "dblfhxb2", "namespace": "BL8zwObf"}, "item": {"itemId": "SxWjU9pi", "itemSku": "lwOO0ucN", "itemType": "WiQpYftQ"}, "quantity": 73, "type": "CURRENCY"}]}, {"id": "8sV4Vhzt", "rewards": [{"currency": {"currencyCode": "4UUxEFn2", "namespace": "VJUWTwQ4"}, "item": {"itemId": "ZvMvalJ5", "itemSku": "qCavZhHk", "itemType": "huLcaUQ4"}, "quantity": 44, "type": "CURRENCY"}, {"currency": {"currencyCode": "h5rczpui", "namespace": "ovg8kw2A"}, "item": {"itemId": "AE1hgnRo", "itemSku": "b1KUZc1k", "itemType": "yo7tW5Yd"}, "quantity": 80, "type": "ITEM"}, {"currency": {"currencyCode": "kU5abQrH", "namespace": "SF35WZD1"}, "item": {"itemId": "4luEZ9Rl", "itemSku": "vJz4shsJ", "itemType": "hjGtaxut"}, "quantity": 20, "type": "ITEM"}]}]}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateDLCItemConfig' test.out

#- 47 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteDLCItemConfig' test.out

#- 48 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetPlatformDLCConfig' test.out

#- 49 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"txzuKZF0": "tiHkdpDN", "xvsKsRuq": "B1ifY9nV", "wsX00hgj": "GJGG5kP0"}}, {"platform": "XBOX", "platformDlcIdMap": {"lREVyjNt": "OyOJXQC1", "6UXoxasi": "ES5L3GDn", "PlwTRJss": "IvGmM3nZ"}}, {"platform": "XBOX", "platformDlcIdMap": {"7d5rbXwn": "IXk88Z54", "BHUEaDnd": "LY7M4MTt", "U3HlV6FR": "Df1EpD7o"}}]}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePlatformDLCConfig' test.out

#- 50 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeletePlatformDLCConfig' test.out

#- 51 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'APP' \
    --entitlementName 'Kf3sH9cp' \
    --itemId 'KZFjnGIO,e1cmlztL,R9p01P13' \
    --limit '83' \
    --offset '45' \
    --userId '8XeDys6N' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'Hh2Htktn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '53' \
    --status 'SUCCESS' \
    --userId '2IHawMib' \
    > test.out 2>&1
eval_tap $? 53 'QueryFulfillmentHistories' test.out

#- 54 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetAppleIAPConfig' test.out

#- 55 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "ykgzOH2D", "password": "2087xh8J"}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateAppleIAPConfig' test.out

#- 56 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'DeleteAppleIAPConfig' test.out

#- 57 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetEpicGamesIAPConfig' test.out

#- 58 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "0OCJp44a"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateEpicGamesIAPConfig' test.out

#- 59 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteEpicGamesIAPConfig' test.out

#- 60 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetGoogleIAPConfig' test.out

#- 61 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "I6yvS9tq", "serviceAccountId": "TJzNsDHk"}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGoogleIAPConfig' test.out

#- 62 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteGoogleIAPConfig' test.out

#- 63 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 63 'UpdateGoogleP12File' test.out

#- 64 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetIAPItemConfig' test.out

#- 65 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "fL34ONm3", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"xALUUmpj": "ADAhAMU6", "HT3N03Sa": "xMmmlVYr", "OdTpn63w": "00PNkLHC"}}, {"itemIdentity": "Ogh5jArL", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"9WkaQ3yb": "ckQJY9Ic", "IaJq8LvH": "lDGxRBjB", "qUZRoeGD": "16QK2vWV"}}, {"itemIdentity": "0O6OsDSs", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"Thkxmpwq": "nzddo1t7", "k2SRHLjQ": "yWJR9RYv", "0cYBAf0E": "K88hNUOL"}}]}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateIAPItemConfig' test.out

#- 66 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteIAPItemConfig' test.out

#- 67 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetPlayStationIAPConfig' test.out

#- 68 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "O567yAcm"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdatePlaystationIAPConfig' test.out

#- 69 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePlaystationIAPConfig' test.out

#- 70 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetSteamIAPConfig' test.out

#- 71 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "QfFSWGJw", "publisherAuthenticationKey": "PbRlT8FH"}' \
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
    --body '{"clientId": "eXvQSV6X", "clientSecret": "VXn9e5AC", "organizationId": "EwdFCgZM"}' \
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
    --body '{"relyingPartyCert": "WsH8HvgX"}' \
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
    --password 'AUtpgDPp' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'NoQ2SvMF' \
    --itemId 'OtNEoX3s' \
    --itemType 'SUBSCRIPTION' \
    --endTime 'epxVhHtp' \
    --startTime 'hocRVxOA' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'pSckQc40' \
    --itemId 'lppzR30c' \
    --itemType 'APP' \
    --endTime 'xSXR8tuy' \
    --startTime 'TBU84zYI' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lzw0LDUG' \
    --body '{"categoryPath": "zRilYvne", "targetItemId": "D7AfAPR0", "targetNamespace": "qCbYjEZM"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '8w8r96eu' \
    --body '{"appId": "jmPm3hhz", "appType": "DLC", "baseAppId": "vicGf8FK", "boothName": "OiTki48q", "categoryPath": "yZrddPlQ", "clazz": "AcI4eEdH", "displayOrder": 84, "entitlementType": "DURABLE", "ext": {"xxC1n8Lu": {}, "qhEtDRza": {}, "j1797TmB": {}}, "features": ["ZsOZE7Rw", "Xz0Mz6TE", "avGx3UVf"], "images": [{"as": "eRcIZgG4", "caption": "nzi4fJCD", "height": 29, "imageUrl": "VW4u5isE", "smallImageUrl": "dilg5osE", "width": 81}, {"as": "WwtxtI3g", "caption": "Q0JmAo4v", "height": 13, "imageUrl": "QyfucKLA", "smallImageUrl": "OPWUiCuA", "width": 8}, {"as": "nsQxG9Ck", "caption": "98vVWlhy", "height": 11, "imageUrl": "gdPB6VLW", "smallImageUrl": "JUin33JJ", "width": 98}], "itemIds": ["nYeMmHRf", "U2NyhiGv", "8hnIKXL9"], "itemQty": {"5EWJz60i": 44, "9fYspP4U": 81, "xgeeVuHB": 85}, "itemType": "COINS", "listable": false, "localizations": {"hya3oy1j": {"description": "zF7TDadE", "localExt": {"mugp5nHO": {}, "2E9Dwlag": {}, "dbuUgpWF": {}}, "longDescription": "xSZ5JUQe", "title": "S5skaQxN"}, "sAZ7MKaH": {"description": "vxlwCOF6", "localExt": {"gZf0D7CN": {}, "JB2Lc1Pi": {}, "VQgjlkiQ": {}}, "longDescription": "uoa3jX5v", "title": "CnzlvBpF"}, "D9y45Nw1": {"description": "fJ84p3oF", "localExt": {"9rvHP8jX": {}, "V2HcG1CU": {}, "EyR1BRuP": {}}, "longDescription": "zXeWcvte", "title": "Rxw3RkJU"}}, "lootBoxConfig": {"rewardCount": 19, "rewards": [{"lootBoxItems": [{"count": 17, "itemId": "lG2IwRCB", "itemSku": "zG9Cndle", "itemType": "lbXu7EBz"}, {"count": 4, "itemId": "CU6bMdUB", "itemSku": "tEYTdPhN", "itemType": "TNB4oPZc"}, {"count": 12, "itemId": "DAlapqLZ", "itemSku": "I0tAgj4W", "itemType": "jd6qxM0b"}], "name": "8osP8vYA", "odds": 0.6106748390008718, "type": "REWARD", "weight": 10}, {"lootBoxItems": [{"count": 40, "itemId": "4yJi3qTT", "itemSku": "5pY48gBu", "itemType": "pxSWlSx9"}, {"count": 9, "itemId": "wPYclkLk", "itemSku": "Ds31OLN6", "itemType": "vhLGr5uR"}, {"count": 39, "itemId": "pBt4z3TD", "itemSku": "S4XEXPgv", "itemType": "L69iTlp1"}], "name": "KoIK0Xw0", "odds": 0.20735786986371196, "type": "PROBABILITY_GROUP", "weight": 79}, {"lootBoxItems": [{"count": 19, "itemId": "WaaPFfXV", "itemSku": "FXDn5SeQ", "itemType": "Nql6Ws4z"}, {"count": 49, "itemId": "OV7peexe", "itemSku": "xu6ow9wo", "itemType": "DMjHjUMO"}, {"count": 48, "itemId": "gQwM3kqB", "itemSku": "hS4MoK41", "itemType": "rAbuGgX2"}], "name": "LfWEXYAG", "odds": 0.06153103867078613, "type": "REWARD", "weight": 93}], "rollFunction": "CUSTOM"}, "maxCount": 25, "maxCountPerUser": 4, "name": "SWsQHZF4", "optionBoxConfig": {"boxItems": [{"count": 15, "itemId": "iCyJDUAE", "itemSku": "duFMySmy", "itemType": "Oe8p7FS3"}, {"count": 13, "itemId": "nmtrohIw", "itemSku": "oYntKHNf", "itemType": "Rlb9EWCF"}, {"count": 69, "itemId": "zN1DdXiP", "itemSku": "uHrN6XZE", "itemType": "VWknB2YV"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 43, "fixedTrialCycles": 22, "graceDays": 21}, "regionData": {"Ba4EQ7Qm": [{"currencyCode": "wP5ODulT", "currencyNamespace": "0l2dagCC", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1987-08-12T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1980-07-29T00:00:00Z", "discountedPrice": 1, "expireAt": "1982-11-10T00:00:00Z", "price": 4, "purchaseAt": "1986-11-04T00:00:00Z", "trialPrice": 79}, {"currencyCode": "kS5C16f7", "currencyNamespace": "7H4Yi54Y", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1993-06-25T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1980-08-25T00:00:00Z", "discountedPrice": 53, "expireAt": "1990-06-24T00:00:00Z", "price": 34, "purchaseAt": "1989-12-21T00:00:00Z", "trialPrice": 63}, {"currencyCode": "BQByJdre", "currencyNamespace": "NlmWjcKM", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1996-10-27T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1988-04-21T00:00:00Z", "discountedPrice": 65, "expireAt": "1989-10-13T00:00:00Z", "price": 97, "purchaseAt": "1988-06-22T00:00:00Z", "trialPrice": 94}], "B9aoDntR": [{"currencyCode": "2atDiwgO", "currencyNamespace": "FVJKGZjT", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1979-02-24T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1982-05-31T00:00:00Z", "discountedPrice": 83, "expireAt": "1978-02-21T00:00:00Z", "price": 93, "purchaseAt": "1986-08-18T00:00:00Z", "trialPrice": 29}, {"currencyCode": "gGz4tn4P", "currencyNamespace": "BbbbW3GT", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1982-04-11T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1982-01-26T00:00:00Z", "discountedPrice": 38, "expireAt": "1999-12-17T00:00:00Z", "price": 94, "purchaseAt": "1985-11-09T00:00:00Z", "trialPrice": 70}, {"currencyCode": "lmWTZwKa", "currencyNamespace": "lU1FMaNL", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1975-03-19T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1997-06-08T00:00:00Z", "discountedPrice": 2, "expireAt": "1977-09-08T00:00:00Z", "price": 73, "purchaseAt": "1974-03-14T00:00:00Z", "trialPrice": 93}], "0a3ozdAx": [{"currencyCode": "geKoPSfK", "currencyNamespace": "aLs5CZ87", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1977-10-30T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1989-07-09T00:00:00Z", "discountedPrice": 39, "expireAt": "1980-02-10T00:00:00Z", "price": 95, "purchaseAt": "1998-03-02T00:00:00Z", "trialPrice": 91}, {"currencyCode": "LrqQRLUp", "currencyNamespace": "0pLAoGWP", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1998-08-25T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1997-09-14T00:00:00Z", "discountedPrice": 78, "expireAt": "1982-04-03T00:00:00Z", "price": 68, "purchaseAt": "1977-08-27T00:00:00Z", "trialPrice": 46}, {"currencyCode": "oFQA7LdD", "currencyNamespace": "9c0w2Co6", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1990-06-16T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1999-02-26T00:00:00Z", "discountedPrice": 61, "expireAt": "1976-06-06T00:00:00Z", "price": 46, "purchaseAt": "1979-06-18T00:00:00Z", "trialPrice": 58}]}, "seasonType": "TIER", "sku": "kSLCKxmX", "stackable": true, "status": "ACTIVE", "tags": ["LiFmvTQ7", "GJ0OMAXx", "Y3MdIGKv"], "targetCurrencyCode": "zu05Sgup", "targetNamespace": "F2OPJ9xj", "thumbnailUrl": "pg3p1gnH", "useCount": 58}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'JG73PDuF' \
    --appId 'W7xbdMRi' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'GVsFqsKu' \
    --baseAppId 'qSlzBt57' \
    --categoryPath 'x24hSQjy' \
    --features 'quwE0CvV' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --limit '42' \
    --offset '35' \
    --region 'kY4rg3Ry' \
    --sortBy 'name:desc,displayOrder:desc,createdAt:asc' \
    --storeId 'VDJtpxFu' \
    --tags '41dQMy89' \
    --targetNamespace '75nlwv5p' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'jnTdSc6j,GkrFcJVR,uIZpjzRF' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'pDOyPGTH' \
    --sku 'd6C1KZr0' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'NR7kwsGQ' \
    --populateBundle  \
    --region 'nb6qkgRg' \
    --storeId 'Z8XdiN34' \
    --sku 'tywGrMVl' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Kd4WZQlF' \
    --sku 'RDaLs04g' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'rdeCe0lA,XOHdQygJ,xSr7npgO' \
    --storeId 'FaE1gB0a' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Q2qNfxOk' \
    --region 'ir4panPq' \
    --storeId 'rYaq1XOD' \
    --itemIds 'JyfsGNRV' \
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
    --userId 'kpkuqTaA' \
    --body '{"itemIds": ["6Kdkp57p", "tq5ijsLx", "nWkmDq7G"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'LOOTBOX' \
    --limit '33' \
    --offset '28' \
    --sortBy 'CwwL5Gtf' \
    --storeId 'jXZDY7Mt' \
    --keyword 'Iv26SkqE' \
    --language 'xWdSDVcT' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '87' \
    --offset '12' \
    --sortBy 'displayOrder:asc,name:desc,updatedAt:desc' \
    --storeId 'ebfhiXQW' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'nRLdGXna' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'L12QC5H7' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'fz7Uf09i' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RnZyhrz5' \
    --body '{"appId": "CzgcecME", "appType": "GAME", "baseAppId": "yt8Dlss7", "boothName": "6zgD2tls", "categoryPath": "naVBsFKZ", "clazz": "FuSRNyx7", "displayOrder": 57, "entitlementType": "DURABLE", "ext": {"GbjxQAFd": {}, "CM3b4AaQ": {}, "ZKBN6qHo": {}}, "features": ["Sy96789j", "P2ocKn6c", "moHTJB6l"], "images": [{"as": "fz4wm99P", "caption": "BW5HfIAa", "height": 86, "imageUrl": "oWV5dEyd", "smallImageUrl": "LAo0rP89", "width": 18}, {"as": "wm6kieYJ", "caption": "sQOOKUHh", "height": 0, "imageUrl": "7DmryKXy", "smallImageUrl": "mego6dyp", "width": 76}, {"as": "tHxdbDpU", "caption": "mtJaJdJ1", "height": 33, "imageUrl": "D16ofpAg", "smallImageUrl": "RMy4CS5F", "width": 81}], "itemIds": ["MwtIvGaB", "LhiBTfPG", "nSAsZ7zm"], "itemQty": {"4t6il4E2": 83, "bOhTsiLl": 58, "EvO2WETP": 64}, "itemType": "EXTENSION", "listable": false, "localizations": {"ANnOjfMW": {"description": "WfQFFXXk", "localExt": {"PueYfWvX": {}, "mOKmin1c": {}, "98VZS8WV": {}}, "longDescription": "tUj7Xb5j", "title": "6Sk2JCXH"}, "LMYaMYqc": {"description": "MsqzcFae", "localExt": {"WF0mfRce": {}, "SVD4vV53": {}, "nma8Xvgi": {}}, "longDescription": "LJS2wLxJ", "title": "9AGJc6co"}, "FBanIxgl": {"description": "EpjsamMx", "localExt": {"fHYKX7J2": {}, "BZUIWeGS": {}, "av8JLLPs": {}}, "longDescription": "8Me58Gvb", "title": "GjiXhhXd"}}, "lootBoxConfig": {"rewardCount": 82, "rewards": [{"lootBoxItems": [{"count": 88, "itemId": "P9SS6iYI", "itemSku": "LDbFyafx", "itemType": "cvETvGaa"}, {"count": 32, "itemId": "nAdChkhR", "itemSku": "p1AsYvzX", "itemType": "JvlCxyWQ"}, {"count": 28, "itemId": "IEWz5g41", "itemSku": "8yxbKRfN", "itemType": "1gbSyCUd"}], "name": "ydIRDkZD", "odds": 0.18258250057628378, "type": "PROBABILITY_GROUP", "weight": 96}, {"lootBoxItems": [{"count": 51, "itemId": "i6iHjUUP", "itemSku": "2aFxaKrz", "itemType": "6hb4TN1g"}, {"count": 74, "itemId": "ITQ4J0eY", "itemSku": "WayOPKY8", "itemType": "GxSLzHJe"}, {"count": 52, "itemId": "WdNUJoK0", "itemSku": "1Zsbj2Op", "itemType": "Prj8PzsH"}], "name": "bviyocke", "odds": 0.23478321001302016, "type": "REWARD_GROUP", "weight": 91}, {"lootBoxItems": [{"count": 91, "itemId": "XQun99z7", "itemSku": "y5ZUznoe", "itemType": "aCPKSf23"}, {"count": 82, "itemId": "XNhEXqlQ", "itemSku": "smNt9Xr0", "itemType": "2u4L94eM"}, {"count": 3, "itemId": "IjwscP71", "itemSku": "Lad7llcV", "itemType": "W6GNzbJa"}], "name": "49hWt7Z1", "odds": 0.8710030919932548, "type": "REWARD", "weight": 15}], "rollFunction": "DEFAULT"}, "maxCount": 36, "maxCountPerUser": 35, "name": "0vxUZ1ne", "optionBoxConfig": {"boxItems": [{"count": 68, "itemId": "RwsrQCoi", "itemSku": "TceE2Lvr", "itemType": "yQqj9YZM"}, {"count": 43, "itemId": "5uiRIDLJ", "itemSku": "acaKt8xh", "itemType": "Mg6Elvqc"}, {"count": 63, "itemId": "BZF5Wwe1", "itemSku": "z5z5o8zy", "itemType": "hlqkeKgJ"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 54, "fixedTrialCycles": 94, "graceDays": 36}, "regionData": {"PbSuY5MI": [{"currencyCode": "Ejcnth8R", "currencyNamespace": "3GzkHP6W", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1999-07-25T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1977-04-06T00:00:00Z", "discountedPrice": 39, "expireAt": "1977-12-11T00:00:00Z", "price": 93, "purchaseAt": "1984-03-05T00:00:00Z", "trialPrice": 42}, {"currencyCode": "BVtNCqjq", "currencyNamespace": "4ZmllaVy", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1991-01-08T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1996-11-09T00:00:00Z", "discountedPrice": 7, "expireAt": "1975-07-15T00:00:00Z", "price": 100, "purchaseAt": "1996-01-23T00:00:00Z", "trialPrice": 79}, {"currencyCode": "aUC8GaB9", "currencyNamespace": "pqYBXT8I", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1994-02-22T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1996-10-20T00:00:00Z", "discountedPrice": 36, "expireAt": "1978-07-26T00:00:00Z", "price": 79, "purchaseAt": "1984-11-19T00:00:00Z", "trialPrice": 64}], "NykqzJ75": [{"currencyCode": "qAAIoDwd", "currencyNamespace": "UbGHK1jZ", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1984-07-26T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1994-07-28T00:00:00Z", "discountedPrice": 1, "expireAt": "1986-06-30T00:00:00Z", "price": 1, "purchaseAt": "1981-08-26T00:00:00Z", "trialPrice": 84}, {"currencyCode": "LqiC0v6j", "currencyNamespace": "rUZYloES", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1993-03-23T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1991-12-06T00:00:00Z", "discountedPrice": 2, "expireAt": "1972-12-20T00:00:00Z", "price": 32, "purchaseAt": "1982-06-23T00:00:00Z", "trialPrice": 38}, {"currencyCode": "RRBqvVBc", "currencyNamespace": "d6aXBWHl", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1990-06-21T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1996-01-21T00:00:00Z", "discountedPrice": 70, "expireAt": "1984-09-27T00:00:00Z", "price": 24, "purchaseAt": "1974-03-26T00:00:00Z", "trialPrice": 10}], "OYelEP5t": [{"currencyCode": "RiS64hPR", "currencyNamespace": "g3mtu2dR", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1995-12-01T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1999-05-18T00:00:00Z", "discountedPrice": 60, "expireAt": "1975-12-29T00:00:00Z", "price": 21, "purchaseAt": "1997-05-02T00:00:00Z", "trialPrice": 35}, {"currencyCode": "qgNXruBU", "currencyNamespace": "ekGxrCrl", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1971-04-22T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1973-10-07T00:00:00Z", "discountedPrice": 45, "expireAt": "1985-09-08T00:00:00Z", "price": 78, "purchaseAt": "1984-01-21T00:00:00Z", "trialPrice": 92}, {"currencyCode": "zOGKq9A2", "currencyNamespace": "ZXT54PS6", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1978-07-08T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1985-06-16T00:00:00Z", "discountedPrice": 48, "expireAt": "1971-06-05T00:00:00Z", "price": 30, "purchaseAt": "1991-05-24T00:00:00Z", "trialPrice": 29}]}, "seasonType": "PASS", "sku": "nGXkDNsw", "stackable": true, "status": "ACTIVE", "tags": ["dfEslsI5", "atrJ8NUg", "t60LZs2Q"], "targetCurrencyCode": "0zWIl0KO", "targetNamespace": "iPoyTloX", "thumbnailUrl": "GfWG96TT", "useCount": 55}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'W77vEuRd' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '9rnmWGwG' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'e9flTQjJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 33, "orderNo": "2pSZyIJR"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '956BkBFe' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '27oDcspL' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'PDtJPR0o' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6ANtUaJ2' \
    --body '{"carousel": [{"alt": "xn3SPrwW", "previewUrl": "rld4n0IO", "thumbnailUrl": "TU9x0cHf", "type": "video", "url": "PldpdFjy", "videoSource": "generic"}, {"alt": "OjyNeyOx", "previewUrl": "jKRpJaYO", "thumbnailUrl": "ER2s7tXL", "type": "image", "url": "1d4cOnzi", "videoSource": "generic"}, {"alt": "KorAYw4n", "previewUrl": "BZMYOuHl", "thumbnailUrl": "KfinyKCa", "type": "video", "url": "n8PlKGqc", "videoSource": "youtube"}], "developer": "lps29GFK", "forumUrl": "6HVkqZlz", "genres": ["Action", "MassivelyMultiplayer", "Strategy"], "localizations": {"TTgEDU9J": {"announcement": "XT7PX2SB", "slogan": "wgCf5apn"}, "pRNG9gbl": {"announcement": "kFbC6EZF", "slogan": "NTaCTGWV"}, "dAa0icsJ": {"announcement": "COJ2Xaiz", "slogan": "3ei8PQ7d"}}, "platformRequirements": {"3fP8i9ox": [{"additionals": "oZ88P8eI", "directXVersion": "uFxL38Dr", "diskSpace": "omKfHqug", "graphics": "78p6dyxX", "label": "iWYQ5yIv", "osVersion": "GldEtvYJ", "processor": "ZhcBd4VG", "ram": "qHu6i3Qa", "soundCard": "iSTMgxU8"}, {"additionals": "D0b3sMrN", "directXVersion": "gaQbIsYn", "diskSpace": "H9jp0jPT", "graphics": "Bdkr1RU1", "label": "BfGNWjlr", "osVersion": "c3avofEX", "processor": "MADjLGqA", "ram": "UtFtrTZj", "soundCard": "Uaik917u"}, {"additionals": "1hloIeLS", "directXVersion": "AxnFGQ1w", "diskSpace": "aDhnqL94", "graphics": "YcicpH0k", "label": "gdztZ6eL", "osVersion": "RiKdXYHv", "processor": "7MuFBP2B", "ram": "1ITPsv8z", "soundCard": "rYTuc88U"}], "iBZKpXAQ": [{"additionals": "S5Ojbfau", "directXVersion": "rILM9UND", "diskSpace": "4ov0Xrn8", "graphics": "bG2ZwNYI", "label": "Fbqt3XQc", "osVersion": "7MlPknE1", "processor": "wSUQJfq1", "ram": "z19HTO62", "soundCard": "yuptbKgQ"}, {"additionals": "k3mP4rr1", "directXVersion": "B0tu6Fl7", "diskSpace": "xWfc6Hyg", "graphics": "UyL45cei", "label": "pmygmOnF", "osVersion": "fWdw8Woi", "processor": "eYFLeZUx", "ram": "u03meEDQ", "soundCard": "URl6IHwQ"}, {"additionals": "o3HUQDhq", "directXVersion": "28cIwzCl", "diskSpace": "cQDk9D2r", "graphics": "m8SDdo3A", "label": "vDkfMFRO", "osVersion": "U9RDouHY", "processor": "19yKb0wo", "ram": "jBIenSly", "soundCard": "5G2s6eNU"}], "dJ7Mzokz": [{"additionals": "ZbgW6jjC", "directXVersion": "GjUMV3fk", "diskSpace": "hlPwcyJP", "graphics": "uQUnOpMa", "label": "3wVF0Y66", "osVersion": "BF69Vh8A", "processor": "SDSg88IM", "ram": "m0gSTssF", "soundCard": "AoCGvHbf"}, {"additionals": "PDePVZjT", "directXVersion": "NUVvuzw7", "diskSpace": "iK03MBas", "graphics": "wVNPRcBi", "label": "fwaNseLr", "osVersion": "LzTwRfQV", "processor": "GrOr5mBo", "ram": "kKpJWD5w", "soundCard": "bMNgl5GP"}, {"additionals": "ouhWlhrd", "directXVersion": "FqkxRUMN", "diskSpace": "0SbJSosy", "graphics": "DicMCpb8", "label": "X5ysVr4j", "osVersion": "uXfKrjbR", "processor": "yWrXXjKx", "ram": "wgfEVo2g", "soundCard": "KW2dGlfx"}]}, "platforms": ["MacOS", "IOS", "Linux"], "players": ["MMO", "Coop", "LocalCoop"], "primaryGenre": "MassivelyMultiplayer", "publisher": "1Bn4AZda", "releaseDate": "1973-10-20T00:00:00Z", "websiteUrl": "b1UAJvkT"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'TBkVq1R3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nOoacZ28' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'kmw93fMR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'ofdsCzxF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'H3PAAOVR' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'MgrK0qbn' \
    --itemId 'rYblgGJa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nvdy48El' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'SokasHkS' \
    --itemId '0YfjCPmp' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9CRrun4m' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'DYLLraZN' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ExYT4BCf' \
    --populateBundle  \
    --region 'ggzBNSLz' \
    --storeId 'yppeoRvK' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'L8eEqQl0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XO1Kuvv8' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 56, "comparison": "isGreaterThanOrEqual", "name": "tI35Sw8B", "predicateType": "SeasonPassPredicate", "value": "aHig5zGj", "values": ["XXUZKTOG", "eC2S5Niv", "6U8PBpAb"]}, {"anyOf": 64, "comparison": "isLessThanOrEqual", "name": "dphMhwEd", "predicateType": "EntitlementPredicate", "value": "7hIbaWo2", "values": ["IjaDm6RH", "ifuOrwHm", "BwOivl8I"]}, {"anyOf": 55, "comparison": "isLessThanOrEqual", "name": "dTLh6Zdj", "predicateType": "SeasonTierPredicate", "value": "t88jKSq3", "values": ["lBQLXXLF", "az7WvwAY", "KR01pEXg"]}]}, {"operator": "and", "predicates": [{"anyOf": 45, "comparison": "includes", "name": "oznIVCVs", "predicateType": "EntitlementPredicate", "value": "tB4lt4qX", "values": ["NXsPiUkE", "ayvc4ck1", "lIxoTnP4"]}, {"anyOf": 85, "comparison": "isGreaterThanOrEqual", "name": "3J8mhiIa", "predicateType": "SeasonTierPredicate", "value": "YXCNn0GC", "values": ["o9XWve1R", "jrM3uJ8P", "TFmw3njm"]}, {"anyOf": 95, "comparison": "isGreaterThanOrEqual", "name": "GevG19ho", "predicateType": "SeasonPassPredicate", "value": "CrHSs7PA", "values": ["K08O1Xyt", "1fAU1g9M", "mIPhnjoJ"]}]}, {"operator": "and", "predicates": [{"anyOf": 86, "comparison": "isLessThanOrEqual", "name": "33DuRD9i", "predicateType": "SeasonTierPredicate", "value": "rnbOgrOO", "values": ["EXvOURh6", "gRUfYRn9", "RaW6X2Kq"]}, {"anyOf": 11, "comparison": "includes", "name": "b4gBnZC0", "predicateType": "SeasonTierPredicate", "value": "y2dhCyU6", "values": ["OABeg1cC", "hao2tAX0", "k44nzD1K"]}, {"anyOf": 71, "comparison": "isGreaterThan", "name": "S9elExmT", "predicateType": "SeasonTierPredicate", "value": "lLtOa26b", "values": ["FRxv64u6", "me5pihXM", "5fk83mMH"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'HQMEMWhi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "w8ZhBG4U"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --name 'ybbEWQ4v' \
    --offset '53' \
    --tag 'vPlFWvJU' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "n71PncSI", "name": "gGHpjgiI", "status": "ACTIVE", "tags": ["A0pIixyF", "Gw1uPUXI", "CeDzABKw"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'I9itJUAX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'J5UPHrk6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "A0cwlrJg", "name": "yUwHugDj", "status": "ACTIVE", "tags": ["taYqty6a", "nJNTSYzU", "2xOLVcPk"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '3krxLseg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'YkerGfoS' \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '97' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '2yltAExC' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'jnkB8HQ8' \
    --limit '60' \
    --offset '71' \
    --orderNos 's4QPgggJ,zahxaoAp,UDdXt1pi' \
    --sortBy 'pWRjYKzc' \
    --startTime 'B5Zn9jwI' \
    --status 'CHARGEBACK' \
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
    --orderNo '9DnMhOWx' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kBtZ5Xl7' \
    --body '{"description": "wk4siH8e"}' \
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
    --body '{"dryRun": true, "notifyUrl": "D5VtoN5G", "privateKey": "QBpBeHuz"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'LjjfxiCo' \
    --externalId '894TUvPy' \
    --limit '12' \
    --notificationSource 'PAYPAL' \
    --notificationType 'SFkHHmpj' \
    --offset '26' \
    --paymentOrderNo 'T972c9Pn' \
    --startDate '0kMT8QBU' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'nRsC3UJ6' \
    --limit '45' \
    --offset '61' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "k4IMSmoR", "currencyNamespace": "RLO0ApY8", "customParameters": {"FmyDjDUy": {}, "ebOFFSNX": {}, "LxylfPdt": {}}, "description": "KLPiikTQ", "extOrderNo": "vv4V2Dyu", "extUserId": "9HFapGZE", "itemType": "SEASON", "language": "MTb_581", "metadata": {"fxeqYAil": "ypQyfG09", "LJmpxIsB": "GVwfsyyY", "rE4X4U9C": "UkopHuCQ"}, "notifyUrl": "qzv9b3P3", "omitNotification": false, "platform": "KpXiCORk", "price": 19, "recurringPaymentOrderNo": "UjTe3N7n", "region": "lQVvcLH6", "returnUrl": "lySpoyXV", "sandbox": true, "sku": "xJBIoWoa", "subscriptionId": "bjNmJIT6", "targetNamespace": "5sGnCelN", "targetUserId": "RlHlwwAK", "title": "hVrMJuSg"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'EBe3HWqi' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LIkz2kS2' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'teTmHcLh' \
    --body '{"extTxId": "q2oz2jzJ", "paymentMethod": "dlhfsetD", "paymentProvider": "STRIPE"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Y3fHPXJs' \
    --body '{"description": "7WJPWHgX"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '5ROiboUL' \
    --body '{"amount": 8, "currencyCode": "i4WlGoH1", "notifyType": "REFUND", "paymentProvider": "CHECKOUT", "salesTax": 45, "vat": 95}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gVUdmmaQ' \
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
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["GooglePlay", "Xbox", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 GetPaymentCallbackConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetPaymentCallbackConfig1' test.out

#- 137 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateRevocationConfig' test.out

#- 138 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'DeleteRevocationConfig' test.out

#- 139 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'dK97ObTx' \
    --limit '46' \
    --offset '11' \
    --source 'ORDER' \
    --startTime 'kZyL8cL6' \
    --status 'FAIL' \
    --transactionId 'BZNfiI4S' \
    --userId 'ffSUlnAH' \
    > test.out 2>&1
eval_tap $? 139 'QueryRevocationHistories' test.out

#- 140 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "8hqTcNX1", "eventTopic": "5SLxiNyg", "maxAwarded": 73, "maxAwardedPerUser": 72, "namespaceExpression": "926dKBoB", "rewardCode": "MnPLrO04", "rewardConditions": [{"condition": "AMvrHhPL", "conditionName": "1rVVeNJh", "eventName": "w5IYXtm5", "rewardItems": [{"duration": 79, "itemId": "SW7lWDiL", "quantity": 63}, {"duration": 67, "itemId": "i6xDz6Zz", "quantity": 51}, {"duration": 3, "itemId": "FcLwzk0O", "quantity": 20}]}, {"condition": "RLAGkqJm", "conditionName": "Wvoplb08", "eventName": "5HN4zMGH", "rewardItems": [{"duration": 9, "itemId": "9xg9lIFr", "quantity": 32}, {"duration": 52, "itemId": "nq5sX3cD", "quantity": 43}, {"duration": 47, "itemId": "Q7g4rqhA", "quantity": 95}]}, {"condition": "bYgk69sz", "conditionName": "83h5YNV6", "eventName": "qYg7L9Fa", "rewardItems": [{"duration": 88, "itemId": "EjYVMdyi", "quantity": 73}, {"duration": 38, "itemId": "sbN2Cwi3", "quantity": 70}, {"duration": 34, "itemId": "PxOpK2ck", "quantity": 63}]}], "userIdExpression": "mRK8vfwV"}' \
    > test.out 2>&1
eval_tap $? 140 'CreateReward' test.out

#- 141 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'qe8jnOoc' \
    --limit '39' \
    --offset '42' \
    --sortBy 'namespace:desc,rewardCode,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 141 'QueryRewards' test.out

#- 142 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'ExportRewards' test.out

#- 143 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 143 'ImportRewards' test.out

#- 144 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'OP6U0lCP' \
    > test.out 2>&1
eval_tap $? 144 'GetReward' test.out

#- 145 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'V3C0DHR2' \
    --body '{"description": "1x0PgaNi", "eventTopic": "hVYWOsU5", "maxAwarded": 53, "maxAwardedPerUser": 89, "namespaceExpression": "wB5qcWOq", "rewardCode": "bavGw02m", "rewardConditions": [{"condition": "fC5Kf87L", "conditionName": "AZtO7qRp", "eventName": "bNIIs8QP", "rewardItems": [{"duration": 77, "itemId": "wuPxHEjv", "quantity": 88}, {"duration": 82, "itemId": "Em0tmTRe", "quantity": 30}, {"duration": 68, "itemId": "7nkiq2uh", "quantity": 7}]}, {"condition": "924terZy", "conditionName": "yVMkLXwI", "eventName": "1jT9PqnZ", "rewardItems": [{"duration": 42, "itemId": "EKFL19Cm", "quantity": 36}, {"duration": 14, "itemId": "PuNyDAlp", "quantity": 19}, {"duration": 73, "itemId": "Mz1bX809", "quantity": 99}]}, {"condition": "H72O6zQ1", "conditionName": "KGYWeMKk", "eventName": "Cf4wzot2", "rewardItems": [{"duration": 4, "itemId": "y3QyQW1e", "quantity": 0}, {"duration": 34, "itemId": "f9p8dtM5", "quantity": 76}, {"duration": 25, "itemId": "nEq2bCQR", "quantity": 6}]}], "userIdExpression": "Yd91obbv"}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateReward' test.out

#- 146 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'MQSw4Upe' \
    > test.out 2>&1
eval_tap $? 146 'DeleteReward' test.out

#- 147 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'LnSA9In7' \
    --body '{"payload": {"oKLssOh3": {}, "qNqy21jN": {}, "BQl6FQun": {}}}' \
    > test.out 2>&1
eval_tap $? 147 'CheckEventCondition' test.out

#- 148 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'GRNueMh9' \
    --body '{"conditionName": "DiEV3YWD", "userId": "1r9DmtKk"}' \
    > test.out 2>&1
eval_tap $? 148 'DeleteRewardConditionRecord' test.out

#- 149 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end '0RxwG1Q1' \
    --limit '52' \
    --offset '55' \
    --start 'OEUS8YGh' \
    --storeId 'oKZTwktU' \
    --viewId 'OsZW1qdT' \
    > test.out 2>&1
eval_tap $? 149 'QuerySections' test.out

#- 150 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dhWg1tjE' \
    --body '{"active": false, "displayOrder": 7, "endDate": "1971-09-14T00:00:00Z", "ext": {"GVGoUizh": {}, "ndWAb2ta": {}, "vAAnkxeX": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 7, "itemCount": 91, "rule": "SEQUENCE"}, "items": [{"id": "ci9rs1CX", "sku": "9FLhKSAs"}, {"id": "0bZ5Pdzc", "sku": "2lLWHiuR"}, {"id": "GVy2Jq1I", "sku": "yE8S4MfU"}], "localizations": {"9pKcSTn6": {"description": "HpLi1UxS", "localExt": {"lueblMh8": {}, "kwAwx0aM": {}, "hMpU9P0J": {}}, "longDescription": "vhJF75AN", "title": "4WXscSV4"}, "SD2EILJN": {"description": "kgO7GFGc", "localExt": {"Qo1bMyBC": {}, "qaGbdQGx": {}, "PZOWFlKo": {}}, "longDescription": "a4miZfxi", "title": "rmENAZJy"}, "ZpbIqDpq": {"description": "H0fvrM9Z", "localExt": {"EslKw8NK": {}, "q4TG3R5U": {}, "TCMyMhVx": {}}, "longDescription": "3Z3e1lcg", "title": "Dbu2EObL"}}, "name": "YRUDbaiG", "rotationType": "CUSTOM", "startDate": "1992-02-26T00:00:00Z", "viewId": "s3Awx8Fp"}' \
    > test.out 2>&1
eval_tap $? 150 'CreateSection' test.out

#- 151 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'e0OpRzH4' \
    > test.out 2>&1
eval_tap $? 151 'PurgeExpiredSection' test.out

#- 152 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'LfR95USq' \
    --storeId 'SyYX1qyh' \
    > test.out 2>&1
eval_tap $? 152 'GetSection' test.out

#- 153 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ba2oyNnL' \
    --storeId 'zVZYbvLW' \
    --body '{"active": false, "displayOrder": 22, "endDate": "1980-10-27T00:00:00Z", "ext": {"3vP8ZCaD": {}, "yCf3B5Q5": {}, "AoiCTAPn": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 55, "itemCount": 8, "rule": "SEQUENCE"}, "items": [{"id": "sCiOmqrv", "sku": "PzoGwSTq"}, {"id": "05WpvdeB", "sku": "LiBmHMU3"}, {"id": "zUeVmo52", "sku": "NYnBeGeo"}], "localizations": {"YSzsMrwl": {"description": "vdYIeJzM", "localExt": {"HqyNcOyo": {}, "HmZQfhiI": {}, "K1CQduNL": {}}, "longDescription": "3vpnQYlx", "title": "se3asoEI"}, "D349yoZ6": {"description": "APU8PsfT", "localExt": {"dR7I7pfM": {}, "FcW5iDDB": {}, "J8rplWfb": {}}, "longDescription": "wCEeOO9X", "title": "VG02Dgk6"}, "8z5KW1Ll": {"description": "wm7VHCJD", "localExt": {"zUQbZ4gc": {}, "0UuIGsmw": {}, "MuNQTC5U": {}}, "longDescription": "HIhB5qC4", "title": "ExA8ZoMt"}}, "name": "BBNre7Bs", "rotationType": "NONE", "startDate": "1991-05-16T00:00:00Z", "viewId": "h3SvUraS"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateSection' test.out

#- 154 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'gd0uEKgE' \
    --storeId 'wYzSIDzL' \
    > test.out 2>&1
eval_tap $? 154 'DeleteSection' test.out

#- 155 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'ListStores' test.out

#- 156 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "sfLEuCg1", "defaultRegion": "yZPP73N2", "description": "EQ8e8hhJ", "supportedLanguages": ["isGzhe0v", "B58y7nTQ", "KvVwFTqI"], "supportedRegions": ["pJ6ozTnO", "qeuzSed1", "3Lf2p5Wg"], "title": "IxiTcjGU"}' \
    > test.out 2>&1
eval_tap $? 156 'CreateStore' test.out

#- 157 ImportStore
eval_tap 0 157 'ImportStore # SKIP deprecated' test.out

#- 158 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 158 'GetPublishedStore' test.out

#- 159 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'DeletePublishedStore' test.out

#- 160 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 160 'GetPublishedStoreBackup' test.out

#- 161 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'RollbackPublishedStore' test.out

#- 162 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l8E1pURx' \
    > test.out 2>&1
eval_tap $? 162 'GetStore' test.out

#- 163 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '301N4AM6' \
    --body '{"defaultLanguage": "xyZYZVss", "defaultRegion": "eG1q1TiM", "description": "FVRQ7uSX", "supportedLanguages": ["5oxujZrO", "atG5Uh4I", "zElO7RZS"], "supportedRegions": ["Y0yfKpdM", "bR1VCbbc", "YdrKAfqS"], "title": "oPVg1WH8"}' \
    > test.out 2>&1
eval_tap $? 163 'UpdateStore' test.out

#- 164 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '48aTVa8M' \
    > test.out 2>&1
eval_tap $? 164 'DeleteStore' test.out

#- 165 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'd2a5fhn9' \
    --action 'DELETE' \
    --itemSku 'ejpo7THe' \
    --itemType 'SUBSCRIPTION' \
    --limit '12' \
    --offset '69' \
    --selected  \
    --sortBy 'createdAt:desc,updatedAt:asc,createdAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'KksBkKQF' \
    --updatedAtStart 'EnfrQOxb' \
    > test.out 2>&1
eval_tap $? 165 'QueryChanges' test.out

#- 166 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AX5MZYfE' \
    > test.out 2>&1
eval_tap $? 166 'PublishAll' test.out

#- 167 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IPde9p0p' \
    > test.out 2>&1
eval_tap $? 167 'PublishSelected' test.out

#- 168 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mbgv6iWp' \
    > test.out 2>&1
eval_tap $? 168 'SelectAllRecords' test.out

#- 169 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sX5d2TAx' \
    --action 'CREATE' \
    --itemSku 'KpQD79Xx' \
    --itemType 'MEDIA' \
    --type 'STORE' \
    --updatedAtEnd 'HyDLgKEd' \
    --updatedAtStart 'yEtIb8L5' \
    > test.out 2>&1
eval_tap $? 169 'GetStatistic' test.out

#- 170 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rHjn22DG' \
    > test.out 2>&1
eval_tap $? 170 'UnselectAllRecords' test.out

#- 171 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '6v7qXoQx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qmxsRop2' \
    > test.out 2>&1
eval_tap $? 171 'SelectRecord' test.out

#- 172 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'uiXJCoeW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sTPtHXE2' \
    > test.out 2>&1
eval_tap $? 172 'UnselectRecord' test.out

#- 173 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yyNWJNkE' \
    --targetStoreId 'Y5bSS1yf' \
    > test.out 2>&1
eval_tap $? 173 'CloneStore' test.out

#- 174 ExportStore
eval_tap 0 174 'ExportStore # SKIP deprecated' test.out

#- 175 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'Og6ey4tN' \
    --limit '94' \
    --offset '29' \
    --sku '68UJ8Qwh' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId 'jVEfnAVU' \
    > test.out 2>&1
eval_tap $? 175 'QuerySubscriptions' test.out

#- 176 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OkRINkn7' \
    > test.out 2>&1
eval_tap $? 176 'RecurringChargeSubscription' test.out

#- 177 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'z1dh9Oi2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'GetTicketDynamic' test.out

#- 178 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'Wd95gky9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "IIWVfwWV"}' \
    > test.out 2>&1
eval_tap $? 178 'DecreaseTicketSale' test.out

#- 179 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'hqgLfZvm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'GetTicketBoothID' test.out

#- 180 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'XK0EkeJm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 87, "orderNo": "qB8PiR0X"}' \
    > test.out 2>&1
eval_tap $? 180 'IncreaseTicketSale' test.out

#- 181 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'VcGYZxOe' \
    --body '{"achievements": [{"id": "iefVkXOO", "value": 9}, {"id": "OxW9nO0R", "value": 41}, {"id": "bCoW4mjM", "value": 35}], "steamUserId": "48DBrxKC"}' \
    > test.out 2>&1
eval_tap $? 181 'UnlockSteamUserAchievement' test.out

#- 182 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'a5lsBLyz' \
    --xboxUserId 'cZJv720r' \
    > test.out 2>&1
eval_tap $? 182 'GetXblUserAchievements' test.out

#- 183 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'He1uXLLc' \
    --body '{"achievements": [{"id": "rSXt6cAc", "percentComplete": 44}, {"id": "K65MGq5I", "percentComplete": 27}, {"id": "vugB73Vo", "percentComplete": 98}], "serviceConfigId": "hzS7FRh6", "titleId": "9DsM8cwq", "xboxUserId": "oZwZdxkg"}' \
    > test.out 2>&1
eval_tap $? 183 'UpdateXblUserAchievement' test.out

#- 184 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'MJA4VTlT' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeCampaign' test.out

#- 185 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'a0F44IPD' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeEntitlement' test.out

#- 186 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'xAhPTEK0' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeFulfillment' test.out

#- 187 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '3tg7RBOn' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeIntegration' test.out

#- 188 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '2pchqrj8' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizeOrder' test.out

#- 189 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'LQPlun2v' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizePayment' test.out

#- 190 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'nkWjELPH' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeRevocation' test.out

#- 191 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'LjRtNTbo' \
    > test.out 2>&1
eval_tap $? 191 'AnonymizeSubscription' test.out

#- 192 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'fxEcvgw3' \
    > test.out 2>&1
eval_tap $? 192 'AnonymizeWallet' test.out

#- 193 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZ6QjCrE' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 193 'GetUserDLC' test.out

#- 194 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'tCWsKYz3' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'znJCHL2J' \
    --features '4ef22I9M,jHSZebJ9,ZGHBoJIi' \
    --itemId 'iDIOCcVK,47Oefomm,DpJUK4fi' \
    --limit '42' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 194 'QueryUserEntitlements' test.out

#- 195 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'kk6IWIDB' \
    --body '[{"endDate": "1998-12-18T00:00:00Z", "grantedCode": "jRyTt1IR", "itemId": "llEOSWD7", "itemNamespace": "jbXoEpQz", "language": "NDza_EZmt", "quantity": 53, "region": "0R2OM7k7", "source": "ACHIEVEMENT", "startDate": "1984-11-06T00:00:00Z", "storeId": "gaFmhzvF"}, {"endDate": "1973-04-04T00:00:00Z", "grantedCode": "j81kyLmM", "itemId": "OnVkoF5T", "itemNamespace": "PEgoVj2M", "language": "Iih-YjNQ_Mh", "quantity": 16, "region": "X24v7PpN", "source": "PURCHASE", "startDate": "1991-08-08T00:00:00Z", "storeId": "i1hiCjIH"}, {"endDate": "1992-02-07T00:00:00Z", "grantedCode": "J7oc79oH", "itemId": "tYDyYedN", "itemNamespace": "DSqRaAsx", "language": "TSz_PM", "quantity": 72, "region": "KOHZGSiw", "source": "IAP", "startDate": "1997-10-20T00:00:00Z", "storeId": "3Aji8vvq"}]' \
    > test.out 2>&1
eval_tap $? 195 'GrantUserEntitlement' test.out

#- 196 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'GNcVdGhc' \
    --activeOnly  \
    --appId 'hNERMaEQ' \
    > test.out 2>&1
eval_tap $? 196 'GetUserAppEntitlementByAppId' test.out

#- 197 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '9L24gNWe' \
    --activeOnly  \
    --limit '40' \
    --offset '76' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 197 'QueryUserEntitlementsByAppType' test.out

#- 198 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ICAmlLWt' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'gjApE1kR' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementByItemId' test.out

#- 199 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'OAgrcV1S' \
    --ids 'EgVxmW7T,5AQf8KX8,uqM4rtoh' \
    > test.out 2>&1
eval_tap $? 199 'GetUserActiveEntitlementsByItemIds' test.out

#- 200 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'pdwXbp28' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'tAFNItLR' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementBySku' test.out

#- 201 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WQdr1ib5' \
    --appIds 'sKZ9o5qu,shx5jHZq,X1znfxr9' \
    --itemIds 'kqT1hEHW,cSzqwpRK,fjdRsRKM' \
    --skus 'jmuPiBZq,vL4zhB9l,65774l3h' \
    > test.out 2>&1
eval_tap $? 201 'ExistsAnyUserActiveEntitlement' test.out

#- 202 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'VRjZ4tke' \
    --itemIds 'GFp5wlbD,qrH8KcKK,cL17AuQq' \
    > test.out 2>&1
eval_tap $? 202 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 203 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pbs1ts6B' \
    --appId 'lZasWFNc' \
    > test.out 2>&1
eval_tap $? 203 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 204 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9QjNBA6X' \
    --entitlementClazz 'APP' \
    --itemId 'mG4sMONj' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipByItemId' test.out

#- 205 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'WyiOZeiN' \
    --ids 'KmvRkO7t,kaIKqlAh,dxC1WLU1' \
    > test.out 2>&1
eval_tap $? 205 'GetUserEntitlementOwnershipByItemIds' test.out

#- 206 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rgejpc8q' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'd0xBvgue' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlementOwnershipBySku' test.out

#- 207 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjCoDNxY' \
    --entitlementIds 'lnqqEftV' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserEntitlements' test.out

#- 208 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'Y3HN8c3x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ga0iHycR' \
    > test.out 2>&1
eval_tap $? 208 'GetUserEntitlement' test.out

#- 209 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'RpKDirY5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NSWNuNie' \
    --body '{"endDate": "1989-01-06T00:00:00Z", "nullFieldList": ["ZhWkgX6G", "C22QmmeC", "87qgJaL4"], "startDate": "1996-01-01T00:00:00Z", "status": "ACTIVE", "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateUserEntitlement' test.out

#- 210 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'Nox1L2cM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aKwdxYLQ' \
    --body '{"options": ["8RtTmN8G", "9ir6VuM0", "qKE1ES5s"], "requestId": "NbC3iyxq", "useCount": 54}' \
    > test.out 2>&1
eval_tap $? 210 'ConsumeUserEntitlement' test.out

#- 211 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '2HF1fhQU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MJT1CFU8' \
    > test.out 2>&1
eval_tap $? 211 'DisableUserEntitlement' test.out

#- 212 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'cm721ffQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IN8exQqV' \
    > test.out 2>&1
eval_tap $? 212 'EnableUserEntitlement' test.out

#- 213 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Z3PTzBqx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HWaCfIUI' \
    > test.out 2>&1
eval_tap $? 213 'GetUserEntitlementHistories' test.out

#- 214 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'WCFD21AG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aO162bdO' \
    > test.out 2>&1
eval_tap $? 214 'RevokeUserEntitlement' test.out

#- 215 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'db4xOMnb' \
    --body '{"duration": 73, "endDate": "1994-03-21T00:00:00Z", "itemId": "bU5GqZCK", "itemSku": "2G4L6SnU", "language": "BycBc731", "order": {"currency": {"currencyCode": "oheUQ26s", "currencySymbol": "RA4MvrDs", "currencyType": "VIRTUAL", "decimals": 63, "namespace": "XSvq0Jmu"}, "ext": {"QCqH8aep": {}, "FoDC6ne2": {}, "O2yYOMQS": {}}, "free": true}, "orderNo": "T63dmpxt", "origin": "Other", "quantity": 39, "region": "Zn6Bs8zi", "source": "REDEEM_CODE", "startDate": "1985-07-08T00:00:00Z", "storeId": "rHoXWQbP"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillItem' test.out

#- 216 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rak0LN8E' \
    --body '{"code": "TyNdbLty", "language": "dmIq-HUiw", "region": "KviROUYE"}' \
    > test.out 2>&1
eval_tap $? 216 'RedeemCode' test.out

#- 217 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'seOyckIc' \
    --body '{"origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "PTO3q0Tl", "namespace": "1GmEOufp"}, "item": {"itemId": "DktoA3n2", "itemSku": "HufJyWG0", "itemType": "pfewpnFp"}, "quantity": 44, "type": "CURRENCY"}, {"currency": {"currencyCode": "2BLqyb8Y", "namespace": "BHosCGPJ"}, "item": {"itemId": "DhABJbfn", "itemSku": "0ZNmiAXN", "itemType": "681LjDr6"}, "quantity": 93, "type": "CURRENCY"}, {"currency": {"currencyCode": "Mkz4zzyz", "namespace": "GElSwayq"}, "item": {"itemId": "Q3dVqqVS", "itemSku": "gXJBoB9r", "itemType": "tWyBJvrt"}, "quantity": 5, "type": "ITEM"}], "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 217 'FulfillRewards' test.out

#- 218 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZRG7mP2j' \
    --endTime 'qZnekxwy' \
    --limit '87' \
    --offset '87' \
    --productId 'isC3YjUz' \
    --startTime 'icISNIy2' \
    --status 'FAILED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPOrders' test.out

#- 219 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'AtyAAXn4' \
    > test.out 2>&1
eval_tap $? 219 'QueryAllUserIAPOrders' test.out

#- 220 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'j0pL5ZAp' \
    --endTime 'vWwWWcLC' \
    --limit '70' \
    --offset '1' \
    --startTime '19enW7NB' \
    --status 'FAIL' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserIAPConsumeHistory' test.out

#- 221 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hBVihBSU' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "Wmpf_096", "productId": "oMtaKivf", "region": "yX09KYxl", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 221 'MockFulfillIAPItem' test.out

#- 222 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'X39pte5v' \
    --itemId 'vFssMEtu' \
    --limit '73' \
    --offset '45' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserOrders' test.out

#- 223 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '4FlHNWDx' \
    --body '{"currencyCode": "Hrb1hbWg", "currencyNamespace": "bEEnxl93", "discountedPrice": 50, "ext": {"YvLD49wD": {}, "WijExLbx": {}, "9xloIcFl": {}}, "itemId": "Txncppkf", "language": "bdpO7ZNj", "options": {"skipPriceValidation": false}, "platform": "Xbox", "price": 6, "quantity": 40, "region": "I97tVeqC", "returnUrl": "QSzvlG4s", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateUserOrder' test.out

#- 224 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'YUTMshJf' \
    --itemId 'FtNkcCDG' \
    > test.out 2>&1
eval_tap $? 224 'CountOfPurchasedItem' test.out

#- 225 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5LTC64bt' \
    --userId 'lVTmfqCR' \
    > test.out 2>&1
eval_tap $? 225 'GetUserOrder' test.out

#- 226 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qyKpuZVK' \
    --userId 'dEOwKzS3' \
    --body '{"status": "CLOSED", "statusReason": "2uDRWgtM"}' \
    > test.out 2>&1
eval_tap $? 226 'UpdateUserOrderStatus' test.out

#- 227 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UlDUy2In' \
    --userId '3cHuESwh' \
    > test.out 2>&1
eval_tap $? 227 'FulfillUserOrder' test.out

#- 228 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'onGc2lMW' \
    --userId '4y74nlut' \
    > test.out 2>&1
eval_tap $? 228 'GetUserOrderGrant' test.out

#- 229 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'On8Q1tVB' \
    --userId '0OJE48Gz' \
    > test.out 2>&1
eval_tap $? 229 'GetUserOrderHistories' test.out

#- 230 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PSvLYW0i' \
    --userId '1wRHCK5o' \
    --body '{"additionalData": {"cardSummary": "U595wDQ5"}, "authorisedTime": "1992-12-30T00:00:00Z", "chargebackReversedTime": "1981-01-22T00:00:00Z", "chargebackTime": "1971-09-04T00:00:00Z", "chargedTime": "1992-01-20T00:00:00Z", "createdTime": "1983-03-11T00:00:00Z", "currency": {"currencyCode": "dajFCTyV", "currencySymbol": "WvY2g6kf", "currencyType": "VIRTUAL", "decimals": 9, "namespace": "SjqOmD7Y"}, "customParameters": {"F28fsoe2": {}, "v4LQw9YM": {}, "UsIfp6f7": {}}, "extOrderNo": "LK1c0dLk", "extTxId": "m2sb5VuO", "extUserId": "EdNUrGGj", "issuedAt": "1980-05-20T00:00:00Z", "metadata": {"K5hNYcrE": "8BrLvPbf", "G2VDVgOz": "XdONuMdm", "oBcjATXm": "4NLYempo"}, "namespace": "82F2pP8s", "nonceStr": "0U2zV0m5", "paymentMethod": "YokX0Of4", "paymentMethodFee": 94, "paymentOrderNo": "hMf8swcn", "paymentProvider": "STRIPE", "paymentProviderFee": 18, "paymentStationUrl": "4xLK1LJO", "price": 72, "refundedTime": "1991-02-04T00:00:00Z", "salesTax": 0, "sandbox": false, "sku": "afjfsbLp", "status": "AUTHORISED", "statusReason": "227yEXDs", "subscriptionId": "cVcEupvy", "subtotalPrice": 46, "targetNamespace": "NzlyIIGt", "targetUserId": "uhQ0GhwD", "tax": 99, "totalPrice": 53, "totalTax": 36, "txEndTime": "1976-01-14T00:00:00Z", "type": "PrhGBNIZ", "userId": "DjS4G2sh", "vat": 13}' \
    > test.out 2>&1
eval_tap $? 230 'ProcessUserOrderNotification' test.out

#- 231 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZctAOf3W' \
    --userId 'MDqG8PNo' \
    > test.out 2>&1
eval_tap $? 231 'DownloadUserOrderReceipt' test.out

#- 232 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'dk0UgC81' \
    --body '{"currencyCode": "bPVrauwm", "currencyNamespace": "A6Sz1HWF", "customParameters": {"xgvoSkLw": {}, "cozJKg5o": {}, "H0eMHgU6": {}}, "description": "qBp8jlth", "extOrderNo": "8PRz56ph", "extUserId": "lRuQaeHK", "itemType": "CODE", "language": "uCW", "metadata": {"4EFCag0j": "hEfk43a0", "vlnoq4Wp": "TzzkC5G3", "uFnpp9Od": "qJOAl8X4"}, "notifyUrl": "CQvFCLZN", "omitNotification": true, "platform": "fQw0t652", "price": 5, "recurringPaymentOrderNo": "ZrXeNJFf", "region": "A6G16du1", "returnUrl": "tqMaMJif", "sandbox": false, "sku": "77z1jsVV", "subscriptionId": "UFVlasue", "title": "C3upjyQd"}' \
    > test.out 2>&1
eval_tap $? 232 'CreateUserPaymentOrder' test.out

#- 233 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cKriKwx7' \
    --userId 'wHTwDwSO' \
    --body '{"description": "vRh9NOgm"}' \
    > test.out 2>&1
eval_tap $? 233 'RefundUserPaymentOrder' test.out

#- 234 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z8PhJvJy' \
    --body '{"code": "9reEULH7", "orderNo": "twKz5ufM"}' \
    > test.out 2>&1
eval_tap $? 234 'ApplyUserRedemption' test.out

#- 235 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'KAmNakWY' \
    --body '{"meta": {"GTmZGE4n": {}, "iJnS0WtJ": {}, "GsW7kyQa": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Twitch", "currencyCode": "5eUIXxBh", "namespace": "cQMRHx8E"}, "entitlement": {"clazz": "APP", "entitlementId": "zrf3hp0G", "type": "CONSUMABLE"}, "item": {"itemIdentity": "0tonkmpP", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 69, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "lWhsjivv", "namespace": "vmDqx8jH"}, "entitlement": {"clazz": "APP", "entitlementId": "IFDHLk7B", "type": "CONSUMABLE"}, "item": {"itemIdentity": "8rMonoLZ", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 1, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "PVH5S9lT", "namespace": "kyAQR1RV"}, "entitlement": {"clazz": "MEDIA", "entitlementId": "hHcm7jdP", "type": "DURABLE"}, "item": {"itemIdentity": "EKs3aroj", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 57, "type": "CURRENCY"}], "source": "ORDER", "transactionId": "zBgvhLoK"}' \
    > test.out 2>&1
eval_tap $? 235 'DoRevocation' test.out

#- 236 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'MYBgobUs' \
    --chargeStatus 'NEVER' \
    --itemId 'DgPoCf8z' \
    --limit '70' \
    --offset '87' \
    --sku 'G6hHTlkd' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 236 'QueryUserSubscriptions' test.out

#- 237 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'OZAhnDG0' \
    --excludeSystem  \
    --limit '57' \
    --offset '3' \
    --subscriptionId 'XUGlRS4R' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscriptionActivities' test.out

#- 238 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdQCp5ou' \
    --body '{"grantDays": 11, "itemId": "gKfjZB9V", "language": "4pygz2XZ", "reason": "zV4ouDn6", "region": "CKExWo8L", "source": "tSnKwkSv"}' \
    > test.out 2>&1
eval_tap $? 238 'PlatformSubscribeSubscription' test.out

#- 239 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'X6pqXFtF' \
    --itemId 'oaC5paYL' \
    > test.out 2>&1
eval_tap $? 239 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 240 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Et8apFMr' \
    --userId 'yzBUloxb' \
    > test.out 2>&1
eval_tap $? 240 'GetUserSubscription' test.out

#- 241 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'colxZdcm' \
    --userId 'ka0Ri4BF' \
    > test.out 2>&1
eval_tap $? 241 'DeleteUserSubscription' test.out

#- 242 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7W7TOOHz' \
    --userId 'elyFrXYS' \
    --force  \
    --body '{"immediate": false, "reason": "X3n3D7Fr"}' \
    > test.out 2>&1
eval_tap $? 242 'CancelSubscription' test.out

#- 243 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8g1NTu8d' \
    --userId 'pddLPUUy' \
    --body '{"grantDays": 42, "reason": "yWNvYYYd"}' \
    > test.out 2>&1
eval_tap $? 243 'GrantDaysToSubscription' test.out

#- 244 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HKRmw7ar' \
    --userId 'k2gsdnOH' \
    --excludeFree  \
    --limit '84' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 244 'GetUserSubscriptionBillingHistories' test.out

#- 245 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QYlSUgRh' \
    --userId '9ea6wfT1' \
    --body '{"additionalData": {"cardSummary": "uSGJKHnr"}, "authorisedTime": "1976-02-03T00:00:00Z", "chargebackReversedTime": "1978-11-30T00:00:00Z", "chargebackTime": "1978-09-03T00:00:00Z", "chargedTime": "1983-11-17T00:00:00Z", "createdTime": "1983-04-09T00:00:00Z", "currency": {"currencyCode": "oBG41Svv", "currencySymbol": "6ko8aOxc", "currencyType": "VIRTUAL", "decimals": 64, "namespace": "b7lBSn48"}, "customParameters": {"SAt8vK5v": {}, "l8buWzur": {}, "2KUmHTZU": {}}, "extOrderNo": "we4SSXWi", "extTxId": "nRcuc1uF", "extUserId": "1hrYNoKP", "issuedAt": "1997-06-09T00:00:00Z", "metadata": {"5oW8iovm": "DPNk0ixy", "iTir5SlB": "ZwUZEPnr", "lhK7aF9Z": "xirKYStl"}, "namespace": "8WGlrHQX", "nonceStr": "UygW5zwu", "paymentMethod": "m1RUIsWf", "paymentMethodFee": 80, "paymentOrderNo": "WcJGHoTN", "paymentProvider": "STRIPE", "paymentProviderFee": 54, "paymentStationUrl": "Sj6d4yCo", "price": 91, "refundedTime": "1995-03-16T00:00:00Z", "salesTax": 9, "sandbox": false, "sku": "J0tBxs9r", "status": "CHARGEBACK", "statusReason": "FpFteBEP", "subscriptionId": "QvnelUyG", "subtotalPrice": 10, "targetNamespace": "3k8FHye7", "targetUserId": "e3TA1YnA", "tax": 72, "totalPrice": 95, "totalTax": 17, "txEndTime": "1987-12-09T00:00:00Z", "type": "96cedJNw", "userId": "dbS1mDNi", "vat": 66}' \
    > test.out 2>&1
eval_tap $? 245 'ProcessUserSubscriptionNotification' test.out

#- 246 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'sLyCrTQB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S0XhdBSo' \
    --body '{"count": 87, "orderNo": "eTZexv75"}' \
    > test.out 2>&1
eval_tap $? 246 'AcquireUserTicket' test.out

#- 247 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'gHCiit2x' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserCurrencyWallets' test.out

#- 248 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'UAIkZn08' \
    --namespace "$AB_NAMESPACE" \
    --userId 'feDbyrC7' \
    --body '{"allowOverdraft": false, "amount": 15, "balanceOrigin": "Nintendo", "reason": "ZlPPZM88"}' \
    > test.out 2>&1
eval_tap $? 248 'DebitUserWalletByCurrencyCode' test.out

#- 249 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'cdja1Imb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U6OGNOTe' \
    --limit '78' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 249 'ListUserCurrencyTransactions' test.out

#- 250 CheckWallet
eval_tap 0 250 'CheckWallet # SKIP deprecated' test.out

#- 251 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'DvS4WaUb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IXrVV5qL' \
    --body '{"amount": 43, "expireAt": "1975-10-09T00:00:00Z", "origin": "System", "reason": "zHlYiKqy", "source": "OTHER"}' \
    > test.out 2>&1
eval_tap $? 251 'CreditUserWallet' test.out

#- 252 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'Jc8cRAFp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jsAIvVGM' \
    --body '{"amount": 85, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 252 'PayWithUserWallet' test.out

#- 253 GetUserWallet
eval_tap 0 253 'GetUserWallet # SKIP deprecated' test.out

#- 254 DebitUserWallet
eval_tap 0 254 'DebitUserWallet # SKIP deprecated' test.out

#- 255 DisableUserWallet
eval_tap 0 255 'DisableUserWallet # SKIP deprecated' test.out

#- 256 EnableUserWallet
eval_tap 0 256 'EnableUserWallet # SKIP deprecated' test.out

#- 257 ListUserWalletTransactions
eval_tap 0 257 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 258 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RUl5T5l2' \
    > test.out 2>&1
eval_tap $? 258 'ListViews' test.out

#- 259 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vzev9VWV' \
    --body '{"displayOrder": 49, "localizations": {"gEV6slhO": {"description": "RRNHcz3e", "localExt": {"ZZguFNUd": {}, "ddcNhHDq": {}, "qFsmK7Z5": {}}, "longDescription": "cwmL1loW", "title": "pnqZkdha"}, "WODfOGV9": {"description": "tT3zMCOw", "localExt": {"rVCiqzcs": {}, "Izksu8s5": {}, "dGKIBSKt": {}}, "longDescription": "9k9TJ3qX", "title": "1r6F33VV"}, "HS5bp8m8": {"description": "Y4FcKp1w", "localExt": {"3D0vq4DB": {}, "Ht48g9Ju": {}, "1G1vtuSO": {}}, "longDescription": "jF4kQdzZ", "title": "r8PvUCuW"}}, "name": "pkmml2fd"}' \
    > test.out 2>&1
eval_tap $? 259 'CreateView' test.out

#- 260 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'wCa5v5yV' \
    --storeId 'mZ9hOhsz' \
    > test.out 2>&1
eval_tap $? 260 'GetView' test.out

#- 261 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'G34Vyrib' \
    --storeId 'RDNi7Gbr' \
    --body '{"displayOrder": 68, "localizations": {"ZW8QnbuC": {"description": "C42vDf08", "localExt": {"f9mtg5du": {}, "MLs5wlwz": {}, "JUcUlROn": {}}, "longDescription": "HCwd1dev", "title": "ctm1tmPH"}, "KKaBoJic": {"description": "eXVQpvQz", "localExt": {"cynMdL01": {}, "dI3S6wud": {}, "1dUnft5b": {}}, "longDescription": "UrFGF8wo", "title": "EreI4rJw"}, "60rKNe7x": {"description": "ym63HnYG", "localExt": {"NPfYuR3F": {}, "TM4Zqp69": {}, "JYBKU6nr": {}}, "longDescription": "XMmkoYkT", "title": "hrVXfVcK"}}, "name": "oycq0bSU"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateView' test.out

#- 262 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'tQaJINNG' \
    --storeId 'HdWjfutc' \
    > test.out 2>&1
eval_tap $? 262 'DeleteView' test.out

#- 263 QueryWallets
eval_tap 0 263 'QueryWallets # SKIP deprecated' test.out

#- 264 GetWallet
eval_tap 0 264 'GetWallet # SKIP deprecated' test.out

#- 265 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'wjLFYwTC' \
    --end 'ATAk7WmN' \
    --start 'kGdmmXmL' \
    > test.out 2>&1
eval_tap $? 265 'SyncOrders' test.out

#- 266 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["VFSuybjn", "HnKvObyw", "jsgzkzhY"], "apiKey": "4VClETWs", "authoriseAsCapture": true, "blockedPaymentMethods": ["ziIP7HB0", "SRqfHMPV", "nutJcico"], "clientKey": "SeJscQqq", "dropInSettings": "0w4inoEH", "liveEndpointUrlPrefix": "qHhMOXmb", "merchantAccount": "HTgqwifs", "notificationHmacKey": "e8i2Tlpj", "notificationPassword": "27KJWAs0", "notificationUsername": "XrCXjOaZ", "returnUrl": "fCvtFUUp", "settings": "qCsBi1eo"}' \
    > test.out 2>&1
eval_tap $? 266 'TestAdyenConfig' test.out

#- 267 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "laPyCqrb", "privateKey": "DaYnZpO0", "publicKey": "omPGzTkN", "returnUrl": "bxYrqL68"}' \
    > test.out 2>&1
eval_tap $? 267 'TestAliPayConfig' test.out

#- 268 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "K6aRYzIS", "secretKey": "dYib9kqj"}' \
    > test.out 2>&1
eval_tap $? 268 'TestCheckoutConfig' test.out

#- 269 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'QI6csIFg' \
    > test.out 2>&1
eval_tap $? 269 'DebugMatchedPaymentMerchantConfig' test.out

#- 270 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "BeIeNu4X", "clientSecret": "PbW9Qf4n", "returnUrl": "w3Tmdz4G", "webHookId": "MFgsWFE4"}' \
    > test.out 2>&1
eval_tap $? 270 'TestPayPalConfig' test.out

#- 271 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["jd07BstU", "iSZhiLmc", "zVQP6pqB"], "publishableKey": "kl4bcjTG", "secretKey": "1j23yrwK", "webhookSecret": "oSdYfRlJ"}' \
    > test.out 2>&1
eval_tap $? 271 'TestStripeConfig' test.out

#- 272 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "GoBvBTnZ", "key": "BMVNvDTL", "mchid": "s72uk99L", "returnUrl": "kexwsxTe"}' \
    > test.out 2>&1
eval_tap $? 272 'TestWxPayConfig' test.out

#- 273 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "UJQnJzpd", "flowCompletionUrl": "9iL2raVI", "merchantId": 2, "projectId": 24, "projectSecretKey": "zdWAZom4"}' \
    > test.out 2>&1
eval_tap $? 273 'TestXsollaConfig' test.out

#- 274 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'dqm3A1ky' \
    > test.out 2>&1
eval_tap $? 274 'GetPaymentMerchantConfig' test.out

#- 275 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'NbfwmPmM' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["OVvvf4nw", "8953orUI", "YvNirbNh"], "apiKey": "GeO2owAK", "authoriseAsCapture": false, "blockedPaymentMethods": ["kVj5Elrq", "TT09XGzD", "4U5tfX0y"], "clientKey": "op5QMgY6", "dropInSettings": "oYqdVxMX", "liveEndpointUrlPrefix": "KhSNoGZt", "merchantAccount": "QvXQoLTr", "notificationHmacKey": "r6ItIRtO", "notificationPassword": "EnGWZjsT", "notificationUsername": "395DN541", "returnUrl": "lMKEV9OP", "settings": "2Sz89pwZ"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateAdyenConfig' test.out

#- 276 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'QOCdgDoQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestAdyenConfigById' test.out

#- 277 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'X07jFFpM' \
    --sandbox  \
    --validate  \
    --body '{"appId": "U7ZcM0wv", "privateKey": "Lda6roX0", "publicKey": "whET3f9b", "returnUrl": "gdv3xudW"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateAliPayConfig' test.out

#- 278 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'FiCuIbNv' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestAliPayConfigById' test.out

#- 279 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'eikOciFw' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "q6rdRyaD", "secretKey": "QPgvsPTB"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateCheckoutConfig' test.out

#- 280 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'Tkb7FVU8' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestCheckoutConfigById' test.out

#- 281 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '1dyn4uRq' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "WrMar9pW", "clientSecret": "TkFVcv0g", "returnUrl": "9i6Rx5BK", "webHookId": "LTNloQu3"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdatePayPalConfig' test.out

#- 282 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'YGXcN6aq' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 282 'TestPayPalConfigById' test.out

#- 283 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'f48hkZKx' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["zEkPyKVW", "s7cOfjOi", "cX2WpAc5"], "publishableKey": "ym5QGWr0", "secretKey": "9OWXGlI0", "webhookSecret": "9vBBknoo"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdateStripeConfig' test.out

#- 284 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'MtIEACa7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 284 'TestStripeConfigById' test.out

#- 285 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'ngimGlD1' \
    --validate  \
    --body '{"appId": "YtVHzk6W", "key": "YXPqMRNo", "mchid": "OI3uZ57Y", "returnUrl": "pFXSTIO0"}' \
    > test.out 2>&1
eval_tap $? 285 'UpdateWxPayConfig' test.out

#- 286 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'K2dz3Izp' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 286 'UpdateWxPayConfigCert' test.out

#- 287 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '9EVzbP8f' \
    > test.out 2>&1
eval_tap $? 287 'TestWxPayConfigById' test.out

#- 288 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '24vqgkIL' \
    --validate  \
    --body '{"apiKey": "msst0UB5", "flowCompletionUrl": "7rN6zfpt", "merchantId": 63, "projectId": 81, "projectSecretKey": "i9SowHCu"}' \
    > test.out 2>&1
eval_tap $? 288 'UpdateXsollaConfig' test.out

#- 289 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'yc74io9t' \
    > test.out 2>&1
eval_tap $? 289 'TestXsollaConfigById' test.out

#- 290 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'x4TddEaw' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateXsollaUIConfig' test.out

#- 291 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '59' \
    --namespace "$AB_NAMESPACE" \
    --offset '9' \
    --region 'ioz2R1go' \
    > test.out 2>&1
eval_tap $? 291 'QueryPaymentProviderConfig' test.out

#- 292 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "v7YlvI63", "region": "vD2LewOs", "sandboxTaxJarApiToken": "iXUYEoyg", "specials": ["WXPAY", "STRIPE", "WALLET"], "taxJarApiToken": "fyzXaisk", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 292 'CreatePaymentProviderConfig' test.out

#- 293 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 293 'GetAggregatePaymentProviders' test.out

#- 294 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'vXMTwVCm' \
    > test.out 2>&1
eval_tap $? 294 'DebugMatchedPaymentProviderConfig' test.out

#- 295 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 295 'GetSpecialPaymentProviders' test.out

#- 296 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'QrdE0PZ1' \
    --body '{"aggregate": "ADYEN", "namespace": "Ptdf46L4", "region": "GXnNVbL6", "sandboxTaxJarApiToken": "H5vWttnh", "specials": ["ALIPAY", "PAYPAL", "ALIPAY"], "taxJarApiToken": "AvXN0YMK", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 296 'UpdatePaymentProviderConfig' test.out

#- 297 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'CbqAfUSM' \
    > test.out 2>&1
eval_tap $? 297 'DeletePaymentProviderConfig' test.out

#- 298 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 298 'GetPaymentTaxConfig' test.out

#- 299 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "w5mF3W0E", "taxJarApiToken": "c98q9gF3", "taxJarEnabled": true, "taxJarProductCodesMapping": {"bH678cj0": "kK7TLqcm", "iD2MwmQh": "U6UPnTG1", "PrBjXaES": "E0QpiyXj"}}' \
    > test.out 2>&1
eval_tap $? 299 'UpdatePaymentTaxConfig' test.out

#- 300 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'Q9ellkaL' \
    --end 'MJF6snka' \
    --start 'AwqUT4dv' \
    > test.out 2>&1
eval_tap $? 300 'SyncPaymentOrders' test.out

#- 301 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '6wxpe2F9' \
    --storeId 'Zp8Pn4Hp' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetRootCategories' test.out

#- 302 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Ev3gMrnh' \
    --storeId 'u97xQN0M' \
    > test.out 2>&1
eval_tap $? 302 'DownloadCategories' test.out

#- 303 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'lbSpspgl' \
    --namespace "$AB_NAMESPACE" \
    --language 'chhlcpM4' \
    --storeId 'IWJ95DVY' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetCategory' test.out

#- 304 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'sLMwvAVB' \
    --namespace "$AB_NAMESPACE" \
    --language 'FIL9NdEU' \
    --storeId 'xg73xHXw' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetChildCategories' test.out

#- 305 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'UHeJGty5' \
    --namespace "$AB_NAMESPACE" \
    --language 'brf22Ho8' \
    --storeId 'bzxuSbCc' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetDescendantCategories' test.out

#- 306 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 306 'PublicListCurrencies' test.out

#- 307 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '5u61fA0q' \
    --region 'Rthih0de' \
    --storeId 'gdBKZe2n' \
    --appId '3UPIYGEs' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetItemByAppId' test.out

#- 308 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'fuwk5vfS' \
    --categoryPath 'zrZpbBfK' \
    --features 'y4A8olVL' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language 'devyUP5k' \
    --limit '57' \
    --offset '89' \
    --region 'UenhdorA' \
    --sortBy 'name:desc,name:asc,updatedAt:asc' \
    --storeId 'MeCgdih4' \
    --tags 'ziLjJ4BO' \
    > test.out 2>&1
eval_tap $? 308 'PublicQueryItems' test.out

#- 309 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'k7ZA2If6' \
    --region 'QygHTmst' \
    --storeId 'RS6r7Gbe' \
    --sku 'M35UrVnV' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetItemBySku' test.out

#- 310 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'U7dFdMUQ' \
    --region 'yqDt67eV' \
    --storeId 'w2pY8H8d' \
    --itemIds 'Uqhgo372' \
    > test.out 2>&1
eval_tap $? 310 'PublicBulkGetItems' test.out

#- 311 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["lEzKIK2b", "CrEZiD3i", "4R9WVB9t"]}' \
    > test.out 2>&1
eval_tap $? 311 'PublicValidateItemPurchaseCondition' test.out

#- 312 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '99' \
    --offset '59' \
    --region 'TpBXt3F0' \
    --storeId 'C5UOBdGZ' \
    --keyword 'D6kjGmpW' \
    --language 'AOkQMdbF' \
    > test.out 2>&1
eval_tap $? 312 'PublicSearchItems' test.out

#- 313 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 's4lXLDBe' \
    --namespace "$AB_NAMESPACE" \
    --language 'naLrUPZv' \
    --region 'f4lT4gWE' \
    --storeId 'VKiwwlAG' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetApp' test.out

#- 314 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'qbRRdabU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'PublicGetItemDynamicData' test.out

#- 315 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'PqpGsNpe' \
    --namespace "$AB_NAMESPACE" \
    --language 'w5FafLEv' \
    --populateBundle  \
    --region 'MQEsdVaO' \
    --storeId 'XLetV86c' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetItem' test.out

#- 316 GetPaymentCustomization
eval_tap 0 316 'GetPaymentCustomization # SKIP deprecated' test.out

#- 317 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "hKpAe10Y", "paymentProvider": "WALLET", "returnUrl": "0KM1Dh3I", "ui": "5FY9mKaX", "zipCode": "SUkBc6m0"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetPaymentUrl' test.out

#- 318 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AYlW2NIV' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPaymentMethods' test.out

#- 319 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'd2EHwSFt' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUnpaidPaymentOrder' test.out

#- 320 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zFpOQYkv' \
    --paymentProvider 'PAYPAL' \
    --zipCode 'OZHYqX2U' \
    --body '{"token": "fbCM3FmQ"}' \
    > test.out 2>&1
eval_tap $? 320 'Pay' test.out

#- 321 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IuEZI2uD' \
    > test.out 2>&1
eval_tap $? 321 'PublicCheckPaymentOrderPaidStatus' test.out

#- 322 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ADYEN' \
    --region 'MK2J0oIg' \
    > test.out 2>&1
eval_tap $? 322 'GetPaymentPublicConfig' test.out

#- 323 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'a1VD2u9r' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetQRCode' test.out

#- 324 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'chZHUCWX' \
    --foreinginvoice 'sfMWovnd' \
    --invoiceId 'GmnxAHDX' \
    --payload '4eUwnifD' \
    --redirectResult '8K3YQ00Z' \
    --resultCode 'BKNrI9I8' \
    --sessionId 'OPFkW8EP' \
    --status 'koIPyCP7' \
    --token '7gw3ZIy4' \
    --type 'SmuQJbIQ' \
    --userId 'q66UqvGy' \
    --orderNo 'tvEOCtoU' \
    --paymentOrderNo 'oObUoEhn' \
    --paymentProvider 'ADYEN' \
    --returnUrl 'wDvMJoCt' \
    > test.out 2>&1
eval_tap $? 324 'PublicNormalizePaymentReturnUrl' test.out

#- 325 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'KvAKnTaC' \
    --paymentOrderNo 'xTI85G6n' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 325 'GetPaymentTaxValue' test.out

#- 326 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '6g2000uq' \
    > test.out 2>&1
eval_tap $? 326 'GetRewardByCode' test.out

#- 327 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'jvT4vk1n' \
    --limit '25' \
    --offset '17' \
    --sortBy 'rewardCode:desc,namespace,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 327 'QueryRewards1' test.out

#- 328 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yEaG8xDd' \
    > test.out 2>&1
eval_tap $? 328 'GetReward1' test.out

#- 329 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 329 'PublicListStores' test.out

#- 330 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'PsaLfz4G,VEuxFUhc,R4zBCFqq' \
    --itemIds '8EU5YXRX,WF8kydOX,zTyoNZ5W' \
    --skus 'AHPVeNBn,aajXHvop,9CEPyTjV' \
    > test.out 2>&1
eval_tap $? 330 'PublicExistsAnyMyActiveEntitlement' test.out

#- 331 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'NFqKmLjR' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 332 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'rxIEHSdo' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 333 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'tAGYqqrQ' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 334 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Ur0FvxlT,DjN9yaRe,6g6fzOXh' \
    --itemIds 'xoO4iwiX,nskxVfrf,y0Op8Fcm' \
    --skus 'BwatTJPI,sezzGnwE,wC0ahnOd' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetEntitlementOwnershipToken' test.out

#- 335 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'I6CB0lnC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'PublicGetMyWallet' test.out

#- 336 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'UaLVlMsq' \
    --body '{"epicGamesJwtToken": "ZQFI9ogY"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncEpicGameDLC' test.out

#- 337 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'qIf4g8Y0' \
    --body '{"serviceLabel": 29}' \
    > test.out 2>&1
eval_tap $? 337 'PublicSyncPsnDlcInventory' test.out

#- 338 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tr3CDwBv' \
    --body '{"serviceLabels": [51, 52, 15]}' \
    > test.out 2>&1
eval_tap $? 338 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 339 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eb5zYglF' \
    --body '{"appId": "NqWtGVpi", "steamId": "3YWB00wd"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncSteamDLC' test.out

#- 340 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'kM2jDeep' \
    --body '{"xstsToken": "hLg6DRqe"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncXboxDLC' test.out

#- 341 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vVTpVKi2' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'UYMXkIiY' \
    --features 'ZjnbEhUX,VX8xmVqY,wqi7ABmO' \
    --itemId '0xSncceP,h8mf5Yar,tO7YZRzj' \
    --limit '51' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 341 'PublicQueryUserEntitlements' test.out

#- 342 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '6Qiv1qr7' \
    --appId 'H1eLjxuW' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserAppEntitlementByAppId' test.out

#- 343 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'AflMcLKP' \
    --limit '76' \
    --offset '21' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 343 'PublicQueryUserEntitlementsByAppType' test.out

#- 344 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YVd6Vqr1' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'omXA2aju' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlementByItemId' test.out

#- 345 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'NG3sfMOB' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'G0eT69kA' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserEntitlementBySku' test.out

#- 346 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '3QLTtfRH' \
    --appIds 'RbZQuJMX,adgEHzwI,4WMiPZgr' \
    --itemIds '6N7FZD9g,MLYqIfS6,UY6AZZwG' \
    --skus 'Mz5a3Q4e,x4mOiEjU,rKvsZV7U' \
    > test.out 2>&1
eval_tap $? 346 'PublicExistsAnyUserActiveEntitlement' test.out

#- 347 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y7npY2zC' \
    --appId 'IExJO6zc' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 348 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'B3nLe3jt' \
    --entitlementClazz 'CODE' \
    --itemId 'E8XK9E1a' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 349 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHRP9Nvz' \
    --ids '2Mho9aV2,9lqGg9Ez,ZEZHuDO8' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 350 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'eHvNX4g0' \
    --entitlementClazz 'APP' \
    --sku '0o2ZENKR' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 351 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '3LYtSJV5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fbtFXmtZ' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserEntitlement' test.out

#- 352 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'EVeDfDBA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W9sdtLFA' \
    --body '{"options": ["gKA9UCwe", "RgP8NFju", "RnDJpkar"], "requestId": "Jw9cAWTY", "useCount": 27}' \
    > test.out 2>&1
eval_tap $? 352 'PublicConsumeUserEntitlement' test.out

#- 353 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'uJQYW3zW' \
    --body '{"code": "X3gaF90F", "language": "Rb-PB", "region": "slK2Gu8F"}' \
    > test.out 2>&1
eval_tap $? 353 'PublicRedeemCode' test.out

#- 354 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJbjHYba' \
    --body '{"excludeOldTransactions": false, "language": "IH", "productId": "TLCMjvOb", "receiptData": "emcmE0zL", "region": "yLYp2uc6", "transactionId": "Ul0waxse"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicFulfillAppleIAPItem' test.out

#- 355 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'HvFqFYmQ' \
    --body '{"epicGamesJwtToken": "jjXlsuxN"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncEpicGamesInventory' test.out

#- 356 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'i0SwvUsF' \
    --body '{"autoAck": false, "language": "XCIB-mo", "orderId": "UMOgYcTK", "packageName": "Q11N2tO9", "productId": "cgoFpXmG", "purchaseTime": 58, "purchaseToken": "ubZMIZaQ", "region": "K2hiCVRr"}' \
    > test.out 2>&1
eval_tap $? 356 'PublicFulfillGoogleIAPItem' test.out

#- 357 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mwy5UiOW' \
    --body '{"currencyCode": "wLdrqpGm", "price": 0.8495296541764853, "productId": "97svLnuq", "serviceLabel": 34}' \
    > test.out 2>&1
eval_tap $? 357 'PublicReconcilePlayStationStore' test.out

#- 358 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'DyyFAlna' \
    --body '{"currencyCode": "uqpdSKd1", "price": 0.2608347723858042, "productId": "UBhSGxTI", "serviceLabels": [49, 82, 46]}' \
    > test.out 2>&1
eval_tap $? 358 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 359 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'jsldztXu' \
    --body '{"appId": "R1oYotht", "currencyCode": "Qzlno3hn", "language": "SK-JkTr", "price": 0.5217346700303215, "productId": "rl6Asw0s", "region": "b1Xi5NXp", "steamId": "wi8i0yLo"}' \
    > test.out 2>&1
eval_tap $? 359 'SyncSteamInventory' test.out

#- 360 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JJg4FPQ7' \
    --body '{"gameId": "HhwSrY7x", "language": "xoe_CMTS-fV", "region": "ADlUMUkG"}' \
    > test.out 2>&1
eval_tap $? 360 'SyncTwitchDropsEntitlement' test.out

#- 361 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'hfZw0EvA' \
    --body '{"currencyCode": "NWPfGuRr", "price": 0.6436971491702916, "productId": "J5HAGmTl", "xstsToken": "l4bQOpMl"}' \
    > test.out 2>&1
eval_tap $? 361 'SyncXboxInventory' test.out

#- 362 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEuf2f9u' \
    --itemId 'GW2H63ZK' \
    --limit '99' \
    --offset '37' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 362 'PublicQueryUserOrders' test.out

#- 363 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '0ZMAwTBw' \
    --body '{"currencyCode": "qjEbAlBS", "discountedPrice": 8, "ext": {"7kvDztRJ": {}, "M6lQ7e0i": {}, "3GP21P35": {}}, "itemId": "eMTuLtB6", "language": "ZK_xIeM", "price": 78, "quantity": 50, "region": "w3pUWfna", "returnUrl": "mICNjFVb"}' \
    > test.out 2>&1
eval_tap $? 363 'PublicCreateUserOrder' test.out

#- 364 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bPga9E9G' \
    --userId 'BvGGLLBR' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetUserOrder' test.out

#- 365 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qltX1Dag' \
    --userId 'lfhtmHWI' \
    > test.out 2>&1
eval_tap $? 365 'PublicCancelUserOrder' test.out

#- 366 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nrWRUZFE' \
    --userId 'A0Lqg7Up' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetUserOrderHistories' test.out

#- 367 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tcO7hXt3' \
    --userId 'Ren6Xdb5' \
    > test.out 2>&1
eval_tap $? 367 'PublicDownloadUserOrderReceipt' test.out

#- 368 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'pVeeb6BB' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetPaymentAccounts' test.out

#- 369 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 't7tR5dBt' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'y30ZH1eM' \
    > test.out 2>&1
eval_tap $? 369 'PublicDeletePaymentAccount' test.out

#- 370 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'dHAiA063' \
    --language 'NVo76MML' \
    --region 'eqRxThKN' \
    --storeId '64ZOIidn' \
    --viewId 'vHZFDlQ6' \
    > test.out 2>&1
eval_tap $? 370 'PublicListActiveSections' test.out

#- 371 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKUO61C5' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '7jlfd6kY' \
    --limit '98' \
    --offset '91' \
    --sku 'HJ8d3OLu' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 371 'PublicQueryUserSubscriptions' test.out

#- 372 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'uQisBdGQ' \
    --body '{"currencyCode": "Zo4EbdPu", "itemId": "DNQbpO6C", "language": "gUhU_PIYz", "region": "CN9PMpfs", "returnUrl": "0Sk2obar", "source": "jh1s2PNc"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicSubscribeSubscription' test.out

#- 373 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qXbUSxYl' \
    --itemId 'ZFw6WiEi' \
    > test.out 2>&1
eval_tap $? 373 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 374 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cKLXQ9pe' \
    --userId 'tyZSRyNo' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserSubscription' test.out

#- 375 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZtMWeiGK' \
    --userId 'WTNkwoPf' \
    > test.out 2>&1
eval_tap $? 375 'PublicChangeSubscriptionBillingAccount' test.out

#- 376 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hQytkVNg' \
    --userId 'yo5rddaH' \
    --body '{"immediate": true, "reason": "evdkHFEh"}' \
    > test.out 2>&1
eval_tap $? 376 'PublicCancelSubscription' test.out

#- 377 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PJy3CXIE' \
    --userId '4l9Bo9x2' \
    --excludeFree  \
    --limit '51' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetUserSubscriptionBillingHistories' test.out

#- 378 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId '8uv5C4Lp' \
    --language 'PvfaMZJ1' \
    --storeId 'XaHl53KK' \
    > test.out 2>&1
eval_tap $? 378 'PublicListViews' test.out

#- 379 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'krQ3KclY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TGOc33M5' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetWallet' test.out

#- 380 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'p8QxORmD' \
    --namespace "$AB_NAMESPACE" \
    --userId '6EJs7LW6' \
    --limit '47' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 380 'PublicListUserWalletTransactions' test.out

#- 381 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'eggeavTC' \
    --baseAppId '2M42D2k8' \
    --categoryPath 'DbrBC03t' \
    --features 'IL5cDks0' \
    --includeSubCategoryItem  \
    --itemName '70V4inQF' \
    --itemStatus 'INACTIVE' \
    --itemType 'SEASON' \
    --limit '16' \
    --offset '0' \
    --region '4Hl05gpY' \
    --sortBy 'displayOrder:asc,displayOrder:desc,createdAt' \
    --storeId '1AJCbZbO' \
    --tags 'NZ8OxrnT' \
    --targetNamespace '1evhsL6p' \
    > test.out 2>&1
eval_tap $? 381 'QueryItems1' test.out

#- 382 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E5dMTF0O' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 382 'ImportStore1' test.out

#- 383 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MRlFPMqZ' \
    --body '{"itemIds": ["aYmzqA7M", "Kcslr3DR", "QsTCNRJQ"]}' \
    > test.out 2>&1
eval_tap $? 383 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE