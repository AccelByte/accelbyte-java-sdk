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
echo "1..388"

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
    --body '{"context": {"item": {"appId": "EAxcVpFr", "appType": "GAME", "baseAppId": "I6LZrkq6", "boothName": "Dc09nIW0", "boundItemIds": ["ZPUdc0qh", "Oaiw9B0D", "7eHpzSn3"], "categoryPath": "4n8mzZ0m", "clazz": "8SAMTwE6", "createdAt": "1988-10-30T00:00:00Z", "description": "6IaRDBXx", "displayOrder": 49, "entitlementType": "CONSUMABLE", "ext": {"aNoMR6hk": {}, "spInrAip": {}, "6lyzSxwE": {}}, "features": ["lFHHdgs2", "kNmKJfh5", "1Jub74CU"], "fresh": false, "images": [{"as": "kY1aXlFc", "caption": "DtgOjchI", "height": 42, "imageUrl": "Hs1cnz1J", "smallImageUrl": "SDgY1TXp", "width": 3}, {"as": "8zsCTCrb", "caption": "CbPOyNQk", "height": 93, "imageUrl": "6XM4OI18", "smallImageUrl": "mAQLnzjM", "width": 11}, {"as": "cXm7agSr", "caption": "jJW2OQNO", "height": 38, "imageUrl": "u2D6QVKN", "smallImageUrl": "CWP75TB0", "width": 18}], "itemId": "Fgx4c8Ou", "itemIds": ["mKtPDKJD", "Xn7Z4U68", "su8Xfqlq"], "itemQty": {"NiTvB6Sd": 55, "orKsxwko": 39, "Z5MecdKi": 58}, "itemType": "EXTENSION", "language": "8XfwHuKe", "listable": false, "localExt": {"Ezth6mXh": {}, "zkzWkFeZ": {}, "SoEAcBdW": {}}, "longDescription": "19m4eu6d", "lootBoxConfig": {"rewardCount": 66, "rewards": [{"lootBoxItems": [{"count": 40, "itemId": "6C7duuyZ", "itemSku": "0GhDogqr", "itemType": "hBRd8lDR"}, {"count": 53, "itemId": "qVNPRZYd", "itemSku": "FLIAjGGJ", "itemType": "ddVCvu9v"}, {"count": 47, "itemId": "SevkLGMS", "itemSku": "0lyuI9a2", "itemType": "I9u6Vpbs"}], "name": "x5w8hqUI", "odds": 0.8444144295138901, "type": "PROBABILITY_GROUP", "weight": 96}, {"lootBoxItems": [{"count": 92, "itemId": "pOXGSLmC", "itemSku": "VuHOPlLl", "itemType": "kvR8sKgn"}, {"count": 41, "itemId": "TeIv53HG", "itemSku": "CiljvjKo", "itemType": "yD6SCwGr"}, {"count": 27, "itemId": "FjkQsfCa", "itemSku": "Tmt1d67F", "itemType": "XGk2s9Q0"}], "name": "mPVo3twu", "odds": 0.8515712018765591, "type": "REWARD_GROUP", "weight": 93}, {"lootBoxItems": [{"count": 10, "itemId": "C6I3lMjG", "itemSku": "SWN2laRl", "itemType": "xfcjHfYa"}, {"count": 21, "itemId": "MbwL6IY6", "itemSku": "9z1UaLqY", "itemType": "SYWytLPz"}, {"count": 18, "itemId": "yYoNRKd3", "itemSku": "IL5TAQ6i", "itemType": "iPlSC2uE"}], "name": "4o5Vwdo3", "odds": 0.09427513649391428, "type": "PROBABILITY_GROUP", "weight": 33}], "rollFunction": "DEFAULT"}, "maxCount": 4, "maxCountPerUser": 70, "name": "UmLZZbSq", "namespace": "b8RwNmn9", "optionBoxConfig": {"boxItems": [{"count": 69, "itemId": "VAla2l5B", "itemSku": "YNtIuS5S", "itemType": "5XUdjsoq"}, {"count": 45, "itemId": "OcEdscKH", "itemSku": "PEqgA8yu", "itemType": "7Vk6Jt4Y"}, {"count": 25, "itemId": "hZv15T7q", "itemSku": "uIOvBMca", "itemType": "YmvCkGZ5"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 54, "comparison": "includes", "name": "yCUEXlAv", "predicateType": "SeasonPassPredicate", "value": "oxozr6wf", "values": ["jJCSQT27", "RMvqtlB2", "NPX2bOIt"]}, {"anyOf": 3, "comparison": "excludes", "name": "YGu0rdlg", "predicateType": "EntitlementPredicate", "value": "RBaAkLnv", "values": ["MyKrQpM4", "mDc3fxU8", "xkT1X68c"]}, {"anyOf": 16, "comparison": "isNot", "name": "kkK6KKXN", "predicateType": "SeasonPassPredicate", "value": "3xoJ8aeC", "values": ["IPUvmEej", "naLpUKp4", "4YUDjasW"]}]}, {"operator": "or", "predicates": [{"anyOf": 35, "comparison": "includes", "name": "kILsSSyD", "predicateType": "EntitlementPredicate", "value": "rvjj7il3", "values": ["MNqq98Sj", "5MXbN9oC", "TvhZNkSQ"]}, {"anyOf": 60, "comparison": "excludes", "name": "6BXksUC9", "predicateType": "EntitlementPredicate", "value": "z1x3poD3", "values": ["Q1MzH7Qm", "Qgb3boLQ", "8bwbmXgd"]}, {"anyOf": 55, "comparison": "is", "name": "VJf6c2Z0", "predicateType": "SeasonTierPredicate", "value": "AFKK2WDg", "values": ["3EeERmDn", "yeFoF7VS", "CcxvONZm"]}]}, {"operator": "or", "predicates": [{"anyOf": 30, "comparison": "isGreaterThanOrEqual", "name": "JbRFQSKV", "predicateType": "SeasonTierPredicate", "value": "Tb3g7mSQ", "values": ["lSck0ZHn", "UhAEtrmj", "qU6YE3p4"]}, {"anyOf": 92, "comparison": "isNot", "name": "I39YBHqa", "predicateType": "SeasonTierPredicate", "value": "XlvPG6bF", "values": ["2L7vIYhG", "YReVHQip", "cCx9Zw5D"]}, {"anyOf": 67, "comparison": "includes", "name": "yEW4ZJJ4", "predicateType": "SeasonTierPredicate", "value": "d3PBddN8", "values": ["ApflxqMr", "S48l9lyN", "j3oZk03Q"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 51, "fixedTrialCycles": 74, "graceDays": 69}, "region": "MDYDDxHS", "regionData": [{"currencyCode": "ZjtqXyJ5", "currencyNamespace": "8f7Gc26S", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1975-10-16T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1971-02-11T00:00:00Z", "discountedPrice": 21, "expireAt": "1997-07-16T00:00:00Z", "price": 47, "purchaseAt": "1972-07-27T00:00:00Z", "trialPrice": 46}, {"currencyCode": "fTcyiuAT", "currencyNamespace": "us9hsfpF", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1972-08-26T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1982-09-24T00:00:00Z", "discountedPrice": 39, "expireAt": "1971-07-13T00:00:00Z", "price": 80, "purchaseAt": "1987-10-03T00:00:00Z", "trialPrice": 67}, {"currencyCode": "yPLtI8il", "currencyNamespace": "byDPUIj8", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1995-02-05T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1976-01-25T00:00:00Z", "discountedPrice": 32, "expireAt": "1979-05-05T00:00:00Z", "price": 59, "purchaseAt": "1999-06-03T00:00:00Z", "trialPrice": 26}], "saleConfig": {"currencyCode": "81P1ktfI", "price": 29}, "seasonType": "PASS", "sellable": true, "sku": "eIP6rOvD", "stackable": true, "status": "ACTIVE", "tags": ["yjlBiuFM", "KOsb392k", "6YmJFfRB"], "targetCurrencyCode": "3FIoVk8T", "targetItemId": "3GpAnkCm", "targetNamespace": "BUqg2SCn", "thumbnailUrl": "qntX9y1a", "title": "ZSWMiVi1", "updatedAt": "1998-09-29T00:00:00Z", "useCount": 37}, "namespace": "RuPMMWH8", "order": {"currency": {"currencyCode": "Yb33T5UB", "currencySymbol": "JCjfcnLR", "currencyType": "REAL", "decimals": 14, "namespace": "xeCSz9WE"}, "ext": {"i8KlloeH": {}, "0JT1ydua": {}, "t2vQR3bi": {}}, "free": true}, "source": "REFERRAL_BONUS"}, "script": "fsu4jmsR", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'sXzOXQAk' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '4mqrxzTt' \
    --body '{"grantDays": "uLl4XlbG"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'L8QOxtjz' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'm8y2wNhm' \
    --body '{"grantDays": "woYZyI4E"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "FZKBcYrC", "dryRun": true, "fulfillmentUrl": "xreNDUWe", "itemType": "BUNDLE", "purchaseConditionUrl": "x40NLRc6"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'm8heKnWh' \
    --itemType 'LOOTBOX' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'b6z3LNUj' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id '7fdgLA84' \
    --body '{"clazz": "Z8YYk6QE", "dryRun": false, "fulfillmentUrl": "duEEQlUL", "purchaseConditionUrl": "dJz4mnRB"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'kMNxvvKg' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --name 'FyabWAgI' \
    --offset '95' \
    --tag 'hRkloqxM' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "3gpwxcfM", "items": [{"extraSubscriptionDays": 51, "itemId": "yEW6GLbc", "itemName": "0NaKDUL3", "quantity": 37}, {"extraSubscriptionDays": 73, "itemId": "a13lk1dQ", "itemName": "BHO86IlB", "quantity": 16}, {"extraSubscriptionDays": 27, "itemId": "CO39PXDN", "itemName": "xtXgeO3F", "quantity": 12}], "maxRedeemCountPerCampaignPerUser": 42, "maxRedeemCountPerCode": 21, "maxRedeemCountPerCodePerUser": 38, "maxSaleCount": 14, "name": "aZA2yyd4", "redeemEnd": "1977-04-22T00:00:00Z", "redeemStart": "1971-04-26T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["ZkP7cFdP", "43e5dC9X", "IBudfZgr"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'KwwrAP2a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'Mlu7WtjC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "toYetOO8", "items": [{"extraSubscriptionDays": 95, "itemId": "7g8OudOf", "itemName": "jnCuHZ3c", "quantity": 50}, {"extraSubscriptionDays": 71, "itemId": "JRcQWsmq", "itemName": "PNs92epx", "quantity": 21}, {"extraSubscriptionDays": 70, "itemId": "i8VxsZNe", "itemName": "reSvf969", "quantity": 25}], "maxRedeemCountPerCampaignPerUser": 20, "maxRedeemCountPerCode": 58, "maxRedeemCountPerCodePerUser": 50, "maxSaleCount": 63, "name": "AZvkRCMN", "redeemEnd": "1987-08-03T00:00:00Z", "redeemStart": "1988-05-26T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["p7gh4TeU", "TkOkAYfJ", "B8AT9t4T"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'v207Y2QD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '3oD5fLCr' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '3OOlXVv8' \
    --body '{"categoryPath": "ZGF7uYnG", "localizationDisplayNames": {"zpipNDig": "NJma1Mbq", "qZtfNWql": "4nmwAft4", "gqkNNlWk": "D9eOziYR"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FOn0jJLH' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'C9LxhvNX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TwGBCtoh' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'Ltl9Zuhy' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tm5UDrT6' \
    --body '{"localizationDisplayNames": {"QXCs5SPB": "bRPZTF6o", "QAXVG7tn": "sZg5QgXj", "vyGJPN4e": "XbJE5Vs2"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'GcyomQoI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XimBJehy' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'xlNsjUgx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BkF6wFPo' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'JeQediog' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EhhM2rIi' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'zGdKvOPd' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '33' \
    --code 'zZSKscfO' \
    --limit '5' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'u3dpCROY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 34}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'DQyj4bj5' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '89' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'mpo6sPwV' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '83' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'ujQSa3Zd' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '4' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'QpNhlI2i' \
    --namespace "$AB_NAMESPACE" \
    --code 'S5EpGhhv' \
    --limit '96' \
    --offset '20' \
    --userId 'ck0upMzU' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Ynb76tFk' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'EORV3bu1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'bNCtX7W4' \
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
    --body '{"grpcServerAddress": "0V6Do5sY"}' \
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
    --body '{"currencyCode": "Pclxcft2", "currencySymbol": "ulIJzPyr", "currencyType": "VIRTUAL", "decimals": 62, "localizationDescriptions": {"XuNFviMa": "rv8mnfHK", "8CCmE2lP": "nsbD3SGE", "dlwuUccE": "536ugBp3"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'HBvepnDC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"jgyJlXe3": "6mgWjLfF", "mteue9nz": "J6fH24T8", "05tVg8Jq": "U0jZpjvs"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'ugAOS7u8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'RiWyerCS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'a8SRgwsA' \
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
    --body '{"data": [{"id": "j1ik1jgl", "rewards": [{"currency": {"currencyCode": "aDXTvKCW", "namespace": "wNTAhd2w"}, "item": {"itemId": "rS0uPdjh", "itemSku": "dinpng5B", "itemType": "Ly8wbhMs"}, "quantity": 38, "type": "CURRENCY"}, {"currency": {"currencyCode": "AHjapIkY", "namespace": "9Rf4wP57"}, "item": {"itemId": "dBZNR88Y", "itemSku": "bCtmKy8M", "itemType": "9zVrjfGX"}, "quantity": 28, "type": "ITEM"}, {"currency": {"currencyCode": "qAQUoY1G", "namespace": "jlIIk0iK"}, "item": {"itemId": "oTTS1j02", "itemSku": "o7JjTXAQ", "itemType": "N0qdskdQ"}, "quantity": 97, "type": "ITEM"}]}, {"id": "k0eaKQDO", "rewards": [{"currency": {"currencyCode": "JvrTefgl", "namespace": "Ss6g4iY9"}, "item": {"itemId": "u02aCNYI", "itemSku": "Wekp18lO", "itemType": "C3mNqF7B"}, "quantity": 24, "type": "ITEM"}, {"currency": {"currencyCode": "0LcghVHf", "namespace": "PEspxwhR"}, "item": {"itemId": "ON0bc1eM", "itemSku": "bEIjowLq", "itemType": "c3ecjXJb"}, "quantity": 30, "type": "ITEM"}, {"currency": {"currencyCode": "bBEG8X64", "namespace": "5xpdXpai"}, "item": {"itemId": "0rYaT5hO", "itemSku": "Pjaf3H0t", "itemType": "YighU0VU"}, "quantity": 11, "type": "CURRENCY"}]}, {"id": "cYHJbBfA", "rewards": [{"currency": {"currencyCode": "KSiPW3Vg", "namespace": "sZXiR1DJ"}, "item": {"itemId": "7HVWqMkN", "itemSku": "SawQUWDF", "itemType": "JvJBWic7"}, "quantity": 96, "type": "CURRENCY"}, {"currency": {"currencyCode": "hJPUAc0R", "namespace": "VwXgAgnt"}, "item": {"itemId": "LMCuaXBW", "itemSku": "Qi6BqPg4", "itemType": "xr0lCanc"}, "quantity": 95, "type": "ITEM"}, {"currency": {"currencyCode": "ZGCHsZYo", "namespace": "LfR1KtOv"}, "item": {"itemId": "7Zy0b65u", "itemSku": "vuKNuy0y", "itemType": "tZQ7M6Nz"}, "quantity": 50, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"dnSKOLFK": "x1dX4LuW", "Ju3pDMUA": "eeZ97SBR", "OPYuG6Xq": "P6oo7G73"}}, {"platform": "XBOX", "platformDlcIdMap": {"Beeoip68": "J1nsv4W2", "OJhtafxM": "SJlHeb34", "sZKHcl5L": "LLOexL4f"}}, {"platform": "PSN", "platformDlcIdMap": {"vWtND2tc": "BFpX8lNt", "FEJ7tnkY": "6Mca5afj", "12K2IzrB": "vvWm4udE"}}]}' \
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
    --appType 'SOFTWARE' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'M70TdlNB' \
    --itemId 'JYOmpu1V,CarzBsV6,xnZ5Jrzz' \
    --limit '18' \
    --offset '35' \
    --userId 'hfxnhLd3' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'Knaknoed' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '60' \
    --status 'FAIL' \
    --userId 'hLOqQGhC' \
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
    --body '{"bundleId": "Ur6iTrjy", "password": "EgarAdNJ"}' \
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
    --body '{"sandboxId": "OIG36I6t"}' \
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
    --body '{"applicationName": "RbRcrEve", "serviceAccountId": "MdAdiPKD"}' \
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
    --body '{"data": [{"itemIdentity": "UVSC00PY", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"oujQD4IE": "iH9Z5qXn", "3aoRtlqO": "ECohViHA", "5CzgFSy8": "X1A3PrIf"}}, {"itemIdentity": "apq5AAeM", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"H3mtgWgU": "4pCAKxeE", "70CaunQN": "xot371W9", "G4AvQkqs": "Gnmyo5JJ"}}, {"itemIdentity": "TUVmb8GE", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"FTlEMEsF": "zYqwgK1N", "p5nodqpL": "m7FhJBNX", "zAFdO0Kh": "qf6kiTdS"}}]}' \
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
    --body '{"environment": "Gv2LFjAK"}' \
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
    --body '{"appId": "Y7CbgsWq", "publisherAuthenticationKey": "FWZX7kPB"}' \
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
    --body '{"clientId": "om8F9GLL", "clientSecret": "TG8phc3n", "organizationId": "4iLoIllK"}' \
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
    --body '{"relyingPartyCert": "lpO2pqiX"}' \
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
    --password 'JF3WGRao' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'QomSJC4D' \
    --itemId 'drKF7SUQ' \
    --itemType 'SUBSCRIPTION' \
    --endTime 'crM8rG0r' \
    --startTime 'H0zcswwV' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'eMK6MbGI' \
    --itemId 'VIu8vvwL' \
    --itemType 'APP' \
    --endTime 'xY5rA1Wo' \
    --startTime 'VeJIePF8' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZrQzP4zv' \
    --body '{"categoryPath": "tdxdbZUp", "targetItemId": "d6FJtHJ1", "targetNamespace": "pyVwyKQL"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Y6FEO65R' \
    --body '{"appId": "b3z7CYLM", "appType": "DLC", "baseAppId": "IlsHqffn", "boothName": "rfsGlfPa", "categoryPath": "ZKBwa3Dd", "clazz": "b60ufPpz", "displayOrder": 47, "entitlementType": "CONSUMABLE", "ext": {"j1QGIFml": {}, "Vf4jvaps": {}, "eE9LN9bv": {}}, "features": ["d6X3viLv", "tEk4mTIp", "hOrHflIO"], "images": [{"as": "UA9gxo8S", "caption": "V38nEhoX", "height": 25, "imageUrl": "vCE48L5o", "smallImageUrl": "LF6M4lNa", "width": 22}, {"as": "JUMSHNgq", "caption": "RqCV7usa", "height": 24, "imageUrl": "NqoTow0q", "smallImageUrl": "iOiC4j0i", "width": 21}, {"as": "qKhTPkwf", "caption": "LM9uSybR", "height": 51, "imageUrl": "jN86Hl8k", "smallImageUrl": "UXzt6bSc", "width": 24}], "itemIds": ["bWvgpVyW", "9dD1kOmv", "rAejcq2L"], "itemQty": {"gkQuaS7R": 57, "BME74HUt": 18, "BOxrZDyv": 32}, "itemType": "EXTENSION", "listable": false, "localizations": {"x8CzPML5": {"description": "2faXUr9S", "localExt": {"k4lq2faB": {}, "cAXXKlhv": {}, "yH8paOJt": {}}, "longDescription": "xqMPpcVf", "title": "RwNj547f"}, "H0XrKEDp": {"description": "EY8VnocG", "localExt": {"Ajci0V3t": {}, "Bf2jnHGK": {}, "Xphn50c9": {}}, "longDescription": "tNLDljhZ", "title": "2jxLRX3z"}, "46OCaGBe": {"description": "MfPlNos4", "localExt": {"yBRjrERH": {}, "EonAZR8G": {}, "mEu0q1p6": {}}, "longDescription": "QCyY6vSk", "title": "VFWdsbYu"}}, "lootBoxConfig": {"rewardCount": 97, "rewards": [{"lootBoxItems": [{"count": 48, "itemId": "EGVxYheR", "itemSku": "3j5mNZ6v", "itemType": "wv7K8Asv"}, {"count": 40, "itemId": "efTYKhux", "itemSku": "aEc7M4P7", "itemType": "UckSC6eP"}, {"count": 8, "itemId": "F8KDsBZO", "itemSku": "uYQJ03BA", "itemType": "HZ7c53q7"}], "name": "akMpcmnn", "odds": 0.38629133792240844, "type": "REWARD", "weight": 89}, {"lootBoxItems": [{"count": 46, "itemId": "VBrop9v7", "itemSku": "aZK3h65h", "itemType": "bN15zfQS"}, {"count": 10, "itemId": "U7eHGebS", "itemSku": "Vu0LQ40k", "itemType": "epEaC4df"}, {"count": 18, "itemId": "jMQAg5mP", "itemSku": "YhrLTyU8", "itemType": "OhgfY9JQ"}], "name": "YGF4bYXE", "odds": 0.036705786739133606, "type": "REWARD", "weight": 73}, {"lootBoxItems": [{"count": 81, "itemId": "KQQewVLM", "itemSku": "UoAnaRcY", "itemType": "p7FUjfIG"}, {"count": 1, "itemId": "lyPR7wZN", "itemSku": "iVsF6xG2", "itemType": "mXEQdbzI"}, {"count": 97, "itemId": "WaDhukU4", "itemSku": "khGG4vZF", "itemType": "TYnPkmSu"}], "name": "4PWam1jx", "odds": 0.7057695458655867, "type": "REWARD_GROUP", "weight": 91}], "rollFunction": "DEFAULT"}, "maxCount": 62, "maxCountPerUser": 87, "name": "TWjteoc8", "optionBoxConfig": {"boxItems": [{"count": 10, "itemId": "ycvU4Pbm", "itemSku": "RDcrg0Dj", "itemType": "QjBECXve"}, {"count": 0, "itemId": "T6mZEiwx", "itemSku": "xElpMYSW", "itemType": "IeVzm7z9"}, {"count": 27, "itemId": "h94TSenE", "itemSku": "5hCFkIf5", "itemType": "weqZ18MH"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 24, "fixedTrialCycles": 96, "graceDays": 87}, "regionData": {"Zsrh90ET": [{"currencyCode": "tYmGukz3", "currencyNamespace": "MnlrjcHp", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1996-02-08T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1989-03-17T00:00:00Z", "discountedPrice": 100, "expireAt": "1985-05-24T00:00:00Z", "price": 84, "purchaseAt": "1996-05-20T00:00:00Z", "trialPrice": 64}, {"currencyCode": "x9Ns8eLz", "currencyNamespace": "YEvwSWTa", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1972-03-16T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1985-06-22T00:00:00Z", "discountedPrice": 78, "expireAt": "1979-10-25T00:00:00Z", "price": 18, "purchaseAt": "1973-02-28T00:00:00Z", "trialPrice": 38}, {"currencyCode": "XhIjSoTB", "currencyNamespace": "2NMKteza", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1992-07-30T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1994-12-08T00:00:00Z", "discountedPrice": 88, "expireAt": "1997-09-06T00:00:00Z", "price": 84, "purchaseAt": "1992-07-09T00:00:00Z", "trialPrice": 84}], "zTxBGtEJ": [{"currencyCode": "IYppuUSs", "currencyNamespace": "KoHw2hyd", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1981-09-23T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1991-09-05T00:00:00Z", "discountedPrice": 6, "expireAt": "1984-09-05T00:00:00Z", "price": 44, "purchaseAt": "1980-01-06T00:00:00Z", "trialPrice": 8}, {"currencyCode": "MVUGKSZ4", "currencyNamespace": "GcLkt4pK", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1998-10-12T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1983-05-04T00:00:00Z", "discountedPrice": 23, "expireAt": "1996-04-20T00:00:00Z", "price": 5, "purchaseAt": "1989-08-19T00:00:00Z", "trialPrice": 56}, {"currencyCode": "TpTdRtCH", "currencyNamespace": "vuk6B6XT", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1993-11-01T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1983-04-17T00:00:00Z", "discountedPrice": 43, "expireAt": "1979-03-17T00:00:00Z", "price": 38, "purchaseAt": "1974-03-09T00:00:00Z", "trialPrice": 3}], "gBVZxiKd": [{"currencyCode": "V57GvRyd", "currencyNamespace": "9UuL02Le", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1993-07-18T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1998-05-24T00:00:00Z", "discountedPrice": 72, "expireAt": "1977-06-03T00:00:00Z", "price": 37, "purchaseAt": "1983-08-31T00:00:00Z", "trialPrice": 72}, {"currencyCode": "d4M1F5qR", "currencyNamespace": "IblS7Nz8", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1976-07-31T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1992-02-06T00:00:00Z", "discountedPrice": 55, "expireAt": "1981-08-08T00:00:00Z", "price": 52, "purchaseAt": "1991-08-16T00:00:00Z", "trialPrice": 19}, {"currencyCode": "AWc9x1aM", "currencyNamespace": "jgGim51T", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1971-08-27T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1974-11-18T00:00:00Z", "discountedPrice": 90, "expireAt": "1997-04-18T00:00:00Z", "price": 39, "purchaseAt": "1997-12-21T00:00:00Z", "trialPrice": 8}]}, "saleConfig": {"currencyCode": "ugbNEIpG", "price": 55}, "seasonType": "PASS", "sellable": true, "sku": "UjOn5mM7", "stackable": false, "status": "INACTIVE", "tags": ["uUicAeIV", "IW5ynMKq", "8nbLzvtC"], "targetCurrencyCode": "XtoWAXhM", "targetNamespace": "lW4tLqX7", "thumbnailUrl": "OICf5oD1", "useCount": 8}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'YGeAfYFG' \
    --appId '3wSkHKuf' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate '8Zkgk0jS' \
    --baseAppId '6rDWUwfh' \
    --categoryPath 'Kvrf2AaH' \
    --features '4yCWrHSp' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --limit '44' \
    --offset '26' \
    --region 'DJ3w3UNg' \
    --sortBy 'createdAt:asc,updatedAt:desc' \
    --storeId 'zH5NvAtc' \
    --tags 'vNedgS1f' \
    --targetNamespace 'UfKmihDb' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'mu8ePWlQ,MVDXEHei,GTnwyEw6' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hIWDZrpP' \
    --sku '7rz3ISW5' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '10kHr4is' \
    --populateBundle  \
    --region 'TKWjmv67' \
    --storeId 'nuHCXWfw' \
    --sku 'nwGioVwV' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'zmmBVVFf' \
    --sku 'pqx1AeLt' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'zcPJ3jtD,YBo4FUTH,7CGfKSyx' \
    --storeId 'gRR1DiCq' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'SMzpqIFG' \
    --region 'LkDs7ACC' \
    --storeId '1RgBfoNr' \
    --itemIds 'HlFi2qJL' \
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
    --userId 'gmBLE35Y' \
    --body '{"itemIds": ["hyiDV90S", "eI5yppBH", "oytVznCg"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Nyx9fbT6' \
    --body '{"changes": [{"itemIdentities": ["3ShEh8Pb", "GikLjgjc", "j34uulU6"], "itemIdentityType": "ITEM_ID", "regionData": {"YBZsWFbr": [{"currencyCode": "3RSP0W9n", "currencyNamespace": "Bhvhf8Q0", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1981-09-07T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1986-11-15T00:00:00Z", "discountedPrice": 10, "expireAt": "1972-04-03T00:00:00Z", "price": 48, "purchaseAt": "1992-04-17T00:00:00Z", "trialPrice": 7}, {"currencyCode": "b5QxWG2H", "currencyNamespace": "FnZlA6HK", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1985-10-08T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1989-12-14T00:00:00Z", "discountedPrice": 78, "expireAt": "1972-01-31T00:00:00Z", "price": 30, "purchaseAt": "1981-08-11T00:00:00Z", "trialPrice": 46}, {"currencyCode": "QELcNlZk", "currencyNamespace": "qTZrKgXN", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1982-04-17T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1984-02-06T00:00:00Z", "discountedPrice": 1, "expireAt": "1995-09-25T00:00:00Z", "price": 38, "purchaseAt": "1996-12-13T00:00:00Z", "trialPrice": 72}], "H742Oixh": [{"currencyCode": "tAoKiVm6", "currencyNamespace": "URT95Xhn", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1981-08-10T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1999-05-31T00:00:00Z", "discountedPrice": 8, "expireAt": "1991-04-28T00:00:00Z", "price": 32, "purchaseAt": "1973-06-19T00:00:00Z", "trialPrice": 37}, {"currencyCode": "VLie0LBa", "currencyNamespace": "36KNzjf0", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1996-11-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1973-09-23T00:00:00Z", "discountedPrice": 48, "expireAt": "1973-04-22T00:00:00Z", "price": 15, "purchaseAt": "1971-12-18T00:00:00Z", "trialPrice": 0}, {"currencyCode": "7jjYgXch", "currencyNamespace": "CbkXX26u", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1972-10-21T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1986-02-09T00:00:00Z", "discountedPrice": 99, "expireAt": "1992-02-25T00:00:00Z", "price": 1, "purchaseAt": "1991-07-31T00:00:00Z", "trialPrice": 100}], "QuTKfC0I": [{"currencyCode": "2kNjCMDt", "currencyNamespace": "DMrentgn", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1974-06-13T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1993-01-17T00:00:00Z", "discountedPrice": 78, "expireAt": "1975-07-08T00:00:00Z", "price": 26, "purchaseAt": "1988-02-06T00:00:00Z", "trialPrice": 44}, {"currencyCode": "ShF9RKb9", "currencyNamespace": "vvxuJlhX", "currencyType": "REAL", "discountAmount": 100, "discountExpireAt": "1974-03-01T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1971-08-28T00:00:00Z", "discountedPrice": 47, "expireAt": "1989-12-07T00:00:00Z", "price": 73, "purchaseAt": "1982-07-25T00:00:00Z", "trialPrice": 93}, {"currencyCode": "tJBg0tTJ", "currencyNamespace": "g46IewOX", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1998-12-15T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1987-03-28T00:00:00Z", "discountedPrice": 57, "expireAt": "1985-03-04T00:00:00Z", "price": 13, "purchaseAt": "1999-12-10T00:00:00Z", "trialPrice": 29}]}}, {"itemIdentities": ["IZsUf8lG", "FXcmwTER", "HclOdxIw"], "itemIdentityType": "ITEM_SKU", "regionData": {"WkLob9gK": [{"currencyCode": "Lqs2nEZh", "currencyNamespace": "pByfHZin", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1973-10-02T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1984-12-08T00:00:00Z", "discountedPrice": 88, "expireAt": "1984-04-03T00:00:00Z", "price": 46, "purchaseAt": "1981-03-27T00:00:00Z", "trialPrice": 28}, {"currencyCode": "MBsznlBU", "currencyNamespace": "qnLT4AbG", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1981-07-31T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1997-12-28T00:00:00Z", "discountedPrice": 43, "expireAt": "1995-10-17T00:00:00Z", "price": 81, "purchaseAt": "1975-06-30T00:00:00Z", "trialPrice": 64}, {"currencyCode": "Pbpg7yrR", "currencyNamespace": "vXfZ6rvg", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1986-07-07T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1988-10-02T00:00:00Z", "discountedPrice": 15, "expireAt": "1984-06-06T00:00:00Z", "price": 75, "purchaseAt": "1998-07-16T00:00:00Z", "trialPrice": 91}], "4QxZkaXZ": [{"currencyCode": "7vmiEd0J", "currencyNamespace": "PxVyQpsh", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1985-07-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1972-05-21T00:00:00Z", "discountedPrice": 92, "expireAt": "1994-01-11T00:00:00Z", "price": 15, "purchaseAt": "1972-10-16T00:00:00Z", "trialPrice": 65}, {"currencyCode": "H9c4Vfky", "currencyNamespace": "rwpuXxba", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1993-04-09T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1988-02-09T00:00:00Z", "discountedPrice": 14, "expireAt": "1986-12-02T00:00:00Z", "price": 87, "purchaseAt": "1977-05-24T00:00:00Z", "trialPrice": 17}, {"currencyCode": "YmkPKTPO", "currencyNamespace": "lhTtSiZN", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1982-06-14T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1978-02-20T00:00:00Z", "discountedPrice": 81, "expireAt": "1987-06-04T00:00:00Z", "price": 81, "purchaseAt": "1973-11-08T00:00:00Z", "trialPrice": 68}], "70Iw157g": [{"currencyCode": "00jr9b8M", "currencyNamespace": "uYmmeKTm", "currencyType": "VIRTUAL", "discountAmount": 84, "discountExpireAt": "1991-02-23T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1982-09-24T00:00:00Z", "discountedPrice": 87, "expireAt": "1997-05-06T00:00:00Z", "price": 49, "purchaseAt": "1973-09-10T00:00:00Z", "trialPrice": 4}, {"currencyCode": "Qdf3ewoG", "currencyNamespace": "GoY7xmFN", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1977-04-06T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1981-09-01T00:00:00Z", "discountedPrice": 60, "expireAt": "1986-07-09T00:00:00Z", "price": 58, "purchaseAt": "1980-06-27T00:00:00Z", "trialPrice": 3}, {"currencyCode": "s78mcMdi", "currencyNamespace": "S76YApGJ", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1981-02-12T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1982-11-01T00:00:00Z", "discountedPrice": 95, "expireAt": "1976-06-14T00:00:00Z", "price": 33, "purchaseAt": "1991-10-12T00:00:00Z", "trialPrice": 34}]}}, {"itemIdentities": ["gLuZS6hs", "QryiEtOA", "bpeUNf26"], "itemIdentityType": "ITEM_SKU", "regionData": {"qkCfgCUY": [{"currencyCode": "Bn2xaOBd", "currencyNamespace": "PF0JmX8q", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1994-02-20T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1972-06-18T00:00:00Z", "discountedPrice": 48, "expireAt": "1988-11-27T00:00:00Z", "price": 70, "purchaseAt": "1973-12-11T00:00:00Z", "trialPrice": 18}, {"currencyCode": "B5S3DvPR", "currencyNamespace": "CzBrVUxm", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1991-08-07T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1985-02-01T00:00:00Z", "discountedPrice": 5, "expireAt": "1987-06-24T00:00:00Z", "price": 39, "purchaseAt": "1993-09-09T00:00:00Z", "trialPrice": 51}, {"currencyCode": "aTC11W0T", "currencyNamespace": "GTCm4fZW", "currencyType": "VIRTUAL", "discountAmount": 58, "discountExpireAt": "1976-12-04T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1978-11-13T00:00:00Z", "discountedPrice": 86, "expireAt": "1982-07-12T00:00:00Z", "price": 4, "purchaseAt": "1986-07-30T00:00:00Z", "trialPrice": 88}], "gEpzZ3Fb": [{"currencyCode": "txfhcRC7", "currencyNamespace": "IVYa6iZ5", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1987-12-21T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1982-10-12T00:00:00Z", "discountedPrice": 82, "expireAt": "1980-04-21T00:00:00Z", "price": 44, "purchaseAt": "1993-08-25T00:00:00Z", "trialPrice": 69}, {"currencyCode": "6rmzVr5X", "currencyNamespace": "T1Nxw0v1", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1990-12-13T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1983-12-27T00:00:00Z", "discountedPrice": 36, "expireAt": "1984-01-09T00:00:00Z", "price": 11, "purchaseAt": "1976-02-21T00:00:00Z", "trialPrice": 5}, {"currencyCode": "C2cVWf6t", "currencyNamespace": "tvbU1PO6", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1979-08-26T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1986-11-25T00:00:00Z", "discountedPrice": 56, "expireAt": "1995-04-16T00:00:00Z", "price": 71, "purchaseAt": "1975-01-31T00:00:00Z", "trialPrice": 16}], "T7w0Oc15": [{"currencyCode": "N8WXBPp1", "currencyNamespace": "7PAewqSm", "currencyType": "VIRTUAL", "discountAmount": 49, "discountExpireAt": "1992-06-26T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1974-10-06T00:00:00Z", "discountedPrice": 39, "expireAt": "1977-12-28T00:00:00Z", "price": 100, "purchaseAt": "1991-12-14T00:00:00Z", "trialPrice": 27}, {"currencyCode": "6EjRwEQl", "currencyNamespace": "NapJRfk4", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1990-06-05T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1982-07-01T00:00:00Z", "discountedPrice": 39, "expireAt": "1998-05-04T00:00:00Z", "price": 83, "purchaseAt": "1986-01-03T00:00:00Z", "trialPrice": 68}, {"currencyCode": "xgP6Jbct", "currencyNamespace": "8puMybYG", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1986-07-13T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1989-12-03T00:00:00Z", "discountedPrice": 83, "expireAt": "1977-04-25T00:00:00Z", "price": 25, "purchaseAt": "1984-05-28T00:00:00Z", "trialPrice": 67}]}}]}' \
    > test.out 2>&1
eval_tap $? 94 'BulkUpdateRegionData' test.out

#- 95 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SEASON' \
    --limit '30' \
    --offset '25' \
    --sortBy 'DtsUuYo5' \
    --storeId 'p8ED5QZA' \
    --keyword 'ufwNa8lz' \
    --language 'fjv9oYMX' \
    > test.out 2>&1
eval_tap $? 95 'SearchItems' test.out

#- 96 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '79' \
    --offset '18' \
    --sortBy 'createdAt:asc,name:desc' \
    --storeId '69FTFVGU' \
    > test.out 2>&1
eval_tap $? 96 'QueryUncategorizedItems' test.out

#- 97 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'VhvKhJCm' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'eisql14m' \
    > test.out 2>&1
eval_tap $? 97 'GetItem' test.out

#- 98 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'UHVbMPim' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NhcZsU3V' \
    --body '{"appId": "AdMDcb4q", "appType": "DLC", "baseAppId": "amU7syGl", "boothName": "ElXdEAOr", "categoryPath": "VSnLocLV", "clazz": "VYamQc4w", "displayOrder": 5, "entitlementType": "DURABLE", "ext": {"G5nDBLJo": {}, "JHbiQ5du": {}, "E5p4cfs2": {}}, "features": ["NDlmM5nQ", "wiIAvxSv", "E41cK8QT"], "images": [{"as": "FMGzs7fz", "caption": "jgyc44mE", "height": 16, "imageUrl": "CFeY5g4X", "smallImageUrl": "gBsbfzqx", "width": 56}, {"as": "QehMDli6", "caption": "t9unQLYX", "height": 49, "imageUrl": "4IjGdqth", "smallImageUrl": "RxTjQ7gk", "width": 15}, {"as": "EY8rG0q0", "caption": "Q2Qd2JzR", "height": 2, "imageUrl": "tKwG3UC6", "smallImageUrl": "XCnnZxF8", "width": 59}], "itemIds": ["bYaJCJjf", "k2TUvn95", "FhO7VW3m"], "itemQty": {"bDVMDu87": 40, "1eym5ydC": 67, "p25xCWTq": 96}, "itemType": "SUBSCRIPTION", "listable": true, "localizations": {"ZENJ1QHZ": {"description": "QxPRXH7u", "localExt": {"xBJEECQE": {}, "1li3Bg7J": {}, "xc9pUnZm": {}}, "longDescription": "vhidwCkZ", "title": "wqjYLfTi"}, "CO1NDBvQ": {"description": "vRPnAz4V", "localExt": {"zW0CpoBC": {}, "byJsF5Ij": {}, "F1c0W338": {}}, "longDescription": "HS6CBgVR", "title": "yihYNZ84"}, "CVhziXV8": {"description": "HwSmvcvc", "localExt": {"DKF19yVR": {}, "afCjOuSY": {}, "ht83AdvB": {}}, "longDescription": "aagTiRJ8", "title": "daGTVX3B"}}, "lootBoxConfig": {"rewardCount": 4, "rewards": [{"lootBoxItems": [{"count": 65, "itemId": "7jlz5IfH", "itemSku": "gKjI9mwJ", "itemType": "SrN8jkIy"}, {"count": 22, "itemId": "xLv9HBEU", "itemSku": "e89AwEw1", "itemType": "HO4FnKtx"}, {"count": 67, "itemId": "XLKAmlDr", "itemSku": "19uJ3nq6", "itemType": "VerzVCcI"}], "name": "8y3Cz0Yq", "odds": 0.4640464552173583, "type": "REWARD_GROUP", "weight": 69}, {"lootBoxItems": [{"count": 96, "itemId": "tMlFgvh2", "itemSku": "Dp2SoiIP", "itemType": "p1yvfAHS"}, {"count": 43, "itemId": "VgLu11A3", "itemSku": "HTovFi4t", "itemType": "PAGfleyC"}, {"count": 55, "itemId": "FIYeAg79", "itemSku": "HcLJXJ7m", "itemType": "pVI6eTYA"}], "name": "jdPlCiQQ", "odds": 0.46417092320034825, "type": "REWARD", "weight": 100}, {"lootBoxItems": [{"count": 4, "itemId": "BAetsanz", "itemSku": "qP8oxfrt", "itemType": "bECD1CYP"}, {"count": 46, "itemId": "UAxJrINP", "itemSku": "XppPNO3A", "itemType": "fmXcgwC3"}, {"count": 71, "itemId": "0calqxEe", "itemSku": "wuGS469k", "itemType": "2hG0WKt4"}], "name": "sUmanYxM", "odds": 0.8506192616767905, "type": "PROBABILITY_GROUP", "weight": 68}], "rollFunction": "CUSTOM"}, "maxCount": 98, "maxCountPerUser": 95, "name": "NYzGMNIp", "optionBoxConfig": {"boxItems": [{"count": 100, "itemId": "ZIdhevfZ", "itemSku": "vyV7Acod", "itemType": "cZwKjYDd"}, {"count": 25, "itemId": "WrFtHIi1", "itemSku": "CMgKAOG5", "itemType": "iDcCR5Pb"}, {"count": 59, "itemId": "n8yreciP", "itemSku": "LfkVyyJs", "itemType": "bGpO6Jge"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 27, "fixedTrialCycles": 72, "graceDays": 67}, "regionData": {"xEN7JlZc": [{"currencyCode": "8LMq1o2j", "currencyNamespace": "ZWu4yA3r", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1987-05-15T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1998-11-06T00:00:00Z", "discountedPrice": 2, "expireAt": "1996-10-02T00:00:00Z", "price": 65, "purchaseAt": "1996-03-04T00:00:00Z", "trialPrice": 71}, {"currencyCode": "eeEssWEU", "currencyNamespace": "l07bhwnt", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1995-05-10T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1975-05-01T00:00:00Z", "discountedPrice": 83, "expireAt": "1993-10-14T00:00:00Z", "price": 23, "purchaseAt": "1973-11-01T00:00:00Z", "trialPrice": 81}, {"currencyCode": "KwMZQjzv", "currencyNamespace": "jSozv6CT", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1990-04-01T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1998-07-28T00:00:00Z", "discountedPrice": 92, "expireAt": "1978-04-27T00:00:00Z", "price": 14, "purchaseAt": "1985-03-03T00:00:00Z", "trialPrice": 52}], "huiTnJar": [{"currencyCode": "YYkHBDdS", "currencyNamespace": "zBXdxapw", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1972-10-10T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1992-08-09T00:00:00Z", "discountedPrice": 87, "expireAt": "1986-06-16T00:00:00Z", "price": 38, "purchaseAt": "1982-06-17T00:00:00Z", "trialPrice": 77}, {"currencyCode": "fmfxKYB4", "currencyNamespace": "LM6H6QXm", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1997-07-06T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1999-08-20T00:00:00Z", "discountedPrice": 12, "expireAt": "1979-12-30T00:00:00Z", "price": 51, "purchaseAt": "1993-02-08T00:00:00Z", "trialPrice": 23}, {"currencyCode": "LD2qfCXn", "currencyNamespace": "lUnqxT1W", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1993-11-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1990-04-05T00:00:00Z", "discountedPrice": 5, "expireAt": "1972-09-09T00:00:00Z", "price": 53, "purchaseAt": "1992-02-29T00:00:00Z", "trialPrice": 78}], "hzC7MNa8": [{"currencyCode": "vVe4MHX6", "currencyNamespace": "AgMep90A", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1983-10-14T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1983-10-19T00:00:00Z", "discountedPrice": 79, "expireAt": "1983-08-07T00:00:00Z", "price": 28, "purchaseAt": "1989-08-28T00:00:00Z", "trialPrice": 85}, {"currencyCode": "2eLMe3lt", "currencyNamespace": "9qfx2UDc", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1995-08-12T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1995-10-30T00:00:00Z", "discountedPrice": 39, "expireAt": "1992-09-11T00:00:00Z", "price": 64, "purchaseAt": "1989-06-05T00:00:00Z", "trialPrice": 9}, {"currencyCode": "kTjgJaMY", "currencyNamespace": "vNQOsDa4", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1972-10-03T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1976-02-05T00:00:00Z", "discountedPrice": 52, "expireAt": "1978-09-21T00:00:00Z", "price": 34, "purchaseAt": "1980-06-10T00:00:00Z", "trialPrice": 48}]}, "saleConfig": {"currencyCode": "XjdyRJun", "price": 86}, "seasonType": "PASS", "sellable": false, "sku": "GAak7Kao", "stackable": false, "status": "INACTIVE", "tags": ["nik42mit", "1DK97D2x", "eR5eQAe1"], "targetCurrencyCode": "rzmmgqBP", "targetNamespace": "Rmd6mO4o", "thumbnailUrl": "I8KDqebm", "useCount": 81}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateItem' test.out

#- 99 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'raNBJ5y7' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'axEkvI4o' \
    > test.out 2>&1
eval_tap $? 99 'DeleteItem' test.out

#- 100 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'xZEDxGiB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 27, "orderNo": "gg8rdwY9"}' \
    > test.out 2>&1
eval_tap $? 100 'AcquireItem' test.out

#- 101 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'bmrvHmO0' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '7KNqX9LM' \
    > test.out 2>&1
eval_tap $? 101 'GetApp' test.out

#- 102 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId '2IwEsdOG' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BXBwnzDX' \
    --body '{"carousel": [{"alt": "8v3xgC1G", "previewUrl": "e9PdbTTA", "thumbnailUrl": "J2Gp1r0s", "type": "image", "url": "6LJAOddI", "videoSource": "youtube"}, {"alt": "qV8d9mDd", "previewUrl": "UIoiIJFN", "thumbnailUrl": "xuNOmUSW", "type": "video", "url": "n3wYowBd", "videoSource": "generic"}, {"alt": "CxdvPL9e", "previewUrl": "4P01vxP8", "thumbnailUrl": "xj1LyEir", "type": "video", "url": "72Uo9UBJ", "videoSource": "generic"}], "developer": "6sjAHyCK", "forumUrl": "5tNanGBr", "genres": ["Casual", "RPG", "Casual"], "localizations": {"Uvck3xTt": {"announcement": "mOFMebS4", "slogan": "AdlNzwog"}, "2IhErkNh": {"announcement": "NcECWwch", "slogan": "W6zL9Skb"}, "LlrNXnGa": {"announcement": "nMazb8jv", "slogan": "RWenURH4"}}, "platformRequirements": {"8aJuALEc": [{"additionals": "SqcE15u6", "directXVersion": "D31DjOsr", "diskSpace": "s3CUYATd", "graphics": "qnQGbqiq", "label": "OkNeATj7", "osVersion": "eGjodd7C", "processor": "cJUrI6MA", "ram": "ugK5kypN", "soundCard": "rp2nFe9F"}, {"additionals": "mN86sK5L", "directXVersion": "Oq4ft5jG", "diskSpace": "cMICPUYn", "graphics": "fG6jl9U4", "label": "jReteIMg", "osVersion": "zISomCso", "processor": "dJrhQW41", "ram": "q2OspCZb", "soundCard": "t3Uta5I0"}, {"additionals": "uGcL1koy", "directXVersion": "HjCH5olY", "diskSpace": "LETRpABA", "graphics": "mO2EGvJ4", "label": "UMS93yOx", "osVersion": "NInDByhn", "processor": "oluO6ti0", "ram": "QP2ssiJ6", "soundCard": "6OzOj84O"}], "6tgohjtC": [{"additionals": "7bzjPpuc", "directXVersion": "ddXJ5zif", "diskSpace": "F8y959an", "graphics": "rNSleywH", "label": "bHig6IKW", "osVersion": "VZ77KeRW", "processor": "dECaFGzf", "ram": "Z2hxcJ2F", "soundCard": "nemn7M23"}, {"additionals": "SzUo4hNB", "directXVersion": "Dh9ZFP1O", "diskSpace": "W0nXOErQ", "graphics": "PS4VsRoY", "label": "IK69yg9A", "osVersion": "DCGiXaLs", "processor": "2xjHkinO", "ram": "D975nARH", "soundCard": "CmhNHSXu"}, {"additionals": "qIHsxvaU", "directXVersion": "oXDmwWsu", "diskSpace": "kxncuD3Q", "graphics": "xCXMd00Y", "label": "BWCaVVmM", "osVersion": "45mfIZsW", "processor": "hkS476dG", "ram": "GJwJ00UH", "soundCard": "197MJ6zU"}], "7JLMQyMW": [{"additionals": "zYQCAaPJ", "directXVersion": "goxGJoJa", "diskSpace": "SzUtY4ZD", "graphics": "0Xtb0U4p", "label": "H16NUsVY", "osVersion": "21NVIs7N", "processor": "Ren2Y3Ns", "ram": "0QJQeaWy", "soundCard": "tPfds1BY"}, {"additionals": "x0EaURyd", "directXVersion": "f8ZyyZeH", "diskSpace": "AWGgJUbU", "graphics": "JRMbkcTg", "label": "lbU86FyO", "osVersion": "jApNHBVf", "processor": "NOURcjY3", "ram": "YYT9oTyn", "soundCard": "mfIuBWgJ"}, {"additionals": "TNFfM8M0", "directXVersion": "IW4oe8KD", "diskSpace": "gy0xZfAc", "graphics": "Ng14Ws8T", "label": "IP1LKiFQ", "osVersion": "oLDvumfq", "processor": "rgSfnx2h", "ram": "61X9dN1M", "soundCard": "GRXBJ6mV"}]}, "platforms": ["Android", "Windows", "Windows"], "players": ["LocalCoop", "Multi", "CrossPlatformMulti"], "primaryGenre": "MassivelyMultiplayer", "publisher": "NLwvI8Jd", "releaseDate": "1975-11-21T00:00:00Z", "websiteUrl": "Y3RRiLil"}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateApp' test.out

#- 103 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'mOGF6dLL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IeIVIjMc' \
    > test.out 2>&1
eval_tap $? 103 'DisableItem' test.out

#- 104 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'dlbdRXTG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetItemDynamicData' test.out

#- 105 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'IrdNL5gJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PqTAjgqa' \
    > test.out 2>&1
eval_tap $? 105 'EnableItem' test.out

#- 106 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'THf1ANTJ' \
    --itemId '9Yk997Xk' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GOdC6Itx' \
    > test.out 2>&1
eval_tap $? 106 'FeatureItem' test.out

#- 107 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'DT8p4n4X' \
    --itemId 'CFkD1AJL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CwszbZxu' \
    > test.out 2>&1
eval_tap $? 107 'DefeatureItem' test.out

#- 108 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'HSgDOK8b' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'joF7bL26' \
    --populateBundle  \
    --region '35KbtZTG' \
    --storeId 'Jpqgl2Iz' \
    > test.out 2>&1
eval_tap $? 108 'GetLocaleItem' test.out

#- 109 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'NXGTuQPI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Dpor7t1a' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 77, "comparison": "includes", "name": "NNz6QIVC", "predicateType": "SeasonTierPredicate", "value": "Mfuc8VOs", "values": ["nmnlVljd", "p38vumnx", "WYmELe74"]}, {"anyOf": 53, "comparison": "isLessThan", "name": "nYBTxaTI", "predicateType": "SeasonPassPredicate", "value": "cWm428Xe", "values": ["lNUBDShH", "9nMrBZo0", "jRF94NIY"]}, {"anyOf": 60, "comparison": "isGreaterThanOrEqual", "name": "32vvL28F", "predicateType": "SeasonTierPredicate", "value": "KMEmtbiW", "values": ["Yi0Zxs5S", "sAQHbMrK", "WCqZXHLL"]}]}, {"operator": "and", "predicates": [{"anyOf": 52, "comparison": "is", "name": "1oQf7BUL", "predicateType": "EntitlementPredicate", "value": "FJUAJsyA", "values": ["feKOufV4", "f15NohXu", "6opxQGRt"]}, {"anyOf": 85, "comparison": "isLessThanOrEqual", "name": "qlkL0diR", "predicateType": "EntitlementPredicate", "value": "wCUsTag4", "values": ["MLAo3m61", "8Onb1a9g", "P2xaNfmn"]}, {"anyOf": 79, "comparison": "is", "name": "z0F2UBRm", "predicateType": "SeasonTierPredicate", "value": "XDmgNEJB", "values": ["hgGq5GID", "hNC66szb", "CCf73IFb"]}]}, {"operator": "or", "predicates": [{"anyOf": 22, "comparison": "isLessThanOrEqual", "name": "SSITz4Tj", "predicateType": "SeasonPassPredicate", "value": "naB3YxKN", "values": ["fIfXshuL", "dOTacCcJ", "Uk5Wdpxj"]}, {"anyOf": 9, "comparison": "isLessThan", "name": "6A6RpmKD", "predicateType": "EntitlementPredicate", "value": "TKbonouc", "values": ["56sDkci5", "rZ8iMlOu", "NmzwOZOK"]}, {"anyOf": 21, "comparison": "isGreaterThanOrEqual", "name": "rjF5RaJw", "predicateType": "SeasonPassPredicate", "value": "WwJ7NrTb", "values": ["UJ9XlYJ8", "1XTB9YQz", "BzP6EUmU"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 109 'UpdateItemPurchaseCondition' test.out

#- 110 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'XGM5anIl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "oyj9lhbv"}' \
    > test.out 2>&1
eval_tap $? 110 'ReturnItem' test.out

#- 111 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --name 'AiU6iJOF' \
    --offset '5' \
    --tag 'JKZFNk2N' \
    > test.out 2>&1
eval_tap $? 111 'QueryKeyGroups' test.out

#- 112 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Ky59X8iO", "name": "g2sVBiCo", "status": "ACTIVE", "tags": ["lHvv9rqv", "EoM8YmVj", "AkO3HKsE"]}' \
    > test.out 2>&1
eval_tap $? 112 'CreateKeyGroup' test.out

#- 113 GetKeyGroupByBoothName
eval_tap 0 113 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 114 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'p6KlqwW4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'GetKeyGroup' test.out

#- 115 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'djrexcbH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "dEtoQvpV", "name": "344RctmT", "status": "ACTIVE", "tags": ["K0HzYviT", "gYmx82JV", "BRLPZ6Iz"]}' \
    > test.out 2>&1
eval_tap $? 115 'UpdateKeyGroup' test.out

#- 116 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '8tne5dbg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetKeyGroupDynamic' test.out

#- 117 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'uBF6Gsvv' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '23' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 117 'ListKeys' test.out

#- 118 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '8jHz9x7X' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 118 'UploadKeys' test.out

#- 119 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'ZIjU4IK9' \
    --limit '22' \
    --offset '47' \
    --orderNos 'OLaZaMph,KCqTq3EV,heJjoEEX' \
    --sortBy 'BLIxGnNu' \
    --startTime 'hoJM3WWP' \
    --status 'FULFILLED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 119 'QueryOrders' test.out

#- 120 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 120 'GetOrderStatistics' test.out

#- 121 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Mb48jISd' \
    > test.out 2>&1
eval_tap $? 121 'GetOrder' test.out

#- 122 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '97KORRhx' \
    --body '{"description": "SWLWLNfH"}' \
    > test.out 2>&1
eval_tap $? 122 'RefundOrder' test.out

#- 123 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'GetPaymentCallbackConfig' test.out

#- 124 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "cPAGv6c1", "privateKey": "ESC6hZYT"}' \
    > test.out 2>&1
eval_tap $? 124 'UpdatePaymentCallbackConfig' test.out

#- 125 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'YZbzf5aA' \
    --externalId 'NNNs5kgS' \
    --limit '48' \
    --notificationSource 'ADYEN' \
    --notificationType 'BqabUXOG' \
    --offset '21' \
    --paymentOrderNo 'WJO5vzzX' \
    --startDate 'Zj08a6K1' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentNotifications' test.out

#- 126 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId '9NvBQZSJ' \
    --limit '85' \
    --offset '56' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 126 'QueryPaymentOrders' test.out

#- 127 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "JZkDnEiy", "currencyNamespace": "fa2LrnpZ", "customParameters": {"xNnLRH36": {}, "bqS2oFY7": {}, "6PU1AziB": {}}, "description": "OHEAj1cT", "extOrderNo": "3u6Zc2Fb", "extUserId": "rTFznTgD", "itemType": "OPTIONBOX", "language": "dju_vTpB-sJ", "metadata": {"SCdnFKLc": "0xcTjqjd", "cEfU61OJ": "YMnW49rW", "ynp1ck1v": "T90C6o86"}, "notifyUrl": "cSRL9cgb", "omitNotification": false, "platform": "JktyBdxk", "price": 65, "recurringPaymentOrderNo": "KrEWFw9G", "region": "YxjiiOQA", "returnUrl": "D77ci0vf", "sandbox": false, "sku": "sxsChScl", "subscriptionId": "Skb5aBi9", "targetNamespace": "K9zyv6gF", "targetUserId": "ZXI5nXJ7", "title": "hLi6Hwew"}' \
    > test.out 2>&1
eval_tap $? 127 'CreatePaymentOrderByDedicated' test.out

#- 128 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'eRmyo91d' \
    > test.out 2>&1
eval_tap $? 128 'ListExtOrderNoByExtTxId' test.out

#- 129 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'In7QqXBD' \
    > test.out 2>&1
eval_tap $? 129 'GetPaymentOrder' test.out

#- 130 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XJcrqKmX' \
    --body '{"extTxId": "DwoEV6tC", "paymentMethod": "drxw1KOP", "paymentProvider": "ALIPAY"}' \
    > test.out 2>&1
eval_tap $? 130 'ChargePaymentOrder' test.out

#- 131 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8ce0KbNN' \
    --body '{"description": "7Ycl2Jfm"}' \
    > test.out 2>&1
eval_tap $? 131 'RefundPaymentOrderByDedicated' test.out

#- 132 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QplvGjVQ' \
    --body '{"amount": 21, "currencyCode": "aebjfgGu", "notifyType": "REFUND", "paymentProvider": "ALIPAY", "salesTax": 30, "vat": 86}' \
    > test.out 2>&1
eval_tap $? 132 'SimulatePaymentOrderNotification' test.out

#- 133 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WJlfglLM' \
    > test.out 2>&1
eval_tap $? 133 'GetPaymentOrderChargeStatus' test.out

#- 134 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 134 'GetPlatformWalletConfig' test.out

#- 135 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["IOS", "GooglePlay", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 135 'UpdatePlatformWalletConfig' test.out

#- 136 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 136 'ResetPlatformWalletConfig' test.out

#- 137 GetPaymentCallbackConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'GetPaymentCallbackConfig1' test.out

#- 138 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateRevocationConfig' test.out

#- 139 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'DeleteRevocationConfig' test.out

#- 140 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'CHmj763v' \
    --limit '78' \
    --offset '46' \
    --source 'DLC' \
    --startTime 'tYEJTSiX' \
    --status 'FAIL' \
    --transactionId 'tDtetoQV' \
    --userId 'FL8LNW11' \
    > test.out 2>&1
eval_tap $? 140 'QueryRevocationHistories' test.out

#- 141 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "vtpaTxi7", "eventTopic": "k489jRCn", "maxAwarded": 37, "maxAwardedPerUser": 2, "namespaceExpression": "qFTi1t53", "rewardCode": "0Wj1WfzI", "rewardConditions": [{"condition": "vc3VlSXr", "conditionName": "A3XUGud4", "eventName": "tVjmxEf4", "rewardItems": [{"duration": 43, "itemId": "ak7ISDrB", "quantity": 97}, {"duration": 70, "itemId": "g6NuDZvP", "quantity": 3}, {"duration": 33, "itemId": "1kuUfNfU", "quantity": 60}]}, {"condition": "TyBG5dCU", "conditionName": "oExnKfV3", "eventName": "869IN4V1", "rewardItems": [{"duration": 82, "itemId": "XMGBA6JX", "quantity": 61}, {"duration": 63, "itemId": "pA1tIC45", "quantity": 58}, {"duration": 16, "itemId": "0oaGouFu", "quantity": 15}]}, {"condition": "Bhtzn8jA", "conditionName": "dTn6xBhr", "eventName": "ciryLm67", "rewardItems": [{"duration": 35, "itemId": "wC1uuokp", "quantity": 0}, {"duration": 92, "itemId": "IjL0Vxe5", "quantity": 28}, {"duration": 77, "itemId": "l5TPC5GO", "quantity": 61}]}], "userIdExpression": "xOgvDc7x"}' \
    > test.out 2>&1
eval_tap $? 141 'CreateReward' test.out

#- 142 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'MrRKvw8I' \
    --limit '92' \
    --offset '37' \
    --sortBy 'rewardCode:desc,namespace:asc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 142 'QueryRewards' test.out

#- 143 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 143 'ExportRewards' test.out

#- 144 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 144 'ImportRewards' test.out

#- 145 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'KmCRRXBx' \
    > test.out 2>&1
eval_tap $? 145 'GetReward' test.out

#- 146 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'lalCHtWl' \
    --body '{"description": "KxLpS8fL", "eventTopic": "WoQ5nuJh", "maxAwarded": 1, "maxAwardedPerUser": 40, "namespaceExpression": "j2EyIknf", "rewardCode": "LDpgHnMO", "rewardConditions": [{"condition": "n8nc3gUZ", "conditionName": "8ZFyyEr0", "eventName": "KBXuJBqK", "rewardItems": [{"duration": 87, "itemId": "M18uux9x", "quantity": 57}, {"duration": 56, "itemId": "omQFPFWy", "quantity": 4}, {"duration": 47, "itemId": "Yapx7C47", "quantity": 78}]}, {"condition": "etqgfOJD", "conditionName": "UT0uKAPr", "eventName": "ARya2IMl", "rewardItems": [{"duration": 81, "itemId": "3bNLWHAb", "quantity": 58}, {"duration": 96, "itemId": "Zixe2cQ6", "quantity": 83}, {"duration": 5, "itemId": "30lpzcBQ", "quantity": 78}]}, {"condition": "cnkpU9oV", "conditionName": "zl2kBuLF", "eventName": "XIeCEKZU", "rewardItems": [{"duration": 94, "itemId": "H34B6wVd", "quantity": 19}, {"duration": 17, "itemId": "24acYHbr", "quantity": 36}, {"duration": 100, "itemId": "yHB6GO9z", "quantity": 85}]}], "userIdExpression": "jzMO3Afm"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateReward' test.out

#- 147 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'OS5mQNyR' \
    > test.out 2>&1
eval_tap $? 147 'DeleteReward' test.out

#- 148 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'PZFPNP56' \
    --body '{"payload": {"l1AT6OLK": {}, "mZhCZxxP": {}, "PdPwOtEu": {}}}' \
    > test.out 2>&1
eval_tap $? 148 'CheckEventCondition' test.out

#- 149 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WBSO2jJe' \
    --body '{"conditionName": "pUnEEgja", "userId": "2mIE2kLT"}' \
    > test.out 2>&1
eval_tap $? 149 'DeleteRewardConditionRecord' test.out

#- 150 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'nJwc5Xmk' \
    --limit '58' \
    --offset '25' \
    --start 'uL5W4tKt' \
    --storeId '6G3j9LYd' \
    --viewId 'G7xVPqBq' \
    > test.out 2>&1
eval_tap $? 150 'QuerySections' test.out

#- 151 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'e9RDQMBS' \
    --body '{"active": true, "displayOrder": 53, "endDate": "1978-09-14T00:00:00Z", "ext": {"KBfBfDlr": {}, "QQuAc10D": {}, "jjwMv4vr": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 84, "itemCount": 49, "rule": "SEQUENCE"}, "items": [{"id": "tvhQIyLa", "sku": "rjaLOKnX"}, {"id": "51yAB8Pa", "sku": "3uNGKhaL"}, {"id": "lJzJMSnJ", "sku": "IIgsAVma"}], "localizations": {"GYxUX1B9": {"description": "oVuzG2Cn", "localExt": {"YX2YBF2g": {}, "7TVtzYEH": {}, "Uodh3iUf": {}}, "longDescription": "BthbepUC", "title": "TWiZ1uqh"}, "7GAi4FEI": {"description": "u44u83ZL", "localExt": {"RxYlYqlp": {}, "q03BGdIk": {}, "4oEogFVG": {}}, "longDescription": "R71rJOBy", "title": "6lsj1AKG"}, "BjnHmaAu": {"description": "4YK87DYA", "localExt": {"WWcbcbGW": {}, "mKgE8CZ4": {}, "AELr5lra": {}}, "longDescription": "a5v5P5Cj", "title": "8hgFsqHC"}}, "name": "9h5JPiME", "rotationType": "FIXED_PERIOD", "startDate": "1982-02-20T00:00:00Z", "viewId": "Psa9YD92"}' \
    > test.out 2>&1
eval_tap $? 151 'CreateSection' test.out

#- 152 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CX0rITaj' \
    > test.out 2>&1
eval_tap $? 152 'PurgeExpiredSection' test.out

#- 153 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'pwHITGeH' \
    --storeId 'TnqRbzBB' \
    > test.out 2>&1
eval_tap $? 153 'GetSection' test.out

#- 154 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '9ZFgJbQ3' \
    --storeId 'Fj1umx4I' \
    --body '{"active": true, "displayOrder": 59, "endDate": "1984-02-09T00:00:00Z", "ext": {"kMJ7cudf": {}, "4r916GPr": {}, "hn2etVIQ": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 24, "itemCount": 89, "rule": "SEQUENCE"}, "items": [{"id": "80YJ41U4", "sku": "ooQ980yw"}, {"id": "mg1pWpWi", "sku": "t1QC7FKe"}, {"id": "0fnHUlmU", "sku": "1unGKM0t"}], "localizations": {"gfeWy47b": {"description": "bwMI4gGm", "localExt": {"vK9gW596": {}, "FwBNrFXt": {}, "3TAuKBwB": {}}, "longDescription": "cD12ae6r", "title": "3hHwya4N"}, "pdOzg3hr": {"description": "6ucHf7db", "localExt": {"h2iKNUl0": {}, "qJqzoKMR": {}, "MG541PAi": {}}, "longDescription": "NjULsx4S", "title": "nKNXLMUa"}, "DSwwQlnN": {"description": "RZJHBSB4", "localExt": {"fZWEFIZs": {}, "28Ff1kZp": {}, "1Zktx3N7": {}}, "longDescription": "WNMYIfcD", "title": "KbLu8pnK"}}, "name": "34oA1keY", "rotationType": "NONE", "startDate": "1992-06-23T00:00:00Z", "viewId": "KUAFTVYe"}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateSection' test.out

#- 155 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'lIlGJg9w' \
    --storeId 'dc8bihhW' \
    > test.out 2>&1
eval_tap $? 155 'DeleteSection' test.out

#- 156 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'ListStores' test.out

#- 157 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "jfZpfcFB", "defaultRegion": "UsnnDJlm", "description": "D1iEokbU", "supportedLanguages": ["iYzCQh2i", "NTwtnohd", "dMzMTQ9P"], "supportedRegions": ["7sYLDWAJ", "OA75K4BY", "J2fkqYJo"], "title": "F2FI3vyy"}' \
    > test.out 2>&1
eval_tap $? 157 'CreateStore' test.out

#- 158 ImportStore
eval_tap 0 158 'ImportStore # SKIP deprecated' test.out

#- 159 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetPublishedStore' test.out

#- 160 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 160 'DeletePublishedStore' test.out

#- 161 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetPublishedStoreBackup' test.out

#- 162 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 162 'RollbackPublishedStore' test.out

#- 163 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qRzc20O7' \
    > test.out 2>&1
eval_tap $? 163 'GetStore' test.out

#- 164 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FdsJP1G9' \
    --body '{"defaultLanguage": "tyBTfERX", "defaultRegion": "dvgD1Qf7", "description": "Ot2DkUt3", "supportedLanguages": ["yexZBRvx", "YnEBhXtA", "VxCd3meT"], "supportedRegions": ["rT7cF9oV", "Ch89wNOk", "KYssVejc"], "title": "L3kR3hCG"}' \
    > test.out 2>&1
eval_tap $? 164 'UpdateStore' test.out

#- 165 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NgaJmuAL' \
    > test.out 2>&1
eval_tap $? 165 'DeleteStore' test.out

#- 166 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lMQl9RLr' \
    --action 'DELETE' \
    --itemSku 'IkaQEl1i' \
    --itemType 'BUNDLE' \
    --limit '85' \
    --offset '76' \
    --selected  \
    --sortBy 'createdAt:asc,createdAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd '6hI6IpGc' \
    --updatedAtStart 'ToWgFvdR' \
    > test.out 2>&1
eval_tap $? 166 'QueryChanges' test.out

#- 167 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hG9NwV3z' \
    > test.out 2>&1
eval_tap $? 167 'PublishAll' test.out

#- 168 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DuqVlVTy' \
    > test.out 2>&1
eval_tap $? 168 'PublishSelected' test.out

#- 169 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pcYPK8Ix' \
    > test.out 2>&1
eval_tap $? 169 'SelectAllRecords' test.out

#- 170 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rSZuxWl0' \
    --action 'UPDATE' \
    --itemSku '0bitNQLz' \
    --itemType 'INGAMEITEM' \
    --type 'ITEM' \
    --updatedAtEnd 'RoWnR0Ab' \
    --updatedAtStart 'kCPY70Fm' \
    > test.out 2>&1
eval_tap $? 170 'GetStatistic' test.out

#- 171 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vviVIBbc' \
    > test.out 2>&1
eval_tap $? 171 'UnselectAllRecords' test.out

#- 172 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'ujF8Vk5q' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'b8NhWWwa' \
    > test.out 2>&1
eval_tap $? 172 'SelectRecord' test.out

#- 173 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'xyMchkt8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'l5IPSrwr' \
    > test.out 2>&1
eval_tap $? 173 'UnselectRecord' test.out

#- 174 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Jl7wYIVw' \
    --targetStoreId '13NCo9yX' \
    > test.out 2>&1
eval_tap $? 174 'CloneStore' test.out

#- 175 ExportStore
eval_tap 0 175 'ExportStore # SKIP deprecated' test.out

#- 176 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'G6Dl5TFw' \
    --limit '57' \
    --offset '58' \
    --sku 'Y6HKXAbl' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'VGgSH8MG' \
    > test.out 2>&1
eval_tap $? 176 'QuerySubscriptions' test.out

#- 177 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZGwiVj7e' \
    > test.out 2>&1
eval_tap $? 177 'RecurringChargeSubscription' test.out

#- 178 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'DTaka9AB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetTicketDynamic' test.out

#- 179 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'fX1IByPE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "OuPhGspR"}' \
    > test.out 2>&1
eval_tap $? 179 'DecreaseTicketSale' test.out

#- 180 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'i3bhPQvB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'GetTicketBoothID' test.out

#- 181 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'BJI5Jxyt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 32, "orderNo": "EvHyLmcv"}' \
    > test.out 2>&1
eval_tap $? 181 'IncreaseTicketSale' test.out

#- 182 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZZOdwe1' \
    --body '{"achievements": [{"id": "x8RjU6Bi", "value": 33}, {"id": "JXE52sUB", "value": 56}, {"id": "gWSRxZ8N", "value": 76}], "steamUserId": "UQ2fg3V1"}' \
    > test.out 2>&1
eval_tap $? 182 'UnlockSteamUserAchievement' test.out

#- 183 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'o2x0hL5D' \
    --xboxUserId 'uBDqMyIA' \
    > test.out 2>&1
eval_tap $? 183 'GetXblUserAchievements' test.out

#- 184 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWze94ME' \
    --body '{"achievements": [{"id": "dJFAy2JT", "value": 23}, {"id": "upATO8uX", "value": 39}, {"id": "qJEd6eqq", "value": 38}], "serviceConfigId": "SjDAM0Ri", "titleId": "w8wLYW3n", "xboxUserId": "4F3LD1ED"}' \
    > test.out 2>&1
eval_tap $? 184 'UpdateXblUserAchievement' test.out

#- 185 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'wBXw5uBY' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeCampaign' test.out

#- 186 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQZOzATN' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeEntitlement' test.out

#- 187 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'SV9E9yyN' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeFulfillment' test.out

#- 188 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'b7yaLXzA' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizeIntegration' test.out

#- 189 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'VYymOuhC' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizeOrder' test.out

#- 190 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'kZu4htrs' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizePayment' test.out

#- 191 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'f8eIFSov' \
    > test.out 2>&1
eval_tap $? 191 'AnonymizeRevocation' test.out

#- 192 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'TGXaMsq8' \
    > test.out 2>&1
eval_tap $? 192 'AnonymizeSubscription' test.out

#- 193 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'ePN1oco2' \
    > test.out 2>&1
eval_tap $? 193 'AnonymizeWallet' test.out

#- 194 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'jx8Upe8S' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 194 'GetUserDLC' test.out

#- 195 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'esc6y68w' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'NBYl9iCq' \
    --features 'fW6rqGOQ,ny4ij4ys,YPonb59g' \
    --itemId 'QffkNOmu,bxEJr2qE,AuJbpZSr' \
    --limit '5' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 195 'QueryUserEntitlements' test.out

#- 196 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'bc4LWfKa' \
    --body '[{"endDate": "1996-12-18T00:00:00Z", "grantedCode": "5c1tP5TD", "itemId": "uI5f6m4K", "itemNamespace": "C07CnsZe", "language": "HdRp_UfaY", "quantity": 80, "region": "eXZOYwbw", "source": "IAP", "startDate": "1989-11-10T00:00:00Z", "storeId": "YdMqGegc"}, {"endDate": "1974-04-26T00:00:00Z", "grantedCode": "3eRvBZXN", "itemId": "3cjIXmFW", "itemNamespace": "RJnj8xN7", "language": "eAqu-eLqo_qd", "quantity": 99, "region": "9ZDj4E4m", "source": "PURCHASE", "startDate": "1998-11-03T00:00:00Z", "storeId": "2FNXypoO"}, {"endDate": "1990-04-01T00:00:00Z", "grantedCode": "l13j84P0", "itemId": "KqirJ4Pk", "itemNamespace": "MFtsnFfz", "language": "fzX_SFcH_988", "quantity": 97, "region": "vLtz50D3", "source": "PROMOTION", "startDate": "1977-05-08T00:00:00Z", "storeId": "NHb6Lx8e"}]' \
    > test.out 2>&1
eval_tap $? 196 'GrantUserEntitlement' test.out

#- 197 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8SGNwEQ' \
    --activeOnly  \
    --appId 'O8dYXvBS' \
    > test.out 2>&1
eval_tap $? 197 'GetUserAppEntitlementByAppId' test.out

#- 198 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'YvJBwb6C' \
    --activeOnly  \
    --limit '19' \
    --offset '19' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 198 'QueryUserEntitlementsByAppType' test.out

#- 199 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRf2VJet' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'v1ic9gva' \
    > test.out 2>&1
eval_tap $? 199 'GetUserEntitlementByItemId' test.out

#- 200 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'gF2cSuzt' \
    --ids 'sJ5tj64g,V7nmDk29,mcjSuz9v' \
    > test.out 2>&1
eval_tap $? 200 'GetUserActiveEntitlementsByItemIds' test.out

#- 201 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'bNStqPtQ' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku 'Tb7iYdmN' \
    > test.out 2>&1
eval_tap $? 201 'GetUserEntitlementBySku' test.out

#- 202 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZWosrsVB' \
    --appIds 'PZ64j0HU,ONscofwY,LQcDvkaE' \
    --itemIds 'IIPoJT83,zEGXmVBZ,LyrH9J7B' \
    --skus 'oysmaORL,kP5hc2Fh,04JTsqDT' \
    > test.out 2>&1
eval_tap $? 202 'ExistsAnyUserActiveEntitlement' test.out

#- 203 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynCewqJl' \
    --itemIds 'igLlRxOe,lKykICRx,F6HtlER2' \
    > test.out 2>&1
eval_tap $? 203 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 204 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'txs4qrNA' \
    --appId 'RATn6KXO' \
    > test.out 2>&1
eval_tap $? 204 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 205 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'utlYBbLh' \
    --entitlementClazz 'MEDIA' \
    --itemId 'ERMNpqWb' \
    > test.out 2>&1
eval_tap $? 205 'GetUserEntitlementOwnershipByItemId' test.out

#- 206 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '51y5RUzv' \
    --ids 'MfTkPy0f,GvTGgfLK,sg0b1Bq7' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlementOwnershipByItemIds' test.out

#- 207 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '8cE5O5pm' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'Nyq9odan' \
    > test.out 2>&1
eval_tap $? 207 'GetUserEntitlementOwnershipBySku' test.out

#- 208 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hR1Zrm3t' \
    --entitlementIds 'hUvV87yf' \
    > test.out 2>&1
eval_tap $? 208 'RevokeUserEntitlements' test.out

#- 209 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'kycLSVdl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eSaAylsm' \
    > test.out 2>&1
eval_tap $? 209 'GetUserEntitlement' test.out

#- 210 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'LYe2phYO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gT5kDTyP' \
    --body '{"endDate": "1977-09-06T00:00:00Z", "nullFieldList": ["dKF7NXEj", "rJMki8jv", "c3P8Gwjg"], "startDate": "1999-10-10T00:00:00Z", "status": "CONSUMED", "useCount": 83}' \
    > test.out 2>&1
eval_tap $? 210 'UpdateUserEntitlement' test.out

#- 211 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'ciRhVZ2D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eoODXMzL' \
    --body '{"options": ["SrzoiBnY", "i5UWs3tY", "lYeMoCim"], "requestId": "JySocRvU", "useCount": 99}' \
    > test.out 2>&1
eval_tap $? 211 'ConsumeUserEntitlement' test.out

#- 212 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'je5cPnmG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jTvYa5Pq' \
    > test.out 2>&1
eval_tap $? 212 'DisableUserEntitlement' test.out

#- 213 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'x1K7qcAo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijBPAp6E' \
    > test.out 2>&1
eval_tap $? 213 'EnableUserEntitlement' test.out

#- 214 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Pb988Nzx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDKVpULj' \
    > test.out 2>&1
eval_tap $? 214 'GetUserEntitlementHistories' test.out

#- 215 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'jiw3NeVG' \
    --namespace "$AB_NAMESPACE" \
    --userId '4DJi9DaM' \
    > test.out 2>&1
eval_tap $? 215 'RevokeUserEntitlement' test.out

#- 216 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'rc0WFgKj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E945x2CP' \
    --body '{"requestId": "VYYG9Wvo", "useCount": 67}' \
    > test.out 2>&1
eval_tap $? 216 'SellUserEntitlement' test.out

#- 217 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzvTScdb' \
    --body '{"duration": 76, "endDate": "1997-08-06T00:00:00Z", "itemId": "fxnUNcwj", "itemSku": "r7gSGhnf", "language": "uF4WZiQV", "order": {"currency": {"currencyCode": "ICVpWd3U", "currencySymbol": "M08gMXhd", "currencyType": "REAL", "decimals": 90, "namespace": "3juXW4Jp"}, "ext": {"rIb3CJCA": {}, "tvSG8Cfa": {}, "9dzOJDGC": {}}, "free": true}, "orderNo": "IOFjeXbs", "origin": "GooglePlay", "quantity": 13, "region": "7r1SQw80", "source": "REWARD", "startDate": "1985-02-11T00:00:00Z", "storeId": "wqRJTzrH"}' \
    > test.out 2>&1
eval_tap $? 217 'FulfillItem' test.out

#- 218 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZWUsq5l' \
    --body '{"code": "Qo2jy29E", "language": "CICG-xZXx_515", "region": "czRpdk0H"}' \
    > test.out 2>&1
eval_tap $? 218 'RedeemCode' test.out

#- 219 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ATGylx2J' \
    --body '{"origin": "Twitch", "rewards": [{"currency": {"currencyCode": "e8y1jorN", "namespace": "sg9ZKYCK"}, "item": {"itemId": "oISyXtHz", "itemSku": "oWGdYohx", "itemType": "Mp3uOQIy"}, "quantity": 2, "type": "ITEM"}, {"currency": {"currencyCode": "zkVf6Kgp", "namespace": "KOcn3tMD"}, "item": {"itemId": "9UT67bOw", "itemSku": "ugFDa6wU", "itemType": "QvehKqwC"}, "quantity": 16, "type": "ITEM"}, {"currency": {"currencyCode": "86XmRkCE", "namespace": "cfHDCdl5"}, "item": {"itemId": "9Wp9A3tX", "itemSku": "Gve6DdK6", "itemType": "uvg8f2cI"}, "quantity": 29, "type": "ITEM"}], "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 219 'FulfillRewards' test.out

#- 220 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'yk9fxtvs' \
    --endTime 'geAxo57n' \
    --limit '76' \
    --offset '72' \
    --productId 'AbZpsbJ4' \
    --startTime 'Iu5KJ0yn' \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserIAPOrders' test.out

#- 221 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'GBlacDCd' \
    > test.out 2>&1
eval_tap $? 221 'QueryAllUserIAPOrders' test.out

#- 222 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fe8ATUqV' \
    --endTime 'xcSthrpn' \
    --limit '78' \
    --offset '88' \
    --startTime 'UBsnUfuQ' \
    --status 'SUCCESS' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserIAPConsumeHistory' test.out

#- 223 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cSbUt5UG' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "jKN_CwRS", "productId": "1cQwVEtA", "region": "r5kKKAo9", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 223 'MockFulfillIAPItem' test.out

#- 224 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '2Cqm84jV' \
    --itemId 'i9kIpqgr' \
    --limit '53' \
    --offset '85' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 224 'QueryUserOrders' test.out

#- 225 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'D9CeDEdC' \
    --body '{"currencyCode": "nnL6Kt1B", "currencyNamespace": "jj3b8QM8", "discountedPrice": 89, "ext": {"wNOl4k8r": {}, "VNrm8drv": {}, "8QD2JOe2": {}}, "itemId": "Ntz7EFvo", "language": "wPgIGuet", "options": {"skipPriceValidation": true}, "platform": "Xbox", "price": 79, "quantity": 40, "region": "qXCQMAqQ", "returnUrl": "2ZRGzNtr", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 225 'AdminCreateUserOrder' test.out

#- 226 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hFa9XU8m' \
    --itemId 'osluiHZJ' \
    > test.out 2>&1
eval_tap $? 226 'CountOfPurchasedItem' test.out

#- 227 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7O8sAQ32' \
    --userId 'wj9uaDzs' \
    > test.out 2>&1
eval_tap $? 227 'GetUserOrder' test.out

#- 228 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'r9xYiWRu' \
    --userId 'uzQJiLc1' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "F6MMqWpd"}' \
    > test.out 2>&1
eval_tap $? 228 'UpdateUserOrderStatus' test.out

#- 229 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EJsPoaIb' \
    --userId 'Yz8cK5jl' \
    > test.out 2>&1
eval_tap $? 229 'FulfillUserOrder' test.out

#- 230 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pJdre5ur' \
    --userId '6yvWJDdv' \
    > test.out 2>&1
eval_tap $? 230 'GetUserOrderGrant' test.out

#- 231 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'M7T7PX2v' \
    --userId 'amIRZHzs' \
    > test.out 2>&1
eval_tap $? 231 'GetUserOrderHistories' test.out

#- 232 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'IYOCUoiC' \
    --userId 'XNjrdQL2' \
    --body '{"additionalData": {"cardSummary": "jdx1eIba"}, "authorisedTime": "1998-03-25T00:00:00Z", "chargebackReversedTime": "1980-08-22T00:00:00Z", "chargebackTime": "1985-10-01T00:00:00Z", "chargedTime": "1971-06-02T00:00:00Z", "createdTime": "1986-10-21T00:00:00Z", "currency": {"currencyCode": "okxXxkWZ", "currencySymbol": "bjf7GZxa", "currencyType": "REAL", "decimals": 26, "namespace": "ssQmjo69"}, "customParameters": {"wohJFyTN": {}, "k5FGUPhR": {}, "4LEZvz3E": {}}, "extOrderNo": "jFR7996U", "extTxId": "g5m4axDV", "extUserId": "5uTcYsoa", "issuedAt": "1974-07-27T00:00:00Z", "metadata": {"rELQ1btj": "JOqQMgZW", "AU6E92nH": "Jzvw7tnY", "tGfv0EJy": "jBu4EzwR"}, "namespace": "jD7jmQJe", "nonceStr": "FPghqamS", "paymentMethod": "c5y0X48e", "paymentMethodFee": 94, "paymentOrderNo": "lpB8HZUt", "paymentProvider": "ADYEN", "paymentProviderFee": 0, "paymentStationUrl": "9Z5BTsEA", "price": 37, "refundedTime": "1986-01-28T00:00:00Z", "salesTax": 11, "sandbox": false, "sku": "WhT5B4We", "status": "AUTHORISE_FAILED", "statusReason": "xRowfNoj", "subscriptionId": "zPXI2v0p", "subtotalPrice": 35, "targetNamespace": "GnbjmPDK", "targetUserId": "FS6u9FHu", "tax": 45, "totalPrice": 81, "totalTax": 81, "txEndTime": "1991-05-14T00:00:00Z", "type": "Yhic03qG", "userId": "Eg5fNzBV", "vat": 36}' \
    > test.out 2>&1
eval_tap $? 232 'ProcessUserOrderNotification' test.out

#- 233 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Yl4csFq6' \
    --userId '5cU66yJa' \
    > test.out 2>&1
eval_tap $? 233 'DownloadUserOrderReceipt' test.out

#- 234 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'j4ovoKWE' \
    --body '{"currencyCode": "4EW0sw8v", "currencyNamespace": "5peiuxoB", "customParameters": {"JATauyD3": {}, "XCXVMiyE": {}, "vMf9yilU": {}}, "description": "Eujk6oqY", "extOrderNo": "o1HQYTFz", "extUserId": "wdOMdupw", "itemType": "MEDIA", "language": "pn-BFCh_YD", "metadata": {"vZbOy1T4": "hfwkuVyk", "H4RpfmjI": "XFGZ5PKd", "babJIkNn": "t9P1Tkm0"}, "notifyUrl": "8luh4dpP", "omitNotification": true, "platform": "NHglOVuN", "price": 54, "recurringPaymentOrderNo": "9LzNeJnB", "region": "urh54CWb", "returnUrl": "Yb0Pebyt", "sandbox": true, "sku": "b4DGscjw", "subscriptionId": "rizsFUgY", "title": "wbaLvqvQ"}' \
    > test.out 2>&1
eval_tap $? 234 'CreateUserPaymentOrder' test.out

#- 235 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2NbmDITu' \
    --userId 'ymTBjn3d' \
    --body '{"description": "2sFzMS3Q"}' \
    > test.out 2>&1
eval_tap $? 235 'RefundUserPaymentOrder' test.out

#- 236 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'aVjZF7Ax' \
    --body '{"code": "6115Kg9U", "orderNo": "8vrQJXQx"}' \
    > test.out 2>&1
eval_tap $? 236 'ApplyUserRedemption' test.out

#- 237 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIbVi2CL' \
    --body '{"meta": {"Ek277Ivj": {}, "j1A647XQ": {}, "3koaAfZI": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "IOS", "currencyCode": "4Ul2Iaie", "namespace": "EbPSE7TG"}, "entitlement": {"entitlementId": "keHsYsW9"}, "item": {"itemIdentity": "oGBN1pYM", "itemIdentityType": "ITEM_SKU", "origin": "Playstation"}, "quantity": 80, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "IOS", "currencyCode": "PZTlMlUv", "namespace": "FEiGprcN"}, "entitlement": {"entitlementId": "SQ9kEeXB"}, "item": {"itemIdentity": "Z6FVrBzy", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 51, "type": "ITEM"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "KXttgAI2", "namespace": "QdWJFLmo"}, "entitlement": {"entitlementId": "PEgd8EMs"}, "item": {"itemIdentity": "pOs8nkic", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 71, "type": "CURRENCY"}], "source": "OTHER", "transactionId": "5vyUMAAm"}' \
    > test.out 2>&1
eval_tap $? 237 'DoRevocation' test.out

#- 238 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'IHYbsxG5' \
    --chargeStatus 'CHARGED' \
    --itemId 'FXb88SbL' \
    --limit '84' \
    --offset '0' \
    --sku 'oa8UJ34T' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 238 'QueryUserSubscriptions' test.out

#- 239 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'XQJWszvT' \
    --excludeSystem  \
    --limit '88' \
    --offset '27' \
    --subscriptionId 'EuALzDNp' \
    > test.out 2>&1
eval_tap $? 239 'GetUserSubscriptionActivities' test.out

#- 240 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '1SZ58aDl' \
    --body '{"grantDays": 24, "itemId": "IqFUmgUS", "language": "MM5au8GJ", "reason": "T0mkVPI6", "region": "zUtf3QaJ", "source": "PGrTNcXX"}' \
    > test.out 2>&1
eval_tap $? 240 'PlatformSubscribeSubscription' test.out

#- 241 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TUIggoH8' \
    --itemId '9QNmI17U' \
    > test.out 2>&1
eval_tap $? 241 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 242 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Db19R6H7' \
    --userId 'r1ta3m7j' \
    > test.out 2>&1
eval_tap $? 242 'GetUserSubscription' test.out

#- 243 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'K5pxe82p' \
    --userId 'gFiAS6pi' \
    > test.out 2>&1
eval_tap $? 243 'DeleteUserSubscription' test.out

#- 244 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Izmc8rKr' \
    --userId 'KEPGSAco' \
    --force  \
    --body '{"immediate": false, "reason": "zfjDZZBm"}' \
    > test.out 2>&1
eval_tap $? 244 'CancelSubscription' test.out

#- 245 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Oau6syme' \
    --userId '06c6SKLc' \
    --body '{"grantDays": 82, "reason": "mEC3IXl5"}' \
    > test.out 2>&1
eval_tap $? 245 'GrantDaysToSubscription' test.out

#- 246 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XCbkOfHa' \
    --userId 'Gr5kdazl' \
    --excludeFree  \
    --limit '50' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 246 'GetUserSubscriptionBillingHistories' test.out

#- 247 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'pvt6lSLf' \
    --userId 'U7HByGXP' \
    --body '{"additionalData": {"cardSummary": "Mqxj4hBg"}, "authorisedTime": "1995-05-07T00:00:00Z", "chargebackReversedTime": "1997-01-02T00:00:00Z", "chargebackTime": "1999-04-30T00:00:00Z", "chargedTime": "1997-08-01T00:00:00Z", "createdTime": "1992-07-10T00:00:00Z", "currency": {"currencyCode": "GRakUbcG", "currencySymbol": "7PcR4eiU", "currencyType": "VIRTUAL", "decimals": 70, "namespace": "oJcaRMEb"}, "customParameters": {"15LBlTVu": {}, "fc5ZyODR": {}, "2NVyn4PR": {}}, "extOrderNo": "qf3eRbZq", "extTxId": "BAoKGcVC", "extUserId": "dMiSNV4q", "issuedAt": "1985-05-26T00:00:00Z", "metadata": {"QF6QcAiJ": "pXIrgroi", "xptZhckU": "TGkcBOE4", "qMcH1Kyi": "8ZFvGcV8"}, "namespace": "DY0XOkDs", "nonceStr": "txZcY1Hg", "paymentMethod": "AnZV4IOg", "paymentMethodFee": 24, "paymentOrderNo": "NW8Yc481", "paymentProvider": "ADYEN", "paymentProviderFee": 73, "paymentStationUrl": "YdvGxJAM", "price": 61, "refundedTime": "1982-12-22T00:00:00Z", "salesTax": 12, "sandbox": true, "sku": "wMUSuC3B", "status": "AUTHORISED", "statusReason": "ekFwO94V", "subscriptionId": "BCV9qJhW", "subtotalPrice": 44, "targetNamespace": "vVAyId6C", "targetUserId": "p85HVDsZ", "tax": 56, "totalPrice": 79, "totalTax": 87, "txEndTime": "1974-06-05T00:00:00Z", "type": "OnXuXsGT", "userId": "hYZrmm0w", "vat": 37}' \
    > test.out 2>&1
eval_tap $? 247 'ProcessUserSubscriptionNotification' test.out

#- 248 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'AvNF0Z0G' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kwxUNYyN' \
    --body '{"count": 45, "orderNo": "LjYsnign"}' \
    > test.out 2>&1
eval_tap $? 248 'AcquireUserTicket' test.out

#- 249 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7KcMF7f' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserCurrencyWallets' test.out

#- 250 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'uDbzRRYM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NXWUsp1t' \
    --body '{"allowOverdraft": false, "amount": 99, "balanceOrigin": "Epic", "reason": "jMZfOadp"}' \
    > test.out 2>&1
eval_tap $? 250 'DebitUserWalletByCurrencyCode' test.out

#- 251 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'gegCUjTd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i1Ehr8Ot' \
    --limit '35' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 251 'ListUserCurrencyTransactions' test.out

#- 252 CheckWallet
eval_tap 0 252 'CheckWallet # SKIP deprecated' test.out

#- 253 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'pNJ9R8Tu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ny4ejmVA' \
    --body '{"amount": 43, "expireAt": "1999-11-11T00:00:00Z", "origin": "System", "reason": "nSFbuxd4", "source": "REFUND"}' \
    > test.out 2>&1
eval_tap $? 253 'CreditUserWallet' test.out

#- 254 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '8QNUz0hF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FNbH6j2W' \
    --body '{"amount": 94, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 254 'PayWithUserWallet' test.out

#- 255 GetUserWallet
eval_tap 0 255 'GetUserWallet # SKIP deprecated' test.out

#- 256 DebitUserWallet
eval_tap 0 256 'DebitUserWallet # SKIP deprecated' test.out

#- 257 DisableUserWallet
eval_tap 0 257 'DisableUserWallet # SKIP deprecated' test.out

#- 258 EnableUserWallet
eval_tap 0 258 'EnableUserWallet # SKIP deprecated' test.out

#- 259 ListUserWalletTransactions
eval_tap 0 259 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 260 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c8pVkiyG' \
    > test.out 2>&1
eval_tap $? 260 'ListViews' test.out

#- 261 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sj5JdXzR' \
    --body '{"displayOrder": 49, "localizations": {"iFchQnVe": {"description": "q3g2AB2W", "localExt": {"IRUQmauI": {}, "Y5HXCZ0W": {}, "4XmWP0Hz": {}}, "longDescription": "SdiylLhV", "title": "Yszm8xY3"}, "3OQbumu2": {"description": "QHLyZNuy", "localExt": {"syM4OfCz": {}, "dQCXMAWn": {}, "f87YPNOe": {}}, "longDescription": "9Eevf1fh", "title": "Mg1E2k7Q"}, "LFrVgtX7": {"description": "y0fPOieD", "localExt": {"Cow2zXyF": {}, "FVpM87yq": {}, "EwEacQMT": {}}, "longDescription": "lqN4LKkx", "title": "J5v3SBaf"}}, "name": "nKNiMPbF"}' \
    > test.out 2>&1
eval_tap $? 261 'CreateView' test.out

#- 262 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'kFGA85W3' \
    --storeId 'HJkqgS2B' \
    > test.out 2>&1
eval_tap $? 262 'GetView' test.out

#- 263 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '37wwoPYO' \
    --storeId 'HiIsxmsL' \
    --body '{"displayOrder": 57, "localizations": {"vQaKyevW": {"description": "YtZjK6J2", "localExt": {"9v8MpBSp": {}, "o3AKRmnJ": {}, "kzJHAckU": {}}, "longDescription": "yBksYQfD", "title": "m0RNFwiz"}, "70tRVLMl": {"description": "Hi8i9gOV", "localExt": {"qajUWrgE": {}, "sWDtaKzn": {}, "8dZwnnGe": {}}, "longDescription": "ZsZVgbPz", "title": "PFbrOMZM"}, "gWkFN7Tp": {"description": "kx6GcfyO", "localExt": {"g6ZUrrp9": {}, "ubg9mndW": {}, "2JKmQafU": {}}, "longDescription": "s2bxYztO", "title": "EyVbKIf1"}}, "name": "ZbzgUwd8"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateView' test.out

#- 264 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'DHoCQykm' \
    --storeId 'XHYmkRlg' \
    > test.out 2>&1
eval_tap $? 264 'DeleteView' test.out

#- 265 QueryWallets
eval_tap 0 265 'QueryWallets # SKIP deprecated' test.out

#- 266 GetWallet
eval_tap 0 266 'GetWallet # SKIP deprecated' test.out

#- 267 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '7gYs6unP' \
    --end 'YQ9jNQN1' \
    --start 'di1ldhOh' \
    > test.out 2>&1
eval_tap $? 267 'SyncOrders' test.out

#- 268 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["6HvjnYuV", "7NfC4A2O", "DiZhbfb8"], "apiKey": "QqCyK1XH", "authoriseAsCapture": false, "blockedPaymentMethods": ["D6vl5eFd", "FfgK46Gj", "CWaP8huT"], "clientKey": "mnq3FGQn", "dropInSettings": "3Ahu5wxq", "liveEndpointUrlPrefix": "6oJq4mCh", "merchantAccount": "mQHQhO9I", "notificationHmacKey": "KBXDFQfX", "notificationPassword": "FD58sG6u", "notificationUsername": "DhFYlrzJ", "returnUrl": "BYSeMuJf", "settings": "QecutjS0"}' \
    > test.out 2>&1
eval_tap $? 268 'TestAdyenConfig' test.out

#- 269 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "29BiJWOG", "privateKey": "1m7MKclr", "publicKey": "5igjNTVI", "returnUrl": "trH2X78h"}' \
    > test.out 2>&1
eval_tap $? 269 'TestAliPayConfig' test.out

#- 270 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "xJgaVfw5", "secretKey": "Vnyq8OzT"}' \
    > test.out 2>&1
eval_tap $? 270 'TestCheckoutConfig' test.out

#- 271 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'E89WDNoM' \
    > test.out 2>&1
eval_tap $? 271 'DebugMatchedPaymentMerchantConfig' test.out

#- 272 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "cOmbfJrC", "clientSecret": "JQIj1haA", "returnUrl": "osKglqaC", "webHookId": "XE9ytpIO"}' \
    > test.out 2>&1
eval_tap $? 272 'TestPayPalConfig' test.out

#- 273 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["8btO3OwN", "EGSW5TaW", "4to7QCY2"], "publishableKey": "NGGvi9kg", "secretKey": "3rMIzNmh", "webhookSecret": "JTNQjKlw"}' \
    > test.out 2>&1
eval_tap $? 273 'TestStripeConfig' test.out

#- 274 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "jfJ3TJ2x", "key": "Vpge70Ws", "mchid": "LfgbZieR", "returnUrl": "vJI5sT9D"}' \
    > test.out 2>&1
eval_tap $? 274 'TestWxPayConfig' test.out

#- 275 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "H3DfLCv8", "flowCompletionUrl": "q4Thmq09", "merchantId": 2, "projectId": 8, "projectSecretKey": "BgPAYxrB"}' \
    > test.out 2>&1
eval_tap $? 275 'TestXsollaConfig' test.out

#- 276 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'E9jlnTgt' \
    > test.out 2>&1
eval_tap $? 276 'GetPaymentMerchantConfig' test.out

#- 277 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'gW33wDwD' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["9RKvQX4y", "FQFdrRoM", "6FoqCYw7"], "apiKey": "AlxO6qdF", "authoriseAsCapture": true, "blockedPaymentMethods": ["k0LEi26L", "s7mjRxNm", "vvNtjJNQ"], "clientKey": "epUTGhwl", "dropInSettings": "Y4lPzlsC", "liveEndpointUrlPrefix": "R5rVsyfc", "merchantAccount": "H7WjP7Hu", "notificationHmacKey": "Gz3b5WAE", "notificationPassword": "vdRF9bqM", "notificationUsername": "j4ro5B19", "returnUrl": "VE838c7O", "settings": "ydVw0zCq"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateAdyenConfig' test.out

#- 278 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'oMZvpIOO' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestAdyenConfigById' test.out

#- 279 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '97DmQ5ZO' \
    --sandbox  \
    --validate  \
    --body '{"appId": "zx6iCJTu", "privateKey": "60IifzMh", "publicKey": "kk5Pxsjq", "returnUrl": "bCKpMv2Y"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateAliPayConfig' test.out

#- 280 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'ky9DYkD2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestAliPayConfigById' test.out

#- 281 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'sIllFtBt' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "XJKG3rqB", "secretKey": "mILhtWm8"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdateCheckoutConfig' test.out

#- 282 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'RQvRUbUD' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 282 'TestCheckoutConfigById' test.out

#- 283 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'SiefGEdL' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "ucrtO2gC", "clientSecret": "QD057DrD", "returnUrl": "lgC2nzS9", "webHookId": "SiGUjVAw"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdatePayPalConfig' test.out

#- 284 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '4v3q6JRH' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 284 'TestPayPalConfigById' test.out

#- 285 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'cn7KaoCE' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["kRdo6qHY", "IZWnXqQ1", "oHFJ9Q0v"], "publishableKey": "qsL9Somq", "secretKey": "WsGA76yx", "webhookSecret": "i0QzZWfm"}' \
    > test.out 2>&1
eval_tap $? 285 'UpdateStripeConfig' test.out

#- 286 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'P2sx0KO5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 286 'TestStripeConfigById' test.out

#- 287 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'bEJaPnAF' \
    --validate  \
    --body '{"appId": "jsodyJQV", "key": "VBrShGbI", "mchid": "IuqK8C40", "returnUrl": "3HgoXCR6"}' \
    > test.out 2>&1
eval_tap $? 287 'UpdateWxPayConfig' test.out

#- 288 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'XOMXwKdf' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 288 'UpdateWxPayConfigCert' test.out

#- 289 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'qk8T4QHK' \
    > test.out 2>&1
eval_tap $? 289 'TestWxPayConfigById' test.out

#- 290 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '30EX0Fcl' \
    --validate  \
    --body '{"apiKey": "pDl5Hsur", "flowCompletionUrl": "acO5Mnjn", "merchantId": 48, "projectId": 79, "projectSecretKey": "D1OXkxSh"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateXsollaConfig' test.out

#- 291 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'FVQTRekL' \
    > test.out 2>&1
eval_tap $? 291 'TestXsollaConfigById' test.out

#- 292 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'fjmy8zos' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateXsollaUIConfig' test.out

#- 293 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '13' \
    --namespace "$AB_NAMESPACE" \
    --offset '73' \
    --region 'VwbrQKmb' \
    > test.out 2>&1
eval_tap $? 293 'QueryPaymentProviderConfig' test.out

#- 294 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "1yA7U7dG", "region": "MjupZkZQ", "sandboxTaxJarApiToken": "Y8CNyT4k", "specials": ["ALIPAY", "XSOLLA", "CHECKOUT"], "taxJarApiToken": "IbfT22G5", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 294 'CreatePaymentProviderConfig' test.out

#- 295 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 295 'GetAggregatePaymentProviders' test.out

#- 296 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'UCGBVfpc' \
    > test.out 2>&1
eval_tap $? 296 'DebugMatchedPaymentProviderConfig' test.out

#- 297 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 297 'GetSpecialPaymentProviders' test.out

#- 298 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'tNFUsUQ6' \
    --body '{"aggregate": "XSOLLA", "namespace": "XQcb2o1J", "region": "5euLAbBg", "sandboxTaxJarApiToken": "ejqc0apx", "specials": ["STRIPE", "XSOLLA", "WXPAY"], "taxJarApiToken": "09BySn8a", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 298 'UpdatePaymentProviderConfig' test.out

#- 299 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'GlAyvIsl' \
    > test.out 2>&1
eval_tap $? 299 'DeletePaymentProviderConfig' test.out

#- 300 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 300 'GetPaymentTaxConfig' test.out

#- 301 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "t7N1qcxK", "taxJarApiToken": "s4nlf1Mf", "taxJarEnabled": true, "taxJarProductCodesMapping": {"74KVo6Xq": "jz2xUKLN", "WSmYyVvy": "elIJ8Qga", "LMqi836U": "La7cfZl4"}}' \
    > test.out 2>&1
eval_tap $? 301 'UpdatePaymentTaxConfig' test.out

#- 302 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'VuY6rsZy' \
    --end 'o6CBRRno' \
    --start 'OikIxXKK' \
    > test.out 2>&1
eval_tap $? 302 'SyncPaymentOrders' test.out

#- 303 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'IR6kPmsw' \
    --storeId 'm5TCAU1c' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetRootCategories' test.out

#- 304 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'KApdJDnE' \
    --storeId '73GLmSZn' \
    > test.out 2>&1
eval_tap $? 304 'DownloadCategories' test.out

#- 305 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 's5owBhoU' \
    --namespace "$AB_NAMESPACE" \
    --language 'g4LsGP6K' \
    --storeId 'LPXkvUv2' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetCategory' test.out

#- 306 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'XiXaBzsm' \
    --namespace "$AB_NAMESPACE" \
    --language 'axjTZPlL' \
    --storeId 'itytGka7' \
    > test.out 2>&1
eval_tap $? 306 'PublicGetChildCategories' test.out

#- 307 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'Kv5TacQK' \
    --namespace "$AB_NAMESPACE" \
    --language 'F4OlRGdm' \
    --storeId 'XxETLEQr' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetDescendantCategories' test.out

#- 308 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 308 'PublicListCurrencies' test.out

#- 309 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    > test.out 2>&1
eval_tap $? 309 'GetIAPItemMapping' test.out

#- 310 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '3KCAV9al' \
    --region 'q3hK1G4k' \
    --storeId 'KooSNNUZ' \
    --appId 'uiynZ64I' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetItemByAppId' test.out

#- 311 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId 'MgTTLS2F' \
    --categoryPath 'garY903I' \
    --features 'NGIyEfRB' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --language 'gGVxo9OH' \
    --limit '14' \
    --offset '87' \
    --region 'fHumyfuB' \
    --sortBy 'name:desc,displayOrder:asc,updatedAt:desc' \
    --storeId 'fC0Gjvpg' \
    --tags 'JfuBs1Vp' \
    > test.out 2>&1
eval_tap $? 311 'PublicQueryItems' test.out

#- 312 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'qn47GVgh' \
    --region 'TH2wToOn' \
    --storeId 'q9U5lyW8' \
    --sku '9Xwt3wmR' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetItemBySku' test.out

#- 313 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'TrDCjhnK' \
    --region 'vsHezWTq' \
    --storeId 'gYPixtHk' \
    --itemIds '6lWq6tEe' \
    > test.out 2>&1
eval_tap $? 313 'PublicBulkGetItems' test.out

#- 314 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["UmU96FLE", "ak0mJqjR", "YldcTpde"]}' \
    > test.out 2>&1
eval_tap $? 314 'PublicValidateItemPurchaseCondition' test.out

#- 315 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'MEDIA' \
    --limit '43' \
    --offset '61' \
    --region '2vancmR6' \
    --storeId 'Z7rb21A2' \
    --keyword 'E9pX0BWC' \
    --language 'MqPsRk5h' \
    > test.out 2>&1
eval_tap $? 315 'PublicSearchItems' test.out

#- 316 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'tdM5T3fD' \
    --namespace "$AB_NAMESPACE" \
    --language 'SrSHrkoq' \
    --region 'v2mM6soM' \
    --storeId 'aTvQq2a9' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetApp' test.out

#- 317 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'YdFNtRVS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 317 'PublicGetItemDynamicData' test.out

#- 318 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'O0js0hG9' \
    --namespace "$AB_NAMESPACE" \
    --language 'xmSnzd7z' \
    --populateBundle  \
    --region 'gUxAogcn' \
    --storeId 'GkXk17QP' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetItem' test.out

#- 319 GetPaymentCustomization
eval_tap 0 319 'GetPaymentCustomization # SKIP deprecated' test.out

#- 320 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "kJHRhmLK", "paymentProvider": "WALLET", "returnUrl": "IpDDubnt", "ui": "PCFxfeoW", "zipCode": "2NdSWzOX"}' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetPaymentUrl' test.out

#- 321 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jO1NQUqW' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetPaymentMethods' test.out

#- 322 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HBW78XRE' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUnpaidPaymentOrder' test.out

#- 323 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZCiTNAxq' \
    --paymentProvider 'XSOLLA' \
    --zipCode '6gZrPqCs' \
    --body '{"token": "SDspvgM1"}' \
    > test.out 2>&1
eval_tap $? 323 'Pay' test.out

#- 324 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6sZ6rjnk' \
    > test.out 2>&1
eval_tap $? 324 'PublicCheckPaymentOrderPaidStatus' test.out

#- 325 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'ExObppC6' \
    > test.out 2>&1
eval_tap $? 325 'GetPaymentPublicConfig' test.out

#- 326 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'CMYDm5ge' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetQRCode' test.out

#- 327 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '659UDEOF' \
    --foreinginvoice '6gp5Ufmj' \
    --invoiceId 'tiVbqJnZ' \
    --payload 'crqrPye7' \
    --redirectResult 'fCwi7Il2' \
    --resultCode 'wIFlHm9N' \
    --sessionId '6owMHMtJ' \
    --status 'y1Oqn59t' \
    --token 'EGm9NYeU' \
    --type 'T5P0nx8T' \
    --userId 'qSZdZ5C8' \
    --orderNo 'mFI9Tnvz' \
    --paymentOrderNo 'EqBNMF9C' \
    --paymentProvider 'WALLET' \
    --returnUrl '6Vtd4v9k' \
    > test.out 2>&1
eval_tap $? 327 'PublicNormalizePaymentReturnUrl' test.out

#- 328 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '4fv3kMiu' \
    --paymentOrderNo 'Q3DhsKLx' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 328 'GetPaymentTaxValue' test.out

#- 329 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'Frepy56e' \
    > test.out 2>&1
eval_tap $? 329 'GetRewardByCode' test.out

#- 330 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'W1kmb15Q' \
    --limit '9' \
    --offset '78' \
    --sortBy 'rewardCode:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 330 'QueryRewards1' test.out

#- 331 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '9kP9U53z' \
    > test.out 2>&1
eval_tap $? 331 'GetReward1' test.out

#- 332 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 332 'PublicListStores' test.out

#- 333 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds '6joBAhAl,JGI2YYb6,ajBjgq6e' \
    --itemIds 'Y4PBNHKP,x62tHxDb,06ZFy3ug' \
    --skus 'lSp2UxvF,2uLXWilR,D7HD6LCg' \
    > test.out 2>&1
eval_tap $? 333 'PublicExistsAnyMyActiveEntitlement' test.out

#- 334 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'dFxRGj00' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 335 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId '6oCETQ8g' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 336 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'JbJIYLss' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 337 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Mvy9gkfT,MRrXVRcA,VRDX6gmD' \
    --itemIds 'fNfPGYYS,TunMgt3C,8hEguCql' \
    --skus 'MHiQN3HW,Jw9zIWsi,P2JQ24me' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetEntitlementOwnershipToken' test.out

#- 338 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "DrwEuTyM", "language": "nPH", "region": "lzO8AEl6"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncTwitchDropsEntitlement' test.out

#- 339 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'A9sh2x2u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 339 'PublicGetMyWallet' test.out

#- 340 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'r2ccp7R7' \
    --body '{"epicGamesJwtToken": "OqPqIjS4"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncEpicGameDLC' test.out

#- 341 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'i0N9ytb3' \
    --body '{"serviceLabel": 6}' \
    > test.out 2>&1
eval_tap $? 341 'PublicSyncPsnDlcInventory' test.out

#- 342 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'h4UdEwee' \
    --body '{"serviceLabels": [57, 74, 39]}' \
    > test.out 2>&1
eval_tap $? 342 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 343 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '62e6gtn5' \
    --body '{"appId": "pUARJM1T", "steamId": "8QwMNOAz"}' \
    > test.out 2>&1
eval_tap $? 343 'SyncSteamDLC' test.out

#- 344 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'XmyHEV4g' \
    --body '{"xstsToken": "9P6a280S"}' \
    > test.out 2>&1
eval_tap $? 344 'SyncXboxDLC' test.out

#- 345 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '5RNB5dVC' \
    --appType 'GAME' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'B7xL4axS' \
    --features 'PgPCiwLx,CFLDixZw,Vtt3RVTl' \
    --itemId '0tR00oQg,cHdGGK3x,76U1EIck' \
    --limit '23' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 345 'PublicQueryUserEntitlements' test.out

#- 346 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'RnP1oK3c' \
    --appId '4RVfjB0z' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetUserAppEntitlementByAppId' test.out

#- 347 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'i3XrYZUi' \
    --limit '81' \
    --offset '9' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 347 'PublicQueryUserEntitlementsByAppType' test.out

#- 348 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NLHkVrEF' \
    --entitlementClazz 'APP' \
    --itemId 'izL97ycJ' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetUserEntitlementByItemId' test.out

#- 349 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'V5YqE2my' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'pFNw9K9p' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetUserEntitlementBySku' test.out

#- 350 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mAIc6VSf' \
    --appIds 'E9nbE2PM,v12ZSRJk,ujxbCu1H' \
    --itemIds 'Faj6Vxs3,GuA4S1dS,7H7yIS7b' \
    --skus '5TSDRIoM,g7Dc5APz,fzXDELJF' \
    > test.out 2>&1
eval_tap $? 350 'PublicExistsAnyUserActiveEntitlement' test.out

#- 351 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'aIaEMW5b' \
    --appId 'hJyL72WD' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 352 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhBsCCbn' \
    --entitlementClazz 'APP' \
    --itemId 'aHLsXHlm' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 353 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '1RJTTy9J' \
    --ids 'rNz1K5M1,qgFddYvi,fGHawNx6' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 354 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhniEHLb' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'kLwioRaK' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 355 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'nWhlh80B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hYe2fJDS' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetUserEntitlement' test.out

#- 356 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '6T75Q4ul' \
    --namespace "$AB_NAMESPACE" \
    --userId 'onMFjmYq' \
    --body '{"options": ["E1wJhfog", "Wg2Apm0s", "Uy18aWn6"], "requestId": "5Co0vdCk", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 356 'PublicConsumeUserEntitlement' test.out

#- 357 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'Jpa19GJD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'K46Eehx7' \
    --body '{"requestId": "xasqMY9a", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 357 'PublicSellUserEntitlement' test.out

#- 358 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'N2tmGuX6' \
    --body '{"code": "r0gBVUUe", "language": "KmVL-619", "region": "nYxmkmCW"}' \
    > test.out 2>&1
eval_tap $? 358 'PublicRedeemCode' test.out

#- 359 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bs5qugkl' \
    --body '{"excludeOldTransactions": true, "language": "CuMV-xySh-Rq", "productId": "g8tLAJWp", "receiptData": "cyNkUvqn", "region": "6eXr6FNb", "transactionId": "KJ05Orya"}' \
    > test.out 2>&1
eval_tap $? 359 'PublicFulfillAppleIAPItem' test.out

#- 360 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6LSSUlug' \
    --body '{"epicGamesJwtToken": "IAknXcSa"}' \
    > test.out 2>&1
eval_tap $? 360 'SyncEpicGamesInventory' test.out

#- 361 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'VYcAYp7q' \
    --body '{"autoAck": false, "language": "eSVl_vpXQ-445", "orderId": "oWiywnxu", "packageName": "DLLuIaSx", "productId": "oloIH1gB", "purchaseTime": 58, "purchaseToken": "0iAXA9dB", "region": "4ib8HDOJ"}' \
    > test.out 2>&1
eval_tap $? 361 'PublicFulfillGoogleIAPItem' test.out

#- 362 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '8TNiP8Kg' \
    --body '{"currencyCode": "EAj3dbRT", "price": 0.5573020506717633, "productId": "0i6dO3zk", "serviceLabel": 4}' \
    > test.out 2>&1
eval_tap $? 362 'PublicReconcilePlayStationStore' test.out

#- 363 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'FB0sL2xt' \
    --body '{"currencyCode": "6fX9j7rh", "price": 0.8385512985499448, "productId": "CAlDlVKB", "serviceLabels": [19, 77, 38]}' \
    > test.out 2>&1
eval_tap $? 363 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 364 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rV0p9A7t' \
    --body '{"appId": "cHrV0MbJ", "currencyCode": "Gr4drgkD", "language": "yCt_RQjh-Qo", "price": 0.5820627352176851, "productId": "OLrF5i3g", "region": "r3Cc4M2O", "steamId": "7NrTQO7K"}' \
    > test.out 2>&1
eval_tap $? 364 'SyncSteamInventory' test.out

#- 365 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LdZDGwqx' \
    --body '{"gameId": "7T3l1ut2", "language": "ZP_ou", "region": "g6TKwdRM"}' \
    > test.out 2>&1
eval_tap $? 365 'SyncTwitchDropsEntitlement1' test.out

#- 366 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'raDLrwh3' \
    --body '{"currencyCode": "d0ykRGkg", "price": 0.2614787072043049, "productId": "UNIbJMJ9", "xstsToken": "ABbKVWO2"}' \
    > test.out 2>&1
eval_tap $? 366 'SyncXboxInventory' test.out

#- 367 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'YEDiqkwK' \
    --itemId 'bpdk7wlD' \
    --limit '28' \
    --offset '13' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 367 'PublicQueryUserOrders' test.out

#- 368 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'NiPPjpSA' \
    --body '{"currencyCode": "lZwFGpea", "discountedPrice": 49, "ext": {"ObBB49Km": {}, "4ClIQmkI": {}, "dLCvNhZ6": {}}, "itemId": "P8aqZ2yf", "language": "Wdi-685", "price": 59, "quantity": 78, "region": "vBGQAeh0", "returnUrl": "VTiTP4PS"}' \
    > test.out 2>&1
eval_tap $? 368 'PublicCreateUserOrder' test.out

#- 369 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rXUS6jYI' \
    --userId '9lsQFD43' \
    > test.out 2>&1
eval_tap $? 369 'PublicGetUserOrder' test.out

#- 370 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Df5qUZOF' \
    --userId 'zpFd6b5J' \
    > test.out 2>&1
eval_tap $? 370 'PublicCancelUserOrder' test.out

#- 371 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'c5TETHcu' \
    --userId 'p8GG0VCM' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserOrderHistories' test.out

#- 372 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TFJ6svTy' \
    --userId 'o9RHget5' \
    > test.out 2>&1
eval_tap $? 372 'PublicDownloadUserOrderReceipt' test.out

#- 373 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'hzB52BDF' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetPaymentAccounts' test.out

#- 374 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'opxUwkMu' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'dKMexeJc' \
    > test.out 2>&1
eval_tap $? 374 'PublicDeletePaymentAccount' test.out

#- 375 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '7NvgTSgK' \
    --language 'jCxZjKf8' \
    --region 'NA4cGUaD' \
    --storeId 'fy9XnH2r' \
    --viewId '0EKrk5Vl' \
    > test.out 2>&1
eval_tap $? 375 'PublicListActiveSections' test.out

#- 376 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'nKsWCPcc' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'UmD225fp' \
    --limit '10' \
    --offset '30' \
    --sku 'gsx3Erhe' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 376 'PublicQueryUserSubscriptions' test.out

#- 377 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4IE1z3r' \
    --body '{"currencyCode": "DwZ1HKsO", "itemId": "pyq8agQu", "language": "bET", "region": "c6jLF9DI", "returnUrl": "W2ncJJKp", "source": "qmgvUTr8"}' \
    > test.out 2>&1
eval_tap $? 377 'PublicSubscribeSubscription' test.out

#- 378 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XAtpOqUQ' \
    --itemId 'xzqJZiWi' \
    > test.out 2>&1
eval_tap $? 378 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 379 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3KQffT5T' \
    --userId 'n61A1xW6' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetUserSubscription' test.out

#- 380 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'okIqmd87' \
    --userId 'ir9op4Yf' \
    > test.out 2>&1
eval_tap $? 380 'PublicChangeSubscriptionBillingAccount' test.out

#- 381 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GTno5oHz' \
    --userId 'qY3DgykA' \
    --body '{"immediate": true, "reason": "zBJX0rkO"}' \
    > test.out 2>&1
eval_tap $? 381 'PublicCancelSubscription' test.out

#- 382 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'HUkY5aSl' \
    --userId 'qhYoSXbn' \
    --excludeFree  \
    --limit '13' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetUserSubscriptionBillingHistories' test.out

#- 383 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'XNXbpqxh' \
    --language '76Af5JSw' \
    --storeId 'jw2fE2g6' \
    > test.out 2>&1
eval_tap $? 383 'PublicListViews' test.out

#- 384 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'jXV7oai2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oDm9FaP0' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetWallet' test.out

#- 385 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'HJ98tE4U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yoQg0b0s' \
    --limit '67' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 385 'PublicListUserWalletTransactions' test.out

#- 386 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'ztprSfW9' \
    --baseAppId 'OutADrNG' \
    --categoryPath 'BWSJ1zQK' \
    --features 'xVmRTawj' \
    --includeSubCategoryItem  \
    --itemName 'iZPMoZZc' \
    --itemStatus 'INACTIVE' \
    --itemType 'OPTIONBOX' \
    --limit '57' \
    --offset '63' \
    --region 'M9Q8t829' \
    --sortBy 'createdAt:asc,updatedAt:desc,name' \
    --storeId '3usApPdJ' \
    --tags 'Pn9eIdhI' \
    --targetNamespace 'BvTTupAB' \
    > test.out 2>&1
eval_tap $? 386 'QueryItems1' test.out

#- 387 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J4RwH3Ed' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 387 'ImportStore1' test.out

#- 388 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KmYtbqQH' \
    --body '{"itemIds": ["NfIZwrMx", "f3EnzZVn", "kLT0Lb85"]}' \
    > test.out 2>&1
eval_tap $? 388 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE