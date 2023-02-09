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
    --body '{"context": {"item": {"appId": "B2SKq3qs", "appType": "DLC", "baseAppId": "rMEp0sqX", "boothName": "6LW0jzGs", "boundItemIds": ["ayJMOttF", "0aFcYWIC", "5DRQgpoZ"], "categoryPath": "bagc7jNY", "clazz": "fsJ8sC4d", "createdAt": "1977-09-22T00:00:00Z", "description": "QS5hKZ7z", "displayOrder": 14, "entitlementType": "CONSUMABLE", "ext": {"wq2XpQZF": {}, "IO3w47Aw": {}, "UZojHS3t": {}}, "features": ["croYZIJb", "Bees7ppg", "d8FZOzlI"], "fresh": true, "images": [{"as": "n91DXNC0", "caption": "lbT4Ly4k", "height": 79, "imageUrl": "ErKdP3m0", "smallImageUrl": "Ac94p760", "width": 81}, {"as": "KFJO5KA6", "caption": "RDRcVPLa", "height": 79, "imageUrl": "EAVeOsb8", "smallImageUrl": "U2pcEJGe", "width": 96}, {"as": "Nz6V8JfM", "caption": "yK1Z5esO", "height": 41, "imageUrl": "C6RDGLzn", "smallImageUrl": "8VXRctaQ", "width": 71}], "itemId": "xbrZfPpl", "itemIds": ["hKS0QFLg", "g0Che7g1", "5cpP34qm"], "itemQty": {"qQqOTOhI": 82, "2ZHgIj7L": 81, "tLXJufKk": 74}, "itemType": "MEDIA", "language": "jTp4Y7SP", "listable": false, "localExt": {"cWQ2Y8CI": {}, "rFuco2Ce": {}, "2XTMKcqM": {}}, "longDescription": "JRWcki7X", "lootBoxConfig": {"rewardCount": 10, "rewards": [{"lootBoxItems": [{"count": 56, "itemId": "oyJ4xyD9", "itemSku": "CtX2UTXm", "itemType": "t8G1TvZ8"}, {"count": 33, "itemId": "QMwtj9Uh", "itemSku": "QRhdqHVj", "itemType": "iPdSLVxR"}, {"count": 65, "itemId": "Jm9FIBzs", "itemSku": "SDEHpEaU", "itemType": "YGNV9h4o"}], "name": "45YpQ9Lx", "odds": 0.05523949568586173, "type": "PROBABILITY_GROUP", "weight": 36}, {"lootBoxItems": [{"count": 31, "itemId": "UanhIUMm", "itemSku": "EF6qpx8w", "itemType": "KXUK8gWC"}, {"count": 94, "itemId": "MAKnhIio", "itemSku": "gXCzFHyO", "itemType": "7DAWWBGm"}, {"count": 51, "itemId": "r05caNCy", "itemSku": "zjIRHv3H", "itemType": "BnGa8ixe"}], "name": "HtT9sWUb", "odds": 0.07712322912268055, "type": "REWARD_GROUP", "weight": 94}, {"lootBoxItems": [{"count": 12, "itemId": "ZPHvJPxv", "itemSku": "3aK7A0DX", "itemType": "7VThAk8r"}, {"count": 97, "itemId": "bw5AAhds", "itemSku": "VmRy9N7T", "itemType": "qAX3UnLv"}, {"count": 22, "itemId": "VVKNb5zR", "itemSku": "U48bSypF", "itemType": "Uu0VV9EI"}], "name": "GBhv6slo", "odds": 0.3093774658421463, "type": "REWARD", "weight": 52}], "rollFunction": "CUSTOM"}, "maxCount": 39, "maxCountPerUser": 3, "name": "qvIAYt5e", "namespace": "m0ODIYaZ", "optionBoxConfig": {"boxItems": [{"count": 71, "itemId": "c1RMDdnH", "itemSku": "3pnE2J8V", "itemType": "JsBzgdic"}, {"count": 62, "itemId": "QxiUtz16", "itemSku": "v8pnAsKq", "itemType": "tyDmKBPs"}, {"count": 31, "itemId": "Emz9daMu", "itemSku": "XWGOG27E", "itemType": "Dzq0t3ib"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 63, "comparison": "is", "name": "7hcCkLWA", "predicateType": "SeasonPassPredicate", "value": "UNRtUe9E", "values": ["k4doSr6K", "VnC2H2VP", "JgczKFCv"]}, {"anyOf": 84, "comparison": "excludes", "name": "W4zY1NUN", "predicateType": "SeasonTierPredicate", "value": "g5laDMLZ", "values": ["noRBVCsu", "rsLVfXV3", "hXqz85Cw"]}, {"anyOf": 72, "comparison": "excludes", "name": "ZZgkJGHq", "predicateType": "SeasonPassPredicate", "value": "PzemFyiQ", "values": ["KYcut88H", "EswQszMl", "nEdSy7Ii"]}]}, {"operator": "and", "predicates": [{"anyOf": 81, "comparison": "is", "name": "JjOSYuHk", "predicateType": "SeasonPassPredicate", "value": "AB0g6BRH", "values": ["M8PhZlPg", "sQj9QQNp", "4aOSw2FL"]}, {"anyOf": 38, "comparison": "isNot", "name": "THYiyIkJ", "predicateType": "SeasonPassPredicate", "value": "spTGzQTr", "values": ["2z3esKyJ", "QEnb3Vek", "phFwOYSE"]}, {"anyOf": 20, "comparison": "includes", "name": "UGgfGZVw", "predicateType": "EntitlementPredicate", "value": "Ua9fRpin", "values": ["qENoW13s", "n7rxcrDP", "eDrNIF6d"]}]}, {"operator": "and", "predicates": [{"anyOf": 22, "comparison": "isGreaterThanOrEqual", "name": "g9XntzpN", "predicateType": "SeasonTierPredicate", "value": "oEtnuxu2", "values": ["ogKHXdHT", "nkBGHT6c", "lwRutZOC"]}, {"anyOf": 43, "comparison": "isLessThan", "name": "npTm4Sqm", "predicateType": "SeasonPassPredicate", "value": "IUaHCdsd", "values": ["goR46dgB", "nD80TwI1", "Rqz0kBE3"]}, {"anyOf": 96, "comparison": "isGreaterThanOrEqual", "name": "eAqXjo2d", "predicateType": "EntitlementPredicate", "value": "qlvwslMh", "values": ["aFXqg2WB", "V1nvP5Uu", "5z2Gwfjn"]}]}]}, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 59, "fixedTrialCycles": 44, "graceDays": 79}, "region": "hK9FUTFd", "regionData": [{"currencyCode": "o0C44ohe", "currencyNamespace": "LSGRGMU9", "currencyType": "REAL", "discountAmount": 69, "discountExpireAt": "1988-04-21T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1982-01-07T00:00:00Z", "discountedPrice": 100, "expireAt": "1979-07-29T00:00:00Z", "price": 3, "purchaseAt": "1975-07-13T00:00:00Z", "trialPrice": 76}, {"currencyCode": "BpcyxKOs", "currencyNamespace": "FRIIl4IY", "currencyType": "REAL", "discountAmount": 19, "discountExpireAt": "1998-10-04T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1989-04-29T00:00:00Z", "discountedPrice": 76, "expireAt": "1984-01-05T00:00:00Z", "price": 51, "purchaseAt": "1995-10-21T00:00:00Z", "trialPrice": 55}, {"currencyCode": "Nit4vq9d", "currencyNamespace": "r106In39", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1971-03-03T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1975-07-13T00:00:00Z", "discountedPrice": 22, "expireAt": "1987-08-13T00:00:00Z", "price": 56, "purchaseAt": "1989-04-23T00:00:00Z", "trialPrice": 59}], "seasonType": "PASS", "sku": "RgJnUe3Z", "stackable": true, "status": "ACTIVE", "tags": ["zI2m9Omi", "kFcujlDw", "KACgyQuf"], "targetCurrencyCode": "V0hPYMvY", "targetItemId": "hqaerzL0", "targetNamespace": "iXvpZbrL", "thumbnailUrl": "MgLws3tX", "title": "JbqOmtuR", "updatedAt": "1987-04-05T00:00:00Z", "useCount": 94}, "namespace": "N8l0iz4p", "order": {"currency": {"currencyCode": "k00tmqJF", "currencySymbol": "BXXKPXPi", "currencyType": "REAL", "decimals": 72, "namespace": "mIu5liBs"}, "ext": {"t85kQ3mi": {}, "cclOTxU0": {}, "nsSx3lTe": {}}, "free": false}, "source": "DLC"}, "script": "wU7jEdgJ", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'b22DFDD4' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'ahVuomnM' \
    --body '{"grantDays": "UbdxshzT"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'LvWGnvon' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'fcRcizxP' \
    --body '{"grantDays": "KDp6cwug"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "Nwqu7RpX", "dryRun": false, "fulfillmentUrl": "if0B471b", "itemType": "MEDIA", "purchaseConditionUrl": "71Mxfwb5"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'Fptxjmz6' \
    --itemType 'COINS' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'dMj6qDbJ' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'COkqhzja' \
    --body '{"clazz": "SBnSDFjM", "dryRun": true, "fulfillmentUrl": "IzVhOKSh", "purchaseConditionUrl": "ZtdoEBPd"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'aSG5Yfzi' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --name 'pCzLcJUi' \
    --offset '94' \
    --tag 'z55pkoUo' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ybPvYNhb", "items": [{"extraSubscriptionDays": 39, "itemId": "71YJovVK", "itemName": "8HzOYn0L", "quantity": 71}, {"extraSubscriptionDays": 75, "itemId": "qBDuSfsL", "itemName": "ebpvHVnX", "quantity": 76}, {"extraSubscriptionDays": 63, "itemId": "WLSSu3Lr", "itemName": "5jZywaqB", "quantity": 47}], "maxRedeemCountPerCampaignPerUser": 86, "maxRedeemCountPerCode": 35, "maxRedeemCountPerCodePerUser": 97, "maxSaleCount": 54, "name": "CvzHsBYg", "redeemEnd": "1990-04-30T00:00:00Z", "redeemStart": "1979-12-26T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["XebfHdFh", "XXOnFifN", "WYzfi3Lc"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'u1yDzvOg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'Aun68HZ0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "VOmmdxlL", "items": [{"extraSubscriptionDays": 2, "itemId": "IjUQKgWY", "itemName": "6o6NMcSn", "quantity": 88}, {"extraSubscriptionDays": 20, "itemId": "VqmUZCt8", "itemName": "rl6UIhqF", "quantity": 67}, {"extraSubscriptionDays": 60, "itemId": "eWpBY8nm", "itemName": "GxIyikdK", "quantity": 70}], "maxRedeemCountPerCampaignPerUser": 22, "maxRedeemCountPerCode": 92, "maxRedeemCountPerCodePerUser": 76, "maxSaleCount": 0, "name": "hkRAvkE6", "redeemEnd": "1997-12-26T00:00:00Z", "redeemStart": "1981-12-05T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["LqIOTuDN", "Y4nyOvBX", "YBrnTlVw"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'PJVSnPHv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NL635Vi1' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fqbh9rp5' \
    --body '{"categoryPath": "IFmKTKEq", "localizationDisplayNames": {"MldJz9z0": "s8Cqqbxz", "LfoEU9fv": "3Y1JyNki", "Xw6nUSyf": "W0R5n2ss"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Et7glwMa' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'jjkT2tUc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FliMG3nG' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'WRzYGKGz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TE8P5nlA' \
    --body '{"localizationDisplayNames": {"ZArAcGZH": "XKiRsTHG", "0GMFhQil": "Y5BhDqMs", "2cGfWFAp": "BF2L2rVr"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'T2nxhJG4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RqW8kvbo' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'tKD7X2iJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5Jifu4pk' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'mqzTzkpX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'N5uIeIp6' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'zoWPmmYZ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '30' \
    --code 'qJoON87T' \
    --limit '6' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'I906X5xM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 1}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '6aOVcN1R' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '42' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'XNDgT9wj' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '51' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'wk4ART76' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '0' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '8ip8DTWM' \
    --namespace "$AB_NAMESPACE" \
    --code 'dYl2fH5G' \
    --limit '14' \
    --offset '85' \
    --userId 'jQTEOkan' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'cN6qxpaD' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code '5tUAt6Zk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'gPjm5G3S' \
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
    --body '{"grpcServerAddress": "FDBeHXpt"}' \
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
    --body '{"currencyCode": "m2Q8pYfB", "currencySymbol": "VAVNf56q", "currencyType": "REAL", "decimals": 90, "localizationDescriptions": {"BJMhaFgJ": "ANBcDlkK", "buJKA1yY": "yQQNiY9T", "3gSaXj9a": "do7yvXkC"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'eWOagLnD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"yhMJC9zI": "nRtIo9LB", "5GNN0DUO": "fPTuzSwD", "NRJUiscC": "2kut54mU"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'yNHj0mgg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'JLJsqzTy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'cP56Zkm0' \
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
    --body '{"data": [{"id": "s6eQAQR1", "rewards": [{"currency": {"currencyCode": "ozBeE6Gw", "namespace": "MzKoz2FB"}, "item": {"itemId": "dQfNgaGP", "itemSku": "JCQvBqYw", "itemType": "OvLoXrXd"}, "quantity": 64, "type": "ITEM"}, {"currency": {"currencyCode": "e7T4eIrI", "namespace": "SQQKWozF"}, "item": {"itemId": "3lgsM8FO", "itemSku": "3AdqxAZr", "itemType": "XXcu0cRs"}, "quantity": 96, "type": "ITEM"}, {"currency": {"currencyCode": "67i41xzt", "namespace": "HwRAGyPf"}, "item": {"itemId": "vl2zb9CH", "itemSku": "QfpQXFec", "itemType": "lqjl4PIc"}, "quantity": 21, "type": "CURRENCY"}]}, {"id": "OZRls50q", "rewards": [{"currency": {"currencyCode": "p9PCjUTj", "namespace": "VVxlCftl"}, "item": {"itemId": "ZpN7Tln0", "itemSku": "kuP9Bi4t", "itemType": "SmwYr626"}, "quantity": 90, "type": "CURRENCY"}, {"currency": {"currencyCode": "EXnYJedi", "namespace": "YiAiaG9S"}, "item": {"itemId": "DaGpBszk", "itemSku": "78xRJhbA", "itemType": "XWNt0Wz5"}, "quantity": 18, "type": "CURRENCY"}, {"currency": {"currencyCode": "gyuZIaDk", "namespace": "3zEWSZI7"}, "item": {"itemId": "05wvTvUs", "itemSku": "pWbyb6wU", "itemType": "PBoQP0oT"}, "quantity": 73, "type": "CURRENCY"}]}, {"id": "8kXeRU7T", "rewards": [{"currency": {"currencyCode": "ZZfMGg2f", "namespace": "GXi9JBUY"}, "item": {"itemId": "d8hwOvCP", "itemSku": "DW14b6fP", "itemType": "YtIKsRlI"}, "quantity": 45, "type": "CURRENCY"}, {"currency": {"currencyCode": "3qWU3vk8", "namespace": "NJbNif4y"}, "item": {"itemId": "ibzJKiuh", "itemSku": "8zWoP0qp", "itemType": "H7WgUXIp"}, "quantity": 68, "type": "CURRENCY"}, {"currency": {"currencyCode": "oUMP4eTb", "namespace": "M4WiqVwE"}, "item": {"itemId": "kRGuQ9NF", "itemSku": "HoOjWJcs", "itemType": "v7tlkUyv"}, "quantity": 12, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"f2QAswYn": "6iuUf6vz", "L7bC6VKW": "Rsl0ADLS", "m71dHPkR": "c9r57kRR"}}, {"platform": "STEAM", "platformDlcIdMap": {"1ivN0Zz6": "LfYwZFHB", "fdfNyLb8": "jowiZJ0C", "lqtqm4F2": "TtP6wngG"}}, {"platform": "STEAM", "platformDlcIdMap": {"dMsakpXT": "Jm2AlCOf", "grHOfYi6": "43VgVkrC", "OSmoUKgk": "Jh3boCgJ"}}]}' \
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
    --entitlementName 'Qez3jAiO' \
    --itemId 'A2sxzlal,Vh6dKwqG,ZpAUjfUf' \
    --limit '29' \
    --offset '19' \
    --userId '6I7ChWnC' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'MF3Vnb9T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '62' \
    --status 'SUCCESS' \
    --userId '5H4UKpSA' \
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
    --body '{"bundleId": "CxJuG7nf", "password": "5Jfr1q8S"}' \
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
    --body '{"sandboxId": "0N6He9Je"}' \
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
    --body '{"applicationName": "s9CSHMk5", "serviceAccountId": "29O8xjyw"}' \
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
    --body '{"data": [{"itemIdentity": "dxHZc0vK", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"dD1e7xEw": "lodLSc3X", "P4d9R0Iw": "QaQ5qs8S", "bLEuFbEN": "08dKO3ld"}}, {"itemIdentity": "0rTG4ZKg", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"bfcDP4pe": "sOIab0yE", "pLJN5udX": "jTN1Ehbu", "2Wsx90HO": "qIm9JIWp"}}, {"itemIdentity": "RJujmq0k", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"OtCfu5tN": "uZMVBfel", "V337UCM8": "zDCto4sI", "fwsMSUgI": "avYxPkMD"}}]}' \
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
    --body '{"environment": "WUZn17Dq"}' \
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
    --body '{"appId": "VpFEzCvx", "publisherAuthenticationKey": "adsLkw7a"}' \
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
    --body '{"clientId": "PNGob1Tq", "clientSecret": "PXsXDbEb", "organizationId": "BFY9j2My"}' \
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
    --body '{"relyingPartyCert": "qRme0mYi"}' \
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
    --password 'BuzsScwU' \
    > test.out 2>&1
eval_tap $? 82 'UpdateXblBPCertFile' test.out

#- 83 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'N0Vvb8yc' \
    --itemId 'LfD3Lomf' \
    --itemType 'CODE' \
    --endTime 'eoeqkVoN' \
    --startTime '5j73X1B7' \
    > test.out 2>&1
eval_tap $? 83 'DownloadInvoiceDetails' test.out

#- 84 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '1LtSlRqt' \
    --itemId 'bhoJXMcr' \
    --itemType 'MEDIA' \
    --endTime 'izRWBVO7' \
    --startTime '9iAiErju' \
    > test.out 2>&1
eval_tap $? 84 'GenerateInvoiceSummary' test.out

#- 85 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Yg1b2NuA' \
    --body '{"categoryPath": "yYByHCqo", "targetItemId": "Y8QmSAGe", "targetNamespace": "yRNtkHBd"}' \
    > test.out 2>&1
eval_tap $? 85 'SyncInGameItem' test.out

#- 86 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'sPuESjPQ' \
    --body '{"appId": "SsHSHZvL", "appType": "DLC", "baseAppId": "QvRvt5jG", "boothName": "mM7YJBD9", "categoryPath": "bQBQMNTS", "clazz": "JccFk4Bv", "displayOrder": 82, "entitlementType": "DURABLE", "ext": {"V4sDFWX1": {}, "fE9yzfFg": {}, "4daMb1rX": {}}, "features": ["Y5B4B2uA", "IkHrIqnQ", "vdIf2jhs"], "images": [{"as": "bFvJwt1x", "caption": "kp5FArwo", "height": 96, "imageUrl": "j2MxM6zF", "smallImageUrl": "TKnLR0SB", "width": 12}, {"as": "hsIfD9bE", "caption": "s5jnvR9O", "height": 8, "imageUrl": "JIXdAePU", "smallImageUrl": "6LStzLuE", "width": 32}, {"as": "MesB3esZ", "caption": "5pzfUyya", "height": 98, "imageUrl": "EFJ3Ry2E", "smallImageUrl": "Ul4bjhwz", "width": 61}], "itemIds": ["hjvAzAqY", "IBOJK8bC", "JwVgp8Nr"], "itemQty": {"98vLXxnt": 7, "N9JfHdy3": 3, "JYWdwwsP": 10}, "itemType": "INGAMEITEM", "listable": true, "localizations": {"dNwdynrE": {"description": "VUX5fLvK", "localExt": {"NU310RrM": {}, "jq0JgCoD": {}, "az5HFLo9": {}}, "longDescription": "GwzwqxP7", "title": "nK4KISOk"}, "4kunwbsX": {"description": "UjQG3uTc", "localExt": {"JdG0eT9A": {}, "YfdYMfR9": {}, "1vnYvnSJ": {}}, "longDescription": "OIVwCE6j", "title": "2zq46vd9"}, "PcyqnFx9": {"description": "0sjQl31h", "localExt": {"D2FC3HYA": {}, "EjSIHaqO": {}, "QqXOOX97": {}}, "longDescription": "OiLCYfPp", "title": "hM7WPa7J"}}, "lootBoxConfig": {"rewardCount": 55, "rewards": [{"lootBoxItems": [{"count": 55, "itemId": "Y7E8X9J2", "itemSku": "WZ5PLLuJ", "itemType": "QzHLn45N"}, {"count": 8, "itemId": "HNagyxyk", "itemSku": "39T2Y18n", "itemType": "fbnArdg2"}, {"count": 94, "itemId": "MnHEUZsc", "itemSku": "NTf8teVT", "itemType": "7kHrBKH4"}], "name": "zzlZA110", "odds": 0.17904099073438262, "type": "REWARD_GROUP", "weight": 7}, {"lootBoxItems": [{"count": 94, "itemId": "zcPbmUwt", "itemSku": "OYTtHb1s", "itemType": "GI7O9tQp"}, {"count": 20, "itemId": "vYhP3zA1", "itemSku": "sI79Q89m", "itemType": "ilGmvi74"}, {"count": 11, "itemId": "wPS55FvP", "itemSku": "R05rv9ub", "itemType": "VHljZnut"}], "name": "anhG27yd", "odds": 0.5836144173580251, "type": "PROBABILITY_GROUP", "weight": 79}, {"lootBoxItems": [{"count": 81, "itemId": "Y8QbfyEm", "itemSku": "ouhnOdce", "itemType": "92NZtgsO"}, {"count": 32, "itemId": "gNZmNxTA", "itemSku": "OHS5ZZrO", "itemType": "RkYEuDCg"}, {"count": 34, "itemId": "lqKBv0Q5", "itemSku": "XzF8V5CJ", "itemType": "39IecOaq"}], "name": "jfWQxFDI", "odds": 0.24275960930776175, "type": "REWARD_GROUP", "weight": 55}], "rollFunction": "CUSTOM"}, "maxCount": 84, "maxCountPerUser": 36, "name": "VBzv4dU5", "optionBoxConfig": {"boxItems": [{"count": 19, "itemId": "fO1Tmi09", "itemSku": "w3IVOBbN", "itemType": "kDWjhytz"}, {"count": 63, "itemId": "aypAe4wl", "itemSku": "7L9CmUzm", "itemType": "XcfWbZAa"}, {"count": 13, "itemId": "W1GXdBf4", "itemSku": "YR1e3Jmj", "itemType": "65SvtuL6"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 43, "fixedTrialCycles": 39, "graceDays": 35}, "regionData": {"GqQHvzi4": [{"currencyCode": "EeTug409", "currencyNamespace": "IC0edSgd", "currencyType": "REAL", "discountAmount": 91, "discountExpireAt": "1994-05-21T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1991-08-01T00:00:00Z", "discountedPrice": 20, "expireAt": "1980-08-17T00:00:00Z", "price": 63, "purchaseAt": "1977-09-30T00:00:00Z", "trialPrice": 75}, {"currencyCode": "lzqR2gli", "currencyNamespace": "dYPEjara", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1976-12-03T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1999-04-21T00:00:00Z", "discountedPrice": 23, "expireAt": "1986-06-11T00:00:00Z", "price": 22, "purchaseAt": "1991-03-28T00:00:00Z", "trialPrice": 76}, {"currencyCode": "oVDC0nQY", "currencyNamespace": "QRCoIsFo", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1979-09-05T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1983-09-03T00:00:00Z", "discountedPrice": 24, "expireAt": "1976-03-06T00:00:00Z", "price": 73, "purchaseAt": "1979-06-08T00:00:00Z", "trialPrice": 47}], "Y5EpvNbZ": [{"currencyCode": "EFHpP05r", "currencyNamespace": "ta5HRNRC", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1980-10-22T00:00:00Z", "discountPercentage": 30, "discountPurchaseAt": "1981-09-26T00:00:00Z", "discountedPrice": 19, "expireAt": "1971-11-25T00:00:00Z", "price": 5, "purchaseAt": "1981-11-16T00:00:00Z", "trialPrice": 19}, {"currencyCode": "wM22IChp", "currencyNamespace": "VslMmZTi", "currencyType": "VIRTUAL", "discountAmount": 54, "discountExpireAt": "1978-09-23T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1981-08-20T00:00:00Z", "discountedPrice": 98, "expireAt": "1971-07-24T00:00:00Z", "price": 86, "purchaseAt": "1982-02-04T00:00:00Z", "trialPrice": 51}, {"currencyCode": "ECfslIgH", "currencyNamespace": "B7aODQ5W", "currencyType": "VIRTUAL", "discountAmount": 89, "discountExpireAt": "1974-09-02T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1999-02-01T00:00:00Z", "discountedPrice": 19, "expireAt": "1973-10-16T00:00:00Z", "price": 75, "purchaseAt": "1973-10-20T00:00:00Z", "trialPrice": 32}], "tj6hMksZ": [{"currencyCode": "wD5GoUNG", "currencyNamespace": "KwyOYClG", "currencyType": "REAL", "discountAmount": 28, "discountExpireAt": "1983-01-16T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1993-12-11T00:00:00Z", "discountedPrice": 27, "expireAt": "1979-12-25T00:00:00Z", "price": 77, "purchaseAt": "1988-07-06T00:00:00Z", "trialPrice": 81}, {"currencyCode": "8qJvUMF5", "currencyNamespace": "kuYg7SlY", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1999-01-16T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1993-06-07T00:00:00Z", "discountedPrice": 20, "expireAt": "1973-01-01T00:00:00Z", "price": 54, "purchaseAt": "1978-09-02T00:00:00Z", "trialPrice": 80}, {"currencyCode": "ySvkYPro", "currencyNamespace": "920ZlQCE", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1971-08-09T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1976-09-23T00:00:00Z", "discountedPrice": 79, "expireAt": "1973-03-24T00:00:00Z", "price": 90, "purchaseAt": "1990-09-20T00:00:00Z", "trialPrice": 64}]}, "seasonType": "TIER", "sku": "bxsV0j3r", "stackable": false, "status": "ACTIVE", "tags": ["EkePNDUm", "SJeUy6QN", "kP2Q2MG3"], "targetCurrencyCode": "0hZ8ytP6", "targetNamespace": "Cny4k1Dy", "thumbnailUrl": "CC3dBHPM", "useCount": 39}' \
    > test.out 2>&1
eval_tap $? 86 'CreateItem' test.out

#- 87 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'g2DYX2IS' \
    --appId 'tykKqCe1' \
    > test.out 2>&1
eval_tap $? 87 'GetItemByAppId' test.out

#- 88 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'oQO7UQji' \
    --baseAppId '8mJkwEhU' \
    --categoryPath 'ywqGekzx' \
    --features '4c2Eao1U' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --limit '49' \
    --offset '43' \
    --region 'dSdDRLPY' \
    --sortBy 'displayOrder:asc,name,displayOrder:desc' \
    --storeId '3DVQbWaW' \
    --tags 'gJcJ35x3' \
    --targetNamespace 'ncEiEszK' \
    > test.out 2>&1
eval_tap $? 88 'QueryItems' test.out

#- 89 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'd5E73rKB,dtyFFPeg,RBfgnhWq' \
    > test.out 2>&1
eval_tap $? 89 'ListBasicItemsByFeatures' test.out

#- 90 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yneRm4GS' \
    --sku '0DLbNY5d' \
    > test.out 2>&1
eval_tap $? 90 'GetItemBySku' test.out

#- 91 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'tLOi3QPK' \
    --populateBundle  \
    --region 'bKqcaS5Q' \
    --storeId 'VExdEqOT' \
    --sku 'cCLtDR2P' \
    > test.out 2>&1
eval_tap $? 91 'GetLocaleItemBySku' test.out

#- 92 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '7Jm44nXu' \
    --sku 'pdHzvJGF' \
    > test.out 2>&1
eval_tap $? 92 'GetItemIdBySku' test.out

#- 93 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'igWwrvLB,BuI6jwyQ,sgKLqCyn' \
    --storeId 'XP4mmIHi' \
    > test.out 2>&1
eval_tap $? 93 'GetBulkItemIdBySkus' test.out

#- 94 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'wl4ft9vm' \
    --region '9Vk5MU34' \
    --storeId 'a6cssfU5' \
    --itemIds 'lY7E52iJ' \
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
    --userId '5LLHOGvs' \
    --body '{"itemIds": ["2Z1X3ieH", "O8fF5EP7", "Qm59KA1T"]}' \
    > test.out 2>&1
eval_tap $? 96 'ValidateItemPurchaseCondition' test.out

#- 97 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'CODE' \
    --limit '17' \
    --offset '72' \
    --sortBy '5VWBgURb' \
    --storeId 'Sa51hb9X' \
    --keyword 'ev9UV1n4' \
    --language 'ExUe9Vn1' \
    > test.out 2>&1
eval_tap $? 97 'SearchItems' test.out

#- 98 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '32' \
    --offset '94' \
    --sortBy 'displayOrder:desc,updatedAt:desc' \
    --storeId 'DnphkhSt' \
    > test.out 2>&1
eval_tap $? 98 'QueryUncategorizedItems' test.out

#- 99 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'KlDsghkY' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5rlbjofi' \
    > test.out 2>&1
eval_tap $? 99 'GetItem' test.out

#- 100 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'akRZ903Z' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bePVYMbi' \
    --body '{"appId": "eBDGr3fK", "appType": "DLC", "baseAppId": "Y3LyCsgA", "boothName": "DLuPvM1H", "categoryPath": "ws8jRQkM", "clazz": "C4OKI70f", "displayOrder": 3, "entitlementType": "DURABLE", "ext": {"3EnN7rx7": {}, "rgnCLIS8": {}, "zZHDbBPy": {}}, "features": ["s4LkBbYb", "GqfvsjM9", "cy4X1px1"], "images": [{"as": "FCpIbRzS", "caption": "KekV68Rs", "height": 98, "imageUrl": "vmrgT3uF", "smallImageUrl": "f6kTeqjr", "width": 73}, {"as": "cDfdOMNJ", "caption": "RViPLQLV", "height": 29, "imageUrl": "YwX1rBt7", "smallImageUrl": "dmIn81TB", "width": 41}, {"as": "YYdBwGQw", "caption": "kpPx8Wv8", "height": 47, "imageUrl": "tgbnKesw", "smallImageUrl": "NVyC2rxA", "width": 75}], "itemIds": ["9mvVqmDl", "nmvtdV6a", "tKYWtX0z"], "itemQty": {"lca40hF2": 5, "QHzCG8FW": 7, "HI5kUk60": 2}, "itemType": "INGAMEITEM", "listable": true, "localizations": {"DL6pTlc4": {"description": "Dw0staoj", "localExt": {"eUID0bpG": {}, "BqO0Id5w": {}, "xZEQ8zsq": {}}, "longDescription": "FZIrwvDy", "title": "IeU8kEBW"}, "DnC7PQqO": {"description": "XJh1NDer", "localExt": {"GaKiAcdV": {}, "KwU213xL": {}, "wHZgzuWK": {}}, "longDescription": "NBMZOi0V", "title": "ebK6P47h"}, "weiuSFD7": {"description": "wQU7JJNJ", "localExt": {"EV685DBU": {}, "ggdChJ4w": {}, "bfBS2Udt": {}}, "longDescription": "L59LGDCe", "title": "Nv17QXwL"}}, "lootBoxConfig": {"rewardCount": 42, "rewards": [{"lootBoxItems": [{"count": 66, "itemId": "MGyaN1fs", "itemSku": "vNIuZPjK", "itemType": "MBVwmbKI"}, {"count": 85, "itemId": "pnCiUS5Y", "itemSku": "6ckznnZD", "itemType": "rSD4A902"}, {"count": 57, "itemId": "MsUO7KEs", "itemSku": "zPDJuyBX", "itemType": "XGjMbmYJ"}], "name": "S3m9Lxu0", "odds": 0.472033250667126, "type": "PROBABILITY_GROUP", "weight": 70}, {"lootBoxItems": [{"count": 55, "itemId": "BYpwRmIU", "itemSku": "krFpLPpS", "itemType": "GfLFk4t1"}, {"count": 59, "itemId": "ccsYuPr2", "itemSku": "3EbGP7Ti", "itemType": "A0H6vuI7"}, {"count": 3, "itemId": "t3lRpbRX", "itemSku": "eewJhVxW", "itemType": "ILJvlwxq"}], "name": "9MByeuqV", "odds": 0.9290959740285297, "type": "REWARD", "weight": 45}, {"lootBoxItems": [{"count": 59, "itemId": "wiJogWtF", "itemSku": "UGCkjZBs", "itemType": "7h5EvS5v"}, {"count": 19, "itemId": "ZNGUtStn", "itemSku": "EXPwDJFD", "itemType": "rhvBHQNb"}, {"count": 22, "itemId": "0iUq3Pce", "itemSku": "3ERLT60K", "itemType": "rjJXwuUW"}], "name": "OLCtQfGY", "odds": 0.38922646877281664, "type": "REWARD_GROUP", "weight": 24}], "rollFunction": "CUSTOM"}, "maxCount": 39, "maxCountPerUser": 9, "name": "qtc8zCJK", "optionBoxConfig": {"boxItems": [{"count": 41, "itemId": "P0RvB1A3", "itemSku": "Z9jRIC9g", "itemType": "kFHrfAij"}, {"count": 59, "itemId": "oTartntd", "itemSku": "XZt85QEq", "itemType": "iO5zIyUK"}, {"count": 57, "itemId": "ceUzWz1v", "itemSku": "VyawEKbY", "itemType": "rZTL1ZJS"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 75, "fixedTrialCycles": 25, "graceDays": 26}, "regionData": {"wFAYri6L": [{"currencyCode": "PWOEUNkK", "currencyNamespace": "2VGAi8Ek", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1979-07-28T00:00:00Z", "discountPercentage": 71, "discountPurchaseAt": "1981-09-30T00:00:00Z", "discountedPrice": 69, "expireAt": "1987-02-08T00:00:00Z", "price": 98, "purchaseAt": "1975-04-19T00:00:00Z", "trialPrice": 87}, {"currencyCode": "RAieKorZ", "currencyNamespace": "eXVX2SwG", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1973-07-16T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1971-12-19T00:00:00Z", "discountedPrice": 75, "expireAt": "1978-03-09T00:00:00Z", "price": 47, "purchaseAt": "1980-11-13T00:00:00Z", "trialPrice": 71}, {"currencyCode": "8ebtC6vb", "currencyNamespace": "exUThJ1V", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1982-06-10T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1971-04-23T00:00:00Z", "discountedPrice": 37, "expireAt": "1991-05-28T00:00:00Z", "price": 21, "purchaseAt": "1989-12-26T00:00:00Z", "trialPrice": 6}], "A3ZSX7zn": [{"currencyCode": "kvzvXOTX", "currencyNamespace": "HuEUp0qE", "currencyType": "REAL", "discountAmount": 17, "discountExpireAt": "1974-11-18T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1983-03-09T00:00:00Z", "discountedPrice": 2, "expireAt": "1996-07-05T00:00:00Z", "price": 80, "purchaseAt": "1978-05-04T00:00:00Z", "trialPrice": 15}, {"currencyCode": "fT16N9YO", "currencyNamespace": "H9OmTzhz", "currencyType": "VIRTUAL", "discountAmount": 12, "discountExpireAt": "1999-05-14T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1979-07-04T00:00:00Z", "discountedPrice": 43, "expireAt": "1976-02-07T00:00:00Z", "price": 52, "purchaseAt": "1972-02-08T00:00:00Z", "trialPrice": 43}, {"currencyCode": "9XkwCnrZ", "currencyNamespace": "W3zIhdPH", "currencyType": "VIRTUAL", "discountAmount": 29, "discountExpireAt": "1991-12-01T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1981-01-08T00:00:00Z", "discountedPrice": 62, "expireAt": "1974-07-22T00:00:00Z", "price": 7, "purchaseAt": "1991-07-02T00:00:00Z", "trialPrice": 21}], "44qwXDDm": [{"currencyCode": "KuntNG4T", "currencyNamespace": "ykauOc7g", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1971-11-19T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1971-10-03T00:00:00Z", "discountedPrice": 36, "expireAt": "1987-10-04T00:00:00Z", "price": 65, "purchaseAt": "1994-11-26T00:00:00Z", "trialPrice": 61}, {"currencyCode": "nOyiM4AU", "currencyNamespace": "mR2XtxB0", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1993-05-27T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1998-01-14T00:00:00Z", "discountedPrice": 87, "expireAt": "1974-04-08T00:00:00Z", "price": 10, "purchaseAt": "1985-11-06T00:00:00Z", "trialPrice": 8}, {"currencyCode": "0V8bgoTn", "currencyNamespace": "gI5v5iGF", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1986-12-20T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1997-04-05T00:00:00Z", "discountedPrice": 57, "expireAt": "1978-10-09T00:00:00Z", "price": 77, "purchaseAt": "1993-11-02T00:00:00Z", "trialPrice": 66}]}, "seasonType": "PASS", "sku": "83IVeMjb", "stackable": true, "status": "ACTIVE", "tags": ["7G8GrKll", "rddwAUBG", "INGahuU4"], "targetCurrencyCode": "ubTyNzAd", "targetNamespace": "g92CfWzl", "thumbnailUrl": "FJ7aZAY0", "useCount": 93}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItem' test.out

#- 101 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'SDha3hZL' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'T5eT4vG1' \
    > test.out 2>&1
eval_tap $? 101 'DeleteItem' test.out

#- 102 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'Oxpgv5GJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 86, "orderNo": "Z3e3PXtm"}' \
    > test.out 2>&1
eval_tap $? 102 'AcquireItem' test.out

#- 103 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'a7licwu8' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'dnWrcxBb' \
    > test.out 2>&1
eval_tap $? 103 'GetApp' test.out

#- 104 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'nQFMeHdx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mNXxbYE8' \
    --body '{"carousel": [{"alt": "T0mVG7OC", "previewUrl": "nhUozDYK", "thumbnailUrl": "Vlazgv2V", "type": "image", "url": "j9HZGW7Y", "videoSource": "vimeo"}, {"alt": "791uDE42", "previewUrl": "sgm2CX3k", "thumbnailUrl": "6XH9PTEq", "type": "video", "url": "NWUs5Ovz", "videoSource": "generic"}, {"alt": "sJCZeDCD", "previewUrl": "MCq2rnGj", "thumbnailUrl": "QKe5r4NM", "type": "image", "url": "nsiAZyUB", "videoSource": "youtube"}], "developer": "MxDN0oGB", "forumUrl": "JZPGkoJw", "genres": ["Sports", "Casual", "Simulation"], "localizations": {"FhwMYVp1": {"announcement": "vIext7jE", "slogan": "bChHZQXz"}, "kuMMF1FD": {"announcement": "eCo4wexM", "slogan": "g4zjxVFT"}, "KFUFlPvO": {"announcement": "vQEA62BG", "slogan": "UWARVQRw"}}, "platformRequirements": {"KPNhHVn6": [{"additionals": "b4LrgdD1", "directXVersion": "6WwWFeg2", "diskSpace": "3RRqltGD", "graphics": "TEpNLMNX", "label": "9aWnnf41", "osVersion": "tpUMwc3m", "processor": "KDFG0tTk", "ram": "NzOhk9ot", "soundCard": "TvM7B9Ux"}, {"additionals": "ehlz0kTi", "directXVersion": "AwHlpLTZ", "diskSpace": "dC4YO9ju", "graphics": "OxRoHCf0", "label": "i0SUGAXs", "osVersion": "uz8n1SDt", "processor": "vBuKUBMz", "ram": "64G8dzU0", "soundCard": "QaSfcPbN"}, {"additionals": "pHA4qwgz", "directXVersion": "O7G75p6b", "diskSpace": "n6NlnECj", "graphics": "5XHiTUFN", "label": "td4Emy5k", "osVersion": "W49VL3pF", "processor": "mz7ysA7l", "ram": "H5c2QZDC", "soundCard": "UI6ijqK3"}], "vW6HcUE5": [{"additionals": "aSZgUjSr", "directXVersion": "nSyixfCs", "diskSpace": "jwdHwhAF", "graphics": "cTvr9aAI", "label": "BqZNHN8H", "osVersion": "eHR03KOy", "processor": "N0ZrnMlB", "ram": "rSMPfhun", "soundCard": "eZHC0tmR"}, {"additionals": "JRpyYd0T", "directXVersion": "uDxHZYAc", "diskSpace": "kvMycIxZ", "graphics": "0Grr9zr2", "label": "0BA7ZUlL", "osVersion": "ayh2Ky7P", "processor": "WwURWpWf", "ram": "m0NcUexi", "soundCard": "sar6rOq6"}, {"additionals": "d59oEPAX", "directXVersion": "WrL2O4To", "diskSpace": "MuYJgW2S", "graphics": "TPhDnlA3", "label": "cg5Vw2VI", "osVersion": "3DMDPadh", "processor": "K6oUIn4h", "ram": "cAqvawiC", "soundCard": "CM16f4MV"}], "GHZYYWeY": [{"additionals": "cfWFUJ7U", "directXVersion": "3McOM043", "diskSpace": "WCTo4d5o", "graphics": "0vNotYsz", "label": "hKpVPwQA", "osVersion": "fyI4QCIK", "processor": "YZ1uD8Vf", "ram": "XTljS4gk", "soundCard": "YlgjvoLE"}, {"additionals": "GEKuEAFe", "directXVersion": "hgmXrTeH", "diskSpace": "hF9JtUrX", "graphics": "wbSTkBPu", "label": "xwe7ZICd", "osVersion": "cvubyjNR", "processor": "ypii1lfw", "ram": "7m5o2Nru", "soundCard": "GQL60Ayk"}, {"additionals": "o7hjXIxR", "directXVersion": "UNKfvw5r", "diskSpace": "YTXBFtkN", "graphics": "0699i5FR", "label": "zZbMiQym", "osVersion": "8y2XmWkz", "processor": "euWQTF8d", "ram": "AEVBvDlx", "soundCard": "jHn3w56o"}]}, "platforms": ["Linux", "IOS", "MacOS"], "players": ["MMO", "Multi", "CrossPlatformMulti"], "primaryGenre": "MassivelyMultiplayer", "publisher": "rsoe7411", "releaseDate": "1977-12-23T00:00:00Z", "websiteUrl": "ZaAP3rX7"}' \
    > test.out 2>&1
eval_tap $? 104 'UpdateApp' test.out

#- 105 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'Wp94TCrf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Eo2Joa2H' \
    > test.out 2>&1
eval_tap $? 105 'DisableItem' test.out

#- 106 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'Dsr5Uxcn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetItemDynamicData' test.out

#- 107 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '2ACWlJR3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mHER9pJB' \
    > test.out 2>&1
eval_tap $? 107 'EnableItem' test.out

#- 108 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'N4xGdH59' \
    --itemId 'FLL6Yjud' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ch62TVlw' \
    > test.out 2>&1
eval_tap $? 108 'FeatureItem' test.out

#- 109 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'jMTrcmL2' \
    --itemId 'PlOQkLGz' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gzDOaMSd' \
    > test.out 2>&1
eval_tap $? 109 'DefeatureItem' test.out

#- 110 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'JtaGn3ni' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'rlI6Wb2a' \
    --populateBundle  \
    --region '3MaDS3yq' \
    --storeId '6aorr9hW' \
    > test.out 2>&1
eval_tap $? 110 'GetLocaleItem' test.out

#- 111 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'KNiRIFql' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZyNKfVPw' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 25, "comparison": "isLessThanOrEqual", "name": "Tsg2YU4q", "predicateType": "EntitlementPredicate", "value": "KaqAbNoX", "values": ["wk4XqXip", "sAfnjm4K", "mIBRoKhR"]}, {"anyOf": 45, "comparison": "isNot", "name": "MQzL1xA4", "predicateType": "SeasonTierPredicate", "value": "wpLRvLGb", "values": ["8L4UiQbf", "MB3JmPx0", "LFHGCMCA"]}, {"anyOf": 76, "comparison": "isNot", "name": "fYmAZlx7", "predicateType": "EntitlementPredicate", "value": "Baj9Vtcl", "values": ["lXk5QjEI", "rvNH3mpn", "ZOHQKuF0"]}]}, {"operator": "and", "predicates": [{"anyOf": 10, "comparison": "isNot", "name": "aUg7EmbX", "predicateType": "SeasonTierPredicate", "value": "cQMSgMG5", "values": ["iK1CPK8u", "bePivOOf", "Orc57X9x"]}, {"anyOf": 36, "comparison": "isGreaterThan", "name": "VEXGHB5M", "predicateType": "SeasonTierPredicate", "value": "OdPpCTuf", "values": ["qWKa5skM", "3Bccs8ME", "YKxxToKb"]}, {"anyOf": 20, "comparison": "isLessThanOrEqual", "name": "Hwezlpvs", "predicateType": "SeasonPassPredicate", "value": "XDBlkiyd", "values": ["Ig2qDUgd", "Y7EA4Kqm", "FjU61H86"]}]}, {"operator": "or", "predicates": [{"anyOf": 86, "comparison": "is", "name": "v4rjogQ5", "predicateType": "SeasonPassPredicate", "value": "IKIZLZ5F", "values": ["sE71uXTv", "Vz3diLVN", "AxdLctpV"]}, {"anyOf": 31, "comparison": "isLessThanOrEqual", "name": "sFg3EGlU", "predicateType": "SeasonTierPredicate", "value": "dNk87Qqf", "values": ["XNssheYj", "3uyXuRKt", "Xzty0YYG"]}, {"anyOf": 14, "comparison": "is", "name": "SuUeirDg", "predicateType": "SeasonTierPredicate", "value": "mpodaL57", "values": ["0PyubFJx", "IJTRPXP6", "7VwlOP9m"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 111 'UpdateItemPurchaseCondition' test.out

#- 112 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '1JhsdFyN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "reJBdMoe"}' \
    > test.out 2>&1
eval_tap $? 112 'ReturnItem' test.out

#- 113 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --name 'TGXaMcfa' \
    --offset '18' \
    --tag '0LELSNJV' \
    > test.out 2>&1
eval_tap $? 113 'QueryKeyGroups' test.out

#- 114 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "WGe2Ak7G", "name": "JNGQOVAj", "status": "INACTIVE", "tags": ["uhyI3TQA", "yuxdGWKB", "KkqvkoJ5"]}' \
    > test.out 2>&1
eval_tap $? 114 'CreateKeyGroup' test.out

#- 115 GetKeyGroupByBoothName
eval_tap 0 115 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 116 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'Lb3LmlbF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetKeyGroup' test.out

#- 117 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'QNSIeYkO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "I5KD9toy", "name": "Pcc69CfU", "status": "ACTIVE", "tags": ["aaDFoAvH", "dUzKf6tv", "HUCg73hO"]}' \
    > test.out 2>&1
eval_tap $? 117 'UpdateKeyGroup' test.out

#- 118 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'TAFWlEFQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetKeyGroupDynamic' test.out

#- 119 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'Sp6z3Wu1' \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '67' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 119 'ListKeys' test.out

#- 120 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'NxKb0hP3' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 120 'UploadKeys' test.out

#- 121 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'FbASTwYQ' \
    --limit '30' \
    --offset '3' \
    --orderNos 'TU0lw756,7whBry2U,mh9jve6Y' \
    --sortBy 'hwzK6uMY' \
    --startTime 'cq4CfMM4' \
    --status 'CHARGEBACK_REVERSED' \
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
    --orderNo 'tDohqaBI' \
    > test.out 2>&1
eval_tap $? 123 'GetOrder' test.out

#- 124 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ltLVL4Ll' \
    --body '{"description": "saYTwoxr"}' \
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
    --body '{"dryRun": false, "notifyUrl": "dv62weHo", "privateKey": "uPCnaS8h"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdatePaymentCallbackConfig' test.out

#- 127 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '3LasG9fK' \
    --externalId 'VWI2LXIa' \
    --limit '46' \
    --notificationSource 'STRIPE' \
    --notificationType 'eK2y9fLc' \
    --offset '13' \
    --paymentOrderNo 'eAqHCijO' \
    --startDate '1O7vQvzy' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 127 'QueryPaymentNotifications' test.out

#- 128 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId '4ZFkawAo' \
    --limit '12' \
    --offset '59' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 128 'QueryPaymentOrders' test.out

#- 129 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "7qCgRpBQ", "currencyNamespace": "WKs1mHcZ", "customParameters": {"t8ZMHfQR": {}, "qXJdxDOf": {}, "VhqHkdRQ": {}}, "description": "TfMOLcCq", "extOrderNo": "QlAY4fLi", "extUserId": "4vKyhIS6", "itemType": "SEASON", "language": "KMvT-KYZg_vq", "metadata": {"ZWvXgSCO": "yRof4t7E", "M45Lt14V": "m5CfGXQ7", "HOmycKau": "vo5MzqWX"}, "notifyUrl": "R3u9YmCR", "omitNotification": true, "platform": "1TgvFRV0", "price": 55, "recurringPaymentOrderNo": "KobqcTC2", "region": "J8xwFjXi", "returnUrl": "W2ZC24VC", "sandbox": false, "sku": "fpBy4BAe", "subscriptionId": "8cUsL2se", "targetNamespace": "ar9NuOtj", "targetUserId": "pw1T5itk", "title": "Ae7O2qwr"}' \
    > test.out 2>&1
eval_tap $? 129 'CreatePaymentOrderByDedicated' test.out

#- 130 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 't1hNFhfX' \
    > test.out 2>&1
eval_tap $? 130 'ListExtOrderNoByExtTxId' test.out

#- 131 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AUwiPNOw' \
    > test.out 2>&1
eval_tap $? 131 'GetPaymentOrder' test.out

#- 132 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'buw5iTnt' \
    --body '{"extTxId": "Vn32b2rq", "paymentMethod": "QXC5cCp3", "paymentProvider": "PAYPAL"}' \
    > test.out 2>&1
eval_tap $? 132 'ChargePaymentOrder' test.out

#- 133 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'HspqOOKg' \
    --body '{"description": "M6eZ02P1"}' \
    > test.out 2>&1
eval_tap $? 133 'RefundPaymentOrderByDedicated' test.out

#- 134 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vODSUVKV' \
    --body '{"amount": 63, "currencyCode": "IwZR5OJ2", "notifyType": "REFUND", "paymentProvider": "STRIPE", "salesTax": 33, "vat": 13}' \
    > test.out 2>&1
eval_tap $? 134 'SimulatePaymentOrderNotification' test.out

#- 135 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0rCZFKut' \
    > test.out 2>&1
eval_tap $? 135 'GetPaymentOrderChargeStatus' test.out

#- 136 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 136 'GetPlatformWalletConfig' test.out

#- 137 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["GooglePlay", "Nintendo", "Stadia"]}' \
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
    --body '{"description": "f7XcHiom", "eventTopic": "OzRlw024", "maxAwarded": 68, "maxAwardedPerUser": 42, "namespaceExpression": "59r6KRRl", "rewardCode": "bhUQ8nev", "rewardConditions": [{"condition": "d3xWf6t5", "conditionName": "apjPKHXN", "eventName": "PyIdNfrz", "rewardItems": [{"duration": 72, "itemId": "Y4evVe4D", "quantity": 40}, {"duration": 92, "itemId": "YZzkpYY7", "quantity": 62}, {"duration": 30, "itemId": "87hz4ItO", "quantity": 74}]}, {"condition": "dMNtJhaY", "conditionName": "ZEZEhQuw", "eventName": "WWhisipU", "rewardItems": [{"duration": 93, "itemId": "c2l06MgO", "quantity": 4}, {"duration": 17, "itemId": "vHa30PMD", "quantity": 7}, {"duration": 82, "itemId": "GllEID7h", "quantity": 85}]}, {"condition": "Uju3arEs", "conditionName": "NZKtRVOu", "eventName": "clJJ8iC3", "rewardItems": [{"duration": 68, "itemId": "LYj9eaYs", "quantity": 95}, {"duration": 44, "itemId": "KoprEsxS", "quantity": 100}, {"duration": 70, "itemId": "S8m2pfze", "quantity": 23}]}], "userIdExpression": "hUapbJXg"}' \
    > test.out 2>&1
eval_tap $? 139 'CreateReward' test.out

#- 140 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'cbQ9yCqg' \
    --limit '75' \
    --offset '22' \
    --sortBy 'namespace,rewardCode,namespace:desc' \
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
    --rewardId 'FGhUMpxR' \
    > test.out 2>&1
eval_tap $? 143 'GetReward' test.out

#- 144 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'm4UcxmlL' \
    --body '{"description": "m9EHxx9l", "eventTopic": "vV0IKeBk", "maxAwarded": 9, "maxAwardedPerUser": 33, "namespaceExpression": "X097Rtgp", "rewardCode": "OJ8ALtTg", "rewardConditions": [{"condition": "x8cCpYl1", "conditionName": "Kvoc6rlu", "eventName": "35F8qbQF", "rewardItems": [{"duration": 28, "itemId": "85hg2hqN", "quantity": 18}, {"duration": 85, "itemId": "u0WhVY36", "quantity": 61}, {"duration": 34, "itemId": "bNTb9uIX", "quantity": 71}]}, {"condition": "F87JYSro", "conditionName": "V80gim8a", "eventName": "UBe2JX91", "rewardItems": [{"duration": 67, "itemId": "2e0DYmWy", "quantity": 77}, {"duration": 22, "itemId": "dBedGjzC", "quantity": 44}, {"duration": 96, "itemId": "0FwRQgIo", "quantity": 21}]}, {"condition": "TRdHu64u", "conditionName": "ISflspmv", "eventName": "qEmvSpv8", "rewardItems": [{"duration": 68, "itemId": "xcLdaOZv", "quantity": 28}, {"duration": 65, "itemId": "368tWEv5", "quantity": 59}, {"duration": 67, "itemId": "tX5bxg5U", "quantity": 76}]}], "userIdExpression": "IKqaRes1"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateReward' test.out

#- 145 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'r5EoZf38' \
    > test.out 2>&1
eval_tap $? 145 'DeleteReward' test.out

#- 146 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'O52cNuET' \
    --body '{"payload": {"e8Hhb9Xx": {}, "IbtBPh6k": {}, "6KomjCmt": {}}}' \
    > test.out 2>&1
eval_tap $? 146 'CheckEventCondition' test.out

#- 147 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ePIMLhhl' \
    --body '{"conditionName": "ghfxROAZ", "userId": "O0gx4yGj"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteRewardConditionRecord' test.out

#- 148 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'DoOSGwYR' \
    --limit '96' \
    --offset '9' \
    --start 'H2xYFBu2' \
    --storeId 'mWlobHKU' \
    --viewId 'ziUsU6t9' \
    > test.out 2>&1
eval_tap $? 148 'QuerySections' test.out

#- 149 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O20dg4Ad' \
    --body '{"active": true, "displayOrder": 0, "endDate": "1987-06-09T00:00:00Z", "ext": {"QR5SL2Fd": {}, "3gqaCJ0S": {}, "xNVrNksy": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 52, "itemCount": 18, "rule": "SEQUENCE"}, "items": [{"id": "uK99Lalz", "sku": "dRGDZ5iw"}, {"id": "RiQbTxUz", "sku": "TSVfCJEb"}, {"id": "3drjpl6X", "sku": "HRs3UCkP"}], "localizations": {"6FCEM28E": {"description": "lhdUz8il", "localExt": {"spDqB6M4": {}, "AylnTafX": {}, "kYpQfwo6": {}}, "longDescription": "auZ7W8Vj", "title": "WEp0xR5b"}, "OB1oebz0": {"description": "8PAk0PcN", "localExt": {"rbrxpcoE": {}, "OpwfFqji": {}, "IwseZSrW": {}}, "longDescription": "CtEo9jm6", "title": "XOX3wefz"}, "ZSV6wtdc": {"description": "jEyOpWXa", "localExt": {"zhQqSDok": {}, "Z6iGDDcB": {}, "lvcDmdVc": {}}, "longDescription": "ge53OjmJ", "title": "lCSOCA34"}}, "name": "APojXhuh", "rotationType": "CUSTOM", "startDate": "1971-02-03T00:00:00Z", "viewId": "l7BFuSRf"}' \
    > test.out 2>&1
eval_tap $? 149 'CreateSection' test.out

#- 150 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UC3lUG99' \
    > test.out 2>&1
eval_tap $? 150 'PurgeExpiredSection' test.out

#- 151 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'fQprd85w' \
    --storeId 'k4ldncT5' \
    > test.out 2>&1
eval_tap $? 151 'GetSection' test.out

#- 152 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'OHSRX1wd' \
    --storeId 'fsRDE2by' \
    --body '{"active": true, "displayOrder": 26, "endDate": "1990-12-30T00:00:00Z", "ext": {"kX1d2VTq": {}, "NkgBCMua": {}, "9usvaOsG": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 95, "itemCount": 26, "rule": "SEQUENCE"}, "items": [{"id": "kdK4Aemj", "sku": "mCk3IOvF"}, {"id": "bFihymOO", "sku": "f2HJ6ivg"}, {"id": "1IKMx9pI", "sku": "C5M1ri7g"}], "localizations": {"5eEpOeoC": {"description": "ha6L04T4", "localExt": {"cpZirJze": {}, "HKtjGcvk": {}, "8DXYdHFo": {}}, "longDescription": "ITTW6Cxh", "title": "ePUg0ICh"}, "bDz82UiP": {"description": "WRLn2BVP", "localExt": {"yzFLNJQ1": {}, "UxUfWdyb": {}, "QXP4EodV": {}}, "longDescription": "y19zBcHJ", "title": "YEQ5DhfD"}, "T1EHmnl0": {"description": "w6JjoUhI", "localExt": {"ZKxKVmZF": {}, "vK9AgYEz": {}, "6gIAHX6h": {}}, "longDescription": "aewhj3dn", "title": "tnaAndlx"}}, "name": "j1btaEwz", "rotationType": "CUSTOM", "startDate": "1984-10-22T00:00:00Z", "viewId": "FxgZHKVK"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSection' test.out

#- 153 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'p8CzvIGj' \
    --storeId 'oRAkDjFJ' \
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
    --body '{"defaultLanguage": "x3hz4Ebe", "defaultRegion": "fBmJUoIM", "description": "r0TS51C6", "supportedLanguages": ["zxgNvVxL", "kl7czmHH", "s3uSz0SP"], "supportedRegions": ["vxEdLXQl", "yCeDhtSC", "GSJoaBWm"], "title": "7JmHjc3E"}' \
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
    --storeId 'EQcnTMtw' \
    > test.out 2>&1
eval_tap $? 161 'GetStore' test.out

#- 162 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '6UwzKgu8' \
    --body '{"defaultLanguage": "AFvFCcFC", "defaultRegion": "5oGtS3O4", "description": "SRK8Jij2", "supportedLanguages": ["fnTzDuKW", "JES53ITh", "KEHzTVDQ"], "supportedRegions": ["1NQiJWH5", "MIEbvefX", "mkhOPWYb"], "title": "SY5i8gfK"}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateStore' test.out

#- 163 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'D12mxHoG' \
    > test.out 2>&1
eval_tap $? 163 'DeleteStore' test.out

#- 164 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uokX9f7L' \
    --action 'UPDATE' \
    --itemSku 'efS8I75u' \
    --itemType 'OPTIONBOX' \
    --limit '10' \
    --offset '37' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt:asc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'woOfdWRt' \
    --updatedAtStart 'XjlYjYKY' \
    > test.out 2>&1
eval_tap $? 164 'QueryChanges' test.out

#- 165 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '2H8hs8oL' \
    > test.out 2>&1
eval_tap $? 165 'PublishAll' test.out

#- 166 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Qckkl9mg' \
    > test.out 2>&1
eval_tap $? 166 'PublishSelected' test.out

#- 167 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GoTlbK4Q' \
    > test.out 2>&1
eval_tap $? 167 'SelectAllRecords' test.out

#- 168 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UYmVNxni' \
    --action 'DELETE' \
    --itemSku 'eTICtFdG' \
    --itemType 'CODE' \
    --type 'ITEM' \
    --updatedAtEnd 'iEZiu4nZ' \
    --updatedAtStart 'ebFcH700' \
    > test.out 2>&1
eval_tap $? 168 'GetStatistic' test.out

#- 169 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'A5DtyZ5r' \
    > test.out 2>&1
eval_tap $? 169 'UnselectAllRecords' test.out

#- 170 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'AwgIRMVx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'suCU3FL2' \
    > test.out 2>&1
eval_tap $? 170 'SelectRecord' test.out

#- 171 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId '4t06875U' \
    --namespace "$AB_NAMESPACE" \
    --storeId 's0gxDqIs' \
    > test.out 2>&1
eval_tap $? 171 'UnselectRecord' test.out

#- 172 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JHCUyrkI' \
    --targetStoreId 'WgsqpBCg' \
    > test.out 2>&1
eval_tap $? 172 'CloneStore' test.out

#- 173 ExportStore
eval_tap 0 173 'ExportStore # SKIP deprecated' test.out

#- 174 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'liM5nkcr' \
    --limit '47' \
    --offset '68' \
    --sku '6aS1jhJ3' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId '6m6JdlrI' \
    > test.out 2>&1
eval_tap $? 174 'QuerySubscriptions' test.out

#- 175 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'C2rnBjhR' \
    > test.out 2>&1
eval_tap $? 175 'RecurringChargeSubscription' test.out

#- 176 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '9DZxdbIs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'GetTicketDynamic' test.out

#- 177 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'YF5cPP6M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "oY7fS6cG"}' \
    > test.out 2>&1
eval_tap $? 177 'DecreaseTicketSale' test.out

#- 178 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'dZFR5KI2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetTicketBoothID' test.out

#- 179 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'xhXrdiSW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 33, "orderNo": "HUB5T48W"}' \
    > test.out 2>&1
eval_tap $? 179 'IncreaseTicketSale' test.out

#- 180 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEWieM34' \
    --body '{"achievements": [{"id": "vZHMEeMG", "value": 69}, {"id": "hIoAZg9a", "value": 57}, {"id": "LBTAd5CQ", "value": 47}], "steamUserId": "fZXtEoaE"}' \
    > test.out 2>&1
eval_tap $? 180 'UnlockSteamUserAchievement' test.out

#- 181 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'RvMutQph' \
    --xboxUserId 'dFTi5fRw' \
    > test.out 2>&1
eval_tap $? 181 'GetXblUserAchievements' test.out

#- 182 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'jQ4xmoZZ' \
    --body '{"achievements": [{"id": "QHSAMRoF", "percentComplete": 86}, {"id": "2eOEgIVR", "percentComplete": 86}, {"id": "1gWEypDb", "percentComplete": 74}], "serviceConfigId": "NXv9YqL1", "titleId": "C2wKSRML", "xboxUserId": "Wvj9tZub"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateXblUserAchievement' test.out

#- 183 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'ptVwchxE' \
    > test.out 2>&1
eval_tap $? 183 'AnonymizeCampaign' test.out

#- 184 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2O5wg7j' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeEntitlement' test.out

#- 185 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'K9Oc4anI' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeFulfillment' test.out

#- 186 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQQwhhee' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeIntegration' test.out

#- 187 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'YHvCobz3' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeOrder' test.out

#- 188 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'szDNvADy' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizePayment' test.out

#- 189 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'oP04WMLy' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizeSubscription' test.out

#- 190 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'iIacWGEb' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeWallet' test.out

#- 191 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rdinu8ke' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 191 'GetUserDLC' test.out

#- 192 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ODrt0gY8' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'ttSPAHZq' \
    --features '9tHBevIb,pjpGXbHF,ZgtLfDWS' \
    --itemId 'rBmD64zu,gWoOKfuh,H1nT5ZS8' \
    --limit '26' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 192 'QueryUserEntitlements' test.out

#- 193 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCsCJgvT' \
    --body '[{"endDate": "1997-12-16T00:00:00Z", "grantedCode": "xhhVlHZf", "itemId": "FyC62DMK", "itemNamespace": "ND28nhc5", "language": "pbRZ", "quantity": 42, "region": "QqNEw96A", "source": "REDEEM_CODE", "startDate": "1992-02-20T00:00:00Z", "storeId": "XdSqrNXM"}, {"endDate": "1973-08-10T00:00:00Z", "grantedCode": "qvnFR5p0", "itemId": "R5X18jFy", "itemNamespace": "ND4nI7RZ", "language": "kq_MMhr_oD", "quantity": 4, "region": "hp2QSiCM", "source": "PROMOTION", "startDate": "1972-06-24T00:00:00Z", "storeId": "RhzBej6c"}, {"endDate": "1984-03-28T00:00:00Z", "grantedCode": "W3VHY990", "itemId": "4IK0arfZ", "itemNamespace": "EC899fYp", "language": "ChvY-cfVM_359", "quantity": 33, "region": "qrHW7Be7", "source": "PURCHASE", "startDate": "1991-08-27T00:00:00Z", "storeId": "f2jY90Mm"}]' \
    > test.out 2>&1
eval_tap $? 193 'GrantUserEntitlement' test.out

#- 194 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pH2hv2VK' \
    --activeOnly  \
    --appId 'Iqckpxui' \
    > test.out 2>&1
eval_tap $? 194 'GetUserAppEntitlementByAppId' test.out

#- 195 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'bKWObJoL' \
    --activeOnly  \
    --limit '100' \
    --offset '39' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 195 'QueryUserEntitlementsByAppType' test.out

#- 196 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TKHImtN7' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'yQc3XedF' \
    > test.out 2>&1
eval_tap $? 196 'GetUserEntitlementByItemId' test.out

#- 197 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mp0q37gv' \
    --ids 'QsbV4RLZ,BBjAEmxp,Drpf7kGX' \
    > test.out 2>&1
eval_tap $? 197 'GetUserActiveEntitlementsByItemIds' test.out

#- 198 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWFgYbNa' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --sku 'VN6wCmK4' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementBySku' test.out

#- 199 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'swpbo6kS' \
    --appIds 'heKiQXwP,BmAC5KtT,ypJp1wiA' \
    --itemIds 'cgpOJ70e,FoBYozJX,tZBq1CBg' \
    --skus 'P1dLH8wE,XXOzZ6rv,ccPAA9YA' \
    > test.out 2>&1
eval_tap $? 199 'ExistsAnyUserActiveEntitlement' test.out

#- 200 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '9gwRgsEl' \
    --itemIds 'RWaUjvFr,18Pc7xCt,EZpVqyId' \
    > test.out 2>&1
eval_tap $? 200 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 201 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '9HA3iHf7' \
    --appId 'UhMPT2MF' \
    > test.out 2>&1
eval_tap $? 201 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 202 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'TXt3x0pZ' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'lY7rmDbg' \
    > test.out 2>&1
eval_tap $? 202 'GetUserEntitlementOwnershipByItemId' test.out

#- 203 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'm1coL5mB' \
    --ids 'aloWaF5y,MHZIg4N7,hRSrHZbY' \
    > test.out 2>&1
eval_tap $? 203 'GetUserEntitlementOwnershipByItemIds' test.out

#- 204 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ti5ezXFU' \
    --entitlementClazz 'MEDIA' \
    --sku 'yo37CsVW' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipBySku' test.out

#- 205 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jT3KAWvG' \
    --entitlementIds 'VGv6ca5v' \
    > test.out 2>&1
eval_tap $? 205 'RevokeUserEntitlements' test.out

#- 206 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'aKlVzV9i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tt3gSRoL' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlement' test.out

#- 207 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'XnX8Begm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qm6tiYO8' \
    --body '{"endDate": "1976-11-08T00:00:00Z", "nullFieldList": ["j6NTzFnF", "7ywLkL88", "1qmp5X1C"], "startDate": "1980-01-16T00:00:00Z", "status": "ACTIVE", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 207 'UpdateUserEntitlement' test.out

#- 208 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'CDQRPT2j' \
    --namespace "$AB_NAMESPACE" \
    --userId '8fVnc7vu' \
    --body '{"options": ["kkZ6MMGx", "XDU0Mcu0", "FanZrJj3"], "requestId": "GnqoWTKH", "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 208 'ConsumeUserEntitlement' test.out

#- 209 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'YMIxaVGK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yw59Vdwk' \
    > test.out 2>&1
eval_tap $? 209 'DisableUserEntitlement' test.out

#- 210 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'WIEBr27X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKLOAA0e' \
    > test.out 2>&1
eval_tap $? 210 'EnableUserEntitlement' test.out

#- 211 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'DsOk9qN5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'csex1Pgx' \
    > test.out 2>&1
eval_tap $? 211 'GetUserEntitlementHistories' test.out

#- 212 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'wr1shOiu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qTvMiIVo' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserEntitlement' test.out

#- 213 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ri6ZUlX1' \
    --body '{"duration": 90, "endDate": "1980-11-20T00:00:00Z", "itemId": "PokvDOts", "itemSku": "AhR2UJB4", "language": "zKF5RBJV", "order": {"currency": {"currencyCode": "S7td3LHf", "currencySymbol": "zuP24DCm", "currencyType": "VIRTUAL", "decimals": 74, "namespace": "1FEUPzkC"}, "ext": {"6xUXQu0i": {}, "gKGW498g": {}, "z54ag5v1": {}}, "free": true}, "orderNo": "XA2pCuK2", "origin": "Playstation", "quantity": 43, "region": "YHnhAlcn", "source": "PURCHASE", "startDate": "1988-12-22T00:00:00Z", "storeId": "mgWSabjo"}' \
    > test.out 2>&1
eval_tap $? 213 'FulfillItem' test.out

#- 214 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'hxP9lGYS' \
    --body '{"code": "8FhxIuVV", "language": "UYMf-VFXW", "region": "f4OdtqGk"}' \
    > test.out 2>&1
eval_tap $? 214 'RedeemCode' test.out

#- 215 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'ts7PreCs' \
    --body '{"origin": "Xbox", "rewards": [{"currency": {"currencyCode": "zyMEHpwr", "namespace": "h8BRKNWi"}, "item": {"itemId": "dxmy7tAP", "itemSku": "E77rU1Ro", "itemType": "oWaCk2oc"}, "quantity": 25, "type": "CURRENCY"}, {"currency": {"currencyCode": "8Au1QPpZ", "namespace": "GCQM5HBJ"}, "item": {"itemId": "EWJEPObQ", "itemSku": "JJaCLwpT", "itemType": "8sWzMkJ1"}, "quantity": 17, "type": "ITEM"}, {"currency": {"currencyCode": "YKK9n00R", "namespace": "wh9IOR7a"}, "item": {"itemId": "iBlafOkL", "itemSku": "eYeVZInO", "itemType": "EWhdQyQU"}, "quantity": 27, "type": "ITEM"}], "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillRewards' test.out

#- 216 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'zr5cGETW' \
    --endTime '7B5HoVa7' \
    --limit '58' \
    --offset '24' \
    --productId 'BxxDdaPN' \
    --startTime '6xl1gpil' \
    --status 'VERIFIED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 216 'QueryUserIAPOrders' test.out

#- 217 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mLO0XM8o' \
    > test.out 2>&1
eval_tap $? 217 'QueryAllUserIAPOrders' test.out

#- 218 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'aEiCNa03' \
    --endTime 'i43ySRto' \
    --limit '1' \
    --offset '17' \
    --startTime '6Y7f9kQP' \
    --status 'PENDING' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPConsumeHistory' test.out

#- 219 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rzpnxmBK' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "emG", "productId": "6YgsqXmI", "region": "anAespgp", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 219 'MockFulfillIAPItem' test.out

#- 220 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cfd7tgQN' \
    --itemId 'PFB4VzmT' \
    --limit '71' \
    --offset '53' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserOrders' test.out

#- 221 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'VtXgYsAy' \
    --body '{"currencyCode": "DnL7wgvz", "currencyNamespace": "gkdACjOM", "discountedPrice": 41, "ext": {"KZdtdnux": {}, "QwYMflyE": {}, "SgRLxKeD": {}}, "itemId": "SOz9Q5hX", "language": "H5aA0vn8", "options": {"skipPriceValidation": true}, "platform": "Other", "price": 73, "quantity": 19, "region": "SFHbUcps", "returnUrl": "ZNtR0PRa", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 221 'AdminCreateUserOrder' test.out

#- 222 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6sqo03HR' \
    --itemId 'emXKBK3A' \
    > test.out 2>&1
eval_tap $? 222 'CountOfPurchasedItem' test.out

#- 223 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5g1w98hv' \
    --userId 'WZoqPqC8' \
    > test.out 2>&1
eval_tap $? 223 'GetUserOrder' test.out

#- 224 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KW2IJ7Xx' \
    --userId '52oVhkXN' \
    --body '{"status": "CHARGEBACK", "statusReason": "dgo1nfwi"}' \
    > test.out 2>&1
eval_tap $? 224 'UpdateUserOrderStatus' test.out

#- 225 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yx0rIErJ' \
    --userId 'xtPKBuUs' \
    > test.out 2>&1
eval_tap $? 225 'FulfillUserOrder' test.out

#- 226 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bPkvMIRX' \
    --userId 'Cbp4L7Bf' \
    > test.out 2>&1
eval_tap $? 226 'GetUserOrderGrant' test.out

#- 227 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'meQzTohX' \
    --userId 'ZABCTF95' \
    > test.out 2>&1
eval_tap $? 227 'GetUserOrderHistories' test.out

#- 228 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dqkyMfdY' \
    --userId '6KyQdCBO' \
    --body '{"additionalData": {"cardSummary": "IAzlUaxr"}, "authorisedTime": "1971-07-06T00:00:00Z", "chargebackReversedTime": "1985-12-08T00:00:00Z", "chargebackTime": "1997-01-27T00:00:00Z", "chargedTime": "1990-09-17T00:00:00Z", "createdTime": "1996-06-18T00:00:00Z", "currency": {"currencyCode": "8fexooWZ", "currencySymbol": "nv6QLKOf", "currencyType": "REAL", "decimals": 99, "namespace": "B6EGsiNC"}, "customParameters": {"OcypgSAt": {}, "JEFp0bX2": {}, "Cnjv9sIz": {}}, "extOrderNo": "2iu5ra62", "extTxId": "cIMoap0x", "extUserId": "KDiYeCEm", "issuedAt": "1983-05-03T00:00:00Z", "metadata": {"TtzjGHUt": "XjXDGXSS", "npAHgDlK": "HER6ZNPy", "EPdw8cNo": "dgA3Sexk"}, "namespace": "2YDLPvco", "nonceStr": "c8zoXqli", "paymentMethod": "FhHpgEZx", "paymentMethodFee": 4, "paymentOrderNo": "kwYwymrW", "paymentProvider": "ALIPAY", "paymentProviderFee": 10, "paymentStationUrl": "V5Ta6ukd", "price": 89, "refundedTime": "1989-09-08T00:00:00Z", "salesTax": 97, "sandbox": true, "sku": "SN9KuXBT", "status": "CHARGEBACK_REVERSED", "statusReason": "lx5bWjcf", "subscriptionId": "w17sQiu7", "subtotalPrice": 74, "targetNamespace": "NtMMMvoN", "targetUserId": "8QSeHRBe", "tax": 0, "totalPrice": 0, "totalTax": 59, "txEndTime": "1987-06-26T00:00:00Z", "type": "4NAEpcA9", "userId": "jfVOVRfM", "vat": 42}' \
    > test.out 2>&1
eval_tap $? 228 'ProcessUserOrderNotification' test.out

#- 229 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yKwxJx1N' \
    --userId 'Wwpsxxjx' \
    > test.out 2>&1
eval_tap $? 229 'DownloadUserOrderReceipt' test.out

#- 230 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'wpZIY7Ct' \
    --body '{"currencyCode": "nUaSK93n", "currencyNamespace": "Etp5qpi5", "customParameters": {"8MZjpkCY": {}, "Rz3Fro8h": {}, "GgXCtorW": {}}, "description": "ENbZhiEY", "extOrderNo": "miXkMPZw", "extUserId": "CbIygCJF", "itemType": "CODE", "language": "nrD_yQLv-OV", "metadata": {"H3IgComF": "EsT9Kk7r", "pWsWe2a0": "NigcTpbG", "pbAH2tHp": "keeQS2e0"}, "notifyUrl": "Q86dLpY2", "omitNotification": false, "platform": "6gie8318", "price": 21, "recurringPaymentOrderNo": "joiYU2Fj", "region": "NRGBrvyp", "returnUrl": "M32Mxela", "sandbox": true, "sku": "xUgo3yom", "subscriptionId": "BAhpFwtn", "title": "xP1S9pFF"}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserPaymentOrder' test.out

#- 231 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lodBCwXJ' \
    --userId '7EFOsThQ' \
    --body '{"description": "E1Km7sg9"}' \
    > test.out 2>&1
eval_tap $? 231 'RefundUserPaymentOrder' test.out

#- 232 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'DqtEy410' \
    --body '{"code": "zHeL7RMp", "orderNo": "EgH0QRAO"}' \
    > test.out 2>&1
eval_tap $? 232 'ApplyUserRedemption' test.out

#- 233 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'cXOzYDGW' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'pMJBB3NZ' \
    --limit '72' \
    --offset '78' \
    --sku 'uFQIsQPL' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserSubscriptions' test.out

#- 234 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'DAv4a1wB' \
    --excludeSystem  \
    --limit '69' \
    --offset '8' \
    --subscriptionId 'a9HiFEhO' \
    > test.out 2>&1
eval_tap $? 234 'GetUserSubscriptionActivities' test.out

#- 235 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wj1LPmko' \
    --body '{"grantDays": 55, "itemId": "XyWG7a2a", "language": "FRWq31Kn", "reason": "6A5VYW0U", "region": "t4gtzK9u", "source": "FNO2FjN1"}' \
    > test.out 2>&1
eval_tap $? 235 'PlatformSubscribeSubscription' test.out

#- 236 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'uBv3opWD' \
    --itemId 'bgjDxkMO' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 237 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4FOwjNH6' \
    --userId 'XkGKPYkn' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscription' test.out

#- 238 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VtkDNfgf' \
    --userId 'levgfTB4' \
    > test.out 2>&1
eval_tap $? 238 'DeleteUserSubscription' test.out

#- 239 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Z1fImZLU' \
    --userId 'qgzQhhYo' \
    --force  \
    --body '{"immediate": true, "reason": "V45eZGb0"}' \
    > test.out 2>&1
eval_tap $? 239 'CancelSubscription' test.out

#- 240 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ARNEIKLJ' \
    --userId 'DllhBRgC' \
    --body '{"grantDays": 35, "reason": "VSsTh9LQ"}' \
    > test.out 2>&1
eval_tap $? 240 'GrantDaysToSubscription' test.out

#- 241 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '3juLKJrK' \
    --userId 'mp5YXbaw' \
    --excludeFree  \
    --limit '47' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 241 'GetUserSubscriptionBillingHistories' test.out

#- 242 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Eeuy31T7' \
    --userId 'rOYhzJgY' \
    --body '{"additionalData": {"cardSummary": "dDvQAcLl"}, "authorisedTime": "1972-04-08T00:00:00Z", "chargebackReversedTime": "1977-08-03T00:00:00Z", "chargebackTime": "1984-03-01T00:00:00Z", "chargedTime": "1972-03-21T00:00:00Z", "createdTime": "1978-03-07T00:00:00Z", "currency": {"currencyCode": "FWcZ0SQe", "currencySymbol": "CocLy6PF", "currencyType": "VIRTUAL", "decimals": 68, "namespace": "2wsB5LRl"}, "customParameters": {"GUgY19Mm": {}, "F9U84kXa": {}, "qlSDj48X": {}}, "extOrderNo": "GStOt9PJ", "extTxId": "c8BxCETW", "extUserId": "5DwXOA7V", "issuedAt": "1985-02-17T00:00:00Z", "metadata": {"XBp5esPX": "G7j9UxVG", "qL7f3F0U": "zuAEfNnI", "aRR3U3s4": "Q1POdSxl"}, "namespace": "5TSkO0NB", "nonceStr": "VZacBLiI", "paymentMethod": "eP9jeomm", "paymentMethodFee": 27, "paymentOrderNo": "CWAJqZep", "paymentProvider": "ADYEN", "paymentProviderFee": 73, "paymentStationUrl": "tLvCSwIT", "price": 24, "refundedTime": "1977-04-30T00:00:00Z", "salesTax": 90, "sandbox": false, "sku": "GI6tiIhL", "status": "INIT", "statusReason": "mQSnTIYW", "subscriptionId": "LnlRPtt4", "subtotalPrice": 50, "targetNamespace": "nfNccw6Z", "targetUserId": "4jMIVOS2", "tax": 100, "totalPrice": 0, "totalTax": 10, "txEndTime": "1987-04-26T00:00:00Z", "type": "9DGd9MbH", "userId": "SJ8hkbnD", "vat": 31}' \
    > test.out 2>&1
eval_tap $? 242 'ProcessUserSubscriptionNotification' test.out

#- 243 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'TolLSS4c' \
    --namespace "$AB_NAMESPACE" \
    --userId '8B9C6jJN' \
    --body '{"count": 61, "orderNo": "fcHY39a4"}' \
    > test.out 2>&1
eval_tap $? 243 'AcquireUserTicket' test.out

#- 244 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '1OtlfB5i' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserCurrencyWallets' test.out

#- 245 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'CORBwEps' \
    --namespace "$AB_NAMESPACE" \
    --userId '7W03bFdd' \
    --limit '100' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 245 'ListUserCurrencyTransactions' test.out

#- 246 CheckWallet
eval_tap 0 246 'CheckWallet # SKIP deprecated' test.out

#- 247 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'pS7YlVRZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XejO2WZj' \
    --body '{"amount": 6, "expireAt": "1981-07-02T00:00:00Z", "origin": "System", "reason": "2OphTgbD", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 247 'CreditUserWallet' test.out

#- 248 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'UBwRyiBy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ReKNwurp' \
    --body '{"amount": 69, "walletPlatform": "Xbox"}' \
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
    --storeId 'KCBVdsr0' \
    > test.out 2>&1
eval_tap $? 254 'ListViews' test.out

#- 255 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QzNKG18X' \
    --body '{"displayOrder": 9, "localizations": {"r8Jthbi3": {"description": "dYGJFE5n", "localExt": {"v0VOYAz8": {}, "qTfmcMuz": {}, "z6AOebuc": {}}, "longDescription": "vv7O16ZW", "title": "QDvEzKIn"}, "hYG90WhE": {"description": "HvNMLwmk", "localExt": {"c3XlyzlN": {}, "WKdYp27t": {}, "E7E6yysS": {}}, "longDescription": "oAE4OGt3", "title": "02HwXCNq"}, "TLS0vLWy": {"description": "E6HRwoKJ", "localExt": {"dD0I85Ww": {}, "xoCE394J": {}, "2NMngnm9": {}}, "longDescription": "HhXCsl5f", "title": "Zt4N658r"}}, "name": "1RCGHTBG"}' \
    > test.out 2>&1
eval_tap $? 255 'CreateView' test.out

#- 256 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Pb19oRnD' \
    --storeId 'U2e6oZX8' \
    > test.out 2>&1
eval_tap $? 256 'GetView' test.out

#- 257 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'fSaVH4O7' \
    --storeId 'CggrSyoC' \
    --body '{"displayOrder": 90, "localizations": {"c3e4SEmR": {"description": "YNAofvJO", "localExt": {"mD5j7OSG": {}, "P5M4cJrE": {}, "j74x2FOL": {}}, "longDescription": "NLMh4aqD", "title": "zxt4Uy2t"}, "hXKjUe7V": {"description": "4kzdwEH3", "localExt": {"saX98HG6": {}, "72JyLHMO": {}, "2ZuzvCFi": {}}, "longDescription": "zuki1gn5", "title": "1CTnfoip"}, "NelsOB5x": {"description": "92bm0ieG", "localExt": {"OlbvPbWI": {}, "wTbRaGdj": {}, "PZywH2Xq": {}}, "longDescription": "B6dSl8SW", "title": "oGZzpJSu"}}, "name": "6b75o6LD"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateView' test.out

#- 258 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '6ZUWOGc4' \
    --storeId 'sLKqKgbo' \
    > test.out 2>&1
eval_tap $? 258 'DeleteView' test.out

#- 259 QueryWallets
eval_tap 0 259 'QueryWallets # SKIP deprecated' test.out

#- 260 GetWallet
eval_tap 0 260 'GetWallet # SKIP deprecated' test.out

#- 261 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'gz76RxVe' \
    --end 'MXLn8cKH' \
    --start '6ISCPWmO' \
    > test.out 2>&1
eval_tap $? 261 'SyncOrders' test.out

#- 262 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["yl7waMvn", "cjwPfgYD", "yir0s4tC"], "apiKey": "q6SIPXA5", "authoriseAsCapture": true, "blockedPaymentMethods": ["O6qgimrc", "55Eni3i9", "4jbhlcU6"], "clientKey": "HBjDEub9", "dropInSettings": "kbeDyCD5", "liveEndpointUrlPrefix": "jqvnQh7X", "merchantAccount": "q6PL0hmT", "notificationHmacKey": "SejkAHU3", "notificationPassword": "wAk3g7Zj", "notificationUsername": "4pTy1rpo", "returnUrl": "SG2dqpXt", "settings": "X6ane3LA"}' \
    > test.out 2>&1
eval_tap $? 262 'TestAdyenConfig' test.out

#- 263 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "IxNjsDVj", "privateKey": "grQXAdfd", "publicKey": "P4xcnRNe", "returnUrl": "1qhR42UG"}' \
    > test.out 2>&1
eval_tap $? 263 'TestAliPayConfig' test.out

#- 264 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "tvk3KCWX", "secretKey": "f1EkCglq"}' \
    > test.out 2>&1
eval_tap $? 264 'TestCheckoutConfig' test.out

#- 265 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'No29Bp0S' \
    > test.out 2>&1
eval_tap $? 265 'DebugMatchedPaymentMerchantConfig' test.out

#- 266 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "cMQw1ox6", "clientSecret": "xLVQTGH5", "returnUrl": "9xxY5ECU", "webHookId": "PNIuaIcd"}' \
    > test.out 2>&1
eval_tap $? 266 'TestPayPalConfig' test.out

#- 267 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["0V3IrqPz", "HD9HbCD2", "tnfU17HP"], "publishableKey": "nAOw6utd", "secretKey": "4jCUtSYs", "webhookSecret": "vQa8laAK"}' \
    > test.out 2>&1
eval_tap $? 267 'TestStripeConfig' test.out

#- 268 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "0PPbthWO", "key": "trarlc5g", "mchid": "f7AVmC8R", "returnUrl": "32oRIgOj"}' \
    > test.out 2>&1
eval_tap $? 268 'TestWxPayConfig' test.out

#- 269 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "0fwSnfBe", "flowCompletionUrl": "aQ5Ow3YQ", "merchantId": 97, "projectId": 27, "projectSecretKey": "agQQzbeP"}' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfig' test.out

#- 270 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'RF8vQiMJ' \
    > test.out 2>&1
eval_tap $? 270 'GetPaymentMerchantConfig' test.out

#- 271 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '4vHOtGGS' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["T9bjt8jA", "uiDJZ6uC", "ayYQoTGc"], "apiKey": "EaYqBBP9", "authoriseAsCapture": true, "blockedPaymentMethods": ["HxkUMW9J", "oAdc3R2r", "tBOtbSqn"], "clientKey": "aEHNCRuT", "dropInSettings": "a70caQnk", "liveEndpointUrlPrefix": "RLV0C024", "merchantAccount": "bGKYq3S4", "notificationHmacKey": "lYzaGopp", "notificationPassword": "Q6nmdya5", "notificationUsername": "7pNsz5KL", "returnUrl": "mhbNU8Yu", "settings": "GFCPatM0"}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateAdyenConfig' test.out

#- 272 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'UiWTjXVv' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 272 'TestAdyenConfigById' test.out

#- 273 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'L8HSAu5T' \
    --sandbox  \
    --validate  \
    --body '{"appId": "PwCr5g44", "privateKey": "7YJ02gfl", "publicKey": "VnS6chsG", "returnUrl": "G6hk3HbL"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateAliPayConfig' test.out

#- 274 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id '3gPgYto9' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 274 'TestAliPayConfigById' test.out

#- 275 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'jsMpBufP' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "KUdp8YRy", "secretKey": "xTkDNlyX"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateCheckoutConfig' test.out

#- 276 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'MbDk9N8E' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestCheckoutConfigById' test.out

#- 277 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'ZSzoQ0Sb' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "QxjuFjj9", "clientSecret": "D02nkWgq", "returnUrl": "1E8k9q3g", "webHookId": "yc2kbkE6"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdatePayPalConfig' test.out

#- 278 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '2dUaNJmb' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestPayPalConfigById' test.out

#- 279 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'GojPaHeR' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["4rRoiPe5", "MUmCepUE", "8JdoEkbT"], "publishableKey": "hGcU9b64", "secretKey": "oC7oZ2sy", "webhookSecret": "jdGQDYTp"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateStripeConfig' test.out

#- 280 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'E4samwhj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestStripeConfigById' test.out

#- 281 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'SMRZUkZP' \
    --validate  \
    --body '{"appId": "Rc9ZX9zC", "key": "yiD2014k", "mchid": "ZHnlucr8", "returnUrl": "ghGbhTN7"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdateWxPayConfig' test.out

#- 282 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'RcbNHlIE' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 282 'UpdateWxPayConfigCert' test.out

#- 283 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'QYaq4F0I' \
    > test.out 2>&1
eval_tap $? 283 'TestWxPayConfigById' test.out

#- 284 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'wd5yOoin' \
    --validate  \
    --body '{"apiKey": "9RAxx1kD", "flowCompletionUrl": "bLIhpBkN", "merchantId": 35, "projectId": 77, "projectSecretKey": "zTNrXaIX"}' \
    > test.out 2>&1
eval_tap $? 284 'UpdateXsollaConfig' test.out

#- 285 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'LZnsexVt' \
    > test.out 2>&1
eval_tap $? 285 'TestXsollaConfigById' test.out

#- 286 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '10OgUN4J' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateXsollaUIConfig' test.out

#- 287 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '6' \
    --namespace "$AB_NAMESPACE" \
    --offset '95' \
    --region 'Op8wJNc9' \
    > test.out 2>&1
eval_tap $? 287 'QueryPaymentProviderConfig' test.out

#- 288 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "HBaEhqVV", "region": "cuQoKZwV", "sandboxTaxJarApiToken": "b9sgTxfY", "specials": ["ALIPAY", "STRIPE", "WXPAY"], "taxJarApiToken": "rY87NRso", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 288 'CreatePaymentProviderConfig' test.out

#- 289 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 289 'GetAggregatePaymentProviders' test.out

#- 290 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'yKFUztBL' \
    > test.out 2>&1
eval_tap $? 290 'DebugMatchedPaymentProviderConfig' test.out

#- 291 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 291 'GetSpecialPaymentProviders' test.out

#- 292 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'kn9KX7SL' \
    --body '{"aggregate": "XSOLLA", "namespace": "3lDcsuCv", "region": "urDEXQ2X", "sandboxTaxJarApiToken": "yXaU1IHL", "specials": ["WALLET", "PAYPAL", "STRIPE"], "taxJarApiToken": "z7J3pHwI", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 292 'UpdatePaymentProviderConfig' test.out

#- 293 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'YTQqf55r' \
    > test.out 2>&1
eval_tap $? 293 'DeletePaymentProviderConfig' test.out

#- 294 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 294 'GetPaymentTaxConfig' test.out

#- 295 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "J9C2lmpv", "taxJarApiToken": "JUeGRSD1", "taxJarEnabled": false, "taxJarProductCodesMapping": {"dLGmobvb": "QUujtkSP", "wScjU4r6": "fAvzR1ju", "752bSDTd": "ynizGCN9"}}' \
    > test.out 2>&1
eval_tap $? 295 'UpdatePaymentTaxConfig' test.out

#- 296 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'RoCuHkJ1' \
    --end '5bHvOODh' \
    --start 'lEcw7wqQ' \
    > test.out 2>&1
eval_tap $? 296 'SyncPaymentOrders' test.out

#- 297 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'rOiHmfPe' \
    --storeId 'tgB7XKK3' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRootCategories' test.out

#- 298 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'ZjSZMjlR' \
    --storeId 'rZi354fu' \
    > test.out 2>&1
eval_tap $? 298 'DownloadCategories' test.out

#- 299 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'S6h8fZP7' \
    --namespace "$AB_NAMESPACE" \
    --language 'juT2vE9f' \
    --storeId 'UTgqsbqe' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetCategory' test.out

#- 300 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'lXIlrpOL' \
    --namespace "$AB_NAMESPACE" \
    --language 'TsitcDcA' \
    --storeId 'EbsormVr' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetChildCategories' test.out

#- 301 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'SeaYg8Nd' \
    --namespace "$AB_NAMESPACE" \
    --language 'Qef8EQ6j' \
    --storeId 'anzMxcEw' \
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
    --language 'dUj4rkMq' \
    --region '4Q7l0yid' \
    --storeId 'tsmWfPve' \
    --appId 'qdnOjV61' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetItemByAppId' test.out

#- 304 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId 'T05K62R4' \
    --categoryPath 'PQkL928n' \
    --features 'gYVudgde' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language 'bDDPpQyB' \
    --limit '56' \
    --offset '96' \
    --region 'iaMc6UdG' \
    --sortBy 'displayOrder,name,name:asc' \
    --storeId 'mPFHNy8L' \
    --tags 'XBtesbgI' \
    > test.out 2>&1
eval_tap $? 304 'PublicQueryItems' test.out

#- 305 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language '3iwMpcvj' \
    --region 'prKCy08T' \
    --storeId '8tDRSW0r' \
    --sku 'YOLTlJM6' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetItemBySku' test.out

#- 306 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'WkTo6Uu6' \
    --region 'bFLqwPg5' \
    --storeId 'a4J7bZL3' \
    --itemIds 'Twf5ch69' \
    > test.out 2>&1
eval_tap $? 306 'PublicBulkGetItems' test.out

#- 307 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["aBzjKNwy", "sBeuErcT", "cM7OKwJX"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicValidateItemPurchaseCondition' test.out

#- 308 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'SUBSCRIPTION' \
    --limit '2' \
    --offset '61' \
    --region '2M5SZhgf' \
    --storeId 'fLaoGVA0' \
    --keyword 'ESDiNnBH' \
    --language 'UhFiTP4M' \
    > test.out 2>&1
eval_tap $? 308 'PublicSearchItems' test.out

#- 309 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'shXyyTg3' \
    --namespace "$AB_NAMESPACE" \
    --language '9np0SU18' \
    --region 'VksVAgGK' \
    --storeId 'dhU8yuwF' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetApp' test.out

#- 310 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '6g1apZL7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 310 'PublicGetItemDynamicData' test.out

#- 311 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'WB56z68M' \
    --namespace "$AB_NAMESPACE" \
    --language '7uIHQKiH' \
    --populateBundle  \
    --region 'YB1gzTKx' \
    --storeId 'ctDtilyQ' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetItem' test.out

#- 312 GetPaymentCustomization
eval_tap 0 312 'GetPaymentCustomization # SKIP deprecated' test.out

#- 313 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "gPY8Us7F", "paymentProvider": "PAYPAL", "returnUrl": "gEKkr4uZ", "ui": "PDJfvU2H", "zipCode": "UieWVySJ"}' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetPaymentUrl' test.out

#- 314 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'SBpQhHrD' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetPaymentMethods' test.out

#- 315 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'deAYWQjB' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetUnpaidPaymentOrder' test.out

#- 316 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aDMrlhtw' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'vUPvym1s' \
    --body '{"token": "RmFU723R"}' \
    > test.out 2>&1
eval_tap $? 316 'Pay' test.out

#- 317 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'msApm8K0' \
    > test.out 2>&1
eval_tap $? 317 'PublicCheckPaymentOrderPaidStatus' test.out

#- 318 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'pMCuBlI4' \
    > test.out 2>&1
eval_tap $? 318 'GetPaymentPublicConfig' test.out

#- 319 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'mRuqHIeH' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetQRCode' test.out

#- 320 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'KNSdlPvl' \
    --foreinginvoice 'xV5Vnn0P' \
    --invoiceId '76AqNjCs' \
    --payload 'qFWcjnY2' \
    --redirectResult '6fV1zjeG' \
    --resultCode 'R2oZxKiI' \
    --sessionId 'KqnTavSz' \
    --status 'xEJdHy5n' \
    --token 'xie0WxoT' \
    --type '1Rz6s6ZS' \
    --userId 'gqyyo1k2' \
    --orderNo 'RVdFfL1Y' \
    --paymentOrderNo 'wnR5F0eE' \
    --paymentProvider 'ALIPAY' \
    --returnUrl '7Cyfpyki' \
    > test.out 2>&1
eval_tap $? 320 'PublicNormalizePaymentReturnUrl' test.out

#- 321 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'xQHsY2EQ' \
    --paymentOrderNo 'AXOfLSyX' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 321 'GetPaymentTaxValue' test.out

#- 322 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'FPE8BXEG' \
    > test.out 2>&1
eval_tap $? 322 'GetRewardByCode' test.out

#- 323 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'k4Nzttxd' \
    --limit '43' \
    --offset '71' \
    --sortBy 'namespace:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 323 'QueryRewards1' test.out

#- 324 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'atOXFX9L' \
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
    --appIds 'GfmXHRmu,CRSn0Fvu,yi7rag4c' \
    --itemIds 'K4z1lpj6,AANIVU4L,oTNoTg5v' \
    --skus '6EGvD47B,KeAHNZI9,AYFskXVd' \
    > test.out 2>&1
eval_tap $? 326 'PublicExistsAnyMyActiveEntitlement' test.out

#- 327 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'T9ZWeea4' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 328 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --itemId 'HWODdro0' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 329 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --sku 'nLweY6v2' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 330 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'uIdWGer4,YAvZTlKm,CVaJDMU3' \
    --itemIds 'mldCmuNH,3vNg34IK,3kzjnNhR' \
    --skus 'SsO0IreF,jjoASWP3,X8DScYc2' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetEntitlementOwnershipToken' test.out

#- 331 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'DF4TTZpr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyWallet' test.out

#- 332 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'o47qvAOx' \
    --body '{"epicGamesJwtToken": "2rizfHbM"}' \
    > test.out 2>&1
eval_tap $? 332 'SyncEpicGameDLC' test.out

#- 333 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'cUUvj5tu' \
    --body '{"serviceLabel": 92}' \
    > test.out 2>&1
eval_tap $? 333 'PublicSyncPsnDlcInventory' test.out

#- 334 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'vw505ziG' \
    --body '{"serviceLabels": [98, 76, 7]}' \
    > test.out 2>&1
eval_tap $? 334 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 335 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sx12IK4y' \
    --body '{"appId": "cKfn592m", "steamId": "I40RlpKB"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncSteamDLC' test.out

#- 336 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'bnJ245fE' \
    --body '{"xstsToken": "mUpft7c4"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncXboxDLC' test.out

#- 337 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZaUCkQh6' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'bIky7GeD' \
    --features 'wBBNxv1o,kxIH2XBE,7IOEdWGr' \
    --itemId 'fquXkmhr,RyccgO1j,iNBl9FIs' \
    --limit '13' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 337 'PublicQueryUserEntitlements' test.out

#- 338 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wek8lhwt' \
    --appId 'qLD9ccuI' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetUserAppEntitlementByAppId' test.out

#- 339 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9DuOhAd' \
    --limit '13' \
    --offset '82' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserEntitlementsByAppType' test.out

#- 340 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'a3tcVxLV' \
    --entitlementClazz 'APP' \
    --itemId '1OHyhVh5' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetUserEntitlementByItemId' test.out

#- 341 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '5y113MyP' \
    --entitlementClazz 'MEDIA' \
    --sku 'H9Oyasro' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserEntitlementBySku' test.out

#- 342 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KcULadjN' \
    --appIds 'nJbPTFGD,n4MoDHZg,cVcuP6gJ' \
    --itemIds '8fP5MSbG,pabWbv4h,ZtWfuK9Y' \
    --skus 'rHyCJyR3,Ubu34K4H,B6W0dfRv' \
    > test.out 2>&1
eval_tap $? 342 'PublicExistsAnyUserActiveEntitlement' test.out

#- 343 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MOr7Sbor' \
    --appId 'H4QyLaR7' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 344 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybdyLOcp' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'FVp5gwdm' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 345 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'QudigPgQ' \
    --ids '53Xqs6vn,iDT54H6B,7zzxtDOn' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 346 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'WBntVUKU' \
    --entitlementClazz 'APP' \
    --sku '1gQRYMlU' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 347 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'lJiRzLpJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '5lE0O5KN' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserEntitlement' test.out

#- 348 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'sPFay69k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9IqKMkl' \
    --body '{"options": ["Ax3kO3zr", "mHJm01sk", "sPbRsQOy"], "requestId": "mOrZmvdP", "useCount": 74}' \
    > test.out 2>&1
eval_tap $? 348 'PublicConsumeUserEntitlement' test.out

#- 349 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'VQlvnxvi' \
    --body '{"code": "eYYYxWrw", "language": "zza-824", "region": "2xL1Ikva"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicRedeemCode' test.out

#- 350 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cdgU0LMB' \
    --body '{"excludeOldTransactions": false, "language": "zxH-Cw", "productId": "hoAk4efT", "receiptData": "6ts9jprI", "region": "aebahyGU", "transactionId": "eCitlJ5H"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicFulfillAppleIAPItem' test.out

#- 351 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'G0Tbmm16' \
    --body '{"epicGamesJwtToken": "r4K0LEVE"}' \
    > test.out 2>&1
eval_tap $? 351 'SyncEpicGamesInventory' test.out

#- 352 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'TtQkppD4' \
    --body '{"autoAck": false, "language": "pT-YveS-040", "orderId": "Pn4kzrP7", "packageName": "ic4aC1gy", "productId": "w9pHIebm", "purchaseTime": 39, "purchaseToken": "F73AGlt9", "region": "YLNEvjC8"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicFulfillGoogleIAPItem' test.out

#- 353 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'KF6MrT0x' \
    --body '{"currencyCode": "jQHCMnt3", "price": 0.7367373889386685, "productId": "fuWl819W", "serviceLabel": 2}' \
    > test.out 2>&1
eval_tap $? 353 'PublicReconcilePlayStationStore' test.out

#- 354 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'X5jrdu8h' \
    --body '{"currencyCode": "wTCVpHwx", "price": 0.21935974902712063, "productId": "BUMx4CyA", "serviceLabels": [58, 63, 79]}' \
    > test.out 2>&1
eval_tap $? 354 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 355 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q33i3Rxb' \
    --body '{"appId": "iA1v1KHZ", "language": "oGD-QunK", "region": "gqtk0Tl0", "stadiaPlayerId": "ju1DYgag"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncStadiaEntitlement' test.out

#- 356 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLJNMUzH' \
    --body '{"appId": "kfCMyche", "currencyCode": "4yzKjyCR", "language": "IPVH_ukJg_wA", "price": 0.060618696772632874, "productId": "pWqhRPFe", "region": "Ytyxx4lg", "steamId": "wwp5h7QI"}' \
    > test.out 2>&1
eval_tap $? 356 'SyncSteamInventory' test.out

#- 357 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'lCYbw2yk' \
    --body '{"gameId": "WHml6VzX", "language": "EJu-pInG", "region": "gUuxQQje"}' \
    > test.out 2>&1
eval_tap $? 357 'SyncTwitchDropsEntitlement' test.out

#- 358 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'EdxYDYCY' \
    --body '{"currencyCode": "IfTuQHZa", "price": 0.42750280329602197, "productId": "ecTztRny", "xstsToken": "PXMxW5Pw"}' \
    > test.out 2>&1
eval_tap $? 358 'SyncXboxInventory' test.out

#- 359 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'CKKvM2zu' \
    --itemId 'oSZlDpfF' \
    --limit '79' \
    --offset '44' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 359 'PublicQueryUserOrders' test.out

#- 360 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'gtQH7nP9' \
    --body '{"currencyCode": "b1lATDp8", "discountedPrice": 92, "ext": {"3Hqywl8R": {}, "sfd0U9oe": {}, "gaIQ8UtD": {}}, "itemId": "uhxGCm8W", "language": "mW", "price": 19, "quantity": 20, "region": "Bh435JQ1", "returnUrl": "iEHe0quW"}' \
    > test.out 2>&1
eval_tap $? 360 'PublicCreateUserOrder' test.out

#- 361 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'N4K26f2Z' \
    --userId 'WnfBpvrg' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetUserOrder' test.out

#- 362 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'RqvWrLX3' \
    --userId 'PSlEHswf' \
    > test.out 2>&1
eval_tap $? 362 'PublicCancelUserOrder' test.out

#- 363 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mAvnotHv' \
    --userId '7UlqxQGC' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetUserOrderHistories' test.out

#- 364 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'zPRBEG4X' \
    --userId 'R1FYQHml' \
    > test.out 2>&1
eval_tap $? 364 'PublicDownloadUserOrderReceipt' test.out

#- 365 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'vs8hsxIO' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentAccounts' test.out

#- 366 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'jjQFaSUz' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'ZuvPx4cP' \
    > test.out 2>&1
eval_tap $? 366 'PublicDeletePaymentAccount' test.out

#- 367 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '83ejTHn8' \
    --language 'NBjbtYNH' \
    --region 'nV6xAmfn' \
    --storeId 'xnq0LJ6m' \
    --viewId 'iCRYmQLz' \
    > test.out 2>&1
eval_tap $? 367 'PublicListActiveSections' test.out

#- 368 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '14t1QeNj' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'mD5J5zSm' \
    --limit '99' \
    --offset '95' \
    --sku 'Ok0M6zZN' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 368 'PublicQueryUserSubscriptions' test.out

#- 369 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'bHeshh0F' \
    --body '{"currencyCode": "ejYTWh8P", "itemId": "ngTHBNhQ", "language": "Tkv", "region": "4tJKcEMm", "returnUrl": "jbCQfCTv", "source": "3825y8mu"}' \
    > test.out 2>&1
eval_tap $? 369 'PublicSubscribeSubscription' test.out

#- 370 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Umzcpaq4' \
    --itemId 'E9BXMwtf' \
    > test.out 2>&1
eval_tap $? 370 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 371 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Q3TScsav' \
    --userId 'k4SO8oDZ' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserSubscription' test.out

#- 372 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yPQT1njH' \
    --userId 'WETOMfWJ' \
    > test.out 2>&1
eval_tap $? 372 'PublicChangeSubscriptionBillingAccount' test.out

#- 373 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xDeqku1r' \
    --userId 'SIq3OPBO' \
    --body '{"immediate": true, "reason": "Fblho0Na"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicCancelSubscription' test.out

#- 374 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'G6xFr8Oo' \
    --userId 'R50DhLRS' \
    --excludeFree  \
    --limit '20' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserSubscriptionBillingHistories' test.out

#- 375 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'BA0AiI1n' \
    --language 'Qg4GhYR2' \
    --storeId 'jeyYNX7l' \
    > test.out 2>&1
eval_tap $? 375 'PublicListViews' test.out

#- 376 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'h2nd6vFk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XJrBaCOD' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetWallet' test.out

#- 377 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'q3JtyszC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AA4cDDJj' \
    --limit '99' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 377 'PublicListUserWalletTransactions' test.out

#- 378 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'QYB33BM7' \
    --baseAppId 'sKt8vEgg' \
    --categoryPath 'x55OQAzo' \
    --features 'LdVtjJlr' \
    --includeSubCategoryItem  \
    --itemName '8Nbm1z7t' \
    --itemStatus 'INACTIVE' \
    --itemType 'OPTIONBOX' \
    --limit '67' \
    --offset '6' \
    --region '8GakOSrH' \
    --sortBy 'updatedAt,createdAt:asc,name:desc' \
    --storeId 'I1yNzMjR' \
    --tags 'nO5n0Gdz' \
    --targetNamespace 'i2hL2ESG' \
    > test.out 2>&1
eval_tap $? 378 'QueryItems1' test.out

#- 379 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O4TWao8Y' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 379 'ImportStore1' test.out

#- 380 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'arT2Wvne' \
    --body '{"itemIds": ["EZGLNam1", "TTn7SqUd", "5wWuTIEt"]}' \
    > test.out 2>&1
eval_tap $? 380 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE