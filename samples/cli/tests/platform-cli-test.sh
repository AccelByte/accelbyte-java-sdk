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
    --body '{"context": {"item": {"appId": "TH9GhYLQ", "appType": "DEMO", "baseAppId": "HEvD2iCe", "boothName": "CtZ2c8IE", "boundItemIds": ["ruqltkq7", "kwZJfpmY", "CnHQWjND"], "categoryPath": "Ul2d1p8Z", "clazz": "ZD47FwdJ", "createdAt": "1991-02-06T00:00:00Z", "description": "OMJITH1V", "displayOrder": 97, "entitlementType": "DURABLE", "ext": {"xp2dPrjr": {}, "HniGS8MG": {}, "p0hWeXQt": {}}, "features": ["dnlYV4xc", "hFj1KI84", "uQPypB78"], "fresh": true, "images": [{"as": "rRURDX98", "caption": "nCK922pV", "height": 38, "imageUrl": "QLA21Lsm", "smallImageUrl": "ccOvP12M", "width": 63}, {"as": "lwsW402Z", "caption": "gP5onf3S", "height": 44, "imageUrl": "Ny0QFC1e", "smallImageUrl": "EKxoQiot", "width": 27}, {"as": "rc6TxE0D", "caption": "1ffC63vq", "height": 44, "imageUrl": "v9HFZrlL", "smallImageUrl": "U17Pc4vN", "width": 59}], "itemId": "V77klaj6", "itemIds": ["1EnTx0l1", "XEYBYmjN", "eagkkZh1"], "itemQty": {"O2puGACU": 40, "fh2L88CJ": 49, "nwxRoUS6": 43}, "itemType": "MEDIA", "language": "qHS0Ulw6", "listable": false, "localExt": {"nYTcZweB": {}, "pdX4KEbr": {}, "5GHzedvB": {}}, "longDescription": "43SqgxJP", "maxCount": 2, "maxCountPerUser": 88, "name": "6g6xVihv", "namespace": "wBzcMlvt", "optionBoxConfig": {"boxItems": [{"count": 49, "itemId": "M2kwu3Qx", "itemSku": "dmSvx0VV"}, {"count": 32, "itemId": "xuzItBA3", "itemSku": "G49YIQ3e"}, {"count": 6, "itemId": "W3deX7Lx", "itemSku": "rx11ws6f"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 36, "comparison": "is", "name": "9FSDBmha", "predicateType": "EntitlementPredicate", "value": "rAodnAqA", "values": ["XElDtdSH", "ynDuji91", "yH5eWDOb"]}, {"anyOf": 41, "comparison": "includes", "name": "pzbOV4KN", "predicateType": "SeasonPassPredicate", "value": "OzfkKi3M", "values": ["OrB5lIm0", "QcPbgt9C", "nT2aXlMu"]}, {"anyOf": 31, "comparison": "isNot", "name": "9J3FPerm", "predicateType": "SeasonPassPredicate", "value": "5kkfYDR1", "values": ["vBkGwqhP", "ynqSIoEl", "GpHOOAnr"]}]}, {"operator": "and", "predicates": [{"anyOf": 93, "comparison": "isLessThan", "name": "KMlwTlE3", "predicateType": "EntitlementPredicate", "value": "Kosaqbii", "values": ["ly7enNMk", "3FfKi3el", "IILS0pW5"]}, {"anyOf": 42, "comparison": "excludes", "name": "gyJD95vC", "predicateType": "SeasonPassPredicate", "value": "xWMUQbH6", "values": ["8gd4y6M9", "alcKF20S", "dBaSZeeM"]}, {"anyOf": 4, "comparison": "isLessThanOrEqual", "name": "7MqboHSZ", "predicateType": "EntitlementPredicate", "value": "kEKBZR32", "values": ["E5Dh2nrF", "nUJzWLJ0", "qj9TciZt"]}]}, {"operator": "or", "predicates": [{"anyOf": 76, "comparison": "isGreaterThan", "name": "Hz55W6or", "predicateType": "EntitlementPredicate", "value": "BugZEiKS", "values": ["U3bvDgtP", "jRqroFUp", "dtdwtbDF"]}, {"anyOf": 37, "comparison": "excludes", "name": "52sXgpi5", "predicateType": "SeasonPassPredicate", "value": "v3Jwgfip", "values": ["I8Oa3Uml", "6PbMdAPW", "PYBsNFJ3"]}, {"anyOf": 41, "comparison": "excludes", "name": "qneuaLnj", "predicateType": "EntitlementPredicate", "value": "hynM3AGY", "values": ["STGJVOBe", "nJvjWXfG", "rUQL1PWv"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 38, "fixedTrialCycles": 81, "graceDays": 85}, "region": "WSzgCfJ4", "regionData": [{"currencyCode": "wtwf8F60", "currencyNamespace": "oEp3iVx5", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1982-07-06T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1999-11-07T00:00:00Z", "discountedPrice": 69, "expireAt": "1975-07-22T00:00:00Z", "price": 53, "purchaseAt": "1980-06-16T00:00:00Z", "trialPrice": 52}, {"currencyCode": "Ux4nyYr3", "currencyNamespace": "MC3pXY8r", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1984-11-04T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1983-06-09T00:00:00Z", "discountedPrice": 81, "expireAt": "1986-01-23T00:00:00Z", "price": 8, "purchaseAt": "1984-05-13T00:00:00Z", "trialPrice": 90}, {"currencyCode": "l3sXHrie", "currencyNamespace": "QkDfDXCK", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1979-06-04T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1974-12-14T00:00:00Z", "discountedPrice": 42, "expireAt": "1992-02-19T00:00:00Z", "price": 23, "purchaseAt": "1985-01-21T00:00:00Z", "trialPrice": 87}], "seasonType": "TIER", "sku": "kgGATecr", "stackable": true, "status": "INACTIVE", "tags": ["3Bxx8S4E", "3PWww60h", "kctOaOtq"], "targetCurrencyCode": "NMzuIxYs", "targetItemId": "OgkMWvun", "targetNamespace": "pYiIvEmw", "thumbnailUrl": "T2ViMabn", "title": "ywS7NYAP", "updatedAt": "1976-10-16T00:00:00Z", "useCount": 34}, "namespace": "qGCkAbCb", "order": {"currency": {"currencyCode": "t3ht9bxk", "currencySymbol": "uPGRyvI6", "currencyType": "VIRTUAL", "decimals": 85, "namespace": "gb6JO6xO"}, "ext": {"HKJzlFlM": {}, "RGyGOQ07": {}, "nYaeimle": {}}, "free": true}, "source": "REFERRAL_BONUS"}, "script": "Mu3EMFrM", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id '72FxK0Hq' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '6wKrRmze' \
    --body '{"grantDays": "3N4o3X4v"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'vbD3wwou' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'Lhoaoj9G' \
    --body '{"grantDays": "lwDQjKoz"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "LeeMjJJu", "dryRun": true, "fulfillmentUrl": "mvcNHBaN", "itemType": "COINS", "purchaseConditionUrl": "QGk0rfP8"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'Ot7Bp2Oe' \
    --itemType 'SUBSCRIPTION' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '0s6gvyeH' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'OW5evkgL' \
    --body '{"clazz": "mccnhTSR", "dryRun": false, "fulfillmentUrl": "gPviMfWS", "purchaseConditionUrl": "knu3d9Ui"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'Fx0sl3nO' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --name '1S7TSknw' \
    --offset '1' \
    --tag 'l0EosL49' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZXOtLhtY", "items": [{"extraSubscriptionDays": 36, "itemId": "OfanCZaj", "itemName": "PwEQEFQU", "quantity": 93}, {"extraSubscriptionDays": 35, "itemId": "0ubDJxmv", "itemName": "VIOstj7p", "quantity": 65}, {"extraSubscriptionDays": 19, "itemId": "peTN5LyF", "itemName": "wPLnJHka", "quantity": 49}], "maxRedeemCountPerCampaignPerUser": 57, "maxRedeemCountPerCode": 22, "maxRedeemCountPerCodePerUser": 58, "maxSaleCount": 56, "name": "VE3yl8Jh", "redeemEnd": "1988-07-20T00:00:00Z", "redeemStart": "1987-03-17T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["RPhSKXED", "fG2fYDdS", "JPkciCen"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '5HurS0Ie' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'dgbYZWTi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "SPEKIoDM", "items": [{"extraSubscriptionDays": 44, "itemId": "q8WYkh8B", "itemName": "7pNnmdvX", "quantity": 19}, {"extraSubscriptionDays": 27, "itemId": "CYuluYI8", "itemName": "xfAh099L", "quantity": 65}, {"extraSubscriptionDays": 52, "itemId": "UH8OCC7I", "itemName": "JaFpReCh", "quantity": 1}], "maxRedeemCountPerCampaignPerUser": 65, "maxRedeemCountPerCode": 40, "maxRedeemCountPerCodePerUser": 47, "maxSaleCount": 21, "name": "a9xv1XDf", "redeemEnd": "1977-07-15T00:00:00Z", "redeemStart": "1972-03-10T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["HJ8QeJfd", "cry4OWwW", "sCEkgQOb"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'yXmJTfew' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lx4i3qou' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ha208DQH' \
    --body '{"categoryPath": "oPk5z9Un", "localizationDisplayNames": {"Mzu8KiHw": "douq0S0O", "WhjKWPiB": "xDppD5xw", "EslnsYzL": "DFm7Edo7"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pPERQeh3' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'bze2watV' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OZTwwVb3' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'Qnn1ZTs1' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X6fllssd' \
    --body '{"localizationDisplayNames": {"uUIO0EO6": "zfpWug1e", "ZcYB04H2": "Xt9W4pgM", "diai8zOS": "QFtJsKnc"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'kKbKzWhj' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6Q6BtsQk' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'KsRmsXaC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'csotkt0g' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'dwsEd3PZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jBicAeZj' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'aNQ3VsZS' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '52' \
    --code 'hFQZB8iS' \
    --limit '53' \
    --offset '33' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'r19vMHyh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 59}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'P8bGwkbw' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '31' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'yFt7IGBI' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '0' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'MUR3yhJU' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '71' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'JEXEjQ8U' \
    --namespace "$AB_NAMESPACE" \
    --code 'rhQbPu0y' \
    --limit '63' \
    --offset '100' \
    --userId 'r52RBLet' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Bz48z4aI' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'phidOfrs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'Ergt5cHx' \
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
    --body '{"currencyCode": "FfwBTIW1", "currencySymbol": "UHHZXSEB", "currencyType": "REAL", "decimals": 40, "localizationDescriptions": {"GRsg95Oy": "wojFlXY5", "NTL68Fke": "avMiOyPN", "VzzQKdUQ": "CvxHhPg9"}}' \
    > test.out 2>&1
eval_tap $? 37 'CreateCurrency' test.out

#- 38 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'AOc9CCC3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"4nMDB58c": "N9cPGYzj", "IBIxuKlb": "dPzKzhP4", "tKuaHI8F": "pMLqY70G"}}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateCurrency' test.out

#- 39 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'u0xXBGCa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'DeleteCurrency' test.out

#- 40 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'Ke7rC9DJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetCurrencyConfig' test.out

#- 41 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '0X4SsMSe' \
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
    --body '{"data": [{"id": "XFivUYdc", "rewards": [{"currency": {"currencyCode": "ZpM2zuDh", "namespace": "p5STmRoP"}, "item": {"itemId": "kBRNqio0", "itemSku": "DYWmkdrR", "itemType": "m8phptw9"}, "quantity": 40, "type": "ITEM"}, {"currency": {"currencyCode": "OnVCBm5i", "namespace": "bvHEB6QM"}, "item": {"itemId": "lElr1wIU", "itemSku": "lfwIUZyH", "itemType": "hGg5ZpvX"}, "quantity": 15, "type": "CURRENCY"}, {"currency": {"currencyCode": "TrCCxdT3", "namespace": "YnqMNKlS"}, "item": {"itemId": "nUt2rKk8", "itemSku": "1m66MNoG", "itemType": "C5sYxtzv"}, "quantity": 17, "type": "CURRENCY"}]}, {"id": "yyDd9G2x", "rewards": [{"currency": {"currencyCode": "kNk3AU3I", "namespace": "Hb8z2iox"}, "item": {"itemId": "8E6Br8Gz", "itemSku": "RoY5mm8E", "itemType": "XJlr2afk"}, "quantity": 8, "type": "CURRENCY"}, {"currency": {"currencyCode": "yI0ryrfT", "namespace": "rqToCsJo"}, "item": {"itemId": "6UV3a74Z", "itemSku": "EcrQuxPZ", "itemType": "TR2l0NsH"}, "quantity": 81, "type": "CURRENCY"}, {"currency": {"currencyCode": "DM2JXAuK", "namespace": "I1E1Ba3X"}, "item": {"itemId": "cZ4hyWJU", "itemSku": "0jIBESAo", "itemType": "Evs0Ci1N"}, "quantity": 29, "type": "ITEM"}]}, {"id": "KdSlcleP", "rewards": [{"currency": {"currencyCode": "Z5AD28rh", "namespace": "8lu6tIWl"}, "item": {"itemId": "AkSe8olq", "itemSku": "dwu1Li9h", "itemType": "xWAasSWO"}, "quantity": 6, "type": "ITEM"}, {"currency": {"currencyCode": "Uk6NsSZN", "namespace": "ZKReS5Lh"}, "item": {"itemId": "heP5UEZH", "itemSku": "1gx45Cp6", "itemType": "SrvpCDNB"}, "quantity": 32, "type": "ITEM"}, {"currency": {"currencyCode": "hotVmyTr", "namespace": "yR7mlfW9"}, "item": {"itemId": "tejiDFwe", "itemSku": "2PKbUHRn", "itemType": "ria0zcop"}, "quantity": 81, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "PSN", "platformDlcIdMap": {"WnxtPmpB": "VgTBkGOy", "GBa3oTvD": "BSf8FK18", "Rp4LqImw": "FJVht3k2"}}, {"platform": "PSN", "platformDlcIdMap": {"0C9cYzTk": "ZWkx6Wbk", "1ZiTFnv6": "72PtCJ17", "wEIGPjME": "2R70GuF3"}}, {"platform": "STEAM", "platformDlcIdMap": {"caxqY2xd": "b1BGZFt3", "nVsieJZr": "jnO4yAZI", "vdYdAtKQ": "2OZpZJj4"}}]}' \
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
    --entitlementClazz 'MEDIA' \
    --entitlementName 'PqRChXYd' \
    --itemId 'TiJZZdLr,MS3Wa3iD,ztwrN2he' \
    --limit '72' \
    --offset '65' \
    --userId '74YxJDCv' \
    > test.out 2>&1
eval_tap $? 48 'QueryEntitlements' test.out

#- 49 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'WWrUeWXR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetEntitlement' test.out

#- 50 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '66' \
    --status 'FAIL' \
    --userId 'ZDfCoqUB' \
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
    --body '{"bundleId": "spmrtlJP", "password": "NQLnYtpu"}' \
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
    --body '{"sandboxId": "TdTWU57Y"}' \
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
    --body '{"applicationName": "K9Rfsjis", "serviceAccountId": "I5VHPGFK"}' \
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
    --body '{"data": [{"itemIdentity": "ZtzVsRTS", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"qR6O8f9F": "4TXlr5tR", "OX4brlLH": "nnQgDVsh", "WwQyEvez": "6BlodQOQ"}}, {"itemIdentity": "5jTLLTax", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"5XZaLoMQ": "kfxHx0hu", "AgOHtcfG": "LQZ7j5Yk", "CaLoXQK1": "LGnCXgzh"}}, {"itemIdentity": "rqjuJzgj", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"4wVlNOEM": "J9uVr0xE", "LruJhQAs": "UY4aA2I1", "QjsuJxDX": "Ljg5vdqZ"}}]}' \
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
    --body '{"environment": "OEu3CZt7"}' \
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
    --body '{"appId": "tKs2ZmB0", "publisherAuthenticationKey": "8Wx6bnL7"}' \
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
    --body '{"clientId": "yAMKPJni", "clientSecret": "Jw7Si6mE", "organizationId": "Z1GMkd7U"}' \
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
    --body '{"relyingPartyCert": "n7rRxU8E"}' \
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
    --password 'RIWbIQ2H' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'HssBTMqq' \
    --itemId '9iB6Nd3a' \
    --itemType 'EXTENSION' \
    --endTime 'Iu6N7DQo' \
    --startTime 'Zek9U6P8' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'WAUN0D95' \
    --itemId 'jyYSr8Qe' \
    --itemType 'APP' \
    --endTime '2I3bctxZ' \
    --startTime 'zIWzFiqH' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rGzvFDXJ' \
    --body '{"categoryPath": "XwGasD85", "targetItemId": "C5s7icOD", "targetNamespace": "qGQsQ3Ju"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Eqn7OXRs' \
    --body '{"appId": "LNk31H7n", "appType": "GAME", "baseAppId": "yE7pbHi4", "boothName": "Fmh40lt0", "categoryPath": "aUBDZ3jI", "clazz": "eK3W5KFj", "displayOrder": 3, "entitlementType": "CONSUMABLE", "ext": {"hhStEX7i": {}, "RjR1LFCC": {}, "eu6sPM4W": {}}, "features": ["1j6GfFKJ", "6ofta6H2", "PfPLXGHx"], "images": [{"as": "uWxCv2LV", "caption": "Wyv9Cimj", "height": 78, "imageUrl": "sOCriIdz", "smallImageUrl": "oqmID8lh", "width": 18}, {"as": "C28JuV6Z", "caption": "ITohxnwY", "height": 27, "imageUrl": "vqiz1OVg", "smallImageUrl": "XZXV62vk", "width": 78}, {"as": "mNXRuBZU", "caption": "6IW19nHI", "height": 76, "imageUrl": "DFc2kRYG", "smallImageUrl": "wFSfoNe6", "width": 81}], "itemIds": ["Z14LXl2V", "r5qhsR3f", "Rdv4i3fL"], "itemQty": {"UF8hHUfH": 79, "X6g5jCPV": 79, "5NRxVKpH": 26}, "itemType": "APP", "listable": false, "localizations": {"NEgUSpg9": {"description": "wcvZGLvW", "localExt": {"7S9HLVF9": {}, "6QKrOrP6": {}, "pOz7ejpo": {}}, "longDescription": "ttcLXQhF", "title": "3dSivlOZ"}, "7L8EgWo1": {"description": "UEyVXogB", "localExt": {"Vi23kWjL": {}, "26A1blpZ": {}, "eA3kp3de": {}}, "longDescription": "pj7E8f5x", "title": "wEUpVfOZ"}, "FjJ7mqML": {"description": "Qcq6uk4f", "localExt": {"fUlFfCQ8": {}, "WpQgUHxw": {}, "9XSNRv3j": {}}, "longDescription": "dbKEr7Lb", "title": "AHTDsPbW"}}, "maxCount": 92, "maxCountPerUser": 46, "name": "KLmDsipV", "optionBoxConfig": {"boxItems": [{"count": 85, "itemId": "eqpxSQRM", "itemSku": "phBYMN99"}, {"count": 63, "itemId": "aSp08YrT", "itemSku": "JRPFgZHA"}, {"count": 91, "itemId": "GG7u33qA", "itemSku": "YOdkVhXJ"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 2, "fixedTrialCycles": 6, "graceDays": 83}, "regionData": {"1J7g1MaL": [{"currencyCode": "yfLEcIeN", "currencyNamespace": "uhvoXvY4", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1994-06-28T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1980-02-14T00:00:00Z", "discountedPrice": 51, "expireAt": "1973-05-25T00:00:00Z", "price": 38, "purchaseAt": "1983-10-26T00:00:00Z", "trialPrice": 46}, {"currencyCode": "sgWdpVx3", "currencyNamespace": "GyEohlva", "currencyType": "VIRTUAL", "discountAmount": 25, "discountExpireAt": "1996-03-14T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1998-07-24T00:00:00Z", "discountedPrice": 88, "expireAt": "1993-06-14T00:00:00Z", "price": 64, "purchaseAt": "1987-04-21T00:00:00Z", "trialPrice": 3}, {"currencyCode": "oR9tvGzu", "currencyNamespace": "lEDsOH7d", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1988-06-14T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1985-08-24T00:00:00Z", "discountedPrice": 16, "expireAt": "1996-04-24T00:00:00Z", "price": 70, "purchaseAt": "1987-04-15T00:00:00Z", "trialPrice": 99}], "i7caXuFk": [{"currencyCode": "UnfW9QEd", "currencyNamespace": "76NPV5xK", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1989-07-24T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1991-10-03T00:00:00Z", "discountedPrice": 18, "expireAt": "1984-11-13T00:00:00Z", "price": 2, "purchaseAt": "1982-03-27T00:00:00Z", "trialPrice": 67}, {"currencyCode": "NfM6sqaG", "currencyNamespace": "MWcNHyxS", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1992-09-19T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1995-10-11T00:00:00Z", "discountedPrice": 95, "expireAt": "1983-12-30T00:00:00Z", "price": 22, "purchaseAt": "1995-04-24T00:00:00Z", "trialPrice": 86}, {"currencyCode": "xeSPJ1ND", "currencyNamespace": "k8HTdl4m", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1984-07-21T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1990-12-19T00:00:00Z", "discountedPrice": 23, "expireAt": "1976-12-07T00:00:00Z", "price": 83, "purchaseAt": "1998-08-29T00:00:00Z", "trialPrice": 20}], "55fcWVgA": [{"currencyCode": "GErrMcKd", "currencyNamespace": "VBShejOH", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1994-05-21T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1996-07-02T00:00:00Z", "discountedPrice": 83, "expireAt": "1993-01-15T00:00:00Z", "price": 79, "purchaseAt": "1993-02-05T00:00:00Z", "trialPrice": 43}, {"currencyCode": "ioUztZeQ", "currencyNamespace": "qipwYewy", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1999-10-26T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1982-04-20T00:00:00Z", "discountedPrice": 14, "expireAt": "1996-12-27T00:00:00Z", "price": 44, "purchaseAt": "1994-05-17T00:00:00Z", "trialPrice": 43}, {"currencyCode": "6FCUDMeZ", "currencyNamespace": "dvrhYwr7", "currencyType": "REAL", "discountAmount": 25, "discountExpireAt": "1983-11-30T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1986-09-06T00:00:00Z", "discountedPrice": 20, "expireAt": "1991-07-27T00:00:00Z", "price": 100, "purchaseAt": "1998-02-03T00:00:00Z", "trialPrice": 32}]}, "seasonType": "TIER", "sku": "39T2AB2R", "stackable": true, "status": "ACTIVE", "tags": ["NOOPGxRy", "GSHQTzlp", "s9bMUE0M"], "targetCurrencyCode": "HhVjxWOW", "targetNamespace": "selbP2xV", "thumbnailUrl": "kEbUThUX", "useCount": 32}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'OFJG9wtJ' \
    --appId 'wi5Nuv3k' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'UijWL2UV' \
    --baseAppId 'MvOby75k' \
    --categoryPath 'uWtBOH2Z' \
    --features 'pVr2J4C8' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --limit '33' \
    --offset '56' \
    --region 'BKm3B8Eb' \
    --sortBy 'name:desc,createdAt:asc,updatedAt:asc' \
    --storeId '0yISKf3I' \
    --tags 's2nzvQ8A' \
    --targetNamespace 'n65DQ7xF' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'jKcDQ8gi,5hlyUxaz,kCMcrhL5' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Ag9AID4L' \
    --sku 'IBBNLt2V' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'S5Sr7x0t' \
    --populateBundle  \
    --region 'q0nJlDV7' \
    --storeId 'BPpfPW5R' \
    --sku 'Z86djgaU' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Y8syvocs' \
    --sku 'UJwagDxc' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '5IYyNCkc,XjYaWKsK,qRjHv9rH' \
    --storeId 'dXuK41tv' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'sqrWxRWZ' \
    --region 'qbx6Ypei' \
    --storeId 'lpkVJ61D' \
    --itemIds 'F5DGLGrO' \
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
    --userId 'QSPy6C07' \
    --body '{"itemIds": ["onw469Yf", "QPFjhW7l", "X6zkP8ip"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '22' \
    --offset '53' \
    --sortBy '9eHm4Y3C' \
    --storeId '4O6kgPDZ' \
    --keyword '4bluW8L3' \
    --language 'SuQQuO82' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '4' \
    --offset '43' \
    --sortBy 'name:desc,updatedAt:desc' \
    --storeId 'DWO6bpRs' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'XtvTcwVN' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'Svs4AtAa' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'ZWvGf5Rj' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OMoBVqHW' \
    --body '{"appId": "ViLHhEaw", "appType": "GAME", "baseAppId": "Kl26K6fn", "boothName": "3o882OrP", "categoryPath": "I0WIikHc", "clazz": "iof5M8h3", "displayOrder": 97, "entitlementType": "DURABLE", "ext": {"xFOJGYOD": {}, "uMErl062": {}, "N38IIaVD": {}}, "features": ["bf7FUbyG", "Pz5CeCSU", "aqHAN05R"], "images": [{"as": "389UMIpm", "caption": "QeBDpbxL", "height": 98, "imageUrl": "IY6n2Wex", "smallImageUrl": "vDVwFuaf", "width": 63}, {"as": "FyDhMbPV", "caption": "8KuTMO3f", "height": 71, "imageUrl": "DUF3rQ5L", "smallImageUrl": "MG601unj", "width": 42}, {"as": "KrkRuNJT", "caption": "PnYbIqy8", "height": 78, "imageUrl": "Nq09H4f8", "smallImageUrl": "n6dATuEv", "width": 68}], "itemIds": ["uWV4tRKv", "KyMb3haZ", "gKfEtwHY"], "itemQty": {"ZvsCIfEv": 13, "v30hP7ir": 9, "7Fzvn4AO": 44}, "itemType": "OPTIONBOX", "listable": false, "localizations": {"df0gVYRu": {"description": "28ly7PCR", "localExt": {"CnjFjKBK": {}, "TaC8wz5W": {}, "isFyEpe7": {}}, "longDescription": "iYGXY1vL", "title": "eVX1boAa"}, "RrZt5VVL": {"description": "oeyPGeWC", "localExt": {"BS4iPbvT": {}, "JjOUjzkE": {}, "GVJAadpD": {}}, "longDescription": "n3Ggd5rO", "title": "1YWe0pkW"}, "kggm2QGe": {"description": "bYdaPWxu", "localExt": {"U2taUIuT": {}, "c9SNB0cl": {}, "Up4fZYB0": {}}, "longDescription": "3mGViGyE", "title": "hjfSG4nR"}}, "maxCount": 33, "maxCountPerUser": 27, "name": "jq6hmvxJ", "optionBoxConfig": {"boxItems": [{"count": 10, "itemId": "Zn5rD2PP", "itemSku": "S3qO4lt0"}, {"count": 38, "itemId": "V1f9QkyG", "itemSku": "VYZQhZJA"}, {"count": 15, "itemId": "cPFSqXma", "itemSku": "IFve56P0"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 17, "fixedTrialCycles": 95, "graceDays": 42}, "regionData": {"Pa7OIsvN": [{"currencyCode": "5AXViARd", "currencyNamespace": "LuHdXz3n", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1978-06-30T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1992-10-14T00:00:00Z", "discountedPrice": 93, "expireAt": "1988-05-22T00:00:00Z", "price": 77, "purchaseAt": "1999-06-26T00:00:00Z", "trialPrice": 42}, {"currencyCode": "FzlQ5asz", "currencyNamespace": "YBf72VCY", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1987-11-11T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1997-12-04T00:00:00Z", "discountedPrice": 96, "expireAt": "1987-09-17T00:00:00Z", "price": 45, "purchaseAt": "1990-03-11T00:00:00Z", "trialPrice": 60}, {"currencyCode": "DQBUTP1W", "currencyNamespace": "zIkjXg7W", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1994-09-24T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1998-02-17T00:00:00Z", "discountedPrice": 8, "expireAt": "1993-12-07T00:00:00Z", "price": 14, "purchaseAt": "1991-05-10T00:00:00Z", "trialPrice": 61}], "vAIGqffE": [{"currencyCode": "e6xP6Q5f", "currencyNamespace": "58IzZKT7", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1983-12-14T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1994-05-09T00:00:00Z", "discountedPrice": 100, "expireAt": "1984-10-12T00:00:00Z", "price": 44, "purchaseAt": "1989-07-26T00:00:00Z", "trialPrice": 41}, {"currencyCode": "HG37bUdb", "currencyNamespace": "tVYwcNYp", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1974-09-22T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1974-12-22T00:00:00Z", "discountedPrice": 14, "expireAt": "1976-08-06T00:00:00Z", "price": 78, "purchaseAt": "1972-06-29T00:00:00Z", "trialPrice": 30}, {"currencyCode": "C6V1TeqX", "currencyNamespace": "XV8oxBX7", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1984-03-30T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1982-09-09T00:00:00Z", "discountedPrice": 51, "expireAt": "1992-07-10T00:00:00Z", "price": 79, "purchaseAt": "1997-07-07T00:00:00Z", "trialPrice": 13}], "J8HT11qA": [{"currencyCode": "7JTjTXr0", "currencyNamespace": "FdXxA7Y7", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1971-11-13T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1979-07-14T00:00:00Z", "discountedPrice": 97, "expireAt": "1982-12-30T00:00:00Z", "price": 5, "purchaseAt": "1973-03-18T00:00:00Z", "trialPrice": 25}, {"currencyCode": "ESFm9NNq", "currencyNamespace": "g1tr4nSl", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1991-02-26T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1998-03-01T00:00:00Z", "discountedPrice": 51, "expireAt": "1980-11-21T00:00:00Z", "price": 3, "purchaseAt": "1982-01-05T00:00:00Z", "trialPrice": 53}, {"currencyCode": "uVc6kx73", "currencyNamespace": "VIH5ZLM6", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1990-10-31T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1984-07-08T00:00:00Z", "discountedPrice": 38, "expireAt": "1998-01-24T00:00:00Z", "price": 50, "purchaseAt": "1995-02-01T00:00:00Z", "trialPrice": 15}]}, "seasonType": "PASS", "sku": "mj7lI1Oa", "stackable": false, "status": "INACTIVE", "tags": ["Na9SeaXZ", "wQKpEXDu", "5pXmjAo1"], "targetCurrencyCode": "FAoo7lhD", "targetNamespace": "XwkreaEm", "thumbnailUrl": "2smJ9C9u", "useCount": 86}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'zBSjPPu6' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'sgRcaBV0' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'tsKf6t6g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 31, "orderNo": "yaW7v6pf"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'UmHbYjfm' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'kkqu7s79' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'z8bhUXPE' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3XZnI32N' \
    --body '{"carousel": [{"alt": "PRp9rbq6", "previewUrl": "2bNevAXz", "thumbnailUrl": "scqc3yJq", "type": "image", "url": "UOeyxHwh", "videoSource": "generic"}, {"alt": "Gs7wAqcu", "previewUrl": "1FKfVpPm", "thumbnailUrl": "eunvss61", "type": "video", "url": "RQM3O7bE", "videoSource": "youtube"}, {"alt": "JxHKkxZj", "previewUrl": "vowAT3sH", "thumbnailUrl": "2E8ZoNPf", "type": "video", "url": "44VTKwOj", "videoSource": "generic"}], "developer": "F7D65x96", "forumUrl": "zQyemMFj", "genres": ["Casual", "MassivelyMultiplayer", "Action"], "localizations": {"6Qqngzg1": {"announcement": "lLfwmJim", "slogan": "Yn6TLsvD"}, "U7PWaIZu": {"announcement": "AQUAd3Pl", "slogan": "CGG35Em2"}, "5r7peEK4": {"announcement": "r8OqnaOx", "slogan": "QYOKLYaX"}}, "platformRequirements": {"bJFL9QBJ": [{"additionals": "T450jb7V", "directXVersion": "k1hRu95D", "diskSpace": "XJkjRbDq", "graphics": "LoqhLitW", "label": "v45u2GBD", "osVersion": "N4logkDx", "processor": "uzdzneh1", "ram": "XexlVyfV", "soundCard": "jOTzWhHx"}, {"additionals": "qK5QC2JO", "directXVersion": "yHQeiGIv", "diskSpace": "vqamc5RL", "graphics": "ZRhaeKgV", "label": "noxd09GP", "osVersion": "hAjakYw0", "processor": "PYg040nA", "ram": "z2I3WMTe", "soundCard": "CVLNfFwc"}, {"additionals": "qnZAapGh", "directXVersion": "n9UFEm7f", "diskSpace": "z2xH50Uw", "graphics": "mAslWRYB", "label": "448twOE1", "osVersion": "IoS5AiSt", "processor": "2aqgGNBn", "ram": "G71gsXUv", "soundCard": "hzgnibNj"}], "xCK2EhGW": [{"additionals": "6HyqC80o", "directXVersion": "zvqri9Aa", "diskSpace": "oJE0OrDy", "graphics": "EnK04Oj3", "label": "wi0JPx6v", "osVersion": "XmI1P1ac", "processor": "4NCPicn8", "ram": "GPV6ru09", "soundCard": "t6Pu1Drd"}, {"additionals": "dSUIvfwC", "directXVersion": "WH8BfoRc", "diskSpace": "gZiplkCz", "graphics": "IqcTFHce", "label": "xgKJzht0", "osVersion": "6zLShaJq", "processor": "fGH4oL6i", "ram": "pWK4qjYF", "soundCard": "MRzVMVcd"}, {"additionals": "L7sayXYv", "directXVersion": "uE4T4eSx", "diskSpace": "YF5jGdSG", "graphics": "SpscItbW", "label": "t1l2cDg8", "osVersion": "PYvNF0io", "processor": "6quqNS2g", "ram": "K0x7vm7v", "soundCard": "rNVP1cgW"}], "pLcGSqhk": [{"additionals": "K0lDv6kN", "directXVersion": "c9I1jS16", "diskSpace": "4uFS7Zqb", "graphics": "VPcPArLw", "label": "iamxIbEZ", "osVersion": "A0bCSXI5", "processor": "PXe2Q4Vl", "ram": "izpV5xHM", "soundCard": "dozw5pu8"}, {"additionals": "6GABHmBy", "directXVersion": "HshxbCyx", "diskSpace": "w7tHAepf", "graphics": "MJr1fMGW", "label": "bhoBQ6x8", "osVersion": "1McY7qGR", "processor": "jcEprPlD", "ram": "Q84g8jNZ", "soundCard": "53J4lDiI"}, {"additionals": "oW2qUMqB", "directXVersion": "lBSTMQ2M", "diskSpace": "WGrIPvUT", "graphics": "2ML4oBTr", "label": "cfY7CAaK", "osVersion": "AvjyR7lq", "processor": "ygLXcqaO", "ram": "jI7R8e4j", "soundCard": "uXu1OGBK"}]}, "platforms": ["Linux", "Windows", "Android"], "players": ["Multi", "CrossPlatformMulti", "Multi"], "primaryGenre": "RPG", "publisher": "Wt8GPqYT", "releaseDate": "1994-10-06T00:00:00Z", "websiteUrl": "ThC1KN06"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'Ry1mC4P9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gDFj6aKv' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'iBJYQ8mc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'cOB4ElfX' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5d19EBad' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'HdeJAVd7' \
    --itemId 'spxN2iHN' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cvniUVOc' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'g9DPdmO1' \
    --itemId 'n1cXPnhR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zJKEqRgE' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'Dy6GC2AR' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'TCc0hFsX' \
    --populateBundle  \
    --region 'SwQbCQiV' \
    --storeId 'H8AMbwZR' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'tdBHhtqX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XgvCGqZD' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 12, "comparison": "isGreaterThanOrEqual", "name": "kfrCl5lh", "predicateType": "SeasonTierPredicate", "value": "Q6wMCK0L", "values": ["vfnnFK5q", "Rp7iyIPh", "7fvow5Vc"]}, {"anyOf": 38, "comparison": "isNot", "name": "Jte3Alfm", "predicateType": "SeasonTierPredicate", "value": "WI1I8Q3R", "values": ["Q4rTC25i", "QSXFpWZT", "x9m0QSiy"]}, {"anyOf": 0, "comparison": "includes", "name": "hRqd8gQt", "predicateType": "SeasonPassPredicate", "value": "6Sll7Zk1", "values": ["Lij0Hyb4", "pv2VQZbC", "rlKzI6Ir"]}]}, {"operator": "or", "predicates": [{"anyOf": 97, "comparison": "isLessThan", "name": "XHKrXqUx", "predicateType": "SeasonPassPredicate", "value": "o2eas9Um", "values": ["r3eNt2p6", "j6jzz02L", "JUI993Ap"]}, {"anyOf": 4, "comparison": "is", "name": "KiYDmSVh", "predicateType": "SeasonPassPredicate", "value": "EHY8TzTH", "values": ["rjS688XT", "G83mvpoM", "ESgwwisW"]}, {"anyOf": 28, "comparison": "isLessThan", "name": "GZZYXr1Q", "predicateType": "EntitlementPredicate", "value": "n9q9BRHV", "values": ["Ygi1BjiE", "vCFsFtFa", "b0lnFduW"]}]}, {"operator": "and", "predicates": [{"anyOf": 26, "comparison": "isGreaterThan", "name": "4T8Y93K3", "predicateType": "EntitlementPredicate", "value": "YvW9GTwD", "values": ["qped0SXT", "cYudaAPc", "SHCgF1SV"]}, {"anyOf": 46, "comparison": "isNot", "name": "l8pfFgm0", "predicateType": "SeasonTierPredicate", "value": "yL3vCLt1", "values": ["cgwLHDTf", "dtPmhLK2", "Qzgnytwo"]}, {"anyOf": 70, "comparison": "isLessThanOrEqual", "name": "1GaH1g4W", "predicateType": "SeasonTierPredicate", "value": "ILNvtQaX", "values": ["VsfYazUF", "dqUcBCRQ", "xCOBRRs7"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '1Astt2G3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "i00HwfyE"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --name 'jzCvjJ4e' \
    --offset '70' \
    --tag 'IiBcHFJe' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ptZ1MJ1M", "name": "OpnXQIKr", "status": "ACTIVE", "tags": ["VUvRKpKv", "TsdUrCQI", "vuXjPdMl"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupByBoothName \
    --namespace "$AB_NAMESPACE" \
    --boothName '3URJpxn0' \
    > test.out 2>&1
eval_tap $? 112 'GetKeyGroupByBoothName' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'YdbmYu0K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'CNbfrMDf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Wxc854BC", "name": "U9aClTno", "status": "ACTIVE", "tags": ["NxS4h0zg", "OA5RZaIS", "ItGGOCd4"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'oKdgCOgG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '517Qns2o' \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '29' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'md2U7McW' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'lzfrbN4k' \
    --limit '73' \
    --offset '71' \
    --orderNos 'lS09jFpg,Vmj4lDJq,ajfiWZ1U' \
    --sortBy 'QO1Y5YUn' \
    --startTime 'EpxUeWEz' \
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
    --orderNo 'ljvpmcVO' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sIRSQC9I' \
    --body '{"description": "banuV7AY"}' \
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
    --body '{"dryRun": true, "notifyUrl": "VnXJOj6P", "privateKey": "THip7PHo"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'SiEO6GOD' \
    --externalId 'wahsiKt6' \
    --limit '65' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'Kru34yOJ' \
    --offset '24' \
    --paymentOrderNo 'FGIT8CVP' \
    --startDate 'eDjXIIHD' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'FwEgk2oI' \
    --limit '26' \
    --offset '75' \
    --status 'AUTHORISED' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "R3slMfn3", "currencyNamespace": "RlAABmT9", "customParameters": {"hvaY14Ue": {}, "NGiZ8mdV": {}, "7nTW0RWe": {}}, "description": "KJO51kQT", "extOrderNo": "AlMuBJ4q", "extUserId": "SW97eRaK", "itemType": "MEDIA", "language": "aQV_hdEr", "metadata": {"b6T3Fgn9": "UAyQA0z6", "LCxDOuKA": "Ghndix2J", "FadWgzey": "jK8dFA6u"}, "notifyUrl": "UoqRMVqX", "omitNotification": false, "platform": "6hJwSLaG", "price": 69, "recurringPaymentOrderNo": "BBPXKdvc", "region": "Ctvo7ULg", "returnUrl": "RByKGWWQ", "sandbox": true, "sku": "JZFWCkeM", "subscriptionId": "fJdoGVYY", "targetNamespace": "BekpmWD8", "targetUserId": "MlDWn7ff", "title": "RRcgXdtd"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'IRHG6AKk' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '58ImK9kl' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rw8EHYbO' \
    --body '{"extTxId": "vaPh6STC", "paymentMethod": "vZ371bmu", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GpugT4eQ' \
    --body '{"description": "xQncCY3C"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1ZfFIhwP' \
    --body '{"amount": 9, "currencyCode": "jJqTyKGu", "notifyType": "REFUND", "paymentProvider": "XSOLLA", "salesTax": 27, "vat": 32}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Jc7d6I8U' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    --body '{"allowedBalanceOrigins": ["Other", "Other", "GooglePlay"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "jKDf8TDK", "eventTopic": "46UdsYis", "maxAwarded": 73, "maxAwardedPerUser": 51, "namespaceExpression": "78rcrfZR", "rewardCode": "OoyioTdF", "rewardConditions": [{"condition": "YAgTmThZ", "conditionName": "4LOETBTB", "eventName": "cYbYHWKU", "rewardItems": [{"duration": 95, "itemId": "RkCcityj", "quantity": 33}, {"duration": 89, "itemId": "yHPUYsmt", "quantity": 17}, {"duration": 93, "itemId": "MttEWYNE", "quantity": 71}]}, {"condition": "3l9nhKG2", "conditionName": "hNvfsLuH", "eventName": "V6Hx5QT2", "rewardItems": [{"duration": 53, "itemId": "uMtPCh7T", "quantity": 72}, {"duration": 43, "itemId": "dEdrLtfo", "quantity": 78}, {"duration": 17, "itemId": "SAnIm9nY", "quantity": 83}]}, {"condition": "HkbjEpUb", "conditionName": "StQGZKZ0", "eventName": "rVsXafzY", "rewardItems": [{"duration": 88, "itemId": "bKuA6l3O", "quantity": 14}, {"duration": 82, "itemId": "CKliPpJa", "quantity": 39}, {"duration": 45, "itemId": "gL0rVIA0", "quantity": 10}]}], "userIdExpression": "gqM9lhTd"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateReward' test.out

#- 137 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'FDWNv0tT' \
    --limit '90' \
    --offset '33' \
    --sortBy 'namespace,rewardCode:desc' \
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
    --rewardId 'wCYmSxil' \
    > test.out 2>&1
eval_tap $? 140 'GetReward' test.out

#- 141 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'jYeHRSkb' \
    --body '{"description": "TokJb66H", "eventTopic": "hJ9RLREN", "maxAwarded": 23, "maxAwardedPerUser": 62, "namespaceExpression": "fevS3cG1", "rewardCode": "rTMvOgEA", "rewardConditions": [{"condition": "3LzcrDB1", "conditionName": "OrCCJa3c", "eventName": "T5BzWYTx", "rewardItems": [{"duration": 91, "itemId": "aI28rPvc", "quantity": 30}, {"duration": 85, "itemId": "i2rug522", "quantity": 82}, {"duration": 55, "itemId": "yDHmdlDL", "quantity": 49}]}, {"condition": "LadN9L37", "conditionName": "nT3F5dWA", "eventName": "3nsuyfdY", "rewardItems": [{"duration": 75, "itemId": "KGw4avdu", "quantity": 84}, {"duration": 32, "itemId": "EW0dWqel", "quantity": 38}, {"duration": 23, "itemId": "BCMyNsep", "quantity": 61}]}, {"condition": "jr3uNWlm", "conditionName": "h4DNzOLu", "eventName": "XY4YCBrD", "rewardItems": [{"duration": 97, "itemId": "EPhj9RMs", "quantity": 11}, {"duration": 83, "itemId": "N8rs5M8o", "quantity": 25}, {"duration": 54, "itemId": "IedI4lrH", "quantity": 51}]}], "userIdExpression": "VqrTqo5A"}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateReward' test.out

#- 142 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'E6D7OL6S' \
    > test.out 2>&1
eval_tap $? 142 'DeleteReward' test.out

#- 143 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Ivoh8stJ' \
    --body '{"payload": {"Rtyc0RUE": {}, "S4QSdXIO": {}, "5Eqc3nmK": {}}}' \
    > test.out 2>&1
eval_tap $? 143 'CheckEventCondition' test.out

#- 144 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '9i1yT5L8' \
    --body '{"conditionName": "GD6jaDAp", "userId": "Fu0yGWih"}' \
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
    --body '{"defaultLanguage": "gm0rVwmC", "defaultRegion": "46f8W4Vt", "description": "vuOA76b0", "supportedLanguages": ["PE7AZDEd", "i2YGZFJE", "ppI8TtU7"], "supportedRegions": ["LQp3f2XZ", "rjWzDHoU", "QmekTYPu"], "title": "UhcN3TPQ"}' \
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
    --storeId 'mYPFEGZt' \
    > test.out 2>&1
eval_tap $? 152 'GetStore' test.out

#- 153 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h49MRa63' \
    --body '{"defaultLanguage": "nF4wDATD", "defaultRegion": "EM6sKlKk", "description": "OBNSSeKK", "supportedLanguages": ["23m6oXNZ", "s3YOGPmG", "b63JjJfP"], "supportedRegions": ["o6YrHLsC", "i1mOr2Az", "FKTLH8WG"], "title": "7FJFTjuf"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateStore' test.out

#- 154 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZCoixKKO' \
    > test.out 2>&1
eval_tap $? 154 'DeleteStore' test.out

#- 155 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'e3S3ohcZ' \
    --action 'CREATE' \
    --itemSku 'MS4W25CJ' \
    --itemType 'INGAMEITEM' \
    --limit '4' \
    --offset '46' \
    --selected  \
    --sortBy 'createdAt:asc,updatedAt:desc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'A92Bo7La' \
    --updatedAtStart 'a1kIEBgb' \
    > test.out 2>&1
eval_tap $? 155 'QueryChanges' test.out

#- 156 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '9XHozL8e' \
    > test.out 2>&1
eval_tap $? 156 'PublishAll' test.out

#- 157 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'p4dPaCUI' \
    > test.out 2>&1
eval_tap $? 157 'PublishSelected' test.out

#- 158 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C630024O' \
    > test.out 2>&1
eval_tap $? 158 'SelectAllRecords' test.out

#- 159 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'PxZe9E4J' \
    --action 'DELETE' \
    --itemSku 'kVLk5Pd4' \
    --itemType 'INGAMEITEM' \
    --type 'STORE' \
    --updatedAtEnd 'pj2JfPpj' \
    --updatedAtStart 'YKX9YAzd' \
    > test.out 2>&1
eval_tap $? 159 'GetStatistic' test.out

#- 160 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qWNYCrcb' \
    > test.out 2>&1
eval_tap $? 160 'UnselectAllRecords' test.out

#- 161 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Sib20snx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'by7inT7b' \
    > test.out 2>&1
eval_tap $? 161 'SelectRecord' test.out

#- 162 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'oMT9mDcs' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CyHi8JzC' \
    > test.out 2>&1
eval_tap $? 162 'UnselectRecord' test.out

#- 163 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '6LmKQhCf' \
    --targetStoreId 'THL7h1uD' \
    > test.out 2>&1
eval_tap $? 163 'CloneStore' test.out

#- 164 ExportStore
eval_tap 0 164 'ExportStore # SKIP deprecated' test.out

#- 165 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'yBsUI5ll' \
    --limit '62' \
    --offset '90' \
    --sku 'eFSJ5FJd' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'ndsG4xXj' \
    > test.out 2>&1
eval_tap $? 165 'QuerySubscriptions' test.out

#- 166 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '30fLIEQ8' \
    > test.out 2>&1
eval_tap $? 166 'RecurringChargeSubscription' test.out

#- 167 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'wO75rAjn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 167 'GetTicketDynamic' test.out

#- 168 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'SgE6unGc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "0ZTRWgQJ"}' \
    > test.out 2>&1
eval_tap $? 168 'DecreaseTicketSale' test.out

#- 169 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'QeagYAgP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetTicketBoothID' test.out

#- 170 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName '0EM6SGPo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 98, "orderNo": "UL2J1O7s"}' \
    > test.out 2>&1
eval_tap $? 170 'IncreaseTicketSale' test.out

#- 171 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'siVaWZUw' \
    --body '{"achievements": [{"id": "iCORbbEI", "value": 65}, {"id": "CpmULZty", "value": 52}, {"id": "z2tfQAQO", "value": 2}], "steamUserId": "fbEJn6Wx"}' \
    > test.out 2>&1
eval_tap $? 171 'UnlockSteamUserAchievement' test.out

#- 172 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'IbxXNVtH' \
    --xboxUserId '4yXSvbZz' \
    > test.out 2>&1
eval_tap $? 172 'GetXblUserAchievements' test.out

#- 173 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'drXiQmAS' \
    --body '{"achievements": [{"id": "DClMj58O", "percentComplete": 97}, {"id": "5qmCzFLp", "percentComplete": 69}, {"id": "sWYxuqYl", "percentComplete": 90}], "serviceConfigId": "UAOhS9Mo", "titleId": "j2PCDS1o", "xboxUserId": "lyyoC3NC"}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateXblUserAchievement' test.out

#- 174 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'cb6f88i0' \
    > test.out 2>&1
eval_tap $? 174 'AnonymizeCampaign' test.out

#- 175 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vEHSzGsR' \
    > test.out 2>&1
eval_tap $? 175 'AnonymizeEntitlement' test.out

#- 176 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '1sS6DI9B' \
    > test.out 2>&1
eval_tap $? 176 'AnonymizeFulfillment' test.out

#- 177 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'tg8IVhHl' \
    > test.out 2>&1
eval_tap $? 177 'AnonymizeIntegration' test.out

#- 178 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhKkCzFw' \
    > test.out 2>&1
eval_tap $? 178 'AnonymizeOrder' test.out

#- 179 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '58hjny6R' \
    > test.out 2>&1
eval_tap $? 179 'AnonymizePayment' test.out

#- 180 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'x5tLEmBU' \
    > test.out 2>&1
eval_tap $? 180 'AnonymizeSubscription' test.out

#- 181 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'nEGDJ5kt' \
    > test.out 2>&1
eval_tap $? 181 'AnonymizeWallet' test.out

#- 182 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kjbbjux0' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'CODE' \
    --entitlementName 'DV2KL7VM' \
    --features '44E5B0wK,6LFsERZV,pPDi7YFf' \
    --itemId 'ZRDrXSkv,lPFuC0Xr,nfEn8l9A' \
    --limit '41' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 182 'QueryUserEntitlements' test.out

#- 183 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'FTTXp6HH' \
    --body '[{"endDate": "1994-08-09T00:00:00Z", "grantedCode": "yUKZt6ME", "itemId": "x2kne8tJ", "itemNamespace": "JzmnrwYo", "language": "pUj_cZBB-jZ", "quantity": 76, "region": "UTn0Gs7m", "source": "IAP", "startDate": "1971-12-12T00:00:00Z", "storeId": "z0qjEgYO"}, {"endDate": "1998-04-25T00:00:00Z", "grantedCode": "1HzGgIfv", "itemId": "dtM6CWpG", "itemNamespace": "qkgz0JU0", "language": "kSri", "quantity": 66, "region": "zAYPhjjX", "source": "REDEEM_CODE", "startDate": "1993-06-03T00:00:00Z", "storeId": "WbhkGipQ"}, {"endDate": "1985-05-01T00:00:00Z", "grantedCode": "e6K4HM4X", "itemId": "aySXGd04", "itemNamespace": "bZNB4L07", "language": "KPi-Nfoe", "quantity": 4, "region": "sVyXBKiM", "source": "PROMOTION", "startDate": "1973-12-14T00:00:00Z", "storeId": "tpyeuolA"}]' \
    > test.out 2>&1
eval_tap $? 183 'GrantUserEntitlement' test.out

#- 184 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FNEph63r' \
    --activeOnly  \
    --appId 'gQP1v2ow' \
    > test.out 2>&1
eval_tap $? 184 'GetUserAppEntitlementByAppId' test.out

#- 185 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'VWbZpodL' \
    --activeOnly  \
    --limit '21' \
    --offset '13' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 185 'QueryUserEntitlementsByAppType' test.out

#- 186 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '0EoPAgZi' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'K4CifJZr' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlementByItemId' test.out

#- 187 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'iouFZ6Tu' \
    --activeOnly  \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'dGS7Anm0' \
    > test.out 2>&1
eval_tap $? 187 'GetUserEntitlementBySku' test.out

#- 188 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgIj1M2q' \
    --appIds 't0Kx5woD,RCruVrS6,engElYq1' \
    --itemIds 'k8iGuE2I,7lOgQRm7,MPLUhn44' \
    --skus '7J5JCcDK,ZERSsi4W,oeOBTi3f' \
    > test.out 2>&1
eval_tap $? 188 'ExistsAnyUserActiveEntitlement' test.out

#- 189 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'vl8kzwMo' \
    --itemIds 'pMebmkgu,7NWAAf0E,X5XbDBUF' \
    > test.out 2>&1
eval_tap $? 189 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 190 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MFGG3AJ3' \
    --appId 'j0cnSor3' \
    > test.out 2>&1
eval_tap $? 190 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 191 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XN0X2CeH' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'fMbNLsPx' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementOwnershipByItemId' test.out

#- 192 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '4xH5QjaT' \
    --ids 'fIoRSjKJ,h4q3iSEC,0WYU5LoQ' \
    > test.out 2>&1
eval_tap $? 192 'GetUserEntitlementOwnershipByItemIds' test.out

#- 193 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'mrjnGvbb' \
    --entitlementClazz 'APP' \
    --sku 'qxCmVMCf' \
    > test.out 2>&1
eval_tap $? 193 'GetUserEntitlementOwnershipBySku' test.out

#- 194 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'weM9SFRu' \
    --entitlementIds '0SBTglcc' \
    > test.out 2>&1
eval_tap $? 194 'RevokeUserEntitlements' test.out

#- 195 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'JLhEAkqt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kfIm8Crc' \
    > test.out 2>&1
eval_tap $? 195 'GetUserEntitlement' test.out

#- 196 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'eysjLO9v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QpIZnpwp' \
    --body '{"endDate": "1983-05-05T00:00:00Z", "nullFieldList": ["dxWCeg6F", "Pc3xnh8i", "DEOCc2no"], "startDate": "1988-03-12T00:00:00Z", "status": "CONSUMED", "useCount": 67}' \
    > test.out 2>&1
eval_tap $? 196 'UpdateUserEntitlement' test.out

#- 197 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'sJbAOdib' \
    --namespace "$AB_NAMESPACE" \
    --userId '4En9HDJT' \
    --body '{"options": ["U7byPI5k", "h8avKQ6E", "3Z9Nkd7V"], "requestId": "NEoIjtrU", "useCount": 12}' \
    > test.out 2>&1
eval_tap $? 197 'ConsumeUserEntitlement' test.out

#- 198 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'q2BASH7l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CAeM1SCy' \
    > test.out 2>&1
eval_tap $? 198 'DisableUserEntitlement' test.out

#- 199 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'JtdlKUir' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eoq07sJt' \
    > test.out 2>&1
eval_tap $? 199 'EnableUserEntitlement' test.out

#- 200 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'UpVafqyV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n1swjnf2' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementHistories' test.out

#- 201 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'nYDe3p2E' \
    --namespace "$AB_NAMESPACE" \
    --userId '0YZbYHJf' \
    > test.out 2>&1
eval_tap $? 201 'RevokeUserEntitlement' test.out

#- 202 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'sqRTuGlg' \
    --body '{"duration": 23, "endDate": "1974-05-11T00:00:00Z", "itemId": "kgWp1kai", "itemSku": "bSaRxnsI", "language": "OUc8GtfH", "order": {"currency": {"currencyCode": "dJHQtoPd", "currencySymbol": "qBvepwU2", "currencyType": "VIRTUAL", "decimals": 90, "namespace": "omVGEd0P"}, "ext": {"uCaIKpTP": {}, "9CZk2r8T": {}, "u5hcJQUW": {}}, "free": true}, "orderNo": "ibRsnxPM", "origin": "Other", "quantity": 5, "region": "5GkpmNIj", "source": "REDEEM_CODE", "startDate": "1973-05-02T00:00:00Z", "storeId": "7GZTn1fa"}' \
    > test.out 2>&1
eval_tap $? 202 'FulfillItem' test.out

#- 203 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'qL8gDwkT' \
    --body '{"code": "bVAS4xyt", "language": "Pojs_WvSc_459", "region": "hiOtGcrG"}' \
    > test.out 2>&1
eval_tap $? 203 'RedeemCode' test.out

#- 204 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'C4qVZtdg' \
    --body '{"origin": "Twitch", "rewards": [{"currency": {"currencyCode": "oQQtxIur", "namespace": "Lm6M9BZr"}, "item": {"itemId": "gr1IpIRn", "itemSku": "8dYdGP5A", "itemType": "RWGuH8WH"}, "quantity": 2, "type": "CURRENCY"}, {"currency": {"currencyCode": "Kymv7gfH", "namespace": "k0y9dnNa"}, "item": {"itemId": "9Dg9gU8G", "itemSku": "QDO9pzAf", "itemType": "qgm4DPiN"}, "quantity": 10, "type": "ITEM"}, {"currency": {"currencyCode": "V30GBZiz", "namespace": "sWMRVtDW"}, "item": {"itemId": "gabR6wpe", "itemSku": "GleOxQXD", "itemType": "9oP6iBif"}, "quantity": 93, "type": "CURRENCY"}], "source": "OTHER"}' \
    > test.out 2>&1
eval_tap $? 204 'FulfillRewards' test.out

#- 205 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'a0BBSUEG' \
    --endTime 'yCioWtlu' \
    --limit '59' \
    --offset '71' \
    --productId 't18AIlBR' \
    --startTime '8UT0Xp02' \
    --status 'FULFILLED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 205 'QueryUserIAPOrders' test.out

#- 206 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'fdnYDZdB' \
    > test.out 2>&1
eval_tap $? 206 'QueryAllUserIAPOrders' test.out

#- 207 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'MCYQ36K4' \
    --endTime 'PTK8I8oR' \
    --limit '37' \
    --offset '34' \
    --startTime 'SzRmQG4O' \
    --status 'SUCCESS' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 207 'QueryUserIAPConsumeHistory' test.out

#- 208 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZYRcLUZn' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "Saj-Vudk-kI", "productId": "UaxhWVck", "region": "LN5BErUi", "type": "PLAYSTATION"}' \
    > test.out 2>&1
eval_tap $? 208 'MockFulfillIAPItem' test.out

#- 209 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'cGpfVcA1' \
    --itemId 'S4oEgbR9' \
    --limit '37' \
    --offset '76' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 209 'QueryUserOrders' test.out

#- 210 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '8hs0UITX' \
    --body '{"currencyCode": "mrTLLSEL", "currencyNamespace": "SxrRMA8Z", "discountedPrice": 82, "ext": {"nKkAZG36": {}, "NPTV0vlg": {}, "dq2TvddR": {}}, "itemId": "oayMSZxe", "language": "KRIur9IS", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 27, "quantity": 86, "region": "VLzConlI", "returnUrl": "4L2czfnX", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 210 'AdminCreateUserOrder' test.out

#- 211 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'VeDgMm3j' \
    --itemId 'JdtLoZvB' \
    > test.out 2>&1
eval_tap $? 211 'CountOfPurchasedItem' test.out

#- 212 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rIvaUfGv' \
    --userId 'WCCBBI7o' \
    > test.out 2>&1
eval_tap $? 212 'GetUserOrder' test.out

#- 213 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QfQJGahZ' \
    --userId 'PGNfolio' \
    --body '{"status": "REFUNDED", "statusReason": "j4mCij96"}' \
    > test.out 2>&1
eval_tap $? 213 'UpdateUserOrderStatus' test.out

#- 214 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'VkMzUzfJ' \
    --userId 'HJOoJcpY' \
    > test.out 2>&1
eval_tap $? 214 'FulfillUserOrder' test.out

#- 215 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QQsLuaO0' \
    --userId 'RM7mySkP' \
    > test.out 2>&1
eval_tap $? 215 'GetUserOrderGrant' test.out

#- 216 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KwjaFkxf' \
    --userId 'DBywlSI7' \
    > test.out 2>&1
eval_tap $? 216 'GetUserOrderHistories' test.out

#- 217 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9QQUOKTO' \
    --userId 'iHqlNIKj' \
    --body '{"additionalData": {"cardSummary": "VCJZDwLl"}, "authorisedTime": "1972-02-24T00:00:00Z", "chargebackReversedTime": "1987-01-28T00:00:00Z", "chargebackTime": "1987-06-13T00:00:00Z", "chargedTime": "1984-02-02T00:00:00Z", "createdTime": "1977-07-13T00:00:00Z", "currency": {"currencyCode": "iGtM0I1h", "currencySymbol": "RBn9xXcg", "currencyType": "REAL", "decimals": 42, "namespace": "9u0e4aUe"}, "customParameters": {"Kdgq9QLj": {}, "1afaaKrO": {}, "Wh23gQAo": {}}, "extOrderNo": "gF3UhuIJ", "extTxId": "rgR9Sv55", "extUserId": "xGCH3Vh0", "issuedAt": "1974-04-30T00:00:00Z", "metadata": {"A3RodlhZ": "uD4HzQrR", "aynJfHH7": "fK89nk1Z", "YdbrMq1G": "E02lCiOl"}, "namespace": "ixoTr4WZ", "nonceStr": "B2sSlD2X", "paymentMethod": "kL4hcatT", "paymentMethodFee": 28, "paymentOrderNo": "FRteK08T", "paymentProvider": "PAYPAL", "paymentProviderFee": 65, "paymentStationUrl": "D705WaZF", "price": 38, "refundedTime": "1979-11-14T00:00:00Z", "salesTax": 41, "sandbox": false, "sku": "oj45OrNi", "status": "CHARGEBACK_REVERSED", "statusReason": "4p1G2FeK", "subscriptionId": "qLCz9NrH", "subtotalPrice": 96, "targetNamespace": "mCvNTiDe", "targetUserId": "pKimylhe", "tax": 5, "totalPrice": 16, "totalTax": 66, "txEndTime": "1999-06-13T00:00:00Z", "type": "zD89sORN", "userId": "oDcmBSGO", "vat": 69}' \
    > test.out 2>&1
eval_tap $? 217 'ProcessUserOrderNotification' test.out

#- 218 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'aUKS0cQf' \
    --userId 'Uw8MtMUz' \
    > test.out 2>&1
eval_tap $? 218 'DownloadUserOrderReceipt' test.out

#- 219 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'XQEeamcX' \
    --body '{"currencyCode": "cu3OhAL3", "currencyNamespace": "uLwGyxYF", "customParameters": {"VVAoX1EJ": {}, "HBYmJO6b": {}, "dM8nMoAJ": {}}, "description": "aN9hNz0p", "extOrderNo": "5g8Whyoz", "extUserId": "LAxdjdat", "itemType": "COINS", "language": "eQ-dBJI_uN", "metadata": {"7gaAhkGX": "jyxhUO8t", "ZiOwmdSC": "rxBzOD7y", "dWmWUCBM": "zTm14za4"}, "notifyUrl": "8UnPoFtk", "omitNotification": true, "platform": "WrrVhsrU", "price": 86, "recurringPaymentOrderNo": "0bmzkSuG", "region": "DCSl2aAO", "returnUrl": "sFFqSnYM", "sandbox": true, "sku": "58Xg2nDl", "subscriptionId": "d2SkmSic", "title": "vYfxwMUm"}' \
    > test.out 2>&1
eval_tap $? 219 'CreateUserPaymentOrder' test.out

#- 220 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ksTfrEUJ' \
    --userId 'WAws1XCE' \
    --body '{"description": "ICpBibNR"}' \
    > test.out 2>&1
eval_tap $? 220 'RefundUserPaymentOrder' test.out

#- 221 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'FMA1Az0B' \
    --body '{"code": "YbXl7enY", "orderNo": "jQQp66Fz"}' \
    > test.out 2>&1
eval_tap $? 221 'ApplyUserRedemption' test.out

#- 222 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'hRGzi5VE' \
    --chargeStatus 'NEVER' \
    --itemId 'KCPQ5Xmd' \
    --limit '90' \
    --offset '63' \
    --sku 'UAANJwv3' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserSubscriptions' test.out

#- 223 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'w0j9YtZQ' \
    --excludeSystem  \
    --limit '41' \
    --offset '9' \
    --subscriptionId 'w8IGXr7R' \
    > test.out 2>&1
eval_tap $? 223 'GetUserSubscriptionActivities' test.out

#- 224 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ojXYI1nQ' \
    --body '{"grantDays": 94, "itemId": "kFOs6OIP", "language": "xfXGGu8s", "reason": "hnISeKN3", "region": "rsddgkzp", "source": "vvuiVvAl"}' \
    > test.out 2>&1
eval_tap $? 224 'PlatformSubscribeSubscription' test.out

#- 225 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tVMmbicZ' \
    --itemId '6Kwfj34n' \
    > test.out 2>&1
eval_tap $? 225 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 226 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7Q4nGQxw' \
    --userId 'y9BmM4py' \
    > test.out 2>&1
eval_tap $? 226 'GetUserSubscription' test.out

#- 227 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'i1bkso9B' \
    --userId 'WFzValUU' \
    > test.out 2>&1
eval_tap $? 227 'DeleteUserSubscription' test.out

#- 228 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2JJiOEVK' \
    --userId 'lTBN6XPZ' \
    --force  \
    --body '{"immediate": false, "reason": "4PUgGNXb"}' \
    > test.out 2>&1
eval_tap $? 228 'CancelSubscription' test.out

#- 229 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gfjdfKnJ' \
    --userId 'GhDMrKcK' \
    --body '{"grantDays": 76, "reason": "SdV0bsOJ"}' \
    > test.out 2>&1
eval_tap $? 229 'GrantDaysToSubscription' test.out

#- 230 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'drbXy3yO' \
    --userId 'JgADa1rg' \
    --excludeFree  \
    --limit '41' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 230 'GetUserSubscriptionBillingHistories' test.out

#- 231 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uCBvqDzE' \
    --userId '0XwwlhrQ' \
    --body '{"additionalData": {"cardSummary": "kqTVoIrs"}, "authorisedTime": "1986-10-16T00:00:00Z", "chargebackReversedTime": "1991-08-29T00:00:00Z", "chargebackTime": "1979-07-30T00:00:00Z", "chargedTime": "1972-07-27T00:00:00Z", "createdTime": "1989-01-02T00:00:00Z", "currency": {"currencyCode": "n4kgeBRm", "currencySymbol": "3ZRFXnMg", "currencyType": "VIRTUAL", "decimals": 25, "namespace": "SeP9WE9M"}, "customParameters": {"Dle7wKr1": {}, "pWclBMcn": {}, "x9vXHsND": {}}, "extOrderNo": "Byg3CQYG", "extTxId": "fx71T6Rj", "extUserId": "d7m8yeUG", "issuedAt": "1984-04-01T00:00:00Z", "metadata": {"gfbNzGNa": "6EjXE8zL", "euP2LE1G": "68JPBNo6", "dBwIPUzg": "22UR7i4I"}, "namespace": "CbMWO9mB", "nonceStr": "TqXXkYK2", "paymentMethod": "ZGAapjqW", "paymentMethodFee": 1, "paymentOrderNo": "xAW8rQkH", "paymentProvider": "WXPAY", "paymentProviderFee": 13, "paymentStationUrl": "5GZ1YSZP", "price": 51, "refundedTime": "1981-02-09T00:00:00Z", "salesTax": 17, "sandbox": false, "sku": "x7VHsS3E", "status": "AUTHORISE_FAILED", "statusReason": "EqLiG7nr", "subscriptionId": "lIcnBbrZ", "subtotalPrice": 89, "targetNamespace": "4QjGsnOv", "targetUserId": "9sV5lMA4", "tax": 18, "totalPrice": 89, "totalTax": 53, "txEndTime": "1972-04-25T00:00:00Z", "type": "tNv9oeko", "userId": "MYxDkdyR", "vat": 9}' \
    > test.out 2>&1
eval_tap $? 231 'ProcessUserSubscriptionNotification' test.out

#- 232 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '7KdsW8sx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xeyZuTrF' \
    --body '{"count": 84, "orderNo": "kLhJBhno"}' \
    > test.out 2>&1
eval_tap $? 232 'AcquireUserTicket' test.out

#- 233 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '8g8vSwnF' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserCurrencyWallets' test.out

#- 234 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'lTUjHaP5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MxXGoIUk' \
    --limit '96' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 234 'ListUserCurrencyTransactions' test.out

#- 235 CheckWallet
eval_tap 0 235 'CheckWallet # SKIP deprecated' test.out

#- 236 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '2VGu6fFM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VE9Az1c7' \
    --body '{"amount": 97, "expireAt": "1980-12-08T00:00:00Z", "origin": "Stadia", "reason": "S9zcFG0c", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 236 'CreditUserWallet' test.out

#- 237 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'ybe3Nrpy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWjvWeJl' \
    --body '{"amount": 31, "walletPlatform": "Playstation"}' \
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
    --nextEvaluatedKey 'J73hnY5J' \
    --end 'eAsrQ28e' \
    --start 'qRcmWHZc' \
    > test.out 2>&1
eval_tap $? 245 'SyncOrders' test.out

#- 246 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["ZDsRazMq", "itQh9JGZ", "Xtp3VaBz"], "apiKey": "YF9vcjnH", "authoriseAsCapture": false, "blockedPaymentMethods": ["VUU9VP5Z", "QzHBA2xG", "SMrZUdTv"], "clientKey": "TSAbmwpt", "dropInSettings": "cXRF4OcW", "liveEndpointUrlPrefix": "H0d4cuMO", "merchantAccount": "2qONaTBr", "notificationHmacKey": "cxtYevMh", "notificationPassword": "JxtoYVNW", "notificationUsername": "OwU6D6iC", "returnUrl": "1efF8sR4", "settings": "g4OugL0b"}' \
    > test.out 2>&1
eval_tap $? 246 'TestAdyenConfig' test.out

#- 247 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "CZi8Zf59", "privateKey": "SFu50FEe", "publicKey": "VxINr1Jr", "returnUrl": "9hDPv6bb"}' \
    > test.out 2>&1
eval_tap $? 247 'TestAliPayConfig' test.out

#- 248 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "ct2PsLaO", "secretKey": "23kA8joA"}' \
    > test.out 2>&1
eval_tap $? 248 'TestCheckoutConfig' test.out

#- 249 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'VRBMCzPI' \
    > test.out 2>&1
eval_tap $? 249 'DebugMatchedPaymentMerchantConfig' test.out

#- 250 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "OBilmzLx", "clientSecret": "KEzc1ADY", "returnUrl": "6iir8iCk", "webHookId": "8JyIJQEm"}' \
    > test.out 2>&1
eval_tap $? 250 'TestPayPalConfig' test.out

#- 251 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["FtZDbqtv", "mLLm6Wiy", "VbxIxx1O"], "publishableKey": "sou67C7r", "secretKey": "FWP1lvEl", "webhookSecret": "Xq4j1Hyg"}' \
    > test.out 2>&1
eval_tap $? 251 'TestStripeConfig' test.out

#- 252 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "KQWAZqRk", "key": "6nQdFTmu", "mchid": "uh7wZ9mx", "returnUrl": "tSMH9mZr"}' \
    > test.out 2>&1
eval_tap $? 252 'TestWxPayConfig' test.out

#- 253 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "qhPFmssO", "flowCompletionUrl": "3Mvz7SVo", "merchantId": 22, "projectId": 56, "projectSecretKey": "QL2Hm8x2"}' \
    > test.out 2>&1
eval_tap $? 253 'TestXsollaConfig' test.out

#- 254 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'MWVbVKBS' \
    > test.out 2>&1
eval_tap $? 254 'GetPaymentMerchantConfig' test.out

#- 255 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'jdqMJiVQ' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["oBd1Y7Lg", "W0Gd2eAk", "IS92yLtM"], "apiKey": "7XbXTotJ", "authoriseAsCapture": true, "blockedPaymentMethods": ["usNRW3r7", "p5HXJjMH", "IesfPxaw"], "clientKey": "SK5sk2U0", "dropInSettings": "KYDjWgCC", "liveEndpointUrlPrefix": "nGZLyDvG", "merchantAccount": "FleAiNg2", "notificationHmacKey": "4YU4tfRr", "notificationPassword": "6wTDDyw0", "notificationUsername": "LyhCw6Bg", "returnUrl": "9aH1jyPu", "settings": "Eg67at5O"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateAdyenConfig' test.out

#- 256 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'omW8DKx6' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 256 'TestAdyenConfigById' test.out

#- 257 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'xdeJLfO6' \
    --sandbox  \
    --validate  \
    --body '{"appId": "M5dwRun6", "privateKey": "P4o03cmS", "publicKey": "Pk3312Tq", "returnUrl": "j2w9bBHQ"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateAliPayConfig' test.out

#- 258 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'JwZCm4Eb' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 258 'TestAliPayConfigById' test.out

#- 259 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'wfjGgdQg' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "HQozE8My", "secretKey": "oZvC3uZU"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateCheckoutConfig' test.out

#- 260 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'NtyXSDRU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 260 'TestCheckoutConfigById' test.out

#- 261 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '1Ndxp5eb' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "JvTUSRct", "clientSecret": "WJ18wxQM", "returnUrl": "9lnPKAvF", "webHookId": "VzyZfP37"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdatePayPalConfig' test.out

#- 262 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'UkvB0vov' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 262 'TestPayPalConfigById' test.out

#- 263 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'oYD8ADS3' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["FduRxcGY", "L97ZZTf2", "UaqSJ6qn"], "publishableKey": "VpWC3E4l", "secretKey": "R9Hx6D6U", "webhookSecret": "EOGgIsiS"}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateStripeConfig' test.out

#- 264 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'T6qpa5qE' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 264 'TestStripeConfigById' test.out

#- 265 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'tU6oti5j' \
    --validate  \
    --body '{"appId": "cFI3ezVf", "key": "PdHhR1IA", "mchid": "oNWF254h", "returnUrl": "cczaDElL"}' \
    > test.out 2>&1
eval_tap $? 265 'UpdateWxPayConfig' test.out

#- 266 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'zLCgXrOw' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 266 'UpdateWxPayConfigCert' test.out

#- 267 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'c0bV0kQZ' \
    > test.out 2>&1
eval_tap $? 267 'TestWxPayConfigById' test.out

#- 268 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'd0oymevL' \
    --validate  \
    --body '{"apiKey": "g7IKNFgX", "flowCompletionUrl": "P3xUdnkK", "merchantId": 97, "projectId": 78, "projectSecretKey": "02oBASa4"}' \
    > test.out 2>&1
eval_tap $? 268 'UpdateXsollaConfig' test.out

#- 269 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'okemaAhF' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfigById' test.out

#- 270 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'C8bsAk9c' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 270 'UpdateXsollaUIConfig' test.out

#- 271 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '11' \
    --namespace "$AB_NAMESPACE" \
    --offset '85' \
    --region 'J27ajGVl' \
    > test.out 2>&1
eval_tap $? 271 'QueryPaymentProviderConfig' test.out

#- 272 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "H6wl1QhG", "region": "DusKYNA6", "sandboxTaxJarApiToken": "mn3KgD4T", "specials": ["STRIPE", "STRIPE", "ADYEN"], "taxJarApiToken": "9Qp58FSK", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 272 'CreatePaymentProviderConfig' test.out

#- 273 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 273 'GetAggregatePaymentProviders' test.out

#- 274 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '2TwlDgU9' \
    > test.out 2>&1
eval_tap $? 274 'DebugMatchedPaymentProviderConfig' test.out

#- 275 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 275 'GetSpecialPaymentProviders' test.out

#- 276 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'AdCkICso' \
    --body '{"aggregate": "XSOLLA", "namespace": "6WtP4GEC", "region": "JrHxUe2k", "sandboxTaxJarApiToken": "xDjEI8dR", "specials": ["CHECKOUT", "ALIPAY", "WALLET"], "taxJarApiToken": "aSQARhZ5", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 276 'UpdatePaymentProviderConfig' test.out

#- 277 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'XDJlR48d' \
    > test.out 2>&1
eval_tap $? 277 'DeletePaymentProviderConfig' test.out

#- 278 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 278 'GetPaymentTaxConfig' test.out

#- 279 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "iE6PUPJC", "taxJarApiToken": "oJVbum6C", "taxJarEnabled": false, "taxJarProductCodesMapping": {"3omfmMOY": "Ic8zKHOV", "Iv6RFE1P": "HfaSDXr5", "CRiRgc7Z": "Jug9OaYy"}}' \
    > test.out 2>&1
eval_tap $? 279 'UpdatePaymentTaxConfig' test.out

#- 280 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'JOEUPYi8' \
    --end 'UXfq46Dm' \
    --start '0G5rhdBi' \
    > test.out 2>&1
eval_tap $? 280 'SyncPaymentOrders' test.out

#- 281 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Ouao3laS' \
    --storeId 'e1IlUmHs' \
    > test.out 2>&1
eval_tap $? 281 'PublicGetRootCategories' test.out

#- 282 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'nl8XTbXQ' \
    --storeId 'RcpV88Dj' \
    > test.out 2>&1
eval_tap $? 282 'DownloadCategories' test.out

#- 283 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'QokRzckw' \
    --namespace "$AB_NAMESPACE" \
    --language 'ssB4Es29' \
    --storeId 'DmaNi3Pl' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetCategory' test.out

#- 284 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'CdqVrWQt' \
    --namespace "$AB_NAMESPACE" \
    --language 'VGwpEOPX' \
    --storeId 'BpJEhn4V' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetChildCategories' test.out

#- 285 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'n4xJWgtw' \
    --namespace "$AB_NAMESPACE" \
    --language 'DXvUI1Va' \
    --storeId 'vBVr1pEr' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetDescendantCategories' test.out

#- 286 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 286 'PublicListCurrencies' test.out

#- 287 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'XMGTGgsS' \
    --region 'joeCvjbS' \
    --storeId 'Ql64N9XD' \
    --appId 'jAlqk8KB' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetItemByAppId' test.out

#- 288 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --baseAppId 'mJGIjhux' \
    --categoryPath 'Hy4aAQ9w' \
    --features 'geLYfF6Z' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --language 'x0Ycf6D4' \
    --limit '8' \
    --offset '91' \
    --region 'npIw6MtZ' \
    --sortBy 'displayOrder:desc,createdAt:asc,updatedAt:asc' \
    --storeId 'eAkFKAJB' \
    --tags '4woh7XpS' \
    > test.out 2>&1
eval_tap $? 288 'PublicQueryItems' test.out

#- 289 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'w8XzPBxV' \
    --region 'tOT2P54Z' \
    --storeId 'pNQMc9TR' \
    --sku 'uOH66OZ1' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetItemBySku' test.out

#- 290 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'Zj3jyavE' \
    --region 'SYTvn4Am' \
    --storeId 's2Cf2rKx' \
    --itemIds '53UJYfLc' \
    > test.out 2>&1
eval_tap $? 290 'PublicBulkGetItems' test.out

#- 291 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["rP4Dq9g2", "49LeHWH8", "voUpEmLB"]}' \
    > test.out 2>&1
eval_tap $? 291 'PublicValidateItemPurchaseCondition' test.out

#- 292 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'MEDIA' \
    --limit '66' \
    --offset '47' \
    --region 'oTsK13qa' \
    --storeId 'lH786syc' \
    --keyword 'YINE4zZq' \
    --language 'PyNXUQ5Q' \
    > test.out 2>&1
eval_tap $? 292 'PublicSearchItems' test.out

#- 293 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'EgZzAPHb' \
    --namespace "$AB_NAMESPACE" \
    --language 'ShhETJFg' \
    --region 'cjWXV7dG' \
    --storeId 'wwYEEE1O' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetApp' test.out

#- 294 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'Yaa2iVp2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 294 'PublicGetItemDynamicData' test.out

#- 295 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'WJrauZwK' \
    --namespace "$AB_NAMESPACE" \
    --language 'XKKbwYrw' \
    --populateBundle  \
    --region 'QCT3pnwM' \
    --storeId 'phDCyTc0' \
    > test.out 2>&1
eval_tap $? 295 'PublicGetItem' test.out

#- 296 GetPaymentCustomization
eval_tap 0 296 'GetPaymentCustomization # SKIP deprecated' test.out

#- 297 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "hvfJTI6b", "paymentProvider": "ADYEN", "returnUrl": "hbdbYW0n", "ui": "3W43XTS6", "zipCode": "ObxK7Sry"}' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetPaymentUrl' test.out

#- 298 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'u2PFSMi5' \
    > test.out 2>&1
eval_tap $? 298 'PublicGetPaymentMethods' test.out

#- 299 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'G1Wz2sfL' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetUnpaidPaymentOrder' test.out

#- 300 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rfLs1okX' \
    --paymentProvider 'PAYPAL' \
    --zipCode 'JRDkAAON' \
    --body '{"token": "k0UoVDIW"}' \
    > test.out 2>&1
eval_tap $? 300 'Pay' test.out

#- 301 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wuo8OXrO' \
    > test.out 2>&1
eval_tap $? 301 'PublicCheckPaymentOrderPaidStatus' test.out

#- 302 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'B9aaLhQq' \
    > test.out 2>&1
eval_tap $? 302 'GetPaymentPublicConfig' test.out

#- 303 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'UwFYMlMg' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetQRCode' test.out

#- 304 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID '6YQtJC7I' \
    --foreinginvoice 'xgYm1wk9' \
    --invoiceId '2yaTtAG5' \
    --payload 's4SrTjve' \
    --redirectResult 'X2CcZj1q' \
    --resultCode 'Zvhyn0Jg' \
    --sessionId 'ZRiVKq4H' \
    --status 'iqRAHQ7b' \
    --token 'a0i7adwZ' \
    --type 'sv9djUkH' \
    --userId 'uRxLhFv6' \
    --orderNo '59jRqHks' \
    --paymentOrderNo 'yRpoDfUK' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'LVqA25Uc' \
    > test.out 2>&1
eval_tap $? 304 'PublicNormalizePaymentReturnUrl' test.out

#- 305 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'UKvIKTBW' \
    --paymentOrderNo '8a8uh3Dq' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 305 'GetPaymentTaxValue' test.out

#- 306 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'DkJmmWMM' \
    > test.out 2>&1
eval_tap $? 306 'GetRewardByCode' test.out

#- 307 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'hFUlCqKr' \
    --limit '35' \
    --offset '34' \
    --sortBy 'namespace:asc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 307 'QueryRewards1' test.out

#- 308 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4rDGAbx5' \
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
    --appIds '3jwq9a09,ISQstD3Y,MVuYagxR' \
    --itemIds 'BPgUESfF,5MQz9Zf7,XqtDrZ3l' \
    --skus 'D1PZ5FuX,xWeHHRF4,AQLqpZla' \
    > test.out 2>&1
eval_tap $? 310 'PublicExistsAnyMyActiveEntitlement' test.out

#- 311 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '3xoOBtpE' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 312 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId '1BZGfj2N' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 313 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku '1Jmfhp2G' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 314 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '0GZ6a91M,QEKMrolH,1ZIth0rA' \
    --itemIds 'gYQVSuT4,r0eWji7O,iS9mgknp' \
    --skus 'K8tDOfzT,p4Bp1JeI,xwpPDF9f' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetEntitlementOwnershipToken' test.out

#- 315 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '0mffM78p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 315 'PublicGetMyWallet' test.out

#- 316 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'hC999ljT' \
    --body '{"epicGamesJwtToken": "ColzgVyP"}' \
    > test.out 2>&1
eval_tap $? 316 'SyncEpicGameDLC' test.out

#- 317 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '9eZs3Un1' \
    --body '{"serviceLabel": 98}' \
    > test.out 2>&1
eval_tap $? 317 'PublicSyncPsnDlcInventory' test.out

#- 318 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'slTyg68C' \
    --body '{"appId": "PQB1Xukc", "steamId": "xiGfJT1j"}' \
    > test.out 2>&1
eval_tap $? 318 'SyncSteamDLC' test.out

#- 319 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '8eygrBee' \
    --body '{"xstsToken": "oOun1gEW"}' \
    > test.out 2>&1
eval_tap $? 319 'SyncXboxDLC' test.out

#- 320 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'qObXGyWX' \
    --appType 'GAME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName '5e7h7ySI' \
    --features 'vRVFomRa,IKg99hcP,VdPGLb24' \
    --itemId 'O2ALWVCY,MIq1B9Fz,VpFVZKy5' \
    --limit '77' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 320 'PublicQueryUserEntitlements' test.out

#- 321 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'AIPqfMTN' \
    --appId 'jhDnlBlS' \
    > test.out 2>&1
eval_tap $? 321 'PublicGetUserAppEntitlementByAppId' test.out

#- 322 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'eet2J3gE' \
    --limit '44' \
    --offset '86' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 322 'PublicQueryUserEntitlementsByAppType' test.out

#- 323 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'mWzgEZuJ' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'EuCxRSm9' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetUserEntitlementByItemId' test.out

#- 324 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'HMahcXR4' \
    --entitlementClazz 'APP' \
    --sku 'XWWC8EEO' \
    > test.out 2>&1
eval_tap $? 324 'PublicGetUserEntitlementBySku' test.out

#- 325 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZAUAPp0' \
    --appIds 'oa1q7Yl0,j6oKDHvn,bVOnZHgE' \
    --itemIds 'a0UVzCPJ,louyE2WH,92LIWJz6' \
    --skus 'PNLKVnyi,hBOkgTen,Ipwlqh8R' \
    > test.out 2>&1
eval_tap $? 325 'PublicExistsAnyUserActiveEntitlement' test.out

#- 326 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZcJGIygX' \
    --appId 'UtZ6ySPu' \
    > test.out 2>&1
eval_tap $? 326 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 327 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nug2urEj' \
    --entitlementClazz 'MEDIA' \
    --itemId 'TXD86inC' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 328 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lg3VkDtp' \
    --ids 'uznwFwTr,qJqzUCT3,weveg2EC' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 329 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZSvEQ3SF' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku '55abfhMc' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 330 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'TpBe7GFA' \
    --namespace "$AB_NAMESPACE" \
    --userId '9I4n3wlC' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetUserEntitlement' test.out

#- 331 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'CqDik4cc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lS7fiZep' \
    --body '{"options": ["ArLEbdoW", "wTFzy9cr", "PEtPKtGV"], "requestId": "sD0hKHS2", "useCount": 8}' \
    > test.out 2>&1
eval_tap $? 331 'PublicConsumeUserEntitlement' test.out

#- 332 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'TLP4P5ER' \
    --body '{"code": "attkGdPC", "language": "fkv_603", "region": "OBMbrHRt"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicRedeemCode' test.out

#- 333 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ULa5J1sI' \
    --body '{"excludeOldTransactions": true, "language": "dyL_088", "productId": "ZyMqsshs", "receiptData": "Br7aZ6yG", "region": "B1oE2ziG", "transactionId": "yPBAtqDM"}' \
    > test.out 2>&1
eval_tap $? 333 'PublicFulfillAppleIAPItem' test.out

#- 334 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FTpQpxoj' \
    --body '{"epicGamesJwtToken": "z7nOweO6"}' \
    > test.out 2>&1
eval_tap $? 334 'SyncEpicGamesInventory' test.out

#- 335 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wVQpSmOx' \
    --body '{"autoAck": false, "language": "gne-990", "orderId": "Ad6J3CIF", "packageName": "Oq6mqPl0", "productId": "7VUZ4k5N", "purchaseTime": 3, "purchaseToken": "MCi8jGMw", "region": "GefBGQDH"}' \
    > test.out 2>&1
eval_tap $? 335 'PublicFulfillGoogleIAPItem' test.out

#- 336 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'VgoRTRk4' \
    --body '{"currencyCode": "MDFYlafZ", "price": 0.7072097285886481, "productId": "VWAHuuLf", "serviceLabel": 10}' \
    > test.out 2>&1
eval_tap $? 336 'PublicReconcilePlayStationStore' test.out

#- 337 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '3cUQWiXW' \
    --body '{"appId": "ZMo1QvMO", "language": "QT-VGJJ", "region": "nrxNuGEw", "stadiaPlayerId": "6VQHZyv1"}' \
    > test.out 2>&1
eval_tap $? 337 'SyncStadiaEntitlement' test.out

#- 338 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'fyj00ZHa' \
    --body '{"appId": "3kwHcJr3", "currencyCode": "juDY0fik", "language": "OzMG_ovdu_Yu", "price": 0.14691954839631038, "productId": "b2kXl6nE", "region": "wmsvBLjo", "steamId": "CilCOdek"}' \
    > test.out 2>&1
eval_tap $? 338 'SyncSteamInventory' test.out

#- 339 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'FbTBlwgK' \
    --body '{"gameId": "xaj8ilAl", "language": "Rf_LQgd", "region": "hG59tKto"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncTwitchDropsEntitlement' test.out

#- 340 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'OkHfuNKw' \
    --body '{"currencyCode": "0vxOwAoC", "price": 0.3685627703609866, "productId": "EDFvnJ57", "xstsToken": "dSqWbxWQ"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncXboxInventory' test.out

#- 341 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'ESa5dC2C' \
    --itemId '9YlBDVGc' \
    --limit '88' \
    --offset '24' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 341 'PublicQueryUserOrders' test.out

#- 342 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'sA2OOqVO' \
    --body '{"currencyCode": "ERE77UBP", "discountedPrice": 78, "ext": {"jHhaSwHC": {}, "zIdTCeUz": {}, "soO8kqIp": {}}, "itemId": "Ep8m4HQ6", "language": "IpI-ugLN-Xr", "price": 20, "quantity": 38, "region": "311IRNUB", "returnUrl": "WU7KPdsm"}' \
    > test.out 2>&1
eval_tap $? 342 'PublicCreateUserOrder' test.out

#- 343 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hZvRL09a' \
    --userId '2UjSv6uC' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserOrder' test.out

#- 344 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'FDxuHMae' \
    --userId 's8WWsQNQ' \
    > test.out 2>&1
eval_tap $? 344 'PublicCancelUserOrder' test.out

#- 345 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'T1leg9Lm' \
    --userId 'Vz2jk42X' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserOrderHistories' test.out

#- 346 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mkvoSARP' \
    --userId 'XVL6uWNv' \
    > test.out 2>&1
eval_tap $? 346 'PublicDownloadUserOrderReceipt' test.out

#- 347 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'rWlOF1Jd' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetPaymentAccounts' test.out

#- 348 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'tfGvvEyv' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'pFeXcH33' \
    > test.out 2>&1
eval_tap $? 348 'PublicDeletePaymentAccount' test.out

#- 349 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '1ki2p49o' \
    --chargeStatus 'CHARGED' \
    --itemId 'TvCz1dJe' \
    --limit '3' \
    --offset '22' \
    --sku 'EoIA7qqZ' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 349 'PublicQueryUserSubscriptions' test.out

#- 350 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '65auliKC' \
    --body '{"currencyCode": "D1zwi7o4", "itemId": "ZCqG3vcS", "language": "EWg", "region": "85OALMze", "returnUrl": "4LzTgQZW", "source": "AGUkK9IW"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicSubscribeSubscription' test.out

#- 351 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'GEiUbL4U' \
    --itemId 'iR9kobnq' \
    > test.out 2>&1
eval_tap $? 351 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 352 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CtyB9Fm0' \
    --userId 'UCPLYi3C' \
    > test.out 2>&1
eval_tap $? 352 'PublicGetUserSubscription' test.out

#- 353 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Fy9veJyb' \
    --userId 'EcFv2tfW' \
    > test.out 2>&1
eval_tap $? 353 'PublicChangeSubscriptionBillingAccount' test.out

#- 354 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '84SSyxh2' \
    --userId 'RZTWdnZP' \
    --body '{"immediate": true, "reason": "Fj46FLuf"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicCancelSubscription' test.out

#- 355 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wi5GZqIq' \
    --userId 'UtoanZlv' \
    --excludeFree  \
    --limit '75' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 355 'PublicGetUserSubscriptionBillingHistories' test.out

#- 356 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '8cNNmV0c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b7CtaCS8' \
    > test.out 2>&1
eval_tap $? 356 'PublicGetWallet' test.out

#- 357 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'HOnahsrZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yd2z0B0a' \
    --limit '93' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 357 'PublicListUserWalletTransactions' test.out

#- 358 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'mO8g2uyy' \
    --baseAppId 'hYFV7Vdk' \
    --categoryPath 'eqFzAVaO' \
    --features 'dNcDEnsY' \
    --includeSubCategoryItem  \
    --itemStatus 'ACTIVE' \
    --itemType 'SUBSCRIPTION' \
    --limit '64' \
    --offset '7' \
    --region 'kXG6sTPm' \
    --sortBy 'name:desc,displayOrder,displayOrder:asc' \
    --storeId 'MU0sAn7j' \
    --tags 's0xlzs0N' \
    --targetNamespace 'C4uO19tj' \
    > test.out 2>&1
eval_tap $? 358 'QueryItems1' test.out

#- 359 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '23PWL7tQ' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 359 'ImportStore1' test.out

#- 360 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kRseWfmF' \
    --body '{"itemIds": ["zgK5z3x7", "a8rF1P6i", "457dv6kz"]}' \
    > test.out 2>&1
eval_tap $? 360 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE