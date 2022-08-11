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
echo "1..347"

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
    --body '{"context": {"item": {"appId": "7lD5g0Yv", "appType": "DLC", "baseAppId": "BubyUG3z", "boothName": "prjJnadV", "boundItemIds": ["RTeYKBMy", "G7mi45zN", "GQoOWQoS"], "categoryPath": "77gTrCcI", "clazz": "ARDkHVTf", "createdAt": "1994-08-05T00:00:00Z", "description": "4sMaRDhp", "displayOrder": 78, "entitlementType": "DURABLE", "ext": {"ZehJFVXO": {}, "9lshKMcF": {}, "Dz2QZQ2C": {}}, "features": ["0hvQoEWX", "9gsaMLya", "b1mhvwZu"], "fresh": true, "images": [{"as": "Jj37SGde", "caption": "RKGjRjfK", "height": 2, "imageUrl": "qk8oWCjo", "smallImageUrl": "eyNLLkDJ", "width": 87}, {"as": "e98g8rJn", "caption": "RVIsw7RE", "height": 72, "imageUrl": "a4gvKc2j", "smallImageUrl": "cB4a1gae", "width": 99}, {"as": "fQ19fHgA", "caption": "jrK8xdmS", "height": 74, "imageUrl": "Mz9ECgOt", "smallImageUrl": "HiXaS4Qv", "width": 4}], "itemId": "s978wZec", "itemIds": ["keL6ZZNY", "2Mfw9ZCh", "g6YRB2Nw"], "itemQty": {"qspUGGuy": 4, "EiUpturs": 78, "RZ485sPm": 70}, "itemType": "APP", "language": "BKBeMKik", "listable": true, "localExt": {"oVnkZB1G": {}, "jP8m8gIB": {}, "9ejJvx6J": {}}, "longDescription": "YIH5nqvq", "maxCount": 98, "maxCountPerUser": 17, "name": "jCFgmbf0", "namespace": "s7rDFBAW", "optionBoxConfig": {"boxItems": [{"count": 75, "itemId": "4ZyhRUNe", "itemSku": "Wl0TRbjT"}, {"count": 38, "itemId": "aLLWpYj2", "itemSku": "3q4GV4wR"}, {"count": 6, "itemId": "RivjZLoJ", "itemSku": "bOUGJR5d"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 89, "comparison": "is", "name": "jYs2fZ6N", "predicateType": "SeasonTierPredicate", "value": "4g88VLRl", "values": ["8hYMZIs0", "WTWroW3x", "RqMBCJtR"]}, {"anyOf": 63, "comparison": "excludes", "name": "hqoQ0jBy", "predicateType": "EntitlementPredicate", "value": "u60TPSF2", "values": ["fRRu1m3l", "zMdlUnOe", "aPO3BXoZ"]}, {"anyOf": 34, "comparison": "includes", "name": "fLvY9cIQ", "predicateType": "SeasonTierPredicate", "value": "Wjcbwr4c", "values": ["2lTv0rzA", "jlsEqvVE", "1s0noZK6"]}]}, {"operator": "or", "predicates": [{"anyOf": 14, "comparison": "includes", "name": "JqEF6BSG", "predicateType": "EntitlementPredicate", "value": "gygMwiUX", "values": ["sl3TxHyF", "DpIeUi9p", "Yb7GVgxB"]}, {"anyOf": 57, "comparison": "isNot", "name": "bK7Qa7WH", "predicateType": "SeasonPassPredicate", "value": "SDDRSjNA", "values": ["DDQ32agR", "6ldJLFSr", "lPm6rgAr"]}, {"anyOf": 44, "comparison": "includes", "name": "DFUV54T1", "predicateType": "SeasonTierPredicate", "value": "7NTDEBzJ", "values": ["BV2vknpN", "TPX0bCoy", "TduEbHs4"]}]}, {"operator": "and", "predicates": [{"anyOf": 48, "comparison": "includes", "name": "PRWgsZux", "predicateType": "EntitlementPredicate", "value": "F5ZoNdp0", "values": ["RQ6oz62a", "vQ7wIZMb", "gRJzBtP2"]}, {"anyOf": 79, "comparison": "isGreaterThan", "name": "agCy3S40", "predicateType": "SeasonTierPredicate", "value": "Dg2Mf9P8", "values": ["WDEK2uaI", "1aqy6CPD", "70fBvf5p"]}, {"anyOf": 11, "comparison": "isLessThan", "name": "wXKYneJA", "predicateType": "SeasonPassPredicate", "value": "mDssdynJ", "values": ["A9kAWZOY", "Dxe2H608", "pnoE2Jp8"]}]}]}, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 79, "fixedTrialCycles": 52, "graceDays": 83}, "region": "QxgMewLE", "regionData": [{"currencyCode": "ntZIQhQO", "currencyNamespace": "0T9YH54y", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1994-04-11T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1977-12-02T00:00:00Z", "discountedPrice": 82, "expireAt": "1994-05-30T00:00:00Z", "price": 61, "purchaseAt": "1991-12-05T00:00:00Z", "trialPrice": 44}, {"currencyCode": "8ZMK8JMw", "currencyNamespace": "fvimsvF7", "currencyType": "VIRTUAL", "discountAmount": 93, "discountExpireAt": "1998-11-16T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1971-08-20T00:00:00Z", "discountedPrice": 60, "expireAt": "1992-03-06T00:00:00Z", "price": 98, "purchaseAt": "1973-01-31T00:00:00Z", "trialPrice": 43}, {"currencyCode": "o77E90an", "currencyNamespace": "tcw9jfVO", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1975-06-13T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1983-09-20T00:00:00Z", "discountedPrice": 29, "expireAt": "1992-01-07T00:00:00Z", "price": 33, "purchaseAt": "1995-11-24T00:00:00Z", "trialPrice": 22}], "seasonType": "PASS", "sku": "Eicc9wiE", "stackable": false, "status": "INACTIVE", "tags": ["MK5jNRCO", "GFGJJxk0", "9Z5oZ3Qb"], "targetCurrencyCode": "OJlzm7eR", "targetItemId": "gkztw0lM", "targetNamespace": "fjzZqdFT", "thumbnailUrl": "I5gTXwvX", "title": "fF750HrY", "updatedAt": "1993-07-03T00:00:00Z", "useCount": 48}, "namespace": "b9t9kc7a", "order": {"currency": {"currencyCode": "2NByFhCT", "currencySymbol": "JOrvKE6S", "currencyType": "REAL", "decimals": 62, "namespace": "wTdPH00E"}, "ext": {"txRc3HHw": {}, "qtbhuRu3": {}, "GBM8gtEQ": {}}, "free": false}, "source": "DLC"}, "script": "zPHTu1HW", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'jA67XFvv' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'PgZpokJT' \
    --body '{"grantDays": "sKlQbrr6"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'ewreFJ7N' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'CwhTfDaF' \
    --body '{"grantDays": "0Xg6RYAI"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name '7Qk5eD8e' \
    --offset '72' \
    --tag 'CyNix626' \
    > test.out 2>&1
eval_tap $? 8 'QueryCampaigns' test.out

#- 9 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "e7AF409T", "items": [{"extraSubscriptionDays": 4, "itemId": "usZEE6UK", "itemName": "7hu5l4AA", "quantity": 14}, {"extraSubscriptionDays": 32, "itemId": "Y4XmpRzp", "itemName": "0Wc6rfOq", "quantity": 10}, {"extraSubscriptionDays": 28, "itemId": "atGTHLaq", "itemName": "8EbGsNgs", "quantity": 87}], "maxRedeemCountPerCampaignPerUser": 21, "maxRedeemCountPerCode": 62, "maxRedeemCountPerCodePerUser": 61, "maxSaleCount": 59, "name": "Jj2ZZA8y", "redeemEnd": "1984-04-05T00:00:00Z", "redeemStart": "1990-05-12T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["nrw6KQ0q", "YigfWFrc", "w23UhkfP"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateCampaign' test.out

#- 10 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'COWmYWI4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetCampaign' test.out

#- 11 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'Hv6kJrlG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "jptjHFw5", "items": [{"extraSubscriptionDays": 73, "itemId": "vwuk9zei", "itemName": "MCAcRThE", "quantity": 84}, {"extraSubscriptionDays": 68, "itemId": "l2y2gnQg", "itemName": "CqZP8dpP", "quantity": 14}, {"extraSubscriptionDays": 54, "itemId": "tZSCH2wP", "itemName": "uXy1e84z", "quantity": 54}], "maxRedeemCountPerCampaignPerUser": 75, "maxRedeemCountPerCode": 36, "maxRedeemCountPerCodePerUser": 30, "maxSaleCount": 47, "name": "TD79VLt1", "redeemEnd": "1973-09-06T00:00:00Z", "redeemStart": "1973-12-28T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["UjgBRg73", "oZrBUdFS", "P8yea5TC"]}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateCampaign' test.out

#- 12 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'Lazq0bVe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetCampaignDynamic' test.out

#- 13 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CGBqBKAd' \
    > test.out 2>&1
eval_tap $? 13 'GetRootCategories' test.out

#- 14 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qCbJs4Hs' \
    --body '{"categoryPath": "aJOWnmhC", "localizationDisplayNames": {"vIrNZbbb": "E2D5Xf1e", "sWxLrqeQ": "8enwuCLm", "jNWH1nLK": "22l5Z8sE"}}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCategory' test.out

#- 15 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TTcv3UWS' \
    > test.out 2>&1
eval_tap $? 15 'ListCategoriesBasic' test.out

#- 16 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'PQ6FbYdu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Oj3pL45u' \
    > test.out 2>&1
eval_tap $? 16 'GetCategory' test.out

#- 17 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'O3mnp2jt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eBnon4qE' \
    --body '{"localizationDisplayNames": {"bpkJ3QIP": "m9kAktoI", "Xoz9D5fN": "nGW0SMmx", "DYdwe3Yo": "UZaK16Kz"}}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCategory' test.out

#- 18 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'iKf2TeNH' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4On5xVjp' \
    > test.out 2>&1
eval_tap $? 18 'DeleteCategory' test.out

#- 19 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'NAfYEMyu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'n5x2z16M' \
    > test.out 2>&1
eval_tap $? 19 'GetChildCategories' test.out

#- 20 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'hOxbX5Cm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DyFZArdv' \
    > test.out 2>&1
eval_tap $? 20 'GetDescendantCategories' test.out

#- 21 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '3z8yBXpe' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '98' \
    --code 'E4lR8OgN' \
    --limit '83' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 21 'QueryCodes' test.out

#- 22 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'yFjCvOla' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 68}' \
    > test.out 2>&1
eval_tap $? 22 'CreateCodes' test.out

#- 23 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'b1K5YJqg' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '44' \
    > test.out 2>&1
eval_tap $? 23 'Download' test.out

#- 24 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'a7UyDUOu' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '6' \
    > test.out 2>&1
eval_tap $? 24 'BulkDisableCodes' test.out

#- 25 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'sUAFJXsn' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '88' \
    > test.out 2>&1
eval_tap $? 25 'BulkEnableCodes' test.out

#- 26 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '4RjcGGMZ' \
    --namespace "$AB_NAMESPACE" \
    --code 'fOGez0PO' \
    --limit '47' \
    --offset '31' \
    --userId 'drMUBv22' \
    > test.out 2>&1
eval_tap $? 26 'QueryRedeemHistory' test.out

#- 27 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'MNFj0ZJP' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 27 'GetCode' test.out

#- 28 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'XeQUNjmd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DisableCode' test.out

#- 29 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'onFXtHJu' \
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
    --body '{"currencyCode": "QERJD5DG", "currencySymbol": "2iBzgA3q", "currencyType": "REAL", "decimals": 43, "localizationDescriptions": {"bEJVJUe0": "uCz51xyH", "UXG71w2J": "ma85b3CD", "kGIvDqLm": "hG1E1Ian"}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateCurrency' test.out

#- 32 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'ucP6eio1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"THYyUq1V": "7DIqrQrB", "Sl8jhApB": "esJkk5xM", "VeW3g0jL": "wGm6dH65"}}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateCurrency' test.out

#- 33 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'eP4oDRgT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteCurrency' test.out

#- 34 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'uBHZTBJo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetCurrencyConfig' test.out

#- 35 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '10FA4vjO' \
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
    --body '{"data": [{"id": "e7Qagdj0", "rewards": [{"currency": {"currencyCode": "1g3YwCAJ", "namespace": "BP7QsVMn"}, "item": {"itemId": "RpFIWTMM", "itemSku": "MnEmpDwW", "itemType": "Kc7PoqS7"}, "quantity": 35, "type": "CURRENCY"}, {"currency": {"currencyCode": "lSF1NdVO", "namespace": "2HsbRTvW"}, "item": {"itemId": "JhdeKsNq", "itemSku": "NjYtveiA", "itemType": "xbfHFTA2"}, "quantity": 40, "type": "ITEM"}, {"currency": {"currencyCode": "DDNqG6NB", "namespace": "XAfbdAJC"}, "item": {"itemId": "xeOEy4WM", "itemSku": "orjDpeul", "itemType": "UgCiqeFm"}, "quantity": 31, "type": "ITEM"}]}, {"id": "x4P7Gewh", "rewards": [{"currency": {"currencyCode": "ifya0JW9", "namespace": "cq0DOBQB"}, "item": {"itemId": "SN6LXBTL", "itemSku": "CXQrxiNg", "itemType": "xPvQAg7n"}, "quantity": 78, "type": "CURRENCY"}, {"currency": {"currencyCode": "prBu8N6o", "namespace": "ekGQpsgK"}, "item": {"itemId": "Y7Y3gexj", "itemSku": "83YkmtAg", "itemType": "7zc519BA"}, "quantity": 84, "type": "CURRENCY"}, {"currency": {"currencyCode": "CefDhHGJ", "namespace": "rS2tsvzy"}, "item": {"itemId": "I6LysifW", "itemSku": "moZ7OhbD", "itemType": "yeUgXovk"}, "quantity": 77, "type": "ITEM"}]}, {"id": "CGHVfjs4", "rewards": [{"currency": {"currencyCode": "ihsPcMah", "namespace": "wBvgTY1h"}, "item": {"itemId": "RPz5OXPX", "itemSku": "D4jKMIAi", "itemType": "A9T4VIDH"}, "quantity": 21, "type": "ITEM"}, {"currency": {"currencyCode": "yFhnDAZQ", "namespace": "DpXEGNtz"}, "item": {"itemId": "yuiA2hs9", "itemSku": "O0YHAbDz", "itemType": "XLvHrhAt"}, "quantity": 15, "type": "CURRENCY"}, {"currency": {"currencyCode": "FCQI3DUx", "namespace": "iyNhDJrU"}, "item": {"itemId": "np4ejoXb", "itemSku": "7vLxXJhJ", "itemType": "NipT2tMd"}, "quantity": 28, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"S1nMGwHe": "6jjtsaXw", "gtlzRO6B": "bJDi6O0O", "pUCJeQ9F": "pmuxAlgM"}}, {"platform": "PSN", "platformDlcIdMap": {"nqrhKwGA": "jkL7j9Iy", "PLa3OIqj": "eFTBcHHQ", "Sgl3Jxda": "2hcIXFkl"}}, {"platform": "STEAM", "platformDlcIdMap": {"aJlGsYKM": "58KBt3zF", "W6NHwHvU": "nafMGXgz", "3BsHQB25": "1H3ZlVwp"}}]}' \
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
    --appType 'DLC' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'NfQSbA87' \
    --itemId 'qlrxrsLa,V6dcLOfi,WRWAWcMe' \
    --limit '31' \
    --offset '56' \
    --userId 'dvnHQsXs' \
    > test.out 2>&1
eval_tap $? 42 'QueryEntitlements' test.out

#- 43 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'fIassqmQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetEntitlement' test.out

#- 44 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '22' \
    --offset '75' \
    --status 'SUCCESS' \
    --userId 'GUCbMkuF' \
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
    --body '{"bundleId": "PaCnPotk", "password": "VvpTooCL"}' \
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
    --body '{"sandboxId": "jyOy0UXk"}' \
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
    --body '{"applicationName": "fLfpZZ3V", "serviceAccountId": "ZF4PRaR9"}' \
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
    --body '{"data": [{"itemIdentity": "hbfxF9DW", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"LrBFjGha": "YF7mML4K", "FJ19lVqd": "QECSBrZr", "ynonJaTd": "K1aXqu7L"}}, {"itemIdentity": "lYYFB8bm", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"ZHgk44JH": "5rnDLrcb", "NXpqA3vN": "FURWZbnF", "sdFDLDHF": "DFDeVSiZ"}}, {"itemIdentity": "QnCkKzIq", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"q35IgTEw": "0vbFw2UG", "dQaFKJy1": "ZjLY95TX", "1tGQDcmK": "64PhZ0rX"}}]}' \
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
    --body '{"environment": "Qe5LHrEk"}' \
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
    --body '{"appId": "tvnNBHCA", "publisherAuthenticationKey": "x4bVOcu5"}' \
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
    --body '{"clientId": "cSHAPyUG", "clientSecret": "JGTzLSWn", "organizationId": "CJ3fh2Pi"}' \
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
    --body '{"relyingPartyCert": "HN1Vzwq7"}' \
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
    --password 'ZfUAsWS0' \
    > test.out 2>&1
eval_tap $? 73 'UpdateXblBPCertFile' test.out

#- 74 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AXqmQ0ao' \
    --body '{"categoryPath": "yOrzj3MU", "targetItemId": "Wra53BPW", "targetNamespace": "BZVrNrYP"}' \
    > test.out 2>&1
eval_tap $? 74 'SyncInGameItem' test.out

#- 75 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VTzpFiMb' \
    --body '{"appId": "toPRmyKM", "appType": "SOFTWARE", "baseAppId": "7rNhkMxt", "boothName": "s8m5ch3c", "categoryPath": "YLLa4rGR", "clazz": "6AVOAFkK", "displayOrder": 48, "entitlementType": "DURABLE", "ext": {"HmcMQBf1": {}, "O8sVdSVW": {}, "uxLoH7n8": {}}, "features": ["eE62F9y2", "VPJAv0Tk", "Efa9KI9p"], "images": [{"as": "OqsqmBcE", "caption": "ZlLaydYD", "height": 45, "imageUrl": "0QmAGtoT", "smallImageUrl": "TnJjPRy8", "width": 92}, {"as": "3uDR4R0V", "caption": "vjj2ab7X", "height": 90, "imageUrl": "TMQfUYNQ", "smallImageUrl": "RW9SNpAC", "width": 20}, {"as": "9LBWkX3X", "caption": "e9IkLlht", "height": 80, "imageUrl": "EU57cHr8", "smallImageUrl": "hL4Jaa8j", "width": 62}], "itemIds": ["C65ZGx4T", "RbF2WCyF", "HQfgGH6Z"], "itemQty": {"lfkj4VO0": 54, "5BMdB7LG": 93, "mKLcBuAN": 23}, "itemType": "MEDIA", "listable": false, "localizations": {"pao5w5ct": {"description": "Fw2aYlJ6", "localExt": {"qrJVhEM0": {}, "G8QOgHhy": {}, "sSaIzKJM": {}}, "longDescription": "nxM8ciws", "title": "vUfTsTPu"}, "see0XhAm": {"description": "vkPjvcDY", "localExt": {"wnfUnQJc": {}, "d0n9roPX": {}, "OJx8zSIg": {}}, "longDescription": "LB8rrNsq", "title": "uWWNPcn0"}, "WxJ59SHN": {"description": "UHxwjiGC", "localExt": {"jfovF3ux": {}, "V2mAuwnk": {}, "f0D7yxPJ": {}}, "longDescription": "s5C355GH", "title": "vW7fQK7e"}}, "maxCount": 25, "maxCountPerUser": 68, "name": "h0I0WTR3", "optionBoxConfig": {"boxItems": [{"count": 88, "itemId": "SOERBkqZ", "itemSku": "d07pmIxF"}, {"count": 10, "itemId": "2M2nZ0V6", "itemSku": "JGX9F68j"}, {"count": 47, "itemId": "15WQsooa", "itemSku": "w8W8tEOu"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 99, "fixedTrialCycles": 87, "graceDays": 2}, "regionData": {"lHfCbRTU": [{"currencyCode": "57ijQN2Z", "currencyNamespace": "DB9cTkom", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1973-10-27T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1994-09-02T00:00:00Z", "discountedPrice": 0, "expireAt": "1999-05-14T00:00:00Z", "price": 4, "purchaseAt": "1977-08-10T00:00:00Z", "trialPrice": 12}, {"currencyCode": "j5iA4oVx", "currencyNamespace": "JSaTTJDp", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1998-04-16T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1992-07-28T00:00:00Z", "discountedPrice": 13, "expireAt": "1977-05-25T00:00:00Z", "price": 74, "purchaseAt": "1997-09-22T00:00:00Z", "trialPrice": 53}, {"currencyCode": "XXe7ZXnC", "currencyNamespace": "9HBR7OMy", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1980-09-12T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1977-04-02T00:00:00Z", "discountedPrice": 93, "expireAt": "1995-07-11T00:00:00Z", "price": 20, "purchaseAt": "1997-12-11T00:00:00Z", "trialPrice": 93}], "MkJHchxv": [{"currencyCode": "7I1gQhmS", "currencyNamespace": "9lPInQ73", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1998-11-24T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1978-07-10T00:00:00Z", "discountedPrice": 0, "expireAt": "1994-10-14T00:00:00Z", "price": 1, "purchaseAt": "1980-05-29T00:00:00Z", "trialPrice": 46}, {"currencyCode": "9oYxv26D", "currencyNamespace": "YUAGntZ5", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1983-07-29T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1975-10-17T00:00:00Z", "discountedPrice": 17, "expireAt": "1988-07-05T00:00:00Z", "price": 19, "purchaseAt": "1991-01-22T00:00:00Z", "trialPrice": 81}, {"currencyCode": "SENbQJjR", "currencyNamespace": "Td1mBm7h", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1986-02-01T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1999-11-09T00:00:00Z", "discountedPrice": 2, "expireAt": "1976-05-29T00:00:00Z", "price": 78, "purchaseAt": "1983-05-28T00:00:00Z", "trialPrice": 90}], "Vn3H8JsY": [{"currencyCode": "jTTeZB8f", "currencyNamespace": "Nax99UIC", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1986-07-09T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1986-03-10T00:00:00Z", "discountedPrice": 82, "expireAt": "1973-03-12T00:00:00Z", "price": 99, "purchaseAt": "1992-01-30T00:00:00Z", "trialPrice": 10}, {"currencyCode": "D61G7m3F", "currencyNamespace": "ehwxk3PL", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1998-07-26T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1973-03-05T00:00:00Z", "discountedPrice": 87, "expireAt": "1974-05-15T00:00:00Z", "price": 90, "purchaseAt": "1982-02-22T00:00:00Z", "trialPrice": 2}, {"currencyCode": "gYJxJuNv", "currencyNamespace": "RhGRRp1S", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1985-01-10T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1995-10-29T00:00:00Z", "discountedPrice": 78, "expireAt": "1979-11-26T00:00:00Z", "price": 91, "purchaseAt": "1994-12-07T00:00:00Z", "trialPrice": 7}]}, "seasonType": "TIER", "sku": "WKhIe8IW", "stackable": true, "status": "ACTIVE", "tags": ["bOwaf0CU", "BbxF9D0L", "JoxcQMam"], "targetCurrencyCode": "jEV99mEM", "targetNamespace": "mMqUNll2", "thumbnailUrl": "64xAFvAQ", "useCount": 93}' \
    > test.out 2>&1
eval_tap $? 75 'CreateItem' test.out

#- 76 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2GWio24Z' \
    --appId 'iuytMvIk' \
    > test.out 2>&1
eval_tap $? 76 'GetItemByAppId' test.out

#- 77 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'hwsziDtR' \
    --baseAppId '1LOEOGHr' \
    --categoryPath 'cEVcuWWw' \
    --features 'dK9kHN2D' \
    --itemType 'INGAMEITEM' \
    --limit '40' \
    --offset '39' \
    --region 'JvJIiGvq' \
    --sortBy 'displayOrder:desc,displayOrder' \
    --storeId 'Nffm8aqX' \
    --tags 'hxFArU4N' \
    --targetNamespace 'd59zH8Cw' \
    > test.out 2>&1
eval_tap $? 77 'QueryItems' test.out

#- 78 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'Q4W8ket1,n8ollLCz,P2vVvFLe' \
    > test.out 2>&1
eval_tap $? 78 'ListBasicItemsByFeatures' test.out

#- 79 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'qo9FFPkD' \
    --sku 'uX81NJLm' \
    > test.out 2>&1
eval_tap $? 79 'GetItemBySku' test.out

#- 80 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'iiKfvjMt' \
    --populateBundle  \
    --region 'L9c3bQeq' \
    --storeId 'hz5SMAWu' \
    --sku 'QPDl0ceI' \
    > test.out 2>&1
eval_tap $? 80 'GetLocaleItemBySku' test.out

#- 81 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'RW5L1RjP' \
    --sku 'bd7MmqFf' \
    > test.out 2>&1
eval_tap $? 81 'GetItemIdBySku' test.out

#- 82 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'MHi06efD,jk5fKThW,q4VWhgHM' \
    --storeId '7oH7AcVq' \
    > test.out 2>&1
eval_tap $? 82 'GetBulkItemIdBySkus' test.out

#- 83 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '6xyiUKEy' \
    --region 'YZ7u9oP8' \
    --storeId 'QCvTYDDC' \
    --itemIds 'Xetb75Sj' \
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
    --userId 'OvZxi30T' \
    --body '{"itemIds": ["xbAfUirv", "DTrIBBxx", "JhEJdnWb"]}' \
    > test.out 2>&1
eval_tap $? 85 'ValidateItemPurchaseCondition' test.out

#- 86 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'APP' \
    --limit '55' \
    --offset '88' \
    --storeId '0eseh91i' \
    --keyword '3qaTpCik' \
    --language 'LnrCWhBz' \
    > test.out 2>&1
eval_tap $? 86 'SearchItems' test.out

#- 87 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '54' \
    --offset '54' \
    --sortBy 'createdAt,name:desc,displayOrder:asc' \
    --storeId 'UQvgnTqP' \
    > test.out 2>&1
eval_tap $? 87 'QueryUncategorizedItems' test.out

#- 88 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'RyltpUXL' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'iUWrcKGY' \
    > test.out 2>&1
eval_tap $? 88 'GetItem' test.out

#- 89 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'LnKwGp45' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ETOUwwm1' \
    --body '{"appId": "Hs5SPNMS", "appType": "GAME", "baseAppId": "BLbm2K9F", "boothName": "vpwew3Tz", "categoryPath": "D9KQgX74", "clazz": "8bbKAPfq", "displayOrder": 87, "entitlementType": "CONSUMABLE", "ext": {"BMMZlKgQ": {}, "u5p06v53": {}, "tT8aAtgn": {}}, "features": ["AlX5CMQk", "ZzkM7nRJ", "j5jwlC9Z"], "images": [{"as": "pBbreTGC", "caption": "Wux9DwrE", "height": 13, "imageUrl": "lydKNd8p", "smallImageUrl": "uozuT0ot", "width": 61}, {"as": "zwbRoKX5", "caption": "1fWHVpb1", "height": 98, "imageUrl": "wA4EEMTU", "smallImageUrl": "4Neo3UYA", "width": 97}, {"as": "WWHSnt7Q", "caption": "pjOu8Rlc", "height": 54, "imageUrl": "nfWEsGD5", "smallImageUrl": "MoVH6MzH", "width": 61}], "itemIds": ["Gl7HkYc9", "eHLcRnPM", "9pnznGv1"], "itemQty": {"H6UWECqe": 63, "JPr6tVrj": 39, "6vEGVp06": 25}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"4RCnwduI": {"description": "cfaIx704", "localExt": {"VWZedimE": {}, "sg9hB8bH": {}, "UJXUtrQf": {}}, "longDescription": "qHtkvRdM", "title": "FwhayDUB"}, "uCXUekMj": {"description": "jrWr2rMj", "localExt": {"qCyWrpSh": {}, "CMctsZFx": {}, "YQZjbwj0": {}}, "longDescription": "AhdSAdt1", "title": "LlMw3Xu3"}, "3zaYuk5v": {"description": "PG4Iw6Dx", "localExt": {"cGY5WNRk": {}, "iuafNqlY": {}, "UWYRuUWy": {}}, "longDescription": "YO2PORJ8", "title": "8sX1T49W"}}, "maxCount": 72, "maxCountPerUser": 83, "name": "svlfFu2R", "optionBoxConfig": {"boxItems": [{"count": 80, "itemId": "GldImBNL", "itemSku": "qcmEC9H8"}, {"count": 76, "itemId": "4Ec4IUmF", "itemSku": "osLg7RkP"}, {"count": 91, "itemId": "xfvfy04Y", "itemSku": "AWNi1rRk"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 16, "fixedTrialCycles": 32, "graceDays": 41}, "regionData": {"mj0GoKk2": [{"currencyCode": "1mwWSir9", "currencyNamespace": "aW8KTK0w", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1987-03-22T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1997-11-26T00:00:00Z", "discountedPrice": 64, "expireAt": "1997-01-06T00:00:00Z", "price": 11, "purchaseAt": "1975-02-01T00:00:00Z", "trialPrice": 66}, {"currencyCode": "sIlQSIsw", "currencyNamespace": "J360ec1V", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1977-08-14T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1976-06-22T00:00:00Z", "discountedPrice": 12, "expireAt": "1978-05-31T00:00:00Z", "price": 66, "purchaseAt": "1984-02-27T00:00:00Z", "trialPrice": 29}, {"currencyCode": "lKVBRyQB", "currencyNamespace": "lWWzpd3e", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1999-01-18T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1997-12-06T00:00:00Z", "discountedPrice": 73, "expireAt": "1988-06-23T00:00:00Z", "price": 8, "purchaseAt": "1990-08-28T00:00:00Z", "trialPrice": 61}], "dc3R8lnP": [{"currencyCode": "5Yjqtl7E", "currencyNamespace": "275wdOm4", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1971-02-06T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1997-10-17T00:00:00Z", "discountedPrice": 50, "expireAt": "1989-11-29T00:00:00Z", "price": 8, "purchaseAt": "1987-09-20T00:00:00Z", "trialPrice": 9}, {"currencyCode": "Q6YGtHcT", "currencyNamespace": "ScBq7BBB", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1995-03-12T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1981-01-30T00:00:00Z", "discountedPrice": 32, "expireAt": "1988-04-01T00:00:00Z", "price": 41, "purchaseAt": "1991-02-20T00:00:00Z", "trialPrice": 99}, {"currencyCode": "lHJ5Mujd", "currencyNamespace": "S15ccPSq", "currencyType": "VIRTUAL", "discountAmount": 14, "discountExpireAt": "1982-08-28T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1979-03-27T00:00:00Z", "discountedPrice": 89, "expireAt": "1986-12-15T00:00:00Z", "price": 3, "purchaseAt": "1994-10-01T00:00:00Z", "trialPrice": 19}], "GR4Yxhvt": [{"currencyCode": "lzQT3LwR", "currencyNamespace": "xeusnYl3", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1986-12-31T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1993-08-26T00:00:00Z", "discountedPrice": 97, "expireAt": "1979-08-14T00:00:00Z", "price": 75, "purchaseAt": "1992-11-04T00:00:00Z", "trialPrice": 12}, {"currencyCode": "5KY4VNf9", "currencyNamespace": "SiJ3ADSM", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1996-01-17T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1971-05-11T00:00:00Z", "discountedPrice": 2, "expireAt": "1993-02-12T00:00:00Z", "price": 62, "purchaseAt": "1996-03-02T00:00:00Z", "trialPrice": 16}, {"currencyCode": "fyXw9po9", "currencyNamespace": "FycUBuBF", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1985-10-13T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1990-12-30T00:00:00Z", "discountedPrice": 84, "expireAt": "1982-09-18T00:00:00Z", "price": 11, "purchaseAt": "1972-07-23T00:00:00Z", "trialPrice": 37}]}, "seasonType": "PASS", "sku": "ZBhuFF8g", "stackable": true, "status": "ACTIVE", "tags": ["fILgoKhR", "ITSYcJj8", "Zrh5plyz"], "targetCurrencyCode": "rQJKRBR8", "targetNamespace": "Ty4lMlEN", "thumbnailUrl": "e0cHUIPk", "useCount": 95}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateItem' test.out

#- 90 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'JyxXRUeV' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'xpDfuKXF' \
    > test.out 2>&1
eval_tap $? 90 'DeleteItem' test.out

#- 91 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'eSuKqGIE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 63, "orderNo": "dXNPCUzX"}' \
    > test.out 2>&1
eval_tap $? 91 'AcquireItem' test.out

#- 92 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'JvsEWXjL' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'c7mBiY0c' \
    > test.out 2>&1
eval_tap $? 92 'GetApp' test.out

#- 93 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'jsyrbdRx' \
    --namespace "$AB_NAMESPACE" \
    --storeId '931fvSSd' \
    --body '{"carousel": [{"alt": "O1kf7jxw", "previewUrl": "cZDhg8gz", "thumbnailUrl": "4LfINS3G", "type": "video", "url": "QBkPDhhm", "videoSource": "youtube"}, {"alt": "XTnctXIx", "previewUrl": "grLz4StT", "thumbnailUrl": "5smGNNxj", "type": "image", "url": "hHjDJcSv", "videoSource": "youtube"}, {"alt": "F9uinLLX", "previewUrl": "4tAqRYLo", "thumbnailUrl": "LPjc1aL0", "type": "video", "url": "fQSKIr60", "videoSource": "generic"}], "developer": "JX5Ws4Cq", "forumUrl": "zTLqnych", "genres": ["Adventure", "Simulation", "RPG"], "localizations": {"r3nNKzSi": {"announcement": "gl5Te2vl", "slogan": "noa573Gm"}, "w9uU1VZ6": {"announcement": "ctfuJ6h3", "slogan": "ZzAJS1jd"}, "gke5bp4V": {"announcement": "ZkBqzCWW", "slogan": "40UBpBa0"}}, "platformRequirements": {"2lPykH52": [{"additionals": "lSCczrF0", "directXVersion": "Vsj0fRAI", "diskSpace": "I8x1kn9y", "graphics": "1sMgSazw", "label": "biiroR4W", "osVersion": "j4d0fgO5", "processor": "ul17rwEF", "ram": "393c0rz8", "soundCard": "4JMDQPlw"}, {"additionals": "99hSqgFF", "directXVersion": "bbzy6AMH", "diskSpace": "fmiYwtZR", "graphics": "7xraEIy7", "label": "M3V5ai9F", "osVersion": "pUQbwEva", "processor": "De8N5ziN", "ram": "z4oM9mzl", "soundCard": "gLFhiFq5"}, {"additionals": "3M4X2SP4", "directXVersion": "scsicXmf", "diskSpace": "IPZ3fygO", "graphics": "vEkRwpbT", "label": "AiY5072C", "osVersion": "WimR63EB", "processor": "Ya772sBb", "ram": "lp3WyNz6", "soundCard": "ALesAlOF"}], "41Nv9ji5": [{"additionals": "kGI9f9T7", "directXVersion": "lyi5mEqW", "diskSpace": "mpa96sq9", "graphics": "5ZcfwURs", "label": "KzKAMbzi", "osVersion": "uxx7LdUR", "processor": "8DCr4Qkm", "ram": "83SGgZRy", "soundCard": "PtEjH1Pe"}, {"additionals": "fhzpByvV", "directXVersion": "WjWf9Qi6", "diskSpace": "7hZsDAsq", "graphics": "FVqht5z4", "label": "fKrhPEn9", "osVersion": "jQeZNEGF", "processor": "toOdpNP1", "ram": "0MSzj5kc", "soundCard": "eKcb7zZl"}, {"additionals": "siHpgPrv", "directXVersion": "EipKaaRp", "diskSpace": "3W17lRfg", "graphics": "Uy9CXONg", "label": "iCnHxygZ", "osVersion": "TZBaWoKo", "processor": "mW1HS7M5", "ram": "mXBIVw65", "soundCard": "yAiTs2oB"}], "lGfCRSeD": [{"additionals": "O6mawohh", "directXVersion": "uecEP0aj", "diskSpace": "1hjPP1cs", "graphics": "SGYekJQF", "label": "b6qg7zAY", "osVersion": "MjBQzVBl", "processor": "YwLbycOy", "ram": "MSMbh4iI", "soundCard": "unNsZijd"}, {"additionals": "Legs8HN3", "directXVersion": "GTZPHBk0", "diskSpace": "pTS4XqQh", "graphics": "gVjcVz0D", "label": "jDp7TZXn", "osVersion": "gk4BbINi", "processor": "tEmZUqtx", "ram": "lId8KLV8", "soundCard": "h503zadZ"}, {"additionals": "ikOvCM9z", "directXVersion": "DZ0o7rVa", "diskSpace": "on2KbHfL", "graphics": "QvG4L1gq", "label": "rSMW0O3D", "osVersion": "Ngn6WOIC", "processor": "pFOYMtUO", "ram": "ZvEVl9UB", "soundCard": "gmbruFVy"}]}, "platforms": ["Windows", "Linux", "Windows"], "players": ["MMO", "MMO", "LocalCoop"], "primaryGenre": "Casual", "publisher": "J1wiiBUu", "releaseDate": "1992-02-18T00:00:00Z", "websiteUrl": "aMuApJow"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateApp' test.out

#- 94 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'l3GUn63N' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AwKM7JXa' \
    > test.out 2>&1
eval_tap $? 94 'DisableItem' test.out

#- 95 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'dPAekwJE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetItemDynamicData' test.out

#- 96 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '1uup3MqR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sLYpNVuw' \
    > test.out 2>&1
eval_tap $? 96 'EnableItem' test.out

#- 97 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'zjVw6I8C' \
    --itemId 'XsCc2hDA' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gB5E1Dws' \
    > test.out 2>&1
eval_tap $? 97 'FeatureItem' test.out

#- 98 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'Y88c1slH' \
    --itemId 'UNYdRzok' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FwiSR0NR' \
    > test.out 2>&1
eval_tap $? 98 'DefeatureItem' test.out

#- 99 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'B2lRMVu9' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'SrnrUUqL' \
    --populateBundle  \
    --region 'HZpQ24dV' \
    --storeId 'ZzjPfeUZ' \
    > test.out 2>&1
eval_tap $? 99 'GetLocaleItem' test.out

#- 100 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'PTdTOpcg' \
    --namespace "$AB_NAMESPACE" \
    --storeId '1cnviOql' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 18, "comparison": "is", "name": "VvmxoNqL", "predicateType": "EntitlementPredicate", "value": "33xjzc9T", "values": ["mLUrIG3e", "P4Si6WIL", "hAloyZnK"]}, {"anyOf": 75, "comparison": "isLessThan", "name": "znwEyl6h", "predicateType": "SeasonPassPredicate", "value": "tXDD2oUi", "values": ["9HYIbrZP", "NgXbeSBr", "IUbHy7xx"]}, {"anyOf": 67, "comparison": "isNot", "name": "6aNF6cxx", "predicateType": "SeasonPassPredicate", "value": "3u87tqHb", "values": ["TN504XJq", "DmhgduHM", "PUpKGAPj"]}]}, {"operator": "and", "predicates": [{"anyOf": 77, "comparison": "isGreaterThanOrEqual", "name": "CdixgXDT", "predicateType": "SeasonPassPredicate", "value": "KYln1oKl", "values": ["nG7z7029", "fAHwdSZf", "pvlnnjzP"]}, {"anyOf": 69, "comparison": "is", "name": "vQOGyXil", "predicateType": "SeasonTierPredicate", "value": "hNNVNcVd", "values": ["C1AoVsSQ", "zzzn2Pl3", "nYYrZYMi"]}, {"anyOf": 20, "comparison": "isGreaterThan", "name": "37ushABz", "predicateType": "EntitlementPredicate", "value": "fevROvx6", "values": ["xyCbwGxx", "cU5Lw8LD", "g4uZlLgF"]}]}, {"operator": "or", "predicates": [{"anyOf": 24, "comparison": "isLessThanOrEqual", "name": "pxVHKdf6", "predicateType": "SeasonPassPredicate", "value": "W6li93Nw", "values": ["bFvZ3JYV", "N9545qCW", "ynUAINct"]}, {"anyOf": 77, "comparison": "isGreaterThan", "name": "V0uzwSS6", "predicateType": "SeasonPassPredicate", "value": "Tst4jvXW", "values": ["nnaH6yMT", "m9GvdAwe", "VYF41zeD"]}, {"anyOf": 4, "comparison": "excludes", "name": "pxNAhcZp", "predicateType": "SeasonTierPredicate", "value": "bAukjGnr", "values": ["Jw0QSCrg", "EEHehMlc", "5uR6lC1y"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItemPurchaseCondition' test.out

#- 101 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'tpO9V6zf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "7uzzf3OB"}' \
    > test.out 2>&1
eval_tap $? 101 'ReturnItem' test.out

#- 102 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --name 'edufQGpC' \
    --offset '13' \
    --tag 'PSWPHAgb' \
    > test.out 2>&1
eval_tap $? 102 'QueryKeyGroups' test.out

#- 103 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HB8eZvE1", "name": "75P4LUaS", "status": "ACTIVE", "tags": ["kbsapD4a", "CuJbdlpX", "gktVXY6i"]}' \
    > test.out 2>&1
eval_tap $? 103 'CreateKeyGroup' test.out

#- 104 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'lDmn4Rze' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetKeyGroup' test.out

#- 105 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'HFUxe36o' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "UigvoYMV", "name": "CtwXZP8z", "status": "INACTIVE", "tags": ["ARo3mSc2", "lPAQHKix", "JQKnpLVA"]}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateKeyGroup' test.out

#- 106 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'pmOc8gnk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetKeyGroupDynamic' test.out

#- 107 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'XZp09DUq' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '60' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 107 'ListKeys' test.out

#- 108 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'cERf79t5' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 108 'UploadKeys' test.out

#- 109 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'DYMyABwS' \
    --limit '64' \
    --offset '32' \
    --orderNos 'HUeXtSSo,lHk98ArJ,a9n9XDUt' \
    --sortBy '5c33XEdg' \
    --startTime 'Zuj3aRdR' \
    --status 'REFUND_FAILED' \
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
    --orderNo 'ytwuNseW' \
    > test.out 2>&1
eval_tap $? 111 'GetOrder' test.out

#- 112 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WVu6Kcrx' \
    --body '{"description": "iuSqGTIj"}' \
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
    --body '{"dryRun": true, "notifyUrl": "8p1RHTjv", "privateKey": "h6ZVFfWQ"}' \
    > test.out 2>&1
eval_tap $? 114 'UpdatePaymentCallbackConfig' test.out

#- 115 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'P5EdlC6K' \
    --externalId 'jHUn9zAe' \
    --limit '89' \
    --notificationSource 'XSOLLA' \
    --notificationType 'QAsdBpLo' \
    --offset '63' \
    --paymentOrderNo 'RaYI0auU' \
    --startDate 'c3zFNGkU' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 115 'QueryPaymentNotifications' test.out

#- 116 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId '81HGVcUe' \
    --limit '13' \
    --offset '89' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 116 'QueryPaymentOrders' test.out

#- 117 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "eavvTMF7", "currencyNamespace": "dzaCEIr2", "customParameters": {"pYDpLLHA": {}, "m8fCPuVD": {}, "O30ePg0T": {}}, "description": "wE58OVCW", "extOrderNo": "DqxcOcX6", "extUserId": "t1DRq4tA", "itemType": "OPTIONBOX", "language": "KNMo-AFyL_sd", "metadata": {"tLRflESY": "IYJzRyqQ", "mO5ibdMN": "KZW5LkG4", "NViZS4hf": "JBYqIm6Q"}, "notifyUrl": "M0o2QukR", "omitNotification": true, "platform": "a4l3Gmw4", "price": 13, "recurringPaymentOrderNo": "hVxZr3Oq", "region": "bQw8YZzW", "returnUrl": "dMAu3D0z", "sandbox": true, "sku": "9oCH5OJd", "subscriptionId": "PYRP2gT8", "targetNamespace": "DHVY88qQ", "targetUserId": "eMAKvo0i", "title": "X9jclwt1"}' \
    > test.out 2>&1
eval_tap $? 117 'CreatePaymentOrderByDedicated' test.out

#- 118 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'niTYCVrn' \
    > test.out 2>&1
eval_tap $? 118 'ListExtOrderNoByExtTxId' test.out

#- 119 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'NwM2hYx0' \
    > test.out 2>&1
eval_tap $? 119 'GetPaymentOrder' test.out

#- 120 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uMFG9xWU' \
    --body '{"extTxId": "JQLBoxyP", "paymentMethod": "IszcCrvF", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 120 'ChargePaymentOrder' test.out

#- 121 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'q8M3VHba' \
    --body '{"description": "7luNL25Y"}' \
    > test.out 2>&1
eval_tap $? 121 'RefundPaymentOrderByDedicated' test.out

#- 122 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iU9H2w35' \
    --body '{"amount": 66, "currencyCode": "Cr71PQWn", "notifyType": "REFUND", "paymentProvider": "STRIPE", "salesTax": 3, "vat": 39}' \
    > test.out 2>&1
eval_tap $? 122 'SimulatePaymentOrderNotification' test.out

#- 123 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iWparSfo' \
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
    --platform 'Epic' \
    --body '{"allowedBalanceOrigins": ["IOS", "Xbox", "Stadia"]}' \
    > test.out 2>&1
eval_tap $? 125 'UpdatePlatformWalletConfig' test.out

#- 126 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 126 'ResetPlatformWalletConfig' test.out

#- 127 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "eUsi2FUv", "eventTopic": "gWHSzg8r", "maxAwarded": 91, "maxAwardedPerUser": 25, "namespaceExpression": "tNz1gthV", "rewardCode": "TU5d3uV9", "rewardConditions": [{"condition": "yrFI6Ubn", "conditionName": "xW4oWnD6", "eventName": "nh1Hm7wj", "rewardItems": [{"duration": 40, "itemId": "aYHcH8zi", "quantity": 84}, {"duration": 43, "itemId": "iFoial7i", "quantity": 53}, {"duration": 58, "itemId": "II5vLufE", "quantity": 46}]}, {"condition": "PktN1kgR", "conditionName": "VLuWvbFW", "eventName": "zNn7ZtGz", "rewardItems": [{"duration": 47, "itemId": "ejHiilTl", "quantity": 71}, {"duration": 100, "itemId": "q390AWCU", "quantity": 27}, {"duration": 6, "itemId": "RTvgxdl7", "quantity": 29}]}, {"condition": "22ZzypWQ", "conditionName": "5nUHhihJ", "eventName": "ILRhj8Zh", "rewardItems": [{"duration": 90, "itemId": "VZq1CKYT", "quantity": 42}, {"duration": 74, "itemId": "yNHn2GTN", "quantity": 61}, {"duration": 82, "itemId": "FvagKVok", "quantity": 2}]}], "userIdExpression": "hMyO1d4c"}' \
    > test.out 2>&1
eval_tap $? 127 'CreateReward' test.out

#- 128 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '33H24COn' \
    --limit '83' \
    --offset '64' \
    --sortBy 'rewardCode:desc,namespace:asc' \
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
    --rewardId 'J8VSCY14' \
    > test.out 2>&1
eval_tap $? 131 'GetReward' test.out

#- 132 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'QmyKhCQd' \
    --body '{"description": "36dyiIIl", "eventTopic": "SzcmTpnH", "maxAwarded": 20, "maxAwardedPerUser": 20, "namespaceExpression": "m976DHgi", "rewardCode": "PCqkQQUy", "rewardConditions": [{"condition": "neercdqV", "conditionName": "8FJXtBhg", "eventName": "NwTE95fY", "rewardItems": [{"duration": 18, "itemId": "a4BuOmR8", "quantity": 44}, {"duration": 69, "itemId": "068btGJk", "quantity": 65}, {"duration": 70, "itemId": "HWCgvnMb", "quantity": 30}]}, {"condition": "gGHBMjhG", "conditionName": "Du0v4MAp", "eventName": "vC5B2ens", "rewardItems": [{"duration": 96, "itemId": "HlvpKFl0", "quantity": 23}, {"duration": 6, "itemId": "DFsobczx", "quantity": 13}, {"duration": 68, "itemId": "ucH3p8vr", "quantity": 70}]}, {"condition": "fA8O5dXv", "conditionName": "wagJlLZ7", "eventName": "1o8v9YAJ", "rewardItems": [{"duration": 24, "itemId": "VI5GZnGM", "quantity": 93}, {"duration": 33, "itemId": "a0a2LZSn", "quantity": 53}, {"duration": 37, "itemId": "yQdYetTi", "quantity": 15}]}], "userIdExpression": "EHQVUCWL"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateReward' test.out

#- 133 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yNTiDawE' \
    > test.out 2>&1
eval_tap $? 133 'DeleteReward' test.out

#- 134 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'qzLGb2ru' \
    --body '{"payload": {"rZUuYOyu": {}, "URMLs1n8": {}, "grNuezR8": {}}}' \
    > test.out 2>&1
eval_tap $? 134 'CheckEventCondition' test.out

#- 135 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'venTcYk7' \
    --body '{"conditionName": "txvirwrX", "userId": "efTTKBZy"}' \
    > test.out 2>&1
eval_tap $? 135 'DeleteRewardConditionRecord' test.out

#- 136 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'ListStores' test.out

#- 137 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "d9NE83ME", "defaultRegion": "69nuUUh4", "description": "NQHIrJdz", "supportedLanguages": ["b3MaTB4X", "yc4Jhqcl", "ZncXxZlE"], "supportedRegions": ["OqE6KgyE", "jcHScRQr", "P1Shvpuf"], "title": "FYT3WmyP"}' \
    > test.out 2>&1
eval_tap $? 137 'CreateStore' test.out

#- 138 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HmjfuXj3' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 138 'ImportStore' test.out

#- 139 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'GetPublishedStore' test.out

#- 140 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'DeletePublishedStore' test.out

#- 141 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'GetPublishedStoreBackup' test.out

#- 142 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'RollbackPublishedStore' test.out

#- 143 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FNFOX7fW' \
    > test.out 2>&1
eval_tap $? 143 'GetStore' test.out

#- 144 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '8qE2QkOw' \
    --body '{"defaultLanguage": "WhV0KaGq", "defaultRegion": "GNddiywJ", "description": "lmYU9OhE", "supportedLanguages": ["7G89PZNS", "ZyMZnFgQ", "u3k5AkhO"], "supportedRegions": ["fnUENxZF", "Ev4gpNCn", "LzEZWs3F"], "title": "tt4lbRrI"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateStore' test.out

#- 145 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kimx01a8' \
    > test.out 2>&1
eval_tap $? 145 'DeleteStore' test.out

#- 146 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QXuEc9Rq' \
    --action 'CREATE' \
    --itemSku 'GK1iqEsP' \
    --itemType 'SEASON' \
    --limit '76' \
    --offset '27' \
    --selected  \
    --sortBy 'createdAt:asc,updatedAt:desc,updatedAt' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'Akmtf1uJ' \
    --updatedAtStart 'VHExpZ2a' \
    > test.out 2>&1
eval_tap $? 146 'QueryChanges' test.out

#- 147 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '1ALcww7X' \
    > test.out 2>&1
eval_tap $? 147 'PublishAll' test.out

#- 148 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'diBdn3QO' \
    > test.out 2>&1
eval_tap $? 148 'PublishSelected' test.out

#- 149 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pefLhEW9' \
    > test.out 2>&1
eval_tap $? 149 'SelectAllRecords' test.out

#- 150 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nb8XCQs4' \
    --action 'DELETE' \
    --itemSku 'pGN2p5pD' \
    --itemType 'SEASON' \
    --type 'STORE' \
    --updatedAtEnd 'azuIzofv' \
    --updatedAtStart 'cD2luZTx' \
    > test.out 2>&1
eval_tap $? 150 'GetStatistic' test.out

#- 151 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RGbKGalD' \
    > test.out 2>&1
eval_tap $? 151 'UnselectAllRecords' test.out

#- 152 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '7LeQAAzK' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4JFMuP3i' \
    > test.out 2>&1
eval_tap $? 152 'SelectRecord' test.out

#- 153 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'olUBkOil' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QOlbrx5b' \
    > test.out 2>&1
eval_tap $? 153 'UnselectRecord' test.out

#- 154 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Zo23gcYP' \
    --targetStoreId 'lUfAM5L5' \
    > test.out 2>&1
eval_tap $? 154 'CloneStore' test.out

#- 155 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pTjjDvSr' \
    > test.out 2>&1
eval_tap $? 155 'ExportStore' test.out

#- 156 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'ekCNqi9c' \
    --limit '61' \
    --offset '46' \
    --sku 'kaX3oxTF' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId 'VIWo1v4t' \
    > test.out 2>&1
eval_tap $? 156 'QuerySubscriptions' test.out

#- 157 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'IvXRhiD8' \
    > test.out 2>&1
eval_tap $? 157 'RecurringChargeSubscription' test.out

#- 158 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'h7NcoBuV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 158 'GetTicketDynamic' test.out

#- 159 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'NQFjTHwk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "5NSRFWG0"}' \
    > test.out 2>&1
eval_tap $? 159 'DecreaseTicketSale' test.out

#- 160 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'ztz6mdK5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 160 'GetTicketBoothID' test.out

#- 161 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'rI87O1k1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 49, "orderNo": "EugugP8l"}' \
    > test.out 2>&1
eval_tap $? 161 'IncreaseTicketSale' test.out

#- 162 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzCgriiT' \
    --body '{"achievements": [{"id": "2qqzALsj", "value": 92}, {"id": "H75pyPx2", "value": 99}, {"id": "0yKT4gNm", "value": 88}], "steamUserId": "7hEMGl3d"}' \
    > test.out 2>&1
eval_tap $? 162 'UnlockSteamUserAchievement' test.out

#- 163 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '2r07CFGu' \
    --xboxUserId 'zbAfn3Pd' \
    > test.out 2>&1
eval_tap $? 163 'GetXblUserAchievements' test.out

#- 164 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 's9rUEhFJ' \
    --body '{"achievements": [{"id": "ypGm1G4j", "percentComplete": 93}, {"id": "MDt4IgU5", "percentComplete": 80}, {"id": "WT6b12jf", "percentComplete": 90}], "serviceConfigId": "VGBzDswY", "titleId": "9shk0pI9", "xboxUserId": "iJhlxqm1"}' \
    > test.out 2>&1
eval_tap $? 164 'UpdateXblUserAchievement' test.out

#- 165 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'trOFhC3x' \
    > test.out 2>&1
eval_tap $? 165 'AnonymizeCampaign' test.out

#- 166 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '7xqItPUP' \
    > test.out 2>&1
eval_tap $? 166 'AnonymizeEntitlement' test.out

#- 167 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '8uiIiIkk' \
    > test.out 2>&1
eval_tap $? 167 'AnonymizeFulfillment' test.out

#- 168 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZWuNkHBM' \
    > test.out 2>&1
eval_tap $? 168 'AnonymizeIntegration' test.out

#- 169 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'jaI4s1c2' \
    > test.out 2>&1
eval_tap $? 169 'AnonymizeOrder' test.out

#- 170 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'tEZXXhA7' \
    > test.out 2>&1
eval_tap $? 170 'AnonymizePayment' test.out

#- 171 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'd0iSimZc' \
    > test.out 2>&1
eval_tap $? 171 'AnonymizeSubscription' test.out

#- 172 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'dye5dvgY' \
    > test.out 2>&1
eval_tap $? 172 'AnonymizeWallet' test.out

#- 173 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'z4UaLmeF' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'WY0qhGje' \
    --features 'ferXL5kx,KVSke7dz,3oIgTqtd' \
    --itemId 'eVSVjlLc,wxK94hNm,vWd7LuRW' \
    --limit '6' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 173 'QueryUserEntitlements' test.out

#- 174 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'vldqVlRr' \
    --body '[{"endDate": "1979-04-02T00:00:00Z", "grantedCode": "rKxdt6pp", "itemId": "EjX5niIK", "itemNamespace": "73y2zDI3", "language": "IkxH-vEhU_Qn", "quantity": 36, "region": "cakJfJ68", "source": "IAP", "startDate": "1997-03-11T00:00:00Z", "storeId": "z8kDWf4g"}, {"endDate": "1972-07-19T00:00:00Z", "grantedCode": "edY11gCA", "itemId": "DmW1y31m", "itemNamespace": "PPGluALX", "language": "iO-041", "quantity": 46, "region": "Ljm6X269", "source": "GIFT", "startDate": "1980-08-23T00:00:00Z", "storeId": "mjSzba0k"}, {"endDate": "1986-07-25T00:00:00Z", "grantedCode": "t79amsmZ", "itemId": "Dfi06IVt", "itemNamespace": "vOPt6s23", "language": "nG", "quantity": 50, "region": "MLn72u27", "source": "PURCHASE", "startDate": "1999-07-13T00:00:00Z", "storeId": "VOxsvxMr"}]' \
    > test.out 2>&1
eval_tap $? 174 'GrantUserEntitlement' test.out

#- 175 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'a95hmmie' \
    --activeOnly  \
    --appId 'wB9mkkzk' \
    > test.out 2>&1
eval_tap $? 175 'GetUserAppEntitlementByAppId' test.out

#- 176 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'hl2pYhPI' \
    --activeOnly  \
    --limit '67' \
    --offset '65' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 176 'QueryUserEntitlementsByAppType' test.out

#- 177 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'EKx1KdAe' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --itemId 'nf8UuciW' \
    > test.out 2>&1
eval_tap $? 177 'GetUserEntitlementByItemId' test.out

#- 178 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'HkgQEPHa' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku 'mPGz1h9u' \
    > test.out 2>&1
eval_tap $? 178 'GetUserEntitlementBySku' test.out

#- 179 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'aJ9HjXXW' \
    --appIds 'OQ8USoQD,My06kg1d,GKfqzSL6' \
    --itemIds 'MJrs1w5H,AJEwvMmi,qVZaaY9S' \
    --skus 'Ggc3VNVe,0Tb5br4o,Zl9twfnO' \
    > test.out 2>&1
eval_tap $? 179 'ExistsAnyUserActiveEntitlement' test.out

#- 180 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'qlgwSskY' \
    --itemIds '7z7f5KQ0,DXccwX0t,Z0Y8Ce61' \
    > test.out 2>&1
eval_tap $? 180 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 181 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'W0AM4W6w' \
    --appId 'ZoRhbmUP' \
    > test.out 2>&1
eval_tap $? 181 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 182 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TpClGYAT' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'fkGiR8kw' \
    > test.out 2>&1
eval_tap $? 182 'GetUserEntitlementOwnershipByItemId' test.out

#- 183 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3oWnQjn' \
    --ids 'fhD4z7iG,wbCeyVP7,Cy2OU1pR' \
    > test.out 2>&1
eval_tap $? 183 'GetUserEntitlementOwnershipByItemIds' test.out

#- 184 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'qrnUiZDv' \
    --entitlementClazz 'MEDIA' \
    --sku 'KCJrbQ9S' \
    > test.out 2>&1
eval_tap $? 184 'GetUserEntitlementOwnershipBySku' test.out

#- 185 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xgro2Uk5' \
    --entitlementIds 'JaNJwvj6' \
    > test.out 2>&1
eval_tap $? 185 'RevokeUserEntitlements' test.out

#- 186 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'oXMy7kPX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KwJwSduI' \
    > test.out 2>&1
eval_tap $? 186 'GetUserEntitlement' test.out

#- 187 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'JZ4Mrbf6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nhCSOTBD' \
    --body '{"endDate": "1994-03-26T00:00:00Z", "nullFieldList": ["QKhnAhPx", "bKRmp6Z1", "o16i3btP"], "startDate": "1987-01-09T00:00:00Z", "status": "INACTIVE", "useCount": 21}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateUserEntitlement' test.out

#- 188 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'fUa4rdwS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lQTIrDOJ' \
    --body '{"options": ["8yycs8Cl", "crxeNGNM", "UGbBg4Sp"], "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 188 'ConsumeUserEntitlement' test.out

#- 189 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '77xWe2NL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tYVTWPFc' \
    > test.out 2>&1
eval_tap $? 189 'DisableUserEntitlement' test.out

#- 190 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'YP3pylBm' \
    --namespace "$AB_NAMESPACE" \
    --userId '9gIHUD8C' \
    > test.out 2>&1
eval_tap $? 190 'EnableUserEntitlement' test.out

#- 191 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'hFVbOor7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GSyb8nDj' \
    > test.out 2>&1
eval_tap $? 191 'GetUserEntitlementHistories' test.out

#- 192 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '71L3xlKB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iFoMEsE4' \
    > test.out 2>&1
eval_tap $? 192 'RevokeUserEntitlement' test.out

#- 193 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2OgXcETO' \
    --body '{"duration": 53, "endDate": "1980-05-11T00:00:00Z", "itemId": "NNJbuMie", "itemSku": "5toqDgd6", "language": "q0duTInz", "order": {"currency": {"currencyCode": "Q6XD7tzH", "currencySymbol": "zygQezp9", "currencyType": "VIRTUAL", "decimals": 29, "namespace": "sbzwOZrb"}, "ext": {"0offSyPZ": {}, "FC79i3lj": {}, "dLJngF57": {}}, "free": true}, "orderNo": "GI8yX583", "origin": "Stadia", "quantity": 53, "region": "GnXAmC3J", "source": "ACHIEVEMENT", "startDate": "1999-07-30T00:00:00Z", "storeId": "KawOLAtY"}' \
    > test.out 2>&1
eval_tap $? 193 'FulfillItem' test.out

#- 194 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'OjhmwYqo' \
    --body '{"code": "qrQGgj5C", "language": "WTIx-601", "region": "YF7EQlCE"}' \
    > test.out 2>&1
eval_tap $? 194 'RedeemCode' test.out

#- 195 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId '3DcPwwXV' \
    --body '{"origin": "System", "rewards": [{"currency": {"currencyCode": "nInHFTU4", "namespace": "CKHVurNP"}, "item": {"itemId": "I7MwiB27", "itemSku": "yNGEaYxQ", "itemType": "Tu8bu1AU"}, "quantity": 12, "type": "CURRENCY"}, {"currency": {"currencyCode": "5WxO3rZS", "namespace": "jLhb4gkg"}, "item": {"itemId": "btz919XD", "itemSku": "Z6ZD6ono", "itemType": "AYM3iJPk"}, "quantity": 99, "type": "ITEM"}, {"currency": {"currencyCode": "ugOwF7dK", "namespace": "1SBI5l2g"}, "item": {"itemId": "s1502DWI", "itemSku": "waQK4BTw", "itemType": "SnKM3Rcb"}, "quantity": 77, "type": "ITEM"}], "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 195 'FulfillRewards' test.out

#- 196 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'tPsx9hcV' \
    --endTime 'RkcqUpZG' \
    --limit '16' \
    --offset '88' \
    --productId '4Bm8krKQ' \
    --startTime 'n5x6zuUl' \
    --status 'FAILED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 196 'QueryUserIAPOrders' test.out

#- 197 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDWC0CTf' \
    > test.out 2>&1
eval_tap $? 197 'QueryAllUserIAPOrders' test.out

#- 198 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cJPiiuZD' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "VOy_MMhG-448", "productId": "RgVVPZPL", "region": "GeVTVNk7", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 198 'MockFulfillIAPItem' test.out

#- 199 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BcbnQqUL' \
    --itemId 'TDi7ypv8' \
    --limit '62' \
    --offset '77' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 199 'QueryUserOrders' test.out

#- 200 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZO8fIRuF' \
    --body '{"currencyCode": "2E1ToCIT", "currencyNamespace": "jKN2zZVv", "discountedPrice": 92, "ext": {"3jZMU6IE": {}, "mR1uw4Bc": {}, "0VXBrG1O": {}}, "itemId": "3GmVL3cE", "language": "iS94LPy9", "options": {"skipPriceValidation": false}, "platform": "Other", "price": 100, "quantity": 5, "region": "X9olRkPH", "returnUrl": "XLjOqVrw", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 200 'AdminCreateUserOrder' test.out

#- 201 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'uGuiCdlP' \
    --itemId '0iraQbwS' \
    > test.out 2>&1
eval_tap $? 201 'CountOfPurchasedItem' test.out

#- 202 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'roFIRimp' \
    --userId 'OsERz5V6' \
    > test.out 2>&1
eval_tap $? 202 'GetUserOrder' test.out

#- 203 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8vwSSgyg' \
    --userId 'NuDUbxdb' \
    --body '{"status": "CLOSED", "statusReason": "vYXAHTtN"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateUserOrderStatus' test.out

#- 204 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zV8d9YOS' \
    --userId 'c8OZ6ejk' \
    > test.out 2>&1
eval_tap $? 204 'FulfillUserOrder' test.out

#- 205 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kg5ILv3D' \
    --userId 'gRNgkHpv' \
    > test.out 2>&1
eval_tap $? 205 'GetUserOrderGrant' test.out

#- 206 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'm6XCWZFi' \
    --userId 'VzEtwAE9' \
    > test.out 2>&1
eval_tap $? 206 'GetUserOrderHistories' test.out

#- 207 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4VaTMXNV' \
    --userId 'DiCKYUKw' \
    --body '{"additionalData": {"cardSummary": "BQ6Fpeg8"}, "authorisedTime": "1992-08-10T00:00:00Z", "chargebackReversedTime": "1978-08-09T00:00:00Z", "chargebackTime": "1991-09-15T00:00:00Z", "chargedTime": "1990-11-14T00:00:00Z", "createdTime": "1990-01-20T00:00:00Z", "currency": {"currencyCode": "GDAPHRsh", "currencySymbol": "J8zOYF8Z", "currencyType": "VIRTUAL", "decimals": 93, "namespace": "O1yvaqBs"}, "customParameters": {"G27cK5v0": {}, "vsmZorGE": {}, "5xXvYu7U": {}}, "extOrderNo": "HpMIiJTy", "extTxId": "q0DcULbk", "extUserId": "s3qDSVzR", "issuedAt": "1991-07-15T00:00:00Z", "metadata": {"NwVPHbvm": "ZRdidwwH", "GM2eNzTz": "a3zVeSWr", "ylWboNqL": "ZdTiYI33"}, "namespace": "rTUjFSU6", "nonceStr": "eD96tgGp", "paymentMethod": "zcnpvF7M", "paymentMethodFee": 45, "paymentOrderNo": "aDKOJEKH", "paymentProvider": "CHECKOUT", "paymentProviderFee": 64, "paymentStationUrl": "c1qfESJ3", "price": 4, "refundedTime": "1973-06-22T00:00:00Z", "salesTax": 12, "sandbox": false, "sku": "7qZIbGNy", "status": "REFUNDED", "statusReason": "wJcLY6hp", "subscriptionId": "IEr6sLvu", "subtotalPrice": 92, "targetNamespace": "9w1JVPIS", "targetUserId": "c7wSMH1F", "tax": 2, "totalPrice": 66, "totalTax": 77, "txEndTime": "1978-05-21T00:00:00Z", "type": "btgbPzPj", "userId": "1LVgyzoD", "vat": 9}' \
    > test.out 2>&1
eval_tap $? 207 'ProcessUserOrderNotification' test.out

#- 208 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Va6tuTaa' \
    --userId 'F9IPKkUo' \
    > test.out 2>&1
eval_tap $? 208 'DownloadUserOrderReceipt' test.out

#- 209 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4UX3Cf2' \
    --body '{"currencyCode": "OQJw7T1m", "currencyNamespace": "xmp7JyYG", "customParameters": {"WIIi7BWF": {}, "is9fHEHE": {}, "44sAR8jN": {}}, "description": "hBtuB006", "extOrderNo": "zpt9KBRA", "extUserId": "JYl3onLJ", "itemType": "BUNDLE", "language": "IfqU-ol", "metadata": {"cSPdpbDo": "kYE79G27", "yRC396O2": "4oiOmknv", "gaNIsy3k": "pDgvNWj6"}, "notifyUrl": "tujXOo6K", "omitNotification": true, "platform": "TCmSEnhM", "price": 5, "recurringPaymentOrderNo": "uyIXzCm7", "region": "w2n6WfpF", "returnUrl": "3zuoJ5c5", "sandbox": false, "sku": "qMOkxL4i", "subscriptionId": "QfsIampY", "title": "N1Ap7S3m"}' \
    > test.out 2>&1
eval_tap $? 209 'CreateUserPaymentOrder' test.out

#- 210 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ClyaRn8E' \
    --userId 'LHQ3wWw9' \
    --body '{"description": "ByjCcEum"}' \
    > test.out 2>&1
eval_tap $? 210 'RefundUserPaymentOrder' test.out

#- 211 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjJCSVX3' \
    --body '{"code": "h5gwQoOD", "orderNo": "CojKqKHY"}' \
    > test.out 2>&1
eval_tap $? 211 'ApplyUserRedemption' test.out

#- 212 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZhoGb9L0' \
    --chargeStatus 'CHARGED' \
    --itemId 'pK5CaXdp' \
    --limit '62' \
    --offset '52' \
    --sku 'ozcvlr6x' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 212 'QueryUserSubscriptions' test.out

#- 213 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'kqFB1OqA' \
    --excludeSystem  \
    --limit '44' \
    --offset '36' \
    --subscriptionId '2bHDH9PB' \
    > test.out 2>&1
eval_tap $? 213 'GetUserSubscriptionActivities' test.out

#- 214 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'l7GZjpSP' \
    --body '{"grantDays": 27, "itemId": "vLiAQSP1", "language": "aNd8C4Y9", "reason": "G6arOK9b", "region": "pkPcKt3U", "source": "HIVsBeal"}' \
    > test.out 2>&1
eval_tap $? 214 'PlatformSubscribeSubscription' test.out

#- 215 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cK8A7yAV' \
    --itemId 'WftrehuX' \
    > test.out 2>&1
eval_tap $? 215 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 216 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'fYPmaYXH' \
    --userId '8F7HJsYn' \
    > test.out 2>&1
eval_tap $? 216 'GetUserSubscription' test.out

#- 217 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CBYYGeBZ' \
    --userId 'vv2P30ry' \
    > test.out 2>&1
eval_tap $? 217 'DeleteUserSubscription' test.out

#- 218 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LDxACjG1' \
    --userId 'y8eRs7vO' \
    --force  \
    --body '{"immediate": false, "reason": "1DTvTcn5"}' \
    > test.out 2>&1
eval_tap $? 218 'CancelSubscription' test.out

#- 219 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2gjwaUfq' \
    --userId 'UgIgxzjh' \
    --body '{"grantDays": 29, "reason": "Sgjw1hdS"}' \
    > test.out 2>&1
eval_tap $? 219 'GrantDaysToSubscription' test.out

#- 220 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qo0kHyXr' \
    --userId 'OwAQvXvb' \
    --excludeFree  \
    --limit '19' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 220 'GetUserSubscriptionBillingHistories' test.out

#- 221 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'YMmhU3Jb' \
    --userId 'NTRCkEZV' \
    --body '{"additionalData": {"cardSummary": "WjL97GvC"}, "authorisedTime": "1989-02-23T00:00:00Z", "chargebackReversedTime": "1977-09-27T00:00:00Z", "chargebackTime": "1973-10-18T00:00:00Z", "chargedTime": "1989-07-23T00:00:00Z", "createdTime": "1974-11-17T00:00:00Z", "currency": {"currencyCode": "RyNvi4mc", "currencySymbol": "LMOtU3UU", "currencyType": "VIRTUAL", "decimals": 82, "namespace": "CCgPczZq"}, "customParameters": {"XCotCuMx": {}, "too3p7Z9": {}, "U67ZNOsT": {}}, "extOrderNo": "dQvs295G", "extTxId": "QdXftmxC", "extUserId": "gVXsoSZl", "issuedAt": "1985-08-10T00:00:00Z", "metadata": {"6tJicsoE": "PufMqrr2", "wcLKjvC6": "3YDodv8T", "FaNqmOKy": "d0ovryfD"}, "namespace": "DtoJItaj", "nonceStr": "a6HeaVBi", "paymentMethod": "LO45zDQA", "paymentMethodFee": 48, "paymentOrderNo": "Rfvihf0B", "paymentProvider": "PAYPAL", "paymentProviderFee": 61, "paymentStationUrl": "BBJAVJbx", "price": 45, "refundedTime": "1978-05-04T00:00:00Z", "salesTax": 53, "sandbox": true, "sku": "QIJMbvey", "status": "REQUEST_FOR_INFORMATION", "statusReason": "9L7OZ0LX", "subscriptionId": "xC0MNFQk", "subtotalPrice": 28, "targetNamespace": "32IChkDY", "targetUserId": "OhBXoy6w", "tax": 2, "totalPrice": 17, "totalTax": 23, "txEndTime": "1977-08-04T00:00:00Z", "type": "1sarJzkF", "userId": "EF8hmG5A", "vat": 14}' \
    > test.out 2>&1
eval_tap $? 221 'ProcessUserSubscriptionNotification' test.out

#- 222 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'g87zTIo2' \
    --namespace "$AB_NAMESPACE" \
    --userId '4CVExNPO' \
    --body '{"count": 21, "orderNo": "rXW9jeJu"}' \
    > test.out 2>&1
eval_tap $? 222 'AcquireUserTicket' test.out

#- 223 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'XXgfYkEv' \
    > test.out 2>&1
eval_tap $? 223 'QueryUserCurrencyWallets' test.out

#- 224 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'RDspErQ6' \
    --namespace "$AB_NAMESPACE" \
    --userId '2uGJ4yui' \
    --limit '4' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 224 'ListUserCurrencyTransactions' test.out

#- 225 CheckWallet
eval_tap 0 225 'CheckWallet # SKIP deprecated' test.out

#- 226 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'lYwhOalF' \
    --namespace "$AB_NAMESPACE" \
    --userId '1mCOkGxF' \
    --body '{"amount": 15, "expireAt": "1996-04-20T00:00:00Z", "origin": "Xbox", "reason": "QCwdSq0j", "source": "IAP"}' \
    > test.out 2>&1
eval_tap $? 226 'CreditUserWallet' test.out

#- 227 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'DMt2WcWN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUWKFfWO' \
    --body '{"amount": 25, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 227 'PayWithUserWallet' test.out

#- 228 GetUserWallet
eval_tap 0 228 'GetUserWallet # SKIP deprecated' test.out

#- 229 DebitUserWallet
eval_tap 0 229 'DebitUserWallet # SKIP deprecated' test.out

#- 230 DisableUserWallet
eval_tap 0 230 'DisableUserWallet # SKIP deprecated' test.out

#- 231 EnableUserWallet
eval_tap 0 231 'EnableUserWallet # SKIP deprecated' test.out

#- 232 ListUserWalletTransactions
eval_tap 0 232 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 233 QueryWallets
eval_tap 0 233 'QueryWallets # SKIP deprecated' test.out

#- 234 GetWallet
eval_tap 0 234 'GetWallet # SKIP deprecated' test.out

#- 235 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '7JCaJbSN' \
    --end 'LgiTxRWP' \
    --start '67dwGy4x' \
    > test.out 2>&1
eval_tap $? 235 'SyncOrders' test.out

#- 236 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["K9bDyLan", "EkWyAUTB", "sLYzlq9s"], "apiKey": "2Qug3Be3", "authoriseAsCapture": false, "blockedPaymentMethods": ["DBkzMAqn", "PGlgFbXF", "K9iq24Sc"], "clientKey": "kQeKiMaA", "dropInSettings": "qxxPuD0x", "liveEndpointUrlPrefix": "fDYeizue", "merchantAccount": "6q7QKXHN", "notificationHmacKey": "pdog4ENx", "notificationPassword": "X8WzDJr8", "notificationUsername": "1QeRZBg5", "returnUrl": "ScLkWhw0", "settings": "Uuce85wV"}' \
    > test.out 2>&1
eval_tap $? 236 'TestAdyenConfig' test.out

#- 237 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "Oc54xhBP", "privateKey": "5gOk6KLG", "publicKey": "lvV0LVYO", "returnUrl": "qmQ0oBMf"}' \
    > test.out 2>&1
eval_tap $? 237 'TestAliPayConfig' test.out

#- 238 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "pu4AsaSR", "secretKey": "qjW7GTDK"}' \
    > test.out 2>&1
eval_tap $? 238 'TestCheckoutConfig' test.out

#- 239 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'VLmtAX4x' \
    > test.out 2>&1
eval_tap $? 239 'DebugMatchedPaymentMerchantConfig' test.out

#- 240 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "PQGgIkd0", "clientSecret": "KbIUhKu6", "returnUrl": "5kFbPfm6", "webHookId": "fEQnXoZ1"}' \
    > test.out 2>&1
eval_tap $? 240 'TestPayPalConfig' test.out

#- 241 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["lrvyzMwx", "g0Od04xY", "MfhJNl38"], "publishableKey": "iDmWEdTL", "secretKey": "s8hFZITH", "webhookSecret": "7zB5M9Nm"}' \
    > test.out 2>&1
eval_tap $? 241 'TestStripeConfig' test.out

#- 242 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "tFbNGfdI", "key": "T9oCXW93", "mchid": "LwPHpumQ", "returnUrl": "Uvjc7337"}' \
    > test.out 2>&1
eval_tap $? 242 'TestWxPayConfig' test.out

#- 243 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "ZJ1kvfcB", "flowCompletionUrl": "5FCtEEVB", "merchantId": 56, "projectId": 57, "projectSecretKey": "WVoGKutQ"}' \
    > test.out 2>&1
eval_tap $? 243 'TestXsollaConfig' test.out

#- 244 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'Q5t4cogw' \
    > test.out 2>&1
eval_tap $? 244 'GetPaymentMerchantConfig' test.out

#- 245 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'InRmNPkL' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["IJSz2BTo", "B9SaBP9O", "i9NM1KYU"], "apiKey": "zAL7SUfs", "authoriseAsCapture": true, "blockedPaymentMethods": ["q6uv4pvC", "ylOT6ONE", "Ervk9rez"], "clientKey": "yPO7MfNV", "dropInSettings": "FazHd9Xt", "liveEndpointUrlPrefix": "SMblE6lb", "merchantAccount": "7H0kj3Sm", "notificationHmacKey": "yz7GQyD5", "notificationPassword": "FUGUJPKP", "notificationUsername": "4YUzr9YR", "returnUrl": "8jEcTAlX", "settings": "H1OBGecM"}' \
    > test.out 2>&1
eval_tap $? 245 'UpdateAdyenConfig' test.out

#- 246 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'kMoAEgGa' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 246 'TestAdyenConfigById' test.out

#- 247 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'Da6d2mBi' \
    --sandbox  \
    --validate  \
    --body '{"appId": "zJUN3p1C", "privateKey": "aSXTCTV6", "publicKey": "QT3V1mL7", "returnUrl": "lJ0lYd7r"}' \
    > test.out 2>&1
eval_tap $? 247 'UpdateAliPayConfig' test.out

#- 248 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'FIvRBw9D' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 248 'TestAliPayConfigById' test.out

#- 249 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '2UuJKYTG' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "MkTXLZWs", "secretKey": "KnWelD5V"}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateCheckoutConfig' test.out

#- 250 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'cjfvqtb0' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 250 'TestCheckoutConfigById' test.out

#- 251 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '8QyRH0qU' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "g1mswtLx", "clientSecret": "cT8C9lb2", "returnUrl": "JKobEN89", "webHookId": "GIMOI59P"}' \
    > test.out 2>&1
eval_tap $? 251 'UpdatePayPalConfig' test.out

#- 252 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'YRQ4oIb2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 252 'TestPayPalConfigById' test.out

#- 253 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '9GHjIUva' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["9wHUGfpT", "WaVtVWw1", "BGQBY5Mq"], "publishableKey": "jfg3FpSZ", "secretKey": "vAYZ85zU", "webhookSecret": "eqz5cHNk"}' \
    > test.out 2>&1
eval_tap $? 253 'UpdateStripeConfig' test.out

#- 254 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'RdfEZtS1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 254 'TestStripeConfigById' test.out

#- 255 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'luOcNfYR' \
    --validate  \
    --body '{"appId": "iHpDFZ0o", "key": "mIWvKB0s", "mchid": "kzCUARAi", "returnUrl": "W7etG73i"}' \
    > test.out 2>&1
eval_tap $? 255 'UpdateWxPayConfig' test.out

#- 256 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'xxCjdP4t' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 256 'UpdateWxPayConfigCert' test.out

#- 257 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'pD7zO0r9' \
    > test.out 2>&1
eval_tap $? 257 'TestWxPayConfigById' test.out

#- 258 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '3m4rMzaw' \
    --validate  \
    --body '{"apiKey": "yH91uabW", "flowCompletionUrl": "YPsysRV9", "merchantId": 56, "projectId": 10, "projectSecretKey": "4xJ9WONw"}' \
    > test.out 2>&1
eval_tap $? 258 'UpdateXsollaConfig' test.out

#- 259 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'Jdx5ekEg' \
    > test.out 2>&1
eval_tap $? 259 'TestXsollaConfigById' test.out

#- 260 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'q7ds8RyT' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 260 'UpdateXsollaUIConfig' test.out

#- 261 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '54' \
    --namespace "$AB_NAMESPACE" \
    --offset '85' \
    --region 'ige4u3RK' \
    > test.out 2>&1
eval_tap $? 261 'QueryPaymentProviderConfig' test.out

#- 262 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "1DDk6v7T", "region": "tBuBTmOu", "sandboxTaxJarApiToken": "bfhmwh6H", "specials": ["ALIPAY", "WXPAY", "PAYPAL"], "taxJarApiToken": "CFH2K2xI", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 262 'CreatePaymentProviderConfig' test.out

#- 263 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 263 'GetAggregatePaymentProviders' test.out

#- 264 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Q7samteX' \
    > test.out 2>&1
eval_tap $? 264 'DebugMatchedPaymentProviderConfig' test.out

#- 265 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 265 'GetSpecialPaymentProviders' test.out

#- 266 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'dDT3H48U' \
    --body '{"aggregate": "XSOLLA", "namespace": "C3p3jerT", "region": "19rL4mCG", "sandboxTaxJarApiToken": "VISngz6I", "specials": ["XSOLLA", "WALLET", "STRIPE"], "taxJarApiToken": "ArQ1B8lP", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 266 'UpdatePaymentProviderConfig' test.out

#- 267 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'AEBvj6CL' \
    > test.out 2>&1
eval_tap $? 267 'DeletePaymentProviderConfig' test.out

#- 268 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 268 'GetPaymentTaxConfig' test.out

#- 269 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "SpT3u1ZF", "taxJarApiToken": "O9HMwFUx", "taxJarEnabled": false, "taxJarProductCodesMapping": {"QlgaDnri": "z8UbPVZd", "XxmejIb0": "B2evBCzc", "e6yKHWS8": "6fqIFSYu"}}' \
    > test.out 2>&1
eval_tap $? 269 'UpdatePaymentTaxConfig' test.out

#- 270 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '6wmfLi2Z' \
    --end 'kZmjGVpE' \
    --start '7yhdCdtT' \
    > test.out 2>&1
eval_tap $? 270 'SyncPaymentOrders' test.out

#- 271 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Y8TXjmTE' \
    --storeId 'CHzUwAK9' \
    > test.out 2>&1
eval_tap $? 271 'PublicGetRootCategories' test.out

#- 272 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'm1lkGsMp' \
    --storeId '2HC82OlB' \
    > test.out 2>&1
eval_tap $? 272 'DownloadCategories' test.out

#- 273 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'sBocTCwf' \
    --namespace "$AB_NAMESPACE" \
    --language 'vSHNmyfr' \
    --storeId 'gqVgL9ww' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetCategory' test.out

#- 274 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '1kk8jpx5' \
    --namespace "$AB_NAMESPACE" \
    --language 'emEgOLig' \
    --storeId 'tWdOzHJm' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetChildCategories' test.out

#- 275 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'AjBX0qXK' \
    --namespace "$AB_NAMESPACE" \
    --language 'x4a7ioQT' \
    --storeId '2TuYcbFn' \
    > test.out 2>&1
eval_tap $? 275 'PublicGetDescendantCategories' test.out

#- 276 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 276 'PublicListCurrencies' test.out

#- 277 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'aMx2eXu9' \
    --region 'Z4H99ihj' \
    --storeId 'AL7G8b21' \
    --appId 'yNSRz6Fb' \
    > test.out 2>&1
eval_tap $? 277 'PublicGetItemByAppId' test.out

#- 278 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'z74Tk5le' \
    --categoryPath 'WpXeo3Jk' \
    --features 'PJuSzuMg' \
    --itemType 'CODE' \
    --language 'sSZFEJqo' \
    --limit '71' \
    --offset '68' \
    --region 'CCNlBG9r' \
    --sortBy 'createdAt,displayOrder:asc,displayOrder' \
    --storeId 'DJMivQpe' \
    --tags 'NWRRkclG' \
    > test.out 2>&1
eval_tap $? 278 'PublicQueryItems' test.out

#- 279 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'tJwIuJTl' \
    --region 'rd6TJXUC' \
    --storeId 'RmPlg3sE' \
    --sku 'MdzBwyg9' \
    > test.out 2>&1
eval_tap $? 279 'PublicGetItemBySku' test.out

#- 280 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'awCwC6Zb' \
    --region 'lne4XF1v' \
    --storeId 'UWAt3Kyu' \
    --itemIds '0hr73u5d' \
    > test.out 2>&1
eval_tap $? 280 'PublicBulkGetItems' test.out

#- 281 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["tZ91T2YC", "geW9HPEC", "W0RLjWja"]}' \
    > test.out 2>&1
eval_tap $? 281 'PublicValidateItemPurchaseCondition' test.out

#- 282 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'CODE' \
    --limit '69' \
    --offset '23' \
    --region 'HMTQqZ58' \
    --storeId 'f9RPtDic' \
    --keyword 'T0LDLwBk' \
    --language 'BWNUXT6k' \
    > test.out 2>&1
eval_tap $? 282 'PublicSearchItems' test.out

#- 283 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'tp5hT8O5' \
    --namespace "$AB_NAMESPACE" \
    --language '1ZM5UgKp' \
    --region '8FUnVicz' \
    --storeId 'r13Dywma' \
    > test.out 2>&1
eval_tap $? 283 'PublicGetApp' test.out

#- 284 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '2FFmiwIa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 284 'PublicGetItemDynamicData' test.out

#- 285 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'LAsH9s1l' \
    --namespace "$AB_NAMESPACE" \
    --language 'CG22YVtm' \
    --populateBundle  \
    --region 'e1QOMqag' \
    --storeId 'cD3WKs5N' \
    > test.out 2>&1
eval_tap $? 285 'PublicGetItem' test.out

#- 286 GetPaymentCustomization
eval_tap 0 286 'GetPaymentCustomization # SKIP deprecated' test.out

#- 287 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "ogHL08j5", "paymentProvider": "ALIPAY", "returnUrl": "015x2vvu", "ui": "II9Czm3r", "zipCode": "Zzvsl4pM"}' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetPaymentUrl' test.out

#- 288 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0UbUVZiJ' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetPaymentMethods' test.out

#- 289 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Vyqg2NmR' \
    > test.out 2>&1
eval_tap $? 289 'PublicGetUnpaidPaymentOrder' test.out

#- 290 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yTou6Hmk' \
    --paymentProvider 'XSOLLA' \
    --zipCode '5yWA3C6c' \
    --body '{"token": "I5A8LfR7"}' \
    > test.out 2>&1
eval_tap $? 290 'Pay' test.out

#- 291 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Ev01s8xX' \
    > test.out 2>&1
eval_tap $? 291 'PublicCheckPaymentOrderPaidStatus' test.out

#- 292 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ADYEN' \
    --region 'gdASey77' \
    > test.out 2>&1
eval_tap $? 292 'GetPaymentPublicConfig' test.out

#- 293 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'kLvhAalN' \
    > test.out 2>&1
eval_tap $? 293 'PublicGetQRCode' test.out

#- 294 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'vf7TMs0f' \
    --foreinginvoice 'Z5yEduGH' \
    --invoiceId 'IEvyD0dB' \
    --payload 'VtT8OXlb' \
    --redirectResult 'zkHwJARM' \
    --resultCode 'zutujuiI' \
    --sessionId 'QGvMWZSn' \
    --status 'k0VPIR7X' \
    --token '6UgpCipX' \
    --type 'nmg5FSHs' \
    --userId 'lAwbAb1x' \
    --orderNo 'd9QX00Uq' \
    --paymentOrderNo '2BAtXFtb' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'nPASV17W' \
    > test.out 2>&1
eval_tap $? 294 'PublicNormalizePaymentReturnUrl' test.out

#- 295 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'mmJJHhcA' \
    --paymentOrderNo 'J1zdnWkF' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 295 'GetPaymentTaxValue' test.out

#- 296 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'lkZi5j26' \
    > test.out 2>&1
eval_tap $? 296 'GetRewardByCode' test.out

#- 297 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'tO3QHoYP' \
    --limit '31' \
    --offset '52' \
    --sortBy 'namespace,namespace:desc' \
    > test.out 2>&1
eval_tap $? 297 'QueryRewards1' test.out

#- 298 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'aWT1Drzn' \
    > test.out 2>&1
eval_tap $? 298 'GetReward1' test.out

#- 299 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 299 'PublicListStores' test.out

#- 300 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'KslcA1X6,HPhP24sl,TDYgaaUU' \
    --itemIds 'vM6nAjIz,e3c4cUg9,ZT5smB7U' \
    --skus 'NFA8A0TN,mucHcUlo,xyTIUNKY' \
    > test.out 2>&1
eval_tap $? 300 'PublicExistsAnyMyActiveEntitlement' test.out

#- 301 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'RHHB3DL9' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 302 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'lfEYGJfC' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 303 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'P37oUfVZ' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 304 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'eM1zfOkz,YPrJEsxg,gQynLIyF' \
    --itemIds 'E5WEw2BA,hydMAsLN,mGvtC4Q2' \
    --skus '7bIxshtj,WhnXrk9j,vlObIf1w' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetEntitlementOwnershipToken' test.out

#- 305 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'NZnqc7a8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 305 'PublicGetMyWallet' test.out

#- 306 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'rqubXqgA' \
    --body '{"epicGamesJwtToken": "JNVEe2BJ"}' \
    > test.out 2>&1
eval_tap $? 306 'SyncEpicGameDLC' test.out

#- 307 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'bFHPxkks' \
    --body '{"serviceLabel": 58}' \
    > test.out 2>&1
eval_tap $? 307 'PublicSyncPsnDlcInventory' test.out

#- 308 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'mKoEUG7v' \
    --body '{"appId": "O5uBsXEE", "steamId": "eiCTBHFA"}' \
    > test.out 2>&1
eval_tap $? 308 'SyncSteamDLC' test.out

#- 309 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'qq7qEZXz' \
    --body '{"xstsToken": "5LNgTKQD"}' \
    > test.out 2>&1
eval_tap $? 309 'SyncXboxDLC' test.out

#- 310 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'srZoQwMh' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'Vs7LJG8f' \
    --features 'pP1hvmN9,1KNdSEVo,AwEmfQqE' \
    --itemId 'y1TvlxLh,SqabMQhL,TOabi8Tb' \
    --limit '89' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 310 'PublicQueryUserEntitlements' test.out

#- 311 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZzMHc8wm' \
    --appId 'IBGvFVYf' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetUserAppEntitlementByAppId' test.out

#- 312 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'rq0cuP5i' \
    --limit '63' \
    --offset '81' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 312 'PublicQueryUserEntitlementsByAppType' test.out

#- 313 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gn7sN5Ig' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'r6IPTz9v' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserEntitlementByItemId' test.out

#- 314 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'lbwyPBTT' \
    --entitlementClazz 'APP' \
    --sku 'yHTcQGmO' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetUserEntitlementBySku' test.out

#- 315 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'yQe7AEkT' \
    --appIds '2vkGQIma,5gBSERcg,JBMHYn2G' \
    --itemIds 'cF0P2DaC,lnBGY9F4,jlpOCSGy' \
    --skus 'pmrDzuk7,pWArBcyn,eQjRrYwe' \
    > test.out 2>&1
eval_tap $? 315 'PublicExistsAnyUserActiveEntitlement' test.out

#- 316 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '4nJeFY77' \
    --appId 'OAG8Ik8n' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 317 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '3RJFcQmu' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId '3YRCiAdS' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 318 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mgIgvwhF' \
    --ids 'RHmrJpsW,QYZH6FKr,3DgYM3Mf' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 319 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'mBNEh5td' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'CAJ4rZbd' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 320 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'FvWvHjgP' \
    --namespace "$AB_NAMESPACE" \
    --userId '1AOiKuUp' \
    > test.out 2>&1
eval_tap $? 320 'PublicGetUserEntitlement' test.out

#- 321 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'esRF7K3F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eFWC72mE' \
    --body '{"options": ["CxYcQTfD", "TXPAliQb", "RXgDclUg"], "useCount": 76}' \
    > test.out 2>&1
eval_tap $? 321 'PublicConsumeUserEntitlement' test.out

#- 322 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'K7horHxp' \
    --body '{"code": "jwBvXGuT", "language": "ZF-eHwH", "region": "0eKhDPgG"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicRedeemCode' test.out

#- 323 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UxYzbKTS' \
    --body '{"excludeOldTransactions": true, "language": "Vaz_877", "productId": "3zPfOOrY", "receiptData": "2eLgdJDv", "region": "tPFxn4Yz", "transactionId": "1CZtnzOf"}' \
    > test.out 2>&1
eval_tap $? 323 'PublicFulfillAppleIAPItem' test.out

#- 324 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '4JTyt1G0' \
    --body '{"epicGamesJwtToken": "eJts7TeZ"}' \
    > test.out 2>&1
eval_tap $? 324 'SyncEpicGamesInventory' test.out

#- 325 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'oaOyLGOh' \
    --body '{"autoAck": true, "language": "Xv", "orderId": "k8MKYORv", "packageName": "xV6woWwg", "productId": "MpvbsF15", "purchaseTime": 72, "purchaseToken": "wgfJ77Ju", "region": "RUMvXMvm"}' \
    > test.out 2>&1
eval_tap $? 325 'PublicFulfillGoogleIAPItem' test.out

#- 326 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'kdsy6An1' \
    --body '{"currencyCode": "WeHKCf8Q", "price": 0.14845521286687569, "productId": "GYKgYvJU", "serviceLabel": 100}' \
    > test.out 2>&1
eval_tap $? 326 'PublicReconcilePlayStationStore' test.out

#- 327 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uWYtq7Sc' \
    --body '{"appId": "dMh3n0n7", "language": "II-UeBV", "region": "FYTdqgnb", "stadiaPlayerId": "1s2l5Ftd"}' \
    > test.out 2>&1
eval_tap $? 327 'SyncStadiaEntitlement' test.out

#- 328 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'mHLKYMdC' \
    --body '{"appId": "sQdnwoxA", "currencyCode": "do2qnwZh", "language": "zjWN-uMGK_oo", "price": 0.8349871649380995, "productId": "uTFHcWYr", "region": "QnghQurp", "steamId": "ZdShSuQT"}' \
    > test.out 2>&1
eval_tap $? 328 'SyncSteamInventory' test.out

#- 329 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Quq4qygj' \
    --body '{"gameId": "fLKzcLe0", "language": "wkd-ca", "region": "tyVgqBMk"}' \
    > test.out 2>&1
eval_tap $? 329 'SyncTwitchDropsEntitlement' test.out

#- 330 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ccotMVZl' \
    --body '{"currencyCode": "nyJGJrgn", "price": 0.5332184816986449, "productId": "wgRbwe4s", "xstsToken": "mB40sLrZ"}' \
    > test.out 2>&1
eval_tap $? 330 'SyncXboxInventory' test.out

#- 331 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'hGCCL8Iq' \
    --itemId '0zZsa08T' \
    --limit '47' \
    --offset '80' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 331 'PublicQueryUserOrders' test.out

#- 332 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'bKaUvZZa' \
    --body '{"currencyCode": "En06D6Eq", "discountedPrice": 71, "ext": {"9SsWw50m": {}, "5rIfmv7T": {}, "5C8ij10F": {}}, "itemId": "0b2ViNEA", "language": "gzV-MAcA", "price": 1, "quantity": 3, "region": "fMff4qxw", "returnUrl": "dYfxUcT3"}' \
    > test.out 2>&1
eval_tap $? 332 'PublicCreateUserOrder' test.out

#- 333 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZCrkVw7y' \
    --userId 'fW6I7RzJ' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetUserOrder' test.out

#- 334 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '3iM5U04d' \
    --userId 'wn1csV3s' \
    > test.out 2>&1
eval_tap $? 334 'PublicCancelUserOrder' test.out

#- 335 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wNbnlmQg' \
    --userId '6JlUiAzY' \
    > test.out 2>&1
eval_tap $? 335 'PublicGetUserOrderHistories' test.out

#- 336 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Y8CKRzyB' \
    --userId 'RlLX3I5Q' \
    > test.out 2>&1
eval_tap $? 336 'PublicDownloadUserOrderReceipt' test.out

#- 337 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'ahLdS4Vz' \
    > test.out 2>&1
eval_tap $? 337 'PublicGetPaymentAccounts' test.out

#- 338 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'KzTUsxn2' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'ZkNfjDrz' \
    > test.out 2>&1
eval_tap $? 338 'PublicDeletePaymentAccount' test.out

#- 339 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'VshIZgAt' \
    --chargeStatus 'CHARGED' \
    --itemId 'lJjQi3L9' \
    --limit '2' \
    --offset '32' \
    --sku '5L0cQxet' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserSubscriptions' test.out

#- 340 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '08OnbMnO' \
    --body '{"currencyCode": "fQqYK85G", "itemId": "5PvERIrE", "language": "REz", "region": "WYSzl9IN", "returnUrl": "65rPx22Z", "source": "Q03h9l2w"}' \
    > test.out 2>&1
eval_tap $? 340 'PublicSubscribeSubscription' test.out

#- 341 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hf3XHZwX' \
    --itemId 'q5EpF3nF' \
    > test.out 2>&1
eval_tap $? 341 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 342 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PPUCygTN' \
    --userId 'xfKH1skp' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserSubscription' test.out

#- 343 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iLAya6Ei' \
    --userId 'ox16qbJf' \
    > test.out 2>&1
eval_tap $? 343 'PublicChangeSubscriptionBillingAccount' test.out

#- 344 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zOxaINY0' \
    --userId 'bgiyksFn' \
    --body '{"immediate": false, "reason": "7vNViMBT"}' \
    > test.out 2>&1
eval_tap $? 344 'PublicCancelSubscription' test.out

#- 345 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3JLTbsYf' \
    --userId 'yoHkHwLp' \
    --excludeFree  \
    --limit '64' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserSubscriptionBillingHistories' test.out

#- 346 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'BOx1fRW2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N7TweQId' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetWallet' test.out

#- 347 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'st8TS0G4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXaKxy5s' \
    --limit '68' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 347 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE