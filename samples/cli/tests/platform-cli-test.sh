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
echo "1..478"

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

#- 3 GetFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform getFulfillmentScript \
    --id 'EAxcVpFrttufHIRd' \
    > test.out 2>&1
eval_tap $? 3 'GetFulfillmentScript' test.out

#- 4 CreateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform createFulfillmentScript \
    --id 'H9UzVRiXbqlAw7r6' \
    --body '{"grantDays": "W2ktQG0h5JAav5kR"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateFulfillmentScript' test.out

#- 5 DeleteFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform deleteFulfillmentScript \
    --id 'a62WopBJHPtcDs8b' \
    > test.out 2>&1
eval_tap $? 5 'DeleteFulfillmentScript' test.out

#- 6 UpdateFulfillmentScript
./ng net.accelbyte.sdk.cli.Main platform updateFulfillmentScript \
    --id 'BZLCXLx8bbgorQeF' \
    --body '{"grantDays": "bQ1g7qbPngUNB1vR"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateFulfillmentScript' test.out

#- 7 ListItemTypeConfigs
./ng net.accelbyte.sdk.cli.Main platform listItemTypeConfigs \
    > test.out 2>&1
eval_tap $? 7 'ListItemTypeConfigs' test.out

#- 8 CreateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform createItemTypeConfig \
    --body '{"clazz": "odwpzS6DaDpv8N7Z", "dryRun": true, "fulfillmentUrl": "qGj6oDLjWjkY1aXl", "itemType": "OPTIONBOX", "purchaseConditionUrl": "oMF78NY4YkHs1cnz"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateItemTypeConfig' test.out

#- 9 SearchItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform searchItemTypeConfig \
    --clazz '1JSDgY1TXp38zsCT' \
    --itemType 'MEDIA' \
    > test.out 2>&1
eval_tap $? 9 'SearchItemTypeConfig' test.out

#- 10 GetItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform getItemTypeConfig \
    --id 'TcPiSuL0Sly6XM4O' \
    > test.out 2>&1
eval_tap $? 10 'GetItemTypeConfig' test.out

#- 11 UpdateItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform updateItemTypeConfig \
    --id 'I18mAQLnzjMf8GZ2' \
    --body '{"clazz": "WBZqxYG3aREAu2D6", "dryRun": true, "fulfillmentUrl": "CWP75TB0i7pKxR8d", "purchaseConditionUrl": "l0zRVW4EZG9m0Xcg"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateItemTypeConfig' test.out

#- 12 DeleteItemTypeConfig
./ng net.accelbyte.sdk.cli.Main platform deleteItemTypeConfig \
    --id 'GVbMqSszE8GHavj7' \
    > test.out 2>&1
eval_tap $? 12 'DeleteItemTypeConfig' test.out

#- 13 QueryCampaigns
./ng net.accelbyte.sdk.cli.Main platform queryCampaigns \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --name 'AdIhUDrwoZ5MecdK' \
    --offset '17' \
    --tag '1C8XfwHuKeb9l3rG' \
    > test.out 2>&1
eval_tap $? 13 'QueryCampaigns' test.out

#- 14 CreateCampaign
./ng net.accelbyte.sdk.cli.Main platform createCampaign \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "N9A3sNm84hddSpHt", "discountConfig": {"categories": [{"categoryPath": "0P7MIIR7CkyF6C7d", "includeSubCategories": true}, {"categoryPath": "miTqpyhPFdxLzFQN", "includeSubCategories": false}, {"categoryPath": "5MYzYiKWe5dNRljv", "includeSubCategories": true}], "currencyCode": "ddVCvu9vx5KQ7KYn", "currencyNamespace": "IuMBvaO35llzQRaT", "discountAmount": 47, "discountPercentage": 21, "discountType": "PERCENTAGE", "items": [{"itemId": "xUfofvnnSuB0y5WU", "itemName": "lrMdI4sNveabntBS"}, {"itemId": "xTeIv53HGCiljvjK", "itemName": "oyD6SCwGrncqmLtj"}, {"itemId": "QHAf8TgoNm03VLis", "itemName": "V6zwPuo3td6TC6I3"}], "restrictType": "ITEMS_AND_CATEGORIES", "stackable": true}, "items": [{"extraSubscriptionDays": 19, "itemId": "4rt69lna7qxNeIxP", "itemName": "z6MbwL6IY69z1UaL", "quantity": 34}, {"extraSubscriptionDays": 23, "itemId": "YSYWytLPziZMdjxc", "itemName": "BZufQxGiHPllG4cY", "quantity": 62}, {"extraSubscriptionDays": 63, "itemId": "zfTD1ZBm3MqHcUmL", "itemName": "ZZbSqb8RwNmn9HrN", "quantity": 88}], "maxRedeemCountPerCampaignPerUser": 1, "maxRedeemCountPerCode": 49, "maxRedeemCountPerCodePerUser": 24, "maxSaleCount": 43, "name": "5BYNtIuS5S5XUdjs", "redeemEnd": "1978-07-27T00:00:00Z", "redeemStart": "1979-07-01T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["EdscKHPEqgA8yu7V", "k6Jt4Ymos9Jcdos4", "fYcTVU6RBt0zYoMc"], "type": "REDEMPTION"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateCampaign' test.out

#- 15 GetCampaign
./ng net.accelbyte.sdk.cli.Main platform getCampaign \
    --campaignId 'yCUEXlAvxJMdalwS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'GetCampaign' test.out

#- 16 UpdateCampaign
./ng net.accelbyte.sdk.cli.Main platform updateCampaign \
    --campaignId 'yliWMNW5NyLu0M3V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Hh2EI8JlDbPWbQ6Q", "discountConfig": {"categories": [{"categoryPath": "9lNmqRBaAkLnvxkT", "includeSubCategories": true}, {"categoryPath": "X68cmDc3fxU8MyKr", "includeSubCategories": true}, {"categoryPath": "v52Dlym6puQ23xoJ", "includeSubCategories": false}], "currencyCode": "qmF51TkhjYnaq6fo", "currencyNamespace": "WvXa3bMrXsDr6kIL", "discountAmount": 38, "discountPercentage": 86, "discountType": "AMOUNT", "items": [{"itemId": "SyDdmykmoPYgc2L4", "itemName": "jk4Lo0LSP0pf4Ixj"}, {"itemId": "Ukl535X3ateEKDpA", "itemName": "Dz1x3poD3Qgb3boL"}, {"itemId": "QQ1MzH7Qm8bwbmXg", "itemName": "dAPh1EThG96gAFKK"}], "restrictType": "NONE", "stackable": true}, "items": [{"extraSubscriptionDays": 2, "itemId": "gCcxvONZm3EeERmD", "itemName": "nyeFoF7VSZ6pf3vn", "quantity": 8}, {"extraSubscriptionDays": 92, "itemId": "SD2Tb3g7mSQUhAEt", "itemName": "rmjqU6YE3p4lSck0", "quantity": 27}, {"extraSubscriptionDays": 69, "itemId": "0nSBJroav91GXlvP", "itemName": "G6bFYReVHQipcCx9", "quantity": 0}], "maxRedeemCountPerCampaignPerUser": 46, "maxRedeemCountPerCode": 61, "maxRedeemCountPerCodePerUser": 59, "maxSaleCount": 76, "name": "L7vIYhGGSyEW4ZJJ", "redeemEnd": "1994-11-17T00:00:00Z", "redeemStart": "1972-02-06T00:00:00Z", "redeemType": "DISCOUNT", "status": "INACTIVE", "tags": ["hgo5QB65lSAiYnNj", "kfZrQvGgbLdLsFzH", "kBMr1yrOMlNFSrUE"]}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateCampaign' test.out

#- 17 RenameBatch
./ng net.accelbyte.sdk.cli.Main platform renameBatch \
    --campaignId 'irnjX9fDmIbeZxzf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"newName": "TcyiuATus9hsfpFD", "oldName": "cSDG8aMVGLiBNrDj"}' \
    > test.out 2>&1
eval_tap $? 17 'RenameBatch' test.out

#- 18 QueryCampaignBatchNames
./ng net.accelbyte.sdk.cli.Main platform queryCampaignBatchNames \
    --campaignId 'qoxcwgGLXpUL4pp2' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'ncYAHdNzDmeIP6rO' \
    --limit '43' \
    > test.out 2>&1
eval_tap $? 18 'QueryCampaignBatchNames' test.out

#- 19 GetCampaignDynamic
./ng net.accelbyte.sdk.cli.Main platform getCampaignDynamic \
    --campaignId '5cJcHm3SZLxoRDFu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetCampaignDynamic' test.out

#- 20 GetCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform getCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetCatalogConfig' test.out

#- 21 UpdateCatalogConfig
./ng net.accelbyte.sdk.cli.Main platform updateCatalogConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableInventoryCheck": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateCatalogConfig' test.out

#- 22 GetLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetLootBoxPluginConfig' test.out

#- 23 UpdateLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "fRByjlBiuFM3FIoV"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "1X2PFAAMwzHPxB1U"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateLootBoxPluginConfig' test.out

#- 24 DeleteLootBoxPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteLootBoxPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteLootBoxPluginConfig' test.out

#- 25 UplodLootBoxPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uplodLootBoxPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 25 'UplodLootBoxPluginConfigCert' test.out

#- 26 GetLootBoxGrpcInfo
./ng net.accelbyte.sdk.cli.Main platform getLootBoxGrpcInfo \
    --namespace "$AB_NAMESPACE" \
    --force  \
    > test.out 2>&1
eval_tap $? 26 'GetLootBoxGrpcInfo' test.out

#- 27 GetSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetSectionPluginConfig' test.out

#- 28 UpdateSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "CnqntX9y1aZSWMiV"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "DKHRuPMMWH8Yb33T"}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 28 'UpdateSectionPluginConfig' test.out

#- 29 DeleteSectionPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSectionPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteSectionPluginConfig' test.out

#- 30 UploadSectionPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadSectionPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 30 'UploadSectionPluginConfigCert' test.out

#- 31 GetRootCategories
./ng net.accelbyte.sdk.cli.Main platform getRootCategories \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UBJCjfcnLRfxeCSz' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId '9WEi8KlloeH0JT1y' \
    --body '{"categoryPath": "duat2vQR3biBfsu4", "localizationDisplayNames": {"jmsRE2w1yEkLgh3t": "IYt4SqYUTLDx9gIi", "DandpGT2t24aOMh5": "eC3IHeHSKLCa3xre", "NDUWehwH3q31A806": "DJgas4b6z3LNUj7f"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dgLA84Z8YYk6QEgJ' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'jBbEDoNf3n0hEoRC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Acf80zfFyabWAgIU' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'XiI07A68eaqC2J9j' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yEW6GLbc0NaKDUL3' \
    --body '{"localizationDisplayNames": {"sa13lk1dQBHO86Il": "BhnetU4RwTqUXlTD", "BzOuYsaZA2yyd4mb": "qoOfADMMAXFaY9eK", "a699bRVhyaKwwrAP": "2aMlu7WtjCtoYetO"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'O847g8OudOfjnCuH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Z3c46IjGa23YvYmm' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'Dg7VYPXIuvUYTZBR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ujIUE1Tq5jyAZvkR' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'CMNFIurjh2imdb4r' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bkXj0ZwsVC0gL97Z' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'VJSPqJiwv1qlYB1R' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName 'SKs6gQxC3Gb7S0o4' \
    --batchNo '51,18,66' \
    --code 'pNDigNJma1MbqqZt' \
    --limit '11' \
    --offset '43' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'NWql4nmwAft4gqkN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "NlWkD9eOziYRFOn0", "codeValue": "jJLHC9LxhvNXTwGB", "quantity": 59}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'ICQLfl7MUBG7qtPu' \
    --namespace "$AB_NAMESPACE" \
    --batchName '64yAtURKLRkb738H' \
    --batchNo '67,64,91' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId '6oQAXVG7tnsZg5Qg' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'XjvyGJPN4eXbJE5V' \
    --batchNo '38,43,67' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'ecnEevcAx2K2zkRe' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'nmPZnGBt4P7WnbdS' \
    --batchNo '72,9,40' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'QediogEhhM2rIizG' \
    --namespace "$AB_NAMESPACE" \
    --code 'dKvOPdq5xrgxSmy1' \
    --limit '61' \
    --offset '41' \
    --userId 'N9LFkYW5DQyj4bj5' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Ro2ogaKt2ujQSa3Z' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'db65UXmy0Zp6iIaT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'IKUkmkk9QM0NBMA9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'EnableCode' test.out

#- 48 GetServicePluginConfig
eval_tap 0 48 'GetServicePluginConfig # SKIP deprecated' test.out

#- 49 UpdateServicePluginConfig
eval_tap 0 49 'UpdateServicePluginConfig # SKIP deprecated' test.out

#- 50 DeleteServicePluginConfig
eval_tap 0 50 'DeleteServicePluginConfig # SKIP deprecated' test.out

#- 51 ListCurrencies
./ng net.accelbyte.sdk.cli.Main platform listCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 51 'ListCurrencies' test.out

#- 52 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "RxpzwLR2AK6eXUGP", "currencySymbol": "Jsw1fiP80G9Pclxc", "currencyType": "REAL", "decimals": 69, "localizationDescriptions": {"t2ulIJzPyrVEiOG4": "UcqsuGKHhMRWLVd3", "DlhLuIpomM8sm1Mi": "aI1mX2tJoARtdbBe", "7udsMrok0WvGYYnx": "4V709xbnGezKsDwG"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '2omOR2nvYI9TVqJd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"vzcWbfUpaXp5JMl5": "LL4bTxBmZjdrrIxs", "B0NRsB1fPqqRRulp": "qpymDkQhtrHWwRVn", "wVBOqOHi8pWGd1ju": "YhiqjRJOqB5F93zF"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'QbJndUDpdONneAcz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'bBdHb2slt71B1SmZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'p2JZp50CnPb71ORY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfig' test.out

#- 58 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "cmQbTU5JX8ccLjMX", "rewards": [{"currency": {"currencyCode": "JRk0eaKQDOJvrTef", "namespace": "glSs6g4iY9u02aCN"}, "item": {"itemId": "YIWekp18lOC3mNqF", "itemName": "7Bl0LcghVHfPEspx", "itemSku": "whRON0bc1eMbEIjo", "itemType": "wLqc3ecjXJbZDKKo"}, "quantity": 47, "type": "ITEM"}, {"currency": {"currencyCode": "645xpdXpai0rYaT5", "namespace": "hOPjaf3H0tYighU0"}, "item": {"itemId": "VUfcYHJbBfAKSiPW", "itemName": "3VgsZXiR1DJ7HVWq", "itemSku": "MkNSawQUWDFJvJBW", "itemType": "ic7UkBeIXuqDuAXI"}, "quantity": 54, "type": "CURRENCY"}, {"currency": {"currencyCode": "bQ71w0deoV9Lx5RD", "namespace": "A1l2XcrciYNEzvSZ"}, "item": {"itemId": "IPkhSgORcz5S5Bvm", "itemName": "gBLxh4ijFnE3Tam6", "itemSku": "9qSZ7PC6f6QkmZXE", "itemType": "lW9YfRSse6AAz3S4"}, "quantity": 5, "type": "ITEM"}]}, {"id": "97SBROPYuG6XqP6o", "rewards": [{"currency": {"currencyCode": "o7G73zdxTgOfnwId", "namespace": "lNa29fDLh741IslK"}, "item": {"itemId": "HzGlLKWUtDQs61OQ", "itemName": "AoxyyQpRWCiiPDGQ", "itemSku": "hNPEwiJCf2XJVrlz", "itemType": "qQls1ozhLVA3kE8j"}, "quantity": 74, "type": "ITEM"}, {"currency": {"currencyCode": "m4udE0OXudXgNne8", "namespace": "kJATwlc6esUp6Sw1"}, "item": {"itemId": "I98jeZQ7hfxnhLd3", "itemName": "Knaknoed9DHhLOqQ", "itemSku": "GhCUr6iTrjyEgarA", "itemType": "dNJOIG36I6tRbRcr"}, "quantity": 62, "type": "ITEM"}, {"currency": {"currencyCode": "veMdAdiPKDUVSC00", "namespace": "PYeDcagginxnFIna"}, "item": {"itemId": "3yddcbsPheTH26IU", "itemName": "JNvYuGRUvpZaHCuE", "itemSku": "SOiIZsMfB4ZH3mtg", "itemType": "WgU4pCAKxeE70Cau"}, "quantity": 28, "type": "ITEM"}]}, {"id": "xot371W9G4AvQkqs", "rewards": [{"currency": {"currencyCode": "Gnmyo5JJTUVmb8GE", "namespace": "XFTlEMEsFzYqwgK1"}, "item": {"itemId": "Np5nodqpLm7FhJBN", "itemName": "XzAFdO0Khqf6kiTd", "itemSku": "SGv2LFjAKY7CbgsW", "itemType": "qFWZX7kPBom8F9GL"}, "quantity": 77, "type": "ITEM"}, {"currency": {"currencyCode": "G8phc3n4iLoIllKl", "namespace": "pO2pqiXJF3WGRaoQ"}, "item": {"itemId": "omSJC4DdrKF7SUQP", "itemName": "LG59e0k5ZtX6wK7P", "itemSku": "pUlcIW32iK7MGt1i", "itemType": "xY5rA1WoVeJIePF8"}, "quantity": 16, "type": "ITEM"}, {"currency": {"currencyCode": "eDyF97lGdMiHKxbW", "namespace": "CYzo8yO2KTK9tmmO"}, "item": {"itemId": "nYnOpas6ghP1y4Zi", "itemName": "7s7QBlk44Z44B1GZ", "itemSku": "gKg4uKxaCgcGLuC3", "itemType": "brWdTYCfHkIySok5"}, "quantity": 60, "type": "CURRENCY"}]}]}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateDLCItemConfig' test.out

#- 59 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'DeleteDLCItemConfig' test.out

#- 60 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetPlatformDLCConfig' test.out

#- 61 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "OCULUS", "platformDlcIdMap": {"E9LN9bvhOrHflIOd": "6X3viLvtEk4mTIpU", "A9gxo8SV38nEhoXm": "M2W7l6jHMA2rG3na", "kopAywelu01nryEJ": "0NqoTow0qiOiC4j0"}}, {"platform": "OCULUS", "platformDlcIdMap": {"XqKhTPkwfLM9uSyb": "RzWek2gZvRrvr0n9", "d9lvccKMLhrTrcBE": "2ItBS3KtKZWe8aoF", "zAyBME74HUtipUWY": "hWV1qx8CzPML52fa"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"Ur9Sk4lq2faBcAXX": "KlhvyH8paOJtxqMP", "pcVfRwNj547fH0Xr": "KEDpEY8VnocGAjci", "0V3tBf2jnHGKXphn": "50c9tNLDljhZ2jxL"}}]}' \
    > test.out 2>&1
eval_tap $? 61 'UpdatePlatformDLCConfig' test.out

#- 62 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeletePlatformDLCConfig' test.out

#- 63 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'cR0LgB5BUXvjcu2s' \
    --itemId '6w3VifnKqmTSoGH1,XEfY6QAYn6WQ5UBE,U1QAOHfZiGhxOdcu' \
    --limit '60' \
    --offset '15' \
    --origin 'GooglePlay' \
    --userId 'SxSc3aZPV87pna08' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'gxefTYKhuxaEc7M4,P7UckSC6ePeN8i4G,rFES9z7xueHpATHc' \
    --limit '5' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 64 'QueryEntitlements' test.out

#- 65 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'EnableEntitlementOriginFeature' test.out

#- 66 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 66 'GetEntitlementConfigInfo' test.out

#- 67 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "ee9GXhKcjmSEwdrk", "endDate": "1986-05-09T00:00:00Z", "grantedCode": "nnqKzFsLfYalUlfw", "itemId": "EQKjU7eHGebSVu0L", "itemNamespace": "Q40kepEaC4dfiOMZ", "language": "Gf", "metadata": {"Hr39pysFO3Zvc1BZ": {}, "G99LyvfvHEsJKQQe": {}, "wVLMUoAnaRcYp7FU": {}}, "origin": "IOS", "quantity": 13, "region": "fIGaffoflEIByYqe", "source": "REDEEM_CODE", "startDate": "1991-09-21T00:00:00Z", "storeId": "0meGelYF5wWaDhuk"}, {"collectionId": "U4khGG4vZFTYnPkm", "endDate": "1993-09-02T00:00:00Z", "grantedCode": "u4PWam1jxR7SETWj", "itemId": "teoc8fgvZDDhoO05", "itemNamespace": "oKqymxLD1Lcvw6T6", "language": "Mf", "metadata": {"wxxElpMYSWIeVzm7": {}, "z9noowmlTIKVowi0": {}, "RY2VN4ZONJREdUQ3": {}}, "origin": "Playstation", "quantity": 36, "region": "9F1BxNNgnke4aknc", "source": "PURCHASE", "startDate": "1980-03-21T00:00:00Z", "storeId": "wu9TmXfJWBPrx9Ns"}, {"collectionId": "8eLzYEvwSWTaLQjc", "endDate": "1981-08-20T00:00:00Z", "grantedCode": "vrK2jhsYpKPlXn77", "itemId": "AtYoFzLAATPY8P8P", "itemNamespace": "3cfoivvQxevecWw7", "language": "ORiY_DSGb-yf", "metadata": {"8rX2MVUGKSZ4GcLk": {}, "t4pK32sJxlZcCTpT": {}, "dRtCHvuk6B6XTmSL": {}}, "origin": "Playstation", "quantity": 27, "region": "vqjhbeK2qN8g6x2P", "source": "REDEEM_CODE", "startDate": "1982-12-28T00:00:00Z", "storeId": "Do5R3hLiD5sf5y1J"}], "userIds": ["sxJNGmyt0SQDUDoW", "BZVGLlkUetzCAWc9", "x1aMjgGim51T107X"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["IZRZ7tZdIs0xf4cz", "dt7zqmSKxOEQlVcx", "6GqsBq8vdhWVnuYL"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'gpZehK0G2nmyuViB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '90' \
    --status 'FAIL' \
    --userId 'Cf5oD1e6oI9FmYel' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime '0kOw72o8Zkgk0jS6' \
    --eventType 'OTHER' \
    --externalOrderId '4cXnAXyuGz6LlxHv' \
    --limit '58' \
    --offset '91' \
    --startTime 'WrHSppnIZkNnTn3r' \
    --status 'SUCCESS' \
    --userId 'j2jZtEYT8sIPSE1X' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "XPzySa0sZoFS6xCO", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 98, "clientTransactionId": "Mpyh9pMsQgb64ELb"}, {"amountConsumed": 52, "clientTransactionId": "WDZrpP7rz3ISW510"}, {"amountConsumed": 21, "clientTransactionId": "XjYnSoIFeouC2m38"}], "entitlementId": "kXrDZWlGVE9sJ4Np", "usageCount": 96}, {"clientTransaction": [{"amountConsumed": 56, "clientTransactionId": "tKp6M9I6nEwnZhsj"}, {"amountConsumed": 47, "clientTransactionId": "3jtDYBo4FUTH7CGf"}, {"amountConsumed": 75, "clientTransactionId": "iqaZD63xe5rruJVf"}], "entitlementId": "LGea0ZtlzUcuHAXz", "usageCount": 30}, {"clientTransaction": [{"amountConsumed": 96, "clientTransactionId": "NrHlFi2qJLgmBLE3"}, {"amountConsumed": 91, "clientTransactionId": "YhyiDV90SeI5yppB"}, {"amountConsumed": 68, "clientTransactionId": "JWWSI1ECUo1NPpeF"}], "entitlementId": "hUztXDgB7n4C97uA", "usageCount": 85}], "purpose": "j34uulU6FYBZsWFb"}, "originalTitleName": "r3RSP0W9nBhvhf8Q", "paymentProductSKU": "0DtJMcYQdN66bswA", "purchaseDate": "gt65X4N1LQZmB61J", "sourceOrderItemId": "MdtwCVUrYQue84dw", "titleName": "mbwFEnAZaWsQJtRY"}, "eventDomain": "oagRJK5PX9UcOvhP", "eventSource": "yE11TRT2SKseoe8V", "eventType": "Lie0LBa36KNzjf00", "eventVersion": 58, "id": "6LfxnbY97jjYgXch", "timestamp": "CbkXX26uEdCfQaMA"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetAppleIAPConfig' test.out

#- 74 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appAppleId": 88, "bundleId": "qc0qgV6d9yOfIMLd", "issuerId": "s2DbPcaoMdtRLTmS", "keyId": "vTkQQgB7exYvmHMx", "password": "r5hPCJJztJBg0tTJ", "version": "V1"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateAppleIAPConfig' test.out

#- 75 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteAppleIAPConfig' test.out

#- 76 UpdateAppleP8File
./ng net.accelbyte.sdk.cli.Main platform updateAppleP8File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 76 'UpdateAppleP8File' test.out

#- 77 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'GetEpicGamesIAPConfig' test.out

#- 78 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "VnzaqSfJiQFC2gXo"}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateEpicGamesIAPConfig' test.out

#- 79 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'DeleteEpicGamesIAPConfig' test.out

#- 80 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'GetGoogleIAPConfig' test.out

#- 81 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "da0kg16yUSpSOAjH", "notificationTokenAudience": "JWwfCjYwWkLob9gK", "notificationTokenEmail": "Lqs2nEZhpByfHZin", "packageName": "xNfgPAwkMBsznlBU", "serviceAccountId": "qnLT4AbGptKaWNvP"}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateGoogleIAPConfig' test.out

#- 82 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'DeleteGoogleIAPConfig' test.out

#- 83 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 83 'UpdateGoogleP12File' test.out

#- 84 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'GetIAPItemConfig' test.out

#- 85 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "bpg7yrRvXfZ6rvgv", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"3xRHAKy4QxZkaXZ7": "vmiEd0JPxVyQpsha", "DwNqTbbFMXAMfVXe": "0GZeMgsRsmH1EQrY", "mkPKTPOlhTtSiZNC": "xuogFteTHJe4BhSS"}}, {"itemIdentity": "QkQD6WmOt6D7ufFV", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"OhvQpfbBke8aEdd3": "6xj6wySoltDxsbzx", "rlaKEfkoYjY2o6ou": "RW9UtNquwC3Wgumr", "Iz4NhGztZpr4U4fw": "QIiLXgmRasvjO4lj"}}, {"itemIdentity": "8m3XEwP2b4gd3xOe", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"B5S3DvPRCzBrVUxm": "DOj3cvRFaTC11W0T", "GTCm4fZWuk6pQxDQ": "pKqxLGeMvr9TsvcM", "Q7dBsaIecRxIsZvD": "6rmzVr5XT1Nxw0v1"}}]}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateIAPItemConfig' test.out

#- 86 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'DeleteIAPItemConfig' test.out

#- 87 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetOculusIAPConfig' test.out

#- 88 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "dMQ9Rrbk6C2cVWf6", "appSecret": "ttvbU1PO6ApCD2VX"}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateOculusIAPConfig' test.out

#- 89 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'DeleteOculusIAPConfig' test.out

#- 90 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetPlayStationIAPConfig' test.out

#- 91 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "idT7w0Oc15N8WXBP", "backOfficeServerClientSecret": "p17PAewqSm5x3B4t", "enableStreamJob": false, "environment": "6EjRwEQlNapJRfk4", "streamName": "f9Zcw1pEHAyNFxcV", "streamPartnerName": "TKuAQTGh5BxjWOoz"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdatePlaystationIAPConfig' test.out

#- 92 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeletePlaystationIAPConfig' test.out

#- 93 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'ValidateExistedPlaystationIAPConfig' test.out

#- 94 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "GoDtsUuYo5p8ED5Q", "backOfficeServerClientSecret": "ZAufwNa8lzfjv9oY", "enableStreamJob": false, "environment": "XMjlVHY1AHwF3vGo", "streamName": "av7MK0PcLnEkcokK", "streamPartnerName": "wcQ0baDT9OyJ2h23"}' \
    > test.out 2>&1
eval_tap $? 94 'ValidatePlaystationIAPConfig' test.out

#- 95 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'GetSteamIAPConfig' test.out

#- 96 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "GUS2amU7syGlElXd", "publisherAuthenticationKey": "EAOrVSnLocLVVYam"}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateSteamIAPConfig' test.out

#- 97 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'DeleteSteamIAPConfig' test.out

#- 98 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'GetTwitchIAPConfig' test.out

#- 99 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "Qc4wcG5nDBLJoJHb", "clientSecret": "iQ5duE5p4cfs2E41", "organizationId": "cK8QTwiIAvxSvNDl"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateTwitchIAPConfig' test.out

#- 100 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'DeleteTwitchIAPConfig' test.out

#- 101 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'GetXblIAPConfig' test.out

#- 102 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "mM5nQFMGzs7fzjgy"}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateXblIAPConfig' test.out

#- 103 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'DeleteXblAPConfig' test.out

#- 104 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'c44mEh9tRk8knYSV' \
    > test.out 2>&1
eval_tap $? 104 'UpdateXblBPCertFile' test.out

#- 105 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '30lnroQehMDli6t9' \
    --externalId 'unQLYXxm09wpGAbp' \
    --limit '63' \
    --offset '94' \
    --source 'OCULUS' \
    --startDate 'jQ7gkZEY8rG0q0Q2' \
    --status 'ERROR' \
    --type 'kH4OotKwG3UC6XCn' \
    > test.out 2>&1
eval_tap $? 105 'QueryThirdPartyNotifications' test.out

#- 106 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'nZxF8CmQr17W65br' \
    --limit '96' \
    --offset '44' \
    --platform 'PLAYSTATION' \
    --productId 'n95FhO7VW3mbDVMD' \
    --userId 'u87t0ldWf7iSGIiK' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartySubscription' test.out

#- 107 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'FtWtn4Yr2svKM6pq' \
    --feature 'LGZ0TBujELAUK6mQ' \
    --itemId '5iZgbwwm5iGzXtck' \
    --itemType 'COINS' \
    --startTime 'hidwCkZwqjYLfTiC' \
    > test.out 2>&1
eval_tap $? 107 'DownloadInvoiceDetails' test.out

#- 108 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'O1NDBvQvRPnAz4Vz' \
    --feature 'W0CpoBCbyJsF5IjF' \
    --itemId '1c0W338HS6CBgVRy' \
    --itemType 'CODE' \
    --startTime 'bEGTUj7YjERL1rEQ' \
    > test.out 2>&1
eval_tap $? 108 'GenerateInvoiceSummary' test.out

#- 109 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'G02zccA8wvLsWUNd' \
    --body '{"categoryPath": "6lPKvqDejvqklTSv", "targetItemId": "DwuOrP9lzpiX0VuF", "targetNamespace": "pZum7izxe7NPzjOa"}' \
    > test.out 2>&1
eval_tap $? 109 'SyncInGameItem' test.out

#- 110 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '8E7wY76PxLv9HBEU' \
    --body '{"appId": "e89AwEw1HO4FnKtx", "appType": "SOFTWARE", "baseAppId": "9GDbLNwjm3FK0nnX", "boothName": "2poMfZ1hDHtbh4Ht", "categoryPath": "MlFgvh2Dp2SoiIPp", "clazz": "1yvfAHS0VgLu11A3", "displayOrder": 68, "entitlementType": "CONSUMABLE", "ext": {"ovFi4tPAGfleyCA6": {}, "jEtcqsnzoVILjkwW": {}, "61duF87aUyrdt4XS": {}}, "features": ["rtbECD1CYPwaiBAx", "pWBAetsanzqP8oxf", "fYL8Avt70ZUT2fSk"], "flexible": true, "images": [{"as": "LL0calqxEewuGS46", "caption": "9k2hG0WKt4sUmanY", "height": 47, "imageUrl": "CrRb9gUCeVz7fWbZ", "smallImageUrl": "IdhevfZvyV7Acodc", "width": 46}, {"as": "t2ENKKWrFtHIi1CM", "caption": "gKAOG5iDcCR5PbCv", "height": 61, "imageUrl": "yreciPLfkVyyJsbG", "smallImageUrl": "pO6JgehDJxEN7JlZ", "width": 5}, {"as": "HlJl4tHGa4XfZcd9", "caption": "CVnGqMX9FieeEssW", "height": 63, "imageUrl": "lM0u1uuoVdn9yVoS", "smallImageUrl": "lKNchPHNL4X3LLaG", "width": 85}], "inventoryConfig": {"customAttributes": {"CTRDl0zp9CzHFwin": {}, "kBNi4gvqgl6TZ9TG": {}, "VPmv34h6T7Esufmf": {}}, "serverCustomAttributes": {"xKYB4LM6H6QXmpZ9": {}, "X3fUSR1l9xLPBsmA": {}, "UrD9L1IiD6MlcEPh": {}}, "slotUsed": 78}, "itemIds": ["hzC7MNa8vVe4MHX6", "AgMep90AyyUJyAK5", "PRMRMwdvl0hv6g62"], "itemQty": {"GxBW2tQF5tkTjgJa": 80, "vtxk9hVKlG56HlzG": 36, "txjbrztee7QLTGAa": 22}, "itemType": "OPTIONBOX", "listable": true, "localizations": {"Kaol01DK97D2xnik": {"description": "42miteR5eQAe1rzm", "localExt": {"mgqBPRmd6mO4oI8K": {}, "Dqebm83raNBJ5y7a": {}, "xEkvI4oxZEDxGiBn": {}}, "longDescription": "Nbn0zaf7CaOSlHXr", "title": "USA6sMJzA5mtqISQ"}, "83TTbtefXWznDe4L": {"description": "QdXfFBii2RAMEX5R", "localExt": {"MjBFVZGYzQqV8d9m": {}, "DdUIoiIJFNxuNOmU": {}, "SWw18T1IxVWCxdvP": {}}, "longDescription": "L9e4P01vxP8xj1Ly", "title": "EirURERnEMzpImW6"}, "sjAHyCK5tNanGBrk": {"description": "zUvck3xTtmOFMebS", "localExt": {"4AdlNzwog2IhErkN": {}, "hNcECWwchW6zL9Sk": {}, "bLlrNXnGanMazb8j": {}}, "longDescription": "vRWenURH48aJuALE", "title": "cSqcE15u6D31DjOs"}}, "lootBoxConfig": {"rewardCount": 36, "rewards": [{"lootBoxItems": [{"count": 7, "duration": 38, "endDate": "1987-04-12T00:00:00Z", "itemId": "CUYATdqnQGbqiqOk", "itemSku": "NeATj7eGjodd7CcJ", "itemType": "UrI6MAugK5kypNrp"}, {"count": 79, "duration": 27, "endDate": "1987-09-12T00:00:00Z", "itemId": "xKybPkbuS6x9cLJ1", "itemSku": "APnNlsa2bRBr27fV", "itemType": "MWuAfDqLMR919IZP"}, {"count": 75, "duration": 58, "endDate": "1992-05-24T00:00:00Z", "itemId": "KiAVQXXOmqFHLbyX", "itemSku": "mgCNiXH8uenbC5Cp", "itemType": "hgMweexsIAP5vHLj"}], "name": "BJ9iqMcBL4BzhDUj", "odds": 0.12279169545597934, "type": "REWARD_GROUP", "weight": 81}, {"lootBoxItems": [{"count": 84, "duration": 71, "endDate": "1982-04-19T00:00:00Z", "itemId": "bwcvQU5kG8bXGFmP", "itemSku": "AnOkDiJq4xQye7Hq", "itemType": "nVK3YVeOWs9mfVQh"}, {"count": 72, "duration": 18, "endDate": "1990-07-27T00:00:00Z", "itemId": "Btn9pxpE7BYtzB0B", "itemSku": "4CxyQrUpIFvORxTi", "itemType": "79DpSjb39ukcR6c2"}, {"count": 62, "duration": 64, "endDate": "1980-04-19T00:00:00Z", "itemId": "3vk3IfAKEbqcNXSG", "itemSku": "CCvNowNmdpcJgF88", "itemType": "ySNq4Mj7mulP4tQ6"}], "name": "R1OqKVOTniBgLsNh", "odds": 0.06305956837122895, "type": "PROBABILITY_GROUP", "weight": 87}, {"lootBoxItems": [{"count": 27, "duration": 72, "endDate": "1984-12-26T00:00:00Z", "itemId": "ZjNRSzOTqcVNX3ah", "itemSku": "vxw9gwwhTnjN6wKZ", "itemType": "GW4y3f0R9s2kndhh"}, {"count": 78, "duration": 15, "endDate": "1982-08-09T00:00:00Z", "itemId": "mfIZsWhkS476dGGJ", "itemSku": "wJ00UH197MJ6zU7J", "itemType": "LMQyMWzYQCAaPJgo"}, {"count": 47, "duration": 66, "endDate": "1996-10-16T00:00:00Z", "itemId": "wIc895ImqK6tVsaU", "itemSku": "q3stUh5J5Z9GiBiS", "itemType": "AylX5cS0IeHpWCug"}], "name": "mfOL0QQpxsuD8PGq", "odds": 0.16654942702759346, "type": "REWARD", "weight": 51}], "rollFunction": "CUSTOM"}, "maxCount": 11, "maxCountPerUser": 10, "name": "8ZyyZeHAWGgJUbUJ", "optionBoxConfig": {"boxItems": [{"count": 89, "duration": 79, "endDate": "1975-01-11T00:00:00Z", "itemId": "HDT8QbF7gHPTPQbv", "itemSku": "Lt2NRqJGIKzLyH1y", "itemType": "72L13Ornyx34luLd"}, {"count": 45, "duration": 79, "endDate": "1980-05-30T00:00:00Z", "itemId": "M0IW4oe8KDgy0xZf", "itemSku": "AcNg14Ws8TIP1LKi", "itemType": "FQoLDvumfqrgSfnx"}, {"count": 16, "duration": 94, "endDate": "1985-01-17T00:00:00Z", "itemId": "X9dN1MGRXBJ6mVV7", "itemSku": "JS9qjNLwvI8JdiY3", "itemType": "RRiLilmOGF6dLLIe"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 66, "fixedTrialCycles": 79, "graceDays": 23}, "regionData": {"cdlbdRXTGIrdNL5g": [{"currencyCode": "JPqTAjgqaTHf1ANT", "currencyNamespace": "J9Yk997XkGOdC6It", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1979-06-29T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1978-08-29T00:00:00Z", "expireAt": "1977-03-18T00:00:00Z", "price": 95, "purchaseAt": "1996-08-19T00:00:00Z", "trialPrice": 67}, {"currencyCode": "FkD1AJLCwszbZxuH", "currencyNamespace": "SgDOK8bjoF7bL263", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1973-01-15T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1981-07-08T00:00:00Z", "expireAt": "1997-09-21T00:00:00Z", "price": 12, "purchaseAt": "1989-06-20T00:00:00Z", "trialPrice": 32}, {"currencyCode": "syhE2BKtyTDSIM7m", "currencyNamespace": "kmvZ7Cmsh4US8o4j", "currencyType": "REAL", "discountAmount": 79, "discountExpireAt": "1991-08-04T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1991-06-13T00:00:00Z", "expireAt": "1992-01-18T00:00:00Z", "price": 31, "purchaseAt": "1977-11-27T00:00:00Z", "trialPrice": 60}], "snmnlVljdWYmELe7": [{"currencyCode": "4p38vumnxAnYBTxa", "currencyNamespace": "TIz0jcgDI8Pkz96v", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1996-04-10T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1980-11-10T00:00:00Z", "expireAt": "1979-05-27T00:00:00Z", "price": 71, "purchaseAt": "1985-04-07T00:00:00Z", "trialPrice": 29}, {"currencyCode": "bufnBqrpLeqhwVhj", "currencyNamespace": "nnjKMEmtbiWsAQHb", "currencyType": "REAL", "discountAmount": 36, "discountExpireAt": "1998-10-26T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1975-09-09T00:00:00Z", "expireAt": "1998-08-20T00:00:00Z", "price": 70, "purchaseAt": "1983-12-18T00:00:00Z", "trialPrice": 38}, {"currencyCode": "hfIhHtADUQ9zimQT", "currencyNamespace": "QT95pFJUAJsyAfeK", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1979-02-15T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1995-07-11T00:00:00Z", "expireAt": "1973-07-16T00:00:00Z", "price": 66, "purchaseAt": "1983-11-22T00:00:00Z", "trialPrice": 56}], "ohXu6opxQGRt6Pql": [{"currencyCode": "kL0diRhLC10ih2EQ", "currencyNamespace": "fY3XCv4hdOa6FdZh", "currencyType": "REAL", "discountAmount": 80, "discountExpireAt": "1971-01-27T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1978-04-17T00:00:00Z", "expireAt": "1974-09-15T00:00:00Z", "price": 79, "purchaseAt": "1975-07-29T00:00:00Z", "trialPrice": 67}, {"currencyCode": "0F2UBRmMhAbUWmFh", "currencyNamespace": "dYLWzMuv3zkUY0n0", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1984-02-17T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1999-07-03T00:00:00Z", "expireAt": "1988-01-13T00:00:00Z", "price": 64, "purchaseAt": "1996-01-10T00:00:00Z", "trialPrice": 21}, {"currencyCode": "RkPSSITz4TjCrJHX", "currencyNamespace": "GXku2YVuOzhxHmnr", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1995-06-16T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1997-09-24T00:00:00Z", "expireAt": "1976-05-27T00:00:00Z", "price": 100, "purchaseAt": "1997-01-22T00:00:00Z", "trialPrice": 32}]}, "saleConfig": {"currencyCode": "5sxe6A6RpmKDebNk", "price": 49}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "bynkgT9vayLLiiza", "stackable": false, "status": "ACTIVE", "tags": ["lvDF8qBWCQ9dLWYy", "aJwvkWVco2LTo5ij", "7Ge6zKJdlt7rjF5R"], "targetCurrencyCode": "S8zdhMeBXH8x6HdV", "targetNamespace": "fZVDAiU6iJOF7JKZ", "thumbnailUrl": "FNk2NKy59X8iOg2s", "useCount": 97}' \
    > test.out 2>&1
eval_tap $? 110 'CreateItem' test.out

#- 111 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'lrJ81lHvv9rqvEoM' \
    --appId '8YmVjAkO3HKsEp6K' \
    > test.out 2>&1
eval_tap $? 111 'GetItemByAppId' test.out

#- 112 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'TnOK7xAvM7tuL81l' \
    --baseAppId 'sR7xxSVp3Gd2TK0H' \
    --categoryPath 'zYviTgYmx82JVBRL' \
    --features 'PZ6Iz8tne5dbguBF' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --limit '67' \
    --offset '100' \
    --region 'svvdl8jHz9x7XZIj' \
    --sortBy 'updatedAt:desc,createdAt' \
    --storeId '0qvxphTLEEBGTtZy' \
    --tags 'TjdKNKgYazujsmSm' \
    --targetNamespace 'ylT1YtxIq73aMb48' \
    > test.out 2>&1
eval_tap $? 112 'QueryItems' test.out

#- 113 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'jISd97KORRhxSWLW,LNfHRD3V15QaGGL4,6LuxJF3sbeqWBdQu' \
    > test.out 2>&1
eval_tap $? 113 'ListBasicItemsByFeatures' test.out

#- 114 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'WfgBAKx27MSBqabU' \
    --itemIds 'XOGkkoMUZn1YXj5z' \
    > test.out 2>&1
eval_tap $? 114 'GetItems' test.out

#- 115 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'FZeOCOR9NvBQZSJP' \
    --sku 'OIKrRBrYVzi9ui3l' \
    > test.out 2>&1
eval_tap $? 115 'GetItemBySku' test.out

#- 116 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'vozTt9TsH7A0TuU2' \
    --populateBundle  \
    --region 'aL4bPkk11sys6Gdk' \
    --storeId 'Dcos5uVJ0BJfZ0jv' \
    --sku 'A54CSqZFDsO1skRj' \
    > test.out 2>&1
eval_tap $? 116 'GetLocaleItemBySku' test.out

#- 117 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'OU1SMfQVQa6blj9R' \
    --region 'dd85bdYUumPKVSZC' \
    --storeId 'g3XTc9vQe0dHJfF6' \
    --itemIds 'KIuvnRCa9JktyBdx' \
    --userId 'kZKrEWFw9GYxjiiO' \
    > test.out 2>&1
eval_tap $? 117 'GetEstimatedPrice' test.out

#- 118 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'QAD77ci0vfWVZoRR' \
    --sku 'MPi57HyKKz5nyI6u' \
    > test.out 2>&1
eval_tap $? 118 'GetItemIdBySku' test.out

#- 119 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'lKNKoXa0dgx1JgjC,56pda3YhtQxpCYME,6x21pdX2QSPAd9sx' \
    --storeId 'oLnWGP1PafIjLX8c' \
    > test.out 2>&1
eval_tap $? 119 'GetBulkItemIdBySkus' test.out

#- 120 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'e0KbNN7Ycl2JfmQp' \
    --region 'lvGjVQ4aebjfgGu4' \
    --storeId '72oWJlfglLM4xjfk' \
    --itemIds 'NL4lU6jaGfsD1cfs' \
    > test.out 2>&1
eval_tap $? 120 'BulkGetLocaleItems' test.out

#- 121 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetAvailablePredicateTypes' test.out

#- 122 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'wmeFpvtDtetoQVFL' \
    --userId '8LNW11vtpaTxi7k4' \
    --body '{"itemIds": ["89jRCn48bvkCPfKo", "fwXOIZZQAJza84lK", "KmVOaTS6xBbNrSUA"]}' \
    > test.out 2>&1
eval_tap $? 122 'ValidateItemPurchaseCondition' test.out

#- 123 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'W2ak7ISDrBVg6NuD' \
    --body '{"changes": [{"itemIdentities": ["ZvPb1kuUfNfUDe4g", "7q6PHEaqbzHvDDl1", "jiLw3XMGBA6JXDpA"], "itemIdentityType": "ITEM_ID", "regionData": {"tIC45C0oaGouFu4h": [{"currencyCode": "XONgUwJnUpryDeRc", "currencyNamespace": "pUvlrw2MwC1uuokp", "currencyType": "REAL", "discountAmount": 92, "discountExpireAt": "1988-11-04T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1975-11-05T00:00:00Z", "discountedPrice": 59, "expireAt": "1998-11-30T00:00:00Z", "price": 98, "purchaseAt": "1979-07-12T00:00:00Z", "trialPrice": 65}, {"currencyCode": "e5n9Lx3QcFo9gxOg", "currencyNamespace": "vDc7xMrRKvw8ISP2", "currencyType": "REAL", "discountAmount": 74, "discountExpireAt": "1996-04-08T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1985-07-31T00:00:00Z", "discountedPrice": 89, "expireAt": "1996-12-17T00:00:00Z", "price": 87, "purchaseAt": "1985-05-15T00:00:00Z", "trialPrice": 49}, {"currencyCode": "xnWR5sheLgsAF4ct", "currencyNamespace": "v5guycGiq9j2EyIk", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1973-08-15T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1995-08-28T00:00:00Z", "discountedPrice": 58, "expireAt": "1979-02-23T00:00:00Z", "price": 52, "purchaseAt": "1988-02-22T00:00:00Z", "trialPrice": 27}], "OKLTDmHe8c1eJ9sd": [{"currencyCode": "e7Ryt4udIv22M18u", "currencyNamespace": "ux9xBomQFPFWy5cw", "currencyType": "REAL", "discountAmount": 85, "discountExpireAt": "1978-10-15T00:00:00Z", "discountPercentage": 49, "discountPurchaseAt": "1971-08-23T00:00:00Z", "discountedPrice": 65, "expireAt": "1978-11-10T00:00:00Z", "price": 9, "purchaseAt": "1995-06-07T00:00:00Z", "trialPrice": 46}, {"currencyCode": "qgfOJDUT0uKAPrAR", "currencyNamespace": "ya2IMlNiXpF4qvsU", "currencyType": "REAL", "discountAmount": 32, "discountExpireAt": "1982-10-02T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1979-03-14T00:00:00Z", "discountedPrice": 5, "expireAt": "1999-12-14T00:00:00Z", "price": 93, "purchaseAt": "1991-01-18T00:00:00Z", "trialPrice": 57}, {"currencyCode": "0lpzcBQMAEcNcJqr", "currencyNamespace": "KxnMzSYoc4ZjiMY4", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1985-06-21T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1982-08-02T00:00:00Z", "discountedPrice": 98, "expireAt": "1997-01-20T00:00:00Z", "price": 19, "purchaseAt": "1975-05-06T00:00:00Z", "trialPrice": 4}], "acYHbrryHB6GO9zP": [{"currencyCode": "3FaepA3b3YJ9nJM6", "currencyNamespace": "vtT27xv85K5MU2qm", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1974-05-14T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1971-07-18T00:00:00Z", "discountedPrice": 8, "expireAt": "1983-04-08T00:00:00Z", "price": 86, "purchaseAt": "1988-12-09T00:00:00Z", "trialPrice": 81}, {"currencyCode": "dPwOtEuWBSO2jJep", "currencyNamespace": "UnEEgja2mIE2kLTn", "currencyType": "REAL", "discountAmount": 47, "discountExpireAt": "1973-01-19T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1978-05-02T00:00:00Z", "discountedPrice": 26, "expireAt": "1974-03-26T00:00:00Z", "price": 58, "purchaseAt": "1977-06-18T00:00:00Z", "trialPrice": 9}, {"currencyCode": "L5W4tKt6G3j9LYdG", "currencyNamespace": "7xVPqBqe9RDQMBSY", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1987-10-27T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1985-05-18T00:00:00Z", "discountedPrice": 10, "expireAt": "1978-08-11T00:00:00Z", "price": 10, "purchaseAt": "1992-08-28T00:00:00Z", "trialPrice": 64}]}}, {"itemIdentities": ["lrQQuAc10DjjwMv4", "vrIPRtvhQIyLarja", "LOKnX51yAB8Pa3uN"], "itemIdentityType": "ITEM_SKU", "regionData": {"KhaLlJzJMSnJIIgs": [{"currencyCode": "AVmaGYxUX1B9oVuz", "currencyNamespace": "G2CnYX2YBF2g7TVt", "currencyType": "VIRTUAL", "discountAmount": 15, "discountExpireAt": "1996-09-01T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1987-12-30T00:00:00Z", "discountedPrice": 96, "expireAt": "1997-04-22T00:00:00Z", "price": 86, "purchaseAt": "1972-02-29T00:00:00Z", "trialPrice": 32}, {"currencyCode": "3iUfBthbepUCTWiZ", "currencyNamespace": "1uqh7GAi4FEIu44u", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1999-12-23T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1978-06-14T00:00:00Z", "discountedPrice": 23, "expireAt": "1993-02-19T00:00:00Z", "price": 34, "purchaseAt": "1976-03-31T00:00:00Z", "trialPrice": 32}, {"currencyCode": "pq03BGdIk4oEogFV", "currencyNamespace": "GR71rJOBy6lsj1AK", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1972-03-23T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1977-06-06T00:00:00Z", "discountedPrice": 68, "expireAt": "1984-04-09T00:00:00Z", "price": 40, "purchaseAt": "1971-07-13T00:00:00Z", "trialPrice": 53}], "3VAl6tXFbnATCzUO": [{"currencyCode": "IzVcy9k3ie64Vnwa", "currencyNamespace": "0ClGQJultJe32Aiw", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1972-03-01T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1978-10-16T00:00:00Z", "discountedPrice": 71, "expireAt": "1992-03-09T00:00:00Z", "price": 26, "purchaseAt": "1990-05-07T00:00:00Z", "trialPrice": 63}, {"currencyCode": "rwPsa9YD92CX0rIT", "currencyNamespace": "ajpwHITGeHTnqRbz", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1985-07-11T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1997-09-15T00:00:00Z", "discountedPrice": 34, "expireAt": "1974-10-25T00:00:00Z", "price": 56, "purchaseAt": "1971-12-20T00:00:00Z", "trialPrice": 25}, {"currencyCode": "Fj1umx4ItzkMJ7cu", "currencyNamespace": "df4r916GPrhn2etV", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1993-10-12T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1992-10-14T00:00:00Z", "discountedPrice": 53, "expireAt": "1989-06-05T00:00:00Z", "price": 61, "purchaseAt": "1998-09-30T00:00:00Z", "trialPrice": 29}], "tx60AehGz1ermJYX": [{"currencyCode": "sYgL7TfyIlAwjTZd", "currencyNamespace": "RZJJzWZwvTX2bamS", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1982-11-08T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1998-04-14T00:00:00Z", "discountedPrice": 12, "expireAt": "1982-09-20T00:00:00Z", "price": 44, "purchaseAt": "1977-06-22T00:00:00Z", "trialPrice": 100}, {"currencyCode": "K9gW596FwBNrFXt3", "currencyNamespace": "TAuKBwBcD12ae6r3", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1988-10-05T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1989-07-20T00:00:00Z", "discountedPrice": 5, "expireAt": "1971-06-12T00:00:00Z", "price": 54, "purchaseAt": "1991-01-29T00:00:00Z", "trialPrice": 32}, {"currencyCode": "xyZVKHA9DkaSOWgt", "currencyNamespace": "g8yw8lHEbVDwBAqa", "currencyType": "REAL", "discountAmount": 68, "discountExpireAt": "1991-04-05T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1998-01-19T00:00:00Z", "discountedPrice": 85, "expireAt": "1993-08-01T00:00:00Z", "price": 71, "purchaseAt": "1975-11-25T00:00:00Z", "trialPrice": 46}]}}, {"itemIdentities": ["jULsx4SnKNXLMUaD", "SwwQlnNRZJHBSB4f", "ZWEFIZs28Ff1kZp1"], "itemIdentityType": "ITEM_ID", "regionData": {"ktx3N7WNMYIfcDKb": [{"currencyCode": "Lu8pnK34oA1keYXJ", "currencyNamespace": "vtggDdXjbdjMBahF", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1987-11-10T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1994-03-04T00:00:00Z", "discountedPrice": 4, "expireAt": "1975-05-16T00:00:00Z", "price": 15, "purchaseAt": "1978-03-23T00:00:00Z", "trialPrice": 36}, {"currencyCode": "fZpfcFBUsnnDJlmD", "currencyNamespace": "1iEokbUiYzCQh2iN", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1981-06-08T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1990-04-26T00:00:00Z", "discountedPrice": 10, "expireAt": "1974-01-25T00:00:00Z", "price": 71, "purchaseAt": "1972-05-28T00:00:00Z", "trialPrice": 80}, {"currencyCode": "vZoBGQbO4S3rURGW", "currencyNamespace": "UzPAE6SdV4D5jftR", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1988-05-23T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1977-07-21T00:00:00Z", "discountedPrice": 41, "expireAt": "1983-12-14T00:00:00Z", "price": 34, "purchaseAt": "1994-12-21T00:00:00Z", "trialPrice": 45}], "zc20O7FdsJP1G9ty": [{"currencyCode": "BTfERXdvgD1Qf7Ot", "currencyNamespace": "2DkUt3yexZBRvxYn", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1980-02-28T00:00:00Z", "discountPercentage": 52, "discountPurchaseAt": "1996-06-01T00:00:00Z", "discountedPrice": 55, "expireAt": "1979-03-23T00:00:00Z", "price": 48, "purchaseAt": "1997-08-19T00:00:00Z", "trialPrice": 24}, {"currencyCode": "d3meTrT7cF9oVCh8", "currencyNamespace": "9wNOkKYssVejcL3k", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1983-08-19T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1987-06-19T00:00:00Z", "discountedPrice": 81, "expireAt": "1998-02-13T00:00:00Z", "price": 60, "purchaseAt": "1971-03-08T00:00:00Z", "trialPrice": 73}, {"currencyCode": "GAYOHR5BWa9VzIka", "currencyNamespace": "QEl1iUProNB6hI6I", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1987-08-25T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1992-04-22T00:00:00Z", "discountedPrice": 100, "expireAt": "1976-02-27T00:00:00Z", "price": 74, "purchaseAt": "1987-06-24T00:00:00Z", "trialPrice": 7}], "u06Q4veujxtyQENv": [{"currencyCode": "JrBCqeg67d4RWOqO", "currencyNamespace": "4U0bitNQLzwRoWnR", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1971-07-02T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1977-08-23T00:00:00Z", "discountedPrice": 86, "expireAt": "1992-06-10T00:00:00Z", "price": 35, "purchaseAt": "1987-10-17T00:00:00Z", "trialPrice": 25}, {"currencyCode": "qerobWMZGVL5KLTx", "currencyNamespace": "ahWlS6XdBaKSLCgO", "currencyType": "REAL", "discountAmount": 86, "discountExpireAt": "1996-10-05T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1992-05-21T00:00:00Z", "discountedPrice": 94, "expireAt": "1982-05-24T00:00:00Z", "price": 15, "purchaseAt": "1989-04-02T00:00:00Z", "trialPrice": 6}, {"currencyCode": "7wYIVw13NCo9yXlb", "currencyNamespace": "Q52FTHTCj6SEAzT7", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1983-09-27T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1974-06-17T00:00:00Z", "discountedPrice": 91, "expireAt": "1982-10-03T00:00:00Z", "price": 44, "purchaseAt": "1993-11-11T00:00:00Z", "trialPrice": 95}]}}]}' \
    > test.out 2>&1
eval_tap $? 123 'BulkUpdateRegionData' test.out

#- 124 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'OPTIONBOX' \
    --limit '25' \
    --offset '66' \
    --sortBy '9Iacq4XRLaA643nT' \
    --storeId 'MtXSAyejnny0Ju13' \
    --keyword 'b6o5uB2XM6IHy7EE' \
    --language 'vHyLmcvrZZOdwe1x' \
    > test.out 2>&1
eval_tap $? 124 'SearchItems' test.out

#- 125 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '73' \
    --offset '90' \
    --sortBy 'displayOrder:asc,name:desc,updatedAt:asc' \
    --storeId 'U6Bi8JXE52sUBBq2' \
    > test.out 2>&1
eval_tap $? 125 'QueryUncategorizedItems' test.out

#- 126 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'SimQQoLbe5YOJvxG' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'RxUzrTwagH7BMT1I' \
    > test.out 2>&1
eval_tap $? 126 'GetItem' test.out

#- 127 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'ZKTdNFVBQ1crBXAu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pATO8uXsqVpdiWo8' \
    --body '{"appId": "SjDAM0Riw8wLYW3n", "appType": "DLC", "baseAppId": "F3LD1EDwBXw5uBYe", "boothName": "QZOzATNSV9E9yyNb", "categoryPath": "7yaLXzAVYymOuhCk", "clazz": "Zu4htrsf8eIFSovT", "displayOrder": 67, "entitlementType": "CONSUMABLE", "ext": {"aMsq8ePN1oco2jx8": {}, "Upe8SjMvpqM8pugg": {}, "OEdG47gD5i2Ni6An": {}}, "features": ["Wn3NdEPhNHSH7eKD", "fRcngEpTnRUQr3RL", "OM1vEx4gqDY6jwyK"], "flexible": true, "images": [{"as": "c1tP5TDuI5f6m4KC", "caption": "07CnsZe32hqEcB1E", "height": 48, "imageUrl": "6aeXZOYwbwjMNdxK", "smallImageUrl": "WlBfnRyFS0Ed7gTM", "width": 53}, {"as": "mFWRJnj8xN7HDPTU", "caption": "EDPN1Kb4UTPWDXTS", "height": 3, "imageUrl": "E4mv12FNXypoOLl1", "smallImageUrl": "3j84P0KqirJ4PkMF", "width": 39}, {"as": "YcYJ4QzXCmqr6gmP", "caption": "GaHP5SVPvRLiDi0m", "height": 81, "imageUrl": "BfBovqLwXBuT30EY", "smallImageUrl": "eRj17xGhaBKoUfiH", "width": 19}], "inventoryConfig": {"customAttributes": {"ZUMRf2VJetWsokvx": {}, "3BHuTEczr9KjQ3tt": {}, "z8MTBt1xk9IyssSA": {}}, "serverCustomAttributes": {"8nP5PQjpzk2Tb7iY": {}, "dmNZWosrsVBPZ64j": {}, "0HUONscofwYLQcDv": {}}, "slotUsed": 21}, "itemIds": ["aAVLDB4k3JwkdaxR", "7GJpYmuYCPG181q9", "GA5DydC2D8UT6KOc"], "itemQty": {"4VPDUR9ayazqXRqe": 12, "OelKykICRxF6HtlE": 90, "BYp6TgCejBd5o7iT": 92}, "itemType": "SUBSCRIPTION", "listable": true, "localizations": {"7R3KbbQGERMNpqWb": {"description": "51y5RUzvMfTkPy0f", "localExt": {"GvTGgfLKsg0b1Bq7": {}, "8cE5O5pmPnbiPJ9j": {}, "4vxmbH3rVaauufxk": {}}, "longDescription": "PHElug48TgfNu0rq", "title": "XUOyToLPIREGIKlJ"}, "t3EP9kKwkENQ8VOH": {"description": "GwbADMfuOmh0lciR", "localExt": {"hVZ2DeoODXMzLSrz": {}, "oiBnYi5UWs3tYlYe": {}, "MoCimJySocRvUWDO": {}}, "longDescription": "rFZKPNoN9AWtLK9T", "title": "Fgi9j2XMh9Wpifqj"}, "NjLOtNQts2yxf6ML": {"description": "ZJ2jZfZbpTJezzri", "localExt": {"CDWXT59SRu0YqUxK": {}, "Dc84OMIzvTScdbKB": {}, "sAyJMz4ILNDvhB4E": {}}, "longDescription": "oes9a6XaJeRbzTPw", "title": "D3jxF7vxRUY0ilrN"}}, "lootBoxConfig": {"rewardCount": 29, "rewards": [{"lootBoxItems": [{"count": 35, "duration": 65, "endDate": "1988-01-08T00:00:00Z", "itemId": "98SgtJd4Z5f8nfaK", "itemSku": "qdZFLbZEHxsDxeR6", "itemType": "d7r1SQw80JfMpPrS"}, {"count": 34, "duration": 35, "endDate": "1997-09-26T00:00:00Z", "itemId": "ypRUnq5o4ETeCUYG", "itemSku": "9ccTt7Wxw8OQ13t3", "itemType": "uTw6zQuoZcXQpoTO"}, {"count": 47, "duration": 67, "endDate": "1973-10-31T00:00:00Z", "itemId": "y1jorNsg9ZKYCKoI", "itemSku": "SyXtHzoWGdYohxMp", "itemType": "3uOQIybqWfG9BJ6F"}], "name": "VKlbYHtbPtaxvagS", "odds": 0.17987864536934117, "type": "PROBABILITY_GROUP", "weight": 65}, {"lootBoxItems": [{"count": 67, "duration": 61, "endDate": "1974-01-06T00:00:00Z", "itemId": "VTF6VeDAPOGBwwey", "itemSku": "FfXEOEAEtbag82Kg", "itemType": "BgyCd5vjkfz3eR4D"}, {"count": 40, "duration": 11, "endDate": "1991-05-01T00:00:00Z", "itemId": "cIoByk9fxtvsgeAx", "itemSku": "o57nKAbZpsbJ4Iu5", "itemType": "KJ0ynxGBlacDCdFe"}, {"count": 8, "duration": 53, "endDate": "1984-07-14T00:00:00Z", "itemId": "UqVxcSthrpnMUBsn", "itemSku": "UfuQIcSbUt5UGkIn", "itemType": "FGpuUsdtq4dOwNES"}], "name": "zCEW9dUVhZjLftC3", "odds": 0.2941680039167943, "type": "REWARD", "weight": 91}, {"lootBoxItems": [{"count": 21, "duration": 71, "endDate": "1985-05-02T00:00:00Z", "itemId": "pLCqPD9CeDEdCnnL", "itemSku": "6Kt1Bjj3b8QM8Rr4", "itemType": "5ULqXQgvwD3PsKDJ"}, {"count": 18, "duration": 99, "endDate": "1989-07-10T00:00:00Z", "itemId": "Oe2Ntz7EFvowPgIG", "itemSku": "uetxFMqXCQMAqQ2Z", "itemType": "RGzNtrThFa9XU8mo"}, {"count": 38, "duration": 79, "endDate": "1977-11-13T00:00:00Z", "itemId": "uiHZJ7O8sAQ32wj9", "itemSku": "uaDzsr9xYiWRuuzQ", "itemType": "JiLc1eI9w3JEhxPG"}], "name": "bEk7s7gw07FlounC", "odds": 0.8948819657751369, "type": "REWARD", "weight": 8}], "rollFunction": "DEFAULT"}, "maxCount": 57, "maxCountPerUser": 35, "name": "C7SwgoViPeIB4Ehy", "optionBoxConfig": {"boxItems": [{"count": 1, "duration": 24, "endDate": "1988-01-03T00:00:00Z", "itemId": "RZHzsIYOCUoiCXNj", "itemSku": "rdQL2jdx1eIba1sB", "itemType": "0HsJ06DzfbzRYt4O"}, {"count": 97, "duration": 96, "endDate": "1983-07-21T00:00:00Z", "itemId": "aossQmjo69wohJFy", "itemSku": "TNk5FGUPhR4LEZvz", "itemType": "3EjFR7996Ug5m4ax"}, {"count": 61, "duration": 61, "endDate": "1995-11-23T00:00:00Z", "itemId": "uTcYsoahUrELQ1bt", "itemSku": "jJOqQMgZWAU6E92n", "itemType": "HJzvw7tnYtGfv0EJ"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 20, "fixedTrialCycles": 82, "graceDays": 55}, "regionData": {"tIxzPqb6n73m0jia": [{"currencyCode": "DH86d9rsKgzCsMul", "currencyNamespace": "pB8HZUtVVaJCiLgK", "currencyType": "VIRTUAL", "discountAmount": 46, "discountExpireAt": "1999-05-23T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1994-01-26T00:00:00Z", "expireAt": "1973-04-15T00:00:00Z", "price": 99, "purchaseAt": "1996-02-28T00:00:00Z", "trialPrice": 93}, {"currencyCode": "saabP4xRowfNojzP", "currencyNamespace": "XI2v0prR3OEey0Mk", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1994-09-10T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1988-06-11T00:00:00Z", "expireAt": "1982-06-28T00:00:00Z", "price": 81, "purchaseAt": "1998-11-16T00:00:00Z", "trialPrice": 80}, {"currencyCode": "3UYhic03qGEg5fNz", "currencyNamespace": "BVrjo3g8CfRwtyl1", "currencyType": "REAL", "discountAmount": 1, "discountExpireAt": "1994-03-15T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1978-09-11T00:00:00Z", "expireAt": "1981-12-11T00:00:00Z", "price": 30, "purchaseAt": "1974-10-27T00:00:00Z", "trialPrice": 66}], "WE4EW0sw8v5peiux": [{"currencyCode": "oBJATauyD3XCXVMi", "currencyNamespace": "yEvMf9yilUEujk6o", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1997-04-20T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1998-04-05T00:00:00Z", "expireAt": "1988-09-06T00:00:00Z", "price": 87, "purchaseAt": "1990-07-26T00:00:00Z", "trialPrice": 93}, {"currencyCode": "icbuL2S3RiW8dLTC", "currencyNamespace": "BfGUdVEdvdQL7sVw", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1997-06-26T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1992-06-16T00:00:00Z", "expireAt": "1978-02-14T00:00:00Z", "price": 51, "purchaseAt": "1971-04-02T00:00:00Z", "trialPrice": 73}, {"currencyCode": "H4RpfmjIXFGZ5PKd", "currencyNamespace": "babJIkNnt9P1Tkm0", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1998-06-13T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1974-05-23T00:00:00Z", "expireAt": "1972-05-11T00:00:00Z", "price": 66, "purchaseAt": "1992-05-15T00:00:00Z", "trialPrice": 89}], "F0NHglOVuNZ9LzNe": [{"currencyCode": "JnBurh54CWbYb0Pe", "currencyNamespace": "byt8b4DGscjwrizs", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1999-02-16T00:00:00Z", "discountPercentage": 95, "discountPurchaseAt": "1997-08-05T00:00:00Z", "expireAt": "1982-09-23T00:00:00Z", "price": 3, "purchaseAt": "1983-01-03T00:00:00Z", "trialPrice": 69}, {"currencyCode": "LvqvQ2NbmDITuymT", "currencyNamespace": "Bjn3d2sFzMS3QaVj", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1984-02-02T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1973-10-01T00:00:00Z", "expireAt": "1998-01-26T00:00:00Z", "price": 45, "purchaseAt": "1978-10-28T00:00:00Z", "trialPrice": 15}, {"currencyCode": "g9U8vrQJXQxoIbVi", "currencyNamespace": "2CLEk277Ivjj1A64", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1992-07-23T00:00:00Z", "discountPercentage": 90, "discountPurchaseAt": "1976-10-17T00:00:00Z", "expireAt": "1977-12-31T00:00:00Z", "price": 76, "purchaseAt": "1984-11-10T00:00:00Z", "trialPrice": 10}]}, "saleConfig": {"currencyCode": "avu4Ul2IaieEbPSE", "price": 18}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "eHsYsW9oGBN1pYMB", "stackable": true, "status": "ACTIVE", "tags": ["F35anDGvur19V18o", "IrUKXttgAI2QdWJF", "hJrASBh61hmWKSSr"], "targetCurrencyCode": "LmoPEgd8EMspOs8n", "targetNamespace": "kic9gj5vyUMAAmIH", "thumbnailUrl": "YbsxG5N066FXb88S", "useCount": 3}' \
    > test.out 2>&1
eval_tap $? 127 'UpdateItem' test.out

#- 128 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'w94oa8UJ34TIedV3' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'HyoX4VnO2LpBU08w' \
    > test.out 2>&1
eval_tap $? 128 'DeleteItem' test.out

#- 129 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'fnlHBXFIqFUmgUSM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 80, "orderNo": "Xxj7Esrg7900nml5"}' \
    > test.out 2>&1
eval_tap $? 129 'AcquireItem' test.out

#- 130 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'BidsK9dCEzhVnOv0' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'PQbVIaKiHfoeorY7' \
    > test.out 2>&1
eval_tap $? 130 'GetApp' test.out

#- 131 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'A1otGFyv2SMjbEr5' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0qGdCZIc6EFqBKxb' \
    --body '{"carousel": [{"alt": "S7Q2OgRucL1jwRXz", "previewUrl": "fjDZZBmOau6syme0", "thumbnailUrl": "6c6SKLc2mEC3IXl5", "type": "image", "url": "CbkOfHaGr5kdazly", "videoSource": "vimeo"}, {"alt": "MB6jzrpRGESmooHi", "previewUrl": "CV4GUOnXpapXQGRa", "thumbnailUrl": "kUbcG7PcR4eiU3Id", "type": "image", "url": "caRMEb15LBlTVufc", "videoSource": "youtube"}, {"alt": "yODR2NVyn4PRqf3e", "previewUrl": "RbZqBAoKGcVCdMiS", "thumbnailUrl": "NV4qBrt1kcLmRv6E", "type": "video", "url": "tl5xWnsb8oWq94RI", "videoSource": "generic"}], "developer": "BOE4qMcH1Kyi8ZFv", "forumUrl": "GcV8DY0XOkDstxZc", "genres": ["Simulation", "Sports", "Adventure"], "localizations": {"j7Yi2VvoQNW8Yc48": {"announcement": "1dYdvGxJAMDRA1LF", "slogan": "7jdWlekFwO94VBCV"}, "9qJhWva2FPBujX0g": {"announcement": "eYCpGJM4sqsPNJMi", "slogan": "ZXXOFwmGWAvNF0Z0"}, "GkwxUNYyNwGiKrkn": {"announcement": "H0Y5mrQgLC6D2qsF", "slogan": "iQHglUQMZi5WjMZf"}}, "platformRequirements": {"OadpgegCUjTdi1Eh": [{"additionals": "r8OtqpNJ9R8TuNy4", "directXVersion": "ejmVA3vMCsGyPd12", "diskSpace": "B8QNUz0hFFNbH6j2", "graphics": "W4roZM2UKAXEEsL5", "label": "D0oiFchQnVeq3g2A", "osVersion": "B2WIRUQmauIY5HXC", "processor": "Z0W4XmWP0HzSdiyl", "ram": "LhVYszm8xY33OQbu", "soundCard": "mu2QHLyZNuysyM4O"}, {"additionals": "fCzdQCXMAWnf87YP", "directXVersion": "NOe9Eevf1fhMg1E2", "diskSpace": "k7QLFrVgtX7y0fPO", "graphics": "ieDCow2zXyFFVpM8", "label": "7yqEwEacQMTlqN4L", "osVersion": "KkxJ5v3SBafnKNiM", "processor": "PbFkFGA85W3HJkqg", "ram": "S2B37wwoPYOHiIsx", "soundCard": "msLBPBJuNLnWRrtW"}, {"additionals": "870qD88ZcduZSe7W", "directXVersion": "20UZcDaiq0nEZ7Py", "diskSpace": "hqFJkDClOsKmfsgJ", "graphics": "dmzsDPsWh1k0cQ08", "label": "NG6dX2TZkil67kRn", "osVersion": "goUa83ECh1gqPeS1", "processor": "93TNNzot3sVli3GN", "ram": "2XTrFibRAhzzEWzW", "soundCard": "lTY70qdgJRvpZrSp"}], "WX3KEe2BjV00ReCX": [{"additionals": "FffjJJxlgjzIhpgO", "directXVersion": "oIOD74V21HWDAfvX", "diskSpace": "wdxbyp4HAPbBbNPS", "graphics": "tVBUpKgOssFkz0F3", "label": "6piDYXeHZ7FHls3n", "osVersion": "yvconqbHQqKLQKe3", "processor": "xmj6s0GqsWncp5Lr", "ram": "qbiKudv9z75SzoCV", "soundCard": "8ZMi2o1nR482D6gN"}, {"additionals": "Clk9c87hosaPFC5z", "directXVersion": "BW3ZgVZCj9ObVGT0", "diskSpace": "Scwl4kNmCi15XTJT", "graphics": "gCNNH7RtG5Xmo9Q0", "label": "Wb07N17fkxZSc6Vb", "osVersion": "E0AGcekjMNHuPXtz", "processor": "8tXxrmzafMUguyDo", "ram": "N91uc28HoSpGt1g0", "soundCard": "GGbT4Hf2PPKOldkb"}, {"additionals": "gX9CWJKwXXSbv5eg", "directXVersion": "9q86IaDFjjx6uZer", "diskSpace": "WbtwTX9gNRByjbE8", "graphics": "lOLAfTXKLzbrddqc", "label": "KLa7LevxNHOSEhQR", "osVersion": "ZIp693lRwtc43atC", "processor": "uCFxbfbz4aQERziP", "ram": "L4dHhOqG5KDdUvk0", "soundCard": "LEi26Ls7mjRxNmvv"}], "NtjJNQepUTGhwlY4": [{"additionals": "lPzlsCR5rVsyfcH7", "directXVersion": "WjP7HuGz3b5WAEvd", "diskSpace": "RF9bqMj4ro5B19VE", "graphics": "838c7OydVw0zCqoM", "label": "ZvpIOO97DmQ5ZOzx", "osVersion": "6iCJTu60IifzMhkk", "processor": "5PxsjqbCKpMv2Yky", "ram": "9DYkD2sIllFtBtXJ", "soundCard": "KG3rqBmILhtWm8RQ"}, {"additionals": "vRUbUDSiefGEdLuc", "directXVersion": "rtO2gCQD057DrDlg", "diskSpace": "C2nzS9SiGUjVAw4v", "graphics": "3q6JRHcn7KaoCEkR", "label": "do6qHYIZWnXqQ1oH", "osVersion": "FJ9Q0vqsL9SomqWs", "processor": "GA76yxi0QzZWfmP2", "ram": "sx0KO5bEJaPnAFjs", "soundCard": "odyJQVVBrShGbIIu"}, {"additionals": "qK8C403HgoXCR6XO", "directXVersion": "MXwKdfqk8T4QHK30", "diskSpace": "EX0FclpDl5Hsurac", "graphics": "O5MnjnxD1OXkxShF", "label": "VQTRekLfjmy8zosR", "osVersion": "CRgVwbrQKmb01yA7", "processor": "U7dGMjupZkZQY8CN", "ram": "yT4k3DIbfT22G5Np", "soundCard": "E130YWSgxpKWtdtd"}]}, "platforms": ["Linux", "Android", "Android"], "players": ["Coop", "CrossPlatformMulti", "CrossPlatformMulti"], "primaryGenre": "Racing", "publisher": "1J5euLAbBgejqc0a", "releaseDate": "1978-02-20T00:00:00Z", "websiteUrl": "xqZ209BySn8aUaGl"}' \
    > test.out 2>&1
eval_tap $? 131 'UpdateApp' test.out

#- 132 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'AyvIslt7N1qcxKs4' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nlf1MfqUZXkjHvcU' \
    > test.out 2>&1
eval_tap $? 132 'DisableItem' test.out

#- 133 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'OTlxNf09pefgFIiJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 133 'GetItemDynamicData' test.out

#- 134 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'ssShBKsQjXvfQgQD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 't6ce8NDMErA82FrR' \
    > test.out 2>&1
eval_tap $? 134 'EnableItem' test.out

#- 135 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature '1GSogkewIzTOqKkc' \
    --itemId 'jRh3l2gAJOTCbx7J' \
    --namespace "$AB_NAMESPACE" \
    --storeId '3gNLIlTk3Bpclrk4' \
    > test.out 2>&1
eval_tap $? 135 'FeatureItem' test.out

#- 136 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'hIRn0znIKzAEAHQp' \
    --itemId 'BOgHEP5l94s7CbIJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId '7eHnVWOboMkyB7FT' \
    > test.out 2>&1
eval_tap $? 136 'DefeatureItem' test.out

#- 137 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'exsOZ0b2p3b63Krc' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'wIcXMhGy83Xit6bo' \
    --populateBundle  \
    --region 'OLGCcg16DqwdQPQ9' \
    --storeId 'HkSSV8e1MgTTLS2F' \
    > test.out 2>&1
eval_tap $? 137 'GetLocaleItem' test.out

#- 138 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'garY903INGIyEfRB' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Ej7qms9AGQExPhgr' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 12, "code": "NisecYbcOpR45VDl", "comparison": "isLessThan", "name": "pqn47GVghTH2wToO", "predicateType": "SeasonPassPredicate", "value": "bNs97KvKyj3MqS7D", "values": ["1La16Bw3JbUnUDh5", "cmtfh50eObbrmgjh", "WK0x0ZidAJ1CU1eD"]}, {"anyOf": 49, "code": "YldcTpdeCD9XPRi4", "comparison": "excludes", "name": "6Z7rb21A2E9pX0BW", "predicateType": "StatisticCodePredicate", "value": "dzA8bvXlDhG7Bror", "values": ["9CDA8Ij5bGKSuopW", "QbaCvdPSq8Z27Gpv", "bKIKuOXJPm5ztrr0"]}, {"anyOf": 68, "code": "gUxAogcnGkXk17QP", "comparison": "is", "name": "lPspQD9IRIpDDubn", "predicateType": "SeasonTierPredicate", "value": "l8G2uf6E8EajXLSA", "values": ["S8MKMaxQ1QyJCpKe", "qI2M5PmXfKnQ7BYG", "dhuzI7G9NCKKXu1b"]}]}, {"operator": "and", "predicates": [{"anyOf": 21, "code": "CUDMOrbmoRvWnfmG", "comparison": "includes", "name": "y0eUoOBd90h9EDqS", "predicateType": "SeasonPassPredicate", "value": "OfoNewWjwMWDKEt6", "values": ["xpmEuwDVc12r0DVU", "MwhWPtndriXU9loO", "JhbJ0fwTDaq6b5Rp"]}, {"anyOf": 66, "code": "qSZdZ5C8mFI9Tnvz", "comparison": "isNot", "name": "CBuzUUwyI6Vtd4v9", "predicateType": "SeasonPassPredicate", "value": "eMc9fBoU3RHNDFjL", "values": ["ELgBe6dboSdhkBzA", "QeIQF51c4MqJzDSv", "KFrepy56eW1kmb15"]}, {"anyOf": 53, "code": "q6eY4PBNHKPx62tH", "comparison": "isLessThanOrEqual", "name": "tgXucx85vHA009FA", "predicateType": "EntitlementPredicate", "value": "vF2uLXWilRD7HD6L", "values": ["kfTMRrXVRcAVRDX6", "CgdFxRGj00RT6Lvc", "nGMJbJIYLssMvy9g"]}]}, {"operator": "and", "predicates": [{"anyOf": 26, "code": "r8eToFmkHJ6BPOKF", "comparison": "isNot", "name": "xIwKssw647YwDudn", "predicateType": "SeasonTierPredicate", "value": "ufOUGfMjTU226l07", "values": ["I9Y28qVceS9UX48d", "KPCFUIeyYEymNXzN", "jPlcYaqYM7YfBmhj"]}, {"anyOf": 39, "code": "6TGh4UdEweeBsJEv", "comparison": "isNot", "name": "6gtn5pUARJM1T8Qw", "predicateType": "SeasonTierPredicate", "value": "NOAzXmyHEV4g9P6a", "values": ["280S5RNB5dVCsB7x", "DixZwVtt3RVTl0tR", "L4axSPgPCiwLxCFL"]}, {"anyOf": 57, "code": "0oQgcHdGGK3x76U1", "comparison": "isNot", "name": "tWwF7RnP1oK3c4RV", "predicateType": "EntitlementPredicate", "value": "sMY8es36r1FgR70e", "values": ["CAIfNBSHgpFNw9K9", "NLHkVrEFd8xArWJu", "pmAIc6VSfE9nbE2P"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateItemPurchaseCondition' test.out

#- 139 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'Mv12ZSRJkujxbCu1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "HFaj6Vxs3GuA4S1d"}' \
    > test.out 2>&1
eval_tap $? 139 'ReturnItem' test.out

#- 140 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --name 'nfmBerp84qjwzWpC' \
    --offset '65' \
    --tag 'g7Dc5APzfzXDELJF' \
    > test.out 2>&1
eval_tap $? 140 'QueryKeyGroups' test.out

#- 141 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "aIaEMW5bhJyL72WD", "name": "yhBsCCbnfihnXKxG", "status": "INACTIVE", "tags": ["1RJTTy9JrNz1K5M1", "qgFddYvifGHawNx6", "yhniEHLbEQKc0aUv"]}' \
    > test.out 2>&1
eval_tap $? 141 'CreateKeyGroup' test.out

#- 142 GetKeyGroupByBoothName
eval_tap 0 142 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 143 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'rKXDIjYC4df9qswS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 143 'GetKeyGroup' test.out

#- 144 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'lpCI8DhjlxUyrs3O' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "SesE5p0DwUj2HKUv", "name": "PYUcQBxMSdOOsn2N", "status": "ACTIVE", "tags": ["8so6JSaZAIadKDEZ", "ywonA2SrEdN2tmGu", "X6r0gBVUUeKKlPKt"]}' \
    > test.out 2>&1
eval_tap $? 144 'UpdateKeyGroup' test.out

#- 145 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'E6gnYxmkmCWbs5qu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetKeyGroupDynamic' test.out

#- 146 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'gklBUS6uwWrCQt86' \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '4' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 146 'ListKeys' test.out

#- 147 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'PWAShIhieSKUf3zK' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 147 'UploadKeys' test.out

#- 148 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'byQk2vQTYX1xsth2' \
    --limit '80' \
    --offset '76' \
    --orderNos 'ZZgsXycuQNGIDeHl,f6IcX1K9JrK6Or2x,x7rLwrPoWiywnxuD' \
    --sortBy 'LLuIaSxoloIH1gBC' \
    --startTime 'WVFrvls0ZwosKhDl' \
    --status 'REFUNDING' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 148 'QueryOrders' test.out

#- 149 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetOrderStatistics' test.out

#- 150 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'TNiP8KgEAj3dbRTI' \
    > test.out 2>&1
eval_tap $? 150 'GetOrder' test.out

#- 151 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0i6dO3zkbDseh4tJ' \
    --body '{"description": "doGcwMBmegqVUaWM"}' \
    > test.out 2>&1
eval_tap $? 151 'RefundOrder' test.out

#- 152 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 152 'GetPaymentCallbackConfig' test.out

#- 153 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "BjrV0p9A7tcHrV0M", "privateKey": "bJGr4drgkDuWS05m"}' \
    > test.out 2>&1
eval_tap $? 153 'UpdatePaymentCallbackConfig' test.out

#- 154 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'GetPaymentMerchantConfig' test.out

#- 155 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["0pGzazM2BUXnzUEW", "TiKMJAf6AgbiEDMf", "CckWogE5gcfF8AMG"]}' \
    > test.out 2>&1
eval_tap $? 155 'UpdatePaymentDomainWhitelistConfig' test.out

#- 156 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Z2FBS93Mg6TKwdRM' \
    --externalId 'raDLrwh3d0ykRGkg' \
    --limit '33' \
    --notificationSource 'ADYEN' \
    --notificationType 'UNIbJMJ9ABbKVWO2' \
    --offset '19' \
    --paymentOrderNo 'EDiqkwKbpdk7wlDn' \
    --startDate 'gNiPPjpSAlZwFGpe' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 156 'QueryPaymentNotifications' test.out

#- 157 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId '5ObBB49Km4ClIQmk' \
    --limit '70' \
    --offset '78' \
    --status 'AUTHORISED' \
    > test.out 2>&1
eval_tap $? 157 'QueryPaymentOrders' test.out

#- 158 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "TfaSot7aohFYy4Vx", "currencyNamespace": "wHIJ9gzxqAw4vBGQ", "customParameters": {"Aeh0VTiTP4PSrXUS": {}, "6jYI9lsQFD43Df5q": {}, "UZOFzpFd6b5Jc5TE": {}}, "description": "THcup8GG0VCMTFJ6", "extOrderNo": "svTyo9RHget5hzB5", "extUserId": "2BDFopxUwkMuSqQn", "itemType": "SEASON", "language": "aY_keCb-125", "metadata": {"gKjCxZjKf8NA4cGU": "aDfy9XnH2r0EKrk5", "VlnKsWCPccAFn5CE": "PoH6opK5DSO8JyX4", "IE1z3rDwZ1HKsOpy": "q8agQuz86nc6jLF9"}, "notifyUrl": "DIW2ncJJKpqmgvUT", "omitNotification": true, "platform": "Bhl0L5FCbOn46W2B", "price": 17, "recurringPaymentOrderNo": "uPQLrt2t6bVpCgKv", "region": "PXSDufmKh783cV54", "returnUrl": "JsVBRB0rY0xfWddA", "sandbox": true, "sku": "8zBJX0rkOHUkY5aS", "subscriptionId": "lqhYoSXbn6l5xAzc", "targetNamespace": "1nc3eFm950dtVAo7", "targetUserId": "w4e3v5mh6Rum5pbg", "title": "Et39uJQpgEtchTe3"}' \
    > test.out 2>&1
eval_tap $? 158 'CreatePaymentOrderByDedicated' test.out

#- 159 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'nt7t9ztprSfW9Out' \
    > test.out 2>&1
eval_tap $? 159 'ListExtOrderNoByExtTxId' test.out

#- 160 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ADrNGBWSJ1zQKxVm' \
    > test.out 2>&1
eval_tap $? 160 'GetPaymentOrder' test.out

#- 161 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RTawjiZPMoZZcyGE' \
    --body '{"extTxId": "HxAKDQher3usApPd", "paymentMethod": "JPn9eIdhIBvTTupA", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 161 'ChargePaymentOrder' test.out

#- 162 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cVk0X28GS54vl7gI' \
    --body '{"description": "KBc7OYTylFRAJKyS"}' \
    > test.out 2>&1
eval_tap $? 162 'RefundPaymentOrderByDedicated' test.out

#- 163 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nC0cfPl3Z2zSBbs4' \
    --body '{"amount": 85, "currencyCode": "Y5YI0jeO2zMDSy4k", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 50, "vat": 95}' \
    > test.out 2>&1
eval_tap $? 163 'SimulatePaymentOrderNotification' test.out

#- 164 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KgrtEPdXXlt8geCd' \
    > test.out 2>&1
eval_tap $? 164 'GetPaymentOrderChargeStatus' test.out

#- 165 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'iXu3iNvn7vLZ7h6a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "lhJNGZF07lsPP5Of", "serviceLabel": 70}' \
    > test.out 2>&1
eval_tap $? 165 'GetPsnEntitlementOwnership' test.out

#- 166 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'mAj6IKSYFdJwgZsR' \
    --body '{"delegationToken": "POzwuDSdGl1A2vaN", "sandboxId": "eDiSqTfmAVg50kOd"}' \
    > test.out 2>&1
eval_tap $? 166 'GetXboxEntitlementOwnership' test.out

#- 167 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 167 'GetPlatformEntitlementConfig' test.out

#- 168 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedPlatformOrigins": ["IOS", "Steam", "Oculus"]}' \
    > test.out 2>&1
eval_tap $? 168 'UpdatePlatformEntitlementConfig' test.out

#- 169 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 169 'GetPlatformWalletConfig' test.out

#- 170 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    --body '{"allowedBalanceOrigins": ["Playstation", "Other", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 170 'UpdatePlatformWalletConfig' test.out

#- 171 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 171 'ResetPlatformWalletConfig' test.out

#- 172 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 172 'GetRevocationConfig' test.out

#- 173 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 173 'UpdateRevocationConfig' test.out

#- 174 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 174 'DeleteRevocationConfig' test.out

#- 175 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'URTNIoG1DBdoKH6s' \
    --limit '89' \
    --offset '63' \
    --source 'IAP' \
    --startTime 'mmfwUZLZZS7snx0Q' \
    --status 'FAIL' \
    --transactionId 'Thz4bm41oIcV33yj' \
    --userId 'PxibDjfF7JkjCVpZ' \
    > test.out 2>&1
eval_tap $? 175 'QueryRevocationHistories' test.out

#- 176 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'GetRevocationPluginConfig' test.out

#- 177 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "KMxkFkBtXMU6KRIm"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "TVxEgBFzG8tlkxWK"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 177 'UpdateRevocationPluginConfig' test.out

#- 178 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'DeleteRevocationPluginConfig' test.out

#- 179 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 179 'UploadRevocationPluginConfigCert' test.out

#- 180 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "h780ktjQw2yXzaQW", "eventTopic": "aF2PqUfbpMpRl6xR", "maxAwarded": 51, "maxAwardedPerUser": 90, "namespaceExpression": "V19cborUHeCpqnZ5", "rewardCode": "NW623WWn2ZJY3QvR", "rewardConditions": [{"condition": "a7CDRTcsAHzD3dZy", "conditionName": "yWbUQpbcv3IwmL7a", "eventName": "1K3zIUYJmdF1YtWN", "rewardItems": [{"duration": 92, "endDate": "1993-09-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "YH4ijqOVM50tCqkZ", "quantity": 11, "sku": "lTHcmgXsrVj3Mjml"}, {"duration": 25, "endDate": "1985-09-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "osOXglQwwdeLVpmX", "quantity": 34, "sku": "YyNrXweiCnDldRPR"}, {"duration": 11, "endDate": "1992-01-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "mLZ0GTJwEjoZrRta", "quantity": 9, "sku": "npKwhpZVdw5UMa8y"}]}, {"condition": "mxtEFLwELCY2vIdd", "conditionName": "lxnA1VynioJcAPwV", "eventName": "HUGcs1ACMvoY4jWH", "rewardItems": [{"duration": 21, "endDate": "1972-05-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "6XTqHc0cM7ixq8Tj", "quantity": 27, "sku": "ONQ2vCbMn0Oia336"}, {"duration": 43, "endDate": "1975-03-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "viBEWpbusO6EyVqs", "quantity": 40, "sku": "Redh1SiZlOpIQ8GL"}, {"duration": 19, "endDate": "1997-08-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "F1R5OexAPzCG6ZKQ", "quantity": 58, "sku": "cTwEtnHxP5pVtN4j"}]}, {"condition": "NVIdruEA39uCJzsE", "conditionName": "8WObt6t0w8LOBxE1", "eventName": "5JYj4IqWK09l4wkr", "rewardItems": [{"duration": 52, "endDate": "1994-01-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "hXR1sDEDVKDINE3H", "quantity": 18, "sku": "cr16lW5YwgZpjlMM"}, {"duration": 39, "endDate": "1978-12-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "g8217m7qNkQiKp2o", "quantity": 1, "sku": "31d8eOdtrfq6ECDD"}, {"duration": 79, "endDate": "1991-09-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "kuLs9gNpNon6DKW9", "quantity": 54, "sku": "kDP6d3nuUZ41mSeS"}]}], "userIdExpression": "9SnGqhJOvykBcDpz"}' \
    > test.out 2>&1
eval_tap $? 180 'CreateReward' test.out

#- 181 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'D9zh6dtPK4fVHLMv' \
    --limit '36' \
    --offset '83' \
    --sortBy 'rewardCode,rewardCode:asc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 181 'QueryRewards' test.out

#- 182 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'ExportRewards' test.out

#- 183 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 183 'ImportRewards' test.out

#- 184 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'jrfqJcyxT2a7fCFA' \
    > test.out 2>&1
eval_tap $? 184 'GetReward' test.out

#- 185 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'UzLELiM573TdtWjf' \
    --body '{"description": "VciuLnLsBKGsALPu", "eventTopic": "COyphUUAV95708za", "maxAwarded": 85, "maxAwardedPerUser": 52, "namespaceExpression": "0wpZgQEvFzox9wHo", "rewardCode": "cX3DRWobEoGr8W97", "rewardConditions": [{"condition": "KBedcr6PM51z7i0w", "conditionName": "Q9egK2t46EG8I2lT", "eventName": "viKbOgVuN3nhkn6Q", "rewardItems": [{"duration": 71, "endDate": "1973-03-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "4P2AGeidXRRnIAJf", "quantity": 74, "sku": "pOjqwgKvfXXs8pDq"}, {"duration": 25, "endDate": "1990-07-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Bt5hDs45siG30Lv9", "quantity": 17, "sku": "sFK7eYlSU3vYcHZZ"}, {"duration": 20, "endDate": "1983-09-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "pBo2JYkwLdmR97u9", "quantity": 78, "sku": "fcqNEn4IZ0Dv6b8W"}]}, {"condition": "taMVvLbG04KKnh3j", "conditionName": "vW0Qp3kTyL4CsLwi", "eventName": "WUMcpxn4B6XoTNMu", "rewardItems": [{"duration": 33, "endDate": "1994-07-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Hwo1IAJQpb6r8Zea", "quantity": 91, "sku": "nT24wh59RGSbBMh7"}, {"duration": 19, "endDate": "1978-05-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "gYZyF9fJBJkSOrF9", "quantity": 60, "sku": "yJfThvCJieqRSGN8"}, {"duration": 79, "endDate": "1982-04-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "74HlSZzp4aEW4GkH", "quantity": 67, "sku": "uvig8sMuss76ezTr"}]}, {"condition": "sDZNYUV48Oh6I45X", "conditionName": "7HvUtPYONZdFk75l", "eventName": "kjQNHrjaboGomguU", "rewardItems": [{"duration": 33, "endDate": "1990-02-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "qxd6PWz7sVnMxge2", "quantity": 18, "sku": "vZgN5hshSe5YmZXK"}, {"duration": 62, "endDate": "1993-01-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "o7cTS9OIIMErnNTL", "quantity": 33, "sku": "HrsOFsbhRow4iaYK"}, {"duration": 50, "endDate": "1983-11-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "jsDgbJ37DN2lDvdh", "quantity": 9, "sku": "okHl1wMht2Izq7TC"}]}], "userIdExpression": "UJhDsDefAS09VyQB"}' \
    > test.out 2>&1
eval_tap $? 185 'UpdateReward' test.out

#- 186 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '1vR1mx6K17GL1CrO' \
    > test.out 2>&1
eval_tap $? 186 'DeleteReward' test.out

#- 187 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4ZuoGZSxTzm8oMSP' \
    --body '{"payload": {"IHPtqzIWIzg8pbjn": {}, "t1iBV8DpbjGts4UZ": {}, "DTfhAyZKhqilty9N": {}}}' \
    > test.out 2>&1
eval_tap $? 187 'CheckEventCondition' test.out

#- 188 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'VlgxUmnfdOAmu1dX' \
    --body '{"conditionName": "1NqD20RUvvYeJZw6", "userId": "QZFN7wFCnqpvNesG"}' \
    > test.out 2>&1
eval_tap $? 188 'DeleteRewardConditionRecord' test.out

#- 189 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'iVnt9p2to7Yja1so' \
    --limit '61' \
    --offset '16' \
    --start 'E1K0SvGrMYwPmPXC' \
    --storeId '2LfL2m5rP2A20t6f' \
    --viewId 'oPPH94SUinY5diUl' \
    > test.out 2>&1
eval_tap $? 189 'QuerySections' test.out

#- 190 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qgvY7dPPyahppgxJ' \
    --body '{"active": false, "displayOrder": 81, "endDate": "1976-11-09T00:00:00Z", "ext": {"4EdTZ000rS92594H": {}, "LvWFsXHtMP0k9L5d": {}, "REQbCqfh0gpABFBE": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 100, "itemCount": 31, "rule": "SEQUENCE"}, "items": [{"id": "cDOsRzBkf9A6HjCn", "sku": "FRdSihcvszzQLZBk"}, {"id": "tk0siMup01kyaFww", "sku": "D7wecuQb4GNQHVZM"}, {"id": "KGBnzh4suaGIzttT", "sku": "ncVBf5g3oeuHiNyL"}], "localizations": {"kfPQPmjUkvSs5YmI": {"description": "ejozmG5HlrIfMAvv", "localExt": {"pkAHRJHZyfrXZmiJ": {}, "X4CjKCeIRIr997KK": {}, "pJXTLbYWpqeXjaf1": {}}, "longDescription": "f5fjNMZjKJ05puX3", "title": "197WrMnJtovSMFw8"}, "X4zxbdfXgunt1oMN": {"description": "Z68eovHSH3xV3URI", "localExt": {"RVDYBd6hMB0l7sg7": {}, "IfMH5Tu1ky1ZYvye": {}, "HmfoFkUDP864shbn": {}}, "longDescription": "Q3bVvuvpsDJXPCWk", "title": "X4Kpi8CJ88aMPGFF"}, "AQZbfbmVTEbiRq5J": {"description": "uikmpat75rVbN9ZB", "localExt": {"tzJ33tCwv8H1f451": {}, "FVZ630HNBYZSrz7p": {}, "MjESLLMPKDXLki6O": {}}, "longDescription": "z5Bygt8Q0RjSf1sr", "title": "B7hGwGbUmQmJHNff"}}, "name": "ZENs9X0hFMdzryvh", "rotationType": "CUSTOM", "startDate": "1990-07-21T00:00:00Z", "viewId": "YjHmmulSBIElc2Cd"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateSection' test.out

#- 191 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RvBb0aGnMt625bWH' \
    > test.out 2>&1
eval_tap $? 191 'PurgeExpiredSection' test.out

#- 192 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'b5sbX6asrjV7XJUO' \
    --storeId 'tHlzXNHEPpzlMlx7' \
    > test.out 2>&1
eval_tap $? 192 'GetSection' test.out

#- 193 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'b2H2THLwZGikW7TF' \
    --storeId 'A9gE6SrYKq6lcVOh' \
    --body '{"active": false, "displayOrder": 95, "endDate": "1986-07-14T00:00:00Z", "ext": {"HbiKHW7flVolAWEM": {}, "mQSPDTRqjlvwnnCA": {}, "5tfK5ushaKTPVjyO": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 35, "itemCount": 90, "rule": "SEQUENCE"}, "items": [{"id": "3uUdgNlyU4IJnqtr", "sku": "jCOsE8VjvzhJwNX4"}, {"id": "bhqCjlwrmsSRV86i", "sku": "ic1FIMyF7CcNu2DY"}, {"id": "n6E9Gk51kOTJZluT", "sku": "ekDMCGUJvERxNg8d"}], "localizations": {"jSb4Vt2vKQ5vlCdI": {"description": "519Pf2iogwxM5DZM", "localExt": {"0dgozmco41750xdY": {}, "Qg34WUV0WpmsQnp1": {}, "n4YGumTKOlDOy5vh": {}}, "longDescription": "SkxERZ2AQ1jvXYBa", "title": "r5RMmmGdWl0wpj5t"}, "VfKU3D8WVPh0Z7Yi": {"description": "GE2cyzTMBY7Xd0Oo", "localExt": {"ENg2Lw7uepmahXoj": {}, "VZYz2zMU9jLzNV3G": {}, "aG43R6nlRPrEAYqR": {}}, "longDescription": "BeSc5uShoj3dGHMe", "title": "oi5DBOsQ0Gax0iX0"}, "5IT9Agsjl5NmnSHh": {"description": "xNmCe4txY0MsPc9E", "localExt": {"Mgf9JCJiEvhL8Zfw": {}, "CVJW9yspUOyHC9eK": {}, "eXzrvzBllwzyC1aT": {}}, "longDescription": "WEmPgoy4TkpEw4Ze", "title": "id4mRoFNxv10ckMQ"}}, "name": "VjKk3bWJ0ZuYSe3s", "rotationType": "NONE", "startDate": "1982-04-09T00:00:00Z", "viewId": "x2hc8vaN1Off5gRZ"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateSection' test.out

#- 194 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ZMW3huAIzBPWBYKA' \
    --storeId 'EFTdlKNh6GTzKjsC' \
    > test.out 2>&1
eval_tap $? 194 'DeleteSection' test.out

#- 195 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 195 'ListStores' test.out

#- 196 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "qxx24QM35bSkFrvG", "defaultRegion": "ciNHb7OY5YIpOLJW", "description": "52uz3c8pz63M0g4x", "supportedLanguages": ["XT5Ts4e0uR47OzUG", "HeBKtpvyRNgjZkdD", "ppvEJiUiDGXgh8BK"], "supportedRegions": ["cLqtRZ93LuR8OEyI", "CvwgwBFehwtdJLdn", "3R2wo8beVQvgeP9q"], "title": "OHaLwYnXxrz7sLmP"}' \
    > test.out 2>&1
eval_tap $? 196 'CreateStore' test.out

#- 197 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'CATEGORY' \
    > test.out 2>&1
eval_tap $? 197 'GetCatalogDefinition' test.out

#- 198 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'DownloadCSVTemplates' test.out

#- 199 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["LxN0f3JA27Qz5Sjz", "QfOLYu9O46OOzz9p", "57qSpHerzO87cg7T"], "idsToBeExported": ["qtMiQgi7Aj28qCRb", "wwZc4ZS1NMkrnHs1", "Iyhwqk140MolIrnl"], "storeId": "kRVbcX435TDYpkk2"}' \
    > test.out 2>&1
eval_tap $? 199 'ExportStoreByCSV' test.out

#- 200 ImportStore
eval_tap 0 200 'ImportStore # SKIP deprecated' test.out

#- 201 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 201 'GetPublishedStore' test.out

#- 202 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 202 'DeletePublishedStore' test.out

#- 203 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'GetPublishedStoreBackup' test.out

#- 204 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 204 'RollbackPublishedStore' test.out

#- 205 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Gza6DrSycophHw3E' \
    > test.out 2>&1
eval_tap $? 205 'GetStore' test.out

#- 206 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oEEClTO9SDKnMlnK' \
    --body '{"defaultLanguage": "W9jiNMu9QVrMeD4b", "defaultRegion": "D8gISE34yIAZQeig", "description": "iA3wBrmBYIlZeheP", "supportedLanguages": ["72AB8EO3YrlyrWow", "UpUDVLlTtuJJsHZV", "sG6izJZruOJvSRFL"], "supportedRegions": ["DSdj8elbtHvDU91D", "mHzwiqVPCJ5j18Ou", "3aY8nceFU5GKmcEK"], "title": "p8AQwqgJs6O0Qj0c"}' \
    > test.out 2>&1
eval_tap $? 206 'UpdateStore' test.out

#- 207 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'cMkdz6zPz3BVHAqp' \
    > test.out 2>&1
eval_tap $? 207 'DeleteStore' test.out

#- 208 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId '4O9XSjap24esyjh6' \
    --action 'CREATE' \
    --itemSku 'c3migf2n6iQyr5cb' \
    --itemType 'BUNDLE' \
    --limit '77' \
    --offset '5' \
    --selected  \
    --sortBy 'updatedAt:desc,createdAt,updatedAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd 'gHAkltcR3eHFbiAl' \
    --updatedAtStart 'uHv7Hssd05pHBJX5' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 208 'QueryChanges' test.out

#- 209 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ln8PZbYVD8RiaTsd' \
    > test.out 2>&1
eval_tap $? 209 'PublishAll' test.out

#- 210 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'D4d3kSbTkHPMUvOA' \
    > test.out 2>&1
eval_tap $? 210 'PublishSelected' test.out

#- 211 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UXkw36cr2WJQqS7T' \
    > test.out 2>&1
eval_tap $? 211 'SelectAllRecords' test.out

#- 212 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'q4YIyZAFQ6lZfa2j' \
    --action 'CREATE' \
    --itemSku 'wSaoj1ugjr8mPkr3' \
    --itemType 'INGAMEITEM' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd '506ERSVy5M3rrkxu' \
    --updatedAtStart '0U9h9gCNVZxHGxhZ' \
    > test.out 2>&1
eval_tap $? 212 'SelectAllRecordsByCriteria' test.out

#- 213 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qNXJ6JXSh0Z3SWIS' \
    --action 'DELETE' \
    --itemSku 'NHto74GcmVf0fbCU' \
    --itemType 'BUNDLE' \
    --type 'ITEM' \
    --updatedAtEnd 'dPuWeMEeL0EJG67g' \
    --updatedAtStart '4W1eAmDxP23qstMu' \
    > test.out 2>&1
eval_tap $? 213 'GetStatistic' test.out

#- 214 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ikKc6VNU8570siWm' \
    > test.out 2>&1
eval_tap $? 214 'UnselectAllRecords' test.out

#- 215 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '3V9sirE0JOQxWeHy' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pqCWMDPRI2cCk8zH' \
    > test.out 2>&1
eval_tap $? 215 'SelectRecord' test.out

#- 216 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'R8VyCC0EQwE0cXok' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XbwKDtVmrYQu7hZv' \
    > test.out 2>&1
eval_tap $? 216 'UnselectRecord' test.out

#- 217 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HfiT9s9pK8HuUY1Q' \
    --targetStoreId 'QHQ0NCEddJtx6GV0' \
    > test.out 2>&1
eval_tap $? 217 'CloneStore' test.out

#- 218 ExportStore
eval_tap 0 218 'ExportStore # SKIP deprecated' test.out

#- 219 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId '1vD7lNLxlpvqaB9P' \
    --end '9GaukfCEIeSBLhTf' \
    --limit '51' \
    --offset '61' \
    --sortBy 'igzHcRuJgYaj4I8D' \
    --start 'zyh1N0JEKNoMtHvj' \
    --success  \
    > test.out 2>&1
eval_tap $? 219 'QueryImportHistory' test.out

#- 220 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'M7X1fjzknv2HZMIL' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes '2P2bh14LroFTnAuu' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 220 'ImportStoreByCSV' test.out

#- 221 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '2YR6QU7fj6w17arN' \
    --limit '37' \
    --offset '86' \
    --sku 'hOoLVM7UFnuJDzeE' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId '6xtyJtnbTDXu7Fbl' \
    > test.out 2>&1
eval_tap $? 221 'QuerySubscriptions' test.out

#- 222 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'eSP5PcdOuq0m0rva' \
    > test.out 2>&1
eval_tap $? 222 'RecurringChargeSubscription' test.out

#- 223 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'kR8rcwojLRjhcaJ5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 223 'GetTicketDynamic' test.out

#- 224 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '6nGlYZ2tod2BGBXj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "NyRCtPOr1FU3QZy3"}' \
    > test.out 2>&1
eval_tap $? 224 'DecreaseTicketSale' test.out

#- 225 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'gdDms3kb1htW0UGJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'GetTicketBoothID' test.out

#- 226 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'pwQZlXuzu3m9u67J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 18, "orderNo": "IZCTNiIRc9fEjkZh"}' \
    > test.out 2>&1
eval_tap $? 226 'IncreaseTicketSale' test.out

#- 227 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 30, "currencyCode": "pAJMCxMp2J0hDg2k", "expireAt": "1991-08-08T00:00:00Z"}, "debitPayload": {"count": 13, "currencyCode": "KtU956hOg8oukDVd", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 8, "entitlementCollectionId": "M36mI9u3EeZtLQij", "entitlementOrigin": "Oculus", "itemIdentity": "JXsqdXfhZTTaCeqG", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 25, "entitlementId": "p7q794bu49lINFTt"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 55, "currencyCode": "qByWN2BCnRz9w2nu", "expireAt": "1979-04-18T00:00:00Z"}, "debitPayload": {"count": 81, "currencyCode": "B9jKaunAcylsau7w", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 88, "entitlementCollectionId": "yzC4QaLXp3o4TDra", "entitlementOrigin": "Steam", "itemIdentity": "4lwXqwPfq3VzHQjt", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 19, "entitlementId": "lx64w1gyvjacKtGq"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 79, "currencyCode": "zp3sZxImVK5yh2Lc", "expireAt": "1990-05-16T00:00:00Z"}, "debitPayload": {"count": 79, "currencyCode": "LaMW0ByjsRUrAHNR", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 5, "entitlementCollectionId": "IcC4wNFzsbrtYvLh", "entitlementOrigin": "Oculus", "itemIdentity": "6AWXoMiowdWSs9DQ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 98, "entitlementId": "H8aYYUT6mma833TD"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "h0UyqxVWlIMY5tTJ"}, {"operations": [{"creditPayload": {"balanceOrigin": "Other", "count": 48, "currencyCode": "4KV104MtMhKHmSjq", "expireAt": "1992-11-15T00:00:00Z"}, "debitPayload": {"count": 41, "currencyCode": "lxiEjQBCZx9DJ4V9", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 90, "entitlementCollectionId": "ulLg4bsO4YHEYLjT", "entitlementOrigin": "System", "itemIdentity": "NDf3zazm6p5Y1tkG", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 100, "entitlementId": "Tf1axo16GqT2vSLL"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 78, "currencyCode": "uE7xssm4hxczskbS", "expireAt": "1994-04-18T00:00:00Z"}, "debitPayload": {"count": 2, "currencyCode": "oKIz8O8NglJtZTh2", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 45, "entitlementCollectionId": "ZmTTGYRbP4QVey9p", "entitlementOrigin": "Steam", "itemIdentity": "16MMd2bzOrTn2huw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 10, "entitlementId": "yUzBUWiKoNGtvyk5"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 63, "currencyCode": "Hv3JgteOLyKp8a1V", "expireAt": "1979-07-17T00:00:00Z"}, "debitPayload": {"count": 6, "currencyCode": "XnRhDd9TGkO6aIYq", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 42, "entitlementCollectionId": "tw1SrM2nhSEanfUY", "entitlementOrigin": "Oculus", "itemIdentity": "rFQP6rW62CtetBW3", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "vAJJieHhveGg97PY"}, "type": "FULFILL_ITEM"}], "userId": "AtBjP4HSuiYCbG0U"}, {"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 20, "currencyCode": "YUJmNL8p6AbdtU0C", "expireAt": "1986-06-15T00:00:00Z"}, "debitPayload": {"count": 35, "currencyCode": "AYuzrmbWofEaKStq", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 83, "entitlementCollectionId": "Ku4ROnONpJ849chq", "entitlementOrigin": "GooglePlay", "itemIdentity": "DemtiQvURYZCeF30", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 36, "entitlementId": "Adel3hHMSLAiscGR"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "IOS", "count": 60, "currencyCode": "Cl1ZKuPxjDUGRGcC", "expireAt": "1986-04-27T00:00:00Z"}, "debitPayload": {"count": 85, "currencyCode": "6tHj4z4cAM4LMJfW", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 97, "entitlementCollectionId": "IxAgBpeubprKX68j", "entitlementOrigin": "Oculus", "itemIdentity": "yRd3LrR1x6U1v6zS", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 19, "entitlementId": "lPBYJ7X6uVy7FWTS"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 40, "currencyCode": "i2CPVGxjcdpdCqVe", "expireAt": "1973-02-11T00:00:00Z"}, "debitPayload": {"count": 84, "currencyCode": "1AYq306Pysv4VPaZ", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 29, "entitlementCollectionId": "pn0vAD9YsPeDWrAV", "entitlementOrigin": "IOS", "itemIdentity": "ZSvgWuCuLsUGrVQA", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 16, "entitlementId": "3g62oGYwkrjLI4EH"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "AKtfXCKOna8DdjtZ"}], "metadata": {"hh6ofsUoRh6r0e0J": {}, "6vyqPw7YlmV3kES0": {}, "Hi88UYgSV40OvY7a": {}}, "needPreCheck": true, "transactionId": "sQk100eu5UcxuXXp", "type": "t0YSPX04uEIdAwgD"}' \
    > test.out 2>&1
eval_tap $? 227 'Commit' test.out

#- 228 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '52' \
    --status 'FAILED' \
    --type '9dddLWJWDuSYtCaI' \
    --userId 'v4Lp91wYUJPbvzn8' \
    > test.out 2>&1
eval_tap $? 228 'GetTradeHistoryByCriteria' test.out

#- 229 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'TYoMDAaUXSuBQdvd' \
    > test.out 2>&1
eval_tap $? 229 'GetTradeHistoryByTransactionId' test.out

#- 230 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hJoT0WK5ngNUxDKf' \
    --body '{"achievements": [{"id": "ZYofPGUbSaA00nKx", "value": 87}, {"id": "Gb0ceCbphW4YMhJ0", "value": 91}, {"id": "GyJS48Hxu8Ju4XSA", "value": 27}], "steamUserId": "PfRQ3rJ0f5lwXvRN"}' \
    > test.out 2>&1
eval_tap $? 230 'UnlockSteamUserAchievement' test.out

#- 231 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'DBnmL1KQn77hiP1l' \
    --xboxUserId 'zkzjYDw6mLBordrJ' \
    > test.out 2>&1
eval_tap $? 231 'GetXblUserAchievements' test.out

#- 232 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'kD6vy60uRMT1Xw9K' \
    --body '{"achievements": [{"id": "9Yb68a8ygYx2Tqkh", "percentComplete": 23}, {"id": "HtZSd3QzXhkrN4pW", "percentComplete": 36}, {"id": "WnLrXqImgDf3GaJs", "percentComplete": 7}], "serviceConfigId": "gLZ4YIzElrLZOBLH", "titleId": "CKmLBaIwlokbAFW8", "xboxUserId": "RgBUwBL28BqM8Uzv"}' \
    > test.out 2>&1
eval_tap $? 232 'UpdateXblUserAchievement' test.out

#- 233 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'KqeoTiNKGRUMrimG' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizeCampaign' test.out

#- 234 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Az6OhmHOpCdr3WzD' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeEntitlement' test.out

#- 235 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'm3hJdd6uaO9TiTPn' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeFulfillment' test.out

#- 236 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ih2iaIBpYC4txul6' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeIntegration' test.out

#- 237 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'VKYlNYYlHPwKDpJm' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeOrder' test.out

#- 238 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'keoAkp3Z4pgyJYwc' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizePayment' test.out

#- 239 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'lb4gd4QgQut2hiPu' \
    > test.out 2>&1
eval_tap $? 239 'AnonymizeRevocation' test.out

#- 240 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdOPHcN9drwqytie' \
    > test.out 2>&1
eval_tap $? 240 'AnonymizeSubscription' test.out

#- 241 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'XpIZfr5XDq9dGLHj' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeWallet' test.out

#- 242 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'tgE2bTXJxCCFqPND' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 242 'GetUserDLCByPlatform' test.out

#- 243 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'leYNHXeOpaRDwYLg' \
    --includeAllNamespaces  \
    --status 'FULFILLED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 243 'GetUserDLC' test.out

#- 244 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '51PbK2MFKvw5TWjA' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId 'I1BLtGEZDRNkk4DJ' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'Nr4JmYxH2qs28heP' \
    --features 'JjMp0TKKUBfPNI9f,2oLWDPSZexfKVxqd,xmh5QWxuQuI7gdDT' \
    --fuzzyMatchName  \
    --itemId 'Db3WdnOpzTrRzCCa,fADJfWBspT3MLwJZ,quMQSPp5XD4S1ilf' \
    --limit '13' \
    --offset '54' \
    --origin 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserEntitlements' test.out

#- 245 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'aUaQBKFedL2uduXv' \
    --body '[{"collectionId": "ZUbQQ13FhD3NExUF", "endDate": "1975-10-24T00:00:00Z", "grantedCode": "pJsUiDawAjgHFQk0", "itemId": "VzWRNFNiUn2yXMSC", "itemNamespace": "cHADYpS861c0CJ7L", "language": "sQe-qttI-633", "metadata": {"yrnvXY5dDwneac75": {}, "C6S2eHsH4Y84hL75": {}, "QboMHCtzEF9FSeg6": {}}, "origin": "System", "quantity": 32, "region": "gtfuqJHrs4e3RnWR", "source": "OTHER", "startDate": "1990-01-28T00:00:00Z", "storeId": "xoMrj2J4JGQZAtyj"}, {"collectionId": "TxnlmSyjEaFH2DRN", "endDate": "1971-10-02T00:00:00Z", "grantedCode": "k59yFSfdZIv8oYWP", "itemId": "US4Zu0SbTt6M2Xiz", "itemNamespace": "ikCh6q0yq2WAHtL7", "language": "gyKf-GFee_nI", "metadata": {"OaXrDlEX42U0syrG": {}, "NhBmgT2q0kIbrJ2S": {}, "5Pf1Lvg8kYEVylIN": {}}, "origin": "Twitch", "quantity": 27, "region": "pxFY8E6pU8eHjh0a", "source": "PROMOTION", "startDate": "1976-02-10T00:00:00Z", "storeId": "IOaQt0snbE0yMvqF"}, {"collectionId": "7TJ9uB0zypjJiu7B", "endDate": "1988-11-02T00:00:00Z", "grantedCode": "imNuwB3hBVhuSMHh", "itemId": "f5R2MkxQTAYGfE6h", "itemNamespace": "XZ7XLoWCGf0dZEeX", "language": "RDi-uB", "metadata": {"HcZbX2wNnT6A9zos": {}, "mDnXoncy7NZQ4PkA": {}, "PXBCfkE1Fb0y94eP": {}}, "origin": "GooglePlay", "quantity": 50, "region": "dfFnOfY9stXH6LYX", "source": "OTHER", "startDate": "1989-01-22T00:00:00Z", "storeId": "7MXHbEwAvvpEeHhX"}]' \
    > test.out 2>&1
eval_tap $? 245 'GrantUserEntitlement' test.out

#- 246 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iJcJqYSxVKUYMimV' \
    --activeOnly  \
    --appId 'LzAP6aOzsTqEFXUh' \
    > test.out 2>&1
eval_tap $? 246 'GetUserAppEntitlementByAppId' test.out

#- 247 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'GAwpYq1UqZydOB0M' \
    --activeOnly  \
    --limit '93' \
    --offset '16' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 247 'QueryUserEntitlementsByAppType' test.out

#- 248 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZW6LwcAg57BYBVCb' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'KVT3OvEujx5yjtQS' \
    --itemId 'CJaOHzpb623EciYo' \
    > test.out 2>&1
eval_tap $? 248 'GetUserEntitlementByItemId' test.out

#- 249 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'YOPVg6DLEZ6DxpwB' \
    --ids 'm2N8PdQ5mQaGXEbn,mWR0H3EkrHqaLNdf,KszYZzOg113h6fIa' \
    --platform 'HSx5bClxUOBmMwv5' \
    > test.out 2>&1
eval_tap $? 249 'GetUserActiveEntitlementsByItemIds' test.out

#- 250 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'pmiIVnhlLoMemsp7' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'XMSrC62xYtDwflNG' \
    --sku 'fufW5cWeg6eSCyps' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementBySku' test.out

#- 251 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'ceITTkJGGCVF6LrI' \
    --appIds 'LDLviUCzmDAaW5xz,1c7ZuZXUCBYnkY0L,EBSYBdUSiTOrhB8h' \
    --itemIds 'Vs29WOKmZRTtgycL,zXz6lUMKi5mweMEZ,o2ZnL1Zg2JfH4f73' \
    --platform 'jAevOnES6YJLlb2A' \
    --skus 'fUEEBbqMMKvkOsR1,fHUyirMVMOFES2J2,OzNlJE3uqZz574g3' \
    > test.out 2>&1
eval_tap $? 251 'ExistsAnyUserActiveEntitlement' test.out

#- 252 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '1cA0PwZxTIZVSGQy' \
    --platform 'Tzhs9Asy4d629N4Y' \
    --itemIds 'nolVWA2dWxBs056j,kPCUuE1pgdHvlQKi,R7SDQUDavOlKT5EI' \
    > test.out 2>&1
eval_tap $? 252 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 253 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'HNhJQq94Re5IM1ak' \
    --appId 'NKz9IltQUku3n32a' \
    > test.out 2>&1
eval_tap $? 253 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 254 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'tB0QPQPEp5UtwUWG' \
    --entitlementClazz 'ENTITLEMENT' \
    --platform '3AUWFTLq0W1JqwKs' \
    --itemId '1mO80L7IOHlf6j8P' \
    > test.out 2>&1
eval_tap $? 254 'GetUserEntitlementOwnershipByItemId' test.out

#- 255 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZOzUiQKZqz5NSp0B' \
    --ids '7LODN3Boi2sSAO2n,4MZQt753XQB93rOW,0guPoQbYzc1RDVhs' \
    --platform '2lhdzxxgibuqUuyW' \
    > test.out 2>&1
eval_tap $? 255 'GetUserEntitlementOwnershipByItemIds' test.out

#- 256 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '3cMz9YyduMomEHcU' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'GCbaxw33rNbE4bbD' \
    --sku 'U4FMTbQaANJOODGe' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlementOwnershipBySku' test.out

#- 257 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDCWcl3VSJENQope' \
    > test.out 2>&1
eval_tap $? 257 'RevokeAllEntitlements' test.out

#- 258 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HD6iKBGm5Cj7RqnJ' \
    --entitlementIds 'UmfDmofxvN8pRGoU' \
    > test.out 2>&1
eval_tap $? 258 'RevokeUserEntitlements' test.out

#- 259 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'tmbWZbEjPyq35BWD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oc3qNcQFFyHv141N' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlement' test.out

#- 260 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'PqjRUMKSQjFdjqTa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZFsWzbqwTZQIN5jC' \
    --body '{"collectionId": "6a8mEVCXHmFnrSL0", "endDate": "1992-03-07T00:00:00Z", "nullFieldList": ["JcZQaCeNLYxMID9p", "qZ5rryiMMt6fQtLh", "zylaquioT3QBt29A"], "origin": "IOS", "reason": "XRL8cbTAntB1STaa", "startDate": "1971-12-18T00:00:00Z", "status": "INACTIVE", "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 260 'UpdateUserEntitlement' test.out

#- 261 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'zz606UGXPhoNZlXM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ef7AvS3TfKx6ByTy' \
    --body '{"metadata": {"gbtOtcQS4Cmgw1wR": {}, "UnIVYxY6OhdkrYiC": {}, "inoVOzo4Plv1IlTp": {}}, "options": ["EhjTFYdzsUNvQAn2", "LuMjLqwmVz3zKsfj", "z1mFkyxoUzfMFoXC"], "platform": "OguSq2A4R3wDdSkN", "requestId": "fHJtA3QiX9Zvtydb", "useCount": 0}' \
    > test.out 2>&1
eval_tap $? 261 'ConsumeUserEntitlement' test.out

#- 262 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'I1SjkH42LtyZKrTJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0L5sHil4Q0mqa8G' \
    > test.out 2>&1
eval_tap $? 262 'DisableUserEntitlement' test.out

#- 263 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'atrjbJ5YT7uvqarT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vrG1DXZAWlvz3c3X' \
    > test.out 2>&1
eval_tap $? 263 'EnableUserEntitlement' test.out

#- 264 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'ALMresGFfsH4aXCD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hshvEF8rHd250nyi' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementHistories' test.out

#- 265 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'hcUVGHQczI5ZoTRU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kjGoRkPs2SO9XrgX' \
    --body '{"metadata": {"NIaU11cBXLwTfopq": {}, "eZtHJnRgaGfLMFbv": {}, "yI5PZGzVLcmZKKKY": {}}}' \
    > test.out 2>&1
eval_tap $? 265 'RevokeUserEntitlement' test.out

#- 266 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'ARape2tsNczam4Cd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd1QYvww4XDokltgq' \
    --body '{"reason": "2vXtUnY6UhDJ4pe0", "useCount": 37}' \
    > test.out 2>&1
eval_tap $? 266 'RevokeUserEntitlementByUseCount' test.out

#- 267 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'TRyJQrNLTcqLVTN5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qf4tjPGpu27yxb1o' \
    --quantity '12' \
    > test.out 2>&1
eval_tap $? 267 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 268 RevokeUseCount
eval_tap 0 268 'RevokeUseCount # SKIP deprecated' test.out

#- 269 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '1v2abpCWytPEi9Ze' \
    --namespace "$AB_NAMESPACE" \
    --userId '0hL9rPkV5GkSrcl2' \
    --body '{"platform": "O47XVzU7qlNVk7qn", "requestId": "mBS3XKDhp1OkMcEr", "useCount": 25}' \
    > test.out 2>&1
eval_tap $? 269 'SellUserEntitlement' test.out

#- 270 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XxjkyNfj3XgTRTjI' \
    --body '{"duration": 11, "endDate": "1978-04-08T00:00:00Z", "entitlementCollectionId": "NBzgQ4CRwg0sKVeS", "entitlementOrigin": "Nintendo", "itemId": "Y2epRDJjDyMDKQhu", "itemSku": "TjtQZyIiAmCL8bNT", "language": "TfqLCv9DYBOProN4", "metadata": {"UWbQaKFrTv4JWElm": {}, "OCxqPrq9I3XJWBxT": {}, "LcOef8MgIwkrKFEt": {}}, "order": {"currency": {"currencyCode": "wESJCe2ksG3nZE13", "currencySymbol": "H2fILFzOlAZbDQAE", "currencyType": "REAL", "decimals": 76, "namespace": "6y7yJMowQ6LpHCvC"}, "ext": {"YTgX9JQwErzjtuP9": {}, "pUUv7qefNMFsZAIq": {}, "ak1zi0JSa5cRn31D": {}}, "free": true}, "orderNo": "Su6aCnL816aH6gOB", "origin": "System", "overrideBundleItemQty": {"gU8bD5mGFFmKTTUx": 68, "2MxILI42BJMPkZma": 50, "f558h1ltyhiSGhfq": 89}, "quantity": 14, "region": "CoDq3geuHFFaZzPI", "source": "GIFT", "startDate": "1972-09-06T00:00:00Z", "storeId": "DQvpRfGe3z2rtjWp"}' \
    > test.out 2>&1
eval_tap $? 270 'FulfillItem' test.out

#- 271 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'JAlKHF0ebxhJ1176' \
    --body '{"code": "CeD4dWCp4wqlQJcZ", "language": "PoE", "region": "Pj2XoFug8BUQUmPH"}' \
    > test.out 2>&1
eval_tap $? 271 'RedeemCode' test.out

#- 272 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'nPumcazKAna0ji75' \
    --body '{"itemId": "7aNDFeKnQP2j2WsQ", "itemSku": "ImTwYkiuxzLrbJ0B", "quantity": 22}' \
    > test.out 2>&1
eval_tap $? 272 'PreCheckFulfillItem' test.out

#- 273 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'GS97Si6XyLVPrkUx' \
    --body '{"entitlementCollectionId": "yZ1OH5Nn4nMT8QOy", "entitlementOrigin": "GooglePlay", "metadata": {"uUSD9ImtaPAocOQc": {}, "pBWSNrCjSNEAdojk": {}, "CMmYyTGO07foRZ6F": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "69PSsquWUafwbFPX", "namespace": "15633pFgA7i9tqvf"}, "item": {"itemId": "HmFvUZiUW5Y0CYw5", "itemName": "OXSGwQkJuy9oLFcH", "itemSku": "HcraLXR2n9JQvq7N", "itemType": "KWIHYsii3fCh7sie"}, "quantity": 73, "type": "ITEM"}, {"currency": {"currencyCode": "jZPAkiWumllU31uX", "namespace": "PwYxedGHCIkmt4bf"}, "item": {"itemId": "JOhNaIT0pv7XeqO8", "itemName": "gY3c4SryWB4yRaDx", "itemSku": "vxwaLM8HkVOW8PnL", "itemType": "kgqkqYZWPZTgKagT"}, "quantity": 51, "type": "CURRENCY"}, {"currency": {"currencyCode": "ilcKA84d9pMsl7zr", "namespace": "NJvDiP2hNNEI8QrQ"}, "item": {"itemId": "6H1ro5CtU8UjgyCU", "itemName": "pM1JBcTzf4dz1Boj", "itemSku": "PoQg976409vFd5z9", "itemType": "r4nJWUvLp1wxGF74"}, "quantity": 38, "type": "CURRENCY"}], "source": "OTHER", "transactionId": "XUq3uIffkIpPmrWV"}' \
    > test.out 2>&1
eval_tap $? 273 'FulfillRewards' test.out

#- 274 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'xNZUvkiU2jXSwsBB' \
    --endTime 'RopVl38d4NZGtk6E' \
    --limit '25' \
    --offset '60' \
    --productId 'WxC75M88TKhFYkA9' \
    --startTime 'aRNDe2IoPMSQKcg0' \
    --status 'VERIFIED' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 274 'QueryUserIAPOrders' test.out

#- 275 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'T9JA0ll1RimBCiQw' \
    > test.out 2>&1
eval_tap $? 275 'QueryAllUserIAPOrders' test.out

#- 276 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'uyrI87uSyXP6C0jX' \
    --endTime 'S8au2wcWYyj3JvHq' \
    --limit '29' \
    --offset '31' \
    --startTime 'YfPK2QiAUhIfi17Y' \
    --status 'PENDING' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 276 'QueryUserIAPConsumeHistory' test.out

#- 277 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWHNxiaNyqBfgw58' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "PySH", "productId": "FSuHmrqej8PRppYY", "region": "1vlV0M2g6oreqyBz", "transactionId": "WzCgMMWZuD6tmIR2", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 277 'MockFulfillIAPItem' test.out

#- 278 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'xVxbtpSKOfiIP3S6' \
    --activeOnly  \
    --groupId 'pypZqISn3msrykQF' \
    --limit '40' \
    --offset '99' \
    --platform 'XBOX' \
    --productId '8QGKFZLrIfqrZuu7' \
    > test.out 2>&1
eval_tap $? 278 'QueryUserThirdPartySubscription' test.out

#- 279 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId 'D6uTDYnqyNgN7Goe' \
    --groupId 'MsezFZsTBHkgcJ0D' \
    > test.out 2>&1
eval_tap $? 279 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 280 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId '0zZRODEKPdudZsLa' \
    --productId 'f8aZrXW84dt0TSTm' \
    > test.out 2>&1
eval_tap $? 280 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 281 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'y7XF26K2U7xttUz8' \
    --activeOnly  \
    --groupId 'nWKJjv06PuffHghA' \
    --limit '87' \
    --offset '65' \
    --platform 'EPICGAMES' \
    --productId 'DbTvRYfpJ4wM9WZf' \
    > test.out 2>&1
eval_tap $? 281 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 282 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'OOxAzmsbhi5QJuc2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SNBaOlXfgsgBd7MY' \
    > test.out 2>&1
eval_tap $? 282 'GetThirdPartySubscriptionDetails' test.out

#- 283 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'LLoPZrkjRm5Ki0or' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hXrISEaPZHLQkTHv' \
    --limit '27' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 283 'GetSubscriptionHistory' test.out

#- 284 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'aUQV5QEvKElLfbB7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwwAR1xFrnyirw3i' \
    > test.out 2>&1
eval_tap $? 284 'SyncSubscriptionTransaction' test.out

#- 285 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'Jt5iA3JS2xeaJ08J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rSHPqdhKHn6ZjZMd' \
    > test.out 2>&1
eval_tap $? 285 'GetThirdPartyUserSubscriptionDetails' test.out

#- 286 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'r1C2TIQzRJY7UfYS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdN0JVz4U43EcV1F' \
    > test.out 2>&1
eval_tap $? 286 'SyncSubscription' test.out

#- 287 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyeeqehMNeRYKeMb' \
    --discounted  \
    --itemId 'L0G4v5D6ylZguO91' \
    --limit '20' \
    --offset '15' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 287 'QueryUserOrders' test.out

#- 288 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'qUR1Pq4a4uaMfd0S' \
    --body '{"currencyCode": "QAfYIyzHL8jxakuV", "currencyNamespace": "u5r5B08VZxI4TU3a", "discountCodes": ["pnZXoJ4gI4EQKO8x", "EQZsHyXzoIXNf0Kb", "C4D0FsUo3IB2kX5R"], "discountedPrice": 77, "entitlementPlatform": "Other", "ext": {"9HyJttdgfLGO3umm": {}, "pllnV6B62P1Kazg7": {}, "3c6UpmA4ehxNIIlc": {}}, "itemId": "rZzgameT2mLkkAMj", "language": "HyI0e2Axj0nZHjmo", "options": {"skipPriceValidation": false}, "platform": "Xbox", "price": 48, "quantity": 74, "region": "qElP5lA2FJ0iGLRT", "returnUrl": "XGsC5mxxse4eeuMg", "sandbox": true, "sectionId": "OxgwCymCDYsuff3b"}' \
    > test.out 2>&1
eval_tap $? 288 'AdminCreateUserOrder' test.out

#- 289 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7G5FDX4mu0qPHb9L' \
    --itemId 'l2EFEb8GnsthmQ2Y' \
    > test.out 2>&1
eval_tap $? 289 'CountOfPurchasedItem' test.out

#- 290 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6ZGOiqrg3lpqN5bO' \
    --userId 'fnqJ5bzDRzbhMxfE' \
    > test.out 2>&1
eval_tap $? 290 'GetUserOrder' test.out

#- 291 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DE4TrtIHyyMq79Ed' \
    --userId 'B9MxaF8QHGM2IuQY' \
    --body '{"status": "INIT", "statusReason": "oqcRZRNATojM7daV"}' \
    > test.out 2>&1
eval_tap $? 291 'UpdateUserOrderStatus' test.out

#- 292 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0VwR3yNKDtMqMrAG' \
    --userId 'pdyF6WDHn3ePBxQN' \
    > test.out 2>&1
eval_tap $? 292 'FulfillUserOrder' test.out

#- 293 GetUserOrderGrant
eval_tap 0 293 'GetUserOrderGrant # SKIP deprecated' test.out

#- 294 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'z2IUEHMzl5jhwVDs' \
    --userId 'uzwJ4v50eoaIBrTh' \
    > test.out 2>&1
eval_tap $? 294 'GetUserOrderHistories' test.out

#- 295 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0EKkJioUpvGnkcHg' \
    --userId 'CfaWzPUvCnfqsPGg' \
    --body '{"additionalData": {"cardSummary": "JZyRwigaMu07Zek8"}, "authorisedTime": "1995-07-28T00:00:00Z", "chargebackReversedTime": "1991-01-12T00:00:00Z", "chargebackTime": "1999-05-04T00:00:00Z", "chargedTime": "1991-02-09T00:00:00Z", "createdTime": "1986-09-17T00:00:00Z", "currency": {"currencyCode": "dywPqYerrpOm4M2p", "currencySymbol": "M4fIfcHBWZM50aHb", "currencyType": "VIRTUAL", "decimals": 90, "namespace": "3psWjOyHLyKe2foq"}, "customParameters": {"sVIfgBTr8RcxRQR0": {}, "NYdJzf3TMhSaynVs": {}, "05nZC4Os7hqIH2Ng": {}}, "extOrderNo": "ARSG3QQNGNH2K0Uu", "extTxId": "JdeGNquQnaXpDQ5r", "extUserId": "U2taDWh9JV5oc5IF", "issuedAt": "1993-05-29T00:00:00Z", "metadata": {"gPFJ4WndMpQhcLK0": "WTZbtmQkwC8azx3I", "RWme3C6p2r4D3NQd": "jrjkX3AMgK3JgZuf", "zssA284mG7uAojLY": "Bsx8oqMzbE0ljQaB"}, "namespace": "tb47V691j0FZp2vj", "nonceStr": "OXptxzx6kkaZYpl5", "paymentData": {"discountAmount": 38, "discountCode": "0BCO4qPnvxERWjKa", "subtotalPrice": 37, "tax": 57, "totalPrice": 35}, "paymentMethod": "BEWrDbQ1ZzhDuLHq", "paymentMethodFee": 33, "paymentOrderNo": "LTBstguOdN0O7l3G", "paymentProvider": "ADYEN", "paymentProviderFee": 12, "paymentStationUrl": "KPHdDTQDEEE2mTsn", "price": 57, "refundedTime": "1991-02-27T00:00:00Z", "salesTax": 46, "sandbox": true, "sku": "J71szsNmnqZSWdEy", "status": "REFUNDING", "statusReason": "4WNfTvD5UcES1eLM", "subscriptionId": "Zs9lSQVDp16qVIqX", "subtotalPrice": 58, "targetNamespace": "232SjktijiNzTUe8", "targetUserId": "KdizXmrmK0sCUsqx", "tax": 74, "totalPrice": 29, "totalTax": 4, "txEndTime": "1999-10-02T00:00:00Z", "type": "OTvOmfVNJNDaSO3F", "userId": "Ekk4It6V8Bu7rIjG", "vat": 36}' \
    > test.out 2>&1
eval_tap $? 295 'ProcessUserOrderNotification' test.out

#- 296 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KhvHPlvYanGqEkn9' \
    --userId 'OEVwLWGT4MXhmzvR' \
    > test.out 2>&1
eval_tap $? 296 'DownloadUserOrderReceipt' test.out

#- 297 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qb7c0vmjWq9fQqzu' \
    --body '{"currencyCode": "lLGfQMqSLQDlRFYM", "currencyNamespace": "VfiAMa6Pco7Mfvik", "customParameters": {"slpyL9BYLVVznF6h": {}, "MYfksp8VQhYSFeBO": {}, "p0ilGQFwHUtZugbl": {}}, "description": "T3aIDKn9qJXncm5i", "extOrderNo": "gpAewbmnWk0E7YaP", "extUserId": "blcWEyNgvs5LEZrQ", "itemType": "SUBSCRIPTION", "language": "NtV-fh", "metadata": {"dj6AspWBfRnLcLbp": "7OmcrDJ7u1rrRPcn", "G89rnNW1Yjfn8lY4": "DnYRxY8ZhHeb0CaP", "FDjrSotKnpJWALpT": "oj9rgr5RffM5JXvP"}, "notifyUrl": "dzEpDln04F8BQjzo", "omitNotification": false, "platform": "NJtqXltZF6aSRmHU", "price": 20, "recurringPaymentOrderNo": "iR3hXIbzWPKOkzft", "region": "OgDQAWhulbrDf7q4", "returnUrl": "cAnpmLiEu4CNtX2l", "sandbox": false, "sku": "HK5fbqioeoRIplY0", "subscriptionId": "DIzRCNAO6ZpqXJmP", "title": "Jso6M11LLZWKgWxn"}' \
    > test.out 2>&1
eval_tap $? 297 'CreateUserPaymentOrder' test.out

#- 298 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '9YL16HQdtAneXGgx' \
    --userId 'Ng33ZIUrIkfmdXVv' \
    --body '{"description": "aPQzzKdFg7N7piT8"}' \
    > test.out 2>&1
eval_tap $? 298 'RefundUserPaymentOrder' test.out

#- 299 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'VcrXLZnuMNpKEIs3' \
    > test.out 2>&1
eval_tap $? 299 'GetUserPlatformAccountClosureHistories' test.out

#- 300 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'GC9VTK7tkJWFpHt7' \
    --body '{"code": "MdKu9Xwn5GHJDGat", "orderNo": "rYOMO91CYEjX867n"}' \
    > test.out 2>&1
eval_tap $? 300 'ApplyUserRedemption' test.out

#- 301 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '9PT9fR7mMuBXPDKC' \
    --body '{"meta": {"riRKzTZ7TXAVRnUV": {}, "bxEJcKHE764EwhQf": {}, "xFKIOGT1WKSmLoA0": {}}, "reason": "ILaESC1GJXsoBwqh", "revokeEntries": [{"currency": {"balanceOrigin": "System", "currencyCode": "TQXa2j7v3zQJoQLT", "namespace": "AlW75icIKUpXazsF"}, "entitlement": {"entitlementId": "rmaGNoi3RPTgWotL"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "xd8EgE15XNuw6Y7s", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 88, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Xbox", "currencyCode": "JnADXC2y0DY1E1SM", "namespace": "K9oA4vK56dsYI5SK"}, "entitlement": {"entitlementId": "V5pDANyJ184miBhd"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "Jt81fmLSyGuu5rbJ", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 72, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "RMtwApGbXnR3yC6f", "namespace": "2MHGGedk0KzXRclO"}, "entitlement": {"entitlementId": "XdPYZQxBnttu4yW5"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "rVPX6r5ZTcnVVOKM", "itemIdentityType": "ITEM_SKU", "origin": "Oculus"}, "quantity": 32, "type": "ENTITLEMENT"}], "source": "DLC", "transactionId": "oswEPTvzwwGnpbx8"}' \
    > test.out 2>&1
eval_tap $? 301 'DoRevocation' test.out

#- 302 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'MCIjKzylqW8auyse' \
    --body '{"gameSessionId": "P9wEEyYAnHPp4XzV", "payload": {"L5McglFCrjxqqxAY": {}, "qXG2V3baMkZ9JCqB": {}, "IkUID0EE9InZNLww": {}}, "scid": "AhW2b5OHKtUv4lTk", "sessionTemplateName": "QNjxhXdj1CG0EBgs"}' \
    > test.out 2>&1
eval_tap $? 302 'RegisterXblSessions' test.out

#- 303 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 't9Qu8Ofl2oB8VTjF' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'ro4hhwnANAGp8zGq' \
    --limit '81' \
    --offset '90' \
    --sku 'GrcQyoA1TWPcy83i' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 303 'QueryUserSubscriptions' test.out

#- 304 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pa6GOuV5z0p8jaJs' \
    --excludeSystem  \
    --limit '6' \
    --offset '59' \
    --subscriptionId 'uQqawPrxi6F4elhy' \
    > test.out 2>&1
eval_tap $? 304 'GetUserSubscriptionActivities' test.out

#- 305 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '9CZ94CAUVW8FoEf8' \
    --body '{"grantDays": 39, "itemId": "iDFh5RbW021cHN3Q", "language": "bzVuJZH3k54cExxW", "reason": "KtdGTW4FILotv5yc", "region": "Ta0i6ifYP1zfgjsy", "source": "3VRjX4qA4g9OGoWw"}' \
    > test.out 2>&1
eval_tap $? 305 'PlatformSubscribeSubscription' test.out

#- 306 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '1qnCAvdnAcokJ0rz' \
    --itemId 'qX2KJcYHgiFDxclB' \
    > test.out 2>&1
eval_tap $? 306 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 307 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Xap6j73doCWxhubM' \
    --userId 'XbxNvT6wAffv4uzK' \
    > test.out 2>&1
eval_tap $? 307 'GetUserSubscription' test.out

#- 308 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'AwiI4wTxNIefCmtr' \
    --userId 'xWu293551nQBNKcq' \
    > test.out 2>&1
eval_tap $? 308 'DeleteUserSubscription' test.out

#- 309 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CkUXRj8gQHEe4CO3' \
    --userId '70OsbzRKKPd6mjzL' \
    --force  \
    --body '{"immediate": true, "reason": "slEYM8ngVT1ewVxv"}' \
    > test.out 2>&1
eval_tap $? 309 'CancelSubscription' test.out

#- 310 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'gAocOqsd5v5n7eXC' \
    --userId 'o9gZWdxfIdW8fNAM' \
    --body '{"grantDays": 10, "reason": "YdHivK2Q0WwolQy0"}' \
    > test.out 2>&1
eval_tap $? 310 'GrantDaysToSubscription' test.out

#- 311 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '37hJMOEv5W0v25yA' \
    --userId 'ObZIbrA8XAKKWMDe' \
    --excludeFree  \
    --limit '2' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 311 'GetUserSubscriptionBillingHistories' test.out

#- 312 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ehSjpt0wrfWPXaI1' \
    --userId 'Jb75o2MFOa6xgPt6' \
    --body '{"additionalData": {"cardSummary": "9QROGDeJCyHvUsnL"}, "authorisedTime": "1982-02-03T00:00:00Z", "chargebackReversedTime": "1985-06-16T00:00:00Z", "chargebackTime": "1994-08-09T00:00:00Z", "chargedTime": "1974-05-31T00:00:00Z", "createdTime": "1993-01-19T00:00:00Z", "currency": {"currencyCode": "Hvs25eiQO3oWdgXd", "currencySymbol": "m1IxL1OtleUBqBO0", "currencyType": "VIRTUAL", "decimals": 10, "namespace": "jxLNnYUlGQsFpy9Z"}, "customParameters": {"VlLIFwLgT78nootf": {}, "Us9559ilm3cauhrw": {}, "9Yn2z5cnbm7z2Aa2": {}}, "extOrderNo": "4yBTw3wfNGyWf3Vu", "extTxId": "jS7Bq5bcfPW4pPZB", "extUserId": "9YXltCxyztUnj17t", "issuedAt": "1999-02-20T00:00:00Z", "metadata": {"Th5mOwPCPKVPlOGf": "FBlu2ZP0IkiYXGk6", "BoBmSLi0R7zDFMoN": "TQmlS8lMlY8Ujprh", "CxhzW6ZM7LkTVrtV": "JZVhxCVdjPutJ8dk"}, "namespace": "AVOJ5imghdfVhjnj", "nonceStr": "d66A1SQmWGSQLAVP", "paymentData": {"discountAmount": 53, "discountCode": "W8tkTURUFmqNc8xh", "subtotalPrice": 88, "tax": 92, "totalPrice": 33}, "paymentMethod": "2MaIP7PjngEFggq9", "paymentMethodFee": 26, "paymentOrderNo": "cpgvoDBgYfLBdGNA", "paymentProvider": "XSOLLA", "paymentProviderFee": 63, "paymentStationUrl": "K6ZuvlzGCII156hI", "price": 13, "refundedTime": "1975-05-28T00:00:00Z", "salesTax": 14, "sandbox": false, "sku": "8HIxpzm9AcFhH4Zl", "status": "REQUEST_FOR_INFORMATION", "statusReason": "EshmZf5fEdvjbyJP", "subscriptionId": "Q1qdRcJjsme1OukI", "subtotalPrice": 12, "targetNamespace": "H6fNekhk077gxaj5", "targetUserId": "5huTA6AvmW0567BF", "tax": 33, "totalPrice": 22, "totalTax": 2, "txEndTime": "1997-05-21T00:00:00Z", "type": "6nuUEGJ3k0HGtpK4", "userId": "3uORGREOOwTuY8dh", "vat": 81}' \
    > test.out 2>&1
eval_tap $? 312 'ProcessUserSubscriptionNotification' test.out

#- 313 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'TxWXSdTiKdva2URE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oBSFtCLy2CqgCG7J' \
    --body '{"count": 47, "orderNo": "Wuv3j8T9g1f6P3D3"}' \
    > test.out 2>&1
eval_tap $? 313 'AcquireUserTicket' test.out

#- 314 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVcC2g6t42jE1Wad' \
    > test.out 2>&1
eval_tap $? 314 'QueryUserCurrencyWallets' test.out

#- 315 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode '232YV7A2zHFGbN8A' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QaCaw9UF7cdSDd99' \
    --body '{"allowOverdraft": true, "amount": 79, "balanceOrigin": "Xbox", "balanceSource": "EXPIRATION", "metadata": {"Z7vnTx8HDXTJWiyw": {}, "17ogzmbj4SLYDrZJ": {}, "vDLGvn6qtroZcp16": {}}, "reason": "HKXX1ft5nBA9xNIJ"}' \
    > test.out 2>&1
eval_tap $? 315 'DebitUserWalletByCurrencyCode' test.out

#- 316 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'VuMz04evSdE2FMcK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd7c94rEmIYuAT5OA' \
    --limit '5' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 316 'ListUserCurrencyTransactions' test.out

#- 317 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'UwYHGmG5rNDBF1oU' \
    --namespace "$AB_NAMESPACE" \
    --userId '37vjfyX5YLaM0wmi' \
    --request '{"amount": 17, "debitBalanceSource": "TRADE", "metadata": {"1WABBbq8IzZsMFLX": {}, "9ZhFXcFtfBS3ZIHo": {}, "fhwyM6Bw2sFGQ5DQ": {}}, "reason": "oDwzrKPOZZnV3zR7", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 317 'CheckBalance' test.out

#- 318 CheckWallet
eval_tap 0 318 'CheckWallet # SKIP deprecated' test.out

#- 319 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'xSu6addocg10Hy9j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x7gBHTOHHArjld0L' \
    --body '{"amount": 28, "expireAt": "1989-12-20T00:00:00Z", "metadata": {"Axm0Rdm9l6nIhG5S": {}, "ilDDIsmj4h625dIs": {}, "MKWBxF9RAIrI81ZR": {}}, "origin": "IOS", "reason": "oi9Fw25b9qXzlIK2", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 319 'CreditUserWallet' test.out

#- 320 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'pgzY9jLiAdMiQ7eD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkeBRMur18nCxiV9' \
    --request '{"amount": 3, "debitBalanceSource": "PAYMENT", "metadata": {"EhM3dKvIG9MR0hTI": {}, "Nvq1VR9SJUfQEX99": {}, "6Mh1sQ3Dw3uyjgQN": {}}, "reason": "As9188Qm3W1De2Mc", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 320 'DebitByWalletPlatform' test.out

#- 321 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'QpqCgxt0NgDSj1T6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EdeYFmrLT0HbvS4k' \
    --body '{"amount": 92, "metadata": {"VQ8tzwqMayP8A3HG": {}, "NI3BfjkFd6MHo6gG": {}, "Q5mChYoKD7yqCR03": {}}, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 321 'PayWithUserWallet' test.out

#- 322 GetUserWallet
eval_tap 0 322 'GetUserWallet # SKIP deprecated' test.out

#- 323 DebitUserWallet
eval_tap 0 323 'DebitUserWallet # SKIP deprecated' test.out

#- 324 DisableUserWallet
eval_tap 0 324 'DisableUserWallet # SKIP deprecated' test.out

#- 325 EnableUserWallet
eval_tap 0 325 'EnableUserWallet # SKIP deprecated' test.out

#- 326 ListUserWalletTransactions
eval_tap 0 326 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 327 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XivAL3n478mhb2I2' \
    > test.out 2>&1
eval_tap $? 327 'ListViews' test.out

#- 328 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'yBJeCJghTrk68FWF' \
    --body '{"displayOrder": 52, "localizations": {"EL8H4euLufhQj2KP": {"description": "3LLxl9Hs2L2wlpKB", "localExt": {"VURxHefz77a9fntC": {}, "NiHBRUNCPSre5GmZ": {}, "zCQwilS3IxSjlyvR": {}}, "longDescription": "9PxG9Lji2Vc88W8a", "title": "LjIxVGpdOqguxvRw"}, "I9ZBTipMRlhK9DMM": {"description": "aI4ryVDvNaruZxwT", "localExt": {"fh9gEs6GF247cbBL": {}, "jUr5z03wxB3E9hrE": {}, "9f9COFrOr6wJDBwI": {}}, "longDescription": "DsJHNg6TvNGjwI4T", "title": "bTwBufUorJouduhC"}, "EJ5XiKDIE9Yugcup": {"description": "LxVBcRkfhRuqkOTH", "localExt": {"Sia7oFd1fEmDuyAs": {}, "QGzwJR5poI718RQn": {}, "j4imu6XFfRcWDXhq": {}}, "longDescription": "1YmGeygr2S4Yw8Nm", "title": "PaBeryzX2hOPVVFq"}}, "name": "Vqxjq1iG3TySOh8S"}' \
    > test.out 2>&1
eval_tap $? 328 'CreateView' test.out

#- 329 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'I75oXbyq8FBbur80' \
    --storeId 'QwnlgAVfqz6gQJh8' \
    > test.out 2>&1
eval_tap $? 329 'GetView' test.out

#- 330 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'sn0bVWRkvmAemh8l' \
    --storeId 'ioBR7xTXcEIFod3l' \
    --body '{"displayOrder": 59, "localizations": {"O65KWh8ztRJkXxUA": {"description": "j3jzZvEaY103YUIM", "localExt": {"uSjDHz0zPWMZQNNP": {}, "2JqQqhISTBT1Gofv": {}, "4SuaZ8yCB9TVZnuz": {}}, "longDescription": "gvAZJRm71EC3ENuv", "title": "D8OPsp5Z3ez84KVB"}, "7HeWPnVeFdy5ezlC": {"description": "U6SGzkMpTL2wxobj", "localExt": {"xAbagqEmXn6U2VeV": {}, "2emK3JecJA4skqCb": {}, "PxRkIAFQh9yDdoLE": {}}, "longDescription": "2s7mrVrmTJwtBTzQ", "title": "TrNo1LcWNf7xHpi1"}, "JZJjIRtCfqDHSlo5": {"description": "4zSnRN0zGMworzym", "localExt": {"1z3ZdetOic9AQOFW": {}, "pdItLBhvKJq9tWz9": {}, "yui8a6jOflFJlZEh": {}}, "longDescription": "z1QDeh05hj92bwVV", "title": "xJ62Q5AOAOyL65cP"}}, "name": "aOZA8BG8KcVWOX9n"}' \
    > test.out 2>&1
eval_tap $? 330 'UpdateView' test.out

#- 331 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId '3YsjJexnFA9Umz3K' \
    --storeId 'PICya5Fk5TPaEbX2' \
    > test.out 2>&1
eval_tap $? 331 'DeleteView' test.out

#- 332 QueryWallets
eval_tap 0 332 'QueryWallets # SKIP deprecated' test.out

#- 333 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 18, "expireAt": "1972-01-30T00:00:00Z", "metadata": {"V8v7MXctihtxMnIr": {}, "4b7jyfL3zMkklGCP": {}, "ISlsnVA6z0uSfNNp": {}}, "origin": "Twitch", "reason": "y9tjRLVOXBMa0JiI", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "yBIQumxDfAxNqCUt", "userIds": ["izYM97ebZcYqwfIH", "PWMkOmrT5HL16jMw", "ECnmwJv4rpqtzDaz"]}, {"creditRequest": {"amount": 100, "expireAt": "1995-07-08T00:00:00Z", "metadata": {"JlBCHzJ2v9K8c1zO": {}, "lZg30pagfP0FfOMB": {}, "OpeQT4zYIbU4i9mL": {}}, "origin": "Playstation", "reason": "71VrhsISYtegQbNA", "source": "TRADE"}, "currencyCode": "cXkwjpAp82pGcxvX", "userIds": ["wirRo3A8WxnR0YaM", "aG9LzHpMS53jllop", "sF3f5KLtpTSsPMGD"]}, {"creditRequest": {"amount": 72, "expireAt": "1994-06-25T00:00:00Z", "metadata": {"OwEP5Bhh0NStWIgg": {}, "mhfAzVdNYP7Ao1z7": {}, "FeJM2fWXGk7JObSH": {}}, "origin": "IOS", "reason": "UlFGcP6eL7EpWtPi", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "CT6m6mRZAlLBczJV", "userIds": ["W7fNntaIEtDI6Mbh", "xKUxLjmxhBS6YypR", "eil7GbG1ISBCkcnp"]}]' \
    > test.out 2>&1
eval_tap $? 333 'BulkCredit' test.out

#- 334 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "xkQdezbmf392erso", "request": {"allowOverdraft": false, "amount": 77, "balanceOrigin": "GooglePlay", "balanceSource": "DLC_REVOCATION", "metadata": {"B48Jxp2zaItg9jTN": {}, "ZvpFEUI21aSaIsMy": {}, "LKPPIZx0zdNAagip": {}}, "reason": "ZwiaBrFrXtGMjujf"}, "userIds": ["HZB1gMI1B8DXb37D", "IySe36SA5dxATLv5", "ffTZ7yQz337LLNCj"]}, {"currencyCode": "PkLvraRzChdjDGdl", "request": {"allowOverdraft": false, "amount": 6, "balanceOrigin": "Playstation", "balanceSource": "IAP_REVOCATION", "metadata": {"2jHbAPNGInvbnf4e": {}, "wKFFLoGggX4gQWyZ": {}, "ocvYfr0Rnl02R1IV": {}}, "reason": "NnaK6KS71Xs1BphA"}, "userIds": ["9BXpKYgF9OuigDP0", "Vjmy7j2BrdCAm3sl", "CwaBqHpE55sjxBGi"]}, {"currencyCode": "jw0dQtZNonMrPkzU", "request": {"allowOverdraft": false, "amount": 42, "balanceOrigin": "IOS", "balanceSource": "PAYMENT", "metadata": {"ycAUlkUSZKUrsxNR": {}, "zF3NaUuCyQyze6zP": {}, "Ku5sE89JW8UU0RsB": {}}, "reason": "6dvrpmInhHYzVVlH"}, "userIds": ["xAndOj5O6IBwXJjg", "DUAbINRKQsxUO1YM", "GFSwjby6rMYkVQnZ"]}]' \
    > test.out 2>&1
eval_tap $? 334 'BulkDebit' test.out

#- 335 GetWallet
eval_tap 0 335 'GetWallet # SKIP deprecated' test.out

#- 336 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'QjgLoJyqwFVBd1Zj' \
    --end 'aRXEdWgS12bSbPgO' \
    --start 'CWUogizeWOPUMrqg' \
    > test.out 2>&1
eval_tap $? 336 'SyncOrders' test.out

#- 337 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["EIsMwNbfti0LoTBc", "NzyoCSw1t653G3yd", "YmGzvx9bSqqyAPha"], "apiKey": "5b6PQTPTytHeeXo7", "authoriseAsCapture": false, "blockedPaymentMethods": ["q3hbsApeASfR0ljK", "xqZcLuhwNDvValv3", "bkoMXNzl1ywEPiun"], "clientKey": "ixlEAHZzHs8x5oPS", "dropInSettings": "kZFIV2feXnTRlzAJ", "liveEndpointUrlPrefix": "y9oFOHB2KEsIdtoz", "merchantAccount": "VltBhoXE4wgcYT5C", "notificationHmacKey": "djaJuUzFIeqaVr1C", "notificationPassword": "E1gu6cYuzC77J4ir", "notificationUsername": "vZ9tktWLtDdlmVGK", "returnUrl": "6iolEw6IIpDc9X5i", "settings": "jmtDGvd9ESdY0eTk"}' \
    > test.out 2>&1
eval_tap $? 337 'TestAdyenConfig' test.out

#- 338 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "BWA44Qqsi5yOjvl5", "privateKey": "sRN2ENn1RLi5iMPn", "publicKey": "bg7o1zYpqUsliPyX", "returnUrl": "ZGYIW5ZDtWbdkzPP"}' \
    > test.out 2>&1
eval_tap $? 338 'TestAliPayConfig' test.out

#- 339 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "47RcUIi2CoNj4EG2", "secretKey": "emxKQk8cBrt5E8k8"}' \
    > test.out 2>&1
eval_tap $? 339 'TestCheckoutConfig' test.out

#- 340 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'rzDZ08j6ICP75cm8' \
    > test.out 2>&1
eval_tap $? 340 'DebugMatchedPaymentMerchantConfig' test.out

#- 341 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "YDChFi3zLvfQWC85", "webhookSecretKey": "MxWxvW0veFl3uU1a"}' \
    > test.out 2>&1
eval_tap $? 341 'TestNeonPayConfig' test.out

#- 342 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "MD0mczWxc8f1s2QP", "clientSecret": "MMZsf2dvKZyHChRP", "returnUrl": "HvdkcKW21B5EFtD2", "webHookId": "pYaKTz1gcE2XCwTk"}' \
    > test.out 2>&1
eval_tap $? 342 'TestPayPalConfig' test.out

#- 343 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["RUIX6IFHNmB9mYBv", "tOwxjqyrjDApeN5e", "AfRqSgH5xIuBTYOd"], "publishableKey": "svNyk52MQFkVVEf3", "secretKey": "6S7yPgG48bk6PwH1", "webhookSecret": "tdEAJSqXA0Wv0zWG"}' \
    > test.out 2>&1
eval_tap $? 343 'TestStripeConfig' test.out

#- 344 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "vkc6byp3mvyYT3Gu", "key": "aZVTxBlw1IWeXKFT", "mchid": "4rfSbbSlDPGf9Fn3", "returnUrl": "2SJNPZkEfkAcJTMS"}' \
    > test.out 2>&1
eval_tap $? 344 'TestWxPayConfig' test.out

#- 345 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "4pVRcCHIGfmCMTr9", "flowCompletionUrl": "ACnI2sMrEgl7ZR1H", "merchantId": 59, "projectId": 67, "projectSecretKey": "kf2Sw78lLGKjDHuX"}' \
    > test.out 2>&1
eval_tap $? 345 'TestXsollaConfig' test.out

#- 346 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 't358gzqRMuMPrIek' \
    > test.out 2>&1
eval_tap $? 346 'GetPaymentMerchantConfig1' test.out

#- 347 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'xq58fikq83hqJ7HP' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["63Se6kVW5fkl60Im", "LBv6nUU0r1rfX9st", "pvJUuyPdzx8BM2wE"], "apiKey": "gTtLRT5stwQFUEbT", "authoriseAsCapture": true, "blockedPaymentMethods": ["p7VMlxEXnqHwMyKp", "wphjUXvM1GqMkZ44", "UXgdBqtJaRyDlP9q"], "clientKey": "IZJ5Krx6KkHagEug", "dropInSettings": "KJxkU8Y58COtTNjn", "liveEndpointUrlPrefix": "NSikJDg6ujKvq0CI", "merchantAccount": "a1YCK9PlMeQprfgL", "notificationHmacKey": "GkHX1tdBjKmCBXET", "notificationPassword": "ZwqdzAX28DikGk8c", "notificationUsername": "WiX44azSHcwicUVq", "returnUrl": "2XPljTZj5R0yZSVQ", "settings": "8SSeJ4qy4PIKleuV"}' \
    > test.out 2>&1
eval_tap $? 347 'UpdateAdyenConfig' test.out

#- 348 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id '271bwZ4niLSzQnv0' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 348 'TestAdyenConfigById' test.out

#- 349 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'C00dtNGGzbGYSYo9' \
    --sandbox  \
    --validate  \
    --body '{"appId": "fY2EBZAHQXc4Xcae", "privateKey": "7VKl0ARzGEArlfE1", "publicKey": "NSmtcADoZvd0La7P", "returnUrl": "4JI4H7uDzkOHTdnU"}' \
    > test.out 2>&1
eval_tap $? 349 'UpdateAliPayConfig' test.out

#- 350 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'tdrRcs3GeOsKPNlG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 350 'TestAliPayConfigById' test.out

#- 351 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '7rEXi6LEqJERpbxE' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "q07txnvZZeAf7QBu", "secretKey": "ZK5GJlBncg8tQnJO"}' \
    > test.out 2>&1
eval_tap $? 351 'UpdateCheckoutConfig' test.out

#- 352 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'KHC16xjJZ4kiU3N8' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 352 'TestCheckoutConfigById' test.out

#- 353 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id '556ll2LQWpdESOBV' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "7wZJsg7wSv9lyRyT", "webhookSecretKey": "dYBUljvBzvYNEtfg"}' \
    > test.out 2>&1
eval_tap $? 353 'UpdateNeonPayConfig' test.out

#- 354 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'BFikt18cQ677SotD' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 354 'TestNeonPayConfigById' test.out

#- 355 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'EtU2xBSEQ8rBKc2K' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "6oJXxVEfnaqX8NuZ", "clientSecret": "tRUTKUvR69PImy6C", "returnUrl": "cwlqJ4MO3L8x1H5O", "webHookId": "gzHypgsSeKCvtPz7"}' \
    > test.out 2>&1
eval_tap $? 355 'UpdatePayPalConfig' test.out

#- 356 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'jagBG9a1TZ87ltCl' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 356 'TestPayPalConfigById' test.out

#- 357 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'c3RDXF5055tUleni' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["mjIbm0riCaNp8dUB", "DinAB6HqIWIi5Bvb", "1rcuEtWAF763kci7"], "publishableKey": "lT62BOHaso53W3U2", "secretKey": "Mu9ZGMWou1U0RVCf", "webhookSecret": "3gMWDAodCKqfqzee"}' \
    > test.out 2>&1
eval_tap $? 357 'UpdateStripeConfig' test.out

#- 358 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'xHA70NgJTxjtzgO7' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 358 'TestStripeConfigById' test.out

#- 359 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'W3taRvJ6lKWJwHO6' \
    --validate  \
    --body '{"appId": "5aOFDwpqy7XOU3Dw", "key": "glyMGNll4O8ELahc", "mchid": "NJqRjepck1l0qxRy", "returnUrl": "Q2pi7xuAufJakIPX"}' \
    > test.out 2>&1
eval_tap $? 359 'UpdateWxPayConfig' test.out

#- 360 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'OQznHZTj8oYfWOby' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 360 'UpdateWxPayConfigCert' test.out

#- 361 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'NJKVSQsaCokoGynp' \
    > test.out 2>&1
eval_tap $? 361 'TestWxPayConfigById' test.out

#- 362 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id '6xcqNKJnAhrSt96O' \
    --validate  \
    --body '{"apiKey": "aARAjHLGV3sNxS8u", "flowCompletionUrl": "LBZiVRYIyQLcslTE", "merchantId": 34, "projectId": 66, "projectSecretKey": "gVNG8AqktgvjwNJA"}' \
    > test.out 2>&1
eval_tap $? 362 'UpdateXsollaConfig' test.out

#- 363 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'wIpEy2ZNpojZ24I2' \
    > test.out 2>&1
eval_tap $? 363 'TestXsollaConfigById' test.out

#- 364 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'n25smsrmJFHGiYny' \
    --body '{"device": "DESKTOP", "showCloseButton": false, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 364 'UpdateXsollaUIConfig' test.out

#- 365 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '68' \
    --namespace "$AB_NAMESPACE" \
    --offset '48' \
    --region 'lQyMlgfkTsAThLyf' \
    > test.out 2>&1
eval_tap $? 365 'QueryPaymentProviderConfig' test.out

#- 366 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "CHECKOUT", "namespace": "rshpmb1C9Al7eWrb", "region": "NRE0xyYPUZHyLGQ5", "sandboxTaxJarApiToken": "2IjGpRJCUJpscOTk", "specials": ["PAYPAL", "WXPAY", "WXPAY"], "taxJarApiToken": "SJ04c5MGInO4yznh", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 366 'CreatePaymentProviderConfig' test.out

#- 367 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 367 'GetAggregatePaymentProviders' test.out

#- 368 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Znxgywmr4CYNGm7T' \
    > test.out 2>&1
eval_tap $? 368 'DebugMatchedPaymentProviderConfig' test.out

#- 369 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 369 'GetSpecialPaymentProviders' test.out

#- 370 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'k1mMyeNRsjQuDEgO' \
    --body '{"aggregate": "NEONPAY", "namespace": "MEQNL6ijLRvQOgoa", "region": "BooTawHLMxhx9nC3", "sandboxTaxJarApiToken": "o6pXU5MDJLCB6WbX", "specials": ["XSOLLA", "PAYPAL", "NEONPAY"], "taxJarApiToken": "BrdTnGrwHeWoQXPF", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 370 'UpdatePaymentProviderConfig' test.out

#- 371 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'Tj9rZpkSntuOeaPA' \
    > test.out 2>&1
eval_tap $? 371 'DeletePaymentProviderConfig' test.out

#- 372 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 372 'GetPaymentTaxConfig' test.out

#- 373 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "yPeEGBepK1Ix4Swj", "taxJarApiToken": "CYjCHniVSn1gYGal", "taxJarEnabled": true, "taxJarProductCodesMapping": {"mRE4X36KUOdfEmoI": "YwSxxAsfwDMivWqH", "HGlnAnEu6EKYceTE": "qYudHlA4AxeEIfUx", "J2xMSNNBxCeN3pGn": "46fGvodt413MRdG8"}}' \
    > test.out 2>&1
eval_tap $? 373 'UpdatePaymentTaxConfig' test.out

#- 374 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'qAPiANv2Ar8yXV6q' \
    --end 'f6v5SgcJPZPUh2nH' \
    --start 'QwpWi8HZ6C0VJ0fK' \
    > test.out 2>&1
eval_tap $? 374 'SyncPaymentOrders' test.out

#- 375 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '2m6lQ5Ao8TITYiHS' \
    --storeId 'R2SEJh1YDedZdNqk' \
    > test.out 2>&1
eval_tap $? 375 'PublicGetRootCategories' test.out

#- 376 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'XPWZfT8ZfdKp9q4n' \
    --storeId 'XuK0tJAYror2XdtS' \
    > test.out 2>&1
eval_tap $? 376 'DownloadCategories' test.out

#- 377 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'CG7ZExOoIpWzacOv' \
    --namespace "$AB_NAMESPACE" \
    --language 'wUsnIbQM3ZAtyEWK' \
    --storeId 'WoZRUL7wS3HaMTXA' \
    > test.out 2>&1
eval_tap $? 377 'PublicGetCategory' test.out

#- 378 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'X6y0STTN2sBEijjj' \
    --namespace "$AB_NAMESPACE" \
    --language 'pvSzGkED0oweFYDB' \
    --storeId 'Pyd1jJBxbrbuFay9' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetChildCategories' test.out

#- 379 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'PXgEQS4871QSmssp' \
    --namespace "$AB_NAMESPACE" \
    --language 'n5sNfifK65tvaH9j' \
    --storeId 'wcO48pthyYpBJDHI' \
    > test.out 2>&1
eval_tap $? 379 'PublicGetDescendantCategories' test.out

#- 380 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 380 'PublicListCurrencies' test.out

#- 381 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 381 'GeDLCDurableRewardShortMap' test.out

#- 382 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 382 'GetAppleConfigVersion' test.out

#- 383 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    > test.out 2>&1
eval_tap $? 383 'GetIAPItemMapping' test.out

#- 384 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'b3FsV2PnCs9R0D5j' \
    --region 'ZEwxcow6L7c3COEP' \
    --storeId '4AZx70uwV4XgvGTM' \
    --appId 'HkXeEwuFJf7tbq5K' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetItemByAppId' test.out

#- 385 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'ZI0fKW8LeQxItaK6' \
    --categoryPath 's3Hha69MgxjGJx62' \
    --features 'mkfVlu4bGB1pyk0P' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --language 'O9Bz2wx4kDAm8XIl' \
    --limit '9' \
    --offset '17' \
    --region 'mdlXTCL467xHbAiD' \
    --sortBy 'displayOrder:asc,name:desc,createdAt:asc' \
    --storeId 'BvniHdARadfSoctA' \
    --tags '3GYO94ZOo94gS5DH' \
    > test.out 2>&1
eval_tap $? 385 'PublicQueryItems' test.out

#- 386 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'LB65fxQ06GwTmobi' \
    --region 'Bnfrnq9kOFBWhUTP' \
    --storeId 'iKR3qcbHLGplYsS3' \
    --sku 'jsRZffCd00VrgPuN' \
    > test.out 2>&1
eval_tap $? 386 'PublicGetItemBySku' test.out

#- 387 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'tOv3jbhGBuW8KcyP' \
    --storeId 'MfDWSEEpKoJlmhMQ' \
    --itemIds 'UCx70QjYbzemOTUR' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetEstimatedPrice' test.out

#- 388 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'zzAOIBarB7kcer5S' \
    --region 'vPLeQZIpKFXgnsxx' \
    --storeId '3c2bUsO7FP8RmOst' \
    --itemIds 'ZAGDgiVsV2OttwJa' \
    > test.out 2>&1
eval_tap $? 388 'PublicBulkGetItems' test.out

#- 389 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["MxPDIJ5hFQHumFvP", "KqupHj72TlLs964i", "ABOgTKtnaA7O35Ia"]}' \
    > test.out 2>&1
eval_tap $? 389 'PublicValidateItemPurchaseCondition' test.out

#- 390 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'LOOTBOX' \
    --limit '17' \
    --offset '39' \
    --region 'iItrSrEJMBAIwTLk' \
    --storeId 'rMDFQfpQ9o0GJMTf' \
    --keyword 'qRRaZozM8xCBoaS2' \
    --language 'FMwfWNCbN5GelVOU' \
    > test.out 2>&1
eval_tap $? 390 'PublicSearchItems' test.out

#- 391 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '0hHnsCl5k6Jxh5mk' \
    --namespace "$AB_NAMESPACE" \
    --language 'mQzKg0jWCjpGwh7p' \
    --region 'LAi5JmzvM6JFKB8i' \
    --storeId 'kHpl3sNRaDEC2OkX' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetApp' test.out

#- 392 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'A3WqypoOw0H2s0si' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 392 'PublicGetItemDynamicData' test.out

#- 393 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'bQNBz81zRPntxpgi' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '7tXIcNEcGJjOCXpu' \
    --populateBundle  \
    --region 'ix5vnPeTu9evbRov' \
    --storeId '7Bm40CtZiAxk43DG' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetItem' test.out

#- 394 GetPaymentCustomization
eval_tap 0 394 'GetPaymentCustomization # SKIP deprecated' test.out

#- 395 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "V1SCkw8U0d4FvVmP", "successUrl": "MtpRMWSQ8Szi1IrG"}, "paymentOrderNo": "idRmR5BGRJhFwxmk", "paymentProvider": "XSOLLA", "returnUrl": "mYUvlkBGPJFaFzkA", "ui": "BC8zWMcYW5iRrw32", "zipCode": "FRg8y4rOuj7J6ijJ"}' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetPaymentUrl' test.out

#- 396 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bcycXmBcrJLb7lab' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetPaymentMethods' test.out

#- 397 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yotifVk9KyqceGv0' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetUnpaidPaymentOrder' test.out

#- 398 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'CEDTVSjINYeKLowG' \
    --paymentProvider 'WALLET' \
    --zipCode 'QB9pXzuCK5qd2m8A' \
    --body '{"token": "5axixm9X9TXNhN8y"}' \
    > test.out 2>&1
eval_tap $? 398 'Pay' test.out

#- 399 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1PVriIyv9kjuiAGi' \
    > test.out 2>&1
eval_tap $? 399 'PublicCheckPaymentOrderPaidStatus' test.out

#- 400 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'x47etMikLFggYDc2' \
    > test.out 2>&1
eval_tap $? 400 'GetPaymentPublicConfig' test.out

#- 401 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'FMbzZoeKagnKf2Yi' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetQRCode' test.out

#- 402 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'fzvr9OqTsInGzHFp' \
    --foreinginvoice 'FXYJtHtqwoIwQBeI' \
    --invoiceId 'ALI8JNIII4jrzrPs' \
    --payload 'uMziNM8AB7RRxiZH' \
    --redirectResult '3ngnitURdMjZLYCa' \
    --resultCode 'eklQcFY1QIk1h5EK' \
    --sessionId 'vMGd6hQ2mHjmLu4o' \
    --status 'FlReHy0JyZv7honq' \
    --token 'eiGTTqpgVsY1kPNd' \
    --type 'JiJXB3yjNUPIfvoX' \
    --userId 'RO0CkW1ZcgUSbbnf' \
    --orderNo 'fBWRaJN1SjCFLDNJ' \
    --paymentOrderNo 'fAhJGwSYEZjEb0Pv' \
    --paymentProvider 'WALLET' \
    --returnUrl '5fEk9s11bFXkf7rQ' \
    > test.out 2>&1
eval_tap $? 402 'PublicNormalizePaymentReturnUrl' test.out

#- 403 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'J4Kj7Qyo9tUptiyZ' \
    --paymentOrderNo 'zRX8Y4rxRWZPe4ZL' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 403 'GetPaymentTaxValue' test.out

#- 404 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'vV7W6ADLtn7oInn1' \
    > test.out 2>&1
eval_tap $? 404 'GetRewardByCode' test.out

#- 405 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Bz3wM3BI51etn17O' \
    --limit '5' \
    --offset '59' \
    --sortBy 'namespace:asc,rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 405 'QueryRewards1' test.out

#- 406 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'nn7f2d8SOWP2dw6U' \
    > test.out 2>&1
eval_tap $? 406 'GetReward1' test.out

#- 407 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 407 'PublicListStores' test.out

#- 408 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'y88WpQalG38VOo82,aLD9jUjuDITjifWR,bmtK7MTxcCWnMiCL' \
    --itemIds 'sjroKHPApA8GsGwy,ocvY9NePjLJQJXwU,ApJWohXn01RB7pu7' \
    --skus 'BaONXyE5fIDbsMi4,8xOYVvEcEm53BYMB,acQBIuDVs7U0AJtW' \
    > test.out 2>&1
eval_tap $? 408 'PublicExistsAnyMyActiveEntitlement' test.out

#- 409 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'PRteszMTd0R5Fsrf' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 410 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --itemId 'xbVfgvG617GmxzCl' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 411 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --sku 'VXe4xBPDWHRHCCVD' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 412 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'BRjPUQWYVxGQVFJl,DDJ7z4Pb5jyGID39,Ung1D57FjYKlJiRI' \
    --itemIds 'vhej77OSPwdzMSmr,SvQdsAdTUGpd8KFr,XKFA2gdjQCYoE8b0' \
    --skus 'CZetLfpFNyp7375r,hOmR4zFjoJZVKZjO,D2ePKAKYjJMVnYj2' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetEntitlementOwnershipToken' test.out

#- 413 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "yKqavWpydepM3ap0", "language": "UcT_469", "region": "oebnS4Y2zkGYTr9y"}' \
    > test.out 2>&1
eval_tap $? 413 'SyncTwitchDropsEntitlement' test.out

#- 414 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'JIveX52r6Inl9VTJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 414 'PublicGetMyWallet' test.out

#- 415 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9Al3mn2DsHDHzSV' \
    --body '{"epicGamesJwtToken": "JzhU5Z44zgZ1fieL"}' \
    > test.out 2>&1
eval_tap $? 415 'SyncEpicGameDLC' test.out

#- 416 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'dl3Y82DOj5kPuNRZ' \
    > test.out 2>&1
eval_tap $? 416 'SyncOculusDLC' test.out

#- 417 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZaUccuBYep9n7b17' \
    --body '{"serviceLabel": 12}' \
    > test.out 2>&1
eval_tap $? 417 'PublicSyncPsnDlcInventory' test.out

#- 418 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'gVvLSJvdsGpmmUeM' \
    --body '{"serviceLabels": [64, 17, 21]}' \
    > test.out 2>&1
eval_tap $? 418 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 419 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'W3s54zffAL2DZ7gB' \
    --body '{"appId": "hy77iRVFfFvWenMN", "steamId": "V00KVuLF9WDnGO3b"}' \
    > test.out 2>&1
eval_tap $? 419 'SyncSteamDLC' test.out

#- 420 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQWmnS52ZuuuI7F1' \
    --body '{"xstsToken": "xpVrcoXzSOEGEDYf"}' \
    > test.out 2>&1
eval_tap $? 420 'SyncXboxDLC' test.out

#- 421 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'iGPYo2K3dN3YBOJf' \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'V6SuHovoQlk5wL2o' \
    --features 'XDZ20Bw2H4tz6KUC,4jXGj2G0GZ3JBYi9,bBKBRpdbLCiwxOx2' \
    --itemId 'XQn94xPqXhqeNMDG,A3O5hQAl6U2g9imV,Mh3i7j095rDL6lEu' \
    --limit '57' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 421 'PublicQueryUserEntitlements' test.out

#- 422 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZIMIs1dFvYokH9t' \
    --appId '2u8ZZnyHKkk6Gh25' \
    > test.out 2>&1
eval_tap $? 422 'PublicGetUserAppEntitlementByAppId' test.out

#- 423 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'tEcX9GegDnrYz0GF' \
    --limit '32' \
    --offset '94' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 423 'PublicQueryUserEntitlementsByAppType' test.out

#- 424 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'VdxFsXAp1roclyXl' \
    --availablePlatformOnly  \
    --ids 'lFitPamSKRzDIZgS,k6suS90ZbDdmjU11,QIZtkSn8QRbA5V4g' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetUserEntitlementsByIds' test.out

#- 425 PublicGetUserEntitlementByItemId
eval_tap 0 425 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 426 PublicGetUserEntitlementBySku
eval_tap 0 426 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 427 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWv1W6cqnvSuKswQ' \
    --endDate '7vH8GScnP5QzRBY1' \
    --entitlementClazz 'OPTIONBOX' \
    --limit '17' \
    --offset '35' \
    --startDate 'bq3Qcrtt8L5dIebs' \
    > test.out 2>&1
eval_tap $? 427 'PublicUserEntitlementHistory' test.out

#- 428 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'w7EjkMnJSziEA43W' \
    --appIds 'qIMJdrqHIsJ98WRj,qYieXRthQZvzRi7p,qpajYEHs9TIkcnrJ' \
    --itemIds '64BOKqywS6DKNSeb,2UMWOgVeYkCvqq0t,O15pEVG7sNihxpuu' \
    --skus 'L7DJCxvzZnh8oBAk,1MNCAUmdnLaVRUu5,VbjwPa9rYgHaxeTT' \
    > test.out 2>&1
eval_tap $? 428 'PublicExistsAnyUserActiveEntitlement' test.out

#- 429 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '3ebuaYPNBp9wA4Lx' \
    --appId 'O2n7WJQFzBCD9S03' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 430 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'D7JLsIM3VOMRvvqk' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'V0NtCxDDz5rxt6Lf' \
    > test.out 2>&1
eval_tap $? 430 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 431 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'lBJjokLAaL4oAF2l' \
    --ids 'qx8yneWKrOy4xcg3,0BqC5W7g7hiwumJT,I3jlZPjoCdGiIP6c' \
    > test.out 2>&1
eval_tap $? 431 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 432 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'B3Pj63MJXIuLWYb2' \
    --entitlementClazz 'CODE' \
    --sku 'GObyWCLyFPHaxkKx' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 433 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'EDvSoi2X9SygvMG8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAaWUhIguMvKDOrx' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserEntitlement' test.out

#- 434 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId '0wQXKEroyKz2reP6' \
    --namespace "$AB_NAMESPACE" \
    --userId '3EVHT72VuhoGP2IF' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["U5hujEfCMt95DEjx", "qhgYqmMqIdlRrQmu", "ILkeRUafUDP5b6BW"], "requestId": "fm7cYCpDIJG42ILh", "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 434 'PublicConsumeUserEntitlement' test.out

#- 435 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'BcKQytQagui6lsKF' \
    --namespace "$AB_NAMESPACE" \
    --userId '28n7UC7y1MKYVeoG' \
    --body '{"requestId": "FrDb8unXv1iE7YgE", "useCount": 88}' \
    > test.out 2>&1
eval_tap $? 435 'PublicSellUserEntitlement' test.out

#- 436 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'spOJ0NiZl6OVLxKt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kBpaCG8Nu5m4ctwU' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 80}' \
    > test.out 2>&1
eval_tap $? 436 'PublicSplitUserEntitlement' test.out

#- 437 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'cebaJ0DCuIeEStt3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PbyctX7HC2haQwVW' \
    --body '{"entitlementId": "ONEpAPedzI2Adlqi", "metadata": {"operationSource": "INVENTORY"}, "useCount": 62}' \
    > test.out 2>&1
eval_tap $? 437 'PublicTransferUserEntitlement' test.out

#- 438 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'EJIQcbZJJ3AhkrMi' \
    --body '{"code": "0bnppEJFISze88rG", "language": "JRO_993", "region": "WhaW6jNsM94E2FQb"}' \
    > test.out 2>&1
eval_tap $? 438 'PublicRedeemCode' test.out

#- 439 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6S0VmaTR7E3mkDSQ' \
    --body '{"excludeOldTransactions": false, "language": "Gl", "productId": "WUUVEHCB5wzF6oLI", "receiptData": "rAwjAsgo51XHJBG2", "region": "PmyeFaBiT3SyLHXZ", "transactionId": "SyfjukWmkfkiF2GZ"}' \
    > test.out 2>&1
eval_tap $? 439 'PublicFulfillAppleIAPItem' test.out

#- 440 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'PuyWBVH66JU1IICV' \
    --body '{"epicGamesJwtToken": "NNRV4lBToTcn1l44"}' \
    > test.out 2>&1
eval_tap $? 440 'SyncEpicGamesInventory' test.out

#- 441 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ebrKEKdeo779KG5y' \
    --body '{"autoAck": true, "autoConsume": false, "language": "ecK_orXk-xe", "orderId": "5ALS7cneNLItUJgh", "packageName": "74tyxkTR8ZCVJtkx", "productId": "jBJrNeQRsqkkKK2q", "purchaseTime": 48, "purchaseToken": "cCPaLXJM2B9bMohk", "region": "WsFKIdycYHQcu7Jk", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 441 'PublicFulfillGoogleIAPItem' test.out

#- 442 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'A6A6rYiIu8eLdWyk' \
    > test.out 2>&1
eval_tap $? 442 'SyncOculusConsumableEntitlements' test.out

#- 443 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'hBxLFnKnSYC9yyBY' \
    --body '{"currencyCode": "epIqtrikdAbdOT6i", "price": 0.7097949612784702, "productId": "RdEg8NYuc4q5sJVz", "serviceLabel": 1}' \
    > test.out 2>&1
eval_tap $? 443 'PublicReconcilePlayStationStore' test.out

#- 444 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8WPQGPclChxLfbX' \
    --body '{"currencyCode": "rH6f2GDrNbLOjGz3", "price": 0.914441095970708, "productId": "ct0ctEeH43wYuLnI", "serviceLabels": [93, 28, 5]}' \
    > test.out 2>&1
eval_tap $? 444 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 445 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4pBcPPaiaM1og5r' \
    --body '{"appId": "xUjGPKKLMoAy1stm", "currencyCode": "xPFz0i1IK3QzkcRw", "language": "FqBQ_LlAt-059", "price": 0.052692640821649706, "productId": "l6fLkxFnAqyvjBy0", "region": "NXg7zd6SFpkV7cAI", "steamId": "CgWFJZGnNa5yOM68"}' \
    > test.out 2>&1
eval_tap $? 445 'SyncSteamInventory' test.out

#- 446 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'fhVKIbRvUnyElHPu' \
    --activeOnly  \
    --groupId 'QE3Gc8bY4IH0OXHZ' \
    --limit '86' \
    --offset '13' \
    --productId '6VVB7qjDHMS49dkv' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserThirdPartySubscription' test.out

#- 447 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8vxyg6giNKzeFnlg' \
    --body '{"gameId": "GRgYK3SeYvULYNIh", "language": "Vgr_GkPT", "region": "GoBIjCKlD3axSivI"}' \
    > test.out 2>&1
eval_tap $? 447 'SyncTwitchDropsEntitlement1' test.out

#- 448 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'tV1txLINmdHTGLtX' \
    --body '{"currencyCode": "6TN5ctYX1sZnYF3h", "price": 0.7801927300920823, "productId": "mCCIrP0lJXexseo2", "xstsToken": "e6BCNJTTRIHDKdVf"}' \
    > test.out 2>&1
eval_tap $? 448 'SyncXboxInventory' test.out

#- 449 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'OUr14yZH00n8MsRj' \
    --discounted  \
    --itemId 'aB8iurBWW5jSJi0s' \
    --limit '8' \
    --offset '71' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 449 'PublicQueryUserOrders' test.out

#- 450 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'JayvSNt8EQXsMbYi' \
    --body '{"currencyCode": "1yEI9ychtyhjZSeD", "discountCodes": ["CKT4ilZB8apDTR3a", "L9sunWp7V1s8LmXm", "0FaJMIjgzU02nZWw"], "discountedPrice": 57, "ext": {"rryS5a6A4tL8YKMr": {}, "UBL6dDTVwPIt1hrg": {}, "2mhbI0NDshb7ZzQu": {}}, "itemId": "BPyNi1GhZHEj6p5g", "language": "NJe-082", "price": 68, "quantity": 38, "region": "qlTTkL8cmpA0sZ0t", "returnUrl": "geR4UV5SMZ8GUvWZ", "sectionId": "voCmprkv7A8MRutC"}' \
    > test.out 2>&1
eval_tap $? 450 'PublicCreateUserOrder' test.out

#- 451 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCsqmx2zriOGB8b5' \
    --body '{"currencyCode": "qTFp3cIxOI33nt54", "discountCodes": ["Y9WqSRiwV3UZg0UJ", "h1fYXF6R9Rz3HVP2", "i5hdAezedcppbujZ"], "discountedPrice": 77, "itemId": "MGgET2yS6C8a8L0v", "price": 87, "quantity": 11}' \
    > test.out 2>&1
eval_tap $? 451 'PublicPreviewOrderPrice' test.out

#- 452 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DS4EVpBmsUzx64Gr' \
    --userId '4XEm0uYYuAmqhftI' \
    > test.out 2>&1
eval_tap $? 452 'PublicGetUserOrder' test.out

#- 453 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'fe2zdqZ7ht1vUiJ7' \
    --userId 'jBXy8psNoHNalwgv' \
    > test.out 2>&1
eval_tap $? 453 'PublicCancelUserOrder' test.out

#- 454 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ju62rPFMbE1cW57G' \
    --userId 'aNZLT1z0GqDZN7ft' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserOrderHistories' test.out

#- 455 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'HOhVy48YYg1AkRh3' \
    --userId 'NmbRhMxKeIgwq1NZ' \
    > test.out 2>&1
eval_tap $? 455 'PublicDownloadUserOrderReceipt' test.out

#- 456 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'mxa0ghRG020QpWTN' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetPaymentAccounts' test.out

#- 457 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'KsVyK8EU8JYc00PA' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'ef1jFeqQ8mBpTuvL' \
    > test.out 2>&1
eval_tap $? 457 'PublicDeletePaymentAccount' test.out

#- 458 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJUzwXJFaWW3JVdY' \
    --autoCalcEstimatedPrice  \
    --language 'pfHOYoLva2c4JscE' \
    --region 'QfBFZXcSXpU81S5H' \
    --storeId '9XsZyvZOFJ5RrFZY' \
    --viewId 'cwfQ1Q2BbcjSpv6N' \
    > test.out 2>&1
eval_tap $? 458 'PublicListActiveSections' test.out

#- 459 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 't1oz4tdgfKu4bmK8' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'vIDQI2uIi2SNZKql' \
    --limit '73' \
    --offset '83' \
    --sku 'sdnY04DIyosprZPB' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 459 'PublicQueryUserSubscriptions' test.out

#- 460 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'uM0OXOHPluvsry8A' \
    --body '{"currencyCode": "KSZxOhUhl3Y0Esha", "itemId": "G0uDiJNUuxK22saW", "language": "Xi-SaZm_827", "region": "5FYaSgewLWHcBxz5", "returnUrl": "LpdkRCAU8HhmXC68", "source": "JFPdxhvBKee6wG66"}' \
    > test.out 2>&1
eval_tap $? 460 'PublicSubscribeSubscription' test.out

#- 461 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'YPD4vNdENY1r1rI0' \
    --itemId 'T97qA1OiblWlz2LX' \
    > test.out 2>&1
eval_tap $? 461 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 462 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QNqcONcJIsYRQz97' \
    --userId 'fRWI17eNP3Y2nWlS' \
    > test.out 2>&1
eval_tap $? 462 'PublicGetUserSubscription' test.out

#- 463 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9Sfjh0htyVaGj4y9' \
    --userId 'ahS7h7XVlmc5Rs5F' \
    > test.out 2>&1
eval_tap $? 463 'PublicChangeSubscriptionBillingAccount' test.out

#- 464 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VQSIqObR55tV0BlN' \
    --userId '1iFvw0GSLBmie8SJ' \
    --body '{"immediate": false, "reason": "AdpLVTVsj9pDiyyb"}' \
    > test.out 2>&1
eval_tap $? 464 'PublicCancelSubscription' test.out

#- 465 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XY4v7JRFMRaeIaQu' \
    --userId 'PWPlkxeotrNakKGv' \
    --excludeFree  \
    --limit '83' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 465 'PublicGetUserSubscriptionBillingHistories' test.out

#- 466 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'JDpvZgvPGHjV7MNT' \
    --language 'pM7fSods1zdVT0aW' \
    --storeId 'j58Othvd3jzMDAf4' \
    > test.out 2>&1
eval_tap $? 466 'PublicListViews' test.out

#- 467 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode '0gKSizvmxts5HSQv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RAPG9JoVSLrbs5ni' \
    > test.out 2>&1
eval_tap $? 467 'PublicGetWallet' test.out

#- 468 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'XkjpkOgRCC7qfz5j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V7NTRYld9FJJ10go' \
    --limit '80' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 468 'PublicListUserWalletTransactions' test.out

#- 469 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 469 'PublicGetMyDLCContent' test.out

#- 470 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime '2AaBRalz5HEm4Gan' \
    --limit '40' \
    --offset '64' \
    --startTime '6aqjKzWDAauqLKar' \
    --state 'FULFILLED' \
    --transactionId 'wfol07696uxp5ieM' \
    --userId 'jjOfFSx3AJN97kUj' \
    > test.out 2>&1
eval_tap $? 470 'QueryFulfillments' test.out

#- 471 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate '9NfLTFJGOzAIAqpm' \
    --baseAppId 'kDdFSs4s7u1VUuLm' \
    --categoryPath 'enyxTQVkEg5wouUK' \
    --features 'a35m8oH9zCfw7mCM' \
    --includeSubCategoryItem  \
    --itemName 'kbvSIm7JROcwVmGy' \
    --itemStatus 'INACTIVE' \
    --itemType 'SUBSCRIPTION,MEDIA,EXTENSION' \
    --limit '31' \
    --offset '29' \
    --region 'nTPF4VrRiFSPs2ZM' \
    --sectionExclusive  \
    --sortBy 'displayOrder,name,name:asc' \
    --storeId 'FcrixULzSeTnUWGx' \
    --tags 'xfnMIDSCPr1m1Fg6' \
    --targetNamespace 'tc250c2okDTem6o6' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 471 'QueryItemsV2' test.out

#- 472 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '2xFY6TNqoLFFS4wB' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 472 'ImportStore1' test.out

#- 473 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '6Um7ir0n6O3vbYVj' \
    --body '{"itemIds": ["rcErgoApAxyDnHjA", "x7rZTvew0WVDSMNr", "23LV7xZEEv7O1lwx"]}' \
    > test.out 2>&1
eval_tap $? 473 'ExportStore1' test.out

#- 474 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VTRll0GIEUJtMC8N' \
    --body '{"entitlementCollectionId": "yV2HLHZT3oYJlC4i", "entitlementOrigin": "GooglePlay", "metadata": {"Q6B074dTJZqeOllK": {}, "QNwJUGtC0tAhxn1a": {}, "y6ruu7PYWHODRb6s": {}}, "origin": "IOS", "rewards": [{"currency": {"currencyCode": "DT2tq2V2lMzfIQHC", "namespace": "Z90DqQgP6ynrQjYH"}, "item": {"itemId": "0N2loTnRa0KiQWPx", "itemName": "d1gqlwx9CE4WcsmY", "itemSku": "tCkIgcwiDWQFghmI", "itemType": "i6fphDw3p9QWqwTF"}, "quantity": 59, "type": "CURRENCY"}, {"currency": {"currencyCode": "4x11AS2jTKoTYeHa", "namespace": "CuN7zpX9vp4QJdCr"}, "item": {"itemId": "wkz0nw2oxKye8jZq", "itemName": "j7k0YiLqOUSBuwR3", "itemSku": "88REDRuYBnWiEsOn", "itemType": "DfIAN04f5kSONmw1"}, "quantity": 57, "type": "CURRENCY"}, {"currency": {"currencyCode": "DqqSctLL4WfGq8JC", "namespace": "DnwGWgccuzuc6QDR"}, "item": {"itemId": "MGdBPbUyHTYPS8CG", "itemName": "KXGon2ecc65YAFLw", "itemSku": "eD9Z7U2lNkorrw9Q", "itemType": "H3rNhDepQum4Dj7p"}, "quantity": 88, "type": "CURRENCY"}], "source": "PURCHASE", "transactionId": "RTGXGRkYXifTd5nA"}' \
    > test.out 2>&1
eval_tap $? 474 'FulfillRewardsV2' test.out

#- 475 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'OF9VV7JgCOm4wL72' \
    --userId '9Hma0nCdCEFcf2do' \
    --body '{"items": [{"duration": 57, "endDate": "1995-05-16T00:00:00Z", "entitlementCollectionId": "UfcL1qsegBsrNqeW", "entitlementOrigin": "Xbox", "itemId": "BxVe8iW7sGELnMdX", "itemSku": "RqdGPzxXvZPtrhje", "language": "VBnTrsYihhgbeAZo", "metadata": {"FncMUdmf8hD3nL1s": {}, "aQxLYrz08jh6Tyq7": {}, "WUilXgtf5UctyV3a": {}}, "orderNo": "Sw4twReM5DcHde3f", "origin": "IOS", "quantity": 3, "region": "Hf7tH8WTOTeBOcYh", "source": "DLC", "startDate": "1984-05-05T00:00:00Z", "storeId": "nGCnPjiIbJifs0ar"}, {"duration": 76, "endDate": "1993-07-12T00:00:00Z", "entitlementCollectionId": "99ecmenxguw5bO8V", "entitlementOrigin": "GooglePlay", "itemId": "Gvw7MqOsypCJmfRn", "itemSku": "W0spgvjt7eCLDu6P", "language": "A3PRnQtB410iWT0S", "metadata": {"ILVGXCWRucRpP1Tq": {}, "7uYXhB6FPfF5Dvve": {}, "MdBsPt19V2FkBPk0": {}}, "orderNo": "QLufK6eiT38raaRG", "origin": "System", "quantity": 45, "region": "g0hfM5vQmahJlT5O", "source": "REFERRAL_BONUS", "startDate": "1986-07-11T00:00:00Z", "storeId": "EMwAjgNZgto2EhOl"}, {"duration": 27, "endDate": "1994-05-31T00:00:00Z", "entitlementCollectionId": "MCRdxXOBu3TWmHDV", "entitlementOrigin": "Nintendo", "itemId": "1z37uuqLDQF12kYf", "itemSku": "BqeQxos58kVk7F1K", "language": "KOfFFLvER3xqCwUg", "metadata": {"Ka4oCBoJDxGa1UuS": {}, "r4ehnV8Aw9m6GvDS": {}, "E2F7Ad69Dln4mqFh": {}}, "orderNo": "gKKcGohdjQUwVdPs", "origin": "Playstation", "quantity": 36, "region": "mBRT39gKYLk9DmjJ", "source": "EXPIRATION", "startDate": "1979-02-27T00:00:00Z", "storeId": "PnpTXWAUt8lgqNM4"}]}' \
    > test.out 2>&1
eval_tap $? 475 'FulfillItems' test.out

#- 476 RetryFulfillItems
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'poGEvIKCe3MrLxmn' \
    --userId 'jmlAuaBCdhzXb6cB' \
    > test.out 2>&1
eval_tap $? 476 'RetryFulfillItems' test.out

#- 477 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'MPNMmjMi2uztFNfX' \
    --userId 'g0UvwaZ0py16ShGo' \
    > test.out 2>&1
eval_tap $? 477 'RevokeItems' test.out

#- 478 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mFzUappaaODZaZ6V' \
    --body '{"transactionId": "zztnntoxwsNtNxWo"}' \
    > test.out 2>&1
eval_tap $? 478 'V2PublicFulfillAppleIAPItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE