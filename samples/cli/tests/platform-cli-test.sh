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
echo "1..390"

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
    --body '{"context": {"item": {"appId": "EAxcVpFr", "appType": "GAME", "baseAppId": "I6LZrkq6", "boothName": "Dc09nIW0", "boundItemIds": ["ZPUdc0qh", "7eHpzSn3", "Oaiw9B0D"], "categoryPath": "4n8mzZ0m", "clazz": "8SAMTwE6", "createdAt": "1988-10-30T00:00:00Z", "description": "6IaRDBXx", "displayOrder": 49, "entitlementType": "CONSUMABLE", "ext": {"aNoMR6hk": {}, "spInrAip": {}, "6lyzSxwE": {}}, "features": ["lFHHdgs2", "kNmKJfh5", "1Jub74CU"], "fresh": false, "images": [{"as": "kY1aXlFc", "caption": "DtgOjchI", "height": 42, "imageUrl": "Hs1cnz1J", "smallImageUrl": "SDgY1TXp", "width": 3}, {"as": "8zsCTCrb", "caption": "CbPOyNQk", "height": 93, "imageUrl": "6XM4OI18", "smallImageUrl": "mAQLnzjM", "width": 11}, {"as": "cXm7agSr", "caption": "jJW2OQNO", "height": 38, "imageUrl": "u2D6QVKN", "smallImageUrl": "CWP75TB0", "width": 18}], "itemId": "Fgx4c8Ou", "itemIds": ["mKtPDKJD", "Xn7Z4U68", "su8Xfqlq"], "itemQty": {"NiTvB6Sd": 55, "orKsxwko": 39, "Z5MecdKi": 58}, "itemType": "EXTENSION", "language": "8XfwHuKe", "listable": false, "localExt": {"Ezth6mXh": {}, "zkzWkFeZ": {}, "SoEAcBdW": {}}, "longDescription": "19m4eu6d", "lootBoxConfig": {"rewardCount": 66, "rewards": [{"lootBoxItems": [{"count": 40, "itemId": "6C7duuyZ", "itemSku": "0GhDogqr", "itemType": "hBRd8lDR"}, {"count": 53, "itemId": "qVNPRZYd", "itemSku": "FLIAjGGJ", "itemType": "ddVCvu9v"}, {"count": 47, "itemId": "SevkLGMS", "itemSku": "0lyuI9a2", "itemType": "I9u6Vpbs"}], "name": "x5w8hqUI", "odds": 0.8444144295138901, "type": "PROBABILITY_GROUP", "weight": 96}, {"lootBoxItems": [{"count": 92, "itemId": "pOXGSLmC", "itemSku": "VuHOPlLl", "itemType": "kvR8sKgn"}, {"count": 41, "itemId": "TeIv53HG", "itemSku": "CiljvjKo", "itemType": "yD6SCwGr"}, {"count": 27, "itemId": "FjkQsfCa", "itemSku": "Tmt1d67F", "itemType": "XGk2s9Q0"}], "name": "mPVo3twu", "odds": 0.8515712018765591, "type": "REWARD_GROUP", "weight": 93}, {"lootBoxItems": [{"count": 10, "itemId": "C6I3lMjG", "itemSku": "SWN2laRl", "itemType": "xfcjHfYa"}, {"count": 21, "itemId": "MbwL6IY6", "itemSku": "9z1UaLqY", "itemType": "SYWytLPz"}, {"count": 18, "itemId": "yYoNRKd3", "itemSku": "IL5TAQ6i", "itemType": "iPlSC2uE"}], "name": "4o5Vwdo3", "odds": 0.09427513649391428, "type": "PROBABILITY_GROUP", "weight": 33}], "rollFunction": "DEFAULT"}, "maxCount": 4, "maxCountPerUser": 70, "name": "UmLZZbSq", "namespace": "b8RwNmn9", "optionBoxConfig": {"boxItems": [{"count": 69, "itemId": "VAla2l5B", "itemSku": "YNtIuS5S", "itemType": "5XUdjsoq"}, {"count": 45, "itemId": "OcEdscKH", "itemSku": "PEqgA8yu", "itemType": "7Vk6Jt4Y"}, {"count": 25, "itemId": "hZv15T7q", "itemSku": "uIOvBMca", "itemType": "YmvCkGZ5"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 54, "comparison": "includes", "name": "yCUEXlAv", "predicateType": "SeasonPassPredicate", "value": "oxozr6wf", "values": ["NPX2bOIt", "jJCSQT27", "RMvqtlB2"]}, {"anyOf": 3, "comparison": "excludes", "name": "YGu0rdlg", "predicateType": "EntitlementPredicate", "value": "RBaAkLnv", "values": ["MyKrQpM4", "mDc3fxU8", "xkT1X68c"]}, {"anyOf": 16, "comparison": "isNot", "name": "kkK6KKXN", "predicateType": "SeasonPassPredicate", "value": "3xoJ8aeC", "values": ["naLpUKp4", "4YUDjasW", "IPUvmEej"]}]}, {"operator": "or", "predicates": [{"anyOf": 35, "comparison": "includes", "name": "kILsSSyD", "predicateType": "EntitlementPredicate", "value": "rvjj7il3", "values": ["MNqq98Sj", "5MXbN9oC", "TvhZNkSQ"]}, {"anyOf": 60, "comparison": "excludes", "name": "6BXksUC9", "predicateType": "EntitlementPredicate", "value": "z1x3poD3", "values": ["8bwbmXgd", "Q1MzH7Qm", "Qgb3boLQ"]}, {"anyOf": 55, "comparison": "is", "name": "VJf6c2Z0", "predicateType": "SeasonTierPredicate", "value": "AFKK2WDg", "values": ["3EeERmDn", "CcxvONZm", "yeFoF7VS"]}]}, {"operator": "or", "predicates": [{"anyOf": 30, "comparison": "isGreaterThanOrEqual", "name": "JbRFQSKV", "predicateType": "SeasonTierPredicate", "value": "Tb3g7mSQ", "values": ["lSck0ZHn", "UhAEtrmj", "qU6YE3p4"]}, {"anyOf": 92, "comparison": "isNot", "name": "I39YBHqa", "predicateType": "SeasonTierPredicate", "value": "XlvPG6bF", "values": ["YReVHQip", "2L7vIYhG", "cCx9Zw5D"]}, {"anyOf": 67, "comparison": "includes", "name": "yEW4ZJJ4", "predicateType": "SeasonTierPredicate", "value": "d3PBddN8", "values": ["S48l9lyN", "j3oZk03Q", "ApflxqMr"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 51, "fixedTrialCycles": 74, "graceDays": 69}, "region": "MDYDDxHS", "regionData": [{"currencyCode": "ZjtqXyJ5", "currencyNamespace": "8f7Gc26S", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1975-10-16T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1971-02-11T00:00:00Z", "discountedPrice": 21, "expireAt": "1997-07-16T00:00:00Z", "price": 47, "purchaseAt": "1972-07-27T00:00:00Z", "trialPrice": 46}, {"currencyCode": "fTcyiuAT", "currencyNamespace": "us9hsfpF", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1972-08-26T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1982-09-24T00:00:00Z", "discountedPrice": 39, "expireAt": "1971-07-13T00:00:00Z", "price": 80, "purchaseAt": "1987-10-03T00:00:00Z", "trialPrice": 67}, {"currencyCode": "yPLtI8il", "currencyNamespace": "byDPUIj8", "currencyType": "VIRTUAL", "discountAmount": 5, "discountExpireAt": "1995-02-05T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1976-01-25T00:00:00Z", "discountedPrice": 32, "expireAt": "1979-05-05T00:00:00Z", "price": 59, "purchaseAt": "1999-06-03T00:00:00Z", "trialPrice": 26}], "saleConfig": {"currencyCode": "81P1ktfI", "price": 29}, "seasonType": "PASS", "sellable": true, "sku": "eIP6rOvD", "stackable": true, "status": "ACTIVE", "tags": ["KOsb392k", "6YmJFfRB", "yjlBiuFM"], "targetCurrencyCode": "3FIoVk8T", "targetItemId": "3GpAnkCm", "targetNamespace": "BUqg2SCn", "thumbnailUrl": "qntX9y1a", "title": "ZSWMiVi1", "updatedAt": "1998-09-29T00:00:00Z", "useCount": 37}, "namespace": "RuPMMWH8", "order": {"currency": {"currencyCode": "Yb33T5UB", "currencySymbol": "JCjfcnLR", "currencyType": "REAL", "decimals": 14, "namespace": "xeCSz9WE"}, "ext": {"i8KlloeH": {}, "0JT1ydua": {}, "t2vQR3bi": {}}, "free": true}, "source": "REFERRAL_BONUS"}, "script": "fsu4jmsR", "type": "grantDays"}' \
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
    --sortBy 'updatedAt:desc,createdAt:asc' \
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
    --body '{"appId": "AdMDcb4q", "appType": "DLC", "baseAppId": "amU7syGl", "boothName": "ElXdEAOr", "categoryPath": "VSnLocLV", "clazz": "VYamQc4w", "displayOrder": 5, "entitlementType": "DURABLE", "ext": {"G5nDBLJo": {}, "JHbiQ5du": {}, "E5p4cfs2": {}}, "features": ["NDlmM5nQ", "E41cK8QT", "wiIAvxSv"], "images": [{"as": "FMGzs7fz", "caption": "jgyc44mE", "height": 16, "imageUrl": "CFeY5g4X", "smallImageUrl": "gBsbfzqx", "width": 56}, {"as": "QehMDli6", "caption": "t9unQLYX", "height": 49, "imageUrl": "4IjGdqth", "smallImageUrl": "RxTjQ7gk", "width": 15}, {"as": "EY8rG0q0", "caption": "Q2Qd2JzR", "height": 2, "imageUrl": "tKwG3UC6", "smallImageUrl": "XCnnZxF8", "width": 59}], "itemIds": ["bYaJCJjf", "k2TUvn95", "FhO7VW3m"], "itemQty": {"bDVMDu87": 40, "1eym5ydC": 67, "p25xCWTq": 96}, "itemType": "SUBSCRIPTION", "listable": true, "localizations": {"ZENJ1QHZ": {"description": "QxPRXH7u", "localExt": {"xBJEECQE": {}, "1li3Bg7J": {}, "xc9pUnZm": {}}, "longDescription": "vhidwCkZ", "title": "wqjYLfTi"}, "CO1NDBvQ": {"description": "vRPnAz4V", "localExt": {"zW0CpoBC": {}, "byJsF5Ij": {}, "F1c0W338": {}}, "longDescription": "HS6CBgVR", "title": "yihYNZ84"}, "CVhziXV8": {"description": "HwSmvcvc", "localExt": {"DKF19yVR": {}, "afCjOuSY": {}, "ht83AdvB": {}}, "longDescription": "aagTiRJ8", "title": "daGTVX3B"}}, "lootBoxConfig": {"rewardCount": 4, "rewards": [{"lootBoxItems": [{"count": 65, "itemId": "7jlz5IfH", "itemSku": "gKjI9mwJ", "itemType": "SrN8jkIy"}, {"count": 22, "itemId": "xLv9HBEU", "itemSku": "e89AwEw1", "itemType": "HO4FnKtx"}, {"count": 67, "itemId": "XLKAmlDr", "itemSku": "19uJ3nq6", "itemType": "VerzVCcI"}], "name": "8y3Cz0Yq", "odds": 0.4640464552173583, "type": "REWARD_GROUP", "weight": 69}, {"lootBoxItems": [{"count": 96, "itemId": "tMlFgvh2", "itemSku": "Dp2SoiIP", "itemType": "p1yvfAHS"}, {"count": 43, "itemId": "VgLu11A3", "itemSku": "HTovFi4t", "itemType": "PAGfleyC"}, {"count": 55, "itemId": "FIYeAg79", "itemSku": "HcLJXJ7m", "itemType": "pVI6eTYA"}], "name": "jdPlCiQQ", "odds": 0.46417092320034825, "type": "REWARD", "weight": 100}, {"lootBoxItems": [{"count": 4, "itemId": "BAetsanz", "itemSku": "qP8oxfrt", "itemType": "bECD1CYP"}, {"count": 46, "itemId": "UAxJrINP", "itemSku": "XppPNO3A", "itemType": "fmXcgwC3"}, {"count": 71, "itemId": "0calqxEe", "itemSku": "wuGS469k", "itemType": "2hG0WKt4"}], "name": "sUmanYxM", "odds": 0.8506192616767905, "type": "PROBABILITY_GROUP", "weight": 68}], "rollFunction": "CUSTOM"}, "maxCount": 98, "maxCountPerUser": 95, "name": "NYzGMNIp", "optionBoxConfig": {"boxItems": [{"count": 100, "itemId": "ZIdhevfZ", "itemSku": "vyV7Acod", "itemType": "cZwKjYDd"}, {"count": 25, "itemId": "WrFtHIi1", "itemSku": "CMgKAOG5", "itemType": "iDcCR5Pb"}, {"count": 59, "itemId": "n8yreciP", "itemSku": "LfkVyyJs", "itemType": "bGpO6Jge"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 27, "fixedTrialCycles": 72, "graceDays": 67}, "regionData": {"xEN7JlZc": [{"currencyCode": "8LMq1o2j", "currencyNamespace": "ZWu4yA3r", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1987-05-15T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1998-11-06T00:00:00Z", "discountedPrice": 2, "expireAt": "1996-10-02T00:00:00Z", "price": 65, "purchaseAt": "1996-03-04T00:00:00Z", "trialPrice": 71}, {"currencyCode": "eeEssWEU", "currencyNamespace": "l07bhwnt", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1995-05-10T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1975-05-01T00:00:00Z", "discountedPrice": 83, "expireAt": "1993-10-14T00:00:00Z", "price": 23, "purchaseAt": "1973-11-01T00:00:00Z", "trialPrice": 81}, {"currencyCode": "KwMZQjzv", "currencyNamespace": "jSozv6CT", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1990-04-01T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1998-07-28T00:00:00Z", "discountedPrice": 92, "expireAt": "1978-04-27T00:00:00Z", "price": 14, "purchaseAt": "1985-03-03T00:00:00Z", "trialPrice": 52}], "huiTnJar": [{"currencyCode": "YYkHBDdS", "currencyNamespace": "zBXdxapw", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1972-10-10T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1992-08-09T00:00:00Z", "discountedPrice": 87, "expireAt": "1986-06-16T00:00:00Z", "price": 38, "purchaseAt": "1982-06-17T00:00:00Z", "trialPrice": 77}, {"currencyCode": "fmfxKYB4", "currencyNamespace": "LM6H6QXm", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1997-07-06T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1999-08-20T00:00:00Z", "discountedPrice": 12, "expireAt": "1979-12-30T00:00:00Z", "price": 51, "purchaseAt": "1993-02-08T00:00:00Z", "trialPrice": 23}, {"currencyCode": "LD2qfCXn", "currencyNamespace": "lUnqxT1W", "currencyType": "VIRTUAL", "discountAmount": 60, "discountExpireAt": "1993-11-18T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1990-04-05T00:00:00Z", "discountedPrice": 5, "expireAt": "1972-09-09T00:00:00Z", "price": 53, "purchaseAt": "1992-02-29T00:00:00Z", "trialPrice": 78}], "hzC7MNa8": [{"currencyCode": "vVe4MHX6", "currencyNamespace": "AgMep90A", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1983-10-14T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1983-10-19T00:00:00Z", "discountedPrice": 79, "expireAt": "1983-08-07T00:00:00Z", "price": 28, "purchaseAt": "1989-08-28T00:00:00Z", "trialPrice": 85}, {"currencyCode": "2eLMe3lt", "currencyNamespace": "9qfx2UDc", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1995-08-12T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1995-10-30T00:00:00Z", "discountedPrice": 39, "expireAt": "1992-09-11T00:00:00Z", "price": 64, "purchaseAt": "1989-06-05T00:00:00Z", "trialPrice": 9}, {"currencyCode": "kTjgJaMY", "currencyNamespace": "vNQOsDa4", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1972-10-03T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1976-02-05T00:00:00Z", "discountedPrice": 52, "expireAt": "1978-09-21T00:00:00Z", "price": 34, "purchaseAt": "1980-06-10T00:00:00Z", "trialPrice": 48}]}, "saleConfig": {"currencyCode": "XjdyRJun", "price": 86}, "seasonType": "PASS", "sellable": false, "sku": "GAak7Kao", "stackable": false, "status": "INACTIVE", "tags": ["eR5eQAe1", "1DK97D2x", "nik42mit"], "targetCurrencyCode": "rzmmgqBP", "targetNamespace": "Rmd6mO4o", "thumbnailUrl": "I8KDqebm", "useCount": 81}' \
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
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 77, "comparison": "includes", "name": "NNz6QIVC", "predicateType": "SeasonTierPredicate", "value": "Mfuc8VOs", "values": ["nmnlVljd", "p38vumnx", "WYmELe74"]}, {"anyOf": 53, "comparison": "isLessThan", "name": "nYBTxaTI", "predicateType": "SeasonPassPredicate", "value": "cWm428Xe", "values": ["9nMrBZo0", "jRF94NIY", "lNUBDShH"]}, {"anyOf": 60, "comparison": "isGreaterThanOrEqual", "name": "32vvL28F", "predicateType": "SeasonTierPredicate", "value": "KMEmtbiW", "values": ["Yi0Zxs5S", "sAQHbMrK", "WCqZXHLL"]}]}, {"operator": "and", "predicates": [{"anyOf": 52, "comparison": "is", "name": "1oQf7BUL", "predicateType": "EntitlementPredicate", "value": "FJUAJsyA", "values": ["feKOufV4", "f15NohXu", "6opxQGRt"]}, {"anyOf": 85, "comparison": "isLessThanOrEqual", "name": "qlkL0diR", "predicateType": "EntitlementPredicate", "value": "wCUsTag4", "values": ["P2xaNfmn", "8Onb1a9g", "MLAo3m61"]}, {"anyOf": 79, "comparison": "is", "name": "z0F2UBRm", "predicateType": "SeasonTierPredicate", "value": "XDmgNEJB", "values": ["hNC66szb", "hgGq5GID", "CCf73IFb"]}]}, {"operator": "or", "predicates": [{"anyOf": 22, "comparison": "isLessThanOrEqual", "name": "SSITz4Tj", "predicateType": "SeasonPassPredicate", "value": "naB3YxKN", "values": ["fIfXshuL", "dOTacCcJ", "Uk5Wdpxj"]}, {"anyOf": 9, "comparison": "isLessThan", "name": "6A6RpmKD", "predicateType": "EntitlementPredicate", "value": "TKbonouc", "values": ["NmzwOZOK", "rZ8iMlOu", "56sDkci5"]}, {"anyOf": 21, "comparison": "isGreaterThanOrEqual", "name": "rjF5RaJw", "predicateType": "SeasonPassPredicate", "value": "WwJ7NrTb", "values": ["1XTB9YQz", "BzP6EUmU", "UJ9XlYJ8"]}]}]}}' \
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

#- 137 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'GetRevocationConfig' test.out

#- 138 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": true, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime '6jaGfsD1' \
    --limit '4' \
    --offset '40' \
    --source 'DLC' \
    --startTime 'YEJTSiXj' \
    --status 'FAIL' \
    --transactionId 'DtetoQVF' \
    --userId 'L8LNW11v' \
    > test.out 2>&1
eval_tap $? 140 'QueryRevocationHistories' test.out

#- 141 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "tpaTxi7k", "eventTopic": "489jRCn4", "maxAwarded": 2, "maxAwardedPerUser": 34, "namespaceExpression": "vkCPfKof", "rewardCode": "wXOIZZQA", "rewardConditions": [{"condition": "Jza84lKK", "conditionName": "mVOaTS6x", "eventName": "BbNrSUAW", "rewardItems": [{"duration": 43, "itemId": "ak7ISDrB", "quantity": 97}, {"duration": 70, "itemId": "g6NuDZvP", "quantity": 3}, {"duration": 33, "itemId": "1kuUfNfU", "quantity": 60}]}, {"condition": "TyBG5dCU", "conditionName": "oExnKfV3", "eventName": "869IN4V1", "rewardItems": [{"duration": 82, "itemId": "XMGBA6JX", "quantity": 61}, {"duration": 63, "itemId": "pA1tIC45", "quantity": 58}, {"duration": 16, "itemId": "0oaGouFu", "quantity": 15}]}, {"condition": "Bhtzn8jA", "conditionName": "dTn6xBhr", "eventName": "ciryLm67", "rewardItems": [{"duration": 35, "itemId": "wC1uuokp", "quantity": 0}, {"duration": 92, "itemId": "IjL0Vxe5", "quantity": 28}, {"duration": 77, "itemId": "l5TPC5GO", "quantity": 61}]}], "userIdExpression": "xOgvDc7x"}' \
    > test.out 2>&1
eval_tap $? 141 'CreateReward' test.out

#- 142 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'MrRKvw8I' \
    --limit '92' \
    --offset '37' \
    --sortBy 'namespace:asc,namespace:desc,rewardCode:desc' \
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

#- 208 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hR1Zrm3t' \
    > test.out 2>&1
eval_tap $? 208 'RevokeAllEntitlements' test.out

#- 209 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUvV87yf' \
    --entitlementIds 'kycLSVdl' \
    > test.out 2>&1
eval_tap $? 209 'RevokeUserEntitlements' test.out

#- 210 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'eSaAylsm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LYe2phYO' \
    > test.out 2>&1
eval_tap $? 210 'GetUserEntitlement' test.out

#- 211 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'gT5kDTyP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l3dKF7NX' \
    --body '{"endDate": "1986-09-07T00:00:00Z", "nullFieldList": ["jrJMki8j", "vc3P8Gwj", "g3IOH0SD"], "startDate": "1988-02-17T00:00:00Z", "status": "REVOKED", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 211 'UpdateUserEntitlement' test.out

#- 212 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'eoODXMzL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SrzoiBnY' \
    --body '{"options": ["i5UWs3tY", "lYeMoCim", "JySocRvU"], "requestId": "WDOrFZKP", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 212 'ConsumeUserEntitlement' test.out

#- 213 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'jTvYa5Pq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1K7qcAo' \
    > test.out 2>&1
eval_tap $? 213 'DisableUserEntitlement' test.out

#- 214 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'ijBPAp6E' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pb988Nzx' \
    > test.out 2>&1
eval_tap $? 214 'EnableUserEntitlement' test.out

#- 215 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'rDKVpULj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jiw3NeVG' \
    > test.out 2>&1
eval_tap $? 215 'GetUserEntitlementHistories' test.out

#- 216 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '4DJi9DaM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rc0WFgKj' \
    > test.out 2>&1
eval_tap $? 216 'RevokeUserEntitlement' test.out

#- 217 RevokeUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUseCount \
    --entitlementId 'E945x2CP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VYYG9Wvo' \
    --body '{"reason": "GmAmvaVV", "useCount": 76}' \
    > test.out 2>&1
eval_tap $? 217 'RevokeUseCount' test.out

#- 218 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'YfxnUNcw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jr7gSGhn' \
    --body '{"requestId": "fuF4WZiQ", "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 218 'SellUserEntitlement' test.out

#- 219 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'aJeRbzTP' \
    --body '{"duration": 46, "endDate": "1990-08-25T00:00:00Z", "itemId": "08gMXhdf", "itemSku": "3juXW4Jp", "language": "rIb3CJCA", "order": {"currency": {"currencyCode": "tvSG8Cfa", "currencySymbol": "9dzOJDGC", "currencyType": "VIRTUAL", "decimals": 71, "namespace": "HxsDxeR6"}, "ext": {"d7r1SQw8": {}, "0JfMpPrS": {}, "qYypRUnq": {}}, "free": false}, "orderNo": "lQo2jy29", "origin": "System", "quantity": 73, "region": "ccTt7Wxw", "source": "PURCHASE", "startDate": "1998-07-18T00:00:00Z", "storeId": "t3uTw6zQ"}' \
    > test.out 2>&1
eval_tap $? 219 'FulfillItem' test.out

#- 220 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'uoZcXQpo' \
    --body '{"code": "TOxe8y1j", "language": "IR_dHuX-939", "region": "ISyXtHzo"}' \
    > test.out 2>&1
eval_tap $? 220 'RedeemCode' test.out

#- 221 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'WGdYohxM' \
    --body '{"origin": "Other", "rewards": [{"currency": {"currencyCode": "HN9mVug2", "namespace": "zkVf6Kgp"}, "item": {"itemId": "KOcn3tMD", "itemSku": "9UT67bOw", "itemType": "ugFDa6wU"}, "quantity": 88, "type": "ITEM"}, {"currency": {"currencyCode": "eDAPOGBw", "namespace": "weyFfXEO"}, "item": {"itemId": "EAEtbag8", "itemSku": "2KgBgyCd", "itemType": "5vjkfz3e"}, "quantity": 89, "type": "ITEM"}, {"currency": {"currencyCode": "4DtNp129", "namespace": "hzBw3xLU"}, "item": {"itemId": "cCEt0Dzm", "itemSku": "kJq1sml5", "itemType": "bYt76BNs"}, "quantity": 17, "type": "CURRENCY"}], "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 221 'FulfillRewards' test.out

#- 222 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'giR9434W' \
    --endTime 'pKKdzxou' \
    --limit '10' \
    --offset '49' \
    --productId 'CNlFoOcW' \
    --startTime 'QQy4bjmQ' \
    --status 'FAILED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserIAPOrders' test.out

#- 223 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cSbUt5UG' \
    > test.out 2>&1
eval_tap $? 223 'QueryAllUserIAPOrders' test.out

#- 224 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kInFGpuU' \
    --endTime 'sdtq4dOw' \
    --limit '80' \
    --offset '53' \
    --startTime 'ESzCEW9d' \
    --status 'SUCCESS' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 224 'QueryUserIAPConsumeHistory' test.out

#- 225 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2Cqm84jV' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "tKj_RmHd-727", "productId": "NOBWydXV", "region": "0Fi02aFr", "type": "APPLE"}' \
    > test.out 2>&1
eval_tap $? 225 'MockFulfillIAPItem' test.out

#- 226 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'CDapjwNO' \
    --itemId 'l4k8rVNr' \
    --limit '25' \
    --offset '60' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 226 'QueryUserOrders' test.out

#- 227 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'PsKDJiWx' \
    --body '{"currencyCode": "QBwaS7rD", "currencyNamespace": "Bf2S54ph", "discountedPrice": 3, "ext": {"etxFMqXC": {}, "QMAqQ2ZR": {}, "GzNtrThF": {}}, "itemId": "a9XU8mos", "language": "luiHZJ7O", "options": {"skipPriceValidation": true}, "platform": "Playstation", "price": 54, "quantity": 86, "region": "4vvn9bk5", "returnUrl": "qr8qs2mq", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 227 'AdminCreateUserOrder' test.out

#- 228 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'RuuzQJiL' \
    --itemId 'c1eI9w3J' \
    > test.out 2>&1
eval_tap $? 228 'CountOfPurchasedItem' test.out

#- 229 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EhxPGbEk' \
    --userId '7s7gw07F' \
    > test.out 2>&1
eval_tap $? 229 'GetUserOrder' test.out

#- 230 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'lounC3vJ' \
    --userId 'KBC7Swgo' \
    --body '{"status": "CHARGEBACK", "statusReason": "iPeIB4Eh"}' \
    > test.out 2>&1
eval_tap $? 230 'UpdateUserOrderStatus' test.out

#- 231 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'y0Y5aSJV' \
    --userId 'DginxAM7' \
    > test.out 2>&1
eval_tap $? 231 'FulfillUserOrder' test.out

#- 232 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7eY9C14F' \
    --userId 'bfiI2NPv' \
    > test.out 2>&1
eval_tap $? 232 'GetUserOrderGrant' test.out

#- 233 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'l1kCY5bE' \
    --userId 'okxXxkWZ' \
    > test.out 2>&1
eval_tap $? 233 'GetUserOrderHistories' test.out

#- 234 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bjf7GZxa' \
    --userId 'ossQmjo6' \
    --body '{"additionalData": {"cardSummary": "9wohJFyT"}, "authorisedTime": "1991-09-30T00:00:00Z", "chargebackReversedTime": "1976-03-07T00:00:00Z", "chargebackTime": "1976-09-17T00:00:00Z", "chargedTime": "1980-09-26T00:00:00Z", "createdTime": "1992-12-21T00:00:00Z", "currency": {"currencyCode": "PhR4LEZv", "currencySymbol": "z3EjFR79", "currencyType": "VIRTUAL", "decimals": 13, "namespace": "Q1U6aFD3"}, "customParameters": {"O2kXQSc5": {}, "8zgZVl4g": {}, "IF7v3qbZ": {}}, "extOrderNo": "u9M3OxqV", "extTxId": "AT4H1lRZ", "extUserId": "9Z1JBrHR", "issuedAt": "1984-07-19T00:00:00Z", "metadata": {"EOtIxzPq": "b6n73m0j", "iaDH86d9": "rsKgzCsM", "ulpB8HZU": "tVVaJCiL"}, "namespace": "gKOwrSfW", "nonceStr": "hT5B4Wed", "paymentMethod": "opzwSluB", "paymentMethodFee": 40, "paymentOrderNo": "PXI2v0pr", "paymentProvider": "PAYPAL", "paymentProviderFee": 3, "paymentStationUrl": "OEey0MkZ", "price": 45, "refundedTime": "1981-09-13T00:00:00Z", "salesTax": 94, "sandbox": true, "sku": "wNN3UYhi", "status": "AUTHORISED", "statusReason": "4SqIV6LQ", "subscriptionId": "PHlaeYl4", "subtotalPrice": 4, "targetNamespace": "g8CfRwty", "targetUserId": "l1HeT7VE", "tax": 86, "totalPrice": 30, "totalTax": 12, "txEndTime": "1989-09-21T00:00:00Z", "type": "WE4EW0sw", "userId": "8v5peiux", "vat": 29}' \
    > test.out 2>&1
eval_tap $? 234 'ProcessUserOrderNotification' test.out

#- 235 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ghoQBp2m' \
    --userId 'WAOYkscz' \
    > test.out 2>&1
eval_tap $? 235 'DownloadUserOrderReceipt' test.out

#- 236 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'xBS0OBCa' \
    --body '{"currencyCode": "2vWadLmQ", "currencyNamespace": "tYKmEMzi", "customParameters": {"cbuL2S3R": {}, "iW8dLTCB": {}, "fGUdVEdv": {}}, "description": "dQL7sVwc", "extOrderNo": "Z2PofaJo", "extUserId": "SqtrEOqx", "itemType": "OPTIONBOX", "language": "Frsl", "metadata": {"ZoDdT0fe": "fo74eg3N", "t2c0r4Gq": "F0NHglOV", "uNZ9LzNe": "JnBurh54"}, "notifyUrl": "CWbYb0Pe", "omitNotification": false, "platform": "0GKwJ3vf", "price": 4, "recurringPaymentOrderNo": "lsAMy2Zp", "region": "2UAGxHnm", "returnUrl": "SxvkG9UR", "sandbox": true, "sku": "uymTBjn3", "subscriptionId": "d2sFzMS3", "title": "QaVjZF7A"}' \
    > test.out 2>&1
eval_tap $? 236 'CreateUserPaymentOrder' test.out

#- 237 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'x6115Kg9' \
    --userId 'U8vrQJXQ' \
    --body '{"description": "xoIbVi2C"}' \
    > test.out 2>&1
eval_tap $? 237 'RefundUserPaymentOrder' test.out

#- 238 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEk277Iv' \
    --body '{"code": "jj1A647X", "orderNo": "Q3koaAfZ"}' \
    > test.out 2>&1
eval_tap $? 238 'ApplyUserRedemption' test.out

#- 239 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iim0sFPm' \
    --body '{"meta": {"1YN27boj": {}, "DVaZLpx4": {}, "kEWYkO6K": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Other", "currencyCode": "MBwbPZTl", "namespace": "MlUvFEiG"}, "entitlement": {"entitlementId": "prcNSQ9k"}, "item": {"itemIdentity": "EeXBZ6FV", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 52, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "IrUKXttg", "namespace": "AI2QdWJF"}, "entitlement": {"entitlementId": "LmoPEgd8"}, "item": {"itemIdentity": "EMspOs8n", "itemIdentityType": "ITEM_ID", "origin": "IOS"}, "quantity": 9, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Playstation", "currencyCode": "9gj5vyUM", "namespace": "AAmIHYbs"}, "entitlement": {"entitlementId": "xG5N066F"}, "item": {"itemIdentity": "Xb88SbLO", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 2, "type": "ENTITLEMENT"}], "source": "DLC", "transactionId": "J34TIedV"}' \
    > test.out 2>&1
eval_tap $? 239 'DoRevocation' test.out

#- 240 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '3HyoX4Vn' \
    --chargeStatus 'NEVER' \
    --itemId '2LpBU08w' \
    --limit '11' \
    --offset '27' \
    --sku '58aDllwz' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 240 'QueryUserSubscriptions' test.out

#- 241 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'ak1MXxj7' \
    --excludeSystem  \
    --limit '62' \
    --offset '67' \
    --subscriptionId 'srg7900n' \
    > test.out 2>&1
eval_tap $? 241 'GetUserSubscriptionActivities' test.out

#- 242 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ml5BidsK' \
    --body '{"grantDays": 72, "itemId": "dCEzhVnO", "language": "v0PQbVIa", "reason": "KiHfoeor", "region": "Y7A1otGF", "source": "yv2SMjbE"}' \
    > test.out 2>&1
eval_tap $? 242 'PlatformSubscribeSubscription' test.out

#- 243 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'r50qGdCZ' \
    --itemId 'Ic6EFqBK' \
    > test.out 2>&1
eval_tap $? 243 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 244 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xbS7Q2Og' \
    --userId 'RucL1jwR' \
    > test.out 2>&1
eval_tap $? 244 'GetUserSubscription' test.out

#- 245 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XzfjDZZB' \
    --userId 'mOau6sym' \
    > test.out 2>&1
eval_tap $? 245 'DeleteUserSubscription' test.out

#- 246 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'e06c6SKL' \
    --userId 'c2mEC3IX' \
    --force  \
    --body '{"immediate": false, "reason": "f0lm6WBk"}' \
    > test.out 2>&1
eval_tap $? 246 'CancelSubscription' test.out

#- 247 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IzjoSV31' \
    --userId 'tvmMB6jz' \
    --body '{"grantDays": 35, "reason": "LfU7HByG"}' \
    > test.out 2>&1
eval_tap $? 247 'GrantDaysToSubscription' test.out

#- 248 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XPMqxj4h' \
    --userId 'BgVY3YAx' \
    --excludeFree  \
    --limit '89' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 248 'GetUserSubscriptionBillingHistories' test.out

#- 249 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'akUbcG7P' \
    --userId 'cR4eiU3I' \
    --body '{"additionalData": {"cardSummary": "di55jNrG"}, "authorisedTime": "1991-11-05T00:00:00Z", "chargebackReversedTime": "1998-08-13T00:00:00Z", "chargebackTime": "1995-04-01T00:00:00Z", "chargedTime": "1988-10-23T00:00:00Z", "createdTime": "1981-06-13T00:00:00Z", "currency": {"currencyCode": "fc5ZyODR", "currencySymbol": "2NVyn4PR", "currencyType": "VIRTUAL", "decimals": 67, "namespace": "f3eRbZqB"}, "customParameters": {"AoKGcVCd": {}, "MiSNV4qB": {}, "rt1kcLmR": {}}, "extOrderNo": "v6EJtl5x", "extTxId": "Wnsb8oWq", "extUserId": "94RImNWV", "issuedAt": "1989-05-12T00:00:00Z", "metadata": {"JnhhwFDV": "1Vitaomv", "WTzdsW4N": "70wYS4Kj", "7Yi2VvoQ": "NW8Yc481"}, "namespace": "dYdvGxJA", "nonceStr": "MDRA1LF7", "paymentMethod": "jdWlekFw", "paymentMethodFee": 83, "paymentOrderNo": "cEMCtQs2", "paymentProvider": "ADYEN", "paymentProviderFee": 15, "paymentStationUrl": "EcvVAyId", "price": 19, "refundedTime": "1985-05-06T00:00:00Z", "salesTax": 13, "sandbox": false, "sku": "HVDsZBQg", "status": "REFUNDING", "statusReason": "qsPNJMiZ", "subscriptionId": "XXOFwmGW", "subtotalPrice": 55, "targetNamespace": "FMnPpWgr", "targetUserId": "QD4hEk0O", "tax": 76, "totalPrice": 66, "totalTax": 20, "txEndTime": "1975-10-28T00:00:00Z", "type": "snignE7K", "userId": "cMF7fuDb", "vat": 52}' \
    > test.out 2>&1
eval_tap $? 249 'ProcessUserSubscriptionNotification' test.out

#- 250 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'qsFiQHgl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UQMZi5Wj' \
    --body '{"count": 78, "orderNo": "Y9aL9ie6"}' \
    > test.out 2>&1
eval_tap $? 250 'AcquireUserTicket' test.out

#- 251 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'vvMbiNUR' \
    > test.out 2>&1
eval_tap $? 251 'QueryUserCurrencyWallets' test.out

#- 252 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'rlm88QlK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yuoya4Jg' \
    --body '{"allowOverdraft": false, "amount": 50, "balanceOrigin": "IOS", "reason": "4ejmVA3v"}' \
    > test.out 2>&1
eval_tap $? 252 'DebitUserWalletByCurrencyCode' test.out

#- 253 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'MCsGyPd1' \
    --namespace "$AB_NAMESPACE" \
    --userId '2B8QNUz0' \
    --limit '14' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 253 'ListUserCurrencyTransactions' test.out

#- 254 CheckWallet
eval_tap 0 254 'CheckWallet # SKIP deprecated' test.out

#- 255 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'FFNbH6j2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4roZM2U' \
    --body '{"amount": 75, "expireAt": "1983-08-04T00:00:00Z", "origin": "Twitch", "reason": "XEEsL5D0", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 255 'CreditUserWallet' test.out

#- 256 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'xfNEjUMT' \
    --namespace "$AB_NAMESPACE" \
    --userId 's8WIObJB' \
    --body '{"amount": 93, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 256 'PayWithUserWallet' test.out

#- 257 GetUserWallet
eval_tap 0 257 'GetUserWallet # SKIP deprecated' test.out

#- 258 DebitUserWallet
eval_tap 0 258 'DebitUserWallet # SKIP deprecated' test.out

#- 259 DisableUserWallet
eval_tap 0 259 'DisableUserWallet # SKIP deprecated' test.out

#- 260 EnableUserWallet
eval_tap 0 260 'EnableUserWallet # SKIP deprecated' test.out

#- 261 ListUserWalletTransactions
eval_tap 0 261 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 262 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RUQmauIY' \
    > test.out 2>&1
eval_tap $? 262 'ListViews' test.out

#- 263 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId '5HXCZ0W4' \
    --body '{"displayOrder": 40, "localizations": {"mWP0HzSd": {"description": "iylLhVYs", "localExt": {"zm8xY33O": {}, "Qbumu2QH": {}, "LyZNuysy": {}}, "longDescription": "M4OfCzdQ", "title": "CXMAWnf8"}, "7YPNOe9E": {"description": "evf1fhMg", "localExt": {"1E2k7QLF": {}, "rVgtX7y0": {}, "fPOieDCo": {}}, "longDescription": "w2zXyFFV", "title": "pM87yqEw"}, "EacQMTlq": {"description": "N4LKkxJ5", "localExt": {"v3SBafnK": {}, "NiMPbFkF": {}, "GA85W3HJ": {}}, "longDescription": "kqgS2B37", "title": "wwoPYOHi"}}, "name": "IsxmsLBP"}' \
    > test.out 2>&1
eval_tap $? 263 'CreateView' test.out

#- 264 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'BJuNLnWR' \
    --storeId 'rtW870qD' \
    > test.out 2>&1
eval_tap $? 264 'GetView' test.out

#- 265 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '88ZcduZS' \
    --storeId 'e7W20UZc' \
    --body '{"displayOrder": 59, "localizations": {"JHAckUyB": {"description": "ksYQfDm0", "localExt": {"RNFwiz70": {}, "tRVLMlHi": {}, "8i9gOVqa": {}}, "longDescription": "jUWrgEsW", "title": "DtaKzn8d"}, "ZwnnGeZs": {"description": "ZVgbPzPF", "localExt": {"brOMZMgW": {}, "kFN7Tpkx": {}, "6GcfyOg6": {}}, "longDescription": "ZUrrp9ub", "title": "g9mndW2J"}, "KmQafUs2": {"description": "bxYztOEy", "localExt": {"VbKIf1Zb": {}, "zgUwd8DH": {}, "oCQykmXH": {}}, "longDescription": "YmkRlg7g", "title": "Ys6unPYQ"}}, "name": "9jNQN1di"}' \
    > test.out 2>&1
eval_tap $? 265 'UpdateView' test.out

#- 266 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '1ldhOh6H' \
    --storeId 'vjnYuV7N' \
    > test.out 2>&1
eval_tap $? 266 'DeleteView' test.out

#- 267 QueryWallets
eval_tap 0 267 'QueryWallets # SKIP deprecated' test.out

#- 268 GetWallet
eval_tap 0 268 'GetWallet # SKIP deprecated' test.out

#- 269 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'fC4A2ODi' \
    --end 'Zhbfb8Qq' \
    --start 'CyK1XH9D' \
    > test.out 2>&1
eval_tap $? 269 'SyncOrders' test.out

#- 270 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["6vl5eFdF", "fgK46GjC", "WaP8huTm"], "apiKey": "nq3FGQn3", "authoriseAsCapture": true, "blockedPaymentMethods": ["LrqbiKud", "v9z75Szo", "CV8ZMi2o"], "clientKey": "1nR482D6", "dropInSettings": "gNClk9c8", "liveEndpointUrlPrefix": "7hosaPFC", "merchantAccount": "5zBW3ZgV", "notificationHmacKey": "ZCj9ObVG", "notificationPassword": "T0Scwl4k", "notificationUsername": "NmCi15XT", "returnUrl": "JTgCNNH7", "settings": "RtG5Xmo9"}' \
    > test.out 2>&1
eval_tap $? 270 'TestAdyenConfig' test.out

#- 271 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "Q0Wb07N1", "privateKey": "7fkxZSc6", "publicKey": "VbE0AGce", "returnUrl": "kjMNHuPX"}' \
    > test.out 2>&1
eval_tap $? 271 'TestAliPayConfig' test.out

#- 272 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "tz8tXxrm", "secretKey": "zafMUguy"}' \
    > test.out 2>&1
eval_tap $? 272 'TestCheckoutConfig' test.out

#- 273 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'DoN91uc2' \
    > test.out 2>&1
eval_tap $? 273 'DebugMatchedPaymentMerchantConfig' test.out

#- 274 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "8HoSpGt1", "clientSecret": "g0GGbT4H", "returnUrl": "f2PPKOld", "webHookId": "kbgX9CWJ"}' \
    > test.out 2>&1
eval_tap $? 274 'TestPayPalConfig' test.out

#- 275 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["KwXXSbv5", "eg9q86Ia", "DFjjx6uZ"], "publishableKey": "erWbtwTX", "secretKey": "9gNRByjb", "webhookSecret": "E8lOLAfT"}' \
    > test.out 2>&1
eval_tap $? 275 'TestStripeConfig' test.out

#- 276 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "XKLzbrdd", "key": "qcKLa7Le", "mchid": "vxNHOSEh", "returnUrl": "QRZIp693"}' \
    > test.out 2>&1
eval_tap $? 276 'TestWxPayConfig' test.out

#- 277 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "lRwtc43a", "flowCompletionUrl": "tCuCFxbf", "merchantId": 2, "projectId": 86, "projectSecretKey": "z4aQERzi"}' \
    > test.out 2>&1
eval_tap $? 277 'TestXsollaConfig' test.out

#- 278 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'PL4dHhOq' \
    > test.out 2>&1
eval_tap $? 278 'GetPaymentMerchantConfig' test.out

#- 279 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'G5KDdUvk' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["0LEi26Ls", "7mjRxNmv", "vNtjJNQe"], "apiKey": "pUTGhwlY", "authoriseAsCapture": true, "blockedPaymentMethods": ["lPzlsCR5", "rVsyfcH7", "WjP7HuGz"], "clientKey": "3b5WAEvd", "dropInSettings": "RF9bqMj4", "liveEndpointUrlPrefix": "ro5B19VE", "merchantAccount": "838c7Oyd", "notificationHmacKey": "Vw0zCqoM", "notificationPassword": "ZvpIOO97", "notificationUsername": "DmQ5ZOzx", "returnUrl": "6iCJTu60", "settings": "IifzMhkk"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateAdyenConfig' test.out

#- 280 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '5PxsjqbC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestAdyenConfigById' test.out

#- 281 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'KpMv2Yky' \
    --sandbox  \
    --validate  \
    --body '{"appId": "9DYkD2sI", "privateKey": "llFtBtXJ", "publicKey": "KG3rqBmI", "returnUrl": "LhtWm8RQ"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdateAliPayConfig' test.out

#- 282 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'vRUbUDSi' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 282 'TestAliPayConfigById' test.out

#- 283 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'efGEdLuc' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "rtO2gCQD", "secretKey": "057DrDlg"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdateCheckoutConfig' test.out

#- 284 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'C2nzS9Si' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 284 'TestCheckoutConfigById' test.out

#- 285 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'GUjVAw4v' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "3q6JRHcn", "clientSecret": "7KaoCEkR", "returnUrl": "do6qHYIZ", "webHookId": "WnXqQ1oH"}' \
    > test.out 2>&1
eval_tap $? 285 'UpdatePayPalConfig' test.out

#- 286 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'FJ9Q0vqs' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 286 'TestPayPalConfigById' test.out

#- 287 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'L9SomqWs' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["GA76yxi0", "QzZWfmP2", "sx0KO5bE"], "publishableKey": "JaPnAFjs", "secretKey": "odyJQVVB", "webhookSecret": "rShGbIIu"}' \
    > test.out 2>&1
eval_tap $? 287 'UpdateStripeConfig' test.out

#- 288 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'qK8C403H' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 288 'TestStripeConfigById' test.out

#- 289 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'goXCR6XO' \
    --validate  \
    --body '{"appId": "MXwKdfqk", "key": "8T4QHK30", "mchid": "EX0FclpD", "returnUrl": "l5Hsurac"}' \
    > test.out 2>&1
eval_tap $? 289 'UpdateWxPayConfig' test.out

#- 290 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'O5MnjnxD' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 290 'UpdateWxPayConfigCert' test.out

#- 291 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '1OXkxShF' \
    > test.out 2>&1
eval_tap $? 291 'TestWxPayConfigById' test.out

#- 292 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'VQTRekLf' \
    --validate  \
    --body '{"apiKey": "jmy8zosR", "flowCompletionUrl": "CRgVwbrQ", "merchantId": 74, "projectId": 43, "projectSecretKey": "mb01yA7U"}' \
    > test.out 2>&1
eval_tap $? 292 'UpdateXsollaConfig' test.out

#- 293 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '7dGMjupZ' \
    > test.out 2>&1
eval_tap $? 293 'TestXsollaConfigById' test.out

#- 294 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'kZQY8CNy' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 294 'UpdateXsollaUIConfig' test.out

#- 295 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '71' \
    --namespace "$AB_NAMESPACE" \
    --offset '94' \
    --region 'bfT22G5N' \
    > test.out 2>&1
eval_tap $? 295 'QueryPaymentProviderConfig' test.out

#- 296 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "UCGBVfpc", "region": "tNFUsUQ6", "sandboxTaxJarApiToken": "ZXQcb2o1", "specials": ["PAYPAL", "WXPAY", "ALIPAY"], "taxJarApiToken": "b9e7vXZV", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 296 'CreatePaymentProviderConfig' test.out

#- 297 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 297 'GetAggregatePaymentProviders' test.out

#- 298 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'c0apxqZ2' \
    > test.out 2>&1
eval_tap $? 298 'DebugMatchedPaymentProviderConfig' test.out

#- 299 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 299 'GetSpecialPaymentProviders' test.out

#- 300 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '09BySn8a' \
    --body '{"aggregate": "ADYEN", "namespace": "BixKJXCI", "region": "SQdwec1m", "sandboxTaxJarApiToken": "8BusV9tU", "specials": ["ALIPAY", "STRIPE", "CHECKOUT"], "taxJarApiToken": "o6Xqjz2x", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 300 'UpdatePaymentProviderConfig' test.out

#- 301 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'NWSmYyVv' \
    > test.out 2>&1
eval_tap $? 301 'DeletePaymentProviderConfig' test.out

#- 302 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 302 'GetPaymentTaxConfig' test.out

#- 303 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "yelIJ8Qg", "taxJarApiToken": "aLMqi836", "taxJarEnabled": true, "taxJarProductCodesMapping": {"a7cfZl4V": "uY6rsZyo", "6CBRRnoO": "ikIxXKKI", "R6kPmswm": "5TCAU1cK"}}' \
    > test.out 2>&1
eval_tap $? 303 'UpdatePaymentTaxConfig' test.out

#- 304 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'ApdJDnE7' \
    --end '3GLmSZns' \
    --start '5owBhoUg' \
    > test.out 2>&1
eval_tap $? 304 'SyncPaymentOrders' test.out

#- 305 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '4LsGP6KL' \
    --storeId 'PXkvUv2X' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetRootCategories' test.out

#- 306 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'iXaBzsma' \
    --storeId 'xjTZPlLi' \
    > test.out 2>&1
eval_tap $? 306 'DownloadCategories' test.out

#- 307 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'tytGka7K' \
    --namespace "$AB_NAMESPACE" \
    --language 'v5TacQKF' \
    --storeId '4OlRGdmX' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetCategory' test.out

#- 308 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'xETLEQrr' \
    --namespace "$AB_NAMESPACE" \
    --language '3KCAV9al' \
    --storeId 'q3hK1G4k' \
    > test.out 2>&1
eval_tap $? 308 'PublicGetChildCategories' test.out

#- 309 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'KooSNNUZ' \
    --namespace "$AB_NAMESPACE" \
    --language 'uiynZ64I' \
    --storeId 'wncZPk82' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetDescendantCategories' test.out

#- 310 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 310 'PublicListCurrencies' test.out

#- 311 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    > test.out 2>&1
eval_tap $? 311 'GetIAPItemMapping' test.out

#- 312 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '3eTC0vzZ' \
    --region 'UDj9dzGg' \
    --storeId 'GVxo9OHg' \
    --appId 'fHumyfuB' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetItemByAppId' test.out

#- 313 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'fC0Gjvpg' \
    --categoryPath 'JfuBs1Vp' \
    --features 'qn47GVgh' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --language 'H2wToOnq' \
    --limit '38' \
    --offset '96' \
    --region '97KvKyj3' \
    --sortBy 'createdAt:asc,displayOrder,createdAt:desc' \
    --storeId '3wmRTrDC' \
    --tags 'jhnKvsHe' \
    > test.out 2>&1
eval_tap $? 313 'PublicQueryItems' test.out

#- 314 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'zWTqgYPi' \
    --region 'xtHk6lWq' \
    --storeId '6tEeUmU9' \
    --sku '6FLEak0m' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetItemBySku' test.out

#- 315 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'JqjRYldc' \
    --region 'TpdeCD9X' \
    --storeId 'PRi4bAQL' \
    --itemIds '7VE2wL8Y' \
    > test.out 2>&1
eval_tap $? 315 'PublicBulkGetItems' test.out

#- 316 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["4JFVUdzA", "8bvXlDhG", "7BrorbKI"]}' \
    > test.out 2>&1
eval_tap $? 316 'PublicValidateItemPurchaseCondition' test.out

#- 317 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SEASON' \
    --limit '69' \
    --offset '42' \
    --region 'rkoqv2mM' \
    --storeId '6soMaTvQ' \
    --keyword 'q2a9YdFN' \
    --language 'tRVSO0js' \
    > test.out 2>&1
eval_tap $? 317 'PublicSearchItems' test.out

#- 318 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '0hG9xmSn' \
    --namespace "$AB_NAMESPACE" \
    --language 'zd7zgUxA' \
    --region 'ogcnGkXk' \
    --storeId '17QPkJHR' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetApp' test.out

#- 319 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'hmLKQuQV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 319 'PublicGetItemDynamicData' test.out

#- 320 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'FSKiXl8G' \
    --namespace "$AB_NAMESPACE" \
    --language '2uf6E8Ea' \
    --populateBundle  \
    --region 'jXLSAS8M' \
    --storeId 'KMaxQ1Qy' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetItem' test.out

#- 321 GetPaymentCustomization
eval_tap 0 321 'GetPaymentCustomization # SKIP deprecated' test.out

#- 322 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "JCpKedhu", "paymentProvider": "WXPAY", "returnUrl": "TNAxq26g", "ui": "ZrPqCsSD", "zipCode": "spvgM16s"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetPaymentUrl' test.out

#- 323 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Z6rjnkH4' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetPaymentMethods' test.out

#- 324 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ExObppC6' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUnpaidPaymentOrder' test.out

#- 325 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CMYDm5ge' \
    --paymentProvider 'ALIPAY' \
    --zipCode '59UDEOF6' \
    --body '{"token": "gp5Ufmjt"}' \
    > test.out 2>&1
eval_tap $? 325 'Pay' test.out

#- 326 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iVbqJnZc' \
    > test.out 2>&1
eval_tap $? 326 'PublicCheckPaymentOrderPaidStatus' test.out

#- 327 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'STRIPE' \
    --region 'WDKEt6Jh' \
    > test.out 2>&1
eval_tap $? 327 'GetPaymentPublicConfig' test.out

#- 328 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'bJ0fwTDa' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetQRCode' test.out

#- 329 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'q6b5RpMw' \
    --foreinginvoice 'hWPtndri' \
    --invoiceId 'XU9loOxp' \
    --payload 'mEuwDVc1' \
    --redirectResult '2r0DVUGg' \
    --resultCode 'GHkapTCa' \
    --sessionId 'fFMdvYiC' \
    --status 'BuzUUwyI' \
    --token '6Vtd4v9k' \
    --type '4fv3kMiu' \
    --userId 'Q3DhsKLx' \
    --orderNo 'jt5srPFx' \
    --paymentOrderNo 'BgpFtDBm' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'LH9kP9U5' \
    > test.out 2>&1
eval_tap $? 329 'PublicNormalizePaymentReturnUrl' test.out

#- 330 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '3z6joBAh' \
    --paymentOrderNo 'AlJGI2YY' \
    --paymentProvider 'ADYEN' \
    > test.out 2>&1
eval_tap $? 330 'GetPaymentTaxValue' test.out

#- 331 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'dhkBzAzP' \
    > test.out 2>&1
eval_tap $? 331 'GetRewardByCode' test.out

#- 332 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'kt1efGJe' \
    --limit '73' \
    --offset '85' \
    --sortBy 'rewardCode,namespace:desc,namespace' \
    > test.out 2>&1
eval_tap $? 332 'QueryRewards1' test.out

#- 333 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '62tHxDb0' \
    > test.out 2>&1
eval_tap $? 333 'GetReward1' test.out

#- 334 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 334 'PublicListStores' test.out

#- 335 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds '6ZFy3ugl,Sp2UxvF2,uLXWilRD' \
    --itemIds '7HD6LCgd,FxRGj00R,T6LvcnGM' \
    --skus 'JbJIYLss,Mvy9gkfT,MRrXVRcA' \
    > test.out 2>&1
eval_tap $? 335 'PublicExistsAnyMyActiveEntitlement' test.out

#- 336 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'VRDX6gmD' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 337 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId 'eToFmkHJ' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 338 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'BPOKFLxI' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 339 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'wKssw647,YwDudnGR,ufOUGfMj' \
    --itemIds 'TU226l07,jPlcYaqY,M7YfBmhj' \
    --skus 'I9Y28qVc,eS9UX48d,KPCFUIey' \
    > test.out 2>&1
eval_tap $? 339 'PublicGetEntitlementOwnershipToken' test.out

#- 340 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "YEymNXzN", "language": "Buh", "region": "8pVZ8GlU"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncTwitchDropsEntitlement' test.out

#- 341 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '8962e6gt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 341 'PublicGetMyWallet' test.out

#- 342 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'n5pUARJM' \
    --body '{"epicGamesJwtToken": "1T8QwMNO"}' \
    > test.out 2>&1
eval_tap $? 342 'SyncEpicGameDLC' test.out

#- 343 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'AzXmyHEV' \
    --body '{"serviceLabel": 13}' \
    > test.out 2>&1
eval_tap $? 343 'PublicSyncPsnDlcInventory' test.out

#- 344 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'g9P6a280' \
    --body '{"serviceLabels": [80, 91, 96]}' \
    > test.out 2>&1
eval_tap $? 344 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 345 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'RNB5dVCs' \
    --body '{"appId": "B7xL4axS", "steamId": "PgPCiwLx"}' \
    > test.out 2>&1
eval_tap $? 345 'SyncSteamDLC' test.out

#- 346 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'CFLDixZw' \
    --body '{"xstsToken": "Vtt3RVTl"}' \
    > test.out 2>&1
eval_tap $? 346 'SyncXboxDLC' test.out

#- 347 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '0tR00oQg' \
    --appType 'DEMO' \
    --entitlementClazz 'CODE' \
    --entitlementName 'HdGGK3x7' \
    --features '6U1EIckl,ttmrpgF5,szl0sMY8' \
    --itemId 'es36r1Fg,R70eNLHk,VrEFd8xA' \
    --limit '35' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 347 'PublicQueryUserEntitlements' test.out

#- 348 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ycJV5YqE' \
    --appId '2myQzl7X' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetUserAppEntitlementByAppId' test.out

#- 349 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '9fHr6WvB' \
    --limit '48' \
    --offset '97' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 349 'PublicQueryUserEntitlementsByAppType' test.out

#- 350 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SfE9nbE2' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'Df9B22HG' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUserEntitlementByItemId' test.out

#- 351 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gxakPt7I' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'HFaj6Vxs' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserEntitlementBySku' test.out

#- 352 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '3GuA4S1d' \
    --appIds 'S7H7yIS7,b5TSDRIo,Mg7Dc5AP' \
    --itemIds 'zfzXDELJ,FaIaEMW5,bhJyL72W' \
    --skus 'DyhBsCCb,nfihnXKx,GxaupnTT' \
    > test.out 2>&1
eval_tap $? 352 'PublicExistsAnyUserActiveEntitlement' test.out

#- 353 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9ihZkvF' \
    --appId 'KfSHQh8I' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 354 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '9xk3sFl0' \
    --entitlementClazz 'APP' \
    --itemId '6yhniEHL' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 355 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEQKc0aU' \
    --ids 'vrKXDIjY,C4df9qsw,SlpCI8Dh' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 356 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'jlxUyrs3' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'qE1wJhfo' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 357 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'gWg2Apm0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sUy18aWn' \
    > test.out 2>&1
eval_tap $? 357 'PublicGetUserEntitlement' test.out

#- 358 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '65Co0vdC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8so6JSa' \
    --body '{"options": ["ZAIadKDE", "ZywonA2S", "rEdN2tmG"], "requestId": "uX6r0gBV", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 358 'PublicConsumeUserEntitlement' test.out

#- 359 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'A5mkufBp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WVxIK9D2' \
    --body '{"requestId": "bTcgaKoc", "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 359 'PublicSellUserEntitlement' test.out

#- 360 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'gklBUS6u' \
    --body '{"code": "wWrCQt86", "language": "CRqG-bjkH", "region": "pcyNkUvq"}' \
    > test.out 2>&1
eval_tap $? 360 'PublicRedeemCode' test.out

#- 361 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'n6eXr6FN' \
    --body '{"excludeOldTransactions": false, "language": "ykYT-ZAom", "productId": "UlugIAkn", "receiptData": "XcSaVYcA", "region": "Yp7qSiDv", "transactionId": "sfMUOpWv"}' \
    > test.out 2>&1
eval_tap $? 361 'PublicFulfillAppleIAPItem' test.out

#- 362 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '46sXvpOj' \
    --body '{"epicGamesJwtToken": "rpRo4mYr"}' \
    > test.out 2>&1
eval_tap $? 362 'SyncEpicGamesInventory' test.out

#- 363 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'CeQUnYoI' \
    --body '{"autoAck": true, "language": "vGRc_gzSb_cJ", "orderId": "wosKhDlL", "packageName": "fTKxpVOX", "productId": "vGSrdkqd", "purchaseTime": 7, "purchaseToken": "i6dO3zkb", "region": "Dseh4tJd"}' \
    > test.out 2>&1
eval_tap $? 363 'PublicFulfillGoogleIAPItem' test.out

#- 364 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'oGcwMBme' \
    --body '{"currencyCode": "gqVUaWMJ", "price": 0.43683132006195124, "productId": "jrV0p9A7", "serviceLabel": 39}' \
    > test.out 2>&1
eval_tap $? 364 'PublicReconcilePlayStationStore' test.out

#- 365 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7CL1cQC' \
    --body '{"currencyCode": "SoqHvH7g", "price": 0.9450226525846964, "productId": "3cOx6yrI", "serviceLabels": [1, 52, 46]}' \
    > test.out 2>&1
eval_tap $? 365 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 366 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '7pKOLrF5' \
    --body '{"appId": "i3gr3Cc4", "currencyCode": "M2O7NrTQ", "language": "eolF_Kdyh", "price": 0.3689107754145494, "productId": "qx7T3l1u", "region": "t2oyolli", "steamId": "YsTJUmps"}' \
    > test.out 2>&1
eval_tap $? 366 'SyncSteamInventory' test.out

#- 367 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cwLcUml3' \
    --body '{"gameId": "KuoMKh7t", "language": "KS", "region": "qUNIbJMJ"}' \
    > test.out 2>&1
eval_tap $? 367 'SyncTwitchDropsEntitlement1' test.out

#- 368 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '9ABbKVWO' \
    --body '{"currencyCode": "2YEDiqkw", "price": 0.5912059795076063, "productId": "bpdk7wlD", "xstsToken": "ngNiPPjp"}' \
    > test.out 2>&1
eval_tap $? 368 'SyncXboxInventory' test.out

#- 369 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'SAlZwFGp' \
    --itemId 'ea5ObBB4' \
    --limit '89' \
    --offset '75' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 369 'PublicQueryUserOrders' test.out

#- 370 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4ClIQmk' \
    --body '{"currencyCode": "IdLCvNhZ", "discountedPrice": 0, "ext": {"P8aqZ2yf": {}, "rC1V7ZpJ": {}, "ZPHCMqvc": {}}, "itemId": "YmeDLYEz", "language": "rur_uVJG_ZS", "price": 6, "quantity": 88, "region": "qclNlBOR", "returnUrl": "lC8Zkjsx"}' \
    > test.out 2>&1
eval_tap $? 370 'PublicCreateUserOrder' test.out

#- 371 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YtgxplHT' \
    --userId 'PLzynjFZ' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserOrder' test.out

#- 372 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gF3erw7U' \
    --userId 'syHq4bBb' \
    > test.out 2>&1
eval_tap $? 372 'PublicCancelUserOrder' test.out

#- 373 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0n1JhPUS' \
    --userId '8BRPGV9n' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetUserOrderHistories' test.out

#- 374 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '769zLJdK' \
    --userId 'MexeJc7N' \
    > test.out 2>&1
eval_tap $? 374 'PublicDownloadUserOrderReceipt' test.out

#- 375 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'vgTSgKjC' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetPaymentAccounts' test.out

#- 376 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'xZjKf8NA' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'cGUaDfy9' \
    > test.out 2>&1
eval_tap $? 376 'PublicDeletePaymentAccount' test.out

#- 377 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'XnH2r0EK' \
    --language 'rk5VlnKs' \
    --region 'WCPccAFn' \
    --storeId '5CEPoH6o' \
    --viewId 'pK5DSO8J' \
    > test.out 2>&1
eval_tap $? 377 'PublicListActiveSections' test.out

#- 378 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'yX4IE1z3' \
    --chargeStatus 'NEVER' \
    --itemId 'lNNqLyrl' \
    --limit '52' \
    --offset '32' \
    --sku 'rJ4QHbfn' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 378 'PublicQueryUserSubscriptions' test.out

#- 379 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '6nc6jLF9' \
    --body '{"currencyCode": "DIW2ncJJ", "itemId": "KpqmgvUT", "language": "cHz-706", "region": "n46W2B2u", "returnUrl": "PQLrt2t6", "source": "bVpCgKvP"}' \
    > test.out 2>&1
eval_tap $? 379 'PublicSubscribeSubscription' test.out

#- 380 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XSDufmKh' \
    --itemId '783cV54J' \
    > test.out 2>&1
eval_tap $? 380 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 381 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'sVBRB0rY' \
    --userId '0xfWddAC' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetUserSubscription' test.out

#- 382 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yHSmo4KX' \
    --userId '9TPO3K1k' \
    > test.out 2>&1
eval_tap $? 382 'PublicChangeSubscriptionBillingAccount' test.out

#- 383 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5ZM8btmG' \
    --userId 'sgXNXbpq' \
    --body '{"immediate": true, "reason": "nc3eFm95"}' \
    > test.out 2>&1
eval_tap $? 383 'PublicCancelSubscription' test.out

#- 384 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0dtVAo7w' \
    --userId '4e3v5mh6' \
    --excludeFree  \
    --limit '89' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetUserSubscriptionBillingHistories' test.out

#- 385 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'oDm9FaP0' \
    --language 'HJ98tE4U' \
    --storeId 'yoQg0b0s' \
    > test.out 2>&1
eval_tap $? 385 'PublicListViews' test.out

#- 386 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'GOkzxVt1' \
    --namespace "$AB_NAMESPACE" \
    --userId '5LKmkQ7Y' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetWallet' test.out

#- 387 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'BhsOuJ0y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pkkt2G4e' \
    --limit '65' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 387 'PublicListUserWalletTransactions' test.out

#- 388 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'jiZPMoZZ' \
    --baseAppId 'cyGEHxAK' \
    --categoryPath 'DQher3us' \
    --features 'ApPdJPn9' \
    --includeSubCategoryItem  \
    --itemName 'eIdhIBvT' \
    --itemStatus 'ACTIVE' \
    --itemType 'INGAMEITEM' \
    --limit '68' \
    --offset '31' \
    --region 'WkcVk0X2' \
    --sortBy 'updatedAt:asc,updatedAt:desc,name' \
    --storeId 'S54vl7gI' \
    --tags 'KBc7OYTy' \
    --targetNamespace 'lFRAJKyS' \
    > test.out 2>&1
eval_tap $? 388 'QueryItems1' test.out

#- 389 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nC0cfPl3' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 389 'ImportStore1' test.out

#- 390 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Z2zSBbs4' \
    --body '{"itemIds": ["PAV72u8A", "xE2IQeox", "YV4UcYzs"]}' \
    > test.out 2>&1
eval_tap $? 390 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE