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
echo "1..346"

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
    --body '{"context": {"item": {"appId": "XqdVHX8h", "appType": "GAME", "baseAppId": "znHpByDY", "boothName": "MVg7kxFM", "boundItemIds": ["Dq4RvZf8", "KbGvsHH4", "EhvjkZWO"], "categoryPath": "zFdhixJK", "clazz": "wrLFKnfq", "createdAt": "1977-02-11T00:00:00Z", "description": "TLdZ9LMS", "displayOrder": 7, "entitlementType": "DURABLE", "ext": {"Y1A9dxnX": {}, "RudbuxZy": {}, "GnmijwT9": {}}, "features": ["HLkdqIpi", "wMhE1Kr1", "rN0v7cdD"], "images": [{"as": "IVhUyq0P", "caption": "HJjY7TZy", "height": 56, "imageUrl": "FPX7CarK", "smallImageUrl": "Bg1qVayO", "width": 87}, {"as": "8NiAgPgB", "caption": "vg9OJ8wt", "height": 48, "imageUrl": "m9CkxCF6", "smallImageUrl": "auDdWceD", "width": 44}, {"as": "qBMbOMFs", "caption": "5q85RPL1", "height": 54, "imageUrl": "TXS7QRTx", "smallImageUrl": "MUyu6JR3", "width": 62}], "itemId": "Mm0pW4vn", "itemIds": ["wyykRSQY", "dFRN5nOy", "LonbB97r"], "itemQty": {"bW8qsdaE": 88, "UaeCZVEW": 94, "gg6CWgJv": 78}, "itemType": "SUBSCRIPTION", "language": "EWjiN9vv", "listable": true, "localExt": {"96JxIF0C": {}, "VqqxL0H3": {}, "V9sVxhw9": {}}, "longDescription": "CX2oz9gU", "maxCount": 59, "maxCountPerUser": 15, "name": "8ksBuU1l", "namespace": "j1TYez8S", "optionBoxConfig": {"boxItems": [{"count": 68, "itemId": "GmbOsOkZ", "itemSku": "9FGVYKVS"}, {"count": 3, "itemId": "aPkBeEXA", "itemSku": "N6YI6pwC"}, {"count": 91, "itemId": "Sf4cW04J", "itemSku": "h63itiNn"}]}, "purchasable": false, "purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 55, "comparison": "includes", "name": "j0W3QnGw", "predicateType": "EntitlementPredicate", "value": "DMZame6E", "values": ["9A2sAeEb", "XRZisuYi", "75gV4NR3"]}, {"anyOf": 28, "comparison": "includes", "name": "bBs713HQ", "predicateType": "EntitlementPredicate", "value": "qVsrajSW", "values": ["UuiNpVEI", "kow6XyTT", "dgu7CZLc"]}, {"anyOf": 86, "comparison": "isGreaterThan", "name": "PyfnVAzX", "predicateType": "SeasonTierPredicate", "value": "W68YaA9h", "values": ["fK52RGIu", "1wCMixsV", "fiqDMSDQ"]}]}, {"operator": "and", "predicates": [{"anyOf": 33, "comparison": "includes", "name": "rsLvGTus", "predicateType": "SeasonPassPredicate", "value": "brcNdqOE", "values": ["3PGuJfMT", "l7OX32nQ", "9n6R0mQP"]}, {"anyOf": 15, "comparison": "isLessThan", "name": "F9cECKjL", "predicateType": "SeasonPassPredicate", "value": "QiRG80U4", "values": ["VFooiWFM", "3mu2NEpf", "jwxEPL8A"]}, {"anyOf": 75, "comparison": "isLessThan", "name": "du1syHs0", "predicateType": "EntitlementPredicate", "value": "f23X628a", "values": ["OhA3bTuu", "Vcof0c7X", "XDFc5df4"]}]}, {"operator": "or", "predicates": [{"anyOf": 1, "comparison": "includes", "name": "QjOlU99k", "predicateType": "SeasonTierPredicate", "value": "fsuvOISt", "values": ["XodO9iSs", "nKWNORJH", "IJNVCpeE"]}, {"anyOf": 58, "comparison": "isLessThan", "name": "GXJw5Jca", "predicateType": "SeasonPassPredicate", "value": "wesZJ4TW", "values": ["kDRLs0ej", "WDPmULop", "tsd01RSo"]}, {"anyOf": 11, "comparison": "isGreaterThan", "name": "mfuaVDyd", "predicateType": "EntitlementPredicate", "value": "aQ1EqdKe", "values": ["88VimQdn", "CZ92UMhD", "5jdp1RtY"]}]}]}, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 73, "fixedTrialCycles": 44, "graceDays": 39}, "region": "iH4V3h3N", "regionData": [{"currencyCode": "QNOTH9ey", "currencyNamespace": "pTTuW4Ld", "currencyType": "VIRTUAL", "discountAmount": 89, "discountExpireAt": "1984-06-24T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1985-08-12T00:00:00Z", "discountedPrice": 29, "expireAt": "1985-10-03T00:00:00Z", "price": 100, "purchaseAt": "1983-12-12T00:00:00Z", "trialPrice": 76}, {"currencyCode": "8Y9GRdkv", "currencyNamespace": "Gxx5h4yd", "currencyType": "REAL", "discountAmount": 54, "discountExpireAt": "1973-04-30T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1993-07-04T00:00:00Z", "discountedPrice": 22, "expireAt": "1995-04-21T00:00:00Z", "price": 13, "purchaseAt": "1993-07-13T00:00:00Z", "trialPrice": 7}, {"currencyCode": "QC7g2h2i", "currencyNamespace": "EJ92Gr8F", "currencyType": "REAL", "discountAmount": 9, "discountExpireAt": "1980-03-04T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1989-09-24T00:00:00Z", "discountedPrice": 80, "expireAt": "1982-10-27T00:00:00Z", "price": 11, "purchaseAt": "1981-02-05T00:00:00Z", "trialPrice": 59}], "seasonType": "PASS", "sku": "3YyMjxqn", "stackable": false, "status": "ACTIVE", "tags": ["BhT2Lf7E", "gvNGAtDG", "ymOqQAOc"], "targetCurrencyCode": "0gkqzD9l", "targetItemId": "aPNVuapm", "targetNamespace": "0pAmnsaJ", "thumbnailUrl": "2q7u7yiI", "title": "GKV5M8vX", "updatedAt": "1987-08-31T00:00:00Z", "useCount": 28}, "namespace": "ZRqZSjmC", "order": {"currency": {"currencyCode": "j2nJuGuY", "currencySymbol": "PGkbJvYt", "currencyType": "VIRTUAL", "decimals": 98, "namespace": "BikSNl5i"}, "ext": {"vXNnBLJZ": {}, "VeMSbo3J": {}, "kmYRT6am": {}}, "free": false}, "source": "REDEEM_CODE"}, "script": "r48uWhUM", "type": "grantDays"}' \
    > test.out 2>&1
eval_tap $? 3 'TestFulfillmentScriptEval' test.out

#- 4 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'GcglEJju' \
    > test.out 2>&1
eval_tap $? 4 'GetFulfillmentScript' test.out

#- 5 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'jqzUuHLa' \
    --body '{"grantDays": "zhVLRf0C"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateFulfillmentScript' test.out

#- 6 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'l35wJSqa' \
    > test.out 2>&1
eval_tap $? 6 'DeleteFulfillmentScript' test.out

#- 7 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'vienjbTs' \
    --body '{"grantDays": "uHCcu61o"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateFulfillmentScript' test.out

#- 8 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --name 'Ltj8MG0H' \
    --offset '84' \
    --tag '8XdK5Jis' \
    > test.out 2>&1
eval_tap $? 8 'QueryCampaigns' test.out

#- 9 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ZBPcEi5n", "items": [{"extraSubscriptionDays": 46, "itemId": "Vu9TNad9", "itemName": "fKf11Pa4", "quantity": 26}, {"extraSubscriptionDays": 45, "itemId": "oC55v7rx", "itemName": "IPP2VIMD", "quantity": 37}, {"extraSubscriptionDays": 27, "itemId": "yM3xxgjZ", "itemName": "6cKjRrt4", "quantity": 80}], "maxRedeemCountPerCampaignPerUser": 61, "maxRedeemCountPerCode": 27, "maxRedeemCountPerCodePerUser": 58, "maxSaleCount": 67, "name": "2IJ7J5Na", "redeemEnd": "1985-03-03T00:00:00Z", "redeemStart": "1975-05-28T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["wL03Q1lg", "BmMaSTHV", "OLrrE3aT"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateCampaign' test.out

#- 10 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId '6Vh3IzJE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetCampaign' test.out

#- 11 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId '9UZw4RTA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "FqYHjF6l", "items": [{"extraSubscriptionDays": 25, "itemId": "m5yNOHR3", "itemName": "TUXD2y20", "quantity": 9}, {"extraSubscriptionDays": 54, "itemId": "PRoDmuRM", "itemName": "Zao2XDlx", "quantity": 97}, {"extraSubscriptionDays": 7, "itemId": "8EOpf2oS", "itemName": "iJPuNVq7", "quantity": 56}], "maxRedeemCountPerCampaignPerUser": 23, "maxRedeemCountPerCode": 85, "maxRedeemCountPerCodePerUser": 60, "maxSaleCount": 85, "name": "3y0OSAcY", "redeemEnd": "1976-04-04T00:00:00Z", "redeemStart": "1979-03-28T00:00:00Z", "redeemType": "ITEM", "status": "INACTIVE", "tags": ["GDl53X0v", "zpUhbWBf", "ZLkOo9ah"]}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateCampaign' test.out

#- 12 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '2a2T7pwt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetCampaignDynamic' test.out

#- 13 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tn5sol1h' \
    > test.out 2>&1
eval_tap $? 13 'GetRootCategories' test.out

#- 14 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YxssZfyX' \
    --body '{"categoryPath": "sZmIiE3e", "localizationDisplayNames": {"xOYrMuEn": "hjJlQoDW", "IqOtY6d7": "lrHDoSOk", "ENZI01Vq": "OsctEEBt"}}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCategory' test.out

#- 15 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId '6TfGaL4n' \
    > test.out 2>&1
eval_tap $? 15 'ListCategoriesBasic' test.out

#- 16 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'jkvgfIiu' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7lGGYNXT' \
    > test.out 2>&1
eval_tap $? 16 'GetCategory' test.out

#- 17 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath '4USVCAfj' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JxjSF0v1' \
    --body '{"localizationDisplayNames": {"ZFHfMT4R": "woLubrje", "oFkSjAGG": "FqalICIQ", "r4UbxhHa": "aK52pPyn"}}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateCategory' test.out

#- 18 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'AGC5xXWr' \
    --namespace "$AB_NAMESPACE" \
    --storeId '8IjeLhL8' \
    > test.out 2>&1
eval_tap $? 18 'DeleteCategory' test.out

#- 19 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'zP3YqeLb' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AdUnCzjb' \
    > test.out 2>&1
eval_tap $? 19 'GetChildCategories' test.out

#- 20 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath '3LmIixJg' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MCPHZALa' \
    > test.out 2>&1
eval_tap $? 20 'GetDescendantCategories' test.out

#- 21 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'XaCSCOPZ' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchNo '80' \
    --code 'KPmkpOyc' \
    --limit '28' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 21 'QueryCodes' test.out

#- 22 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'dQPKbeKe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"quantity": 1}' \
    > test.out 2>&1
eval_tap $? 22 'CreateCodes' test.out

#- 23 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'i0ozaqIg' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '63' \
    > test.out 2>&1
eval_tap $? 23 'Download' test.out

#- 24 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'pjqcopLn' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '30' \
    > test.out 2>&1
eval_tap $? 24 'BulkDisableCodes' test.out

#- 25 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'U2XWMnOR' \
    --namespace "$AB_NAMESPACE" \
    --batchNo '100' \
    > test.out 2>&1
eval_tap $? 25 'BulkEnableCodes' test.out

#- 26 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'tZd7IGQO' \
    --namespace "$AB_NAMESPACE" \
    --code 'tQoQQhyC' \
    --limit '75' \
    --offset '94' \
    --userId 'GNe0W6K1' \
    > test.out 2>&1
eval_tap $? 26 'QueryRedeemHistory' test.out

#- 27 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'SzmK670w' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    > test.out 2>&1
eval_tap $? 27 'GetCode' test.out

#- 28 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'yEk2HyPV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DisableCode' test.out

#- 29 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'hBocV46B' \
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
    --body '{"currencyCode": "A6jfAbCx", "currencySymbol": "Kxkd6jYA", "currencyType": "REAL", "decimals": 20, "localizationDescriptions": {"En22VIqI": "jbTXcQ4U", "ZyWgqu3F": "cfuPSXqR", "akIOmjnu": "eKFT86y0"}}' \
    > test.out 2>&1
eval_tap $? 31 'CreateCurrency' test.out

#- 32 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode 'zahGXetj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"LpObmWVm": "OdmPhnM8", "h9enHKqY": "mW1ZaQBX", "CdXO7qtU": "lI1yD5At"}}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateCurrency' test.out

#- 33 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'T2X6X7ZX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteCurrency' test.out

#- 34 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'fISplYBr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'GetCurrencyConfig' test.out

#- 35 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'UYkahpQf' \
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
    --body '{"data": [{"id": "4nod9qmf", "rewards": [{"currency": {"currencyCode": "DkUyeXLv", "namespace": "OqGm5QdU"}, "item": {"itemId": "N0p5ud53", "itemSku": "XLuqi8xY", "itemType": "xXQCKE0f"}, "quantity": 46, "type": "ITEM"}, {"currency": {"currencyCode": "U4erD5JD", "namespace": "VothkA9O"}, "item": {"itemId": "tqq2mgt5", "itemSku": "opZbDyZ6", "itemType": "Du8eMbSp"}, "quantity": 34, "type": "CURRENCY"}, {"currency": {"currencyCode": "7kbsaOhL", "namespace": "I4razm0z"}, "item": {"itemId": "HWBYgkmy", "itemSku": "S56cocZp", "itemType": "lPAzvsQy"}, "quantity": 38, "type": "CURRENCY"}]}, {"id": "wR2FMg9h", "rewards": [{"currency": {"currencyCode": "0BCYxeTl", "namespace": "OO45I7lJ"}, "item": {"itemId": "y8jnsfc6", "itemSku": "pvmpf6j7", "itemType": "oAfy1GKh"}, "quantity": 23, "type": "ITEM"}, {"currency": {"currencyCode": "tNY858s6", "namespace": "193JKsiL"}, "item": {"itemId": "NNzHpWo4", "itemSku": "pHkpSDWr", "itemType": "AWkBpMD6"}, "quantity": 69, "type": "CURRENCY"}, {"currency": {"currencyCode": "IYUpFOBz", "namespace": "CedOqPTM"}, "item": {"itemId": "IjvaEjiJ", "itemSku": "PClgpJBq", "itemType": "5RH2sdYS"}, "quantity": 16, "type": "ITEM"}]}, {"id": "xd47qkMz", "rewards": [{"currency": {"currencyCode": "UhOEgQS1", "namespace": "IKGnDs2s"}, "item": {"itemId": "f3mRenOa", "itemSku": "eIEZ840v", "itemType": "D350leJd"}, "quantity": 40, "type": "CURRENCY"}, {"currency": {"currencyCode": "1hP6Vq1D", "namespace": "HvDNDS2U"}, "item": {"itemId": "qT4GyvbL", "itemSku": "Fg3xWD6n", "itemType": "UmkJ5fOp"}, "quantity": 1, "type": "ITEM"}, {"currency": {"currencyCode": "nbe29yOm", "namespace": "pGExnVFD"}, "item": {"itemId": "pW58dkcR", "itemSku": "WNGTwsB0", "itemType": "SfNWmZ4U"}, "quantity": 38, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"EWXZukcL": "E6HLPcdE", "i75enXVK": "FR0F5OSm", "O3vBvzC4": "Ep8OjNty"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"8wRJXUaS": "fAYuRZvh", "kkge14ja": "CLQkjkDo", "uCWV4J5q": "QcHCjDH1"}}, {"platform": "STEAM", "platformDlcIdMap": {"0csWB8Nx": "4RD7IH1y", "ExNTxc6Y": "vAMnLBU6", "WIwi4HsZ": "l7PMcuqX"}}]}' \
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
    --entitlementClazz 'MEDIA' \
    --entitlementName 'VZZo0kVH' \
    --itemId 'VAOUgrtg,pjVs7rew,Py3S1Eez' \
    --limit '13' \
    --offset '29' \
    --userId 'pOwe1wR3' \
    > test.out 2>&1
eval_tap $? 42 'QueryEntitlements' test.out

#- 43 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'ad5Z3HYq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetEntitlement' test.out

#- 44 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '23' \
    --status 'FAIL' \
    --userId 'fm98VcQ0' \
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
    --body '{"bundleId": "tJjdK8EN", "password": "asYLXwfU"}' \
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
    --body '{"sandboxId": "sKuAaLWm"}' \
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
    --body '{"applicationName": "PNZk9KDD", "serviceAccountId": "PRssntKP"}' \
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
    --body '{"data": [{"itemIdentity": "FW9EpQmk", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"bg6B7CCR": "GvvwBthM", "ZIB7WQub": "7JgUrFYi", "COFCZuhL": "LPdrg0lJ"}}, {"itemIdentity": "6PETKXVT", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"dYh7snyQ": "wcEDmKsp", "cmkpwunL": "VcuoCRc5", "3kr52y8Z": "t3SEZf2d"}}, {"itemIdentity": "tOg5U67l", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"I1p1IrMs": "szNWpKbl", "9pJ2KsUr": "NfhnB2e0", "ta01J5UZ": "yzFx48WU"}}]}' \
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
    --body '{"environment": "mCg9a1cI"}' \
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
    --body '{"appId": "jlvTGeSb", "publisherAuthenticationKey": "RBk4sRtm"}' \
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
    --body '{"clientId": "zxtYFHT9", "clientSecret": "DfHi9g0x", "organizationId": "E2JEpAjU"}' \
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
    --body '{"relyingPartyCert": "oiwNS03o"}' \
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
    --password 'E6T2Au6O' \
    > test.out 2>&1
eval_tap $? 73 'UpdateXblBPCertFile' test.out

#- 74 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KTVRuoVc' \
    --body '{"categoryPath": "2FYkW6KE", "targetItemId": "mQhK76WD", "targetNamespace": "Y5IPD00j"}' \
    > test.out 2>&1
eval_tap $? 74 'SyncInGameItem' test.out

#- 75 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XUjPqUou' \
    --body '{"appId": "oVkrRVZE", "appType": "GAME", "baseAppId": "WPNc6qMr", "boothName": "xWsy98sx", "categoryPath": "GifrifsO", "clazz": "DMP5UXWS", "displayOrder": 73, "entitlementType": "CONSUMABLE", "ext": {"W2aEK2X5": {}, "ZoDVI9Pz": {}, "0w07CjGT": {}}, "features": ["eFaSgGT3", "rnW5cleC", "v2V9T30t"], "images": [{"as": "24TelCvQ", "caption": "AH1YAUP1", "height": 47, "imageUrl": "lRTw3jYu", "smallImageUrl": "rS9SetYO", "width": 40}, {"as": "T6xcAW8n", "caption": "4q0kJbx5", "height": 92, "imageUrl": "GIpzndzb", "smallImageUrl": "dvnef86i", "width": 20}, {"as": "bRdEonBW", "caption": "TyGq6h1U", "height": 69, "imageUrl": "gUUPxr9w", "smallImageUrl": "5REF8ByG", "width": 53}], "itemIds": ["7X1eBj6J", "OeDa3R92", "ENF1DyCZ"], "itemQty": {"IHcUGumY": 15, "YRpEAjRN": 54, "mehq0iHV": 19}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"YtPsxjiE": {"description": "D1i4gFN1", "localExt": {"Ow3vU9aJ": {}, "nZuP0UBx": {}, "PKnRR5lk": {}}, "longDescription": "GAPsnlJE", "title": "8YSonafJ"}, "kbKXZu8g": {"description": "vA8BoH0X", "localExt": {"Gsd3lNKp": {}, "kx58Zp3I": {}, "oDtCkk9M": {}}, "longDescription": "3yycUOig", "title": "WY2SxG6F"}, "Ag4fy4mB": {"description": "6fhXFgGK", "localExt": {"vIwnLXbS": {}, "pm2DBvmA": {}, "gAR3bcWe": {}}, "longDescription": "LsQuw7kh", "title": "fhKnprnL"}}, "maxCount": 45, "maxCountPerUser": 2, "name": "FQgnCcSU", "optionBoxConfig": {"boxItems": [{"count": 46, "itemId": "TGuxifR9", "itemSku": "YTC4i8MC"}, {"count": 11, "itemId": "dUa77ZGJ", "itemSku": "1Tt8Fjcn"}, {"count": 50, "itemId": "iy0m05VV", "itemSku": "lDzykhOo"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 50, "fixedTrialCycles": 53, "graceDays": 39}, "regionData": {"ITiyULvx": [{"currencyCode": "bzuZnWUj", "currencyNamespace": "tZhIATGp", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1998-12-14T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1989-12-02T00:00:00Z", "discountedPrice": 61, "expireAt": "1971-05-21T00:00:00Z", "price": 58, "purchaseAt": "1984-07-25T00:00:00Z", "trialPrice": 77}, {"currencyCode": "0HUoihQ6", "currencyNamespace": "steAhSKg", "currencyType": "REAL", "discountAmount": 48, "discountExpireAt": "1996-11-10T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1990-09-04T00:00:00Z", "discountedPrice": 31, "expireAt": "1991-05-24T00:00:00Z", "price": 27, "purchaseAt": "1983-08-08T00:00:00Z", "trialPrice": 70}, {"currencyCode": "2Z7sLdbV", "currencyNamespace": "gAB839hY", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1984-09-15T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1990-04-09T00:00:00Z", "discountedPrice": 5, "expireAt": "1988-02-01T00:00:00Z", "price": 77, "purchaseAt": "1972-11-05T00:00:00Z", "trialPrice": 52}], "4cIzkEuF": [{"currencyCode": "gUjSAM5C", "currencyNamespace": "9ChT1NqB", "currencyType": "VIRTUAL", "discountAmount": 66, "discountExpireAt": "1991-02-19T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1994-06-19T00:00:00Z", "discountedPrice": 27, "expireAt": "1973-03-05T00:00:00Z", "price": 4, "purchaseAt": "1973-05-27T00:00:00Z", "trialPrice": 41}, {"currencyCode": "QUt7pzh7", "currencyNamespace": "s4aE897U", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1979-10-30T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1993-09-30T00:00:00Z", "discountedPrice": 55, "expireAt": "1979-08-16T00:00:00Z", "price": 47, "purchaseAt": "1971-07-08T00:00:00Z", "trialPrice": 61}, {"currencyCode": "mWTdd0st", "currencyNamespace": "2I9aXnZk", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1989-09-25T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1997-04-21T00:00:00Z", "discountedPrice": 88, "expireAt": "1993-12-31T00:00:00Z", "price": 91, "purchaseAt": "1981-11-23T00:00:00Z", "trialPrice": 13}], "G3a2luOg": [{"currencyCode": "LNYHzMPo", "currencyNamespace": "enenkPWP", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1971-05-14T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1979-12-30T00:00:00Z", "discountedPrice": 34, "expireAt": "1990-04-30T00:00:00Z", "price": 22, "purchaseAt": "1997-07-26T00:00:00Z", "trialPrice": 70}, {"currencyCode": "xGTebL61", "currencyNamespace": "fAi8u9D5", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1989-06-11T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1978-03-05T00:00:00Z", "discountedPrice": 45, "expireAt": "1995-08-31T00:00:00Z", "price": 57, "purchaseAt": "1984-06-23T00:00:00Z", "trialPrice": 39}, {"currencyCode": "Nj8eCn05", "currencyNamespace": "uVsoxheg", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1985-11-09T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1995-10-22T00:00:00Z", "discountedPrice": 41, "expireAt": "1991-06-14T00:00:00Z", "price": 62, "purchaseAt": "1971-09-04T00:00:00Z", "trialPrice": 35}]}, "seasonType": "TIER", "sku": "46zxfNyu", "stackable": false, "status": "INACTIVE", "tags": ["ivcRWlKL", "vIvQ7UNn", "RfgeEzp6"], "targetCurrencyCode": "cDs7Zgx0", "targetNamespace": "cHWvY02H", "thumbnailUrl": "bfUB1Tqi", "useCount": 45}' \
    > test.out 2>&1
eval_tap $? 75 'CreateItem' test.out

#- 76 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'RbKEDAml' \
    --appId 'gszY7Ayc' \
    > test.out 2>&1
eval_tap $? 76 'GetItemByAppId' test.out

#- 77 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'm694Cpdr' \
    --baseAppId 'cE9VZGbj' \
    --categoryPath 'NKtZ07v6' \
    --features 'xnCa6uYE' \
    --itemType 'INGAMEITEM' \
    --limit '5' \
    --offset '47' \
    --region 'ZoTc0bgL' \
    --sortBy 'displayOrder:asc,createdAt' \
    --storeId '7jHJGhJH' \
    --tags 'g44iUNR9' \
    --targetNamespace 'i9vQpRto' \
    > test.out 2>&1
eval_tap $? 77 'QueryItems' test.out

#- 78 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'BvMx2KSy,batXlnS6,8IOECFrh' \
    > test.out 2>&1
eval_tap $? 78 'ListBasicItemsByFeatures' test.out

#- 79 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'YvKQH3LO' \
    --sku 'x1JeglNz' \
    > test.out 2>&1
eval_tap $? 79 'GetItemBySku' test.out

#- 80 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '3JAkj8oZ' \
    --populateBundle  \
    --region 'srFMR3VS' \
    --storeId 'sQsHmtdu' \
    --sku 'S7Q3mufT' \
    > test.out 2>&1
eval_tap $? 80 'GetLocaleItemBySku' test.out

#- 81 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'bqUnD4M5' \
    --sku 'gloSbZb2' \
    > test.out 2>&1
eval_tap $? 81 'GetItemIdBySku' test.out

#- 82 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'ePSaZHnO,F2puiCT7,7CKnvBRj' \
    --storeId 'DaHiAAOV' \
    > test.out 2>&1
eval_tap $? 82 'GetBulkItemIdBySkus' test.out

#- 83 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Pdhuraj9' \
    --region 'sRtoxDSM' \
    --storeId 'sOsKgqLt' \
    --itemIds 'Z8FWwHxy' \
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
    --userId 'BnHIemKZ' \
    --body '{"itemIds": ["FLQTC4Y4", "t7t7CayK", "TJYGS1VX"]}' \
    > test.out 2>&1
eval_tap $? 85 'ValidateItemPurchaseCondition' test.out

#- 86 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'MEDIA' \
    --limit '71' \
    --offset '88' \
    --storeId 'nGYMcPuv' \
    --keyword 'BMiBaCRN' \
    --language 'olS8tYe7' \
    > test.out 2>&1
eval_tap $? 86 'SearchItems' test.out

#- 87 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '90' \
    --offset '35' \
    --sortBy 'name:desc,displayOrder,updatedAt:asc' \
    --storeId 'icCbKCi4' \
    > test.out 2>&1
eval_tap $? 87 'QueryUncategorizedItems' test.out

#- 88 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '6FcV5MNa' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'iEsNh2qq' \
    > test.out 2>&1
eval_tap $? 88 'GetItem' test.out

#- 89 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'MGzoWncM' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LvFtKZ66' \
    --body '{"appId": "VasDtqze", "appType": "DLC", "baseAppId": "6nCZRcS4", "boothName": "LEySWHkx", "categoryPath": "OertHx8v", "clazz": "NsrmCPYe", "displayOrder": 68, "entitlementType": "DURABLE", "ext": {"Xzbm36r3": {}, "aLfF5VZk": {}, "4H6qWt5x": {}}, "features": ["vYiM1aFF", "CzJY5bgU", "YD9IQrch"], "images": [{"as": "9Gm5aFSm", "caption": "Af99M701", "height": 39, "imageUrl": "gnzTgEjZ", "smallImageUrl": "3PfKVRqm", "width": 27}, {"as": "srZMAoo6", "caption": "XZAKozSQ", "height": 88, "imageUrl": "s3JVvoj9", "smallImageUrl": "SGlYf9ci", "width": 3}, {"as": "kUJc8VaU", "caption": "Aeoj5Vxb", "height": 87, "imageUrl": "Z1sFq94B", "smallImageUrl": "yBKAPuiG", "width": 87}], "itemIds": ["OHCxvQI0", "JpJ4VRvd", "r3TfcaNg"], "itemQty": {"1XOXfAxv": 60, "BGyRMKtj": 56, "lECVJpXD": 13}, "itemType": "BUNDLE", "listable": false, "localizations": {"mz1AQ5tU": {"description": "r0WyhpdA", "localExt": {"FAOBmMIT": {}, "ulQnLyf6": {}, "vbGSL9re": {}}, "longDescription": "9RSQ7jrW", "title": "4ynmpHGI"}, "NbpJdcFo": {"description": "5D2inu6w", "localExt": {"zSVNw3ZW": {}, "R3eyW2K5": {}, "0W2KyzoO": {}}, "longDescription": "FUrsJTZU", "title": "N1HN9Ngk"}, "GvvHWYbl": {"description": "Sgj68KsE", "localExt": {"IgO6FnxD": {}, "zRXOXyQb": {}, "5yYpYsfX": {}}, "longDescription": "a1Xy14Nx", "title": "5GmFbhA0"}}, "maxCount": 71, "maxCountPerUser": 52, "name": "dNVkhFTv", "optionBoxConfig": {"boxItems": [{"count": 36, "itemId": "uORi575k", "itemSku": "HQ5kWQJZ"}, {"count": 32, "itemId": "EhkNx6As", "itemSku": "Yg3kKunS"}, {"count": 69, "itemId": "QDMxDW8a", "itemSku": "vHmhwmRa"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 93, "fixedTrialCycles": 6, "graceDays": 1}, "regionData": {"RyjfmIee": [{"currencyCode": "KQIDaxae", "currencyNamespace": "Xnw4Cbm8", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1980-02-25T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1980-08-26T00:00:00Z", "discountedPrice": 57, "expireAt": "1974-08-03T00:00:00Z", "price": 97, "purchaseAt": "1987-07-14T00:00:00Z", "trialPrice": 84}, {"currencyCode": "IRizAEPN", "currencyNamespace": "Z3VXOI5Q", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1987-08-25T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1976-12-27T00:00:00Z", "discountedPrice": 88, "expireAt": "1986-07-10T00:00:00Z", "price": 99, "purchaseAt": "1996-09-21T00:00:00Z", "trialPrice": 45}, {"currencyCode": "umREap2F", "currencyNamespace": "FtgW6P8z", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1984-06-18T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1982-10-06T00:00:00Z", "discountedPrice": 50, "expireAt": "1990-06-01T00:00:00Z", "price": 61, "purchaseAt": "1972-08-18T00:00:00Z", "trialPrice": 19}], "k7pL384X": [{"currencyCode": "ijdN9jpJ", "currencyNamespace": "rUtdtKN8", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1972-03-01T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1971-10-20T00:00:00Z", "discountedPrice": 72, "expireAt": "1999-07-26T00:00:00Z", "price": 35, "purchaseAt": "1971-04-05T00:00:00Z", "trialPrice": 98}, {"currencyCode": "0FwnmolB", "currencyNamespace": "1XZGwKMp", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1972-06-08T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1996-03-16T00:00:00Z", "discountedPrice": 34, "expireAt": "1997-06-19T00:00:00Z", "price": 29, "purchaseAt": "1971-05-04T00:00:00Z", "trialPrice": 84}, {"currencyCode": "c9l0wGTz", "currencyNamespace": "QcJM9zsf", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1990-06-09T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1976-08-29T00:00:00Z", "discountedPrice": 95, "expireAt": "1974-04-07T00:00:00Z", "price": 65, "purchaseAt": "1973-08-12T00:00:00Z", "trialPrice": 93}], "SkZW672F": [{"currencyCode": "ZpCF971c", "currencyNamespace": "20Ha65Gj", "currencyType": "VIRTUAL", "discountAmount": 6, "discountExpireAt": "1993-10-04T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1976-02-06T00:00:00Z", "discountedPrice": 55, "expireAt": "1972-05-31T00:00:00Z", "price": 55, "purchaseAt": "1990-09-07T00:00:00Z", "trialPrice": 3}, {"currencyCode": "SMHAxez4", "currencyNamespace": "FO6DHeit", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1976-11-30T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1974-06-20T00:00:00Z", "discountedPrice": 7, "expireAt": "1996-11-26T00:00:00Z", "price": 96, "purchaseAt": "1987-08-16T00:00:00Z", "trialPrice": 57}, {"currencyCode": "jVOs8Tce", "currencyNamespace": "d2vljT5q", "currencyType": "VIRTUAL", "discountAmount": 20, "discountExpireAt": "1975-12-27T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1984-05-07T00:00:00Z", "discountedPrice": 27, "expireAt": "1987-05-17T00:00:00Z", "price": 91, "purchaseAt": "1977-11-20T00:00:00Z", "trialPrice": 16}]}, "seasonType": "PASS", "sku": "OIYK523w", "stackable": true, "status": "ACTIVE", "tags": ["PswSwFZS", "2A2xMlRM", "R3KDmraO"], "targetCurrencyCode": "4ZICA19A", "targetNamespace": "uyKfYpxP", "thumbnailUrl": "O6Dm3z3D", "useCount": 4}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateItem' test.out

#- 90 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'r2l478TE' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3frXA7HZ' \
    > test.out 2>&1
eval_tap $? 90 'DeleteItem' test.out

#- 91 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'tA9U1gds' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 74, "orderNo": "lAFI6406"}' \
    > test.out 2>&1
eval_tap $? 91 'AcquireItem' test.out

#- 92 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'N2nby35L' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'cppqLARI' \
    > test.out 2>&1
eval_tap $? 92 'GetApp' test.out

#- 93 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'whr0OjF3' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'btVOHTjY' \
    --body '{"carousel": [{"alt": "XOPsa5o3", "previewUrl": "86Vs7jB1", "thumbnailUrl": "5eBsBPGP", "type": "video", "url": "FkFuCPQu", "videoSource": "youtube"}, {"alt": "1owMNBv5", "previewUrl": "6pzd0uRA", "thumbnailUrl": "dCeNwb8c", "type": "image", "url": "A57XY6Nz", "videoSource": "vimeo"}, {"alt": "Gne7HGzJ", "previewUrl": "vZdiWkVA", "thumbnailUrl": "IFXr9Mwj", "type": "video", "url": "exVNZvRz", "videoSource": "generic"}], "developer": "PQiRoQsh", "forumUrl": "YGbxjBkD", "genres": ["Indie", "MassivelyMultiplayer", "Casual"], "localizations": {"oodf1hGg": {"announcement": "5o1yi2NT", "slogan": "27yKhZwD"}, "rcWfocAf": {"announcement": "mKxhltUL", "slogan": "V1aVPxaw"}, "apNIGDoI": {"announcement": "JRvtHpmo", "slogan": "Yg1NI3OP"}}, "platformRequirements": {"Obx19mg2": [{"additionals": "zQc4lsFP", "directXVersion": "iov8FvWB", "diskSpace": "bXmVWLe8", "graphics": "iaotQjfp", "label": "XFRqMRcI", "osVersion": "MdnDw9GZ", "processor": "MLTqbLF0", "ram": "TJWJtY4c", "soundCard": "lt6G9csZ"}, {"additionals": "ZbWlkBbo", "directXVersion": "puYm2mpU", "diskSpace": "IdtW93I1", "graphics": "vYn4pebr", "label": "0oBospv5", "osVersion": "wTLtHNJZ", "processor": "EAsKFU7s", "ram": "8UGl2WTp", "soundCard": "hf4GUgCI"}, {"additionals": "iMl5qxYg", "directXVersion": "92xEmycI", "diskSpace": "mMhQJbZt", "graphics": "eRoJSvct", "label": "WXyWzUUC", "osVersion": "EOg08eP4", "processor": "RwAnFANa", "ram": "JbSRotDI", "soundCard": "lz9BtWxg"}], "tn8oOtwQ": [{"additionals": "Tibw4uuA", "directXVersion": "WSHuZGbK", "diskSpace": "M8o2Yz1n", "graphics": "FkQIA1gG", "label": "uedhsCjd", "osVersion": "0JAJxIzn", "processor": "tE5VZvop", "ram": "doqhS5vc", "soundCard": "6lReBdN5"}, {"additionals": "jKzQDxFg", "directXVersion": "6Mr5EJEl", "diskSpace": "KUyTNZ5P", "graphics": "dm76WQkN", "label": "R41F65An", "osVersion": "YeK14ulB", "processor": "wIuXVLRT", "ram": "f2VN276G", "soundCard": "rtRJAorG"}, {"additionals": "RqsOPzie", "directXVersion": "iWFf7iFz", "diskSpace": "IS1BAh4L", "graphics": "U8II8nKC", "label": "jTgJ5Ie9", "osVersion": "cMtU6Ap1", "processor": "ntr5a2qY", "ram": "Wo6jUGz3", "soundCard": "eU7lHUrj"}], "vlf7CQ5k": [{"additionals": "OXdy2vhR", "directXVersion": "MJ9FnCP1", "diskSpace": "1nrcnbK7", "graphics": "Stf1vpWV", "label": "Kwy1WFSG", "osVersion": "xLVY1uHt", "processor": "6CzmZhnX", "ram": "I2wCfr9J", "soundCard": "opAzTkfH"}, {"additionals": "btKlrVvC", "directXVersion": "qLWtkhM9", "diskSpace": "otShIM0f", "graphics": "Sg7sDzBY", "label": "b6LYcdpT", "osVersion": "qCOBm7Ca", "processor": "gGZErLvL", "ram": "LrJ8KEbr", "soundCard": "dXAVusZf"}, {"additionals": "mO7ZVZoE", "directXVersion": "whDkoCMP", "diskSpace": "pBtdPp1K", "graphics": "JflwCFyQ", "label": "5PUV7o14", "osVersion": "VoCeuHbX", "processor": "rTdqaIRJ", "ram": "G2Wyimmg", "soundCard": "SnZDh90W"}]}, "platforms": ["Linux", "Windows", "IOS"], "players": ["Multi", "CrossPlatformMulti", "LocalCoop"], "primaryGenre": "Adventure", "publisher": "WfdrDPGn", "releaseDate": "1990-02-01T00:00:00Z", "websiteUrl": "aPkeh7vk"}' \
    > test.out 2>&1
eval_tap $? 93 'UpdateApp' test.out

#- 94 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'nSXPDBDu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YhUHyQd7' \
    > test.out 2>&1
eval_tap $? 94 'DisableItem' test.out

#- 95 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'iCI2Y2FN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetItemDynamicData' test.out

#- 96 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'VTJg9K4t' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xGNCktW9' \
    > test.out 2>&1
eval_tap $? 96 'EnableItem' test.out

#- 97 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'Iwmsg6zB' \
    --itemId 'qrbZgK9B' \
    --namespace "$AB_NAMESPACE" \
    --storeId '4PkeUpUx' \
    > test.out 2>&1
eval_tap $? 97 'FeatureItem' test.out

#- 98 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '4qgHcms8' \
    --itemId 'nIWVNhPC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EJKHfotz' \
    > test.out 2>&1
eval_tap $? 98 'DefeatureItem' test.out

#- 99 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '81xcElZ6' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'x4kn5qvC' \
    --populateBundle  \
    --region 'JDvEj240' \
    --storeId '31EWXcWJ' \
    > test.out 2>&1
eval_tap $? 99 'GetLocaleItem' test.out

#- 100 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'csi2Fs4e' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CdQKP6AC' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 89, "comparison": "isLessThanOrEqual", "name": "wbN3aAtN", "predicateType": "EntitlementPredicate", "value": "nhYQivQR", "values": ["7TULpDpu", "eNEO8J3w", "vGBtRORR"]}, {"anyOf": 8, "comparison": "isGreaterThan", "name": "AXeMhBF0", "predicateType": "EntitlementPredicate", "value": "Nz6XHwru", "values": ["O0qBajBK", "Jc3QWuWU", "bdIGclqg"]}, {"anyOf": 51, "comparison": "isLessThan", "name": "u0ry8KuM", "predicateType": "SeasonPassPredicate", "value": "p6RD6FRv", "values": ["mGP0HAQO", "Jf4GMYDb", "5rFvaSDp"]}]}, {"operator": "or", "predicates": [{"anyOf": 25, "comparison": "isLessThanOrEqual", "name": "0O5zMIjs", "predicateType": "SeasonTierPredicate", "value": "ldqm1OU3", "values": ["j0LDg6Zi", "ujrpSyTT", "3V1zuohM"]}, {"anyOf": 69, "comparison": "isGreaterThanOrEqual", "name": "9b0KCZmS", "predicateType": "SeasonTierPredicate", "value": "uGx7WvHV", "values": ["0TkLDVLm", "BKPKP2d7", "3SIRJucl"]}, {"anyOf": 92, "comparison": "isLessThan", "name": "MAq2PmGs", "predicateType": "SeasonTierPredicate", "value": "kadzEGGg", "values": ["xeismt3I", "pIFmcjtx", "8bnRPvU2"]}]}, {"operator": "or", "predicates": [{"anyOf": 75, "comparison": "isGreaterThanOrEqual", "name": "NdZ6fhdG", "predicateType": "SeasonPassPredicate", "value": "Sw4ySjU9", "values": ["ui2h8nlm", "RMYaPgWT", "OzstTj7M"]}, {"anyOf": 4, "comparison": "excludes", "name": "6v2tZpIy", "predicateType": "SeasonTierPredicate", "value": "wf7eaFep", "values": ["2p6wLwnX", "QPcOpjA0", "hJxoma1O"]}, {"anyOf": 95, "comparison": "isGreaterThan", "name": "0W7jiizt", "predicateType": "EntitlementPredicate", "value": "ZyLwehpn", "values": ["9S937hfA", "XmWsKOPS", "v2HdwQ5T"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateItemPurchaseCondition' test.out

#- 101 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '4VV6PQJP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "DTT2Ieic"}' \
    > test.out 2>&1
eval_tap $? 101 'ReturnItem' test.out

#- 102 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --name '1vXbp7B4' \
    --offset '92' \
    --tag 'ANKBuEpV' \
    > test.out 2>&1
eval_tap $? 102 'QueryKeyGroups' test.out

#- 103 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "JQkNj2Wi", "name": "05ExomjK", "status": "INACTIVE", "tags": ["s9nU6MQm", "o3pIzh5r", "hWBxYApI"]}' \
    > test.out 2>&1
eval_tap $? 103 'CreateKeyGroup' test.out

#- 104 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'upx75kZp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetKeyGroup' test.out

#- 105 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '3vX7z2IM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "GxD4PHLW", "name": "GNhz6wwJ", "status": "INACTIVE", "tags": ["2MPEOIfY", "tmMEoFNk", "IaFC7p9Q"]}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateKeyGroup' test.out

#- 106 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '2smZ4Rem' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'GetKeyGroupDynamic' test.out

#- 107 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'DoIpxQHw' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '12' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 107 'ListKeys' test.out

#- 108 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'GqanfhbF' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 108 'UploadKeys' test.out

#- 109 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'jNNZHUKh' \
    --limit '73' \
    --offset '57' \
    --orderNos 'kOISmve7,SdILiinr,bcllBkZJ' \
    --sortBy 'vbZVTO7y' \
    --startTime 'C0YXK3nK' \
    --status 'REFUNDED' \
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
    --orderNo 'Ypo6aMsD' \
    > test.out 2>&1
eval_tap $? 111 'GetOrder' test.out

#- 112 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AQ41whkR' \
    --body '{"description": "PtULni4H"}' \
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
    --body '{"dryRun": true, "notifyUrl": "rPSXJ47b", "privateKey": "P9vP9Jnd"}' \
    > test.out 2>&1
eval_tap $? 114 'UpdatePaymentCallbackConfig' test.out

#- 115 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'gsZCfAaE' \
    --externalId '1UFft0Vc' \
    --limit '73' \
    --notificationSource 'CHECKOUT' \
    --notificationType '1K5dAj8q' \
    --offset '78' \
    --paymentOrderNo 'b84xUM0G' \
    --startDate 'xJ4ActWV' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 115 'QueryPaymentNotifications' test.out

#- 116 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'AWHYGwrN' \
    --limit '54' \
    --offset '67' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 116 'QueryPaymentOrders' test.out

#- 117 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "zulwsrNg", "currencyNamespace": "QvCJtQEq", "customParameters": {"3kRmUWJn": {}, "laUAuata": {}, "UGfuLPlk": {}}, "description": "qDNN10eh", "extOrderNo": "M0Nn0BKw", "extUserId": "Vo4I9bGT", "itemType": "SEASON", "language": "FkLZ", "metadata": {"Ktm7Ok0Q": "fBvdkgMF", "4Xwzmimk": "xuyhJGCi", "yANnM6wG": "Nr8F2mIn"}, "notifyUrl": "lXRIixXb", "omitNotification": false, "platform": "WSNxGsdi", "price": 63, "recurringPaymentOrderNo": "ypj6kCZZ", "region": "Md08Ujb1", "returnUrl": "QU2EBuXH", "sandbox": true, "sku": "fOp23fMl", "subscriptionId": "EMiIwmGn", "targetNamespace": "NaI56cGk", "targetUserId": "IEPbsboU", "title": "axYcfj86"}' \
    > test.out 2>&1
eval_tap $? 117 'CreatePaymentOrderByDedicated' test.out

#- 118 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId '1RCTNsET' \
    > test.out 2>&1
eval_tap $? 118 'ListExtOrderNoByExtTxId' test.out

#- 119 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'NnhkWwV0' \
    > test.out 2>&1
eval_tap $? 119 'GetPaymentOrder' test.out

#- 120 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '6GlHEC3a' \
    --body '{"extTxId": "913Qu9FL", "paymentMethod": "joNvi1JN", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 120 'ChargePaymentOrder' test.out

#- 121 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'uaveyM5q' \
    --body '{"description": "XeGHf0m7"}' \
    > test.out 2>&1
eval_tap $? 121 'RefundPaymentOrderByDedicated' test.out

#- 122 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'YHmKDPzb' \
    --body '{"amount": 94, "currencyCode": "hFvAvJYI", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 10, "vat": 18}' \
    > test.out 2>&1
eval_tap $? 122 'SimulatePaymentOrderNotification' test.out

#- 123 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aSYc0rZk' \
    > test.out 2>&1
eval_tap $? 123 'GetPaymentOrderChargeStatus' test.out

#- 124 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 124 'GetPlatformWalletConfig' test.out

#- 125 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["Other", "Nintendo", "GooglePlay"]}' \
    > test.out 2>&1
eval_tap $? 125 'UpdatePlatformWalletConfig' test.out

#- 126 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 126 'ResetPlatformWalletConfig' test.out

#- 127 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "EKf6ouzN", "eventTopic": "Tm8D32OV", "maxAwarded": 32, "maxAwardedPerUser": 60, "namespaceExpression": "PFzAC6S5", "rewardCode": "6qpCLrUL", "rewardConditions": [{"condition": "GxhTNaTE", "conditionName": "82F0QCK7", "eventName": "9IgJGPhV", "rewardItems": [{"duration": 24, "itemId": "mYNKQV7p", "quantity": 42}, {"duration": 90, "itemId": "wmz8plJT", "quantity": 27}, {"duration": 64, "itemId": "gAstFFNe", "quantity": 1}]}, {"condition": "E2RkewhZ", "conditionName": "dzoJ79Y0", "eventName": "kmhvEEVZ", "rewardItems": [{"duration": 67, "itemId": "h7ODf7NH", "quantity": 72}, {"duration": 28, "itemId": "Ozkg02wX", "quantity": 85}, {"duration": 55, "itemId": "5JjnRKcE", "quantity": 62}]}, {"condition": "qEtNousd", "conditionName": "m0cuNl1n", "eventName": "IqGAXr5w", "rewardItems": [{"duration": 30, "itemId": "V3K4uBWu", "quantity": 83}, {"duration": 92, "itemId": "btjL81zP", "quantity": 47}, {"duration": 77, "itemId": "9uSRYg1A", "quantity": 62}]}], "userIdExpression": "zq3IsrTa"}' \
    > test.out 2>&1
eval_tap $? 127 'CreateReward' test.out

#- 128 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'LWt77UT1' \
    --limit '89' \
    --offset '67' \
    --sortBy 'namespace:asc,namespace:desc' \
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
    --rewardId 'uQcLBUAi' \
    > test.out 2>&1
eval_tap $? 131 'GetReward' test.out

#- 132 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '42rbnSQJ' \
    --body '{"description": "0R4mxlBF", "eventTopic": "45LbkqnM", "maxAwarded": 16, "maxAwardedPerUser": 73, "namespaceExpression": "k2nAHJNr", "rewardCode": "YISOvumz", "rewardConditions": [{"condition": "M3MFtwru", "conditionName": "bZjET4Zc", "eventName": "VctZyfu8", "rewardItems": [{"duration": 88, "itemId": "sJiwucdK", "quantity": 50}, {"duration": 76, "itemId": "7EwOEfw2", "quantity": 81}, {"duration": 0, "itemId": "do45sppV", "quantity": 71}]}, {"condition": "3PVTVyoE", "conditionName": "eiFgYCGq", "eventName": "dJPlePCS", "rewardItems": [{"duration": 83, "itemId": "WIFEmOqL", "quantity": 49}, {"duration": 54, "itemId": "B6bQynjK", "quantity": 70}, {"duration": 35, "itemId": "uHXmSwu6", "quantity": 25}]}, {"condition": "WxfSwrmX", "conditionName": "D6lUX8O0", "eventName": "Po3jzzXl", "rewardItems": [{"duration": 49, "itemId": "SJUNGAjv", "quantity": 26}, {"duration": 26, "itemId": "63T1zDhh", "quantity": 15}, {"duration": 5, "itemId": "JBW9oUsx", "quantity": 41}]}], "userIdExpression": "y73u4Gel"}' \
    > test.out 2>&1
eval_tap $? 132 'UpdateReward' test.out

#- 133 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'czsxYB4T' \
    > test.out 2>&1
eval_tap $? 133 'DeleteReward' test.out

#- 134 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zAO5ECN0' \
    --body '{"payload": {"wDdXc5vD": {}, "EcPpnUgy": {}, "MbE5KjJw": {}}}' \
    > test.out 2>&1
eval_tap $? 134 'CheckEventCondition' test.out

#- 135 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'ListStores' test.out

#- 136 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "Nj6Qpi06", "defaultRegion": "hO6RpF2t", "description": "Rlnn3ktS", "supportedLanguages": ["rx60p8MN", "y6pg1XNI", "Rmnzh4FY"], "supportedRegions": ["oRp7yj88", "HKEReIt7", "VvLcXdlJ"], "title": "OircSs3j"}' \
    > test.out 2>&1
eval_tap $? 136 'CreateStore' test.out

#- 137 ImportStore
./ng net.accelbyte.sdk.cli.Main platform importStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bCynW5hx' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 137 'ImportStore' test.out

#- 138 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 138 'GetPublishedStore' test.out

#- 139 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 139 'DeletePublishedStore' test.out

#- 140 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetPublishedStoreBackup' test.out

#- 141 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 141 'RollbackPublishedStore' test.out

#- 142 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DmlpuBC5' \
    > test.out 2>&1
eval_tap $? 142 'GetStore' test.out

#- 143 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'abQFv9P3' \
    --body '{"defaultLanguage": "eWKm15M8", "defaultRegion": "yGJTjo4i", "description": "8nl9WdfO", "supportedLanguages": ["GGb1htON", "XyMUXQge", "0HqYNaHI"], "supportedRegions": ["nCCj77YM", "34cmcbhL", "KwDqoXVx"], "title": "wPtTOwhh"}' \
    > test.out 2>&1
eval_tap $? 143 'UpdateStore' test.out

#- 144 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fCRQxUJI' \
    > test.out 2>&1
eval_tap $? 144 'DeleteStore' test.out

#- 145 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LcBsiydh' \
    --action 'DELETE' \
    --itemSku 'Pdyk4Usc' \
    --itemType 'CODE' \
    --limit '64' \
    --offset '16' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd '80AT2U2e' \
    --updatedAtStart 'H3qbJi79' \
    > test.out 2>&1
eval_tap $? 145 'QueryChanges' test.out

#- 146 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RxuqB5VI' \
    > test.out 2>&1
eval_tap $? 146 'PublishAll' test.out

#- 147 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OasrcEPX' \
    > test.out 2>&1
eval_tap $? 147 'PublishSelected' test.out

#- 148 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ImdlSRPt' \
    > test.out 2>&1
eval_tap $? 148 'SelectAllRecords' test.out

#- 149 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '6NTMaWOA' \
    --action 'DELETE' \
    --itemSku 'rK0n1w7y' \
    --itemType 'APP' \
    --type 'ITEM' \
    --updatedAtEnd 'pWXOCSNy' \
    --updatedAtStart 'L1jRMxeb' \
    > test.out 2>&1
eval_tap $? 149 'GetStatistic' test.out

#- 150 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HZIhHAPM' \
    > test.out 2>&1
eval_tap $? 150 'UnselectAllRecords' test.out

#- 151 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'jb2fFZ45' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AHSvd05A' \
    > test.out 2>&1
eval_tap $? 151 'SelectRecord' test.out

#- 152 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'CaTRQksE' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YAXHBnul' \
    > test.out 2>&1
eval_tap $? 152 'UnselectRecord' test.out

#- 153 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XQ40SPGz' \
    --targetStoreId '0uOkUS2j' \
    > test.out 2>&1
eval_tap $? 153 'CloneStore' test.out

#- 154 ExportStore
./ng net.accelbyte.sdk.cli.Main platform exportStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '0GAOxfXJ' \
    > test.out 2>&1
eval_tap $? 154 'ExportStore' test.out

#- 155 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'OSz7y8vV' \
    --limit '1' \
    --offset '34' \
    --sku 'SVDatgIb' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    --userId 'gbqjwXZy' \
    > test.out 2>&1
eval_tap $? 155 'QuerySubscriptions' test.out

#- 156 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Rjegl0TV' \
    > test.out 2>&1
eval_tap $? 156 'RecurringChargeSubscription' test.out

#- 157 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'khWZbFEk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetTicketDynamic' test.out

#- 158 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'N7xTimBX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "9lZ2agBs"}' \
    > test.out 2>&1
eval_tap $? 158 'DecreaseTicketSale' test.out

#- 159 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'xqtTa3eP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetTicketBoothID' test.out

#- 160 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'QJDURwyX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 68, "orderNo": "KVLawxeb"}' \
    > test.out 2>&1
eval_tap $? 160 'IncreaseTicketSale' test.out

#- 161 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'PcpYF6sM' \
    --body '{"achievements": [{"id": "n7ZO1oIu", "value": 61}, {"id": "KP2kxuxv", "value": 27}, {"id": "3wqXkUDT", "value": 90}], "steamUserId": "DZy0c3ce"}' \
    > test.out 2>&1
eval_tap $? 161 'UnlockSteamUserAchievement' test.out

#- 162 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kU5VqZvs' \
    --xboxUserId '7kUZw9RD' \
    > test.out 2>&1
eval_tap $? 162 'GetXblUserAchievements' test.out

#- 163 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'H1Ggiqhx' \
    --body '{"achievements": [{"id": "20UUAcOU", "percentComplete": 53}, {"id": "Apgb1Ljp", "percentComplete": 15}, {"id": "yIxa0jec", "percentComplete": 18}], "serviceConfigId": "to6hMcfL", "titleId": "QKfX6BWU", "xboxUserId": "UrgmAfRc"}' \
    > test.out 2>&1
eval_tap $? 163 'UpdateXblUserAchievement' test.out

#- 164 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'htxZrgOz' \
    > test.out 2>&1
eval_tap $? 164 'AnonymizeCampaign' test.out

#- 165 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ondAe3Ws' \
    > test.out 2>&1
eval_tap $? 165 'AnonymizeEntitlement' test.out

#- 166 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'X9ppbQWQ' \
    > test.out 2>&1
eval_tap $? 166 'AnonymizeFulfillment' test.out

#- 167 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'HbxTrO77' \
    > test.out 2>&1
eval_tap $? 167 'AnonymizeIntegration' test.out

#- 168 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'FgoWmVHn' \
    > test.out 2>&1
eval_tap $? 168 'AnonymizeOrder' test.out

#- 169 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'mnT0G4Kx' \
    > test.out 2>&1
eval_tap $? 169 'AnonymizePayment' test.out

#- 170 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'PsBxw01E' \
    > test.out 2>&1
eval_tap $? 170 'AnonymizeSubscription' test.out

#- 171 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '46x2rZ96' \
    > test.out 2>&1
eval_tap $? 171 'AnonymizeWallet' test.out

#- 172 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8oh0jXn' \
    --activeOnly  \
    --appType 'DLC' \
    --entitlementClazz 'CODE' \
    --entitlementName 'uOWSw8Vw' \
    --itemId 'uRJA3EMO,vJBWHItl,jFFvzfQp' \
    --limit '40' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 172 'QueryUserEntitlements' test.out

#- 173 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'un4qe4Zu' \
    --body '[{"endDate": "1972-05-05T00:00:00Z", "grantedCode": "cr63KsZK", "itemId": "trPXOX24", "itemNamespace": "h82aXWNj", "language": "WGz_bUWg", "quantity": 67, "region": "MxSdXLuG", "source": "GIFT", "startDate": "1974-11-16T00:00:00Z", "storeId": "TUOdPUn0"}, {"endDate": "1995-09-23T00:00:00Z", "grantedCode": "lcJGT4m9", "itemId": "AzJZxQN3", "itemNamespace": "TQhbF2hb", "language": "qCKz_nH", "quantity": 43, "region": "WhTY5Oon", "source": "PROMOTION", "startDate": "1981-10-13T00:00:00Z", "storeId": "UPL1jUnW"}, {"endDate": "1991-12-08T00:00:00Z", "grantedCode": "95Az9F7J", "itemId": "7qsSbQUJ", "itemNamespace": "nZ6IN6cc", "language": "VWeg-MhZP_503", "quantity": 60, "region": "ToVHv8IO", "source": "GIFT", "startDate": "1988-08-24T00:00:00Z", "storeId": "ujK2bOgy"}]' \
    > test.out 2>&1
eval_tap $? 173 'GrantUserEntitlement' test.out

#- 174 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zZc8qYK6' \
    --activeOnly  \
    --appId '5OV6djQP' \
    > test.out 2>&1
eval_tap $? 174 'GetUserAppEntitlementByAppId' test.out

#- 175 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '1I1JdBMs' \
    --activeOnly  \
    --limit '72' \
    --offset '44' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 175 'QueryUserEntitlementsByAppType' test.out

#- 176 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ujlpkEMS' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --itemId 'pRmZ2z8z' \
    > test.out 2>&1
eval_tap $? 176 'GetUserEntitlementByItemId' test.out

#- 177 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'uJGLBMTn' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --sku 'Hu049A1Q' \
    > test.out 2>&1
eval_tap $? 177 'GetUserEntitlementBySku' test.out

#- 178 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Efy61fel' \
    --appIds 'jZVBBOje,tRbJTdtc,RsO1ZiBx' \
    --itemIds 'h0mo8364,FiCoa9T5,V5XoJ7oi' \
    --skus 'xkSMu4SZ,WuI6YfB8,yjUGMFlq' \
    > test.out 2>&1
eval_tap $? 178 'ExistsAnyUserActiveEntitlement' test.out

#- 179 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'aIvaYXHh' \
    --itemIds 'tbEPbCI8,pV99qlrs,KrldApJw' \
    > test.out 2>&1
eval_tap $? 179 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 180 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'pMted0ER' \
    --appId 'uYrd6G9J' \
    > test.out 2>&1
eval_tap $? 180 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 181 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'k57yC7JQ' \
    --entitlementClazz 'CODE' \
    --itemId 'l99xyC1k' \
    > test.out 2>&1
eval_tap $? 181 'GetUserEntitlementOwnershipByItemId' test.out

#- 182 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'fLHfkufr' \
    --ids 'LYcl9npm,4Su4OBU7,QvyMbws3' \
    > test.out 2>&1
eval_tap $? 182 'GetUserEntitlementOwnershipByItemIds' test.out

#- 183 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'aGrnAtUh' \
    --entitlementClazz 'APP' \
    --sku 'XR3VbBFD' \
    > test.out 2>&1
eval_tap $? 183 'GetUserEntitlementOwnershipBySku' test.out

#- 184 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '6vliF0k6' \
    --entitlementIds '13TIGtvI' \
    > test.out 2>&1
eval_tap $? 184 'RevokeUserEntitlements' test.out

#- 185 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'EigJHhbE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P5YtibP3' \
    > test.out 2>&1
eval_tap $? 185 'GetUserEntitlement' test.out

#- 186 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'ZRSudxbp' \
    --namespace "$AB_NAMESPACE" \
    --userId '2exyeZXR' \
    --body '{"endDate": "1985-11-07T00:00:00Z", "nullFieldList": ["yU1FXc6h", "NESQp0ky", "VfTkeQJP"], "startDate": "1990-01-21T00:00:00Z", "status": "REVOKED", "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 186 'UpdateUserEntitlement' test.out

#- 187 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'b4FZKBI2' \
    --namespace "$AB_NAMESPACE" \
    --userId '8IPSLhIw' \
    --body '{"options": ["31RcL03P", "NugQMGhL", "k2DlFPI4"], "useCount": 14}' \
    > test.out 2>&1
eval_tap $? 187 'ConsumeUserEntitlement' test.out

#- 188 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'sPKCHSAz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'twUa0o6i' \
    > test.out 2>&1
eval_tap $? 188 'DisableUserEntitlement' test.out

#- 189 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'XL3NvF2k' \
    --namespace "$AB_NAMESPACE" \
    --userId '3DfbOENG' \
    > test.out 2>&1
eval_tap $? 189 'EnableUserEntitlement' test.out

#- 190 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'ImwgAaIZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MCvIENSt' \
    > test.out 2>&1
eval_tap $? 190 'GetUserEntitlementHistories' test.out

#- 191 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '4ol3mEFt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W72bsI7w' \
    > test.out 2>&1
eval_tap $? 191 'RevokeUserEntitlement' test.out

#- 192 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '8MWSgGf3' \
    --body '{"duration": 15, "endDate": "1996-07-19T00:00:00Z", "itemId": "tA11fX8l", "itemSku": "NU0bQQRX", "language": "PjoZG2dT", "order": {"currency": {"currencyCode": "opBfbFpd", "currencySymbol": "fbYhn92w", "currencyType": "REAL", "decimals": 83, "namespace": "43ocWv12"}, "ext": {"5Tw5fqgQ": {}, "XK5S5I67": {}, "W8OcRoRB": {}}, "free": true}, "orderNo": "k7HOQREm", "origin": "Xbox", "quantity": 0, "region": "JCKPdrNG", "source": "REWARD", "startDate": "1982-10-31T00:00:00Z", "storeId": "655T7gxK"}' \
    > test.out 2>&1
eval_tap $? 192 'FulfillItem' test.out

#- 193 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'PP77c1LS' \
    --body '{"code": "J8K0wenw", "language": "Ze-VhEf", "region": "9ZmlgOaH"}' \
    > test.out 2>&1
eval_tap $? 193 'RedeemCode' test.out

#- 194 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'KH82xfE2' \
    --body '{"origin": "System", "rewards": [{"currency": {"currencyCode": "SMhVkBMS", "namespace": "vQh36TFl"}, "item": {"itemId": "dOXQAtBQ", "itemSku": "8Up6bjVg", "itemType": "g0G6BzWn"}, "quantity": 87, "type": "CURRENCY"}, {"currency": {"currencyCode": "A6qONrHC", "namespace": "zObQX6d7"}, "item": {"itemId": "EZvPltki", "itemSku": "0RxzJxGS", "itemType": "ZQ6o0XuD"}, "quantity": 2, "type": "CURRENCY"}, {"currency": {"currencyCode": "T90xl5j2", "namespace": "0jAIsDO6"}, "item": {"itemId": "tilhbt6R", "itemSku": "LTWYrtUB", "itemType": "KpM2cc8A"}, "quantity": 21, "type": "CURRENCY"}], "source": "REWARD"}' \
    > test.out 2>&1
eval_tap $? 194 'FulfillRewards' test.out

#- 195 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'COw4aDEF' \
    --endTime 'Gk241NQZ' \
    --limit '13' \
    --offset '17' \
    --productId '4pOjntb4' \
    --startTime 'iskIMeMj' \
    --status 'VERIFIED' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 195 'QueryUserIAPOrders' test.out

#- 196 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'v8SDMBGJ' \
    > test.out 2>&1
eval_tap $? 196 'QueryAllUserIAPOrders' test.out

#- 197 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'L4kPSpMG' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "wNYW", "productId": "eRlOTYjO", "region": "gOVj7m49", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 197 'MockFulfillIAPItem' test.out

#- 198 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuZ6OKbm' \
    --itemId 'eSj0Spi3' \
    --limit '94' \
    --offset '63' \
    --status 'CLOSED' \
    > test.out 2>&1
eval_tap $? 198 'QueryUserOrders' test.out

#- 199 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'GDbiDHyu' \
    --body '{"currencyCode": "rsZtv40n", "currencyNamespace": "Bew0YUnv", "discountedPrice": 87, "ext": {"Qw3VuRVc": {}, "Ni9zH8P7": {}, "BB2eNtdS": {}}, "itemId": "LesRgkh2", "language": "Zv87KdbU", "options": {"skipPriceValidation": false}, "platform": "Other", "price": 24, "quantity": 1, "region": "hoDVhtCW", "returnUrl": "qiJx45Cz", "sandbox": true}' \
    > test.out 2>&1
eval_tap $? 199 'AdminCreateUserOrder' test.out

#- 200 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'f4d5u34s' \
    --itemId 'W7MBr7be' \
    > test.out 2>&1
eval_tap $? 200 'CountOfPurchasedItem' test.out

#- 201 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 't5N3ka4D' \
    --userId 'Cx73pLDx' \
    > test.out 2>&1
eval_tap $? 201 'GetUserOrder' test.out

#- 202 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'F48cTMLA' \
    --userId 'FqDiy86b' \
    --body '{"status": "CHARGEBACK", "statusReason": "h6V9WVOm"}' \
    > test.out 2>&1
eval_tap $? 202 'UpdateUserOrderStatus' test.out

#- 203 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oLU99poV' \
    --userId 'CbLsA0Ku' \
    > test.out 2>&1
eval_tap $? 203 'FulfillUserOrder' test.out

#- 204 GetUserOrderGrant
./ng net.accelbyte.sdk.cli.Main platform getUserOrderGrant \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2G5SGDhc' \
    --userId 'hHQmdNzi' \
    > test.out 2>&1
eval_tap $? 204 'GetUserOrderGrant' test.out

#- 205 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gsqDpKr8' \
    --userId 'dns2sa44' \
    > test.out 2>&1
eval_tap $? 205 'GetUserOrderHistories' test.out

#- 206 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'aTi6gtyd' \
    --userId 'lDEzLGRA' \
    --body '{"additionalData": {"cardSummary": "BFJBclwi"}, "authorisedTime": "1999-09-04T00:00:00Z", "chargebackReversedTime": "1974-03-27T00:00:00Z", "chargebackTime": "1976-12-13T00:00:00Z", "chargedTime": "1995-12-30T00:00:00Z", "createdTime": "1996-07-18T00:00:00Z", "currency": {"currencyCode": "bAboILSP", "currencySymbol": "tF8NUlDl", "currencyType": "REAL", "decimals": 96, "namespace": "2f2skG0V"}, "customParameters": {"C3tkBtvt": {}, "OTjuG2LT": {}, "KZeiE43t": {}}, "extOrderNo": "ojozClqW", "extTxId": "LuH1JT9n", "extUserId": "LBu76QLG", "issuedAt": "1978-12-10T00:00:00Z", "metadata": {"nAXG3dol": "Ybp9Ibm7", "1urZJk77": "IiQExq1k", "FSicdxlq": "tTQLP9WL"}, "namespace": "dS1KhzPT", "nonceStr": "x4oZjSNF", "paymentMethod": "8onagsCm", "paymentMethodFee": 68, "paymentOrderNo": "l76bXI1K", "paymentProvider": "XSOLLA", "paymentProviderFee": 74, "paymentStationUrl": "vyyVhOvD", "price": 65, "refundedTime": "1979-09-12T00:00:00Z", "salesTax": 40, "sandbox": true, "sku": "AEdexaby", "status": "AUTHORISED", "statusReason": "LUfv4k8h", "subscriptionId": "pgdVphU5", "subtotalPrice": 31, "targetNamespace": "eXBDoNnW", "targetUserId": "IBvy6f4P", "tax": 41, "totalPrice": 53, "totalTax": 11, "txEndTime": "1979-01-06T00:00:00Z", "type": "FTw1jru8", "userId": "GdKVN6oZ", "vat": 34}' \
    > test.out 2>&1
eval_tap $? 206 'ProcessUserOrderNotification' test.out

#- 207 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'U6BuysLR' \
    --userId '1Mg8aQUL' \
    > test.out 2>&1
eval_tap $? 207 'DownloadUserOrderReceipt' test.out

#- 208 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '3zKuy58c' \
    --body '{"currencyCode": "io3yWK3P", "currencyNamespace": "jQ29Cx8A", "customParameters": {"K6d7Lzvx": {}, "PY5QINqK": {}, "8EZx3rMY": {}}, "description": "p0R4WD0D", "extOrderNo": "UPg6HIb8", "extUserId": "ruJgJAaD", "itemType": "MEDIA", "language": "KRd", "metadata": {"r8TxawQr": "w8XS7JCQ", "47jXcvH5": "N2CzQPPe", "ysVQbMVn": "dYFuOxYm"}, "notifyUrl": "2A94RrEh", "omitNotification": true, "platform": "X5Sy3tlW", "price": 64, "recurringPaymentOrderNo": "8FFVsMnZ", "region": "g9E6OTAE", "returnUrl": "2fHpSbYI", "sandbox": false, "sku": "iM37fgtO", "subscriptionId": "l1TF4kuR", "title": "kCvesk9q"}' \
    > test.out 2>&1
eval_tap $? 208 'CreateUserPaymentOrder' test.out

#- 209 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bpf4lsCo' \
    --userId 'ERUa3YEV' \
    --body '{"description": "ZxSi9gx4"}' \
    > test.out 2>&1
eval_tap $? 209 'RefundUserPaymentOrder' test.out

#- 210 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'kFrFKRNr' \
    --body '{"code": "YI64Vq9j", "orderNo": "Qsw2G7uR"}' \
    > test.out 2>&1
eval_tap $? 210 'ApplyUserRedemption' test.out

#- 211 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'M2YgCZgI' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'Im5vDleC' \
    --limit '91' \
    --offset '24' \
    --sku 'FSaLYfFs' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 211 'QueryUserSubscriptions' test.out

#- 212 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'eeK6IGat' \
    --excludeSystem  \
    --limit '91' \
    --offset '51' \
    --subscriptionId 'tLhtMT1l' \
    > test.out 2>&1
eval_tap $? 212 'GetUserSubscriptionActivities' test.out

#- 213 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'mPemd6W8' \
    --body '{"grantDays": 76, "itemId": "PfiSvHqQ", "language": "krzX6kaE", "reason": "n0NancU9", "region": "X32RqknJ", "source": "wyIgc0b6"}' \
    > test.out 2>&1
eval_tap $? 213 'PlatformSubscribeSubscription' test.out

#- 214 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wSQOtF8F' \
    --itemId '6I5j0jy2' \
    > test.out 2>&1
eval_tap $? 214 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 215 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MmiHcH8d' \
    --userId 'eREhKlBg' \
    > test.out 2>&1
eval_tap $? 215 'GetUserSubscription' test.out

#- 216 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '67xDZDmP' \
    --userId 'sYQpEWEX' \
    > test.out 2>&1
eval_tap $? 216 'DeleteUserSubscription' test.out

#- 217 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rj41Hom4' \
    --userId 'vaLrUU3m' \
    --force  \
    --body '{"immediate": true, "reason": "bcRy9QYE"}' \
    > test.out 2>&1
eval_tap $? 217 'CancelSubscription' test.out

#- 218 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AJ6YVuZx' \
    --userId '9MyM67N9' \
    --body '{"grantDays": 68, "reason": "7txgttGJ"}' \
    > test.out 2>&1
eval_tap $? 218 'GrantDaysToSubscription' test.out

#- 219 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'piDNdD6R' \
    --userId 'yjyImJWz' \
    --excludeFree  \
    --limit '89' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 219 'GetUserSubscriptionBillingHistories' test.out

#- 220 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'hzlD8jrL' \
    --userId 'hcEzzdw2' \
    --body '{"additionalData": {"cardSummary": "dcx83ps3"}, "authorisedTime": "1983-01-13T00:00:00Z", "chargebackReversedTime": "1975-09-05T00:00:00Z", "chargebackTime": "1982-06-17T00:00:00Z", "chargedTime": "1982-06-11T00:00:00Z", "createdTime": "1983-02-27T00:00:00Z", "currency": {"currencyCode": "L3Gmr1rg", "currencySymbol": "CtMdEMJX", "currencyType": "VIRTUAL", "decimals": 69, "namespace": "KcJ1Idsi"}, "customParameters": {"eqcdxPAb": {}, "Dm6WKKCt": {}, "JOQ2F7eX": {}}, "extOrderNo": "okfgAaJg", "extTxId": "G8UwS0a2", "extUserId": "3TkyupqU", "issuedAt": "1976-05-11T00:00:00Z", "metadata": {"5mjZhScj": "4J4mqiMX", "2pJZd7uX": "j96kORic", "i6HxkCmm": "tk6Yrlm5"}, "namespace": "wB4OSeWi", "nonceStr": "8x3SooJs", "paymentMethod": "QY6HK6y2", "paymentMethodFee": 64, "paymentOrderNo": "an7fnsQK", "paymentProvider": "PAYPAL", "paymentProviderFee": 65, "paymentStationUrl": "RCbOiF1S", "price": 27, "refundedTime": "1989-08-22T00:00:00Z", "salesTax": 53, "sandbox": true, "sku": "7rJ6z9iG", "status": "AUTHORISE_FAILED", "statusReason": "eCltbPhE", "subscriptionId": "EgkIYJtO", "subtotalPrice": 72, "targetNamespace": "xfAsL5Jb", "targetUserId": "0AOHAcho", "tax": 98, "totalPrice": 77, "totalTax": 97, "txEndTime": "1981-04-30T00:00:00Z", "type": "2xOqpU02", "userId": "qPtgAY5H", "vat": 67}' \
    > test.out 2>&1
eval_tap $? 220 'ProcessUserSubscriptionNotification' test.out

#- 221 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'w9h2MmJx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ERp4FZyE' \
    --body '{"count": 35, "orderNo": "1LHsPWOa"}' \
    > test.out 2>&1
eval_tap $? 221 'AcquireUserTicket' test.out

#- 222 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1cmlSUS' \
    > test.out 2>&1
eval_tap $? 222 'QueryUserCurrencyWallets' test.out

#- 223 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'VIbiVYp2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MaPXIHmj' \
    --limit '79' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 223 'ListUserCurrencyTransactions' test.out

#- 224 CheckWallet
eval_tap 0 224 'CheckWallet # SKIP deprecated' test.out

#- 225 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'w5Nyjw5r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WKKwPOOQ' \
    --body '{"amount": 72, "expireAt": "1981-01-26T00:00:00Z", "origin": "Twitch", "reason": "aStZMxBA", "source": "ACHIEVEMENT"}' \
    > test.out 2>&1
eval_tap $? 225 'CreditUserWallet' test.out

#- 226 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'nOmXKc37' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ep4qSF5K' \
    --body '{"amount": 45, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 226 'PayWithUserWallet' test.out

#- 227 GetUserWallet
eval_tap 0 227 'GetUserWallet # SKIP deprecated' test.out

#- 228 DebitUserWallet
eval_tap 0 228 'DebitUserWallet # SKIP deprecated' test.out

#- 229 DisableUserWallet
eval_tap 0 229 'DisableUserWallet # SKIP deprecated' test.out

#- 230 EnableUserWallet
eval_tap 0 230 'EnableUserWallet # SKIP deprecated' test.out

#- 231 ListUserWalletTransactions
eval_tap 0 231 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 232 QueryWallets
eval_tap 0 232 'QueryWallets # SKIP deprecated' test.out

#- 233 GetWallet
eval_tap 0 233 'GetWallet # SKIP deprecated' test.out

#- 234 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'mGHFL92d' \
    --end 'YFRlzFKh' \
    --start 'fDPeSKdF' \
    > test.out 2>&1
eval_tap $? 234 'SyncOrders' test.out

#- 235 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["GbgeEeu9", "T7CkYGLl", "Vl4IjpWj"], "apiKey": "0m6W1bXm", "authoriseAsCapture": false, "blockedPaymentMethods": ["bidlM8ak", "AoqIHL66", "Zu1PPhIx"], "clientKey": "Ps47GBo6", "dropInSettings": "n5MtAmld", "liveEndpointUrlPrefix": "btGOL4qN", "merchantAccount": "2TiCexi4", "notificationHmacKey": "39nsgUnp", "notificationPassword": "wv9QciAA", "notificationUsername": "bxt6NJKW", "returnUrl": "OJgFjnq1", "settings": "xzfIC0Xr"}' \
    > test.out 2>&1
eval_tap $? 235 'TestAdyenConfig' test.out

#- 236 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "7IkY8eur", "privateKey": "XbylvqrH", "publicKey": "elhm7bp7", "returnUrl": "T8Athv1q"}' \
    > test.out 2>&1
eval_tap $? 236 'TestAliPayConfig' test.out

#- 237 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "uhalCaHA", "secretKey": "UUVnDT2o"}' \
    > test.out 2>&1
eval_tap $? 237 'TestCheckoutConfig' test.out

#- 238 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'UERyvUSA' \
    > test.out 2>&1
eval_tap $? 238 'DebugMatchedPaymentMerchantConfig' test.out

#- 239 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "yzxvp1w1", "clientSecret": "8az4xTJm", "returnUrl": "87lK2QS4", "webHookId": "iQDcTGPU"}' \
    > test.out 2>&1
eval_tap $? 239 'TestPayPalConfig' test.out

#- 240 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["gWoyu1Sy", "nf3ouwjU", "6XZlO8Pf"], "publishableKey": "5xRneDbe", "secretKey": "tl3pM93X", "webhookSecret": "8EX53fqD"}' \
    > test.out 2>&1
eval_tap $? 240 'TestStripeConfig' test.out

#- 241 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "e3wBX1f5", "key": "1XEHQrxd", "mchid": "IyPcVIOY", "returnUrl": "YPMlbv7o"}' \
    > test.out 2>&1
eval_tap $? 241 'TestWxPayConfig' test.out

#- 242 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "vMZjrtw7", "flowCompletionUrl": "aBYNNAYs", "merchantId": 54, "projectId": 76, "projectSecretKey": "h1GDBjBm"}' \
    > test.out 2>&1
eval_tap $? 242 'TestXsollaConfig' test.out

#- 243 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --id '6ODP7meu' \
    > test.out 2>&1
eval_tap $? 243 'GetPaymentMerchantConfig' test.out

#- 244 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'IMNHkDlx' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["Ziwf1iis", "M7P5WKN5", "ynhTyUlw"], "apiKey": "3bMBOdMg", "authoriseAsCapture": false, "blockedPaymentMethods": ["se6ddswD", "N01N4fFZ", "WMa2X2Yw"], "clientKey": "HYn7H6OV", "dropInSettings": "Bu6rXGGE", "liveEndpointUrlPrefix": "it75Dsno", "merchantAccount": "ar6sfypX", "notificationHmacKey": "CcYBj5PC", "notificationPassword": "IX1qdld6", "notificationUsername": "TzE134w1", "returnUrl": "UfUNkWtu", "settings": "FayCzVTO"}' \
    > test.out 2>&1
eval_tap $? 244 'UpdateAdyenConfig' test.out

#- 245 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'L46DLPLe' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 245 'TestAdyenConfigById' test.out

#- 246 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'fQKh3kvv' \
    --sandbox  \
    --validate  \
    --body '{"appId": "0gyXnom9", "privateKey": "GUmnGerP", "publicKey": "IFyLFIo6", "returnUrl": "HNDNvJXY"}' \
    > test.out 2>&1
eval_tap $? 246 'UpdateAliPayConfig' test.out

#- 247 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'l2xm7LND' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 247 'TestAliPayConfigById' test.out

#- 248 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'lUoZlZ2J' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "5AbZORf5", "secretKey": "2pz6py36"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateCheckoutConfig' test.out

#- 249 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id '8yU96c9Q' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 249 'TestCheckoutConfigById' test.out

#- 250 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '7EAalG9v' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "THE19T00", "clientSecret": "UdpSA0KC", "returnUrl": "2xsNQIcJ", "webHookId": "mNhSVHkh"}' \
    > test.out 2>&1
eval_tap $? 250 'UpdatePayPalConfig' test.out

#- 251 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'htsi4BIB' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 251 'TestPayPalConfigById' test.out

#- 252 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id '0RhZx0TC' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["PLxPy15x", "x0DjPLVT", "YolDgYvk"], "publishableKey": "KfAaI7Vz", "secretKey": "6o8xrUDu", "webhookSecret": "IM2vooex"}' \
    > test.out 2>&1
eval_tap $? 252 'UpdateStripeConfig' test.out

#- 253 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id '3SdeH3Fi' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 253 'TestStripeConfigById' test.out

#- 254 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '5Lu0386z' \
    --validate  \
    --body '{"appId": "LjanOTFM", "key": "A7afkFtl", "mchid": "GbckgUcf", "returnUrl": "gXA1hif4"}' \
    > test.out 2>&1
eval_tap $? 254 'UpdateWxPayConfig' test.out

#- 255 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'nGg4qv8F' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 255 'UpdateWxPayConfigCert' test.out

#- 256 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'qSxwan6Y' \
    > test.out 2>&1
eval_tap $? 256 'TestWxPayConfigById' test.out

#- 257 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'A9M2VVA5' \
    --validate  \
    --body '{"apiKey": "6iRG0wra", "flowCompletionUrl": "M6I8Dkh9", "merchantId": 2, "projectId": 1, "projectSecretKey": "46Zaz9al"}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateXsollaConfig' test.out

#- 258 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'ZYLmMz4Y' \
    > test.out 2>&1
eval_tap $? 258 'TestXsollaConfigById' test.out

#- 259 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'tegTjyp0' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 259 'UpdateXsollaUIConfig' test.out

#- 260 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '38' \
    --namespace "$AB_NAMESPACE" \
    --offset '45' \
    --region 'Xy665oyZ' \
    > test.out 2>&1
eval_tap $? 260 'QueryPaymentProviderConfig' test.out

#- 261 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "18GGVlwo", "region": "AAnUsRBp", "sandboxTaxJarApiToken": "kRylkAnR", "specials": ["ADYEN", "CHECKOUT", "WXPAY"], "taxJarApiToken": "N52UACGB", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 261 'CreatePaymentProviderConfig' test.out

#- 262 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 262 'GetAggregatePaymentProviders' test.out

#- 263 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region '8AZlpCdc' \
    > test.out 2>&1
eval_tap $? 263 'DebugMatchedPaymentProviderConfig' test.out

#- 264 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 264 'GetSpecialPaymentProviders' test.out

#- 265 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'RhcqmfEx' \
    --body '{"aggregate": "XSOLLA", "namespace": "f1rqXCcz", "region": "XT3oxAjn", "sandboxTaxJarApiToken": "bP0aNn8n", "specials": ["CHECKOUT", "ALIPAY", "XSOLLA"], "taxJarApiToken": "zl8H7mBR", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 265 'UpdatePaymentProviderConfig' test.out

#- 266 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'VER7jzbe' \
    > test.out 2>&1
eval_tap $? 266 'DeletePaymentProviderConfig' test.out

#- 267 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 267 'GetPaymentTaxConfig' test.out

#- 268 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "6gMyjV7d", "taxJarApiToken": "PHL40xtm", "taxJarEnabled": false, "taxJarProductCodesMapping": {"L7h71f7z": "vDuLU398", "CMnaumeF": "yNLyxDbh", "fMVyxmHS": "LDS8j2zQ"}}' \
    > test.out 2>&1
eval_tap $? 268 'UpdatePaymentTaxConfig' test.out

#- 269 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'hiJzpQGS' \
    --end 'zKX3CZvC' \
    --start 'zzfmR40I' \
    > test.out 2>&1
eval_tap $? 269 'SyncPaymentOrders' test.out

#- 270 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'IdmlCKhu' \
    --storeId '1OD53kfM' \
    > test.out 2>&1
eval_tap $? 270 'PublicGetRootCategories' test.out

#- 271 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'a6X8x0GO' \
    --storeId 'GepkHGrU' \
    > test.out 2>&1
eval_tap $? 271 'DownloadCategories' test.out

#- 272 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'zt5S9PWY' \
    --namespace "$AB_NAMESPACE" \
    --language 'QseFJk6U' \
    --storeId '0h6bxsVq' \
    > test.out 2>&1
eval_tap $? 272 'PublicGetCategory' test.out

#- 273 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'WotPtDTO' \
    --namespace "$AB_NAMESPACE" \
    --language 'Q20uP9jx' \
    --storeId 'ZMEw4c0s' \
    > test.out 2>&1
eval_tap $? 273 'PublicGetChildCategories' test.out

#- 274 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '0GM8Rick' \
    --namespace "$AB_NAMESPACE" \
    --language 'LzLTrLGU' \
    --storeId 'HDOb08gr' \
    > test.out 2>&1
eval_tap $? 274 'PublicGetDescendantCategories' test.out

#- 275 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 275 'PublicListCurrencies' test.out

#- 276 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'ZTG4jKdA' \
    --region 'w2ffZQxv' \
    --storeId '7xHPOBa7' \
    --appId 'WDs5lW7m' \
    > test.out 2>&1
eval_tap $? 276 'PublicGetItemByAppId' test.out

#- 277 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --baseAppId '1p2kuAky' \
    --categoryPath '1EOl3tMJ' \
    --features 'PB5YFnqo' \
    --itemType 'BUNDLE' \
    --language 'PtuZdpak' \
    --limit '72' \
    --offset '28' \
    --region 'Un9sHYrW' \
    --sortBy 'updatedAt:asc,name:asc,createdAt:asc' \
    --storeId 'MdbUsDKQ' \
    --tags 'TdLAI4It' \
    > test.out 2>&1
eval_tap $? 277 'PublicQueryItems' test.out

#- 278 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --language 'jhPWT54T' \
    --region 'mKKNlyqz' \
    --storeId 'QEgJ97XE' \
    --sku 'qe5DX1CP' \
    > test.out 2>&1
eval_tap $? 278 'PublicGetItemBySku' test.out

#- 279 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --language 'JSa9UOat' \
    --region 'SMp4A7U1' \
    --storeId '6NrcjYcG' \
    --itemIds 'bQIPH2lI' \
    > test.out 2>&1
eval_tap $? 279 'PublicBulkGetItems' test.out

#- 280 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["FtGw2m7E", "ukiILBaO", "VwE7rZnQ"]}' \
    > test.out 2>&1
eval_tap $? 280 'PublicValidateItemPurchaseCondition' test.out

#- 281 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --itemType 'OPTIONBOX' \
    --limit '60' \
    --offset '29' \
    --region 'n1vroEyb' \
    --storeId 'XbM12zHx' \
    --keyword 'ILVQLvqi' \
    --language 'EaiFSu1i' \
    > test.out 2>&1
eval_tap $? 281 'PublicSearchItems' test.out

#- 282 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'MvmMUkjB' \
    --namespace "$AB_NAMESPACE" \
    --language '7kpUAG5T' \
    --region 'LP2kIoZZ' \
    --storeId 'XAElq9w3' \
    > test.out 2>&1
eval_tap $? 282 'PublicGetApp' test.out

#- 283 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId '5NBG9up0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 283 'PublicGetItemDynamicData' test.out

#- 284 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'TXMZLtAB' \
    --namespace "$AB_NAMESPACE" \
    --language '1T7nZ8GK' \
    --populateBundle  \
    --region 'xIruHqVh' \
    --storeId 'Y9oRXgXx' \
    > test.out 2>&1
eval_tap $? 284 'PublicGetItem' test.out

#- 285 GetPaymentCustomization
eval_tap 0 285 'GetPaymentCustomization # SKIP deprecated' test.out

#- 286 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"paymentOrderNo": "8JxVTTs4", "paymentProvider": "PAYPAL", "returnUrl": "1i3Na6jN", "ui": "NjarYvFx", "zipCode": "tZJIcXqO"}' \
    > test.out 2>&1
eval_tap $? 286 'PublicGetPaymentUrl' test.out

#- 287 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LY9lU82l' \
    > test.out 2>&1
eval_tap $? 287 'PublicGetPaymentMethods' test.out

#- 288 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'R0zdlGN4' \
    > test.out 2>&1
eval_tap $? 288 'PublicGetUnpaidPaymentOrder' test.out

#- 289 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tdF5DLWX' \
    --paymentProvider 'WXPAY' \
    --zipCode 'O6oFZ6AE' \
    --body '{"token": "EtI4C8pz"}' \
    > test.out 2>&1
eval_tap $? 289 'Pay' test.out

#- 290 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LHRHaw5P' \
    > test.out 2>&1
eval_tap $? 290 'PublicCheckPaymentOrderPaidStatus' test.out

#- 291 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 'RmrWW2dv' \
    > test.out 2>&1
eval_tap $? 291 'GetPaymentPublicConfig' test.out

#- 292 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'WcO0vJIm' \
    > test.out 2>&1
eval_tap $? 292 'PublicGetQRCode' test.out

#- 293 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'r4IlIgDV' \
    --foreinginvoice 'PDo89ozc' \
    --invoiceId '2u7N8On7' \
    --payload 'vcWykxtY' \
    --redirectResult 'qZJOzdrR' \
    --resultCode '84sDZcff' \
    --sessionId 'l3voeiaU' \
    --status 'OyqdiZGX' \
    --token 'qrWTvXU5' \
    --type 'QnHGdtwr' \
    --userId 'BySQZnUQ' \
    --orderNo 'mixzlCZP' \
    --paymentOrderNo 'OIKZtqql' \
    --paymentProvider 'WALLET' \
    --returnUrl 'ck61z4ps' \
    > test.out 2>&1
eval_tap $? 293 'PublicNormalizePaymentReturnUrl' test.out

#- 294 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'bMtHn86M' \
    --paymentOrderNo 'Hb2QE3uA' \
    --paymentProvider 'CHECKOUT' \
    > test.out 2>&1
eval_tap $? 294 'GetPaymentTaxValue' test.out

#- 295 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'iCHBaPgS' \
    > test.out 2>&1
eval_tap $? 295 'GetRewardByCode' test.out

#- 296 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'QCHk3zia' \
    --limit '15' \
    --offset '29' \
    --sortBy 'namespace,namespace:asc' \
    > test.out 2>&1
eval_tap $? 296 'QueryRewards1' test.out

#- 297 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'tYYSgLTj' \
    > test.out 2>&1
eval_tap $? 297 'GetReward1' test.out

#- 298 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 298 'PublicListStores' test.out

#- 299 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'AGHS0myA,Kdn0Om3a,ImfOZf3d' \
    --itemIds 'kxCEsqkw,CtgpKC3E,CC2rq53c' \
    --skus '1lEwGyP5,tRapwG7c,86yTOz1x' \
    > test.out 2>&1
eval_tap $? 299 'PublicExistsAnyMyActiveEntitlement' test.out

#- 300 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'Q0lkZDzK' \
    > test.out 2>&1
eval_tap $? 300 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 301 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'mF68Vosf' \
    > test.out 2>&1
eval_tap $? 301 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 302 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'dY93pZsX' \
    > test.out 2>&1
eval_tap $? 302 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 303 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'afAk08Lq,V3NdPXqX,utHkjsSI' \
    --itemIds 'CG8Rqdp9,UD7o7T66,fK1GVT4t' \
    --skus 'A074fiua,tSdVTj9O,IunI16rZ' \
    > test.out 2>&1
eval_tap $? 303 'PublicGetEntitlementOwnershipToken' test.out

#- 304 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'vaeTPgn0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 304 'PublicGetMyWallet' test.out

#- 305 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8OGbEMG' \
    --body '{"epicGamesJwtToken": "vHKWXj9K"}' \
    > test.out 2>&1
eval_tap $? 305 'SyncEpicGameDLC' test.out

#- 306 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'furKmwt5' \
    --body '{"serviceLabel": 24}' \
    > test.out 2>&1
eval_tap $? 306 'PublicSyncPsnDlcInventory' test.out

#- 307 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'cZit2TLq' \
    --body '{"appId": "rC6gaLgd", "steamId": "QmxByxgI"}' \
    > test.out 2>&1
eval_tap $? 307 'SyncSteamDLC' test.out

#- 308 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ybMqdBaY' \
    --body '{"xstsToken": "c7aBgXQD"}' \
    > test.out 2>&1
eval_tap $? 308 'SyncXboxDLC' test.out

#- 309 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'kTBmhwxB' \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'umHNb0OH' \
    --itemId 'SkgGXqkN,HVLBhQC4,mkflhSqJ' \
    --limit '38' \
    --offset '31' \
    > test.out 2>&1
eval_tap $? 309 'PublicQueryUserEntitlements' test.out

#- 310 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YOp51AeX' \
    --appId '9y0xpNRk' \
    > test.out 2>&1
eval_tap $? 310 'PublicGetUserAppEntitlementByAppId' test.out

#- 311 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'OcGuD77R' \
    --limit '59' \
    --offset '32' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 311 'PublicQueryUserEntitlementsByAppType' test.out

#- 312 PublicGetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'yukndZXZ' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'ifZH32LT' \
    > test.out 2>&1
eval_tap $? 312 'PublicGetUserEntitlementByItemId' test.out

#- 313 PublicGetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'hSUyU1ww' \
    --entitlementClazz 'APP' \
    --sku 'VnFeWhK9' \
    > test.out 2>&1
eval_tap $? 313 'PublicGetUserEntitlementBySku' test.out

#- 314 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'FAzYctUg' \
    --appIds 'drXlAkyM,IM1Fv68o,W40DRFQt' \
    --itemIds 'FI8MEVp8,j6XcDBnl,GSRnnldF' \
    --skus '4Gg3bSyL,yx9XUXhB,679cVfpA' \
    > test.out 2>&1
eval_tap $? 314 'PublicExistsAnyUserActiveEntitlement' test.out

#- 315 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FynOdQRl' \
    --appId 'sFmtu1tr' \
    > test.out 2>&1
eval_tap $? 315 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 316 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'QC3k506K' \
    --entitlementClazz 'APP' \
    --itemId 'XdGauTD2' \
    > test.out 2>&1
eval_tap $? 316 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 317 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ATW3ieAu' \
    --ids 'q6BTU3U9,oBuNz6KD,a7uL38Ii' \
    > test.out 2>&1
eval_tap $? 317 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 318 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'z6FQype2' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'jwKbz0Cv' \
    > test.out 2>&1
eval_tap $? 318 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 319 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '7YyazgYg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UDmqZMSn' \
    > test.out 2>&1
eval_tap $? 319 'PublicGetUserEntitlement' test.out

#- 320 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'MgSVo5eK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CXJiZ1Dd' \
    --body '{"options": ["zbxhAsIs", "eQHc9YKP", "7MhStnoK"], "useCount": 13}' \
    > test.out 2>&1
eval_tap $? 320 'PublicConsumeUserEntitlement' test.out

#- 321 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '0v4Kjeq0' \
    --body '{"code": "Mum10TB7", "language": "xRmu_cuLU", "region": "eF1K9GOo"}' \
    > test.out 2>&1
eval_tap $? 321 'PublicRedeemCode' test.out

#- 322 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fgxmh3RD' \
    --body '{"excludeOldTransactions": false, "language": "Jb_129", "productId": "n94Iykxe", "receiptData": "W9yocL4b", "region": "iaoGoQrL", "transactionId": "WAvftXmS"}' \
    > test.out 2>&1
eval_tap $? 322 'PublicFulfillAppleIAPItem' test.out

#- 323 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'qIYXtX2K' \
    --body '{"epicGamesJwtToken": "enm0v9YP"}' \
    > test.out 2>&1
eval_tap $? 323 'SyncEpicGamesInventory' test.out

#- 324 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'L6DaCgxX' \
    --body '{"autoAck": false, "language": "FS_wcZC-158", "orderId": "CGpXE4qz", "packageName": "eYYrJbhu", "productId": "poopFJs9", "purchaseTime": 59, "purchaseToken": "h4hsiuk5", "region": "HCW90uDZ"}' \
    > test.out 2>&1
eval_tap $? 324 'PublicFulfillGoogleIAPItem' test.out

#- 325 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'C41wedOk' \
    --body '{"currencyCode": "zI7lNPGg", "price": 0.6623372525972547, "productId": "Jvc2KQ72", "serviceLabel": 75}' \
    > test.out 2>&1
eval_tap $? 325 'PublicReconcilePlayStationStore' test.out

#- 326 SyncStadiaEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncStadiaEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkG9acjG' \
    --body '{"appId": "r5RB93j8", "language": "sAP_vQyj-351", "region": "Q9sovxY5", "stadiaPlayerId": "frF51tiC"}' \
    > test.out 2>&1
eval_tap $? 326 'SyncStadiaEntitlement' test.out

#- 327 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ceSUYXFK' \
    --body '{"appId": "LJwfU7Av", "currencyCode": "Wp89JlDO", "language": "mT_Ha", "price": 0.8673718909098329, "productId": "fzEc3TtQ", "region": "GmT8T2QM", "steamId": "UBOuM0uT"}' \
    > test.out 2>&1
eval_tap $? 327 'SyncSteamInventory' test.out

#- 328 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'p2X6Dk1b' \
    --body '{"gameId": "XK21OEJl", "language": "XO_FYus_388", "region": "lPjIUTW5"}' \
    > test.out 2>&1
eval_tap $? 328 'SyncTwitchDropsEntitlement' test.out

#- 329 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'MApJufXU' \
    --body '{"currencyCode": "NPRTLRJ1", "price": 0.3297890093414172, "productId": "oXCM3xYB", "xstsToken": "Tq2PbrAQ"}' \
    > test.out 2>&1
eval_tap $? 329 'SyncXboxInventory' test.out

#- 330 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'wM67yDn5' \
    --itemId '2D8mYfNs' \
    --limit '45' \
    --offset '73' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 330 'PublicQueryUserOrders' test.out

#- 331 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'e7f21LmG' \
    --body '{"currencyCode": "zW6ZTYRq", "discountedPrice": 95, "ext": {"T4MLyg70": {}, "TqwWcFqg": {}, "LRyAIPQx": {}}, "itemId": "wccoVVsC", "language": "Ng_GIkZ_Zn", "price": 58, "quantity": 50, "region": "foPIaNXr", "returnUrl": "5WHCr0Tu"}' \
    > test.out 2>&1
eval_tap $? 331 'PublicCreateUserOrder' test.out

#- 332 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UsROsQla' \
    --userId 'DI6R4Sb0' \
    > test.out 2>&1
eval_tap $? 332 'PublicGetUserOrder' test.out

#- 333 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QBclNkNz' \
    --userId 'qQRNf3y7' \
    > test.out 2>&1
eval_tap $? 333 'PublicCancelUserOrder' test.out

#- 334 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '1WTfcmcy' \
    --userId 'aAVCEIih' \
    > test.out 2>&1
eval_tap $? 334 'PublicGetUserOrderHistories' test.out

#- 335 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'muZJy2Xj' \
    --userId 'u66Dl1Tu' \
    > test.out 2>&1
eval_tap $? 335 'PublicDownloadUserOrderReceipt' test.out

#- 336 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZeKUHa7o' \
    > test.out 2>&1
eval_tap $? 336 'PublicGetPaymentAccounts' test.out

#- 337 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '0dtWWKD7' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'vuJYZHWm' \
    > test.out 2>&1
eval_tap $? 337 'PublicDeletePaymentAccount' test.out

#- 338 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'dDD4RiXe' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'CicKq9n8' \
    --limit '38' \
    --offset '40' \
    --sku 'lVbWxeNG' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 338 'PublicQueryUserSubscriptions' test.out

#- 339 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '8yt2Y6c3' \
    --body '{"currencyCode": "co4MV3XM", "itemId": "kKivv5lK", "language": "cvyU-447", "region": "ecJpzE08", "returnUrl": "IGKewi1e", "source": "EVd7QR0f"}' \
    > test.out 2>&1
eval_tap $? 339 'PublicSubscribeSubscription' test.out

#- 340 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'v5RjpCms' \
    --itemId 'ibrQ0fAm' \
    > test.out 2>&1
eval_tap $? 340 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 341 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VeE5OR6T' \
    --userId 'SV7iBoFp' \
    > test.out 2>&1
eval_tap $? 341 'PublicGetUserSubscription' test.out

#- 342 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'PTvGsIzZ' \
    --userId 'YtugbYZL' \
    > test.out 2>&1
eval_tap $? 342 'PublicChangeSubscriptionBillingAccount' test.out

#- 343 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'N9VfYzpr' \
    --userId '9ZezrzA1' \
    --body '{"immediate": false, "reason": "JaltQOn4"}' \
    > test.out 2>&1
eval_tap $? 343 'PublicCancelSubscription' test.out

#- 344 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'k94c6kXr' \
    --userId 'youaYoKx' \
    --excludeFree  \
    --limit '1' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 344 'PublicGetUserSubscriptionBillingHistories' test.out

#- 345 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '1vrIXaw2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Chkyimqi' \
    > test.out 2>&1
eval_tap $? 345 'PublicGetWallet' test.out

#- 346 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'P3lslp4F' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xDiFItXw' \
    --limit '16' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 346 'PublicListUserWalletTransactions' test.out


rm -f "tmp.dat"

exit $EXIT_CODE