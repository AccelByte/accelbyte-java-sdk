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
echo "1..510"

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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["REWARD", "DLC", "CAMPAIGN"]}' \
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
    --body '{"appConfig": {"appName": "ySj29a9LJE8HoRS1"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "AAMwzHPxB1UskYs4"}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "9y1aZSWMiVi10sG6"}, "customConfig": {"connectionType": "TLS", "grpcServerAddress": "MMWH8Yb33T5UBJCj"}, "extendType": "APP"}' \
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
    --storeId 'EeDxOgBnhhqElIaD' \
    > test.out 2>&1
eval_tap $? 31 'GetRootCategories' test.out

#- 32 CreateCategory
./ng net.accelbyte.sdk.cli.Main platform createCategory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ml48wdNFLTm5T50x' \
    --body '{"categoryPath": "9WT0GfH2rtOa4EXs", "localizationDisplayNames": {"XzOXQAk4mqrxzTtu": "Ll4XlbGL8QOxtjzm", "8y2wNhmwoYZyI4EF": "ZKBcYrCEAE7WIsfm", "x40NLRc6m8heKnWh": "zfe2NubeoKFeIaFQ"}}' \
    > test.out 2>&1
eval_tap $? 32 'CreateCategory' test.out

#- 33 ListCategoriesBasic
./ng net.accelbyte.sdk.cli.Main platform listCategoriesBasic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CYoDPICpnduEEQlU' \
    > test.out 2>&1
eval_tap $? 33 'ListCategoriesBasic' test.out

#- 34 GetCategory
./ng net.accelbyte.sdk.cli.Main platform getCategory \
    --categoryPath 'LdJz4mnRBkMNxvvK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gAT8mJrYq6hRkloq' \
    > test.out 2>&1
eval_tap $? 34 'GetCategory' test.out

#- 35 UpdateCategory
./ng net.accelbyte.sdk.cli.Main platform updateCategory \
    --categoryPath 'xM3gpwxcfMy9Xzjj' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I5YbsKoADkzJEN2V' \
    --body '{"localizationDisplayNames": {"Hzih3bit0VWn3CO3": "9PXDNxtXgeO3FgkX", "hjDzaQY3snn2ZkP7": "cFdP43e5dC9XIBud", "fZgrbHDIDm4hMzF4": "TxodenSrUTvfqU0b"}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCategory' test.out

#- 36 DeleteCategory
./ng net.accelbyte.sdk.cli.Main platform deleteCategory \
    --categoryPath 'foMm5cTtFWbotQyX' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JRcQWsmqPNs92epx' \
    > test.out 2>&1
eval_tap $? 36 'DeleteCategory' test.out

#- 37 GetChildCategories
./ng net.accelbyte.sdk.cli.Main platform getChildCategories \
    --categoryPath 'k0i8VxsZNereSvf9' \
    --namespace "$AB_NAMESPACE" \
    --storeId '699mCEHThUJkETAs' \
    > test.out 2>&1
eval_tap $? 37 'GetChildCategories' test.out

#- 38 GetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform getDescendantCategories \
    --categoryPath 'Sp7gh4TeUTkOkAYf' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'JB8AT9t4Tv207Y2Q' \
    > test.out 2>&1
eval_tap $? 38 'GetDescendantCategories' test.out

#- 39 QueryCodes
./ng net.accelbyte.sdk.cli.Main platform queryCodes \
    --campaignId 'D3oD5fLCr3OOlXVv' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --batchName '8ZGF7uYnGzpipNDi' \
    --batchNo '12,87,82' \
    --code 'I1AeFgPqaOkvo1ao' \
    --limit '23' \
    --offset '27' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 39 'QueryCodes' test.out

#- 40 CreateCodes
./ng net.accelbyte.sdk.cli.Main platform createCodes \
    --campaignId 'B4lkKB4EYOkQ1jMD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"batchName": "3cym8xIfkOVW2grR", "codeValue": "EOLx0KOww3HICQLf", "quantity": 23}' \
    > test.out 2>&1
eval_tap $? 40 'CreateCodes' test.out

#- 41 Download
./ng net.accelbyte.sdk.cli.Main platform download \
    --campaignId 'l9Zuhytm5UDrT6QX' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'Cs5SPBbRPZTF6oQA' \
    --batchNo '80,97,7' \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 41 'Download' test.out

#- 42 BulkDisableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkDisableCodes \
    --campaignId 'G7tnsZg5QgXjvyGJ' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'PN4eXbJE5Vs2Gcyo' \
    --batchNo '25,9,87' \
    > test.out 2>&1
eval_tap $? 42 'BulkDisableCodes' test.out

#- 43 BulkEnableCodes
./ng net.accelbyte.sdk.cli.Main platform bulkEnableCodes \
    --campaignId 'vcAx2K2zkRenmPZn' \
    --namespace "$AB_NAMESPACE" \
    --batchName 'GBt4P7WnbdSJtjX7' \
    --batchNo '29,37,13' \
    > test.out 2>&1
eval_tap $? 43 'BulkEnableCodes' test.out

#- 44 QueryRedeemHistory
./ng net.accelbyte.sdk.cli.Main platform queryRedeemHistory \
    --campaignId 'hZyZl5x4bRXBHUTr' \
    --namespace "$AB_NAMESPACE" \
    --code 'DzZSKscfOcYu3dpC' \
    --limit '89' \
    --offset '83' \
    --userId 'W5DQyj4bj5Ro2oga' \
    > test.out 2>&1
eval_tap $? 44 'QueryRedeemHistory' test.out

#- 45 GetCode
./ng net.accelbyte.sdk.cli.Main platform getCode \
    --code 'Kt2ujQSa3Zdb65UX' \
    --namespace "$AB_NAMESPACE" \
    --redeemable  \
    --withBatchName  \
    > test.out 2>&1
eval_tap $? 45 'GetCode' test.out

#- 46 DisableCode
./ng net.accelbyte.sdk.cli.Main platform disableCode \
    --code 'my0Zp6iIaTIKUkmk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DisableCode' test.out

#- 47 EnableCode
./ng net.accelbyte.sdk.cli.Main platform enableCode \
    --code 'k9QM0NBMA9ORxpzw' \
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
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 51 'ListCurrencies' test.out

#- 52 CreateCurrency
./ng net.accelbyte.sdk.cli.Main platform createCurrency \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "AK6eXUGPJsw1fiP8", "currencySymbol": "0G9Pclxcft2ulIJz", "currencyType": "REAL", "decimals": 51, "localizationDescriptions": {"rQDXuNFviMarv8mn": "fHK8CCmE2lPnsbD3", "SGEdlwuUccE536ug": "Bp3HBvepnDCjgyJl", "Xe36mgWjLfFmteue": "9nzJ6fH24T805tVg"}}' \
    > test.out 2>&1
eval_tap $? 52 'CreateCurrency' test.out

#- 53 UpdateCurrency
./ng net.accelbyte.sdk.cli.Main platform updateCurrency \
    --currencyCode '8JqU0jZpjvsugAOS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"localizationDescriptions": {"7u8RiWyerCSa8SRg": "wsAj1ik1jglaDXTv", "KCWwNTAhd2wrS0uP": "djhdinpng5BLy8wb", "hMssAHjapIkY9Rf4": "wP57dBZNR88YbCtm"}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateCurrency' test.out

#- 54 DeleteCurrency
./ng net.accelbyte.sdk.cli.Main platform deleteCurrency \
    --currencyCode 'Ky8M9zVrjfGXZnqA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'DeleteCurrency' test.out

#- 55 GetCurrencyConfig
./ng net.accelbyte.sdk.cli.Main platform getCurrencyConfig \
    --currencyCode 'QUoY1GjlIIk0iKoT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetCurrencyConfig' test.out

#- 56 GetCurrencySummary
./ng net.accelbyte.sdk.cli.Main platform getCurrencySummary \
    --currencyCode 'TS1j02o7JjTXAQN0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetCurrencySummary' test.out

#- 57 GetDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfigHistory \
    --namespace "$AB_NAMESPACE" \
    --dlcId 'qdskdQV0TqI8EFnm' \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfigHistory' test.out

#- 58 RestoreDLCItemConfigHistory
./ng net.accelbyte.sdk.cli.Main platform restoreDLCItemConfigHistory \
    --id 'DbxIxi4YKlONk2Q5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'RestoreDLCItemConfigHistory' test.out

#- 59 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'GetDLCItemConfig' test.out

#- 60 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"autoUpdate": true, "enableRevocation": true, "id": "2aCNYIWekp18lOC3", "rewards": [{"currency": {"currencyCode": "mNqF7Bl0LcghVHfP", "namespace": "EspxwhRON0bc1eMb"}, "item": {"itemId": "EIjowLqc3ecjXJbZ", "itemName": "DKKoxLE1Y3Dymtj3", "itemSku": "giPg4x4yiPX6ues1", "itemType": "Hhhkg1yLVbLFzHEP"}, "quantity": 54, "type": "CURRENCY"}, {"currency": {"currencyCode": "KSiPW3VgsZXiR1DJ", "namespace": "7HVWqMkNSawQUWDF"}, "item": {"itemId": "JvJBWic7UkBeIXuq", "itemName": "DuAXI66bQ71w0deo", "itemSku": "V9Lx5RDA1l2Xcrci", "itemType": "YNEzvSZIPkhSgORc"}, "quantity": 53, "type": "ITEM"}, {"currency": {"currencyCode": "S5BvmgBLxh4ijFnE", "namespace": "3Tam69qSZ7PC6f6Q"}, "item": {"itemId": "kmZXElW9YfRSse6A", "itemName": "Az3S4czz0QKFlAVm", "itemSku": "VLu4AOec0z8eBeeo", "itemType": "ip68J1nsv4W2OJht"}, "quantity": 0, "type": "CURRENCY"}], "rvn": 47}, {"autoUpdate": true, "enableRevocation": false, "id": "JlHeb34sZKHcl5LL", "rewards": [{"currency": {"currencyCode": "LOexL4fZvWtND2tc", "namespace": "BFpX8lNtFEJ7tnkY"}, "item": {"itemId": "6Mca5afj12K2IzrB", "itemName": "vvWm4udE0OXudXgN", "itemSku": "ne8kJATwlc6esUp6", "itemType": "Sw1I98jeZQ7hfxnh"}, "quantity": 76, "type": "ITEM"}, {"currency": {"currencyCode": "d3Knaknoed9DHhLO", "namespace": "qQGhCUr6iTrjyEga"}, "item": {"itemId": "rAdNJOIG36I6tRbR", "itemName": "crEveMdAdiPKDUVS", "itemSku": "C00PYeDcagginxnF", "itemType": "Ina3yddcbsPheTH2"}, "quantity": 15, "type": "CURRENCY"}, {"currency": {"currencyCode": "JNvYuGRUvpZaHCuE", "namespace": "SOiIZsMfB4ZH3mtg"}, "item": {"itemId": "WgU4pCAKxeE70Cau", "itemName": "nQNxot371W9G4AvQ", "itemSku": "kqsGnmyo5JJTUVmb", "itemType": "8GEXFTlEMEsFzYqw"}, "quantity": 14, "type": "CURRENCY"}], "rvn": 22}, {"autoUpdate": false, "enableRevocation": false, "id": "cVTd4BxqGWV6mTJ0", "rewards": [{"currency": {"currencyCode": "sQs6XNbjvqhnUVLW", "namespace": "u8olKdxL6ozRmDD0"}, "item": {"itemId": "jJvlfV5OemPYdYT7", "itemName": "DROCjtuzFMbAG9YI", "itemSku": "89hmguB8FOTjMLo4", "itemType": "b9rIzqYkEpstyVTB"}, "quantity": 5, "type": "ITEM"}, {"currency": {"currencyCode": "G59e0k5ZtX6wK7Pp", "namespace": "UlcIW32iK7MGt1ix"}, "item": {"itemId": "Y5rA1WoVeJIePF8Z", "itemName": "rQzP4zvtdxdbZUpd", "itemSku": "6FJtHJ1pyVwyKQLY", "itemType": "6FEO65Rb3z7CYLM8"}, "quantity": 70, "type": "CURRENCY"}, {"currency": {"currencyCode": "s7QBlk44Z44B1GZg", "namespace": "Kg4uKxaCgcGLuC3b"}, "item": {"itemId": "rWdTYCfHkIySok5D", "itemName": "iXZtLW87rGysryod", "itemSku": "3dNQrmsApRA6HX3R", "itemType": "wrKt2ecozL0TOg54"}, "quantity": 44, "type": "ITEM"}], "rvn": 63}]}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateDLCItemConfig' test.out

#- 61 DeleteDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteDLCItemConfig' test.out

#- 62 GetPlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'GetPlatformDLCConfig' test.out

#- 63 UpdatePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"platform": "OCULUS", "platformDlcIdMap": {"L5oLF6M4lNa4JUMS": "HNgqRqCV7usamANk", "ZlOX9Sfo95HgXqKh": "TPkwfLM9uSybRzWe", "k2gZvRrvr0n9d9lv": "ccKMLhrTrcBE2ItB"}}, {"platform": "EPICGAMES", "platformDlcIdMap": {"3KtKZWe8aoFzAyBM": "E74HUtipUWYhWV1q", "x8CzPML52faXUr9S": "k4lq2faBcAXXKlhv", "yH8paOJtxqMPpcVf": "RwNj547fH0XrKEDp"}}, {"platform": "STEAM", "platformDlcIdMap": {"zh4pTU0Am4DZhl0b": "QxFJ3sWCqQpQ2FbK", "PFMycMSQ4qfAacR0": "LgB5BUXvjcu2s6w3", "VifnKqmTSoGH1XEf": "Y6QAYn6WQ5UBEU1Q"}}]}' \
    > test.out 2>&1
eval_tap $? 63 'UpdatePlatformDLCConfig' test.out

#- 64 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'DeletePlatformDLCConfig' test.out

#- 65 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --entitlementClazz 'MEDIA' \
    --entitlementName 'OHfZiGhxOdcuDXSx' \
    --itemId 'Sc3aZPV87pna08gx,efTYKhuxaEc7M4P7,UckSC6ePeN8i4GrF' \
    --limit '62' \
    --offset '43' \
    --origin 'Playstation' \
    --userId 'J03BAHZ7c53q7akM' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements' test.out

#- 66 QueryEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform queryEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'pcmnnx6RVBrop9v7,aZK3h65hbN15zfQS,fQrtfF3TQN0OcNDL' \
    --limit '35' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 66 'QueryEntitlementsByItemIds' test.out

#- 67 EnableEntitlementOriginFeature
./ng net.accelbyte.sdk.cli.Main platform enableEntitlementOriginFeature \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'EnableEntitlementOriginFeature' test.out

#- 68 GetEntitlementConfigInfo
./ng net.accelbyte.sdk.cli.Main platform getEntitlementConfigInfo \
    --namespace "$AB_NAMESPACE" \
    --withoutCache  \
    > test.out 2>&1
eval_tap $? 68 'GetEntitlementConfigInfo' test.out

#- 69 GrantEntitlements
./ng net.accelbyte.sdk.cli.Main platform grantEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlementGrantList": [{"collectionId": "36vzohZyjMQAg5mP", "endDate": "1996-02-26T00:00:00Z", "grantedCode": "9pysFO3Zvc1BZG99", "itemId": "LyvfvHEsJKQQewVL", "itemNamespace": "MUoAnaRcYp7FUjfI", "language": "iALF_tFLX-xz", "metadata": {"sF6xG2mXEQdbzIVy": {}, "8alncV7vWgSHdfo0": {}, "7UctPErqxyMyOK06": {}}, "origin": "Twitch", "quantity": 91, "region": "qQBErxgjVBycvU4P", "source": "ACHIEVEMENT", "startDate": "1978-04-13T00:00:00Z", "storeId": "O05oKqymxLD1Lcvw"}, {"collectionId": "6T6mZEiwxxElpMYS", "endDate": "1995-10-07T00:00:00Z", "grantedCode": "0zMjhTHeh94TSenE", "itemId": "5hCFkIf5weqZ18MH", "itemNamespace": "57l2Zsrh90ETtYmG", "language": "EKa", "metadata": {"MnlrjcHp6B8Vj7rX": {}, "FgDnDkdZ9bpjb1td": {}, "A3QhjCMW64f4XhIj": {}}, "origin": "Nintendo", "quantity": 29, "region": "Xn77AtYoFzLAATPY", "source": "REDEEM_CODE", "startDate": "1999-11-29T00:00:00Z", "storeId": "zTxBGtEJIYppuUSs"}, {"collectionId": "KoHw2hyd12uSE7BE", "endDate": "1982-05-25T00:00:00Z", "grantedCode": "3aevq6iohU1cg4W1", "itemId": "IS3Uv1BpWoJBaqdg", "itemNamespace": "2FHcunsS1lnaO2m9", "language": "RJT", "metadata": {"beK2qN8g6x2PyYDo": {}, "5R3hLiD5sf5y1Jsx": {}, "JNGmyt0SQDUDoWBZ": {}}, "origin": "System", "quantity": 66, "region": "LlkUetzCAWc9x1aM", "source": "IAP", "startDate": "1979-02-19T00:00:00Z", "storeId": "A2clJ5gEOaCgM6Yn"}], "userIds": ["5mM7k8nbLzvtCIW5", "ynMKquUicAeIVXto", "6RugbNEIpGBFUjOn"]}' \
    > test.out 2>&1
eval_tap $? 69 'GrantEntitlements' test.out

#- 70 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["WAXhMlW4tLqX7OIC", "f5oD1e6oI9FmYel0", "kOw72o8Zkgk0jS6r"]' \
    > test.out 2>&1
eval_tap $? 70 'RevokeEntitlements' test.out

#- 71 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'DWUwfhKvrf2AaH4y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetEntitlement' test.out

#- 72 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '91' \
    --status 'SUCCESS' \
    --userId 'rHSppnIZkNnTn3rz' \
    > test.out 2>&1
eval_tap $? 72 'QueryFulfillmentHistories' test.out

#- 73 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'H5NvAtcvNedgS1fU' \
    --eventType 'CHARGEBACK' \
    --externalOrderId 'PzySa0sZoFS6xCOW' \
    --limit '78' \
    --offset '60' \
    --startTime 'pyh9pMsQgb64ELbz' \
    --status 'SUCCESS' \
    --userId 'DZrpP7rz3ISW510k' \
    > test.out 2>&1
eval_tap $? 73 'QueryIAPClawbackHistory' test.out

#- 74 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "Hr4isTKWjmv67nuH", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 58, "clientTransactionId": "XrDZWlGVE9sJ4NpU"}, {"amountConsumed": 41, "clientTransactionId": "VVFfpqx1AeLtzcPJ"}, {"amountConsumed": 74, "clientTransactionId": "jtDYBo4FUTH7CGfK"}], "entitlementId": "SyxgRR1DiCqSMzpq", "usageCount": 70}, {"clientTransaction": [{"amountConsumed": 66, "clientTransactionId": "FGLkDs7ACC1RgBfo"}, {"amountConsumed": 81, "clientTransactionId": "V31MfuGaXsAuGsZa"}, {"amountConsumed": 91, "clientTransactionId": "YhyiDV90SeI5yppB"}], "entitlementId": "HoytVznCgNyx9fbT", "usageCount": 16}, {"clientTransaction": [{"amountConsumed": 95, "clientTransactionId": "ShEh8PbGikLjgjcj"}, {"amountConsumed": 86, "clientTransactionId": "uulU6FYBZsWFbr3R"}, {"amountConsumed": 91, "clientTransactionId": "h3OMjAjq2mK8lbSE"}], "entitlementId": "Eelxnb5QxWG2HFnZ", "usageCount": 23}], "purpose": "X4N1LQZmB61JMdtw"}, "originalTitleName": "CVUrYQue84dwmbwF", "paymentProductSKU": "EnAZaWsQJtRYoagR", "purchaseDate": "JK5PX9UcOvhPyE11", "sourceOrderItemId": "TRT2SKseoe8VLie0", "titleName": "LBa36KNzjf005CXN"}, "eventDomain": "GehQ2aTjTDfKFDXC", "eventSource": "7eGL5YhJDWh9YWqc", "eventType": "0qgV6d9yOfIMLds2", "eventVersion": 60, "id": "entgn3DhqciwIeSh", "timestamp": "F9RKb9vvxuJlhXbW"}' \
    > test.out 2>&1
eval_tap $? 74 'MockPlayStationStreamEvent' test.out

#- 75 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "hbwPwToC6knjVwVn", "eventState": "zaqSfJiQFC2gXoda", "lineItemId": "0kg16yUSpSOAjHJW", "orderId": "wfCjYwWkLob9gKLq", "productId": "s2nEZhpByfHZinxN", "productType": "fgPAwkMBsznlBUqn", "purchasedDate": "LT4AbGptKaWNvPbp", "sandboxId": "g7yrRvXfZ6rvgvEY", "skuId": "3Hht1SwqTsKKKo37", "subscriptionData": {"consumedDurationInDays": 81, "dateTime": "iEd0JPxVyQpshaDw", "durationInDays": 81, "recurrenceId": "dS6hIH9c4Vfkyrwp"}}, "datacontenttype": "uXxbaERbfgPmi0eH", "id": "kt1mr9EOIFg0dnWI", "source": "YN2NVL70Iw157g00", "specVersion": "jr9b8MuYmmeKTmBN", "subject": "vGYxEQdf3ewoGGoY", "time": "7xmFNAmjDDCvs78m", "traceparent": "cMdiS76YApGJ9ufw", "type": "LYkqIgLuZS6hsQry"}' \
    > test.out 2>&1
eval_tap $? 75 'MockXblClawbackEvent' test.out

#- 76 GetAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'GetAppleIAPConfig' test.out

#- 77 UpdateAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appAppleId": 17, "bundleId": "4NhGztZpr4U4fwQI", "issuerId": "iLXgmRasvjO4lj8m", "keyId": "3XEwP2b4gd3xOeii", "password": "8Jnmssep2xD2NY0k", "version": "V2"}' \
    > test.out 2>&1
eval_tap $? 77 'UpdateAppleIAPConfig' test.out

#- 78 DeleteAppleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteAppleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 78 'DeleteAppleIAPConfig' test.out

#- 79 UpdateAppleP8File
./ng net.accelbyte.sdk.cli.Main platform updateAppleP8File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 79 'UpdateAppleP8File' test.out

#- 80 GetEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 80 'GetEpicGamesIAPConfig' test.out

#- 81 UpdateEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"sandboxId": "j3cvRFaTC11W0TGT"}' \
    > test.out 2>&1
eval_tap $? 81 'UpdateEpicGamesIAPConfig' test.out

#- 82 DeleteEpicGamesIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteEpicGamesIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'DeleteEpicGamesIAPConfig' test.out

#- 83 GetGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 83 'GetGoogleIAPConfig' test.out

#- 84 UpdateGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"applicationName": "Cm4fZWuk6pQxDQpK", "notificationTokenAudience": "qxLGeMvr9TsvcMQ7", "notificationTokenEmail": "dBsaIecRxIsZvD6r", "packageName": "mzVr5XT1Nxw0v1dM", "serviceAccountId": "Q9Rrbk6C2cVWf6tt"}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateGoogleIAPConfig' test.out

#- 85 DeleteGoogleIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteGoogleIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'DeleteGoogleIAPConfig' test.out

#- 86 UpdateGoogleP12File
./ng net.accelbyte.sdk.cli.Main platform updateGoogleP12File \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 86 'UpdateGoogleP12File' test.out

#- 87 GetIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform getIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 87 'GetIAPItemConfig' test.out

#- 88 UpdateIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"itemIdentity": "vbU1PO6ApCD2VXid", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"7w0Oc15N8WXBPp17": "PAewqSm5x3B4t7WQ", "np8jXZedgt5cyNe2": "7HLtwtVOaxgP6Jbc", "t8puMybYGxD9IPmm": "sLmu3kaPj0O4zd8T"}}, {"itemIdentity": "b7cUNGPTBxiFFCrn", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"XMjlVHY1AHwF3vGo": "av7MK0PcLnEkcokK", "wcQ0baDT9OyJ2h23": "GUS2amU7syGlElXd", "EAOrVSnLocLVVYam": "Qc4wcG5nDBLJoJHb"}}, {"itemIdentity": "iQ5duE5p4cfs2E41", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"guwuJCW7EEFB67AO": "Dbi9BzupBsFpYc77", "GtRUcCFeY5g4XgBs": "bfzqxBPNe8ae1Il4", "aAtEbu4IjGdqthRx": "TjQ7gkZEY8rG0q0Q"}}]}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateIAPItemConfig' test.out

#- 89 DeleteIAPItemConfig
./ng net.accelbyte.sdk.cli.Main platform deleteIAPItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 89 'DeleteIAPItemConfig' test.out

#- 90 GetOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 90 'GetOculusIAPConfig' test.out

#- 91 UpdateOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "2Qd2JzRbkF2I03dI", "appSecret": "jvBbA6bfbYaJCJjf", "webhookVerifyToken": "k2TUvn95FhO7VW3m"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateOculusIAPConfig' test.out

#- 92 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeleteOculusIAPConfig' test.out

#- 93 ListOculusSubscriptionGroups
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroups \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'ListOculusSubscriptionGroups' test.out

#- 94 CreateOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform createOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"sku": "bDVMDu87t0ldWf7i"}' \
    > test.out 2>&1
eval_tap $? 94 'CreateOculusSubscriptionGroup' test.out

#- 95 DeleteOculusSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --sku 'SGIiKFtWtn4Yr2sv' \
    > test.out 2>&1
eval_tap $? 95 'DeleteOculusSubscriptionGroup' test.out

#- 96 ListOculusSubscriptionGroupTier
./ng net.accelbyte.sdk.cli.Main platform listOculusSubscriptionGroupTier \
    --namespace "$AB_NAMESPACE" \
    --sku 'KM6pqLGZ0TBujELA' \
    > test.out 2>&1
eval_tap $? 96 'ListOculusSubscriptionGroupTier' test.out

#- 97 AddTierIntoMetaQuestSubscriptionGroup
./ng net.accelbyte.sdk.cli.Main platform addTierIntoMetaQuestSubscriptionGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupSku": "UK6mQ5iZgbwwm5iG", "sku": "zXtcknrgidKupvXO"}' \
    > test.out 2>&1
eval_tap $? 97 'AddTierIntoMetaQuestSubscriptionGroup' test.out

#- 98 DeleteOculusSubscriptionTier
./ng net.accelbyte.sdk.cli.Main platform deleteOculusSubscriptionTier \
    --namespace "$AB_NAMESPACE" \
    --sku '6aj4hCmTC34jxW4p' \
    > test.out 2>&1
eval_tap $? 98 'DeleteOculusSubscriptionTier' test.out

#- 99 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 99 'GetPlayStationIAPConfig' test.out

#- 100 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "IDwdqXpmRmut9H9X", "backOfficeServerClientSecret": "yWI8bp8fQxRuX91u", "enableStreamJob": true, "environment": "mtrHJbEGTUj7YjER", "streamName": "L1rEQG02zccA8wvL", "streamPartnerName": "sWUNd6lPKvqDejvq"}' \
    > test.out 2>&1
eval_tap $? 100 'UpdatePlaystationIAPConfig' test.out

#- 101 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'DeletePlaystationIAPConfig' test.out

#- 102 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 102 'ValidateExistedPlaystationIAPConfig' test.out

#- 103 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "klTSvDwuOrP9lzpi", "backOfficeServerClientSecret": "X0VuFpZum7izxe7N", "enableStreamJob": true, "environment": "mwJSrN8jkIykR2zb", "streamName": "aI6PD7fEscShnGUG", "streamPartnerName": "UtV9GJ279GDbLNwj"}' \
    > test.out 2>&1
eval_tap $? 103 'ValidatePlaystationIAPConfig' test.out

#- 104 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetSteamIAPConfig' test.out

#- 105 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "m3FK0nnX2poMfZ1h", "env": "SANDBOX", "publisherAuthenticationKey": "z0YqCKUh5RD9vNAp", "syncMode": "INVENTORY"}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateSteamIAPConfig' test.out

#- 106 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'DeleteSteamIAPConfig' test.out

#- 107 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 107 'GetTwitchIAPConfig' test.out

#- 108 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "SoiIPp1yvfAHS0Vg", "clientSecret": "Lu11A3HTovFi4tPA", "organizationId": "GfleyCA6jEtcqsnz"}' \
    > test.out 2>&1
eval_tap $? 108 'UpdateTwitchIAPConfig' test.out

#- 109 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 109 'DeleteTwitchIAPConfig' test.out

#- 110 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'GetXblIAPConfig' test.out

#- 111 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableClawback": false, "entraAppClientId": "LJXJ7mpVI6eTYAjd", "entraAppClientSecret": "PlCiQQC35cj4KyOV", "entraTenantId": "gvnWbfRJtsB7cUQZ", "relyingPartyCert": "2QUAxJrINPXppPNO"}' \
    > test.out 2>&1
eval_tap $? 111 'UpdateXblIAPConfig' test.out

#- 112 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'DeleteXblAPConfig' test.out

#- 113 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password '3AfmXcgwC3IN6tvK' \
    > test.out 2>&1
eval_tap $? 113 'UpdateXblBPCertFile' test.out

#- 114 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'gLB9QmJIOq9dP5sz' \
    --externalId 'G71utjsQ4CrRb9gU' \
    --limit '58' \
    --offset '9' \
    --source 'STEAM' \
    --startDate 'Vz7fWbZIdhevfZvy' \
    --status 'WARN' \
    --type 'WeYeA9t2ENKKWrFt' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartyNotifications' test.out

#- 115 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '47' \
    --orderId 'Ii1CMgKAOG5iDcCR' \
    --steamId '5PbCvDLil8wj9cKM' \
    > test.out 2>&1
eval_tap $? 115 'QueryAbnormalTransactions' test.out

#- 116 AdminGetSteamJobInfo
./ng net.accelbyte.sdk.cli.Main platform adminGetSteamJobInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 116 'AdminGetSteamJobInfo' test.out

#- 117 AdminResetSteamJobTime
./ng net.accelbyte.sdk.cli.Main platform adminResetSteamJobTime \
    --namespace "$AB_NAMESPACE" \
    --body '{"env": "SANDBOX", "lastTime": "1984-10-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 117 'AdminResetSteamJobTime' test.out

#- 118 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'r6MF35hCER4nGmWG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 118 'AdminRefundIAPOrder' test.out

#- 119 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --offset '73' \
    --orderId 'TJfHlJl4tHGa4XfZ' \
    --processStatus 'ERROR' \
    --steamId 'A3r0u4q1bTHXIjfJ' \
    > test.out 2>&1
eval_tap $? 119 'QuerySteamReportHistories' test.out

#- 120 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'KyFlM0u1uuoVdn9y' \
    --limit '97' \
    --offset '30' \
    --platform 'GOOGLE' \
    --productId 'f5KwMZQjzvjSozv6' \
    --userId 'CTRDl0zp9CzHFwin' \
    > test.out 2>&1
eval_tap $? 120 'QueryThirdPartySubscription' test.out

#- 121 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'kBNi4gvqgl6TZ9TG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 121 'GetIAPOrderConsumeDetails' test.out

#- 122 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'VPmv34h6T7Esufmf' \
    --feature 'xKYB4LM6H6QXmpZ9' \
    --itemId 'X3fUSR1l9xLPBsmA' \
    --itemType 'EXTENSION' \
    --startTime 'nqxT1WsRNMZcA92h' \
    > test.out 2>&1
eval_tap $? 122 'DownloadInvoiceDetails' test.out

#- 123 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'zC7MNa8vVe4MHX6A' \
    --feature 'gMep90AyyUJyAK5P' \
    --itemId 'RMRMwdvl0hv6g62G' \
    --itemType 'LOOTBOX' \
    --startTime 'VE7L9FK6e0MrPc4v' \
    > test.out 2>&1
eval_tap $? 123 'GenerateInvoiceSummary' test.out

#- 124 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'txk9hVKlG56HlzGr' \
    --body '{"categoryPath": "7XjdyRJunZPkp6cc", "targetItemId": "IBnWyPw8mj7gyQ7X", "targetNamespace": "dIszGRj46COPipH1"}' \
    > test.out 2>&1
eval_tap $? 124 'SyncInGameItem' test.out

#- 125 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MWVTHG0qHJCWEfOJ' \
    --body '{"appId": "pZm9yEYWNGMy2pgS", "appType": "DEMO", "baseAppId": "SUOK68eqGJtWf1Yb", "boothName": "gg8rdwY9bmrvHmO0", "categoryPath": "7KNqX9LM2IwEsdOG", "clazz": "BXBwnzDX8v3xgC1G", "displayOrder": 9, "entitlementType": "CONSUMABLE", "ext": {"PdbTTAJ2Gp1r0sVZ": {}, "6LJAOddIL2l3hPjN": {}, "DKv2LWfXqjr8fS79": {}}, "features": ["tiQ272Uo9UBJWodp", "En3wYowBdkaZ3y6i", "38XQjLDRqkpiFK5B"], "flexible": false, "images": [{"as": "AHyCK5tNanGBrkzU", "caption": "vck3xTtmOFMebS4A", "height": 7, "imageUrl": "lzxl0yF5m77TTh4g", "smallImageUrl": "Uoj8u2WRcLiEtzVl", "width": 28}, {"as": "rNXnGanMazb8jvRW", "caption": "enURH48aJuALEcSq", "height": 5, "imageUrl": "iAsR65yQ9ssuHdGm", "smallImageUrl": "xncCEr0KcgeqzGbr", "width": 42}, {"as": "eATj7eGjodd7CcJU", "caption": "rI6MAugK5kypNrp2", "height": 27, "imageUrl": "FxKybPkbuS6x9cLJ", "smallImageUrl": "1APnNlsa2bRBr27f", "width": 99}], "inventoryConfig": {"customAttributes": {"l9U4jReteIMgzISo": {}, "mCsodJrhQW41q2Os": {}, "pCZbt3Uta5I0uGcL": {}}, "serverCustomAttributes": {"1koyHjCH5olYLETR": {}, "pABAmO2EGvJ4UMS9": {}, "3yOxNInDByhnoluO": {}}, "slotUsed": 2}, "itemId": "ti0QP2ssiJ66OzOj", "itemIds": ["84O6tgohjtC7bzjP", "pucddXJ5zifF8y95", "9anrNSleywHbHig6"], "itemQty": {"IKWVZ77KeRWdECaF": 66, "9ukcR6c2E2r3vk3I": 10, "23SzUo4hNBDh9ZFP": 82}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"W0nXOErQPS4VsRoY": {"description": "IK69yg9ADCGiXaLs", "localExt": {"2xjHkinOD975nARH": {}, "CmhNHSXuqIHsxvaU": {}, "oXDmwWsukxncuD3Q": {}}, "longDescription": "xCXMd00YBWCaVVmM", "title": "45mfIZsWhkS476dG"}, "GJwJ00UH197MJ6zU": {"description": "7JLMQyMWzYQCAaPJ", "localExt": {"goxGJoJaSzUtY4ZD": {}, "0Xtb0U4pH16NUsVY": {}, "21NVIs7NRen2Y3Ns": {}}, "longDescription": "0QJQeaWytPfds1BY", "title": "x0EaURydf8ZyyZeH"}, "AWGgJUbUJRMbkcTg": {"description": "lbU86FyOjApNHBVf", "localExt": {"NOURcjY3YYT9oTyn": {}, "mfIuBWgJTNFfM8M0": {}, "IW4oe8KDgy0xZfAc": {}}, "longDescription": "Ng14Ws8TIP1LKiFQ", "title": "oLDvumfqrgSfnx2h"}}, "lootBoxConfig": {"rewardCount": 59, "rewards": [{"lootBoxItems": [{"count": 4, "duration": 82, "endDate": "1988-01-27T00:00:00Z", "itemId": "sQ3PuppUxDSK8aOT", "itemSku": "GMudcxlCV4cNbJGQ", "itemType": "57lPdinpjS2DRfGt"}, {"count": 18, "duration": 66, "endDate": "1990-03-30T00:00:00Z", "itemId": "cdlbdRXTGIrdNL5g", "itemSku": "JPqTAjgqaTHf1ANT", "itemType": "J9Yk997XkGOdC6It"}, {"count": 47, "duration": 61, "endDate": "1979-06-29T00:00:00Z", "itemId": "8p4n4XCFkD1AJLCw", "itemSku": "szbZxuHSgDOK8bjo", "itemType": "F7bL2635KbtZTGJp"}], "name": "qgl2IzNXGTuQPIDp", "odds": 0.23145627386110124, "type": "REWARD", "weight": 43}, {"lootBoxItems": [{"count": 39, "duration": 59, "endDate": "1971-04-15T00:00:00Z", "itemId": "JLNNz6QIVC9Mfuc8", "itemSku": "VOsnmnlVljdWYmEL", "itemType": "e74p38vumnxAnYBT"}, {"count": 47, "duration": 69, "endDate": "1971-11-29T00:00:00Z", "itemId": "TIz0jcgDI8Pkz96v", "itemSku": "d80msqIm5bufnBqr", "itemType": "pLeqhwVhjnnjKMEm"}, {"count": 40, "duration": 10, "endDate": "1971-11-03T00:00:00Z", "itemId": "iWsAQHbMrKYi0Zxs", "itemSku": "5SWCqZXHLLa31oQf", "itemType": "7BULnZDhutDM6Bqg"}], "name": "uqD5xxGxBWtnTKUe", "odds": 0.8814334920984954, "type": "REWARD", "weight": 67}, {"lootBoxItems": [{"count": 27, "duration": 88, "endDate": "1980-06-09T00:00:00Z", "itemId": "qPzPkwCBo2SwCUsT", "itemSku": "ag4MLAo3m61P2xaN", "itemType": "fmn8Onb1a9gMz0F2"}, {"count": 95, "duration": 40, "endDate": "1985-08-06T00:00:00Z", "itemId": "RmMhAbUWmFhdYLWz", "itemSku": "Muv3zkUY0n0BAZkw", "itemType": "bYkBLyO6A0Fqfhna"}, {"count": 57, "duration": 69, "endDate": "1999-09-20T00:00:00Z", "itemId": "xKNdOTacCcJfIfXs", "itemSku": "huLUk5WdpxjZx5no", "itemType": "XPhPUTKbonoucNmz"}], "name": "wOZOK56sDkci5rZ8", "odds": 0.1324343054926651, "type": "REWARD_GROUP", "weight": 72}], "rollFunction": "CUSTOM"}, "maxCount": 8, "maxCountPerUser": 83, "name": "lt7rjF5RaJwvkWVc", "optionBoxConfig": {"boxItems": [{"count": 30, "duration": 35, "endDate": "1999-10-30T00:00:00Z", "itemId": "b1XTB9YQzUJ9XlYJ", "itemSku": "8BzP6EUmUXGM5anI", "itemType": "loyj9lhbvuQdW2jw"}, {"count": 75, "duration": 64, "endDate": "1995-01-16T00:00:00Z", "itemId": "JKZFNk2NKy59X8iO", "itemSku": "g2sVBiCoeC5weXJl", "itemType": "7PeiMH8z8dVej8N2"}, {"count": 49, "duration": 32, "endDate": "1982-10-25T00:00:00Z", "itemId": "VTnOK7xAvM7tuL81", "itemSku": "lsR7xxSVp3Gd2TK0", "itemType": "HzYviTgYmx82JVBR"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 91, "fixedTrialCycles": 71, "graceDays": 65}, "regionData": {"z8tne5dbguBF6Gsv": [{"currencyCode": "vdl8jHz9x7XZIjU4", "currencyNamespace": "IK9lOLaZaMphKCqT", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1999-03-15T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1972-10-29T00:00:00Z", "expireAt": "1975-11-25T00:00:00Z", "price": 10, "purchaseAt": "1990-10-14T00:00:00Z", "trialPrice": 13}, {"currencyCode": "joEEXBLIxGnNuhoJ", "currencyNamespace": "M3WWPvvCiCf33ViE", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1979-12-22T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1993-05-03T00:00:00Z", "expireAt": "1974-05-03T00:00:00Z", "price": 47, "purchaseAt": "1987-03-26T00:00:00Z", "trialPrice": 99}, {"currencyCode": "UWNizk5UcPAGv6c1", "currencyNamespace": "ESC6hZYTYZbzf5aA", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1996-05-28T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1974-03-29T00:00:00Z", "expireAt": "1985-02-24T00:00:00Z", "price": 55, "purchaseAt": "1993-10-24T00:00:00Z", "trialPrice": 48}], "ZNUHbIT9szApmWJO": [{"currencyCode": "5vzzXZj08a6K1XRV", "currencyNamespace": "friSpPFnZBJZkDnE", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1995-02-07T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1971-03-10T00:00:00Z", "expireAt": "1999-11-04T00:00:00Z", "price": 42, "purchaseAt": "1980-03-11T00:00:00Z", "trialPrice": 27}, {"currencyCode": "3lvozTt9TsH7A0Tu", "currencyNamespace": "U2aL4bPkk11sys6G", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1976-08-27T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-04-30T00:00:00Z", "expireAt": "1980-01-22T00:00:00Z", "price": 42, "purchaseAt": "1998-09-09T00:00:00Z", "trialPrice": 72}, {"currencyCode": "brTFznTgDIwZIRWf", "currencyNamespace": "6T3by2kYSCdnFKLc", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1972-01-16T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-05-17T00:00:00Z", "expireAt": "1976-03-19T00:00:00Z", "price": 7, "purchaseAt": "1993-01-15T00:00:00Z", "trialPrice": 6}], "EfU61OJYMnW49rWy": [{"currencyCode": "np1ck1vT90C6o86c", "currencyNamespace": "SRL9cgbUmulhe98o", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1989-10-28T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1977-09-07T00:00:00Z", "expireAt": "1992-03-05T00:00:00Z", "price": 64, "purchaseAt": "1972-07-02T00:00:00Z", "trialPrice": 8}, {"currencyCode": "9GYxjiiOQAD77ci0", "currencyNamespace": "vfWVZoRRMPi57HyK", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1985-04-16T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1983-10-12T00:00:00Z", "expireAt": "1989-06-13T00:00:00Z", "price": 51, "purchaseAt": "1977-07-20T00:00:00Z", "trialPrice": 74}, {"currencyCode": "v6gFZXI5nXJ7hLi6", "currencyNamespace": "HweweRmyo91dIn7Q", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1979-08-28T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1996-10-11T00:00:00Z", "expireAt": "1999-01-13T00:00:00Z", "price": 87, "purchaseAt": "1979-12-30T00:00:00Z", "trialPrice": 34}]}, "saleConfig": {"currencyCode": "PAd9sxoLnWGP1Paf", "price": 70}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "ce0KbNN7Ycl2JfmQ", "stackable": false, "status": "ACTIVE", "tags": ["NL4lU6jaGfsD1cfs", "lvGjVQ4aebjfgGu4", "72oWJlfglLM4xjfk"], "targetCurrencyCode": "wmeFpvtDtetoQVFL", "targetNamespace": "8LNW11vtpaTxi7k4", "thumbnailUrl": "89jRCn48bvkCPfKo", "useCount": 11}' \
    > test.out 2>&1
eval_tap $? 125 'CreateItem' test.out

#- 126 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '0Wj1WfzIvc3VlSXr' \
    --appId 'A3XUGud4tVjmxEf4' \
    > test.out 2>&1
eval_tap $? 126 'GetItemByAppId' test.out

#- 127 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --availableDate 'ak7ISDrBVg6NuDZv' \
    --baseAppId 'Pb1kuUfNfUDe4g7q' \
    --categoryPath '6PHEaqbzHvDDl1ji' \
    --features 'Lw3XMGBA6JXDpA1t' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --limit '4' \
    --offset '58' \
    --region '4xYiLjLyZrXr9Bht' \
    --sortBy 'createdAt,updatedAt,name:asc' \
    --storeId 'UwJnUpryDeRcpUvl' \
    --tags 'rw2MwC1uuokpaIjL' \
    --targetNamespace '0Vxe5n9Lx3QcFo9g' \
    > test.out 2>&1
eval_tap $? 127 'QueryItems' test.out

#- 128 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features 'xOgvDc7xMrRKvw8I,SP2WKmCRRXBxlalC,HtWlKxLpS8fLWoQ5' \
    > test.out 2>&1
eval_tap $? 128 'ListBasicItemsByFeatures' test.out

#- 129 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'nuJhatQPxR7dvBVC' \
    --itemIds '5zgOKLTDmHe8c1eJ' \
    > test.out 2>&1
eval_tap $? 129 'GetItems' test.out

#- 130 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '9sde7Ryt4udIv22M' \
    --sku '18uux9xBomQFPFWy' \
    > test.out 2>&1
eval_tap $? 130 'GetItemBySku' test.out

#- 131 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language '5cwNPI6aFo0MVwDZ' \
    --populateBundle  \
    --region 'CIXFNEL3uWVRz3V7' \
    --storeId 'YbJM3bNLWHAbCZix' \
    --sku 'e2cQ6O30lpzcBQMA' \
    > test.out 2>&1
eval_tap $? 131 'GetLocaleItemBySku' test.out

#- 132 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'EcNcJqrKxnMzSYoc' \
    --region '4ZjiMY4H34B6wVd8' \
    --storeId 'ipcKDwQeUWtjCC2U' \
    --itemIds 'H6jzMO3AfmOS5mQN' \
    --userId 'yRPZFPNP56l1AT6O' \
    > test.out 2>&1
eval_tap $? 132 'GetEstimatedPrice' test.out

#- 133 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'LKmZhCZxxPPdPwOt' \
    --sku 'EuWBSO2jJepUnEEg' \
    > test.out 2>&1
eval_tap $? 133 'GetItemIdBySku' test.out

#- 134 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'ja2mIE2kLTnJwc5X,mkCuL5W4tKt6G3j9,LYdG7xVPqBqe9RDQ' \
    --storeId 'MBSYAFLqp8PF5hCc' \
    > test.out 2>&1
eval_tap $? 134 'GetBulkItemIdBySkus' test.out

#- 135 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'oukWpnbz4ys7j6lx' \
    --region 'uU3u2HEG0qfKegvF' \
    --storeId 'TD1sPykS8YLmwtYg' \
    --itemIds 'WGcA0h4G1LZ1HaX5' \
    > test.out 2>&1
eval_tap $? 135 'BulkGetLocaleItems' test.out

#- 136 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 136 'GetAvailablePredicateTypes' test.out

#- 137 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'UBMbsF44VTsLDRzd' \
    --userId 'q22cbnyK3ggFDh2k' \
    --body '{"itemIds": ["aZP7pnnVfxPwc259", "HF9ejHaILQruAuYy", "JLYGqMv824ouSgkp"]}' \
    > test.out 2>&1
eval_tap $? 137 'ValidateItemPurchaseCondition' test.out

#- 138 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'K70uJmUL0uzElixc' \
    --body '{"changes": [{"itemIdentities": ["023dIvDiA0tQWlHw", "BcTtztx3VAl6tXFb", "nATCzUOIzVcy9k3i"], "itemIdentityType": "ITEM_ID", "regionData": {"AELr5lraa5v5P5Cj": [{"currencyCode": "8hgFsqHC9h5JPiME", "currencyNamespace": "tgKuiGTYgwWv5Xld", "currencyType": "REAL", "discountAmount": 31, "discountExpireAt": "1979-07-01T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1988-10-11T00:00:00Z", "discountedPrice": 66, "expireAt": "1994-01-14T00:00:00Z", "price": 66, "purchaseAt": "1993-02-01T00:00:00Z", "trialPrice": 55}, {"currencyCode": "HTnqRbzBB9ZFgJbQ", "currencyNamespace": "3Fj1umx4ItzkMJ7c", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1972-10-04T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1978-04-27T00:00:00Z", "discountedPrice": 35, "expireAt": "1992-10-05T00:00:00Z", "price": 1, "purchaseAt": "1983-09-25T00:00:00Z", "trialPrice": 71}, {"currencyCode": "Prhn2etVIQvRkQJA", "currencyNamespace": "tDUH9tx60AehGz1e", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1978-10-19T00:00:00Z", "discountPercentage": 100, "discountPurchaseAt": "1996-03-02T00:00:00Z", "discountedPrice": 40, "expireAt": "1980-12-15T00:00:00Z", "price": 13, "purchaseAt": "1985-11-01T00:00:00Z", "trialPrice": 65}], "TfyIlAwjTZdRZJJz": [{"currencyCode": "WZwvTX2bamSCvX1n", "currencyNamespace": "wvSWdDwD7WJHzgNZ", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1999-10-04T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1984-07-17T00:00:00Z", "discountedPrice": 43, "expireAt": "1998-10-24T00:00:00Z", "price": 25, "purchaseAt": "1985-12-23T00:00:00Z", "trialPrice": 46}, {"currencyCode": "3zMyTsftKqnsIJct", "currencyNamespace": "AdxyZVKHA9DkaSOW", "currencyType": "REAL", "discountAmount": 3, "discountExpireAt": "1981-03-03T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1999-03-05T00:00:00Z", "discountedPrice": 51, "expireAt": "1989-07-03T00:00:00Z", "price": 81, "purchaseAt": "1994-03-28T00:00:00Z", "trialPrice": 24}, {"currencyCode": "HEbVDwBAqanOlscR", "currencyNamespace": "IWw82k5K5VTkdubk", "currencyType": "REAL", "discountAmount": 64, "discountExpireAt": "1986-03-30T00:00:00Z", "discountPercentage": 92, "discountPurchaseAt": "1973-07-06T00:00:00Z", "discountedPrice": 79, "expireAt": "1982-08-21T00:00:00Z", "price": 88, "purchaseAt": "1992-03-31T00:00:00Z", "trialPrice": 28}], "8JH4n0JtgqzZv5kV": [{"currencyCode": "u4S95mj8YRvae4f4", "currencyNamespace": "lhBPbarbWEm8bVtZ", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1973-08-21T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1992-08-06T00:00:00Z", "discountedPrice": 6, "expireAt": "1998-12-09T00:00:00Z", "price": 21, "purchaseAt": "1974-02-10T00:00:00Z", "trialPrice": 17}, {"currencyCode": "YXJvtggDdXjbdjMB", "currencyNamespace": "ahFZZGMTcqnWrIpr", "currencyType": "REAL", "discountAmount": 44, "discountExpireAt": "1987-08-10T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1995-10-16T00:00:00Z", "discountedPrice": 38, "expireAt": "1977-04-18T00:00:00Z", "price": 13, "purchaseAt": "1986-03-31T00:00:00Z", "trialPrice": 73}, {"currencyCode": "7H1sdH2RIJz1eI7Q", "currencyNamespace": "5pu9PutLf6IrvZoB", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1980-11-04T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1979-08-06T00:00:00Z", "discountedPrice": 90, "expireAt": "1989-09-22T00:00:00Z", "price": 82, "purchaseAt": "1996-08-04T00:00:00Z", "trialPrice": 95}]}}, {"itemIdentities": ["75K4BYJ2fkqYJoF2", "FI3vyyqRzc20O7Fd", "sJP1G9tyBTfERXdv"], "itemIdentityType": "ITEM_ID", "regionData": {"YDUTLBeCidXjuGgx": [{"currencyCode": "8ncXejmeZtzT0qj0", "currencyNamespace": "ltsqfiZrthVvyX0O", "currencyType": "VIRTUAL", "discountAmount": 75, "discountExpireAt": "1982-08-30T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1989-11-30T00:00:00Z", "discountedPrice": 62, "expireAt": "1976-10-26T00:00:00Z", "price": 89, "purchaseAt": "1997-11-11T00:00:00Z", "trialPrice": 38}, {"currencyCode": "UddwSSgxCu8zru1D", "currencyNamespace": "hGAYOHR5BWa9VzIk", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1992-05-05T00:00:00Z", "discountPercentage": 62, "discountPurchaseAt": "1998-03-31T00:00:00Z", "discountedPrice": 97, "expireAt": "1998-02-21T00:00:00Z", "price": 17, "purchaseAt": "1982-02-03T00:00:00Z", "trialPrice": 85}, {"currencyCode": "LlT2sY3SsTnDQY7k", "currencyNamespace": "KU2u06Q4veujxtyQ", "currencyType": "VIRTUAL", "discountAmount": 23, "discountExpireAt": "1991-06-22T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1989-07-17T00:00:00Z", "discountedPrice": 35, "expireAt": "1978-08-18T00:00:00Z", "price": 5, "purchaseAt": "1985-05-15T00:00:00Z", "trialPrice": 85}], "eg67d4RWOqO4U0bi": [{"currencyCode": "tNQLzwRoWnR0AbkC", "currencyNamespace": "PY70FmvviVIBbcuj", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1983-05-18T00:00:00Z", "discountPercentage": 1, "discountPurchaseAt": "1971-03-04T00:00:00Z", "discountedPrice": 100, "expireAt": "1991-03-30T00:00:00Z", "price": 16, "purchaseAt": "1993-06-29T00:00:00Z", "trialPrice": 6}, {"currencyCode": "axyMchkt8l5IPSrw", "currencyNamespace": "rJl7wYIVw13NCo9y", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1971-12-17T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1976-09-14T00:00:00Z", "discountedPrice": 94, "expireAt": "1994-09-12T00:00:00Z", "price": 68, "purchaseAt": "1982-08-15T00:00:00Z", "trialPrice": 58}, {"currencyCode": "Y6HKXAblkT8VGgSH", "currencyNamespace": "8MGZGwiVj7eDTaka", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1978-02-14T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1996-11-10T00:00:00Z", "discountedPrice": 40, "expireAt": "1988-08-11T00:00:00Z", "price": 90, "purchaseAt": "1983-08-08T00:00:00Z", "trialPrice": 86}], "yejnny0Ju13b6o5u": [{"currencyCode": "B2XM6IHy7EEvHyLm", "currencyNamespace": "cvrZZOdwe1x8RjU6", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1975-06-14T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1989-02-07T00:00:00Z", "discountedPrice": 71, "expireAt": "1986-09-23T00:00:00Z", "price": 17, "purchaseAt": "1998-09-20T00:00:00Z", "trialPrice": 38}, {"currencyCode": "JovgWSRxZ8N4UQ2f", "currencyNamespace": "g3V1o2x0hL5DuBDq", "currencyType": "VIRTUAL", "discountAmount": 51, "discountExpireAt": "1990-10-07T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1984-07-26T00:00:00Z", "discountedPrice": 71, "expireAt": "1996-07-27T00:00:00Z", "price": 75, "purchaseAt": "1973-01-29T00:00:00Z", "trialPrice": 81}, {"currencyCode": "MEdJFAy2JTllJkRG", "currencyNamespace": "B8jqJEd6eqqsBVyO", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1982-12-20T00:00:00Z", "discountPercentage": 40, "discountPurchaseAt": "1982-04-28T00:00:00Z", "discountedPrice": 77, "expireAt": "1984-10-13T00:00:00Z", "price": 100, "purchaseAt": "1997-03-12T00:00:00Z", "trialPrice": 27}]}}, {"itemIdentities": ["pliCFQ6WgJpGPigd", "c5VyC4qvWjVac1cQ", "vSxgTNIUzxDgBlIb"], "itemIdentityType": "ITEM_SKU", "regionData": {"kZu4htrsf8eIFSov": [{"currencyCode": "TGXaMsq8ePN1oco2", "currencyNamespace": "jx8Upe8SjMvpqM8p", "currencyType": "VIRTUAL", "discountAmount": 16, "discountExpireAt": "1974-11-25T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1985-11-27T00:00:00Z", "discountedPrice": 63, "expireAt": "1976-01-30T00:00:00Z", "price": 67, "purchaseAt": "1975-08-21T00:00:00Z", "trialPrice": 33}, {"currencyCode": "gD5i2Ni6AnWn3NdE", "currencyNamespace": "PhNHSH7eKDfRcngE", "currencyType": "VIRTUAL", "discountAmount": 3, "discountExpireAt": "1994-07-09T00:00:00Z", "discountPercentage": 27, "discountPurchaseAt": "1986-12-24T00:00:00Z", "discountedPrice": 74, "expireAt": "1995-05-17T00:00:00Z", "price": 87, "purchaseAt": "1999-05-22T00:00:00Z", "trialPrice": 33}, {"currencyCode": "3RLOM1vEx4gqDY6j", "currencyNamespace": "wyKRxhkLe5zohg9s", "currencyType": "REAL", "discountAmount": 41, "discountExpireAt": "1981-10-26T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1985-12-12T00:00:00Z", "discountedPrice": 40, "expireAt": "1998-08-16T00:00:00Z", "price": 28, "purchaseAt": "1971-06-04T00:00:00Z", "trialPrice": 30}], "e32hqEcB1ExYMBb3": [{"currencyCode": "ckvoaJYdMqGegcg3", "currencyNamespace": "eRvBZXN3cjIXmFWR", "currencyType": "REAL", "discountAmount": 18, "discountExpireAt": "1975-08-29T00:00:00Z", "discountPercentage": 94, "discountPurchaseAt": "1983-01-20T00:00:00Z", "discountedPrice": 82, "expireAt": "1991-04-16T00:00:00Z", "price": 69, "purchaseAt": "1997-08-25T00:00:00Z", "trialPrice": 1}, {"currencyCode": "PTUEDPN1Kb4UTPWD", "currencyNamespace": "XTSb55g8LSTs7Nf9", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1987-04-01T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1975-05-29T00:00:00Z", "discountedPrice": 11, "expireAt": "1992-04-26T00:00:00Z", "price": 2, "purchaseAt": "1989-10-07T00:00:00Z", "trialPrice": 34}, {"currencyCode": "dnI6Ag7eUYcYJ4Qz", "currencyNamespace": "XCmqr6gmPGaHP5SV", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1993-07-22T00:00:00Z", "discountPercentage": 78, "discountPurchaseAt": "1975-08-31T00:00:00Z", "discountedPrice": 60, "expireAt": "1975-05-29T00:00:00Z", "price": 26, "purchaseAt": "1979-11-20T00:00:00Z", "trialPrice": 56}], "Hb6Lx8eq8SGNwEQO": [{"currencyCode": "8dYXvBSYvJBwb6Cj", "currencyNamespace": "ZUMRf2VJetWsokvx", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1971-10-04T00:00:00Z", "discountPercentage": 13, "discountPurchaseAt": "1981-09-14T00:00:00Z", "discountedPrice": 93, "expireAt": "1998-09-03T00:00:00Z", "price": 4, "purchaseAt": "1972-07-29T00:00:00Z", "trialPrice": 42}, {"currencyCode": "r9KjQ3ttz8MTBt1x", "currencyNamespace": "k9IyssSA8nP5PQjp", "currencyType": "VIRTUAL", "discountAmount": 39, "discountExpireAt": "1976-12-17T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1994-12-16T00:00:00Z", "discountedPrice": 2, "expireAt": "1991-03-05T00:00:00Z", "price": 10, "purchaseAt": "1996-10-23T00:00:00Z", "trialPrice": 7}, {"currencyCode": "AGiZFCftT0RWECdj", "currencyNamespace": "WYrnulxcCKAru8pO", "currencyType": "REAL", "discountAmount": 0, "discountExpireAt": "1984-09-05T00:00:00Z", "discountPercentage": 97, "discountPurchaseAt": "1988-10-30T00:00:00Z", "discountedPrice": 71, "expireAt": "1985-12-06T00:00:00Z", "price": 57, "purchaseAt": "1978-10-19T00:00:00Z", "trialPrice": 21}]}}]}' \
    > test.out 2>&1
eval_tap $? 138 'BulkUpdateRegionData' test.out

#- 139 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'SEASON' \
    --limit '47' \
    --offset '53' \
    --sortBy 'kdaxR7GJpYmuYCPG' \
    --storeId '181q9GA5DydC2D8U' \
    --keyword 'T6KOc4VPDUR9ayaz' \
    --language 'qXRqegIUicYXXzxs' \
    > test.out 2>&1
eval_tap $? 139 'SearchItems' test.out

#- 140 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '57' \
    --offset '64' \
    --sortBy 'createdAt:asc,createdAt:desc,updatedAt:desc' \
    --storeId 'Us9BYp6TgCejBd5o' \
    > test.out 2>&1
eval_tap $? 140 'QueryUncategorizedItems' test.out

#- 141 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId '7iTST7R3KbbQGERM' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'NpqWb51y5RUzvMfT' \
    > test.out 2>&1
eval_tap $? 141 'GetItem' test.out

#- 142 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'kPy0fGvTGgfLKsg0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'b1Bq78cE5O5pmPnb' \
    --body '{"appId": "iPJ9j4vxmbH3rVaa", "appType": "GAME", "baseAppId": "V87yfkycLSVdleSa", "boothName": "AylsmLYe2phYOgT5", "categoryPath": "kDTyPl3dKF7NXEjr", "clazz": "JMki8jvc3P8Gwjg3", "displayOrder": 72, "entitlementType": "CONSUMABLE", "ext": {"OH0SDHgYKqxJiFJd": {}, "rmj5vhzgsJwex7wq": {}, "8ZPlXNaUNgdY2vfJ": {}}, "features": ["EPb988NzxrDKVpUL", "uje5cPnmGjTvYa5P", "qx1K7qcAoijBPAp6"], "flexible": false, "images": [{"as": "6MLZJ2jZfZbpTJez", "caption": "zriCDWXT59SRu0Yq", "height": 96, "imageUrl": "VYYG9WvoGmAmvaVV", "smallImageUrl": "5YfxnUNcwjr7gSGh", "width": 27}, {"as": "4Eoes9a6XaJeRbzT", "caption": "PwD3jxF7vxRUY0il", "height": 36, "imageUrl": "JprIb3CJCAtvSG8C", "smallImageUrl": "fa9dzOJDGCTHIOFj", "width": 10}, {"as": "xeR6d7r1SQw80JfM", "caption": "pPrSqYypRUnq5o4E", "height": 94, "imageUrl": "2jy29EJigqYhyVhU", "smallImageUrl": "Rx1yPeczRpdk0HAT", "width": 66}], "inventoryConfig": {"customAttributes": {"QpoTOxe8y1jorNsg": {}, "9ZKYCKoISyXtHzoW": {}, "GdYohxMp3uOQIybq": {}}, "serverCustomAttributes": {"WfG9BJ6FVKlbYHtb": {}, "PtaxvagSlpGgVTF6": {}, "VeDAPOGBwweyFfXE": {}}, "slotUsed": 82}, "itemIds": ["cfHDCdl59Wp9A3tX", "Gve6DdK6uvg8f2cI", "oByk9fxtvsgeAxo5"], "itemQty": {"7nKAbZpsbJ4Iu5KJ": 38, "ynxGBlacDCdFe8AT": 95, "oufCNlFoOcWQQy4b": 19}, "itemType": "BUNDLE", "listable": false, "localizations": {"uQIcSbUt5UGkInFG": {"description": "puUsdtq4dOwNESzC", "localExt": {"EW9dUVhZjLftC3sC": {}, "S8CpLCqPD9CeDEdC": {}, "nnL6Kt1Bjj3b8QM8": {}}, "longDescription": "Rr45ULqXQgvwD3Ps", "title": "KDJiWxQBwaS7rDBf"}, "2S54phbdyGDt47f9": {"description": "GWRlE9hqz6rjDNo4", "localExt": {"rhjxUdMM83WekqfW": {}, "v04vvn9bk5qr8qs2": {}, "mqtnGAqXUjNypF6M": {}}, "longDescription": "MqWpdEJsPoaIbYz8", "title": "cK5jlpJdre5ur6yv"}, "WJDdvM7T7PX2vamI": {"description": "RZHzsIYOCUoiCXNj", "localExt": {"rdQL2jdx1eIba1sB": {}, "0HsJ06DzfbzRYt4O": {}, "VUyumBeIqdQGZC5k": {}}, "longDescription": "M03HHijsQRj7N8IA", "title": "jmsonjj0ZR50BQ1U"}}, "lootBoxConfig": {"rewardCount": 0, "rewards": [{"lootBoxItems": [{"count": 0, "duration": 47, "endDate": "1987-09-02T00:00:00Z", "itemId": "D3O2kXQSc58zgZVl", "itemSku": "4gIF7v3qbZu9M3Ox", "itemType": "qVAT4H1lRZ9Z1JBr"}, {"count": 69, "duration": 63, "endDate": "1993-10-12T00:00:00Z", "itemId": "zEOtIxzPqb6n73m0", "itemSku": "jiaDH86d9rsKgzCs", "itemType": "MulpB8HZUtVVaJCi"}, {"count": 77, "duration": 93, "endDate": "1974-06-03T00:00:00Z", "itemId": "KOwrSfWhT5B4Wedo", "itemSku": "pzwSluBtRFPKThyG", "itemType": "nbjmPDKFS6u9FHuv"}], "name": "1M3qfch4SqIV6LQP", "odds": 0.5380510196551774, "type": "PROBABILITY_GROUP", "weight": 57}, {"lootBoxItems": [{"count": 0, "duration": 98, "endDate": "1973-05-26T00:00:00Z", "itemId": "Yl4csFq65cU66yJa", "itemSku": "j4ovoKWE4EW0sw8v", "itemType": "5peiuxoBJATauyD3"}, {"count": 83, "duration": 58, "endDate": "1997-03-18T00:00:00Z", "itemId": "VMiyEvMf9yilUEuj", "itemSku": "k6oqYo1HQYTFzwdO", "itemType": "MdupwD4O3uNbcIDc"}, {"count": 71, "duration": 62, "endDate": "1983-01-28T00:00:00Z", "itemId": "vZbOy1T4hfwkuVyk", "itemSku": "H4RpfmjIXFGZ5PKd", "itemType": "babJIkNnt9P1Tkm0"}], "name": "8luh4dpPRMDbUXBW", "odds": 0.7381741727774985, "type": "PROBABILITY_GROUP", "weight": 81}, {"lootBoxItems": [{"count": 32, "duration": 54, "endDate": "1978-11-05T00:00:00Z", "itemId": "gG2wlZkLhuU5FI8N", "itemSku": "ijFI0GKwJ3vfXlsA", "itemType": "My2Zp2UAGxHnmSxv"}, {"count": 22, "duration": 80, "endDate": "1987-01-09T00:00:00Z", "itemId": "9UR5q9neoW6JBcGp", "itemSku": "9Rx2RfcRhXpmeeHd", "itemType": "vphas9S7ivHEoLbU"}, {"count": 79, "duration": 97, "endDate": "1991-03-05T00:00:00Z", "itemId": "47f1UreUpxEkXIbE", "itemSku": "1ETzRJZKMavu4Ul2", "itemType": "IaieEbPSE7TGkeHs"}], "name": "YsW9oGBN1pYMBwbP", "odds": 0.8255421168278021, "type": "REWARD_GROUP", "weight": 55}], "rollFunction": "CUSTOM"}, "maxCount": 92, "maxCountPerUser": 79, "name": "Bh61hmWKSSrF35an", "optionBoxConfig": {"boxItems": [{"count": 61, "duration": 9, "endDate": "1987-06-25T00:00:00Z", "itemId": "BZ6FVrBzyhyhoS6a", "itemSku": "9oe0JaXFpff28uYb", "itemType": "e4Cf2HEHvVevhISj"}, {"count": 2, "duration": 50, "endDate": "1981-08-17T00:00:00Z", "itemId": "MAAmIHYbsxG5N066", "itemSku": "FXb88SbLOa21DiSF", "itemType": "sm0XXQJWszvTQEuA"}, {"count": 78, "duration": 32, "endDate": "1984-08-12T00:00:00Z", "itemId": "DNp1SZ58aDllwzTR", "itemSku": "Hak1MXxj7Esrg790", "itemType": "0nml5BidsK9dCEzh"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 82, "fixedTrialCycles": 44, "graceDays": 93}, "regionData": {"0PQbVIaKiHfoeorY": [{"currencyCode": "7A1otGFyv2SMjbEr", "currencyNamespace": "50qGdCZIc6EFqBKx", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1994-04-11T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1992-05-22T00:00:00Z", "expireAt": "1991-10-28T00:00:00Z", "price": 14, "purchaseAt": "1980-12-28T00:00:00Z", "trialPrice": 74}, {"currencyCode": "ucL1jwRXzfjDZZBm", "currencyNamespace": "Oau6syme06c6SKLc", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1986-01-07T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1978-06-19T00:00:00Z", "expireAt": "1988-08-17T00:00:00Z", "price": 33, "purchaseAt": "1976-02-16T00:00:00Z", "trialPrice": 22}, {"currencyCode": "CbkOfHaGr5kdazly", "currencyNamespace": "pvt6lSLfU7HByGXP", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1995-07-11T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1987-02-27T00:00:00Z", "expireAt": "1992-08-10T00:00:00Z", "price": 28, "purchaseAt": "1974-05-12T00:00:00Z", "trialPrice": 1}], "3YAxZLKbcOdyjqf6": [{"currencyCode": "Q4oiwoJcaRMEb15L", "currencyNamespace": "BlTVufc5ZyODR2NV", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1987-12-09T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1993-05-15T00:00:00Z", "expireAt": "1987-02-10T00:00:00Z", "price": 94, "purchaseAt": "1999-02-04T00:00:00Z", "trialPrice": 60}, {"currencyCode": "RbZqBAoKGcVCdMiS", "currencyNamespace": "NV4qBrt1kcLmRv6E", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1974-04-09T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1978-07-16T00:00:00Z", "expireAt": "1975-07-16T00:00:00Z", "price": 26, "purchaseAt": "1978-06-02T00:00:00Z", "trialPrice": 39}, {"currencyCode": "b8oWq94RImNWVIJn", "currencyNamespace": "hhwFDV1VitaomvWT", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1992-05-26T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1996-08-26T00:00:00Z", "expireAt": "1980-11-23T00:00:00Z", "price": 40, "purchaseAt": "1982-07-02T00:00:00Z", "trialPrice": 6}], "YS4Kj7Yi2VvoQNW8": [{"currencyCode": "Yc481dYdvGxJAMDR", "currencyNamespace": "A1LF7jdWlekFwO94", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1980-08-26T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1995-05-25T00:00:00Z", "expireAt": "1999-05-12T00:00:00Z", "price": 65, "purchaseAt": "1989-01-15T00:00:00Z", "trialPrice": 15}, {"currencyCode": "EcvVAyId6Cp85HVD", "currencyNamespace": "sZBQgOnXuXsGThYZ", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1977-09-28T00:00:00Z", "expireAt": "1982-05-27T00:00:00Z", "price": 55, "purchaseAt": "1987-06-26T00:00:00Z", "trialPrice": 78}, {"currencyCode": "NF0Z0GkwxUNYyNwG", "currencyNamespace": "iKrknH0Y5mrQgLC6", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1999-07-23T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1993-05-29T00:00:00Z", "expireAt": "1993-09-13T00:00:00Z", "price": 17, "purchaseAt": "1990-12-10T00:00:00Z", "trialPrice": 82}]}, "saleConfig": {"currencyCode": "HglUQMZi5WjMZfOa", "price": 6}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "gegCUjTdi1Ehr8Ot", "stackable": true, "status": "INACTIVE", "tags": ["yuoya4JgakZyUV7t", "73VnSFbuxd4KYZ0j", "k0UZdhtnKu9oTc8p"], "targetCurrencyCode": "VkiyGsj5JdXzRxfN", "targetNamespace": "EjUMTs8WIObJBTsv", "thumbnailUrl": "sw76uISRX0bKVoWt", "useCount": 29}' \
    > test.out 2>&1
eval_tap $? 142 'UpdateItem' test.out

#- 143 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'WP0HzSdiylLhVYsz' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'CATALOG,IAP,ENTITLEMENT' \
    --force  \
    --storeId 'aa6unq1yQOSRvyiL' \
    > test.out 2>&1
eval_tap $? 143 'DeleteItem' test.out

#- 144 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'BRVtIDi2piIQFVmz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 80, "orderNo": "Wnf87YPNOe9Eevf1"}' \
    > test.out 2>&1
eval_tap $? 144 'AcquireItem' test.out

#- 145 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'fhMg1E2k7QLFrVgt' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'X7y0fPOieDCow2zX' \
    > test.out 2>&1
eval_tap $? 145 'GetApp' test.out

#- 146 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'yFFVpM87yqEwEacQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MTlqN4LKkxJ5v3SB' \
    --body '{"carousel": [{"alt": "afnKNiMPbFkFGA85", "previewUrl": "W3HJkqgS2B37wwoP", "thumbnailUrl": "YOHiIsxmsLBPBJuN", "type": "video", "url": "nWRrtW870qD88Zcd", "videoSource": "vimeo"}, {"alt": "po3AKRmnJkzJHAck", "previewUrl": "UyBksYQfDm0RNFwi", "thumbnailUrl": "z70tRVLMlHi8i9gO", "type": "video", "url": "cQ08NG6dX2TZkil6", "videoSource": "generic"}, {"alt": "kRngoUa83ECh1gqP", "previewUrl": "eS193TNNzot3sVli", "thumbnailUrl": "3GN2XTrFibRAhzzE", "type": "image", "url": "zWlTY70qdgJRvpZr", "videoSource": "youtube"}], "developer": "xYztOEyVbKIf1Zbz", "forumUrl": "gUwd8DHoCQykmXHY", "genres": ["FreeToPlay", "Strategy", "Casual"], "localizations": {"oIOD74V21HWDAfvX": {"announcement": "wdxbyp4HAPbBbNPS", "slogan": "tVBUpKgOssFkz0F3"}, "6piDYXeHZ7FHls3n": {"announcement": "yvconqbHQqKLQKe3", "slogan": "xmj6s0GqsWncp5Lr"}, "qbiKudv9z75SzoCV": {"announcement": "8ZMi2o1nR482D6gN", "slogan": "Clk9c87hosaPFC5z"}}, "platformRequirements": {"BW3ZgVZCj9ObVGT0": [{"additionals": "Scwl4kNmCi15XTJT", "directXVersion": "gCNNH7RtG5Xmo9Q0", "diskSpace": "Wb07N17fkxZSc6Vb", "graphics": "E0AGcekjMNHuPXtz", "label": "8tXxrmzafMUguyDo", "osVersion": "N91uc28HoSpGt1g0", "processor": "GGbT4Hf2PPKOldkb", "ram": "gX9CWJKwXXSbv5eg", "soundCard": "9q86IaDFjjx6uZer"}, {"additionals": "WbtwTX9gNRByjbE8", "directXVersion": "lOLAfTXKLzbrddqc", "diskSpace": "KLa7LevxNHOSEhQR", "graphics": "ZIp693lRwtc43atC", "label": "uCFxbfbz4aQERziP", "osVersion": "L4dHhOqG5KDdUvk0", "processor": "LEi26Ls7mjRxNmvv", "ram": "NtjJNQepUTGhwlY4", "soundCard": "lPzlsCR5rVsyfcH7"}, {"additionals": "WjP7HuGz3b5WAEvd", "directXVersion": "RF9bqMj4ro5B19VE", "diskSpace": "838c7OydVw0zCqoM", "graphics": "ZvpIOO97DmQ5ZOzx", "label": "6iCJTu60IifzMhkk", "osVersion": "5PxsjqbCKpMv2Yky", "processor": "9DYkD2sIllFtBtXJ", "ram": "KG3rqBmILhtWm8RQ", "soundCard": "vRUbUDSiefGEdLuc"}], "rtO2gCQD057DrDlg": [{"additionals": "C2nzS9SiGUjVAw4v", "directXVersion": "3q6JRHcn7KaoCEkR", "diskSpace": "do6qHYIZWnXqQ1oH", "graphics": "FJ9Q0vqsL9SomqWs", "label": "GA76yxi0QzZWfmP2", "osVersion": "sx0KO5bEJaPnAFjs", "processor": "odyJQVVBrShGbIIu", "ram": "qK8C403HgoXCR6XO", "soundCard": "MXwKdfqk8T4QHK30"}, {"additionals": "EX0FclpDl5Hsurac", "directXVersion": "O5MnjnxD1OXkxShF", "diskSpace": "VQTRekLfjmy8zosR", "graphics": "CRgVwbrQKmb01yA7", "label": "U7dGMjupZkZQY8CN", "osVersion": "yT4k3DIbfT22G5Np", "processor": "E130YWSgxpKWtdtd", "ram": "tVW9anENmxb9e7vX", "soundCard": "ZV3ig8Jg5VByeI3y"}, {"additionals": "cMcYYBixKJXCISQd", "directXVersion": "wec1m8BusV9tUh74", "diskSpace": "KVo6Xqjz2xUKLNWS", "graphics": "mYyVvyelIJ8QgaLM", "label": "qi836ULa7cfZl4Vu", "osVersion": "Y6rsZyo6CBRRnoOi", "processor": "kIxXKKIR6kPmswm5", "ram": "TCAU1cKApdJDnE73", "soundCard": "GLmSZns5owBhoUg4"}], "LsGP6KLPXkvUv2Xi": [{"additionals": "XaBzsmaxjTZPlLit", "directXVersion": "ytGka7Kv5TacQKF4", "diskSpace": "OlRGdmXxETLEQrr3", "graphics": "KCAV9alq3hK1G4kK", "label": "ooSNNUZuiynZ64Iw", "osVersion": "ncZPk82GF3eTC0vz", "processor": "ZUDj9dzGgGVxo9OH", "ram": "gfHumyfuBNisecYb", "soundCard": "cOpR45VDlvSc0Mr7"}, {"additionals": "ImwCwGqOf0bNs97K", "directXVersion": "vKyj3MqS7Dcmtfh5", "diskSpace": "0eObbrmgjhWK0x0Z", "graphics": "idAJ1CU1eD1La16B", "label": "w3JbUnUDh5yGjjv4", "osVersion": "Mwrv2vancmR6Z7rb", "processor": "21A2E9pX0BWCMqPs", "ram": "Rk5htdM5T3fDSrSH", "soundCard": "rkoqv2mM6soMaTvQ"}, {"additionals": "q2a9YdFNtRVSO0js", "directXVersion": "0hG9xmSnzd7zgUxA", "diskSpace": "ogcnGkXk17QPkJHR", "graphics": "hmLKQuQVFSKiXl8G", "label": "2uf6E8EajXLSAS8M", "osVersion": "KMaxQ1QyJCpKedhu", "processor": "zI7G9NCKKXu1bqI2", "ram": "M5PmXfKnQ7BYGjCU", "soundCard": "DMOrbmoRvWnfmGFy"}]}, "platforms": ["Android", "IOS", "MacOS"], "players": ["MMO", "MMO", "Coop"], "primaryGenre": "Strategy", "publisher": "90h9EDqSTOfoNewW", "releaseDate": "1975-07-02T00:00:00Z", "websiteUrl": "crqrPye7fCwi7Il2"}' \
    > test.out 2>&1
eval_tap $? 146 'UpdateApp' test.out

#- 147 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'wIFlHm9N6owMHMtJ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'y1Oqn59tEGm9NYeU' \
    --body '{"featuresToCheck": ["REWARD", "DLC"]}' \
    > test.out 2>&1
eval_tap $? 147 'DisableItem' test.out

#- 148 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '0nx8TqSZdZ5C8mFI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 148 'GetItemDynamicData' test.out

#- 149 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId '9TnvzEqBNMF9CZvP' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xT5zbreMc9fBoU3R' \
    > test.out 2>&1
eval_tap $? 149 'EnableItem' test.out

#- 150 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'HNDFjLKFrepy56eW' \
    --itemId '1kmb15QeIQF51c4M' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qJzDSvELgBe6dboS' \
    > test.out 2>&1
eval_tap $? 150 'FeatureItem' test.out

#- 151 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'dhkBzAzPkt1efGJe' \
    --itemId 'JaxyHYutgXucx85v' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HA009FAb21jxeWXk' \
    > test.out 2>&1
eval_tap $? 151 'DefeatureItem' test.out

#- 152 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '80y9uxgVLGgK8aVS' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'CN6oCETQ8gIDRdD2' \
    --populateBundle  \
    --region 'wwMXwKVXGPhEJsc7' \
    --storeId 'rZpxaPHc9r8eToFm' \
    > test.out 2>&1
eval_tap $? 152 'GetLocaleItem' test.out

#- 153 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'kHJ6BPOKFLxIwKss' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w647YwDudnGRufOU' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 12, "code": "iP2JQ24meDrwEuTy", "comparison": "isGreaterThanOrEqual", "name": "2qohglzO8AEl6A9s", "predicateType": "SeasonPassPredicate", "value": "ceS9UX48dKPCFUIe", "values": ["yYEymNXzNX6TGh4U", "dEweeBsJEvBbAvCm", "lh6Z1oz9BaixUUvm"]}, {"anyOf": 51, "code": "myHEV4g9P6a280S5", "comparison": "excludes", "name": "NB5dVCsB7xL4axSP", "predicateType": "EntitlementPredicate", "value": "47CAT7cBP0918JaE", "values": ["AO7sBQt6YJ2tWwF7", "BQBP766LUnBBR84i", "RnP1oK3c4RVfjB0z"]}, {"anyOf": 18, "code": "s36r1FgR70eNLHkV", "comparison": "isGreaterThanOrEqual", "name": "algizL97ycJV5YqE", "predicateType": "SeasonPassPredicate", "value": "HgpFNw9K9pmAIc6V", "values": ["JkujxbCu1HFaj6Vx", "s3GuA4S1dS7H7yIS", "SfE9nbE2PMv12ZSR"]}]}, {"operator": "and", "predicates": [{"anyOf": 34, "code": "TSDRIoMg7Dc5APzf", "comparison": "isLessThanOrEqual", "name": "wtLPxK1os4qR8LaQ", "predicateType": "StatisticCodePredicate", "value": "yL72WDyhBsCCbnfi", "values": ["hZkvFKfSHQh8I9xk", "3sFl0cbuCRM69XKk", "hnXKxGxaupnTTq9i"]}, {"anyOf": 78, "code": "Kc0aUvrKXDIjYC4d", "comparison": "includes", "name": "e2fJDS6T75Q4ulon", "predicateType": "StatisticCodePredicate", "value": "FjmYqE1wJhfogWg2", "values": ["dKDEZywonA2SrEdN", "0vdCk8so6JSaZAIa", "Apm0sUy18aWn65Co"]}, {"anyOf": 38, "code": "tmGuX6r0gBVUUeKK", "comparison": "is", "name": "fBpWVxIK9D2bTcga", "predicateType": "SeasonPassPredicate", "value": "qugklBUS6uwWrCQt", "values": ["Orya6LSSUlugIAkn", "Uvqn6eXr6FNbKJ05", "86Jrg8tLAJWpcyNk"]}]}, {"operator": "and", "predicates": [{"anyOf": 60, "code": "SaVYcAYp7qSiDvsf", "comparison": "isGreaterThanOrEqual", "name": "UOpWv46sXvpOjrpR", "predicateType": "SeasonPassPredicate", "value": "uDLLuIaSxoloIH1g", "values": ["kqddI3ezqu6FB0sL", "BCWVFrvls0ZwosKh", "DlLfTKxpVOXvGSrd"]}, {"anyOf": 40, "code": "xt6fX9j7rhZCAlDl", "comparison": "isNot", "name": "BjrV0p9A7tcHrV0M", "predicateType": "EntitlementPredicate", "value": "CSoqHvH7g63cOx6y", "values": ["dZDGwqx7T3l1ut2o", "3Cc4M2O7NrTQO7KL", "rIw37pKOLrF5i3gr"]}, {"anyOf": 50, "code": "2FBS93Mg6TKwdRMr", "comparison": "excludes", "name": "Uml3KuoMKh7tprna", "predicateType": "EntitlementPredicate", "value": "NIbJMJ9ABbKVWO2Y", "values": ["a5ObBB49Km4ClIQm", "EDiqkwKbpdk7wlDn", "gNiPPjpSAlZwFGpe"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 153 'UpdateItemPurchaseCondition' test.out

#- 154 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'kIdLCvNhZ6P8aqZ2' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'ENTITLEMENT,CAMPAIGN,ENTITLEMENT' \
    --storeId 'rC1V7ZpJZPHCMqvc' \
    > test.out 2>&1
eval_tap $? 154 'QueryItemReferences' test.out

#- 155 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId 'YmeDLYEzs2SQUdKr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "6vgqkjycqclNlBOR"}' \
    > test.out 2>&1
eval_tap $? 155 'ReturnItem' test.out

#- 156 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --name 'UZOFzpFd6b5Jc5TE' \
    --offset '94' \
    --tag 'LzynjFZgF3erw7Us' \
    > test.out 2>&1
eval_tap $? 156 'QueryKeyGroups' test.out

#- 157 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "yHq4bBb0n1JhPUS8", "name": "BRPGV9n769zLJdKM", "status": "ACTIVE", "tags": ["zDgDAtqE3kuybwTQ", "FYEJjIYwqfSRy8Gg", "Vk77fd1GS5YkyhAi"]}' \
    > test.out 2>&1
eval_tap $? 157 'CreateKeyGroup' test.out

#- 158 GetKeyGroupByBoothName
eval_tap 0 158 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 159 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'AItnWUmD225fp1eg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetKeyGroup' test.out

#- 160 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'sx3ErheNwqd5pric' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lNNqLyrlzrJ4QHbf", "name": "nAdtkujxHff7n1ya", "status": "INACTIVE", "tags": ["JKpqmgvUTr8XAtpO", "qUQxzqJZiWi3KQff", "T5Tn61A1xW6okIqm"]}' \
    > test.out 2>&1
eval_tap $? 160 'UpdateKeyGroup' test.out

#- 161 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'd87ir9op4YfGTno5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 161 'GetKeyGroupDynamic' test.out

#- 162 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId 'oHzqY3DgykA8zBJX' \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '76' \
    --status 'ACQUIRED' \
    > test.out 2>&1
eval_tap $? 162 'ListKeys' test.out

#- 163 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'X9TPO3K1k5ZM8btm' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 163 'UploadKeys' test.out

#- 164 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime 'GsgXNXbpqxh76Af5' \
    --limit '72' \
    --offset '91' \
    --orderNos '0dtVAo7w4e3v5mh6,Rum5pbgEt39uJQpg,EtchTe3nt7t9ztpr' \
    --sortBy 'SfW9OutADrNGBWSJ' \
    --startTime '1zQKxVmRTawjiZPM' \
    --status 'CLOSED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 164 'QueryOrders' test.out

#- 165 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 165 'GetOrderStatistics' test.out

#- 166 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'oxpLTBM9Q8t829Id' \
    > test.out 2>&1
eval_tap $? 166 'GetOrder' test.out

#- 167 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'o1JyveSRiBq23kyH' \
    --body '{"description": "9jQbHWkcVk0X28GS"}' \
    > test.out 2>&1
eval_tap $? 167 'RefundOrder' test.out

#- 168 GetPaymentCallbackConfig
eval_tap 0 168 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 169 UpdatePaymentCallbackConfig
eval_tap 0 169 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 170 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 170 'GetPaymentMerchantConfig' test.out

#- 171 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["54vl7gIKBc7OYTyl", "FRAJKySnC0cfPl3Z", "2zSBbs4PAV72u8Ax"]}' \
    > test.out 2>&1
eval_tap $? 171 'UpdatePaymentDomainWhitelistConfig' test.out

#- 172 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'E2IQeoxYV4UcYzsw' \
    --externalId 'AGpXqQxctuVaqPJG' \
    --limit '55' \
    --notificationSource 'STRIPE' \
    --notificationType 'HEZmuQrZ8GaQ4OZ2' \
    --offset '28' \
    --paymentOrderNo '07lsPP5OfHbXzWnV' \
    --startDate 'O2U4uyzZo1rj0ZrL' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 172 'QueryPaymentNotifications' test.out

#- 173 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'Gl1A2vaNeDiSqTfm' \
    --limit '55' \
    --offset '32' \
    --status 'REQUEST_FOR_INFORMATION' \
    > test.out 2>&1
eval_tap $? 173 'QueryPaymentOrders' test.out

#- 174 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "dDFfvzeU5iqhx6zv", "currencyNamespace": "7EURTNIoG1DBdoKH", "customParameters": {"6sREmmfwUZLZZS7s": {}, "nx0Q2Gd8m7Y3wiNl": {}, "oJfey3HXL6SjljNP": {}}, "description": "TXA3qbg55SyienCO", "extOrderNo": "DZ0mnOpPTVxEgBFz", "extUserId": "G8tlkxWKCU1XN4gl", "itemType": "INGAMEITEM", "language": "iZW-AQrk", "metadata": {"rDXVwCkhOQ161TFj": "ROYJm75VIuCOCkt2", "W1DfI8QtgODk9K6D": "cMnyCPn1FylWdaNV", "1VaZTkbbuWiiA4UT": "DgS2SVEo5M80LLbk"}, "notifyUrl": "u9GYH4ijqOVM50tC", "omitNotification": true, "platform": "PbklTHcmgXsrVj3M", "price": 19, "recurringPaymentOrderNo": "p8pmEosOXglQwwde", "region": "LVpmXqRwVjc3W2AN", "returnUrl": "mE3VVsQ1fm9EUdia", "sandbox": true, "sku": "juLsKZoqnpKwhpZV", "subscriptionId": "dw5UMa8ymxtEFLwE", "targetNamespace": "LCY2vIddlxnA1Vyn", "targetUserId": "ioJcAPwVHUGcs1AC", "title": "MvoY4jWH9dFmOHW0"}' \
    > test.out 2>&1
eval_tap $? 174 'CreatePaymentOrderByDedicated' test.out

#- 175 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'j9suukPE4JwQONQ2' \
    > test.out 2>&1
eval_tap $? 175 'ListExtOrderNoByExtTxId' test.out

#- 176 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vCbMn0Oia336uiiM' \
    > test.out 2>&1
eval_tap $? 176 'GetPaymentOrder' test.out

#- 177 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'TAductvUfVwLahtR' \
    --body '{"extTxId": "edh1SiZlOpIQ8GL7", "paymentMethod": "jBF1R5OexAPzCG6Z", "paymentProvider": "XSOLLA"}' \
    > test.out 2>&1
eval_tap $? 177 'ChargePaymentOrder' test.out

#- 178 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QClGc1636nbfM3J9' \
    --body '{"description": "G40Y62bCo941ALzn"}' \
    > test.out 2>&1
eval_tap $? 178 'RefundPaymentOrderByDedicated' test.out

#- 179 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'QuHVskfCjUK8GeX4' \
    --body '{"amount": 87, "currencyCode": "15JYj4IqWK09l4wk", "notifyType": "REFUND", "paymentProvider": "WALLET", "salesTax": 93, "vat": 1}' \
    > test.out 2>&1
eval_tap $? 179 'SimulatePaymentOrderNotification' test.out

#- 180 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'iz7yrIvQj2isN7bR' \
    > test.out 2>&1
eval_tap $? 180 'GetPaymentOrderChargeStatus' test.out

#- 181 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'wcr16lW5YwgZpjlM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "MtPWg8217m7qNkQi", "serviceLabel": 75}' \
    > test.out 2>&1
eval_tap $? 181 'GetPsnEntitlementOwnership' test.out

#- 182 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'Dwhu31d8eOdtrfq6' \
    --body '{"delegationToken": "ECDD6OGkuLs9gNpN", "sandboxId": "on6DKW9A6AmnQTNF"}' \
    > test.out 2>&1
eval_tap $? 182 'GetXboxEntitlementOwnership' test.out

#- 183 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 183 'GetPlatformEntitlementConfig' test.out

#- 184 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    --body '{"allowedPlatformOrigins": ["System", "Nintendo", "Nintendo"]}' \
    > test.out 2>&1
eval_tap $? 184 'UpdatePlatformEntitlementConfig' test.out

#- 185 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 185 'GetPlatformWalletConfig' test.out

#- 186 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    --body '{"allowedBalanceOrigins": ["Steam", "Nintendo", "Xbox"]}' \
    > test.out 2>&1
eval_tap $? 186 'UpdatePlatformWalletConfig' test.out

#- 187 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    > test.out 2>&1
eval_tap $? 187 'ResetPlatformWalletConfig' test.out

#- 188 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 188 'GetRevocationConfig' test.out

#- 189 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": true, "strategy": "CUSTOM"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 189 'UpdateRevocationConfig' test.out

#- 190 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'DeleteRevocationConfig' test.out

#- 191 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'EknHPKrZ7TiNBE0H' \
    --limit '89' \
    --offset '11' \
    --source 'ORDER' \
    --startTime 'VHLMvrCsH3RYxH2U' \
    --status 'SUCCESS' \
    --transactionId '2a7fCFAUzLELiM57' \
    --userId '3TdtWjfVciuLnLsB' \
    > test.out 2>&1
eval_tap $? 191 'QueryRevocationHistories' test.out

#- 192 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'GetRevocationPluginConfig' test.out

#- 193 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "KGsALPuCOyphUUAV"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "5708zaP0wpZgQEvF"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateRevocationPluginConfig' test.out

#- 194 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 194 'DeleteRevocationPluginConfig' test.out

#- 195 UploadRevocationPluginConfigCertV2
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCertV2 \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 195 'UploadRevocationPluginConfigCertV2' test.out

#- 196 UploadRevocationPluginConfigCert
eval_tap 0 196 'UploadRevocationPluginConfigCert # SKIP deprecated' test.out

#- 197 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rQB1yUonirH4URx3", "eventTopic": "NkKQBYrlUaMiFEWU", "maxAwarded": 93, "maxAwardedPerUser": 51, "namespaceExpression": "cAFO5zEw8GENEJYP", "rewardCode": "KxxOw7xNQ98IEbc9", "rewardConditions": [{"condition": "YITN98j4P2AGeidX", "conditionName": "RRnIAJfKVjOn6rtI", "eventName": "LNJVv2DLLUyBt5hD", "rewardItems": [{"duration": 38, "endDate": "1982-05-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "8FgqG46RsFK7eYlS", "quantity": 95, "sku": "RXVcg6AByNpBo2JY"}, {"duration": 22, "endDate": "1997-06-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "LdmR97u9MVUii4Kp", "quantity": 5, "sku": "0Dv6b8WtaMVvLbG0"}, {"duration": 39, "endDate": "1989-08-23T00:00:00Z", "identityType": "ITEM_ID", "itemId": "PQlFAGbMtEybfcAl", "quantity": 76, "sku": "mnsAkRT2k0AzdgIu"}]}, {"condition": "nRkTxsGdrpNELM8L", "conditionName": "fkut0wnT24wh59RG", "eventName": "SbBMh7jpszuVk6iP", "rewardItems": [{"duration": 6, "endDate": "1984-10-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "boQqCCyJfThvCJie", "quantity": 35, "sku": "iHewZkwEeuzBBRSk"}, {"duration": 27, "endDate": "1971-07-12T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "yWkZObuvig8sMuss", "quantity": 74, "sku": "6ezTrsDZNYUV48Oh"}, {"duration": 34, "endDate": "1987-12-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "vUtPYONZdFk75lkj", "quantity": 88, "sku": "NPUOHNZxML3yoBM9"}]}, {"condition": "qxd6PWz7sVnMxge2", "conditionName": "inL8fBFP1ABaIKrE", "eventName": "t8d3o7cTS9OIIMEr", "rewardItems": [{"duration": 26, "endDate": "1980-11-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "HrsOFsbhRow4iaYK", "quantity": 50, "sku": "xNwp1lGkYoq8HP1T"}, {"duration": 79, "endDate": "1972-02-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7okHl1wMht2Izq7T", "quantity": 58, "sku": "NG8rGp7Fadvo5Ezp"}, {"duration": 43, "endDate": "1988-12-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1mx6K17GL1CrO4Zu", "quantity": 29, "sku": "LBmvdncQkcZb8cWd"}]}], "userIdExpression": "VH9bww15zZsaYrJA"}' \
    > test.out 2>&1
eval_tap $? 197 'CreateReward' test.out

#- 198 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'e5Kd5QB96ndlO6iP' \
    --limit '66' \
    --offset '55' \
    --sortBy 'rewardCode:desc,rewardCode' \
    > test.out 2>&1
eval_tap $? 198 'QueryRewards' test.out

#- 199 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 199 'ExportRewards' test.out

#- 200 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 200 'ImportRewards' test.out

#- 201 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Khqilty9NVlgxUmn' \
    > test.out 2>&1
eval_tap $? 201 'GetReward' test.out

#- 202 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'fdOAmu1dX1NqD20R' \
    --body '{"description": "UvvYeJZw6QZFN7wF", "eventTopic": "CnqpvNesGiVnt9p2", "maxAwarded": 39, "maxAwardedPerUser": 84, "namespaceExpression": "o7Yja1soDE1K0SvG", "rewardCode": "rMYwPmPXC2LfL2m5", "rewardConditions": [{"condition": "rP2A20t6foPPH94S", "conditionName": "UinY5diUlqgvY7dP", "eventName": "PyahppgxJhk4EdTZ", "rewardItems": [{"duration": 41, "endDate": "1997-12-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "rS92594HLvWFsXHt", "quantity": 80, "sku": "GYRMdz07xEJ40eps"}, {"duration": 38, "endDate": "1974-02-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "JJC3CX0hpB1ZGMMo", "quantity": 21, "sku": "DSozCuFsrBMtoOeL"}, {"duration": 11, "endDate": "1980-11-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CYxSeeJOlxa395rg", "quantity": 15, "sku": "kyaFwwD7wecuQb4G"}]}, {"condition": "NQHVZMKGBnzh4sua", "conditionName": "GIzttTncVBf5g3oe", "eventName": "uHiNyLkfPQPmjUkv", "rewardItems": [{"duration": 92, "endDate": "1987-06-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "mIejozmG5HlrIfMA", "quantity": 45, "sku": "5phhU315LUC6HSMQ"}, {"duration": 72, "endDate": "1999-07-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "nXNd6ve29lqqtcLJ", "quantity": 100, "sku": "TLbYWpqeXjaf1f5f"}, {"duration": 19, "endDate": "1986-11-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "MZjKJ05puX3197Wr", "quantity": 79, "sku": "QGnnW4ugGX6mKBbg"}]}, {"condition": "TD9xL07ZzzIs3Jke", "conditionName": "34ZAUuLP897ooMLn", "eventName": "emwKAvgDXNrFEE4J", "rewardItems": [{"duration": 11, "endDate": "1981-03-05T00:00:00Z", "identityType": "ITEM_ID", "itemId": "QpsLOcLtZw0efmEV", "quantity": 6, "sku": "864shbnQ3bVvuvps"}, {"duration": 61, "endDate": "1981-10-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "5Niy4NNFpRE5pS85", "quantity": 51, "sku": "FFAQZbfbmVTEbiRq"}, {"duration": 65, "endDate": "1989-06-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "0wCVlYQi9cfMCeNn", "quantity": 42, "sku": "J33tCwv8H1f451FV"}]}], "userIdExpression": "Z630HNBYZSrz7pMj"}' \
    > test.out 2>&1
eval_tap $? 202 'UpdateReward' test.out

#- 203 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ESLLMPKDXLki6Oz5' \
    > test.out 2>&1
eval_tap $? 203 'DeleteReward' test.out

#- 204 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Bygt8Q0RjSf1srB7' \
    --body '{"payload": {"hGwGbUmQmJHNffZE": {}, "Ns9X0hFMdzryvhc1": {}, "YjHmmulSBIElc2Cd": {}}}' \
    > test.out 2>&1
eval_tap $? 204 'CheckEventCondition' test.out

#- 205 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RvBb0aGnMt625bWH' \
    --body '{"conditionName": "b5sbX6asrjV7XJUO", "userId": "tHlzXNHEPpzlMlx7"}' \
    > test.out 2>&1
eval_tap $? 205 'DeleteRewardConditionRecord' test.out

#- 206 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'b2H2THLwZGikW7TF' \
    --limit '55' \
    --offset '0' \
    --start '9gE6SrYKq6lcVOhP' \
    --storeId 'JIcEHbiKHW7flVol' \
    --viewId 'AWEMmQSPDTRqjlvw' \
    > test.out 2>&1
eval_tap $? 206 'QuerySections' test.out

#- 207 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nnCA5tfK5ushaKTP' \
    --body '{"active": false, "displayOrder": 22, "endDate": "1983-05-05T00:00:00Z", "ext": {"OUpR3uUdgNlyU4IJ": {}, "nqtrjCOsE8VjvzhJ": {}, "wNX4bhqCjlwrmsSR": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 2, "itemCount": 18, "rule": "LOOP"}, "items": [{"id": "ic1FIMyF7CcNu2DY", "sku": "n6E9Gk51kOTJZluT"}, {"id": "ekDMCGUJvERxNg8d", "sku": "jSb4Vt2vKQ5vlCdI"}, {"id": "519Pf2iogwxM5DZM", "sku": "0dgozmco41750xdY"}], "localizations": {"Qg34WUV0WpmsQnp1": {"description": "n4YGumTKOlDOy5vh", "localExt": {"SkxERZ2AQ1jvXYBa": {}, "r5RMmmGdWl0wpj5t": {}, "VfKU3D8WVPh0Z7Yi": {}}, "longDescription": "GE2cyzTMBY7Xd0Oo", "title": "ENg2Lw7uepmahXoj"}, "VZYz2zMU9jLzNV3G": {"description": "aG43R6nlRPrEAYqR", "localExt": {"BeSc5uShoj3dGHMe": {}, "oi5DBOsQ0Gax0iX0": {}, "5IT9Agsjl5NmnSHh": {}}, "longDescription": "xNmCe4txY0MsPc9E", "title": "Mgf9JCJiEvhL8Zfw"}, "CVJW9yspUOyHC9eK": {"description": "eXzrvzBllwzyC1aT", "localExt": {"WEmPgoy4TkpEw4Ze": {}, "id4mRoFNxv10ckMQ": {}, "VjKk3bWJ0ZuYSe3s": {}}, "longDescription": "I0x2hc8vaN1Off5g", "title": "RZZMW3huAIzBPWBY"}}, "name": "KAEFTdlKNh6GTzKj", "rotationType": "FIXED_PERIOD", "startDate": "1984-08-23T00:00:00Z", "viewId": "sOlfLB1J19b5rTfi"}' \
    > test.out 2>&1
eval_tap $? 207 'CreateSection' test.out

#- 208 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L2P3r1a8KIJH33aK' \
    > test.out 2>&1
eval_tap $? 208 'PurgeExpiredSection' test.out

#- 209 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'kPuWD59MgTy1HA58' \
    --storeId 'Jt5NaROjSKFEuZo2' \
    > test.out 2>&1
eval_tap $? 209 'GetSection' test.out

#- 210 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ElXYSS4ezBRSiOyR' \
    --storeId 'eviDaxlPdhwmcH03' \
    --body '{"active": true, "displayOrder": 5, "endDate": "1978-11-04T00:00:00Z", "ext": {"MxzRR6xd9rTh3ure": {}, "aIbxM3Wev9pZQjWA": {}, "N0tny16ZHZtuSJGQ": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 1, "itemCount": 36, "rule": "SEQUENCE"}, "items": [{"id": "7JEMRPkdTcAzkIln", "sku": "dN5xeayr3vUKMuIi"}, {"id": "z2MiAAKcvAXnxnH0", "sku": "QIhoJRY807VmBT4w"}, {"id": "ZXQZZrSsuYiIPei0", "sku": "pXglJYnKkoCAZuol"}], "localizations": {"AWnxkImVbDP0QX31": {"description": "gI7VmnGIRMvXe6Bi", "localExt": {"phIFe2bzr6qQw6fS": {}, "ESkM19OPMBb12gpm": {}, "ShlmIt2nfhUaZGqj": {}}, "longDescription": "slu59GT2E6AacmZR", "title": "XZm626POXWVj3KP1"}, "mX0iYHXBU3Uk2tQm": {"description": "307IORTyHnLYDAAg", "localExt": {"1YA4kZURmoGgxVRM": {}, "Pf8g1rbhfIMStMnS": {}, "qrKWYOuITlYS2RYa": {}}, "longDescription": "D9WNKGhbLhjz1v0R", "title": "BIO2rkJGmPaK6HEV"}, "IQJd3930TGewjRyf": {"description": "o4nWVZZbKFsKOmgE", "localExt": {"hjH2wFzCpxxJLfAg": {}, "5cFT0gHAkltcR3eH": {}, "FbiAluHv7Hssd05p": {}}, "longDescription": "HBJX5ln8PZbYVD8R", "title": "iaTsdD4d3kSbTkHP"}}, "name": "MUvOAUXkw36cr2WJ", "rotationType": "NONE", "startDate": "1984-05-10T00:00:00Z", "viewId": "pSV94Jy6yCSXBqJq"}' \
    > test.out 2>&1
eval_tap $? 210 'UpdateSection' test.out

#- 211 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'jAbVwSaoj1ugjr8m' \
    --storeId 'Pkr3tZ506ERSVy5M' \
    > test.out 2>&1
eval_tap $? 211 'DeleteSection' test.out

#- 212 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'ListStores' test.out

#- 213 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "3rrkxu0U9h9gCNVZ", "defaultRegion": "xHGxhZqNXJ6JXSh0", "description": "Z3SWISs1dYrJKmx1", "supportedLanguages": ["BT6iLFQejNZJNF2h", "m0TqBQprHn3whPKU", "5abnqw8fFa30pVbh"], "supportedRegions": ["r1BHh1arZAyuLcZo", "EkPpqKhP2jWnRTgl", "w0gdWoE4esuiDrqu"], "title": "ccz4J6fFQezJ5E3i"}' \
    > test.out 2>&1
eval_tap $? 213 'CreateStore' test.out

#- 214 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 214 'GetCatalogDefinition' test.out

#- 215 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 215 'DownloadCSVTemplates' test.out

#- 216 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["YQu7hZvHfiT9s9pK", "8HuUY1QQHQ0NCEdd", "Jtx6GV01vD7lNLxl"], "idsToBeExported": ["pvqaB9P9GaukfCEI", "eSBLhTfzigzHcRuJ", "gYaj4I8Dzyh1N0JE"], "storeId": "KNoMtHvjM7X1fjzk"}' \
    > test.out 2>&1
eval_tap $? 216 'ExportStoreByCSV' test.out

#- 217 ImportStore
eval_tap 0 217 'ImportStore # SKIP deprecated' test.out

#- 218 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'GetPublishedStore' test.out

#- 219 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 219 'DeletePublishedStore' test.out

#- 220 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'GetPublishedStoreBackup' test.out

#- 221 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 221 'RollbackPublishedStore' test.out

#- 222 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nv2HZMIL2P2bh14L' \
    > test.out 2>&1
eval_tap $? 222 'GetStore' test.out

#- 223 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'roFTnAuujPeP9N0v' \
    --body '{"defaultLanguage": "dVB5a2XkS3XQfMuz", "defaultRegion": "Zh4AhZRe2hgU56xt", "description": "yJtnbTDXu7FbleSP", "supportedLanguages": ["5PcdOuq0m0rvakR8", "rcwojLRjhcaJ56nG", "lYZ2tod2BGBXjNyR"], "supportedRegions": ["CtPOr1FU3QZy3gdD", "ms3kb1htW0UGJpwQ", "ZlXuzu3m9u67JjCD"], "title": "wg186hGWKfO9MnoT"}' \
    > test.out 2>&1
eval_tap $? 223 'UpdateStore' test.out

#- 224 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '3t99HmcxzjDhTrcB' \
    > test.out 2>&1
eval_tap $? 224 'DeleteStore' test.out

#- 225 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KtU956hOg8oukDVd' \
    --action 'DELETE' \
    --itemSku '7M36mI9u3EeZtLQi' \
    --itemType 'CODE' \
    --limit '58' \
    --offset '34' \
    --selected  \
    --sortBy 'createdAt,updatedAt:desc,updatedAt:asc' \
    --status 'UNPUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'qdXfhZTTaCeqGv7m' \
    --updatedAtStart 'euQhJuq1C6JHkWMS' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 225 'QueryChanges' test.out

#- 226 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UbqByWN2BCnRz9w2' \
    > test.out 2>&1
eval_tap $? 226 'PublishAll' test.out

#- 227 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nur0B9jKaunAcyls' \
    > test.out 2>&1
eval_tap $? 227 'PublishSelected' test.out

#- 228 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'au7wRQmL4i3eRyIE' \
    > test.out 2>&1
eval_tap $? 228 'SelectAllRecords' test.out

#- 229 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CEDa1I4lwXqwPfq3' \
    --action 'UPDATE' \
    --itemSku 'zHQjtolx64w1gyvj' \
    --itemType 'APP' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd 'cKtGqxMnoAXRlcq0' \
    --updatedAtStart 'mYWKQYlqMmu2pvF6' \
    > test.out 2>&1
eval_tap $? 229 'SelectAllRecordsByCriteria' test.out

#- 230 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'rP03bQaq1cT88H6R' \
    --action 'DELETE' \
    --itemSku 'zsbrtYvLh56AWXoM' \
    --itemType 'CODE' \
    --type 'STORE' \
    --updatedAtEnd 'owdWSs9DQ0VU1HED' \
    --updatedAtStart '9CGo9aUXj3rh0Uyq' \
    > test.out 2>&1
eval_tap $? 230 'GetStatistic' test.out

#- 231 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xVWlIMY5tTJw4KV1' \
    > test.out 2>&1
eval_tap $? 231 'UnselectAllRecords' test.out

#- 232 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '04MtMhKHmSjqPuQZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X5KjdNrEwfWo2Mwu' \
    > test.out 2>&1
eval_tap $? 232 'SelectRecord' test.out

#- 233 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'lLg4bsO4YHEYLjTS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NDf3zazm6p5Y1tkG' \
    > test.out 2>&1
eval_tap $? 233 'UnselectRecord' test.out

#- 234 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '9WwU4Ty6Ch5QYyFj' \
    --targetStoreId 'uBquE7xssm4hxczs' \
    > test.out 2>&1
eval_tap $? 234 'CloneStore' test.out

#- 235 ExportStore
eval_tap 0 235 'ExportStore # SKIP deprecated' test.out

#- 236 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'kbSUbOZ9WNl3apJm' \
    --end 'NAbl1g5ZmTTGYRbP' \
    --limit '93' \
    --offset '87' \
    --sortBy '8AgyZJ16MMd2bzOr' \
    --start 'Tn2huwPgyUzBUWiK' \
    --success  \
    > test.out 2>&1
eval_tap $? 236 'QueryImportHistory' test.out

#- 237 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oNGtvyk5xEfrJDxK' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'sw5Xl7ZZrDZdbuvC' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 237 'ImportStoreByCSV' test.out

#- 238 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'SETUP' \
    --itemId 'd9TGkO6aIYqftw1S' \
    --limit '36' \
    --offset '88' \
    --sku 'M2nhSEanfUYrMU6A' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'pvC1cr5T1PSXhduT' \
    > test.out 2>&1
eval_tap $? 238 'QuerySubscriptions' test.out

#- 239 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'WchzXDv3TAtBjP4H' \
    > test.out 2>&1
eval_tap $? 239 'RecurringChargeSubscription' test.out

#- 240 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'SuiYCbG0UyYUJmNL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 240 'GetTicketDynamic' test.out

#- 241 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '8p6AbdtU0CDrlQpK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "B8qoel2QK3aSOYdm"}' \
    > test.out 2>&1
eval_tap $? 241 'DecreaseTicketSale' test.out

#- 242 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'MDikc3Fjm9HoQDem' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 242 'GetTicketBoothID' test.out

#- 243 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'tiQvURYZCeF30RT9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 36, "orderNo": "Adel3hHMSLAiscGR"}' \
    > test.out 2>&1
eval_tap $? 243 'IncreaseTicketSale' test.out

#- 244 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 52, "currencyCode": "VDCBcvVegrZddP8l", "expireAt": "1990-08-24T00:00:00Z"}, "debitPayload": {"count": 87, "currencyCode": "EPjbUy7F82Adu9BY", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 80, "entitlementCollectionId": "rVTehrqgvEtEs2Lp", "entitlementOrigin": "Steam", "itemIdentity": "jTyRd3LrR1x6U1v6", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 47, "entitlementId": "SLjm9zmzUW0vPj90"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 91, "currencyCode": "LTt5YQGawcomPoiY", "expireAt": "1978-12-15T00:00:00Z"}, "debitPayload": {"count": 8, "currencyCode": "1f1AYq306Pysv4VP", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 99, "entitlementCollectionId": "rpn0vAD9YsPeDWrA", "entitlementOrigin": "IOS", "itemIdentity": "ZSvgWuCuLsUGrVQA", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 16, "entitlementId": "3g62oGYwkrjLI4EH"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 62, "currencyCode": "KtfXCKOna8DdjtZh", "expireAt": "1975-05-01T00:00:00Z"}, "debitPayload": {"count": 10, "currencyCode": "wdCpVpnENiTc9NES", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 9, "entitlementCollectionId": "lmV3kES0Hi88UYgS", "entitlementOrigin": "Steam", "itemIdentity": "40OvY7apPCrN5bEh", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 96, "entitlementId": "uHgKeWizEpw1zN0m"}, "type": "CREDIT_WALLET"}], "userId": "gGhHMz9dddLWJWDu"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 40, "currencyCode": "vLyH9kcSBdk7MwQz", "expireAt": "1978-08-01T00:00:00Z"}, "debitPayload": {"count": 27, "currencyCode": "8Le5neohqhCzroAz", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 88, "entitlementCollectionId": "hJoT0WK5ngNUxDKf", "entitlementOrigin": "Playstation", "itemIdentity": "YofPGUbSaA00nKxQ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "YU6KlavIiLxU2I1G"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 4, "currencyCode": "S48Hxu8Ju4XSAnlX", "expireAt": "1993-12-11T00:00:00Z"}, "debitPayload": {"count": 56, "currencyCode": "rJ0f5lwXvRNDBnmL", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "rW1qx3NJTugVWXz8", "entitlementOrigin": "Epic", "itemIdentity": "6mLBordrJkD6vy60", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 88, "entitlementId": "UAJIHEZv5zyUUyNJ"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 48, "currencyCode": "A5xF3zHtZSd3QzXh", "expireAt": "1976-12-15T00:00:00Z"}, "debitPayload": {"count": 36, "currencyCode": "zOidrWnLrXqImgDf", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 66, "entitlementCollectionId": "1YfIgLZ4YIzElrLZ", "entitlementOrigin": "Xbox", "itemIdentity": "1e1825iasunESjcg", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "2drXG5NkKCySLA8c"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "Cs0dFYRSa2OULZ0i"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 67, "currencyCode": "ZJiOAh1SpLhMF2Pa", "expireAt": "1982-04-09T00:00:00Z"}, "debitPayload": {"count": 14, "currencyCode": "FuU8iXCRz8Kgqgwi", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 17, "entitlementCollectionId": "YxpGhsFArq6lolbj", "entitlementOrigin": "Xbox", "itemIdentity": "QKvtVRCPMjr5M3vw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 66, "entitlementId": "3Z4pgyJYwclb4gd4"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 86, "currencyCode": "SECsypS42NmYQ8Hl", "expireAt": "1988-05-17T00:00:00Z"}, "debitPayload": {"count": 2, "currencyCode": "wqytieXpIZfr5XDq", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 7, "entitlementCollectionId": "iKd9vLPP0w52JRAZ", "entitlementOrigin": "Playstation", "itemIdentity": "qPNDqWrpkWnnova1", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 99, "entitlementId": "YLge851PbK2MFKvw"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 99, "currencyCode": "yq3I1BLtGEZDRNkk", "expireAt": "1999-08-25T00:00:00Z"}, "debitPayload": {"count": 86, "currencyCode": "JUofJXK8RGS0zCYR", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "bfzwUmsy0stUmKdX", "entitlementOrigin": "IOS", "itemIdentity": "oLWDPSZexfKVxqdx", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 69, "entitlementId": "h5QWxuQuI7gdDTDb"}, "type": "CREDIT_WALLET"}], "userId": "7iXEEM2KOusNEHcI"}], "metadata": {"95GGdJvucDbs6Udc": {}, "cuM2ykRj3WnyAaUa": {}, "QBKFedL2uduXvZUb": {}}, "needPreCheck": true, "transactionId": "13FhD3NExUFipJsU", "type": "iDawAjgHFQk0VzWR"}' \
    > test.out 2>&1
eval_tap $? 244 'Commit' test.out

#- 245 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '9' \
    --status 'SUCCESS' \
    --type 'sipbP027okM5E8tA' \
    --userId 'ajVSvLRj306RDuaS' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByCriteria' test.out

#- 246 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'ixXEdloYZBkatNLc' \
    > test.out 2>&1
eval_tap $? 246 'GetTradeHistoryByTransactionId' test.out

#- 247 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '42eq0O6VsXtOlQwj' \
    --body '{"achievements": [{"id": "5xPvm7c5nPR0Y1sf", "value": 10}, {"id": "9FSeg6WYgtfuqJHr", "value": 37}, {"id": "QtKgyIeySoUxoMrj", "value": 45}], "steamUserId": "J4JGQZAtyjTxnlmS"}' \
    > test.out 2>&1
eval_tap $? 247 'UnlockSteamUserAchievement' test.out

#- 248 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjEaFH2DRN6HIEqI' \
    --xboxUserId 'FEcS0ynIMOYWpUYU' \
    > test.out 2>&1
eval_tap $? 248 'GetXblUserAchievements' test.out

#- 249 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QMooiKT57rmbjEni' \
    --body '{"achievements": [{"id": "meR7EFBz43E9FkOP", "percentComplete": 98}, {"id": "FqvfDG5jvMOaXrDl", "percentComplete": 63}, {"id": "bBd5wb5H3qppoCiH", "percentComplete": 80}], "serviceConfigId": "q0kIbrJ2S5Pf1Lvg", "titleId": "8kYEVylINJpxFY8E", "xboxUserId": "6pU8eHjh0aTjIOaQ"}' \
    > test.out 2>&1
eval_tap $? 249 'UpdateXblUserAchievement' test.out

#- 250 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 't0snbE0yMvqF7TJ9' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeCampaign' test.out

#- 251 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uB0zypjJiu7BIimN' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeEntitlement' test.out

#- 252 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'uwB3hBVhuSMHhf5R' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeFulfillment' test.out

#- 253 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '2MkxQTAYGfE6hXZ7' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeIntegration' test.out

#- 254 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'XLoWCGf0dZEeXBd6' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizeOrder' test.out

#- 255 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'mGG6SHcZbX2wNnT6' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizePayment' test.out

#- 256 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9zosmDnXoncy7NZ' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeRevocation' test.out

#- 257 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q4PkAPXBCfkE1Fb0' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeSubscription' test.out

#- 258 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'y94eP7yh0zsKhR60' \
    > test.out 2>&1
eval_tap $? 258 'AnonymizeWallet' test.out

#- 259 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'HZwUwk48XK7MXHbE' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLCByPlatform' test.out

#- 260 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'VB7cNzHhvxc4xAPZ' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 260 'GetUserDLC' test.out

#- 261 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'NnQOhusPn4466u8a' \
    --activeOnly  \
    --appType 'DEMO' \
    --collectionId 'qEFXUhGAwpYq1UqZ' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'RJ4UP09fabC01Thm' \
    --features '9f4AWpyiKVT3OvEu,jx5yjtQSCJaOHzpb,623EciYoYOPVg6DL' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'EZ6DxpwBm2N8PdQ5,mQaGXEbnmWR0H3Ek,rHqaLNdfKszYZzOg' \
    --limit '49' \
    --offset '93' \
    --origin 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 261 'QueryUserEntitlements' test.out

#- 262 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'DFcmOm1sqdIWU6ER' \
    --body '[{"collectionId": "ylESgf5dXMrPoYSo", "endDate": "1974-04-16T00:00:00Z", "grantedCode": "frLyXMSrC62xYtDw", "itemId": "flNGfufW5cWeg6eS", "itemNamespace": "CypsceITTkJGGCVF", "language": "nS_571", "metadata": {"zmDAaW5xz1c7ZuZX": {}, "UCBYnkY0LEBSYBdU": {}, "SiTOrhB8hVs29WOK": {}}, "origin": "Nintendo", "quantity": 90, "region": "3YlJ93CCGBXv4fP4", "source": "OTHER", "startDate": "1992-06-28T00:00:00Z", "storeId": "zhcH4UJrrCKvrOAi"}, {"collectionId": "7lMgkVWJYzSCIDxW", "endDate": "1995-04-01T00:00:00Z", "grantedCode": "xgOzeRNHIqK5PT40", "itemId": "4mFw4HJv5T2kIQOe", "itemNamespace": "cfLsYKTmUnKlrOsJ", "language": "fG_boqx-586", "metadata": {"imJHNI0l6jJVzF1O": {}, "i2sQuWUBBHZonSmz": {}, "F831vlCiZAZHCWMX": {}}, "origin": "Other", "quantity": 90, "region": "Vh8HTrKqVwnpPn8N", "source": "PURCHASE", "startDate": "1974-11-14T00:00:00Z", "storeId": "JQq94Re5IM1akNKz"}, {"collectionId": "9IltQUku3n32atB0", "endDate": "1992-11-16T00:00:00Z", "grantedCode": "PQPEp5UtwUWGt6to", "itemId": "oHP5kAww01zalTdd", "itemNamespace": "hAQ1pwqnybvUIfuu", "language": "IM", "metadata": {"Zqz5NSp0B7LODN3B": {}, "oi2sSAO2n4MZQt75": {}, "3XQB93rOW0guPoQb": {}}, "origin": "GooglePlay", "quantity": 51, "region": "F0xtQAXoDoFkmA3f", "source": "GIFT", "startDate": "1971-07-29T00:00:00Z", "storeId": "uqUuyW3cMz9YyduM"}]' \
    > test.out 2>&1
eval_tap $? 262 'GrantUserEntitlement' test.out

#- 263 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'omEHcU15St4v8ry8' \
    --activeOnly  \
    --appId 'IyqNVv0KVpXJTMx3' \
    > test.out 2>&1
eval_tap $? 263 'GetUserAppEntitlementByAppId' test.out

#- 264 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y8Um1iqehObg3OZ9' \
    --activeOnly  \
    --limit '19' \
    --offset '62' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 264 'QueryUserEntitlementsByAppType' test.out

#- 265 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'opeHD6iKBGm5Cj7R' \
    --ids 'qnJUmfDmofxvN8pR,GoUtmbWZbEjPyq35,BWDoc3qNcQFFyHv1' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementsByIds' test.out

#- 266 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '41NPqjRUMKSQjFdj' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'sEHvSxjWoM1rNJLM' \
    --itemId '0OOVG5cG6XxENbWq' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementByItemId' test.out

#- 267 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'lX7idzjpKDfwl6Xl' \
    --ids 'CF6YxFMD8tJQwZvU,VInos5RK100yH89i,8ZDPXRL8cbTAntB1' \
    --platform 'STaab1UeibXg7RCe' \
    > test.out 2>&1
eval_tap $? 267 'GetUserActiveEntitlementsByItemIds' test.out

#- 268 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '5BtKcwj6PqqOgCim' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'Kx6ByTygbtOtcQS4' \
    --sku 'Cmgw1wRUnIVYxY6O' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlementBySku' test.out

#- 269 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hdkrYiCinoVOzo4P' \
    --appIds 'lv1IlTpEhjTFYdzs,UNvQAn2LuMjLqwmV,z3zKsfjz1mFkyxoU' \
    --itemIds 'zfMFoXCOguSq2A4R,3wDdSkNfHJtA3QiX,9ZvtydbaVb0scd97' \
    --platform 'A0GP6djn2Ps3IVT5' \
    --skus 'hUZ3cnDq0ddZG0Ep,fGAqHKcSxUc2YgRp,k2IFGIgIpscUpVAc' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlement' test.out

#- 270 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'iu2XPPUxzXHUvxhv' \
    --platform 'TZcvRKoaM4ozSAg8' \
    --itemIds 'FTLrByWOJhbocoGl,PzdfxcC3rpWhSpq0,InxMLpP7n7M3JXjE' \
    > test.out 2>&1
eval_tap $? 270 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 271 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vsj5WcQ99M1yuXeq' \
    --appId 'V31LX2ehcMnM6Qtj' \
    > test.out 2>&1
eval_tap $? 271 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 272 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zQjDlUMCGnxZwak7' \
    --entitlementClazz 'MEDIA' \
    --platform 'Dokltgq2vXtUnY6U' \
    --itemId 'hDJ4pe0s0Cuhl3dU' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemId' test.out

#- 273 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '9b4seYCyiB4tDCWx' \
    --ids '3cEX8wTi1v2abpCW,ytPEi9Ze0hL9rPkV,5GkSrcl2O47XVzU7' \
    --platform 'qlNVk7qnmBS3XKDh' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipByItemIds' test.out

#- 274 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'p1OkMcErmeH0lX1h' \
    --entitlementClazz 'CODE' \
    --platform '3XgTRTjI9oNBzgQ4' \
    --sku 'CRwg0sKVeSpMny0G' \
    > test.out 2>&1
eval_tap $? 274 'GetUserEntitlementOwnershipBySku' test.out

#- 275 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rvKI5EVB9ZFzLNsj' \
    > test.out 2>&1
eval_tap $? 275 'RevokeAllEntitlements' test.out

#- 276 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'dCFtKY0KsxR0rCFk' \
    --entitlementIds 'yiQZfMnTbKdwNhiI' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlements' test.out

#- 277 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'P7dpJ8B8VwFQnVco' \
    --namespace "$AB_NAMESPACE" \
    --userId '2oCn1KvJmbjapW9U' \
    > test.out 2>&1
eval_tap $? 277 'GetUserEntitlement' test.out

#- 278 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'lEqtzDd7SgxdxB5k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vtM8ah9bPsksceGU' \
    --body '{"collectionId": "EX8ERZcKSYLo6y7y", "endDate": "1989-11-13T00:00:00Z", "nullFieldList": ["XLIg3MgmdSvWp3h0", "xPsVY8qNwB2TY4v9", "NNfQSYLFKSl3FNFF"], "origin": "Twitch", "reason": "JSa5cRn31D8ubfdX", "startDate": "1975-04-23T00:00:00Z", "status": "SOLD", "useCount": 56}' \
    > test.out 2>&1
eval_tap $? 278 'UpdateUserEntitlement' test.out

#- 279 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '816aH6gOBUIMeL0G' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L3aefSDME8X2MxIL' \
    --body '{"metadata": {"I42BJMPkZmay4Csy": {}, "e3iJLtjsu6ZJRCoD": {}, "q3geuHFFaZzPIjET": {}}, "options": ["qcKN1gaQ4Bn0cPPt", "KaJlw31pdDrXQ47W", "SGyDCKF0LLhO3lGZ"], "platform": "7eGOPj2XoFug8BUQ", "requestId": "UmPHnPumcazKAna0", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 279 'ConsumeUserEntitlement' test.out

#- 280 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'ZM28w4mnYvvlt1es' \
    --namespace "$AB_NAMESPACE" \
    --userId '7A4PFduN4gx0UC6e' \
    > test.out 2>&1
eval_tap $? 280 'DisableUserEntitlement' test.out

#- 281 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'WKCFGS97Si6XyLVP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rkUxyZ1OH5Nn4nMT' \
    > test.out 2>&1
eval_tap $? 281 'EnableUserEntitlement' test.out

#- 282 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '8QOyTuUSD9ImtaPA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ocOQcpBWSNrCjSNE' \
    > test.out 2>&1
eval_tap $? 282 'GetUserEntitlementHistories' test.out

#- 283 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'AdojkCMmYyTGO07f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oRZ6FujpIWo0qJtq' \
    --body '{"metadata": {"p4Q6XgICLgMHcP1e": {}, "E6sjWQllYsONpp6Q": {}, "GW56CNiszHE69D1M": {}}}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlement' test.out

#- 284 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'Moaf6KlgRtwaM2Io' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yY1wpIdjcAtTj1IM' \
    --body '{"reason": "uuhxxlulfmya73hX", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 284 'RevokeUserEntitlementByUseCount' test.out

#- 285 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'a8Ri85PA9wNpmrK5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y5heA2ewWnFcqHxX' \
    --quantity '85' \
    > test.out 2>&1
eval_tap $? 285 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 286 RevokeUseCount
eval_tap 0 286 'RevokeUseCount # SKIP deprecated' test.out

#- 287 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'XeqO8gY3c4SryWB4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yRaDxvxwaLM8HkVO' \
    --body '{"platform": "W8PnLkgqkqYZWPZT", "requestId": "gKagTzdcYcko7U3g", "useCount": 70}' \
    > test.out 2>&1
eval_tap $? 287 'SellUserEntitlement' test.out

#- 288 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Msl7zrNJvDiP2hNN' \
    --body '{"duration": 63, "endDate": "1971-10-15T00:00:00Z", "entitlementCollectionId": "6VgA5yFIH3s9Uyea", "entitlementOrigin": "System", "itemId": "gyCUpM1JBcTzf4dz", "itemSku": "1BojPoQg976409vF", "language": "d5z9r4nJWUvLp1wx", "metadata": {"GF747468MXUq3uIf": {}, "fkIpPmrWVxNZUvki": {}, "U2jXSwsBBRopVl38": {}}, "order": {"currency": {"currencyCode": "d4NZGtk6EmWxC75M", "currencySymbol": "88TKhFYkA9aRNDe2", "currencyType": "VIRTUAL", "decimals": 30, "namespace": "HurgOfba1XeoHYTN"}, "ext": {"oRol84UlkxtP5Vok": {}, "9sNK1ORg3tChsS3f": {}, "FpaS1uq1mH3oYfPK": {}}, "free": true}, "orderNo": "QiAUhIfi17YrkWHN", "origin": "Playstation", "overrideBundleItemQty": {"XBfgBLuglkd9LIos": 15, "L0fJOPYpnPqGlPnh": 56, "YY1vlV0M2g6oreqy": 57}, "quantity": 53, "region": "jfyDbtIXICLkK8Zv", "source": "ACHIEVEMENT", "startDate": "1977-07-16T00:00:00Z", "storeId": "Tg3znlg8nmzQx1Rs"}' \
    > test.out 2>&1
eval_tap $? 288 'FulfillItem' test.out

#- 289 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'YhcRlv16Wwe8YK3l' \
    --body '{"code": "ZFslECI9QzuQcsjF", "language": "Hj-Cvve_465", "region": "NgN7GoeMsezFZsTB"}' \
    > test.out 2>&1
eval_tap $? 289 'RedeemCode' test.out

#- 290 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HkgcJ0DcEt23pci6' \
    --body '{"itemId": "xEljer6aGJx5OFp3", "itemSku": "jKEx4aSGdwTPX4ig", "quantity": 81}' \
    > test.out 2>&1
eval_tap $? 290 'PreCheckFulfillItem' test.out

#- 291 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'xttUz8nWKJjv06Pu' \
    --body '{"entitlementCollectionId": "ffHghAQfAsYXVzBe", "entitlementOrigin": "Nintendo", "metadata": {"4wM9WZfOOxAzmsbh": {}, "i5QJuc2SNBaOlXfg": {}, "sgBd7MYLLoPZrkjR": {}}, "origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "SwZw2UkjDzJ4NuMM", "namespace": "gI13nplXaUQV5QEv"}, "item": {"itemId": "KElLfbB7gwwAR1xF", "itemName": "rnyirw3iJt5iA3JS", "itemSku": "2xeaJ08JrSHPqdhK", "itemType": "Hn6ZjZMdr1C2TIQz"}, "quantity": 89, "type": "CURRENCY"}, {"currency": {"currencyCode": "fPy5fpbbbMIu9lu1", "namespace": "8jIMBUM77XmemN8L"}, "item": {"itemId": "O03mnFSq9jJTVFoF", "itemName": "jxZjh5qUR1Pq4a4u", "itemSku": "aMfd0SQAfYIyzHL8", "itemType": "jxakuVu5r5B08VZx"}, "quantity": 72, "type": "CURRENCY"}, {"currency": {"currencyCode": "apnZXoJ4gI4EQKO8", "namespace": "xC4D0FsUo3IB2kX5"}, "item": {"itemId": "REQZsHyXzoIXNf0K", "itemName": "bL9HyJttdgfLGO3u", "itemSku": "mmpllnV6B62P1Kaz", "itemType": "g73c6UpmA4ehxNII"}, "quantity": 22, "type": "ITEM"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "AmkanukAzAMaRvIU"}' \
    > test.out 2>&1
eval_tap $? 291 'FulfillRewards' test.out

#- 292 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'hUwguGgbLLN3O7CE' \
    --endTime 'YjxqElP5lA2FJ0iG' \
    --limit '76' \
    --offset '88' \
    --productId 'RTXGsC5mxxse4eeu' \
    --startTime 'MgEctVEux2MSuwsE' \
    --status 'REVOKE_FAILED' \
    --type 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserIAPOrders' test.out

#- 293 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'b7G5FDX4mu0qPHb9' \
    > test.out 2>&1
eval_tap $? 293 'QueryAllUserIAPOrders' test.out

#- 294 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ll2EFEb8GnsthmQ2' \
    --endTime 'Y6ZGOiqrg3lpqN5b' \
    --limit '82' \
    --offset '79' \
    --startTime 'fnqJ5bzDRzbhMxfE' \
    --status 'PENDING' \
    --type 'TWITCH' \
    > test.out 2>&1
eval_tap $? 294 'QueryUserIAPConsumeHistory' test.out

#- 295 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6DyED4prRVibTATx' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "XnAa_VC", "productId": "QYBO8m0HgTth479W", "region": "8rXqwGVIRWgTNHCk", "transactionId": "a3Wb5kH1BrLWUetP", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 295 'MockFulfillIAPItem' test.out

#- 296 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nz2IUEHMzl5jhwVD' \
    --body '{"skus": ["suzwJ4v50eoaIBrT", "h0EKkJioUpvGnkcH", "gCfaWzPUvCnfqsPG"]}' \
    > test.out 2>&1
eval_tap $? 296 'AdminSyncOculusSubscriptions' test.out

#- 297 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'gJZyRwigaMu07Zek' \
    --namespace "$AB_NAMESPACE" \
    --userId '8WObpf0FHYfViEj7' \
    > test.out 2>&1
eval_tap $? 297 'AdminGetIAPOrderLineItems' test.out

#- 298 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '0KYKIfFt4GYjUt4F' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamAbnormalTransaction' test.out

#- 299 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZVy2qFfSr3psWjO' \
    --body '{"orderId": "yHLyKe2foqsVIfgB"}' \
    > test.out 2>&1
eval_tap $? 299 'AdminSyncSteamIAPByTransaction' test.out

#- 300 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tr8RcxRQR0NYdJzf' \
    --activeOnly  \
    --groupId '3TMhSaynVs05nZC4' \
    --limit '84' \
    --offset '63' \
    --platform 'PLAYSTATION' \
    --productId 'G4meKEabfVXBJPIZ' \
    > test.out 2>&1
eval_tap $? 300 'QueryUserThirdPartySubscription' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'GNH2K0UuJdeGNquQ' \
    --groupId 'naXpDQ5rU2taDWh9' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 302 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId 'V5oc5IFQsrwHqFqw' \
    --productId 'VA5mozeeOjIFQfXV' \
    > test.out 2>&1
eval_tap $? 302 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 303 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId '3YW3ug3nCXhD7FUz' \
    --activeOnly  \
    --groupId '1iOe0pHa0LmseIRX' \
    --limit '9' \
    --offset '13' \
    --platform 'OCULUS' \
    --productId 'K3JgZufzssA284mG' \
    > test.out 2>&1
eval_tap $? 303 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 304 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id '7uAojLYBsx8oqMzb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0ljQaBtb47V691j' \
    > test.out 2>&1
eval_tap $? 304 'GetThirdPartySubscriptionDetails' test.out

#- 305 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id '0FZp2vjOXptxzx6k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kaZYpl52sQR9Znp5' \
    --limit '7' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 305 'GetSubscriptionHistory' test.out

#- 306 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id '1eSwrG2GBBEWrDbQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZzhDuLHq9LTBstg' \
    > test.out 2>&1
eval_tap $? 306 'SyncSubscriptionTransaction' test.out

#- 307 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'uOdN0O7l3GbKPHdD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQDEEE2mTsn1NwJ7' \
    > test.out 2>&1
eval_tap $? 307 'GetThirdPartyUserSubscriptionDetails' test.out

#- 308 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id '1szsNmnqZSWdEyOV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YrTdDq7IqbTVv8BL' \
    > test.out 2>&1
eval_tap $? 308 'SyncSubscription' test.out

#- 309 AdminSyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform adminSyncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'sqQW8HSrEm5Y7jI2' \
    --body '{"gameId": "32SjktijiNzTUe8K", "language": "bI-KM", "region": "yKk0UXUF2523OTvO"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminSyncTwitchDropsEntitlement' test.out

#- 310 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'mfVNJNDaSO3FEkk4' \
    --discounted  \
    --itemId 'It6V8Bu7rIjGrxUM' \
    --limit '75' \
    --offset '85' \
    --status 'CHARGEBACK' \
    > test.out 2>&1
eval_tap $? 310 'QueryUserOrders' test.out

#- 311 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'lvYanGqEkn9OEVwL' \
    --body '{"currencyCode": "WGT4MXhmzvRQb7c0", "currencyNamespace": "vmjWq9fQqzulLGfQ", "discountCodes": ["9BYLVVznF6hMYfks", "MqSLQDlRFYMVfiAM", "a6Pco7MfvikslpyL"], "discountedPrice": 31, "entitlementPlatform": "IOS", "ext": {"8VQhYSFeBOp0ilGQ": {}, "FwHUtZugblT3aIDK": {}, "n9qJXncm5igpAewb": {}}, "itemId": "mnWk0E7YaPblcWEy", "language": "Ngvs5LEZrQXzSQRW", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 45, "quantity": 63, "region": "Zdj6AspWBfRnLcLb", "returnUrl": "p7OmcrDJ7u1rrRPc", "sandbox": false, "sectionId": "rnOzbsFBqg6dziWv"}' \
    > test.out 2>&1
eval_tap $? 311 'AdminCreateUserOrder' test.out

#- 312 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dNcwfUBMdNuTaiLx' \
    --itemId 'FMXRpDP9xutntU8x' \
    > test.out 2>&1
eval_tap $? 312 'CountOfPurchasedItem' test.out

#- 313 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Hw4yYJOCViHwunQw' \
    --userId 'pC2eCFUAHZaYSvsW' \
    > test.out 2>&1
eval_tap $? 313 'GetUserOrder' test.out

#- 314 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iNJtqXltZF6aSRmH' \
    --userId 'U5iR3hXIbzWPKOkz' \
    --body '{"status": "CHARGEBACK_REVERSED", "statusReason": "LljC7gcT3M1DArk4"}' \
    > test.out 2>&1
eval_tap $? 314 'UpdateUserOrderStatus' test.out

#- 315 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'L80aXFY7SQkym9Kv' \
    --userId 'KMHK5fbqioeoRIpl' \
    > test.out 2>&1
eval_tap $? 315 'FulfillUserOrder' test.out

#- 316 GetUserOrderGrant
eval_tap 0 316 'GetUserOrderGrant # SKIP deprecated' test.out

#- 317 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'Y0DIzRCNAO6ZpqXJ' \
    --userId 'mPJso6M11LLZWKgW' \
    > test.out 2>&1
eval_tap $? 317 'GetUserOrderHistories' test.out

#- 318 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xn9YL16HQdtAneXG' \
    --userId 'gxNg33ZIUrIkfmdX' \
    --body '{"additionalData": {"cardSummary": "VvaPQzzKdFg7N7pi"}, "authorisedTime": "1994-04-05T00:00:00Z", "chargebackReversedTime": "1974-06-19T00:00:00Z", "chargebackTime": "1972-01-29T00:00:00Z", "chargedTime": "1980-12-12T00:00:00Z", "createdTime": "1996-06-09T00:00:00Z", "currency": {"currencyCode": "LZnuMNpKEIs3GC9V", "currencySymbol": "TK7tkJWFpHt7MdKu", "currencyType": "REAL", "decimals": 48, "namespace": "wn5GHJDGatrYOMO9"}, "customParameters": {"1CYEjX867n9PT9fR": {}, "7mMuBXPDKCriRKzT": {}, "Z7TXAVRnUVbxEJcK": {}}, "extOrderNo": "HE764EwhQfxFKIOG", "extTxId": "T1WKSmLoA0ILaESC", "extUserId": "1GJXsoBwqh0TQXa2", "issuedAt": "1976-06-25T00:00:00Z", "metadata": {"v3zQJoQLTAlW75ic": "IKUpXazsFrmaGNoi", "3RPTgWotLNz0u8yS": "xA0yrjz4q7e0EJnA", "DXC2y0DY1E1SMK9o": "A4vK56dsYI5SKV5p"}, "namespace": "DANyJ184miBhdVJt", "nonceStr": "81fmLSyGuu5rbJVI", "paymentData": {"discountAmount": 46, "discountCode": "fAV5iOfzwt3bpxRN", "subtotalPrice": 40, "tax": 80, "totalPrice": 23}, "paymentMethod": "HGGedk0KzXRclOXd", "paymentMethodFee": 86, "paymentOrderNo": "Fn8TvZVTe4L2lXrV", "paymentProvider": "CHECKOUT", "paymentProviderFee": 35, "paymentStationUrl": "8Hd1lRtoPMvsu9os", "price": 45, "refundedTime": "1987-09-10T00:00:00Z", "salesTax": 90, "sandbox": false, "sku": "vzwwGnpbx8MCIjKz", "status": "DELETED", "statusReason": "6TUe3jbuQ7HMPO4o", "subscriptionId": "zK705ykRqSPYZgPm", "subtotalPrice": 59, "targetNamespace": "JLsXVtBOEetHsxAJ", "targetUserId": "8Ny1LRkPU9hrl5nk", "tax": 31, "totalPrice": 61, "totalTax": 72, "txEndTime": "1972-04-19T00:00:00Z", "type": "Be8bYWdok4UnUEOy", "userId": "P0cPZf5OvolfI0mq", "vat": 4}' \
    > test.out 2>&1
eval_tap $? 318 'ProcessUserOrderNotification' test.out

#- 319 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'EBgst9Qu8Ofl2oB8' \
    --userId 'VTjF0pD3NHU8iYUO' \
    > test.out 2>&1
eval_tap $? 319 'DownloadUserOrderReceipt' test.out

#- 320 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'tG5gbQSKW2MdgCH4' \
    --body '{"currencyCode": "bWxRF6fBPa6GOuV5", "currencyNamespace": "z0p8jaJs2duQqawP", "customParameters": {"rxi6F4elhy9CZ94C": {}, "AUVW8FoEf8tjCjWc": {}, "22qqDfNz59jHwSDQ": {}}, "description": "HadmAo0lzhPm7Rma", "extOrderNo": "Or6TLwVyE42ApAb7", "extUserId": "CKt79wAopZL9Cw6K", "itemType": "EXTENSION", "language": "bG-xD", "metadata": {"w1qnCAvdnAcokJ0r": "zqX2KJcYHgiFDxcl", "BXap6j73doCWxhub": "MXbxNvT6wAffv4uz", "KAwiI4wTxNIefCmt": "rxWu293551nQBNKc"}, "notifyUrl": "qCkUXRj8gQHEe4CO", "omitNotification": false, "platform": "70OsbzRKKPd6mjzL", "price": 48, "recurringPaymentOrderNo": "slEYM8ngVT1ewVxv", "region": "gAocOqsd5v5n7eXC", "returnUrl": "o9gZWdxfIdW8fNAM", "sandbox": false, "sku": "YdHivK2Q0WwolQy0", "subscriptionId": "37hJMOEv5W0v25yA", "title": "ObZIbrA8XAKKWMDe"}' \
    > test.out 2>&1
eval_tap $? 320 'CreateUserPaymentOrder' test.out

#- 321 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'behSjpt0wrfWPXaI' \
    --userId '1Jb75o2MFOa6xgPt' \
    --body '{"description": "69QROGDeJCyHvUsn"}' \
    > test.out 2>&1
eval_tap $? 321 'RefundUserPaymentOrder' test.out

#- 322 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'LvXCSgQHvs25eiQO' \
    > test.out 2>&1
eval_tap $? 322 'GetUserPlatformAccountClosureHistories' test.out

#- 323 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '3oWdgXdm1IxL1Otl' \
    --body '{"code": "eUBqBO0Ze049k9W6", "orderNo": "ZLVJzRpUsITfVruD"}' \
    > test.out 2>&1
eval_tap $? 323 'ApplyUserRedemption' test.out

#- 324 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'ukun42zPZvOd4yZy' \
    --body '{"meta": {"MKyED3qDO5HXp5oV": {}, "khESbHQ7hvTlzf7X": {}, "wQtVIYU87NgjDMcJ": {}}, "reason": "xfMfYFlt3JvDgMiy", "requestId": "BGygWFTAY3Th5mOw", "revokeEntries": [{"currency": {"balanceOrigin": "Xbox", "currencyCode": "ziexzOLbOWbtcJUx", "namespace": "M3AWyDkA5LmART6k"}, "entitlement": {"entitlementId": "ulpM4SRtUE5P4kxm"}, "item": {"entitlementOrigin": "System", "itemIdentity": "MlY8UjprhCxhzW6Z", "itemIdentityType": "ITEM_SKU", "origin": "IOS"}, "quantity": 8, "type": "ITEM"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "rtVJZVhxCVdjPutJ", "namespace": "8dkAVOJ5imghdfVh"}, "entitlement": {"entitlementId": "jnjd66A1SQmWGSQL"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "q02W8tkTURUFmqNc", "itemIdentityType": "ITEM_ID", "origin": "Other"}, "quantity": 22, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Steam", "currencyCode": "QqptccNorRls7EC3", "namespace": "nDnhFvDlFd7iyZpv"}, "entitlement": {"entitlementId": "WVJFK6ZuvlzGCII1"}, "item": {"entitlementOrigin": "IOS", "itemIdentity": "6hIg0g8HIxpzm9Ac", "itemIdentityType": "ITEM_ID", "origin": "System"}, "quantity": 75, "type": "ENTITLEMENT"}], "source": "IAP", "transactionId": "WEshmZf5fEdvjbyJ"}' \
    > test.out 2>&1
eval_tap $? 324 'DoRevocation' test.out

#- 325 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'PQ1qdRcJjsme1Ouk' \
    --body '{"gameSessionId": "IfIZVH8q8svV5hMO", "payload": {"SfpyJkJlmJmTkFvB": {}, "7wkY6nuUEGJ3k0HG": {}, "tpK43uORGREOOwTu": {}}, "scid": "Y8dhNCDWWpN3B6te", "sessionTemplateName": "dgFUzBm5vGA3itKa"}' \
    > test.out 2>&1
eval_tap $? 325 'RegisterXblSessions' test.out

#- 326 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'F9z3WWuv3j8T9g1f' \
    --chargeStatus 'SETUP' \
    --itemId 'P3D3rVcC2g6t42jE' \
    --limit '99' \
    --offset '83' \
    --sku 'ad232YV7A2zHFGbN' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 326 'QueryUserSubscriptions' test.out

#- 327 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'jelcN0GJmPwUTWMx' \
    --excludeSystem  \
    --limit '60' \
    --offset '78' \
    --subscriptionId 'QZ7vnTx8HDXTJWiy' \
    > test.out 2>&1
eval_tap $? 327 'GetUserSubscriptionActivities' test.out

#- 328 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'w17ogzmbj4SLYDrZ' \
    --body '{"grantDays": 74, "itemId": "NhmUt6fzYRn85brT", "language": "u8F7cuCPh1TGZJmg", "reason": "WNHWnvOBRCt4onqR", "region": "o2PnMSRarKg4coy3", "source": "AFpULIn21Nf2FNgD"}' \
    > test.out 2>&1
eval_tap $? 328 'PlatformSubscribeSubscription' test.out

#- 329 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WNC6yh7kgTHlrxKb' \
    --itemId 'sV4XtrI7SFBEgkwH' \
    > test.out 2>&1
eval_tap $? 329 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 330 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ifMHYI581HbF7fMX' \
    --userId '9lDXYxGRJM92eX42' \
    > test.out 2>&1
eval_tap $? 330 'GetUserSubscription' test.out

#- 331 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'WW2WKf5urEOpASBi' \
    --userId 'cX3ZwzZ7aVhrkmhS' \
    > test.out 2>&1
eval_tap $? 331 'DeleteUserSubscription' test.out

#- 332 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'OEozGOv8D0iVxzre' \
    --userId 'c5kNwJAxm0Rdm9l6' \
    --force  \
    --body '{"immediate": false, "reason": "8BSrucjO3zvSM5Ke"}' \
    > test.out 2>&1
eval_tap $? 332 'CancelSubscription' test.out

#- 333 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'VNHU9GcOivIfcCJt' \
    --userId '4U8VSgXoi9Fw25b9' \
    --body '{"grantDays": 34, "reason": "TEhMXMepgzY9jLiA"}' \
    > test.out 2>&1
eval_tap $? 333 'GrantDaysToSubscription' test.out

#- 334 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dMiQ7eDMkeBRMur1' \
    --userId '8nCxiV9bQMHpPbvf' \
    --excludeFree  \
    --limit '23' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 334 'GetUserSubscriptionBillingHistories' test.out

#- 335 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'I3LkRc1NgZaoYAaC' \
    --userId 'CeRgtstsU3Qecxo4' \
    --body '{"additionalData": {"cardSummary": "bQZO3P2f8TTOVf6j"}, "authorisedTime": "1979-05-21T00:00:00Z", "chargebackReversedTime": "1998-08-26T00:00:00Z", "chargebackTime": "1992-02-04T00:00:00Z", "chargedTime": "1990-11-09T00:00:00Z", "createdTime": "1998-01-14T00:00:00Z", "currency": {"currencyCode": "6QpqCgxt0NgDSj1T", "currencySymbol": "6EdeYFmrLT0HbvS4", "currencyType": "REAL", "decimals": 89, "namespace": "SSt3CyDgf6eFAiqS"}, "customParameters": {"kHi0BR2ElF6z6eJK": {}, "uOW61akRFizqxCmu": {}, "dSXivAL3n478mhb2": {}}, "extOrderNo": "I2yBJeCJghTrk68F", "extTxId": "WFzuLBdlrKjUbgZQ", "extUserId": "fw6Zys3mN8fIcC9C", "issuedAt": "1976-10-29T00:00:00Z", "metadata": {"harfqaoMsGyv1RuS": "NdycDssUeHiVDXzS", "J8kbFAyidbnXdMSw": "mkBkKC1h6h45u0wu", "h9pY0011jSmHFTtf": "M2mGUUpq3ix7Am7W"}, "namespace": "1fwJnV94BrMSP31w", "nonceStr": "AkVH75UcmNXK5Rqc", "paymentData": {"discountAmount": 70, "discountCode": "LjUr5z03wxB3E9hr", "subtotalPrice": 62, "tax": 97, "totalPrice": 10}, "paymentMethod": "jlPKDEYahnlLJaLC", "paymentMethodFee": 43, "paymentOrderNo": "JHNg6TvNGjwI4TbT", "paymentProvider": "STRIPE", "paymentProviderFee": 2, "paymentStationUrl": "BufUorJouduhCEJ5", "price": 78, "refundedTime": "1975-08-10T00:00:00Z", "salesTax": 75, "sandbox": true, "sku": "9gYHEV3wnTZTvYYf", "status": "AUTHORISE_FAILED", "statusReason": "ZFuV6L2AldoWWRN5", "subscriptionId": "wNYlFiliYmBrqrOc", "subtotalPrice": 30, "targetNamespace": "NIligBrOkBljwREN", "targetUserId": "jt04ZpyTTZG1LxLd", "tax": 51, "totalPrice": 91, "totalTax": 91, "txEndTime": "1982-07-18T00:00:00Z", "type": "w8NmPaBeryzX2hOP", "userId": "VVFqVqxjq1iG3TyS", "vat": 83}' \
    > test.out 2>&1
eval_tap $? 335 'ProcessUserSubscriptionNotification' test.out

#- 336 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'PQR0UJMr8ouccGH0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'B4LCe2h0iFCCZgFW' \
    --body '{"count": 39, "orderNo": "Jh8sn0bVWRkvmAem"}' \
    > test.out 2>&1
eval_tap $? 336 'AcquireUserTicket' test.out

#- 337 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'h8lioBR7xTXcEIFo' \
    > test.out 2>&1
eval_tap $? 337 'QueryUserCurrencyWallets' test.out

#- 338 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'd3lCzvjHzDHOrSJ1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vbB7LRHd96dGLgkf' \
    --body '{"allowOverdraft": true, "amount": 97, "balanceOrigin": "System", "balanceSource": "IAP_REVOCATION", "metadata": {"MuSjDHz0zPWMZQNN": {}, "P2JqQqhISTBT1Gof": {}, "v4SuaZ8yCB9TVZnu": {}}, "reason": "zgvAZJRm71EC3ENu"}' \
    > test.out 2>&1
eval_tap $? 338 'DebitUserWalletByCurrencyCode' test.out

#- 339 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'vD8OPsp5Z3ez84KV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'B7HeWPnVeFdy5ezl' \
    --limit '59' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 339 'ListUserCurrencyTransactions' test.out

#- 340 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'U6SGzkMpTL2wxobj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xAbagqEmXn6U2VeV' \
    --request '{"amount": 28, "debitBalanceSource": "DLC_REVOCATION", "metadata": {"QsvdXGlD40xxIyVw": {}, "Yjn6dlC9Kfh9gHul": {}, "oyce0cLJu4ljPWlC": {}}, "reason": "WTuGO8MnfOQu3wdT", "walletPlatform": "Playstation"}' \
    > test.out 2>&1
eval_tap $? 340 'CheckBalance' test.out

#- 341 CheckWallet
eval_tap 0 341 'CheckWallet # SKIP deprecated' test.out

#- 342 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'jIRtCfqDHSlo54zS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nRN0zGMworzym1z3' \
    --body '{"amount": 15, "expireAt": "1972-12-19T00:00:00Z", "metadata": {"etOic9AQOFWpdItL": {}, "BhvKJq9tWz9yui8a": {}, "6jOflFJlZEhz1QDe": {}}, "origin": "GooglePlay", "reason": "VvU5on065ApCkVN3", "source": "REFERRAL_BONUS"}' \
    > test.out 2>&1
eval_tap $? 342 'CreditUserWallet' test.out

#- 343 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'AOAOyL65cPaOZA8B' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8KcVWOX9n3YsjJe' \
    --request '{"amount": 48, "debitBalanceSource": "TRADE", "metadata": {"nFA9Umz3KPICya5F": {}, "k5TPaEbX29cV8v7M": {}, "XctihtxMnIr4b7jy": {}}, "reason": "fL3zMkklGCPISlsn", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 343 'DebitByWalletPlatform' test.out

#- 344 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'A6z0uSfNNpJUYzJx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nOyvqmswrToyBIQu' \
    --body '{"amount": 25, "metadata": {"UA7EKASk3USNLhOB": {}, "lxRBLgohp8ByTi2F": {}, "6AyUX8w77riPlPgJ": {}}, "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 344 'PayWithUserWallet' test.out

#- 345 GetUserWallet
eval_tap 0 345 'GetUserWallet # SKIP deprecated' test.out

#- 346 DebitUserWallet
eval_tap 0 346 'DebitUserWallet # SKIP deprecated' test.out

#- 347 DisableUserWallet
eval_tap 0 347 'DisableUserWallet # SKIP deprecated' test.out

#- 348 EnableUserWallet
eval_tap 0 348 'EnableUserWallet # SKIP deprecated' test.out

#- 349 ListUserWalletTransactions
eval_tap 0 349 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 350 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'v4rpqtzDaz0WUJlB' \
    > test.out 2>&1
eval_tap $? 350 'ListViews' test.out

#- 351 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CHzJ2v9K8c1zOlZg' \
    --body '{"displayOrder": 13, "localizations": {"pagfP0FfOMBOpeQT": {"description": "4zYIbU4i9mLyX46A", "localExt": {"lt08rrnG8y2ScXkw": {}, "jpAp82pGcxvXaG9L": {}, "zHpMS53jllopwirR": {}}, "longDescription": "o3A8WxnR0YaMsF3f", "title": "5KLtpTSsPMGDZTOw"}, "EP5Bhh0NStWIggmh": {"description": "fAzVdNYP7Ao1z7Fe", "localExt": {"JM2fWXGk7JObSHks": {}, "RkabpmvRsc7ZYvXC": {}, "T6m6mRZAlLBczJVe": {}}, "longDescription": "il7GbG1ISBCkcnpx", "title": "KUxLjmxhBS6YypRW"}, "7fNntaIEtDI6Mbhx": {"description": "kQdezbmf392ersoZ", "localExt": {"2KbMb5jal0ruZmBX": {}, "lGSp85q6fuGfo5wS": {}, "DHnyabk493I3pvHK": {}}, "longDescription": "DaWhTN1qyxpUzWIZ", "title": "WJTDzWguhujw1EoR"}}, "name": "58uCVldefonHJZAi"}' \
    > test.out 2>&1
eval_tap $? 351 'CreateView' test.out

#- 352 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'X4abmqqi90KTWwZk' \
    --storeId '0HGeJNaBjVdMB5kM' \
    > test.out 2>&1
eval_tap $? 352 'GetView' test.out

#- 353 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'zKycYrhr4FnNzdT4' \
    --storeId 'pWwIVXp9avUr6Iyd' \
    --body '{"displayOrder": 33, "localizations": {"gQWyZocvYfr0Rnl0": {"description": "2R1IVNnaK6KS71Xs", "localExt": {"1BphA9BXpKYgF9Ou": {}, "igDP0Vjmy7j2BrdC": {}, "Am3slCwaBqHpE55s": {}}, "longDescription": "jxBGijw0dQtZNonM", "title": "rPkzUe9SglAJGyZS"}, "0I8FevJiT98HUBp5": {"description": "6Q4WETxtGMs5tPKP", "localExt": {"uK0K4PiMDTR7Lxih": {}, "uOn57io0d9dG3yza": {}, "NbGeASX83SLiIbAP": {}}, "longDescription": "2qyUnHnfrEdDfY4T", "title": "Txu8goZgsX4RwfM4"}, "qnUdcQqZ9F1uivPo": {"description": "b0YZEuXQACDDQryN", "localExt": {"f9VGxbOeJe4n9eUl": {}, "BQZ2UGePWXbAyGiX": {}, "a9nUsHCVicuJ7onr": {}}, "longDescription": "UXVlB6xNel4Bxb9K", "title": "wFYqdhEVq3hbsApe"}}, "name": "ASfR0ljKxqZcLuhw"}' \
    > test.out 2>&1
eval_tap $? 353 'UpdateView' test.out

#- 354 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'NDvValv3bkoMXNzl' \
    --storeId '1ywEPiunixlEAHZz' \
    > test.out 2>&1
eval_tap $? 354 'DeleteView' test.out

#- 355 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 355 'GetWalletConfig' test.out

#- 356 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 356 'UpdateWalletConfig' test.out

#- 357 QueryWallets
eval_tap 0 357 'QueryWallets # SKIP deprecated' test.out

#- 358 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 39, "expireAt": "1993-05-01T00:00:00Z", "metadata": {"x5oPSkZFIV2feXnT": {}, "RlzAJy9oFOHB2KEs": {}, "IdtozVltBhoXE4wg": {}}, "origin": "Epic", "reason": "O6KwlJQlj9Ii2jAR", "source": "IAP_CHARGEBACK_REVERSED"}, "currencyCode": "Vr1CE1gu6cYuzC77", "userIds": ["J4irvZ9tktWLtDdl", "mVGK6iolEw6IIpDc", "9X5ijmtDGvd9ESdY"]}, {"creditRequest": {"amount": 81, "expireAt": "1973-05-25T00:00:00Z", "metadata": {"TkBWA44Qqsi5yOjv": {}, "l5sRN2ENn1RLi5iM": {}, "Pnbg7o1zYpqUsliP": {}}, "origin": "Playstation", "reason": "9JFwXG0EvoSHNC97", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "P47RcUIi2CoNj4EG", "userIds": ["2emxKQk8cBrt5E8k", "8YDChFi3zLvfQWC8", "8rzDZ08j6ICP75cm"]}, {"creditRequest": {"amount": 35, "expireAt": "1991-07-12T00:00:00Z", "metadata": {"qfmBv0XgJB6a7uyk": {}, "ADFpinFcH2ZMSYij": {}, "qEuMfuYFUS079tOp": {}}, "origin": "GooglePlay", "reason": "YM1XV0Op0damycnT", "source": "REFUND"}, "currencyCode": "KTz1gcE2XCwTkRUI", "userIds": ["qSgH5xIuBTYOdsvN", "xjqyrjDApeN5eAfR", "X6IFHNmB9mYBvtOw"]}]' \
    > test.out 2>&1
eval_tap $? 358 'BulkCredit' test.out

#- 359 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "yk52MQFkVVEf36S7", "request": {"allowOverdraft": true, "amount": 63, "balanceOrigin": "Xbox", "balanceSource": "DLC_REVOCATION", "metadata": {"gG48bk6PwH1tdEAJ": {}, "SqXA0Wv0zWGvkc6b": {}, "yp3mvyYT3GuaZVTx": {}}, "reason": "Blw1IWeXKFT4rfSb"}, "userIds": ["bSlDPGf9Fn32SJNP", "ZkEfkAcJTMS4pVRc", "CHIGfmCMTr9ACnI2"]}, {"currencyCode": "sMrEgl7ZR1HCkf2S", "request": {"allowOverdraft": true, "amount": 65, "balanceOrigin": "IOS", "balanceSource": "EXPIRATION", "metadata": {"a7yJ2d87XjA0ajvb": {}, "7JcGUFgp6LkyXpxJ": {}, "eFxhgTwyO51CUpcd": {}}, "reason": "xL0a9VDhrqWCTXOx"}, "userIds": ["QUpyFgZhNpOTE4to", "HwpagvERZI6Cqhck", "H57yr01N33p1Gha8"]}, {"currencyCode": "nhecNv2Tw6YKhVrY", "request": {"allowOverdraft": false, "amount": 80, "balanceOrigin": "Other", "balanceSource": "IAP_REVOCATION", "metadata": {"M1GqMkZ44UXgdBqt": {}, "JaRyDlP9qIZJ5Krx": {}, "6KkHagEugKJxkU8Y": {}}, "reason": "58COtTNjnNSikJDg"}, "userIds": ["lMeQprfgLGkHX1td", "BjKmCBXETZwqdzAX", "6ujKvq0CIa1YCK9P"]}]' \
    > test.out 2>&1
eval_tap $? 359 'BulkDebit' test.out

#- 360 GetWallet
eval_tap 0 360 'GetWallet # SKIP deprecated' test.out

#- 361 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey '28DikGk8cWiX44az' \
    --end 'SHcwicUVq2XPljTZ' \
    --start 'j5R0yZSVQ8SSeJ4q' \
    > test.out 2>&1
eval_tap $? 361 'SyncOrders' test.out

#- 362 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["y4PIKleuV271bwZ4", "niLSzQnv0C00dtNG", "GzbGYSYo9fY2EBZA"], "apiKey": "HQXc4Xcae7VKl0AR", "authoriseAsCapture": true, "blockedPaymentMethods": ["BNE2UbhNtH3yYg4Q", "nn2uhdw7C9Bx1LQO", "TCbAPLC3iqrkyJFO"], "clientKey": "VaewFcv9h31YxuZn", "dropInSettings": "oSesWpLUHjGaIcZN", "liveEndpointUrlPrefix": "28gH4Cd9xTdt2K1C", "merchantAccount": "zpQWslNGnLYUYR0y", "notificationHmacKey": "OvJhUjzcMtwINUlr", "notificationPassword": "hIpnlam2EefVopbp", "notificationUsername": "Phsana0uXG7GUTV1", "returnUrl": "BwgkLDj4pjVktyoN", "settings": "SsEHlzyd0Sarkhlt"}' \
    > test.out 2>&1
eval_tap $? 362 'TestAdyenConfig' test.out

#- 363 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "UxgbN5eElQNESFLD", "privateKey": "8hCc9onSNjbQEqFG", "publicKey": "wnDG8kz4kvEv6tNj", "returnUrl": "GRhrmRAxRGeIKGlC"}' \
    > test.out 2>&1
eval_tap $? 363 'TestAliPayConfig' test.out

#- 364 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "JmDXpjyvLSHB1y3k", "secretKey": "lHuAGnidOyGuS0OG"}' \
    > test.out 2>&1
eval_tap $? 364 'TestCheckoutConfig' test.out

#- 365 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '7ohiL2943ClrNhEd' \
    > test.out 2>&1
eval_tap $? 365 'DebugMatchedPaymentMerchantConfig' test.out

#- 366 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "xd24ZKfvMf1T5FzY", "webhookSecretKey": "Mf1jaCgZosntPzP1"}' \
    > test.out 2>&1
eval_tap $? 366 'TestNeonPayConfig' test.out

#- 367 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "vXXB92q150WEIetO", "clientSecret": "XMt37MXy7Fp7lUfQ", "returnUrl": "qXrqGadwvKlJFX1Z", "webHookId": "HV9yo9Ur1hfhmGEK"}' \
    > test.out 2>&1
eval_tap $? 367 'TestPayPalConfig' test.out

#- 368 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["uVUZdCacRGataPrc", "gTcA71dtqtSUN4zv", "BzGh3mhIDNuMBZeg"], "publishableKey": "HtB9uTCiiIoMZCjG", "secretKey": "iOZJpUf9RpcfEQn0", "webhookSecret": "O6D8PGQuazAypgWh"}' \
    > test.out 2>&1
eval_tap $? 368 'TestStripeConfig' test.out

#- 369 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "TED5YmPTBUkm2Fyv", "key": "dguCYVqFyIKh1YtT", "mchid": "Y4AejyQc5Dac7hSL", "returnUrl": "ldWx5DyniVESUgrR"}' \
    > test.out 2>&1
eval_tap $? 369 'TestWxPayConfig' test.out

#- 370 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "OrP1ip3jNG68DByf", "flowCompletionUrl": "2UMPtigq9zOQOcAq", "merchantId": 56, "projectId": 82, "projectSecretKey": "j0bXhOr9OHt6zx1i"}' \
    > test.out 2>&1
eval_tap $? 370 'TestXsollaConfig' test.out

#- 371 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id '2W3GY7tdh8hHlQyM' \
    > test.out 2>&1
eval_tap $? 371 'GetPaymentMerchantConfig1' test.out

#- 372 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'lgfkTsAThLyflAqq' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["AP4M78smYdyge6Dr", "oOywOxI4G6jZzoYI", "FAvYfT8XQw2EOq6B"], "apiKey": "FjmN4OqKGLRpNWzK", "authoriseAsCapture": true, "blockedPaymentMethods": ["pZvvmziSSiSpXeWO", "GayfRkQvoN06SpNO", "nuSksfm7hcIFdkdr"], "clientKey": "wAcK2lUda9h9Fgvf", "dropInSettings": "hiLEAkA7n6516ydo", "liveEndpointUrlPrefix": "RT1qZBrdTnGrwHeW", "merchantAccount": "oQXPFWFaKbDgrGkv", "notificationHmacKey": "8SVwLyS4VbHJvD0l", "notificationPassword": "L7aZUY9d1Idud8bj", "notificationUsername": "YeBVMr7zHYmRE4X3", "returnUrl": "6KUOdfEmoIYwSxxA", "settings": "sfwDMivWqHHGlnAn"}' \
    > test.out 2>&1
eval_tap $? 372 'UpdateAdyenConfig' test.out

#- 373 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'Eu6EKYceTEqYudHl' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 373 'TestAdyenConfigById' test.out

#- 374 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'A4AxeEIfUxJ2xMSN' \
    --sandbox  \
    --validate  \
    --body '{"appId": "NBxCeN3pGn46fGvo", "privateKey": "dt413MRdG8qAPiAN", "publicKey": "v2Ar8yXV6qf6v5Sg", "returnUrl": "cJPZPUh2nHQwpWi8"}' \
    > test.out 2>&1
eval_tap $? 374 'UpdateAliPayConfig' test.out

#- 375 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'HZ6C0VJ0fK2m6lQ5' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 375 'TestAliPayConfigById' test.out

#- 376 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'Ao8TITYiHSR2SEJh' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "1YDedZdNqkXPWZfT", "secretKey": "8ZfdKp9q4nXuK0tJ"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateCheckoutConfig' test.out

#- 377 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'AYror2XdtSCG7ZEx' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 377 'TestCheckoutConfigById' test.out

#- 378 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'OoIpWzacOvwUsnIb' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "QM3ZAtyEWKWoZRUL", "webhookSecretKey": "7wS3HaMTXAX6y0ST"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateNeonPayConfig' test.out

#- 379 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'TN2sBEijjjpvSzGk' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 379 'TestNeonPayConfigById' test.out

#- 380 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'ED0oweFYDBPyd1jJ' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "BxbrbuFay9PXgEQS", "clientSecret": "4871QSmsspn5sNfi", "returnUrl": "fK65tvaH9jwcO48p", "webHookId": "thyYpBJDHIIxTIGI"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdatePayPalConfig' test.out

#- 381 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '5EssYllIqjJzuQ8G' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 381 'TestPayPalConfigById' test.out

#- 382 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'glVgxjOGQGlHm8VT' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["N56tJKwD8O07L9GG", "1uenDihceaLdgPZI", "0fKW8LeQxItaK6s3"], "publishableKey": "Hha69MgxjGJx62mk", "secretKey": "fVlu4bGB1pyk0Ppx", "webhookSecret": "XZDy5Pmbu7RrD9a5"}' \
    > test.out 2>&1
eval_tap $? 382 'UpdateStripeConfig' test.out

#- 383 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'mdlXTCL467xHbAiD' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 383 'TestStripeConfigById' test.out

#- 384 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id '3Pr3mXZO1PnbSlfV' \
    --validate  \
    --body '{"appId": "RlAI8F2f3mEv09kA", "key": "A5hnQtd4bcivHGIE", "mchid": "plRpcHDWcIoJ45L0", "returnUrl": "Ze3YamxKDSZTl4Ui"}' \
    > test.out 2>&1
eval_tap $? 384 'UpdateWxPayConfig' test.out

#- 385 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'JSCbG4UmG3TkMTzO' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 385 'UpdateWxPayConfigCert' test.out

#- 386 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'cBIciiKwRs1E7sH2' \
    > test.out 2>&1
eval_tap $? 386 'TestWxPayConfigById' test.out

#- 387 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'G9MJ6F7Rr7O15jqe' \
    --validate  \
    --body '{"apiKey": "KssQpme6eyM48tE7", "flowCompletionUrl": "eJRsXNeveQXqnFRY", "merchantId": 25, "projectId": 62, "projectSecretKey": "SvPLeQZIpKFXgnsx"}' \
    > test.out 2>&1
eval_tap $? 387 'UpdateXsollaConfig' test.out

#- 388 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'x3c2bUsO7FP8RmOs' \
    > test.out 2>&1
eval_tap $? 388 'TestXsollaConfigById' test.out

#- 389 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'tZAGDgiVsV2OttwJ' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 389 'UpdateXsollaUIConfig' test.out

#- 390 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '85' \
    --namespace "$AB_NAMESPACE" \
    --offset '78' \
    --region 'DIJ5hFQHumFvPKqu' \
    > test.out 2>&1
eval_tap $? 390 'QueryPaymentProviderConfig' test.out

#- 391 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "NEONPAY", "namespace": "GyieBsRUduW5lxSl", "region": "orWEGN5bPGSOSiiI", "sandboxTaxJarApiToken": "trSrEJMBAIwTLkrM", "specials": ["WXPAY", "ALIPAY", "XSOLLA"], "taxJarApiToken": "nZ3EZp6wSAufwYir", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 391 'CreatePaymentProviderConfig' test.out

#- 392 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 392 'GetAggregatePaymentProviders' test.out

#- 393 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'lwvPKd925u3fFLV0' \
    > test.out 2>&1
eval_tap $? 393 'DebugMatchedPaymentProviderConfig' test.out

#- 394 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 394 'GetSpecialPaymentProviders' test.out

#- 395 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'YeMrVaYSTRYGFzgL' \
    --body '{"aggregate": "CHECKOUT", "namespace": "7gEypQf2Pn9A4gcb", "region": "DJ0LmdnOPkIT1C6K", "sandboxTaxJarApiToken": "GTpA7JZ6xullPROS", "specials": ["ALIPAY", "CHECKOUT", "ADYEN"], "taxJarApiToken": "W9zcxmgNfTHu3vkZ", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 395 'UpdatePaymentProviderConfig' test.out

#- 396 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 's0sibQNBz81zRPnt' \
    > test.out 2>&1
eval_tap $? 396 'DeletePaymentProviderConfig' test.out

#- 397 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 397 'GetPaymentTaxConfig' test.out

#- 398 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "xpgi7tXIcNEcGJjO", "taxJarApiToken": "CXpuix5vnPeTu9ev", "taxJarEnabled": false, "taxJarProductCodesMapping": {"05rjISy4B0X9AJdk": "T7UYCV8agvwOI2Ll", "OQNRN132RdgwMXv9": "olKpRyWQim3qlART", "9mPPmYUvlkBGPJFa": "FzkABC8zWMcYW5iR"}}' \
    > test.out 2>&1
eval_tap $? 398 'UpdatePaymentTaxConfig' test.out

#- 399 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'rw32FRg8y4rOuj7J' \
    --end '6ijJbcycXmBcrJLb' \
    --start '7labyotifVk9Kyqc' \
    > test.out 2>&1
eval_tap $? 399 'SyncPaymentOrders' test.out

#- 400 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'eGv0CEDTVSjINYeK' \
    --storeId 'LowG7UQB9pXzuCK5' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetRootCategories' test.out

#- 401 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'qd2m8A5axixm9X9T' \
    --storeId 'XNhN8y1PVriIyv9k' \
    > test.out 2>&1
eval_tap $? 401 'DownloadCategories' test.out

#- 402 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'juiAGiXx47etMikL' \
    --namespace "$AB_NAMESPACE" \
    --language 'FggYDc2FMbzZoeKa' \
    --storeId 'gnKf2Yifzvr9OqTs' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetCategory' test.out

#- 403 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'InGzHFpFXYJtHtqw' \
    --namespace "$AB_NAMESPACE" \
    --language 'oIwQBeIALI8JNIII' \
    --storeId '4jrzrPsuMziNM8AB' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetChildCategories' test.out

#- 404 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '7RRxiZH3ngnitURd' \
    --namespace "$AB_NAMESPACE" \
    --language 'MjZLYCaeklQcFY1Q' \
    --storeId 'Ik1h5EKvMGd6hQ2m' \
    > test.out 2>&1
eval_tap $? 404 'PublicGetDescendantCategories' test.out

#- 405 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 405 'PublicListCurrencies' test.out

#- 406 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 406 'GeDLCDurableRewardShortMap' test.out

#- 407 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 407 'GetAppleConfigVersion' test.out

#- 408 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    > test.out 2>&1
eval_tap $? 408 'GetIAPItemMapping' test.out

#- 409 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'o3aVOGARFDJcGWy8' \
    --region '26ilCxAxQUM5DyrP' \
    --storeId 'fBmpZIzSFUZqVR5F' \
    --appId 'WGfH66eFCMTsLA8v' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItemByAppId' test.out

#- 410 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DEMO' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'VvrIAEehUV0jsjAy' \
    --categoryPath 'VgxS54NNs3XdhMbQ' \
    --features 'X9D1znEWw9p7g4Us' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'CTKDh5n9yc34xF8q' \
    --limit '64' \
    --offset '18' \
    --region 'llM1LTrl4MP3Nl4T' \
    --sortBy 'name:desc,createdAt:desc,displayOrder' \
    --storeId 'AQWuBJwxObZqMGxh' \
    --tags 'ffy9cHrLYfftad99' \
    > test.out 2>&1
eval_tap $? 410 'PublicQueryItems' test.out

#- 411 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'JDcnn7f2d8SOWP2d' \
    --region 'w6Uy88WpQalG38VO' \
    --storeId 'o82aLD9jUjuDITji' \
    --sku 'fWRbmtK7MTxcCWnM' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetItemBySku' test.out

#- 412 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'iCLsjroKHPApA8Gs' \
    --storeId 'GwyocvY9NePjLJQJ' \
    --itemIds 'XwUApJWohXn01RB7' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetEstimatedPrice' test.out

#- 413 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'pu7BaONXyE5fIDbs' \
    --region 'Mi48xOYVvEcEm53B' \
    --storeId 'YMBacQBIuDVs7U0A' \
    --itemIds 'JtWPRteszMTd0R5F' \
    > test.out 2>&1
eval_tap $? 413 'PublicBulkGetItems' test.out

#- 414 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["srf9xbVfgvG617Gm", "xzClkR3M6Twpwq3n", "LwxnJKjOo9fvfXF1"]}' \
    > test.out 2>&1
eval_tap $? 414 'PublicValidateItemPurchaseCondition' test.out

#- 415 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'EXTENSION' \
    --limit '64' \
    --offset '17' \
    --region 'JlDDJ7z4Pb5jyGID' \
    --storeId '39Ung1D57FjYKlJi' \
    --keyword 'RIvhej77OSPwdzMS' \
    --language 'mrSvQdsAdTUGpd8K' \
    > test.out 2>&1
eval_tap $? 415 'PublicSearchItems' test.out

#- 416 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'FrXKFA2gdjQCYoE8' \
    --namespace "$AB_NAMESPACE" \
    --language 'b0CZetLfpFNyp737' \
    --region '5rhOmR4zFjoJZVKZ' \
    --storeId 'jOD2ePKAKYjJMVnY' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetApp' test.out

#- 417 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'j2yKqavWpydepM3a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 417 'PublicGetItemDynamicData' test.out

#- 418 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'p069B9Okr0xJ5XRZ' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'VoxPGOLVBIlFgTAs' \
    --populateBundle  \
    --region 'Xgqx3mfB5ZwV25N7' \
    --storeId 'NAvZdGuyYEYZE3Ka' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetItem' test.out

#- 419 GetPaymentCustomization
eval_tap 0 419 'GetPaymentCustomization # SKIP deprecated' test.out

#- 420 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "GSdhEGKcp6g1A8O9", "successUrl": "N9cbYBK6XOBDpR7S"}, "paymentOrderNo": "H93AE1Toj5vygVvL", "paymentProvider": "NEONPAY", "returnUrl": "JvdsGpmmUeMikW3s", "ui": "54zffAL2DZ7gBhy7", "zipCode": "7iRVFfFvWenMNV00"}' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetPaymentUrl' test.out

#- 421 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'KVuLF9WDnGO3bpQW' \
    > test.out 2>&1
eval_tap $? 421 'PublicGetPaymentMethods' test.out

#- 422 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'mnS52ZuuuI7F1xpV' \
    > test.out 2>&1
eval_tap $? 422 'PublicGetUnpaidPaymentOrder' test.out

#- 423 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'rcoXzSOEGEDYfiGP' \
    --paymentProvider 'NEONPAY' \
    --zipCode '6ksxLYGkOLgReff5' \
    --body '{"token": "IHxLJIemNHbzgAFj"}' \
    > test.out 2>&1
eval_tap $? 423 'Pay' test.out

#- 424 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'tjC7suvgIUkB2PAG' \
    > test.out 2>&1
eval_tap $? 424 'PublicCheckPaymentOrderPaidStatus' test.out

#- 425 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'CHECKOUT' \
    --region 'qOrkdlZB246OY0dP' \
    > test.out 2>&1
eval_tap $? 425 'GetPaymentPublicConfig' test.out

#- 426 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'VMd2WDUVEQTpfyAI' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetQRCode' test.out

#- 427 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'oF7qsANBbEKQrgoc' \
    --foreinginvoice 'pjGNenRlDORLvP7y' \
    --invoiceId 'nTuXzafCqlMrrVIe' \
    --payload 'hVCf3AwIzUdQ6sTr' \
    --redirectResult 'Ug7Z0SLrZraV3NLB' \
    --resultCode 'USrFnzE6yR1wLTgj' \
    --sessionId 'snB2LFVrZRrOntm2' \
    --status 'KjbfCOuW3dBmFwUO' \
    --token '7Y0xhMLwxgRpTSUp' \
    --type 'pvO3QG68KeD7QJQE' \
    --userId 'EVDAg045BvtPd7ib' \
    --orderNo 'BA3sd51mDooH53vi' \
    --paymentOrderNo 'bq3Qcrtt8L5dIebs' \
    --paymentProvider 'STRIPE' \
    --returnUrl '4jIt01gzH17IcfJy' \
    > test.out 2>&1
eval_tap $? 427 'PublicNormalizePaymentReturnUrl' test.out

#- 428 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'GulmByN5rcDA3Wcv' \
    --paymentOrderNo '9ouALjgLZZzLU9w8' \
    --paymentProvider 'NEONPAY' \
    > test.out 2>&1
eval_tap $? 428 'GetPaymentTaxValue' test.out

#- 429 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'JRIzIgJKg9y86Bgn' \
    > test.out 2>&1
eval_tap $? 429 'GetRewardByCode' test.out

#- 430 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'BQtm5AilVhASFlYM' \
    --limit '98' \
    --offset '79' \
    --sortBy 'rewardCode:desc,namespace:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 430 'QueryRewards1' test.out

#- 431 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'E2dAeC7pF73y9eAL' \
    > test.out 2>&1
eval_tap $? 431 'GetReward1' test.out

#- 432 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 432 'PublicListStores' test.out

#- 433 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'KWinUJ7bAuUJ7Fxg,5LijlQTVq8Bh1p0N,CKWNkLU5ty3uQa7F' \
    --itemIds 'l3ZhSMLtrwnjTJVD,lh112byTYCDBnAvf,8JpFuJSZistM7554' \
    --skus '4PDlVK8taScpV0Nt,CxDDz5rxt6LflBJj,okLAaL4oAF2lqx8y' \
    > test.out 2>&1
eval_tap $? 433 'PublicExistsAnyMyActiveEntitlement' test.out

#- 434 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'neWKrOy4xcg30BqC' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 435 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --itemId 'W7g7hiwumJTI3jlZ' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 436 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'OPTIONBOX' \
    --sku 'tbyUDDSJSV8pzl1l' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 437 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'fIR7jnetIJPGObyW,CLyFPHaxkKxEDvSo,i2X9SygvMG8QAaWU' \
    --itemIds 'hIguMvKDOrx0wQXK,EroyKz2reP63EVHT,72VuhoGP2IFXGU5h' \
    --skus 'ujEfCMt95DEjxqhg,YqmMqIdlRrQmuILk,eRUafUDP5b6BWfm7' \
    > test.out 2>&1
eval_tap $? 437 'PublicGetEntitlementOwnershipToken' test.out

#- 438 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "cYCpDIJG42ILhUoC", "language": "rZ_PU", "region": "cC5Ea29JhfFGN964"}' \
    > test.out 2>&1
eval_tap $? 438 'SyncTwitchDropsEntitlement' test.out

#- 439 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'J8WOgsAj2Rmf1DXv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 439 'PublicGetMyWallet' test.out

#- 440 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'AIkzTRNRVyeEGu1I' \
    --body '{"epicGamesJwtToken": "COCmLAmcaEFBKgy9"}' \
    > test.out 2>&1
eval_tap $? 440 'SyncEpicGameDLC' test.out

#- 441 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '2LYqtQcDN7OMCehk' \
    > test.out 2>&1
eval_tap $? 441 'SyncOculusDLC' test.out

#- 442 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '42acy8wsWaPyppR3' \
    --body '{"serviceLabel": 53}' \
    > test.out 2>&1
eval_tap $? 442 'PublicSyncPsnDlcInventory' test.out

#- 443 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'X7HC2haQwVWONEpA' \
    --body '{"serviceLabels": [9, 35, 86]}' \
    > test.out 2>&1
eval_tap $? 443 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 444 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '6HSiXVzrG4EdKn8e' \
    --body '{"appId": "ypTzI497DG0ZNoJv", "steamId": "vi4Ys50iE7IjZoDz"}' \
    > test.out 2>&1
eval_tap $? 444 'SyncSteamDLC' test.out

#- 445 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'MmMgoMxZZ9AutWDf' \
    --body '{"xstsToken": "VOINhql9CdDX4xiH"}' \
    > test.out 2>&1
eval_tap $? 445 'SyncXboxDLC' test.out

#- 446 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'pdfKH35RWUUVEHCB' \
    --appType 'GAME' \
    --entitlementClazz 'APP' \
    --entitlementName 'zF6oLIrAwjAsgo51' \
    --features 'XHJBG2PmyeFaBiT3,SyLHXZSyfjukWmkf,kiF2GZPuyWBVH66J' \
    --itemId 'U1IICVNNRV4lBToT,cn1l44ebrKEKdeo7,79KG5yCz9jVs1lYK' \
    --limit '45' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserEntitlements' test.out

#- 447 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PJ871nV5ALS7cneN' \
    --appId 'LItUJgh74tyxkTR8' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserAppEntitlementByAppId' test.out

#- 448 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZCVJtkxjBJrNeQRs' \
    --limit '33' \
    --offset '22' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 448 'PublicQueryUserEntitlementsByAppType' test.out

#- 449 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'kKK2qxqzy4KSA5Ut' \
    --availablePlatformOnly  \
    --ids 'SXWjANSWIT9TLnuM,LNJAEk3A6A6rYiIu,8eLdWykhBxLFnKnS' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlementsByIds' test.out

#- 450 PublicGetUserEntitlementByItemId
eval_tap 0 450 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 451 PublicGetUserEntitlementBySku
eval_tap 0 451 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 452 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'YC9yyBYepIqtrikd' \
    --endDate 'AbdOT6iSRdEg8NYu' \
    --entitlementClazz 'APP' \
    --limit '13' \
    --offset '10' \
    --startDate 'q5sJVzaKGDOULJbj' \
    > test.out 2>&1
eval_tap $? 452 'PublicUserEntitlementHistory' test.out

#- 453 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'HphqjHGGAhfWaXqk' \
    --appIds 'A5fuVYOsMFo9tnqa,4LEWGg1r4nW4pBcP,PaiaM1og5rxUjGPK' \
    --itemIds 'KLMoAy1stmxPFz0i,1IK3QzkcRwFPpXGl,KR9ss8b8udl6fLkx' \
    --skus 'FnAqyvjBy0NXg7zd,6SFpkV7cAICgWFJZ,GnNa5yOM68r4W1fD' \
    > test.out 2>&1
eval_tap $? 453 'PublicExistsAnyUserActiveEntitlement' test.out

#- 454 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZL80oPQ0s7QhC8hg' \
    --appId 'SgytNEojK3YgWH9l' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 455 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '7rv6XUSINd4keCei' \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId '6giNKzeFnlgGRgYK' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 456 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '3SeYvULYNIhs5PZG' \
    --ids 'TJmgofq7nlF5Ch8J,2Qs990APOU4hcdwl,nsTap2RJpHtncLyw' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 457 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'P3WlLmNdQGk6vneH' \
    --entitlementClazz 'CODE' \
    --sku 'exseo2e6BCNJTTRI' \
    > test.out 2>&1
eval_tap $? 457 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 458 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'HDKdVfOUr14yZH00' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n8MsRjaB8iurBWW5' \
    > test.out 2>&1
eval_tap $? 458 'PublicGetUserEntitlement' test.out

#- 459 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'jSJi0seeGJIqnatM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E8GnNWfAY1yY6D1E' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["yhjZSeDCKT4ilZB8", "apDTR3aL9sunWp7V", "1s8LmXm0FaJMIjgz"], "requestId": "U02nZWwBdEFpfcca", "useCount": 43}' \
    > test.out 2>&1
eval_tap $? 459 'PublicConsumeUserEntitlement' test.out

#- 460 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'tL8YKMrUBL6dDTVw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PIt1hrg2mhbI0NDs' \
    --body '{"requestId": "hb7ZzQuBPyNi1GhZ", "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 460 'PublicSellUserEntitlement' test.out

#- 461 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'GwbqOB4mD3E7AFHq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lTTkL8cmpA0sZ0tg' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 89}' \
    > test.out 2>&1
eval_tap $? 461 'PublicSplitUserEntitlement' test.out

#- 462 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '4zFOvdRTpGmBUjfE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U9vL8H96tuVfQwYI' \
    --body '{"entitlementId": "qDWqbPmwQw8J7na1", "metadata": {"operationSource": "INVENTORY"}, "useCount": 83}' \
    > test.out 2>&1
eval_tap $? 462 'PublicTransferUserEntitlement' test.out

#- 463 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '3cIxOI33nt54i5hd' \
    --body '{"code": "AezedcppbujZh1fY", "language": "gz", "region": "9Rz3HVP2Y9WqSRiw"}' \
    > test.out 2>&1
eval_tap $? 463 'PublicRedeemCode' test.out

#- 464 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'V3UZg0UJLPMkeUwa' \
    --body '{"excludeOldTransactions": true, "language": "AYdm-rFet-cN", "productId": "fdmyi4kQnOFbBtvB", "receiptData": "w81hUgtONCIoZ2rk", "region": "omSj52mAIMo6EW9Q", "transactionId": "hzU8FwQtZpfUoyoi"}' \
    > test.out 2>&1
eval_tap $? 464 'PublicFulfillAppleIAPItem' test.out

#- 465 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'UjmqOyQ7ammFgHpr' \
    --body '{"epicGamesJwtToken": "dM9viFWmezrQOWH0"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncEpicGamesInventory' test.out

#- 466 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '3zyr7kRbC31YMJfR' \
    --body '{"autoAck": false, "autoConsume": false, "language": "jGD_TowE", "orderId": "OFBDA3gvCRfoBijp", "packageName": "bMblGWnp94a6GKY0", "productId": "BrHiWs0B0RhxQtgV", "purchaseTime": 14, "purchaseToken": "TJUzwXJFaWW3JVdY", "region": "pfHOYoLva2c4JscE", "subscriptionPurchase": true}' \
    > test.out 2>&1
eval_tap $? 466 'PublicFulfillGoogleIAPItem' test.out

#- 467 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'fBFZXcSXpU81S5H9' \
    --body '{"skus": ["XsZyvZOFJ5RrFZYc", "wfQ1Q2BbcjSpv6Nt", "1oz4tdgfKu4bmK8k"]}' \
    > test.out 2>&1
eval_tap $? 467 'SyncOculusSubscriptions' test.out

#- 468 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'OKcEoCRjQJlPY3p4' \
    > test.out 2>&1
eval_tap $? 468 'SyncOculusConsumableEntitlements' test.out

#- 469 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId '2OS9iGNElTpMlvRD' \
    --body '{"currencyCode": "ZSIuM0OXOHPluvsr", "price": 0.39219581694889694, "productId": "8AKSZxOhUhl3Y0Es", "serviceLabel": 15}' \
    > test.out 2>&1
eval_tap $? 469 'PublicReconcilePlayStationStore' test.out

#- 470 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'arWP4nrJ5fNESRVG' \
    --body '{"currencyCode": "eswvkzLNIITUJGj5", "price": 0.505081346421545, "productId": "YaSgewLWHcBxz5Lp", "serviceLabels": [8, 21, 29]}' \
    > test.out 2>&1
eval_tap $? 470 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 471 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'HpV8E1xQZLa7Kw77' \
    --body '{"appId": "UpCxNyx1jjdxNePP", "currencyCode": "AJ6Z9UzqIhZZiK0Q", "language": "bhp_XMyL", "price": 0.7690781013371633, "productId": "RNOF1Bg6OHZzvdZH", "region": "oIm4tKNhPjNIQGFx", "steamId": "GwgnSiZtChE0uof7"}' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamInventory' test.out

#- 472 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '7AAPI5tdPeFz9pGY' \
    > test.out 2>&1
eval_tap $? 472 'SyncSteamAbnormalTransaction' test.out

#- 473 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'sLNEGrfy9qHKufJf' \
    --body '{"orderId": "k0MeG3qYJr6PuCVK"}' \
    > test.out 2>&1
eval_tap $? 473 'SyncSteamIAPByTransaction' test.out

#- 474 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'OCULUS' \
    --userId 'JckSRbu7hgmUm7RV' \
    --activeOnly  \
    --groupId 'CUREDdoGatGQ1SeO' \
    --limit '41' \
    --offset '38' \
    --productId 'PWPlkxeotrNakKGv' \
    > test.out 2>&1
eval_tap $? 474 'PublicQueryUserThirdPartySubscription' test.out

#- 475 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OSvpmZZdlNXdx2kW' \
    --body '{"gameId": "mSqodNZgfQyDVVkk", "language": "yIK", "region": "thvd3jzMDAf40gKS"}' \
    > test.out 2>&1
eval_tap $? 475 'SyncTwitchDropsEntitlement1' test.out

#- 476 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'izvmxts5HSQvRAPG' \
    --body '{"currencyCode": "9JoVSLrbs5niXkjp", "price": 0.16434533656722727, "productId": "OgRCC7qfz5jV7NTR", "xstsToken": "Yld9FJJ10goNq8uq"}' \
    > test.out 2>&1
eval_tap $? 476 'SyncXboxInventory' test.out

#- 477 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '79Du28SRRAMaQFEz' \
    --discounted  \
    --itemId 'ppeticckSUon7awf' \
    --limit '30' \
    --offset '88' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserOrders' test.out

#- 478 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'QtC927GneBM8Lvzg' \
    --body '{"currencyCode": "yIVzGFBLJ5vbC9Nf", "discountCodes": ["LTFJGOzAIAqpmkDd", "FSs4s7u1VUuLmeny", "xTQVkEg5wouUKa35"], "discountedPrice": 26, "ext": {"7aww2TANW1Or7TvL": {}, "oL0wwHoRMNexBOro": {}, "n8wIdUbp7xVMKfbA": {}}, "itemId": "JfW4iMIC52NUedhh", "language": "Xo-OnQj_647", "price": 86, "quantity": 25, "region": "DWHcqfYp2EFxEaEH", "returnUrl": "CGtg812NQb5Glh8s", "sectionId": "rTlTj61WdV2XUo1B"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicCreateUserOrder' test.out

#- 479 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'O1rE7E12Fapao5jo' \
    --body '{"currencyCode": "9nJoKEb8tHmFwLGa", "discountCodes": ["n2SrKckNxLWH6rjh", "Eo1xBuRSv6VizgtO", "RL9uxoV5Oe8ktleP"], "discountedPrice": 24, "itemId": "Zy9cQ6B074dTJZqe", "price": 84, "quantity": 24}' \
    > test.out 2>&1
eval_tap $? 479 'PublicPreviewOrderPrice' test.out

#- 480 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'qXYyJUAlKlTwdJEP' \
    --userId 'oemVtmVXTs3tCu4F' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserOrder' test.out

#- 481 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '9IgDT2tq2V2lMzfI' \
    --userId 'QHCZ90DqQgP6ynrQ' \
    > test.out 2>&1
eval_tap $? 481 'PublicCancelUserOrder' test.out

#- 482 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'jYH0N2loTnRa0KiQ' \
    --userId 'WPxd1gqlwx9CE4Wc' \
    > test.out 2>&1
eval_tap $? 482 'PublicGetUserOrderHistories' test.out

#- 483 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'smYtCkIgcwiDWQFg' \
    --userId 'hmIi6fphDw3p9QWq' \
    > test.out 2>&1
eval_tap $? 483 'PublicDownloadUserOrderReceipt' test.out

#- 484 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'wTF2pOJsY86xAf5y' \
    > test.out 2>&1
eval_tap $? 484 'PublicGetPaymentAccounts' test.out

#- 485 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id '1iy01FkEEXlKiTID' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'JdCrwkz0nw2oxKye' \
    > test.out 2>&1
eval_tap $? 485 'PublicDeletePaymentAccount' test.out

#- 486 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId '8jZqj7k0YiLqOUSB' \
    --autoCalcEstimatedPrice  \
    --language 'uwR388REDRuYBnWi' \
    --region 'EsOnDfIAN04f5kSO' \
    --storeId 'Nmw1BDqqSctLL4Wf' \
    --viewId 'Gq8JCDnwGWgccuzu' \
    > test.out 2>&1
eval_tap $? 486 'PublicListActiveSections' test.out

#- 487 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'c6QDRMGdBPbUyHTY' \
    --chargeStatus 'RECURRING_CHARGING' \
    --itemId '8CGKXGon2ecc65YA' \
    --limit '64' \
    --offset '57' \
    --sku 'LweD9Z7U2lNkorrw' \
    --status 'INIT' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 487 'PublicQueryUserSubscriptions' test.out

#- 488 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '3rNhDepQum4Dj7pR' \
    --body '{"currencyCode": "05RTGXGRkYXifTd5", "itemId": "nAOF9VV7JgCOm4wL", "language": "hei", "region": "4zTTYI6O8coYDWUf", "returnUrl": "cL1qsegBsrNqeW5B", "source": "xVe8iW7sGELnMdXR"}' \
    > test.out 2>&1
eval_tap $? 488 'PublicSubscribeSubscription' test.out

#- 489 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'qdGPzxXvZPtrhjeV' \
    --itemId 'BnTrsYihhgbeAZoF' \
    > test.out 2>&1
eval_tap $? 489 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 490 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ncMUdmf8hD3nL1sa' \
    --userId 'QxLYrz08jh6Tyq7W' \
    > test.out 2>&1
eval_tap $? 490 'PublicGetUserSubscription' test.out

#- 491 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'UilXgtf5UctyV3aS' \
    --userId 'w4twReM5DcHde3fk' \
    > test.out 2>&1
eval_tap $? 491 'PublicChangeSubscriptionBillingAccount' test.out

#- 492 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Hf7tH8WTOTeBOcYh' \
    --userId 'f6nGCnPjiIbJifs0' \
    --body '{"immediate": false, "reason": "krQ99ecmenxguw5b"}' \
    > test.out 2>&1
eval_tap $? 492 'PublicCancelSubscription' test.out

#- 493 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'O8Vh4JaKYAsoMlLJ' \
    --userId 'GMl5xFgLj4mCShMF' \
    --excludeFree  \
    --limit '23' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 493 'PublicGetUserSubscriptionBillingHistories' test.out

#- 494 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'brRGjoBQ45Za4JR4' \
    --language 'S3iac6vLeoIULJlW' \
    --storeId 'XmQFlef1tSHJf6sV' \
    > test.out 2>&1
eval_tap $? 494 'PublicListViews' test.out

#- 495 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'pwAAKKqmTy0ZSyJ7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IIUXlBlZMQeSnOg5' \
    > test.out 2>&1
eval_tap $? 495 'PublicGetWallet' test.out

#- 496 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'gf1SwrbpmoF4DvNA' \
    --namespace "$AB_NAMESPACE" \
    --userId '1wo9IAxV5C71gTw8' \
    --limit '56' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 496 'PublicListUserWalletTransactions' test.out

#- 497 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 497 'PublicGetMyDLCContent' test.out

#- 498 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime '2EhOlnsuDnkuOJek' \
    --limit '3' \
    --offset '94' \
    --startTime 'O0sk7o1z37uuqLDQ' \
    --state 'REVOKED' \
    --transactionId '2kYfBqeQxos58kVk' \
    --userId '7F1KKOfFFLvER3xq' \
    > test.out 2>&1
eval_tap $? 498 'QueryFulfillments' test.out

#- 499 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate '6IpbGquPnIPwR1Bi' \
    --baseAppId 'nZ4ULwAKO8n42Uux' \
    --categoryPath 'EyfzZJsZd9sB6CV9' \
    --features 'KiWkbdpGqWQIPK6m' \
    --includeSubCategoryItem  \
    --itemName 'VytM5mBRT39gKYLk' \
    --itemStatus 'ACTIVE' \
    --itemType 'MEDIA,SUBSCRIPTION,COINS' \
    --limit '92' \
    --offset '20' \
    --region 'QnphnvAWBSOr7zlj' \
    --sectionExclusive  \
    --sortBy 'displayOrder,displayOrder:asc' \
    --storeId 'yhKkD7wAHMrv8zAB' \
    --tags 'DhYAVxvs3ugNvvgI' \
    --targetNamespace '2k1P9nQxzj3AnmpW' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 499 'QueryItemsV2' test.out

#- 500 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fje5cAtTDvwFHcoO' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 500 'ImportStore1' test.out

#- 501 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Di5oF1pccdjjZpFn' \
    --body '{"itemIds": ["VLb7xerpjVPfktNn", "l8UYH5kesuOtYHLq", "cdy05YrqdFn8sQ7y"]}' \
    > test.out 2>&1
eval_tap $? 501 'ExportStore1' test.out

#- 502 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8xLKyBfGLHEAKhp' \
    --body '{"entitlementCollectionId": "612Y2ncRf7tEGzYq", "entitlementOrigin": "Other", "metadata": {"oHm6EtyXqQbKWMJ0": {}, "aODiWn6bPmSa85Ri": {}, "u1alaVEhjJZbwMHk": {}}, "origin": "System", "rewards": [{"currency": {"currencyCode": "NqKvoYKio4M51vua", "namespace": "FyqjQsTGmzItJIOk"}, "item": {"itemId": "EIRsSWOV8LyivYbM", "itemName": "G9LXPbBh2E3wFchP", "itemSku": "3zTymfVfny2M0KsS", "itemType": "08cY3fjI1YTT3qUM"}, "quantity": 7, "type": "ITEM"}, {"currency": {"currencyCode": "0U73RjVeYSM479gn", "namespace": "62lizsWGrtIgVPb7"}, "item": {"itemId": "hoo8YkNPW8mWOJGt", "itemName": "dXJGDsxRAR3NObYp", "itemSku": "43YXMHqWeVjnOURx", "itemType": "GvOhz9s7ktWkJDaH"}, "quantity": 12, "type": "CURRENCY"}, {"currency": {"currencyCode": "yQsMBQAdOfrtHWyG", "namespace": "g5TU3INkMgjsnP8i"}, "item": {"itemId": "tevmjTJjj5tfFQv3", "itemName": "84ri6A7z0hsW0IHI", "itemSku": "YvJ7PPgVaFwGhl5z", "itemType": "qkzEu41hVfVC7eLV"}, "quantity": 99, "type": "CURRENCY"}], "source": "PROMOTION", "transactionId": "0GjYReIZaDC2Au2b"}' \
    > test.out 2>&1
eval_tap $? 502 'FulfillRewardsV2' test.out

#- 503 FulfillItems
eval_tap 0 503 'FulfillItems # SKIP deprecated' test.out

#- 504 RetryFulfillItems
eval_tap 0 504 'RetryFulfillItems # SKIP deprecated' test.out

#- 505 RevokeItems
eval_tap 0 505 'RevokeItems # SKIP deprecated' test.out

#- 506 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EpymbJ4dPJmkdvyu' \
    --body '{"transactionId": "DHFFstLhZzletCqa"}' \
    > test.out 2>&1
eval_tap $? 506 'V2PublicFulfillAppleIAPItem' test.out

#- 507 BulkFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform bulkFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3lJMQ1sGlfqjDBzO' \
    --body '[{"items": [{"duration": 19, "endDate": "1974-11-21T00:00:00Z", "entitlementCollectionId": "2M5JiwtMOfDfoMgU", "entitlementOrigin": "GooglePlay", "itemId": "yFBTPfnmfN5E20OR", "itemSku": "MCVBTrkvObsiHQgt", "language": "7OfL6AcBPjUYURB3", "metadata": {"Rsrc0qvV8Gq1cw3y": {}, "tGWVKPoA1aKRZM1O": {}, "t0PWppB2H0G8Xko9": {}}, "orderNo": "l5J0IOZmnpzwHhig", "origin": "Epic", "quantity": 68, "region": "6vdgfrNiGrH0hDjH", "source": "IAP", "startDate": "1988-05-15T00:00:00Z", "storeId": "pfINzNjk5V8T9pQj"}, {"duration": 28, "endDate": "1995-09-23T00:00:00Z", "entitlementCollectionId": "AWT8PxL8674KYMeN", "entitlementOrigin": "Other", "itemId": "2CNqmO8JALtCiDuG", "itemSku": "QQsvWV3NSjXUXSMK", "language": "Y09x4TKOwsyRNnaL", "metadata": {"Nhw0xGnXc29UDQxe": {}, "iBo2hB9u1v1POCjs": {}, "eK1xaSbMjyFrYsIT": {}}, "orderNo": "cyT5AhNNH0Ht1yPt", "origin": "Steam", "quantity": 56, "region": "wXIuYrbPUcvEOJ4P", "source": "EXPIRATION", "startDate": "1976-03-05T00:00:00Z", "storeId": "nDJZK5gFHyIOnLu9"}, {"duration": 99, "endDate": "1993-08-07T00:00:00Z", "entitlementCollectionId": "muknvXiTP0KrWQ3p", "entitlementOrigin": "GooglePlay", "itemId": "rIn9hHHGg1cTZsJp", "itemSku": "1b5yB8c9gCPFDZh6", "language": "JfJfg4X1dZOTBgYw", "metadata": {"LjPGFqkbTL8ifUAM": {}, "UekrD0J6iuJsVjhL": {}, "gaFeFJ5QRuvEsU5Q": {}}, "orderNo": "kmsmfFhPTfXVzS3h", "origin": "System", "quantity": 58, "region": "UXbdYU08BQZXTcZn", "source": "GIFT", "startDate": "1978-10-14T00:00:00Z", "storeId": "aII5c5UqVvKR3ydS"}], "transactionId": "Eb2trPjqlB5c8a78"}, {"items": [{"duration": 13, "endDate": "1993-05-06T00:00:00Z", "entitlementCollectionId": "c5lRQojhJgpXVCub", "entitlementOrigin": "GooglePlay", "itemId": "zEOMXF1T1sU9xsmA", "itemSku": "CLFHrXWFobqnDkfP", "language": "AHNgVss4JzVKSusd", "metadata": {"LumoHh8TQWYk2vD3": {}, "mUDwtTF1ATVQnAex": {}, "rRomTZFHX4cgtkxE": {}}, "orderNo": "x6tlxks0yGW8qDWf", "origin": "Oculus", "quantity": 18, "region": "7MF8Ptq10XBhcJfG", "source": "OTHER", "startDate": "1983-08-24T00:00:00Z", "storeId": "AEpR44fWWEsCETqK"}, {"duration": 24, "endDate": "1972-09-22T00:00:00Z", "entitlementCollectionId": "r6vRneC9JYmpKyZG", "entitlementOrigin": "Oculus", "itemId": "sTk9UuiQwezvArAK", "itemSku": "JwZGVyknpOhuGhAn", "language": "lnjyPBj7h3hncU5v", "metadata": {"gL62RA2BI7knizQ4": {}, "Jx8In4w8yRFOLeTQ": {}, "yplscfsZvvUpCMJR": {}}, "orderNo": "liFCmFC9uUxSxI4y", "origin": "Playstation", "quantity": 31, "region": "rZIV9M22gRLsc6Jw", "source": "PAYMENT", "startDate": "1998-12-06T00:00:00Z", "storeId": "90s6yFiDZs0wyldb"}, {"duration": 60, "endDate": "1973-09-04T00:00:00Z", "entitlementCollectionId": "S3A8JeRMYUCgn7ok", "entitlementOrigin": "IOS", "itemId": "Dz8asARtI3TVV2Qm", "itemSku": "lqRK5roG1oZArFJB", "language": "UmMx7nzK8rRAYvvy", "metadata": {"nDPJ9SMRzSo0RzUo": {}, "Sen8CjEhtRcnVsYO": {}, "wypw6F21uYowkPNG": {}}, "orderNo": "ANjli9XZkbrkh3dQ", "origin": "Xbox", "quantity": 25, "region": "tIEwCcfPmWjX540a", "source": "REWARD", "startDate": "1999-04-29T00:00:00Z", "storeId": "gZVxM4rAqxlnHLAF"}], "transactionId": "NEwXBsCkfqzKlzlL"}, {"items": [{"duration": 13, "endDate": "1999-09-25T00:00:00Z", "entitlementCollectionId": "r9vk4HQDiwqJUZHP", "entitlementOrigin": "System", "itemId": "HM6JB2P6ZjZh9egg", "itemSku": "vvmXZU7lVGZ6lIs1", "language": "7PXJ8KsgqGNM6sO7", "metadata": {"IUwIv84zQjc88fKt": {}, "DQSbDQN21JlwPxpu": {}, "UZm1GVuI2Eihx6IJ": {}}, "orderNo": "wMzUqM16MYY2MVvo", "origin": "GooglePlay", "quantity": 80, "region": "eu7KKPXunBZiqYaR", "source": "DLC", "startDate": "1982-09-01T00:00:00Z", "storeId": "KTljWspMrC4TeRTN"}, {"duration": 96, "endDate": "1986-09-02T00:00:00Z", "entitlementCollectionId": "z7N4wHLHx7FCWn7i", "entitlementOrigin": "Xbox", "itemId": "5ImpxpHJCcuqJR2T", "itemSku": "T3HEYBW8Aq2KVQNF", "language": "GaJEyBVlQ5iHlTqg", "metadata": {"Mzvj8sHLF7s3hgmx": {}, "OOzP7vteUYzMZzgg": {}, "FcJQkYueQLLJPh6H": {}}, "orderNo": "podpzuBQwTS66qr0", "origin": "IOS", "quantity": 79, "region": "dRohucoiX0GAQZEb", "source": "PAYMENT", "startDate": "1971-08-09T00:00:00Z", "storeId": "VtQiKwKuIHMjiIjX"}, {"duration": 23, "endDate": "1986-05-13T00:00:00Z", "entitlementCollectionId": "u0WCXd8GX7ygT5ql", "entitlementOrigin": "Playstation", "itemId": "MPTFnrbysdru1Pot", "itemSku": "ArVtIQyxp17b8SHv", "language": "RIiJgGrdz6Ar6ZMG", "metadata": {"UI9Z0Fol65yD1dLB": {}, "QJcBsvUaK2iHOkgy": {}, "hgijqtdzrvCDzH5A": {}}, "orderNo": "CyLXmLsHXWPqYBJT", "origin": "Playstation", "quantity": 23, "region": "RBYL4PAqdviBvToS", "source": "IAP_CHARGEBACK_REVERSED", "startDate": "1986-09-26T00:00:00Z", "storeId": "qHUhHn1qP3G2kSIu"}], "transactionId": "rSOWI2donULQokdC"}]' \
    > test.out 2>&1
eval_tap $? 507 'BulkFulfillItemsV3' test.out

#- 508 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'Ssp87x6Jfe5YAYJe' \
    --userId 'b1GUdtB5G8NITA0g' \
    --body '{"items": [{"duration": 24, "endDate": "1972-04-25T00:00:00Z", "entitlementCollectionId": "qZn79u2grirdqELb", "entitlementOrigin": "GooglePlay", "itemId": "ufk5WE4zPvxA5061", "itemSku": "CF9079hQA91csvlQ", "language": "SS6PyDb3vKbCw9eA", "metadata": {"GmM6lPAJMizukBmc": {}, "y1kbAWDUac65Jdlm": {}, "1JJwmCAjTwtCqKdh": {}}, "orderNo": "92wuH9hLkAg90cQg", "origin": "Epic", "quantity": 8, "region": "zfnYgOqXhJZ6DIok", "source": "SELL_BACK", "startDate": "1989-03-16T00:00:00Z", "storeId": "ZFk9fRCHfId0Dhni"}, {"duration": 27, "endDate": "1978-06-30T00:00:00Z", "entitlementCollectionId": "RxnO0qs4FykFXDdc", "entitlementOrigin": "IOS", "itemId": "uEE9wh4CEOrPY29A", "itemSku": "1L1Xijb7GTIFWcZW", "language": "KcGHG9MBp1AEcNUz", "metadata": {"fWwpdraZO1lfHzX5": {}, "CHNiYaLYUlRZSLj5": {}, "xwmP8QMJJJn2Lqw6": {}}, "orderNo": "aiKZbUJQ92BTViMM", "origin": "System", "quantity": 22, "region": "ji1GmfmwhN25xGSR", "source": "CONSUME_ENTITLEMENT", "startDate": "1997-04-19T00:00:00Z", "storeId": "hgFvKO2erV4ccUhi"}, {"duration": 88, "endDate": "1992-04-17T00:00:00Z", "entitlementCollectionId": "jokv6HMQOekLKHzi", "entitlementOrigin": "Other", "itemId": "lEfC6ckbV2y32kG5", "itemSku": "QTZnpxYa2jDp3Lze", "language": "lXaUz9AKozXBA29D", "metadata": {"PhYa8Ksjfnk7HKSW": {}, "ULkEKqQ4ToqWjpaE": {}, "CYi7fBJaU43PzOIT": {}}, "orderNo": "mqjrcuIH9i4ICwRH", "origin": "Xbox", "quantity": 86, "region": "oPa2glj6rHbkWMDS", "source": "GIFT", "startDate": "1981-12-05T00:00:00Z", "storeId": "dqURkyz4E3EI1bSC"}]}' \
    > test.out 2>&1
eval_tap $? 508 'FulfillItemsV3' test.out

#- 509 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'Yaa8JSNQdhrnvuDG' \
    --userId 'FiT4U6WQQwsTHCgT' \
    > test.out 2>&1
eval_tap $? 509 'RetryFulfillItemsV3' test.out

#- 510 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'vrGllrcttK4WgzdU' \
    --userId 'hB2YhKWidqRPQ1hS' \
    > test.out 2>&1
eval_tap $? 510 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE