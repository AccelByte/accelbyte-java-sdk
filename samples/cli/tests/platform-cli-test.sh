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
echo "1..380"

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
    --body '{"context": {"item": {"appId": "pS1ZNPqb", "appType": "SOFTWARE", "baseAppId": "MBdraNOx", "boothName": "K1V0ZIoe", "boundItemIds": ["Z0D4klYK", "uvUiIf8g", "sQdYfdMQ"], "categoryPath": "GYD9Wjfq", "clazz": "cEATZYdQ", "createdAt": "1994-07-08T00:00:00Z", "description": "tOI1cLep", "displayOrder": 36, "entitlementType": "DURABLE", "ext": {"4HRswTjK": {}, "1LT7Jsnb": {}, "C5bvc9m9": {}}, "features": ["cjBncojF", "wiTT2BdX", "jzxsvNVL"], "fresh": false, "images": [{"as": "nEncRCE5", "caption": "erswRCKR", "height": 56, "imageUrl": "DlSLVOWf", "smallImageUrl": "XgHjqQaB", "width": 76}, {"as": "bc8nvLfa", "caption": "93A5tE1E", "height": 53, "imageUrl": "75AeeKmi", "smallImageUrl": "cwlegsfn", "width": 52}, {"as": "syibuzPz", "caption": "75rICp8J", "height": 75, "imageUrl": "UALI648S", "smallImageUrl": "i97pQPZJ", "width": 70}], "itemId": "hpRHFMiI", "itemIds": ["xz2Mibm7", "MnTDcvj6", "OdWN2rgU"], "itemQty": {"DbKF4yvY": 9, "aqyPxe64": 49, "qMcKEotV": 33}, "itemType": "CODE", "language": "6iSx9g6u", "listable": true, "localExt": {"2cneo3Si": {}, "UQA3072M": {}, "Yerxuosw": {}}, "longDescription": "AP5HnMfq", "lootBoxConfig": {"rewardCount": 83, "rewards": [{"lootBoxItems": [{"count": 8, "itemId": "P7YyYPol", "itemSku": "9rPtT2q9", "itemType": "bcQiOdQL"}, {"count": 69, "itemId": "AEkvHlQn", "itemSku": "5ecos3G2", "itemType": "eW4fwjSk"}, {"count": 65, "itemId": "Md4aNF5D", "itemSku": "bKLgBZAJ", "itemType": "WZHlUfWE"}], "name": "NMysaGRy", "odds": 0.6231938605441117, "type": "REWARD", "weight": 25}, {"lootBoxItems": [{"count": 78, "itemId": "sPPcNwnM", "itemSku": "VMwOqAK4", "itemType": "VQmrfnN8"}, {"count": 50, "itemId": "BdyScjLB", "itemSku": "WuAG70e3", "itemType": "tFWJ38eS"}, {"count": 36, "itemId": "se1UE7DB", "itemSku": "OwVX4cJa", "itemType": "rqLW2WDi"}], "name": "FwM92iXi", "odds": 0.3335133660862579, "type": "REWARD_GROUP", "weight": 66}, {"lootBoxItems": [{"count": 39, "itemId": "HPxOOyk0", "itemSku": "4wZE0mrG", "itemType": "bJyOtt4a"}, {"count": 74, "itemId": "ZRS8Xohc", "itemSku": "hRQDB02e", "itemType": "yGaYiudQ"}, {"count": 79, "itemId": "dRjrNh21", "itemSku": "1ZndTmmI", "itemType": "BMNrGSFv"}], "name": "uvGi4p2b", "odds": 0.07674443579053702, "type": "REWARD", "weight": 41}], "rollFunction": "DEFAULT"}, "maxCount": 66, "maxCountPerUser": 0, "name": "kDryoC5z", "namespace": "XbA0EWyj", "optionBoxConfig": {"boxItems": [{"count": 53, "itemId": "DjNcyHdH", "itemSku": "s5kkh8He", "itemType": "nsWLHq1V"}, {"count": 50, "itemId": "IQsRKGJx", "itemSku": "TvCV0Lxu", "itemType": "PR0IsAvN"}, {"count": 8, "itemId": "zUkwohf5", "itemSku": "p6vNKY0v", "itemType": "aGiirQyl"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 25, "comparison": "is", "name": "7tkswLTi", "predicateType": "SeasonPassPredicate", "value": "7XFNDrAg", "values": ["iLz0zAlY", "DXiaA2ou", "71hfrn2v"]}, {"anyOf": 43, "comparison": "includes", "name": "wG3Fdtnv", "predicateType": "SeasonPassPredicate", "value": "QWVCDDYu", "values": ["gixizNqR", "3b2H4hHO", "mpzkMsi8"]}, {"anyOf": 21, "comparison": "excludes", "name": "CrFTe5zC", "predicateType": "SeasonPassPredicate", "value": "cQHp2zCa", "values": ["rn6eVXye", "Lm2rrwm9", "9zHJuxwZ"]}]}, {"operator": "or", "predicates": [{"anyOf": 12, "comparison": "isLessThanOrEqual", "name": "CMHkvLto", "predicateType": "SeasonPassPredicate", "value": "LYWD9AxS", "values": ["ncXm2fPB", "T69mONIU", "sKQpn4cp"]}, {"anyOf": 1, "comparison": "isNot", "name": "aNTXz5U4", "predicateType": "EntitlementPredicate", "value": "U6ZR5jfW", "values": ["1FmFotR5", "RTtZrc4t", "VTjJk4Za"]}, {"anyOf": 26, "comparison": "includes", "name": "fg8gJEXK", "predicateType": "EntitlementPredicate", "value": "ZQJepFUZ", "values": ["80AH3db7", "C0kx1ww0", "9Dxi1CJL"]}]}, {"operator": "and", "predicates": [{"anyOf": 31, "comparison": "isLessThan", "name": "QW4mnbgH", "predicateType": "SeasonTierPredicate", "value": "Ms5buU7L", "values": ["41K5GXYC", "iMkQkohZ", "CQiRjItR"]}, {"anyOf": 75, "comparison": "isGreaterThan", "name": "o6PtkkgG", "predicateType": "EntitlementPredicate", "value": "FxDwSOvx", "values": ["Nt0MX0dC", "Tbl60QCy", "QogNJtN2"]}, {"anyOf": 34, "comparison": "isNot", "name": "7LiEmWnv", "predicateType": "EntitlementPredicate", "value": "Fm4c9C1h", "values": ["VHUJgEq3", "7vKHUHmA", "mGKp8Out"]}]}]}, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 51, "fixedTrialCycles": 1, "graceDays": 1}, "region": "A14JtZ8Q", "regionData": [{"currencyCode": "QJx6EcBC", "currencyNamespace": "Tmp9YASx", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1991-12-19T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1981-01-08T00:00:00Z", "discountedPrice": 22, "expireAt": "1980-09-13T00:00:00Z", "price": 48, "purchaseAt": "1980-10-23T00:00:00Z", "trialPrice": 33}, {"currencyCode": "HGoIhrF7", "currencyNamespace": "dkWrmrmw", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1972-11-22T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1983-05-20T00:00:00Z", "discountedPrice": 23, "expireAt": "1997-03-25T00:00:00Z", "price": 14, "purchaseAt": "1990-12-01T00:00:00Z", "trialPrice": 57}, {"currencyCode": "ORNzAJX8", "currencyNamespace": "VaWUO31a", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1986-11-27T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1989-05-21T00:00:00Z", "discountedPrice": 11, "expireAt": "1984-10-05T00:00:00Z", "price": 88, "purchaseAt": "1987-02-08T00:00:00Z", "trialPrice": 47}], "seasonType": "TIER", "sku": "Okibrun1", "stackable": false, "status": "INACTIVE", "tags": ["FA8it2pm", "noMkAqC9", "fAk10D1a"], "targetCurrencyCode": "c1N0psyf", "targetItemId": "DOBqS47W", "targetNamespace": "8sWRcq0p", "thumbnailUrl": "uTctiI1P", "title": "n4zxN4Ve", "updatedAt": "1988-04-24T00:00:00Z", "useCount": 32}, "namespace": "FadvgcF3", "order": {"currency": {"currencyCode": "mw079QSm", "currencySymbol": "ruvL5YS4", "currencyType": "VIRTUAL", "decimals": 69, "namespace": "5PiefCBD"}, "ext": {"QSH91A6k": {}, "YZaufEkv": {}, "WLJKdUfi": {}}, "free": false}, "source": "DLC"}, "script": "Uq9FwaPG", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'dso8ToEX' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id '3yAxCM6j' \
    --body '{"grantDays": "VtP366vR"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'Knz2JHxB' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'qryOTtlJ' \
    --body '{"grantDays": "LUlrLCqq"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "BgZlZS1c", "dryRun": true, "fulfillmentUrl": "QfndEiKJ", "itemType": "OPTIONBOX", "purchaseConditionUrl": "xh6fdH00"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '8NhOvpjA' \
    --itemType 'SEASON' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'X4ZBTwEo' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'IhwICxdj' \
    --body '{"clazz": "40VPMnIK", "dryRun": false, "fulfillmentUrl": "jc2eZ3iB", "purchaseConditionUrl": "mTlqJIb8"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'G4APAGWA' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --name '9QfiBCtu' \
    --offset '70' \
    --tag 'gtde2pjQ' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "wydp2an1", "items": [{"extraSubscriptionDays": 45, "itemId": "35hUHHr0", "itemName": "O6Izrdic", "quantity": 46}, {"extraSubscriptionDays": 82, "itemId": "73fuf0aK", "itemName": "O9rpv9Br", "quantity": 73}, {"extraSubscriptionDays": 92, "itemId": "pCK42Ykh", "itemName": "ZYlfaHAB", "quantity": 40}], "maxRedeemCountPerCampaignPerUser": 96, "maxRedeemCountPerCode": 50, "maxRedeemCountPerCodePerUser": 38, "maxSaleCount": 94, "name": "71fI9aEx", "redeemEnd": "1999-11-04T00:00:00Z", "redeemStart": "1972-01-02T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["dVSHwEdk", "RuLSLdEM", "NU4eJ5Pg"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'vpMFBIrY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'fL459Xj4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "O9CoNary", "items": [{"extraSubscriptionDays": 40, "itemId": "FA5Jx7wb", "itemName": "IVMZEKRm", "quantity": 73}, {"extraSubscriptionDays": 56, "itemId": "Q5EheMpW", "itemName": "9WMwy6uU", "quantity": 25}, {"extraSubscriptionDays": 28, "itemId": "8hB3tt8s", "itemName": "wys2rSmb", "quantity": 70}], "maxRedeemCountPerCampaignPerUser": 93, "maxRedeemCountPerCode": 63, "maxRedeemCountPerCodePerUser": 12, "maxSaleCount": 27, "name": "Thj3D1hk", "redeemEnd": "1996-04-27T00:00:00Z", "redeemStart": "1974-09-20T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["Mxb2inxS", "iWuO7whf", "uSNCWxJn"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'Jj8QOf5U' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '7BDQ22G3' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tKzgteTW' \
    --body '{"categoryPath": "qzuAc8bn", "localizationDisplayNames": {"m1NE6j8c": "XI95hSn4", "95XTPQo5": "gnPCiFU6", "t3QcTiuo": "wkv6dwcx"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Msy1NICX' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'I7zTVCqz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iHCwD2ej' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'O6XZneGJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jQEsxNd6' \
    --body '{"localizationDisplayNames": {"F8ImnzTv": "e7EfJnFC", "Cqo1NEZJ": "zf8ZJ7ir", "jBvG79Fq": "nTxKniyN"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'bijIYfK9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NHvIFcZe' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'VINW6x3T' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ap7X4WbK' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'P8nnVovJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nQFO0hes' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'zZebfPYo' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '37' \
    --code 'aOVnMv23' \
    --limit '36' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'z5gBhz48' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 73}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'oLa7iulT' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '29' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'LEvCjvXJ' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '59' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'NgIpvHK4' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '100' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'Y99xI6I4' \
    --namespace "$AB_NAMESPACE" \
    --code 'QbFqSzYW' \
    --limit '41' \
    --offset '100' \
    --userId 'Cq5XqejC' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Pl8qPe1U' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'XwC8CrlA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'wt4Ei3gt' \
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
    --body '{"grpcServerAddress": "ehYOxKiw"}' \
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
    --body '{"currencyCode": "lK5qWnr6", "currencySymbol": "1VFUoNw8", "currencyType": "REAL", "decimals": 5, "localizationDescriptions": {"6VmoToRe": "9RCTBFg8", "Jm6Wff36": "NB8aHE7k", "4RW2WlH2": "gmotfqZS"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'gFJvZQAH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"LkSxaVzu": "JZ8yS3dC", "pVQR1uQz": "q4Cb2DCl", "KTJfWBMm": "kf0vxoyQ"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '9JyRNo5I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'I9DA93Q1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '6W4F0iLW' \
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
    --body '{"data": [{"id": "Sz4awCSP", "rewards": [{"currency": {"currencyCode": "NEuOK9YW", "namespace": "C6lFLGt6"}, "item": {"itemId": "8bjSSB2L", "itemSku": "g0vNHutq", "itemType": "fgSeMu6M"}, "quantity": 27, "type": "ITEM"}, {"currency": {"currencyCode": "dFr8Dzat", "namespace": "L5b3RXVK"}, "item": {"itemId": "CVLwXOIe", "itemSku": "zUEzWvlU", "itemType": "j8fXDp7F"}, "quantity": 51, "type": "ITEM"}, {"currency": {"currencyCode": "aGf1suWF", "namespace": "80dlqOum"}, "item": {"itemId": "0YhC0c49", "itemSku": "CCkPp7IV", "itemType": "v2YrIjOV"}, "quantity": 59, "type": "CURRENCY"}]}, {"id": "6FLcDO9A", "rewards": [{"currency": {"currencyCode": "7zaO50Zi", "namespace": "oO2MJDLt"}, "item": {"itemId": "SJThhlSj", "itemSku": "TgXGbBgR", "itemType": "hDfVMRMJ"}, "quantity": 43, "type": "CURRENCY"}, {"currency": {"currencyCode": "mHJ9P9QJ", "namespace": "m7Qa5qiO"}, "item": {"itemId": "8SQcAKVU", "itemSku": "ZMGkIb4S", "itemType": "8YLLRsUV"}, "quantity": 89, "type": "ITEM"}, {"currency": {"currencyCode": "afCAt45j", "namespace": "h7jshMfP"}, "item": {"itemId": "XzQvBcxV", "itemSku": "eEKRgeWf", "itemType": "GzyiRFPx"}, "quantity": 86, "type": "CURRENCY"}]}, {"id": "JdyVrVN7", "rewards": [{"currency": {"currencyCode": "jwstMir5", "namespace": "bs8ugD26"}, "item": {"itemId": "nT0v63fW", "itemSku": "Dig36K7y", "itemType": "e30cjiuo"}, "quantity": 0, "type": "ITEM"}, {"currency": {"currencyCode": "kSr61Uop", "namespace": "BLzjeWmR"}, "item": {"itemId": "8cNMfft0", "itemSku": "3Oahm0Q9", "itemType": "J98bRqUc"}, "quantity": 77, "type": "CURRENCY"}, {"currency": {"currencyCode": "OoaK0EX2", "namespace": "C7CGM4bv"}, "item": {"itemId": "j5BDKhN1", "itemSku": "E87Gp7ks", "itemType": "ZWncx4Tw"}, "quantity": 94, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"xRBF2dWM": "m0IuD6p6", "YfwnC6iH": "TIdJeql0", "dEYs8Y9S": "CSAqW67J"}}, {"platform": "XBOX", "platformDlcIdMap": {"amnvptw7": "v4icgwma", "SRaHYaiA": "jMLmshic", "OdA4QiLE": "hgbV9zvS"}}, {"platform": "PSN", "platformDlcIdMap": {"TH4ny9FY": "yBUOXcbY", "HSL7aMkU": "wvhIWUuS", "P2hME2W8": "5JUweT2B"}}]}' \
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
    --entitlementClazz 'MEDIA' \
    --entitlementName 'iWoZVN95' \
    --itemId 'e7Brixuo,R1DRIHFT,9ZNg6j1E' \
    --limit '20' \
    --offset '10' \
    --userId '56iTVOCM' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'so9RmYQ6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '52' \
    --status 'SUCCESS' \
    --userId '9d8W8QX2' \
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
    --body '{"bundleId": "JD4rubdA", "password": "ClZX5nCc"}' \
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
    --body '{"sandboxId": "p8AhMSXU"}' \
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
    --body '{"applicationName": "F2vkVVDw", "serviceAccountId": "k81UrvrN"}' \
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
    --body '{"data": [{"itemIdentity": "1I0g2rS8", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"9eMs4AQQ": "JQ8hIyx1", "PWDBJoBn": "VdXlZ6Ic", "PNPeRmWO": "xhP8vLbU"}}, {"itemIdentity": "bNkvGokt", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"5z9vPJd2": "legjnliP", "vnQwYV0i": "gCnfHTCN", "XwYdh30m": "n17u8Ik0"}}, {"itemIdentity": "kzLVrC00", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"TG9xhnES": "1oOqIISQ", "4LzCipMG": "kndaZUKq", "eWBWACkd": "0MGrs5xn"}}]}' \
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
    --body '{"environment": "8RvCnmry"}' \
    > test.out 2>&1
eval_tap $? 68 'UpdatePlaystationIAPConfig' test.out

#- 69 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeletePlaystationIAPConfig' test.out

#- 70 GetStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'GetStadiaIAPConfig' test.out

#- 71 DeleteStadiaIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteStadiaIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'DeleteStadiaIAPConfig' test.out

#- 72 UpdateStadiaJsonConfigFile
./ng net.accelbyte.sdk.cli.Main platform updateStadiaJsonConfigFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 72 'UpdateStadiaJsonConfigFile' test.out

#- 73 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetSteamIAPConfig' test.out

#- 74 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "rFRDJESe", "publisherAuthenticationKey": "LnBxisgF"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateSteamIAPConfig' test.out

#- 75 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteSteamIAPConfig' test.out

#- 76 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetTwitchIAPConfig' test.out

#- 77 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "C4gFtWkr", "clientSecret": "buoyTW78", "organizationId": "2s4MPGmL"}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateTwitchIAPConfig' test.out

#- 78 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteTwitchIAPConfig' test.out

#- 79 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetXblIAPConfig' test.out

#- 80 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "uTpfDhsL"}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateXblIAPConfig' test.out

#- 81 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteXblAPConfig' test.out

#- 82 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'UCJ3TSiI' \
    > test.out 2>&1
eval_tap $? 82 'UpdateXblBPCertFile' test.out

#- 83 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature '9E2ldlRH' \
    --itemId 'cN9ekUPv' \
    --itemType 'BUNDLE' \
    --endTime 'CgnE0neh' \
    --startTime 'so6mMVCr' \
    > test.out 2>&1
eval_tap $? 83 'DownloadInvoiceDetails' test.out

#- 84 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'AjJ9W96N' \
    --itemId 'K4opmDvE' \
    --itemType 'APP' \
    --endTime 'ra9JkBkJ' \
    --startTime '3kfZIh7s' \
    > test.out 2>&1
eval_tap $? 84 'GenerateInvoiceSummary' test.out

#- 85 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '47ZiX4Ce' \
    --body '{"categoryPath": "wRfnkvFi", "targetItemId": "ViBuAWfR", "targetNamespace": "C8kpIH03"}' \
    > test.out 2>&1
eval_tap $? 85 'SyncInGameItem' test.out

#- 86 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '4J9xR98V' \
    --body '{"appId": "0038a4Tl", "appType": "DLC", "baseAppId": "OfhPryhf", "boothName": "G81BHdsp", "categoryPath": "Py9kIWmI", "clazz": "AIbP8uv6", "displayOrder": 50, "entitlementType": "DURABLE", "ext": {"RusQqHEv": {}, "T9Mlo1po": {}, "tlD4SptN": {}}, "features": ["CyIJsoI5", "jnOOrNuF", "qRgSnkGn"], "images": [{"as": "Wu9lJ8xf", "caption": "7PUdgAYf", "height": 63, "imageUrl": "sZ13lR5o", "smallImageUrl": "qtcYYXHX", "width": 16}, {"as": "lxKyjnjR", "caption": "u3N7IlPq", "height": 20, "imageUrl": "PWbY0uSk", "smallImageUrl": "ZTnx7uW2", "width": 98}, {"as": "pUxZSpel", "caption": "QTqb7VyS", "height": 1, "imageUrl": "TfnrrqM4", "smallImageUrl": "zPO5RMep", "width": 20}], "itemIds": ["xFGFXQ6b", "MG7BWqM4", "7BnBUC4R"], "itemQty": {"qFNJxEUA": 76, "9Hj7hm3J": 95, "00O90maq": 65}, "itemType": "BUNDLE", "listable": false, "localizations": {"mdpYYkYA": {"description": "dyo7wWHH", "localExt": {"VvWIq7Sa": {}, "FYKVkDnI": {}, "DiQgJy3e": {}}, "longDescription": "SItVEgkP", "title": "Glt4ktBn"}, "Z6pjVzd9": {"description": "YGOYYFM2", "localExt": {"Qj6eAMXk": {}, "8BQ8pi7c": {}, "i1aOpJU3": {}}, "longDescription": "gYejnjvy", "title": "RnrUcPhr"}, "pNTkDcZh": {"description": "s2Pwcz0q", "localExt": {"nlKGir8P": {}, "CT5J6aEn": {}, "yXylAQGf": {}}, "longDescription": "OstEPQOL", "title": "w2sa2N4D"}}, "lootBoxConfig": {"rewardCount": 67, "rewards": [{"lootBoxItems": [{"count": 41, "itemId": "0J0sbRiG", "itemSku": "Uznk1gOi", "itemType": "HWNyieWt"}, {"count": 39, "itemId": "xuDMofYZ", "itemSku": "eRpr5azl", "itemType": "uOFI2gXi"}, {"count": 62, "itemId": "1VEsJ6oP", "itemSku": "nVUJN1HC", "itemType": "tfwOePLT"}], "name": "2asI5gOk", "odds": 0.7511826213328209, "type": "REWARD", "weight": 63}, {"lootBoxItems": [{"count": 33, "itemId": "O7Jg8buO", "itemSku": "qAtZqg6b", "itemType": "g4oWnMjr"}, {"count": 56, "itemId": "cFpjkWK9", "itemSku": "BVLHzlSH", "itemType": "bT4Twovo"}, {"count": 66, "itemId": "oxvnVAWl", "itemSku": "2An9R2LQ", "itemType": "nPBbXL8C"}], "name": "gH4hiI4z", "odds": 0.10306394259453022, "type": "PROBABILITY_GROUP", "weight": 27}, {"lootBoxItems": [{"count": 28, "itemId": "b5lcD0Y4", "itemSku": "xKXaEcYw", "itemType": "gmY44cdN"}, {"count": 80, "itemId": "ZZGqzkMr", "itemSku": "SJASYbDJ", "itemType": "ZRgRL58a"}, {"count": 67, "itemId": "ncVKFQ2t", "itemSku": "fdcBtnFT", "itemType": "sHJlaBKU"}], "name": "wFDIXLmY", "odds": 0.18805770857162063, "type": "REWARD", "weight": 45}], "rollFunction": "CUSTOM"}, "maxCount": 44, "maxCountPerUser": 41, "name": "6nyAtTbw", "optionBoxConfig": {"boxItems": [{"count": 59, "itemId": "XhOO0YAv", "itemSku": "btV6pq9s", "itemType": "tD19pOmB"}, {"count": 59, "itemId": "Ztg3J6dF", "itemSku": "ZbDn6OdS", "itemType": "6S72RhA3"}, {"count": 83, "itemId": "AKsRn3Ox", "itemSku": "nq43sjrf", "itemType": "o4WvUlCO"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 39, "fixedTrialCycles": 69, "graceDays": 36}, "regionData": {"v80g5xDO": [{"currencyCode": "go4ad7wo", "currencyNamespace": "d0QjYmqr", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1972-11-04T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1974-07-14T00:00:00Z", "discountedPrice": 70, "expireAt": "1990-05-08T00:00:00Z", "price": 71, "purchaseAt": "1971-07-20T00:00:00Z", "trialPrice": 5}, {"currencyCode": "3rv8Dq7X", "currencyNamespace": "PyjfKnDh", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1995-12-25T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1987-06-01T00:00:00Z", "discountedPrice": 84, "expireAt": "1983-05-06T00:00:00Z", "price": 87, "purchaseAt": "1975-10-14T00:00:00Z", "trialPrice": 55}, {"currencyCode": "7EsBoF2z", "currencyNamespace": "jDoM8iaU", "currencyType": "REAL", "discountAmount": 35, "discountExpireAt": "1974-06-14T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1972-04-30T00:00:00Z", "discountedPrice": 63, "expireAt": "1972-06-04T00:00:00Z", "price": 89, "purchaseAt": "1993-06-21T00:00:00Z", "trialPrice": 78}], "CPVFKNQs": [{"currencyCode": "eT7Xd9NN", "currencyNamespace": "X8VvBkfG", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1987-10-01T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1983-09-27T00:00:00Z", "discountedPrice": 11, "expireAt": "1995-11-11T00:00:00Z", "price": 76, "purchaseAt": "1979-03-20T00:00:00Z", "trialPrice": 48}, {"currencyCode": "xHU1jsRs", "currencyNamespace": "T0kOhqYC", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1994-09-10T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1976-09-15T00:00:00Z", "discountedPrice": 60, "expireAt": "1989-11-11T00:00:00Z", "price": 62, "purchaseAt": "1991-07-09T00:00:00Z", "trialPrice": 83}, {"currencyCode": "2S7ERXqb", "currencyNamespace": "8Wu8V16Q", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1983-09-15T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1988-12-09T00:00:00Z", "discountedPrice": 79, "expireAt": "1972-09-20T00:00:00Z", "price": 11, "purchaseAt": "1993-05-24T00:00:00Z", "trialPrice": 56}], "DuPgyRmf": [{"currencyCode": "DCUrhoLt", "currencyNamespace": "Q4rbE2BB", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1972-09-16T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1972-01-09T00:00:00Z", "discountedPrice": 1, "expireAt": "1980-07-17T00:00:00Z", "price": 82, "purchaseAt": "1999-11-29T00:00:00Z", "trialPrice": 91}, {"currencyCode": "bzGYPqSa", "currencyNamespace": "2P0tbsyk", "currencyType": "REAL", "discountAmount": 58, "discountExpireAt": "1973-04-07T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1991-01-08T00:00:00Z", "discountedPrice": 88, "expireAt": "1994-06-24T00:00:00Z", "price": 35, "purchaseAt": "1999-07-17T00:00:00Z", "trialPrice": 99}, {"currencyCode": "Z5ArDcpS", "currencyNamespace": "xfdYo3aA", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1991-08-31T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1977-03-31T00:00:00Z", "discountedPrice": 6, "expireAt": "1972-04-14T00:00:00Z", "price": 100, "purchaseAt": "1979-12-27T00:00:00Z", "trialPrice": 48}]}, "seasonType": "TIER", "sku": "DcMf0PHx", "stackable": false, "status": "INACTIVE", "tags": ["AVfZM3qu", "oyQMpEdg", "mMnirVPP"], "targetCurrencyCode": "nOWFUICl", "targetNamespace": "4vgqWKp7", "thumbnailUrl": "odeYpf2o", "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 86 'CreateItem' test.out

#- 87 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'JE2X6ppA' \
    --appId 'LIc2wDMR' \
    > test.out 2>&1
eval_tap $? 87 'GetItemByAppId' test.out

#- 88 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'ysGuReCt' \
    --baseAppId '3RdpMjL0' \
    --categoryPath 'e0bdf1v4' \
    --features 'MCNn6Mbw' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --limit '80' \
    --offset '51' \
    --region 'jcK2sqsg' \
    --sortBy 'name:desc,name:asc' \
    --storeId 'v9XD52bM' \
    --tags 'eVEx51AQ' \
    --targetNamespace 'rgyKQaOw' \
    > test.out 2>&1
eval_tap $? 88 'QueryItems' test.out

#- 89 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'bdmYWs9O,SDpqXeHf,Ok6AiA20' \
    > test.out 2>&1
eval_tap $? 89 'ListBasicItemsByFeatures' test.out

#- 90 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'o0BRuyT4' \
    --sku 'Hp9O2BOO' \
    > test.out 2>&1
eval_tap $? 90 'GetItemBySku' test.out

#- 91 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '2jSQ4Tqp' \
    --populateBundle  \
    --region 'CTMcYiry' \
    --storeId 'WKi0aDjL' \
    --sku 'KLnlgr53' \
    > test.out 2>&1
eval_tap $? 91 'GetLocaleItemBySku' test.out

#- 92 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '1BYgZorW' \
    --sku 'lEqiedAh' \
    > test.out 2>&1
eval_tap $? 92 'GetItemIdBySku' test.out

#- 93 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'R2e4l7Pq,uMWFIHEi,tJMG9mcb' \
    --storeId 'DRXi6pAB' \
    > test.out 2>&1
eval_tap $? 93 'GetBulkItemIdBySkus' test.out

#- 94 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'RNTlX00k' \
    --region 'bu5tyKnP' \
    --storeId 'KKZAepRm' \
    --itemIds 'a18X5hKj' \
    > test.out 2>&1
eval_tap $? 94 'BulkGetLocaleItems' test.out

#- 95 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetAvailablePredicateTypes' test.out

#- 96 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --userId 'ypubXmg7' \
    --body '{"itemIds": ["iEkDraGS", "3PhhlV4m", "ilBqUxc2"]}' \
    > test.out 2>&1
eval_tap $? 96 'ValidateItemPurchaseCondition' test.out

#- 97 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '58' \
    --offset '49' \
    --sortBy 'xBD33A6c' \
    --storeId 'sHnC1mwN' \
    --keyword 'sKm1rSk5' \
    --language 'b6Tm3r1d' \
    > test.out 2>&1
eval_tap $? 97 'SearchItems' test.out

#- 98 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '93' \
    --offset '47' \
    --sortBy 'name:desc,displayOrder:asc' \
    --storeId 'ZyVqemQl' \
    > test.out 2>&1
eval_tap $? 98 'QueryUncategorizedItems' test.out

#- 99 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'vNwJM9TR' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5Htc1B0h' \
    > test.out 2>&1
eval_tap $? 99 'GetItem' test.out

#- 100 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'cWVcaXYH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eZJEO2Ho' \
    --body '{"appId": "jiRE4Mqs", "appType": "DEMO", "baseAppId": "pRjGmIyF", "boothName": "Y1oBuwR8", "categoryPath": "l3chWb0w", "clazz": "lwJlcWLo", "displayOrder": 16, "entitlementType": "DURABLE", "ext": {"yWFHmm2e": {}, "5n1d4gWw": {}, "uT4lMrgb": {}}, "features": ["3cpGl58q", "h7hq8V6H", "wJflOUpQ"], "images": [{"as": "E2lxkkYM", "caption": "1IkQST2s", "height": 45, "imageUrl": "WbIq1EOp", "smallImageUrl": "yICpKCgh", "width": 77}, {"as": "mJVxiT04", "caption": "HpiDnNmG", "height": 95, "imageUrl": "dq0lNEmv", "smallImageUrl": "RxUlCE6y", "width": 48}, {"as": "DpP3nzo0", "caption": "qarMSxnU", "height": 37, "imageUrl": "RfSNDANL", "smallImageUrl": "ZDg9EZGo", "width": 30}], "itemIds": ["URugMRyQ", "gtEfCZWr", "oP5Dgsu5"], "itemQty": {"1yuQmnrP": 43, "OeGdWey8": 31, "ZZflre5B": 97}, "itemType": "CODE", "listable": false, "localizations": {"dvmd5qFG": {"description": "1vYRYBYn", "localExt": {"rYMpFFiA": {}, "CltWHHfM": {}, "vyMvns0F": {}}, "longDescription": "62MFzoXW", "title": "PPdXzkUw"}, "kCgRSoQV": {"description": "rsGeRA0V", "localExt": {"hfPLHvaY": {}, "0lr4Bvnu": {}, "caw9QBn0": {}}, "longDescription": "oe55K5Bb", "title": "0WGtpVwR"}, "X0d73iQh": {"description": "u5Moy0Ok", "localExt": {"nqDtkMjA": {}, "QVqllGz2": {}, "zM0KvWoB": {}}, "longDescription": "erF7IxYS", "title": "l6lOHD4x"}}, "lootBoxConfig": {"rewardCount": 67, "rewards": [{"lootBoxItems": [{"count": 45, "itemId": "ssPfbb1J", "itemSku": "yhOP9bmA", "itemType": "v1qlZWiB"}, {"count": 1, "itemId": "7I0hffNe", "itemSku": "tyzmBLWy", "itemType": "OtLU6MyW"}, {"count": 13, "itemId": "CDSG0cJg", "itemSku": "7rkHNiGy", "itemType": "6ilnsedp"}], "name": "mk9t2G1S", "odds": 0.5357733363267445, "type": "PROBABILITY_GROUP", "weight": 8}, {"lootBoxItems": [{"count": 61, "itemId": "3DNyiudR", "itemSku": "kvZctpsB", "itemType": "CMqM5imd"}, {"count": 46, "itemId": "cBcumG9J", "itemSku": "xNieDH9E", "itemType": "hDZTyZhE"}, {"count": 79, "itemId": "1xDRQWau", "itemSku": "LDXlrkr6", "itemType": "4ZqC5EUP"}], "name": "acrHERc2", "odds": 0.9248812219205763, "type": "REWARD", "weight": 1}, {"lootBoxItems": [{"count": 80, "itemId": "gl9Fv5vi", "itemSku": "LL6gsWHW", "itemType": "SGGjkK66"}, {"count": 99, "itemId": "i3CSR6Qx", "itemSku": "SMijgZS3", "itemType": "6wlKHMmd"}, {"count": 8, "itemId": "6lkbVgJe", "itemSku": "zAIBEpRt", "itemType": "biTU9IxR"}], "name": "jjgIwxIw", "odds": 0.6776596063562457, "type": "PROBABILITY_GROUP", "weight": 17}], "rollFunction": "CUSTOM"}, "maxCount": 51, "maxCountPerUser": 15, "name": "0tXxBbyI", "optionBoxConfig": {"boxItems": [{"count": 89, "itemId": "MBKv9HKw", "itemSku": "gEmgrKU7", "itemType": "3jkXhoIk"}, {"count": 69, "itemId": "BvlnDy2k", "itemSku": "6JN8OXsQ", "itemType": "w6hH5nVe"}, {"count": 17, "itemId": "v6139xRO", "itemSku": "EK98XsNL", "itemType": "fESJLMoM"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 62, "fixedTrialCycles": 53, "graceDays": 16}, "regionData": {"VmuECBD5": [{"currencyCode": "1dasUy5d", "currencyNamespace": "qjZ7ekNF", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1999-07-12T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1974-11-13T00:00:00Z", "discountedPrice": 33, "expireAt": "1981-03-24T00:00:00Z", "price": 61, "purchaseAt": "1983-06-28T00:00:00Z", "trialPrice": 71}, {"currencyCode": "Jf8Cx0eb", "currencyNamespace": "kNO9HUNa", "currencyType": "VIRTUAL", "discountAmount": 59, "discountExpireAt": "1984-06-23T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1990-05-13T00:00:00Z", "discountedPrice": 100, "expireAt": "1980-02-12T00:00:00Z", "price": 39, "purchaseAt": "1983-09-03T00:00:00Z", "trialPrice": 72}, {"currencyCode": "lQLBvFcp", "currencyNamespace": "5T8yfsQb", "currencyType": "VIRTUAL", "discountAmount": 27, "discountExpireAt": "1994-07-19T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1995-08-02T00:00:00Z", "discountedPrice": 31, "expireAt": "1971-11-03T00:00:00Z", "price": 19, "purchaseAt": "1996-01-25T00:00:00Z", "trialPrice": 60}], "3HHIQfro": [{"currencyCode": "PW5AmPuv", "currencyNamespace": "VwESxt5F", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1996-06-18T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1976-06-26T00:00:00Z", "discountedPrice": 91, "expireAt": "1986-03-28T00:00:00Z", "price": 24, "purchaseAt": "1985-04-28T00:00:00Z", "trialPrice": 47}, {"currencyCode": "PjJ0hSiC", "currencyNamespace": "Uh1PlT2Z", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1971-10-09T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1997-10-13T00:00:00Z", "discountedPrice": 36, "expireAt": "1987-05-24T00:00:00Z", "price": 78, "purchaseAt": "1983-02-18T00:00:00Z", "trialPrice": 75}, {"currencyCode": "NTmEyH5Y", "currencyNamespace": "9wKgI9Bm", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1985-07-20T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1971-05-01T00:00:00Z", "discountedPrice": 92, "expireAt": "1979-01-27T00:00:00Z", "price": 35, "purchaseAt": "1991-09-04T00:00:00Z", "trialPrice": 16}], "7zRmom0d": [{"currencyCode": "CEtdA2EU", "currencyNamespace": "hWRNoHzY", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1982-05-22T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1997-03-21T00:00:00Z", "discountedPrice": 23, "expireAt": "1997-09-10T00:00:00Z", "price": 14, "purchaseAt": "1972-06-26T00:00:00Z", "trialPrice": 41}, {"currencyCode": "nm0y3jDo", "currencyNamespace": "bX0oMxLp", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1981-01-25T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1987-09-18T00:00:00Z", "discountedPrice": 38, "expireAt": "1993-06-03T00:00:00Z", "price": 36, "purchaseAt": "1983-11-27T00:00:00Z", "trialPrice": 47}, {"currencyCode": "8UVlxGmI", "currencyNamespace": "Q27tT0ho", "currencyType": "REAL", "discountAmount": 53, "discountExpireAt": "1997-11-23T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1971-11-12T00:00:00Z", "discountedPrice": 90, "expireAt": "1990-07-04T00:00:00Z", "price": 96, "purchaseAt": "1971-03-04T00:00:00Z", "trialPrice": 47}]}, "seasonType": "PASS", "sku": "C6Vfkefg", "stackable": false, "status": "ACTIVE", "tags": ["GZjOH80g", "snG58YJi", "4lf8f7rM"], "targetCurrencyCode": "VItNtPcM", "targetNamespace": "zWsJXCKT", "thumbnailUrl": "xvOfLxzo", "useCount": 53}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItem' test.out

#- 101 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'oqoet3gO' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'PJ5rOHuo' \
    > test.out 2>&1
eval_tap $? 101 'DeleteItem' test.out

#- 102 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'QARgEOH0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 39, "orderNo": "SPjaq2ZU"}' \
    > test.out 2>&1
eval_tap $? 102 'AcquireItem' test.out

#- 103 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'lQqRziFI' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'ItY8z5iV' \
    > test.out 2>&1
eval_tap $? 103 'GetApp' test.out

#- 104 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId '9uoKuClm' \
    --namespace "$AB_NAMESPACE" \
    --storeId '9ws6nW1M' \
    --body '{"carousel": [{"alt": "pHrax9ve", "previewUrl": "OrbQiLlk", "thumbnailUrl": "Hoeeaqcw", "type": "image", "url": "CV34LdEh", "videoSource": "generic"}, {"alt": "swbnRj5c", "previewUrl": "D3GM3yVM", "thumbnailUrl": "BFKNDloM", "type": "video", "url": "07bO7l0i", "videoSource": "generic"}, {"alt": "gSsy2ay5", "previewUrl": "tODAq5XQ", "thumbnailUrl": "HdApJ0EJ", "type": "image", "url": "AAdv6BOZ", "videoSource": "vimeo"}], "developer": "fspBpiJx", "forumUrl": "VquCJEf5", "genres": ["Adventure", "Simulation", "RPG"], "localizations": {"5IqVz1aB": {"announcement": "IldBwIra", "slogan": "qJHmM0tO"}, "WZ5ELN1T": {"announcement": "mNNdmYgI", "slogan": "5txGzbRk"}, "2vRwWTUt": {"announcement": "i67Mgn8w", "slogan": "q1up5mY3"}}, "platformRequirements": {"4DRF5UAp": [{"additionals": "P0Yht7Cv", "directXVersion": "dfaFovsP", "diskSpace": "jhuqHQ8u", "graphics": "RjGGMZbL", "label": "8V2xuFJ8", "osVersion": "y7P394Q7", "processor": "gzkuPwzN", "ram": "R5ojgEvq", "soundCard": "CH2eGDh9"}, {"additionals": "FRQdt1U4", "directXVersion": "BAD6MpzG", "diskSpace": "pyUUFVVR", "graphics": "Zwyv1VPl", "label": "WTHJ2QFa", "osVersion": "n67LvayC", "processor": "iWxtEYQa", "ram": "f5vZ9Uiy", "soundCard": "e6UkZX3G"}, {"additionals": "CkpzVcqY", "directXVersion": "sQyXt3AW", "diskSpace": "La94N2Si", "graphics": "yWk28w2N", "label": "keJZaTeS", "osVersion": "3pxhLW5R", "processor": "IX3PpBuM", "ram": "0D8LjU4t", "soundCard": "VF9uX6SM"}], "7wgMzCh3": [{"additionals": "OpjgBWlU", "directXVersion": "t7HDxY9N", "diskSpace": "afdxPltN", "graphics": "nbvn1c8Y", "label": "YqaOXQmd", "osVersion": "LLBkvbij", "processor": "hjZF5zYY", "ram": "i82MHMiA", "soundCard": "p6CSFuPL"}, {"additionals": "H5UeZvTC", "directXVersion": "6Ix4nkSp", "diskSpace": "kKDyGzFu", "graphics": "x2dhSu9r", "label": "W5pi9zv8", "osVersion": "XxKGHuBM", "processor": "u2gS1WuB", "ram": "Wl1s1IJ4", "soundCard": "vkN3QetZ"}, {"additionals": "fzwczLTN", "directXVersion": "KDPlqnTH", "diskSpace": "JE1IQFju", "graphics": "mzridt8h", "label": "qqpNIhlF", "osVersion": "D6mWwelK", "processor": "saa7sV2X", "ram": "XRBz66yd", "soundCard": "V03DsDni"}], "eTF93KRx": [{"additionals": "kCwygj1U", "directXVersion": "c5jf6pGK", "diskSpace": "BD1Xhw5Y", "graphics": "pLME75xa", "label": "LDXtUsTk", "osVersion": "u2tlJDgF", "processor": "D2VEZHJs", "ram": "BiBr3hvv", "soundCard": "Xdp3s2X4"}, {"additionals": "75YIKVja", "directXVersion": "89OcqmBJ", "diskSpace": "q0h7XJYU", "graphics": "Z0VNPRIi", "label": "tCYTx6CR", "osVersion": "FYRmtOJ1", "processor": "QOBJFIm8", "ram": "TDXbNsbF", "soundCard": "21doOrg0"}, {"additionals": "w78WHA50", "directXVersion": "GNVuw5mB", "diskSpace": "S8f5K4go", "graphics": "HXZZwvzA", "label": "YZWYOAuw", "osVersion": "VN3sb28p", "processor": "PhozGsuI", "ram": "0vidbvGo", "soundCard": "pOonUmpi"}]}, "platforms": ["Linux", "Android", "MacOS"], "players": ["Multi", "MMO", "MMO"], "primaryGenre": "FreeToPlay", "publisher": "0REo6Xih", "releaseDate": "1986-08-02T00:00:00Z", "websiteUrl": "4Ti8xqg2"}' \
    > test.out 2>&1
eval_tap $? 104 'UpdateApp' test.out

#- 105 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'R2mjXHdP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OuJdMn3s' \
    > test.out 2>&1
eval_tap $? 105 'DisableItem' test.out

#- 106 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'deFHxeWW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetItemDynamicData' test.out

#- 107 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'VJ5UWJVX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RfmQswwI' \
    > test.out 2>&1
eval_tap $? 107 'EnableItem' test.out

#- 108 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'IRArgYGI' \
    --itemId 'bX5HKQ79' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mUpYP8uj' \
    > test.out 2>&1
eval_tap $? 108 'FeatureItem' test.out

#- 109 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '3LDDaRie' \
    --itemId 'pn6Ib84k' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'skKjNLBH' \
    > test.out 2>&1
eval_tap $? 109 'DefeatureItem' test.out

#- 110 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'arzy0Db6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'uGrhzsu6' \
    --populateBundle  \
    --region 'prfSEeAH' \
    --storeId 'yKtWRj8i' \
    > test.out 2>&1
eval_tap $? 110 'GetLocaleItem' test.out

#- 111 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId '7JJnyYIo' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8ErbgxYR' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 55, "comparison": "isLessThan", "name": "9OeuB7aR", "predicateType": "SeasonTierPredicate", "value": "0S8Brkpe", "values": ["dd04VouT", "UkSovcNM", "SsTwrLub"]}, {"anyOf": 14, "comparison": "isNot", "name": "IV9h5PS2", "predicateType": "EntitlementPredicate", "value": "bsjjoE4w", "values": ["SjhlUcqz", "lKK4el4w", "OWDpopgG"]}, {"anyOf": 67, "comparison": "isGreaterThan", "name": "cLKXErBd", "predicateType": "EntitlementPredicate", "value": "xzDDA0aG", "values": ["khNQdLdg", "BzfRYFp2", "iCfXvQXQ"]}]}, {"operator": "and", "predicates": [{"anyOf": 20, "comparison": "isLessThanOrEqual", "name": "K3VIlgH7", "predicateType": "SeasonPassPredicate", "value": "jslgCFEF", "values": ["xyLNPeb7", "spAod713", "Izh7AhY0"]}, {"anyOf": 68, "comparison": "isNot", "name": "4DqvoX5l", "predicateType": "EntitlementPredicate", "value": "2RTxxfDO", "values": ["9HH0IzxO", "df1WO9ci", "ph20uNBz"]}, {"anyOf": 55, "comparison": "isGreaterThan", "name": "SZxiHiua", "predicateType": "SeasonPassPredicate", "value": "vNU9tWkb", "values": ["Mj4qkprv", "Rej2GObD", "YRj95frX"]}]}, {"operator": "and", "predicates": [{"anyOf": 26, "comparison": "includes", "name": "4lFw8cyR", "predicateType": "SeasonPassPredicate", "value": "atATYj00", "values": ["0CXpqT4K", "TP6I3JaG", "GMDW1VHz"]}, {"anyOf": 20, "comparison": "isGreaterThan", "name": "K0YPQMP1", "predicateType": "SeasonPassPredicate", "value": "lO4ffgNK", "values": ["bPuaCdmB", "UjGV2BDD", "uQyVzqrY"]}, {"anyOf": 75, "comparison": "excludes", "name": "LoccOqrZ", "predicateType": "SeasonTierPredicate", "value": "elRFV0qE", "values": ["eDFYE84L", "Xfv6yZjT", "ykK3VRgR"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 111 'UpdateItemPurchaseCondition' test.out

#- 112 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'OoGXt16U' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "7kjWi9Qo"}' \
    > test.out 2>&1
eval_tap $? 112 'ReturnItem' test.out

#- 113 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --name '13wzSMZw' \
    --offset '41' \
    --tag 'zy0x3lXn' \
    > test.out 2>&1
eval_tap $? 113 'QueryKeyGroups' test.out

#- 114 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "u220FmRW", "name": "X3AXoHUw", "status": "INACTIVE", "tags": ["Zr6alBbk", "mBTbVNwt", "RPf1PnOo"]}' \
    > test.out 2>&1
eval_tap $? 114 'CreateKeyGroup' test.out

#- 115 GetKeyGroupByBoothName
eval_tap 0 115 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 116 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'ModXeE7p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetKeyGroup' test.out

#- 117 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'O1E1Gbpm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZvbptoHf", "name": "VyMMyBLm", "status": "INACTIVE", "tags": ["92Gpzo4M", "kW0iGtQZ", "JO6wBp3S"]}' \
    > test.out 2>&1
eval_tap $? 117 'UpdateKeyGroup' test.out

#- 118 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'ualBxeb2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetKeyGroupDynamic' test.out

#- 119 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'tOk8SRWW' \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '32' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 119 'ListKeys' test.out

#- 120 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'KrPQ8pCW' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 120 'UploadKeys' test.out

#- 121 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'DY2LQ14d' \
    --limit '64' \
    --offset '65' \
    --orderNos '84kgmOu4,gIaYQesX,6aa2aJBZ' \
    --sortBy 'Zr8dglet' \
    --startTime 'V50dUpdu' \
    --status 'FULFILL_FAILED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 121 'QueryOrders' test.out

#- 122 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 122 'GetOrderStatistics' test.out

#- 123 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'L4Vrv5Ss' \
    > test.out 2>&1
eval_tap $? 123 'GetOrder' test.out

#- 124 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'O0PlT944' \
    --body '{"description": "xyABS7Dt"}' \
    > test.out 2>&1
eval_tap $? 124 'RefundOrder' test.out

#- 125 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 125 'GetPaymentCallbackConfig' test.out

#- 126 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "2FTmVxbe", "privateKey": "2Em1m50v"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdatePaymentCallbackConfig' test.out

#- 127 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'QsR2tvBW' \
    --externalId 'wb64OKRZ' \
    --limit '80' \
    --notificationSource 'CHECKOUT' \
    --notificationType '5MQQWhF0' \
    --offset '96' \
    --paymentOrderNo 'RU7MnbiK' \
    --startDate 'cnSmwtS4' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 127 'QueryPaymentNotifications' test.out

#- 128 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'Y6TrUPy7' \
    --limit '32' \
    --offset '15' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 128 'QueryPaymentOrders' test.out

#- 129 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "dAwx7jhO", "currencyNamespace": "CSNhCGuo", "customParameters": {"j9xW9lF4": {}, "20yIvGw5": {}, "trM6pZdA": {}}, "description": "GYvvppU7", "extOrderNo": "s2QKq88b", "extUserId": "FY8EXFMZ", "itemType": "OPTIONBOX", "language": "XRY_fvUF-do", "metadata": {"AsL30Vd2": "phgI1Piv", "JNpPCMS0": "1vJ1cpaF", "VqQ7vnmK": "qa7u5GpU"}, "notifyUrl": "m72XsNQ9", "omitNotification": true, "platform": "yDJY9gL1", "price": 90, "recurringPaymentOrderNo": "Hn5TaJDm", "region": "MnZnIYdz", "returnUrl": "MXq8oTPP", "sandbox": false, "sku": "uONzgvqO", "subscriptionId": "0t5xFRQl", "targetNamespace": "ZUnuXMgF", "targetUserId": "mzW1Ac2E", "title": "VgbrgNaU"}' \
    > test.out 2>&1
eval_tap $? 129 'CreatePaymentOrderByDedicated' test.out

#- 130 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '2PXJuP3f' \
    > test.out 2>&1
eval_tap $? 130 'ListExtOrderNoByExtTxId' test.out

#- 131 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HCIWycZX' \
    > test.out 2>&1
eval_tap $? 131 'GetPaymentOrder' test.out

#- 132 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vb1V5laP' \
    --body '{"extTxId": "ey5PRa4p", "paymentMethod": "e2Qt9roN", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 132 'ChargePaymentOrder' test.out

#- 133 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SSx56LfJ' \
    --body '{"description": "GUcsErnm"}' \
    > test.out 2>&1
eval_tap $? 133 'RefundPaymentOrderByDedicated' test.out

#- 134 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Z6uqnf8x' \
    --body '{"amount": 76, "currencyCode": "bZOSvA1A", "notifyType": "REFUND", "paymentProvider": "WXPAY", "salesTax": 61, "vat": 17}' \
    > test.out 2>&1
eval_tap $? 134 'SimulatePaymentOrderNotification' test.out

#- 135 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Hsb30jz1' \
    > test.out 2>&1
eval_tap $? 135 'GetPaymentOrderChargeStatus' test.out

#- 136 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 136 'GetPlatformWalletConfig' test.out

#- 137 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Steam", "Other", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdatePlatformWalletConfig' test.out

#- 138 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 138 'ResetPlatformWalletConfig' test.out

#- 139 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "5YOgyxPL", "eventTopic": "tmyVfdZR", "maxAwarded": 37, "maxAwardedPerUser": 35, "namespaceExpression": "mBRcI1gP", "rewardCode": "yxv2wyGI", "rewardConditions": [{"condition": "4A21u2QK", "conditionName": "pC8xl5SY", "eventName": "VXgc8Xff", "rewardItems": [{"duration": 88, "itemId": "k0myybRQ", "quantity": 89}, {"duration": 16, "itemId": "ZK5MAzLD", "quantity": 47}, {"duration": 79, "itemId": "TXf2fZMW", "quantity": 63}]}, {"condition": "vWR9af1U", "conditionName": "HSKsAvBk", "eventName": "bw35QA3A", "rewardItems": [{"duration": 55, "itemId": "GvSUNyer", "quantity": 78}, {"duration": 35, "itemId": "ipCmCb6j", "quantity": 88}, {"duration": 79, "itemId": "sZer2OXk", "quantity": 37}]}, {"condition": "TmaVaf7f", "conditionName": "w8T0Gklu", "eventName": "aSiN93t4", "rewardItems": [{"duration": 44, "itemId": "ZGDfGoXO", "quantity": 70}, {"duration": 21, "itemId": "rljrcHrj", "quantity": 55}, {"duration": 73, "itemId": "E1DV9GTI", "quantity": 42}]}], "userIdExpression": "igtY0oUW"}' \
    > test.out 2>&1
eval_tap $? 139 'CreateReward' test.out

#- 140 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'TTrpPQIK' \
    --limit '42' \
    --offset '92' \
    --sortBy 'namespace:desc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 140 'QueryRewards' test.out

#- 141 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'ExportRewards' test.out

#- 142 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 142 'ImportRewards' test.out

#- 143 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'K6fI9HEi' \
    > test.out 2>&1
eval_tap $? 143 'GetReward' test.out

#- 144 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RncGRB2V' \
    --body '{"description": "asML2n11", "eventTopic": "haThdOpJ", "maxAwarded": 71, "maxAwardedPerUser": 19, "namespaceExpression": "zEAccYZk", "rewardCode": "470jWRRt", "rewardConditions": [{"condition": "lzhuruZX", "conditionName": "CtfrswJ9", "eventName": "mY3XvFeR", "rewardItems": [{"duration": 28, "itemId": "NzRqGMik", "quantity": 61}, {"duration": 31, "itemId": "JeQ8fnEh", "quantity": 99}, {"duration": 14, "itemId": "VGp0a4L5", "quantity": 69}]}, {"condition": "LUHdZayX", "conditionName": "Ca5po0Yk", "eventName": "OgLU0dtO", "rewardItems": [{"duration": 23, "itemId": "ZZ8VQUKZ", "quantity": 13}, {"duration": 87, "itemId": "2twF93VF", "quantity": 47}, {"duration": 70, "itemId": "QxR6OJTU", "quantity": 41}]}, {"condition": "Owqr4i6B", "conditionName": "rKadbHWF", "eventName": "HeUV22Gk", "rewardItems": [{"duration": 64, "itemId": "lAdb0wGZ", "quantity": 77}, {"duration": 78, "itemId": "hypdU0st", "quantity": 19}, {"duration": 52, "itemId": "1mD8A9L5", "quantity": 48}]}], "userIdExpression": "L7KdpgBX"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateReward' test.out

#- 145 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'PTZPejKS' \
    > test.out 2>&1
eval_tap $? 145 'DeleteReward' test.out

#- 146 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'AWV3nkch' \
    --body '{"payload": {"GVW6LZ5E": {}, "Bo8hGpFo": {}, "WITfTqdO": {}}}' \
    > test.out 2>&1
eval_tap $? 146 'CheckEventCondition' test.out

#- 147 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'euPbWpUE' \
    --body '{"conditionName": "YXBDqfqv", "userId": "HQ4ZNSJk"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteRewardConditionRecord' test.out

#- 148 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'jN4BrCZ3' \
    --limit '66' \
    --offset '85' \
    --start 'HL8uNEI7' \
    --storeId '1qp0GWqU' \
    --viewId 'YFUgoAj6' \
    > test.out 2>&1
eval_tap $? 148 'QuerySections' test.out

#- 149 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JfwaPELo' \
    --body '{"active": false, "displayOrder": 91, "endDate": "1971-02-19T00:00:00Z", "ext": {"wNZQMQmk": {}, "vrvXTco9": {}, "bQ7tuJN8": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 93, "itemCount": 35, "rule": "SEQUENCE"}, "items": [{"id": "uFTGPsHG", "sku": "EJN9QHSE"}, {"id": "YJUPZcaE", "sku": "bJyvvAXl"}, {"id": "EsMWebRL", "sku": "bJ4DiGUQ"}], "localizations": {"05bXUGEs": {"description": "zJFi3BHm", "localExt": {"Qrf5Bj9S": {}, "PeIsXc76": {}, "hT5uhoD5": {}}, "longDescription": "xtdp2Kp8", "title": "TEJ7Kz4V"}, "TaFUzcal": {"description": "bDOfv6Ia", "localExt": {"4f1pukgK": {}, "fUCOWV0e": {}, "HhEb2iP5": {}}, "longDescription": "JB4SQ7VO", "title": "xtOsjBfs"}, "n5UHqMuk": {"description": "BCeVhXW2", "localExt": {"5L1o8pxx": {}, "Yp5h8z01": {}, "3YjFIV0L": {}}, "longDescription": "8dP5setP", "title": "gfg2pSC0"}}, "name": "VUIp2WZN", "rotationType": "CUSTOM", "startDate": "1993-12-10T00:00:00Z", "viewId": "MoihosUo"}' \
    > test.out 2>&1
eval_tap $? 149 'CreateSection' test.out

#- 150 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cVcuRaK7' \
    > test.out 2>&1
eval_tap $? 150 'PurgeExpiredSection' test.out

#- 151 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'Q48WkJkz' \
    --storeId 'O0uw3HNo' \
    > test.out 2>&1
eval_tap $? 151 'GetSection' test.out

#- 152 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'P68BePwT' \
    --storeId 'l49qYGoW' \
    --body '{"active": false, "displayOrder": 83, "endDate": "1989-09-12T00:00:00Z", "ext": {"yFxSDbzk": {}, "GBxXc3PU": {}, "t9k6WnY4": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 67, "itemCount": 94, "rule": "SEQUENCE"}, "items": [{"id": "YtIEionC", "sku": "TKg378jA"}, {"id": "pOMHnCSn", "sku": "bCPtfpKB"}, {"id": "SyVdJ3j9", "sku": "Hdq7yjFU"}], "localizations": {"6nNoxi0K": {"description": "BUU9MAHK", "localExt": {"x6QlgjSC": {}, "vx4Ww8Kd": {}, "78XIjNXn": {}}, "longDescription": "1LXwtm7Y", "title": "nvDyqgqR"}, "uxSnbSMM": {"description": "qhU531Qy", "localExt": {"DL0KMBs1": {}, "CwqO8yFR": {}, "SJmUv90a": {}}, "longDescription": "oCoG2L29", "title": "JVj2qEPC"}, "OkUeobnG": {"description": "tnVgVY9I", "localExt": {"4gXOopgW": {}, "oGt47Qkg": {}, "ySAzwAsX": {}}, "longDescription": "WpXKgSy0", "title": "IE9chyYT"}}, "name": "GoRlVfiK", "rotationType": "NONE", "startDate": "1971-10-06T00:00:00Z", "viewId": "huwRldGe"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSection' test.out

#- 153 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'jDQKCb9o' \
    --storeId 'jz2cFhPM' \
    > test.out 2>&1
eval_tap $? 153 'DeleteSection' test.out

#- 154 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'ListStores' test.out

#- 155 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "LJsFFA8b", "defaultRegion": "3WTyikku", "description": "lfslUKv1", "supportedLanguages": ["bnlUGI3k", "PIT763E1", "FGJDNmHy"], "supportedRegions": ["kd2EfTaA", "JSMsayA7", "Y443LOVS"], "title": "ncG6UivI"}' \
    > test.out 2>&1
eval_tap $? 155 'CreateStore' test.out

#- 156 ImportStore
eval_tap 0 156 'ImportStore # SKIP deprecated' test.out

#- 157 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetPublishedStore' test.out

#- 158 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 158 'DeletePublishedStore' test.out

#- 159 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetPublishedStoreBackup' test.out

#- 160 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 160 'RollbackPublishedStore' test.out

#- 161 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dLlLb0Wj' \
    > test.out 2>&1
eval_tap $? 161 'GetStore' test.out

#- 162 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ub2aRJte' \
    --body '{"defaultLanguage": "VRAwAAsc", "defaultRegion": "tFOJYkwZ", "description": "KyEbHc4X", "supportedLanguages": ["ZN4IubWy", "oRGW5Jus", "uS5N9hbV"], "supportedRegions": ["w8t8TAZ4", "E5o33CeR", "gpWrk9bP"], "title": "dWPCgHZm"}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateStore' test.out

#- 163 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '5zbwkC8T' \
    > test.out 2>&1
eval_tap $? 163 'DeleteStore' test.out

#- 164 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eYuLfdtO' \
    --action 'CREATE' \
    --itemSku 'lFRZ8n3a' \
    --itemType 'BUNDLE' \
    --limit '85' \
    --offset '51' \
    --selected  \
    --sortBy 'createdAt,updatedAt,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'ITEM' \
    --updatedAtEnd 'GdgIt3Pp' \
    --updatedAtStart 'lgosc9xz' \
    > test.out 2>&1
eval_tap $? 164 'QueryChanges' test.out

#- 165 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '4TmvWSBF' \
    > test.out 2>&1
eval_tap $? 165 'PublishAll' test.out

#- 166 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C8wtmU6z' \
    > test.out 2>&1
eval_tap $? 166 'PublishSelected' test.out

#- 167 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bbSnWess' \
    > test.out 2>&1
eval_tap $? 167 'SelectAllRecords' test.out

#- 168 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hZubzozz' \
    --action 'DELETE' \
    --itemSku 'rGEWjJh5' \
    --itemType 'COINS' \
    --type 'STORE' \
    --updatedAtEnd '0LS7O0pZ' \
    --updatedAtStart '7mLynKVD' \
    > test.out 2>&1
eval_tap $? 168 'GetStatistic' test.out

#- 169 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GCR2WY8E' \
    > test.out 2>&1
eval_tap $? 169 'UnselectAllRecords' test.out

#- 170 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'ZKyWGBT9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IH8khXQ3' \
    > test.out 2>&1
eval_tap $? 170 'SelectRecord' test.out

#- 171 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'QP3Mkpyq' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cpyF3XY5' \
    > test.out 2>&1
eval_tap $? 171 'UnselectRecord' test.out

#- 172 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '1kDSBQlt' \
    --targetStoreId 'lgw23qsG' \
    > test.out 2>&1
eval_tap $? 172 'CloneStore' test.out

#- 173 ExportStore
eval_tap 0 173 'ExportStore # SKIP deprecated' test.out

#- 174 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId 'outtoFqx' \
    --limit '45' \
    --offset '17' \
    --sku 'gy6hlXPl' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId 'bVuX2NQc' \
    > test.out 2>&1
eval_tap $? 174 'QuerySubscriptions' test.out

#- 175 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yABg1JqU' \
    > test.out 2>&1
eval_tap $? 175 'RecurringChargeSubscription' test.out

#- 176 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'eHpmDu9u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'GetTicketDynamic' test.out

#- 177 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'EPdO0kY6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "vtxWF3NQ"}' \
    > test.out 2>&1
eval_tap $? 177 'DecreaseTicketSale' test.out

#- 178 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'Kyeh6k9G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetTicketBoothID' test.out

#- 179 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'ZytSdkfa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 47, "orderNo": "f9lVCmB5"}' \
    > test.out 2>&1
eval_tap $? 179 'IncreaseTicketSale' test.out

#- 180 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'M6O1M4xF' \
    --body '{"achievements": [{"id": "DjjrHPO1", "value": 51}, {"id": "AU9omD4R", "value": 47}, {"id": "lnJTZFkZ", "value": 2}], "steamUserId": "wEAL61yQ"}' \
    > test.out 2>&1
eval_tap $? 180 'UnlockSteamUserAchievement' test.out

#- 181 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jlfXveC8' \
    --xboxUserId '1ZDX1Cfe' \
    > test.out 2>&1
eval_tap $? 181 'GetXblUserAchievements' test.out

#- 182 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'gdXVmbgW' \
    --body '{"achievements": [{"id": "0MpsmsHG", "percentComplete": 24}, {"id": "g5fHUxur", "percentComplete": 78}, {"id": "s0F3yeew", "percentComplete": 77}], "serviceConfigId": "IGInVLJe", "titleId": "jzfkLTzr", "xboxUserId": "T643y9yG"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateXblUserAchievement' test.out

#- 183 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'dqJgHTxg' \
    > test.out 2>&1
eval_tap $? 183 'AnonymizeCampaign' test.out

#- 184 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJl09aQR' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeEntitlement' test.out

#- 185 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'yBzU4xZi' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeFulfillment' test.out

#- 186 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'GqSz3QYv' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeIntegration' test.out

#- 187 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'AW9Cokeg' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeOrder' test.out

#- 188 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'VUwNpJpL' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizePayment' test.out

#- 189 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'arrNTGOd' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizeSubscription' test.out

#- 190 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'sqP6CH4g' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeWallet' test.out

#- 191 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'MJZHtQrz' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 191 'GetUserDLC' test.out

#- 192 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jn6CopLU' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName '3suDxprx' \
    --features 'otUrXqNn,3UK9o98E,N3oDBLRd' \
    --itemId 'vzK38D3p,Sv4PFCGh,FRFOXip8' \
    --limit '16' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 192 'QueryUserEntitlements' test.out

#- 193 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'GUCWJgLq' \
    --body '[{"endDate": "1978-11-23T00:00:00Z", "grantedCode": "0jwOUIsR", "itemId": "d5NpDmve", "itemNamespace": "IWzjAm3b", "language": "mars_xr", "quantity": 52, "region": "VpVZLOA4", "source": "REWARD", "startDate": "1992-06-01T00:00:00Z", "storeId": "OF7YbA16"}, {"endDate": "1978-02-11T00:00:00Z", "grantedCode": "pxC3RhU0", "itemId": "tg3pugeH", "itemNamespace": "HWCfBMEc", "language": "sVf_RnfB", "quantity": 41, "region": "aumGIkDw", "source": "PURCHASE", "startDate": "1998-07-29T00:00:00Z", "storeId": "AEGqrIdA"}, {"endDate": "1991-12-04T00:00:00Z", "grantedCode": "4tx8MEeg", "itemId": "mTQGvmYt", "itemNamespace": "E0VcWdA6", "language": "kjXr-fZEz", "quantity": 84, "region": "vDWuIRo3", "source": "REDEEM_CODE", "startDate": "1974-01-28T00:00:00Z", "storeId": "RHbcUEpt"}]' \
    > test.out 2>&1
eval_tap $? 193 'GrantUserEntitlement' test.out

#- 194 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'u9nJz2a4' \
    --activeOnly  \
    --appId 'dYvcMuXr' \
    > test.out 2>&1
eval_tap $? 194 'GetUserAppEntitlementByAppId' test.out

#- 195 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'hCGneqQf' \
    --activeOnly  \
    --limit '45' \
    --offset '48' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 195 'QueryUserEntitlementsByAppType' test.out

#- 196 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'o4yuguC3' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'q5lpe3AJ' \
    > test.out 2>&1
eval_tap $? 196 'GetUserEntitlementByItemId' test.out

#- 197 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'vW7LxhTb' \
    --ids '6ehmlj1g,euJCKc7A,HWkGvGji' \
    > test.out 2>&1
eval_tap $? 197 'GetUserActiveEntitlementsByItemIds' test.out

#- 198 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'PT0yaQlv' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku '6fpt22MI' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementBySku' test.out

#- 199 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'TcSUEcnC' \
    --appIds 'DGa9KSku,gcw4P6wK,Bqh0gruU' \
    --itemIds 'BwN1sWPx,GrRC3Jkw,1xInUrGN' \
    --skus 'PmUjRQwB,wHUH1yMi,9gGRAgaA' \
    > test.out 2>&1
eval_tap $? 199 'ExistsAnyUserActiveEntitlement' test.out

#- 200 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '7TxKYb57' \
    --itemIds 'uY0doXoi,EosGQ4OP,qBFu0PfH' \
    > test.out 2>&1
eval_tap $? 200 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 201 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xa5bFsNO' \
    --appId 'yy6jgKWG' \
    > test.out 2>&1
eval_tap $? 201 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 202 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'M42IDiSm' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'K0VOTDr7' \
    > test.out 2>&1
eval_tap $? 202 'GetUserEntitlementOwnershipByItemId' test.out

#- 203 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mPTjDgiG' \
    --ids 'AwJDXaGK,krR1Ru70,Nmaaysy9' \
    > test.out 2>&1
eval_tap $? 203 'GetUserEntitlementOwnershipByItemIds' test.out

#- 204 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'QFbwIQph' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'S1l3GbkV' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipBySku' test.out

#- 205 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rO5p6hFP' \
    --entitlementIds 'N5dqVSgv' \
    > test.out 2>&1
eval_tap $? 205 'RevokeUserEntitlements' test.out

#- 206 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'zeiUN6hV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYGg2Wsx' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlement' test.out

#- 207 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'sxU2Os8l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GyWAFGrV' \
    --body '{"endDate": "1984-06-04T00:00:00Z", "nullFieldList": ["J5hHpZSw", "jU4LtTP9", "0f2rUT97"], "startDate": "1986-08-26T00:00:00Z", "status": "CONSUMED", "useCount": 90}' \
    > test.out 2>&1
eval_tap $? 207 'UpdateUserEntitlement' test.out

#- 208 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'KelLYKhh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sRQJTzKP' \
    --body '{"options": ["6PXOZJXw", "w8RrpmLb", "pgYt8SAW"], "requestId": "5WeUiV5r", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 208 'ConsumeUserEntitlement' test.out

#- 209 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'VRQvpazO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'q4fz7qMi' \
    > test.out 2>&1
eval_tap $? 209 'DisableUserEntitlement' test.out

#- 210 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'YfS9MLUR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0RQNmE5' \
    > test.out 2>&1
eval_tap $? 210 'EnableUserEntitlement' test.out

#- 211 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'xiPEzw4G' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTAD5YIV' \
    > test.out 2>&1
eval_tap $? 211 'GetUserEntitlementHistories' test.out

#- 212 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'RyoNueEr' \
    --namespace "$AB_NAMESPACE" \
    --userId '3etM4ho4' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserEntitlement' test.out

#- 213 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hHewtuOm' \
    --body '{"duration": 75, "endDate": "1994-06-15T00:00:00Z", "itemId": "KdmmkPBW", "itemSku": "po9Kk5Ut", "language": "tKFtBlU5", "order": {"currency": {"currencyCode": "bQ1z2MTy", "currencySymbol": "F4D0U4gk", "currencyType": "REAL", "decimals": 15, "namespace": "TynS3Soy"}, "ext": {"21nbMaTE": {}, "dRbgPK2B": {}, "HK1A7JRe": {}}, "free": true}, "orderNo": "Qgibre9I", "origin": "Stadia", "quantity": 74, "region": "UlIdmel0", "source": "GIFT", "startDate": "1998-08-28T00:00:00Z", "storeId": "Q3nz3IkR"}' \
    > test.out 2>&1
eval_tap $? 213 'FulfillItem' test.out

#- 214 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'VsSxnDX1' \
    --body '{"code": "4q13JqRz", "language": "xZc-CukQ", "region": "XgnZ9oPu"}' \
    > test.out 2>&1
eval_tap $? 214 'RedeemCode' test.out

#- 215 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'fIoxZbqe' \
    --body '{"origin": "IOS", "rewards": [{"currency": {"currencyCode": "VM4kb44M", "namespace": "IUI5XaSB"}, "item": {"itemId": "ltRV9va0", "itemSku": "LdKucLP7", "itemType": "8dQfLv0F"}, "quantity": 36, "type": "CURRENCY"}, {"currency": {"currencyCode": "cMxqT1MP", "namespace": "y4Ghjj2P"}, "item": {"itemId": "zXqOYUuP", "itemSku": "cN7WFknQ", "itemType": "4ax83X6w"}, "quantity": 36, "type": "ITEM"}, {"currency": {"currencyCode": "vUjpqCQr", "namespace": "ZwHMUbr0"}, "item": {"itemId": "aYuF9Gww", "itemSku": "7P1CIV0W", "itemType": "8o3hpIDQ"}, "quantity": 35, "type": "CURRENCY"}], "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillRewards' test.out

#- 216 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'HEIOImSL' \
    --endTime 'iWcZkmcs' \
    --limit '56' \
    --offset '64' \
    --productId 's1bgoSeI' \
    --startTime '9mIKeisV' \
    --status 'VERIFIED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 216 'QueryUserIAPOrders' test.out

#- 217 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'pepdBw1S' \
    > test.out 2>&1
eval_tap $? 217 'QueryAllUserIAPOrders' test.out

#- 218 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BpnRsaDC' \
    --endTime 'tACxyrUp' \
    --limit '30' \
    --offset '4' \
    --startTime 'NnF9WGPh' \
    --status 'FAIL' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPConsumeHistory' test.out

#- 219 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '9ksy06MR' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "szH_VfAB", "productId": "FJyXSTjh", "region": "MqQ4Qnak", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 219 'MockFulfillIAPItem' test.out

#- 220 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQ1U2w2L' \
    --itemId 'ccpyaIKT' \
    --limit '21' \
    --offset '38' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserOrders' test.out

#- 221 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZJICeahb' \
    --body '{"currencyCode": "lGU3IaKi", "currencyNamespace": "t66zZ1jM", "discountedPrice": 16, "ext": {"1MnwSGOW": {}, "8DSvxzCz": {}, "XWxRRCEY": {}}, "itemId": "wDObPEhV", "language": "gJww0oo6", "options": {"skipPriceValidation": false}, "platform": "Epic", "price": 46, "quantity": 71, "region": "g7Vti6tk", "returnUrl": "fRkgUAiu", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 221 'AdminCreateUserOrder' test.out

#- 222 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bmXHWlAS' \
    --itemId '1wi8eSwh' \
    > test.out 2>&1
eval_tap $? 222 'CountOfPurchasedItem' test.out

#- 223 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZBl50QjV' \
    --userId 'ntsElN41' \
    > test.out 2>&1
eval_tap $? 223 'GetUserOrder' test.out

#- 224 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RsgMP4Hz' \
    --userId '1oX4UbKp' \
    --body '{"status": "CHARGEBACK", "statusReason": "Z9r5HFUR"}' \
    > test.out 2>&1
eval_tap $? 224 'UpdateUserOrderStatus' test.out

#- 225 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1B2ODVe0' \
    --userId 'qhpXJDqI' \
    > test.out 2>&1
eval_tap $? 225 'FulfillUserOrder' test.out

#- 226 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Urx2vRTz' \
    --userId 'LfrkOThn' \
    > test.out 2>&1
eval_tap $? 226 'GetUserOrderGrant' test.out

#- 227 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ePWwj973' \
    --userId 'C0KOlYKO' \
    > test.out 2>&1
eval_tap $? 227 'GetUserOrderHistories' test.out

#- 228 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'MejZDeci' \
    --userId 'BbWwHkC9' \
    --body '{"additionalData": {"cardSummary": "UNWeFnpv"}, "authorisedTime": "1993-10-07T00:00:00Z", "chargebackReversedTime": "1993-10-31T00:00:00Z", "chargebackTime": "1973-05-15T00:00:00Z", "chargedTime": "1980-09-29T00:00:00Z", "createdTime": "1999-05-20T00:00:00Z", "currency": {"currencyCode": "AmtuX96E", "currencySymbol": "9Uj37NLe", "currencyType": "VIRTUAL", "decimals": 83, "namespace": "POlhGRNE"}, "customParameters": {"05c19Vz7": {}, "kZwdCVoL": {}, "5S5otOEt": {}}, "extOrderNo": "jc8aDzMK", "extTxId": "h1SXOxGP", "extUserId": "NkThybIz", "issuedAt": "1999-06-23T00:00:00Z", "metadata": {"r5TyYDsE": "vDHSAME5", "RnNzqkCs": "lPFlhzqA", "tDF0Pw5d": "YWHW80R5"}, "namespace": "FC3FpGBv", "nonceStr": "l0Sm3unm", "paymentMethod": "0wbdSrKW", "paymentMethodFee": 22, "paymentOrderNo": "a7zbU02r", "paymentProvider": "ADYEN", "paymentProviderFee": 16, "paymentStationUrl": "9fUyFApw", "price": 25, "refundedTime": "1989-02-23T00:00:00Z", "salesTax": 55, "sandbox": true, "sku": "RrbNsyeG", "status": "AUTHORISE_FAILED", "statusReason": "pDMUlw3c", "subscriptionId": "XsdBwBT1", "subtotalPrice": 6, "targetNamespace": "wdWTy0h7", "targetUserId": "ZCwusPkr", "tax": 51, "totalPrice": 10, "totalTax": 57, "txEndTime": "1982-12-26T00:00:00Z", "type": "uATTXdMD", "userId": "OhFFr3V1", "vat": 71}' \
    > test.out 2>&1
eval_tap $? 228 'ProcessUserOrderNotification' test.out

#- 229 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2k4dxbjt' \
    --userId '6P20T6ky' \
    > test.out 2>&1
eval_tap $? 229 'DownloadUserOrderReceipt' test.out

#- 230 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9y7ZyWM' \
    --body '{"currencyCode": "8TVCAeCe", "currencyNamespace": "EOzfLnkD", "customParameters": {"98n95BUK": {}, "gkPm8rGQ": {}, "72Ag2TCc": {}}, "description": "rFtnPGYs", "extOrderNo": "3ydqJWuq", "extUserId": "EdRrERlL", "itemType": "BUNDLE", "language": "sQu", "metadata": {"w6L7rMPw": "ncBlOyaq", "M8buHZFc": "LZx6zsmP", "lATrL1r9": "rACuTDNe"}, "notifyUrl": "26o9mAaQ", "omitNotification": false, "platform": "6sJ0tYsU", "price": 23, "recurringPaymentOrderNo": "Wje4QDTl", "region": "tovrTsUP", "returnUrl": "pjRVvWAm", "sandbox": false, "sku": "yPD2vzYz", "subscriptionId": "pxRmgab5", "title": "wySWG9k2"}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserPaymentOrder' test.out

#- 231 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PdePeyOQ' \
    --userId 'qhpndCgk' \
    --body '{"description": "2RYpLwcZ"}' \
    > test.out 2>&1
eval_tap $? 231 'RefundUserPaymentOrder' test.out

#- 232 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'LDSvkpua' \
    --body '{"code": "nNA7yWWn", "orderNo": "Ya6Vmu6n"}' \
    > test.out 2>&1
eval_tap $? 232 'ApplyUserRedemption' test.out

#- 233 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '0bHXJiUT' \
    --chargeStatus 'CHARGED' \
    --itemId 'LcayzR70' \
    --limit '27' \
    --offset '43' \
    --sku 'jl2mNwo6' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserSubscriptions' test.out

#- 234 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'aJK6UkvE' \
    --excludeSystem  \
    --limit '55' \
    --offset '60' \
    --subscriptionId 'AKzXKY4r' \
    > test.out 2>&1
eval_tap $? 234 'GetUserSubscriptionActivities' test.out

#- 235 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'fq3lEYc5' \
    --body '{"grantDays": 26, "itemId": "EsnwpT7K", "language": "a3igKZrx", "reason": "YinQNAgS", "region": "OJgFR5Ry", "source": "7RfC3JiO"}' \
    > test.out 2>&1
eval_tap $? 235 'PlatformSubscribeSubscription' test.out

#- 236 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'K6tSQoFm' \
    --itemId 'hLAgH8OD' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 237 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'msa3Uozb' \
    --userId 'fv2oTTBO' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscription' test.out

#- 238 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'iSHL7eGg' \
    --userId 'CGiZHTYG' \
    > test.out 2>&1
eval_tap $? 238 'DeleteUserSubscription' test.out

#- 239 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'wQz5iKHr' \
    --userId 'pnCML42r' \
    --force  \
    --body '{"immediate": true, "reason": "Zza65yRx"}' \
    > test.out 2>&1
eval_tap $? 239 'CancelSubscription' test.out

#- 240 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1Y55fl81' \
    --userId '5O6OX79N' \
    --body '{"grantDays": 69, "reason": "uqajavBm"}' \
    > test.out 2>&1
eval_tap $? 240 'GrantDaysToSubscription' test.out

#- 241 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rMlArpFo' \
    --userId 'XtTXuDak' \
    --excludeFree  \
    --limit '50' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 241 'GetUserSubscriptionBillingHistories' test.out

#- 242 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dghicgMR' \
    --userId 'LeFhWChy' \
    --body '{"additionalData": {"cardSummary": "gFrSnH9f"}, "authorisedTime": "1996-06-29T00:00:00Z", "chargebackReversedTime": "1974-11-27T00:00:00Z", "chargebackTime": "1984-05-26T00:00:00Z", "chargedTime": "1987-12-29T00:00:00Z", "createdTime": "1994-05-22T00:00:00Z", "currency": {"currencyCode": "So1N4ld6", "currencySymbol": "hX6y9HNc", "currencyType": "VIRTUAL", "decimals": 73, "namespace": "ZdXiK5bE"}, "customParameters": {"EPQPqy0k": {}, "XmLH25vY": {}, "xUYh4cRr": {}}, "extOrderNo": "IE3qBPH0", "extTxId": "pzCSYCXO", "extUserId": "6j2eXVJi", "issuedAt": "1999-09-12T00:00:00Z", "metadata": {"vMfOPBdO": "iPHfRlQw", "CrwImGzT": "3HUj1Hd3", "B2PmAyLx": "NbVp8DZx"}, "namespace": "nT8sg3GX", "nonceStr": "jtVSY7dW", "paymentMethod": "0TfyxqJ3", "paymentMethodFee": 49, "paymentOrderNo": "siVFpj7i", "paymentProvider": "STRIPE", "paymentProviderFee": 41, "paymentStationUrl": "cQmKThxu", "price": 71, "refundedTime": "1981-06-08T00:00:00Z", "salesTax": 33, "sandbox": true, "sku": "R9QVV9tg", "status": "REFUNDED", "statusReason": "zE0a6EbD", "subscriptionId": "27svacsR", "subtotalPrice": 25, "targetNamespace": "qhyPTDbM", "targetUserId": "LXBKD6qn", "tax": 12, "totalPrice": 77, "totalTax": 14, "txEndTime": "1987-10-01T00:00:00Z", "type": "bmoxjZ1K", "userId": "RGjOh08F", "vat": 99}' \
    > test.out 2>&1
eval_tap $? 242 'ProcessUserSubscriptionNotification' test.out

#- 243 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'eMS6CsxK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ifljhfTv' \
    --body '{"count": 44, "orderNo": "aPWeG9ec"}' \
    > test.out 2>&1
eval_tap $? 243 'AcquireUserTicket' test.out

#- 244 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'bsp1U3Ch' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserCurrencyWallets' test.out

#- 245 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'GedPvr8B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nYUBHMv4' \
    --limit '25' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 245 'ListUserCurrencyTransactions' test.out

#- 246 CheckWallet
eval_tap 0 246 'CheckWallet # SKIP deprecated' test.out

#- 247 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'rAzOXPde' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sfOq0KT0' \
    --body '{"amount": 17, "expireAt": "1993-04-02T00:00:00Z", "origin": "Epic", "reason": "OsvmyNEj", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 247 'CreditUserWallet' test.out

#- 248 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'KswButwB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TWAfyBvc' \
    --body '{"amount": 59, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 248 'PayWithUserWallet' test.out

#- 249 GetUserWallet
eval_tap 0 249 'GetUserWallet # SKIP deprecated' test.out

#- 250 DebitUserWallet
eval_tap 0 250 'DebitUserWallet # SKIP deprecated' test.out

#- 251 DisableUserWallet
eval_tap 0 251 'DisableUserWallet # SKIP deprecated' test.out

#- 252 EnableUserWallet
eval_tap 0 252 'EnableUserWallet # SKIP deprecated' test.out

#- 253 ListUserWalletTransactions
eval_tap 0 253 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 254 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SP1t0LNa' \
    > test.out 2>&1
eval_tap $? 254 'ListViews' test.out

#- 255 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WltRwuqq' \
    --body '{"displayOrder": 74, "localizations": {"xPSZFsK0": {"description": "dNwCxHPe", "localExt": {"F7SwyWmq": {}, "wWXzATwx": {}, "NcIXiQrT": {}}, "longDescription": "RwUFaPWM", "title": "DIaTSSq9"}, "j4NhAbwd": {"description": "5j3kZUq1", "localExt": {"kxGVv7nh": {}, "DlfWTN7H": {}, "0v5niPCr": {}}, "longDescription": "IJfF9YqP", "title": "l45cniPW"}, "HT4iHzLs": {"description": "dtOUMXws", "localExt": {"E7fu7qOR": {}, "1V8A8FwW": {}, "ZVDuxDe2": {}}, "longDescription": "DhptZKoo", "title": "D27Lpztw"}}, "name": "4Mo9KVRp"}' \
    > test.out 2>&1
eval_tap $? 255 'CreateView' test.out

#- 256 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '3vjChNNg' \
    --storeId 'xll4nrhl' \
    > test.out 2>&1
eval_tap $? 256 'GetView' test.out

#- 257 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '3IuZ05nh' \
    --storeId 'U0lhG5Zy' \
    --body '{"displayOrder": 60, "localizations": {"904DU6ov": {"description": "YgNk5sVp", "localExt": {"FfrYB8Dm": {}, "GcKAID2H": {}, "xJELZrS9": {}}, "longDescription": "gBylwtD6", "title": "PpObFGo2"}, "rSKJDCwd": {"description": "vbVmcVeg", "localExt": {"RqGpdCyn": {}, "oUhQdYfT": {}, "8ikQXBfJ": {}}, "longDescription": "LQs9KsHp", "title": "HCEAm71T"}, "aTMoh9wZ": {"description": "VhcbpT5T", "localExt": {"sxWSNL4e": {}, "thPwTzbn": {}, "ckLSPQUm": {}}, "longDescription": "7CoRZiYf", "title": "PlffOsuG"}}, "name": "0vgTLGeT"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateView' test.out

#- 258 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Osie14dp' \
    --storeId 'kBIywgeV' \
    > test.out 2>&1
eval_tap $? 258 'DeleteView' test.out

#- 259 QueryWallets
eval_tap 0 259 'QueryWallets # SKIP deprecated' test.out

#- 260 GetWallet
eval_tap 0 260 'GetWallet # SKIP deprecated' test.out

#- 261 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'jVEfMsGf' \
    --end 'flMrZDpR' \
    --start 'ed9PKJaW' \
    > test.out 2>&1
eval_tap $? 261 'SyncOrders' test.out

#- 262 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["QY1ZD1Tv", "yVSyIb9w", "kgQjnRZ7"], "apiKey": "T2ZMxNDi", "authoriseAsCapture": true, "blockedPaymentMethods": ["XnOPUYyf", "g7TeUAKV", "R4j1uWvT"], "clientKey": "JQpJGKhE", "dropInSettings": "eMwikhSK", "liveEndpointUrlPrefix": "2anagfP3", "merchantAccount": "BoGKiXuq", "notificationHmacKey": "bPJwt0Om", "notificationPassword": "XgDMXtoq", "notificationUsername": "hbvPuFSN", "returnUrl": "3In2wDHo", "settings": "fQmEAV9p"}' \
    > test.out 2>&1
eval_tap $? 262 'TestAdyenConfig' test.out

#- 263 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "iPbSrLKO", "privateKey": "cPz0cUcn", "publicKey": "uq9xFFBj", "returnUrl": "McH6DIYj"}' \
    > test.out 2>&1
eval_tap $? 263 'TestAliPayConfig' test.out

#- 264 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "QqeLwhZX", "secretKey": "miWZKKAw"}' \
    > test.out 2>&1
eval_tap $? 264 'TestCheckoutConfig' test.out

#- 265 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Kib11x4Q' \
    > test.out 2>&1
eval_tap $? 265 'DebugMatchedPaymentMerchantConfig' test.out

#- 266 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "ezao91F8", "clientSecret": "8nWHQANs", "returnUrl": "Cuh4HZZT", "webHookId": "dpRs51Da"}' \
    > test.out 2>&1
eval_tap $? 266 'TestPayPalConfig' test.out

#- 267 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["QAxm8NDz", "yV3qOlHi", "rLDCHWHS"], "publishableKey": "mJA4vANJ", "secretKey": "hbBUMYMu", "webhookSecret": "WT3jU1Zh"}' \
    > test.out 2>&1
eval_tap $? 267 'TestStripeConfig' test.out

#- 268 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "2Jvuri2b", "key": "RMv7G4ex", "mchid": "ufu5fsQ9", "returnUrl": "bIKeAb6l"}' \
    > test.out 2>&1
eval_tap $? 268 'TestWxPayConfig' test.out

#- 269 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "JaNbP816", "flowCompletionUrl": "mKWla7Uo", "merchantId": 83, "projectId": 31, "projectSecretKey": "Bq96iiUO"}' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfig' test.out

#- 270 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'QrDsUJkQ' \
    > test.out 2>&1
eval_tap $? 270 'GetPaymentMerchantConfig' test.out

#- 271 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'lOryBdoc' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Fx2goZB8", "9IVeWBWk", "QKiQQiAS"], "apiKey": "39Uvn6qK", "authoriseAsCapture": true, "blockedPaymentMethods": ["cHGcxwZk", "iUqhM9kh", "XelOSBx2"], "clientKey": "CQzWl1wK", "dropInSettings": "oySqwiY0", "liveEndpointUrlPrefix": "FqoOiBWt", "merchantAccount": "MhFrSDOA", "notificationHmacKey": "gpS2t4wZ", "notificationPassword": "zBnjoHnV", "notificationUsername": "JZkf63ej", "returnUrl": "PAGTlCUV", "settings": "P50iTN5P"}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateAdyenConfig' test.out

#- 272 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '1LkUdyPl' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 272 'TestAdyenConfigById' test.out

#- 273 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'JXtixe9y' \
    --sandbox  \
    --validate  \
    --body '{"appId": "RG9lKHZP", "privateKey": "g07qhphy", "publicKey": "tM6DjGNO", "returnUrl": "In8VRxUF"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateAliPayConfig' test.out

#- 274 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'w0Lfkz42' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 274 'TestAliPayConfigById' test.out

#- 275 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'WRT9mTeC' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "yXdMQ9Nm", "secretKey": "x4yf4ZoZ"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateCheckoutConfig' test.out

#- 276 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'XVgG6nBA' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestCheckoutConfigById' test.out

#- 277 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '7Vuv1c6R' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "XufiZJlH", "clientSecret": "WDaxWvWq", "returnUrl": "r1UX5drJ", "webHookId": "nKqG1YJy"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdatePayPalConfig' test.out

#- 278 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'VmrxhEOy' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestPayPalConfigById' test.out

#- 279 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'hYRzLSe5' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["p5WkX5bZ", "KyzxyCDU", "FHf5pTZe"], "publishableKey": "q3KcZqXt", "secretKey": "NmXwwuf7", "webhookSecret": "HDnEgYaG"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateStripeConfig' test.out

#- 280 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'T079j4n3' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestStripeConfigById' test.out

#- 281 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'LCMDxO6z' \
    --validate  \
    --body '{"appId": "mcqsMC8A", "key": "xS4qrbdr", "mchid": "FXuawsf1", "returnUrl": "FuM3Yp1B"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdateWxPayConfig' test.out

#- 282 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '6WKpOdc5' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 282 'UpdateWxPayConfigCert' test.out

#- 283 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'VnEk2WWT' \
    > test.out 2>&1
eval_tap $? 283 'TestWxPayConfigById' test.out

#- 284 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'x5Aot5c5' \
    --validate  \
    --body '{"apiKey": "4VnKuMs0", "flowCompletionUrl": "LFhawUmK", "merchantId": 77, "projectId": 52, "projectSecretKey": "cnFSSMYG"}' \
    > test.out 2>&1
eval_tap $? 284 'UpdateXsollaConfig' test.out

#- 285 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'yMYUKtew' \
    > test.out 2>&1
eval_tap $? 285 'TestXsollaConfigById' test.out

#- 286 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '5jOPywqZ' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateXsollaUIConfig' test.out

#- 287 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '50' \
    --namespace "$AB_NAMESPACE" \
    --offset '47' \
    --region 'OFFRRDwL' \
    > test.out 2>&1
eval_tap $? 287 'QueryPaymentProviderConfig' test.out

#- 288 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "3LVwOeME", "region": "hucqcQnC", "sandboxTaxJarApiToken": "zbJx5Dhq", "specials": ["WXPAY", "ALIPAY", "XSOLLA"], "taxJarApiToken": "nZbQN4PB", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 288 'CreatePaymentProviderConfig' test.out

#- 289 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 289 'GetAggregatePaymentProviders' test.out

#- 290 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '6LsfwKa0' \
    > test.out 2>&1
eval_tap $? 290 'DebugMatchedPaymentProviderConfig' test.out

#- 291 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 291 'GetSpecialPaymentProviders' test.out

#- 292 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'WHLOqjPb' \
    --body '{"aggregate": "XSOLLA", "namespace": "RL4ZnWh4", "region": "KdlVjBqz", "sandboxTaxJarApiToken": "lYGrU404", "specials": ["ADYEN", "PAYPAL", "WALLET"], "taxJarApiToken": "gotIzwuG", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 292 'UpdatePaymentProviderConfig' test.out

#- 293 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '0XlbsxaX' \
    > test.out 2>&1
eval_tap $? 293 'DeletePaymentProviderConfig' test.out

#- 294 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 294 'GetPaymentTaxConfig' test.out

#- 295 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "cAFeDxHp", "taxJarApiToken": "3rkqPhTz", "taxJarEnabled": false, "taxJarProductCodesMapping": {"Ra9YOqkM": "Xw87Sz7U", "SSPC8Dge": "46H1gKJp", "gVRwaouh": "EBYbFBoC"}}' \
    > test.out 2>&1
eval_tap $? 295 'UpdatePaymentTaxConfig' test.out

#- 296 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'bXpSSpUn' \
    --end 'e68MtyOK' \
    --start 'rUochKEe' \
    > test.out 2>&1
eval_tap $? 296 'SyncPaymentOrders' test.out

#- 297 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'F50pWOuf' \
    --storeId 'TEYn4vcm' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRootCategories' test.out

#- 298 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'aVSzVjd3' \
    --storeId 'zbdlAr5u' \
    > test.out 2>&1
eval_tap $? 298 'DownloadCategories' test.out

#- 299 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'jHHsEYPR' \
    --namespace "$AB_NAMESPACE" \
    --language 'Q3dfEXGl' \
    --storeId 'YEjbbWc6' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetCategory' test.out

#- 300 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'Nu1xP3qM' \
    --namespace "$AB_NAMESPACE" \
    --language 'HSaHEm7C' \
    --storeId 'uaDr22aS' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetChildCategories' test.out

#- 301 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'TthGJDBo' \
    --namespace "$AB_NAMESPACE" \
    --language 'pzmuwEVC' \
    --storeId 'oBtJ2j7V' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetDescendantCategories' test.out

#- 302 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 302 'PublicListCurrencies' test.out

#- 303 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'aFzzvdme' \
    --region 'hkwd1ybT' \
    --storeId 'OGY5sa4N' \
    --appId 'bu5A9I2c' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetItemByAppId' test.out

#- 304 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId '1A7BfYO6' \
    --categoryPath 'wAA3epKD' \
    --features 'yjEl6e0X' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --language 'YG1R8h76' \
    --limit '32' \
    --offset '4' \
    --region 'LmtSBTly' \
    --sortBy 'createdAt:asc,updatedAt:desc,displayOrder:desc' \
    --storeId '173GQeT0' \
    --tags 'unhsVK1L' \
    > test.out 2>&1
eval_tap $? 304 'PublicQueryItems' test.out

#- 305 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'fm063OgU' \
    --region 'N9mM2ceO' \
    --storeId 'VQqPIYyY' \
    --sku '9cvMtKNp' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetItemBySku' test.out

#- 306 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'XeQNsyFg' \
    --region 'Pno9ShPI' \
    --storeId 'YSc7gMNw' \
    --itemIds 'UaSLmwDm' \
    > test.out 2>&1
eval_tap $? 306 'PublicBulkGetItems' test.out

#- 307 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["Q1yymHTH", "upB90ywf", "rkR3jbbe"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicValidateItemPurchaseCondition' test.out

#- 308 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'EXTENSION' \
    --limit '27' \
    --offset '7' \
    --region 'RuQk9iEk' \
    --storeId 'DR9F5OLG' \
    --keyword 'x2rAjuSm' \
    --language 'HzGaqeg9' \
    > test.out 2>&1
eval_tap $? 308 'PublicSearchItems' test.out

#- 309 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'pknwTBgC' \
    --namespace "$AB_NAMESPACE" \
    --language '7Co33q6T' \
    --region 'c9vAAZ4W' \
    --storeId 'si2QEVP4' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetApp' test.out

#- 310 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '6SXpohPp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 310 'PublicGetItemDynamicData' test.out

#- 311 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'hdi5mync' \
    --namespace "$AB_NAMESPACE" \
    --language 'QOa89rxC' \
    --populateBundle  \
    --region 'ZwGxNBak' \
    --storeId 'GGSP8CcL' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetItem' test.out

#- 312 GetPaymentCustomization
eval_tap 0 312 'GetPaymentCustomization # SKIP deprecated' test.out

#- 313 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "N2OJNidx", "paymentProvider": "ADYEN", "returnUrl": "ITU9FhLN", "ui": "U42yk8lU", "zipCode": "NNQAXmv1"}' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetPaymentUrl' test.out

#- 314 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xliPabFj' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetPaymentMethods' test.out

#- 315 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'x6InxNqX' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetUnpaidPaymentOrder' test.out

#- 316 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jJMtAxpF' \
    --paymentProvider 'WXPAY' \
    --zipCode 'HwWI2dtt' \
    --body '{"token": "bMihpU40"}' \
    > test.out 2>&1
eval_tap $? 316 'Pay' test.out

#- 317 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iOy52jgk' \
    > test.out 2>&1
eval_tap $? 317 'PublicCheckPaymentOrderPaidStatus' test.out

#- 318 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'F8ZmA8dr' \
    > test.out 2>&1
eval_tap $? 318 'GetPaymentPublicConfig' test.out

#- 319 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code '1wsvTgyK' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetQRCode' test.out

#- 320 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'zqY1lXA3' \
    --foreinginvoice 'QANeM7Q3' \
    --invoiceId 'aFdtAP0R' \
    --payload '0Jnilsp5' \
    --redirectResult 'kKMaOv29' \
    --resultCode 'uCTPQH3s' \
    --sessionId 'QQMnFBkk' \
    --status 'U0CdimJ9' \
    --token 'h10uX0r8' \
    --type '177XAwjR' \
    --userId 'sMFGen9N' \
    --orderNo 'M5lU9856' \
    --paymentOrderNo 'd6MOd5f6' \
    --paymentProvider 'XSOLLA' \
    --returnUrl 'IYNKC8Eo' \
    > test.out 2>&1
eval_tap $? 320 'PublicNormalizePaymentReturnUrl' test.out

#- 321 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'QzLopqxX' \
    --paymentOrderNo 'KPJeFXg8' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 321 'GetPaymentTaxValue' test.out

#- 322 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'xOWThCzz' \
    > test.out 2>&1
eval_tap $? 322 'GetRewardByCode' test.out

#- 323 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'ZRU2M5NQ' \
    --limit '42' \
    --offset '1' \
    --sortBy 'namespace:desc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 323 'QueryRewards1' test.out

#- 324 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vhjwm79a' \
    > test.out 2>&1
eval_tap $? 324 'GetReward1' test.out

#- 325 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 325 'PublicListStores' test.out

#- 326 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'uAyM5yju,T2FZAkC9,9SV6qQKG' \
    --itemIds 'MkGd03kq,Gd2IMNyZ,nxGv8jH1' \
    --skus '1CUwm6v7,ZLOVw36d,ucM90knz' \
    > test.out 2>&1
eval_tap $? 326 'PublicExistsAnyMyActiveEntitlement' test.out

#- 327 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'qYzZ3OZa' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 328 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'I9BLVBbY' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 329 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'nlhY9XUl' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 330 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds '7t68F0PY,BBOnQQrt,W43GgiTq' \
    --itemIds 'qkmrQc4D,6bm5Kbtx,ehNgtxQt' \
    --skus 'Fj9m2vYO,nQFkpVWP,nfbVAFBM' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetEntitlementOwnershipToken' test.out

#- 331 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode '56Yj2JjX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyWallet' test.out

#- 332 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'BKkIYeha' \
    --body '{"epicGamesJwtToken": "oYlO9ri5"}' \
    > test.out 2>&1
eval_tap $? 332 'SyncEpicGameDLC' test.out

#- 333 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'RKCk4032' \
    --body '{"serviceLabel": 86}' \
    > test.out 2>&1
eval_tap $? 333 'PublicSyncPsnDlcInventory' test.out

#- 334 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'pO7yJBdR' \
    --body '{"serviceLabels": [0, 11, 91]}' \
    > test.out 2>&1
eval_tap $? 334 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 335 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'MIjy4mof' \
    --body '{"appId": "QBQqL7SR", "steamId": "1RvNBqII"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncSteamDLC' test.out

#- 336 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'OZruTbDb' \
    --body '{"xstsToken": "bLM1Z3HN"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncXboxDLC' test.out

#- 337 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'krIomWsf' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'cM9KKF7S' \
    --features 'kzF7yClV,OfeAJ6EH,sRiYdhvL' \
    --itemId 'LVdZQzSD,3mdehZjA,fZ70jUku' \
    --limit '20' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 337 'PublicQueryUserEntitlements' test.out

#- 338 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'L1RerTsX' \
    --appId 'ugsCwP6v' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetUserAppEntitlementByAppId' test.out

#- 339 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'ORhxofbx' \
    --limit '49' \
    --offset '44' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserEntitlementsByAppType' test.out

#- 340 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jJwsH0uL' \
    --entitlementClazz 'LOOTBOX' \
    --itemId '1YQZB9LH' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetUserEntitlementByItemId' test.out

#- 341 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'SZBb1a01' \
    --entitlementClazz 'LOOTBOX' \
    --sku 'FpV8t1Hw' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserEntitlementBySku' test.out

#- 342 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'LWM5fW6Y' \
    --appIds 'LunzURMG,of6fdGl2,7f4ECqQg' \
    --itemIds 'WRRPehDJ,dofK4rAn,gzIqGOPS' \
    --skus 'yLc7ZkHb,Dde5NjhY,F5HMaIdq' \
    > test.out 2>&1
eval_tap $? 342 'PublicExistsAnyUserActiveEntitlement' test.out

#- 343 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cC58qndY' \
    --appId 'y0uOHJcD' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 344 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vQqL6cBZ' \
    --entitlementClazz 'MEDIA' \
    --itemId 'VlQ81aj8' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 345 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'aN7p9dF9' \
    --ids 'KM1DyBAK,7tYF926b,GfUs0rpa' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 346 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z8zKsww0' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'cRsRUBR3' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 347 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'SpIwz7Os' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JMgpR4Fi' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserEntitlement' test.out

#- 348 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '0IC96Rod' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fNBK7Seq' \
    --body '{"options": ["Xkc1gDJd", "I0cElwOB", "AdI8EPE2"], "requestId": "y6JZDAFe", "useCount": 49}' \
    > test.out 2>&1
eval_tap $? 348 'PublicConsumeUserEntitlement' test.out

#- 349 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'lOTL4m5G' \
    --body '{"code": "zlWvp66o", "language": "RL", "region": "w4jbA93Y"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicRedeemCode' test.out

#- 350 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '3gMtXYdy' \
    --body '{"excludeOldTransactions": true, "language": "KR", "productId": "VvGCJ7p6", "receiptData": "35ahORSZ", "region": "I4vsMMc4", "transactionId": "aJckYDDb"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicFulfillAppleIAPItem' test.out

#- 351 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'gk8qamxA' \
    --body '{"epicGamesJwtToken": "Vt7YyoWB"}' \
    > test.out 2>&1
eval_tap $? 351 'SyncEpicGamesInventory' test.out

#- 352 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7S52w2sL' \
    --body '{"autoAck": false, "language": "DTJ_eSVv-752", "orderId": "wBNjZwfS", "packageName": "PkcBX1cc", "productId": "n3yGN4kj", "purchaseTime": 27, "purchaseToken": "yiAEjMhE", "region": "TvlEIKga"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicFulfillGoogleIAPItem' test.out

#- 353 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'AkriOxke' \
    --body '{"currencyCode": "cvg3vPit", "price": 0.6755204561882961, "productId": "2dVtT20p", "serviceLabel": 87}' \
    > test.out 2>&1
eval_tap $? 353 'PublicReconcilePlayStationStore' test.out

#- 354 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eq6FmzBL' \
    --body '{"currencyCode": "BsCAdM2x", "price": 0.5824036238472716, "productId": "Lj6RD3Gk", "serviceLabels": [20, 45, 36]}' \
    > test.out 2>&1
eval_tap $? 354 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 355 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'jvfWq2AT' \
    --body '{"appId": "KoPGmjbp", "language": "XP_jzce", "region": "qbwJPBu4", "stadiaPlayerId": "5GkmY5I2"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncStadiaEntitlement' test.out

#- 356 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FgcLulB3' \
    --body '{"appId": "QsHofFf3", "currencyCode": "UyLZeWfE", "language": "NZ-hiRs-VX", "price": 0.5811729147501751, "productId": "t44vSga4", "region": "fVSEKjhE", "steamId": "bP0T0qD1"}' \
    > test.out 2>&1
eval_tap $? 356 'SyncSteamInventory' test.out

#- 357 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'iqtfakT0' \
    --body '{"gameId": "zDgRTQiq", "language": "lxKn_wVdn-WH", "region": "cbkMWUDs"}' \
    > test.out 2>&1
eval_tap $? 357 'SyncTwitchDropsEntitlement' test.out

#- 358 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6GrJHzNn' \
    --body '{"currencyCode": "bVxwhcQn", "price": 0.7192956506213026, "productId": "x7bG37OU", "xstsToken": "NeXDk9NT"}' \
    > test.out 2>&1
eval_tap $? 358 'SyncXboxInventory' test.out

#- 359 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 't7FY238H' \
    --itemId 'okTPa38t' \
    --limit '17' \
    --offset '64' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 359 'PublicQueryUserOrders' test.out

#- 360 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'dJB1kzVj' \
    --body '{"currencyCode": "DsAqAwc6", "discountedPrice": 44, "ext": {"Pp9JySL7": {}, "yTkDftCs": {}, "glK1zMpK": {}}, "itemId": "IU2lvmLJ", "language": "WDaz-GbNP_930", "price": 84, "quantity": 25, "region": "rl5x8OYe", "returnUrl": "zLohYpbT"}' \
    > test.out 2>&1
eval_tap $? 360 'PublicCreateUserOrder' test.out

#- 361 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NbasWb0i' \
    --userId 'mTPV7Vqb' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetUserOrder' test.out

#- 362 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'E4uCBLPx' \
    --userId 'DuoLj7ZZ' \
    > test.out 2>&1
eval_tap $? 362 'PublicCancelUserOrder' test.out

#- 363 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bse5PdZD' \
    --userId 'qfIP3LiY' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetUserOrderHistories' test.out

#- 364 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bRhszgUz' \
    --userId 'Rwbnjl8M' \
    > test.out 2>&1
eval_tap $? 364 'PublicDownloadUserOrderReceipt' test.out

#- 365 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'Urd3zOJX' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentAccounts' test.out

#- 366 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'h8vC8Z9H' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'I1PZjsHA' \
    > test.out 2>&1
eval_tap $? 366 'PublicDeletePaymentAccount' test.out

#- 367 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'jOvpfgbv' \
    --language 'eBO5l3Xq' \
    --region 'cO1gEs2R' \
    --storeId 'LuW1UaDk' \
    --viewId 'gn9ILoAc' \
    > test.out 2>&1
eval_tap $? 367 'PublicListActiveSections' test.out

#- 368 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'IR1yeYWm' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'TnQtWHyd' \
    --limit '39' \
    --offset '45' \
    --sku 'MfsfrgW1' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 368 'PublicQueryUserSubscriptions' test.out

#- 369 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'B35xlprx' \
    --body '{"currencyCode": "iEiYklPW", "itemId": "s3TaSySD", "language": "EP_jDgV", "region": "QhLRD2zI", "returnUrl": "svrfcAgK", "source": "5DNrjytS"}' \
    > test.out 2>&1
eval_tap $? 369 'PublicSubscribeSubscription' test.out

#- 370 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TfXffFnO' \
    --itemId 'tSix1BHH' \
    > test.out 2>&1
eval_tap $? 370 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 371 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'C94lKTbr' \
    --userId '0i3eLjoc' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserSubscription' test.out

#- 372 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'm3F5k8Al' \
    --userId 'BUbLJGEl' \
    > test.out 2>&1
eval_tap $? 372 'PublicChangeSubscriptionBillingAccount' test.out

#- 373 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uNliV56J' \
    --userId 'M8EcFqAY' \
    --body '{"immediate": true, "reason": "Q3DeYP4w"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicCancelSubscription' test.out

#- 374 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6iSBI9EE' \
    --userId 'PJ3lq0PL' \
    --excludeFree  \
    --limit '38' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserSubscriptionBillingHistories' test.out

#- 375 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'AGfRSh0B' \
    --language 'cmoVwjtm' \
    --storeId 'IVjx7HcF' \
    > test.out 2>&1
eval_tap $? 375 'PublicListViews' test.out

#- 376 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'yN8GwoSn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fFZC3RRW' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetWallet' test.out

#- 377 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode '0OtAfdUE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f1PqboWo' \
    --limit '9' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 377 'PublicListUserWalletTransactions' test.out

#- 378 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate 'F4TxOYLR' \
    --baseAppId 'KcsIVQhf' \
    --categoryPath 'jjZllcU6' \
    --features 'ZZ0aVENQ' \
    --includeSubCategoryItem  \
    --itemName 'om4fGuEL' \
    --itemStatus 'ACTIVE' \
    --itemType 'SEASON' \
    --limit '2' \
    --offset '42' \
    --region 'nJqTgRvp' \
    --sortBy 'name:desc,createdAt,name' \
    --storeId 'diyRkLuA' \
    --tags 'Qjid3CId' \
    --targetNamespace 'xGE8gida' \
    > test.out 2>&1
eval_tap $? 378 'QueryItems1' test.out

#- 379 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Aj5zMP5D' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 379 'ImportStore1' test.out

#- 380 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SfahXSki' \
    --body '{"itemIds": ["zAjohNYp", "dRzaMmO3", "LGR7Zk8t"]}' \
    > test.out 2>&1
eval_tap $? 380 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE