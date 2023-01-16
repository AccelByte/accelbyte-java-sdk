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
    --body '{"context": {"item": {"appId": "V7U1hc8E", "appType": "DEMO", "baseAppId": "hK7AbnvV", "boothName": "uObukQqR", "boundItemIds": ["vKjzoZ0X", "QMY4njCy", "zzrm8ltt"], "categoryPath": "cDngHwck", "clazz": "g8VWLn7p", "createdAt": "1983-01-14T00:00:00Z", "description": "wE3Od5Zf", "displayOrder": 60, "entitlementType": "CONSUMABLE", "ext": {"9Q1fx5Wy": {}, "8icnFdut": {}, "FTSMUAAg": {}}, "features": ["E0OI9GGR", "N6wPfccD", "HViiGWMI"], "fresh": true, "images": [{"as": "KRGBLJeb", "caption": "49sfSSMR", "height": 5, "imageUrl": "Hay711Ow", "smallImageUrl": "yj5mJyoe", "width": 85}, {"as": "yB2PA3wE", "caption": "hcf1BHhC", "height": 29, "imageUrl": "wB2G1SY6", "smallImageUrl": "TXfao8hK", "width": 66}, {"as": "AVI9YQ29", "caption": "uKq75Ylj", "height": 95, "imageUrl": "QjWgAng6", "smallImageUrl": "wE1wfckS", "width": 64}], "itemId": "pjVG9Law", "itemIds": ["zQL4HvCH", "uYIfi1uO", "dMrfzZ0o"], "itemQty": {"Uuv5YXCW": 2, "8s8S8xmk": 81, "c2cRM0pI": 63}, "itemType": "INGAMEITEM", "language": "6pYYsz1l", "listable": true, "localExt": {"ylnTYJg6": {}, "kEWOux07": {}, "EfMInLH3": {}}, "longDescription": "m8iEtR7u", "lootBoxConfig": {"rewardCount": 80, "rewards": [{"lootBoxItems": [{"count": 0, "itemId": "hhEcnNqq", "itemSku": "h0UIrCun", "itemType": "baGKCP2V"}, {"count": 47, "itemId": "sAjScPDV", "itemSku": "qr86M8dH", "itemType": "8UinGZYM"}, {"count": 56, "itemId": "OGnswPXp", "itemSku": "Fo2ZEWyV", "itemType": "3qhpQSaa"}], "name": "IsfWGxHc", "odds": 0.054360996463355016, "type": "PROBABILITY_GROUP", "weight": 64}, {"lootBoxItems": [{"count": 27, "itemId": "bjgMM4kW", "itemSku": "aW4bRK89", "itemType": "H9b7O1VA"}, {"count": 23, "itemId": "3GxHR73W", "itemSku": "bY3WIO9D", "itemType": "4RlrOAum"}, {"count": 64, "itemId": "rkHGr58E", "itemSku": "ePDyhxgx", "itemType": "8F1H4Wlo"}], "name": "xhhzfjCz", "odds": 0.7450832533014499, "type": "PROBABILITY_GROUP", "weight": 76}, {"lootBoxItems": [{"count": 86, "itemId": "Z6WCEmcP", "itemSku": "MwPTrCna", "itemType": "hm6kG5vH"}, {"count": 37, "itemId": "OSS8tDTO", "itemSku": "58nu0iZ2", "itemType": "mOe99nti"}, {"count": 24, "itemId": "nwsx9h7V", "itemSku": "F9DODP4A", "itemType": "w1QenIm3"}], "name": "a7DKTJNe", "odds": 0.046837104945871566, "type": "REWARD", "weight": 62}]}, "maxCount": 66, "maxCountPerUser": 35, "name": "4nkeQwGM", "namespace": "Lj8xPoMP", "optionBoxConfig": {"boxItems": [{"count": 3, "itemId": "7LQE5coU", "itemSku": "ilgX5dEo", "itemType": "ry2ZBXQi"}, {"count": 82, "itemId": "HkG68sqz", "itemSku": "yLiZmpMF", "itemType": "RpapP6dV"}, {"count": 71, "itemId": "ofiRnSL2", "itemSku": "3hxm2aq0", "itemType": "muuiaWkt"}]}, "purchasable": true, "purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 26, "comparison": "isLessThan", "name": "3wxHz5Vg", "predicateType": "EntitlementPredicate", "value": "s4pCLa9I", "values": ["b5rcQlK6", "2KOyR61d", "8zSpDRBJ"]}, {"anyOf": 38, "comparison": "isGreaterThanOrEqual", "name": "IIO4bmoV", "predicateType": "SeasonTierPredicate", "value": "7UQSuyPc", "values": ["TZ1BLD0p", "RlxR96oY", "Dbh3TF5d"]}, {"anyOf": 49, "comparison": "is", "name": "fjdwJzeQ", "predicateType": "SeasonPassPredicate", "value": "3O7r0GLi", "values": ["twsdqYb3", "2g58OLYA", "NxA2tRF1"]}]}, {"operator": "or", "predicates": [{"anyOf": 42, "comparison": "isNot", "name": "cYdh7HHD", "predicateType": "EntitlementPredicate", "value": "zJ10KWL8", "values": ["DOZQnHrV", "W904i541", "4VMEmopM"]}, {"anyOf": 60, "comparison": "isGreaterThanOrEqual", "name": "0NLgOyJL", "predicateType": "SeasonPassPredicate", "value": "QRfS1m2p", "values": ["Tkn75cL6", "oVyWEh6A", "jA1UDLVS"]}, {"anyOf": 27, "comparison": "isLessThanOrEqual", "name": "JD1Q0VRm", "predicateType": "SeasonPassPredicate", "value": "dRbtcURv", "values": ["sX7oAie2", "4sjaYkrQ", "kAVDaszE"]}]}, {"operator": "and", "predicates": [{"anyOf": 37, "comparison": "isLessThanOrEqual", "name": "U8aC7KDa", "predicateType": "SeasonTierPredicate", "value": "PCuWEpkD", "values": ["Cg7JOl6f", "JAcgc6YI", "B5xMze7F"]}, {"anyOf": 62, "comparison": "is", "name": "HWYKju6F", "predicateType": "EntitlementPredicate", "value": "bxaOqTPH", "values": ["cymqhVug", "IhX60WF5", "KvGtSmtI"]}, {"anyOf": 90, "comparison": "excludes", "name": "9Ui1EUW0", "predicateType": "SeasonPassPredicate", "value": "3T8ndrpC", "values": ["kW3w05UK", "vsihLUvQ", "nziMQlMJ"]}]}]}, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 50, "fixedTrialCycles": 80, "graceDays": 75}, "region": "PyDbJrgN", "regionData": [{"currencyCode": "X7wDOwJF", "currencyNamespace": "XPwVAKxj", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1972-05-17T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1977-05-11T00:00:00Z", "discountedPrice": 23, "expireAt": "1991-01-13T00:00:00Z", "price": 98, "purchaseAt": "1972-05-26T00:00:00Z", "trialPrice": 100}, {"currencyCode": "NoFvpl8Z", "currencyNamespace": "J7hKkgaC", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1981-06-13T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1987-08-14T00:00:00Z", "discountedPrice": 32, "expireAt": "1978-07-04T00:00:00Z", "price": 3, "purchaseAt": "1988-08-04T00:00:00Z", "trialPrice": 39}, {"currencyCode": "L7iVz8n2", "currencyNamespace": "Vn9A7Tgz", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1972-09-10T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1975-03-16T00:00:00Z", "discountedPrice": 56, "expireAt": "1990-01-07T00:00:00Z", "price": 93, "purchaseAt": "1996-03-08T00:00:00Z", "trialPrice": 0}], "seasonType": "TIER", "sku": "CR8GaWQm", "stackable": true, "status": "ACTIVE", "tags": ["EJsvriYC", "b3mGwuzi", "IEmjnEGO"], "targetCurrencyCode": "w08S83GS", "targetItemId": "1CoNGYSp", "targetNamespace": "ICQYVkQB", "thumbnailUrl": "Wr9FjqvH", "title": "e11bgpNn", "updatedAt": "1995-08-01T00:00:00Z", "useCount": 25}, "namespace": "Zco5nKX3", "order": {"currency": {"currencyCode": "r8z1apjM", "currencySymbol": "1ApeHsdB", "currencyType": "VIRTUAL", "decimals": 81, "namespace": "hZTDMVP6"}, "ext": {"XsFb2LIK": {}, "6iIDHRnB": {}, "pCCqgUcX": {}}, "free": false}, "source": "GIFT"}, "script": "tbHieO9O", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'st9E75pH' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'HruegkLc' \
    --body '{"grantDays": "hhyFkANI"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id '2zETqjIZ' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'al2d8cor' \
    --body '{"grantDays": "EaMh1lEb"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 8 'ListItemTypeConfigs' test.out

#- 9 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "TCLeBhqF", "dryRun": true, "fulfillmentUrl": "YFajo7hi", "itemType": "LOOTBOX", "purchaseConditionUrl": "ueYkpK8U"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateItemTypeConfig' test.out

#- 10 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz 'cLDW2ly2' \
    --itemType 'BUNDLE' \
    > test.out 2>&1
eval_tap $? 10 'SearchItemTypeConfig' test.out

#- 11 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id '4TxNRpYy' \
    > test.out 2>&1
eval_tap $? 11 'GetItemTypeConfig' test.out

#- 12 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'L7Kzh8ZO' \
    --body '{"clazz": "Kx6pe6Ph", "dryRun": false, "fulfillmentUrl": "b7jQojwH", "purchaseConditionUrl": "5KSIOFsJ"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateItemTypeConfig' test.out

#- 13 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'uSC1pYQR' \
    > test.out 2>&1
eval_tap $? 13 'DeleteItemTypeConfig' test.out

#- 14 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --name 'UxiR9pD7' \
    --offset '40' \
    --tag '6IawcpR5' \
    > test.out 2>&1
eval_tap $? 14 'QueryCampaigns' test.out

#- 15 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "MzAIM1bo", "items": [{"extraSubscriptionDays": 76, "itemId": "hemiS256", "itemName": "2FZIUpaZ", "quantity": 13}, {"extraSubscriptionDays": 81, "itemId": "kS6ccKgx", "itemName": "O10ItAsk", "quantity": 94}, {"extraSubscriptionDays": 95, "itemId": "zZAgAc2S", "itemName": "q1d2NTug", "quantity": 92}], "maxRedeemCountPerCampaignPerUser": 69, "maxRedeemCountPerCode": 25, "maxRedeemCountPerCodePerUser": 66, "maxSaleCount": 56, "name": "1TMPgaKd", "redeemEnd": "1987-03-30T00:00:00Z", "redeemStart": "1985-03-06T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["YnfJVn9I", "mbNqL4nY", "sVVDykf1"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateCampaign' test.out

#- 16 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'QB0c017l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetCampaign' test.out

#- 17 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'Y3TEMKSQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "HDgAUhZX", "items": [{"extraSubscriptionDays": 3, "itemId": "lkbfnIyf", "itemName": "S8ZUTJ4g", "quantity": 19}, {"extraSubscriptionDays": 73, "itemId": "4SuSEU1b", "itemName": "hbou5q0Q", "quantity": 58}, {"extraSubscriptionDays": 37, "itemId": "Buwgau9v", "itemName": "Rb6PFWny", "quantity": 96}], "maxRedeemCountPerCampaignPerUser": 52, "maxRedeemCountPerCode": 52, "maxRedeemCountPerCodePerUser": 62, "maxSaleCount": 70, "name": "gMROaQ7p", "redeemEnd": "1988-05-28T00:00:00Z", "redeemStart": "1979-12-26T00:00:00Z", "redeemType": "ITEM", "status": "ACTIVE", "tags": ["5d0MaHHT", "YQ2JSlU2", "NwL8nQ1o"]}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCampaign' test.out

#- 18 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId 'GXR3vrCS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCampaignDynamic' test.out

#- 19 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nPfotqJP' \
    > test.out 2>&1
eval_tap $? 19 'GetRootCategories' test.out

#- 20 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'SwCyEYSn' \
    --body '{"categoryPath": "1MTUWRva", "localizationDisplayNames": {"gg5nvVFp": "xFBeOXZp", "EuA8sncj": "TRi3ldA2", "XQKufTLq": "b9ZSHC7F"}}' \
    > test.out 2>&1
eval_tap $? 20 'CreateCategory' test.out

#- 21 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cWLqlTmk' \
    > test.out 2>&1
eval_tap $? 21 'ListCategoriesBasic' test.out

#- 22 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath '6FejqkL9' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tD6bQCZE' \
    > test.out 2>&1
eval_tap $? 22 'GetCategory' test.out

#- 23 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'JwQuPETC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eADWhBwS' \
    --body '{"localizationDisplayNames": {"KodVLsSA": "ursSg2j5", "Fg3DuXCV": "m1h4yBAP", "B4L0IIG4": "iIMrjyWk"}}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateCategory' test.out

#- 24 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'ffMa9lRD' \
    --namespace "$AB_NAMESPACE" \
    --storeId '17Uadiwz' \
    > test.out 2>&1
eval_tap $? 24 'DeleteCategory' test.out

#- 25 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'IBaJkvKC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HQ28bUb6' \
    > test.out 2>&1
eval_tap $? 25 'GetChildCategories' test.out

#- 26 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '3w5uatDo' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tkk3GQ9x' \
    > test.out 2>&1
eval_tap $? 26 'GetDescendantCategories' test.out

#- 27 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId '9Sb2f1OK' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '34' \
    --code 'edgOBqQe' \
    --limit '80' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 27 'QueryCodes' test.out

#- 28 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'GOwX7Hw0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 20}' \
    > test.out 2>&1
eval_tap $? 28 'CreateCodes' test.out

#- 29 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'njDhp06B' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '9' \
    > test.out 2>&1
eval_tap $? 29 'Download' test.out

#- 30 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'kR1Hn5Nu' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '41' \
    > test.out 2>&1
eval_tap $? 30 'BulkDisableCodes' test.out

#- 31 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'Dv1vyYIM' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '24' \
    > test.out 2>&1
eval_tap $? 31 'BulkEnableCodes' test.out

#- 32 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'UDDBFWXV' \
    --namespace "$AB_NAMESPACE" \
    --code 'O2vK1BLp' \
    --limit '56' \
    --offset '44' \
    --userId '6SMbX84G' \
    > test.out 2>&1
eval_tap $? 32 'QueryRedeemHistory' test.out

#- 33 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'rYOcJNYc' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 33 'GetCode' test.out

#- 34 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'xlCP0bki' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'DisableCode' test.out

#- 35 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code '9lBXpBzQ' \
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
    --body '{"grpcServerAddress": "BkhiTQsS"}' \
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
    --body '{"currencyCode": "9PkHG6ki", "currencySymbol": "7396NbS6", "currencyType": "REAL", "decimals": 25, "localizationDescriptions": {"dkCprpQk": "cgLL0KnK", "IWlcSdgP": "Vewn2cDu", "mPud2wUq": "u84nl8O3"}}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCurrency' test.out

#- 41 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '4dbF1TbL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"TvheTfSd": "4RKtqD8m", "VwekWh9g": "UyxXwCJn", "UGVzzlu1": "iauZ0S8s"}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateCurrency' test.out

#- 42 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode '7APhJLa2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteCurrency' test.out

#- 43 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'czmrFWCz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetCurrencyConfig' test.out

#- 44 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'QKMG4RNY' \
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
    --body '{"data": [{"id": "8egm8oRI", "rewards": [{"currency": {"currencyCode": "1eLxXScu", "namespace": "2Zn9VqQG"}, "item": {"itemId": "sot9H109", "itemSku": "DNm9ZuuE", "itemType": "IkvCCXoB"}, "quantity": 18, "type": "CURRENCY"}, {"currency": {"currencyCode": "RP5mnEOM", "namespace": "3rpq67It"}, "item": {"itemId": "sxXzVfxR", "itemSku": "YvuaA4sz", "itemType": "IVv61xM1"}, "quantity": 90, "type": "CURRENCY"}, {"currency": {"currencyCode": "sYpOcamN", "namespace": "IojTkV1y"}, "item": {"itemId": "dupCIzy2", "itemSku": "CYpTSgnc", "itemType": "5x06hm87"}, "quantity": 1, "type": "ITEM"}]}, {"id": "etMpuT4i", "rewards": [{"currency": {"currencyCode": "248p5Lwu", "namespace": "DYNY6xvq"}, "item": {"itemId": "jcCutJGU", "itemSku": "HozwJr7d", "itemType": "FeQ7YSme"}, "quantity": 47, "type": "ITEM"}, {"currency": {"currencyCode": "UcFucyub", "namespace": "OxyZlejI"}, "item": {"itemId": "YQhUmfUk", "itemSku": "sQryJXoN", "itemType": "ukLKY48d"}, "quantity": 83, "type": "ITEM"}, {"currency": {"currencyCode": "Ke5MnbN2", "namespace": "sRybXQ18"}, "item": {"itemId": "MNotyKDW", "itemSku": "1XBuGeft", "itemType": "dqIfoXL7"}, "quantity": 68, "type": "ITEM"}]}, {"id": "FXiZgE6A", "rewards": [{"currency": {"currencyCode": "ewdXJCt2", "namespace": "aKMnxgvS"}, "item": {"itemId": "EzLD86Vd", "itemSku": "DDNLP4cK", "itemType": "R0jhX6VR"}, "quantity": 9, "type": "CURRENCY"}, {"currency": {"currencyCode": "CGT10T9B", "namespace": "JT169Eb0"}, "item": {"itemId": "q4sgQt1i", "itemSku": "B3YEB6NC", "itemType": "2zoopkik"}, "quantity": 71, "type": "ITEM"}, {"currency": {"currencyCode": "2d1RU7Oh", "namespace": "lhTtPIsU"}, "item": {"itemId": "MhdBUww2", "itemSku": "QnCh6Ylp", "itemType": "6xAFMDji"}, "quantity": 25, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"1EKMx2oE": "E3H6c0Sp", "wq4s5T7E": "097vkdfh", "LbdgCwxt": "UjSfo8aj"}}, {"platform": "STEAM", "platformDlcIdMap": {"jLJyWbDr": "8jZibgEb", "RHmnZWDF": "NaziVTYz", "v6TBv11X": "7rRoepo9"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"ay8PSxkK": "yKueGBGB", "lOeMcbgV": "gQ3H7lzl", "nMk2QSaC": "PKERASw6"}}]}' \
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
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'JCCzwvfL' \
    --itemId 'KdP5VSbs,MbTCByPP,cCpuw55q' \
    --limit '47' \
    --offset '92' \
    --userId 'eDaNEEgB' \
    > test.out 2>&1
eval_tap $? 51 'QueryEntitlements' test.out

#- 52 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'nBgcqE1p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetEntitlement' test.out

#- 53 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '9' \
    --status 'SUCCESS' \
    --userId '9ZvR7aF8' \
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
    --body '{"bundleId": "B3GEFDCb", "password": "pz9pEJqG"}' \
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
    --body '{"sandboxId": "QTVOPrSU"}' \
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
    --body '{"applicationName": "19nE7Fyp", "serviceAccountId": "8uYKftaj"}' \
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
    --body '{"data": [{"itemIdentity": "zHCdfkar", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"acSdlx2W": "33QaG58w", "S9tw0Do5": "mbeURW25", "qJnRUEiV": "wGXunWkC"}}, {"itemIdentity": "WYJbmfxc", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"qkpHdO8v": "Xqky2PH5", "y6s6PzLH": "XWKvzpGA", "bnyhoB8O": "Nj32tnmC"}}, {"itemIdentity": "s6XkRZVs", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"1Krg1VtS": "AojwlYkR", "JC7wBvy1": "neHcYVVs", "GGfNBAa7": "7xNgWBvv"}}]}' \
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
    --body '{"environment": "OjOfolat"}' \
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
    --body '{"appId": "7ERaNT7m", "publisherAuthenticationKey": "xUGWSTt3"}' \
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
    --body '{"clientId": "qdYm8F1n", "clientSecret": "wxBLaCzJ", "organizationId": "k3dnuHUM"}' \
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
    --body '{"relyingPartyCert": "BaGR3xko"}' \
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
    --password 'Ledqm2g8' \
    > test.out 2>&1
eval_tap $? 82 'UpdateXblBPCertFile' test.out

#- 83 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --feature 'jFK5dwbt' \
    --itemId 'YoDK77Hj' \
    --itemType 'INGAMEITEM' \
    --endTime 'YV6gNQQw' \
    --startTime 'cXLhel03' \
    > test.out 2>&1
eval_tap $? 83 'DownloadInvoiceDetails' test.out

#- 84 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --feature 'vQfgiqD4' \
    --itemId 'ZfO4Qqf3' \
    --itemType 'SEASON' \
    --endTime 'ZJtACRUj' \
    --startTime '1vjCK7sT' \
    > test.out 2>&1
eval_tap $? 84 'GenerateInvoiceSummary' test.out

#- 85 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'lTHkAgyL' \
    --body '{"categoryPath": "3GqNlaz4", "targetItemId": "tgXSoSnc", "targetNamespace": "kCOah0xb"}' \
    > test.out 2>&1
eval_tap $? 85 'SyncInGameItem' test.out

#- 86 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E3Acwksy' \
    --body '{"appId": "MwO1DPjN", "appType": "GAME", "baseAppId": "DUVzSjWh", "boothName": "nr5j6WoX", "categoryPath": "5vIQOC1f", "clazz": "ws1XQZMj", "displayOrder": 57, "entitlementType": "DURABLE", "ext": {"VKEUFHpT": {}, "pOE7ZQov": {}, "MEhHNeuM": {}}, "features": ["ASlyV39a", "amdoEqOR", "FwWEzkoU"], "images": [{"as": "0FCvXeAY", "caption": "SXHD6L3V", "height": 16, "imageUrl": "KOTCIm2H", "smallImageUrl": "Sa19a6Zs", "width": 5}, {"as": "InnBPW15", "caption": "X1JlmhBz", "height": 23, "imageUrl": "Lz16xmme", "smallImageUrl": "S2nrXk9m", "width": 76}, {"as": "xHy4BvDA", "caption": "9DN9rt44", "height": 10, "imageUrl": "rGYyMP7i", "smallImageUrl": "C3d8sKfv", "width": 3}], "itemIds": ["5jIa6JKR", "wPIiBACc", "q4N4J2U5"], "itemQty": {"aZ1OrDtc": 91, "FbWKtt9M": 68, "oYb5tsu6": 79}, "itemType": "CODE", "listable": true, "localizations": {"au0PpyG9": {"description": "ASSgl1w2", "localExt": {"wbCV40cU": {}, "3iiWu61H": {}, "c7m0DWLg": {}}, "longDescription": "R3ODTN2v", "title": "0ETeENvC"}, "g06RyKgP": {"description": "MH7uLeP9", "localExt": {"MRCOV9fT": {}, "mkis8NCb": {}, "gMtXQaaC": {}}, "longDescription": "7TQWmKuH", "title": "BJ9ByDWS"}, "QkGpIJN4": {"description": "kkYhiINy", "localExt": {"Pp3E9NBA": {}, "1WSc4ye5": {}, "PIakaV1u": {}}, "longDescription": "bw8sN41t", "title": "z240EKHt"}}, "lootBoxConfig": {"rewardCount": 69, "rewards": [{"lootBoxItems": [{"count": 20, "itemId": "7szpJGda", "itemSku": "dBTQ1U7B", "itemType": "W6C3OmCQ"}, {"count": 64, "itemId": "sMMvRfTY", "itemSku": "IThbKssg", "itemType": "VjUP7UdR"}, {"count": 86, "itemId": "1xasNs7J", "itemSku": "WH7p6nT1", "itemType": "muVN04ad"}], "name": "6fK0mhLv", "odds": 0.1588993374063299, "type": "REWARD_GROUP", "weight": 75}, {"lootBoxItems": [{"count": 27, "itemId": "BUDAKCjh", "itemSku": "5Bel0xCq", "itemType": "DEydjgR3"}, {"count": 90, "itemId": "VUmWglY1", "itemSku": "8lDsk1Pu", "itemType": "Kis7uD99"}, {"count": 42, "itemId": "X7VmTim7", "itemSku": "0TVKGTAO", "itemType": "GirsEfdu"}], "name": "swmVaL8P", "odds": 0.6096257422994317, "type": "REWARD_GROUP", "weight": 35}, {"lootBoxItems": [{"count": 32, "itemId": "ihWfjvPv", "itemSku": "VHg4S3Xy", "itemType": "Sbk8s6gG"}, {"count": 84, "itemId": "L26s3KHd", "itemSku": "48YZDn4L", "itemType": "FdSDZhsm"}, {"count": 18, "itemId": "ksanLsdW", "itemSku": "yXFRdkLs", "itemType": "AWRXKAPj"}], "name": "1zyiGGGi", "odds": 0.4250746353700523, "type": "PROBABILITY_GROUP", "weight": 30}]}, "maxCount": 31, "maxCountPerUser": 64, "name": "8NwLP3Wo", "optionBoxConfig": {"boxItems": [{"count": 46, "itemId": "cFpbP6Cn", "itemSku": "NXxYLkk5", "itemType": "t7wEL6mI"}, {"count": 82, "itemId": "wr8lgEld", "itemSku": "AXkfE0gs", "itemType": "hgHyqDEA"}, {"count": 52, "itemId": "byrDpfna", "itemSku": "QHFH96bf", "itemType": "G1WBokp8"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 86, "fixedTrialCycles": 17, "graceDays": 71}, "regionData": {"ZaX3SN1h": [{"currencyCode": "XKg0WJKy", "currencyNamespace": "5liV9Sqg", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1993-05-06T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1981-03-06T00:00:00Z", "discountedPrice": 81, "expireAt": "1978-12-28T00:00:00Z", "price": 1, "purchaseAt": "1981-07-09T00:00:00Z", "trialPrice": 22}, {"currencyCode": "3oa9KHzO", "currencyNamespace": "tLC4sGgk", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1985-07-30T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1996-01-15T00:00:00Z", "discountedPrice": 73, "expireAt": "1979-12-03T00:00:00Z", "price": 69, "purchaseAt": "1975-06-02T00:00:00Z", "trialPrice": 90}, {"currencyCode": "uPdx8zN9", "currencyNamespace": "J470sQwf", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1971-11-15T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1999-03-13T00:00:00Z", "discountedPrice": 4, "expireAt": "1971-02-24T00:00:00Z", "price": 77, "purchaseAt": "1986-04-22T00:00:00Z", "trialPrice": 57}], "BtljQWAy": [{"currencyCode": "zO5QOAg0", "currencyNamespace": "3Dyb5SO7", "currencyType": "VIRTUAL", "discountAmount": 48, "discountExpireAt": "1988-09-01T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1990-07-13T00:00:00Z", "discountedPrice": 89, "expireAt": "1975-08-18T00:00:00Z", "price": 67, "purchaseAt": "1973-10-23T00:00:00Z", "trialPrice": 59}, {"currencyCode": "gPE29tOJ", "currencyNamespace": "3cIFEcg8", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1986-03-16T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1973-10-17T00:00:00Z", "discountedPrice": 5, "expireAt": "1994-01-05T00:00:00Z", "price": 9, "purchaseAt": "1973-01-02T00:00:00Z", "trialPrice": 9}, {"currencyCode": "V0UuK1UN", "currencyNamespace": "ztThPQEa", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1998-08-12T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1974-09-17T00:00:00Z", "discountedPrice": 5, "expireAt": "1988-03-09T00:00:00Z", "price": 40, "purchaseAt": "1997-06-08T00:00:00Z", "trialPrice": 76}], "SGBYRg2i": [{"currencyCode": "71hoDMAa", "currencyNamespace": "4LkR8jXW", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1980-10-18T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1975-01-11T00:00:00Z", "discountedPrice": 50, "expireAt": "1973-11-24T00:00:00Z", "price": 5, "purchaseAt": "1973-11-27T00:00:00Z", "trialPrice": 51}, {"currencyCode": "Ryq5Y7jz", "currencyNamespace": "5JYxptKl", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1990-08-01T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1978-04-19T00:00:00Z", "discountedPrice": 90, "expireAt": "1974-10-10T00:00:00Z", "price": 18, "purchaseAt": "1992-07-14T00:00:00Z", "trialPrice": 23}, {"currencyCode": "HMIISlRD", "currencyNamespace": "jZWftXJG", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1989-10-23T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1979-12-16T00:00:00Z", "discountedPrice": 74, "expireAt": "1998-07-02T00:00:00Z", "price": 62, "purchaseAt": "1973-06-22T00:00:00Z", "trialPrice": 86}]}, "seasonType": "TIER", "sku": "cDo7jOQj", "stackable": false, "status": "INACTIVE", "tags": ["9N8n2COw", "xy16ynBQ", "jr5gCQuE"], "targetCurrencyCode": "U9qa2I9x", "targetNamespace": "zsuB1IUZ", "thumbnailUrl": "VfBrzvFU", "useCount": 32}' \
    > test.out 2>&1
eval_tap $? 86 'CreateItem' test.out

#- 87 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'EU3iLHf7' \
    --appId 'BMoPmtFq' \
    > test.out 2>&1
eval_tap $? 87 'GetItemByAppId' test.out

#- 88 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate '3tQBIm3O' \
    --baseAppId '17Riys6O' \
    --categoryPath 'nHIityan' \
    --features '83LZKDph' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --limit '13' \
    --offset '62' \
    --region 'Q70iM6jV' \
    --sortBy 'name,createdAt:asc' \
    --storeId 'Vb43usZd' \
    --tags 'fnWjnxK4' \
    --targetNamespace '5OCOFJl8' \
    > test.out 2>&1
eval_tap $? 88 'QueryItems' test.out

#- 89 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'DT6A4FO0,rDHAyDgs,LC551THN' \
    > test.out 2>&1
eval_tap $? 89 'ListBasicItemsByFeatures' test.out

#- 90 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'JolnNZOo' \
    --sku 'kEjPRLim' \
    > test.out 2>&1
eval_tap $? 90 'GetItemBySku' test.out

#- 91 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'vPQm5yZM' \
    --populateBundle  \
    --region 'BP6g6p9D' \
    --storeId 'aTOIKKZq' \
    --sku 'jU4Ti3L0' \
    > test.out 2>&1
eval_tap $? 91 'GetLocaleItemBySku' test.out

#- 92 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '6vBxOC4k' \
    --sku 'LpRFNX5a' \
    > test.out 2>&1
eval_tap $? 92 'GetItemIdBySku' test.out

#- 93 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '2zVKMqNr,VB19O5Xs,2T9qLHSs' \
    --storeId 'ojlYhBGy' \
    > test.out 2>&1
eval_tap $? 93 'GetBulkItemIdBySkus' test.out

#- 94 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'D7LwcULJ' \
    --region 'rczVVhcz' \
    --storeId 'zYrXMGpc' \
    --itemIds 'wzBjTkMd' \
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
    --userId '1eOW1sHV' \
    --body '{"itemIds": ["ju4IwllX", "gCfESgah", "aluh8KfM"]}' \
    > test.out 2>&1
eval_tap $? 96 'ValidateItemPurchaseCondition' test.out

#- 97 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'APP' \
    --limit '22' \
    --offset '88' \
    --sortBy 'pafXNp4l' \
    --storeId 's8GaFFe9' \
    --keyword 'wtfpxwBt' \
    --language 'B4B9zwON' \
    > test.out 2>&1
eval_tap $? 97 'SearchItems' test.out

#- 98 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '57' \
    --offset '46' \
    --sortBy 'displayOrder:asc,name,updatedAt' \
    --storeId 'XQSaRVoH' \
    > test.out 2>&1
eval_tap $? 98 'QueryUncategorizedItems' test.out

#- 99 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'f2s9sW1z' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'b1opPPZZ' \
    > test.out 2>&1
eval_tap $? 99 'GetItem' test.out

#- 100 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'tlNnFXHx' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Kds5tBF3' \
    --body '{"appId": "5FQoJImF", "appType": "DLC", "baseAppId": "JaO1qhsY", "boothName": "fUGZrFym", "categoryPath": "GomuKKS5", "clazz": "PKVCWbLX", "displayOrder": 43, "entitlementType": "DURABLE", "ext": {"KiEUrFhQ": {}, "dMPSPyFW": {}, "MdP4qecy": {}}, "features": ["Y9a9SGHy", "ZWYdwCUQ", "xE4r4Sbb"], "images": [{"as": "m1NmqDVk", "caption": "44y6VfYT", "height": 99, "imageUrl": "QrwYQNF9", "smallImageUrl": "GWIVeysf", "width": 6}, {"as": "XfYpWadX", "caption": "s954YubP", "height": 71, "imageUrl": "OKRgr0gs", "smallImageUrl": "UtsLdSPv", "width": 73}, {"as": "lEG2FJ8X", "caption": "Rv1Cj7U7", "height": 61, "imageUrl": "DCMY4OZr", "smallImageUrl": "wkDo9Z2g", "width": 4}], "itemIds": ["rACSVfgt", "PcqsAGUz", "mQvzgQeJ"], "itemQty": {"jrgKe9yt": 26, "PiOD0zI6": 4, "h7XULWFB": 63}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"W6owdhIv": {"description": "82kx3eqh", "localExt": {"tW4MWmB4": {}, "qfdHQ7oY": {}, "n8GmYW3R": {}}, "longDescription": "w1S5ivhU", "title": "0cY5fyX6"}, "sPJnL1Vf": {"description": "rSXxDg32", "localExt": {"qwYksMi3": {}, "hG2ldvvu": {}, "AA7pNb3a": {}}, "longDescription": "BijzuXUd", "title": "5SevyzMo"}, "Bj3FetTk": {"description": "ZItH61IL", "localExt": {"2bCJsSxf": {}, "YpfZXkH2": {}, "fX9Bek5n": {}}, "longDescription": "CgeMBWVi", "title": "I4q1M2et"}}, "lootBoxConfig": {"rewardCount": 50, "rewards": [{"lootBoxItems": [{"count": 71, "itemId": "CUtujY1X", "itemSku": "wflLBrzE", "itemType": "94fNCOEU"}, {"count": 81, "itemId": "i8azS6J3", "itemSku": "P1RRD2Z8", "itemType": "N80Erj9F"}, {"count": 95, "itemId": "BaCJXR88", "itemSku": "mag9lZe1", "itemType": "wVkcqFDY"}], "name": "iAzpv8d9", "odds": 0.828703176397101, "type": "REWARD", "weight": 16}, {"lootBoxItems": [{"count": 9, "itemId": "6B8LPnhu", "itemSku": "toqbVNXY", "itemType": "dxouPtTo"}, {"count": 65, "itemId": "GIo7c07s", "itemSku": "thwnyt9t", "itemType": "2P4703jI"}, {"count": 83, "itemId": "xiM6oQWM", "itemSku": "0HCigyVj", "itemType": "IKxlG4HJ"}], "name": "4dpZelg8", "odds": 0.44433816915773894, "type": "REWARD", "weight": 65}, {"lootBoxItems": [{"count": 21, "itemId": "ABtMZRep", "itemSku": "qPRczQz2", "itemType": "L267tENm"}, {"count": 23, "itemId": "oYDg0Y1S", "itemSku": "zzLMSUWG", "itemType": "FyCB7bNi"}, {"count": 38, "itemId": "xeG6Zzt0", "itemSku": "BeqKhVg2", "itemType": "zYAUzpGx"}], "name": "4MFCu6BY", "odds": 0.12890913033297668, "type": "REWARD_GROUP", "weight": 56}]}, "maxCount": 67, "maxCountPerUser": 50, "name": "TKfPNfZf", "optionBoxConfig": {"boxItems": [{"count": 5, "itemId": "G7Jyq0Kn", "itemSku": "wuM9bl7n", "itemType": "0Q6AgOwY"}, {"count": 86, "itemId": "MAMir7kx", "itemSku": "5Hl5dcLH", "itemType": "VKtOyEWU"}, {"count": 97, "itemId": "9OUJTvmA", "itemSku": "uTpP0iUG", "itemType": "aB9ii6U6"}]}, "purchasable": false, "recurring": {"cycle": "MONTHLY", "fixedFreeDays": 33, "fixedTrialCycles": 97, "graceDays": 16}, "regionData": {"7SWpwROH": [{"currencyCode": "XQcD3f58", "currencyNamespace": "5yuR1vwE", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1996-03-08T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1979-07-28T00:00:00Z", "discountedPrice": 11, "expireAt": "1971-05-03T00:00:00Z", "price": 85, "purchaseAt": "1995-11-24T00:00:00Z", "trialPrice": 62}, {"currencyCode": "7LTAf9NH", "currencyNamespace": "2I6YHS43", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1983-08-27T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1994-04-03T00:00:00Z", "discountedPrice": 81, "expireAt": "1971-01-22T00:00:00Z", "price": 12, "purchaseAt": "1991-05-31T00:00:00Z", "trialPrice": 36}, {"currencyCode": "t8WxNEnG", "currencyNamespace": "9Nrmb9vl", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1978-10-28T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1990-03-19T00:00:00Z", "discountedPrice": 68, "expireAt": "1986-08-09T00:00:00Z", "price": 97, "purchaseAt": "1995-07-20T00:00:00Z", "trialPrice": 67}], "k9Xg3OXT": [{"currencyCode": "NaUhveyq", "currencyNamespace": "7CXnmGUE", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1998-04-29T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1992-07-22T00:00:00Z", "discountedPrice": 87, "expireAt": "1988-11-26T00:00:00Z", "price": 91, "purchaseAt": "1982-02-16T00:00:00Z", "trialPrice": 53}, {"currencyCode": "2XfXMilH", "currencyNamespace": "A1kNIJpT", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1993-01-03T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1997-03-12T00:00:00Z", "discountedPrice": 9, "expireAt": "1982-08-15T00:00:00Z", "price": 65, "purchaseAt": "1985-09-05T00:00:00Z", "trialPrice": 5}, {"currencyCode": "MwuSe1m9", "currencyNamespace": "6oFw9W67", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1985-01-22T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1991-12-23T00:00:00Z", "discountedPrice": 34, "expireAt": "1982-03-28T00:00:00Z", "price": 7, "purchaseAt": "1981-09-10T00:00:00Z", "trialPrice": 83}], "7Ml3GUad": [{"currencyCode": "BXogl8lq", "currencyNamespace": "8SNLYZ3U", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1986-02-20T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1974-09-20T00:00:00Z", "discountedPrice": 67, "expireAt": "1984-10-26T00:00:00Z", "price": 48, "purchaseAt": "1980-06-11T00:00:00Z", "trialPrice": 67}, {"currencyCode": "pEJxlFfN", "currencyNamespace": "ZUKI3wbd", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1979-08-20T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1995-07-21T00:00:00Z", "discountedPrice": 11, "expireAt": "1999-01-07T00:00:00Z", "price": 93, "purchaseAt": "1983-01-10T00:00:00Z", "trialPrice": 47}, {"currencyCode": "kj8lyWxV", "currencyNamespace": "Q8aQPSM0", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1971-08-13T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1984-09-01T00:00:00Z", "discountedPrice": 68, "expireAt": "1998-05-18T00:00:00Z", "price": 46, "purchaseAt": "1988-04-12T00:00:00Z", "trialPrice": 45}]}, "seasonType": "PASS", "sku": "qwMih7e3", "stackable": false, "status": "INACTIVE", "tags": ["CePT6CNv", "P2gKWV7B", "CMOkgI1d"], "targetCurrencyCode": "Xqv9dGac", "targetNamespace": "NaUBopn4", "thumbnailUrl": "TW7lieM8", "useCount": 44}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItem' test.out

#- 101 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'DJo72lql' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId '63d5a1aF' \
    > test.out 2>&1
eval_tap $? 101 'DeleteItem' test.out

#- 102 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'qyMd4AEm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 79, "orderNo": "7glnaHx8"}' \
    > test.out 2>&1
eval_tap $? 102 'AcquireItem' test.out

#- 103 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'Vo7oVNoz' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'wp5ODdm9' \
    > test.out 2>&1
eval_tap $? 103 'GetApp' test.out

#- 104 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'K3V7Uhah' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QQJdvsmf' \
    --body '{"carousel": [{"alt": "FHQJCCxP", "previewUrl": "YZ9Bs8DZ", "thumbnailUrl": "T5glacqN", "type": "video", "url": "ejJoP16K", "videoSource": "generic"}, {"alt": "9e78rDJK", "previewUrl": "DRUGd9M3", "thumbnailUrl": "EIVR1Hfz", "type": "image", "url": "w1tFL3I1", "videoSource": "generic"}, {"alt": "BEQt0uEB", "previewUrl": "Z48C6Isu", "thumbnailUrl": "NXnby11D", "type": "image", "url": "GbctxsW6", "videoSource": "vimeo"}], "developer": "7fpOvdve", "forumUrl": "rzwUjUkm", "genres": ["Action", "Sports", "Action"], "localizations": {"cat8QwmV": {"announcement": "U0DRgZ0O", "slogan": "71aIqhkv"}, "iRj6oemL": {"announcement": "kg3CNkrr", "slogan": "wkNrVa1C"}, "6eFJOJRC": {"announcement": "mK7MykUz", "slogan": "blTiWSgF"}}, "platformRequirements": {"Lw5opaAq": [{"additionals": "W9FKvimA", "directXVersion": "tm48QCFq", "diskSpace": "WWozzewi", "graphics": "BnSGOZRe", "label": "IvJiBusJ", "osVersion": "ddkmOjsq", "processor": "WiBHAj3z", "ram": "BUdJFjp2", "soundCard": "9BFixRH3"}, {"additionals": "1pGT4BmB", "directXVersion": "IMnzjQel", "diskSpace": "Gp6eiEyV", "graphics": "riDooulU", "label": "JYtCYBcR", "osVersion": "EfjH4OSk", "processor": "eaZecArK", "ram": "6G2T6zN9", "soundCard": "vkucR2b5"}, {"additionals": "huXrJg8C", "directXVersion": "dVruV5LG", "diskSpace": "9HhjcZCM", "graphics": "IJMgKVCN", "label": "ZeuEqSZ9", "osVersion": "ni7HLztU", "processor": "Ovap6K2S", "ram": "ruOuMKXE", "soundCard": "Gnp3rN31"}], "oaxXwPFU": [{"additionals": "89lAn6kd", "directXVersion": "Atu1ozNp", "diskSpace": "n5tdD9yX", "graphics": "6l388rP7", "label": "u29Q1MVV", "osVersion": "TtGke1d7", "processor": "nLpLh4Ym", "ram": "z7sYvGRv", "soundCard": "vThveISD"}, {"additionals": "71eHoDyM", "directXVersion": "PjxY4wf6", "diskSpace": "h2Ze15og", "graphics": "ZTtVbh99", "label": "gSkiaZje", "osVersion": "KlHRugpM", "processor": "QzmYM0pF", "ram": "Gms23XOd", "soundCard": "3HAcsLam"}, {"additionals": "0jHW1xVC", "directXVersion": "nz5XYBlK", "diskSpace": "JK0wDKcr", "graphics": "sfSWQxH0", "label": "oWXRfFd5", "osVersion": "eL7uBLBq", "processor": "UiOifOZW", "ram": "vA3mMgGs", "soundCard": "WMOSebcD"}], "09LxRYGD": [{"additionals": "MnxsO8lY", "directXVersion": "jGUel0NL", "diskSpace": "GQSne81l", "graphics": "itEqoI3X", "label": "ovFWh1GG", "osVersion": "OHuGhjD8", "processor": "dVUt2uk6", "ram": "oU69npaf", "soundCard": "lpj7APDb"}, {"additionals": "dnE2s7FJ", "directXVersion": "Qv42l4mX", "diskSpace": "7DpdMYFN", "graphics": "a9YCUsGh", "label": "xdZ3VGxp", "osVersion": "yiUoTLTU", "processor": "p93KWy44", "ram": "VRmYcoXf", "soundCard": "EEmwY9gc"}, {"additionals": "VFfewMIU", "directXVersion": "hY17zMWO", "diskSpace": "j4WhVGmX", "graphics": "0B0KARnq", "label": "MB9iY0DQ", "osVersion": "UYwL0x2X", "processor": "fGxNqWjj", "ram": "d3urKRYF", "soundCard": "DjDj4kxe"}]}, "platforms": ["Android", "Android", "IOS"], "players": ["Single", "CrossPlatformMulti", "Multi"], "primaryGenre": "Adventure", "publisher": "uCkrUFyT", "releaseDate": "1996-11-18T00:00:00Z", "websiteUrl": "aPPWGlpV"}' \
    > test.out 2>&1
eval_tap $? 104 'UpdateApp' test.out

#- 105 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'TVSgKOtR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dqRtkGa9' \
    > test.out 2>&1
eval_tap $? 105 'DisableItem' test.out

#- 106 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'hboNtAap' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetItemDynamicData' test.out

#- 107 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'p6sUnsrE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'z2JWURtJ' \
    > test.out 2>&1
eval_tap $? 107 'EnableItem' test.out

#- 108 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'NITrCw8k' \
    --itemId 'RRgYaQuh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MCOKRDrY' \
    > test.out 2>&1
eval_tap $? 108 'FeatureItem' test.out

#- 109 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'lPlzilMp' \
    --itemId 'mZmlwn3p' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cOrfg4bt' \
    > test.out 2>&1
eval_tap $? 109 'DefeatureItem' test.out

#- 110 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '0j6P3mXj' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'TGZOc5kK' \
    --populateBundle  \
    --region 'Qm3PPik3' \
    --storeId 'ByMWGx4M' \
    > test.out 2>&1
eval_tap $? 110 'GetLocaleItem' test.out

#- 111 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'Qj1rHgZi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OFbz6ZhL' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 93, "comparison": "is", "name": "bP2OakIB", "predicateType": "SeasonPassPredicate", "value": "1Eo2c7CJ", "values": ["8Ro3sejG", "Oo0c9kF3", "ox41xTRW"]}, {"anyOf": 24, "comparison": "isGreaterThanOrEqual", "name": "nTPNlhL1", "predicateType": "EntitlementPredicate", "value": "tSjM1qCN", "values": ["NsKHIUmC", "VXH65xAf", "3SdpN9RM"]}, {"anyOf": 36, "comparison": "includes", "name": "I1r15RcA", "predicateType": "SeasonPassPredicate", "value": "yEj9oy6l", "values": ["ocAbkqqb", "mfjmao8f", "IDizF2dG"]}]}, {"operator": "or", "predicates": [{"anyOf": 41, "comparison": "isLessThan", "name": "cLXfl6TE", "predicateType": "SeasonTierPredicate", "value": "OlUzcc3k", "values": ["xw1E7OMR", "yXwYMSj9", "RDZoK9We"]}, {"anyOf": 71, "comparison": "isLessThanOrEqual", "name": "ws7IcOPd", "predicateType": "SeasonTierPredicate", "value": "YcjB9pzV", "values": ["UIiPyVSC", "wFX1n54s", "pq4PWugW"]}, {"anyOf": 99, "comparison": "isGreaterThan", "name": "l57QNKwY", "predicateType": "EntitlementPredicate", "value": "EiXFrjwG", "values": ["qbnn8oJr", "eUovFUvj", "UxHQxiRJ"]}]}, {"operator": "or", "predicates": [{"anyOf": 72, "comparison": "includes", "name": "uXAH5ZYJ", "predicateType": "EntitlementPredicate", "value": "OZECsFby", "values": ["znHyLHMw", "L4FJiOaz", "SfUDkgRk"]}, {"anyOf": 61, "comparison": "isGreaterThanOrEqual", "name": "9zTPR5Dl", "predicateType": "SeasonPassPredicate", "value": "jWu6j0qZ", "values": ["wC5Gi12k", "IxL3VdAV", "KDx5XY1S"]}, {"anyOf": 91, "comparison": "isGreaterThan", "name": "lzdU7LaI", "predicateType": "SeasonTierPredicate", "value": "2aIGkWCK", "values": ["G4gyt1hH", "7viApCKh", "x3Ny8Kyc"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 111 'UpdateItemPurchaseCondition' test.out

#- 112 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'Oc7RIz2Q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "F3AAKij0"}' \
    > test.out 2>&1
eval_tap $? 112 'ReturnItem' test.out

#- 113 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --name 'cDTISE03' \
    --offset '30' \
    --tag 'kyCy0bxg' \
    > test.out 2>&1
eval_tap $? 113 'QueryKeyGroups' test.out

#- 114 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "LjN2QxSJ", "name": "zuSZjENJ", "status": "INACTIVE", "tags": ["zGSdoZyP", "lle7wn7D", "cfeZLRHN"]}' \
    > test.out 2>&1
eval_tap $? 114 'CreateKeyGroup' test.out

#- 115 GetKeyGroupByBoothName
eval_tap 0 115 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 116 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'MqTVUfw2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'GetKeyGroup' test.out

#- 117 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '2QN4VlEb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Q4fwyMdF", "name": "uhzmHHY5", "status": "INACTIVE", "tags": ["s78cChU1", "H1BeP7mX", "Uav4PNoK"]}' \
    > test.out 2>&1
eval_tap $? 117 'UpdateKeyGroup' test.out

#- 118 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '7pF7I4UF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetKeyGroupDynamic' test.out

#- 119 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'RJZhm7MD' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '92' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 119 'ListKeys' test.out

#- 120 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'MZOj7LL5' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 120 'UploadKeys' test.out

#- 121 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'AEktohEG' \
    --limit '76' \
    --offset '61' \
    --orderNos '1s8pPjCR,32W01kZn,yqubfcAS' \
    --sortBy 'I3vr9E8C' \
    --startTime 'nsReBUfz' \
    --status 'DELETED' \
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
    --orderNo '5YdrDuiK' \
    > test.out 2>&1
eval_tap $? 123 'GetOrder' test.out

#- 124 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vEdJ8opC' \
    --body '{"description": "w9ZAVYw3"}' \
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
    --body '{"dryRun": false, "notifyUrl": "QYH9q1K5", "privateKey": "FJSzRsxM"}' \
    > test.out 2>&1
eval_tap $? 126 'UpdatePaymentCallbackConfig' test.out

#- 127 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'SUgC1Xm3' \
    --externalId 'VtZ72irq' \
    --limit '56' \
    --notificationSource 'PAYPAL' \
    --notificationType '9JqqffW6' \
    --offset '50' \
    --paymentOrderNo 'vWyXf10q' \
    --startDate 'j355DfFj' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 127 'QueryPaymentNotifications' test.out

#- 128 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'DSFOlSXU' \
    --limit '74' \
    --offset '10' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 128 'QueryPaymentOrders' test.out

#- 129 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "Pn8o0w62", "currencyNamespace": "2e6Cw8jf", "customParameters": {"yMRtsJAS": {}, "hQvdM1FJ": {}, "oEr8mIfD": {}}, "description": "WpesMWQP", "extOrderNo": "EuAAkaQS", "extUserId": "d9JBix37", "itemType": "SEASON", "language": "COy-SJVX", "metadata": {"96u8BxdP": "QVIAPNXn", "KS2Ynnfv": "guN2sWio", "YXwKADI1": "zulIiveY"}, "notifyUrl": "6MtfRXxB", "omitNotification": true, "platform": "NiD3lbra", "price": 44, "recurringPaymentOrderNo": "t30WJILD", "region": "GxnCS6jh", "returnUrl": "rzyKEHZs", "sandbox": true, "sku": "x3vyAA4Y", "subscriptionId": "LekSzAp9", "targetNamespace": "cityxiUK", "targetUserId": "kxQ8IQAm", "title": "VCYV05Ow"}' \
    > test.out 2>&1
eval_tap $? 129 'CreatePaymentOrderByDedicated' test.out

#- 130 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'vcbVpgJo' \
    > test.out 2>&1
eval_tap $? 130 'ListExtOrderNoByExtTxId' test.out

#- 131 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'AwBkRDFw' \
    > test.out 2>&1
eval_tap $? 131 'GetPaymentOrder' test.out

#- 132 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lFV72QkF' \
    --body '{"extTxId": "z3C508iy", "paymentMethod": "FK4gERO9", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 132 'ChargePaymentOrder' test.out

#- 133 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'b5julZGT' \
    --body '{"description": "vN3Ij5E7"}' \
    > test.out 2>&1
eval_tap $? 133 'RefundPaymentOrderByDedicated' test.out

#- 134 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dABWpdWe' \
    --body '{"amount": 47, "currencyCode": "LKMjUCix", "notifyType": "CHARGE", "paymentProvider": "ALIPAY", "salesTax": 4, "vat": 91}' \
    > test.out 2>&1
eval_tap $? 134 'SimulatePaymentOrderNotification' test.out

#- 135 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'o9oAIRDJ' \
    > test.out 2>&1
eval_tap $? 135 'GetPaymentOrderChargeStatus' test.out

#- 136 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 136 'GetPlatformWalletConfig' test.out

#- 137 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["Other", "Epic", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 137 'UpdatePlatformWalletConfig' test.out

#- 138 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 138 'ResetPlatformWalletConfig' test.out

#- 139 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "khOO5oqB", "eventTopic": "11DZl94c", "maxAwarded": 91, "maxAwardedPerUser": 1, "namespaceExpression": "iKH7LfSB", "rewardCode": "fSkgmnOt", "rewardConditions": [{"condition": "xhkvjNZx", "conditionName": "4LVRQXaF", "eventName": "OYu6ilhD", "rewardItems": [{"duration": 86, "itemId": "FxU20zEn", "quantity": 24}, {"duration": 37, "itemId": "BbsYtLOM", "quantity": 25}, {"duration": 74, "itemId": "u6elSRFj", "quantity": 44}]}, {"condition": "lUMfIEPN", "conditionName": "jQ39gxOv", "eventName": "ScTrwuUw", "rewardItems": [{"duration": 31, "itemId": "syOP70cw", "quantity": 96}, {"duration": 37, "itemId": "rySldhh3", "quantity": 95}, {"duration": 81, "itemId": "x7E0IVax", "quantity": 18}]}, {"condition": "by6rTLAA", "conditionName": "IVJYxpmJ", "eventName": "EXrzMxnN", "rewardItems": [{"duration": 100, "itemId": "uI8cxJIh", "quantity": 71}, {"duration": 24, "itemId": "pJR1acXB", "quantity": 61}, {"duration": 0, "itemId": "woIDdumr", "quantity": 94}]}], "userIdExpression": "YXywST5a"}' \
    > test.out 2>&1
eval_tap $? 139 'CreateReward' test.out

#- 140 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'OWcPpvql' \
    --limit '80' \
    --offset '30' \
    --sortBy 'rewardCode:desc,namespace:asc,rewardCode' \
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
    --rewardId 'JzREBMc9' \
    > test.out 2>&1
eval_tap $? 143 'GetReward' test.out

#- 144 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '1vGQbWAn' \
    --body '{"description": "AZf46x42", "eventTopic": "vTd22LsG", "maxAwarded": 32, "maxAwardedPerUser": 22, "namespaceExpression": "QY2MdUnA", "rewardCode": "BA7lMeM1", "rewardConditions": [{"condition": "Yna9E6aT", "conditionName": "cf8RLDB6", "eventName": "dxjtlTd3", "rewardItems": [{"duration": 88, "itemId": "Fqfqadqq", "quantity": 53}, {"duration": 85, "itemId": "QqcJmMnF", "quantity": 69}, {"duration": 54, "itemId": "nWc8Vy85", "quantity": 24}]}, {"condition": "zXcU8pyk", "conditionName": "yTMNTs5H", "eventName": "txruJGsu", "rewardItems": [{"duration": 80, "itemId": "yXahCcik", "quantity": 65}, {"duration": 59, "itemId": "z6YtL7qq", "quantity": 71}, {"duration": 97, "itemId": "7S7wUClS", "quantity": 8}]}, {"condition": "alx4xadc", "conditionName": "KrA8qrJg", "eventName": "jEAwwsEb", "rewardItems": [{"duration": 98, "itemId": "HcDSHedR", "quantity": 71}, {"duration": 76, "itemId": "NpRWI00H", "quantity": 25}, {"duration": 97, "itemId": "sJsBhDlu", "quantity": 77}]}], "userIdExpression": "1Uc7AzNE"}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateReward' test.out

#- 145 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'g4WkeucS' \
    > test.out 2>&1
eval_tap $? 145 'DeleteReward' test.out

#- 146 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'yGGNkpjI' \
    --body '{"payload": {"ehNdyPy6": {}, "10vdOXuD": {}, "qkpeka0x": {}}}' \
    > test.out 2>&1
eval_tap $? 146 'CheckEventCondition' test.out

#- 147 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'M6nChTSh' \
    --body '{"conditionName": "YalSCcH9", "userId": "wwryE1wa"}' \
    > test.out 2>&1
eval_tap $? 147 'DeleteRewardConditionRecord' test.out

#- 148 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'TrpO0Z98' \
    --limit '18' \
    --offset '32' \
    --start 'xhUUMfV2' \
    --storeId 'j2xDoYtb' \
    --viewId 'VXlMae8p' \
    > test.out 2>&1
eval_tap $? 148 'QuerySections' test.out

#- 149 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'b0yZ7Jhw' \
    --body '{"active": true, "displayOrder": 71, "endDate": "1972-01-19T00:00:00Z", "ext": {"0nxjtNJ1": {}, "Z0dqaCHu": {}, "RejHAEqI": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 68, "itemCount": 99, "rule": "SEQUENCE"}, "items": [{"id": "fYZwoLYr", "sku": "RjfSYulV"}, {"id": "stXzvGq5", "sku": "29XwvZ8E"}, {"id": "Omnen8By", "sku": "cwYbh4jX"}], "localizations": {"ecViK7sG": {"description": "jHj8BZ1B", "localExt": {"lAYn8KFC": {}, "DtECJC1k": {}, "gZTsrZbw": {}}, "longDescription": "XzEvhWGz", "title": "bROvzVQE"}, "hmLt7G4v": {"description": "Iks3xQGC", "localExt": {"u1z0zFTD": {}, "XNiSq3CB": {}, "9T7oZxZ4": {}}, "longDescription": "5KOC63dX", "title": "naJQqLmo"}, "nTbfakfC": {"description": "iMSx79fn", "localExt": {"5UcSTonI": {}, "1Dkwj3Si": {}, "cmUS62vK": {}}, "longDescription": "mgRiruI4", "title": "vgdiaqnp"}}, "name": "E5r4DntZ", "rotationType": "NONE", "startDate": "1983-09-30T00:00:00Z", "viewId": "8F30F91M"}' \
    > test.out 2>&1
eval_tap $? 149 'CreateSection' test.out

#- 150 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'q1nBiTus' \
    > test.out 2>&1
eval_tap $? 150 'PurgeExpiredSection' test.out

#- 151 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'XIFuhWsL' \
    --storeId 'tNoIfIWJ' \
    > test.out 2>&1
eval_tap $? 151 'GetSection' test.out

#- 152 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'rGoqAAuA' \
    --storeId 'sglcy5t8' \
    --body '{"active": false, "displayOrder": 14, "endDate": "1996-03-29T00:00:00Z", "ext": {"a9QASQt3": {}, "HLoEvcVP": {}, "eKYfr48T": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 45, "itemCount": 68, "rule": "SEQUENCE"}, "items": [{"id": "wiyqw00s", "sku": "6bxBgGEH"}, {"id": "6LygKYja", "sku": "CACie6xv"}, {"id": "urLJJqaw", "sku": "yphY4h73"}], "localizations": {"0bJy4olu": {"description": "hWiyeqF3", "localExt": {"9v90tcct": {}, "gPZzDWtP": {}, "ffZ63zxu": {}}, "longDescription": "lkxkyHuD", "title": "ueHuf2CZ"}, "kagnvLl9": {"description": "4vbmCt4q", "localExt": {"B63pqvyf": {}, "JztOtezL": {}, "dc0d35yl": {}}, "longDescription": "d9mi42gI", "title": "QqHlWZ34"}, "HIjfJlcK": {"description": "wETD1ZTm", "localExt": {"8BZm0CZq": {}, "ExrTkb1j": {}, "dgMbnTU7": {}}, "longDescription": "47UPwAG9", "title": "hSALP3Fn"}}, "name": "7l9yHXX3", "rotationType": "CUSTOM", "startDate": "1995-01-06T00:00:00Z", "viewId": "PgHq4nKD"}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateSection' test.out

#- 153 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ZlYNT5pI' \
    --storeId 'MsNowwnf' \
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
    --body '{"defaultLanguage": "QwnSDVnM", "defaultRegion": "05l5opr8", "description": "Vmby2Eqs", "supportedLanguages": ["pazxOlI1", "8tpwvPos", "8t7uzJdT"], "supportedRegions": ["mO0UQH2W", "s7QFLSOB", "SmZpWUQm"], "title": "PY4wRM5K"}' \
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
    --storeId 'dtsh1jbc' \
    > test.out 2>&1
eval_tap $? 161 'GetStore' test.out

#- 162 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eOI7On7Y' \
    --body '{"defaultLanguage": "beLXSlni", "defaultRegion": "e9BpMWOB", "description": "VqFGRnaI", "supportedLanguages": ["lFfRxhr1", "iHiNo9ov", "gJTVvXzm"], "supportedRegions": ["EVZ0D3gZ", "ePH485dZ", "Cz0LAWhr"], "title": "JyPvFgWe"}' \
    > test.out 2>&1
eval_tap $? 162 'UpdateStore' test.out

#- 163 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eWaKdvD4' \
    > test.out 2>&1
eval_tap $? 163 'DeleteStore' test.out

#- 164 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '5YnYJqg9' \
    --action 'DELETE' \
    --itemSku '67JKx2un' \
    --itemType 'COINS' \
    --limit '31' \
    --offset '81' \
    --selected  \
    --sortBy 'createdAt:desc,createdAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'rADSFo1y' \
    --updatedAtStart 'KsiP6y6A' \
    > test.out 2>&1
eval_tap $? 164 'QueryChanges' test.out

#- 165 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LW2Y2MWh' \
    > test.out 2>&1
eval_tap $? 165 'PublishAll' test.out

#- 166 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UcUzyTAw' \
    > test.out 2>&1
eval_tap $? 166 'PublishSelected' test.out

#- 167 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'THUSgZ0T' \
    > test.out 2>&1
eval_tap $? 167 'SelectAllRecords' test.out

#- 168 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QvqUDNKB' \
    --action 'UPDATE' \
    --itemSku 'oakk1ZYA' \
    --itemType 'BUNDLE' \
    --type 'VIEW' \
    --updatedAtEnd '8Z9dzWuz' \
    --updatedAtStart 'qzJFCRSR' \
    > test.out 2>&1
eval_tap $? 168 'GetStatistic' test.out

#- 169 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gI4CNvUL' \
    > test.out 2>&1
eval_tap $? 169 'UnselectAllRecords' test.out

#- 170 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'fWKB2NC6' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3f1TZ4Vm' \
    > test.out 2>&1
eval_tap $? 170 'SelectRecord' test.out

#- 171 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'RJWL7ozn' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZrBrmbmp' \
    > test.out 2>&1
eval_tap $? 171 'UnselectRecord' test.out

#- 172 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qtbBMtXU' \
    --targetStoreId 'g0nUn2bC' \
    > test.out 2>&1
eval_tap $? 172 'CloneStore' test.out

#- 173 ExportStore
eval_tap 0 173 'ExportStore # SKIP deprecated' test.out

#- 174 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'T0h0WXyr' \
    --limit '51' \
    --offset '8' \
    --sku 'ebqEONcb' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'npy5aNkj' \
    > test.out 2>&1
eval_tap $? 174 'QuerySubscriptions' test.out

#- 175 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'v6c5fIt4' \
    > test.out 2>&1
eval_tap $? 175 'RecurringChargeSubscription' test.out

#- 176 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName '5ycHjF8w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'GetTicketDynamic' test.out

#- 177 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'EXcyLGzO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "QKSiNUQl"}' \
    > test.out 2>&1
eval_tap $? 177 'DecreaseTicketSale' test.out

#- 178 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '9VQFvZUe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetTicketBoothID' test.out

#- 179 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'fRQjrxWY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 24, "orderNo": "HLMv2gbp"}' \
    > test.out 2>&1
eval_tap $? 179 'IncreaseTicketSale' test.out

#- 180 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'wekIW2sq' \
    --body '{"achievements": [{"id": "OJoY75yY", "value": 95}, {"id": "AjfSAhcz", "value": 76}, {"id": "rYJTfC0v", "value": 8}], "steamUserId": "nHo9P9QE"}' \
    > test.out 2>&1
eval_tap $? 180 'UnlockSteamUserAchievement' test.out

#- 181 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'K9wWxiyJ' \
    --xboxUserId 'qJ8lS21K' \
    > test.out 2>&1
eval_tap $? 181 'GetXblUserAchievements' test.out

#- 182 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '8SHgjW3B' \
    --body '{"achievements": [{"id": "Aozxb99R", "percentComplete": 65}, {"id": "ZNy0G6aO", "percentComplete": 80}, {"id": "X0YPEUMR", "percentComplete": 66}], "serviceConfigId": "7P95zu2u", "titleId": "BiW4uP7I", "xboxUserId": "C3PcKNzM"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateXblUserAchievement' test.out

#- 183 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xzg7xWfh' \
    > test.out 2>&1
eval_tap $? 183 'AnonymizeCampaign' test.out

#- 184 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'CI0KGN4w' \
    > test.out 2>&1
eval_tap $? 184 'AnonymizeEntitlement' test.out

#- 185 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId '14HNdUsB' \
    > test.out 2>&1
eval_tap $? 185 'AnonymizeFulfillment' test.out

#- 186 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'QdO8em72' \
    > test.out 2>&1
eval_tap $? 186 'AnonymizeIntegration' test.out

#- 187 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '5vyMKwe6' \
    > test.out 2>&1
eval_tap $? 187 'AnonymizeOrder' test.out

#- 188 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nt9127dA' \
    > test.out 2>&1
eval_tap $? 188 'AnonymizePayment' test.out

#- 189 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '54TOUuui' \
    > test.out 2>&1
eval_tap $? 189 'AnonymizeSubscription' test.out

#- 190 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iks9iDAA' \
    > test.out 2>&1
eval_tap $? 190 'AnonymizeWallet' test.out

#- 191 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'aaHExwOq' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 191 'GetUserDLC' test.out

#- 192 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2HBycZU0' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'UbRZd9Wv' \
    --features '77WPdrAz,Wm3UB0Py,xhfnKJtS' \
    --itemId 'hgsWNlzi,DK2maVzZ,qV6Ps2rk' \
    --limit '0' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 192 'QueryUserEntitlements' test.out

#- 193 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'N6ItrjLo' \
    --body '[{"endDate": "1979-02-05T00:00:00Z", "grantedCode": "6KXoSSCx", "itemId": "Z0apXDlr", "itemNamespace": "uGcG942r", "language": "yi", "quantity": 41, "region": "QH6NDCam", "source": "OTHER", "startDate": "1982-06-12T00:00:00Z", "storeId": "iBfUzUmQ"}, {"endDate": "1996-04-04T00:00:00Z", "grantedCode": "N4MqN3LW", "itemId": "pQRLMyF8", "itemNamespace": "jdLaEh4G", "language": "FY", "quantity": 14, "region": "YCV5S0iB", "source": "REWARD", "startDate": "1982-09-25T00:00:00Z", "storeId": "b0zacGkc"}, {"endDate": "1990-12-09T00:00:00Z", "grantedCode": "AQhLqNkT", "itemId": "2FRGFrVq", "itemNamespace": "tRnviLbq", "language": "bHu_FYbT", "quantity": 49, "region": "zk63KiDG", "source": "IAP", "startDate": "1972-08-27T00:00:00Z", "storeId": "QKa0tS0R"}]' \
    > test.out 2>&1
eval_tap $? 193 'GrantUserEntitlement' test.out

#- 194 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'JESZpnRe' \
    --activeOnly  \
    --appId 'qVcrtSxD' \
    > test.out 2>&1
eval_tap $? 194 'GetUserAppEntitlementByAppId' test.out

#- 195 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'bkqfgfMz' \
    --activeOnly  \
    --limit '0' \
    --offset '34' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 195 'QueryUserEntitlementsByAppType' test.out

#- 196 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NRPwpZgm' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'LxzmKJ9H' \
    > test.out 2>&1
eval_tap $? 196 'GetUserEntitlementByItemId' test.out

#- 197 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ijFxrGm8' \
    --ids 'F6PpqrFD,LBf50viW,fiivSZPH' \
    > test.out 2>&1
eval_tap $? 197 'GetUserActiveEntitlementsByItemIds' test.out

#- 198 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'lKEo5pvb' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'KMr7Nruh' \
    > test.out 2>&1
eval_tap $? 198 'GetUserEntitlementBySku' test.out

#- 199 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '624JUo8X' \
    --appIds 'tjngnZAJ,PLjpxa00,wZyQrkfj' \
    --itemIds 'GN28RRsN,p5TIAFef,1QHWlZJa' \
    --skus 'TKWKzZgt,qwZIKOLl,2RIRghfv' \
    > test.out 2>&1
eval_tap $? 199 'ExistsAnyUserActiveEntitlement' test.out

#- 200 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZUTwjpOg' \
    --itemIds 'eeoX7F2U,JjYxxDSP,LbhxKfqY' \
    > test.out 2>&1
eval_tap $? 200 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 201 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'AtDc3UTO' \
    --appId 'CmYUeSgh' \
    > test.out 2>&1
eval_tap $? 201 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 202 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xp1Iljhx' \
    --entitlementClazz 'MEDIA' \
    --itemId 'kAZw7Emt' \
    > test.out 2>&1
eval_tap $? 202 'GetUserEntitlementOwnershipByItemId' test.out

#- 203 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xy8oNixZ' \
    --ids 'vwgsfIma,jACkmdB1,OfcMbFtr' \
    > test.out 2>&1
eval_tap $? 203 'GetUserEntitlementOwnershipByItemIds' test.out

#- 204 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '1iIvhujo' \
    --entitlementClazz 'CODE' \
    --sku '0HUOQOIr' \
    > test.out 2>&1
eval_tap $? 204 'GetUserEntitlementOwnershipBySku' test.out

#- 205 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'dWnYIirg' \
    --entitlementIds 'e5lDDsCy' \
    > test.out 2>&1
eval_tap $? 205 'RevokeUserEntitlements' test.out

#- 206 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'KAKElIS1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yKd8UbJE' \
    > test.out 2>&1
eval_tap $? 206 'GetUserEntitlement' test.out

#- 207 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'ExfGeg4v' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PKxUgwnk' \
    --body '{"endDate": "1974-01-19T00:00:00Z", "nullFieldList": ["FyJKJg7S", "qrcmDxPK", "hvcuCmId"], "startDate": "1986-02-01T00:00:00Z", "status": "INACTIVE", "useCount": 61}' \
    > test.out 2>&1
eval_tap $? 207 'UpdateUserEntitlement' test.out

#- 208 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'obA1R7Ht' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y3hCYjEp' \
    --body '{"options": ["8H7ZfTVF", "ZijccyBu", "Az88DUjW"], "requestId": "P5Djk6wK", "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 208 'ConsumeUserEntitlement' test.out

#- 209 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'NA1686K3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TH3AWNCN' \
    > test.out 2>&1
eval_tap $? 209 'DisableUserEntitlement' test.out

#- 210 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'PFXPf7BS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XViHFqcz' \
    > test.out 2>&1
eval_tap $? 210 'EnableUserEntitlement' test.out

#- 211 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'kyWIhTiU' \
    --namespace "$AB_NAMESPACE" \
    --userId '1DDnCYTS' \
    > test.out 2>&1
eval_tap $? 211 'GetUserEntitlementHistories' test.out

#- 212 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'bHktWiKE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zjpNQgUb' \
    > test.out 2>&1
eval_tap $? 212 'RevokeUserEntitlement' test.out

#- 213 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUmysOEr' \
    --body '{"duration": 21, "endDate": "1971-01-29T00:00:00Z", "itemId": "AzXBBhFm", "itemSku": "H3Mzt94F", "language": "RvP1JkxT", "order": {"currency": {"currencyCode": "dH1gn7Ej", "currencySymbol": "M2kiT2E1", "currencyType": "VIRTUAL", "decimals": 82, "namespace": "hVRGmGrC"}, "ext": {"ZUZsFHRR": {}, "IUE4rO47": {}, "RddjIAqN": {}}, "free": false}, "orderNo": "jZ9ragFl", "origin": "Epic", "quantity": 89, "region": "HU6HSawW", "source": "REDEEM_CODE", "startDate": "1989-11-03T00:00:00Z", "storeId": "bbGctXJf"}' \
    > test.out 2>&1
eval_tap $? 213 'FulfillItem' test.out

#- 214 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'mMcfZA7T' \
    --body '{"code": "058eBHCj", "language": "hp_YaMS_hR", "region": "XuHXjc4X"}' \
    > test.out 2>&1
eval_tap $? 214 'RedeemCode' test.out

#- 215 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'L5M76igO' \
    --body '{"origin": "Steam", "rewards": [{"currency": {"currencyCode": "Lc0eONhO", "namespace": "khW3Wmik"}, "item": {"itemId": "xFghY1XI", "itemSku": "Bo4MO1oW", "itemType": "22sruTpF"}, "quantity": 80, "type": "CURRENCY"}, {"currency": {"currencyCode": "LASPrQoU", "namespace": "KCeIa5Et"}, "item": {"itemId": "a3aFiQsM", "itemSku": "2k2CPgKb", "itemType": "wj0IhFvp"}, "quantity": 49, "type": "CURRENCY"}, {"currency": {"currencyCode": "XcpZZvU1", "namespace": "4D4qdo8K"}, "item": {"itemId": "0gBfnRbP", "itemSku": "m8ShEcn6", "itemType": "GM7LeLOw"}, "quantity": 28, "type": "ITEM"}], "source": "REDEEM_CODE"}' \
    > test.out 2>&1
eval_tap $? 215 'FulfillRewards' test.out

#- 216 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'S99wNqxt' \
    --endTime 'DufqzeOc' \
    --limit '33' \
    --offset '76' \
    --productId '41VXhHhF' \
    --startTime 'YytXoX3L' \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 216 'QueryUserIAPOrders' test.out

#- 217 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'sFA6MjMR' \
    > test.out 2>&1
eval_tap $? 217 'QueryAllUserIAPOrders' test.out

#- 218 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'lPvtxMiS' \
    --endTime 'UAFFYZru' \
    --limit '14' \
    --offset '56' \
    --startTime 'vjAbizDN' \
    --status 'FAIL' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 218 'QueryUserIAPConsumeHistory' test.out

#- 219 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z1EehiaS' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "POi", "productId": "Z60IJ5hL", "region": "GRg2z3w5", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 219 'MockFulfillIAPItem' test.out

#- 220 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRAx9RsP' \
    --itemId 'ap3l2ust' \
    --limit '34' \
    --offset '53' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 220 'QueryUserOrders' test.out

#- 221 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'NATkKL47' \
    --body '{"currencyCode": "C3pIdbt9", "currencyNamespace": "8bsgz3A8", "discountedPrice": 18, "ext": {"CTdnXtXr": {}, "y3Gutwt3": {}, "A3FEL0Qm": {}}, "itemId": "cYOjYBQP", "language": "NqDdUJxi", "options": {"skipPriceValidation": false}, "platform": "Nintendo", "price": 96, "quantity": 28, "region": "0PTXb6yw", "returnUrl": "MLAwpEOF", "sandbox": false}' \
    > test.out 2>&1
eval_tap $? 221 'AdminCreateUserOrder' test.out

#- 222 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'FSO1VtCn' \
    --itemId 'KxkGHmZ6' \
    > test.out 2>&1
eval_tap $? 222 'CountOfPurchasedItem' test.out

#- 223 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rNpTHGDj' \
    --userId 'ZiHtiBR5' \
    > test.out 2>&1
eval_tap $? 223 'GetUserOrder' test.out

#- 224 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'wZ41KJVX' \
    --userId 'y8k3JsVP' \
    --body '{"status": "CHARGEBACK", "statusReason": "4IPA5ss3"}' \
    > test.out 2>&1
eval_tap $? 224 'UpdateUserOrderStatus' test.out

#- 225 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'crYMIBy7' \
    --userId 'VTkP8raC' \
    > test.out 2>&1
eval_tap $? 225 'FulfillUserOrder' test.out

#- 226 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'dUD5c02i' \
    --userId 'g8QACg3C' \
    > test.out 2>&1
eval_tap $? 226 'GetUserOrderGrant' test.out

#- 227 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'WGpiOnJu' \
    --userId 'bje2e9ag' \
    > test.out 2>&1
eval_tap $? 227 'GetUserOrderHistories' test.out

#- 228 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '4Qg3WXf6' \
    --userId 'Wbiyq0mM' \
    --body '{"additionalData": {"cardSummary": "NMECA7e4"}, "authorisedTime": "1981-08-22T00:00:00Z", "chargebackReversedTime": "1983-09-23T00:00:00Z", "chargebackTime": "1985-12-26T00:00:00Z", "chargedTime": "1979-06-19T00:00:00Z", "createdTime": "1973-06-30T00:00:00Z", "currency": {"currencyCode": "JiiIzr3r", "currencySymbol": "wFZ7z78n", "currencyType": "REAL", "decimals": 19, "namespace": "nfnEcrKC"}, "customParameters": {"1KGe0Gwx": {}, "JTaAYWyJ": {}, "0KTahOu8": {}}, "extOrderNo": "nE8ziSZs", "extTxId": "S49vDzA0", "extUserId": "4rP72sSj", "issuedAt": "1999-06-26T00:00:00Z", "metadata": {"d0XpwQC2": "3xvMR0dP", "ZEB9fNqD": "S0q4fHJE", "Td35VadP": "ZvmZov5n"}, "namespace": "O8XxRTSV", "nonceStr": "TvpLKgCs", "paymentMethod": "lIwXUI83", "paymentMethodFee": 88, "paymentOrderNo": "ZykPWgw8", "paymentProvider": "ALIPAY", "paymentProviderFee": 11, "paymentStationUrl": "wn3ptft9", "price": 95, "refundedTime": "1988-06-02T00:00:00Z", "salesTax": 37, "sandbox": true, "sku": "Ay5Mxmyn", "status": "REFUND_FAILED", "statusReason": "sgOGoa7R", "subscriptionId": "viPKdUmF", "subtotalPrice": 4, "targetNamespace": "v3Bx6MgL", "targetUserId": "QxekmoH4", "tax": 87, "totalPrice": 20, "totalTax": 14, "txEndTime": "1984-04-05T00:00:00Z", "type": "rh7EVz3H", "userId": "I5ARUc8c", "vat": 94}' \
    > test.out 2>&1
eval_tap $? 228 'ProcessUserOrderNotification' test.out

#- 229 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'hS6T1XIB' \
    --userId 'u3fTKf9k' \
    > test.out 2>&1
eval_tap $? 229 'DownloadUserOrderReceipt' test.out

#- 230 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gncy83MD' \
    --body '{"currencyCode": "A8pBofIy", "currencyNamespace": "OqJRYsKB", "customParameters": {"2gmkQ2UY": {}, "xV6efmLO": {}, "IEbJGdNb": {}}, "description": "MkE2roib", "extOrderNo": "NA64Ig5l", "extUserId": "fJtWrjVw", "itemType": "MEDIA", "language": "AuES-mpgN_Bj", "metadata": {"AVmRcGfb": "SvD83YCi", "iTHI3YkG": "SoxanD3K", "Ecgx8neq": "CWC2eS11"}, "notifyUrl": "TmEvy0YC", "omitNotification": true, "platform": "WabTpsSv", "price": 74, "recurringPaymentOrderNo": "mJNzLC0Z", "region": "oVaHQBLM", "returnUrl": "vSIFM4v7", "sandbox": false, "sku": "G1dnsUxA", "subscriptionId": "JVuX7ptW", "title": "MDHHzdgK"}' \
    > test.out 2>&1
eval_tap $? 230 'CreateUserPaymentOrder' test.out

#- 231 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xVHF6Qs3' \
    --userId 'X9Haw7GS' \
    --body '{"description": "MZ8oZsZe"}' \
    > test.out 2>&1
eval_tap $? 231 'RefundUserPaymentOrder' test.out

#- 232 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ub0evv18' \
    --body '{"code": "rY9DWs3R", "orderNo": "FtFHcsB0"}' \
    > test.out 2>&1
eval_tap $? 232 'ApplyUserRedemption' test.out

#- 233 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'P3SvCwlr' \
    --chargeStatus 'NEVER' \
    --itemId 'Nxh6EGbE' \
    --limit '10' \
    --offset '35' \
    --sku 'owlhjBHs' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 233 'QueryUserSubscriptions' test.out

#- 234 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'EnDI9b1r' \
    --excludeSystem  \
    --limit '17' \
    --offset '51' \
    --subscriptionId 'QZsFwqtE' \
    > test.out 2>&1
eval_tap $? 234 'GetUserSubscriptionActivities' test.out

#- 235 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'aydkYo5a' \
    --body '{"grantDays": 9, "itemId": "XRAl8miK", "language": "1cjkq0Dp", "reason": "DPcZtmCZ", "region": "rvXZtTUl", "source": "uF9apxEB"}' \
    > test.out 2>&1
eval_tap $? 235 'PlatformSubscribeSubscription' test.out

#- 236 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'mICvGu8n' \
    --itemId 'Eg0lF1PJ' \
    > test.out 2>&1
eval_tap $? 236 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 237 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'r3qX2Rmq' \
    --userId 'hKVUh2GC' \
    > test.out 2>&1
eval_tap $? 237 'GetUserSubscription' test.out

#- 238 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'mjrMAs1R' \
    --userId 'eA4YKgUq' \
    > test.out 2>&1
eval_tap $? 238 'DeleteUserSubscription' test.out

#- 239 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'LvWRwflR' \
    --userId 'b8RSOwEx' \
    --force  \
    --body '{"immediate": true, "reason": "S9fNsgNm"}' \
    > test.out 2>&1
eval_tap $? 239 'CancelSubscription' test.out

#- 240 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'W7J18EWO' \
    --userId 't0LesGHW' \
    --body '{"grantDays": 74, "reason": "vxOhE02b"}' \
    > test.out 2>&1
eval_tap $? 240 'GrantDaysToSubscription' test.out

#- 241 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'GWVoyGBd' \
    --userId 'CaDJ9tSd' \
    --excludeFree  \
    --limit '6' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 241 'GetUserSubscriptionBillingHistories' test.out

#- 242 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'KTTd4YwD' \
    --userId 'uEQ0C9Mm' \
    --body '{"additionalData": {"cardSummary": "MIiAeLIQ"}, "authorisedTime": "1990-06-05T00:00:00Z", "chargebackReversedTime": "1979-04-30T00:00:00Z", "chargebackTime": "1976-04-13T00:00:00Z", "chargedTime": "1975-09-04T00:00:00Z", "createdTime": "1999-05-22T00:00:00Z", "currency": {"currencyCode": "BjgbqeR8", "currencySymbol": "R4Md8vxz", "currencyType": "VIRTUAL", "decimals": 59, "namespace": "LTSQYN12"}, "customParameters": {"TPvKDBek": {}, "w9TUb4gw": {}, "ZjoodrS1": {}}, "extOrderNo": "9JY4I3E9", "extTxId": "DvFNc2P4", "extUserId": "9g5FhBY2", "issuedAt": "1977-10-22T00:00:00Z", "metadata": {"MtaTjbd0": "3JfFVQgp", "mwtQ6KYV": "MmxYHFy7", "hEQ50uEc": "GPLtQIQX"}, "namespace": "QkaMApdW", "nonceStr": "ix1WV9wc", "paymentMethod": "nFzyOqCm", "paymentMethodFee": 41, "paymentOrderNo": "GQu5U63q", "paymentProvider": "STRIPE", "paymentProviderFee": 44, "paymentStationUrl": "Gdf9Zm81", "price": 8, "refundedTime": "1973-10-11T00:00:00Z", "salesTax": 11, "sandbox": false, "sku": "c901ujij", "status": "CHARGED", "statusReason": "9mrVhdgy", "subscriptionId": "4wOZA808", "subtotalPrice": 92, "targetNamespace": "hduJwGOr", "targetUserId": "AKwrLLiY", "tax": 82, "totalPrice": 79, "totalTax": 75, "txEndTime": "1971-01-10T00:00:00Z", "type": "2L78mZYr", "userId": "Ug6bUtKJ", "vat": 18}' \
    > test.out 2>&1
eval_tap $? 242 'ProcessUserSubscriptionNotification' test.out

#- 243 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'D6jgvVQW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VYDVYNTw' \
    --body '{"count": 45, "orderNo": "bXg6zk21"}' \
    > test.out 2>&1
eval_tap $? 243 'AcquireUserTicket' test.out

#- 244 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId '00ScTunR' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserCurrencyWallets' test.out

#- 245 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'CLWAeivW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TRieOAMP' \
    --limit '71' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 245 'ListUserCurrencyTransactions' test.out

#- 246 CheckWallet
eval_tap 0 246 'CheckWallet # SKIP deprecated' test.out

#- 247 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'c3ACthEI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OUx6dtmc' \
    --body '{"amount": 7, "expireAt": "1980-10-21T00:00:00Z", "origin": "Stadia", "reason": "cV2cZKIq", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 247 'CreditUserWallet' test.out

#- 248 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '9ryxvCDM' \
    --namespace "$AB_NAMESPACE" \
    --userId '1FaedvBt' \
    --body '{"amount": 46, "walletPlatform": "IOS"}' \
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
    --storeId 'jacdl2YU' \
    > test.out 2>&1
eval_tap $? 254 'ListViews' test.out

#- 255 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vZixqsZ1' \
    --body '{"displayOrder": 79, "localizations": {"qCUDzLnV": {"description": "7O4pjpDf", "localExt": {"V40vsoKk": {}, "zdGQqsio": {}, "Kc3yLOSP": {}}, "longDescription": "VHV4eRHA", "title": "XyeBOzGL"}, "ZnMEvk1A": {"description": "gKbFNlBb", "localExt": {"qy3ED7l6": {}, "ivTnNbik": {}, "9b9ybcY9": {}}, "longDescription": "7KlveatY", "title": "NPWb11he"}, "U5Vv2mgn": {"description": "1xPYsUE5", "localExt": {"tJHoOC7e": {}, "vqlUOx6u": {}, "7MVZQEbU": {}}, "longDescription": "NQ7YJk9v", "title": "sNrKsGV3"}}, "name": "u75PdUs5"}' \
    > test.out 2>&1
eval_tap $? 255 'CreateView' test.out

#- 256 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'grf638nI' \
    --storeId 'oPbyDZPU' \
    > test.out 2>&1
eval_tap $? 256 'GetView' test.out

#- 257 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'zFtMAmwy' \
    --storeId 'ulCvrnwx' \
    --body '{"displayOrder": 15, "localizations": {"J9XxxAxN": {"description": "L6Tvjsz4", "localExt": {"bF1Zy43i": {}, "uUajOyqj": {}, "LLAwRfwJ": {}}, "longDescription": "3ltLMQzd", "title": "cgJ67aBa"}, "MBdAFHSC": {"description": "hkSdaW1g", "localExt": {"UzZ4JaQf": {}, "DjhmqpSL": {}, "yC6HAhpl": {}}, "longDescription": "lAjA9CLi", "title": "FisvmKEn"}, "rv9QOBr5": {"description": "EJ4pSTQU", "localExt": {"ViNBWd1j": {}, "GAGibLXv": {}, "Xg3eRPwK": {}}, "longDescription": "fDdmfyAZ", "title": "gGecFRS6"}}, "name": "Mxz95eqN"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateView' test.out

#- 258 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'wnbQz8oN' \
    --storeId 'sY3yLxhP' \
    > test.out 2>&1
eval_tap $? 258 'DeleteView' test.out

#- 259 QueryWallets
eval_tap 0 259 'QueryWallets # SKIP deprecated' test.out

#- 260 GetWallet
eval_tap 0 260 'GetWallet # SKIP deprecated' test.out

#- 261 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'LhBwPXPa' \
    --end 'e6Ef2m7u' \
    --start 'SAdKPiot' \
    > test.out 2>&1
eval_tap $? 261 'SyncOrders' test.out

#- 262 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["OfiElnRd", "XWVRX6WA", "SVl4JIkH"], "apiKey": "QATEzxaw", "authoriseAsCapture": true, "blockedPaymentMethods": ["KnWZK5fR", "TILcdQk5", "9lA02qIb"], "clientKey": "pkVU7Mtd", "dropInSettings": "AI06ShDV", "liveEndpointUrlPrefix": "fNUDdLSV", "merchantAccount": "pBYe0L1v", "notificationHmacKey": "8tA0gQJn", "notificationPassword": "JF9YWSKs", "notificationUsername": "ORwnygX4", "returnUrl": "CniNucFG", "settings": "xKmHdDVk"}' \
    > test.out 2>&1
eval_tap $? 262 'TestAdyenConfig' test.out

#- 263 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "zzHaagw2", "privateKey": "mH49hYCA", "publicKey": "GYKfcJVn", "returnUrl": "BqQR77TU"}' \
    > test.out 2>&1
eval_tap $? 263 'TestAliPayConfig' test.out

#- 264 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "dpOfUiFu", "secretKey": "qwBuSoCX"}' \
    > test.out 2>&1
eval_tap $? 264 'TestCheckoutConfig' test.out

#- 265 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'n3k4XM8x' \
    > test.out 2>&1
eval_tap $? 265 'DebugMatchedPaymentMerchantConfig' test.out

#- 266 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "3wEJhDmL", "clientSecret": "y9CeSCjw", "returnUrl": "Ac8NNzGx", "webHookId": "MEVyHmfO"}' \
    > test.out 2>&1
eval_tap $? 266 'TestPayPalConfig' test.out

#- 267 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["sxdcedr5", "Z8JLdBGb", "L0BddxWH"], "publishableKey": "2qwJ0YRt", "secretKey": "vxkPsgGy", "webhookSecret": "BvemvD5t"}' \
    > test.out 2>&1
eval_tap $? 267 'TestStripeConfig' test.out

#- 268 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "VPPcpArr", "key": "QMBeNLVp", "mchid": "hcWQdw6o", "returnUrl": "X8oZ2yvj"}' \
    > test.out 2>&1
eval_tap $? 268 'TestWxPayConfig' test.out

#- 269 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "Wu7psGuA", "flowCompletionUrl": "kgQmw3Pa", "merchantId": 9, "projectId": 51, "projectSecretKey": "wd5RWQGm"}' \
    > test.out 2>&1
eval_tap $? 269 'TestXsollaConfig' test.out

#- 270 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '9Zo0mZlL' \
    > test.out 2>&1
eval_tap $? 270 'GetPaymentMerchantConfig' test.out

#- 271 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '1HT8Curj' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["r5pjZnM6", "bbXWYCCs", "6xqku2vi"], "apiKey": "9XXZqBMV", "authoriseAsCapture": false, "blockedPaymentMethods": ["63vvHMpm", "K7ePOCWk", "xFczmVQe"], "clientKey": "cXjvY5Lg", "dropInSettings": "qT6CW0KD", "liveEndpointUrlPrefix": "2oztBUiE", "merchantAccount": "WsOKG7Lx", "notificationHmacKey": "FajYBcRf", "notificationPassword": "mY5uUJL2", "notificationUsername": "fapHK25N", "returnUrl": "s6jAmSSy", "settings": "bdbaPxyt"}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateAdyenConfig' test.out

#- 272 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'kTIxQkHx' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 272 'TestAdyenConfigById' test.out

#- 273 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'wE0ubUuW' \
    --sandbox  \
    --validate  \
    --body '{"appId": "3LgE9k3z", "privateKey": "0T39WW1h", "publicKey": "RLEkSwLz", "returnUrl": "GwcweiMi"}' \
    > test.out 2>&1
eval_tap $? 273 'UpdateAliPayConfig' test.out

#- 274 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'S8UqQ8ZU' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 274 'TestAliPayConfigById' test.out

#- 275 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'VdGUwrCP' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "2zcXTHhw", "secretKey": "BlscNBTM"}' \
    > test.out 2>&1
eval_tap $? 275 'UpdateCheckoutConfig' test.out

#- 276 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'kpPYpqys' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 276 'TestCheckoutConfigById' test.out

#- 277 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'GomjmZA0' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "UY2vmylF", "clientSecret": "BXgPBTjC", "returnUrl": "AR2rcuoz", "webHookId": "5Amiri69"}' \
    > test.out 2>&1
eval_tap $? 277 'UpdatePayPalConfig' test.out

#- 278 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'JlviUcFt' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 278 'TestPayPalConfigById' test.out

#- 279 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'YAcAdOz8' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["ItscJpHg", "9XtCNGyY", "AcX0Bma5"], "publishableKey": "LDwIc9Y6", "secretKey": "mp16GYDJ", "webhookSecret": "JWqRZiGh"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateStripeConfig' test.out

#- 280 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '5SQX6UPC' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 280 'TestStripeConfigById' test.out

#- 281 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'N27waIRU' \
    --validate  \
    --body '{"appId": "lMNu2EMY", "key": "nY1f7XnM", "mchid": "7JLfp7AO", "returnUrl": "RX3g0f3i"}' \
    > test.out 2>&1
eval_tap $? 281 'UpdateWxPayConfig' test.out

#- 282 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'rv4uDQW0' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 282 'UpdateWxPayConfigCert' test.out

#- 283 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '6HGIZZjg' \
    > test.out 2>&1
eval_tap $? 283 'TestWxPayConfigById' test.out

#- 284 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '81GPhCIy' \
    --validate  \
    --body '{"apiKey": "qXgIFvXP", "flowCompletionUrl": "U5UO1MGw", "merchantId": 81, "projectId": 13, "projectSecretKey": "TNCr5gH7"}' \
    > test.out 2>&1
eval_tap $? 284 'UpdateXsollaConfig' test.out

#- 285 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'uxRoB1zG' \
    > test.out 2>&1
eval_tap $? 285 'TestXsollaConfigById' test.out

#- 286 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'ysuzq5ds' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 286 'UpdateXsollaUIConfig' test.out

#- 287 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '53' \
    --namespace "$AB_NAMESPACE" \
    --offset '36' \
    --region 'g0eoT3m3' \
    > test.out 2>&1
eval_tap $? 287 'QueryPaymentProviderConfig' test.out

#- 288 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "ADYEN", "namespace": "sxzgp5c0", "region": "o7CKfEeG", "sandboxTaxJarApiToken": "Rg6v6Gy4", "specials": ["CHECKOUT", "WALLET", "XSOLLA"], "taxJarApiToken": "VOcmjEkh", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 288 'CreatePaymentProviderConfig' test.out

#- 289 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 289 'GetAggregatePaymentProviders' test.out

#- 290 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'hm1aPxxr' \
    > test.out 2>&1
eval_tap $? 290 'DebugMatchedPaymentProviderConfig' test.out

#- 291 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 291 'GetSpecialPaymentProviders' test.out

#- 292 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '7ngGIYNc' \
    --body '{"aggregate": "ADYEN", "namespace": "18lsnhfR", "region": "0WVQ8XBt", "sandboxTaxJarApiToken": "iOzD8jo1", "specials": ["ALIPAY", "CHECKOUT", "XSOLLA"], "taxJarApiToken": "3skuJT2V", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 292 'UpdatePaymentProviderConfig' test.out

#- 293 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'giXQyuvB' \
    > test.out 2>&1
eval_tap $? 293 'DeletePaymentProviderConfig' test.out

#- 294 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 294 'GetPaymentTaxConfig' test.out

#- 295 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "Y5MAXwY7", "taxJarApiToken": "mIVjGJGS", "taxJarEnabled": false, "taxJarProductCodesMapping": {"7l2gJfq4": "B4twxnsk", "zHr71P31": "b9uYCTpx", "FLYVy7TE": "a7G3ARAD"}}' \
    > test.out 2>&1
eval_tap $? 295 'UpdatePaymentTaxConfig' test.out

#- 296 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'jRgGYqaE' \
    --end 'gFxMdiVm' \
    --start 'aS3YSemf' \
    > test.out 2>&1
eval_tap $? 296 'SyncPaymentOrders' test.out

#- 297 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'kE4vf7lI' \
    --storeId 'VbbPz7xl' \
    > test.out 2>&1
eval_tap $? 297 'PublicGetRootCategories' test.out

#- 298 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'lqcOAmjV' \
    --storeId 'ADhrYeFU' \
    > test.out 2>&1
eval_tap $? 298 'DownloadCategories' test.out

#- 299 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'Fc0chtef' \
    --namespace "$AB_NAMESPACE" \
    --language 'ohP5z333' \
    --storeId 'TlHwyAMk' \
    > test.out 2>&1
eval_tap $? 299 'PublicGetCategory' test.out

#- 300 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '2LNgZaeO' \
    --namespace "$AB_NAMESPACE" \
    --language 'Q9cLcTb6' \
    --storeId '0HCoj7ES' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetChildCategories' test.out

#- 301 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'ZlB9af2b' \
    --namespace "$AB_NAMESPACE" \
    --language 'djjQXxSF' \
    --storeId 'k8dfTAno' \
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
    --language 'H7pkgWLj' \
    --region 'ueGXuGQU' \
    --storeId 'ZAQo5WN2' \
    --appId 'UYaQGyPw' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetItemByAppId' test.out

#- 304 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --baseAppId 'Fyd1QhZZ' \
    --categoryPath 'KMwCCyyR' \
    --features 'YojXchi1' \
    --includeSubCategoryItem  \
    --itemType 'CODE' \
    --language 'jLzJjGFM' \
    --limit '66' \
    --offset '8' \
    --region 'GmakWc42' \
    --sortBy 'name:desc,name,createdAt:asc' \
    --storeId 'ak7xZWpU' \
    --tags 'RdvcWV9Q' \
    > test.out 2>&1
eval_tap $? 304 'PublicQueryItems' test.out

#- 305 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'UMS13AJK' \
    --region '977aaiMh' \
    --storeId 'rl8Q8LsQ' \
    --sku 'wmXJH2L5' \
    > test.out 2>&1
eval_tap $? 305 'PublicGetItemBySku' test.out

#- 306 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'C4cBVM1j' \
    --region '7WR0FQX7' \
    --storeId 'nU0eN65I' \
    --itemIds 'FWDgUJev' \
    > test.out 2>&1
eval_tap $? 306 'PublicBulkGetItems' test.out

#- 307 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["FeLoRhXj", "AiAa7roR", "PdooPYfr"]}' \
    > test.out 2>&1
eval_tap $? 307 'PublicValidateItemPurchaseCondition' test.out

#- 308 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'APP' \
    --limit '12' \
    --offset '63' \
    --region 'Rz8Hz6cH' \
    --storeId 'hB06Qoek' \
    --keyword '0DbedCrR' \
    --language 'tHMRHBKK' \
    > test.out 2>&1
eval_tap $? 308 'PublicSearchItems' test.out

#- 309 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'vUlrirVN' \
    --namespace "$AB_NAMESPACE" \
    --language 'tpjUw9Lu' \
    --region 'MAtoOLin' \
    --storeId '6Tgk9nkC' \
    > test.out 2>&1
eval_tap $? 309 'PublicGetApp' test.out

#- 310 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'REho83ma' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 310 'PublicGetItemDynamicData' test.out

#- 311 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '1DgiUVNS' \
    --namespace "$AB_NAMESPACE" \
    --language '8mxdfnHt' \
    --populateBundle  \
    --region 'M2voFWFZ' \
    --storeId 'YuuMmnIS' \
    > test.out 2>&1
eval_tap $? 311 'PublicGetItem' test.out

#- 312 GetPaymentCustomization
eval_tap 0 312 'GetPaymentCustomization # SKIP deprecated' test.out

#- 313 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "hIqVT5xY", "paymentProvider": "STRIPE", "returnUrl": "LBZQzdr3", "ui": "TqnEsEif", "zipCode": "vZUbQy1u"}' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetPaymentUrl' test.out

#- 314 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aw6rKgdd' \
    > test.out 2>&1
eval_tap $? 314 'PublicGetPaymentMethods' test.out

#- 315 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'W5zc1HCo' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetUnpaidPaymentOrder' test.out

#- 316 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CUW4DfMa' \
    --paymentProvider 'ADYEN' \
    --zipCode '2faPMDne' \
    --body '{"token": "swbAq8kK"}' \
    > test.out 2>&1
eval_tap $? 316 'Pay' test.out

#- 317 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tmtWFKMD' \
    > test.out 2>&1
eval_tap $? 317 'PublicCheckPaymentOrderPaidStatus' test.out

#- 318 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'WXPAY' \
    --region 'mukqYwFk' \
    > test.out 2>&1
eval_tap $? 318 'GetPaymentPublicConfig' test.out

#- 319 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'IqjaJ6KW' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetQRCode' test.out

#- 320 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'vCIgZHuI' \
    --foreinginvoice 'pHv3rXmf' \
    --invoiceId 'ClGm3ijq' \
    --payload 'rp9M8I66' \
    --redirectResult '09iHxUeo' \
    --resultCode 'gE3PGMY2' \
    --sessionId 'XKofbfEF' \
    --status 'bCNjz5hK' \
    --token 'CQFFNT67' \
    --type 'uhwanRzn' \
    --userId 'rSUfYERz' \
    --orderNo 'KoIHVOYu' \
    --paymentOrderNo '8T25B34C' \
    --paymentProvider 'WXPAY' \
    --returnUrl 'UxL4oilS' \
    > test.out 2>&1
eval_tap $? 320 'PublicNormalizePaymentReturnUrl' test.out

#- 321 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'oSGpclhP' \
    --paymentOrderNo 'FuWoQODp' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 321 'GetPaymentTaxValue' test.out

#- 322 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'vUbpT8pg' \
    > test.out 2>&1
eval_tap $? 322 'GetRewardByCode' test.out

#- 323 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'uxTE3Soc' \
    --limit '14' \
    --offset '17' \
    --sortBy 'rewardCode:desc,namespace,namespace:asc' \
    > test.out 2>&1
eval_tap $? 323 'QueryRewards1' test.out

#- 324 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId '92C5HXeK' \
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
    --appIds 'ndepS68U,aEkfqU8u,vsvoKGlm' \
    --itemIds 'X2eQhVsm,QEwoPP9k,dSq48y6Q' \
    --skus '6zt3lnPz,DEThyej9,XiMfN60Q' \
    > test.out 2>&1
eval_tap $? 326 'PublicExistsAnyMyActiveEntitlement' test.out

#- 327 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'xiVWhC8D' \
    > test.out 2>&1
eval_tap $? 327 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 328 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'fCniHS8L' \
    > test.out 2>&1
eval_tap $? 328 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 329 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'VNBMYw44' \
    > test.out 2>&1
eval_tap $? 329 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 330 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'Jb6zqg5Y,qDBKntZ2,vaQq9t2t' \
    --itemIds '9H5oF93r,yhBjPMAY,2o8WnQ46' \
    --skus 'GNEogoK5,IwFOYdOw,6UB7RHw7' \
    > test.out 2>&1
eval_tap $? 330 'PublicGetEntitlementOwnershipToken' test.out

#- 331 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'UsT5DM8A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 331 'PublicGetMyWallet' test.out

#- 332 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'fuGMDjwA' \
    --body '{"epicGamesJwtToken": "AkhjzAbm"}' \
    > test.out 2>&1
eval_tap $? 332 'SyncEpicGameDLC' test.out

#- 333 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'UvciJcry' \
    --body '{"serviceLabel": 100}' \
    > test.out 2>&1
eval_tap $? 333 'PublicSyncPsnDlcInventory' test.out

#- 334 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'cDed9t6e' \
    --body '{"serviceLabels": [80, 59, 14]}' \
    > test.out 2>&1
eval_tap $? 334 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 335 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'mxBFVA3h' \
    --body '{"appId": "UsxGXaid", "steamId": "pvfYlnMA"}' \
    > test.out 2>&1
eval_tap $? 335 'SyncSteamDLC' test.out

#- 336 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'mRH9m8yr' \
    --body '{"xstsToken": "MsnUr2CB"}' \
    > test.out 2>&1
eval_tap $? 336 'SyncXboxDLC' test.out

#- 337 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'XSs3KElN' \
    --appType 'DEMO' \
    --entitlementClazz 'APP' \
    --entitlementName 'rMkvx5Cy' \
    --features '5mE5wggb,f9YBSU1G,13PSVxMS' \
    --itemId 'e3i29ca7,PtFgKw6n,NJ5pMPFc' \
    --limit '30' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 337 'PublicQueryUserEntitlements' test.out

#- 338 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'g8M8S4kF' \
    --appId 'GyvlOgLv' \
    > test.out 2>&1
eval_tap $? 338 'PublicGetUserAppEntitlementByAppId' test.out

#- 339 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '5ob2meYR' \
    --limit '26' \
    --offset '75' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 339 'PublicQueryUserEntitlementsByAppType' test.out

#- 340 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'SPw1c7KR' \
    --entitlementClazz 'CODE' \
    --itemId '2CU16ZPA' \
    > test.out 2>&1
eval_tap $? 340 'PublicGetUserEntitlementByItemId' test.out

#- 341 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'A7IQiPeJ' \
    --entitlementClazz 'MEDIA' \
    --sku '2CnswSPc' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserEntitlementBySku' test.out

#- 342 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'kZcSWFTZ' \
    --appIds 'q7lt5KKf,IkQDIHhY,UdXXiUpW' \
    --itemIds 'ZQj8si5d,rzlEpaiK,LMqODu37' \
    --skus 'L7sib17q,KOSDdDDi,npkA3Dnh' \
    > test.out 2>&1
eval_tap $? 342 'PublicExistsAnyUserActiveEntitlement' test.out

#- 343 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'IDTfmgNY' \
    --appId '1NX0hzs2' \
    > test.out 2>&1
eval_tap $? 343 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 344 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'piBQLZjw' \
    --entitlementClazz 'MEDIA' \
    --itemId 'bO4MkZ1s' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 345 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '7Co4FebY' \
    --ids 'c6Qode5o,8DBLXxV8,7j4d3fV1' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 346 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'GOd7w7RM' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'lx969kKv' \
    > test.out 2>&1
eval_tap $? 346 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 347 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'IxRmIYRw' \
    --namespace "$AB_NAMESPACE" \
    --userId '9KUbr7tr' \
    > test.out 2>&1
eval_tap $? 347 'PublicGetUserEntitlement' test.out

#- 348 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'mdTfIUre' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j0P8nUjF' \
    --body '{"options": ["yYd6zW0Q", "BsCI6PTf", "z9apt9DZ"], "requestId": "Sj9AmuAe", "useCount": 8}' \
    > test.out 2>&1
eval_tap $? 348 'PublicConsumeUserEntitlement' test.out

#- 349 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'O7n9IifG' \
    --body '{"code": "9jbrno4e", "language": "Nf-Aycj", "region": "v2FcHHCr"}' \
    > test.out 2>&1
eval_tap $? 349 'PublicRedeemCode' test.out

#- 350 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'SBlUvibQ' \
    --body '{"excludeOldTransactions": true, "language": "PA_QsBh", "productId": "RTK0kped", "receiptData": "KqtUkUMu", "region": "rgKYEHaU", "transactionId": "rBsaCww7"}' \
    > test.out 2>&1
eval_tap $? 350 'PublicFulfillAppleIAPItem' test.out

#- 351 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'H4YgzbsH' \
    --body '{"epicGamesJwtToken": "uuoWTuDm"}' \
    > test.out 2>&1
eval_tap $? 351 'SyncEpicGamesInventory' test.out

#- 352 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCZcP6Gt' \
    --body '{"autoAck": false, "language": "yE-Hltn", "orderId": "zd9KxK06", "packageName": "47R5ugtx", "productId": "evZqguOC", "purchaseTime": 82, "purchaseToken": "WmNUxGSq", "region": "PagrMY5z"}' \
    > test.out 2>&1
eval_tap $? 352 'PublicFulfillGoogleIAPItem' test.out

#- 353 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'LbhMNVLL' \
    --body '{"currencyCode": "nCu0zIOr", "price": 0.9709914059353391, "productId": "qKnXyE6h", "serviceLabel": 16}' \
    > test.out 2>&1
eval_tap $? 353 'PublicReconcilePlayStationStore' test.out

#- 354 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'wPegdFWc' \
    --body '{"currencyCode": "lMsQCa0q", "price": 0.6586073345636162, "productId": "Wfhko0Rb", "serviceLabels": [56, 8, 95]}' \
    > test.out 2>&1
eval_tap $? 354 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 355 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'U8n94HAX' \
    --body '{"appId": "8tVB2pgH", "language": "TdRJ", "region": "gvGwmHdA", "stadiaPlayerId": "Y0q2e0tU"}' \
    > test.out 2>&1
eval_tap $? 355 'SyncStadiaEntitlement' test.out

#- 356 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '9NAH2Zxc' \
    --body '{"appId": "aGvrRNb6", "currencyCode": "DPQjNq5m", "language": "hgB_IpJQ_547", "price": 0.2414123764336592, "productId": "VATOpwBA", "region": "aVWUJmEG", "steamId": "880FozK2"}' \
    > test.out 2>&1
eval_tap $? 356 'SyncSteamInventory' test.out

#- 357 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '8anbsBDA' \
    --body '{"gameId": "N8LOCBgr", "language": "GAK_NUTu", "region": "G9zdplO6"}' \
    > test.out 2>&1
eval_tap $? 357 'SyncTwitchDropsEntitlement' test.out

#- 358 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '7RaGRgIK' \
    --body '{"currencyCode": "tRM4rauN", "price": 0.21799094416236764, "productId": "mWmyWL7T", "xstsToken": "apDin7iT"}' \
    > test.out 2>&1
eval_tap $? 358 'SyncXboxInventory' test.out

#- 359 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIKRKRNV' \
    --itemId 'TDu641pt' \
    --limit '91' \
    --offset '90' \
    --status 'REFUNDING' \
    > test.out 2>&1
eval_tap $? 359 'PublicQueryUserOrders' test.out

#- 360 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'YDKhQNOc' \
    --body '{"currencyCode": "CVtD2WIx", "discountedPrice": 92, "ext": {"UIOrJTvo": {}, "X39sWPMX": {}, "3NxmmGfR": {}}, "itemId": "vzELCGWq", "language": "qTrN-QvBG", "price": 94, "quantity": 12, "region": "EX0kt2qY", "returnUrl": "I2Kpzeiy"}' \
    > test.out 2>&1
eval_tap $? 360 'PublicCreateUserOrder' test.out

#- 361 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HxO8msRm' \
    --userId 'S0n7WNno' \
    > test.out 2>&1
eval_tap $? 361 'PublicGetUserOrder' test.out

#- 362 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AJ5nYVi5' \
    --userId 'NgiYkMj2' \
    > test.out 2>&1
eval_tap $? 362 'PublicCancelUserOrder' test.out

#- 363 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'LY3OzJxU' \
    --userId 'MxOLHPTR' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetUserOrderHistories' test.out

#- 364 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bSjos8gx' \
    --userId 'tauOKJso' \
    > test.out 2>&1
eval_tap $? 364 'PublicDownloadUserOrderReceipt' test.out

#- 365 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'KUFwaVCf' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetPaymentAccounts' test.out

#- 366 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'Wo4gfnbC' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'Zt1diRhC' \
    > test.out 2>&1
eval_tap $? 366 'PublicDeletePaymentAccount' test.out

#- 367 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '4281LAN4' \
    --language 'hxNXRn6G' \
    --region 'WULxO2sP' \
    --storeId 'Qwt13kqj' \
    --viewId 'UQNOzTSg' \
    > test.out 2>&1
eval_tap $? 367 'PublicListActiveSections' test.out

#- 368 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'azcEjnTL' \
    --chargeStatus 'SETUP' \
    --itemId 'LzpE45YV' \
    --limit '6' \
    --offset '82' \
    --sku 'Jxue0zbY' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 368 'PublicQueryUserSubscriptions' test.out

#- 369 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'lqiEoN5G' \
    --body '{"currencyCode": "GNUBwVRM", "itemId": "Sm2HI28O", "language": "GnoQ", "region": "LTyzoM1I", "returnUrl": "XntUoZbb", "source": "zD38BUMj"}' \
    > test.out 2>&1
eval_tap $? 369 'PublicSubscribeSubscription' test.out

#- 370 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '0y3jflnX' \
    --itemId 'UwNix70j' \
    > test.out 2>&1
eval_tap $? 370 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 371 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xiE9KMQd' \
    --userId 'GuZkoDNp' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetUserSubscription' test.out

#- 372 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4ptbYFng' \
    --userId 'GcnyRTaj' \
    > test.out 2>&1
eval_tap $? 372 'PublicChangeSubscriptionBillingAccount' test.out

#- 373 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'yVuAR1zf' \
    --userId 'Wv4mWkaN' \
    --body '{"immediate": true, "reason": "K3W1S0UB"}' \
    > test.out 2>&1
eval_tap $? 373 'PublicCancelSubscription' test.out

#- 374 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'evkEAnyo' \
    --userId 'WgPUxamX' \
    --excludeFree  \
    --limit '60' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetUserSubscriptionBillingHistories' test.out

#- 375 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xi0Sn4NG' \
    --language 'rr1V7KGu' \
    --storeId 'ltlLP1GB' \
    > test.out 2>&1
eval_tap $? 375 'PublicListViews' test.out

#- 376 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'WAhRgXzm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fLYJgDyQ' \
    > test.out 2>&1
eval_tap $? 376 'PublicGetWallet' test.out

#- 377 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'J2F2TIqh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iLzYpndh' \
    --limit '23' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 377 'PublicListUserWalletTransactions' test.out

#- 378 QueryItems1
./ng net.accelbyte.sdk.cli.Main platform queryItems1 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate '82le7xzd' \
    --baseAppId 'Vu0ekjkD' \
    --categoryPath 'lOORRYrg' \
    --features 'r9cDCL1R' \
    --includeSubCategoryItem  \
    --itemName 'e06eRQq0' \
    --itemStatus 'ACTIVE' \
    --itemType 'INGAMEITEM' \
    --limit '98' \
    --offset '81' \
    --region '1RIGQqdt' \
    --sortBy 'displayOrder,createdAt:desc,name:asc' \
    --storeId '9Eh46qMP' \
    --tags 'FAOSKO9S' \
    --targetNamespace 'X1lfmagI' \
    > test.out 2>&1
eval_tap $? 378 'QueryItems1' test.out

#- 379 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jolTofBs' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 379 'ImportStore1' test.out

#- 380 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mjA1GZLU' \
    --body '{"itemIds": ["LOUHlLbN", "qttxFJ2D", "U0SOTbfB"]}' \
    > test.out 2>&1
eval_tap $? 380 'ExportStore1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE