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
echo "1..507"

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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["DLC", "REWARD", "CAMPAIGN"]}' \
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
    --body '{"entitlementGrantList": [{"collectionId": "36vzohZyjMQAg5mP", "endDate": "1996-02-26T00:00:00Z", "grantedCode": "9pysFO3Zvc1BZG99", "itemId": "LyvfvHEsJKQQewVL", "itemNamespace": "MUoAnaRcYp7FUjfI", "language": "iALF_tFLX-xz", "metadata": {"sF6xG2mXEQdbzIVy": {}, "8alncV7vWgSHdfo0": {}, "7UctPErqxyMyOK06": {}}, "origin": "Twitch", "quantity": 91, "region": "qQBErxgjVBycvU4P", "source": "ACHIEVEMENT", "startDate": "1978-04-13T00:00:00Z", "storeId": "O05oKqymxLD1Lcvw"}, {"collectionId": "6T6mZEiwxxElpMYS", "endDate": "1995-10-07T00:00:00Z", "grantedCode": "0zMjhTHeh94TSenE", "itemId": "5hCFkIf5weqZ18MH", "itemNamespace": "57l2Zsrh90ETtYmG", "language": "EKa", "metadata": {"MnlrjcHp6B8Vj7rX": {}, "FgDnDkdZ9bpjb1td": {}, "A3QhjCMW64f4XhIj": {}}, "origin": "Nintendo", "quantity": 29, "region": "Xn77AtYoFzLAATPY", "source": "REDEEM_CODE", "startDate": "1999-11-29T00:00:00Z", "storeId": "zTxBGtEJIYppuUSs"}, {"collectionId": "KoHw2hyd12uSE7BE", "endDate": "1982-05-25T00:00:00Z", "grantedCode": "3aevq6iohU1cg4W1", "itemId": "IS3Uv1BpWoJBaqdg", "itemNamespace": "2FHcunsS1lnaO2m9", "language": "RJT", "metadata": {"beK2qN8g6x2PyYDo": {}, "5R3hLiD5sf5y1Jsx": {}, "JNGmyt0SQDUDoWBZ": {}}, "origin": "System", "quantity": 66, "region": "LlkUetzCAWc9x1aM", "source": "IAP", "startDate": "1979-02-19T00:00:00Z", "storeId": "A2clJ5gEOaCgM6Yn"}], "userIds": ["ynMKquUicAeIVXto", "6RugbNEIpGBFUjOn", "5mM7k8nbLzvtCIW5"]}' \
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
    --body '{"appId": "pZm9yEYWNGMy2pgS", "appType": "DEMO", "baseAppId": "SUOK68eqGJtWf1Yb", "boothName": "gg8rdwY9bmrvHmO0", "categoryPath": "7KNqX9LM2IwEsdOG", "clazz": "BXBwnzDX8v3xgC1G", "displayOrder": 9, "entitlementType": "CONSUMABLE", "ext": {"PdbTTAJ2Gp1r0sVZ": {}, "6LJAOddIL2l3hPjN": {}, "DKv2LWfXqjr8fS79": {}}, "features": ["38XQjLDRqkpiFK5B", "En3wYowBdkaZ3y6i", "tiQ272Uo9UBJWodp"], "flexible": false, "images": [{"as": "AHyCK5tNanGBrkzU", "caption": "vck3xTtmOFMebS4A", "height": 7, "imageUrl": "lzxl0yF5m77TTh4g", "smallImageUrl": "Uoj8u2WRcLiEtzVl", "width": 28}, {"as": "rNXnGanMazb8jvRW", "caption": "enURH48aJuALEcSq", "height": 5, "imageUrl": "iAsR65yQ9ssuHdGm", "smallImageUrl": "xncCEr0KcgeqzGbr", "width": 42}, {"as": "eATj7eGjodd7CcJU", "caption": "rI6MAugK5kypNrp2", "height": 27, "imageUrl": "FxKybPkbuS6x9cLJ", "smallImageUrl": "1APnNlsa2bRBr27f", "width": 99}], "inventoryConfig": {"customAttributes": {"l9U4jReteIMgzISo": {}, "mCsodJrhQW41q2Os": {}, "pCZbt3Uta5I0uGcL": {}}, "serverCustomAttributes": {"1koyHjCH5olYLETR": {}, "pABAmO2EGvJ4UMS9": {}, "3yOxNInDByhnoluO": {}}, "slotUsed": 2}, "itemId": "ti0QP2ssiJ66OzOj", "itemIds": ["84O6tgohjtC7bzjP", "pucddXJ5zifF8y95", "9anrNSleywHbHig6"], "itemQty": {"IKWVZ77KeRWdECaF": 66, "9ukcR6c2E2r3vk3I": 10, "23SzUo4hNBDh9ZFP": 82}, "itemType": "SUBSCRIPTION", "listable": false, "localizations": {"W0nXOErQPS4VsRoY": {"description": "IK69yg9ADCGiXaLs", "localExt": {"2xjHkinOD975nARH": {}, "CmhNHSXuqIHsxvaU": {}, "oXDmwWsukxncuD3Q": {}}, "longDescription": "xCXMd00YBWCaVVmM", "title": "45mfIZsWhkS476dG"}, "GJwJ00UH197MJ6zU": {"description": "7JLMQyMWzYQCAaPJ", "localExt": {"goxGJoJaSzUtY4ZD": {}, "0Xtb0U4pH16NUsVY": {}, "21NVIs7NRen2Y3Ns": {}}, "longDescription": "0QJQeaWytPfds1BY", "title": "x0EaURydf8ZyyZeH"}, "AWGgJUbUJRMbkcTg": {"description": "lbU86FyOjApNHBVf", "localExt": {"NOURcjY3YYT9oTyn": {}, "mfIuBWgJTNFfM8M0": {}, "IW4oe8KDgy0xZfAc": {}}, "longDescription": "Ng14Ws8TIP1LKiFQ", "title": "oLDvumfqrgSfnx2h"}}, "lootBoxConfig": {"rewardCount": 59, "rewards": [{"lootBoxItems": [{"count": 4, "duration": 82, "endDate": "1988-01-27T00:00:00Z", "itemId": "sQ3PuppUxDSK8aOT", "itemSku": "GMudcxlCV4cNbJGQ", "itemType": "57lPdinpjS2DRfGt"}, {"count": 18, "duration": 66, "endDate": "1990-03-30T00:00:00Z", "itemId": "cdlbdRXTGIrdNL5g", "itemSku": "JPqTAjgqaTHf1ANT", "itemType": "J9Yk997XkGOdC6It"}, {"count": 47, "duration": 61, "endDate": "1979-06-29T00:00:00Z", "itemId": "8p4n4XCFkD1AJLCw", "itemSku": "szbZxuHSgDOK8bjo", "itemType": "F7bL2635KbtZTGJp"}], "name": "qgl2IzNXGTuQPIDp", "odds": 0.23145627386110124, "type": "REWARD", "weight": 43}, {"lootBoxItems": [{"count": 39, "duration": 59, "endDate": "1971-04-15T00:00:00Z", "itemId": "JLNNz6QIVC9Mfuc8", "itemSku": "VOsnmnlVljdWYmEL", "itemType": "e74p38vumnxAnYBT"}, {"count": 47, "duration": 69, "endDate": "1971-11-29T00:00:00Z", "itemId": "TIz0jcgDI8Pkz96v", "itemSku": "d80msqIm5bufnBqr", "itemType": "pLeqhwVhjnnjKMEm"}, {"count": 40, "duration": 10, "endDate": "1971-11-03T00:00:00Z", "itemId": "iWsAQHbMrKYi0Zxs", "itemSku": "5SWCqZXHLLa31oQf", "itemType": "7BULnZDhutDM6Bqg"}], "name": "uqD5xxGxBWtnTKUe", "odds": 0.8814334920984954, "type": "REWARD", "weight": 67}, {"lootBoxItems": [{"count": 27, "duration": 88, "endDate": "1980-06-09T00:00:00Z", "itemId": "qPzPkwCBo2SwCUsT", "itemSku": "ag4MLAo3m61P2xaN", "itemType": "fmn8Onb1a9gMz0F2"}, {"count": 95, "duration": 40, "endDate": "1985-08-06T00:00:00Z", "itemId": "RmMhAbUWmFhdYLWz", "itemSku": "Muv3zkUY0n0BAZkw", "itemType": "bYkBLyO6A0Fqfhna"}, {"count": 57, "duration": 69, "endDate": "1999-09-20T00:00:00Z", "itemId": "xKNdOTacCcJfIfXs", "itemSku": "huLUk5WdpxjZx5no", "itemType": "XPhPUTKbonoucNmz"}], "name": "wOZOK56sDkci5rZ8", "odds": 0.1324343054926651, "type": "REWARD_GROUP", "weight": 72}], "rollFunction": "CUSTOM"}, "maxCount": 8, "maxCountPerUser": 83, "name": "lt7rjF5RaJwvkWVc", "optionBoxConfig": {"boxItems": [{"count": 30, "duration": 35, "endDate": "1999-10-30T00:00:00Z", "itemId": "b1XTB9YQzUJ9XlYJ", "itemSku": "8BzP6EUmUXGM5anI", "itemType": "loyj9lhbvuQdW2jw"}, {"count": 75, "duration": 64, "endDate": "1995-01-16T00:00:00Z", "itemId": "JKZFNk2NKy59X8iO", "itemSku": "g2sVBiCoeC5weXJl", "itemType": "7PeiMH8z8dVej8N2"}, {"count": 49, "duration": 32, "endDate": "1982-10-25T00:00:00Z", "itemId": "VTnOK7xAvM7tuL81", "itemSku": "lsR7xxSVp3Gd2TK0", "itemType": "HzYviTgYmx82JVBR"}]}, "purchasable": false, "recurring": {"cycle": "WEEKLY", "fixedFreeDays": 91, "fixedTrialCycles": 71, "graceDays": 65}, "regionData": {"z8tne5dbguBF6Gsv": [{"currencyCode": "vdl8jHz9x7XZIjU4", "currencyNamespace": "IK9lOLaZaMphKCqT", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1999-03-15T00:00:00Z", "discountPercentage": 63, "discountPurchaseAt": "1972-10-29T00:00:00Z", "expireAt": "1975-11-25T00:00:00Z", "price": 10, "purchaseAt": "1990-10-14T00:00:00Z", "trialPrice": 13}, {"currencyCode": "joEEXBLIxGnNuhoJ", "currencyNamespace": "M3WWPvvCiCf33ViE", "currencyType": "REAL", "discountAmount": 83, "discountExpireAt": "1979-12-22T00:00:00Z", "discountPercentage": 88, "discountPurchaseAt": "1993-05-03T00:00:00Z", "expireAt": "1974-05-03T00:00:00Z", "price": 47, "purchaseAt": "1987-03-26T00:00:00Z", "trialPrice": 99}, {"currencyCode": "UWNizk5UcPAGv6c1", "currencyNamespace": "ESC6hZYTYZbzf5aA", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1996-05-28T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1974-03-29T00:00:00Z", "expireAt": "1985-02-24T00:00:00Z", "price": 55, "purchaseAt": "1993-10-24T00:00:00Z", "trialPrice": 48}], "ZNUHbIT9szApmWJO": [{"currencyCode": "5vzzXZj08a6K1XRV", "currencyNamespace": "friSpPFnZBJZkDnE", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1995-02-07T00:00:00Z", "discountPercentage": 53, "discountPurchaseAt": "1971-03-10T00:00:00Z", "expireAt": "1999-11-04T00:00:00Z", "price": 42, "purchaseAt": "1980-03-11T00:00:00Z", "trialPrice": 27}, {"currencyCode": "3lvozTt9TsH7A0Tu", "currencyNamespace": "U2aL4bPkk11sys6G", "currencyType": "REAL", "discountAmount": 4, "discountExpireAt": "1976-08-27T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-04-30T00:00:00Z", "expireAt": "1980-01-22T00:00:00Z", "price": 42, "purchaseAt": "1998-09-09T00:00:00Z", "trialPrice": 72}, {"currencyCode": "brTFznTgDIwZIRWf", "currencyNamespace": "6T3by2kYSCdnFKLc", "currencyType": "VIRTUAL", "discountAmount": 1, "discountExpireAt": "1972-01-16T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1976-05-17T00:00:00Z", "expireAt": "1976-03-19T00:00:00Z", "price": 7, "purchaseAt": "1993-01-15T00:00:00Z", "trialPrice": 6}], "EfU61OJYMnW49rWy": [{"currencyCode": "np1ck1vT90C6o86c", "currencyNamespace": "SRL9cgbUmulhe98o", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1989-10-28T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1977-09-07T00:00:00Z", "expireAt": "1992-03-05T00:00:00Z", "price": 64, "purchaseAt": "1972-07-02T00:00:00Z", "trialPrice": 8}, {"currencyCode": "9GYxjiiOQAD77ci0", "currencyNamespace": "vfWVZoRRMPi57HyK", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1985-04-16T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1983-10-12T00:00:00Z", "expireAt": "1989-06-13T00:00:00Z", "price": 51, "purchaseAt": "1977-07-20T00:00:00Z", "trialPrice": 74}, {"currencyCode": "v6gFZXI5nXJ7hLi6", "currencyNamespace": "HweweRmyo91dIn7Q", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1979-08-28T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1996-10-11T00:00:00Z", "expireAt": "1999-01-13T00:00:00Z", "price": 87, "purchaseAt": "1979-12-30T00:00:00Z", "trialPrice": 34}]}, "saleConfig": {"currencyCode": "PAd9sxoLnWGP1Paf", "price": 70}, "seasonType": "PASS", "sectionExclusive": false, "sellable": true, "sku": "ce0KbNN7Ycl2JfmQ", "stackable": false, "status": "ACTIVE", "tags": ["lvGjVQ4aebjfgGu4", "72oWJlfglLM4xjfk", "NL4lU6jaGfsD1cfs"], "targetCurrencyCode": "wmeFpvtDtetoQVFL", "targetNamespace": "8LNW11vtpaTxi7k4", "thumbnailUrl": "89jRCn48bvkCPfKo", "useCount": 11}' \
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
    --sortBy 'createdAt:desc,updatedAt:desc,createdAt:asc' \
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
    --body '{"appId": "iPJ9j4vxmbH3rVaa", "appType": "GAME", "baseAppId": "V87yfkycLSVdleSa", "boothName": "AylsmLYe2phYOgT5", "categoryPath": "kDTyPl3dKF7NXEjr", "clazz": "JMki8jvc3P8Gwjg3", "displayOrder": 72, "entitlementType": "CONSUMABLE", "ext": {"OH0SDHgYKqxJiFJd": {}, "rmj5vhzgsJwex7wq": {}, "8ZPlXNaUNgdY2vfJ": {}}, "features": ["uje5cPnmGjTvYa5P", "EPb988NzxrDKVpUL", "qx1K7qcAoijBPAp6"], "flexible": false, "images": [{"as": "6MLZJ2jZfZbpTJez", "caption": "zriCDWXT59SRu0Yq", "height": 96, "imageUrl": "VYYG9WvoGmAmvaVV", "smallImageUrl": "5YfxnUNcwjr7gSGh", "width": 27}, {"as": "4Eoes9a6XaJeRbzT", "caption": "PwD3jxF7vxRUY0il", "height": 36, "imageUrl": "JprIb3CJCAtvSG8C", "smallImageUrl": "fa9dzOJDGCTHIOFj", "width": 10}, {"as": "xeR6d7r1SQw80JfM", "caption": "pPrSqYypRUnq5o4E", "height": 94, "imageUrl": "2jy29EJigqYhyVhU", "smallImageUrl": "Rx1yPeczRpdk0HAT", "width": 66}], "inventoryConfig": {"customAttributes": {"QpoTOxe8y1jorNsg": {}, "9ZKYCKoISyXtHzoW": {}, "GdYohxMp3uOQIybq": {}}, "serverCustomAttributes": {"WfG9BJ6FVKlbYHtb": {}, "PtaxvagSlpGgVTF6": {}, "VeDAPOGBwweyFfXE": {}}, "slotUsed": 82}, "itemIds": ["cfHDCdl59Wp9A3tX", "Gve6DdK6uvg8f2cI", "oByk9fxtvsgeAxo5"], "itemQty": {"7nKAbZpsbJ4Iu5KJ": 38, "ynxGBlacDCdFe8AT": 95, "oufCNlFoOcWQQy4b": 19}, "itemType": "BUNDLE", "listable": false, "localizations": {"uQIcSbUt5UGkInFG": {"description": "puUsdtq4dOwNESzC", "localExt": {"EW9dUVhZjLftC3sC": {}, "S8CpLCqPD9CeDEdC": {}, "nnL6Kt1Bjj3b8QM8": {}}, "longDescription": "Rr45ULqXQgvwD3Ps", "title": "KDJiWxQBwaS7rDBf"}, "2S54phbdyGDt47f9": {"description": "GWRlE9hqz6rjDNo4", "localExt": {"rhjxUdMM83WekqfW": {}, "v04vvn9bk5qr8qs2": {}, "mqtnGAqXUjNypF6M": {}}, "longDescription": "MqWpdEJsPoaIbYz8", "title": "cK5jlpJdre5ur6yv"}, "WJDdvM7T7PX2vamI": {"description": "RZHzsIYOCUoiCXNj", "localExt": {"rdQL2jdx1eIba1sB": {}, "0HsJ06DzfbzRYt4O": {}, "VUyumBeIqdQGZC5k": {}}, "longDescription": "M03HHijsQRj7N8IA", "title": "jmsonjj0ZR50BQ1U"}}, "lootBoxConfig": {"rewardCount": 0, "rewards": [{"lootBoxItems": [{"count": 0, "duration": 47, "endDate": "1987-09-02T00:00:00Z", "itemId": "D3O2kXQSc58zgZVl", "itemSku": "4gIF7v3qbZu9M3Ox", "itemType": "qVAT4H1lRZ9Z1JBr"}, {"count": 69, "duration": 63, "endDate": "1993-10-12T00:00:00Z", "itemId": "zEOtIxzPqb6n73m0", "itemSku": "jiaDH86d9rsKgzCs", "itemType": "MulpB8HZUtVVaJCi"}, {"count": 77, "duration": 93, "endDate": "1974-06-03T00:00:00Z", "itemId": "KOwrSfWhT5B4Wedo", "itemSku": "pzwSluBtRFPKThyG", "itemType": "nbjmPDKFS6u9FHuv"}], "name": "1M3qfch4SqIV6LQP", "odds": 0.5380510196551774, "type": "PROBABILITY_GROUP", "weight": 57}, {"lootBoxItems": [{"count": 0, "duration": 98, "endDate": "1973-05-26T00:00:00Z", "itemId": "Yl4csFq65cU66yJa", "itemSku": "j4ovoKWE4EW0sw8v", "itemType": "5peiuxoBJATauyD3"}, {"count": 83, "duration": 58, "endDate": "1997-03-18T00:00:00Z", "itemId": "VMiyEvMf9yilUEuj", "itemSku": "k6oqYo1HQYTFzwdO", "itemType": "MdupwD4O3uNbcIDc"}, {"count": 71, "duration": 62, "endDate": "1983-01-28T00:00:00Z", "itemId": "vZbOy1T4hfwkuVyk", "itemSku": "H4RpfmjIXFGZ5PKd", "itemType": "babJIkNnt9P1Tkm0"}], "name": "8luh4dpPRMDbUXBW", "odds": 0.7381741727774985, "type": "PROBABILITY_GROUP", "weight": 81}, {"lootBoxItems": [{"count": 32, "duration": 54, "endDate": "1978-11-05T00:00:00Z", "itemId": "gG2wlZkLhuU5FI8N", "itemSku": "ijFI0GKwJ3vfXlsA", "itemType": "My2Zp2UAGxHnmSxv"}, {"count": 22, "duration": 80, "endDate": "1987-01-09T00:00:00Z", "itemId": "9UR5q9neoW6JBcGp", "itemSku": "9Rx2RfcRhXpmeeHd", "itemType": "vphas9S7ivHEoLbU"}, {"count": 79, "duration": 97, "endDate": "1991-03-05T00:00:00Z", "itemId": "47f1UreUpxEkXIbE", "itemSku": "1ETzRJZKMavu4Ul2", "itemType": "IaieEbPSE7TGkeHs"}], "name": "YsW9oGBN1pYMBwbP", "odds": 0.8255421168278021, "type": "REWARD_GROUP", "weight": 55}], "rollFunction": "CUSTOM"}, "maxCount": 92, "maxCountPerUser": 79, "name": "Bh61hmWKSSrF35an", "optionBoxConfig": {"boxItems": [{"count": 61, "duration": 9, "endDate": "1987-06-25T00:00:00Z", "itemId": "BZ6FVrBzyhyhoS6a", "itemSku": "9oe0JaXFpff28uYb", "itemType": "e4Cf2HEHvVevhISj"}, {"count": 2, "duration": 50, "endDate": "1981-08-17T00:00:00Z", "itemId": "MAAmIHYbsxG5N066", "itemSku": "FXb88SbLOa21DiSF", "itemType": "sm0XXQJWszvTQEuA"}, {"count": 78, "duration": 32, "endDate": "1984-08-12T00:00:00Z", "itemId": "DNp1SZ58aDllwzTR", "itemSku": "Hak1MXxj7Esrg790", "itemType": "0nml5BidsK9dCEzh"}]}, "purchasable": false, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 82, "fixedTrialCycles": 44, "graceDays": 93}, "regionData": {"0PQbVIaKiHfoeorY": [{"currencyCode": "7A1otGFyv2SMjbEr", "currencyNamespace": "50qGdCZIc6EFqBKx", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1994-04-11T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1992-05-22T00:00:00Z", "expireAt": "1991-10-28T00:00:00Z", "price": 14, "purchaseAt": "1980-12-28T00:00:00Z", "trialPrice": 74}, {"currencyCode": "ucL1jwRXzfjDZZBm", "currencyNamespace": "Oau6syme06c6SKLc", "currencyType": "REAL", "discountAmount": 5, "discountExpireAt": "1986-01-07T00:00:00Z", "discountPercentage": 58, "discountPurchaseAt": "1978-06-19T00:00:00Z", "expireAt": "1988-08-17T00:00:00Z", "price": 33, "purchaseAt": "1976-02-16T00:00:00Z", "trialPrice": 22}, {"currencyCode": "CbkOfHaGr5kdazly", "currencyNamespace": "pvt6lSLfU7HByGXP", "currencyType": "VIRTUAL", "discountAmount": 33, "discountExpireAt": "1995-07-11T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1987-02-27T00:00:00Z", "expireAt": "1992-08-10T00:00:00Z", "price": 28, "purchaseAt": "1974-05-12T00:00:00Z", "trialPrice": 1}], "3YAxZLKbcOdyjqf6": [{"currencyCode": "Q4oiwoJcaRMEb15L", "currencyNamespace": "BlTVufc5ZyODR2NV", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1987-12-09T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1993-05-15T00:00:00Z", "expireAt": "1987-02-10T00:00:00Z", "price": 94, "purchaseAt": "1999-02-04T00:00:00Z", "trialPrice": 60}, {"currencyCode": "RbZqBAoKGcVCdMiS", "currencyNamespace": "NV4qBrt1kcLmRv6E", "currencyType": "VIRTUAL", "discountAmount": 40, "discountExpireAt": "1974-04-09T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1978-07-16T00:00:00Z", "expireAt": "1975-07-16T00:00:00Z", "price": 26, "purchaseAt": "1978-06-02T00:00:00Z", "trialPrice": 39}, {"currencyCode": "b8oWq94RImNWVIJn", "currencyNamespace": "hhwFDV1VitaomvWT", "currencyType": "VIRTUAL", "discountAmount": 7, "discountExpireAt": "1992-05-26T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1996-08-26T00:00:00Z", "expireAt": "1980-11-23T00:00:00Z", "price": 40, "purchaseAt": "1982-07-02T00:00:00Z", "trialPrice": 6}], "YS4Kj7Yi2VvoQNW8": [{"currencyCode": "Yc481dYdvGxJAMDR", "currencyNamespace": "A1LF7jdWlekFwO94", "currencyType": "VIRTUAL", "discountAmount": 56, "discountExpireAt": "1980-08-26T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1995-05-25T00:00:00Z", "expireAt": "1999-05-12T00:00:00Z", "price": 65, "purchaseAt": "1989-01-15T00:00:00Z", "trialPrice": 15}, {"currencyCode": "EcvVAyId6Cp85HVD", "currencyNamespace": "sZBQgOnXuXsGThYZ", "currencyType": "VIRTUAL", "discountAmount": 64, "discountExpireAt": "1977-07-07T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1977-09-28T00:00:00Z", "expireAt": "1982-05-27T00:00:00Z", "price": 55, "purchaseAt": "1987-06-26T00:00:00Z", "trialPrice": 78}, {"currencyCode": "NF0Z0GkwxUNYyNwG", "currencyNamespace": "iKrknH0Y5mrQgLC6", "currencyType": "VIRTUAL", "discountAmount": 2, "discountExpireAt": "1999-07-23T00:00:00Z", "discountPercentage": 33, "discountPurchaseAt": "1993-05-29T00:00:00Z", "expireAt": "1993-09-13T00:00:00Z", "price": 17, "purchaseAt": "1990-12-10T00:00:00Z", "trialPrice": 82}]}, "saleConfig": {"currencyCode": "HglUQMZi5WjMZfOa", "price": 6}, "seasonType": "PASS", "sectionExclusive": false, "sellable": false, "sku": "gegCUjTdi1Ehr8Ot", "stackable": true, "status": "INACTIVE", "tags": ["yuoya4JgakZyUV7t", "73VnSFbuxd4KYZ0j", "k0UZdhtnKu9oTc8p"], "targetCurrencyCode": "VkiyGsj5JdXzRxfN", "targetNamespace": "EjUMTs8WIObJBTsv", "thumbnailUrl": "sw76uISRX0bKVoWt", "useCount": 29}' \
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
    --body '{"featuresToCheck": ["DLC", "REWARD"]}' \
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
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 12, "code": "iP2JQ24meDrwEuTy", "comparison": "isGreaterThanOrEqual", "name": "2qohglzO8AEl6A9s", "predicateType": "SeasonPassPredicate", "value": "ceS9UX48dKPCFUIe", "values": ["yYEymNXzNX6TGh4U", "lh6Z1oz9BaixUUvm", "dEweeBsJEvBbAvCm"]}, {"anyOf": 51, "code": "myHEV4g9P6a280S5", "comparison": "excludes", "name": "NB5dVCsB7xL4axSP", "predicateType": "EntitlementPredicate", "value": "47CAT7cBP0918JaE", "values": ["RnP1oK3c4RVfjB0z", "BQBP766LUnBBR84i", "AO7sBQt6YJ2tWwF7"]}, {"anyOf": 18, "code": "s36r1FgR70eNLHkV", "comparison": "isGreaterThanOrEqual", "name": "algizL97ycJV5YqE", "predicateType": "SeasonPassPredicate", "value": "HgpFNw9K9pmAIc6V", "values": ["s3GuA4S1dS7H7yIS", "SfE9nbE2PMv12ZSR", "JkujxbCu1HFaj6Vx"]}]}, {"operator": "and", "predicates": [{"anyOf": 34, "code": "TSDRIoMg7Dc5APzf", "comparison": "isLessThanOrEqual", "name": "wtLPxK1os4qR8LaQ", "predicateType": "StatisticCodePredicate", "value": "yL72WDyhBsCCbnfi", "values": ["hnXKxGxaupnTTq9i", "hZkvFKfSHQh8I9xk", "3sFl0cbuCRM69XKk"]}, {"anyOf": 78, "code": "Kc0aUvrKXDIjYC4d", "comparison": "includes", "name": "e2fJDS6T75Q4ulon", "predicateType": "StatisticCodePredicate", "value": "FjmYqE1wJhfogWg2", "values": ["dKDEZywonA2SrEdN", "Apm0sUy18aWn65Co", "0vdCk8so6JSaZAIa"]}, {"anyOf": 38, "code": "tmGuX6r0gBVUUeKK", "comparison": "is", "name": "fBpWVxIK9D2bTcga", "predicateType": "SeasonPassPredicate", "value": "qugklBUS6uwWrCQt", "values": ["86Jrg8tLAJWpcyNk", "Uvqn6eXr6FNbKJ05", "Orya6LSSUlugIAkn"]}]}, {"operator": "and", "predicates": [{"anyOf": 60, "code": "SaVYcAYp7qSiDvsf", "comparison": "isGreaterThanOrEqual", "name": "UOpWv46sXvpOjrpR", "predicateType": "SeasonPassPredicate", "value": "uDLLuIaSxoloIH1g", "values": ["BCWVFrvls0ZwosKh", "DlLfTKxpVOXvGSrd", "kqddI3ezqu6FB0sL"]}, {"anyOf": 40, "code": "xt6fX9j7rhZCAlDl", "comparison": "isNot", "name": "BjrV0p9A7tcHrV0M", "predicateType": "EntitlementPredicate", "value": "CSoqHvH7g63cOx6y", "values": ["3Cc4M2O7NrTQO7KL", "dZDGwqx7T3l1ut2o", "rIw37pKOLrF5i3gr"]}, {"anyOf": 50, "code": "2FBS93Mg6TKwdRMr", "comparison": "excludes", "name": "Uml3KuoMKh7tprna", "predicateType": "EntitlementPredicate", "value": "NIbJMJ9ABbKVWO2Y", "values": ["gNiPPjpSAlZwFGpe", "EDiqkwKbpdk7wlDn", "a5ObBB49Km4ClIQm"]}]}]}}' \
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

#- 195 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 195 'UploadRevocationPluginConfigCert' test.out

#- 196 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "rQB1yUonirH4URx3", "eventTopic": "NkKQBYrlUaMiFEWU", "maxAwarded": 93, "maxAwardedPerUser": 51, "namespaceExpression": "cAFO5zEw8GENEJYP", "rewardCode": "KxxOw7xNQ98IEbc9", "rewardConditions": [{"condition": "YITN98j4P2AGeidX", "conditionName": "RRnIAJfKVjOn6rtI", "eventName": "LNJVv2DLLUyBt5hD", "rewardItems": [{"duration": 38, "endDate": "1982-05-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "8FgqG46RsFK7eYlS", "quantity": 95, "sku": "RXVcg6AByNpBo2JY"}, {"duration": 22, "endDate": "1997-06-30T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "LdmR97u9MVUii4Kp", "quantity": 5, "sku": "0Dv6b8WtaMVvLbG0"}, {"duration": 39, "endDate": "1989-08-23T00:00:00Z", "identityType": "ITEM_ID", "itemId": "PQlFAGbMtEybfcAl", "quantity": 76, "sku": "mnsAkRT2k0AzdgIu"}]}, {"condition": "nRkTxsGdrpNELM8L", "conditionName": "fkut0wnT24wh59RG", "eventName": "SbBMh7jpszuVk6iP", "rewardItems": [{"duration": 6, "endDate": "1984-10-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "boQqCCyJfThvCJie", "quantity": 35, "sku": "iHewZkwEeuzBBRSk"}, {"duration": 27, "endDate": "1971-07-12T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "yWkZObuvig8sMuss", "quantity": 74, "sku": "6ezTrsDZNYUV48Oh"}, {"duration": 34, "endDate": "1987-12-30T00:00:00Z", "identityType": "ITEM_ID", "itemId": "vUtPYONZdFk75lkj", "quantity": 88, "sku": "NPUOHNZxML3yoBM9"}]}, {"condition": "qxd6PWz7sVnMxge2", "conditionName": "inL8fBFP1ABaIKrE", "eventName": "t8d3o7cTS9OIIMEr", "rewardItems": [{"duration": 26, "endDate": "1980-11-18T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "HrsOFsbhRow4iaYK", "quantity": 50, "sku": "xNwp1lGkYoq8HP1T"}, {"duration": 79, "endDate": "1972-02-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "7okHl1wMht2Izq7T", "quantity": 58, "sku": "NG8rGp7Fadvo5Ezp"}, {"duration": 43, "endDate": "1988-12-19T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "1mx6K17GL1CrO4Zu", "quantity": 29, "sku": "LBmvdncQkcZb8cWd"}]}], "userIdExpression": "VH9bww15zZsaYrJA"}' \
    > test.out 2>&1
eval_tap $? 196 'CreateReward' test.out

#- 197 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'e5Kd5QB96ndlO6iP' \
    --limit '66' \
    --offset '55' \
    --sortBy 'rewardCode:desc,rewardCode' \
    > test.out 2>&1
eval_tap $? 197 'QueryRewards' test.out

#- 198 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 198 'ExportRewards' test.out

#- 199 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 199 'ImportRewards' test.out

#- 200 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Khqilty9NVlgxUmn' \
    > test.out 2>&1
eval_tap $? 200 'GetReward' test.out

#- 201 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'fdOAmu1dX1NqD20R' \
    --body '{"description": "UvvYeJZw6QZFN7wF", "eventTopic": "CnqpvNesGiVnt9p2", "maxAwarded": 39, "maxAwardedPerUser": 84, "namespaceExpression": "o7Yja1soDE1K0SvG", "rewardCode": "rMYwPmPXC2LfL2m5", "rewardConditions": [{"condition": "rP2A20t6foPPH94S", "conditionName": "UinY5diUlqgvY7dP", "eventName": "PyahppgxJhk4EdTZ", "rewardItems": [{"duration": 41, "endDate": "1997-12-31T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "rS92594HLvWFsXHt", "quantity": 80, "sku": "GYRMdz07xEJ40eps"}, {"duration": 38, "endDate": "1974-02-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "JJC3CX0hpB1ZGMMo", "quantity": 21, "sku": "DSozCuFsrBMtoOeL"}, {"duration": 11, "endDate": "1980-11-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CYxSeeJOlxa395rg", "quantity": 15, "sku": "kyaFwwD7wecuQb4G"}]}, {"condition": "NQHVZMKGBnzh4sua", "conditionName": "GIzttTncVBf5g3oe", "eventName": "uHiNyLkfPQPmjUkv", "rewardItems": [{"duration": 92, "endDate": "1987-06-01T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "mIejozmG5HlrIfMA", "quantity": 45, "sku": "5phhU315LUC6HSMQ"}, {"duration": 72, "endDate": "1999-07-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "nXNd6ve29lqqtcLJ", "quantity": 100, "sku": "TLbYWpqeXjaf1f5f"}, {"duration": 19, "endDate": "1986-11-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "MZjKJ05puX3197Wr", "quantity": 79, "sku": "QGnnW4ugGX6mKBbg"}]}, {"condition": "TD9xL07ZzzIs3Jke", "conditionName": "34ZAUuLP897ooMLn", "eventName": "emwKAvgDXNrFEE4J", "rewardItems": [{"duration": 11, "endDate": "1981-03-05T00:00:00Z", "identityType": "ITEM_ID", "itemId": "QpsLOcLtZw0efmEV", "quantity": 6, "sku": "864shbnQ3bVvuvps"}, {"duration": 61, "endDate": "1981-10-16T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "5Niy4NNFpRE5pS85", "quantity": 51, "sku": "FFAQZbfbmVTEbiRq"}, {"duration": 65, "endDate": "1989-06-16T00:00:00Z", "identityType": "ITEM_ID", "itemId": "0wCVlYQi9cfMCeNn", "quantity": 42, "sku": "J33tCwv8H1f451FV"}]}], "userIdExpression": "Z630HNBYZSrz7pMj"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateReward' test.out

#- 202 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ESLLMPKDXLki6Oz5' \
    > test.out 2>&1
eval_tap $? 202 'DeleteReward' test.out

#- 203 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'Bygt8Q0RjSf1srB7' \
    --body '{"payload": {"hGwGbUmQmJHNffZE": {}, "Ns9X0hFMdzryvhc1": {}, "YjHmmulSBIElc2Cd": {}}}' \
    > test.out 2>&1
eval_tap $? 203 'CheckEventCondition' test.out

#- 204 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'RvBb0aGnMt625bWH' \
    --body '{"conditionName": "b5sbX6asrjV7XJUO", "userId": "tHlzXNHEPpzlMlx7"}' \
    > test.out 2>&1
eval_tap $? 204 'DeleteRewardConditionRecord' test.out

#- 205 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'b2H2THLwZGikW7TF' \
    --limit '55' \
    --offset '0' \
    --start '9gE6SrYKq6lcVOhP' \
    --storeId 'JIcEHbiKHW7flVol' \
    --viewId 'AWEMmQSPDTRqjlvw' \
    > test.out 2>&1
eval_tap $? 205 'QuerySections' test.out

#- 206 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nnCA5tfK5ushaKTP' \
    --body '{"active": false, "displayOrder": 22, "endDate": "1983-05-05T00:00:00Z", "ext": {"OUpR3uUdgNlyU4IJ": {}, "nqtrjCOsE8VjvzhJ": {}, "wNX4bhqCjlwrmsSR": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 2, "itemCount": 18, "rule": "LOOP"}, "items": [{"id": "ic1FIMyF7CcNu2DY", "sku": "n6E9Gk51kOTJZluT"}, {"id": "ekDMCGUJvERxNg8d", "sku": "jSb4Vt2vKQ5vlCdI"}, {"id": "519Pf2iogwxM5DZM", "sku": "0dgozmco41750xdY"}], "localizations": {"Qg34WUV0WpmsQnp1": {"description": "n4YGumTKOlDOy5vh", "localExt": {"SkxERZ2AQ1jvXYBa": {}, "r5RMmmGdWl0wpj5t": {}, "VfKU3D8WVPh0Z7Yi": {}}, "longDescription": "GE2cyzTMBY7Xd0Oo", "title": "ENg2Lw7uepmahXoj"}, "VZYz2zMU9jLzNV3G": {"description": "aG43R6nlRPrEAYqR", "localExt": {"BeSc5uShoj3dGHMe": {}, "oi5DBOsQ0Gax0iX0": {}, "5IT9Agsjl5NmnSHh": {}}, "longDescription": "xNmCe4txY0MsPc9E", "title": "Mgf9JCJiEvhL8Zfw"}, "CVJW9yspUOyHC9eK": {"description": "eXzrvzBllwzyC1aT", "localExt": {"WEmPgoy4TkpEw4Ze": {}, "id4mRoFNxv10ckMQ": {}, "VjKk3bWJ0ZuYSe3s": {}}, "longDescription": "I0x2hc8vaN1Off5g", "title": "RZZMW3huAIzBPWBY"}}, "name": "KAEFTdlKNh6GTzKj", "rotationType": "FIXED_PERIOD", "startDate": "1984-08-23T00:00:00Z", "viewId": "sOlfLB1J19b5rTfi"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateSection' test.out

#- 207 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'L2P3r1a8KIJH33aK' \
    > test.out 2>&1
eval_tap $? 207 'PurgeExpiredSection' test.out

#- 208 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'kPuWD59MgTy1HA58' \
    --storeId 'Jt5NaROjSKFEuZo2' \
    > test.out 2>&1
eval_tap $? 208 'GetSection' test.out

#- 209 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'ElXYSS4ezBRSiOyR' \
    --storeId 'eviDaxlPdhwmcH03' \
    --body '{"active": true, "displayOrder": 5, "endDate": "1978-11-04T00:00:00Z", "ext": {"MxzRR6xd9rTh3ure": {}, "aIbxM3Wev9pZQjWA": {}, "N0tny16ZHZtuSJGQ": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 1, "itemCount": 36, "rule": "SEQUENCE"}, "items": [{"id": "7JEMRPkdTcAzkIln", "sku": "dN5xeayr3vUKMuIi"}, {"id": "z2MiAAKcvAXnxnH0", "sku": "QIhoJRY807VmBT4w"}, {"id": "ZXQZZrSsuYiIPei0", "sku": "pXglJYnKkoCAZuol"}], "localizations": {"AWnxkImVbDP0QX31": {"description": "gI7VmnGIRMvXe6Bi", "localExt": {"phIFe2bzr6qQw6fS": {}, "ESkM19OPMBb12gpm": {}, "ShlmIt2nfhUaZGqj": {}}, "longDescription": "slu59GT2E6AacmZR", "title": "XZm626POXWVj3KP1"}, "mX0iYHXBU3Uk2tQm": {"description": "307IORTyHnLYDAAg", "localExt": {"1YA4kZURmoGgxVRM": {}, "Pf8g1rbhfIMStMnS": {}, "qrKWYOuITlYS2RYa": {}}, "longDescription": "D9WNKGhbLhjz1v0R", "title": "BIO2rkJGmPaK6HEV"}, "IQJd3930TGewjRyf": {"description": "o4nWVZZbKFsKOmgE", "localExt": {"hjH2wFzCpxxJLfAg": {}, "5cFT0gHAkltcR3eH": {}, "FbiAluHv7Hssd05p": {}}, "longDescription": "HBJX5ln8PZbYVD8R", "title": "iaTsdD4d3kSbTkHP"}}, "name": "MUvOAUXkw36cr2WJ", "rotationType": "NONE", "startDate": "1984-05-10T00:00:00Z", "viewId": "pSV94Jy6yCSXBqJq"}' \
    > test.out 2>&1
eval_tap $? 209 'UpdateSection' test.out

#- 210 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'jAbVwSaoj1ugjr8m' \
    --storeId 'Pkr3tZ506ERSVy5M' \
    > test.out 2>&1
eval_tap $? 210 'DeleteSection' test.out

#- 211 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'ListStores' test.out

#- 212 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "3rrkxu0U9h9gCNVZ", "defaultRegion": "xHGxhZqNXJ6JXSh0", "description": "Z3SWISs1dYrJKmx1", "supportedLanguages": ["BT6iLFQejNZJNF2h", "m0TqBQprHn3whPKU", "5abnqw8fFa30pVbh"], "supportedRegions": ["r1BHh1arZAyuLcZo", "EkPpqKhP2jWnRTgl", "w0gdWoE4esuiDrqu"], "title": "ccz4J6fFQezJ5E3i"}' \
    > test.out 2>&1
eval_tap $? 212 'CreateStore' test.out

#- 213 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 213 'GetCatalogDefinition' test.out

#- 214 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'DownloadCSVTemplates' test.out

#- 215 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "VIEW", "fieldsToBeIncluded": ["YQu7hZvHfiT9s9pK", "8HuUY1QQHQ0NCEdd", "Jtx6GV01vD7lNLxl"], "idsToBeExported": ["pvqaB9P9GaukfCEI", "eSBLhTfzigzHcRuJ", "gYaj4I8Dzyh1N0JE"], "storeId": "KNoMtHvjM7X1fjzk"}' \
    > test.out 2>&1
eval_tap $? 215 'ExportStoreByCSV' test.out

#- 216 ImportStore
eval_tap 0 216 'ImportStore # SKIP deprecated' test.out

#- 217 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 217 'GetPublishedStore' test.out

#- 218 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 218 'DeletePublishedStore' test.out

#- 219 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 219 'GetPublishedStoreBackup' test.out

#- 220 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 220 'RollbackPublishedStore' test.out

#- 221 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nv2HZMIL2P2bh14L' \
    > test.out 2>&1
eval_tap $? 221 'GetStore' test.out

#- 222 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'roFTnAuujPeP9N0v' \
    --body '{"defaultLanguage": "dVB5a2XkS3XQfMuz", "defaultRegion": "Zh4AhZRe2hgU56xt", "description": "yJtnbTDXu7FbleSP", "supportedLanguages": ["5PcdOuq0m0rvakR8", "rcwojLRjhcaJ56nG", "lYZ2tod2BGBXjNyR"], "supportedRegions": ["CtPOr1FU3QZy3gdD", "ms3kb1htW0UGJpwQ", "ZlXuzu3m9u67JjCD"], "title": "wg186hGWKfO9MnoT"}' \
    > test.out 2>&1
eval_tap $? 222 'UpdateStore' test.out

#- 223 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '3t99HmcxzjDhTrcB' \
    > test.out 2>&1
eval_tap $? 223 'DeleteStore' test.out

#- 224 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'KtU956hOg8oukDVd' \
    --action 'DELETE' \
    --itemSku '7M36mI9u3EeZtLQi' \
    --itemType 'CODE' \
    --limit '58' \
    --offset '34' \
    --selected  \
    --sortBy 'createdAt,updatedAt:asc,updatedAt:desc' \
    --status 'UNPUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'qdXfhZTTaCeqGv7m' \
    --updatedAtStart 'euQhJuq1C6JHkWMS' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 224 'QueryChanges' test.out

#- 225 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UbqByWN2BCnRz9w2' \
    > test.out 2>&1
eval_tap $? 225 'PublishAll' test.out

#- 226 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'nur0B9jKaunAcyls' \
    > test.out 2>&1
eval_tap $? 226 'PublishSelected' test.out

#- 227 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'au7wRQmL4i3eRyIE' \
    > test.out 2>&1
eval_tap $? 227 'SelectAllRecords' test.out

#- 228 SelectAllRecordsByCriteria
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
eval_tap $? 228 'SelectAllRecordsByCriteria' test.out

#- 229 GetStatistic
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
eval_tap $? 229 'GetStatistic' test.out

#- 230 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xVWlIMY5tTJw4KV1' \
    > test.out 2>&1
eval_tap $? 230 'UnselectAllRecords' test.out

#- 231 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId '04MtMhKHmSjqPuQZ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'X5KjdNrEwfWo2Mwu' \
    > test.out 2>&1
eval_tap $? 231 'SelectRecord' test.out

#- 232 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'lLg4bsO4YHEYLjTS' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NDf3zazm6p5Y1tkG' \
    > test.out 2>&1
eval_tap $? 232 'UnselectRecord' test.out

#- 233 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '9WwU4Ty6Ch5QYyFj' \
    --targetStoreId 'uBquE7xssm4hxczs' \
    > test.out 2>&1
eval_tap $? 233 'CloneStore' test.out

#- 234 ExportStore
eval_tap 0 234 'ExportStore # SKIP deprecated' test.out

#- 235 QueryImportHistory
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
eval_tap $? 235 'QueryImportHistory' test.out

#- 236 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'oNGtvyk5xEfrJDxK' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes 'sw5Xl7ZZrDZdbuvC' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 236 'ImportStoreByCSV' test.out

#- 237 QuerySubscriptions
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
eval_tap $? 237 'QuerySubscriptions' test.out

#- 238 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'WchzXDv3TAtBjP4H' \
    > test.out 2>&1
eval_tap $? 238 'RecurringChargeSubscription' test.out

#- 239 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'SuiYCbG0UyYUJmNL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 239 'GetTicketDynamic' test.out

#- 240 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName '8p6AbdtU0CDrlQpK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "B8qoel2QK3aSOYdm"}' \
    > test.out 2>&1
eval_tap $? 240 'DecreaseTicketSale' test.out

#- 241 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'MDikc3Fjm9HoQDem' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 241 'GetTicketBoothID' test.out

#- 242 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'tiQvURYZCeF30RT9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 36, "orderNo": "Adel3hHMSLAiscGR"}' \
    > test.out 2>&1
eval_tap $? 242 'IncreaseTicketSale' test.out

#- 243 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "System", "count": 52, "currencyCode": "VDCBcvVegrZddP8l", "expireAt": "1990-08-24T00:00:00Z"}, "debitPayload": {"count": 87, "currencyCode": "EPjbUy7F82Adu9BY", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 80, "entitlementCollectionId": "rVTehrqgvEtEs2Lp", "entitlementOrigin": "Steam", "itemIdentity": "jTyRd3LrR1x6U1v6", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 47, "entitlementId": "SLjm9zmzUW0vPj90"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 91, "currencyCode": "LTt5YQGawcomPoiY", "expireAt": "1978-12-15T00:00:00Z"}, "debitPayload": {"count": 8, "currencyCode": "1f1AYq306Pysv4VP", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 99, "entitlementCollectionId": "rpn0vAD9YsPeDWrA", "entitlementOrigin": "IOS", "itemIdentity": "ZSvgWuCuLsUGrVQA", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 16, "entitlementId": "3g62oGYwkrjLI4EH"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 62, "currencyCode": "KtfXCKOna8DdjtZh", "expireAt": "1975-05-01T00:00:00Z"}, "debitPayload": {"count": 10, "currencyCode": "wdCpVpnENiTc9NES", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 9, "entitlementCollectionId": "lmV3kES0Hi88UYgS", "entitlementOrigin": "Steam", "itemIdentity": "40OvY7apPCrN5bEh", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 96, "entitlementId": "uHgKeWizEpw1zN0m"}, "type": "CREDIT_WALLET"}], "userId": "gGhHMz9dddLWJWDu"}, {"operations": [{"creditPayload": {"balanceOrigin": "Oculus", "count": 40, "currencyCode": "vLyH9kcSBdk7MwQz", "expireAt": "1978-08-01T00:00:00Z"}, "debitPayload": {"count": 27, "currencyCode": "8Le5neohqhCzroAz", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 88, "entitlementCollectionId": "hJoT0WK5ngNUxDKf", "entitlementOrigin": "Playstation", "itemIdentity": "YofPGUbSaA00nKxQ", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 2, "entitlementId": "YU6KlavIiLxU2I1G"}, "type": "REVOKE_ENTITLEMENT"}, {"creditPayload": {"balanceOrigin": "Twitch", "count": 4, "currencyCode": "S48Hxu8Ju4XSAnlX", "expireAt": "1993-12-11T00:00:00Z"}, "debitPayload": {"count": 56, "currencyCode": "rJ0f5lwXvRNDBnmL", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "rW1qx3NJTugVWXz8", "entitlementOrigin": "Epic", "itemIdentity": "6mLBordrJkD6vy60", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 88, "entitlementId": "UAJIHEZv5zyUUyNJ"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Other", "count": 48, "currencyCode": "A5xF3zHtZSd3QzXh", "expireAt": "1976-12-15T00:00:00Z"}, "debitPayload": {"count": 36, "currencyCode": "zOidrWnLrXqImgDf", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 66, "entitlementCollectionId": "1YfIgLZ4YIzElrLZ", "entitlementOrigin": "Xbox", "itemIdentity": "1e1825iasunESjcg", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 65, "entitlementId": "2drXG5NkKCySLA8c"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "Cs0dFYRSa2OULZ0i"}, {"operations": [{"creditPayload": {"balanceOrigin": "Xbox", "count": 67, "currencyCode": "ZJiOAh1SpLhMF2Pa", "expireAt": "1982-04-09T00:00:00Z"}, "debitPayload": {"count": 14, "currencyCode": "FuU8iXCRz8Kgqgwi", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 17, "entitlementCollectionId": "YxpGhsFArq6lolbj", "entitlementOrigin": "Xbox", "itemIdentity": "QKvtVRCPMjr5M3vw", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 66, "entitlementId": "3Z4pgyJYwclb4gd4"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Oculus", "count": 86, "currencyCode": "SECsypS42NmYQ8Hl", "expireAt": "1988-05-17T00:00:00Z"}, "debitPayload": {"count": 2, "currencyCode": "wqytieXpIZfr5XDq", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 7, "entitlementCollectionId": "iKd9vLPP0w52JRAZ", "entitlementOrigin": "Playstation", "itemIdentity": "qPNDqWrpkWnnova1", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 99, "entitlementId": "YLge851PbK2MFKvw"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 99, "currencyCode": "yq3I1BLtGEZDRNkk", "expireAt": "1999-08-25T00:00:00Z"}, "debitPayload": {"count": 86, "currencyCode": "JUofJXK8RGS0zCYR", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "bfzwUmsy0stUmKdX", "entitlementOrigin": "IOS", "itemIdentity": "oLWDPSZexfKVxqdx", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 69, "entitlementId": "h5QWxuQuI7gdDTDb"}, "type": "CREDIT_WALLET"}], "userId": "7iXEEM2KOusNEHcI"}], "metadata": {"95GGdJvucDbs6Udc": {}, "cuM2ykRj3WnyAaUa": {}, "QBKFedL2uduXvZUb": {}}, "needPreCheck": true, "transactionId": "13FhD3NExUFipJsU", "type": "iDawAjgHFQk0VzWR"}' \
    > test.out 2>&1
eval_tap $? 243 'Commit' test.out

#- 244 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '9' \
    --status 'SUCCESS' \
    --type 'sipbP027okM5E8tA' \
    --userId 'ajVSvLRj306RDuaS' \
    > test.out 2>&1
eval_tap $? 244 'GetTradeHistoryByCriteria' test.out

#- 245 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'ixXEdloYZBkatNLc' \
    > test.out 2>&1
eval_tap $? 245 'GetTradeHistoryByTransactionId' test.out

#- 246 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId '42eq0O6VsXtOlQwj' \
    --body '{"achievements": [{"id": "5xPvm7c5nPR0Y1sf", "value": 10}, {"id": "9FSeg6WYgtfuqJHr", "value": 37}, {"id": "QtKgyIeySoUxoMrj", "value": 45}], "steamUserId": "J4JGQZAtyjTxnlmS"}' \
    > test.out 2>&1
eval_tap $? 246 'UnlockSteamUserAchievement' test.out

#- 247 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjEaFH2DRN6HIEqI' \
    --xboxUserId 'FEcS0ynIMOYWpUYU' \
    > test.out 2>&1
eval_tap $? 247 'GetXblUserAchievements' test.out

#- 248 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'QMooiKT57rmbjEni' \
    --body '{"achievements": [{"id": "meR7EFBz43E9FkOP", "percentComplete": 98}, {"id": "FqvfDG5jvMOaXrDl", "percentComplete": 63}, {"id": "bBd5wb5H3qppoCiH", "percentComplete": 80}], "serviceConfigId": "q0kIbrJ2S5Pf1Lvg", "titleId": "8kYEVylINJpxFY8E", "xboxUserId": "6pU8eHjh0aTjIOaQ"}' \
    > test.out 2>&1
eval_tap $? 248 'UpdateXblUserAchievement' test.out

#- 249 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 't0snbE0yMvqF7TJ9' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeCampaign' test.out

#- 250 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'uB0zypjJiu7BIimN' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeEntitlement' test.out

#- 251 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'uwB3hBVhuSMHhf5R' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeFulfillment' test.out

#- 252 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId '2MkxQTAYGfE6hXZ7' \
    > test.out 2>&1
eval_tap $? 252 'AnonymizeIntegration' test.out

#- 253 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'XLoWCGf0dZEeXBd6' \
    > test.out 2>&1
eval_tap $? 253 'AnonymizeOrder' test.out

#- 254 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'mGG6SHcZbX2wNnT6' \
    > test.out 2>&1
eval_tap $? 254 'AnonymizePayment' test.out

#- 255 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9zosmDnXoncy7NZ' \
    > test.out 2>&1
eval_tap $? 255 'AnonymizeRevocation' test.out

#- 256 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q4PkAPXBCfkE1Fb0' \
    > test.out 2>&1
eval_tap $? 256 'AnonymizeSubscription' test.out

#- 257 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'y94eP7yh0zsKhR60' \
    > test.out 2>&1
eval_tap $? 257 'AnonymizeWallet' test.out

#- 258 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'HZwUwk48XK7MXHbE' \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 258 'GetUserDLCByPlatform' test.out

#- 259 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'VB7cNzHhvxc4xAPZ' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 259 'GetUserDLC' test.out

#- 260 QueryUserEntitlements
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
eval_tap $? 260 'QueryUserEntitlements' test.out

#- 261 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'DFcmOm1sqdIWU6ER' \
    --body '[{"collectionId": "ylESgf5dXMrPoYSo", "endDate": "1974-04-16T00:00:00Z", "grantedCode": "frLyXMSrC62xYtDw", "itemId": "flNGfufW5cWeg6eS", "itemNamespace": "CypsceITTkJGGCVF", "language": "nS_571", "metadata": {"zmDAaW5xz1c7ZuZX": {}, "UCBYnkY0LEBSYBdU": {}, "SiTOrhB8hVs29WOK": {}}, "origin": "Nintendo", "quantity": 90, "region": "3YlJ93CCGBXv4fP4", "source": "OTHER", "startDate": "1992-06-28T00:00:00Z", "storeId": "zhcH4UJrrCKvrOAi"}, {"collectionId": "7lMgkVWJYzSCIDxW", "endDate": "1995-04-01T00:00:00Z", "grantedCode": "xgOzeRNHIqK5PT40", "itemId": "4mFw4HJv5T2kIQOe", "itemNamespace": "cfLsYKTmUnKlrOsJ", "language": "fG_boqx-586", "metadata": {"imJHNI0l6jJVzF1O": {}, "i2sQuWUBBHZonSmz": {}, "F831vlCiZAZHCWMX": {}}, "origin": "Other", "quantity": 90, "region": "Vh8HTrKqVwnpPn8N", "source": "PURCHASE", "startDate": "1974-11-14T00:00:00Z", "storeId": "JQq94Re5IM1akNKz"}, {"collectionId": "9IltQUku3n32atB0", "endDate": "1992-11-16T00:00:00Z", "grantedCode": "PQPEp5UtwUWGt6to", "itemId": "oHP5kAww01zalTdd", "itemNamespace": "hAQ1pwqnybvUIfuu", "language": "IM", "metadata": {"Zqz5NSp0B7LODN3B": {}, "oi2sSAO2n4MZQt75": {}, "3XQB93rOW0guPoQb": {}}, "origin": "GooglePlay", "quantity": 51, "region": "F0xtQAXoDoFkmA3f", "source": "GIFT", "startDate": "1971-07-29T00:00:00Z", "storeId": "uqUuyW3cMz9YyduM"}]' \
    > test.out 2>&1
eval_tap $? 261 'GrantUserEntitlement' test.out

#- 262 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'omEHcU15St4v8ry8' \
    --activeOnly  \
    --appId 'IyqNVv0KVpXJTMx3' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementByAppId' test.out

#- 263 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y8Um1iqehObg3OZ9' \
    --activeOnly  \
    --limit '19' \
    --offset '62' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 263 'QueryUserEntitlementsByAppType' test.out

#- 264 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'opeHD6iKBGm5Cj7R' \
    --ids 'qnJUmfDmofxvN8pR,GoUtmbWZbEjPyq35,BWDoc3qNcQFFyHv1' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementsByIds' test.out

#- 265 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '41NPqjRUMKSQjFdj' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'sEHvSxjWoM1rNJLM' \
    --itemId '0OOVG5cG6XxENbWq' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementByItemId' test.out

#- 266 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'lX7idzjpKDfwl6Xl' \
    --ids 'CF6YxFMD8tJQwZvU,VInos5RK100yH89i,8ZDPXRL8cbTAntB1' \
    --platform 'STaab1UeibXg7RCe' \
    > test.out 2>&1
eval_tap $? 266 'GetUserActiveEntitlementsByItemIds' test.out

#- 267 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId '5BtKcwj6PqqOgCim' \
    --activeOnly  \
    --entitlementClazz 'ENTITLEMENT' \
    --platform 'Kx6ByTygbtOtcQS4' \
    --sku 'Cmgw1wRUnIVYxY6O' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementBySku' test.out

#- 268 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'hdkrYiCinoVOzo4P' \
    --appIds 'lv1IlTpEhjTFYdzs,UNvQAn2LuMjLqwmV,z3zKsfjz1mFkyxoU' \
    --itemIds 'zfMFoXCOguSq2A4R,3wDdSkNfHJtA3QiX,9ZvtydbaVb0scd97' \
    --platform 'A0GP6djn2Ps3IVT5' \
    --skus 'hUZ3cnDq0ddZG0Ep,fGAqHKcSxUc2YgRp,k2IFGIgIpscUpVAc' \
    > test.out 2>&1
eval_tap $? 268 'ExistsAnyUserActiveEntitlement' test.out

#- 269 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'iu2XPPUxzXHUvxhv' \
    --platform 'TZcvRKoaM4ozSAg8' \
    --itemIds 'FTLrByWOJhbocoGl,PzdfxcC3rpWhSpq0,InxMLpP7n7M3JXjE' \
    > test.out 2>&1
eval_tap $? 269 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 270 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vsj5WcQ99M1yuXeq' \
    --appId 'V31LX2ehcMnM6Qtj' \
    > test.out 2>&1
eval_tap $? 270 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 271 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'zQjDlUMCGnxZwak7' \
    --entitlementClazz 'MEDIA' \
    --platform 'Dokltgq2vXtUnY6U' \
    --itemId 'hDJ4pe0s0Cuhl3dU' \
    > test.out 2>&1
eval_tap $? 271 'GetUserEntitlementOwnershipByItemId' test.out

#- 272 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '9b4seYCyiB4tDCWx' \
    --ids '3cEX8wTi1v2abpCW,ytPEi9Ze0hL9rPkV,5GkSrcl2O47XVzU7' \
    --platform 'qlNVk7qnmBS3XKDh' \
    > test.out 2>&1
eval_tap $? 272 'GetUserEntitlementOwnershipByItemIds' test.out

#- 273 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'p1OkMcErmeH0lX1h' \
    --entitlementClazz 'CODE' \
    --platform '3XgTRTjI9oNBzgQ4' \
    --sku 'CRwg0sKVeSpMny0G' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementOwnershipBySku' test.out

#- 274 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'rvKI5EVB9ZFzLNsj' \
    > test.out 2>&1
eval_tap $? 274 'RevokeAllEntitlements' test.out

#- 275 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'dCFtKY0KsxR0rCFk' \
    --entitlementIds 'yiQZfMnTbKdwNhiI' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlements' test.out

#- 276 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'P7dpJ8B8VwFQnVco' \
    --namespace "$AB_NAMESPACE" \
    --userId '2oCn1KvJmbjapW9U' \
    > test.out 2>&1
eval_tap $? 276 'GetUserEntitlement' test.out

#- 277 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'lEqtzDd7SgxdxB5k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vtM8ah9bPsksceGU' \
    --body '{"collectionId": "EX8ERZcKSYLo6y7y", "endDate": "1989-11-13T00:00:00Z", "nullFieldList": ["XLIg3MgmdSvWp3h0", "xPsVY8qNwB2TY4v9", "NNfQSYLFKSl3FNFF"], "origin": "Twitch", "reason": "JSa5cRn31D8ubfdX", "startDate": "1975-04-23T00:00:00Z", "status": "SOLD", "useCount": 56}' \
    > test.out 2>&1
eval_tap $? 277 'UpdateUserEntitlement' test.out

#- 278 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId '816aH6gOBUIMeL0G' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L3aefSDME8X2MxIL' \
    --body '{"metadata": {"I42BJMPkZmay4Csy": {}, "e3iJLtjsu6ZJRCoD": {}, "q3geuHFFaZzPIjET": {}}, "options": ["qcKN1gaQ4Bn0cPPt", "KaJlw31pdDrXQ47W", "SGyDCKF0LLhO3lGZ"], "platform": "7eGOPj2XoFug8BUQ", "requestId": "UmPHnPumcazKAna0", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 278 'ConsumeUserEntitlement' test.out

#- 279 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'ZM28w4mnYvvlt1es' \
    --namespace "$AB_NAMESPACE" \
    --userId '7A4PFduN4gx0UC6e' \
    > test.out 2>&1
eval_tap $? 279 'DisableUserEntitlement' test.out

#- 280 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'WKCFGS97Si6XyLVP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rkUxyZ1OH5Nn4nMT' \
    > test.out 2>&1
eval_tap $? 280 'EnableUserEntitlement' test.out

#- 281 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId '8QOyTuUSD9ImtaPA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ocOQcpBWSNrCjSNE' \
    > test.out 2>&1
eval_tap $? 281 'GetUserEntitlementHistories' test.out

#- 282 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'AdojkCMmYyTGO07f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oRZ6FujpIWo0qJtq' \
    --body '{"metadata": {"p4Q6XgICLgMHcP1e": {}, "E6sjWQllYsONpp6Q": {}, "GW56CNiszHE69D1M": {}}}' \
    > test.out 2>&1
eval_tap $? 282 'RevokeUserEntitlement' test.out

#- 283 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'Moaf6KlgRtwaM2Io' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yY1wpIdjcAtTj1IM' \
    --body '{"reason": "uuhxxlulfmya73hX", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 283 'RevokeUserEntitlementByUseCount' test.out

#- 284 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'a8Ri85PA9wNpmrK5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y5heA2ewWnFcqHxX' \
    --quantity '85' \
    > test.out 2>&1
eval_tap $? 284 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 285 RevokeUseCount
eval_tap 0 285 'RevokeUseCount # SKIP deprecated' test.out

#- 286 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'XeqO8gY3c4SryWB4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yRaDxvxwaLM8HkVO' \
    --body '{"platform": "W8PnLkgqkqYZWPZT", "requestId": "gKagTzdcYcko7U3g", "useCount": 70}' \
    > test.out 2>&1
eval_tap $? 286 'SellUserEntitlement' test.out

#- 287 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'Msl7zrNJvDiP2hNN' \
    --body '{"duration": 63, "endDate": "1971-10-15T00:00:00Z", "entitlementCollectionId": "6VgA5yFIH3s9Uyea", "entitlementOrigin": "System", "itemId": "gyCUpM1JBcTzf4dz", "itemSku": "1BojPoQg976409vF", "language": "d5z9r4nJWUvLp1wx", "metadata": {"GF747468MXUq3uIf": {}, "fkIpPmrWVxNZUvki": {}, "U2jXSwsBBRopVl38": {}}, "order": {"currency": {"currencyCode": "d4NZGtk6EmWxC75M", "currencySymbol": "88TKhFYkA9aRNDe2", "currencyType": "VIRTUAL", "decimals": 30, "namespace": "HurgOfba1XeoHYTN"}, "ext": {"oRol84UlkxtP5Vok": {}, "9sNK1ORg3tChsS3f": {}, "FpaS1uq1mH3oYfPK": {}}, "free": true}, "orderNo": "QiAUhIfi17YrkWHN", "origin": "Playstation", "overrideBundleItemQty": {"XBfgBLuglkd9LIos": 15, "L0fJOPYpnPqGlPnh": 56, "YY1vlV0M2g6oreqy": 57}, "quantity": 53, "region": "jfyDbtIXICLkK8Zv", "source": "ACHIEVEMENT", "startDate": "1977-07-16T00:00:00Z", "storeId": "Tg3znlg8nmzQx1Rs"}' \
    > test.out 2>&1
eval_tap $? 287 'FulfillItem' test.out

#- 288 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'YhcRlv16Wwe8YK3l' \
    --body '{"code": "ZFslECI9QzuQcsjF", "language": "Hj-Cvve_465", "region": "NgN7GoeMsezFZsTB"}' \
    > test.out 2>&1
eval_tap $? 288 'RedeemCode' test.out

#- 289 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'HkgcJ0DcEt23pci6' \
    --body '{"itemId": "xEljer6aGJx5OFp3", "itemSku": "jKEx4aSGdwTPX4ig", "quantity": 81}' \
    > test.out 2>&1
eval_tap $? 289 'PreCheckFulfillItem' test.out

#- 290 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'xttUz8nWKJjv06Pu' \
    --body '{"entitlementCollectionId": "ffHghAQfAsYXVzBe", "entitlementOrigin": "Nintendo", "metadata": {"4wM9WZfOOxAzmsbh": {}, "i5QJuc2SNBaOlXfg": {}, "sgBd7MYLLoPZrkjR": {}}, "origin": "Nintendo", "rewards": [{"currency": {"currencyCode": "SwZw2UkjDzJ4NuMM", "namespace": "gI13nplXaUQV5QEv"}, "item": {"itemId": "KElLfbB7gwwAR1xF", "itemName": "rnyirw3iJt5iA3JS", "itemSku": "2xeaJ08JrSHPqdhK", "itemType": "Hn6ZjZMdr1C2TIQz"}, "quantity": 89, "type": "CURRENCY"}, {"currency": {"currencyCode": "fPy5fpbbbMIu9lu1", "namespace": "8jIMBUM77XmemN8L"}, "item": {"itemId": "O03mnFSq9jJTVFoF", "itemName": "jxZjh5qUR1Pq4a4u", "itemSku": "aMfd0SQAfYIyzHL8", "itemType": "jxakuVu5r5B08VZx"}, "quantity": 72, "type": "CURRENCY"}, {"currency": {"currencyCode": "apnZXoJ4gI4EQKO8", "namespace": "xC4D0FsUo3IB2kX5"}, "item": {"itemId": "REQZsHyXzoIXNf0K", "itemName": "bL9HyJttdgfLGO3u", "itemSku": "mmpllnV6B62P1Kaz", "itemType": "g73c6UpmA4ehxNII"}, "quantity": 22, "type": "ITEM"}], "source": "CONSUME_ENTITLEMENT", "transactionId": "AmkanukAzAMaRvIU"}' \
    > test.out 2>&1
eval_tap $? 290 'FulfillRewards' test.out

#- 291 QueryUserIAPOrders
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
eval_tap $? 291 'QueryUserIAPOrders' test.out

#- 292 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'b7G5FDX4mu0qPHb9' \
    > test.out 2>&1
eval_tap $? 292 'QueryAllUserIAPOrders' test.out

#- 293 QueryUserIAPConsumeHistory
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
eval_tap $? 293 'QueryUserIAPConsumeHistory' test.out

#- 294 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6DyED4prRVibTATx' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "XnAa_VC", "productId": "QYBO8m0HgTth479W", "region": "8rXqwGVIRWgTNHCk", "transactionId": "a3Wb5kH1BrLWUetP", "type": "OCULUS"}' \
    > test.out 2>&1
eval_tap $? 294 'MockFulfillIAPItem' test.out

#- 295 AdminSyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform adminSyncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nz2IUEHMzl5jhwVD' \
    --body '{"skus": ["suzwJ4v50eoaIBrT", "h0EKkJioUpvGnkcH", "gCfaWzPUvCnfqsPG"]}' \
    > test.out 2>&1
eval_tap $? 295 'AdminSyncOculusSubscriptions' test.out

#- 296 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'gJZyRwigaMu07Zek' \
    --namespace "$AB_NAMESPACE" \
    --userId '8WObpf0FHYfViEj7' \
    > test.out 2>&1
eval_tap $? 296 'AdminGetIAPOrderLineItems' test.out

#- 297 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '0KYKIfFt4GYjUt4F' \
    > test.out 2>&1
eval_tap $? 297 'AdminSyncSteamAbnormalTransaction' test.out

#- 298 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZVy2qFfSr3psWjO' \
    --body '{"orderId": "yHLyKe2foqsVIfgB"}' \
    > test.out 2>&1
eval_tap $? 298 'AdminSyncSteamIAPByTransaction' test.out

#- 299 QueryUserThirdPartySubscription
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
eval_tap $? 299 'QueryUserThirdPartySubscription' test.out

#- 300 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'GNH2K0UuJdeGNquQ' \
    --groupId 'naXpDQ5rU2taDWh9' \
    > test.out 2>&1
eval_tap $? 300 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 301 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'TWITCH' \
    --userId 'V5oc5IFQsrwHqFqw' \
    --productId 'VA5mozeeOjIFQfXV' \
    > test.out 2>&1
eval_tap $? 301 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 302 QueryUserThirdPartySubscriptionTransactions
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
eval_tap $? 302 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 303 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id '7uAojLYBsx8oqMzb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'E0ljQaBtb47V691j' \
    > test.out 2>&1
eval_tap $? 303 'GetThirdPartySubscriptionDetails' test.out

#- 304 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id '0FZp2vjOXptxzx6k' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kaZYpl52sQR9Znp5' \
    --limit '7' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 304 'GetSubscriptionHistory' test.out

#- 305 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id '1eSwrG2GBBEWrDbQ' \
    --namespace "$AB_NAMESPACE" \
    --userId '1ZzhDuLHq9LTBstg' \
    > test.out 2>&1
eval_tap $? 305 'SyncSubscriptionTransaction' test.out

#- 306 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'uOdN0O7l3GbKPHdD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQDEEE2mTsn1NwJ7' \
    > test.out 2>&1
eval_tap $? 306 'GetThirdPartyUserSubscriptionDetails' test.out

#- 307 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id '1szsNmnqZSWdEyOV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YrTdDq7IqbTVv8BL' \
    > test.out 2>&1
eval_tap $? 307 'SyncSubscription' test.out

#- 308 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'sqQW8HSrEm5Y7jI2' \
    --discounted  \
    --itemId '32SjktijiNzTUe8K' \
    --limit '7' \
    --offset '55' \
    --status 'CHARGED' \
    > test.out 2>&1
eval_tap $? 308 'QueryUserOrders' test.out

#- 309 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'fw61kyKk0UXUF252' \
    --body '{"currencyCode": "3OTvOmfVNJNDaSO3", "currencyNamespace": "FEkk4It6V8Bu7rIj", "discountCodes": ["uXTrpWAjwatSvtPb", "GrxUMKbv60ixUuUh", "opdqGrqRZ124P7Pa"], "discountedPrice": 54, "entitlementPlatform": "Other", "ext": {"Fn8oWQcmFkkRX6Eq": {}, "adAEIzxld80Ynss7": {}, "hc3VUxxZIgkTLqMe": {}}, "itemId": "JPCbs8jWmTteJhwN", "language": "bwHGG39YAZJ4HuLf", "options": {"skipPriceValidation": false}, "platform": "GooglePlay", "price": 1, "quantity": 64, "region": "IDKn9qJXncm5igpA", "returnUrl": "ewbmnWk0E7YaPblc", "sandbox": true, "sectionId": "EyNgvs5LEZrQXzSQ"}' \
    > test.out 2>&1
eval_tap $? 309 'AdminCreateUserOrder' test.out

#- 310 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'RWRs9EGnRPgYlJEl' \
    --itemId 'gJ8kx1WEeDbql13F' \
    > test.out 2>&1
eval_tap $? 310 'CountOfPurchasedItem' test.out

#- 311 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tQMu41rnOzbsFBqg' \
    --userId '6dziWvdNcwfUBMdN' \
    > test.out 2>&1
eval_tap $? 311 'GetUserOrder' test.out

#- 312 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'uTaiLxFMXRpDP9xu' \
    --userId 'tntU8xHw4yYJOCVi' \
    --body '{"status": "REFUNDED", "statusReason": "M5JXvPdzEpDln04F"}' \
    > test.out 2>&1
eval_tap $? 312 'UpdateUserOrderStatus' test.out

#- 313 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '8BQjzobhDa8VxKOr' \
    --userId 'fVfBRIfkStOqdXqh' \
    > test.out 2>&1
eval_tap $? 313 'FulfillUserOrder' test.out

#- 314 GetUserOrderGrant
eval_tap 0 314 'GetUserOrderGrant # SKIP deprecated' test.out

#- 315 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'DMQ6tBLljC7gcT3M' \
    --userId '1DArk4L80aXFY7SQ' \
    > test.out 2>&1
eval_tap $? 315 'GetUserOrderHistories' test.out

#- 316 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'kym9KvKMHK5fbqio' \
    --userId 'eoRIplY0DIzRCNAO' \
    --body '{"additionalData": {"cardSummary": "6ZpqXJmPJso6M11L"}, "authorisedTime": "1990-07-27T00:00:00Z", "chargebackReversedTime": "1997-04-11T00:00:00Z", "chargebackTime": "1996-01-03T00:00:00Z", "chargedTime": "1990-02-23T00:00:00Z", "createdTime": "1996-01-14T00:00:00Z", "currency": {"currencyCode": "xn9YL16HQdtAneXG", "currencySymbol": "gxNg33ZIUrIkfmdX", "currencyType": "REAL", "decimals": 44, "namespace": "wR3MeCNL1oNrF3Sm"}, "customParameters": {"gudQusJLsPlW7ZyO": {}, "RFkN9EbKbTbrDzNg": {}, "VEcw0lxRam16O6v4": {}}, "extOrderNo": "VjJf40LjUdORELVX", "extTxId": "UFQyVlt9jmxmxpfp", "extUserId": "41k1uDg59PhdUXSh", "issuedAt": "1971-01-14T00:00:00Z", "metadata": {"bwyYCxTHrDel8oTh": "vr8CUEzw4zL1QeR3", "EYXBFpUX9y4tY7o5": "FFi1n10vDgyoHXIl", "rMl2RAukCL26ihdM": "y9YCLNJEkvq6SUSt"}, "namespace": "8xd8EgE15XNuw6Y7", "nonceStr": "sToQNkuZzJ1XBxw0", "paymentData": {"discountAmount": 63, "discountCode": "iBBQukgQ94ZvPCWc", "subtotalPrice": 79, "tax": 92, "totalPrice": 75}, "paymentMethod": "ov3U2sKjIeyFS97d", "paymentMethodFee": 98, "paymentOrderNo": "D7LkcTKYpCfl6HPy", "paymentProvider": "ADYEN", "paymentProviderFee": 70, "paymentStationUrl": "JfAV5iOfzwt3bpxR", "price": 81, "refundedTime": "1974-06-12T00:00:00Z", "salesTax": 80, "sandbox": false, "sku": "HGGedk0KzXRclOXd", "status": "REFUNDING", "statusReason": "Fn8TvZVTe4L2lXrV", "subscriptionId": "PX6r5ZTcnVVOKMAp", "subtotalPrice": 93, "targetNamespace": "9oswEPTvzwwGnpbx", "targetUserId": "8MCIjKzylqW8auys", "tax": 10, "totalPrice": 86, "totalTax": 68, "txEndTime": "1990-07-02T00:00:00Z", "type": "PO4ozK705ykRqSPY", "userId": "ZgPm4JLsXVtBOEet", "vat": 69}' \
    > test.out 2>&1
eval_tap $? 316 'ProcessUserOrderNotification' test.out

#- 317 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo '2V3baMkZ9JCqBIkU' \
    --userId 'ID0EE9InZNLwwAhW' \
    > test.out 2>&1
eval_tap $? 317 'DownloadUserOrderReceipt' test.out

#- 318 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId '2b5OHKtUv4lTkQNj' \
    --body '{"currencyCode": "xhXdj1CG0EBgst9Q", "currencyNamespace": "u8Ofl2oB8VTjF0pD", "customParameters": {"3NHU8iYUOtG5gbQS": {}, "KW2MdgCH4bWxRF6f": {}, "BPa6GOuV5z0p8jaJ": {}}, "description": "s2duQqawPrxi6F4e", "extOrderNo": "lhy9CZ94CAUVW8Fo", "extUserId": "Ef8tjCjWc22qqDfN", "itemType": "LOOTBOX", "language": "rJBj-ekri", "metadata": {"3k54cExxWKtdGTW4": "FILotv5ycTa0i6if", "YP1zfgjsy3VRjX4q": "A4g9OGoWw1qnCAvd", "nAcokJ0rzqX2KJcY": "HgiFDxclBXap6j73"}, "notifyUrl": "doCWxhubMXbxNvT6", "omitNotification": true, "platform": "5gBQlVDx9neFHWhD", "price": 90, "recurringPaymentOrderNo": "NIefCmtrxWu29355", "region": "1nQBNKcqCkUXRj8g", "returnUrl": "QHEe4CO370OsbzRK", "sandbox": true, "sku": "Pd6mjzLxllUrFYn7", "subscriptionId": "cSuO7NxKHUHg0c4X", "title": "7fHdITmN9opaF0kh"}' \
    > test.out 2>&1
eval_tap $? 318 'CreateUserPaymentOrder' test.out

#- 319 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '3pCRB3infEVxArF7' \
    --userId 'TB6A6a71zAJpaPeu' \
    --body '{"description": "dUtKPJUmAvxBxJNP"}' \
    > test.out 2>&1
eval_tap $? 319 'RefundUserPaymentOrder' test.out

#- 320 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'lvvYZw4MWzWFTuNP' \
    > test.out 2>&1
eval_tap $? 320 'GetUserPlatformAccountClosureHistories' test.out

#- 321 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'f5JCSDyYy4e5qoTZ' \
    --body '{"code": "xSoZbQUnUxS6m68W", "orderNo": "L3HDL4yx5I0euBsc"}' \
    > test.out 2>&1
eval_tap $? 321 'ApplyUserRedemption' test.out

#- 322 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'cHPA2v9XP9enfEX7' \
    --body '{"meta": {"lloLgIYqxFfSNJlH": {}, "CjxLNnYUlGQsFpy9": {}, "ZVlLIFwLgT78noot": {}}, "reason": "fUs9559ilm3cauhr", "requestId": "w9Yn2z5cnbm7z2Aa", "revokeEntries": [{"currency": {"balanceOrigin": "IOS", "currencyCode": "4yBTw3wfNGyWf3Vu", "namespace": "jS7Bq5bcfPW4pPZB"}, "entitlement": {"entitlementId": "9YXltCxyztUnj17t"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "Th5mOwPCPKVPlOGf", "itemIdentityType": "ITEM_ID", "origin": "Steam"}, "quantity": 40, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "u2ZP0IkiYXGk6BoB", "namespace": "mSLi0R7zDFMoNTQm"}, "entitlement": {"entitlementId": "lS8lMlY8UjprhCxh"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "YycDH5we2Mx0sYCn", "itemIdentityType": "ITEM_SKU", "origin": "Xbox"}, "quantity": 58, "type": "ITEM"}, {"currency": {"balanceOrigin": "Epic", "currencyCode": "i4mxc14iRfzJwKuc", "namespace": "7EpiQEzz5N5osRYO"}, "entitlement": {"entitlementId": "7wbYh7q02W8tkTUR"}, "item": {"entitlementOrigin": "System", "itemIdentity": "0k2smdkBS2MaIP7P", "itemIdentityType": "ITEM_ID", "origin": "Nintendo"}, "quantity": 23, "type": "CURRENCY"}], "source": "ORDER", "transactionId": "EFggq91cpgvoDBgY"}' \
    > test.out 2>&1
eval_tap $? 322 'DoRevocation' test.out

#- 323 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'fLBdGNAZEvbvxqa0' \
    --body '{"gameSessionId": "K7VUbjUnzirnEsxS", "payload": {"E4vBzG7VK8sWEshm": {}, "Zf5fEdvjbyJPQ1qd": {}, "RcJjsme1OukIfIZV": {}}, "scid": "H8q8svV5hMOSfpyJ", "sessionTemplateName": "kJlmJmTkFvB7wkY6"}' \
    > test.out 2>&1
eval_tap $? 323 'RegisterXblSessions' test.out

#- 324 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'nuUEGJ3k0HGtpK43' \
    --chargeStatus 'NEVER' \
    --itemId 'Mvg3w0FQ1520WM3T' \
    --limit '48' \
    --offset '60' \
    --sku 'WXSdTiKdva2UREoB' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 324 'QueryUserSubscriptions' test.out

#- 325 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'GA3itKaF9z3WWuv3' \
    --excludeSystem  \
    --limit '19' \
    --offset '21' \
    --subscriptionId '8T9g1f6P3D3rVcC2' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionActivities' test.out

#- 326 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6t42jE1Wad232YV' \
    --body '{"grantDays": 10, "itemId": "A2zHFGbN8AQaCaw9", "language": "UF7cdSDd99DQZ7vn", "reason": "Tx8HDXTJWiyw17og", "region": "zmbj4SLYDrZJvDLG", "source": "vn6qtroZcp16HKXX"}' \
    > test.out 2>&1
eval_tap $? 326 'PlatformSubscribeSubscription' test.out

#- 327 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '1ft5nBA9xNIJVuMz' \
    --itemId '04evSdE2FMcKd7c9' \
    > test.out 2>&1
eval_tap $? 327 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 328 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '4rEmIYuAT5OAcUwY' \
    --userId 'HGmG5rNDBF1oU37v' \
    > test.out 2>&1
eval_tap $? 328 'GetUserSubscription' test.out

#- 329 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'jfyX5YLaM0wmi0i1' \
    --userId 'WABBbq8IzZsMFLX9' \
    > test.out 2>&1
eval_tap $? 329 'DeleteUserSubscription' test.out

#- 330 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ZhFXcFtfBS3ZIHof' \
    --userId 'hwyM6Bw2sFGQ5DQo' \
    --force  \
    --body '{"immediate": true, "reason": "f5urEOpASBicX3Zw"}' \
    > test.out 2>&1
eval_tap $? 330 'CancelSubscription' test.out

#- 331 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'zZ7aVhrkmhSOEozG' \
    --userId 'Ov8D0iVxzrec5kNw' \
    --body '{"grantDays": 74, "reason": "REsrrB2pJ7V8BSru"}' \
    > test.out 2>&1
eval_tap $? 331 'GrantDaysToSubscription' test.out

#- 332 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cjO3zvSM5KeVNHU9' \
    --userId 'GcOivIfcCJt4U8VS' \
    --excludeFree  \
    --limit '14' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 332 'GetUserSubscriptionBillingHistories' test.out

#- 333 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'oi9Fw25b9qXzlIK2' \
    --userId 'G6AUjBCdf0Rp5e5I' \
    --body '{"additionalData": {"cardSummary": "vFuN1oUsCnBmGMx5"}, "authorisedTime": "1987-01-07T00:00:00Z", "chargebackReversedTime": "1993-09-01T00:00:00Z", "chargebackTime": "1990-02-25T00:00:00Z", "chargedTime": "1988-11-11T00:00:00Z", "createdTime": "1978-12-08T00:00:00Z", "currency": {"currencyCode": "dKvIG9MR0hTINvq1", "currencySymbol": "VR9SJUfQEX996Mh1", "currencyType": "VIRTUAL", "decimals": 4, "namespace": "Q3Dw3uyjgQNAs918"}, "customParameters": {"8Qm3W1De2McGd10w": {}, "efF0CJlH55RLEgeA": {}, "sSpQdcmGHZuRVQ8t": {}}, "extOrderNo": "zwqMayP8A3HGNI3B", "extTxId": "fjkFd6MHo6gGQ5mC", "extUserId": "hYoKD7yqCR03RovQ", "issuedAt": "1997-08-04T00:00:00Z", "metadata": {"hwfjkq9iyTbyD3D0": "1tRpuuyIagSSzEL8", "H4euLufhQj2KP3LL": "xl9Hs2L2wlpKBVUR", "xHefz77a9fntCNiH": "BRUNCPSre5GmZzCQ"}, "namespace": "wilS3IxSjlyvR9Px", "nonceStr": "G9Lji2Vc88W8aLjI", "paymentData": {"discountAmount": 48, "discountCode": "011jSmHFTtfM2mGU", "subtotalPrice": 96, "tax": 94, "totalPrice": 32}, "paymentMethod": "ipMRlhK9DMMaI4ry", "paymentMethodFee": 97, "paymentOrderNo": "4BrMSP31wAkVH75U", "paymentProvider": "ADYEN", "paymentProviderFee": 24, "paymentStationUrl": "GF247cbBLjUr5z03", "price": 47, "refundedTime": "1983-08-11T00:00:00Z", "salesTax": 44, "sandbox": true, "sku": "PlwVV3jlPKDEYahn", "status": "CHARGEBACK", "statusReason": "DBwIDsJHNg6TvNGj", "subscriptionId": "wI4TbTwBufUorJou", "subtotalPrice": 6, "targetNamespace": "94Z8IW2MAL9gYHEV", "targetUserId": "3wnTZTvYYf4ZFuV6", "tax": 76, "totalPrice": 84, "totalTax": 93, "txEndTime": "1984-10-05T00:00:00Z", "type": "ldoWWRN5wNYlFili", "userId": "YmBrqrOc0NIligBr", "vat": 84}' \
    > test.out 2>&1
eval_tap $? 333 'ProcessUserSubscriptionNotification' test.out

#- 334 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'j4imu6XFfRcWDXhq' \
    --namespace "$AB_NAMESPACE" \
    --userId '1YmGeygr2S4Yw8Nm' \
    --body '{"count": 85, "orderNo": "nxBZbHcPHEFuEVP9"}' \
    > test.out 2>&1
eval_tap $? 334 'AcquireUserTicket' test.out

#- 335 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'bF07gnWDULkJPQR0' \
    > test.out 2>&1
eval_tap $? 335 'QueryUserCurrencyWallets' test.out

#- 336 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'UJMr8ouccGH0B4LC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e2h0iFCCZgFWs5s0' \
    --body '{"allowOverdraft": false, "amount": 29, "balanceOrigin": "Epic", "balanceSource": "TRADE", "metadata": {"A88GDOUClGyzYgnY": {}, "Tdim6PkRoq5TO65K": {}, "Wh8ztRJkXxUAj3jz": {}}, "reason": "ZvEaY103YUIMuSjD"}' \
    > test.out 2>&1
eval_tap $? 336 'DebitUserWalletByCurrencyCode' test.out

#- 337 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Hz0zPWMZQNNP2JqQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qhISTBT1Gofv4Sua' \
    --limit '33' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 337 'ListUserCurrencyTransactions' test.out

#- 338 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'l6xo0D4JRbNqO6Iu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P2PY5hhX6uNah9Jo' \
    --request '{"amount": 69, "debitBalanceSource": "TRADE", "metadata": {"Pj7jFWxSv1lYylYA": {}, "iZ8c7Zd7EUoezOLw": {}, "8C1c5bBB3XZ7ColK": {}}, "reason": "wlsNvtFuunQsvdXG", "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 338 'CheckBalance' test.out

#- 339 CheckWallet
eval_tap 0 339 'CheckWallet # SKIP deprecated' test.out

#- 340 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'JA4skqCbPxRkIAFQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h9yDdoLE2s7mrVrm' \
    --body '{"amount": 95, "expireAt": "1989-10-17T00:00:00Z", "metadata": {"u4ljPWlCWTuGO8Mn": {}, "fOQu3wdT4Aodp95o": {}, "1RkX7iW7VpCngWAv": {}}, "origin": "Other", "reason": "DAG8dPdkKgQqjyzU", "source": "SELL_BACK"}' \
    > test.out 2>&1
eval_tap $? 340 'CreditUserWallet' test.out

#- 341 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'AQOFWpdItLBhvKJq' \
    --namespace "$AB_NAMESPACE" \
    --userId '9tWz9yui8a6jOflF' \
    --request '{"amount": 74, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"lZEhz1QDeh05hj92": {}, "bwVVxJ62Q5AOAOyL": {}, "65cPaOZA8BG8KcVW": {}}, "reason": "OX9n3YsjJexnFA9U", "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 341 'DebitByWalletPlatform' test.out

#- 342 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'fvgtRTPPzwJmKaLC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x3gcidEALWe6RG5w' \
    --body '{"amount": 99, "metadata": {"xMnIr4b7jyfL3zMk": {}, "klGCPISlsnVA6z0u": {}, "SfNNpJUYzJxnOyvq": {}}, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 342 'PayWithUserWallet' test.out

#- 343 GetUserWallet
eval_tap 0 343 'GetUserWallet # SKIP deprecated' test.out

#- 344 DebitUserWallet
eval_tap 0 344 'DebitUserWallet # SKIP deprecated' test.out

#- 345 DisableUserWallet
eval_tap 0 345 'DisableUserWallet # SKIP deprecated' test.out

#- 346 EnableUserWallet
eval_tap 0 346 'EnableUserWallet # SKIP deprecated' test.out

#- 347 ListUserWalletTransactions
eval_tap 0 347 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 348 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'a0JiIe1AY0tUA7EK' \
    > test.out 2>&1
eval_tap $? 348 'ListViews' test.out

#- 349 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ASk3USNLhOBlxRBL' \
    --body '{"displayOrder": 12, "localizations": {"qwfIHPWMkOmrT5HL": {"description": "16jMwECnmwJv4rpq", "localExt": {"tzDaz0WUJlBCHzJ2": {}, "v9K8c1zOlZg30pag": {}, "fP0FfOMBOpeQT4zY": {}}, "longDescription": "IbU4i9mLyX46Alt0", "title": "8rrnG8y2ScXkwjpA"}, "p82pGcxvXaG9LzHp": {"description": "MS53jllopwirRo3A", "localExt": {"8WxnR0YaMsF3f5KL": {}, "tpTSsPMGDZTOwEP5": {}, "Bhh0NStWIggmhfAz": {}}, "longDescription": "VdNYP7Ao1z7FeJM2", "title": "fWXGk7JObSHksRka"}, "bpmvRsc7ZYvXCT6m": {"description": "6mRZAlLBczJVeil7", "localExt": {"GbG1ISBCkcnpxKUx": {}, "LjmxhBS6YypRW7fN": {}, "ntaIEtDI6MbhxkQd": {}}, "longDescription": "ezbmf392ersoZ2Kb", "title": "Mb5jal0ruZmBXlGS"}}, "name": "p85q6fuGfo5wSDHn"}' \
    > test.out 2>&1
eval_tap $? 349 'CreateView' test.out

#- 350 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'yabk493I3pvHKDaW' \
    --storeId 'hTN1qyxpUzWIZWJT' \
    > test.out 2>&1
eval_tap $? 350 'GetView' test.out

#- 351 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'DzWguhujw1EoR58u' \
    --storeId 'CVldefonHJZAiX4a' \
    --body '{"displayOrder": 2, "localizations": {"ySe36SA5dxATLv5P": {"description": "kLvraRzChdjDGdlk", "localExt": {"2A2jHbAPNGInvbnf": {}, "4ewKFFLoGggX4gQW": {}, "yZocvYfr0Rnl02R1": {}}, "longDescription": "IVNnaK6KS71Xs1Bp", "title": "hA9BXpKYgF9OuigD"}, "P0Vjmy7j2BrdCAm3": {"description": "slCwaBqHpE55sjxB", "localExt": {"Gijw0dQtZNonMrPk": {}, "zUe9SglAJGyZS0I8": {}, "FevJiT98HUBp56Q4": {}}, "longDescription": "WETxtGMs5tPKPuK0", "title": "K4PiMDTR7LxihuOn"}, "57io0d9dG3yzaNbG": {"description": "eASX83SLiIbAP2qy", "localExt": {"UnHnfrEdDfY4TTxu": {}, "8goZgsX4RwfM4qnU": {}, "dcQqZ9F1uivPob0Y": {}}, "longDescription": "ZEuXQACDDQryNf9V", "title": "GxbOeJe4n9eUlBQZ"}}, "name": "2UGePWXbAyGiXa9n"}' \
    > test.out 2>&1
eval_tap $? 351 'UpdateView' test.out

#- 352 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'UsHCVicuJ7onrUXV' \
    --storeId 'lB6xNel4Bxb9KwFY' \
    > test.out 2>&1
eval_tap $? 352 'DeleteView' test.out

#- 353 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 353 'GetWalletConfig' test.out

#- 354 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 354 'UpdateWalletConfig' test.out

#- 355 QueryWallets
eval_tap 0 355 'QueryWallets # SKIP deprecated' test.out

#- 356 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 10, "expireAt": "1972-03-02T00:00:00Z", "metadata": {"o7gOFVLZCBWuVIRO": {}, "ZuqdJBi8pkn98VtL": {}, "NkaIQJfkFDhSeSGX": {}}, "origin": "Other", "reason": "unixlEAHZzHs8x5o", "source": "REFERRAL_BONUS"}, "currencyCode": "UWHcjrb6qNeKpOxP", "userIds": ["rlG9svdqsiVTqPbz", "Y1yxl7zeEpmSPO6K", "wlJQlj9Ii2jARwzo"]}, {"creditRequest": {"amount": 48, "expireAt": "1985-03-23T00:00:00Z", "metadata": {"E1gu6cYuzC77J4ir": {}, "vZ9tktWLtDdlmVGK": {}, "6iolEw6IIpDc9X5i": {}}, "origin": "IOS", "reason": "RLJbMvOGSd7uMrmQ", "source": "TRADE"}, "currencyCode": "WA44Qqsi5yOjvl5s", "userIds": ["RN2ENn1RLi5iMPnb", "g7o1zYpqUsliPyXZ", "GYIW5ZDtWbdkzPP4"]}, {"creditRequest": {"amount": 17, "expireAt": "1993-04-15T00:00:00Z", "metadata": {"cUIi2CoNj4EG2emx": {}, "KQk8cBrt5E8k8rzD": {}, "Z08j6ICP75cm8YDC": {}}, "origin": "GooglePlay", "reason": "jW6fjtBcO3fWq9qf", "source": "GIFT"}, "currencyCode": "vW0veFl3uU1aMD0m", "userIds": ["czWxc8f1s2QPMMZs", "cKW21B5EFtD2pYaK", "f2dvKZyHChRPHvdk"]}]' \
    > test.out 2>&1
eval_tap $? 356 'BulkCredit' test.out

#- 357 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "Tz1gcE2XCwTkRUIX", "request": {"allowOverdraft": true, "amount": 66, "balanceOrigin": "System", "balanceSource": "IAP_REVOCATION", "metadata": {"NmB9mYBvtOwxjqyr": {}, "jDApeN5eAfRqSgH5": {}, "xIuBTYOdsvNyk52M": {}}, "reason": "QFkVVEf36S7yPgG4"}, "userIds": ["mvyYT3GuaZVTxBlw", "8bk6PwH1tdEAJSqX", "A0Wv0zWGvkc6byp3"]}, {"currencyCode": "1IWeXKFT4rfSbbSl", "request": {"allowOverdraft": true, "amount": 26, "balanceOrigin": "Xbox", "balanceSource": "ORDER_REVOCATION", "metadata": {"Gf9Fn32SJNPZkEfk": {}, "AcJTMS4pVRcCHIGf": {}, "mCMTr9ACnI2sMrEg": {}}, "reason": "l7ZR1HCkf2Sw78lL"}, "userIds": ["uMPrIekxq58fikq8", "GKjDHuXt358gzqRM", "3hqJ7HP63Se6kVW5"]}, {"currencyCode": "fkl60ImLBv6nUU0r", "request": {"allowOverdraft": false, "amount": 37, "balanceOrigin": "Playstation", "balanceSource": "DLC_REVOCATION", "metadata": {"FgZhNpOTE4toH57y": {}, "r01N33p1Gha8Hwpa": {}, "gvERZI6Cqhcknhec": {}}, "reason": "Nv2Tw6YKhVrYkMqX"}, "userIds": ["kQ7qlaJjSYEseBYC", "FGoKpXx60GmEX9x2", "BYpyKEBQ7TW7lZvD"]}]' \
    > test.out 2>&1
eval_tap $? 357 'BulkDebit' test.out

#- 358 GetWallet
eval_tap 0 358 'GetWallet # SKIP deprecated' test.out

#- 359 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'bwFJJhBRdq8BgAI8' \
    --end '1k4Gr7jVVx5l3yrH' \
    --start '9HR4reG0HwUXxQTf' \
    > test.out 2>&1
eval_tap $? 359 'SyncOrders' test.out

#- 360 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["5YpDUGYsJBEkYUrL", "v4qUiTkFcLBrg2JB", "0WiCpVBwvAffJ3bt"], "apiKey": "t0PpQY3Pnnic80yE", "authoriseAsCapture": false, "blockedPaymentMethods": ["KleuV271bwZ4niLS", "zQnv0C00dtNGGzbG", "YSYo9fY2EBZAHQXc"], "clientKey": "4Xcae7VKl0ARzGEA", "dropInSettings": "rlfE1NSmtcADoZvd", "liveEndpointUrlPrefix": "0La7P4JI4H7uDzkO", "merchantAccount": "HTdnUtdrRcs3GeOs", "notificationHmacKey": "KPNlG7rEXi6LEqJE", "notificationPassword": "RpbxEq07txnvZZeA", "notificationUsername": "f7QBuZK5GJlBncg8", "returnUrl": "tQnJOKHC16xjJZ4k", "settings": "iU3N8556ll2LQWpd"}' \
    > test.out 2>&1
eval_tap $? 360 'TestAdyenConfig' test.out

#- 361 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "ESOBV7wZJsg7wSv9", "privateKey": "lyRyTdYBUljvBzvY", "publicKey": "NEtfgBFikt18cQ67", "returnUrl": "7SotDEtU2xBSEQ8r"}' \
    > test.out 2>&1
eval_tap $? 361 'TestAliPayConfig' test.out

#- 362 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "BKc2K6oJXxVEfnaq", "secretKey": "X8NuZtRUTKUvR69P"}' \
    > test.out 2>&1
eval_tap $? 362 'TestCheckoutConfig' test.out

#- 363 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Imy6CcwlqJ4MO3L8' \
    > test.out 2>&1
eval_tap $? 363 'DebugMatchedPaymentMerchantConfig' test.out

#- 364 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "x1H5OgzHypgsSeKC", "webhookSecretKey": "vtPz7jagBG9a1TZ8"}' \
    > test.out 2>&1
eval_tap $? 364 'TestNeonPayConfig' test.out

#- 365 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "7ltClc3RDXF5055t", "clientSecret": "UlenimjIbm0riCaN", "returnUrl": "p8dUBDinAB6HqIWI", "webHookId": "i5Bvb1rcuEtWAF76"}' \
    > test.out 2>&1
eval_tap $? 365 'TestPayPalConfig' test.out

#- 366 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["3kci7lT62BOHaso5", "3W3U2Mu9ZGMWou1U", "0RVCf3gMWDAodCKq"], "publishableKey": "fqzeexHA70NgJTxj", "secretKey": "tzgO7W3taRvJ6lKW", "webhookSecret": "JwHO65aOFDwpqy7X"}' \
    > test.out 2>&1
eval_tap $? 366 'TestStripeConfig' test.out

#- 367 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "OU3DwglyMGNll4O8", "key": "ELahcNJqRjepck1l", "mchid": "0qxRyQ2pi7xuAufJ", "returnUrl": "akIPXOQznHZTj8oY"}' \
    > test.out 2>&1
eval_tap $? 367 'TestWxPayConfig' test.out

#- 368 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "fWObyNJKVSQsaCok", "flowCompletionUrl": "oGynp6xcqNKJnAhr", "merchantId": 92, "projectId": 20, "projectSecretKey": "t96OaARAjHLGV3sN"}' \
    > test.out 2>&1
eval_tap $? 368 'TestXsollaConfig' test.out

#- 369 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'xS8uLBZiVRYIyQLc' \
    > test.out 2>&1
eval_tap $? 369 'GetPaymentMerchantConfig1' test.out

#- 370 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'slTEqgVNG8Aqktgv' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["jwNJAwIpEy2ZNpoj", "Z24I2n25smsrmJFH", "GiYnyhbqxLuTZIxg"], "apiKey": "iUaiyy0aWrshpmb1", "authoriseAsCapture": true, "blockedPaymentMethods": ["78smYdyge6DroOyw", "OxI4G6jZzoYIFAvY", "fT8XQw2EOq6BFjmN"], "clientKey": "4OqKGLRpNWzKZtZn", "dropInSettings": "xgywmr4CYNGm7Tk1", "liveEndpointUrlPrefix": "mMyeNRsjQuDEgO3M", "merchantAccount": "EQNL6ijLRvQOgoaB", "notificationHmacKey": "ooTawHLMxhx9nC3o", "notificationPassword": "6pXU5MDJLCB6WbXW", "notificationUsername": "IRpgjooaBVemsbka", "returnUrl": "XZQ6nTj9rZpkSntu", "settings": "OeaPAyPeEGBepK1I"}' \
    > test.out 2>&1
eval_tap $? 370 'UpdateAdyenConfig' test.out

#- 371 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'x4SwjCYjCHniVSn1' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 371 'TestAdyenConfigById' test.out

#- 372 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'gYGal5NrBtT0om9O' \
    --sandbox  \
    --validate  \
    --body '{"appId": "lGzpF25qu98RhktX", "privateKey": "6qwkXbCLbh8t0zPk", "publicKey": "QWRUlgE0kxzFMq9t", "returnUrl": "tbEHAEV7C65Ans9S"}' \
    > test.out 2>&1
eval_tap $? 372 'UpdateAliPayConfig' test.out

#- 373 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'quNSJIay5VdUdYy9' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 373 'TestAliPayConfigById' test.out

#- 374 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'Y9OCSmmT3WKijbqh' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "T3uyQRXvvcUYDeWP", "secretKey": "Z8yhwQ0gIdj1lTJd"}' \
    > test.out 2>&1
eval_tap $? 374 'UpdateCheckoutConfig' test.out

#- 375 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'NLmAvEdEBVAU3rbk' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 375 'TestCheckoutConfigById' test.out

#- 376 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'v8V98cupW0L5Wsiu' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "ITRMSPOUfWQwr4PY", "webhookSecretKey": "f48r66MaToxBiliy"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateNeonPayConfig' test.out

#- 377 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id '2vtRkpqL6KrVcNz8' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 377 'TestNeonPayConfigById' test.out

#- 378 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id '3J57t6OcYPQ5bk5I' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "euAi3zWFGorCbnco", "clientSecret": "j5RvEtXiKyUGdNfM", "returnUrl": "iwgSvsTRmJsOm0wV", "webHookId": "FyHvFhRMCFJuA0DE"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdatePayPalConfig' test.out

#- 379 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'MgykqqjoHTpIPMSR' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 379 'TestPayPalConfigById' test.out

#- 380 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'AuPI7mSZQ5UDm1q5' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["1PlW2HG8LAiIzuo3", "21Ll90IBFsSb3FsV", "2PnCs9R0D5jZEwxc"], "publishableKey": "ow6L7c3COEP4AZx7", "secretKey": "0uwV4XgvGTMHkXeE", "webhookSecret": "wuFJf7tbq5KikDE7"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateStripeConfig' test.out

#- 381 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'hWvT5bzcfzIpL2pW' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 381 'TestStripeConfigById' test.out

#- 382 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'B4XsdrxIF6kEAmKG' \
    --validate  \
    --body '{"appId": "NEmFPcUALNziO9Bz", "key": "2wx4kDAm8XIleiuj", "mchid": "tv2NdQTYoHZogW8l", "returnUrl": "BvniHdARadfSoctA"}' \
    > test.out 2>&1
eval_tap $? 382 'UpdateWxPayConfig' test.out

#- 383 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id '3GYO94ZOo94gS5DH' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 383 'UpdateWxPayConfigCert' test.out

#- 384 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'LB65fxQ06GwTmobi' \
    > test.out 2>&1
eval_tap $? 384 'TestWxPayConfigById' test.out

#- 385 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'Bnfrnq9kOFBWhUTP' \
    --validate  \
    --body '{"apiKey": "iKR3qcbHLGplYsS3", "flowCompletionUrl": "jsRZffCd00VrgPuN", "merchantId": 40, "projectId": 5, "projectSecretKey": "Ov3jbhGBuW8KcyPM"}' \
    > test.out 2>&1
eval_tap $? 385 'UpdateXsollaConfig' test.out

#- 386 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'fDWSEEpKoJlmhMQU' \
    > test.out 2>&1
eval_tap $? 386 'TestXsollaConfigById' test.out

#- 387 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'Cx70QjYbzemOTURz' \
    --body '{"device": "MOBILE", "showCloseButton": true, "size": "SMALL", "theme": "DEFAULT_DARK"}' \
    > test.out 2>&1
eval_tap $? 387 'UpdateXsollaUIConfig' test.out

#- 388 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '8' \
    --namespace "$AB_NAMESPACE" \
    --offset '70' \
    --region 'veQXqnFRYmEIX40X' \
    > test.out 2>&1
eval_tap $? 388 'QueryPaymentProviderConfig' test.out

#- 389 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "XSOLLA", "namespace": "oLOa7oDz00gxcoaH", "region": "6u9TVf4DvEzpoPRi", "sandboxTaxJarApiToken": "ClZ6rlwX99AHMLHq", "specials": ["ALIPAY", "CHECKOUT", "STRIPE"], "taxJarApiToken": "FQHumFvPKqupHj72", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 389 'CreatePaymentProviderConfig' test.out

#- 390 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 390 'GetAggregatePaymentProviders' test.out

#- 391 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'RUduW5lxSlorWEGN' \
    > test.out 2>&1
eval_tap $? 391 'DebugMatchedPaymentProviderConfig' test.out

#- 392 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 392 'GetSpecialPaymentProviders' test.out

#- 393 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id '5bPGSOSiiItrSrEJ' \
    --body '{"aggregate": "XSOLLA", "namespace": "C37xPXxnfggnZ3EZ", "region": "p6wSAufwYirs9lwv", "sandboxTaxJarApiToken": "PKd925u3fFLV0YeM", "specials": ["PAYPAL", "XSOLLA", "ADYEN"], "taxJarApiToken": "elVOU0hHnsCl5k6J", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 393 'UpdatePaymentProviderConfig' test.out

#- 394 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'f2Pn9A4gcbDJ0Lmd' \
    > test.out 2>&1
eval_tap $? 394 'DeletePaymentProviderConfig' test.out

#- 395 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 395 'GetPaymentTaxConfig' test.out

#- 396 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "nOPkIT1C6KGTpA7J", "taxJarApiToken": "Z6xullPROSfiW9zc", "taxJarEnabled": true, "taxJarProductCodesMapping": {"OkXA3WqypoOw0H2s": "0sibQNBz81zRPntx", "pgi7tXIcNEcGJjOC": "Xpuix5vnPeTu9evb", "Rov7Bm40CtZiAxk4": "3DGV1SCkw8U0d4Fv"}}' \
    > test.out 2>&1
eval_tap $? 396 'UpdatePaymentTaxConfig' test.out

#- 397 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'VmPMtpRMWSQ8Szi1' \
    --end 'IrGidRmR5BGRJhFw' \
    --start 'xmkGfPI3j4luXQuu' \
    > test.out 2>&1
eval_tap $? 397 'SyncPaymentOrders' test.out

#- 398 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'LtYa86kvL6cBZQss' \
    --storeId 'UUXOsXMNdvW1hbvG' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetRootCategories' test.out

#- 399 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'enRbm3QtsY5WaKM5' \
    --storeId 'YY6pYrmeMIHLS8eg' \
    > test.out 2>&1
eval_tap $? 399 'DownloadCategories' test.out

#- 400 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'V8XhgDjbrum8Uxcu' \
    --namespace "$AB_NAMESPACE" \
    --language 'tmVg8APWKxoj6MF6' \
    --storeId '8VuKDoklYmkytCAH' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetCategory' test.out

#- 401 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath '8Jiqe7gfV1G6bYgI' \
    --namespace "$AB_NAMESPACE" \
    --language 'bVKp4Kgew2mHDksA' \
    --storeId '6Mv9Nzs19eBq9a1L' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetChildCategories' test.out

#- 402 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '8S1yduOwscICro6P' \
    --namespace "$AB_NAMESPACE" \
    --language '8FWIPeqaBeD2uBAv' \
    --storeId 'IXEc2CCgYcFo9A93' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetDescendantCategories' test.out

#- 403 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 403 'PublicListCurrencies' test.out

#- 404 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'OCULUS' \
    > test.out 2>&1
eval_tap $? 404 'GeDLCDurableRewardShortMap' test.out

#- 405 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 405 'GetAppleConfigVersion' test.out

#- 406 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 406 'GetIAPItemMapping' test.out

#- 407 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language '2UgObCOiBWdw2b03' \
    --region '1dm4N41MOpmm04Bl' \
    --storeId 'ZUAlYnCT11qD03er' \
    --appId '5mdraK47FdxXisVl' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItemByAppId' test.out

#- 408 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'DLC' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'Lu4oFlReHy0JyZv7' \
    --categoryPath 'honqeiGTTqpgVsY1' \
    --features 'kPNdJiJXB3yjNUPI' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'GfH66eFCMTsLA8vY' \
    --limit '98' \
    --offset '3' \
    --region 'vrIAEehUV0jsjAyV' \
    --sortBy 'updatedAt,displayOrder:asc,name:asc' \
    --storeId 'JfAhJGwSYEZjEb0P' \
    --tags 'v35fEk9s11bFXkf7' \
    > test.out 2>&1
eval_tap $? 408 'PublicQueryItems' test.out

#- 409 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'rQJ4Kj7Qyo9tUpti' \
    --region 'yZzRX8Y4rxRWZPe4' \
    --storeId 'ZLAQWuBJwxObZqMG' \
    --sku 'xhffy9cHrLYfftad' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItemBySku' test.out

#- 410 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '99JDcnn7f2d8SOWP' \
    --storeId '2dw6Uy88WpQalG38' \
    --itemIds 'VOo82aLD9jUjuDIT' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetEstimatedPrice' test.out

#- 411 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'jifWRbmtK7MTxcCW' \
    --region 'nMiCLsjroKHPApA8' \
    --storeId 'GsGwyocvY9NePjLJ' \
    --itemIds 'QJXwUApJWohXn01R' \
    > test.out 2>&1
eval_tap $? 411 'PublicBulkGetItems' test.out

#- 412 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["B7pu7BaONXyE5fID", "bsMi48xOYVvEcEm5", "3BYMBacQBIuDVs7U"]}' \
    > test.out 2>&1
eval_tap $? 412 'PublicValidateItemPurchaseCondition' test.out

#- 413 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'OPTIONBOX' \
    --limit '54' \
    --offset '3' \
    --region 'JtWPRteszMTd0R5F' \
    --storeId 'srf9xbVfgvG617Gm' \
    --keyword 'xzClkR3M6Twpwq3n' \
    --language 'LwxnJKjOo9fvfXF1' \
    > test.out 2>&1
eval_tap $? 413 'PublicSearchItems' test.out

#- 414 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'VsikD3IphQQiRcOt' \
    --namespace "$AB_NAMESPACE" \
    --language 'sthUwgQzNHUZ0l1F' \
    --region 'RfOjJUmCbi2llksf' \
    --storeId '6GA8vTt92kldCoyR' \
    > test.out 2>&1
eval_tap $? 414 'PublicGetApp' test.out

#- 415 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'diOikUdqGocLYBaR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 415 'PublicGetItemDynamicData' test.out

#- 416 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'C7T5qSl7WN3ncPkq' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'iTKzz72PKXjShM2D' \
    --populateBundle  \
    --region 'vesmMIbiQfaHxl2Y' \
    --storeId 'UNRLRjgKqSSYgZnV' \
    > test.out 2>&1
eval_tap $? 416 'PublicGetItem' test.out

#- 417 GetPaymentCustomization
eval_tap 0 417 'GetPaymentCustomization # SKIP deprecated' test.out

#- 418 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "fa8govttlpFAq8oe", "successUrl": "bnS4Y2zkGYTr9yJI"}, "paymentOrderNo": "veX52r6Inl9VTJB9", "paymentProvider": "WALLET", "returnUrl": "N7NAvZdGuyYEYZE3", "ui": "KaGSdhEGKcp6g1A8", "zipCode": "O9N9cbYBK6XOBDpR"}' \
    > test.out 2>&1
eval_tap $? 418 'PublicGetPaymentUrl' test.out

#- 419 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7SH93AE1Toj5vygV' \
    > test.out 2>&1
eval_tap $? 419 'PublicGetPaymentMethods' test.out

#- 420 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'vLSJvdsGpmmUeMik' \
    > test.out 2>&1
eval_tap $? 420 'PublicGetUnpaidPaymentOrder' test.out

#- 421 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'W3s54zffAL2DZ7gB' \
    --paymentProvider 'ALIPAY' \
    --zipCode 'FDj2L2McvCrrR7h9' \
    --body '{"token": "uKLXDaRf3pxKtJbR"}' \
    > test.out 2>&1
eval_tap $? 421 'Pay' test.out

#- 422 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'Y5luCwKrt6wn3yVr' \
    > test.out 2>&1
eval_tap $? 422 'PublicCheckPaymentOrderPaidStatus' test.out

#- 423 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'PAYPAL' \
    --region 'Ch6j7rpv8K8fBAeR' \
    > test.out 2>&1
eval_tap $? 423 'GetPaymentPublicConfig' test.out

#- 424 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'a1R6ksxLYGkOLgRe' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetQRCode' test.out

#- 425 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'ff5IHxLJIemNHbzg' \
    --foreinginvoice 'AFjtjC7suvgIUkB2' \
    --invoiceId 'PAGJqOrkdlZB246O' \
    --payload 'Y0dPVMd2WDUVEQTp' \
    --redirectResult 'fyAIoF7qsANBbEKQ' \
    --resultCode 'rgocpjGNenRlDORL' \
    --sessionId 'vP7ynTuXzafCqlMr' \
    --status 'rVIehVCf3AwIzUdQ' \
    --token '6sTrUg7Z0SLrZraV' \
    --type '3NLBUSrFnzE6yR1w' \
    --userId 'LTgjsnB2LFVrZRrO' \
    --orderNo 'ntm2KjbfCOuW3dBm' \
    --paymentOrderNo 'FwUO7Y0xhMLwxgRp' \
    --paymentProvider 'PAYPAL' \
    --returnUrl 'IZtkSn8QRbA5V4gj' \
    > test.out 2>&1
eval_tap $? 425 'PublicNormalizePaymentReturnUrl' test.out

#- 426 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'Wv1W6cqnvSuKswQ7' \
    --paymentOrderNo 'vH8GScnP5QzRBY1U' \
    --paymentProvider 'PAYPAL' \
    > test.out 2>&1
eval_tap $? 426 'GetPaymentTaxValue' test.out

#- 427 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'bq3Qcrtt8L5dIebs' \
    > test.out 2>&1
eval_tap $? 427 'GetRewardByCode' test.out

#- 428 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'w7EjkMnJSziEA43W' \
    --limit '33' \
    --offset '66' \
    --sortBy 'namespace:desc,rewardCode:desc,rewardCode:asc' \
    > test.out 2>&1
eval_tap $? 428 'QueryRewards1' test.out

#- 429 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'lmByN5rcDA3Wcv9o' \
    > test.out 2>&1
eval_tap $? 429 'GetReward1' test.out

#- 430 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicListStores' test.out

#- 431 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'uALjgLZZzLU9w8MJ,RIzIgJKg9y86BgnB,Qtm5AilVhASFlYMV' \
    --itemIds 'JtE2dAeC7pF73y9e,ALKWinUJ7bAuUJ7F,xg5LijlQTVq8Bh1p' \
    --skus '0NCKWNkLU5ty3uQa,7Fl3ZhSMLtrwnjTJ,VDlh112byTYCDBnA' \
    > test.out 2>&1
eval_tap $? 431 'PublicExistsAnyMyActiveEntitlement' test.out

#- 432 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'vf8JpFuJSZistM75' \
    > test.out 2>&1
eval_tap $? 432 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 433 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'MEDIA' \
    --itemId '44PDlVK8taScpV0N' \
    > test.out 2>&1
eval_tap $? 433 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 434 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --sku 'zOB08tpk0qhZath4' \
    > test.out 2>&1
eval_tap $? 434 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 435 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'b4HtwEYX55pJNTX1,sDjSWiSXsV5rJ8eZ,XZ1TLMZnNL3DQK45' \
    --itemIds 'IAtbyUDDSJSV8pzl,1lfIR7jnetIJPGOb,yWCLyFPHaxkKxEDv' \
    --skus 'Soi2X9SygvMG8QAa,WUhIguMvKDOrx0wQ,XKEroyKz2reP63EV' \
    > test.out 2>&1
eval_tap $? 435 'PublicGetEntitlementOwnershipToken' test.out

#- 436 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "HT72VuhoGP2IFXGU", "language": "IV", "region": "EfCMt95DEjxqhgYq"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncTwitchDropsEntitlement' test.out

#- 437 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'mMqIdlRrQmuILkeR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 437 'PublicGetMyWallet' test.out

#- 438 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'UafUDP5b6BWfm7cY' \
    --body '{"epicGamesJwtToken": "CpDIJG42ILhUoCh8"}' \
    > test.out 2>&1
eval_tap $? 438 'SyncEpicGameDLC' test.out

#- 439 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'lmKKocC5Ea29JhfF' \
    > test.out 2>&1
eval_tap $? 439 'SyncOculusDLC' test.out

#- 440 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'GN964J8WOgsAj2Rm' \
    --body '{"serviceLabel": 11}' \
    > test.out 2>&1
eval_tap $? 440 'PublicSyncPsnDlcInventory' test.out

#- 441 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'unXv1iE7YgEZspOJ' \
    --body '{"serviceLabels": [81, 66, 41]}' \
    > test.out 2>&1
eval_tap $? 441 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 442 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'iZl6OVLxKtkBpaCG' \
    --body '{"appId": "8Nu5m4ctwUNV8nce", "steamId": "baJ0DCuIeEStt3Pb"}' \
    > test.out 2>&1
eval_tap $? 442 'SyncSteamDLC' test.out

#- 443 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'yctX7HC2haQwVWON' \
    --body '{"xstsToken": "EpAPedzI2AdlqiyE"}' \
    > test.out 2>&1
eval_tap $? 443 'SyncXboxDLC' test.out

#- 444 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'JIQcbZJJ3AhkrMi0' \
    --appType 'DEMO' \
    --entitlementClazz 'OPTIONBOX' \
    --entitlementName 'nppEJFISze88rGEr' \
    --features '3cilJWhaW6jNsM94,E2FQb6S0VmaTR7E3,mkDSQkgVMhLbM6H1' \
    --itemId 'MnNSKd0KStITvGQt,zwjGtGTr238G8Aev,k3k14782W2oNo3X4' \
    --limit '25' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 444 'PublicQueryUserEntitlements' test.out

#- 445 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '6wms9SPaHlqtDPry' \
    --appId '2vMON7sdhlilfpDT' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementByAppId' test.out

#- 446 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId '8o2iFrYtGfCZCcrv' \
    --limit '38' \
    --offset '7' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 446 'PublicQueryUserEntitlementsByAppType' test.out

#- 447 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '2I4X26p21iDBZGJ8' \
    --availablePlatformOnly  \
    --ids 'ZMLwPJ871nV5ALS7,cneNLItUJgh74tyx,kTR8ZCVJtkxjBJrN' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementsByIds' test.out

#- 448 PublicGetUserEntitlementByItemId
eval_tap 0 448 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 449 PublicGetUserEntitlementBySku
eval_tap 0 449 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 450 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'eQRsqkkKK2qxqzy4' \
    --endDate 'KSA5UtSXWjANSWIT' \
    --entitlementClazz 'APP' \
    --limit '94' \
    --offset '49' \
    --startDate 'LnuMLNJAEk3A6A6r' \
    > test.out 2>&1
eval_tap $? 450 'PublicUserEntitlementHistory' test.out

#- 451 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'YiIu8eLdWykhBxLF' \
    --appIds 'nKnSYC9yyBYepIqt,rikdAbdOT6iSRdEg,8NYuc4q5sJVzaKGD' \
    --itemIds 'OULJbjHphqjHGGAh,fWaXqkA5fuVYOsMF,o9tnqa4LEWGg1r4n' \
    --skus 'W4pBcPPaiaM1og5r,xUjGPKKLMoAy1stm,xPFz0i1IK3QzkcRw' \
    > test.out 2>&1
eval_tap $? 451 'PublicExistsAnyUserActiveEntitlement' test.out

#- 452 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'FPpXGlKR9ss8b8ud' \
    --appId 'l6fLkxFnAqyvjBy0' \
    > test.out 2>&1
eval_tap $? 452 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 453 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NXg7zd6SFpkV7cAI' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'jzlcxXsmGGcJhaux' \
    > test.out 2>&1
eval_tap $? 453 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 454 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'fhVKIbRvUnyElHPu' \
    --ids 'QE3Gc8bY4IH0OXHZ,P6VVB7qjDHMS49dk,v8vxyg6giNKzeFnl' \
    > test.out 2>&1
eval_tap $? 454 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 455 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGRgYK3SeYvULYNI' \
    --entitlementClazz 'APP' \
    --sku 'NuFyKW95dJsGoBIj' \
    > test.out 2>&1
eval_tap $? 455 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 456 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'CKlD3axSivItV1tx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LINmdHTGLtX6TN5c' \
    > test.out 2>&1
eval_tap $? 456 'PublicGetUserEntitlement' test.out

#- 457 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'tYX1sZnYF3hWmCCI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rP0lJXexseo2e6BC' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["JTTRIHDKdVfOUr14", "yZH00n8MsRjaB8iu", "rBWW5jSJi0seeGJI"], "requestId": "qnatME8GnNWfAY1y", "useCount": 50}' \
    > test.out 2>&1
eval_tap $? 457 'PublicConsumeUserEntitlement' test.out

#- 458 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'D1Euusf0eOzoSyKt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tYwUUlMRG8vO0OSs' \
    --body '{"requestId": "JmhOJDUyyag9jBDJ", "useCount": 66}' \
    > test.out 2>&1
eval_tap $? 458 'PublicSellUserEntitlement' test.out

#- 459 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'jgzU02nZWwBdEFpf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ccauYDc86pxK9KhF' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 98}' \
    > test.out 2>&1
eval_tap $? 459 'PublicSplitUserEntitlement' test.out

#- 460 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'PIt1hrg2mhbI0NDs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hb7ZzQuBPyNi1GhZ' \
    --body '{"entitlementId": "HEj6p5grjk5wzdks", "metadata": {"operationSource": "INVENTORY"}, "useCount": 96}' \
    > test.out 2>&1
eval_tap $? 460 'PublicTransferUserEntitlement' test.out

#- 461 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'TTkL8cmpA0sZ0tge' \
    --body '{"code": "R4UV5SMZ8GUvWZvo", "language": "wNP-WiaU-sd", "region": "wYIqDWqbPmwQw8J7"}' \
    > test.out 2>&1
eval_tap $? 461 'PublicRedeemCode' test.out

#- 462 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'na1POTXhXLRU5prA' \
    --body '{"excludeOldTransactions": false, "language": "RO", "productId": "dAezedcppbujZh1f", "receiptData": "YXF6R9Rz3HVP2Y9W", "region": "qSRiwV3UZg0UJLPM", "transactionId": "keUwa6OVKxCMxuf0"}' \
    > test.out 2>&1
eval_tap $? 462 'PublicFulfillAppleIAPItem' test.out

#- 463 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'P9r5f6fdmyi4kQnO' \
    --body '{"epicGamesJwtToken": "FbBtvBw81hUgtONC"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncEpicGamesInventory' test.out

#- 464 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IoZ2rkomSj52mAIM' \
    --body '{"autoAck": false, "autoConsume": true, "language": "yPT", "orderId": "zU8FwQtZpfUoyoiU", "packageName": "jmqOyQ7ammFgHprd", "productId": "M9viFWmezrQOWH03", "purchaseTime": 51, "purchaseToken": "g1AkRh3NmbRhMxKe", "region": "Igwq1NZmxa0ghRG0", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 464 'PublicFulfillGoogleIAPItem' test.out

#- 465 SyncOculusSubscriptions
./ng net.accelbyte.sdk.cli.Main platform syncOculusSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'QpWTNKsVyK8EU8JY' \
    --body '{"skus": ["c00PA2ef1jFeqQ8m", "BpTuvLTJUzwXJFaW", "W3JVdYpfHOYoLva2"]}' \
    > test.out 2>&1
eval_tap $? 465 'SyncOculusSubscriptions' test.out

#- 466 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'c4JscEQfBFZXcSXp' \
    > test.out 2>&1
eval_tap $? 466 'SyncOculusConsumableEntitlements' test.out

#- 467 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'U81S5H9XsZyvZOFJ' \
    --body '{"currencyCode": "5RrFZYcwfQ1Q2Bbc", "price": 0.15210882216481303, "productId": "Spv6Nt1oz4tdgfKu", "serviceLabel": 3}' \
    > test.out 2>&1
eval_tap $? 467 'PublicReconcilePlayStationStore' test.out

#- 468 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'FcdTvIDQI2uIi2SN' \
    --body '{"currencyCode": "ZKqlJZsdnY04DIyo", "price": 0.2921498208164678, "productId": "prZPBaERb7U9kK4V", "serviceLabels": [40, 4, 45]}' \
    > test.out 2>&1
eval_tap $? 468 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 469 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'sry8AKSZxOhUhl3Y' \
    --body '{"appId": "0EshaG0uDiJNUuxK", "currencyCode": "22saWaGvrzBdLvFU", "language": "hJe_HB", "price": 0.0731486104463126, "productId": "wLWHcBxz5LpdkRCA", "region": "U8HhmXC68JFPdxhv", "steamId": "BKee6wG66YPD4vNd"}' \
    > test.out 2>&1
eval_tap $? 469 'SyncSteamInventory' test.out

#- 470 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'ENY1r1rI0T97qA1O' \
    > test.out 2>&1
eval_tap $? 470 'SyncSteamAbnormalTransaction' test.out

#- 471 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'iblWlz2LXQNqcONc' \
    --body '{"orderId": "JIsYRQz97fRWI17e"}' \
    > test.out 2>&1
eval_tap $? 471 'SyncSteamIAPByTransaction' test.out

#- 472 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId 'P3Y2nWlS9Sfjh0ht' \
    --activeOnly  \
    --groupId 'yVaGj4y9ahS7h7XV' \
    --limit '23' \
    --offset '25' \
    --productId 'pGYsLNEGrfy9qHKu' \
    > test.out 2>&1
eval_tap $? 472 'PublicQueryUserThirdPartySubscription' test.out

#- 473 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fJfk0MeG3qYJr6Pu' \
    --body '{"gameId": "CVK9WmDAdpLVTVsj", "language": "PNeI-Bvyt-398", "region": "RFMRaeIaQuPWPlkx"}' \
    > test.out 2>&1
eval_tap $? 473 'SyncTwitchDropsEntitlement1' test.out

#- 474 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'eotrNakKGvOSvpmZ' \
    --body '{"currencyCode": "ZdlNXdx2kWmSqodN", "price": 0.8303853439995099, "productId": "gfQyDVVkkqiMiRf2", "xstsToken": "yCyM0Tp5GJHHbsLJ"}' \
    > test.out 2>&1
eval_tap $? 474 'SyncXboxInventory' test.out

#- 475 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '73mCPhhmUyIwgQS9' \
    --discounted  \
    --itemId 'kVFUbeTeB9KgnFZQ' \
    --limit '13' \
    --offset '24' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserOrders' test.out

#- 476 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNyCiytnfMoO1I3K' \
    --body '{"currencyCode": "ISTbn4yEa2AaBRal", "discountCodes": ["WDAauqLKarcLQRQt", "C927GneBM8LvzgyI", "z5HEm4Gant6aqjKz"], "discountedPrice": 98, "ext": {"x3AJN97kUjwiCmWQ": {}, "vbrxQpUSnos6QiHy": {}, "rcGeRv27hj73Etuf": {}}, "itemId": "HuNIp0GXpM4nbG7a", "language": "iXa-oXyM-WW", "price": 76, "quantity": 91, "region": "oL0wwHoRMNexBOro", "returnUrl": "n8wIdUbp7xVMKfbA", "sectionId": "JfW4iMIC52NUedhh"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicCreateUserOrder' test.out

#- 477 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'kME18qGpSsyEPDWH' \
    --body '{"currencyCode": "cqfYp2EFxEaEHCGt", "discountCodes": ["E7E12Fapao5jo9nJ", "g812NQb5Glh8srTl", "Tj61WdV2XUo1BO1r"], "discountedPrice": 30, "itemId": "Ax7rZTvew0WVDSMN", "price": 35, "quantity": 75}' \
    > test.out 2>&1
eval_tap $? 477 'PublicPreviewOrderPrice' test.out

#- 478 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '23LV7xZEEv7O1lwx' \
    --userId 'VTRll0GIEUJtMC8N' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserOrder' test.out

#- 479 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'yV2HLHZT3oYJlC4i' \
    --userId 'e3InnSA22NHTb4qX' \
    > test.out 2>&1
eval_tap $? 479 'PublicCancelUserOrder' test.out

#- 480 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'YyJUAlKlTwdJEPoe' \
    --userId 'mVtmVXTs3tCu4F9I' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserOrderHistories' test.out

#- 481 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'gDT2tq2V2lMzfIQH' \
    --userId 'CZ90DqQgP6ynrQjY' \
    > test.out 2>&1
eval_tap $? 481 'PublicDownloadUserOrderReceipt' test.out

#- 482 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'H0N2loTnRa0KiQWP' \
    > test.out 2>&1
eval_tap $? 482 'PublicGetPaymentAccounts' test.out

#- 483 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'xd1gqlwx9CE4Wcsm' \
    --namespace "$AB_NAMESPACE" \
    --type 'paypal' \
    --userId 'tCkIgcwiDWQFghmI' \
    > test.out 2>&1
eval_tap $? 483 'PublicDeletePaymentAccount' test.out

#- 484 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'i6fphDw3p9QWqwTF' \
    --autoCalcEstimatedPrice  \
    --language '2pOJsY86xAf5y1iy' \
    --region '01FkEEXlKiTIDgP7' \
    --storeId 'wuXQdfW99JglScoO' \
    --viewId 'lkkBxiXf8OBQRqXW' \
    > test.out 2>&1
eval_tap $? 484 'PublicListActiveSections' test.out

#- 485 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'XQ3JdXdFz8pc0EEz' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'nDfIAN04f5kSONmw' \
    --limit '57' \
    --offset '19' \
    --sku 'DqqSctLL4WfGq8JC' \
    --status 'INIT' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 485 'PublicQueryUserSubscriptions' test.out

#- 486 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '2WHGVKDcKulj3Pde' \
    --body '{"currencyCode": "gy4G6LOpak8CYp6D", "itemId": "Pdukc04j6rbfBuKB", "language": "Pb", "region": "3yvvBLZPBuekeBe4", "returnUrl": "Tvb3fHCIJZkwEcCR", "source": "i2U7s2ZQAarwH0c8"}' \
    > test.out 2>&1
eval_tap $? 486 'PublicSubscribeSubscription' test.out

#- 487 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId '7v0PwZjydyzGDZM4' \
    --itemId 'zTTYI6O8coYDWUfc' \
    > test.out 2>&1
eval_tap $? 487 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 488 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'L1qsegBsrNqeW5Bx' \
    --userId 'Ve8iW7sGELnMdXRq' \
    > test.out 2>&1
eval_tap $? 488 'PublicGetUserSubscription' test.out

#- 489 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dGPzxXvZPtrhjeVB' \
    --userId 'nTrsYihhgbeAZoFn' \
    > test.out 2>&1
eval_tap $? 489 'PublicChangeSubscriptionBillingAccount' test.out

#- 490 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'cMUdmf8hD3nL1saQ' \
    --userId 'xLYrz08jh6Tyq7WU' \
    --body '{"immediate": false, "reason": "8ZR3bPCJ5n5s6DOD"}' \
    > test.out 2>&1
eval_tap $? 490 'PublicCancelSubscription' test.out

#- 491 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'BmrqEhGlkEmGdCbw' \
    --userId 'odVRjZJWuCQpjuJz' \
    --excludeFree  \
    --limit '31' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 491 'PublicGetUserSubscriptionBillingHistories' test.out

#- 492 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'PO7BPxVWlRFnIekr' \
    --language 'Q99ecmenxguw5bO8' \
    --storeId 'Vh4JaKYAsoMlLJGM' \
    > test.out 2>&1
eval_tap $? 492 'PublicListViews' test.out

#- 493 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'l5xFgLj4mCShMFlb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rRGjoBQ45Za4JR4S' \
    > test.out 2>&1
eval_tap $? 493 'PublicGetWallet' test.out

#- 494 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode '3iac6vLeoIULJlWX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mQFlef1tSHJf6sVp' \
    --limit '46' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 494 'PublicListUserWalletTransactions' test.out

#- 495 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 495 'PublicGetMyDLCContent' test.out

#- 496 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'MdBsPt19V2FkBPk0' \
    --limit '87' \
    --offset '76' \
    --startTime 'lBlZMQeSnOg5gf1S' \
    --state 'REVOKED' \
    --transactionId 'g0hfM5vQmahJlT5O' \
    --userId 'UDEMwAjgNZgto2Eh' \
    > test.out 2>&1
eval_tap $? 496 'QueryFulfillments' test.out

#- 497 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --availableDate 'lnsuDnkuOJekbO0s' \
    --baseAppId 'k7o1z37uuqLDQF12' \
    --categoryPath 'kYfBqeQxos58kVk7' \
    --features 'F1KKOfFFLvER3xqC' \
    --includeSubCategoryItem  \
    --itemName 'wUgKa4oCBoJDxGa1' \
    --itemStatus 'INACTIVE' \
    --itemType 'EXTENSION,SEASON,INGAMEITEM' \
    --limit '9' \
    --offset '55' \
    --region 'hnV8Aw9m6GvDSE2F' \
    --sectionExclusive  \
    --sortBy 'updatedAt,name' \
    --storeId '9sB6CV9KiWkbdpGq' \
    --tags 'WQIPK6mVytM5mBRT' \
    --targetNamespace '39gKYLk9DmjJh6Pn' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 497 'QueryItemsV2' test.out

#- 498 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pTXWAUt8lgqNM4po' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 498 'ImportStore1' test.out

#- 499 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'GEvIKCe3MrLxmnjm' \
    --body '{"itemIds": ["lAuaBCdhzXb6cBMP", "NMmjMi2uztFNfXg0", "UvwaZ0py16ShGomF"]}' \
    > test.out 2>&1
eval_tap $? 499 'ExportStore1' test.out

#- 500 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zUappaaODZaZ6Vzz' \
    --body '{"entitlementCollectionId": "tnntoxwsNtNxWoH5", "entitlementOrigin": "Other", "metadata": {"H5kesuOtYHLqcdy0": {}, "5YrqdFn8sQ7yc8xL": {}, "KyBfGLHEAKhp612Y": {}}, "origin": "Steam", "rewards": [{"currency": {"currencyCode": "ncRf7tEGzYqRoHm6", "namespace": "EtyXqQbKWMJ0aODi"}, "item": {"itemId": "Wn6bPmSa85Riu1al", "itemName": "aVEhjJZbwMHkFWLS", "itemSku": "zmAXAruYrVjX4HRT", "itemType": "vm3Qr9IkuW6jjofc"}, "quantity": 90, "type": "CURRENCY"}, {"currency": {"currencyCode": "WOV8LyivYbMG9LXP", "namespace": "bBh2E3wFchP3zTym"}, "item": {"itemId": "fVfny2M0KsS08cY3", "itemName": "fjI1YTT3qUMd0U73", "itemSku": "RjVeYSM479gn62li", "itemType": "zsWGrtIgVPb7hoo8"}, "quantity": 60, "type": "CURRENCY"}, {"currency": {"currencyCode": "c3w1tAXRrQtHkm0T", "namespace": "thcx9W7PkFNVa7cz"}, "item": {"itemId": "D4wybVjqOKrqYGxc", "itemName": "BxfjLUZHK0OO1yQs", "itemSku": "MBQAdOfrtHWyGg5T", "itemType": "U3INkMgjsnP8itev"}, "quantity": 26, "type": "CURRENCY"}], "source": "IAP", "transactionId": "Jjj5tfFQv384ri6A"}' \
    > test.out 2>&1
eval_tap $? 500 'FulfillRewardsV2' test.out

#- 501 FulfillItems
eval_tap 0 501 'FulfillItems # SKIP deprecated' test.out

#- 502 RetryFulfillItems
eval_tap 0 502 'RetryFulfillItems # SKIP deprecated' test.out

#- 503 RevokeItems
eval_tap 0 503 'RevokeItems # SKIP deprecated' test.out

#- 504 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId '7z0hsW0IHIYvJ7PP' \
    --body '{"transactionId": "gVaFwGhl5zqkzEu4"}' \
    > test.out 2>&1
eval_tap $? 504 'V2PublicFulfillAppleIAPItem' test.out

#- 505 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '1hVfVC7eLVWGk0Gj' \
    --userId 'YReIZaDC2Au2bEpy' \
    --body '{"items": [{"duration": 26, "endDate": "1972-01-12T00:00:00Z", "entitlementCollectionId": "ljXtowifBfAw30kO", "entitlementOrigin": "Playstation", "itemId": "tLhZzletCqa3lJMQ", "itemSku": "1sGlfqjDBzOjNeq8", "language": "JJhbi7QD0RW0qgxO", "metadata": {"0Y6TFpFSCsrhSGee": {}, "ExZYnGcrZHMKoTcI": {}, "XeKZzZBo6ARaQnNZ": {}}, "orderNo": "Q1R0PGBFVnc37aWV", "origin": "IOS", "quantity": 97, "region": "M3iVKjr5VDqakKdW", "source": "ORDER_REVOCATION", "startDate": "1978-08-15T00:00:00Z", "storeId": "GAH1oiS1JuO7MNoF"}, {"duration": 84, "endDate": "1977-06-06T00:00:00Z", "entitlementCollectionId": "npzwHhig9d6vdgfr", "entitlementOrigin": "Xbox", "itemId": "itD5tWXZVvjYqrEX", "itemSku": "KUDlmtixw9FtBVAW", "language": "T8PxL8674KYMeN2W", "metadata": {"2CNqmO8JALtCiDuG": {}, "QQsvWV3NSjXUXSMK": {}, "Y09x4TKOwsyRNnaL": {}}, "orderNo": "Nhw0xGnXc29UDQxe", "origin": "IOS", "quantity": 61, "region": "Bo2hB9u1v1POCjse", "source": "PAYMENT", "startDate": "1998-08-07T00:00:00Z", "storeId": "xaSbMjyFrYsITcyT"}, {"duration": 93, "endDate": "1984-03-03T00:00:00Z", "entitlementCollectionId": "rIk6hU0mqdwBJax1", "entitlementOrigin": "IOS", "itemId": "rbPUcvEOJ4Pghksb", "itemSku": "aThW37NTbz8HiRmu", "language": "knvXiTP0KrWQ3pgb", "metadata": {"HM0Svy3GRenDzwlT": {}, "E9Czhnck3GnyPFQH": {}, "gn9jVE6QGkZ8AVze": {}}, "orderNo": "iaDi67E3rTwN2LrT", "origin": "IOS", "quantity": 35, "region": "Arfe6EweJxWANt1b", "source": "SELL_BACK", "startDate": "1987-01-06T00:00:00Z", "storeId": "J5QRuvEsU5Qkmsmf"}]}' \
    > test.out 2>&1
eval_tap $? 505 'FulfillItemsV3' test.out

#- 506 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'FhPTfXVzS3hFUXbd' \
    --userId 'YU08BQZXTcZnHoYa' \
    > test.out 2>&1
eval_tap $? 506 'RetryFulfillItemsV3' test.out

#- 507 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'II5c5UqVvKR3ydSE' \
    --userId 'b2trPjqlB5c8a78g' \
    > test.out 2>&1
eval_tap $? 507 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE