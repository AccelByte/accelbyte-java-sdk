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
echo "1..481"

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
    --body '{"entitlementGrantList": [{"collectionId": "ee9GXhKcjmSEwdrk", "endDate": "1986-05-09T00:00:00Z", "grantedCode": "nnqKzFsLfYalUlfw", "itemId": "EQKjU7eHGebSVu0L", "itemNamespace": "Q40kepEaC4dfiOMZ", "language": "Gf", "metadata": {"Hr39pysFO3Zvc1BZ": {}, "G99LyvfvHEsJKQQe": {}, "wVLMUoAnaRcYp7FU": {}}, "origin": "IOS", "quantity": 13, "region": "fIGaffoflEIByYqe", "source": "REDEEM_CODE", "startDate": "1991-09-21T00:00:00Z", "storeId": "0meGelYF5wWaDhuk"}, {"collectionId": "U4khGG4vZFTYnPkm", "endDate": "1993-09-02T00:00:00Z", "grantedCode": "u4PWam1jxR7SETWj", "itemId": "teoc8fgvZDDhoO05", "itemNamespace": "oKqymxLD1Lcvw6T6", "language": "Mf", "metadata": {"wxxElpMYSWIeVzm7": {}, "z9noowmlTIKVowi0": {}, "RY2VN4ZONJREdUQ3": {}}, "origin": "Playstation", "quantity": 36, "region": "9F1BxNNgnke4aknc", "source": "PURCHASE", "startDate": "1980-03-21T00:00:00Z", "storeId": "wu9TmXfJWBPrx9Ns"}, {"collectionId": "8eLzYEvwSWTaLQjc", "endDate": "1981-08-20T00:00:00Z", "grantedCode": "vrK2jhsYpKPlXn77", "itemId": "AtYoFzLAATPY8P8P", "itemNamespace": "3cfoivvQxevecWw7", "language": "ORiY_DSGb-yf", "metadata": {"8rX2MVUGKSZ4GcLk": {}, "t4pK32sJxlZcCTpT": {}, "dRtCHvuk6B6XTmSL": {}}, "origin": "Playstation", "quantity": 27, "region": "vqjhbeK2qN8g6x2P", "source": "REDEEM_CODE", "startDate": "1982-12-28T00:00:00Z", "storeId": "Do5R3hLiD5sf5y1J"}], "userIds": ["BZVGLlkUetzCAWc9", "sxJNGmyt0SQDUDoW", "x1aMjgGim51T107X"]}' \
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
    --body '{"appId": "jzvjSozv6CTRDl0z", "appType": "DLC", "baseAppId": "ohhhuiTnJarYYkHB", "boothName": "DdSzBXdxapwhd5IQ", "categoryPath": "YBQuxLvPuWYvE3fs", "clazz": "Ny9Z9OhxXvCp9y7f", "displayOrder": 76, "entitlementType": "DURABLE", "ext": {"xLPBsmAUrD9L1IiD": {}, "6MlcEPhMDFzjHZ3s": {}, "IhzOx2CXKlvIomU3": {}}, "features": ["9qfx2UDcgVE7L9FK", "pIxM9n8D2eLMe3lt", "6e0MrPc4vtxk9hVK"], "flexible": false, "images": [{"as": "4bkcgepqtxjbrzte", "caption": "e7QLTGAak7Kaol01", "height": 61, "imageUrl": "mj7gyQ7XdIszGRj4", "smallImageUrl": "6COPipH1MWVTHG0q", "width": 69}, {"as": "d6mO4oI8KDqebm83", "caption": "raNBJ5y7axEkvI4o", "height": 47, "imageUrl": "GJtWf1Ybgg8rdwY9", "smallImageUrl": "bmrvHmO07KNqX9LM", "width": 55}, {"as": "IwEsdOGBXBwnzDX8", "caption": "v3xgC1Ge9PdbTTAJ", "height": 89, "imageUrl": "Gp1r0sVZ6LJAOddI", "smallImageUrl": "L2l3hPjNDKv2LWfX", "width": 34}], "inventoryConfig": {"customAttributes": {"xuNOmUSWw18T1IxV": {}, "WCxdvPL9e4P01vxP": {}, "8xj1LyEirURERnEM": {}}, "serverCustomAttributes": {"zpImW6sjAHyCK5tN": {}, "anGBrkzUvck3xTtm": {}, "OFMebS4AdlNzwog2": {}}, "slotUsed": 70}, "itemIds": ["m77TTh4gUoj8u2WR", "cLiEtzVlnkflfn7p", "HY48F1dl1q92m3iR"], "itemQty": {"lfnBAk0CwiAsR65y": 88, "1DjOsrs3CUYATdqn": 87, "cgeqzGbruNB72HHM": 20}, "itemType": "COINS", "listable": false, "localizations": {"dd7CcJUrI6MAugK5": {"description": "kypNrp2nFe9FmN86", "localExt": {"sK5LOq4ft5jGcMIC": {}, "PUYnfG6jl9U4jRet": {}, "eIMgzISomCsodJrh": {}}, "longDescription": "QW41q2OspCZbt3Ut", "title": "a5I0uGcL1koyHjCH"}, "5olYLETRpABAmO2E": {"description": "GvJ4UMS93yOxNInD", "localExt": {"ByhnoluO6ti0QP2s": {}, "siJ66OzOj84O6tgo": {}, "hjtC7bzjPpucddXJ": {}}, "longDescription": "5zifF8y959anrNSl", "title": "eywHbHig6IKWVZ77"}, "KeRWdECaFGzfZ2hx": {"description": "cJ2Fnemn7M23SzUo", "localExt": {"4hNBDh9ZFP1OW0nX": {}, "OErQPS4VsRoYIK69": {}, "yg9ADCGiXaLs2xjH": {}}, "longDescription": "kinOD975nARHCmhN", "title": "HSXuqIHsxvaUoXDm"}}, "lootBoxConfig": {"rewardCount": 46, "rewards": [{"lootBoxItems": [{"count": 46, "duration": 100, "endDate": "1974-06-05T00:00:00Z", "itemId": "TnjN6wKZGW4y3f0R", "itemSku": "9s2kndhhZhwAiLsZ", "itemType": "s4pmLDIQch4IjDq9"}, {"count": 0, "duration": 68, "endDate": "1994-05-13T00:00:00Z", "itemId": "7MJ6zU7JLMQyMWzY", "itemSku": "QCAaPJgoxGJoJaSz", "itemType": "UtY4ZD0Xtb0U4pH1"}, {"count": 82, "duration": 73, "endDate": "1994-05-31T00:00:00Z", "itemId": "Z9GiBiSAylX5cS0I", "itemSku": "eHpWCugmfOL0QQpx", "itemType": "suD8PGqku59eFJrO"}], "name": "XyDYz9vMUOPG0iHD", "odds": 0.7380631844444431, "type": "PROBABILITY_GROUP", "weight": 87}, {"lootBoxItems": [{"count": 24, "duration": 2, "endDate": "1971-09-19T00:00:00Z", "itemId": "U86FyOjApNHBVfNO", "itemSku": "URcjY3YYT9oTynmf", "itemType": "IuBWgJTNFfM8M0IW"}, {"count": 20, "duration": 29, "endDate": "1975-02-09T00:00:00Z", "itemId": "w6gYPvfn2Qt9iyq3", "itemSku": "Nyk8ncu2Z3eDHH9W", "itemType": "aVO4iKhDcJ7TCcNI"}, {"count": 38, "duration": 81, "endDate": "1992-11-05T00:00:00Z", "itemId": "PuppUxDSK8aOTGMu", "itemSku": "dcxlCV4cNbJGQ57l", "itemType": "PdinpjS2DRfGt9Gl"}], "name": "yZVQ4X67tPZSTpPq", "odds": 0.902370882509283, "type": "REWARD", "weight": 34}, {"lootBoxItems": [{"count": 19, "duration": 93, "endDate": "1979-08-05T00:00:00Z", "itemId": "ElvvDgw0ag7kSWE0", "itemSku": "Hiqm5IuLryiEXqvU", "itemType": "WDjU1G0EVjVZw1To"}, {"count": 77, "duration": 4, "endDate": "1981-12-08T00:00:00Z", "itemId": "xuHSgDOK8bjoF7bL", "itemSku": "2635KbtZTGJpqgl2", "itemType": "IzNXGTuQPIDpor7t"}, {"count": 59, "duration": 1, "endDate": "1977-10-18T00:00:00Z", "itemId": "sh4US8o4jfMANPpm", "itemSku": "ZDdMiCxmuCCVuFjS", "itemType": "1GC1d2b92B4vEgj3"}], "name": "HOmhcWm428XejRF9", "odds": 0.9160304467787199, "type": "REWARD_GROUP", "weight": 7}], "rollFunction": "CUSTOM"}, "maxCount": 27, "maxCountPerUser": 37, "name": "MrBZo0lNUBDShHD3", "optionBoxConfig": {"boxItems": [{"count": 46, "duration": 43, "endDate": "1995-06-18T00:00:00Z", "itemId": "hjnnjKMEmtbiWsAQ", "itemSku": "HbMrKYi0Zxs5SWCq", "itemType": "ZXHLLa31oQf7BULn"}, {"count": 73, "duration": 61, "endDate": "1995-03-03T00:00:00Z", "itemId": "AJsyAfeKOufV4f15", "itemSku": "NohXu6opxQGRt6Pq", "itemType": "lkL0diRhLC10ih2E"}, {"count": 87, "duration": 77, "endDate": "1973-08-09T00:00:00Z", "itemId": "Y3XCv4hdOa6FdZhN", "itemSku": "Md1onFjGRbxtABPX", "itemType": "DmgNEJBhgGq5GIDh"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 20, "fixedTrialCycles": 95, "graceDays": 39}, "regionData": {"0n0BAZkwbYkBLyO6": [{"currencyCode": "A0FqfhnaB3YxKNdO", "currencyNamespace": "TacCcJfIfXshuLUk", "currencyType": "VIRTUAL", "discountAmount": 100, "discountExpireAt": "1997-01-22T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1982-05-31T00:00:00Z", "expireAt": "1976-07-10T00:00:00Z", "price": 9, "purchaseAt": "1982-08-08T00:00:00Z", "trialPrice": 27}, {"currencyCode": "6RpmKDebNkylbynk", "currencyNamespace": "gT9vayLLiizac7Ge", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1989-11-11T00:00:00Z", "discountPercentage": 72, "discountPurchaseAt": "1976-02-02T00:00:00Z", "expireAt": "1991-03-29T00:00:00Z", "price": 41, "purchaseAt": "1981-03-24T00:00:00Z", "trialPrice": 39}, {"currencyCode": "rjF5RaJwvkWVco2L", "currencyNamespace": "To5ijlvDF8qBWCQ9", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1990-07-23T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1997-07-15T00:00:00Z", "expireAt": "1986-04-13T00:00:00Z", "price": 53, "purchaseAt": "1994-01-24T00:00:00Z", "trialPrice": 14}], "GM5anIloyj9lhbvu": [{"currencyCode": "QdW2jwKUckc794ry", "currencyNamespace": "Y91lX8DD4MYXlrJ8", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1985-09-30T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1982-06-23T00:00:00Z", "expireAt": "1973-05-23T00:00:00Z", "price": 73, "purchaseAt": "1979-04-03T00:00:00Z", "trialPrice": 43}, {"currencyCode": "7PeiMH8z8dVej8N2", "currencyNamespace": "yv6VTnOK7xAvM7tu", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1998-06-02T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1978-06-03T00:00:00Z", "expireAt": "1992-12-17T00:00:00Z", "price": 44, "purchaseAt": "1978-07-14T00:00:00Z", "trialPrice": 97}, {"currencyCode": "xSVp3Gd2TK0HzYvi", "currencyNamespace": "TgYmx82JVBRLPZ6I", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1981-04-26T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1987-02-03T00:00:00Z", "expireAt": "1975-01-30T00:00:00Z", "price": 57, "purchaseAt": "1971-02-22T00:00:00Z", "trialPrice": 37}], "uBF6Gsvvdl8jHz9x": [{"currencyCode": "7XZIjU4IK9lOLaZa", "currencyNamespace": "MphKCqTq3EVheJjo", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1986-06-19T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1985-05-30T00:00:00Z", "expireAt": "1990-04-13T00:00:00Z", "price": 70, "purchaseAt": "1993-07-09T00:00:00Z", "trialPrice": 26}, {"currencyCode": "GnNuhoJM3WWPvvCi", "currencyNamespace": "Cf33ViEdqQpoGkUW", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1984-02-10T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1988-12-24T00:00:00Z", "expireAt": "1995-08-28T00:00:00Z", "price": 5, "purchaseAt": "1999-12-04T00:00:00Z", "trialPrice": 97}, {"currencyCode": "AGv6c1ESC6hZYTYZ", "currencyNamespace": "bzf5aANNNs5kgSZZ", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1988-05-11T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1971-01-18T00:00:00Z", "expireAt": "1980-08-01T00:00:00Z", "price": 55, "purchaseAt": "1991-05-05T00:00:00Z", "trialPrice": 67}]}, "saleConfig": {"currencyCode": "mWJO5vzzXZj08a6K", "price": 83}, "seasonType": "TIER", "sectionExclusive": false, "sellable": true, "sku": "NvBQZSJPOIKrRBrY", "stackable": false, "status": "INACTIVE", "tags": ["qS2oFY76PU1AziBO", "HEAj1cT3u6Zc2Fbr", "a2LrnpZxNnLRH36b"], "targetCurrencyCode": "TFznTgDIwZIRWf6T", "targetNamespace": "3by2kYSCdnFKLc0x", "thumbnailUrl": "cTjqjdcEfU61OJYM", "useCount": 26}' \
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
    --sortBy 'displayOrder,createdAt,updatedAt:desc' \
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
    --body '{"appId": "haBKoUfiHjGmCyPs", "appType": "SOFTWARE", "baseAppId": "etWsokvx3BHuTEcz", "boothName": "r9KjQ3ttz8MTBt1x", "categoryPath": "k9IyssSA8nP5PQjp", "clazz": "zk2Tb7iYdmNZWosr", "displayOrder": 37, "entitlementType": "DURABLE", "ext": {"RWECdjWYrnulxcCK": {}, "Aru8pOaAVLDB4k3J": {}, "wkdaxR7GJpYmuYCP": {}}, "features": ["zqXRqegIUicYXXzx", "G181q9GA5DydC2D8", "UT6KOc4VPDUR9aya"], "flexible": true, "images": [{"as": "F6HtlER2txs4qrNA", "caption": "RATn6KXOutlYBbLh", "height": 77, "imageUrl": "ERMNpqWb51y5RUzv", "smallImageUrl": "MfTkPy0fGvTGgfLK", "width": 38}, {"as": "RK6UKk5ozrXA4HZH", "caption": "Nyq9odanhR1Zrm3t", "height": 14, "imageUrl": "aauufxkPHElug48T", "smallImageUrl": "gfNu0rqXUOyToLPI", "width": 89}, {"as": "T5kDTyPl3dKF7NXE", "caption": "jrJMki8jvc3P8Gwj", "height": 12, "imageUrl": "h0lciRhVZ2DeoODX", "smallImageUrl": "MzLSrzoiBnYi5UWs", "width": 46}], "inventoryConfig": {"customAttributes": {"tYlYeMoCimJySocR": {}, "vUWDOrFZKPNoN9AW": {}, "tLK9TFgi9j2XMh9W": {}}, "serverCustomAttributes": {"pifqjNjLOtNQts2y": {}, "xf6MLZJ2jZfZbpTJ": {}, "ezzriCDWXT59SRu0": {}}, "slotUsed": 58}, "itemIds": ["qUxKDc84OMIzvTSc", "dbKBsAyJMz4ILNDv", "hB4Eoes9a6XaJeRb"], "itemQty": {"zTPwD3jxF7vxRUY0": 18, "W4JprIb3CJCAtvSG": 12, "Cfa9dzOJDGCTHIOF": 20}, "itemType": "MEDIA", "listable": false, "localizations": {"xeR6d7r1SQw80JfM": {"description": "pPrSqYypRUnq5o4E", "localExt": {"TeCUYG9ccTt7Wxw8": {}, "OQ13t3uTw6zQuoZc": {}, "XQpoTOxe8y1jorNs": {}}, "longDescription": "g9ZKYCKoISyXtHzo", "title": "WGdYohxMp3uOQIyb"}, "qWfG9BJ6FVKlbYHt": {"description": "bPtaxvagSlpGgVTF", "localExt": {"6VeDAPOGBwweyFfX": {}, "EOEAEtbag82KgBgy": {}, "Cd5vjkfz3eR4DtNp": {}}, "longDescription": "129hzBw3xLUcCEt0", "title": "DzmkJq1sml5bYt76"}, "BNsi4giR9434WpKK": {"description": "dzxoufCNlFoOcWQQ", "localExt": {"y4bjmQeEweoBHTdw": {}, "Ak7ZQnbqY1cQwVEt": {}, "Ar5kKKAo9MM2Cqm8": {}}, "longDescription": "4jVi9kIpqgrzpUkN", "title": "OBWydXV0Fi02aFr8"}}, "lootBoxConfig": {"rewardCount": 58, "rewards": [{"lootBoxItems": [{"count": 59, "duration": 87, "endDate": "1971-11-13T00:00:00Z", "itemId": "pjwNOl4k8rVNrm8d", "itemSku": "rv8QD2JOe2Ntz7EF", "itemType": "vowPgIGuetxFMqXC"}, {"count": 87, "duration": 78, "endDate": "1988-08-06T00:00:00Z", "itemId": "WRlE9hqz6rjDNo4r", "itemSku": "hjxUdMM83WekqfWv", "itemType": "04vvn9bk5qr8qs2m"}, {"count": 34, "duration": 99, "endDate": "1981-12-26T00:00:00Z", "itemId": "nGAqXUjNypF6MMqW", "itemSku": "pdEJsPoaIbYz8cK5", "itemType": "jlpJdre5ur6yvWJD"}], "name": "dvM7T7PX2vamIRZH", "odds": 0.4034657886071181, "type": "REWARD", "weight": 14}, {"lootBoxItems": [{"count": 71, "duration": 17, "endDate": "1997-04-19T00:00:00Z", "itemId": "OCUoiCXNjrdQL2jd", "itemSku": "x1eIba1sB0HsJ06D", "itemType": "zfbzRYt4OVUyumBe"}, {"count": 71, "duration": 25, "endDate": "1979-03-18T00:00:00Z", "itemId": "dQGZC5kM03HHijsQ", "itemSku": "Rj7N8IAjmsonjj0Z", "itemType": "R50BQ1U6aFD3O2kX"}, {"count": 87, "duration": 38, "endDate": "1994-04-27T00:00:00Z", "itemId": "c58zgZVl4gIF7v3q", "itemSku": "bZu9M3OxqVAT4H1l", "itemType": "RZ9Z1JBrHRzEOtIx"}], "name": "zPqb6n73m0jiaDH8", "odds": 0.9409777075952662, "type": "PROBABILITY_GROUP", "weight": 26}, {"lootBoxItems": [{"count": 91, "duration": 35, "endDate": "1972-06-03T00:00:00Z", "itemId": "5y0X48eT7Mluexk8", "itemSku": "7b9Z5BTsEA3EdmW8", "itemType": "saabP4xRowfNojzP"}, {"count": 64, "duration": 71, "endDate": "1992-10-21T00:00:00Z", "itemId": "v0prR3OEey0MkZwS", "itemSku": "6TYwNN3UYhic03qG", "itemType": "Eg5fNzBVrjo3g8Cf"}, {"count": 88, "duration": 45, "endDate": "1972-06-10T00:00:00Z", "itemId": "U66yJaj4ovoKWE4E", "itemSku": "W0sw8v5peiuxoBJA", "itemType": "TauyD3XCXVMiyEvM"}], "name": "f9yilUEujk6oqYo1", "odds": 0.5395738742712982, "type": "REWARD_GROUP", "weight": 79}], "rollFunction": "DEFAULT"}, "maxCount": 93, "maxCountPerUser": 17, "name": "FzwdOMdupwD4O3uN", "optionBoxConfig": {"boxItems": [{"count": 3, "duration": 11, "endDate": "1972-09-26T00:00:00Z", "itemId": "IDcIyvZbOy1T4hfw", "itemSku": "kuVykH4RpfmjIXFG", "itemType": "Z5PKdbabJIkNnt9P"}, {"count": 94, "duration": 9, "endDate": "1976-02-25T00:00:00Z", "itemId": "m08luh4dpPRMDbUX", "itemSku": "BWTbpAogG2wlZkLh", "itemType": "uU5FI8NijFI0GKwJ"}, {"count": 60, "duration": 45, "endDate": "1987-02-15T00:00:00Z", "itemId": "scjwrizsFUgYwbaL", "itemSku": "vqvQ2NbmDITuymTB", "itemType": "jn3d2sFzMS3QaVjZ"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 55, "fixedTrialCycles": 8, "graceDays": 48}, "regionData": {"eHdvphas9S7ivHEo": [{"currencyCode": "LbUMM47f1UreUpxE", "currencyNamespace": "kXIbE1ETzRJZKMav", "currencyType": "VIRTUAL", "discountAmount": 18, "discountExpireAt": "1977-04-05T00:00:00Z", "discountPercentage": 37, "discountPurchaseAt": "1999-09-10T00:00:00Z", "expireAt": "1988-12-08T00:00:00Z", "price": 1, "purchaseAt": "1977-03-07T00:00:00Z", "trialPrice": 8}, {"currencyCode": "YN27bojDVaZLpx4k", "currencyNamespace": "EWYkO6KrKUMhJrAS", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1974-06-24T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1974-09-08T00:00:00Z", "expireAt": "1977-03-12T00:00:00Z", "price": 100, "purchaseAt": "1987-10-27T00:00:00Z", "trialPrice": 31}, {"currencyCode": "SSrF35anDGvur19V", "currencyNamespace": "18oIrUKXttgAI2Qd", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1973-04-10T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1978-12-11T00:00:00Z", "expireAt": "1986-06-15T00:00:00Z", "price": 13, "purchaseAt": "1996-01-25T00:00:00Z", "trialPrice": 2}], "8EMspOs8nkic9gj5": [{"currencyCode": "vyUMAAmIHYbsxG5N", "currencyNamespace": "066FXb88SbLOa21D", "currencyType": "REAL", "discountAmount": 73, "discountExpireAt": "1993-09-11T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1994-04-07T00:00:00Z", "expireAt": "1988-02-04T00:00:00Z", "price": 7, "purchaseAt": "1996-12-09T00:00:00Z", "trialPrice": 73}, {"currencyCode": "HyoX4VnO2LpBU08w", "currencyNamespace": "fnlHBXFIqFUmgUSM", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1975-06-16T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1987-05-30T00:00:00Z", "expireAt": "1989-05-19T00:00:00Z", "price": 94, "purchaseAt": "1974-04-13T00:00:00Z", "trialPrice": 21}, {"currencyCode": "00nml5BidsK9dCEz", "currencyNamespace": "hVnOv0PQbVIaKiHf", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1973-04-27T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1995-08-28T00:00:00Z", "expireAt": "1971-08-06T00:00:00Z", "price": 29, "purchaseAt": "1993-06-06T00:00:00Z", "trialPrice": 66}], "H7r1ta3m7jK5pxe8": [{"currencyCode": "2pgFiAS6piIzmc8r", "currencyNamespace": "KrKEPGSAcong6eNE", "currencyType": "VIRTUAL", "discountAmount": 96, "discountExpireAt": "1977-02-13T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1971-03-25T00:00:00Z", "expireAt": "1981-03-15T00:00:00Z", "price": 6, "purchaseAt": "1980-03-06T00:00:00Z", "trialPrice": 49}, {"currencyCode": "1Ctccv9Gv4tOcbnu", "currencyNamespace": "Cqf0lm6WBkIzjoSV", "currencyType": "REAL", "discountAmount": 52, "discountExpireAt": "1981-04-02T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1983-04-16T00:00:00Z", "expireAt": "1979-11-14T00:00:00Z", "price": 44, "purchaseAt": "1985-06-04T00:00:00Z", "trialPrice": 19}, {"currencyCode": "lSLfU7HByGXPMqxj", "currencyNamespace": "4hBgVY3YAxZLKbcO", "currencyType": "REAL", "discountAmount": 67, "discountExpireAt": "1983-03-14T00:00:00Z", "discountPercentage": 84, "discountPurchaseAt": "1979-01-16T00:00:00Z", "expireAt": "1973-12-29T00:00:00Z", "price": 87, "purchaseAt": "1973-03-12T00:00:00Z", "trialPrice": 30}]}, "saleConfig": {"currencyCode": "U3Idi55jNrGNT2VH", "price": 94}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "IT5FwwHj0Ur5F2PW", "stackable": false, "status": "ACTIVE", "tags": ["XAn3bWQF6QcAiJpX", "IrgroixptZhckUTG", "D81xhNP4t6kYBUjy"], "targetCurrencyCode": "kcBOE4qMcH1Kyi8Z", "targetNamespace": "FvGcV8DY0XOkDstx", "thumbnailUrl": "ZcY1HgAnZV4IOglV", "useCount": 77}' \
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
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 18, "code": "1Oqn59tEGm9NYeUT", "comparison": "isGreaterThanOrEqual", "name": "0nx8TqSZdZ5C8mFI", "predicateType": "EntitlementPredicate", "value": "nvzEqBNMF9CZvPxT", "values": ["DFjLKFrepy56eW1k", "5zbreMc9fBoU3RHN", "mb15QeIQF51c4MqJ"]}, {"anyOf": 52, "code": "joBAhAlJGI2YYb6a", "comparison": "is", "name": "BzAzPkt1efGJeJax", "predicateType": "StatisticCodePredicate", "value": "2tHxDb06ZFy3uglS", "values": ["HD6LCgdFxRGj00RT", "p2UxvF2uLXWilRD7", "6LvcnGMJbJIYLssM"]}, {"anyOf": 44, "code": "wKVXGPhEJsc7rZpx", "comparison": "excludes", "name": "DX6gmDfNfPGYYSTu", "predicateType": "SeasonPassPredicate", "value": "POKFLxIwKssw647Y", "values": ["U226l07jPlcYaqYM", "7YfBmhjI9Y28qVce", "wDudnGRufOUGfMjT"]}]}, {"operator": "or", "predicates": [{"anyOf": 96, "code": "r2ccp7R7OqPqIjS4", "comparison": "is", "name": "NXzNX6TGh4UdEwee", "predicateType": "StatisticCodePredicate", "value": "8962e6gtn5pUARJM", "values": ["1T8QwMNOAzXmyHEV", "4g9P6a280S5RNB5d", "VCsB7xL4axSPgPCi"]}, {"anyOf": 47, "code": "T7cBP0918JaEBQBP", "comparison": "isGreaterThan", "name": "6LUnBBR84iAO7sBQ", "predicateType": "SeasonTierPredicate", "value": "76U1EIcklttmrpgF", "values": ["gR70eNLHkVrEFd8x", "5szl0sMY8es36r1F", "ArWJuCAIfNBSHgpF"]}, {"anyOf": 81, "code": "7X9fHr6WvBxmBvNj", "comparison": "excludes", "name": "ktaDf9B22HGgxakP", "predicateType": "SeasonTierPredicate", "value": "Cu1HFaj6Vxs3GuA4", "values": ["ELJFaIaEMW5bhJyL", "S1dS7H7yIS7b5TSD", "RIoMg7Dc5APzfzXD"]}]}, {"operator": "or", "predicates": [{"anyOf": 60, "code": "ZTdFfC8x5aHLsXHl", "comparison": "isGreaterThan", "name": "xaupnTTq9ihZkvFK", "predicateType": "EntitlementPredicate", "value": "qgFddYvifGHawNx6", "values": ["lpCI8DhjlxUyrs3O", "rKXDIjYC4df9qswS", "yhniEHLbEQKc0aUv"]}, {"anyOf": 91, "code": "E1wJhfogWg2Apm0s", "comparison": "isLessThanOrEqual", "name": "UcQBxMSdOOsn2Nd8", "predicateType": "SeasonPassPredicate", "value": "pa19GJDK46Eehx7x", "values": ["IK9D2bTcgaKoccaS", "agpS6A5mkufBpWVx", "asqMY9aulsL6NOV5"]}, {"anyOf": 46, "code": "BUS6uwWrCQt86Jrg", "comparison": "isLessThanOrEqual", "name": "tLAJWpcyNkUvqn6e", "predicateType": "SeasonPassPredicate", "value": "r6FNbKJ05Orya6LS", "values": ["v46sXvpOjrpRo4mY", "SUlugIAknXcSaVYc", "AYp7qSiDvsfMUOpW"]}]}]}}' \
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
./ng net.accelbyte.sdk.cli.Main platform getPaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 154 'GetPaymentCallbackConfig' test.out

#- 155 UpdatePaymentCallbackConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentCallbackConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"dryRun": true, "notifyUrl": "SO8JyX4IE1z3rDwZ", "privateKey": "1HKsOpyq8agQuz86"}' \
    > test.out 2>&1
eval_tap $? 155 'UpdatePaymentCallbackConfig' test.out

#- 156 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 156 'GetPaymentMerchantConfig' test.out

#- 157 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["nc6jLF9DIW2ncJJK", "pqmgvUTr8XAtpOqU", "QxzqJZiWi3KQffT5"]}' \
    > test.out 2>&1
eval_tap $? 157 'UpdatePaymentDomainWhitelistConfig' test.out

#- 158 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Tn61A1xW6okIqmd8' \
    --externalId '7ir9op4YfGTno5oH' \
    --limit '52' \
    --notificationSource 'PAYPAL' \
    --notificationType '0xfWddACyHSmo4KX' \
    --offset '69' \
    --paymentOrderNo 'TPO3K1k5ZM8btmGs' \
    --startDate 'gXNXbpqxh76Af5JS' \
    --status 'PROCESSED' \
    > test.out 2>&1
eval_tap $? 158 'QueryPaymentNotifications' test.out

#- 159 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'jw2fE2g6jXV7oai2' \
    --limit '29' \
    --offset '25' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 159 'QueryPaymentOrders' test.out

#- 160 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "5pbgEt39uJQpgEtc", "currencyNamespace": "hTe3nt7t9ztprSfW", "customParameters": {"9OutADrNGBWSJ1zQ": {}, "KxVmRTawjiZPMoZZ": {}, "cyGEHxAKDQher3us": {}}, "description": "ApPdJPn9eIdhIBvT", "extOrderNo": "TupABJ4RwH3EdKmY", "extUserId": "tbqQHNfIZwrMxf3E", "itemType": "COINS", "language": "alYx", "metadata": {"kLT0Lb85nmpdN26B": "Y5YI0jeO2zMDSy4k", "yqyKgrtEPdXXlt8g": "eCdiXu3iNvn7vLZ7", "h6alhJNGZF07lsPP": "5OfHbXzWnVO2U4uy"}, "notifyUrl": "zZo1rj0ZrLQjk4Vo", "omitNotification": true, "platform": "fIksth24cZBpdDFf", "price": 44, "recurringPaymentOrderNo": "OdJagEmTuaxlxgyw", "region": "kbdOsyxX1tfW488o", "returnUrl": "YUT4jyCVJ0V8obTl", "sandbox": false, "sku": "Thz4bm41oIcV33yj", "subscriptionId": "PxibDjfF7JkjCVpZ", "targetNamespace": "KMxkFkBtXMU6KRIm", "targetUserId": "5xBoIi99ctgFXasx", "title": "p5h780ktjQw2yXza"}' \
    > test.out 2>&1
eval_tap $? 160 'CreatePaymentOrderByDedicated' test.out

#- 161 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'QWaF2PqUfbpMpRl6' \
    > test.out 2>&1
eval_tap $? 161 'ListExtOrderNoByExtTxId' test.out

#- 162 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'xRyV19cborUHeCpq' \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentOrder' test.out

#- 163 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'nZ5NW623WWn2ZJY3' \
    --body '{"extTxId": "QvRa7CDRTcsAHzD3", "paymentMethod": "dZyyWbUQpbcv3Iwm", "paymentProvider": "ADYEN"}' \
    > test.out 2>&1
eval_tap $? 163 'ChargePaymentOrder' test.out

#- 164 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'DgS2SVEo5M80LLbk' \
    --body '{"description": "u9GYH4ijqOVM50tC"}' \
    > test.out 2>&1
eval_tap $? 164 'RefundPaymentOrderByDedicated' test.out

#- 165 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'qkZfsSxAbDJ7sHCL' \
    --body '{"amount": 42, "currencyCode": "jml6BpCODWGOLMmC", "notifyType": "CHARGE", "paymentProvider": "PAYPAL", "salesTax": 9, "vat": 26}' \
    > test.out 2>&1
eval_tap $? 165 'SimulatePaymentOrderNotification' test.out

#- 166 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'lXYyNrXweiCnDldR' \
    > test.out 2>&1
eval_tap $? 166 'GetPaymentOrderChargeStatus' test.out

#- 167 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'PRfd6mLZ0GTJwEjo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "ZrRtaeWKMC8wsOBy", "serviceLabel": 88}' \
    > test.out 2>&1
eval_tap $? 167 'GetPsnEntitlementOwnership' test.out

#- 168 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'UMa8ymxtEFLwELCY' \
    --body '{"delegationToken": "2vIddlxnA1VynioJ", "sandboxId": "cAPwVHUGcs1ACMvo"}' \
    > test.out 2>&1
eval_tap $? 168 'GetXboxEntitlementOwnership' test.out

#- 169 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 169 'GetPlatformEntitlementConfig' test.out

#- 170 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedPlatformOrigins": ["System", "System", "IOS"]}' \
    > test.out 2>&1
eval_tap $? 170 'UpdatePlatformEntitlementConfig' test.out

#- 171 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 171 'GetPlatformWalletConfig' test.out

#- 172 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    --body '{"allowedBalanceOrigins": ["System", "Nintendo", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 172 'UpdatePlatformWalletConfig' test.out

#- 173 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
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
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": false, "strategy": "CUSTOM"}}' \
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
    --endTime 'M7ixq8Tjnxp5Cl8g' \
    --limit '14' \
    --offset '27' \
    --source 'DLC' \
    --startTime '0Oia336uiiMTAduc' \
    --status 'SUCCESS' \
    --transactionId 'usO6EyVqstpgZpbz' \
    --userId '77y88rUFum2ZcA8i' \
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
    --body '{"appConfig": {"appName": "KcF0bkfjcTEFXcTw"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "1636nbfM3J9G40Y6"}, "extendType": "CUSTOM"}' \
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
    --body '{"description": "bCo941ALznQuHVsk", "eventTopic": "fCjUK8GeX4Q0B2Cj", "maxAwarded": 71, "maxAwardedPerUser": 29, "namespaceExpression": "qWK09l4wkrzahXR1", "rewardCode": "sDEDVKDINE3HjCiV", "rewardConditions": [{"condition": "R1dQ8kuhb4pUwnGp", "conditionName": "tHUplxzaDa9PDwhu", "eventName": "31d8eOdtrfq6ECDD", "rewardItems": [{"duration": 79, "endDate": "1991-09-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "kuLs9gNpNon6DKW9", "quantity": 54, "sku": "kDP6d3nuUZ41mSeS"}, {"duration": 44, "endDate": "1993-08-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "PMGLdbYEknHPKrZ7", "quantity": 93, "sku": "h6dtPK4fVHLMvrCs"}, {"duration": 69, "endDate": "1980-02-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "YxH2Up9VthPjFrK7", "quantity": 69, "sku": "LiM573TdtWjfVciu"}]}, {"condition": "LnLsBKGsALPuCOyp", "conditionName": "hUUAV95708zaP0wp", "eventName": "ZgQEvFzox9wHocX3", "rewardItems": [{"duration": 60, "endDate": "1988-12-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Rx3NkKQBYrlUaMiF", "quantity": 62, "sku": "PM51z7i0wQ9egK2t"}, {"duration": 63, "endDate": "1989-09-08T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "2lTviKbOgVuN3nhk", "quantity": 27, "sku": "TN98j4P2AGeidXRR"}, {"duration": 28, "endDate": "1988-10-11T00:00:00Z", "identityType": "ITEM_ID", "itemId": "AJfKVjOn6rtILNJV", "quantity": 43, "sku": "pDqm31AZSRkuw6q8"}]}, {"condition": "FgqG46RsFK7eYlSU", "conditionName": "3vYcHZZjFegVnZOn", "eventName": "0tk4IATSIefcqNEn", "rewardItems": [{"duration": 32, "endDate": "1988-01-20T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Dv6b8WtaMVvLbG04", "quantity": 75, "sku": "C9PQlFAGbMtEybfc"}, {"duration": 54, "endDate": "1985-04-04T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "0mnsAkRT2k0AzdgI", "quantity": 41, "sku": "NMuqZTHwo1IAJQpb"}, {"duration": 11, "endDate": "1980-03-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "ZeaSHwQuiH3Ozu4G", "quantity": 79, "sku": "bXxp0gYZyF9fJBJk"}]}], "userIdExpression": "SOrF9Dg4FcDwBGyB"}' \
    > test.out 2>&1
eval_tap $? 182 'CreateReward' test.out

#- 183 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'iHewZkwEeuzBBRSk' \
    --limit '27' \
    --offset '0' \
    --sortBy 'rewardCode,namespace:desc' \
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
    --rewardId 'W4GkHG5OIVuGv47X' \
    > test.out 2>&1
eval_tap $? 186 'GetReward' test.out

#- 187 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'JpkMiopQrVL3ZZTV' \
    --body '{"description": "xqa9XM2gY14iWk12", "eventTopic": "Jffk8dwKNPUOHNZx", "maxAwarded": 79, "maxAwardedPerUser": 30, "namespaceExpression": "L3yoBM9qxd6PWz7s", "rewardCode": "VnMxge2inL8fBFP1", "rewardConditions": [{"condition": "ABaIKrEt8d3o7cTS", "conditionName": "9OIIMErnNTLXHrsO", "eventName": "FsbhRow4iaYKy0Ij", "rewardItems": [{"duration": 37, "endDate": "1998-08-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "gbJ37DN2lDvdh7ok", "quantity": 68, "sku": "QPWX1NPO5Wn7rNG8"}, {"duration": 35, "endDate": "1986-09-24T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "p7Fadvo5EzpX0Itt", "quantity": 37, "sku": "x6K17GL1CrO4ZuoG"}, {"duration": 26, "endDate": "1994-06-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "dncQkcZb8cWdVH9b", "quantity": 46, "sku": "Izg8pbjnt1iBV8Dp"}]}, {"condition": "bjGts4UZDTfhAyZK", "conditionName": "hqilty9NVlgxUmnf", "eventName": "dOAmu1dX1NqD20RU", "rewardItems": [{"duration": 44, "endDate": "1982-10-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "58pQswqKLutINusO", "quantity": 38, "sku": "NesGiVnt9p2to7Yj"}, {"duration": 0, "endDate": "1978-05-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "oDE1K0SvGrMYwPmP", "quantity": 60, "sku": "C2LfL2m5rP2A20t6"}, {"duration": 11, "endDate": "1976-04-27T00:00:00Z", "identityType": "ITEM_ID", "itemId": "PH94SUinY5diUlqg", "quantity": 44, "sku": "vmD0ekycMKlwJTNL"}]}, {"condition": "2UCWUtaAD7ZZx1ie", "conditionName": "fATWcDSqGYRMdz07", "eventName": "xEJ40epssgJJC3CX", "rewardItems": [{"duration": 15, "endDate": "1996-05-02T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "cDOsRzBkf9A6HjCn", "quantity": 65, "sku": "BMtoOeLfMCYxSeeJ"}, {"duration": 84, "endDate": "1976-04-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "siMup01kyaFwwD7w", "quantity": 10, "sku": "GhYvXYMIyaEMEqOp"}, {"duration": 45, "endDate": "1984-02-01T00:00:00Z", "identityType": "ITEM_ID", "itemId": "tb82b96rsH73hRfD", "quantity": 12, "sku": "g3oeuHiNyLkfPQPm"}]}], "userIdExpression": "jUkvSs5YmIejozmG"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateReward' test.out

#- 188 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId '5HlrIfMAvvpkAHRJ' \
    > test.out 2>&1
eval_tap $? 188 'DeleteReward' test.out

#- 189 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'HZyfrXZmiJX4CjKC' \
    --body '{"payload": {"eIRIr997KKpJXTLb": {}, "YWpqeXjaf1f5fjNM": {}, "ZjKJ05puX3197WrM": {}}}' \
    > test.out 2>&1
eval_tap $? 189 'CheckEventCondition' test.out

#- 190 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'nJtovSMFw8X4zxbd' \
    --body '{"conditionName": "fXgunt1oMNZ68eov", "userId": "HSH3xV3URIRVDYBd"}' \
    > test.out 2>&1
eval_tap $? 190 'DeleteRewardConditionRecord' test.out

#- 191 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end '6hMB0l7sg7IfMH5T' \
    --limit '41' \
    --offset '16' \
    --start 'ky1ZYvyeHmfoFkUD' \
    --storeId 'P864shbnQ3bVvuvp' \
    --viewId 'sDJXPCWkX4Kpi8CJ' \
    > test.out 2>&1
eval_tap $? 191 'QuerySections' test.out

#- 192 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '88aMPGFFAQZbfbmV' \
    --body '{"active": true, "displayOrder": 74, "endDate": "1971-03-15T00:00:00Z", "ext": {"Pv3F7S0wCVlYQi9c": {}, "fMCeNnu6OIG1PPLR": {}, "DEXLXZWXvqNCHvNp": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 36, "itemCount": 79, "rule": "SEQUENCE"}, "items": [{"id": "jMzguq6HFIqaqwH9", "sku": "J6JLb5f3SBMyJUdw"}, {"id": "EBRrHAWUFqTooGGn", "sku": "PEgY0t7QQWl42byO"}, {"id": "wXgKyPhXmcysae8H", "sku": "pWH4xiz3fWthJSu2"}], "localizations": {"pUIIuPLFAtcWhjAP": {"description": "57QbWvSSp71zEPPf", "localExt": {"mAQiqRRC2caquMRt": {}, "QOILcaDqUITBHQR5": {}, "ISNoFR3GUxdMuvmL": {}}, "longDescription": "0UBfwzaaeP3Wd0Wr", "title": "b8s3GW0CY0vAfbq8"}, "xoCurq4lpHXrbVBh": {"description": "60NUA2aKQwnXrmi6", "localExt": {"ya8u4sQPvaf1Acwe": {}, "R7tJW3MLMob1hUnI": {}, "zIpUM8KK1kGFN0NU": {}}, "longDescription": "NGKxdlAUDFQuGPzA", "title": "uT7M6OBrNwioKnXP"}, "VZaDcXsV1TnsZioD": {"description": "iBgprzahPB0FKMa0", "localExt": {"YeyNBQWUHDBnBeeP": {}, "kqg6Zt1Lr5BlO8K6": {}, "LH4dSaa8XYHug51Z": {}}, "longDescription": "TogG0N7Hvnuq1kJ1", "title": "kpHcQtnIc9z70LFQ"}}, "name": "MI0oZuEjY0rNBbbB", "rotationType": "FIXED_PERIOD", "startDate": "1980-08-01T00:00:00Z", "viewId": "xAvtRQvqJacXR2Rf"}' \
    > test.out 2>&1
eval_tap $? 192 'CreateSection' test.out

#- 193 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId '4noXDFaEUkPUBnB0' \
    > test.out 2>&1
eval_tap $? 193 'PurgeExpiredSection' test.out

#- 194 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ZEJH3ebM71Tg922x' \
    --storeId 'iBgHSka0Pz7I1WkI' \
    > test.out 2>&1
eval_tap $? 194 'GetSection' test.out

#- 195 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'a0oZ1nXpW1l70pcZ' \
    --storeId 'gIn4lPghHyMEHBzA' \
    --body '{"active": true, "displayOrder": 38, "endDate": "1972-03-17T00:00:00Z", "ext": {"yW10NkJFQxuMHnfO": {}, "lX6HYVEiaereFCPJ": {}, "U2wEzUYUTmZ8JSMe": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 84, "itemCount": 88, "rule": "SEQUENCE"}, "items": [{"id": "ocp400RZe8Bzx9aG", "sku": "EI22BTCZs97TJI8G"}, {"id": "PrM24F3celFgM62H", "sku": "QtgzQhO3nR8j8DlP"}, {"id": "6OGbn8vmfMYGLt1A", "sku": "jKhh3JMX7xSrz1EH"}], "localizations": {"6X2SM3xzsNrJzWBc": {"description": "dFlo7oAsOlfLB1J1", "localExt": {"9b5rTfiL2P3r1a8K": {}, "IJH33aKkPuWD59Mg": {}, "Ty1HA58Jt5NaROjS": {}}, "longDescription": "KFEuZo2ElXYSS4ez", "title": "BRSiOyReviDaxlPd"}, "hwmcH03yoMxzRR6x": {"description": "d9rTh3ureaIbxM3W", "localExt": {"ev9pZQjWAN0tny16": {}, "ZHZtuSJGQCrM7JEM": {}, "RPkdTcAzkIlndN5x": {}}, "longDescription": "eayr3vUKMuIiz2Mi", "title": "AAKcvAXnxnH0QIho"}, "JRY807VmBT4wZXQZ": {"description": "ZrSsuYiIPei0pXgl", "localExt": {"JYnKkoCAZuolAWnx": {}, "kImVbDP0QX31gI7V": {}, "mnGIRMvXe6BiphIF": {}}, "longDescription": "e2bzr6qQw6fSESkM", "title": "19OPMBb12gpmShlm"}}, "name": "It2nfhUaZGqjslu5", "rotationType": "NONE", "startDate": "1983-10-12T00:00:00Z", "viewId": "2E6AacmZRXZm626P"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateSection' test.out

#- 196 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'OXWVj3KP1mX0iYHX' \
    --storeId 'BU3Uk2tQm307IORT' \
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
    --body '{"defaultLanguage": "yHnLYDAAg1YA4kZU", "defaultRegion": "RmoGgxVRMPf8g1rb", "description": "hfIMStMnSqrKWYOu", "supportedLanguages": ["ITlYS2RYaD9WNKGh", "bLhjz1v0RBIO2rkJ", "GmPaK6HEVIQJd393"], "supportedRegions": ["0TGewjRyfo4nWVZZ", "bKFsKOmgEhjH2wFz", "CpxxJLfAg5cFT0gH"], "title": "AkltcR3eHFbiAluH"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateStore' test.out

#- 199 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
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
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["xrkPPdg3pXjmtpNf", "CrIj9ntYo3dupUHN", "u8abrVVOKxr9Pa31"], "idsToBeExported": ["5FKDjG2ApSV94Jy6", "yCSXBqJqjAbVwSao", "j1ugjr8mPkr3tZ50"], "storeId": "6ERSVy5M3rrkxu0U"}' \
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
    --storeId '9h9gCNVZxHGxhZqN' \
    > test.out 2>&1
eval_tap $? 207 'GetStore' test.out

#- 208 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'XJ6JXSh0Z3SWISs1' \
    --body '{"defaultLanguage": "dYrJKmx1BT6iLFQe", "defaultRegion": "jNZJNF2hm0TqBQpr", "description": "Hn3whPKU5abnqw8f", "supportedLanguages": ["Fa30pVbhr1BHh1ar", "ZAyuLcZoEkPpqKhP", "2jWnRTglw0gdWoE4"], "supportedRegions": ["esuiDrquccz4J6fF", "QezJ5E3iYHIknvPc", "JkjRevVYfiExpAgo"], "title": "K9YDq1x3dkbJFDEB"}' \
    > test.out 2>&1
eval_tap $? 208 'UpdateStore' test.out

#- 209 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'EOOvJ5BKeipIldsg' \
    > test.out 2>&1
eval_tap $? 209 'DeleteStore' test.out

#- 210 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'B4hOxb88WgKSLIpn' \
    --action 'CREATE' \
    --itemSku 'zigzHcRuJgYaj4I8' \
    --itemType 'MEDIA' \
    --limit '36' \
    --offset '53' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt,updatedAt' \
    --status 'UNPUBLISHED' \
    --type 'VIEW' \
    --updatedAtEnd '0JEKNoMtHvjM7X1f' \
    --updatedAtStart 'jzknv2HZMIL2P2bh' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 210 'QueryChanges' test.out

#- 211 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId '14LroFTnAuujPeP9' \
    > test.out 2>&1
eval_tap $? 211 'PublishAll' test.out

#- 212 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'N0vdVB5a2XkS3XQf' \
    > test.out 2>&1
eval_tap $? 212 'PublishSelected' test.out

#- 213 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MuzZh4AhZRe2hgU5' \
    > test.out 2>&1
eval_tap $? 213 'SelectAllRecords' test.out

#- 214 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '6xtyJtnbTDXu7Fbl' \
    --action 'CREATE' \
    --itemSku 'w5QwVKWNy2tnF2Mi' \
    --itemType 'BUNDLE' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd '8rcwojLRjhcaJ56n' \
    --updatedAtStart 'GlYZ2tod2BGBXjNy' \
    > test.out 2>&1
eval_tap $? 214 'SelectAllRecordsByCriteria' test.out

#- 215 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RCtPOr1FU3QZy3gd' \
    --action 'DELETE' \
    --itemSku 'cNeTflyvUh3w5Ztf' \
    --itemType 'INGAMEITEM' \
    --type 'ITEM' \
    --updatedAtEnd 'lXuzu3m9u67JjCDw' \
    --updatedAtStart 'g186hGWKfO9MnoT3' \
    > test.out 2>&1
eval_tap $? 215 'GetStatistic' test.out

#- 216 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 't99HmcxzjDhTrcBK' \
    > test.out 2>&1
eval_tap $? 216 'UnselectAllRecords' test.out

#- 217 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'tU956hOg8oukDVdw' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'eG0sFHxTHa2k60Sz' \
    > test.out 2>&1
eval_tap $? 217 'SelectRecord' test.out

#- 218 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'CqUgq1gLbcIMevTm' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'C631p7q794bu49lI' \
    > test.out 2>&1
eval_tap $? 218 'UnselectRecord' test.out

#- 219 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NFTtERAXT2h3hcQ2' \
    --targetStoreId 'wV3ZbBTnNQnVUhA5' \
    > test.out 2>&1
eval_tap $? 219 'CloneStore' test.out

#- 220 ExportStore
eval_tap 0 220 'ExportStore # SKIP deprecated' test.out

#- 221 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'WnzVZdj8tsyzC4Qa' \
    --end 'LXp3o4TDraEEaDNJ' \
    --limit '2' \
    --offset '85' \
    --sortBy 'Vd20FVHevCjthJUb' \
    --start '7jKuMrFaoLulzp3s' \
    --success  \
    > test.out 2>&1
eval_tap $? 221 'QueryImportHistory' test.out

#- 222 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ZxImVK5yh2LcM8La' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'MW0ByjsRUrAHNRkI' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 222 'ImportStoreByCSV' test.out

#- 223 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGED' \
    --itemId '88H6RCW8gJmGzDlq' \
    --limit '48' \
    --offset '54' \
    --sku 'tLsR2AGOiPhNt2Id' \
    --status 'ACTIVE' \
    --subscribedBy 'USER' \
    --userId 'YUT6mma833TDzk66' \
    > test.out 2>&1
eval_tap $? 223 'QuerySubscriptions' test.out

#- 224 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ix88sAUrXr7MXxCv' \
    > test.out 2>&1
eval_tap $? 224 'RecurringChargeSubscription' test.out

#- 225 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'yy7caxz4MQrODLNl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 225 'GetTicketDynamic' test.out

#- 226 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'xiEjQBCZx9DJ4V97' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "SJLlrwXmIGamRCAR"}' \
    > test.out 2>&1
eval_tap $? 226 'DecreaseTicketSale' test.out

#- 227 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'uFLx4rV4CXVMrDYK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 227 'GetTicketBoothID' test.out

#- 228 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'e2eTf1axo16GqT2v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 92, "orderNo": "juBquE7xssm4hxcz"}' \
    > test.out 2>&1
eval_tap $? 228 'IncreaseTicketSale' test.out

#- 229 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 31, "currencyCode": "kbSUbOZ9WNl3apJm", "expireAt": "1991-08-03T00:00:00Z"}, "debitPayload": {"count": 93, "currencyCode": "bl1g5ZmTTGYRbP4Q", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 8, "entitlementCollectionId": "gyZJ16MMd2bzOrTn", "entitlementOrigin": "IOS", "itemIdentity": "1i5Mf7WvbNSeeDNf", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 63, "entitlementId": "yk5xEfrJDxKsw5Xl"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 97, "currencyCode": "DZdbuvCFBaVcohew", "expireAt": "1989-03-23T00:00:00Z"}, "debitPayload": {"count": 33, "currencyCode": "VuGv9fQXkErF0drb", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 37, "entitlementCollectionId": "rFQP6rW62CtetBW3", "entitlementOrigin": "Oculus", "itemIdentity": "T1PSXhduTWchzXDv", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 54, "entitlementId": "xzvYwv7atn9EQv2O"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 64, "currencyCode": "mNL8p6AbdtU0CDrl", "expireAt": "1992-06-13T00:00:00Z"}, "debitPayload": {"count": 32, "currencyCode": "zrmbWofEaKStqdKu", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 89, "entitlementCollectionId": "MDikc3Fjm9HoQDem", "entitlementOrigin": "Other", "itemIdentity": "QMwNwDlYSli3p8Ya", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 57, "entitlementId": "del3hHMSLAiscGRW"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "VDCBcvVegrZddP8l"}, {"operations": [{"creditPayload": {"balanceOrigin": "Twitch", "count": 59, "currencyCode": "Qo6tHj4z4cAM4LMJ", "expireAt": "1973-12-28T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "HrVTehrqgvEtEs2L", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "jTyRd3LrR1x6U1v6", "entitlementOrigin": "Playstation", "itemIdentity": "xqBlPBYJ7X6uVy7F", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 94, "entitlementId": "mLTt5YQGawcomPoi"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 98, "currencyCode": "Q1f1AYq306Pysv4V", "expireAt": "1992-01-03T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "rpn0vAD9YsPeDWrA", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 92, "entitlementCollectionId": "yP3uqNcig6YcDA8Z", "entitlementOrigin": "GooglePlay", "itemIdentity": "54ZuQHKersDmJLUH", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 62, "entitlementId": "KtfXCKOna8DdjtZh"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 10, "currencyCode": "wdCpVpnENiTc9NES", "expireAt": "1995-07-04T00:00:00Z"}, "debitPayload": {"count": 9, "currencyCode": "lmV3kES0Hi88UYgS", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 21, "entitlementCollectionId": "0OvY7apPCrN5bEhm", "entitlementOrigin": "Other", "itemIdentity": "cxuXXpt0YSPX04uE", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 14, "entitlementId": "AwgDobopbdJeVCiK"}, "type": "FULFILL_ITEM"}], "userId": "YtCaIv4Lp91wYUJP"}, {"operations": [{"creditPayload": {"balanceOrigin": "Epic", "count": 51, "currencyCode": "vzn8TYoMDAaUXSuB", "expireAt": "1992-07-30T00:00:00Z"}, "debitPayload": {"count": 7, "currencyCode": "zWQDve0Z2G2N09VI", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 76, "entitlementCollectionId": "bsz24fQKDZX6plEr", "entitlementOrigin": "Other", "itemIdentity": "xQjYU6KlavIiLxU2", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 74, "entitlementId": "bez9ZLHW882riiPf"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 73, "currencyCode": "BgSZBvkehRn83B0n", "expireAt": "1979-12-17T00:00:00Z"}, "debitPayload": {"count": 100, "currencyCode": "n77hiP1lzkzjYDw6", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 77, "entitlementCollectionId": "BiEUqnzxs2deMF8U", "entitlementOrigin": "Playstation", "itemIdentity": "T1Xw9K9Yb68a8ygY", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 54, "entitlementId": "2TqkhlqMnE9Wj90E"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 81, "currencyCode": "OidrWnLrXqImgDf3", "expireAt": "1987-01-02T00:00:00Z"}, "debitPayload": {"count": 73, "currencyCode": "fIgLZ4YIzElrLZOB", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 59, "entitlementCollectionId": "25iasunESjcgr2dr", "entitlementOrigin": "GooglePlay", "itemIdentity": "G5NkKCySLA8cKCs0", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 10, "entitlementId": "FYRSa2OULZ0iOZJi"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "hmHOpCdr3WzDm3hJ"}], "metadata": {"dd6uaO9TiTPnIh2i": {}, "aIBpYC4txul6VKYl": {}, "NYYlHPwKDpJmkeoA": {}}, "needPreCheck": false, "transactionId": "1GqUjjFp6R8mYZwK", "type": "ftVqSECsypS42NmY"}' \
    > test.out 2>&1
eval_tap $? 229 'Commit' test.out

#- 230 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '4' \
    --status 'SUCCESS' \
    --type 'HlHbHnfs4tLVOYQC' \
    --userId 'WMktmiKd9vLPP0w5' \
    > test.out 2>&1
eval_tap $? 230 'GetTradeHistoryByCriteria' test.out

#- 231 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '2JRAZxMWdoleYNHX' \
    > test.out 2>&1
eval_tap $? 231 'GetTradeHistoryByTransactionId' test.out

#- 232 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'eOpaRDwYLge851Pb' \
    --body '{"achievements": [{"id": "K2MFKvw5TWjAh4gy", "value": 40}, {"id": "1LLzQ2IjY5PeNr4J", "value": 26}, {"id": "K8RGS0zCYRVmbfzw", "value": 95}], "steamUserId": "TKKUBfPNI9f2oLWD"}' \
    > test.out 2>&1
eval_tap $? 232 'UnlockSteamUserAchievement' test.out

#- 233 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSZexfKVxqdxmh5Q' \
    --xboxUserId 'WxuQuI7gdDTDb3Wd' \
    > test.out 2>&1
eval_tap $? 233 'GetXblUserAchievements' test.out

#- 234 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'nOpzTrRzCCafADJf' \
    --body '{"achievements": [{"id": "WBspT3MLwJZquMQS", "percentComplete": 86}, {"id": "uM2ykRj3WnyAaUaQ", "percentComplete": 56}, {"id": "4uY8nlBwGNHgfgwZ", "percentComplete": 46}], "serviceConfigId": "13FhD3NExUFipJsU", "titleId": "iDawAjgHFQk0VzWR", "xboxUserId": "NFNiUn2yXMSCcHAD"}' \
    > test.out 2>&1
eval_tap $? 234 'UpdateXblUserAchievement' test.out

#- 235 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'YpS861c0CJ7LzpFv' \
    > test.out 2>&1
eval_tap $? 235 'AnonymizeCampaign' test.out

#- 236 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'OSF6xKA6yrnvXY5d' \
    > test.out 2>&1
eval_tap $? 236 'AnonymizeEntitlement' test.out

#- 237 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dwneac75C6S2eHsH' \
    > test.out 2>&1
eval_tap $? 237 'AnonymizeFulfillment' test.out

#- 238 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '4Y84hL75QboMHCtz' \
    > test.out 2>&1
eval_tap $? 238 'AnonymizeIntegration' test.out

#- 239 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'EF9FSeg6WYgtfuqJ' \
    > test.out 2>&1
eval_tap $? 239 'AnonymizeOrder' test.out

#- 240 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hrs4e3RnWR30MdBZ' \
    > test.out 2>&1
eval_tap $? 240 'AnonymizePayment' test.out

#- 241 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'ezfwc3H0qSbMq4GL' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeRevocation' test.out

#- 242 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'j8aGsH0qE5p601ak' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeSubscription' test.out

#- 243 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '59yFSfdZIv8oYWPU' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeWallet' test.out

#- 244 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'S4Zu0SbTt6M2Xizi' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 244 'GetUserDLCByPlatform' test.out

#- 245 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'EnimeR7EFBz43E9F' \
    --includeAllNamespaces  \
    --status 'FULFILLED' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 245 'GetUserDLC' test.out

#- 246 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OPVu2fDtOjW1iSYQ' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId 'DlEX42U0syrGNhBm' \
    --entitlementClazz 'APP' \
    --entitlementName 'iHMD4iBK2O7qYtOH' \
    --features 'V5hnpjc5CNLnnEvo,25aEtdjls5oadseJ,g7y4Q9CU3fjSRaXD' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId '4HDmdvhMXxiKR29L,KIhNU43K8bihdw3p,rp0UHlWUxkBefhxR' \
    --limit '41' \
    --offset '35' \
    --origin 'Oculus' \
    > test.out 2>&1
eval_tap $? 246 'QueryUserEntitlements' test.out

#- 247 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'XLoWCGf0dZEeXBd6' \
    --body '[{"collectionId": "mGG6SHcZbX2wNnT6", "endDate": "1984-07-30T00:00:00Z", "grantedCode": "oqNLmPAUIMwa2wYq", "itemId": "6DsUq38bYvaWLoKz", "itemNamespace": "HnngdfFnOfY9stXH", "language": "XLzy", "metadata": {"7MXHbEwAvvpEeHhX": {}, "iJcJqYSxVKUYMimV": {}, "LzAP6aOzsTqEFXUh": {}}, "origin": "System", "quantity": 96, "region": "AwpYq1UqZydOB0MT", "source": "IAP", "startDate": "1973-01-04T00:00:00Z", "storeId": "W6LwcAg57BYBVCbi"}, {"collectionId": "0ifdPyKf3SwHekWI", "endDate": "1984-10-18T00:00:00Z", "grantedCode": "4rXlH5jw99HxCjXW", "itemId": "caXBcfXXeV7BXefs", "itemNamespace": "SgZxSYnVwXqF6K0W", "language": "sim_ii", "metadata": {"Hoz6qBQnEDgX49n1": {}, "xTDFcmOm1sqdIWU6": {}, "ERylESgf5dXMrPoY": {}}, "origin": "Twitch", "quantity": 30, "region": "emsp7o3F2LQw7Y2V", "source": "ACHIEVEMENT", "startDate": "1982-02-16T00:00:00Z", "storeId": "xgXez7VvS0C9JLVQ"}, {"collectionId": "QPa7PPx4Zi6WaC8w", "endDate": "1976-11-08T00:00:00Z", "grantedCode": "7HMbJhNwZgf5nlMD", "itemId": "ORYuXnPNJgayPFcy", "itemNamespace": "UnKXA3mcyMmX6WF8", "language": "TH-qulj", "metadata": {"533YlJ93CCGBXv4f": {}, "P4VPzhcH4UJrrCKv": {}, "rOAi7lMgkVWJYzSC": {}}, "origin": "System", "quantity": 61, "region": "YJLlb2AfUEEBbqMM", "source": "PURCHASE", "startDate": "1976-11-30T00:00:00Z", "storeId": "4mFw4HJv5T2kIQOe"}]' \
    > test.out 2>&1
eval_tap $? 247 'GrantUserEntitlement' test.out

#- 248 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cfLsYKTmUnKlrOsJ' \
    --activeOnly  \
    --appId 'mEwjGYN8VNPXNsmw' \
    > test.out 2>&1
eval_tap $? 248 'GetUserAppEntitlementByAppId' test.out

#- 249 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'TV8imJHNI0l6jJVz' \
    --activeOnly  \
    --limit '65' \
    --offset '82' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 249 'QueryUserEntitlementsByAppType' test.out

#- 250 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'nolVWA2dWxBs056j' \
    --ids 'kPCUuE1pgdHvlQKi,R7SDQUDavOlKT5EI,HNhJQq94Re5IM1ak' \
    > test.out 2>&1
eval_tap $? 250 'GetUserEntitlementsByIds' test.out

#- 251 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NKz9IltQUku3n32a' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'SwrNov2GW9i54JY2' \
    --itemId '3AUWFTLq0W1JqwKs' \
    > test.out 2>&1
eval_tap $? 251 'GetUserEntitlementByItemId' test.out

#- 252 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '1mO80L7IOHlf6j8P' \
    --ids 'ZOzUiQKZqz5NSp0B,7LODN3Boi2sSAO2n,4MZQt753XQB93rOW' \
    --platform '0guPoQbYzc1RDVhs' \
    > test.out 2>&1
eval_tap $? 252 'GetUserActiveEntitlementsByItemIds' test.out

#- 253 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '2lhdzxxgibuqUuyW' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'cMz9YyduMomEHcU1' \
    --sku '5St4v8ry8IyqNVv0' \
    > test.out 2>&1
eval_tap $? 253 'GetUserEntitlementBySku' test.out

#- 254 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVpXJTMx3Y8Um1iq' \
    --appIds 'ehObg3OZ9j0HDtbq,MFlgHKQIRtLfPngD,83roOeqE7fcCAeEx' \
    --itemIds 'eQX43LpmdMiZeyIr,A4QUKSJgECzvaWUC,A7wKru7ry3AQ2sEH' \
    --platform 'vSxjWoM1rNJLM0OO' \
    --skus 'VG5cG6XxENbWqlX7,idzjpKDfwl6XlCF6,YxFMD8tJQwZvUVIn' \
    > test.out 2>&1
eval_tap $? 254 'ExistsAnyUserActiveEntitlement' test.out

#- 255 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'os5RK100yH89i8ZD' \
    --platform 'PXRL8cbTAntB1STa' \
    --itemIds 'ab1UeibXg7RCe5Bt,Kcwj6PqqOgCimr3Z,QNBBkrXu9czsYr3c' \
    > test.out 2>&1
eval_tap $? 255 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 256 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FeVw70xdNTuOdLKK' \
    --appId '0M2B2hbqJin37P69' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 257 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 't1KqeGz7qbPnXEuO' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'QAn2LuMjLqwmVz3z' \
    --itemId 'Ksfjz1mFkyxoUzfM' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementOwnershipByItemId' test.out

#- 258 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'FoXCOguSq2A4R3wD' \
    --ids 'dSkNfHJtA3QiX9Zv,tydbaVb0scd97A0G,P6djn2Ps3IVT5hUZ' \
    --platform '3cnDq0ddZG0EpfGA' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementOwnershipByItemIds' test.out

#- 259 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHKcSxUc2YgRpk2I' \
    --entitlementClazz 'MEDIA' \
    --platform '3c3XALMresGFfsH4' \
    --sku 'aXCDhshvEF8rHd25' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementOwnershipBySku' test.out

#- 260 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '0nyihcUVGHQczI5Z' \
    > test.out 2>&1
eval_tap $? 260 'RevokeAllEntitlements' test.out

#- 261 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTRUkjGoRkPs2SO9' \
    --entitlementIds 'XrgXNIaU11cBXLwT' \
    > test.out 2>&1
eval_tap $? 261 'RevokeUserEntitlements' test.out

#- 262 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'fopqeZtHJnRgaGfL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MFbvyI5PZGzVLcmZ' \
    > test.out 2>&1
eval_tap $? 262 'GetUserEntitlement' test.out

#- 263 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'KKKYARape2tsNcza' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm4Cdd1QYvww4XDok' \
    --body '{"collectionId": "ltgq2vXtUnY6UhDJ", "endDate": "1985-05-02T00:00:00Z", "nullFieldList": ["uXeTRyJQrNLTcqLV", "TN5Qf4tjPGpu27yx", "b1of79zVTWIfgdNp"], "origin": "IOS", "reason": "9Ze0hL9rPkV5GkSr", "startDate": "1972-12-14T00:00:00Z", "status": "CONSUMED", "useCount": 85}' \
    > test.out 2>&1
eval_tap $? 263 'UpdateUserEntitlement' test.out

#- 264 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '2O47XVzU7qlNVk7q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nmBS3XKDhp1OkMcE' \
    --body '{"metadata": {"rmeH0lX1hj0LaXgQ": {}, "94flh775AQfzNjQ7": {}, "IuMSY2epRDJjDyMD": {}}, "options": ["KQhuTjtQZyIiAmCL", "8bNTTfqLCv9DYBOP", "roN4UWbQaKFrTv4J"], "platform": "WElmOCxqPrq9I3XJ", "requestId": "WBxTLcOef8MgIwkr", "useCount": 76}' \
    > test.out 2>&1
eval_tap $? 264 'ConsumeUserEntitlement' test.out

#- 265 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId '7SgxdxB5kvtM8ah9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bPsksceGUEX8ERZc' \
    > test.out 2>&1
eval_tap $? 265 'DisableUserEntitlement' test.out

#- 266 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'KSYLo6y7yJMowQ6L' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pHCvCYTgX9JQwErz' \
    > test.out 2>&1
eval_tap $? 266 'EnableUserEntitlement' test.out

#- 267 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'jtuP9pUUv7qefNMF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZAIqak1zi0JSa5c' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementHistories' test.out

#- 268 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'Rn31D8ubfdXi7Byc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DPckeGJUgU8bD5mG' \
    --body '{"metadata": {"FFmKTTUxG0mpmFxx": {}, "DNXGlGJvHf558h1l": {}, "tyhiSGhfqXhxBJ7z": {}}}' \
    > test.out 2>&1
eval_tap $? 268 'RevokeUserEntitlement' test.out

#- 269 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'LXioAGkWgSDdDQvp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RfGe3z2rtjWpJAlK' \
    --body '{"reason": "HF0ebxhJ1176CeD4", "useCount": 7}' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlementByUseCount' test.out

#- 270 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'DCKF0LLhO3lGZ7eG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OPj2XoFug8BUQUmP' \
    --quantity '68' \
    > test.out 2>&1
eval_tap $? 270 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 271 RevokeUseCount
eval_tap 0 271 'RevokeUseCount # SKIP deprecated' test.out

#- 272 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'QGv6pNNowEuVVZM2' \
    --namespace "$AB_NAMESPACE" \
    --userId '8w4mnYvvlt1es7A4' \
    --body '{"platform": "PFduN4gx0UC6eWKC", "requestId": "FGS97Si6XyLVPrkU", "useCount": 47}' \
    > test.out 2>&1
eval_tap $? 272 'SellUserEntitlement' test.out

#- 273 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '0iks6kx0adnimPyy' \
    --body '{"duration": 53, "endDate": "1994-01-30T00:00:00Z", "entitlementCollectionId": "uUSD9ImtaPAocOQc", "entitlementOrigin": "Nintendo", "itemId": "onwz27DWfGRVhbZT", "itemSku": "vCPrrZCTU5WUJizF", "language": "69PSsquWUafwbFPX", "metadata": {"15633pFgA7i9tqvf": {}, "HmFvUZiUW5Y0CYw5": {}, "OXSGwQkJuy9oLFcH": {}}, "order": {"currency": {"currencyCode": "HcraLXR2n9JQvq7N", "currencySymbol": "KWIHYsii3fCh7sie", "currencyType": "VIRTUAL", "decimals": 20, "namespace": "lfmya73hX0a8Ri85"}, "ext": {"PA9wNpmrK5Y5heA2": {}, "ewWnFcqHxXP3kRht": {}, "rBcBofWTGYx2ihgi": {}}, "free": false}, "orderNo": "xwaLM8HkVOW8PnLk", "origin": "GooglePlay", "overrideBundleItemQty": {"mzJbdkykVAnmnRfU": 17, "cYcko7U3gH239LhR": 48, "JvDiP2hNNEI8QrQ6": 68}, "quantity": 65, "region": "1ro5CtU8UjgyCUpM", "source": "REWARD", "startDate": "1989-10-25T00:00:00Z", "storeId": "BcTzf4dz1BojPoQg"}' \
    > test.out 2>&1
eval_tap $? 273 'FulfillItem' test.out

#- 274 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '976409vFd5z9r4nJ' \
    --body '{"code": "WUvLp1wxGF747468", "language": "Qyvw_vknF_jA", "region": "pPmrWVxNZUvkiU2j"}' \
    > test.out 2>&1
eval_tap $? 274 'RedeemCode' test.out

#- 275 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XSwsBBRopVl38d4N' \
    --body '{"itemId": "ZGtk6EmWxC75M88T", "itemSku": "KhFYkA9aRNDe2IoP", "quantity": 78}' \
    > test.out 2>&1
eval_tap $? 275 'PreCheckFulfillItem' test.out

#- 276 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'rgOfba1XeoHYTNoR' \
    --body '{"entitlementCollectionId": "ol84UlkxtP5Vok9s", "entitlementOrigin": "Xbox", "metadata": {"yXP6C0jXS8au2wcW": {}, "Yyj3JvHqXp4JR7xI": {}, "59Z9tfGVsglnOxOX": {}}, "origin": "Steam", "rewards": [{"currency": {"currencyCode": "aNyqBfgw58Hx0XYL", "namespace": "0fJOPYpnPqGlPnhB"}, "item": {"itemId": "DOWqDU8N3DjVUt0n", "itemName": "0jfyDbtIXICLkK8Z", "itemSku": "vbnTg3znlg8nmzQx", "itemType": "1RsYhcRlv16Wwe8Y"}, "quantity": 76, "type": "CURRENCY"}, {"currency": {"currencyCode": "tW8QGKFZLrIfqrZu", "namespace": "u7IwKcT7sAsv2TKC"}, "item": {"itemId": "bYMVkXEHmsHwIGGs", "itemName": "usS0zZRODEKPdudZ", "itemSku": "sLaf8aZrXW84dt0T", "itemType": "STmy7XF26K2U7xtt"}, "quantity": 95, "type": "CURRENCY"}, {"currency": {"currencyCode": "z8nWKJjv06PuffHg", "namespace": "hAQfAsYXVzBenLta"}, "item": {"itemId": "AoYyRfiCWrm3s1Ah", "itemName": "3TII70MIcBMJ0450", "itemSku": "8jKedx0CVRpd7SwZ", "itemType": "w2UkjDzJ4NuMMgI1"}, "quantity": 94, "type": "CURRENCY"}], "source": "OTHER", "transactionId": "vndQsCKAO2JRz3CG"}' \
    > test.out 2>&1
eval_tap $? 276 'FulfillRewards' test.out

#- 277 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'wtujkzxidLcAQWGV' \
    --endTime 'Rg6DVso5TJCSugdo' \
    --limit '72' \
    --offset '94' \
    --productId 'rSHPqdhKHn6ZjZMd' \
    --startTime 'r1C2TIQzRJY7UfYS' \
    --status 'PARTIAL_REVOKED' \
    --type 'APPLE' \
    > test.out 2>&1
eval_tap $? 277 'QueryUserIAPOrders' test.out

#- 278 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'fpbbbMIu9lu18jIM' \
    > test.out 2>&1
eval_tap $? 278 'QueryAllUserIAPOrders' test.out

#- 279 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUM77XmemN8LO03m' \
    --endTime 'nFSq9jJTVFoFjxZj' \
    --limit '15' \
    --offset '35' \
    --startTime 'qUR1Pq4a4uaMfd0S' \
    --status 'SUCCESS' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 279 'QueryUserIAPConsumeHistory' test.out

#- 280 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'AfYIyzHL8jxakuVu' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "cHlb_NR", "productId": "ZXoJ4gI4EQKO8xC4", "region": "D0FsUo3IB2kX5REQ", "transactionId": "ZsHyXzoIXNf0KbL9", "type": "XBOX"}' \
    > test.out 2>&1
eval_tap $? 280 'MockFulfillIAPItem' test.out

#- 281 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '7lzuVRVEvhKIbrq1' \
    --activeOnly  \
    --groupId 'xsGpdobYun8hcO55' \
    --limit '14' \
    --offset '98' \
    --platform 'GOOGLE' \
    --productId 'pmA4ehxNIIlcrZzg' \
    > test.out 2>&1
eval_tap $? 281 'QueryUserThirdPartySubscription' test.out

#- 282 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'ukAzAMaRvIUhUwgu' \
    --groupId 'GgbLLN3O7CEYjxqE' \
    > test.out 2>&1
eval_tap $? 282 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 283 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    --userId 'wMe1AnQVj6QQjZtk' \
    --productId 'NJCnDSrsSey2BqOx' \
    > test.out 2>&1
eval_tap $? 283 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 284 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'gwCymCDYsuff3b7G' \
    --activeOnly  \
    --groupId '5FDX4mu0qPHb9Ll2' \
    --limit '62' \
    --offset '37' \
    --platform 'XBOX' \
    --productId 'ULL1txfX9tqFSkGX' \
    > test.out 2>&1
eval_tap $? 284 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 285 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'oIcFN5JL9M53Mg0M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWS9usxxnMhjv66D' \
    > test.out 2>&1
eval_tap $? 285 'GetThirdPartySubscriptionDetails' test.out

#- 286 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'yED4prRVibTATxd7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mzjv1gSj8kcNhoqc' \
    --limit '88' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 286 'GetSubscriptionHistory' test.out

#- 287 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'RNATojM7daV0VwR3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yNKDtMqMrAGpdyF6' \
    > test.out 2>&1
eval_tap $? 287 'SyncSubscriptionTransaction' test.out

#- 288 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'WDHn3ePBxQNz2IUE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HMzl5jhwVDsuzwJ4' \
    > test.out 2>&1
eval_tap $? 288 'GetThirdPartyUserSubscriptionDetails' test.out

#- 289 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'v50eoaIBrTh0EKkJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ioUpvGnkcHgCfaWz' \
    > test.out 2>&1
eval_tap $? 289 'SyncSubscription' test.out

#- 290 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'PUvCnfqsPGgJZyRw' \
    --discounted  \
    --itemId 'igaMu07Zek8WObpf' \
    --limit '94' \
    --offset '65' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserOrders' test.out

#- 291 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'HYfViEj70KYKIfFt' \
    --body '{"currencyCode": "4GYjUt4F1ZVy2qFf", "currencyNamespace": "Sr3psWjOyHLyKe2f", "discountCodes": ["Vs05nZC4Os7hqIH2", "R0NYdJzf3TMhSayn", "oqsVIfgBTr8RcxRQ"], "discountedPrice": 82, "entitlementPlatform": "Epic", "ext": {"gARSG3QQNGNH2K0U": {}, "uJdeGNquQnaXpDQ5": {}, "rU2taDWh9JV5oc5I": {}}, "itemId": "FQsrwHqFqwVA5moz", "language": "eeOjIFQfXV3YW3ug", "options": {"skipPriceValidation": false}, "platform": "Xbox", "price": 58, "quantity": 90, "region": "XhD7FUz1iOe0pHa0", "returnUrl": "LmseIRXeoerZAxbD", "sandbox": true, "sectionId": "XU5xJBhIpJ9b0Ap7"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminCreateUserOrder' test.out

#- 292 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'CmSiKPjcwAw5Gdxp' \
    --itemId 'vLfa4b4hTaZBGdX6' \
    > test.out 2>&1
eval_tap $? 292 'CountOfPurchasedItem' test.out

#- 293 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '6DqPTdurR3MYda0Y' \
    --userId '0BCO4qPnvxERWjKa' \
    > test.out 2>&1
eval_tap $? 293 'GetUserOrder' test.out

#- 294 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sq5zQ6uZNwKjnX7v' \
    --userId 'DIqpcjmaq5KBCsHl' \
    --body '{"status": "FULFILLED", "statusReason": "3GbKPHdDTQDEEE2m"}' \
    > test.out 2>&1
eval_tap $? 294 'UpdateUserOrderStatus' test.out

#- 295 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Tsn1NwJ71szsNmnq' \
    --userId 'ZSWdEyOVYrTdDq7I' \
    > test.out 2>&1
eval_tap $? 295 'FulfillUserOrder' test.out

#- 296 GetUserOrderGrant
eval_tap 0 296 'GetUserOrderGrant # SKIP deprecated' test.out

#- 297 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qbTVv8BLsqQW8HSr' \
    --userId 'Em5Y7jI232Sjktij' \
    > test.out 2>&1
eval_tap $? 297 'GetUserOrderHistories' test.out

#- 298 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iNzTUe8KdizXmrmK' \
    --userId '0sCUsqxKocHomtjo' \
    --body '{"additionalData": {"cardSummary": "U1kUqRedwIu1TSRr"}, "authorisedTime": "1980-04-12T00:00:00Z", "chargebackReversedTime": "1985-07-24T00:00:00Z", "chargebackTime": "1981-02-15T00:00:00Z", "chargedTime": "1991-05-22T00:00:00Z", "createdTime": "1973-10-15T00:00:00Z", "currency": {"currencyCode": "dpcKhvHPlvYanGqE", "currencySymbol": "kn9OEVwLWGT4MXhm", "currencyType": "VIRTUAL", "decimals": 1, "namespace": "vRQb7c0vmjWq9fQq"}, "customParameters": {"zulLGfQMqSLQDlRF": {}, "YMVfiAMa6Pco7Mfv": {}, "ikslpyL9BYLVVznF": {}}, "extOrderNo": "6hMYfksp8VQhYSFe", "extTxId": "BOp0ilGQFwHUtZug", "extUserId": "blT3aIDKn9qJXncm", "issuedAt": "1998-03-09T00:00:00Z", "metadata": {"1jZcTK8zmMfyshYk": "3b5cAFVo85r1b8Yp", "2QnuhQuIdvZdj6As": "pWBfRnLcLbp7Omcr", "DJ7u1rrRPcnG89rn": "NW1Yjfn8lY4DnYRx"}, "namespace": "Y8ZhHeb0CaPFDjrS", "nonceStr": "otKnpJWALpToj9rg", "paymentData": {"discountAmount": 35, "discountCode": "OCViHwunQwpC2eCF", "subtotalPrice": 95, "tax": 28, "totalPrice": 55}, "paymentMethod": "04F8BQjzobhDa8Vx", "paymentMethodFee": 76, "paymentOrderNo": "ZF6aSRmHU5iR3hXI", "paymentProvider": "ADYEN", "paymentProviderFee": 34, "paymentStationUrl": "zWPKOkzftOgDQAWh", "price": 41, "refundedTime": "1990-04-05T00:00:00Z", "salesTax": 3, "sandbox": true, "sku": "rDf7q4cAnpmLiEu4", "status": "INIT", "statusReason": "m9KvKMHK5fbqioeo", "subscriptionId": "RIplY0DIzRCNAO6Z", "subtotalPrice": 32, "targetNamespace": "sEYogFWiH9z4E8zm", "targetUserId": "aZ5cg0REtUWY4fVI", "tax": 7, "totalPrice": 8, "totalTax": 33, "txEndTime": "1996-07-03T00:00:00Z", "type": "GgxNg33ZIUrIkfmd", "userId": "XVvaPQzzKdFg7N7p", "vat": 18}' \
    > test.out 2>&1
eval_tap $? 298 'ProcessUserOrderNotification' test.out

#- 299 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'SmgudQusJLsPlW7Z' \
    --userId 'yORFkN9EbKbTbrDz' \
    > test.out 2>&1
eval_tap $? 299 'DownloadUserOrderReceipt' test.out

#- 300 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'NgVEcw0lxRam16O6' \
    --body '{"currencyCode": "v4VjJf40LjUdOREL", "currencyNamespace": "VXUFQyVlt9jmxmxp", "customParameters": {"fp41k1uDg59PhdUX": {}, "ShabwyYCxTHrDel8": {}, "oThvr8CUEzw4zL1Q": {}}, "description": "eR3EYXBFpUX9y4tY", "extOrderNo": "7o5FFi1n10vDgyoH", "extUserId": "XIlrMl2RAukCL26i", "itemType": "CODE", "language": "ETn-Achm", "metadata": {"JEkvq6SUSt8xd8Eg": "E15XNuw6Y7sToQNk", "uZzJ1XBxw01iBBQu": "kgQ94ZvPCWcMX0ov", "3U2sKjIeyFS97dYD": "7LkcTKYpCfl6HPy5"}, "notifyUrl": "cJfAV5iOfzwt3bpx", "omitNotification": false, "platform": "t6lKoMjCPtEKeBWT", "price": 26, "recurringPaymentOrderNo": "XdPYZQxBnttu4yW5", "region": "etl4Xk8Hd1lRtoPM", "returnUrl": "vsu9oswEPTvzwwGn", "sandbox": true, "sku": "s9UufgsVbG6TUe3j", "subscriptionId": "buQ7HMPO4ozK705y", "title": "kRqSPYZgPm4JLsXV"}' \
    > test.out 2>&1
eval_tap $? 300 'CreateUserPaymentOrder' test.out

#- 301 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tBOEetHsxAJ8Ny1L' \
    --userId 'RkPU9hrl5nkpEdBe' \
    --body '{"description": "8bYWdok4UnUEOyP0"}' \
    > test.out 2>&1
eval_tap $? 301 'RefundUserPaymentOrder' test.out

#- 302 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'cPZf5OvolfI0mqZc' \
    > test.out 2>&1
eval_tap $? 302 'GetUserPlatformAccountClosureHistories' test.out

#- 303 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'tohLheRaQkfMLFW9' \
    --body '{"code": "B7jHZro4hhwnANAG", "orderNo": "p8zGqNGrcQyoA1TW"}' \
    > test.out 2>&1
eval_tap $? 303 'ApplyUserRedemption' test.out

#- 304 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pcy83iXfYXNdMkdg' \
    --body '{"meta": {"9TMwxNcQ6CkVi8fq": {}, "VPRqNbF5yLnYSa8x": {}, "FLvcYexMMMiDFh5R": {}}, "reason": "bW021cHN3QbzVuJZ", "revokeEntries": [{"currency": {"balanceOrigin": "System", "currencyCode": "admAo0lzhPm7RmaO", "namespace": "r6TLwVyE42ApAb7C"}, "entitlement": {"entitlementId": "Kt79wAopZL9Cw6K9"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "A4g9OGoWw1qnCAvd", "itemIdentityType": "ITEM_ID", "origin": "Playstation"}, "quantity": 54, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "d4ifGd0bkWrlhtfT", "namespace": "ywRW4fmg6btk3mAO"}, "entitlement": {"entitlementId": "4EtB0hn2x1oTOX5g"}, "item": {"entitlementOrigin": "Steam", "itemIdentity": "fv4uzKAwiI4wTxNI", "itemIdentityType": "ITEM_ID", "origin": "Playstation"}, "quantity": 10, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "mtrxWu293551nQBN", "namespace": "KcqCkUXRj8gQHEe4"}, "entitlement": {"entitlementId": "CO370OsbzRKKPd6m"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "EjnslEYM8ngVT1ew", "itemIdentityType": "ITEM_SKU", "origin": "Playstation"}, "quantity": 43, "type": "ITEM"}], "source": "DLC", "transactionId": "HUHg0c4X7fHdITmN"}' \
    > test.out 2>&1
eval_tap $? 304 'DoRevocation' test.out

#- 305 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId '9opaF0kh3pCRB3in' \
    --body '{"gameSessionId": "fEVxArF7TB6A6a71", "payload": {"zAJpaPeudUtKPJUm": {}, "AvxBxJNPlvvYZw4M": {}, "WzWFTuNPf5JCSDyY": {}}, "scid": "y4e5qoTZxSoZbQUn", "sessionTemplateName": "UxS6m68WL3HDL4yx"}' \
    > test.out 2>&1
eval_tap $? 305 'RegisterXblSessions' test.out

#- 306 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '5I0euBsccHPA2v9X' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'enfEX7lloLgIYqxF' \
    --limit '11' \
    --offset '57' \
    --sku 'SNJlHCjxLNnYUlGQ' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 306 'QueryUserSubscriptions' test.out

#- 307 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'py9ZVlLIFwLgT78n' \
    --excludeSystem  \
    --limit '30' \
    --offset '29' \
    --subscriptionId 'zPZvOd4yZyMKyED3' \
    > test.out 2>&1
eval_tap $? 307 'GetUserSubscriptionActivities' test.out

#- 308 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'qDO5HXp5oVkhESbH' \
    --body '{"grantDays": 88, "itemId": "a24yBTw3wfNGyWf3", "language": "VujS7Bq5bcfPW4pP", "reason": "ZB9YXltCxyztUnj1", "region": "7t3gHBXvjvziexzO", "source": "LbOWbtcJUxM3AWyD"}' \
    > test.out 2>&1
eval_tap $? 308 'PlatformSubscribeSubscription' test.out

#- 309 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kA5LmART6kulpM4S' \
    --itemId 'RtUE5P4kxmHtFbjq' \
    > test.out 2>&1
eval_tap $? 309 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 310 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'urHix0QYycDH5we2' \
    --userId 'Mx0sYCnYPT4i4mxc' \
    > test.out 2>&1
eval_tap $? 310 'GetUserSubscription' test.out

#- 311 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '14iRfzJwKuc7EpiQ' \
    --userId 'Ezz5N5osRYO7wbYh' \
    > test.out 2>&1
eval_tap $? 311 'DeleteUserSubscription' test.out

#- 312 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '7q02W8tkTURUFmqN' \
    --userId 'c8xhQqptccNorRls' \
    --force  \
    --body '{"immediate": true, "reason": "ggq91cpgvoDBgYfL"}' \
    > test.out 2>&1
eval_tap $? 312 'CancelSubscription' test.out

#- 313 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BdGNAZEvbvxqa0K7' \
    --userId 'VUbjUnzirnEsxSE4' \
    --body '{"grantDays": 44, "reason": "9AcFhH4ZlYY3rEuH"}' \
    > test.out 2>&1
eval_tap $? 313 'GrantDaysToSubscription' test.out

#- 314 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'MWwQNmCQmGCF963C' \
    --userId 'bsOawlRBQJH6fNek' \
    --excludeFree  \
    --limit '14' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 314 'GetUserSubscriptionBillingHistories' test.out

#- 315 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'svV5hMOSfpyJkJlm' \
    --userId 'JmTkFvB7wkY6nuUE' \
    --body '{"additionalData": {"cardSummary": "GJ3k0HGtpK43uORG"}, "authorisedTime": "1993-06-29T00:00:00Z", "chargebackReversedTime": "1986-11-27T00:00:00Z", "chargebackTime": "1987-12-01T00:00:00Z", "chargedTime": "1993-06-26T00:00:00Z", "createdTime": "1998-06-12T00:00:00Z", "currency": {"currencyCode": "20WM3TxWXSdTiKdv", "currencySymbol": "a2UREoBSFtCLy2Cq", "currencyType": "REAL", "decimals": 65, "namespace": "CG7JwJCDqkzOdFwL"}, "customParameters": {"JpIPxzLE1V9U1Ngp": {}, "H7Oc44yjRdfqZgv3": {}, "4GqqjelcN0GJmPwU": {}}, "extOrderNo": "TWMx0MiPAjnWIhFr", "extTxId": "qSn4erXEtU1CaD8A", "extUserId": "qsMCGBNhmUt6fzYR", "issuedAt": "1978-04-27T00:00:00Z", "metadata": {"85brTu8F7cuCPh1T": "GZJmgWNHWnvOBRCt", "4onqRo2PnMSRarKg": "4coy3AFpULIn21Nf", "2FNgDWNC6yh7kgTH": "lrxKbsV4XtrI7SFB"}, "namespace": "EgkwHifMHYI581Hb", "nonceStr": "F7fMX9lDXYxGRJM9", "paymentData": {"discountAmount": 9, "discountCode": "sFGQ5DQoDwzrKPOZ", "subtotalPrice": 91, "tax": 28, "totalPrice": 57}, "paymentMethod": "V3zR7YxSu6addocg", "paymentMethodFee": 90, "paymentOrderNo": "0Hy9jx7gBHTOHHAr", "paymentProvider": "CHECKOUT", "paymentProviderFee": 4, "paymentStationUrl": "ld0LnREsrrB2pJ7V", "price": 71, "refundedTime": "1985-03-03T00:00:00Z", "salesTax": 92, "sandbox": true, "sku": "5SilDDIsmj4h625d", "status": "NOTIFICATION_OF_CHARGEBACK", "statusReason": "9GcOivIfcCJt4U8V", "subscriptionId": "SgXoi9Fw25b9qXzl", "subtotalPrice": 72, "targetNamespace": "XMepgzY9jLiAdMiQ", "targetUserId": "7eDMkeBRMur18nCx", "tax": 18, "totalPrice": 47, "totalTax": 98, "txEndTime": "1987-01-07T00:00:00Z", "type": "6EhM3dKvIG9MR0hT", "userId": "INvq1VR9SJUfQEX9", "vat": 39}' \
    > test.out 2>&1
eval_tap $? 315 'ProcessUserSubscriptionNotification' test.out

#- 316 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName '6Mh1sQ3Dw3uyjgQN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'As9188Qm3W1De2Mc' \
    --body '{"count": 66, "orderNo": "QpqCgxt0NgDSj1T6"}' \
    > test.out 2>&1
eval_tap $? 316 'AcquireUserTicket' test.out

#- 317 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'EdeYFmrLT0HbvS4k' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserCurrencyWallets' test.out

#- 318 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'SSt3CyDgf6eFAiqS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kHi0BR2ElF6z6eJK' \
    --body '{"allowOverdraft": true, "amount": 89, "balanceOrigin": "Xbox", "balanceSource": "TRADE", "metadata": {"mChYoKD7yqCR03Ro": {}, "vQZhwfjkq9iyTbyD": {}, "3D01tRpuuyIagSSz": {}}, "reason": "EL8H4euLufhQj2KP"}' \
    > test.out 2>&1
eval_tap $? 318 'DebitUserWalletByCurrencyCode' test.out

#- 319 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode '3LLxl9Hs2L2wlpKB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VURxHefz77a9fntC' \
    --limit '80' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 319 'ListUserCurrencyTransactions' test.out

#- 320 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'iHBRUNCPSre5GmZz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CQwilS3IxSjlyvR9' \
    --request '{"amount": 87, "debitBalanceSource": "EXPIRATION", "metadata": {"xG9Lji2Vc88W8aLj": {}, "IxVGpdOqguxvRwI9": {}, "ZBTipMRlhK9DMMaI": {}}, "reason": "4ryVDvNaruZxwTfh", "walletPlatform": "GooglePlay"}' \
    > test.out 2>&1
eval_tap $? 320 'CheckBalance' test.out

#- 321 CheckWallet
eval_tap 0 321 'CheckWallet # SKIP deprecated' test.out

#- 322 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '5UcmNXK5RqcIo9lp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'z9oM52vHPlwVV3jl' \
    --body '{"amount": 87, "expireAt": "1992-10-23T00:00:00Z", "metadata": {"FrOr6wJDBwIDsJHN": {}, "g6TvNGjwI4TbTwBu": {}, "fUorJouduhCEJ5Xi": {}}, "origin": "Twitch", "reason": "L9gYHEV3wnTZTvYY", "source": "CONSUME_ENTITLEMENT"}' \
    > test.out 2>&1
eval_tap $? 322 'CreditUserWallet' test.out

#- 323 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'kfhRuqkOTHSia7oF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd1fEmDuyAsQGzwJR' \
    --request '{"amount": 6, "debitBalanceSource": "EXPIRATION", "metadata": {"0NIligBrOkBljwRE": {}, "Njt04ZpyTTZG1LxL": {}, "dySvyVqY8nxBZbHc": {}}, "reason": "PHEFuEVP9bF07gnW", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 323 'DebitByWalletPlatform' test.out

#- 324 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode '3TySOh8SI75oXbyq' \
    --namespace "$AB_NAMESPACE" \
    --userId '8FBbur80QwnlgAVf' \
    --body '{"amount": 34, "metadata": {"ZgFWs5s0nT89A88G": {}, "DOUClGyzYgnYTdim": {}, "6PkRoq5TO65KWh8z": {}}, "walletPlatform": "Other"}' \
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
    --storeId 'rSJ1vbB7LRHd96dG' \
    > test.out 2>&1
eval_tap $? 330 'ListViews' test.out

#- 331 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LgkfrZveFMWAFT7l' \
    --body '{"displayOrder": 100, "localizations": {"l1jaOAMCzbsoIgmK": {"description": "wwMDQPjUIosq1l6x", "localExt": {"o0D4JRbNqO6IuP2P": {}, "Y5hhX6uNah9JoHPj": {}, "7jFWxSv1lYylYAiZ": {}}, "longDescription": "8c7Zd7EUoezOLw8C", "title": "1c5bBB3XZ7ColKwl"}, "sNvtFuunQsvdXGlD": {"description": "40xxIyVwYjn6dlC9", "localExt": {"Kfh9gHuloyce0cLJ": {}, "u4ljPWlCWTuGO8Mn": {}, "fOQu3wdT4Aodp95o": {}}, "longDescription": "1RkX7iW7VpCngWAv", "title": "5DAG8dPdkKgQqjyz"}, "UZR2rFIAuALNhNCy": {"description": "scsMBRLsWadk2OQ4", "localExt": {"21q7Nb1vrKthVvU5": {}, "on065ApCkVN3Qchu": {}, "Q6pntxB648ss7rBn": {}}, "longDescription": "vQHAM8gSdIybKUBy", "title": "HBzfvgtRTPPzwJmK"}}, "name": "aLCx3gcidEALWe6R"}' \
    > test.out 2>&1
eval_tap $? 331 'CreateView' test.out

#- 332 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'G5wWznu5AjwR1Z4f' \
    --storeId 'U7ICcaQtuuKUw3dU' \
    > test.out 2>&1
eval_tap $? 332 'GetView' test.out

#- 333 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'wWHhQW3I1y9tjRLV' \
    --storeId 'OXBMa0JiIe1AY0tU' \
    --body '{"displayOrder": 54, "localizations": {"DfAxNqCUtizYM97e": {"description": "bZcYqwfIHPWMkOmr", "localExt": {"T5HL16jMwECnmwJv": {}, "4rpqtzDaz0WUJlBC": {}, "HzJ2v9K8c1zOlZg3": {}}, "longDescription": "0pagfP0FfOMBOpeQ", "title": "T4zYIbU4i9mLyX46"}, "Alt08rrnG8y2ScXk": {"description": "wjpAp82pGcxvXaG9", "localExt": {"LzHpMS53jllopwir": {}, "Ro3A8WxnR0YaMsF3": {}, "f5KLtpTSsPMGDZTO": {}}, "longDescription": "wEP5Bhh0NStWIggm", "title": "hfAzVdNYP7Ao1z7F"}, "eJM2fWXGk7JObSHk": {"description": "sRkabpmvRsc7ZYvX", "localExt": {"CT6m6mRZAlLBczJV": {}, "eil7GbG1ISBCkcnp": {}, "xKUxLjmxhBS6YypR": {}}, "longDescription": "W7fNntaIEtDI6Mbh", "title": "xkQdezbmf392erso"}}, "name": "Z2KbMb5jal0ruZmB"}' \
    > test.out 2>&1
eval_tap $? 333 'UpdateView' test.out

#- 334 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'XlGSp85q6fuGfo5w' \
    --storeId 'SDHnyabk493I3pvH' \
    > test.out 2>&1
eval_tap $? 334 'DeleteView' test.out

#- 335 QueryWallets
eval_tap 0 335 'QueryWallets # SKIP deprecated' test.out

#- 336 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 76, "expireAt": "1974-09-05T00:00:00Z", "metadata": {"ipZwiaBrFrXtGMju": {}, "jfHZB1gMI1B8DXb3": {}, "7DffTZ7yQz337LLN": {}}, "origin": "Steam", "reason": "4abmqqi90KTWwZk0", "source": "PURCHASE"}, "currencyCode": "5PkLvraRzChdjDGd", "userIds": ["QWyZocvYfr0Rnl02", "lk2A2jHbAPNGInvb", "nf4ewKFFLoGggX4g"]}, {"creditRequest": {"amount": 90, "expireAt": "1977-10-12T00:00:00Z", "metadata": {"feWO2bmOikTBJHTE": {}, "m5PSeyod5L6OooYo": {}, "Qn9iHEqWO1cVCUIO": {}}, "origin": "Playstation", "reason": "lCwaBqHpE55sjxBG", "source": "DLC"}, "currencyCode": "uRNeT1CULEMPaOU5", "userIds": ["xNRzF3NaUuCyQyze", "nukycAUlkUSZKUrs", "6zPKu5sE89JW8UU0"]}, {"creditRequest": {"amount": 90, "expireAt": "1992-05-30T00:00:00Z", "metadata": {"iMDTR7LxihuOn57i": {}, "o0d9dG3yzaNbGeAS": {}, "X83SLiIbAP2qyUnH": {}}, "origin": "Nintendo", "reason": "MxAndOj5O6IBwXJj", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "gsX4RwfM4qnUdcQq", "userIds": ["eJe4n9eUlBQZ2UGe", "Z9F1uivPob0YZEuX", "QACDDQryNf9VGxbO"]}]' \
    > test.out 2>&1
eval_tap $? 336 'BulkCredit' test.out

#- 337 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "PWXbAyGiXa9nUsHC", "request": {"allowOverdraft": false, "amount": 27, "balanceOrigin": "Epic", "balanceSource": "OTHER", "metadata": {"uJ7onrUXVlB6xNel": {}, "4Bxb9KwFYqdhEVq3": {}, "hbsApeASfR0ljKxq": {}}, "reason": "ZcLuhwNDvValv3bk"}, "userIds": ["lEAHZzHs8x5oPSkZ", "FIV2feXnTRlzAJy9", "oMXNzl1ywEPiunix"]}, {"currencyCode": "oFOHB2KEsIdtozVl", "request": {"allowOverdraft": true, "amount": 25, "balanceOrigin": "Steam", "balanceSource": "DLC_REVOCATION", "metadata": {"zeEpmSPO6KwlJQlj": {}, "9Ii2jARwzowk9Ooi": {}, "Pdnq9KBqBwiNCsnK": {}}, "reason": "8CcO1OHbpQZtwW3E"}, "userIds": ["wLre1bL4dJnkRLJb", "MvOGSd7uMrmQ2SaL", "d6M7TM3wnJyExuo5"]}, {"currencyCode": "z9RAcYgYZb7cAakJ", "request": {"allowOverdraft": true, "amount": 54, "balanceOrigin": "Oculus", "balanceSource": "TRADE", "metadata": {"N6eubdp49JFwXG0E": {}, "voSHNC97eEyhnL1Q": {}, "H5AlYRAqCAC2gy1W": {}}, "reason": "F9QLNgDxAkwgfB8j"}, "userIds": ["IecOx5ugNCDd6jW6", "0XgJB6a7uykADFpi", "fjtBcO3fWq9qfmBv"]}]' \
    > test.out 2>&1
eval_tap $? 337 'BulkDebit' test.out

#- 338 GetWallet
eval_tap 0 338 'GetWallet # SKIP deprecated' test.out

#- 339 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'nFcH2ZMSYijqEuMf' \
    --end 'uYFUS079tOpZYM1X' \
    --start 'V0Op0damycnTUOoM' \
    > test.out 2>&1
eval_tap $? 339 'SyncOrders' test.out

#- 340 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["kOppZNOkqxc42HKv", "5wvtPJVsuzaBciSx", "wzuIpGBYHTHoSVxg"], "apiKey": "QCbpZx5yMGIQ1ZxV", "authoriseAsCapture": false, "blockedPaymentMethods": ["QFkVVEf36S7yPgG4", "8bk6PwH1tdEAJSqX", "A0Wv0zWGvkc6byp3"], "clientKey": "mvyYT3GuaZVTxBlw", "dropInSettings": "1IWeXKFT4rfSbbSl", "liveEndpointUrlPrefix": "DPGf9Fn32SJNPZkE", "merchantAccount": "fkAcJTMS4pVRcCHI", "notificationHmacKey": "GfmCMTr9ACnI2sMr", "notificationPassword": "Egl7ZR1HCkf2Sw78", "notificationUsername": "lLGKjDHuXt358gzq", "returnUrl": "RMuMPrIekxq58fik", "settings": "q83hqJ7HP63Se6kV"}' \
    > test.out 2>&1
eval_tap $? 340 'TestAdyenConfig' test.out

#- 341 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "W5fkl60ImLBv6nUU", "privateKey": "0r1rfX9stpvJUuyP", "publicKey": "dzx8BM2wEgTtLRT5", "returnUrl": "stwQFUEbTPQ8p7VM"}' \
    > test.out 2>&1
eval_tap $? 341 'TestAliPayConfig' test.out

#- 342 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "lxEXnqHwMyKpwphj", "secretKey": "UXvM1GqMkZ44UXgd"}' \
    > test.out 2>&1
eval_tap $? 342 'TestCheckoutConfig' test.out

#- 343 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'BqtJaRyDlP9qIZJ5' \
    > test.out 2>&1
eval_tap $? 343 'DebugMatchedPaymentMerchantConfig' test.out

#- 344 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "Krx6KkHagEugKJxk", "webhookSecretKey": "U8Y58COtTNjnNSik"}' \
    > test.out 2>&1
eval_tap $? 344 'TestNeonPayConfig' test.out

#- 345 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "JDg6ujKvq0CIa1YC", "clientSecret": "K9PlMeQprfgLGkHX", "returnUrl": "1tdBjKmCBXETZwqd", "webHookId": "zAX28DikGk8cWiX4"}' \
    > test.out 2>&1
eval_tap $? 345 'TestPayPalConfig' test.out

#- 346 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["4azSHcwicUVq2XPl", "jTZj5R0yZSVQ8SSe", "J4qy4PIKleuV271b"], "publishableKey": "wZ4niLSzQnv0C00d", "secretKey": "tNGGzbGYSYo9fY2E", "webhookSecret": "BZAHQXc4Xcae7VKl"}' \
    > test.out 2>&1
eval_tap $? 346 'TestStripeConfig' test.out

#- 347 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "0ARzGEArlfE1NSmt", "key": "cADoZvd0La7P4JI4", "mchid": "H7uDzkOHTdnUtdrR", "returnUrl": "cs3GeOsKPNlG7rEX"}' \
    > test.out 2>&1
eval_tap $? 347 'TestWxPayConfig' test.out

#- 348 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "i6LEqJERpbxEq07t", "flowCompletionUrl": "xnvZZeAf7QBuZK5G", "merchantId": 72, "projectId": 76, "projectSecretKey": "lBncg8tQnJOKHC16"}' \
    > test.out 2>&1
eval_tap $? 348 'TestXsollaConfig' test.out

#- 349 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'xjJZ4kiU3N8556ll' \
    > test.out 2>&1
eval_tap $? 349 'GetPaymentMerchantConfig1' test.out

#- 350 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id '2LQWpdESOBV7wZJs' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["g7wSv9lyRyTdYBUl", "jvBzvYNEtfgBFikt", "18cQ677SotDEtU2x"], "apiKey": "BSEQ8rBKc2K6oJXx", "authoriseAsCapture": true, "blockedPaymentMethods": ["D8hCc9onSNjbQEqF", "GwnDG8kz4kvEv6tN", "jGRhrmRAxRGeIKGl"], "clientKey": "CJmDXpjyvLSHB1y3", "dropInSettings": "klHuAGnidOyGuS0O", "liveEndpointUrlPrefix": "G7ohiL2943ClrNhE", "merchantAccount": "dxd24ZKfvMf1T5Fz", "notificationHmacKey": "YMf1jaCgZosntPzP", "notificationPassword": "1vXXB92q150WEIet", "notificationUsername": "OXMt37MXy7Fp7lUf", "returnUrl": "QqXrqGadwvKlJFX1", "settings": "ZHV9yo9Ur1hfhmGE"}' \
    > test.out 2>&1
eval_tap $? 350 'UpdateAdyenConfig' test.out

#- 351 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'KuVUZdCacRGataPr' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 351 'TestAdyenConfigById' test.out

#- 352 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'cgTcA71dtqtSUN4z' \
    --sandbox  \
    --validate  \
    --body '{"appId": "vBzGh3mhIDNuMBZe", "privateKey": "gHtB9uTCiiIoMZCj", "publicKey": "GiOZJpUf9RpcfEQn", "returnUrl": "0O6D8PGQuazAypgW"}' \
    > test.out 2>&1
eval_tap $? 352 'UpdateAliPayConfig' test.out

#- 353 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'hTED5YmPTBUkm2Fy' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 353 'TestAliPayConfigById' test.out

#- 354 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'vdguCYVqFyIKh1Yt' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "TY4AejyQc5Dac7hS", "secretKey": "LldWx5DyniVESUgr"}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateCheckoutConfig' test.out

#- 355 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'ROrP1ip3jNG68DBy' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfigById' test.out

#- 356 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'f2UMPtigq9zOQOcA' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "qBj0bXhOr9OHt6zx", "webhookSecretKey": "1i2W3GY7tdh8hHlQ"}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateNeonPayConfig' test.out

#- 357 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'yMlgfkTsAThLyflA' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfigById' test.out

#- 358 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'qqAP4M78smYdyge6' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "DroOywOxI4G6jZzo", "clientSecret": "YIFAvYfT8XQw2EOq", "returnUrl": "6BFjmN4OqKGLRpNW", "webHookId": "zKZtZnxgywmr4CYN"}' \
    > test.out 2>&1
eval_tap $? 358 'UpdatePayPalConfig' test.out

#- 359 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'Gm7Tk1mMyeNRsjQu' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 359 'TestPayPalConfigById' test.out

#- 360 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'DEgO3MEQNL6ijLRv' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["QOgoaBooTawHLMxh", "x9nC3o6pXU5MDJLC", "B6WbXWIRpgjooaBV"], "publishableKey": "emsbkaXZQ6nTj9rZ", "secretKey": "pkSntuOeaPAyPeEG", "webhookSecret": "BepK1Ix4SwjCYjCH"}' \
    > test.out 2>&1
eval_tap $? 360 'UpdateStripeConfig' test.out

#- 361 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'niVSn1gYGal5NrBt' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 361 'TestStripeConfigById' test.out

#- 362 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'T0om9OlGzpF25qu9' \
    --validate  \
    --body '{"appId": "8RhktX6qwkXbCLbh", "key": "8t0zPkQWRUlgE0kx", "mchid": "zFMq9ttbEHAEV7C6", "returnUrl": "5Ans9SquNSJIay5V"}' \
    > test.out 2>&1
eval_tap $? 362 'UpdateWxPayConfig' test.out

#- 363 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'dUdYy9Y9OCSmmT3W' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 363 'UpdateWxPayConfigCert' test.out

#- 364 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'KijbqhT3uyQRXvvc' \
    > test.out 2>&1
eval_tap $? 364 'TestWxPayConfigById' test.out

#- 365 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'UYDeWPZ8yhwQ0gId' \
    --validate  \
    --body '{"apiKey": "j1lTJdNLmAvEdEBV", "flowCompletionUrl": "AU3rbkv8V98cupW0", "merchantId": 77, "projectId": 62, "projectSecretKey": "5WsiuITRMSPOUfWQ"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateXsollaConfig' test.out

#- 366 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'wr4PYf48r66MaTox' \
    > test.out 2>&1
eval_tap $? 366 'TestXsollaConfigById' test.out

#- 367 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'Biliy2vtRkpqL6Kr' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateXsollaUIConfig' test.out

#- 368 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '84' \
    --namespace "$AB_NAMESPACE" \
    --offset '51' \
    --region 'oIpWzacOvwUsnIbQ' \
    > test.out 2>&1
eval_tap $? 368 'QueryPaymentProviderConfig' test.out

#- 369 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "IeuAi3zWFGorCbnc", "region": "oj5RvEtXiKyUGdNf", "sandboxTaxJarApiToken": "MiwgSvsTRmJsOm0w", "specials": ["XSOLLA", "NEONPAY", "WALLET"], "taxJarApiToken": "weFYDBPyd1jJBxbr", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 369 'CreatePaymentProviderConfig' test.out

#- 370 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 370 'GetAggregatePaymentProviders' test.out

#- 371 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'uFay9PXgEQS4871Q' \
    > test.out 2>&1
eval_tap $? 371 'DebugMatchedPaymentProviderConfig' test.out

#- 372 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 372 'GetSpecialPaymentProviders' test.out

#- 373 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'Smsspn5sNfifK65t' \
    --body '{"aggregate": "NEONPAY", "namespace": "W2HG8LAiIzuo321L", "region": "l90IBFsSb3FsV2Pn", "sandboxTaxJarApiToken": "Cs9R0D5jZEwxcow6", "specials": ["XSOLLA", "ADYEN", "XSOLLA"], "taxJarApiToken": "COEP4AZx70uwV4Xg", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 373 'UpdatePaymentProviderConfig' test.out

#- 374 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'G1uenDihceaLdgPZ' \
    > test.out 2>&1
eval_tap $? 374 'DeletePaymentProviderConfig' test.out

#- 375 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 375 'GetPaymentTaxConfig' test.out

#- 376 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "I0fKW8LeQxItaK6s", "taxJarApiToken": "3Hha69MgxjGJx62m", "taxJarEnabled": false, "taxJarProductCodesMapping": {"mKGNEmFPcUALNziO": "9Bz2wx4kDAm8XIle", "iujtv2NdQTYoHZog": "W8lBvniHdARadfSo", "ctA3GYO94ZOo94gS": "5DHLB65fxQ06GwTm"}}' \
    > test.out 2>&1
eval_tap $? 376 'UpdatePaymentTaxConfig' test.out

#- 377 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'obiBnfrnq9kOFBWh' \
    --end 'UTPiKR3qcbHLGplY' \
    --start 'sS3jsRZffCd00Vrg' \
    > test.out 2>&1
eval_tap $? 377 'SyncPaymentOrders' test.out

#- 378 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'PuNtOv3jbhGBuW8K' \
    --storeId 'cyPMfDWSEEpKoJlm' \
    > test.out 2>&1
eval_tap $? 378 'PublicGetRootCategories' test.out

#- 379 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'hMQUCx70QjYbzemO' \
    --storeId 'TURzzAOIBarB7kce' \
    > test.out 2>&1
eval_tap $? 379 'DownloadCategories' test.out

#- 380 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'r5SvPLeQZIpKFXgn' \
    --namespace "$AB_NAMESPACE" \
    --language 'sxx3c2bUsO7FP8Rm' \
    --storeId 'OstZAGDgiVsV2Ott' \
    > test.out 2>&1
eval_tap $? 380 'PublicGetCategory' test.out

#- 381 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'wJaMxPDIJ5hFQHum' \
    --namespace "$AB_NAMESPACE" \
    --language 'FvPKqupHj72TlLs9' \
    --storeId '64iABOgTKtnaA7O3' \
    > test.out 2>&1
eval_tap $? 381 'PublicGetChildCategories' test.out

#- 382 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '5Iaytd9CsAMTZC37' \
    --namespace "$AB_NAMESPACE" \
    --language 'xPXxnfggnZ3EZp6w' \
    --storeId 'SAufwYirs9lwvPKd' \
    > test.out 2>&1
eval_tap $? 382 'PublicGetDescendantCategories' test.out

#- 383 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 383 'PublicListCurrencies' test.out

#- 384 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 384 'GeDLCDurableRewardShortMap' test.out

#- 385 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 385 'GetAppleConfigVersion' test.out

#- 386 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    > test.out 2>&1
eval_tap $? 386 'GetIAPItemMapping' test.out

#- 387 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '2FMwfWNCbN5GelVO' \
    --region 'U0hHnsCl5k6Jxh5m' \
    --storeId 'kmQzKg0jWCjpGwh7' \
    --appId 'pLAi5JmzvM6JFKB8' \
    > test.out 2>&1
eval_tap $? 387 'PublicGetItemByAppId' test.out

#- 388 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'ullPROSfiW9zcxmg' \
    --categoryPath 'NfTHu3vkZt9FgWck' \
    --features 'jNpHhM2ZXp4N0ROm' \
    --includeSubCategoryItem  \
    --itemType 'MEDIA' \
    --language 'tXIcNEcGJjOCXpui' \
    --limit '47' \
    --offset '86' \
    --region 'vnPeTu9evbRov7Bm' \
    --sortBy 'updatedAt:asc,createdAt:asc,updatedAt' \
    --storeId 'X9AJdkT7UYCV8agv' \
    --tags 'wOI2LlOQNRN132Rd' \
    > test.out 2>&1
eval_tap $? 388 'PublicQueryItems' test.out

#- 389 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'gwMXv9olKpRyWQim' \
    --region '3qlART9mPPmYUvlk' \
    --storeId 'BGPJFaFzkABC8zWM' \
    --sku 'cYW5iRrw32FRg8y4' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetItemBySku' test.out

#- 390 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'rOuj7J6ijJbcycXm' \
    --storeId 'BcrJLb7labyotifV' \
    --itemIds 'k9KyqceGv0CEDTVS' \
    > test.out 2>&1
eval_tap $? 390 'PublicGetEstimatedPrice' test.out

#- 391 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'jINYeKLowG7UQB9p' \
    --region 'XzuCK5qd2m8A5axi' \
    --storeId 'xm9X9TXNhN8y1PVr' \
    --itemIds 'iIyv9kjuiAGiXx47' \
    > test.out 2>&1
eval_tap $? 391 'PublicBulkGetItems' test.out

#- 392 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["etMikLFggYDc2FMb", "zZoeKagnKf2Yifzv", "r9OqTsInGzHFpFXY"]}' \
    > test.out 2>&1
eval_tap $? 392 'PublicValidateItemPurchaseCondition' test.out

#- 393 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'SEASON' \
    --limit '60' \
    --offset '39' \
    --region '2uBAvIXEc2CCgYcF' \
    --storeId 'o9A93o22UgObCOiB' \
    --keyword 'Wdw2b031dm4N41MO' \
    --language 'pmm04BlZUAlYnCT1' \
    > test.out 2>&1
eval_tap $? 393 'PublicSearchItems' test.out

#- 394 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId '1qD03er5mdraK47F' \
    --namespace "$AB_NAMESPACE" \
    --language 'dxXisVlo3aVOGARF' \
    --region 'DJcGWy826ilCxAxQ' \
    --storeId 'UM5DyrPfBmpZIzSF' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetApp' test.out

#- 395 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'UZqVR5FWGfH66eFC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 395 'PublicGetItemDynamicData' test.out

#- 396 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'MTsLA8vYVvrIAEeh' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'UV0jsjAyVgxS54NN' \
    --populateBundle  \
    --region 's3XdhMbQX9D1znEW' \
    --storeId 'w9p7g4UsQCTKDh5n' \
    > test.out 2>&1
eval_tap $? 396 'PublicGetItem' test.out

#- 397 GetPaymentCustomization
eval_tap 0 397 'GetPaymentCustomization # SKIP deprecated' test.out

#- 398 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "9yc34xF8qFllM1LT", "successUrl": "rl4MP3Nl4T3ujvV7"}, "paymentOrderNo": "W6ADLtn7oInn1Bz3", "paymentProvider": "STRIPE", "returnUrl": "cHrLYfftad99JDcn", "ui": "n7f2d8SOWP2dw6Uy", "zipCode": "88WpQalG38VOo82a"}' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetPaymentUrl' test.out

#- 399 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'LD9jUjuDITjifWRb' \
    > test.out 2>&1
eval_tap $? 399 'PublicGetPaymentMethods' test.out

#- 400 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mtK7MTxcCWnMiCLs' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetUnpaidPaymentOrder' test.out

#- 401 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'jroKHPApA8GsGwyo' \
    --paymentProvider 'ADYEN' \
    --zipCode '8dzTL8azKCCNBZpw' \
    --body '{"token": "RFNYxx2dr6DDuDHX"}' \
    > test.out 2>&1
eval_tap $? 401 'Pay' test.out

#- 402 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'cfvXPXJURX3XwhOl' \
    > test.out 2>&1
eval_tap $? 402 'PublicCheckPaymentOrderPaidStatus' test.out

#- 403 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'ALIPAY' \
    --region 'OYVvEcEm53BYMBac' \
    > test.out 2>&1
eval_tap $? 403 'GetPaymentPublicConfig' test.out

#- 404 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'QBIuDVs7U0AJtWPR' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetQRCode' test.out

#- 405 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'teszMTd0R5Fsrf9x' \
    --foreinginvoice 'bVfgvG617GmxzClk' \
    --invoiceId 'R3M6Twpwq3nLwxnJ' \
    --payload 'KjOo9fvfXF1VsikD' \
    --redirectResult '3IphQQiRcOtsthUw' \
    --resultCode 'gQzNHUZ0l1FRfOjJ' \
    --sessionId 'UmCbi2llksf6GA8v' \
    --status 'Tt92kldCoyRdiOik' \
    --token 'UdqGocLYBaRC7T5q' \
    --type 'Sl7WN3ncPkqiTKzz' \
    --userId '72PKXjShM2DvesmM' \
    --orderNo 'IbiQfaHxl2YUNRLR' \
    --paymentOrderNo 'jgKqSSYgZnVfa8go' \
    --paymentProvider 'STRIPE' \
    --returnUrl '9B9Okr0xJ5XRZVox' \
    > test.out 2>&1
eval_tap $? 405 'PublicNormalizePaymentReturnUrl' test.out

#- 406 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'PGOLVBIlFgTAsXgq' \
    --paymentOrderNo 'x3mfB5ZwV25N7NAv' \
    --paymentProvider 'WXPAY' \
    > test.out 2>&1
eval_tap $? 406 'GetPaymentTaxValue' test.out

#- 407 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'dGuyYEYZE3KaGSdh' \
    > test.out 2>&1
eval_tap $? 407 'GetRewardByCode' test.out

#- 408 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'EGKcp6g1A8O9N9cb' \
    --limit '56' \
    --offset '22' \
    --sortBy 'rewardCode:asc,namespace:desc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 408 'QueryRewards1' test.out

#- 409 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'XOBDpR7SH93AE1To' \
    > test.out 2>&1
eval_tap $? 409 'GetReward1' test.out

#- 410 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 410 'PublicListStores' test.out

#- 411 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'j5vygVvLSJvdsGpm,mUeMikW3s54zffAL,2DZ7gBhy77iRVFfF' \
    --itemIds 'vWenMNV00KVuLF9W,DnGO3bpQWmnS52Zu,uuI7F1xpVrcoXzSO' \
    --skus 'EGEDYfiGPYo2K3dN,3YBOJfvV6SuHovoQ,lk5wL2oXDZ20Bw2H' \
    > test.out 2>&1
eval_tap $? 411 'PublicExistsAnyMyActiveEntitlement' test.out

#- 412 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId '4tz6KUC4jXGj2G0G' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 413 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'lZB246OY0dPVMd2W' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 414 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --sku 'iwxOx2XQn94xPqXh' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 415 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'qeNMDGA3O5hQAl6U,2g9imVMh3i7j095r,DL6lEuB1ZIMIs1dF' \
    --itemIds 'vYokH9t2u8ZZnyHK,kk6Gh25tEcX9GegD,nrYz0GFpSVdxFsXA' \
    --skus 'p1roclyXllFitPam,SKRzDIZgSk6suS90,ZbDdmjU11QIZtkSn' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetEntitlementOwnershipToken' test.out

#- 416 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "8QRbA5V4gjWv1W6c", "language": "NWc-lqSD_ci", "region": "A3sd51mDooH53vib"}' \
    > test.out 2>&1
eval_tap $? 416 'SyncTwitchDropsEntitlement' test.out

#- 417 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'q3Qcrtt8L5dIebsw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 417 'PublicGetMyWallet' test.out

#- 418 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '7EjkMnJSziEA43Wq' \
    --body '{"epicGamesJwtToken": "IMJdrqHIsJ98WRjq"}' \
    > test.out 2>&1
eval_tap $? 418 'SyncEpicGameDLC' test.out

#- 419 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'YieXRthQZvzRi7pq' \
    > test.out 2>&1
eval_tap $? 419 'SyncOculusDLC' test.out

#- 420 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'pajYEHs9TIkcnrJ6' \
    --body '{"serviceLabel": 56}' \
    > test.out 2>&1
eval_tap $? 420 'PublicSyncPsnDlcInventory' test.out

#- 421 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'BOKqywS6DKNSeb2U' \
    --body '{"serviceLabels": [73, 100, 79]}' \
    > test.out 2>&1
eval_tap $? 421 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 422 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'tE2dAeC7pF73y9eA' \
    --body '{"appId": "LKWinUJ7bAuUJ7Fx", "steamId": "g5LijlQTVq8Bh1p0"}' \
    > test.out 2>&1
eval_tap $? 422 'SyncSteamDLC' test.out

#- 423 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCKWNkLU5ty3uQa7' \
    --body '{"xstsToken": "Fl3ZhSMLtrwnjTJV"}' \
    > test.out 2>&1
eval_tap $? 423 'SyncXboxDLC' test.out

#- 424 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dlh112byTYCDBnAv' \
    --appType 'DEMO' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName '8JpFuJSZistM7554' \
    --features '4PDlVK8taScpV0Nt,CxDDz5rxt6LflBJj,okLAaL4oAF2lqx8y' \
    --itemId 'neWKrOy4xcg30BqC,5W7g7hiwumJTI3jl,ZPjoCdGiIP6cB3Pj' \
    --limit '22' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 424 'PublicQueryUserEntitlements' test.out

#- 425 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'MJXIuLWYb2iHHVN0' \
    --appId 'ZBgvrigXUT4fRbaw' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetUserAppEntitlementByAppId' test.out

#- 426 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'D5yOvjgOopQfbXmt' \
    --limit '64' \
    --offset '71' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 426 'PublicQueryUserEntitlementsByAppType' test.out

#- 427 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'WFH7F2InhxtynUju' \
    --availablePlatformOnly  \
    --ids 'BCxkb2oF99xI1VVt,VrVT6Hn8B2d1hZUn,oQwg5uqgoHaFyocz' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetUserEntitlementsByIds' test.out

#- 428 PublicGetUserEntitlementByItemId
eval_tap 0 428 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 429 PublicGetUserEntitlementBySku
eval_tap 0 429 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 430 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ck0qJsgZPfuelAiZ' \
    --endDate 'BZcQGHHGI7csI8ec' \
    --entitlementClazz 'SUBSCRIPTION' \
    --limit '32' \
    --offset '91' \
    --startDate 'DIJG42ILhUoCh8lm' \
    > test.out 2>&1
eval_tap $? 430 'PublicUserEntitlementHistory' test.out

#- 431 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'KKocC5Ea29JhfFGN' \
    --appIds '964J8WOgsAj2Rmf1,DXvAIkzTRNRVyeEG,u1ICOCmLAmcaEFBK' \
    --itemIds 'gy92LYqtQcDN7OMC,ehk42acy8wsWaPyp,pR3ztPSALA8LlV2s' \
    --skus 'ccbVr6HSiXVzrG4E,dKn8eypTzI497DG0,ZNoJvvi4Ys50iE7I' \
    > test.out 2>&1
eval_tap $? 431 'PublicExistsAnyUserActiveEntitlement' test.out

#- 432 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'jZoDzMmMgoMxZZ9A' \
    --appId 'utWDfVOINhql9CdD' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 433 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'X4xiHpdfKH35RWUU' \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId '1MnNSKd0KStITvGQ' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 434 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'tzwjGtGTr238G8Ae' \
    --ids 'vk3k14782W2oNo3X,4m6wms9SPaHlqtDP,ry2vMON7sdhlilfp' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 435 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'DT8o2iFrYtGfCZCc' \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'EKdeo779KG5yCz9j' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 436 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'Vs1lYK1Mx9rEFkDq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b31AZzwiQBaGdS41' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserEntitlement' test.out

#- 437 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'VRIyAHjYxVhCbXbe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BEoTlfR33jqIRoXc' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["zy4KSA5UtSXWjANS", "WIT9TLnuMLNJAEk3", "A6A6rYiIu8eLdWyk"], "requestId": "hBxLFnKnSYC9yyBY", "useCount": 9}' \
    > test.out 2>&1
eval_tap $? 437 'PublicConsumeUserEntitlement' test.out

#- 438 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'vhz1T6cSrZL2CgHx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dmYDj9vZNgfI1AeY' \
    --body '{"requestId": "He8WPQGPclChxLfb", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 438 'PublicSellUserEntitlement' test.out

#- 439 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'rH6f2GDrNbLOjGz3' \
    --namespace "$AB_NAMESPACE" \
    --userId '4ct0ctEeH43wYuLn' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 5}' \
    > test.out 2>&1
eval_tap $? 439 'PublicSplitUserEntitlement' test.out

#- 440 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'nW4pBcPPaiaM1og5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rxUjGPKKLMoAy1st' \
    --body '{"entitlementId": "mxPFz0i1IK3QzkcR", "metadata": {"operationSource": "INVENTORY"}, "useCount": 92}' \
    > test.out 2>&1
eval_tap $? 440 'PublicTransferUserEntitlement' test.out

#- 441 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'FPpXGlKR9ss8b8ud' \
    --body '{"code": "l6fLkxFnAqyvjBy0", "language": "uzlG_RDYR-wC", "region": "3qNjzlcxXsmGGcJh"}' \
    > test.out 2>&1
eval_tap $? 441 'PublicRedeemCode' test.out

#- 442 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'auxfhVKIbRvUnyEl' \
    --body '{"excludeOldTransactions": true, "language": "UrrH-CHuB", "productId": "Y4IH0OXHZP6VVB7q", "receiptData": "jDHMS49dkv8vxyg6", "region": "giNKzeFnlgGRgYK3", "transactionId": "SeYvULYNIhs5PZGT"}' \
    > test.out 2>&1
eval_tap $? 442 'PublicFulfillAppleIAPItem' test.out

#- 443 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Jmgofq7nlF5Ch8J2' \
    --body '{"epicGamesJwtToken": "Qs990APOU4hcdwln"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncEpicGamesInventory' test.out

#- 444 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'sTap2RJpHtncLywP' \
    --body '{"autoAck": false, "autoConsume": false, "language": "xo", "orderId": "CCIrP0lJXexseo2e", "packageName": "6BCNJTTRIHDKdVfO", "productId": "Ur14yZH00n8MsRja", "purchaseTime": 56, "purchaseToken": "4MnOqnqNerQoHiDI", "region": "JayvSNt8EQXsMbYi", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 444 'PublicFulfillGoogleIAPItem' test.out

#- 445 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '1yY6D1Euusf0eOzo' \
    > test.out 2>&1
eval_tap $? 445 'SyncOculusConsumableEntitlements' test.out

#- 446 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'SyKttYwUUlMRG8vO' \
    --body '{"currencyCode": "0OSsJmhOJDUyyag9", "price": 0.1522871033205646, "productId": "BDJFJGOEiWJ8cLrr", "serviceLabel": 50}' \
    > test.out 2>&1
eval_tap $? 446 'PublicReconcilePlayStationStore' test.out

#- 447 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'FpfccauYDc86pxK9' \
    --body '{"currencyCode": "KhF4KRVPoIuzAuQN", "price": 0.15888534498495877, "productId": "AfvOE2cVjFp1CeCE", "serviceLabels": [16, 1, 11]}' \
    > test.out 2>&1
eval_tap $? 447 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 448 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '1GhZHEj6p5grjk5w' \
    --body '{"appId": "zdksOUku8dtQoIrp", "currencyCode": "vmM19X4zFOvdRTpG", "language": "Wc_dw", "price": 0.20484426616184992, "productId": "prkv7A8MRutCKCsq", "region": "mx2zriOGB8b5qTFp", "steamId": "3cIxOI33nt54i5hd"}' \
    > test.out 2>&1
eval_tap $? 448 'SyncSteamInventory' test.out

#- 449 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    --userId 'OiTVzAeQq6rnWJoT' \
    --activeOnly  \
    --groupId 'pYoe2uHaWnO98Ywq' \
    --limit '69' \
    --offset '89' \
    --productId 'ZnEDkfmNbDTMGgET' \
    > test.out 2>&1
eval_tap $? 449 'PublicQueryUserThirdPartySubscription' test.out

#- 450 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2yS6C8a8L0vQDS4E' \
    --body '{"gameId": "VpBmsUzx64Gr4XEm", "language": "UWc-MHRw", "region": "gtONCIoZ2rkomSj5"}' \
    > test.out 2>&1
eval_tap $? 450 'SyncTwitchDropsEntitlement1' test.out

#- 451 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '2mAIMo6EW9QhzU8F' \
    --body '{"currencyCode": "wQtZpfUoyoiUjmqO", "price": 0.39098315637209824, "productId": "Q7ammFgHprdM9viF", "xstsToken": "WmezrQOWH03zyr7k"}' \
    > test.out 2>&1
eval_tap $? 451 'SyncXboxInventory' test.out

#- 452 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'RbC31YMJfRiD7djt' \
    --discounted  \
    --itemId '1VeOFBDA3gvCRfoB' \
    --limit '17' \
    --offset '94' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 452 'PublicQueryUserOrders' test.out

#- 453 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'NKsVyK8EU8JYc00P' \
    --body '{"currencyCode": "A2ef1jFeqQ8mBpTu", "discountCodes": ["dYpfHOYoLva2c4Js", "cEQfBFZXcSXpU81S", "vLTJUzwXJFaWW3JV"], "discountedPrice": 56, "ext": {"H9XsZyvZOFJ5RrFZ": {}, "YcwfQ1Q2BbcjSpv6": {}, "Nt1oz4tdgfKu4bmK": {}}, "itemId": "8kOKcEoCRjQJlPY3", "language": "Lk_Iiof_394", "price": 23, "quantity": 31, "region": "vRDZSIuM0OXOHPlu", "returnUrl": "vsry8AKSZxOhUhl3", "sectionId": "Y0EshaG0uDiJNUux"}' \
    > test.out 2>&1
eval_tap $? 453 'PublicCreateUserOrder' test.out

#- 454 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'K22saWaGvrzBdLvF' \
    --body '{"currencyCode": "UBZDnVrcwbsD0RDL", "discountCodes": ["xWgEWwoHpV8E1xQZ", "La7Kw77UpCxNyx1j", "jdxNePPAJ6Z9UzqI"], "discountedPrice": 15, "itemId": "rI0T97qA1OiblWlz", "price": 81, "quantity": 76}' \
    > test.out 2>&1
eval_tap $? 454 'PublicPreviewOrderPrice' test.out

#- 455 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OF1Bg6OHZzvdZHoI' \
    --userId 'm4tKNhPjNIQGFxGw' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserOrder' test.out

#- 456 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gnSiZtChE0uof77A' \
    --userId 'API5tdPeFz9pGYsL' \
    > test.out 2>&1
eval_tap $? 456 'PublicCancelUserOrder' test.out

#- 457 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'NEGrfy9qHKufJfk0' \
    --userId 'MeG3qYJr6PuCVK9W' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserOrderHistories' test.out

#- 458 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mDAdpLVTVsj9pDiy' \
    --userId 'ybXY4v7JRFMRaeIa' \
    > test.out 2>&1
eval_tap $? 458 'PublicDownloadUserOrderReceipt' test.out

#- 459 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'QuPWPlkxeotrNakK' \
    > test.out 2>&1
eval_tap $? 459 'PublicGetPaymentAccounts' test.out

#- 460 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'GvOSvpmZZdlNXdx2' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'MNTpM7fSods1zdVT' \
    > test.out 2>&1
eval_tap $? 460 'PublicDeletePaymentAccount' test.out

#- 461 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '0aWj58Othvd3jzMD' \
    --autoCalcEstimatedPrice  \
    --language 'Af40gKSizvmxts5H' \
    --region 'SQvRAPG9JoVSLrbs' \
    --storeId '5niXkjpkOgRCC7qf' \
    --viewId 'z5jV7NTRYld9FJJ1' \
    > test.out 2>&1
eval_tap $? 461 'PublicListActiveSections' test.out

#- 462 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '0goNq8uq79Du28SR' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId 'Gant6aqjKzWDAauq' \
    --limit '78' \
    --offset '29' \
    --sku 'KarcLQRQtC927Gne' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 462 'PublicQueryUserSubscriptions' test.out

#- 463 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'M8LvzgyIVzGFBLJ5' \
    --body '{"currencyCode": "vbC9NfLTFJGOzAIA", "itemId": "qpmkDdFSs4s7u1VU", "language": "HmK", "region": "3EtufHuNIp0GXpM4", "returnUrl": "nbG7aww2TANW1Or7", "source": "TvLoL0wwHoRMNexB"}' \
    > test.out 2>&1
eval_tap $? 463 'PublicSubscribeSubscription' test.out

#- 464 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Oron8wIdUbp7xVMK' \
    --itemId 'fbAJfW4iMIC52NUe' \
    > test.out 2>&1
eval_tap $? 464 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 465 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dhhkME18qGpSsyEP' \
    --userId 'DWHcqfYp2EFxEaEH' \
    > test.out 2>&1
eval_tap $? 465 'PublicGetUserSubscription' test.out

#- 466 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'CGtg812NQb5Glh8s' \
    --userId 'rTlTj61WdV2XUo1B' \
    > test.out 2>&1
eval_tap $? 466 'PublicChangeSubscriptionBillingAccount' test.out

#- 467 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'O1rE7E12Fapao5jo' \
    --userId '9nJoKEb8tHmFwLGa' \
    --body '{"immediate": false, "reason": "SMNr23LV7xZEEv7O"}' \
    > test.out 2>&1
eval_tap $? 467 'PublicCancelSubscription' test.out

#- 468 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '1lwxVTRll0GIEUJt' \
    --userId 'MC8NyV2HLHZT3oYJ' \
    --excludeFree  \
    --limit '24' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 468 'PublicGetUserSubscriptionBillingHistories' test.out

#- 469 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'y9cQ6B074dTJZqeO' \
    --language 'llKQNwJUGtC0tAhx' \
    --storeId 'n1ay6ruu7PYWHODR' \
    > test.out 2>&1
eval_tap $? 469 'PublicListViews' test.out

#- 470 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'b6skOj0lfYFGnQCA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WidWPjYgyebU6rHF' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetWallet' test.out

#- 471 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'irnUpZ9UJ4N78qHT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gdn7gE4bwLzDEw2P' \
    --limit '38' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 471 'PublicListUserWalletTransactions' test.out

#- 472 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetMyDLCContent' test.out

#- 473 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime '8x9SSaOZcEvG6KZh' \
    --limit '71' \
    --offset '17' \
    --startTime '4BmtuIFllfSUnaUh' \
    --state 'REVOKE_FAILED' \
    --transactionId 'pOJsY86xAf5y1iy0' \
    --userId '1FkEEXlKiTIDgP7w' \
    > test.out 2>&1
eval_tap $? 473 'QueryFulfillments' test.out

#- 474 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'wkz0nw2oxKye8jZq' \
    --baseAppId 'j7k0YiLqOUSBuwR3' \
    --categoryPath '88REDRuYBnWiEsOn' \
    --features 'DfIAN04f5kSONmw1' \
    --includeSubCategoryItem  \
    --itemName 'BDqqSctLL4WfGq8J' \
    --itemStatus 'INACTIVE' \
    --itemType 'SEASON,MEDIA,COINS' \
    --limit '46' \
    --offset '99' \
    --region 'GWgccuzuc6QDRMGd' \
    --sectionExclusive  \
    --sortBy 'updatedAt:asc,displayOrder:asc,updatedAt:desc' \
    --storeId 'bUyHTYPS8CGKXGon' \
    --tags '2ecc65YAFLweD9Z7' \
    --targetNamespace 'U2lNkorrw9QH3rNh' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 474 'QueryItemsV2' test.out

#- 475 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'DepQum4Dj7pR05RT' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 475 'ImportStore1' test.out

#- 476 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GXGRkYXifTd5nAOF' \
    --body '{"itemIds": ["9VV7JgCOm4wL729H", "ma0nCdCEFcf2doBr", "fHiHXXgvu496H02y"]}' \
    > test.out 2>&1
eval_tap $? 476 'ExportStore1' test.out

#- 477 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OVN1h41jIPOMXufZ' \
    --body '{"entitlementCollectionId": "PWSe20JfNvtNcWtp", "entitlementOrigin": "IOS", "metadata": {"BnTrsYihhgbeAZoF": {}, "ncMUdmf8hD3nL1sa": {}, "QxLYrz08jh6Tyq7W": {}}, "origin": "Epic", "rewards": [{"currency": {"currencyCode": "ilXgtf5UctyV3aSw", "namespace": "4twReM5DcHde3fkH"}, "item": {"itemId": "f7tH8WTOTeBOcYhf", "itemName": "6nGCnPjiIbJifs0a", "itemSku": "rKxCcNv8FQCyQBqK", "itemType": "xayGvw7MqOsypCJm"}, "quantity": 11, "type": "CURRENCY"}, {"currency": {"currencyCode": "nW0spgvjt7eCLDu6", "namespace": "PA3PRnQtB410iWT0"}, "item": {"itemId": "SILVGXCWRucRpP1T", "itemName": "q7uYXhB6FPfF5Dvv", "itemSku": "eMdBsPt19V2FkBPk", "itemType": "0QLufK6eiT38raaR"}, "quantity": 67, "type": "ITEM"}, {"currency": {"currencyCode": "g0hfM5vQmahJlT5O", "namespace": "UDEMwAjgNZgto2Eh"}, "item": {"itemId": "OlnsuDnkuOJekbO0", "itemName": "sk7o1z37uuqLDQF1", "itemSku": "2kYfBqeQxos58kVk", "itemType": "7F1KKOfFFLvER3xq"}, "quantity": 58, "type": "ITEM"}], "source": "ORDER_REVOCATION", "transactionId": "gKa4oCBoJDxGa1Uu"}' \
    > test.out 2>&1
eval_tap $? 477 'FulfillRewardsV2' test.out

#- 478 FulfillItems
./ng net.accelbyte.sdk.cli.Main platform fulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'Sr4ehnV8Aw9m6GvD' \
    --userId 'SE2F7Ad69Dln4mqF' \
    --body '{"items": [{"duration": 14, "endDate": "1976-02-24T00:00:00Z", "entitlementCollectionId": "bdpGqWQIPK6mVytM", "entitlementOrigin": "Oculus", "itemId": "mBRT39gKYLk9DmjJ", "itemSku": "h6PnpTXWAUt8lgqN", "language": "M4poGEvIKCe3MrLx", "metadata": {"mnjmlAuaBCdhzXb6": {}, "cBMPNMmjMi2uztFN": {}, "fXg0UvwaZ0py16Sh": {}}, "orderNo": "GomFzUappaaODZaZ", "origin": "Twitch", "quantity": 53, "region": "b7xerpjVPfktNnl8", "source": "PURCHASE", "startDate": "1988-10-02T00:00:00Z", "storeId": "kesuOtYHLqcdy05Y"}, {"duration": 37, "endDate": "1990-05-09T00:00:00Z", "entitlementCollectionId": "DxvlK9RnTEYv5eDh", "entitlementOrigin": "Steam", "itemId": "GLHEAKhp612Y2ncR", "itemSku": "f7tEGzYqRoHm6Ety", "language": "XqQbKWMJ0aODiWn6", "metadata": {"bPmSa85Riu1alaVE": {}, "hjJZbwMHkFWLSzmA": {}, "XAruYrVjX4HRTvm3": {}}, "orderNo": "Qr9IkuW6jjofc6it", "origin": "Steam", "quantity": 98, "region": "Esq0dHfYG6k853GE", "source": "CONSUME_ENTITLEMENT", "startDate": "1986-10-21T00:00:00Z", "storeId": "3wFchP3zTymfVfny"}, {"duration": 19, "endDate": "1991-10-16T00:00:00Z", "entitlementCollectionId": "0KsS08cY3fjI1YTT", "entitlementOrigin": "Oculus", "itemId": "0RAyIZs2VfCRhzfK", "itemSku": "DAGIAJuPhQcZwXRE", "language": "9FOZUVTfDc3w1tAX", "metadata": {"RrQtHkm0Tthcx9W7": {}, "PkFNVa7czD4wybVj": {}, "qOKrqYGxcBxfjLUZ": {}}, "orderNo": "HK0OO1yQsMBQAdOf", "origin": "Oculus", "quantity": 60, "region": "tHWyGg5TU3INkMgj", "source": "PAYMENT", "startDate": "1973-04-24T00:00:00Z", "storeId": "x0eOw31PXkVnetcv"}]}' \
    > test.out 2>&1
eval_tap $? 478 'FulfillItems' test.out

#- 479 RetryFulfillItems
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'Auim14Wdh1qKoSDB' \
    --userId 'byqlJyfVgaW6ziZF' \
    > test.out 2>&1
eval_tap $? 479 'RetryFulfillItems' test.out

#- 480 RevokeItems
./ng net.accelbyte.sdk.cli.Main platform revokeItems \
    --namespace "$AB_NAMESPACE" \
    --transactionId '6ijZzA3MkosOcoAc' \
    --userId 'V0T2G3vQZNiqaXzR' \
    > test.out 2>&1
eval_tap $? 480 'RevokeItems' test.out

#- 481 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bra3I4K9iBdljXto' \
    --body '{"transactionId": "wifBfAw30kOykBuD"}' \
    > test.out 2>&1
eval_tap $? 481 'V2PublicFulfillAppleIAPItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE