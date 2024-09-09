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
echo "1..462"

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

#- 63 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
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
eval_tap $? 63 'QueryEntitlements' test.out

#- 64 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'gxefTYKhuxaEc7M4,P7UckSC6ePeN8i4G,rFES9z7xueHpATHc' \
    --limit '5' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 64 'QueryEntitlements1' test.out

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
    --body '{"entitlementGrantList": [{"collectionId": "ee9GXhKcjmSEwdrk", "endDate": "1986-05-09T00:00:00Z", "grantedCode": "nnqKzFsLfYalUlfw", "itemId": "EQKjU7eHGebSVu0L", "itemNamespace": "Q40kepEaC4dfiOMZ", "language": "Gf", "metadata": {"Hr39pysFO3Zvc1BZ": {}, "G99LyvfvHEsJKQQe": {}, "wVLMUoAnaRcYp7FU": {}}, "origin": "IOS", "quantity": 13, "region": "fIGaffoflEIByYqe", "source": "REDEEM_CODE", "startDate": "1991-09-21T00:00:00Z", "storeId": "0meGelYF5wWaDhuk"}, {"collectionId": "U4khGG4vZFTYnPkm", "endDate": "1993-09-02T00:00:00Z", "grantedCode": "u4PWam1jxR7SETWj", "itemId": "teoc8fgvZDDhoO05", "itemNamespace": "oKqymxLD1Lcvw6T6", "language": "Mf", "metadata": {"wxxElpMYSWIeVzm7": {}, "z9noowmlTIKVowi0": {}, "RY2VN4ZONJREdUQ3": {}}, "origin": "Playstation", "quantity": 36, "region": "9F1BxNNgnke4aknc", "source": "PURCHASE", "startDate": "1980-03-21T00:00:00Z", "storeId": "wu9TmXfJWBPrx9Ns"}, {"collectionId": "8eLzYEvwSWTaLQjc", "endDate": "1981-08-20T00:00:00Z", "grantedCode": "vrK2jhsYpKPlXn77", "itemId": "AtYoFzLAATPY8P8P", "itemNamespace": "3cfoivvQxevecWw7", "language": "ORiY_DSGb-yf", "metadata": {"8rX2MVUGKSZ4GcLk": {}, "t4pK32sJxlZcCTpT": {}, "dRtCHvuk6B6XTmSL": {}}, "origin": "Playstation", "quantity": 27, "region": "vqjhbeK2qN8g6x2P", "source": "REDEEM_CODE", "startDate": "1982-12-28T00:00:00Z", "storeId": "Do5R3hLiD5sf5y1J"}], "userIds": ["x1aMjgGim51T107X", "BZVGLlkUetzCAWc9", "sxJNGmyt0SQDUDoW"]}' \
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
    --body '{"bundleId": "QuTKfC0I2kNjCMDt", "password": "DMrentgn3DhqciwI"}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateAppleIAPConfig' test.out

#- 75 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'DeleteAppleIAPConfig' test.out

#- 76 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetEpicGamesIAPConfig' test.out

#- 77 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "eShF9RKb9vvxuJlh"}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateEpicGamesIAPConfig' test.out

#- 78 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteEpicGamesIAPConfig' test.out

#- 79 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 79 'GetGoogleIAPConfig' test.out

#- 80 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "XbWhbwPwToC6knjV", "serviceAccountId": "wVnzaqSfJiQFC2gX"}' \
    > test.out 2>&1
eval_tap $? 80 'UpdateGoogleIAPConfig' test.out

#- 81 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 81 'DeleteGoogleIAPConfig' test.out

#- 82 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 82 'UpdateGoogleP12File' test.out

#- 83 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetIAPItemConfig' test.out

#- 84 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "oda0kg16yUSpSOAj", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"WwfCjYwWkLob9gKL": "qs2nEZhpByfHZinx", "NfgPAwkMBsznlBUq": "nLT4AbGptKaWNvPb", "pg7yrRvXfZ6rvgvE": "Y3Hht1SwqTsKKKo3"}}, {"itemIdentity": "7NHDOQe91Ps3ztUI", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"0dS6hIH9c4Vfkyrw": "puXxbaERbfgPmi0e", "Hkt1mr9EOIFg0dnW": "IYN2NVL70Iw157g0", "0jr9b8MuYmmeKTmB": "NvGYxEQdf3ewoGGo"}}, {"itemIdentity": "Y7xmFNAmjDDCvs78", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"laKEfkoYjY2o6ouR": "W9UtNquwC3WgumrI", "z4NhGztZpr4U4fwQ": "IiLXgmRasvjO4lj8", "m3XEwP2b4gd3xOei": "i8Jnmssep2xD2NY0"}}]}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateIAPItemConfig' test.out

#- 85 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'DeleteIAPItemConfig' test.out

#- 86 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 86 'GetOculusIAPConfig' test.out

#- 87 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "kABeGs9yxahld1pO", "appSecret": "0Gyf5PO3COyMvczg"}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateOculusIAPConfig' test.out

#- 88 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 88 'DeleteOculusIAPConfig' test.out

#- 89 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'GetPlayStationIAPConfig' test.out

#- 90 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "EpzZ3FbtxfhcRC7I", "backOfficeServerClientSecret": "VYa6iZ5uFRYNn3SH", "enableStreamJob": false, "environment": "rmzVr5XT1Nxw0v1d", "streamName": "MQ9Rrbk6C2cVWf6t", "streamPartnerName": "tvbU1PO6ApCD2VXi"}' \
    > test.out 2>&1
eval_tap $? 90 'UpdatePlaystationIAPConfig' test.out

#- 91 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 91 'DeletePlaystationIAPConfig' test.out

#- 92 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'ValidateExistedPlaystationIAPConfig' test.out

#- 93 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "dT7w0Oc15N8WXBPp", "backOfficeServerClientSecret": "17PAewqSm5x3B4t7", "enableStreamJob": false, "environment": "6EjRwEQlNapJRfk4", "streamName": "f9Zcw1pEHAyNFxcV", "streamPartnerName": "TKuAQTGh5BxjWOoz"}' \
    > test.out 2>&1
eval_tap $? 93 'ValidatePlaystationIAPConfig' test.out

#- 94 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 94 'GetSteamIAPConfig' test.out

#- 95 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "GoDtsUuYo5p8ED5Q", "publisherAuthenticationKey": "ZAufwNa8lzfjv9oY"}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateSteamIAPConfig' test.out

#- 96 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'DeleteSteamIAPConfig' test.out

#- 97 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 97 'GetTwitchIAPConfig' test.out

#- 98 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "MXMjlVHY1AHwF3vG", "clientSecret": "oav7MK0PcLnEkcok", "organizationId": "KwcQ0baDT9OyJ2h2"}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateTwitchIAPConfig' test.out

#- 99 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'DeleteTwitchIAPConfig' test.out

#- 100 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'GetXblIAPConfig' test.out

#- 101 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"relyingPartyCert": "3GUS2amU7syGlElX"}' \
    > test.out 2>&1
eval_tap $? 101 'UpdateXblIAPConfig' test.out

#- 102 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'DeleteXblAPConfig' test.out

#- 103 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'dEAOrVSnLocLVVYa' \
    > test.out 2>&1
eval_tap $? 103 'UpdateXblBPCertFile' test.out

#- 104 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'mQc4wcG5nDBLJoJH' \
    --feature 'biQ5duE5p4cfs2E4' \
    --itemId '1cK8QTwiIAvxSvND' \
    --itemType 'CODE' \
    --startTime 'ODbi9BzupBsFpYc7' \
    > test.out 2>&1
eval_tap $? 104 'DownloadInvoiceDetails' test.out

#- 105 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime '7GtRUcCFeY5g4XgB' \
    --feature 'sbfzqxBPNe8ae1Il' \
    --itemId '4aAtEbu4IjGdqthR' \
    --itemType 'LOOTBOX' \
    --startTime 'EmDY9vLh3u6EDsUm' \
    > test.out 2>&1
eval_tap $? 105 'GenerateInvoiceSummary' test.out

#- 106 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rV6kH4OotKwG3UC6' \
    --body '{"categoryPath": "XCnnZxF8CmQr17W6", "targetItemId": "5br34rBBN9tU6TDm", "targetNamespace": "5GloFSKWM1eym5yd"}' \
    > test.out 2>&1
eval_tap $? 106 'SyncInGameItem' test.out

#- 107 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C6p25xCWTqUOYZEN' \
    --body '{"appId": "J1QHZQxPRXH7uxBJ", "appType": "SOFTWARE", "baseAppId": "UK6mQ5iZgbwwm5iG", "boothName": "zXtcknrgidKupvXO", "categoryPath": "6aj4hCmTC34jxW4p", "clazz": "IDwdqXpmRmut9H9X", "displayOrder": 49, "entitlementType": "CONSUMABLE", "ext": {"bp8fQxRuX91uYmtr": {}, "HJbEGTUj7YjERL1r": {}, "EQG02zccA8wvLsWU": {}}, "features": ["uFpZum7izxe7NPzj", "SvDwuOrP9lzpiX0V", "Nd6lPKvqDejvqklT"], "flexible": false, "images": [{"as": "SrN8jkIykR2zbaI6", "caption": "PD7fEscShnGUGUtV", "height": 67, "imageUrl": "XLKAmlDr19uJ3nq6", "smallImageUrl": "VerzVCcI8y3Cz0Yq", "width": 59}, {"as": "4HtMlFgvh2Dp2Soi", "caption": "IPp1yvfAHS0VgLu1", "height": 8, "imageUrl": "A3HTovFi4tPAGfle", "smallImageUrl": "yCA6jEtcqsnzoVIL", "width": 19}, {"as": "7mpVI6eTYAjdPlCi", "caption": "QQC35cj4KyOVgvnW", "height": 2, "imageUrl": "oxfrtbECD1CYPwai", "smallImageUrl": "BAxfYL8Avt70ZUT2", "width": 12}], "inventoryConfig": {"customAttributes": {"cgwC3IN6tvKgLB9Q": {}, "mJIOq9dP5szG71ut": {}, "jsQ4CrRb9gUCeVz7": {}}, "serverCustomAttributes": {"fWbZIdhevfZvyV7A": {}, "codcZwKjYDdmJOlz": {}, "wm9Su4FnS98QqftS": {}}, "slotUsed": 19}, "itemIds": ["5PbCvDLil8wj9cKM", "3Ar6MF35hCER4nGm", "WGgTJfHlJl4tHGa4"], "itemQty": {"XfZcd9CVnGqMX9Fi": 9, "jfJKyFlM0u1uuoVd": 28, "VqiYOJf5KwMZQjzv": 19}, "itemType": "SEASON", "listable": false, "localizations": {"LaGPGdqLE8Sohhhu": {"description": "iTnJarYYkHBDdSzB", "localExt": {"Xdxapwhd5IQYBQux": {}, "LvPuWYvE3fsNy9Z9": {}, "OhxXvCp9y7fLD2qf": {}}, "longDescription": "CXnlUnqxT1WsRNMZ", "title": "cA92hzC7MNa8vVe4"}, "MHX6AgMep90AyyUJ": {"description": "yAK5PRMRMwdvl0hv", "localExt": {"6g62GxBW2tQF5tkT": {}, "jgJaMYvNQOsDa4bk": {}, "cgepqtxjbrztee7Q": {}}, "longDescription": "LTGAak7Kaol01DK9", "title": "7D2xnik42miteR5e"}, "QAe1rzmmgqBPRmd6": {"description": "mO4oI8KDqebm83ra", "localExt": {"NBJ5y7axEkvI4oxZ": {}, "EDxGiBnNbn0zaf7C": {}, "aOSlHXrUSA6sMJzA": {}}, "longDescription": "5mtqISQ83TTbtefX", "title": "WznDe4LQdXfFBii2"}}, "lootBoxConfig": {"rewardCount": 89, "rewards": [{"lootBoxItems": [{"count": 67, "duration": 54, "endDate": "1979-11-11T00:00:00Z", "itemId": "1r0sVZ6LJAOddIL2", "itemSku": "l3hPjNDKv2LWfXqj", "itemType": "r8fS79En3wYowBdk"}, {"count": 1, "duration": 48, "endDate": "1997-01-25T00:00:00Z", "itemId": "3y6i38XQjLDRqkpi", "itemSku": "FK5BtiQ272Uo9UBJ", "itemType": "WodpdwsX1jorcyR0"}, {"count": 47, "duration": 36, "endDate": "1999-03-21T00:00:00Z", "itemId": "YiHF8ITGPRQBCgIs", "itemSku": "1Q2lzxl0yF5m77TT", "itemType": "h4gUoj8u2WRcLiEt"}], "name": "zVlnkflfn7pHY48F", "odds": 0.8629193778692946, "type": "PROBABILITY_GROUP", "weight": 90}, {"lootBoxItems": [{"count": 22, "duration": 99, "endDate": "1998-02-04T00:00:00Z", "itemId": "q92m3iRlfnBAk0Cw", "itemSku": "iAsR65yQ9ssuHdGm", "itemType": "xncCEr0KcgeqzGbr"}, {"count": 42, "duration": 9, "endDate": "1991-08-03T00:00:00Z", "itemId": "B72HHMkjzyBB4UFK", "itemSku": "iaoV0VOem2yqPsMF", "itemType": "xKybPkbuS6x9cLJ1"}, {"count": 54, "duration": 86, "endDate": "1976-04-22T00:00:00Z", "itemId": "GcMICPUYnfG6jl9U", "itemSku": "4jReteIMgzISomCs", "itemType": "odJrhQW41q2OspCZ"}], "name": "bt3Uta5I0uGcL1ko", "odds": 0.4020694577088809, "type": "REWARD_GROUP", "weight": 79}, {"lootBoxItems": [{"count": 19, "duration": 45, "endDate": "1985-02-08T00:00:00Z", "itemId": "H5olYLETRpABAmO2", "itemSku": "EGvJ4UMS93yOxNIn", "itemType": "DByhnoluO6ti0QP2"}, {"count": 38, "duration": 27, "endDate": "1980-11-29T00:00:00Z", "itemId": "iJ66OzOj84O6tgoh", "itemSku": "jtC7bzjPpucddXJ5", "itemType": "zifF8y959anrNSle"}, {"count": 49, "duration": 47, "endDate": "1985-09-27T00:00:00Z", "itemId": "xyQrUpIFvORxTi79", "itemSku": "DpSjb39ukcR6c2E2", "itemType": "r3vk3IfAKEbqcNXS"}], "name": "GCCvNowNmdpcJgF8", "odds": 0.9812710036798328, "type": "REWARD", "weight": 91}], "rollFunction": "DEFAULT"}, "maxCount": 37, "maxCountPerUser": 90, "name": "Mj7mulP4tQ6R1OqK", "optionBoxConfig": {"boxItems": [{"count": 97, "duration": 77, "endDate": "1992-05-28T00:00:00Z", "itemId": "TniBgLsNhdgQ0JWZ", "itemSku": "jNRSzOTqcVNX3ahv", "itemType": "xw9gwwhTnjN6wKZG"}, {"count": 99, "duration": 49, "endDate": "1999-08-14T00:00:00Z", "itemId": "y3f0R9s2kndhhZhw", "itemSku": "AiLsZs4pmLDIQch4", "itemType": "IjDq9aT3qZyI0rYs"}, {"count": 100, "duration": 77, "endDate": "1981-11-12T00:00:00Z", "itemId": "cAkXsVJbXi7eRZa7", "itemSku": "WwIc895ImqK6tVsa", "itemType": "Uq3stUh5J5Z9GiBi"}]}, "purchasable": true, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 50, "fixedTrialCycles": 23, "graceDays": 81}, "regionData": {"X5cS0IeHpWCugmfO": [{"currencyCode": "L0QQpxsuD8PGqku5", "currencyNamespace": "9eFJrOXyDYz9vMUO", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1988-03-27T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1972-02-23T00:00:00Z", "expireAt": "1992-04-04T00:00:00Z", "price": 2, "purchaseAt": "1971-09-19T00:00:00Z", "trialPrice": 95}, {"currencyCode": "7gHPTPQbvLt2NRqJ", "currencyNamespace": "GIKzLyH1y72L13Or", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1983-08-11T00:00:00Z", "discountPercentage": 48, "discountPurchaseAt": "1995-02-19T00:00:00Z", "expireAt": "1989-04-05T00:00:00Z", "price": 94, "purchaseAt": "1981-11-21T00:00:00Z", "trialPrice": 77}, {"currencyCode": "FfM8M0IW4oe8KDgy", "currencyNamespace": "0xZfAcNg14Ws8TIP", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1998-10-22T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1999-09-13T00:00:00Z", "expireAt": "1973-12-16T00:00:00Z", "price": 59, "purchaseAt": "1978-10-02T00:00:00Z", "trialPrice": 77}], "H9WaVO4iKhDcJ7TC": [{"currencyCode": "cNIsQ3PuppUxDSK8", "currencyNamespace": "aOTGMudcxlCV4cNb", "currencyType": "REAL", "discountAmount": 77, "discountExpireAt": "1975-04-03T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1992-04-09T00:00:00Z", "expireAt": "1972-12-04T00:00:00Z", "price": 18, "purchaseAt": "1987-04-17T00:00:00Z", "trialPrice": 65}, {"currencyCode": "pjS2DRfGt9GlyZVQ", "currencyNamespace": "4X67tPZSTpPq3xjr", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1976-02-26T00:00:00Z", "discountPercentage": 45, "discountPurchaseAt": "1979-06-28T00:00:00Z", "expireAt": "1971-09-01T00:00:00Z", "price": 93, "purchaseAt": "1974-10-02T00:00:00Z", "trialPrice": 46}, {"currencyCode": "f1ANTJ9Yk997XkGO", "currencyNamespace": "dC6ItxDT8p4n4XCF", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1986-03-17T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1995-10-13T00:00:00Z", "expireAt": "1997-11-01T00:00:00Z", "price": 46, "purchaseAt": "1985-07-03T00:00:00Z", "trialPrice": 94}], "szbZxuHSgDOK8bjo": [{"currencyCode": "F7bL2635KbtZTGJp", "currencyNamespace": "qgl2IzNXGTuQPIDp", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1980-06-21T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1998-08-21T00:00:00Z", "expireAt": "1971-04-15T00:00:00Z", "price": 72, "purchaseAt": "1980-11-04T00:00:00Z", "trialPrice": 15}, {"currencyCode": "NNz6QIVC9Mfuc8VO", "currencyNamespace": "snmnlVljdWYmELe7", "currencyType": "VIRTUAL", "discountAmount": 32, "discountExpireAt": "1998-01-22T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1971-06-20T00:00:00Z", "expireAt": "1977-04-22T00:00:00Z", "price": 56, "purchaseAt": "1982-08-01T00:00:00Z", "trialPrice": 43}, {"currencyCode": "nYBTxaTIz0jcgDI8", "currencyNamespace": "Pkz96vd80msqIm5b", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1973-11-25T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1994-08-10T00:00:00Z", "expireAt": "1985-05-11T00:00:00Z", "price": 60, "purchaseAt": "1980-05-09T00:00:00Z", "trialPrice": 14}]}, "saleConfig": {"currencyCode": "LeqhwVhjnnjKMEmt", "price": 2}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "sAQHbMrKYi0Zxs5S", "stackable": false, "status": "INACTIVE", "tags": ["4f15NohXu6opxQGR", "pFJUAJsyAfeKOufV", "HtADUQ9zimQTQT95"], "targetCurrencyCode": "t6PqlkL0diRhLC10", "targetNamespace": "ih2EQfY3XCv4hdOa", "thumbnailUrl": "6FdZhNMd1onFjGRb", "useCount": 48}' \
    > test.out 2>&1
eval_tap $? 107 'CreateItem' test.out

#- 108 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'UBRmMhAbUWmFhdYL' \
    --appId 'WzMuv3zkUY0n0BAZ' \
    > test.out 2>&1
eval_tap $? 108 'GetItemByAppId' test.out

#- 109 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DLC' \
    --availableDate '3IFbRkPSSITz4TjC' \
    --baseAppId 'rJHXGXku2YVuOzhx' \
    --categoryPath 'HmnrrV9ZGWrZ05sx' \
    --features 'e6A6RpmKDebNkylb' \
    --includeSubCategoryItem  \
    --itemType 'LOOTBOX' \
    --limit '5' \
    --offset '27' \
    --region 'NmzwOZOK56sDkci5' \
    --sortBy 'name:asc,createdAt:asc,updatedAt' \
    --storeId 'iMlOuksQJCiRFiZW' \
    --tags 'wJ7NrTb1XTB9YQzU' \
    --targetNamespace 'J9XlYJ8BzP6EUmUX' \
    > test.out 2>&1
eval_tap $? 109 'QueryItems' test.out

#- 110 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'GM5anIloyj9lhbvu,QdW2jwKUckc794ry,Y91lX8DD4MYXlrJ8' \
    > test.out 2>&1
eval_tap $? 110 'ListBasicItemsByFeatures' test.out

#- 111 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '1lHvv9rqvEoM8YmV' \
    --itemIds 'jAkO3HKsEp6KlqwW' \
    > test.out 2>&1
eval_tap $? 111 'GetItems' test.out

#- 112 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '4djrexcbHdEtoQvp' \
    --sku 'V344RctmTozCi8He' \
    > test.out 2>&1
eval_tap $? 112 'GetItemBySku' test.out

#- 113 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'V6jbalHmqBBfi7sS' \
    --populateBundle  \
    --region 'F5BoGiTCVsXsygWb' \
    --storeId 'jE2opXtdsJQeJ1to' \
    --sku 'o0qvxphTLEEBGTtZ' \
    > test.out 2>&1
eval_tap $? 113 'GetLocaleItemBySku' test.out

#- 114 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'yTjdKNKgYazujsmS' \
    --region 'mylT1YtxIq73aMb4' \
    --storeId '8jISd97KORRhxSWL' \
    --itemIds 'WLNfHRD3V15QaGGL' \
    --userId '46LuxJF3sbeqWBdQ' \
    > test.out 2>&1
eval_tap $? 114 'GetEstimatedPrice' test.out

#- 115 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'uWfgBAKx27MSBqab' \
    --sku 'UXOGkkoMUZn1YXj5' \
    > test.out 2>&1
eval_tap $? 115 'GetItemIdBySku' test.out

#- 116 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'zFZeOCOR9NvBQZSJ,POIKrRBrYVzi9ui3,lvozTt9TsH7A0TuU' \
    --storeId '2aL4bPkk11sys6Gd' \
    > test.out 2>&1
eval_tap $? 116 'GetBulkItemIdBySkus' test.out

#- 117 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'kDcos5uVJ0BJfZ0j' \
    --region 'vA54CSqZFDsO1skR' \
    --storeId 'jOU1SMfQVQa6blj9' \
    --itemIds 'Rdd85bdYUumPKVSZ' \
    > test.out 2>&1
eval_tap $? 117 'BulkGetLocaleItems' test.out

#- 118 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'GetAvailablePredicateTypes' test.out

#- 119 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'Cg3XTc9vQe0dHJfF' \
    --userId '6KIuvnRCa9JktyBd' \
    --body '{"itemIds": ["xkZKrEWFw9GYxjii", "OQAD77ci0vfWVZoR", "RMPi57HyKKz5nyI6"]}' \
    > test.out 2>&1
eval_tap $? 119 'ValidateItemPurchaseCondition' test.out

#- 120 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ulKNKoXa0dgx1Jgj' \
    --body '{"changes": [{"itemIdentities": ["C56pda3YhtQxpCYM", "E6x21pdX2QSPAd9s", "xoLnWGP1PafIjLX8"], "itemIdentityType": "ITEM_ID", "regionData": {"vHuYrGWDK41uMOC0": [{"currencyCode": "mRvSoaGk4ktF5wnJ", "currencyNamespace": "Dg9Q3WXiydCOInVo", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1980-11-03T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1976-08-24T00:00:00Z", "discountedPrice": 96, "expireAt": "1988-04-11T00:00:00Z", "price": 18, "purchaseAt": "1975-01-06T00:00:00Z", "trialPrice": 68}, {"currencyCode": "63vLwtYEJTSiXjcY", "currencyNamespace": "5ZPkv90lyKSTWLxS", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1997-07-06T00:00:00Z", "discountPercentage": 76, "discountPurchaseAt": "1975-05-11T00:00:00Z", "discountedPrice": 41, "expireAt": "1976-05-11T00:00:00Z", "price": 62, "purchaseAt": "1975-03-16T00:00:00Z", "trialPrice": 60}, {"currencyCode": "RCn48bvkCPfKofwX", "currencyNamespace": "OIZZQAJza84lKKmV", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1994-06-11T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1972-07-13T00:00:00Z", "discountedPrice": 40, "expireAt": "1985-01-12T00:00:00Z", "price": 20, "purchaseAt": "1991-04-10T00:00:00Z", "trialPrice": 36}], "xEf4XvVhFJTxFHIT": [{"currencyCode": "Bg9x4unq3eOMHIKe", "currencyNamespace": "TyBG5dCUoExnKfV3", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1998-10-09T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1991-03-07T00:00:00Z", "discountedPrice": 76, "expireAt": "1995-07-01T00:00:00Z", "price": 82, "purchaseAt": "1996-01-20T00:00:00Z", "trialPrice": 78}, {"currencyCode": "hH4GVU7Exlkmc4xY", "currencyNamespace": "iLjLyZrXr9Bhtzn8", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1984-04-20T00:00:00Z", "discountPercentage": 6, "discountPurchaseAt": "1995-05-07T00:00:00Z", "discountedPrice": 28, "expireAt": "1980-07-20T00:00:00Z", "price": 48, "purchaseAt": "1986-08-10T00:00:00Z", "trialPrice": 9}, {"currencyCode": "hrciryLm67rkadH5", "currencyNamespace": "Y41SLjCPrFa05Xl5", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1987-04-25T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1991-02-19T00:00:00Z", "discountedPrice": 61, "expireAt": "1983-11-29T00:00:00Z", "price": 13, "purchaseAt": "1981-01-10T00:00:00Z", "trialPrice": 61}], "mm7jPdKLddfdsUqj": [{"currencyCode": "XVzW1QqxnWR5sheL", "currencyNamespace": "gsAF4ctv5guycGiq", "currencyType": "VIRTUAL", "discountAmount": 19, "discountExpireAt": "1993-12-07T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1983-07-21T00:00:00Z", "discountedPrice": 90, "expireAt": "1988-03-27T00:00:00Z", "price": 8, "purchaseAt": "1977-06-26T00:00:00Z", "trialPrice": 10}, {"currencyCode": "BVC5zgOKLTDmHe8c", "currencyNamespace": "1eJ9sde7Ryt4udIv", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1983-06-18T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1981-12-05T00:00:00Z", "discountedPrice": 49, "expireAt": "1996-10-27T00:00:00Z", "price": 47, "purchaseAt": "1992-08-13T00:00:00Z", "trialPrice": 56}, {"currencyCode": "omQFPFWy5cwNPI6a", "currencyNamespace": "Fo0MVwDZCIXFNEL3", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1995-12-07T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1979-12-26T00:00:00Z", "discountedPrice": 54, "expireAt": "1984-12-24T00:00:00Z", "price": 51, "purchaseAt": "1995-01-01T00:00:00Z", "trialPrice": 71}]}}, {"itemIdentities": ["bJM3bNLWHAbCZixe", "2cQ6O30lpzcBQMAE", "cNcJqrKxnMzSYoc4"], "itemIdentityType": "ITEM_SKU", "regionData": {"jiMY4H34B6wVd8ip": [{"currencyCode": "cKDwQeUWtjCC2UH6", "currencyNamespace": "jzMO3AfmOS5mQNyR", "currencyType": "VIRTUAL", "discountAmount": 41, "discountExpireAt": "1987-12-03T00:00:00Z", "discountPercentage": 80, "discountPurchaseAt": "1992-07-07T00:00:00Z", "discountedPrice": 45, "expireAt": "1977-10-30T00:00:00Z", "price": 53, "purchaseAt": "1994-11-12T00:00:00Z", "trialPrice": 96}, {"currencyCode": "OLKmZhCZxxPPdPwO", "currencyNamespace": "tEuWBSO2jJepUnEE", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1976-09-07T00:00:00Z", "discountPercentage": 0, "discountPurchaseAt": "1986-04-26T00:00:00Z", "discountedPrice": 25, "expireAt": "1998-10-10T00:00:00Z", "price": 61, "purchaseAt": "1983-05-13T00:00:00Z", "trialPrice": 22}, {"currencyCode": "5E5HleLoog4me2NB", "currencyNamespace": "Fp62xlXvVcJerTPW", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1992-05-08T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1973-06-06T00:00:00Z", "discountedPrice": 69, "expireAt": "1993-03-03T00:00:00Z", "price": 61, "purchaseAt": "1989-12-14T00:00:00Z", "trialPrice": 79}], "ArAxnKBfBfDlrQQu": [{"currencyCode": "Ac10DjjwMv4vrIPR", "currencyNamespace": "tvhQIyLarjaLOKnX", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1980-08-02T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1985-07-17T00:00:00Z", "discountedPrice": 22, "expireAt": "1992-12-25T00:00:00Z", "price": 0, "purchaseAt": "1999-06-12T00:00:00Z", "trialPrice": 77}, {"currencyCode": "NGKhaLlJzJMSnJII", "currencyNamespace": "gsAVmaGYxUX1B9oV", "currencyType": "VIRTUAL", "discountAmount": 76, "discountExpireAt": "1984-08-30T00:00:00Z", "discountPercentage": 67, "discountPurchaseAt": "1993-07-27T00:00:00Z", "discountedPrice": 59, "expireAt": "1972-04-24T00:00:00Z", "price": 34, "purchaseAt": "1996-01-19T00:00:00Z", "trialPrice": 2}, {"currencyCode": "BF2g7TVtzYEHUodh", "currencyNamespace": "3iUfBthbepUCTWiZ", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1979-10-11T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1990-12-16T00:00:00Z", "discountedPrice": 66, "expireAt": "1979-08-03T00:00:00Z", "price": 41, "purchaseAt": "1975-08-10T00:00:00Z", "trialPrice": 42}], "FEIu44u83ZLRxYlY": [{"currencyCode": "qlpq03BGdIk4oEog", "currencyNamespace": "FVGR71rJOBy6lsj1", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1990-07-03T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1984-08-17T00:00:00Z", "discountedPrice": 4, "expireAt": "1976-04-20T00:00:00Z", "price": 39, "purchaseAt": "1988-07-27T00:00:00Z", "trialPrice": 25}, {"currencyCode": "tx3VAl6tXFbnATCz", "currencyNamespace": "UOIzVcy9k3ie64Vn", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1971-05-26T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1984-12-31T00:00:00Z", "discountedPrice": 24, "expireAt": "1987-06-21T00:00:00Z", "price": 87, "purchaseAt": "1989-12-04T00:00:00Z", "trialPrice": 42}, {"currencyCode": "5Cj8hgFsqHC9h5JP", "currencyNamespace": "iMEtgKuiGTYgwWv5", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1972-01-08T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1975-05-07T00:00:00Z", "discountedPrice": 35, "expireAt": "1982-11-30T00:00:00Z", "price": 69, "purchaseAt": "1995-10-10T00:00:00Z", "trialPrice": 66}]}}, {"itemIdentities": ["TGeHTnqRbzBB9ZFg", "JbQ3Fj1umx4ItzkM", "J7cudf4r916GPrhn"], "itemIdentityType": "ITEM_ID", "regionData": {"OJPS3lJ80YJ41U4o": [{"currencyCode": "oQ980ywmg1pWpWit", "currencyNamespace": "1QC7FKe0fnHUlmU1", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1989-09-19T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1989-07-27T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-06-06T00:00:00Z", "price": 46, "purchaseAt": "1974-07-01T00:00:00Z", "trialPrice": 11}, {"currencyCode": "TX2bamSCvX1nwvSW", "currencyNamespace": "dDwD7WJHzgNZUKsI", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1981-10-28T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1985-12-23T00:00:00Z", "discountedPrice": 46, "expireAt": "1999-08-13T00:00:00Z", "price": 53, "purchaseAt": "1972-11-16T00:00:00Z", "trialPrice": 60}, {"currencyCode": "yTsftKqnsIJctAdx", "currencyNamespace": "yZVKHA9DkaSOWgtg", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1989-07-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1994-03-28T00:00:00Z", "discountedPrice": 24, "expireAt": "1988-09-03T00:00:00Z", "price": 33, "purchaseAt": "1971-10-19T00:00:00Z", "trialPrice": 97}], "qzoKMRMG541PAiNj": [{"currencyCode": "ULsx4SnKNXLMUaDS", "currencyNamespace": "wwQlnNRZJHBSB4fZ", "currencyType": "VIRTUAL", "discountAmount": 62, "discountExpireAt": "1987-03-25T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1995-06-10T00:00:00Z", "discountedPrice": 38, "expireAt": "1999-09-10T00:00:00Z", "price": 10, "purchaseAt": "1977-03-17T00:00:00Z", "trialPrice": 21}, {"currencyCode": "8YRvae4f4lhBPbar", "currencyNamespace": "bWEm8bVtZcfVCPdQ", "currencyType": "REAL", "discountAmount": 10, "discountExpireAt": "1975-04-12T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1992-06-23T00:00:00Z", "discountedPrice": 74, "expireAt": "1981-02-24T00:00:00Z", "price": 54, "purchaseAt": "1974-09-20T00:00:00Z", "trialPrice": 60}, {"currencyCode": "TVYelIlGJg9wdc8b", "currencyNamespace": "ihhWjfZpfcFBUsnn", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1989-04-04T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1977-08-30T00:00:00Z", "discountedPrice": 37, "expireAt": "1998-01-22T00:00:00Z", "price": 16, "purchaseAt": "1988-09-08T00:00:00Z", "trialPrice": 29}], "RIJz1eI7Q5pu9Put": [{"currencyCode": "Lf6IrvZoBGQbO4S3", "currencyNamespace": "rURGWUzPAE6SdV4D", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1973-04-29T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1987-12-21T00:00:00Z", "discountedPrice": 23, "expireAt": "1987-10-05T00:00:00Z", "price": 36, "purchaseAt": "1999-06-17T00:00:00Z", "trialPrice": 26}, {"currencyCode": "yyqRzc20O7FdsJP1", "currencyNamespace": "G9tyBTfERXdvgD1Q", "currencyType": "REAL", "discountAmount": 78, "discountExpireAt": "1985-11-28T00:00:00Z", "discountPercentage": 10, "discountPurchaseAt": "1981-08-18T00:00:00Z", "discountedPrice": 17, "expireAt": "1986-01-29T00:00:00Z", "price": 21, "purchaseAt": "1996-03-18T00:00:00Z", "trialPrice": 40}, {"currencyCode": "uGgx8ncXejmeZtzT", "currencyNamespace": "0qj0ltsqfiZrthVv", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1996-08-18T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1991-08-23T00:00:00Z", "discountedPrice": 75, "expireAt": "1982-08-30T00:00:00Z", "price": 81, "purchaseAt": "1989-11-30T00:00:00Z", "trialPrice": 62}]}}]}' \
    > test.out 2>&1
eval_tap $? 120 'BulkUpdateRegionData' test.out

#- 121 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'CODE' \
    --limit '74' \
    --offset '89' \
    --sortBy 'YssVejcL3kR3hCGN' \
    --storeId 'gaJmuALlMQl9RLrt' \
    --keyword 'hbfp0VgweLlT2sY3' \
    --language 'SsTnDQY7kKU2u06Q' \
    > test.out 2>&1
eval_tap $? 121 'SearchItems' test.out

#- 122 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '81' \
    --offset '43' \
    --sortBy 'name:asc,createdAt:desc' \
    --storeId '3zDuqVlVTypcYPK8' \
    > test.out 2>&1
eval_tap $? 122 'QueryUncategorizedItems' test.out

#- 123 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'IxrSZuxWl0Je4fJI' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yFAm3DQht4JwnPS2' \
    > test.out 2>&1
eval_tap $? 123 'GetItem' test.out

#- 124 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'urJqerobWMZGVL5K' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LTxahWlS6XdBaKSL' \
    --body '{"appId": "CgOOPXM6XTUh2dJ9", "appType": "SOFTWARE", "baseAppId": "Vw13NCo9yXlbQ52F", "boothName": "THTCj6SEAzT7TOpy", "categoryPath": "iuvvQUm29Iacq4XR", "clazz": "LaA643nTMtXSAyej", "displayOrder": 27, "entitlementType": "CONSUMABLE", "ext": {"hGspRi3bhPQvBBJI": {}, "5JxytpcubN4AUUPF": {}, "PscZsXeJOD4DMtqf": {}}, "features": ["UQ2fg3V1o2x0hL5D", "IGiGJovgWSRxZ8N4", "uBDqMyIAzWze94ME"], "flexible": false, "images": [{"as": "BQ1crBXAupATO8uX", "caption": "sqVpdiWo8SjDAM0R", "height": 16, "imageUrl": "JRtozI0jpliCFQ6W", "smallImageUrl": "gJpGPigdc5VyC4qv", "width": 99}, {"as": "SV9E9yyNb7yaLXzA", "caption": "VYymOuhCkZu4htrs", "height": 11, "imageUrl": "NFRJIhFXR2dYprPm", "smallImageUrl": "bpuptECGd5cdXC2S", "width": 8}, {"as": "MvpqM8puggOEdG47", "caption": "gD5i2Ni6AnWn3NdE", "height": 86, "imageUrl": "YPonb59gQffkNOmu", "smallImageUrl": "bxEJr2qEAuJbpZSr", "width": 5}], "inventoryConfig": {"customAttributes": {"gqDY6jwyKRxhkLe5": {}, "zohg9s9utRQt28b6": {}, "o3K0COF74tz6aeXZ": {}}, "serverCustomAttributes": {"OYwbwjMNdxKWlBfn": {}, "RyFS0Ed7gTM5AVrt": {}, "BQiDTcNnZa6Zuxk6": {}}, "slotUsed": 42}, "itemIds": ["1Kb4UTPWDXTSb55g", "8LSTs7Nf95lGlPrf", "6obIdnI6Ag7eUYcY"], "itemQty": {"J4QzXCmqr6gmPGaH": 85, "Q4GvLtz50D3rpBfB": 29, "Lx8eq8SGNwEQO8dY": 43}, "itemType": "LOOTBOX", "listable": true, "localizations": {"GhaBKoUfiHjGmCyP": {"description": "sKCJTv1ic9gvagF2", "localExt": {"cSuztsJ5tj64gV7n": {}, "mDk29mcjSuz9vbNS": {}, "tqPtQmQN6eKAGiZF": {}}, "longDescription": "CftT0RWECdjWYrnu", "title": "lxcCKAru8pOaAVLD"}, "B4k3JwkdaxR7GJpY": {"description": "muYCPG181q9GA5Dy", "localExt": {"dC2D8UT6KOc4VPDU": {}, "R9ayazqXRqegIUic": {}, "YXXzxsBFrUs9BYp6": {}}, "longDescription": "TgCejBd5o7iTST7R", "title": "3KbbQGERMNpqWb51"}, "y5RUzvMfTkPy0fGv": {"description": "TGgfLKsg0b1Bq78c", "localExt": {"E5O5pmPnbiPJ9j4v": {}, "xmbH3rVaauufxkPH": {}, "Elug48TgfNu0rqXU": {}}, "longDescription": "OyToLPIREGIKlJt3", "title": "EP9kKwkENQ8VOHGw"}}, "lootBoxConfig": {"rewardCount": 2, "rewards": [{"lootBoxItems": [{"count": 5, "duration": 55, "endDate": "1999-08-25T00:00:00Z", "itemId": "P8Gwjg3IOH0SDHgY", "itemSku": "KqxJiFJdrmj5vhzg", "itemType": "sJwex7wq8ZPlXNaU"}, {"count": 81, "duration": 73, "endDate": "1974-07-18T00:00:00Z", "itemId": "dY2vfJuje5cPnmGj", "itemSku": "TvYa5Pqx1K7qcAoi", "itemType": "jBPAp6EPb988Nzxr"}, {"count": 61, "duration": 40, "endDate": "1990-06-01T00:00:00Z", "itemId": "VpULjjiw3NeVG4DJ", "itemSku": "i9DaMrc0WFgKjE94", "itemType": "5x2CPVYYG9WvoGmA"}], "name": "mvaVV5YfxnUNcwjr", "odds": 0.9654101627538015, "type": "PROBABILITY_GROUP", "weight": 60}, {"lootBoxItems": [{"count": 90, "duration": 45, "endDate": "1987-02-28T00:00:00Z", "itemId": "hnfuF4WZiQVICVpW", "itemSku": "d3UM08gMXhdf3juX", "itemType": "W4JprIb3CJCAtvSG"}, {"count": 12, "duration": 59, "endDate": "1973-04-25T00:00:00Z", "itemId": "a9dzOJDGCTHIOFje", "itemSku": "XbsSgR43kIDzxBwq", "itemType": "RJTzrHNZWUsq5lQo"}, {"count": 9, "duration": 20, "endDate": "1985-07-22T00:00:00Z", "itemId": "UYG9ccTt7Wxw8OQ1", "itemSku": "3t3uTw6zQuoZcXQp", "itemType": "oTOxe8y1jorNsg9Z"}], "name": "KYCKoISyXtHzoWGd", "odds": 0.8154594518640319, "type": "PROBABILITY_GROUP", "weight": 14}, {"lootBoxItems": [{"count": 0, "duration": 49, "endDate": "1985-11-12T00:00:00Z", "itemId": "DHN9mVug2zkVf6Kg", "itemSku": "pKOcn3tMD9UT67bO", "itemType": "wugFDa6wUQvehKqw"}, {"count": 58, "duration": 56, "endDate": "1975-07-02T00:00:00Z", "itemId": "86XmRkCEcfHDCdl5", "itemSku": "9Wp9A3tXGve6DdK6", "itemType": "uvg8f2cIoByk9fxt"}, {"count": 44, "duration": 96, "endDate": "1980-01-20T00:00:00Z", "itemId": "geAxo57nKAbZpsbJ", "itemSku": "4Iu5KJ0ynxGBlacD", "itemType": "CdFe8ATUqVxcSthr"}], "name": "pnMUBsnUfuQIcSbU", "odds": 0.3173509429006035, "type": "REWARD_GROUP", "weight": 95}], "rollFunction": "CUSTOM"}, "maxCount": 67, "maxCountPerUser": 45, "name": "kInFGpuUsdtq4dOw", "optionBoxConfig": {"boxItems": [{"count": 80, "duration": 53, "endDate": "1986-05-20T00:00:00Z", "itemId": "SzCEW9dUVhZjLftC", "itemSku": "3sCS8CpLCqPD9CeD", "itemType": "EdCnnL6Kt1Bjj3b8"}, {"count": 87, "duration": 1, "endDate": "1990-05-07T00:00:00Z", "itemId": "8Rr45ULqXQgvwD3P", "itemSku": "sKDJiWxQBwaS7rDB", "itemType": "f2S54phbdyGDt47f"}, {"count": 78, "duration": 68, "endDate": "1984-05-15T00:00:00Z", "itemId": "RlE9hqz6rjDNo4rh", "itemSku": "jxUdMM83WekqfWv0", "itemType": "4vvn9bk5qr8qs2mq"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 42, "fixedTrialCycles": 68, "graceDays": 42}, "regionData": {"AqXUjNypF6MMqWpd": [{"currencyCode": "EJsPoaIbYz8cK5jl", "currencyNamespace": "pJdre5ur6yvWJDdv", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1994-08-12T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1986-03-02T00:00:00Z", "expireAt": "1999-07-18T00:00:00Z", "price": 44, "purchaseAt": "1997-01-02T00:00:00Z", "trialPrice": 24}, {"currencyCode": "5aSJVDginxAM77eY", "currencyNamespace": "9C14FbfiI2NPvl1k", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1997-09-28T00:00:00Z", "discountPercentage": 2, "discountPurchaseAt": "1980-09-06T00:00:00Z", "expireAt": "1989-04-24T00:00:00Z", "price": 21, "purchaseAt": "1983-08-26T00:00:00Z", "trialPrice": 52}, {"currencyCode": "xkWZbjf7GZxaossQ", "currencyNamespace": "mjo69wohJFyTNk5F", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1993-11-16T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1988-09-01T00:00:00Z", "expireAt": "1984-03-18T00:00:00Z", "price": 43, "purchaseAt": "1977-07-31T00:00:00Z", "trialPrice": 37}], "3EjFR7996Ug5m4ax": [{"currencyCode": "DV5uTcYsoahUrELQ", "currencyNamespace": "1btjJOqQMgZWAU6E", "currencyType": "VIRTUAL", "discountAmount": 98, "discountExpireAt": "1977-08-09T00:00:00Z", "discountPercentage": 68, "discountPurchaseAt": "1994-10-17T00:00:00Z", "expireAt": "1984-10-05T00:00:00Z", "price": 43, "purchaseAt": "1998-06-30T00:00:00Z", "trialPrice": 23}, {"currencyCode": "7tnYtGfv0EJyjBu4", "currencyNamespace": "EzwRjD7jmQJeFPgh", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1973-04-18T00:00:00Z", "discountPercentage": 91, "discountPurchaseAt": "1979-01-20T00:00:00Z", "expireAt": "1980-10-28T00:00:00Z", "price": 50, "purchaseAt": "1974-07-26T00:00:00Z", "trialPrice": 58}, {"currencyCode": "48eT7Mluexk87b9Z", "currencyNamespace": "5BTsEA3EdmW8saab", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1983-05-02T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1978-05-02T00:00:00Z", "expireAt": "1983-07-04T00:00:00Z", "price": 47, "purchaseAt": "1973-12-31T00:00:00Z", "trialPrice": 80}], "luBtRFPKThyGnbjm": [{"currencyCode": "PDKFS6u9FHuv1M3q", "currencyNamespace": "fch4SqIV6LQPHlae", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1978-01-17T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1980-09-16T00:00:00Z", "expireAt": "1985-05-12T00:00:00Z", "price": 11, "purchaseAt": "1993-06-28T00:00:00Z", "trialPrice": 5}, {"currencyCode": "tyl1HeT7VEPgG40Q", "currencyNamespace": "yXzsOzgck078Igho", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1978-06-14T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1977-09-01T00:00:00Z", "expireAt": "1996-08-03T00:00:00Z", "price": 83, "purchaseAt": "1985-03-21T00:00:00Z", "trialPrice": 98}, {"currencyCode": "sczxBS0OBCa2vWad", "currencyNamespace": "LmQtYKmEMzicbuL2", "currencyType": "REAL", "discountAmount": 42, "discountExpireAt": "1993-05-03T00:00:00Z", "discountPercentage": 18, "discountPurchaseAt": "1982-08-29T00:00:00Z", "expireAt": "1972-11-28T00:00:00Z", "price": 78, "purchaseAt": "1999-06-11T00:00:00Z", "trialPrice": 59}]}, "saleConfig": {"currencyCode": "NbcIDcIyvZbOy1T4", "price": 14}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "2PofaJoSqtrEOqxH", "stackable": false, "status": "ACTIVE", "tags": ["VuNZ9LzNeJnBurh5", "SZoDdT0fefo74eg3", "Nt2c0r4GqF0NHglO"], "targetCurrencyCode": "4CWbYb0Pebyt8b4D", "targetNamespace": "GscjwrizsFUgYwba", "thumbnailUrl": "LvqvQ2NbmDITuymT", "useCount": 56}' \
    > test.out 2>&1
eval_tap $? 124 'UpdateItem' test.out

#- 125 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'W6JBcGp9Rx2RfcRh' \
    --namespace "$AB_NAMESPACE" \
    --force  \
    --storeId 'XpmeeHdvphas9S7i' \
    > test.out 2>&1
eval_tap $? 125 'DeleteItem' test.out

#- 126 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'vHEoLbUMM47f1Ure' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 95, "orderNo": "7Ivjj1A647XQ3koa"}' \
    > test.out 2>&1
eval_tap $? 126 'AcquireItem' test.out

#- 127 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'AfZIim0sFPm1YN27' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'bojDVaZLpx4kEWYk' \
    > test.out 2>&1
eval_tap $? 127 'GetApp' test.out

#- 128 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'O6KrKUMhJrASBh61' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'hmWKSSrF35anDGvu' \
    --body '{"carousel": [{"alt": "r19V18oIrUKXttgA", "previewUrl": "I2QdWJFLmoPEgd8E", "thumbnailUrl": "MspOs8nkic9gj5vy", "type": "video", "url": "MAAmIHYbsxG5N066", "videoSource": "youtube"}, {"alt": "OU2V9yw94oa8UJ34", "previewUrl": "TIedV3HyoX4VnO2L", "thumbnailUrl": "pBU08wfnlHBXFIqF", "type": "image", "url": "Hak1MXxj7Esrg790", "videoSource": "youtube"}, {"alt": "nml5BidsK9dCEzhV", "previewUrl": "nOv0PQbVIaKiHfoe", "thumbnailUrl": "orY7A1otGFyv2SMj", "type": "image", "url": "7jK5pxe82pgFiAS6", "videoSource": "generic"}], "developer": "KxbS7Q2OgRucL1jw", "forumUrl": "RXzfjDZZBmOau6sy", "genres": ["FreeToPlay", "Racing", "Adventure"], "localizations": {"tccv9Gv4tOcbnuCq": {"announcement": "f0lm6WBkIzjoSV31", "slogan": "tvmMB6jzrpRGESmo"}, "oHiCV4GUOnXpapXQ": {"announcement": "GRakUbcG7PcR4eiU", "slogan": "3Idi55jNrGNT2VHT"}, "KuIT5FwwHj0Ur5F2": {"announcement": "PWGTTD81xhNP4t6k", "slogan": "YBUjyXAn3bWQF6Qc"}}, "platformRequirements": {"AiJpXIrgroixptZh": [{"additionals": "ckUTGkcBOE4qMcH1", "directXVersion": "Kyi8ZFvGcV8DY0XO", "diskSpace": "kDstxZcY1HgAnZV4", "graphics": "IOglVLqb9lGAJUg2", "label": "1Lt7JwgwMUSuC3Ba", "osVersion": "jy3BcEMCtQs2FcEc", "processor": "vVAyId6Cp85HVDsZ", "ram": "BQgOnXuXsGThYZrm", "soundCard": "m0wrFMnPpWgrQD4h"}, {"additionals": "Ek0OLjYsnignE7Kc", "directXVersion": "MF7fuDbzRRYMNXWU", "diskSpace": "sp1tOibJY9aL9ie6", "graphics": "vvMbiNURrlm88QlK", "label": "yuoya4JgakZyUV7t", "osVersion": "73VnSFbuxd4KYZ0j", "processor": "k0UZdhtnKu9oTc8p", "ram": "VkiyGsj5JdXzRxfN", "soundCard": "EjUMTs8WIObJBTsv"}, {"additionals": "sw76uISRX0bKVoWt", "directXVersion": "oUW1P7ocuBAldDSU", "diskSpace": "S7Haa6unq1yQOSRv", "graphics": "yiLBRVtIDi2piIQF", "label": "VmzMidw70KSahpYZ", "osVersion": "dKZRyR9AX7JjxvNZ", "processor": "hM84DiZk6ySrB9SV", "ram": "FctW7YS0OkL78XeE", "soundCard": "AtALFI3v8yha4pd5"}], "A7MYcpBD6lKNb8Rx": [{"additionals": "vN2u5J7baOeLH19f", "directXVersion": "qBwNbNe1ffYRtIvQ", "diskSpace": "aKyevWYtZjK6J29v", "graphics": "8MpBSpo3AKRmnJkz", "label": "JHAckUyBksYQfDm0", "osVersion": "RNFwiz70tRVLMlHi", "processor": "8i9gOVqajUWrgEsW", "ram": "DtaKzn8dZwnnGeZs", "soundCard": "ZVgbPzPFbrOMZMgW"}, {"additionals": "kFN7Tpkx6GcfyOg6", "directXVersion": "ZUrrp9ubg9mndW2J", "diskSpace": "KmQafUs2bxYztOEy", "graphics": "VbKIf1ZbzgUwd8DH", "label": "oCQykmXHYmkRlg7g", "osVersion": "Ys6unPYQ9jNQN1di", "processor": "1ldhOh6HvjnYuV7N", "ram": "fC4A2ODiZhbfb8Qq", "soundCard": "CyK1XH9D6vl5eFdF"}, {"additionals": "fgK46GjCWaP8huTm", "directXVersion": "nq3FGQn3Ahu5wxq6", "diskSpace": "oJq4mChmQHQhO9IK", "graphics": "BXDFQfXFD58sG6uD", "label": "hFYlrzJBYSeMuJfQ", "osVersion": "ecutjS029BiJWOG1", "processor": "m7MKclr5igjNTVIt", "ram": "rH2X78hxJgaVfw5V", "soundCard": "nyq8OzTE89WDNoMc"}], "OmbfJrCJQIj1haAo": [{"additionals": "sKglqaCXE9ytpIO8", "directXVersion": "btO3OwNEGSW5TaW4", "diskSpace": "to7QCY2NGGvi9kg3", "graphics": "rMIzNmhJTNQjKlwj", "label": "fJ3TJ2xVpge70WsL", "osVersion": "fgbZieRvJI5sT9DH", "processor": "3DfLCv8q4Thmq09b", "ram": "BgPAYxrBE9jlnTgt", "soundCard": "gW33wDwD9RKvQX4y"}, {"additionals": "FQFdrRoM6FoqCYw7", "directXVersion": "AlxO6qdFpc71sSck", "diskSpace": "3ggZWJlSlCQMDji3", "graphics": "29PfVrvMEPtpsSNc", "label": "pK1QkB2Sy8Ww79LV", "osVersion": "eVskqeUB7RSayqGF", "processor": "guhh3bvadRthdbVA", "ram": "pebRA09rW8i8krFW", "soundCard": "Jhe03coRFok5d3Ay"}, {"additionals": "GrZO8GuoXNSoVEBG", "directXVersion": "7VbBPUWipz9C05Ya", "diskSpace": "bFX4FCK5ucTFsAFz", "graphics": "aO3yJpA3KMxBlrRy", "label": "tER1qdTelFAadM9y", "osVersion": "66Drf4SSGGt3MiBK", "processor": "ohow3kKoaP1K4CDu", "ram": "H1mMIfOCDyVAHrHn", "soundCard": "cR5dShqiBUI9esSs"}]}, "platforms": ["Linux", "Android", "Linux"], "players": ["Coop", "Multi", "Single"], "primaryGenre": "Racing", "publisher": "SomqWsGA76yxi0Qz", "releaseDate": "1997-05-30T00:00:00Z", "websiteUrl": "WfmP2sx0KO5bEJaP"}' \
    > test.out 2>&1
eval_tap $? 128 'UpdateApp' test.out

#- 129 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'nAFjsodyJQVVBrSh' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GbIIuqK8C403HgoX' \
    > test.out 2>&1
eval_tap $? 129 'DisableItem' test.out

#- 130 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'CR6XOMXwKdfqk8T4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'GetItemDynamicData' test.out

#- 131 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'QHK30EX0FclpDl5H' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'suracO5MnjnxD1OX' \
    > test.out 2>&1
eval_tap $? 131 'EnableItem' test.out

#- 132 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'kxShFVQTRekLfjmy' \
    --itemId '8zosRCRgVwbrQKmb' \
    --namespace "$AB_NAMESPACE" \
    --storeId '01yA7U7dGMjupZkZ' \
    > test.out 2>&1
eval_tap $? 132 'FeatureItem' test.out

#- 133 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'QY8CNyT4k3DIbfT2' \
    --itemId '2G5NpE130YWSgxpK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WtdtdtVW9anENmxb' \
    > test.out 2>&1
eval_tap $? 133 'DefeatureItem' test.out

#- 134 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '9e7vXZV3ig8Jg5VB' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'yeI3ycMcYYBixKJX' \
    --populateBundle  \
    --region 'CISQdwec1m8BusV9' \
    --storeId 'tUh74KVo6Xqjz2xU' \
    > test.out 2>&1
eval_tap $? 134 'GetLocaleItem' test.out

#- 135 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'KLNWSmYyVvyelIJ8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'QgaLMqi836ULa7cf' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 80, "code": "4VuY6rsZyo6CBRRn", "comparison": "isGreaterThan", "name": "ewIzTOqKkcjRh3l2", "predicateType": "EntitlementPredicate", "value": "m5TCAU1cKApdJDnE", "values": ["73GLmSZns5owBhoU", "XiXaBzsmaxjTZPlL", "g4LsGP6KLPXkvUv2"]}, {"anyOf": 16, "code": "boMkyB7FTexsOZ0b", "comparison": "isGreaterThan", "name": "OlRGdmXxETLEQrr3", "predicateType": "StatisticCodePredicate", "value": "Xit6boOLGCcg16Dq", "values": ["TTLS2FgarY903ING", "IyEfRBEj7qms9AGQ", "wdQPQ9HkSSV8e1Mg"]}, {"anyOf": 63, "code": "HumyfuBNisecYbcO", "comparison": "isGreaterThanOrEqual", "name": "JfuBs1Vpqn47GVgh", "predicateType": "StatisticCodePredicate", "value": "H2wToOnq9U5lyW89", "values": ["Xwt3wmRTrDCjhnKv", "lWq6tEeUmU96FLEa", "sHezWTqgYPixtHk6"]}]}, {"operator": "and", "predicates": [{"anyOf": 96, "code": "0mJqjRYldcTpdeCD", "comparison": "isLessThan", "name": "XPRi4bAQL7VE2wL8", "predicateType": "SeasonTierPredicate", "value": "4JFVUdzA8bvXlDhG", "values": ["ztrr09CDA8Ij5bGK", "7BrorbKIKuOXJPm5", "SuopWQbaCvdPSq8Z"]}, {"anyOf": 28, "code": "7GpvHCDx55JZ5z6g", "comparison": "isLessThan", "name": "17QPkJHRhmLKQuQV", "predicateType": "StatisticCodePredicate", "value": "SKiXl8G2uf6E8Eaj", "values": ["XLSAS8MKMaxQ1QyJ", "Xu1bqI2M5PmXfKnQ", "CpKedhuzI7G9NCKK"]}, {"anyOf": 57, "code": "rjnkH4ExObppC6CM", "comparison": "includes", "name": "Dm5ge659UDEOF6gp", "predicateType": "StatisticCodePredicate", "value": "UfmjtiVbqJnZcrqr", "values": ["n59tEGm9NYeUT5P0", "Hm9N6owMHMtJy1Oq", "Pye7fCwi7Il2wIFl"]}]}, {"operator": "and", "predicates": [{"anyOf": 59, "code": "x8TqSZdZ5C8mFI9T", "comparison": "isGreaterThan", "name": "vYiCBuzUUwyI6Vtd", "predicateType": "StatisticCodePredicate", "value": "v9k4fv3kMiuQ3Dhs", "values": ["KLxjt5srPFxBgpFt", "oBAhAlJGI2YYb6aj", "DBmTLH9kP9U53z6j"]}, {"anyOf": 56, "code": "zAzPkt1efGJeJaxy", "comparison": "isGreaterThanOrEqual", "name": "YutgXucx85vHA009", "predicateType": "StatisticCodePredicate", "value": "xvF2uLXWilRD7HD6", "values": ["LCgdFxRGj00RT6Lv", "gkfTMRrXVRcAVRDX", "cnGMJbJIYLssMvy9"]}, {"anyOf": 5, "code": "gmDfNfPGYYSTunMg", "comparison": "isLessThan", "name": "FLxIwKssw647YwDu", "predicateType": "EntitlementPredicate", "value": "HWJw9zIWsiP2JQ24", "values": ["meDrwEuTyM2qohgl", "2ccp7R7OqPqIjS4i", "zO8AEl6A9sh2x2ur"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 135 'UpdateItemPurchaseCondition' test.out

#- 136 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '0N9ytb3c8pVZ8GlU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "8962e6gtn5pUARJM"}' \
    > test.out 2>&1
eval_tap $? 136 'ReturnItem' test.out

#- 137 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --name 'T8QwMNOAzXmyHEV4' \
    --offset '13' \
    --tag 'jooiDnc1NUb51lEg' \
    > test.out 2>&1
eval_tap $? 137 'QueryKeyGroups' test.out

#- 138 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "UwQ9tkWaMOH47CAT", "name": "7cBP0918JaEBQBP7", "status": "ACTIVE", "tags": ["6LUnBBR84iAO7sBQ", "t6YJ2tWwF7RnP1oK", "3c4RVfjB0zi3XrYZ"]}' \
    > test.out 2>&1
eval_tap $? 138 'CreateKeyGroup' test.out

#- 139 GetKeyGroupByBoothName
eval_tap 0 139 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 140 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'UiN24ol1qqbalgiz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetKeyGroup' test.out

#- 141 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'L97ycJV5YqE2myQz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "l7X9fHr6WvBxmBvN", "name": "j3ktaDf9B22HGgxa", "status": "ACTIVE", "tags": ["xbCu1HFaj6Vxs3Gu", "A4S1dS7H7yIS7b5T", "SDRIoMg7Dc5APzfz"]}' \
    > test.out 2>&1
eval_tap $? 141 'UpdateKeyGroup' test.out

#- 142 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'XDELJFaIaEMW5bhJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetKeyGroupDynamic' test.out

#- 143 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'yL72WDyhBsCCbnfi' \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '77' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 143 'ListKeys' test.out

#- 144 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'sXHlm1RJTTy9JrNz' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 144 'UploadKeys' test.out

#- 145 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '1K5M1qgFddYvifGH' \
    --limit '2' \
    --offset '65' \
    --orderNos 'wNx6yhniEHLbEQKc,0aUvrKXDIjYC4df9,qswSlpCI8DhjlxUy' \
    --sortBy 'rs3OSesE5p0DwUj2' \
    --startTime 'HKUvPYUcQBxMSdOO' \
    --status 'DELETED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 145 'QueryOrders' test.out

#- 146 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 146 'GetOrderStatistics' test.out

#- 147 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'vdCk8so6JSaZAIad' \
    > test.out 2>&1
eval_tap $? 147 'GetOrder' test.out

#- 148 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'KDEZywonA2SrEdN2' \
    --body '{"description": "tmGuX6r0gBVUUeKK"}' \
    > test.out 2>&1
eval_tap $? 148 'RefundOrder' test.out

#- 149 GetPaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 149 'GetPaymentCallbackConfig' test.out

#- 150 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": false, "notifyUrl": "fBpWVxIK9D2bTcga", "privateKey": "KoccaSwWcZmzCWGI"}' \
    > test.out 2>&1
eval_tap $? 150 'UpdatePaymentCallbackConfig' test.out

#- 151 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetPaymentMerchantConfig' test.out

#- 152 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["1cIQcPWAShIhieSK", "Uf3zKbyQk2vQTYX1", "xsth28NZZgsXycuQ"]}' \
    > test.out 2>&1
eval_tap $? 152 'UpdatePaymentDomainWhitelistConfig' test.out

#- 153 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'NGIDeHlf6IcX1K9J' \
    --externalId 'rK6Or2xx7rLwrPoW' \
    --limit '16' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'ywnxuDLLuIaSxolo' \
    --offset '70' \
    --paymentOrderNo 'D2UqO0iAXA9dB4ib' \
    --startDate '8HDOJ8TNiP8KgEAj' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 153 'QueryPaymentNotifications' test.out

#- 154 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'bRTI0i6dO3zkbDse' \
    --limit '16' \
    --offset '78' \
    --status 'CHARGE_FAILED' \
    > test.out 2>&1
eval_tap $? 154 'QueryPaymentOrders' test.out

#- 155 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "xt6fX9j7rhZCAlDl", "currencyNamespace": "VKBsLZiBRXszE7CL", "customParameters": {"1cQCSoqHvH7g63cO": {}, "x6yrIw37pKOLrF5i": {}, "3gr3Cc4M2O7NrTQO": {}}, "description": "7KLdZDGwqx7T3l1u", "extOrderNo": "t2oyolliYsTJUmps", "extUserId": "cwLcUml3KuoMKh7t", "itemType": "COINS", "language": "SG_kB", "metadata": {"4xmIOjFLgKR4LjEW": "hOScvtQ92iD02YMv", "EUNfoL7JCcMo7Gxx": "XdbYCRexPekTsQxM", "TfaSot7aohFYy4Vx": "wHIJ9gzxqAw4vBGQ"}, "notifyUrl": "Aeh0VTiTP4PSrXUS", "omitNotification": true, "platform": "jYI9lsQFD43Df5qU", "price": 84, "recurringPaymentOrderNo": "ZkjsxYtgxplHTPLz", "region": "ynjFZgF3erw7UsyH", "returnUrl": "q4bBb0n1JhPUS8BR", "sandbox": false, "sku": "V9n769zLJdKMexeJ", "subscriptionId": "c7NvgTSgKjCxZjKf", "targetNamespace": "8NA4cGUaDfy9XnH2", "targetUserId": "r0EKrk5VlnKsWCPc", "title": "cAFn5CEPoH6opK5D"}' \
    > test.out 2>&1
eval_tap $? 155 'CreatePaymentOrderByDedicated' test.out

#- 156 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'SO8JyX4IE1z3rDwZ' \
    > test.out 2>&1
eval_tap $? 156 'ListExtOrderNoByExtTxId' test.out

#- 157 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '1HKsOpyq8agQuz86' \
    > test.out 2>&1
eval_tap $? 157 'GetPaymentOrder' test.out

#- 158 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nc6jLF9DIW2ncJJK' \
    --body '{"extTxId": "pqmgvUTr8XAtpOqU", "paymentMethod": "QxzqJZiWi3KQffT5", "paymentProvider": "NEONPAY"}' \
    > test.out 2>&1
eval_tap $? 158 'ChargePaymentOrder' test.out

#- 159 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'bVpCgKvPXSDufmKh' \
    --body '{"description": "783cV54JsVBRB0rY"}' \
    > test.out 2>&1
eval_tap $? 159 'RefundPaymentOrderByDedicated' test.out

#- 160 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0xfWddACyHSmo4KX' \
    --body '{"amount": 69, "currencyCode": "TPO3K1k5ZM8btmGs", "notifyType": "CHARGE", "paymentProvider": "CHECKOUT", "salesTax": 80, "vat": 49}' \
    > test.out 2>&1
eval_tap $? 160 'SimulatePaymentOrderNotification' test.out

#- 161 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Xbpqxh76Af5JSwjw' \
    > test.out 2>&1
eval_tap $? 161 'GetPaymentOrderChargeStatus' test.out

#- 162 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel '2fE2g6jXV7oai2oD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "m9FaP0HJ98tE4Uyo", "serviceLabel": 88}' \
    > test.out 2>&1
eval_tap $? 162 'GetPsnEntitlementOwnership' test.out

#- 163 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'Te3nt7t9ztprSfW9' \
    --body '{"delegationToken": "OutADrNGBWSJ1zQK", "sandboxId": "xVmRTawjiZPMoZZc"}' \
    > test.out 2>&1
eval_tap $? 163 'GetXboxEntitlementOwnership' test.out

#- 164 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    > test.out 2>&1
eval_tap $? 164 'GetPlatformEntitlementConfig' test.out

#- 165 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Steam", "Steam", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePlatformEntitlementConfig' test.out

#- 166 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 166 'GetPlatformWalletConfig' test.out

#- 167 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Playstation' \
    --body '{"allowedBalanceOrigins": ["Xbox", "Playstation", "Twitch"]}' \
    > test.out 2>&1
eval_tap $? 167 'UpdatePlatformWalletConfig' test.out

#- 168 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 168 'ResetPlatformWalletConfig' test.out

#- 169 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 169 'GetRevocationConfig' test.out

#- 170 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "ALWAYS_REVOKE"}}' \
    > test.out 2>&1
eval_tap $? 170 'UpdateRevocationConfig' test.out

#- 171 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 171 'DeleteRevocationConfig' test.out

#- 172 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'usApPdJPn9eIdhIB' \
    --limit '44' \
    --offset '20' \
    --source 'DLC' \
    --startTime 'upABJ4RwH3EdKmYt' \
    --status 'FAIL' \
    --transactionId '7gIKBc7OYTylFRAJ' \
    --userId 'KySnC0cfPl3Z2zSB' \
    > test.out 2>&1
eval_tap $? 172 'QueryRevocationHistories' test.out

#- 173 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 173 'GetRevocationPluginConfig' test.out

#- 174 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "bs4PAV72u8AxE2IQ"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "y4kyqyKgrtEPdXXl"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 174 'UpdateRevocationPluginConfig' test.out

#- 175 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 175 'DeleteRevocationPluginConfig' test.out

#- 176 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 176 'UploadRevocationPluginConfigCert' test.out

#- 177 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "QxctuVaqPJGAHEZm", "eventTopic": "uQrZ8GaQ4OZ2nDod", "maxAwarded": 25, "maxAwardedPerUser": 86, "namespaceExpression": "4TNs8mAj6IKSYFdJ", "rewardCode": "wgZsRPOzwuDSdGl1", "rewardConditions": [{"condition": "A2vaNeDiSqTfmAVg", "conditionName": "50kOdJagEmTuaxlx", "eventName": "gywkbdOsyxX1tfW4", "rewardItems": [{"duration": 89, "endDate": "1986-04-23T00:00:00Z", "identityType": "ITEM_ID", "itemId": "YUT4jyCVJ0V8obTl", "quantity": 66, "sku": "Gd8m7Y3wiNloJfey"}, {"duration": 19, "endDate": "1988-12-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "L6SjljNPTXA3qbg5", "quantity": 49, "sku": "SyienCODZ0mnOpPT"}, {"duration": 97, "endDate": "1978-07-14T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "i99ctgFXasxp5h78", "quantity": 82, "sku": "ktjQw2yXzaQWaF2P"}]}, {"condition": "qUfbpMpRl6xRyV19", "conditionName": "cborUHeCpqnZ5NW6", "eventName": "23WWn2ZJY3QvRa7C", "rewardItems": [{"duration": 61, "endDate": "1985-12-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "csAHzD3dZyyWbUQp", "quantity": 3, "sku": "buWiiA4UTDgS2SVE"}, {"duration": 29, "endDate": "1989-04-14T00:00:00Z", "identityType": "ITEM_ID", "itemId": "80LLbku9GYH4ijqO", "quantity": 99, "sku": "NCrscDPbklTHcmgX"}, {"duration": 37, "endDate": "1980-06-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "CLup8pmEosOXglQw", "quantity": 45, "sku": "mCZUeelXYyNrXwei"}]}, {"condition": "CnDldRPRfd6mLZ0G", "conditionName": "TJwEjoZrRtaeWKMC", "eventName": "8wsOByQAMAgqFEzE", "rewardItems": [{"duration": 39, "endDate": "1990-06-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "ELCY2vIddlxnA1Vy", "quantity": 27, "sku": "UC2ecnpUDqvLQixP"}, {"duration": 76, "endDate": "1990-06-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "mWa8TGko16XTqHc0", "quantity": 4, "sku": "uukPE4JwQONQ2vCb"}, {"duration": 79, "endDate": "1974-04-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "0Oia336uiiMTAduc", "quantity": 40, "sku": "usO6EyVqstpgZpbz"}]}], "userIdExpression": "77y88rUFum2ZcA8i"}' \
    > test.out 2>&1
eval_tap $? 177 'CreateReward' test.out

#- 178 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'KcF0bkfjcTEFXcTw' \
    --limit '63' \
    --offset '40' \
    --sortBy 'rewardCode,namespace:asc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 178 'QueryRewards' test.out

#- 179 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 179 'ExportRewards' test.out

#- 180 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 180 'ImportRewards' test.out

#- 181 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'nbfM3J9G40Y62bCo' \
    > test.out 2>&1
eval_tap $? 181 'GetReward' test.out

#- 182 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '941ALznQuHVskfCj' \
    --body '{"description": "UK8GeX4Q0B2Cj0oO", "eventTopic": "mBmXu1KiTTiz7yrI", "maxAwarded": 43, "maxAwardedPerUser": 62, "namespaceExpression": "Qj2isN7bRwcr16lW", "rewardCode": "5YwgZpjlMMtPWg82", "rewardConditions": [{"condition": "17m7qNkQiKp2oac8", "conditionName": "QTNEuBbeuQqm9wM7", "eventName": "mgTtUdPVcQijMBhs", "rewardItems": [{"duration": 54, "endDate": "1976-09-03T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "P6d3nuUZ41mSeS9S", "quantity": 28, "sku": "PMGLdbYEknHPKrZ7"}, {"duration": 93, "endDate": "1974-03-08T00:00:00Z", "identityType": "ITEM_ID", "itemId": "BE0HRsE0GHDOFjrf", "quantity": 33, "sku": "YxH2Up9VthPjFrK7"}, {"duration": 69, "endDate": "1990-03-10T00:00:00Z", "identityType": "ITEM_ID", "itemId": "p0eONFDgUPShG8ww", "quantity": 64, "sku": "LsBKGsALPuCOyphU"}]}, {"condition": "UAV95708zaP0wpZg", "conditionName": "QEvFzox9wHocX3DR", "eventName": "WobEoGr8W97KBedc", "rewardItems": [{"duration": 36, "endDate": "1987-09-03T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cAFO5zEw8GENEJYP", "quantity": 75, "sku": "I2lTviKbOgVuN3nh"}, {"duration": 22, "endDate": "1988-04-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "j4P2AGeidXRRnIAJ", "quantity": 11, "sku": "kpOjqwgKvfXXs8pD"}, {"duration": 34, "endDate": "1990-04-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "AZSRkuw6q8FgqG46", "quantity": 90, "sku": "iGa5mkZjnRXVcg6A"}]}, {"condition": "ByNpBo2JYkwLdmR9", "conditionName": "7u9MVUii4KpYcb1A", "eventName": "UsESaBOTHnbX9tC9", "rewardItems": [{"duration": 85, "endDate": "1974-12-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "jvW0Qp3kTyL4CsLw", "quantity": 17, "sku": "sAkRT2k0AzdgIunR"}, {"duration": 21, "endDate": "1979-07-12T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Hwo1IAJQpb6r8Zea", "quantity": 91, "sku": "nT24wh59RGSbBMh7"}, {"duration": 19, "endDate": "1978-05-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "gYZyF9fJBJkSOrF9", "quantity": 60, "sku": "yJfThvCJieqRSGN8"}]}], "userIdExpression": "Mm74HlSZzp4aEW4G"}' \
    > test.out 2>&1
eval_tap $? 182 'UpdateReward' test.out

#- 183 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'kHG5OIVuGv47XJpk' \
    > test.out 2>&1
eval_tap $? 183 'DeleteReward' test.out

#- 184 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'MiopQrVL3ZZTVxqa' \
    --body '{"payload": {"9XM2gY14iWk12Jff": {}, "k8dwKNPUOHNZxML3": {}, "yoBM9qxd6PWz7sVn": {}}}' \
    > test.out 2>&1
eval_tap $? 184 'CheckEventCondition' test.out

#- 185 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Mxge2inL8fBFP1AB' \
    --body '{"conditionName": "aIKrEt8d3o7cTS9O", "userId": "IIMErnNTLXHrsOFs"}' \
    > test.out 2>&1
eval_tap $? 185 'DeleteRewardConditionRecord' test.out

#- 186 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'bhRow4iaYKy0IjsD' \
    --limit '14' \
    --offset '67' \
    --start 'bJ37DN2lDvdh7okH' \
    --storeId 'l1wMht2Izq7TCUJh' \
    --viewId 'DsDefAS09VyQB1vR' \
    > test.out 2>&1
eval_tap $? 186 'QuerySections' test.out

#- 187 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '1mx6K17GL1CrO4Zu' \
    --body '{"active": false, "displayOrder": 77, "endDate": "1987-08-14T00:00:00Z", "ext": {"ZSxTzm8oMSPIHPtq": {}, "zIWIzg8pbjnt1iBV": {}, "8DpbjGts4UZDTfhA": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 88, "itemCount": 75, "rule": "SEQUENCE"}, "items": [{"id": "hqilty9NVlgxUmnf", "sku": "dOAmu1dX1NqD20RU"}, {"id": "vvYeJZw6QZFN7wFC", "sku": "nqpvNesGiVnt9p2t"}, {"id": "o7Yja1soDE1K0SvG", "sku": "rMYwPmPXC2LfL2m5"}], "localizations": {"rP2A20t6foPPH94S": {"description": "UinY5diUlqgvY7dP", "localExt": {"PyahppgxJhk4EdTZ": {}, "000rS92594HLvWFs": {}, "XHtMP0k9L5dREQbC": {}}, "longDescription": "qfh0gpABFBER6WNc", "title": "DOsRzBkf9A6HjCnF"}, "RdSihcvszzQLZBkt": {"description": "k0siMup01kyaFwwD", "localExt": {"7wecuQb4GNQHVZMK": {}, "GBnzh4suaGIzttTn": {}, "cVBf5g3oeuHiNyLk": {}}, "longDescription": "fPQPmjUkvSs5YmIe", "title": "jozmG5HlrIfMAvvp"}, "kAHRJHZyfrXZmiJX": {"description": "4CjKCeIRIr997KKp", "localExt": {"JXTLbYWpqeXjaf1f": {}, "5fjNMZjKJ05puX31": {}, "97WrMnJtovSMFw8X": {}}, "longDescription": "4zxbdfXgunt1oMNZ", "title": "68eovHSH3xV3URIR"}}, "name": "VDYBd6hMB0l7sg7I", "rotationType": "CUSTOM", "startDate": "1986-11-15T00:00:00Z", "viewId": "E4Jf4hQpsLOcLtZw"}' \
    > test.out 2>&1
eval_tap $? 187 'CreateSection' test.out

#- 188 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '0efmEVcW7mxbS5UO' \
    > test.out 2>&1
eval_tap $? 188 'PurgeExpiredSection' test.out

#- 189 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'oICxQMit8555Niy4' \
    --storeId 'NNFpRE5pS85yTIRW' \
    > test.out 2>&1
eval_tap $? 189 'GetSection' test.out

#- 190 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'vLRy58UKWPv3F7S0' \
    --storeId 'wCVlYQi9cfMCeNnu' \
    --body '{"active": true, "displayOrder": 67, "endDate": "1985-07-01T00:00:00Z", "ext": {"PPLRDEXLXZWXvqNC": {}, "HvNpeMjMzguq6HFI": {}, "qaqwH9J6JLb5f3SB": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 89, "itemCount": 73, "rule": "SEQUENCE"}, "items": [{"id": "UdwEBRrHAWUFqToo", "sku": "GGnPEgY0t7QQWl42"}, {"id": "byOwXgKyPhXmcysa", "sku": "e8HpWH4xiz3fWthJ"}, {"id": "Su2pUIIuPLFAtcWh", "sku": "jAP57QbWvSSp71zE"}], "localizations": {"PPfmAQiqRRC2caqu": {"description": "MRtQOILcaDqUITBH", "localExt": {"QR5ISNoFR3GUxdMu": {}, "vmL0UBfwzaaeP3Wd": {}, "0Wrb8s3GW0CY0vAf": {}}, "longDescription": "bq8xoCurq4lpHXrb", "title": "VBh60NUA2aKQwnXr"}, "mi6ya8u4sQPvaf1A": {"description": "cweR7tJW3MLMob1h", "localExt": {"UnIzIpUM8KK1kGFN": {}, "0NUNGKxdlAUDFQuG": {}, "PzAuT7M6OBrNwioK": {}}, "longDescription": "nXPVZaDcXsV1TnsZ", "title": "ioDiBgprzahPB0FK"}, "Ma0YeyNBQWUHDBnB": {"description": "eePkqg6Zt1Lr5BlO", "localExt": {"8K6LH4dSaa8XYHug": {}, "51ZTogG0N7Hvnuq1": {}, "kJ1kpHcQtnIc9z70": {}}, "longDescription": "LFQMI0oZuEjY0rNB", "title": "bbB9txAvtRQvqJac"}}, "name": "XR2Rf4noXDFaEUkP", "rotationType": "NONE", "startDate": "1997-08-12T00:00:00Z", "viewId": "Yz2zMU9jLzNV3GaG"}' \
    > test.out 2>&1
eval_tap $? 190 'UpdateSection' test.out

#- 191 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '43R6nlRPrEAYqRBe' \
    --storeId 'Sc5uShoj3dGHMeoi' \
    > test.out 2>&1
eval_tap $? 191 'DeleteSection' test.out

#- 192 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'ListStores' test.out

#- 193 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "5DBOsQ0Gax0iX05I", "defaultRegion": "T9Agsjl5NmnSHhxN", "description": "mCe4txY0MsPc9EMg", "supportedLanguages": ["f9JCJiEvhL8ZfwCV", "JW9yspUOyHC9eKeX", "zrvzBllwzyC1aTWE"], "supportedRegions": ["mPgoy4TkpEw4Zeid", "4mRoFNxv10ckMQVj", "Kk3bWJ0ZuYSe3sI0"], "title": "x2hc8vaN1Off5gRZ"}' \
    > test.out 2>&1
eval_tap $? 193 'CreateStore' test.out

#- 194 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'VIEW' \
    > test.out 2>&1
eval_tap $? 194 'GetCatalogDefinition' test.out

#- 195 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 195 'DownloadCSVTemplates' test.out

#- 196 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "SECTION", "fieldsToBeIncluded": ["W3huAIzBPWBYKAEF", "TdlKNh6GTzKjsCqx", "x24QM35bSkFrvGci"], "idsToBeExported": ["NHb7OY5YIpOLJW52", "uz3c8pz63M0g4xXT", "5Ts4e0uR47OzUGHe"], "storeId": "BKtpvyRNgjZkdDpp"}' \
    > test.out 2>&1
eval_tap $? 196 'ExportStoreByCSV' test.out

#- 197 ImportStore
eval_tap 0 197 'ImportStore # SKIP deprecated' test.out

#- 198 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'GetPublishedStore' test.out

#- 199 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'DeletePublishedStore' test.out

#- 200 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 200 'GetPublishedStoreBackup' test.out

#- 201 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 201 'RollbackPublishedStore' test.out

#- 202 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'vEJiUiDGXgh8BKcL' \
    > test.out 2>&1
eval_tap $? 202 'GetStore' test.out

#- 203 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qtRZ93LuR8OEyICv' \
    --body '{"defaultLanguage": "wgwBFehwtdJLdn3R", "defaultRegion": "2wo8beVQvgeP9qOH", "description": "aLwYnXxrz7sLmP70", "supportedLanguages": ["LxN0f3JA27Qz5Sjz", "QfOLYu9O46OOzz9p", "57qSpHerzO87cg7T"], "supportedRegions": ["qtMiQgi7Aj28qCRb", "wwZc4ZS1NMkrnHs1", "Iyhwqk140MolIrnl"], "title": "kRVbcX435TDYpkk2"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateStore' test.out

#- 204 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Gza6DrSycophHw3E' \
    > test.out 2>&1
eval_tap $? 204 'DeleteStore' test.out

#- 205 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oEEClTO9SDKnMlnK' \
    --action 'DELETE' \
    --itemSku '9jiNMu9QVrMeD4bD' \
    --itemType 'CODE' \
    --limit '13' \
    --offset '37' \
    --selected  \
    --sortBy 'updatedAt:desc,updatedAt:asc,createdAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'STORE' \
    --updatedAtEnd '59GT2E6AacmZRXZm' \
    --updatedAtStart '626POXWVj3KP1mX0' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 205 'QueryChanges' test.out

#- 206 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iYHXBU3Uk2tQm307' \
    > test.out 2>&1
eval_tap $? 206 'PublishAll' test.out

#- 207 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'IORTyHnLYDAAg1YA' \
    > test.out 2>&1
eval_tap $? 207 'PublishSelected' test.out

#- 208 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '4kZURmoGgxVRMPf8' \
    > test.out 2>&1
eval_tap $? 208 'SelectAllRecords' test.out

#- 209 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'g1rbhfIMStMnSqrK' \
    --action 'UPDATE' \
    --itemSku 'OuITlYS2RYaD9WNK' \
    --itemType 'OPTIONBOX' \
    --selected  \
    --type 'ITEM' \
    --updatedAtEnd '5GKmcEKp8AQwqgJs' \
    --updatedAtStart '6O0Qj0ccMkdz6zPz' \
    > test.out 2>&1
eval_tap $? 209 'SelectAllRecordsByCriteria' test.out

#- 210 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '3BVHAqp4O9XSjap2' \
    --action 'CREATE' \
    --itemSku 'esyjh6Wc3migf2n6' \
    --itemType 'CODE' \
    --type 'SECTION' \
    --updatedAtEnd 'Qyr5cb5YL6fwBiaV' \
    --updatedAtStart 'Pmmn0T5uzlmi2NY2' \
    > test.out 2>&1
eval_tap $? 210 'GetStatistic' test.out

#- 211 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '6xrkPPdg3pXjmtpN' \
    > test.out 2>&1
eval_tap $? 211 'UnselectAllRecords' test.out

#- 212 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'fCrIj9ntYo3dupUH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Nu8abrVVOKxr9Pa3' \
    > test.out 2>&1
eval_tap $? 212 'SelectRecord' test.out

#- 213 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId '15FKDjG2ApSV94Jy' \
    --namespace "$AB_NAMESPACE" \
    --storeId '6yCSXBqJqjAbVwSa' \
    > test.out 2>&1
eval_tap $? 213 'UnselectRecord' test.out

#- 214 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oj1ugjr8mPkr3tZ5' \
    --targetStoreId '06ERSVy5M3rrkxu0' \
    > test.out 2>&1
eval_tap $? 214 'CloneStore' test.out

#- 215 ExportStore
eval_tap 0 215 'ExportStore # SKIP deprecated' test.out

#- 216 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'U9h9gCNVZxHGxhZq' \
    --end 'NXJ6JXSh0Z3SWISs' \
    --limit '69' \
    --offset '6' \
    --sortBy 'to74GcmVf0fbCU9Q' \
    --start 'dPuWeMEeL0EJG67g' \
    --success  \
    > test.out 2>&1
eval_tap $? 216 'QueryImportHistory' test.out

#- 217 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId '4W1eAmDxP23qstMu' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'ikKc6VNU8570siWm' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 217 'ImportStoreByCSV' test.out

#- 218 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'V9sirE0JOQxWeHyp' \
    --limit '33' \
    --offset '99' \
    --sku 'CWMDPRI2cCk8zHR8' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    --userId 'Drquccz4J6fFQezJ' \
    > test.out 2>&1
eval_tap $? 218 'QuerySubscriptions' test.out

#- 219 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '5E3iYHIknvPcJkjR' \
    > test.out 2>&1
eval_tap $? 219 'RecurringChargeSubscription' test.out

#- 220 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'evVYfiExpAgoK9YD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetTicketDynamic' test.out

#- 221 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'q1x3dkbJFDEBEOOv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "J5BKeipIldsgB4hO"}' \
    > test.out 2>&1
eval_tap $? 221 'DecreaseTicketSale' test.out

#- 222 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'xb88WgKSLIpneDQC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 222 'GetTicketBoothID' test.out

#- 223 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'fwucHRL3o2NstrL6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 93, "orderNo": "1N0JEKNoMtHvjM7X"}' \
    > test.out 2>&1
eval_tap $? 223 'IncreaseTicketSale' test.out

#- 224 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 10, "currencyCode": "TkUCqbbHGJGOTvKK", "expireAt": "1993-09-27T00:00:00Z"}, "debitPayload": {"count": 78, "currencyCode": "DntaFiufH2YR6QU7", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 6, "entitlementCollectionId": "j6w17arNs12hOoLV", "entitlementOrigin": "Twitch", "itemIdentity": "h4AhZRe2hgU56xty", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 41, "entitlementId": "xHrOon2OW4Zw5QwV"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 80, "currencyCode": "uq0m0rvakR8rcwoj", "expireAt": "1990-01-27T00:00:00Z"}, "debitPayload": {"count": 89, "currencyCode": "JDujYnVnFK6gB6Zx", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 55, "entitlementCollectionId": "yYUVUJYnQ3jOGmRO", "entitlementOrigin": "System", "itemIdentity": "QZy3gdDms3kb1htW", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 67, "entitlementId": "5ZtfwmOCKpFSMF0t"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 66, "currencyCode": "jCDwg186hGWKfO9M", "expireAt": "1977-09-06T00:00:00Z"}, "debitPayload": {"count": 30, "currencyCode": "pAJMCxMp2J0hDg2k", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 13, "entitlementCollectionId": "KtU956hOg8oukDVd", "entitlementOrigin": "Other", "itemIdentity": "7M36mI9u3EeZtLQi", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 58, "entitlementId": "2JXsqdXfhZTTaCeq"}, "type": "FULFILL_ITEM"}], "userId": "31p7q794bu49lINF"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 40, "currencyCode": "SUbqByWN2BCnRz9w", "expireAt": "1999-01-06T00:00:00Z"}, "debitPayload": {"count": 27, "currencyCode": "BTnNQnVUhA5WnzVZ", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 42, "entitlementCollectionId": "j8tsyzC4QaLXp3o4", "entitlementOrigin": "Steam", "itemIdentity": "DraEEaDNJbVd20FV", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 19, "entitlementId": "vCjthJUb7jKuMrFa"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "System", "count": 77, "currencyCode": "qxMnoAXRlcq0mYWK", "expireAt": "1993-11-03T00:00:00Z"}, "debitPayload": {"count": 5, "currencyCode": "lqMmu2pvF6rP03bQ", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 80, "entitlementCollectionId": "q1cT88H6RCW8gJmG", "entitlementOrigin": "Playstation", "itemIdentity": "Lh56AWXoMiowdWSs", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 59, "entitlementId": "2IdH8aYYUT6mma83"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Steam", "count": 35, "currencyCode": "zk66ix88sAUrXr7M", "expireAt": "1996-06-29T00:00:00Z"}, "debitPayload": {"count": 48, "currencyCode": "4KV104MtMhKHmSjq", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 24, "entitlementCollectionId": "QZX5KjdNrEwfWo2M", "entitlementOrigin": "Other", "itemIdentity": "SJLlrwXmIGamRCAR", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 91, "entitlementId": "FLx4rV4CXVMrDYKe"}, "type": "CREDIT_WALLET"}], "userId": "WwU4Ty6Ch5QYyFju"}, {"operations": [{"creditPayload": {"balanceOrigin": "Steam", "count": 16, "currencyCode": "quE7xssm4hxczskb", "expireAt": "1994-02-18T00:00:00Z"}, "debitPayload": {"count": 95, "currencyCode": "noKIz8O8NglJtZTh", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 45, "entitlementCollectionId": "ZmTTGYRbP4QVey9p", "entitlementOrigin": "Steam", "itemIdentity": "16MMd2bzOrTn2huw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 10, "entitlementId": "yUzBUWiKoNGtvyk5"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Other", "count": 63, "currencyCode": "Hv3JgteOLyKp8a1V", "expireAt": "1979-07-17T00:00:00Z"}, "debitPayload": {"count": 6, "currencyCode": "XnRhDd9TGkO6aIYq", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 42, "entitlementCollectionId": "tw1SrM2nhSEanfUY", "entitlementOrigin": "Oculus", "itemIdentity": "rFQP6rW62CtetBW3", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "vAJJieHhveGg97PY"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 48, "currencyCode": "tBjP4HSuiYCbG0Uy", "expireAt": "1997-10-14T00:00:00Z"}, "debitPayload": {"count": 64, "currencyCode": "mNL8p6AbdtU0CDrl", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 32, "entitlementCollectionId": "zrmbWofEaKStqdKu", "entitlementOrigin": "Nintendo", "itemIdentity": "ROnONpJ849chqeiU", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 86, "entitlementId": "iQvURYZCeF30RT9r"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "del3hHMSLAiscGRW"}], "metadata": {"zkCl1ZKuPxjDUGRG": {}, "cCEPjbUy7F82Adu9": {}, "BYRHrVTehrqgvEtE": {}}, "needPreCheck": true, "transactionId": "KX68jTyRd3LrR1x6", "type": "U1v6zSLjm9zmzUW0"}' \
    > test.out 2>&1
eval_tap $? 224 'Commit' test.out

#- 225 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '97' \
    --status 'SUCCESS' \
    --type 'y7FWTSfMi2CPVGxj' \
    --userId 'cdpdCqVeePMSqb8y' \
    > test.out 2>&1
eval_tap $? 225 'GetTradeHistoryByCriteria' test.out

#- 226 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '8qJTUQY40Zrpn0vA' \
    > test.out 2>&1
eval_tap $? 226 'GetTradeHistoryByTransactionId' test.out

#- 227 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'D9YsPeDWrAVQZSvg' \
    --body '{"achievements": [{"id": "WuCuLsUGrVQAbhS5", "value": 30}, {"id": "uQHKersDmJLUHAKt", "value": 10}, {"id": "ki9fbdvUMDZeO4U5", "value": 10}], "steamUserId": "wdCpVpnENiTc9NES"}' \
    > test.out 2>&1
eval_tap $? 227 'UnlockSteamUserAchievement' test.out

#- 228 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'V22eRBElD4K2Cy1t' \
    --xboxUserId 'JcPAEkCeV29QsQk1' \
    > test.out 2>&1
eval_tap $? 228 'GetXblUserAchievements' test.out

#- 229 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '00eu5UcxuXXpt0YS' \
    --body '{"achievements": [{"id": "PX04uEIdAwgDobop", "percentComplete": 3}, {"id": "dLWJWDuSYtCaIv4L", "percentComplete": 32}, {"id": "SBdk7MwQzn28Le5n", "percentComplete": 8}], "serviceConfigId": "DAaUXSuBQdvdhJoT", "titleId": "0WK5ngNUxDKfZYof", "xboxUserId": "PGUbSaA00nKxQjYU"}' \
    > test.out 2>&1
eval_tap $? 229 'UpdateXblUserAchievement' test.out

#- 230 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId '6KlavIiLxU2I1GyJ' \
    > test.out 2>&1
eval_tap $? 230 'AnonymizeCampaign' test.out

#- 231 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'S48Hxu8Ju4XSAnlX' \
    > test.out 2>&1
eval_tap $? 231 'AnonymizeEntitlement' test.out

#- 232 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'RYB9BgSZBvkehRn8' \
    > test.out 2>&1
eval_tap $? 232 'AnonymizeFulfillment' test.out

#- 233 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '3B0nrW1qx3NJTugV' \
    > test.out 2>&1
eval_tap $? 233 'AnonymizeIntegration' test.out

#- 234 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'WXz8dv7BiEUqnzxs' \
    > test.out 2>&1
eval_tap $? 234 'AnonymizeOrder' test.out

#- 235 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId '2deMF8UAJIHEZv5z' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizePayment' test.out

#- 236 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'yUUyNJkvA5xF3zHt' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeRevocation' test.out

#- 237 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZSd3QzXhkrN4pWry' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeSubscription' test.out

#- 238 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 't4XTNwpp0ni1YfIg' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizeWallet' test.out

#- 239 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'LZ4YIzElrLZOBLHC' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 239 'GetUserDLCByPlatform' test.out

#- 240 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '5iasunESjcgr2drX' \
    --includeAllNamespaces  \
    --status 'REVOKE_FAILED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 240 'GetUserDLC' test.out

#- 241 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '5NkKCySLA8cKCs0d' \
    --activeOnly  \
    --appType 'DLC' \
    --collectionId 'YRSa2OULZ0iOZJiO' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'hmHOpCdr3WzDm3hJ' \
    --features 'dd6uaO9TiTPnIh2i,aIBpYC4txul6VKYl,NYYlHPwKDpJmkeoA' \
    --fuzzyMatchName  \
    --itemId 'kp3Z4pgyJYwclb4g,d4QgQut2hiPuDdOP,HcN9drwqytieXpIZ' \
    --limit '11' \
    --offset '88' \
    --origin 'Oculus' \
    > test.out 2>&1
eval_tap $? 241 'QueryUserEntitlements' test.out

#- 242 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWMktmiKd9vLPP0w' \
    --body '[{"collectionId": "52JRAZxMWdoleYNH", "endDate": "1996-04-15T00:00:00Z", "grantedCode": "eOpaRDwYLge851Pb", "itemId": "K2MFKvw5TWjAh4gy", "itemNamespace": "41LLzQ2IjY5PeNr4", "language": "yNmY-dzIt", "metadata": {"VmbfzwUmsy0stUmK": {}, "dXiiTObNdqkWa13g": {}, "3pgHx6uPf6jQZcYe": {}}, "origin": "Oculus", "quantity": 93, "region": "H933X7iXEEM2KOus", "source": "GIFT", "startDate": "1986-08-06T00:00:00Z", "storeId": "HcI95GGdJvucDbs6"}, {"collectionId": "UdccuM2ykRj3WnyA", "endDate": "1971-02-16T00:00:00Z", "grantedCode": "UaQBKFedL2uduXvZ", "itemId": "UbQQ13FhD3NExUFi", "itemNamespace": "pJsUiDawAjgHFQk0", "language": "ayGs", "metadata": {"FNiUn2yXMSCcHADY": {}, "pS861c0CJ7LzpFvO": {}, "SF6xKA6yrnvXY5dD": {}}, "origin": "Other", "quantity": 27, "region": "2eq0O6VsXtOlQwj5", "source": "REDEEM_CODE", "startDate": "1992-02-25T00:00:00Z", "storeId": "vm7c5nPR0Y1sffUa"}, {"collectionId": "Z64dFpiv8o9Gw4Qt", "endDate": "1990-02-20T00:00:00Z", "grantedCode": "RnWR30MdBZezfwc3", "itemId": "H0qSbMq4GLj8aGsH", "itemNamespace": "0qE5p601ak59yFSf", "language": "uk-jOoz-Ou", "metadata": {"iKT57rmbjEnimeR7": {}, "EFBz43E9FkOPVu2f": {}, "DtOjW1iSYQbcebBd": {}}, "origin": "Other", "quantity": 3, "region": "syrGNhBmgT2q0kIb", "source": "PROMOTION", "startDate": "1999-10-15T00:00:00Z", "storeId": "O7qYtOHV5hnpjc5C"}]' \
    > test.out 2>&1
eval_tap $? 242 'GrantUserEntitlement' test.out

#- 243 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NLnnEvo25aEtdjls' \
    --activeOnly  \
    --appId '5oadseJg7y4Q9CU3' \
    > test.out 2>&1
eval_tap $? 243 'GetUserAppEntitlementByAppId' test.out

#- 244 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'fjSRaXD4HDmdvhMX' \
    --activeOnly  \
    --limit '49' \
    --offset '72' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 244 'QueryUserEntitlementsByAppType' test.out

#- 245 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iu7BIimNuwB3hBVh' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'hdw3prp0UHlWUxkB' \
    --itemId 'efhxRtrqbv56oqwn' \
    > test.out 2>&1
eval_tap $? 245 'GetUserEntitlementByItemId' test.out

#- 246 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'CLVc2qHZuuedbBOd' \
    --ids '19DqZJRYV1oqNLmP,AUIMwa2wYq6DsUq3,8bYvaWLoKzHnngdf' \
    --platform 'FnOfY9stXH6LYXXM' \
    > test.out 2>&1
eval_tap $? 246 'GetUserActiveEntitlementsByItemIds' test.out

#- 247 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'ndxBPKmHVB7cNzHh' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'XiJcJqYSxVKUYMim' \
    --sku 'VLzAP6aOzsTqEFXU' \
    > test.out 2>&1
eval_tap $? 247 'GetUserEntitlementBySku' test.out

#- 248 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hGAwpYq1UqZydOB0' \
    --appIds 'MThZW6LwcAg57BYB,VCbi0ifdPyKf3SwH,ekWIz4rXlH5jw99H' \
    --itemIds 'xCjXWcaXBcfXXeV7,BXefsSgZxSYnVwXq,F6K0WA76Kl2mHHoz' \
    --platform '6qBQnEDgX49n1xTD' \
    --skus 'FcmOm1sqdIWU6ERy,lESgf5dXMrPoYSoh,frLyXMSrC62xYtDw' \
    > test.out 2>&1
eval_tap $? 248 'ExistsAnyUserActiveEntitlement' test.out

#- 249 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'flNGfufW5cWeg6eS' \
    --platform 'CypsceITTkJGGCVF' \
    --itemIds '6LrILDLviUCzmDAa,W5xz1c7ZuZXUCBYn,kY0LEBSYBdUSiTOr' \
    > test.out 2>&1
eval_tap $? 249 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 250 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'hB8hVs29WOKmZRTt' \
    --appId 'gycLzXz6lUMKi5mw' \
    > test.out 2>&1
eval_tap $? 250 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 251 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMEZo2ZnL1Zg2JfH' \
    --entitlementClazz 'CODE' \
    --platform 'f73jAevOnES6YJLl' \
    --itemId 'b2AfUEEBbqMMKvkO' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementOwnershipByItemId' test.out

#- 252 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'sR1fHUyirMVMOFES' \
    --ids '2J2OzNlJE3uqZz57,4g31cA0PwZxTIZVS,GQyTzhs9Asy4d629' \
    --platform 'N4YnolVWA2dWxBs0' \
    > test.out 2>&1
eval_tap $? 252 'GetUserEntitlementOwnershipByItemIds' test.out

#- 253 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '56jkPCUuE1pgdHvl' \
    --entitlementClazz 'OPTIONBOX' \
    --platform 'MXxVh8HTrKqVwnpP' \
    --sku 'n8N5xMRgU7cPqNZr' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementOwnershipBySku' test.out

#- 254 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'LCRRUysya4J3rvTz' \
    > test.out 2>&1
eval_tap $? 254 'RevokeAllEntitlements' test.out

#- 255 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MTMSwrNov2GW9i54' \
    --entitlementIds 'JY23AUWFTLq0W1Jq' \
    > test.out 2>&1
eval_tap $? 255 'RevokeUserEntitlements' test.out

#- 256 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'wKs1mO80L7IOHlf6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j8PZOzUiQKZqz5NS' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlement' test.out

#- 257 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'p0B7LODN3Boi2sSA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O2n4MZQt753XQB93' \
    --body '{"collectionId": "rOW0guPoQbYzc1RD", "endDate": "1995-08-04T00:00:00Z", "nullFieldList": ["hs2lhdzxxgibuqUu", "yW3cMz9YyduMomEH", "cU15St4v8ry8IyqN"], "origin": "Epic", "reason": "v0KVpXJTMx3Y8Um1", "startDate": "1975-02-03T00:00:00Z", "status": "INACTIVE", "useCount": 36}' \
    > test.out 2>&1
eval_tap $? 257 'UpdateUserEntitlement' test.out

#- 258 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'ehObg3OZ9j0HDtbq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MFlgHKQIRtLfPngD' \
    --body '{"metadata": {"83roOeqE7fcCAeEx": {}, "eQX43LpmdMiZeyIr": {}, "A4QUKSJgECzvaWUC": {}}, "options": ["A7wKru7ry3AQ2sEH", "vSxjWoM1rNJLM0OO", "VG5cG6XxENbWqlX7"], "platform": "idzjpKDfwl6XlCF6", "requestId": "YxFMD8tJQwZvUVIn", "useCount": 29}' \
    > test.out 2>&1
eval_tap $? 258 'ConsumeUserEntitlement' test.out

#- 259 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'zylaquioT3QBt29A' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iRASsuFM4ahGw7Xc' \
    > test.out 2>&1
eval_tap $? 259 'DisableUserEntitlement' test.out

#- 260 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'F1Qwzz606UGXPhoN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZlXMef7AvS3TfKx6' \
    > test.out 2>&1
eval_tap $? 260 'EnableUserEntitlement' test.out

#- 261 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'ByTygbtOtcQS4Cmg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w1wRUnIVYxY6Ohdk' \
    > test.out 2>&1
eval_tap $? 261 'GetUserEntitlementHistories' test.out

#- 262 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'rYiCinoVOzo4Plv1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IlTpEhjTFYdzsUNv' \
    --body '{"metadata": {"QAn2LuMjLqwmVz3z": {}, "Ksfjz1mFkyxoUzfM": {}, "FoXCOguSq2A4R3wD": {}}}' \
    > test.out 2>&1
eval_tap $? 262 'RevokeUserEntitlement' test.out

#- 263 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'dSkNfHJtA3QiX9Zv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tydbaVb0scd97A0G' \
    --body '{"reason": "P6djn2Ps3IVT5hUZ", "useCount": 34}' \
    > test.out 2>&1
eval_tap $? 263 'RevokeUserEntitlementByUseCount' test.out

#- 264 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'cnDq0ddZG0EpfGAq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HKcSxUc2YgRpk2IF' \
    --quantity '67' \
    > test.out 2>&1
eval_tap $? 264 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 265 RevokeUseCount
eval_tap 0 265 'RevokeUseCount # SKIP deprecated' test.out

#- 266 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'c3XALMresGFfsH4a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XCDhshvEF8rHd250' \
    --body '{"platform": "nyihcUVGHQczI5Zo", "requestId": "TRUkjGoRkPs2SO9X", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 266 'SellUserEntitlement' test.out

#- 267 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cC3rpWhSpq0InxML' \
    --body '{"duration": 31, "endDate": "1978-12-09T00:00:00Z", "entitlementCollectionId": "qeZtHJnRgaGfLMFb", "entitlementOrigin": "Other", "itemId": "99M1yuXeqV31LX2e", "itemSku": "hcMnM6QtjzQjDlUM", "language": "CGnxZwak7KHnzGAS", "metadata": {"mVzePIroz41oQCuX": {}, "eTRyJQrNLTcqLVTN": {}, "5Qf4tjPGpu27yxb1": {}}, "order": {"currency": {"currencyCode": "of79zVTWIfgdNphq", "currencySymbol": "e9fS1m77MAg4KoZQ", "currencyType": "REAL", "decimals": 61, "namespace": "7XVzU7qlNVk7qnmB"}, "ext": {"S3XKDhp1OkMcErme": {}, "H0lX1hj0LaXgQ94f": {}, "lh775AQfzNjQ7IuM": {}}, "free": false}, "orderNo": "Y2epRDJjDyMDKQhu", "origin": "Playstation", "overrideBundleItemQty": {"jtQZyIiAmCL8bNTT": 12, "rCFkyiQZfMnTbKdw": 80, "bQaKFrTv4JWElmOC": 49}, "quantity": 98, "region": "qPrq9I3XJWBxTLcO", "source": "DLC", "startDate": "1974-04-08T00:00:00Z", "storeId": "MgIwkrKFEtwESJCe"}' \
    > test.out 2>&1
eval_tap $? 267 'FulfillItem' test.out

#- 268 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '2ksG3nZE13H2fILF' \
    --body '{"code": "zOlAZbDQAEJLbVWH", "language": "yPmW", "region": "gmdSvWp3h0xPsVY8"}' \
    > test.out 2>&1
eval_tap $? 268 'RedeemCode' test.out

#- 269 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'qNwB2TY4v9NNfQSY' \
    --body '{"itemId": "LFKSl3FNFFJnt3rI", "itemSku": "wZdW02Su6aCnL816", "quantity": 1}' \
    > test.out 2>&1
eval_tap $? 269 'PreCheckFulfillItem' test.out

#- 270 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'PckeGJUgU8bD5mGF' \
    --body '{"entitlementCollectionId": "FmKTTUxG0mpmFxxD", "entitlementOrigin": "Xbox", "metadata": {"JMPkZmay4Csye3iJ": {}, "Ltjsu6ZJRCoDq3ge": {}, "uHFFaZzPIjETqcKN": {}}, "origin": "System", "rewards": [{"currency": {"currencyCode": "gaQ4Bn0cPPtKaJlw", "namespace": "31pdDrXQ47WSGyDC"}, "item": {"itemId": "KF0LLhO3lGZ7eGOP", "itemName": "j2XoFug8BUQUmPHn", "itemSku": "PumcazKAna0ji757", "itemType": "aNDFeKnQP2j2WsQI"}, "quantity": 25, "type": "CURRENCY"}, {"currency": {"currencyCode": "TwYkiuxzLrbJ0BkG", "namespace": "zCNgesQlZZHIZH0i"}, "item": {"itemId": "ks6kx0adnimPyyze", "itemName": "zsHdFftHHR6xbcVV", "itemSku": "onwz27DWfGRVhbZT", "itemType": "vCPrrZCTU5WUJizF"}, "quantity": 19, "type": "CURRENCY"}, {"currency": {"currencyCode": "PSsquWUafwbFPX15", "namespace": "633pFgA7i9tqvfHm"}, "item": {"itemId": "FvUZiUW5Y0CYw5OX", "itemName": "SGwQkJuy9oLFcHHc", "itemSku": "raLXR2n9JQvq7NKW", "itemType": "IHYsii3fCh7sieJj"}, "quantity": 11, "type": "CURRENCY"}], "source": "REFERRAL_BONUS", "transactionId": "ya73hX0a8Ri85PA9"}' \
    > test.out 2>&1
eval_tap $? 270 'FulfillRewards' test.out

#- 271 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNpmrK5Y5heA2ewW' \
    --endTime 'nFcqHxXP3kRhtrBc' \
    --limit '57' \
    --offset '30' \
    --productId 'SryWB4yRaDxvxwaL' \
    --startTime 'M8HkVOW8PnLkgqkq' \
    --status 'FAILED' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 271 'QueryUserIAPOrders' test.out

#- 272 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'WPZTgKagTzdcYcko' \
    > test.out 2>&1
eval_tap $? 272 'QueryAllUserIAPOrders' test.out

#- 273 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '7U3gH239LhRx2Laa' \
    --endTime '2RdtVb6VgA5yFIH3' \
    --limit '38' \
    --offset '59' \
    --startTime '9UyeaFi8OE7BCK4F' \
    --status 'FAIL' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 273 'QueryUserIAPConsumeHistory' test.out

#- 274 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'VGrl5NpUG9zblWEi' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "JgZ_329", "productId": "stb3slUe94NxhXsV", "region": "cqTYi1TMBMzaOrxu", "transactionId": "KvtUVtqbDWnJ2i9T", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 274 'MockFulfillIAPItem' test.out

#- 275 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJOqIl7U12hO5vpk' \
    --discounted  \
    --itemId '9DOSgbsdGVPLD9A5' \
    --limit '81' \
    --offset '25' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 275 'QueryUserOrders' test.out

#- 276 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'uZDUV3yHurgOfba1' \
    --body '{"currencyCode": "XeoHYTNoRol84Ulk", "currencyNamespace": "xtP5Vok9sNK1ORg3", "discountCodes": ["17YrkWHNxiaNyqBf", "tChsS3fFpaS1uq1m", "H3oYfPK2QiAUhIfi"], "discountedPrice": 12, "entitlementPlatform": "Nintendo", "ext": {"w58Hx0XYL0fJOPYp": {}, "nPqGlPnhBDOWqDU8": {}, "N3DjVUt0n0jfyDbt": {}}, "itemId": "IXICLkK8ZvbnTg3z", "language": "nlg8nmzQx1RsYhcR", "options": {"skipPriceValidation": false}, "platform": "Xbox", "price": 44, "quantity": 92, "region": "16Wwe8YK3lZFslEC", "returnUrl": "I9QzuQcsjFehD6uT", "sandbox": true, "sectionId": "7sAsv2TKCbYMVkXE"}' \
    > test.out 2>&1
eval_tap $? 276 'AdminCreateUserOrder' test.out

#- 277 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HmsHwIGGsusS0zZR' \
    --itemId 'ODEKPdudZsLaf8aZ' \
    > test.out 2>&1
eval_tap $? 277 'CountOfPurchasedItem' test.out

#- 278 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rXW84dt0TSTmy7XF' \
    --userId '26K2U7xttUz8nWKJ' \
    > test.out 2>&1
eval_tap $? 278 'GetUserOrder' test.out

#- 279 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jv06PuffHghAQfAs' \
    --userId 'YXVzBenLtaAoYyRf' \
    --body '{"status": "CHARGED", "statusReason": "Azmsbhi5QJuc2SNB"}' \
    > test.out 2>&1
eval_tap $? 279 'UpdateUserOrderStatus' test.out

#- 280 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'aOlXfgsgBd7MYLLo' \
    --userId 'PZrkjRm5Ki0orhXr' \
    > test.out 2>&1
eval_tap $? 280 'FulfillUserOrder' test.out

#- 281 GetUserOrderGrant
eval_tap 0 281 'GetUserOrderGrant # SKIP deprecated' test.out

#- 282 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ISEaPZHLQkTHvndQ' \
    --userId 'sCKAO2JRz3CGwtuj' \
    > test.out 2>&1
eval_tap $? 282 'GetUserOrderHistories' test.out

#- 283 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kzxidLcAQWGVRg6D' \
    --userId 'Vso5TJCSugdo4XTm' \
    --body '{"additionalData": {"cardSummary": "8t1YTWqItjNWXm9s"}, "authorisedTime": "1980-08-24T00:00:00Z", "chargebackReversedTime": "1971-02-11T00:00:00Z", "chargebackTime": "1994-11-10T00:00:00Z", "chargedTime": "1988-08-06T00:00:00Z", "createdTime": "1992-07-22T00:00:00Z", "currency": {"currencyCode": "8YSRS2fPy5fpbbbM", "currencySymbol": "Iu9lu18jIMBUM77X", "currencyType": "REAL", "decimals": 80, "namespace": "emN8LO03mnFSq9jJ"}, "customParameters": {"TVFoFjxZjh5qUR1P": {}, "q4a4uaMfd0SQAfYI": {}, "yzHL8jxakuVu5r5B": {}}, "extOrderNo": "08VZxI4TU3apnZXo", "extTxId": "J4gI4EQKO8xC4D0F", "extUserId": "sUo3IB2kX5REQZsH", "issuedAt": "1983-07-21T00:00:00Z", "metadata": {"XzoIXNf0KbL9HyJt": "tdgfLGO3ummpllnV", "6B62P1Kazg73c6Up": "mA4ehxNIIlcrZzga", "meT2mLkkAMjHyI0e": "2Axj0nZHjmoKHJng"}, "namespace": "wMe1AnQVj6QQjZtk", "nonceStr": "NJCnDSrsSey2BqOx", "paymentData": {"discountAmount": 12, "discountCode": "VEux2MSuwsEHlwde", "subtotalPrice": 72, "tax": 65, "totalPrice": 50}, "paymentMethod": "DX4mu0qPHb9Ll2EF", "paymentMethodFee": 62, "paymentOrderNo": "LL1txfX9tqFSkGXo", "paymentProvider": "XSOLLA", "paymentProviderFee": 34, "paymentStationUrl": "cFN5JL9M53Mg0MzW", "price": 91, "refundedTime": "1983-08-30T00:00:00Z", "salesTax": 41, "sandbox": true, "sku": "zbhMxfEDE4TrtIHy", "status": "DELETED", "statusReason": "RVibTATxd7Mzjv1g", "subscriptionId": "Sj8kcNhoqcRZRNAT", "subtotalPrice": 29, "targetNamespace": "479W8rXqwGVIRWgT", "targetUserId": "NHCka3Wb5kH1BrLW", "tax": 95, "totalPrice": 10, "totalTax": 9, "txEndTime": "1992-06-10T00:00:00Z", "type": "BxQNz2IUEHMzl5jh", "userId": "wVDsuzwJ4v50eoaI", "vat": 56}' \
    > test.out 2>&1
eval_tap $? 283 'ProcessUserOrderNotification' test.out

#- 284 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Em3uHBMCP5ckjphU' \
    --userId 'Rs4ksgsKJ2R6Jacw' \
    > test.out 2>&1
eval_tap $? 284 'DownloadUserOrderReceipt' test.out

#- 285 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'wu8W1zvrKMRPvwA9' \
    --body '{"currencyCode": "k6yJz03NETdywPqY", "currencyNamespace": "errpOm4M2pM4fIfc", "customParameters": {"HBWZM50aHbPXRns3": {}, "qwYL6LwGlZGF7XQP": {}, "LAcIL7FvAMWqhyyN": {}}, "description": "ZH1CducB5y5iMdeB", "extOrderNo": "G7REG4meKEabfVXB", "extUserId": "JPIZqZC5d6JuFdcf", "itemType": "CODE", "language": "pRGV_iylQ-848", "metadata": {"2taDWh9JV5oc5IFQ": "srwHqFqwVA5mozee", "OjIFQfXV3YW3ug3n": "CXhD7FUz1iOe0pHa", "0LmseIRXeoerZAxb": "DPXU5xJBhIpJ9b0A"}, "notifyUrl": "p7CmSiKPjcwAw5Gd", "omitNotification": true, "platform": "tb47V691j0FZp2vj", "price": 84, "recurringPaymentOrderNo": "66DqPTdurR3MYda0", "region": "Y0BCO4qPnvxERWjK", "returnUrl": "asq5zQ6uZNwKjnX7", "sandbox": true, "sku": "Hq9LTBstguOdN0O7", "subscriptionId": "l3GbKPHdDTQDEEE2", "title": "mTsn1NwJ71szsNmn"}' \
    > test.out 2>&1
eval_tap $? 285 'CreateUserPaymentOrder' test.out

#- 286 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qZSWdEyOVYrTdDq7' \
    --userId 'IqbTVv8BLsqQW8HS' \
    --body '{"description": "rEm5Y7jI232Sjkti"}' \
    > test.out 2>&1
eval_tap $? 286 'RefundUserPaymentOrder' test.out

#- 287 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'jiNzTUe8KdizXmrm' \
    > test.out 2>&1
eval_tap $? 287 'GetUserPlatformAccountClosureHistories' test.out

#- 288 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'K0sCUsqxKocHomtj' \
    --body '{"code": "oU1kUqRedwIu1TSR", "orderNo": "r6r8mzfMedpcKhvH"}' \
    > test.out 2>&1
eval_tap $? 288 'ApplyUserRedemption' test.out

#- 289 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'PlvYanGqEkn9OEVw' \
    --body '{"meta": {"LWGT4MXhmzvRQb7c": {}, "0vmjWq9fQqzulLGf": {}, "QMqSLQDlRFYMVfiA": {}}, "reason": "Ma6Pco7Mfvikslpy", "revokeEntries": [{"currency": {"balanceOrigin": "Twitch", "currencyCode": "xxZIgkTLqMeJPCbs", "namespace": "8jWmTteJhwNbwHGG"}, "entitlement": {"entitlementId": "39YAZJ4HuLfeTfFB"}, "item": {"entitlementOrigin": "Twitch", "itemIdentity": "OFFMJ9pq511jZcTK", "itemIdentityType": "ITEM_ID", "origin": "Playstation"}, "quantity": 27, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "k0E7YaPblcWEyNgv", "namespace": "s5LEZrQXzSQRWRs9"}, "entitlement": {"entitlementId": "EGnRPgYlJElgJ8kx"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "WEeDbql13FtQMu41", "itemIdentityType": "ITEM_SKU", "origin": "System"}, "quantity": 26, "type": "ITEM"}, {"currency": {"balanceOrigin": "Playstation", "currencyCode": "rnNW1Yjfn8lY4DnY", "namespace": "RxY8ZhHeb0CaPFDj"}, "entitlement": {"entitlementId": "rSotKnpJWALpToj9"}, "item": {"entitlementOrigin": "Oculus", "itemIdentity": "YJOCViHwunQwpC2e", "itemIdentityType": "ITEM_SKU", "origin": "Steam"}, "quantity": 64, "type": "CURRENCY"}], "source": "IAP", "transactionId": "AHZaYSvsWiNJtqXl"}' \
    > test.out 2>&1
eval_tap $? 289 'DoRevocation' test.out

#- 290 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'tZF6aSRmHU5iR3hX' \
    --body '{"gameSessionId": "IbzWPKOkzftOgDQA", "payload": {"WhulbrDf7q4cAnpm": {}, "LiEu4CNtX2lnqi7c": {}, "HTSdGoLZbC3UJruU": {}}, "scid": "4uIXBZsEYogFWiH9", "sessionTemplateName": "z4E8zmaZ5cg0REtU"}' \
    > test.out 2>&1
eval_tap $? 290 'RegisterXblSessions' test.out

#- 291 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'WY4fVIdqwCWF5wmb' \
    --chargeStatus 'SETUP' \
    --itemId 'ubTxAAeDCowR3MeC' \
    --limit '80' \
    --offset '7' \
    --sku 'L1oNrF3SmgudQusJ' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 291 'QueryUserSubscriptions' test.out

#- 292 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNpKEIs3GC9VTK7t' \
    --excludeSystem  \
    --limit '21' \
    --offset '94' \
    --subscriptionId 'JWFpHt7MdKu9Xwn5' \
    > test.out 2>&1
eval_tap $? 292 'GetUserSubscriptionActivities' test.out

#- 293 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'GHJDGatrYOMO91CY' \
    --body '{"grantDays": 62, "itemId": "ORELVXUFQyVlt9jm", "language": "xmxpfp41k1uDg59P", "reason": "hdUXShabwyYCxTHr", "region": "Del8oThvr8CUEzw4", "source": "zL1QeR3EYXBFpUX9"}' \
    > test.out 2>&1
eval_tap $? 293 'PlatformSubscribeSubscription' test.out

#- 294 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'y4tY7o5FFi1n10vD' \
    --itemId 'gyoHXIlrMl2RAukC' \
    > test.out 2>&1
eval_tap $? 294 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 295 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'L26ihdMy9YCLNJEk' \
    --userId 'vq6SUSt8xd8EgE15' \
    > test.out 2>&1
eval_tap $? 295 'GetUserSubscription' test.out

#- 296 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'XNuw6Y7sToQNkuZz' \
    --userId 'J1XBxw01iBBQukgQ' \
    > test.out 2>&1
eval_tap $? 296 'DeleteUserSubscription' test.out

#- 297 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '94ZvPCWcMX0ov3U2' \
    --userId 'sKjIeyFS97dYD7Lk' \
    --force  \
    --body '{"immediate": false, "reason": "fmLSyGuu5rbJVIwR"}' \
    > test.out 2>&1
eval_tap $? 297 'CancelSubscription' test.out

#- 298 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MtwApGbXnR3yC6f2' \
    --userId 'MHGGedk0KzXRclOX' \
    --body '{"grantDays": 6, "reason": "8Fn8TvZVTe4L2lXr"}' \
    > test.out 2>&1
eval_tap $? 298 'GrantDaysToSubscription' test.out

#- 299 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VPX6r5ZTcnVVOKMA' \
    --userId 'pTcWsFRUlWBp4gBs' \
    --excludeFree  \
    --limit '49' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 299 'GetUserSubscriptionBillingHistories' test.out

#- 300 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '8MCIjKzylqW8auys' \
    --userId 'eP9wEEyYAnHPp4Xz' \
    --body '{"additionalData": {"cardSummary": "VL5McglFCrjxqqxA"}, "authorisedTime": "1997-09-04T00:00:00Z", "chargebackReversedTime": "1979-02-07T00:00:00Z", "chargebackTime": "1996-06-05T00:00:00Z", "chargedTime": "1987-10-01T00:00:00Z", "createdTime": "1999-05-24T00:00:00Z", "currency": {"currencyCode": "V3baMkZ9JCqBIkUI", "currencySymbol": "D0EE9InZNLwwAhW2", "currencyType": "REAL", "decimals": 96, "namespace": "5OHKtUv4lTkQNjxh"}, "customParameters": {"Xdj1CG0EBgst9Qu8": {}, "Ofl2oB8VTjF0pD3N": {}, "HU8iYUOtG5gbQSKW": {}}, "extOrderNo": "2MdgCH4bWxRF6fBP", "extTxId": "a6GOuV5z0p8jaJs2", "extUserId": "duQqawPrxi6F4elh", "issuedAt": "1983-11-04T00:00:00Z", "metadata": {"9CZ94CAUVW8FoEf8": "tjCjWc22qqDfNz59", "jHwSDQHadmAo0lzh": "Pm7RmaOr6TLwVyE4", "2ApAb7CKt79wAopZ": "L9Cw6K9h55mwUvhd"}, "namespace": "BOgumV4wAsd4ifGd", "nonceStr": "0bkWrlhtfTywRW4f", "paymentData": {"discountAmount": 26, "discountCode": "Xap6j73doCWxhubM", "subtotalPrice": 3, "tax": 48, "totalPrice": 49}, "paymentMethod": "1oTOX5gBQlVDx9ne", "paymentMethodFee": 65, "paymentOrderNo": "I4wTxNIefCmtrxWu", "paymentProvider": "ALIPAY", "paymentProviderFee": 55, "paymentStationUrl": "3551nQBNKcqCkUXR", "price": 20, "refundedTime": "1994-02-20T00:00:00Z", "salesTax": 88, "sandbox": true, "sku": "Ee4CO370OsbzRKKP", "status": "AUTHORISED", "statusReason": "URjEjnslEYM8ngVT", "subscriptionId": "1ewVxvgAocOqsd5v", "subtotalPrice": 69, "targetNamespace": "n7eXCo9gZWdxfIdW", "targetUserId": "8fNAM5YdHivK2Q0W", "tax": 45, "totalPrice": 55, "totalTax": 30, "txEndTime": "1976-01-07T00:00:00Z", "type": "Qy037hJMOEv5W0v2", "userId": "5yAObZIbrA8XAKKW", "vat": 78}' \
    > test.out 2>&1
eval_tap $? 300 'ProcessUserSubscriptionNotification' test.out

#- 301 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '4MWzWFTuNPf5JCSD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yYy4e5qoTZxSoZbQ' \
    --body '{"count": 95, "orderNo": "Pt69QROGDeJCyHvU"}' \
    > test.out 2>&1
eval_tap $? 301 'AcquireUserTicket' test.out

#- 302 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'snLvXCSgQHvs25ei' \
    > test.out 2>&1
eval_tap $? 302 'QueryUserCurrencyWallets' test.out

#- 303 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'QO3oWdgXdm1IxL1O' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tleUBqBO0Ze049k9' \
    --body '{"allowOverdraft": false, "amount": 68, "balanceOrigin": "Twitch", "balanceSource": "PAYMENT", "metadata": {"VJzRpUsITfVruDuk": {}, "un42zPZvOd4yZyMK": {}, "yED3qDO5HXp5oVkh": {}}, "reason": "ESbHQ7hvTlzf7XwQ"}' \
    > test.out 2>&1
eval_tap $? 303 'DebitUserWalletByCurrencyCode' test.out

#- 304 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'tVIYU87NgjDMcJxf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MfYFlt3JvDgMiyBG' \
    --limit '49' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 304 'ListUserCurrencyTransactions' test.out

#- 305 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'gWFTAY3Th5mOwPCP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVPlOGfFBlu2ZP0I' \
    --request '{"amount": 22, "debitBalanceSource": "TRADE", "metadata": {"iYXGk6BoBmSLi0R7": {}, "zDFMoNTQmlS8lMlY": {}, "8UjprhCxhzW6ZM7L": {}}, "reason": "kTVrtVJZVhxCVdjP", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 305 'CheckBalance' test.out

#- 306 CheckWallet
eval_tap 0 306 'CheckWallet # SKIP deprecated' test.out

#- 307 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'xc14iRfzJwKuc7Ep' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iQEzz5N5osRYO7wb' \
    --body '{"amount": 88, "expireAt": "1974-11-07T00:00:00Z", "metadata": {"7q02W8tkTURUFmqN": {}, "c8xhQqptccNorRls": {}, "7EC3nDnhFvDlFd7i": {}}, "origin": "Playstation", "reason": "LBdGNAZEvbvxqa0K", "source": "PURCHASE"}' \
    > test.out 2>&1
eval_tap $? 307 'CreditUserWallet' test.out

#- 308 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'VUbjUnzirnEsxSE4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vBzG7VK8sWEshmZf' \
    --request '{"amount": 80, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"WwQNmCQmGCF963Cb": {}, "sOawlRBQJH6fNekh": {}, "k077gxaj55huTA6A": {}}, "reason": "vmW0567BFqbrPIux", "walletPlatform": "Xbox"}' \
    > test.out 2>&1
eval_tap $? 308 'DebitByWalletPlatform' test.out

#- 309 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'mBXLi6GpnqAeMvg3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w0FQ1520WM3TxWXS' \
    --body '{"amount": 7, "metadata": {"N3B6tedgFUzBm5vG": {}, "A3itKaF9z3WWuv3j": {}, "8T9g1f6P3D3rVcC2": {}}, "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 309 'PayWithUserWallet' test.out

#- 310 GetUserWallet
eval_tap 0 310 'GetUserWallet # SKIP deprecated' test.out

#- 311 DebitUserWallet
eval_tap 0 311 'DebitUserWallet # SKIP deprecated' test.out

#- 312 DisableUserWallet
eval_tap 0 312 'DisableUserWallet # SKIP deprecated' test.out

#- 313 EnableUserWallet
eval_tap 0 313 'EnableUserWallet # SKIP deprecated' test.out

#- 314 ListUserWalletTransactions
eval_tap 0 314 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 315 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId '9U1NgpH7Oc44yjRd' \
    > test.out 2>&1
eval_tap $? 315 'ListViews' test.out

#- 316 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fqZgv34GqqjelcN0' \
    --body '{"displayOrder": 68, "localizations": {"UF7cdSDd99DQZ7vn": {"description": "Tx8HDXTJWiyw17og", "localExt": {"zmbj4SLYDrZJvDLG": {}, "vn6qtroZcp16HKXX": {}, "1ft5nBA9xNIJVuMz": {}}, "longDescription": "04evSdE2FMcKd7c9", "title": "4rEmIYuAT5OAcUwY"}, "HGmG5rNDBF1oU37v": {"description": "jfyX5YLaM0wmi0i1", "localExt": {"WABBbq8IzZsMFLX9": {}, "ZhFXcFtfBS3ZIHof": {}, "hwyM6Bw2sFGQ5DQo": {}}, "longDescription": "DwzrKPOZZnV3zR7Y", "title": "xSu6addocg10Hy9j"}, "x7gBHTOHHArjld0L": {"description": "nREsrrB2pJ7V8BSr", "localExt": {"ucjO3zvSM5KeVNHU": {}, "9GcOivIfcCJt4U8V": {}, "SgXoi9Fw25b9qXzl": {}}, "longDescription": "IK2G6AUjBCdf0Rp5", "title": "e5IvFuN1oUsCnBmG"}}, "name": "Mx5F6EhM3dKvIG9M"}' \
    > test.out 2>&1
eval_tap $? 316 'CreateView' test.out

#- 317 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'R0hTINvq1VR9SJUf' \
    --storeId 'QEX996Mh1sQ3Dw3u' \
    > test.out 2>&1
eval_tap $? 317 'GetView' test.out

#- 318 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'yjgQNAs9188Qm3W1' \
    --storeId 'De2McGd10wefF0CJ' \
    --body '{"displayOrder": 24, "localizations": {"Sj1T6EdeYFmrLT0H": {"description": "bvS4kSSt3CyDgf6e", "localExt": {"FAiqSkHi0BR2ElF6": {}, "z6eJKuOW61akRFiz": {}, "qxCmudSXivAL3n47": {}}, "longDescription": "8mhb2I2yBJeCJghT", "title": "rk68FWFzuLBdlrKj"}, "UbgZQfw6Zys3mN8f": {"description": "IcC9CkharfqaoMsG", "localExt": {"yv1RuSNdycDssUeH": {}, "iVDXzSJ8kbFAyidb": {}, "nXdMSwmkBkKC1h6h": {}}, "longDescription": "45u0wuh9pY0011jS", "title": "mHFTtfM2mGUUpq3i"}, "x7Am7W1fwJnV94Br": {"description": "MSP31wAkVH75UcmN", "localExt": {"XK5RqcIo9lpz9oM5": {}, "2vHPlwVV3jlPKDEY": {}, "ahnlLJaLCvjRKKX1": {}}, "longDescription": "brmkJDfdngbQD3pO", "title": "8U3W94Z8IW2MAL9g"}}, "name": "YHEV3wnTZTvYYf4Z"}' \
    > test.out 2>&1
eval_tap $? 318 'UpdateView' test.out

#- 319 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'FuV6L2AldoWWRN5w' \
    --storeId 'NYlFiliYmBrqrOc0' \
    > test.out 2>&1
eval_tap $? 319 'DeleteView' test.out

#- 320 QueryWallets
eval_tap 0 320 'QueryWallets # SKIP deprecated' test.out

#- 321 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 81, "expireAt": "1988-10-11T00:00:00Z", "metadata": {"718RQnj4imu6XFfR": {}, "cWDXhq1YmGeygr2S": {}, "4Yw8NmPaBeryzX2h": {}}, "origin": "Xbox", "reason": "FuEVP9bF07gnWDUL", "source": "DLC"}, "currencyCode": "SOh8SI75oXbyq8FB", "userIds": ["emh8lioBR7xTXcEI", "bur80QwnlgAVfqz6", "gQJh8sn0bVWRkvmA"]}, {"creditRequest": {"amount": 65, "expireAt": "1993-04-25T00:00:00Z", "metadata": {"oq5TO65KWh8ztRJk": {}, "XxUAj3jzZvEaY103": {}, "YUIMuSjDHz0zPWMZ": {}}, "origin": "Xbox", "reason": "aOAMCzbsoIgmKwwM", "source": "PROMOTION"}, "currencyCode": "ofv4SuaZ8yCB9TVZ", "userIds": ["nuzgvAZJRm71EC3E", "KVB7HeWPnVeFdy5e", "NuvD8OPsp5Z3ez84"]}, {"creditRequest": {"amount": 53, "expireAt": "1972-04-06T00:00:00Z", "metadata": {"7EUoezOLw8C1c5bB": {}, "B3XZ7ColKwlsNvtF": {}, "uunQsvdXGlD40xxI": {}}, "origin": "Playstation", "reason": "bPxRkIAFQh9yDdoL", "source": "PROMOTION"}, "currencyCode": "uloyce0cLJu4ljPW", "userIds": ["lCWTuGO8MnfOQu3w", "dT4Aodp95o1RkX7i", "W7VpCngWAv5DAG8d"]}]' \
    > test.out 2>&1
eval_tap $? 321 'BulkCredit' test.out

#- 322 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "PdkKgQqjyzUZR2rF", "request": {"allowOverdraft": true, "amount": 56, "balanceOrigin": "Epic", "balanceSource": "IAP_REVOCATION", "metadata": {"ItLBhvKJq9tWz9yu": {}, "i8a6jOflFJlZEhz1": {}, "QDeh05hj92bwVVxJ": {}}, "reason": "62Q5AOAOyL65cPaO"}, "userIds": ["sjJexnFA9Umz3KPI", "Cya5Fk5TPaEbX29c", "ZA8BG8KcVWOX9n3Y"]}, {"currencyCode": "V8v7MXctihtxMnIr", "request": {"allowOverdraft": false, "amount": 4, "balanceOrigin": "Other", "balanceSource": "PAYMENT", "metadata": {"jyfL3zMkklGCPISl": {}, "snVA6z0uSfNNpJUY": {}, "zJxnOyvqmswrToyB": {}}, "reason": "IQumxDfAxNqCUtiz"}, "userIds": ["YM97ebZcYqwfIHPW", "nmwJv4rpqtzDaz0W", "MkOmrT5HL16jMwEC"]}, {"currencyCode": "UJlBCHzJ2v9K8c1z", "request": {"allowOverdraft": false, "amount": 25, "balanceOrigin": "GooglePlay", "balanceSource": "TRADE", "metadata": {"n77gN8K1FlNkgbFE": {}, "8U4meK5grmPBsFH7": {}, "1VrhsISYtegQbNA2": {}}, "reason": "WQrHTkJT1VkChD3n"}, "userIds": ["0c1ryAkRvdPR8gx2", "rX5dck8NFKPgT6LM", "ehg047axU5ktNywR"]}]' \
    > test.out 2>&1
eval_tap $? 322 'BulkDebit' test.out

#- 323 GetWallet
eval_tap 0 323 'GetWallet # SKIP deprecated' test.out

#- 324 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'IvO2Sgz30hejqdkt' \
    --end 'HIO1VdtMSews1TrU' \
    --start '4FhAfKDcDG5bMTba' \
    > test.out 2>&1
eval_tap $? 324 'SyncOrders' test.out

#- 325 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["1tUlFGcP6eL7EpWt", "PifmO0JK4dP1aZFi", "SkmhwVVMGkXNwMYw"], "apiKey": "Fyljy5bYQdQ87hUH", "authoriseAsCapture": true, "blockedPaymentMethods": ["pRW7fNntaIEtDI6M", "bhxkQdezbmf392er", "soZ2KbMb5jal0ruZ"], "clientKey": "mBXlGSp85q6fuGfo", "dropInSettings": "5wSDHnyabk493I3p", "liveEndpointUrlPrefix": "vHKDaWhTN1qyxpUz", "merchantAccount": "WIZWJTDzWguhujw1", "notificationHmacKey": "EoR58uCVldefonHJ", "notificationPassword": "ZAiX4abmqqi90KTW", "notificationUsername": "wZk0HGeJNaBjVdMB", "returnUrl": "5kMzKycYrhr4FnNz", "settings": "dT4pWwIVXp9avUr6"}' \
    > test.out 2>&1
eval_tap $? 325 'TestAdyenConfig' test.out

#- 326 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "IydpXW0MO0eT9okl", "privateKey": "6MlWOl9feWO2bmOi", "publicKey": "kTBJHTEm5PSeyod5", "returnUrl": "L6OooYoQn9iHEqWO"}' \
    > test.out 2>&1
eval_tap $? 326 'TestAliPayConfig' test.out

#- 327 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "1cVCUIOx90FQdwLi", "secretKey": "3GOQkLtpuRNeT1CU"}' \
    > test.out 2>&1
eval_tap $? 327 'TestCheckoutConfig' test.out

#- 328 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'LEMPaOU5nukycAUl' \
    > test.out 2>&1
eval_tap $? 328 'DebugMatchedPaymentMerchantConfig' test.out

#- 329 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "kUSZKUrsxNRzF3Na", "webhookSecretKey": "UuCyQyze6zPKu5sE"}' \
    > test.out 2>&1
eval_tap $? 329 'TestNeonPayConfig' test.out

#- 330 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "89JW8UU0RsB6dvrp", "clientSecret": "mInhHYzVVlHGFSwj", "returnUrl": "by6rMYkVQnZDUAbI", "webHookId": "NRKQsxUO1YMxAndO"}' \
    > test.out 2>&1
eval_tap $? 330 'TestPayPalConfig' test.out

#- 331 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["j5O6IBwXJjgQjgLo", "JyqwFVBd1ZjaRXEd", "WgS12bSbPgOCWUog"], "publishableKey": "izeWOPUMrqgEIsMw", "secretKey": "Nbfti0LoTBcNzyoC", "webhookSecret": "Sw1t653G3ydYmGzv"}' \
    > test.out 2>&1
eval_tap $? 331 'TestStripeConfig' test.out

#- 332 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "x9bSqqyAPha5b6PQ", "key": "TPTytHeeXo7gOFVL", "mchid": "ZCBWuVIROZuqdJBi", "returnUrl": "8pkn98VtLNkaIQJf"}' \
    > test.out 2>&1
eval_tap $? 332 'TestWxPayConfig' test.out

#- 333 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "kFDhSeSGXtZU5SuI", "flowCompletionUrl": "hMSaDRp17dUWHcjr", "merchantId": 3, "projectId": 11, "projectSecretKey": "qNeKpOxPrlG9svdq"}' \
    > test.out 2>&1
eval_tap $? 333 'TestXsollaConfig' test.out

#- 334 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'siVTqPbzY1yxl7ze' \
    > test.out 2>&1
eval_tap $? 334 'GetPaymentMerchantConfig1' test.out

#- 335 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'EpmSPO6KwlJQlj9I' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["i2jARwzowk9OoiPd", "nq9KBqBwiNCsnK8C", "cO1OHbpQZtwW3EwL"], "apiKey": "re1bL4dJnkRLJbMv", "authoriseAsCapture": true, "blockedPaymentMethods": ["Sd7uMrmQ2SaLd6M7", "TM3wnJyExuo5z9RA", "cYgYZb7cAakJpqN6"], "clientKey": "eubdp49JFwXG0Evo", "dropInSettings": "SHNC97eEyhnL1QH5", "liveEndpointUrlPrefix": "AlYRAqCAC2gy1WF9", "merchantAccount": "QLNgDxAkwgfB8jIe", "notificationHmacKey": "cOx5ugNCDd6jW6fj", "notificationPassword": "tBcO3fWq9qfmBv0X", "notificationUsername": "gJB6a7uykADFpinF", "returnUrl": "cH2ZMSYijqEuMfuY", "settings": "FUS079tOpZYM1XV0"}' \
    > test.out 2>&1
eval_tap $? 335 'UpdateAdyenConfig' test.out

#- 336 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'Op0damycnTUOoMkO' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 336 'TestAdyenConfigById' test.out

#- 337 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'ppZNOkqxc42HKv5w' \
    --sandbox  \
    --validate  \
    --body '{"appId": "vtPJVsuzaBciSxwz", "privateKey": "uIpGBYHTHoSVxgQC", "publicKey": "bpZx5yMGIQ1ZxVIe", "returnUrl": "fYlKBJyQMqUEfDik"}' \
    > test.out 2>&1
eval_tap $? 337 'UpdateAliPayConfig' test.out

#- 338 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'X6yOlgZrn0I6T0hv' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 338 'TestAliPayConfigById' test.out

#- 339 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'cAFTaSWR4VOGIY7h' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "M6uhonkAe0FdTSSE", "secretKey": "luBxM47BTww3nBTV"}' \
    > test.out 2>&1
eval_tap $? 339 'UpdateCheckoutConfig' test.out

#- 340 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'mBFZ6TIs9bTi2m7e' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 340 'TestCheckoutConfigById' test.out

#- 341 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'NsYEqKkeuLWDfeFe' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "ExlOFjRh8mLFTJLv", "webhookSecretKey": "eQSDWnMQGaYRxFWi"}' \
    > test.out 2>&1
eval_tap $? 341 'UpdateNeonPayConfig' test.out

#- 342 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'a7yJ2d87XjA0ajvb' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 342 'TestNeonPayConfigById' test.out

#- 343 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '7JcGUFgp6LkyXpxJ' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "eFxhgTwyO51CUpcd", "clientSecret": "xL0a9VDhrqWCTXOx", "returnUrl": "QUpyFgZhNpOTE4to", "webHookId": "H57yr01N33p1Gha8"}' \
    > test.out 2>&1
eval_tap $? 343 'UpdatePayPalConfig' test.out

#- 344 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'HwpagvERZI6Cqhck' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 344 'TestPayPalConfigById' test.out

#- 345 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'nhecNv2Tw6YKhVrY' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["kMqXkQ7qlaJjSYEs", "eBYCFGoKpXx60GmE", "X9x2BYpyKEBQ7TW7"], "publishableKey": "lZvDbwFJJhBRdq8B", "secretKey": "gAI81k4Gr7jVVx5l", "webhookSecret": "3yrH9HR4reG0HwUX"}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateStripeConfig' test.out

#- 346 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'xQTf5YpDUGYsJBEk' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 346 'TestStripeConfigById' test.out

#- 347 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'YUrLv4qUiTkFcLBr' \
    --validate  \
    --body '{"appId": "g2JB0WiCpVBwvAff", "key": "J3btt0PpQY3Pnnic", "mchid": "80yEO8dL6Jh10XMU", "returnUrl": "GeDavCKradJmJFUs"}' \
    > test.out 2>&1
eval_tap $? 347 'UpdateWxPayConfig' test.out

#- 348 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'U418vAlmfGg9NO1Z' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 348 'UpdateWxPayConfigCert' test.out

#- 349 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id '2DvnAxH3pS3jyCkG' \
    > test.out 2>&1
eval_tap $? 349 'TestWxPayConfigById' test.out

#- 350 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'KltBNE2UbhNtH3yY' \
    --validate  \
    --body '{"apiKey": "g4Qnn2uhdw7C9Bx1", "flowCompletionUrl": "LQOTCbAPLC3iqrky", "merchantId": 73, "projectId": 37, "projectSecretKey": "FOVaewFcv9h31Yxu"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateXsollaConfig' test.out

#- 351 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'ZnoSesWpLUHjGaIc' \
    > test.out 2>&1
eval_tap $? 351 'TestXsollaConfigById' test.out

#- 352 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'ZN28gH4Cd9xTdt2K' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "LARGE", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateXsollaUIConfig' test.out

#- 353 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '5' \
    --namespace "$AB_NAMESPACE" \
    --offset '32' \
    --region 'g8tQnJOKHC16xjJZ' \
    > test.out 2>&1
eval_tap $? 353 'QueryPaymentProviderConfig' test.out

#- 354 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "kiU3N8556ll2LQWp", "region": "dESOBV7wZJsg7wSv", "sandboxTaxJarApiToken": "9lyRyTdYBUljvBzv", "specials": ["CHECKOUT", "WXPAY", "WXPAY"], "taxJarApiToken": "tfgBFikt18cQ677S", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 354 'CreatePaymentProviderConfig' test.out

#- 355 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 355 'GetAggregatePaymentProviders' test.out

#- 356 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'tDEtU2xBSEQ8rBKc' \
    > test.out 2>&1
eval_tap $? 356 'DebugMatchedPaymentProviderConfig' test.out

#- 357 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 357 'GetSpecialPaymentProviders' test.out

#- 358 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '2K6oJXxVEfnaqX8N' \
    --body '{"aggregate": "NEONPAY", "namespace": "SNjbQEqFGwnDG8kz", "region": "4kvEv6tNjGRhrmRA", "sandboxTaxJarApiToken": "xRGeIKGlCJmDXpjy", "specials": ["STRIPE", "CHECKOUT", "ADYEN"], "taxJarApiToken": "HB1y3klHuAGnidOy", "taxJarEnabled": true, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 358 'UpdatePaymentProviderConfig' test.out

#- 359 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'S0OG7ohiL2943Clr' \
    > test.out 2>&1
eval_tap $? 359 'DeletePaymentProviderConfig' test.out

#- 360 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentTaxConfig' test.out

#- 361 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "NhEdxd24ZKfvMf1T", "taxJarApiToken": "5FzYMf1jaCgZosnt", "taxJarEnabled": true, "taxJarProductCodesMapping": {"zP1vXXB92q150WEI": "etOXMt37MXy7Fp7l", "UfQqXrqGadwvKlJF": "X1ZHV9yo9Ur1hfhm", "GEKuVUZdCacRGata": "PrcgTcA71dtqtSUN"}}' \
    > test.out 2>&1
eval_tap $? 361 'UpdatePaymentTaxConfig' test.out

#- 362 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey '4zvBzGh3mhIDNuMB' \
    --end 'ZegHtB9uTCiiIoMZ' \
    --start 'CjGiOZJpUf9RpcfE' \
    > test.out 2>&1
eval_tap $? 362 'SyncPaymentOrders' test.out

#- 363 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'Qn0O6D8PGQuazAyp' \
    --storeId 'gWhTED5YmPTBUkm2' \
    > test.out 2>&1
eval_tap $? 363 'PublicGetRootCategories' test.out

#- 364 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'FyvdguCYVqFyIKh1' \
    --storeId 'YtTY4AejyQc5Dac7' \
    > test.out 2>&1
eval_tap $? 364 'DownloadCategories' test.out

#- 365 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'hSLldWx5DyniVESU' \
    --namespace "$AB_NAMESPACE" \
    --language 'grROrP1ip3jNG68D' \
    --storeId 'Byf2UMPtigq9zOQO' \
    > test.out 2>&1
eval_tap $? 365 'PublicGetCategory' test.out

#- 366 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'cAqBj0bXhOr9OHt6' \
    --namespace "$AB_NAMESPACE" \
    --language 'zx1i2W3GY7tdh8hH' \
    --storeId 'lQyMlgfkTsAThLyf' \
    > test.out 2>&1
eval_tap $? 366 'PublicGetChildCategories' test.out

#- 367 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'lAqqAP4M78smYdyg' \
    --namespace "$AB_NAMESPACE" \
    --language 'e6DroOywOxI4G6jZ' \
    --storeId 'zoYIFAvYfT8XQw2E' \
    > test.out 2>&1
eval_tap $? 367 'PublicGetDescendantCategories' test.out

#- 368 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 368 'PublicListCurrencies' test.out

#- 369 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'STEAM' \
    > test.out 2>&1
eval_tap $? 369 'GeDLCDurableRewardShortMap' test.out

#- 370 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    > test.out 2>&1
eval_tap $? 370 'GetIAPItemMapping' test.out

#- 371 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'SJ04c5MGInO4yznh' \
    --region '2YpZvvmziSSiSpXe' \
    --storeId 'WOGayfRkQvoN06Sp' \
    --appId 'NOnuSksfm7hcIFdk' \
    > test.out 2>&1
eval_tap $? 371 'PublicGetItemByAppId' test.out

#- 372 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'goaBooTawHLMxhx9' \
    --categoryPath 'nC3o6pXU5MDJLCB6' \
    --features 'WbXWIRpgjooaBVem' \
    --includeSubCategoryItem  \
    --itemType 'EXTENSION' \
    --language 'WoQXPFWFaKbDgrGk' \
    --limit '44' \
    --offset '27' \
    --region '8SVwLyS4VbHJvD0l' \
    --sortBy 'displayOrder,name,updatedAt:desc' \
    --storeId 'x4SwjCYjCHniVSn1' \
    --tags 'gYGal5NrBtT0om9O' \
    > test.out 2>&1
eval_tap $? 372 'PublicQueryItems' test.out

#- 373 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'lGzpF25qu98RhktX' \
    --region '6qwkXbCLbh8t0zPk' \
    --storeId 'QWRUlgE0kxzFMq9t' \
    --sku 'tbEHAEV7C65Ans9S' \
    > test.out 2>&1
eval_tap $? 373 'PublicGetItemBySku' test.out

#- 374 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'quNSJIay5VdUdYy9' \
    --storeId 'Y9OCSmmT3WKijbqh' \
    --itemIds 'T3uyQRXvvcUYDeWP' \
    > test.out 2>&1
eval_tap $? 374 'PublicGetEstimatedPrice' test.out

#- 375 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'Z8yhwQ0gIdj1lTJd' \
    --region 'NLmAvEdEBVAU3rbk' \
    --storeId 'v8V98cupW0L5Wsiu' \
    --itemIds 'ITRMSPOUfWQwr4PY' \
    > test.out 2>&1
eval_tap $? 375 'PublicBulkGetItems' test.out

#- 376 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["f48r66MaToxBiliy", "2vtRkpqL6KrVcNz8", "3J57t6OcYPQ5bk5I"]}' \
    > test.out 2>&1
eval_tap $? 376 'PublicValidateItemPurchaseCondition' test.out

#- 377 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'BUNDLE' \
    --limit '42' \
    --offset '55' \
    --region 'Ai3zWFGorCbncoj5' \
    --storeId 'RvEtXiKyUGdNfMiw' \
    --keyword 'gSvsTRmJsOm0wVFy' \
    --language 'HvFhRMCFJuA0DEMg' \
    > test.out 2>&1
eval_tap $? 377 'PublicSearchItems' test.out

#- 378 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'ykqqjoHTpIPMSRAu' \
    --namespace "$AB_NAMESPACE" \
    --language 'PI7mSZQ5UDm1q51P' \
    --region 'lW2HG8LAiIzuo321' \
    --storeId 'Ll90IBFsSb3FsV2P' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetApp' test.out

#- 379 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'nCs9R0D5jZEwxcow' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 379 'PublicGetItemDynamicData' test.out

#- 380 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId '6L7c3COEP4AZx70u' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'wV4XgvGTMHkXeEwu' \
    --populateBundle  \
    --region 'FJf7tbq5KikDE7hW' \
    --storeId 'vT5bzcfzIpL2pWB4' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetItem' test.out

#- 381 GetPaymentCustomization
eval_tap 0 381 'GetPaymentCustomization # SKIP deprecated' test.out

#- 382 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "XsdrxIF6kEAmKGNE", "successUrl": "mFPcUALNziO9Bz2w"}, "paymentOrderNo": "x4kDAm8XIleiujtv", "paymentProvider": "WXPAY", "returnUrl": "NdQTYoHZogW8lBvn", "ui": "iHdARadfSoctA3GY", "zipCode": "O94ZOo94gS5DHLB6"}' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetPaymentUrl' test.out

#- 383 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '5fxQ06GwTmobiBnf' \
    > test.out 2>&1
eval_tap $? 383 'PublicGetPaymentMethods' test.out

#- 384 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rnq9kOFBWhUTPiKR' \
    > test.out 2>&1
eval_tap $? 384 'PublicGetUnpaidPaymentOrder' test.out

#- 385 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3qcbHLGplYsS3jsR' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'mG3TkMTzOcBIciiK' \
    --body '{"token": "wRs1E7sH2G9MJ6F7"}' \
    > test.out 2>&1
eval_tap $? 385 'Pay' test.out

#- 386 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Rr7O15jqeKssQpme' \
    > test.out 2>&1
eval_tap $? 386 'PublicCheckPaymentOrderPaidStatus' test.out

#- 387 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'jYbzemOTURzzAOIB' \
    > test.out 2>&1
eval_tap $? 387 'GetPaymentPublicConfig' test.out

#- 388 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'arB7kcer5SvPLeQZ' \
    > test.out 2>&1
eval_tap $? 388 'PublicGetQRCode' test.out

#- 389 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'IpKFXgnsxx3c2bUs' \
    --foreinginvoice 'O7FP8RmOstZAGDgi' \
    --invoiceId 'VsV2OttwJaMxPDIJ' \
    --payload '5hFQHumFvPKqupHj' \
    --redirectResult '72TlLs964iABOgTK' \
    --resultCode 'tnaA7O35Iaytd9Cs' \
    --sessionId 'AMTZC37xPXxnfggn' \
    --status 'Z3EZp6wSAufwYirs' \
    --token '9lwvPKd925u3fFLV' \
    --type '0YeMrVaYSTRYGFzg' \
    --userId 'LZ7gEypQf2Pn9A4g' \
    --orderNo 'cbDJ0LmdnOPkIT1C' \
    --paymentOrderNo '6KGTpA7JZ6xullPR' \
    --paymentProvider 'PAYPAL' \
    --returnUrl 'SfiW9zcxmgNfTHu3' \
    > test.out 2>&1
eval_tap $? 389 'PublicNormalizePaymentReturnUrl' test.out

#- 390 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'vkZt9FgWckjNpHhM' \
    --paymentOrderNo '2ZXp4N0ROmUCTrS7' \
    --paymentProvider 'XSOLLA' \
    > test.out 2>&1
eval_tap $? 390 'GetPaymentTaxValue' test.out

#- 391 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'EcGJjOCXpuix5vnP' \
    > test.out 2>&1
eval_tap $? 391 'GetRewardByCode' test.out

#- 392 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'eTu9evbRov7Bm40C' \
    --limit '39' \
    --offset '17' \
    --sortBy 'rewardCode,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 392 'QueryRewards1' test.out

#- 393 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'xk43DGV1SCkw8U0d' \
    > test.out 2>&1
eval_tap $? 393 'GetReward1' test.out

#- 394 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 394 'PublicListStores' test.out

#- 395 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds '4FvVmPMtpRMWSQ8S,zi1IrGidRmR5BGRJ,hFwxmkGfPI3j4luX' \
    --itemIds 'QuuLtYa86kvL6cBZ,QssUUXOsXMNdvW1h,bvGenRbm3QtsY5Wa' \
    --skus 'KM5YY6pYrmeMIHLS,8egV8XhgDjbrum8U,xcutmVg8APWKxoj6' \
    > test.out 2>&1
eval_tap $? 395 'PublicExistsAnyMyActiveEntitlement' test.out

#- 396 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'MF68VuKDoklYmkyt' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 397 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId '9TXNhN8y1PVriIyv' \
    > test.out 2>&1
eval_tap $? 397 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 398 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku 'kjuiAGiXx47etMik' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 399 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'LFggYDc2FMbzZoeK,agnKf2Yifzvr9OqT,sInGzHFpFXYJtHtq' \
    --itemIds 'woIwQBeIALI8JNII,I4jrzrPsuMziNM8A,B7RRxiZH3ngnitUR' \
    --skus 'dMjZLYCaeklQcFY1,QIk1h5EKvMGd6hQ2,mHjmLu4oFlReHy0J' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetEntitlementOwnershipToken' test.out

#- 400 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "yZv7honqeiGTTqpg", "language": "TRz", "region": "BmpZIzSFUZqVR5FW"}' \
    > test.out 2>&1
eval_tap $? 400 'SyncTwitchDropsEntitlement' test.out

#- 401 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'GfH66eFCMTsLA8vY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 401 'PublicGetMyWallet' test.out

#- 402 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'VvrIAEehUV0jsjAy' \
    --body '{"epicGamesJwtToken": "VgxS54NNs3XdhMbQ"}' \
    > test.out 2>&1
eval_tap $? 402 'SyncEpicGameDLC' test.out

#- 403 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'X9D1znEWw9p7g4Us' \
    > test.out 2>&1
eval_tap $? 403 'SyncOculusDLC' test.out

#- 404 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'QCTKDh5n9yc34xF8' \
    --body '{"serviceLabel": 34}' \
    > test.out 2>&1
eval_tap $? 404 'PublicSyncPsnDlcInventory' test.out

#- 405 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'tiyZzRX8Y4rxRWZP' \
    --body '{"serviceLabels": [9, 42, 93]}' \
    > test.out 2>&1
eval_tap $? 405 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 406 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'LAQWuBJwxObZqMGx' \
    --body '{"appId": "hffy9cHrLYfftad9", "steamId": "9JDcnn7f2d8SOWP2"}' \
    > test.out 2>&1
eval_tap $? 406 'SyncSteamDLC' test.out

#- 407 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'dw6Uy88WpQalG38V' \
    --body '{"xstsToken": "Oo82aLD9jUjuDITj"}' \
    > test.out 2>&1
eval_tap $? 407 'SyncXboxDLC' test.out

#- 408 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ifWRbmtK7MTxcCWn' \
    --appType 'DLC' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'CLsjroKHPApA8GsG' \
    --features 'wyocvY9NePjLJQJX,wUApJWohXn01RB7p,u7BaONXyE5fIDbsM' \
    --itemId 'i48xOYVvEcEm53BY,MBacQBIuDVs7U0AJ,tWPRteszMTd0R5Fs' \
    --limit '35' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryUserEntitlements' test.out

#- 409 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'f9xbVfgvG617Gmxz' \
    --appId 'ClkR3M6Twpwq3nLw' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetUserAppEntitlementByAppId' test.out

#- 410 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'xnJKjOo9fvfXF1Vs' \
    --limit '17' \
    --offset '73' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryUserEntitlementsByAppType' test.out

#- 411 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'lDDJ7z4Pb5jyGID3' \
    --availablePlatformOnly  \
    --ids '9Ung1D57FjYKlJiR,Ivhej77OSPwdzMSm,rSvQdsAdTUGpd8KF' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUserEntitlementsByIds' test.out

#- 412 PublicGetUserEntitlementByItemId
eval_tap 0 412 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 413 PublicGetUserEntitlementBySku
eval_tap 0 413 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 414 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'rXKFA2gdjQCYoE8b' \
    --endDate '0CZetLfpFNyp7375' \
    --entitlementClazz 'ENTITLEMENT' \
    --limit '53' \
    --offset '15' \
    --startDate '72PKXjShM2DvesmM' \
    > test.out 2>&1
eval_tap $? 414 'PublicUserEntitlementHistory' test.out

#- 415 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'IbiQfaHxl2YUNRLR' \
    --appIds 'jgKqSSYgZnVfa8go,vttlpFAq8oebnS4Y,2zkGYTr9yJIveX52' \
    --itemIds 'r6Inl9VTJB9Al3mn,2DsHDHzSVJzhU5Z4,4zgZ1fieLdl3Y82D' \
    --skus 'Oj5kPuNRZZaUccuB,Yep9n7b17fsblalJ,rwQiU3DD0xZFH1fH' \
    > test.out 2>&1
eval_tap $? 415 'PublicExistsAnyUserActiveEntitlement' test.out

#- 416 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FLSr0O4rEZTbFDj2' \
    --appId 'L2McvCrrR7h9uKLX' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 417 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'DaRf3pxKtJbRY5lu' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'S52ZuuuI7F1xpVrc' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 418 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'oXzSOEGEDYfiGPYo' \
    --ids '2K3dN3YBOJfvV6Su,HovoQlk5wL2oXDZ2,0Bw2H4tz6KUC4jXG' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 419 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'j2G0GZ3JBYi9bBKB' \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'VMd2WDUVEQTpfyAI' \
    > test.out 2>&1
eval_tap $? 419 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 420 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'oF7qsANBbEKQrgoc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pjGNenRlDORLvP7y' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetUserEntitlement' test.out

#- 421 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'nTuXzafCqlMrrVIe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hVCf3AwIzUdQ6sTr' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["nyHKkk6Gh25tEcX9", "GegDnrYz0GFpSVdx", "FsXAp1roclyXllFi"], "requestId": "tPamSKRzDIZgSk6s", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 421 'PublicConsumeUserEntitlement' test.out

#- 422 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId '0xhMLwxgRpTSUppv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O3QG68KeD7QJQEEV' \
    --body '{"requestId": "DAg045BvtPd7ibBA", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 422 'PublicSellUserEntitlement' test.out

#- 423 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'sd51mDooH53vibq3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qcrtt8L5dIebsw7E' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 39}' \
    > test.out 2>&1
eval_tap $? 423 'PublicSplitUserEntitlement' test.out

#- 424 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'kMnJSziEA43WqIMJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'drqHIsJ98WRjqYie' \
    --body '{"entitlementId": "XRthQZvzRi7pqpaj", "metadata": {"operationSource": "INVENTORY"}, "useCount": 63}' \
    > test.out 2>&1
eval_tap $? 424 'PublicTransferUserEntitlement' test.out

#- 425 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'IgJKg9y86BgnBQtm' \
    --body '{"code": "5AilVhASFlYMVJtE", "language": "Eb", "region": "C7pF73y9eALKWinU"}' \
    > test.out 2>&1
eval_tap $? 425 'PublicRedeemCode' test.out

#- 426 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'J7bAuUJ7Fxg5Lijl' \
    --body '{"excludeOldTransactions": false, "language": "wPRb-InQo-032", "productId": "LaVRUu5VbjwPa9rY", "receiptData": "gHaxeTT3ebuaYPNB", "region": "p9wA4LxO2n7WJQFz", "transactionId": "BCD9S03D7JLsIM3V"}' \
    > test.out 2>&1
eval_tap $? 426 'PublicFulfillAppleIAPItem' test.out

#- 427 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'OMRvvqkXDMPzOB08' \
    --body '{"epicGamesJwtToken": "tpk0qhZath4b4Htw"}' \
    > test.out 2>&1
eval_tap $? 427 'SyncEpicGamesInventory' test.out

#- 428 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EYX55pJNTX1sDjSW' \
    --body '{"autoAck": false, "language": "uZyT_RkbE-JO", "orderId": "wumJTI3jlZPjoCdG", "packageName": "iIP6cB3Pj63MJXIu", "productId": "LWYb2iHHVN0ZBgvr", "purchaseTime": 16, "purchaseToken": "axkKxEDvSoi2X9Sy", "region": "gvMG8QAaWUhIguMv"}' \
    > test.out 2>&1
eval_tap $? 428 'PublicFulfillGoogleIAPItem' test.out

#- 429 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDOrx0wQXKEroyKz' \
    > test.out 2>&1
eval_tap $? 429 'SyncOculusConsumableEntitlements' test.out

#- 430 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '2reP63EVHT72Vuho' \
    --body '{"currencyCode": "GP2IFXGU5hujEfCM", "price": 0.31825610197664544, "productId": "95DEjxqhgYqmMqId", "serviceLabel": 24}' \
    > test.out 2>&1
eval_tap $? 430 'PublicReconcilePlayStationStore' test.out

#- 431 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'sgZPfuelAiZBZcQG' \
    --body '{"currencyCode": "HHGI7csI8ecZSvzX", "price": 0.8064994134898352, "productId": "OytshBcKQytQagui", "serviceLabels": [24, 39, 63]}' \
    > test.out 2>&1
eval_tap $? 431 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 432 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'a29JhfFGN964J8WO' \
    --body '{"appId": "gsAj2Rmf1DXvAIkz", "currencyCode": "TRNRVyeEGu1ICOCm", "language": "YbmN_AcfP", "price": 0.44687233465001275, "productId": "Kgy92LYqtQcDN7OM", "region": "Cehk42acy8wsWaPy", "steamId": "ppR3ztPSALA8LlV2"}' \
    > test.out 2>&1
eval_tap $? 432 'SyncSteamInventory' test.out

#- 433 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sccbVr6HSiXVzrG4' \
    --body '{"gameId": "EdKn8eypTzI497DG", "language": "oO_592", "region": "FISze88rGEr3cilJ"}' \
    > test.out 2>&1
eval_tap $? 433 'SyncTwitchDropsEntitlement1' test.out

#- 434 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'WhaW6jNsM94E2FQb' \
    --body '{"currencyCode": "6S0VmaTR7E3mkDSQ", "price": 0.1653325489371663, "productId": "gVMhLbM6H1MnNSKd", "xstsToken": "0KStITvGQtzwjGtG"}' \
    > test.out 2>&1
eval_tap $? 434 'SyncXboxInventory' test.out

#- 435 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tr238G8Aevk3k147' \
    --discounted  \
    --itemId '82W2oNo3X4m6wms9' \
    --limit '91' \
    --offset '18' \
    --status 'REFUND_FAILED' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserOrders' test.out

#- 436 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'F2GZPuyWBVH66JU1' \
    --body '{"currencyCode": "IICVNNRV4lBToTcn", "discountCodes": ["1l44ebrKEKdeo779", "x9rEFkDqb31AZzwi", "KG5yCz9jVs1lYK1M"], "discountedPrice": 87, "ext": {"ItUJgh74tyxkTR8Z": {}, "CVJtkxjBJrNeQRsq": {}, "kkKK2qxqzy4KSA5U": {}}, "itemId": "tSXWjANSWIT9TLnu", "language": "rmCp-KLlc_128", "price": 41, "quantity": 79, "region": "eLdWykhBxLFnKnSY", "returnUrl": "C9yyBYepIqtrikdA", "sectionId": "bdOT6iSRdEg8NYuc"}' \
    > test.out 2>&1
eval_tap $? 436 'PublicCreateUserOrder' test.out

#- 437 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId '4q5sJVzaKGDOULJb' \
    --body '{"currencyCode": "jHphqjHGGAhfWaXq", "discountCodes": ["a4LEWGg1r4nW4pBc", "PPaiaM1og5rxUjGP", "kA5fuVYOsMFo9tnq"], "discountedPrice": 74, "itemId": "5r9EwbIGMGJ70P9I", "price": 33, "quantity": 54}' \
    > test.out 2>&1
eval_tap $? 437 'PublicPreviewOrderPrice' test.out

#- 438 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'IK3QzkcRwFPpXGlK' \
    --userId 'R9ss8b8udl6fLkxF' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserOrder' test.out

#- 439 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nAqyvjBy0NXg7zd6' \
    --userId 'SFpkV7cAICgWFJZG' \
    > test.out 2>&1
eval_tap $? 439 'PublicCancelUserOrder' test.out

#- 440 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nNa5yOM68r4W1fDZ' \
    --userId 'L80oPQ0s7QhC8hgS' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetUserOrderHistories' test.out

#- 441 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gytNEojK3YgWH9l7' \
    --userId 'rv6XUSINd4keCeiw' \
    > test.out 2>&1
eval_tap $? 441 'PublicDownloadUserOrderReceipt' test.out

#- 442 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId '7P2PtUrPawQPaHAR' \
    > test.out 2>&1
eval_tap $? 442 'PublicGetPaymentAccounts' test.out

#- 443 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'rhjbEU5n0PNuFyKW' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'dJsGoBIjCKlD3axS' \
    > test.out 2>&1
eval_tap $? 443 'PublicDeletePaymentAccount' test.out

#- 444 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'ivItV1txLINmdHTG' \
    --autoCalcEstimatedPrice  \
    --language 'LtX6TN5ctYX1sZnY' \
    --region 'F3hWmCCIrP0lJXex' \
    --storeId 'seo2e6BCNJTTRIHD' \
    --viewId 'KdVfOUr14yZH00n8' \
    > test.out 2>&1
eval_tap $? 444 'PublicListActiveSections' test.out

#- 445 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'MsRjaB8iurBWW5jS' \
    --chargeStatus 'SETUP' \
    --itemId 'oHiDIJayvSNt8EQX' \
    --limit '39' \
    --offset '27' \
    --sku 'MbYi1yEI9ychtyhj' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 445 'PublicQueryUserSubscriptions' test.out

#- 446 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'OzoSyKttYwUUlMRG' \
    --body '{"currencyCode": "8vO0OSsJmhOJDUyy", "itemId": "ag9jBDJFJGOEiWJ8", "language": "Xm-RfZg_Cb", "region": "auYDc86pxK9KhF4K", "returnUrl": "RVPoIuzAuQNjAfvO", "source": "E2cVjFp1CeCEfaV4"}' \
    > test.out 2>&1
eval_tap $? 446 'PublicSubscribeSubscription' test.out

#- 447 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZGGwbqOB4mD3E7AF' \
    --itemId 'HqlTTkL8cmpA0sZ0' \
    > test.out 2>&1
eval_tap $? 447 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 448 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'tgeR4UV5SMZ8GUvW' \
    --userId 'ZvoCmprkv7A8MRut' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserSubscription' test.out

#- 449 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CKCsqmx2zriOGB8b' \
    --userId '5qTFp3cIxOI33nt5' \
    > test.out 2>&1
eval_tap $? 449 'PublicChangeSubscriptionBillingAccount' test.out

#- 450 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4i5hdAezedcppbuj' \
    --userId 'Zh1fYXF6R9Rz3HVP' \
    --body '{"immediate": true, "reason": "qSRiwV3UZg0UJLPM"}' \
    > test.out 2>&1
eval_tap $? 450 'PublicCancelSubscription' test.out

#- 451 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'keUwa6OVKxCMxuf0' \
    --userId 'P9r5f6fdmyi4kQnO' \
    --excludeFree  \
    --limit '65' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 451 'PublicGetUserSubscriptionBillingHistories' test.out

#- 452 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'bBtvBw81hUgtONCI' \
    --language 'oZ2rkomSj52mAIMo' \
    --storeId '6EW9QhzU8FwQtZpf' \
    > test.out 2>&1
eval_tap $? 452 'PublicListViews' test.out

#- 453 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'UoyoiUjmqOyQ7amm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FgHprdM9viFWmezr' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetWallet' test.out

#- 454 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'QOWH03zyr7kRbC31' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YMJfRiD7djt1VeOF' \
    --limit '56' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 454 'PublicListUserWalletTransactions' test.out

#- 455 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetMyDLCContent' test.out

#- 456 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'A3gvCRfoBijpbMbl' \
    --limit '68' \
    --offset '100' \
    --startTime 'EU8JYc00PA2ef1jF' \
    --state 'FULFILLED' \
    --transactionId '0B0RhxQtgVgbN8kr' \
    --userId '872hJvrOCdAEZ2RH' \
    > test.out 2>&1
eval_tap $? 456 'QueryFulfillments' test.out

#- 457 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'Lva2c4JscEQfBFZX' \
    --baseAppId 'cSXpU81S5H9XsZyv' \
    --categoryPath 'ZOFJ5RrFZYcwfQ1Q' \
    --features '2BbcjSpv6Nt1oz4t' \
    --includeSubCategoryItem  \
    --itemName 'dgfKu4bmK8kOKcEo' \
    --itemStatus 'INACTIVE' \
    --itemType 'INGAMEITEM,SEASON,CODE' \
    --limit '18' \
    --offset '88' \
    --region '2SNZKqlJZsdnY04D' \
    --sectionExclusive  \
    --sortBy 'displayOrder,displayOrder:desc,updatedAt' \
    --storeId 'pMlvRDZSIuM0OXOH' \
    --tags 'Pluvsry8AKSZxOhU' \
    --targetNamespace 'hl3Y0EshaG0uDiJN' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 457 'QueryItemsV2' test.out

#- 458 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UuxK22saWaGvrzBd' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 458 'ImportStore1' test.out

#- 459 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LvFUBZDnVrcwbsD0' \
    --body '{"itemIds": ["RDLxWgEWwoHpV8E1", "xQZLa7Kw77UpCxNy", "x1jjdxNePPAJ6Z9U"]}' \
    > test.out 2>&1
eval_tap $? 459 'ExportStore1' test.out

#- 460 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zqIhZZiK0QEG6C9w' \
    --body '{"entitlementCollectionId": "4lVRNOF1Bg6OHZzv", "entitlementOrigin": "Epic", "metadata": {"YRQz97fRWI17eNP3": {}, "Y2nWlS9Sfjh0htyV": {}, "aGj4y9ahS7h7XVlm": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "GYsLNEGrfy9qHKuf", "namespace": "Jfk0MeG3qYJr6PuC"}, "item": {"itemId": "VK9WmDAdpLVTVsj9", "itemName": "pDiyybXY4v7JRFMR", "itemSku": "aeIaQuPWPlkxeotr", "itemType": "NakKGvOSvpmZZdlN"}, "quantity": 69, "type": "CURRENCY"}, {"currency": {"currencyCode": "jV7MNTpM7fSods1z", "namespace": "dVT0aWj58Othvd3j"}, "item": {"itemId": "zMDAf40gKSizvmxt", "itemName": "s5HSQvRAPG9JoVSL", "itemSku": "rbs5niXkjpkOgRCC", "itemType": "7qfz5jV7NTRYld9F"}, "quantity": 72, "type": "CURRENCY"}, {"currency": {"currencyCode": "10goNq8uq79Du28S", "namespace": "RRAMaQFEzppeticc"}, "item": {"itemId": "kSUon7awfol07696", "itemName": "uxp5ieMjjOfFSx3A", "itemSku": "JN97kUjwiCmWQvbr", "itemType": "xQpUSnos6QiHyrcG"}, "quantity": 10, "type": "ITEM"}], "source": "PURCHASE", "transactionId": "VUuLmenyxTQVkEg5"}' \
    > test.out 2>&1
eval_tap $? 460 'FulfillRewardsV2' test.out

#- 461 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'wouUKa35m8oH9zCf' \
    --userId 'w7mCMkbvSIm7JROc' \
    --body '{"items": [{"duration": 46, "endDate": "1990-11-23T00:00:00Z", "entitlementCollectionId": "mGyrBpnTPF4VrRiF", "entitlementOrigin": "Xbox", "itemId": "MKfbAJfW4iMIC52N", "itemSku": "UedhhkME18qGpSsy", "language": "EPDWHcqfYp2EFxEa", "metadata": {"EHCGtg812NQb5Glh": {}, "8srTlTj61WdV2XUo": {}, "1BO1rE7E12Fapao5": {}}, "orderNo": "jo9nJoKEb8tHmFwL", "origin": "System", "quantity": 98, "region": "an2SrKckNxLWH6rj", "source": "EXPIRATION", "startDate": "1991-12-24T00:00:00Z", "storeId": "1lwxVTRll0GIEUJt"}, {"duration": 78, "endDate": "1978-08-27T00:00:00Z", "entitlementCollectionId": "1xBuRSv6VizgtOXZ", "entitlementOrigin": "Playstation", "itemId": "4ie3InnSA22NHTb4", "itemSku": "qXYyJUAlKlTwdJEP", "language": "oemVtmVXTs3tCu4F", "metadata": {"9IgDT2tq2V2lMzfI": {}, "QHCZ90DqQgP6ynrQ": {}, "jYH0N2loTnRa0KiQ": {}}, "orderNo": "WPxd1gqlwx9CE4Wc", "origin": "Oculus", "quantity": 40, "region": "mYtCkIgcwiDWQFgh", "source": "IAP_CHARGEBACK_REVERSED", "startDate": "1988-03-09T00:00:00Z", "storeId": "4BmtuIFllfSUnaUh"}, {"duration": 59, "endDate": "1978-12-02T00:00:00Z", "entitlementCollectionId": "x11AS2jTKoTYeHaC", "entitlementOrigin": "Other", "itemId": "kEEXlKiTIDgP7wuX", "itemSku": "QdfW99JglScoOlkk", "language": "BxiXf8OBQRqXWXQ3", "metadata": {"JdXdFz8pc0EEziE5": {}, "yIvijq9ix16vo60j": {}, "gvwV3C9hJ1kSZonK": {}}, "orderNo": "02WHGVKDcKulj3Pd", "origin": "GooglePlay", "quantity": 67, "region": "gy4G6LOpak8CYp6D", "source": "CONSUME_ENTITLEMENT", "startDate": "1978-06-14T00:00:00Z", "storeId": "n2ecc65YAFLweD9Z"}]}' \
    > test.out 2>&1
eval_tap $? 461 'FulfillItems' test.out

#- 462 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId '7U2lNkorrw9QH3rN' \
    --userId 'hDepQum4Dj7pR05R' \
    > test.out 2>&1
eval_tap $? 462 'RevokeItems' test.out


rm -f "tmp.dat"

exit $EXIT_CODE