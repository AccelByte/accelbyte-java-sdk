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
echo "1..356"

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
    --body '{"context": {"item": {"appId": "JNqTJTiL", "appType": "SOFTWARE", "baseAppId": "iCD7nxYQ", "boothName": "TUfCsQMZ", "boundItemIds": ["F0bItRRo", "9HlBREAQ", "OlOJhkrN"], "categoryPath": "P9RzwhuN", "clazz": "lGizve3Z", "createdAt": "1986-04-30T00:00:00Z", "description": "MYK0JFhj", "displayOrder": 9, "entitlementType": "DURABLE", "ext": {"s7kiYQLn": {}, "lYEMq4i4": {}, "JfRNtgnX": {}}, "features": ["NbrbaoT1", "SlpuMOkw", "pkbkD7sC"], "fresh": false, "images": [{"as": "J73g5g4Q", "caption": "27x6i8bL", "height": 54, "imageUrl": "OEM2N6h4", "smallImageUrl": "0X4KGpW3", "width": 84}, {"as": "f7KDkCUO", "caption": "zO6cuzow", "height": 42, "imageUrl": "Y3mj86Yk", "smallImageUrl": "uKeZ2dP1", "width": 91}, {"as": "CCPNDqgq", "caption": "g7fSRzx2", "height": 56, "imageUrl": "6lHHI1hS", "smallImageUrl": "zlqaFZE5", "width": 54}], "itemId": "O3HtXHcc", "itemIds": ["TTmvP98G", "ZcOnPSeQ", "xVNM3ZaA"], "itemQty": {"dEndcM5m": 80, "yxIK7kG9": 98, "RtRMzR0X": 82}, "itemType": "COINS", "language": "8sPR5OYI", "listable": true, "localExt": {"b4uiW7WB": {}, "ua4pvZyI": {}, "hqnWIc1z": {}}, "longDescription": "41wr24Xa", "maxCount": 64, "maxCountPerUser": 72, "name": "J7761Vr9", "namespace": "U3AqfwJK", "optionBoxConfig": {"boxItems": [{"count": 99, "itemId": "ZT2vss3W", "itemSku": "5N17lfNF"}, {"count": 26, "itemId": "zwq8Bs8d", "itemSku": "hPJ6EKtB"}, {"count": 15, "itemId": "OvnF38Rm", "itemSku": "yytksQut"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 90, "comparison": "isGreaterThan", "name": "dt2knP7J", "predicateType": "SeasonPassPredicate", "value": "c2TcS1nH", "values": ["yKyFJ6LT", "5agKozbO", "iBFur0l7"]}, {"anyOf": 32, "comparison": "isNot", "name": "jgCk9auI", "predicateType": "EntitlementPredicate", "value": "mSS8FDqJ", "values": ["yDhflMgV", "R903B0fP", "uoQXS3mw"]}, {"anyOf": 33, "comparison": "isGreaterThan", "name": "1WedKFlh", "predicateType": "EntitlementPredicate", "value": "x8qkP6AO", "values": ["UVy2aPaq", "b6ibxVqE", "nU6Br1Ul"]}]}, {"operator": "or", "predicates": [{"anyOf": 4, "comparison": "includes", "name": "5Zvv41pl", "predicateType": "SeasonTierPredicate", "value": "QSQsGG9T", "values": ["ZOeUCRyU", "WqdjBQ02", "6zTdDYar"]}, {"anyOf": 62, "comparison": "isGreaterThan", "name": "4vgoFQMw", "predicateType": "SeasonPassPredicate", "value": "JMgY2m2B", "values": ["4fHNxX4V", "18FLpdqY", "yUDd0kZB"]}, {"anyOf": 62, "comparison": "isLessThan", "name": "b3Fgr6TN", "predicateType": "SeasonPassPredicate", "value": "aJf8Wt1a", "values": ["B0dr6enz", "CO2J9sqb", "BIEqxOo2"]}]}, {"operator": "and", "predicates": [{"anyOf": 32, "comparison": "excludes", "name": "fn92bup6", "predicateType": "SeasonPassPredicate", "value": "BADlLcR8", "values": ["EWZZF3cw", "FDOXjm83", "SqIb0NK9"]}, {"anyOf": 65, "comparison": "includes", "name": "hti35fww", "predicateType": "EntitlementPredicate", "value": "OnjDuMAj", "values": ["KwTK5VR5", "OBCenr4F", "AOPiOuux"]}, {"anyOf": 60, "comparison": "isNot", "name": "QYEd86Zr", "predicateType": "SeasonTierPredicate", "value": "YQALmb6b", "values": ["DoFA1j2m", "WYaGnR7G", "JsRIzBSM"]}]}]}, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 18, "fixedTrialCycles": 76, "graceDays": 13}, "region": "LHpMCz4c", "regionData": [{"currencyCode": "664GpSuq", "currencyNamespace": "5CFTZfzg", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1976-04-26T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1992-01-27T00:00:00Z", "discountedPrice": 14, "expireAt": "1994-03-28T00:00:00Z", "price": 20, "purchaseAt": "1998-10-04T00:00:00Z", "trialPrice": 8}, {"currencyCode": "pLMLkPJr", "currencyNamespace": "HnKgtTrK", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1999-08-16T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1976-11-28T00:00:00Z", "discountedPrice": 70, "expireAt": "1999-09-28T00:00:00Z", "price": 34, "purchaseAt": "1986-07-13T00:00:00Z", "trialPrice": 88}, {"currencyCode": "eRLciDFh", "currencyNamespace": "ODips0Y1", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1998-08-25T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1996-06-05T00:00:00Z", "discountedPrice": 37, "expireAt": "1976-09-21T00:00:00Z", "price": 35, "purchaseAt": "1975-03-08T00:00:00Z", "trialPrice": 65}], "seasonType": "PASS", "sku": "clnH9JbQ", "stackable": true, "status": "ACTIVE", "tags": ["XtT1XaW6", "XKRAaMvO", "ljeVoHJ2"], "targetCurrencyCode": "ghgsRHYw", "targetItemId": "PsrK3ohM", "targetNamespace": "cFc8XCcr", "thumbnailUrl": "Z1xTTkZu", "title": "HcyHKeHR", "updatedAt": "1993-12-20T00:00:00Z", "useCount": 32}, "namespace": "czREfbQO", "order": {"currency": {"currencyCode": "d6tNP09B", "currencySymbol": "f0t0HNf9", "currencyType": "VIRTUAL", "decimals": 38, "namespace": "WhAJfUAq"}, "ext": {"HbzksJdt": {}, "jInvlr4Z": {}, "By9dBJ0S": {}}, "free": false}, "source": "PROMOTION"}, "script": "dLHQ9vK5", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id '84bgJSEo' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '3ednjRb2' \
    --body '{"grantDays": "8ZRfbx7O"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'wnQLedfX' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id '9Zq0A1Pr' \
    --body '{"grantDays": "PeVqtY53"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "moMranXB", "dryRun": true, "fulfillmentUrl": "Ya1ymxVJ", "itemType": "SEASON", "purchaseConditionUrl": "p5IeZ0gU"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'PGsWul0s' \
    --itemType 'MEDIA' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'DxuTuQ7P' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'aG90HNyp' \
    --body '{"clazz": "p5KdjN0f", "dryRun": false, "fulfillmentUrl": "2CiwLwJL", "purchaseConditionUrl": "lHktd6lH"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'BAwUnX4J' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --name 'XF9rMHYB' \
    --offset '54' \
    --tag 'Q2lmNfee' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "R1LwGkoC", "items": [{"extraSubscriptionDays": 88, "itemId": "aByiyICX", "itemName": "Bwrv1tNg", "quantity": 13}, {"extraSubscriptionDays": 70, "itemId": "uvfXtOxC", "itemName": "dnGGtFMG", "quantity": 7}, {"extraSubscriptionDays": 95, "itemId": "qF8Pe3kQ", "itemName": "PXJZ4u3i", "quantity": 92}], "maxRedeemCountPerCampaignPerUser": 40, "maxRedeemCountPerCode": 0, "maxRedeemCountPerCodePerUser": 0, "maxSaleCount": 33, "name": "33nAq74s", "redeemEnd": "1987-03-25T00:00:00Z", "redeemStart": "1979-12-12T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["8G4YOjwe", "UVS9Oab8", "B1cbXd6O"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'GXEi9ORV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '5QavB0Bd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Zn3KIbwm", "items": [{"extraSubscriptionDays": 88, "itemId": "73dniNWe", "itemName": "GuKCJqNu", "quantity": 10}, {"extraSubscriptionDays": 5, "itemId": "wmgVC9yv", "itemName": "5tIyfAgY", "quantity": 43}, {"extraSubscriptionDays": 59, "itemId": "wy3FMaLQ", "itemName": "gm7qdchB", "quantity": 25}], "maxRedeemCountPerCampaignPerUser": 24, "maxRedeemCountPerCode": 46, "maxRedeemCountPerCodePerUser": 15, "maxSaleCount": 46, "name": "F7pYFWI4", "redeemEnd": "1990-11-21T00:00:00Z", "redeemStart": "1990-01-19T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["2QA56E7c", "yh8tuy5X", "f1whhYuz"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'HxcAc5rC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Tqpw31JV' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iZxvH7qL' \
    --body '{"categoryPath": "HaIQdwKY", "localizationDisplayNames": {"ROpj2TMA": "xgTgFcM2", "jiNrwEnI": "eLxfWVcw", "hEwOQ2aj": "9unaLjdd"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'o36Vj1KW' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'Nq5nqAys' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c70LcYCO' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'lxqNcFkX' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0TRhqpL7' \
    --body '{"localizationDisplayNames": {"0F64xMJy": "koLXU5vM", "IeoPvcu3": "ytSzcuDb", "Ux8iMQte": "UipvQBaR"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'OJEbJ5ao' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3wUAqCtA' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'mldiRvYx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lnU75zA2' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'f6Ttjr3T' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u3tGzmOT' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'zFdGQrxp' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '61' \
    --code 'Aec5Z1jz' \
    --limit '32' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'L2UeqTn1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 75}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'AIgMmkQz' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '36' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'bCxj0cTE' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '33' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'zEFYOFB9' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '79' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'O66VZfAe' \
    --namespace "$AB_NAMESPACE" \
    --code 'BCnlQSr0' \
    --limit '2' \
    --offset '65' \
    --userId 'FzcjXoJd' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code '2kBsGQzh' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'PrBH3cXn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '5KQxNjvs' \
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
    --body '{"currencyCode": "lYfVCWAt", "currencySymbol": "TIzPiOAH", "currencyType": "VIRTUAL", "decimals": 80, "localizationDescriptions": {"nD0t46Ao": "b1gOh4Y9", "lcFNr56F": "zWlwpibN", "Yk6I6aMX": "S8K9u956"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'jV9gmrKj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"5a4CDVgK": "Aa0ryg3y", "scpqvEuc": "fwnKSSNH", "l6Vswfna": "BH11EgNU"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'du9YUjla' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'wJhXz9Kt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'pTfpZClf' \
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
    --body '{"data": [{"id": "CSkGEpEE", "rewards": [{"currency": {"currencyCode": "xImTchaH", "namespace": "1sh9f5bs"}, "item": {"itemId": "aefFB2Lu", "itemSku": "74Xgz33H", "itemType": "u9hGwicm"}, "quantity": 71, "type": "CURRENCY"}, {"currency": {"currencyCode": "fZQHEg1L", "namespace": "htQgDeop"}, "item": {"itemId": "omINJ65C", "itemSku": "SuYSVCoX", "itemType": "MMtEMzTs"}, "quantity": 23, "type": "CURRENCY"}, {"currency": {"currencyCode": "OwDyTafE", "namespace": "44Je8UwR"}, "item": {"itemId": "JEBOOSGB", "itemSku": "6NL6fXdl", "itemType": "TCIbWQdL"}, "quantity": 49, "type": "CURRENCY"}]}, {"id": "EicMI5cA", "rewards": [{"currency": {"currencyCode": "SN3qadhJ", "namespace": "8TBJzwvI"}, "item": {"itemId": "pzhzPthc", "itemSku": "2Kg6WTz4", "itemType": "S8uRapQV"}, "quantity": 34, "type": "CURRENCY"}, {"currency": {"currencyCode": "t8aRMGu5", "namespace": "QyRZqRtt"}, "item": {"itemId": "lNHPXQeS", "itemSku": "6ZcCmUzs", "itemType": "H5mt9S8q"}, "quantity": 78, "type": "CURRENCY"}, {"currency": {"currencyCode": "YUMRybfM", "namespace": "UXmwFd3n"}, "item": {"itemId": "Y1Ce1QEy", "itemSku": "hzoKmFUW", "itemType": "8UnLeyzh"}, "quantity": 23, "type": "ITEM"}]}, {"id": "eGBYMsNp", "rewards": [{"currency": {"currencyCode": "ZHpwDz1F", "namespace": "dWZG8D8g"}, "item": {"itemId": "6benlCGa", "itemSku": "w4GWJJmN", "itemType": "zQPVmrdz"}, "quantity": 100, "type": "CURRENCY"}, {"currency": {"currencyCode": "3bU9gXkE", "namespace": "1BfEXA70"}, "item": {"itemId": "d9fkvrj6", "itemSku": "G9G6Ic19", "itemType": "wnL3mydz"}, "quantity": 99, "type": "CURRENCY"}, {"currency": {"currencyCode": "vMMNMsHi", "namespace": "pOcZsGeR"}, "item": {"itemId": "QyO6UKWq", "itemSku": "9EYFrwRo", "itemType": "s3ijCEPE"}, "quantity": 71, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"knrHwc5n": "BieRez3Y", "3KQu4tee": "t1wZA0gG", "laZp23oN": "yxP66EvG"}}, {"platform": "XBOX", "platformDlcIdMap": {"fNhTUNeo": "Q0w41Yfz", "Pr6KWj4M": "xafvxMqL", "jQK4xoZo": "nGqW4puy"}}, {"platform": "PSN", "platformDlcIdMap": {"gmsuG420": "dB1w5O3A", "cBP1mree": "vP75fTes", "BXkCEKuk": "pCVuFuoW"}}]}' \
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
    --entitlementClazz 'CODE' \
    --entitlementName 'VYV77rsj' \
    --itemId 'UKaD47DP,iHltuOAF,GWttyMgX' \
    --limit '90' \
    --offset '70' \
    --userId 'nBdkCngE' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'o8wkLTSr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '50' \
    --status 'SUCCESS' \
    --userId 'GObsONxv' \
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
    --body '{"bundleId": "v3mGoOoP", "password": "G9yo4uVf"}' \
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
    --body '{"sandboxId": "1F9fi71g"}' \
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
    --body '{"applicationName": "x6I1Qk38", "serviceAccountId": "I6Anf04Z"}' \
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
    --body '{"data": [{"itemIdentity": "OcuZVOmS", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"S5viy1pG": "17oZ9C0q", "iqyLWflS": "BXKz5cdQ", "DI4wjxq1": "qnw1r7PJ"}}, {"itemIdentity": "Z18UCTp1", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"aeEKREaF": "DXOCsOvH", "06ADYjMV": "R0AxBZLc", "YNK8QuR0": "iFLBXClD"}}, {"itemIdentity": "yxIUPNK5", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"sOfsDtab": "m9bjkR45", "QejcB2Nl": "t2NIMnrj", "TiKwSgv8": "5AesHtUg"}}]}' \
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
    --body '{"environment": "zAxLVR3Q"}' \
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
    --body '{"appId": "kJAUBdyD", "publisherAuthenticationKey": "60bPEDkv"}' \
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
    --body '{"clientId": "fjLwzAzE", "clientSecret": "EaUTIN6G", "organizationId": "77AbuQNq"}' \
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
    --body '{"relyingPartyCert": "NDRc71O4"}' \
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
    --password 'C0NRFxdQ' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'WKDD3cos' \
    --itemId 'BCo0Ht2o' \
    --itemType 'BUNDLE' \
    --endTime 'EmpJjzXR' \
    --startTime 'lGGNqrnQ' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'zQaPeTpS' \
    --itemId 'MHqTxDPC' \
    --itemType 'COINS' \
    --endTime 'iCMHGewl' \
    --startTime 'oSlAFVYb' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '1ace6oCV' \
    --body '{"categoryPath": "MjJvPcGu", "targetItemId": "d1353peQ", "targetNamespace": "IFXgu3dV"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gBahAF2F' \
    --body '{"appId": "4JqA9499", "appType": "GAME", "baseAppId": "du7f0w1p", "boothName": "BjIYJjOx", "categoryPath": "swADqsGG", "clazz": "OtTvawlf", "displayOrder": 91, "entitlementType": "DURABLE", "ext": {"ZVKIfY4A": {}, "9KZ68G1j": {}, "eFX0FLeX": {}}, "features": ["ZeHHAAxx", "LLi1l16i", "PjavTwYo"], "images": [{"as": "VQCYyR7d", "caption": "1pEItlq8", "height": 76, "imageUrl": "MZCB0YRf", "smallImageUrl": "boYYXcp7", "width": 25}, {"as": "N64HFZlI", "caption": "9ArgN71A", "height": 95, "imageUrl": "I7i9FtCl", "smallImageUrl": "wI65G34x", "width": 71}, {"as": "3Vemx0ys", "caption": "OxZ5NLQG", "height": 88, "imageUrl": "ZHeBd73D", "smallImageUrl": "jMXTYoci", "width": 12}], "itemIds": ["dyCrpjA8", "WoeFpIYk", "FFAowY7L"], "itemQty": {"xtw7Ij4Q": 12, "Rgm8nqDW": 17, "7dtZ082W": 51}, "itemType": "APP", "listable": false, "localizations": {"xTz1kCxv": {"description": "UQWUVe9y", "localExt": {"iCOYQ4CA": {}, "hXLveRFK": {}, "V6W3WjKd": {}}, "longDescription": "QEY0xPfR", "title": "o8ouB6Tq"}, "BvkO1BUG": {"description": "532ht1y9", "localExt": {"Yq0OdmQe": {}, "Hc79dl0i": {}, "er5VxumJ": {}}, "longDescription": "T8IhQ3A7", "title": "icXgMKkc"}, "q6eGDqyU": {"description": "tqiIKBFm", "localExt": {"4i9xKRgK": {}, "vaPucVW6": {}, "GeYoqJcs": {}}, "longDescription": "tn28ammO", "title": "CsBGexss"}}, "maxCount": 55, "maxCountPerUser": 6, "name": "d9y2DPmm", "optionBoxConfig": {"boxItems": [{"count": 73, "itemId": "SR0EcJxm", "itemSku": "XGwLginR"}, {"count": 64, "itemId": "YB1EsR4C", "itemSku": "aonlxQzW"}, {"count": 4, "itemId": "GarZf5PX", "itemSku": "ugluvdxu"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 3, "fixedTrialCycles": 14, "graceDays": 11}, "regionData": {"6tgTAvkC": [{"currencyCode": "xgOjO04c", "currencyNamespace": "OAdXxLxn", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1971-10-29T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1995-11-14T00:00:00Z", "discountedPrice": 45, "expireAt": "1988-03-25T00:00:00Z", "price": 74, "purchaseAt": "1997-03-26T00:00:00Z", "trialPrice": 29}, {"currencyCode": "mMFoPhts", "currencyNamespace": "7R9VPSGs", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1991-03-29T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1986-03-03T00:00:00Z", "discountedPrice": 39, "expireAt": "1985-06-18T00:00:00Z", "price": 43, "purchaseAt": "1971-06-18T00:00:00Z", "trialPrice": 22}, {"currencyCode": "40WQu5cN", "currencyNamespace": "c6TO7HcI", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1977-05-09T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1979-03-04T00:00:00Z", "discountedPrice": 26, "expireAt": "1998-05-16T00:00:00Z", "price": 34, "purchaseAt": "1978-08-30T00:00:00Z", "trialPrice": 26}], "qcURDIUe": [{"currencyCode": "Ni8ACli2", "currencyNamespace": "HKZHA0U6", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1990-12-12T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1987-01-29T00:00:00Z", "discountedPrice": 73, "expireAt": "1982-10-31T00:00:00Z", "price": 87, "purchaseAt": "1987-05-10T00:00:00Z", "trialPrice": 59}, {"currencyCode": "E5aRodBr", "currencyNamespace": "2IJlYvJv", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1971-08-20T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1994-07-09T00:00:00Z", "discountedPrice": 13, "expireAt": "1976-01-31T00:00:00Z", "price": 22, "purchaseAt": "1976-11-28T00:00:00Z", "trialPrice": 70}, {"currencyCode": "qtDFboME", "currencyNamespace": "A1phFYCQ", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1986-05-21T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1976-03-24T00:00:00Z", "discountedPrice": 50, "expireAt": "1999-04-09T00:00:00Z", "price": 3, "purchaseAt": "1988-07-03T00:00:00Z", "trialPrice": 3}], "Pcm4vcR9": [{"currencyCode": "E2fK5Nq0", "currencyNamespace": "iSEXDMbh", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1989-04-12T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1977-11-30T00:00:00Z", "discountedPrice": 73, "expireAt": "1996-07-19T00:00:00Z", "price": 96, "purchaseAt": "1991-09-30T00:00:00Z", "trialPrice": 6}, {"currencyCode": "O7KUsBrk", "currencyNamespace": "SNBPxarq", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1987-08-25T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1979-11-25T00:00:00Z", "discountedPrice": 88, "expireAt": "1976-10-08T00:00:00Z", "price": 1, "purchaseAt": "1978-12-17T00:00:00Z", "trialPrice": 74}, {"currencyCode": "f8b1hm0R", "currencyNamespace": "dGewtZCp", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1988-06-30T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1999-12-20T00:00:00Z", "discountedPrice": 20, "expireAt": "1980-08-05T00:00:00Z", "price": 70, "purchaseAt": "1998-02-25T00:00:00Z", "trialPrice": 59}]}, "seasonType": "TIER", "sku": "CriMOKcp", "stackable": true, "status": "INACTIVE", "tags": ["I3Wzy8b6", "6mfLD9LZ", "T0ELhWLA"], "targetCurrencyCode": "N12pu1cp", "targetNamespace": "8OcZOQSz", "thumbnailUrl": "b6e0nnyv", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'hKtLXcMe' \
    --appId '671PPlu0' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate '3gHVboh9' \
    --baseAppId 'urL4NXnJ' \
    --categoryPath 'lfdsLX6n' \
    --features 'HuyIifu3' \
    --itemType 'SEASON' \
    --limit '21' \
    --offset '72' \
    --region 'nnKSAdgv' \
    --sortBy 'displayOrder:desc,createdAt,updatedAt:asc' \
    --storeId 'zkiLnThV' \
    --tags 'e6GVCMW4' \
    --targetNamespace 'uBiDWkVJ' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'zpc48lpu,Z6nflXLt,MMldDGaj' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'QSFETlZZ' \
    --sku 'Sx7ULbt4' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'RjZMFFYN' \
    --populateBundle  \
    --region 'GEZR0xi8' \
    --storeId '7psPwxD2' \
    --sku 'Pm0WQR9s' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'xyC0Ugo9' \
    --sku 'SpJmSuKG' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '2aJaiV6h,yqERN5dI,aE88SFIt' \
    --storeId 'z2FYCZnb' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'FRHjVNOg' \
    --region 'D88uC5Eg' \
    --storeId 'I4Sz21ib' \
    --itemIds '5Zuz6so1' \
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
    --userId '8jUxfGaY' \
    --body '{"itemIds": ["wUsfnygw", "oMlgDt9w", "Lrwcnveq"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'EXTENSION' \
    --limit '14' \
    --offset '83' \
    --storeId 'vqgVjPzc' \
    --keyword 'eiaxUh4u' \
    --language 'zcO3e3DO' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '63' \
    --offset '26' \
    --sortBy 'createdAt:desc,createdAt,displayOrder' \
    --storeId 'OoaW2hpQ' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'xPVX5Xvp' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'sUK80Ar3' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Y0APOwhZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jBTqCep5' \
    --body '{"appId": "dv6AP2be", "appType": "GAME", "baseAppId": "nvgYz6sT", "boothName": "6v3SGLSV", "categoryPath": "UtB8iTql", "clazz": "ud7JOyQo", "displayOrder": 37, "entitlementType": "CONSUMABLE", "ext": {"0H3OiE0H": {}, "DsDMfc6o": {}, "vh8qNeeK": {}}, "features": ["rAT5fbVp", "ODYNBMfZ", "rHhwkRqH"], "images": [{"as": "aLX4gIBk", "caption": "Rpn82YFC", "height": 70, "imageUrl": "1MRTbhTP", "smallImageUrl": "EB9PxJd0", "width": 76}, {"as": "t9rlmi1H", "caption": "SFEQd1Q2", "height": 99, "imageUrl": "WKFwSeX4", "smallImageUrl": "T77YNsdp", "width": 33}, {"as": "PaO8BZ0C", "caption": "HWo5QiV5", "height": 99, "imageUrl": "DxkVG7FH", "smallImageUrl": "Dv9bzQWS", "width": 100}], "itemIds": ["BleriFMe", "n4VxLTC7", "JpkauPo2"], "itemQty": {"kCyYzbL7": 70, "numdlOnu": 71, "ctUxcafW": 14}, "itemType": "CODE", "listable": true, "localizations": {"VKEcjLYB": {"description": "0ODM7DJz", "localExt": {"lKC99e2O": {}, "pBpD82xX": {}, "hEGR7Doy": {}}, "longDescription": "xrWjRM3k", "title": "f2fgh2LS"}, "X5MkPyWK": {"description": "z2fDu7hQ", "localExt": {"HzyOV41O": {}, "nbbCEk2L": {}, "XdNqTORr": {}}, "longDescription": "Kt6XRSwh", "title": "e9DC1Hhi"}, "rx2s1gtV": {"description": "T8Ib5KUc", "localExt": {"aYcZ9tSp": {}, "zC2DAq9p": {}, "A1Mie25G": {}}, "longDescription": "QUW5jZhK", "title": "iyB3lxiM"}}, "maxCount": 14, "maxCountPerUser": 49, "name": "e2gzjMuM", "optionBoxConfig": {"boxItems": [{"count": 12, "itemId": "aaR919LN", "itemSku": "BBTQeHhB"}, {"count": 71, "itemId": "yiERGMTd", "itemSku": "uwhUll5C"}, {"count": 14, "itemId": "tOsc4aXV", "itemSku": "iV7qterJ"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 65, "fixedTrialCycles": 49, "graceDays": 79}, "regionData": {"4FGv8cYh": [{"currencyCode": "uWW5Au0B", "currencyNamespace": "kzXvJRIL", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1985-04-03T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1975-12-23T00:00:00Z", "discountedPrice": 97, "expireAt": "1988-01-19T00:00:00Z", "price": 24, "purchaseAt": "1992-10-08T00:00:00Z", "trialPrice": 64}, {"currencyCode": "dNwneJdI", "currencyNamespace": "A0hMB9fd", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1978-07-18T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1998-11-28T00:00:00Z", "discountedPrice": 29, "expireAt": "1973-02-19T00:00:00Z", "price": 52, "purchaseAt": "1989-02-27T00:00:00Z", "trialPrice": 80}, {"currencyCode": "bv3uT2ar", "currencyNamespace": "aQfsojWs", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1981-04-30T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1997-09-16T00:00:00Z", "discountedPrice": 30, "expireAt": "1992-05-07T00:00:00Z", "price": 11, "purchaseAt": "1990-07-02T00:00:00Z", "trialPrice": 32}], "IIxklC9V": [{"currencyCode": "TOgSPHMb", "currencyNamespace": "lmjFvIct", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1989-01-08T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1974-07-21T00:00:00Z", "discountedPrice": 29, "expireAt": "1985-11-29T00:00:00Z", "price": 91, "purchaseAt": "1996-02-24T00:00:00Z", "trialPrice": 53}, {"currencyCode": "2OiwzGEe", "currencyNamespace": "X9OUn1rY", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1976-11-15T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1997-07-26T00:00:00Z", "discountedPrice": 82, "expireAt": "1987-10-01T00:00:00Z", "price": 18, "purchaseAt": "1979-05-01T00:00:00Z", "trialPrice": 5}, {"currencyCode": "2nI8wsRe", "currencyNamespace": "vj0InJBU", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1989-06-24T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1991-12-08T00:00:00Z", "discountedPrice": 95, "expireAt": "1974-04-10T00:00:00Z", "price": 90, "purchaseAt": "1999-08-31T00:00:00Z", "trialPrice": 38}], "JtyDdVVR": [{"currencyCode": "Mum16pcN", "currencyNamespace": "bzn4EimG", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1982-04-05T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1974-12-04T00:00:00Z", "discountedPrice": 63, "expireAt": "1976-06-02T00:00:00Z", "price": 91, "purchaseAt": "1973-09-01T00:00:00Z", "trialPrice": 96}, {"currencyCode": "8Q8cCXQA", "currencyNamespace": "7262W1PR", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1974-03-25T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1972-08-28T00:00:00Z", "discountedPrice": 18, "expireAt": "1990-10-06T00:00:00Z", "price": 91, "purchaseAt": "1972-10-21T00:00:00Z", "trialPrice": 42}, {"currencyCode": "jQzU84nG", "currencyNamespace": "83SX6c2T", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1999-11-08T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1992-04-27T00:00:00Z", "discountedPrice": 73, "expireAt": "1998-02-02T00:00:00Z", "price": 79, "purchaseAt": "1984-06-10T00:00:00Z", "trialPrice": 71}]}, "seasonType": "TIER", "sku": "vdjMAOfi", "stackable": true, "status": "ACTIVE", "tags": ["KUF58i5x", "KAnINezk", "soxBPlme"], "targetCurrencyCode": "o1kSnKZY", "targetNamespace": "xTYNQLdJ", "thumbnailUrl": "VGcGkHPT", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'Z170dbQe' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'qftDhg4r' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'fjuqQuFC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 80, "orderNo": "T9YxnbA2"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId '9ndGBGpl' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'gx4daMyi' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId '2NLaRD9n' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yWcrG6Pg' \
    --body '{"carousel": [{"alt": "9lodWlBv", "previewUrl": "sImC5DXP", "thumbnailUrl": "c4HFgwaj", "type": "image", "url": "Bm6g65vh", "videoSource": "generic"}, {"alt": "bx7cbp1J", "previewUrl": "vkkPs2TM", "thumbnailUrl": "NsQ1jgqX", "type": "video", "url": "omq8wycG", "videoSource": "youtube"}, {"alt": "xdRCfzcv", "previewUrl": "Bn7XYKmY", "thumbnailUrl": "fvCykEQ8", "type": "video", "url": "FZapU7v8", "videoSource": "youtube"}], "developer": "aH5EyROJ", "forumUrl": "GqmDnFLA", "genres": ["Indie", "MassivelyMultiplayer", "Adventure"], "localizations": {"B5EHB3xZ": {"announcement": "HQcakOm5", "slogan": "namaOQED"}, "X3bqujnJ": {"announcement": "Ny5hWL0C", "slogan": "dz8cldTx"}, "Kaf4dde9": {"announcement": "WswMhIzN", "slogan": "A2N4Vu39"}}, "platformRequirements": {"tjbXvOEs": [{"additionals": "evzZWzSO", "directXVersion": "u1eXtoCm", "diskSpace": "OUqIkziF", "graphics": "MLatRkw2", "label": "AFhYMifd", "osVersion": "tigelyCI", "processor": "TThFK8PJ", "ram": "xLResrOq", "soundCard": "B13F4S1e"}, {"additionals": "imgj4Oi5", "directXVersion": "9vEXF0wW", "diskSpace": "ukWgRgTy", "graphics": "9PhME2yv", "label": "PTZZ4bbm", "osVersion": "D76jlL5a", "processor": "HCXN12MO", "ram": "O7DrLl4p", "soundCard": "dIEPVBkR"}, {"additionals": "4nQ4M9ee", "directXVersion": "qKXwHBhZ", "diskSpace": "3mVsw8N6", "graphics": "8m2i8YvM", "label": "LNRtlahQ", "osVersion": "JsNCbloh", "processor": "3U5yShto", "ram": "ezo7f8iF", "soundCard": "7NwP5CAo"}], "7TiqaX7I": [{"additionals": "4pM5EbpQ", "directXVersion": "wvGRgxrp", "diskSpace": "REVSMIlc", "graphics": "aHiTdco7", "label": "iYHldLDG", "osVersion": "qBCjVEux", "processor": "n0rSCDtm", "ram": "U8d9kMTe", "soundCard": "ux6bRs1G"}, {"additionals": "ipNBznby", "directXVersion": "kbbTEW0f", "diskSpace": "lMZ03xAo", "graphics": "MmdeIZn7", "label": "JRbhNani", "osVersion": "R3AqNHef", "processor": "NTXmT2Xd", "ram": "UU2Ewp0h", "soundCard": "5oUSnyR5"}, {"additionals": "kPwPSLft", "directXVersion": "CaJ9SSff", "diskSpace": "NukB4sd2", "graphics": "RSOQGElp", "label": "Vg6t2v19", "osVersion": "EqkQHRtx", "processor": "Maea9mUv", "ram": "WdBpsu3q", "soundCard": "7honxmEf"}], "WbML0cCD": [{"additionals": "P9O6rX0D", "directXVersion": "47CUfIz2", "diskSpace": "FFflyEEM", "graphics": "6ktdFoEc", "label": "rZZbRLwy", "osVersion": "xw24OYIj", "processor": "juhNFFvm", "ram": "hPw4xDRu", "soundCard": "ZqW4rS6o"}, {"additionals": "luAas8VK", "directXVersion": "sMKBEQcv", "diskSpace": "LpP4ekWa", "graphics": "E7Ad7qVB", "label": "qW9qbBcQ", "osVersion": "Y3B6Hqv4", "processor": "bO74TBbC", "ram": "szahGZgu", "soundCard": "PFbgWZ2Y"}, {"additionals": "uPdyFhUP", "directXVersion": "PVwDmzA1", "diskSpace": "Ew2gEh0Q", "graphics": "6L68WjXu", "label": "YbDFt29h", "osVersion": "vrSTgUXx", "processor": "0bnuRsFI", "ram": "vWJBquZH", "soundCard": "XnXyaTQF"}]}, "platforms": ["Windows", "Android", "IOS"], "players": ["Single", "LocalCoop", "Coop"], "primaryGenre": "Indie", "publisher": "Q2NvNRET", "releaseDate": "1975-04-07T00:00:00Z", "websiteUrl": "j8tHsx68"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'if5AMktQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'py1srht6' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'OL9vwwxl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'IpjrAn8G' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uj5rv38c' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '4XWqSKqZ' \
    --itemId '00uLHhJq' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oH55YZ4W' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'AkrN63sy' \
    --itemId 'yIXzUo9p' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OsJ1GORh' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'no9OVBEB' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'CIJMcCwX' \
    --populateBundle  \
    --region '8BWvFAkg' \
    --storeId 'xrbAyXN0' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'TSxftIoD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'o4MgeMtE' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 12, "comparison": "is", "name": "kqPO6ps9", "predicateType": "EntitlementPredicate", "value": "66q42BA4", "values": ["JP2nwOE5", "eQfHZE09", "tR4D7GlD"]}, {"anyOf": 17, "comparison": "excludes", "name": "DZJs3Qxh", "predicateType": "EntitlementPredicate", "value": "sedWsMq3", "values": ["5Z0linUF", "iHxKtEbo", "4Zc5M1RU"]}, {"anyOf": 60, "comparison": "isLessThan", "name": "hCeJzunT", "predicateType": "EntitlementPredicate", "value": "SeOU7kVp", "values": ["773amzZm", "wHn6TGQa", "eULU8wMK"]}]}, {"operator": "and", "predicates": [{"anyOf": 5, "comparison": "isGreaterThan", "name": "0CBetP4Q", "predicateType": "EntitlementPredicate", "value": "5ac03kko", "values": ["1bfefy3s", "mD9NNTvc", "L2jXuv1n"]}, {"anyOf": 21, "comparison": "includes", "name": "jsQZXvZ7", "predicateType": "SeasonTierPredicate", "value": "dCr8AM9i", "values": ["b30zGatl", "kcUdJYFU", "ZfQlzlo4"]}, {"anyOf": 42, "comparison": "isLessThan", "name": "MD5oX0al", "predicateType": "SeasonTierPredicate", "value": "ljQ5L4B6", "values": ["NN3PEAEQ", "EgbodOpd", "qHDpIG3j"]}]}, {"operator": "and", "predicates": [{"anyOf": 6, "comparison": "isLessThan", "name": "qxzuHYri", "predicateType": "EntitlementPredicate", "value": "OibLJkIT", "values": ["YCXSUXkc", "edZ0wq7P", "0OrEs7Ru"]}, {"anyOf": 77, "comparison": "excludes", "name": "JfTFXpgK", "predicateType": "SeasonPassPredicate", "value": "6leKe3En", "values": ["CGpObooe", "aZBsC5FN", "kTannzh2"]}, {"anyOf": 43, "comparison": "excludes", "name": "KTDTLjRN", "predicateType": "EntitlementPredicate", "value": "C06yDgJU", "values": ["kXX3DJ0p", "D16hhB5j", "ZowLMvtr"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'SaUDmXCW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "OopkAy9G"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --name '5a9YMFc5' \
    --offset '48' \
    --tag 'kUGCOtAm' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZHisDgDY", "name": "7HMFku6j", "status": "ACTIVE", "tags": ["mYTQYrJb", "2DiAGPJP", "bMDqyo3G"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'aaglk9ed' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'GetKeyGroup' test.out

#- 113 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'yWfY9b8d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ItdA1Yhi", "name": "5bIudH0l", "status": "ACTIVE", "tags": ["hcpD2d3x", "L9aCkscu", "swSPPxrg"]}' \
    > test.out 2>&1
eval_tap $? 113 'UpdateKeyGroup' test.out

#- 114 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'LFfFgCpl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 114 'GetKeyGroupDynamic' test.out

#- 115 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '8R2quXRM' \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '10' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 115 'ListKeys' test.out

#- 116 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'oyzYaOyq' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 116 'UploadKeys' test.out

#- 117 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'R0DmUOWH' \
    --limit '44' \
    --offset '76' \
    --orderNos 'LFYz7pa3,s32YUymg,CZvu102M' \
    --sortBy 'QacD5w1b' \
    --startTime 'eyoROc4l' \
    --status 'CHARGED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 117 'QueryOrders' test.out

#- 118 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetOrderStatistics' test.out

#- 119 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FFRrwgqc' \
    > test.out 2>&1
eval_tap $? 119 'GetOrder' test.out

#- 120 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0QkgaQoA' \
    --body '{"description": "B1CCJKis"}' \
    > test.out 2>&1
eval_tap $? 120 'RefundOrder' test.out

#- 121 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetPaymentCallbackConfig' test.out

#- 122 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "L57MzbR7", "privateKey": "bLq8YfkT"}' \
    > test.out 2>&1
eval_tap $? 122 'UpdatePaymentCallbackConfig' test.out

#- 123 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'aIcrU9JI' \
    --externalId 'JOYLS3dH' \
    --limit '6' \
    --notificationSource 'WXPAY' \
    --notificationType '64LJAU0E' \
    --offset '2' \
    --paymentOrderNo 'gjqCRdMg' \
    --startDate 'L62O3VeF' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 123 'QueryPaymentNotifications' test.out

#- 124 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'c6EeafY9' \
    --limit '74' \
    --offset '56' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentOrders' test.out

#- 125 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "7CXz1Km3", "currencyNamespace": "3MEMvDzo", "customParameters": {"juJCWY2X": {}, "vH2OEPBz": {}, "ZPGz7BYq": {}}, "description": "joBYqKRG", "extOrderNo": "d4LwL5CF", "extUserId": "eG2C4hTm", "itemType": "SUBSCRIPTION", "language": "kjiC_tP", "metadata": {"wCOzMhgj": "H5u302vh", "W1vwEOvw": "4eKGN1LV", "aIP98Thz": "I1MOMJJQ"}, "notifyUrl": "dD513uuP", "omitNotification": false, "platform": "W3YFd9aK", "price": 27, "recurringPaymentOrderNo": "rtK7QruE", "region": "gmtSJRmf", "returnUrl": "Dx3UGVmx", "sandbox": false, "sku": "qw6hbZ1P", "subscriptionId": "bclDTt2u", "targetNamespace": "2GWeIz3f", "targetUserId": "Spt6aNBF", "title": "pthFHvEy"}' \
    > test.out 2>&1
eval_tap $? 125 'CreatePaymentOrderByDedicated' test.out

#- 126 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'CcWoIE1q' \
    > test.out 2>&1
eval_tap $? 126 'ListExtOrderNoByExtTxId' test.out

#- 127 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8oWaZOzH' \
    > test.out 2>&1
eval_tap $? 127 'GetPaymentOrder' test.out

#- 128 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '492O6i9q' \
    --body '{"extTxId": "NKRuANsF", "paymentMethod": "JTQu6oe1", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 128 'ChargePaymentOrder' test.out

#- 129 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SHCjuTSI' \
    --body '{"description": "LdyP9wiu"}' \
    > test.out 2>&1
eval_tap $? 129 'RefundPaymentOrderByDedicated' test.out

#- 130 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dy7mHTHU' \
    --body '{"amount": 30, "currencyCode": "kypdrDsy", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 99, "vat": 42}' \
    > test.out 2>&1
eval_tap $? 130 'SimulatePaymentOrderNotification' test.out

#- 131 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LJV74A4r' \
    > test.out 2>&1
eval_tap $? 131 'GetPaymentOrderChargeStatus' test.out

#- 132 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 132 'GetPlatformWalletConfig' test.out

#- 133 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["IOS", "Twitch", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 133 'UpdatePlatformWalletConfig' test.out

#- 134 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 134 'ResetPlatformWalletConfig' test.out

#- 135 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "aXCjtJQv", "eventTopic": "NFihagzu", "maxAwarded": 65, "maxAwardedPerUser": 51, "namespaceExpression": "QSCCNUg2", "rewardCode": "gojS35Ih", "rewardConditions": [{"condition": "U84Ud3Dz", "conditionName": "AeA3s6kI", "eventName": "mkmIv090", "rewardItems": [{"duration": 32, "itemId": "PqamLgex", "quantity": 78}, {"duration": 50, "itemId": "01e189VV", "quantity": 82}, {"duration": 14, "itemId": "6dwH841n", "quantity": 14}]}, {"condition": "pw7D5f6w", "conditionName": "SITyrCM2", "eventName": "auDT8zlQ", "rewardItems": [{"duration": 50, "itemId": "UQnSxPi2", "quantity": 48}, {"duration": 63, "itemId": "ak9tGeci", "quantity": 78}, {"duration": 17, "itemId": "nFB63rL2", "quantity": 85}]}, {"condition": "xncBsJMz", "conditionName": "2AzIynzc", "eventName": "3x20108X", "rewardItems": [{"duration": 48, "itemId": "L3qSBYH3", "quantity": 21}, {"duration": 38, "itemId": "u81kOMQ0", "quantity": 57}, {"duration": 68, "itemId": "8F4P7fR1", "quantity": 93}]}], "userIdExpression": "6BhZvp7w"}' \
    > test.out 2>&1
eval_tap $? 135 'CreateReward' test.out

#- 136 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'D6rt4DZt' \
    --limit '64' \
    --offset '83' \
    --sortBy 'rewardCode,namespace:desc' \
    > test.out 2>&1
eval_tap $? 136 'QueryRewards' test.out

#- 137 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 137 'ExportRewards' test.out

#- 138 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 138 'ImportRewards' test.out

#- 139 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '0SfpMTOI' \
    > test.out 2>&1
eval_tap $? 139 'GetReward' test.out

#- 140 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'iNjMuzKa' \
    --body '{"description": "Onhv8ps6", "eventTopic": "HvlHm9DR", "maxAwarded": 96, "maxAwardedPerUser": 97, "namespaceExpression": "HyQJqu8K", "rewardCode": "BGFRYfUc", "rewardConditions": [{"condition": "YmnbsU1i", "conditionName": "JWDFpFM7", "eventName": "h9o3oL6b", "rewardItems": [{"duration": 76, "itemId": "t6zgTsxW", "quantity": 5}, {"duration": 90, "itemId": "aVD81SVo", "quantity": 1}, {"duration": 21, "itemId": "zRZ2SaMV", "quantity": 84}]}, {"condition": "GBFY3431", "conditionName": "mSsnJpLx", "eventName": "GmjW3fmT", "rewardItems": [{"duration": 75, "itemId": "SLQcTbEB", "quantity": 75}, {"duration": 16, "itemId": "r0hdtJfX", "quantity": 36}, {"duration": 24, "itemId": "6hJ5Vg5d", "quantity": 90}]}, {"condition": "vO9HzbTP", "conditionName": "OwA2MJxO", "eventName": "vNiGzuqP", "rewardItems": [{"duration": 40, "itemId": "FX3WkPlz", "quantity": 0}, {"duration": 70, "itemId": "ICC8LEOa", "quantity": 15}, {"duration": 17, "itemId": "UXsNdRZb", "quantity": 86}]}], "userIdExpression": "5mJ94F2z"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateReward' test.out

#- 141 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vCfezzGN' \
    > test.out 2>&1
eval_tap $? 141 'DeleteReward' test.out

#- 142 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'hPTkGuBN' \
    --body '{"payload": {"Nooycabx": {}, "byaubLua": {}, "3nTtqzpt": {}}}' \
    > test.out 2>&1
eval_tap $? 142 'CheckEventCondition' test.out

#- 143 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'fNfdy14g' \
    --body '{"conditionName": "UUp9L2vI", "userId": "Pk7cWAHn"}' \
    > test.out 2>&1
eval_tap $? 143 'DeleteRewardConditionRecord' test.out

#- 144 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 144 'ListStores' test.out

#- 145 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "77LGbLca", "defaultRegion": "hjXlC7lk", "description": "TUPOz8MY", "supportedLanguages": ["eVcb9w4G", "4QIqIBtg", "b9KtLjZX"], "supportedRegions": ["nJBa9vMp", "qW6RhEIn", "E3HzsVgc"], "title": "GiT5oFki"}' \
    > test.out 2>&1
eval_tap $? 145 'CreateStore' test.out

#- 146 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I5lIs348' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 146 'ImportStore' test.out

#- 147 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetPublishedStore' test.out

#- 148 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'DeletePublishedStore' test.out

#- 149 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetPublishedStoreBackup' test.out

#- 150 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 150 'RollbackPublishedStore' test.out

#- 151 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CeDXDnIE' \
    > test.out 2>&1
eval_tap $? 151 'GetStore' test.out

#- 152 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FMaLLdds' \
    --body '{"defaultLanguage": "HuBuIsMG", "defaultRegion": "FAJSP4R9", "description": "qrHCn1Z6", "supportedLanguages": ["tnongXj6", "JS2l8SKb", "zvqNB81S"], "supportedRegions": ["ZD8twMPP", "HQrdciGm", "DSj3PALv"], "title": "H3YRu14e"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateStore' test.out

#- 153 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DP2t0sTB' \
    > test.out 2>&1
eval_tap $? 153 'DeleteStore' test.out

#- 154 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'whUX9MSW' \
    --action 'DELETE' \
    --itemSku 'PXaR3opm' \
    --itemType 'EXTENSION' \
    --limit '20' \
    --offset '0' \
    --selected  \
    --sortBy 'updatedAt,createdAt:asc,updatedAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'w4vZu9Lu' \
    --updatedAtStart 'LTKsSuDv' \
    > test.out 2>&1
eval_tap $? 154 'QueryChanges' test.out

#- 155 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JfHPG4eQ' \
    > test.out 2>&1
eval_tap $? 155 'PublishAll' test.out

#- 156 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DgaiKiP6' \
    > test.out 2>&1
eval_tap $? 156 'PublishSelected' test.out

#- 157 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '14aXbDG9' \
    > test.out 2>&1
eval_tap $? 157 'SelectAllRecords' test.out

#- 158 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'x3kJG7KA' \
    --action 'CREATE' \
    --itemSku 'wQ5k3sFL' \
    --itemType 'MEDIA' \
    --type 'CATEGORY' \
    --updatedAtEnd '6dq6a2LY' \
    --updatedAtStart 'i6mdp4Ls' \
    > test.out 2>&1
eval_tap $? 158 'GetStatistic' test.out

#- 159 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '60FK2s1x' \
    > test.out 2>&1
eval_tap $? 159 'UnselectAllRecords' test.out

#- 160 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '5LEDbc7E' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fxcXJsf6' \
    > test.out 2>&1
eval_tap $? 160 'SelectRecord' test.out

#- 161 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'vWb2w30g' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Uy1JML7z' \
    > test.out 2>&1
eval_tap $? 161 'UnselectRecord' test.out

#- 162 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BBHlpGcr' \
    --targetStoreId 'CYGNvZiS' \
    > test.out 2>&1
eval_tap $? 162 'CloneStore' test.out

#- 163 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sK4GdsdW' \
    > test.out 2>&1
eval_tap $? 163 'ExportStore' test.out

#- 164 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'VRCL6tgM' \
    --limit '14' \
    --offset '52' \
    --sku '9biCT3oR' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId 'PzI3W8EE' \
    > test.out 2>&1
eval_tap $? 164 'QuerySubscriptions' test.out

#- 165 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rxIiFfzk' \
    > test.out 2>&1
eval_tap $? 165 'RecurringChargeSubscription' test.out

#- 166 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'IScXLbOd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 166 'GetTicketDynamic' test.out

#- 167 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'fF8B7snI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "hwmc1qE6"}' \
    > test.out 2>&1
eval_tap $? 167 'DecreaseTicketSale' test.out

#- 168 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '8Ekc9S8A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 168 'GetTicketBoothID' test.out

#- 169 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'tUB1SY9x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 27, "orderNo": "Wvg6HnqJ"}' \
    > test.out 2>&1
eval_tap $? 169 'IncreaseTicketSale' test.out

#- 170 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'OQPxeOWr' \
    --body '{"achievements": [{"id": "0bKHFwy8", "value": 12}, {"id": "OgDP3kOl", "value": 67}, {"id": "fUCyEAzN", "value": 70}], "steamUserId": "eWl8X4PK"}' \
    > test.out 2>&1
eval_tap $? 170 'UnlockSteamUserAchievement' test.out

#- 171 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZE4i9Qo' \
    --xboxUserId 'Jndwilzt' \
    > test.out 2>&1
eval_tap $? 171 'GetXblUserAchievements' test.out

#- 172 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'mFm3efnH' \
    --body '{"achievements": [{"id": "enujC7nv", "percentComplete": 41}, {"id": "OZFAyjuv", "percentComplete": 51}, {"id": "e6hkGDaQ", "percentComplete": 19}], "serviceConfigId": "908R1pjS", "titleId": "74PIEmLy", "xboxUserId": "PQ6bqMYd"}' \
    > test.out 2>&1
eval_tap $? 172 'UpdateXblUserAchievement' test.out

#- 173 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'veJ0xc52' \
    > test.out 2>&1
eval_tap $? 173 'AnonymizeCampaign' test.out

#- 174 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '6UcI0wck' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeEntitlement' test.out

#- 175 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'diqPFnEk' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeFulfillment' test.out

#- 176 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '3gOjXnP1' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeIntegration' test.out

#- 177 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kh619zD9' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeOrder' test.out

#- 178 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'm3S3huvv' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizePayment' test.out

#- 179 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ExWfVtm4' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizeSubscription' test.out

#- 180 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'TBRLd0hs' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeWallet' test.out

#- 181 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '1fl8jvIq' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'qMTXmdmE' \
    --features 'FH9LIMUC,uLgeGKHb,j7Y8XHSl' \
    --itemId 'sXp4dIbz,7X6PXi03,0pp36yJH' \
    --limit '98' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 181 'QueryUserEntitlements' test.out

#- 182 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '86ArMXtU' \
    --body '[{"endDate": "1978-10-31T00:00:00Z", "grantedCode": "uifiWJAO", "itemId": "SrnRlMAa", "itemNamespace": "Zxg2hW1c", "language": "YNG-dDMZ-ZN", "quantity": 46, "region": "wXH5JIPm", "source": "REWARD", "startDate": "1980-12-30T00:00:00Z", "storeId": "cVAMoMZH"}, {"endDate": "1983-09-11T00:00:00Z", "grantedCode": "oWnVjZ1h", "itemId": "dLHzAu3d", "itemNamespace": "ycSu730d", "language": "cO_URHE", "quantity": 14, "region": "UORFpNtP", "source": "GIFT", "startDate": "1971-04-10T00:00:00Z", "storeId": "nuSjVxtD"}, {"endDate": "1983-06-01T00:00:00Z", "grantedCode": "obkiNwU9", "itemId": "kxHxEO3a", "itemNamespace": "xLjmhfo5", "language": "IUo-DRVT", "quantity": 94, "region": "ZHjhipAE", "source": "REWARD", "startDate": "1986-06-22T00:00:00Z", "storeId": "Y9rilBVG"}]' \
    > test.out 2>&1
eval_tap $? 182 'GrantUserEntitlement' test.out

#- 183 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'f9nYs3Cu' \
    --activeOnly  \
    --appId 'og8Seg3X' \
    > test.out 2>&1
eval_tap $? 183 'GetUserAppEntitlementByAppId' test.out

#- 184 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'hqrXPl6x' \
    --activeOnly  \
    --limit '10' \
    --offset '11' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 184 'QueryUserEntitlementsByAppType' test.out

#- 185 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JdFnjhZp' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId 'M987LEN5' \
    > test.out 2>&1
eval_tap $? 185 'GetUserEntitlementByItemId' test.out

#- 186 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'eAxPBBe9' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'VHwu8sMR' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementBySku' test.out

#- 187 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9Q93nIv' \
    --appIds 'Chj7CHbz,jdTxtoD4,gK7Qqyu5' \
    --itemIds '7ES3bdzN,6qey1Jsh,zzfA1iVR' \
    --skus 'pMNGiSBa,yVdk86Ii,Xq4BIKm1' \
    > test.out 2>&1
eval_tap $? 187 'ExistsAnyUserActiveEntitlement' test.out

#- 188 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'oiwlXgKS' \
    --itemIds 'lJ8tusDB,dczr6cI6,3oQlccTs' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 189 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '2WLs4K35' \
    --appId 'aG2MFOEm' \
    > test.out 2>&1
eval_tap $? 189 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 190 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JfeiNVjJ' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'Go9y5fJv' \
    > test.out 2>&1
eval_tap $? 190 'GetUserEntitlementOwnershipByItemId' test.out

#- 191 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'QHmWIYCZ' \
    --ids '0xfKopji,NuAckDxs,bQ3hQ4fB' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemIds' test.out

#- 192 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZPs8ULY' \
    --entitlementClazz 'MEDIA' \
    --sku 'Ml53eVef' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipBySku' test.out

#- 193 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '4L8NsgOn' \
    --entitlementIds 'Gp0yGi5c' \
    > test.out 2>&1
eval_tap $? 193 'RevokeUserEntitlements' test.out

#- 194 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '3NLMlT8T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'H63Kz4Nf' \
    > test.out 2>&1
eval_tap $? 194 'GetUserEntitlement' test.out

#- 195 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'DPfj3Ogr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZPmqFs4' \
    --body '{"endDate": "1979-03-02T00:00:00Z", "nullFieldList": ["jwnRHvUU", "YMsk2OBj", "cPmEON4H"], "startDate": "1973-04-20T00:00:00Z", "status": "INACTIVE", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateUserEntitlement' test.out

#- 196 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 't5eTajUd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eegIsbxb' \
    --body '{"options": ["ZnvUSK4a", "PpP8wEG7", "se1Qfwiv"], "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 196 'ConsumeUserEntitlement' test.out

#- 197 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'fZmZ9R1r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PmJJcaCJ' \
    > test.out 2>&1
eval_tap $? 197 'DisableUserEntitlement' test.out

#- 198 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'kNfPMC00' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mZfjbLoW' \
    > test.out 2>&1
eval_tap $? 198 'EnableUserEntitlement' test.out

#- 199 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'uW93LS3Z' \
    --namespace "$AB_NAMESPACE" \
    --userId '3BRzrhPP' \
    > test.out 2>&1
eval_tap $? 199 'GetUserEntitlementHistories' test.out

#- 200 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'hA43EBZe' \
    --namespace "$AB_NAMESPACE" \
    --userId '4857k9PH' \
    > test.out 2>&1
eval_tap $? 200 'RevokeUserEntitlement' test.out

#- 201 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wzkqAWUK' \
    --body '{"duration": 54, "endDate": "1980-01-21T00:00:00Z", "itemId": "1B4HBekV", "itemSku": "97PpAw7I", "language": "kZ2HfpVP", "order": {"currency": {"currencyCode": "e5tSIExj", "currencySymbol": "7nZfeNpr", "currencyType": "REAL", "decimals": 83, "namespace": "8k2cChDn"}, "ext": {"Ej4tBg9z": {}, "CAsJUBjI": {}, "BXc6ADhM": {}}, "free": true}, "orderNo": "v8VuZ3rq", "origin": "Steam", "quantity": 60, "region": "wDx6omGP", "source": "OTHER", "startDate": "1997-12-09T00:00:00Z", "storeId": "yuSdqSmT"}' \
    > test.out 2>&1
eval_tap $? 201 'FulfillItem' test.out

#- 202 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'BpRtVcPM' \
    --body '{"code": "dQjNuigt", "language": "lkwz_Thzo-MY", "region": "UuoU8BTG"}' \
    > test.out 2>&1
eval_tap $? 202 'RedeemCode' test.out

#- 203 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'BgKnEP4l' \
    --body '{"origin": "System", "rewards": [{"currency": {"currencyCode": "hESwQBue", "namespace": "b1UNcrwY"}, "item": {"itemId": "tf6o4YVv", "itemSku": "b3NiZnTL", "itemType": "4QEQPoZH"}, "quantity": 18, "type": "ITEM"}, {"currency": {"currencyCode": "HvGj124R", "namespace": "XnQPiRxA"}, "item": {"itemId": "R7OACeSH", "itemSku": "NmxqrH3s", "itemType": "UHk11Gop"}, "quantity": 12, "type": "ITEM"}, {"currency": {"currencyCode": "MSnPS79t", "namespace": "box0THVA"}, "item": {"itemId": "VAn5PoGa", "itemSku": "2fkHhDhU", "itemType": "BYVjesPK"}, "quantity": 30, "type": "ITEM"}], "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 203 'FulfillRewards' test.out

#- 204 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '3PlyeAfn' \
    --endTime 'TdWpmBJn' \
    --limit '79' \
    --offset '99' \
    --productId 'X1mXspzf' \
    --startTime 'WvITM71l' \
    --status 'FAILED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 204 'QueryUserIAPOrders' test.out

#- 205 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'j18qA1g4' \
    > test.out 2>&1
eval_tap $? 205 'QueryAllUserIAPOrders' test.out

#- 206 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'GH9qEsQc' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "ld_ugwE", "productId": "xQ723JxU", "region": "DjWVNEaw", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 206 'MockFulfillIAPItem' test.out

#- 207 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bao2HBoH' \
    --itemId 'LsZndKa4' \
    --limit '74' \
    --offset '1' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserOrders' test.out

#- 208 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'uFmhg6hW' \
    --body '{"currencyCode": "FjNwOyJW", "currencyNamespace": "1hKLvmaR", "discountedPrice": 93, "ext": {"s5XAyBIB": {}, "s3UvlCZ1": {}, "Z5Hos9eR": {}}, "itemId": "IhOxADQv", "language": "rUEEAJLp", "options": {"skipPriceValidation": true}, "platform": "Xbox", "price": 33, "quantity": 42, "region": "xpi1VYEx", "returnUrl": "6wYffaww", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 208 'AdminCreateUserOrder' test.out

#- 209 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'lLEEerNK' \
    --itemId 'CjfLPGzp' \
    > test.out 2>&1
eval_tap $? 209 'CountOfPurchasedItem' test.out

#- 210 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cSUBKDjh' \
    --userId 'kTZRjJug' \
    > test.out 2>&1
eval_tap $? 210 'GetUserOrder' test.out

#- 211 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'epGmPqPW' \
    --userId 'fJXsPsaA' \
    --body '{"status": "REFUNDED", "statusReason": "18IcvLge"}' \
    > test.out 2>&1
eval_tap $? 211 'UpdateUserOrderStatus' test.out

#- 212 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hqojVo7m' \
    --userId 'BHEGkSCm' \
    > test.out 2>&1
eval_tap $? 212 'FulfillUserOrder' test.out

#- 213 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xK66E2LY' \
    --userId 'BK3UEi3Y' \
    > test.out 2>&1
eval_tap $? 213 'GetUserOrderGrant' test.out

#- 214 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Ab3nklxK' \
    --userId 'iEeUR5hr' \
    > test.out 2>&1
eval_tap $? 214 'GetUserOrderHistories' test.out

#- 215 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UWwhhXMz' \
    --userId 'miOe28MI' \
    --body '{"additionalData": {"cardSummary": "Aa1ye2yx"}, "authorisedTime": "1984-06-30T00:00:00Z", "chargebackReversedTime": "1982-03-25T00:00:00Z", "chargebackTime": "1973-09-03T00:00:00Z", "chargedTime": "1980-12-12T00:00:00Z", "createdTime": "1986-02-03T00:00:00Z", "currency": {"currencyCode": "DUOewbUG", "currencySymbol": "lICosJVW", "currencyType": "REAL", "decimals": 60, "namespace": "aGmnXpt4"}, "customParameters": {"NmjTHF7O": {}, "BT8OPUhs": {}, "Fs4jJSCR": {}}, "extOrderNo": "Jylb1WGO", "extTxId": "6ZPXVRaV", "extUserId": "CCE7vJmd", "issuedAt": "1976-09-05T00:00:00Z", "metadata": {"tcoVsmbC": "w5lKKzsX", "epEHc7QC": "Pau9UHyQ", "zcOpSpN7": "fc4ZJjCF"}, "namespace": "KyvkPcQg", "nonceStr": "hn5hvOVF", "paymentMethod": "JWYXqeig", "paymentMethodFee": 27, "paymentOrderNo": "pKdBvP1W", "paymentProvider": "STRIPE", "paymentProviderFee": 70, "paymentStationUrl": "oy5G0X7p", "price": 12, "refundedTime": "1975-03-12T00:00:00Z", "salesTax": 78, "sandbox": true, "sku": "AyAin8OP", "status": "REFUNDED", "statusReason": "GRdZ6KYs", "subscriptionId": "kUmWZMM0", "subtotalPrice": 50, "targetNamespace": "5tPdSOBs", "targetUserId": "gU3sP9EH", "tax": 20, "totalPrice": 63, "totalTax": 81, "txEndTime": "1990-04-24T00:00:00Z", "type": "qL8x1fVP", "userId": "Iq4dNWv5", "vat": 26}' \
    > test.out 2>&1
eval_tap $? 215 'ProcessUserOrderNotification' test.out

#- 216 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'fgnHhFK0' \
    --userId 'ibeOfIej' \
    > test.out 2>&1
eval_tap $? 216 'DownloadUserOrderReceipt' test.out

#- 217 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'sdOm16gi' \
    --body '{"currencyCode": "WbcTYAY6", "currencyNamespace": "lJOa8Lrj", "customParameters": {"vFeuwnVP": {}, "QEOwu489": {}, "1DBE0aBs": {}}, "description": "D0z7lptr", "extOrderNo": "eWh59ymo", "extUserId": "pp2jYchh", "itemType": "CODE", "language": "EWY", "metadata": {"cNgLIONi": "x3vIin3n", "orc6UGUk": "ONMnBe8P", "8thBe2QD": "0IJjQzNT"}, "notifyUrl": "ezPpNAnN", "omitNotification": false, "platform": "8L4jBC8t", "price": 90, "recurringPaymentOrderNo": "XL0r5qOv", "region": "x8JRFvsz", "returnUrl": "3rZenetO", "sandbox": true, "sku": "J66zqhUq", "subscriptionId": "T7oAOQeV", "title": "zCnW51Hd"}' \
    > test.out 2>&1
eval_tap $? 217 'CreateUserPaymentOrder' test.out

#- 218 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'k9ePIwFR' \
    --userId 'gyw1HdsX' \
    --body '{"description": "e56XYDxc"}' \
    > test.out 2>&1
eval_tap $? 218 'RefundUserPaymentOrder' test.out

#- 219 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'zF7WX7dN' \
    --body '{"code": "gqmIBgAN", "orderNo": "1bfz3wKc"}' \
    > test.out 2>&1
eval_tap $? 219 'ApplyUserRedemption' test.out

#- 220 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'w41VnLLq' \
    --chargeStatus 'CHARGED' \
    --itemId 'S1HZ27Ux' \
    --limit '78' \
    --offset '20' \
    --sku 'dd58qPHY' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserSubscriptions' test.out

#- 221 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cxy0SrGG' \
    --excludeSystem  \
    --limit '81' \
    --offset '16' \
    --subscriptionId 'GVbPIe7u' \
    > test.out 2>&1
eval_tap $? 221 'GetUserSubscriptionActivities' test.out

#- 222 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '4Qiuk7qC' \
    --body '{"grantDays": 1, "itemId": "ezRDOt99", "language": "JMOthnqr", "reason": "g0wC4RtF", "region": "i2zE6s0j", "source": "A714r6at"}' \
    > test.out 2>&1
eval_tap $? 222 'PlatformSubscribeSubscription' test.out

#- 223 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'foeI2wmm' \
    --itemId '7VZag584' \
    > test.out 2>&1
eval_tap $? 223 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 224 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'KolO0QWM' \
    --userId 'x0Fuj5eO' \
    > test.out 2>&1
eval_tap $? 224 'GetUserSubscription' test.out

#- 225 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8YmKP89P' \
    --userId 'ArK9abzm' \
    > test.out 2>&1
eval_tap $? 225 'DeleteUserSubscription' test.out

#- 226 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'NjMbsHEz' \
    --userId 'g0duumS1' \
    --force  \
    --body '{"immediate": true, "reason": "YxH9Edwx"}' \
    > test.out 2>&1
eval_tap $? 226 'CancelSubscription' test.out

#- 227 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'JFfDaljc' \
    --userId 'vH3l76yx' \
    --body '{"grantDays": 43, "reason": "Kb6rnqPw"}' \
    > test.out 2>&1
eval_tap $? 227 'GrantDaysToSubscription' test.out

#- 228 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DtIDMHCL' \
    --userId 'mqBWyErh' \
    --excludeFree  \
    --limit '68' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 228 'GetUserSubscriptionBillingHistories' test.out

#- 229 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'koVgNRZn' \
    --userId 'XgLArVrD' \
    --body '{"additionalData": {"cardSummary": "SLwmhLKC"}, "authorisedTime": "1976-06-19T00:00:00Z", "chargebackReversedTime": "1993-09-01T00:00:00Z", "chargebackTime": "1993-04-16T00:00:00Z", "chargedTime": "1998-12-08T00:00:00Z", "createdTime": "1983-04-18T00:00:00Z", "currency": {"currencyCode": "sIWO3Oie", "currencySymbol": "ExuD2XXl", "currencyType": "REAL", "decimals": 21, "namespace": "cCBznalp"}, "customParameters": {"JAzLfCkR": {}, "U5d4HLTI": {}, "7Ki3p79P": {}}, "extOrderNo": "uLgKW6qy", "extTxId": "ORw4VLds", "extUserId": "CNTD0umB", "issuedAt": "1977-12-20T00:00:00Z", "metadata": {"3Q1Vxq4l": "zLaNISv3", "JpO3Mvrj": "ehyUunia", "sHHxVgc8": "O4edis2y"}, "namespace": "5RmBr6XJ", "nonceStr": "KYRmskhS", "paymentMethod": "i4eNiHE4", "paymentMethodFee": 5, "paymentOrderNo": "iQWpq0oU", "paymentProvider": "PAYPAL", "paymentProviderFee": 34, "paymentStationUrl": "HktbtUuI", "price": 19, "refundedTime": "1994-02-22T00:00:00Z", "salesTax": 43, "sandbox": false, "sku": "zZ5Lc0QP", "status": "DELETED", "statusReason": "O4OrunC5", "subscriptionId": "vE1mBwDD", "subtotalPrice": 24, "targetNamespace": "bx04CmB1", "targetUserId": "piAe5HdX", "tax": 26, "totalPrice": 29, "totalTax": 12, "txEndTime": "1975-09-19T00:00:00Z", "type": "2LKuwuS7", "userId": "HWKvPHBK", "vat": 97}' \
    > test.out 2>&1
eval_tap $? 229 'ProcessUserSubscriptionNotification' test.out

#- 230 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'c9VbUWsl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NGHmvzVH' \
    --body '{"count": 98, "orderNo": "ZcSJiaiT"}' \
    > test.out 2>&1
eval_tap $? 230 'AcquireUserTicket' test.out

#- 231 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'ItSUY3xv' \
    > test.out 2>&1
eval_tap $? 231 'QueryUserCurrencyWallets' test.out

#- 232 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'vrqYWghB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwnuwSP0' \
    --limit '2' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 232 'ListUserCurrencyTransactions' test.out

#- 233 CheckWallet
eval_tap 0 233 'CheckWallet # SKIP deprecated' test.out

#- 234 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'fqGTyOXW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XtitBByx' \
    --body '{"amount": 79, "expireAt": "1990-06-11T00:00:00Z", "origin": "Steam", "reason": "RqFX5UUc", "source": "REFUND"}' \
    > test.out 2>&1
eval_tap $? 234 'CreditUserWallet' test.out

#- 235 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'JCyjZffK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XEo41O7l' \
    --body '{"amount": 23, "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 235 'PayWithUserWallet' test.out

#- 236 GetUserWallet
eval_tap 0 236 'GetUserWallet # SKIP deprecated' test.out

#- 237 DebitUserWallet
eval_tap 0 237 'DebitUserWallet # SKIP deprecated' test.out

#- 238 DisableUserWallet
eval_tap 0 238 'DisableUserWallet # SKIP deprecated' test.out

#- 239 EnableUserWallet
eval_tap 0 239 'EnableUserWallet # SKIP deprecated' test.out

#- 240 ListUserWalletTransactions
eval_tap 0 240 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 241 QueryWallets
eval_tap 0 241 'QueryWallets # SKIP deprecated' test.out

#- 242 GetWallet
eval_tap 0 242 'GetWallet # SKIP deprecated' test.out

#- 243 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'BTJ2tYXN' \
    --end 'bEJRZYfB' \
    --start 'a0oPzbgF' \
    > test.out 2>&1
eval_tap $? 243 'SyncOrders' test.out

#- 244 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["5I2yVwrU", "NnQMDstZ", "A5Ntw9Hi"], "apiKey": "rMII9rx3", "authoriseAsCapture": false, "blockedPaymentMethods": ["kXjRRwmw", "Vvq9AYva", "zlvWSCAR"], "clientKey": "MZEdSkJs", "dropInSettings": "y2TAwMtS", "liveEndpointUrlPrefix": "HBeymurI", "merchantAccount": "EioOdnhQ", "notificationHmacKey": "kbgwmiSZ", "notificationPassword": "GKPw3EPs", "notificationUsername": "spOLmjJ9", "returnUrl": "oD5SNOSw", "settings": "K9Aklxq7"}' \
    > test.out 2>&1
eval_tap $? 244 'TestAdyenConfig' test.out

#- 245 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "N7EQJ81L", "privateKey": "NMJViAZU", "publicKey": "Q5MrsnZF", "returnUrl": "EPLjJJTU"}' \
    > test.out 2>&1
eval_tap $? 245 'TestAliPayConfig' test.out

#- 246 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "6rRcZn9g", "secretKey": "pecmYTEI"}' \
    > test.out 2>&1
eval_tap $? 246 'TestCheckoutConfig' test.out

#- 247 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'omDCs5vA' \
    > test.out 2>&1
eval_tap $? 247 'DebugMatchedPaymentMerchantConfig' test.out

#- 248 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "Sb1mnjbG", "clientSecret": "RjtVdESc", "returnUrl": "x99L3FmX", "webHookId": "e0J7wM4F"}' \
    > test.out 2>&1
eval_tap $? 248 'TestPayPalConfig' test.out

#- 249 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["4KleaVH3", "Tt0iBm6M", "vR1Jf3te"], "publishableKey": "ylwUTH8d", "secretKey": "DANUpb8I", "webhookSecret": "FULcighd"}' \
    > test.out 2>&1
eval_tap $? 249 'TestStripeConfig' test.out

#- 250 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "XXPcmy8f", "key": "AUIKYYA6", "mchid": "mTySDGro", "returnUrl": "2zyOJPun"}' \
    > test.out 2>&1
eval_tap $? 250 'TestWxPayConfig' test.out

#- 251 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "VYTj62j0", "flowCompletionUrl": "hZ5Smm3h", "merchantId": 98, "projectId": 61, "projectSecretKey": "rFknD3Vc"}' \
    > test.out 2>&1
eval_tap $? 251 'TestXsollaConfig' test.out

#- 252 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'WVnI5qyT' \
    > test.out 2>&1
eval_tap $? 252 'GetPaymentMerchantConfig' test.out

#- 253 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'bm3cmnyM' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["uLEwTald", "OwzGp1PB", "QRX7iv12"], "apiKey": "ac49nsYf", "authoriseAsCapture": false, "blockedPaymentMethods": ["AnRzDPhn", "2nOXpdQo", "601Z27Ua"], "clientKey": "r6SDgC79", "dropInSettings": "THj65Ewe", "liveEndpointUrlPrefix": "sZvc5o28", "merchantAccount": "CdnxqtS8", "notificationHmacKey": "YuzLDXm9", "notificationPassword": "2OKWni1D", "notificationUsername": "Ubj03AZ8", "returnUrl": "13ED4hQw", "settings": "rY1Gfgyo"}' \
    > test.out 2>&1
eval_tap $? 253 'UpdateAdyenConfig' test.out

#- 254 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'vYMKpAqH' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 254 'TestAdyenConfigById' test.out

#- 255 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'GVU7zQJ7' \
    --sandbox  \
    --validate  \
    --body '{"appId": "jBlommUW", "privateKey": "gu0QcJdy", "publicKey": "Fc5AsFyY", "returnUrl": "sGnSFsBv"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateAliPayConfig' test.out

#- 256 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'EQlF5VhL' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 256 'TestAliPayConfigById' test.out

#- 257 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'fn3dBqto' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "EkcvrxJt", "secretKey": "dBke59pZ"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateCheckoutConfig' test.out

#- 258 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'OypYCtS2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestCheckoutConfigById' test.out

#- 259 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'lKGGlF0w' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "CDYojDgC", "clientSecret": "NnYo9f5m", "returnUrl": "HhymV8DD", "webHookId": "9cYYyg9z"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdatePayPalConfig' test.out

#- 260 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'xqiJatg1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestPayPalConfigById' test.out

#- 261 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'hlNwmwUU' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["1jbP2uAL", "GuTiOEdx", "XZ5aIAsj"], "publishableKey": "yDebfkWO", "secretKey": "16xRzIEO", "webhookSecret": "Spd2nYO4"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateStripeConfig' test.out

#- 262 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'sizx3t2w' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestStripeConfigById' test.out

#- 263 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'tBb5hkV9' \
    --validate  \
    --body '{"appId": "WdAfKCUR", "key": "9ezcDMUV", "mchid": "RHD2ox1z", "returnUrl": "VR07oReR"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateWxPayConfig' test.out

#- 264 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'VhVvnVMc' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 264 'UpdateWxPayConfigCert' test.out

#- 265 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '8h4aSs8l' \
    > test.out 2>&1
eval_tap $? 265 'TestWxPayConfigById' test.out

#- 266 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'u774UpwV' \
    --validate  \
    --body '{"apiKey": "60zKSNdR", "flowCompletionUrl": "slG2GDVC", "merchantId": 10, "projectId": 24, "projectSecretKey": "L73r4Nm0"}' \
    > test.out 2>&1
eval_tap $? 266 'UpdateXsollaConfig' test.out

#- 267 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'ADbUGx1o' \
    > test.out 2>&1
eval_tap $? 267 'TestXsollaConfigById' test.out

#- 268 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'SBg7lODC' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateXsollaUIConfig' test.out

#- 269 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '0' \
    --namespace "$AB_NAMESPACE" \
    --offset '5' \
    --region 'AgDXYA3F' \
    > test.out 2>&1
eval_tap $? 269 'QueryPaymentProviderConfig' test.out

#- 270 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "nIK8wzv7", "region": "bDPjsSmE", "sandboxTaxJarApiToken": "wCO4Wy5h", "specials": ["WALLET", "ALIPAY", "ADYEN"], "taxJarApiToken": "YFaKnztN", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 270 'CreatePaymentProviderConfig' test.out

#- 271 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 271 'GetAggregatePaymentProviders' test.out

#- 272 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'P9SHDAx7' \
    > test.out 2>&1
eval_tap $? 272 'DebugMatchedPaymentProviderConfig' test.out

#- 273 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 273 'GetSpecialPaymentProviders' test.out

#- 274 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'zxcfS6Kw' \
    --body '{"aggregate": "XSOLLA", "namespace": "I8zqKyJQ", "region": "xA20E0Yy", "sandboxTaxJarApiToken": "IbDFpGl3", "specials": ["ALIPAY", "WXPAY", "XSOLLA"], "taxJarApiToken": "JtohY8Ga", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 274 'UpdatePaymentProviderConfig' test.out

#- 275 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'HnBbladw' \
    > test.out 2>&1
eval_tap $? 275 'DeletePaymentProviderConfig' test.out

#- 276 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 276 'GetPaymentTaxConfig' test.out

#- 277 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "ncoVhCwu", "taxJarApiToken": "Ykb5GBcf", "taxJarEnabled": true, "taxJarProductCodesMapping": {"m45bgq9O": "RbQFV6s9", "Ry0jyciR": "zKt3V6cb", "1n90jHb4": "uZHKyAL8"}}' \
    > test.out 2>&1
eval_tap $? 277 'UpdatePaymentTaxConfig' test.out

#- 278 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'dAcdHqC7' \
    --end 'rFQh8ueR' \
    --start 'erHq9aDn' \
    > test.out 2>&1
eval_tap $? 278 'SyncPaymentOrders' test.out

#- 279 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'X76782Ug' \
    --storeId 'N87fruyv' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetRootCategories' test.out

#- 280 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'e3wVOfJn' \
    --storeId 'UQF7QmJy' \
    > test.out 2>&1
eval_tap $? 280 'DownloadCategories' test.out

#- 281 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'TdLkT6F6' \
    --namespace "$AB_NAMESPACE" \
    --language 'ZQtcRK4N' \
    --storeId 'vjZDUJlf' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetCategory' test.out

#- 282 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'hpHtxTh6' \
    --namespace "$AB_NAMESPACE" \
    --language 'IsCaAJKS' \
    --storeId '2W0mj3No' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetChildCategories' test.out

#- 283 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'C7O2Khss' \
    --namespace "$AB_NAMESPACE" \
    --language 'lzs7uBF1' \
    --storeId '8OZuuQ4y' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetDescendantCategories' test.out

#- 284 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 284 'PublicListCurrencies' test.out

#- 285 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'uzjICnUv' \
    --region 'celCygWX' \
    --storeId '0dLrxkqr' \
    --appId 'CWdkMGwz' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetItemByAppId' test.out

#- 286 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --baseAppId 'KXbrJJVz' \
    --categoryPath 'V2pu74of' \
    --features '0l1xnQLT' \
    --itemType 'INGAMEITEM' \
    --language 'p1fSEfje' \
    --limit '32' \
    --offset '57' \
    --region '4ytBIay8' \
    --sortBy 'displayOrder:asc,updatedAt:desc,updatedAt:asc' \
    --storeId 'XFNhS9EN' \
    --tags 'HCR9GF8K' \
    > test.out 2>&1
eval_tap $? 286 'PublicQueryItems' test.out

#- 287 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'NWadAogM' \
    --region 'lz7RWk2G' \
    --storeId 'V8FLBleN' \
    --sku 'dWvNUtAi' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetItemBySku' test.out

#- 288 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'vvbze6F1' \
    --region 'vA8Q3TmO' \
    --storeId '8a0MutFO' \
    --itemIds 'hmbZYk18' \
    > test.out 2>&1
eval_tap $? 288 'PublicBulkGetItems' test.out

#- 289 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["NL4R7sCp", "44sWjOpK", "P5DWo16T"]}' \
    > test.out 2>&1
eval_tap $? 289 'PublicValidateItemPurchaseCondition' test.out

#- 290 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'BUNDLE' \
    --limit '43' \
    --offset '49' \
    --region 'tLmHeiEv' \
    --storeId 'Gx2YZDDA' \
    --keyword 'ayFRpdR3' \
    --language 'f4Ir7qwt' \
    > test.out 2>&1
eval_tap $? 290 'PublicSearchItems' test.out

#- 291 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'L0UooKP9' \
    --namespace "$AB_NAMESPACE" \
    --language 'nePGTnq1' \
    --region 'YZDxcTAY' \
    --storeId 'gFmjT6LG' \
    > test.out 2>&1
eval_tap $? 291 'PublicGetApp' test.out

#- 292 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'dKQnUYyv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 292 'PublicGetItemDynamicData' test.out

#- 293 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'HtAsp4My' \
    --namespace "$AB_NAMESPACE" \
    --language 'ItQDCGcq' \
    --populateBundle  \
    --region 'eulhBbas' \
    --storeId 'qf32HN8Z' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetItem' test.out

#- 294 GetPaymentCustomization
eval_tap 0 294 'GetPaymentCustomization # SKIP deprecated' test.out

#- 295 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "H7H7NrQQ", "paymentProvider": "ALIPAY", "returnUrl": "uzFP7xyG", "ui": "aGzbIuaR", "zipCode": "9unGpg1B"}' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetPaymentUrl' test.out

#- 296 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pYO5iVOJ' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetPaymentMethods' test.out

#- 297 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'O6v7PnQW' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetUnpaidPaymentOrder' test.out

#- 298 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 's9bsQQc9' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'clm4r9Gx' \
    --body '{"token": "YxcEAKAE"}' \
    > test.out 2>&1
eval_tap $? 298 'Pay' test.out

#- 299 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cKqcNyvm' \
    > test.out 2>&1
eval_tap $? 299 'PublicCheckPaymentOrderPaidStatus' test.out

#- 300 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region '46kPCbpw' \
    > test.out 2>&1
eval_tap $? 300 'GetPaymentPublicConfig' test.out

#- 301 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'lKDAwBpg' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetQRCode' test.out

#- 302 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'DXxC3Vg8' \
    --foreinginvoice 'qlUlkoWs' \
    --invoiceId 'QxZ3DBis' \
    --payload 'mbsB22Jz' \
    --redirectResult '5C6sUg1S' \
    --resultCode '7mgT4nw6' \
    --sessionId '6vHblk0e' \
    --status '95ZBWAn6' \
    --token '52pXs66J' \
    --type 'TdRCamJv' \
    --userId 'NVsApUgD' \
    --orderNo 'M9DkJRa2' \
    --paymentOrderNo '2L5g5X8l' \
    --paymentProvider 'PAYPAL' \
    --returnUrl '2XAM2M5f' \
    > test.out 2>&1
eval_tap $? 302 'PublicNormalizePaymentReturnUrl' test.out

#- 303 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode '5Cia896o' \
    --paymentOrderNo 'idAz0Ds6' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 303 'GetPaymentTaxValue' test.out

#- 304 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'jZIJUNxp' \
    > test.out 2>&1
eval_tap $? 304 'GetRewardByCode' test.out

#- 305 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Ylt9ZfsN' \
    --limit '91' \
    --offset '86' \
    --sortBy 'rewardCode:desc,namespace:asc' \
    > test.out 2>&1
eval_tap $? 305 'QueryRewards1' test.out

#- 306 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'fXYfIFvR' \
    > test.out 2>&1
eval_tap $? 306 'GetReward1' test.out

#- 307 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 307 'PublicListStores' test.out

#- 308 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'b6reRZ3B,tfZhiGh6,LYYmGgVj' \
    --itemIds 'IZi8oPDF,u2DFAWMv,J57GZsZk' \
    --skus 'YrPGPN0h,vVpehzLY,x21Vl2Kp' \
    > test.out 2>&1
eval_tap $? 308 'PublicExistsAnyMyActiveEntitlement' test.out

#- 309 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'YLi8abXR' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 310 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'S3fgm1pw' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 311 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'KNPel06T' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 312 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '7GTwVsJb,6VTGNSJp,YZUHQAAW' \
    --itemIds 'mcRrZGOR,GM3pPFKV,F3kAwl9s' \
    --skus 'K6NwcLEE,I7iOx41H,9FXFcC4U' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetEntitlementOwnershipToken' test.out

#- 313 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'NskAEc5O' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyWallet' test.out

#- 314 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '9WY7pFu6' \
    --body '{"epicGamesJwtToken": "0iEkvIBk"}' \
    > test.out 2>&1
eval_tap $? 314 'SyncEpicGameDLC' test.out

#- 315 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Okir2pQh' \
    --body '{"serviceLabel": 73}' \
    > test.out 2>&1
eval_tap $? 315 'PublicSyncPsnDlcInventory' test.out

#- 316 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'CeSkd72O' \
    --body '{"appId": "YPIWMCBJ", "steamId": "a8DicEwd"}' \
    > test.out 2>&1
eval_tap $? 316 'SyncSteamDLC' test.out

#- 317 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'C4ooFgrG' \
    --body '{"xstsToken": "su57aM4G"}' \
    > test.out 2>&1
eval_tap $? 317 'SyncXboxDLC' test.out

#- 318 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'fVzu86Ig' \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'FYs5M3IJ' \
    --features 'JOs5FqnZ,BPQtqrvL,CNKmkd30' \
    --itemId 'BtkRGb3T,Mm8mHbTg,kAVJ4r5t' \
    --limit '90' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 318 'PublicQueryUserEntitlements' test.out

#- 319 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ermQ5sfJ' \
    --appId 'A0xIw7dT' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserAppEntitlementByAppId' test.out

#- 320 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '5KZSUxoA' \
    --limit '71' \
    --offset '60' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 320 'PublicQueryUserEntitlementsByAppType' test.out

#- 321 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hgk2yJqg' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'GzOCQgVO' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetUserEntitlementByItemId' test.out

#- 322 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LA8ba5NZ' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'a3e3kn12' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserEntitlementBySku' test.out

#- 323 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '9vv3Mnzf' \
    --appIds 'WgCvq77H,0k2uPxOV,xqIFhce4' \
    --itemIds 'AkTvebcp,BaqSBXpK,Q8QIgykv' \
    --skus 'RYp3j2vs,PlS2NXD2,7O3LN3bD' \
    > test.out 2>&1
eval_tap $? 323 'PublicExistsAnyUserActiveEntitlement' test.out

#- 324 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODKN2QX1' \
    --appId 'PVUs8BYr' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 325 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'he5agXxH' \
    --entitlementClazz 'APP' \
    --itemId 'tjgJLuuq' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 326 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kqh0t9YZ' \
    --ids 'Lf9jj2Fm,vXjTLvRK,gTjkfzR3' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 327 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '1GSYGHSH' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'Gq9PvtZ2' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 328 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'N2y8E4NC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dpSjVorD' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlement' test.out

#- 329 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'vfd3YFmZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lTHwSkC4' \
    --body '{"options": ["YMS3u51G", "2bLhhRPJ", "TTrRzQPJ"], "useCount": 52}' \
    > test.out 2>&1
eval_tap $? 329 'PublicConsumeUserEntitlement' test.out

#- 330 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lu5YH8Wx' \
    --body '{"code": "P8vUfNab", "language": "Yt_571", "region": "G5Azthol"}' \
    > test.out 2>&1
eval_tap $? 330 'PublicRedeemCode' test.out

#- 331 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'SxpsEh6h' \
    --body '{"excludeOldTransactions": true, "language": "BZ_CRLR_BT", "productId": "7697AzD7", "receiptData": "pvWV45l4", "region": "EaywzVUr", "transactionId": "IIYdrQxk"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicFulfillAppleIAPItem' test.out

#- 332 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'NAM73B0l' \
    --body '{"epicGamesJwtToken": "bQeYqKsz"}' \
    > test.out 2>&1
eval_tap $? 332 'SyncEpicGamesInventory' test.out

#- 333 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yj9B2Q90' \
    --body '{"autoAck": true, "language": "tvGs", "orderId": "7g52660f", "packageName": "0Yr0odvP", "productId": "ZWKFI3AF", "purchaseTime": 35, "purchaseToken": "98STIawV", "region": "gkwsF7w4"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicFulfillGoogleIAPItem' test.out

#- 334 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'fsVBpF0N' \
    --body '{"currencyCode": "PcA00q5T", "price": 0.4712050366999997, "productId": "tSuF2SuV", "serviceLabel": 71}' \
    > test.out 2>&1
eval_tap $? 334 'PublicReconcilePlayStationStore' test.out

#- 335 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YQvnqGZw' \
    --body '{"appId": "M1Aw02TI", "language": "em_hhSJ-089", "region": "vA7DyAve", "stadiaPlayerId": "KiXrVJHm"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncStadiaEntitlement' test.out

#- 336 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'JlcSbPzX' \
    --body '{"appId": "nAPyVn9w", "currencyCode": "074bUysK", "language": "Hk", "price": 0.15395358383240398, "productId": "glh5kz0f", "region": "pj3xFZzP", "steamId": "osE1HBkt"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncSteamInventory' test.out

#- 337 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'z2wXnLK1' \
    --body '{"gameId": "uH1m5ZJU", "language": "CUns-PASz_ty", "region": "PmMNcZAq"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncTwitchDropsEntitlement' test.out

#- 338 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJS2oWAB' \
    --body '{"currencyCode": "cEvTj90O", "price": 0.06447468019238911, "productId": "IJ0BrdLE", "xstsToken": "JMInn0hX"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncXboxInventory' test.out

#- 339 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'akSB5cte' \
    --itemId 'MqDa7RWd' \
    --limit '78' \
    --offset '58' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserOrders' test.out

#- 340 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'aNUiYWZz' \
    --body '{"currencyCode": "SjlPnh8S", "discountedPrice": 62, "ext": {"EpIj8bjS": {}, "f6NDQYFu": {}, "syIidbtN": {}}, "itemId": "ysSmRJuy", "language": "Et-DeSo-kV", "price": 57, "quantity": 3, "region": "dL7dzQF1", "returnUrl": "3mTJTPJS"}' \
    > test.out 2>&1
eval_tap $? 340 'PublicCreateUserOrder' test.out

#- 341 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OFBDdkOh' \
    --userId 'hRdc5QoX' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserOrder' test.out

#- 342 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WMdrIb3K' \
    --userId 'yiSwlSBz' \
    > test.out 2>&1
eval_tap $? 342 'PublicCancelUserOrder' test.out

#- 343 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8PQIX090' \
    --userId 'seNMbyl4' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserOrderHistories' test.out

#- 344 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sdQLpUsr' \
    --userId '8LO4akok' \
    > test.out 2>&1
eval_tap $? 344 'PublicDownloadUserOrderReceipt' test.out

#- 345 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'cvhBGPkF' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetPaymentAccounts' test.out

#- 346 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'TkNQlqfP' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'ae1EiP2i' \
    > test.out 2>&1
eval_tap $? 346 'PublicDeletePaymentAccount' test.out

#- 347 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ht9JqFQK' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '9BRf7DLw' \
    --limit '60' \
    --offset '70' \
    --sku '0ykQvs5K' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 347 'PublicQueryUserSubscriptions' test.out

#- 348 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'vH29SfsD' \
    --body '{"currencyCode": "L914dyK5", "itemId": "g374OOE0", "language": "hX-Us", "region": "j6EnMI3W", "returnUrl": "HdhesvQd", "source": "4bU518o4"}' \
    > test.out 2>&1
eval_tap $? 348 'PublicSubscribeSubscription' test.out

#- 349 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jIDnVBHv' \
    --itemId 'zEuGjeLd' \
    > test.out 2>&1
eval_tap $? 349 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 350 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '0F03lHQu' \
    --userId 'G1gsQ3xB' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUserSubscription' test.out

#- 351 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4f0HYDbY' \
    --userId '6ERidmPV' \
    > test.out 2>&1
eval_tap $? 351 'PublicChangeSubscriptionBillingAccount' test.out

#- 352 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2B1VkwKE' \
    --userId '8LYlJH9H' \
    --body '{"immediate": false, "reason": "IiRuoFg1"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicCancelSubscription' test.out

#- 353 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nOUJqeyU' \
    --userId 'SrsdHwIJ' \
    --excludeFree  \
    --limit '13' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 353 'PublicGetUserSubscriptionBillingHistories' test.out

#- 354 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '9HM5KvdY' \
    --namespace "$AB_NAMESPACE" \
    --userId '0MixeqOU' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetWallet' test.out

#- 355 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'lyPAIEic' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tlqVrWIQ' \
    --limit '12' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 355 'PublicListUserWalletTransactions' test.out

#- 356 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'U8tcBG0P' \
    --baseAppId 'QouFUJBD' \
    --categoryPath 'NeyyW2Af' \
    --features '5SCwu0Av' \
    --itemStatus 'INACTIVE' \
    --itemType 'INGAMEITEM' \
    --limit '62' \
    --offset '16' \
    --region 'oSmKewjI' \
    --sortBy 'OHhpFK6e' \
    --storeId 'UrQbti0B' \
    --tags 'AJbznZuc' \
    --targetNamespace 'AV5bBO6F' \
    > test.out 2>&1
eval_tap $? 356 'QueryItems1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE