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
echo "1..499"

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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["CAMPAIGN", "REWARD", "DLC"]}' \
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
    --body '{"data": [{"autoUpdate": true, "id": "JvaizwiilatuUjjt", "rewards": [{"currency": {"currencyCode": "9lIMGql5ElEa9EII", "namespace": "lGcHB3CfR3ncDlwi"}, "item": {"itemId": "3v3MFFJ1KesKoELC", "itemName": "pobBEG8X645xpdXp", "itemSku": "ai0rYaT5hOPjaf3H", "itemType": "0tYighU0VUfcYHJb"}, "quantity": 56, "type": "CURRENCY"}, {"currency": {"currencyCode": "8cM4NTwr0KHaAsmT", "namespace": "ej52WKi6tArAURt9"}, "item": {"itemId": "plCSVq8PdH6hJPUA", "itemName": "c0RVwXgAgntLMCua", "itemSku": "XBWQi6BqPg4xr0lC", "itemType": "ancUZGCHsZYoLfR1"}, "quantity": 75, "type": "CURRENCY"}, {"currency": {"currencyCode": "tOv7Zy0b65uvuKNu", "namespace": "y0ytZQ7M6Nzy1adn"}, "item": {"itemId": "SKOLFKx1dX4LuWJu", "itemName": "3pDMUAeeZ97SBROP", "itemSku": "YuG6XqP6oo7G73zd", "itemType": "xTgOfnwIdlNa29fD"}, "quantity": 77, "type": "CURRENCY"}], "rvn": 15}, {"autoUpdate": true, "id": "741IslKHzGlLKWUt", "rewards": [{"currency": {"currencyCode": "DQs61OQAoxyyQpRW", "namespace": "CiiPDGQhNPEwiJCf"}, "item": {"itemId": "2XJVrlzqQls1ozhL", "itemName": "VA3kE8jKvgatOEBM", "itemSku": "70TdlNBJYOmpu1VC", "itemType": "arzBsV6xnZ5Jrzzj"}, "quantity": 35, "type": "CURRENCY"}, {"currency": {"currencyCode": "caug6CWVG8SWP3gl", "namespace": "U6muswVJnNnN7kAa"}, "item": {"itemId": "7j0riFc5HTHQIoVs", "itemName": "Go7dwV9DBqFKHQkE", "itemSku": "TJyTlUrwDTnoujQD", "itemType": "4IEiH9Z5qXn3aoRt"}, "quantity": 23, "type": "CURRENCY"}, {"currency": {"currencyCode": "qOECohViHA5CzgFS", "namespace": "y8X1A3PrIfapq5AA"}, "item": {"itemId": "eMe4L3mDWORBVXTI", "itemName": "IJM9XsYIIZxiXNMR", "itemSku": "9BgaWcFX3SUBhyoT", "itemType": "sMWPAxUMkawaGpAy"}, "quantity": 35, "type": "ITEM"}], "rvn": 72}, {"autoUpdate": true, "id": "wMif3BOdkocVTd4B", "rewards": [{"currency": {"currencyCode": "xqGWV6mTJ0sQs6XN", "namespace": "bjvqhnUVLWu8olKd"}, "item": {"itemId": "xL6ozRmDD0jJvlfV", "itemName": "5OemPYdYT7DROCjt", "itemSku": "uzFMbAG9YI89hmgu", "itemType": "B8FOTjMLo4b9rIzq"}, "quantity": 61, "type": "CURRENCY"}, {"currency": {"currencyCode": "drKF7SUQPLG59e0k", "namespace": "5ZtX6wK7PpUlcIW3"}, "item": {"itemId": "2iK7MGt1ixY5rA1W", "itemName": "oVeJIePF8ZrQzP4z", "itemSku": "vtdxdbZUpd6FJtHJ", "itemType": "1pyVwyKQLY6FEO65"}, "quantity": 89, "type": "ITEM"}, {"currency": {"currencyCode": "b3z7CYLM8IlsHqff", "namespace": "nrfsGlfPaZKBwa3D"}, "item": {"itemId": "db60ufPpzwj1QGIF", "itemName": "mlVf4jvapseE9LN9", "itemSku": "bvhOrHflIOd6X3vi", "itemType": "LvtEk4mTIpUA9gxo"}, "quantity": 4, "type": "CURRENCY"}], "rvn": 98}]}' \
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
    --body '{"data": [{"platform": "STEAM", "platformDlcIdMap": {"38nEhoXmM2W7l6jH": "MA2rG3nakopAywel", "u01nryEJ0NqoTow0": "qiOiC4j0iktm0ZPL", "kLOsp0LZ5njN86Hl": "8kUXzt6bSc6bWvgp"}}, {"platform": "XBOX", "platformDlcIdMap": {"yW9dD1kOmvrAejcq": "2LgkQuaS7RBx3vim", "02jBOxrZDyvpcLYO": "WA8NjxOnaEok4nOO", "CzfsflhjbngJOUn1": "8G5MlfDTk8aG40Nl"}}, {"platform": "OCULUS", "platformDlcIdMap": {"547fH0XrKEDpEY8V": "nocGAjci0V3tBf2j", "nHGKXphn50c9tNLD": "ljhZ2jxLRX3z46OC", "aGBeMfPlNos4yBRj": "rERHEonAZR8GmEu0"}}]}' \
    > test.out 2>&1
eval_tap $? 63 'UpdatePlatformDLCConfig' test.out

#- 64 DeletePlatformDLCConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlatformDLCConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'DeletePlatformDLCConfig' test.out

#- 65 QueryEntitlements1
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements1 \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'GAME' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName '1p6QCyY6vSkVFWds' \
    --itemId 'bYuVEGVxYheR3j5m,NZ6vwv7K8Asvt1j1,Rx59hesNWy2NvZ85' \
    --limit '60' \
    --offset '58' \
    --origin 'Steam' \
    --userId '6ePeN8i4GrFES9z7' \
    > test.out 2>&1
eval_tap $? 65 'QueryEntitlements1' test.out

#- 66 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'xueHpATHccee9GXh,KcjmSEwdrkEnnqKz,FsLfYalUlfwEQKjU' \
    --limit '36' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 66 'QueryEntitlements' test.out

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
    --body '{"entitlementGrantList": [{"collectionId": "tfF3TQN0OcNDLr36", "endDate": "1981-01-06T00:00:00Z", "grantedCode": "zohZyjMQAg5mPYhr", "itemId": "LTyU8OhgfY9JQYGF", "itemNamespace": "4bYXEcENx9xZlAch", "language": "OB_LtqC_895", "metadata": {"jfIGaffoflEIByYq": {}, "eKN0meGelYF5wWaD": {}, "hukU4khGG4vZFTYn": {}}, "origin": "Xbox", "quantity": 4, "region": "kmSu4PWam1jxR7SE", "source": "REFERRAL_BONUS", "startDate": "1995-09-06T00:00:00Z", "storeId": "jteoc8fgvZDDhoO0"}, {"collectionId": "5oKqymxLD1Lcvw6T", "endDate": "1988-04-12T00:00:00Z", "grantedCode": "1m2lJFRZ3ZprZ60z", "itemId": "MjhTHeh94TSenE5h", "itemNamespace": "CFkIf5weqZ18MH57", "language": "wr-Igce-Nh", "metadata": {"ke4akncw7wu9TmXf": {}, "JWBPrx9Ns8eLzYEv": {}, "wSWTaLQjctvrK2jh": {}}, "origin": "Oculus", "quantity": 15, "region": "pKPlXn77AtYoFzLA", "source": "REDEEM_CODE", "startDate": "1979-12-12T00:00:00Z", "storeId": "QEPx3zTxBGtEJIYp"}, {"collectionId": "puUSsKoHw2hyd12u", "endDate": "1993-11-25T00:00:00Z", "grantedCode": "E7BEv3aevq6iohU1", "itemId": "cg4W1IS3Uv1BpWoJ", "itemNamespace": "Baqdg2FHcunsS1ln", "language": "Nq_241", "metadata": {"igBVZxiKdV57GvRy": {}, "d9UuL02Le8HSCsls": {}, "Dd4M1F5qRIblS7Nz": {}}, "origin": "System", "quantity": 66, "region": "LlkUetzCAWc9x1aM", "source": "IAP", "startDate": "1979-02-19T00:00:00Z", "storeId": "A2clJ5gEOaCgM6Yn"}], "userIds": ["ynMKquUicAeIVXto", "5mM7k8nbLzvtCIW5", "6RugbNEIpGBFUjOn"]}' \
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
    --body '{"appId": "2Qd2JzRbkF2I03dI", "appSecret": "jvBbA6bfbYaJCJjf"}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateOculusIAPConfig' test.out

#- 92 DeleteOculusIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteOculusIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 92 'DeleteOculusIAPConfig' test.out

#- 93 GetPlayStationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getPlayStationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 93 'GetPlayStationIAPConfig' test.out

#- 94 UpdatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "k2TUvn95FhO7VW3m", "backOfficeServerClientSecret": "bDVMDu87t0ldWf7i", "enableStreamJob": false, "environment": "IiKFtWtn4Yr2svKM", "streamName": "6pqLGZ0TBujELAUK", "streamPartnerName": "6mQ5iZgbwwm5iGzX"}' \
    > test.out 2>&1
eval_tap $? 94 'UpdatePlaystationIAPConfig' test.out

#- 95 DeletePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deletePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 95 'DeletePlaystationIAPConfig' test.out

#- 96 ValidateExistedPlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validateExistedPlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 96 'ValidateExistedPlaystationIAPConfig' test.out

#- 97 ValidatePlaystationIAPConfig
./ng net.accelbyte.sdk.cli.Main platform validatePlaystationIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"backOfficeServerClientId": "tcknrgidKupvXO6a", "backOfficeServerClientSecret": "j4hCmTC34jxW4pID", "enableStreamJob": true, "environment": "4VzW0CpoBCbyJsF5", "streamName": "IjF1c0W338HS6CBg", "streamPartnerName": "VRyihYNZ84CVhziX"}' \
    > test.out 2>&1
eval_tap $? 97 'ValidatePlaystationIAPConfig' test.out

#- 98 GetSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 98 'GetSteamIAPConfig' test.out

#- 99 UpdateSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appId": "V8HwSmvcvcDKF19y", "env": "LIVE", "publisherAuthenticationKey": "d6lPKvqDejvqklTS", "syncMode": "TRANSACTION"}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateSteamIAPConfig' test.out

#- 100 DeleteSteamIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteSteamIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 100 'DeleteSteamIAPConfig' test.out

#- 101 GetTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 101 'GetTwitchIAPConfig' test.out

#- 102 UpdateTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"clientId": "agTiRJ8daGTVX3Bb", "clientSecret": "7jlz5IfHgKjI9mwJ", "organizationId": "SrN8jkIykR2zbaI6"}' \
    > test.out 2>&1
eval_tap $? 102 'UpdateTwitchIAPConfig' test.out

#- 103 DeleteTwitchIAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteTwitchIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 103 'DeleteTwitchIAPConfig' test.out

#- 104 GetXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform getXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 104 'GetXblIAPConfig' test.out

#- 105 UpdateXblIAPConfig
./ng net.accelbyte.sdk.cli.Main platform updateXblIAPConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enableClawback": false, "entraAppClientId": "D7fEscShnGUGUtV9", "entraAppClientSecret": "GJ279GDbLNwjm3FK", "entraTenantId": "0nnX2poMfZ1hDHtb", "relyingPartyCert": "h4HtMlFgvh2Dp2So"}' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblIAPConfig' test.out

#- 106 DeleteXblAPConfig
./ng net.accelbyte.sdk.cli.Main platform deleteXblAPConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 106 'DeleteXblAPConfig' test.out

#- 107 UpdateXblBPCertFile
./ng net.accelbyte.sdk.cli.Main platform updateXblBPCertFile \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --password 'iIPp1yvfAHS0VgLu' \
    > test.out 2>&1
eval_tap $? 107 'UpdateXblBPCertFile' test.out

#- 108 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '11A3HTovFi4tPAGf' \
    --externalId 'leyCA6jEtcqsnzoV' \
    --limit '70' \
    --offset '77' \
    --source 'GOOGLE' \
    --startDate '7mpVI6eTYAjdPlCi' \
    --status 'WARN' \
    --type 'SpWBAetsanzqP8ox' \
    > test.out 2>&1
eval_tap $? 108 'QueryThirdPartyNotifications' test.out

#- 109 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '72' \
    --orderId 'rtbECD1CYPwaiBAx' \
    --steamId 'fYL8Avt70ZUT2fSk' \
    > test.out 2>&1
eval_tap $? 109 'QueryAbnormalTransactions' test.out

#- 110 AdminGetSteamJobInfo
./ng net.accelbyte.sdk.cli.Main platform adminGetSteamJobInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'AdminGetSteamJobInfo' test.out

#- 111 AdminResetSteamJobTime
./ng net.accelbyte.sdk.cli.Main platform adminResetSteamJobTime \
    --namespace "$AB_NAMESPACE" \
    --body '{"env": "SANDBOX", "lastTime": "1990-11-01T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 111 'AdminResetSteamJobTime' test.out

#- 112 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'IN6tvKgLB9QmJIOq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 112 'AdminRefundIAPOrder' test.out

#- 113 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '14' \
    --orderId 'P5szG71utjsQ4CrR' \
    --processStatus 'ERROR' \
    --steamId 'HZVNYzGMNIpWoSLk' \
    > test.out 2>&1
eval_tap $? 113 'QuerySteamReportHistories' test.out

#- 114 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'Urfuf4U3WeYeA9t2' \
    --limit '62' \
    --offset '81' \
    --platform 'TWITCH' \
    --productId 'KKWrFtHIi1CMgKAO' \
    --userId 'G5iDcCR5PbCvDLil' \
    > test.out 2>&1
eval_tap $? 114 'QueryThirdPartySubscription' test.out

#- 115 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo '8wj9cKM3Ar6MF35h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 115 'GetIAPOrderConsumeDetails' test.out

#- 116 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'CER4nGmWGgTJfHlJ' \
    --feature 'l4tHGa4XfZcd9CVn' \
    --itemId 'GqMX9FieeEssWEUl' \
    --itemType 'INGAMEITEM' \
    --startTime '7bhwntCVqiYOJf5K' \
    > test.out 2>&1
eval_tap $? 116 'DownloadInvoiceDetails' test.out

#- 117 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'wMZQjzvjSozv6CTR' \
    --feature 'Dl0zp9CzHFwinkBN' \
    --itemId 'i4gvqgl6TZ9TGVPm' \
    --itemType 'INGAMEITEM' \
    --startTime 'd5IQYBQuxLvPuWYv' \
    > test.out 2>&1
eval_tap $? 117 'GenerateInvoiceSummary' test.out

#- 118 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'E3fsNy9Z9OhxXvCp' \
    --body '{"categoryPath": "9y7fLD2qfCXnlUnq", "targetItemId": "xT1WsRNMZcA92hzC", "targetNamespace": "7MNa8vVe4MHX6AgM"}' \
    > test.out 2>&1
eval_tap $? 118 'SyncInGameItem' test.out

#- 119 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ep90AyyUJyAK5PRM' \
    --body '{"appId": "RMwdvl0hv6g62GxB", "appType": "GAME", "baseAppId": "9FK6e0MrPc4vtxk9", "boothName": "hVKlG56HlzGr7Xjd", "categoryPath": "yRJunZPkp6ccIBnW", "clazz": "yPw8mj7gyQ7XdIsz", "displayOrder": 67, "entitlementType": "CONSUMABLE", "ext": {"Rj46COPipH1MWVTH": {}, "G0qHJCWEfOJpZm9y": {}, "EYWNGMy2pgSGSUOK": {}}, "features": ["X9LM2IwEsdOGBXBw", "68eqGJtWf1Ybgg8r", "dwY9bmrvHmO07KNq"], "flexible": false, "images": [{"as": "btefXWznDe4LQdXf", "caption": "FBii2RAMEX5RMjBF", "height": 98, "imageUrl": "AOddIL2l3hPjNDKv", "smallImageUrl": "2LWfXqjr8fS79En3", "width": 45}, {"as": "T1IxVWCxdvPL9e4P", "caption": "01vxP8xj1LyEirUR", "height": 62, "imageUrl": "72Uo9UBJWodpdwsX", "smallImageUrl": "1jorcyR0x3YiHF8I", "width": 93}, {"as": "xTtmOFMebS4AdlNz", "caption": "wog2IhErkNhNcECW", "height": 45, "imageUrl": "u2WRcLiEtzVlnkfl", "smallImageUrl": "fn7pHY48F1dl1q92", "width": 26}], "inventoryConfig": {"customAttributes": {"H48aJuALEcSqcE15": {}, "u6D31DjOsrs3CUYA": {}, "TdqnQGbqiqOkNeAT": {}}, "serverCustomAttributes": {"j7eGjodd7CcJUrI6": {}, "MAugK5kypNrp2nFe": {}, "9FmN86sK5LOq4ft5": {}}, "slotUsed": 20}, "itemIds": ["nNlsa2bRBr27fVMW", "uAfDqLMR919IZPKO", "KiAVQXXOmqFHLbyX"], "itemQty": {"mgCNiXH8uenbC5Cp": 15, "yHjCH5olYLETRpAB": 55, "J9iqMcBL4BzhDUjh": 74}, "itemType": "SUBSCRIPTION", "listable": true, "localizations": {"nDByhnoluO6ti0QP": {"description": "2ssiJ66OzOj84O6t", "localExt": {"gohjtC7bzjPpucdd": {}, "XJ5zifF8y959anrN": {}, "SleywHbHig6IKWVZ": {}}, "longDescription": "77KeRWdECaFGzfZ2", "title": "hxcJ2Fnemn7M23Sz"}, "Uo4hNBDh9ZFP1OW0": {"description": "nXOErQPS4VsRoYIK", "localExt": {"69yg9ADCGiXaLs2x": {}, "jHkinOD975nARHCm": {}, "hNHSXuqIHsxvaUoX": {}}, "longDescription": "DmwWsukxncuD3QxC", "title": "XMd00YBWCaVVmM45"}, "mfIZsWhkS476dGGJ": {"description": "wJ00UH197MJ6zU7J", "localExt": {"LMQyMWzYQCAaPJgo": {}, "xGJoJaSzUtY4ZD0X": {}, "tb0U4pH16NUsVY21": {}}, "longDescription": "NVIs7NRen2Y3Ns0Q", "title": "JQeaWytPfds1BYx0"}}, "lootBoxConfig": {"rewardCount": 63, "rewards": [{"lootBoxItems": [{"count": 67, "duration": 1, "endDate": "1979-03-26T00:00:00Z", "itemId": "Rydf8ZyyZeHAWGgJ", "itemSku": "UbUJRMbkcTglbU86", "itemType": "FyOjApNHBVfNOURc"}, {"count": 18, "duration": 53, "endDate": "1996-11-01T00:00:00Z", "itemId": "3YYT9oTynmfIuBWg", "itemSku": "JTNFfM8M0IW4oe8K", "itemType": "Dgy0xZfAcNg14Ws8"}, {"count": 93, "duration": 70, "endDate": "1978-12-12T00:00:00Z", "itemId": "cu2Z3eDHH9WaVO4i", "itemSku": "KhDcJ7TCcNIsQ3Pu", "itemType": "ppUxDSK8aOTGMudc"}], "name": "xlCV4cNbJGQ57lPd", "odds": 0.142398458193016, "type": "PROBABILITY_GROUP", "weight": 65}, {"lootBoxItems": [{"count": 32, "duration": 18, "endDate": "1972-11-08T00:00:00Z", "itemId": "2DRfGt9GlyZVQ4X6", "itemSku": "7tPZSTpPq3xjrElv", "itemType": "vDgw0ag7kSWE0Hiq"}, {"count": 25, "duration": 22, "endDate": "1987-10-06T00:00:00Z", "itemId": "OdC6ItxDT8p4n4XC", "itemSku": "FkD1AJLCwszbZxuH", "itemType": "SgDOK8bjoF7bL263"}, {"count": 49, "duration": 74, "endDate": "1973-01-15T00:00:00Z", "itemId": "px78fvsyhE2BKtyT", "itemSku": "DSIM7mkmvZ7Cmsh4", "itemType": "US8o4jfMANPpmZDd"}], "name": "MiCxmuCCVuFjS1GC", "odds": 0.8694133005927012, "type": "PROBABILITY_GROUP", "weight": 44}, {"lootBoxItems": [{"count": 2, "duration": 42, "endDate": "1977-04-22T00:00:00Z", "itemId": "B4vEgj3HOmhcWm42", "itemSku": "8XejRF94NIY9nMrB", "itemType": "Zo0lNUBDShHD32vv"}, {"count": 77, "duration": 19, "endDate": "1999-04-15T00:00:00Z", "itemId": "8FPwTiXfLcxDC9Yn", "itemSku": "d02mECIQhfIhHtAD", "itemType": "UQ9zimQTQT95pFJU"}, {"count": 53, "duration": 42, "endDate": "1989-06-10T00:00:00Z", "itemId": "syAfeKOufV4f15No", "itemSku": "hXu6opxQGRt6Pqlk", "itemType": "L0diRhLC10ih2EQf"}], "name": "Y3XCv4hdOa6FdZhN", "odds": 0.6278592200414991, "type": "PROBABILITY_GROUP", "weight": 1}], "rollFunction": "CUSTOM"}, "maxCount": 26, "maxCountPerUser": 13, "name": "FjGRbxtABPXDmgNE", "optionBoxConfig": {"boxItems": [{"count": 73, "duration": 64, "endDate": "1984-03-04T00:00:00Z", "itemId": "hgGq5GIDhNC66szb", "itemSku": "CCf73IFbRkPSSITz", "itemType": "4TjCrJHXGXku2YVu"}, {"count": 83, "duration": 57, "endDate": "1984-01-23T00:00:00Z", "itemId": "hxHmnrrV9ZGWrZ05", "itemSku": "sxe6A6RpmKDebNky", "itemType": "lbynkgT9vayLLiiz"}, {"count": 0, "duration": 5, "endDate": "1972-03-13T00:00:00Z", "itemId": "7Ge6zKJdlt7rjF5R", "itemSku": "aJwvkWVco2LTo5ij", "itemType": "lvDF8qBWCQ9dLWYy"}]}, "purchasable": false, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 95, "fixedTrialCycles": 7, "graceDays": 14}, "regionData": {"GM5anIloyj9lhbvu": [{"currencyCode": "QdW2jwKUckc794ry", "currencyNamespace": "Y91lX8DD4MYXlrJ8", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1985-09-30T00:00:00Z", "discountPercentage": 43, "discountPurchaseAt": "1982-06-23T00:00:00Z", "expireAt": "1973-05-23T00:00:00Z", "price": 73, "purchaseAt": "1979-04-03T00:00:00Z", "trialPrice": 43}, {"currencyCode": "7PeiMH8z8dVej8N2", "currencyNamespace": "yv6VTnOK7xAvM7tu", "currencyType": "REAL", "discountAmount": 62, "discountExpireAt": "1998-06-02T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1978-06-03T00:00:00Z", "expireAt": "1992-12-17T00:00:00Z", "price": 44, "purchaseAt": "1978-07-14T00:00:00Z", "trialPrice": 97}, {"currencyCode": "xSVp3Gd2TK0HzYvi", "currencyNamespace": "TgYmx82JVBRLPZ6I", "currencyType": "VIRTUAL", "discountAmount": 57, "discountExpireAt": "1981-04-26T00:00:00Z", "discountPercentage": 26, "discountPurchaseAt": "1987-02-03T00:00:00Z", "expireAt": "1975-01-30T00:00:00Z", "price": 57, "purchaseAt": "1971-02-22T00:00:00Z", "trialPrice": 37}], "uBF6Gsvvdl8jHz9x": [{"currencyCode": "7XZIjU4IK9lOLaZa", "currencyNamespace": "MphKCqTq3EVheJjo", "currencyType": "VIRTUAL", "discountAmount": 53, "discountExpireAt": "1986-06-19T00:00:00Z", "discountPercentage": 19, "discountPurchaseAt": "1985-05-30T00:00:00Z", "expireAt": "1990-04-13T00:00:00Z", "price": 70, "purchaseAt": "1993-07-09T00:00:00Z", "trialPrice": 26}, {"currencyCode": "GnNuhoJM3WWPvvCi", "currencyNamespace": "Cf33ViEdqQpoGkUW", "currencyType": "REAL", "discountAmount": 82, "discountExpireAt": "1984-02-10T00:00:00Z", "discountPercentage": 21, "discountPurchaseAt": "1988-12-24T00:00:00Z", "expireAt": "1995-08-28T00:00:00Z", "price": 5, "purchaseAt": "1999-12-04T00:00:00Z", "trialPrice": 97}, {"currencyCode": "AGv6c1ESC6hZYTYZ", "currencyNamespace": "bzf5aANNNs5kgSZZ", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1988-05-11T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1971-01-18T00:00:00Z", "expireAt": "1980-08-01T00:00:00Z", "price": 55, "purchaseAt": "1991-05-05T00:00:00Z", "trialPrice": 67}], "mWJO5vzzXZj08a6K": [{"currencyCode": "1XRVfriSpPFnZBJZ", "currencyNamespace": "kDnEiyfa2LrnpZxN", "currencyType": "REAL", "discountAmount": 93, "discountExpireAt": "1990-06-03T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1988-05-30T00:00:00Z", "expireAt": "1988-01-07T00:00:00Z", "price": 34, "purchaseAt": "1984-04-24T00:00:00Z", "trialPrice": 41}, {"currencyCode": "FY76PU1AziBOHEAj", "currencyNamespace": "1cT3u6Zc2FbrTFzn", "currencyType": "REAL", "discountAmount": 13, "discountExpireAt": "1982-08-31T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1988-07-02T00:00:00Z", "expireAt": "1997-08-16T00:00:00Z", "price": 71, "purchaseAt": "1994-12-20T00:00:00Z", "trialPrice": 33}, {"currencyCode": "Wf6T3by2kYSCdnFK", "currencyNamespace": "Lc0xcTjqjdcEfU61", "currencyType": "VIRTUAL", "discountAmount": 80, "discountExpireAt": "1977-04-17T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1996-10-21T00:00:00Z", "expireAt": "1999-05-18T00:00:00Z", "price": 99, "purchaseAt": "1985-07-16T00:00:00Z", "trialPrice": 13}]}, "saleConfig": {"currencyCode": "np1ck1vT90C6o86c", "price": 91}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "cgbUmulhe98oaFKl", "stackable": false, "status": "ACTIVE", "tags": ["0vfWVZoRRMPi57Hy", "KKz5nyI6ulKNKoXa", "w9GYxjiiOQAD77ci"], "targetCurrencyCode": "0dgx1JgjC56pda3Y", "targetNamespace": "htQxpCYME6x21pdX", "thumbnailUrl": "2QSPAd9sxoLnWGP1", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 119 'CreateItem' test.out

#- 120 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'xw1KOPhuvHuYrGWD' \
    --appId 'K41uMOC0mRvSoaGk' \
    > test.out 2>&1
eval_tap $? 120 'GetItemByAppId' test.out

#- 121 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'DEMO' \
    --availableDate 'ktF5wnJDg9Q3WXiy' \
    --baseAppId 'dCOInVolsr6CHmj7' \
    --categoryPath '63vLwtYEJTSiXjcY' \
    --features '5ZPkv90lyKSTWLxS' \
    --includeSubCategoryItem  \
    --itemType 'OPTIONBOX' \
    --limit '1' \
    --offset '93' \
    --region '0LpupEi5DbkVs3qF' \
    --sortBy 'displayOrder:desc,name:desc,updatedAt:asc' \
    --storeId 'PfKofwXOIZZQAJza' \
    --tags '84lKKmVOaTS6xBbN' \
    --targetNamespace 'rSUAW2ak7ISDrBVg' \
    > test.out 2>&1
eval_tap $? 121 'QueryItems' test.out

#- 122 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '6NuDZvPb1kuUfNfU,De4g7q6PHEaqbzHv,DDl1jiLw3XMGBA6J' \
    > test.out 2>&1
eval_tap $? 122 'ListBasicItemsByFeatures' test.out

#- 123 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'XDpA1tIC45C0oaGo' \
    --itemIds 'uFu4hXONgUwJnUpr' \
    > test.out 2>&1
eval_tap $? 123 'GetItems' test.out

#- 124 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yDeRcpUvlrw2MwC1' \
    --sku 'uuokpaIjL0Vxe5n9' \
    > test.out 2>&1
eval_tap $? 124 'GetItemBySku' test.out

#- 125 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Lx3QcFo9gxOgvDc7' \
    --populateBundle  \
    --region 'xMrRKvw8ISP2WKmC' \
    --storeId 'RRXBxlalCHtWlKxL' \
    --sku 'pS8fLWoQ5nuJhatQ' \
    > test.out 2>&1
eval_tap $? 125 'GetLocaleItemBySku' test.out

#- 126 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'PxR7dvBVC5zgOKLT' \
    --region 'DmHe8c1eJ9sde7Ry' \
    --storeId 't4udIv22M18uux9x' \
    --itemIds 'BomQFPFWy5cwNPI6' \
    --userId 'aFo0MVwDZCIXFNEL' \
    > test.out 2>&1
eval_tap $? 126 'GetEstimatedPrice' test.out

#- 127 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '3uWVRz3V7YbJM3bN' \
    --sku 'LWHAbCZixe2cQ6O3' \
    > test.out 2>&1
eval_tap $? 127 'GetItemIdBySku' test.out

#- 128 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku '0lpzcBQMAEcNcJqr,KxnMzSYoc4ZjiMY4,H34B6wVd8ipcKDwQ' \
    --storeId 'eUWtjCC2UH6jzMO3' \
    > test.out 2>&1
eval_tap $? 128 'GetBulkItemIdBySkus' test.out

#- 129 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'AfmOS5mQNyRPZFPN' \
    --region 'P56l1AT6OLKmZhCZ' \
    --storeId 'xxPPdPwOtEuWBSO2' \
    --itemIds 'jJepUnEEgja2mIE2' \
    > test.out 2>&1
eval_tap $? 129 'BulkGetLocaleItems' test.out

#- 130 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 130 'GetAvailablePredicateTypes' test.out

#- 131 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'kLTnJwc5XmkCuL5W' \
    --userId '4tKt6G3j9LYdG7xV' \
    --body '{"itemIds": ["PqBqe9RDQMBSYAFL", "qp8PF5hCcoukWpnb", "z4ys7j6lxuU3u2HE"]}' \
    > test.out 2>&1
eval_tap $? 131 'ValidateItemPurchaseCondition' test.out

#- 132 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'G0qfKegvFTD1sPyk' \
    --body '{"changes": [{"itemIdentities": ["S8YLmwtYgWGcA0h4", "G1LZ1HaX5UBMbsF4", "4VTsLDRzdq22cbny"], "itemIdentityType": "ITEM_ID", "regionData": {"3ggFDh2kaZP7pnnV": [{"currencyCode": "fxPwc259HF9ejHaI", "currencyNamespace": "LQruAuYyJLYGqMv8", "currencyType": "VIRTUAL", "discountAmount": 30, "discountExpireAt": "1997-06-09T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1993-02-19T00:00:00Z", "discountedPrice": 34, "expireAt": "1976-03-31T00:00:00Z", "price": 32, "purchaseAt": "1979-10-31T00:00:00Z", "trialPrice": 34}, {"currencyCode": "70uJmUL0uzElixc0", "currencyNamespace": "23dIvDiA0tQWlHwB", "currencyType": "REAL", "discountAmount": 20, "discountExpireAt": "1994-04-16T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1988-07-27T00:00:00Z", "discountedPrice": 25, "expireAt": "1981-01-05T00:00:00Z", "price": 48, "purchaseAt": "1984-06-17T00:00:00Z", "trialPrice": 97}, {"currencyCode": "4YK87DYAWWcbcbGW", "currencyNamespace": "mKgE8CZ4AELr5lra", "currencyType": "REAL", "discountAmount": 24, "discountExpireAt": "1987-06-21T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1989-12-04T00:00:00Z", "discountedPrice": 42, "expireAt": "1976-08-21T00:00:00Z", "price": 40, "purchaseAt": "1975-10-18T00:00:00Z", "trialPrice": 9}], "hgFsqHC9h5JPiMEt": [{"currencyCode": "gKuiGTYgwWv5XldL", "currencyNamespace": "6rOVGcRAn51rVAQS", "currencyType": "VIRTUAL", "discountAmount": 31, "discountExpireAt": "1997-09-15T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1974-10-25T00:00:00Z", "discountedPrice": 56, "expireAt": "1971-12-20T00:00:00Z", "price": 25, "purchaseAt": "1987-10-24T00:00:00Z", "trialPrice": 20}, {"currencyCode": "A3V9DKlCeZ7mLYsH", "currencyNamespace": "ooOIaxIpb1cIOJPS", "currencyType": "VIRTUAL", "discountAmount": 24, "discountExpireAt": "1993-10-12T00:00:00Z", "discountPercentage": 20, "discountPurchaseAt": "1992-10-14T00:00:00Z", "discountedPrice": 53, "expireAt": "1989-06-05T00:00:00Z", "price": 61, "purchaseAt": "1998-09-30T00:00:00Z", "trialPrice": 29}, {"currencyCode": "tx60AehGz1ermJYX", "currencyNamespace": "sYgL7TfyIlAwjTZd", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1989-09-19T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1989-07-27T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-06-06T00:00:00Z", "price": 46, "purchaseAt": "1974-07-01T00:00:00Z", "trialPrice": 11}], "TX2bamSCvX1nwvSW": [{"currencyCode": "dDwD7WJHzgNZUKsI", "currencyNamespace": "5y0mR3zMyTsftKqn", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1988-07-01T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1983-01-22T00:00:00Z", "discountedPrice": 1, "expireAt": "1981-08-05T00:00:00Z", "price": 81, "purchaseAt": "1973-05-12T00:00:00Z", "trialPrice": 49}, {"currencyCode": "dOzg3hr6ucHf7dbh", "currencyNamespace": "2iKNUl0qJqzoKMRM", "currencyType": "REAL", "discountAmount": 38, "discountExpireAt": "1998-01-19T00:00:00Z", "discountPercentage": 85, "discountPurchaseAt": "1993-08-01T00:00:00Z", "discountedPrice": 71, "expireAt": "1975-11-25T00:00:00Z", "price": 46, "purchaseAt": "1976-11-04T00:00:00Z", "trialPrice": 22}, {"currencyCode": "sx4SnKNXLMUaDSww", "currencyNamespace": "QlnNRZJHBSB4fZWE", "currencyType": "REAL", "discountAmount": 70, "discountExpireAt": "1995-06-10T00:00:00Z", "discountPercentage": 38, "discountPurchaseAt": "1999-09-10T00:00:00Z", "discountedPrice": 10, "expireAt": "1977-03-17T00:00:00Z", "price": 21, "purchaseAt": "1997-05-03T00:00:00Z", "trialPrice": 89}]}}, {"itemIdentities": ["1Zktx3N7WNMYIfcD", "KbLu8pnK34oA1keY", "XJvtggDdXjbdjMBa"], "itemIdentityType": "ITEM_ID", "regionData": {"9wdc8bihhWjfZpfc": [{"currencyCode": "FBUsnnDJlmD1iEok", "currencyNamespace": "bUiYzCQh2iNTwtno", "currencyType": "REAL", "discountAmount": 6, "discountExpireAt": "1988-01-23T00:00:00Z", "discountPercentage": 36, "discountPurchaseAt": "1991-06-19T00:00:00Z", "discountedPrice": 52, "expireAt": "1997-11-07T00:00:00Z", "price": 29, "purchaseAt": "1994-08-10T00:00:00Z", "trialPrice": 88}, {"currencyCode": "GQbO4S3rURGWUzPA", "currencyNamespace": "E6SdV4D5jftRl9rZ", "currencyType": "REAL", "discountAmount": 50, "discountExpireAt": "1981-07-21T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1979-12-25T00:00:00Z", "discountedPrice": 45, "expireAt": "1984-05-20T00:00:00Z", "price": 5, "purchaseAt": "1978-12-03T00:00:00Z", "trialPrice": 99}, {"currencyCode": "7FdsJP1G9tyBTfER", "currencyNamespace": "XdvgD1Qf7Ot2DkUt", "currencyType": "VIRTUAL", "discountAmount": 13, "discountExpireAt": "1973-07-10T00:00:00Z", "discountPercentage": 47, "discountPurchaseAt": "1997-04-13T00:00:00Z", "discountedPrice": 56, "expireAt": "1972-12-24T00:00:00Z", "price": 44, "purchaseAt": "1973-07-12T00:00:00Z", "trialPrice": 19}], "YnEBhXtAVxCd3meT": [{"currencyCode": "rT7cF9oVCh89wNOk", "currencyNamespace": "KYssVejcL3kR3hCG", "currencyType": "REAL", "discountAmount": 60, "discountExpireAt": "1971-03-08T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1987-04-14T00:00:00Z", "discountedPrice": 54, "expireAt": "1981-08-02T00:00:00Z", "price": 83, "purchaseAt": "1990-10-02T00:00:00Z", "trialPrice": 23}, {"currencyCode": "R5BWa9VzIkaQEl1i", "currencyNamespace": "UProNB6hI6IpGcTo", "currencyType": "REAL", "discountAmount": 14, "discountExpireAt": "1989-09-10T00:00:00Z", "discountPercentage": 96, "discountPurchaseAt": "1982-01-30T00:00:00Z", "discountedPrice": 41, "expireAt": "1993-02-28T00:00:00Z", "price": 67, "purchaseAt": "1992-11-19T00:00:00Z", "trialPrice": 43}, {"currencyCode": "wV3zDuqVlVTypcYP", "currencyNamespace": "K8IxrSZuxWl0Je4f", "currencyType": "VIRTUAL", "discountAmount": 78, "discountExpireAt": "1987-07-23T00:00:00Z", "discountPercentage": 55, "discountPurchaseAt": "1982-04-11T00:00:00Z", "discountedPrice": 89, "expireAt": "1999-04-21T00:00:00Z", "price": 60, "purchaseAt": "1995-12-12T00:00:00Z", "trialPrice": 26}], "ht4JwnPS2urJqero": [{"currencyCode": "bWMZGVL5KLTxahWl", "currencyNamespace": "S6XdBaKSLCgOOPXM", "currencyType": "VIRTUAL", "discountAmount": 94, "discountExpireAt": "1982-05-24T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1989-04-02T00:00:00Z", "discountedPrice": 6, "expireAt": "1989-06-28T00:00:00Z", "price": 71, "purchaseAt": "1983-05-14T00:00:00Z", "trialPrice": 46}, {"currencyCode": "HDNacl4F9G6Dl5TF", "currencyNamespace": "wBY6HKXAblkT8VGg", "currencyType": "VIRTUAL", "discountAmount": 69, "discountExpireAt": "1982-12-17T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1994-09-25T00:00:00Z", "discountedPrice": 25, "expireAt": "1997-09-18T00:00:00Z", "price": 46, "purchaseAt": "1988-03-05T00:00:00Z", "trialPrice": 1}, {"currencyCode": "Vj7eDTaka9ABfX1I", "currencyNamespace": "ByPEOuPhGspRi3bh", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1985-08-14T00:00:00Z", "discountPercentage": 56, "discountPurchaseAt": "1996-10-18T00:00:00Z", "discountedPrice": 80, "expireAt": "1988-10-09T00:00:00Z", "price": 73, "purchaseAt": "1988-07-06T00:00:00Z", "trialPrice": 51}]}}, {"itemIdentities": ["ytpcubN4AUUPFPsc", "ZsXeJOD4DMtqfIGi", "GJovgWSRxZ8N4UQ2"], "itemIdentityType": "ITEM_ID", "regionData": {"YOJvxGRxUzrTwagH": [{"currencyCode": "7BMT1IZKTdNFVBQ1", "currencyNamespace": "crBXAupATO8uXsqV", "currencyType": "REAL", "discountAmount": 8, "discountExpireAt": "1972-03-10T00:00:00Z", "discountPercentage": 8, "discountPurchaseAt": "1995-05-09T00:00:00Z", "discountedPrice": 29, "expireAt": "1979-06-01T00:00:00Z", "price": 92, "purchaseAt": "1985-03-18T00:00:00Z", "trialPrice": 97}, {"currencyCode": "DAM0Riw8wLYW3n4F", "currencyNamespace": "3LD1EDwBXw5uBYeQ", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1985-07-27T00:00:00Z", "discountPercentage": 54, "discountPurchaseAt": "1979-06-23T00:00:00Z", "discountedPrice": 82, "expireAt": "1995-12-25T00:00:00Z", "price": 19, "purchaseAt": "1995-01-02T00:00:00Z", "trialPrice": 62}, {"currencyCode": "c1cQvSxgTNIUzxDg", "currencyNamespace": "BlIbuzm7DzJ20NFR", "currencyType": "REAL", "discountAmount": 30, "discountExpireAt": "1987-06-27T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1993-09-24T00:00:00Z", "discountedPrice": 6, "expireAt": "1971-11-17T00:00:00Z", "price": 32, "purchaseAt": "1980-05-27T00:00:00Z", "trialPrice": 33}], "PmbpuptECGd5cdXC": [{"currencyCode": "2Sesc6y68whNBYl9", "currencyNamespace": "iCqfW6rqGOQny4ij", "currencyType": "REAL", "discountAmount": 49, "discountExpireAt": "1986-06-01T00:00:00Z", "discountPercentage": 86, "discountPurchaseAt": "1996-02-28T00:00:00Z", "discountedPrice": 85, "expireAt": "1991-04-28T00:00:00Z", "price": 68, "purchaseAt": "1977-01-10T00:00:00Z", "trialPrice": 69}, {"currencyCode": "59gQffkNOmubxEJr", "currencyNamespace": "2qEAuJbpZSrcbc4L", "currencyType": "REAL", "discountAmount": 11, "discountExpireAt": "1982-10-25T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1971-11-01T00:00:00Z", "discountedPrice": 89, "expireAt": "1982-01-18T00:00:00Z", "price": 14, "purchaseAt": "1998-03-21T00:00:00Z", "trialPrice": 40}, {"currencyCode": "Le5zohg9s9utRQt2", "currencyNamespace": "8b6o3K0COF74tz6a", "currencyType": "REAL", "discountAmount": 56, "discountExpireAt": "1996-01-11T00:00:00Z", "discountPercentage": 83, "discountPurchaseAt": "1972-04-01T00:00:00Z", "discountedPrice": 45, "expireAt": "1981-01-14T00:00:00Z", "price": 30, "purchaseAt": "1982-01-04T00:00:00Z", "trialPrice": 20}], "JYdMqGegcg3eRvBZ": [{"currencyCode": "XN3cjIXmFWRJnj8x", "currencyNamespace": "N7HDPTUEDPN1Kb4U", "currencyType": "REAL", "discountAmount": 84, "discountExpireAt": "1985-08-30T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1994-03-12T00:00:00Z", "discountedPrice": 92, "expireAt": "1971-09-09T00:00:00Z", "price": 25, "purchaseAt": "1974-07-01T00:00:00Z", "trialPrice": 78}, {"currencyCode": "2FNXypoOLl13j84P", "currencyNamespace": "0KqirJ4PkMFtsnFf", "currencyType": "VIRTUAL", "discountAmount": 86, "discountExpireAt": "1984-09-06T00:00:00Z", "discountPercentage": 46, "discountPurchaseAt": "1985-04-11T00:00:00Z", "discountedPrice": 34, "expireAt": "1980-02-14T00:00:00Z", "price": 57, "purchaseAt": "1974-06-21T00:00:00Z", "trialPrice": 25}, {"currencyCode": "BSKLSQ4GvLtz50D3", "currencyNamespace": "rpBfBovqLwXBuT30", "currencyType": "VIRTUAL", "discountAmount": 87, "discountExpireAt": "1997-11-24T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1993-01-28T00:00:00Z", "discountedPrice": 19, "expireAt": "1997-06-17T00:00:00Z", "price": 48, "purchaseAt": "1985-09-20T00:00:00Z", "trialPrice": 91}]}}]}' \
    > test.out 2>&1
eval_tap $? 132 'BulkUpdateRegionData' test.out

#- 133 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'BUNDLE' \
    --limit '1' \
    --offset '44' \
    --sortBy 'BKoUfiHjGmCyPsKC' \
    --storeId 'JTv1ic9gvagF2cSu' \
    --keyword 'ztsJ5tj64gV7nmDk' \
    --language '29mcjSuz9vbNStqP' \
    > test.out 2>&1
eval_tap $? 133 'SearchItems' test.out

#- 134 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '39' \
    --offset '21' \
    --sortBy 'displayOrder:asc,displayOrder:desc,createdAt' \
    --storeId 'QN6eKAGiZFCftT0R' \
    > test.out 2>&1
eval_tap $? 134 'QueryUncategorizedItems' test.out

#- 135 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'WECdjWYrnulxcCKA' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'ru8pOaAVLDB4k3Jw' \
    > test.out 2>&1
eval_tap $? 135 'GetItem' test.out

#- 136 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'kdaxR7GJpYmuYCPG' \
    --namespace "$AB_NAMESPACE" \
    --storeId '181q9GA5DydC2D8U' \
    --body '{"appId": "T6KOc4VPDUR9ayaz", "appType": "GAME", "baseAppId": "gLlRxOelKykICRxF", "boothName": "6HtlER2txs4qrNAR", "categoryPath": "ATn6KXOutlYBbLhL", "clazz": "8KXx25FZfQIodVBq", "displayOrder": 87, "entitlementType": "CONSUMABLE", "ext": {"sBpCJBIXLGYcwWVR": {}, "K6UKk5ozrXA4HZHN": {}, "yq9odanhR1Zrm3th": {}}, "features": ["T5kDTyPl3dKF7NXE", "UvV87yfkycLSVdle", "SaAylsmLYe2phYOg"], "flexible": false, "images": [{"as": "NQ8VOHGwbADMfuOm", "caption": "h0lciRhVZ2DeoODX", "height": 79, "imageUrl": "Jdrmj5vhzgsJwex7", "smallImageUrl": "wq8ZPlXNaUNgdY2v", "width": 10}, {"as": "vUWDOrFZKPNoN9AW", "caption": "tLK9TFgi9j2XMh9W", "height": 31, "imageUrl": "6EPb988NzxrDKVpU", "smallImageUrl": "Ljjiw3NeVG4DJi9D", "width": 0}, {"as": "zzriCDWXT59SRu0Y", "caption": "qUxKDc84OMIzvTSc", "height": 7, "imageUrl": "V5YfxnUNcwjr7gSG", "smallImageUrl": "hnfuF4WZiQVICVpW", "width": 7}], "inventoryConfig": {"customAttributes": {"TPwD3jxF7vxRUY0i": {}, "lrNoFT98SgtJd4Z5": {}, "f8nfaKqdZFLbZEHx": {}}, "serverCustomAttributes": {"sDxeR6d7r1SQw80J": {}, "fMpPrSqYypRUnq5o": {}, "4ETeCUYG9ccTt7Wx": {}}, "slotUsed": 47}, "itemIds": ["hURx1yPeczRpdk0H", "ATGylx2JG2KNGfhz", "fCTxxrsRRLee3TcJ"], "itemQty": {"7DQIi45aCDHN9mVu": 12, "bqWfG9BJ6FVKlbYH": 40, "D9UT67bOwugFDa6w": 96}, "itemType": "INGAMEITEM", "listable": false, "localizations": {"ehKqwCh86XmRkCEc": {"description": "fHDCdl59Wp9A3tXG", "localExt": {"ve6DdK6uvg8f2cIo": {}, "Byk9fxtvsgeAxo57": {}, "nKAbZpsbJ4Iu5KJ0": {}}, "longDescription": "ynxGBlacDCdFe8AT", "title": "UqVxcSthrpnMUBsn"}, "UfuQIcSbUt5UGkIn": {"description": "FGpuUsdtq4dOwNES", "localExt": {"zCEW9dUVhZjLftC3": {}, "sCS8CpLCqPD9CeDE": {}, "dCnnL6Kt1Bjj3b8Q": {}}, "longDescription": "M8Rr45ULqXQgvwD3", "title": "PsKDJiWxQBwaS7rD"}, "Bf2S54phbdyGDt47": {"description": "f9GWRlE9hqz6rjDN", "localExt": {"o4rhjxUdMM83Wekq": {}, "fWv04vvn9bk5qr8q": {}, "s2mqtnGAqXUjNypF": {}}, "longDescription": "6MMqWpdEJsPoaIbY", "title": "z8cK5jlpJdre5ur6"}}, "lootBoxConfig": {"rewardCount": 50, "rewards": [{"lootBoxItems": [{"count": 92, "duration": 44, "endDate": "1982-02-18T00:00:00Z", "itemId": "JDdvM7T7PX2vamIR", "itemSku": "ZHzsIYOCUoiCXNjr", "itemType": "dQL2jdx1eIba1sB0"}, {"count": 69, "duration": 2, "endDate": "1980-09-06T00:00:00Z", "itemId": "J06DzfbzRYt4OVUy", "itemSku": "umBeIqdQGZC5kM03", "itemType": "HHijsQRj7N8IAjms"}, {"count": 28, "duration": 63, "endDate": "1977-03-21T00:00:00Z", "itemId": "jj0ZR50BQ1U6aFD3", "itemSku": "O2kXQSc58zgZVl4g", "itemType": "IF7v3qbZu9M3OxqV"}], "name": "AT4H1lRZ9Z1JBrHR", "odds": 0.41732140180114996, "type": "REWARD", "weight": 20}, {"lootBoxItems": [{"count": 82, "duration": 55, "endDate": "1981-06-20T00:00:00Z", "itemId": "IxzPqb6n73m0jiaD", "itemSku": "H86d9rsKgzCsMulp", "itemType": "B8HZUtVVaJCiLgKO"}, {"count": 46, "duration": 37, "endDate": "1986-01-28T00:00:00Z", "itemId": "fWhT5B4WedopzwSl", "itemSku": "uBtRFPKThyGnbjmP", "itemType": "DKFS6u9FHuv1M3qf"}, {"count": 5, "duration": 18, "endDate": "1974-01-23T00:00:00Z", "itemId": "4SqIV6LQPHlaeYl4", "itemSku": "csFq65cU66yJaj4o", "itemType": "voKWE4EW0sw8v5pe"}], "name": "iuxoBJATauyD3XCX", "odds": 0.7717308275452747, "type": "REWARD_GROUP", "weight": 5}, {"lootBoxItems": [{"count": 18, "duration": 53, "endDate": "1983-07-14T00:00:00Z", "itemId": "EvMf9yilUEujk6oq", "itemSku": "Yo1HQYTFzwdOMdup", "itemType": "wD4O3uNbcIDcIyvZ"}, {"count": 3, "duration": 87, "endDate": "1992-11-02T00:00:00Z", "itemId": "y1T4hfwkuVykH4Rp", "itemSku": "fmjIXFGZ5PKdbabJ", "itemType": "IkNnt9P1Tkm08luh"}, {"count": 35, "duration": 6, "endDate": "1979-09-23T00:00:00Z", "itemId": "PRMDbUXBWTbpAogG", "itemSku": "2wlZkLhuU5FI8Nij", "itemType": "FI0GKwJ3vfXlsAMy"}], "name": "2Zp2UAGxHnmSxvkG", "odds": 0.9956812351611186, "type": "REWARD", "weight": 90}], "rollFunction": "DEFAULT"}, "maxCount": 43, "maxCountPerUser": 49, "name": "neoW6JBcGp9Rx2Rf", "optionBoxConfig": {"boxItems": [{"count": 5, "duration": 97, "endDate": "1993-03-14T00:00:00Z", "itemId": "hXpmeeHdvphas9S7", "itemSku": "ivHEoLbUMM47f1Ur", "itemType": "eUpxEkXIbE1ETzRJ"}, {"count": 0, "duration": 76, "endDate": "1984-11-10T00:00:00Z", "itemId": "fZIim0sFPm1YN27b", "itemSku": "ojDVaZLpx4kEWYkO", "itemType": "6KrKUMhJrASBh61h"}, {"count": 26, "duration": 17, "endDate": "1996-09-20T00:00:00Z", "itemId": "KSSrF35anDGvur19", "itemSku": "V18oIrUKXttgAI2Q", "itemType": "dWJFLmoPEgd8EMsp"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 69, "fixedTrialCycles": 28, "graceDays": 44}, "regionData": {"kic9gj5vyUMAAmIH": [{"currencyCode": "YbsxG5N066FXb88S", "currencyNamespace": "bLOa21DiSFsm0XXQ", "currencyType": "VIRTUAL", "discountAmount": 38, "discountExpireAt": "1978-08-02T00:00:00Z", "discountPercentage": 44, "discountPurchaseAt": "1994-12-14T00:00:00Z", "expireAt": "1977-09-10T00:00:00Z", "price": 84, "purchaseAt": "1981-08-04T00:00:00Z", "trialPrice": 77}, {"currencyCode": "LzDNp1SZ58aDllwz", "currencyNamespace": "TRHak1MXxj7Esrg7", "currencyType": "REAL", "discountAmount": 98, "discountExpireAt": "1998-12-04T00:00:00Z", "discountPercentage": 28, "discountPurchaseAt": "1988-04-06T00:00:00Z", "expireAt": "1977-07-28T00:00:00Z", "price": 96, "purchaseAt": "1985-06-03T00:00:00Z", "trialPrice": 16}, {"currencyCode": "f3QaJPGrTNcXXTUI", "currencyNamespace": "ggoH89QNmI17UDb1", "currencyType": "REAL", "discountAmount": 89, "discountExpireAt": "1981-09-22T00:00:00Z", "discountPercentage": 69, "discountPurchaseAt": "1987-07-21T00:00:00Z", "expireAt": "1980-06-25T00:00:00Z", "price": 39, "purchaseAt": "1992-12-27T00:00:00Z", "trialPrice": 79}], "3m7jK5pxe82pgFiA": [{"currencyCode": "S6piIzmc8rKrKEPG", "currencyNamespace": "SAcong6eNERUf8kj", "currencyType": "REAL", "discountAmount": 39, "discountExpireAt": "1975-07-19T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1985-02-08T00:00:00Z", "expireAt": "1981-01-21T00:00:00Z", "price": 4, "purchaseAt": "1972-07-01T00:00:00Z", "trialPrice": 91}, {"currencyCode": "Gv4tOcbnuCqf0lm6", "currencyNamespace": "WBkIzjoSV31tvmMB", "currencyType": "REAL", "discountAmount": 23, "discountExpireAt": "1984-05-20T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1979-02-13T00:00:00Z", "expireAt": "1993-09-24T00:00:00Z", "price": 63, "purchaseAt": "1988-08-12T00:00:00Z", "trialPrice": 26}, {"currencyCode": "yGXPMqxj4hBgVY3Y", "currencyNamespace": "AxZLKbcOdyjqf6Q4", "currencyType": "REAL", "discountAmount": 95, "discountExpireAt": "1975-07-02T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1978-02-01T00:00:00Z", "expireAt": "1989-03-07T00:00:00Z", "price": 5, "purchaseAt": "1971-12-24T00:00:00Z", "trialPrice": 19}], "MEb15LBlTVufc5Zy": [{"currencyCode": "ODR2NVyn4PRqf3eR", "currencyNamespace": "bZqBAoKGcVCdMiSN", "currencyType": "REAL", "discountAmount": 34, "discountExpireAt": "1971-08-19T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1980-12-15T00:00:00Z", "expireAt": "1980-09-18T00:00:00Z", "price": 21, "purchaseAt": "1993-01-15T00:00:00Z", "trialPrice": 4}, {"currencyCode": "LmRv6EJtl5xWnsb8", "currencyNamespace": "oWq94RImNWVIJnhh", "currencyType": "VIRTUAL", "discountAmount": 74, "discountExpireAt": "1987-07-19T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1975-09-17T00:00:00Z", "expireAt": "1975-06-24T00:00:00Z", "price": 40, "purchaseAt": "1986-12-29T00:00:00Z", "trialPrice": 4}, {"currencyCode": "omvWTzdsW4N70wYS", "currencyNamespace": "4Kj7Yi2VvoQNW8Yc", "currencyType": "REAL", "discountAmount": 66, "discountExpireAt": "1998-08-04T00:00:00Z", "discountPercentage": 7, "discountPurchaseAt": "1989-01-24T00:00:00Z", "expireAt": "1974-06-26T00:00:00Z", "price": 66, "purchaseAt": "1998-07-04T00:00:00Z", "trialPrice": 78}]}, "saleConfig": {"currencyCode": "JAMDRA1LF7jdWlek", "price": 64}, "seasonType": "TIER", "sectionExclusive": true, "sellable": false, "sku": "94VBCV9qJhWva2FP", "stackable": true, "status": "ACTIVE", "tags": ["ujX0geYCpGJM4sqs", "NF0Z0GkwxUNYyNwG", "PNJMiZXXOFwmGWAv"], "targetCurrencyCode": "iKrknH0Y5mrQgLC6", "targetNamespace": "D2qsFiQHglUQMZi5", "thumbnailUrl": "WjMZfOadpgegCUjT", "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 136 'UpdateItem' test.out

#- 137 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'URrlm88QlKyuoya4' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'IAP,DLC,CAMPAIGN' \
    --force  \
    --storeId 'Ny4ejmVA3vMCsGyP' \
    > test.out 2>&1
eval_tap $? 137 'DeleteItem' test.out

#- 138 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'd12B8QNUz0hFFNbH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 76, "orderNo": "j2W4roZM2UKAXEEs"}' \
    > test.out 2>&1
eval_tap $? 138 'AcquireItem' test.out

#- 139 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'L5D0oiFchQnVeq3g' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '2AB2WIRUQmauIY5H' \
    > test.out 2>&1
eval_tap $? 139 'GetApp' test.out

#- 140 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'XCZ0W4XmWP0HzSdi' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ylLhVYszm8xY33OQ' \
    --body '{"carousel": [{"alt": "bumu2QHLyZNuysyM", "previewUrl": "4OfCzdQCXMAWnf87", "thumbnailUrl": "YPNOe9Eevf1fhMg1", "type": "video", "url": "7JjxvNZhM84DiZk6", "videoSource": "vimeo"}, {"alt": "OieDCow2zXyFFVpM", "previewUrl": "87yqEwEacQMTlqN4", "thumbnailUrl": "LKkxJ5v3SBafnKNi", "type": "image", "url": "b8RxvN2u5J7baOeL", "videoSource": "youtube"}, {"alt": "B37wwoPYOHiIsxms", "previewUrl": "LBPBJuNLnWRrtW87", "thumbnailUrl": "0qD88ZcduZSe7W20", "type": "image", "url": "cDaiq0nEZ7PyhqFJ", "videoSource": "generic"}], "developer": "0RNFwiz70tRVLMlH", "forumUrl": "i8i9gOVqajUWrgEs", "genres": ["Racing", "Indie", "Action"], "localizations": {"kil67kRngoUa83EC": {"announcement": "h1gqPeS193TNNzot", "slogan": "3sVli3GN2XTrFibR"}, "AhzzEWzWlTY70qdg": {"announcement": "JRvpZrSpWX3KEe2B", "slogan": "jV00ReCXFffjJJxl"}, "gjzIhpgOoIOD74V2": {"announcement": "1HWDAfvXwdxbyp4H", "slogan": "APbBbNPStVBUpKgO"}}, "platformRequirements": {"ssFkz0F36piDYXeH": [{"additionals": "Z7FHls3nyvconqbH", "directXVersion": "QqKLQKe3xmj6s0Gq", "diskSpace": "sWncp5LrqbiKudv9", "graphics": "z75SzoCV8ZMi2o1n", "label": "R482D6gNClk9c87h", "osVersion": "osaPFC5zBW3ZgVZC", "processor": "j9ObVGT0Scwl4kNm", "ram": "Ci15XTJTgCNNH7Rt", "soundCard": "G5Xmo9Q0Wb07N17f"}, {"additionals": "kxZSc6VbE0AGcekj", "directXVersion": "MNHuPXtz8tXxrmza", "diskSpace": "fMUguyDoN91uc28H", "graphics": "oSpGt1g0GGbT4Hf2", "label": "PPKOldkbgX9CWJKw", "osVersion": "XXSbv5eg9q86IaDF", "processor": "jjx6uZerWbtwTX9g", "ram": "NRByjbE8lOLAfTXK", "soundCard": "LzbrddqcKLa7Levx"}, {"additionals": "NHOSEhQRZIp693lR", "directXVersion": "wtc43atCuCFxbfbz", "diskSpace": "4aQERziPL4dHhOqG", "graphics": "5KDdUvk0LEi26Ls7", "label": "mjRxNmvvNtjJNQep", "osVersion": "UTGhwlY4lPzlsCR5", "processor": "rVsyfcH7WjP7HuGz", "ram": "3b5WAEvdRF9bqMj4", "soundCard": "ro5B19VE838c7Oyd"}], "Vw0zCqoMZvpIOO97": [{"additionals": "DmQ5ZOzx6iCJTu60", "directXVersion": "IifzMhkk5PxsjqbC", "diskSpace": "KpMv2Yky9DYkD2sI", "graphics": "llFtBtXJKG3rqBmI", "label": "LhtWm8RQvRUbUDSi", "osVersion": "efGEdLucrtO2gCQD", "processor": "057DrDlgC2nzS9Si", "ram": "GUjVAw4v3q6JRHcn", "soundCard": "7KaoCEkRdo6qHYIZ"}, {"additionals": "WnXqQ1oHFJ9Q0vqs", "directXVersion": "L9SomqWsGA76yxi0", "diskSpace": "QzZWfmP2sx0KO5bE", "graphics": "JaPnAFjsodyJQVVB", "label": "rShGbIIuqK8C403H", "osVersion": "goXCR6XOMXwKdfqk", "processor": "8T4QHK30EX0FclpD", "ram": "l5HsuracO5MnjnxD", "soundCard": "1OXkxShFVQTRekLf"}, {"additionals": "jmy8zosRCRgVwbrQ", "directXVersion": "Kmb01yA7U7dGMjup", "diskSpace": "ZkZQY8CNyT4k3DIb", "graphics": "fT22G5NpE130YWSg", "label": "xpKWtdtdtVW9anEN", "osVersion": "mxb9e7vXZV3ig8Jg", "processor": "5VByeI3ycMcYYBix", "ram": "KJXCISQdwec1m8Bu", "soundCard": "sV9tUh74KVo6Xqjz"}], "2xUKLNWSmYyVvyel": [{"additionals": "IJ8QgaLMqi836ULa", "directXVersion": "7cfZl4VuY6rsZyo6", "diskSpace": "CBRRnoOikIxXKKIR", "graphics": "6kPmswm5TCAU1cKA", "label": "pdJDnE73GLmSZns5", "osVersion": "owBhoUg4LsGP6KLP", "processor": "XkvUv2XiXaBzsmax", "ram": "jTZPlLitytGka7Kv", "soundCard": "5TacQKF4OlRGdmXx"}, {"additionals": "ETLEQrr3KCAV9alq", "directXVersion": "3hK1G4kKooSNNUZu", "diskSpace": "iynZ64IwncZPk82G", "graphics": "F3eTC0vzZUDj9dzG", "label": "gGVxo9OHgfHumyfu", "osVersion": "BNisecYbcOpR45VD", "processor": "lvSc0Mr7ImwCwGqO", "ram": "f0bNs97KvKyj3MqS", "soundCard": "7Dcmtfh50eObbrmg"}, {"additionals": "jhWK0x0ZidAJ1CU1", "directXVersion": "eD1La16Bw3JbUnUD", "diskSpace": "h5yGjjv4Mwrv2van", "graphics": "cmR6Z7rb21A2E9pX", "label": "0BWCMqPsRk5htdM5", "osVersion": "T3fDSrSHrkoqv2mM", "processor": "6soMaTvQq2a9YdFN", "ram": "tRVSO0js0hG9xmSn", "soundCard": "zd7zgUxAogcnGkXk"}]}, "platforms": ["IOS", "Linux", "Windows"], "players": ["Single", "MMO", "CrossPlatformMulti"], "primaryGenre": "FreeToPlay", "publisher": "JHRhmLKQuQVFSKiX", "releaseDate": "1977-12-09T00:00:00Z", "websiteUrl": "8G2uf6E8EajXLSAS"}' \
    > test.out 2>&1
eval_tap $? 140 'UpdateApp' test.out

#- 141 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId '8MKMaxQ1QyJCpKed' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'huzI7G9NCKKXu1bq' \
    --body '{"featuresToCheck": ["ENTITLEMENT", "REWARD", "IAP"]}' \
    > test.out 2>&1
eval_tap $? 141 'DisableItem' test.out

#- 142 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId 'M5PmXfKnQ7BYGjCU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 142 'GetItemDynamicData' test.out

#- 143 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'DMOrbmoRvWnfmGFy' \
    --namespace "$AB_NAMESPACE" \
    --storeId '0eUoOBd90h9EDqST' \
    > test.out 2>&1
eval_tap $? 143 'EnableItem' test.out

#- 144 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'OfoNewWjwMWDKEt6' \
    --itemId 'JhbJ0fwTDaq6b5Rp' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'MwhWPtndriXU9loO' \
    > test.out 2>&1
eval_tap $? 144 'FeatureItem' test.out

#- 145 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature 'xpmEuwDVc12r0DVU' \
    --itemId 'GgGHkapTCafFMdvY' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iCBuzUUwyI6Vtd4v' \
    > test.out 2>&1
eval_tap $? 145 'DefeatureItem' test.out

#- 146 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId '9k4fv3kMiuQ3DhsK' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'Lxjt5srPFxBgpFtD' \
    --populateBundle  \
    --region 'BmTLH9kP9U53z6jo' \
    --storeId 'BAhAlJGI2YYb6ajB' \
    > test.out 2>&1
eval_tap $? 146 'GetLocaleItem' test.out

#- 147 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'jgq6eY4PBNHKPx62' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tHxDb06ZFy3uglSp' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "or", "predicates": [{"anyOf": 49, "code": "b21jxeWXk80y9uxg", "comparison": "isNot", "name": "LGgK8aVSCN6oCETQ", "predicateType": "EntitlementPredicate", "value": "MJbJIYLssMvy9gkf", "values": ["TMRrXVRcAVRDX6gm", "C8hEguCqlMHiQN3H", "DfNfPGYYSTunMgt3"]}, {"anyOf": 99, "code": "GRufOUGfMjTU226l", "comparison": "isNot", "name": "7jPlcYaqYM7YfBmh", "predicateType": "SeasonPassPredicate", "value": "AEl6A9sh2x2ur2cc", "values": ["ytb3c8pVZ8GlU896", "p7R7OqPqIjS4i0N9", "2e6gtn5pUARJM1T8"]}, {"anyOf": 87, "code": "aixUUvmzbajE2gjo", "comparison": "isGreaterThan", "name": "6a280S5RNB5dVCsB", "predicateType": "StatisticCodePredicate", "value": "tkWaMOH47CAT7cBP", "values": ["0918JaEBQBP766LU", "nBBR84iAO7sBQt6Y", "J2tWwF7RnP1oK3c4"]}]}, {"operator": "and", "predicates": [{"anyOf": 98, "code": "0sMY8es36r1FgR70", "comparison": "includes", "name": "ol1qqbalgizL97yc", "predicateType": "StatisticCodePredicate", "value": "V5YqE2myQzl7X9fH", "values": ["zaZUTmvsEzLPnnGs", "f9B22HGgxakPt7IY", "r6WvBxmBvNj3ktaD"]}, {"anyOf": 27, "code": "7H7yIS7b5TSDRIoM", "comparison": "includes", "name": "1vyamjsEzwtLPxK1", "predicateType": "SeasonPassPredicate", "value": "IaEMW5bhJyL72WDy", "values": ["hBsCCbnfihnXKxGx", "aupnTTq9ihZkvFKf", "SHQh8I9xk3sFl0cb"]}, {"anyOf": 41, "code": "hniEHLbEQKc0aUvr", "comparison": "is", "name": "DIjYC4df9qswSlpC", "predicateType": "StatisticCodePredicate", "value": "4ulonMFjmYqE1wJh", "values": ["fogWg2Apm0sUy18a", "SaZAIadKDEZywonA", "Wn65Co0vdCk8so6J"]}]}, {"operator": "or", "predicates": [{"anyOf": 62, "code": "aulsL6NOV5agpS6A", "comparison": "includes", "name": "mkufBpWVxIK9D2bT", "predicateType": "EntitlementPredicate", "value": "Wbs5qugklBUS6uwW", "values": ["KJ05Orya6LSSUlug", "rCQt86Jrg8tLAJWp", "cyNkUvqn6eXr6FNb"]}, {"anyOf": 70, "code": "uQNGIDeHlf6IcX1K", "comparison": "is", "name": "JrK6Or2xx7rLwrPo", "predicateType": "SeasonPassPredicate", "value": "jrpRo4mYrCeQUnYo", "values": ["j3dbRTI0i6dO3zkb", "b8HDOJ8TNiP8KgEA", "ID2UqO0iAXA9dB4i"]}, {"anyOf": 60, "code": "B0sL2xt6fX9j7rhZ", "comparison": "isNot", "name": "qVUaWMJBjrV0p9A7", "predicateType": "SeasonTierPredicate", "value": "E7CL1cQCSoqHvH7g", "values": ["rF5i3gr3Cc4M2O7N", "63cOx6yrIw37pKOL", "rTQO7KLdZDGwqx7T"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 147 'UpdateItemPurchaseCondition' test.out

#- 148 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId '3l1ut2oyolliYsTJ' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'REWARD,CATALOG,IAP' \
    --storeId 'pscwLcUml3KuoMKh' \
    > test.out 2>&1
eval_tap $? 148 'QueryItemReferences' test.out

#- 149 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '7tprnacA34xmIOjF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "LgKR4LjEWhOScvtQ"}' \
    > test.out 2>&1
eval_tap $? 149 'ReturnItem' test.out

#- 150 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --name '2iD02YMvEUNfoL7J' \
    --offset '59' \
    --tag 'wFGpea5ObBB49Km4' \
    > test.out 2>&1
eval_tap $? 150 'QueryKeyGroups' test.out

#- 151 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "ClIQmkIdLCvNhZ6P", "name": "8aqZ2yfrC1V7ZpJZ", "status": "INACTIVE", "tags": ["HCMqvcYmeDLYEzs2", "SQUdKr6vgqkjycqc", "lNlBORlC8ZkjsxYt"]}' \
    > test.out 2>&1
eval_tap $? 151 'CreateKeyGroup' test.out

#- 152 GetKeyGroupByBoothName
eval_tap 0 152 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 153 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 'gxplHTPLzynjFZgF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroup' test.out

#- 154 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId '3erw7UsyHq4bBb0n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "1JhPUS8BRPGV9n76", "name": "9zLJdKMexeJc7Nvg", "status": "ACTIVE", "tags": ["SgKjCxZjKf8NA4cG", "UaDfy9XnH2r0EKrk", "5VlnKsWCPccAFn5C"]}' \
    > test.out 2>&1
eval_tap $? 154 'UpdateKeyGroup' test.out

#- 155 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId 'EPoH6opK5DSO8JyX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 155 'GetKeyGroupDynamic' test.out

#- 156 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '4IE1z3rDwZ1HKsOp' \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '73' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 156 'ListKeys' test.out

#- 157 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId '4QHbfnAdtkujxHff' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 157 'UploadKeys' test.out

#- 158 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '7n1yaNCcjgFhS0UR' \
    --limit '56' \
    --offset '15' \
    --orderNos 'XAtpOqUQxzqJZiWi,3KQffT5Tn61A1xW6,okIqmd87ir9op4Yf' \
    --sortBy 'GTno5oHzqY3DgykA' \
    --startTime '8zBJX0rkOHUkY5aS' \
    --status 'CHARGED' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 158 'QueryOrders' test.out

#- 159 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 159 'GetOrderStatistics' test.out

#- 160 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo '5ZM8btmGsgXNXbpq' \
    > test.out 2>&1
eval_tap $? 160 'GetOrder' test.out

#- 161 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'xh76Af5JSwjw2fE2' \
    --body '{"description": "g6jXV7oai2oDm9Fa"}' \
    > test.out 2>&1
eval_tap $? 161 'RefundOrder' test.out

#- 162 GetPaymentCallbackConfig
eval_tap 0 162 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 163 UpdatePaymentCallbackConfig
eval_tap 0 163 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 164 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 164 'GetPaymentMerchantConfig' test.out

#- 165 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["P0HJ98tE4UyoQg0b", "0sGOkzxVt15LKmkQ", "7YBhsOuJ0ypkkt2G"]}' \
    > test.out 2>&1
eval_tap $? 165 'UpdatePaymentDomainWhitelistConfig' test.out

#- 166 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate '4eFh2YNsdoxpLTBM' \
    --externalId '9Q8t829Ido1JyveS' \
    --limit '90' \
    --notificationSource 'CHECKOUT' \
    --notificationType 'n9eIdhIBvTTupABJ' \
    --offset '21' \
    --paymentOrderNo 'RwH3EdKmYtbqQHNf' \
    --startDate 'IZwrMxf3EnzZVnkL' \
    --status 'ERROR' \
    > test.out 2>&1
eval_tap $? 166 'QueryPaymentNotifications' test.out

#- 167 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'EXTERNAL' \
    --extTxId 'Lb85nmpdN26BY5YI' \
    --limit '42' \
    --offset '19' \
    --status 'AUTHORISE_FAILED' \
    > test.out 2>&1
eval_tap $? 167 'QueryPaymentOrders' test.out

#- 168 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "AxE2IQeoxYV4UcYz", "currencyNamespace": "swAGpXqQxctuVaqP", "customParameters": {"JGAHEZmuQrZ8GaQ4": {}, "OZ2nDodm4TNs8mAj": {}, "6IKSYFdJwgZsRPOz": {}}, "description": "wuDSdGl1A2vaNeDi", "extOrderNo": "SqTfmAVg50kOdJag", "extUserId": "EmTuaxlxgywkbdOs", "itemType": "LOOTBOX", "language": "Ycz", "metadata": {"tfW488oYUT4jyCVJ": "0V8obTlGVThz4bm4", "1oIcV33yjPxibDjf": "F7JkjCVpZKMxkFkB", "tXMU6KRIm5xBoIi9": "9ctgFXasxp5h780k"}, "notifyUrl": "tjQw2yXzaQWaF2Pq", "omitNotification": true, "platform": "fbpMpRl6xRyV19cb", "price": 30, "recurringPaymentOrderNo": "5VIuCOCkt2W1DfI8", "region": "QtgODk9K6DcMnyCP", "returnUrl": "n1FylWdaNV1VaZTk", "sandbox": false, "sku": "bcv3IwmL7a1K3zIU", "subscriptionId": "YJmdF1YtWNSQlcMz", "targetNamespace": "xfppNCrscDPbklTH", "targetUserId": "cmgXsrVj3Mjml6Bp", "title": "CODWGOLMmCZUeelX"}' \
    > test.out 2>&1
eval_tap $? 168 'CreatePaymentOrderByDedicated' test.out

#- 169 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'YyNrXweiCnDldRPR' \
    > test.out 2>&1
eval_tap $? 169 'ListExtOrderNoByExtTxId' test.out

#- 170 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fd6mLZ0GTJwEjoZr' \
    > test.out 2>&1
eval_tap $? 170 'GetPaymentOrder' test.out

#- 171 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'RtaeWKMC8wsOByQA' \
    --body '{"extTxId": "MAgqFEzEt8umj5Xh", "paymentMethod": "Knw7MHDwFVKUC2ec", "paymentProvider": "NEONPAY"}' \
    > test.out 2>&1
eval_tap $? 171 'ChargePaymentOrder' test.out

#- 172 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'PwVHUGcs1ACMvoY4' \
    --body '{"description": "jWH9dFmOHW0j9suu"}' \
    > test.out 2>&1
eval_tap $? 172 'RefundPaymentOrderByDedicated' test.out

#- 173 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'kPE4JwQONQ2vCbMn' \
    --body '{"amount": 63, "currencyCode": "Oia336uiiMTAduct", "notifyType": "REFUND", "paymentProvider": "PAYPAL", "salesTax": 95, "vat": 84}' \
    > test.out 2>&1
eval_tap $? 173 'SimulatePaymentOrderNotification' test.out

#- 174 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'fVwLahtRedh1SiZl' \
    > test.out 2>&1
eval_tap $? 174 'GetPaymentOrderChargeStatus' test.out

#- 175 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'OpIQ8GL7jBF1R5Oe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "xAPzCG6ZKQClGc16", "serviceLabel": 69}' \
    > test.out 2>&1
eval_tap $? 175 'GetPsnEntitlementOwnership' test.out

#- 176 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku '6nbfM3J9G40Y62bC' \
    --body '{"delegationToken": "o941ALznQuHVskfC", "sandboxId": "jUK8GeX4Q0B2Cj0o"}' \
    > test.out 2>&1
eval_tap $? 176 'GetXboxEntitlementOwnership' test.out

#- 177 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Nintendo' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformEntitlementConfig' test.out

#- 178 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    --body '{"allowedPlatformOrigins": ["Nintendo", "IOS", "Other"]}' \
    > test.out 2>&1
eval_tap $? 178 'UpdatePlatformEntitlementConfig' test.out

#- 179 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 179 'GetPlatformWalletConfig' test.out

#- 180 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    --body '{"allowedBalanceOrigins": ["IOS", "Oculus", "Playstation"]}' \
    > test.out 2>&1
eval_tap $? 180 'UpdatePlatformWalletConfig' test.out

#- 181 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Epic' \
    > test.out 2>&1
eval_tap $? 181 'ResetPlatformWalletConfig' test.out

#- 182 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'GetRevocationConfig' test.out

#- 183 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "CUSTOM"}, "durable": {"enabled": true, "strategy": "REVOKE_OR_REPORT"}}, "wallet": {"enabled": true, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 183 'UpdateRevocationConfig' test.out

#- 184 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'DeleteRevocationConfig' test.out

#- 185 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'IvQj2isN7bRwcr16' \
    --limit '24' \
    --offset '99' \
    --source 'DLC' \
    --startTime '5YwgZpjlMMtPWg82' \
    --status 'FAIL' \
    --transactionId '7m7qNkQiKp2oac8Q' \
    --userId 'TNEuBbeuQqm9wM7m' \
    > test.out 2>&1
eval_tap $? 185 'QueryRevocationHistories' test.out

#- 186 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'GetRevocationPluginConfig' test.out

#- 187 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "gTtUdPVcQijMBhs0"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "6AmnQTNFidImWONT"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 187 'UpdateRevocationPluginConfig' test.out

#- 188 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 188 'DeleteRevocationPluginConfig' test.out

#- 189 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 189 'UploadRevocationPluginConfigCert' test.out

#- 190 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "SnGqhJOvykBcDpzD", "eventTopic": "9zh6dtPK4fVHLMvr", "maxAwarded": 58, "maxAwardedPerUser": 65, "namespaceExpression": "sH3RYxH2Up9VthPj", "rewardCode": "FrK7Hip0eONFDgUP", "rewardConditions": [{"condition": "ShG8wwFKY9AMpcwJ", "conditionName": "d4SrigIxAhbFMZfx", "eventName": "aznlDQbzTiFrQB1y", "rewardItems": [{"duration": 95, "endDate": "1978-05-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "nirH4URx3NkKQBYr", "quantity": 22, "sku": "Bedcr6PM51z7i0wQ"}, {"duration": 62, "endDate": "1973-07-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "8GENEJYPKxxOw7xN", "quantity": 86, "sku": "OgVuN3nhkn6QIesN"}, {"duration": 30, "endDate": "1999-07-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "GeidXRRnIAJfKVjO", "quantity": 27, "sku": "wgKvfXXs8pDqm31A"}]}, {"condition": "ZSRkuw6q8FgqG46R", "conditionName": "sFK7eYlSU3vYcHZZ", "eventName": "jFegVnZOn0tk4IAT", "rewardItems": [{"duration": 92, "endDate": "1981-10-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "MVUii4KpYcb1AUsE", "quantity": 90, "sku": "taMVvLbG04KKnh3j"}, {"duration": 45, "endDate": "1984-09-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Qp3kTyL4CsLwiWUM", "quantity": 5, "sku": "T2k0AzdgIunRkTxs"}, {"duration": 66, "endDate": "1982-01-25T00:00:00Z", "identityType": "ITEM_ID", "itemId": "rpNELM8Lfkut0wnT", "quantity": 88, "sku": "4wh59RGSbBMh7jps"}]}, {"condition": "zuVk6iPdJ2boQqCC", "conditionName": "yJfThvCJieqRSGN8", "eventName": "Mm74HlSZzp4aEW4G", "rewardItems": [{"duration": 21, "endDate": "1992-09-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "G5OIVuGv47XJpkMi", "quantity": 30, "sku": "sDZNYUV48Oh6I45X"}, {"duration": 68, "endDate": "1974-06-26T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "4iWk12Jffk8dwKNP", "quantity": 96, "sku": "rjaboGomguUqeuZh"}, {"duration": 33, "endDate": "1992-06-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "z7sVnMxge2inL8fB", "quantity": 64, "sku": "shSe5YmZXKEQLkM6"}]}], "userIdExpression": "o3eGSP4Htmr90TqG"}' \
    > test.out 2>&1
eval_tap $? 190 'CreateReward' test.out

#- 191 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'f0OyqJ9ibJMmRgox' \
    --limit '80' \
    --offset '70' \
    --sortBy 'namespace:asc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 191 'QueryRewards' test.out

#- 192 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 192 'ExportRewards' test.out

#- 193 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 193 'ImportRewards' test.out

#- 194 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'sDgbJ37DN2lDvdh7' \
    > test.out 2>&1
eval_tap $? 194 'GetReward' test.out

#- 195 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'okHl1wMht2Izq7TC' \
    --body '{"description": "UJhDsDefAS09VyQB", "eventTopic": "1vR1mx6K17GL1CrO", "maxAwarded": 42, "maxAwardedPerUser": 55, "namespaceExpression": "oGZSxTzm8oMSPIHP", "rewardCode": "tqzIWIzg8pbjnt1i", "rewardConditions": [{"condition": "BV8DpbjGts4UZDTf", "conditionName": "hAyZKhqilty9NVlg", "eventName": "xUmnfdOAmu1dX1Nq", "rewardItems": [{"duration": 60, "endDate": "1979-12-12T00:00:00Z", "identityType": "ITEM_ID", "itemId": "RUvvYeJZw6QZFN7w", "quantity": 64, "sku": "INusOsa92F6iwkJI"}, {"duration": 39, "endDate": "1992-04-28T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Yja1soDE1K0SvGrM", "quantity": 35, "sku": "wPmPXC2LfL2m5rP2"}, {"duration": 54, "endDate": "1997-06-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "t6foPPH94SUinY5d", "quantity": 17, "sku": "8LHYivmD0ekycMKl"}]}, {"condition": "wJTNL2UCWUtaAD7Z", "conditionName": "Zx1iefATWcDSqGYR", "eventName": "Mdz07xEJ40epssgJ", "rewardItems": [{"duration": 72, "endDate": "1985-08-21T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "CX0hpB1ZGMMo5DSo", "quantity": 51, "sku": "6HjCnFRdSihcvszz"}, {"duration": 87, "endDate": "1982-11-03T00:00:00Z", "identityType": "ITEM_ID", "itemId": "Bktk0siMup01kyaF", "quantity": 45, "sku": "dZJkkGhYvXYMIyaE"}, {"duration": 80, "endDate": "1990-09-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "GBnzh4suaGIzttTn", "quantity": 6, "sku": "hRfDgl29GWKpItMt"}]}, {"condition": "4GszRufkDFLYyNBP", "conditionName": "lMrkse9SGcMuV5ph", "eventName": "hU315LUC6HSMQ32U", "rewardItems": [{"duration": 51, "endDate": "1985-04-19T00:00:00Z", "identityType": "ITEM_ID", "itemId": "XNd6ve29lqqtcLJW", "quantity": 77, "sku": "eTJvKNDFrx6LabyD"}, {"duration": 28, "endDate": "1990-05-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "jXKPIcxh0x7T6RQG", "quantity": 28, "sku": "tovSMFw8X4zxbdfX"}, {"duration": 12, "endDate": "1983-06-17T00:00:00Z", "identityType": "ITEM_ID", "itemId": "07ZzzIs3Jke34ZAU", "quantity": 43, "sku": "V3URIRVDYBd6hMB0"}]}], "userIdExpression": "l7sg7IfMH5Tu1ky1"}' \
    > test.out 2>&1
eval_tap $? 195 'UpdateReward' test.out

#- 196 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'ZYvyeHmfoFkUDP86' \
    > test.out 2>&1
eval_tap $? 196 'DeleteReward' test.out

#- 197 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId '4shbnQ3bVvuvpsDJ' \
    --body '{"payload": {"XPCWkX4Kpi8CJ88a": {}, "MPGFFAQZbfbmVTEb": {}, "iRq5Juikmpat75rV": {}}}' \
    > test.out 2>&1
eval_tap $? 197 'CheckEventCondition' test.out

#- 198 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'bN9ZBtzJ33tCwv8H' \
    --body '{"conditionName": "1f451FVZ630HNBYZ", "userId": "Srz7pMjESLLMPKDX"}' \
    > test.out 2>&1
eval_tap $? 198 'DeleteRewardConditionRecord' test.out

#- 199 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'Lki6Oz5Bygt8Q0Rj' \
    --limit '92' \
    --offset '7' \
    --start 'f1srB7hGwGbUmQmJ' \
    --storeId 'HNffZENs9X0hFMdz' \
    --viewId 'ryvhc1YjHmmulSBI' \
    > test.out 2>&1
eval_tap $? 199 'QuerySections' test.out

#- 200 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Elc2CdRvBb0aGnMt' \
    --body '{"active": false, "displayOrder": 95, "endDate": "1971-10-11T00:00:00Z", "ext": {"WHb5sbX6asrjV7XJ": {}, "UOtHlzXNHEPpzlMl": {}, "x7b2H2THLwZGikW7": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 55, "itemCount": 0, "rule": "SEQUENCE"}, "items": [{"id": "gE6SrYKq6lcVOhPJ", "sku": "IcEHbiKHW7flVolA"}, {"id": "WEMmQSPDTRqjlvwn", "sku": "nCA5tfK5ushaKTPV"}, {"id": "jyOUpR3uUdgNlyU4", "sku": "IJnqtrjCOsE8Vjvz"}], "localizations": {"hJwNX4bhqCjlwrms": {"description": "SRV86iic1FIMyF7C", "localExt": {"cNu2DYn6E9Gk51kO": {}, "TJZluTekDMCGUJvE": {}, "RxNg8djSb4Vt2vKQ": {}}, "longDescription": "5vlCdI519Pf2iogw", "title": "xM5DZM0dgozmco41"}, "750xdYQg34WUV0Wp": {"description": "msQnp1n4YGumTKOl", "localExt": {"DOy5vhSkxERZ2AQ1": {}, "jvXYBar5RMmmGdWl": {}, "0wpj5tVfKU3D8WVP": {}}, "longDescription": "h0Z7YiGE2cyzTMBY", "title": "7Xd0OoENg2Lw7uep"}, "mahXojVZYz2zMU9j": {"description": "LzNV3GaG43R6nlRP", "localExt": {"rEAYqRBeSc5uShoj": {}, "3dGHMeoi5DBOsQ0G": {}, "ax0iX05IT9Agsjl5": {}}, "longDescription": "NmnSHhxNmCe4txY0", "title": "MsPc9EMgf9JCJiEv"}}, "name": "hL8ZfwCVJW9yspUO", "rotationType": "FIXED_PERIOD", "startDate": "1978-09-30T00:00:00Z", "viewId": "cp400RZe8Bzx9aGE"}' \
    > test.out 2>&1
eval_tap $? 200 'CreateSection' test.out

#- 201 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'I22BTCZs97TJI8GP' \
    > test.out 2>&1
eval_tap $? 201 'PurgeExpiredSection' test.out

#- 202 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'rM24F3celFgM62HQ' \
    --storeId 'tgzQhO3nR8j8DlP6' \
    > test.out 2>&1
eval_tap $? 202 'GetSection' test.out

#- 203 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'OGbn8vmfMYGLt1Aj' \
    --storeId 'Khh3JMX7xSrz1EH6' \
    --body '{"active": true, "displayOrder": 79, "endDate": "1997-10-24T00:00:00Z", "ext": {"xzsNrJzWBcdFlo7o": {}, "AsOlfLB1J19b5rTf": {}, "iL2P3r1a8KIJH33a": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 85, "itemCount": 42, "rule": "SEQUENCE"}, "items": [{"id": "WD59MgTy1HA58Jt5", "sku": "NaROjSKFEuZo2ElX"}, {"id": "YSS4ezBRSiOyRevi", "sku": "DaxlPdhwmcH03yoM"}, {"id": "xzRR6xd9rTh3urea", "sku": "IbxM3Wev9pZQjWAN"}], "localizations": {"0tny16ZHZtuSJGQC": {"description": "rM7JEMRPkdTcAzkI", "localExt": {"lndN5xeayr3vUKMu": {}, "Iiz2MiAAKcvAXnxn": {}, "H0QIhoJRY807VmBT": {}}, "longDescription": "4wZXQZZrSsuYiIPe", "title": "i0pXglJYnKkoCAZu"}, "olAWnxkImVbDP0QX": {"description": "31gI7VmnGIRMvXe6", "localExt": {"BiphIFe2bzr6qQw6": {}, "fSESkM19OPMBb12g": {}, "pmShlmIt2nfhUaZG": {}}, "longDescription": "qjslu59GT2E6Aacm", "title": "ZRXZm626POXWVj3K"}, "P1mX0iYHXBU3Uk2t": {"description": "Qm307IORTyHnLYDA", "localExt": {"Ag1YA4kZURmoGgxV": {}, "RMPf8g1rbhfIMStM": {}, "nSqrKWYOuITlYS2R": {}}, "longDescription": "YaD9WNKGhbLhjz1v", "title": "0RBIO2rkJGmPaK6H"}}, "name": "EVIQJd3930TGewjR", "rotationType": "FIXED_PERIOD", "startDate": "1991-02-15T00:00:00Z", "viewId": "9XSjap24esyjh6Wc"}' \
    > test.out 2>&1
eval_tap $? 203 'UpdateSection' test.out

#- 204 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '3migf2n6iQyr5cb5' \
    --storeId 'YL6fwBiaVPmmn0T5' \
    > test.out 2>&1
eval_tap $? 204 'DeleteSection' test.out

#- 205 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 205 'ListStores' test.out

#- 206 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "uzlmi2NY26xrkPPd", "defaultRegion": "g3pXjmtpNfCrIj9n", "description": "tYo3dupUHNu8abrV", "supportedLanguages": ["VOKxr9Pa315FKDjG", "2ApSV94Jy6yCSXBq", "JqjAbVwSaoj1ugjr"], "supportedRegions": ["8mPkr3tZ506ERSVy", "5M3rrkxu0U9h9gCN", "VZxHGxhZqNXJ6JXS"], "title": "h0Z3SWISs1dYrJKm"}' \
    > test.out 2>&1
eval_tap $? 206 'CreateStore' test.out

#- 207 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 207 'GetCatalogDefinition' test.out

#- 208 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 208 'DownloadCSVTemplates' test.out

#- 209 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["1BT6iLFQejNZJNF2", "hm0TqBQprHn3whPK", "U5abnqw8fFa30pVb"], "idsToBeExported": ["hr1BHh1arZAyuLcZ", "oEkPpqKhP2jWnRTg", "lw0gdWoE4esuiDrq"], "storeId": "uccz4J6fFQezJ5E3"}' \
    > test.out 2>&1
eval_tap $? 209 'ExportStoreByCSV' test.out

#- 210 ImportStore
eval_tap 0 210 'ImportStore # SKIP deprecated' test.out

#- 211 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'GetPublishedStore' test.out

#- 212 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'DeletePublishedStore' test.out

#- 213 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 213 'GetPublishedStoreBackup' test.out

#- 214 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 214 'RollbackPublishedStore' test.out

#- 215 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'iYHIknvPcJkjRevV' \
    > test.out 2>&1
eval_tap $? 215 'GetStore' test.out

#- 216 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YfiExpAgoK9YDq1x' \
    --body '{"defaultLanguage": "3dkbJFDEBEOOvJ5B", "defaultRegion": "KeipIldsgB4hOxb8", "description": "8WgKSLIpneDQCfwu", "supportedLanguages": ["cHRL3o2NstrL6TsJ", "eRcE7GuwKn63KIDT", "kUCqbbHGJGOTvKKR"], "supportedRegions": ["THDntaFiufH2YR6Q", "U7fj6w17arNs12hO", "oLVM7UFnuJDzeEkD"], "title": "xaVogxHrOon2OW4Z"}' \
    > test.out 2>&1
eval_tap $? 216 'UpdateStore' test.out

#- 217 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'w5QwVKWNy2tnF2Mi' \
    > test.out 2>&1
eval_tap $? 217 'DeleteStore' test.out

#- 218 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'fJR4hr4gdJDujYnV' \
    --action 'CREATE' \
    --itemSku 'nGlYZ2tod2BGBXjN' \
    --itemType 'LOOTBOX' \
    --limit '88' \
    --offset '27' \
    --selected  \
    --sortBy 'updatedAt:desc,updatedAt,createdAt:desc' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'GmROIqxqQ0gcNeTf' \
    --updatedAtStart 'lyvUh3w5ZtfwmOCK' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 218 'QueryChanges' test.out

#- 219 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'pFSMF0tfGIZCTNiI' \
    > test.out 2>&1
eval_tap $? 219 'PublishAll' test.out

#- 220 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Rc9fEjkZhEpAJMCx' \
    > test.out 2>&1
eval_tap $? 220 'PublishSelected' test.out

#- 221 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Mp2J0hDg2kMgkvho' \
    > test.out 2>&1
eval_tap $? 221 'SelectAllRecords' test.out

#- 222 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Qe9gD9tGN0nE7M36' \
    --action 'CREATE' \
    --itemSku 'FHxTHa2k60SzCqUg' \
    --itemType 'EXTENSION' \
    --selected  \
    --type 'SECTION' \
    --updatedAtEnd '1gLbcIMevTmC631p' \
    --updatedAtStart '7q794bu49lINFTtE' \
    > test.out 2>&1
eval_tap $? 222 'SelectAllRecordsByCriteria' test.out

#- 223 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RAXT2h3hcQ2wV3Zb' \
    --action 'DELETE' \
    --itemSku 'ur0B9jKaunAcylsa' \
    --itemType 'INGAMEITEM' \
    --type 'ITEM' \
    --updatedAtEnd '7wRQmL4i3eRyIECE' \
    --updatedAtStart 'Da1I4lwXqwPfq3Vz' \
    > test.out 2>&1
eval_tap $? 223 'GetStatistic' test.out

#- 224 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'HQjtolx64w1gyvja' \
    > test.out 2>&1
eval_tap $? 224 'UnselectAllRecords' test.out

#- 225 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'cKtGqxMnoAXRlcq0' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'mYWKQYlqMmu2pvF6' \
    > test.out 2>&1
eval_tap $? 225 'SelectRecord' test.out

#- 226 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'rP03bQaq1cT88H6R' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'CW8gJmGzDlqxtLsR' \
    > test.out 2>&1
eval_tap $? 226 'UnselectRecord' test.out

#- 227 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '2AGOiPhNt2IdH8aY' \
    --targetStoreId 'YUT6mma833TDzk66' \
    > test.out 2>&1
eval_tap $? 227 'CloneStore' test.out

#- 228 ExportStore
eval_tap 0 228 'ExportStore # SKIP deprecated' test.out

#- 229 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ix88sAUrXr7MXxCv' \
    --end 'yy7caxz4MQrODLNl' \
    --limit '47' \
    --offset '18' \
    --sortBy 'X5KjdNrEwfWo2Mwu' \
    --start 'lLg4bsO4YHEYLjTS' \
    --success  \
    > test.out 2>&1
eval_tap $? 229 'QueryImportHistory' test.out

#- 230 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'NDf3zazm6p5Y1tkG' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes '9WwU4Ty6Ch5QYyFj' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 230 'ImportStoreByCSV' test.out

#- 231 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'NEVER' \
    --itemId 'LiMvcu39YZJypWzp' \
    --limit '82' \
    --offset '3' \
    --sku 'XgnoKIz8O8NglJtZ' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    --userId 'l1g5ZmTTGYRbP4QV' \
    > test.out 2>&1
eval_tap $? 231 'QuerySubscriptions' test.out

#- 232 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'ey9pEz1TV5cUtPBs' \
    > test.out 2>&1
eval_tap $? 232 'RecurringChargeSubscription' test.out

#- 233 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'w01i5Mf7WvbNSeeD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketDynamic' test.out

#- 234 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'NfUESLlwHv3JgteO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "LyKp8a1VqxXnRhDd"}' \
    > test.out 2>&1
eval_tap $? 234 'DecreaseTicketSale' test.out

#- 235 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName '9TGkO6aIYqftw1Sr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 235 'GetTicketBoothID' test.out

#- 236 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'M2nhSEanfUYrMU6A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 36, "orderNo": "3UKGpvC1cr5T1PSX"}' \
    > test.out 2>&1
eval_tap $? 236 'IncreaseTicketSale' test.out

#- 237 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "IOS", "count": 9, "currencyCode": "duTWchzXDv3TAtBj", "expireAt": "1992-07-02T00:00:00Z"}, "debitPayload": {"count": 44, "currencyCode": "HSuiYCbG0UyYUJmN", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 40, "entitlementCollectionId": "p6AbdtU0CDrlQpKB", "entitlementOrigin": "Epic", "itemIdentity": "qoel2QK3aSOYdmMD", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "kc3Fjm9HoQDemtiQ"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 95, "currencyCode": "wDlYSli3p8YaAdel", "expireAt": "1999-04-21T00:00:00Z"}, "debitPayload": {"count": 15, "currencyCode": "7lxXq7TkdM7FVDCB", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 45, "entitlementCollectionId": "KuPxjDUGRGcCEPjb", "entitlementOrigin": "IOS", "itemIdentity": "y7F82Adu9BYRHrVT", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 54, "entitlementId": "hrqgvEtEs2LpE0qf"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 44, "currencyCode": "3LrR1x6U1v6zSLjm", "expireAt": "1985-07-27T00:00:00Z"}, "debitPayload": {"count": 26, "currencyCode": "J7X6uVy7FWTSfMi2", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 87, "entitlementCollectionId": "PVGxjcdpdCqVeePM", "entitlementOrigin": "Oculus", "itemIdentity": "q306Pysv4VPaZWol", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 43, "entitlementId": "pwucUqqqff2iWi4y"}, "type": "CREDIT_WALLET"}], "userId": "3uqNcig6YcDA8Z3g"}, {"operations": [{"creditPayload": {"balanceOrigin": "Nintendo", "count": 41, "currencyCode": "GYwkrjLI4EHJEEWg", "expireAt": "1976-03-07T00:00:00Z"}, "debitPayload": {"count": 58, "currencyCode": "9fbdvUMDZeO4U55w", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 95, "entitlementCollectionId": "CpVpnENiTc9NESV2", "entitlementOrigin": "GooglePlay", "itemIdentity": "lmV3kES0Hi88UYgS", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 21, "entitlementId": "0OvY7apPCrN5bEhm"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Epic", "count": 69, "currencyCode": "xuXXpt0YSPX04uEI", "expireAt": "1972-02-27T00:00:00Z"}, "debitPayload": {"count": 54, "currencyCode": "GhHMz9dddLWJWDuS", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 44, "entitlementCollectionId": "CaIv4Lp91wYUJPbv", "entitlementOrigin": "Playstation", "itemIdentity": "28Le5neohqhCzroA", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 43, "entitlementId": "WQDve0Z2G2N09VIb"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 38, "currencyCode": "ZYofPGUbSaA00nKx", "expireAt": "1992-09-21T00:00:00Z"}, "debitPayload": {"count": 19, "currencyCode": "b0ceCbphW4YMhJ0S", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 74, "entitlementCollectionId": "bez9ZLHW882riiPf", "entitlementOrigin": "Xbox", "itemIdentity": "YB9BgSZBvkehRn83", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 77, "entitlementId": "0nrW1qx3NJTugVWX"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "Dw6mLBordrJkD6vy"}, {"operations": [{"creditPayload": {"balanceOrigin": "Twitch", "count": 64, "currencyCode": "uRMT1Xw9K9Yb68a8", "expireAt": "1983-10-21T00:00:00Z"}, "debitPayload": {"count": 13, "currencyCode": "kvA5xF3zHtZSd3Qz", "walletPlatform": "IOS"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "krN4pWryt4XTNwpp", "entitlementOrigin": "GooglePlay", "itemIdentity": "ni1YfIgLZ4YIzElr", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 83, "entitlementId": "1e1825iasunESjcg"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "System", "count": 100, "currencyCode": "drXG5NkKCySLA8cK", "expireAt": "1985-06-23T00:00:00Z"}, "debitPayload": {"count": 38, "currencyCode": "KqeoTiNKGRUMrimG", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 73, "entitlementCollectionId": "z6OhmHOpCdr3WzDm", "entitlementOrigin": "GooglePlay", "itemIdentity": "FuU8iXCRz8Kgqgwi", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 17, "entitlementId": "YxpGhsFArq6lolbj"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 39, "currencyCode": "HPwKDpJmkeoAkp3Z", "expireAt": "1976-05-09T00:00:00Z"}, "debitPayload": {"count": 19, "currencyCode": "gyJYwclb4gd4QgQu", "walletPlatform": "Other"}, "fulFillItemPayload": {"count": 59, "entitlementCollectionId": "2hiPuDdOPHcN9drw", "entitlementOrigin": "Oculus", "itemIdentity": "nfs4tLVOYQCWMktm", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 67, "entitlementId": "Kd9vLPP0w52JRAZx"}, "type": "CREDIT_WALLET"}], "userId": "DqWrpkWnnova15WV"}], "metadata": {"uE5cYVP9tQSa27Bn": {}, "Pyq3I1BLtGEZDRNk": {}, "k4DJUofJXK8RGS0z": {}}, "needPreCheck": true, "transactionId": "8hePJjMp0TKKUBfP", "type": "NI9f2oLWDPSZexfK"}' \
    > test.out 2>&1
eval_tap $? 237 'Commit' test.out

#- 238 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '48' \
    --status 'FAILED' \
    --type 'qdxmh5QWxuQuI7gd' \
    --userId 'DTDb3WdnOpzTrRzC' \
    > test.out 2>&1
eval_tap $? 238 'GetTradeHistoryByCriteria' test.out

#- 239 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'CafADJfWBspT3MLw' \
    > test.out 2>&1
eval_tap $? 239 'GetTradeHistoryByTransactionId' test.out

#- 240 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'JZquMQSPp5XD4S1i' \
    --body '{"achievements": [{"id": "lfgff7Et4uY8nlBw", "value": 66}, {"id": "uXvZUbQQ13FhD3NE", "value": 48}, {"id": "g6ZJYnkHDnHTlRug", "value": 79}], "steamUserId": "Qk0VzWRNFNiUn2yX"}' \
    > test.out 2>&1
eval_tap $? 240 'UnlockSteamUserAchievement' test.out

#- 241 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'MSCcHADYpS861c0C' \
    --xboxUserId 'J7LzpFvOSF6xKA6y' \
    > test.out 2>&1
eval_tap $? 241 'GetXblUserAchievements' test.out

#- 242 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'rnvXY5dDwneac75C' \
    --body '{"achievements": [{"id": "6S2eHsH4Y84hL75Q", "percentComplete": 2}, {"id": "nPR0Y1sffUaZ64dF", "percentComplete": 32}, {"id": "gtfuqJHrs4e3RnWR", "percentComplete": 91}], "serviceConfigId": "0MdBZezfwc3H0qSb", "titleId": "Mq4GLj8aGsH0qE5p", "xboxUserId": "601ak59yFSfdZIv8"}' \
    > test.out 2>&1
eval_tap $? 242 'UpdateXblUserAchievement' test.out

#- 243 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'oYWPUS4Zu0SbTt6M' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeCampaign' test.out

#- 244 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '2XizikCh6q0yq2WA' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeEntitlement' test.out

#- 245 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'HtL7IWE3MFqvfDG5' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeFulfillment' test.out

#- 246 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'jvMOaXrDlEX42U0s' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizeIntegration' test.out

#- 247 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'yrGNhBmgT2q0kIbr' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeOrder' test.out

#- 248 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'J2S5Pf1Lvg8kYEVy' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizePayment' test.out

#- 249 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'lINJpxFY8E6pU8eH' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeRevocation' test.out

#- 250 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'jh0aTjIOaQt0snbE' \
    > test.out 2>&1
eval_tap $? 250 'AnonymizeSubscription' test.out

#- 251 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId '0yMvqF7TJ9uB0zyp' \
    > test.out 2>&1
eval_tap $? 251 'AnonymizeWallet' test.out

#- 252 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'jJiu7BIimNuwB3hB' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 252 'GetUserDLCByPlatform' test.out

#- 253 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'huSMHhf5R2MkxQTA' \
    --includeAllNamespaces  \
    --status 'REVOKED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 253 'GetUserDLC' test.out

#- 254 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'efhxRtrqbv56oqwn' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId 'ZEeXBd6mGG6SHcZb' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName '9DqZJRYV1oqNLmPA' \
    --features 'UIMwa2wYq6DsUq38,bYvaWLoKzHnngdfF,nOfY9stXH6LYXXMn' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'dxBPKmHVB7cNzHhv,xc4xAPZ86WNnQOhu,sPn4466u8agb5HPs' \
    --limit '56' \
    --offset '66' \
    --origin 'Playstation' \
    > test.out 2>&1
eval_tap $? 254 'QueryUserEntitlements' test.out

#- 255 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '0Eo6QJ9vBRJ4UP09' \
    --body '[{"collectionId": "fabC01Thm9f4AWpy", "endDate": "1975-03-13T00:00:00Z", "grantedCode": "KVT3OvEujx5yjtQS", "itemId": "CJaOHzpb623EciYo", "itemNamespace": "YOPVg6DLEZ6DxpwB", "language": "St_wr", "metadata": {"wXqF6K0WA76Kl2mH": {}, "Hoz6qBQnEDgX49n1": {}, "xTDFcmOm1sqdIWU6": {}}, "origin": "Steam", "quantity": 57, "region": "RylESgf5dXMrPoYS", "source": "OTHER", "startDate": "1973-03-02T00:00:00Z", "storeId": "msp7o3F2LQw7Y2Vd"}, {"collectionId": "SxgXez7VvS0C9JLV", "endDate": "1992-08-19T00:00:00Z", "grantedCode": "QPa7PPx4Zi6WaC8w", "itemId": "k7HMbJhNwZgf5nlM", "itemNamespace": "DORYuXnPNJgayPFc", "language": "zvN-tzMb", "metadata": {"dUSiTOrhB8hVs29W": {}, "OKmZRTtgycLzXz6l": {}, "UMKi5mweMEZo2ZnL": {}}, "origin": "Twitch", "quantity": 43, "region": "g2JfH4f73jAevOnE", "source": "REWARD", "startDate": "1986-07-09T00:00:00Z", "storeId": "JLlb2AfUEEBbqMMK"}, {"collectionId": "vkOsR1fHUyirMVMO", "endDate": "1987-11-24T00:00:00Z", "grantedCode": "ES2J2OzNlJE3uqZz", "itemId": "574g31cA0PwZxTIZ", "itemNamespace": "VSGQyTzhs9Asy4d6", "language": "gpp", "metadata": {"2sQuWUBBHZonSmzF": {}, "831vlCiZAZHCWMXx": {}, "Vh8HTrKqVwnpPn8N": {}}, "origin": "Xbox", "quantity": 47, "region": "hJQq94Re5IM1akNK", "source": "REDEEM_CODE", "startDate": "1983-05-28T00:00:00Z", "storeId": "IltQUku3n32atB0Q"}]' \
    > test.out 2>&1
eval_tap $? 255 'GrantUserEntitlement' test.out

#- 256 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PQPEp5UtwUWGt6to' \
    --activeOnly  \
    --appId 'oHP5kAww01zalTdd' \
    > test.out 2>&1
eval_tap $? 256 'GetUserAppEntitlementByAppId' test.out

#- 257 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'hAQ1pwqnybvUIfuu' \
    --activeOnly  \
    --limit '24' \
    --offset '17' \
    --appType 'DLC' \
    > test.out 2>&1
eval_tap $? 257 'QueryUserEntitlementsByAppType' test.out

#- 258 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'QKZqz5NSp0B7LODN' \
    --ids '3Boi2sSAO2n4MZQt,753XQB93rOW0guPo,QbYzc1RDVhs2lhdz' \
    > test.out 2>&1
eval_tap $? 258 'GetUserEntitlementsByIds' test.out

#- 259 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'xxgibuqUuyW3cMz9' \
    --activeOnly  \
    --entitlementClazz 'SUBSCRIPTION' \
    --platform 'iNBQy41M1gzGCbax' \
    --itemId 'w33rNbE4bbDU4FMT' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementByItemId' test.out

#- 260 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'bQaANJOODGerDCWc' \
    --ids 'l3VSJENQopeHD6iK,BGm5Cj7RqnJUmfDm,ofxvN8pRGoUtmbWZ' \
    --platform 'bEjPyq35BWDoc3qN' \
    > test.out 2>&1
eval_tap $? 260 'GetUserActiveEntitlementsByItemIds' test.out

#- 261 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'cQFFyHv141NPqjRU' \
    --activeOnly  \
    --entitlementClazz 'MEDIA' \
    --platform 'u7ry3AQ2sEHvSxjW' \
    --sku 'oM1rNJLM0OOVG5cG' \
    > test.out 2>&1
eval_tap $? 261 'GetUserEntitlementBySku' test.out

#- 262 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '6XxENbWqlX7idzjp' \
    --appIds 'KDfwl6XlCF6YxFMD,8tJQwZvUVInos5RK,100yH89i8ZDPXRL8' \
    --itemIds 'cbTAntB1STaab1Ue,ibXg7RCe5BtKcwj6,PqqOgCimr3ZQNBBk' \
    --platform 'rXu9czsYr3cFeVw7' \
    --skus '0xdNTuOdLKK0M2B2,hbqJin37P69t1Kqe,Gz7qbPnXEuOzzkoB' \
    > test.out 2>&1
eval_tap $? 262 'ExistsAnyUserActiveEntitlement' test.out

#- 263 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'mMR9C4qPqJrAdh1H' \
    --platform 'Ik7vCEq7FQ2S5VeW' \
    --itemIds '9ddxzLPV8wDjsnyP,h5yNbYXmlAOi1SC3,I1SjkH42LtyZKrTJ' \
    > test.out 2>&1
eval_tap $? 263 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 264 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'o0L5sHil4Q0mqa8G' \
    --appId 'atrjbJ5YT7uvqarT' \
    > test.out 2>&1
eval_tap $? 264 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 265 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'vrG1DXZAWlvz3c3X' \
    --entitlementClazz 'LOOTBOX' \
    --platform 'pscUpVAciu2XPPUx' \
    --itemId 'zXHUvxhvTZcvRKoa' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipByItemId' test.out

#- 266 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'M4ozSAg8FTLrByWO' \
    --ids 'JhbocoGlPzdfxcC3,rpWhSpq0InxMLpP7,n7M3JXjEvsj5WcQ9' \
    --platform '9M1yuXeqV31LX2eh' \
    > test.out 2>&1
eval_tap $? 266 'GetUserEntitlementOwnershipByItemIds' test.out

#- 267 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'cMnM6QtjzQjDlUMC' \
    --entitlementClazz 'MEDIA' \
    --platform '1QYvww4XDokltgq2' \
    --sku 'vXtUnY6UhDJ4pe0s' \
    > test.out 2>&1
eval_tap $? 267 'GetUserEntitlementOwnershipBySku' test.out

#- 268 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '0Cuhl3dU9b4seYCy' \
    > test.out 2>&1
eval_tap $? 268 'RevokeAllEntitlements' test.out

#- 269 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'iB4tDCWx3cEX8wTi' \
    --entitlementIds '1v2abpCWytPEi9Ze' \
    > test.out 2>&1
eval_tap $? 269 'RevokeUserEntitlements' test.out

#- 270 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId '0hL9rPkV5GkSrcl2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'O47XVzU7qlNVk7qn' \
    > test.out 2>&1
eval_tap $? 270 'GetUserEntitlement' test.out

#- 271 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'mBS3XKDhp1OkMcEr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'meH0lX1hj0LaXgQ9' \
    --body '{"collectionId": "4flh775AQfzNjQ7I", "endDate": "1981-02-01T00:00:00Z", "nullFieldList": ["MSY2epRDJjDyMDKQ", "huTjtQZyIiAmCL8b", "NTTfqLCv9DYBOPro"], "origin": "Xbox", "reason": "KdwNhiIP7dpJ8B8V", "startDate": "1982-04-08T00:00:00Z", "status": "SOLD", "useCount": 84}' \
    > test.out 2>&1
eval_tap $? 271 'UpdateUserEntitlement' test.out

#- 272 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'QnVco2oCn1KvJmbj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'apW9UlEqtzDd7Sgx' \
    --body '{"metadata": {"dxB5kvtM8ah9bPsk": {}, "sceGUEX8ERZcKSYL": {}, "o6y7yJMowQ6LpHCv": {}}, "options": ["CYTgX9JQwErzjtuP", "9pUUv7qefNMFsZAI", "qak1zi0JSa5cRn31"], "platform": "D8ubfdXi7BycDPck", "requestId": "eGJUgU8bD5mGFFmK", "useCount": 94}' \
    > test.out 2>&1
eval_tap $? 272 'ConsumeUserEntitlement' test.out

#- 273 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'ME8X2MxILI42BJMP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kZmay4Csye3iJLtj' \
    > test.out 2>&1
eval_tap $? 273 'DisableUserEntitlement' test.out

#- 274 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'su6ZJRCoDq3geuHF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FaZzPIjETqcKN1ga' \
    > test.out 2>&1
eval_tap $? 274 'EnableUserEntitlement' test.out

#- 275 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'Q4Bn0cPPtKaJlw31' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pdDrXQ47WSGyDCKF' \
    > test.out 2>&1
eval_tap $? 275 'GetUserEntitlementHistories' test.out

#- 276 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId '0LLhO3lGZ7eGOPj2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XoFug8BUQUmPHnPu' \
    --body '{"metadata": {"mcazKAna0ji757aN": {}, "DFeKnQP2j2WsQImT": {}, "wYkiuxzLrbJ0BkGz": {}}}' \
    > test.out 2>&1
eval_tap $? 276 'RevokeUserEntitlement' test.out

#- 277 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'CNgesQlZZHIZH0ik' \
    --namespace "$AB_NAMESPACE" \
    --userId 's6kx0adnimPyyzez' \
    --body '{"reason": "sHdFftHHR6xbcVVo", "useCount": 28}' \
    > test.out 2>&1
eval_tap $? 277 'RevokeUserEntitlementByUseCount' test.out

#- 278 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'WSNrCjSNEAdojkCM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mYyTGO07foRZ6Fuj' \
    --quantity '31' \
    > test.out 2>&1
eval_tap $? 278 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 279 RevokeUseCount
eval_tap 0 279 'RevokeUseCount # SKIP deprecated' test.out

#- 280 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId 'PSsquWUafwbFPX15' \
    --namespace "$AB_NAMESPACE" \
    --userId '633pFgA7i9tqvfHm' \
    --body '{"platform": "FvUZiUW5Y0CYw5OX", "requestId": "SGwQkJuy9oLFcHHc", "useCount": 35}' \
    > test.out 2>&1
eval_tap $? 280 'SellUserEntitlement' test.out

#- 281 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'RtwaM2IoyY1wpIdj' \
    --body '{"duration": 5, "endDate": "1988-08-06T00:00:00Z", "entitlementCollectionId": "Ysii3fCh7sieJjZP", "entitlementOrigin": "Playstation", "itemId": "ya73hX0a8Ri85PA9", "itemSku": "wNpmrK5Y5heA2ewW", "language": "nFcqHxXP3kRhtrBc", "metadata": {"BofWTGYx2ihgioL8": {}, "VvEzHGTt9emdCLmz": {}, "JbdkykVAnmnRfUil": {}}, "order": {"currency": {"currencyCode": "cKA84d9pMsl7zrNJ", "currencySymbol": "vDiP2hNNEI8QrQ6H", "currencyType": "VIRTUAL", "decimals": 69, "namespace": "o5CtU8UjgyCUpM1J"}, "ext": {"BcTzf4dz1BojPoQg": {}, "976409vFd5z9r4nJ": {}, "WUvLp1wxGF747468": {}}, "free": true}, "orderNo": "XUq3uIffkIpPmrWV", "origin": "Playstation", "overrideBundleItemQty": {"tUVtqbDWnJ2i9TRm": 73, "opVl38d4NZGtk6Em": 100, "OSgbsdGVPLD9A5Nm": 43}, "quantity": 90, "region": "ZDUV3yHurgOfba1X", "source": "DLC", "startDate": "1994-04-28T00:00:00Z", "storeId": "9JA0ll1RimBCiQwu"}' \
    > test.out 2>&1
eval_tap $? 281 'FulfillItem' test.out

#- 282 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'yrI87uSyXP6C0jXS' \
    --body '{"code": "8au2wcWYyj3JvHqX", "language": "Fk_wHjU", "region": "fGVsglnOxOXBfgBL"}' \
    > test.out 2>&1
eval_tap $? 282 'RedeemCode' test.out

#- 283 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'uglkd9LIoshGnFSu' \
    --body '{"itemId": "Hmrqej8PRppYY1vl", "itemSku": "V0M2g6oreqyBzWzC", "quantity": 13}' \
    > test.out 2>&1
eval_tap $? 283 'PreCheckFulfillItem' test.out

#- 284 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'btIXICLkK8ZvbnTg' \
    --body '{"entitlementCollectionId": "3znlg8nmzQx1RsYh", "entitlementOrigin": "Epic", "metadata": {"ZqISn3msrykQFtW8": {}, "QGKFZLrIfqrZuu7I": {}, "wKcT7sAsv2TKCbYM": {}}, "origin": "Oculus", "rewards": [{"currency": {"currencyCode": "kXEHmsHwIGGsusS0", "namespace": "zZRODEKPdudZsLaf"}, "item": {"itemId": "8aZrXW84dt0TSTmy", "itemName": "7XF26K2U7xttUz8n", "itemSku": "WKJjv06PuffHghAQ", "itemType": "fAsYXVzBenLtaAoY"}, "quantity": 50, "type": "CURRENCY"}, {"currency": {"currencyCode": "xAzmsbhi5QJuc2SN", "namespace": "BaOlXfgsgBd7MYLL"}, "item": {"itemId": "oPZrkjRm5Ki0orhX", "itemName": "rISEaPZHLQkTHvnd", "itemSku": "QsCKAO2JRz3CGwtu", "itemType": "jkzxidLcAQWGVRg6"}, "quantity": 60, "type": "ITEM"}, {"currency": {"currencyCode": "Vso5TJCSugdo4XTm", "namespace": "8t1YTWqItjNWXm9s"}, "item": {"itemId": "raeMA78YSRS2fPy5", "itemName": "fpbbbMIu9lu18jIM", "itemSku": "BUM77XmemN8LO03m", "itemType": "nFSq9jJTVFoFjxZj"}, "quantity": 15, "type": "ITEM"}], "source": "OTHER", "transactionId": "LoexHBMBMMAYokSW"}' \
    > test.out 2>&1
eval_tap $? 284 'FulfillRewards' test.out

#- 285 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'FwajRGUyklfLVY6g' \
    --endTime '3PO4hKAeF4GUV5m9' \
    --limit '26' \
    --offset '34' \
    --productId 'ZXoJ4gI4EQKO8xC4' \
    --startTime 'D0FsUo3IB2kX5REQ' \
    --status 'PARTIAL_REVOKED' \
    --type 'PLAYSTATION' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPOrders' test.out

#- 286 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'HyXzoIXNf0KbL9Hy' \
    > test.out 2>&1
eval_tap $? 286 'QueryAllUserIAPOrders' test.out

#- 287 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'JttdgfLGO3ummpll' \
    --endTime 'nV6B62P1Kazg73c6' \
    --limit '95' \
    --offset '19' \
    --startTime 'pmA4ehxNIIlcrZzg' \
    --status 'FAIL' \
    --type 'STADIA' \
    > test.out 2>&1
eval_tap $? 287 'QueryUserIAPConsumeHistory' test.out

#- 288 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'meT2mLkkAMjHyI0e' \
    --body '{"itemIdentityType": "ITEM_ID", "language": "BXn", "productId": "3O7CEYjxqElP5lA2", "region": "FJ0iGLRTXGsC5mxx", "transactionId": "se4eeuMgEctVEux2", "type": "TWITCH"}' \
    > test.out 2>&1
eval_tap $? 288 'MockFulfillIAPItem' test.out

#- 289 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'SuwsEHlwdeJyhsHS' \
    --namespace "$AB_NAMESPACE" \
    --userId '6YqPudWviQsULL1t' \
    > test.out 2>&1
eval_tap $? 289 'AdminGetIAPOrderLineItems' test.out

#- 290 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'xfX9tqFSkGXoIcFN' \
    > test.out 2>&1
eval_tap $? 290 'AdminSyncSteamAbnormalTransaction' test.out

#- 291 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '5JL9M53Mg0MzWS9u' \
    --body '{"orderId": "sxxnMhjv66DyED4p"}' \
    > test.out 2>&1
eval_tap $? 291 'AdminSyncSteamIAPByTransaction' test.out

#- 292 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'rRVibTATxd7Mzjv1' \
    --activeOnly  \
    --groupId 'gSj8kcNhoqcRZRNA' \
    --limit '93' \
    --offset '15' \
    --platform 'OCULUS' \
    --productId '479W8rXqwGVIRWgT' \
    > test.out 2>&1
eval_tap $? 292 'QueryUserThirdPartySubscription' test.out

#- 293 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId 'qMrAGpdyF6WDHn3e' \
    --groupId 'PBxQNz2IUEHMzl5j' \
    > test.out 2>&1
eval_tap $? 293 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 294 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    --userId 'EzoUlUWqP4ElzL44' \
    --productId 'KEm3uHBMCP5ckjph' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 295 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'URs4ksgsKJ2R6Jac' \
    --activeOnly  \
    --groupId 'wwu8W1zvrKMRPvwA' \
    --limit '22' \
    --offset '10' \
    --platform 'GOOGLE' \
    --productId 'yJz03NETdywPqYer' \
    > test.out 2>&1
eval_tap $? 295 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 296 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id 'rpOm4M2pM4fIfcHB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WZM50aHbPXRns3qw' \
    > test.out 2>&1
eval_tap $? 296 'GetThirdPartySubscriptionDetails' test.out

#- 297 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'YL6LwGlZGF7XQPLA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cIL7FvAMWqhyyNZH' \
    --limit '59' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 297 'GetSubscriptionHistory' test.out

#- 298 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'ducB5y5iMdeBG7RE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G4meKEabfVXBJPIZ' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscriptionTransaction' test.out

#- 299 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id 'qZC5d6JuFdcfiNf0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOHKwxDF5GJhCjVH' \
    > test.out 2>&1
eval_tap $? 299 'GetThirdPartyUserSubscriptionDetails' test.out

#- 300 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'iCn2hTefT8gPFJ4W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ndMpQhcLK0WTZbtm' \
    > test.out 2>&1
eval_tap $? 300 'SyncSubscription' test.out

#- 301 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'QkwC8azx3IRWme3C' \
    --discounted  \
    --itemId '6p2r4D3NQdjrjkX3' \
    --limit '55' \
    --offset '79' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 301 'QueryUserOrders' test.out

#- 302 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'gK3JgZufzssA284m' \
    --body '{"currencyCode": "G7uAojLYBsx8oqMz", "currencyNamespace": "bE0ljQaBtb47V691", "discountCodes": ["j0FZp2vjOXptxzx6", "kkaZYpl52sQR9Znp", "5d1eSwrG2GBBEWrD"], "discountedPrice": 2, "entitlementPlatform": "Other", "ext": {"ZzhDuLHq9LTBstgu": {}, "OdN0O7l3GbKPHdDT": {}, "QDEEE2mTsn1NwJ71": {}}, "itemId": "szsNmnqZSWdEyOVY", "language": "rTdDq7IqbTVv8BLs", "options": {"skipPriceValidation": true}, "platform": "IOS", "price": 87, "quantity": 92, "region": "W8HSrEm5Y7jI232S", "returnUrl": "jktijiNzTUe8Kdiz", "sandbox": false, "sectionId": "1kyKk0UXUF2523OT"}' \
    > test.out 2>&1
eval_tap $? 302 'AdminCreateUserOrder' test.out

#- 303 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'vOmfVNJNDaSO3FEk' \
    --itemId 'k4It6V8Bu7rIjGrx' \
    > test.out 2>&1
eval_tap $? 303 'CountOfPurchasedItem' test.out

#- 304 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'UMKbv60ixUuUhopd' \
    --userId 'qGrqRZ124P7PauXT' \
    > test.out 2>&1
eval_tap $? 304 'GetUserOrder' test.out

#- 305 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'rpWAjwatSvtPbAFn' \
    --userId '8oWQcmFkkRX6Eqad' \
    --body '{"status": "FULFILL_FAILED", "statusReason": "iAMa6Pco7Mfviksl"}' \
    > test.out 2>&1
eval_tap $? 305 'UpdateUserOrderStatus' test.out

#- 306 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'pyL9BYLVVznF6hMY' \
    --userId 'fksp8VQhYSFeBOp0' \
    > test.out 2>&1
eval_tap $? 306 'FulfillUserOrder' test.out

#- 307 GetUserOrderGrant
eval_tap 0 307 'GetUserOrderGrant # SKIP deprecated' test.out

#- 308 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ilGQFwHUtZugblT3' \
    --userId 'aIDKn9qJXncm5igp' \
    > test.out 2>&1
eval_tap $? 308 'GetUserOrderHistories' test.out

#- 309 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'AewbmnWk0E7YaPbl' \
    --userId 'cWEyNgvs5LEZrQXz' \
    --body '{"additionalData": {"cardSummary": "SQRWRs9EGnRPgYlJ"}, "authorisedTime": "1986-02-14T00:00:00Z", "chargebackReversedTime": "1976-12-25T00:00:00Z", "chargebackTime": "1974-04-23T00:00:00Z", "chargedTime": "1989-11-04T00:00:00Z", "createdTime": "1972-03-29T00:00:00Z", "currency": {"currencyCode": "Lbp7OmcrDJ7u1rrR", "currencySymbol": "PcnG89rnNW1Yjfn8", "currencyType": "REAL", "decimals": 100, "namespace": "Y4DnYRxY8ZhHeb0C"}, "customParameters": {"aPFDjrSotKnpJWAL": {}, "pToj9rgr5RffM5JX": {}, "vPdzEpDln04F8BQj": {}}, "extOrderNo": "zobhDa8VxKOrfVfB", "extTxId": "RIfkStOqdXqhDMQ6", "extUserId": "tBLljC7gcT3M1DAr", "issuedAt": "1976-05-18T00:00:00Z", "metadata": {"L80aXFY7SQkym9Kv": "KMHK5fbqioeoRIpl", "Y0DIzRCNAO6ZpqXJ": "mPJso6M11LLZWKgW", "xn9YL16HQdtAneXG": "gxNg33ZIUrIkfmdX"}, "namespace": "VvaPQzzKdFg7N7pi", "nonceStr": "T8VcrXLZnuMNpKEI", "paymentData": {"discountAmount": 38, "discountCode": "ORFkN9EbKbTbrDzN", "subtotalPrice": 12, "tax": 97, "totalPrice": 79}, "paymentMethod": "Ecw0lxRam16O6v4V", "paymentMethodFee": 20, "paymentOrderNo": "YOMO91CYEjX867n9", "paymentProvider": "WALLET", "paymentProviderFee": 97, "paymentStationUrl": "fR7mMuBXPDKCriRK", "price": 53, "refundedTime": "1986-02-24T00:00:00Z", "salesTax": 94, "sandbox": false, "sku": "AVRnUVbxEJcKHE76", "status": "AUTHORISE_FAILED", "statusReason": "EwhQfxFKIOGT1WKS", "subscriptionId": "mLoA0ILaESC1GJXs", "subtotalPrice": 30, "targetNamespace": "tY7o5FFi1n10vDgy", "targetUserId": "oHXIlrMl2RAukCL2", "tax": 17, "totalPrice": 1, "totalTax": 16, "txEndTime": "1984-01-31T00:00:00Z", "type": "sFrmaGNoi3RPTgWo", "userId": "tLNz0u8ySxA0yrjz", "vat": 33}' \
    > test.out 2>&1
eval_tap $? 309 'ProcessUserOrderNotification' test.out

#- 310 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'sToQNkuZzJ1XBxw0' \
    --userId '1iBBQukgQ94ZvPCW' \
    > test.out 2>&1
eval_tap $? 310 'DownloadUserOrderReceipt' test.out

#- 311 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'cMX0ov3U2sKjIeyF' \
    --body '{"currencyCode": "S97dYD7LkcTKYpCf", "currencyNamespace": "l6HPy5cJfAV5iOfz", "customParameters": {"wt3bpxRNt6lKoMjC": {}, "PtEKeBWTm78Fn8Tv": {}, "ZVTe4L2lXrVPX6r5": {}}, "description": "ZTcnVVOKMApTcWsF", "extOrderNo": "RUlWBp4gBs9Uufgs", "extUserId": "VbG6TUe3jbuQ7HMP", "itemType": "SUBSCRIPTION", "language": "ZPa_ZKzs-Gq", "metadata": {"lFCrjxqqxAYqXG2V": "3baMkZ9JCqBIkUID", "0EE9InZNLwwAhW2b": "5OHKtUv4lTkQNjxh", "Xdj1CG0EBgst9Qu8": "Ofl2oB8VTjF0pD3N"}, "notifyUrl": "HU8iYUOtG5gbQSKW", "omitNotification": true, "platform": "dgCH4bWxRF6fBPa6", "price": 66, "recurringPaymentOrderNo": "dMkdg9TMwxNcQ6Ck", "region": "Vi8fqVPRqNbF5yLn", "returnUrl": "YSa8xFLvcYexMMMi", "sandbox": true, "sku": "CjWc22qqDfNz59jH", "subscriptionId": "wSDQHadmAo0lzhPm", "title": "7RmaOr6TLwVyE42A"}' \
    > test.out 2>&1
eval_tap $? 311 'CreateUserPaymentOrder' test.out

#- 312 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'pAb7CKt79wAopZL9' \
    --userId 'Cw6K9h55mwUvhdBO' \
    --body '{"description": "gumV4wAsd4ifGd0b"}' \
    > test.out 2>&1
eval_tap $? 312 'RefundUserPaymentOrder' test.out

#- 313 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'kWrlhtfTywRW4fmg' \
    > test.out 2>&1
eval_tap $? 313 'GetUserPlatformAccountClosureHistories' test.out

#- 314 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId '6btk3mAO4EtB0hn2' \
    --body '{"code": "x1oTOX5gBQlVDx9n", "orderNo": "eFHWhDRJtyYEt7yg"}' \
    > test.out 2>&1
eval_tap $? 314 'ApplyUserRedemption' test.out

#- 315 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZleAoUuVKneoO10y' \
    --body '{"meta": {"tPdJ8SY3qoogOxoP": {}, "YvdIBJYyGURjEjns": {}, "lEYM8ngVT1ewVxvg": {}}, "reason": "AocOqsd5v5n7eXCo", "requestId": "9gZWdxfIdW8fNAM5", "revokeEntries": [{"currency": {"balanceOrigin": "Steam", "currencyCode": "dHivK2Q0WwolQy03", "namespace": "7hJMOEv5W0v25yAO"}, "entitlement": {"entitlementId": "bZIbrA8XAKKWMDeb"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "WFTuNPf5JCSDyYy4", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 33, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "TZxSoZbQUnUxS6m6", "namespace": "8WL3HDL4yx5I0euB"}, "entitlement": {"entitlementId": "sccHPA2v9XP9enfE"}, "item": {"entitlementOrigin": "Epic", "itemIdentity": "7lloLgIYqxFfSNJl", "itemIdentityType": "ITEM_SKU", "origin": "GooglePlay"}, "quantity": 19, "type": "ENTITLEMENT"}, {"currency": {"balanceOrigin": "Twitch", "currencyCode": "9k9W6ZLVJzRpUsIT", "namespace": "fVruDukun42zPZvO"}, "entitlement": {"entitlementId": "d4yZyMKyED3qDO5H"}, "item": {"entitlementOrigin": "Nintendo", "itemIdentity": "z5cnbm7z2Aa24yBT", "itemIdentityType": "ITEM_SKU", "origin": "GooglePlay"}, "quantity": 46, "type": "CURRENCY"}], "source": "ORDER", "transactionId": "NGyWf3VujS7Bq5bc"}' \
    > test.out 2>&1
eval_tap $? 315 'DoRevocation' test.out

#- 316 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPW4pPZB9YXltCxy' \
    --body '{"gameSessionId": "ztUnj17t3gHBXvjv", "payload": {"ziexzOLbOWbtcJUx": {}, "M3AWyDkA5LmART6k": {}, "ulpM4SRtUE5P4kxm": {}}, "scid": "HtFbjqurHix0QYyc", "sessionTemplateName": "DH5we2Mx0sYCnYPT"}' \
    > test.out 2>&1
eval_tap $? 316 'RegisterXblSessions' test.out

#- 317 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '4i4mxc14iRfzJwKu' \
    --chargeStatus 'CHARGED' \
    --itemId 'ghdfVhjnjd66A1SQ' \
    --limit '26' \
    --offset '99' \
    --sku 'wbYh7q02W8tkTURU' \
    --status 'CANCELLED' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 317 'QueryUserSubscriptions' test.out

#- 318 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'qNc8xhQqptccNorR' \
    --excludeSystem  \
    --limit '23' \
    --offset '14' \
    --subscriptionId 's7EC3nDnhFvDlFd7' \
    > test.out 2>&1
eval_tap $? 318 'GetUserSubscriptionActivities' test.out

#- 319 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'iyZpvWVJFK6Zuvlz' \
    --body '{"grantDays": 66, "itemId": "K7VUbjUnzirnEsxS", "language": "E4vBzG7VK8sWEshm", "reason": "Zf5fEdvjbyJPQ1qd", "region": "RcJjsme1OukIfIZV", "source": "H8q8svV5hMOSfpyJ"}' \
    > test.out 2>&1
eval_tap $? 319 'PlatformSubscribeSubscription' test.out

#- 320 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kJlmJmTkFvB7wkY6' \
    --itemId 'nuUEGJ3k0HGtpK43' \
    > test.out 2>&1
eval_tap $? 320 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 321 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'uORGREOOwTuY8dhN' \
    --userId 'CDWWpN3B6tedgFUz' \
    > test.out 2>&1
eval_tap $? 321 'GetUserSubscription' test.out

#- 322 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Bm5vGA3itKaF9z3W' \
    --userId 'Wuv3j8T9g1f6P3D3' \
    > test.out 2>&1
eval_tap $? 322 'DeleteUserSubscription' test.out

#- 323 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'rVcC2g6t42jE1Wad' \
    --userId '232YV7A2zHFGbN8A' \
    --force  \
    --body '{"immediate": false, "reason": "aCaw9UF7cdSDd99D"}' \
    > test.out 2>&1
eval_tap $? 323 'CancelSubscription' test.out

#- 324 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'QZ7vnTx8HDXTJWiy' \
    --userId 'w17ogzmbj4SLYDrZ' \
    --body '{"grantDays": 74, "reason": "NhmUt6fzYRn85brT"}' \
    > test.out 2>&1
eval_tap $? 324 'GrantDaysToSubscription' test.out

#- 325 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'u8F7cuCPh1TGZJmg' \
    --userId 'WNHWnvOBRCt4onqR' \
    --excludeFree  \
    --limit '29' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 325 'GetUserSubscriptionBillingHistories' test.out

#- 326 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2PnMSRarKg4coy3A' \
    --userId 'FpULIn21Nf2FNgDW' \
    --body '{"additionalData": {"cardSummary": "NC6yh7kgTHlrxKbs"}, "authorisedTime": "1995-03-04T00:00:00Z", "chargebackReversedTime": "1996-06-03T00:00:00Z", "chargebackTime": "1995-05-21T00:00:00Z", "chargedTime": "1984-10-05T00:00:00Z", "createdTime": "1985-08-15T00:00:00Z", "currency": {"currencyCode": "SFBEgkwHifMHYI58", "currencySymbol": "1HbF7fMX9lDXYxGR", "currencyType": "VIRTUAL", "decimals": 45, "namespace": "2eX42WW2WKf5urEO"}, "customParameters": {"pASBicX3ZwzZ7aVh": {}, "rkmhSOEozGOv8D0i": {}, "Vxzrec5kNwJAxm0R": {}}, "extOrderNo": "dm9l6nIhG5SilDDI", "extTxId": "smj4h625dIsMKWBx", "extUserId": "F9RAIrI81ZR2kNzh", "issuedAt": "1982-12-25T00:00:00Z", "metadata": {"5b9qXzlIK2G6AUjB": "Cdf0Rp5e5IvFuN1o", "UsCnBmGMx5F6EhM3": "dKvIG9MR0hTINvq1", "VR9SJUfQEX996Mh1": "sQ3Dw3uyjgQNAs91"}, "namespace": "88Qm3W1De2McGd10", "nonceStr": "wefF0CJlH55RLEge", "paymentData": {"discountAmount": 54, "discountCode": "FmrLT0HbvS4kSSt3", "subtotalPrice": 59, "tax": 51, "totalPrice": 49}, "paymentMethod": "wqMayP8A3HGNI3Bf", "paymentMethodFee": 18, "paymentOrderNo": "2ElF6z6eJKuOW61a", "paymentProvider": "CHECKOUT", "paymentProviderFee": 30, "paymentStationUrl": "RFizqxCmudSXivAL", "price": 10, "refundedTime": "1978-03-17T00:00:00Z", "salesTax": 22, "sandbox": true, "sku": "8mhb2I2yBJeCJghT", "status": "CHARGED", "statusReason": "yIagSSzEL8H4euLu", "subscriptionId": "fhQj2KP3LLxl9Hs2", "subtotalPrice": 77, "targetNamespace": "cC9CkharfqaoMsGy", "targetUserId": "v1RuSNdycDssUeHi", "tax": 97, "totalPrice": 36, "totalTax": 61, "txEndTime": "1973-08-01T00:00:00Z", "type": "GmZzCQwilS3IxSjl", "userId": "yvR9PxG9Lji2Vc88", "vat": 99}' \
    > test.out 2>&1
eval_tap $? 326 'ProcessUserSubscriptionNotification' test.out

#- 327 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'uh9pY0011jSmHFTt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fM2mGUUpq3ix7Am7' \
    --body '{"count": 99, "orderNo": "MMaI4ryVDvNaruZx"}' \
    > test.out 2>&1
eval_tap $? 327 'AcquireUserTicket' test.out

#- 328 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'wTfh9gEs6GF247cb' \
    > test.out 2>&1
eval_tap $? 328 'QueryUserCurrencyWallets' test.out

#- 329 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'BLjUr5z03wxB3E9h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rE9f9COFrOr6wJDB' \
    --body '{"allowOverdraft": true, "amount": 2, "balanceOrigin": "System", "balanceSource": "OTHER", "metadata": {"DsJHNg6TvNGjwI4T": {}, "bTwBufUorJouduhC": {}, "EJ5XiKDIE9Yugcup": {}}, "reason": "LxVBcRkfhRuqkOTH"}' \
    > test.out 2>&1
eval_tap $? 329 'DebitUserWalletByCurrencyCode' test.out

#- 330 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'Sia7oFd1fEmDuyAs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QGzwJR5poI718RQn' \
    --limit '19' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 330 'ListUserCurrencyTransactions' test.out

#- 331 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode '4imu6XFfRcWDXhq1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YmGeygr2S4Yw8NmP' \
    --request '{"amount": 2, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"BeryzX2hOPVVFqVq": {}, "xjq1iG3TySOh8SI7": {}, "5oXbyq8FBbur80Qw": {}}, "reason": "nlgAVfqz6gQJh8sn", "walletPlatform": "Epic"}' \
    > test.out 2>&1
eval_tap $? 331 'CheckBalance' test.out

#- 332 CheckWallet
eval_tap 0 332 'CheckWallet # SKIP deprecated' test.out

#- 333 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode '9A88GDOUClGyzYgn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YTdim6PkRoq5TO65' \
    --body '{"amount": 76, "expireAt": "1988-07-27T00:00:00Z", "metadata": {"h8ztRJkXxUAj3jzZ": {}, "vEaY103YUIMuSjDH": {}, "z0zPWMZQNNP2JqQq": {}}, "origin": "GooglePlay", "reason": "IgmKwwMDQPjUIosq", "source": "SELL_BACK"}' \
    > test.out 2>&1
eval_tap $? 333 'CreditUserWallet' test.out

#- 334 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'yCB9TVZnuzgvAZJR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm71EC3ENuvD8OPsp' \
    --request '{"amount": 69, "debitBalanceSource": "TRADE", "metadata": {"Pj7jFWxSv1lYylYA": {}, "iZ8c7Zd7EUoezOLw": {}, "8C1c5bBB3XZ7ColK": {}}, "reason": "wlsNvtFuunQsvdXG", "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 334 'DebitByWalletPlatform' test.out

#- 335 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'JA4skqCbPxRkIAFQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h9yDdoLE2s7mrVrm' \
    --body '{"amount": 94, "metadata": {"Ju4ljPWlCWTuGO8M": {}, "nfOQu3wdT4Aodp95": {}, "o1RkX7iW7VpCngWA": {}}, "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 335 'PayWithUserWallet' test.out

#- 336 GetUserWallet
eval_tap 0 336 'GetUserWallet # SKIP deprecated' test.out

#- 337 DebitUserWallet
eval_tap 0 337 'DebitUserWallet # SKIP deprecated' test.out

#- 338 DisableUserWallet
eval_tap 0 338 'DisableUserWallet # SKIP deprecated' test.out

#- 339 EnableUserWallet
eval_tap 0 339 'EnableUserWallet # SKIP deprecated' test.out

#- 340 ListUserWalletTransactions
eval_tap 0 340 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 341 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Mworzym1z3ZdetOi' \
    > test.out 2>&1
eval_tap $? 341 'ListViews' test.out

#- 342 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'c9AQOFWpdItLBhvK' \
    --body '{"displayOrder": 72, "localizations": {"scsMBRLsWadk2OQ4": {"description": "21q7Nb1vrKthVvU5", "localExt": {"on065ApCkVN3Qchu": {}, "Q6pntxB648ss7rBn": {}, "vQHAM8gSdIybKUBy": {}}, "longDescription": "HBzfvgtRTPPzwJmK", "title": "aLCx3gcidEALWe6R"}, "G5wWznu5AjwR1Z4f": {"description": "U7ICcaQtuuKUw3dU", "localExt": {"wWHhQW3I1y9tjRLV": {}, "OXBMa0JiIe1AY0tU": {}, "A7EKASk3USNLhOBl": {}}, "longDescription": "xRBLgohp8ByTi2F6", "title": "AyUX8w77riPlPgJc"}, "LbeQf9MICxX7xKyC": {"description": "fgwSPz14asyOdgn7", "localExt": {"7gN8K1FlNkgbFE8U": {}, "4meK5grmPBsFH71V": {}, "rhsISYtegQbNA2WQ": {}}, "longDescription": "rHTkJT1VkChD3n0c", "title": "1ryAkRvdPR8gx2rX"}}, "name": "5dck8NFKPgT6LMeh"}' \
    > test.out 2>&1
eval_tap $? 342 'CreateView' test.out

#- 343 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'g047axU5ktNywRIv' \
    --storeId 'O2Sgz30hejqdktHI' \
    > test.out 2>&1
eval_tap $? 343 'GetView' test.out

#- 344 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'O1VdtMSews1TrU4F' \
    --storeId 'hAfKDcDG5bMTba1t' \
    --body '{"displayOrder": 96, "localizations": {"sRkabpmvRsc7ZYvX": {"description": "CT6m6mRZAlLBczJV", "localExt": {"eil7GbG1ISBCkcnp": {}, "xKUxLjmxhBS6YypR": {}, "W7fNntaIEtDI6Mbh": {}}, "longDescription": "xkQdezbmf392erso", "title": "Z2KbMb5jal0ruZmB"}, "XlGSp85q6fuGfo5w": {"description": "SDHnyabk493I3pvH", "localExt": {"KDaWhTN1qyxpUzWI": {}, "ZWJTDzWguhujw1Eo": {}, "R58uCVldefonHJZA": {}}, "longDescription": "iX4abmqqi90KTWwZ", "title": "k0HGeJNaBjVdMB5k"}, "MzKycYrhr4FnNzdT": {"description": "4pWwIVXp9avUr6Iy", "localExt": {"dpXW0MO0eT9okl6M": {}, "lWOl9feWO2bmOikT": {}, "BJHTEm5PSeyod5L6": {}}, "longDescription": "OooYoQn9iHEqWO1c", "title": "VCUIOx90FQdwLi3G"}}, "name": "OQkLtpuRNeT1CULE"}' \
    > test.out 2>&1
eval_tap $? 344 'UpdateView' test.out

#- 345 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'MPaOU5nukycAUlkU' \
    --storeId 'SZKUrsxNRzF3NaUu' \
    > test.out 2>&1
eval_tap $? 345 'DeleteView' test.out

#- 346 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 346 'GetWalletConfig' test.out

#- 347 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": true}' \
    > test.out 2>&1
eval_tap $? 347 'UpdateWalletConfig' test.out

#- 348 QueryWallets
eval_tap 0 348 'QueryWallets # SKIP deprecated' test.out

#- 349 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 50, "expireAt": "1992-12-13T00:00:00Z", "metadata": {"yze6zPKu5sE89JW8": {}, "UU0RsB6dvrpmInhH": {}, "YzVVlHGFSwjby6rM": {}}, "origin": "System", "reason": "kVQnZDUAbINRKQsx", "source": "REWARD"}, "currencyCode": "UnHnfrEdDfY4TTxu", "userIds": ["ZEuXQACDDQryNf9V", "8goZgsX4RwfM4qnU", "dcQqZ9F1uivPob0Y"]}, {"creditRequest": {"amount": 67, "expireAt": "1990-07-08T00:00:00Z", "metadata": {"rqgEIsMwNbfti0Lo": {}, "TBcNzyoCSw1t653G": {}, "3ydYmGzvx9bSqqyA": {}}, "origin": "Xbox", "reason": "6xNel4Bxb9KwFYqd", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "o7gOFVLZCBWuVIRO", "userIds": ["ZuqdJBi8pkn98VtL", "tZU5SuIhMSaDRp17", "NkaIQJfkFDhSeSGX"]}, {"creditRequest": {"amount": 9, "expireAt": "1992-12-25T00:00:00Z", "metadata": {"WHcjrb6qNeKpOxPr": {}, "lG9svdqsiVTqPbzY": {}, "1yxl7zeEpmSPO6Kw": {}}, "origin": "IOS", "reason": "djaJuUzFIeqaVr1C", "source": "PROMOTION"}, "currencyCode": "9OoiPdnq9KBqBwiN", "userIds": ["wW3EwLre1bL4dJnk", "RLJbMvOGSd7uMrmQ", "CsnK8CcO1OHbpQZt"]}]' \
    > test.out 2>&1
eval_tap $? 349 'BulkCredit' test.out

#- 350 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "2SaLd6M7TM3wnJyE", "request": {"allowOverdraft": true, "amount": 91, "balanceOrigin": "Other", "balanceSource": "PAYMENT", "metadata": {"o5z9RAcYgYZb7cAa": {}, "kJpqN6eubdp49JFw": {}, "XG0EvoSHNC97eEyh": {}}, "reason": "nL1QH5AlYRAqCAC2"}, "userIds": ["fB8jIecOx5ugNCDd", "6jW6fjtBcO3fWq9q", "gy1WF9QLNgDxAkwg"]}, {"currencyCode": "fmBv0XgJB6a7uykA", "request": {"allowOverdraft": true, "amount": 26, "balanceOrigin": "System", "balanceSource": "DLC_REVOCATION", "metadata": {"pinFcH2ZMSYijqEu": {}, "MfuYFUS079tOpZYM": {}, "1XV0Op0damycnTUO": {}}, "reason": "oMkOppZNOkqxc42H"}, "userIds": ["xgQCbpZx5yMGIQ1Z", "SxwzuIpGBYHTHoSV", "Kv5wvtPJVsuzaBci"]}, {"currencyCode": "xVIefYlKBJyQMqUE", "request": {"allowOverdraft": false, "amount": 15, "balanceOrigin": "Steam", "balanceSource": "OTHER", "metadata": {"ikX6yOlgZrn0I6T0": {}, "hvcAFTaSWR4VOGIY": {}, "7hM6uhonkAe0FdTS": {}}, "reason": "SEluBxM47BTww3nB"}, "userIds": ["TVmBFZ6TIs9bTi2m", "FeExlOFjRh8mLFTJ", "7eNsYEqKkeuLWDfe"]}]' \
    > test.out 2>&1
eval_tap $? 350 'BulkDebit' test.out

#- 351 GetWallet
eval_tap 0 351 'GetWallet # SKIP deprecated' test.out

#- 352 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'LveQSDWnMQGaYRxF' \
    --end 'Wia7yJ2d87XjA0aj' \
    --start 'vb7JcGUFgp6LkyXp' \
    > test.out 2>&1
eval_tap $? 352 'SyncOrders' test.out

#- 353 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["xJeFxhgTwyO51CUp", "cdxL0a9VDhrqWCTX", "OxQUpyFgZhNpOTE4"], "apiKey": "toH57yr01N33p1Gh", "authoriseAsCapture": false, "blockedPaymentMethods": ["5stwQFUEbTPQ8p7V", "MlxEXnqHwMyKpwph", "jUXvM1GqMkZ44UXg"], "clientKey": "dBqtJaRyDlP9qIZJ", "dropInSettings": "5Krx6KkHagEugKJx", "liveEndpointUrlPrefix": "kU8Y58COtTNjnNSi", "merchantAccount": "kJDg6ujKvq0CIa1Y", "notificationHmacKey": "CK9PlMeQprfgLGkH", "notificationPassword": "X1tdBjKmCBXETZwq", "notificationUsername": "dzAX28DikGk8cWiX", "returnUrl": "44azSHcwicUVq2XP", "settings": "ljTZj5R0yZSVQ8SS"}' \
    > test.out 2>&1
eval_tap $? 353 'TestAdyenConfig' test.out

#- 354 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "eJ4qy4PIKleuV271", "privateKey": "bwZ4niLSzQnv0C00", "publicKey": "dtNGGzbGYSYo9fY2", "returnUrl": "EBZAHQXc4Xcae7VK"}' \
    > test.out 2>&1
eval_tap $? 354 'TestAliPayConfig' test.out

#- 355 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "l0ARzGEArlfE1NSm", "secretKey": "tcADoZvd0La7P4JI"}' \
    > test.out 2>&1
eval_tap $? 355 'TestCheckoutConfig' test.out

#- 356 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region '4H7uDzkOHTdnUtdr' \
    > test.out 2>&1
eval_tap $? 356 'DebugMatchedPaymentMerchantConfig' test.out

#- 357 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "Rcs3GeOsKPNlG7rE", "webhookSecretKey": "Xi6LEqJERpbxEq07"}' \
    > test.out 2>&1
eval_tap $? 357 'TestNeonPayConfig' test.out

#- 358 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "txnvZZeAf7QBuZK5", "clientSecret": "GJlBncg8tQnJOKHC", "returnUrl": "16xjJZ4kiU3N8556", "webHookId": "ll2LQWpdESOBV7wZ"}' \
    > test.out 2>&1
eval_tap $? 358 'TestPayPalConfig' test.out

#- 359 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["Jsg7wSv9lyRyTdYB", "UljvBzvYNEtfgBFi", "kt18cQ677SotDEtU"], "publishableKey": "2xBSEQ8rBKc2K6oJ", "secretKey": "XxVEfnaqX8NuZtRU", "webhookSecret": "TKUvR69PImy6Ccwl"}' \
    > test.out 2>&1
eval_tap $? 359 'TestStripeConfig' test.out

#- 360 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "qJ4MO3L8x1H5OgzH", "key": "ypgsSeKCvtPz7jag", "mchid": "BG9a1TZ87ltClc3R", "returnUrl": "DXF5055tUlenimjI"}' \
    > test.out 2>&1
eval_tap $? 360 'TestWxPayConfig' test.out

#- 361 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "bm0riCaNp8dUBDin", "flowCompletionUrl": "AB6HqIWIi5Bvb1rc", "merchantId": 43, "projectId": 84, "projectSecretKey": "EtWAF763kci7lT62"}' \
    > test.out 2>&1
eval_tap $? 361 'TestXsollaConfig' test.out

#- 362 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id 'BOHaso53W3U2Mu9Z' \
    > test.out 2>&1
eval_tap $? 362 'GetPaymentMerchantConfig1' test.out

#- 363 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'GMWou1U0RVCf3gMW' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["DAodCKqfqzeexHA7", "0NgJTxjtzgO7W3ta", "RvJ6lKWJwHO65aOF"], "apiKey": "Dwpqy7XOU3DwglyM", "authoriseAsCapture": false, "blockedPaymentMethods": ["ll4O8ELahcNJqRje", "pck1l0qxRyQ2pi7x", "uAufJakIPXOQznHZ"], "clientKey": "Tj8oYfWObyNJKVSQ", "dropInSettings": "saCokoGynp6xcqNK", "liveEndpointUrlPrefix": "JnAhrSt96OaARAjH", "merchantAccount": "LGV3sNxS8uLBZiVR", "notificationHmacKey": "YIyQLcslTEqgVNG8", "notificationPassword": "AqktgvjwNJAwIpEy", "notificationUsername": "2ZNpojZ24I2n25sm", "returnUrl": "srmJFHGiYnyhbqxL", "settings": "uTZIxgiUaiyy0aWr"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAdyenConfig' test.out

#- 364 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'shpmb1C9Al7eWrbN' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAdyenConfigById' test.out

#- 365 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id 'RE0xyYPUZHyLGQ52' \
    --sandbox  \
    --validate  \
    --body '{"appId": "IjGpRJCUJpscOTkW", "privateKey": "ETSJ04c5MGInO4yz", "publicKey": "nh2YpZvvmziSSiSp", "returnUrl": "XeWOGayfRkQvoN06"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateAliPayConfig' test.out

#- 366 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'SpNOnuSksfm7hcIF' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestAliPayConfigById' test.out

#- 367 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id 'dkdrwAcK2lUda9h9' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "FgvfhiLEAkA7n651", "secretKey": "6ydoRT1qZBrdTnGr"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateCheckoutConfig' test.out

#- 368 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'wHeWoQXPFWFaKbDg' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestCheckoutConfigById' test.out

#- 369 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'rGkv8SVwLyS4VbHJ' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "vD0lL7aZUY9d1Idu", "webhookSecretKey": "d8bjYeBVMr7zHYmR"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdateNeonPayConfig' test.out

#- 370 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'E4X36KUOdfEmoIYw' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestNeonPayConfigById' test.out

#- 371 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'SxxAsfwDMivWqHHG' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "lnAnEu6EKYceTEqY", "clientSecret": "udHlA4AxeEIfUxJ2", "returnUrl": "xMSNNBxCeN3pGn46", "webHookId": "fGvodt413MRdG8qA"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdatePayPalConfig' test.out

#- 372 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id 'PiANv2Ar8yXV6qf6' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestPayPalConfigById' test.out

#- 373 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'v5SgcJPZPUh2nHQw' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["pWi8HZ6C0VJ0fK2m", "6lQ5Ao8TITYiHSR2", "SEJh1YDedZdNqkXP"], "publishableKey": "WZfT8ZfdKp9q4nXu", "secretKey": "K0tJAYror2XdtSCG", "webhookSecret": "7ZExOoIpWzacOvwU"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateStripeConfig' test.out

#- 374 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'snIbQM3ZAtyEWKWo' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 374 'TestStripeConfigById' test.out

#- 375 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'ZRUL7wS3HaMTXAX6' \
    --validate  \
    --body '{"appId": "y0STTN2sBEijjjpv", "key": "SzGkED0oweFYDBPy", "mchid": "d1jJBxbrbuFay9PX", "returnUrl": "gEQS4871QSmsspn5"}' \
    > test.out 2>&1
eval_tap $? 375 'UpdateWxPayConfig' test.out

#- 376 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'sNfifK65tvaH9jwc' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 376 'UpdateWxPayConfigCert' test.out

#- 377 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'O48pthyYpBJDHIIx' \
    > test.out 2>&1
eval_tap $? 377 'TestWxPayConfigById' test.out

#- 378 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'TIGI5EssYllIqjJz' \
    --validate  \
    --body '{"apiKey": "uQ8GglVgxjOGQGlH", "flowCompletionUrl": "m8VTN56tJKwD8O07", "merchantId": 77, "projectId": 80, "projectSecretKey": "9GG1uenDihceaLdg"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaConfig' test.out

#- 379 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'PZI0fKW8LeQxItaK' \
    > test.out 2>&1
eval_tap $? 379 'TestXsollaConfigById' test.out

#- 380 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id '6s3Hha69MgxjGJx6' \
    --body '{"device": "MOBILE", "showCloseButton": false, "size": "MEDIUM", "theme": "DARK"}' \
    > test.out 2>&1
eval_tap $? 380 'UpdateXsollaUIConfig' test.out

#- 381 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '26' \
    --namespace "$AB_NAMESPACE" \
    --offset '11' \
    --region 'KGNEmFPcUALNziO9' \
    > test.out 2>&1
eval_tap $? 381 'QueryPaymentProviderConfig' test.out

#- 382 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "STRIPE", "namespace": "ZDy5Pmbu7RrD9a5m", "region": "dlXTCL467xHbAiD3", "sandboxTaxJarApiToken": "Pr3mXZO1PnbSlfVR", "specials": ["NEONPAY", "WALLET", "WALLET"], "taxJarApiToken": "3GYO94ZOo94gS5DH", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 382 'CreatePaymentProviderConfig' test.out

#- 383 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetAggregatePaymentProviders' test.out

#- 384 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Qtd4bcivHGIEplRp' \
    > test.out 2>&1
eval_tap $? 384 'DebugMatchedPaymentProviderConfig' test.out

#- 385 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 385 'GetSpecialPaymentProviders' test.out

#- 386 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'cHDWcIoJ45L0Ze3Y' \
    --body '{"aggregate": "ADYEN", "namespace": "R3qcbHLGplYsS3js", "region": "RZffCd00VrgPuNtO", "sandboxTaxJarApiToken": "v3jbhGBuW8KcyPMf", "specials": ["WXPAY", "XSOLLA", "WXPAY"], "taxJarApiToken": "r7O15jqeKssQpme6", "taxJarEnabled": false, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 386 'UpdatePaymentProviderConfig' test.out

#- 387 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id 'yM48tE7eJRsXNeve' \
    > test.out 2>&1
eval_tap $? 387 'DeletePaymentProviderConfig' test.out

#- 388 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 388 'GetPaymentTaxConfig' test.out

#- 389 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "QXqnFRYmEIX40XOU", "taxJarApiToken": "oLOa7oDz00gxcoaH", "taxJarEnabled": true, "taxJarProductCodesMapping": {"FP8RmOstZAGDgiVs": "V2OttwJaMxPDIJ5h", "FQHumFvPKqupHj72": "TlLs964iABOgTKtn", "aA7O35Iaytd9CsAM": "TZC37xPXxnfggnZ3"}}' \
    > test.out 2>&1
eval_tap $? 389 'UpdatePaymentTaxConfig' test.out

#- 390 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'EZp6wSAufwYirs9l' \
    --end 'wvPKd925u3fFLV0Y' \
    --start 'eMrVaYSTRYGFzgLZ' \
    > test.out 2>&1
eval_tap $? 390 'SyncPaymentOrders' test.out

#- 391 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language '7gEypQf2Pn9A4gcb' \
    --storeId 'DJ0LmdnOPkIT1C6K' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetRootCategories' test.out

#- 392 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'GTpA7JZ6xullPROS' \
    --storeId 'fiW9zcxmgNfTHu3v' \
    > test.out 2>&1
eval_tap $? 392 'DownloadCategories' test.out

#- 393 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'kZt9FgWckjNpHhM2' \
    --namespace "$AB_NAMESPACE" \
    --language 'ZXp4N0ROmUCTrS7G' \
    --storeId 'i9Iigk9vamO7Q2WQ' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetCategory' test.out

#- 394 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'wSWqSs05rjISy4B0' \
    --namespace "$AB_NAMESPACE" \
    --language 'X9AJdkT7UYCV8agv' \
    --storeId 'wOI2LlOQNRN132Rd' \
    > test.out 2>&1
eval_tap $? 394 'PublicGetChildCategories' test.out

#- 395 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath 'gwMXv9olKpRyWQim' \
    --namespace "$AB_NAMESPACE" \
    --language '3qlART9mPPmYUvlk' \
    --storeId 'BGPJFaFzkABC8zWM' \
    > test.out 2>&1
eval_tap $? 395 'PublicGetDescendantCategories' test.out

#- 396 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'REAL' \
    > test.out 2>&1
eval_tap $? 396 'PublicListCurrencies' test.out

#- 397 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 397 'GeDLCDurableRewardShortMap' test.out

#- 398 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 398 'GetAppleConfigVersion' test.out

#- 399 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'STEAM' \
    > test.out 2>&1
eval_tap $? 399 'GetIAPItemMapping' test.out

#- 400 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'W5iRrw32FRg8y4rO' \
    --region 'uj7J6ijJbcycXmBc' \
    --storeId 'rJLb7labyotifVk9' \
    --appId 'KyqceGv0CEDTVSjI' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemByAppId' test.out

#- 401 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'eKLowG7UQB9pXzuC' \
    --categoryPath 'K5qd2m8A5axixm9X' \
    --features '9TXNhN8y1PVriIyv' \
    --includeSubCategoryItem  \
    --itemType 'BUNDLE' \
    --language 'kjuiAGiXx47etMik' \
    --limit '78' \
    --offset '55' \
    --region 'FggYDc2FMbzZoeKa' \
    --sortBy 'displayOrder:desc,createdAt,name:asc' \
    --storeId 'Kf2Yifzvr9OqTsIn' \
    --tags 'GzHFpFXYJtHtqwoI' \
    > test.out 2>&1
eval_tap $? 401 'PublicQueryItems' test.out

#- 402 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'wQBeIALI8JNIII4j' \
    --region 'rzrPsuMziNM8AB7R' \
    --storeId 'RxiZH3ngnitURdMj' \
    --sku 'ZLYCaeklQcFY1QIk' \
    > test.out 2>&1
eval_tap $? 402 'PublicGetItemBySku' test.out

#- 403 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region '1h5EKvMGd6hQ2mHj' \
    --storeId 'mLu4oFlReHy0JyZv' \
    --itemIds '7honqeiGTTqpgVsY' \
    > test.out 2>&1
eval_tap $? 403 'PublicGetEstimatedPrice' test.out

#- 404 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '1kPNdJiJXB3yjNUP' \
    --region 'IfvoXRO0CkW1ZcgU' \
    --storeId 'SbbnffBWRaJN1SjC' \
    --itemIds 'FLDNJfAhJGwSYEZj' \
    > test.out 2>&1
eval_tap $? 404 'PublicBulkGetItems' test.out

#- 405 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["Eb0Pv35fEk9s11bF", "Xkf7rQJ4Kj7Qyo9t", "UptiyZzRX8Y4rxRW"]}' \
    > test.out 2>&1
eval_tap $? 405 'PublicValidateItemPurchaseCondition' test.out

#- 406 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'COINS' \
    --limit '86' \
    --offset '9' \
    --region 'T3ujvV7W6ADLtn7o' \
    --storeId 'Inn1Bz3wM3BI51et' \
    --keyword 'n17OcmSVHZ6wtPVA' \
    --language 'wgvxYxXJTduZp1nN' \
    > test.out 2>&1
eval_tap $? 406 'PublicSearchItems' test.out

#- 407 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'YHREmm1cBuaRaGeM' \
    --namespace "$AB_NAMESPACE" \
    --language '8yxRfejqSbVgLd1F' \
    --region 'oyNFGpu5r2K0IvVg' \
    --storeId '5LwUygH98dzTL8az' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetApp' test.out

#- 408 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'KCCNBZpwRFNYxx2d' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 408 'PublicGetItemDynamicData' test.out

#- 409 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'r6DDuDHXcfvXPXJU' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'RX3XwhOlgcpcOIxq' \
    --populateBundle  \
    --region 'CMSpZxby2J9vGOUe' \
    --storeId 'SeGb02vDPUpv5VEd' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetItem' test.out

#- 410 GetPaymentCustomization
eval_tap 0 410 'GetPaymentCustomization # SKIP deprecated' test.out

#- 411 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "IG82dpIbfxVFfdvK", "successUrl": "QVgPQw3MVXe4xBPD"}, "paymentOrderNo": "WHRHCCVDBRjPUQWY", "paymentProvider": "WALLET", "returnUrl": "F1VsikD3IphQQiRc", "ui": "OtsthUwgQzNHUZ0l", "zipCode": "1FRfOjJUmCbi2llk"}' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetPaymentUrl' test.out

#- 412 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sf6GA8vTt92kldCo' \
    > test.out 2>&1
eval_tap $? 412 'PublicGetPaymentMethods' test.out

#- 413 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'yRdiOikUdqGocLYB' \
    > test.out 2>&1
eval_tap $? 413 'PublicGetUnpaidPaymentOrder' test.out

#- 414 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'aRC7T5qSl7WN3ncP' \
    --paymentProvider 'CHECKOUT' \
    --zipCode 'p7375rhOmR4zFjoJ' \
    --body '{"token": "ZVKZjOD2ePKAKYjJ"}' \
    > test.out 2>&1
eval_tap $? 414 'Pay' test.out

#- 415 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'MVnYj2yKqavWpyde' \
    > test.out 2>&1
eval_tap $? 415 'PublicCheckPaymentOrderPaidStatus' test.out

#- 416 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'NEONPAY' \
    --region 'Vfa8govttlpFAq8o' \
    > test.out 2>&1
eval_tap $? 416 'GetPaymentPublicConfig' test.out

#- 417 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'ebnS4Y2zkGYTr9yJ' \
    > test.out 2>&1
eval_tap $? 417 'PublicGetQRCode' test.out

#- 418 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'IveX52r6Inl9VTJB' \
    --foreinginvoice '9Al3mn2DsHDHzSVJ' \
    --invoiceId 'zhU5Z44zgZ1fieLd' \
    --payload 'l3Y82DOj5kPuNRZZ' \
    --redirectResult 'aUccuBYep9n7b17f' \
    --resultCode 'sblalJrwQiU3DD0x' \
    --sessionId 'ZFH1fHFLSr0O4rEZ' \
    --status 'TbFDj2L2McvCrrR7' \
    --token 'h9uKLXDaRf3pxKtJ' \
    --type 'bRY5luCwKrt6wn3y' \
    --userId 'VrRCh6j7rpv8K8fB' \
    --orderNo 'AeRa1R6ksxLYGkOL' \
    --paymentOrderNo 'gReff5IHxLJIemNH' \
    --paymentProvider 'ADYEN' \
    --returnUrl '2oXDZ20Bw2H4tz6K' \
    > test.out 2>&1
eval_tap $? 418 'PublicNormalizePaymentReturnUrl' test.out

#- 419 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'UC4jXGj2G0GZ3JBY' \
    --paymentOrderNo 'i9bBKBRpdbLCiwxO' \
    --paymentProvider 'WALLET' \
    > test.out 2>&1
eval_tap $? 419 'GetPaymentTaxValue' test.out

#- 420 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'TpfyAIoF7qsANBbE' \
    > test.out 2>&1
eval_tap $? 420 'GetRewardByCode' test.out

#- 421 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'KQrgocpjGNenRlDO' \
    --limit '90' \
    --offset '98' \
    --sortBy 'rewardCode:desc,rewardCode:asc,namespace:desc' \
    > test.out 2>&1
eval_tap $? 421 'QueryRewards1' test.out

#- 422 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'h3i7j095rDL6lEuB' \
    > test.out 2>&1
eval_tap $? 422 'GetReward1' test.out

#- 423 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 423 'PublicListStores' test.out

#- 424 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds '1ZIMIs1dFvYokH9t,2u8ZZnyHKkk6Gh25,tEcX9GegDnrYz0GF' \
    --itemIds 'pSVdxFsXAp1rocly,XllFitPamSKRzDIZ,gSk6suS90ZbDdmjU' \
    --skus '11QIZtkSn8QRbA5V,4gjWv1W6cqnvSuKs,wQ7vH8GScnP5QzRB' \
    > test.out 2>&1
eval_tap $? 424 'PublicExistsAnyMyActiveEntitlement' test.out

#- 425 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'Y1UrefgmVFBVz4KR' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 426 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'ebsw7EjkMnJSziEA' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 427 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'APP' \
    --sku '3WqIMJdrqHIsJ98W' \
    > test.out 2>&1
eval_tap $? 427 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 428 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'RjqYieXRthQZvzRi,7pqpajYEHs9TIkcn,rJ64BOKqywS6DKNS' \
    --itemIds 'eb2UMWOgVeYkCvqq,0tO15pEVG7sNihxp,uuL7DJCxvzZnh8oB' \
    --skus 'Ak1MNCAUmdnLaVRU,u5VbjwPa9rYgHaxe,TT3ebuaYPNBp9wA4' \
    > test.out 2>&1
eval_tap $? 428 'PublicGetEntitlementOwnershipToken' test.out

#- 429 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "LxO2n7WJQFzBCD9S", "language": "nel-xxpl-tQ", "region": "cpV0NtCxDDz5rxt6"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncTwitchDropsEntitlement' test.out

#- 430 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'LflBJjokLAaL4oAF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 430 'PublicGetMyWallet' test.out

#- 431 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '2lqx8yneWKrOy4xc' \
    --body '{"epicGamesJwtToken": "g30BqC5W7g7hiwum"}' \
    > test.out 2>&1
eval_tap $? 431 'SyncEpicGameDLC' test.out

#- 432 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'JTI3jlZPjoCdGiIP' \
    > test.out 2>&1
eval_tap $? 432 'SyncOculusDLC' test.out

#- 433 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '6cB3Pj63MJXIuLWY' \
    --body '{"serviceLabel": 2}' \
    > test.out 2>&1
eval_tap $? 433 'PublicSyncPsnDlcInventory' test.out

#- 434 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'JPGObyWCLyFPHaxk' \
    --body '{"serviceLabels": [48, 75, 93]}' \
    > test.out 2>&1
eval_tap $? 434 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 435 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '4fRbawD5yOvjgOop' \
    --body '{"appId": "QfbXmtF0WFH7F2In", "steamId": "hxtynUjuBCxkb2oF"}' \
    > test.out 2>&1
eval_tap $? 435 'SyncSteamDLC' test.out

#- 436 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId '99xI1VVtVrVT6Hn8' \
    --body '{"xstsToken": "B2d1hZUnoQwg5uqg"}' \
    > test.out 2>&1
eval_tap $? 436 'SyncXboxDLC' test.out

#- 437 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'oHaFyoczck0qJsgZ' \
    --appType 'DLC' \
    --entitlementClazz 'APP' \
    --entitlementName 'uILkeRUafUDP5b6B' \
    --features 'Wfm7cYCpDIJG42IL,hUoCh8lmKKocC5Ea,29JhfFGN964J8WOg' \
    --itemId 'sAj2Rmf1DXvAIkzT,RNRVyeEGu1ICOCmL,AmcaEFBKgy92LYqt' \
    --limit '87' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlements' test.out

#- 438 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'cDN7OMCehk42acy8' \
    --appId 'wsWaPyppR3ztPSAL' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserAppEntitlementByAppId' test.out

#- 439 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'A8LlV2sccbVr6HSi' \
    --limit '53' \
    --offset '97' \
    --appType 'DEMO' \
    > test.out 2>&1
eval_tap $? 439 'PublicQueryUserEntitlementsByAppType' test.out

#- 440 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'zrG4EdKn8eypTzI4' \
    --availablePlatformOnly  \
    --ids '97DG0ZNoJvvi4Ys5,0iE7IjZoDzMmMgoM,xZZ9AutWDfVOINhq' \
    > test.out 2>&1
eval_tap $? 440 'PublicGetUserEntitlementsByIds' test.out

#- 441 PublicGetUserEntitlementByItemId
eval_tap 0 441 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 442 PublicGetUserEntitlementBySku
eval_tap 0 442 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 443 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'l9CdDX4xiHpdfKH3' \
    --endDate '5RWUUVEHCB5wzF6o' \
    --entitlementClazz 'MEDIA' \
    --limit '71' \
    --offset '70' \
    --startDate 'TvGQtzwjGtGTr238' \
    > test.out 2>&1
eval_tap $? 443 'PublicUserEntitlementHistory' test.out

#- 444 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8Aevk3k14782W2o' \
    --appIds 'No3X4m6wms9SPaHl,qtDPry2vMON7sdhl,ilfpDT8o2iFrYtGf' \
    --itemIds 'CZCcrvsV2I4X26p2,1iDBZGJ8ZMLwPJ87,1nV5ALS7cneNLItU' \
    --skus 'Jgh74tyxkTR8ZCVJ,tkxjBJrNeQRsqkkK,K2qxqzy4KSA5UtSX' \
    > test.out 2>&1
eval_tap $? 444 'PublicExistsAnyUserActiveEntitlement' test.out

#- 445 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'WjANSWIT9TLnuMLN' \
    --appId 'JAEk3A6A6rYiIu8e' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 446 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'LdWykhBxLFnKnSYC' \
    --entitlementClazz 'LOOTBOX' \
    --itemId 'yyBYepIqtrikdAbd' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 447 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'OT6iSRdEg8NYuc4q' \
    --ids '5sJVzaKGDOULJbjH,phqjHGGAhfWaXqkA,5fuVYOsMFo9tnqa4' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 448 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'LEWGg1r4nW4pBcPP' \
    --entitlementClazz 'APP' \
    --sku 'QI99hMc4NbiJWP5r' \
    > test.out 2>&1
eval_tap $? 448 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 449 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId '9EwbIGMGJ70P9IqA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yNlZ2OwFSebBkXka' \
    > test.out 2>&1
eval_tap $? 449 'PublicGetUserEntitlement' test.out

#- 450 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'xtY97TMJH8bO4GDH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T6ZaUUkvlTKAhrxq' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["pkV7cAICgWFJZGnN", "a5yOM68r4W1fDZL8", "0oPQ0s7QhC8hgSgy"], "requestId": "tNEojK3YgWH9l7rv", "useCount": 69}' \
    > test.out 2>&1
eval_tap $? 450 'PublicConsumeUserEntitlement' test.out

#- 451 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'XUSINd4keCeiw7P2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PtUrPawQPaHARrhj' \
    --body '{"requestId": "bEU5n0PNuFyKW95d", "useCount": 73}' \
    > test.out 2>&1
eval_tap $? 451 'PublicSellUserEntitlement' test.out

#- 452 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'ofq7nlF5Ch8J2Qs9' \
    --namespace "$AB_NAMESPACE" \
    --userId '90APOU4hcdwlnsTa' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 88}' \
    > test.out 2>&1
eval_tap $? 452 'PublicSplitUserEntitlement' test.out

#- 453 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId 'TN5ctYX1sZnYF3hW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mCCIrP0lJXexseo2' \
    --body '{"entitlementId": "e6BCNJTTRIHDKdVf", "metadata": {"operationSource": "INVENTORY"}, "useCount": 37}' \
    > test.out 2>&1
eval_tap $? 453 'PublicTransferUserEntitlement' test.out

#- 454 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '14yZH00n8MsRjaB8' \
    --body '{"code": "iurBWW5jSJi0seeG", "language": "ZjWQ", "region": "t8EQXsMbYi1yEI9y"}' \
    > test.out 2>&1
eval_tap $? 454 'PublicRedeemCode' test.out

#- 455 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'chtyhjZSeDCKT4il' \
    --body '{"excludeOldTransactions": true, "language": "wAw_nust", "productId": "vO0OSsJmhOJDUyya", "receiptData": "g9jBDJFJGOEiWJ8c", "region": "LrryS5a6A4tL8YKM", "transactionId": "rUBL6dDTVwPIt1hr"}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillAppleIAPItem' test.out

#- 456 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'g2mhbI0NDshb7ZzQ' \
    --body '{"epicGamesJwtToken": "uBPyNi1GhZHEj6p5"}' \
    > test.out 2>&1
eval_tap $? 456 'SyncEpicGamesInventory' test.out

#- 457 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'grjk5wzdksOUku8d' \
    --body '{"autoAck": true, "autoConsume": false, "language": "NOPj-SWNn_vg", "orderId": "V5SMZ8GUvWZvoCmp", "packageName": "rkv7A8MRutCKCsqm", "productId": "x2zriOGB8b5qTFp3", "purchaseTime": 4, "purchaseToken": "XhXLRU5prAdqnnPO", "region": "iTVzAeQq6rnWJoTp", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 457 'PublicFulfillGoogleIAPItem' test.out

#- 458 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'R9Rz3HVP2Y9WqSRi' \
    > test.out 2>&1
eval_tap $? 458 'SyncOculusConsumableEntitlements' test.out

#- 459 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'wV3UZg0UJLPMkeUw' \
    --body '{"currencyCode": "a6OVKxCMxuf0P9r5", "price": 0.0909560280966839, "productId": "6fdmyi4kQnOFbBtv", "serviceLabel": 57}' \
    > test.out 2>&1
eval_tap $? 459 'PublicReconcilePlayStationStore' test.out

#- 460 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'YuAmqhftIfe2zdqZ' \
    --body '{"currencyCode": "7ht1vUiJ7jBXy8ps", "price": 0.6310199135910141, "productId": "oHNalwgvju62rPFM", "serviceLabels": [19, 3, 63]}' \
    > test.out 2>&1
eval_tap $? 460 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 461 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'mqOyQ7ammFgHprdM' \
    --body '{"appId": "9viFWmezrQOWH03z", "currencyCode": "yr7kRbC31YMJfRiD", "language": "DW-pX", "price": 0.5130084903229291, "productId": "BDA3gvCRfoBijpbM", "region": "blGWnp94a6GKY0Br", "steamId": "HiWs0B0RhxQtgVgb"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamInventory' test.out

#- 462 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'N8kr872hJvrOCdAE' \
    > test.out 2>&1
eval_tap $? 462 'SyncSteamAbnormalTransaction' test.out

#- 463 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z2RHt3uQ5nFrPXwx' \
    --body '{"orderId": "JZQpkeDHr0hjKBpD"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncSteamIAPByTransaction' test.out

#- 464 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'PLAYSTATION' \
    --userId 'IvK4qfQ0pQIcYMBk' \
    --activeOnly  \
    --groupId 'tqqAAF6YG1dD1vEC' \
    --limit '57' \
    --offset '51' \
    --productId 'b01VFFhO5FcdTvID' \
    > test.out 2>&1
eval_tap $? 464 'PublicQueryUserThirdPartySubscription' test.out

#- 465 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QI2uIi2SNZKqlJZs' \
    --body '{"gameId": "dnY04DIyosprZPBa", "language": "Usn", "region": "HPluvsry8AKSZxOh"}' \
    > test.out 2>&1
eval_tap $? 465 'SyncTwitchDropsEntitlement1' test.out

#- 466 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'Uhl3Y0EshaG0uDiJ' \
    --body '{"currencyCode": "NUuxK22saWaGvrzB", "price": 0.05720870614139861, "productId": "LvFUBZDnVrcwbsD0", "xstsToken": "RDLxWgEWwoHpV8E1"}' \
    > test.out 2>&1
eval_tap $? 466 'SyncXboxInventory' test.out

#- 467 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'xQZLa7Kw77UpCxNy' \
    --discounted  \
    --itemId 'x1jjdxNePPAJ6Z9U' \
    --limit '53' \
    --offset '34' \
    --status 'DELETED' \
    > test.out 2>&1
eval_tap $? 467 'PublicQueryUserOrders' test.out

#- 468 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'IhZZiK0QEG6C9w4l' \
    --body '{"currencyCode": "VRNOF1Bg6OHZzvdZ", "discountCodes": ["xGwgnSiZtChE0uof", "77AAPI5tdPeFz9pG", "HoIm4tKNhPjNIQGF"], "discountedPrice": 89, "ext": {"sLNEGrfy9qHKufJf": {}, "k0MeG3qYJr6PuCVK": {}, "9WmDAdpLVTVsj9pD": {}}, "itemId": "iyybXY4v7JRFMRae", "language": "EAqr-yqJL", "price": 21, "quantity": 11, "region": "xeotrNakKGvOSvpm", "returnUrl": "ZZdlNXdx2kWmSqod", "sectionId": "NZgfQyDVVkkqiMiR"}' \
    > test.out 2>&1
eval_tap $? 468 'PublicCreateUserOrder' test.out

#- 469 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'f2yCyM0Tp5GJHHbs' \
    --body '{"currencyCode": "LJ73mCPhhmUyIwgQ", "discountCodes": ["S9kVFUbeTeB9KgnF", "ZQ9lVMNyCiytnfMo", "O1I3KISTbn4yEa2A"], "discountedPrice": 0, "itemId": "q79Du28SRRAMaQFE", "price": 52, "quantity": 33}' \
    > test.out 2>&1
eval_tap $? 469 'PublicPreviewOrderPrice' test.out

#- 470 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'ppeticckSUon7awf' \
    --userId 'ol07696uxp5ieMjj' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrder' test.out

#- 471 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'OfFSx3AJN97kUjwi' \
    --userId 'CmWQvbrxQpUSnos6' \
    > test.out 2>&1
eval_tap $? 471 'PublicCancelUserOrder' test.out

#- 472 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'QiHyrcGeRv27hj73' \
    --userId 'EtufHuNIp0GXpM4n' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetUserOrderHistories' test.out

#- 473 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'bG7aww2TANW1Or7T' \
    --userId 'vLoL0wwHoRMNexBO' \
    > test.out 2>&1
eval_tap $? 473 'PublicDownloadUserOrderReceipt' test.out

#- 474 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'ron8wIdUbp7xVMKf' \
    > test.out 2>&1
eval_tap $? 474 'PublicGetPaymentAccounts' test.out

#- 475 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'bAJfW4iMIC52NUed' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'WGxxfnMIDSCPr1m1' \
    > test.out 2>&1
eval_tap $? 475 'PublicDeletePaymentAccount' test.out

#- 476 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fg6tc250c2okDTem' \
    --autoCalcEstimatedPrice  \
    --language '6o62xFY6TNqoLFFS' \
    --region '4wB6Um7ir0n6O3vb' \
    --storeId 'YVjrcErgoApAxyDn' \
    --viewId 'HjAx7rZTvew0WVDS' \
    > test.out 2>&1
eval_tap $? 476 'PublicListActiveSections' test.out

#- 477 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNr23LV7xZEEv7O1' \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId '9uxoV5Oe8ktlePEo' \
    --limit '49' \
    --offset '80' \
    --sku 'BuRSv6VizgtOXZy9' \
    --status 'ACTIVE' \
    --subscribedBy 'PLATFORM' \
    > test.out 2>&1
eval_tap $? 477 'PublicQueryUserSubscriptions' test.out

#- 478 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q6B074dTJZqeOllK' \
    --body '{"currencyCode": "QNwJUGtC0tAhxn1a", "itemId": "y6ruu7PYWHODRb6s", "language": "ep_882", "region": "nQCAWidWPjYgyebU", "returnUrl": "6rHFirnUpZ9UJ4N7", "source": "8qHTGdn7gE4bwLzD"}' \
    > test.out 2>&1
eval_tap $? 478 'PublicSubscribeSubscription' test.out

#- 479 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ew2PYt8x9SSaOZcE' \
    --itemId 'vG6KZh954BmtuIFl' \
    > test.out 2>&1
eval_tap $? 479 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 480 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lfSUnaUhC4x11AS2' \
    --userId 'jTKoTYeHaCuN7zpX' \
    > test.out 2>&1
eval_tap $? 480 'PublicGetUserSubscription' test.out

#- 481 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9vp4QJdCrwkz0nw2' \
    --userId 'oxKye8jZqj7k0YiL' \
    > test.out 2>&1
eval_tap $? 481 'PublicChangeSubscriptionBillingAccount' test.out

#- 482 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'qOUSBuwR388REDRu' \
    --userId 'YBnWiEsOnDfIAN04' \
    --body '{"immediate": false, "reason": "9ix16vo60jgvwV3C"}' \
    > test.out 2>&1
eval_tap $? 482 'PublicCancelSubscription' test.out

#- 483 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '9hJ1kSZonK02WHGV' \
    --userId 'KDcKulj3Pdegy4G6' \
    --excludeFree  \
    --limit '76' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetUserSubscriptionBillingHistories' test.out

#- 484 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'Opak8CYp6DPdukc0' \
    --language '4j6rbfBuKBco1AeO' \
    --storeId '3yvvBLZPBuekeBe4' \
    > test.out 2>&1
eval_tap $? 484 'PublicListViews' test.out

#- 485 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'Tvb3fHCIJZkwEcCR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i2U7s2ZQAarwH0c8' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetWallet' test.out

#- 486 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode '7v0PwZjydyzGDZM4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zTTYI6O8coYDWUfc' \
    --limit '77' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 486 'PublicListUserWalletTransactions' test.out

#- 487 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 487 'PublicGetMyDLCContent' test.out

#- 488 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'Xgvu496H02yOVN1h' \
    --limit '17' \
    --offset '19' \
    --startTime '7sGELnMdXRqdGPzx' \
    --state 'REVOKED' \
    --transactionId 'vtNcWtpUkw98x3tM' \
    --userId 'M1bFFDIqKD8HJ4X0' \
    > test.out 2>&1
eval_tap $? 488 'QueryFulfillments' test.out

#- 489 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate 'hD3nL1saQxLYrz08' \
    --baseAppId 'jh6Tyq7WUilXgtf5' \
    --categoryPath 'UctyV3aSw4twReM5' \
    --features 'DcHde3fkHf7tH8WT' \
    --includeSubCategoryItem  \
    --itemName 'OTeBOcYhf6nGCnPj' \
    --itemStatus 'ACTIVE' \
    --itemType 'OPTIONBOX,APP,CODE' \
    --limit '72' \
    --offset '88' \
    --region 'ifs0arKxCcNv8FQC' \
    --sectionExclusive  \
    --sortBy 'displayOrder:asc,updatedAt,createdAt:desc' \
    --storeId 'w5bO8Vh4JaKYAsoM' \
    --tags 'lLJGMl5xFgLj4mCS' \
    --targetNamespace 'hMFlbrRGjoBQ45Za' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 489 'QueryItemsV2' test.out

#- 490 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '4JR4S3iac6vLeoIU' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 490 'ImportStore1' test.out

#- 491 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LJlWXmQFlef1tSHJ' \
    --body '{"itemIds": ["f6sVpwAAKKqmTy0Z", "SyJ7IIUXlBlZMQeS", "nOg5gf1SwrbpmoF4"]}' \
    > test.out 2>&1
eval_tap $? 491 'ExportStore1' test.out

#- 492 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DvNA1wo9IAxV5C71' \
    --body '{"entitlementCollectionId": "gTw8BJPFctwUMCRd", "entitlementOrigin": "Playstation", "metadata": {"uOJekbO0sk7o1z37": {}, "uuqLDQF12kYfBqeQ": {}, "xos58kVk7F1KKOfF": {}}, "origin": "System", "rewards": [{"currency": {"currencyCode": "FzplXVk36IpbGquP", "namespace": "nIPwR1BinZ4ULwAK"}, "item": {"itemId": "O8n42UuxEyfzZJsZ", "itemName": "d9sB6CV9KiWkbdpG", "itemSku": "qWQIPK6mVytM5mBR", "itemType": "T39gKYLk9DmjJh6P"}, "quantity": 28, "type": "ITEM"}, {"currency": {"currencyCode": "pTXWAUt8lgqNM4po", "namespace": "GEvIKCe3MrLxmnjm"}, "item": {"itemId": "lAuaBCdhzXb6cBMP", "itemName": "NMmjMi2uztFNfXg0", "itemSku": "UvwaZ0py16ShGomF", "itemType": "zUappaaODZaZ6Vzz"}, "quantity": 39, "type": "ITEM"}, {"currency": {"currencyCode": "nntoxwsNtNxWoH5w", "namespace": "VHJVaEnaycYsKkgX"}, "item": {"itemId": "0RMDxvlK9RnTEYv5", "itemName": "eDhCxwy85vlhWw1R", "itemSku": "CgHr3f6UqFGCvsMF", "itemType": "EFlXHBOK1RqtKYVO"}, "quantity": 2, "type": "CURRENCY"}], "source": "ORDER_REVOCATION", "transactionId": "6bPmSa85Riu1alaV"}' \
    > test.out 2>&1
eval_tap $? 492 'FulfillRewardsV2' test.out

#- 493 FulfillItems
eval_tap 0 493 'FulfillItems # SKIP deprecated' test.out

#- 494 RetryFulfillItems
eval_tap 0 494 'RetryFulfillItems # SKIP deprecated' test.out

#- 495 RevokeItems
eval_tap 0 495 'RevokeItems # SKIP deprecated' test.out

#- 496 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EhjJZbwMHkFWLSzm' \
    --body '{"transactionId": "AXAruYrVjX4HRTvm"}' \
    > test.out 2>&1
eval_tap $? 496 'V2PublicFulfillAppleIAPItem' test.out

#- 497 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '3Qr9IkuW6jjofc6i' \
    --userId 'tDEsq0dHfYG6k853' \
    --body '{"items": [{"duration": 67, "endDate": "1985-09-09T00:00:00Z", "entitlementCollectionId": "h2E3wFchP3zTymfV", "entitlementOrigin": "GooglePlay", "itemId": "FGGjJ0hRPUBFxM2F", "itemSku": "r3olO10RAyIZs2Vf", "language": "CRhzfKDAGIAJuPhQ", "metadata": {"cZwXRE9FOZUVTfDc": {}, "3w1tAXRrQtHkm0Tt": {}, "hcx9W7PkFNVa7czD": {}}, "orderNo": "4wybVjqOKrqYGxcB", "origin": "Playstation", "quantity": 10, "region": "ktWkJDaHg6kDVjxh", "source": "REDEEM_CODE", "startDate": "1984-12-22T00:00:00Z", "storeId": "dOfrtHWyGg5TU3IN"}, {"duration": 21, "endDate": "1978-11-15T00:00:00Z", "entitlementCollectionId": "ZFZex0eOw31PXkVn", "entitlementOrigin": "GooglePlay", "itemId": "5tfFQv384ri6A7z0", "itemSku": "hsW0IHIYvJ7PPgVa", "language": "FwGhl5zqkzEu41hV", "metadata": {"fVC7eLVWGk0GjYRe": {}, "IZaDC2Au2bEpymbJ": {}, "4dPJmkdvyuDHFFst": {}}, "orderNo": "LhZzletCqa3lJMQ1", "origin": "Oculus", "quantity": 97, "region": "GlfqjDBzOjNeq8JJ", "source": "EXPIRATION", "startDate": "1981-01-12T00:00:00Z", "storeId": "MOfDfoMgU2yFBTPf"}, {"duration": 27, "endDate": "1987-04-09T00:00:00Z", "entitlementCollectionId": "pFSCsrhSGeeExZYn", "entitlementOrigin": "System", "itemId": "ObsiHQgt7OfL6AcB", "itemSku": "PjUYURB3Rsrc0qvV", "language": "8Gq1cw3ytGWVKPoA", "metadata": {"1aKRZM1Ot0PWppB2": {}, "H0G8Xko9l5J0IOZm": {}, "npzwHhig9d6vdgfr": {}}, "orderNo": "NiGrH0hDjH6IYpfI", "origin": "Xbox", "quantity": 75, "region": "zNjk5V8T9pQjnGB8", "source": "REDEEM_CODE", "startDate": "1992-04-27T00:00:00Z", "storeId": "xL8674KYMeN2W2CN"}]}' \
    > test.out 2>&1
eval_tap $? 497 'FulfillItemsV3' test.out

#- 498 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'qmO8JALtCiDuGQQs' \
    --userId 'vWV3NSjXUXSMKY09' \
    > test.out 2>&1
eval_tap $? 498 'RetryFulfillItemsV3' test.out

#- 499 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'x4TKOwsyRNnaLNhw' \
    --userId '0xGnXc29UDQxeiBo' \
    > test.out 2>&1
eval_tap $? 499 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE