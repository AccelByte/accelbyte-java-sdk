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
echo "1..486"

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
    --body '{"entitlementGrantList": [{"collectionId": "ee9GXhKcjmSEwdrk", "endDate": "1986-05-09T00:00:00Z", "grantedCode": "nnqKzFsLfYalUlfw", "itemId": "EQKjU7eHGebSVu0L", "itemNamespace": "Q40kepEaC4dfiOMZ", "language": "Gf", "metadata": {"Hr39pysFO3Zvc1BZ": {}, "G99LyvfvHEsJKQQe": {}, "wVLMUoAnaRcYp7FU": {}}, "origin": "IOS", "quantity": 13, "region": "fIGaffoflEIByYqe", "source": "REDEEM_CODE", "startDate": "1991-09-21T00:00:00Z", "storeId": "0meGelYF5wWaDhuk"}, {"collectionId": "U4khGG4vZFTYnPkm", "endDate": "1993-09-02T00:00:00Z", "grantedCode": "u4PWam1jxR7SETWj", "itemId": "teoc8fgvZDDhoO05", "itemNamespace": "oKqymxLD1Lcvw6T6", "language": "Mf", "metadata": {"wxxElpMYSWIeVzm7": {}, "z9noowmlTIKVowi0": {}, "RY2VN4ZONJREdUQ3": {}}, "origin": "Playstation", "quantity": 36, "region": "9F1BxNNgnke4aknc", "source": "PURCHASE", "startDate": "1980-03-21T00:00:00Z", "storeId": "wu9TmXfJWBPrx9Ns"}, {"collectionId": "8eLzYEvwSWTaLQjc", "endDate": "1981-08-20T00:00:00Z", "grantedCode": "vrK2jhsYpKPlXn77", "itemId": "AtYoFzLAATPY8P8P", "itemNamespace": "3cfoivvQxevecWw7", "language": "ORiY_DSGb-yf", "metadata": {"8rX2MVUGKSZ4GcLk": {}, "t4pK32sJxlZcCTpT": {}, "dRtCHvuk6B6XTmSL": {}}, "origin": "Playstation", "quantity": 27, "region": "vqjhbeK2qN8g6x2P", "source": "REDEEM_CODE", "startDate": "1982-12-28T00:00:00Z", "storeId": "Do5R3hLiD5sf5y1J"}], "userIds": ["x1aMjgGim51T107X", "sxJNGmyt0SQDUDoW", "BZVGLlkUetzCAWc9"]}' \
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

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "QuTKfC0I2kNjCMDt", "eventState": "DMrentgn3DhqciwI", "lineItemId": "eShF9RKb9vvxuJlh", "orderId": "XbWhbwPwToC6knjV", "productId": "wVnzaqSfJiQFC2gX", "productType": "oda0kg16yUSpSOAj", "purchasedDate": "HJWwfCjYwWkLob9g", "sandboxId": "KLqs2nEZhpByfHZi", "skuId": "nxNfgPAwkMBsznlB", "subscriptionData": {"consumedDurationInDays": 96, "dateTime": "65yclX2FtAz0vJjF", "durationInDays": 70, "recurrenceId": "bpg7yrRvXfZ6rvgv"}}, "datacontenttype": "EY3Hht1SwqTsKKKo", "id": "37NHDOQe91Ps3ztU", "source": "IV0dS6hIH9c4Vfky", "specVersion": "rwpuXxbaERbfgPmi", "subject": "0eHkt1mr9EOIFg0d", "time": "nWIYN2NVL70Iw157", "traceparent": "g00jr9b8MuYmmeKT", "type": "mBNvGYxEQdf3ewoG"}' \
    > test.out 2>&1
eval_tap $? 73 'MockXblClawbackEvent' test.out

#- 74 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetAppleIAPConfig' test.out

#- 75 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appAppleId": 66, "bundleId": "36xj6wySoltDxsbz", "issuerId": "xrlaKEfkoYjY2o6o", "keyId": "uRW9UtNquwC3Wgum", "password": "rIz4NhGztZpr4U4f", "version": "V2"}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateAppleIAPConfig' test.out

#- 76 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteAppleIAPConfig' test.out

#- 77 UpdateAppleP8File
./ng net.accelbyte.sdk.cli.Main platform updateAppleP8File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 77 'UpdateAppleP8File' test.out

#- 78 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'GetEpicGamesIAPConfig' test.out

#- 79 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "qkCfgCUYBn2xaOBd"}' \
    > test.out 2>&1
eval_tap $? 79 'UpdateEpicGamesIAPConfig' test.out

#- 80 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'DeleteEpicGamesIAPConfig' test.out

#- 81 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'GetGoogleIAPConfig' test.out

#- 82 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "PF0JmX8qwU1cTuHH", "notificationTokenAudience": "PB5S3DvPRCzBrVUx", "notificationTokenEmail": "mDOj3cvRFaTC11W0", "packageName": "TGTCm4fZWuk6pQxD", "serviceAccountId": "QpKqxLGeMvr9Tsvc"}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateGoogleIAPConfig' test.out

#- 83 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'DeleteGoogleIAPConfig' test.out

#- 84 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 84 'UpdateGoogleP12File' test.out

#- 85 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'GetIAPItemConfig' test.out

#- 86 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "MQ7dBsaIecRxIsZv", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"HiWxF0YbuU5ar5qT": "LWUCy0Afgc050XIZ", "RW491e94mQjVOOBn": "IWhunElqZUodp3Ih", "tCSHy1ei1fIrPvfH": "nRN06EjRwEQlNapJ"}}, {"itemIdentity": "Rfk4f9Zcw1pEHAyN", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"bct8puMybYGxD9IP": "mmsLmu3kaPj0O4zd", "8Tb7cUNGPTBxiFFC": "rn7djjs69FTFVGUV", "hvKhJCmeisql14mU": "HVbMPimNhcZsU3VA"}}, {"itemIdentity": "dMDcb4qlkiFAamqv", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"I2KwjqPBiWXade41": "s3rH34mB2yPlRpWj", "mHZAAvKTH8MuqIg0": "CzkguwuJCW7EEFB6", "7AODbi9BzupBsFpY": "c77GtRUcCFeY5g4X"}}]}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateIAPItemConfig' test.out

#- 87 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'DeleteIAPItemConfig' test.out

#- 88 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'GetOculusIAPConfig' test.out

#- 89 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "gBsbfzqxBPNe8ae1", "appSecret": "Il4aAtEbu4IjGdqt"}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateOculusIAPConfig' test.out

#- 90 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'DeleteOculusIAPConfig' test.out

#- 91 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'GetPlayStationIAPConfig' test.out

#- 92 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "hRxTjQ7gkZEY8rG0", "backOfficeServerClientSecret": "q0Q2Qd2JzRbkF2I0", "enableStreamJob": true, "environment": "dIjvBbA6bfbYaJCJ", "streamName": "jfk2TUvn95FhO7VW", "streamPartnerName": "3mbDVMDu87t0ldWf"}' \
    > test.out 2>&1
eval_tap $? 92 'UpdatePlaystationIAPConfig' test.out

#- 93 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'DeletePlaystationIAPConfig' test.out

#- 94 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'ValidateExistedPlaystationIAPConfig' test.out

#- 95 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "7iSGIiKFtWtn4Yr2", "backOfficeServerClientSecret": "svKM6pqLGZ0TBujE", "enableStreamJob": true, "environment": "EECQE1li3Bg7Jxc9", "streamName": "pUnZmvhidwCkZwqj", "streamPartnerName": "YLfTiCO1NDBvQvRP"}' \
    > test.out 2>&1
eval_tap $? 95 'ValidatePlaystationIAPConfig' test.out

#- 96 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'GetSteamIAPConfig' test.out

#- 97 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "nAz4VzW0CpoBCbyJ", "publisherAuthenticationKey": "sF5IjF1c0W338HS6"}' \
    > test.out 2>&1
eval_tap $? 97 'UpdateSteamIAPConfig' test.out

#- 98 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'DeleteSteamIAPConfig' test.out

#- 99 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'GetTwitchIAPConfig' test.out

#- 100 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "CBgVRyihYNZ84CVh", "clientSecret": "ziXV8HwSmvcvcDKF", "organizationId": "19yVRafCjOuSYht8"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateTwitchIAPConfig' test.out

#- 101 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'DeleteTwitchIAPConfig' test.out

#- 102 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'GetXblIAPConfig' test.out

#- 103 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableClawback": true, "entraAppClientId": "AdvBaagTiRJ8daGT", "entraAppClientSecret": "VX3Bb7jlz5IfHgKj", "entraTenantId": "I9mwJSrN8jkIykR2", "relyingPartyCert": "zbaI6PD7fEscShnG"}' \
    > test.out 2>&1
eval_tap $? 103 'UpdateXblIAPConfig' test.out

#- 104 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'DeleteXblAPConfig' test.out

#- 105 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'UGUtV9GJ279GDbLN' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'wjm3FK0nnX2poMfZ' \
    --externalId '1hDHtbh4HtMlFgvh' \
    --limit '55' \
    --offset '61' \
    --source 'PLAYSTATION' \
    --startDate 'p2SoiIPp1yvfAHS0' \
    --status 'ERROR' \
    --type 'ZyeDeRnVfPUa6xVV' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'Bcq3wZpFIYeAg79H' \
    --limit '4' \
    --offset '29' \
    --platform 'XBOX' \
    --productId 'XJ7mpVI6eTYAjdPl' \
    --userId 'CiQQC35cj4KyOVgv' \
    > test.out 2>&1
eval_tap $? 107 'QueryThirdPartySubscription' test.out

#- 108 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'nWbfRJtsB7cUQZ2Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 108 'GetIAPOrderConsumeDetails' test.out

#- 109 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'UAxJrINPXppPNO3A' \
    --feature 'fmXcgwC3IN6tvKgL' \
    --itemId 'B9QmJIOq9dP5szG7' \
    --itemType 'EXTENSION' \
    --startTime 'utjsQ4CrRb9gUCeV' \
    > test.out 2>&1
eval_tap $? 109 'DownloadInvoiceDetails' test.out

#- 110 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'z7fWbZIdhevfZvyV' \
    --feature '7AcodcZwKjYDdmJO' \
    --itemId 'lzwm9Su4FnS98Qqf' \
    --itemType 'INGAMEITEM' \
    --startTime 'CR5PbCvDLil8wj9c' \
    > test.out 2>&1
eval_tap $? 110 'GenerateInvoiceSummary' test.out

#- 111 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KM3Ar6MF35hCER4n' \
    --body '{"categoryPath": "GmWGgTJfHlJl4tHG", "targetItemId": "a4XfZcd9CVnGqMX9", "targetNamespace": "FieeEssWEUl07bhw"}' \
    > test.out 2>&1
eval_tap $? 111 'SyncInGameItem' test.out

#- 112 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ntCVqiYOJf5KwMZQ' \
    --body '{"appId": "jzvjSozv6CTRDl0z", "appType": "DLC", "baseAppId": "ohhhuiTnJarYYkHB", "boothName": "DdSzBXdxapwhd5IQ", "categoryPath": "YBQuxLvPuWYvE3fs", "clazz": "Ny9Z9OhxXvCp9y7f", "displayOrder": 76, "entitlementType": "DURABLE", "ext": {"xLPBsmAUrD9L1IiD": {}, "6MlcEPhMDFzjHZ3s": {}, "IhzOx2CXKlvIomU3": {}}, "features": ["9qfx2UDcgVE7L9FK", "6e0MrPc4vtxk9hVK", "pIxM9n8D2eLMe3lt"], "flexible": false, "images": [{"as": "4bkcgepqtxjbrzte", "caption": "e7QLTGAak7Kaol01", "height": 61, "imageUrl": "mj7gyQ7XdIszGRj4", "smallImageUrl": "6COPipH1MWVTHG0q", "width": 69}, {"as": "d6mO4oI8KDqebm83", "caption": "raNBJ5y7axEkvI4o", "height": 47, "imageUrl": "GJtWf1Ybgg8rdwY9", "smallImageUrl": "bmrvHmO07KNqX9LM", "width": 55}, {"as": "IwEsdOGBXBwnzDX8", "caption": "v3xgC1Ge9PdbTTAJ", "height": 89, "imageUrl": "Gp1r0sVZ6LJAOddI", "smallImageUrl": "L2l3hPjNDKv2LWfX", "width": 34}], "inventoryConfig": {"customAttributes": {"xuNOmUSWw18T1IxV": {}, "WCxdvPL9e4P01vxP": {}, "8xj1LyEirURERnEM": {}}, "serverCustomAttributes": {"zpImW6sjAHyCK5tN": {}, "anGBrkzUvck3xTtm": {}, "OFMebS4AdlNzwog2": {}}, "slotUsed": 70}, "itemIds": ["m77TTh4gUoj8u2WR", "cLiEtzVlnkflfn7p", "HY48F1dl1q92m3iR"], "itemQty": {"lfnBAk0CwiAsR65y": 88, "1DjOsrs3CUYATdqn": 87, "cgeqzGbruNB72HHM": 20}, "itemType": "COINS", "listable": false, "localizations": {"dd7CcJUrI6MAugK5": {"description": "kypNrp2nFe9FmN86", "localExt": {"sK5LOq4ft5jGcMIC": {}, "PUYnfG6jl9U4jRet": {}, "eIMgzISomCsodJrh": {}}, "longDescription": "QW41q2OspCZbt3Ut", "title": "a5I0uGcL1koyHjCH"}, "5olYLETRpABAmO2E": {"description": "GvJ4UMS93yOxNInD", "localExt": {"ByhnoluO6ti0QP2s": {}, "siJ66OzOj84O6tgo": {}, "hjtC7bzjPpucddXJ": {}}, "longDescription": "5zifF8y959anrNSl", "title": "eywHbHig6IKWVZ77"}, "KeRWdECaFGzfZ2hx": {"description": "cJ2Fnemn7M23SzUo", "localExt": {"4hNBDh9ZFP1OW0nX": {}, "OErQPS4VsRoYIK69": {}, "yg9ADCGiXaLs2xjH": {}}, "longDescription": "kinOD975nARHCmhN", "title": "HSXuqIHsxvaUoXDm"}}, "lootBoxConfig": {"rewardCount": 46, "rewards": [{"lootBoxItems": [{"count": 46, "duration": 100, "endDate": "1974-06-05T00:00:00Z", "itemId": "TnjN6wKZGW4y3f0R", "itemSku": "9s2kndhhZhwAiLsZ", "itemType": "s4pmLDIQch4IjDq9"}, {"count": 0, "duration": 68, "endDate": "1994-05-13T00:00:00Z", "itemId": "7MJ6zU7JLMQyMWzY", "itemSku": "QCAaPJgoxGJoJaSz", "itemType": "UtY4ZD0Xtb0U4pH1"}, {"count": 82, "duration": 73, "endDate": "1994-05-31T00:00:00Z", "itemId": "Z9GiBiSAylX5cS0I", "itemSku": "eHpWCugmfOL0QQpx", "itemType": "suD8PGqku59eFJrO"}], "name": "XyDYz9vMUOPG0iHD", "odds": 0.7380631844444431, "type": "PROBABILITY_GROUP", "weight": 87}, {"lootBoxItems": [{"count": 24, "duration": 2, "endDate": "1971-09-19T00:00:00Z", "itemId": "U86FyOjApNHBVfNO", "itemSku": "URcjY3YYT9oTynmf", "itemType": "IuBWgJTNFfM8M0IW"}, {"count": 20, "duration": 29, "endDate": "1975-02-09T00:00:00Z", "itemId": "w6gYPvfn2Qt9iyq3", "itemSku": "Nyk8ncu2Z3eDHH9W", "itemType": "aVO4iKhDcJ7TCcNI"}, {"count": 38, "duration": 81, "endDate": "1992-11-05T00:00:00Z", "itemId": "PuppUxDSK8aOTGMu", "itemSku": "dcxlCV4cNbJGQ57l", "itemType": "PdinpjS2DRfGt9Gl"}], "name": "yZVQ4X67tPZSTpPq", "odds": 0.902370882509283, "type": "REWARD", "weight": 34}, {"lootBoxItems": [{"count": 19, "duration": 93, "endDate": "1979-08-05T00:00:00Z", "itemId": "ElvvDgw0ag7kSWE0", "itemSku": "Hiqm5IuLryiEXqvU", "itemType": "WDjU1G0EVjVZw1To"}, {"count": 77, "duration": 4, "endDate": "1981-12-08T00:00:00Z", "itemId": "xuHSgDOK8bjoF7bL", "itemSku": "2635KbtZTGJpqgl2", "itemType": "IzNXGTuQPIDpor7t"}, {"count": 59, "duration": 1, "endDate": "1977-10-18T00:00:00Z", "itemId": "sh4US8o4jfMANPpm", "itemSku": "ZDdMiCxmuCCVuFjS", "itemType": "1GC1d2b92B4vEgj3"}], "name": "HOmhcWm428XejRF9", "odds": 0.9160304467787199, "type": "REWARD_GROUP", "weight": 7}], "rollFunction": "CUSTOM"}, "maxCount": 27, "maxCountPerUser": 37, "name": "MrBZo0lNUBDShHD3", "optionBoxConfig": {"boxItems": [{"count": 46, "duration": 43, "endDate": "1995-06-18T00:00:00Z", "itemId": "hjnnjKMEmtbiWsAQ", "itemSku": "HbMrKYi0Zxs5SWCq", "itemType": "ZXHLLa31oQf7BULn"}, {"count": 73, "duration": 61, "endDate": "1995-03-03T00:00:00Z", "itemId": "AJsyAfeKOufV4f15", "itemSku": "NohXu6opxQGRt6Pq", "itemType": "lkL0diRhLC10ih2E"}, {"count": 87, "duration": 77, "endDate": "1973-08-09T00:00:00Z", "itemId": "Y3XCv4hdOa6FdZhN", "itemSku": "Md1onFjGRbxtABPX", "itemType": "DmgNEJBhgGq5GIDh"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 20, "fixedTrialCycles": 95, "graceDays": 39}, "regionData": {"0n0BAZkwbYkBLyO6": [{"currencyCode": "A0FqfhnaB3YxKNdO", "currencyNamespace": "TacCcJfIfXshuLUk", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1997-01-22T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1982-05-31T00:00:00Z", "expireAt": "1976-07-10T00:00:00Z", "price": 9, "purchaseAt": "1982-08-08T00:00:00Z", "trialPrice": 27}, {"currencyCode": "6RpmKDebNkylbynk", "currencyNamespace": "gT9vayLLiizac7Ge", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1989-11-11T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1976-02-02T00:00:00Z", "expireAt": "1991-03-29T00:00:00Z", "price": 41, "purchaseAt": "1981-03-24T00:00:00Z", "trialPrice": 39}, {"currencyCode": "rjF5RaJwvkWVco2L", "currencyNamespace": "To5ijlvDF8qBWCQ9", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1990-07-23T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1997-07-15T00:00:00Z", "expireAt": "1986-04-13T00:00:00Z", "price": 53, "purchaseAt": "1994-01-24T00:00:00Z", "trialPrice": 14}], "GM5anIloyj9lhbvu": [{"currencyCode": "QdW2jwKUckc794ry", "currencyNamespace": "Y91lX8DD4MYXlrJ8", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1985-09-30T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1982-06-23T00:00:00Z", "expireAt": "1973-05-23T00:00:00Z", "price": 73, "purchaseAt": "1979-04-03T00:00:00Z", "trialPrice": 43}, {"currencyCode": "7PeiMH8z8dVej8N2", "currencyNamespace": "yv6VTnOK7xAvM7tu", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1998-06-02T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1978-06-03T00:00:00Z", "expireAt": "1992-12-17T00:00:00Z", "price": 44, "purchaseAt": "1978-07-14T00:00:00Z", "trialPrice": 97}, {"currencyCode": "xSVp3Gd2TK0HzYvi", "currencyNamespace": "TgYmx82JVBRLPZ6I", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1981-04-26T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1987-02-03T00:00:00Z", "expireAt": "1975-01-30T00:00:00Z", "price": 57, "purchaseAt": "1971-02-22T00:00:00Z", "trialPrice": 37}], "uBF6Gsvvdl8jHz9x": [{"currencyCode": "7XZIjU4IK9lOLaZa", "currencyNamespace": "MphKCqTq3EVheJjo", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1986-06-19T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1985-05-30T00:00:00Z", "expireAt": "1990-04-13T00:00:00Z", "price": 70, "purchaseAt": "1993-07-09T00:00:00Z", "trialPrice": 26}, {"currencyCode": "GnNuhoJM3WWPvvCi", "currencyNamespace": "Cf33ViEdqQpoGkUW", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1984-02-10T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1988-12-24T00:00:00Z", "expireAt": "1995-08-28T00:00:00Z", "price": 5, "purchaseAt": "1999-12-04T00:00:00Z", "trialPrice": 97}, {"currencyCode": "AGv6c1ESC6hZYTYZ", "currencyNamespace": "bzf5aANNNs5kgSZZ", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1988-05-11T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1971-01-18T00:00:00Z", "expireAt": "1980-08-01T00:00:00Z", "price": 55, "purchaseAt": "1991-05-05T00:00:00Z", "trialPrice": 67}]}, "saleConfig": {"currencyCode": "mWJO5vzzXZj08a6K", "price": 83}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "NvBQZSJPOIKrRBrY", "stackable": false, "status": "INACTIVE", "tags": ["a2LrnpZxNnLRH36b", "HEAj1cT3u6Zc2Fbr", "qS2oFY76PU1AziBO"], "targetCurrencyCode": "TFznTgDIwZIRWf6T", "targetNamespace": "3by2kYSCdnFKLc0x", "thumbnailUrl": "cTjqjdcEfU61OJYM", "useCount": 26}' \
    > test.out 2>&1
eval_tap $? 112 'CreateItem' test.out

#- 113 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'PKVSZCg3XTc9vQe0' \
    --appId 'dHJfF6KIuvnRCa9J' \
    > test.out 2>&1
eval_tap $? 113 'GetItemByAppId' test.out

#- 114 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate 'lhe98oaFKlQicdrx' \
    --baseAppId 'VhrtwSd9QWVMYz7T' \
    --categoryPath 'U1TsxsChSclSkb5a' \
    --features 'Bi9K9zyv6gFZXI5n' \
    --includeSubCategoryItem  \
    --itemType 'SEASON' \
    --limit '72' \
    --offset '13' \
    --region 'hLi6HweweRmyo91d' \
    --sortBy 'createdAt,displayOrder,updatedAt:desc' \
    --storeId 'E6x21pdX2QSPAd9s' \
    --tags 'xoLnWGP1PafIjLX8' \
    --targetNamespace 'ce0KbNN7Ycl2JfmQ' \
    > test.out 2>&1
eval_tap $? 114 'QueryItems' test.out

#- 115 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'plvGjVQ4aebjfgGu,472oWJlfglLM4xjf,kNL4lU6jaGfsD1cf' \
    > test.out 2>&1
eval_tap $? 115 'ListBasicItemsByFeatures' test.out

#- 116 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'swmeFpvtDtetoQVF' \
    --itemIds 'L8LNW11vtpaTxi7k' \
    > test.out 2>&1
eval_tap $? 116 'GetItems' test.out

#- 117 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '489jRCn48bvkCPfK' \
    --sku 'ofwXOIZZQAJza84l' \
    > test.out 2>&1
eval_tap $? 117 'GetItemBySku' test.out

#- 118 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'KKmVOaTS6xBbNrSU' \
    --populateBundle  \
    --region 'AW2ak7ISDrBVg6Nu' \
    --storeId 'DZvPb1kuUfNfUDe4' \
    --sku 'g7q6PHEaqbzHvDDl' \
    > test.out 2>&1
eval_tap $? 118 'GetLocaleItemBySku' test.out

#- 119 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform '1jiLw3XMGBA6JXDp' \
    --region 'A1tIC45C0oaGouFu' \
    --storeId '4hXONgUwJnUpryDe' \
    --itemIds 'RcpUvlrw2MwC1uuo' \
    --userId 'kpaIjL0Vxe5n9Lx3' \
    > test.out 2>&1
eval_tap $? 119 'GetEstimatedPrice' test.out

#- 120 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'QcFo9gxOgvDc7xMr' \
    --sku 'RKvw8ISP2WKmCRRX' \
    > test.out 2>&1
eval_tap $? 120 'GetItemIdBySku' test.out

#- 121 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'BxlalCHtWlKxLpS8,fLWoQ5nuJhatQPxR,7dvBVC5zgOKLTDmH' \
    --storeId 'e8c1eJ9sde7Ryt4u' \
    > test.out 2>&1
eval_tap $? 121 'GetBulkItemIdBySkus' test.out

#- 122 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'dIv22M18uux9xBom' \
    --region 'QFPFWy5cwNPI6aFo' \
    --storeId '0MVwDZCIXFNEL3uW' \
    --itemIds 'VRz3V7YbJM3bNLWH' \
    > test.out 2>&1
eval_tap $? 122 'BulkGetLocaleItems' test.out

#- 123 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 123 'GetAvailablePredicateTypes' test.out

#- 124 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'AbCZixe2cQ6O30lp' \
    --userId 'zcBQMAEcNcJqrKxn' \
    --body '{"itemIds": ["MzSYoc4ZjiMY4H34", "B6wVd8ipcKDwQeUW", "tjCC2UH6jzMO3Afm"]}' \
    > test.out 2>&1
eval_tap $? 124 'ValidateItemPurchaseCondition' test.out

#- 125 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OS5mQNyRPZFPNP56' \
    --body '{"changes": [{"itemIdentities": ["l1AT6OLKmZhCZxxP", "PdPwOtEuWBSO2jJe", "pUnEEgja2mIE2kLT"], "itemIdentityType": "ITEM_ID", "regionData": {"HleLoog4me2NBFp6": [{"currencyCode": "2xlXvVcJerTPW02P", "currencyNamespace": "WsHiKYArAxnKBfBf", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1977-05-22T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1992-08-23T00:00:00Z", "discountedPrice": 86, "expireAt": "1972-06-15T00:00:00Z", "price": 30, "purchaseAt": "1984-06-18T00:00:00Z", "trialPrice": 5}, {"currencyCode": "kWpnbz4ys7j6lxuU", "currencyNamespace": "3u2HEG0qfKegvFTD", "currencyType": "VIRTUAL", "discountAmount": 37, "discountExpireAt": "1984-12-03T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1983-03-29T00:00:00Z", "discountedPrice": 86, "expireAt": "1992-12-28T00:00:00Z", "price": 42, "purchaseAt": "1990-11-17T00:00:00Z", "trialPrice": 26}, {"currencyCode": "GKhaLlJzJMSnJIIg", "currencyNamespace": "sAVmaGYxUX1B9oVu", "currencyType": "VIRTUAL", "discountAmount": 61, "discountExpireAt": "1987-12-21T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1985-01-24T00:00:00Z", "discountedPrice": 28, "expireAt": "1979-01-23T00:00:00Z", "price": 2, "purchaseAt": "1985-04-21T00:00:00Z", "trialPrice": 64}], "yK3ggFDh2kaZP7pn": [{"currencyCode": "nVfxPwc259HF9ejH", "currencyNamespace": "aILQruAuYyJLYGqM", "currencyType": "VIRTUAL", "discountAmount": 77, "discountExpireAt": "1999-12-23T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1978-06-14T00:00:00Z", "discountedPrice": 23, "expireAt": "1993-02-19T00:00:00Z", "price": 34, "purchaseAt": "1976-03-31T00:00:00Z", "trialPrice": 32}, {"currencyCode": "pq03BGdIk4oEogFV", "currencyNamespace": "GR71rJOBy6lsj1AK", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1972-03-23T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1977-06-06T00:00:00Z", "discountedPrice": 68, "expireAt": "1984-04-09T00:00:00Z", "price": 40, "purchaseAt": "1971-07-13T00:00:00Z", "trialPrice": 53}, {"currencyCode": "3VAl6tXFbnATCzUO", "currencyNamespace": "IzVcy9k3ie64Vnwa", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1971-04-08T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1981-12-16T00:00:00Z", "discountedPrice": 73, "expireAt": "1992-06-13T00:00:00Z", "price": 23, "purchaseAt": "1985-06-10T00:00:00Z", "trialPrice": 19}], "Je32AiwKadEoIVmp": [{"currencyCode": "rwPsa9YD92CX0rIT", "currencyNamespace": "ajpwHITGeHTnqRbz", "currencyType": "VIRTUAL", "discountAmount": 91, "discountExpireAt": "1985-07-11T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1997-09-15T00:00:00Z", "discountedPrice": 34, "expireAt": "1974-10-25T00:00:00Z", "price": 56, "purchaseAt": "1971-12-20T00:00:00Z", "trialPrice": 25}, {"currencyCode": "Fj1umx4ItzkMJ7cu", "currencyNamespace": "df4r916GPrhn2etV", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1993-10-12T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1992-10-14T00:00:00Z", "discountedPrice": 53, "expireAt": "1989-06-05T00:00:00Z", "price": 61, "purchaseAt": "1998-09-30T00:00:00Z", "trialPrice": 29}, {"currencyCode": "tx60AehGz1ermJYX", "currencyNamespace": "sYgL7TfyIlAwjTZd", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1989-09-19T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1989-07-27T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-06-06T00:00:00Z", "price": 46, "purchaseAt": "1974-07-01T00:00:00Z", "trialPrice": 11}]}}, {"itemIdentities": ["TX2bamSCvX1nwvSW", "dDwD7WJHzgNZUKsI", "5y0mR3zMyTsftKqn"], "itemIdentityType": "ITEM_SKU", "regionData": {"Hwya4NpdOzg3hr6u": [{"currencyCode": "cHf7dbh2iKNUl0qJ", "currencyNamespace": "qzoKMRMG541PAiNj", "currencyType": "REAL", "discountAmount": 37, "discountExpireAt": "1983-10-29T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1995-04-14T00:00:00Z", "discountedPrice": 94, "expireAt": "1990-03-27T00:00:00Z", "price": 82, "purchaseAt": "1972-06-15T00:00:00Z", "trialPrice": 77}, {"currencyCode": "bkOFldMCQ98JH4n0", "currencyNamespace": "JtgqzZv5kVu4S95m", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1997-05-03T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1998-06-22T00:00:00Z", "discountedPrice": 0, "expireAt": "1976-02-07T00:00:00Z", "price": 39, "purchaseAt": "1999-07-11T00:00:00Z", "trialPrice": 11}, {"currencyCode": "3N7WNMYIfcDKbLu8", "currencyNamespace": "pnK34oA1keYXJvtg", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1986-01-25T00:00:00Z", "discountPercentage": 98, "discountPurchaseAt": "1996-03-13T00:00:00Z", "discountedPrice": 10, "expireAt": "1971-04-06T00:00:00Z", "price": 8, "purchaseAt": "1989-03-14T00:00:00Z", "trialPrice": 24}], "MBahFZZGMTcqnWrI": [{"currencyCode": "prOv0BJ9Sgl7H1sd", "currencyNamespace": "H2RIJz1eI7Q5pu9P", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1981-04-18T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1978-02-12T00:00:00Z", "discountedPrice": 15, "expireAt": "1972-10-13T00:00:00Z", "price": 6, "purchaseAt": "1980-11-16T00:00:00Z", "trialPrice": 43}, {"currencyCode": "zMTQ9P7sYLDWAJOA", "currencyNamespace": "75K4BYJ2fkqYJoF2", "currencyType": "VIRTUAL", "discountAmount": 43, "discountExpireAt": "1977-07-21T00:00:00Z", "discountPercentage": 41, "discountPurchaseAt": "1983-12-14T00:00:00Z", "discountedPrice": 34, "expireAt": "1994-12-21T00:00:00Z", "price": 45, "purchaseAt": "1984-05-20T00:00:00Z", "trialPrice": 5}, {"currencyCode": "o8TWwXWsz9TVmdMK", "currencyNamespace": "EohKzuMYDUTLBeCi", "currencyType": "REAL", "discountAmount": 21, "discountExpireAt": "1996-03-18T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1981-09-27T00:00:00Z", "discountedPrice": 51, "expireAt": "1974-02-09T00:00:00Z", "price": 47, "purchaseAt": "1982-04-17T00:00:00Z", "trialPrice": 56}], "cXejmeZtzT0qj0lt": [{"currencyCode": "sqfiZrthVvyX0OCK", "currencyNamespace": "DJE3RMUddwSSgxCu", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1985-05-24T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1981-11-22T00:00:00Z", "discountedPrice": 12, "expireAt": "1985-12-29T00:00:00Z", "price": 16, "purchaseAt": "1989-09-21T00:00:00Z", "trialPrice": 26}, {"currencyCode": "AYOHR5BWa9VzIkaQ", "currencyNamespace": "El1iUProNB6hI6Ip", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1992-04-22T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1976-02-27T00:00:00Z", "discountedPrice": 74, "expireAt": "1987-06-24T00:00:00Z", "price": 7, "purchaseAt": "1981-12-21T00:00:00Z", "trialPrice": 15}, {"currencyCode": "6Q4veujxtyQENvJr", "currencyNamespace": "BCqeg67d4RWOqO4U", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1999-03-03T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1981-10-17T00:00:00Z", "discountedPrice": 81, "expireAt": "1988-12-17T00:00:00Z", "price": 50, "purchaseAt": "1990-09-14T00:00:00Z", "trialPrice": 51}]}}, {"itemIdentities": ["Am3DQht4JwnPS2ur", "JqerobWMZGVL5KLT", "xahWlS6XdBaKSLCg"], "itemIdentityType": "ITEM_ID", "regionData": {"PXM6XTUh2dJ90yqH": [{"currencyCode": "DNacl4F9G6Dl5TFw", "currencyNamespace": "BY6HKXAblkT8VGgS", "currencyType": "VIRTUAL", "discountAmount": 88, "discountExpireAt": "1990-09-26T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1997-09-18T00:00:00Z", "discountedPrice": 46, "expireAt": "1988-03-05T00:00:00Z", "price": 1, "purchaseAt": "1995-01-17T00:00:00Z", "trialPrice": 19}, {"currencyCode": "q4XRLaA643nTMtXS", "currencyNamespace": "Ayejnny0Ju13b6o5", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1985-08-14T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1996-10-18T00:00:00Z", "discountedPrice": 80, "expireAt": "1988-10-09T00:00:00Z", "price": 73, "purchaseAt": "1988-07-06T00:00:00Z", "trialPrice": 51}, {"currencyCode": "ytpcubN4AUUPFPsc", "currencyNamespace": "ZsXeJOD4DMtqfIGi", "currencyType": "VIRTUAL", "discountAmount": 73, "discountExpireAt": "1994-04-23T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1982-08-12T00:00:00Z", "discountedPrice": 13, "expireAt": "1979-12-30T00:00:00Z", "price": 89, "purchaseAt": "1975-07-10T00:00:00Z", "trialPrice": 25}], "Z8N4UQ2fg3V1o2x0": [{"currencyCode": "hL5DuBDqMyIAzWze", "currencyNamespace": "94MEdJFAy2JTllJk", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1996-03-16T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1979-05-17T00:00:00Z", "discountedPrice": 72, "expireAt": "1995-09-04T00:00:00Z", "price": 31, "purchaseAt": "1973-01-29T00:00:00Z", "trialPrice": 17}, {"currencyCode": "eqqsBVyONV0JRtoz", "currencyNamespace": "I0jpliCFQ6WgJpGP", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1974-08-19T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1997-01-18T00:00:00Z", "discountedPrice": 8, "expireAt": "1992-07-13T00:00:00Z", "price": 82, "purchaseAt": "1985-07-27T00:00:00Z", "trialPrice": 54}, {"currencyCode": "qvWjVac1cQvSxgTN", "currencyNamespace": "IUzxDgBlIbuzm7Dz", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1997-02-10T00:00:00Z", "discountPercentage": 82, "discountPurchaseAt": "1987-02-03T00:00:00Z", "discountedPrice": 89, "expireAt": "1988-10-15T00:00:00Z", "price": 65, "purchaseAt": "1988-12-26T00:00:00Z", "trialPrice": 15}], "ovTGXaMsq8ePN1oc": [{"currencyCode": "o2jx8Upe8SjMvpqM", "currencyNamespace": "8puggOEdG47gD5i2", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1993-07-31T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1977-07-25T00:00:00Z", "discountedPrice": 100, "expireAt": "1977-03-09T00:00:00Z", "price": 20, "purchaseAt": "1991-01-28T00:00:00Z", "trialPrice": 49}, {"currencyCode": "EPhNHSH7eKDfRcng", "currencyNamespace": "EpTnRUQr3RLOM1vE", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1972-02-25T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1979-01-20T00:00:00Z", "discountedPrice": 60, "expireAt": "1999-10-30T00:00:00Z", "price": 100, "purchaseAt": "1975-02-16T00:00:00Z", "trialPrice": 47}, {"currencyCode": "KaY5c1tP5TDuI5f6", "currencyNamespace": "m4KC07CnsZe32hqE", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1999-06-09T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1984-07-12T00:00:00Z", "discountedPrice": 1, "expireAt": "1991-02-02T00:00:00Z", "price": 56, "purchaseAt": "1996-01-11T00:00:00Z", "trialPrice": 83}]}}]}' \
    > test.out 2>&1
eval_tap $? 125 'BulkUpdateRegionData' test.out

#- 126 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'APP' \
    --limit '22' \
    --offset '45' \
    --sortBy 'voaJYdMqGegcg3eR' \
    --storeId 'vBZXN3cjIXmFWRJn' \
    --keyword 'j8xN7HDPTUEDPN1K' \
    --language 'b4UTPWDXTSb55g8L' \
    > test.out 2>&1
eval_tap $? 126 'SearchItems' test.out

#- 127 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '91' \
    --offset '64' \
    --sortBy 'createdAt:asc,displayOrder:asc,displayOrder:desc' \
    --storeId 'XypoOLl13j84P0Kq' \
    > test.out 2>&1
eval_tap $? 127 'QueryUncategorizedItems' test.out

#- 128 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'irJ4PkMFtsnFfz8E' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'w0X8fBuBSKLSQ4Gv' \
    > test.out 2>&1
eval_tap $? 128 'GetItem' test.out

#- 129 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Ltz50D3rpBfBovqL' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wXBuT30EYeRj17xG' \
    --body '{"appId": "haBKoUfiHjGmCyPs", "appType": "SOFTWARE", "baseAppId": "etWsokvx3BHuTEcz", "boothName": "r9KjQ3ttz8MTBt1x", "categoryPath": "k9IyssSA8nP5PQjp", "clazz": "zk2Tb7iYdmNZWosr", "displayOrder": 37, "entitlementType": "DURABLE", "ext": {"RWECdjWYrnulxcCK": {}, "Aru8pOaAVLDB4k3J": {}, "wkdaxR7GJpYmuYCP": {}}, "features": ["G181q9GA5DydC2D8", "UT6KOc4VPDUR9aya", "zqXRqegIUicYXXzx"], "flexible": true, "images": [{"as": "F6HtlER2txs4qrNA", "caption": "RATn6KXOutlYBbLh", "height": 77, "imageUrl": "ERMNpqWb51y5RUzv", "smallImageUrl": "MfTkPy0fGvTGgfLK", "width": 38}, {"as": "RK6UKk5ozrXA4HZH", "caption": "Nyq9odanhR1Zrm3t", "height": 14, "imageUrl": "aauufxkPHElug48T", "smallImageUrl": "gfNu0rqXUOyToLPI", "width": 89}, {"as": "T5kDTyPl3dKF7NXE", "caption": "jrJMki8jvc3P8Gwj", "height": 12, "imageUrl": "h0lciRhVZ2DeoODX", "smallImageUrl": "MzLSrzoiBnYi5UWs", "width": 46}], "inventoryConfig": {"customAttributes": {"tYlYeMoCimJySocR": {}, "vUWDOrFZKPNoN9AW": {}, "tLK9TFgi9j2XMh9W": {}}, "serverCustomAttributes": {"pifqjNjLOtNQts2y": {}, "xf6MLZJ2jZfZbpTJ": {}, "ezzriCDWXT59SRu0": {}}, "slotUsed": 58}, "itemIds": ["qUxKDc84OMIzvTSc", "dbKBsAyJMz4ILNDv", "hB4Eoes9a6XaJeRb"], "itemQty": {"zTPwD3jxF7vxRUY0": 18, "W4JprIb3CJCAtvSG": 12, "Cfa9dzOJDGCTHIOF": 20}, "itemType": "MEDIA", "listable": false, "localizations": {"xeR6d7r1SQw80JfM": {"description": "pPrSqYypRUnq5o4E", "localExt": {"TeCUYG9ccTt7Wxw8": {}, "OQ13t3uTw6zQuoZc": {}, "XQpoTOxe8y1jorNs": {}}, "longDescription": "g9ZKYCKoISyXtHzo", "title": "WGdYohxMp3uOQIyb"}, "qWfG9BJ6FVKlbYHt": {"description": "bPtaxvagSlpGgVTF", "localExt": {"6VeDAPOGBwweyFfX": {}, "EOEAEtbag82KgBgy": {}, "Cd5vjkfz3eR4DtNp": {}}, "longDescription": "129hzBw3xLUcCEt0", "title": "DzmkJq1sml5bYt76"}, "BNsi4giR9434WpKK": {"description": "dzxoufCNlFoOcWQQ", "localExt": {"y4bjmQeEweoBHTdw": {}, "Ak7ZQnbqY1cQwVEt": {}, "Ar5kKKAo9MM2Cqm8": {}}, "longDescription": "4jVi9kIpqgrzpUkN", "title": "OBWydXV0Fi02aFr8"}}, "lootBoxConfig": {"rewardCount": 58, "rewards": [{"lootBoxItems": [{"count": 59, "duration": 87, "endDate": "1971-11-13T00:00:00Z", "itemId": "pjwNOl4k8rVNrm8d", "itemSku": "rv8QD2JOe2Ntz7EF", "itemType": "vowPgIGuetxFMqXC"}, {"count": 87, "duration": 78, "endDate": "1988-08-06T00:00:00Z", "itemId": "WRlE9hqz6rjDNo4r", "itemSku": "hjxUdMM83WekqfWv", "itemType": "04vvn9bk5qr8qs2m"}, {"count": 34, "duration": 99, "endDate": "1981-12-26T00:00:00Z", "itemId": "nGAqXUjNypF6MMqW", "itemSku": "pdEJsPoaIbYz8cK5", "itemType": "jlpJdre5ur6yvWJD"}], "name": "dvM7T7PX2vamIRZH", "odds": 0.4034657886071181, "type": "REWARD", "weight": 14}, {"lootBoxItems": [{"count": 71, "duration": 17, "endDate": "1997-04-19T00:00:00Z", "itemId": "OCUoiCXNjrdQL2jd", "itemSku": "x1eIba1sB0HsJ06D", "itemType": "zfbzRYt4OVUyumBe"}, {"count": 71, "duration": 25, "endDate": "1979-03-18T00:00:00Z", "itemId": "dQGZC5kM03HHijsQ", "itemSku": "Rj7N8IAjmsonjj0Z", "itemType": "R50BQ1U6aFD3O2kX"}, {"count": 87, "duration": 38, "endDate": "1994-04-27T00:00:00Z", "itemId": "c58zgZVl4gIF7v3q", "itemSku": "bZu9M3OxqVAT4H1l", "itemType": "RZ9Z1JBrHRzEOtIx"}], "name": "zPqb6n73m0jiaDH8", "odds": 0.9409777075952662, "type": "PROBABILITY_GROUP", "weight": 26}, {"lootBoxItems": [{"count": 91, "duration": 35, "endDate": "1972-06-03T00:00:00Z", "itemId": "5y0X48eT7Mluexk8", "itemSku": "7b9Z5BTsEA3EdmW8", "itemType": "saabP4xRowfNojzP"}, {"count": 64, "duration": 71, "endDate": "1992-10-21T00:00:00Z", "itemId": "v0prR3OEey0MkZwS", "itemSku": "6TYwNN3UYhic03qG", "itemType": "Eg5fNzBVrjo3g8Cf"}, {"count": 88, "duration": 45, "endDate": "1972-06-10T00:00:00Z", "itemId": "U66yJaj4ovoKWE4E", "itemSku": "W0sw8v5peiuxoBJA", "itemType": "TauyD3XCXVMiyEvM"}], "name": "f9yilUEujk6oqYo1", "odds": 0.5395738742712982, "type": "REWARD_GROUP", "weight": 79}], "rollFunction": "DEFAULT"}, "maxCount": 93, "maxCountPerUser": 17, "name": "FzwdOMdupwD4O3uN", "optionBoxConfig": {"boxItems": [{"count": 3, "duration": 11, "endDate": "1972-09-26T00:00:00Z", "itemId": "IDcIyvZbOy1T4hfw", "itemSku": "kuVykH4RpfmjIXFG", "itemType": "Z5PKdbabJIkNnt9P"}, {"count": 94, "duration": 9, "endDate": "1976-02-25T00:00:00Z", "itemId": "m08luh4dpPRMDbUX", "itemSku": "BWTbpAogG2wlZkLh", "itemType": "uU5FI8NijFI0GKwJ"}, {"count": 60, "duration": 45, "endDate": "1987-02-15T00:00:00Z", "itemId": "scjwrizsFUgYwbaL", "itemSku": "vqvQ2NbmDITuymTB", "itemType": "jn3d2sFzMS3QaVjZ"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 55, "fixedTrialCycles": 8, "graceDays": 48}, "regionData": {"eHdvphas9S7ivHEo": [{"currencyCode": "LbUMM47f1UreUpxE", "currencyNamespace": "kXIbE1ETzRJZKMav", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1977-04-05T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1999-09-10T00:00:00Z", "expireAt": "1988-12-08T00:00:00Z", "price": 1, "purchaseAt": "1977-03-07T00:00:00Z", "trialPrice": 8}, {"currencyCode": "YN27bojDVaZLpx4k", "currencyNamespace": "EWYkO6KrKUMhJrAS", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1974-06-24T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1974-09-08T00:00:00Z", "expireAt": "1977-03-12T00:00:00Z", "price": 100, "purchaseAt": "1987-10-27T00:00:00Z", "trialPrice": 31}, {"currencyCode": "SSrF35anDGvur19V", "currencyNamespace": "18oIrUKXttgAI2Qd", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1973-04-10T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1978-12-11T00:00:00Z", "expireAt": "1986-06-15T00:00:00Z", "price": 13, "purchaseAt": "1996-01-25T00:00:00Z", "trialPrice": 2}], "8EMspOs8nkic9gj5": [{"currencyCode": "vyUMAAmIHYbsxG5N", "currencyNamespace": "066FXb88SbLOa21D", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1993-09-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1994-04-07T00:00:00Z", "expireAt": "1988-02-04T00:00:00Z", "price": 7, "purchaseAt": "1996-12-09T00:00:00Z", "trialPrice": 73}, {"currencyCode": "HyoX4VnO2LpBU08w", "currencyNamespace": "fnlHBXFIqFUmgUSM", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1975-06-16T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1987-05-30T00:00:00Z", "expireAt": "1989-05-19T00:00:00Z", "price": 94, "purchaseAt": "1974-04-13T00:00:00Z", "trialPrice": 21}, {"currencyCode": "00nml5BidsK9dCEz", "currencyNamespace": "hVnOv0PQbVIaKiHf", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1973-04-27T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1995-08-28T00:00:00Z", "expireAt": "1971-08-06T00:00:00Z", "price": 29, "purchaseAt": "1993-06-06T00:00:00Z", "trialPrice": 66}], "H7r1ta3m7jK5pxe8": [{"currencyCode": "2pgFiAS6piIzmc8r", "currencyNamespace": "KrKEPGSAcong6eNE", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1977-02-13T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1971-03-25T00:00:00Z", "expireAt": "1981-03-15T00:00:00Z", "price": 6, "purchaseAt": "1980-03-06T00:00:00Z", "trialPrice": 49}, {"currencyCode": "1Ctccv9Gv4tOcbnu", "currencyNamespace": "Cqf0lm6WBkIzjoSV", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1981-04-02T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1983-04-16T00:00:00Z", "expireAt": "1979-11-14T00:00:00Z", "price": 44, "purchaseAt": "1985-06-04T00:00:00Z", "trialPrice": 19}, {"currencyCode": "lSLfU7HByGXPMqxj", "currencyNamespace": "4hBgVY3YAxZLKbcO", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1983-03-14T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1979-01-16T00:00:00Z", "expireAt": "1973-12-29T00:00:00Z", "price": 87, "purchaseAt": "1973-03-12T00:00:00Z", "trialPrice": 30}]}, "saleConfig": {"currencyCode": "U3Idi55jNrGNT2VH", "price": 94}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "IT5FwwHj0Ur5F2PW", "stackable": false, "status": "ACTIVE", "tags": ["D81xhNP4t6kYBUjy", "IrgroixptZhckUTG", "XAn3bWQF6QcAiJpX"], "targetCurrencyCode": "kcBOE4qMcH1Kyi8Z", "targetNamespace": "FvGcV8DY0XOkDstx", "thumbnailUrl": "ZcY1HgAnZV4IOglV", "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 129 'UpdateItem' test.out

#- 130 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId '8Yc481dYdvGxJAMD' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'RA1LF7jdWlekFwO9' \
    > test.out 2>&1
eval_tap $? 130 'DeleteItem' test.out

#- 131 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId '4VBCV9qJhWva2FPB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 41, "orderNo": "6Cp85HVDsZBQgOnX"}' \
    > test.out 2>&1
eval_tap $? 131 'AcquireItem' test.out

#- 132 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'uXsGThYZrmm0wrFM' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nPpWgrQD4hEk0OLj' \
    > test.out 2>&1
eval_tap $? 132 'GetApp' test.out

#- 133 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'YsnignE7KcMF7fuD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'bzRRYMNXWUsp1tOi' \
    --body '{"carousel": [{"alt": "bJY9aL9ie6vvMbiN", "previewUrl": "URrlm88QlKyuoya4", "thumbnailUrl": "JgakZyUV7t73VnSF", "type": "image", "url": "Pd12B8QNUz0hFFNb", "videoSource": "youtube"}, {"alt": "nKu9oTc8pVkiyGsj", "previewUrl": "5JdXzRxfNEjUMTs8", "thumbnailUrl": "WIObJBTsvsw76uIS", "type": "video", "url": "bKVoWtoUW1P7ocuB", "videoSource": "vimeo"}, {"alt": "LhVYszm8xY33OQbu", "previewUrl": "mu2QHLyZNuysyM4O", "thumbnailUrl": "fCzdQCXMAWnf87YP", "type": "image", "url": "Oe9Eevf1fhMg1E2k", "videoSource": "vimeo"}], "developer": "QLFrVgtX7y0fPOie", "forumUrl": "DCow2zXyFFVpM87y", "genres": ["Indie", "Racing", "Adventure"], "localizations": {"wEacQMTlqN4LKkxJ": {"announcement": "5v3SBafnKNiMPbFk", "slogan": "FGA85W3HJkqgS2B3"}, "7wwoPYOHiIsxmsLB": {"announcement": "PBJuNLnWRrtW870q", "slogan": "D88ZcduZSe7W20UZ"}, "cDaiq0nEZ7PyhqFJ": {"announcement": "kDClOsKmfsgJdmzs", "slogan": "DPsWh1k0cQ08NG6d"}}, "platformRequirements": {"X2TZkil67kRngoUa": [{"additionals": "83ECh1gqPeS193TN", "directXVersion": "Nzot3sVli3GN2XTr", "diskSpace": "FibRAhzzEWzWlTY7", "graphics": "0qdgJRvpZrSpWX3K", "label": "Ee2BjV00ReCXFffj", "osVersion": "JJxlgjzIhpgOoIOD", "processor": "74V21HWDAfvXwdxb", "ram": "yp4HAPbBbNPStVBU", "soundCard": "pKgOssFkz0F36piD"}, {"additionals": "YXeHZ7FHls3nyvco", "directXVersion": "nqbHQqKLQKe3xmj6", "diskSpace": "s0GqsWncp5LrqbiK", "graphics": "udv9z75SzoCV8ZMi", "label": "2o1nR482D6gNClk9", "osVersion": "c87hosaPFC5zBW3Z", "processor": "gVZCj9ObVGT0Scwl", "ram": "4kNmCi15XTJTgCNN", "soundCard": "H7RtG5Xmo9Q0Wb07"}, {"additionals": "N17fkxZSc6VbE0AG", "directXVersion": "cekjMNHuPXtz8tXx", "diskSpace": "rmzafMUguyDoN91u", "graphics": "c28HoSpGt1g0GGbT", "label": "4Hf2PPKOldkbgX9C", "osVersion": "WJKwXXSbv5eg9q86", "processor": "IaDFjjx6uZerWbtw", "ram": "TX9gNRByjbE8lOLA", "soundCard": "fTXKLzbrddqcKLa7"}], "LevxNHOSEhQRZIp6": [{"additionals": "93lRwtc43atCuCFx", "directXVersion": "bfbz4aQERziPL4dH", "diskSpace": "hOqG5KDdUvk0LEi2", "graphics": "6Ls7mjRxNmvvNtjJ", "label": "NQepUTGhwlY4lPzl", "osVersion": "sCR5rVsyfcH7WjP7", "processor": "HuGz3b5WAEvdRF9b", "ram": "qMj4ro5B19VE838c", "soundCard": "7OydVw0zCqoMZvpI"}, {"additionals": "OO97DmQ5ZOzx6iCJ", "directXVersion": "Tu60IifzMhkk5Pxs", "diskSpace": "jqbCKpMv2Yky9DYk", "graphics": "D2sIllFtBtXJKG3r", "label": "qBmILhtWm8RQvRUb", "osVersion": "UDSiefGEdLucrtO2", "processor": "gCQD057DrDlgC2nz", "ram": "S9SiGUjVAw4v3q6J", "soundCard": "RHcn7KaoCEkRdo6q"}, {"additionals": "HYIZWnXqQ1oHFJ9Q", "directXVersion": "0vqsL9SomqWsGA76", "diskSpace": "yxi0QzZWfmP2sx0K", "graphics": "O5bEJaPnAFjsodyJ", "label": "QVVBrShGbIIuqK8C", "osVersion": "403HgoXCR6XOMXwK", "processor": "dfqk8T4QHK30EX0F", "ram": "clpDl5HsuracO5Mn", "soundCard": "jnxD1OXkxShFVQTR"}], "ekLfjmy8zosRCRgV": [{"additionals": "wbrQKmb01yA7U7dG", "directXVersion": "MjupZkZQY8CNyT4k", "diskSpace": "3DIbfT22G5NpE130", "graphics": "YWSgxpKWtdtdtVW9", "label": "anENmxb9e7vXZV3i", "osVersion": "g8Jg5VByeI3ycMcY", "processor": "YBixKJXCISQdwec1", "ram": "m8BusV9tUh74KVo6", "soundCard": "Xqjz2xUKLNWSmYyV"}, {"additionals": "vyelIJ8QgaLMqi83", "directXVersion": "6ULa7cfZl4VuY6rs", "diskSpace": "Zyo6CBRRnoOikIxX", "graphics": "KKIR6kPmswm5TCAU", "label": "1cKApdJDnE73GLmS", "osVersion": "Zns5owBhoUg4LsGP", "processor": "6KLPXkvUv2XiXaBz", "ram": "smaxjTZPlLitytGk", "soundCard": "a7Kv5TacQKF4OlRG"}, {"additionals": "dmXxETLEQrr3KCAV", "directXVersion": "9alq3hK1G4kKooSN", "diskSpace": "NUZuiynZ64IwncZP", "graphics": "k82GF3eTC0vzZUDj", "label": "9dzGgGVxo9OHgfHu", "osVersion": "myfuBNisecYbcOpR", "processor": "45VDlvSc0Mr7ImwC", "ram": "wGqOf0bNs97KvKyj", "soundCard": "3MqS7Dcmtfh50eOb"}]}, "platforms": ["Android", "Windows", "Linux"], "players": ["Coop", "CrossPlatformMulti", "MMO"], "primaryGenre": "Adventure", "publisher": "WTqgYPixtHk6lWq6", "releaseDate": "1981-02-07T00:00:00Z", "websiteUrl": "EeUmU96FLEak0mJq"}' \
    > test.out 2>&1
eval_tap $? 133 'UpdateApp' test.out

#- 134 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'jRYldcTpdeCD9XPR' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'i4bAQL7VE2wL8Y4J' \
    > test.out 2>&1
eval_tap $? 134 'DisableItem' test.out

#- 135 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'FVUdzA8bvXlDhG7B' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 135 'GetItemDynamicData' test.out

#- 136 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'rorbKIKuOXJPm5zt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rr09CDA8Ij5bGKSu' \
    > test.out 2>&1
eval_tap $? 136 'EnableItem' test.out

#- 137 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'opWQbaCvdPSq8Z27' \
    --itemId 'GpvHCDx55JZ5z6gu' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jpFzlPspQD9IRIpD' \
    > test.out 2>&1
eval_tap $? 137 'FeatureItem' test.out

#- 138 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'DubntPCFxfeoW2Nd' \
    --itemId 'SWzOXjO1NQUqWHBW' \
    --namespace "$AB_NAMESPACE" \
    --storeId '78XREZCiTNAxq26g' \
    > test.out 2>&1
eval_tap $? 138 'DefeatureItem' test.out

#- 139 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'ZrPqCsSDspvgM16s' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Z6rjnkH4ExObppC6' \
    --populateBundle  \
    --region 'CMYDm5ge659UDEOF' \
    --storeId '6gp5UfmjtiVbqJnZ' \
    > test.out 2>&1
eval_tap $? 139 'GetLocaleItem' test.out

#- 140 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'crqrPye7fCwi7Il2' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wIFlHm9N6owMHMtJ' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 18, "code": "1Oqn59tEGm9NYeUT", "comparison": "isGreaterThanOrEqual", "name": "0nx8TqSZdZ5C8mFI", "predicateType": "EntitlementPredicate", "value": "nvzEqBNMF9CZvPxT", "values": ["mb15QeIQF51c4MqJ", "DFjLKFrepy56eW1k", "5zbreMc9fBoU3RHN"]}, {"anyOf": 52, "code": "joBAhAlJGI2YYb6a", "comparison": "is", "name": "BzAzPkt1efGJeJax", "predicateType": "StatisticCodePredicate", "value": "2tHxDb06ZFy3uglS", "values": ["6LvcnGMJbJIYLssM", "HD6LCgdFxRGj00RT", "p2UxvF2uLXWilRD7"]}, {"anyOf": 44, "code": "wKVXGPhEJsc7rZpx", "comparison": "excludes", "name": "DX6gmDfNfPGYYSTu", "predicateType": "SeasonPassPredicate", "value": "POKFLxIwKssw647Y", "values": ["U226l07jPlcYaqYM", "7YfBmhjI9Y28qVce", "wDudnGRufOUGfMjT"]}]}, {"operator": "or", "predicates": [{"anyOf": 96, "code": "r2ccp7R7OqPqIjS4", "comparison": "is", "name": "NXzNX6TGh4UdEwee", "predicateType": "StatisticCodePredicate", "value": "8962e6gtn5pUARJM", "values": ["VCsB7xL4axSPgPCi", "1T8QwMNOAzXmyHEV", "4g9P6a280S5RNB5d"]}, {"anyOf": 47, "code": "T7cBP0918JaEBQBP", "comparison": "isGreaterThan", "name": "6LUnBBR84iAO7sBQ", "predicateType": "SeasonTierPredicate", "value": "76U1EIcklttmrpgF", "values": ["gR70eNLHkVrEFd8x", "ArWJuCAIfNBSHgpF", "5szl0sMY8es36r1F"]}, {"anyOf": 81, "code": "7X9fHr6WvBxmBvNj", "comparison": "excludes", "name": "ktaDf9B22HGgxakP", "predicateType": "SeasonTierPredicate", "value": "Cu1HFaj6Vxs3GuA4", "values": ["S1dS7H7yIS7b5TSD", "RIoMg7Dc5APzfzXD", "ELJFaIaEMW5bhJyL"]}]}, {"operator": "or", "predicates": [{"anyOf": 60, "code": "ZTdFfC8x5aHLsXHl", "comparison": "isGreaterThan", "name": "xaupnTTq9ihZkvFK", "predicateType": "EntitlementPredicate", "value": "qgFddYvifGHawNx6", "values": ["yhniEHLbEQKc0aUv", "lpCI8DhjlxUyrs3O", "rKXDIjYC4df9qswS"]}, {"anyOf": 91, "code": "E1wJhfogWg2Apm0s", "comparison": "isLessThanOrEqual", "name": "UcQBxMSdOOsn2Nd8", "predicateType": "SeasonPassPredicate", "value": "pa19GJDK46Eehx7x", "values": ["IK9D2bTcgaKoccaS", "asqMY9aulsL6NOV5", "agpS6A5mkufBpWVx"]}, {"anyOf": 46, "code": "BUS6uwWrCQt86Jrg", "comparison": "isLessThanOrEqual", "name": "tLAJWpcyNkUvqn6e", "predicateType": "SeasonPassPredicate", "value": "r6FNbKJ05Orya6LS", "values": ["v46sXvpOjrpRo4mY", "AYp7qSiDvsfMUOpW", "SUlugIAknXcSaVYc"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateItemPurchaseCondition' test.out

#- 141 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'rCeQUnYoID2UqO0i' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "AXA9dB4ib8HDOJ8T"}' \
    > test.out 2>&1
eval_tap $? 141 'ReturnItem' test.out

#- 142 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --name 'TKxpVOXvGSrdkqdd' \
    --offset '71' \
    --tag '6dO3zkbDseh4tJdo' \
    > test.out 2>&1
eval_tap $? 142 'QueryKeyGroups' test.out

#- 143 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "GcwMBmegqVUaWMJB", "name": "jrV0p9A7tcHrV0Mb", "status": "ACTIVE", "tags": ["r4drgkDuWS05m0pG", "zazM2BUXnzUEWTiK", "MJAf6AgbiEDMfCck"]}' \
    > test.out 2>&1
eval_tap $? 143 'CreateKeyGroup' test.out

#- 144 GetKeyGroupByBoothName
eval_tap 0 144 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 145 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'WogE5gcfF8AMGZ2F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 145 'GetKeyGroup' test.out

#- 146 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'BS93Mg6TKwdRMraD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Lrwh3d0ykRGkgqUN", "name": "IbJMJ9ABbKVWO2YE", "status": "INACTIVE", "tags": ["WhOScvtQ92iD02YM", "vEUNfoL7JCcMo7Gx", "xXdbYCRexPekTsQx"]}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateKeyGroup' test.out

#- 147 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'MTfaSot7aohFYy4V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 147 'GetKeyGroupDynamic' test.out

#- 148 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'xwHIJ9gzxqAw4vBG' \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '54' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 148 'ListKeys' test.out

#- 149 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'eh0VTiTP4PSrXUS6' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 149 'UploadKeys' test.out

#- 150 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'jYI9lsQFD43Df5qU' \
    --limit '84' \
    --offset '65' \
    --orderNos 'kjsxYtgxplHTPLzy,njFZgF3erw7UsyHq,4bBb0n1JhPUS8BRP' \
    --sortBy 'GV9n769zLJdKMexe' \
    --startTime 'Jc7NvgTSgKjCxZjK' \
    --status 'CHARGEBACK_REVERSED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 150 'QueryOrders' test.out

#- 151 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetOrderStatistics' test.out

#- 152 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'JjIYwqfSRy8GgVk7' \
    > test.out 2>&1
eval_tap $? 152 'GetOrder' test.out

#- 153 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '7fd1GS5YkyhAiAIt' \
    --body '{"description": "nWUmD225fp1egsx3"}' \
    > test.out 2>&1
eval_tap $? 153 'RefundOrder' test.out

#- 154 GetPaymentCallbackConfig
eval_tap 0 154 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 155 UpdatePaymentCallbackConfig
eval_tap 0 155 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 156 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetPaymentMerchantConfig' test.out

#- 157 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["ErheNwqd5priclNN", "qLyrlzrJ4QHbfnAd", "tkujxHff7n1yaNCc"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePaymentDomainWhitelistConfig' test.out

#- 158 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'jgFhS0URBhl0L5FC' \
    --externalId 'bOn46W2B2uPQLrt2' \
    --limit '41' \
    --notificationSource 'NEONPAY' \
    --notificationType 'bVpCgKvPXSDufmKh' \
    --offset '37' \
    --paymentOrderNo '83cV54JsVBRB0rY0' \
    --startDate 'xfWddACyHSmo4KX9' \
    --status 'IGNORED' \
    > test.out 2>&1
eval_tap $? 158 'QueryPaymentNotifications' test.out

#- 159 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId '1k5ZM8btmGsgXNXb' \
    --limit '32' \
    --offset '5' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 159 'QueryPaymentOrders' test.out

#- 160 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "1nc3eFm950dtVAo7", "currencyNamespace": "w4e3v5mh6Rum5pbg", "customParameters": {"Et39uJQpgEtchTe3": {}, "nt7t9ztprSfW9Out": {}, "ADrNGBWSJ1zQKxVm": {}}, "description": "RTawjiZPMoZZcyGE", "extOrderNo": "HxAKDQher3usApPd", "extUserId": "JPn9eIdhIBvTTupA", "itemType": "MEDIA", "language": "kw-VT", "metadata": {"l7gIKBc7OYTylFRA": "JKySnC0cfPl3Z2zS", "Bbs4PAV72u8AxE2I": "QeoxYV4UcYzswAGp", "XqQxctuVaqPJGAHE": "ZmuQrZ8GaQ4OZ2nD"}, "notifyUrl": "odm4TNs8mAj6IKSY", "omitNotification": false, "platform": "4uyzZo1rj0ZrLQjk", "price": 97, "recurringPaymentOrderNo": "A2vaNeDiSqTfmAVg", "region": "50kOdJagEmTuaxlx", "returnUrl": "gywkbdOsyxX1tfW4", "sandbox": true, "sku": "oYUT4jyCVJ0V8obT", "subscriptionId": "lGVThz4bm41oIcV3", "targetNamespace": "3yjPxibDjfF7JkjC", "targetUserId": "VpZKMxkFkBtXMU6K", "title": "RIm5xBoIi99ctgFX"}' \
    > test.out 2>&1
eval_tap $? 160 'CreatePaymentOrderByDedicated' test.out

#- 161 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'asxp5h780ktjQw2y' \
    > test.out 2>&1
eval_tap $? 161 'ListExtOrderNoByExtTxId' test.out

#- 162 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XzaQWaF2PqUfbpMp' \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentOrder' test.out

#- 163 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Rl6xRyV19cborUHe' \
    --body '{"extTxId": "CpqnZ5NW623WWn2Z", "paymentMethod": "JY3QvRa7CDRTcsAH", "paymentProvider": "WALLET"}' \
    > test.out 2>&1
eval_tap $? 163 'ChargePaymentOrder' test.out

#- 164 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'WdaNV1VaZTkbbuWi' \
    --body '{"description": "iA4UTDgS2SVEo5M8"}' \
    > test.out 2>&1
eval_tap $? 164 'RefundPaymentOrderByDedicated' test.out

#- 165 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0LLbku9GYH4ijqOV' \
    --body '{"amount": 79, "currencyCode": "CrscDPbklTHcmgXs", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 98, "vat": 70}' \
    > test.out 2>&1
eval_tap $? 165 'SimulatePaymentOrderNotification' test.out

#- 166 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'j3Mjml6BpCODWGOL' \
    > test.out 2>&1
eval_tap $? 166 'GetPaymentOrderChargeStatus' test.out

#- 167 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'MmCZUeelXYyNrXwe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "iCnDldRPRfd6mLZ0", "serviceLabel": 66}' \
    > test.out 2>&1
eval_tap $? 167 'GetPsnEntitlementOwnership' test.out

#- 168 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'diaRjuLsKZoqnpKw' \
    --body '{"delegationToken": "hpZVdw5UMa8ymxtE", "sandboxId": "FLwELCY2vIddlxnA"}' \
    > test.out 2>&1
eval_tap $? 168 'GetXboxEntitlementOwnership' test.out

#- 169 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 169 'GetPlatformEntitlementConfig' test.out

#- 170 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedPlatformOrigins": ["Twitch", "Nintendo", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 170 'UpdatePlatformEntitlementConfig' test.out

#- 171 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 171 'GetPlatformWalletConfig' test.out

#- 172 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["Twitch", "GooglePlay", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 172 'UpdatePlatformWalletConfig' test.out

#- 173 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 173 'ResetPlatformWalletConfig' test.out

#- 174 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 174 'GetRevocationConfig' test.out

#- 175 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}' \
    > test.out 2>&1
eval_tap $? 175 'UpdateRevocationConfig' test.out

#- 176 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 176 'DeleteRevocationConfig' test.out

#- 177 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'qvLQixPKVSmWa8TG' \
    --limit '21' \
    --offset '7' \
    --source 'IAP' \
    --startTime 'FmOHW0j9suukPE4J' \
    --status 'SUCCESS' \
    --transactionId 'jnxp5Cl8ggaEmCcu' \
    --userId 'K2hHviBEWpbusO6E' \
    > test.out 2>&1
eval_tap $? 177 'QueryRevocationHistories' test.out

#- 178 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 178 'GetRevocationPluginConfig' test.out

#- 179 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "yVqstpgZpbz77y88"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "Q8GL7jBF1R5OexAP"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 179 'UpdateRevocationPluginConfig' test.out

#- 180 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'DeleteRevocationPluginConfig' test.out

#- 181 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 181 'UploadRevocationPluginConfigCert' test.out

#- 182 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fjcTEFXcTwEtnHxP", "eventTopic": "5pVtN4jNVIdruEA3", "maxAwarded": 41, "maxAwardedPerUser": 53, "namespaceExpression": "CJzsE8WObt6t0w8L", "rewardCode": "OBxE15JYj4IqWK09", "rewardConditions": [{"condition": "l4wkrzahXR1sDEDV", "conditionName": "KDINE3HjCiVR1dQ8", "eventName": "kuhb4pUwnGptHUpl", "rewardItems": [{"duration": 47, "endDate": "1984-05-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "NkQiKp2oac8QTNEu", "quantity": 57, "sku": "rfq6ECDD6OGkuLs9"}, {"duration": 13, "endDate": "1992-11-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "cQijMBhs0kDP6d3n", "quantity": 42, "sku": "FidImWONTvCPMGLd"}, {"duration": 2, "endDate": "1981-07-20T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "kBcDpzD9zh6dtPK4", "quantity": 11, "sku": "sE0GHDOFjrfqJcyx"}]}, {"condition": "T2a7fCFAUzLELiM5", "conditionName": "73TdtWjfVciuLnLs", "eventName": "BKGsALPuCOyphUUA", "rewardItems": [{"duration": 97, "endDate": "1974-01-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "zaP0wpZgQEvFzox9", "quantity": 45, "sku": "yUonirH4URx3NkKQ"}, {"duration": 56, "endDate": "1996-05-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Bedcr6PM51z7i0wQ", "quantity": 62, "sku": "egK2t46EG8I2lTvi"}, {"duration": 74, "endDate": "1991-01-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "8IEbc9YITN98j4P2", "quantity": 53, "sku": "qvVsakylHikKkpOj"}]}, {"condition": "qwgKvfXXs8pDqm31", "conditionName": "AZSRkuw6q8FgqG46", "eventName": "RsFK7eYlSU3vYcHZ", "rewardItems": [{"duration": 56, "endDate": "1976-07-21T00:00:00Z", "identityType": "ITEM_ID", "itemId": "pBo2JYkwLdmR97u9", "quantity": 78, "sku": "fcqNEn4IZ0Dv6b8W"}, {"duration": 39, "endDate": "1971-01-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MVvLbG04KKnh3jvW", "quantity": 3, "sku": "Qp3kTyL4CsLwiWUM"}, {"duration": 5, "endDate": "1994-05-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "k0AzdgIunRkTxsGd", "quantity": 35, "sku": "1IAJQpb6r8ZeaSHw"}]}], "userIdExpression": "QuiH3Ozu4G6bXxp0"}' \
    > test.out 2>&1
eval_tap $? 182 'CreateReward' test.out

#- 183 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'gYZyF9fJBJkSOrF9' \
    --limit '60' \
    --offset '49' \
    --sortBy 'rewardCode:asc,namespace' \
    > test.out 2>&1
eval_tap $? 183 'QueryRewards' test.out

#- 184 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'ExportRewards' test.out

#- 185 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 185 'ImportRewards' test.out

#- 186 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'FcDwBGyBiHewZkwE' \
    > test.out 2>&1
eval_tap $? 186 'GetReward' test.out

#- 187 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'euzBBRSknxyWkZOb' \
    --body '{"description": "uvig8sMuss76ezTr", "eventTopic": "sDZNYUV48Oh6I45X", "maxAwarded": 68, "maxAwardedPerUser": 13, "namespaceExpression": "vUtPYONZdFk75lkj", "rewardCode": "QNHrjaboGomguUqe", "rewardConditions": [{"condition": "uZh5qtrRbNnGejdT", "conditionName": "GvZgN5hshSe5YmZX", "eventName": "KEQLkM6o3eGSP4Ht", "rewardItems": [{"duration": 26, "endDate": "1977-05-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "HrsOFsbhRow4iaYK", "quantity": 50, "sku": "xNwp1lGkYoq8HP1T"}, {"duration": 79, "endDate": "1972-02-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7okHl1wMht2Izq7T", "quantity": 58, "sku": "NG8rGp7Fadvo5Ezp"}, {"duration": 43, "endDate": "1988-12-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1mx6K17GL1CrO4Zu", "quantity": 29, "sku": "LBmvdncQkcZb8cWd"}]}, {"condition": "VH9bww15zZsaYrJA", "conditionName": "e5Kd5QB96ndlO6iP", "eventName": "GC9RhzMC7V8BEphn", "rewardItems": [{"duration": 89, "endDate": "1994-04-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "nfdOAmu1dX1NqD20", "quantity": 89, "sku": "gi87K58pQswqKLut"}, {"duration": 71, "endDate": "1985-11-22T00:00:00Z", "identityType": "ITEM_ID", "itemId": "usOsa92F6iwkJIYO", "quantity": 77, "sku": "7Yja1soDE1K0SvGr"}, {"duration": 80, "endDate": "1991-05-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "lpuXD9H1u1CvzWPc", "quantity": 45, "sku": "0t6foPPH94SUinY5"}]}, {"condition": "diUlqgvY7dPPyahp", "conditionName": "pgxJhk4EdTZ000rS", "eventName": "92594HLvWFsXHtMP", "rewardItems": [{"duration": 90, "endDate": "1976-11-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "L5dREQbCqfh0gpAB", "quantity": 64, "sku": "3CX0hpB1ZGMMo5DS"}, {"duration": 30, "endDate": "1984-07-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "HjCnFRdSihcvszzQ", "quantity": 77, "sku": "SeeJOlxa395rghZw"}, {"duration": 68, "endDate": "1987-02-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "dZJkkGhYvXYMIyaE", "quantity": 80, "sku": "MKGBnzh4suaGIztt"}]}], "userIdExpression": "TncVBf5g3oeuHiNy"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateReward' test.out

#- 188 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'LkfPQPmjUkvSs5Ym' \
    > test.out 2>&1
eval_tap $? 188 'DeleteReward' test.out

#- 189 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'IejozmG5HlrIfMAv' \
    --body '{"payload": {"vpkAHRJHZyfrXZmi": {}, "JX4CjKCeIRIr997K": {}, "KpJXTLbYWpqeXjaf": {}}}' \
    > test.out 2>&1
eval_tap $? 189 'CheckEventCondition' test.out

#- 190 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId '1f5fjNMZjKJ05puX' \
    --body '{"conditionName": "3197WrMnJtovSMFw", "userId": "8X4zxbdfXgunt1oM"}' \
    > test.out 2>&1
eval_tap $? 190 'DeleteRewardConditionRecord' test.out

#- 191 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'NZ68eovHSH3xV3UR' \
    --limit '71' \
    --offset '88' \
    --start 'ooMLnemwKAvgDXNr' \
    --storeId 'FEE4Jf4hQpsLOcLt' \
    --viewId 'Zw0efmEVcW7mxbS5' \
    > test.out 2>&1
eval_tap $? 191 'QuerySections' test.out

#- 192 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UOoICxQMit8555Ni' \
    --body '{"active": true, "displayOrder": 76, "endDate": "1991-05-04T00:00:00Z", "ext": {"NFpRE5pS85yTIRWv": {}, "LRy58UKWPv3F7S0w": {}, "CVlYQi9cfMCeNnu6": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 67, "itemCount": 59, "rule": "SEQUENCE"}, "items": [{"id": "PPLRDEXLXZWXvqNC", "sku": "HvNpeMjMzguq6HFI"}, {"id": "qaqwH9J6JLb5f3SB", "sku": "MyJUdwEBRrHAWUFq"}, {"id": "TooGGnPEgY0t7QQW", "sku": "l42byOwXgKyPhXmc"}], "localizations": {"ysae8HpWH4xiz3fW": {"description": "thJSu2pUIIuPLFAt", "localExt": {"cWhjAP57QbWvSSp7": {}, "1zEPPfmAQiqRRC2c": {}, "aquMRtQOILcaDqUI": {}}, "longDescription": "TBHQR5ISNoFR3GUx", "title": "dMuvmL0UBfwzaaeP"}, "3Wd0Wrb8s3GW0CY0": {"description": "vAfbq8xoCurq4lpH", "localExt": {"XrbVBh60NUA2aKQw": {}, "nXrmi6ya8u4sQPva": {}, "f1AcweR7tJW3MLMo": {}}, "longDescription": "b1hUnIzIpUM8KK1k", "title": "GFN0NUNGKxdlAUDF"}, "QuGPzAuT7M6OBrNw": {"description": "ioKnXPVZaDcXsV1T", "localExt": {"nsZioDiBgprzahPB": {}, "0FKMa0YeyNBQWUHD": {}, "BnBeePkqg6Zt1Lr5": {}}, "longDescription": "BlO8K6LH4dSaa8XY", "title": "Hug51ZTogG0N7Hvn"}}, "name": "uq1kJ1kpHcQtnIc9", "rotationType": "FIXED_PERIOD", "startDate": "1981-11-06T00:00:00Z", "viewId": "fKU3D8WVPh0Z7YiG"}' \
    > test.out 2>&1
eval_tap $? 192 'CreateSection' test.out

#- 193 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E2cyzTMBY7Xd0OoE' \
    > test.out 2>&1
eval_tap $? 193 'PurgeExpiredSection' test.out

#- 194 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'Ng2Lw7uepmahXojV' \
    --storeId 'ZYz2zMU9jLzNV3Ga' \
    > test.out 2>&1
eval_tap $? 194 'GetSection' test.out

#- 195 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'G43R6nlRPrEAYqRB' \
    --storeId 'eSc5uShoj3dGHMeo' \
    --body '{"active": false, "displayOrder": 32, "endDate": "1986-01-22T00:00:00Z", "ext": {"BOsQ0Gax0iX05IT9": {}, "Agsjl5NmnSHhxNmC": {}, "e4txY0MsPc9EMgf9": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 58, "itemCount": 85, "rule": "SEQUENCE"}, "items": [{"id": "U2wEzUYUTmZ8JSMe", "sku": "NmRocp400RZe8Bzx"}, {"id": "9aGEI22BTCZs97TJ", "sku": "I8GPrM24F3celFgM"}, {"id": "62HQtgzQhO3nR8j8", "sku": "DlP6OGbn8vmfMYGL"}], "localizations": {"t1AjKhh3JMX7xSrz": {"description": "1EH6X2SM3xzsNrJz", "localExt": {"WBcdFlo7oAsOlfLB": {}, "1J19b5rTfiL2P3r1": {}, "a8KIJH33aKkPuWD5": {}}, "longDescription": "9MgTy1HA58Jt5NaR", "title": "OjSKFEuZo2ElXYSS"}, "4ezBRSiOyReviDax": {"description": "lPdhwmcH03yoMxzR", "localExt": {"R6xd9rTh3ureaIbx": {}, "M3Wev9pZQjWAN0tn": {}, "y16ZHZtuSJGQCrM7": {}}, "longDescription": "JEMRPkdTcAzkIlnd", "title": "N5xeayr3vUKMuIiz"}, "2MiAAKcvAXnxnH0Q": {"description": "IhoJRY807VmBT4wZ", "localExt": {"XQZZrSsuYiIPei0p": {}, "XglJYnKkoCAZuolA": {}, "WnxkImVbDP0QX31g": {}}, "longDescription": "I7VmnGIRMvXe6Bip", "title": "hIFe2bzr6qQw6fSE"}}, "name": "SkM19OPMBb12gpmS", "rotationType": "CUSTOM", "startDate": "1991-03-31T00:00:00Z", "viewId": "Mu9QVrMeD4bD8gIS"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateSection' test.out

#- 196 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'E34yIAZQeigiA3wB' \
    --storeId 'rmBYIlZeheP72AB8' \
    > test.out 2>&1
eval_tap $? 196 'DeleteSection' test.out

#- 197 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 197 'ListStores' test.out

#- 198 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "EO3YrlyrWowUpUDV", "defaultRegion": "LlTtuJJsHZVsG6iz", "description": "JZruOJvSRFLDSdj8", "supportedLanguages": ["elbtHvDU91DmHzwi", "qVPCJ5j18Ou3aY8n", "ceFU5GKmcEKp8AQw"], "supportedRegions": ["qgJs6O0Qj0ccMkdz", "6zPz3BVHAqp4O9XS", "jap24esyjh6Wc3mi"], "title": "gf2n6iQyr5cb5YL6"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateStore' test.out

#- 199 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'APP' \
    > test.out 2>&1
eval_tap $? 199 'GetCatalogDefinition' test.out

#- 200 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 200 'DownloadCSVTemplates' test.out

#- 201 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "ITEM", "fieldsToBeIncluded": ["0gHAkltcR3eHFbiA", "luHv7Hssd05pHBJX", "5ln8PZbYVD8RiaTs"], "idsToBeExported": ["dD4d3kSbTkHPMUvO", "AUXkw36cr2WJQqS7", "Tq4YIyZAFQ6lZfa2"], "storeId": "jdNvpWf32JS1av9V"}' \
    > test.out 2>&1
eval_tap $? 201 'ExportStoreByCSV' test.out

#- 202 ImportStore
eval_tap 0 202 'ImportStore # SKIP deprecated' test.out

#- 203 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'GetPublishedStore' test.out

#- 204 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 204 'DeletePublishedStore' test.out

#- 205 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 205 'GetPublishedStoreBackup' test.out

#- 206 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 206 'RollbackPublishedStore' test.out

#- 207 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NpVLT0LvqcfSdO1n' \
    > test.out 2>&1
eval_tap $? 207 'GetStore' test.out

#- 208 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'AjY5FvADb3GUQgci' \
    --body '{"defaultLanguage": "632w6LUrHuKBoNTp", "defaultRegion": "PQXDNHto74GcmVf0", "description": "fbCU9QdPuWeMEeL0", "supportedLanguages": ["EJG67g4W1eAmDxP2", "3qstMuikKc6VNU85", "70siWm3V9sirE0JO"], "supportedRegions": ["QxWeHypqCWMDPRI2", "cCk8zHR8VyCC0EQw", "E0cXokXbwKDtVmrY"], "title": "Qu7hZvHfiT9s9pK8"}' \
    > test.out 2>&1
eval_tap $? 208 'UpdateStore' test.out

#- 209 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HuUY1QQHQ0NCEddJ' \
    > test.out 2>&1
eval_tap $? 209 'DeleteStore' test.out

#- 210 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tx6GV01vD7lNLxlp' \
    --action 'DELETE' \
    --itemSku 'IldsgB4hOxb88WgK' \
    --itemType 'LOOTBOX' \
    --limit '78' \
    --offset '78' \
    --selected  \
    --sortBy 'createdAt,createdAt:asc,updatedAt:asc' \
    --status 'PUBLISHED' \
    --type 'CATEGORY' \
    --updatedAtEnd 'eDQCfwucHRL3o2Ns' \
    --updatedAtStart 'trL6TsJeRcE7GuwK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 210 'QueryChanges' test.out

#- 211 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'n63KIDTkUCqbbHGJ' \
    > test.out 2>&1
eval_tap $? 211 'PublishAll' test.out

#- 212 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GOTvKKRTHDntaFiu' \
    > test.out 2>&1
eval_tap $? 212 'PublishSelected' test.out

#- 213 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fH2YR6QU7fj6w17a' \
    > test.out 2>&1
eval_tap $? 213 'SelectAllRecords' test.out

#- 214 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rNs12hOoLVM7UFnu' \
    --action 'UPDATE' \
    --itemSku 'e2hgU56xtyJtnbTD' \
    --itemType 'COINS' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd '2OW4Zw5QwVKWNy2t' \
    --updatedAtStart 'nF2MifJR4hr4gdJD' \
    > test.out 2>&1
eval_tap $? 214 'SelectAllRecordsByCriteria' test.out

#- 215 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ujYnVnFK6gB6ZxC6' \
    --action 'DELETE' \
    --itemSku 'GBXjNyRCtPOr1FU3' \
    --itemType 'EXTENSION' \
    --type 'STORE' \
    --updatedAtEnd 'y3gdDms3kb1htW0U' \
    --updatedAtStart 'GJpwQZlXuzu3m9u6' \
    > test.out 2>&1
eval_tap $? 215 'GetStatistic' test.out

#- 216 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '7JjCDwg186hGWKfO' \
    > test.out 2>&1
eval_tap $? 216 'UnselectAllRecords' test.out

#- 217 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '9MnoT3t99HmcxzjD' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hTrcBKtU956hOg8o' \
    > test.out 2>&1
eval_tap $? 217 'SelectRecord' test.out

#- 218 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'ukDVdweG0sFHxTHa' \
    --namespace "$AB_NAMESPACE" \
    --storeId '2k60SzCqUgq1gLbc' \
    > test.out 2>&1
eval_tap $? 218 'UnselectRecord' test.out

#- 219 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IMevTmC631p7q794' \
    --targetStoreId 'bu49lINFTtERAXT2' \
    > test.out 2>&1
eval_tap $? 219 'CloneStore' test.out

#- 220 ExportStore
eval_tap 0 220 'ExportStore # SKIP deprecated' test.out

#- 221 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'h3hcQ2wV3ZbBTnNQ' \
    --end 'nVUhA5WnzVZdj8ts' \
    --limit '50' \
    --offset '26' \
    --sortBy 'zC4QaLXp3o4TDraE' \
    --start 'EaDNJbVd20FVHevC' \
    --success  \
    > test.out 2>&1
eval_tap $? 221 'QueryImportHistory' test.out

#- 222 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jthJUb7jKuMrFaoL' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'ulzp3sZxImVK5yh2' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 222 'ImportStoreByCSV' test.out

#- 223 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'YlqMmu2pvF6rP03b' \
    --limit '87' \
    --offset '69' \
    --sku 'aq1cT88H6RCW8gJm' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'Lh56AWXoMiowdWSs' \
    > test.out 2>&1
eval_tap $? 223 'QuerySubscriptions' test.out

#- 224 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9DQ0VU1HED9CGo9a' \
    > test.out 2>&1
eval_tap $? 224 'RecurringChargeSubscription' test.out

#- 225 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'UXj3rh0UyqxVWlIM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'GetTicketDynamic' test.out

#- 226 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'Y5tTJw4KV104MtMh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "KHmSjqPuQZX5KjdN"}' \
    > test.out 2>&1
eval_tap $? 226 'DecreaseTicketSale' test.out

#- 227 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'rEwfWo2MwulLg4bs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'GetTicketBoothID' test.out

#- 228 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'O4YHEYLjTSNDf3za' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 53, "orderNo": "CXVMrDYKe2eTf1ax"}' \
    > test.out 2>&1
eval_tap $? 228 'IncreaseTicketSale' test.out

#- 229 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 58, "currencyCode": "6GqT2vSLLiMvcu39", "expireAt": "1996-04-11T00:00:00Z"}, "debitPayload": {"count": 73, "currencyCode": "hxczskbSUbOZ9WNl", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 14, "entitlementCollectionId": "pJmNAbl1g5ZmTTGY", "entitlementOrigin": "IOS", "itemIdentity": "bP4QVey9pEz1TV5c", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 39, "entitlementId": "OrTn2huwPgyUzBUW"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 74, "currencyCode": "eDNfUESLlwHv3Jgt", "expireAt": "1973-06-03T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "w5Xl7ZZrDZdbuvCF", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 1, "entitlementCollectionId": "TGkO6aIYqftw1SrM", "entitlementOrigin": "IOS", "itemIdentity": "nhSEanfUYrMU6A43", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 32, "entitlementId": "tetBW3pvAJJieHhv"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 66, "currencyCode": "hzXDv3TAtBjP4HSu", "expireAt": "1975-04-22T00:00:00Z"}, "debitPayload": {"count": 58, "currencyCode": "EQv2Oj8TFNeGtJGj", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 2, "entitlementCollectionId": "tU0CDrlQpKB8qoel", "entitlementOrigin": "Epic", "itemIdentity": "QK3aSOYdmMDikc3F", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 24, "entitlementId": "9chqeiUGQMwNwDlY"}, "type": "CREDIT_WALLET"}], "userId": "li3p8YaAdel3hHMS"}, {"operations": [{"creditPayload": {"balanceOrigin": "Twitch", "count": 33, "currencyCode": "AiscGRWzkCl1ZKuP", "expireAt": "1983-05-21T00:00:00Z"}, "debitPayload": {"count": 20, "currencyCode": "ZddP8lLQo6tHj4z4", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 54, "entitlementCollectionId": "Adu9BYRHrVTehrqg", "entitlementOrigin": "Other", "itemIdentity": "ubprKX68jTyRd3Lr", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 23, "entitlementId": "x6U1v6zSLjm9zmzU"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 97, "currencyCode": "Pj90jmLTt5YQGawc", "expireAt": "1978-01-17T00:00:00Z"}, "debitPayload": {"count": 25, "currencyCode": "dpdCqVeePMSqb8y8", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 50, "entitlementCollectionId": "JTUQY40Zrpn0vAD9", "entitlementOrigin": "Oculus", "itemIdentity": "qqqff2iWi4yP3uqN", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 76, "entitlementId": "ig6YcDA8Z3g62oGY"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 21, "currencyCode": "ersDmJLUHAKtfXCK", "expireAt": "1992-01-09T00:00:00Z"}, "debitPayload": {"count": 28, "currencyCode": "dvUMDZeO4U55wdCp", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 32, "entitlementCollectionId": "6r0e0J6vyqPw7Ylm", "entitlementOrigin": "Steam", "itemIdentity": "3kES0Hi88UYgSV40", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 44, "entitlementId": "V29QsQk100eu5Ucx"}, "type": "FULFILL_ITEM"}], "userId": "KeWizEpw1zN0mOYg"}, {"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 46, "currencyCode": "hHMz9dddLWJWDuSY", "expireAt": "1981-06-26T00:00:00Z"}, "debitPayload": {"count": 59, "currencyCode": "LyH9kcSBdk7MwQzn", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 77, "entitlementCollectionId": "TYoMDAaUXSuBQdvd", "entitlementOrigin": "GooglePlay", "itemIdentity": "Dve0Z2G2N09VIbbs", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 30, "entitlementId": "4fQKDZX6plErw0Gb"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 74, "currencyCode": "CbphW4YMhJ0S50be", "expireAt": "1984-09-28T00:00:00Z"}, "debitPayload": {"count": 48, "currencyCode": "LHW882riiPfRQ3rJ", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 10, "entitlementCollectionId": "SZBvkehRn83B0nrW", "entitlementOrigin": "Oculus", "itemIdentity": "7hiP1lzkzjYDw6mL", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 17, "entitlementId": "ordrJkD6vy60uRMT"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 75, "currencyCode": "v5zyUUyNJkvA5xF3", "expireAt": "1984-03-31T00:00:00Z"}, "debitPayload": {"count": 69, "currencyCode": "qMnE9Wj90EQzOidr", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 27, "entitlementCollectionId": "t4XTNwpp0ni1YfIg", "entitlementOrigin": "Twitch", "itemIdentity": "ZND0wgYOilX1e182", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 16, "entitlementId": "LBaIwlokbAFW8RgB"}, "type": "FULFILL_ITEM"}], "userId": "kKCySLA8cKCs0dFY"}], "metadata": {"RSa2OULZ0iOZJiOA": {}, "h1SpLhMF2Pav11Fu": {}, "U8iXCRz8KgqgwijY": {}}, "needPreCheck": true, "transactionId": "IBpYC4txul6VKYlN", "type": "YYlHPwKDpJmkeoAk"}' \
    > test.out 2>&1
eval_tap $? 229 'Commit' test.out

#- 230 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '66' \
    --status 'INIT' \
    --type 'Z4pgyJYwclb4gd4Q' \
    --userId 'gQut2hiPuDdOPHcN' \
    > test.out 2>&1
eval_tap $? 230 'GetTradeHistoryByCriteria' test.out

#- 231 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '9drwqytieXpIZfr5' \
    > test.out 2>&1
eval_tap $? 231 'GetTradeHistoryByTransactionId' test.out

#- 232 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XDq9dGLHjtgE2bTX' \
    --body '{"achievements": [{"id": "JxCCFqPNDqWrpkWn", "value": 28}, {"id": "OpaRDwYLge851PbK", "value": 88}, {"id": "MFKvw5TWjAh4gy41", "value": 76}], "steamUserId": "EZDRNkk4DJUofJXK"}' \
    > test.out 2>&1
eval_tap $? 232 'UnlockSteamUserAchievement' test.out

#- 233 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId '8RGS0zCYRVmbfzwU' \
    --xboxUserId 'msy0stUmKdXiiTOb' \
    > test.out 2>&1
eval_tap $? 233 'GetXblUserAchievements' test.out

#- 234 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'NdqkWa13g3pgHx6u' \
    --body '{"achievements": [{"id": "Pf6jQZcYerH933X7", "percentComplete": 18}, {"id": "OpzTrRzCCafADJfW", "percentComplete": 56}, {"id": "GGdJvucDbs6Udccu", "percentComplete": 79}], "serviceConfigId": "5XD4S1ilfgff7Et4", "titleId": "uY8nlBwGNHgfgwZw", "xboxUserId": "VMvshGmsg6ZJYnkH"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateXblUserAchievement' test.out

#- 235 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'DnHTlRugM7a2UZge' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeCampaign' test.out

#- 236 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'esipbP027okM5E8t' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeEntitlement' test.out

#- 237 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'AajVSvLRj306RDua' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeFulfillment' test.out

#- 238 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'SixXEdloYZBkatNL' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizeIntegration' test.out

#- 239 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'c42eq0O6VsXtOlQw' \
    > test.out 2>&1
eval_tap $? 239 'AnonymizeOrder' test.out

#- 240 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'j5xPvm7c5nPR0Y1s' \
    > test.out 2>&1
eval_tap $? 240 'AnonymizePayment' test.out

#- 241 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'ffUaZ64dFpiv8o9G' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeRevocation' test.out

#- 242 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'w4QtKgyIeySoUxoM' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeSubscription' test.out

#- 243 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'rj2J4JGQZAtyjTxn' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeWallet' test.out

#- 244 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'lmSyjEaFH2DRN6HI' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 244 'GetUserDLCByPlatform' test.out

#- 245 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '9yFSfdZIv8oYWPUS' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 245 'GetUserDLC' test.out

#- 246 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'bTt6M2XizikCh6q0' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId '7EFBz43E9FkOPVu2' \
    --entitlementClazz 'APP' \
    --entitlementName 'fDG5jvMOaXrDlEX4' \
    --features '2U0syrGNhBmgT2q0,kIbrJ2S5Pf1Lvg8k,YEVylINJpxFY8E6p' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'U8eHjh0aTjIOaQt0,snbE0yMvqF7TJ9uB,0zypjJiu7BIimNuw' \
    --limit '57' \
    --offset '15' \
    --origin 'Twitch' \
    > test.out 2>&1
eval_tap $? 246 'QueryUserEntitlements' test.out

#- 247 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'BVhuSMHhf5R2MkxQ' \
    --body '[{"collectionId": "TAYGfE6hXZ7XLoWC", "endDate": "1988-05-15T00:00:00Z", "grantedCode": "f0dZEeXBd6mGG6SH", "itemId": "cZbX2wNnT6A9zosm", "itemNamespace": "DnXoncy7NZQ4PkAP", "language": "cdF", "metadata": {"YvaWLoKzHnngdfFn": {}, "OfY9stXH6LYXXMnd": {}, "xBPKmHVB7cNzHhvx": {}}, "origin": "Epic", "quantity": 72, "region": "4xAPZ86WNnQOhusP", "source": "OTHER", "startDate": "1984-12-05T00:00:00Z", "storeId": "466u8agb5HPsBU0E"}, {"collectionId": "o6QJ9vBRJ4UP09fa", "endDate": "1971-08-28T00:00:00Z", "grantedCode": "LwcAg57BYBVCbi0i", "itemId": "fdPyKf3SwHekWIz4", "itemNamespace": "rXlH5jw99HxCjXWc", "language": "xy_971", "metadata": {"6DxpwBm2N8PdQ5mQ": {}, "aGXEbnmWR0H3EkrH": {}, "qaLNdfKszYZzOg11": {}}, "origin": "GooglePlay", "quantity": 60, "region": "6fIaHSx5bClxUOBm", "source": "OTHER", "startDate": "1982-09-04T00:00:00Z", "storeId": "v5pmiIVnhlLoMems"}, {"collectionId": "p7o3F2LQw7Y2VdSx", "endDate": "1974-11-21T00:00:00Z", "grantedCode": "Xez7VvS0C9JLVQQP", "itemId": "a7PPx4Zi6WaC8wk7", "itemNamespace": "HMbJhNwZgf5nlMDO", "language": "aVCz_Yc", "metadata": {"PFcyUnKXA3mcyMmX": {}, "6WF8jtNAVOYqSH53": {}, "3YlJ93CCGBXv4fP4": {}}, "origin": "Nintendo", "quantity": 84, "region": "weMEZo2ZnL1Zg2Jf", "source": "REWARD", "startDate": "1976-02-19T00:00:00Z", "storeId": "MgkVWJYzSCIDxWUx"}]' \
    > test.out 2>&1
eval_tap $? 247 'GrantUserEntitlement' test.out

#- 248 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'gOzeRNHIqK5PT404' \
    --activeOnly  \
    --appId 'mFw4HJv5T2kIQOec' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementByAppId' test.out

#- 249 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'fLsYKTmUnKlrOsJm' \
    --activeOnly  \
    --limit '63' \
    --offset '13' \
    --appType 'GAME' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserEntitlementsByAppType' test.out

#- 250 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '31cA0PwZxTIZVSGQ' \
    --ids 'yTzhs9Asy4d629N4,YnolVWA2dWxBs056,jkPCUuE1pgdHvlQK' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementsByIds' test.out

#- 251 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iR7SDQUDavOlKT5E' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'N5xMRgU7cPqNZrLC' \
    --itemId 'RRUysya4J3rvTzMT' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementByItemId' test.out

#- 252 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'MSwrNov2GW9i54JY' \
    --ids '23AUWFTLq0W1JqwK,s1mO80L7IOHlf6j8,PZOzUiQKZqz5NSp0' \
    --platform 'B7LODN3Boi2sSAO2' \
    > test.out 2>&1
eval_tap $? 252 'GetUserActiveEntitlementsByItemIds' test.out

#- 253 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'n4MZQt753XQB93rO' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'vEOaRcqTgF0xtQAX' \
    --sku 'oDoFkmA3fgzcwdgJ' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementBySku' test.out

#- 254 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjIyGfiNBQy41M1g' \
    --appIds 'zGCbaxw33rNbE4bb,DU4FMTbQaANJOODG,erDCWcl3VSJENQop' \
    --itemIds 'eHD6iKBGm5Cj7Rqn,JUmfDmofxvN8pRGo,UtmbWZbEjPyq35BW' \
    --platform 'Doc3qNcQFFyHv141' \
    --skus 'NPqjRUMKSQjFdjqT,aZFsWzbqwTZQIN5j,C6a8mEVCXHmFnrSL' \
    > test.out 2>&1
eval_tap $? 254 'ExistsAnyUserActiveEntitlement' test.out

#- 255 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '0PJcZQaCeNLYxMID' \
    --platform '9pqZ5rryiMMt6fQt' \
    --itemIds 'LhzylaquioT3QBt2,9AiRASsuFM4ahGw7,XcF1Qwzz606UGXPh' \
    > test.out 2>&1
eval_tap $? 255 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 256 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'oNZlXMef7AvS3TfK' \
    --appId 'x6ByTygbtOtcQS4C' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 257 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'mgw1wRUnIVYxY6Oh' \
    --entitlementClazz 'APP' \
    --platform 'K0M2B2hbqJin37P6' \
    --itemId '9t1KqeGz7qbPnXEu' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementOwnershipByItemId' test.out

#- 258 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'OzzkoBmMR9C4qPqJ' \
    --ids 'rAdh1HIk7vCEq7FQ,2S5VeW9ddxzLPV8w,DjsnyPh5yNbYXmlA' \
    --platform 'Oi1SC3I1SjkH42Lt' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementOwnershipByItemIds' test.out

#- 259 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'yZKrTJo0L5sHil4Q' \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'Z3cnDq0ddZG0EpfG' \
    --sku 'AqHKcSxUc2YgRpk2' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementOwnershipBySku' test.out

#- 260 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFGIgIpscUpVAciu' \
    > test.out 2>&1
eval_tap $? 260 'RevokeAllEntitlements' test.out

#- 261 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '2XPPUxzXHUvxhvTZ' \
    --entitlementIds 'cvRKoaM4ozSAg8FT' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlements' test.out

#- 262 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'LrByWOJhbocoGlPz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dfxcC3rpWhSpq0In' \
    > test.out 2>&1
eval_tap $? 262 'GetUserEntitlement' test.out

#- 263 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'xMLpP7n7M3JXjEvs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j5WcQ99M1yuXeqV3' \
    --body '{"collectionId": "1LX2ehcMnM6QtjzQ", "endDate": "1975-01-05T00:00:00Z", "nullFieldList": ["DlUMCGnxZwak7KHn", "zGASmVzePIroz41o", "QCuXeTRyJQrNLTcq"], "origin": "Twitch", "reason": "seYCyiB4tDCWx3cE", "startDate": "1996-07-05T00:00:00Z", "status": "ACTIVE", "useCount": 46}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateUserEntitlement' test.out

#- 264 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '1of79zVTWIfgdNph' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qe9fS1m77MAg4KoZ' \
    --body '{"metadata": {"QPLhDSJx9jzxaRKp": {}, "h4kiIFgS4fLqlrKG": {}, "iS3XxjkyNfj3XgTR": {}}, "options": ["TjI9oNBzgQ4CRwg0", "sKVeSpMny0GrvKI5", "EVB9ZFzLNsjdCFtK"], "platform": "Y0KsxR0rCFkyiQZf", "requestId": "MnTbKdwNhiIP7dpJ", "useCount": 73}' \
    > test.out 2>&1
eval_tap $? 264 'ConsumeUserEntitlement' test.out

#- 265 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'B8VwFQnVco2oCn1K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vJmbjapW9UlEqtzD' \
    > test.out 2>&1
eval_tap $? 265 'DisableUserEntitlement' test.out

#- 266 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'd7SgxdxB5kvtM8ah' \
    --namespace "$AB_NAMESPACE" \
    --userId '9bPsksceGUEX8ERZ' \
    > test.out 2>&1
eval_tap $? 266 'EnableUserEntitlement' test.out

#- 267 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'cKSYLo6y7yJMowQ6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LpHCvCYTgX9JQwEr' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementHistories' test.out

#- 268 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'zjtuP9pUUv7qefNM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FsZAIqak1zi0JSa5' \
    --body '{"metadata": {"cRn31D8ubfdXi7By": {}, "cDPckeGJUgU8bD5m": {}, "GFFmKTTUxG0mpmFx": {}}}' \
    > test.out 2>&1
eval_tap $? 268 'RevokeUserEntitlement' test.out

#- 269 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'xDNXGlGJvHf558h1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ltyhiSGhfqXhxBJ7' \
    --body '{"reason": "zLXioAGkWgSDdDQv", "useCount": 31}' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlementByUseCount' test.out

#- 270 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'KN1gaQ4Bn0cPPtKa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jlw31pdDrXQ47WSG' \
    --quantity '51' \
    > test.out 2>&1
eval_tap $? 270 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 271 RevokeUseCount
eval_tap 0 271 'RevokeUseCount # SKIP deprecated' test.out

#- 272 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'dWCp4wqlQJcZroNQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iefBnPluOIjZyvlG' \
    --body '{"platform": "DQGv6pNNowEuVVZM", "requestId": "28w4mnYvvlt1es7A", "useCount": 87}' \
    > test.out 2>&1
eval_tap $? 272 'SellUserEntitlement' test.out

#- 273 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'PFduN4gx0UC6eWKC' \
    --body '{"duration": 65, "endDate": "1976-09-29T00:00:00Z", "entitlementCollectionId": "GzCNgesQlZZHIZH0", "entitlementOrigin": "IOS", "itemId": "Z1OH5Nn4nMT8QOyT", "itemSku": "uUSD9ImtaPAocOQc", "language": "pBWSNrCjSNEAdojk", "metadata": {"CMmYyTGO07foRZ6F": {}, "ujpIWo0qJtqp4Q6X": {}, "gICLgMHcP1eE6sjW": {}}, "order": {"currency": {"currencyCode": "QllYsONpp6QGW56C", "currencySymbol": "NiszHE69D1MMoaf6", "currencyType": "REAL", "decimals": 5, "namespace": "gRtwaM2IoyY1wpId"}, "ext": {"jcAtTj1IMuuhxxlu": {}, "lfmya73hX0a8Ri85": {}, "PA9wNpmrK5Y5heA2": {}}, "free": false}, "orderNo": "OhNaIT0pv7XeqO8g", "origin": "Playstation", "overrideBundleItemQty": {"3c4SryWB4yRaDxvx": 45, "8VvEzHGTt9emdCLm": 52, "kqYZWPZTgKagTzdc": 6}, "quantity": 5, "region": "KA84d9pMsl7zrNJv", "source": "SELL_BACK", "startDate": "1971-03-14T00:00:00Z", "storeId": "a2RdtVb6VgA5yFIH"}' \
    > test.out 2>&1
eval_tap $? 273 'FulfillItem' test.out

#- 274 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '3s9UyeaFi8OE7BCK' \
    --body '{"code": "4FeVGrl5NpUG9zbl", "language": "IiA_Dvia", "region": "9r4nJWUvLp1wxGF7"}' \
    > test.out 2>&1
eval_tap $? 274 'RedeemCode' test.out

#- 275 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '47468MXUq3uIffkI' \
    --body '{"itemId": "pPmrWVxNZUvkiU2j", "itemSku": "XSwsBBRopVl38d4N", "quantity": 82}' \
    > test.out 2>&1
eval_tap $? 275 'PreCheckFulfillItem' test.out

#- 276 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gtk6EmWxC75M88TK' \
    --body '{"entitlementCollectionId": "hFYkA9aRNDe2IoPM", "entitlementOrigin": "GooglePlay", "metadata": {"QKcg0OTT9JA0ll1R": {}, "imBCiQwuyrI87uSy": {}, "XP6C0jXS8au2wcWY": {}}, "origin": "Playstation", "rewards": [{"currency": {"currencyCode": "1uq1mH3oYfPK2QiA", "namespace": "UhIfi17YrkWHNxia"}, "item": {"itemId": "NyqBfgw58Hx0XYL0", "itemName": "fJOPYpnPqGlPnhBD", "itemSku": "OWqDU8N3DjVUt0n0", "itemType": "jfyDbtIXICLkK8Zv"}, "quantity": 3, "type": "CURRENCY"}, {"currency": {"currencyCode": "xVxbtpSKOfiIP3S6", "namespace": "pypZqISn3msrykQF"}, "item": {"itemId": "tW8QGKFZLrIfqrZu", "itemName": "u7IwKcT7sAsv2TKC", "itemSku": "bYMVkXEHmsHwIGGs", "itemType": "usS0zZRODEKPdudZ"}, "quantity": 37, "type": "ITEM"}, {"currency": {"currencyCode": "Laf8aZrXW84dt0TS", "namespace": "Tmy7XF26K2U7xttU"}, "item": {"itemId": "z8nWKJjv06PuffHg", "itemName": "hAQfAsYXVzBenLta", "itemSku": "AoYyRfiCWrm3s1Ah", "itemType": "3TII70MIcBMJ0450"}, "quantity": 19, "type": "CURRENCY"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "LoPZrkjRm5Ki0orh"}' \
    > test.out 2>&1
eval_tap $? 276 'FulfillRewards' test.out

#- 277 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'XrISEaPZHLQkTHvn' \
    --endTime 'dQsCKAO2JRz3CGwt' \
    --limit '42' \
    --offset '13' \
    --productId 'jkzxidLcAQWGVRg6' \
    --startTime 'DVso5TJCSugdo4XT' \
    --status 'FULFILLED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserIAPOrders' test.out

#- 278 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 't1YTWqItjNWXm9sr' \
    > test.out 2>&1
eval_tap $? 278 'QueryAllUserIAPOrders' test.out

#- 279 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'aeMA78YSRS2fPy5f' \
    --endTime 'pbbbMIu9lu18jIMB' \
    --limit '96' \
    --offset '8' \
    --startTime 'M77XmemN8LO03mnF' \
    --status 'SUCCESS' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 279 'QueryUserIAPConsumeHistory' test.out

#- 280 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'q9jJTVFoFjxZjh5q' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "EXqi-cnVn", "productId": "AYokSWFwajRGUykl", "region": "fLVY6g3PO4hKAeF4", "transactionId": "GUV5m96qcCJsVOWt", "type": "STADIA"}' \
    > test.out 2>&1
eval_tap $? 280 'MockFulfillIAPItem' test.out

#- 281 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKO8xC4D0FsUo3IB' \
    --activeOnly  \
    --groupId '2kX5REQZsHyXzoIX' \
    --limit '80' \
    --offset '11' \
    --platform 'APPLE' \
    --productId 'bL9HyJttdgfLGO3u' \
    > test.out 2>&1
eval_tap $? 281 'QueryUserThirdPartySubscription' test.out

#- 282 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId 'rq1xsGpdobYun8hc' \
    --groupId 'O55hVjfWyK02w5Qy' \
    > test.out 2>&1
eval_tap $? 282 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 283 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId 'crZzgameT2mLkkAM' \
    --productId 'jHyI0e2Axj0nZHjm' \
    > test.out 2>&1
eval_tap $? 283 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 284 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'oKHJngwMe1AnQVj6' \
    --activeOnly  \
    --groupId 'QQjZtkNJCnDSrsSe' \
    --limit '51' \
    --offset '43' \
    --platform 'TWITCH' \
    --productId 'gEctVEux2MSuwsEH' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 285 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'lwdeJyhsHS6YqPud' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WviQsULL1txfX9tq' \
    > test.out 2>&1
eval_tap $? 285 'GetThirdPartySubscriptionDetails' test.out

#- 286 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'FSkGXoIcFN5JL9M5' \
    --namespace "$AB_NAMESPACE" \
    --userId '3Mg0MzWS9usxxnMh' \
    --limit '19' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 286 'GetSubscriptionHistory' test.out

#- 287 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'v66DyED4prRVibTA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Txd7Mzjv1gSj8kcN' \
    > test.out 2>&1
eval_tap $? 287 'SyncSubscriptionTransaction' test.out

#- 288 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'hoqcRZRNATojM7da' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0VwR3yNKDtMqMrA' \
    > test.out 2>&1
eval_tap $? 288 'GetThirdPartyUserSubscriptionDetails' test.out

#- 289 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'GpdyF6WDHn3ePBxQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nz2IUEHMzl5jhwVD' \
    > test.out 2>&1
eval_tap $? 289 'SyncSubscription' test.out

#- 290 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'suzwJ4v50eoaIBrT' \
    --discounted  \
    --itemId 'h0EKkJioUpvGnkcH' \
    --limit '13' \
    --offset '21' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserOrders' test.out

#- 291 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'sgsKJ2R6Jacwwu8W' \
    --body '{"currencyCode": "1zvrKMRPvwA9k6yJ", "currencyNamespace": "z03NETdywPqYerrp", "discountCodes": ["6LwGlZGF7XQPLAcI", "Om4M2pM4fIfcHBWZ", "M50aHbPXRns3qwYL"], "discountedPrice": 76, "entitlementPlatform": "Xbox", "ext": {"cxRQR0NYdJzf3TMh": {}, "SaynVs05nZC4Os7h": {}, "qIH2NgARSG3QQNGN": {}}, "itemId": "H2K0UuJdeGNquQna", "language": "XpDQ5rU2taDWh9JV", "options": {"skipPriceValidation": false}, "platform": "GooglePlay", "price": 5, "quantity": 94, "region": "5IFQsrwHqFqwVA5m", "returnUrl": "ozeeOjIFQfXV3YW3", "sandbox": true, "sectionId": "zx3IRWme3C6p2r4D"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminCreateUserOrder' test.out

#- 292 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId '3NQdjrjkX3AMgK3J' \
    --itemId 'gZufzssA284mG7uA' \
    > test.out 2>&1
eval_tap $? 292 'CountOfPurchasedItem' test.out

#- 293 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ojLYBsx8oqMzbE0l' \
    --userId 'jQaBtb47V691j0FZ' \
    > test.out 2>&1
eval_tap $? 293 'GetUserOrder' test.out

#- 294 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'p2vjOXptxzx6kkaZ' \
    --userId 'Ypl52sQR9Znp5d1e' \
    --body '{"status": "FULFILLED", "statusReason": "WjKasq5zQ6uZNwKj"}' \
    > test.out 2>&1
eval_tap $? 294 'UpdateUserOrderStatus' test.out

#- 295 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nX7vDIqpcjmaq5KB' \
    --userId 'CsHlwNrfKJrkzwR4' \
    > test.out 2>&1
eval_tap $? 295 'FulfillUserOrder' test.out

#- 296 GetUserOrderGrant
eval_tap 0 296 'GetUserOrderGrant # SKIP deprecated' test.out

#- 297 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo '0tfd9GFXChtxB10d' \
    --userId '4Q8nlBthUSu4WNfT' \
    > test.out 2>&1
eval_tap $? 297 'GetUserOrderHistories' test.out

#- 298 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vD5UcES1eLMZs9lS' \
    --userId 'QVDp16qVIqXCK9dS' \
    --body '{"additionalData": {"cardSummary": "5JTbdJEe6mnkYAfw"}, "authorisedTime": "1977-05-24T00:00:00Z", "chargebackReversedTime": "1976-04-11T00:00:00Z", "chargebackTime": "1983-10-27T00:00:00Z", "chargedTime": "1990-03-22T00:00:00Z", "createdTime": "1980-08-19T00:00:00Z", "currency": {"currencyCode": "UXUF2523OTvOmfVN", "currencySymbol": "JNDaSO3FEkk4It6V", "currencyType": "REAL", "decimals": 56, "namespace": "zfMedpcKhvHPlvYa"}, "customParameters": {"nGqEkn9OEVwLWGT4": {}, "MXhmzvRQb7c0vmjW": {}, "q9fQqzulLGfQMqSL": {}}, "extOrderNo": "QDlRFYMVfiAMa6Pc", "extTxId": "o7MfvikslpyL9BYL", "extUserId": "VVznF6hMYfksp8VQ", "issuedAt": "1974-06-13T00:00:00Z", "metadata": {"YSFeBOp0ilGQFwHU": "tZugblT3aIDKn9qJ", "Xncm5igpAewbmnWk": "0E7YaPblcWEyNgvs", "5LEZrQXzSQRWRs9E": "GnRPgYlJElgJ8kx1"}, "namespace": "WEeDbql13FtQMu41", "nonceStr": "rnOzbsFBqg6dziWv", "paymentData": {"discountAmount": 6, "discountCode": "DnYRxY8ZhHeb0CaP", "subtotalPrice": 64, "tax": 79, "totalPrice": 60}, "paymentMethod": "XRpDP9xutntU8xHw", "paymentMethodFee": 50, "paymentOrderNo": "rgr5RffM5JXvPdzE", "paymentProvider": "PAYPAL", "paymentProviderFee": 58, "paymentStationUrl": "Dln04F8BQjzobhDa", "price": 97, "refundedTime": "1976-07-12T00:00:00Z", "salesTax": 40, "sandbox": true, "sku": "6aSRmHU5iR3hXIbz", "status": "REQUEST_FOR_INFORMATION", "statusReason": "DMQ6tBLljC7gcT3M", "subscriptionId": "1DArk4L80aXFY7SQ", "subtotalPrice": 21, "targetNamespace": "4CNtX2lnqi7cHTSd", "targetUserId": "GoLZbC3UJruU4uIX", "tax": 56, "totalPrice": 32, "totalTax": 38, "txEndTime": "1979-09-08T00:00:00Z", "type": "XJmPJso6M11LLZWK", "userId": "gWxn9YL16HQdtAne", "vat": 47}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserOrderNotification' test.out

#- 299 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GgxNg33ZIUrIkfmd' \
    --userId 'XVvaPQzzKdFg7N7p' \
    > test.out 2>&1
eval_tap $? 299 'DownloadUserOrderReceipt' test.out

#- 300 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'iT8VcrXLZnuMNpKE' \
    --body '{"currencyCode": "Is3GC9VTK7tkJWFp", "currencyNamespace": "Ht7MdKu9Xwn5GHJD", "customParameters": {"GatrYOMO91CYEjX8": {}, "67n9PT9fR7mMuBXP": {}, "DKCriRKzTZ7TXAVR": {}}, "description": "nUVbxEJcKHE764Ew", "extOrderNo": "hQfxFKIOGT1WKSmL", "extUserId": "oA0ILaESC1GJXsoB", "itemType": "INGAMEITEM", "language": "PHg", "metadata": {"n10vDgyoHXIlrMl2": "RAukCL26ihdMy9YC", "LNJEkvq6SUSt8xd8": "EgE15XNuw6Y7sToQ", "NkuZzJ1XBxw01iBB": "QukgQ94ZvPCWcMX0"}, "notifyUrl": "ov3U2sKjIeyFS97d", "omitNotification": true, "platform": "Jt81fmLSyGuu5rbJ", "price": 97, "recurringPaymentOrderNo": "cJfAV5iOfzwt3bpx", "region": "RNt6lKoMjCPtEKeB", "returnUrl": "WTm78Fn8TvZVTe4L", "sandbox": false, "sku": "5etl4Xk8Hd1lRtoP", "subscriptionId": "Mvsu9oswEPTvzwwG", "title": "npbx8MCIjKzylqW8"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserPaymentOrder' test.out

#- 301 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'auyseP9wEEyYAnHP' \
    --userId 'p4XzVL5McglFCrjx' \
    --body '{"description": "qqxAYqXG2V3baMkZ"}' \
    > test.out 2>&1
eval_tap $? 301 'RefundUserPaymentOrder' test.out

#- 302 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId '9JCqBIkUID0EE9In' \
    > test.out 2>&1
eval_tap $? 302 'GetUserPlatformAccountClosureHistories' test.out

#- 303 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZNLwwAhW2b5OHKtU' \
    --body '{"code": "v4lTkQNjxhXdj1CG", "orderNo": "0EBgst9Qu8Ofl2oB"}' \
    > test.out 2>&1
eval_tap $? 303 'ApplyUserRedemption' test.out

#- 304 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '8VTjF0pD3NHU8iYU' \
    --body '{"meta": {"OtG5gbQSKW2MdgCH": {}, "4bWxRF6fBPa6GOuV": {}, "5z0p8jaJs2duQqaw": {}}, "reason": "Prxi6F4elhy9CZ94", "requestId": "CAUVW8FoEf8tjCjW", "revokeEntries": [{"currency": {"balanceOrigin": "Epic", "currencyCode": "RbW021cHN3QbzVuJ", "namespace": "ZH3k54cExxWKtdGT"}, "entitlement": {"entitlementId": "W4FILotv5ycTa0i6"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "CKt79wAopZL9Cw6K", "itemIdentityType": "ITEM_SKU", "origin": "GooglePlay"}, "quantity": 55, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "9OGoWw1qnCAvdnAc", "namespace": "okJ0rzqX2KJcYHgi"}, "entitlement": {"entitlementId": "FDxclBXap6j73doC"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "xhubMXbxNvT6wAff", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 98, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "zKAwiI4wTxNIefCm", "namespace": "trxWu293551nQBNK"}, "entitlement": {"entitlementId": "cqCkUXRj8gQHEe4C"}, "item": {"entitlementOrigin": "Xbox", "itemIdentity": "xoPYvdIBJYyGURjE", "itemIdentityType": "ITEM_ID", "origin": "Twitch"}, "quantity": 28, "type": "ENTITLEMENT"}], "source": "ORDER", "transactionId": "llUrFYn7cSuO7NxK"}' \
    > test.out 2>&1
eval_tap $? 304 'DoRevocation' test.out

#- 305 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'HUHg0c4X7fHdITmN' \
    --body '{"gameSessionId": "9opaF0kh3pCRB3in", "payload": {"fEVxArF7TB6A6a71": {}, "zAJpaPeudUtKPJUm": {}, "AvxBxJNPlvvYZw4M": {}}, "scid": "WzWFTuNPf5JCSDyY", "sessionTemplateName": "y4e5qoTZxSoZbQUn"}' \
    > test.out 2>&1
eval_tap $? 305 'RegisterXblSessions' test.out

#- 306 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'UxS6m68WL3HDL4yx' \
    --chargeStatus 'SETUP' \
    --itemId 'I0euBsccHPA2v9XP' \
    --limit '30' \
    --offset '8' \
    --sku 'WdgXdm1IxL1OtleU' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 306 'QueryUserSubscriptions' test.out

#- 307 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJlHCjxLNnYUlGQs' \
    --excludeSystem  \
    --limit '64' \
    --offset '52' \
    --subscriptionId 'py9ZVlLIFwLgT78n' \
    > test.out 2>&1
eval_tap $? 307 'GetUserSubscriptionActivities' test.out

#- 308 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ootfUs9559ilm3ca' \
    --body '{"grantDays": 43, "itemId": "3qDO5HXp5oVkhESb", "language": "HQ7hvTlzf7XwQtVI", "reason": "YU87NgjDMcJxfMfY", "region": "Flt3JvDgMiyBGygW", "source": "FTAY3Th5mOwPCPKV"}' \
    > test.out 2>&1
eval_tap $? 308 'PlatformSubscribeSubscription' test.out

#- 309 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PlOGfFBlu2ZP0Iki' \
    --itemId 'YXGk6BoBmSLi0R7z' \
    > test.out 2>&1
eval_tap $? 309 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 310 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'DFMoNTQmlS8lMlY8' \
    --userId 'UjprhCxhzW6ZM7Lk' \
    > test.out 2>&1
eval_tap $? 310 'GetUserSubscription' test.out

#- 311 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'TVrtVJZVhxCVdjPu' \
    --userId 'tJ8dkAVOJ5imghdf' \
    > test.out 2>&1
eval_tap $? 311 'DeleteUserSubscription' test.out

#- 312 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Vhjnjd66A1SQmWGS' \
    --userId 'QLAVPAJ7zX5lB80k' \
    --force  \
    --body '{"immediate": true, "reason": "c8xhQqptccNorRls"}' \
    > test.out 2>&1
eval_tap $? 312 'CancelSubscription' test.out

#- 313 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7EC3nDnhFvDlFd7i' \
    --userId 'yZpvWVJFK6ZuvlzG' \
    --body '{"grantDays": 58, "reason": "7VUbjUnzirnEsxSE"}' \
    > test.out 2>&1
eval_tap $? 313 'GrantDaysToSubscription' test.out

#- 314 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4vBzG7VK8sWEshmZ' \
    --userId 'f5fEdvjbyJPQ1qdR' \
    --excludeFree  \
    --limit '5' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 314 'GetUserSubscriptionBillingHistories' test.out

#- 315 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Jjsme1OukIfIZVH8' \
    --userId 'q8svV5hMOSfpyJkJ' \
    --body '{"additionalData": {"cardSummary": "lmJmTkFvB7wkY6nu"}, "authorisedTime": "1994-07-09T00:00:00Z", "chargebackReversedTime": "1986-10-24T00:00:00Z", "chargebackTime": "1987-04-11T00:00:00Z", "chargedTime": "1989-08-15T00:00:00Z", "createdTime": "1999-03-24T00:00:00Z", "currency": {"currencyCode": "Li6GpnqAeMvg3w0F", "currencySymbol": "Q1520WM3TxWXSdTi", "currencyType": "REAL", "decimals": 39, "namespace": "va2UREoBSFtCLy2C"}, "customParameters": {"qgCG7JwJCDqkzOdF": {}, "wLJpIPxzLE1V9U1N": {}, "gpH7Oc44yjRdfqZg": {}}, "extOrderNo": "v34GqqjelcN0GJmP", "extTxId": "wUTWMx0MiPAjnWIh", "extUserId": "FrqSn4erXEtU1CaD", "issuedAt": "1999-08-02T00:00:00Z", "metadata": {"SLYDrZJvDLGvn6qt": "roZcp16HKXX1ft5n", "BA9xNIJVuMz04evS": "dE2FMcKd7c94rEmI", "YuAT5OAcUwYHGmG5": "rNDBF1oU37vjfyX5"}, "namespace": "YLaM0wmi0i1WABBb", "nonceStr": "q8IzZsMFLX9ZhFXc", "paymentData": {"discountAmount": 64, "discountCode": "bF7fMX9lDXYxGRJM", "subtotalPrice": 45, "tax": 9, "totalPrice": 37}, "paymentMethod": "X42WW2WKf5urEOpA", "paymentMethodFee": 91, "paymentOrderNo": "nV3zR7YxSu6addoc", "paymentProvider": "ALIPAY", "paymentProviderFee": 14, "paymentStationUrl": "10Hy9jx7gBHTOHHA", "price": 35, "refundedTime": "1973-03-20T00:00:00Z", "salesTax": 4, "sandbox": false, "sku": "5kNwJAxm0Rdm9l6n", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "BSrucjO3zvSM5KeV", "subscriptionId": "NHU9GcOivIfcCJt4", "subtotalPrice": 96, "targetNamespace": "81ZR2kNzh60RQNaT", "targetUserId": "EhMXMepgzY9jLiAd", "tax": 79, "totalPrice": 32, "totalTax": 17, "txEndTime": "1992-01-30T00:00:00Z", "type": "7eDMkeBRMur18nCx", "userId": "iV9bQMHpPbvflI3L", "vat": 22}' \
    > test.out 2>&1
eval_tap $? 315 'ProcessUserSubscriptionNotification' test.out

#- 316 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '0hTINvq1VR9SJUfQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EX996Mh1sQ3Dw3uy' \
    --body '{"count": 19, "orderNo": "3P2f8TTOVf6jrr1O"}' \
    > test.out 2>&1
eval_tap $? 316 'AcquireUserTicket' test.out

#- 317 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'L606QpqCgxt0NgDS' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserCurrencyWallets' test.out

#- 318 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'j1T6EdeYFmrLT0Hb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vS4kSSt3CyDgf6eF' \
    --body '{"allowOverdraft": true, "amount": 55, "balanceOrigin": "IOS", "balanceSource": "IAP_REVOCATION", "metadata": {"HGNI3BfjkFd6MHo6": {}, "gGQ5mChYoKD7yqCR": {}, "03RovQZhwfjkq9iy": {}}, "reason": "TbyD3D01tRpuuyIa"}' \
    > test.out 2>&1
eval_tap $? 318 'DebitUserWalletByCurrencyCode' test.out

#- 319 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'gSSzEL8H4euLufhQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j2KP3LLxl9Hs2L2w' \
    --limit '24' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 319 'ListUserCurrencyTransactions' test.out

#- 320 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'pKBVURxHefz77a9f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ntCNiHBRUNCPSre5' \
    --request '{"amount": 67, "debitBalanceSource": "PAYMENT", "metadata": {"mZzCQwilS3IxSjly": {}, "vR9PxG9Lji2Vc88W": {}, "8aLjIxVGpdOqguxv": {}}, "reason": "RwI9ZBTipMRlhK9D", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 320 'CheckBalance' test.out

#- 321 CheckWallet
eval_tap 0 321 'CheckWallet # SKIP deprecated' test.out

#- 322 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'aI4ryVDvNaruZxwT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fh9gEs6GF247cbBL' \
    --body '{"amount": 19, "expireAt": "1994-04-01T00:00:00Z", "metadata": {"r5z03wxB3E9hrE9f": {}, "9COFrOr6wJDBwIDs": {}, "JHNg6TvNGjwI4TbT": {}}, "origin": "Other", "reason": "bQD3pO8U3W94Z8IW", "source": "TRADE"}' \
    > test.out 2>&1
eval_tap $? 322 'CreditUserWallet' test.out

#- 323 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'XiKDIE9YugcupLxV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BcRkfhRuqkOTHSia' \
    --request '{"amount": 30, "debitBalanceSource": "PAYMENT", "metadata": {"Fd1fEmDuyAsQGzwJ": {}, "R5poI718RQnj4imu": {}, "6XFfRcWDXhq1YmGe": {}}, "reason": "ygr2S4Yw8NmPaBer", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 323 'DebitByWalletPlatform' test.out

#- 324 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'HcPHEFuEVP9bF07g' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWDULkJPQR0UJMr8' \
    --body '{"amount": 30, "metadata": {"yq8FBbur80QwnlgA": {}, "Vfqz6gQJh8sn0bVW": {}, "RkvmAemh8lioBR7x": {}}, "walletPlatform": "IOS"}' \
    > test.out 2>&1
eval_tap $? 324 'PayWithUserWallet' test.out

#- 325 GetUserWallet
eval_tap 0 325 'GetUserWallet # SKIP deprecated' test.out

#- 326 DebitUserWallet
eval_tap 0 326 'DebitUserWallet # SKIP deprecated' test.out

#- 327 DisableUserWallet
eval_tap 0 327 'DisableUserWallet # SKIP deprecated' test.out

#- 328 EnableUserWallet
eval_tap 0 328 'EnableUserWallet # SKIP deprecated' test.out

#- 329 ListUserWalletTransactions
eval_tap 0 329 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 330 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XcEIFod3lCzvjHzD' \
    > test.out 2>&1
eval_tap $? 330 'ListViews' test.out

#- 331 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HOrSJ1vbB7LRHd96' \
    --body '{"displayOrder": 6, "localizations": {"aY103YUIMuSjDHz0": {"description": "zPWMZQNNP2JqQqhI", "localExt": {"STBT1Gofv4SuaZ8y": {}, "CB9TVZnuzgvAZJRm": {}, "71EC3ENuvD8OPsp5": {}}, "longDescription": "Z3ez84KVB7HeWPnV", "title": "eFdy5ezlCU6SGzkM"}, "pTL2wxobjxAbagqE": {"description": "mXn6U2VeV2emK3Je", "localExt": {"cJA4skqCbPxRkIAF": {}, "Qh9yDdoLE2s7mrVr": {}, "mTJwtBTzQTrNo1Lc": {}}, "longDescription": "WNf7xHpi1JZJjIRt", "title": "CfqDHSlo54zSnRN0"}, "zGMworzym1z3Zdet": {"description": "Oic9AQOFWpdItLBh", "localExt": {"vKJq9tWz9yui8a6j": {}, "OflFJlZEhz1QDeh0": {}, "5hj92bwVVxJ62Q5A": {}}, "longDescription": "OAOyL65cPaOZA8BG", "title": "8KcVWOX9n3YsjJex"}}, "name": "nFA9Umz3KPICya5F"}' \
    > test.out 2>&1
eval_tap $? 331 'CreateView' test.out

#- 332 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'k5TPaEbX29cV8v7M' \
    --storeId 'XctihtxMnIr4b7jy' \
    > test.out 2>&1
eval_tap $? 332 'GetView' test.out

#- 333 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'fL3zMkklGCPISlsn' \
    --storeId 'VA6z0uSfNNpJUYzJ' \
    --body '{"displayOrder": 47, "localizations": {"LVOXBMa0JiIe1AY0": {"description": "tUA7EKASk3USNLhO", "localExt": {"BlxRBLgohp8ByTi2": {}, "F6AyUX8w77riPlPg": {}, "JcLbeQf9MICxX7xK": {}}, "longDescription": "yCfgwSPz14asyOdg", "title": "n77gN8K1FlNkgbFE"}, "8U4meK5grmPBsFH7": {"description": "1VrhsISYtegQbNA2", "localExt": {"WQrHTkJT1VkChD3n": {}, "0c1ryAkRvdPR8gx2": {}, "rX5dck8NFKPgT6LM": {}}, "longDescription": "ehg047axU5ktNywR", "title": "IvO2Sgz30hejqdkt"}, "HIO1VdtMSews1TrU": {"description": "4FhAfKDcDG5bMTba", "localExt": {"1tUlFGcP6eL7EpWt": {}, "PifmO0JK4dP1aZFi": {}, "SkmhwVVMGkXNwMYw": {}}, "longDescription": "Fyljy5bYQdQ87hUH", "title": "A0FJZwP8GslMpx3m"}}, "name": "7lEXTmnTbtjK9Rsy"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateView' test.out

#- 334 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'oqT3adB48Jxp2zaI' \
    --storeId 'tg9jTNZvpFEUI21a' \
    > test.out 2>&1
eval_tap $? 334 'DeleteView' test.out

#- 335 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 335 'GetWalletConfig' test.out

#- 336 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": false}' \
    > test.out 2>&1
eval_tap $? 336 'UpdateWalletConfig' test.out

#- 337 QueryWallets
eval_tap 0 337 'QueryWallets # SKIP deprecated' test.out

#- 338 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 47, "expireAt": "1989-05-29T00:00:00Z", "metadata": {"DHnyabk493I3pvHK": {}, "DaWhTN1qyxpUzWIZ": {}, "WJTDzWguhujw1EoR": {}}, "origin": "Steam", "reason": "uCVldefonHJZAiX4", "source": "ACHIEVEMENT"}, "currencyCode": "IySe36SA5dxATLv5", "userIds": ["PkLvraRzChdjDGdl", "f4ewKFFLoGggX4gQ", "k2A2jHbAPNGInvbn"]}, {"creditRequest": {"amount": 100, "expireAt": "1998-07-18T00:00:00Z", "metadata": {"MO0eT9okl6MlWOl9": {}, "feWO2bmOikTBJHTE": {}, "m5PSeyod5L6OooYo": {}}, "origin": "Xbox", "reason": "0Vjmy7j2BrdCAm3s", "source": "GIFT"}, "currencyCode": "90FQdwLi3GOQkLtp", "userIds": ["xNRzF3NaUuCyQyze", "nukycAUlkUSZKUrs", "uRNeT1CULEMPaOU5"]}, {"creditRequest": {"amount": 94, "expireAt": "1984-07-11T00:00:00Z", "metadata": {"PKu5sE89JW8UU0Rs": {}, "B6dvrpmInhHYzVVl": {}, "HGFSwjby6rMYkVQn": {}}, "origin": "Steam", "reason": "3SLiIbAP2qyUnHnf", "source": "IAP"}, "currencyCode": "AndOj5O6IBwXJjgQ", "userIds": ["jgLoJyqwFVBd1Zja", "RXEdWgS12bSbPgOC", "WUogizeWOPUMrqgE"]}]' \
    > test.out 2>&1
eval_tap $? 338 'BulkCredit' test.out

#- 339 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "IsMwNbfti0LoTBcN", "request": {"allowOverdraft": true, "amount": 50, "balanceOrigin": "Epic", "balanceSource": "EXPIRATION", "metadata": {"AyGiXa9nUsHCVicu": {}, "J7onrUXVlB6xNel4": {}, "Bxb9KwFYqdhEVq3h": {}}, "reason": "bsApeASfR0ljKxqZ"}, "userIds": ["MXNzl1ywEPiunixl", "cLuhwNDvValv3bko", "EAHZzHs8x5oPSkZF"]}, {"currencyCode": "IV2feXnTRlzAJy9o", "request": {"allowOverdraft": true, "amount": 83, "balanceOrigin": "Epic", "balanceSource": "OTHER", "metadata": {"qsiVTqPbzY1yxl7z": {}, "eEpmSPO6KwlJQlj9": {}, "Ii2jARwzowk9OoiP": {}}, "reason": "dnq9KBqBwiNCsnK8"}, "userIds": ["vOGSd7uMrmQ2SaLd", "CcO1OHbpQZtwW3Ew", "Lre1bL4dJnkRLJbM"]}, {"currencyCode": "6M7TM3wnJyExuo5z", "request": {"allowOverdraft": false, "amount": 91, "balanceOrigin": "Playstation", "balanceSource": "PAYMENT", "metadata": {"cYgYZb7cAakJpqN6": {}, "eubdp49JFwXG0Evo": {}, "SHNC97eEyhnL1QH5": {}}, "reason": "AlYRAqCAC2gy1WF9"}, "userIds": ["cOx5ugNCDd6jW6fj", "QLNgDxAkwgfB8jIe", "tBcO3fWq9qfmBv0X"]}]' \
    > test.out 2>&1
eval_tap $? 339 'BulkDebit' test.out

#- 340 GetWallet
eval_tap 0 340 'GetWallet # SKIP deprecated' test.out

#- 341 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'gJB6a7uykADFpinF' \
    --end 'cH2ZMSYijqEuMfuY' \
    --start 'FUS079tOpZYM1XV0' \
    > test.out 2>&1
eval_tap $? 341 'SyncOrders' test.out

#- 342 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["Op0damycnTUOoMkO", "ppZNOkqxc42HKv5w", "vtPJVsuzaBciSxwz"], "apiKey": "uIpGBYHTHoSVxgQC", "authoriseAsCapture": false, "blockedPaymentMethods": ["IuBTYOdsvNyk52MQ", "FkVVEf36S7yPgG48", "bk6PwH1tdEAJSqXA"], "clientKey": "0Wv0zWGvkc6byp3m", "dropInSettings": "vyYT3GuaZVTxBlw1", "liveEndpointUrlPrefix": "IWeXKFT4rfSbbSlD", "merchantAccount": "PGf9Fn32SJNPZkEf", "notificationHmacKey": "kAcJTMS4pVRcCHIG", "notificationPassword": "fmCMTr9ACnI2sMrE", "notificationUsername": "gl7ZR1HCkf2Sw78l", "returnUrl": "LGKjDHuXt358gzqR", "settings": "MuMPrIekxq58fikq"}' \
    > test.out 2>&1
eval_tap $? 342 'TestAdyenConfig' test.out

#- 343 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "83hqJ7HP63Se6kVW", "privateKey": "5fkl60ImLBv6nUU0", "publicKey": "r1rfX9stpvJUuyPd", "returnUrl": "zx8BM2wEgTtLRT5s"}' \
    > test.out 2>&1
eval_tap $? 343 'TestAliPayConfig' test.out

#- 344 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "twQFUEbTPQ8p7VMl", "secretKey": "xEXnqHwMyKpwphjU"}' \
    > test.out 2>&1
eval_tap $? 344 'TestCheckoutConfig' test.out

#- 345 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'XvM1GqMkZ44UXgdB' \
    > test.out 2>&1
eval_tap $? 345 'DebugMatchedPaymentMerchantConfig' test.out

#- 346 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "qtJaRyDlP9qIZJ5K", "webhookSecretKey": "rx6KkHagEugKJxkU"}' \
    > test.out 2>&1
eval_tap $? 346 'TestNeonPayConfig' test.out

#- 347 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "8Y58COtTNjnNSikJ", "clientSecret": "Dg6ujKvq0CIa1YCK", "returnUrl": "9PlMeQprfgLGkHX1", "webHookId": "tdBjKmCBXETZwqdz"}' \
    > test.out 2>&1
eval_tap $? 347 'TestPayPalConfig' test.out

#- 348 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["AX28DikGk8cWiX44", "azSHcwicUVq2XPlj", "TZj5R0yZSVQ8SSeJ"], "publishableKey": "4qy4PIKleuV271bw", "secretKey": "Z4niLSzQnv0C00dt", "webhookSecret": "NGGzbGYSYo9fY2EB"}' \
    > test.out 2>&1
eval_tap $? 348 'TestStripeConfig' test.out

#- 349 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "ZAHQXc4Xcae7VKl0", "key": "ARzGEArlfE1NSmtc", "mchid": "ADoZvd0La7P4JI4H", "returnUrl": "7uDzkOHTdnUtdrRc"}' \
    > test.out 2>&1
eval_tap $? 349 'TestWxPayConfig' test.out

#- 350 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "s3GeOsKPNlG7rEXi", "flowCompletionUrl": "6LEqJERpbxEq07tx", "merchantId": 28, "projectId": 44, "projectSecretKey": "N28gH4Cd9xTdt2K1"}' \
    > test.out 2>&1
eval_tap $? 350 'TestXsollaConfig' test.out

#- 351 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'CzpQWslNGnLYUYR0' \
    > test.out 2>&1
eval_tap $? 351 'GetPaymentMerchantConfig1' test.out

#- 352 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'yOvJhUjzcMtwINUl' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["rhIpnlam2EefVopb", "pPhsana0uXG7GUTV", "1BwgkLDj4pjVktyo"], "apiKey": "NSsEHlzyd0Sarkhl", "authoriseAsCapture": true, "blockedPaymentMethods": ["EQ8rBKc2K6oJXxVE", "fnaqX8NuZtRUTKUv", "R69PImy6CcwlqJ4M"], "clientKey": "O3L8x1H5OgzHypgs", "dropInSettings": "SeKCvtPz7jagBG9a", "liveEndpointUrlPrefix": "1TZ87ltClc3RDXF5", "merchantAccount": "055tUlenimjIbm0r", "notificationHmacKey": "iCaNp8dUBDinAB6H", "notificationPassword": "qIWIi5Bvb1rcuEtW", "notificationUsername": "AF763kci7lT62BOH", "returnUrl": "aso53W3U2Mu9ZGMW", "settings": "ou1U0RVCf3gMWDAo"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateAdyenConfig' test.out

#- 353 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'dCKqfqzeexHA70Ng' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 353 'TestAdyenConfigById' test.out

#- 354 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'JTxjtzgO7W3taRvJ' \
    --sandbox  \
    --validate  \
    --body '{"appId": "6lKWJwHO65aOFDwp", "privateKey": "qy7XOU3DwglyMGNl", "publicKey": "l4O8ELahcNJqRjep", "returnUrl": "ck1l0qxRyQ2pi7xu"}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateAliPayConfig' test.out

#- 355 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'AufJakIPXOQznHZT' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 355 'TestAliPayConfigById' test.out

#- 356 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'j8oYfWObyNJKVSQs' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "aCokoGynp6xcqNKJ", "secretKey": "nAhrSt96OaARAjHL"}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateCheckoutConfig' test.out

#- 357 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'GV3sNxS8uLBZiVRY' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 357 'TestCheckoutConfigById' test.out

#- 358 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'IyQLcslTEqgVNG8A' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "qktgvjwNJAwIpEy2", "webhookSecretKey": "ZNpojZ24I2n25sms"}' \
    > test.out 2>&1
eval_tap $? 358 'UpdateNeonPayConfig' test.out

#- 359 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'rmJFHGiYnyhbqxLu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 359 'TestNeonPayConfigById' test.out

#- 360 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'TZIxgiUaiyy0aWrs' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "hpmb1C9Al7eWrbNR", "clientSecret": "E0xyYPUZHyLGQ52I", "returnUrl": "jGpRJCUJpscOTkWE", "webHookId": "TSJ04c5MGInO4yzn"}' \
    > test.out 2>&1
eval_tap $? 360 'UpdatePayPalConfig' test.out

#- 361 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'h2YpZvvmziSSiSpX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 361 'TestPayPalConfigById' test.out

#- 362 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'eWOGayfRkQvoN06S' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["pNOnuSksfm7hcIFd", "kdrwAcK2lUda9h9F", "gvfhiLEAkA7n6516"], "publishableKey": "ydoRT1qZBrdTnGrw", "secretKey": "HeWoQXPFWFaKbDgr", "webhookSecret": "Gkv8SVwLyS4VbHJv"}' \
    > test.out 2>&1
eval_tap $? 362 'UpdateStripeConfig' test.out

#- 363 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'D0lL7aZUY9d1Idud' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 363 'TestStripeConfigById' test.out

#- 364 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '8bjYeBVMr7zHYmRE' \
    --validate  \
    --body '{"appId": "4X36KUOdfEmoIYwS", "key": "xxAsfwDMivWqHHGl", "mchid": "nAnEu6EKYceTEqYu", "returnUrl": "dHlA4AxeEIfUxJ2x"}' \
    > test.out 2>&1
eval_tap $? 364 'UpdateWxPayConfig' test.out

#- 365 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'MSNNBxCeN3pGn46f' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 365 'UpdateWxPayConfigCert' test.out

#- 366 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'Gvodt413MRdG8qAP' \
    > test.out 2>&1
eval_tap $? 366 'TestWxPayConfigById' test.out

#- 367 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'iANv2Ar8yXV6qf6v' \
    --validate  \
    --body '{"apiKey": "5SgcJPZPUh2nHQwp", "flowCompletionUrl": "Wi8HZ6C0VJ0fK2m6", "merchantId": 24, "projectId": 95, "projectSecretKey": "Q5Ao8TITYiHSR2SE"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateXsollaConfig' test.out

#- 368 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'Jh1YDedZdNqkXPWZ' \
    > test.out 2>&1
eval_tap $? 368 'TestXsollaConfigById' test.out

#- 369 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'fT8ZfdKp9q4nXuK0' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "SMALL", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdateXsollaUIConfig' test.out

#- 370 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '55' \
    --namespace "$AB_NAMESPACE" \
    --offset '16' \
    --region 'Yror2XdtSCG7ZExO' \
    > test.out 2>&1
eval_tap $? 370 'QueryPaymentProviderConfig' test.out

#- 371 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "CHECKOUT", "namespace": "83J57t6OcYPQ5bk5", "region": "IeuAi3zWFGorCbnc", "sandboxTaxJarApiToken": "oj5RvEtXiKyUGdNf", "specials": ["CHECKOUT", "PAYPAL", "STRIPE"], "taxJarApiToken": "BEijjjpvSzGkED0o", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 371 'CreatePaymentProviderConfig' test.out

#- 372 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 372 'GetAggregatePaymentProviders' test.out

#- 373 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'vFhRMCFJuA0DEMgy' \
    > test.out 2>&1
eval_tap $? 373 'DebugMatchedPaymentProviderConfig' test.out

#- 374 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 374 'GetSpecialPaymentProviders' test.out

#- 375 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'kqqjoHTpIPMSRAuP' \
    --body '{"aggregate": "XSOLLA", "namespace": "msspn5sNfifK65tv", "region": "aH9jwcO48pthyYpB", "sandboxTaxJarApiToken": "JDHIIxTIGI5EssYl", "specials": ["NEONPAY", "PAYPAL", "XSOLLA"], "taxJarApiToken": "9R0D5jZEwxcow6L7", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 375 'UpdatePaymentProviderConfig' test.out

#- 376 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'lHm8VTN56tJKwD8O' \
    > test.out 2>&1
eval_tap $? 376 'DeletePaymentProviderConfig' test.out

#- 377 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 377 'GetPaymentTaxConfig' test.out

#- 378 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "07L9GG1uenDihcea", "taxJarApiToken": "LdgPZI0fKW8LeQxI", "taxJarEnabled": true, "taxJarProductCodesMapping": {"fzIpL2pWB4XsdrxI": "F6kEAmKGNEmFPcUA", "LNziO9Bz2wx4kDAm": "8XIleiujtv2NdQTY", "oHZogW8lBvniHdAR": "adfSoctA3GYO94ZO"}}' \
    > test.out 2>&1
eval_tap $? 378 'UpdatePaymentTaxConfig' test.out

#- 379 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'o94gS5DHLB65fxQ0' \
    --end '6GwTmobiBnfrnq9k' \
    --start 'OFBWhUTPiKR3qcbH' \
    > test.out 2>&1
eval_tap $? 379 'SyncPaymentOrders' test.out

#- 380 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'LGplYsS3jsRZffCd' \
    --storeId '00VrgPuNtOv3jbhG' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetRootCategories' test.out

#- 381 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'BuW8KcyPMfDWSEEp' \
    --storeId 'KoJlmhMQUCx70QjY' \
    > test.out 2>&1
eval_tap $? 381 'DownloadCategories' test.out

#- 382 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'bzemOTURzzAOIBar' \
    --namespace "$AB_NAMESPACE" \
    --language 'B7kcer5SvPLeQZIp' \
    --storeId 'KFXgnsxx3c2bUsO7' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetCategory' test.out

#- 383 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'FP8RmOstZAGDgiVs' \
    --namespace "$AB_NAMESPACE" \
    --language 'V2OttwJaMxPDIJ5h' \
    --storeId 'FQHumFvPKqupHj72' \
    > test.out 2>&1
eval_tap $? 383 'PublicGetChildCategories' test.out

#- 384 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'TlLs964iABOgTKtn' \
    --namespace "$AB_NAMESPACE" \
    --language 'aA7O35Iaytd9CsAM' \
    --storeId 'TZC37xPXxnfggnZ3' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetDescendantCategories' test.out

#- 385 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 385 'PublicListCurrencies' test.out

#- 386 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 386 'GeDLCDurableRewardShortMap' test.out

#- 387 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 387 'GetAppleConfigVersion' test.out

#- 388 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    > test.out 2>&1
eval_tap $? 388 'GetIAPItemMapping' test.out

#- 389 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '6wSAufwYirs9lwvP' \
    --region 'Kd925u3fFLV0YeMr' \
    --storeId 'VaYSTRYGFzgLZ7gE' \
    --appId 'ypQf2Pn9A4gcbDJ0' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetItemByAppId' test.out

#- 390 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'mdnOPkIT1C6KGTpA' \
    --categoryPath '7JZ6xullPROSfiW9' \
    --features 'zcxmgNfTHu3vkZt9' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --language '2s0sibQNBz81zRPn' \
    --limit '40' \
    --offset '48' \
    --region 'ROmUCTrS7Gi9Iigk' \
    --sortBy 'name,createdAt:desc,createdAt:asc' \
    --storeId 'uix5vnPeTu9evbRo' \
    --tags 'v7Bm40CtZiAxk43D' \
    > test.out 2>&1
eval_tap $? 390 'PublicQueryItems' test.out

#- 391 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'GV1SCkw8U0d4FvVm' \
    --region 'PMtpRMWSQ8Szi1Ir' \
    --storeId 'GidRmR5BGRJhFwxm' \
    --sku 'kGfPI3j4luXQuuLt' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetItemBySku' test.out

#- 392 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'Ya86kvL6cBZQssUU' \
    --storeId 'XOsXMNdvW1hbvGen' \
    --itemIds 'Rbm3QtsY5WaKM5YY' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetEstimatedPrice' test.out

#- 393 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '6pYrmeMIHLS8egV8' \
    --region 'XhgDjbrum8Uxcutm' \
    --storeId 'Vg8APWKxoj6MF68V' \
    --itemIds 'uKDoklYmkytCAH8J' \
    > test.out 2>&1
eval_tap $? 393 'PublicBulkGetItems' test.out

#- 394 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["iqe7gfV1G6bYgIbV", "Kp4Kgew2mHDksA6M", "v9Nzs19eBq9a1L8S"]}' \
    > test.out 2>&1
eval_tap $? 394 'PublicValidateItemPurchaseCondition' test.out

#- 395 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'BUNDLE' \
    --limit '51' \
    --offset '7' \
    --region 'Yifzvr9OqTsInGzH' \
    --storeId 'FpFXYJtHtqwoIwQB' \
    --keyword 'eIALI8JNIII4jrzr' \
    --language 'PsuMziNM8AB7RRxi' \
    > test.out 2>&1
eval_tap $? 395 'PublicSearchItems' test.out

#- 396 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'ZH3ngnitURdMjZLY' \
    --namespace "$AB_NAMESPACE" \
    --language 'CaeklQcFY1QIk1h5' \
    --region 'EKvMGd6hQ2mHjmLu' \
    --storeId '4oFlReHy0JyZv7ho' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetApp' test.out

#- 397 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'nqeiGTTqpgVsY1kP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 397 'PublicGetItemDynamicData' test.out

#- 398 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'NdJiJXB3yjNUPIfv' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'oXRO0CkW1ZcgUSbb' \
    --populateBundle  \
    --region 'nffBWRaJN1SjCFLD' \
    --storeId 'NJfAhJGwSYEZjEb0' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetItem' test.out

#- 399 GetPaymentCustomization
eval_tap 0 399 'GetPaymentCustomization # SKIP deprecated' test.out

#- 400 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "Pv35fEk9s11bFXkf", "successUrl": "7rQJ4Kj7Qyo9tUpt"}, "paymentOrderNo": "iyZzRX8Y4rxRWZPe", "paymentProvider": "STRIPE", "returnUrl": "LAQWuBJwxObZqMGx", "ui": "hffy9cHrLYfftad9", "zipCode": "9JDcnn7f2d8SOWP2"}' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetPaymentUrl' test.out

#- 401 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'dw6Uy88WpQalG38V' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetPaymentMethods' test.out

#- 402 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Oo82aLD9jUjuDITj' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetUnpaidPaymentOrder' test.out

#- 403 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ifWRbmtK7MTxcCWn' \
    --paymentProvider 'XSOLLA' \
    --zipCode 'iCLsjroKHPApA8Gs' \
    --body '{"token": "GwyocvY9NePjLJQJ"}' \
    > test.out 2>&1
eval_tap $? 403 'Pay' test.out

#- 404 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XwUApJWohXn01RB7' \
    > test.out 2>&1
eval_tap $? 404 'PublicCheckPaymentOrderPaidStatus' test.out

#- 405 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region 'uDHXcfvXPXJURX3X' \
    > test.out 2>&1
eval_tap $? 405 'GetPaymentPublicConfig' test.out

#- 406 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'whOlgcpcOIxqCMSp' \
    > test.out 2>&1
eval_tap $? 406 'PublicGetQRCode' test.out

#- 407 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'Zxby2J9vGOUeSeGb' \
    --foreinginvoice '02vDPUpv5VEdIG82' \
    --invoiceId 'dpIbfxVFfdvKQVgP' \
    --payload 'Qw3MVXe4xBPDWHRH' \
    --redirectResult 'CCVDBRjPUQWYVxGQ' \
    --resultCode 'VFJlDDJ7z4Pb5jyG' \
    --sessionId 'ID39Ung1D57FjYKl' \
    --status 'JiRIvhej77OSPwdz' \
    --token 'MSmrSvQdsAdTUGpd' \
    --type '8KFrXKFA2gdjQCYo' \
    --userId 'E8b0CZetLfpFNyp7' \
    --orderNo '375rhOmR4zFjoJZV' \
    --paymentOrderNo 'KZjOD2ePKAKYjJMV' \
    --paymentProvider 'NEONPAY' \
    --returnUrl 'NRLRjgKqSSYgZnVf' \
    > test.out 2>&1
eval_tap $? 407 'PublicNormalizePaymentReturnUrl' test.out

#- 408 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'a8govttlpFAq8oeb' \
    --paymentOrderNo 'nS4Y2zkGYTr9yJIv' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 408 'GetPaymentTaxValue' test.out

#- 409 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'sXgqx3mfB5ZwV25N' \
    > test.out 2>&1
eval_tap $? 409 'GetRewardByCode' test.out

#- 410 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic '7NAvZdGuyYEYZE3K' \
    --limit '1' \
    --offset '67' \
    --sortBy 'rewardCode:desc,namespace' \
    > test.out 2>&1
eval_tap $? 410 'QueryRewards1' test.out

#- 411 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'zgZ1fieLdl3Y82DO' \
    > test.out 2>&1
eval_tap $? 411 'GetReward1' test.out

#- 412 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 412 'PublicListStores' test.out

#- 413 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'j5kPuNRZZaUccuBY,ep9n7b17fsblalJr,wQiU3DD0xZFH1fHF' \
    --itemIds 'LSr0O4rEZTbFDj2L,2McvCrrR7h9uKLXD,aRf3pxKtJbRY5luC' \
    --skus 'wKrt6wn3yVrRCh6j,7rpv8K8fBAeRa1R6,ksxLYGkOLgReff5I' \
    > test.out 2>&1
eval_tap $? 413 'PublicExistsAnyMyActiveEntitlement' test.out

#- 414 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'HxLJIemNHbzgAFjt' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 415 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'CODE' \
    --itemId 'Bw2H4tz6KUC4jXGj' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 416 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'G0GZ3JBYi9bBKBRp' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 417 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'dbLCiwxOx2XQn94x,PqXhqeNMDGA3O5hQ,Al6U2g9imVMh3i7j' \
    --itemIds '095rDL6lEuB1ZIMI,s1dFvYokH9t2u8ZZ,nyHKkk6Gh25tEcX9' \
    --skus 'GegDnrYz0GFpSVdx,FsXAp1roclyXllFi,tPamSKRzDIZgSk6s' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetEntitlementOwnershipToken' test.out

#- 418 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "uS90ZbDdmjU11QIZ", "language": "pKt", "region": "eD7QJQEEVDAg045B"}' \
    > test.out 2>&1
eval_tap $? 418 'SyncTwitchDropsEntitlement' test.out

#- 419 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'vtPd7ibBA3sd51mD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 419 'PublicGetMyWallet' test.out

#- 420 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ooH53vibq3Qcrtt8' \
    --body '{"epicGamesJwtToken": "L5dIebsw7EjkMnJS"}' \
    > test.out 2>&1
eval_tap $? 420 'SyncEpicGameDLC' test.out

#- 421 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'ziEA43WqIMJdrqHI' \
    > test.out 2>&1
eval_tap $? 421 'SyncOculusDLC' test.out

#- 422 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'sJ98WRjqYieXRthQ' \
    --body '{"serviceLabel": 44}' \
    > test.out 2>&1
eval_tap $? 422 'PublicSyncPsnDlcInventory' test.out

#- 423 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'zLU9w8MJRIzIgJKg' \
    --body '{"serviceLabels": [51, 20, 5]}' \
    > test.out 2>&1
eval_tap $? 423 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 424 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '86BgnBQtm5AilVhA' \
    --body '{"appId": "SFlYMVJtE2dAeC7p", "steamId": "F73y9eALKWinUJ7b"}' \
    > test.out 2>&1
eval_tap $? 424 'SyncSteamDLC' test.out

#- 425 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AuUJ7Fxg5LijlQTV' \
    --body '{"xstsToken": "q8Bh1p0NCKWNkLU5"}' \
    > test.out 2>&1
eval_tap $? 425 'SyncXboxDLC' test.out

#- 426 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ty3uQa7Fl3ZhSMLt' \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'wnjTJVDlh112byTY' \
    --features 'CDBnAvf8JpFuJSZi,stM75544PDlVK8ta,ScpV0NtCxDDz5rxt' \
    --itemId '6LflBJjokLAaL4oA,F2lqx8yneWKrOy4x,cg30BqC5W7g7hiwu' \
    --limit '25' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 426 'PublicQueryUserEntitlements' test.out

#- 427 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DQK45IAtbyUDDSJS' \
    --appId 'V8pzl1lfIR7jnetI' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetUserAppEntitlementByAppId' test.out

#- 428 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'JPGObyWCLyFPHaxk' \
    --limit '75' \
    --offset '93' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 428 'PublicQueryUserEntitlementsByAppType' test.out

#- 429 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '4fRbawD5yOvjgOop' \
    --availablePlatformOnly  \
    --ids 'QfbXmtF0WFH7F2In,hxtynUjuBCxkb2oF,99xI1VVtVrVT6Hn8' \
    > test.out 2>&1
eval_tap $? 429 'PublicGetUserEntitlementsByIds' test.out

#- 430 PublicGetUserEntitlementByItemId
eval_tap 0 430 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 431 PublicGetUserEntitlementBySku
eval_tap 0 431 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 432 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'B2d1hZUnoQwg5uqg' \
    --endDate 'oHaFyoczck0qJsgZ' \
    --entitlementClazz 'OPTIONBOX' \
    --limit '26' \
    --offset '12' \
    --startDate 'uILkeRUafUDP5b6B' \
    > test.out 2>&1
eval_tap $? 432 'PublicUserEntitlementHistory' test.out

#- 433 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wfm7cYCpDIJG42IL' \
    --appIds 'hUoCh8lmKKocC5Ea,29JhfFGN964J8WOg,sAj2Rmf1DXvAIkzT' \
    --itemIds 'RNRVyeEGu1ICOCmL,AmcaEFBKgy92LYqt,QcDN7OMCehk42acy' \
    --skus '8wsWaPyppR3ztPSA,LA8LlV2sccbVr6HS,iXVzrG4EdKn8eypT' \
    > test.out 2>&1
eval_tap $? 433 'PublicExistsAnyUserActiveEntitlement' test.out

#- 434 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zI497DG0ZNoJvvi4' \
    --appId 'Ys50iE7IjZoDzMmM' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 435 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'goMxZZ9AutWDfVOI' \
    --entitlementClazz 'OPTIONBOX' \
    --itemId '0VmaTR7E3mkDSQkg' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 436 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'VMhLbM6H1MnNSKd0' \
    --ids 'KStITvGQtzwjGtGT,r238G8Aevk3k1478,2W2oNo3X4m6wms9S' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 437 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'PaHlqtDPry2vMON7' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'IICVNNRV4lBToTcn' \
    > test.out 2>&1
eval_tap $? 437 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 438 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '1l44ebrKEKdeo779' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KG5yCz9jVs1lYK1M' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserEntitlement' test.out

#- 439 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'x9rEFkDqb31AZzwi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QBaGdS41VRIyAHjY' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["CVJtkxjBJrNeQRsq", "kkKK2qxqzy4KSA5U", "tSXWjANSWIT9TLnu"], "requestId": "MLNJAEk3A6A6rYiI", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 439 'PublicConsumeUserEntitlement' test.out

#- 440 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId '7ME2QmYiYqap7mas' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ucayqmp7vhz1T6cS' \
    --body '{"requestId": "rZL2CgHxdmYDj9vZ", "useCount": 80}' \
    > test.out 2>&1
eval_tap $? 440 'PublicSellUserEntitlement' test.out

#- 441 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'c4q5sJVzaKGDOULJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bjHphqjHGGAhfWaX' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 80}' \
    > test.out 2>&1
eval_tap $? 441 'PublicSplitUserEntitlement' test.out

#- 442 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'kA5fuVYOsMFo9tnq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'a4LEWGg1r4nW4pBc' \
    --body '{"entitlementId": "PPaiaM1og5rxUjGP", "metadata": {"operationSource": "INVENTORY"}, "useCount": 77}' \
    > test.out 2>&1
eval_tap $? 442 'PublicTransferUserEntitlement' test.out

#- 443 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '9EwbIGMGJ70P9IqA' \
    --body '{"code": "yNlZ2OwFSebBkXka", "language": "TSS_Fp", "region": "LkxFnAqyvjBy0NXg"}' \
    > test.out 2>&1
eval_tap $? 443 'PublicRedeemCode' test.out

#- 444 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7zd6SFpkV7cAICgW' \
    --body '{"excludeOldTransactions": false, "language": "YyhS", "productId": "Na5yOM68r4W1fDZL", "receiptData": "80oPQ0s7QhC8hgSg", "region": "ytNEojK3YgWH9l7r", "transactionId": "v6XUSINd4keCeiw7"}' \
    > test.out 2>&1
eval_tap $? 444 'PublicFulfillAppleIAPItem' test.out

#- 445 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'P2PtUrPawQPaHARr' \
    --body '{"epicGamesJwtToken": "hjbEU5n0PNuFyKW9"}' \
    > test.out 2>&1
eval_tap $? 445 'SyncEpicGamesInventory' test.out

#- 446 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '5dJsGoBIjCKlD3ax' \
    --body '{"autoAck": true, "autoConsume": false, "language": "jTb-jCoD", "orderId": "wlnsTap2RJpHtncL", "packageName": "ywP3WlLmNdQGk6vn", "productId": "eHoB1PXO1vT1AonF", "purchaseTime": 83, "purchaseToken": "RIHDKdVfOUr14yZH", "region": "00n8MsRjaB8iurBW", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 446 'PublicFulfillGoogleIAPItem' test.out

#- 447 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'jSJi0seeGJIqnatM' \
    > test.out 2>&1
eval_tap $? 447 'SyncOculusConsumableEntitlements' test.out

#- 448 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'E8GnNWfAY1yY6D1E' \
    --body '{"currencyCode": "uusf0eOzoSyKttYw", "price": 0.7553967759622163, "productId": "UlMRG8vO0OSsJmhO", "serviceLabel": 72}' \
    > test.out 2>&1
eval_tap $? 448 'PublicReconcilePlayStationStore' test.out

#- 449 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 's8LmXm0FaJMIjgzU' \
    --body '{"currencyCode": "02nZWwBdEFpfccau", "price": 0.8109082773192136, "productId": "Dc86pxK9KhF4KRVP", "serviceLabels": [41, 30, 70]}' \
    > test.out 2>&1
eval_tap $? 449 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 450 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1hrg2mhbI0NDshb7' \
    --body '{"appId": "ZzQuBPyNi1GhZHEj", "currencyCode": "6p5grjk5wzdksOUk", "language": "KmD_OPja_395", "price": 0.8664190329579575, "productId": "9X4zFOvdRTpGmBUj", "region": "fEU9vL8H96tuVfQw", "steamId": "YIqDWqbPmwQw8J7n"}' \
    > test.out 2>&1
eval_tap $? 450 'SyncSteamInventory' test.out

#- 451 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'TFp3cIxOI33nt54i' \
    --activeOnly  \
    --groupId '5hdAezedcppbujZh' \
    --limit '73' \
    --offset '10' \
    --productId 'oTpYoe2uHaWnO98Y' \
    > test.out 2>&1
eval_tap $? 451 'PublicQueryUserThirdPartySubscription' test.out

#- 452 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wqHZnEDkfmNbDTMG' \
    --body '{"gameId": "gET2yS6C8a8L0vQD", "language": "qfSx", "region": "BmsUzx64Gr4XEm0u"}' \
    > test.out 2>&1
eval_tap $? 452 'SyncTwitchDropsEntitlement1' test.out

#- 453 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYuAmqhftIfe2zdq' \
    --body '{"currencyCode": "Z7ht1vUiJ7jBXy8p", "price": 0.2995839244692454, "productId": "NoHNalwgvju62rPF", "xstsToken": "MbE1cW57GaNZLT1z"}' \
    > test.out 2>&1
eval_tap $? 453 'SyncXboxInventory' test.out

#- 454 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '0GqDZN7ftHOhVy48' \
    --discounted  \
    --itemId 'YYg1AkRh3NmbRhMx' \
    --limit '74' \
    --offset '16' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 454 'PublicQueryUserOrders' test.out

#- 455 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'D7djt1VeOFBDA3gv' \
    --body '{"currencyCode": "CRfoBijpbMblGWnp", "discountCodes": ["2hJvrOCdAEZ2RHt3", "0RhxQtgVgbN8kr87", "94a6GKY0BrHiWs0B"], "discountedPrice": 42, "ext": {"a2c4JscEQfBFZXcS": {}, "XpU81S5H9XsZyvZO": {}, "FJ5RrFZYcwfQ1Q2B": {}}, "itemId": "bcjSpv6Nt1oz4tdg", "language": "gl_lD", "price": 93, "quantity": 22, "region": "vIDQI2uIi2SNZKql", "returnUrl": "JZsdnY04DIyosprZ", "sectionId": "PBaERb7U9kK4VctU"}' \
    > test.out 2>&1
eval_tap $? 455 'PublicCreateUserOrder' test.out

#- 456 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'mDhFVNa0JYzTbdnO' \
    --body '{"currencyCode": "nEarWP4nrJ5fNESR", "discountCodes": ["VGeswvkzLNIITUJG", "5LpdkRCAU8HhmXC6", "j5FYaSgewLWHcBxz"], "discountedPrice": 74, "itemId": "JFPdxhvBKee6wG66", "price": 9, "quantity": 86}' \
    > test.out 2>&1
eval_tap $? 456 'PublicPreviewOrderPrice' test.out

#- 457 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'PPAJ6Z9UzqIhZZiK' \
    --userId '0QEG6C9w4lVRNOF1' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserOrder' test.out

#- 458 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Bg6OHZzvdZHoIm4t' \
    --userId 'KNhPjNIQGFxGwgnS' \
    > test.out 2>&1
eval_tap $? 458 'PublicCancelUserOrder' test.out

#- 459 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iZtChE0uof77AAPI' \
    --userId '5tdPeFz9pGYsLNEG' \
    > test.out 2>&1
eval_tap $? 459 'PublicGetUserOrderHistories' test.out

#- 460 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rfy9qHKufJfk0MeG' \
    --userId '3qYJr6PuCVK9WmDA' \
    > test.out 2>&1
eval_tap $? 460 'PublicDownloadUserOrderReceipt' test.out

#- 461 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'dpLVTVsj9pDiyybX' \
    > test.out 2>&1
eval_tap $? 461 'PublicGetPaymentAccounts' test.out

#- 462 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'Y4v7JRFMRaeIaQuP' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'lkxeotrNakKGvOSv' \
    > test.out 2>&1
eval_tap $? 462 'PublicDeletePaymentAccount' test.out

#- 463 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'pmZZdlNXdx2kWmSq' \
    --autoCalcEstimatedPrice  \
    --language 'odNZgfQyDVVkkqiM' \
    --region 'iRf2yCyM0Tp5GJHH' \
    --storeId 'bsLJ73mCPhhmUyIw' \
    --viewId 'gQS9kVFUbeTeB9Kg' \
    > test.out 2>&1
eval_tap $? 463 'PublicListActiveSections' test.out

#- 464 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'nFZQ9lVMNyCiytnf' \
    --chargeStatus 'SETUP' \
    --itemId 'NTRYld9FJJ10goNq' \
    --limit '55' \
    --offset '41' \
    --sku 'aBRalz5HEm4Gant6' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 464 'PublicQueryUserSubscriptions' test.out

#- 465 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjKzWDAauqLKarcL' \
    --body '{"currencyCode": "QRQtC927GneBM8Lv", "itemId": "zgyIVzGFBLJ5vbC9", "language": "dFMm_pYas_343", "region": "mkDdFSs4s7u1VUuL", "returnUrl": "menyxTQVkEg5wouU", "source": "Ka35m8oH9zCfw7mC"}' \
    > test.out 2>&1
eval_tap $? 465 'PublicSubscribeSubscription' test.out

#- 466 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkbvSIm7JROcwVmG' \
    --itemId 'yrBpnTPF4VrRiFSP' \
    > test.out 2>&1
eval_tap $? 466 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 467 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 's2ZMcVFcrixULzSe' \
    --userId 'TnUWGxxfnMIDSCPr' \
    > test.out 2>&1
eval_tap $? 467 'PublicGetUserSubscription' test.out

#- 468 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1m1Fg6tc250c2okD' \
    --userId 'Tem6o62xFY6TNqoL' \
    > test.out 2>&1
eval_tap $? 468 'PublicChangeSubscriptionBillingAccount' test.out

#- 469 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'FFS4wB6Um7ir0n6O' \
    --userId '3vbYVjrcErgoApAx' \
    --body '{"immediate": true, "reason": "o9nJoKEb8tHmFwLG"}' \
    > test.out 2>&1
eval_tap $? 469 'PublicCancelSubscription' test.out

#- 470 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'an2SrKckNxLWH6rj' \
    --userId 'hRL9uxoV5Oe8ktle' \
    --excludeFree  \
    --limit '85' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserSubscriptionBillingHistories' test.out

#- 471 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eo1xBuRSv6VizgtO' \
    --language 'XZy9cQ6B074dTJZq' \
    --storeId 'eOllKQNwJUGtC0tA' \
    > test.out 2>&1
eval_tap $? 471 'PublicListViews' test.out

#- 472 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'hxn1ay6ruu7PYWHO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DRb6skOj0lfYFGnQ' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetWallet' test.out

#- 473 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'CAWidWPjYgyebU6r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFirnUpZ9UJ4N78q' \
    --limit '68' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 473 'PublicListUserWalletTransactions' test.out

#- 474 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 474 'PublicGetMyDLCContent' test.out

#- 475 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'WPxd1gqlwx9CE4Wc' \
    --limit '38' \
    --offset '40' \
    --startTime 'mYtCkIgcwiDWQFgh' \
    --state 'FULFILL_FAILED' \
    --transactionId '954BmtuIFllfSUna' \
    --userId 'UhC4x11AS2jTKoTY' \
    > test.out 2>&1
eval_tap $? 475 'QueryFulfillments' test.out

#- 476 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --availableDate 'y01FkEEXlKiTIDgP' \
    --baseAppId '7wuXQdfW99JglSco' \
    --categoryPath 'OlkkBxiXf8OBQRqX' \
    --features 'WXQ3JdXdFz8pc0EE' \
    --includeSubCategoryItem  \
    --itemName 'ziE5yIvijq9ix16v' \
    --itemStatus 'ACTIVE' \
    --itemType 'INGAMEITEM,MEDIA,CODE' \
    --limit '61' \
    --offset '12' \
    --region 'qqSctLL4WfGq8JCD' \
    --sectionExclusive  \
    --sortBy 'createdAt,createdAt:desc,updatedAt:desc' \
    --storeId 'HGVKDcKulj3Pdegy' \
    --tags '4G6LOpak8CYp6DPd' \
    --targetNamespace 'ukc04j6rbfBuKBco' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 476 'QueryItemsV2' test.out

#- 477 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '1AeO3yvvBLZPBuek' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 477 'ImportStore1' test.out

#- 478 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eBe4Tvb3fHCIJZkw' \
    --body '{"itemIds": ["EcCRi2U7s2ZQAarw", "H0c87v0PwZjydyzG", "DZM4zTTYI6O8coYD"]}' \
    > test.out 2>&1
eval_tap $? 478 'ExportStore1' test.out

#- 479 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WUfcL1qsegBsrNqe' \
    --body '{"entitlementCollectionId": "W5BxVe8iW7sGELnM", "entitlementOrigin": "Epic", "metadata": {"ZPWSe20JfNvtNcWt": {}, "pUkw98x3tMM1bFFD": {}, "IqKD8HJ4X0DetCeJ": {}}, "origin": "Oculus", "rewards": [{"currency": {"currencyCode": "x0wf5mQx6Hs7M5ap", "namespace": "PMc8ZR3bPCJ5n5s6"}, "item": {"itemId": "DODBmrqEhGlkEmGd", "itemName": "CbwodVRjZJWuCQpj", "itemSku": "uJzpPO7BPxVWlRFn", "itemType": "IekrQ99ecmenxguw"}, "quantity": 34, "type": "CURRENCY"}, {"currency": {"currencyCode": "KxayGvw7MqOsypCJ", "namespace": "mfRnW0spgvjt7eCL"}, "item": {"itemId": "Du6PA3PRnQtB410i", "itemName": "WT0SILVGXCWRucRp", "itemSku": "P1Tq7uYXhB6FPfF5", "itemType": "DvveMdBsPt19V2Fk"}, "quantity": 57, "type": "CURRENCY"}, {"currency": {"currencyCode": "IUXlBlZMQeSnOg5g", "namespace": "f1SwrbpmoF4DvNA1"}, "item": {"itemId": "wo9IAxV5C71gTw8B", "itemName": "JPFctwUMCRdxXOBu", "itemSku": "3TWmHDVmCGFoD7aN", "itemType": "Fj9wORAVqRuNsXxR"}, "quantity": 43, "type": "CURRENCY"}], "source": "SELL_BACK", "transactionId": "k7F1KKOfFFLvER3x"}' \
    > test.out 2>&1
eval_tap $? 479 'FulfillRewardsV2' test.out

#- 480 FulfillItems
eval_tap 0 480 'FulfillItems # SKIP deprecated' test.out

#- 481 RetryFulfillItems
eval_tap 0 481 'RetryFulfillItems # SKIP deprecated' test.out

#- 482 RevokeItems
eval_tap 0 482 'RevokeItems # SKIP deprecated' test.out

#- 483 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCwUgKa4oCBoJDxG' \
    --body '{"transactionId": "a1UuSr4ehnV8Aw9m"}' \
    > test.out 2>&1
eval_tap $? 483 'V2PublicFulfillAppleIAPItem' test.out

#- 484 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '6GvDSE2F7Ad69Dln' \
    --userId '4mqFhgKKcGohdjQU' \
    --body '{"items": [{"duration": 46, "endDate": "1977-01-29T00:00:00Z", "entitlementCollectionId": "ytM5mBRT39gKYLk9", "entitlementOrigin": "Steam", "itemId": "PSQnphnvAWBSOr7z", "itemSku": "ljUKyhKkD7wAHMrv", "language": "8zABDhYAVxvs3ugN", "metadata": {"vvgI2k1P9nQxzj3A": {}, "nmpWfje5cAtTDvwF": {}, "HcoODi5oF1pccdjj": {}}, "orderNo": "ZpFnVLb7xerpjVPf", "origin": "IOS", "quantity": 39, "region": "tNnl8UYH5kesuOtY", "source": "CONSUME_ENTITLEMENT", "startDate": "1990-05-12T00:00:00Z", "storeId": "sKkgX0RMDxvlK9Rn"}, {"duration": 93, "endDate": "1972-09-12T00:00:00Z", "entitlementCollectionId": "8xLKyBfGLHEAKhp6", "entitlementOrigin": "Other", "itemId": "2Y2ncRf7tEGzYqRo", "itemSku": "Hm6EtyXqQbKWMJ0a", "language": "ODiWn6bPmSa85Riu", "metadata": {"1alaVEhjJZbwMHkF": {}, "WLSzmAXAruYrVjX4": {}, "HRTvm3Qr9IkuW6jj": {}}, "orderNo": "ofc6itDEsq0dHfYG", "origin": "IOS", "quantity": 77, "region": "853GERdJdphepF9d", "source": "DLC", "startDate": "1983-05-29T00:00:00Z", "storeId": "mfVfny2M0KsS08cY"}, {"duration": 80, "endDate": "1974-03-23T00:00:00Z", "entitlementCollectionId": "Fr3olO10RAyIZs2V", "entitlementOrigin": "GooglePlay", "itemId": "VeYSM479gn62lizs", "itemSku": "WGrtIgVPb7hoo8Yk", "language": "NPW8mWOJGtdXJGDs", "metadata": {"xRAR3NObYp43YXMH": {}, "qWeVjnOURxGvOhz9": {}, "s7ktWkJDaHg6kDVj": {}}, "orderNo": "xhxRxjeDrqCfJEjr", "origin": "Oculus", "quantity": 72, "region": "INkMgjsnP8itevmj", "source": "IAP", "startDate": "1989-03-19T00:00:00Z", "storeId": "netcvAuim14Wdh1q"}]}' \
    > test.out 2>&1
eval_tap $? 484 'FulfillItemsV3' test.out

#- 485 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'KoSDBbyqlJyfVgaW' \
    --userId '6ziZF6ijZzA3Mkos' \
    > test.out 2>&1
eval_tap $? 485 'RetryFulfillItemsV3' test.out

#- 486 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'OcoAcV0T2G3vQZNi' \
    --userId 'qaXzRBra3I4K9iBd' \
    > test.out 2>&1
eval_tap $? 486 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE