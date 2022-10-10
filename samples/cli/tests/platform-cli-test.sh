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
    --body '{"context": {"item": {"appId": "rWBzUkN3", "appType": "GAME", "baseAppId": "QD3Bcz9w", "boothName": "WENdpeud", "boundItemIds": ["8T7dSPRQ", "govGwXbP", "MHJ6Ef2h"], "categoryPath": "eZmyoCff", "clazz": "roscJDt6", "createdAt": "1972-05-07T00:00:00Z", "description": "KYO8vqEo", "displayOrder": 57, "entitlementType": "CONSUMABLE", "ext": {"7b6q1ywK": {}, "gnhfMXA7": {}, "hLunM1ND": {}}, "features": ["9IVMhPuP", "VMCS0Squ", "NYYSfecV"], "fresh": true, "images": [{"as": "U12obezO", "caption": "nNsQm7UH", "height": 28, "imageUrl": "XX7bqEZW", "smallImageUrl": "aTFLE8C4", "width": 42}, {"as": "oGBgnoEt", "caption": "7uYcrT7B", "height": 57, "imageUrl": "9tzo4zTz", "smallImageUrl": "NZVcqTgu", "width": 55}, {"as": "8nNmD4X8", "caption": "TpwaG0sQ", "height": 11, "imageUrl": "HF50QagC", "smallImageUrl": "YrKll9aw", "width": 80}], "itemId": "ehWRXMqF", "itemIds": ["Oj8gVRBn", "fC5aOOH7", "KL9wcsT5"], "itemQty": {"MQEE6o4e": 19, "BGPSKqkB": 46, "7qiPwEuD": 22}, "itemType": "CODE", "language": "vF5GezHS", "listable": false, "localExt": {"b4njOoAw": {}, "CQjzHcvR": {}, "le3RMg7T": {}}, "longDescription": "Hp7zBRqF", "maxCount": 17, "maxCountPerUser": 99, "name": "bLKRVt3a", "namespace": "z7uOBf4V", "optionBoxConfig": {"boxItems": [{"count": 70, "itemId": "KIC0tByd", "itemSku": "OZ3FCAE9"}, {"count": 29, "itemId": "gOnhrZPA", "itemSku": "irX8NBdJ"}, {"count": 43, "itemId": "vslVy4lN", "itemSku": "0zJGObvp"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 34, "comparison": "includes", "name": "1kimmBTR", "predicateType": "EntitlementPredicate", "value": "zGG7daHa", "values": ["qIyV6tsy", "rZJi5sv4", "BCSQAoVu"]}, {"anyOf": 61, "comparison": "excludes", "name": "UFnbwFVx", "predicateType": "SeasonTierPredicate", "value": "CDaWanvG", "values": ["fbVdIRw8", "VqTGbKIE", "lgXhXv9Q"]}, {"anyOf": 15, "comparison": "isLessThan", "name": "wXTXATlj", "predicateType": "SeasonTierPredicate", "value": "BhcNLUfF", "values": ["t6ggpTgI", "JgFlALyt", "9vY4lIZV"]}]}, {"operator": "and", "predicates": [{"anyOf": 44, "comparison": "isNot", "name": "JuEgprFD", "predicateType": "EntitlementPredicate", "value": "nW7HCFhY", "values": ["pl3mFSV1", "x3SEOE2i", "2a5hEMPG"]}, {"anyOf": 52, "comparison": "isLessThan", "name": "nSqzf1j7", "predicateType": "EntitlementPredicate", "value": "2plFvLtr", "values": ["YTgeO60I", "QRsBIfd6", "l6kWc53F"]}, {"anyOf": 9, "comparison": "isGreaterThan", "name": "Iuavk9iZ", "predicateType": "SeasonPassPredicate", "value": "jMrUhCgc", "values": ["gqGrjhFQ", "iFi1ErKw", "Pcl3PQFL"]}]}, {"operator": "or", "predicates": [{"anyOf": 66, "comparison": "excludes", "name": "PoCfBkZq", "predicateType": "SeasonPassPredicate", "value": "9UNTXDBR", "values": ["fgF49HOQ", "rwRMZBrw", "ZonUQDG9"]}, {"anyOf": 80, "comparison": "excludes", "name": "ENDSKg4m", "predicateType": "SeasonPassPredicate", "value": "KrN3iMRt", "values": ["AYYjftZX", "luNalXPh", "t9gQiSdo"]}, {"anyOf": 9, "comparison": "isLessThan", "name": "IMwvgwKd", "predicateType": "SeasonPassPredicate", "value": "fYV8lRnJ", "values": ["KPWpfYqJ", "N43dOeo9", "lFPybGjW"]}]}]}, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 97, "fixedTrialCycles": 65, "graceDays": 24}, "region": "cAneJLFW", "regionData": [{"currencyCode": "E0ZN2dCV", "currencyNamespace": "5AJISNcu", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1990-08-20T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1979-09-09T00:00:00Z", "discountedPrice": 79, "expireAt": "1985-10-31T00:00:00Z", "price": 98, "purchaseAt": "1984-07-20T00:00:00Z", "trialPrice": 27}, {"currencyCode": "je2RMOlQ", "currencyNamespace": "lyrXwXvT", "currencyType": "REAL", "discountAmount": 40, "discountExpireAt": "1977-08-31T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1995-07-29T00:00:00Z", "discountedPrice": 91, "expireAt": "1975-03-12T00:00:00Z", "price": 8, "purchaseAt": "1980-11-24T00:00:00Z", "trialPrice": 16}, {"currencyCode": "Gt7YXZ5k", "currencyNamespace": "cXiteKu6", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1991-05-31T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1987-11-13T00:00:00Z", "discountedPrice": 2, "expireAt": "1982-10-29T00:00:00Z", "price": 39, "purchaseAt": "1986-10-24T00:00:00Z", "trialPrice": 38}], "seasonType": "TIER", "sku": "ZO9PyRRU", "stackable": true, "status": "ACTIVE", "tags": ["lo4UGuar", "GzbbVGj7", "J30Sji0v"], "targetCurrencyCode": "jTUabbR6", "targetItemId": "rA1ZHasU", "targetNamespace": "SRuJLi5G", "thumbnailUrl": "MGtL9y4j", "title": "CICAKGI8", "updatedAt": "1999-06-07T00:00:00Z", "useCount": 5}, "namespace": "AtX2amYJ", "order": {"currency": {"currencyCode": "LHadcUIi", "currencySymbol": "ap3yE8le", "currencyType": "REAL", "decimals": 93, "namespace": "PUfAdisc"}, "ext": {"IlZNhNk4": {}, "eYhrhyOT": {}, "H8YegVOQ": {}}, "free": false}, "source": "ACHIEVEMENT"}, "script": "LaR8l8Qx", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id '3eOIhodI' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'FhxzgLUP' \
    --body '{"grantDays": "Xj6p4cfZ"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'Upa1IdaR' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'e9usnH4C' \
    --body '{"grantDays": "w8Mio0xe"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "3fXwoZvn", "dryRun": false, "fulfillmentUrl": "rGi3CBAx", "itemType": "CODE", "purchaseConditionUrl": "oKhXo0jg"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '4QOlpOlS' \
    --itemType 'SUBSCRIPTION' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'h1IXLcYk' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'mUrCFKEQ' \
    --body '{"clazz": "y0DMIFSV", "dryRun": false, "fulfillmentUrl": "Tlyc6IXM", "purchaseConditionUrl": "Pw2rcke6"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'lTypFcxW' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --name 'lQMRod8U' \
    --offset '20' \
    --tag 'ODmZQSDP' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kdVvnXvQ", "items": [{"extraSubscriptionDays": 12, "itemId": "7XMLe6XW", "itemName": "VFf0i6m4", "quantity": 57}, {"extraSubscriptionDays": 96, "itemId": "jNK6UO1Z", "itemName": "wbRVMZr6", "quantity": 7}, {"extraSubscriptionDays": 12, "itemId": "mHYcLWGi", "itemName": "3mLjogoQ", "quantity": 97}], "maxRedeemCountPerCampaignPerUser": 42, "maxRedeemCountPerCode": 30, "maxRedeemCountPerCodePerUser": 41, "maxSaleCount": 65, "name": "zXDKSpVf", "redeemEnd": "1981-04-10T00:00:00Z", "redeemStart": "1980-05-22T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["Mmbsac9f", "KsmTMP00", "RigQ02fa"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'MUnDEog9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'gzuM07e0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ae5w0m0Z", "items": [{"extraSubscriptionDays": 93, "itemId": "ONV2CcOD", "itemName": "Zaf34DGX", "quantity": 38}, {"extraSubscriptionDays": 26, "itemId": "FDmQVvsa", "itemName": "Zr8F5QBq", "quantity": 45}, {"extraSubscriptionDays": 90, "itemId": "JBj3C4dK", "itemName": "saKE5xuR", "quantity": 44}], "maxRedeemCountPerCampaignPerUser": 67, "maxRedeemCountPerCode": 40, "maxRedeemCountPerCodePerUser": 6, "maxSaleCount": 2, "name": "FsmckXc8", "redeemEnd": "1971-03-04T00:00:00Z", "redeemStart": "1972-05-08T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["AhUGwi8N", "e0iIIR6W", "ELGDPfxP"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '6hMQoaOM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UBdCfZMA' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mJ9d38Rz' \
    --body '{"categoryPath": "VeYPl7wg", "localizationDisplayNames": {"swlEVsbo": "FGEl4llx", "kGcCjpLF": "nFhXbKJ3", "L5pKBkTM": "a2hLy8P3"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'z3uyC0AK' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'WE0sALXQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yIkXqLkv' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'sDvMc0TD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BpwYgE7a' \
    --body '{"localizationDisplayNames": {"EOvI830H": "a0umbwVQ", "Q0cnAX34": "STwfn4mm", "wieKwGWV": "NLrHVVL9"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'kpT1snwi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TEfJxcWu' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'OXaLiJ1a' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FwpOyCbT' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'tHPRhSUq' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Dcy0RAW6' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '9oRG1izk' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '28' \
    --code 'KHzo40mS' \
    --limit '87' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'roP8zdXP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 16}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'AgeG0ZrQ' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '58' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'lFBCW2sN' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '83' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId '7Foob2sT' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '1' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'iIOSuIJ6' \
    --namespace "$AB_NAMESPACE" \
    --code 'VsPVNszy' \
    --limit '100' \
    --offset '4' \
    --userId 'TDlidrhx' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'ArmoWRzZ' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'eNxwLwRB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'UfMi6l4S' \
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
    --body '{"currencyCode": "vDEp0T7x", "currencySymbol": "EYStkc14", "currencyType": "VIRTUAL", "decimals": 45, "localizationDescriptions": {"NXEj14nD": "WsR17MxS", "J44eItt0": "jU3Rhk0r", "AVllVCX4": "KWB4ZB4X"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '4CdQpVO6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"4y0fhZRq": "m4nISZxM", "pAXQVzNB": "NAnRwzpW", "0UiowLLn": "5hAXG7m3"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'CgKhs4r8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'TiKslXa0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'giMjLTot' \
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
    --body '{"data": [{"id": "wsiq5Ffk", "rewards": [{"currency": {"currencyCode": "4vsvqCaR", "namespace": "X6IWp1Jb"}, "item": {"itemId": "JhY3vbYb", "itemSku": "txkUlfJp", "itemType": "71aeRyJM"}, "quantity": 100, "type": "CURRENCY"}, {"currency": {"currencyCode": "1iSVJ2oZ", "namespace": "DYgOuyZP"}, "item": {"itemId": "5podQwmw", "itemSku": "azfEw7oD", "itemType": "OdQJQNlY"}, "quantity": 92, "type": "CURRENCY"}, {"currency": {"currencyCode": "Rsz5zSvR", "namespace": "X1jwEGoR"}, "item": {"itemId": "GYE2jRbU", "itemSku": "f0h99Sfd", "itemType": "FHfN4EuN"}, "quantity": 92, "type": "CURRENCY"}]}, {"id": "FsuOss6s", "rewards": [{"currency": {"currencyCode": "YelebY5w", "namespace": "QNzfnU1J"}, "item": {"itemId": "duRniIcJ", "itemSku": "2WoL6qwN", "itemType": "ttQHPFUY"}, "quantity": 9, "type": "CURRENCY"}, {"currency": {"currencyCode": "0Tw6vKDS", "namespace": "83UfB0Gg"}, "item": {"itemId": "ikANRLi7", "itemSku": "8b1SaiCm", "itemType": "BUqr1sp1"}, "quantity": 83, "type": "CURRENCY"}, {"currency": {"currencyCode": "h1hOL8Sz", "namespace": "yOApRrAh"}, "item": {"itemId": "dLno7vwd", "itemSku": "9MjE6GqY", "itemType": "3CCHP5ra"}, "quantity": 80, "type": "CURRENCY"}]}, {"id": "0ssWBQJl", "rewards": [{"currency": {"currencyCode": "WFuhLKtq", "namespace": "zgeHuJFJ"}, "item": {"itemId": "vtC6Uq6J", "itemSku": "t0MYkqWp", "itemType": "pQ8Qymwm"}, "quantity": 68, "type": "ITEM"}, {"currency": {"currencyCode": "mI0ZFG7u", "namespace": "g5vO5ioq"}, "item": {"itemId": "D9hHboPA", "itemSku": "JWnBdUcW", "itemType": "DG0O6XH1"}, "quantity": 93, "type": "ITEM"}, {"currency": {"currencyCode": "thKnGkJj", "namespace": "bOapQYQy"}, "item": {"itemId": "66Cy2hWo", "itemSku": "cBTxgXVR", "itemType": "3c6yJYvd"}, "quantity": 26, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "XBOX", "platformDlcIdMap": {"KddXLLon": "nFfBlwKx", "OO4sex1I": "zreGv4rg", "QFPU0hgE": "xrpLgCN2"}}, {"platform": "STEAM", "platformDlcIdMap": {"Ec6lEjDH": "ZKn4zThP", "0M9TahqL": "aU56AI5Q", "fgcJCgch": "dxzD3bH8"}}, {"platform": "XBOX", "platformDlcIdMap": {"6OUITNI3": "zjznkBOV", "kdRLwLXB": "Gv3fEAKq", "Z7tKpMzF": "3zmZreA6"}}]}' \
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
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'cZTKdt7p' \
    --itemId 'ALb1gjU6,1YTzEBoV,zA2dTjuD' \
    --limit '47' \
    --offset '91' \
    --userId 'tM6g0wCP' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'bxmYedCH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '0' \
    --status 'FAIL' \
    --userId '3vczU0AQ' \
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
    --body '{"bundleId": "moSHIbW6", "password": "t82P4dfh"}' \
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
    --body '{"sandboxId": "cYN0jxbl"}' \
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
    --body '{"applicationName": "45CjTJOp", "serviceAccountId": "AazCtBQb"}' \
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
    --body '{"data": [{"itemIdentity": "kKWA3Ri6", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"3020XPsA": "ppxNin90", "Dfy313GI": "JSOThpUw", "L4lKZGc2": "DHVTRwfN"}}, {"itemIdentity": "DZwct1Bm", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"bLCl5OBv": "gmmQr1BG", "PYZkoH98": "Hs9zkydx", "BbzTYqdP": "PDPrFW8V"}}, {"itemIdentity": "aPhFBOY9", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"jAHGREcS": "IOTxzh89", "AQeMNAjd": "sgDOYHAC", "MHkg8nJn": "pNOpMMLP"}}]}' \
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
    --body '{"environment": "4z73UZT8"}' \
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
    --body '{"appId": "IuAn1sqJ", "publisherAuthenticationKey": "hjofULFA"}' \
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
    --body '{"clientId": "KJAkMY6W", "clientSecret": "GwoLpibI", "organizationId": "Ezx4dYTO"}' \
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
    --body '{"relyingPartyCert": "YlLd5M7f"}' \
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
    --password '7QduIKIu' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature '9qdistpn' \
    --itemId 'YlDDjyIr' \
    --itemType 'SUBSCRIPTION' \
    --endTime 'uxivJVdn' \
    --startTime 'V4EX7ccy' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'jUSF1TAC' \
    --itemId 'b7i9FV8i' \
    --itemType 'SUBSCRIPTION' \
    --endTime 'v38rUgNT' \
    --startTime 'iKTa0qEF' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TXLal9N9' \
    --body '{"categoryPath": "sUnOhc4r", "targetItemId": "wqRzMbFH", "targetNamespace": "0QMoVUlP"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '4KLR3vqO' \
    --body '{"appId": "bmXA2Thc", "appType": "DLC", "baseAppId": "XtLCSW2E", "boothName": "9czoZvGM", "categoryPath": "M0zCDLzO", "clazz": "A4MUKMuS", "displayOrder": 0, "entitlementType": "CONSUMABLE", "ext": {"d4RO9Mje": {}, "jbGjgSA9": {}, "e61MI2hO": {}}, "features": ["qba6uSHJ", "AAWmk07u", "OgB1u23v"], "images": [{"as": "DLrItVSH", "caption": "B9vzFEhf", "height": 90, "imageUrl": "pofWPGQm", "smallImageUrl": "lqx8sace", "width": 33}, {"as": "BCm9zd5q", "caption": "QOLhg7J3", "height": 24, "imageUrl": "RfNtzBFz", "smallImageUrl": "LLWoNNmx", "width": 35}, {"as": "HEBG75ch", "caption": "7QgLMgfo", "height": 43, "imageUrl": "8Dho59VV", "smallImageUrl": "XFiOoSA1", "width": 32}], "itemIds": ["gezYBWtQ", "di49nngo", "F7qZUTFZ"], "itemQty": {"zR9AE2aL": 29, "c7Dk76T0": 64, "r6cHpXx9": 75}, "itemType": "EXTENSION", "listable": true, "localizations": {"MeW9l0Zu": {"description": "uwLS2gEv", "localExt": {"1M51yIOM": {}, "hAQHTgO4": {}, "fUTw8qBB": {}}, "longDescription": "gft98bXS", "title": "VZVgE7FV"}, "gGQUFXka": {"description": "vieSxklt", "localExt": {"l86C1vZW": {}, "XrNpkw1J": {}, "MrSwTR3A": {}}, "longDescription": "mGKe6REg", "title": "AgkbTkJg"}, "byzFVqJy": {"description": "DSE6uTGL", "localExt": {"CAJgZ7gd": {}, "pesau5SX": {}, "bi6WoSGC": {}}, "longDescription": "l3fzHjTo", "title": "gpl70oek"}}, "maxCount": 16, "maxCountPerUser": 92, "name": "tV9kjZOU", "optionBoxConfig": {"boxItems": [{"count": 42, "itemId": "bp9W06je", "itemSku": "dmvebcuZ"}, {"count": 56, "itemId": "iA3HC9cQ", "itemSku": "g3Jpo9aG"}, {"count": 61, "itemId": "lcwkKOLM", "itemSku": "Igy3Cbl1"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 53, "fixedTrialCycles": 43, "graceDays": 19}, "regionData": {"zNKLQTEr": [{"currencyCode": "asaD7iaf", "currencyNamespace": "L7kq8V6B", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1972-04-22T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1993-10-23T00:00:00Z", "discountedPrice": 32, "expireAt": "1987-12-01T00:00:00Z", "price": 36, "purchaseAt": "1972-05-10T00:00:00Z", "trialPrice": 6}, {"currencyCode": "uBOTebmr", "currencyNamespace": "HZ6Uj0NN", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1990-06-30T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1996-07-11T00:00:00Z", "discountedPrice": 18, "expireAt": "1983-07-06T00:00:00Z", "price": 19, "purchaseAt": "1996-01-01T00:00:00Z", "trialPrice": 45}, {"currencyCode": "93sWTCv7", "currencyNamespace": "cVMVnxyU", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1986-07-13T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1987-12-30T00:00:00Z", "discountedPrice": 65, "expireAt": "1981-04-25T00:00:00Z", "price": 5, "purchaseAt": "1997-11-05T00:00:00Z", "trialPrice": 89}], "MJkTmGZY": [{"currencyCode": "LyjpSKwh", "currencyNamespace": "dLrCHGyO", "currencyType": "VIRTUAL", "discountAmount": 58, "discountExpireAt": "1992-09-23T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1994-09-16T00:00:00Z", "discountedPrice": 30, "expireAt": "1989-12-05T00:00:00Z", "price": 38, "purchaseAt": "1989-10-31T00:00:00Z", "trialPrice": 39}, {"currencyCode": "201KvsFm", "currencyNamespace": "eSVZvEVM", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1977-11-19T00:00:00Z", "discountPercentage": 59, "discountPurchaseAt": "1990-03-07T00:00:00Z", "discountedPrice": 85, "expireAt": "1998-03-16T00:00:00Z", "price": 73, "purchaseAt": "1995-07-28T00:00:00Z", "trialPrice": 13}, {"currencyCode": "C9be5qTR", "currencyNamespace": "yrHpFmoU", "currencyType": "REAL", "discountAmount": 7, "discountExpireAt": "1999-08-08T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1987-10-25T00:00:00Z", "discountedPrice": 100, "expireAt": "1994-06-15T00:00:00Z", "price": 33, "purchaseAt": "1996-10-25T00:00:00Z", "trialPrice": 31}], "vVlPfQDW": [{"currencyCode": "3fwSDW7w", "currencyNamespace": "05cmJfg5", "currencyType": "VIRTUAL", "discountAmount": 36, "discountExpireAt": "1989-05-21T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1991-10-30T00:00:00Z", "discountedPrice": 89, "expireAt": "1976-01-19T00:00:00Z", "price": 66, "purchaseAt": "1992-09-01T00:00:00Z", "trialPrice": 77}, {"currencyCode": "dUCL6fEz", "currencyNamespace": "UpHS3E8C", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1996-02-06T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1982-09-11T00:00:00Z", "discountedPrice": 100, "expireAt": "1986-01-03T00:00:00Z", "price": 61, "purchaseAt": "1977-03-01T00:00:00Z", "trialPrice": 12}, {"currencyCode": "lsLFeUJS", "currencyNamespace": "PFfuhWCB", "currencyType": "REAL", "discountAmount": 96, "discountExpireAt": "1989-06-16T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1982-11-20T00:00:00Z", "discountedPrice": 81, "expireAt": "1987-04-18T00:00:00Z", "price": 91, "purchaseAt": "1974-01-22T00:00:00Z", "trialPrice": 97}]}, "seasonType": "TIER", "sku": "x753jhQq", "stackable": true, "status": "ACTIVE", "tags": ["Ssw8Xv8w", "PG1flEb9", "in7zGB9J"], "targetCurrencyCode": "V8CegJAm", "targetNamespace": "W8Wa9LTo", "thumbnailUrl": "CdtkD0dJ", "useCount": 71}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'f2ba9RVk' \
    --appId 'IFpwYYhn' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'XfQbFem9' \
    --baseAppId '7RTT1v57' \
    --categoryPath 'GhHKvgcW' \
    --features 'TmMthfLi' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --limit '3' \
    --offset '32' \
    --region 'MBg0so8P' \
    --sortBy 'displayOrder,createdAt,displayOrder:asc' \
    --storeId 'S7l8vxMD' \
    --tags 'u5rIOl60' \
    --targetNamespace 'uyb1M38T' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'M7yCayxe,dvD0L6Lu,kFfRNT8x' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'zFxWx2RQ' \
    --sku 'gU3t6psy' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'GZggjika' \
    --populateBundle  \
    --region 'oLo8CiXv' \
    --storeId '6rlCGVlS' \
    --sku '8RWRCzXY' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LGmhTLof' \
    --sku 'jHgLS5fq' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'hGAlRQvJ,btBzABwu,ygUOksUp' \
    --storeId 'rWydW7NJ' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'bFabiRYm' \
    --region 'FyGZhAWN' \
    --storeId 'D4cXLpf4' \
    --itemIds 'prcvIWsJ' \
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
    --userId 'FIhLz5Fz' \
    --body '{"itemIds": ["pyFeVIjh", "gJA2jj3j", "0PDZ2yP0"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'BUNDLE' \
    --limit '44' \
    --offset '81' \
    --sortBy 'Dxe15Bai' \
    --storeId 'MKenjcsz' \
    --keyword 'L9DCdNtE' \
    --language '5cmk3f3H' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '21' \
    --offset '21' \
    --sortBy 'displayOrder,createdAt,createdAt:desc' \
    --storeId 'v4wGVrI4' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '9cS7c4Pr' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'iJWNNKkn' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'T5D6KjNQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QNGe8QTW' \
    --body '{"appId": "IRqLIes8", "appType": "GAME", "baseAppId": "2SYDgNRv", "boothName": "4tP150ax", "categoryPath": "kwF06Hlh", "clazz": "AhemdkKf", "displayOrder": 71, "entitlementType": "DURABLE", "ext": {"q5UcCu5d": {}, "XciOajoK": {}, "Li4xPRvy": {}}, "features": ["2jSaJ5mQ", "F73gw4G2", "U3RgFRfS"], "images": [{"as": "H8yiRrOe", "caption": "B18GAnRr", "height": 52, "imageUrl": "WnSX1UYw", "smallImageUrl": "vIVh5b2l", "width": 74}, {"as": "wDfLMZUO", "caption": "gSqusFNe", "height": 61, "imageUrl": "fTtuGQAw", "smallImageUrl": "XRtgtkPo", "width": 74}, {"as": "XdlEQvGQ", "caption": "6Ck8L4Z7", "height": 43, "imageUrl": "LCs6VILs", "smallImageUrl": "Q0brCcBG", "width": 69}], "itemIds": ["kokllTbe", "SmzAldhY", "mbo7AYdq"], "itemQty": {"LCne9HGu": 42, "AHSAcRBw": 26, "g6gUBbt2": 98}, "itemType": "COINS", "listable": false, "localizations": {"7ZYB0Gkg": {"description": "C19tjHEO", "localExt": {"uJcmef0W": {}, "uenVzDCi": {}, "yBBvbtzd": {}}, "longDescription": "2ZgmQSCJ", "title": "ZYEmlKJF"}, "4fRAZADa": {"description": "jffr5HWX", "localExt": {"LNiZhfok": {}, "lzoVZbE5": {}, "4J6uxQnf": {}}, "longDescription": "nH7o65ND", "title": "8mLqgMcy"}, "uCLiP97S": {"description": "HHGr1vWp", "localExt": {"gtoWtDs3": {}, "wrt7ATO2": {}, "5M11n9BW": {}}, "longDescription": "SIiAopzO", "title": "QhZwd5aA"}}, "maxCount": 8, "maxCountPerUser": 6, "name": "l5tQdA5x", "optionBoxConfig": {"boxItems": [{"count": 69, "itemId": "BJT6LYt5", "itemSku": "x9iWKZwe"}, {"count": 16, "itemId": "HqBfaMxp", "itemSku": "mK21XtXu"}, {"count": 41, "itemId": "Okw1UVcq", "itemSku": "WtNW2v84"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 25, "fixedTrialCycles": 26, "graceDays": 28}, "regionData": {"3BDHmRZN": [{"currencyCode": "ivylDgTc", "currencyNamespace": "1AZTBXm7", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1973-06-12T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1971-08-03T00:00:00Z", "discountedPrice": 30, "expireAt": "1979-09-22T00:00:00Z", "price": 54, "purchaseAt": "1988-04-11T00:00:00Z", "trialPrice": 48}, {"currencyCode": "fLgUuSbf", "currencyNamespace": "61F6e0nt", "currencyType": "VIRTUAL", "discountAmount": 90, "discountExpireAt": "1975-03-23T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1998-10-07T00:00:00Z", "discountedPrice": 80, "expireAt": "1986-06-25T00:00:00Z", "price": 0, "purchaseAt": "1986-06-02T00:00:00Z", "trialPrice": 35}, {"currencyCode": "yjRDcKut", "currencyNamespace": "AGl21ymH", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1986-09-07T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1975-06-23T00:00:00Z", "discountedPrice": 53, "expireAt": "1987-03-18T00:00:00Z", "price": 88, "purchaseAt": "1982-06-22T00:00:00Z", "trialPrice": 17}], "O6Z0eIUe": [{"currencyCode": "bdr0tdhJ", "currencyNamespace": "al3zFoQU", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1978-05-09T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1972-05-27T00:00:00Z", "discountedPrice": 24, "expireAt": "1996-01-27T00:00:00Z", "price": 70, "purchaseAt": "1985-07-28T00:00:00Z", "trialPrice": 14}, {"currencyCode": "DgQiBDjT", "currencyNamespace": "PSS83Qot", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1981-06-04T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1980-05-04T00:00:00Z", "discountedPrice": 41, "expireAt": "1986-01-10T00:00:00Z", "price": 14, "purchaseAt": "1974-05-11T00:00:00Z", "trialPrice": 26}, {"currencyCode": "C09wS3P0", "currencyNamespace": "rnOP6GbO", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1989-09-11T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1982-03-28T00:00:00Z", "discountedPrice": 15, "expireAt": "1981-09-17T00:00:00Z", "price": 57, "purchaseAt": "1976-04-04T00:00:00Z", "trialPrice": 50}], "ai2EWvui": [{"currencyCode": "EDkWudGW", "currencyNamespace": "L5bnR4Zu", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1987-12-09T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1974-07-30T00:00:00Z", "discountedPrice": 98, "expireAt": "1987-03-29T00:00:00Z", "price": 86, "purchaseAt": "1978-12-21T00:00:00Z", "trialPrice": 10}, {"currencyCode": "jLwv0BX3", "currencyNamespace": "eThxNb2m", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1985-05-24T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1974-07-06T00:00:00Z", "discountedPrice": 36, "expireAt": "1988-09-22T00:00:00Z", "price": 12, "purchaseAt": "1988-10-31T00:00:00Z", "trialPrice": 1}, {"currencyCode": "4l3XvSh1", "currencyNamespace": "tIkUe0ll", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1977-04-16T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1987-01-07T00:00:00Z", "discountedPrice": 71, "expireAt": "1992-05-01T00:00:00Z", "price": 87, "purchaseAt": "1981-09-29T00:00:00Z", "trialPrice": 45}]}, "seasonType": "TIER", "sku": "TAwO3tUn", "stackable": true, "status": "ACTIVE", "tags": ["wGlzLZoc", "CYewmAFo", "uAVSPrhg"], "targetCurrencyCode": "SYgCZG4s", "targetNamespace": "3qzufyUx", "thumbnailUrl": "4V04hIgu", "useCount": 97}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '90TkFr8N' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'lMloeQWg' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'cqFcpOGJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 21, "orderNo": "LZI4DtMi"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'wPVVwsR2' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'VLDDQJbx' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'voMji5Jo' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2XPSHZcC' \
    --body '{"carousel": [{"alt": "vSJ2eX4L", "previewUrl": "LlQYvS7o", "thumbnailUrl": "vvp5HZOv", "type": "image", "url": "VdK3gKuL", "videoSource": "youtube"}, {"alt": "AMYES6d8", "previewUrl": "ZSKDPiR3", "thumbnailUrl": "fP2ie4IY", "type": "image", "url": "6CFQhcEb", "videoSource": "vimeo"}, {"alt": "GYGUdT94", "previewUrl": "mdrWrrfU", "thumbnailUrl": "rK6meLdm", "type": "video", "url": "kvExtumo", "videoSource": "generic"}], "developer": "CajDCUmg", "forumUrl": "gBVJYRsH", "genres": ["Strategy", "Indie", "Racing"], "localizations": {"3OXKEGRC": {"announcement": "FRpZqtz9", "slogan": "wzeJXcQR"}, "qExhrfSZ": {"announcement": "0rs4Twrp", "slogan": "0S49odeT"}, "Lgu9RKeN": {"announcement": "jWFVZSjs", "slogan": "z52qJYLX"}}, "platformRequirements": {"7QN7EO8E": [{"additionals": "W9HZCRUZ", "directXVersion": "KloYFOD6", "diskSpace": "Lt4y8FeZ", "graphics": "mY1Vp4M5", "label": "jA9PUyrB", "osVersion": "bgzA0EJB", "processor": "nvX6IFkT", "ram": "rLWb6Gcc", "soundCard": "IXYX2Kyp"}, {"additionals": "pDX8T8p9", "directXVersion": "oIJc1wm0", "diskSpace": "uHcSxIGZ", "graphics": "vlMDgMT4", "label": "Hgaxc4sf", "osVersion": "zuUpQBcF", "processor": "wvlk4YxJ", "ram": "YzKzhTou", "soundCard": "Yzrg9DGg"}, {"additionals": "ObuBLdxW", "directXVersion": "Jizltyx4", "diskSpace": "AbsFO1jW", "graphics": "kGuAC5xa", "label": "EMhO9CSq", "osVersion": "0HzhPy0t", "processor": "dpuOOxlx", "ram": "Bg6Bq62X", "soundCard": "mSal6379"}], "xL3aLCz3": [{"additionals": "c2r85bNg", "directXVersion": "GYYc6WSr", "diskSpace": "nTNr575o", "graphics": "iUWpwc8M", "label": "nKOmYKmd", "osVersion": "yfatP6HT", "processor": "EHC7u28C", "ram": "0I6fVZ5l", "soundCard": "x5OBVCOF"}, {"additionals": "WAMWBAHK", "directXVersion": "aub2gGst", "diskSpace": "QDzcYol8", "graphics": "wE5N8LYJ", "label": "qolzE89g", "osVersion": "NeoIUcNT", "processor": "ff3KB14t", "ram": "1mfqHYEE", "soundCard": "oEuzJFtO"}, {"additionals": "2sof9oeg", "directXVersion": "EchYmXp0", "diskSpace": "qhrvXOcj", "graphics": "hpa2tUR2", "label": "oWiCo5nO", "osVersion": "AlD9UMRr", "processor": "QALesYFa", "ram": "Cq14eIFW", "soundCard": "R8d9p7Oj"}], "bShUd3jG": [{"additionals": "nr8MJpL0", "directXVersion": "GJ5oztIE", "diskSpace": "ivX4q3o8", "graphics": "GaGwl554", "label": "5Wg2njAY", "osVersion": "WjnFXdBC", "processor": "xggAxmIa", "ram": "f0ttS421", "soundCard": "tmn9W3y5"}, {"additionals": "GxnrTkDq", "directXVersion": "Y8efhVjc", "diskSpace": "fUkwLuFL", "graphics": "RkgyrREl", "label": "Xv5xzrgi", "osVersion": "a2JYvn8D", "processor": "FXZl6fKd", "ram": "LMjoxmEt", "soundCard": "tdDESGDX"}, {"additionals": "13KrndgB", "directXVersion": "6uEIBJEJ", "diskSpace": "v3RlcSnP", "graphics": "CFvKYSc4", "label": "aebj476C", "osVersion": "Dq8BEPtb", "processor": "VU5MAOLO", "ram": "xsiHpKN9", "soundCard": "WR7eY160"}]}, "platforms": ["Windows", "IOS", "Android"], "players": ["Multi", "CrossPlatformMulti", "Single"], "primaryGenre": "MassivelyMultiplayer", "publisher": "Ek9a6qPv", "releaseDate": "1987-07-11T00:00:00Z", "websiteUrl": "ntHPNR57"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'CNCcrhgJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OpNU9R1W' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'DF70tbUl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '85PxvU3v' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BSh2eN1E' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '31IntVjL' \
    --itemId 'yRmi16ho' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mWUwBl3t' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'MNW1JrwX' \
    --itemId 'yObOTK1i' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'k7BonWXo' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'KHKcWyNw' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'YUrwMdw7' \
    --populateBundle  \
    --region '2NGduedQ' \
    --storeId 'lOyyj2ZS' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'kJv827cs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KlARnQ7X' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 43, "comparison": "isLessThan", "name": "F0qzNpah", "predicateType": "SeasonPassPredicate", "value": "804cGMOZ", "values": ["iUgeGSiO", "pbJA2DQt", "wdbKvd7Q"]}, {"anyOf": 35, "comparison": "isGreaterThanOrEqual", "name": "TFICcPZq", "predicateType": "SeasonTierPredicate", "value": "nyIVzDGS", "values": ["XzlFNCg8", "56ESBVCk", "eUXBlBjg"]}, {"anyOf": 5, "comparison": "isGreaterThanOrEqual", "name": "pmZrpae1", "predicateType": "EntitlementPredicate", "value": "qaCZ5Oaf", "values": ["otrtvp2A", "nhrmEQEZ", "jAE16u38"]}]}, {"operator": "or", "predicates": [{"anyOf": 49, "comparison": "is", "name": "NuXDdPtf", "predicateType": "EntitlementPredicate", "value": "gcibPUi2", "values": ["kSzAaxEZ", "dz5wBNyw", "XnmOLltY"]}, {"anyOf": 85, "comparison": "isGreaterThan", "name": "P2JTPBVZ", "predicateType": "EntitlementPredicate", "value": "BnMQTSeu", "values": ["KR107xay", "4wbqzYkB", "DXSzGEm5"]}, {"anyOf": 75, "comparison": "isNot", "name": "xhINWTwa", "predicateType": "SeasonPassPredicate", "value": "be4M6fdo", "values": ["wHfa0aaB", "kTjp9cM4", "4dW33qPE"]}]}, {"operator": "and", "predicates": [{"anyOf": 43, "comparison": "includes", "name": "DNFndszm", "predicateType": "EntitlementPredicate", "value": "EODYV62S", "values": ["J3qPVExi", "ziEGjNPh", "SHGF3PHw"]}, {"anyOf": 44, "comparison": "isGreaterThan", "name": "GkV4xAG5", "predicateType": "EntitlementPredicate", "value": "Txk1iIeS", "values": ["xTFvnIZS", "A9rAL50v", "MJcqrECt"]}, {"anyOf": 36, "comparison": "isGreaterThan", "name": "gwb6Qqjc", "predicateType": "SeasonTierPredicate", "value": "HCCDDsaw", "values": ["EsL3mtUZ", "Kt3tyqlJ", "6IUs5crS"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '822U0636' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "xPwz4CKf"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --name 'JufSZMK4' \
    --offset '81' \
    --tag 'BKQMAShf' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "PAWfhjE3", "name": "Tikwmp99", "status": "INACTIVE", "tags": ["lBDNUBbo", "ldzJZikH", "gckPtwKt"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupByBoothName \
    --namespace "$AB_NAMESPACE" \
    --boothName 'IWlMcTaL' \
    > test.out 2>&1
eval_tap $? 112 'GetKeyGroupByBoothName' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'Jx2yEEjk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '7gRcruHj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "bD1WTnjZ", "name": "9D8aYu0s", "status": "ACTIVE", "tags": ["duyHVZqD", "dVUGqqlT", "xPJWB3Ze"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '29lrYtBT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'I5zPq6SB' \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '73' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'tqG421XF' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'lRw8mnmr' \
    --limit '34' \
    --offset '70' \
    --orderNos 'KNE1TvxL,MjPPd3H9,mfmYcXEr' \
    --sortBy 'rOwVZkuE' \
    --startTime 'v3YlZJEE' \
    --status 'REFUNDED' \
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
    --orderNo 'BBSWBD4m' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'LH2Ep2zA' \
    --body '{"description": "3niDNG4i"}' \
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
    --body '{"dryRun": true, "notifyUrl": "AFRCKLws", "privateKey": "mdCLEat6"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'M1YL7wq0' \
    --externalId 'NU5JgEyu' \
    --limit '63' \
    --notificationSource 'ADYEN' \
    --notificationType 'Pcnh96lD' \
    --offset '7' \
    --paymentOrderNo 'G2oajW0V' \
    --startDate 'uIetiim9' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'AcsiAOY8' \
    --limit '37' \
    --offset '9' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "NIdyIbXc", "currencyNamespace": "fGXFRZsT", "customParameters": {"SqWRFGpT": {}, "iGBxwjnb": {}, "IJw3pIa7": {}}, "description": "is7qxkAA", "extOrderNo": "rhLF1deO", "extUserId": "WfviqR5P", "itemType": "SUBSCRIPTION", "language": "JOMR_uG", "metadata": {"ePFpeoDZ": "JuW6SWnZ", "W6cT9Uci": "2AxgP3Hq", "VTn8eL8T": "rDvAqy6x"}, "notifyUrl": "IGu8B826", "omitNotification": false, "platform": "6nSeKI0h", "price": 58, "recurringPaymentOrderNo": "IoGC32xL", "region": "aWCTPBFS", "returnUrl": "rGnoIKIB", "sandbox": true, "sku": "lu0tbYaU", "subscriptionId": "8YhDDzbh", "targetNamespace": "x13ImFdP", "targetUserId": "jNNWePz0", "title": "6yHldplO"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'TWVoThb0' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WHsX3r04' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9aoSfYBK' \
    --body '{"extTxId": "8p1bJYXY", "paymentMethod": "Ek5k4Ser", "paymentProvider": "STRIPE"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '160zfJrV' \
    --body '{"description": "PVtcQQaB"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'D2hSUqH5' \
    --body '{"amount": 28, "currencyCode": "7mH7OUCT", "notifyType": "CHARGE", "paymentProvider": "PAYPAL", "salesTax": 67, "vat": 85}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6j66hua1' \
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
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["Other", "Xbox", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "GLLsALE8", "eventTopic": "J3imsFqk", "maxAwarded": 7, "maxAwardedPerUser": 6, "namespaceExpression": "F7umQX1t", "rewardCode": "GzLHVhS9", "rewardConditions": [{"condition": "TglzjUC4", "conditionName": "JeEcGNZb", "eventName": "ph441aU7", "rewardItems": [{"duration": 37, "itemId": "IJ7jEpsm", "quantity": 34}, {"duration": 10, "itemId": "RSiXMI9L", "quantity": 0}, {"duration": 38, "itemId": "mm2IEXcv", "quantity": 67}]}, {"condition": "YZXlydXb", "conditionName": "IGbrkgdo", "eventName": "9bB3JtJo", "rewardItems": [{"duration": 15, "itemId": "dzRXJjJj", "quantity": 9}, {"duration": 25, "itemId": "PZf326Xx", "quantity": 76}, {"duration": 24, "itemId": "gRiOGiGT", "quantity": 40}]}, {"condition": "yEyCV8wJ", "conditionName": "4JNKqMpw", "eventName": "TBmANxjM", "rewardItems": [{"duration": 15, "itemId": "PDLxYn1W", "quantity": 39}, {"duration": 88, "itemId": "PfhWxjrH", "quantity": 99}, {"duration": 26, "itemId": "dEy1H07A", "quantity": 71}]}], "userIdExpression": "vPxiOSck"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'gkcKGxWc' \
    --limit '91' \
    --offset '29' \
    --sortBy 'rewardCode:asc,rewardCode:desc,namespace:desc' \
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
    --rewardId 'yRSRbymJ' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '7atxt9Bx' \
    --body '{"description": "p1mJ6fWn", "eventTopic": "OEhwsZuC", "maxAwarded": 81, "maxAwardedPerUser": 79, "namespaceExpression": "sp3x35vJ", "rewardCode": "Kmldcgx4", "rewardConditions": [{"condition": "1gZrHqct", "conditionName": "NJNi3K81", "eventName": "5dRBNjTn", "rewardItems": [{"duration": 4, "itemId": "sYlapCLA", "quantity": 41}, {"duration": 46, "itemId": "0dJj2M4B", "quantity": 28}, {"duration": 80, "itemId": "NhiiwFru", "quantity": 25}]}, {"condition": "eajLtek9", "conditionName": "e2ny0O1p", "eventName": "HxfmP9z6", "rewardItems": [{"duration": 38, "itemId": "blbMQYPQ", "quantity": 75}, {"duration": 72, "itemId": "p9fLJmbR", "quantity": 96}, {"duration": 82, "itemId": "nQae8Owt", "quantity": 5}]}, {"condition": "BGGo7zOt", "conditionName": "JrPZWGht", "eventName": "ZqiWw4KN", "rewardItems": [{"duration": 85, "itemId": "ku289ZCc", "quantity": 92}, {"duration": 19, "itemId": "DrL3KgKD", "quantity": 74}, {"duration": 23, "itemId": "toqIPlkz", "quantity": 38}]}], "userIdExpression": "i7wLPHmg"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tmOk9TwO' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'FIbX3NQ5' \
    --body '{"payload": {"7ilAUEwk": {}, "kwtTBpo3": {}, "kiH5ghh3": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'bueSgBzo' \
    --body '{"conditionName": "HfL7fEUb", "userId": "IPqz1SbY"}' \
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
    --body '{"defaultLanguage": "9GGCD9yL", "defaultRegion": "AOlFKPmr", "description": "NRTP5qwb", "supportedLanguages": ["yzDbopQh", "Xiiz4wKv", "3Kp81pEx"], "supportedRegions": ["rNE2ycdD", "3oV38Y6n", "w0ePUCLi"], "title": "JQnpCILV"}' \
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
    --storeId 'zdgCRAMl' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kbPphfdM' \
    --body '{"defaultLanguage": "4bFHUCQW", "defaultRegion": "WhuAYR1L", "description": "PYlojeWU", "supportedLanguages": ["YmL0Sf6Q", "nAaR5CXP", "5d2DrG09"], "supportedRegions": ["1amFFtXc", "JTFvoAdD", "BRiljrIg"], "title": "RPDqpwP4"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '0OexZGfH' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iJLKAFrE' \
    --action 'DELETE' \
    --itemSku '0H564AgA' \
    --itemType 'COINS' \
    --limit '99' \
    --offset '58' \
    --selected  \
    --sortBy 'createdAt:asc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'YRpG5zp4' \
    --updatedAtStart '3nheTpLG' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kYjZExF4' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yKTEtdAQ' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'J0x7wF65' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KDqa850K' \
    --action 'CREATE' \
    --itemSku 'c2WK9836' \
    --itemType 'SEASON' \
    --type 'STORE' \
    --updatedAtEnd 'ANwxyy0O' \
    --updatedAtStart 'RnZX7EqK' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DjFUuXH8' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'G97pyHQS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SMpyQnKz' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'tYgAzweR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'baeM0Yfq' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FA2hmzjQ' \
    --targetStoreId '1v2iQvyT' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'Woc3kzY9' \
    --limit '83' \
    --offset '23' \
    --sku 'NOjfQHXz' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'ExiuLSjq' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jcSuPrYp' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'dcFD5loh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'EIug5tg2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "XHQ6GzZl"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'UkAePltW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'XB2CeBXe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 9, "orderNo": "xdzay8oR"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'dguwlQ05' \
    --body '{"achievements": [{"id": "8QvimI3q", "value": 95}, {"id": "w3LI1qDe", "value": 81}, {"id": "tp69CZzA", "value": 15}], "steamUserId": "x95OFojz"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'r9kdBkXV' \
    --xboxUserId 'ZsXIfPYU' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '3BckKkTx' \
    --body '{"achievements": [{"id": "deFwL9yR", "percentComplete": 68}, {"id": "jd1XLLyY", "percentComplete": 93}, {"id": "SAIREPBD", "percentComplete": 59}], "serviceConfigId": "EMloxPLb", "titleId": "t880Ud3j", "xboxUserId": "iRXp97Iv"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'LtcDJqsA' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WftdXXZL' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'D1ZvMvUY' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJPRdAYr' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ibpAdPrO' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '0CL9CozD' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ylo5gIgx' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'HJ7UDjKq' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '8J9x0rql' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'APP' \
    --entitlementName 'ddZeaRsD' \
    --features 'SKVK4noE,yLFbhRsO,fQ9Fb9yI' \
    --itemId 'IgqhcYru,pkEyN9Qf,KMgI5SwC' \
    --limit '8' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserEntitlements' test.out

#- 183 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sm5YgjiJ' \
    --body '[{"endDate": "1999-03-24T00:00:00Z", "grantedCode": "NQjdYTxW", "itemId": "Gsq7UL1T", "itemNamespace": "nWjf9deW", "language": "Go_KoAF", "quantity": 15, "region": "EOdt8qOd", "source": "ACHIEVEMENT", "startDate": "1974-12-21T00:00:00Z", "storeId": "adxjE4CX"}, {"endDate": "1994-01-04T00:00:00Z", "grantedCode": "e6YYPUxn", "itemId": "hdiAJpd2", "itemNamespace": "C2BCo96z", "language": "qA_kHkt", "quantity": 74, "region": "Q2e8agyL", "source": "ACHIEVEMENT", "startDate": "1979-09-07T00:00:00Z", "storeId": "He3jXOfS"}, {"endDate": "1998-11-14T00:00:00Z", "grantedCode": "7EWjNCht", "itemId": "32eZDikB", "itemNamespace": "expub61f", "language": "adUh-dRWf_YT", "quantity": 78, "region": "PkbWvCib", "source": "REWARD", "startDate": "1979-07-10T00:00:00Z", "storeId": "OiFa2Rtu"}]' \
    > test.out 2>&1
eval_tap $? 183 'GrantUserEntitlement' test.out

#- 184 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'RzA8P4Eh' \
    --activeOnly  \
    --appId 'MIjfSK7e' \
    > test.out 2>&1
eval_tap $? 184 'GetUserAppEntitlementByAppId' test.out

#- 185 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'wRkpjX5x' \
    --activeOnly  \
    --limit '55' \
    --offset '50' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserEntitlementsByAppType' test.out

#- 186 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ia4l07q1' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'vpGju7OK' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementByItemId' test.out

#- 187 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ht1OZeiD' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'w45c6iP5' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementBySku' test.out

#- 188 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KI50sJeC' \
    --appIds '8yPvH7d1,Pm2oDnSi,bYSVfpTC' \
    --itemIds 'DRRK82z8,UYBKvDvx,iPtVumV4' \
    --skus 'AOtkDzL5,7Owe33Jr,FrUCq1iy' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlement' test.out

#- 189 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '1YqPnlEV' \
    --itemIds 'kDgEfw4F,sDf1pE2b,AvmbcXgh' \
    > test.out 2>&1
eval_tap $? 189 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 190 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'HwDwJKba' \
    --appId 'HsgY6qIB' \
    > test.out 2>&1
eval_tap $? 190 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 191 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '6gnF0YO7' \
    --entitlementClazz 'MEDIA' \
    --itemId 'v2QSSsEC' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemId' test.out

#- 192 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 's2pSa2LU' \
    --ids 'X36EYitR,RLYnv7Ea,FkLzhT5B' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipByItemIds' test.out

#- 193 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'utHoKcxP' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'mIDFgdtl' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipBySku' test.out

#- 194 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZCozgpn1' \
    --entitlementIds 'uAexCBYI' \
    > test.out 2>&1
eval_tap $? 194 'RevokeUserEntitlements' test.out

#- 195 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'aEbQOxji' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xpijof2P' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlement' test.out

#- 196 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'mYITgBE4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmXXi1hW' \
    --body '{"endDate": "1981-06-21T00:00:00Z", "nullFieldList": ["yp3ktBDW", "s5yZmuHL", "xjLunOP9"], "startDate": "1985-08-14T00:00:00Z", "status": "REVOKED", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 196 'UpdateUserEntitlement' test.out

#- 197 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '2LtDMiSp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RPS83Qc5' \
    --body '{"options": ["aV4p35U1", "csE752Eo", "EVzsGmJq"], "requestId": "L4VaYxEL", "useCount": 38}' \
    > test.out 2>&1
eval_tap $? 197 'ConsumeUserEntitlement' test.out

#- 198 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'iVRtwQTv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GU00Z6jy' \
    > test.out 2>&1
eval_tap $? 198 'DisableUserEntitlement' test.out

#- 199 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'FmPTyo4u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'haMXo3hx' \
    > test.out 2>&1
eval_tap $? 199 'EnableUserEntitlement' test.out

#- 200 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'K1UZut5n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E6IZp9GN' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementHistories' test.out

#- 201 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'WRrZBMse' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMT3x54Z' \
    > test.out 2>&1
eval_tap $? 201 'RevokeUserEntitlement' test.out

#- 202 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9538Te2' \
    --body '{"duration": 2, "endDate": "1982-09-26T00:00:00Z", "itemId": "bDOg8AbI", "itemSku": "B0SldaKY", "language": "O0QkCeT6", "order": {"currency": {"currencyCode": "CyZGKy0V", "currencySymbol": "IsPev1g1", "currencyType": "REAL", "decimals": 28, "namespace": "NRbrtvk0"}, "ext": {"vhRHZjcx": {}, "39amdZXX": {}, "tyLIVIpA": {}}, "free": true}, "orderNo": "bLZB1HY0", "origin": "System", "quantity": 39, "region": "pDCdBNyz", "source": "GIFT", "startDate": "1980-04-30T00:00:00Z", "storeId": "UHvijNRh"}' \
    > test.out 2>&1
eval_tap $? 202 'FulfillItem' test.out

#- 203 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'OlXWiVDt' \
    --body '{"code": "zDo4Xn0i", "language": "Tsj-539", "region": "O2QmWgsz"}' \
    > test.out 2>&1
eval_tap $? 203 'RedeemCode' test.out

#- 204 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'h9r47Owz' \
    --body '{"origin": "Twitch", "rewards": [{"currency": {"currencyCode": "mHo4uaFA", "namespace": "9GnVrBQI"}, "item": {"itemId": "UFM107Ja", "itemSku": "YxAinqWY", "itemType": "GyZKkiXn"}, "quantity": 62, "type": "CURRENCY"}, {"currency": {"currencyCode": "4kYaM6iH", "namespace": "XnXq9c4H"}, "item": {"itemId": "3WaJIgsd", "itemSku": "PIPW3Pc7", "itemType": "RwDtxY4p"}, "quantity": 42, "type": "CURRENCY"}, {"currency": {"currencyCode": "6bnttgaD", "namespace": "7elinKjt"}, "item": {"itemId": "irP5cBOh", "itemSku": "PGIqyIxK", "itemType": "5zvDxpmD"}, "quantity": 36, "type": "CURRENCY"}], "source": "DLC"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillRewards' test.out

#- 205 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'vOWpb8X2' \
    --endTime 'GgmQQnn8' \
    --limit '45' \
    --offset '95' \
    --productId 'xFFCkHc2' \
    --startTime '3crA95rF' \
    --status 'VERIFIED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 205 'QueryUserIAPOrders' test.out

#- 206 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'qobmh2Vs' \
    > test.out 2>&1
eval_tap $? 206 'QueryAllUserIAPOrders' test.out

#- 207 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8aS6eUrz' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "avY_TNFF-PB", "productId": "GQsBNF3F", "region": "UVg9kKsO", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 207 'MockFulfillIAPItem' test.out

#- 208 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bdmz7Kl9' \
    --itemId '9F6tXEAA' \
    --limit '70' \
    --offset '89' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 208 'QueryUserOrders' test.out

#- 209 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'zHbInBe5' \
    --body '{"currencyCode": "4JnQaBjf", "currencyNamespace": "UcS4vFzO", "discountedPrice": 45, "ext": {"zRdDjW4K": {}, "iGczcliA": {}, "kNUP2pwl": {}}, "itemId": "0EgwYeRm", "language": "7eMkvZvI", "options": {"skipPriceValidation": false}, "platform": "Other", "price": 28, "quantity": 18, "region": "30XFpgXe", "returnUrl": "9y1339G2", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 209 'AdminCreateUserOrder' test.out

#- 210 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ha64oVWO' \
    --itemId 'zfa8cKcn' \
    > test.out 2>&1
eval_tap $? 210 'CountOfPurchasedItem' test.out

#- 211 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yvKr6ID4' \
    --userId 'lpsJ0cLn' \
    > test.out 2>&1
eval_tap $? 211 'GetUserOrder' test.out

#- 212 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QzwWEVlA' \
    --userId '7e2fzS13' \
    --body '{"status": "REFUNDED", "statusReason": "lCssQyMs"}' \
    > test.out 2>&1
eval_tap $? 212 'UpdateUserOrderStatus' test.out

#- 213 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jos2Jmmg' \
    --userId '4n36gL3M' \
    > test.out 2>&1
eval_tap $? 213 'FulfillUserOrder' test.out

#- 214 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gFcU3B0c' \
    --userId 'EE1ffPF2' \
    > test.out 2>&1
eval_tap $? 214 'GetUserOrderGrant' test.out

#- 215 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'LwLIFMqw' \
    --userId 'pfCz6hf6' \
    > test.out 2>&1
eval_tap $? 215 'GetUserOrderHistories' test.out

#- 216 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oBGBXBm8' \
    --userId 'HbanngST' \
    --body '{"additionalData": {"cardSummary": "Vk93itX8"}, "authorisedTime": "1992-09-16T00:00:00Z", "chargebackReversedTime": "1983-09-10T00:00:00Z", "chargebackTime": "1974-03-14T00:00:00Z", "chargedTime": "1985-02-21T00:00:00Z", "createdTime": "1990-06-04T00:00:00Z", "currency": {"currencyCode": "ANpTopdT", "currencySymbol": "AvIbn7To", "currencyType": "REAL", "decimals": 15, "namespace": "ov0oOsSn"}, "customParameters": {"VQUyGSOC": {}, "PxZ5mnNa": {}, "vn1hd3ir": {}}, "extOrderNo": "3Xj92tGQ", "extTxId": "y9ZiEwJM", "extUserId": "6JFcqat7", "issuedAt": "1973-05-26T00:00:00Z", "metadata": {"YMFrweIm": "sKYKetjv", "7SPkJKsO": "JEqx534G", "ShrXZK0r": "gUj5n3uk"}, "namespace": "eptGfTYx", "nonceStr": "ivmyKes9", "paymentMethod": "KzRvVsD4", "paymentMethodFee": 71, "paymentOrderNo": "Wl5NeBs5", "paymentProvider": "WXPAY", "paymentProviderFee": 14, "paymentStationUrl": "ZKyKjI12", "price": 84, "refundedTime": "1976-08-14T00:00:00Z", "salesTax": 8, "sandbox": true, "sku": "0mIYmF8N", "status": "REQUEST_FOR_INFORMATION", "statusReason": "vjzWZCad", "subscriptionId": "uPiPm8zl", "subtotalPrice": 92, "targetNamespace": "pAVfiyEm", "targetUserId": "5LbG0cUN", "tax": 91, "totalPrice": 48, "totalTax": 77, "txEndTime": "1985-03-16T00:00:00Z", "type": "ucSxffdn", "userId": "OLPaH2gV", "vat": 88}' \
    > test.out 2>&1
eval_tap $? 216 'ProcessUserOrderNotification' test.out

#- 217 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'W2ZGk6SV' \
    --userId '2Av6rJ80' \
    > test.out 2>&1
eval_tap $? 217 'DownloadUserOrderReceipt' test.out

#- 218 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'UP624e0W' \
    --body '{"currencyCode": "0ZYCW6Bx", "currencyNamespace": "j4FcE7Sx", "customParameters": {"RacNdQRT": {}, "uz8IAwFZ": {}, "7TLIGXyC": {}}, "description": "QHE9Qkn3", "extOrderNo": "Gei7mpPC", "extUserId": "s2nyGFlC", "itemType": "MEDIA", "language": "xbm_759", "metadata": {"Ki2hpJ6y": "eIqf3xK0", "PMf4MZCf": "IKTTgpwP", "kW0KlCsf": "9QxSrbj8"}, "notifyUrl": "j9A8GkCw", "omitNotification": false, "platform": "w2wBzJL6", "price": 57, "recurringPaymentOrderNo": "zZhnD9HB", "region": "raaU1lsm", "returnUrl": "JhIyc4hv", "sandbox": true, "sku": "6oxphn2g", "subscriptionId": "dJk9I24v", "title": "be71zunX"}' \
    > test.out 2>&1
eval_tap $? 218 'CreateUserPaymentOrder' test.out

#- 219 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2ylDbZn5' \
    --userId 'Fbbipn7M' \
    --body '{"description": "oHIdCIg0"}' \
    > test.out 2>&1
eval_tap $? 219 'RefundUserPaymentOrder' test.out

#- 220 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'XTGQKSqh' \
    --body '{"code": "QXaCBAk0", "orderNo": "6ozHlu4m"}' \
    > test.out 2>&1
eval_tap $? 220 'ApplyUserRedemption' test.out

#- 221 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 't7CZU7m0' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'MmlKRjbu' \
    --limit '63' \
    --offset '99' \
    --sku '66AqLpZ4' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 221 'QueryUserSubscriptions' test.out

#- 222 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'IhXaOlZK' \
    --excludeSystem  \
    --limit '54' \
    --offset '74' \
    --subscriptionId '1KhDvKWd' \
    > test.out 2>&1
eval_tap $? 222 'GetUserSubscriptionActivities' test.out

#- 223 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'zoEDiEwz' \
    --body '{"grantDays": 63, "itemId": "dBkYDXQO", "language": "Gj2f1Mbh", "reason": "brf1BG5X", "region": "hClHb6K2", "source": "IqqLOo58"}' \
    > test.out 2>&1
eval_tap $? 223 'PlatformSubscribeSubscription' test.out

#- 224 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'f1LITlr2' \
    --itemId 'GmQJzfIO' \
    > test.out 2>&1
eval_tap $? 224 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 225 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OaRsuyMj' \
    --userId 'jWa90jLn' \
    > test.out 2>&1
eval_tap $? 225 'GetUserSubscription' test.out

#- 226 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OS6EcV8u' \
    --userId 'XfH3sQnl' \
    > test.out 2>&1
eval_tap $? 226 'DeleteUserSubscription' test.out

#- 227 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'phkSB7ft' \
    --userId 'Wb8jELPK' \
    --force  \
    --body '{"immediate": false, "reason": "Ff9weZ5K"}' \
    > test.out 2>&1
eval_tap $? 227 'CancelSubscription' test.out

#- 228 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LyadZP2Q' \
    --userId 'nBdThcx3' \
    --body '{"grantDays": 92, "reason": "hWcn6ubj"}' \
    > test.out 2>&1
eval_tap $? 228 'GrantDaysToSubscription' test.out

#- 229 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gZsD7Pam' \
    --userId 'ogxoPs1I' \
    --excludeFree  \
    --limit '98' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 229 'GetUserSubscriptionBillingHistories' test.out

#- 230 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZOhaqb5V' \
    --userId 'dUva3vbB' \
    --body '{"additionalData": {"cardSummary": "W3fM3kIu"}, "authorisedTime": "1976-05-17T00:00:00Z", "chargebackReversedTime": "1991-11-26T00:00:00Z", "chargebackTime": "1975-03-04T00:00:00Z", "chargedTime": "1987-02-19T00:00:00Z", "createdTime": "1983-07-01T00:00:00Z", "currency": {"currencyCode": "sR6jwzOQ", "currencySymbol": "czbkYczr", "currencyType": "REAL", "decimals": 53, "namespace": "YOuM29CJ"}, "customParameters": {"hDhpN01N": {}, "nU8wC6ft": {}, "rnwt5NSZ": {}}, "extOrderNo": "M5KFoWDJ", "extTxId": "y1Ozfrd0", "extUserId": "dA849AOt", "issuedAt": "1991-03-13T00:00:00Z", "metadata": {"OXf5tNTW": "Yej7onGa", "ckp0Q3RF": "GcDf0tcH", "YvM7Ps8U": "bGG3DtHS"}, "namespace": "itRtZyFh", "nonceStr": "okWibYHX", "paymentMethod": "NPS8c44Y", "paymentMethodFee": 98, "paymentOrderNo": "LdOuEcOf", "paymentProvider": "PAYPAL", "paymentProviderFee": 40, "paymentStationUrl": "qEZQi0me", "price": 91, "refundedTime": "1994-03-05T00:00:00Z", "salesTax": 59, "sandbox": false, "sku": "2wS3jrSq", "status": "REFUND_FAILED", "statusReason": "ZVMpO6tL", "subscriptionId": "ldmYvSIJ", "subtotalPrice": 38, "targetNamespace": "E2Rh6rdE", "targetUserId": "I926ExpO", "tax": 72, "totalPrice": 68, "totalTax": 65, "txEndTime": "1988-04-30T00:00:00Z", "type": "BrYPWzZ5", "userId": "bvQ7EtB5", "vat": 19}' \
    > test.out 2>&1
eval_tap $? 230 'ProcessUserSubscriptionNotification' test.out

#- 231 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'V7RkLao5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y1xUBNVb' \
    --body '{"count": 35, "orderNo": "orvOlCJI"}' \
    > test.out 2>&1
eval_tap $? 231 'AcquireUserTicket' test.out

#- 232 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0FeesKP' \
    > test.out 2>&1
eval_tap $? 232 'QueryUserCurrencyWallets' test.out

#- 233 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'V3VeFFnt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fvuI4ZIb' \
    --limit '84' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 233 'ListUserCurrencyTransactions' test.out

#- 234 CheckWallet
eval_tap 0 234 'CheckWallet # SKIP deprecated' test.out

#- 235 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'YVyNkpgt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nog7DNqU' \
    --body '{"amount": 2, "expireAt": "1976-12-12T00:00:00Z", "origin": "Other", "reason": "HvODAbjb", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 235 'CreditUserWallet' test.out

#- 236 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'YDzvp1BM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEmYxvTV' \
    --body '{"amount": 14, "walletPlatform": "Xbox"}' \
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
    --nextEvaluatedKey 'tbHj0Xso' \
    --end '9fqfOWvR' \
    --start 'qiLGgQXj' \
    > test.out 2>&1
eval_tap $? 244 'SyncOrders' test.out

#- 245 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["bLCK1mZw", "c2W6m2V3", "DkQAgtyJ"], "apiKey": "RBNdekGC", "authoriseAsCapture": true, "blockedPaymentMethods": ["BjlZxjjl", "Jpr10QEp", "ZCmAS4UM"], "clientKey": "PGwuVRFX", "dropInSettings": "xNymqoLw", "liveEndpointUrlPrefix": "l3W5WKhI", "merchantAccount": "sA8FoUc1", "notificationHmacKey": "hZxGudSZ", "notificationPassword": "6qzyqtBO", "notificationUsername": "kNCJcv1d", "returnUrl": "nI1uvdtu", "settings": "4YP5nAxQ"}' \
    > test.out 2>&1
eval_tap $? 245 'TestAdyenConfig' test.out

#- 246 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "V8foGms3", "privateKey": "00xR76u2", "publicKey": "SPgq00bv", "returnUrl": "FEnkJRmi"}' \
    > test.out 2>&1
eval_tap $? 246 'TestAliPayConfig' test.out

#- 247 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "80jchDXp", "secretKey": "HLNjdmvz"}' \
    > test.out 2>&1
eval_tap $? 247 'TestCheckoutConfig' test.out

#- 248 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'QHt9hABi' \
    > test.out 2>&1
eval_tap $? 248 'DebugMatchedPaymentMerchantConfig' test.out

#- 249 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "C4YwBtPW", "clientSecret": "d2oWkbAe", "returnUrl": "JGTuQ8T9", "webHookId": "fhmalH2a"}' \
    > test.out 2>&1
eval_tap $? 249 'TestPayPalConfig' test.out

#- 250 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["GJ4aV8u0", "50hw831d", "VFiAk5To"], "publishableKey": "BjKPlDNL", "secretKey": "Wss9c9cb", "webhookSecret": "95ViQK6b"}' \
    > test.out 2>&1
eval_tap $? 250 'TestStripeConfig' test.out

#- 251 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "TRZVyIPG", "key": "qcEMsh0L", "mchid": "YmxH6SNN", "returnUrl": "RNonJJCo"}' \
    > test.out 2>&1
eval_tap $? 251 'TestWxPayConfig' test.out

#- 252 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "EJx7P9Am", "flowCompletionUrl": "3jJEatYx", "merchantId": 66, "projectId": 73, "projectSecretKey": "3aTXoYSK"}' \
    > test.out 2>&1
eval_tap $? 252 'TestXsollaConfig' test.out

#- 253 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'GpVJj6rD' \
    > test.out 2>&1
eval_tap $? 253 'GetPaymentMerchantConfig' test.out

#- 254 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '9GPE2gJj' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["bY7iqrDd", "8z3RLqAp", "hjy9ve6c"], "apiKey": "6k7pUdNJ", "authoriseAsCapture": true, "blockedPaymentMethods": ["WjWAPzau", "p4eqNNLX", "IRBFmXi7"], "clientKey": "v8bizlZ1", "dropInSettings": "a15lCW0R", "liveEndpointUrlPrefix": "gPrNTxSf", "merchantAccount": "D8JwAaz7", "notificationHmacKey": "YE4LYFVl", "notificationPassword": "Tz1oogHk", "notificationUsername": "gd5LZtMc", "returnUrl": "48miq5kn", "settings": "axXrGSkl"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateAdyenConfig' test.out

#- 255 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'Gw12haHG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 255 'TestAdyenConfigById' test.out

#- 256 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'tZSvPF1C' \
    --sandbox  \
    --validate  \
    --body '{"appId": "oV0X8lyB", "privateKey": "cnE3zjkM", "publicKey": "LzXf8yih", "returnUrl": "ck7Xp1v0"}' \
    > test.out 2>&1
eval_tap $? 256 'UpdateAliPayConfig' test.out

#- 257 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'dv5cZ5t9' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 257 'TestAliPayConfigById' test.out

#- 258 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'GqbRVs74' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "u0qBbuyd", "secretKey": "cbafuvyt"}' \
    > test.out 2>&1
eval_tap $? 258 'UpdateCheckoutConfig' test.out

#- 259 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'MQcoy1Cj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 259 'TestCheckoutConfigById' test.out

#- 260 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '8DQP2UTa' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "yNJGWSLT", "clientSecret": "cLEogukE", "returnUrl": "Bcb61P2G", "webHookId": "RrZHtCxd"}' \
    > test.out 2>&1
eval_tap $? 260 'UpdatePayPalConfig' test.out

#- 261 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'RHQVjYsV' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 261 'TestPayPalConfigById' test.out

#- 262 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'V2eQwQHG' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["ZvWUycHh", "qUeSQipV", "5zOG5R4P"], "publishableKey": "YjzqWYZj", "secretKey": "AeudMknF", "webhookSecret": "zoB6ysQ2"}' \
    > test.out 2>&1
eval_tap $? 262 'UpdateStripeConfig' test.out

#- 263 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'qeNocmqc' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 263 'TestStripeConfigById' test.out

#- 264 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'C0C81m6x' \
    --validate  \
    --body '{"appId": "WCu1qP4m", "key": "BflpgHS2", "mchid": "Fe5AUQfz", "returnUrl": "lzAJ6CjK"}' \
    > test.out 2>&1
eval_tap $? 264 'UpdateWxPayConfig' test.out

#- 265 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'MHO5uY6q' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 265 'UpdateWxPayConfigCert' test.out

#- 266 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'NCr1tn0Y' \
    > test.out 2>&1
eval_tap $? 266 'TestWxPayConfigById' test.out

#- 267 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'i6aZLmqF' \
    --validate  \
    --body '{"apiKey": "IYHIY4HA", "flowCompletionUrl": "ppqgi1Fw", "merchantId": 39, "projectId": 8, "projectSecretKey": "vqNmQ2ZM"}' \
    > test.out 2>&1
eval_tap $? 267 'UpdateXsollaConfig' test.out

#- 268 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'X5kmpwOr' \
    > test.out 2>&1
eval_tap $? 268 'TestXsollaConfigById' test.out

#- 269 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'riorkYTM' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateXsollaUIConfig' test.out

#- 270 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '40' \
    --namespace "$AB_NAMESPACE" \
    --offset '75' \
    --region 't6yGDsrb' \
    > test.out 2>&1
eval_tap $? 270 'QueryPaymentProviderConfig' test.out

#- 271 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "98zDycBH", "region": "xNsUFUCx", "sandboxTaxJarApiToken": "FCqei2GX", "specials": ["WXPAY", "ALIPAY", "PAYPAL"], "taxJarApiToken": "Gjxiqp5M", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 271 'CreatePaymentProviderConfig' test.out

#- 272 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 272 'GetAggregatePaymentProviders' test.out

#- 273 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'yvHixLmV' \
    > test.out 2>&1
eval_tap $? 273 'DebugMatchedPaymentProviderConfig' test.out

#- 274 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 274 'GetSpecialPaymentProviders' test.out

#- 275 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '0kS9HRuF' \
    --body '{"aggregate": "XSOLLA", "namespace": "qQwYFBv4", "region": "7xd0Penm", "sandboxTaxJarApiToken": "BCTbhUbv", "specials": ["ALIPAY", "STRIPE", "WALLET"], "taxJarApiToken": "JfbmE1c7", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 275 'UpdatePaymentProviderConfig' test.out

#- 276 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'rMBsqfwp' \
    > test.out 2>&1
eval_tap $? 276 'DeletePaymentProviderConfig' test.out

#- 277 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 277 'GetPaymentTaxConfig' test.out

#- 278 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "wwVRhReq", "taxJarApiToken": "KvFFhOcm", "taxJarEnabled": true, "taxJarProductCodesMapping": {"brGnQYnk": "W3TzG0BF", "cW379ETK": "uckeQLmf", "ORQ4eBMM": "u40FKtg2"}}' \
    > test.out 2>&1
eval_tap $? 278 'UpdatePaymentTaxConfig' test.out

#- 279 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'okkKGsww' \
    --end 'y7LRIATC' \
    --start '7NInh6Yc' \
    > test.out 2>&1
eval_tap $? 279 'SyncPaymentOrders' test.out

#- 280 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'GaCvm4Sk' \
    --storeId 'horXO4SK' \
    > test.out 2>&1
eval_tap $? 280 'PublicGetRootCategories' test.out

#- 281 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Cdk6enFH' \
    --storeId 'y0aY0qQj' \
    > test.out 2>&1
eval_tap $? 281 'DownloadCategories' test.out

#- 282 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'bJNehV8i' \
    --namespace "$AB_NAMESPACE" \
    --language 'ziseAgFR' \
    --storeId 'zzbokVy1' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetCategory' test.out

#- 283 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'i1fLURBq' \
    --namespace "$AB_NAMESPACE" \
    --language 'vc8yUj0K' \
    --storeId 'r5E4zmIY' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetChildCategories' test.out

#- 284 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'Yhc97aQx' \
    --namespace "$AB_NAMESPACE" \
    --language 'WW5wlKqZ' \
    --storeId 'wZeIoles' \
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
    --language 'nvTUlk7D' \
    --region 'uvdb2cwB' \
    --storeId '0MXl4xOs' \
    --appId 'Q4ltVHSa' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetItemByAppId' test.out

#- 287 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'GUL9ojDr' \
    --categoryPath 'QwFc3m0D' \
    --features 'nKpUoXaW' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --language 'GzoCao8X' \
    --limit '93' \
    --offset '46' \
    --region '7oJwAYG9' \
    --sortBy 'createdAt,name,displayOrder:asc' \
    --storeId 'ZbqSiyPW' \
    --tags '8G8GAM4D' \
    > test.out 2>&1
eval_tap $? 287 'PublicQueryItems' test.out

#- 288 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'QEdWbM2X' \
    --region 'NPYgaeBy' \
    --storeId 'DsJFqCyK' \
    --sku 'kJpWqipZ' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetItemBySku' test.out

#- 289 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'C8JjBSb7' \
    --region 'k2KSsrxF' \
    --storeId 'dwuM0sh0' \
    --itemIds 'NgXNmAU0' \
    > test.out 2>&1
eval_tap $? 289 'PublicBulkGetItems' test.out

#- 290 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["2ZVktC14", "EJrPJH0u", "cbiIztMh"]}' \
    > test.out 2>&1
eval_tap $? 290 'PublicValidateItemPurchaseCondition' test.out

#- 291 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'BUNDLE' \
    --limit '51' \
    --offset '34' \
    --region 'Fxbu4Brz' \
    --storeId '6p3jDhBr' \
    --keyword 'lMBhBWd8' \
    --language 'qylxsVRU' \
    > test.out 2>&1
eval_tap $? 291 'PublicSearchItems' test.out

#- 292 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'ZT8BGBQA' \
    --namespace "$AB_NAMESPACE" \
    --language 'gDy5u9Y3' \
    --region 'winH6ZRT' \
    --storeId 'evH7OzRT' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetApp' test.out

#- 293 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'vV6EQvvh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 293 'PublicGetItemDynamicData' test.out

#- 294 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'cEEbR3qn' \
    --namespace "$AB_NAMESPACE" \
    --language 'uld5zrPC' \
    --populateBundle  \
    --region 'sNYgcXV8' \
    --storeId 'md1lEunn' \
    > test.out 2>&1
eval_tap $? 294 'PublicGetItem' test.out

#- 295 GetPaymentCustomization
eval_tap 0 295 'GetPaymentCustomization # SKIP deprecated' test.out

#- 296 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "Syn5RoIj", "paymentProvider": "STRIPE", "returnUrl": "7WIH1kmk", "ui": "27ac66J0", "zipCode": "Hc2Qsufd"}' \
    > test.out 2>&1
eval_tap $? 296 'PublicGetPaymentUrl' test.out

#- 297 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DbbhWHbC' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetPaymentMethods' test.out

#- 298 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bFX7bw9a' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetUnpaidPaymentOrder' test.out

#- 299 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'OBzpuPcN' \
    --paymentProvider 'ADYEN' \
    --zipCode 'i78QcuX8' \
    --body '{"token": "dQ77sxJQ"}' \
    > test.out 2>&1
eval_tap $? 299 'Pay' test.out

#- 300 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MboX0jIN' \
    > test.out 2>&1
eval_tap $? 300 'PublicCheckPaymentOrderPaidStatus' test.out

#- 301 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'UPSBZMId' \
    > test.out 2>&1
eval_tap $? 301 'GetPaymentPublicConfig' test.out

#- 302 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'iIyzAZIi' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetQRCode' test.out

#- 303 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'ZvxZbthq' \
    --foreinginvoice 'oypFuIu4' \
    --invoiceId 'i6tnaZHx' \
    --payload 'vMRymm9P' \
    --redirectResult 'ffOhnawd' \
    --resultCode '4zKfQkYN' \
    --sessionId '4i5zAWAA' \
    --status 'gcWEmXu4' \
    --token 'ulFvSNBF' \
    --type 'eV6dz9fK' \
    --userId 'iD532CfO' \
    --orderNo 'sRjuAOqq' \
    --paymentOrderNo 'OJO65yy9' \
    --paymentProvider 'ADYEN' \
    --returnUrl 'C1KrV8nC' \
    > test.out 2>&1
eval_tap $? 303 'PublicNormalizePaymentReturnUrl' test.out

#- 304 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'xtS1r7S2' \
    --paymentOrderNo 'wapeKPI4' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 304 'GetPaymentTaxValue' test.out

#- 305 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '0CjEsXo5' \
    > test.out 2>&1
eval_tap $? 305 'GetRewardByCode' test.out

#- 306 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'SPjZeVT8' \
    --limit '93' \
    --offset '96' \
    --sortBy 'rewardCode:asc,rewardCode,namespace' \
    > test.out 2>&1
eval_tap $? 306 'QueryRewards1' test.out

#- 307 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'jZGfB4Cu' \
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
    --appIds 'XzGKbI4o,yz055Ex9,6GHRbQEG' \
    --itemIds 'tf671Ifz,FfIMONq4,2GfhbfjZ' \
    --skus 'dwx9W918,LNsrZky5,lMOxYi0T' \
    > test.out 2>&1
eval_tap $? 309 'PublicExistsAnyMyActiveEntitlement' test.out

#- 310 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'ni4isw1c' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 311 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '5quZ74Nr' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 312 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'opgRDgRM' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 313 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'CFugo8ZK,xDVuuKH0,tiIb23H9' \
    --itemIds 'WwObqyIm,oAWWb6AQ,S3T6zvfG' \
    --skus 'PFMVHK6H,9FdXsmsi,hwZxXj3F' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetEntitlementOwnershipToken' test.out

#- 314 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'k2tFvFfA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'PublicGetMyWallet' test.out

#- 315 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '3WpVm4jP' \
    --body '{"epicGamesJwtToken": "8FOkDRPX"}' \
    > test.out 2>&1
eval_tap $? 315 'SyncEpicGameDLC' test.out

#- 316 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kvEDf9E9' \
    --body '{"serviceLabel": 66}' \
    > test.out 2>&1
eval_tap $? 316 'PublicSyncPsnDlcInventory' test.out

#- 317 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'zD1Aa5v7' \
    --body '{"appId": "XSoStM2O", "steamId": "A9eeydXk"}' \
    > test.out 2>&1
eval_tap $? 317 'SyncSteamDLC' test.out

#- 318 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '43pClffX' \
    --body '{"xstsToken": "LgFBdKFp"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncXboxDLC' test.out

#- 319 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'tBGgghMF' \
    --appType 'GAME' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName '0Xs9aGGD' \
    --features '6WBwTZjy,Er2HUd6f,Qm4E4IiC' \
    --itemId 'A0gibQrH,ZsPiJy1b,BEz0pk0Z' \
    --limit '16' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 319 'PublicQueryUserEntitlements' test.out

#- 320 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LGR38xV3' \
    --appId 'zEC3rGVE' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetUserAppEntitlementByAppId' test.out

#- 321 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'tlaF2pbC' \
    --limit '95' \
    --offset '12' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 321 'PublicQueryUserEntitlementsByAppType' test.out

#- 322 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3BZ9wQc8' \
    --entitlementClazz 'CODE' \
    --itemId 'ZjSzy95K' \
    > test.out 2>&1
eval_tap $? 322 'PublicGetUserEntitlementByItemId' test.out

#- 323 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uwu5BR3F' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'Mhl4xPiC' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetUserEntitlementBySku' test.out

#- 324 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'FZYS6zPM' \
    --appIds 'CTdn3W4m,XQIqiRmm,4ND9fAnU' \
    --itemIds 'HAtkLfbH,BH3iDkj1,MlvVBySd' \
    --skus 'vvWInNBo,1REGHy39,hJN32Z87' \
    > test.out 2>&1
eval_tap $? 324 'PublicExistsAnyUserActiveEntitlement' test.out

#- 325 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZJo5Y3W9' \
    --appId 'MmUn6486' \
    > test.out 2>&1
eval_tap $? 325 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 326 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FwQskRkU' \
    --entitlementClazz 'APP' \
    --itemId 'EFDqSqXI' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 327 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'QRgHXC9o' \
    --ids 'oEmqQUKF,1JuqgJGA,g9OvxgV5' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 328 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '05FdvryQ' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '78tbBXfN' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 329 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'W6PgWTwu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pg6XbN5J' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserEntitlement' test.out

#- 330 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'Pqx0Jsp4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'osxLCTdM' \
    --body '{"options": ["VB1Ay73o", "Mq4jmmVT", "WEdSK1eZ"], "requestId": "uECxM1dL", "useCount": 31}' \
    > test.out 2>&1
eval_tap $? 330 'PublicConsumeUserEntitlement' test.out

#- 331 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'T6qscPaf' \
    --body '{"code": "WVGpeDm4", "language": "wFK-sZTZ-Vn", "region": "Kv0RYxa6"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicRedeemCode' test.out

#- 332 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANaU6zot' \
    --body '{"excludeOldTransactions": true, "language": "wDhr_SNsl_fz", "productId": "QRPDy40u", "receiptData": "p5wIQWMo", "region": "Wjtzu40l", "transactionId": "o787A00i"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicFulfillAppleIAPItem' test.out

#- 333 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BiAUZc56' \
    --body '{"epicGamesJwtToken": "HahdMYVb"}' \
    > test.out 2>&1
eval_tap $? 333 'SyncEpicGamesInventory' test.out

#- 334 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7XszLiVr' \
    --body '{"autoAck": false, "language": "OeP_LkoR-122", "orderId": "j3ZvRKHs", "packageName": "wPQXj2iM", "productId": "9uZ2cUd2", "purchaseTime": 68, "purchaseToken": "99ql1Xbf", "region": "1sYLN0EX"}' \
    > test.out 2>&1
eval_tap $? 334 'PublicFulfillGoogleIAPItem' test.out

#- 335 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'pyh667J5' \
    --body '{"currencyCode": "X0AlO4Il", "price": 0.8105304381002691, "productId": "fJfJW345", "serviceLabel": 2}' \
    > test.out 2>&1
eval_tap $? 335 'PublicReconcilePlayStationStore' test.out

#- 336 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZr2CxUK' \
    --body '{"appId": "H11wYpJg", "language": "VtjO-KrEM_En", "region": "xuXVuD5n", "stadiaPlayerId": "hTMhiQiM"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncStadiaEntitlement' test.out

#- 337 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '8rvJklmW' \
    --body '{"appId": "BBQJSkuG", "currencyCode": "fhAOkBiT", "language": "at-vwYl-Cd", "price": 0.2172577010682526, "productId": "74TmvV2q", "region": "pXe3POAU", "steamId": "B1HvVeEj"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncSteamInventory' test.out

#- 338 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVdUtEXl' \
    --body '{"gameId": "c9oHEt27", "language": "mT_835", "region": "5GBi6evO"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncTwitchDropsEntitlement' test.out

#- 339 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '5XuguH88' \
    --body '{"currencyCode": "W9zGLcrn", "price": 0.15879600014236805, "productId": "q1MT5LFW", "xstsToken": "UHM6LuZK"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncXboxInventory' test.out

#- 340 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y71fNKAD' \
    --itemId '1A9NK2Dr' \
    --limit '87' \
    --offset '3' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 340 'PublicQueryUserOrders' test.out

#- 341 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ghfSKXKi' \
    --body '{"currencyCode": "zEzWddwm", "discountedPrice": 16, "ext": {"Fw9BeVjm": {}, "59EYQx1v": {}, "nZVbTxFY": {}}, "itemId": "D8cRIdD9", "language": "QYh_EhCF-ug", "price": 26, "quantity": 39, "region": "6PM95gOi", "returnUrl": "W2qJbxlf"}' \
    > test.out 2>&1
eval_tap $? 341 'PublicCreateUserOrder' test.out

#- 342 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'M52wunbg' \
    --userId 'SlmIcleq' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserOrder' test.out

#- 343 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5ccQJNPo' \
    --userId 'oqX1PMKG' \
    > test.out 2>&1
eval_tap $? 343 'PublicCancelUserOrder' test.out

#- 344 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oqWumpYQ' \
    --userId '9QG6vgbt' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserOrderHistories' test.out

#- 345 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tmw8NiJZ' \
    --userId 'ONUbrumf' \
    > test.out 2>&1
eval_tap $? 345 'PublicDownloadUserOrderReceipt' test.out

#- 346 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'j6nzy6Ee' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetPaymentAccounts' test.out

#- 347 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'e1MAE9mD' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'YjB2vl4e' \
    > test.out 2>&1
eval_tap $? 347 'PublicDeletePaymentAccount' test.out

#- 348 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'NQOz4Aa8' \
    --chargeStatus 'NEVER' \
    --itemId 'sXJyrIPr' \
    --limit '50' \
    --offset '17' \
    --sku 'lM2OUJDG' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 348 'PublicQueryUserSubscriptions' test.out

#- 349 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'f9t4tfKT' \
    --body '{"currencyCode": "AWC4XpPT", "itemId": "3gTHikhE", "language": "liF-WLTP_Tr", "region": "ZIpgytZ0", "returnUrl": "DLOceLgB", "source": "6ZdD80ry"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicSubscribeSubscription' test.out

#- 350 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'lRQz2jQT' \
    --itemId 'BoaNa7f8' \
    > test.out 2>&1
eval_tap $? 350 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 351 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Zc0wbQaR' \
    --userId 'bY4tDDGs' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserSubscription' test.out

#- 352 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'bUaTpV1Y' \
    --userId 'kYjryeR9' \
    > test.out 2>&1
eval_tap $? 352 'PublicChangeSubscriptionBillingAccount' test.out

#- 353 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'u4ZPW5Ub' \
    --userId 'X2Rq4oDK' \
    --body '{"immediate": false, "reason": "Qx4paAQK"}' \
    > test.out 2>&1
eval_tap $? 353 'PublicCancelSubscription' test.out

#- 354 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'kBRpVbsQ' \
    --userId 'yaYurVOx' \
    --excludeFree  \
    --limit '81' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 354 'PublicGetUserSubscriptionBillingHistories' test.out

#- 355 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'I5xmutJm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GKieTuRy' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetWallet' test.out

#- 356 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'EGJPgS3u' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CgK35iMc' \
    --limit '93' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 356 'PublicListUserWalletTransactions' test.out

#- 357 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'eukmBHaR' \
    --baseAppId 'kyZSlm6G' \
    --categoryPath 'wSfEhQMd' \
    --features 'hJijlnR7' \
    --includeSubCategoryItem  \
    --itemStatus 'ACTIVE' \
    --itemType 'SEASON' \
    --limit '23' \
    --offset '30' \
    --region 'Ln9eGYb3' \
    --sortBy 'createdAt:asc,createdAt,createdAt:desc' \
    --storeId 'WGgIZhhm' \
    --tags '9OMT8yr0' \
    --targetNamespace 'xwZqr2OT' \
    > test.out 2>&1
eval_tap $? 357 'QueryItems1' test.out

#- 358 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '1col1MLs' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 358 'ImportStore1' test.out

#- 359 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'irlR4rml' \
    --body '{"itemIds": ["dmRPnAO4", "PFaScs4B", "ldNlrOd0"]}' \
    > test.out 2>&1
eval_tap $? 359 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE