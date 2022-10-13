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
echo "1..359"

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
    --body '{"context": {"item": {"appId": "DUwpQd1m", "appType": "SOFTWARE", "baseAppId": "ug0DFzP9", "boothName": "wrJJLYQ2", "boundItemIds": ["wFKENw9r", "Dg8odc9h", "Wt6474L6"], "categoryPath": "bNp0B9kv", "clazz": "gTzwgUrt", "createdAt": "1983-09-17T00:00:00Z", "description": "1PwE8Pt4", "displayOrder": 73, "entitlementType": "DURABLE", "ext": {"EtB9YVFa": {}, "0HLbSC0Z": {}, "UDaSvqDY": {}}, "features": ["IjCGpPZV", "n4oiajwr", "kERAUpQV"], "fresh": true, "images": [{"as": "P4u2hcnI", "caption": "zVFkzpnv", "height": 71, "imageUrl": "nhpFD7v3", "smallImageUrl": "3EMfGCWm", "width": 2}, {"as": "v0SCGo7J", "caption": "23OoYqQP", "height": 1, "imageUrl": "2X9KAroo", "smallImageUrl": "vO376wSM", "width": 84}, {"as": "2TSTx4cQ", "caption": "y59umfbZ", "height": 1, "imageUrl": "qtGfTKqR", "smallImageUrl": "xw9h29s5", "width": 54}], "itemId": "YXASrUDD", "itemIds": ["KuE0JR5A", "APByHafn", "RQcXE3tm"], "itemQty": {"MLEJkB4L": 40, "paXOgaPy": 74, "FaaEjoUU": 45}, "itemType": "OPTIONBOX", "language": "uD0okftU", "listable": false, "localExt": {"s1HVaylC": {}, "tRafCxtu": {}, "zu131VOx": {}}, "longDescription": "zrHY7bQp", "maxCount": 43, "maxCountPerUser": 85, "name": "EKM9usub", "namespace": "8XLiFqN2", "optionBoxConfig": {"boxItems": [{"count": 71, "itemId": "SHPHEFfg", "itemSku": "5gyEAAZ8"}, {"count": 15, "itemId": "tYArHoqL", "itemSku": "aq7ADiln"}, {"count": 38, "itemId": "QFW9OkRg", "itemSku": "sIrJ58NF"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 29, "comparison": "isLessThan", "name": "WC7BYRIy", "predicateType": "SeasonPassPredicate", "value": "MPcBBP6K", "values": ["VE0xORB1", "swKZEpTX", "v8JfaAKi"]}, {"anyOf": 23, "comparison": "isGreaterThan", "name": "LIaQVBhv", "predicateType": "SeasonPassPredicate", "value": "wcuVYprQ", "values": ["fTu3jbhD", "b9Q0kVLW", "MottxQlH"]}, {"anyOf": 94, "comparison": "isLessThan", "name": "YqrMrPd9", "predicateType": "EntitlementPredicate", "value": "ExiY0aYI", "values": ["Am973n4g", "oWi6Dr0j", "MREnUEi0"]}]}, {"operator": "or", "predicates": [{"anyOf": 22, "comparison": "isNot", "name": "HNfgKGAR", "predicateType": "SeasonTierPredicate", "value": "ukaCMbhb", "values": ["I3EB9gpg", "hy8jG0v0", "hThqMagn"]}, {"anyOf": 0, "comparison": "includes", "name": "QTK1xwhu", "predicateType": "SeasonPassPredicate", "value": "jeuvaJnL", "values": ["yyy3g30K", "S9Qwvlf8", "oshCzWq6"]}, {"anyOf": 87, "comparison": "isLessThan", "name": "SVzKiiEK", "predicateType": "SeasonPassPredicate", "value": "FjMNZhos", "values": ["6A0HbK2l", "uWrofmiw", "nPiSRIeD"]}]}, {"operator": "or", "predicates": [{"anyOf": 41, "comparison": "excludes", "name": "w2uLhxyu", "predicateType": "SeasonPassPredicate", "value": "EuW4wOT3", "values": ["mBPm4jv8", "nnfmkABU", "h1oTlVYQ"]}, {"anyOf": 29, "comparison": "includes", "name": "7zD5oS4j", "predicateType": "SeasonTierPredicate", "value": "t2lXsR0p", "values": ["l7ttbCFu", "E8coTVkz", "xymoWglS"]}, {"anyOf": 76, "comparison": "excludes", "name": "otA5eST3", "predicateType": "SeasonPassPredicate", "value": "meq2mFk8", "values": ["Jz4TxYGn", "zR82b9aa", "0qg2LBG9"]}]}]}, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 53, "fixedTrialCycles": 26, "graceDays": 73}, "region": "1iUBhoAx", "regionData": [{"currencyCode": "wObXBb3L", "currencyNamespace": "i00ZPxIv", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1972-01-16T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1994-05-26T00:00:00Z", "discountedPrice": 93, "expireAt": "1998-02-16T00:00:00Z", "price": 73, "purchaseAt": "1973-08-10T00:00:00Z", "trialPrice": 42}, {"currencyCode": "sos5o8SV", "currencyNamespace": "JMoEVwq5", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1973-03-07T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1980-06-20T00:00:00Z", "discountedPrice": 12, "expireAt": "1985-06-01T00:00:00Z", "price": 5, "purchaseAt": "1985-06-03T00:00:00Z", "trialPrice": 54}, {"currencyCode": "3kHB9Dl8", "currencyNamespace": "VVvlaOwg", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1988-03-10T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1971-05-29T00:00:00Z", "discountedPrice": 64, "expireAt": "1987-01-17T00:00:00Z", "price": 33, "purchaseAt": "1979-11-07T00:00:00Z", "trialPrice": 32}], "seasonType": "PASS", "sku": "BLsMnTFd", "stackable": true, "status": "INACTIVE", "tags": ["XHMMDaSP", "dpZ17738", "hbXo5hCb"], "targetCurrencyCode": "MvhAO9iS", "targetItemId": "7uUMK1MA", "targetNamespace": "tITKFa5K", "thumbnailUrl": "7fuKSx3J", "title": "AaDqKMF6", "updatedAt": "1995-07-12T00:00:00Z", "useCount": 69}, "namespace": "xLRkcB10", "order": {"currency": {"currencyCode": "RssDLyGU", "currencySymbol": "RiaWlyFm", "currencyType": "VIRTUAL", "decimals": 54, "namespace": "8Hj5FlFc"}, "ext": {"82AZRPH0": {}, "bWMnh67T": {}, "xLYQrxak": {}}, "free": false}, "source": "PURCHASE"}, "script": "ah4Df1ir", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'UgqjKcr1' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'bmBPMrb6' \
    --body '{"grantDays": "KnTe8PdY"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '4yRjGrY7' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'RxY0FFXv' \
    --body '{"grantDays": "OtD3Vzow"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "AnCnZuc6", "dryRun": false, "fulfillmentUrl": "FiNWpNVj", "itemType": "MEDIA", "purchaseConditionUrl": "wRTeXxQh"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'mxqn5JJL' \
    --itemType 'COINS' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '5XRo6mEI' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'S5zbMZzR' \
    --body '{"clazz": "MZBs7AZW", "dryRun": false, "fulfillmentUrl": "QFiGxcVs", "purchaseConditionUrl": "AH7IMT04"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'ZYURc4xr' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --name 'DTXZVVcf' \
    --offset '25' \
    --tag 'UFUj5sGF' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "hylA0jF3", "items": [{"extraSubscriptionDays": 95, "itemId": "ZgNJCWJm", "itemName": "FyPmb7uH", "quantity": 88}, {"extraSubscriptionDays": 92, "itemId": "KCNupgdO", "itemName": "LmTFSlq4", "quantity": 26}, {"extraSubscriptionDays": 80, "itemId": "hpiJKYmL", "itemName": "UkdIZI3k", "quantity": 69}], "maxRedeemCountPerCampaignPerUser": 35, "maxRedeemCountPerCode": 43, "maxRedeemCountPerCodePerUser": 74, "maxSaleCount": 13, "name": "sjWxMVf6", "redeemEnd": "1973-02-18T00:00:00Z", "redeemStart": "1991-12-28T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["YREX5qHB", "M1VaNB5l", "HQRkmStm"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'kB96cvF4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'HgYwXFsr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "1RyY38Su", "items": [{"extraSubscriptionDays": 87, "itemId": "paaOTRir", "itemName": "YGbXxRkb", "quantity": 30}, {"extraSubscriptionDays": 78, "itemId": "uqMmwDDx", "itemName": "7eaIFtsc", "quantity": 56}, {"extraSubscriptionDays": 63, "itemId": "QnwRME5n", "itemName": "IdvxDHpu", "quantity": 57}], "maxRedeemCountPerCampaignPerUser": 11, "maxRedeemCountPerCode": 69, "maxRedeemCountPerCodePerUser": 58, "maxSaleCount": 12, "name": "ouT8AXRs", "redeemEnd": "1996-07-19T00:00:00Z", "redeemStart": "1992-07-22T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["onbgDVvX", "XmKnwxuZ", "szOxcV3v"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'ejORFDms' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lSOFfRIp' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XdJaUMDG' \
    --body '{"categoryPath": "2tOALs4Q", "localizationDisplayNames": {"lxPQ9m3C": "0gj322yl", "87cSkkGa": "jditwyhR", "y7hfiTwN": "WpZgpI8y"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lX1NkGnk' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'X98RhEGb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zrA3Eb1N' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'xnmRPSxd' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pVb2rfVi' \
    --body '{"localizationDisplayNames": {"aNFLDJ3J": "eChPO7jm", "iu3eOhSi": "PN0DtwTk", "ZtPCyxTs": "pta9Zgvi"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'DZo2wh0c' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BUdCzsKp' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'rAOv1OgC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IeWn2aA5' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'mq2SAsfB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Na7mzPV0' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '9ZVZtCMv' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '98' \
    --code 'ntaN9RU0' \
    --limit '68' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'EQSKq5By' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 26}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'mv0EEWEs' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '65' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'TLzHOWW6' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '15' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '0GoQDdsz' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '66' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '59NMOzhR' \
    --namespace "$AB_NAMESPACE" \
    --code 'QDLxhxIK' \
    --limit '4' \
    --offset '80' \
    --userId 'VY5Orxth' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'o5ihNN72' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'YHWZXODc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '72laL5yY' \
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
    --body '{"currencyCode": "R5pL0BOn", "currencySymbol": "goQ9YQnb", "currencyType": "VIRTUAL", "decimals": 39, "localizationDescriptions": {"G0RCdotS": "dJmAZTbD", "I8Mr2MSp": "S1zNn205", "82nKKThY": "PYZ02ZrH"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'VYuWG54B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"gIKBbTGa": "ICEQ4obe", "yZ672yGX": "gdaBVnAk", "q5y5ajg9": "FDCDURH4"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '46lygqZa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'TMX3AeZI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '1Mg1CyyX' \
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
    --body '{"data": [{"id": "qYZNViYI", "rewards": [{"currency": {"currencyCode": "ChJSrJNC", "namespace": "bnC8FlP5"}, "item": {"itemId": "4STUQhpJ", "itemSku": "ekssdwq7", "itemType": "L9GlRS0g"}, "quantity": 91, "type": "CURRENCY"}, {"currency": {"currencyCode": "ywObjOsc", "namespace": "qUUn28BR"}, "item": {"itemId": "fK2VYOGy", "itemSku": "P1iUHQbQ", "itemType": "7hgmT5Dr"}, "quantity": 25, "type": "ITEM"}, {"currency": {"currencyCode": "ABpxoiAW", "namespace": "hzpP443x"}, "item": {"itemId": "LvNcO9xL", "itemSku": "3s28Ix8F", "itemType": "i5uSJh7C"}, "quantity": 27, "type": "ITEM"}]}, {"id": "8nMaLy0C", "rewards": [{"currency": {"currencyCode": "xDHK2E9a", "namespace": "umVyvWKx"}, "item": {"itemId": "LOltCXHy", "itemSku": "xy7BsPMy", "itemType": "6F3UHQIn"}, "quantity": 78, "type": "CURRENCY"}, {"currency": {"currencyCode": "BNO5NS65", "namespace": "o3D9NkG5"}, "item": {"itemId": "6wApcI5E", "itemSku": "Xnmg1cCL", "itemType": "w5HzMujX"}, "quantity": 13, "type": "ITEM"}, {"currency": {"currencyCode": "qgmJCW5Q", "namespace": "3dNVSvJ0"}, "item": {"itemId": "uBwHcBkJ", "itemSku": "T8E9LACk", "itemType": "7Jmefpi6"}, "quantity": 25, "type": "ITEM"}]}, {"id": "LRuxMRQH", "rewards": [{"currency": {"currencyCode": "fdNIsKS6", "namespace": "5602EAfV"}, "item": {"itemId": "UszjHtpP", "itemSku": "hFj5DZMK", "itemType": "qKs99dMC"}, "quantity": 59, "type": "ITEM"}, {"currency": {"currencyCode": "AAQj9Op6", "namespace": "IK8tiqZf"}, "item": {"itemId": "nFKUeWJp", "itemSku": "Z7VDY1Ik", "itemType": "YmKfuWOl"}, "quantity": 64, "type": "CURRENCY"}, {"currency": {"currencyCode": "vDyUcVub", "namespace": "zf9JQKlA"}, "item": {"itemId": "wg7lGWwS", "itemSku": "yg3VgX4N", "itemType": "gMXpsUIY"}, "quantity": 27, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"ENUKAQGW": "yS72ms9J", "VLstlFvJ": "LGe2dinu", "0GJzzyae": "xWAid9Gc"}}, {"platform": "PSN", "platformDlcIdMap": {"xwiuHeLG": "yEZqartk", "Lzn6NbCV": "FhAU8S48", "fiL3Plky": "EMMX5M8d"}}, {"platform": "STEAM", "platformDlcIdMap": {"otw1Korh": "c4aT8qaj", "7hMqsR8G": "ihk1pyZs", "p9ZQ5pqf": "ObgFTyib"}}]}' \
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
    --entitlementClazz 'APP' \
    --entitlementName '7goal70J' \
    --itemId 'qjkJUbai,thDGYb16,PO8qLyqj' \
    --limit '6' \
    --offset '25' \
    --userId 'CLbMG2ZT' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'N9SkLlcm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '26' \
    --status 'SUCCESS' \
    --userId 'xv4IxQhU' \
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
    --body '{"bundleId": "Lg8kgRIR", "password": "3lpNT5w3"}' \
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
    --body '{"sandboxId": "cchKrDAr"}' \
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
    --body '{"applicationName": "NEWlFMJK", "serviceAccountId": "3kCbQZVQ"}' \
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
    --body '{"data": [{"itemIdentity": "k8Ql0aXO", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"dFswh9fQ": "wJQBfwta", "mTt7KztZ": "VEMmD1jP", "O8tnWqa9": "i8J9Jpmw"}}, {"itemIdentity": "x69FyDxK", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"9G9FEEyX": "3b4DbWiG", "2ozyo7vD": "Eh99Bob6", "GxToXjpr": "En2CDkFg"}}, {"itemIdentity": "zcPTeEoO", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"9gv9y0Ii": "DGupBut3", "cZYZbr6R": "Pxs6rlzZ", "NXLs9cQW": "Cj2WvrWS"}}]}' \
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
    --body '{"environment": "yV5xbg9v"}' \
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
    --body '{"appId": "XXHntAQQ", "publisherAuthenticationKey": "78bsbQy3"}' \
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
    --body '{"clientId": "zk2APB5c", "clientSecret": "EYtGoJ9J", "organizationId": "OOi9f9Ho"}' \
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
    --body '{"relyingPartyCert": "95Df059A"}' \
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
    --password 'EUJgCF2L' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'gyK3RYCK' \
    --itemId 'nCbyr1b8' \
    --itemType 'SEASON' \
    --endTime 'uFi2CHVP' \
    --startTime '9vKKUigp' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '0xe1DxDm' \
    --itemId '9vcpYIqy' \
    --itemType 'APP' \
    --endTime 'oNdALb47' \
    --startTime 'WAql6DCK' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fXlGy9cW' \
    --body '{"categoryPath": "SBkw7fPE", "targetItemId": "YnVL9s2C", "targetNamespace": "yD8giQhM"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uOvnk6ba' \
    --body '{"appId": "43JnCb3g", "appType": "DLC", "baseAppId": "nRQx0iDr", "boothName": "2TjyAqNn", "categoryPath": "xpLIh6XZ", "clazz": "NjBgras9", "displayOrder": 65, "entitlementType": "DURABLE", "ext": {"WBMMdU5L": {}, "ubhPwOC1": {}, "wIt3xMnW": {}}, "features": ["r7UOz28Q", "nPcW5Zsl", "9EWk7gfI"], "images": [{"as": "R2j28O3z", "caption": "4VOysDPY", "height": 89, "imageUrl": "jtRyZ3LK", "smallImageUrl": "9RMKfxVi", "width": 15}, {"as": "B93Rf4Ja", "caption": "73ZhxYR9", "height": 54, "imageUrl": "8kWJjKUY", "smallImageUrl": "UOl2YLrm", "width": 65}, {"as": "R6KTGNIm", "caption": "llVrLKDa", "height": 76, "imageUrl": "tLCImLLW", "smallImageUrl": "i1K3dbvK", "width": 86}], "itemIds": ["NcToF9dJ", "jOIeyGO0", "s4umJc0a"], "itemQty": {"uIfSbyWI": 33, "l6mrWpkY": 99, "JK94FzZR": 23}, "itemType": "EXTENSION", "listable": true, "localizations": {"yGjHEzLV": {"description": "imUiO3D7", "localExt": {"saZxSsko": {}, "eNSgmG1q": {}, "KTb28YO5": {}}, "longDescription": "n3punFtl", "title": "xnQ13qIK"}, "xrunDgj8": {"description": "JcAJ3Tq8", "localExt": {"AMaeX5Nj": {}, "HKSXkJnK": {}, "W9R3D0fO": {}}, "longDescription": "dZV2REfc", "title": "CrXmCPyK"}, "VsEddAfD": {"description": "eKFS8iWp", "localExt": {"77tQKWd4": {}, "UN7rEMzQ": {}, "Oj4J3lHe": {}}, "longDescription": "mSKOAB5x", "title": "ih7jrsHF"}}, "maxCount": 48, "maxCountPerUser": 33, "name": "oXSedoBa", "optionBoxConfig": {"boxItems": [{"count": 72, "itemId": "UXiAqyIB", "itemSku": "o0uCHB4g"}, {"count": 77, "itemId": "pnU4QTEr", "itemSku": "HhiB714M"}, {"count": 2, "itemId": "9CrR3qcH", "itemSku": "IbiiVf1f"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 95, "fixedTrialCycles": 15, "graceDays": 47}, "regionData": {"qzfbCkcA": [{"currencyCode": "YXyiNd8y", "currencyNamespace": "GjPtIcvj", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1996-10-13T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1978-02-12T00:00:00Z", "discountedPrice": 18, "expireAt": "1985-02-09T00:00:00Z", "price": 29, "purchaseAt": "1992-06-24T00:00:00Z", "trialPrice": 7}, {"currencyCode": "TwcA163T", "currencyNamespace": "BEPUjrsY", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1990-06-01T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1982-10-27T00:00:00Z", "discountedPrice": 31, "expireAt": "1982-07-15T00:00:00Z", "price": 24, "purchaseAt": "1986-07-16T00:00:00Z", "trialPrice": 93}, {"currencyCode": "xF4dnxMX", "currencyNamespace": "MD0JAAwV", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1981-04-18T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1991-07-07T00:00:00Z", "discountedPrice": 3, "expireAt": "1992-01-01T00:00:00Z", "price": 36, "purchaseAt": "1999-02-10T00:00:00Z", "trialPrice": 42}], "h0EqiSBn": [{"currencyCode": "RqT1iN06", "currencyNamespace": "rw2c0esk", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1994-08-20T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1976-06-21T00:00:00Z", "discountedPrice": 42, "expireAt": "1989-06-10T00:00:00Z", "price": 12, "purchaseAt": "1991-05-30T00:00:00Z", "trialPrice": 94}, {"currencyCode": "QVHwmq8B", "currencyNamespace": "CT3fcLtM", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1985-08-31T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1994-07-18T00:00:00Z", "discountedPrice": 5, "expireAt": "1973-02-22T00:00:00Z", "price": 33, "purchaseAt": "1977-08-01T00:00:00Z", "trialPrice": 31}, {"currencyCode": "jPglrstQ", "currencyNamespace": "3nakAq97", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1999-06-14T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1983-08-25T00:00:00Z", "discountedPrice": 70, "expireAt": "1999-06-29T00:00:00Z", "price": 54, "purchaseAt": "1997-12-24T00:00:00Z", "trialPrice": 86}], "y8jomVcZ": [{"currencyCode": "5UYyNqlS", "currencyNamespace": "cUdXkMJN", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1985-06-26T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1997-07-09T00:00:00Z", "discountedPrice": 11, "expireAt": "1989-05-06T00:00:00Z", "price": 63, "purchaseAt": "1985-05-10T00:00:00Z", "trialPrice": 78}, {"currencyCode": "yCs43Ayp", "currencyNamespace": "gfGf7jek", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1972-06-30T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1986-02-14T00:00:00Z", "discountedPrice": 49, "expireAt": "1987-08-18T00:00:00Z", "price": 76, "purchaseAt": "1974-05-24T00:00:00Z", "trialPrice": 82}, {"currencyCode": "5duh7F44", "currencyNamespace": "1QqbzFz3", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1973-03-26T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1997-04-15T00:00:00Z", "discountedPrice": 31, "expireAt": "1974-11-27T00:00:00Z", "price": 61, "purchaseAt": "1981-03-06T00:00:00Z", "trialPrice": 93}]}, "seasonType": "PASS", "sku": "0eb9eRJ6", "stackable": false, "status": "INACTIVE", "tags": ["SPUZTvef", "WvlZXjqG", "bz4jmHd9"], "targetCurrencyCode": "W8JOHFpl", "targetNamespace": "QcmctpcO", "thumbnailUrl": "wPZMemlQ", "useCount": 52}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '0X5IuKKN' \
    --appId '9W3T7kTY' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'iKtzR7Bj' \
    --baseAppId 'X48Gpcj6' \
    --categoryPath '5SppcoLZ' \
    --features 'uWhjTXBC' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --limit '29' \
    --offset '48' \
    --region 'QrwjAeVZ' \
    --sortBy 'name:desc,createdAt:asc,createdAt:desc' \
    --storeId '8SKy0hKO' \
    --tags 'cx3ft29b' \
    --targetNamespace 'Ls0KT9qZ' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '7Xeyz1GX,DBsc75wp,Cd3XPlCw' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'HUYuZEXB' \
    --sku 'SAiTY8dt' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'GoCaknhn' \
    --populateBundle  \
    --region 'Z0rnh60G' \
    --storeId '3JTx1uKZ' \
    --sku '5VBjDw9v' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'uSA57n7O' \
    --sku 'aHhyU1N7' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'IuvxJia9,ZaxE0mfa,VwC8tw9T' \
    --storeId 'nIFv8F3k' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'V4pGrbMW' \
    --region 'wCDBJfT7' \
    --storeId 'OyBpvv6T' \
    --itemIds '1dq6X4aM' \
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
    --userId 'MILWfTFY' \
    --body '{"itemIds": ["w9yVWvdL", "V9GD837h", "jPXUTCuV"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '92' \
    --offset '5' \
    --sortBy 'HzM9pa1l' \
    --storeId 'Qm6xNN1D' \
    --keyword 'xmldNai3' \
    --language '2bB7pEUR' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '52' \
    --offset '28' \
    --sortBy 'name:asc,createdAt:desc,createdAt' \
    --storeId 'BE6iWpyk' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'yahLskLW' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'A5cf1H7R' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'F0BSoKds' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wizXvtX1' \
    --body '{"appId": "vKKRG5yN", "appType": "SOFTWARE", "baseAppId": "qdiHLKfL", "boothName": "tfD0AZL5", "categoryPath": "TkYRh445", "clazz": "Y49hbeyh", "displayOrder": 19, "entitlementType": "CONSUMABLE", "ext": {"WUUwwEjN": {}, "CSWkwDJP": {}, "Y7ah3riW": {}}, "features": ["zqUXzrfO", "jvsOuKzq", "PQXQScVu"], "images": [{"as": "MEKdeTkz", "caption": "cY8t6KEy", "height": 62, "imageUrl": "5GgcS8oc", "smallImageUrl": "N3efBPZv", "width": 21}, {"as": "F0LinErC", "caption": "5b1si3ih", "height": 9, "imageUrl": "TLxItFUC", "smallImageUrl": "CDP9mB9x", "width": 18}, {"as": "rph3hYtE", "caption": "ZceInHTE", "height": 26, "imageUrl": "GqF6fgn2", "smallImageUrl": "anmOj0cw", "width": 96}], "itemIds": ["IhZzQGwg", "yZWfbpGM", "nT6vCu1x"], "itemQty": {"UOCaJzoz": 47, "zagxj5d5": 19, "HJYyQSvH": 79}, "itemType": "MEDIA", "listable": false, "localizations": {"AJQVggSZ": {"description": "7eHL2ijP", "localExt": {"OimKis7q": {}, "PzPfyHfa": {}, "8uDmRF3P": {}}, "longDescription": "xCGp4nJO", "title": "ngU47RTc"}, "5vTMgk3c": {"description": "9wQmazEM", "localExt": {"1q6jzv1t": {}, "6jJhXg0o": {}, "y8ch0X81": {}}, "longDescription": "byGhJ6DW", "title": "4CKLKzzx"}, "JrhOoz6o": {"description": "Xla6wXq1", "localExt": {"o61pNhsN": {}, "kWaqBg4C": {}, "iMu3taGV": {}}, "longDescription": "0WR06yo3", "title": "NumaBVwy"}}, "maxCount": 51, "maxCountPerUser": 52, "name": "EKzU4E93", "optionBoxConfig": {"boxItems": [{"count": 29, "itemId": "HCo6EUbR", "itemSku": "icCJ8kcR"}, {"count": 32, "itemId": "mXWcScOn", "itemSku": "714CwBH3"}, {"count": 98, "itemId": "t0WeKDIa", "itemSku": "t4UARpTe"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 44, "fixedTrialCycles": 35, "graceDays": 65}, "regionData": {"Luq7d5jb": [{"currencyCode": "hLhLfv7v", "currencyNamespace": "sayxWPUa", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1986-08-17T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1976-09-24T00:00:00Z", "discountedPrice": 11, "expireAt": "1975-04-10T00:00:00Z", "price": 59, "purchaseAt": "1984-10-21T00:00:00Z", "trialPrice": 92}, {"currencyCode": "Y4lvW7jU", "currencyNamespace": "onCopzLP", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1980-08-09T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1981-05-17T00:00:00Z", "discountedPrice": 63, "expireAt": "1989-03-26T00:00:00Z", "price": 43, "purchaseAt": "1977-03-10T00:00:00Z", "trialPrice": 11}, {"currencyCode": "kwaKLOp2", "currencyNamespace": "53TbdPVt", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1973-01-05T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1979-06-07T00:00:00Z", "discountedPrice": 78, "expireAt": "1987-12-16T00:00:00Z", "price": 98, "purchaseAt": "1994-06-17T00:00:00Z", "trialPrice": 15}], "UlXolHsm": [{"currencyCode": "nscnlRUo", "currencyNamespace": "aElAXza4", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1971-09-10T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1974-09-28T00:00:00Z", "discountedPrice": 36, "expireAt": "1971-08-12T00:00:00Z", "price": 70, "purchaseAt": "1986-07-21T00:00:00Z", "trialPrice": 16}, {"currencyCode": "DyBI0Qbx", "currencyNamespace": "WIunjgMP", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1997-07-12T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1983-10-03T00:00:00Z", "discountedPrice": 25, "expireAt": "1999-05-24T00:00:00Z", "price": 26, "purchaseAt": "1986-07-27T00:00:00Z", "trialPrice": 60}, {"currencyCode": "MYi7lSdM", "currencyNamespace": "8R3zF5fU", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1984-04-13T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1977-01-15T00:00:00Z", "discountedPrice": 16, "expireAt": "1980-01-31T00:00:00Z", "price": 12, "purchaseAt": "1991-11-16T00:00:00Z", "trialPrice": 55}], "0SHj3gzY": [{"currencyCode": "GKDUy656", "currencyNamespace": "gLrFvxzT", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1986-12-04T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1972-12-31T00:00:00Z", "discountedPrice": 14, "expireAt": "1992-02-16T00:00:00Z", "price": 77, "purchaseAt": "1973-08-07T00:00:00Z", "trialPrice": 36}, {"currencyCode": "uavgagL3", "currencyNamespace": "ZmjeAUr2", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1984-01-24T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1991-02-11T00:00:00Z", "discountedPrice": 31, "expireAt": "1979-10-04T00:00:00Z", "price": 67, "purchaseAt": "1993-04-25T00:00:00Z", "trialPrice": 81}, {"currencyCode": "Op78wezl", "currencyNamespace": "amjOEd9Y", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1997-08-23T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1982-03-18T00:00:00Z", "discountedPrice": 20, "expireAt": "1996-03-14T00:00:00Z", "price": 27, "purchaseAt": "1974-01-26T00:00:00Z", "trialPrice": 87}]}, "seasonType": "PASS", "sku": "wR2mDiuI", "stackable": true, "status": "INACTIVE", "tags": ["hBwAnnMC", "9zV2jqeD", "XK3fRSW7"], "targetCurrencyCode": "DfMIQIhu", "targetNamespace": "zfUDd89l", "thumbnailUrl": "cb4OBXLv", "useCount": 92}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'Q3W8GMV1' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'xhvrqs8D' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'jpnv0GGo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 83, "orderNo": "IZ2CwK2N"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'SL6WPVdc' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '8Pz5j7cP' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'Cb1LL05T' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nYTrjgxq' \
    --body '{"carousel": [{"alt": "VBk5PaRF", "previewUrl": "MPfuzS8z", "thumbnailUrl": "77uSDksr", "type": "image", "url": "lWo3nRRK", "videoSource": "vimeo"}, {"alt": "g1WtBp82", "previewUrl": "Eda6JzVA", "thumbnailUrl": "a3GTBKro", "type": "image", "url": "z1vSCBAz", "videoSource": "vimeo"}, {"alt": "bNaEh481", "previewUrl": "5CtIe0Ly", "thumbnailUrl": "yvmaxKK9", "type": "video", "url": "VfPf5fS0", "videoSource": "generic"}], "developer": "uysuqAdv", "forumUrl": "Pd54FkOB", "genres": ["Racing", "Sports", "Simulation"], "localizations": {"rnc5tUHu": {"announcement": "MNdazyf0", "slogan": "7q7YYny8"}, "jiC97lfM": {"announcement": "xI8uffaq", "slogan": "VUTQyfuZ"}, "Zmb0ajZ4": {"announcement": "LqyX4Sl7", "slogan": "iVB2c1ym"}}, "platformRequirements": {"rhgnu7Vw": [{"additionals": "GeJ8gMOD", "directXVersion": "34Epylqr", "diskSpace": "812GpLUY", "graphics": "YSUWdjgq", "label": "DbH3inWR", "osVersion": "KVooUGoy", "processor": "9xvyvvk7", "ram": "f2Zd1nKl", "soundCard": "vihxA1Aa"}, {"additionals": "pwmNWVY7", "directXVersion": "PxVhyPIf", "diskSpace": "PVyvMlwl", "graphics": "e1d5aQYH", "label": "uOrdZHpo", "osVersion": "uwZBPCeD", "processor": "IYIQsJAS", "ram": "D1bldhSi", "soundCard": "HAAu7F8p"}, {"additionals": "QQ2JCKyg", "directXVersion": "MBTJ4GSx", "diskSpace": "M7ywo3xA", "graphics": "kcn5ZaDB", "label": "jsTUVISn", "osVersion": "6VoAir9p", "processor": "r7wUV9mB", "ram": "sHjiXXzr", "soundCard": "mKjmOgZe"}], "Z0KebcjX": [{"additionals": "CSCYxeMN", "directXVersion": "zOIgH9Bx", "diskSpace": "HTr4Q5oX", "graphics": "QHbvBxvj", "label": "jP2UpVGg", "osVersion": "nWuxzezg", "processor": "WLOe5Byu", "ram": "W7FsL5NT", "soundCard": "Mt9ArdDU"}, {"additionals": "tuCdqzyM", "directXVersion": "1zSjGt76", "diskSpace": "121YiDIy", "graphics": "XrxPMyMy", "label": "f8ODNYGK", "osVersion": "L6X7kPXl", "processor": "u3TrTzKF", "ram": "Q5GoAPIE", "soundCard": "iiG4a0zG"}, {"additionals": "7n25DmVX", "directXVersion": "8w3sMm1x", "diskSpace": "Dw7a6dBd", "graphics": "7j2YOUTg", "label": "YxW8ItpR", "osVersion": "2zu97WHw", "processor": "Wxn1uhlD", "ram": "IcB8MGYJ", "soundCard": "pq16IK59"}], "DB0Y4i2B": [{"additionals": "3W23tCYv", "directXVersion": "N1vkN5hL", "diskSpace": "VvfZh7fq", "graphics": "WJmYWc3G", "label": "UR4jFPuE", "osVersion": "56BCoqAB", "processor": "vyqwK1YF", "ram": "PPqmFVRV", "soundCard": "8AOEByjz"}, {"additionals": "uFYcszWv", "directXVersion": "3OgIxt35", "diskSpace": "5R8mnR2D", "graphics": "jAOTT2N4", "label": "cEclOjIv", "osVersion": "joFSvFbb", "processor": "tFfq5Ysz", "ram": "z3k819Pg", "soundCard": "7Jp0uxdX"}, {"additionals": "YqV9xJOx", "directXVersion": "O8iEZkcD", "diskSpace": "ibPZzkDn", "graphics": "YZ0aGqhE", "label": "DFmFRc2H", "osVersion": "49uaAwMm", "processor": "k6cE7ReX", "ram": "jJLCYWxd", "soundCard": "ddO1kZLF"}]}, "platforms": ["MacOS", "Linux", "Android"], "players": ["Single", "CrossPlatformMulti", "Coop"], "primaryGenre": "FreeToPlay", "publisher": "iudNQHnc", "releaseDate": "1982-09-15T00:00:00Z", "websiteUrl": "1j8zE9IN"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'Mp0p6qD8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pulsYoln' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'BzLfzRCV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'xf1WVqh6' \
    --namespace "$AB_NAMESPACE" \
    --storeId '902gx26y' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '74HiAIha' \
    --itemId 'ORUeJJ3x' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CULkCC2o' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'BfVazVes' \
    --itemId 'kMdqvdft' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5j6ilb5V' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'uiyng2Wv' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '9d1TOkwb' \
    --populateBundle  \
    --region '6TnZU6JO' \
    --storeId 'tTO127aD' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'Y2YgQP59' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WX9TnNrR' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 9, "comparison": "includes", "name": "rxdOosHc", "predicateType": "EntitlementPredicate", "value": "98sdKuYr", "values": ["mPa8xHnz", "2OTpODmu", "AgEA4yvV"]}, {"anyOf": 12, "comparison": "isGreaterThan", "name": "ZXoA2qRp", "predicateType": "SeasonPassPredicate", "value": "10XO5sg0", "values": ["a4Ys0CmZ", "DuVg9Fjd", "gERB3uxW"]}, {"anyOf": 2, "comparison": "isNot", "name": "JLaO6xG5", "predicateType": "SeasonTierPredicate", "value": "x5cEURZ1", "values": ["xFHwwzXg", "XYAHTHAF", "0wJurkCQ"]}]}, {"operator": "or", "predicates": [{"anyOf": 19, "comparison": "includes", "name": "MzdWkD3s", "predicateType": "SeasonTierPredicate", "value": "FFXyAO3N", "values": ["ob7rknxT", "Mta02wqe", "cspcC7Mp"]}, {"anyOf": 40, "comparison": "includes", "name": "NJV9JFbF", "predicateType": "SeasonPassPredicate", "value": "XTIqRZfJ", "values": ["sDew22z3", "gTAyk03j", "6vWSuLX0"]}, {"anyOf": 49, "comparison": "is", "name": "tTmrsffH", "predicateType": "EntitlementPredicate", "value": "PGi9317f", "values": ["30y9nuwR", "djaICpf0", "pS6ovNVv"]}]}, {"operator": "and", "predicates": [{"anyOf": 76, "comparison": "isNot", "name": "h1iVNhlW", "predicateType": "SeasonPassPredicate", "value": "1YZkNmlP", "values": ["6TMikxCN", "qx4Btv2p", "azmtXPR4"]}, {"anyOf": 29, "comparison": "isNot", "name": "mWhMebR1", "predicateType": "EntitlementPredicate", "value": "0zA2sgpu", "values": ["iZeogBXP", "ttvAcDHX", "3GqML1iO"]}, {"anyOf": 89, "comparison": "is", "name": "rIJuzqUV", "predicateType": "EntitlementPredicate", "value": "6kOha4tk", "values": ["rZE1NsuC", "GrOjBBIJ", "4P7h5hFC"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '4z7NIkTn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "YfuC8IFP"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --name 'wyq1vIj9' \
    --offset '41' \
    --tag 'lHVjNnFg' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Jcc7MQGf", "name": "hfhBlXrX", "status": "ACTIVE", "tags": ["vJGPHZE1", "24wp6g5E", "B8Z8X0gI"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupByBoothName \
    --namespace "$AB_NAMESPACE" \
    --boothName '0hbEIN0x' \
    > test.out 2>&1
eval_tap $? 112 'GetKeyGroupByBoothName' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'NBsWvE4T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'Y1F9jv4w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "9Yhv9OqQ", "name": "Ws0q2euB", "status": "INACTIVE", "tags": ["Q4ASLoOb", "VYEC4cdm", "BxAysEl9"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '3uBnFYlM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'GJsONcqm' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '33' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'OOAZbTGN' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '5isxW52u' \
    --limit '67' \
    --offset '20' \
    --orderNos 'dg1axdaa,ZBlSFTW5,KotXxALH' \
    --sortBy 'M7d99I1U' \
    --startTime 'ywQ8NLTI' \
    --status 'DELETED' \
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
    --orderNo 'glorR257' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4LHW5lU5' \
    --body '{"description": "0FlPWdjJ"}' \
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
    --body '{"dryRun": true, "notifyUrl": "0EgNwyL5", "privateKey": "VWrJ6lf2"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'zUeXigMK' \
    --externalId '9U6wlyil' \
    --limit '3' \
    --notificationSource 'STRIPE' \
    --notificationType 'GRNCF1Bh' \
    --offset '69' \
    --paymentOrderNo 'fvuOQmQI' \
    --startDate '9KXYODee' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'WjNbAlGE' \
    --limit '54' \
    --offset '88' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "wvt9E7jK", "currencyNamespace": "G4Ubrqk5", "customParameters": {"4yJBtTIx": {}, "ms2BnnvK": {}, "ogtPQUSv": {}}, "description": "ntdKBlyT", "extOrderNo": "OR5Kk1Ub", "extUserId": "rNGo7Y2u", "itemType": "EXTENSION", "language": "bIc_SCyf", "metadata": {"risQ9vme": "pqjhhHHp", "kqEbjiRT": "xw2WfqEG", "r4qsQ9gg": "aGM9BhxJ"}, "notifyUrl": "FPmJHBNv", "omitNotification": false, "platform": "2SqpHEc3", "price": 0, "recurringPaymentOrderNo": "VkvE1FSX", "region": "WZlbAiyN", "returnUrl": "wDgE83wq", "sandbox": false, "sku": "VYJ3ikY9", "subscriptionId": "C6Foumln", "targetNamespace": "mfpe3zDh", "targetUserId": "RdfDUCet", "title": "gcos5jva"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'uo4JtsPv' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uH7mNqkM' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rdTQODTN' \
    --body '{"extTxId": "vn6lL3Ph", "paymentMethod": "Qfigyy5A", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'reVQ0x23' \
    --body '{"description": "9yWglrf8"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7ARQExqn' \
    --body '{"amount": 54, "currencyCode": "TRIDgLOe", "notifyType": "REFUND", "paymentProvider": "ALIPAY", "salesTax": 17, "vat": 23}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8YuTY36V' \
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
    --body '{"allowedBalanceOrigins": ["Epic", "Steam", "IOS"]}' \
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
    --body '{"description": "3ipEBhgK", "eventTopic": "2ayZudbn", "maxAwarded": 94, "maxAwardedPerUser": 43, "namespaceExpression": "SrARbU9z", "rewardCode": "S5CbI5iB", "rewardConditions": [{"condition": "vRN5k9AJ", "conditionName": "pKfBAZqC", "eventName": "gj15tJuV", "rewardItems": [{"duration": 20, "itemId": "ZL0HbyPD", "quantity": 8}, {"duration": 66, "itemId": "9CVtx4i0", "quantity": 1}, {"duration": 17, "itemId": "zBXGCTQ3", "quantity": 23}]}, {"condition": "TevyxGBZ", "conditionName": "itKCWtOC", "eventName": "0DKOxIE5", "rewardItems": [{"duration": 63, "itemId": "aFrJUR2o", "quantity": 26}, {"duration": 97, "itemId": "TgGYdbjB", "quantity": 42}, {"duration": 34, "itemId": "0wvSklZg", "quantity": 48}]}, {"condition": "2tGQVuD0", "conditionName": "Wlgy6KtO", "eventName": "6x1EYhvN", "rewardItems": [{"duration": 19, "itemId": "w7WtS9c9", "quantity": 58}, {"duration": 80, "itemId": "maMeG3Uw", "quantity": 74}, {"duration": 91, "itemId": "FQ9GjBtj", "quantity": 17}]}], "userIdExpression": "DnvVSSEM"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'BbK4ifOp' \
    --limit '48' \
    --offset '48' \
    --sortBy 'rewardCode:desc,namespace:asc' \
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
    --rewardId 'JtNE1TYM' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'KsFIkfsr' \
    --body '{"description": "kIwPVd5K", "eventTopic": "mlgApFih", "maxAwarded": 90, "maxAwardedPerUser": 85, "namespaceExpression": "Kr98ds5D", "rewardCode": "hVeSKOMN", "rewardConditions": [{"condition": "nkztdpVa", "conditionName": "jTVGyhxv", "eventName": "l4MW2A1o", "rewardItems": [{"duration": 19, "itemId": "GpJmryzu", "quantity": 63}, {"duration": 37, "itemId": "N9lOajR2", "quantity": 14}, {"duration": 91, "itemId": "9JQ80eMc", "quantity": 88}]}, {"condition": "AgG9LGEC", "conditionName": "03bSopBg", "eventName": "UCA9P3W8", "rewardItems": [{"duration": 30, "itemId": "wMFAoUvo", "quantity": 37}, {"duration": 60, "itemId": "ngiUKO2O", "quantity": 66}, {"duration": 50, "itemId": "D2VvTueC", "quantity": 68}]}, {"condition": "1kTg6gnT", "conditionName": "jCjMtey6", "eventName": "KhSaqS9i", "rewardItems": [{"duration": 34, "itemId": "oaDyZDoK", "quantity": 54}, {"duration": 17, "itemId": "Cx8eCcfR", "quantity": 2}, {"duration": 84, "itemId": "8Wk1V6QC", "quantity": 52}]}], "userIdExpression": "3ZWquDuI"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'gn6AkfLs' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4oYs8P4C' \
    --body '{"payload": {"pNtU7nPl": {}, "diAK2XrC": {}, "hzucnif7": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'IWuDd11Y' \
    --body '{"conditionName": "Dg5rwZlL", "userId": "F2GKVYvE"}' \
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
    --body '{"defaultLanguage": "oeLS3trg", "defaultRegion": "wCE83tsC", "description": "Ij7q2hvZ", "supportedLanguages": ["xngC7GVb", "LtHVzds9", "ZiYEnjVD"], "supportedRegions": ["rVyFnNJM", "Ca371pub", "0jsoNTIJ"], "title": "fi2CBMOm"}' \
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
    --storeId 'lKHihLoz' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SdvnYjHt' \
    --body '{"defaultLanguage": "L20vzrUC", "defaultRegion": "NI8YgRcg", "description": "2rkfXPfo", "supportedLanguages": ["nLAKQtg5", "SeJJ48V8", "6qqvL2fW"], "supportedRegions": ["qAosI9gb", "K0eOBBvj", "pNxjDDEJ"], "title": "OMheKeDt"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'POq7OeJU' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'R2SE0u1J' \
    --action 'UPDATE' \
    --itemSku 'VrxlCb0E' \
    --itemType 'BUNDLE' \
    --limit '34' \
    --offset '100' \
    --selected  \
    --sortBy 'updatedAt,createdAt' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'suBLNwKG' \
    --updatedAtStart 'daf4HQdy' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '1CMjqYeJ' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ft1Sf1us' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZThfga5g' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u9q57ikN' \
    --action 'CREATE' \
    --itemSku 'sgAraUDb' \
    --itemType 'COINS' \
    --type 'ITEM' \
    --updatedAtEnd 'LBwy8wiF' \
    --updatedAtStart 'imvVcQ1H' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WOl1oyRG' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'IXScP6RF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hKxRpaSs' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'mzn05ZXM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tsrnWo4Z' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dStKZn4f' \
    --targetStoreId 'cUhrubau' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'lHzaN9P7' \
    --limit '35' \
    --offset '100' \
    --sku 'wdiPIG2Y' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'j4pYmnmr' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8JymPe13' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'GYX39dOV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'm9rHylnt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "GmruH5bH"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'vVgP2vGu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'Jui1H5Zn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 98, "orderNo": "M2NCaMr4"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'kKoph1d7' \
    --body '{"achievements": [{"id": "DaE9xbPa", "value": 65}, {"id": "yHbzhJcD", "value": 63}, {"id": "5d6qgbjk", "value": 57}], "steamUserId": "x1j549c6"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'EqyDFCKn' \
    --xboxUserId 'UyKIhOtv' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QlnO5XBB' \
    --body '{"achievements": [{"id": "iKKfHivL", "percentComplete": 61}, {"id": "ng6W4jJ1", "percentComplete": 13}, {"id": "V7H0GsXv", "percentComplete": 15}], "serviceConfigId": "LUm5cbrZ", "titleId": "8X1OlZ3E", "xboxUserId": "Q55LMheD"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'l0vOsNCO' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'l7KPR1sx' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'rELTdkPf' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '7jWJytYG' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzUGDVO8' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '2r9RvGxW' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '479iSwb6' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'WIdrOmOq' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'H3HW8NXr' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'Oiv6VDNz' \
    --features 'UTzdRPUm,fxqKwq82,kkeE3Y5a' \
    --itemId 'f4iuYU8b,a9SXbC9U,7Izdan2d' \
    --limit '72' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserEntitlements' test.out

#- 183 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rvsnxlTX' \
    --body '[{"endDate": "1981-05-01T00:00:00Z", "grantedCode": "ePJNO6qP", "itemId": "Ni0apiRS", "itemNamespace": "ZwdLC5X5", "language": "vqCL_zPnD", "quantity": 70, "region": "7SNHdxpM", "source": "ACHIEVEMENT", "startDate": "1971-01-25T00:00:00Z", "storeId": "Z5O806V2"}, {"endDate": "1991-03-12T00:00:00Z", "grantedCode": "koG5851m", "itemId": "6w6iVaBO", "itemNamespace": "WaIx0kdg", "language": "wnml_195", "quantity": 86, "region": "n67f552Y", "source": "REFERRAL_BONUS", "startDate": "1985-05-31T00:00:00Z", "storeId": "EvyR9FMn"}, {"endDate": "1984-04-29T00:00:00Z", "grantedCode": "VORUYaUe", "itemId": "099clNPg", "itemNamespace": "cj6mMJ5O", "language": "dD_iRWK", "quantity": 34, "region": "b39No2i8", "source": "REDEEM_CODE", "startDate": "1980-10-29T00:00:00Z", "storeId": "SWPMNPQS"}]' \
    > test.out 2>&1
eval_tap $? 183 'GrantUserEntitlement' test.out

#- 184 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jjbjdKe3' \
    --activeOnly  \
    --appId 'fyk1TPEA' \
    > test.out 2>&1
eval_tap $? 184 'GetUserAppEntitlementByAppId' test.out

#- 185 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'tkxh2m82' \
    --activeOnly  \
    --limit '14' \
    --offset '20' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserEntitlementsByAppType' test.out

#- 186 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vagslPQG' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '3O7HwOh5' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementByItemId' test.out

#- 187 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '8Pv1wldl' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'GcACYWG0' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementBySku' test.out

#- 188 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'jhIgnBbm' \
    --appIds 'qeHHs2Ez,3ceOHxC7,LcHIHXqy' \
    --itemIds 'fkqVnowB,8Y74WBtA,NzHW1e3X' \
    --skus 'JDZuAq23,qnQ4Mfyc,TJLCAG0A' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlement' test.out

#- 189 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '1qblzRGI' \
    --itemIds 'Fo814wwb,wZRWD0nv,pyDeV2y8' \
    > test.out 2>&1
eval_tap $? 189 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 190 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YIiEF5yG' \
    --appId '2eyQ2mEk' \
    > test.out 2>&1
eval_tap $? 190 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 191 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '44KCPyiV' \
    --entitlementClazz 'MEDIA' \
    --itemId 'zq5PydEA' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemId' test.out

#- 192 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'k8o4dv3u' \
    --ids '5OdhbO5b,R4hPaawY,2euROGEg' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipByItemIds' test.out

#- 193 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'lSRVR4np' \
    --entitlementClazz 'APP' \
    --sku 'l9PWXoH1' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipBySku' test.out

#- 194 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'tk6qURGn' \
    --entitlementIds 'UYVlErh6' \
    > test.out 2>&1
eval_tap $? 194 'RevokeUserEntitlements' test.out

#- 195 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'MGvphVbq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j8H72YjK' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlement' test.out

#- 196 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'FRNhGBk8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'daNu6kpr' \
    --body '{"endDate": "1985-07-14T00:00:00Z", "nullFieldList": ["J9wlC5ka", "VFWGRVaJ", "TPJ32WE5"], "startDate": "1971-10-30T00:00:00Z", "status": "REVOKED", "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 196 'UpdateUserEntitlement' test.out

#- 197 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'J8wQFCjK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GaKf3kKZ' \
    --body '{"options": ["tqbhfIgA", "fXJWekdZ", "gNWXhH0L"], "requestId": "lPw52ir7", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 197 'ConsumeUserEntitlement' test.out

#- 198 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 't593QIRC' \
    --namespace "$AB_NAMESPACE" \
    --userId '4bds25NR' \
    > test.out 2>&1
eval_tap $? 198 'DisableUserEntitlement' test.out

#- 199 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'P0HH3cMN' \
    --namespace "$AB_NAMESPACE" \
    --userId '6yF4tNvS' \
    > test.out 2>&1
eval_tap $? 199 'EnableUserEntitlement' test.out

#- 200 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '7gt5O5kW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dfvXSbNF' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementHistories' test.out

#- 201 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '4Fya916K' \
    --namespace "$AB_NAMESPACE" \
    --userId '5zI7F58d' \
    > test.out 2>&1
eval_tap $? 201 'RevokeUserEntitlement' test.out

#- 202 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'r78tW0B7' \
    --body '{"duration": 21, "endDate": "1994-04-22T00:00:00Z", "itemId": "R7pM92jv", "itemSku": "ytpfBjtS", "language": "OBAo9t9P", "order": {"currency": {"currencyCode": "xYKf0iqw", "currencySymbol": "lF9ZVlM9", "currencyType": "VIRTUAL", "decimals": 98, "namespace": "3pXp2exj"}, "ext": {"VaIO5XKh": {}, "UVGZFgWx": {}, "NGlZoBXl": {}}, "free": true}, "orderNo": "y29ZW5Wq", "origin": "System", "quantity": 82, "region": "NihSysL2", "source": "PROMOTION", "startDate": "1998-03-22T00:00:00Z", "storeId": "f6lhH47y"}' \
    > test.out 2>&1
eval_tap $? 202 'FulfillItem' test.out

#- 203 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xe3ewvki' \
    --body '{"code": "CV9hraNJ", "language": "ZrqD-hFMG", "region": "5kJvS6pL"}' \
    > test.out 2>&1
eval_tap $? 203 'RedeemCode' test.out

#- 204 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '49Y6tttq' \
    --body '{"origin": "Other", "rewards": [{"currency": {"currencyCode": "YAl77IjS", "namespace": "TglwhhVK"}, "item": {"itemId": "geLIX8pn", "itemSku": "DEZpP7DS", "itemType": "SVOM5Xp3"}, "quantity": 84, "type": "CURRENCY"}, {"currency": {"currencyCode": "6vPiZMnM", "namespace": "LkWgrQ9U"}, "item": {"itemId": "bESJ8Guk", "itemSku": "GvuLu7Qo", "itemType": "jjcn61kH"}, "quantity": 22, "type": "ITEM"}, {"currency": {"currencyCode": "XTb1OVW5", "namespace": "fgtTjSjO"}, "item": {"itemId": "MW2IeLQj", "itemSku": "fRphDeOE", "itemType": "aQBwgIYK"}, "quantity": 78, "type": "CURRENCY"}], "source": "OTHER"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillRewards' test.out

#- 205 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BnwXc36g' \
    --endTime 'F3dMDWIv' \
    --limit '38' \
    --offset '13' \
    --productId 'ifS7mbHF' \
    --startTime 'EwhXrIgR' \
    --status 'FULFILLED' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 205 'QueryUserIAPOrders' test.out

#- 206 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '0jv27Gdm' \
    > test.out 2>&1
eval_tap $? 206 'QueryAllUserIAPOrders' test.out

#- 207 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '4Od2xers' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "XDE", "productId": "SKR9k4Yo", "region": "vWuXIlWV", "type": "EPICGAMES"}' \
    > test.out 2>&1
eval_tap $? 207 'MockFulfillIAPItem' test.out

#- 208 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '9Q5iNrIu' \
    --itemId 'oMUv4Zg6' \
    --limit '78' \
    --offset '39' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 208 'QueryUserOrders' test.out

#- 209 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'TZo9DxvO' \
    --body '{"currencyCode": "zbUDKjZW", "currencyNamespace": "KMQpYrxa", "discountedPrice": 14, "ext": {"6p1fmx2o": {}, "kZYrEssP": {}, "t9DZ9vhK": {}}, "itemId": "SHvkLOgH", "language": "gwkDkhcd", "options": {"skipPriceValidation": false}, "platform": "Xbox", "price": 61, "quantity": 42, "region": "L1oGr9zN", "returnUrl": "b2ddh9g7", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 209 'AdminCreateUserOrder' test.out

#- 210 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'eVEOXCbC' \
    --itemId '0ct4NJNE' \
    > test.out 2>&1
eval_tap $? 210 'CountOfPurchasedItem' test.out

#- 211 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SsbqHnr2' \
    --userId 'tcXfreip' \
    > test.out 2>&1
eval_tap $? 211 'GetUserOrder' test.out

#- 212 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RKw6sKXG' \
    --userId 'mG322Cni' \
    --body '{"status": "REFUND_FAILED", "statusReason": "3On5rxva"}' \
    > test.out 2>&1
eval_tap $? 212 'UpdateUserOrderStatus' test.out

#- 213 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'C6EXXRQn' \
    --userId '1zdyxOMB' \
    > test.out 2>&1
eval_tap $? 213 'FulfillUserOrder' test.out

#- 214 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RFc4TuJx' \
    --userId 'Rlc75rmh' \
    > test.out 2>&1
eval_tap $? 214 'GetUserOrderGrant' test.out

#- 215 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'um6FtgKO' \
    --userId 'ZjeFhz2a' \
    > test.out 2>&1
eval_tap $? 215 'GetUserOrderHistories' test.out

#- 216 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VzOIULFF' \
    --userId '3iSVKfVr' \
    --body '{"additionalData": {"cardSummary": "b2k9mo44"}, "authorisedTime": "1977-02-25T00:00:00Z", "chargebackReversedTime": "1978-12-28T00:00:00Z", "chargebackTime": "1981-08-13T00:00:00Z", "chargedTime": "1982-09-17T00:00:00Z", "createdTime": "1977-02-22T00:00:00Z", "currency": {"currencyCode": "hzxRYj9J", "currencySymbol": "9pAkIPNv", "currencyType": "REAL", "decimals": 52, "namespace": "2OV8eQak"}, "customParameters": {"rLXgV7lZ": {}, "eWDwkwjn": {}, "k1A5ZSbX": {}}, "extOrderNo": "oyiCH2lf", "extTxId": "KNWE29fJ", "extUserId": "T5CuQddN", "issuedAt": "1986-06-07T00:00:00Z", "metadata": {"q4l6v6zY": "6fCAKdiH", "dexXkcIG": "gUFTW4PP", "VdVzft8j": "udU2Sey7"}, "namespace": "dUrS5ELQ", "nonceStr": "21BN2REZ", "paymentMethod": "OFjf0IbS", "paymentMethodFee": 14, "paymentOrderNo": "N8koLGij", "paymentProvider": "ADYEN", "paymentProviderFee": 29, "paymentStationUrl": "50eVSmSf", "price": 73, "refundedTime": "1992-08-15T00:00:00Z", "salesTax": 89, "sandbox": false, "sku": "zdwJurY9", "status": "CHARGEBACK", "statusReason": "AGc7FFca", "subscriptionId": "3tf5lCYH", "subtotalPrice": 80, "targetNamespace": "ufLSYMZN", "targetUserId": "98Uf8Tdh", "tax": 6, "totalPrice": 22, "totalTax": 47, "txEndTime": "1986-07-20T00:00:00Z", "type": "wnc5QOVA", "userId": "oEGswes0", "vat": 81}' \
    > test.out 2>&1
eval_tap $? 216 'ProcessUserOrderNotification' test.out

#- 217 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Satt4Ksu' \
    --userId 'sMGpFzW7' \
    > test.out 2>&1
eval_tap $? 217 'DownloadUserOrderReceipt' test.out

#- 218 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '9G1YvPJk' \
    --body '{"currencyCode": "e3J2zxEs", "currencyNamespace": "PaX0CGxq", "customParameters": {"J0SGF9Oj": {}, "XgvQgE4Z": {}, "jSDKZLxy": {}}, "description": "9guyqnEi", "extOrderNo": "oPPFygPV", "extUserId": "FwFRfIte", "itemType": "BUNDLE", "language": "al-862", "metadata": {"DakRzWwk": "kTNwHV24", "BIiY5xZi": "MhOf4cfH", "zzyOW4v3": "afNdmBBF"}, "notifyUrl": "59zwjkPu", "omitNotification": false, "platform": "uIwuve8C", "price": 70, "recurringPaymentOrderNo": "vNcNWo1c", "region": "gZFzhDVl", "returnUrl": "r23DiX5K", "sandbox": true, "sku": "8RNBaqgw", "subscriptionId": "WYZLeqFy", "title": "QFcZDAYM"}' \
    > test.out 2>&1
eval_tap $? 218 'CreateUserPaymentOrder' test.out

#- 219 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'F6zttf4U' \
    --userId 'qgJtuVCY' \
    --body '{"description": "knL8ybJO"}' \
    > test.out 2>&1
eval_tap $? 219 'RefundUserPaymentOrder' test.out

#- 220 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'zxI3MC86' \
    --body '{"code": "vzjbloSh", "orderNo": "SwVIGulk"}' \
    > test.out 2>&1
eval_tap $? 220 'ApplyUserRedemption' test.out

#- 221 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3e89hAw' \
    --chargeStatus 'NEVER' \
    --itemId 'Cz1yJ3Z4' \
    --limit '71' \
    --offset '34' \
    --sku 'YjDX8oqo' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 221 'QueryUserSubscriptions' test.out

#- 222 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'W74JZ8Qa' \
    --excludeSystem  \
    --limit '84' \
    --offset '66' \
    --subscriptionId 'yONwbj87' \
    > test.out 2>&1
eval_tap $? 222 'GetUserSubscriptionActivities' test.out

#- 223 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ied7iDXt' \
    --body '{"grantDays": 13, "itemId": "7QUkTr8G", "language": "JZedE7tQ", "reason": "aVOwC86J", "region": "wO1HiUc6", "source": "tFylXYzc"}' \
    > test.out 2>&1
eval_tap $? 223 'PlatformSubscribeSubscription' test.out

#- 224 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'bqrmN6bA' \
    --itemId 'IyZ8Ncsg' \
    > test.out 2>&1
eval_tap $? 224 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 225 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3W2gE1wO' \
    --userId 'C585r4b8' \
    > test.out 2>&1
eval_tap $? 225 'GetUserSubscription' test.out

#- 226 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nVxjfIKD' \
    --userId 'cjt6oxuh' \
    > test.out 2>&1
eval_tap $? 226 'DeleteUserSubscription' test.out

#- 227 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DBhRNXBm' \
    --userId 'gbgUxQGo' \
    --force  \
    --body '{"immediate": true, "reason": "HmVOKMfj"}' \
    > test.out 2>&1
eval_tap $? 227 'CancelSubscription' test.out

#- 228 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'USHVFJGX' \
    --userId 'adPAounj' \
    --body '{"grantDays": 99, "reason": "jge0QXHy"}' \
    > test.out 2>&1
eval_tap $? 228 'GrantDaysToSubscription' test.out

#- 229 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vTwpt6Qq' \
    --userId 'Cr6PekOM' \
    --excludeFree  \
    --limit '91' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 229 'GetUserSubscriptionBillingHistories' test.out

#- 230 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6EHpJtbe' \
    --userId 'fueTKO3n' \
    --body '{"additionalData": {"cardSummary": "Ksnm4Rwv"}, "authorisedTime": "1996-04-20T00:00:00Z", "chargebackReversedTime": "1992-05-21T00:00:00Z", "chargebackTime": "1996-03-21T00:00:00Z", "chargedTime": "1981-07-31T00:00:00Z", "createdTime": "1984-02-05T00:00:00Z", "currency": {"currencyCode": "yJuRIk2v", "currencySymbol": "8FJzHgMf", "currencyType": "REAL", "decimals": 6, "namespace": "PYJwY8kQ"}, "customParameters": {"7zr8jfXS": {}, "Nhg644yp": {}, "j3puNlpq": {}}, "extOrderNo": "KXsMYZkL", "extTxId": "fwfuiqa1", "extUserId": "yOZCMM1j", "issuedAt": "1984-08-08T00:00:00Z", "metadata": {"TStHsKSb": "uM2OiYJ0", "AZnZO8BT": "SFCyQGdQ", "EkupBmaW": "jzL6SGmV"}, "namespace": "7uW9hfte", "nonceStr": "o2xl8WnA", "paymentMethod": "g6riviS3", "paymentMethodFee": 57, "paymentOrderNo": "uMf6JS8T", "paymentProvider": "ALIPAY", "paymentProviderFee": 67, "paymentStationUrl": "QHAjZmX5", "price": 76, "refundedTime": "1999-06-29T00:00:00Z", "salesTax": 62, "sandbox": false, "sku": "sVc6jzOg", "status": "AUTHORISE_FAILED", "statusReason": "MTQQI1W8", "subscriptionId": "GQ9Nvu9A", "subtotalPrice": 84, "targetNamespace": "djjSWBEl", "targetUserId": "RpDcBbUn", "tax": 32, "totalPrice": 3, "totalTax": 99, "txEndTime": "1989-07-31T00:00:00Z", "type": "PwkHT7xx", "userId": "x58aIPli", "vat": 85}' \
    > test.out 2>&1
eval_tap $? 230 'ProcessUserSubscriptionNotification' test.out

#- 231 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '0dEY8Saz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hjR4D5ZX' \
    --body '{"count": 77, "orderNo": "FJzjHTR5"}' \
    > test.out 2>&1
eval_tap $? 231 'AcquireUserTicket' test.out

#- 232 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '3bymUEHV' \
    > test.out 2>&1
eval_tap $? 232 'QueryUserCurrencyWallets' test.out

#- 233 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '1kfv1qup' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n0f3iCgG' \
    --limit '7' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 233 'ListUserCurrencyTransactions' test.out

#- 234 CheckWallet
eval_tap 0 234 'CheckWallet # SKIP deprecated' test.out

#- 235 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '8NN4njFZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UtLcdgQK' \
    --body '{"amount": 46, "expireAt": "1972-10-05T00:00:00Z", "origin": "Stadia", "reason": "QRjmQpQv", "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 235 'CreditUserWallet' test.out

#- 236 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '7amMwEWJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i7jYiaOE' \
    --body '{"amount": 65, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 236 'PayWithUserWallet' test.out

#- 237 GetUserWallet
eval_tap 0 237 'GetUserWallet # SKIP deprecated' test.out

#- 238 DebitUserWallet
eval_tap 0 238 'DebitUserWallet # SKIP deprecated' test.out

#- 239 DisableUserWallet
eval_tap 0 239 'DisableUserWallet # SKIP deprecated' test.out

#- 240 EnableUserWallet
eval_tap 0 240 'EnableUserWallet # SKIP deprecated' test.out

#- 241 ListUserWalletTransactions
eval_tap 0 241 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 242 QueryWallets
eval_tap 0 242 'QueryWallets # SKIP deprecated' test.out

#- 243 GetWallet
eval_tap 0 243 'GetWallet # SKIP deprecated' test.out

#- 244 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'U7XCf9f7' \
    --end 'oR2uhhMk' \
    --start 'jgV4t8nD' \
    > test.out 2>&1
eval_tap $? 244 'SyncOrders' test.out

#- 245 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["uAtSxG4s", "SUd0CDNH", "KzuGVSGo"], "apiKey": "u6R0cVKz", "authoriseAsCapture": true, "blockedPaymentMethods": ["Dbqo7ycK", "d1Y2KJBt", "IZl1DqDX"], "clientKey": "eBJOIQ14", "dropInSettings": "lhmGs27F", "liveEndpointUrlPrefix": "Tc9pZEvk", "merchantAccount": "W9j6s9kH", "notificationHmacKey": "ALBUlIT1", "notificationPassword": "NDaLCYN5", "notificationUsername": "H963VSyT", "returnUrl": "tztMeBq7", "settings": "6Bp39wN2"}' \
    > test.out 2>&1
eval_tap $? 245 'TestAdyenConfig' test.out

#- 246 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "rcuPQFVk", "privateKey": "AZiUeU6c", "publicKey": "0xTof27J", "returnUrl": "6zV8EnA2"}' \
    > test.out 2>&1
eval_tap $? 246 'TestAliPayConfig' test.out

#- 247 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "MFaRRCCy", "secretKey": "eQMSTWU8"}' \
    > test.out 2>&1
eval_tap $? 247 'TestCheckoutConfig' test.out

#- 248 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'opR88NHM' \
    > test.out 2>&1
eval_tap $? 248 'DebugMatchedPaymentMerchantConfig' test.out

#- 249 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "y6hvZize", "clientSecret": "oWuLYQDj", "returnUrl": "rM4wZyOi", "webHookId": "NeSFIwnu"}' \
    > test.out 2>&1
eval_tap $? 249 'TestPayPalConfig' test.out

#- 250 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["aRg34ZLf", "KHVMXSZV", "rNNG5tDT"], "publishableKey": "xlLMZNsS", "secretKey": "Kz0mYZKq", "webhookSecret": "xTGbROLR"}' \
    > test.out 2>&1
eval_tap $? 250 'TestStripeConfig' test.out

#- 251 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "UF6JfQu1", "key": "gMr8Ks3g", "mchid": "nGO3GG0J", "returnUrl": "pI9fTDV7"}' \
    > test.out 2>&1
eval_tap $? 251 'TestWxPayConfig' test.out

#- 252 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "HgrL7at3", "flowCompletionUrl": "wRpdGK53", "merchantId": 49, "projectId": 30, "projectSecretKey": "prKxirow"}' \
    > test.out 2>&1
eval_tap $? 252 'TestXsollaConfig' test.out

#- 253 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'Oo9jvOg5' \
    > test.out 2>&1
eval_tap $? 253 'GetPaymentMerchantConfig' test.out

#- 254 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'DT0gy3mW' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["KSHCjvZ4", "63knRNkk", "JfNu61TG"], "apiKey": "ZI5COXyt", "authoriseAsCapture": true, "blockedPaymentMethods": ["iMAVcKmN", "EUVNizl3", "tqRm3zCw"], "clientKey": "tsI8lY8y", "dropInSettings": "6OZ0fVtg", "liveEndpointUrlPrefix": "TNmnY9M4", "merchantAccount": "0LdPGkWE", "notificationHmacKey": "SCOQ2Kld", "notificationPassword": "cAD3r0OC", "notificationUsername": "HZ6lo8iv", "returnUrl": "NPvddS37", "settings": "eWNumnCg"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateAdyenConfig' test.out

#- 255 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'SQGr9PVv' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 255 'TestAdyenConfigById' test.out

#- 256 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'jNhGKOB2' \
    --sandbox  \
    --validate  \
    --body '{"appId": "pRiUEnxT", "privateKey": "8WzAMrAB", "publicKey": "eGyEyG02", "returnUrl": "q7ujqcb1"}' \
    > test.out 2>&1
eval_tap $? 256 'UpdateAliPayConfig' test.out

#- 257 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'QOdbmZUd' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 257 'TestAliPayConfigById' test.out

#- 258 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'K5sKBEcw' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "pOmiQRaJ", "secretKey": "uzFoq6UQ"}' \
    > test.out 2>&1
eval_tap $? 258 'UpdateCheckoutConfig' test.out

#- 259 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'aeC7y14D' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 259 'TestCheckoutConfigById' test.out

#- 260 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'jqa6iQxT' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "dHJRZrzm", "clientSecret": "7Rl2EAVR", "returnUrl": "xhDBniZg", "webHookId": "yEHb5zRf"}' \
    > test.out 2>&1
eval_tap $? 260 'UpdatePayPalConfig' test.out

#- 261 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '7OwRhLel' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 261 'TestPayPalConfigById' test.out

#- 262 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'JGzQWsSX' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["ywD0ePLo", "N9sE4lTJ", "1pfqYKc0"], "publishableKey": "1I0SG7pG", "secretKey": "mPsrkCMI", "webhookSecret": "IP5o4BN4"}' \
    > test.out 2>&1
eval_tap $? 262 'UpdateStripeConfig' test.out

#- 263 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'avaIyLF4' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 263 'TestStripeConfigById' test.out

#- 264 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'IIHJXXMU' \
    --validate  \
    --body '{"appId": "BW9rvNn2", "key": "A5NFHxM9", "mchid": "DLyXqAff", "returnUrl": "ztO4ZpZ8"}' \
    > test.out 2>&1
eval_tap $? 264 'UpdateWxPayConfig' test.out

#- 265 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'wzX7EesF' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 265 'UpdateWxPayConfigCert' test.out

#- 266 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'mRLZJgwi' \
    > test.out 2>&1
eval_tap $? 266 'TestWxPayConfigById' test.out

#- 267 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'wOaNiBac' \
    --validate  \
    --body '{"apiKey": "yo4Konax", "flowCompletionUrl": "MzICbPiC", "merchantId": 5, "projectId": 75, "projectSecretKey": "X4ztdh1F"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateXsollaConfig' test.out

#- 268 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'QosjkPc4' \
    > test.out 2>&1
eval_tap $? 268 'TestXsollaConfigById' test.out

#- 269 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'fiFPoRQr' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateXsollaUIConfig' test.out

#- 270 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '72' \
    --namespace "$AB_NAMESPACE" \
    --offset '98' \
    --region '9F8UPnKU' \
    > test.out 2>&1
eval_tap $? 270 'QueryPaymentProviderConfig' test.out

#- 271 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "7mN6dzaj", "region": "RCzgsnsP", "sandboxTaxJarApiToken": "M6QLxqTq", "specials": ["CHECKOUT", "ALIPAY", "PAYPAL"], "taxJarApiToken": "5rMOINpd", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 271 'CreatePaymentProviderConfig' test.out

#- 272 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 272 'GetAggregatePaymentProviders' test.out

#- 273 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'FLdrU3xh' \
    > test.out 2>&1
eval_tap $? 273 'DebugMatchedPaymentProviderConfig' test.out

#- 274 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 274 'GetSpecialPaymentProviders' test.out

#- 275 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'Jmr0fpQr' \
    --body '{"aggregate": "ADYEN", "namespace": "cdnsGseG", "region": "GuESGwdN", "sandboxTaxJarApiToken": "w3NjxiNm", "specials": ["STRIPE", "ALIPAY", "WALLET"], "taxJarApiToken": "4Lqcm2aC", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 275 'UpdatePaymentProviderConfig' test.out

#- 276 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'WxhDlVM0' \
    > test.out 2>&1
eval_tap $? 276 'DeletePaymentProviderConfig' test.out

#- 277 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 277 'GetPaymentTaxConfig' test.out

#- 278 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "IyOyzszU", "taxJarApiToken": "p7eHWNm5", "taxJarEnabled": true, "taxJarProductCodesMapping": {"OhqO3liG": "Z2rGCyZt", "0P8lSaWG": "JAVjzaio", "AllfHGXy": "wi1gx38S"}}' \
    > test.out 2>&1
eval_tap $? 278 'UpdatePaymentTaxConfig' test.out

#- 279 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'iW6LEPI6' \
    --end 'VwlteVy8' \
    --start 'L4tHlau3' \
    > test.out 2>&1
eval_tap $? 279 'SyncPaymentOrders' test.out

#- 280 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'zeTX15Jx' \
    --storeId 'E1N2UuNr' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetRootCategories' test.out

#- 281 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'm0s2nl2j' \
    --storeId 'NvfU7ZaD' \
    > test.out 2>&1
eval_tap $? 281 'DownloadCategories' test.out

#- 282 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'XtdCTkNj' \
    --namespace "$AB_NAMESPACE" \
    --language 'JSHsG9Og' \
    --storeId 'KwpVPfn2' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetCategory' test.out

#- 283 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'vQfCtOXO' \
    --namespace "$AB_NAMESPACE" \
    --language 'N37LRu3m' \
    --storeId 'oINhk5gm' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetChildCategories' test.out

#- 284 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'C2OMrcew' \
    --namespace "$AB_NAMESPACE" \
    --language '31ZLs8Ho' \
    --storeId 'BwFLl0Mu' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetDescendantCategories' test.out

#- 285 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 285 'PublicListCurrencies' test.out

#- 286 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '7Tkkn6K4' \
    --region 'iPloDbNE' \
    --storeId 'FWIiSojj' \
    --appId 'pYvUEp8Z' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetItemByAppId' test.out

#- 287 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'aWKxo9az' \
    --categoryPath 'aYGhSOVa' \
    --features 'jVhZIO3V' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --language 'usJzZ56Q' \
    --limit '17' \
    --offset '54' \
    --region 'fWYKzMlF' \
    --sortBy 'name:desc,createdAt' \
    --storeId 'kuSCfD06' \
    --tags '5Lej4v7C' \
    > test.out 2>&1
eval_tap $? 287 'PublicQueryItems' test.out

#- 288 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'XbJooZ9F' \
    --region 'Ro7YWrxn' \
    --storeId '2fLFzyj4' \
    --sku 'zPBlzQb4' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetItemBySku' test.out

#- 289 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'FA2FnZc8' \
    --region 'LzKEUjki' \
    --storeId 'FAkOUE9F' \
    --itemIds 'IFyDOS7c' \
    > test.out 2>&1
eval_tap $? 289 'PublicBulkGetItems' test.out

#- 290 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["qnKfaoI6", "jDoXhK8R", "qE6UwNYq"]}' \
    > test.out 2>&1
eval_tap $? 290 'PublicValidateItemPurchaseCondition' test.out

#- 291 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'OPTIONBOX' \
    --limit '99' \
    --offset '10' \
    --region 'pw08Unlx' \
    --storeId 'kadHHPqE' \
    --keyword 'A5CI50Tr' \
    --language 'ZT67HlBW' \
    > test.out 2>&1
eval_tap $? 291 'PublicSearchItems' test.out

#- 292 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '3gGgaCrR' \
    --namespace "$AB_NAMESPACE" \
    --language 'JF5ZhhX5' \
    --region 'f25nysfh' \
    --storeId 'qxlfLxxe' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetApp' test.out

#- 293 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'NVDcC2Ow' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 293 'PublicGetItemDynamicData' test.out

#- 294 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'iisnfimd' \
    --namespace "$AB_NAMESPACE" \
    --language 'VFgnma4q' \
    --populateBundle  \
    --region 'YeG387Mc' \
    --storeId 'AuSoerYk' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetItem' test.out

#- 295 GetPaymentCustomization
eval_tap 0 295 'GetPaymentCustomization # SKIP deprecated' test.out

#- 296 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "UrHCKxLK", "paymentProvider": "ALIPAY", "returnUrl": "6f44PAxS", "ui": "EMuixyaM", "zipCode": "ITUthdCa"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetPaymentUrl' test.out

#- 297 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yXPUWe4g' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetPaymentMethods' test.out

#- 298 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'JqywEq9M' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetUnpaidPaymentOrder' test.out

#- 299 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'syyQ8hpw' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'GdSf7x1w' \
    --body '{"token": "0dxbyOkK"}' \
    > test.out 2>&1
eval_tap $? 299 'Pay' test.out

#- 300 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rpc77mxe' \
    > test.out 2>&1
eval_tap $? 300 'PublicCheckPaymentOrderPaidStatus' test.out

#- 301 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'J4N0e0sT' \
    > test.out 2>&1
eval_tap $? 301 'GetPaymentPublicConfig' test.out

#- 302 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '2JFjO4xt' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetQRCode' test.out

#- 303 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '8v4XYYPE' \
    --foreinginvoice 'KToo6jiP' \
    --invoiceId 'TSweWsbw' \
    --payload 'WxpxzGVb' \
    --redirectResult 'eY6ZNsSs' \
    --resultCode 'e7bocfqM' \
    --sessionId 'tJd7lloM' \
    --status 'voOm1D7V' \
    --token '1CnTjYF4' \
    --type 'o4VxZVeX' \
    --userId 'Vxa4FHd1' \
    --orderNo 'gK3dN2QD' \
    --paymentOrderNo 'RG8ThEuI' \
    --paymentProvider 'PAYPAL' \
    --returnUrl 'gMtHM6Ja' \
    > test.out 2>&1
eval_tap $? 303 'PublicNormalizePaymentReturnUrl' test.out

#- 304 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'cjBUICak' \
    --paymentOrderNo 'qYocwR4Z' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 304 'GetPaymentTaxValue' test.out

#- 305 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'xqQkVK9f' \
    > test.out 2>&1
eval_tap $? 305 'GetRewardByCode' test.out

#- 306 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'aUaBX4uX' \
    --limit '1' \
    --offset '60' \
    --sortBy 'rewardCode:desc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 306 'QueryRewards1' test.out

#- 307 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'BZ9kHDr8' \
    > test.out 2>&1
eval_tap $? 307 'GetReward1' test.out

#- 308 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 308 'PublicListStores' test.out

#- 309 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'YwipWMUl,t8CDKdqF,A7z5TLn9' \
    --itemIds 'JZH2OyqH,QabA6wHs,hdCFaewT' \
    --skus 'SFjqt4YI,ahcZCFrc,sDLanwX0' \
    > test.out 2>&1
eval_tap $? 309 'PublicExistsAnyMyActiveEntitlement' test.out

#- 310 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'ai14JcMs' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 311 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId '9yCAP3iV' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 312 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'ctuTPZXr' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 313 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'VbnUWkCa,tafi6wct,8wLeao1i' \
    --itemIds '2UVqaWJp,Y3o59AAj,tRIFh9ZK' \
    --skus 'tfaAQ9Xo,aknAiQ2P,kNAluCGP' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetEntitlementOwnershipToken' test.out

#- 314 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '0rTANonb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyWallet' test.out

#- 315 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ovET1C8I' \
    --body '{"epicGamesJwtToken": "zDkevhZ0"}' \
    > test.out 2>&1
eval_tap $? 315 'SyncEpicGameDLC' test.out

#- 316 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rOa74MT4' \
    --body '{"serviceLabel": 8}' \
    > test.out 2>&1
eval_tap $? 316 'PublicSyncPsnDlcInventory' test.out

#- 317 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'zMY7soCu' \
    --body '{"appId": "IS7YGD9l", "steamId": "ZVyfuRyD"}' \
    > test.out 2>&1
eval_tap $? 317 'SyncSteamDLC' test.out

#- 318 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKAqaDTC' \
    --body '{"xstsToken": "mUXYor7a"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncXboxDLC' test.out

#- 319 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OuNM1qna' \
    --appType 'DLC' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'gFiSC6et' \
    --features 'NlDSLKpq,AjV1NjCm,dNKyHVhQ' \
    --itemId 'a66fb615,O9tUFEeL,4hA3oDDr' \
    --limit '0' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 319 'PublicQueryUserEntitlements' test.out

#- 320 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOMdjWt5' \
    --appId '9Di9KQQg' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetUserAppEntitlementByAppId' test.out

#- 321 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'LFkNIdYf' \
    --limit '19' \
    --offset '57' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 321 'PublicQueryUserEntitlementsByAppType' test.out

#- 322 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'y8iYoKHY' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'W6m9gvC0' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserEntitlementByItemId' test.out

#- 323 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'tuzCzrEs' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'HBpp084B' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetUserEntitlementBySku' test.out

#- 324 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qmI3p7IV' \
    --appIds 'EA1w2b8T,2hcKK6pK,RS5VbBJq' \
    --itemIds 'PjHuHCOX,DgBB70nA,nEfoAyvS' \
    --skus 'GAo4e6El,tO85yW1l,lH0rv0Fx' \
    > test.out 2>&1
eval_tap $? 324 'PublicExistsAnyUserActiveEntitlement' test.out

#- 325 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'RQaXS7MN' \
    --appId 'dB3vjdkO' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 326 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZryukXyS' \
    --entitlementClazz 'CODE' \
    --itemId 'jPtWnOCX' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 327 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'rEGkSlyP' \
    --ids 'ziePn6nq,kbEUtDo2,QvRaNhgh' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 328 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y6L1oo2L' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'hAht3Xey' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 329 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'gcobDDB2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zwt2DuFW' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserEntitlement' test.out

#- 330 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'SqWVxhOy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rrk1IwBb' \
    --body '{"options": ["RmwUCOhv", "z6g3GgX1", "DEKEUewV"], "requestId": "ZA2YNX2f", "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 330 'PublicConsumeUserEntitlement' test.out

#- 331 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'AqTODJP8' \
    --body '{"code": "Eg5BI1r9", "language": "Yq-WvLp_mp", "region": "14BA3RGy"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicRedeemCode' test.out

#- 332 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8Xi7UGk' \
    --body '{"excludeOldTransactions": false, "language": "ERd-wdXO", "productId": "TLOl2ns5", "receiptData": "WBGp2x3w", "region": "aqpx23Gz", "transactionId": "YEdbX9wE"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicFulfillAppleIAPItem' test.out

#- 333 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'dtRM5QPY' \
    --body '{"epicGamesJwtToken": "dkgKPYnH"}' \
    > test.out 2>&1
eval_tap $? 333 'SyncEpicGamesInventory' test.out

#- 334 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'y1xov0uP' \
    --body '{"autoAck": false, "language": "teIW_kUuD_jk", "orderId": "1o0fnwmM", "packageName": "N9IfDrtu", "productId": "2TKidrJq", "purchaseTime": 62, "purchaseToken": "h4b0WpBt", "region": "LkS9rvUr"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicFulfillGoogleIAPItem' test.out

#- 335 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'inJSldWf' \
    --body '{"currencyCode": "CNlYnPQY", "price": 0.092658074734008, "productId": "5R9znEPo", "serviceLabel": 80}' \
    > test.out 2>&1
eval_tap $? 335 'PublicReconcilePlayStationStore' test.out

#- 336 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'v6WpiM22' \
    --body '{"appId": "rbezi8eQ", "language": "nho-557", "region": "UwNfLoDh", "stadiaPlayerId": "7OHFfD0r"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncStadiaEntitlement' test.out

#- 337 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6KP78la9' \
    --body '{"appId": "5H1vVGFF", "currencyCode": "5SZyal54", "language": "ql", "price": 0.9124395215809531, "productId": "gjoukDHC", "region": "Nu0OkARZ", "steamId": "cr71TlVZ"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncSteamInventory' test.out

#- 338 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XbNooRVA' \
    --body '{"gameId": "6eBF5cbO", "language": "fA-gI", "region": "36vfxjjs"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncTwitchDropsEntitlement' test.out

#- 339 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'EUvJNcYa' \
    --body '{"currencyCode": "0RCJ1WYO", "price": 0.6520688445065067, "productId": "crmBt0bj", "xstsToken": "bE9zNyO2"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncXboxInventory' test.out

#- 340 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'NaOSfGBR' \
    --itemId '3gTCK8e0' \
    --limit '49' \
    --offset '71' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 340 'PublicQueryUserOrders' test.out

#- 341 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYdMHKWJ' \
    --body '{"currencyCode": "nFsBsjxq", "discountedPrice": 43, "ext": {"L7zAzDWI": {}, "LFIId6xv": {}, "Jq3FvpqV": {}}, "itemId": "fS7huoPu", "language": "DDO_ELNu-Ze", "price": 47, "quantity": 71, "region": "Yv7CP1kS", "returnUrl": "KZjzSkxO"}' \
    > test.out 2>&1
eval_tap $? 341 'PublicCreateUserOrder' test.out

#- 342 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CnKyi9xh' \
    --userId 'IYCIuETs' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserOrder' test.out

#- 343 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CyKxeptx' \
    --userId '5XfX1OZj' \
    > test.out 2>&1
eval_tap $? 343 'PublicCancelUserOrder' test.out

#- 344 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gs81xbz2' \
    --userId 'Ttb7mYOF' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserOrderHistories' test.out

#- 345 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wrFrPjBl' \
    --userId '85hd9bWz' \
    > test.out 2>&1
eval_tap $? 345 'PublicDownloadUserOrderReceipt' test.out

#- 346 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'JGpVYfxA' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetPaymentAccounts' test.out

#- 347 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'wvjtIRzK' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId '4WICKJ2v' \
    > test.out 2>&1
eval_tap $? 347 'PublicDeletePaymentAccount' test.out

#- 348 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'VWIbgk8i' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'ywBaAM9U' \
    --limit '85' \
    --offset '56' \
    --sku 'KyzQFySj' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 348 'PublicQueryUserSubscriptions' test.out

#- 349 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'z1mZLHNO' \
    --body '{"currencyCode": "p3QCLY2x", "itemId": "LUONkRjd", "language": "fR", "region": "o09Up7ZL", "returnUrl": "w3RB4NeV", "source": "CpbpZxb1"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicSubscribeSubscription' test.out

#- 350 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DhYGHx20' \
    --itemId 'ibR98g3o' \
    > test.out 2>&1
eval_tap $? 350 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 351 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PJ5Q9Ubo' \
    --userId '2BkFeVYo' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserSubscription' test.out

#- 352 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hAXUNQoO' \
    --userId '3qllmwO0' \
    > test.out 2>&1
eval_tap $? 352 'PublicChangeSubscriptionBillingAccount' test.out

#- 353 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'm8IoVqft' \
    --userId 'v6ABr1EX' \
    --body '{"immediate": false, "reason": "4OOs70lX"}' \
    > test.out 2>&1
eval_tap $? 353 'PublicCancelSubscription' test.out

#- 354 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2yD5ozVU' \
    --userId 'ecVkJdT7' \
    --excludeFree  \
    --limit '27' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUserSubscriptionBillingHistories' test.out

#- 355 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '5dp9adP8' \
    --namespace "$AB_NAMESPACE" \
    --userId '8xrMiIDI' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetWallet' test.out

#- 356 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'Iz8gJIO0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWqlCroW' \
    --limit '49' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 356 'PublicListUserWalletTransactions' test.out

#- 357 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'wLY6ovbR' \
    --baseAppId '8ljONm1N' \
    --categoryPath 'HN3Yh5EV' \
    --features '4rN1oXxW' \
    --includeSubCategoryItem  \
    --itemStatus 'INACTIVE' \
    --itemType 'APP' \
    --limit '14' \
    --offset '93' \
    --region 'rfsgORNS' \
    --sortBy 'name:desc,name:asc,displayOrder:desc' \
    --storeId 'fmNwaOMC' \
    --tags 'XbSIHvVV' \
    --targetNamespace '9zWZw8Yj' \
    > test.out 2>&1
eval_tap $? 357 'QueryItems1' test.out

#- 358 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h8C4vYvI' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 358 'ImportStore1' test.out

#- 359 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '4HLjtYJ2' \
    --body '{"itemIds": ["MC9QlgVt", "UWSZqNky", "tFV3cbO8"]}' \
    > test.out 2>&1
eval_tap $? 359 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE