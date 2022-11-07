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
    --body '{"context": {"item": {"appId": "h30bLVz9", "appType": "GAME", "baseAppId": "zYsNPEOB", "boothName": "YfOqciWs", "boundItemIds": ["s3HKZ73s", "hj7lWRXG", "Bc9P9YCk"], "categoryPath": "rSuyYsgT", "clazz": "J1nhjmOR", "createdAt": "1989-09-01T00:00:00Z", "description": "aBuwavjc", "displayOrder": 56, "entitlementType": "DURABLE", "ext": {"AlHOqTiB": {}, "MqypQISC": {}, "nbSW98wH": {}}, "features": ["WibJGT9f", "3NudzNNX", "B4hWdf4h"], "fresh": false, "images": [{"as": "xaci9fWd", "caption": "aG2y4oQM", "height": 83, "imageUrl": "9stinTLb", "smallImageUrl": "zzAEB7a0", "width": 57}, {"as": "FNqTtook", "caption": "AFOmCEtz", "height": 55, "imageUrl": "FNjrkFNp", "smallImageUrl": "YrWbLuT9", "width": 69}, {"as": "zBX4RbWV", "caption": "dqeD28rF", "height": 32, "imageUrl": "IqedROmy", "smallImageUrl": "yl9ITsJP", "width": 44}], "itemId": "1ILIplFv", "itemIds": ["aJCSp6Kl", "RL7RUAgb", "wXNBlTVT"], "itemQty": {"Q0rsbj1P": 56, "BUqBt5hw": 89, "AU8nvAm3": 43}, "itemType": "BUNDLE", "language": "uXEHXl28", "listable": true, "localExt": {"FeDVavoF": {}, "kkNgfwJf": {}, "CKMj7qH6": {}}, "longDescription": "LyqP0ER7", "maxCount": 70, "maxCountPerUser": 9, "name": "HO1OCXfK", "namespace": "BHfQnJ0o", "optionBoxConfig": {"boxItems": [{"count": 60, "itemId": "Q1PZUel3", "itemSku": "0lvlyMsu"}, {"count": 13, "itemId": "2oSGZMEu", "itemSku": "vlcq0vHD"}, {"count": 20, "itemId": "qmZZMvOL", "itemSku": "PYyx8Tw1"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 73, "comparison": "isGreaterThanOrEqual", "name": "4vmaR0rF", "predicateType": "SeasonTierPredicate", "value": "HWeEGimM", "values": ["mXbSgRAv", "xdAgsqbn", "rTsmnnIO"]}, {"anyOf": 11, "comparison": "includes", "name": "0GBQShcs", "predicateType": "SeasonPassPredicate", "value": "TPNj06yf", "values": ["WFw6SKDz", "icNYFe2b", "ZvNp0QNf"]}, {"anyOf": 5, "comparison": "isGreaterThan", "name": "Ka2tfbRR", "predicateType": "EntitlementPredicate", "value": "Eq2Ya0sz", "values": ["UYpHHOcP", "ptD0KB4b", "mttwdK25"]}]}, {"operator": "and", "predicates": [{"anyOf": 76, "comparison": "isLessThan", "name": "p8TP8ypg", "predicateType": "SeasonTierPredicate", "value": "S9xW9NJJ", "values": ["TqcM1h6H", "efIxb3gp", "mgY4axmm"]}, {"anyOf": 4, "comparison": "isGreaterThanOrEqual", "name": "IvSjFVTk", "predicateType": "SeasonPassPredicate", "value": "TVz3dxgR", "values": ["TuxOewM6", "ipdR3Ltc", "h7Z6o2c2"]}, {"anyOf": 5, "comparison": "isLessThanOrEqual", "name": "zm6Vd9DY", "predicateType": "EntitlementPredicate", "value": "VYjXqyCq", "values": ["UJVTZhmo", "hwYrCtwb", "Wu5ML1nm"]}]}, {"operator": "or", "predicates": [{"anyOf": 41, "comparison": "isNot", "name": "RSAYNiZg", "predicateType": "SeasonTierPredicate", "value": "Ld2C6HcG", "values": ["mFM9YZUO", "P1XNkTpj", "oSiLZUfP"]}, {"anyOf": 79, "comparison": "isLessThanOrEqual", "name": "afSFMimA", "predicateType": "SeasonPassPredicate", "value": "gcbnk1Sq", "values": ["GcGqzLud", "UZgqht0I", "0RXj6DtK"]}, {"anyOf": 61, "comparison": "includes", "name": "iD8goVa6", "predicateType": "SeasonTierPredicate", "value": "YnxVE8d9", "values": ["ojEe3s2q", "kvrDHvXs", "6Nzrrm6r"]}]}]}, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 98, "fixedTrialCycles": 77, "graceDays": 95}, "region": "JxrigItK", "regionData": [{"currencyCode": "X3Kh4y4Q", "currencyNamespace": "zd1R4E2o", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1986-03-05T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1984-05-29T00:00:00Z", "discountedPrice": 5, "expireAt": "1974-02-28T00:00:00Z", "price": 49, "purchaseAt": "1985-09-12T00:00:00Z", "trialPrice": 86}, {"currencyCode": "lID1itws", "currencyNamespace": "ZJtvOxVI", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1984-05-27T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1976-05-08T00:00:00Z", "discountedPrice": 95, "expireAt": "1994-02-19T00:00:00Z", "price": 66, "purchaseAt": "1974-11-30T00:00:00Z", "trialPrice": 74}, {"currencyCode": "zbjLVfua", "currencyNamespace": "jBwCjk7P", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1981-08-22T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1977-03-29T00:00:00Z", "discountedPrice": 18, "expireAt": "1989-11-06T00:00:00Z", "price": 66, "purchaseAt": "1995-11-16T00:00:00Z", "trialPrice": 61}], "seasonType": "TIER", "sku": "vcAGlCxj", "stackable": true, "status": "ACTIVE", "tags": ["lFlBgMOk", "jXnpBMRK", "0rlmGivH"], "targetCurrencyCode": "WsxOcr38", "targetItemId": "AErv8sJ6", "targetNamespace": "Z9wfuawR", "thumbnailUrl": "Q6dVW3zS", "title": "uswV6LBk", "updatedAt": "1974-07-14T00:00:00Z", "useCount": 2}, "namespace": "ctTn6XAf", "order": {"currency": {"currencyCode": "Re0GCmxe", "currencySymbol": "va83EYSl", "currencyType": "VIRTUAL", "decimals": 89, "namespace": "mYaHhVkX"}, "ext": {"I07Pt4II": {}, "8wvtZRQh": {}, "SgxAN9ou": {}}, "free": false}, "source": "IAP"}, "script": "ohCRHd3r", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'o1Rx4x1f' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '3ljW3utt' \
    --body '{"grantDays": "iU9LatR3"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'sN1bHQWF' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'hF7YKEVt' \
    --body '{"grantDays": "kq6EYRde"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "BTOdJtUa", "dryRun": false, "fulfillmentUrl": "3JuRiOjJ", "itemType": "SUBSCRIPTION", "purchaseConditionUrl": "s8An7F9J"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'oGpJSYkY' \
    --itemType 'MEDIA' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'LQIxukWn' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'oDvkhcOW' \
    --body '{"clazz": "L7GFtVzL", "dryRun": false, "fulfillmentUrl": "FkYrqRYr", "purchaseConditionUrl": "z1ed7oKy"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id '9H3we0ky' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --name 'dWA6i39L' \
    --offset '11' \
    --tag '6S1gYI4h' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "sCTzCZzy", "items": [{"extraSubscriptionDays": 30, "itemId": "N0mcemJl", "itemName": "tllskZwN", "quantity": 37}, {"extraSubscriptionDays": 1, "itemId": "EErlNTCk", "itemName": "uXU31KOq", "quantity": 53}, {"extraSubscriptionDays": 46, "itemId": "iqTgBxR6", "itemName": "HIHyBpzp", "quantity": 45}], "maxRedeemCountPerCampaignPerUser": 14, "maxRedeemCountPerCode": 69, "maxRedeemCountPerCodePerUser": 91, "maxSaleCount": 72, "name": "DwsnRdD9", "redeemEnd": "1985-04-03T00:00:00Z", "redeemStart": "1999-07-04T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["QGTqMgBQ", "V8L7siEu", "jabiQJHr"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '6a9hktYg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'LlIOgdpc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "IDMcu9B5", "items": [{"extraSubscriptionDays": 13, "itemId": "6rXsn2Uw", "itemName": "ATzewpie", "quantity": 64}, {"extraSubscriptionDays": 84, "itemId": "jNksTlP0", "itemName": "mWfSC5hP", "quantity": 42}, {"extraSubscriptionDays": 39, "itemId": "2t1BzqkD", "itemName": "Fw3i9Xoz", "quantity": 52}], "maxRedeemCountPerCampaignPerUser": 57, "maxRedeemCountPerCode": 53, "maxRedeemCountPerCodePerUser": 17, "maxSaleCount": 92, "name": "zmENsM8f", "redeemEnd": "1977-07-28T00:00:00Z", "redeemStart": "1977-11-20T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["mcjPsrEf", "l5ky1utS", "DerDmXxY"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'xhByB7og' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HPbHuLXN' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nzfjatDO' \
    --body '{"categoryPath": "qL8WAYQw", "localizationDisplayNames": {"5DDjhfxx": "v7Ze0VNH", "gn3sclFV": "UFvVRDzc", "ir4E7oxU": "cAVGN2C9"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '8DZzO93t' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'pM1n91mq' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YvRDMg1c' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '0CDQ5l4N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XDLQRso6' \
    --body '{"localizationDisplayNames": {"iZWV7uZa": "KHSXfDwl", "L9H9Itxe": "F2S2C5gR", "WMDsLpAg": "r3C3J5e6"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'LcNnxFmd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JKFybSuq' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'YB9ivp3Z' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OrJjhNkW' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'eYr9bsfZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Q9PM0xJ5' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'lYQLSy9W' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '5' \
    --code 'FRb1qRSi' \
    --limit '14' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'SgntxcYx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 69}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'XMFyAFrx' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '89' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'pwIt7b3P' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '56' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'YKz56D6t' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '69' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'm451OIm8' \
    --namespace "$AB_NAMESPACE" \
    --code 'ZbQdCi6c' \
    --limit '24' \
    --offset '3' \
    --userId 'XmXeUVa4' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'kx7N6b32' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'GdvW1IoS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'OiygdBA3' \
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
    --body '{"currencyCode": "Vh6kAgmj", "currencySymbol": "8F5zTVtK", "currencyType": "REAL", "decimals": 1, "localizationDescriptions": {"QiPQSUSe": "tUkurYNK", "ZNB2y5wi": "iEkJ52eU", "pwf0ElUr": "qiUsVdnB"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '6Jg5ODi6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"yGMZGrdi": "sZGUdGXK", "Qd20kmRR": "D78oM38D", "SVpqQ1OL": "8xvs0oY2"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'UHtlFO8A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'nLHEjiPT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'nTvRfzOg' \
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
    --body '{"data": [{"id": "sLvmrjvd", "rewards": [{"currency": {"currencyCode": "VhP13VoD", "namespace": "X0j87HW5"}, "item": {"itemId": "ne75Q8kA", "itemSku": "SSmXENzD", "itemType": "G0gPu7d0"}, "quantity": 3, "type": "ITEM"}, {"currency": {"currencyCode": "x4IrcoIy", "namespace": "cN9eS7FM"}, "item": {"itemId": "R4VUnBU3", "itemSku": "HGx61wqX", "itemType": "BYxSSYMh"}, "quantity": 8, "type": "ITEM"}, {"currency": {"currencyCode": "IQQ331tA", "namespace": "yO6Vp67p"}, "item": {"itemId": "jF9jYiYZ", "itemSku": "msjirpmi", "itemType": "31qGPflz"}, "quantity": 22, "type": "CURRENCY"}]}, {"id": "vozxqHk0", "rewards": [{"currency": {"currencyCode": "YbTTT9pl", "namespace": "SrMc1MOo"}, "item": {"itemId": "W8yCoUTG", "itemSku": "U624TLIP", "itemType": "YjPI0ZwE"}, "quantity": 38, "type": "ITEM"}, {"currency": {"currencyCode": "FejCtOqD", "namespace": "ilhi4Xwa"}, "item": {"itemId": "DbqUDsN1", "itemSku": "CIn6MyO6", "itemType": "1Xkh89ng"}, "quantity": 51, "type": "ITEM"}, {"currency": {"currencyCode": "QrV6AQUU", "namespace": "YLmxz32n"}, "item": {"itemId": "WnpVz06F", "itemSku": "sHfCUQr4", "itemType": "OvRwgSBc"}, "quantity": 81, "type": "ITEM"}]}, {"id": "XF6pSJLo", "rewards": [{"currency": {"currencyCode": "oPbsVdHX", "namespace": "GXqiQE51"}, "item": {"itemId": "2HXInrRX", "itemSku": "Eu7uOzeW", "itemType": "LYhXKYtE"}, "quantity": 91, "type": "ITEM"}, {"currency": {"currencyCode": "9mBOSq6u", "namespace": "kVNU1oua"}, "item": {"itemId": "GDpzdqXd", "itemSku": "YRaO1jzU", "itemType": "U6IKpzqs"}, "quantity": 68, "type": "ITEM"}, {"currency": {"currencyCode": "HKsF3iyf", "namespace": "RCVP9zy6"}, "item": {"itemId": "epyYoLim", "itemSku": "Whr0coMs", "itemType": "BJ1pDFXv"}, "quantity": 70, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"LZTmM8AY": "abGOdxAb", "UvYfD4YD": "jYCZUYWI", "yPHtLLCt": "KWkfYhss"}}, {"platform": "XBOX", "platformDlcIdMap": {"VdyegAFV": "GjYg9B0z", "jIlZBNMy": "Zl6zzLOH", "hBNGjXer": "Mk26hQmN"}}, {"platform": "XBOX", "platformDlcIdMap": {"Kl32QhVw": "mZThoE8R", "AmU1BMXs": "YhfmmBfw", "8IELMMAz": "Gjs6kWNT"}}]}' \
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
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'DE0mmUsH' \
    --itemId 'xcRiAU0j,LHYmUfMM,lJo1jj1v' \
    --limit '12' \
    --offset '43' \
    --userId 'F2bVPVs4' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'Ims5bYFr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '77' \
    --status 'FAIL' \
    --userId 'gAsUE1x6' \
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
    --body '{"bundleId": "qyMAmVal", "password": "5BP4r59w"}' \
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
    --body '{"sandboxId": "aawQUECo"}' \
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
    --body '{"applicationName": "hwd906p8", "serviceAccountId": "zYQsCjlW"}' \
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
    --body '{"data": [{"itemIdentity": "9ludSY1e", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"y8UE5uwA": "T99m1ccc", "xgJaJZ2t": "Lcp0dbDB", "hJJndo2t": "Iy1tA5CS"}}, {"itemIdentity": "pKA6RUmk", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"Qo4CzT0c": "tv42Wwwb", "aKGvlGBF": "S3tLNvOe", "tdlNjy4C": "0jXni4tE"}}, {"itemIdentity": "M9Joxq5z", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"L7Y2FbHG": "s2pZPhih", "1NQWmxw9": "0fwO3Rt5", "JQMGFXUy": "RISjjvsw"}}]}' \
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
    --body '{"environment": "LVXXyWe5"}' \
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
    --body '{"appId": "SqlDvkQO", "publisherAuthenticationKey": "PjQtIi4f"}' \
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
    --body '{"clientId": "vp9cs0dQ", "clientSecret": "XrbnXdOw", "organizationId": "gfubasws"}' \
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
    --body '{"relyingPartyCert": "QmG6hqGk"}' \
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
    --password 'EcpA7Z03' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'BmKjGE4d' \
    --itemId 'qIRdVdDI' \
    --itemType 'EXTENSION' \
    --endTime 'ksmD2AQP' \
    --startTime 't5X7Yerx' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '8unxFh3n' \
    --itemId 'kczqnija' \
    --itemType 'INGAMEITEM' \
    --endTime 'CNKkS0CX' \
    --startTime 'w3zSo9UG' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jvjUWu8x' \
    --body '{"categoryPath": "xWuzPOWA", "targetItemId": "5UiYNhVX", "targetNamespace": "UlHmf1HV"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HC4KNmmZ' \
    --body '{"appId": "K2TP30YI", "appType": "GAME", "baseAppId": "qd2fjA85", "boothName": "8tzTwGhl", "categoryPath": "OiUIzGVN", "clazz": "7ybLhQPt", "displayOrder": 93, "entitlementType": "DURABLE", "ext": {"qGr5RZwv": {}, "VQJM1T6v": {}, "0jX4Ezwd": {}}, "features": ["Kr02APLo", "cyDuNysc", "Y0mrlvtr"], "images": [{"as": "IHUk3V7S", "caption": "L4lVpyZw", "height": 48, "imageUrl": "mnclCr6r", "smallImageUrl": "ow3wZ0VY", "width": 99}, {"as": "rC8mhJJD", "caption": "Xj2NeX9J", "height": 95, "imageUrl": "lxkQMXDX", "smallImageUrl": "H1k208xt", "width": 82}, {"as": "Z6qVQS5H", "caption": "4TIEWfev", "height": 33, "imageUrl": "vPnUPOtk", "smallImageUrl": "ckbGrig1", "width": 14}], "itemIds": ["WtjNfFxZ", "2pmi5xc8", "8n6z0QDL"], "itemQty": {"y74Ncmzd": 58, "McdPjLdU": 52, "92257zkG": 95}, "itemType": "SEASON", "listable": true, "localizations": {"FeBIrwCS": {"description": "41Lhijwp", "localExt": {"yBuHp0VY": {}, "HPPgmksN": {}, "HqhqUgNC": {}}, "longDescription": "bo9eqYwE", "title": "rwatqKsA"}, "PoDmrX5h": {"description": "q9eRwpLD", "localExt": {"aLNobKeE": {}, "VrGFG3mM": {}, "cQLHiMMM": {}}, "longDescription": "DNGVoqOB", "title": "eXW8UYDi"}, "SI0o4stG": {"description": "hcmcFf8D", "localExt": {"jeNNiMaR": {}, "e3xaPvXk": {}, "Aregqe76": {}}, "longDescription": "MPWbUE8Q", "title": "NuDxdmdn"}}, "maxCount": 14, "maxCountPerUser": 78, "name": "OvQQt8Ut", "optionBoxConfig": {"boxItems": [{"count": 82, "itemId": "zy9gOBZp", "itemSku": "JtUWllVV"}, {"count": 84, "itemId": "olVuwaaB", "itemSku": "LobcvpXc"}, {"count": 81, "itemId": "qBmXZau2", "itemSku": "zIyMtd6E"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 88, "fixedTrialCycles": 63, "graceDays": 51}, "regionData": {"GRJrIsCu": [{"currencyCode": "2gbyNkB6", "currencyNamespace": "H8SF1doj", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1990-08-03T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1980-01-03T00:00:00Z", "discountedPrice": 34, "expireAt": "1979-08-08T00:00:00Z", "price": 58, "purchaseAt": "1991-01-31T00:00:00Z", "trialPrice": 17}, {"currencyCode": "lbaItjOk", "currencyNamespace": "mQqx05TR", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1985-01-29T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1986-04-12T00:00:00Z", "discountedPrice": 84, "expireAt": "1992-12-01T00:00:00Z", "price": 98, "purchaseAt": "1973-12-03T00:00:00Z", "trialPrice": 26}, {"currencyCode": "HHIWR1XU", "currencyNamespace": "JoPdxQD4", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1974-02-06T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1974-07-30T00:00:00Z", "discountedPrice": 77, "expireAt": "1982-08-27T00:00:00Z", "price": 99, "purchaseAt": "1982-11-17T00:00:00Z", "trialPrice": 43}], "Dbzolqxj": [{"currencyCode": "6UpJLhBz", "currencyNamespace": "aLp7rgF0", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1997-04-12T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1994-12-27T00:00:00Z", "discountedPrice": 93, "expireAt": "1993-11-24T00:00:00Z", "price": 93, "purchaseAt": "1988-04-04T00:00:00Z", "trialPrice": 79}, {"currencyCode": "hMPEKb5S", "currencyNamespace": "ERZekyh7", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1973-02-10T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1982-01-26T00:00:00Z", "discountedPrice": 57, "expireAt": "1998-06-12T00:00:00Z", "price": 67, "purchaseAt": "1996-02-01T00:00:00Z", "trialPrice": 56}, {"currencyCode": "hG7P0Tfs", "currencyNamespace": "3mmMtTwS", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1974-04-24T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1993-03-22T00:00:00Z", "discountedPrice": 78, "expireAt": "1984-05-06T00:00:00Z", "price": 70, "purchaseAt": "1977-12-17T00:00:00Z", "trialPrice": 38}], "rDfTFO7k": [{"currencyCode": "zAPLo4jO", "currencyNamespace": "6wVQ5jMT", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1997-04-28T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1977-08-03T00:00:00Z", "discountedPrice": 21, "expireAt": "1973-06-15T00:00:00Z", "price": 97, "purchaseAt": "1991-02-20T00:00:00Z", "trialPrice": 77}, {"currencyCode": "VUzfUPDB", "currencyNamespace": "w3G4NHVV", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1996-01-27T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1988-08-06T00:00:00Z", "discountedPrice": 58, "expireAt": "1980-05-29T00:00:00Z", "price": 24, "purchaseAt": "1992-07-18T00:00:00Z", "trialPrice": 7}, {"currencyCode": "g0IQSV35", "currencyNamespace": "aj5oj7pL", "currencyType": "REAL", "discountAmount": 85, "discountExpireAt": "1979-05-08T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1983-01-17T00:00:00Z", "discountedPrice": 23, "expireAt": "1982-11-19T00:00:00Z", "price": 11, "purchaseAt": "1992-07-25T00:00:00Z", "trialPrice": 73}]}, "seasonType": "TIER", "sku": "T92TSpWj", "stackable": true, "status": "ACTIVE", "tags": ["RPnqVpQU", "cFkpWkT0", "mJtpEu20"], "targetCurrencyCode": "PkNRP7Mp", "targetNamespace": "RMU0W0zz", "thumbnailUrl": "Htk6eCN2", "useCount": 1}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Euf7OEVb' \
    --appId 'vAsLcbVx' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'VuMLg3so' \
    --baseAppId '27aPtB77' \
    --categoryPath '5rWEXkXR' \
    --features 'FIYTVy43' \
    --includeSubCategoryItem  \
    --itemType 'EXTENSION' \
    --limit '3' \
    --offset '41' \
    --region 'cdKMHQbh' \
    --sortBy 'displayOrder,displayOrder:asc,createdAt:asc' \
    --storeId '2Z05cb2O' \
    --tags 'Xs2Bjtdx' \
    --targetNamespace 'NCm2wXVJ' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'BjO4JjWF,ffxibzkT,m8K1h14S' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2SwKK3Gd' \
    --sku '8eLfPZcU' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'xAQECT1O' \
    --populateBundle  \
    --region 'v69zTLKx' \
    --storeId '5aKn60sp' \
    --sku 'RBrCpgJe' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'XBq8p4yp' \
    --sku '8uKgmah0' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'fTiyZY5w,5YOWqJbz,oHX8dVpg' \
    --storeId 'JtUP1Zor' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'xFr8AlhP' \
    --region '7RFGa1UN' \
    --storeId 'fDx8Qodh' \
    --itemIds 'myHxyPCZ' \
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
    --userId '3Kw6xqdd' \
    --body '{"itemIds": ["2zmbD5kz", "V5dbHzvq", "7wPbuuNR"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'CODE' \
    --limit '32' \
    --offset '3' \
    --sortBy '08xknDXd' \
    --storeId '9G4TOnun' \
    --keyword 'xBKPTawR' \
    --language 'jN35CBNc' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '52' \
    --offset '55' \
    --sortBy 'name:asc,name:desc,updatedAt' \
    --storeId 'o2ufpyEO' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '6hgqHNIE' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'lcvaO0bP' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'N4yL6aBN' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7e0qhnSC' \
    --body '{"appId": "sFXyE4vN", "appType": "SOFTWARE", "baseAppId": "vGLb9LKE", "boothName": "XvhicJFv", "categoryPath": "qIMmbVf1", "clazz": "6HBgB0MG", "displayOrder": 100, "entitlementType": "DURABLE", "ext": {"9BqUcwKF": {}, "aG0PmtEz": {}, "9jbV7YCz": {}}, "features": ["xBChxVcP", "G7eOzZjL", "XRCpA9G0"], "images": [{"as": "LvwZaDnQ", "caption": "iIzPQdkF", "height": 19, "imageUrl": "5jO0xITP", "smallImageUrl": "ZEJ8H9Iw", "width": 86}, {"as": "vsEGXdyB", "caption": "eeQcUzUu", "height": 43, "imageUrl": "sbRQH3FU", "smallImageUrl": "ee2O0W2k", "width": 10}, {"as": "Bx2kgcyM", "caption": "EHJioF1x", "height": 100, "imageUrl": "ghfeBWza", "smallImageUrl": "wTk1fdDx", "width": 80}], "itemIds": ["l3CrBkZu", "Spf99d0q", "JpO1eUP6"], "itemQty": {"nz00UgNL": 99, "cBsD6BDp": 10, "goDH8qpT": 82}, "itemType": "EXTENSION", "listable": true, "localizations": {"DqlZ27Ux": {"description": "hBRcYn3x", "localExt": {"NhteuH1T": {}, "3GuOlbsO": {}, "0aBbp62z": {}}, "longDescription": "IcWVQA42", "title": "bjjJy5yy"}, "WzRMGzvT": {"description": "wDMDarAg", "localExt": {"N9sv7GRt": {}, "pZSxOsdv": {}, "syTa1I3W": {}}, "longDescription": "5cdoF3mC", "title": "45psDPmM"}, "oH05IyD2": {"description": "mbwlA59H", "localExt": {"7P155NzR": {}, "sipFqbgH": {}, "NBJOEVHU": {}}, "longDescription": "9AnzwZzY", "title": "FU19oTUJ"}}, "maxCount": 18, "maxCountPerUser": 5, "name": "6zzQi5cn", "optionBoxConfig": {"boxItems": [{"count": 25, "itemId": "y0DxzVRj", "itemSku": "xafOpBiQ"}, {"count": 81, "itemId": "4zpJJHVY", "itemSku": "tJXCaCIY"}, {"count": 42, "itemId": "R2SWRN4I", "itemSku": "rSTwnxc9"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 86, "fixedTrialCycles": 30, "graceDays": 35}, "regionData": {"9qIM0Ofh": [{"currencyCode": "4OQ9cYsW", "currencyNamespace": "hyDsNWbi", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1978-04-08T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1992-10-18T00:00:00Z", "discountedPrice": 93, "expireAt": "1971-08-17T00:00:00Z", "price": 9, "purchaseAt": "1982-04-17T00:00:00Z", "trialPrice": 49}, {"currencyCode": "Rwd3Yhjb", "currencyNamespace": "fqx7NZ2Y", "currencyType": "REAL", "discountAmount": 90, "discountExpireAt": "1977-11-22T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1995-10-11T00:00:00Z", "discountedPrice": 89, "expireAt": "1982-02-01T00:00:00Z", "price": 45, "purchaseAt": "1989-03-04T00:00:00Z", "trialPrice": 66}, {"currencyCode": "vXXTP4F5", "currencyNamespace": "RXP7mWjg", "currencyType": "REAL", "discountAmount": 33, "discountExpireAt": "1971-03-09T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1996-01-18T00:00:00Z", "discountedPrice": 36, "expireAt": "1976-07-07T00:00:00Z", "price": 73, "purchaseAt": "1983-12-05T00:00:00Z", "trialPrice": 75}], "Be7mB3kW": [{"currencyCode": "JVEbwCSp", "currencyNamespace": "y8UhZOFS", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1982-09-10T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1986-11-24T00:00:00Z", "discountedPrice": 9, "expireAt": "1989-05-25T00:00:00Z", "price": 42, "purchaseAt": "1996-07-14T00:00:00Z", "trialPrice": 8}, {"currencyCode": "Qbx4HgkY", "currencyNamespace": "7y07ROkI", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1986-10-19T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1990-06-02T00:00:00Z", "discountedPrice": 60, "expireAt": "1990-11-19T00:00:00Z", "price": 22, "purchaseAt": "1995-08-11T00:00:00Z", "trialPrice": 21}, {"currencyCode": "SgDwVASC", "currencyNamespace": "kl4okcUQ", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1993-12-13T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1979-08-21T00:00:00Z", "discountedPrice": 17, "expireAt": "1997-10-12T00:00:00Z", "price": 95, "purchaseAt": "1974-10-25T00:00:00Z", "trialPrice": 73}], "KWhqjbpd": [{"currencyCode": "Hv9Y354V", "currencyNamespace": "mmzK4HWA", "currencyType": "VIRTUAL", "discountAmount": 8, "discountExpireAt": "1971-04-04T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1982-08-18T00:00:00Z", "discountedPrice": 61, "expireAt": "1981-04-29T00:00:00Z", "price": 15, "purchaseAt": "1981-09-05T00:00:00Z", "trialPrice": 77}, {"currencyCode": "Zt9RwJ9R", "currencyNamespace": "gE4zJrCk", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1985-10-22T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1981-03-19T00:00:00Z", "discountedPrice": 36, "expireAt": "1981-07-12T00:00:00Z", "price": 62, "purchaseAt": "1977-03-28T00:00:00Z", "trialPrice": 52}, {"currencyCode": "EYRTwvuR", "currencyNamespace": "w6nwl87d", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1991-10-13T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1993-09-22T00:00:00Z", "discountedPrice": 74, "expireAt": "1975-06-01T00:00:00Z", "price": 62, "purchaseAt": "1994-04-13T00:00:00Z", "trialPrice": 82}]}, "seasonType": "TIER", "sku": "tVRuLjHw", "stackable": false, "status": "ACTIVE", "tags": ["y9ydpweM", "ncEHqHmM", "BZ7NxScs"], "targetCurrencyCode": "SOEGJAr7", "targetNamespace": "GXWhXXnP", "thumbnailUrl": "t1J3nbHk", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'PLXNDg9w' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'f1nxCBwg' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'XzqkXOwF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 65, "orderNo": "q46TFpJj"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'dTmTpTsd' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'QvSF3haP' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'C1BLEM7I' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mfMIucpe' \
    --body '{"carousel": [{"alt": "el3aQuGe", "previewUrl": "yFFxDJo9", "thumbnailUrl": "JO38wK1E", "type": "video", "url": "fA8AE1Ii", "videoSource": "generic"}, {"alt": "O80lEmPd", "previewUrl": "LjhMZXsU", "thumbnailUrl": "PioEObAt", "type": "video", "url": "xYsfKfcE", "videoSource": "youtube"}, {"alt": "9Bz8NGJd", "previewUrl": "qsoMcMFm", "thumbnailUrl": "UCwy5Zq9", "type": "video", "url": "Sd2nPWBP", "videoSource": "youtube"}], "developer": "y4c1IQem", "forumUrl": "lROdK2W3", "genres": ["Strategy", "Racing", "Simulation"], "localizations": {"gIfm9jB9": {"announcement": "xD1Sr8Bc", "slogan": "EkgZuwEV"}, "1qARdhxI": {"announcement": "RnpG6Uwp", "slogan": "XglD8AmW"}, "BHHGZd1Z": {"announcement": "4YeEuYXs", "slogan": "o8bRX2t5"}}, "platformRequirements": {"GRrjKB0Q": [{"additionals": "4z7u6stO", "directXVersion": "TJBepk0E", "diskSpace": "wyDzb6VV", "graphics": "1dlJ1iT9", "label": "G5DrUamK", "osVersion": "WQaa6V4t", "processor": "CFakfc8A", "ram": "JqKBB128", "soundCard": "wVs8D6GL"}, {"additionals": "4TcYwray", "directXVersion": "pdaAaV6w", "diskSpace": "tR7dQXKQ", "graphics": "AGAqmtKF", "label": "12Evr0X4", "osVersion": "gAyWiFz0", "processor": "9jyJPc9D", "ram": "ZlQlJpkd", "soundCard": "e6tXFnth"}, {"additionals": "aLh8Ozw0", "directXVersion": "roujREBw", "diskSpace": "L0KFOU9J", "graphics": "vIiGSErB", "label": "FQVcYmIa", "osVersion": "n657LnMB", "processor": "hWAb3Ojv", "ram": "7G8V0l8e", "soundCard": "VhisBWGN"}], "k3gyQmtc": [{"additionals": "Ndx2id2m", "directXVersion": "qXrbEhtA", "diskSpace": "ESNJys5b", "graphics": "xZu2W4ja", "label": "vltJaY7e", "osVersion": "G1WNrGtb", "processor": "v6zj9ZEV", "ram": "of7tqDu6", "soundCard": "kFW2tfIe"}, {"additionals": "aHiAtVAg", "directXVersion": "RjCPBlOi", "diskSpace": "V8yiPeVy", "graphics": "xlxZXVty", "label": "jB0fxj5N", "osVersion": "xvQBVObE", "processor": "SgOsGrSQ", "ram": "l8AZQT81", "soundCard": "c0fApIbs"}, {"additionals": "IZaBytX4", "directXVersion": "nRiewmIS", "diskSpace": "s3KgjH0w", "graphics": "8Kj6VIPO", "label": "jvLUEDlx", "osVersion": "ZB4hYWcC", "processor": "SB5Hygh8", "ram": "aPVEOIzW", "soundCard": "UjPfpzbW"}], "4wXnS15O": [{"additionals": "Y9C51zHn", "directXVersion": "gxebEP6b", "diskSpace": "foH3UshY", "graphics": "Dl0BTuHC", "label": "a4nlDWl0", "osVersion": "DezNycrI", "processor": "a5wR9JJl", "ram": "hWBoAZ4v", "soundCard": "vw0Hn3Ni"}, {"additionals": "M19svbFx", "directXVersion": "YhUhQvoh", "diskSpace": "P0uQHx4F", "graphics": "i3pKVtf1", "label": "XsoEAxkv", "osVersion": "VkFhbIAn", "processor": "E1XyVbEr", "ram": "vCkW3tgr", "soundCard": "y1Irr9y8"}, {"additionals": "yULHyMO8", "directXVersion": "1uSOyj6n", "diskSpace": "BDjA3rZ1", "graphics": "fJBVR3Xk", "label": "pKGOnlVZ", "osVersion": "32sCLyhW", "processor": "xK6E4j25", "ram": "41wEkN8E", "soundCard": "58WlUIZm"}]}, "platforms": ["Linux", "Linux", "IOS"], "players": ["MMO", "LocalCoop", "Single"], "primaryGenre": "Indie", "publisher": "nksWNNxf", "releaseDate": "1983-08-17T00:00:00Z", "websiteUrl": "oVUJCB6W"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'eNK4sgW4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y4047Ifm' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'vZhNXMq7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'rjVPwxdJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jCwb1iXF' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'QbotELBj' \
    --itemId 'AJF4Uu7A' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UtrTPf2h' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'GlAUUIYD' \
    --itemId '0uYe1cuF' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5KGFJzCG' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'mDArZk3c' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'WhWnsWxp' \
    --populateBundle  \
    --region 'NV3SUNBc' \
    --storeId '8tfnXNKc' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'OmtfpulW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mGQKiEgz' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 32, "comparison": "excludes", "name": "8abXbcHf", "predicateType": "SeasonTierPredicate", "value": "a7QMNf61", "values": ["5QQ4Hw4l", "PL59ddOQ", "SKSphsl8"]}, {"anyOf": 77, "comparison": "excludes", "name": "y3waQ8vH", "predicateType": "SeasonPassPredicate", "value": "Z1BLsEgQ", "values": ["aKXSJ2wv", "uSzHFRSQ", "3UeQD51P"]}, {"anyOf": 10, "comparison": "is", "name": "h8MN8Fur", "predicateType": "SeasonTierPredicate", "value": "Im5zDsHJ", "values": ["SE6Mp0QG", "xCZzzvW9", "OIJZeTH4"]}]}, {"operator": "and", "predicates": [{"anyOf": 78, "comparison": "isGreaterThanOrEqual", "name": "FiwSm5xy", "predicateType": "SeasonTierPredicate", "value": "sUHekgRD", "values": ["Zs3zUpkz", "amNMf9GP", "zUZjf6na"]}, {"anyOf": 21, "comparison": "isGreaterThanOrEqual", "name": "PthuZuC7", "predicateType": "SeasonPassPredicate", "value": "TYvvxSld", "values": ["hrFJerUM", "NEBKqSpd", "ylmMbdTA"]}, {"anyOf": 11, "comparison": "isGreaterThan", "name": "0SUzbFIu", "predicateType": "EntitlementPredicate", "value": "zjvDj5mF", "values": ["L8u85IP6", "ah4cnSwj", "FugJI5h1"]}]}, {"operator": "or", "predicates": [{"anyOf": 35, "comparison": "isGreaterThan", "name": "kszk0EV4", "predicateType": "SeasonTierPredicate", "value": "jG9nMM5F", "values": ["NNr59gMO", "FEMTYH1L", "vgaqtEks"]}, {"anyOf": 46, "comparison": "isNot", "name": "xCpcHEvI", "predicateType": "SeasonTierPredicate", "value": "ekQNQM8Z", "values": ["6QuJ8isH", "SsqeH5B7", "woaQJdtT"]}, {"anyOf": 76, "comparison": "isNot", "name": "qtUcheeI", "predicateType": "SeasonPassPredicate", "value": "J3So9SiQ", "values": ["FCtxbnGb", "Ur6o1Yem", "FNhSSLKY"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'AA6U07WF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "pVBplRC4"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --name '5dlj0ZoN' \
    --offset '42' \
    --tag 'Kv3WERBF' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "TQZosbEz", "name": "suv2GJg6", "status": "INACTIVE", "tags": ["ah1kCTQO", "k9utSNpu", "YG4CQkiK"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'A1uigfpV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'hgTKI4LY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "32qvcpse", "name": "nGBRXHkC", "status": "INACTIVE", "tags": ["c2saeNJF", "CCKqnz4s", "3MdZMV1K"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'bE6Hzd3L' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '4Q6dcgmC' \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '14' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'PJxiKH3H' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'oS8ntU5N' \
    --limit '52' \
    --offset '1' \
    --orderNos 'bwkZ97cV,T7Nq8EGK,lFR8HaqP' \
    --sortBy '8S5Legde' \
    --startTime 'HPcVvFVS' \
    --status 'CLOSED' \
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
    --orderNo 'AkhWPGiy' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9LV2A1t1' \
    --body '{"description": "1CpwrytM"}' \
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
    --body '{"dryRun": false, "notifyUrl": "F7CrZwkF", "privateKey": "hm2LtElQ"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '2D4CdeWD' \
    --externalId 'MwiMrCEO' \
    --limit '73' \
    --notificationSource 'PAYPAL' \
    --notificationType 'IDeCPL1X' \
    --offset '85' \
    --paymentOrderNo '4mJMvnqc' \
    --startDate 'zK0kjVId' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'IV4h9pVB' \
    --limit '69' \
    --offset '67' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "AT1OUV1h", "currencyNamespace": "BnbWTPk4", "customParameters": {"VuhPEqpN": {}, "cccg0I00": {}, "fNa6wgWf": {}}, "description": "JsOowtLx", "extOrderNo": "VvfSCRON", "extUserId": "2v3YsZnF", "itemType": "MEDIA", "language": "fzuz_IltI_LK", "metadata": {"OHZggiOm": "LBAjIBVU", "NizhmPHi": "FOZdCg85", "7KxCFJv9": "4biyUnP0"}, "notifyUrl": "vZEG8JH3", "omitNotification": true, "platform": "Cxcpqq7x", "price": 86, "recurringPaymentOrderNo": "GEywTKUf", "region": "LwZpnxhc", "returnUrl": "yvZMjG8U", "sandbox": true, "sku": "yz6InTxd", "subscriptionId": "Aq0wjgQJ", "targetNamespace": "3EvaICYn", "targetUserId": "WQyyBVbT", "title": "ReB3PDxp"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '11F9DKwe' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'EqfUyLoY' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'hhM1E2r1' \
    --body '{"extTxId": "tTJ778Wt", "paymentMethod": "wgfBRFML", "paymentProvider": "STRIPE"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KbJTm7NQ' \
    --body '{"description": "rq4geDsP"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dwBX1DnC' \
    --body '{"amount": 80, "currencyCode": "8uRitbQA", "notifyType": "REFUND", "paymentProvider": "WALLET", "salesTax": 45, "vat": 18}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mZOahhBy' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedBalanceOrigins": ["GooglePlay", "IOS", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "TJkjhn4z", "eventTopic": "ebFPq3Xm", "maxAwarded": 33, "maxAwardedPerUser": 69, "namespaceExpression": "cdCWDHQ4", "rewardCode": "VWYyZ2kx", "rewardConditions": [{"condition": "9PwR7RJt", "conditionName": "MezQNdsn", "eventName": "l64Yb7HR", "rewardItems": [{"duration": 57, "itemId": "3Z0MVyVW", "quantity": 28}, {"duration": 67, "itemId": "nX6n7yCN", "quantity": 48}, {"duration": 59, "itemId": "ubS843bq", "quantity": 59}]}, {"condition": "KBEVzykK", "conditionName": "AVWwqSbP", "eventName": "scoBb4Az", "rewardItems": [{"duration": 98, "itemId": "AYYIOKq3", "quantity": 27}, {"duration": 5, "itemId": "FpUB6TWX", "quantity": 82}, {"duration": 23, "itemId": "jsz7jMj8", "quantity": 49}]}, {"condition": "XLLKtuG2", "conditionName": "7qKrq6pz", "eventName": "wuNURN3Y", "rewardItems": [{"duration": 71, "itemId": "97t9WxcC", "quantity": 78}, {"duration": 99, "itemId": "yQPx8t2L", "quantity": 48}, {"duration": 76, "itemId": "2x8QFZCk", "quantity": 84}]}], "userIdExpression": "qSBLF8OD"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'jPZq4kh0' \
    --limit '4' \
    --offset '62' \
    --sortBy 'namespace:asc,rewardCode:asc,rewardCode' \
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
    --rewardId 'cUXsH4Jv' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tfSbiRvY' \
    --body '{"description": "YyJECNI6", "eventTopic": "CksYVlcR", "maxAwarded": 60, "maxAwardedPerUser": 18, "namespaceExpression": "Ad9IySvz", "rewardCode": "LBUF2bCX", "rewardConditions": [{"condition": "jCJBcyku", "conditionName": "cUUKvgWu", "eventName": "DtNb5fgt", "rewardItems": [{"duration": 50, "itemId": "LV3UD6Rt", "quantity": 16}, {"duration": 88, "itemId": "OXUlJaKt", "quantity": 3}, {"duration": 63, "itemId": "xJHD2L0P", "quantity": 63}]}, {"condition": "0lGSZxx2", "conditionName": "8UL2Rte6", "eventName": "jveRSAqe", "rewardItems": [{"duration": 76, "itemId": "dbCCrxS9", "quantity": 29}, {"duration": 92, "itemId": "BTQKZfQ7", "quantity": 54}, {"duration": 83, "itemId": "X2azzIze", "quantity": 85}]}, {"condition": "ysoOJnX4", "conditionName": "0KulaI1J", "eventName": "ZjNiHpbH", "rewardItems": [{"duration": 94, "itemId": "TRGGCj6D", "quantity": 31}, {"duration": 43, "itemId": "auTzvrvu", "quantity": 88}, {"duration": 85, "itemId": "iQ5qlH6J", "quantity": 95}]}], "userIdExpression": "eAeCgav2"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'LEfw8ely' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'HzxASxKl' \
    --body '{"payload": {"EQQd18qB": {}, "4XUPyfOn": {}, "yU9loYCW": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'hTNz1ARJ' \
    --body '{"conditionName": "8Etsjlhd", "userId": "BIzwOpL3"}' \
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
    --body '{"defaultLanguage": "HanbnPn7", "defaultRegion": "4jjad0f4", "description": "0CzdEv9t", "supportedLanguages": ["058tgvYr", "VPJClzQH", "KLU0WgVV"], "supportedRegions": ["2wyGuJs5", "8S7AYSmo", "yQrvIIlO"], "title": "8nJWjPNa"}' \
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
    --storeId 'f28Xvftl' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EDcbW6cS' \
    --body '{"defaultLanguage": "jLuGvnSo", "defaultRegion": "945sJV0C", "description": "aE0pcJTf", "supportedLanguages": ["EYsRTSuk", "jzRYCXJF", "rdWn92tW"], "supportedRegions": ["lh6mK7K7", "JvfglWf1", "5s4pmvFI"], "title": "rgF8fsxk"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '4ziROrze' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UPAUODrU' \
    --action 'DELETE' \
    --itemSku '9rrBQHEr' \
    --itemType 'SEASON' \
    --limit '6' \
    --offset '40' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt,updatedAt:desc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'eZ2AFofM' \
    --updatedAtStart 'PhHhSUD6' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '2f1T5KVg' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KWI58YAj' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U20ne0l0' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IreBPv75' \
    --action 'DELETE' \
    --itemSku 'w6z2KgDe' \
    --itemType 'COINS' \
    --type 'ITEM' \
    --updatedAtEnd 'r3kUGBTa' \
    --updatedAtStart '77ZIxRMA' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J8CRk3fz' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'qil8UdvK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZrCmOB0o' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'aqyE5yp0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ozd4MZEu' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'm1XpofGZ' \
    --targetStoreId 'nFFpHD1P' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'jLXhYwxZ' \
    --limit '33' \
    --offset '77' \
    --sku 'uimT4cCy' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'V6EwVFNs' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qFpcSdLp' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'PvAuaXPt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'u31JAh0Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "1YS4rX3c"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'mXFaU030' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'fYPFBdVW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 70, "orderNo": "QJDfLuyg"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQSAPfEE' \
    --body '{"achievements": [{"id": "Q2fVN0AW", "value": 11}, {"id": "PFwti4z0", "value": 34}, {"id": "w0x2i020", "value": 82}], "steamUserId": "svMb1VGL"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'FG8mSJ16' \
    --xboxUserId 'mF097GDN' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mKqCXqfs' \
    --body '{"achievements": [{"id": "uzXpCCP4", "percentComplete": 31}, {"id": "5Ney2OWE", "percentComplete": 64}, {"id": "rhFWBNbD", "percentComplete": 77}], "serviceConfigId": "BjFPdAie", "titleId": "Gtqa5Znr", "xboxUserId": "FaQU7JAq"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTY7H89f' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QF4meWVu' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '3IWNeImu' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4hd5aEf' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'N0GiAhTE' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'nF5slxXC' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'qwmgptjc' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'kd6rnHec' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'GoQSqac0' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'uGbDZiXL' \
    --features 'qZLKG1LQ,JPw0gX3X,wyTyWUGE' \
    --itemId 'nmY0Qk0E,roXJhJIv,ls2mdjke' \
    --limit '35' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserEntitlements' test.out

#- 183 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '6w4e1Col' \
    --body '[{"endDate": "1989-08-01T00:00:00Z", "grantedCode": "1VrHI1h8", "itemId": "rdBAEczI", "itemNamespace": "3Gd9ZnwG", "language": "io-yCZO-994", "quantity": 28, "region": "7wwGmUp5", "source": "IAP", "startDate": "1990-05-24T00:00:00Z", "storeId": "ScxF6zsZ"}, {"endDate": "1999-12-19T00:00:00Z", "grantedCode": "g38OwPsQ", "itemId": "VdOMM83B", "itemNamespace": "5brHBfmp", "language": "jn-pr", "quantity": 12, "region": "JguWNz0T", "source": "GIFT", "startDate": "1974-02-21T00:00:00Z", "storeId": "KGFmCjHE"}, {"endDate": "1980-06-23T00:00:00Z", "grantedCode": "2i4MAPnT", "itemId": "8WBEptx2", "itemNamespace": "vrxgQQ6f", "language": "fB_Uuwh", "quantity": 52, "region": "ESSGlZU5", "source": "GIFT", "startDate": "1983-10-06T00:00:00Z", "storeId": "oBOs2ii2"}]' \
    > test.out 2>&1
eval_tap $? 183 'GrantUserEntitlement' test.out

#- 184 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JxwgbRZq' \
    --activeOnly  \
    --appId 'eKiTanPS' \
    > test.out 2>&1
eval_tap $? 184 'GetUserAppEntitlementByAppId' test.out

#- 185 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdrsEz4F' \
    --activeOnly  \
    --limit '98' \
    --offset '9' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserEntitlementsByAppType' test.out

#- 186 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pNOt3D10' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'tiNv9C5W' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementByItemId' test.out

#- 187 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'orvC33OO' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'Rh8ZIAkH' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementBySku' test.out

#- 188 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'B6Oeb1UR' \
    --appIds 'uux21eJi,evaKWUDh,p0PELIvp' \
    --itemIds '5BcURFPl,Syusiume,45btbTFr' \
    --skus 'IeMzwuXn,7TSxitht,qqvp6rFg' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlement' test.out

#- 189 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'vRbsqVnw' \
    --itemIds 'jmu6RBii,GNaYKFH1,GEqGtCGH' \
    > test.out 2>&1
eval_tap $? 189 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 190 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'k9RRFG85' \
    --appId 'MfL0J90o' \
    > test.out 2>&1
eval_tap $? 190 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 191 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'aWzQfcII' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'NXb2Jr4d' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemId' test.out

#- 192 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DFSweMAV' \
    --ids 'jB35qneL,E2HYxKgz,YsvvkSFE' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipByItemIds' test.out

#- 193 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZzY2xYcM' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'sHk8tZ3k' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipBySku' test.out

#- 194 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HDiwQNP2' \
    --entitlementIds 'jCgsBHY7' \
    > test.out 2>&1
eval_tap $? 194 'RevokeUserEntitlements' test.out

#- 195 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'TdZIwb8r' \
    --namespace "$AB_NAMESPACE" \
    --userId '7iVe1U6w' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlement' test.out

#- 196 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'LSH6KHG4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VmauPp9a' \
    --body '{"endDate": "1980-02-12T00:00:00Z", "nullFieldList": ["GSvty9vI", "PNpjpQH4", "o8ko8uQb"], "startDate": "1971-06-18T00:00:00Z", "status": "CONSUMED", "useCount": 52}' \
    > test.out 2>&1
eval_tap $? 196 'UpdateUserEntitlement' test.out

#- 197 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'rAg3Ub9O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nUJM5eZa' \
    --body '{"options": ["kmlT8C6h", "AWIyTOjd", "siqQxKkl"], "requestId": "huPIXtNW", "useCount": 32}' \
    > test.out 2>&1
eval_tap $? 197 'ConsumeUserEntitlement' test.out

#- 198 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '4xCNcjQq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fv8atr1M' \
    > test.out 2>&1
eval_tap $? 198 'DisableUserEntitlement' test.out

#- 199 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '9OkeaLuK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IMfOegv3' \
    > test.out 2>&1
eval_tap $? 199 'EnableUserEntitlement' test.out

#- 200 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'LSIfkmZJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bn7tTJxn' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementHistories' test.out

#- 201 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'cuhjPwxX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qcaaeeoD' \
    > test.out 2>&1
eval_tap $? 201 'RevokeUserEntitlement' test.out

#- 202 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'AYiIIuK2' \
    --body '{"duration": 33, "endDate": "1983-09-11T00:00:00Z", "itemId": "qDamZwLB", "itemSku": "lbrMBV2I", "language": "fqa7b3GZ", "order": {"currency": {"currencyCode": "gK7FSytR", "currencySymbol": "vzJeFG9h", "currencyType": "REAL", "decimals": 98, "namespace": "125jYvNh"}, "ext": {"nzYFX8Kj": {}, "9O33gtqm": {}, "hRr28atg": {}}, "free": false}, "orderNo": "hQ4WhNn6", "origin": "Other", "quantity": 93, "region": "9yDOB3vb", "source": "DLC", "startDate": "1990-10-04T00:00:00Z", "storeId": "8sOOf5TO"}' \
    > test.out 2>&1
eval_tap $? 202 'FulfillItem' test.out

#- 203 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eee3G0ZG' \
    --body '{"code": "P4wYWm0P", "language": "jz_PpuC-fL", "region": "tuBoFxZ8"}' \
    > test.out 2>&1
eval_tap $? 203 'RedeemCode' test.out

#- 204 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '0vIAjpay' \
    --body '{"origin": "System", "rewards": [{"currency": {"currencyCode": "d76NbCWC", "namespace": "XnpcJtAx"}, "item": {"itemId": "TLLVY8Bs", "itemSku": "WFiSbUO3", "itemType": "2L9Ybpu1"}, "quantity": 25, "type": "CURRENCY"}, {"currency": {"currencyCode": "TXSa1lUb", "namespace": "78qX993L"}, "item": {"itemId": "Hsdyigw5", "itemSku": "CrUqtQN0", "itemType": "YqRVfiCO"}, "quantity": 60, "type": "ITEM"}, {"currency": {"currencyCode": "gVXHYAd7", "namespace": "kBpDdMbF"}, "item": {"itemId": "jFvpHi28", "itemSku": "9XxPyHBW", "itemType": "DLIhBWPh"}, "quantity": 23, "type": "CURRENCY"}], "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillRewards' test.out

#- 205 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '7PRqUAcg' \
    --endTime '4c6Kqg5J' \
    --limit '9' \
    --offset '49' \
    --productId 'lAHJCI8H' \
    --startTime 'r899Le3j' \
    --status 'FULFILLED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 205 'QueryUserIAPOrders' test.out

#- 206 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'LLzvzEdF' \
    > test.out 2>&1
eval_tap $? 206 'QueryAllUserIAPOrders' test.out

#- 207 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'pt8WGuGe' \
    --endTime 'kVEG7oMJ' \
    --limit '60' \
    --offset '74' \
    --startTime 'jSvCMLX3' \
    --status 'FAIL' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserIAPConsumeHistory' test.out

#- 208 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'SF5fJW3S' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "FjSw_RPFC", "productId": "1ZWxAYNP", "region": "8SzaM4vr", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 208 'MockFulfillIAPItem' test.out

#- 209 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '0TqRccwX' \
    --itemId 'aFqmzhYJ' \
    --limit '25' \
    --offset '35' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserOrders' test.out

#- 210 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z49K5Diy' \
    --body '{"currencyCode": "AxlELYvD", "currencyNamespace": "DTOkLvWc", "discountedPrice": 31, "ext": {"LUmrMPeu": {}, "Hi4rZ2xC": {}, "NI9loiRv": {}}, "itemId": "Y2RWQbrk", "language": "DjIQ6CLb", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 66, "quantity": 37, "region": "Wn3yK43K", "returnUrl": "Vx50NB0p", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 210 'AdminCreateUserOrder' test.out

#- 211 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'BoN22e36' \
    --itemId 'DVK6c9bW' \
    > test.out 2>&1
eval_tap $? 211 'CountOfPurchasedItem' test.out

#- 212 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VreIKtA3' \
    --userId 'k0eIhXNz' \
    > test.out 2>&1
eval_tap $? 212 'GetUserOrder' test.out

#- 213 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GWPZN2f6' \
    --userId 'tghzDIYp' \
    --body '{"status": "REFUNDED", "statusReason": "3QLUvlcF"}' \
    > test.out 2>&1
eval_tap $? 213 'UpdateUserOrderStatus' test.out

#- 214 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3tmLBIPY' \
    --userId 'nReFGN1V' \
    > test.out 2>&1
eval_tap $? 214 'FulfillUserOrder' test.out

#- 215 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RmKTnKRg' \
    --userId 'YY8kfeH5' \
    > test.out 2>&1
eval_tap $? 215 'GetUserOrderGrant' test.out

#- 216 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ahRGomCQ' \
    --userId '9jWbQVc0' \
    > test.out 2>&1
eval_tap $? 216 'GetUserOrderHistories' test.out

#- 217 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nbkEpPPK' \
    --userId 'YJUDuvEx' \
    --body '{"additionalData": {"cardSummary": "ZkaFhSEJ"}, "authorisedTime": "1997-11-17T00:00:00Z", "chargebackReversedTime": "1979-07-27T00:00:00Z", "chargebackTime": "1973-06-27T00:00:00Z", "chargedTime": "1985-03-14T00:00:00Z", "createdTime": "1993-10-23T00:00:00Z", "currency": {"currencyCode": "zLiJcuNV", "currencySymbol": "MS3oqS4u", "currencyType": "REAL", "decimals": 66, "namespace": "JmFDAI5W"}, "customParameters": {"NyCLFcjR": {}, "JkriNtLX": {}, "ddtAoKao": {}}, "extOrderNo": "EiIbtwd9", "extTxId": "uPYstHzt", "extUserId": "pYC7zzji", "issuedAt": "1986-06-15T00:00:00Z", "metadata": {"yy9jnMGU": "tbQ5MwNb", "A1gjzLwo": "SWTkTjMd", "zLMdvo7v": "f1OC05lw"}, "namespace": "skhdBKMj", "nonceStr": "IB6GQnMQ", "paymentMethod": "8YStmO8Z", "paymentMethodFee": 84, "paymentOrderNo": "jySdKZnK", "paymentProvider": "ALIPAY", "paymentProviderFee": 62, "paymentStationUrl": "WT9Mr6bS", "price": 13, "refundedTime": "1988-02-10T00:00:00Z", "salesTax": 40, "sandbox": true, "sku": "KqdRnzqn", "status": "REFUND_FAILED", "statusReason": "8JhlPId9", "subscriptionId": "erDUG7GL", "subtotalPrice": 59, "targetNamespace": "VyuKVOIw", "targetUserId": "oVCqJaSM", "tax": 7, "totalPrice": 64, "totalTax": 82, "txEndTime": "1979-07-28T00:00:00Z", "type": "g6HJHLCY", "userId": "rfy6CVjf", "vat": 11}' \
    > test.out 2>&1
eval_tap $? 217 'ProcessUserOrderNotification' test.out

#- 218 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HjghH1a4' \
    --userId 'ZvUgtoxx' \
    > test.out 2>&1
eval_tap $? 218 'DownloadUserOrderReceipt' test.out

#- 219 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'emm9UPdg' \
    --body '{"currencyCode": "IQhm17OK", "currencyNamespace": "PAmiHf3R", "customParameters": {"2Pzj32VO": {}, "zp7GL6rF": {}, "2uz0iDkm": {}}, "description": "bL4vXXdq", "extOrderNo": "IzMaljUU", "extUserId": "LxeesFF4", "itemType": "APP", "language": "OgHn_ACeM", "metadata": {"X4No1Ju9": "8a3LHNpm", "b19qOhVV": "OSfHzxix", "LFOLAND6": "434LICW4"}, "notifyUrl": "tZKLkMXH", "omitNotification": true, "platform": "grx653sp", "price": 45, "recurringPaymentOrderNo": "kKNKysuo", "region": "YCoY6ALV", "returnUrl": "XjyKaF6m", "sandbox": false, "sku": "cQeJ7K0C", "subscriptionId": "j6Vip1G7", "title": "jAQ7bybw"}' \
    > test.out 2>&1
eval_tap $? 219 'CreateUserPaymentOrder' test.out

#- 220 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WfU4pANF' \
    --userId 'xkF6TyUx' \
    --body '{"description": "Ym3ydfjN"}' \
    > test.out 2>&1
eval_tap $? 220 'RefundUserPaymentOrder' test.out

#- 221 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'r7rH6cYW' \
    --body '{"code": "YQgi83Zj", "orderNo": "ZnoSHnRx"}' \
    > test.out 2>&1
eval_tap $? 221 'ApplyUserRedemption' test.out

#- 222 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'thpXQQ4i' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '0D2k7TDV' \
    --limit '49' \
    --offset '18' \
    --sku 'vC0oQr9I' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserSubscriptions' test.out

#- 223 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '2J2Vc1hj' \
    --excludeSystem  \
    --limit '21' \
    --offset '62' \
    --subscriptionId '09bE6pNh' \
    > test.out 2>&1
eval_tap $? 223 'GetUserSubscriptionActivities' test.out

#- 224 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'oPyUJvSz' \
    --body '{"grantDays": 75, "itemId": "VUYDNofP", "language": "vEVYxZwh", "reason": "9VyuFLxJ", "region": "99pWOW5A", "source": "YwElOYXs"}' \
    > test.out 2>&1
eval_tap $? 224 'PlatformSubscribeSubscription' test.out

#- 225 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'twKOOxNM' \
    --itemId 'JwtKtdD1' \
    > test.out 2>&1
eval_tap $? 225 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 226 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CzggwKiv' \
    --userId 'SgUM3A2O' \
    > test.out 2>&1
eval_tap $? 226 'GetUserSubscription' test.out

#- 227 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uC9pJXBd' \
    --userId '9xTWBCTr' \
    > test.out 2>&1
eval_tap $? 227 'DeleteUserSubscription' test.out

#- 228 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'U2HGZgFj' \
    --userId 'oBN4zGqP' \
    --force  \
    --body '{"immediate": true, "reason": "1dBeKVBZ"}' \
    > test.out 2>&1
eval_tap $? 228 'CancelSubscription' test.out

#- 229 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ycZqwha8' \
    --userId 'AXNooVTi' \
    --body '{"grantDays": 12, "reason": "WUXssAaU"}' \
    > test.out 2>&1
eval_tap $? 229 'GrantDaysToSubscription' test.out

#- 230 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6b2ASweq' \
    --userId 'qiD2bNZR' \
    --excludeFree  \
    --limit '98' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 230 'GetUserSubscriptionBillingHistories' test.out

#- 231 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OVHQwRuD' \
    --userId 'ew7XFdm9' \
    --body '{"additionalData": {"cardSummary": "fWi8Fb65"}, "authorisedTime": "1977-03-11T00:00:00Z", "chargebackReversedTime": "1980-02-15T00:00:00Z", "chargebackTime": "1985-01-19T00:00:00Z", "chargedTime": "1998-07-14T00:00:00Z", "createdTime": "1988-01-14T00:00:00Z", "currency": {"currencyCode": "5QuSBqXr", "currencySymbol": "Pf4qEngX", "currencyType": "VIRTUAL", "decimals": 60, "namespace": "aoKHWpJn"}, "customParameters": {"TJc9zsYm": {}, "23PnQMxO": {}, "xRNU4xaq": {}}, "extOrderNo": "nSM01o4f", "extTxId": "Re4e3zkd", "extUserId": "b59WG7rd", "issuedAt": "1998-06-25T00:00:00Z", "metadata": {"WmPv0SXZ": "PX4b73nb", "pbu6I4yO": "sFSnNEQF", "9QvgwCtx": "EKknXtRM"}, "namespace": "eF81aGVN", "nonceStr": "6q2fRzzh", "paymentMethod": "FaMgO9Gs", "paymentMethodFee": 47, "paymentOrderNo": "U13OYUYe", "paymentProvider": "PAYPAL", "paymentProviderFee": 59, "paymentStationUrl": "eKPua5Zf", "price": 49, "refundedTime": "1976-10-10T00:00:00Z", "salesTax": 8, "sandbox": false, "sku": "WQBc1WLq", "status": "CHARGEBACK_REVERSED", "statusReason": "MmkczHv5", "subscriptionId": "Suw3YXi9", "subtotalPrice": 42, "targetNamespace": "Smvrhy0K", "targetUserId": "iMKW9Ef2", "tax": 15, "totalPrice": 13, "totalTax": 60, "txEndTime": "1975-09-28T00:00:00Z", "type": "YG1NVTsl", "userId": "UIntNnyR", "vat": 94}' \
    > test.out 2>&1
eval_tap $? 231 'ProcessUserSubscriptionNotification' test.out

#- 232 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'HTGWfjH0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OcGmfuig' \
    --body '{"count": 48, "orderNo": "zKt4Ytpq"}' \
    > test.out 2>&1
eval_tap $? 232 'AcquireUserTicket' test.out

#- 233 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'oxLyQSpM' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserCurrencyWallets' test.out

#- 234 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 's5KGata2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RCyTHMT6' \
    --limit '11' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 234 'ListUserCurrencyTransactions' test.out

#- 235 CheckWallet
eval_tap 0 235 'CheckWallet # SKIP deprecated' test.out

#- 236 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'r4UAtqA9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fhjT4H7R' \
    --body '{"amount": 3, "expireAt": "1993-08-02T00:00:00Z", "origin": "Nintendo", "reason": "s7i7W0Wd", "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 236 'CreditUserWallet' test.out

#- 237 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'B8ynjJOl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RMbL8Vih' \
    --body '{"amount": 50, "walletPlatform": "Playstation"}' \
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
    --nextEvaluatedKey 'NNalRw9u' \
    --end 'YliIomR2' \
    --start 'bFfi3Gxi' \
    > test.out 2>&1
eval_tap $? 245 'SyncOrders' test.out

#- 246 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["8tbGIQYO", "43Ynw1M9", "oFcvne97"], "apiKey": "ntaWz5D9", "authoriseAsCapture": true, "blockedPaymentMethods": ["c01NQEHf", "OUyueSUo", "gkqdyGCt"], "clientKey": "5ZuJ4Msw", "dropInSettings": "ScX4PnoR", "liveEndpointUrlPrefix": "GM1WvC7E", "merchantAccount": "qeE3Yggd", "notificationHmacKey": "k0Uhviqy", "notificationPassword": "2Ssw9R3Y", "notificationUsername": "H8Pk52q9", "returnUrl": "7tgJ34Nu", "settings": "Mv7ecBk7"}' \
    > test.out 2>&1
eval_tap $? 246 'TestAdyenConfig' test.out

#- 247 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "NFqgxJGT", "privateKey": "rKK4Ovpf", "publicKey": "rVrgfmZC", "returnUrl": "D7i79YVE"}' \
    > test.out 2>&1
eval_tap $? 247 'TestAliPayConfig' test.out

#- 248 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "L6ITwvzU", "secretKey": "NfxGcyKD"}' \
    > test.out 2>&1
eval_tap $? 248 'TestCheckoutConfig' test.out

#- 249 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'OGMK9TJJ' \
    > test.out 2>&1
eval_tap $? 249 'DebugMatchedPaymentMerchantConfig' test.out

#- 250 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "ZRxdM1m8", "clientSecret": "byDGS9MD", "returnUrl": "S662DZx8", "webHookId": "K57dR1kx"}' \
    > test.out 2>&1
eval_tap $? 250 'TestPayPalConfig' test.out

#- 251 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["1NE3vgdY", "vIoNt8M8", "nmUHS4Yt"], "publishableKey": "irG7zc28", "secretKey": "xv9S81FY", "webhookSecret": "b43nFJ1g"}' \
    > test.out 2>&1
eval_tap $? 251 'TestStripeConfig' test.out

#- 252 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "daG9ghK2", "key": "DWMacKvs", "mchid": "e460W8VW", "returnUrl": "hV6kiiJW"}' \
    > test.out 2>&1
eval_tap $? 252 'TestWxPayConfig' test.out

#- 253 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "8GUqnHC4", "flowCompletionUrl": "n1uLB1HF", "merchantId": 21, "projectId": 45, "projectSecretKey": "Yep4qL9w"}' \
    > test.out 2>&1
eval_tap $? 253 'TestXsollaConfig' test.out

#- 254 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'Co6eWTDA' \
    > test.out 2>&1
eval_tap $? 254 'GetPaymentMerchantConfig' test.out

#- 255 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'f9J8PCjc' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["F2mR1yIU", "t3SKh0A5", "mNqL3dAM"], "apiKey": "POKuxJiM", "authoriseAsCapture": true, "blockedPaymentMethods": ["h4SDg2Ir", "AEvQQcul", "N4Bw1Dr4"], "clientKey": "wubYax2c", "dropInSettings": "2AyEaPDY", "liveEndpointUrlPrefix": "ymjjxs1Q", "merchantAccount": "jgb4bmU3", "notificationHmacKey": "qyQSxWvE", "notificationPassword": "pxWW0F4i", "notificationUsername": "xmd5GcpQ", "returnUrl": "imBaOLsk", "settings": "WNyTsgA8"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateAdyenConfig' test.out

#- 256 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '2dyT3SjD' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 256 'TestAdyenConfigById' test.out

#- 257 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'V1PyHTKv' \
    --sandbox  \
    --validate  \
    --body '{"appId": "97q57KO9", "privateKey": "At3XAtxw", "publicKey": "96faxUlD", "returnUrl": "3MJy7mHg"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateAliPayConfig' test.out

#- 258 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'Gu7Rfcdu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestAliPayConfigById' test.out

#- 259 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'LQzkHWH2' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "B9MpEMNE", "secretKey": "VcZQ5IXu"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateCheckoutConfig' test.out

#- 260 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'fYie2I3f' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestCheckoutConfigById' test.out

#- 261 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'TcHEUDxC' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "I7oDMIwD", "clientSecret": "KgJAe1q5", "returnUrl": "OOIZPFI3", "webHookId": "klerH6jW"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdatePayPalConfig' test.out

#- 262 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'c0MDEvu1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestPayPalConfigById' test.out

#- 263 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '5DZi27DH' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["DSIvqo1O", "VIKmoxfX", "YJ7A6evY"], "publishableKey": "SLLYw9QB", "secretKey": "mBAWylxn", "webhookSecret": "Ij8iKbpk"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateStripeConfig' test.out

#- 264 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'Se0Im7qB' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 264 'TestStripeConfigById' test.out

#- 265 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'K9owcXyo' \
    --validate  \
    --body '{"appId": "w1aAxRaZ", "key": "HQ41lojY", "mchid": "9CDV1bFl", "returnUrl": "9vi7Jju3"}' \
    > test.out 2>&1
eval_tap $? 265 'UpdateWxPayConfig' test.out

#- 266 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'fr919nrX' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 266 'UpdateWxPayConfigCert' test.out

#- 267 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'QXqZ1YMK' \
    > test.out 2>&1
eval_tap $? 267 'TestWxPayConfigById' test.out

#- 268 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'UvkhKiyE' \
    --validate  \
    --body '{"apiKey": "YpKmPEz3", "flowCompletionUrl": "27AqaLuM", "merchantId": 11, "projectId": 53, "projectSecretKey": "FgbeGJbr"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateXsollaConfig' test.out

#- 269 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'eEGLX8H8' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfigById' test.out

#- 270 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'Mmm67BWa' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateXsollaUIConfig' test.out

#- 271 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '2' \
    --namespace "$AB_NAMESPACE" \
    --offset '26' \
    --region 'JkNEytpT' \
    > test.out 2>&1
eval_tap $? 271 'QueryPaymentProviderConfig' test.out

#- 272 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "IdzLcsJO", "region": "R0BFA6eu", "sandboxTaxJarApiToken": "A563tXq3", "specials": ["WXPAY", "XSOLLA", "PAYPAL"], "taxJarApiToken": "n2wmBjde", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 272 'CreatePaymentProviderConfig' test.out

#- 273 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 273 'GetAggregatePaymentProviders' test.out

#- 274 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'bUaR4aTi' \
    > test.out 2>&1
eval_tap $? 274 'DebugMatchedPaymentProviderConfig' test.out

#- 275 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 275 'GetSpecialPaymentProviders' test.out

#- 276 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'mEokfyMU' \
    --body '{"aggregate": "XSOLLA", "namespace": "CfbHE20D", "region": "gHfWEnAp", "sandboxTaxJarApiToken": "kLZcF1CS", "specials": ["CHECKOUT", "CHECKOUT", "WXPAY"], "taxJarApiToken": "nIGm2oAz", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 276 'UpdatePaymentProviderConfig' test.out

#- 277 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '1OmsFFBK' \
    > test.out 2>&1
eval_tap $? 277 'DeletePaymentProviderConfig' test.out

#- 278 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 278 'GetPaymentTaxConfig' test.out

#- 279 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "VcENe4Bt", "taxJarApiToken": "dlcxk6uZ", "taxJarEnabled": false, "taxJarProductCodesMapping": {"o3mlVCIg": "7TuycHhC", "YIHbHaFf": "ZR0WJ4kP", "3zzlCqI7": "4JrMICzA"}}' \
    > test.out 2>&1
eval_tap $? 279 'UpdatePaymentTaxConfig' test.out

#- 280 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'wRyvSA5M' \
    --end 'GrIkCoIu' \
    --start 'o4yM8YLv' \
    > test.out 2>&1
eval_tap $? 280 'SyncPaymentOrders' test.out

#- 281 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'CZNP2FON' \
    --storeId 'JKrRnaED' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetRootCategories' test.out

#- 282 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'mweHbEep' \
    --storeId '4e0QEEzD' \
    > test.out 2>&1
eval_tap $? 282 'DownloadCategories' test.out

#- 283 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'CEmnWqtT' \
    --namespace "$AB_NAMESPACE" \
    --language 'gFeDMEGg' \
    --storeId 'LHY3P5Ee' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetCategory' test.out

#- 284 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'oi6kO4Rv' \
    --namespace "$AB_NAMESPACE" \
    --language '9yGrmLdq' \
    --storeId 'QRnlsWAj' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetChildCategories' test.out

#- 285 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'VKB8JH8Y' \
    --namespace "$AB_NAMESPACE" \
    --language 'WvhwV0pz' \
    --storeId 'ZJi6kYRa' \
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
    --language 'CVuEyjqQ' \
    --region 'vvHoed1w' \
    --storeId 'jqZ7U7wj' \
    --appId 'iQ1A2vTu' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetItemByAppId' test.out

#- 288 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'IYweXyXb' \
    --categoryPath 'a6Im0Bmq' \
    --features 'nBGegW4f' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'JfVieyCN' \
    --limit '34' \
    --offset '37' \
    --region 'D41TlJTb' \
    --sortBy 'name:asc,displayOrder:desc' \
    --storeId 'QY1LVqdK' \
    --tags 'vmLqXlNn' \
    > test.out 2>&1
eval_tap $? 288 'PublicQueryItems' test.out

#- 289 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'jkD2zyvM' \
    --region 'QW3Bxb4R' \
    --storeId 'ba0ddVy9' \
    --sku 'KI937CSV' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetItemBySku' test.out

#- 290 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language '1gb4CpBl' \
    --region '53RqkHeo' \
    --storeId 'KwJlKocs' \
    --itemIds 'dgADxlT1' \
    > test.out 2>&1
eval_tap $? 290 'PublicBulkGetItems' test.out

#- 291 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["RKn8lMi1", "rbDrfo3X", "sAp8iOzq"]}' \
    > test.out 2>&1
eval_tap $? 291 'PublicValidateItemPurchaseCondition' test.out

#- 292 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'EXTENSION' \
    --limit '2' \
    --offset '9' \
    --region 'CLPBmE0T' \
    --storeId 'p3U6aiUG' \
    --keyword 'dRNO148T' \
    --language 'dlD0idxA' \
    > test.out 2>&1
eval_tap $? 292 'PublicSearchItems' test.out

#- 293 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'ZfZVbomn' \
    --namespace "$AB_NAMESPACE" \
    --language '1ifWHhyu' \
    --region 'p7qoLGap' \
    --storeId 'lNYRQ4MZ' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetApp' test.out

#- 294 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'wyI8vHow' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'PublicGetItemDynamicData' test.out

#- 295 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'u0T0AaT4' \
    --namespace "$AB_NAMESPACE" \
    --language 'Qy4EkcSL' \
    --populateBundle  \
    --region 'ElaSv7vk' \
    --storeId 'TJ75EH0N' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetItem' test.out

#- 296 GetPaymentCustomization
eval_tap 0 296 'GetPaymentCustomization # SKIP deprecated' test.out

#- 297 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "z5nhOuI4", "paymentProvider": "WXPAY", "returnUrl": "7bkWNFL5", "ui": "8wNve0Wu", "zipCode": "5EtjLdln"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetPaymentUrl' test.out

#- 298 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Hh9jicTK' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetPaymentMethods' test.out

#- 299 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'q5FTi5Ag' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUnpaidPaymentOrder' test.out

#- 300 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aAgqaRAz' \
    --paymentProvider 'ADYEN' \
    --zipCode 'WifP59vR' \
    --body '{"token": "4OVEYX5h"}' \
    > test.out 2>&1
eval_tap $? 300 'Pay' test.out

#- 301 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wE7O8VAq' \
    > test.out 2>&1
eval_tap $? 301 'PublicCheckPaymentOrderPaidStatus' test.out

#- 302 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'H9dOXsFR' \
    > test.out 2>&1
eval_tap $? 302 'GetPaymentPublicConfig' test.out

#- 303 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'SLTRcuaC' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetQRCode' test.out

#- 304 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'BhkeyJDu' \
    --foreinginvoice 'zqKHKvVz' \
    --invoiceId 'mo2jxqx6' \
    --payload 'yiKmbI1H' \
    --redirectResult '1UwoREEW' \
    --resultCode 'DdKFRw1z' \
    --sessionId 'eyJn0mib' \
    --status 'eV7poRq2' \
    --token '1380VyIZ' \
    --type '69deTw4O' \
    --userId 'NqPim3NU' \
    --orderNo '2PFxJiqP' \
    --paymentOrderNo 'W1YWhkkr' \
    --paymentProvider 'ADYEN' \
    --returnUrl '4Mi3ELmn' \
    > test.out 2>&1
eval_tap $? 304 'PublicNormalizePaymentReturnUrl' test.out

#- 305 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'wLVw4L3H' \
    --paymentOrderNo 'AzCuaolL' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 305 'GetPaymentTaxValue' test.out

#- 306 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'wh4aWFBI' \
    > test.out 2>&1
eval_tap $? 306 'GetRewardByCode' test.out

#- 307 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Czks3e8E' \
    --limit '51' \
    --offset '70' \
    --sortBy 'namespace:desc,namespace' \
    > test.out 2>&1
eval_tap $? 307 'QueryRewards1' test.out

#- 308 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'b0H4MPPF' \
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
    --appIds '3nuyHcqe,EjYRkUUu,mwDoC87C' \
    --itemIds 'N4R4t8qE,opTJrOQr,439K5VEo' \
    --skus 'QnvVSj7k,u7fE2OA5,nm0aTGiT' \
    > test.out 2>&1
eval_tap $? 310 'PublicExistsAnyMyActiveEntitlement' test.out

#- 311 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'utlKVMeS' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 312 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'AY4kfGV5' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 313 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'CFQU2YIO' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 314 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'ao49wze4,jV7SEgkJ,3J6hgUeL' \
    --itemIds 'OZHQt2cs,UWY1uvSp,GltXLB26' \
    --skus 'tOQlTg7I,JxdJu5LU,IciSCXgj' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetEntitlementOwnershipToken' test.out

#- 315 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'L8a4ZCLo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyWallet' test.out

#- 316 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'o1hCis0n' \
    --body '{"epicGamesJwtToken": "YYRKNca6"}' \
    > test.out 2>&1
eval_tap $? 316 'SyncEpicGameDLC' test.out

#- 317 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '7vU4fFm0' \
    --body '{"serviceLabel": 81}' \
    > test.out 2>&1
eval_tap $? 317 'PublicSyncPsnDlcInventory' test.out

#- 318 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'rYR9yhXZ' \
    --body '{"appId": "NAcB74Od", "steamId": "nEJq3Faq"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncSteamDLC' test.out

#- 319 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '7nvR2Cv5' \
    --body '{"xstsToken": "LceqAR9H"}' \
    > test.out 2>&1
eval_tap $? 319 'SyncXboxDLC' test.out

#- 320 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'UP9xhQux' \
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName '11Cxo7Ib' \
    --features 'nZXtyhdK,z3TDzGU7,bCqPhEwU' \
    --itemId '56iwT1gM,OZud5Y8K,9deYOmUd' \
    --limit '17' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 320 'PublicQueryUserEntitlements' test.out

#- 321 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z312iGOA' \
    --appId 'tna9ubv6' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetUserAppEntitlementByAppId' test.out

#- 322 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7WhIoCJ' \
    --limit '3' \
    --offset '9' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 322 'PublicQueryUserEntitlementsByAppType' test.out

#- 323 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QHbvWVAO' \
    --entitlementClazz 'APP' \
    --itemId 'C7Ugfsko' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetUserEntitlementByItemId' test.out

#- 324 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'j4YfpoCN' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'sNQVuNDP' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserEntitlementBySku' test.out

#- 325 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'cbAyBzda' \
    --appIds 'TuTGIaXB,NJD4tUTz,cZKGSKGe' \
    --itemIds 'GUyT92AQ,fFJMlVQB,bXOwhBWm' \
    --skus 'uPx4yy7O,9E0IwlBg,8LsvpglJ' \
    > test.out 2>&1
eval_tap $? 325 'PublicExistsAnyUserActiveEntitlement' test.out

#- 326 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'BjP6AUFI' \
    --appId 'IWKanxtR' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 327 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fvNis2ck' \
    --entitlementClazz 'MEDIA' \
    --itemId '6EfsOsh8' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 328 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzwOmhH2' \
    --ids '5G19QFI8,EbinYFCP,tKdvrrr4' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 329 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LhfUoj63' \
    --entitlementClazz 'CODE' \
    --sku 'A1WcisGZ' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 330 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'sFy5Fg6L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EN25tQ7W' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetUserEntitlement' test.out

#- 331 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'dzoJkiVZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '4kZ621qU' \
    --body '{"options": ["85GZ3oFk", "5tpfbcs3", "9RvHdFic"], "requestId": "50SjVkAY", "useCount": 37}' \
    > test.out 2>&1
eval_tap $? 331 'PublicConsumeUserEntitlement' test.out

#- 332 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'omF3cIPl' \
    --body '{"code": "XpRDCjIC", "language": "mNd_otYF", "region": "c1hWfUkR"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicRedeemCode' test.out

#- 333 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EsbH3muv' \
    --body '{"excludeOldTransactions": false, "language": "IZ_Ma", "productId": "2jHEHKr0", "receiptData": "VbAVmJR8", "region": "vQlYhTwA", "transactionId": "jd6ZljEF"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicFulfillAppleIAPItem' test.out

#- 334 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'p8ChM78D' \
    --body '{"epicGamesJwtToken": "sXXeR2mw"}' \
    > test.out 2>&1
eval_tap $? 334 'SyncEpicGamesInventory' test.out

#- 335 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'o5jvtNuB' \
    --body '{"autoAck": false, "language": "UcL_124", "orderId": "b0K4gxK4", "packageName": "hwKnQeyn", "productId": "eULWoRbU", "purchaseTime": 12, "purchaseToken": "gBgJQEnw", "region": "AY1Sz6Bb"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicFulfillGoogleIAPItem' test.out

#- 336 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'YPRSOBJ9' \
    --body '{"currencyCode": "s5xgTqcT", "price": 0.4673128021887988, "productId": "iw4uWJm6", "serviceLabel": 33}' \
    > test.out 2>&1
eval_tap $? 336 'PublicReconcilePlayStationStore' test.out

#- 337 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLgSQxWv' \
    --body '{"appId": "9mKu6hj2", "language": "htAo_Zmrs", "region": "LxYDZe8k", "stadiaPlayerId": "pixYd1xu"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncStadiaEntitlement' test.out

#- 338 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6h238AAh' \
    --body '{"appId": "3noU9OiD", "currencyCode": "U6IIdRtw", "language": "zRXM", "price": 0.1647871196782581, "productId": "I4LhtLIs", "region": "1qi99HCQ", "steamId": "SxgZ6KnM"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncSteamInventory' test.out

#- 339 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bJcG8WRp' \
    --body '{"gameId": "AJiPNnmx", "language": "bYid_Ghuu", "region": "jIGbsaVn"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncTwitchDropsEntitlement' test.out

#- 340 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xnhfz98i' \
    --body '{"currencyCode": "vCf5E3Ll", "price": 0.25662938088384757, "productId": "xdKtypXr", "xstsToken": "2WHdsD4j"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncXboxInventory' test.out

#- 341 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '8x0ocBFm' \
    --itemId 'P8g6HOim' \
    --limit '2' \
    --offset '29' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 341 'PublicQueryUserOrders' test.out

#- 342 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'PQ2X5Mqb' \
    --body '{"currencyCode": "2LP3mHTj", "discountedPrice": 36, "ext": {"fqjuipHg": {}, "WeRgZEmy": {}, "v0hTZjC1": {}}, "itemId": "cwuc47L0", "language": "Ve-qIdo_Kk", "price": 0, "quantity": 42, "region": "6OVGjtsH", "returnUrl": "AyvKGTeL"}' \
    > test.out 2>&1
eval_tap $? 342 'PublicCreateUserOrder' test.out

#- 343 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rWyW0xvL' \
    --userId 'Uzxxe47e' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserOrder' test.out

#- 344 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'BJH4nHjF' \
    --userId 'cCS7Dssj' \
    > test.out 2>&1
eval_tap $? 344 'PublicCancelUserOrder' test.out

#- 345 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'P4FQAdx3' \
    --userId '68q3z2vQ' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserOrderHistories' test.out

#- 346 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iod3phX6' \
    --userId '1BNKo5Yq' \
    > test.out 2>&1
eval_tap $? 346 'PublicDownloadUserOrderReceipt' test.out

#- 347 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'TOliMCMS' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetPaymentAccounts' test.out

#- 348 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'YBAJzdxL' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'sIONwle2' \
    > test.out 2>&1
eval_tap $? 348 'PublicDeletePaymentAccount' test.out

#- 349 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'PMgTxVip' \
    --chargeStatus 'SETUP' \
    --itemId '95gF0VVR' \
    --limit '88' \
    --offset '40' \
    --sku 'WnPaTYmO' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 349 'PublicQueryUserSubscriptions' test.out

#- 350 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'OHXKyjBP' \
    --body '{"currencyCode": "sWeHJEy8", "itemId": "jkEX3pxe", "language": "TNZ_JlKQ", "region": "wm1Unn0L", "returnUrl": "ftZ3E4zr", "source": "q9OjSBy9"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicSubscribeSubscription' test.out

#- 351 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FtV1vBPy' \
    --itemId 'Epw9inw4' \
    > test.out 2>&1
eval_tap $? 351 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 352 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VdA3TgmE' \
    --userId 'oLHB3zqf' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetUserSubscription' test.out

#- 353 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dNzV9Zg9' \
    --userId 'f0l6HqjA' \
    > test.out 2>&1
eval_tap $? 353 'PublicChangeSubscriptionBillingAccount' test.out

#- 354 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AOL8JjAx' \
    --userId 'RXUQYPiV' \
    --body '{"immediate": true, "reason": "MmeZeeEz"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicCancelSubscription' test.out

#- 355 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bysjd1TN' \
    --userId 'glyRysLu' \
    --excludeFree  \
    --limit '77' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetUserSubscriptionBillingHistories' test.out

#- 356 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'lVWgHuvU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uxiMlCbG' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetWallet' test.out

#- 357 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'OiYZeGWz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GhA1eCWs' \
    --limit '7' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 357 'PublicListUserWalletTransactions' test.out

#- 358 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'rNlMzLb5' \
    --baseAppId '8bp0eR0E' \
    --categoryPath '71UYsctY' \
    --features 'Iq1qXieS' \
    --includeSubCategoryItem  \
    --itemStatus 'INACTIVE' \
    --itemType 'INGAMEITEM' \
    --limit '100' \
    --offset '4' \
    --region 'i3uoe59s' \
    --sortBy 'displayOrder,createdAt,createdAt:asc' \
    --storeId 'cI8BZwOx' \
    --tags 'FN2EB5jR' \
    --targetNamespace 'QH4bElra' \
    > test.out 2>&1
eval_tap $? 358 'QueryItems1' test.out

#- 359 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Jaen59UA' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 359 'ImportStore1' test.out

#- 360 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 's6aYTWsO' \
    --body '{"itemIds": ["VO9RHEV5", "hKRnO21Y", "XXkdU1XH"]}' \
    > test.out 2>&1
eval_tap $? 360 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE