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
echo "1..383"

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
    --body '{"context": {"item": {"appId": "u4efA7qk", "appType": "SOFTWARE", "baseAppId": "3QrYCoDj", "boothName": "N10NanWl", "boundItemIds": ["OdMxo6FK", "Gunat1Qo", "tJAMVNNz"], "categoryPath": "kaaRzt65", "clazz": "p1G91T9j", "createdAt": "1995-09-21T00:00:00Z", "description": "KAiN55rx", "displayOrder": 20, "entitlementType": "CONSUMABLE", "ext": {"gHBxD06R": {}, "7KGbWk3L": {}, "wCW75CTm": {}}, "features": ["Rm44zI7U", "z7fFtgmO", "rpSKnvGf"], "fresh": false, "images": [{"as": "bLwfqxTd", "caption": "JJ9ZVgCT", "height": 35, "imageUrl": "YRTLRD7d", "smallImageUrl": "p4uMZday", "width": 55}, {"as": "NxJVpdKe", "caption": "Ls9YbRgh", "height": 31, "imageUrl": "gmBIQmbL", "smallImageUrl": "B9J6SUUJ", "width": 34}, {"as": "H6ctBlsQ", "caption": "0UCrQTRi", "height": 9, "imageUrl": "xLyluhyK", "smallImageUrl": "JBetNT0q", "width": 49}], "itemId": "LBWjQCbx", "itemIds": ["n07fKyZR", "j3g4Bxkg", "dhQQtMLF"], "itemQty": {"frgksSHt": 21, "IoIRwBgc": 0, "hIeVdBYp": 74}, "itemType": "COINS", "language": "e4W8vKTF", "listable": true, "localExt": {"CL2BvDUd": {}, "lRK4Te2N": {}, "KbLNYjLX": {}}, "longDescription": "dHvOL0c6", "lootBoxConfig": {"rewardCount": 67, "rewards": [{"lootBoxItems": [{"count": 18, "itemId": "PnKag629", "itemSku": "1zSGjVX0", "itemType": "Qofmw3HK"}, {"count": 14, "itemId": "upcc4pXg", "itemSku": "tg0ZRVIz", "itemType": "o9qHmTpB"}, {"count": 64, "itemId": "AgFXEcIg", "itemSku": "OhCzFF4g", "itemType": "nRKwj32G"}], "name": "4PMaQsqw", "odds": 0.39421009109106964, "type": "REWARD_GROUP", "weight": 78}, {"lootBoxItems": [{"count": 85, "itemId": "Q6rXTaVw", "itemSku": "gpjIVz4s", "itemType": "T6CmQXFh"}, {"count": 26, "itemId": "ReWj9zbw", "itemSku": "spnoWUt7", "itemType": "ylF58nT4"}, {"count": 69, "itemId": "FV1kvcRq", "itemSku": "8r3D9mCB", "itemType": "lSQQNsxq"}], "name": "OSgHMm5C", "odds": 0.9379405789120695, "type": "REWARD_GROUP", "weight": 36}, {"lootBoxItems": [{"count": 55, "itemId": "sT7HMyxh", "itemSku": "4PP475OM", "itemType": "DqYNMkhl"}, {"count": 71, "itemId": "gJoVeXZU", "itemSku": "AiTytTw8", "itemType": "0sGuSJSx"}, {"count": 38, "itemId": "nQqa2KuL", "itemSku": "601Z7ieU", "itemType": "dbUgPYXM"}], "name": "3yGkMg4w", "odds": 0.809076021984218, "type": "REWARD", "weight": 36}], "rollFunction": "CUSTOM"}, "maxCount": 49, "maxCountPerUser": 96, "name": "jmNcyJwx", "namespace": "adRuE1fL", "optionBoxConfig": {"boxItems": [{"count": 86, "itemId": "1UGN6qc0", "itemSku": "erbrS703", "itemType": "LBiWiRVB"}, {"count": 66, "itemId": "JorlriGd", "itemSku": "Ewp155cA", "itemType": "HKtXlgwz"}, {"count": 17, "itemId": "FFKgdz4U", "itemSku": "W7uaQxAp", "itemType": "euyTx116"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 36, "comparison": "isLessThanOrEqual", "name": "oGO9C1H6", "predicateType": "SeasonPassPredicate", "value": "SfK9z5wD", "values": ["7iyC8wuP", "O5gPJccm", "RrKeZifm"]}, {"anyOf": 63, "comparison": "isLessThanOrEqual", "name": "rLLI8hwq", "predicateType": "SeasonPassPredicate", "value": "ceBLxXKo", "values": ["aWJjyhqK", "Wh3KM47w", "VAuvNnWR"]}, {"anyOf": 21, "comparison": "isGreaterThanOrEqual", "name": "KY58jACR", "predicateType": "SeasonTierPredicate", "value": "YXgPZEOt", "values": ["PjPcwkgy", "I9vBSzqU", "SlrFM3Mp"]}]}, {"operator": "and", "predicates": [{"anyOf": 50, "comparison": "isLessThanOrEqual", "name": "Ibm5eKcw", "predicateType": "SeasonPassPredicate", "value": "buhkuN75", "values": ["VxKM04xr", "UsJcII99", "Jwf2Bawi"]}, {"anyOf": 77, "comparison": "is", "name": "lzMoXaTs", "predicateType": "EntitlementPredicate", "value": "pXpEQQb9", "values": ["Hlu27WQ8", "ltYmCp9C", "ZuZzOE4A"]}, {"anyOf": 57, "comparison": "isGreaterThan", "name": "tC2KN57q", "predicateType": "EntitlementPredicate", "value": "5TMQPnjE", "values": ["v4nvpZuA", "6ayPMvdU", "bDsomGIC"]}]}, {"operator": "and", "predicates": [{"anyOf": 26, "comparison": "isGreaterThan", "name": "cQ8oJnd9", "predicateType": "EntitlementPredicate", "value": "BYcrtzej", "values": ["p7onC8zO", "0TZxG8gL", "TTFRNeJK"]}, {"anyOf": 75, "comparison": "is", "name": "7FmtN5gx", "predicateType": "SeasonTierPredicate", "value": "TAVUUmGx", "values": ["rPoExEpk", "KsGRpmDH", "CKdB5iBn"]}, {"anyOf": 63, "comparison": "isLessThan", "name": "EDLOXsJO", "predicateType": "SeasonTierPredicate", "value": "BCJxblMQ", "values": ["TVldVd42", "8fiPdxvn", "ZfIb8twr"]}]}]}, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 30, "fixedTrialCycles": 97, "graceDays": 30}, "region": "VCPYeZL5", "regionData": [{"currencyCode": "0XnSf7Vr", "currencyNamespace": "U18LQihY", "currencyType": "VIRTUAL", "discountAmount": 47, "discountExpireAt": "1983-12-28T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1975-03-29T00:00:00Z", "discountedPrice": 21, "expireAt": "1973-02-20T00:00:00Z", "price": 95, "purchaseAt": "1971-03-21T00:00:00Z", "trialPrice": 67}, {"currencyCode": "6buUfbdG", "currencyNamespace": "Ye05wb1w", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1972-11-05T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1984-11-27T00:00:00Z", "discountedPrice": 55, "expireAt": "1976-01-21T00:00:00Z", "price": 77, "purchaseAt": "1983-03-26T00:00:00Z", "trialPrice": 41}, {"currencyCode": "exEnWQer", "currencyNamespace": "k8HEJsCx", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1995-04-25T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1998-03-18T00:00:00Z", "discountedPrice": 34, "expireAt": "1993-07-13T00:00:00Z", "price": 70, "purchaseAt": "1988-03-18T00:00:00Z", "trialPrice": 51}], "seasonType": "TIER", "sku": "tfQUDNsZ", "stackable": true, "status": "INACTIVE", "tags": ["1j6TxTxf", "8WLFkp8A", "j6U2pX5Y"], "targetCurrencyCode": "cHY8VSAL", "targetItemId": "1uNI5GoT", "targetNamespace": "8cKDC7C6", "thumbnailUrl": "RCyUsdUT", "title": "weHLF2ZS", "updatedAt": "1971-01-18T00:00:00Z", "useCount": 0}, "namespace": "RFUVPuXF", "order": {"currency": {"currencyCode": "aN8wXeON", "currencySymbol": "m2eKIeLm", "currencyType": "VIRTUAL", "decimals": 71, "namespace": "I6VXHUZ6"}, "ext": {"idWciOaf": {}, "MMW0veJV": {}, "mTzdSWC9": {}}, "free": true}, "source": "OTHER"}, "script": "zpxg3eec", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'kUNpShnj' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'JK5Kb20d' \
    --body '{"grantDays": "i8NfDu7m"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'gtw2OX03' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'thwUZvnp' \
    --body '{"grantDays": "7ZwLtVti"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "ZwtSSXn3", "dryRun": true, "fulfillmentUrl": "EY9dITxb", "itemType": "OPTIONBOX", "purchaseConditionUrl": "yliwNjMZ"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'pLUCBMSQ' \
    --itemType 'SUBSCRIPTION' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'Lv7pWrhd' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'RvxLREX6' \
    --body '{"clazz": "bP60FwNB", "dryRun": true, "fulfillmentUrl": "5l26aulU", "purchaseConditionUrl": "VdvQywKq"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'gWqnxpnf' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'J34EpjYS' \
    --offset '87' \
    --tag 'XR9Kssav' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "dqFAWw6o", "items": [{"extraSubscriptionDays": 59, "itemId": "2bxIxeI9", "itemName": "3VyKOkUC", "quantity": 29}, {"extraSubscriptionDays": 94, "itemId": "pxyRgbbE", "itemName": "6plUEXkQ", "quantity": 100}, {"extraSubscriptionDays": 7, "itemId": "zUy42o6d", "itemName": "MknqkMRL", "quantity": 56}], "maxRedeemCountPerCampaignPerUser": 33, "maxRedeemCountPerCode": 44, "maxRedeemCountPerCodePerUser": 88, "maxSaleCount": 71, "name": "9JaoHpSJ", "redeemEnd": "1980-04-29T00:00:00Z", "redeemStart": "1998-05-23T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["cOBLUjXO", "LMaBJnq9", "TIlLmnhH"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'lIwqzLSj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'nowZJY5h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "4y8xXSmT", "items": [{"extraSubscriptionDays": 62, "itemId": "Me6NO790", "itemName": "llqRDPgf", "quantity": 14}, {"extraSubscriptionDays": 41, "itemId": "6xLfJbwP", "itemName": "dzkTW0wQ", "quantity": 85}, {"extraSubscriptionDays": 44, "itemId": "h2XDOHBz", "itemName": "sesJTKWF", "quantity": 24}], "maxRedeemCountPerCampaignPerUser": 44, "maxRedeemCountPerCode": 7, "maxRedeemCountPerCodePerUser": 10, "maxSaleCount": 46, "name": "SqlfCKJf", "redeemEnd": "1991-10-08T00:00:00Z", "redeemStart": "1973-02-28T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["u7BfthY7", "xm1Q1YZK", "jyzIx0ke"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'ABIpCTtW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId '5E5LE6G3' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mFRdgSCa' \
    --body '{"categoryPath": "9JE2k7BT", "localizationDisplayNames": {"UqlQ4f7N": "j7RQ7YFL", "V8ZfvZym": "lLZLnNWt", "ZN8CMzUo": "TYbew5X1"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NfNN2uOr' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'KluGE5j4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cq9sSmEc' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '9kinadHc' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c3eta5WD' \
    --body '{"localizationDisplayNames": {"llKSzdl6": "wW4l9UBm", "sK57fZHc": "n5knsEQ5", "gfQwD7h3": "k8g3ivT4"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'icOXxrrD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AK0Stdsj' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'k5Ur26uS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VNhPN2YO' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'eG7vhNOC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tJowEkEt' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '6lmI1kqT' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '94' \
    --code 'nlIYs9J6' \
    --limit '13' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId '009XIBsj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 26}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'd5Gxqr9s' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '25' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'Q3gMAfc9' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '37' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'd0uT2NMT' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '16' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId '1AIchEY7' \
    --namespace "$AB_NAMESPACE" \
    --code 'iACVZxvb' \
    --limit '91' \
    --offset '5' \
    --userId 'zVVCNxpa' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'HMVIwIXr' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code '2zbDQHxU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'bqpvc3R7' \
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
    --body '{"grpcServerAddress": "3L4SI0vo"}' \
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
    --body '{"currencyCode": "MCWPRFLo", "currencySymbol": "AZlqZYFw", "currencyType": "VIRTUAL", "decimals": 1, "localizationDescriptions": {"r42v5Pr9": "J1PZOKee", "Sfw9OAdu": "Zrqi6ayR", "KmNMvvYA": "bFaOLvtz"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'BGvpAMpV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"Tj2iaZ6D": "SIuLEPBR", "y4lk7yip": "tQcqMnbT", "A8AWNfxT": "W5SaIufB"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'C40EI9uE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'kfYKnSO9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode '1l9k3DIY' \
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
    --body '{"data": [{"id": "IBtLAxs0", "rewards": [{"currency": {"currencyCode": "dFQFvIvl", "namespace": "l7kE48WQ"}, "item": {"itemId": "rF07qVBS", "itemSku": "biZgBNOd", "itemType": "MkgisQGV"}, "quantity": 53, "type": "CURRENCY"}, {"currency": {"currencyCode": "lALGgbpj", "namespace": "FCBaUkus"}, "item": {"itemId": "RoXWu1Or", "itemSku": "vcOuXNYN", "itemType": "fSqYphBY"}, "quantity": 84, "type": "CURRENCY"}, {"currency": {"currencyCode": "o3ipb09l", "namespace": "owl1VLQp"}, "item": {"itemId": "4hmHKX5E", "itemSku": "vuEciD08", "itemType": "UiTiZpS6"}, "quantity": 74, "type": "ITEM"}]}, {"id": "Zjr4VMAy", "rewards": [{"currency": {"currencyCode": "jvC2k15D", "namespace": "WLn4qHiM"}, "item": {"itemId": "10bgPVVN", "itemSku": "m6fYy9sX", "itemType": "bwaHLKHX"}, "quantity": 8, "type": "CURRENCY"}, {"currency": {"currencyCode": "ihE4Q450", "namespace": "yKsvSJyU"}, "item": {"itemId": "vfA57ri0", "itemSku": "tpXNVnv7", "itemType": "gdRrjIlx"}, "quantity": 31, "type": "ITEM"}, {"currency": {"currencyCode": "SeBnj7mA", "namespace": "AgAZhHCg"}, "item": {"itemId": "sNbyW3IX", "itemSku": "vtrRg3B3", "itemType": "oXyCLGOc"}, "quantity": 64, "type": "ITEM"}]}, {"id": "oDejJJft", "rewards": [{"currency": {"currencyCode": "sTbiEKA0", "namespace": "75o3qrhF"}, "item": {"itemId": "Uf74Gzgl", "itemSku": "OcYc8DpZ", "itemType": "oJf4GrpF"}, "quantity": 35, "type": "CURRENCY"}, {"currency": {"currencyCode": "VP0Ybehf", "namespace": "7BF5Be30"}, "item": {"itemId": "8oxD1jkG", "itemSku": "PHwybtQI", "itemType": "iTWnIsaI"}, "quantity": 18, "type": "ITEM"}, {"currency": {"currencyCode": "nGgMk4wB", "namespace": "Rw2zXCeA"}, "item": {"itemId": "QxFGfRIQ", "itemSku": "tFB1Y1Tl", "itemType": "vIZHEHjt"}, "quantity": 17, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"IYNHRSay": "fgGJyPNg", "voKA69QU": "lSlGZfOd", "0uht4h8S": "LGqTByCR"}}, {"platform": "PSN", "platformDlcIdMap": {"pqIHorZh": "J8wiZLV0", "JtuzlsdH": "FiKilh8A", "QBudAHHk": "k8TBHl1y"}}, {"platform": "STEAM", "platformDlcIdMap": {"2FlBwPed": "ugtqJXFY", "WgdxYwZI": "eO5KbxiV", "lu5nRAem": "qMSmGEx8"}}]}' \
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
    --appType 'DLC' \
    --entitlementClazz 'ENTITLEMENT' \
    --entitlementName 'OMhnKzVx' \
    --itemId 'HvzCLXJO,6zNYBF1q,i3tNLaEj' \
    --limit '0' \
    --offset '95' \
    --userId 'uzzHR8T4' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'F3ZADHe4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --offset '22' \
    --status 'SUCCESS' \
    --userId 'PvJev0MB' \
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
    --body '{"bundleId": "kSUNh5Wa", "password": "0LJ8xDoA"}' \
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
    --body '{"sandboxId": "wBYpsxCz"}' \
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
    --body '{"applicationName": "0e6Qab26", "serviceAccountId": "pEzppsxH"}' \
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
    --body '{"data": [{"itemIdentity": "WwUFZLZ3", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"fwYSlnpN": "TzhIKPvj", "NOY3d6d4": "cNcJyzI0", "ceBGLPDR": "GXjIf7QI"}}, {"itemIdentity": "8f5hWacl", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"WtTvIayV": "apmDwbI4", "hTQJjIxv": "9Hu0N27s", "2tDtnsmJ": "gxKKQk4R"}}, {"itemIdentity": "rqjpOz93", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"Ouab8AnP": "I8l24TUF", "uwok5142": "BlU8PkKi", "0iQyetAr": "pEiEnmXc"}}]}' \
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
    --body '{"environment": "zzgJwaJp"}' \
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
    --body '{"appId": "O3tC8jH5", "publisherAuthenticationKey": "s2tsnSEU"}' \
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
    --body '{"clientId": "PiZK9Egt", "clientSecret": "8zkS1JYU", "organizationId": "zS5nOsLj"}' \
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
    --body '{"relyingPartyCert": "dZQdQ7NM"}' \
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
    --password 'uJ4iMAkh' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'N5SiPN3n' \
    --itemId 'gYS2NHr4' \
    --itemType 'LOOTBOX' \
    --endTime '5vA8NJI0' \
    --startTime 'VexF7uJx' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature '5xpS7HRM' \
    --itemId 'BBKdHkvx' \
    --itemType 'MEDIA' \
    --endTime 'Bs4qBOLf' \
    --startTime 'Uew8Kphj' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C1wEHwlA' \
    --body '{"categoryPath": "h9iF8p7p", "targetItemId": "cdWUYaeQ", "targetNamespace": "sRsItLyO"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RS61Fk8n' \
    --body '{"appId": "BRNbiGlv", "appType": "DEMO", "baseAppId": "GnFpU9Io", "boothName": "nLdoLd63", "categoryPath": "MELL5sRB", "clazz": "xpyghrxO", "displayOrder": 64, "entitlementType": "CONSUMABLE", "ext": {"xVLqQY8t": {}, "QYbLlkvC": {}, "5p8rNtgN": {}}, "features": ["HNVZW60f", "5pWcB5Gy", "3uNz32VT"], "images": [{"as": "3ARvIV7k", "caption": "E6PIzI6h", "height": 6, "imageUrl": "TSdeT4H9", "smallImageUrl": "e9GXwOQp", "width": 36}, {"as": "GW8yMrki", "caption": "PkyegC9q", "height": 19, "imageUrl": "tskKS6vX", "smallImageUrl": "VaAxFiin", "width": 95}, {"as": "bfYjX4g3", "caption": "w6QFCSGW", "height": 64, "imageUrl": "bhPa11zF", "smallImageUrl": "PRh9sQf5", "width": 66}], "itemIds": ["1ROAkrU4", "xwoEcdir", "7fyb9eGh"], "itemQty": {"nNioHdS3": 8, "XXjh7GZH": 78, "hh2BJ64R": 13}, "itemType": "MEDIA", "listable": false, "localizations": {"v65Op1zx": {"description": "RypVKyxO", "localExt": {"qeZgns3T": {}, "zuZ0orln": {}, "69qH3xnl": {}}, "longDescription": "u1tYZ8w0", "title": "8Ht4uX3S"}, "f3eGcHB6": {"description": "Z35o2Bmp", "localExt": {"a7m9FxOR": {}, "SfmVcrAM": {}, "ZfafNAKN": {}}, "longDescription": "R6dOBYhm", "title": "PXMmrX2b"}, "F8JWnKhR": {"description": "Y7sjZeU7", "localExt": {"m4fObWNx": {}, "fPjgV3B6": {}, "Jez3ksXA": {}}, "longDescription": "cTgHVKPR", "title": "eTUU2nU1"}}, "lootBoxConfig": {"rewardCount": 18, "rewards": [{"lootBoxItems": [{"count": 59, "itemId": "ZyC7XeC4", "itemSku": "xpofT1mG", "itemType": "07c4fM5x"}, {"count": 61, "itemId": "SnZpbagn", "itemSku": "O2qySosD", "itemType": "5oMwL7Vx"}, {"count": 95, "itemId": "mcUL38lH", "itemSku": "RrIqfdJO", "itemType": "bnVmtN3N"}], "name": "WkRztMuJ", "odds": 0.9957963152056823, "type": "REWARD", "weight": 32}, {"lootBoxItems": [{"count": 49, "itemId": "ih1UD7Im", "itemSku": "4oK6WA6r", "itemType": "vE7jkpdd"}, {"count": 7, "itemId": "nKNQRqTV", "itemSku": "BpT28oid", "itemType": "1zNgSSQi"}, {"count": 71, "itemId": "dcHB2cRF", "itemSku": "KCEuosQj", "itemType": "Y7Remmyt"}], "name": "lqCYmOOS", "odds": 0.9804234186011143, "type": "REWARD", "weight": 91}, {"lootBoxItems": [{"count": 8, "itemId": "8UOFvvXQ", "itemSku": "tdBe67BL", "itemType": "5ny6pkGr"}, {"count": 31, "itemId": "aNcEfAEh", "itemSku": "8JQeF65o", "itemType": "9ETP14oD"}, {"count": 7, "itemId": "V9NcMe7h", "itemSku": "V8XgAYwC", "itemType": "WbcjmdCd"}], "name": "lGnATbLF", "odds": 0.16406560528502967, "type": "PROBABILITY_GROUP", "weight": 56}], "rollFunction": "CUSTOM"}, "maxCount": 89, "maxCountPerUser": 7, "name": "3sf13vff", "optionBoxConfig": {"boxItems": [{"count": 46, "itemId": "85k2N4Gh", "itemSku": "baZQgre9", "itemType": "2QFc1lpe"}, {"count": 98, "itemId": "CU5DHGfL", "itemSku": "FYlJ3fdF", "itemType": "QFZuNR9z"}, {"count": 33, "itemId": "5JbqFQxS", "itemSku": "enGLZeI1", "itemType": "VSp9j7jA"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 9, "fixedTrialCycles": 100, "graceDays": 88}, "regionData": {"a5vrq7Mg": [{"currencyCode": "CKhC6FA2", "currencyNamespace": "iKGLsmHR", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1980-05-11T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1998-04-21T00:00:00Z", "discountedPrice": 46, "expireAt": "1999-08-23T00:00:00Z", "price": 79, "purchaseAt": "1994-11-10T00:00:00Z", "trialPrice": 63}, {"currencyCode": "x1p7Qlph", "currencyNamespace": "HzCZVrAp", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1976-01-11T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1974-07-21T00:00:00Z", "discountedPrice": 88, "expireAt": "1979-05-30T00:00:00Z", "price": 97, "purchaseAt": "1985-11-08T00:00:00Z", "trialPrice": 65}, {"currencyCode": "pECKVT8t", "currencyNamespace": "FfBUgi8c", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1995-02-06T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1979-11-24T00:00:00Z", "discountedPrice": 97, "expireAt": "1974-05-20T00:00:00Z", "price": 22, "purchaseAt": "1980-04-18T00:00:00Z", "trialPrice": 50}], "r1OgDRYZ": [{"currencyCode": "GSdNuIfA", "currencyNamespace": "JHPavxjT", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1973-12-31T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1984-06-19T00:00:00Z", "discountedPrice": 100, "expireAt": "1975-10-18T00:00:00Z", "price": 84, "purchaseAt": "1996-04-26T00:00:00Z", "trialPrice": 47}, {"currencyCode": "HjhK5v93", "currencyNamespace": "qPArkGg9", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1996-05-17T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1987-11-02T00:00:00Z", "discountedPrice": 63, "expireAt": "1983-12-18T00:00:00Z", "price": 85, "purchaseAt": "1989-06-05T00:00:00Z", "trialPrice": 16}, {"currencyCode": "aWxKIZFx", "currencyNamespace": "qX3HQNJB", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1980-11-05T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1992-05-28T00:00:00Z", "discountedPrice": 43, "expireAt": "1993-02-03T00:00:00Z", "price": 85, "purchaseAt": "1998-11-08T00:00:00Z", "trialPrice": 52}], "Kts2mXPa": [{"currencyCode": "WWUQD2e3", "currencyNamespace": "5BewKixS", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1975-12-15T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1991-12-17T00:00:00Z", "discountedPrice": 12, "expireAt": "1986-01-08T00:00:00Z", "price": 13, "purchaseAt": "1998-07-24T00:00:00Z", "trialPrice": 8}, {"currencyCode": "SW6Rnepu", "currencyNamespace": "059J1qGl", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1990-10-03T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1980-03-22T00:00:00Z", "discountedPrice": 41, "expireAt": "1981-03-04T00:00:00Z", "price": 42, "purchaseAt": "1982-07-03T00:00:00Z", "trialPrice": 44}, {"currencyCode": "qw5nI3gs", "currencyNamespace": "f4JNqn97", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1996-12-01T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1978-01-12T00:00:00Z", "discountedPrice": 25, "expireAt": "1983-10-25T00:00:00Z", "price": 79, "purchaseAt": "1987-08-25T00:00:00Z", "trialPrice": 89}]}, "seasonType": "TIER", "sku": "HgxK07m8", "stackable": true, "status": "INACTIVE", "tags": ["MypjApaQ", "zkp7ImfX", "1uMHXMN7"], "targetCurrencyCode": "up1etegR", "targetNamespace": "XDkxyr3V", "thumbnailUrl": "tSFE27tU", "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'TgoJBZSK' \
    --appId 'tDh5bDjF' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'gUhZ8kjD' \
    --baseAppId 'CjPUw487' \
    --categoryPath 'TEt1E34t' \
    --features '8sW4K8me' \
    --includeSubCategoryItem  \
    --itemType 'SUBSCRIPTION' \
    --limit '63' \
    --offset '3' \
    --region 'JKxZQLg0' \
    --sortBy 'createdAt:desc,updatedAt:desc' \
    --storeId 'JArvL6DY' \
    --tags 'Ly9jj2Wp' \
    --targetNamespace 'G1IOl0V3' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'CRYAKY1t,48Kelrk4,94L5z2kf' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'bI4ThFHS' \
    --sku 'uTlCuPXa' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'KZTj5JVz' \
    --populateBundle  \
    --region 'dda7aZfo' \
    --storeId 'YitVRn3y' \
    --sku 'uxJd3Xfu' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nLa7CLPg' \
    --sku 'DHtBSuJJ' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'abQi6hoD,jGdpztIq,vLHuIfU1' \
    --storeId 'kyRm4hbl' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'EDRlhCMx' \
    --region 'lPTUKcv5' \
    --storeId 'CR7o98NH' \
    --itemIds 'Xwc2ACnP' \
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
    --userId 'Y32Th194' \
    --body '{"itemIds": ["7FdNGec1", "0wFsyb4e", "GJEAvb2p"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'INGAMEITEM' \
    --limit '34' \
    --offset '18' \
    --sortBy 'wSiNlw3E' \
    --storeId 'dVpLszRI' \
    --keyword 'aRaYbS9v' \
    --language '2FJfBM6N' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '68' \
    --offset '29' \
    --sortBy 'displayOrder:desc,createdAt:asc,name:desc' \
    --storeId 'JvPTiERt' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'grBb2te4' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '5jjb4A6n' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId '7QjYmO7d' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HgPe2eXx' \
    --body '{"appId": "9oIT1cqP", "appType": "GAME", "baseAppId": "D1gXDklo", "boothName": "5WeDODSV", "categoryPath": "ONJCFQJL", "clazz": "pmwcxhgf", "displayOrder": 17, "entitlementType": "CONSUMABLE", "ext": {"m9zBcHgR": {}, "BPmHcxtG": {}, "JOr4MUVB": {}}, "features": ["rM1rpveX", "ISa2osYF", "lxOlzcVS"], "images": [{"as": "9q6hG2Wn", "caption": "63KfzKiK", "height": 40, "imageUrl": "fhWoCStD", "smallImageUrl": "LPAVAeIy", "width": 51}, {"as": "pwXY57NY", "caption": "UWx8uBp1", "height": 2, "imageUrl": "E4yYriAx", "smallImageUrl": "2IP0z9xP", "width": 77}, {"as": "LEVN9ebL", "caption": "edMLKisZ", "height": 86, "imageUrl": "U3UhAtjG", "smallImageUrl": "9tSvurdU", "width": 89}], "itemIds": ["DJoEHPcO", "a0sATcmO", "XQUKh3NT"], "itemQty": {"2AfebIzH": 36, "8K0pG0z9": 72, "XPM1kPQi": 48}, "itemType": "SEASON", "listable": false, "localizations": {"51el5SZX": {"description": "Akorgldl", "localExt": {"H7MHBzbN": {}, "m58bViKE": {}, "NzbRoaI4": {}}, "longDescription": "ZvHDhdVc", "title": "KxkdroIz"}, "5l1pyXTI": {"description": "ymIEOv1v", "localExt": {"udzmK0qL": {}, "l3PRSum8": {}, "NubtrpBw": {}}, "longDescription": "A0BiUHfK", "title": "DNJnicpD"}, "Ckz8TvWX": {"description": "ookwb7gw", "localExt": {"7CFTCYbb": {}, "GI0XqFCS": {}, "lO74G3v3": {}}, "longDescription": "vd61goLT", "title": "rAfaUvfi"}}, "lootBoxConfig": {"rewardCount": 85, "rewards": [{"lootBoxItems": [{"count": 3, "itemId": "Zdxc6DIi", "itemSku": "Nx0NRjdm", "itemType": "cHl1GiAC"}, {"count": 25, "itemId": "gefDawAn", "itemSku": "8TE70XYa", "itemType": "swb972Rz"}, {"count": 19, "itemId": "PaSY8GoL", "itemSku": "PM3mI9wM", "itemType": "qlZdLcNd"}], "name": "YSQ3Iehf", "odds": 0.3816207620197285, "type": "REWARD", "weight": 66}, {"lootBoxItems": [{"count": 12, "itemId": "hj7FX6vP", "itemSku": "lS4lytp2", "itemType": "RCqSa8H8"}, {"count": 62, "itemId": "d1q3zIAk", "itemSku": "8PRRB7RW", "itemType": "vogN4g6t"}, {"count": 97, "itemId": "AbrIMvBk", "itemSku": "e9Qe6sFP", "itemType": "CVjPU17L"}], "name": "Y7kY9cG5", "odds": 0.9472173624886113, "type": "REWARD_GROUP", "weight": 43}, {"lootBoxItems": [{"count": 46, "itemId": "8GJgIPJF", "itemSku": "bymHHGEl", "itemType": "Y6uTXZho"}, {"count": 45, "itemId": "Vay7rCPQ", "itemSku": "35X1OGCV", "itemType": "mbKPfvgM"}, {"count": 12, "itemId": "fzA0RGVv", "itemSku": "gZrxXl4U", "itemType": "s2CWH8tf"}], "name": "rEmCU6RG", "odds": 0.13691561195024393, "type": "REWARD", "weight": 42}], "rollFunction": "CUSTOM"}, "maxCount": 74, "maxCountPerUser": 79, "name": "VuAhNVDP", "optionBoxConfig": {"boxItems": [{"count": 93, "itemId": "MGnHAP2z", "itemSku": "UpCh05Xl", "itemType": "B0K3ssAC"}, {"count": 44, "itemId": "NnJA84ae", "itemSku": "4SsVX50k", "itemType": "l7VoF80i"}, {"count": 72, "itemId": "kLZOnYvS", "itemSku": "Ml9oMIEy", "itemType": "yjbQ6ALz"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 65, "fixedTrialCycles": 63, "graceDays": 32}, "regionData": {"Ks0g86zi": [{"currencyCode": "HxtV3Ybh", "currencyNamespace": "sza42bsM", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1993-11-28T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1992-07-13T00:00:00Z", "discountedPrice": 11, "expireAt": "1989-04-14T00:00:00Z", "price": 90, "purchaseAt": "1991-04-18T00:00:00Z", "trialPrice": 82}, {"currencyCode": "UliTPgYy", "currencyNamespace": "hRrdvCk8", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1996-05-19T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1975-07-28T00:00:00Z", "discountedPrice": 5, "expireAt": "1979-05-23T00:00:00Z", "price": 46, "purchaseAt": "1974-01-23T00:00:00Z", "trialPrice": 66}, {"currencyCode": "VqR3t6De", "currencyNamespace": "Vdon4VFB", "currencyType": "VIRTUAL", "discountAmount": 70, "discountExpireAt": "1985-02-12T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1983-04-17T00:00:00Z", "discountedPrice": 26, "expireAt": "1998-01-25T00:00:00Z", "price": 97, "purchaseAt": "1994-02-24T00:00:00Z", "trialPrice": 83}], "334FupYR": [{"currencyCode": "skYckMjE", "currencyNamespace": "Otf0p2gD", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1990-01-10T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1984-02-04T00:00:00Z", "discountedPrice": 39, "expireAt": "1975-08-14T00:00:00Z", "price": 17, "purchaseAt": "1989-03-11T00:00:00Z", "trialPrice": 3}, {"currencyCode": "KDb9VKoY", "currencyNamespace": "adCa3QUI", "currencyType": "VIRTUAL", "discountAmount": 45, "discountExpireAt": "1996-03-14T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1997-08-29T00:00:00Z", "discountedPrice": 34, "expireAt": "1989-03-01T00:00:00Z", "price": 62, "purchaseAt": "1995-03-07T00:00:00Z", "trialPrice": 46}, {"currencyCode": "WSgsgrnk", "currencyNamespace": "R9AeVJYB", "currencyType": "VIRTUAL", "discountAmount": 81, "discountExpireAt": "1974-07-19T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1989-05-29T00:00:00Z", "discountedPrice": 49, "expireAt": "1986-05-01T00:00:00Z", "price": 42, "purchaseAt": "1981-05-12T00:00:00Z", "trialPrice": 9}], "xa9ucz7A": [{"currencyCode": "JmyaFKpn", "currencyNamespace": "DhVGK9MI", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1988-06-01T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1987-08-27T00:00:00Z", "discountedPrice": 88, "expireAt": "1972-09-03T00:00:00Z", "price": 39, "purchaseAt": "1984-03-14T00:00:00Z", "trialPrice": 95}, {"currencyCode": "B9kzCes4", "currencyNamespace": "B8qQeF7R", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1989-07-31T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1981-11-10T00:00:00Z", "discountedPrice": 78, "expireAt": "1974-07-09T00:00:00Z", "price": 80, "purchaseAt": "1996-09-14T00:00:00Z", "trialPrice": 7}, {"currencyCode": "lFJ3bG9H", "currencyNamespace": "vXm7l3tR", "currencyType": "REAL", "discountAmount": 75, "discountExpireAt": "1984-06-06T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1982-05-07T00:00:00Z", "discountedPrice": 47, "expireAt": "1977-10-27T00:00:00Z", "price": 2, "purchaseAt": "1984-03-12T00:00:00Z", "trialPrice": 83}]}, "seasonType": "PASS", "sku": "FYH5VMzW", "stackable": false, "status": "INACTIVE", "tags": ["o8faLxFy", "Rx1TCbT2", "0xjylWDS"], "targetCurrencyCode": "w4Ao3hBu", "targetNamespace": "Q7oaSUEz", "thumbnailUrl": "q2X41m6d", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'xhfHWJVb' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '8x6wx2yd' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '8xStY8l4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 72, "orderNo": "0kzscjTw"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'H7vHAvC0' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'OkC5n367' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'PoaRdPnW' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uPrhUZhH' \
    --body '{"carousel": [{"alt": "esbEy8s7", "previewUrl": "92r0SYO5", "thumbnailUrl": "7yajbHTq", "type": "image", "url": "KQbusf7C", "videoSource": "youtube"}, {"alt": "CN9BFOMQ", "previewUrl": "I8rHpeJR", "thumbnailUrl": "Ttdm0BbV", "type": "video", "url": "THWI2gtF", "videoSource": "vimeo"}, {"alt": "z7RXsKcl", "previewUrl": "jvVh3hCA", "thumbnailUrl": "jA9305fW", "type": "image", "url": "U1xajiY5", "videoSource": "vimeo"}], "developer": "17KMdumD", "forumUrl": "gygMv6Rg", "genres": ["Simulation", "Strategy", "Indie"], "localizations": {"hN8SASjo": {"announcement": "W0IHCP9q", "slogan": "r1gKjqBZ"}, "SGecuYVV": {"announcement": "QcWa7ihT", "slogan": "BlZKACR1"}, "YgGWZE3J": {"announcement": "fQKW5lnf", "slogan": "qsA6zC4k"}}, "platformRequirements": {"OSdndq0w": [{"additionals": "UnGKIaiP", "directXVersion": "MZKgNemo", "diskSpace": "VAcjKhgj", "graphics": "TfVPfvfv", "label": "TjkMtrW4", "osVersion": "reHSVzje", "processor": "UPtd109r", "ram": "qEmrAltk", "soundCard": "KQdyYntu"}, {"additionals": "1RzMGSZT", "directXVersion": "K1I0Ce0D", "diskSpace": "up3mLXQx", "graphics": "jXP4BzBw", "label": "Pg04G2qG", "osVersion": "ZpHRYcFI", "processor": "xzB2QIBy", "ram": "bJKC7XRu", "soundCard": "wgMNFyNG"}, {"additionals": "lfggLCx7", "directXVersion": "BMRh4F3m", "diskSpace": "rYxHlmg1", "graphics": "lSUYnf0z", "label": "oVJKvSkl", "osVersion": "PjXR9u88", "processor": "RiBxh6N2", "ram": "bQPbUIIZ", "soundCard": "eF26cjpj"}], "qmqZ9Ds3": [{"additionals": "AF5qKcfJ", "directXVersion": "IFWCYKAZ", "diskSpace": "BNZKCc2Q", "graphics": "35AuOaME", "label": "n7FEr9YG", "osVersion": "S2iKb70N", "processor": "1c85Mx5Y", "ram": "tOTgJUMg", "soundCard": "F5l8ZAGn"}, {"additionals": "8cHoomoI", "directXVersion": "wRXZXpbD", "diskSpace": "5ArvZttS", "graphics": "hJT4BwJI", "label": "y6ErTm5h", "osVersion": "cp4O5stP", "processor": "vWucurnu", "ram": "Y2zxJbRF", "soundCard": "1xNPvHxV"}, {"additionals": "gWdgs4X3", "directXVersion": "EKOh2YUH", "diskSpace": "5IrrRrDs", "graphics": "4G4jp1wa", "label": "JG4Cdd27", "osVersion": "hvQgQ7UH", "processor": "b39Hb5Xi", "ram": "uUlqmFQb", "soundCard": "yNpO473E"}], "69URjycp": [{"additionals": "dZuNCWnh", "directXVersion": "T72p3y6b", "diskSpace": "hZ3j5tCR", "graphics": "v7eguB1X", "label": "Q4aOU760", "osVersion": "XP2IWwuW", "processor": "YUK0ORyt", "ram": "xi4JEt91", "soundCard": "ZImOaDsq"}, {"additionals": "vTOehxNk", "directXVersion": "nCian60B", "diskSpace": "pX64dgMz", "graphics": "jF7m30Eo", "label": "Fs2AvGfl", "osVersion": "uT1NjzRd", "processor": "q3j1W2hz", "ram": "svugwbW4", "soundCard": "Guuizawx"}, {"additionals": "Sg6a7CHi", "directXVersion": "7hdpnbMi", "diskSpace": "WjRcAKuf", "graphics": "iA4XlQ54", "label": "SefoYYTh", "osVersion": "BsKJ1G8P", "processor": "zwiEBlrR", "ram": "sfG3pjjQ", "soundCard": "j78gFabJ"}]}, "platforms": ["IOS", "Windows", "IOS"], "players": ["Coop", "CrossPlatformMulti", "CrossPlatformMulti"], "primaryGenre": "Casual", "publisher": "AvcEqZNF", "releaseDate": "1980-03-12T00:00:00Z", "websiteUrl": "1npomjQO"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '2pmpSTab' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'TotrY92e' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'Z09J7THn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'edWYd0Z3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RnbzRwI1' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'cYelXHkD' \
    --itemId 'AZRutbxf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VZsPuVcp' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'rWDP8MYf' \
    --itemId 'NAH6y7tg' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'm510s1oC' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'thXSPZgC' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'SUwVsdKY' \
    --populateBundle  \
    --region '95LqhOeQ' \
    --storeId 'cBE7ivNe' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'KhpcDmOH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'v6wEl3Xf' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 46, "comparison": "isGreaterThanOrEqual", "name": "mS8PKTd8", "predicateType": "SeasonTierPredicate", "value": "a5cXl2sa", "values": ["AfgOsLwh", "gSGqgF3z", "FnmTlXVP"]}, {"anyOf": 9, "comparison": "excludes", "name": "OGP5RPKM", "predicateType": "EntitlementPredicate", "value": "qQSQOLWb", "values": ["6G1AN09J", "H8THXgV2", "04qbm5Zr"]}, {"anyOf": 24, "comparison": "isLessThanOrEqual", "name": "LYeOIINu", "predicateType": "SeasonTierPredicate", "value": "JwCWyn7y", "values": ["lNTF60Ir", "as1Gfz9C", "aaa4TJJr"]}]}, {"operator": "and", "predicates": [{"anyOf": 51, "comparison": "isGreaterThan", "name": "B4NwmDU5", "predicateType": "SeasonPassPredicate", "value": "VJtxjoxX", "values": ["tpikoEOX", "APIWpIdu", "D5aBuRob"]}, {"anyOf": 42, "comparison": "isLessThan", "name": "hqt1NswG", "predicateType": "EntitlementPredicate", "value": "l9s1CYST", "values": ["w6HKTIQj", "ZMznOKUB", "dtDnWeZX"]}, {"anyOf": 39, "comparison": "is", "name": "091RO4Dr", "predicateType": "EntitlementPredicate", "value": "tbNV8qWi", "values": ["qqQWqfAG", "sScJe3HN", "FcaAUede"]}]}, {"operator": "or", "predicates": [{"anyOf": 74, "comparison": "isGreaterThanOrEqual", "name": "ERa5Lva3", "predicateType": "EntitlementPredicate", "value": "hmuRFCI9", "values": ["AtDmSbyn", "eOXUFtdq", "2GtmSyvM"]}, {"anyOf": 31, "comparison": "isLessThan", "name": "U00kNU2f", "predicateType": "EntitlementPredicate", "value": "C0ddqvAR", "values": ["dWv8YmNT", "h4pKRCZW", "QBoabVbi"]}, {"anyOf": 100, "comparison": "isNot", "name": "juDfSz6z", "predicateType": "SeasonTierPredicate", "value": "Uzo5Inr3", "values": ["XeLE454D", "cIgm6odz", "lN9U5TB5"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'qgKvCzBJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "V5NV2JVu"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --name 'X5GN6LOs' \
    --offset '71' \
    --tag 'rlYymBKn' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "vQd9nrAb", "name": "92oZXjJW", "status": "INACTIVE", "tags": ["8R2fb8e9", "BOI9ZqrU", "DV9OAXkD"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId '5XyCcC8A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'txcLdCJM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HxC4OOQC", "name": "9g10CrCz", "status": "INACTIVE", "tags": ["PKfEnu0M", "I4chO4VF", "9XPokdUa"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'zlsuAFwn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '4plbEBbO' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '95' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'mvAwaFx8' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'bMMzwjHM' \
    --limit '72' \
    --offset '6' \
    --orderNos '0he6eMzY,v856rzDy,jAs8xW1m' \
    --sortBy '99mycra2' \
    --startTime 'OZQjFQfk' \
    --status 'CLOSED' \
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
    --orderNo 'mbq5dYVb' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '11rrvyJP' \
    --body '{"description": "3C4pvPdE"}' \
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
    --body '{"dryRun": false, "notifyUrl": "2918Ab0Z", "privateKey": "kjVTKpUV"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '11Ga2CwA' \
    --externalId 'IXAwlKyz' \
    --limit '79' \
    --notificationSource 'ADYEN' \
    --notificationType 'D2Ivgiio' \
    --offset '19' \
    --paymentOrderNo '6QzaUALz' \
    --startDate 'gKHBP93U' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId '19RcWHP8' \
    --limit '43' \
    --offset '39' \
    --status 'NOTIFICATION_OF_CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "y6TUKgRS", "currencyNamespace": "QyFq5biB", "customParameters": {"OB9mVIRi": {}, "p3qQ2EdA": {}, "F3sn7oQh": {}}, "description": "BuGUXL0k", "extOrderNo": "Ah4Uk8oO", "extUserId": "3o9Jybao", "itemType": "SUBSCRIPTION", "language": "Uu-us", "metadata": {"7iC6OhI0": "NMK2ewsx", "gGK8PPaT": "E5WUpArj", "cJwjEHcs": "ivXW78wG"}, "notifyUrl": "IFcQBaoi", "omitNotification": true, "platform": "0g2xsfKj", "price": 99, "recurringPaymentOrderNo": "BMU1kIqX", "region": "gGueV3Cl", "returnUrl": "2bbYNPPr", "sandbox": false, "sku": "mZbosmhm", "subscriptionId": "jbtw5Ggg", "targetNamespace": "SKcQQ5qf", "targetUserId": "mtUSTJh7", "title": "rOqnox6f"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'dM9iEh9e' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'stAezc8G' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jZwQYHiK' \
    --body '{"extTxId": "9HybJGOu", "paymentMethod": "MyxJ5QMn", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8sEOnQm8' \
    --body '{"description": "91IGLZiq"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qCP4FbyI' \
    --body '{"amount": 85, "currencyCode": "1XBZXvyt", "notifyType": "CHARGE", "paymentProvider": "WXPAY", "salesTax": 37, "vat": 99}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fAhFRGvZ' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["IOS", "Playstation", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 135 'ResetPlatformWalletConfig' test.out

#- 136 GetPaymentCallbackConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetPaymentCallbackConfig1' test.out

#- 137 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 137 'UpdateRevocationConfig' test.out

#- 138 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'DeleteRevocationConfig' test.out

#- 139 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Ibkgv5DI' \
    --limit '86' \
    --offset '21' \
    --source 'ORDER' \
    --startTime 'Q6JQRZfJ' \
    --status 'SUCCESS' \
    --transactionId 'mc54dFhs' \
    --userId 'OqY0Icif' \
    > test.out 2>&1
eval_tap $? 139 'QueryRevocationHistories' test.out

#- 140 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "SIrrxqAz", "eventTopic": "O6qBt1CR", "maxAwarded": 1, "maxAwardedPerUser": 74, "namespaceExpression": "STy8tBBj", "rewardCode": "mkC6SgSF", "rewardConditions": [{"condition": "wgqsWiK0", "conditionName": "hMFnOROj", "eventName": "yDOPSZX2", "rewardItems": [{"duration": 83, "itemId": "GyFlGbpb", "quantity": 15}, {"duration": 5, "itemId": "g5eczA9g", "quantity": 97}, {"duration": 73, "itemId": "ocWHyg2T", "quantity": 23}]}, {"condition": "J0uJhtwJ", "conditionName": "VC2ObTRA", "eventName": "exBpCwmK", "rewardItems": [{"duration": 3, "itemId": "ATnsPCOW", "quantity": 97}, {"duration": 81, "itemId": "Rgx11vS4", "quantity": 92}, {"duration": 98, "itemId": "MxOBGGh3", "quantity": 21}]}, {"condition": "FXWhhYMZ", "conditionName": "pfgc5a80", "eventName": "bzc6yuM3", "rewardItems": [{"duration": 36, "itemId": "JSZd2QFY", "quantity": 28}, {"duration": 0, "itemId": "yagsD7XY", "quantity": 14}, {"duration": 28, "itemId": "OCXXCFrD", "quantity": 56}]}], "userIdExpression": "5NElCDdh"}' \
    > test.out 2>&1
eval_tap $? 140 'CreateReward' test.out

#- 141 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'arGfitgs' \
    --limit '82' \
    --offset '55' \
    --sortBy 'rewardCode:desc,rewardCode' \
    > test.out 2>&1
eval_tap $? 141 'QueryRewards' test.out

#- 142 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'ExportRewards' test.out

#- 143 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 143 'ImportRewards' test.out

#- 144 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'rr88QKbv' \
    > test.out 2>&1
eval_tap $? 144 'GetReward' test.out

#- 145 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ICyIdbmE' \
    --body '{"description": "sGpGpoQQ", "eventTopic": "pEmgCs88", "maxAwarded": 61, "maxAwardedPerUser": 23, "namespaceExpression": "7dISxmrO", "rewardCode": "bG1JAabk", "rewardConditions": [{"condition": "UG1BT5IX", "conditionName": "A19VLb26", "eventName": "FkZSXSW0", "rewardItems": [{"duration": 43, "itemId": "L88XmMnF", "quantity": 26}, {"duration": 51, "itemId": "4x0qu1Tz", "quantity": 52}, {"duration": 76, "itemId": "iLa6D921", "quantity": 95}]}, {"condition": "5e76lhXN", "conditionName": "HXscYpVx", "eventName": "sMDEBXVW", "rewardItems": [{"duration": 42, "itemId": "jDvHHtp2", "quantity": 62}, {"duration": 98, "itemId": "D1EP86uU", "quantity": 44}, {"duration": 9, "itemId": "9G8WvSzg", "quantity": 56}]}, {"condition": "yjoR18ka", "conditionName": "1e8JwzNj", "eventName": "Jqkp6wAe", "rewardItems": [{"duration": 67, "itemId": "pW4MoMhP", "quantity": 23}, {"duration": 33, "itemId": "m5iLZRvI", "quantity": 99}, {"duration": 6, "itemId": "mz0qGMEs", "quantity": 34}]}], "userIdExpression": "CwkwW0cM"}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateReward' test.out

#- 146 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'WUT6DxLU' \
    > test.out 2>&1
eval_tap $? 146 'DeleteReward' test.out

#- 147 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'NRzfrwiK' \
    --body '{"payload": {"caXEVNBe": {}, "N2nT1kp4": {}, "exvnTO3A": {}}}' \
    > test.out 2>&1
eval_tap $? 147 'CheckEventCondition' test.out

#- 148 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'pAYTvckr' \
    --body '{"conditionName": "oJAuusUJ", "userId": "uqKHeDPY"}' \
    > test.out 2>&1
eval_tap $? 148 'DeleteRewardConditionRecord' test.out

#- 149 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'cv9O2aDP' \
    --limit '61' \
    --offset '15' \
    --start 'vP8OqpnA' \
    --storeId 'jCAn4Pjt' \
    --viewId 'NYx2NTkb' \
    > test.out 2>&1
eval_tap $? 149 'QuerySections' test.out

#- 150 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qI3728BQ' \
    --body '{"active": true, "displayOrder": 83, "endDate": "1972-04-02T00:00:00Z", "ext": {"n2y77nbw": {}, "uAp8LlHQ": {}, "iJU2tETr": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 24, "itemCount": 8, "rule": "SEQUENCE"}, "items": [{"id": "c4q40mxM", "sku": "Xr8hPsbK"}, {"id": "UPf2DMNo", "sku": "gDpeohpW"}, {"id": "HEpJo75S", "sku": "EI4t6VrR"}], "localizations": {"kcoYx4sr": {"description": "oFYnJMnF", "localExt": {"6dTWGV0m": {}, "JqQhfJxI": {}, "7qeKmHUn": {}}, "longDescription": "6bMAvWQL", "title": "7f5Mk7EN"}, "s8x4Dsm6": {"description": "Gc9TSMTf", "localExt": {"MAVAGmkJ": {}, "ZS9HFpPV": {}, "ycK4NUyP": {}}, "longDescription": "MpmG8yey", "title": "DzhCChDQ"}, "TR0pnMz3": {"description": "KoeO8PFn", "localExt": {"f3TxIFoM": {}, "twC01awc": {}, "UgbCTFix": {}}, "longDescription": "Grkd1PFR", "title": "xrlZVZ1E"}}, "name": "eMcmGPsG", "rotationType": "CUSTOM", "startDate": "1988-02-12T00:00:00Z", "viewId": "ndIVARib"}' \
    > test.out 2>&1
eval_tap $? 150 'CreateSection' test.out

#- 151 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I8gOUgSn' \
    > test.out 2>&1
eval_tap $? 151 'PurgeExpiredSection' test.out

#- 152 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'DsJYPxkU' \
    --storeId 'vPjwgP1A' \
    > test.out 2>&1
eval_tap $? 152 'GetSection' test.out

#- 153 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'uaNxQs7T' \
    --storeId 'NGUNUY76' \
    --body '{"active": false, "displayOrder": 41, "endDate": "1989-05-20T00:00:00Z", "ext": {"tqIjUSxy": {}, "WzSG5CXv": {}, "OoO1OtPQ": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 26, "itemCount": 28, "rule": "SEQUENCE"}, "items": [{"id": "nyWM0zBS", "sku": "Z18orSkv"}, {"id": "0bJG4xGJ", "sku": "1cmi9nl4"}, {"id": "IRoHnc3E", "sku": "G5whSmeO"}], "localizations": {"EAnnlz1Y": {"description": "Ghsfff1j", "localExt": {"LaLei8FA": {}, "UOodE6iB": {}, "WwCY6etq": {}}, "longDescription": "DX4c9D0S", "title": "68CIK6M3"}, "zEskBHVo": {"description": "E6jtP2ne", "localExt": {"zheHQVYD": {}, "Vz3iguiS": {}, "RijfsRCm": {}}, "longDescription": "Cf7f5wlB", "title": "KdzNJl8x"}, "TELW0QmE": {"description": "q2oLeRFQ", "localExt": {"csM0ri3K": {}, "CxUolOCs": {}, "XJ2tXtKi": {}}, "longDescription": "A8AKl9iE", "title": "gbRmIhFQ"}}, "name": "PlXl4W1t", "rotationType": "NONE", "startDate": "1979-10-28T00:00:00Z", "viewId": "jhWENlhl"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateSection' test.out

#- 154 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'y4m9qij4' \
    --storeId 'gTHpARDt' \
    > test.out 2>&1
eval_tap $? 154 'DeleteSection' test.out

#- 155 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'ListStores' test.out

#- 156 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "ivF2PQS6", "defaultRegion": "iDbbW15R", "description": "BK35sDqu", "supportedLanguages": ["kOZpwfkp", "2PZH6YPt", "DISQfo8o"], "supportedRegions": ["EF9aEaF6", "2tdSk9YU", "XzByo2xQ"], "title": "AFB1zkkd"}' \
    > test.out 2>&1
eval_tap $? 156 'CreateStore' test.out

#- 157 ImportStore
eval_tap 0 157 'ImportStore # SKIP deprecated' test.out

#- 158 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 158 'GetPublishedStore' test.out

#- 159 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'DeletePublishedStore' test.out

#- 160 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 160 'GetPublishedStoreBackup' test.out

#- 161 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'RollbackPublishedStore' test.out

#- 162 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'f2eScMtT' \
    > test.out 2>&1
eval_tap $? 162 'GetStore' test.out

#- 163 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mCBPcU2W' \
    --body '{"defaultLanguage": "kBJbO7Dv", "defaultRegion": "tXvZGUOH", "description": "X5We3KHJ", "supportedLanguages": ["9Z6y8tM7", "ALM7wFKo", "udSgF0w1"], "supportedRegions": ["RWcVKn9u", "kdV1ocuR", "5iDChbTI"], "title": "AOtTkDkD"}' \
    > test.out 2>&1
eval_tap $? 163 'UpdateStore' test.out

#- 164 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Zqp6MONv' \
    > test.out 2>&1
eval_tap $? 164 'DeleteStore' test.out

#- 165 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aqyvKMOX' \
    --action 'DELETE' \
    --itemSku 'PTqzL3Zg' \
    --itemType 'BUNDLE' \
    --limit '26' \
    --offset '16' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt' \
    --status 'UNPUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'LTyUNQFh' \
    --updatedAtStart 'W0ZY9bDs' \
    > test.out 2>&1
eval_tap $? 165 'QueryChanges' test.out

#- 166 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RAK08a3Z' \
    > test.out 2>&1
eval_tap $? 166 'PublishAll' test.out

#- 167 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KRCRF35H' \
    > test.out 2>&1
eval_tap $? 167 'PublishSelected' test.out

#- 168 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '8DJHz6lc' \
    > test.out 2>&1
eval_tap $? 168 'SelectAllRecords' test.out

#- 169 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'am60JI23' \
    --action 'UPDATE' \
    --itemSku 'qFbXSmr6' \
    --itemType 'LOOTBOX' \
    --type 'ITEM' \
    --updatedAtEnd 'SUW5XSMz' \
    --updatedAtStart '0czQVexM' \
    > test.out 2>&1
eval_tap $? 169 'GetStatistic' test.out

#- 170 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 't1A6AfYn' \
    > test.out 2>&1
eval_tap $? 170 'UnselectAllRecords' test.out

#- 171 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'Au7B22LO' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'BFJ6MDmI' \
    > test.out 2>&1
eval_tap $? 171 'SelectRecord' test.out

#- 172 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'GNgpVFV6' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jvg41vvs' \
    > test.out 2>&1
eval_tap $? 172 'UnselectRecord' test.out

#- 173 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'irsykRNG' \
    --targetStoreId '33iTwYfC' \
    > test.out 2>&1
eval_tap $? 173 'CloneStore' test.out

#- 174 ExportStore
eval_tap 0 174 'ExportStore # SKIP deprecated' test.out

#- 175 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'gBc4bhHB' \
    --limit '32' \
    --offset '62' \
    --sku 'jsGORIzZ' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    --userId 'WgEpz3AL' \
    > test.out 2>&1
eval_tap $? 175 'QuerySubscriptions' test.out

#- 176 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'afkz94Vt' \
    > test.out 2>&1
eval_tap $? 176 'RecurringChargeSubscription' test.out

#- 177 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '6Veaw2VR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'GetTicketDynamic' test.out

#- 178 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'fmhFA5Tj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "NUkrukiZ"}' \
    > test.out 2>&1
eval_tap $? 178 'DecreaseTicketSale' test.out

#- 179 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'psNbH5S5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'GetTicketBoothID' test.out

#- 180 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'OMombn3i' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 41, "orderNo": "HdrLaAjZ"}' \
    > test.out 2>&1
eval_tap $? 180 'IncreaseTicketSale' test.out

#- 181 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qheT6pzs' \
    --body '{"achievements": [{"id": "QT6NusTi", "value": 48}, {"id": "KiPOXqGZ", "value": 13}, {"id": "HHEhCN4E", "value": 93}], "steamUserId": "nBFH7dlj"}' \
    > test.out 2>&1
eval_tap $? 181 'UnlockSteamUserAchievement' test.out

#- 182 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '6DUOKGOy' \
    --xboxUserId 'PPZgK9gp' \
    > test.out 2>&1
eval_tap $? 182 'GetXblUserAchievements' test.out

#- 183 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cbx7Sjjx' \
    --body '{"achievements": [{"id": "7TaqQD7k", "value": 33}, {"id": "0FnwYgOG", "value": 6}, {"id": "0Vf0NxDi", "value": 63}], "serviceConfigId": "DYg5whGW", "titleId": "F9PbDtNS", "xboxUserId": "qKloLtQ7"}' \
    > test.out 2>&1
eval_tap $? 183 'UpdateXblUserAchievement' test.out

#- 184 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'sx7OnE06' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeCampaign' test.out

#- 185 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MyvbQko5' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeEntitlement' test.out

#- 186 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'eHYoEy15' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeFulfillment' test.out

#- 187 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'eda7mmjJ' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeIntegration' test.out

#- 188 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'rxCIOCLZ' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizeOrder' test.out

#- 189 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'tWRL490x' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizePayment' test.out

#- 190 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'uQEeZ0VV' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeRevocation' test.out

#- 191 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'jphk2zl0' \
    > test.out 2>&1
eval_tap $? 191 'AnonymizeSubscription' test.out

#- 192 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '2feQvP8j' \
    > test.out 2>&1
eval_tap $? 192 'AnonymizeWallet' test.out

#- 193 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1RZLv6r' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 193 'GetUserDLC' test.out

#- 194 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LqZzbR4Y' \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName '8rfvR9DW' \
    --features 'NSFoTuKw,EGxmRABh,INomnOoq' \
    --itemId 'Wkz74ZAO,5dnOGozU,ob5LlXc3' \
    --limit '55' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 194 'QueryUserEntitlements' test.out

#- 195 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'PB8toxw3' \
    --body '[{"endDate": "1992-03-04T00:00:00Z", "grantedCode": "T8yzzp9N", "itemId": "GDC0wpla", "itemNamespace": "aJ6N3d4g", "language": "qQaV-279", "quantity": 21, "region": "i0WpsPcD", "source": "IAP", "startDate": "1994-08-07T00:00:00Z", "storeId": "7JHUoelB"}, {"endDate": "1975-09-15T00:00:00Z", "grantedCode": "IYAtYxhw", "itemId": "zcaaXIE8", "itemNamespace": "TzsNqAA7", "language": "YkQj_220", "quantity": 95, "region": "Bjbyja0l", "source": "IAP", "startDate": "1973-11-19T00:00:00Z", "storeId": "14uAVPNb"}, {"endDate": "1976-02-19T00:00:00Z", "grantedCode": "tG6TFAJg", "itemId": "B7waVnNO", "itemNamespace": "96WSsWYK", "language": "QC", "quantity": 20, "region": "6pALvnks", "source": "OTHER", "startDate": "1971-12-04T00:00:00Z", "storeId": "oDFfmDN9"}]' \
    > test.out 2>&1
eval_tap $? 195 'GrantUserEntitlement' test.out

#- 196 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fwtgXLA3' \
    --activeOnly  \
    --appId 'ymsSlUrY' \
    > test.out 2>&1
eval_tap $? 196 'GetUserAppEntitlementByAppId' test.out

#- 197 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'h7KWnMvz' \
    --activeOnly  \
    --limit '39' \
    --offset '2' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 197 'QueryUserEntitlementsByAppType' test.out

#- 198 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kh7HJbEF' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId 'z3hQM8vB' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementByItemId' test.out

#- 199 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'wtXNLoaY' \
    --ids 'lNkYf4QX,WnvWdO9f,O3MBzIFN' \
    > test.out 2>&1
eval_tap $? 199 'GetUserActiveEntitlementsByItemIds' test.out

#- 200 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'nYSDeGEZ' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --sku '0HCnziVf' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementBySku' test.out

#- 201 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hRYZhZJ8' \
    --appIds 'VoaIPiV2,nqk1BFuT,hkZidXZ3' \
    --itemIds 'E1Eyc2fk,CzacAZau,7K6Uheb6' \
    --skus 'cgbEANj4,7zBdcIbs,ZYy9AhON' \
    > test.out 2>&1
eval_tap $? 201 'ExistsAnyUserActiveEntitlement' test.out

#- 202 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '3I4b2810' \
    --itemIds 'fvpscM6k,BhRURRHQ,VrNEr84D' \
    > test.out 2>&1
eval_tap $? 202 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 203 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjfO6Zin' \
    --appId 'Beo6L67n' \
    > test.out 2>&1
eval_tap $? 203 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 204 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'UXwCyYmc' \
    --entitlementClazz 'MEDIA' \
    --itemId 'b6HMZNCw' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipByItemId' test.out

#- 205 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'GEfRCdwF' \
    --ids '5JAVj0To,vSLiRntk,0f8G3pbK' \
    > test.out 2>&1
eval_tap $? 205 'GetUserEntitlementOwnershipByItemIds' test.out

#- 206 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'iZPNjMze' \
    --entitlementClazz 'MEDIA' \
    --sku 'eHkVCR6H' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlementOwnershipBySku' test.out

#- 207 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'DzfClbAQ' \
    --entitlementIds '9danFQNV' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserEntitlements' test.out

#- 208 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'fuEaEHEC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BmMOLLNh' \
    > test.out 2>&1
eval_tap $? 208 'GetUserEntitlement' test.out

#- 209 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'FptKrhKq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jaI486pN' \
    --body '{"endDate": "1985-11-23T00:00:00Z", "nullFieldList": ["0zrjpzRB", "3xE08PDe", "V3uxLmEd"], "startDate": "1998-05-21T00:00:00Z", "status": "ACTIVE", "useCount": 16}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateUserEntitlement' test.out

#- 210 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'KsRcwI99' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tv91vtht' \
    --body '{"options": ["RiXMCPRA", "vwZmwso1", "H8AP8q11"], "requestId": "UqLEYaNs", "useCount": 20}' \
    > test.out 2>&1
eval_tap $? 210 'ConsumeUserEntitlement' test.out

#- 211 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'vfW3YQ7c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'juWFzq2o' \
    > test.out 2>&1
eval_tap $? 211 'DisableUserEntitlement' test.out

#- 212 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'XrozCL8C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gpz364L6' \
    > test.out 2>&1
eval_tap $? 212 'EnableUserEntitlement' test.out

#- 213 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'vpcSS8dE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnTziTW2' \
    > test.out 2>&1
eval_tap $? 213 'GetUserEntitlementHistories' test.out

#- 214 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'obRQHrPO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdKJDU8Y' \
    > test.out 2>&1
eval_tap $? 214 'RevokeUserEntitlement' test.out

#- 215 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iecj60FQ' \
    --body '{"duration": 73, "endDate": "1985-02-27T00:00:00Z", "itemId": "VDw3qO9i", "itemSku": "xRJndPxz", "language": "wdyY3AGv", "order": {"currency": {"currencyCode": "vic6KLvR", "currencySymbol": "Mf3uDQhA", "currencyType": "VIRTUAL", "decimals": 36, "namespace": "K2R6QBR3"}, "ext": {"BeWRXrXO": {}, "BUwg7hHz": {}, "cgr4WYpj": {}}, "free": true}, "orderNo": "bZH9r4hp", "origin": "IOS", "quantity": 11, "region": "LryJ5rYv", "source": "PURCHASE", "startDate": "1983-11-30T00:00:00Z", "storeId": "DK9svKFx"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillItem' test.out

#- 216 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 't15oi3Wi' \
    --body '{"code": "vX3d8bx0", "language": "dY-550", "region": "Jz1hJNXA"}' \
    > test.out 2>&1
eval_tap $? 216 'RedeemCode' test.out

#- 217 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'njSQo9sq' \
    --body '{"origin": "Epic", "rewards": [{"currency": {"currencyCode": "wxbzAvwm", "namespace": "j27AMUFm"}, "item": {"itemId": "MQISRAcT", "itemSku": "4w8tTehB", "itemType": "poTVD7Ii"}, "quantity": 15, "type": "ITEM"}, {"currency": {"currencyCode": "kYhvlHhI", "namespace": "436qBjuh"}, "item": {"itemId": "1jJQz2U6", "itemSku": "wO6E2CAb", "itemType": "JXmFvtmk"}, "quantity": 91, "type": "CURRENCY"}, {"currency": {"currencyCode": "n6V3ho6w", "namespace": "4KxCbiEE"}, "item": {"itemId": "c2MXmtpm", "itemSku": "Vghy1CTi", "itemType": "C6Rq0tId"}, "quantity": 19, "type": "CURRENCY"}], "source": "PROMOTION"}' \
    > test.out 2>&1
eval_tap $? 217 'FulfillRewards' test.out

#- 218 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'DKNfXA2v' \
    --endTime 'Vy4olwMu' \
    --limit '1' \
    --offset '40' \
    --productId '2EB7fRC3' \
    --startTime 'kejSkQC1' \
    --status 'VERIFIED' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPOrders' test.out

#- 219 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'uth6fEXN' \
    > test.out 2>&1
eval_tap $? 219 'QueryAllUserIAPOrders' test.out

#- 220 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'FRzJGwXp' \
    --endTime 'Mc2rDCcy' \
    --limit '98' \
    --offset '45' \
    --startTime 'nfrcQ8bN' \
    --status 'FAIL' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserIAPConsumeHistory' test.out

#- 221 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'MOC9E2iR' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "EH-WLBy", "productId": "sep3e3VR", "region": "607864LK", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 221 'MockFulfillIAPItem' test.out

#- 222 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'bNc7WoDN' \
    --itemId 'WR2ahdCz' \
    --limit '100' \
    --offset '54' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserOrders' test.out

#- 223 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'hjytTRPx' \
    --body '{"currencyCode": "jUjn8ZoY", "currencyNamespace": "unY3huRN", "discountedPrice": 63, "ext": {"ryU47aGS": {}, "3IwIxWe6": {}, "1CMVscWS": {}}, "itemId": "fAP6tbxD", "language": "c2fOfLZ6", "options": {"skipPriceValidation": true}, "platform": "Steam", "price": 44, "quantity": 77, "region": "EAr87Mp8", "returnUrl": "w5T7JjN8", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateUserOrder' test.out

#- 224 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UpVTpvxg' \
    --itemId 'DVQAliV4' \
    > test.out 2>&1
eval_tap $? 224 'CountOfPurchasedItem' test.out

#- 225 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yJAhZDbJ' \
    --userId 'cTR6STLq' \
    > test.out 2>&1
eval_tap $? 225 'GetUserOrder' test.out

#- 226 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TfBZMi6X' \
    --userId 'xdP2cCmr' \
    --body '{"status": "CLOSED", "statusReason": "cZTQGfRR"}' \
    > test.out 2>&1
eval_tap $? 226 'UpdateUserOrderStatus' test.out

#- 227 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dD0CfAK2' \
    --userId 'Wnx1EUSX' \
    > test.out 2>&1
eval_tap $? 227 'FulfillUserOrder' test.out

#- 228 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Fc7WIpHx' \
    --userId '5SdPCcQ1' \
    > test.out 2>&1
eval_tap $? 228 'GetUserOrderGrant' test.out

#- 229 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dA0bJdQf' \
    --userId 'NtW9EoOw' \
    > test.out 2>&1
eval_tap $? 229 'GetUserOrderHistories' test.out

#- 230 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rNDHf2PO' \
    --userId 'do65BiPj' \
    --body '{"additionalData": {"cardSummary": "SO80SKWK"}, "authorisedTime": "1973-10-22T00:00:00Z", "chargebackReversedTime": "1987-02-28T00:00:00Z", "chargebackTime": "1978-04-17T00:00:00Z", "chargedTime": "1976-03-23T00:00:00Z", "createdTime": "1978-04-30T00:00:00Z", "currency": {"currencyCode": "TUozmUSs", "currencySymbol": "DwQRSuVA", "currencyType": "REAL", "decimals": 49, "namespace": "j2YrK3Ez"}, "customParameters": {"c9PFVaLH": {}, "V4LB6Gs2": {}, "9f2jesmD": {}}, "extOrderNo": "HH3UsVSK", "extTxId": "6xm9UInz", "extUserId": "d8i9KWEq", "issuedAt": "1998-01-17T00:00:00Z", "metadata": {"JAoyHgfi": "5ULFV6Hu", "YlMqQ5Z4": "5f5IV4Bi", "ydK1rvcE": "nraPILtJ"}, "namespace": "pek77sVJ", "nonceStr": "39EYJCrG", "paymentMethod": "42I2lytB", "paymentMethodFee": 11, "paymentOrderNo": "PkZJ0CQN", "paymentProvider": "WALLET", "paymentProviderFee": 18, "paymentStationUrl": "RcZHI6hs", "price": 36, "refundedTime": "1983-07-15T00:00:00Z", "salesTax": 99, "sandbox": true, "sku": "I1p3oogH", "status": "INIT", "statusReason": "V6EYxI0k", "subscriptionId": "Nsm1fhs3", "subtotalPrice": 21, "targetNamespace": "nrYNgnHS", "targetUserId": "MFPxSUnx", "tax": 74, "totalPrice": 57, "totalTax": 7, "txEndTime": "1997-04-17T00:00:00Z", "type": "ArLUH4WP", "userId": "au42PW99", "vat": 28}' \
    > test.out 2>&1
eval_tap $? 230 'ProcessUserOrderNotification' test.out

#- 231 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'uEY0cmGN' \
    --userId 'rqc0gFfP' \
    > test.out 2>&1
eval_tap $? 231 'DownloadUserOrderReceipt' test.out

#- 232 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'rQKl1SpU' \
    --body '{"currencyCode": "5uus8BZT", "currencyNamespace": "QFKOCh4l", "customParameters": {"ZWg3buLo": {}, "RmJtQ4ri": {}, "evKVKh6k": {}}, "description": "eesH7w2A", "extOrderNo": "3NcWekCL", "extUserId": "kUMz1i14", "itemType": "MEDIA", "language": "ND_rXMc", "metadata": {"mifMNl59": "9MjBcbjm", "pGzI4hB5": "pMlPxmWF", "w9CjrNAT": "bV6hnzCF"}, "notifyUrl": "CTpEtuka", "omitNotification": true, "platform": "Py5PGAfu", "price": 18, "recurringPaymentOrderNo": "f4lj1TPJ", "region": "a2MFr2uN", "returnUrl": "o5aMGsWj", "sandbox": false, "sku": "kRvMGdF1", "subscriptionId": "Kty3mDeJ", "title": "tt7nJLuZ"}' \
    > test.out 2>&1
eval_tap $? 232 'CreateUserPaymentOrder' test.out

#- 233 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9JgKIObs' \
    --userId '2CLBpHIa' \
    --body '{"description": "6qbXZTfJ"}' \
    > test.out 2>&1
eval_tap $? 233 'RefundUserPaymentOrder' test.out

#- 234 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'nGMlJOJM' \
    --body '{"code": "Bv7yymzi", "orderNo": "tJcsXCIr"}' \
    > test.out 2>&1
eval_tap $? 234 'ApplyUserRedemption' test.out

#- 235 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'eLQqrXPe' \
    --body '{"meta": {"5eW71Izc": {}, "cmxcGRnQ": {}, "De0rc9zL": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "Xbox", "currencyCode": "ZlHxwvXe", "namespace": "DDur699H"}, "entitlement": {"clazz": "ENTITLEMENT", "entitlementId": "f4bxtxXJ", "type": "DURABLE"}, "item": {"itemIdentity": "Z1eiqG3Y", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 50, "type": "ITEM"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "sxkI3Dpd", "namespace": "uz67R2en"}, "entitlement": {"clazz": "CODE", "entitlementId": "36TDnFCL", "type": "DURABLE"}, "item": {"itemIdentity": "tvn3tuGi", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 13, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Other", "currencyCode": "IqB8RZtB", "namespace": "1sDCqMAk"}, "entitlement": {"clazz": "MEDIA", "entitlementId": "ZBSaMAN0", "type": "CONSUMABLE"}, "item": {"itemIdentity": "ijpxLKuj", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 2, "type": "ENTITLEMENT"}], "source": "DLC", "transactionId": "y0C1YzlY"}' \
    > test.out 2>&1
eval_tap $? 235 'DoRevocation' test.out

#- 236 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'qXEB6YEo' \
    --chargeStatus 'NEVER' \
    --itemId 'O1fgLnZh' \
    --limit '53' \
    --offset '66' \
    --sku 'geDGMrXA' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 236 'QueryUserSubscriptions' test.out

#- 237 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'u6tLXPPc' \
    --excludeSystem  \
    --limit '13' \
    --offset '0' \
    --subscriptionId 'HehKJenz' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscriptionActivities' test.out

#- 238 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'GMFX3VzL' \
    --body '{"grantDays": 93, "itemId": "o3lERIOR", "language": "QKkv36uq", "reason": "WY4ABXem", "region": "bFN4HiVs", "source": "d8n84G9M"}' \
    > test.out 2>&1
eval_tap $? 238 'PlatformSubscribeSubscription' test.out

#- 239 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'V6gMOAcl' \
    --itemId '4PPtg2WR' \
    > test.out 2>&1
eval_tap $? 239 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 240 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Czt6vHrw' \
    --userId '5MMnomiY' \
    > test.out 2>&1
eval_tap $? 240 'GetUserSubscription' test.out

#- 241 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'oahvUvIh' \
    --userId 'JRYj2Pv8' \
    > test.out 2>&1
eval_tap $? 241 'DeleteUserSubscription' test.out

#- 242 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qZR7nYTr' \
    --userId '086sbZOH' \
    --force  \
    --body '{"immediate": true, "reason": "wJBeUc9i"}' \
    > test.out 2>&1
eval_tap $? 242 'CancelSubscription' test.out

#- 243 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5bCqEKea' \
    --userId '3wBcRzxY' \
    --body '{"grantDays": 17, "reason": "qRuI39gN"}' \
    > test.out 2>&1
eval_tap $? 243 'GrantDaysToSubscription' test.out

#- 244 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xnoHa6FW' \
    --userId 'xzwd2eNe' \
    --excludeFree  \
    --limit '2' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 244 'GetUserSubscriptionBillingHistories' test.out

#- 245 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'l6g6ZbrX' \
    --userId 'EQh0xl3Y' \
    --body '{"additionalData": {"cardSummary": "j0pJcoxI"}, "authorisedTime": "1983-04-25T00:00:00Z", "chargebackReversedTime": "1983-02-03T00:00:00Z", "chargebackTime": "1987-06-18T00:00:00Z", "chargedTime": "1985-09-29T00:00:00Z", "createdTime": "1989-07-13T00:00:00Z", "currency": {"currencyCode": "xcndbL0z", "currencySymbol": "wSgrdpfX", "currencyType": "VIRTUAL", "decimals": 61, "namespace": "FPDR6MCD"}, "customParameters": {"XSl93gUk": {}, "LyhEFs7U": {}, "5awQJPgi": {}}, "extOrderNo": "xkcE8ROV", "extTxId": "ftA3fn4M", "extUserId": "C6u21LnD", "issuedAt": "1973-08-30T00:00:00Z", "metadata": {"nNuji1rp": "Tbp06uEd", "0yaCGt0k": "ltfy3zWl", "hKGIKvnU": "0lvqDzSu"}, "namespace": "Rg41E2VN", "nonceStr": "CprUy0Rk", "paymentMethod": "LyMFxsw5", "paymentMethodFee": 14, "paymentOrderNo": "UKXHiNOV", "paymentProvider": "STRIPE", "paymentProviderFee": 43, "paymentStationUrl": "yUM4xCHY", "price": 96, "refundedTime": "1986-03-14T00:00:00Z", "salesTax": 87, "sandbox": false, "sku": "Jva8BBFY", "status": "REQUEST_FOR_INFORMATION", "statusReason": "wqs7dqqh", "subscriptionId": "cZfKsoNL", "subtotalPrice": 87, "targetNamespace": "Ex5jiIhr", "targetUserId": "Prtaa2c5", "tax": 50, "totalPrice": 17, "totalTax": 76, "txEndTime": "1972-01-23T00:00:00Z", "type": "3MlrqQBe", "userId": "1ldSP8eO", "vat": 1}' \
    > test.out 2>&1
eval_tap $? 245 'ProcessUserSubscriptionNotification' test.out

#- 246 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'zoEOrMg6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hYGFAhDP' \
    --body '{"count": 75, "orderNo": "bvoRxFbn"}' \
    > test.out 2>&1
eval_tap $? 246 'AcquireUserTicket' test.out

#- 247 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '7jX6mZ3Q' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserCurrencyWallets' test.out

#- 248 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'kt5pvoXo' \
    --namespace "$AB_NAMESPACE" \
    --userId '5qFDJsdM' \
    --body '{"allowOverdraft": true, "amount": 30, "balanceOrigin": "Playstation", "reason": "6L4Rt3iC"}' \
    > test.out 2>&1
eval_tap $? 248 'DebitUserWalletByCurrencyCode' test.out

#- 249 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Xas7eiCq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LXal0tfl' \
    --limit '6' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 249 'ListUserCurrencyTransactions' test.out

#- 250 CheckWallet
eval_tap 0 250 'CheckWallet # SKIP deprecated' test.out

#- 251 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'nKnk6cd5' \
    --namespace "$AB_NAMESPACE" \
    --userId '39bW4LQJ' \
    --body '{"amount": 3, "expireAt": "1977-08-23T00:00:00Z", "origin": "Playstation", "reason": "iF2jcRN0", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 251 'CreditUserWallet' test.out

#- 252 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'FKtBgtmg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Exu4sn9L' \
    --body '{"amount": 27, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 252 'PayWithUserWallet' test.out

#- 253 GetUserWallet
eval_tap 0 253 'GetUserWallet # SKIP deprecated' test.out

#- 254 DebitUserWallet
eval_tap 0 254 'DebitUserWallet # SKIP deprecated' test.out

#- 255 DisableUserWallet
eval_tap 0 255 'DisableUserWallet # SKIP deprecated' test.out

#- 256 EnableUserWallet
eval_tap 0 256 'EnableUserWallet # SKIP deprecated' test.out

#- 257 ListUserWalletTransactions
eval_tap 0 257 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 258 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Cr1bhVIV' \
    > test.out 2>&1
eval_tap $? 258 'ListViews' test.out

#- 259 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NVFqggAE' \
    --body '{"displayOrder": 53, "localizations": {"w6Ki3CFt": {"description": "tiLObK8y", "localExt": {"Q79fsWqI": {}, "CYocwJWs": {}, "y1nrFqPn": {}}, "longDescription": "f5VwPtEG", "title": "kySbpEOn"}, "wUf4Id96": {"description": "4on1uuKH", "localExt": {"QnxRUX8L": {}, "WIyiltAB": {}, "TUJLqe5f": {}}, "longDescription": "MYzKARKg", "title": "WBUxnsD5"}, "ScRSpC0U": {"description": "WKRYiBlb", "localExt": {"w6PpZxo8": {}, "eqCydpLB": {}, "y7TpxsED": {}}, "longDescription": "Wnb2zvlM", "title": "IvVaaHqw"}}, "name": "nPIRICKj"}' \
    > test.out 2>&1
eval_tap $? 259 'CreateView' test.out

#- 260 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Qvj5RkiR' \
    --storeId 'U9dC87AI' \
    > test.out 2>&1
eval_tap $? 260 'GetView' test.out

#- 261 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'fch7nKiI' \
    --storeId 'lhhSVJjU' \
    --body '{"displayOrder": 12, "localizations": {"p1Vq6H0O": {"description": "A9BgXpbl", "localExt": {"OATaatcg": {}, "UYyH0vuk": {}, "VatFeM0m": {}}, "longDescription": "mjoV9wQl", "title": "jcL7jGuF"}, "Ml14QBeJ": {"description": "ENTVmWLZ", "localExt": {"D27tvDOG": {}, "5Zb9awSm": {}, "xL5sIHtD": {}}, "longDescription": "C9THbybb", "title": "iuM8nr3A"}, "V3tfGqMz": {"description": "uNQkYK11", "localExt": {"RtTnrH6q": {}, "WCxS44iF": {}, "O3bOl1GS": {}}, "longDescription": "Krex3oDz", "title": "TXH0TYhL"}}, "name": "D6lLA9fy"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateView' test.out

#- 262 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '88sKFJ8Q' \
    --storeId 'HbJ5G4FM' \
    > test.out 2>&1
eval_tap $? 262 'DeleteView' test.out

#- 263 QueryWallets
eval_tap 0 263 'QueryWallets # SKIP deprecated' test.out

#- 264 GetWallet
eval_tap 0 264 'GetWallet # SKIP deprecated' test.out

#- 265 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'TxIrKOTs' \
    --end 'JuiOc9hN' \
    --start 'cU6BZBfL' \
    > test.out 2>&1
eval_tap $? 265 'SyncOrders' test.out

#- 266 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["2rkR3sOL", "cudV1pjr", "065M4Nt3"], "apiKey": "nTQ0ogWn", "authoriseAsCapture": false, "blockedPaymentMethods": ["R25dYEHB", "uTZnnt3f", "PiTV8FyI"], "clientKey": "BhRJAI7P", "dropInSettings": "EPxOGBlq", "liveEndpointUrlPrefix": "Jsx3yoqp", "merchantAccount": "3M2mrh5f", "notificationHmacKey": "Ajyjh1ik", "notificationPassword": "dypIKDWZ", "notificationUsername": "HI4Is5LV", "returnUrl": "cyyz6Fuj", "settings": "OhytzhUU"}' \
    > test.out 2>&1
eval_tap $? 266 'TestAdyenConfig' test.out

#- 267 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "UGNrDa1w", "privateKey": "YWbJvCpJ", "publicKey": "Grl3sSqK", "returnUrl": "PxwPzNmY"}' \
    > test.out 2>&1
eval_tap $? 267 'TestAliPayConfig' test.out

#- 268 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "dpBJde4S", "secretKey": "MM3js8Xi"}' \
    > test.out 2>&1
eval_tap $? 268 'TestCheckoutConfig' test.out

#- 269 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'PJXurkdF' \
    > test.out 2>&1
eval_tap $? 269 'DebugMatchedPaymentMerchantConfig' test.out

#- 270 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "aQHpenrV", "clientSecret": "tWyVSoTc", "returnUrl": "qTXiSC43", "webHookId": "IFTXgl0P"}' \
    > test.out 2>&1
eval_tap $? 270 'TestPayPalConfig' test.out

#- 271 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["zlpweedu", "odPQrK8h", "kOEyVhkv"], "publishableKey": "w8gN0NFK", "secretKey": "gfGF1wLu", "webhookSecret": "K9MpnaTG"}' \
    > test.out 2>&1
eval_tap $? 271 'TestStripeConfig' test.out

#- 272 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "Ar0Ugtby", "key": "IYWkSbYt", "mchid": "2roto5xH", "returnUrl": "jqo57nBl"}' \
    > test.out 2>&1
eval_tap $? 272 'TestWxPayConfig' test.out

#- 273 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "mlO3mTtt", "flowCompletionUrl": "qRdPevS0", "merchantId": 71, "projectId": 30, "projectSecretKey": "rM7nPGKO"}' \
    > test.out 2>&1
eval_tap $? 273 'TestXsollaConfig' test.out

#- 274 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id 'z2UOP23F' \
    > test.out 2>&1
eval_tap $? 274 'GetPaymentMerchantConfig' test.out

#- 275 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'MHEsQoEc' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["QOdR4wgS", "SsSskxoP", "g4GB7xqO"], "apiKey": "VkJT8ZpV", "authoriseAsCapture": true, "blockedPaymentMethods": ["vyyoT7E6", "dcgC4bqI", "IUEpnlQi"], "clientKey": "uj7KnVj4", "dropInSettings": "Y07SLku1", "liveEndpointUrlPrefix": "LDHDx3Xj", "merchantAccount": "VGWdx5nY", "notificationHmacKey": "m3i2nZO5", "notificationPassword": "8J9Aw2Ji", "notificationUsername": "TJ3r4QnU", "returnUrl": "PDVhXh1O", "settings": "dbBxTyBD"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateAdyenConfig' test.out

#- 276 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'KWEuj8EV' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestAdyenConfigById' test.out

#- 277 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'jW0SrBCy' \
    --sandbox  \
    --validate  \
    --body '{"appId": "WOuv9cvM", "privateKey": "TA8NDcc2", "publicKey": "9KtmKwin", "returnUrl": "uewom06W"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateAliPayConfig' test.out

#- 278 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'xfkBkxt2' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestAliPayConfigById' test.out

#- 279 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'l5CMgrjC' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "lMDhI8lI", "secretKey": "rpfwfxn4"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateCheckoutConfig' test.out

#- 280 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '4cdDkcuf' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestCheckoutConfigById' test.out

#- 281 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'O0ktXKXF' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "sG7AmUTy", "clientSecret": "PmWfPgzr", "returnUrl": "63vaF4IN", "webHookId": "DnoUSQCv"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdatePayPalConfig' test.out

#- 282 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '9vdlpsWo' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 282 'TestPayPalConfigById' test.out

#- 283 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '11S6TYTK' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["e8S77cMV", "WX4BUrJ0", "BVXCagJB"], "publishableKey": "oDNR5yxs", "secretKey": "5sk9j5rv", "webhookSecret": "vqymLcFs"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdateStripeConfig' test.out

#- 284 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'kqRdDd6y' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 284 'TestStripeConfigById' test.out

#- 285 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'K0W3hE1V' \
    --validate  \
    --body '{"appId": "nCT0fHg1", "key": "dYaVllkC", "mchid": "wF1pdpn3", "returnUrl": "qytEKKoh"}' \
    > test.out 2>&1
eval_tap $? 285 'UpdateWxPayConfig' test.out

#- 286 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'L0HrTv1C' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 286 'UpdateWxPayConfigCert' test.out

#- 287 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'QSle5pJl' \
    > test.out 2>&1
eval_tap $? 287 'TestWxPayConfigById' test.out

#- 288 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'IsnILo2l' \
    --validate  \
    --body '{"apiKey": "aiTI1vit", "flowCompletionUrl": "XVqmQyhM", "merchantId": 93, "projectId": 0, "projectSecretKey": "rFBzlnhD"}' \
    > test.out 2>&1
eval_tap $? 288 'UpdateXsollaConfig' test.out

#- 289 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'oVPCh8Le' \
    > test.out 2>&1
eval_tap $? 289 'TestXsollaConfigById' test.out

#- 290 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'tjxGD2B5' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "LARGE", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateXsollaUIConfig' test.out

#- 291 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '93' \
    --namespace "$AB_NAMESPACE" \
    --offset '19' \
    --region 'K8gvmjwW' \
    > test.out 2>&1
eval_tap $? 291 'QueryPaymentProviderConfig' test.out

#- 292 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "d1DCbyzJ", "region": "yfMlsPR1", "sandboxTaxJarApiToken": "DHvEw5KW", "specials": ["PAYPAL", "XSOLLA", "WALLET"], "taxJarApiToken": "oSb8KGO6", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 292 'CreatePaymentProviderConfig' test.out

#- 293 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 293 'GetAggregatePaymentProviders' test.out

#- 294 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'YUuhfHQ3' \
    > test.out 2>&1
eval_tap $? 294 'DebugMatchedPaymentProviderConfig' test.out

#- 295 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 295 'GetSpecialPaymentProviders' test.out

#- 296 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'XMUedfQW' \
    --body '{"aggregate": "XSOLLA", "namespace": "qIHaQgxi", "region": "ImyabUh4", "sandboxTaxJarApiToken": "bn0RLIii", "specials": ["WXPAY", "STRIPE", "CHECKOUT"], "taxJarApiToken": "Nmr6qVxR", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 296 'UpdatePaymentProviderConfig' test.out

#- 297 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '1AC7UHl4' \
    > test.out 2>&1
eval_tap $? 297 'DeletePaymentProviderConfig' test.out

#- 298 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 298 'GetPaymentTaxConfig' test.out

#- 299 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "u5ztWSlf", "taxJarApiToken": "sKImCdXL", "taxJarEnabled": false, "taxJarProductCodesMapping": {"wlfuzm1E": "Oo5TFc5u", "O43tl9TQ": "bRMZKXi7", "diSqJ37F": "u1XXuSle"}}' \
    > test.out 2>&1
eval_tap $? 299 'UpdatePaymentTaxConfig' test.out

#- 300 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'J5gWIOHW' \
    --end '0VVt3moX' \
    --start '0fhiFaKl' \
    > test.out 2>&1
eval_tap $? 300 'SyncPaymentOrders' test.out

#- 301 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '0ejC2LsL' \
    --storeId 'x1BdaUmA' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetRootCategories' test.out

#- 302 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Ktxlokd1' \
    --storeId 'EObkvp3t' \
    > test.out 2>&1
eval_tap $? 302 'DownloadCategories' test.out

#- 303 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'nQzSqoL0' \
    --namespace "$AB_NAMESPACE" \
    --language 'ssagcZSd' \
    --storeId 'P13msYZE' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetCategory' test.out

#- 304 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '4cp81ivy' \
    --namespace "$AB_NAMESPACE" \
    --language '3NRaRuYk' \
    --storeId 'UnFaq1ob' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetChildCategories' test.out

#- 305 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'gybvUoTJ' \
    --namespace "$AB_NAMESPACE" \
    --language 'N7WPE6A8' \
    --storeId 'tXeu1Fk4' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetDescendantCategories' test.out

#- 306 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 306 'PublicListCurrencies' test.out

#- 307 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'fyEWiM5o' \
    --region 'ooi1tqcd' \
    --storeId 'ddsaVNTQ' \
    --appId '6y3RZ1Cn' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetItemByAppId' test.out

#- 308 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --baseAppId 'AmY2JIEH' \
    --categoryPath 'nEKrGhgT' \
    --features 'SqaT9nV5' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --language 'Yr7kNT3t' \
    --limit '62' \
    --offset '90' \
    --region '8FJs219i' \
    --sortBy 'name,createdAt:desc,name:asc' \
    --storeId 'K1nSbGkh' \
    --tags 'pnuG105m' \
    > test.out 2>&1
eval_tap $? 308 'PublicQueryItems' test.out

#- 309 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'YaTyIuAX' \
    --region 'qmqrO8Ha' \
    --storeId 'xkjLqxgR' \
    --sku 'mvngmNe9' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetItemBySku' test.out

#- 310 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'xLoLaqde' \
    --region 'huK0OdO7' \
    --storeId '8D8UmGNx' \
    --itemIds 'r9MhEppX' \
    > test.out 2>&1
eval_tap $? 310 'PublicBulkGetItems' test.out

#- 311 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["JzaIwWRc", "rK9mxJcP", "pFQ97SfT"]}' \
    > test.out 2>&1
eval_tap $? 311 'PublicValidateItemPurchaseCondition' test.out

#- 312 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'EXTENSION' \
    --limit '83' \
    --offset '38' \
    --region '6eVSoEI2' \
    --storeId 'MV0Z89ox' \
    --keyword '211vp59Z' \
    --language 'eNjkUil3' \
    > test.out 2>&1
eval_tap $? 312 'PublicSearchItems' test.out

#- 313 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '9F0a9GYo' \
    --namespace "$AB_NAMESPACE" \
    --language '4xtcGpU8' \
    --region '9vpU78YZ' \
    --storeId 'GSZRy0lv' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetApp' test.out

#- 314 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '3EgUTfFH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'PublicGetItemDynamicData' test.out

#- 315 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '6dvDVttg' \
    --namespace "$AB_NAMESPACE" \
    --language 'UVDq3HC9' \
    --populateBundle  \
    --region 'swIGmd5p' \
    --storeId 'WESwO7b0' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetItem' test.out

#- 316 GetPaymentCustomization
eval_tap 0 316 'GetPaymentCustomization # SKIP deprecated' test.out

#- 317 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "UKbA3fLs", "paymentProvider": "WXPAY", "returnUrl": "uAbsDaiB", "ui": "4xMhqpvG", "zipCode": "uNP12aOk"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetPaymentUrl' test.out

#- 318 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'svWqb28B' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPaymentMethods' test.out

#- 319 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'GYngsylS' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUnpaidPaymentOrder' test.out

#- 320 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0DnqtTkJ' \
    --paymentProvider 'WALLET' \
    --zipCode '3z944VOL' \
    --body '{"token": "5A2hBWoH"}' \
    > test.out 2>&1
eval_tap $? 320 'Pay' test.out

#- 321 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MiXT9bXJ' \
    > test.out 2>&1
eval_tap $? 321 'PublicCheckPaymentOrderPaidStatus' test.out

#- 322 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'rbDUsX4r' \
    > test.out 2>&1
eval_tap $? 322 'GetPaymentPublicConfig' test.out

#- 323 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'vP03urt0' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetQRCode' test.out

#- 324 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'qeb3tm0j' \
    --foreinginvoice '6XlSfccQ' \
    --invoiceId '6PQN2A1d' \
    --payload 'wkSvHGI8' \
    --redirectResult 'MRXIkUw3' \
    --resultCode 'W39dJVsW' \
    --sessionId '5EMSEXI7' \
    --status 'TNzas9xz' \
    --token 'EWA1bM1W' \
    --type 'W5aENQuJ' \
    --userId 'NPL2GlYX' \
    --orderNo 'ECT4OFDl' \
    --paymentOrderNo 'iTUXWOAt' \
    --paymentProvider 'PAYPAL' \
    --returnUrl 'TUrVD1tZ' \
    > test.out 2>&1
eval_tap $? 324 'PublicNormalizePaymentReturnUrl' test.out

#- 325 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'Lw9BNHGC' \
    --paymentOrderNo '1EryEDkV' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 325 'GetPaymentTaxValue' test.out

#- 326 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'nBDun0iq' \
    > test.out 2>&1
eval_tap $? 326 'GetRewardByCode' test.out

#- 327 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'eH3UM0fg' \
    --limit '89' \
    --offset '90' \
    --sortBy 'namespace:asc,rewardCode:desc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 327 'QueryRewards1' test.out

#- 328 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '5fX2HbrC' \
    > test.out 2>&1
eval_tap $? 328 'GetReward1' test.out

#- 329 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 329 'PublicListStores' test.out

#- 330 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'WJIiNSVJ,KW2i8FMf,3ccW4Tn5' \
    --itemIds 'jxMREszq,EyAsP3DR,NVLb1e9t' \
    --skus 'TqkxT3wm,BAFTv3d2,teS8v9dA' \
    > test.out 2>&1
eval_tap $? 330 'PublicExistsAnyMyActiveEntitlement' test.out

#- 331 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'Br2CCSun' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 332 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId 'SOETbywg' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 333 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'blLfGRAg' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 334 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'HiLREkak,WlmNk6Al,JQJ4aNfz' \
    --itemIds 'yj0QaLNL,ctLO8mUV,XgSogD4v' \
    --skus 'noMsUNIM,0H2139DI,neWliZIy' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetEntitlementOwnershipToken' test.out

#- 335 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'tnCVffmF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'PublicGetMyWallet' test.out

#- 336 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'JUja04Ji' \
    --body '{"epicGamesJwtToken": "6kD2rbIT"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncEpicGameDLC' test.out

#- 337 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'yF2XMNOe' \
    --body '{"serviceLabel": 86}' \
    > test.out 2>&1
eval_tap $? 337 'PublicSyncPsnDlcInventory' test.out

#- 338 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZUMlYKuw' \
    --body '{"serviceLabels": [25, 91, 14]}' \
    > test.out 2>&1
eval_tap $? 338 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 339 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '5VdSiqma' \
    --body '{"appId": "1m1OXsOl", "steamId": "yI6t3wCu"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncSteamDLC' test.out

#- 340 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'RAhsGMTx' \
    --body '{"xstsToken": "RhocLWoW"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncXboxDLC' test.out

#- 341 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JxL7Plkj' \
    --appType 'GAME' \
    --entitlementClazz 'MEDIA' \
    --entitlementName '5E2uFuBS' \
    --features 'X0ffaKeK,lBjBUekV,AXVVwmAm' \
    --itemId 'oycHkOR7,lIiqQIfM,bZ7gKA5e' \
    --limit '65' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 341 'PublicQueryUserEntitlements' test.out

#- 342 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JDOcSyBL' \
    --appId 'NkKZtfJm' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserAppEntitlementByAppId' test.out

#- 343 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'FhRoWxlD' \
    --limit '45' \
    --offset '93' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 343 'PublicQueryUserEntitlementsByAppType' test.out

#- 344 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'f1IpxFIe' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'CU6HNbF1' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlementByItemId' test.out

#- 345 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyjsOheS' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'Uv9YuP5V' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserEntitlementBySku' test.out

#- 346 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'TqQy0w8m' \
    --appIds 'qq9NtRnO,s8WJFPKn,G8cfH1M7' \
    --itemIds 'wGqhWuns,0dkUzsnA,kZ6Ns67D' \
    --skus 'wGG8Yu9l,F32q74lK,LYA8dslQ' \
    > test.out 2>&1
eval_tap $? 346 'PublicExistsAnyUserActiveEntitlement' test.out

#- 347 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '9GQe0nlv' \
    --appId 'gBX48ICO' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 348 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'bel7r1Zw' \
    --entitlementClazz 'APP' \
    --itemId 'G1EABfCn' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 349 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'yzCMHdXV' \
    --ids 'VpIO6Hg1,Fhs7Fiks,IuPYYuj4' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 350 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWvdc3Jg' \
    --entitlementClazz 'CODE' \
    --sku 'zNoVReF9' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 351 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '28uOjo2s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qhrley33' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserEntitlement' test.out

#- 352 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'aloOwSvM' \
    --namespace "$AB_NAMESPACE" \
    --userId '8oOF2IbM' \
    --body '{"options": ["8cnjX9cH", "lS7MZdi1", "DwOocV3p"], "requestId": "SuZ5s4o5", "useCount": 73}' \
    > test.out 2>&1
eval_tap $? 352 'PublicConsumeUserEntitlement' test.out

#- 353 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'qJk6Rrkw' \
    --body '{"code": "xwWunuCY", "language": "DzY_713", "region": "Gn43tNOL"}' \
    > test.out 2>&1
eval_tap $? 353 'PublicRedeemCode' test.out

#- 354 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'xv3uFPAd' \
    --body '{"excludeOldTransactions": true, "language": "Bg", "productId": "aKERVZKj", "receiptData": "9JA2zOsP", "region": "wECPUukm", "transactionId": "1RkQzTsH"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicFulfillAppleIAPItem' test.out

#- 355 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ho8YnPqp' \
    --body '{"epicGamesJwtToken": "eoRbglSy"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncEpicGamesInventory' test.out

#- 356 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'a14gUzJM' \
    --body '{"autoAck": false, "language": "rp_rcsX", "orderId": "DKc5Rfzv", "packageName": "w7qzlJKM", "productId": "KXqURpTD", "purchaseTime": 27, "purchaseToken": "yicJXCDZ", "region": "xXx392be"}' \
    > test.out 2>&1
eval_tap $? 356 'PublicFulfillGoogleIAPItem' test.out

#- 357 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'KU1qqu4r' \
    --body '{"currencyCode": "ouZaPG6Y", "price": 0.4502232234305569, "productId": "yvVkCMHE", "serviceLabel": 39}' \
    > test.out 2>&1
eval_tap $? 357 'PublicReconcilePlayStationStore' test.out

#- 358 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'GzquPFFm' \
    --body '{"currencyCode": "k6UvvZqI", "price": 0.8269323536366376, "productId": "jcPzMacz", "serviceLabels": [10, 92]}' \
    > test.out 2>&1
eval_tap $? 358 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 359 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'PXhLuAgP' \
    --body '{"appId": "6ntXpcTn", "currencyCode": "Ytad6Tv3", "language": "nGtf_dn", "price": 0.6930940568552691, "productId": "7uF3WiNx", "region": "5MJfRpZJ", "steamId": "rM3jWDfr"}' \
    > test.out 2>&1
eval_tap $? 359 'SyncSteamInventory' test.out

#- 360 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rPBfdAMA' \
    --body '{"gameId": "6ZNcHfmy", "language": "AS_luOf", "region": "8RLFhsWj"}' \
    > test.out 2>&1
eval_tap $? 360 'SyncTwitchDropsEntitlement' test.out

#- 361 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'e5liooaw' \
    --body '{"currencyCode": "ZOQWgRQ2", "price": 0.2991683526497124, "productId": "k2KnjacS", "xstsToken": "TCm4OW6E"}' \
    > test.out 2>&1
eval_tap $? 361 'SyncXboxInventory' test.out

#- 362 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'jW1S0PyY' \
    --itemId 'd6eT48Tj' \
    --limit '35' \
    --offset '33' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 362 'PublicQueryUserOrders' test.out

#- 363 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'OnNfh6jQ' \
    --body '{"currencyCode": "Sq0NrvFa", "discountedPrice": 2, "ext": {"AEnFp7A5": {}, "3mOaTVnN": {}, "Y1zyuUOD": {}}, "itemId": "T8cmVrzF", "language": "rDxj", "price": 49, "quantity": 56, "region": "R9lbvHZd", "returnUrl": "XpTXUo96"}' \
    > test.out 2>&1
eval_tap $? 363 'PublicCreateUserOrder' test.out

#- 364 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YLUxq1dk' \
    --userId 'aHlldmZn' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetUserOrder' test.out

#- 365 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'B1MEmiTW' \
    --userId 'cbZnZwmF' \
    > test.out 2>&1
eval_tap $? 365 'PublicCancelUserOrder' test.out

#- 366 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PtxTy0y6' \
    --userId 'WIHGmmwc' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetUserOrderHistories' test.out

#- 367 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GPD40AOy' \
    --userId 'agoBVSnN' \
    > test.out 2>&1
eval_tap $? 367 'PublicDownloadUserOrderReceipt' test.out

#- 368 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'jX1iigvM' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetPaymentAccounts' test.out

#- 369 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'y7QW0MBn' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'Q8jbIshQ' \
    > test.out 2>&1
eval_tap $? 369 'PublicDeletePaymentAccount' test.out

#- 370 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'SXhqYBSt' \
    --language 'czOM4Zm4' \
    --region 'vnDNib8r' \
    --storeId 'HgkWY5CB' \
    --viewId 'shJ9qoo1' \
    > test.out 2>&1
eval_tap $? 370 'PublicListActiveSections' test.out

#- 371 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z7UqfZ9L' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'NirunPMf' \
    --limit '15' \
    --offset '63' \
    --sku '9rWzdMi3' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 371 'PublicQueryUserSubscriptions' test.out

#- 372 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'qkqUs1hI' \
    --body '{"currencyCode": "bP6r6Ehn", "itemId": "ZV5VfRte", "language": "Qy", "region": "Ky1Vy0An", "returnUrl": "EBsozEss", "source": "RodvcAQG"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicSubscribeSubscription' test.out

#- 373 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wemryb8v' \
    --itemId 'HsozduPb' \
    > test.out 2>&1
eval_tap $? 373 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 374 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9r49hRz0' \
    --userId 'aSzUX5yd' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserSubscription' test.out

#- 375 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nOhQlNJp' \
    --userId 'lqWBzkGF' \
    > test.out 2>&1
eval_tap $? 375 'PublicChangeSubscriptionBillingAccount' test.out

#- 376 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5TVgyglr' \
    --userId 'YvjFNKpv' \
    --body '{"immediate": false, "reason": "n26svYff"}' \
    > test.out 2>&1
eval_tap $? 376 'PublicCancelSubscription' test.out

#- 377 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OLcYdBRf' \
    --userId 'dHXhVh4R' \
    --excludeFree  \
    --limit '83' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetUserSubscriptionBillingHistories' test.out

#- 378 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'BqfZsd9m' \
    --language 'UYBRekXK' \
    --storeId 'tomIuOx5' \
    > test.out 2>&1
eval_tap $? 378 'PublicListViews' test.out

#- 379 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'qolVHc5N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BQbgauXa' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetWallet' test.out

#- 380 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode '2ytm9yxq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e5Cy4jAl' \
    --limit '38' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 380 'PublicListUserWalletTransactions' test.out

#- 381 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --availableDate '58vQBZRy' \
    --baseAppId 'W0tUdWbm' \
    --categoryPath 'qHqpzBxl' \
    --features 'BRti8AD9' \
    --includeSubCategoryItem  \
    --itemName 'iC3uvJZM' \
    --itemStatus 'ACTIVE' \
    --itemType 'INGAMEITEM' \
    --limit '25' \
    --offset '90' \
    --region 'G8I50m9d' \
    --sortBy 'updatedAt:asc,updatedAt,displayOrder' \
    --storeId 'ZCuZpxwP' \
    --tags 'zBcrrNS8' \
    --targetNamespace 'XRmCPctF' \
    > test.out 2>&1
eval_tap $? 381 'QueryItems1' test.out

#- 382 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AIaYHQVa' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 382 'ImportStore1' test.out

#- 383 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aDadnqiO' \
    --body '{"itemIds": ["1eldyCqj", "ojpumiee", "U4AHwPO7"]}' \
    > test.out 2>&1
eval_tap $? 383 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE