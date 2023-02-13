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
    --body '{"context": {"item": {"appId": "DKATqOHn", "appType": "DEMO", "baseAppId": "uH0Rljx1", "boothName": "P02ePEeZ", "boundItemIds": ["5lYpVnBz", "2Y1eLtgA", "fYRoTXBB"], "categoryPath": "t5JmpYXE", "clazz": "PFOmdSZX", "createdAt": "1983-11-03T00:00:00Z", "description": "yLJlECwV", "displayOrder": 56, "entitlementType": "CONSUMABLE", "ext": {"8Fhizjjz": {}, "hpursIfO": {}, "bNALbj9d": {}}, "features": ["viCXl8D8", "CwYm4OWM", "CEhQPVM7"], "fresh": true, "images": [{"as": "RUQOQMHl", "caption": "1PcsjALY", "height": 20, "imageUrl": "pwBA933n", "smallImageUrl": "keIhabN1", "width": 76}, {"as": "DRaOZKHd", "caption": "ZIvZKSMs", "height": 0, "imageUrl": "Jap1cPtp", "smallImageUrl": "8YxCG2XT", "width": 52}, {"as": "ayCnK42y", "caption": "WF3ygUN0", "height": 96, "imageUrl": "X4xbIR9V", "smallImageUrl": "H4FEE0Rc", "width": 59}], "itemId": "VH8UYnpA", "itemIds": ["xG4WdOos", "1nwftvDw", "Qo8mTPfR"], "itemQty": {"7S5LHrBC": 23, "22W4SICJ": 16, "gsiOfjJq": 10}, "itemType": "CODE", "language": "hnkNoYgv", "listable": true, "localExt": {"K02vfxwZ": {}, "6yMI0HUu": {}, "kQUFJOBC": {}}, "longDescription": "PgB4RmNn", "lootBoxConfig": {"rewardCount": 25, "rewards": [{"lootBoxItems": [{"count": 21, "itemId": "8hlRTTGn", "itemSku": "vJUth141", "itemType": "I15oJzyy"}, {"count": 42, "itemId": "mWtuY4J0", "itemSku": "tkc60csW", "itemType": "bMAdrG3n"}, {"count": 33, "itemId": "ypbvak5E", "itemSku": "9ooWkNMp", "itemType": "GgmAFmFn"}], "name": "DX2WH7kD", "odds": 0.6963643877915885, "type": "REWARD_GROUP", "weight": 55}, {"lootBoxItems": [{"count": 86, "itemId": "zDjWMgj4", "itemSku": "xCQnxzA5", "itemType": "VDxNYCei"}, {"count": 16, "itemId": "6Nt1y5ch", "itemSku": "eUTrvJS7", "itemType": "rSopk2nB"}, {"count": 100, "itemId": "5Nkg7Wm2", "itemSku": "y4vLJOtf", "itemType": "dT2ORTSx"}], "name": "6TSJ5Pon", "odds": 0.5526655834034804, "type": "REWARD", "weight": 57}, {"lootBoxItems": [{"count": 8, "itemId": "TIqCqSEC", "itemSku": "h6AO9RdU", "itemType": "QpcrCaR0"}, {"count": 87, "itemId": "LGIJoCEt", "itemSku": "yf0IEbCV", "itemType": "eSX31LKl"}, {"count": 51, "itemId": "IQgWjryV", "itemSku": "2ZRaA0g1", "itemType": "g7RBGtzg"}], "name": "xlcUm5ZP", "odds": 0.41526169123970247, "type": "PROBABILITY_GROUP", "weight": 56}], "rollFunction": "CUSTOM"}, "maxCount": 58, "maxCountPerUser": 92, "name": "58fcOyCA", "namespace": "tzwyO4jy", "optionBoxConfig": {"boxItems": [{"count": 43, "itemId": "giu4gnLf", "itemSku": "tY1jSnsj", "itemType": "mEZyJW7P"}, {"count": 13, "itemId": "noHYVhiu", "itemSku": "8U1IEjvg", "itemType": "KPbi3v1Q"}, {"count": 35, "itemId": "LAk3apiU", "itemSku": "EMOb4xvP", "itemType": "zKxjZ8iN"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 59, "comparison": "isGreaterThan", "name": "QE0dPHtW", "predicateType": "SeasonPassPredicate", "value": "ihpKyt8D", "values": ["L3fsjnVm", "cKTbsypT", "CMgqBNHT"]}, {"anyOf": 18, "comparison": "is", "name": "3S6p4jm5", "predicateType": "SeasonPassPredicate", "value": "JriGplfQ", "values": ["3RzoL7Q0", "AQtye1KJ", "mHJHRzuq"]}, {"anyOf": 30, "comparison": "isNot", "name": "xidLUON4", "predicateType": "SeasonTierPredicate", "value": "PdGZcGC0", "values": ["BCYK5LkQ", "jCOGtRCG", "z2CRQkuL"]}]}, {"operator": "and", "predicates": [{"anyOf": 84, "comparison": "isGreaterThan", "name": "qV2NxAk2", "predicateType": "SeasonTierPredicate", "value": "HT1gM4yW", "values": ["qBatkYJ8", "W82SD1us", "vyDB3VrC"]}, {"anyOf": 96, "comparison": "isGreaterThanOrEqual", "name": "b5frUMDK", "predicateType": "SeasonPassPredicate", "value": "qGGeo50Q", "values": ["KF7Ni0XO", "z71KUg96", "IhKmVfR6"]}, {"anyOf": 14, "comparison": "isGreaterThanOrEqual", "name": "Zzy6BxlW", "predicateType": "SeasonTierPredicate", "value": "hejMmrvK", "values": ["zSNYCH9n", "2It0qvBD", "qW55kBEf"]}]}, {"operator": "or", "predicates": [{"anyOf": 63, "comparison": "includes", "name": "J4J2GFd5", "predicateType": "SeasonPassPredicate", "value": "kXffPfCh", "values": ["o18AkSJS", "ucD8CkAh", "heebMpRS"]}, {"anyOf": 43, "comparison": "includes", "name": "BhMfTC5c", "predicateType": "EntitlementPredicate", "value": "12zdC5w7", "values": ["PJNdp32Y", "dSZivI2w", "NG1V7gA4"]}, {"anyOf": 32, "comparison": "isGreaterThan", "name": "HK0FaKQ6", "predicateType": "SeasonTierPredicate", "value": "ovFoHIn0", "values": ["CYmlXldg", "2DnMs0Js", "2MjVcPS7"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 65, "fixedTrialCycles": 56, "graceDays": 44}, "region": "nQx2kmXs", "regionData": [{"currencyCode": "9vTfXhYA", "currencyNamespace": "rq0qK4Pd", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1993-09-24T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1979-02-07T00:00:00Z", "discountedPrice": 63, "expireAt": "1981-10-23T00:00:00Z", "price": 82, "purchaseAt": "1982-02-03T00:00:00Z", "trialPrice": 64}, {"currencyCode": "r4al7TxU", "currencyNamespace": "cYWA8ogQ", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1986-08-17T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1992-10-16T00:00:00Z", "discountedPrice": 48, "expireAt": "1999-05-25T00:00:00Z", "price": 65, "purchaseAt": "1981-08-15T00:00:00Z", "trialPrice": 48}, {"currencyCode": "QMm2hkDU", "currencyNamespace": "L2xsUgQ6", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1987-04-20T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1972-10-25T00:00:00Z", "discountedPrice": 77, "expireAt": "1976-03-22T00:00:00Z", "price": 25, "purchaseAt": "1987-07-29T00:00:00Z", "trialPrice": 58}], "seasonType": "PASS", "sku": "8MwJSTUn", "stackable": true, "status": "ACTIVE", "tags": ["GswDhga3", "mGSjG0aD", "oVNOn3VA"], "targetCurrencyCode": "CKqYi5dv", "targetItemId": "xDByG5Ix", "targetNamespace": "zqUuTzQY", "thumbnailUrl": "Dn16Ozmj", "title": "3HgsQ45o", "updatedAt": "1981-08-13T00:00:00Z", "useCount": 34}, "namespace": "PsjuHsw3", "order": {"currency": {"currencyCode": "XyqZBMg3", "currencySymbol": "d5IWUS3s", "currencyType": "REAL", "decimals": 86, "namespace": "luzOobSe"}, "ext": {"aLJU9zJd": {}, "Yt839iPk": {}, "OHUyh24M": {}}, "free": true}, "source": "GIFT"}, "script": "yHsoB8P3", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'fsrBsYpu' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'quSMF7YM' \
    --body '{"grantDays": "5UulN7G0"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'I4qGJv5i' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'RvySyMvb' \
    --body '{"grantDays": "qsh0EAdE"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "xAiUsjOm", "dryRun": true, "fulfillmentUrl": "yuRM8eJl", "itemType": "SEASON", "purchaseConditionUrl": "Bc7Uy27O"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'nldptlzd' \
    --itemType 'OPTIONBOX' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'zxRbtsQZ' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'RA7tXB46' \
    --body '{"clazz": "eUS4Glwa", "dryRun": true, "fulfillmentUrl": "J6UaZWR1", "purchaseConditionUrl": "KM91qBFs"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'W7FAVoWF' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --name 'FXYk0Hgl' \
    --offset '57' \
    --tag 'b5I402to' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "EgaBbOY0", "items": [{"extraSubscriptionDays": 77, "itemId": "H3VAJCVu", "itemName": "VwNmKcBz", "quantity": 39}, {"extraSubscriptionDays": 78, "itemId": "l3iqStFH", "itemName": "yDvNxa40", "quantity": 52}, {"extraSubscriptionDays": 65, "itemId": "nlW5as1a", "itemName": "U9xCL1aV", "quantity": 46}], "maxRedeemCountPerCampaignPerUser": 97, "maxRedeemCountPerCode": 96, "maxRedeemCountPerCodePerUser": 57, "maxSaleCount": 30, "name": "9PX0dfvp", "redeemEnd": "1979-07-02T00:00:00Z", "redeemStart": "1997-08-13T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["9AC1gYXk", "eG7SG5Oo", "lJLBgzOl"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'SLrWWIm5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '4ECquiCD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "zy7fKVaG", "items": [{"extraSubscriptionDays": 87, "itemId": "mHXTBoWN", "itemName": "UGfrQRNr", "quantity": 87}, {"extraSubscriptionDays": 41, "itemId": "5SCa42sG", "itemName": "IyYFnwth", "quantity": 99}, {"extraSubscriptionDays": 43, "itemId": "lRIqXZV6", "itemName": "A7gOJqhJ", "quantity": 14}], "maxRedeemCountPerCampaignPerUser": 73, "maxRedeemCountPerCode": 53, "maxRedeemCountPerCodePerUser": 5, "maxSaleCount": 87, "name": "WCrgCOfr", "redeemEnd": "1999-08-07T00:00:00Z", "redeemStart": "1997-02-11T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["9h7Guj7z", "KKKISeXs", "aCUGbEpv"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'astHGPxm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xUEt64If' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'niHylPm5' \
    --body '{"categoryPath": "m1QVqUSx", "localizationDisplayNames": {"7yD8H0e8": "vIpPAScl", "1pWTF23k": "6z6MwgBe", "89fpxQxD": "jAgiEnE8"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Lb5Pinn5' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'lWHbvhxq' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'q4XmNSd4' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'CA1b56gE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vpkcAHuD' \
    --body '{"localizationDisplayNames": {"X0CKEwt1": "v6cFCMQe", "eFwHlLzv": "WMVv7ijH", "fPqlraFQ": "89wjXR2L"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'rsrHnUJ8' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8VN2141R' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath '2mO671Sl' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wGSFKn1J' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'S6Ezb6XM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'q95mIVSN' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'AAoZBM0J' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '26' \
    --code 'EpAXjUxS' \
    --limit '10' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'WS1UZLnI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 68}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId '2hGtcNIC' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '22' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '4AzoxYfP' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '47' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'hDmVl98R' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '89' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'MxbWztGt' \
    --namespace "$AB_NAMESPACE" \
    --code 'foXUsCgr' \
    --limit '67' \
    --offset '78' \
    --userId 'vbRHFh21' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'YZKXNrwC' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'ULDzWnw3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'f3gDDZte' \
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
    --body '{"grpcServerAddress": "ERxDTrPv"}' \
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
    --body '{"currencyCode": "C1h4sgwx", "currencySymbol": "8dYVeHZM", "currencyType": "REAL", "decimals": 55, "localizationDescriptions": {"5gtIFAqz": "BmIPi1FM", "5XDWGA7s": "EogpDYAj", "8HyVbBws": "bA5bVBlP"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'MFS0iOhn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"th3Josyc": "BiBfXCFb", "7wbby5ab": "hkuw56SG", "ulCFgt0P": "myqZj469"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'Jie8sccz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'XzXW90zq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'eikm2pb8' \
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
    --body '{"data": [{"id": "PGVLOTdo", "rewards": [{"currency": {"currencyCode": "dRxPXSRW", "namespace": "4eZrcoBD"}, "item": {"itemId": "ForYxRLi", "itemSku": "SOmVuofT", "itemType": "JmX7JUCY"}, "quantity": 52, "type": "ITEM"}, {"currency": {"currencyCode": "5RKw56HB", "namespace": "VpbjlidE"}, "item": {"itemId": "x5bUpmNT", "itemSku": "2pKRlGPg", "itemType": "DlZlaFiz"}, "quantity": 4, "type": "ITEM"}, {"currency": {"currencyCode": "lZsCIicV", "namespace": "8aSm0vol"}, "item": {"itemId": "6igooaMh", "itemSku": "5eaT7T1N", "itemType": "EuEuoMDy"}, "quantity": 41, "type": "ITEM"}]}, {"id": "umcNJKVL", "rewards": [{"currency": {"currencyCode": "2XbMtQ4L", "namespace": "Oa9q6wHJ"}, "item": {"itemId": "uzO9Daju", "itemSku": "NW8dudAF", "itemType": "ECw5QWda"}, "quantity": 20, "type": "CURRENCY"}, {"currency": {"currencyCode": "50x6GMTZ", "namespace": "yp7q4dKp"}, "item": {"itemId": "1juRqF4v", "itemSku": "B4klV6ob", "itemType": "2yJK7Ml0"}, "quantity": 73, "type": "CURRENCY"}, {"currency": {"currencyCode": "sr0GFv0s", "namespace": "vMonj5aE"}, "item": {"itemId": "Cjkr3res", "itemSku": "cL6453WY", "itemType": "nPC2AEgw"}, "quantity": 1, "type": "CURRENCY"}]}, {"id": "pMdU4AvT", "rewards": [{"currency": {"currencyCode": "KbBzkKYL", "namespace": "pkoFt0ql"}, "item": {"itemId": "XVDLmtWQ", "itemSku": "utql7Vdt", "itemType": "EBxcFp6J"}, "quantity": 9, "type": "CURRENCY"}, {"currency": {"currencyCode": "hJ3Zv8i8", "namespace": "wJizsAUz"}, "item": {"itemId": "Bw6ZeZ4r", "itemSku": "NRTEnIbh", "itemType": "mBcu6UGc"}, "quantity": 30, "type": "ITEM"}, {"currency": {"currencyCode": "9RWpCV5c", "namespace": "h9x2UoOZ"}, "item": {"itemId": "riHyFP0h", "itemSku": "EQ91cAo1", "itemType": "h428POxC"}, "quantity": 24, "type": "CURRENCY"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"WdeShJEv": "WOREfp04", "rdxLHZbo": "2G56Uimm", "RpRZUPcM": "z4oI6OPI"}}, {"platform": "XBOX", "platformDlcIdMap": {"2GFSRiUH": "X36ZfyYZ", "NEUAdnb0": "Bu32K9D3", "wVDYoJRR": "5rg3elE9"}}, {"platform": "PSN", "platformDlcIdMap": {"NXSLYnF2": "kwovHMl3", "hCEewWZ9": "GvuQhFWf", "yYZKMwrY": "gO1nY0tB"}}]}' \
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
    --appType 'DEMO' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'SqTCefzK' \
    --itemId 'rN6hJuUg,KuhmVUFi,C8CLJF7t' \
    --limit '36' \
    --offset '56' \
    --userId 'HD5rdepR' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'fLqGfwIL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '40' \
    --status 'FAIL' \
    --userId 'pJZyUFg4' \
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
    --body '{"bundleId": "NfnGwTNT", "password": "pBpzoye3"}' \
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
    --body '{"sandboxId": "0hSDY45v"}' \
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
    --body '{"applicationName": "PsLiYbT4", "serviceAccountId": "TH1vmPdp"}' \
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
    --body '{"data": [{"itemIdentity": "a66uKtm9", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"c25VyTs8": "KEgIjDhD", "lWnstAVw": "z7X4MfrX", "pW497PdV": "DgPA46P4"}}, {"itemIdentity": "kydOA7wk", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"zH4Q4thd": "4intL9a7", "d9eJam1R": "hZbcO5VF", "jhOCMXrO": "sLGShZnb"}}, {"itemIdentity": "UIa1KGNM", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"gFFtcSMf": "afDXjDkK", "6ci7035c": "B7gPD29u", "kqxcBkFE": "MfpaD5oD"}}]}' \
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
    --body '{"environment": "U9aAVsBZ"}' \
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
    --body '{"appId": "GYb5WbNa", "publisherAuthenticationKey": "rRrIrGWm"}' \
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
    --body '{"clientId": "d3qRZvM0", "clientSecret": "i3O4KgC0", "organizationId": "ExMcgQ6l"}' \
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
    --body '{"relyingPartyCert": "2IUDcid1"}' \
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
    --password 'SeV0K3LY' \
    > test.out 2>&1
eval_tap $? 79 'UpdateXblBPCertFile' test.out

#- 80 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'nzqgGcBg' \
    --itemId 'iCpCPHCb' \
    --itemType 'OPTIONBOX' \
    --endTime 'BX2RAwUZ' \
    --startTime 'Ipuhw3O2' \
    > test.out 2>&1
eval_tap $? 80 'DownloadInvoiceDetails' test.out

#- 81 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'EXutVIj3' \
    --itemId 'SQtllGVr' \
    --itemType 'INGAMEITEM' \
    --endTime 'GpAzuczi' \
    --startTime 'U2cdRBOJ' \
    > test.out 2>&1
eval_tap $? 81 'GenerateInvoiceSummary' test.out

#- 82 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VE8CEpyQ' \
    --body '{"categoryPath": "HhFa4nJ9", "targetItemId": "7FNN2ZTc", "targetNamespace": "559WXml5"}' \
    > test.out 2>&1
eval_tap $? 82 'SyncInGameItem' test.out

#- 83 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tfDSWzOA' \
    --body '{"appId": "138LX0l6", "appType": "GAME", "baseAppId": "mOtWakSR", "boothName": "7okp308J", "categoryPath": "Ckp8aOxa", "clazz": "k2XOWwP5", "displayOrder": 54, "entitlementType": "CONSUMABLE", "ext": {"29sHV6XO": {}, "ViQvzhvs": {}, "56NsSla7": {}}, "features": ["3TzlQSzD", "qhZO4Vkv", "5zotuirO"], "images": [{"as": "VdJ6qcke", "caption": "H04TeUaR", "height": 40, "imageUrl": "mWuudhga", "smallImageUrl": "XQVVnVDe", "width": 17}, {"as": "kcUjPEOZ", "caption": "yx5kIcO7", "height": 7, "imageUrl": "MmhlHcKm", "smallImageUrl": "qrq93iw8", "width": 89}, {"as": "xtH7cnaW", "caption": "quXNgXov", "height": 36, "imageUrl": "lsdY5Zfv", "smallImageUrl": "Nu7g8YN1", "width": 46}], "itemIds": ["GaGztb1q", "CtJ7SanL", "wyzLnbAY"], "itemQty": {"3x3BKWyp": 42, "H2tRn1e0": 63, "bVkpWVnd": 13}, "itemType": "COINS", "listable": false, "localizations": {"x0k0dQ7o": {"description": "XCw1rcnq", "localExt": {"D6fvaymX": {}, "QcUqjwJk": {}, "3TEt64jR": {}}, "longDescription": "wWg9BZO3", "title": "8gccvPZp"}, "qY9E15x2": {"description": "bGFwKcOg", "localExt": {"Aj0lbyot": {}, "QeRl7e69": {}, "gxgGaPJA": {}}, "longDescription": "2Ar4T4pK", "title": "FKROyPQb"}, "8sn1b7X2": {"description": "MlrFVMMy", "localExt": {"OMHZv9Ow": {}, "07zGadEl": {}, "0pl1VOuL": {}}, "longDescription": "vMHPKSXN", "title": "IPu8VW6f"}}, "lootBoxConfig": {"rewardCount": 1, "rewards": [{"lootBoxItems": [{"count": 85, "itemId": "h4TYotad", "itemSku": "Df9ZUiLM", "itemType": "XBHvVPAZ"}, {"count": 59, "itemId": "H3Lp4ac8", "itemSku": "3xQer36m", "itemType": "n5JYrXvL"}, {"count": 12, "itemId": "HlrRBmDR", "itemSku": "fJCxkbpl", "itemType": "aQG85RMv"}], "name": "0tV92W33", "odds": 0.14751784169016258, "type": "REWARD", "weight": 96}, {"lootBoxItems": [{"count": 40, "itemId": "ZqviEQvb", "itemSku": "a8hyrDZN", "itemType": "0Hw3fh61"}, {"count": 21, "itemId": "kB5MpfMb", "itemSku": "Bh6kuM04", "itemType": "b4r9aa62"}, {"count": 97, "itemId": "Hacpunpq", "itemSku": "4f3sEsGD", "itemType": "xa9nt3aN"}], "name": "dr0ES2Tu", "odds": 0.2731734232739189, "type": "REWARD_GROUP", "weight": 44}, {"lootBoxItems": [{"count": 89, "itemId": "5o9tZQ0p", "itemSku": "1kIU5ZNg", "itemType": "CGJXLdex"}, {"count": 56, "itemId": "WpPe01Sx", "itemSku": "ItFVCysX", "itemType": "ANEiheCP"}, {"count": 15, "itemId": "rzbtv3i4", "itemSku": "BlnMb2Sz", "itemType": "PDFGR57l"}], "name": "hHT1gCQy", "odds": 0.7825916009600091, "type": "PROBABILITY_GROUP", "weight": 95}], "rollFunction": "CUSTOM"}, "maxCount": 96, "maxCountPerUser": 6, "name": "MjujWq7p", "optionBoxConfig": {"boxItems": [{"count": 54, "itemId": "2YrTibZ6", "itemSku": "3JdCtDGt", "itemType": "qLbG9tZx"}, {"count": 41, "itemId": "xNbBWsjw", "itemSku": "wHv1o8jS", "itemType": "bm3vO0aL"}, {"count": 87, "itemId": "C9Gi07ZL", "itemSku": "LegOV0XL", "itemType": "swTQTcj0"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 83, "fixedTrialCycles": 1, "graceDays": 57}, "regionData": {"aNbEI6rh": [{"currencyCode": "7efTh2FW", "currencyNamespace": "B6AbbCg8", "currencyType": "VIRTUAL", "discountAmount": 68, "discountExpireAt": "1990-08-08T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1988-10-20T00:00:00Z", "discountedPrice": 81, "expireAt": "1976-11-17T00:00:00Z", "price": 58, "purchaseAt": "1989-04-21T00:00:00Z", "trialPrice": 44}, {"currencyCode": "R2cNeuGs", "currencyNamespace": "fwPX9Fsc", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1977-12-05T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1996-09-14T00:00:00Z", "discountedPrice": 70, "expireAt": "1999-10-30T00:00:00Z", "price": 92, "purchaseAt": "1997-06-28T00:00:00Z", "trialPrice": 97}, {"currencyCode": "oGPSkr1m", "currencyNamespace": "KI05WPH8", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1984-09-30T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1986-04-14T00:00:00Z", "discountedPrice": 26, "expireAt": "1976-08-16T00:00:00Z", "price": 19, "purchaseAt": "1986-06-03T00:00:00Z", "trialPrice": 19}], "k80MHVCJ": [{"currencyCode": "5ptby2PK", "currencyNamespace": "hvclc7lI", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1971-06-16T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1977-08-06T00:00:00Z", "discountedPrice": 36, "expireAt": "1978-01-01T00:00:00Z", "price": 0, "purchaseAt": "1971-07-08T00:00:00Z", "trialPrice": 63}, {"currencyCode": "zkQSkEQ5", "currencyNamespace": "dKEj1a76", "currencyType": "REAL", "discountAmount": 45, "discountExpireAt": "1991-09-23T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1990-05-06T00:00:00Z", "discountedPrice": 48, "expireAt": "1974-01-03T00:00:00Z", "price": 96, "purchaseAt": "1977-07-11T00:00:00Z", "trialPrice": 97}, {"currencyCode": "hvONjMDp", "currencyNamespace": "pgh3mg9T", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1989-11-24T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1972-02-07T00:00:00Z", "discountedPrice": 32, "expireAt": "1987-06-02T00:00:00Z", "price": 40, "purchaseAt": "1990-04-16T00:00:00Z", "trialPrice": 3}], "SLUx0mSe": [{"currencyCode": "DNVxgLFm", "currencyNamespace": "WyokRLdY", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1994-12-13T00:00:00Z", "discountPercentage": 75, "discountPurchaseAt": "1993-03-22T00:00:00Z", "discountedPrice": 79, "expireAt": "1985-03-14T00:00:00Z", "price": 95, "purchaseAt": "1979-01-27T00:00:00Z", "trialPrice": 42}, {"currencyCode": "36iaNwge", "currencyNamespace": "loRknSfQ", "currencyType": "REAL", "discountAmount": 99, "discountExpireAt": "1989-09-25T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1975-10-18T00:00:00Z", "discountedPrice": 83, "expireAt": "1976-08-24T00:00:00Z", "price": 31, "purchaseAt": "1983-01-11T00:00:00Z", "trialPrice": 94}, {"currencyCode": "j87BlnCx", "currencyNamespace": "2mZziZqn", "currencyType": "REAL", "discountAmount": 71, "discountExpireAt": "1973-10-05T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1982-05-13T00:00:00Z", "discountedPrice": 36, "expireAt": "1991-02-20T00:00:00Z", "price": 65, "purchaseAt": "1999-02-02T00:00:00Z", "trialPrice": 45}]}, "seasonType": "PASS", "sku": "CtkUuU6S", "stackable": true, "status": "INACTIVE", "tags": ["pqYui5Xt", "OXOEnpCG", "hqNpVRod"], "targetCurrencyCode": "nT2Si7aV", "targetNamespace": "eMtxEkU6", "thumbnailUrl": "fA29wqMf", "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 83 'CreateItem' test.out

#- 84 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '7Q8qjzO6' \
    --appId 'b66kNER4' \
    > test.out 2>&1
eval_tap $? 84 'GetItemByAppId' test.out

#- 85 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'UHJpXQci' \
    --baseAppId 'XeZpaw7p' \
    --categoryPath 'JclJQJbl' \
    --features 'hkZ7eVzg' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --limit '28' \
    --offset '49' \
    --region 'BaIWawMu' \
    --sortBy 'updatedAt:desc,displayOrder:asc,name:desc' \
    --storeId '12NcMUj1' \
    --tags 'PcSQC6FM' \
    --targetNamespace 'Rq7LuVB8' \
    > test.out 2>&1
eval_tap $? 85 'QueryItems' test.out

#- 86 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'L62s14Wp,PzttcUVb,DPICgUzE' \
    > test.out 2>&1
eval_tap $? 86 'ListBasicItemsByFeatures' test.out

#- 87 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'sMMxEimv' \
    --sku '9EzORZj7' \
    > test.out 2>&1
eval_tap $? 87 'GetItemBySku' test.out

#- 88 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'ZE0CYFYs' \
    --populateBundle  \
    --region 'IaZk4etU' \
    --storeId 'j6o53cQg' \
    --sku 'R8Jbs6BL' \
    > test.out 2>&1
eval_tap $? 88 'GetLocaleItemBySku' test.out

#- 89 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'bcUrEaiU' \
    --sku 'iaBEnynK' \
    > test.out 2>&1
eval_tap $? 89 'GetItemIdBySku' test.out

#- 90 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'P19Al9J6,yL6heV6P,blEThwml' \
    --storeId 'c4Wl51lM' \
    > test.out 2>&1
eval_tap $? 90 'GetBulkItemIdBySkus' test.out

#- 91 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '97nCu88H' \
    --region '3JSF9M2j' \
    --storeId 'xc1YJ2Jo' \
    --itemIds 'gXopQ7ey' \
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
    --userId 'wvikOrrh' \
    --body '{"itemIds": ["asZaIP2f", "60q39b83", "yCtsuQEq"]}' \
    > test.out 2>&1
eval_tap $? 93 'ValidateItemPurchaseCondition' test.out

#- 94 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SUBSCRIPTION' \
    --limit '26' \
    --offset '64' \
    --sortBy 'dOkhG7Qv' \
    --storeId 'hmvBVZpi' \
    --keyword 'qVG45KzE' \
    --language 'JFfueBHg' \
    > test.out 2>&1
eval_tap $? 94 'SearchItems' test.out

#- 95 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '5' \
    --offset '65' \
    --sortBy 'name:asc,name:desc' \
    --storeId '7l6EUcuM' \
    > test.out 2>&1
eval_tap $? 95 'QueryUncategorizedItems' test.out

#- 96 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '8Vg51JTa' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'PlkP2DIp' \
    > test.out 2>&1
eval_tap $? 96 'GetItem' test.out

#- 97 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId '8hVP9jg8' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3bEfOGM6' \
    --body '{"appId": "ssaWlcxz", "appType": "DEMO", "baseAppId": "vaNIFRpF", "boothName": "pBVcM89Z", "categoryPath": "B31Bsg0I", "clazz": "URNBUFfs", "displayOrder": 35, "entitlementType": "CONSUMABLE", "ext": {"BUrnoqe5": {}, "trblVSIp": {}, "AeKJeZzq": {}}, "features": ["BwuUZkiq", "DTYNg4f5", "MbjnLNT3"], "images": [{"as": "F1oTtEtG", "caption": "bI2osWjr", "height": 29, "imageUrl": "xmwzYD78", "smallImageUrl": "VBZnAAeg", "width": 26}, {"as": "poikKsdk", "caption": "l6Gw653p", "height": 40, "imageUrl": "ctz08uBL", "smallImageUrl": "cZORNcgC", "width": 93}, {"as": "DntQb9QJ", "caption": "O6tkRLll", "height": 48, "imageUrl": "oA6p9Gft", "smallImageUrl": "2AQnQmnj", "width": 80}], "itemIds": ["1do1VI1Q", "lq09SnU4", "MGDXQ29N"], "itemQty": {"qZdoSxHq": 40, "BnkOA03p": 83, "AznbCnOj": 58}, "itemType": "MEDIA", "listable": true, "localizations": {"zvB5sjpd": {"description": "DelXGJu2", "localExt": {"7Cm4IkY8": {}, "Kes7Dvej": {}, "Sciiov9U": {}}, "longDescription": "XYqf1g6P", "title": "sExBrm77"}, "5ETPTAOz": {"description": "ib80yUsl", "localExt": {"Xl6sUbX7": {}, "kXdwpz6u": {}, "QAW4EKtv": {}}, "longDescription": "twa9RdtL", "title": "c3mARBEf"}, "wiyfjKHK": {"description": "DUmZAmNc", "localExt": {"9A49YWyL": {}, "uQj0XBoe": {}, "DCoGSfSz": {}}, "longDescription": "4uxrANbP", "title": "T7XU0Flo"}}, "lootBoxConfig": {"rewardCount": 45, "rewards": [{"lootBoxItems": [{"count": 26, "itemId": "XQqhro4u", "itemSku": "0L2w6HdV", "itemType": "JMO05opH"}, {"count": 53, "itemId": "PUOXXuJ0", "itemSku": "s0J2fE79", "itemType": "dkvRBtKy"}, {"count": 57, "itemId": "p9t2lopS", "itemSku": "MlnGcw67", "itemType": "m0YKDUk6"}], "name": "2swfgSv5", "odds": 0.4317027493176041, "type": "PROBABILITY_GROUP", "weight": 85}, {"lootBoxItems": [{"count": 30, "itemId": "JNVt9Y00", "itemSku": "BWllwL2W", "itemType": "ddMVvw9f"}, {"count": 46, "itemId": "IaJecnnb", "itemSku": "qIV60Kko", "itemType": "hJSWlIKe"}, {"count": 60, "itemId": "fkwco5LV", "itemSku": "GXuygMjf", "itemType": "l0fYrqw7"}], "name": "evPxxRnn", "odds": 0.3382303654200115, "type": "REWARD_GROUP", "weight": 21}, {"lootBoxItems": [{"count": 54, "itemId": "psmX3xbE", "itemSku": "vV3bzOWg", "itemType": "FTKJjl7W"}, {"count": 46, "itemId": "OW3qFP9t", "itemSku": "s9NvQLEB", "itemType": "s5Y18j2V"}, {"count": 32, "itemId": "vGZkbLIl", "itemSku": "0z33G7ay", "itemType": "OtUCXRmM"}], "name": "I4H2TZ8x", "odds": 0.02693728702607967, "type": "PROBABILITY_GROUP", "weight": 5}], "rollFunction": "CUSTOM"}, "maxCount": 66, "maxCountPerUser": 81, "name": "ma76tcjp", "optionBoxConfig": {"boxItems": [{"count": 100, "itemId": "IUMhVb98", "itemSku": "qG2ysDJL", "itemType": "NpeaU1ZL"}, {"count": 40, "itemId": "y4m9DXg2", "itemSku": "u0LIoX0Q", "itemType": "dNIMV5au"}, {"count": 71, "itemId": "v7LwCvWf", "itemSku": "dWFfbH0y", "itemType": "Huyh0sLZ"}]}, "purchasable": true, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 11, "fixedTrialCycles": 4, "graceDays": 0}, "regionData": {"keOxcV38": [{"currencyCode": "d4SnwPPK", "currencyNamespace": "AyxMBH4F", "currencyType": "VIRTUAL", "discountAmount": 79, "discountExpireAt": "1997-02-17T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1998-02-20T00:00:00Z", "discountedPrice": 35, "expireAt": "1999-05-12T00:00:00Z", "price": 100, "purchaseAt": "1981-08-29T00:00:00Z", "trialPrice": 65}, {"currencyCode": "guRnYJiQ", "currencyNamespace": "TEZZNLc2", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1976-10-04T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1972-10-15T00:00:00Z", "discountedPrice": 27, "expireAt": "1986-03-26T00:00:00Z", "price": 49, "purchaseAt": "1980-12-19T00:00:00Z", "trialPrice": 63}, {"currencyCode": "4L28gwGE", "currencyNamespace": "464vUp1l", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1983-03-16T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1980-04-13T00:00:00Z", "discountedPrice": 28, "expireAt": "1998-05-12T00:00:00Z", "price": 94, "purchaseAt": "1992-09-02T00:00:00Z", "trialPrice": 80}], "YXd4p89D": [{"currencyCode": "LuMyMPo2", "currencyNamespace": "3CtHhZFg", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1973-02-21T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1989-10-09T00:00:00Z", "discountedPrice": 70, "expireAt": "1975-02-02T00:00:00Z", "price": 52, "purchaseAt": "1978-01-16T00:00:00Z", "trialPrice": 35}, {"currencyCode": "VAvgBJaB", "currencyNamespace": "vxbXQa5s", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1984-10-07T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1979-03-09T00:00:00Z", "discountedPrice": 32, "expireAt": "1973-03-03T00:00:00Z", "price": 24, "purchaseAt": "1990-09-22T00:00:00Z", "trialPrice": 100}, {"currencyCode": "fEgcSvVB", "currencyNamespace": "7dQFuSJF", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1998-06-21T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1988-01-19T00:00:00Z", "discountedPrice": 84, "expireAt": "1973-01-04T00:00:00Z", "price": 92, "purchaseAt": "1996-02-03T00:00:00Z", "trialPrice": 55}], "FY49EC37": [{"currencyCode": "c21T2FeT", "currencyNamespace": "Z0u1m1LR", "currencyType": "VIRTUAL", "discountAmount": 71, "discountExpireAt": "1976-11-14T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1974-10-14T00:00:00Z", "discountedPrice": 24, "expireAt": "1992-07-10T00:00:00Z", "price": 19, "purchaseAt": "1983-01-09T00:00:00Z", "trialPrice": 74}, {"currencyCode": "PrA0106w", "currencyNamespace": "YnbyBCk7", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1982-01-25T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1998-05-26T00:00:00Z", "discountedPrice": 49, "expireAt": "1994-01-22T00:00:00Z", "price": 4, "purchaseAt": "1975-05-27T00:00:00Z", "trialPrice": 100}, {"currencyCode": "jOXNz7QE", "currencyNamespace": "4CCpM5rr", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1980-01-02T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1978-08-03T00:00:00Z", "discountedPrice": 69, "expireAt": "1975-08-28T00:00:00Z", "price": 14, "purchaseAt": "1986-09-09T00:00:00Z", "trialPrice": 89}]}, "seasonType": "TIER", "sku": "TWPUhVib", "stackable": true, "status": "INACTIVE", "tags": ["3goCUPjh", "1SzTW4G9", "vpqFfaqG"], "targetCurrencyCode": "RZ1EZibe", "targetNamespace": "Vb8NqPcf", "thumbnailUrl": "5jU3Hx9m", "useCount": 68}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateItem' test.out

#- 98 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'hGib8Dg4' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'bkWLTB1y' \
    > test.out 2>&1
eval_tap $? 98 'DeleteItem' test.out

#- 99 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '4gFMTSnf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 99, "orderNo": "Tzfn3jLL"}' \
    > test.out 2>&1
eval_tap $? 99 'AcquireItem' test.out

#- 100 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'LUYATCOB' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '4vn9Ash9' \
    > test.out 2>&1
eval_tap $? 100 'GetApp' test.out

#- 101 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'znX3JCtp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RdEC1nHd' \
    --body '{"carousel": [{"alt": "LZ4Lnm02", "previewUrl": "SS5FRv01", "thumbnailUrl": "cwZEi2cx", "type": "image", "url": "4ukZ23ud", "videoSource": "youtube"}, {"alt": "8GMARwDp", "previewUrl": "ObVUAihY", "thumbnailUrl": "0UiPvyqV", "type": "video", "url": "A52U0nKu", "videoSource": "vimeo"}, {"alt": "yWzS4UIF", "previewUrl": "IZzhW212", "thumbnailUrl": "eHIxuMUl", "type": "video", "url": "kTHJbvdr", "videoSource": "vimeo"}], "developer": "KJKOwbcP", "forumUrl": "8y6gn36h", "genres": ["Racing", "FreeToPlay", "Simulation"], "localizations": {"aSlwzmxx": {"announcement": "XQ8miWF2", "slogan": "1QzDZH2S"}, "2sZOyCQC": {"announcement": "tx4lGois", "slogan": "RjTB6vjm"}, "kc6uiNl7": {"announcement": "rOZIoncM", "slogan": "LFigJIWy"}}, "platformRequirements": {"EW6z4IS4": [{"additionals": "C8ed3yEr", "directXVersion": "iFl1Z0GL", "diskSpace": "29sfu2CT", "graphics": "pRVTYb2i", "label": "u7esAhEy", "osVersion": "lt7aeSuz", "processor": "MnPZQmZV", "ram": "zeWBkCLc", "soundCard": "iY8EQjCo"}, {"additionals": "zlDc8SYz", "directXVersion": "FbV1ox6c", "diskSpace": "fVqPLbgZ", "graphics": "mgwicVX9", "label": "NlmR4tqh", "osVersion": "mMD5JNSP", "processor": "B688X4A2", "ram": "pKglPLHO", "soundCard": "93senjs3"}, {"additionals": "3MO7QB2C", "directXVersion": "4NkLMNYU", "diskSpace": "aYEGkaXY", "graphics": "jhIbU5GW", "label": "XUftNLsJ", "osVersion": "IoBeQIsy", "processor": "34MUhdpD", "ram": "Psxt5up1", "soundCard": "8PxhgYH7"}], "1PWh62Ye": [{"additionals": "YAsPNJfP", "directXVersion": "QwPBUyLR", "diskSpace": "asaFG2TN", "graphics": "HwLKI0Fd", "label": "TaVJXdmC", "osVersion": "Apvo104l", "processor": "PCZ07wJC", "ram": "TkjqRSys", "soundCard": "aynzudPZ"}, {"additionals": "0CQ6KPqV", "directXVersion": "ABSeLXE4", "diskSpace": "F3LQkaHs", "graphics": "es17ntOh", "label": "hUUvVrab", "osVersion": "s3Asx5Av", "processor": "lMOSah67", "ram": "f5178QI1", "soundCard": "e0im7pDy"}, {"additionals": "32W0blWy", "directXVersion": "ibEDqEdZ", "diskSpace": "aaoUDVga", "graphics": "zxnb5nRg", "label": "B32f2yBB", "osVersion": "WmMuqmDP", "processor": "dGsJeN3z", "ram": "mU5TA50G", "soundCard": "eZoblWWZ"}], "lMfe5A6E": [{"additionals": "FdfYSbzF", "directXVersion": "W8g9p1hU", "diskSpace": "4bdgvAoc", "graphics": "y5iS1vFW", "label": "iyDhXWaH", "osVersion": "AP6uEBUf", "processor": "rm0JJbBl", "ram": "fhe8pinN", "soundCard": "nweSba6T"}, {"additionals": "L95ryoAV", "directXVersion": "9k8N6Qhf", "diskSpace": "CmtRuTAQ", "graphics": "usbBolrn", "label": "jJgfftKU", "osVersion": "iRFoNgbM", "processor": "J1DYNRgv", "ram": "zDOL821O", "soundCard": "Uls8F3YW"}, {"additionals": "z4eQDIei", "directXVersion": "y8gZ76pG", "diskSpace": "e5KT4Io1", "graphics": "bfjiWDSV", "label": "rwlt1fgr", "osVersion": "d9cpoylK", "processor": "wN20qoDT", "ram": "wg2BD8Qy", "soundCard": "jI3UfYki"}]}, "platforms": ["Linux", "Windows", "IOS"], "players": ["Coop", "Coop", "LocalCoop"], "primaryGenre": "Simulation", "publisher": "eCASCHl3", "releaseDate": "1983-11-02T00:00:00Z", "websiteUrl": "5ZJL1ihd"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateApp' test.out

#- 102 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'Oh0Jp0zf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YbHgHVi4' \
    > test.out 2>&1
eval_tap $? 102 'DisableItem' test.out

#- 103 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '1wg5z5xJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'GetItemDynamicData' test.out

#- 104 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'zppKQeTy' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qVJUvhaF' \
    > test.out 2>&1
eval_tap $? 104 'EnableItem' test.out

#- 105 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'QwIJrHwt' \
    --itemId 'PeP101SI' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2yTFUsv6' \
    > test.out 2>&1
eval_tap $? 105 'FeatureItem' test.out

#- 106 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '8jyFwalz' \
    --itemId 'rPx3FmMg' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fpR2bFbN' \
    > test.out 2>&1
eval_tap $? 106 'DefeatureItem' test.out

#- 107 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'oJDLLMfX' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Znv56WpS' \
    --populateBundle  \
    --region 'IUyw4p17' \
    --storeId 'XO7XAqiz' \
    > test.out 2>&1
eval_tap $? 107 'GetLocaleItem' test.out

#- 108 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'x7a8x8IR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xxHEZnM3' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 17, "comparison": "is", "name": "c3rSKUqX", "predicateType": "SeasonPassPredicate", "value": "JgY0MHdH", "values": ["waOd519w", "KJ7NO6a4", "x6K619cf"]}, {"anyOf": 83, "comparison": "isGreaterThan", "name": "H1XIGoBb", "predicateType": "SeasonPassPredicate", "value": "twx47Ca8", "values": ["l1Zm72hf", "KEFWuPF9", "9iblCGb5"]}, {"anyOf": 90, "comparison": "isNot", "name": "2cclxNEO", "predicateType": "SeasonPassPredicate", "value": "O1uarQAG", "values": ["PffTty4o", "hkGsGm4j", "rPAAGrxn"]}]}, {"operator": "or", "predicates": [{"anyOf": 33, "comparison": "isGreaterThan", "name": "hsA01uVA", "predicateType": "EntitlementPredicate", "value": "Jl83RH6A", "values": ["0Mpl7HmH", "DzQHOaxZ", "cGwkI9Wv"]}, {"anyOf": 58, "comparison": "includes", "name": "DzwttEh3", "predicateType": "SeasonTierPredicate", "value": "UiVQRjOS", "values": ["NzdlozAh", "tNScsXyh", "F9OiMFn1"]}, {"anyOf": 96, "comparison": "isGreaterThanOrEqual", "name": "1FYj5GIv", "predicateType": "SeasonPassPredicate", "value": "gL4QC4ka", "values": ["Rv5GupGh", "qCZPs2Mm", "hqKOHxPn"]}]}, {"operator": "or", "predicates": [{"anyOf": 85, "comparison": "isGreaterThan", "name": "9lGVYANn", "predicateType": "EntitlementPredicate", "value": "xvyuguZ5", "values": ["TyCyTPpI", "fm70u1TX", "wn2RbXhO"]}, {"anyOf": 38, "comparison": "isLessThanOrEqual", "name": "u6aMshbZ", "predicateType": "SeasonPassPredicate", "value": "MXiA4hb1", "values": ["a3tOVYZ3", "JBI5lfQ3", "amcqKr2K"]}, {"anyOf": 61, "comparison": "isGreaterThanOrEqual", "name": "jwzQRwHd", "predicateType": "SeasonTierPredicate", "value": "cs0uLhbP", "values": ["Be9skHfJ", "fkMh95cq", "Gd3oDBw9"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateItemPurchaseCondition' test.out

#- 109 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'y9TkXL5R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "fZRBZHRQ"}' \
    > test.out 2>&1
eval_tap $? 109 'ReturnItem' test.out

#- 110 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --name 'OoI51OD9' \
    --offset '73' \
    --tag 'RHSB9ywb' \
    > test.out 2>&1
eval_tap $? 110 'QueryKeyGroups' test.out

#- 111 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "CcpusIr7", "name": "w7DzbvZP", "status": "INACTIVE", "tags": ["GJlTHJLW", "hXqgfIVg", "dm4E0GBI"]}' \
    > test.out 2>&1
eval_tap $? 111 'CreateKeyGroup' test.out

#- 112 GetKeyGroupByBoothName
eval_tap 0 112 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 113 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'uEbTnAFw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetKeyGroup' test.out

#- 114 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'CGmqWsyd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Vg43ioiq", "name": "vOn8TELd", "status": "INACTIVE", "tags": ["nYBpHQ5G", "mWpCSx3N", "pkugtbOg"]}' \
    > test.out 2>&1
eval_tap $? 114 'UpdateKeyGroup' test.out

#- 115 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'LiKQbkAU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetKeyGroupDynamic' test.out

#- 116 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'CTRMbvEc' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '81' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 116 'ListKeys' test.out

#- 117 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'w8f7oR6O' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 117 'UploadKeys' test.out

#- 118 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'A7UAEEsC' \
    --limit '40' \
    --offset '95' \
    --orderNos 'qvhhSn10,3LO1FvAq,hQhNY4VG' \
    --sortBy 'kCysUwfE' \
    --startTime 'ThMbE7Ip' \
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
    --orderNo '1E5BkpzJ' \
    > test.out 2>&1
eval_tap $? 120 'GetOrder' test.out

#- 121 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1Drw0pP4' \
    --body '{"description": "7LT9nGhM"}' \
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
    --body '{"dryRun": false, "notifyUrl": "cQza2EQ1", "privateKey": "HVlqYZJW"}' \
    > test.out 2>&1
eval_tap $? 123 'UpdatePaymentCallbackConfig' test.out

#- 124 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'weFp1Bjv' \
    --externalId 'vItAJkJM' \
    --limit '32' \
    --notificationSource 'ADYEN' \
    --notificationType 'rPWkAneZ' \
    --offset '88' \
    --paymentOrderNo 'V6TwvxjJ' \
    --startDate 'fAXBrvNs' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 124 'QueryPaymentNotifications' test.out

#- 125 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'k4TdfEwq' \
    --limit '75' \
    --offset '66' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 125 'QueryPaymentOrders' test.out

#- 126 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "Op0b4VXO", "currencyNamespace": "rdScUkZ5", "customParameters": {"tHi4sDSg": {}, "ZCzTFmrx": {}, "264xeaMX": {}}, "description": "iaPqYCSS", "extOrderNo": "ayXuisNm", "extUserId": "DxoS16s5", "itemType": "MEDIA", "language": "LunW", "metadata": {"ouCSWNVH": "0oWsyFaJ", "P15PKOPi": "RhJ6tA3p", "kSLzgX8J": "0PReUVpk"}, "notifyUrl": "KyezHZyf", "omitNotification": false, "platform": "JPoO6XIh", "price": 60, "recurringPaymentOrderNo": "TZh9di8K", "region": "GgIWwxFa", "returnUrl": "g2B6mOHB", "sandbox": false, "sku": "Y4FM8oER", "subscriptionId": "y0W4MXin", "targetNamespace": "gZEpp6yp", "targetUserId": "RexfImjO", "title": "O1BaOZvn"}' \
    > test.out 2>&1
eval_tap $? 126 'CreatePaymentOrderByDedicated' test.out

#- 127 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'kPLT8uYF' \
    > test.out 2>&1
eval_tap $? 127 'ListExtOrderNoByExtTxId' test.out

#- 128 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KM25StbQ' \
    > test.out 2>&1
eval_tap $? 128 'GetPaymentOrder' test.out

#- 129 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'o2s8D4sp' \
    --body '{"extTxId": "CJQXwvdE", "paymentMethod": "ToM3FNYP", "paymentProvider": "CHECKOUT"}' \
    > test.out 2>&1
eval_tap $? 129 'ChargePaymentOrder' test.out

#- 130 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '03FR0i5f' \
    --body '{"description": "XdB65xN0"}' \
    > test.out 2>&1
eval_tap $? 130 'RefundPaymentOrderByDedicated' test.out

#- 131 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AvVEaOO9' \
    --body '{"amount": 2, "currencyCode": "LTlHKC0J", "notifyType": "CHARGE", "paymentProvider": "XSOLLA", "salesTax": 80, "vat": 10}' \
    > test.out 2>&1
eval_tap $? 131 'SimulatePaymentOrderNotification' test.out

#- 132 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Kcb9nBb3' \
    > test.out 2>&1
eval_tap $? 132 'GetPaymentOrderChargeStatus' test.out

#- 133 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 133 'GetPlatformWalletConfig' test.out

#- 134 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["GooglePlay", "Steam", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 134 'UpdatePlatformWalletConfig' test.out

#- 135 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
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
    --body '{"entitlement": {"durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
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
    --endTime 'WVI3KmYT' \
    --limit '87' \
    --offset '38' \
    --source 'ORDER' \
    --startTime 'YXoaOwWs' \
    --status 'SUCCESS' \
    --transactionId 'Trv4lZsz' \
    --userId 'QVAPy6xW' \
    > test.out 2>&1
eval_tap $? 139 'QueryRevocationHistories' test.out

#- 140 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "af5lNrCX", "eventTopic": "Or1xuOhU", "maxAwarded": 21, "maxAwardedPerUser": 99, "namespaceExpression": "8GgL8LOO", "rewardCode": "LT2AOrVQ", "rewardConditions": [{"condition": "aSoQgomI", "conditionName": "98XVF8RB", "eventName": "6kxH25Yn", "rewardItems": [{"duration": 58, "itemId": "yoMvprob", "quantity": 12}, {"duration": 83, "itemId": "Ifp9fmqs", "quantity": 3}, {"duration": 51, "itemId": "zBG5DEBR", "quantity": 94}]}, {"condition": "qkJLtuo1", "conditionName": "5itHgs80", "eventName": "8W8tWXDv", "rewardItems": [{"duration": 95, "itemId": "XlUecX6v", "quantity": 61}, {"duration": 96, "itemId": "ES62CSZ6", "quantity": 79}, {"duration": 44, "itemId": "166DB8hF", "quantity": 62}]}, {"condition": "F3JnxUck", "conditionName": "AnhAyEUP", "eventName": "j7arAwQE", "rewardItems": [{"duration": 60, "itemId": "9MnThHzI", "quantity": 53}, {"duration": 87, "itemId": "RDpzyj4N", "quantity": 43}, {"duration": 84, "itemId": "BoE7lnAD", "quantity": 68}]}], "userIdExpression": "hrLsGpD6"}' \
    > test.out 2>&1
eval_tap $? 140 'CreateReward' test.out

#- 141 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'WI1O4k6Z' \
    --limit '11' \
    --offset '84' \
    --sortBy 'rewardCode:asc,namespace:desc' \
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
    --rewardId 'ZeSGGL6k' \
    > test.out 2>&1
eval_tap $? 144 'GetReward' test.out

#- 145 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'HqW7YdOI' \
    --body '{"description": "ZUCRrQrL", "eventTopic": "v4it8msX", "maxAwarded": 91, "maxAwardedPerUser": 15, "namespaceExpression": "vnSG2Ei6", "rewardCode": "76RscUqP", "rewardConditions": [{"condition": "WSTEDtNZ", "conditionName": "UTxUsDQn", "eventName": "lIca8TO8", "rewardItems": [{"duration": 94, "itemId": "KOkxxlgn", "quantity": 59}, {"duration": 86, "itemId": "E3cKED23", "quantity": 9}, {"duration": 43, "itemId": "556B8LBp", "quantity": 35}]}, {"condition": "9SV5PCxY", "conditionName": "oazGeaQf", "eventName": "2LECmI0p", "rewardItems": [{"duration": 84, "itemId": "PpE4jz7V", "quantity": 57}, {"duration": 51, "itemId": "pQC5iAF2", "quantity": 80}, {"duration": 61, "itemId": "Z7TZOwaB", "quantity": 83}]}, {"condition": "revVniOz", "conditionName": "Y1nQ29ud", "eventName": "6u0ggTU1", "rewardItems": [{"duration": 0, "itemId": "IU9SNJXt", "quantity": 29}, {"duration": 51, "itemId": "tU9iNssw", "quantity": 62}, {"duration": 94, "itemId": "R9hsHX9m", "quantity": 11}]}], "userIdExpression": "gd8ACUHS"}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateReward' test.out

#- 146 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RK5GAVTZ' \
    > test.out 2>&1
eval_tap $? 146 'DeleteReward' test.out

#- 147 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'xaLOAiQ9' \
    --body '{"payload": {"5vmJVXgj": {}, "SFPQrbmF": {}, "Q5Lk6gNT": {}}}' \
    > test.out 2>&1
eval_tap $? 147 'CheckEventCondition' test.out

#- 148 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 't0esDmxx' \
    --body '{"conditionName": "1cUqaHbl", "userId": "wxJCuRnJ"}' \
    > test.out 2>&1
eval_tap $? 148 'DeleteRewardConditionRecord' test.out

#- 149 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'DiLkpbts' \
    --limit '65' \
    --offset '87' \
    --start '22VE94p4' \
    --storeId '3sbrKb66' \
    --viewId 'OtLOjvu8' \
    > test.out 2>&1
eval_tap $? 149 'QuerySections' test.out

#- 150 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'FCcnFruT' \
    --body '{"active": true, "displayOrder": 39, "endDate": "1975-10-10T00:00:00Z", "ext": {"RcbzPrNK": {}, "2kI0qL59": {}, "clfup9iF": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 11, "itemCount": 85, "rule": "SEQUENCE"}, "items": [{"id": "cbtLrzuw", "sku": "ZdwDSTxd"}, {"id": "E91vGKtz", "sku": "K0apSqCU"}, {"id": "VkY3PaPk", "sku": "fITfz7oE"}], "localizations": {"7ns6yKlG": {"description": "iE1vSJ3p", "localExt": {"dsdc3zzH": {}, "aSLfJfqX": {}, "s8BZCaEk": {}}, "longDescription": "SerIDvvH", "title": "vrw1YIUu"}, "e7g9JxQd": {"description": "LrYG23fe", "localExt": {"p3fQ6JDA": {}, "O88CgZUQ": {}, "4d1RPar6": {}}, "longDescription": "LKuKPiLs", "title": "5KfLjXqz"}, "sAvUAVhX": {"description": "vzu3IwbS", "localExt": {"64NEKm4s": {}, "4A15ZiR1": {}, "Jif9XTdc": {}}, "longDescription": "5VHGIXOA", "title": "QXwIrKBz"}}, "name": "SM704uER", "rotationType": "NONE", "startDate": "1976-11-12T00:00:00Z", "viewId": "t6haxlab"}' \
    > test.out 2>&1
eval_tap $? 150 'CreateSection' test.out

#- 151 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RUYIa8Xw' \
    > test.out 2>&1
eval_tap $? 151 'PurgeExpiredSection' test.out

#- 152 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'wPWDGrWb' \
    --storeId 'BSk3o4TJ' \
    > test.out 2>&1
eval_tap $? 152 'GetSection' test.out

#- 153 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'EvID8M0Z' \
    --storeId 'yRi3i7Rh' \
    --body '{"active": false, "displayOrder": 90, "endDate": "1976-10-24T00:00:00Z", "ext": {"eBgBsi3A": {}, "gLGaU9ul": {}, "P1yG7Q0h": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 25, "itemCount": 86, "rule": "SEQUENCE"}, "items": [{"id": "Xzifoeyy", "sku": "pKlcgtaa"}, {"id": "KvZ3CjfT", "sku": "ag5vHKts"}, {"id": "NnZ2GWha", "sku": "8w0IsFz6"}], "localizations": {"4dP8p8ol": {"description": "NjXMzLT6", "localExt": {"KejSLYIo": {}, "AKmpQT1e": {}, "pd0oDOjy": {}}, "longDescription": "pgPaVL5j", "title": "rZIZPsiK"}, "SOfh33sO": {"description": "NbcMvnuA", "localExt": {"cZlAJqyk": {}, "gFyFdZcm": {}, "9OXfwUJS": {}}, "longDescription": "XuXxBbNK", "title": "qlJjLgmt"}, "dHaqd3N8": {"description": "4AjvtfzO", "localExt": {"apFB05Ig": {}, "5C7gAvCN": {}, "w3GoYSKb": {}}, "longDescription": "6LFEjuzE", "title": "LweImJw5"}}, "name": "qAQ1VV3F", "rotationType": "NONE", "startDate": "1975-07-01T00:00:00Z", "viewId": "7hXFijHc"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateSection' test.out

#- 154 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'cxJZAMSX' \
    --storeId 'MYRulRbR' \
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
    --body '{"defaultLanguage": "VSEok0km", "defaultRegion": "F5knH6El", "description": "4XgMa3d3", "supportedLanguages": ["gJvdt0kx", "ug0uO9GE", "iQZxflko"], "supportedRegions": ["HKvh00es", "PWNtOLQL", "o4CIpfQr"], "title": "IWeEKTXH"}' \
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
    --storeId '9iwUcpXF' \
    > test.out 2>&1
eval_tap $? 162 'GetStore' test.out

#- 163 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'O3iFPakN' \
    --body '{"defaultLanguage": "oGSkitLm", "defaultRegion": "jNMMm2aA", "description": "lYg8bJyh", "supportedLanguages": ["bTIiRrmG", "kX8FOHvf", "IIJDe2Ef"], "supportedRegions": ["bISNF6Bg", "pYQkTW4I", "UBIQZm2p"], "title": "tszLKKbU"}' \
    > test.out 2>&1
eval_tap $? 163 'UpdateStore' test.out

#- 164 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LhacY6sE' \
    > test.out 2>&1
eval_tap $? 164 'DeleteStore' test.out

#- 165 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'joJT1PWZ' \
    --action 'DELETE' \
    --itemSku 'Lf9g7Qh6' \
    --itemType 'APP' \
    --limit '94' \
    --offset '98' \
    --selected  \
    --sortBy 'updatedAt:asc,updatedAt:desc,updatedAt' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd 'Xu9QecAI' \
    --updatedAtStart '85yxXvD9' \
    > test.out 2>&1
eval_tap $? 165 'QueryChanges' test.out

#- 166 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oahqGW10' \
    > test.out 2>&1
eval_tap $? 166 'PublishAll' test.out

#- 167 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HtfNjomW' \
    > test.out 2>&1
eval_tap $? 167 'PublishSelected' test.out

#- 168 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'StZeT4Co' \
    > test.out 2>&1
eval_tap $? 168 'SelectAllRecords' test.out

#- 169 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EJRLFzmK' \
    --action 'UPDATE' \
    --itemSku '0xACXANK' \
    --itemType 'OPTIONBOX' \
    --type 'STORE' \
    --updatedAtEnd 'rlDxIXe4' \
    --updatedAtStart 'yvpg3IoO' \
    > test.out 2>&1
eval_tap $? 169 'GetStatistic' test.out

#- 170 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kJql73WU' \
    > test.out 2>&1
eval_tap $? 170 'UnselectAllRecords' test.out

#- 171 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'sndwPY0T' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EN9NBKpG' \
    > test.out 2>&1
eval_tap $? 171 'SelectRecord' test.out

#- 172 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'L2BPWYyC' \
    --namespace "$AB_NAMESPACE" \
    --storeId '5KTFdY5Y' \
    > test.out 2>&1
eval_tap $? 172 'UnselectRecord' test.out

#- 173 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'R7w55c1G' \
    --targetStoreId 'X8u4nJWS' \
    > test.out 2>&1
eval_tap $? 173 'CloneStore' test.out

#- 174 ExportStore
eval_tap 0 174 'ExportStore # SKIP deprecated' test.out

#- 175 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '66ZPTU56' \
    --limit '17' \
    --offset '96' \
    --sku 'Z2En6is1' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'l9euD8ne' \
    > test.out 2>&1
eval_tap $? 175 'QuerySubscriptions' test.out

#- 176 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yJMHM1jI' \
    > test.out 2>&1
eval_tap $? 176 'RecurringChargeSubscription' test.out

#- 177 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'O6Yxaa65' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 177 'GetTicketDynamic' test.out

#- 178 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'qPuBFcv4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "Ldq1U5ig"}' \
    > test.out 2>&1
eval_tap $? 178 'DecreaseTicketSale' test.out

#- 179 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'ENnrDsdG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'GetTicketBoothID' test.out

#- 180 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'k8qD75vi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 79, "orderNo": "qgwKo2GT"}' \
    > test.out 2>&1
eval_tap $? 180 'IncreaseTicketSale' test.out

#- 181 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WVZBe9SZ' \
    --body '{"achievements": [{"id": "9EEIguxN", "value": 65}, {"id": "goZJkcnm", "value": 38}, {"id": "rUU3fzwh", "value": 29}], "steamUserId": "Cb8j3CGS"}' \
    > test.out 2>&1
eval_tap $? 181 'UnlockSteamUserAchievement' test.out

#- 182 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ys7BJQrl' \
    --xboxUserId '0KZjhfav' \
    > test.out 2>&1
eval_tap $? 182 'GetXblUserAchievements' test.out

#- 183 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'N4z3Ht17' \
    --body '{"achievements": [{"id": "oMjIYaRD", "percentComplete": 56}, {"id": "wob6JYcv", "percentComplete": 55}, {"id": "QV3OoAoM", "percentComplete": 97}], "serviceConfigId": "DhR3Es82", "titleId": "PVm0Bn6c", "xboxUserId": "gw4i0QcR"}' \
    > test.out 2>&1
eval_tap $? 183 'UpdateXblUserAchievement' test.out

#- 184 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'sMZOm0bD' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeCampaign' test.out

#- 185 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNdYTt9c' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeEntitlement' test.out

#- 186 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hhymfc0U' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeFulfillment' test.out

#- 187 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVBtkRnW' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeIntegration' test.out

#- 188 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'fqQ4NKdk' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizeOrder' test.out

#- 189 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '8EQ1bXqw' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizePayment' test.out

#- 190 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'BQIYmSir' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeRevocation' test.out

#- 191 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'x5YOIhWx' \
    > test.out 2>&1
eval_tap $? 191 'AnonymizeSubscription' test.out

#- 192 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'hFHJWc6i' \
    > test.out 2>&1
eval_tap $? 192 'AnonymizeWallet' test.out

#- 193 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '8PLCcGxM' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 193 'GetUserDLC' test.out

#- 194 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LXQ3Mc2N' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName '2e6DFw4I' \
    --features 'lwSowmb3,cGLU6I1v,u8GMShD5' \
    --itemId 'a9go8jEp,lB5PoJaw,Pse8VJIm' \
    --limit '29' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 194 'QueryUserEntitlements' test.out

#- 195 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'SfnT3wZ9' \
    --body '[{"endDate": "1979-06-17T00:00:00Z", "grantedCode": "Pq19jLFp", "itemId": "O3U570sW", "itemNamespace": "NZrBjBOW", "language": "Wp_694", "quantity": 49, "region": "kX3IqUDl", "source": "REWARD", "startDate": "1979-12-28T00:00:00Z", "storeId": "Up2l9dQT"}, {"endDate": "1984-12-15T00:00:00Z", "grantedCode": "UcAgAreG", "itemId": "15Dn1akS", "itemNamespace": "5Bf2xTqw", "language": "XPrK-pDBX-eU", "quantity": 63, "region": "f13eYFbT", "source": "ACHIEVEMENT", "startDate": "1972-02-04T00:00:00Z", "storeId": "Fuf5jjEc"}, {"endDate": "1986-09-22T00:00:00Z", "grantedCode": "NK2urvIv", "itemId": "yqelBpP3", "itemNamespace": "5zt03qNG", "language": "aVs_fQtB", "quantity": 47, "region": "VvWyWbq7", "source": "IAP", "startDate": "1976-09-27T00:00:00Z", "storeId": "U0VH1Bin"}]' \
    > test.out 2>&1
eval_tap $? 195 'GrantUserEntitlement' test.out

#- 196 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'M7l2jBsU' \
    --activeOnly  \
    --appId 'aGb3mGDo' \
    > test.out 2>&1
eval_tap $? 196 'GetUserAppEntitlementByAppId' test.out

#- 197 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'bVPHyB58' \
    --activeOnly  \
    --limit '43' \
    --offset '39' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 197 'QueryUserEntitlementsByAppType' test.out

#- 198 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyXEo6yV' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'QoU29e5G' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementByItemId' test.out

#- 199 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cka4SXX8' \
    --ids 'zboBj9E5,uRbnCJMn,28zmxiXU' \
    > test.out 2>&1
eval_tap $? 199 'GetUserActiveEntitlementsByItemIds' test.out

#- 200 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '40JLuBmT' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --sku 'wSvfRoDr' \
    > test.out 2>&1
eval_tap $? 200 'GetUserEntitlementBySku' test.out

#- 201 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'x22bWcYb' \
    --appIds 'o4HRCbzu,syfx2jJD,3UrNolfH' \
    --itemIds 'X3f480tP,T8McSyN6,3y2F4DXL' \
    --skus '1A6gV8DX,CwP8Q9ET,4JXDMb9B' \
    > test.out 2>&1
eval_tap $? 201 'ExistsAnyUserActiveEntitlement' test.out

#- 202 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'onyH57Ck' \
    --itemIds 'v0ZKviPB,tzG2KnQu,YdnnAa6E' \
    > test.out 2>&1
eval_tap $? 202 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 203 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'l0kZDoak' \
    --appId 'iri7UUIg' \
    > test.out 2>&1
eval_tap $? 203 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 204 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YCrqNhyR' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'GHXk5gdE' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipByItemId' test.out

#- 205 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '16nJSeOi' \
    --ids 'k2dYfDpj,YOTJTCOS,aEjkkLbY' \
    > test.out 2>&1
eval_tap $? 205 'GetUserEntitlementOwnershipByItemIds' test.out

#- 206 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'wHHm1pRY' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'Mi8vsv0Y' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlementOwnershipBySku' test.out

#- 207 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XD46Zd5d' \
    --entitlementIds 'vpWQy6UB' \
    > test.out 2>&1
eval_tap $? 207 'RevokeUserEntitlements' test.out

#- 208 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'SyjMxgTY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybp6LvRv' \
    > test.out 2>&1
eval_tap $? 208 'GetUserEntitlement' test.out

#- 209 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'bSlwLZdX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'grBgKGqn' \
    --body '{"endDate": "1979-02-07T00:00:00Z", "nullFieldList": ["ottNbSKq", "7VQMgkhN", "Rp7Z9Qv4"], "startDate": "1985-09-13T00:00:00Z", "status": "REVOKED", "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateUserEntitlement' test.out

#- 210 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'DelneFqt' \
    --namespace "$AB_NAMESPACE" \
    --userId '8WnvdVfb' \
    --body '{"options": ["ASKLkKk6", "uo7DTFpW", "83883CxT"], "requestId": "UFHvwHIZ", "useCount": 51}' \
    > test.out 2>&1
eval_tap $? 210 'ConsumeUserEntitlement' test.out

#- 211 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'Uo15fj4Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YId4hw7r' \
    > test.out 2>&1
eval_tap $? 211 'DisableUserEntitlement' test.out

#- 212 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'dglD2J60' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nZ9Vagrf' \
    > test.out 2>&1
eval_tap $? 212 'EnableUserEntitlement' test.out

#- 213 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'd5L8IrVM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EaOWEh5y' \
    > test.out 2>&1
eval_tap $? 213 'GetUserEntitlementHistories' test.out

#- 214 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'YTOcmVKw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Af5Mueut' \
    > test.out 2>&1
eval_tap $? 214 'RevokeUserEntitlement' test.out

#- 215 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2U2CKU6b' \
    --body '{"duration": 18, "endDate": "1991-04-25T00:00:00Z", "itemId": "wzUvJpjf", "itemSku": "4cp6APQT", "language": "2wiIUSQW", "order": {"currency": {"currencyCode": "3zgkg5DZ", "currencySymbol": "RAliXXF7", "currencyType": "VIRTUAL", "decimals": 62, "namespace": "E2pYvBul"}, "ext": {"UYGgptDX": {}, "ZIgShsUe": {}, "NWZLT5rn": {}}, "free": false}, "orderNo": "ODLIDBUo", "origin": "Steam", "quantity": 38, "region": "nMMHMVzW", "source": "ACHIEVEMENT", "startDate": "1993-01-01T00:00:00Z", "storeId": "eC6iEYf4"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillItem' test.out

#- 216 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'zcFQCKwe' \
    --body '{"code": "9aoEYIHb", "language": "Nd", "region": "mSc5y62z"}' \
    > test.out 2>&1
eval_tap $? 216 'RedeemCode' test.out

#- 217 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQLJj9qW' \
    --body '{"origin": "Other", "rewards": [{"currency": {"currencyCode": "uTeHpPxZ", "namespace": "4KDfQdB6"}, "item": {"itemId": "idAutKoy", "itemSku": "Y5S9j4pS", "itemType": "7tIl1zFU"}, "quantity": 95, "type": "ITEM"}, {"currency": {"currencyCode": "upgJ1uHK", "namespace": "saaSyHj5"}, "item": {"itemId": "k25BD1KD", "itemSku": "Wa5wJ95X", "itemType": "oBhouy0H"}, "quantity": 66, "type": "CURRENCY"}, {"currency": {"currencyCode": "MGHfcoNL", "namespace": "8ThWd1gR"}, "item": {"itemId": "rklJYb27", "itemSku": "5sDWvVhv", "itemType": "z1gqidOG"}, "quantity": 10, "type": "CURRENCY"}], "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 217 'FulfillRewards' test.out

#- 218 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'RNojhhRN' \
    --endTime 'wgYzN2D8' \
    --limit '68' \
    --offset '85' \
    --productId 'PZuiC77i' \
    --startTime 'Y3SXAeOj' \
    --status 'FULFILLED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPOrders' test.out

#- 219 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'UvLTpg6y' \
    > test.out 2>&1
eval_tap $? 219 'QueryAllUserIAPOrders' test.out

#- 220 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'z5v46OSm' \
    --endTime 'hgWbBgAs' \
    --limit '78' \
    --offset '53' \
    --startTime 'sqT3Iatf' \
    --status 'FAIL' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserIAPConsumeHistory' test.out

#- 221 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ozXV6Dj4' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "nsz_mIjS_353", "productId": "2VtshNJG", "region": "u53vBzse", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 221 'MockFulfillIAPItem' test.out

#- 222 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'jfCW9gZz' \
    --itemId '58v6eTdD' \
    --limit '48' \
    --offset '43' \
    --status 'FULFILL_FAILED' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserOrders' test.out

#- 223 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'OTKcCd16' \
    --body '{"currencyCode": "JJtf3Stq", "currencyNamespace": "jR6YsC3j", "discountedPrice": 59, "ext": {"IeNgrv7X": {}, "KjBYvRGp": {}, "cFGQQnfJ": {}}, "itemId": "uQTDe2jD", "language": "CJlOanJh", "options": {"skipPriceValidation": true}, "platform": "GooglePlay", "price": 58, "quantity": 78, "region": "J9aRPkLO", "returnUrl": "kg9yzwjn", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 223 'AdminCreateUserOrder' test.out

#- 224 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IJzyFpBu' \
    --itemId '6wUzqGjm' \
    > test.out 2>&1
eval_tap $? 224 'CountOfPurchasedItem' test.out

#- 225 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'M5oqntdX' \
    --userId 'ockpavXy' \
    > test.out 2>&1
eval_tap $? 225 'GetUserOrder' test.out

#- 226 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yXqCuTAV' \
    --userId 'EZeJqmn9' \
    --body '{"status": "REFUNDED", "statusReason": "MtsXg1G0"}' \
    > test.out 2>&1
eval_tap $? 226 'UpdateUserOrderStatus' test.out

#- 227 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WYAMPhQ1' \
    --userId 'EutipKoD' \
    > test.out 2>&1
eval_tap $? 227 'FulfillUserOrder' test.out

#- 228 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'cAfpQJVU' \
    --userId 'fhg1Np2X' \
    > test.out 2>&1
eval_tap $? 228 'GetUserOrderGrant' test.out

#- 229 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rXKgaQuy' \
    --userId 'uNjlHpoG' \
    > test.out 2>&1
eval_tap $? 229 'GetUserOrderHistories' test.out

#- 230 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nDE70VZv' \
    --userId 'V8RkRzy6' \
    --body '{"additionalData": {"cardSummary": "WyOHeJ1y"}, "authorisedTime": "1990-11-21T00:00:00Z", "chargebackReversedTime": "1993-11-04T00:00:00Z", "chargebackTime": "1972-09-20T00:00:00Z", "chargedTime": "1978-06-14T00:00:00Z", "createdTime": "1972-05-11T00:00:00Z", "currency": {"currencyCode": "6nUyv6wJ", "currencySymbol": "H7qX97bS", "currencyType": "REAL", "decimals": 9, "namespace": "aV4gIFPz"}, "customParameters": {"udJ45pKT": {}, "TOIBXxd8": {}, "MO2UMcqB": {}}, "extOrderNo": "iMyYBxaA", "extTxId": "cApPBRF2", "extUserId": "3mJ5Zs9I", "issuedAt": "1988-04-01T00:00:00Z", "metadata": {"FHxPllfC": "quuXVkza", "7LXnoJjv": "h9JN7MLA", "ZyPuJxom": "fEfp22i2"}, "namespace": "YmEaTGy0", "nonceStr": "86o9x275", "paymentMethod": "OIOWQjL6", "paymentMethodFee": 17, "paymentOrderNo": "fg9WGyHF", "paymentProvider": "ADYEN", "paymentProviderFee": 51, "paymentStationUrl": "akewQ0px", "price": 39, "refundedTime": "1974-01-15T00:00:00Z", "salesTax": 32, "sandbox": true, "sku": "yzJGjLHS", "status": "CHARGE_FAILED", "statusReason": "MYVMh7Ve", "subscriptionId": "CB28jh4r", "subtotalPrice": 60, "targetNamespace": "XaQ7a61p", "targetUserId": "qSTp3Dlh", "tax": 36, "totalPrice": 9, "totalTax": 60, "txEndTime": "1998-12-09T00:00:00Z", "type": "rrnUIjkk", "userId": "Mwg6CjU1", "vat": 53}' \
    > test.out 2>&1
eval_tap $? 230 'ProcessUserOrderNotification' test.out

#- 231 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HeyzsICr' \
    --userId 'q2XakcRa' \
    > test.out 2>&1
eval_tap $? 231 'DownloadUserOrderReceipt' test.out

#- 232 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'QJZ9LBgv' \
    --body '{"currencyCode": "lyNwDdQ1", "currencyNamespace": "2QLwXh2r", "customParameters": {"7WUaTfvz": {}, "2byR5N3l": {}, "pjiLlij7": {}}, "description": "aMVtrJpz", "extOrderNo": "h18Eajnu", "extUserId": "zCjkOS4C", "itemType": "LOOTBOX", "language": "LGfv_XxYL_Wn", "metadata": {"IQiP3WJh": "J0Y6r1Mw", "fqXNZK9k": "ZoMphF6v", "0I48XWZO": "eFe49zby"}, "notifyUrl": "dA3NVZec", "omitNotification": true, "platform": "HiRG1aBa", "price": 52, "recurringPaymentOrderNo": "g7N1UzQg", "region": "YaNdIDXc", "returnUrl": "ZJQvOdFV", "sandbox": true, "sku": "Msyujl7e", "subscriptionId": "2IUPDE3e", "title": "GmCiQUVh"}' \
    > test.out 2>&1
eval_tap $? 232 'CreateUserPaymentOrder' test.out

#- 233 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cBhwSTiO' \
    --userId 'G0oQeO1b' \
    --body '{"description": "S9hHlQkR"}' \
    > test.out 2>&1
eval_tap $? 233 'RefundUserPaymentOrder' test.out

#- 234 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'oCm5nixs' \
    --body '{"code": "7XVHZzJX", "orderNo": "x32aUAZK"}' \
    > test.out 2>&1
eval_tap $? 234 'ApplyUserRedemption' test.out

#- 235 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '2P4F44kI' \
    --body '{"meta": {"nK9CwPSC": {}, "VJ4zG1Wu": {}, "A7mAjEi0": {}}, "revokeEntries": [{"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "mzuZ3e0D", "namespace": "lY0L9uuC"}, "entitlement": {"clazz": "LOOTBOX", "entitlementId": "rXKFGrZa", "type": "DURABLE"}, "item": {"itemIdentity": "CQ1f1H5c", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 77, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "VF7LkfgD", "namespace": "3hca6ZUs"}, "entitlement": {"clazz": "CODE", "entitlementId": "bpitMDcB", "type": "DURABLE"}, "item": {"itemIdentity": "OtMmiRI7", "itemIdentityType": "ITEM_SKU", "origin": "Steam"}, "quantity": 54, "type": "ITEM"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "yyoX6jWR", "namespace": "xHpZSrYT"}, "entitlement": {"clazz": "OPTIONBOX", "entitlementId": "V003NE4i", "type": "DURABLE"}, "item": {"itemIdentity": "ILrSBesg", "itemIdentityType": "ITEM_ID", "origin": "Xbox"}, "quantity": 13, "type": "ITEM"}], "source": "DLC", "transactionId": "LmEdwbez"}' \
    > test.out 2>&1
eval_tap $? 235 'DoRevocation' test.out

#- 236 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZRrBAGm' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'E3n4twXN' \
    --limit '33' \
    --offset '90' \
    --sku '7phinXcp' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 236 'QueryUserSubscriptions' test.out

#- 237 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId '4Wy7NRsD' \
    --excludeSystem  \
    --limit '12' \
    --offset '41' \
    --subscriptionId 'haa4dqIY' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscriptionActivities' test.out

#- 238 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '3qJtp0H4' \
    --body '{"grantDays": 20, "itemId": "fporDF29", "language": "HhChzJJF", "reason": "oYNzSigg", "region": "mJ1ZqB7Q", "source": "2kfJEpdz"}' \
    > test.out 2>&1
eval_tap $? 238 'PlatformSubscribeSubscription' test.out

#- 239 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fRKMsUCF' \
    --itemId 'WHE9NgND' \
    > test.out 2>&1
eval_tap $? 239 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 240 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'FgUG8Q3z' \
    --userId 'F91UAS4v' \
    > test.out 2>&1
eval_tap $? 240 'GetUserSubscription' test.out

#- 241 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Rq95CA0o' \
    --userId 'nOFheKTD' \
    > test.out 2>&1
eval_tap $? 241 'DeleteUserSubscription' test.out

#- 242 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cEYQkB58' \
    --userId 'S87S5RQ5' \
    --force  \
    --body '{"immediate": false, "reason": "Kxw7VyF6"}' \
    > test.out 2>&1
eval_tap $? 242 'CancelSubscription' test.out

#- 243 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5cAvdDIU' \
    --userId 'R8VrV7xp' \
    --body '{"grantDays": 47, "reason": "CE3NqnIe"}' \
    > test.out 2>&1
eval_tap $? 243 'GrantDaysToSubscription' test.out

#- 244 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'vstR9y3l' \
    --userId 't1TFDL1a' \
    --excludeFree  \
    --limit '27' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 244 'GetUserSubscriptionBillingHistories' test.out

#- 245 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lnyBElGa' \
    --userId 'fiPMqjxD' \
    --body '{"additionalData": {"cardSummary": "3i1L6SPc"}, "authorisedTime": "1995-01-12T00:00:00Z", "chargebackReversedTime": "1997-09-23T00:00:00Z", "chargebackTime": "1975-10-01T00:00:00Z", "chargedTime": "1986-07-12T00:00:00Z", "createdTime": "1995-10-08T00:00:00Z", "currency": {"currencyCode": "NiVG7KCB", "currencySymbol": "xOWnu6PH", "currencyType": "VIRTUAL", "decimals": 32, "namespace": "APnzVQXq"}, "customParameters": {"fKKjDcj4": {}, "vVGTK2qp": {}, "xlfBuCM7": {}}, "extOrderNo": "Pin7lsrL", "extTxId": "hbpwExpg", "extUserId": "mqQrog3x", "issuedAt": "1981-12-01T00:00:00Z", "metadata": {"1nXesjev": "uOBk6dkT", "LaowBEjC": "w5Wwn8VN", "aiKRhiFg": "s3hDuuEi"}, "namespace": "i75CfsMc", "nonceStr": "9JARUgAT", "paymentMethod": "qVcNDpON", "paymentMethodFee": 95, "paymentOrderNo": "7zXY6htd", "paymentProvider": "ADYEN", "paymentProviderFee": 80, "paymentStationUrl": "ignGmXAG", "price": 5, "refundedTime": "1991-06-12T00:00:00Z", "salesTax": 21, "sandbox": true, "sku": "BcWGcOWo", "status": "AUTHORISED", "statusReason": "Q5d4dR3Y", "subscriptionId": "y4GmkcTg", "subtotalPrice": 74, "targetNamespace": "zOS3St1G", "targetUserId": "GXgda73r", "tax": 7, "totalPrice": 10, "totalTax": 62, "txEndTime": "1988-06-14T00:00:00Z", "type": "3WNFeUXW", "userId": "AClm3Vm3", "vat": 84}' \
    > test.out 2>&1
eval_tap $? 245 'ProcessUserSubscriptionNotification' test.out

#- 246 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'hG2QlWbg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W6TrAqhx' \
    --body '{"count": 66, "orderNo": "DoQzRXHI"}' \
    > test.out 2>&1
eval_tap $? 246 'AcquireUserTicket' test.out

#- 247 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'iJvK78AX' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserCurrencyWallets' test.out

#- 248 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'C3yM4a8O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OA0UeaLx' \
    --body '{"allowOverdraft": false, "amount": 29, "balanceOrigin": "Other", "reason": "HjxT8cJB"}' \
    > test.out 2>&1
eval_tap $? 248 'DebitUserWalletByCurrencyCode' test.out

#- 249 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'dUcbeEjK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IbHNQUSS' \
    --limit '62' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 249 'ListUserCurrencyTransactions' test.out

#- 250 CheckWallet
eval_tap 0 250 'CheckWallet # SKIP deprecated' test.out

#- 251 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'kPNfHLoW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xowgS3CX' \
    --body '{"amount": 95, "expireAt": "1994-01-05T00:00:00Z", "origin": "Steam", "reason": "4tK6GjlT", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 251 'CreditUserWallet' test.out

#- 252 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'wMl6mOys' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YeMV0hvr' \
    --body '{"amount": 78, "walletPlatform": "Other"}' \
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
    --storeId 'hl6WAzmk' \
    > test.out 2>&1
eval_tap $? 258 'ListViews' test.out

#- 259 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KMXJarCB' \
    --body '{"displayOrder": 17, "localizations": {"Y89vVmB5": {"description": "EMlYdonH", "localExt": {"xD3yJb2C": {}, "SdXb4mQ7": {}, "7uLdKIT5": {}}, "longDescription": "dN19eNJn", "title": "rYopZv9N"}, "bcXeqwYv": {"description": "mvMC39DP", "localExt": {"exotZ2Fv": {}, "1NQP4fYY": {}, "xLmVOxA2": {}}, "longDescription": "kSLhIss1", "title": "ElnSbTzy"}, "CRptwEky": {"description": "YPLapn1o", "localExt": {"JJ5TUX3W": {}, "4FF862QS": {}, "iHBKCMZk": {}}, "longDescription": "wAOgiZjX", "title": "b27t9Zys"}}, "name": "TGdh3m35"}' \
    > test.out 2>&1
eval_tap $? 259 'CreateView' test.out

#- 260 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId '8qtWkv2X' \
    --storeId 'SRfta551' \
    > test.out 2>&1
eval_tap $? 260 'GetView' test.out

#- 261 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'QfQtZlMI' \
    --storeId 'l4FVmPhp' \
    --body '{"displayOrder": 77, "localizations": {"cGeQS5zd": {"description": "F6mLqazo", "localExt": {"LwjoJtNR": {}, "bwfng1Br": {}, "2jxtpn6V": {}}, "longDescription": "7HYYIkpe", "title": "9XzUeOWD"}, "Kth4kkYW": {"description": "NZjpoaKZ", "localExt": {"JpsE3D1S": {}, "3zDEzCiL": {}, "ZKDn60F2": {}}, "longDescription": "TIX5s1TZ", "title": "0Ek06Odj"}, "ZfrYx1MN": {"description": "QFb79LoN", "localExt": {"h5RHXJyh": {}, "KOrLd6Hk": {}, "53lBZsWK": {}}, "longDescription": "8VXiBlqU", "title": "JFAy9d52"}}, "name": "MeFJ41Rq"}' \
    > test.out 2>&1
eval_tap $? 261 'UpdateView' test.out

#- 262 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'mSVRpEAC' \
    --storeId 'DC8jrWDx' \
    > test.out 2>&1
eval_tap $? 262 'DeleteView' test.out

#- 263 QueryWallets
eval_tap 0 263 'QueryWallets # SKIP deprecated' test.out

#- 264 GetWallet
eval_tap 0 264 'GetWallet # SKIP deprecated' test.out

#- 265 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'aoIX7tkK' \
    --end 'ujLVjAwr' \
    --start 'dfw6D7xO' \
    > test.out 2>&1
eval_tap $? 265 'SyncOrders' test.out

#- 266 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["dTDxYya9", "sO5nwBl8", "Ubdg6AKx"], "apiKey": "MbrBqdpD", "authoriseAsCapture": true, "blockedPaymentMethods": ["SPONFbAW", "4WiUPtQr", "jQvlkc2l"], "clientKey": "ir5AKPFW", "dropInSettings": "fRMa4ePy", "liveEndpointUrlPrefix": "SHVralBu", "merchantAccount": "e42mOqk0", "notificationHmacKey": "veP8kaOK", "notificationPassword": "fDpX2OPb", "notificationUsername": "UoePccfu", "returnUrl": "xAHv4XlF", "settings": "Iqu0Eb8L"}' \
    > test.out 2>&1
eval_tap $? 266 'TestAdyenConfig' test.out

#- 267 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "DNpF4ad1", "privateKey": "CAgowDga", "publicKey": "bczgpnnY", "returnUrl": "D2yPYMsX"}' \
    > test.out 2>&1
eval_tap $? 267 'TestAliPayConfig' test.out

#- 268 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "A4iOq82N", "secretKey": "tFXpmpS9"}' \
    > test.out 2>&1
eval_tap $? 268 'TestCheckoutConfig' test.out

#- 269 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'LrDogQOa' \
    > test.out 2>&1
eval_tap $? 269 'DebugMatchedPaymentMerchantConfig' test.out

#- 270 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "g5Ld7QmU", "clientSecret": "vBhK7vYm", "returnUrl": "DOfMyA6E", "webHookId": "8U1jFvku"}' \
    > test.out 2>&1
eval_tap $? 270 'TestPayPalConfig' test.out

#- 271 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["z9y9xI4V", "lQ6ciHn3", "dQVvlwtE"], "publishableKey": "kVK1OqlW", "secretKey": "9D0LPE4w", "webhookSecret": "oJf22mJw"}' \
    > test.out 2>&1
eval_tap $? 271 'TestStripeConfig' test.out

#- 272 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "dT1EXS3i", "key": "5DXhRAZp", "mchid": "s9AiaIUD", "returnUrl": "tkXmLyFB"}' \
    > test.out 2>&1
eval_tap $? 272 'TestWxPayConfig' test.out

#- 273 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "a4t9FgZe", "flowCompletionUrl": "8YslK1GI", "merchantId": 89, "projectId": 89, "projectSecretKey": "aQIOB79R"}' \
    > test.out 2>&1
eval_tap $? 273 'TestXsollaConfig' test.out

#- 274 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '5joTodMV' \
    > test.out 2>&1
eval_tap $? 274 'GetPaymentMerchantConfig' test.out

#- 275 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'yT6CJgGv' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Yq0QWtBV", "aNEA8z5Z", "CzeTSUCb"], "apiKey": "4kydEM7P", "authoriseAsCapture": false, "blockedPaymentMethods": ["2WPLEfsc", "mDRt4Yqy", "b2TjPik2"], "clientKey": "ly5UHehP", "dropInSettings": "iJKzatdN", "liveEndpointUrlPrefix": "PlRE10iR", "merchantAccount": "6WQJXB6v", "notificationHmacKey": "ziF6yclZ", "notificationPassword": "LxFr7noY", "notificationUsername": "XjecFqbE", "returnUrl": "q0ySczOF", "settings": "X8XZ9drQ"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateAdyenConfig' test.out

#- 276 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '2EBLoIxe' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestAdyenConfigById' test.out

#- 277 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'wMeDx7TA' \
    --sandbox  \
    --validate  \
    --body '{"appId": "5fkswUwS", "privateKey": "ZAeqhyLu", "publicKey": "wpKeNmn6", "returnUrl": "JHU2j56f"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateAliPayConfig' test.out

#- 278 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'eOlPWuox' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestAliPayConfigById' test.out

#- 279 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'ZCFMiqyl' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "NWWwW072", "secretKey": "nQFGEhUk"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateCheckoutConfig' test.out

#- 280 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '55LnHoA4' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestCheckoutConfigById' test.out

#- 281 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'm3B1Wgwy' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "9MyYlCH2", "clientSecret": "raILyqiI", "returnUrl": "w2j3feOZ", "webHookId": "HHnYO8mI"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdatePayPalConfig' test.out

#- 282 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'iYQFeMqJ' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 282 'TestPayPalConfigById' test.out

#- 283 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'yIiXZNZx' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["xjdKf6vh", "yJsUUCU7", "PGbEz0vf"], "publishableKey": "PCHb50qy", "secretKey": "cIws6eE8", "webhookSecret": "wZwOpfkn"}' \
    > test.out 2>&1
eval_tap $? 283 'UpdateStripeConfig' test.out

#- 284 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'oiFnhhHq' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 284 'TestStripeConfigById' test.out

#- 285 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'tJkr1kpB' \
    --validate  \
    --body '{"appId": "gvQB01J2", "key": "ZE9IXRzD", "mchid": "7QZWD5tB", "returnUrl": "AwlUEBh1"}' \
    > test.out 2>&1
eval_tap $? 285 'UpdateWxPayConfig' test.out

#- 286 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'uSYjfOav' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 286 'UpdateWxPayConfigCert' test.out

#- 287 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'zo7pSe7l' \
    > test.out 2>&1
eval_tap $? 287 'TestWxPayConfigById' test.out

#- 288 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'HbRR0PUR' \
    --validate  \
    --body '{"apiKey": "U7ranhxS", "flowCompletionUrl": "AcyaK4Rl", "merchantId": 37, "projectId": 8, "projectSecretKey": "UcItkQyl"}' \
    > test.out 2>&1
eval_tap $? 288 'UpdateXsollaConfig' test.out

#- 289 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id '0WFPbiuX' \
    > test.out 2>&1
eval_tap $? 289 'TestXsollaConfigById' test.out

#- 290 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'au0a4K5j' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "LARGE", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 290 'UpdateXsollaUIConfig' test.out

#- 291 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '13' \
    --namespace "$AB_NAMESPACE" \
    --offset '59' \
    --region 'KeQVch0n' \
    > test.out 2>&1
eval_tap $? 291 'QueryPaymentProviderConfig' test.out

#- 292 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "fEawhjpx", "region": "MeUidgCf", "sandboxTaxJarApiToken": "lVyZDEgJ", "specials": ["STRIPE", "XSOLLA", "STRIPE"], "taxJarApiToken": "EzsMWUjF", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 292 'CreatePaymentProviderConfig' test.out

#- 293 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 293 'GetAggregatePaymentProviders' test.out

#- 294 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'nPUmhhD4' \
    > test.out 2>&1
eval_tap $? 294 'DebugMatchedPaymentProviderConfig' test.out

#- 295 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 295 'GetSpecialPaymentProviders' test.out

#- 296 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'wsyDpHr7' \
    --body '{"aggregate": "ADYEN", "namespace": "mp1WYQdF", "region": "Hk09hGKc", "sandboxTaxJarApiToken": "gkTXy3mK", "specials": ["ADYEN", "CHECKOUT", "CHECKOUT"], "taxJarApiToken": "hozbKYX1", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 296 'UpdatePaymentProviderConfig' test.out

#- 297 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'u9N1a2kC' \
    > test.out 2>&1
eval_tap $? 297 'DeletePaymentProviderConfig' test.out

#- 298 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 298 'GetPaymentTaxConfig' test.out

#- 299 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "MRonFXS1", "taxJarApiToken": "rLd11Ckx", "taxJarEnabled": true, "taxJarProductCodesMapping": {"dwDmR1dG": "ksgUNZ4W", "DhOzOo9n": "NbMFfv3Q", "GJBugoZU": "IrjDwTAE"}}' \
    > test.out 2>&1
eval_tap $? 299 'UpdatePaymentTaxConfig' test.out

#- 300 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'qzk7ASWu' \
    --end 'MwlgKpTR' \
    --start 'BOsKOtyU' \
    > test.out 2>&1
eval_tap $? 300 'SyncPaymentOrders' test.out

#- 301 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '1wcbEhAL' \
    --storeId 'uLcpdjDq' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetRootCategories' test.out

#- 302 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Z86GKQdt' \
    --storeId 'fDu6SHqc' \
    > test.out 2>&1
eval_tap $? 302 'DownloadCategories' test.out

#- 303 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'tn0cty0j' \
    --namespace "$AB_NAMESPACE" \
    --language 'vmtklXAS' \
    --storeId 'oGnhc0ij' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetCategory' test.out

#- 304 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'N9lsJGkt' \
    --namespace "$AB_NAMESPACE" \
    --language 'z6KqppME' \
    --storeId 'f7TCZ9uI' \
    > test.out 2>&1
eval_tap $? 304 'PublicGetChildCategories' test.out

#- 305 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'ivCKq65R' \
    --namespace "$AB_NAMESPACE" \
    --language 'NIZzR7zI' \
    --storeId 'QzB0shke' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetDescendantCategories' test.out

#- 306 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 306 'PublicListCurrencies' test.out

#- 307 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '2fHP834d' \
    --region 'Fn0p8oXt' \
    --storeId 'zNAB5w4b' \
    --appId 'vcLtq6QI' \
    > test.out 2>&1
eval_tap $? 307 'PublicGetItemByAppId' test.out

#- 308 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId '3ME4FLl9' \
    --categoryPath 'GowwLyQW' \
    --features 'fljpo2za' \
    --includeSubCategoryItem  \
    --itemType 'INGAMEITEM' \
    --language 'T7d8kDD6' \
    --limit '25' \
    --offset '86' \
    --region 'Q00rAmcl' \
    --sortBy 'createdAt:asc,createdAt:desc' \
    --storeId 'JvipzBVX' \
    --tags 'orbbmpfx' \
    > test.out 2>&1
eval_tap $? 308 'PublicQueryItems' test.out

#- 309 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'JPpQaDfN' \
    --region 'hd00FMjN' \
    --storeId 'F099TRdA' \
    --sku 'OONmAKzL' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetItemBySku' test.out

#- 310 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'y0qn4YQ1' \
    --region 'JqTxOpSu' \
    --storeId 'ugU4zlFP' \
    --itemIds 'k1XJrIkJ' \
    > test.out 2>&1
eval_tap $? 310 'PublicBulkGetItems' test.out

#- 311 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["ML7wGBPe", "JaIERAU0", "9bqzCdw4"]}' \
    > test.out 2>&1
eval_tap $? 311 'PublicValidateItemPurchaseCondition' test.out

#- 312 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'MEDIA' \
    --limit '34' \
    --offset '2' \
    --region 'OboAvQ7S' \
    --storeId 'FUjxp1HR' \
    --keyword 'uFoSHQhH' \
    --language 'XZZBSO7W' \
    > test.out 2>&1
eval_tap $? 312 'PublicSearchItems' test.out

#- 313 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'VVEd8dZX' \
    --namespace "$AB_NAMESPACE" \
    --language 'JgGRrQfJ' \
    --region 'syNtB387' \
    --storeId 'WG5h7QND' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetApp' test.out

#- 314 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '1pWUz628' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 314 'PublicGetItemDynamicData' test.out

#- 315 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '7AqzuXtI' \
    --namespace "$AB_NAMESPACE" \
    --language 'ETEPt6eU' \
    --populateBundle  \
    --region 'du1XityP' \
    --storeId 'bi2Wl0CE' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetItem' test.out

#- 316 GetPaymentCustomization
eval_tap 0 316 'GetPaymentCustomization # SKIP deprecated' test.out

#- 317 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "0tW86ncl", "paymentProvider": "STRIPE", "returnUrl": "8mx7Z5f3", "ui": "vKyLzoXe", "zipCode": "b3cjtR4k"}' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetPaymentUrl' test.out

#- 318 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jNbsYL6w' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetPaymentMethods' test.out

#- 319 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vZ3jhmZY' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUnpaidPaymentOrder' test.out

#- 320 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'oEGgUFsX' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'cYJBoL95' \
    --body '{"token": "TIVasXlD"}' \
    > test.out 2>&1
eval_tap $? 320 'Pay' test.out

#- 321 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'gCsuyc2l' \
    > test.out 2>&1
eval_tap $? 321 'PublicCheckPaymentOrderPaidStatus' test.out

#- 322 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'ECNxgqWw' \
    > test.out 2>&1
eval_tap $? 322 'GetPaymentPublicConfig' test.out

#- 323 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'vNcM9UmC' \
    > test.out 2>&1
eval_tap $? 323 'PublicGetQRCode' test.out

#- 324 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'BYCc3kHw' \
    --foreinginvoice 'yeQta9RD' \
    --invoiceId '9XB3TSJR' \
    --payload '5C4PGbnE' \
    --redirectResult 'P1sGmoU6' \
    --resultCode 'YRrCoTrw' \
    --sessionId 'MPaPDKOU' \
    --status 'bA1yQigo' \
    --token 'DPq93vPt' \
    --type 'EUdu73aA' \
    --userId 'iUukGck7' \
    --orderNo 'xzFJ2ANi' \
    --paymentOrderNo 'zCmGqVis' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'cK7pcDni' \
    > test.out 2>&1
eval_tap $? 324 'PublicNormalizePaymentReturnUrl' test.out

#- 325 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'DM44TqJO' \
    --paymentOrderNo 'sy2Pktw0' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 325 'GetPaymentTaxValue' test.out

#- 326 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'CRgNApeL' \
    > test.out 2>&1
eval_tap $? 326 'GetRewardByCode' test.out

#- 327 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'AZuY4Rte' \
    --limit '16' \
    --offset '82' \
    --sortBy 'rewardCode,namespace:asc' \
    > test.out 2>&1
eval_tap $? 327 'QueryRewards1' test.out

#- 328 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'UzwbyOtd' \
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
    --appIds '5vNLteF4,0LZeTfVH,LSSZ0FL2' \
    --itemIds 'IEAAjOZz,vE7IBMUU,xPfWH6V8' \
    --skus 'ukGNz0Gs,jinRjMut,tMLJLdVu' \
    > test.out 2>&1
eval_tap $? 330 'PublicExistsAnyMyActiveEntitlement' test.out

#- 331 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '63XTBLgX' \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 332 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId '8KnUCIJL' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 333 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'uafb6YSf' \
    > test.out 2>&1
eval_tap $? 333 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 334 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'eOodbkAD,L8ESMDyT,r7Xmw75F' \
    --itemIds 'BqXPtTLU,EPLEpB2q,O6ep3pUZ' \
    --skus 'bRoiHfqt,9UGJzf8S,rb4Mh1Eu' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetEntitlementOwnershipToken' test.out

#- 335 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'xi5zCpcD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'PublicGetMyWallet' test.out

#- 336 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'QIDoiUYc' \
    --body '{"epicGamesJwtToken": "7rnRttf4"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncEpicGameDLC' test.out

#- 337 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Syr9uarC' \
    --body '{"serviceLabel": 70}' \
    > test.out 2>&1
eval_tap $? 337 'PublicSyncPsnDlcInventory' test.out

#- 338 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'zzYvEScz' \
    --body '{"serviceLabels": [82, 85, 87]}' \
    > test.out 2>&1
eval_tap $? 338 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 339 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'eeHVaHdp' \
    --body '{"appId": "e0MxxVse", "steamId": "2x7vBtwA"}' \
    > test.out 2>&1
eval_tap $? 339 'SyncSteamDLC' test.out

#- 340 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '83MM2SEI' \
    --body '{"xstsToken": "xu5Hiygk"}' \
    > test.out 2>&1
eval_tap $? 340 'SyncXboxDLC' test.out

#- 341 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'YRg994yu' \
    --appType 'SOFTWARE' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'pFEjUh7M' \
    --features 'R2CKQy6B,H4EPZpkF,5goA2fkW' \
    --itemId 'tpl5WsPU,LKbhMxuj,mNKFj0Ht' \
    --limit '24' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 341 'PublicQueryUserEntitlements' test.out

#- 342 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'P2dlnLQB' \
    --appId '0tsNBsGc' \
    > test.out 2>&1
eval_tap $? 342 'PublicGetUserAppEntitlementByAppId' test.out

#- 343 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'BcEA7OOP' \
    --limit '57' \
    --offset '83' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 343 'PublicQueryUserEntitlementsByAppType' test.out

#- 344 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'RcNHbVJ5' \
    --entitlementClazz 'CODE' \
    --itemId 'HZ4pnkvr' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlementByItemId' test.out

#- 345 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'DB6J4QPH' \
    --entitlementClazz 'MEDIA' \
    --sku 'IFWTdYU2' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserEntitlementBySku' test.out

#- 346 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YtxysNno' \
    --appIds 'oM8uAqhT,CE9pPBOY,n2fTmvr2' \
    --itemIds '9kQrxZT2,LqTQ8U5J,Lmv9pBsf' \
    --skus 'Xoy6yfo9,GnhNU6MQ,Xukr7c6i' \
    > test.out 2>&1
eval_tap $? 346 'PublicExistsAnyUserActiveEntitlement' test.out

#- 347 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xsMqBOQ8' \
    --appId '3RXruDMg' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 348 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'q3n7hYEW' \
    --entitlementClazz 'CODE' \
    --itemId 'LF4vrz5g' \
    > test.out 2>&1
eval_tap $? 348 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 349 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'CVqS40iO' \
    --ids 'oP0X7wNY,QIRtpcvO,2R3BFBW0' \
    > test.out 2>&1
eval_tap $? 349 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 350 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'CT7gCfnB' \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'RG2klRLX' \
    > test.out 2>&1
eval_tap $? 350 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 351 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'KP7rxW0L' \
    --namespace "$AB_NAMESPACE" \
    --userId '5ODNRr17' \
    > test.out 2>&1
eval_tap $? 351 'PublicGetUserEntitlement' test.out

#- 352 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'CdmqfdBn' \
    --namespace "$AB_NAMESPACE" \
    --userId '2duRi0qx' \
    --body '{"options": ["GVbiLQjl", "Igvv1ppK", "nBRfNHuS"], "requestId": "zoMVdZsc", "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 352 'PublicConsumeUserEntitlement' test.out

#- 353 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'IjzV9hvP' \
    --body '{"code": "CcEYQwCt", "language": "WXSl_IGYw", "region": "Dx8W9elg"}' \
    > test.out 2>&1
eval_tap $? 353 'PublicRedeemCode' test.out

#- 354 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rp9g1WqJ' \
    --body '{"excludeOldTransactions": false, "language": "xFZ_lmOM", "productId": "vgIwVANE", "receiptData": "5KT1mPkW", "region": "1ya5qYxB", "transactionId": "Qsv3H6O1"}' \
    > test.out 2>&1
eval_tap $? 354 'PublicFulfillAppleIAPItem' test.out

#- 355 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'IPVzbIcI' \
    --body '{"epicGamesJwtToken": "7BMHM4cR"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncEpicGamesInventory' test.out

#- 356 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ulSoMnrT' \
    --body '{"autoAck": false, "language": "Mkg-XRow_076", "orderId": "VE4s7KSx", "packageName": "qpLfhy6g", "productId": "t4XVppMz", "purchaseTime": 70, "purchaseToken": "zV1BjVNh", "region": "UuBhtMP4"}' \
    > test.out 2>&1
eval_tap $? 356 'PublicFulfillGoogleIAPItem' test.out

#- 357 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZiUX0am' \
    --body '{"currencyCode": "lWXWxWLV", "price": 0.9608719714446786, "productId": "3fewKM3W", "serviceLabel": 83}' \
    > test.out 2>&1
eval_tap $? 357 'PublicReconcilePlayStationStore' test.out

#- 358 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'PsXOjvAy' \
    --body '{"currencyCode": "l6Ng0n9J", "price": 0.7149878927951042, "productId": "EEckz82e", "serviceLabels": [27, 41, 35]}' \
    > test.out 2>&1
eval_tap $? 358 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 359 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'nLvwRSWc' \
    --body '{"appId": "yCdCUNPj", "currencyCode": "gFx24ozH", "language": "UKIx_kjHV_789", "price": 0.33422234708945253, "productId": "PvFdG2kd", "region": "SmHeeZ67", "steamId": "cZV5KpuD"}' \
    > test.out 2>&1
eval_tap $? 359 'SyncSteamInventory' test.out

#- 360 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'qRCnG6oh' \
    --body '{"gameId": "CMHY19jE", "language": "Vr", "region": "EXmkz8Wd"}' \
    > test.out 2>&1
eval_tap $? 360 'SyncTwitchDropsEntitlement' test.out

#- 361 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'vFx9eszo' \
    --body '{"currencyCode": "1t8HDm69", "price": 0.5973273023115788, "productId": "YD6AFyTn", "xstsToken": "BmHkOF50"}' \
    > test.out 2>&1
eval_tap $? 361 'SyncXboxInventory' test.out

#- 362 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'U72LtC6H' \
    --itemId 'Yh7tifXW' \
    --limit '31' \
    --offset '10' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 362 'PublicQueryUserOrders' test.out

#- 363 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'vXqKJuXm' \
    --body '{"currencyCode": "tFjiz3yS", "discountedPrice": 5, "ext": {"wA9afyu0": {}, "31S3Lt3I": {}, "nIYnH6MO": {}}, "itemId": "4K0o1BDa", "language": "DXwo", "price": 34, "quantity": 20, "region": "jBqSzIg7", "returnUrl": "udaza9ty"}' \
    > test.out 2>&1
eval_tap $? 363 'PublicCreateUserOrder' test.out

#- 364 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jPR5SqBl' \
    --userId 'BwWTBXcf' \
    > test.out 2>&1
eval_tap $? 364 'PublicGetUserOrder' test.out

#- 365 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6KgFVrX3' \
    --userId 'SPz8bY6o' \
    > test.out 2>&1
eval_tap $? 365 'PublicCancelUserOrder' test.out

#- 366 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JAAvTfBp' \
    --userId 'pVb5VqYu' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetUserOrderHistories' test.out

#- 367 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'LGFwAMcU' \
    --userId 'WxmGCOg6' \
    > test.out 2>&1
eval_tap $? 367 'PublicDownloadUserOrderReceipt' test.out

#- 368 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3HmoNtc' \
    > test.out 2>&1
eval_tap $? 368 'PublicGetPaymentAccounts' test.out

#- 369 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'pMGIWrk7' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'NYXjBGHO' \
    > test.out 2>&1
eval_tap $? 369 'PublicDeletePaymentAccount' test.out

#- 370 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '1mPMEqNS' \
    --language 'jLqC5zsm' \
    --region 'bCcXuG5Q' \
    --storeId '8EpKF0qY' \
    --viewId '1qqf4jWE' \
    > test.out 2>&1
eval_tap $? 370 'PublicListActiveSections' test.out

#- 371 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'bFRAabb8' \
    --chargeStatus 'NEVER' \
    --itemId 'C9h8CcpL' \
    --limit '24' \
    --offset '71' \
    --sku 'G06KouE0' \
    --status 'EXPIRED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 371 'PublicQueryUserSubscriptions' test.out

#- 372 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'q1T82RFe' \
    --body '{"currencyCode": "xTJP45Lf", "itemId": "SnTUR9WY", "language": "KA_JA", "region": "o7PE0rVZ", "returnUrl": "Qk7VZ1B4", "source": "iuP5j3Zy"}' \
    > test.out 2>&1
eval_tap $? 372 'PublicSubscribeSubscription' test.out

#- 373 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'KSyx78qY' \
    --itemId 'hnsSJrJd' \
    > test.out 2>&1
eval_tap $? 373 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 374 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lKKDtMQa' \
    --userId 'Nr0d1zzU' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserSubscription' test.out

#- 375 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Sd0DtH84' \
    --userId 'QoD5uZn2' \
    > test.out 2>&1
eval_tap $? 375 'PublicChangeSubscriptionBillingAccount' test.out

#- 376 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'nNLR69Av' \
    --userId '4AETA863' \
    --body '{"immediate": true, "reason": "jGe2WSVV"}' \
    > test.out 2>&1
eval_tap $? 376 'PublicCancelSubscription' test.out

#- 377 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zAfCv5I4' \
    --userId '4tLWMVwr' \
    --excludeFree  \
    --limit '79' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetUserSubscriptionBillingHistories' test.out

#- 378 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'q5OdbrRj' \
    --language 'v039mDDP' \
    --storeId 'RN6a1InB' \
    > test.out 2>&1
eval_tap $? 378 'PublicListViews' test.out

#- 379 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '8nt2AMBJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zQDfx7bb' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetWallet' test.out

#- 380 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'ZMOYjYze' \
    --namespace "$AB_NAMESPACE" \
    --userId 'soDWZiu1' \
    --limit '81' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 380 'PublicListUserWalletTransactions' test.out

#- 381 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate '2EFjKVf6' \
    --baseAppId 'EQ6oWdgi' \
    --categoryPath '6n0PPE4s' \
    --features 'vJzWDaxa' \
    --includeSubCategoryItem  \
    --itemName 'GmBluEga' \
    --itemStatus 'ACTIVE' \
    --itemType 'CODE' \
    --limit '33' \
    --offset '92' \
    --region '6HpipyYA' \
    --sortBy 'createdAt:asc,displayOrder:asc' \
    --storeId 'DhNztqJK' \
    --tags 'bHoWGg0R' \
    --targetNamespace 'QPmEvYPY' \
    > test.out 2>&1
eval_tap $? 381 'QueryItems1' test.out

#- 382 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'uE0uBasb' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 382 'ImportStore1' test.out

#- 383 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'u9VMxddv' \
    --body '{"itemIds": ["GjQubGKb", "zeMJSKYi", "gzsiWLCk"]}' \
    > test.out 2>&1
eval_tap $? 383 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE