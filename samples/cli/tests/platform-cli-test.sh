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
echo "1..385"

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
    --body '{"context": {"item": {"appId": "EAxcVpFr", "appType": "GAME", "baseAppId": "I6LZrkq6", "boothName": "Dc09nIW0", "boundItemIds": ["7eHpzSn3", "ZPUdc0qh", "Oaiw9B0D"], "categoryPath": "4n8mzZ0m", "clazz": "8SAMTwE6", "createdAt": "1988-10-30T00:00:00Z", "description": "6IaRDBXx", "displayOrder": 49, "entitlementType": "CONSUMABLE", "ext": {"aNoMR6hk": {}, "spInrAip": {}, "6lyzSxwE": {}}, "features": ["1Jub74CU", "kNmKJfh5", "lFHHdgs2"], "fresh": false, "images": [{"as": "kY1aXlFc", "caption": "DtgOjchI", "height": 42, "imageUrl": "Hs1cnz1J", "smallImageUrl": "SDgY1TXp", "width": 3}, {"as": "8zsCTCrb", "caption": "CbPOyNQk", "height": 93, "imageUrl": "6XM4OI18", "smallImageUrl": "mAQLnzjM", "width": 11}, {"as": "cXm7agSr", "caption": "jJW2OQNO", "height": 38, "imageUrl": "u2D6QVKN", "smallImageUrl": "CWP75TB0", "width": 18}], "itemId": "Fgx4c8Ou", "itemIds": ["mKtPDKJD", "Xn7Z4U68", "su8Xfqlq"], "itemQty": {"NiTvB6Sd": 55, "orKsxwko": 39, "Z5MecdKi": 58}, "itemType": "EXTENSION", "language": "8XfwHuKe", "listable": false, "localExt": {"Ezth6mXh": {}, "zkzWkFeZ": {}, "SoEAcBdW": {}}, "longDescription": "19m4eu6d", "lootBoxConfig": {"rewardCount": 66, "rewards": [{"lootBoxItems": [{"count": 40, "itemId": "6C7duuyZ", "itemSku": "0GhDogqr", "itemType": "hBRd8lDR"}, {"count": 53, "itemId": "qVNPRZYd", "itemSku": "FLIAjGGJ", "itemType": "ddVCvu9v"}, {"count": 47, "itemId": "SevkLGMS", "itemSku": "0lyuI9a2", "itemType": "I9u6Vpbs"}], "name": "x5w8hqUI", "odds": 0.8444144295138901, "type": "PROBABILITY_GROUP", "weight": 96}, {"lootBoxItems": [{"count": 92, "itemId": "pOXGSLmC", "itemSku": "VuHOPlLl", "itemType": "kvR8sKgn"}, {"count": 41, "itemId": "TeIv53HG", "itemSku": "CiljvjKo", "itemType": "yD6SCwGr"}, {"count": 27, "itemId": "FjkQsfCa", "itemSku": "Tmt1d67F", "itemType": "XGk2s9Q0"}], "name": "mPVo3twu", "odds": 0.8515712018765591, "type": "REWARD_GROUP", "weight": 93}, {"lootBoxItems": [{"count": 10, "itemId": "C6I3lMjG", "itemSku": "SWN2laRl", "itemType": "xfcjHfYa"}, {"count": 21, "itemId": "MbwL6IY6", "itemSku": "9z1UaLqY", "itemType": "SYWytLPz"}, {"count": 18, "itemId": "yYoNRKd3", "itemSku": "IL5TAQ6i", "itemType": "iPlSC2uE"}], "name": "4o5Vwdo3", "odds": 0.09427513649391428, "type": "PROBABILITY_GROUP", "weight": 33}], "rollFunction": "DEFAULT"}, "maxCount": 4, "maxCountPerUser": 70, "name": "UmLZZbSq", "namespace": "b8RwNmn9", "optionBoxConfig": {"boxItems": [{"count": 69, "itemId": "VAla2l5B", "itemSku": "YNtIuS5S", "itemType": "5XUdjsoq"}, {"count": 45, "itemId": "OcEdscKH", "itemSku": "PEqgA8yu", "itemType": "7Vk6Jt4Y"}, {"count": 25, "itemId": "hZv15T7q", "itemSku": "uIOvBMca", "itemType": "YmvCkGZ5"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 54, "comparison": "includes", "name": "yCUEXlAv", "predicateType": "SeasonPassPredicate", "value": "oxozr6wf", "values": ["jJCSQT27", "RMvqtlB2", "NPX2bOIt"]}, {"anyOf": 3, "comparison": "excludes", "name": "YGu0rdlg", "predicateType": "EntitlementPredicate", "value": "RBaAkLnv", "values": ["xkT1X68c", "mDc3fxU8", "MyKrQpM4"]}, {"anyOf": 16, "comparison": "isNot", "name": "kkK6KKXN", "predicateType": "SeasonPassPredicate", "value": "3xoJ8aeC", "values": ["4YUDjasW", "naLpUKp4", "IPUvmEej"]}]}, {"operator": "or", "predicates": [{"anyOf": 35, "comparison": "includes", "name": "kILsSSyD", "predicateType": "EntitlementPredicate", "value": "rvjj7il3", "values": ["MNqq98Sj", "TvhZNkSQ", "5MXbN9oC"]}, {"anyOf": 60, "comparison": "excludes", "name": "6BXksUC9", "predicateType": "EntitlementPredicate", "value": "z1x3poD3", "values": ["Qgb3boLQ", "Q1MzH7Qm", "8bwbmXgd"]}, {"anyOf": 55, "comparison": "is", "name": "VJf6c2Z0", "predicateType": "SeasonTierPredicate", "value": "AFKK2WDg", "values": ["3EeERmDn", "yeFoF7VS", "CcxvONZm"]}]}, {"operator": "or", "predicates": [{"anyOf": 30, "comparison": "isGreaterThanOrEqual", "name": "JbRFQSKV", "predicateType": "SeasonTierPredicate", "value": "Tb3g7mSQ", "values": ["qU6YE3p4", "UhAEtrmj", "lSck0ZHn"]}, {"anyOf": 92, "comparison": "isNot", "name": "I39YBHqa", "predicateType": "SeasonTierPredicate", "value": "XlvPG6bF", "values": ["2L7vIYhG", "cCx9Zw5D", "YReVHQip"]}, {"anyOf": 67, "comparison": "includes", "name": "yEW4ZJJ4", "predicateType": "SeasonTierPredicate", "value": "d3PBddN8", "values": ["S48l9lyN", "j3oZk03Q", "ApflxqMr"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 51, "fixedTrialCycles": 74, "graceDays": 69}, "region": "MDYDDxHS", "regionData": [{"currencyCode": "ZjtqXyJ5", "currencyNamespace": "8f7Gc26S", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1975-10-16T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1971-02-11T00:00:00Z", "discountedPrice": 21, "expireAt": "1997-07-16T00:00:00Z", "price": 47, "purchaseAt": "1972-07-27T00:00:00Z", "trialPrice": 46}, {"currencyCode": "fTcyiuAT", "currencyNamespace": "us9hsfpF", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1972-08-26T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1982-09-24T00:00:00Z", "discountedPrice": 39, "expireAt": "1971-07-13T00:00:00Z", "price": 80, "purchaseAt": "1987-10-03T00:00:00Z", "trialPrice": 67}, {"currencyCode": "yPLtI8il", "currencyNamespace": "byDPUIj8", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1995-02-05T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1976-01-25T00:00:00Z", "discountedPrice": 32, "expireAt": "1979-05-05T00:00:00Z", "price": 59, "purchaseAt": "1999-06-03T00:00:00Z", "trialPrice": 26}], "seasonType": "PASS", "sku": "1P1ktfIo", "stackable": true, "status": "ACTIVE", "tags": ["JcHm3SZL", "xoRDFuuu", "mv9gsR5c"], "targetCurrencyCode": "ySj29a9L", "targetItemId": "JE8HoRS1", "targetNamespace": "X2PFAAMw", "thumbnailUrl": "zHPxB1Us", "title": "kYs4Yw20", "updatedAt": "1986-01-04T00:00:00Z", "useCount": 84}, "namespace": "ZSWMiVi1", "order": {"currency": {"currencyCode": "0sG6vxkf", "currencySymbol": "UcmqRRbc", "currencyType": "REAL", "decimals": 56, "namespace": "J5i0EeDx"}, "ext": {"OgBnhhqE": {}, "lIaDml48": {}, "wdNFLTm5": {}}, "free": false}, "source": "OTHER"}, "script": "0x9WT0Gf", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id '2rtOa4EX' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'sXzOXQAk' \
    --body '{"grantDays": "4mqrxzTt"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'uLl4XlbG' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'L8QOxtjz' \
    --body '{"grantDays": "m8y2wNhm"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "woYZyI4E", "dryRun": false, "fulfillmentUrl": "ZKBcYrCE", "itemType": "LOOTBOX", "purchaseConditionUrl": "reNDUWeh"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'wH3q31A8' \
    --itemType 'BUNDLE' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'DJgas4b6' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'z3LNUj7f' \
    --body '{"clazz": "dgLA84Z8", "dryRun": true, "fulfillmentUrl": "Yk6QEgJj", "purchaseConditionUrl": "BbEDoNf3"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'n0hEoRCA' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --name 'xvvKgAT8' \
    --offset '26' \
    --tag 'bWAgIUXi' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "I07A68ea", "items": [{"extraSubscriptionDays": 33, "itemId": "wxcfMy9X", "itemName": "zjjI5Ybs", "quantity": 74}, {"extraSubscriptionDays": 75, "itemId": "oADkzJEN", "itemName": "2VHzih3b", "quantity": 16}, {"extraSubscriptionDays": 39, "itemId": "6IlBhnet", "itemName": "U4RwTqUX", "quantity": 24}], "maxRedeemCountPerCampaignPerUser": 13, "maxRedeemCountPerCode": 93, "maxRedeemCountPerCodePerUser": 8, "maxSaleCount": 61, "name": "O3FgkXhj", "redeemEnd": "1986-08-02T00:00:00Z", "redeemStart": "1984-01-01T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["Y3snn2Zk", "P7cFdP43", "e5dC9XIB"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'bRVhyaKw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'wrAP2aMl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "u7WtjCto", "items": [{"extraSubscriptionDays": 35, "itemId": "etOO847g", "itemName": "8OudOfjn", "quantity": 59}, {"extraSubscriptionDays": 65, "itemId": "uHZ3c46I", "itemName": "jGa23YvY", "quantity": 25}, {"extraSubscriptionDays": 81, "itemId": "mDg7VYPX", "itemName": "IuvUYTZB", "quantity": 89}], "maxRedeemCountPerCampaignPerUser": 35, "maxRedeemCountPerCode": 42, "maxRedeemCountPerCodePerUser": 8, "maxSaleCount": 18, "name": "Svf9699m", "redeemEnd": "1985-07-18T00:00:00Z", "redeemStart": "1986-08-02T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["kRCMNFIu", "rjh2imdb", "4rbkXj0Z"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'wsVC0gL9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '7ZVJSPqJ' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iwv1qlYB' \
    --body '{"categoryPath": "1RSKs6gQ", "localizationDisplayNames": {"xC3Gb7S0": "o4zGYY7K", "QI1AeFgP": "qaOkvo1a", "olB4lkKB": "4EYOkQ1j"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MD3cym8x' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'IfkOVW2g' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rREOLx0K' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'Oww3HICQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Lfl7MUBG' \
    --body '{"localizationDisplayNames": {"7qtPu64y": "AtURKLRk", "b738HGS6": "rDgMdIIl", "hS1fSiM9": "331m7Ta1"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'PsKc50Kv' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6ecnEevc' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'Ax2K2zkR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'enmPZnGB' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 't4P7Wnbd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SJtjX7Zs' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'hZyZl5x4' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '3' \
    --code 'zGdKvOPd' \
    --limit '33' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '5xrgxSmy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 61}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'u3dpCROY' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '34' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'DQyj4bj5' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '89' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'mpo6sPwV' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '83' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'ujQSa3Zd' \
    --namespace "$AB_NAMESPACE" \
    --code 'b65UXmy0' \
    --limit '91' \
    --offset '31' \
    --userId '5EpGhhvX' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Yck0upMz' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'UYnb76tF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'kEORV3bu' \
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
    --body '{"grpcServerAddress": "1bNCtX7W"}' \
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
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 39 'ListCurrencies' test.out

#- 40 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "0V6Do5sY", "currencySymbol": "adCCFrHH", "currencyType": "VIRTUAL", "decimals": 42, "localizationDescriptions": {"3DpZxkrQ": "DXuNFviM", "arv8mnfH": "K8CCmE2l", "PnsbD3SG": "EdlwuUcc"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'E536ugBp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"3HBvepnD": "CjgyJlXe", "36mgWjLf": "Fmteue9n", "zJ6fH24T": "805tVg8J"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'qU0jZpjv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'sugAOS7u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '8RiWyerC' \
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
    --body '{"data": [{"id": "Sa8SRgws", "rewards": [{"currency": {"currencyCode": "Aj1ik1jg", "namespace": "laDXTvKC"}, "item": {"itemId": "WwNTAhd2", "itemSku": "wrS0uPdj", "itemType": "hdinpng5"}, "quantity": 56, "type": "ITEM"}, {"currency": {"currencyCode": "y8wbhMss", "namespace": "AHjapIkY"}, "item": {"itemId": "9Rf4wP57", "itemSku": "dBZNR88Y", "itemType": "bCtmKy8M"}, "quantity": 54, "type": "ITEM"}, {"currency": {"currencyCode": "czbBdHb2", "namespace": "slt71B1S"}, "item": {"itemId": "mZp2JZp5", "itemSku": "0CnPb71O", "itemType": "RYcmQbTU"}, "quantity": 81, "type": "ITEM"}]}, {"id": "8ccLjMXJ", "rewards": [{"currency": {"currencyCode": "Rk0eaKQD", "namespace": "OJvrTefg"}, "item": {"itemId": "lSs6g4iY", "itemSku": "9u02aCNY", "itemType": "IWekp18l"}, "quantity": 84, "type": "ITEM"}, {"currency": {"currencyCode": "C3mNqF7B", "namespace": "l0LcghVH"}, "item": {"itemId": "fPEspxwh", "itemSku": "RON0bc1e", "itemType": "MbEIjowL"}, "quantity": 33, "type": "CURRENCY"}, {"currency": {"currencyCode": "esKoELCp", "namespace": "obBEG8X6"}, "item": {"itemId": "45xpdXpa", "itemSku": "i0rYaT5h", "itemType": "OPjaf3H0"}, "quantity": 39, "type": "CURRENCY"}]}, {"id": "ighU0VUf", "rewards": [{"currency": {"currencyCode": "cYHJbBfA", "namespace": "KSiPW3Vg"}, "item": {"itemId": "sZXiR1DJ", "itemSku": "7HVWqMkN", "itemType": "SawQUWDF"}, "quantity": 73, "type": "ITEM"}, {"currency": {"currencyCode": "vJBWic7U", "namespace": "kBeIXuqD"}, "item": {"itemId": "uAXI66bQ", "itemSku": "71w0deoV", "itemType": "9Lx5RDA1"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "2XcrciYN", "namespace": "EzvSZIPk"}, "item": {"itemId": "hSgORcz5", "itemSku": "S5BvmgBL", "itemType": "xh4ijFnE"}, "quantity": 39, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"7M6Nzy1a": "dnSKOLFK", "x1dX4LuW": "Ju3pDMUA", "eeZ97SBR": "OPYuG6Xq"}}, {"platform": "XBOX", "platformDlcIdMap": {"6oo7G73z": "dxTgOfnw", "IdlNa29f": "DLh741Is", "lKHzGlLK": "WUtDQs61"}}, {"platform": "XBOX", "platformDlcIdMap": {"exL4fZvW": "tND2tcBF", "pX8lNtFE": "J7tnkY6M", "ca5afj12": "K2IzrBvv"}}]}' \
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
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName 'gatOEBM7' \
    --itemId '0TdlNBJY,Ompu1VCa,rzBsV6xn' \
    --limit '73' \
    --offset '20' \
    --userId 'rzzjrcau' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'g6CWVG8S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '27' \
    --status 'FAIL' \
    --userId '3glU6mus' \
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
    --body '{"bundleId": "wVJnNnN7", "password": "kAa7j0ri"}' \
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
    --body '{"sandboxId": "Fc5HTHQI"}' \
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
    --body '{"applicationName": "oVsGo7dw", "serviceAccountId": "V9DBqFKH"}' \
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
    --body '{"data": [{"itemIdentity": "QkETJyTl", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"rwDTnouj": "QD4IEiH9", "Z5qXn3ao": "RtlqOECo", "hViHA5Cz": "gFSy8X1A"}}, {"itemIdentity": "3PrIfapq", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"fB4ZH3mt": "gWgU4pCA", "KxeE70Ca": "unQNxot3", "71W9G4Av": "QkqsGnmy"}}, {"itemIdentity": "o5JJTUVm", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"MkawaGpA": "yrIwMif3", "BOdkocVT": "d4BxqGWV", "6mTJ0sQs": "6XNbjvqh"}}]}' \
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
    --body '{"environment": "nUVLWu8o"}' \
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
    --body '{"appId": "lKdxL6oz", "publisherAuthenticationKey": "RmDD0jJv"}' \
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
    --body '{"clientId": "lfV5OemP", "clientSecret": "YdYT7DRO", "organizationId": "CjtuzFMb"}' \
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
    --body '{"relyingPartyCert": "AG9YI89h"}' \
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
    --password 'mguB8FOT' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'jMLo4b9r' \
    --itemId 'IzqYkEps' \
    --itemType 'EXTENSION' \
    --endTime '7SUQPLG5' \
    --startTime '9e0k5ZtX' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '6wK7PpUl' \
    --itemId 'cIW32iK7' \
    --itemType 'SEASON' \
    --endTime 'vvwLc7KY' \
    --startTime '3uVoJXTI' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MtpgkieD' \
    --body '{"categoryPath": "yF97lGdM", "targetItemId": "iHKxbWCY", "targetNamespace": "zo8yO2KT"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K9tmmOnY' \
    --body '{"appId": "nOpas6gh", "appType": "SOFTWARE", "baseAppId": "1y4Zi7s7", "boothName": "QBlk44Z4", "categoryPath": "4B1GZgKg", "clazz": "4uKxaCgc", "displayOrder": 66, "entitlementType": "CONSUMABLE", "ext": {"LuC3brWd": {}, "TYCfHkIy": {}, "Sok5DiXZ": {}}, "features": ["tLW87rGy", "sryod3dN", "QrmsApRA"], "images": [{"as": "6HX3RwrK", "caption": "t2ecozL0", "height": 93, "imageUrl": "EhoXmM2W", "smallImageUrl": "7l6jHMA2", "width": 37}, {"as": "4lNa4JUM", "caption": "SHNgqRqC", "height": 97, "imageUrl": "ryEJ0Nqo", "smallImageUrl": "Tow0qiOi", "width": 58}, {"as": "95HgXqKh", "caption": "TPkwfLM9", "height": 42, "imageUrl": "0LZ5njN8", "smallImageUrl": "6Hl8kUXz", "width": 40}], "itemIds": ["0n9d9lvc", "cKMLhrTr", "cBE2ItBS"], "itemQty": {"3KtKZWe8": 0, "uaS7RBx3": 44, "74HUtipU": 100}, "itemType": "EXTENSION", "listable": false, "localizations": {"DyvpcLYO": {"description": "WA8NjxOn", "localExt": {"aEok4nOO": {}, "Czfsflhj": {}, "bngJOUn1": {}}, "longDescription": "8G5MlfDT", "title": "k8aG40Nl"}, "ncceIZSw": {"description": "gAIkgzh4", "localExt": {"pTU0Am4D": {}, "Zhl0bQxF": {}, "J3sWCqQp": {}}, "longDescription": "Q2FbKPFM", "title": "ycMSQ4qf"}, "AacR0LgB": {"description": "5BUXvjcu", "localExt": {"2s6w3Vif": {}, "nKqmTSoG": {}, "H1XEfY6Q": {}}, "longDescription": "AYn6WQ5U", "title": "BEU1QAOH"}}, "lootBoxConfig": {"rewardCount": 11, "rewards": [{"lootBoxItems": [{"count": 38, "itemId": "ZiGhxOdc", "itemSku": "uDXSxSc3", "itemType": "aZPV87pn"}, {"count": 0, "itemId": "8Asvt1j1", "itemSku": "Rx59hesN", "itemType": "Wy2NvZ85"}, {"count": 60, "itemId": "C6ePeN8i", "itemSku": "4GrFES9z", "itemType": "7xueHpAT"}], "name": "Hccee9GX", "odds": 0.11754479283584196, "type": "REWARD_GROUP", "weight": 26}, {"lootBoxItems": [{"count": 4, "itemId": "nnx6RVBr", "itemSku": "op9v7aZK", "itemType": "3h65hbN1"}, {"count": 46, "itemId": "zfQSfQrt", "itemSku": "fF3TQN0O", "itemType": "cNDLr36v"}, {"count": 53, "itemId": "C4dfiOMZ", "itemSku": "fEhHr39p", "itemType": "ysFO3Zvc"}], "name": "1BZG99Ly", "odds": 0.33980335317952826, "type": "PROBABILITY_GROUP", "weight": 43}, {"lootBoxItems": [{"count": 68, "itemId": "EcENx9xZ", "itemSku": "lAchob44", "itemType": "lONDDwMv"}, {"count": 13, "itemId": "fIGaffof", "itemSku": "lEIByYqe", "itemType": "KN0meGel"}, {"count": 3, "itemId": "F5wWaDhu", "itemSku": "kU4khGG4", "itemType": "vZFTYnPk"}], "name": "mSu4PWam", "odds": 0.8622650850203948, "type": "PROBABILITY_GROUP", "weight": 76}], "rollFunction": "DEFAULT"}, "maxCount": 90, "maxCountPerUser": 79, "name": "SETWjteo", "optionBoxConfig": {"boxItems": [{"count": 4, "itemId": "VBycvU4P", "itemSku": "bmRDcrg0", "itemType": "DjQjBECX"}, {"count": 44, "itemId": "w6T6mZEi", "itemSku": "wxxElpMY", "itemType": "SWIeVzm7"}, {"count": 51, "itemId": "Heh94TSe", "itemSku": "nE5hCFkI", "itemType": "f5weqZ18"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 24, "fixedTrialCycles": 96, "graceDays": 87}, "regionData": {"Zsrh90ET": [{"currencyCode": "tYmGukz3", "currencyNamespace": "MnlrjcHp", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1996-02-08T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1989-03-17T00:00:00Z", "discountedPrice": 100, "expireAt": "1985-05-24T00:00:00Z", "price": 84, "purchaseAt": "1996-05-20T00:00:00Z", "trialPrice": 64}, {"currencyCode": "x9Ns8eLz", "currencyNamespace": "YEvwSWTa", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1972-03-16T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1985-06-22T00:00:00Z", "discountedPrice": 78, "expireAt": "1979-10-25T00:00:00Z", "price": 18, "purchaseAt": "1973-02-28T00:00:00Z", "trialPrice": 38}, {"currencyCode": "XhIjSoTB", "currencyNamespace": "2NMKteza", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1992-07-30T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1994-12-08T00:00:00Z", "discountedPrice": 88, "expireAt": "1997-09-06T00:00:00Z", "price": 84, "purchaseAt": "1992-07-09T00:00:00Z", "trialPrice": 84}], "zTxBGtEJ": [{"currencyCode": "IYppuUSs", "currencyNamespace": "KoHw2hyd", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1981-09-23T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1991-09-05T00:00:00Z", "discountedPrice": 6, "expireAt": "1984-09-05T00:00:00Z", "price": 44, "purchaseAt": "1980-01-06T00:00:00Z", "trialPrice": 8}, {"currencyCode": "MVUGKSZ4", "currencyNamespace": "GcLkt4pK", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1998-10-12T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1983-05-04T00:00:00Z", "discountedPrice": 23, "expireAt": "1996-04-20T00:00:00Z", "price": 5, "purchaseAt": "1989-08-19T00:00:00Z", "trialPrice": 56}, {"currencyCode": "TpTdRtCH", "currencyNamespace": "vuk6B6XT", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1993-11-01T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1983-04-17T00:00:00Z", "discountedPrice": 43, "expireAt": "1979-03-17T00:00:00Z", "price": 38, "purchaseAt": "1974-03-09T00:00:00Z", "trialPrice": 3}], "gBVZxiKd": [{"currencyCode": "V57GvRyd", "currencyNamespace": "9UuL02Le", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1993-07-18T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1998-05-24T00:00:00Z", "discountedPrice": 72, "expireAt": "1977-06-03T00:00:00Z", "price": 37, "purchaseAt": "1983-08-31T00:00:00Z", "trialPrice": 72}, {"currencyCode": "d4M1F5qR", "currencyNamespace": "IblS7Nz8", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1976-07-31T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1992-02-06T00:00:00Z", "discountedPrice": 55, "expireAt": "1981-08-08T00:00:00Z", "price": 52, "purchaseAt": "1991-08-16T00:00:00Z", "trialPrice": 19}, {"currencyCode": "AWc9x1aM", "currencyNamespace": "jgGim51T", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1971-08-27T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1974-11-18T00:00:00Z", "discountedPrice": 90, "expireAt": "1997-04-18T00:00:00Z", "price": 39, "purchaseAt": "1997-12-21T00:00:00Z", "trialPrice": 8}]}, "seasonType": "TIER", "sku": "Is0xf4cz", "stackable": false, "status": "INACTIVE", "tags": ["CIW5ynMK", "UjOn5mM7", "k8nbLzvt"], "targetCurrencyCode": "quUicAeI", "targetNamespace": "VXtoWAXh", "thumbnailUrl": "MlW4tLqX", "useCount": 90}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'OICf5oD1' \
    --appId 'e6oI9FmY' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate '3wSkHKuf' \
    --baseAppId 'BdS3ZOok' \
    --categoryPath 'ZB4cXnAX' \
    --features 'yuGz6Llx' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --limit '43' \
    --offset '50' \
    --region '8SwyagYv' \
    --sortBy 'updatedAt:asc,updatedAt:desc,displayOrder' \
    --storeId 'ZkNnTn3r' \
    --tags 'zH5NvAtc' \
    --targetNamespace 'vNedgS1f' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'UfKmihDb,mu8ePWlQ,MVDXEHei' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'GTnwyEw6' \
    --sku 'hIWDZrpP' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '7rz3ISW5' \
    --populateBundle  \
    --region '10kHr4is' \
    --storeId 'TKWjmv67' \
    --sku 'nuHCXWfw' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nwGioVwV' \
    --sku 'zmmBVVFf' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'pqx1AeLt,zcPJ3jtD,YBo4FUTH' \
    --storeId '7CGfKSyx' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'gRR1DiCq' \
    --region 'SMzpqIFG' \
    --storeId 'LkDs7ACC' \
    --itemIds '1RgBfoNr' \
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
    --userId 'HlFi2qJL' \
    --body '{"itemIds": ["gmBLE35Y", "hyiDV90S", "eI5yppBH"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'COINS' \
    --limit '51' \
    --offset '100' \
    --sortBy 'tVznCgNy' \
    --storeId 'x9fbT63S' \
    --keyword 'hEh8PbGi' \
    --language 'kLjgjcj3' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '86' \
    --offset '41' \
    --sortBy 'displayOrder:desc,createdAt:desc,updatedAt' \
    --storeId 'lU6FYBZs' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'WFbr3RSP' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '0W9nBhvh' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'f8Q0DtJM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cYQdN66b' \
    --body '{"appId": "swAgt65X", "appType": "DLC", "baseAppId": "fI1IQcoB", "boothName": "QELcNlZk", "categoryPath": "qTZrKgXN", "clazz": "wvm4e5GX", "displayOrder": 72, "entitlementType": "DURABLE", "ext": {"742Oixht": {}, "AoKiVm6U": {}, "RT95XhnU": {}}, "features": ["cvWB28Mp", "usuhhDJ5", "slzgiWZE"], "images": [{"as": "tyd56Lfx", "caption": "nbY97jjY", "height": 13, "imageUrl": "fKFDXC7e", "smallImageUrl": "GL5YhJDW", "width": 14}, {"as": "aMAQuTKf", "caption": "C0I2kNjC", "height": 79, "imageUrl": "MLds2DbP", "smallImageUrl": "caoMdtRL", "width": 93}, {"as": "wIeShF9R", "caption": "Kb9vvxuJ", "height": 24, "imageUrl": "Mxr5hPCJ", "smallImageUrl": "JztJBg0t", "width": 93}], "itemIds": ["VwVnzaqS", "fJiQFC2g", "Xoda0kg1"], "itemQty": {"6yUSpSOA": 18, "RHclOdxI": 45, "wWkLob9g": 76}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"qs2nEZhp": {"description": "ByfHZinx", "localExt": {"NfgPAwkM": {}, "BsznlBUq": {}, "nLT4AbGp": {}}, "longDescription": "tKaWNvPb", "title": "pg7yrRvX"}, "fZ6rvgvE": {"description": "Y3Hht1Sw", "localExt": {"qTsKKKo3": {}, "7NHDOQe9": {}, "1Ps3ztUI": {}}, "longDescription": "V0dS6hIH", "title": "9c4Vfkyr"}, "wpuXxbaE": {"description": "RbfgPmi0", "localExt": {"eHkt1mr9": {}, "EOIFg0dn": {}, "WIYN2NVL": {}}, "longDescription": "70Iw157g", "title": "00jr9b8M"}}, "lootBoxConfig": {"rewardCount": 43, "rewards": [{"lootBoxItems": [{"count": 60, "itemId": "mmeKTmBN", "itemSku": "vGYxEQdf", "itemType": "3ewoGGoY"}, {"count": 19, "itemId": "xmFNAmjD", "itemSku": "DCvs78mc", "itemType": "MdiS76YA"}, {"count": 31, "itemId": "2o6ouRW9", "itemSku": "UtNquwC3", "itemType": "WgumrIz4"}], "name": "NhGztZpr", "odds": 0.9173439524275382, "type": "PROBABILITY_GROUP", "weight": 96}, {"lootBoxItems": [{"count": 46, "itemId": "qkCfgCUY", "itemSku": "Bn2xaOBd", "itemType": "PF0JmX8q"}, {"count": 47, "itemId": "b4gd3xOe", "itemSku": "ii8Jnmss", "itemType": "ep2xD2NY"}, {"count": 61, "itemId": "kABeGs9y", "itemSku": "xahld1pO", "itemType": "0Gyf5PO3"}], "name": "COyMvczg", "odds": 0.4955665810485902, "type": "PROBABILITY_GROUP", "weight": 33}, {"lootBoxItems": [{"count": 53, "itemId": "xLGeMvr9", "itemSku": "TsvcMQ7d", "itemType": "BsaIecRx"}, {"count": 71, "itemId": "Nn3SHiWx", "itemSku": "F0YbuU5a", "itemType": "r5qTLWUC"}, {"count": 50, "itemId": "Rrbk6C2c", "itemSku": "VWf6ttvb", "itemType": "U1PO6ApC"}], "name": "D2VXidT7", "odds": 0.35843929267251484, "type": "PROBABILITY_GROUP", "weight": 84}], "rollFunction": "DEFAULT"}, "maxCount": 5, "maxCountPerUser": 96, "name": "5N8WXBPp", "optionBoxConfig": {"boxItems": [{"count": 92, "itemId": "7PAewqSm", "itemSku": "5x3B4t7W", "itemType": "Qnp8jXZe"}, {"count": 7, "itemId": "lNapJRfk", "itemSku": "4f9Zcw1p", "itemType": "EHAyNFxc"}, {"count": 98, "itemId": "t8puMybY", "itemSku": "GxD9IPmm", "itemType": "sLmu3kaP"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 84, "fixedTrialCycles": 32, "graceDays": 52}, "regionData": {"ED5QZAuf": [{"currencyCode": "wNa8lzfj", "currencyNamespace": "v9oYMXMj", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1988-09-12T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1998-09-12T00:00:00Z", "discountedPrice": 55, "expireAt": "1995-09-30T00:00:00Z", "price": 66, "purchaseAt": "1982-09-13T00:00:00Z", "trialPrice": 98}, {"currencyCode": "3vGoav7M", "currencyNamespace": "K0PcLnEk", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1978-03-31T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1989-11-09T00:00:00Z", "discountedPrice": 46, "expireAt": "1992-01-16T00:00:00Z", "price": 17, "purchaseAt": "1993-04-06T00:00:00Z", "trialPrice": 81}, {"currencyCode": "baDT9OyJ", "currencyNamespace": "2h23GUS2", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1977-03-12T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1987-07-31T00:00:00Z", "discountedPrice": 38, "expireAt": "1971-07-25T00:00:00Z", "price": 26, "purchaseAt": "1987-05-14T00:00:00Z", "trialPrice": 24}], "vZI2Kwjq": [{"currencyCode": "PBiWXade", "currencyNamespace": "41s3rH34", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1985-09-24T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1978-12-05T00:00:00Z", "discountedPrice": 60, "expireAt": "1976-08-19T00:00:00Z", "price": 89, "purchaseAt": "1990-05-04T00:00:00Z", "trialPrice": 73}, {"currencyCode": "WjmHZAAv", "currencyNamespace": "KTH8MuqI", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1985-07-26T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1972-02-27T00:00:00Z", "discountedPrice": 74, "expireAt": "1981-07-05T00:00:00Z", "price": 87, "purchaseAt": "1981-10-22T00:00:00Z", "trialPrice": 47}, {"currencyCode": "CW7EEFB6", "currencyNamespace": "7AODbi9B", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1981-09-22T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1984-08-09T00:00:00Z", "discountedPrice": 39, "expireAt": "1980-09-17T00:00:00Z", "price": 12, "purchaseAt": "1978-07-28T00:00:00Z", "trialPrice": 18}], "c77GtRUc": [{"currencyCode": "CFeY5g4X", "currencyNamespace": "gBsbfzqx", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1992-02-06T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1974-02-11T00:00:00Z", "discountedPrice": 80, "expireAt": "1986-01-02T00:00:00Z", "price": 24, "purchaseAt": "1973-03-16T00:00:00Z", "trialPrice": 70}, {"currencyCode": "t9unQLYX", "currencyNamespace": "xm09wpGA", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1978-07-16T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1994-04-11T00:00:00Z", "discountedPrice": 20, "expireAt": "1986-12-12T00:00:00Z", "price": 13, "purchaseAt": "1982-03-28T00:00:00Z", "trialPrice": 77}, {"currencyCode": "ZEY8rG0q", "currencyNamespace": "0Q2Qd2Jz", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1981-03-25T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1987-06-30T00:00:00Z", "discountedPrice": 66, "expireAt": "1988-08-17T00:00:00Z", "price": 7, "purchaseAt": "1988-03-13T00:00:00Z", "trialPrice": 57}]}, "seasonType": "TIER", "sku": "nnZxF8Cm", "stackable": false, "status": "INACTIVE", "tags": ["7VW3mbDV", "JCJjfk2T", "Uvn95FhO"], "targetCurrencyCode": "MDu87t0l", "targetNamespace": "dWf7iSGI", "thumbnailUrl": "iKFtWtn4", "useCount": 36}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'ZENJ1QHZ' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'QxPRXH7u' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'xBJEECQE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 23, "orderNo": "iZgbwwm5"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'iGzXtckn' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'rgidKupv' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'XO6aj4hC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mTC34jxW' \
    --body '{"carousel": [{"alt": "4pIDwdqX", "previewUrl": "pmRmut9H", "thumbnailUrl": "9XyWI8bp", "type": "image", "url": "fQxRuX91", "videoSource": "vimeo"}, {"alt": "CBgVRyih", "previewUrl": "YNZ84CVh", "thumbnailUrl": "ziXV8HwS", "type": "image", "url": "2zccA8wv", "videoSource": "youtube"}, {"alt": "9yVRafCj", "previewUrl": "OuSYht83", "thumbnailUrl": "AdvBaagT", "type": "image", "url": "OrP9lzpi", "videoSource": "vimeo"}], "developer": "uFpZum7i", "forumUrl": "zxe7NPzj", "genres": ["Strategy", "Sports", "Action"], "localizations": {"SrN8jkIy": {"announcement": "kR2zbaI6", "slogan": "PD7fEscS"}, "hnGUGUtV": {"announcement": "9GJ279GD", "slogan": "bLNwjm3F"}, "K0nnX2po": {"announcement": "MfZ1hDHt", "slogan": "bh4HtMlF"}}, "platformRequirements": {"gvh2Dp2S": [{"additionals": "oiIPp1yv", "directXVersion": "fAHS0VgL", "diskSpace": "u11A3HTo", "graphics": "vFi4tPAG", "label": "fleyCA6j", "osVersion": "Etcqsnzo", "processor": "VILjkwW6", "ram": "1duF87aU", "soundCard": "yrdt4XSp"}, {"additionals": "WBAetsan", "directXVersion": "zqP8oxfr", "diskSpace": "tbECD1CY", "graphics": "PwaiBAxf", "label": "YL8Avt70", "osVersion": "ZUT2fSk3", "processor": "LL0calqx", "ram": "EewuGS46", "soundCard": "9k2hG0WK"}, {"additionals": "t4sUmanY", "directXVersion": "xM0UHZVN", "diskSpace": "YzGMNIpW", "graphics": "oSLkUrfu", "label": "f4U3WeYe", "osVersion": "A9t2ENKK", "processor": "WrFtHIi1", "ram": "CMgKAOG5", "soundCard": "iDcCR5Pb"}], "CvDLil8w": [{"additionals": "j9cKM3Ar", "directXVersion": "6MF35hCE", "diskSpace": "R4nGmWGg", "graphics": "TJfHlJl4", "label": "tHGa4XfZ", "osVersion": "cd9CVnGq", "processor": "MX9FieeE", "ram": "ssWEUl07", "soundCard": "bhwntCVq"}, {"additionals": "iYOJf5Kw", "directXVersion": "MZQjzvjS", "diskSpace": "ozv6CTRD", "graphics": "l0zp9CzH", "label": "FwinkBNi", "osVersion": "4gvqgl6T", "processor": "Z9TGVPmv", "ram": "34h6T7Es", "soundCard": "ufmfxKYB"}, {"additionals": "4LM6H6QX", "directXVersion": "mpZ9X3fU", "diskSpace": "SR1l9xLP", "graphics": "BsmAUrD9", "label": "L1IiD6Ml", "osVersion": "cEPhMDFz", "processor": "jHZ3sIhz", "ram": "Ox2CXKlv", "soundCard": "IomU3pIx"}], "M9n8D2eL": [{"additionals": "Me3lt9qf", "directXVersion": "x2UDcgVE", "diskSpace": "7L9FK6e0", "graphics": "MrPc4vtx", "label": "k9hVKlG5", "osVersion": "6HlzGr7X", "processor": "jdyRJunZ", "ram": "Pkp6ccIB", "soundCard": "nWyPw8mj"}, {"additionals": "7gyQ7XdI", "directXVersion": "szGRj46C", "diskSpace": "OPipH1MW", "graphics": "VTHG0qHJ", "label": "CWEfOJpZ", "osVersion": "m9yEYWNG", "processor": "My2pgSGS", "ram": "UOK68eqG", "soundCard": "JtWf1Ybg"}, {"additionals": "g8rdwY9b", "directXVersion": "mrvHmO07", "diskSpace": "KNqX9LM2", "graphics": "IwEsdOGB", "label": "XBwnzDX8", "osVersion": "v3xgC1Ge", "processor": "9PdbTTAJ", "ram": "2Gp1r0sV", "soundCard": "Z6LJAOdd"}]}, "platforms": ["Windows", "Windows", "Linux"], "players": ["CrossPlatformMulti", "Coop", "Coop"], "primaryGenre": "Strategy", "publisher": "mDdUIoiI", "releaseDate": "1989-02-14T00:00:00Z", "websiteUrl": "FNxuNOmU"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'SWw18T1I' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xVWCxdvP' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'L9e4P01v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'xP8xj1Ly' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EirURERn' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'EMzpImW6' \
    --itemId 'sjAHyCK5' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tNanGBrk' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'zUvck3xT' \
    --itemId 'tmOFMebS' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4AdlNzwo' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'g2IhErkN' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'hNcECWwc' \
    --populateBundle  \
    --region 'hW6zL9Sk' \
    --storeId 'bLlrNXnG' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'anMazb8j' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vRWenURH' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 89, "comparison": "excludes", "name": "lfnBAk0C", "predicateType": "SeasonPassPredicate", "value": "cE15u6D3", "values": ["1DjOsrs3", "QGbqiqOk", "CUYATdqn"]}, {"anyOf": 82, "comparison": "isLessThan", "name": "eATj7eGj", "predicateType": "EntitlementPredicate", "value": "jzyBB4UF", "values": ["em2yqPsM", "KiaoV0VO", "FxKybPkb"]}, {"anyOf": 41, "comparison": "isGreaterThanOrEqual", "name": "S6x9cLJ1", "predicateType": "SeasonPassPredicate", "value": "5jGcMICP", "values": ["IMgzISom", "UYnfG6jl", "9U4jRete"]}]}, {"operator": "or", "predicates": [{"anyOf": 84, "comparison": "isGreaterThanOrEqual", "name": "KiAVQXXO", "predicateType": "EntitlementPredicate", "value": "1q2OspCZ", "values": ["0uGcL1ko", "bt3Uta5I", "yHjCH5ol"]}, {"anyOf": 54, "comparison": "isNot", "name": "5vHLjBJ9", "predicateType": "EntitlementPredicate", "value": "2EGvJ4UM", "values": ["nDByhnol", "uO6ti0QP", "S93yOxNI"]}, {"anyOf": 53, "comparison": "isGreaterThanOrEqual", "name": "nOkDiJq4", "predicateType": "SeasonPassPredicate", "value": "j84O6tgo", "values": ["PpucddXJ", "hjtC7bzj", "5zifF8y9"]}]}, {"operator": "or", "predicates": [{"anyOf": 1, "comparison": "isNot", "name": "nrNSleyw", "predicateType": "SeasonTierPredicate", "value": "xyQrUpIF", "values": ["kcR6c2E2", "vORxTi79", "DpSjb39u"]}, {"anyOf": 36, "comparison": "isGreaterThan", "name": "3vk3IfAK", "predicateType": "SeasonPassPredicate", "value": "zUo4hNBD", "values": ["h9ZFP1OW", "S4VsRoYI", "0nXOErQP"]}, {"anyOf": 75, "comparison": "isLessThan", "name": "69yg9ADC", "predicateType": "SeasonTierPredicate", "value": "OqKVOTni", "values": ["Q0JWZjNR", "BgLsNhdg", "SzOTqcVN"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'X3ahvxw9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "gwwhTnjN"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --name 'wKZGW4y3' \
    --offset '11' \
    --tag 'd00YBWCa' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "VVmM45mf", "name": "IZsWhkS4", "status": "ACTIVE", "tags": ["ch4IjDq9", "aT3qZyI0", "rYsWucAk"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'XsVJbXi7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'eRZa7WwI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "c895ImqK", "name": "6tVsaUq3", "status": "INACTIVE", "tags": ["pH16NUsV", "Y21NVIs7", "NRen2Y3N"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 's0QJQeaW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'ytPfds1B' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '48' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'Gqku59eF' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'JrOXyDYz' \
    --limit '13' \
    --offset '44' \
    --orderNos 'JUbUJRMb,kcTglbU8,6FyOjApN' \
    --sortBy 'HBVfNOUR' \
    --startTime 'cjY3YYT9' \
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
    --orderNo '2L13Orny' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'x34luLdv' \
    --body '{"description": "tsTKXMji"}' \
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
    --body '{"dryRun": true, "notifyUrl": "8KDgy0xZ", "privateKey": "fAcNg14W"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 's8TIP1LK' \
    --externalId 'iFQoLDvu' \
    --limit '26' \
    --notificationSource 'ALIPAY' \
    --notificationType 'O4iKhDcJ' \
    --offset '16' \
    --paymentOrderNo 'TCcNIsQ3' \
    --startDate 'PuppUxDS' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'MudcxlCV' \
    --limit '7' \
    --offset '5' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "NbJGQ57l", "currencyNamespace": "PdinpjS2", "customParameters": {"DRfGt9Gl": {}, "yZVQ4X67": {}, "tPZSTpPq": {}}, "description": "3xjrElvv", "extOrderNo": "Dgw0ag7k", "extUserId": "SWE0Hiqm", "itemType": "OPTIONBOX", "language": "pVEm-jITf-373", "metadata": {"jU1G0EVj": "VZw1ToLu", "PakQN1Mp": "Os1RVFrc", "g2CXxepx": "78fvsyhE"}, "notifyUrl": "2BKtyTDS", "omitNotification": true, "platform": "mkmvZ7Cm", "price": 38, "recurringPaymentOrderNo": "LNNz6QIV", "region": "C9Mfuc8V", "returnUrl": "OsnmnlVl", "sandbox": false, "sku": "CCVuFjS1", "subscriptionId": "GC1d2b92", "targetNamespace": "B4vEgj3H", "targetUserId": "OmhcWm42", "title": "8XejRF94"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'NIY9nMrB' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Zo0lNUBD' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ShHD32vv' \
    --body '{"extTxId": "L28FPwTi", "paymentMethod": "XfLcxDC9", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nd02mECI' \
    --body '{"description": "QhfIhHtA"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DUQ9zimQ' \
    --body '{"amount": 93, "currencyCode": "f7BULnZD", "notifyType": "CHARGE", "paymentProvider": "WXPAY", "salesTax": 42, "vat": 73}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tDM6Bqgu' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["System", "Steam", "GooglePlay"]}' \
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
    --body '{"entitlement": {"durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
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
    --endTime 'tnTKUe2z' \
    --limit '27' \
    --offset '88' \
    --source 'ORDER' \
    --startTime 't6PqlkL0' \
    --status 'FAIL' \
    --transactionId 'o2SwCUsT' \
    --userId 'ag4MLAo3' \
    > test.out 2>&1
eval_tap $? 139 'QueryRevocationHistories' test.out

#- 140 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "m61P2xaN", "eventTopic": "fmn8Onb1", "maxAwarded": 1, "maxAwardedPerUser": 30, "namespaceExpression": "9gMz0F2U", "rewardCode": "BRmMhAbU", "rewardConditions": [{"condition": "WmFhdYLW", "conditionName": "zMuv3zkU", "eventName": "Y0n0BAZk", "rewardItems": [{"duration": 47, "itemId": "IFbRkPSS", "quantity": 71}, {"duration": 55, "itemId": "Tz4TjCrJ", "quantity": 69}, {"duration": 67, "itemId": "xKNdOTac", "quantity": 57}]}, {"condition": "zhxHmnrr", "conditionName": "V9ZGWrZ0", "eventName": "5sxe6A6R", "rewardItems": [{"duration": 32, "itemId": "PhPUTKbo", "quantity": 28}, {"duration": 23, "itemId": "oucNmzwO", "quantity": 0}, {"duration": 83, "itemId": "yLLiizac", "quantity": 67}]}, {"condition": "rZ8iMlOu", "conditionName": "ksQJCiRF", "eventName": "iZWwJ7Nr", "rewardItems": [{"duration": 93, "itemId": "LTo5ijlv", "quantity": 61}, {"duration": 53, "itemId": "F8qBWCQ9", "quantity": 7}, {"duration": 55, "itemId": "LWYyS8zd", "quantity": 14}]}], "userIdExpression": "GM5anIlo"}' \
    > test.out 2>&1
eval_tap $? 140 'CreateReward' test.out

#- 141 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'yj9lhbvu' \
    --limit '86' \
    --offset '18' \
    --sortBy 'rewardCode:desc,namespace:asc,namespace' \
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
    --rewardId 'jwKUckc7' \
    > test.out 2>&1
eval_tap $? 144 'GetReward' test.out

#- 145 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '94ryY91l' \
    --body '{"description": "X8DD4MYX", "eventTopic": "lrJ81lHv", "maxAwarded": 43, "maxAwardedPerUser": 9, "namespaceExpression": "9rqvEoM8", "rewardCode": "YmVjAkO3", "rewardConditions": [{"condition": "HKsEp6Kl", "conditionName": "qwW4djre", "eventName": "xcbHdEto", "rewardItems": [{"duration": 87, "itemId": "R7xxSVp3", "quantity": 66}, {"duration": 41, "itemId": "d2TK0HzY", "quantity": 44}, {"duration": 8, "itemId": "iTgYmx82", "quantity": 72}]}, {"condition": "qBBfi7sS", "conditionName": "F5BoGiTC", "eventName": "VsXsygWb", "rewardItems": [{"duration": 19, "itemId": "vdl8jHz9", "quantity": 48}, {"duration": 73, "itemId": "7XZIjU4I", "quantity": 76}, {"duration": 33, "itemId": "9lOLaZaM", "quantity": 31}]}, {"condition": "BGTtZyTj", "conditionName": "dKNKgYaz", "eventName": "ujsmSmyl", "rewardItems": [{"duration": 92, "itemId": "uhoJM3WW", "quantity": 85}, {"duration": 1, "itemId": "vvCiCf33", "quantity": 99}, {"duration": 18, "itemId": "7KORRhxS", "quantity": 99}]}], "userIdExpression": "UWNizk5U"}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateReward' test.out

#- 146 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'cPAGv6c1' \
    > test.out 2>&1
eval_tap $? 146 'DeleteReward' test.out

#- 147 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ESC6hZYT' \
    --body '{"payload": {"YZbzf5aA": {}, "NNNs5kgS": {}, "ZZNUHbIT": {}}}' \
    > test.out 2>&1
eval_tap $? 147 'CheckEventCondition' test.out

#- 148 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '9szApmWJ' \
    --body '{"conditionName": "O5vzzXZj", "userId": "08a6K1XR"}' \
    > test.out 2>&1
eval_tap $? 148 'DeleteRewardConditionRecord' test.out

#- 149 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'VfriSpPF' \
    --limit '28' \
    --offset '73' \
    --start 'ZBJZkDnE' \
    --storeId 'iyfa2Lrn' \
    --viewId 'pZxNnLRH' \
    > test.out 2>&1
eval_tap $? 149 'QuerySections' test.out

#- 150 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '36bqS2oF' \
    --body '{"active": false, "displayOrder": 77, "endDate": "1992-01-07T00:00:00Z", "ext": {"1AziBOHE": {}, "Aj1cT3u6": {}, "Zc2FbrTF": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 27, "itemCount": 94, "rule": "SEQUENCE"}, "items": [{"id": "gDIwZIRW", "sku": "f6T3by2k"}, {"id": "YSCdnFKL", "sku": "c0xcTjqj"}, {"id": "dcEfU61O", "sku": "JYMnW49r"}], "localizations": {"Wynp1ck1": {"description": "vT90C6o8", "localExt": {"6cSRL9cg": {}, "bUmulhe9": {}, "8oaFKlQi": {}}, "longDescription": "cdrxVhrt", "title": "wSd9QWVM"}, "Yz7TU1Ts": {"description": "xsChSclS", "localExt": {"kb5aBi9K": {}, "9zyv6gFZ": {}, "XI5nXJ7h": {}}, "longDescription": "Li6Hwewe", "title": "Rmyo91dI"}, "n7QqXBDX": {"description": "JcrqKmXD", "localExt": {"woEV6tCd": {}, "rxw1KOPh": {}, "uvHuYrGW": {}}, "longDescription": "DK41uMOC", "title": "0mRvSoaG"}}, "name": "k4ktF5wn", "rotationType": "NONE", "startDate": "1986-02-22T00:00:00Z", "viewId": "2oWJlfgl"}' \
    > test.out 2>&1
eval_tap $? 150 'CreateSection' test.out

#- 151 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LM4xjfkN' \
    > test.out 2>&1
eval_tap $? 151 'PurgeExpiredSection' test.out

#- 152 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'L4lU6jaG' \
    --storeId 'fsD1cfsw' \
    > test.out 2>&1
eval_tap $? 152 'GetSection' test.out

#- 153 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'meFpvtDt' \
    --storeId 'etoQVFL8' \
    --body '{"active": true, "displayOrder": 49, "endDate": "1980-05-04T00:00:00Z", "ext": {"FZ0LpupE": {}, "i5DbkVs3": {}, "qFTi1t53": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 99, "itemCount": 18, "rule": "SEQUENCE"}, "items": [{"id": "ZQAJza84", "sku": "lKKmVOaT"}, {"id": "S6xBbNrS", "sku": "UAW2ak7I"}, {"id": "SDrBVg6N", "sku": "uDZvPb1k"}], "localizations": {"uUfNfUDe": {"description": "4g7q6PHE", "localExt": {"aqbzHvDD": {}, "l1jiLw3X": {}, "MGBA6JXD": {}}, "longDescription": "pA1tIC45", "title": "C0oaGouF"}, "u4hXONgU": {"description": "wJnUpryD", "localExt": {"eRcpUvlr": {}, "w2MwC1uu": {}, "okpaIjL0": {}}, "longDescription": "Vxe5n9Lx", "title": "3QcFo9gx"}, "OgvDc7xM": {"description": "rRKvw8IS", "localExt": {"P2WKmCRR": {}, "XBxlalCH": {}, "tWlKxLpS": {}}, "longDescription": "8fLWoQ5n", "title": "uJhatQPx"}}, "name": "R7dvBVC5", "rotationType": "FIXED_PERIOD", "startDate": "1988-02-22T00:00:00Z", "viewId": "nMOn8nc3"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateSection' test.out

#- 154 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'gUZ8ZFyy' \
    --storeId 'Er0KBXuJ' \
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
    --body '{"defaultLanguage": "BqK4QtEy", "defaultRegion": "dPWLPBYi", "description": "R3UbJc1Z", "supportedLanguages": ["Yapx7C47", "7etqgfOJ", "DUT0uKAP"], "supportedRegions": ["rARya2IM", "lNiXpF4q", "vsUUpHqi"], "title": "33TcBGkc"}' \
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
    --storeId '0HjUcnkp' \
    > test.out 2>&1
eval_tap $? 162 'GetStore' test.out

#- 163 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U9oVzl2k' \
    --body '{"defaultLanguage": "BuLFXIeC", "defaultRegion": "EKZUTz3G", "description": "vCAZ5j24", "supportedLanguages": ["acYHbrry", "HB6GO9zP", "3FaepA3b"], "supportedRegions": ["3YJ9nJM6", "vtT27xv8", "5K5MU2qm"], "title": "beqaVemI"}' \
    > test.out 2>&1
eval_tap $? 163 'UpdateStore' test.out

#- 164 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NdClpF7O' \
    > test.out 2>&1
eval_tap $? 164 'DeleteStore' test.out

#- 165 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vlBIEgjs' \
    --action 'CREATE' \
    --itemSku 'UnEEgja2' \
    --itemType 'COINS' \
    --limit '72' \
    --offset '61' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt:asc,updatedAt' \
    --status 'UNPUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'HleLoog4' \
    --updatedAtStart 'me2NBFp6' \
    > test.out 2>&1
eval_tap $? 165 'QueryChanges' test.out

#- 166 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '2xlXvVcJ' \
    > test.out 2>&1
eval_tap $? 166 'PublishAll' test.out

#- 167 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'erTPW02P' \
    > test.out 2>&1
eval_tap $? 167 'PublishSelected' test.out

#- 168 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WsHiKYAr' \
    > test.out 2>&1
eval_tap $? 168 'SelectAllRecords' test.out

#- 169 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AxnKBfBf' \
    --action 'DELETE' \
    --itemSku 'F5hCcouk' \
    --itemType 'COINS' \
    --type 'STORE' \
    --updatedAtEnd 'nbz4ys7j' \
    --updatedAtStart '6lxuU3u2' \
    > test.out 2>&1
eval_tap $? 169 'GetStatistic' test.out

#- 170 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HEG0qfKe' \
    > test.out 2>&1
eval_tap $? 170 'UnselectAllRecords' test.out

#- 171 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'gvFTD1sP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ykS8YLmw' \
    > test.out 2>&1
eval_tap $? 171 'SelectRecord' test.out

#- 172 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'tYgWGcA0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h4G1LZ1H' \
    > test.out 2>&1
eval_tap $? 172 'UnselectRecord' test.out

#- 173 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aX5UBMbs' \
    --targetStoreId 'F44VTsLD' \
    > test.out 2>&1
eval_tap $? 173 'CloneStore' test.out

#- 174 ExportStore
eval_tap 0 174 'ExportStore # SKIP deprecated' test.out

#- 175 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'CnYX2YBF' \
    --limit '74' \
    --offset '14' \
    --sku '3ggFDh2k' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId 'P7pnnVfx' \
    > test.out 2>&1
eval_tap $? 175 'QuerySubscriptions' test.out

#- 176 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Pwc259HF' \
    > test.out 2>&1
eval_tap $? 176 'RecurringChargeSubscription' test.out

#- 177 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '9ejHaILQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'GetTicketDynamic' test.out

#- 178 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'ruAuYyJL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "YGqMv824"}' \
    > test.out 2>&1
eval_tap $? 178 'DecreaseTicketSale' test.out

#- 179 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'ouSgkpK7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'GetTicketBoothID' test.out

#- 180 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '0uJmUL0u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 53, "orderNo": "EogFVGR7"}' \
    > test.out 2>&1
eval_tap $? 180 'IncreaseTicketSale' test.out

#- 181 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '1rJOBy6l' \
    --body '{"achievements": [{"id": "sj1AKGBj", "value": 27}, {"id": "tztx3VAl", "value": 41}, {"id": "7DYAWWcb", "value": 5}], "steamUserId": "UOIzVcy9"}' \
    > test.out 2>&1
eval_tap $? 181 'UnlockSteamUserAchievement' test.out

#- 182 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'k3ie64Vn' \
    --xboxUserId 'wa0ClGQJ' \
    > test.out 2>&1
eval_tap $? 182 'GetXblUserAchievements' test.out

#- 183 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ultJe32A' \
    --body '{"achievements": [{"id": "iwKadEoI", "value": 97}, {"id": "iMEtgKui", "value": 67}, {"id": "YD92CX0r", "value": 70}], "serviceConfigId": "ldL6rOVG", "titleId": "cRAn51rV", "xboxUserId": "AQSxp4qT"}' \
    > test.out 2>&1
eval_tap $? 183 'UpdateXblUserAchievement' test.out

#- 184 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'B54mKA3V' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeCampaign' test.out

#- 185 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '9DKlCeZ7' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeEntitlement' test.out

#- 186 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'mLYsHooO' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeFulfillment' test.out

#- 187 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'IaxIpb1c' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeIntegration' test.out

#- 188 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'IOJPS3lJ' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizeOrder' test.out

#- 189 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '80YJ41U4' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizePayment' test.out

#- 190 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'ooQ980yw' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeRevocation' test.out

#- 191 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'mg1pWpWi' \
    > test.out 2>&1
eval_tap $? 191 'AnonymizeSubscription' test.out

#- 192 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 't1QC7FKe' \
    > test.out 2>&1
eval_tap $? 192 'AnonymizeWallet' test.out

#- 193 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '0fnHUlmU' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 193 'GetUserDLC' test.out

#- 194 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZJJzWZwv' \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'Wy47bbwM' \
    --features 'I4gGmvK9,gW596FwB,NrFXt3TA' \
    --itemId 'uKBwBcD1,2ae6r3hH,wya4NpdO' \
    --limit '53' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 194 'QueryUserEntitlements' test.out

#- 195 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'g3hr6ucH' \
    --body '[{"endDate": "1973-11-27T00:00:00Z", "grantedCode": "7dbh2iKN", "itemId": "Ul0qJqzo", "itemNamespace": "KMRMG541", "language": "tbjJ_SYlt", "quantity": 94, "region": "KNXLMUaD", "source": "GIFT", "startDate": "1982-11-13T00:00:00Z", "storeId": "wQlnNRZJ"}, {"endDate": "1988-08-08T00:00:00Z", "grantedCode": "JtgqzZv5", "itemId": "kVu4S95m", "itemNamespace": "j8YRvae4", "language": "oM_FB", "quantity": 5, "region": "WEm8bVtZ", "source": "ACHIEVEMENT", "startDate": "1990-02-10T00:00:00Z", "storeId": "34oA1keY"}, {"endDate": "1996-10-13T00:00:00Z", "grantedCode": "QKUAFTVY", "itemId": "elIlGJg9", "itemNamespace": "wdc8bihh", "language": "SF-FqCW-317", "quantity": 23, "region": "JlmD1iEo", "source": "IAP", "startDate": "1988-01-13T00:00:00Z", "storeId": "Jz1eI7Q5"}]' \
    > test.out 2>&1
eval_tap $? 195 'GrantUserEntitlement' test.out

#- 196 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pu9PutLf' \
    --activeOnly  \
    --appId '6IrvZoBG' \
    > test.out 2>&1
eval_tap $? 196 'GetUserAppEntitlementByAppId' test.out

#- 197 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'QbO4S3rU' \
    --activeOnly  \
    --limit '90' \
    --offset '72' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 197 'QueryUserEntitlementsByAppType' test.out

#- 198 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UzPAE6Sd' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'fkqYJoF2' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementByItemId' test.out

#- 199 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'FI3vyyqR' \
    --ids 'zc20O7Fd,sJP1G9ty,BTfERXdv' \
    > test.out 2>&1
eval_tap $? 199 'GetUserActiveEntitlementsByItemIds' test.out

#- 200 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gD1Qf7Ot' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'idXjuGgx' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementBySku' test.out

#- 201 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '8ncXejme' \
    --appIds 'ZtzT0qj0,ltsqfiZr,thVvyX0O' \
    --itemIds 'CKDJE3RM,UddwSSgx,Cu8zru1D' \
    --skus 'hGAYOHR5,BWa9VzIk,aQEl1iUP' \
    > test.out 2>&1
eval_tap $? 201 'ExistsAnyUserActiveEntitlement' test.out

#- 202 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'roNB6hI6' \
    --itemIds 'IpGcToWg,FvdRhG9N,wV3zDuqV' \
    > test.out 2>&1
eval_tap $? 202 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 203 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lVTypcYP' \
    --appId 'K8IxrSZu' \
    > test.out 2>&1
eval_tap $? 203 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 204 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xWl0Je4f' \
    --entitlementClazz 'MEDIA' \
    --itemId 'NQLzwRoW' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipByItemId' test.out

#- 205 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nR0AbkCP' \
    --ids 'Y70Fmvvi,VIBbcujF,8Vk5qb8N' \
    > test.out 2>&1
eval_tap $? 205 'GetUserEntitlementOwnershipByItemIds' test.out

#- 206 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'hWWwaxyM' \
    --entitlementClazz 'APP' \
    --sku 'LCgOOPXM' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlementOwnershipBySku' test.out

#- 207 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '6XTUh2dJ' \
    --entitlementIds '90yqHDNa' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserEntitlements' test.out

#- 208 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'cl4F9G6D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l5TFwBY6' \
    > test.out 2>&1
eval_tap $? 208 'GetUserEntitlement' test.out

#- 209 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'HKXAblkT' \
    --namespace "$AB_NAMESPACE" \
    --userId '8VGgSH8M' \
    --body '{"endDate": "1988-04-10T00:00:00Z", "nullFieldList": ["ZGwiVj7e", "DTaka9AB", "fX1IByPE"], "startDate": "1991-03-20T00:00:00Z", "status": "INACTIVE", "useCount": 27}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateUserEntitlement' test.out

#- 210 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'PhGspRi3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bhPQvBBJ' \
    --body '{"options": ["I5Jxytpc", "ubN4AUUP", "FPscZsXe"], "requestId": "JOD4DMtq", "useCount": 10}' \
    > test.out 2>&1
eval_tap $? 210 'ConsumeUserEntitlement' test.out

#- 211 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'XE52sUBB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q2SimQQo' \
    > test.out 2>&1
eval_tap $? 211 'DisableUserEntitlement' test.out

#- 212 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'Lbe5YOJv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xGRxUzrT' \
    > test.out 2>&1
eval_tap $? 212 'EnableUserEntitlement' test.out

#- 213 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'wagH7BMT' \
    --namespace "$AB_NAMESPACE" \
    --userId '1IZKTdNF' \
    > test.out 2>&1
eval_tap $? 213 'GetUserEntitlementHistories' test.out

#- 214 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'VBQ1crBX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AupATO8u' \
    > test.out 2>&1
eval_tap $? 214 'RevokeUserEntitlement' test.out

#- 215 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XsqVpdiW' \
    --body '{"duration": 29, "endDate": "1979-06-01T00:00:00Z", "itemId": "SjDAM0Ri", "itemSku": "w8wLYW3n", "language": "4F3LD1ED", "order": {"currency": {"currencyCode": "wBXw5uBY", "currencySymbol": "eQZOzATN", "currencyType": "REAL", "decimals": 97, "namespace": "Vac1cQvS"}, "ext": {"xgTNIUzx": {}, "DgBlIbuz": {}, "m7DzJ20N": {}}, "free": false}, "orderNo": "RJIhFXR2", "origin": "Epic", "quantity": 1, "region": "YprPmbpu", "source": "OTHER", "startDate": "1978-06-12T00:00:00Z", "storeId": "co2jx8Up"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillItem' test.out

#- 216 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8SjMvpq' \
    --body '{"code": "M8puggOE", "language": "hI-FeyI-NN", "region": "y4ij4ysY"}' \
    > test.out 2>&1
eval_tap $? 216 'RedeemCode' test.out

#- 217 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ponb59gQ' \
    --body '{"origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "fRcngEpT", "namespace": "nRUQr3RL"}, "item": {"itemId": "OM1vEx4g", "itemSku": "qDY6jwyK", "itemType": "RxhkLe5z"}, "quantity": 30, "type": "ITEM"}, {"currency": {"currencyCode": "hg9s9utR", "namespace": "Qt28b6o3"}, "item": {"itemId": "K0COF74t", "itemSku": "z6aeXZOY", "itemType": "wbwjMNdx"}, "quantity": 74, "type": "CURRENCY"}, {"currency": {"currencyCode": "lBfnRyFS", "namespace": "0Ed7gTM5"}, "item": {"itemId": "AVrtBQiD", "itemSku": "TcNnZa6Z", "itemType": "uxk6u6HX"}, "quantity": 95, "type": "CURRENCY"}], "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 217 'FulfillRewards' test.out

#- 218 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'PWDXTSb5' \
    --endTime '5g8LSTs7' \
    --limit '82' \
    --offset '31' \
    --productId 'f95lGlPr' \
    --startTime 'f6obIdnI' \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPOrders' test.out

#- 219 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMFtsnFf' \
    > test.out 2>&1
eval_tap $? 219 'QueryAllUserIAPOrders' test.out

#- 220 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'z8Ew0X8f' \
    --endTime 'BuBSKLSQ' \
    --limit '92' \
    --offset '66' \
    --startTime 'VPvRLiDi' \
    --status 'PENDING' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserIAPConsumeHistory' test.out

#- 221 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'pBfBovqL' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "ycu-frpE", "productId": "j17xGhaB", "region": "KoUfiHjG", "type": "PLAYSTATION"}' \
    > test.out 2>&1
eval_tap $? 221 'MockFulfillIAPItem' test.out

#- 222 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRf2VJet' \
    --itemId 'Wsokvx3B' \
    --limit '68' \
    --offset '13' \
    --status 'FULFILLED' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserOrders' test.out

#- 223 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2cSuzts' \
    --body '{"currencyCode": "J5tj64gV", "currencyNamespace": "7nmDk29m", "discountedPrice": 5, "ext": {"ssSA8nP5": {}, "PQjpzk2T": {}, "b7iYdmNZ": {}}, "itemId": "WosrsVBP", "language": "Z64j0HUO", "options": {"skipPriceValidation": true}, "platform": "Other", "price": 23, "quantity": 4, "region": "xcCKAru8", "returnUrl": "pOaAVLDB", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateUserOrder' test.out

#- 224 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'T83zEGXm' \
    --itemId 'VBZLyrH9' \
    > test.out 2>&1
eval_tap $? 224 'CountOfPurchasedItem' test.out

#- 225 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'J7Boysma' \
    --userId 'ORLkP5hc' \
    > test.out 2>&1
eval_tap $? 225 'GetUserOrder' test.out

#- 226 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2Fh04JTs' \
    --userId 'qDTynCew' \
    --body '{"status": "DELETED", "statusReason": "yazqXRqe"}' \
    > test.out 2>&1
eval_tap $? 226 'UpdateUserOrderStatus' test.out

#- 227 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gIUicYXX' \
    --userId 'zxsBFrUs' \
    > test.out 2>&1
eval_tap $? 227 'FulfillUserOrder' test.out

#- 228 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9BYp6TgC' \
    --userId 'ejBd5o7i' \
    > test.out 2>&1
eval_tap $? 228 'GetUserOrderGrant' test.out

#- 229 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TST7R3Kb' \
    --userId 'bQGERMNp' \
    > test.out 2>&1
eval_tap $? 229 'GetUserOrderHistories' test.out

#- 230 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qWb51y5R' \
    --userId 'UzvMfTkP' \
    --body '{"additionalData": {"cardSummary": "y0fGvTGg"}, "authorisedTime": "1973-07-08T00:00:00Z", "chargebackReversedTime": "1990-10-29T00:00:00Z", "chargebackTime": "1995-05-29T00:00:00Z", "chargedTime": "1993-02-17T00:00:00Z", "createdTime": "1989-01-12T00:00:00Z", "currency": {"currencyCode": "UKk5ozrX", "currencySymbol": "A4HZHNyq", "currencyType": "REAL", "decimals": 73, "namespace": "danhR1Zr"}, "customParameters": {"m3thUvV8": {}, "7yfkycLS": {}, "VdleSaAy": {}}, "extOrderNo": "lsmLYe2p", "extTxId": "hYOgT5kD", "extUserId": "TyPl3dKF", "issuedAt": "1989-11-19T00:00:00Z", "metadata": {"wkENQ8VO": "HGwbADMf", "uOmh0lci": "RhVZ2Deo", "ODXMzLSr": "zoiBnYi5"}, "namespace": "UWs3tYlY", "nonceStr": "eMoCimJy", "paymentMethod": "SocRvUWD", "paymentMethodFee": 83, "paymentOrderNo": "5cPnmGjT", "paymentProvider": "WALLET", "paymentProviderFee": 54, "paymentStationUrl": "a5Pqx1K7", "price": 33, "refundedTime": "1975-01-25T00:00:00Z", "salesTax": 54, "sandbox": false, "sku": "oijBPAp6", "status": "INIT", "statusReason": "fqjNjLOt", "subscriptionId": "NQts2yxf", "subtotalPrice": 19, "targetNamespace": "MLZJ2jZf", "targetUserId": "ZbpTJezz", "tax": 36, "totalPrice": 5, "totalTax": 16, "txEndTime": "1998-08-22T00:00:00Z", "type": "WFgKjE94", "userId": "5x2CPVYY", "vat": 67}' \
    > test.out 2>&1
eval_tap $? 230 'ProcessUserOrderNotification' test.out

#- 231 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'c84OMIzv' \
    --userId 'TScdbKBs' \
    > test.out 2>&1
eval_tap $? 231 'DownloadUserOrderReceipt' test.out

#- 232 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'AyJMz4IL' \
    --body '{"currencyCode": "NDvhB4Eo", "currencyNamespace": "es9a6XaJ", "customParameters": {"eRbzTPwD": {}, "3jxF7vxR": {}, "UY0ilrNo": {}}, "description": "FT98SgtJ", "extOrderNo": "d4Z5f8nf", "extUserId": "aKqdZFLb", "itemType": "OPTIONBOX", "language": "jip-eFYz", "metadata": {"bsSgR43k": "IDzxBwqR", "JTzrHNZW": "Usq5lQo2", "jy29EJig": "qYhyVhUR"}, "notifyUrl": "x1yPeczR", "omitNotification": true, "platform": "zQuoZcXQ", "price": 31, "recurringPaymentOrderNo": "lx2JG2KN", "region": "GfhzfCTx", "returnUrl": "xrsRRLee", "sandbox": true, "sku": "cJ7DQIi4", "subscriptionId": "5aCDHN9m", "title": "Vug2zkVf"}' \
    > test.out 2>&1
eval_tap $? 232 'CreateUserPaymentOrder' test.out

#- 233 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6KgpKOcn' \
    --userId '3tMD9UT6' \
    --body '{"description": "7bOwugFD"}' \
    > test.out 2>&1
eval_tap $? 233 'RefundUserPaymentOrder' test.out

#- 234 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'a6wUQveh' \
    --body '{"code": "KqwCh86X", "orderNo": "mRkCEcfH"}' \
    > test.out 2>&1
eval_tap $? 234 'ApplyUserRedemption' test.out

#- 235 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'DCdl59Wp' \
    --body '{"meta": {"9A3tXGve": {}, "6DdK6uvg": {}, "8f2cIoBy": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "IOS", "currencyCode": "Bw3xLUcC", "namespace": "Et0DzmkJ"}, "entitlement": {"entitlementId": "q1sml5bY"}, "item": {"itemIdentity": "t76BNsi4", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 18, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "9434WpKK", "namespace": "dzxoufCN"}, "entitlement": {"entitlementId": "lFoOcWQQ"}, "item": {"itemIdentity": "y4bjmQeE", "itemIdentityType": "ITEM_SKU", "origin": "GooglePlay"}, "quantity": 4, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "System", "currencyCode": "t5UGkInF", "namespace": "GpuUsdtq"}, "entitlement": {"entitlementId": "4dOwNESz"}, "item": {"itemIdentity": "CEW9dUVh", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 34, "type": "ITEM"}], "source": "DLC", "transactionId": "ftC3sCS8"}' \
    > test.out 2>&1
eval_tap $? 235 'DoRevocation' test.out

#- 236 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'CpLCqPD9' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'NOBWydXV' \
    --limit '64' \
    --offset '74' \
    --sku 'i02aFr8C' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 236 'QueryUserSubscriptions' test.out

#- 237 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8Rr45UL' \
    --excludeSystem  \
    --limit '34' \
    --offset '36' \
    --subscriptionId 'QgvwD3Ps' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscriptionActivities' test.out

#- 238 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDJiWxQB' \
    --body '{"grantDays": 46, "itemId": "Ntz7EFvo", "language": "wPgIGuet", "reason": "xFMqXCQM", "region": "AqQ2ZRGz", "source": "NtrThFa9"}' \
    > test.out 2>&1
eval_tap $? 238 'PlatformSubscribeSubscription' test.out

#- 239 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XU8moslu' \
    --itemId 'iHZJ7O8s' \
    > test.out 2>&1
eval_tap $? 239 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 240 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AQ32wj9u' \
    --userId 'aDzsr9xY' \
    > test.out 2>&1
eval_tap $? 240 'GetUserSubscription' test.out

#- 241 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iWRuuzQJ' \
    --userId 'iLc1eI9w' \
    > test.out 2>&1
eval_tap $? 241 'DeleteUserSubscription' test.out

#- 242 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3JEhxPGb' \
    --userId 'Ek7s7gw0' \
    --force  \
    --body '{"immediate": false, "reason": "jlpJdre5"}' \
    > test.out 2>&1
eval_tap $? 242 'CancelSubscription' test.out

#- 243 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ur6yvWJD' \
    --userId 'dvM7T7PX' \
    --body '{"grantDays": 51, "reason": "vamIRZHz"}' \
    > test.out 2>&1
eval_tap $? 243 'GrantDaysToSubscription' test.out

#- 244 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'sIYOCUoi' \
    --userId 'CXNjrdQL' \
    --excludeFree  \
    --limit '10' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 244 'GetUserSubscriptionBillingHistories' test.out

#- 245 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iI2NPvl1' \
    --userId 'kCY5bEok' \
    --body '{"additionalData": {"cardSummary": "xXxkWZbj"}, "authorisedTime": "1973-11-29T00:00:00Z", "chargebackReversedTime": "1987-07-09T00:00:00Z", "chargebackTime": "1983-01-02T00:00:00Z", "chargedTime": "1981-04-25T00:00:00Z", "createdTime": "1977-06-03T00:00:00Z", "currency": {"currencyCode": "BeIqdQGZ", "currencySymbol": "C5kM03HH", "currencyType": "REAL", "decimals": 20, "namespace": "FGUPhR4L"}, "customParameters": {"EZvz3EjF": {}, "R7996Ug5": {}, "m4axDV5u": {}}, "extOrderNo": "TcYsoahU", "extTxId": "rELQ1btj", "extUserId": "JOqQMgZW", "issuedAt": "1984-11-10T00:00:00Z", "metadata": {"U6E92nHJ": "zvw7tnYt", "Gfv0EJyj": "Bu4EzwRj", "D7jmQJeF": "PghqamSc"}, "namespace": "5y0X48eT", "nonceStr": "7Mluexk8", "paymentMethod": "7b9Z5BTs", "paymentMethodFee": 62, "paymentOrderNo": "OwrSfWhT", "paymentProvider": "ADYEN", "paymentProviderFee": 56, "paymentStationUrl": "abP4xRow", "price": 11, "refundedTime": "1993-11-15T00:00:00Z", "salesTax": 24, "sandbox": false, "sku": "uBtRFPKT", "status": "AUTHORISE_FAILED", "statusReason": "prR3OEey", "subscriptionId": "0MkZwS6T", "subtotalPrice": 41, "targetNamespace": "wNN3UYhi", "targetUserId": "c03qGEg5", "tax": 11, "totalPrice": 85, "totalTax": 80, "txEndTime": "1988-07-23T00:00:00Z", "type": "laeYl4cs", "userId": "Fq65cU66", "vat": 51}' \
    > test.out 2>&1
eval_tap $? 245 'ProcessUserSubscriptionNotification' test.out

#- 246 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'HeT7VEPg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G40QyXzs' \
    --body '{"count": 82, "orderNo": "8v5peiux"}' \
    > test.out 2>&1
eval_tap $? 246 'AcquireUserTicket' test.out

#- 247 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBJATauy' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserCurrencyWallets' test.out

#- 248 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'D3XCXVMi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yEvMf9yi' \
    --body '{"allowOverdraft": false, "amount": 95, "balanceOrigin": "Playstation", "reason": "Eujk6oqY"}' \
    > test.out 2>&1
eval_tap $? 248 'DebitUserWalletByCurrencyCode' test.out

#- 249 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'o1HQYTFz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wdOMdupw' \
    --limit '60' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 249 'ListUserCurrencyTransactions' test.out

#- 250 CheckWallet
eval_tap 0 250 'CheckWallet # SKIP deprecated' test.out

#- 251 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'O3uNbcID' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cIyvZbOy' \
    --body '{"amount": 38, "expireAt": "1994-07-04T00:00:00Z", "origin": "GooglePlay", "reason": "cZ2PofaJ", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 251 'CreditUserWallet' test.out

#- 252 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '4RpfmjIX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FGZ5PKdb' \
    --body '{"amount": 1, "walletPlatform": "Nintendo"}' \
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
    --storeId 'bJIkNnt9' \
    > test.out 2>&1
eval_tap $? 258 'ListViews' test.out

#- 259 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'P1Tkm08l' \
    --body '{"displayOrder": 42, "localizations": {"c0r4GqF0": {"description": "NHglOVuN", "localExt": {"Z9LzNeJn": {}, "Burh54CW": {}, "bYb0Peby": {}}, "longDescription": "t8b4DGsc", "title": "jwrizsFU"}, "gYwbaLvq": {"description": "vQ2NbmDI", "localExt": {"TuymTBjn": {}, "3d2sFzMS": {}, "3QaVjZF7": {}}, "longDescription": "Ax6115Kg", "title": "9U8vrQJX"}, "QxoIbVi2": {"description": "CLEk277I", "localExt": {"vjj1A647": {}, "XQ3koaAf": {}, "ZIim0sFP": {}}, "longDescription": "m1YN27bo", "title": "jDVaZLpx"}}, "name": "4kEWYkO6"}' \
    > test.out 2>&1
eval_tap $? 259 'CreateView' test.out

#- 260 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'KrKUMhJr' \
    --storeId 'ASBh61hm' \
    > test.out 2>&1
eval_tap $? 260 'GetView' test.out

#- 261 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'WKSSrF35' \
    --storeId 'anDGvur1' \
    --body '{"displayOrder": 98, "localizations": {"V18oIrUK": {"description": "XttgAI2Q", "localExt": {"dWJFLmoP": {}, "Egd8EMsp": {}, "Os8nkic9": {}}, "longDescription": "gj5vyUMA", "title": "AmIHYbsx"}, "G5N066FX": {"description": "b88SbLOa", "localExt": {"21DiSFsm": {}, "0XXQJWsz": {}, "vTQEuALz": {}}, "longDescription": "DNp1SZ58", "title": "aDllwzTR"}, "Hak1MXxj": {"description": "7Esrg790", "localExt": {"0nml5Bid": {}, "sK9dCEzh": {}, "VnOv0PQb": {}}, "longDescription": "VIaKiHfo", "title": "eorY7A1o"}}, "name": "tGFyv2SM"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateView' test.out

#- 262 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'jbEr50qG' \
    --storeId 'dCZIc6EF' \
    > test.out 2>&1
eval_tap $? 262 'DeleteView' test.out

#- 263 QueryWallets
eval_tap 0 263 'QueryWallets # SKIP deprecated' test.out

#- 264 GetWallet
eval_tap 0 264 'GetWallet # SKIP deprecated' test.out

#- 265 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'qBKxbS7Q' \
    --end '2OgRucL1' \
    --start 'jwRXzfjD' \
    > test.out 2>&1
eval_tap $? 265 'SyncOrders' test.out

#- 266 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["ZZBmOau6", "syme06c6", "SKLc2mEC"], "apiKey": "3IXl5XCb", "authoriseAsCapture": false, "blockedPaymentMethods": ["WBkIzjoS", "V31tvmMB", "6jzrpRGE"], "clientKey": "SmooHiCV", "dropInSettings": "4GUOnXpa", "liveEndpointUrlPrefix": "pXQGRakU", "merchantAccount": "bcG7PcR4", "notificationHmacKey": "eiU3Idi5", "notificationPassword": "5jNrGNT2", "notificationUsername": "VHTKuIT5", "returnUrl": "FwwHj0Ur", "settings": "5F2PWGTT"}' \
    > test.out 2>&1
eval_tap $? 266 'TestAdyenConfig' test.out

#- 267 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "D81xhNP4", "privateKey": "t6kYBUjy", "publicKey": "XAn3bWQF", "returnUrl": "6QcAiJpX"}' \
    > test.out 2>&1
eval_tap $? 267 'TestAliPayConfig' test.out

#- 268 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "Irgroixp", "secretKey": "tZhckUTG"}' \
    > test.out 2>&1
eval_tap $? 268 'TestCheckoutConfig' test.out

#- 269 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'kcBOE4qM' \
    > test.out 2>&1
eval_tap $? 269 'DebugMatchedPaymentMerchantConfig' test.out

#- 270 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "cH1Kyi8Z", "clientSecret": "FvGcV8DY", "returnUrl": "0XOkDstx", "webHookId": "ZcY1HgAn"}' \
    > test.out 2>&1
eval_tap $? 270 'TestPayPalConfig' test.out

#- 271 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["ZV4IOglV", "Lqb9lGAJ", "Ug21Lt7J"], "publishableKey": "wgwMUSuC", "secretKey": "3Bajy3Bc", "webhookSecret": "EMCtQs2F"}' \
    > test.out 2>&1
eval_tap $? 271 'TestStripeConfig' test.out

#- 272 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "cEcvVAyI", "key": "d6Cp85HV", "mchid": "DsZBQgOn", "returnUrl": "XuXsGThY"}' \
    > test.out 2>&1
eval_tap $? 272 'TestWxPayConfig' test.out

#- 273 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Zrmm0wrF", "flowCompletionUrl": "MnPpWgrQ", "merchantId": 61, "projectId": 49, "projectSecretKey": "4hEk0OLj"}' \
    > test.out 2>&1
eval_tap $? 273 'TestXsollaConfig' test.out

#- 274 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'YsnignE7' \
    > test.out 2>&1
eval_tap $? 274 'GetPaymentMerchantConfig' test.out

#- 275 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'KcMF7fuD' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["bzRRYMNX", "WUsp1tOi", "bJY9aL9i"], "apiKey": "e6vvMbiN", "authoriseAsCapture": false, "blockedPaymentMethods": ["Rrlm88Ql", "Kyuoya4J", "gakZyUV7"], "clientKey": "t73VnSFb", "dropInSettings": "uxd4KYZ0", "liveEndpointUrlPrefix": "jk0UZdht", "merchantAccount": "nKu9oTc8", "notificationHmacKey": "pVkiyGsj", "notificationPassword": "5JdXzRxf", "notificationUsername": "NEjUMTs8", "returnUrl": "WIObJBTs", "settings": "vsw76uIS"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateAdyenConfig' test.out

#- 276 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'RX0bKVoW' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestAdyenConfigById' test.out

#- 277 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'toUW1P7o' \
    --sandbox  \
    --validate  \
    --body '{"appId": "cuBAldDS", "privateKey": "US7Haa6u", "publicKey": "nq1yQOSR", "returnUrl": "vyiLBRVt"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateAliPayConfig' test.out

#- 278 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'IDi2piIQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestAliPayConfigById' test.out

#- 279 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'FVmzMidw' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "70KSahpY", "secretKey": "ZdKZRyR9"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateCheckoutConfig' test.out

#- 280 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'AX7JjxvN' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestCheckoutConfigById' test.out

#- 281 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'ZhM84DiZ' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "k6ySrB9S", "clientSecret": "VFctW7YS", "returnUrl": "0OkL78Xe", "webHookId": "EAtALFI3"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdatePayPalConfig' test.out

#- 282 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'v8yha4pd' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 282 'TestPayPalConfigById' test.out

#- 283 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '5A7MYcpB' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["D6lKNb8R", "xvN2u5J7", "baOeLH19"], "publishableKey": "fqBwNbNe", "secretKey": "1ffYRtIv", "webhookSecret": "QaKyevWY"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdateStripeConfig' test.out

#- 284 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'tZjK6J29' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 284 'TestStripeConfigById' test.out

#- 285 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'v8MpBSpo' \
    --validate  \
    --body '{"appId": "3AKRmnJk", "key": "zJHAckUy", "mchid": "BksYQfDm", "returnUrl": "0RNFwiz7"}' \
    > test.out 2>&1
eval_tap $? 285 'UpdateWxPayConfig' test.out

#- 286 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '0tRVLMlH' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 286 'UpdateWxPayConfigCert' test.out

#- 287 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'i8i9gOVq' \
    > test.out 2>&1
eval_tap $? 287 'TestWxPayConfigById' test.out

#- 288 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'ajUWrgEs' \
    --validate  \
    --body '{"apiKey": "WDtaKzn8", "flowCompletionUrl": "dZwnnGeZ", "merchantId": 38, "projectId": 63, "projectSecretKey": "VgbPzPFb"}' \
    > test.out 2>&1
eval_tap $? 288 'UpdateXsollaConfig' test.out

#- 289 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'rOMZMgWk' \
    > test.out 2>&1
eval_tap $? 289 'TestXsollaConfigById' test.out

#- 290 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'FN7Tpkx6' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateXsollaUIConfig' test.out

#- 291 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '84' \
    --namespace "$AB_NAMESPACE" \
    --offset '35' \
    --region 'g6ZUrrp9' \
    > test.out 2>&1
eval_tap $? 291 'QueryPaymentProviderConfig' test.out

#- 292 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "EWzWlTY7", "region": "0qdgJRvp", "sandboxTaxJarApiToken": "ZrSpWX3K", "specials": ["XSOLLA", "WXPAY", "ALIPAY"], "taxJarApiToken": "VbKIf1Zb", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 292 'CreatePaymentProviderConfig' test.out

#- 293 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 293 'GetAggregatePaymentProviders' test.out

#- 294 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'gUwd8DHo' \
    > test.out 2>&1
eval_tap $? 294 'DebugMatchedPaymentProviderConfig' test.out

#- 295 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 295 'GetSpecialPaymentProviders' test.out

#- 296 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'CQykmXHY' \
    --body '{"aggregate": "ADYEN", "namespace": "OoIOD74V", "region": "21HWDAfv", "sandboxTaxJarApiToken": "Xwdxbyp4", "specials": ["ADYEN", "WXPAY", "ALIPAY"], "taxJarApiToken": "PbBbNPSt", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 296 'UpdatePaymentProviderConfig' test.out

#- 297 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'V7NfC4A2' \
    > test.out 2>&1
eval_tap $? 297 'DeletePaymentProviderConfig' test.out

#- 298 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 298 'GetPaymentTaxConfig' test.out

#- 299 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "ODiZhbfb", "taxJarApiToken": "8QqCyK1X", "taxJarEnabled": false, "taxJarProductCodesMapping": {"D6vl5eFd": "FfgK46Gj", "CWaP8huT": "mnq3FGQn", "3Ahu5wxq": "6oJq4mCh"}}' \
    > test.out 2>&1
eval_tap $? 299 'UpdatePaymentTaxConfig' test.out

#- 300 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'mQHQhO9I' \
    --end 'KBXDFQfX' \
    --start 'FD58sG6u' \
    > test.out 2>&1
eval_tap $? 300 'SyncPaymentOrders' test.out

#- 301 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'DhFYlrzJ' \
    --storeId 'BYSeMuJf' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetRootCategories' test.out

#- 302 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'QecutjS0' \
    --storeId '29BiJWOG' \
    > test.out 2>&1
eval_tap $? 302 'DownloadCategories' test.out

#- 303 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '1m7MKclr' \
    --namespace "$AB_NAMESPACE" \
    --language '5igjNTVI' \
    --storeId 'trH2X78h' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetCategory' test.out

#- 304 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'xJgaVfw5' \
    --namespace "$AB_NAMESPACE" \
    --language 'Vnyq8OzT' \
    --storeId 'E89WDNoM' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetChildCategories' test.out

#- 305 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'cOmbfJrC' \
    --namespace "$AB_NAMESPACE" \
    --language 'JQIj1haA' \
    --storeId 'osKglqaC' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetDescendantCategories' test.out

#- 306 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 306 'PublicListCurrencies' test.out

#- 307 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    > test.out 2>&1
eval_tap $? 307 'GetIAPItemMapping' test.out

#- 308 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'DoN91uc2' \
    --region '8HoSpGt1' \
    --storeId 'g0GGbT4H' \
    --appId 'f2PPKOld' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetItemByAppId' test.out

#- 309 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'Gvi9kg3r' \
    --categoryPath 'MIzNmhJT' \
    --features 'NQjKlwjf' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --language 'Fjjx6uZe' \
    --limit '35' \
    --offset '9' \
    --region 'WbtwTX9g' \
    --sortBy 'displayOrder:desc,name:desc,displayOrder:asc' \
    --storeId 'ByjbE8lO' \
    --tags 'LAfTXKLz' \
    > test.out 2>&1
eval_tap $? 309 'PublicQueryItems' test.out

#- 310 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'brddqcKL' \
    --region 'a7LevxNH' \
    --storeId 'OSEhQRZI' \
    --sku 'p693lRwt' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetItemBySku' test.out

#- 311 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'c43atCuC' \
    --region 'Fxbfbz4a' \
    --storeId 'QERziPL4' \
    --itemIds 'dHhOqG5K' \
    > test.out 2>&1
eval_tap $? 311 'PublicBulkGetItems' test.out

#- 312 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["DdUvk0LE", "i26Ls7mj", "RxNmvvNt"]}' \
    > test.out 2>&1
eval_tap $? 312 'PublicValidateItemPurchaseCondition' test.out

#- 313 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'CODE' \
    --limit '20' \
    --offset '74' \
    --region 'i329PfVr' \
    --storeId 'vMEPtpsS' \
    --keyword 'NcpK1QkB' \
    --language '2Sy8Ww79' \
    > test.out 2>&1
eval_tap $? 313 'PublicSearchItems' test.out

#- 314 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'LVeVskqe' \
    --namespace "$AB_NAMESPACE" \
    --language 'UB7RSayq' \
    --region 'GFguhh3b' \
    --storeId 'vadRthdb' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetApp' test.out

#- 315 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'VApebRA0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'PublicGetItemDynamicData' test.out

#- 316 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '9rW8i8kr' \
    --namespace "$AB_NAMESPACE" \
    --language 'FWJhe03c' \
    --populateBundle  \
    --region 'oRFok5d3' \
    --storeId 'AyGrZO8G' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetItem' test.out

#- 317 GetPaymentCustomization
eval_tap 0 317 'GetPaymentCustomization # SKIP deprecated' test.out

#- 318 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "uoXNSoVE", "paymentProvider": "XSOLLA", "returnUrl": "jqbCKpMv", "ui": "2Yky9DYk", "zipCode": "D2sIllFt"}' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPaymentUrl' test.out

#- 319 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'BtXJKG3r' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetPaymentMethods' test.out

#- 320 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qBmILhtW' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetUnpaidPaymentOrder' test.out

#- 321 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'm8RQvRUb' \
    --paymentProvider 'WXPAY' \
    --zipCode 'DSiefGEd' \
    --body '{"token": "LucrtO2g"}' \
    > test.out 2>&1
eval_tap $? 321 'Pay' test.out

#- 322 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CQD057Dr' \
    > test.out 2>&1
eval_tap $? 322 'PublicCheckPaymentOrderPaidStatus' test.out

#- 323 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'GGt3MiBK' \
    > test.out 2>&1
eval_tap $? 323 'GetPaymentPublicConfig' test.out

#- 324 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'ohow3kKo' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetQRCode' test.out

#- 325 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'aP1K4CDu' \
    --foreinginvoice 'H1mMIfOC' \
    --invoiceId 'DyVAHrHn' \
    --payload 'cR5dShqi' \
    --redirectResult 'BUI9esSs' \
    --resultCode 'XegSEhrP' \
    --sessionId 'pK2q8kxR' \
    --status '4BuEksS2' \
    --token 'A9VOA8H9' \
    --type 'VeHv0L2A' \
    --userId 'cm960EYQ' \
    --orderNo 'EuGJVl8x' \
    --paymentOrderNo 's1WId9Wl' \
    --paymentProvider 'ADYEN' \
    --returnUrl '3HgoXCR6' \
    > test.out 2>&1
eval_tap $? 325 'PublicNormalizePaymentReturnUrl' test.out

#- 326 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'XOMXwKdf' \
    --paymentOrderNo 'qk8T4QHK' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 326 'GetPaymentTaxValue' test.out

#- 327 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'MgzReRq0' \
    > test.out 2>&1
eval_tap $? 327 'GetRewardByCode' test.out

#- 328 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '112ISArR' \
    --limit '83' \
    --offset '71' \
    --sortBy 'namespace:asc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 328 'QueryRewards1' test.out

#- 329 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'dcmM6v2A' \
    > test.out 2>&1
eval_tap $? 329 'GetReward1' test.out

#- 330 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 330 'PublicListStores' test.out

#- 331 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'EozWWaYv,BLE46bpu,Jip8JyxJ' \
    --itemIds '39vrtuWW,rqTZbSqB,SKp8Amgw' \
    --skus 'hYzk33J3,4fiTxK63,OHpnUCGB' \
    > test.out 2>&1
eval_tap $? 331 'PublicExistsAnyMyActiveEntitlement' test.out

#- 332 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'VfpctNFU' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 333 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'tdtdtVW9' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 334 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku '2o1J5euL' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 335 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'AbBgejqc,0apxqZ20,9BySn8aU' \
    --itemIds 'aGlAyvIs,lt7N1qcx,Ks4nlf1M' \
    --skus 'fqUZXkjH,vcUOTlxN,f09pefgF' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetEntitlementOwnershipToken' test.out

#- 336 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "IiJssShB", "language": "ASmr_197", "region": "a7cfZl4V"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncTwitchDropsEntitlement' test.out

#- 337 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'uY6rsZyo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 337 'PublicGetMyWallet' test.out

#- 338 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '6CBRRnoO' \
    --body '{"epicGamesJwtToken": "ikIxXKKI"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncEpicGameDLC' test.out

#- 339 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'R6kPmswm' \
    --body '{"serviceLabel": 73}' \
    > test.out 2>&1
eval_tap $? 339 'PublicSyncPsnDlcInventory' test.out

#- 340 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'TCAU1cKA' \
    --body '{"serviceLabels": [32, 12, 7]}' \
    > test.out 2>&1
eval_tap $? 340 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 341 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'NLIlTk3B' \
    --body '{"appId": "pclrk4hI", "steamId": "Rn0znIKz"}' \
    > test.out 2>&1
eval_tap $? 341 'SyncSteamDLC' test.out

#- 342 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AEAHQpBO' \
    --body '{"xstsToken": "gHEP5l94"}' \
    > test.out 2>&1
eval_tap $? 342 'SyncXboxDLC' test.out

#- 343 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 's7CbIJ7e' \
    --appType 'DLC' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'VWOboMky' \
    --features 'B7FTexsO,Z0b2p3b6,3KrcwIcX' \
    --itemId 'MhGy83Xi,t6boOLGC,cg16Dqwd' \
    --limit '88' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 343 'PublicQueryUserEntitlements' test.out

#- 344 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PQ9HkSSV' \
    --appId '8e1MgTTL' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserAppEntitlementByAppId' test.out

#- 345 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'S2FgarY9' \
    --limit '44' \
    --offset '70' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 345 'PublicQueryUserEntitlementsByAppType' test.out

#- 346 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NGIyEfRB' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'gGVxo9OH' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetUserEntitlementByItemId' test.out

#- 347 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gfHumyfu' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'gGfC0Gjv' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserEntitlementBySku' test.out

#- 348 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'pgJfuBs1' \
    --appIds 'Vpqn47GV,ghTH2wTo,Onq9U5ly' \
    --itemIds 'W89Xwt3w,mRTrDCjh,nKvsHezW' \
    --skus 'TqgYPixt,Hk6lWq6t,EeUmU96F' \
    > test.out 2>&1
eval_tap $? 348 'PublicExistsAnyUserActiveEntitlement' test.out

#- 349 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEak0mJq' \
    --appId 'jRYldcTp' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 350 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'deCD9XPR' \
    --entitlementClazz 'CODE' \
    --itemId 'mR6Z7rb2' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 351 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '1A2E9pX0' \
    --ids 'BWCMqPsR,k5htdM5T,3fDSrSHr' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 352 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'koqv2mM6' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'r09CDA8I' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 353 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'j5bGKSuo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWQbaCvd' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetUserEntitlement' test.out

#- 354 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'PSq8Z27G' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pvHCDx55' \
    --body '{"options": ["JZ5z6guj", "pFzlPspQ", "D9IRIpDD"], "requestId": "ubntPCFx", "useCount": 10}' \
    > test.out 2>&1
eval_tap $? 354 'PublicConsumeUserEntitlement' test.out

#- 355 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'f6E8EajX' \
    --body '{"code": "LSAS8MKM", "language": "vY-xkdQ", "region": "EZCiTNAx"}' \
    > test.out 2>&1
eval_tap $? 355 'PublicRedeemCode' test.out

#- 356 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'q26gZrPq' \
    --body '{"excludeOldTransactions": true, "language": "Tjt-qWMG", "productId": "16sZ6rjn", "receiptData": "kH4ExObp", "region": "pC6CMYDm", "transactionId": "5ge659UD"}' \
    > test.out 2>&1
eval_tap $? 356 'PublicFulfillAppleIAPItem' test.out

#- 357 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOF6gp5U' \
    --body '{"epicGamesJwtToken": "fmjtiVbq"}' \
    > test.out 2>&1
eval_tap $? 357 'SyncEpicGamesInventory' test.out

#- 358 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'JnZcrqrP' \
    --body '{"autoAck": true, "language": "EkF_185", "orderId": "l2wIFlHm", "packageName": "9N6owMHM", "productId": "tJy1Oqn5", "purchaseTime": 83, "purchaseToken": "tEGm9NYe", "region": "UT5P0nx8"}' \
    > test.out 2>&1
eval_tap $? 358 'PublicFulfillGoogleIAPItem' test.out

#- 359 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'TqSZdZ5C' \
    --body '{"currencyCode": "8mFI9Tnv", "price": 0.4121848727185624, "productId": "EqBNMF9C", "serviceLabel": 71}' \
    > test.out 2>&1
eval_tap $? 359 'PublicReconcilePlayStationStore' test.out

#- 360 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPxT5zbr' \
    --body '{"currencyCode": "eMc9fBoU", "price": 0.9002146548177156, "productId": "RHNDFjLK", "serviceLabels": [64, 40, 35]}' \
    > test.out 2>&1
eval_tap $? 360 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 361 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '5srPFxBg' \
    --body '{"appId": "pFtDBmTL", "currencyCode": "H9kP9U53", "language": "kaK_VbfH_kE", "price": 0.5210028435915565, "productId": "I2YYb6aj", "region": "Bjgq6eY4", "steamId": "PBNHKPx6"}' \
    > test.out 2>&1
eval_tap $? 361 'SyncSteamInventory' test.out

#- 362 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2tHxDb06' \
    --body '{"gameId": "ZFy3uglS", "language": "gw-WgKU_Ls", "region": "0y9uxgVL"}' \
    > test.out 2>&1
eval_tap $? 362 'SyncTwitchDropsEntitlement1' test.out

#- 363 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'GgK8aVSC' \
    --body '{"currencyCode": "N6oCETQ8", "price": 0.11235233119096333, "productId": "IDRdD2ww", "xstsToken": "MXwKVXGP"}' \
    > test.out 2>&1
eval_tap $? 363 'SyncXboxInventory' test.out

#- 364 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'hEJsc7rZ' \
    --itemId 'pxaPHc9r' \
    --limit '10' \
    --offset '8' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 364 'PublicQueryUserOrders' test.out

#- 365 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ToFmkHJ6' \
    --body '{"currencyCode": "BPOKFLxI", "discountedPrice": 46, "ext": {"EguCqlMH": {}, "iQN3HWJw": {}, "9zIWsiP2": {}}, "itemId": "JQ24meDr", "language": "rfL_AnQR", "price": 14, "quantity": 13, "region": "fBmhjI9Y", "returnUrl": "28qVceS9"}' \
    > test.out 2>&1
eval_tap $? 365 'PublicCreateUserOrder' test.out

#- 366 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UX48dKPC' \
    --userId 'FUIeyYEy' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetUserOrder' test.out

#- 367 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mNXzNX6T' \
    --userId 'Gh4UdEwe' \
    > test.out 2>&1
eval_tap $? 367 'PublicCancelUserOrder' test.out

#- 368 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'eBsJEvBb' \
    --userId 'AvCmlh6Z' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetUserOrderHistories' test.out

#- 369 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1oz9Baix' \
    --userId 'UUvmzbaj' \
    > test.out 2>&1
eval_tap $? 369 'PublicDownloadUserOrderReceipt' test.out

#- 370 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'E2gjooiD' \
    > test.out 2>&1
eval_tap $? 370 'PublicGetPaymentAccounts' test.out

#- 371 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'nc1NUb51' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'dVCsB7xL' \
    > test.out 2>&1
eval_tap $? 371 'PublicDeletePaymentAccount' test.out

#- 372 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '4axSPgPC' \
    --language 'iwLxCFLD' \
    --region 'ixZwVtt3' \
    --storeId 'RVTl0tR0' \
    --viewId '0oQgcHdG' \
    > test.out 2>&1
eval_tap $? 372 'PublicListActiveSections' test.out

#- 373 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'GK3x76U1' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'tWwF7RnP' \
    --limit '32' \
    --offset '29' \
    --sku 'gF5szl0s' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 373 'PublicQueryUserSubscriptions' test.out

#- 374 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'es36r1Fg' \
    --body '{"currencyCode": "R70eNLHk", "itemId": "VrEFd8xA", "language": "yYl-477", "region": "2myQzl7X", "returnUrl": "9fHr6WvB", "source": "xmBvNj3k"}' \
    > test.out 2>&1
eval_tap $? 374 'PublicSubscribeSubscription' test.out

#- 375 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'taDf9B22' \
    --itemId 'HGgxakPt' \
    > test.out 2>&1
eval_tap $? 375 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 376 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7IYzaZUT' \
    --userId 'mvsEzLPn' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetUserSubscription' test.out

#- 377 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nGsnfmBe' \
    --userId 'rp84qjwz' \
    > test.out 2>&1
eval_tap $? 377 'PublicChangeSubscriptionBillingAccount' test.out

#- 378 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'WpCF1vya' \
    --userId 'mjsEzwtL' \
    --body '{"immediate": true, "reason": "JFaIaEMW"}' \
    > test.out 2>&1
eval_tap $? 378 'PublicCancelSubscription' test.out

#- 379 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5bhJyL72' \
    --userId 'WDyhBsCC' \
    --excludeFree  \
    --limit '3' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetUserSubscriptionBillingHistories' test.out

#- 380 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'nfihnXKx' \
    --language 'GxaupnTT' \
    --storeId 'q9ihZkvF' \
    > test.out 2>&1
eval_tap $? 380 'PublicListViews' test.out

#- 381 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'KfSHQh8I' \
    --namespace "$AB_NAMESPACE" \
    --userId '9xk3sFl0' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetWallet' test.out

#- 382 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'cbuCRM69' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XKkLwioR' \
    --limit '0' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 382 'PublicListUserWalletTransactions' test.out

#- 383 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'nWhlh80B' \
    --baseAppId 'hYe2fJDS' \
    --categoryPath '6T75Q4ul' \
    --features 'onMFjmYq' \
    --includeSubCategoryItem  \
    --itemName 'E1wJhfog' \
    --itemStatus 'ACTIVE' \
    --itemType 'CODE' \
    --limit '55' \
    --offset '69' \
    --region 'pm0sUy18' \
    --sortBy 'updatedAt,updatedAt:asc,name' \
    --storeId 'n65Co0vd' \
    --tags 'Ck8so6JS' \
    --targetNamespace 'aZAIadKD' \
    > test.out 2>&1
eval_tap $? 383 'QueryItems1' test.out

#- 384 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EZywonA2' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 384 'ImportStore1' test.out

#- 385 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SrEdN2tm' \
    --body '{"itemIds": ["GuX6r0gB", "VUUeKKlP", "KtE6gnYx"]}' \
    > test.out 2>&1
eval_tap $? 385 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE