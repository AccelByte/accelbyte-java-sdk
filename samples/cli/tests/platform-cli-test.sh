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
    --body '{"context": {"item": {"appId": "PV9FMUg2", "appType": "SOFTWARE", "baseAppId": "r9eXvwry", "boothName": "TRr0qSUd", "boundItemIds": ["Zeq64Rx0", "HZmVm5Nj", "VrJYFkWJ"], "categoryPath": "HCp5OXiW", "clazz": "cwnySjWZ", "createdAt": "1984-05-17T00:00:00Z", "description": "Yl943T55", "displayOrder": 99, "entitlementType": "DURABLE", "ext": {"3n5J8Osx": {}, "ZdXBFiRc": {}, "4Fg5dccn": {}}, "features": ["aUDqkXwU", "E6ISueGl", "c7o9v7qO"], "fresh": true, "images": [{"as": "FHTDjM5d", "caption": "34i1rwW2", "height": 66, "imageUrl": "D7F79ta3", "smallImageUrl": "wMF3y2Dg", "width": 10}, {"as": "uJRH3Ewn", "caption": "3Z6jbtUS", "height": 82, "imageUrl": "5epEyGc9", "smallImageUrl": "AZvUure7", "width": 33}, {"as": "Dgr3Hm9w", "caption": "MClTI74z", "height": 3, "imageUrl": "PpuUJRbg", "smallImageUrl": "macQtqQJ", "width": 47}], "itemId": "umVWkSBL", "itemIds": ["IYcQzFT0", "VmwXbGeq", "TeHUCN0w"], "itemQty": {"IUgckcHT": 66, "Wx0PQTJH": 2, "alVXBmin": 25}, "itemType": "COINS", "language": "WHoAdCar", "listable": true, "localExt": {"fDpJ2xKY": {}, "3cYPkUmT": {}, "fSQIfAZ2": {}}, "longDescription": "J5J4fTbe", "lootBoxConfig": {"rewardCount": 60, "rewards": [{"lootBoxItems": [{"count": 54, "itemId": "OluUhRsT", "itemSku": "qLQLPOCt", "itemType": "lCZtZg7M"}, {"count": 44, "itemId": "XBzFEXW5", "itemSku": "gTL18y0c", "itemType": "GZVWyNWn"}, {"count": 74, "itemId": "Q7d3RdHO", "itemSku": "Yv1036Uq", "itemType": "TDeho44P"}], "name": "KQMEFMFU", "odds": 0.4384919629409667, "type": "REWARD_GROUP", "weight": 20}, {"lootBoxItems": [{"count": 28, "itemId": "sZXoxISi", "itemSku": "1ZtoSuMZ", "itemType": "dIaDrapi"}, {"count": 77, "itemId": "TUFZF78q", "itemSku": "pCqjngB3", "itemType": "IpRdpNrj"}, {"count": 19, "itemId": "UQlZNEs2", "itemSku": "PDkOIfEZ", "itemType": "1BxsTUPG"}], "name": "srQsYFmK", "odds": 0.013945346856873542, "type": "REWARD_GROUP", "weight": 51}, {"lootBoxItems": [{"count": 32, "itemId": "ul6r3pfR", "itemSku": "fVWFAEXY", "itemType": "Sjb5xfla"}, {"count": 1, "itemId": "iHdu5MZH", "itemSku": "WXoG8YHQ", "itemType": "t9VwKBB3"}, {"count": 68, "itemId": "zTSf58G7", "itemSku": "NeTqDHMf", "itemType": "gDSfGodi"}], "name": "YAOHoe7M", "odds": 0.5865009118111593, "type": "REWARD_GROUP", "weight": 64}], "rollFunction": "CUSTOM"}, "maxCount": 82, "maxCountPerUser": 86, "name": "UdfUTc1J", "namespace": "QJ4mBUOl", "optionBoxConfig": {"boxItems": [{"count": 65, "itemId": "pgdu3tzD", "itemSku": "WqJOwyl0", "itemType": "IuwcuQeD"}, {"count": 98, "itemId": "3LMt3As2", "itemSku": "xFbXoDaa", "itemType": "49uvJyNL"}, {"count": 63, "itemId": "28HG6qSL", "itemSku": "6oTbPYAb", "itemType": "b4Pxi5Zv"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 3, "comparison": "isLessThan", "name": "A6JCV0Q0", "predicateType": "SeasonTierPredicate", "value": "mujViBAu", "values": ["e3Sh8Cob", "AK7S0pT1", "BIL4APuG"]}, {"anyOf": 19, "comparison": "isLessThan", "name": "2DJJsfqv", "predicateType": "SeasonTierPredicate", "value": "DnGwJsaH", "values": ["YFfe0LvW", "RHUBignc", "kDX7kM8g"]}, {"anyOf": 96, "comparison": "isLessThanOrEqual", "name": "ycl5cA0k", "predicateType": "SeasonTierPredicate", "value": "nnaVJCOZ", "values": ["cCu7Mctt", "kOowbOBF", "4s3BeGJi"]}]}, {"operator": "and", "predicates": [{"anyOf": 19, "comparison": "isLessThanOrEqual", "name": "S2w6CFHf", "predicateType": "EntitlementPredicate", "value": "cK9b91wL", "values": ["2drByQKR", "8v1NLg4A", "1Nkfe14z"]}, {"anyOf": 83, "comparison": "isLessThan", "name": "fVehyexN", "predicateType": "SeasonPassPredicate", "value": "5JQDFCJ8", "values": ["dMfbOfQ8", "uQQhfV48", "f5o75uYX"]}, {"anyOf": 55, "comparison": "isLessThanOrEqual", "name": "PLkrFWUk", "predicateType": "SeasonTierPredicate", "value": "rTKDBOUC", "values": ["6ao3U6Nu", "pwLyaKge", "DKEVN2Fv"]}]}, {"operator": "or", "predicates": [{"anyOf": 71, "comparison": "isLessThanOrEqual", "name": "8pAvJprU", "predicateType": "EntitlementPredicate", "value": "BePp14Wy", "values": ["7vknpI4v", "vPNN2bQs", "LjeKvZK4"]}, {"anyOf": 49, "comparison": "is", "name": "dnRpas26", "predicateType": "EntitlementPredicate", "value": "16NY1v6C", "values": ["meB5XaWL", "4uERryIR", "9yDnqXu6"]}, {"anyOf": 84, "comparison": "isGreaterThan", "name": "cIYnLznp", "predicateType": "SeasonTierPredicate", "value": "ccNJjeXU", "values": ["RcWUEsDp", "J9gwHJyK", "04XW26t3"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 40, "fixedTrialCycles": 0, "graceDays": 73}, "region": "d8SDoP2r", "regionData": [{"currencyCode": "PUr9OVs1", "currencyNamespace": "mJKph8YK", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1982-12-19T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1985-09-18T00:00:00Z", "discountedPrice": 30, "expireAt": "1971-02-06T00:00:00Z", "price": 93, "purchaseAt": "1989-01-20T00:00:00Z", "trialPrice": 34}, {"currencyCode": "KGVdfdOL", "currencyNamespace": "Z3xq5GyQ", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1992-05-20T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1971-04-29T00:00:00Z", "discountedPrice": 53, "expireAt": "1985-11-22T00:00:00Z", "price": 21, "purchaseAt": "1973-09-29T00:00:00Z", "trialPrice": 20}, {"currencyCode": "nrWZqGhK", "currencyNamespace": "uenSDDf1", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1982-08-09T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1980-08-17T00:00:00Z", "discountedPrice": 19, "expireAt": "1983-06-02T00:00:00Z", "price": 36, "purchaseAt": "1986-01-06T00:00:00Z", "trialPrice": 82}], "seasonType": "TIER", "sku": "WRy44BD7", "stackable": false, "status": "INACTIVE", "tags": ["uKu36T4H", "uiCcBmrr", "Np7ejOgX"], "targetCurrencyCode": "GzG0WZeg", "targetItemId": "beKqOaiM", "targetNamespace": "nv4yBZxf", "thumbnailUrl": "W28rjkPp", "title": "DcC8d3VD", "updatedAt": "1983-12-21T00:00:00Z", "useCount": 17}, "namespace": "kTzBxiv1", "order": {"currency": {"currencyCode": "SCm84Xfx", "currencySymbol": "zumRYK2z", "currencyType": "REAL", "decimals": 33, "namespace": "CekkpG2u"}, "ext": {"GTYCRQ4K": {}, "BPAi4hMb": {}, "Cz0y8XsQ": {}}, "free": true}, "source": "ACHIEVEMENT"}, "script": "iR32oPMI", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'jA8BhWfo' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'sqFfKpFl' \
    --body '{"grantDays": "VN3L44mr"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '4qe77oW5' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'Vl7rzPZV' \
    --body '{"grantDays": "zLba2AIi"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "1V51DePv", "dryRun": true, "fulfillmentUrl": "vefdq8Tq", "itemType": "SEASON", "purchaseConditionUrl": "cBegrJuU"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'JUQWXFku' \
    --itemType 'SEASON' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'tPzSAmGi' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'XgWtHGJS' \
    --body '{"clazz": "xhoyi5z2", "dryRun": false, "fulfillmentUrl": "W3Ygrwn6", "purchaseConditionUrl": "FtpBjaKO"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'qsD2rl3n' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --name 'alBY4BlP' \
    --offset '83' \
    --tag 'Ew0x2nAQ' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "RvCFcWXQ", "items": [{"extraSubscriptionDays": 53, "itemId": "xjIS7H3C", "itemName": "3NmTe9PY", "quantity": 70}, {"extraSubscriptionDays": 44, "itemId": "p8AQBH3V", "itemName": "rKVNbcF1", "quantity": 31}, {"extraSubscriptionDays": 19, "itemId": "4Bjm7HQJ", "itemName": "fazTli2M", "quantity": 48}], "maxRedeemCountPerCampaignPerUser": 99, "maxRedeemCountPerCode": 0, "maxRedeemCountPerCodePerUser": 98, "maxSaleCount": 48, "name": "l7MfDgii", "redeemEnd": "1983-05-12T00:00:00Z", "redeemStart": "1972-08-05T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["gevGcuTB", "hGg7e3ZW", "ndALkyCO"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '266S9XnE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'xDGZrZvu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "nmjS8X2S", "items": [{"extraSubscriptionDays": 32, "itemId": "qZ9WMDsw", "itemName": "TO7m0Sw7", "quantity": 39}, {"extraSubscriptionDays": 92, "itemId": "H6mKVRVi", "itemName": "IzT1fEuj", "quantity": 67}, {"extraSubscriptionDays": 71, "itemId": "aJTEcKnj", "itemName": "8Gi5Cs1W", "quantity": 26}], "maxRedeemCountPerCampaignPerUser": 60, "maxRedeemCountPerCode": 86, "maxRedeemCountPerCodePerUser": 66, "maxSaleCount": 0, "name": "4AYffuVk", "redeemEnd": "1998-12-26T00:00:00Z", "redeemStart": "1996-01-02T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["P8hbAWnF", "4tgBLZqk", "WXkWTwn4"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'GGAAkYTT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pHhzBV6h' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X5dnK0XT' \
    --body '{"categoryPath": "sJ46XYge", "localizationDisplayNames": {"UB07djzc": "J8LXCsyQ", "a3RX7Tw8": "05B7vumm", "2dgaOdb6": "W8RjgVQO"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BLfCobrd' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath '85nlvYUT' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mNVcBVDm' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'KY4ranev' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0cygGYWq' \
    --body '{"localizationDisplayNames": {"uZ75kBsf": "etPlbNNa", "cO82PdKu": "KgkWdVgr", "5zzlt9x7": "Q9IwAs7a"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'KfPXCLWW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ztjvgaJf' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'tNcxK2QF' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uYSmSeXd' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '99l0zsgR' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6wPJTarA' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'Kyxu4F9A' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '17' \
    --code 'Adlnd3tY' \
    --limit '89' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'HN62cmSF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 4}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'ZsA2247p' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '66' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '0XMrkiFj' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '36' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'YnNQ8ocZ' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '86' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'DOUsiGPz' \
    --namespace "$AB_NAMESPACE" \
    --code '7YrefjXs' \
    --limit '70' \
    --offset '9' \
    --userId '4iZK0z8C' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'ZfogLHCm' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'z2ZxIBqB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'A1RgsGSl' \
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
    --body '{"grpcServerAddress": "e3Vd405i"}' \
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
    --body '{"currencyCode": "WKoAUnrz", "currencySymbol": "3RQtL9D1", "currencyType": "REAL", "decimals": 84, "localizationDescriptions": {"lGjWyjgp": "wqWN9l1j", "CPyc943P": "tFeFrobR", "ixYdBHrF": "I3Ypb6sU"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '1npQzaRm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"ePVOyuzE": "bTy64myB", "tMHydo6e": "PppbtKUv", "fxAN9m8Z": "NbulF18i"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'ZCk12vLd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'nQlVx5JX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'q6jjkACE' \
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
    --body '{"data": [{"id": "2CqM8TXo", "rewards": [{"currency": {"currencyCode": "c7uS54q2", "namespace": "d5WxjG4M"}, "item": {"itemId": "1B4SIBUf", "itemSku": "voUyYCpq", "itemType": "OxSdvshG"}, "quantity": 44, "type": "CURRENCY"}, {"currency": {"currencyCode": "kvzGn6H1", "namespace": "RozHWIQM"}, "item": {"itemId": "T0YBiTz8", "itemSku": "LW0yQAnE", "itemType": "yPD35KOT"}, "quantity": 22, "type": "ITEM"}, {"currency": {"currencyCode": "adFmjBzB", "namespace": "RlljCTHn"}, "item": {"itemId": "HxmLAAax", "itemSku": "SHJm7ZRb", "itemType": "ULisIwMP"}, "quantity": 69, "type": "ITEM"}]}, {"id": "dXXfc9qQ", "rewards": [{"currency": {"currencyCode": "bWGJqmWQ", "namespace": "bDpDmH0x"}, "item": {"itemId": "ultHgBc0", "itemSku": "IOSByHxC", "itemType": "bi3NobN6"}, "quantity": 73, "type": "ITEM"}, {"currency": {"currencyCode": "zQeZxpz0", "namespace": "COcfyWrT"}, "item": {"itemId": "r1tl0Dwp", "itemSku": "kKHiMM2d", "itemType": "kEXkqvvz"}, "quantity": 11, "type": "ITEM"}, {"currency": {"currencyCode": "X36PvQ5O", "namespace": "KVQG2Qgb"}, "item": {"itemId": "leS08xXe", "itemSku": "m2Qn8cxl", "itemType": "Zws2O9K2"}, "quantity": 67, "type": "ITEM"}]}, {"id": "d08GvGzS", "rewards": [{"currency": {"currencyCode": "JFKSzjP9", "namespace": "5e5kmQkC"}, "item": {"itemId": "Hozqr4vZ", "itemSku": "Nd12Sh5F", "itemType": "wWM0C2en"}, "quantity": 7, "type": "CURRENCY"}, {"currency": {"currencyCode": "vEv0OVAE", "namespace": "lTuaGAa6"}, "item": {"itemId": "zhHSF4UT", "itemSku": "0y7ecL4s", "itemType": "NJGy5QXG"}, "quantity": 38, "type": "ITEM"}, {"currency": {"currencyCode": "X40wufAT", "namespace": "483SKsCU"}, "item": {"itemId": "qmhA22to", "itemSku": "RivesPZW", "itemType": "dXZbCiZC"}, "quantity": 94, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"co1CmJHT": "3PWONlOs", "barcJctQ": "GuEtdoRg", "aJyjORMc": "3QzhiR1A"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"KHYtiKpV": "MX51Xxff", "HpdEgyrf": "949PidZl", "eqNHTsq0": "CJDwnI2o"}}, {"platform": "STEAM", "platformDlcIdMap": {"KaHIlh13": "knv7GNr5", "PXnTHtkO": "8mYvJnv8", "djOmeSBE": "uxP3PtNA"}}]}' \
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
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'YhR5m6QJ' \
    --itemId 'rZqmMLGn,S2M1O7u8,XmDbvRhy' \
    --limit '71' \
    --offset '76' \
    --userId 'wtcaToAq' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'ADGhi7ES' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '72' \
    --status 'FAIL' \
    --userId '5hGRnNGt' \
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
    --body '{"bundleId": "Ho0uN6L2", "password": "rjIVqHbB"}' \
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
    --body '{"sandboxId": "hOMtkxQw"}' \
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
    --body '{"applicationName": "lijbQClj", "serviceAccountId": "tt2XnI4a"}' \
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
    --body '{"data": [{"itemIdentity": "AZdQCPTT", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"rHkbBfHr": "DFE0Ea93", "msJYX9Z2": "KQ4wgWUb", "hQJCgiim": "vN28UBp9"}}, {"itemIdentity": "I2arVBVO", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"XpkdGvhL": "m24489Cu", "MO5W0qwo": "9sF5Jj77", "Og45tzsU": "BidV6UWk"}}, {"itemIdentity": "SiUfgmdO", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"6tkizrdY": "zBxA89GZ", "52OFSXWG": "iql1Gj9Y", "4ajHaLBG": "1dbEIKKo"}}]}' \
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
    --body '{"environment": "pkL7KSrD"}' \
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
    --body '{"appId": "IE64hDhT", "publisherAuthenticationKey": "DyF6YF9q"}' \
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
    --body '{"clientId": "lmRuGIfp", "clientSecret": "XciBP7b8", "organizationId": "BKhHIu49"}' \
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
    --body '{"relyingPartyCert": "CyG4F8Pb"}' \
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
    --password 'MM2GWK2h' \
    > test.out 2>&1
eval_tap $? 82 'UpdateXblBPCertFile' test.out

#- 83 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'egglLwJH' \
    --itemId 'c0uMFpJk' \
    --itemType 'EXTENSION' \
    --endTime 'atCdwddL' \
    --startTime 'BSkm2Brj' \
    > test.out 2>&1
eval_tap $? 83 'DownloadInvoiceDetails' test.out

#- 84 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'hngry3Hf' \
    --itemId 'sEd2y7vL' \
    --itemType 'EXTENSION' \
    --endTime 'xPjHO8Ma' \
    --startTime 'kPYHsqGm' \
    > test.out 2>&1
eval_tap $? 84 'GenerateInvoiceSummary' test.out

#- 85 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ofUTDD1w' \
    --body '{"categoryPath": "UPzgXl75", "targetItemId": "Y1E3UQkQ", "targetNamespace": "NDQN1ENJ"}' \
    > test.out 2>&1
eval_tap $? 85 'SyncInGameItem' test.out

#- 86 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VYpxkcUU' \
    --body '{"appId": "BO8Crkn8", "appType": "DEMO", "baseAppId": "p8ARmtmJ", "boothName": "QdXJPYEg", "categoryPath": "fVmfLIst", "clazz": "SYUKW77z", "displayOrder": 56, "entitlementType": "CONSUMABLE", "ext": {"tHwnlFW8": {}, "v2cgeX70": {}, "DY3pmoxq": {}}, "features": ["dxSofoO0", "4WdNcGP1", "WUikU4Sj"], "images": [{"as": "uKHdz1vS", "caption": "JC7a1aQu", "height": 77, "imageUrl": "mVO719jq", "smallImageUrl": "eLSdk6y7", "width": 85}, {"as": "Xva5C3S8", "caption": "pPGFOxxq", "height": 59, "imageUrl": "jFz8cSwT", "smallImageUrl": "0A0FDAax", "width": 7}, {"as": "EeXmlDDn", "caption": "1bcaCdBj", "height": 39, "imageUrl": "FG4IhEvE", "smallImageUrl": "QEsIu8VU", "width": 0}], "itemIds": ["ncF5qvMZ", "bBtri7Ee", "narwXkoi"], "itemQty": {"dgRyOBt3": 30, "EpXaZmiA": 34, "4cvrWzZ3": 26}, "itemType": "MEDIA", "listable": false, "localizations": {"sJsSfCFM": {"description": "LYtI1Z1V", "localExt": {"8XnGEHxf": {}, "niM7IG8A": {}, "WGv5e5jE": {}}, "longDescription": "rq685osQ", "title": "30TwmIHn"}, "znBYD16U": {"description": "pnPb2pDk", "localExt": {"DW67tfwE": {}, "WzcbHaW9": {}, "8tf7htW1": {}}, "longDescription": "7dAV296y", "title": "SonyZ4Lz"}, "O3DDxUYT": {"description": "PGDuirDO", "localExt": {"oLXC2Eal": {}, "8c55jcXv": {}, "Jrj5N32k": {}}, "longDescription": "5SvGvrNG", "title": "8uPhDQzy"}}, "lootBoxConfig": {"rewardCount": 89, "rewards": [{"lootBoxItems": [{"count": 21, "itemId": "id3Jnxw0", "itemSku": "X5mE2sgi", "itemType": "neiCPfJW"}, {"count": 56, "itemId": "EPwD3UuH", "itemSku": "3xplYjh2", "itemType": "S7QlyviP"}, {"count": 33, "itemId": "xAqKb40R", "itemSku": "dWKcSj60", "itemType": "nC4xYig6"}], "name": "4wTmvLzY", "odds": 0.8314654607075487, "type": "PROBABILITY_GROUP", "weight": 3}, {"lootBoxItems": [{"count": 3, "itemId": "7mEInH9i", "itemSku": "JboSZqNa", "itemType": "9UOIzGAt"}, {"count": 49, "itemId": "vVHsNjse", "itemSku": "e3WV2BsT", "itemType": "DMN5d8Nh"}, {"count": 69, "itemId": "MoGWYbFA", "itemSku": "XRvJMkVi", "itemType": "ztCnbMW6"}], "name": "geRWeAn2", "odds": 0.2933104593202276, "type": "PROBABILITY_GROUP", "weight": 19}, {"lootBoxItems": [{"count": 1, "itemId": "VnFw0gLJ", "itemSku": "32IZRiN7", "itemType": "GGhBxdzl"}, {"count": 77, "itemId": "x07YDmVT", "itemSku": "JzXLb8bU", "itemType": "4cXI7Jaj"}, {"count": 99, "itemId": "XpFFmOTu", "itemSku": "BdGNrtC4", "itemType": "TjXkuYKl"}], "name": "MZCQfIqt", "odds": 0.5585071316665047, "type": "REWARD", "weight": 39}], "rollFunction": "CUSTOM"}, "maxCount": 65, "maxCountPerUser": 10, "name": "OJwr7M3z", "optionBoxConfig": {"boxItems": [{"count": 39, "itemId": "ytl4s2oA", "itemSku": "1ei255Ez", "itemType": "oJxtkobu"}, {"count": 1, "itemId": "Mnu8SYPe", "itemSku": "ULonpTY1", "itemType": "rdp5GvHL"}, {"count": 73, "itemId": "n4cAcGUc", "itemSku": "RejGtpz7", "itemType": "AoghzGQV"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 52, "fixedTrialCycles": 35, "graceDays": 48}, "regionData": {"1O3SaTJL": [{"currencyCode": "sVzxNTOu", "currencyNamespace": "SNbrmVbN", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1982-11-06T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1988-06-21T00:00:00Z", "discountedPrice": 69, "expireAt": "1992-05-06T00:00:00Z", "price": 28, "purchaseAt": "1993-07-28T00:00:00Z", "trialPrice": 29}, {"currencyCode": "pHacDo5a", "currencyNamespace": "dDQsFroX", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1986-03-19T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1989-07-13T00:00:00Z", "discountedPrice": 82, "expireAt": "1973-08-30T00:00:00Z", "price": 74, "purchaseAt": "1978-06-28T00:00:00Z", "trialPrice": 62}, {"currencyCode": "lIf2DYHH", "currencyNamespace": "pNmdxcV0", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1983-09-22T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1986-04-01T00:00:00Z", "discountedPrice": 54, "expireAt": "1983-02-10T00:00:00Z", "price": 57, "purchaseAt": "1973-09-04T00:00:00Z", "trialPrice": 27}], "JNJbujXZ": [{"currencyCode": "0MqTvWQN", "currencyNamespace": "RA3ixRN0", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1993-07-20T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1989-07-21T00:00:00Z", "discountedPrice": 88, "expireAt": "1997-11-27T00:00:00Z", "price": 54, "purchaseAt": "1996-12-30T00:00:00Z", "trialPrice": 9}, {"currencyCode": "HwOjI09T", "currencyNamespace": "CrJe7mhd", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1979-10-27T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1995-06-25T00:00:00Z", "discountedPrice": 41, "expireAt": "1980-07-29T00:00:00Z", "price": 22, "purchaseAt": "1982-04-23T00:00:00Z", "trialPrice": 7}, {"currencyCode": "W2elQTEO", "currencyNamespace": "oNpF0HAQ", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1973-03-07T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1976-12-13T00:00:00Z", "discountedPrice": 63, "expireAt": "1988-02-15T00:00:00Z", "price": 91, "purchaseAt": "1989-02-18T00:00:00Z", "trialPrice": 96}], "XEuG9ppC": [{"currencyCode": "hZ5RZHDK", "currencyNamespace": "Do7NxV1k", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1985-08-13T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1977-05-23T00:00:00Z", "discountedPrice": 16, "expireAt": "1979-07-22T00:00:00Z", "price": 39, "purchaseAt": "1983-01-30T00:00:00Z", "trialPrice": 27}, {"currencyCode": "XCDvrapo", "currencyNamespace": "6gmH05mG", "currencyType": "VIRTUAL", "discountAmount": 52, "discountExpireAt": "1990-05-18T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1981-03-05T00:00:00Z", "discountedPrice": 53, "expireAt": "1974-01-15T00:00:00Z", "price": 94, "purchaseAt": "1975-12-22T00:00:00Z", "trialPrice": 99}, {"currencyCode": "6h5iw7vQ", "currencyNamespace": "nsBwJpSe", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1980-08-29T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1988-01-04T00:00:00Z", "discountedPrice": 51, "expireAt": "1979-03-29T00:00:00Z", "price": 52, "purchaseAt": "1971-07-19T00:00:00Z", "trialPrice": 95}]}, "seasonType": "PASS", "sku": "a5DBJFuX", "stackable": true, "status": "INACTIVE", "tags": ["821f9ciE", "0lV6Q8pI", "S9hTtlFp"], "targetCurrencyCode": "nP4U8G4F", "targetNamespace": "lYokFNrd", "thumbnailUrl": "bQyQcVGx", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 86 'CreateItem' test.out

#- 87 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'ECm7v0Dm' \
    --appId 'SXbXdg1B' \
    > test.out 2>&1
eval_tap $? 87 'GetItemByAppId' test.out

#- 88 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'D6sOrOdQ' \
    --baseAppId 'tFaP1uGt' \
    --categoryPath 'L5pvKkzE' \
    --features 'k4e6yAqx' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --limit '40' \
    --offset '94' \
    --region 'ZGZ7BvWS' \
    --sortBy 'displayOrder,createdAt,name:asc' \
    --storeId 'ywwmPs6J' \
    --tags 'XxMpATl1' \
    --targetNamespace '93LkpjxT' \
    > test.out 2>&1
eval_tap $? 88 'QueryItems' test.out

#- 89 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'zdTvThZs,oithEpmz,GUHA9dY5' \
    > test.out 2>&1
eval_tap $? 89 'ListBasicItemsByFeatures' test.out

#- 90 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'RPtiT9GI' \
    --sku 'kJO7ymqK' \
    > test.out 2>&1
eval_tap $? 90 'GetItemBySku' test.out

#- 91 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'rvcnZDIa' \
    --populateBundle  \
    --region 'd8WFvuEP' \
    --storeId 'Vl3yIy1H' \
    --sku 'OpM4Cggm' \
    > test.out 2>&1
eval_tap $? 91 'GetLocaleItemBySku' test.out

#- 92 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '0ayAUkni' \
    --sku 'LJGTyepQ' \
    > test.out 2>&1
eval_tap $? 92 'GetItemIdBySku' test.out

#- 93 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'PB5QgVIU,G5zsZwVI,cBZjKDsU' \
    --storeId 'wrPgjZIb' \
    > test.out 2>&1
eval_tap $? 93 'GetBulkItemIdBySkus' test.out

#- 94 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'j6mrYkvN' \
    --region 'Dmipbdzc' \
    --storeId '1PNtUtUn' \
    --itemIds 'gzD6vcKp' \
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
    --userId 'ZGID4pzN' \
    --body '{"itemIds": ["hN4u6OsW", "2D0VEcma", "CB4No7G5"]}' \
    > test.out 2>&1
eval_tap $? 96 'ValidateItemPurchaseCondition' test.out

#- 97 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'APP' \
    --limit '46' \
    --offset '8' \
    --sortBy '5GHChIk8' \
    --storeId 'fbRrwQvs' \
    --keyword 'wDff3xHP' \
    --language 'xm7CUR9L' \
    > test.out 2>&1
eval_tap $? 97 'SearchItems' test.out

#- 98 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '74' \
    --offset '20' \
    --sortBy 'updatedAt:asc,createdAt:asc,name:desc' \
    --storeId 'AfuemXpF' \
    > test.out 2>&1
eval_tap $? 98 'QueryUncategorizedItems' test.out

#- 99 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '6yXIm1Qi' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '3P9T6v0u' \
    > test.out 2>&1
eval_tap $? 99 'GetItem' test.out

#- 100 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId '6SrwJDNa' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I2dOLSv6' \
    --body '{"appId": "ZW7l5HYn", "appType": "SOFTWARE", "baseAppId": "1AzcJxE3", "boothName": "8V9sAckb", "categoryPath": "26kQkRe4", "clazz": "5ncYij3i", "displayOrder": 5, "entitlementType": "CONSUMABLE", "ext": {"XDmTJTRz": {}, "dpV14F6i": {}, "g9saP9NF": {}}, "features": ["oCShdAA4", "PHFY24Yr", "bzyOt3C5"], "images": [{"as": "MZXBafGz", "caption": "WyF8ri2k", "height": 74, "imageUrl": "OnaYwpDU", "smallImageUrl": "1Wlca3VP", "width": 0}, {"as": "LEPiMN05", "caption": "GJKhTVze", "height": 41, "imageUrl": "ysL0VsRO", "smallImageUrl": "Tt4RmFnS", "width": 97}, {"as": "3VAKRpH9", "caption": "G1BsMKs0", "height": 82, "imageUrl": "JPfpg8eV", "smallImageUrl": "OJ7WP3bn", "width": 5}], "itemIds": ["t6SKY7wi", "XnwoI6vv", "eyPYduPz"], "itemQty": {"XSc79nu6": 72, "aapclX7w": 33, "rTLUPo2T": 15}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"xCx2zeeV": {"description": "tnsJD9hJ", "localExt": {"dg2pXUef": {}, "WfaOtWo3": {}, "MR9ooSwd": {}}, "longDescription": "hlaEEL6t", "title": "TM1EMoJz"}, "uTFNAxb6": {"description": "sZln9Qnx", "localExt": {"IuBebK0t": {}, "kenFOkwP": {}, "6Gygy5CB": {}}, "longDescription": "WT257cO2", "title": "MvUlXcRY"}, "zGDINKRu": {"description": "Zat5umzo", "localExt": {"dQipzkC6": {}, "qNMWTGT7": {}, "VgEc3MEv": {}}, "longDescription": "8zKTujHc", "title": "JUNncLHC"}}, "lootBoxConfig": {"rewardCount": 88, "rewards": [{"lootBoxItems": [{"count": 24, "itemId": "v7P1iA25", "itemSku": "q7jce8OE", "itemType": "Ho6uUO0P"}, {"count": 27, "itemId": "HP9GTLwP", "itemSku": "fmIGKo0X", "itemType": "JyGey7Wq"}, {"count": 18, "itemId": "WubnvNf3", "itemSku": "1isL8JPV", "itemType": "LuUNhbwo"}], "name": "kpiaFkXZ", "odds": 0.30554016526785, "type": "REWARD", "weight": 42}, {"lootBoxItems": [{"count": 78, "itemId": "ijiiAikM", "itemSku": "mDsOquuB", "itemType": "m8057W3H"}, {"count": 47, "itemId": "JPbz87HF", "itemSku": "qy9pSeUs", "itemType": "6bFBxEjG"}, {"count": 0, "itemId": "7sdUd2G4", "itemSku": "tXq3UvTO", "itemType": "o1Dnl1Pn"}], "name": "yLQp2w1h", "odds": 0.6200278908731521, "type": "PROBABILITY_GROUP", "weight": 41}, {"lootBoxItems": [{"count": 83, "itemId": "qQdq6vxI", "itemSku": "0mDXQYBO", "itemType": "hAzwayKc"}, {"count": 76, "itemId": "ZiHWsnLF", "itemSku": "gozFC4wo", "itemType": "ZP0sbcep"}, {"count": 53, "itemId": "tXmDz6Lf", "itemSku": "RQvMZVeA", "itemType": "d7JvqNGQ"}], "name": "Fsv3x5pM", "odds": 0.6435632725283297, "type": "PROBABILITY_GROUP", "weight": 55}], "rollFunction": "DEFAULT"}, "maxCount": 76, "maxCountPerUser": 12, "name": "C1mwISwh", "optionBoxConfig": {"boxItems": [{"count": 4, "itemId": "hwXam8ug", "itemSku": "TNx4dpHI", "itemType": "Ia9UPQNt"}, {"count": 2, "itemId": "wrJHNFaf", "itemSku": "RlmF3ILa", "itemType": "2PYjl2Dq"}, {"count": 14, "itemId": "mlyVv4Lp", "itemSku": "xhIUriwW", "itemType": "CJyuJirc"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 97, "fixedTrialCycles": 93, "graceDays": 56}, "regionData": {"clw1yRBm": [{"currencyCode": "MjLfYD2w", "currencyNamespace": "JuetBU91", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1978-06-15T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1989-12-20T00:00:00Z", "discountedPrice": 67, "expireAt": "1993-11-04T00:00:00Z", "price": 75, "purchaseAt": "1972-01-29T00:00:00Z", "trialPrice": 35}, {"currencyCode": "fQfJODMc", "currencyNamespace": "cD08Y2kz", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1979-04-28T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1978-02-23T00:00:00Z", "discountedPrice": 8, "expireAt": "1979-10-07T00:00:00Z", "price": 77, "purchaseAt": "1996-08-08T00:00:00Z", "trialPrice": 83}, {"currencyCode": "7d3d6lDK", "currencyNamespace": "oMZszNs9", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1995-12-27T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1991-10-16T00:00:00Z", "discountedPrice": 27, "expireAt": "1976-08-20T00:00:00Z", "price": 91, "purchaseAt": "1973-05-11T00:00:00Z", "trialPrice": 72}], "sKUO1KnY": [{"currencyCode": "FJq9suXk", "currencyNamespace": "z2fys5XA", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1985-08-22T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1994-10-14T00:00:00Z", "discountedPrice": 67, "expireAt": "1976-07-15T00:00:00Z", "price": 6, "purchaseAt": "1987-12-21T00:00:00Z", "trialPrice": 60}, {"currencyCode": "gSSlOOlZ", "currencyNamespace": "yueEAT18", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1977-07-09T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1982-04-05T00:00:00Z", "discountedPrice": 56, "expireAt": "1982-12-21T00:00:00Z", "price": 27, "purchaseAt": "1982-02-02T00:00:00Z", "trialPrice": 22}, {"currencyCode": "zSyoFBGj", "currencyNamespace": "gzrnhty9", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1996-02-06T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1993-06-02T00:00:00Z", "discountedPrice": 66, "expireAt": "1980-07-04T00:00:00Z", "price": 68, "purchaseAt": "1971-12-14T00:00:00Z", "trialPrice": 58}], "7dDOfMEM": [{"currencyCode": "hDGM9YwV", "currencyNamespace": "xdEMoKYw", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1995-06-19T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1982-08-03T00:00:00Z", "discountedPrice": 79, "expireAt": "1989-08-13T00:00:00Z", "price": 59, "purchaseAt": "1999-07-10T00:00:00Z", "trialPrice": 100}, {"currencyCode": "TQtVhhJE", "currencyNamespace": "aPnNHLQ2", "currencyType": "VIRTUAL", "discountAmount": 10, "discountExpireAt": "1972-02-07T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1987-08-08T00:00:00Z", "discountedPrice": 1, "expireAt": "1984-03-17T00:00:00Z", "price": 95, "purchaseAt": "1976-05-18T00:00:00Z", "trialPrice": 35}, {"currencyCode": "hWXDI70E", "currencyNamespace": "iakxeGuV", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1980-10-27T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1981-07-10T00:00:00Z", "discountedPrice": 96, "expireAt": "1980-02-20T00:00:00Z", "price": 66, "purchaseAt": "1976-12-31T00:00:00Z", "trialPrice": 99}]}, "seasonType": "TIER", "sku": "g2L8KVZK", "stackable": false, "status": "ACTIVE", "tags": ["q9Wjf4KA", "qyM6Ho8M", "92T5OjRU"], "targetCurrencyCode": "6IK0F9d6", "targetNamespace": "DIvFiSSa", "thumbnailUrl": "xVK9CG3q", "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItem' test.out

#- 101 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '2fvVeO08' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'CihCXZ5K' \
    > test.out 2>&1
eval_tap $? 101 'DeleteItem' test.out

#- 102 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'Zgr3g9P0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 42, "orderNo": "109aO66D"}' \
    > test.out 2>&1
eval_tap $? 102 'AcquireItem' test.out

#- 103 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'qeScwUSv' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '3K4K5PL8' \
    > test.out 2>&1
eval_tap $? 103 'GetApp' test.out

#- 104 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'a48RYu8m' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'M4nI3nyU' \
    --body '{"carousel": [{"alt": "vxWijKtL", "previewUrl": "JDKkSIZP", "thumbnailUrl": "yDipO9mj", "type": "image", "url": "0yYb7Zpw", "videoSource": "vimeo"}, {"alt": "vaH6JyCT", "previewUrl": "f0twczKx", "thumbnailUrl": "XbScxk4E", "type": "image", "url": "Mw8SyZPx", "videoSource": "youtube"}, {"alt": "XenBay7Y", "previewUrl": "09KAseFi", "thumbnailUrl": "bBX07soe", "type": "video", "url": "7w8jx55p", "videoSource": "youtube"}], "developer": "KCxSE2fO", "forumUrl": "nRW4FHbV", "genres": ["Simulation", "Racing", "Adventure"], "localizations": {"sorIFb3D": {"announcement": "FoWoBy7X", "slogan": "v5WjALOx"}, "cs6bdSTG": {"announcement": "J6y9Cfcc", "slogan": "ysdsIGsE"}, "ZevuwhO6": {"announcement": "N45lDKZB", "slogan": "25XUI2aT"}}, "platformRequirements": {"8eRv7rsp": [{"additionals": "bjyXemXO", "directXVersion": "6drzZYxX", "diskSpace": "ZHI9ImG8", "graphics": "KpBgCqmv", "label": "ZCfxZ6nv", "osVersion": "NlxDgRlF", "processor": "00jSrAj2", "ram": "lkuQx74M", "soundCard": "tUXpYww9"}, {"additionals": "6ISboi6h", "directXVersion": "M4PwXWPB", "diskSpace": "bUVKNotB", "graphics": "kU8xDbWv", "label": "YN3kLnhN", "osVersion": "9RQlVVtF", "processor": "BuFJmo1y", "ram": "0TxMdo0p", "soundCard": "sivu7NUm"}, {"additionals": "hbMSEHrc", "directXVersion": "o6YDwuxa", "diskSpace": "BwB54eZb", "graphics": "bw2DaGbH", "label": "6LLAYhmJ", "osVersion": "LalBkKn5", "processor": "V6lwBh2O", "ram": "ixLU9eoG", "soundCard": "l5HG9z8w"}], "Mkw4RsWT": [{"additionals": "AQ4fCcsP", "directXVersion": "6X4fbgUo", "diskSpace": "A3CeD7nR", "graphics": "Ejd4tgVP", "label": "WNoodFQX", "osVersion": "VSUwzULZ", "processor": "z81TcFXm", "ram": "TDiWO4AO", "soundCard": "syMy8f4K"}, {"additionals": "PhWziMNq", "directXVersion": "wzizsCVi", "diskSpace": "dgOyvKEw", "graphics": "pF0CsSFr", "label": "uc45AOch", "osVersion": "FqwF5Dms", "processor": "46apsGmw", "ram": "J6ryRrPw", "soundCard": "r29tV41A"}, {"additionals": "WsVGTJqK", "directXVersion": "0x2bNXbK", "diskSpace": "BnxMz7ga", "graphics": "aDVknoY3", "label": "aNDFh3fM", "osVersion": "h35lxL7Y", "processor": "jMbpGP2z", "ram": "aOJegVKJ", "soundCard": "LaLSCRzm"}], "zAHo6Fm7": [{"additionals": "S1XLBUFu", "directXVersion": "N0UpFuzc", "diskSpace": "M26Lx5gE", "graphics": "GGRJoBnm", "label": "YBHpzPXu", "osVersion": "5xMnV3yg", "processor": "8qMoD6P6", "ram": "QQuJkCEO", "soundCard": "OUJzy3Dy"}, {"additionals": "TLBmXify", "directXVersion": "M8ZilpOA", "diskSpace": "2ZPJK0CO", "graphics": "6PQgNncK", "label": "E2ZLap6E", "osVersion": "pC3qPVXT", "processor": "F9JovmfT", "ram": "6HpxlIIF", "soundCard": "SIaXG1Aa"}, {"additionals": "2oyw6tcl", "directXVersion": "QA0xbcs7", "diskSpace": "xLXjjwTM", "graphics": "PFMhyAki", "label": "gd4LcYif", "osVersion": "RxKJr1YG", "processor": "mJNUzupL", "ram": "fBP4HWt1", "soundCard": "zolElLMn"}]}, "platforms": ["Windows", "Android", "Windows"], "players": ["MMO", "MMO", "Coop"], "primaryGenre": "Simulation", "publisher": "sncgj5M4", "releaseDate": "1974-07-03T00:00:00Z", "websiteUrl": "PHwKo2NE"}' \
    > test.out 2>&1
eval_tap $? 104 'UpdateApp' test.out

#- 105 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'CQ2sQI0g' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'b3P85ZPm' \
    > test.out 2>&1
eval_tap $? 105 'DisableItem' test.out

#- 106 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'QSugaXZu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetItemDynamicData' test.out

#- 107 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'C0l3m7Ym' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CtwY6zxg' \
    > test.out 2>&1
eval_tap $? 107 'EnableItem' test.out

#- 108 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'CAysOi2U' \
    --itemId 'JYookJwv' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8qqnwMyu' \
    > test.out 2>&1
eval_tap $? 108 'FeatureItem' test.out

#- 109 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '4dyXcrDo' \
    --itemId 'woHGBiKU' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6lADWEH3' \
    > test.out 2>&1
eval_tap $? 109 'DefeatureItem' test.out

#- 110 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'XRSOesXF' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'OfEyGgzC' \
    --populateBundle  \
    --region 'EkocQOWy' \
    --storeId 'tG08ZNqx' \
    > test.out 2>&1
eval_tap $? 110 'GetLocaleItem' test.out

#- 111 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'kbO52zyq' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HI8pglzy' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 48, "comparison": "includes", "name": "X72fjZrl", "predicateType": "SeasonTierPredicate", "value": "ib8Z5E71", "values": ["HCb86Ljv", "gGQz2uso", "10OKjwsX"]}, {"anyOf": 90, "comparison": "isNot", "name": "4mNEDKXo", "predicateType": "SeasonTierPredicate", "value": "UPMC4NG7", "values": ["z2saIUqt", "Aawm8TD3", "nMWGvTUH"]}, {"anyOf": 72, "comparison": "includes", "name": "ibuZO0PS", "predicateType": "EntitlementPredicate", "value": "LffKTPiG", "values": ["0E4l1iXo", "G4GsFOKh", "ulPeiZB7"]}]}, {"operator": "or", "predicates": [{"anyOf": 94, "comparison": "includes", "name": "UkZ8QN3R", "predicateType": "SeasonPassPredicate", "value": "pm11WL2h", "values": ["Vr7eAAAI", "OKsIgIcG", "82tGHbMM"]}, {"anyOf": 66, "comparison": "isLessThan", "name": "TVAps2SX", "predicateType": "SeasonTierPredicate", "value": "gxwIJios", "values": ["31F0NpB1", "MqAcQcmW", "NsCCVgCF"]}, {"anyOf": 3, "comparison": "excludes", "name": "KKK9BCnB", "predicateType": "SeasonPassPredicate", "value": "Gg2oXmc3", "values": ["gO70u0WV", "EezvrXzP", "WInFw1gM"]}]}, {"operator": "and", "predicates": [{"anyOf": 35, "comparison": "is", "name": "K6VNf9Vg", "predicateType": "SeasonPassPredicate", "value": "NCmuKJTi", "values": ["iK7iiG40", "1loGEluv", "Je1NmnNe"]}, {"anyOf": 54, "comparison": "excludes", "name": "seUTHulK", "predicateType": "SeasonPassPredicate", "value": "8JCJ3Ums", "values": ["UEeSaxqM", "kBLgVAxT", "aWTdYhDV"]}, {"anyOf": 4, "comparison": "is", "name": "1P45lGS8", "predicateType": "SeasonPassPredicate", "value": "b4WiF5XV", "values": ["01wAuVLj", "xvZIjM8f", "djCZpHr9"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 111 'UpdateItemPurchaseCondition' test.out

#- 112 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '7d2RlU8B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "HwskApn7"}' \
    > test.out 2>&1
eval_tap $? 112 'ReturnItem' test.out

#- 113 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --name 'IiieGYWS' \
    --offset '98' \
    --tag 'z14Ym7hk' \
    > test.out 2>&1
eval_tap $? 113 'QueryKeyGroups' test.out

#- 114 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "N7IkQBWf", "name": "x5P57s5q", "status": "ACTIVE", "tags": ["DGLkAJDP", "h0Hjoa4l", "i8x27UFh"]}' \
    > test.out 2>&1
eval_tap $? 114 'CreateKeyGroup' test.out

#- 115 GetKeyGroupByBoothName
eval_tap 0 115 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 116 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'aL4bxBl3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetKeyGroup' test.out

#- 117 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '1CYvfqBc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "vMXaBYZR", "name": "xnQpZR7z", "status": "INACTIVE", "tags": ["yDHEm3mS", "LTB9O7Gw", "1uKJs5o7"]}' \
    > test.out 2>&1
eval_tap $? 117 'UpdateKeyGroup' test.out

#- 118 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'QXNTVVQu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetKeyGroupDynamic' test.out

#- 119 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '6SKCu2jZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '98' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 119 'ListKeys' test.out

#- 120 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'xaKP0fQy' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 120 'UploadKeys' test.out

#- 121 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '75jx6JQJ' \
    --limit '98' \
    --offset '51' \
    --orderNos '6BI3hWYr,F1Ry046x,CxEswyhi' \
    --sortBy 'heyjjQnw' \
    --startTime 'hRMPi83d' \
    --status 'CLOSED' \
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
    --orderNo 'TBJSanSJ' \
    > test.out 2>&1
eval_tap $? 123 'GetOrder' test.out

#- 124 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pHC0tRGi' \
    --body '{"description": "ujE7zvum"}' \
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
    --body '{"dryRun": true, "notifyUrl": "7JdhaykY", "privateKey": "o5IqkHrG"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdatePaymentCallbackConfig' test.out

#- 127 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '6J9uhMTm' \
    --externalId 'tOevqgKU' \
    --limit '97' \
    --notificationSource 'ALIPAY' \
    --notificationType 'Mw0WG0Gm' \
    --offset '57' \
    --paymentOrderNo 'rM3jeV8x' \
    --startDate 'Pa8TDmBz' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 127 'QueryPaymentNotifications' test.out

#- 128 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId '0JRr1tDT' \
    --limit '15' \
    --offset '13' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 128 'QueryPaymentOrders' test.out

#- 129 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "i9UTbSS4", "currencyNamespace": "STHIYlxh", "customParameters": {"sgY0FTLP": {}, "CcTg7LOf": {}, "hdD4IDup": {}}, "description": "omTAXR68", "extOrderNo": "ajXSrRep", "extUserId": "jzABXyh2", "itemType": "SEASON", "language": "wrIG-PF", "metadata": {"lb041aOs": "AMEmaDsC", "lyxl8MvJ": "uwOi3YmE", "7dQoFExb": "bPVPMsAv"}, "notifyUrl": "yCkigQQb", "omitNotification": true, "platform": "G1qNfTXt", "price": 54, "recurringPaymentOrderNo": "3cdBN43N", "region": "HDcROc4W", "returnUrl": "Ay64fasW", "sandbox": false, "sku": "bMEaha5F", "subscriptionId": "n4XeLYm4", "targetNamespace": "cAtPuFQ8", "targetUserId": "E1jbRvrE", "title": "zjp0cykF"}' \
    > test.out 2>&1
eval_tap $? 129 'CreatePaymentOrderByDedicated' test.out

#- 130 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'lvRBy4qg' \
    > test.out 2>&1
eval_tap $? 130 'ListExtOrderNoByExtTxId' test.out

#- 131 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7d9IcIlB' \
    > test.out 2>&1
eval_tap $? 131 'GetPaymentOrder' test.out

#- 132 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '2dhHRsKo' \
    --body '{"extTxId": "rhdqnx0H", "paymentMethod": "9DZyFJhD", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 132 'ChargePaymentOrder' test.out

#- 133 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '63h01sdD' \
    --body '{"description": "hDeOT8Oa"}' \
    > test.out 2>&1
eval_tap $? 133 'RefundPaymentOrderByDedicated' test.out

#- 134 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'i4MT6K5L' \
    --body '{"amount": 57, "currencyCode": "CUb29DF5", "notifyType": "CHARGE", "paymentProvider": "WXPAY", "salesTax": 63, "vat": 73}' \
    > test.out 2>&1
eval_tap $? 134 'SimulatePaymentOrderNotification' test.out

#- 135 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WUKVLRsT' \
    > test.out 2>&1
eval_tap $? 135 'GetPaymentOrderChargeStatus' test.out

#- 136 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 136 'GetPlatformWalletConfig' test.out

#- 137 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    --body '{"allowedBalanceOrigins": ["Nintendo", "GooglePlay", "System"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdatePlatformWalletConfig' test.out

#- 138 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 138 'ResetPlatformWalletConfig' test.out

#- 139 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "5e2eUGLl", "eventTopic": "YsxQuXjC", "maxAwarded": 95, "maxAwardedPerUser": 1, "namespaceExpression": "d7zhavbi", "rewardCode": "L90maAKC", "rewardConditions": [{"condition": "4O8JIoqr", "conditionName": "ddXvmCI8", "eventName": "LR8RuLbO", "rewardItems": [{"duration": 53, "itemId": "qhcadkPK", "quantity": 85}, {"duration": 51, "itemId": "ur1BSBrH", "quantity": 43}, {"duration": 74, "itemId": "T8XnhFbl", "quantity": 10}]}, {"condition": "mVEZrwbm", "conditionName": "BPPOSyWR", "eventName": "Xl1OxB3x", "rewardItems": [{"duration": 17, "itemId": "rLSuwfJQ", "quantity": 43}, {"duration": 20, "itemId": "ustjpSR7", "quantity": 39}, {"duration": 98, "itemId": "bhnJU336", "quantity": 100}]}, {"condition": "tFz99rIY", "conditionName": "nKkv5x1u", "eventName": "NlqUqSQG", "rewardItems": [{"duration": 45, "itemId": "R4HSKdCn", "quantity": 81}, {"duration": 79, "itemId": "z4e5LU3L", "quantity": 27}, {"duration": 59, "itemId": "XZR21iG8", "quantity": 15}]}], "userIdExpression": "tSdxeSLu"}' \
    > test.out 2>&1
eval_tap $? 139 'CreateReward' test.out

#- 140 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'CsnCpvp7' \
    --limit '91' \
    --offset '76' \
    --sortBy 'namespace:asc,namespace' \
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
    --rewardId 'ZGixGA6A' \
    > test.out 2>&1
eval_tap $? 143 'GetReward' test.out

#- 144 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'gA74kdNp' \
    --body '{"description": "UNzTMjjF", "eventTopic": "tWNsy6zl", "maxAwarded": 64, "maxAwardedPerUser": 52, "namespaceExpression": "Ls526JrD", "rewardCode": "MPDX1JCg", "rewardConditions": [{"condition": "kFKKek0H", "conditionName": "0Wc101ov", "eventName": "SYfKsqzN", "rewardItems": [{"duration": 16, "itemId": "eHbZ2rjz", "quantity": 7}, {"duration": 34, "itemId": "2l2THiLp", "quantity": 70}, {"duration": 45, "itemId": "NMg8deng", "quantity": 76}]}, {"condition": "3OKBkfuX", "conditionName": "bpZJOiEd", "eventName": "Uy8E2TAh", "rewardItems": [{"duration": 21, "itemId": "sZP8CNcF", "quantity": 1}, {"duration": 77, "itemId": "0MK4xJIx", "quantity": 83}, {"duration": 64, "itemId": "58IXsQoY", "quantity": 69}]}, {"condition": "7rD1XhMm", "conditionName": "MENHY3M6", "eventName": "WoNlxai8", "rewardItems": [{"duration": 71, "itemId": "NjxRCqm1", "quantity": 9}, {"duration": 84, "itemId": "3kE7WqIg", "quantity": 68}, {"duration": 87, "itemId": "ciafs7ef", "quantity": 55}]}], "userIdExpression": "1huCeQIV"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateReward' test.out

#- 145 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'HP2ughkZ' \
    > test.out 2>&1
eval_tap $? 145 'DeleteReward' test.out

#- 146 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '6G1Svm9A' \
    --body '{"payload": {"2oaDd16t": {}, "Qj6DZf8R": {}, "fFmo6DB0": {}}}' \
    > test.out 2>&1
eval_tap $? 146 'CheckEventCondition' test.out

#- 147 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'KHtVGDRP' \
    --body '{"conditionName": "fX7Mim8K", "userId": "wt5s25bF"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteRewardConditionRecord' test.out

#- 148 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'rRICoXiU' \
    --limit '100' \
    --offset '98' \
    --start 'FEwNB1Mb' \
    --storeId 'oIG4lEMM' \
    --viewId 'l7mh4yc0' \
    > test.out 2>&1
eval_tap $? 148 'QuerySections' test.out

#- 149 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'irHS57gr' \
    --body '{"active": true, "displayOrder": 86, "endDate": "1980-07-30T00:00:00Z", "ext": {"GOuH5x4Z": {}, "gatkWtCG": {}, "78eKHW7J": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 63, "itemCount": 42, "rule": "SEQUENCE"}, "items": [{"id": "lAilwA3b", "sku": "wigiiGKl"}, {"id": "m8XfgYcj", "sku": "S2H0UCE0"}, {"id": "NLbqtKhN", "sku": "ktmUbW8T"}], "localizations": {"oMmwnRz7": {"description": "hhqVgwSM", "localExt": {"DpKAR3eB": {}, "jfoZfz70": {}, "O1ixtmGG": {}}, "longDescription": "BIFAPzkB", "title": "5U5LEdEu"}, "I5XlsbdW": {"description": "nw8pn6Fu", "localExt": {"DgM9vI5t": {}, "1Macersw": {}, "Uuu3xeWB": {}}, "longDescription": "d2AoDqna", "title": "DtsN9V3q"}, "e46CzTTX": {"description": "kEhQ51Be", "localExt": {"9FF4ENG4": {}, "npjxvMJR": {}, "ktxpxMny": {}}, "longDescription": "J1i71oKw", "title": "uCuIbsVO"}}, "name": "tdr0LGBk", "rotationType": "CUSTOM", "startDate": "1995-05-31T00:00:00Z", "viewId": "WnN03UVe"}' \
    > test.out 2>&1
eval_tap $? 149 'CreateSection' test.out

#- 150 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K5JJOsIf' \
    > test.out 2>&1
eval_tap $? 150 'PurgeExpiredSection' test.out

#- 151 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'TU9DZ8oD' \
    --storeId 'sopKP0Fa' \
    > test.out 2>&1
eval_tap $? 151 'GetSection' test.out

#- 152 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'AdvU2owt' \
    --storeId 'elVpjlSL' \
    --body '{"active": true, "displayOrder": 0, "endDate": "1975-12-13T00:00:00Z", "ext": {"2ZLOf4x0": {}, "I6stqdn1": {}, "XjGBOza8": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 85, "itemCount": 3, "rule": "SEQUENCE"}, "items": [{"id": "ys25qTlQ", "sku": "LWKh8J8j"}, {"id": "zjQLc1zy", "sku": "i6sxEmSf"}, {"id": "3u5K2Nzo", "sku": "SplAr83i"}], "localizations": {"jzHpqVA9": {"description": "wodz1vz4", "localExt": {"Wh6IZ6Ts": {}, "GHpJZJh7": {}, "M8OR9m3Q": {}}, "longDescription": "UPF3s3lU", "title": "hhNPC8MR"}, "0KCR6sPv": {"description": "XSGQZdVq", "localExt": {"OWQ1nan3": {}, "fepexrQU": {}, "yhsXKOe3": {}}, "longDescription": "RhS7hi2G", "title": "fCStTJ2o"}, "uCFtu5wz": {"description": "KAoWBWss", "localExt": {"uvye3X6R": {}, "XOj4rGbS": {}, "TLBOPAmF": {}}, "longDescription": "1mw3VPdb", "title": "6HJhoZ9w"}}, "name": "JumYUzeA", "rotationType": "CUSTOM", "startDate": "1990-04-13T00:00:00Z", "viewId": "fd6avECw"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSection' test.out

#- 153 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'I2I8GUKo' \
    --storeId '4Eo7LQuX' \
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
    --body '{"defaultLanguage": "BbH6xZFs", "defaultRegion": "ViDxDC1s", "description": "s1MDnc4q", "supportedLanguages": ["Wb1nfwb0", "lN52X6oW", "cZOfnS84"], "supportedRegions": ["twhePwJJ", "jSI7MPN7", "emFIBtKB"], "title": "0UMoTSle"}' \
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
    --storeId 'QxQpd1Bn' \
    > test.out 2>&1
eval_tap $? 161 'GetStore' test.out

#- 162 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u33tQgtB' \
    --body '{"defaultLanguage": "XUg8hJeW", "defaultRegion": "enEk4vME", "description": "nXSXu2hp", "supportedLanguages": ["twKFSSNo", "zcnoRqLP", "u27jmt08"], "supportedRegions": ["yGo4rfbh", "HeLUXNtu", "BdvS3JzV"], "title": "BYAw8YS2"}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateStore' test.out

#- 163 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '7oZ5byDt' \
    > test.out 2>&1
eval_tap $? 163 'DeleteStore' test.out

#- 164 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Fx7UVvkF' \
    --action 'DELETE' \
    --itemSku 'q4g7QUxi' \
    --itemType 'OPTIONBOX' \
    --limit '48' \
    --offset '21' \
    --selected  \
    --sortBy 'createdAt:asc,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'qexIzlRn' \
    --updatedAtStart 'VI4P7W2H' \
    > test.out 2>&1
eval_tap $? 164 'QueryChanges' test.out

#- 165 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jC4YKKkI' \
    > test.out 2>&1
eval_tap $? 165 'PublishAll' test.out

#- 166 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KPd3hSD2' \
    > test.out 2>&1
eval_tap $? 166 'PublishSelected' test.out

#- 167 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kqGLW3nR' \
    > test.out 2>&1
eval_tap $? 167 'SelectAllRecords' test.out

#- 168 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GJFz19Wg' \
    --action 'DELETE' \
    --itemSku 'NosPczTR' \
    --itemType 'BUNDLE' \
    --type 'STORE' \
    --updatedAtEnd 'J8Lmqu72' \
    --updatedAtStart 'ncFipy2v' \
    > test.out 2>&1
eval_tap $? 168 'GetStatistic' test.out

#- 169 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mqGEf9ua' \
    > test.out 2>&1
eval_tap $? 169 'UnselectAllRecords' test.out

#- 170 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'atmuc3oj' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QpimO3fA' \
    > test.out 2>&1
eval_tap $? 170 'SelectRecord' test.out

#- 171 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId '5WgI8quI' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EZ22RIMN' \
    > test.out 2>&1
eval_tap $? 171 'UnselectRecord' test.out

#- 172 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '7ANcz54n' \
    --targetStoreId 'IUtrr1tT' \
    > test.out 2>&1
eval_tap $? 172 'CloneStore' test.out

#- 173 ExportStore
eval_tap 0 173 'ExportStore # SKIP deprecated' test.out

#- 174 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'eeBf92tR' \
    --limit '12' \
    --offset '95' \
    --sku 'WAfvpcQr' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'C9wYU99H' \
    > test.out 2>&1
eval_tap $? 174 'QuerySubscriptions' test.out

#- 175 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mdypxXgm' \
    > test.out 2>&1
eval_tap $? 175 'RecurringChargeSubscription' test.out

#- 176 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'LHLeBhHU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'GetTicketDynamic' test.out

#- 177 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'aIERB1LW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "B7Krtgp0"}' \
    > test.out 2>&1
eval_tap $? 177 'DecreaseTicketSale' test.out

#- 178 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'ImaY0GuG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetTicketBoothID' test.out

#- 179 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'tTmihvMl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 62, "orderNo": "EkHk4MFm"}' \
    > test.out 2>&1
eval_tap $? 179 'IncreaseTicketSale' test.out

#- 180 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JDgI24v4' \
    --body '{"achievements": [{"id": "uIC8Dhjb", "value": 73}, {"id": "MsxEhFG7", "value": 35}, {"id": "zAwcFpJc", "value": 99}], "steamUserId": "QOx6adSg"}' \
    > test.out 2>&1
eval_tap $? 180 'UnlockSteamUserAchievement' test.out

#- 181 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'X7KlMThw' \
    --xboxUserId 'FnCU4q2E' \
    > test.out 2>&1
eval_tap $? 181 'GetXblUserAchievements' test.out

#- 182 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'UBnFIR5P' \
    --body '{"achievements": [{"id": "3NOXXeIQ", "percentComplete": 74}, {"id": "kfS2mXwl", "percentComplete": 13}, {"id": "KFl2lxAB", "percentComplete": 23}], "serviceConfigId": "a0OtuEnJ", "titleId": "MM988Ut5", "xboxUserId": "kvyLtaIj"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateXblUserAchievement' test.out

#- 183 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'yqujWQJh' \
    > test.out 2>&1
eval_tap $? 183 'AnonymizeCampaign' test.out

#- 184 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HiakINWh' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeEntitlement' test.out

#- 185 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'MCmuApDS' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeFulfillment' test.out

#- 186 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pg9a4z8O' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeIntegration' test.out

#- 187 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZkD2KYM6' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeOrder' test.out

#- 188 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '3cThPY07' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizePayment' test.out

#- 189 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'jpILu91S' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizeSubscription' test.out

#- 190 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'AdF3xsXB' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeWallet' test.out

#- 191 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 't2cDd3ps' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 191 'GetUserDLC' test.out

#- 192 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'o7YUX4Fp' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'NvG2TuvD' \
    --features 'IRwPUk0s,9daTYHIV,Bs5frtZ0' \
    --itemId 'z8lhmGs0,POnUaTgz,JA7qmAAD' \
    --limit '82' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 192 'QueryUserEntitlements' test.out

#- 193 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '7YCPGHF1' \
    --body '[{"endDate": "1995-12-03T00:00:00Z", "grantedCode": "MW6Zj8uH", "itemId": "3brnW4SC", "itemNamespace": "jyk6KTgi", "language": "oDDy_fZ", "quantity": 61, "region": "XZvRIrNn", "source": "REWARD", "startDate": "1988-06-03T00:00:00Z", "storeId": "yd9YBWVL"}, {"endDate": "1972-05-08T00:00:00Z", "grantedCode": "fb9FCPJS", "itemId": "FPVKLU3s", "itemNamespace": "qWRqc9TA", "language": "nNAw", "quantity": 90, "region": "7QopAuxk", "source": "REDEEM_CODE", "startDate": "1972-08-30T00:00:00Z", "storeId": "gsUF6tPo"}, {"endDate": "1977-03-13T00:00:00Z", "grantedCode": "i9o08Lyd", "itemId": "4ksyHcc2", "itemNamespace": "davM1Vff", "language": "AOM-bYpJ_135", "quantity": 87, "region": "ppQkVnYO", "source": "REDEEM_CODE", "startDate": "1978-11-04T00:00:00Z", "storeId": "rRGzn1IE"}]' \
    > test.out 2>&1
eval_tap $? 193 'GrantUserEntitlement' test.out

#- 194 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '1UEg4bm4' \
    --activeOnly  \
    --appId 'mrNIDe8p' \
    > test.out 2>&1
eval_tap $? 194 'GetUserAppEntitlementByAppId' test.out

#- 195 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '74NJcu4J' \
    --activeOnly  \
    --limit '59' \
    --offset '1' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 195 'QueryUserEntitlementsByAppType' test.out

#- 196 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fRnQ4Nxy' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId '0SwYynhE' \
    > test.out 2>&1
eval_tap $? 196 'GetUserEntitlementByItemId' test.out

#- 197 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'vR5aG1dz' \
    --ids 'IXfyM8BW,6GLo8DvJ,UTdtP8zQ' \
    > test.out 2>&1
eval_tap $? 197 'GetUserActiveEntitlementsByItemIds' test.out

#- 198 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Upc6dKAP' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --sku 'XCWqzoWG' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementBySku' test.out

#- 199 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JvczKI4G' \
    --appIds 'TWeRLlSm,K9nMTeZr,eSkOUT5W' \
    --itemIds 'oJ0mqB6Y,LevnFDCg,lKDySiuK' \
    --skus '6EsGlMwO,Cn8zW1Xx,G6hg55se' \
    > test.out 2>&1
eval_tap $? 199 'ExistsAnyUserActiveEntitlement' test.out

#- 200 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'WknRvEf5' \
    --itemIds 'FNqpo0qi,GkB6SL9v,FF4uStIU' \
    > test.out 2>&1
eval_tap $? 200 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 201 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SQEkCOfs' \
    --appId '2hh5wnmv' \
    > test.out 2>&1
eval_tap $? 201 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 202 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUsX7I5f' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'U57fL3Bn' \
    > test.out 2>&1
eval_tap $? 202 'GetUserEntitlementOwnershipByItemId' test.out

#- 203 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '15fEQFoo' \
    --ids 'tnSpY1cW,OmutAnvZ,uKUFqEjI' \
    > test.out 2>&1
eval_tap $? 203 'GetUserEntitlementOwnershipByItemIds' test.out

#- 204 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ay3dJ0SE' \
    --entitlementClazz 'MEDIA' \
    --sku 'P3HEDTYV' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipBySku' test.out

#- 205 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'BNcCP2Jy' \
    --entitlementIds 'v0iuky7N' \
    > test.out 2>&1
eval_tap $? 205 'RevokeUserEntitlements' test.out

#- 206 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'd0PHTXjI' \
    --namespace "$AB_NAMESPACE" \
    --userId '2GCGYG4X' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlement' test.out

#- 207 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'TROcTTwH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z1EJcpYb' \
    --body '{"endDate": "1972-04-09T00:00:00Z", "nullFieldList": ["keCdnUgD", "he7cIfin", "EtcvaDjC"], "startDate": "1985-06-28T00:00:00Z", "status": "INACTIVE", "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 207 'UpdateUserEntitlement' test.out

#- 208 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'Y2mPZ5n1' \
    --namespace "$AB_NAMESPACE" \
    --userId '9PpnQiBD' \
    --body '{"options": ["Yq5I2AmD", "mc3On1R7", "6Dn6bbw2"], "requestId": "sFCIQ8TF", "useCount": 80}' \
    > test.out 2>&1
eval_tap $? 208 'ConsumeUserEntitlement' test.out

#- 209 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'c8dBDz7M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AU6p9n5j' \
    > test.out 2>&1
eval_tap $? 209 'DisableUserEntitlement' test.out

#- 210 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId '3ciCzHtt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yk6vAigy' \
    > test.out 2>&1
eval_tap $? 210 'EnableUserEntitlement' test.out

#- 211 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Vk1cEhSx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JiMn4EOI' \
    > test.out 2>&1
eval_tap $? 211 'GetUserEntitlementHistories' test.out

#- 212 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'wSfXGzVS' \
    --namespace "$AB_NAMESPACE" \
    --userId '7VDxNCoB' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserEntitlement' test.out

#- 213 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'E6j4WHxw' \
    --body '{"duration": 85, "endDate": "1974-08-07T00:00:00Z", "itemId": "gKZFlguQ", "itemSku": "95b01dRC", "language": "yKcImgg3", "order": {"currency": {"currencyCode": "uII1aSJ8", "currencySymbol": "IKoi8wf5", "currencyType": "REAL", "decimals": 92, "namespace": "h25CTow3"}, "ext": {"fmp7XubN": {}, "1vIa7AJI": {}, "oaTGeSi7": {}}, "free": false}, "orderNo": "OLYnlZ8N", "origin": "Other", "quantity": 72, "region": "ptOst0oM", "source": "GIFT", "startDate": "1983-04-17T00:00:00Z", "storeId": "KEwxKBP1"}' \
    > test.out 2>&1
eval_tap $? 213 'FulfillItem' test.out

#- 214 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'TlfZldVI' \
    --body '{"code": "SFRraDO2", "language": "Au_olrU-xp", "region": "Tg2WNhel"}' \
    > test.out 2>&1
eval_tap $? 214 'RedeemCode' test.out

#- 215 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'jnBI4Qzu' \
    --body '{"origin": "Stadia", "rewards": [{"currency": {"currencyCode": "8trfNALc", "namespace": "soCvehzb"}, "item": {"itemId": "wKaXN7Su", "itemSku": "URmF945p", "itemType": "qYl7jQO7"}, "quantity": 6, "type": "CURRENCY"}, {"currency": {"currencyCode": "E0FlqyEI", "namespace": "bHj85lY7"}, "item": {"itemId": "ws58ZHLN", "itemSku": "ToTwr9ul", "itemType": "YC1QntbS"}, "quantity": 13, "type": "CURRENCY"}, {"currency": {"currencyCode": "dHmgL59W", "namespace": "B3nMzJMi"}, "item": {"itemId": "eDJCHhBu", "itemSku": "VgNJ5Zsz", "itemType": "eKFX0F5Z"}, "quantity": 83, "type": "CURRENCY"}], "source": "OTHER"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillRewards' test.out

#- 216 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'p1DcWDj7' \
    --endTime '7y2wAIgf' \
    --limit '31' \
    --offset '35' \
    --productId 'bjhPZdzT' \
    --startTime 'VIm8FBH6' \
    --status 'FAILED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 216 'QueryUserIAPOrders' test.out

#- 217 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xy36WvB1' \
    > test.out 2>&1
eval_tap $? 217 'QueryAllUserIAPOrders' test.out

#- 218 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCztigQc' \
    --endTime 'KZpXXfKM' \
    --limit '65' \
    --offset '34' \
    --startTime 'Bc4rSub4' \
    --status 'PENDING' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPConsumeHistory' test.out

#- 219 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZamdJIWk' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "Of_Yd", "productId": "x2PIr5Xm", "region": "bJIPV1rU", "type": "GOOGLE"}' \
    > test.out 2>&1
eval_tap $? 219 'MockFulfillIAPItem' test.out

#- 220 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'iHeT6uvr' \
    --itemId 'QtfpepN3' \
    --limit '85' \
    --offset '77' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserOrders' test.out

#- 221 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'b27ZGWAK' \
    --body '{"currencyCode": "Mp6uza6G", "currencyNamespace": "WUHRAFkM", "discountedPrice": 33, "ext": {"YIeXzURo": {}, "DkT9cyUZ": {}, "cdfjKG8m": {}}, "itemId": "JAC3Z32t", "language": "dmVILw9P", "options": {"skipPriceValidation": false}, "platform": "IOS", "price": 45, "quantity": 20, "region": "UWRLJcZz", "returnUrl": "U1cuHkXD", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 221 'AdminCreateUserOrder' test.out

#- 222 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9tUEMoH' \
    --itemId 'xohDiPqc' \
    > test.out 2>&1
eval_tap $? 222 'CountOfPurchasedItem' test.out

#- 223 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bxN0Nmza' \
    --userId 'NFRDY3kP' \
    > test.out 2>&1
eval_tap $? 223 'GetUserOrder' test.out

#- 224 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SpdAwfvr' \
    --userId '2YvSWrXu' \
    --body '{"status": "CHARGED", "statusReason": "ThnEvqOv"}' \
    > test.out 2>&1
eval_tap $? 224 'UpdateUserOrderStatus' test.out

#- 225 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gSeE8egl' \
    --userId 'KfQChO34' \
    > test.out 2>&1
eval_tap $? 225 'FulfillUserOrder' test.out

#- 226 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'v1s7XWZT' \
    --userId 'kPJ52hvz' \
    > test.out 2>&1
eval_tap $? 226 'GetUserOrderGrant' test.out

#- 227 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vknf70MD' \
    --userId 'AK1JwpRJ' \
    > test.out 2>&1
eval_tap $? 227 'GetUserOrderHistories' test.out

#- 228 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nOzPC7cO' \
    --userId 'garitzfy' \
    --body '{"additionalData": {"cardSummary": "frhjw3cG"}, "authorisedTime": "1997-10-18T00:00:00Z", "chargebackReversedTime": "1987-12-25T00:00:00Z", "chargebackTime": "1979-10-30T00:00:00Z", "chargedTime": "1982-08-18T00:00:00Z", "createdTime": "1997-10-04T00:00:00Z", "currency": {"currencyCode": "erD88EOi", "currencySymbol": "LUIsv6kx", "currencyType": "VIRTUAL", "decimals": 5, "namespace": "tGYiSm9O"}, "customParameters": {"KhbxN0tc": {}, "86W3WEze": {}, "VoKMTHYN": {}}, "extOrderNo": "ysQim7CO", "extTxId": "p3tZstfp", "extUserId": "G1hALKAF", "issuedAt": "1989-08-29T00:00:00Z", "metadata": {"yUOVnRPG": "RHUtMM7f", "dHKPCeQQ": "pTB2yBdm", "5RiGTwI2": "FZAeB8NI"}, "namespace": "m9xG3MT7", "nonceStr": "zD78OIDh", "paymentMethod": "UJR8d4Dc", "paymentMethodFee": 90, "paymentOrderNo": "oZfLnkgP", "paymentProvider": "XSOLLA", "paymentProviderFee": 37, "paymentStationUrl": "dvOuKhlZ", "price": 83, "refundedTime": "1974-02-19T00:00:00Z", "salesTax": 24, "sandbox": false, "sku": "8g8YKXQ4", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "iKMco9yx", "subscriptionId": "RlKNf2el", "subtotalPrice": 85, "targetNamespace": "eWurODEE", "targetUserId": "nStAEtNi", "tax": 45, "totalPrice": 89, "totalTax": 41, "txEndTime": "1972-12-12T00:00:00Z", "type": "6ilQ62dN", "userId": "N8NQxXG7", "vat": 82}' \
    > test.out 2>&1
eval_tap $? 228 'ProcessUserOrderNotification' test.out

#- 229 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Zk0yEmOJ' \
    --userId 'WYMYaqOc' \
    > test.out 2>&1
eval_tap $? 229 'DownloadUserOrderReceipt' test.out

#- 230 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'w1ozI9iY' \
    --body '{"currencyCode": "z4StrtUT", "currencyNamespace": "RaEYQk4j", "customParameters": {"Nko7u3ZB": {}, "oBYlwJdq": {}, "Gy0Wy0zW": {}}, "description": "OivzYawC", "extOrderNo": "0Vf9lLQc", "extUserId": "MR1jiHwM", "itemType": "COINS", "language": "TDj_Goif", "metadata": {"ZZCy4efl": "kgX2QOH2", "5eA5rRrL": "Xjk0wdkf", "FYutfqpa": "vmUdW5fw"}, "notifyUrl": "XPkODbgf", "omitNotification": true, "platform": "lmFYs9Ab", "price": 28, "recurringPaymentOrderNo": "9xKJVjck", "region": "OkWxsEUZ", "returnUrl": "easYwPfR", "sandbox": false, "sku": "FrH7bk9L", "subscriptionId": "fc0k2vGt", "title": "AfzG3uM7"}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserPaymentOrder' test.out

#- 231 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uFDInj8C' \
    --userId 'YuKoqBNz' \
    --body '{"description": "6rn2FVu9"}' \
    > test.out 2>&1
eval_tap $? 231 'RefundUserPaymentOrder' test.out

#- 232 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'xAFNuw4y' \
    --body '{"code": "chAlvBLl", "orderNo": "FKupaqkH"}' \
    > test.out 2>&1
eval_tap $? 232 'ApplyUserRedemption' test.out

#- 233 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q3I3m9Cw' \
    --chargeStatus 'NEVER' \
    --itemId '87ZEjY0t' \
    --limit '48' \
    --offset '6' \
    --sku 'J85WjpQX' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserSubscriptions' test.out

#- 234 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '18P4CLOs' \
    --excludeSystem  \
    --limit '24' \
    --offset '4' \
    --subscriptionId 'mD1oF949' \
    > test.out 2>&1
eval_tap $? 234 'GetUserSubscriptionActivities' test.out

#- 235 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'R0VJz58Q' \
    --body '{"grantDays": 85, "itemId": "KiCo2kBH", "language": "mfNRsPvi", "reason": "ppc35UbP", "region": "A1sDy0XH", "source": "s0JOxAmS"}' \
    > test.out 2>&1
eval_tap $? 235 'PlatformSubscribeSubscription' test.out

#- 236 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'At3gQM2n' \
    --itemId 'o3LnEgDZ' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 237 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nIGdnaBx' \
    --userId 'Fq67M24v' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscription' test.out

#- 238 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'g2d38Hif' \
    --userId 'Z7JOOAlO' \
    > test.out 2>&1
eval_tap $? 238 'DeleteUserSubscription' test.out

#- 239 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zN3FQTVV' \
    --userId 'q0LbcBg1' \
    --force  \
    --body '{"immediate": false, "reason": "y8LFPZdT"}' \
    > test.out 2>&1
eval_tap $? 239 'CancelSubscription' test.out

#- 240 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tMxr7wkX' \
    --userId 'CIyaBdUS' \
    --body '{"grantDays": 84, "reason": "neOkh1nj"}' \
    > test.out 2>&1
eval_tap $? 240 'GrantDaysToSubscription' test.out

#- 241 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5CAxkPIp' \
    --userId '508RwRpJ' \
    --excludeFree  \
    --limit '81' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 241 'GetUserSubscriptionBillingHistories' test.out

#- 242 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yR23s6ot' \
    --userId 'qjjEVy7E' \
    --body '{"additionalData": {"cardSummary": "SA4AyM7J"}, "authorisedTime": "1996-02-28T00:00:00Z", "chargebackReversedTime": "1984-05-02T00:00:00Z", "chargebackTime": "1996-06-05T00:00:00Z", "chargedTime": "1987-02-13T00:00:00Z", "createdTime": "1987-07-15T00:00:00Z", "currency": {"currencyCode": "kOroi3kJ", "currencySymbol": "tdajGq6f", "currencyType": "VIRTUAL", "decimals": 1, "namespace": "ZU4rChVb"}, "customParameters": {"zKM9WwAc": {}, "TzEAd3bW": {}, "XKWmWGSh": {}}, "extOrderNo": "jpY9hyJ5", "extTxId": "P8iTQkEF", "extUserId": "IiT6nhTJ", "issuedAt": "1975-08-15T00:00:00Z", "metadata": {"xmeEJRvn": "rasIsoUI", "wq6HtK7y": "iEr51swq", "XZhhO67a": "IWshQJ3e"}, "namespace": "75SxE2yd", "nonceStr": "Q1KWFxAu", "paymentMethod": "AJDfaTAY", "paymentMethodFee": 33, "paymentOrderNo": "mViTjMfX", "paymentProvider": "STRIPE", "paymentProviderFee": 34, "paymentStationUrl": "SuyPLCu7", "price": 8, "refundedTime": "1999-10-20T00:00:00Z", "salesTax": 89, "sandbox": true, "sku": "EVp4qa6m", "status": "REFUNDED", "statusReason": "VhCtsEvu", "subscriptionId": "FxSiwsVU", "subtotalPrice": 23, "targetNamespace": "sW1A7DRG", "targetUserId": "tTXQ6gn0", "tax": 84, "totalPrice": 78, "totalTax": 39, "txEndTime": "1972-02-18T00:00:00Z", "type": "0c8Ho3eb", "userId": "lSdiTKa5", "vat": 8}' \
    > test.out 2>&1
eval_tap $? 242 'ProcessUserSubscriptionNotification' test.out

#- 243 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'c8qFyuLS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kR7XqqLp' \
    --body '{"count": 60, "orderNo": "iwINIrIr"}' \
    > test.out 2>&1
eval_tap $? 243 'AcquireUserTicket' test.out

#- 244 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'V35iN34m' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserCurrencyWallets' test.out

#- 245 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'JfZWhQQa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jYrH9RZM' \
    --limit '4' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 245 'ListUserCurrencyTransactions' test.out

#- 246 CheckWallet
eval_tap 0 246 'CheckWallet # SKIP deprecated' test.out

#- 247 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'iFmZfy9p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'khv8FlAJ' \
    --body '{"amount": 47, "expireAt": "1980-08-16T00:00:00Z", "origin": "System", "reason": "uOcB0hRs", "source": "REWARD"}' \
    > test.out 2>&1
eval_tap $? 247 'CreditUserWallet' test.out

#- 248 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'TqIs0yE9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1clyfPQ' \
    --body '{"amount": 98, "walletPlatform": "Xbox"}' \
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
    --storeId 'hKQnWdaj' \
    > test.out 2>&1
eval_tap $? 254 'ListViews' test.out

#- 255 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'F5qCDsEV' \
    --body '{"displayOrder": 54, "localizations": {"crc0TwKe": {"description": "wkVxNxFI", "localExt": {"4X5611yn": {}, "tsDJkBxh": {}, "SbxNpYZy": {}}, "longDescription": "ttOPx3QM", "title": "ZiczMtVJ"}, "jdNUZc1V": {"description": "TuRFHIf2", "localExt": {"KgyE2LEK": {}, "tFj3aWYZ": {}, "UjuKT4nN": {}}, "longDescription": "lygrERD4", "title": "UW00sbpY"}, "ofUxUXsw": {"description": "ze2zYQZt", "localExt": {"TrhZ0SEB": {}, "XxhWkPaB": {}, "Z6R7uxGT": {}}, "longDescription": "1LERb3qd", "title": "q9vWD9Jz"}}, "name": "KCwu1igw"}' \
    > test.out 2>&1
eval_tap $? 255 'CreateView' test.out

#- 256 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'PmTtokwk' \
    --storeId 'deyUFRVk' \
    > test.out 2>&1
eval_tap $? 256 'GetView' test.out

#- 257 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'iaxJTe14' \
    --storeId 'mA23m3Yt' \
    --body '{"displayOrder": 78, "localizations": {"dh77zZIC": {"description": "Wnclq4Gf", "localExt": {"qNklOHvD": {}, "xf1zMKib": {}, "lbLKX621": {}}, "longDescription": "yZi5u6yg", "title": "qg9P0bzs"}, "noi5F9UO": {"description": "AcisWmKw", "localExt": {"F7Q6ODrO": {}, "JEx57ZoD": {}, "3OmiRPdI": {}}, "longDescription": "W3E3Nlqx", "title": "EzkHFYtA"}, "frq6QTkq": {"description": "Hre4J3Av", "localExt": {"8neLZJEL": {}, "mEbSCW5C": {}, "hDs9bENI": {}}, "longDescription": "0GzejGV8", "title": "scph31of"}}, "name": "k9X8Yv3t"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateView' test.out

#- 258 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'ITCodiB1' \
    --storeId 'DJ1aO7De' \
    > test.out 2>&1
eval_tap $? 258 'DeleteView' test.out

#- 259 QueryWallets
eval_tap 0 259 'QueryWallets # SKIP deprecated' test.out

#- 260 GetWallet
eval_tap 0 260 'GetWallet # SKIP deprecated' test.out

#- 261 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'gfxTWKFd' \
    --end 'juFBrffY' \
    --start 'hlEj0AIC' \
    > test.out 2>&1
eval_tap $? 261 'SyncOrders' test.out

#- 262 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["W9UCsp9K", "rMS5JSyX", "drAyUW9P"], "apiKey": "Jaatg33V", "authoriseAsCapture": true, "blockedPaymentMethods": ["3kbnuSOK", "U55hJRfW", "lNg4MZSN"], "clientKey": "fCQMNGUf", "dropInSettings": "uJIhvdqk", "liveEndpointUrlPrefix": "nQGsLpNr", "merchantAccount": "ELFheGWJ", "notificationHmacKey": "3ZEG76y7", "notificationPassword": "PVB6gq6z", "notificationUsername": "Ekx7Lgct", "returnUrl": "vS5XWP2D", "settings": "HUyjUgug"}' \
    > test.out 2>&1
eval_tap $? 262 'TestAdyenConfig' test.out

#- 263 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "tzWOL0Wm", "privateKey": "nw3pSVe3", "publicKey": "sKgzSWCx", "returnUrl": "EmHxOY40"}' \
    > test.out 2>&1
eval_tap $? 263 'TestAliPayConfig' test.out

#- 264 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "SDp70i6N", "secretKey": "eEuiqnIH"}' \
    > test.out 2>&1
eval_tap $? 264 'TestCheckoutConfig' test.out

#- 265 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'gjOoGRpa' \
    > test.out 2>&1
eval_tap $? 265 'DebugMatchedPaymentMerchantConfig' test.out

#- 266 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "s1X89now", "clientSecret": "MErDvdET", "returnUrl": "uLOk3u5I", "webHookId": "ZP6G18YI"}' \
    > test.out 2>&1
eval_tap $? 266 'TestPayPalConfig' test.out

#- 267 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["p0UmVZGa", "JzE0BXtV", "0i7okqZ0"], "publishableKey": "YGStXAZf", "secretKey": "VuA5MN2L", "webhookSecret": "7jzncKXc"}' \
    > test.out 2>&1
eval_tap $? 267 'TestStripeConfig' test.out

#- 268 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "RRSXx4Bu", "key": "GXUnQz5i", "mchid": "gsCCyHB2", "returnUrl": "JHOx9OVl"}' \
    > test.out 2>&1
eval_tap $? 268 'TestWxPayConfig' test.out

#- 269 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "sEjJZ7KH", "flowCompletionUrl": "rAciFuHY", "merchantId": 74, "projectId": 78, "projectSecretKey": "MNjr16JT"}' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfig' test.out

#- 270 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'axeYsZyD' \
    > test.out 2>&1
eval_tap $? 270 'GetPaymentMerchantConfig' test.out

#- 271 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'fXznBiHC' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["CWf8rfCj", "XwL76qCK", "Hp5qZEZG"], "apiKey": "SQRvc5Yb", "authoriseAsCapture": true, "blockedPaymentMethods": ["TdpOgM7C", "tyV9kub9", "6Qsjvadt"], "clientKey": "Uq2x4Dp7", "dropInSettings": "p0NPVeVy", "liveEndpointUrlPrefix": "8PXoKRSX", "merchantAccount": "95tci9Do", "notificationHmacKey": "htgLLUlT", "notificationPassword": "QosU5FcW", "notificationUsername": "pwD3vdc6", "returnUrl": "Zql4deHz", "settings": "cIBovv99"}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateAdyenConfig' test.out

#- 272 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'aRRA108g' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 272 'TestAdyenConfigById' test.out

#- 273 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'fGEMgnp9' \
    --sandbox  \
    --validate  \
    --body '{"appId": "XyRfF767", "privateKey": "pMPOxQkZ", "publicKey": "STiWkUC1", "returnUrl": "3yJPcVwX"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateAliPayConfig' test.out

#- 274 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '7jQbMVPW' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 274 'TestAliPayConfigById' test.out

#- 275 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'YT5yAhi9' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "An1zfaVF", "secretKey": "VjTaexOh"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateCheckoutConfig' test.out

#- 276 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'IZkwahvM' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestCheckoutConfigById' test.out

#- 277 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'ouJKaVkr' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "t1EiOuY3", "clientSecret": "tDEOmCul", "returnUrl": "aSphMFL4", "webHookId": "89plzgEd"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdatePayPalConfig' test.out

#- 278 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '2f92ndba' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestPayPalConfigById' test.out

#- 279 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'xz8UT1Aj' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["PjEelpqS", "8TB6G8iT", "KwcKBFdn"], "publishableKey": "imS3U2KG", "secretKey": "4RcwbLRf", "webhookSecret": "54VqcGg3"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateStripeConfig' test.out

#- 280 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '67wUJU89' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestStripeConfigById' test.out

#- 281 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'GzSsGuIE' \
    --validate  \
    --body '{"appId": "aTBLRa0i", "key": "AMseK5Pc", "mchid": "xPuQ05Vs", "returnUrl": "oYalW4Zi"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdateWxPayConfig' test.out

#- 282 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'p9amoWyk' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 282 'UpdateWxPayConfigCert' test.out

#- 283 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'A6NM6wUu' \
    > test.out 2>&1
eval_tap $? 283 'TestWxPayConfigById' test.out

#- 284 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '8NjDL2Oo' \
    --validate  \
    --body '{"apiKey": "CVU2steK", "flowCompletionUrl": "7q3dRUAM", "merchantId": 82, "projectId": 72, "projectSecretKey": "7iUkUIQT"}' \
    > test.out 2>&1
eval_tap $? 284 'UpdateXsollaConfig' test.out

#- 285 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'IYy1FdIb' \
    > test.out 2>&1
eval_tap $? 285 'TestXsollaConfigById' test.out

#- 286 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'ZlGu1Y90' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateXsollaUIConfig' test.out

#- 287 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '48' \
    --namespace "$AB_NAMESPACE" \
    --offset '86' \
    --region 'NH6M160f' \
    > test.out 2>&1
eval_tap $? 287 'QueryPaymentProviderConfig' test.out

#- 288 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "ahpdKaCa", "region": "235fkoGj", "sandboxTaxJarApiToken": "OZtkXrxM", "specials": ["PAYPAL", "CHECKOUT", "CHECKOUT"], "taxJarApiToken": "hIV6vQOx", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 288 'CreatePaymentProviderConfig' test.out

#- 289 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 289 'GetAggregatePaymentProviders' test.out

#- 290 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'pbUHkUlQ' \
    > test.out 2>&1
eval_tap $? 290 'DebugMatchedPaymentProviderConfig' test.out

#- 291 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 291 'GetSpecialPaymentProviders' test.out

#- 292 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'vYcyVIUK' \
    --body '{"aggregate": "ADYEN", "namespace": "I2BIEaLd", "region": "McbNj8QR", "sandboxTaxJarApiToken": "FiSidkNT", "specials": ["XSOLLA", "ALIPAY", "STRIPE"], "taxJarApiToken": "PKBWezcE", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 292 'UpdatePaymentProviderConfig' test.out

#- 293 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'MBYvu6rY' \
    > test.out 2>&1
eval_tap $? 293 'DeletePaymentProviderConfig' test.out

#- 294 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 294 'GetPaymentTaxConfig' test.out

#- 295 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "FuvqodyV", "taxJarApiToken": "zNxWYjBf", "taxJarEnabled": false, "taxJarProductCodesMapping": {"Y8eTo9NF": "gfWs1aa7", "5HzSbEc3": "KsWS8Cz6", "1Wse8sUD": "E7YApckq"}}' \
    > test.out 2>&1
eval_tap $? 295 'UpdatePaymentTaxConfig' test.out

#- 296 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'sM4vhHx2' \
    --end 'Lz2flVmy' \
    --start 'FCYnu1gF' \
    > test.out 2>&1
eval_tap $? 296 'SyncPaymentOrders' test.out

#- 297 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'iImAgA46' \
    --storeId 'oFkURYPU' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRootCategories' test.out

#- 298 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'j54s3D4r' \
    --storeId '2Pch767K' \
    > test.out 2>&1
eval_tap $? 298 'DownloadCategories' test.out

#- 299 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath '4kCJvQwJ' \
    --namespace "$AB_NAMESPACE" \
    --language '20GEqbE0' \
    --storeId 'YQpMs0yW' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetCategory' test.out

#- 300 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'sDYrnY87' \
    --namespace "$AB_NAMESPACE" \
    --language 'd1DSiEeK' \
    --storeId 'kb8ljqTP' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetChildCategories' test.out

#- 301 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'cjP7DNs5' \
    --namespace "$AB_NAMESPACE" \
    --language 'l8EcMS70' \
    --storeId 'sZ6fYahj' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetDescendantCategories' test.out

#- 302 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 302 'PublicListCurrencies' test.out

#- 303 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'bSeni9h4' \
    --region 'csnNZ8BL' \
    --storeId 'ho2FnWVq' \
    --appId '096l78it' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetItemByAppId' test.out

#- 304 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId 'ZdrysSO3' \
    --categoryPath 'M1XSALQD' \
    --features 'jX8pWdyz' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language 'G3Vof1Jm' \
    --limit '47' \
    --offset '85' \
    --region '6L7plUtU' \
    --sortBy 'createdAt,createdAt:asc,createdAt:desc' \
    --storeId 'DfrTwZHJ' \
    --tags 'wQBElL7K' \
    > test.out 2>&1
eval_tap $? 304 'PublicQueryItems' test.out

#- 305 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language '2H0rvBKC' \
    --region 'ZSdOJgax' \
    --storeId 'oiabFcIu' \
    --sku '0whA8Fi3' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetItemBySku' test.out

#- 306 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'uGrswJW0' \
    --region '2B3dhjSY' \
    --storeId 'jcibqI5T' \
    --itemIds 'AcZWtxoY' \
    > test.out 2>&1
eval_tap $? 306 'PublicBulkGetItems' test.out

#- 307 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["zZKavMeO", "14nA5Wzw", "NKlPChMG"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicValidateItemPurchaseCondition' test.out

#- 308 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'CODE' \
    --limit '2' \
    --offset '49' \
    --region 'm8iWe2Uw' \
    --storeId 'OhtlTxIb' \
    --keyword '3DpPNzPA' \
    --language 'DHYGOuPn' \
    > test.out 2>&1
eval_tap $? 308 'PublicSearchItems' test.out

#- 309 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'CO2E49Xv' \
    --namespace "$AB_NAMESPACE" \
    --language 'GRAKIJuI' \
    --region 'F09WoEv4' \
    --storeId 'F0sJBii6' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetApp' test.out

#- 310 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'VSfpDV51' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 310 'PublicGetItemDynamicData' test.out

#- 311 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'ljNscDDK' \
    --namespace "$AB_NAMESPACE" \
    --language 'ayjHu3Ld' \
    --populateBundle  \
    --region 'V3ASrcxa' \
    --storeId 'sdviDgWx' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetItem' test.out

#- 312 GetPaymentCustomization
eval_tap 0 312 'GetPaymentCustomization # SKIP deprecated' test.out

#- 313 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "zOsXPYBD", "paymentProvider": "PAYPAL", "returnUrl": "La92MpTV", "ui": "M75cUk2H", "zipCode": "oGjto6cg"}' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetPaymentUrl' test.out

#- 314 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tVauzp7N' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetPaymentMethods' test.out

#- 315 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'evOV6bJP' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetUnpaidPaymentOrder' test.out

#- 316 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8tyyQjh5' \
    --paymentProvider 'WXPAY' \
    --zipCode '5w8wXHls' \
    --body '{"token": "YOFt8soZ"}' \
    > test.out 2>&1
eval_tap $? 316 'Pay' test.out

#- 317 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ZBScxTlW' \
    > test.out 2>&1
eval_tap $? 317 'PublicCheckPaymentOrderPaidStatus' test.out

#- 318 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'dT9Z8gUG' \
    > test.out 2>&1
eval_tap $? 318 'GetPaymentPublicConfig' test.out

#- 319 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'Tn0Hsv84' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetQRCode' test.out

#- 320 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'j38u2sra' \
    --foreinginvoice 'KrGrH0xB' \
    --invoiceId 'btyVPiOS' \
    --payload 'CmvCzp8J' \
    --redirectResult 'zRF1MthC' \
    --resultCode '4N5CGAu3' \
    --sessionId 'tEEBkjmc' \
    --status 'xTYAT9of' \
    --token 'v4EgRQ7g' \
    --type 'rmhKxELx' \
    --userId 'KHuBLw9S' \
    --orderNo '3uwq67A4' \
    --paymentOrderNo 'JM2xt9tn' \
    --paymentProvider 'PAYPAL' \
    --returnUrl '4c08MDA4' \
    > test.out 2>&1
eval_tap $? 320 'PublicNormalizePaymentReturnUrl' test.out

#- 321 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'f374Xl4T' \
    --paymentOrderNo '8g3jO87v' \
    --paymentProvider 'ADYEN' \
    > test.out 2>&1
eval_tap $? 321 'GetPaymentTaxValue' test.out

#- 322 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode '0Iz21YPa' \
    > test.out 2>&1
eval_tap $? 322 'GetRewardByCode' test.out

#- 323 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '1pNhsNKy' \
    --limit '25' \
    --offset '85' \
    --sortBy 'rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 323 'QueryRewards1' test.out

#- 324 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'DqarDz8z' \
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
    --appIds 'cd5PKhEG,LBczv6w9,EkpY4A0A' \
    --itemIds 'C1mfJUTf,PfCQtTTZ,HXdN2SjA' \
    --skus 'N2bZ1SJC,ZqMfHGkz,rH1VHeFx' \
    > test.out 2>&1
eval_tap $? 326 'PublicExistsAnyMyActiveEntitlement' test.out

#- 327 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'eW5yo1AP' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 328 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'FNv2nQbB' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 329 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'oQDE4Nl6' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 330 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'g4DZi1ii,4ZgOg2o6,OLl2CdwR' \
    --itemIds 'hVfnMzm3,Z8j6tn1O,jarKlJfh' \
    --skus 'ZXqgB9l5,SRvYIEZI,ZLLcLSyj' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetEntitlementOwnershipToken' test.out

#- 331 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'bAyajPMQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyWallet' test.out

#- 332 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fc7WeRbC' \
    --body '{"epicGamesJwtToken": "eJImv6PN"}' \
    > test.out 2>&1
eval_tap $? 332 'SyncEpicGameDLC' test.out

#- 333 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'euMP5MhE' \
    --body '{"serviceLabel": 24}' \
    > test.out 2>&1
eval_tap $? 333 'PublicSyncPsnDlcInventory' test.out

#- 334 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'p4dI0Lz1' \
    --body '{"serviceLabels": [0, 43]}' \
    > test.out 2>&1
eval_tap $? 334 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 335 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'BDZZWEm1' \
    --body '{"appId": "iAg7AgYw", "steamId": "ypQMUWl7"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncSteamDLC' test.out

#- 336 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'zlXOaQ0b' \
    --body '{"xstsToken": "Ha7wdVX9"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncXboxDLC' test.out

#- 337 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ovm9BXIZ' \
    --appType 'GAME' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'F5BSTm7i' \
    --features 'bSUOG7G7,TOc3gRmS,OFnR1jSC' \
    --itemId 'TUGWkJZq,7Ox7OWLC,KHs2hS8H' \
    --limit '11' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 337 'PublicQueryUserEntitlements' test.out

#- 338 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MXiDlPxh' \
    --appId '4yJMJiY3' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetUserAppEntitlementByAppId' test.out

#- 339 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'BpBdd3OU' \
    --limit '94' \
    --offset '56' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserEntitlementsByAppType' test.out

#- 340 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jyD1DRtz' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'DQHUXmJM' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetUserEntitlementByItemId' test.out

#- 341 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'TGhlTbDh' \
    --entitlementClazz 'MEDIA' \
    --sku 'cqc96x2y' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserEntitlementBySku' test.out

#- 342 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ea50m57k' \
    --appIds 'MjgkQwv1,y7zfkN71,QlxswitU' \
    --itemIds 'KCmoV8Ry,aAKUPkt9,ixSog1JY' \
    --skus 'sa3C98Ow,cLp8QtKs,nYBccwta' \
    > test.out 2>&1
eval_tap $? 342 'PublicExistsAnyUserActiveEntitlement' test.out

#- 343 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'C3Ga1IPR' \
    --appId 'JD1k1OgY' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 344 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tm4yrUBM' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'Xft3dJyu' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 345 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mDhZ7Saf' \
    --ids 'f4ZvlzoS,6UY0yBhq,IMbdCZqw' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 346 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LzJb8lnv' \
    --entitlementClazz 'MEDIA' \
    --sku 'N0O6aJKa' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 347 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'PeFFeH9b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iyba4RPj' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserEntitlement' test.out

#- 348 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '0ssfLvR5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BOwkrGEx' \
    --body '{"options": ["G4FZ5DYs", "nTKiI5Q3", "CE0Zdvnj"], "requestId": "7K4OlklM", "useCount": 10}' \
    > test.out 2>&1
eval_tap $? 348 'PublicConsumeUserEntitlement' test.out

#- 349 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZXkNEzsc' \
    --body '{"code": "wNO4BMy3", "language": "VM_mQFb-ft", "region": "3uUVOnDk"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicRedeemCode' test.out

#- 350 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ROLiuUTZ' \
    --body '{"excludeOldTransactions": false, "language": "gD_FnMe", "productId": "2Urh3jwy", "receiptData": "xI2Gag5m", "region": "1gBYLwlB", "transactionId": "QspxCG6l"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicFulfillAppleIAPItem' test.out

#- 351 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'JqbqSAoe' \
    --body '{"epicGamesJwtToken": "xVaLUeN8"}' \
    > test.out 2>&1
eval_tap $? 351 'SyncEpicGamesInventory' test.out

#- 352 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2HSy6KEw' \
    --body '{"autoAck": false, "language": "pUSJ", "orderId": "QeJJw4RO", "packageName": "6nz3sKYE", "productId": "Ms4wjVkG", "purchaseTime": 8, "purchaseToken": "0cjaaqW4", "region": "lNjml416"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicFulfillGoogleIAPItem' test.out

#- 353 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'srlD5JOY' \
    --body '{"currencyCode": "fTVAO2g9", "price": 0.7761404824691214, "productId": "50E6lzrJ", "serviceLabel": 3}' \
    > test.out 2>&1
eval_tap $? 353 'PublicReconcilePlayStationStore' test.out

#- 354 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'a65k6YFZ' \
    --body '{"currencyCode": "Ze7vHETs", "price": 0.5729937215316401, "productId": "mThjdbT1", "serviceLabels": [33, 37, 63]}' \
    > test.out 2>&1
eval_tap $? 354 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 355 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '3JYg1C39' \
    --body '{"appId": "6L3TIzvw", "language": "CYm_xzEf", "region": "FRRVyWVw", "stadiaPlayerId": "OYnWtNeS"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncStadiaEntitlement' test.out

#- 356 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'IXIFelEi' \
    --body '{"appId": "Wkkf7N9O", "currencyCode": "rs8GdatW", "language": "Llg-JANo", "price": 0.9906830704659654, "productId": "Eyw94y0E", "region": "mEqbHOdC", "steamId": "OayjyFcg"}' \
    > test.out 2>&1
eval_tap $? 356 'SyncSteamInventory' test.out

#- 357 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hdvGCWiq' \
    --body '{"gameId": "9HSL4nlE", "language": "fE-Aj", "region": "1gKKmAE7"}' \
    > test.out 2>&1
eval_tap $? 357 'SyncTwitchDropsEntitlement' test.out

#- 358 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '3DKo71Is' \
    --body '{"currencyCode": "hZqHJdG7", "price": 0.11441409270495684, "productId": "UEsRf0y1", "xstsToken": "cOs9mHoy"}' \
    > test.out 2>&1
eval_tap $? 358 'SyncXboxInventory' test.out

#- 359 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'O9ld9BRn' \
    --itemId 'dNg44sUf' \
    --limit '10' \
    --offset '45' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 359 'PublicQueryUserOrders' test.out

#- 360 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'c97dTljh' \
    --body '{"currencyCode": "Y5iHjdjD", "discountedPrice": 30, "ext": {"TNynC3GR": {}, "O5r7ZYEk": {}, "hlc5ZHoT": {}}, "itemId": "BBzuAHGJ", "language": "at_bmHn-818", "price": 66, "quantity": 61, "region": "Xz7cIeej", "returnUrl": "t0EPP7kK"}' \
    > test.out 2>&1
eval_tap $? 360 'PublicCreateUserOrder' test.out

#- 361 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XjGfgvuG' \
    --userId 'BgYsSiL0' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetUserOrder' test.out

#- 362 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rpmqwcDi' \
    --userId 'HeSF0YIf' \
    > test.out 2>&1
eval_tap $? 362 'PublicCancelUserOrder' test.out

#- 363 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ZN3cfRiM' \
    --userId 'yoRABZ6b' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetUserOrderHistories' test.out

#- 364 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EyNC6Mm3' \
    --userId '6LrkGMpl' \
    > test.out 2>&1
eval_tap $? 364 'PublicDownloadUserOrderReceipt' test.out

#- 365 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '6xavIIZo' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentAccounts' test.out

#- 366 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'kLmiB7gB' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'pPzX51iX' \
    > test.out 2>&1
eval_tap $? 366 'PublicDeletePaymentAccount' test.out

#- 367 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'mjQ4Y7pI' \
    --language '7KxonLEQ' \
    --region '4kfdKdKf' \
    --storeId 'SQhXOFJa' \
    --viewId '8zT5e9rC' \
    > test.out 2>&1
eval_tap $? 367 'PublicListActiveSections' test.out

#- 368 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'WcBWBlLb' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'q2QfLvcX' \
    --limit '100' \
    --offset '5' \
    --sku 'r4skjhtv' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 368 'PublicQueryUserSubscriptions' test.out

#- 369 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '16LlY6Gt' \
    --body '{"currencyCode": "7CiYL0Qh", "itemId": "EcVwBa63", "language": "cGtD", "region": "jYLVCrBt", "returnUrl": "yq0R4ENR", "source": "UXy6rzFN"}' \
    > test.out 2>&1
eval_tap $? 369 'PublicSubscribeSubscription' test.out

#- 370 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WE4fDmjV' \
    --itemId 'pmcHw1Zt' \
    > test.out 2>&1
eval_tap $? 370 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 371 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GVykUROR' \
    --userId 'xiHRIW8E' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserSubscription' test.out

#- 372 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BVsMwsIo' \
    --userId '1u2Zlxna' \
    > test.out 2>&1
eval_tap $? 372 'PublicChangeSubscriptionBillingAccount' test.out

#- 373 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jwn2SkPR' \
    --userId 'BNC8tCWf' \
    --body '{"immediate": true, "reason": "DldIHc1z"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicCancelSubscription' test.out

#- 374 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tQVmixXo' \
    --userId 'noXIlcGK' \
    --excludeFree  \
    --limit '27' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserSubscriptionBillingHistories' test.out

#- 375 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'bhE2AKGd' \
    --language 'oyzFiVur' \
    --storeId 'KAKkKo9i' \
    > test.out 2>&1
eval_tap $? 375 'PublicListViews' test.out

#- 376 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '647vBX9o' \
    --namespace "$AB_NAMESPACE" \
    --userId '6lDE5eJU' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetWallet' test.out

#- 377 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'eeevY4pe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x3LdoaJm' \
    --limit '16' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 377 'PublicListUserWalletTransactions' test.out

#- 378 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'fyGRbobJ' \
    --baseAppId 'nEVGMhV3' \
    --categoryPath 'KhGBaTwU' \
    --features 'sC5kbDgV' \
    --includeSubCategoryItem  \
    --itemName 'TVbsrIBa' \
    --itemStatus 'ACTIVE' \
    --itemType 'APP' \
    --limit '100' \
    --offset '88' \
    --region 'Gi2pM1oZ' \
    --sortBy 'updatedAt:desc,createdAt,createdAt:desc' \
    --storeId 'Ciqe0LtB' \
    --tags '2rBpjMj9' \
    --targetNamespace 'E9ml3aPJ' \
    > test.out 2>&1
eval_tap $? 378 'QueryItems1' test.out

#- 379 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'r1f1b9vW' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 379 'ImportStore1' test.out

#- 380 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tsEbC0JE' \
    --body '{"itemIds": ["SPS7AxQw", "vlbairoc", "iP9UfFyF"]}' \
    > test.out 2>&1
eval_tap $? 380 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE