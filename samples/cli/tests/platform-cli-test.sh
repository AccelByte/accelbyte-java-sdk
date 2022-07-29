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
echo "1..346"

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
    --body '{"context": {"item": {"appId": "ZRneUaCl", "appType": "DEMO", "baseAppId": "FJRgWa3D", "boothName": "9Zt6jc72", "boundItemIds": ["1uQafk7Z", "ntnbrI9d", "7MLnq9ES"], "categoryPath": "yQ6F5fA6", "clazz": "GniSBTFN", "createdAt": "1972-02-06T00:00:00Z", "description": "l6p4g480", "displayOrder": 99, "entitlementType": "CONSUMABLE", "ext": {"DKofI6i5": {}, "aVZYRrdl": {}, "EEycuKkL": {}}, "features": ["jdVt8yrc", "iSSROZqW", "fkkZeZAb"], "images": [{"as": "WcRf3aFU", "caption": "d9GbSZTI", "height": 71, "imageUrl": "qaOHENQT", "smallImageUrl": "5E6IEI2Z", "width": 62}, {"as": "c9Wd4wt5", "caption": "YgQdJ7e3", "height": 41, "imageUrl": "RLiggCjh", "smallImageUrl": "7ULM6Qci", "width": 26}, {"as": "36ziUDJj", "caption": "Qwxcs41M", "height": 75, "imageUrl": "smk0egMn", "smallImageUrl": "cqFBsp4X", "width": 92}], "itemId": "PinKJsWf", "itemIds": ["owUZrQ7k", "ZIn9A2qb", "mucK9nDX"], "itemQty": {"zvp9pjnp": 79, "atbYeh6U": 6, "y44c92sb": 47}, "itemType": "COINS", "language": "6Y9de7Ne", "listable": true, "localExt": {"R83v71RM": {}, "gr1fcgHI": {}, "PwFjgGnA": {}}, "longDescription": "z96Vx4bR", "maxCount": 18, "maxCountPerUser": 59, "name": "2eVHp3bB", "namespace": "jwAPY9cn", "optionBoxConfig": {"boxItems": [{"count": 84, "itemId": "3GnoymWd", "itemSku": "Llsw1PAt"}, {"count": 61, "itemId": "xiQfB8uL", "itemSku": "B5HZlkzr"}, {"count": 70, "itemId": "hD0PyWaZ", "itemSku": "r0X4tM45"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 85, "comparison": "is", "name": "1eRgjMcW", "predicateType": "EntitlementPredicate", "value": "QNT0pacE", "values": ["FmRSJVRw", "qmGy1Wue", "UcsKQ7bE"]}, {"anyOf": 84, "comparison": "isNot", "name": "u55xM6fJ", "predicateType": "EntitlementPredicate", "value": "LYpRnM9r", "values": ["weD6cTVb", "DWUVchII", "IMl505N7"]}, {"anyOf": 94, "comparison": "is", "name": "ZUMoXUdm", "predicateType": "EntitlementPredicate", "value": "OtJHXSv7", "values": ["a8nqCrqz", "gMW6Jp96", "gReK8I70"]}]}, {"operator": "or", "predicates": [{"anyOf": 21, "comparison": "excludes", "name": "cPwBgfdN", "predicateType": "SeasonPassPredicate", "value": "54qcqSrB", "values": ["84KEyNQF", "ICPDckkc", "3WN2qPoL"]}, {"anyOf": 83, "comparison": "isLessThan", "name": "6FV8dKoa", "predicateType": "EntitlementPredicate", "value": "kfqZo3zI", "values": ["OJOTBqFT", "Zb0gA5oN", "prFGyvBN"]}, {"anyOf": 86, "comparison": "isLessThanOrEqual", "name": "twXdIANE", "predicateType": "EntitlementPredicate", "value": "KAcrwLRc", "values": ["wXRDX8UA", "5TEURZvR", "rUZZ5Suw"]}]}, {"operator": "and", "predicates": [{"anyOf": 55, "comparison": "isLessThanOrEqual", "name": "Q3vRi6uH", "predicateType": "SeasonTierPredicate", "value": "Z1dlomWw", "values": ["BnUQJ0ar", "HUieZYEY", "RG0Zj2bj"]}, {"anyOf": 18, "comparison": "includes", "name": "KzEDXVws", "predicateType": "EntitlementPredicate", "value": "Im4M72Iu", "values": ["qiQVQAG3", "chBrpKZD", "xek0NO9Q"]}, {"anyOf": 25, "comparison": "is", "name": "JLoB6hxr", "predicateType": "EntitlementPredicate", "value": "QxTEriwk", "values": ["l8svpKbk", "Nw3LIBp9", "I401ayrY"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 99, "fixedTrialCycles": 21, "graceDays": 55}, "region": "uWijquuv", "regionData": [{"currencyCode": "SR7aR4lz", "currencyNamespace": "xJKjMj8k", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1993-01-01T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1997-10-19T00:00:00Z", "discountedPrice": 50, "expireAt": "1974-04-09T00:00:00Z", "price": 37, "purchaseAt": "1999-08-04T00:00:00Z", "trialPrice": 2}, {"currencyCode": "oayE20c9", "currencyNamespace": "8wDXCEBV", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1994-11-02T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1978-07-26T00:00:00Z", "discountedPrice": 77, "expireAt": "1999-12-20T00:00:00Z", "price": 12, "purchaseAt": "1972-09-16T00:00:00Z", "trialPrice": 6}, {"currencyCode": "UtEVERiZ", "currencyNamespace": "oEVbc4Td", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1992-11-28T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1985-05-02T00:00:00Z", "discountedPrice": 44, "expireAt": "1973-12-03T00:00:00Z", "price": 24, "purchaseAt": "1978-10-02T00:00:00Z", "trialPrice": 99}], "seasonType": "PASS", "sku": "t3uP91Va", "stackable": true, "status": "INACTIVE", "tags": ["vAJsqcVz", "BXXDBNKp", "TQRxFFOi"], "targetCurrencyCode": "7A1gA9In", "targetItemId": "xzGXslOD", "targetNamespace": "gjn7ZRU8", "thumbnailUrl": "aMBp0Bn8", "title": "Ce20ndbI", "updatedAt": "1978-12-13T00:00:00Z", "useCount": 100}, "namespace": "BTZsSxsH", "order": {"currency": {"currencyCode": "gSFVapt9", "currencySymbol": "tw1K7feD", "currencyType": "VIRTUAL", "decimals": 65, "namespace": "KlOpvtDR"}, "ext": {"NmnpmZMw": {}, "GX8tpuYC": {}, "jcrL0DEU": {}}, "free": true}, "source": "PURCHASE"}, "script": "qpKXxIRC", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id '68HTDQFK' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'jlxqI9sb' \
    --body '{"grantDays": "rziie4jQ"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'ssrYlSSv' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'Eddn4g35' \
    --body '{"grantDays": "D3SJnE98"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --name 'bRDPbLgv' \
    --offset '9' \
    --tag 'G9bncVRL' \
    > test.out 2>&1
eval_tap $? 8 'QueryCampaigns' test.out

#- 9 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ThUAsXJx", "items": [{"extraSubscriptionDays": 38, "itemId": "TmRotPBA", "itemName": "EZh50JWp", "quantity": 13}, {"extraSubscriptionDays": 5, "itemId": "DSGuPOyQ", "itemName": "Co3O0VMR", "quantity": 6}, {"extraSubscriptionDays": 55, "itemId": "ZnRlmsIh", "itemName": "PgPlbnUq", "quantity": 94}], "maxRedeemCountPerCampaignPerUser": 48, "maxRedeemCountPerCode": 94, "maxRedeemCountPerCodePerUser": 25, "maxSaleCount": 43, "name": "BcaeQp2U", "redeemEnd": "1975-07-06T00:00:00Z", "redeemStart": "1991-09-22T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["lNd2ZP9D", "7c8D7BkU", "5KxiRZ9j"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateCampaign' test.out

#- 10 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'Q6lm9rYd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetCampaign' test.out

#- 11 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '7ytAnpWw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "gId8ukbQ", "items": [{"extraSubscriptionDays": 87, "itemId": "LYD9lR5B", "itemName": "DlHdtv3n", "quantity": 65}, {"extraSubscriptionDays": 78, "itemId": "xvRhodmU", "itemName": "tzXtz6pB", "quantity": 57}, {"extraSubscriptionDays": 60, "itemId": "6lnx8VIo", "itemName": "OieBh1Ki", "quantity": 30}], "maxRedeemCountPerCampaignPerUser": 84, "maxRedeemCountPerCode": 96, "maxRedeemCountPerCodePerUser": 5, "maxSaleCount": 80, "name": "QSMwjXNd", "redeemEnd": "1992-12-31T00:00:00Z", "redeemStart": "1988-04-24T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["08HfRhPr", "k6bmP8Gj", "4MEdoYV4"]}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateCampaign' test.out

#- 12 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'aAOTqrL4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetCampaignDynamic' test.out

#- 13 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zOWsAQwe' \
    > test.out 2>&1
eval_tap $? 13 'GetRootCategories' test.out

#- 14 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FcToANZg' \
    --body '{"categoryPath": "3A5u1wsb", "localizationDisplayNames": {"Vid3sI2B": "FFjNtUlV", "Ngsbc2gQ": "9ufIEPkJ", "4hpmjPOW": "ALd5r0G0"}}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCategory' test.out

#- 15 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XNWWU9AV' \
    > test.out 2>&1
eval_tap $? 15 'ListCategoriesBasic' test.out

#- 16 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath '9hyhjUOA' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4wq7xC7S' \
    > test.out 2>&1
eval_tap $? 16 'GetCategory' test.out

#- 17 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'HDlkFf8K' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hqhW7GBh' \
    --body '{"localizationDisplayNames": {"AJkcBGZ4": "Fa2DCcId", "A74QR5S4": "P8PBOYXP", "vNTr4pxh": "Z1mVbDEN"}}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCategory' test.out

#- 18 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath '0KkIM3WS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'D5i2a26F' \
    > test.out 2>&1
eval_tap $? 18 'DeleteCategory' test.out

#- 19 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'K9NTiUP0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'N1X9NngL' \
    > test.out 2>&1
eval_tap $? 19 'GetChildCategories' test.out

#- 20 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'uNnw0fzU' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'paM75EGW' \
    > test.out 2>&1
eval_tap $? 20 'GetDescendantCategories' test.out

#- 21 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '6J5bA1JB' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '25' \
    --code 'sMGWZUQG' \
    --limit '90' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 21 'QueryCodes' test.out

#- 22 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'c0984cG3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 79}' \
    > test.out 2>&1
eval_tap $? 22 'CreateCodes' test.out

#- 23 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'CuUjdmoy' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '48' \
    > test.out 2>&1
eval_tap $? 23 'Download' test.out

#- 24 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'xh2IeH4r' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '55' \
    > test.out 2>&1
eval_tap $? 24 'BulkDisableCodes' test.out

#- 25 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 't0GgapIq' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '82' \
    > test.out 2>&1
eval_tap $? 25 'BulkEnableCodes' test.out

#- 26 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'Cpxbv8Be' \
    --namespace "$AB_NAMESPACE" \
    --code 'qCIih8Ff' \
    --limit '91' \
    --offset '96' \
    --userId 'S2Rih0Ed' \
    > test.out 2>&1
eval_tap $? 26 'QueryRedeemHistory' test.out

#- 27 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'k8iRDwsG' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 27 'GetCode' test.out

#- 28 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code '8xo2rkmS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DisableCode' test.out

#- 29 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'ncrDojXE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'EnableCode' test.out

#- 30 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 30 'ListCurrencies' test.out

#- 31 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "izllgnG1", "currencySymbol": "MnVxdGG1", "currencyType": "REAL", "decimals": 10, "localizationDescriptions": {"0Y2SMrxG": "9Yy6T20w", "BbVQtqxh": "VpHECLT7", "GP7H1Pm0": "HPwkyhZ8"}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateCurrency' test.out

#- 32 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'rWnc9qax' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"czd5GtoB": "IvorcCwr", "yOq8ZirK": "3PON0MHU", "NMftqJ4x": "diWDJYeC"}}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateCurrency' test.out

#- 33 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'vBUixeRY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteCurrency' test.out

#- 34 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'flYq2q18' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetCurrencyConfig' test.out

#- 35 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'hvAedjIi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'GetCurrencySummary' test.out

#- 36 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'GetDLCItemConfig' test.out

#- 37 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "Xg79ivTB", "rewards": [{"currency": {"currencyCode": "h92irhG8", "namespace": "K7NIBV7s"}, "item": {"itemId": "kZFP4vG2", "itemSku": "7s7L7JWR", "itemType": "tNAh1hZf"}, "quantity": 10, "type": "ITEM"}, {"currency": {"currencyCode": "KUVSi3zx", "namespace": "fyCUP3bI"}, "item": {"itemId": "uTgmBoc3", "itemSku": "mn7yY80B", "itemType": "xlljyPPP"}, "quantity": 87, "type": "ITEM"}, {"currency": {"currencyCode": "cM44tuWW", "namespace": "LbiL6yX8"}, "item": {"itemId": "oRnZTcdc", "itemSku": "P3tBur11", "itemType": "SFIdH1Di"}, "quantity": 57, "type": "CURRENCY"}]}, {"id": "3AevmEGq", "rewards": [{"currency": {"currencyCode": "VcjKfWGA", "namespace": "XAvLskkk"}, "item": {"itemId": "J97aHXyV", "itemSku": "JJE5kDW8", "itemType": "32khLYm5"}, "quantity": 33, "type": "CURRENCY"}, {"currency": {"currencyCode": "XSsIaGut", "namespace": "Nv95Ds4h"}, "item": {"itemId": "UygFvQwi", "itemSku": "4zzNWOow", "itemType": "015CsDJn"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "4vQinKoa", "namespace": "Uun3TR4U"}, "item": {"itemId": "SgqCTuWu", "itemSku": "kq63yMbM", "itemType": "1JdqBNZF"}, "quantity": 95, "type": "ITEM"}]}, {"id": "5c7WZNYV", "rewards": [{"currency": {"currencyCode": "yTwu9uGa", "namespace": "R1NwmzDQ"}, "item": {"itemId": "nqzyF6xp", "itemSku": "DJsxFM2X", "itemType": "TThMu36m"}, "quantity": 86, "type": "ITEM"}, {"currency": {"currencyCode": "knshZlwX", "namespace": "M2aWkZ5T"}, "item": {"itemId": "iEkG06R2", "itemSku": "gG1DgnJb", "itemType": "kyTa0hNj"}, "quantity": 98, "type": "ITEM"}, {"currency": {"currencyCode": "2ZI3cz8t", "namespace": "z8WDUvdp"}, "item": {"itemId": "aiJsIRuo", "itemSku": "YZmdlQG7", "itemType": "BKluGjUI"}, "quantity": 85, "type": "ITEM"}]}]}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateDLCItemConfig' test.out

#- 38 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'DeleteDLCItemConfig' test.out

#- 39 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'GetPlatformDLCConfig' test.out

#- 40 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"fSyf74lz": "aSEiuaRT", "v5ZAFCi9": "cF3kN95m", "5tScGH7K": "51tG58xl"}}, {"platform": "STEAM", "platformDlcIdMap": {"Gt6YRUD6": "vloAU3kL", "XU8WGtup": "IFscUMm3", "jD8hTVY9": "knZzrB3S"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"ysPHZlRI": "aBdTVsua", "8Acairtm": "UPy3asKO", "V4ooGgUP": "fPM1mHiO"}}]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdatePlatformDLCConfig' test.out

#- 41 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'DeletePlatformDLCConfig' test.out

#- 42 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'CODE' \
    --entitlementName 'JRc6seWn' \
    --itemId 'wwZ3mAKt", "cVRLUm23", "AlJi9HgB' \
    --limit '53' \
    --offset '99' \
    --userId 'mxrMVhGN' \
    > test.out 2>&1
eval_tap $? 42 'QueryEntitlements' test.out

#- 43 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'uWYwDdqg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetEntitlement' test.out

#- 44 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '74' \
    --offset '88' \
    --status 'SUCCESS' \
    --userId 'QT8xp5tM' \
    > test.out 2>&1
eval_tap $? 44 'QueryFulfillmentHistories' test.out

#- 45 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetAppleIAPConfig' test.out

#- 46 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"bundleId": "2VaEaHyD", "password": "YOXpluIT"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateAppleIAPConfig' test.out

#- 47 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'DeleteAppleIAPConfig' test.out

#- 48 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetEpicGamesIAPConfig' test.out

#- 49 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "84FSXsim"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateEpicGamesIAPConfig' test.out

#- 50 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteEpicGamesIAPConfig' test.out

#- 51 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetGoogleIAPConfig' test.out

#- 52 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "eOIWF9j8", "serviceAccountId": "HBYUO8Bs"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGoogleIAPConfig' test.out

#- 53 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'DeleteGoogleIAPConfig' test.out

#- 54 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGoogleP12File' test.out

#- 55 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetIAPItemConfig' test.out

#- 56 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "TJC23NiI", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"5EwnM2KW": "krdTDaQ7", "KdiCtXkp": "iGvmOL60", "OLARbNli": "kMZ2jmal"}}, {"itemIdentity": "X6oEgwCo", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"GNaqs0vD": "ryOg8OrY", "1bjF3UDu": "dLoVHlSd", "2XmrcZcg": "w8rtofX2"}}, {"itemIdentity": "MTFcU9ro", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"PZaGQlQo": "Z5b04JW6", "DIBr83lk": "qtLB3vHr", "12LnsSHC": "OVZeCvcL"}}]}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateIAPItemConfig' test.out

#- 57 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'DeleteIAPItemConfig' test.out

#- 58 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetPlayStationIAPConfig' test.out

#- 59 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"environment": "DRh26vcU"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdatePlaystationIAPConfig' test.out

#- 60 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'DeletePlaystationIAPConfig' test.out

#- 61 GetStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetStadiaIAPConfig' test.out

#- 62 DeleteStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteStadiaIAPConfig' test.out

#- 63 UpdateStadiaJsonConfigFile
./ng net.accelbyte.sdk.cli.Main platform updateStadiaJsonConfigFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 63 'UpdateStadiaJsonConfigFile' test.out

#- 64 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetSteamIAPConfig' test.out

#- 65 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "4G58N7XG", "publisherAuthenticationKey": "qYWREmJr"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateSteamIAPConfig' test.out

#- 66 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'DeleteSteamIAPConfig' test.out

#- 67 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetTwitchIAPConfig' test.out

#- 68 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "7PH7NDoE", "clientSecret": "2C4v9Acr", "organizationId": "KcUBTe1Q"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdateTwitchIAPConfig' test.out

#- 69 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteTwitchIAPConfig' test.out

#- 70 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetXblIAPConfig' test.out

#- 71 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "SPWzaYOF"}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateXblIAPConfig' test.out

#- 72 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 72 'DeleteXblAPConfig' test.out

#- 73 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'cv2Mg2uL' \
    > test.out 2>&1
eval_tap $? 73 'UpdateXblBPCertFile' test.out

#- 74 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EcTPyHDM' \
    --body '{"categoryPath": "moaboQ4u", "targetItemId": "ZmmNimru", "targetNamespace": "uNkGR3Lj"}' \
    > test.out 2>&1
eval_tap $? 74 'SyncInGameItem' test.out

#- 75 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rSjjzvY9' \
    --body '{"appId": "TxZDAsWX", "appType": "GAME", "baseAppId": "qS3yNKoh", "boothName": "yGZXr5AY", "categoryPath": "HXfj0FFX", "clazz": "TtgsnvW1", "displayOrder": 78, "entitlementType": "DURABLE", "ext": {"y9vBZ6qB": {}, "T2ha6X1j": {}, "4h0jaXWA": {}}, "features": ["1FxodSuE", "DxlOhuWY", "bbkNYCFY"], "images": [{"as": "dUbYhzQh", "caption": "DXsEPEko", "height": 89, "imageUrl": "zqh7KSLA", "smallImageUrl": "rMSxPYaT", "width": 81}, {"as": "zyPvm1IA", "caption": "aNZYcPMC", "height": 4, "imageUrl": "WArTQLMJ", "smallImageUrl": "4g6WTm3k", "width": 2}, {"as": "kU5FXLdR", "caption": "6au2evV0", "height": 4, "imageUrl": "v74Jy106", "smallImageUrl": "0jw9V65r", "width": 26}], "itemIds": ["yBbIEWdL", "7dHglFlt", "I0Jd0rRy"], "itemQty": {"Yu6LMbph": 94, "K4HwoHlL": 72, "pYfA06QN": 54}, "itemType": "CODE", "listable": false, "localizations": {"nvO7n4OT": {"description": "Rwjc322n", "localExt": {"jeYXgb0J": {}, "taGNVZVL": {}, "q78XlcFN": {}}, "longDescription": "Euflqb3M", "title": "fAVyK2NP"}, "XiP4NIfJ": {"description": "2sMbDXuT", "localExt": {"3lgs9Pmm": {}, "nmxiplxs": {}, "FjwVOdCG": {}}, "longDescription": "N1Gxi3MQ", "title": "lE1GHNlV"}, "lsOiVGNG": {"description": "la6LYtL2", "localExt": {"zyKN33GY": {}, "mwJztDWr": {}, "Axp5AaUv": {}}, "longDescription": "eAufY81f", "title": "EaHk5aoS"}}, "maxCount": 87, "maxCountPerUser": 40, "name": "5nAtN3Rv", "optionBoxConfig": {"boxItems": [{"count": 57, "itemId": "Jfd0fYEJ", "itemSku": "WbCcBp07"}, {"count": 24, "itemId": "ImonPc9p", "itemSku": "ZEsPdhQ3"}, {"count": 28, "itemId": "L3AvCAft", "itemSku": "LCJuoMAF"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 47, "fixedTrialCycles": 45, "graceDays": 32}, "regionData": {"uIEMcU0Z": [{"currencyCode": "JkL9L7fb", "currencyNamespace": "Opv7tcBL", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1982-01-03T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1972-09-01T00:00:00Z", "discountedPrice": 96, "expireAt": "1993-01-29T00:00:00Z", "price": 24, "purchaseAt": "1980-04-04T00:00:00Z", "trialPrice": 100}, {"currencyCode": "7rCRgXao", "currencyNamespace": "b6RitOKz", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1999-07-13T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1975-07-22T00:00:00Z", "discountedPrice": 30, "expireAt": "1972-06-23T00:00:00Z", "price": 35, "purchaseAt": "1996-04-09T00:00:00Z", "trialPrice": 74}, {"currencyCode": "N9Jl2yIU", "currencyNamespace": "thfgwWve", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1971-07-18T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1998-05-27T00:00:00Z", "discountedPrice": 48, "expireAt": "1980-05-31T00:00:00Z", "price": 33, "purchaseAt": "1987-12-14T00:00:00Z", "trialPrice": 6}], "qMP7iO9d": [{"currencyCode": "2L8Hx0SM", "currencyNamespace": "Kd2sY2wx", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1982-12-16T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1974-07-30T00:00:00Z", "discountedPrice": 78, "expireAt": "1986-12-29T00:00:00Z", "price": 25, "purchaseAt": "1992-07-26T00:00:00Z", "trialPrice": 12}, {"currencyCode": "rbq5sHOf", "currencyNamespace": "v6IcMMon", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1997-09-08T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1997-08-25T00:00:00Z", "discountedPrice": 70, "expireAt": "1972-06-30T00:00:00Z", "price": 68, "purchaseAt": "1979-05-12T00:00:00Z", "trialPrice": 87}, {"currencyCode": "rkxHZ2Fh", "currencyNamespace": "UanvFYYc", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1972-07-17T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1976-06-01T00:00:00Z", "discountedPrice": 39, "expireAt": "1991-12-09T00:00:00Z", "price": 9, "purchaseAt": "1977-06-14T00:00:00Z", "trialPrice": 58}], "99KA7xcS": [{"currencyCode": "DRVIpd1J", "currencyNamespace": "OX5MDyuK", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1994-05-21T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1978-06-01T00:00:00Z", "discountedPrice": 91, "expireAt": "1977-12-09T00:00:00Z", "price": 32, "purchaseAt": "1990-01-13T00:00:00Z", "trialPrice": 57}, {"currencyCode": "iWaKeeVX", "currencyNamespace": "fD2SE9lt", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1987-12-17T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1981-02-07T00:00:00Z", "discountedPrice": 18, "expireAt": "1988-04-29T00:00:00Z", "price": 2, "purchaseAt": "1989-01-15T00:00:00Z", "trialPrice": 41}, {"currencyCode": "uT1fJgGn", "currencyNamespace": "6I5vAQjm", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1995-03-01T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1990-02-14T00:00:00Z", "discountedPrice": 9, "expireAt": "1977-11-08T00:00:00Z", "price": 1, "purchaseAt": "1980-11-17T00:00:00Z", "trialPrice": 94}]}, "seasonType": "TIER", "sku": "YQBVNESj", "stackable": true, "status": "INACTIVE", "tags": ["Y3RKMa8h", "UOIWBgJl", "6XEhmIV0"], "targetCurrencyCode": "sYaxUsr4", "targetNamespace": "Bw6ovo1H", "thumbnailUrl": "lWmRzg2b", "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 75 'CreateItem' test.out

#- 76 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'xIPl60vs' \
    --appId '9n7GnuX2' \
    > test.out 2>&1
eval_tap $? 76 'GetItemByAppId' test.out

#- 77 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'TRuc5UpO' \
    --baseAppId 'r5MVB979' \
    --categoryPath '9OgWnhu0' \
    --features 'B7CxUOra' \
    --itemType 'COINS' \
    --limit '97' \
    --offset '83' \
    --region 'u1D6zHdF' \
    --sortBy 'displayOrder:asc", "updatedAt", "createdAt:desc' \
    --storeId 'jQYVAArj' \
    --tags 'VIdMEyay' \
    --targetNamespace 'xTGODHZh' \
    > test.out 2>&1
eval_tap $? 77 'QueryItems' test.out

#- 78 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'yM3YzMog", "DYz5Eduo", "IhnJZseV' \
    > test.out 2>&1
eval_tap $? 78 'ListBasicItemsByFeatures' test.out

#- 79 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'EmhvwATX' \
    --sku 'FbhWtHZR' \
    > test.out 2>&1
eval_tap $? 79 'GetItemBySku' test.out

#- 80 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'zcgL5ixA' \
    --populateBundle  \
    --region 'ER1FXiz6' \
    --storeId 'Jdfdj2y7' \
    --sku '2jD7B8IH' \
    > test.out 2>&1
eval_tap $? 80 'GetLocaleItemBySku' test.out

#- 81 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nKpyGJAW' \
    --sku 'URed6uXr' \
    > test.out 2>&1
eval_tap $? 81 'GetItemIdBySku' test.out

#- 82 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'FlxEhbzw", "MQxSUqsG", "3cqGayjx' \
    --storeId 'rHhobYLs' \
    > test.out 2>&1
eval_tap $? 82 'GetBulkItemIdBySkus' test.out

#- 83 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'UsObaJCh' \
    --region 'KeZ63Ceg' \
    --storeId 'mjSBTacQ' \
    --itemIds 'SUO7Kz96' \
    > test.out 2>&1
eval_tap $? 83 'BulkGetLocaleItems' test.out

#- 84 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetAvailablePredicateTypes' test.out

#- 85 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'RXadRzLp' \
    --body '{"itemIds": ["Px3zgOe9", "XC3htlRO", "K1f51wX6"]}' \
    > test.out 2>&1
eval_tap $? 85 'ValidateItemPurchaseCondition' test.out

#- 86 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'INGAMEITEM' \
    --limit '93' \
    --offset '26' \
    --storeId '0fSS2DDM' \
    --keyword 'NQnNj48l' \
    --language 'qFFtuIxr' \
    > test.out 2>&1
eval_tap $? 86 'SearchItems' test.out

#- 87 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '23' \
    --offset '25' \
    --sortBy 'name:desc", "displayOrder", "displayOrder' \
    --storeId '9h7HQ7P9' \
    > test.out 2>&1
eval_tap $? 87 'QueryUncategorizedItems' test.out

#- 88 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'WXCjstVk' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'd1QOcDNF' \
    > test.out 2>&1
eval_tap $? 88 'GetItem' test.out

#- 89 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'TIGBleDL' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1nlRhIGv' \
    --body '{"appId": "EJ4QykVW", "appType": "DLC", "baseAppId": "KKYnFi8H", "boothName": "YvIdXKS7", "categoryPath": "jjo3Ivhu", "clazz": "EMfCe92T", "displayOrder": 47, "entitlementType": "DURABLE", "ext": {"yBk6Viuk": {}, "KDTQRH7m": {}, "ldgfqeOe": {}}, "features": ["RnE6BQlH", "KHo4s4PN", "UqKM8UjS"], "images": [{"as": "XwZmKRF8", "caption": "vqPGe3nV", "height": 84, "imageUrl": "JLHNAJWQ", "smallImageUrl": "p9qjaqxE", "width": 69}, {"as": "mFPDtCgB", "caption": "1vYPP49F", "height": 13, "imageUrl": "pUJTdJUg", "smallImageUrl": "G7Kw3yWs", "width": 65}, {"as": "HBvVL0Ad", "caption": "qFGdrH6w", "height": 2, "imageUrl": "QTP0318k", "smallImageUrl": "XTmdc0a4", "width": 91}], "itemIds": ["GxAwYRyB", "PpqaPKJr", "2yC1AZD4"], "itemQty": {"SrCkOlMM": 40, "IWfhnREb": 72, "V3ZVijMT": 55}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"YygIs0sq": {"description": "JsIl5obY", "localExt": {"LkMa8V2I": {}, "SLz9eeEv": {}, "9VeGXib2": {}}, "longDescription": "rbRTgxnH", "title": "41GGyv1u"}, "Hn0zX4tf": {"description": "EhvE9bfz", "localExt": {"NMW8DziM": {}, "yiLXCJ8B": {}, "INKZ6ElF": {}}, "longDescription": "WKTMs91V", "title": "4aL69Sy7"}, "rn0xl6BT": {"description": "EJuMdEGn", "localExt": {"ZG3Xd0Yu": {}, "1scvMxa5": {}, "TjhACoKU": {}}, "longDescription": "CdbTPpt2", "title": "vwk9Z9gb"}}, "maxCount": 27, "maxCountPerUser": 34, "name": "TI22hlFo", "optionBoxConfig": {"boxItems": [{"count": 58, "itemId": "mpMj6iyP", "itemSku": "wGYOecJl"}, {"count": 49, "itemId": "dXXrIIx1", "itemSku": "9TEbJpK2"}, {"count": 12, "itemId": "x6FeR053", "itemSku": "Bkg7dK1e"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 85, "fixedTrialCycles": 72, "graceDays": 21}, "regionData": {"sNhd2ZVU": [{"currencyCode": "6dIXQiL5", "currencyNamespace": "MgU6Lwnc", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1979-09-17T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1975-02-24T00:00:00Z", "discountedPrice": 72, "expireAt": "1996-03-27T00:00:00Z", "price": 24, "purchaseAt": "1999-07-18T00:00:00Z", "trialPrice": 98}, {"currencyCode": "oPWmgQol", "currencyNamespace": "50wrLkvz", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1990-04-06T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1984-12-13T00:00:00Z", "discountedPrice": 45, "expireAt": "1990-06-19T00:00:00Z", "price": 10, "purchaseAt": "1983-04-18T00:00:00Z", "trialPrice": 26}, {"currencyCode": "cRTC8eor", "currencyNamespace": "SrWx2FpK", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1983-12-12T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1973-04-19T00:00:00Z", "discountedPrice": 59, "expireAt": "1994-09-12T00:00:00Z", "price": 33, "purchaseAt": "1981-05-06T00:00:00Z", "trialPrice": 29}], "XaoCBizy": [{"currencyCode": "EAg8xht8", "currencyNamespace": "zo602KXp", "currencyType": "REAL", "discountAmount": 88, "discountExpireAt": "1986-02-15T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1977-07-29T00:00:00Z", "discountedPrice": 58, "expireAt": "1974-03-27T00:00:00Z", "price": 63, "purchaseAt": "1996-12-16T00:00:00Z", "trialPrice": 68}, {"currencyCode": "DC8j0kxO", "currencyNamespace": "I4p3RaAg", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1973-01-23T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1979-10-26T00:00:00Z", "discountedPrice": 58, "expireAt": "1977-06-29T00:00:00Z", "price": 42, "purchaseAt": "1975-02-16T00:00:00Z", "trialPrice": 100}, {"currencyCode": "zG8UoMkt", "currencyNamespace": "j4Ak8IUt", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1986-04-08T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1992-03-12T00:00:00Z", "discountedPrice": 15, "expireAt": "1993-12-16T00:00:00Z", "price": 14, "purchaseAt": "1991-07-08T00:00:00Z", "trialPrice": 83}], "rFuqxJ3W": [{"currencyCode": "bE9Ssgxc", "currencyNamespace": "xuIwZYH8", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1987-11-20T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1972-07-23T00:00:00Z", "discountedPrice": 31, "expireAt": "1997-11-04T00:00:00Z", "price": 30, "purchaseAt": "1986-10-21T00:00:00Z", "trialPrice": 20}, {"currencyCode": "NJfuxoU2", "currencyNamespace": "9jRmVrk8", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1979-07-12T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1982-07-21T00:00:00Z", "discountedPrice": 16, "expireAt": "1977-05-24T00:00:00Z", "price": 1, "purchaseAt": "1995-09-08T00:00:00Z", "trialPrice": 54}, {"currencyCode": "SJnamXqe", "currencyNamespace": "ukPA2doe", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1998-06-22T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1994-07-17T00:00:00Z", "discountedPrice": 86, "expireAt": "1972-03-04T00:00:00Z", "price": 6, "purchaseAt": "1978-08-11T00:00:00Z", "trialPrice": 17}]}, "seasonType": "PASS", "sku": "8ksgI4wn", "stackable": false, "status": "ACTIVE", "tags": ["NstDuxoc", "1lRf12eC", "htSwHiCD"], "targetCurrencyCode": "Y6zz0ksM", "targetNamespace": "kJkBhfB1", "thumbnailUrl": "M1RSKT1b", "useCount": 78}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateItem' test.out

#- 90 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'ACUqeX53' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HBGrOBEx' \
    > test.out 2>&1
eval_tap $? 90 'DeleteItem' test.out

#- 91 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'LPMa1YzL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 13, "orderNo": "BRlmXHr4"}' \
    > test.out 2>&1
eval_tap $? 91 'AcquireItem' test.out

#- 92 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '1AzgPo2n' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'UkOniXNT' \
    > test.out 2>&1
eval_tap $? 92 'GetApp' test.out

#- 93 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'y6tvrvS5' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2xRfLkPj' \
    --body '{"carousel": [{"alt": "g4O4HsDb", "previewUrl": "PwrudNpq", "thumbnailUrl": "wghU6usR", "type": "video", "url": "gIbL1HJ5", "videoSource": "vimeo"}, {"alt": "lGPUzUXq", "previewUrl": "uEp6tIOr", "thumbnailUrl": "CoOrcvNW", "type": "video", "url": "SdO81lnb", "videoSource": "vimeo"}, {"alt": "E3Eo73Fs", "previewUrl": "bKpbg6vO", "thumbnailUrl": "HzBp9V4E", "type": "image", "url": "Wx5KrfXf", "videoSource": "vimeo"}], "developer": "u29hu0XI", "forumUrl": "tbXehBIG", "genres": ["MassivelyMultiplayer", "Racing", "Sports"], "localizations": {"vjXZOKcs": {"announcement": "EDhk5NOG", "slogan": "xg3GMsql"}, "eaGbRBEa": {"announcement": "6ynJnmt0", "slogan": "HY4OSBH3"}, "ccbsFCmj": {"announcement": "iDjwKsID", "slogan": "DBjGGkHj"}}, "platformRequirements": {"QcNtDFaQ": [{"additionals": "jjq20928", "directXVersion": "A6qUyG72", "diskSpace": "E00iyW5m", "graphics": "3x4yeDYc", "label": "UZfojeIO", "osVersion": "PlLFs5jT", "processor": "Oq85X5y7", "ram": "rjbBkHan", "soundCard": "w01FJpes"}, {"additionals": "arsJQPwY", "directXVersion": "2qphKgS2", "diskSpace": "9YcIzEIg", "graphics": "HXDSwieP", "label": "cqjw24WB", "osVersion": "NfbrP4ep", "processor": "TptMig8I", "ram": "MJ4jBKc2", "soundCard": "Vo7qYJ5R"}, {"additionals": "5OmOjfzV", "directXVersion": "51ckNGRD", "diskSpace": "In2HSJgx", "graphics": "6VfDi5Rc", "label": "U7024Q0b", "osVersion": "zjx0U7NE", "processor": "ckP4ZUfi", "ram": "jnnbpTT8", "soundCard": "vae8DecW"}], "I0qOPc32": [{"additionals": "qT8SSDPE", "directXVersion": "9XOVJqpU", "diskSpace": "zXeHKalY", "graphics": "f7BL13w0", "label": "U8GdXJkR", "osVersion": "W6jp0vmU", "processor": "7l4SSiNs", "ram": "FyBQ1w8Y", "soundCard": "pb5jxKhJ"}, {"additionals": "vZt6o1Nm", "directXVersion": "TMF1bC7y", "diskSpace": "eo1cvg1C", "graphics": "RUPVd418", "label": "6fNgcL79", "osVersion": "gtk4xL8B", "processor": "Gp8th4Ul", "ram": "PEKDfzlz", "soundCard": "YAMiwyfJ"}, {"additionals": "xZpbDtnC", "directXVersion": "hzzzTixr", "diskSpace": "uHZezmAa", "graphics": "BSFTRxOr", "label": "Mb9ZENKu", "osVersion": "XMBvCuMi", "processor": "nxNOyjFg", "ram": "5WjjCXZo", "soundCard": "QZ5Wphsa"}], "sav4Q3vA": [{"additionals": "9hOYQ7ny", "directXVersion": "BWDajFcq", "diskSpace": "9hUKXjcb", "graphics": "dVZwxpWT", "label": "I9DTE3oU", "osVersion": "3UyO6C2X", "processor": "VGyqvLEx", "ram": "51LmASBq", "soundCard": "YF2YjqF8"}, {"additionals": "SCtmML5p", "directXVersion": "gOmlRFQs", "diskSpace": "zgXCwoyz", "graphics": "wSLJD1GD", "label": "gwwAjj57", "osVersion": "1GoFhgjX", "processor": "l5bo3lzy", "ram": "Uc2VrfBI", "soundCard": "LvJm3mAh"}, {"additionals": "MYwibTEs", "directXVersion": "fYhQC5zl", "diskSpace": "cBRZuoAz", "graphics": "aUMq4HUx", "label": "RGT01xjR", "osVersion": "Tw8u93Yj", "processor": "QlRKStOn", "ram": "PjPo94Op", "soundCard": "LDtLBTZ0"}]}, "platforms": ["MacOS", "IOS", "Windows"], "players": ["Coop", "Single", "Single"], "primaryGenre": "Adventure", "publisher": "pBA9BtY3", "releaseDate": "1984-07-16T00:00:00Z", "websiteUrl": "aWGr1Byr"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateApp' test.out

#- 94 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'GsYDCRY7' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hCNMRjZ3' \
    > test.out 2>&1
eval_tap $? 94 'DisableItem' test.out

#- 95 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'gynVOQUs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetItemDynamicData' test.out

#- 96 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'MjjD7OvF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VK7kS0bH' \
    > test.out 2>&1
eval_tap $? 96 'EnableItem' test.out

#- 97 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'nBS3pakM' \
    --itemId 'rYJTUe3F' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sBLsS98x' \
    > test.out 2>&1
eval_tap $? 97 'FeatureItem' test.out

#- 98 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'iVFj6nHo' \
    --itemId '02HsNb6S' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6TDq0zmD' \
    > test.out 2>&1
eval_tap $? 98 'DefeatureItem' test.out

#- 99 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'xJI4C78Q' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '0p35KW0W' \
    --populateBundle  \
    --region 'YG3QBQQA' \
    --storeId 'Ng6OG1yG' \
    > test.out 2>&1
eval_tap $? 99 'GetLocaleItem' test.out

#- 100 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'ikWHQBws' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KDIDGNfA' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 31, "comparison": "is", "name": "J3Qh5OnF", "predicateType": "SeasonTierPredicate", "value": "TbfUpxky", "values": ["4agcliJg", "xiQMJKOB", "1bfDj9de"]}, {"anyOf": 88, "comparison": "isGreaterThanOrEqual", "name": "WQ1ryzrr", "predicateType": "SeasonTierPredicate", "value": "161PI9Hy", "values": ["ezjvNZy1", "RR5y7my8", "LqnJ3KSs"]}, {"anyOf": 70, "comparison": "isGreaterThan", "name": "1W1hYNvj", "predicateType": "SeasonPassPredicate", "value": "h1wDioQA", "values": ["WZdZEfAx", "nWnfI1pB", "5873PkoR"]}]}, {"operator": "and", "predicates": [{"anyOf": 65, "comparison": "includes", "name": "AqHbJnuD", "predicateType": "EntitlementPredicate", "value": "R6eIIO2d", "values": ["jaygHChK", "UeslP6zE", "ZU73So7x"]}, {"anyOf": 49, "comparison": "excludes", "name": "qfuhgxVS", "predicateType": "SeasonTierPredicate", "value": "TzJOiDDM", "values": ["6hwz9qL4", "y6184vJO", "xNyDyFTC"]}, {"anyOf": 70, "comparison": "isLessThanOrEqual", "name": "jx8dJr2o", "predicateType": "EntitlementPredicate", "value": "2LVy76AS", "values": ["g3JjQRVE", "uECPs7Se", "ETHTJdFz"]}]}, {"operator": "or", "predicates": [{"anyOf": 52, "comparison": "isLessThan", "name": "qS5IpTLd", "predicateType": "SeasonTierPredicate", "value": "80VueX9K", "values": ["GTxYaeYS", "wGCBQTyy", "rx4hY9NL"]}, {"anyOf": 97, "comparison": "isGreaterThanOrEqual", "name": "2cfv9Iko", "predicateType": "EntitlementPredicate", "value": "C3Codddi", "values": ["UocuiPMY", "Y2eP4DsG", "8KeOkie9"]}, {"anyOf": 95, "comparison": "isGreaterThan", "name": "829qdLyN", "predicateType": "EntitlementPredicate", "value": "OlFcNT3l", "values": ["9pZ5qK1j", "6NyAwqwM", "5SCKU8r5"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItemPurchaseCondition' test.out

#- 101 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'JK1XTYLL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "zdWr4GAK"}' \
    > test.out 2>&1
eval_tap $? 101 'ReturnItem' test.out

#- 102 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --name '6516UdZe' \
    --offset '56' \
    --tag 'ZcUEIIbf' \
    > test.out 2>&1
eval_tap $? 102 'QueryKeyGroups' test.out

#- 103 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "O9JxKgCU", "name": "EieCgh9U", "status": "ACTIVE", "tags": ["McBci9wG", "87aku4cP", "WrZyUWc6"]}' \
    > test.out 2>&1
eval_tap $? 103 'CreateKeyGroup' test.out

#- 104 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '4MRaOdbA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetKeyGroup' test.out

#- 105 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'buulS9ou' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kQC7Oaom", "name": "Ieg64qZg", "status": "ACTIVE", "tags": ["drS9j0Du", "ORIEHc0O", "dxP5mWdK"]}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateKeyGroup' test.out

#- 106 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'aLpmo8zw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetKeyGroupDynamic' test.out

#- 107 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'KgC9epHR' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '35' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 107 'ListKeys' test.out

#- 108 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '4b7QyDyi' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 108 'UploadKeys' test.out

#- 109 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'rN0NXuXF' \
    --limit '63' \
    --offset '74' \
    --orderNos 'ASDLjQGL", "jHOACygI", "9Raw2nku' \
    --sortBy 'pz2rak0T' \
    --startTime 'jBTJra8l' \
    --status 'REFUNDING' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 109 'QueryOrders' test.out

#- 110 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetOrderStatistics' test.out

#- 111 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hPeXr4rH' \
    > test.out 2>&1
eval_tap $? 111 'GetOrder' test.out

#- 112 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AFoG9xhY' \
    --body '{"description": "S35goXxf"}' \
    > test.out 2>&1
eval_tap $? 112 'RefundOrder' test.out

#- 113 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetPaymentCallbackConfig' test.out

#- 114 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "b2Svv4jA", "privateKey": "T0TWIQhd"}' \
    > test.out 2>&1
eval_tap $? 114 'UpdatePaymentCallbackConfig' test.out

#- 115 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '6upO8WSH' \
    --externalId '1USZOLv8' \
    --limit '8' \
    --notificationSource 'PAYPAL' \
    --notificationType 'WhxZYZgm' \
    --offset '80' \
    --paymentOrderNo 'pDo2SX89' \
    --startDate 'ffmOKMxV' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 115 'QueryPaymentNotifications' test.out

#- 116 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'HxLCEiAZ' \
    --limit '83' \
    --offset '13' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 116 'QueryPaymentOrders' test.out

#- 117 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "xCiKyapM", "currencyNamespace": "hKKS5AKI", "customParameters": {"VEsLatQA": {}, "NkmMaROq": {}, "44c70ztv": {}}, "description": "eyek8rrI", "extOrderNo": "qm7Y7WWR", "extUserId": "qBHcOAE8", "itemType": "BUNDLE", "language": "IfFQ_dwOf_Rt", "metadata": {"Nm8mYhTI": "Ylhsw6p5", "7B3gtnw5": "VvyyZgVM", "1qUjgGR7": "3mWJlwZg"}, "notifyUrl": "bAkogxla", "omitNotification": false, "platform": "IHB9h8dx", "price": 76, "recurringPaymentOrderNo": "sw5cUtBE", "region": "xB1Zpw9R", "returnUrl": "QOEHHv8V", "sandbox": false, "sku": "1a1MrJy6", "subscriptionId": "wy5HApsx", "targetNamespace": "lVCHe7Kt", "targetUserId": "O2WG8XOY", "title": "rQ6AZ0z3"}' \
    > test.out 2>&1
eval_tap $? 117 'CreatePaymentOrderByDedicated' test.out

#- 118 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'Iv4yn7DY' \
    > test.out 2>&1
eval_tap $? 118 'ListExtOrderNoByExtTxId' test.out

#- 119 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '98AWPsbr' \
    > test.out 2>&1
eval_tap $? 119 'GetPaymentOrder' test.out

#- 120 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'IJ6dM46f' \
    --body '{"extTxId": "gyDUNMcX", "paymentMethod": "t3TygHE0", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 120 'ChargePaymentOrder' test.out

#- 121 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'puSWLom1' \
    --body '{"description": "sQFM2GN1"}' \
    > test.out 2>&1
eval_tap $? 121 'RefundPaymentOrderByDedicated' test.out

#- 122 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kIrI7hAS' \
    --body '{"amount": 17, "currencyCode": "0E6jUpfv", "notifyType": "CHARGE", "paymentProvider": "ALIPAY", "salesTax": 36, "vat": 9}' \
    > test.out 2>&1
eval_tap $? 122 'SimulatePaymentOrderNotification' test.out

#- 123 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'OQDPscHE' \
    > test.out 2>&1
eval_tap $? 123 'GetPaymentOrderChargeStatus' test.out

#- 124 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 124 'GetPlatformWalletConfig' test.out

#- 125 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedBalanceOrigins": ["Other", "Steam", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 125 'UpdatePlatformWalletConfig' test.out

#- 126 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 126 'ResetPlatformWalletConfig' test.out

#- 127 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "uz28E4kz", "eventTopic": "YlRDo4CN", "maxAwarded": 53, "maxAwardedPerUser": 36, "namespaceExpression": "mJisRoOT", "rewardCode": "3x5cGYvm", "rewardConditions": [{"condition": "qqY0rqZR", "conditionName": "qcGsDSag", "eventName": "BLFoatzH", "rewardItems": [{"duration": 29, "itemId": "2IztNCSk", "quantity": 24}, {"duration": 6, "itemId": "b1U4xA0X", "quantity": 2}, {"duration": 8, "itemId": "Cfvu8MOA", "quantity": 11}]}, {"condition": "3UZeztWS", "conditionName": "ZHFlJfjc", "eventName": "B4WnNV1p", "rewardItems": [{"duration": 67, "itemId": "kq8MClFd", "quantity": 13}, {"duration": 1, "itemId": "Jh4ShFM3", "quantity": 19}, {"duration": 1, "itemId": "Xsa3Ihnn", "quantity": 7}]}, {"condition": "8xpsFSIU", "conditionName": "GCId7k6q", "eventName": "qarIh8Yk", "rewardItems": [{"duration": 1, "itemId": "KvCGlfwA", "quantity": 94}, {"duration": 92, "itemId": "TkYhqwON", "quantity": 35}, {"duration": 14, "itemId": "mvGsqcZC", "quantity": 70}]}], "userIdExpression": "fNvGgv27"}' \
    > test.out 2>&1
eval_tap $? 127 'CreateReward' test.out

#- 128 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Ql3OJLaI' \
    --limit '81' \
    --offset '72' \
    --sortBy 'namespace:desc", "rewardCode", "rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 128 'QueryRewards' test.out

#- 129 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 129 'ExportRewards' test.out

#- 130 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 130 'ImportRewards' test.out

#- 131 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'YnWTpJMt' \
    > test.out 2>&1
eval_tap $? 131 'GetReward' test.out

#- 132 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'CVE9TOyv' \
    --body '{"description": "LbnzZJgb", "eventTopic": "bIZKr66F", "maxAwarded": 40, "maxAwardedPerUser": 56, "namespaceExpression": "5c6uTWl3", "rewardCode": "frBn4A3r", "rewardConditions": [{"condition": "AdgAXYXM", "conditionName": "m1pDAyvK", "eventName": "mGe0NMjR", "rewardItems": [{"duration": 70, "itemId": "6nQYnYek", "quantity": 0}, {"duration": 48, "itemId": "t5KoHHnL", "quantity": 12}, {"duration": 53, "itemId": "zMevEx5B", "quantity": 34}]}, {"condition": "krtvnuGZ", "conditionName": "2AcKlrlJ", "eventName": "q5dHQ8di", "rewardItems": [{"duration": 78, "itemId": "kTzhvDha", "quantity": 2}, {"duration": 16, "itemId": "XQEqH7V0", "quantity": 84}, {"duration": 4, "itemId": "dg2IpFd1", "quantity": 51}]}, {"condition": "5ehTnyvI", "conditionName": "mJLsW3xk", "eventName": "0NOK3CWD", "rewardItems": [{"duration": 34, "itemId": "zWk444mT", "quantity": 41}, {"duration": 68, "itemId": "fz43dmgb", "quantity": 55}, {"duration": 48, "itemId": "8iA2DxUY", "quantity": 66}]}], "userIdExpression": "v4sBBeg4"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateReward' test.out

#- 133 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'EkJgYXoR' \
    > test.out 2>&1
eval_tap $? 133 'DeleteReward' test.out

#- 134 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ppKorWy2' \
    --body '{"payload": {"yY1ikTRN": {}, "cqnGdgez": {}, "T8IPW3ro": {}}}' \
    > test.out 2>&1
eval_tap $? 134 'CheckEventCondition' test.out

#- 135 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'ListStores' test.out

#- 136 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "G2qj2sew", "defaultRegion": "YU3sKoQD", "description": "wVxLr8c5", "supportedLanguages": ["iJUyHHOH", "o4fT6sdi", "umBK4zyA"], "supportedRegions": ["MfGq1M1M", "HOAbncGO", "TITMSet1"], "title": "B4pWWoPW"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateStore' test.out

#- 137 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XY3yfEpY' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 137 'ImportStore' test.out

#- 138 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetPublishedStore' test.out

#- 139 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'DeletePublishedStore' test.out

#- 140 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetPublishedStoreBackup' test.out

#- 141 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'RollbackPublishedStore' test.out

#- 142 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nKKE0ZUE' \
    > test.out 2>&1
eval_tap $? 142 'GetStore' test.out

#- 143 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'to8LthZv' \
    --body '{"defaultLanguage": "lA3eLmlJ", "defaultRegion": "CQwKodEm", "description": "UGpr6IsK", "supportedLanguages": ["SLeSIOT4", "HUR7dJlL", "pnqtBDpn"], "supportedRegions": ["wAZafy8g", "zLVbH0Lr", "IFZ9D9U2"], "title": "FvPnybMG"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateStore' test.out

#- 144 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VCdLp4VF' \
    > test.out 2>&1
eval_tap $? 144 'DeleteStore' test.out

#- 145 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'e2mCcOqZ' \
    --action 'UPDATE' \
    --itemSku 'NWdarLJj' \
    --itemType 'OPTIONBOX' \
    --limit '11' \
    --offset '8' \
    --selected  \
    --sortBy 'updatedAt", "createdAt:desc", "createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd '8ozwBwCs' \
    --updatedAtStart 'WKCI5Oyz' \
    > test.out 2>&1
eval_tap $? 145 'QueryChanges' test.out

#- 146 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '93lY5xYU' \
    > test.out 2>&1
eval_tap $? 146 'PublishAll' test.out

#- 147 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'f2kcUD8W' \
    > test.out 2>&1
eval_tap $? 147 'PublishSelected' test.out

#- 148 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dyTUyxwn' \
    > test.out 2>&1
eval_tap $? 148 'SelectAllRecords' test.out

#- 149 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BkTzJ0fD' \
    --action 'UPDATE' \
    --itemSku 'iuV23mao' \
    --itemType 'MEDIA' \
    --type 'STORE' \
    --updatedAtEnd 'nxZozToq' \
    --updatedAtStart 'NXxegPQ0' \
    > test.out 2>&1
eval_tap $? 149 'GetStatistic' test.out

#- 150 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'z0FLm7Kj' \
    > test.out 2>&1
eval_tap $? 150 'UnselectAllRecords' test.out

#- 151 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'e1ZtRkhU' \
    --namespace "$AB_NAMESPACE" \
    --storeId '987uKsPd' \
    > test.out 2>&1
eval_tap $? 151 'SelectRecord' test.out

#- 152 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'sDEmJQHa' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1TqhcdLN' \
    > test.out 2>&1
eval_tap $? 152 'UnselectRecord' test.out

#- 153 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x2u69usZ' \
    --targetStoreId 'bBMSxWEG' \
    > test.out 2>&1
eval_tap $? 153 'CloneStore' test.out

#- 154 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LzCJyz8T' \
    > test.out 2>&1
eval_tap $? 154 'ExportStore' test.out

#- 155 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'CwmyVpdZ' \
    --limit '8' \
    --offset '67' \
    --sku 'c8f3yngO' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    --userId 'ChS3dyfB' \
    > test.out 2>&1
eval_tap $? 155 'QuerySubscriptions' test.out

#- 156 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QDeUcuet' \
    > test.out 2>&1
eval_tap $? 156 'RecurringChargeSubscription' test.out

#- 157 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'ktQDnONT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetTicketDynamic' test.out

#- 158 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'NJJAPXgo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "PB4ZprgQ"}' \
    > test.out 2>&1
eval_tap $? 158 'DecreaseTicketSale' test.out

#- 159 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'ojfpAzxj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetTicketBoothID' test.out

#- 160 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '3ckbNkCD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 70, "orderNo": "CizucFPa"}' \
    > test.out 2>&1
eval_tap $? 160 'IncreaseTicketSale' test.out

#- 161 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'DaPMWpMQ' \
    --body '{"achievements": [{"id": "UvSdrKJI", "value": 42}, {"id": "h1CbY84G", "value": 41}, {"id": "237dbC43", "value": 26}], "steamUserId": "VLnef5X4"}' \
    > test.out 2>&1
eval_tap $? 161 'UnlockSteamUserAchievement' test.out

#- 162 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'nPFvEapo' \
    --xboxUserId 'xwxjdEDF' \
    > test.out 2>&1
eval_tap $? 162 'GetXblUserAchievements' test.out

#- 163 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'l6MTk011' \
    --body '{"achievements": [{"id": "z7XTe53u", "percentComplete": 38}, {"id": "x4JLeqnP", "percentComplete": 41}, {"id": "vAQ1sT1k", "percentComplete": 40}], "serviceConfigId": "Z5RJfckQ", "titleId": "ZKTV5bDs", "xboxUserId": "2B3XR8Zt"}' \
    > test.out 2>&1
eval_tap $? 163 'UpdateXblUserAchievement' test.out

#- 164 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'nCQd8WRr' \
    > test.out 2>&1
eval_tap $? 164 'AnonymizeCampaign' test.out

#- 165 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '5VTDAezP' \
    > test.out 2>&1
eval_tap $? 165 'AnonymizeEntitlement' test.out

#- 166 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'e4DG7V7K' \
    > test.out 2>&1
eval_tap $? 166 'AnonymizeFulfillment' test.out

#- 167 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dh6VMbQo' \
    > test.out 2>&1
eval_tap $? 167 'AnonymizeIntegration' test.out

#- 168 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '9yDimm1V' \
    > test.out 2>&1
eval_tap $? 168 'AnonymizeOrder' test.out

#- 169 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'AlqCt62O' \
    > test.out 2>&1
eval_tap $? 169 'AnonymizePayment' test.out

#- 170 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'IBpQt6R0' \
    > test.out 2>&1
eval_tap $? 170 'AnonymizeSubscription' test.out

#- 171 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '1IMNgjEL' \
    > test.out 2>&1
eval_tap $? 171 'AnonymizeWallet' test.out

#- 172 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wnq2prlh' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName '8PBZakja' \
    --itemId 'w7ZFumbJ", "7mzzwuSg", "CZrTftFp' \
    --limit '56' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 172 'QueryUserEntitlements' test.out

#- 173 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLpX2u8u' \
    --body '[{"endDate": "1974-03-04T00:00:00Z", "grantedCode": "pdEDZ27R", "itemId": "BYyhgey9", "itemNamespace": "KLIsBdmk", "language": "ITRV_qK", "quantity": 4, "region": "1CkjlAsa", "source": "OTHER", "startDate": "1990-04-20T00:00:00Z", "storeId": "Yso99Biu"}, {"endDate": "1983-09-10T00:00:00Z", "grantedCode": "EU6KAF8Y", "itemId": "aDHMPSC9", "itemNamespace": "yAL6t4MC", "language": "ezM-LAcp-KL", "quantity": 46, "region": "CVyQyq1l", "source": "OTHER", "startDate": "1990-09-26T00:00:00Z", "storeId": "TWAJmyqT"}, {"endDate": "1971-11-19T00:00:00Z", "grantedCode": "570jQI1h", "itemId": "J18gU7g5", "itemNamespace": "TwTJgDxQ", "language": "vo-AW", "quantity": 22, "region": "m0Uzests", "source": "REFERRAL_BONUS", "startDate": "1975-08-27T00:00:00Z", "storeId": "rzHsxSbS"}]' \
    > test.out 2>&1
eval_tap $? 173 'GrantUserEntitlement' test.out

#- 174 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FDbHCUWj' \
    --activeOnly  \
    --appId 'NNezE6jK' \
    > test.out 2>&1
eval_tap $? 174 'GetUserAppEntitlementByAppId' test.out

#- 175 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'BpAqwHND' \
    --activeOnly  \
    --limit '82' \
    --offset '9' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 175 'QueryUserEntitlementsByAppType' test.out

#- 176 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TqftfzGG' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'hDgatobm' \
    > test.out 2>&1
eval_tap $? 176 'GetUserEntitlementByItemId' test.out

#- 177 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '1RNnR749' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku 'VtMWKXs5' \
    > test.out 2>&1
eval_tap $? 177 'GetUserEntitlementBySku' test.out

#- 178 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODqfeBAz' \
    --appIds 'qkezj2Lc", "Y5PsKUpU", "t83zQWj3' \
    --itemIds '7qtqNyno", "9krOjYxi", "Ybsf5u3k' \
    --skus 'cWtc8TYS", "qidLHZZp", "vNiZ1Zh5' \
    > test.out 2>&1
eval_tap $? 178 'ExistsAnyUserActiveEntitlement' test.out

#- 179 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'A7RZxxYv' \
    --itemIds 'X2qWmfan", "CFujR1Yr", "Fzt54LBj' \
    > test.out 2>&1
eval_tap $? 179 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 180 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fEGKlvfV' \
    --appId 'UpuVVq8t' \
    > test.out 2>&1
eval_tap $? 180 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 181 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgSsfq8H' \
    --entitlementClazz 'MEDIA' \
    --itemId 'jYbRqZCu' \
    > test.out 2>&1
eval_tap $? 181 'GetUserEntitlementOwnershipByItemId' test.out

#- 182 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'GvsHFM5a' \
    --ids 'y9Bs0l9E", "vY0sG22g", "CKqjivBZ' \
    > test.out 2>&1
eval_tap $? 182 'GetUserEntitlementOwnershipByItemIds' test.out

#- 183 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'VCauOdL1' \
    --entitlementClazz 'MEDIA' \
    --sku 'yv8p5EOd' \
    > test.out 2>&1
eval_tap $? 183 'GetUserEntitlementOwnershipBySku' test.out

#- 184 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'zxVgMJkI' \
    --entitlementIds 'l9NXtVdM' \
    > test.out 2>&1
eval_tap $? 184 'RevokeUserEntitlements' test.out

#- 185 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'ulX456XG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mSSxbwmi' \
    > test.out 2>&1
eval_tap $? 185 'GetUserEntitlement' test.out

#- 186 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'D043PWt8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EQ1ayptS' \
    --body '{"endDate": "1993-10-13T00:00:00Z", "nullFieldList": ["4dYa7kqx", "EjGTa39b", "pdmgissJ"], "startDate": "1973-03-17T00:00:00Z", "status": "CONSUMED", "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 186 'UpdateUserEntitlement' test.out

#- 187 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'J2Q9H6L3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nZTtmMGo' \
    --body '{"options": ["3oXmwwji", "ZxN0lQVO", "J39NnZUj"], "useCount": 74}' \
    > test.out 2>&1
eval_tap $? 187 'ConsumeUserEntitlement' test.out

#- 188 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'PebVVnjT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KiZIeEsl' \
    > test.out 2>&1
eval_tap $? 188 'DisableUserEntitlement' test.out

#- 189 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 't1hlKWRq' \
    --namespace "$AB_NAMESPACE" \
    --userId '2rGRVNeI' \
    > test.out 2>&1
eval_tap $? 189 'EnableUserEntitlement' test.out

#- 190 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'fylytkC5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PtavUVXp' \
    > test.out 2>&1
eval_tap $? 190 'GetUserEntitlementHistories' test.out

#- 191 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'jSgHFDkx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QOTISEx0' \
    > test.out 2>&1
eval_tap $? 191 'RevokeUserEntitlement' test.out

#- 192 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijbGJqKs' \
    --body '{"duration": 0, "endDate": "1984-03-26T00:00:00Z", "itemId": "zN6QnymK", "itemSku": "Dd2Fhe5p", "language": "x1Fi9I5f", "order": {"currency": {"currencyCode": "kAH3Khxq", "currencySymbol": "HrJrFvvW", "currencyType": "VIRTUAL", "decimals": 15, "namespace": "qXCvGKUt"}, "ext": {"CXWXNgeH": {}, "rNvlSRxd": {}, "noucr6yR": {}}, "free": true}, "orderNo": "hPWmiKwe", "origin": "System", "quantity": 28, "region": "Si4mZile", "source": "GIFT", "startDate": "1997-05-05T00:00:00Z", "storeId": "MZDUVuaz"}' \
    > test.out 2>&1
eval_tap $? 192 'FulfillItem' test.out

#- 193 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '53J0huOq' \
    --body '{"code": "uVVdXCp6", "language": "xh", "region": "9ZjFxyGS"}' \
    > test.out 2>&1
eval_tap $? 193 'RedeemCode' test.out

#- 194 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'xnRoCCnN' \
    --body '{"origin": "Playstation", "rewards": [{"currency": {"currencyCode": "GgbqAZ4j", "namespace": "8OxLOGEv"}, "item": {"itemId": "wmuIzVUX", "itemSku": "186N9SZS", "itemType": "Fl5FG2kK"}, "quantity": 81, "type": "CURRENCY"}, {"currency": {"currencyCode": "dwDcZurU", "namespace": "RJdBNCsz"}, "item": {"itemId": "F6QF3z9W", "itemSku": "rDbSafzX", "itemType": "a6I5adQg"}, "quantity": 52, "type": "ITEM"}, {"currency": {"currencyCode": "TWA3nux1", "namespace": "eGMXyOwC"}, "item": {"itemId": "C5zc9NAJ", "itemSku": "leMfv5SC", "itemType": "nYlEv1SY"}, "quantity": 29, "type": "CURRENCY"}], "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 194 'FulfillRewards' test.out

#- 195 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'LrhtZqUr' \
    --endTime 'Dc5STt9i' \
    --limit '44' \
    --offset '14' \
    --productId 'SfsbZ00W' \
    --startTime 'PJPqSMN5' \
    --status 'VERIFIED' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 195 'QueryUserIAPOrders' test.out

#- 196 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZOdNBZe' \
    > test.out 2>&1
eval_tap $? 196 'QueryAllUserIAPOrders' test.out

#- 197 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cJuo2x84' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "uRXD-ROYN_087", "productId": "MVw1ioM7", "region": "F6etCiGU", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 197 'MockFulfillIAPItem' test.out

#- 198 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'vLDGdNSy' \
    --itemId 'Fd9vejbs' \
    --limit '47' \
    --offset '0' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 198 'QueryUserOrders' test.out

#- 199 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'x2YwckHq' \
    --body '{"currencyCode": "qygPh6iO", "currencyNamespace": "O0beyePJ", "discountedPrice": 83, "ext": {"2max5NSU": {}, "Y3oddT8Y": {}, "mI84NXaV": {}}, "itemId": "6tbzOyMf", "language": "AXbY3BTD", "options": {"skipPriceValidation": true}, "platform": "GooglePlay", "price": 86, "quantity": 59, "region": "2xctN8ms", "returnUrl": "DAQxLjvf", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 199 'AdminCreateUserOrder' test.out

#- 200 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mT0TGYhs' \
    --itemId 'aP5O67Y3' \
    > test.out 2>&1
eval_tap $? 200 'CountOfPurchasedItem' test.out

#- 201 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0171Qd3b' \
    --userId 'pIgLdlCN' \
    > test.out 2>&1
eval_tap $? 201 'GetUserOrder' test.out

#- 202 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ub8Krbq1' \
    --userId 'x3wke4b3' \
    --body '{"status": "DELETED", "statusReason": "fjAORQCs"}' \
    > test.out 2>&1
eval_tap $? 202 'UpdateUserOrderStatus' test.out

#- 203 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SQGBGW9y' \
    --userId 'N97bKtYn' \
    > test.out 2>&1
eval_tap $? 203 'FulfillUserOrder' test.out

#- 204 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PLQnoB5W' \
    --userId 'fBaX2gov' \
    > test.out 2>&1
eval_tap $? 204 'GetUserOrderGrant' test.out

#- 205 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4kR0TwZy' \
    --userId '5jDgAhpr' \
    > test.out 2>&1
eval_tap $? 205 'GetUserOrderHistories' test.out

#- 206 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'a67N7NxI' \
    --userId 'QATw6Ptg' \
    --body '{"additionalData": {"cardSummary": "EkpASBy1"}, "authorisedTime": "1991-03-25T00:00:00Z", "chargebackReversedTime": "1985-10-12T00:00:00Z", "chargebackTime": "1974-02-01T00:00:00Z", "chargedTime": "1973-09-09T00:00:00Z", "createdTime": "1983-09-28T00:00:00Z", "currency": {"currencyCode": "2AW1lSEu", "currencySymbol": "NI1UIsQx", "currencyType": "REAL", "decimals": 15, "namespace": "m54HFLVN"}, "customParameters": {"ZRehvxIa": {}, "oQXaJ9DH": {}, "JXH6TLlM": {}}, "extOrderNo": "co0doo1o", "extTxId": "rV8hnlxD", "extUserId": "gX7fAGuM", "issuedAt": "1980-10-06T00:00:00Z", "metadata": {"HYIGQQnX": "fhimv6Og", "XzaS42OK": "ehAi0Ikg", "168OwaCe": "T9PtGwDU"}, "namespace": "P5S9x7Mz", "nonceStr": "dWrVm12a", "paymentMethod": "4s6bv39x", "paymentMethodFee": 66, "paymentOrderNo": "kviUi88N", "paymentProvider": "WALLET", "paymentProviderFee": 31, "paymentStationUrl": "nImxc8aI", "price": 85, "refundedTime": "1973-11-09T00:00:00Z", "salesTax": 72, "sandbox": false, "sku": "31xf9BSf", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "uhu0nT7A", "subscriptionId": "Ef6RQbPR", "subtotalPrice": 27, "targetNamespace": "3GZYhk4e", "targetUserId": "DqAgRhzJ", "tax": 46, "totalPrice": 82, "totalTax": 11, "txEndTime": "1976-01-03T00:00:00Z", "type": "i50ZlN1U", "userId": "FWlrcmjF", "vat": 50}' \
    > test.out 2>&1
eval_tap $? 206 'ProcessUserOrderNotification' test.out

#- 207 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'n8vFnudD' \
    --userId 'OrmKgPy0' \
    > test.out 2>&1
eval_tap $? 207 'DownloadUserOrderReceipt' test.out

#- 208 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'QG8x6hrI' \
    --body '{"currencyCode": "MNBx0VN3", "currencyNamespace": "2MgP8tDH", "customParameters": {"muT6eb3m": {}, "iLXUoD0q": {}, "2O4O9n4I": {}}, "description": "5RgydnlA", "extOrderNo": "tPNmzDKL", "extUserId": "ea0D1Yxj", "itemType": "APP", "language": "lG", "metadata": {"dPh1HwHO": "0cgoUbvs", "lXawpm39": "WhZteuC5", "yVLGGdHV": "dvxNDJFC"}, "notifyUrl": "nsCX0VCw", "omitNotification": false, "platform": "3CyfUyAX", "price": 15, "recurringPaymentOrderNo": "6g9JW6Vo", "region": "msjfqIb7", "returnUrl": "ITrY8m5R", "sandbox": true, "sku": "4w1FyPtp", "subscriptionId": "CzML2x5J", "title": "NcjG7Kk9"}' \
    > test.out 2>&1
eval_tap $? 208 'CreateUserPaymentOrder' test.out

#- 209 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3ZJpfQWo' \
    --userId '3x302ASx' \
    --body '{"description": "M13MThk7"}' \
    > test.out 2>&1
eval_tap $? 209 'RefundUserPaymentOrder' test.out

#- 210 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '6zwE9ChV' \
    --body '{"code": "62it5o35", "orderNo": "zZWMRS4d"}' \
    > test.out 2>&1
eval_tap $? 210 'ApplyUserRedemption' test.out

#- 211 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'VrLO8w37' \
    --chargeStatus 'CHARGED' \
    --itemId 'RwfRyzYj' \
    --limit '97' \
    --offset '58' \
    --sku 'aVEHJxYg' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 211 'QueryUserSubscriptions' test.out

#- 212 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'hLj8py2v' \
    --excludeSystem  \
    --limit '47' \
    --offset '65' \
    --subscriptionId 'OKnUQPE1' \
    > test.out 2>&1
eval_tap $? 212 'GetUserSubscriptionActivities' test.out

#- 213 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'AUcgmxSr' \
    --body '{"grantDays": 54, "itemId": "yu4DoXlp", "language": "z62Tlrix", "reason": "EIHJUKBR", "region": "gjOUdVIA", "source": "DpczL2Sd"}' \
    > test.out 2>&1
eval_tap $? 213 'PlatformSubscribeSubscription' test.out

#- 214 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qZnc1eqN' \
    --itemId 'KUeyyyFS' \
    > test.out 2>&1
eval_tap $? 214 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 215 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kwdIAb0u' \
    --userId 'ED2So39o' \
    > test.out 2>&1
eval_tap $? 215 'GetUserSubscription' test.out

#- 216 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7GBbipW5' \
    --userId '7Y0NkyMd' \
    > test.out 2>&1
eval_tap $? 216 'DeleteUserSubscription' test.out

#- 217 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vQfMBzi6' \
    --userId 'AoxjNYOk' \
    --force  \
    --body '{"immediate": true, "reason": "rafHuIor"}' \
    > test.out 2>&1
eval_tap $? 217 'CancelSubscription' test.out

#- 218 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iTu8SIrV' \
    --userId 'sTGnhPF0' \
    --body '{"grantDays": 64, "reason": "YohXGBOy"}' \
    > test.out 2>&1
eval_tap $? 218 'GrantDaysToSubscription' test.out

#- 219 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TAn1hAxG' \
    --userId 'JSXII4f1' \
    --excludeFree  \
    --limit '54' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 219 'GetUserSubscriptionBillingHistories' test.out

#- 220 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BDzy2Q7a' \
    --userId '9ixzGiY5' \
    --body '{"additionalData": {"cardSummary": "62EXgFGL"}, "authorisedTime": "1984-08-08T00:00:00Z", "chargebackReversedTime": "1994-01-20T00:00:00Z", "chargebackTime": "1987-09-01T00:00:00Z", "chargedTime": "1998-08-25T00:00:00Z", "createdTime": "1992-10-19T00:00:00Z", "currency": {"currencyCode": "U1MCuY2Z", "currencySymbol": "N1ShtX51", "currencyType": "VIRTUAL", "decimals": 56, "namespace": "dXiXoSuf"}, "customParameters": {"IorQOhW8": {}, "4YR9wGzs": {}, "TXDKcAOz": {}}, "extOrderNo": "oXCXjMVM", "extTxId": "hWReyXYk", "extUserId": "BMeSsDDR", "issuedAt": "1986-11-28T00:00:00Z", "metadata": {"0GPZ9QMV": "owkrNAbp", "Tw2Y7JTK": "buMCnr2F", "kr5Vf01p": "bemyDBep"}, "namespace": "mGQFlDyW", "nonceStr": "dJLVAtQG", "paymentMethod": "qrafgJgH", "paymentMethodFee": 47, "paymentOrderNo": "e6fqfBxk", "paymentProvider": "ALIPAY", "paymentProviderFee": 65, "paymentStationUrl": "l3DSUvea", "price": 54, "refundedTime": "1985-01-11T00:00:00Z", "salesTax": 35, "sandbox": true, "sku": "MHfzBc4e", "status": "INIT", "statusReason": "wFO0AURY", "subscriptionId": "c4HrPIns", "subtotalPrice": 26, "targetNamespace": "LU32dCgE", "targetUserId": "lWf6PNxQ", "tax": 74, "totalPrice": 66, "totalTax": 8, "txEndTime": "1988-12-16T00:00:00Z", "type": "tJ40apTq", "userId": "kwR8YhgM", "vat": 28}' \
    > test.out 2>&1
eval_tap $? 220 'ProcessUserSubscriptionNotification' test.out

#- 221 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '73ufqYkI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nbt6ivHe' \
    --body '{"count": 29, "orderNo": "H1U3x35E"}' \
    > test.out 2>&1
eval_tap $? 221 'AcquireUserTicket' test.out

#- 222 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'a3zNEjhV' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserCurrencyWallets' test.out

#- 223 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Hl1nVSBg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eUfkjwy8' \
    --limit '42' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 223 'ListUserCurrencyTransactions' test.out

#- 224 CheckWallet
eval_tap 0 224 'CheckWallet # SKIP deprecated' test.out

#- 225 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'gFJrg8Bf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'msxExzlS' \
    --body '{"amount": 22, "expireAt": "1999-05-24T00:00:00Z", "origin": "Epic", "reason": "zr1OMikv", "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 225 'CreditUserWallet' test.out

#- 226 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 't9DiICGa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WpFJksTZ' \
    --body '{"amount": 93, "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 226 'PayWithUserWallet' test.out

#- 227 GetUserWallet
eval_tap 0 227 'GetUserWallet # SKIP deprecated' test.out

#- 228 DebitUserWallet
eval_tap 0 228 'DebitUserWallet # SKIP deprecated' test.out

#- 229 DisableUserWallet
eval_tap 0 229 'DisableUserWallet # SKIP deprecated' test.out

#- 230 EnableUserWallet
eval_tap 0 230 'EnableUserWallet # SKIP deprecated' test.out

#- 231 ListUserWalletTransactions
eval_tap 0 231 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 232 QueryWallets
eval_tap 0 232 'QueryWallets # SKIP deprecated' test.out

#- 233 GetWallet
eval_tap 0 233 'GetWallet # SKIP deprecated' test.out

#- 234 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'f2WChWmg' \
    --end 'P1dFVrse' \
    --start 'DLOBY28x' \
    > test.out 2>&1
eval_tap $? 234 'SyncOrders' test.out

#- 235 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["XIpwFCue", "VgVvL34x", "9spMVwN2"], "apiKey": "wnArASFp", "authoriseAsCapture": true, "blockedPaymentMethods": ["hOb4Tbfa", "9EuJUMQ5", "OPehDxdC"], "clientKey": "KonRnTia", "dropInSettings": "XQDZZsIH", "liveEndpointUrlPrefix": "FbcD2OPT", "merchantAccount": "8FOxBA8J", "notificationHmacKey": "Ytqs22ee", "notificationPassword": "SCDgQWm6", "notificationUsername": "HfxZfQjr", "returnUrl": "i5lept4L", "settings": "9CmTBLIj"}' \
    > test.out 2>&1
eval_tap $? 235 'TestAdyenConfig' test.out

#- 236 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "xlBpHyi2", "privateKey": "j650cHHq", "publicKey": "6NMsdDJV", "returnUrl": "sPN7XD5E"}' \
    > test.out 2>&1
eval_tap $? 236 'TestAliPayConfig' test.out

#- 237 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "QPBGL4Yd", "secretKey": "8EPQO17y"}' \
    > test.out 2>&1
eval_tap $? 237 'TestCheckoutConfig' test.out

#- 238 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '3vBgKjly' \
    > test.out 2>&1
eval_tap $? 238 'DebugMatchedPaymentMerchantConfig' test.out

#- 239 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "jK7dqnoP", "clientSecret": "8ZreoMjA", "returnUrl": "bvFZBn2S", "webHookId": "jnEZTWu1"}' \
    > test.out 2>&1
eval_tap $? 239 'TestPayPalConfig' test.out

#- 240 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["42EMeZdV", "VW2P432P", "B6nKh5U2"], "publishableKey": "B8ztvqqK", "secretKey": "bLs7XLct", "webhookSecret": "WRBzi4jS"}' \
    > test.out 2>&1
eval_tap $? 240 'TestStripeConfig' test.out

#- 241 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "it9luxjk", "key": "D6RJ7Mjz", "mchid": "sfezXsqn", "returnUrl": "PSPisJWH"}' \
    > test.out 2>&1
eval_tap $? 241 'TestWxPayConfig' test.out

#- 242 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "tuagJFjm", "flowCompletionUrl": "H0Djj05c", "merchantId": 53, "projectId": 19, "projectSecretKey": "KYUOJe0Z"}' \
    > test.out 2>&1
eval_tap $? 242 'TestXsollaConfig' test.out

#- 243 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '2wGnmtre' \
    > test.out 2>&1
eval_tap $? 243 'GetPaymentMerchantConfig' test.out

#- 244 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'xib2Udmu' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["yK4P8gdy", "SXairQbu", "dStUjfDs"], "apiKey": "nSPReUwU", "authoriseAsCapture": false, "blockedPaymentMethods": ["bllrbPc0", "PE6grLNr", "8n7dcvZt"], "clientKey": "c5DLpReB", "dropInSettings": "M1d3ablk", "liveEndpointUrlPrefix": "9UhvWHBp", "merchantAccount": "CG4ZtuNv", "notificationHmacKey": "m2ths5Pa", "notificationPassword": "msL74TVY", "notificationUsername": "N55cSQnJ", "returnUrl": "bISlvDaJ", "settings": "ZmLs4t8m"}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateAdyenConfig' test.out

#- 245 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'LeHSUlhf' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 245 'TestAdyenConfigById' test.out

#- 246 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '4uMIEoQ9' \
    --sandbox  \
    --validate  \
    --body '{"appId": "KwS048A7", "privateKey": "gaRnrN69", "publicKey": "DiC0LQIQ", "returnUrl": "ejYBRwj9"}' \
    > test.out 2>&1
eval_tap $? 246 'UpdateAliPayConfig' test.out

#- 247 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'hPtJz34g' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 247 'TestAliPayConfigById' test.out

#- 248 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'mMUUq3Ng' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "vXjxUKXO", "secretKey": "Dyb6kh1w"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateCheckoutConfig' test.out

#- 249 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'UsrwMb5j' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 249 'TestCheckoutConfigById' test.out

#- 250 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'xFsVoUOc' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "DNToTWrT", "clientSecret": "yfFyYuAM", "returnUrl": "QCElqwZw", "webHookId": "az0O5GVl"}' \
    > test.out 2>&1
eval_tap $? 250 'UpdatePayPalConfig' test.out

#- 251 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'DRXUuBvQ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 251 'TestPayPalConfigById' test.out

#- 252 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'yXbsG79X' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["K0p33nGf", "xHzwIICr", "uyw7N4Nb"], "publishableKey": "zZ6YWMvE", "secretKey": "093Zkbu0", "webhookSecret": "9pMbjzUa"}' \
    > test.out 2>&1
eval_tap $? 252 'UpdateStripeConfig' test.out

#- 253 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'Ktk42t3y' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 253 'TestStripeConfigById' test.out

#- 254 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '0jNPQsKg' \
    --validate  \
    --body '{"appId": "d6dpyhMC", "key": "Xfhm5d6y", "mchid": "TxDIFSWI", "returnUrl": "XeBCklZR"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateWxPayConfig' test.out

#- 255 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'xqZd5gDY' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 255 'UpdateWxPayConfigCert' test.out

#- 256 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'XfTCOYL7' \
    > test.out 2>&1
eval_tap $? 256 'TestWxPayConfigById' test.out

#- 257 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'gOdXnGAM' \
    --validate  \
    --body '{"apiKey": "UUkxTSbY", "flowCompletionUrl": "9rbIEAIY", "merchantId": 59, "projectId": 15, "projectSecretKey": "7tFD8CB3"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateXsollaConfig' test.out

#- 258 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'azyX1Pk6' \
    > test.out 2>&1
eval_tap $? 258 'TestXsollaConfigById' test.out

#- 259 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'ntIcxIdK' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateXsollaUIConfig' test.out

#- 260 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '19' \
    --namespace "$AB_NAMESPACE" \
    --offset '5' \
    --region 'ZkcBOogP' \
    > test.out 2>&1
eval_tap $? 260 'QueryPaymentProviderConfig' test.out

#- 261 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "G1uQ201z", "region": "AP4bizPy", "sandboxTaxJarApiToken": "E91TmEMf", "specials": ["ADYEN", "STRIPE", "CHECKOUT"], "taxJarApiToken": "cvpREPif", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 261 'CreatePaymentProviderConfig' test.out

#- 262 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 262 'GetAggregatePaymentProviders' test.out

#- 263 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'G6EfsQ9W' \
    > test.out 2>&1
eval_tap $? 263 'DebugMatchedPaymentProviderConfig' test.out

#- 264 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 264 'GetSpecialPaymentProviders' test.out

#- 265 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'xXIiyUyV' \
    --body '{"aggregate": "XSOLLA", "namespace": "S7FTv4p4", "region": "OMygGdSY", "sandboxTaxJarApiToken": "YNXXlIDR", "specials": ["CHECKOUT", "PAYPAL", "WXPAY"], "taxJarApiToken": "4TP77sA3", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 265 'UpdatePaymentProviderConfig' test.out

#- 266 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'YOtBvcb6' \
    > test.out 2>&1
eval_tap $? 266 'DeletePaymentProviderConfig' test.out

#- 267 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 267 'GetPaymentTaxConfig' test.out

#- 268 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "JOsQReau", "taxJarApiToken": "2DYJyiue", "taxJarEnabled": false, "taxJarProductCodesMapping": {"n0ujeoep": "5g7MVfqP", "oZZizudD": "BYIvsx9d", "0RML5kZ9": "ZXFs2zSt"}}' \
    > test.out 2>&1
eval_tap $? 268 'UpdatePaymentTaxConfig' test.out

#- 269 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'AJcKngUh' \
    --end 'MRdLuHIK' \
    --start '3s0YNeBj' \
    > test.out 2>&1
eval_tap $? 269 'SyncPaymentOrders' test.out

#- 270 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '42SAe2Ox' \
    --storeId 'ccwsUNXG' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRootCategories' test.out

#- 271 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'YS6aezrz' \
    --storeId '4ohb8gKh' \
    > test.out 2>&1
eval_tap $? 271 'DownloadCategories' test.out

#- 272 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'FnqeR1Cj' \
    --namespace "$AB_NAMESPACE" \
    --language 'AHHX3Cg6' \
    --storeId 'BPea9QaG' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetCategory' test.out

#- 273 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'hPb6RQ33' \
    --namespace "$AB_NAMESPACE" \
    --language 'pm2qvPIh' \
    --storeId '8yt0B9iO' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetChildCategories' test.out

#- 274 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'qctCVjg0' \
    --namespace "$AB_NAMESPACE" \
    --language 'rbMJZXqW' \
    --storeId 'v9kBH8Pp' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetDescendantCategories' test.out

#- 275 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 275 'PublicListCurrencies' test.out

#- 276 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'hN1c9D6y' \
    --region 'khhFFuul' \
    --storeId 'u2kJmjW4' \
    --appId 'jPgRUsnh' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetItemByAppId' test.out

#- 277 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --baseAppId 'pXIFn3yK' \
    --categoryPath 'Yqq23yht' \
    --features 'wFogjbuS' \
    --itemType 'INGAMEITEM' \
    --language '4Pu5dVNa' \
    --limit '14' \
    --offset '42' \
    --region '1Rt8jN0V' \
    --sortBy 'createdAt:asc", "displayOrder", "name:desc' \
    --storeId 'Z6UXFb6A' \
    --tags 'cVseAciY' \
    > test.out 2>&1
eval_tap $? 277 'PublicQueryItems' test.out

#- 278 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'oBGWb2D1' \
    --region 'bHwo6hMU' \
    --storeId 'I24HMii6' \
    --sku 'vAYdLf4w' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetItemBySku' test.out

#- 279 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'MirK6hEr' \
    --region 'g9ynJl6z' \
    --storeId '1sVQgX1P' \
    --itemIds 'fEUbuKn4' \
    > test.out 2>&1
eval_tap $? 279 'PublicBulkGetItems' test.out

#- 280 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["7Pt5rdm4", "Vf2lHdxs", "nOQGW9Cl"]}' \
    > test.out 2>&1
eval_tap $? 280 'PublicValidateItemPurchaseCondition' test.out

#- 281 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'INGAMEITEM' \
    --limit '34' \
    --offset '78' \
    --region 'ExPVDyO3' \
    --storeId 'wvqoCfI0' \
    --keyword '3JNBgJze' \
    --language 'eRySJ2Kh' \
    > test.out 2>&1
eval_tap $? 281 'PublicSearchItems' test.out

#- 282 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'quVaSoWe' \
    --namespace "$AB_NAMESPACE" \
    --language 'VcbsM3cu' \
    --region 'gMgIL1wp' \
    --storeId 'N71IDMc4' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetApp' test.out

#- 283 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'HcRz0cSM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'PublicGetItemDynamicData' test.out

#- 284 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'nIBzagIH' \
    --namespace "$AB_NAMESPACE" \
    --language 'xckg3X7W' \
    --populateBundle  \
    --region 'dpRf3deX' \
    --storeId 'Gdh1lpAc' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetItem' test.out

#- 285 GetPaymentCustomization
eval_tap 0 285 'GetPaymentCustomization # SKIP deprecated' test.out

#- 286 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "tTEz9E9K", "paymentProvider": "XSOLLA", "returnUrl": "21po6FDK", "ui": "g5nYVqIO", "zipCode": "wx9B6Z9A"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetPaymentUrl' test.out

#- 287 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2l3SoKM1' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetPaymentMethods' test.out

#- 288 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'YxIEblfd' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUnpaidPaymentOrder' test.out

#- 289 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'c0cp4rs2' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'jPTHYiHy' \
    --body '{"token": "7duGiEoo"}' \
    > test.out 2>&1
eval_tap $? 289 'Pay' test.out

#- 290 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '40s6Skql' \
    > test.out 2>&1
eval_tap $? 290 'PublicCheckPaymentOrderPaidStatus' test.out

#- 291 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'Z6c3F2lD' \
    > test.out 2>&1
eval_tap $? 291 'GetPaymentPublicConfig' test.out

#- 292 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'qkZWex9C' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetQRCode' test.out

#- 293 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'AjEN3UiS' \
    --foreinginvoice 'mBvjHtTk' \
    --invoiceId 'OMDWJkRt' \
    --payload 'AawOBphO' \
    --redirectResult 'qY8WWT1P' \
    --resultCode '87Zmj0fS' \
    --sessionId 'As2WSBXV' \
    --status 'Xytdkswn' \
    --token 'D8Kcwt64' \
    --type 'rMYnznhL' \
    --userId 'lEun4vhj' \
    --orderNo 'giUA5dHl' \
    --paymentOrderNo 'gylyL6dV' \
    --paymentProvider 'STRIPE' \
    --returnUrl 'EorzI420' \
    > test.out 2>&1
eval_tap $? 293 'PublicNormalizePaymentReturnUrl' test.out

#- 294 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '8sKG09nQ' \
    --paymentOrderNo 'ybguJht5' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 294 'GetPaymentTaxValue' test.out

#- 295 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'bQllY4Sq' \
    > test.out 2>&1
eval_tap $? 295 'GetRewardByCode' test.out

#- 296 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'wWGwurmq' \
    --limit '1' \
    --offset '96' \
    --sortBy 'namespace:desc", "rewardCode:asc", "namespace:asc' \
    > test.out 2>&1
eval_tap $? 296 'QueryRewards1' test.out

#- 297 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yHleSu6T' \
    > test.out 2>&1
eval_tap $? 297 'GetReward1' test.out

#- 298 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 298 'PublicListStores' test.out

#- 299 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'ndZXYQsZ", "XO7lW3mw", "KBXHJBjA' \
    --itemIds 'Uhds1Vtl", "At5aYsjC", "ujvjKcrt' \
    --skus '9h0wO3uM", "ANwvdjAu", "QbGOTt7j' \
    > test.out 2>&1
eval_tap $? 299 'PublicExistsAnyMyActiveEntitlement' test.out

#- 300 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '04g9whBu' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 301 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'ZAtSLpr2' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 302 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'evrbqTLJ' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 303 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'jRRGDGWD", "jY3L7GWt", "V6HJLnzp' \
    --itemIds '2MCgaUlT", "E7GizW4W", "wiFwyw0J' \
    --skus 'o8CtPD4J", "ui5MNk5R", "J4AIIk82' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetEntitlementOwnershipToken' test.out

#- 304 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'fKMN508o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'PublicGetMyWallet' test.out

#- 305 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'SoGK4V20' \
    --body '{"epicGamesJwtToken": "wVd1CMUK"}' \
    > test.out 2>&1
eval_tap $? 305 'SyncEpicGameDLC' test.out

#- 306 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqSpPK6G' \
    --body '{"serviceLabel": 79}' \
    > test.out 2>&1
eval_tap $? 306 'PublicSyncPsnDlcInventory' test.out

#- 307 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '4iB5tSDl' \
    --body '{"appId": "iroCKNfE", "steamId": "shWszD5i"}' \
    > test.out 2>&1
eval_tap $? 307 'SyncSteamDLC' test.out

#- 308 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'MiMG65jF' \
    --body '{"xstsToken": "KWN4KFrl"}' \
    > test.out 2>&1
eval_tap $? 308 'SyncXboxDLC' test.out

#- 309 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'onssDhq0' \
    --appType 'DEMO' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'hdYnxrbc' \
    --itemId 'xVhaXwX4", "7vq0V7bj", "uALUgMHT' \
    --limit '30' \
    --offset '82' \
    > test.out 2>&1
eval_tap $? 309 'PublicQueryUserEntitlements' test.out

#- 310 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IweOekzd' \
    --appId 'nEX7gWeX' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserAppEntitlementByAppId' test.out

#- 311 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 't71vppXK' \
    --limit '30' \
    --offset '60' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 311 'PublicQueryUserEntitlementsByAppType' test.out

#- 312 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'az4LTPps' \
    --entitlementClazz 'APP' \
    --itemId '5wbl9d14' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserEntitlementByItemId' test.out

#- 313 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gP28771m' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'dOfMCw0M' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserEntitlementBySku' test.out

#- 314 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BAfiLujX' \
    --appIds 'HcEWw3Mp", "eWq1tmQ8", "10Y0K4rA' \
    --itemIds '4lsk6cdM", "AuicnGBb", "DEG8pcPU' \
    --skus 'BtZ5H4UQ", "hrz2CBNV", "MFamg2Fg' \
    > test.out 2>&1
eval_tap $? 314 'PublicExistsAnyUserActiveEntitlement' test.out

#- 315 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUG09s0r' \
    --appId 'bDz7dwpo' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 316 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MGCKXRpl' \
    --entitlementClazz 'MEDIA' \
    --itemId 'ffOqZDQQ' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 317 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '7C1OqPjo' \
    --ids 'qw5UwBKb", "HTXjr6kG", "TwFuK6qk' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 318 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'vVIJoGwP' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '8cZl69lA' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 319 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'aTrQDL5Y' \
    --namespace "$AB_NAMESPACE" \
    --userId '2u4XVHxC' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserEntitlement' test.out

#- 320 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'AF1clhsp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GK5QoO1D' \
    --body '{"options": ["GjMxbfRR", "XHqjuvzx", "2wvE2R1S"], "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 320 'PublicConsumeUserEntitlement' test.out

#- 321 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'c4eKV1xZ' \
    --body '{"code": "FcUXEsQ0", "language": "Mg_pBkV-500", "region": "IEVd23x1"}' \
    > test.out 2>&1
eval_tap $? 321 'PublicRedeemCode' test.out

#- 322 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'c2OPS9je' \
    --body '{"excludeOldTransactions": false, "language": "AbXB_hw", "productId": "PC0hLv0O", "receiptData": "4vfEHhNu", "region": "YT9NGd9Q", "transactionId": "8vuEK7h7"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicFulfillAppleIAPItem' test.out

#- 323 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FfKYHWCy' \
    --body '{"epicGamesJwtToken": "t5jqXK3g"}' \
    > test.out 2>&1
eval_tap $? 323 'SyncEpicGamesInventory' test.out

#- 324 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rpgZQIkf' \
    --body '{"autoAck": true, "language": "LkW-oAxg_524", "orderId": "2bwahfuz", "packageName": "mczoshQe", "productId": "jPpZukus", "purchaseTime": 12, "purchaseToken": "aztE2LOX", "region": "6RvsOwBq"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicFulfillGoogleIAPItem' test.out

#- 325 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'r9AeKLzh' \
    --body '{"currencyCode": "Tb8VXE5o", "price": 0.78990375810057, "productId": "rw5CNYYA", "serviceLabel": 87}' \
    > test.out 2>&1
eval_tap $? 325 'PublicReconcilePlayStationStore' test.out

#- 326 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lZKO6ytv' \
    --body '{"appId": "c9WZGiha", "language": "CxIj_685", "region": "2J4F4ikB", "stadiaPlayerId": "0csOFWNN"}' \
    > test.out 2>&1
eval_tap $? 326 'SyncStadiaEntitlement' test.out

#- 327 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'X3uIDmTm' \
    --body '{"appId": "WHWMaq4Q", "currencyCode": "A9hgSt0g", "language": "ob_uCJm-He", "price": 0.7605580964638609, "productId": "t1HG0yH4", "region": "tPIEUKU7", "steamId": "Yp36nQmQ"}' \
    > test.out 2>&1
eval_tap $? 327 'SyncSteamInventory' test.out

#- 328 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oo5mkbDc' \
    --body '{"gameId": "2L3Ry0QM", "language": "Yrf", "region": "UpZZXend"}' \
    > test.out 2>&1
eval_tap $? 328 'SyncTwitchDropsEntitlement' test.out

#- 329 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cm88rREd' \
    --body '{"currencyCode": "QCfKNj9P", "price": 0.3194966172857274, "productId": "Vd0irVlG", "xstsToken": "rdzA52bl"}' \
    > test.out 2>&1
eval_tap $? 329 'SyncXboxInventory' test.out

#- 330 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'kI4ReX9D' \
    --itemId 'FHKrq4Mi' \
    --limit '82' \
    --offset '97' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 330 'PublicQueryUserOrders' test.out

#- 331 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'gt3JcOmj' \
    --body '{"currencyCode": "V6zHUwCp", "discountedPrice": 40, "ext": {"uZ9zkma7": {}, "qCdgflmV": {}, "QtMI5HE0": {}}, "itemId": "3YnIovMH", "language": "KYj-sDTN", "price": 23, "quantity": 11, "region": "zYZ7wVxP", "returnUrl": "okD7OeJT"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicCreateUserOrder' test.out

#- 332 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UZDTTZLa' \
    --userId '0oCwLUQJ' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetUserOrder' test.out

#- 333 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VLF2NpaG' \
    --userId 'OmfC65Yb' \
    > test.out 2>&1
eval_tap $? 333 'PublicCancelUserOrder' test.out

#- 334 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3kqGCD9w' \
    --userId 'KdBI6p3R' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetUserOrderHistories' test.out

#- 335 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DxZ0rmxB' \
    --userId '3CYIbdzx' \
    > test.out 2>&1
eval_tap $? 335 'PublicDownloadUserOrderReceipt' test.out

#- 336 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'YSmktvt0' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetPaymentAccounts' test.out

#- 337 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'zjT0Nlv4' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'y0KL8Vdy' \
    > test.out 2>&1
eval_tap $? 337 'PublicDeletePaymentAccount' test.out

#- 338 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pmrfbbez' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'rZ52FY07' \
    --limit '83' \
    --offset '51' \
    --sku 'Z5jnEnxg' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 338 'PublicQueryUserSubscriptions' test.out

#- 339 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'n9arvXZB' \
    --body '{"currencyCode": "lTzfgUic", "itemId": "05mVMck2", "language": "cUNa-co", "region": "Ak9QBpzi", "returnUrl": "TLlrEjSk", "source": "PS9EBtZo"}' \
    > test.out 2>&1
eval_tap $? 339 'PublicSubscribeSubscription' test.out

#- 340 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SnQZKO3m' \
    --itemId 'IZRA8tPa' \
    > test.out 2>&1
eval_tap $? 340 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 341 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1fgPFQUe' \
    --userId 'qQxBNli8' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserSubscription' test.out

#- 342 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BAfbk2dN' \
    --userId 'JPLtnn2S' \
    > test.out 2>&1
eval_tap $? 342 'PublicChangeSubscriptionBillingAccount' test.out

#- 343 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ygSFf5fS' \
    --userId 'bGZ3x2vm' \
    --body '{"immediate": true, "reason": "RZiHgzbo"}' \
    > test.out 2>&1
eval_tap $? 343 'PublicCancelSubscription' test.out

#- 344 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'SvzPl63p' \
    --userId 'amYKXrSB' \
    --excludeFree  \
    --limit '50' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserSubscriptionBillingHistories' test.out

#- 345 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'M1WN0MHn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWf8PCHB' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetWallet' test.out

#- 346 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'WNzdu0h0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWUUKjQE' \
    --limit '4' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 346 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE