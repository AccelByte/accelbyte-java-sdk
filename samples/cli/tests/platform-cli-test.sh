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
echo "1..497"

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
    --body '{"enableInventoryCheck": true, "itemDeletionCheckConfig": ["CAMPAIGN", "DLC", "REWARD"]}' \
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

#- 57 GetDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform getDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetDLCItemConfig' test.out

#- 58 UpdateDLCItemConfig
./ng net.accelbyte.sdk.cli.Main platform updateDLCItemConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"id": "qdskdQV0TqI8EFnm", "rewards": [{"currency": {"currencyCode": "DbxIxi4YKlONk2Q5", "namespace": "Y4JvaizwiilatuUj"}, "item": {"itemId": "jt9lIMGql5ElEa9E", "itemName": "IIlGcHB3CfR3ncDl", "itemSku": "wi3v3MFFJ1KesKoE", "itemType": "LCpobBEG8X645xpd"}, "quantity": 39, "type": "CURRENCY"}, {"currency": {"currencyCode": "j3giPg4x4yiPX6ue", "namespace": "s1Hhhkg1yLVbLFzH"}, "item": {"itemId": "EP8cM4NTwr0KHaAs", "itemName": "mTej52WKi6tArAUR", "itemSku": "t9plCSVq8PdH6hJP", "itemType": "UAc0RVwXgAgntLMC"}, "quantity": 41, "type": "CURRENCY"}, {"currency": {"currencyCode": "aXBWQi6BqPg4xr0l", "namespace": "CancUZGCHsZYoLfR"}, "item": {"itemId": "1KtOv7Zy0b65uvuK", "itemName": "Nuy0ytZQ7M6Nzy1a", "itemSku": "dnSKOLFKx1dX4LuW", "itemType": "Ju3pDMUAeeZ97SBR"}, "quantity": 82, "type": "CURRENCY"}]}, {"id": "PYuG6XqP6oo7G73z", "rewards": [{"currency": {"currencyCode": "dxTgOfnwIdlNa29f", "namespace": "DLh741IslKHzGlLK"}, "item": {"itemId": "WUtDQs61OQAoxyyQ", "itemName": "pRWCiiPDGQhNPEwi", "itemSku": "JCf2XJVrlzqQls1o", "itemType": "zhLVA3kE8jKvgatO"}, "quantity": 62, "type": "ITEM"}, {"currency": {"currencyCode": "OXudXgNne8kJATwl", "namespace": "c6esUp6Sw1I98jeZ"}, "item": {"itemId": "Q7hfxnhLd3Knakno", "itemName": "ed9DHhLOqQGhCUr6", "itemSku": "iTrjyEgarAdNJOIG", "itemType": "36I6tRbRcrEveMdA"}, "quantity": 7, "type": "CURRENCY"}, {"currency": {"currencyCode": "iPKDUVSC00PYeDca", "namespace": "gginxnFIna3yddcb"}, "item": {"itemId": "sPheTH26IUJNvYuG", "itemName": "RUvpZaHCuESOiIZs", "itemSku": "MfB4ZH3mtgWgU4pC", "itemType": "AKxeE70CaunQNxot"}, "quantity": 79, "type": "ITEM"}]}, {"id": "9G4AvQkqsGnmyo5J", "rewards": [{"currency": {"currencyCode": "JTUVmb8GEXFTlEME", "namespace": "sFzYqwgK1Np5nodq"}, "item": {"itemId": "pLm7FhJBNXzAFdO0", "itemName": "Khqf6kiTdSGv2LFj", "itemSku": "AKY7CbgsWqFWZX7k", "itemType": "PBom8F9GLLTG8phc"}, "quantity": 43, "type": "CURRENCY"}, {"currency": {"currencyCode": "zFMbAG9YI89hmguB", "namespace": "8FOTjMLo4b9rIzqY"}, "item": {"itemId": "kEpstyVTBcrM8rG0", "itemName": "rH0zcswwVeMK6MbG", "itemSku": "IVIu8vvwLc7KY3uV", "itemType": "oJXTIMtpgkieDyF9"}, "quantity": 45, "type": "CURRENCY"}, {"currency": {"currencyCode": "tdxdbZUpd6FJtHJ1", "namespace": "pyVwyKQLY6FEO65R"}, "item": {"itemId": "b3z7CYLM8IlsHqff", "itemName": "nrfsGlfPaZKBwa3D", "itemSku": "db60ufPpzwj1QGIF", "itemType": "mlVf4jvapseE9LN9"}, "quantity": 3, "type": "ITEM"}]}]}' \
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
    --body '{"data": [{"platform": "EPICGAMES", "platformDlcIdMap": {"rGysryod3dNQrmsA": "pRA6HX3RwrKt2eco", "zL0TOg54vCE48L5o": "LF6M4lNa4JUMSHNg", "qRqCV7usamANkZlO": "X9Sfo95HgXqKhTPk"}}, {"platform": "PSN", "platformDlcIdMap": {"kLOsp0LZ5njN86Hl": "8kUXzt6bSc6bWvgp", "VyW9dD1kOmvrAejc": "q2LgkQuaS7RBx3vi", "m02jBOxrZDyvpcLY": "OWA8NjxOnaEok4nO"}}, {"platform": "PSN", "platformDlcIdMap": {"CzfsflhjbngJOUn1": "8G5MlfDTk8aG40Nl", "ncceIZSwgAIkgzh4": "pTU0Am4DZhl0bQxF", "J3sWCqQpQ2FbKPFM": "ycMSQ4qfAacR0LgB"}}]}' \
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
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'GBeMfPlNos4yBRjr' \
    --itemId 'ERHEonAZR8GmEu0q,1p6QCyY6vSkVFWds,bYuVEGVxYheR3j5m' \
    --limit '82' \
    --offset '86' \
    --origin 'Other' \
    --userId '87pna08gxefTYKhu' \
    > test.out 2>&1
eval_tap $? 63 'QueryEntitlements1' test.out

#- 64 QueryEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryEntitlements \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemIds 'xaEc7M4P7UckSC6e,PeN8i4GrFES9z7xu,eHpATHccee9GXhKc' \
    --limit '19' \
    --offset '27' \
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
    --body '{"entitlementGrantList": [{"collectionId": "mSEwdrkEnnqKzFsL", "endDate": "1973-01-02T00:00:00Z", "grantedCode": "hbN15zfQSfQrtfF3", "itemId": "TQN0OcNDLr36vzoh", "itemNamespace": "ZyjMQAg5mPYhrLTy", "language": "ppIW", "metadata": {"fY9JQYGF4bYXEcEN": {}, "x9xZlAchob44lOND": {}, "DwMvgI0HlyPR7wZN": {}}, "origin": "IOS", "quantity": 51, "region": "VsF6xG2mXEQdbzIV", "source": "REDEEM_CODE", "startDate": "1971-08-31T00:00:00Z", "storeId": "alncV7vWgSHdfo07"}, {"collectionId": "UctPErqxyMyOK06M", "endDate": "1979-09-07T00:00:00Z", "grantedCode": "QBErxgjVBycvU4Pb", "itemId": "mRDcrg0DjQjBECXv", "itemNamespace": "ea7H1m2lJFRZ3Zpr", "language": "Eawo_HuZi", "metadata": {"noowmlTIKVowi0RY": {}, "2VN4ZONJREdUQ3z9": {}, "F1BxNNgnke4akncw": {}}, "origin": "IOS", "quantity": 46, "region": "cHp6B8Vj7rXFgDnD", "source": "IAP", "startDate": "1973-01-26T00:00:00Z", "storeId": "LzYEvwSWTaLQjctv"}, {"collectionId": "rK2jhsYpKPlXn77A", "endDate": "1981-10-26T00:00:00Z", "grantedCode": "YoFzLAATPY8P8P3c", "itemId": "foivvQxevecWw7Rr", "itemNamespace": "y0KK5rgAGO0dW8rX", "language": "oW_tIwh", "metadata": {"cLkt4pK32sJxlZcC": {}, "TpTdRtCHvuk6B6XT": {}, "mSLyn50sigBVZxiK": {}}, "origin": "Epic", "quantity": 97, "region": "x2PyYDo5R3hLiD5s", "source": "GIFT", "startDate": "1988-12-27T00:00:00Z", "storeId": "y1JsxJNGmyt0SQDU"}], "userIds": ["07XIZRZ7tZdIs0xf", "Wc9x1aMjgGim51T1", "DoWBZVGLlkUetzCA"]}' \
    > test.out 2>&1
eval_tap $? 67 'GrantEntitlements' test.out

#- 68 RevokeEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeEntitlements \
    --namespace "$AB_NAMESPACE" \
    --body '["4czdt7zqmSKxOEQl", "Vcx6GqsBq8vdhWVn", "uYLgpZehK0G2nmyu"]' \
    > test.out 2>&1
eval_tap $? 68 'RevokeEntitlements' test.out

#- 69 GetEntitlement
./ng net.accelbyte.sdk.cli.Main platform getEntitlement \
    --entitlementId 'ViB9kRTcSQdTnNYG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'GetEntitlement' test.out

#- 70 QueryFulfillmentHistories
./ng net.accelbyte.sdk.cli.Main platform queryFulfillmentHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '71' \
    --status 'SUCCESS' \
    --userId '9FmYel0kOw72o8Zk' \
    > test.out 2>&1
eval_tap $? 70 'QueryFulfillmentHistories' test.out

#- 71 QueryIAPClawbackHistory
./ng net.accelbyte.sdk.cli.Main platform queryIAPClawbackHistory \
    --namespace "$AB_NAMESPACE" \
    --endTime 'gk0jS6rDWUwfhKvr' \
    --eventType 'CHARGEBACK' \
    --externalOrderId '6LlxHv8SwyagYvDJ' \
    --limit '21' \
    --offset '47' \
    --startTime 'NnTn3rzH5NvAtcvN' \
    --status 'FAIL' \
    --userId 'IPSE1XXPzySa0sZo' \
    > test.out 2>&1
eval_tap $? 71 'QueryIAPClawbackHistory' test.out

#- 72 MockPlayStationStreamEvent
./ng net.accelbyte.sdk.cli.Main platform mockPlayStationStreamEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"body": {"account": "FS6xCOWMpyh9pMsQ", "additionalData": {"entitlement": [{"clientTransaction": [{"amountConsumed": 14, "clientTransactionId": "wyEw6hIWDZrpP7rz"}, {"amountConsumed": 50, "clientTransactionId": "ISW510kHr4isTKWj"}, {"amountConsumed": 25, "clientTransactionId": "uC2m38kXrDZWlGVE"}], "entitlementId": "9sJ4NpUtKp6M9I6n", "usageCount": 62}, {"clientTransaction": [{"amountConsumed": 8, "clientTransactionId": "wnZhsjwJeGwaPSDM"}, {"amountConsumed": 94, "clientTransactionId": "z95OYKiqaZD63xe5"}, {"amountConsumed": 36, "clientTransactionId": "qSMzpqIFGLkDs7AC"}], "entitlementId": "C1RgBfoNrHlFi2qJ", "usageCount": 77}, {"clientTransaction": [{"amountConsumed": 38, "clientTransactionId": "gmBLE35YhyiDV90S"}, {"amountConsumed": 10, "clientTransactionId": "I3kfabxJWWSI1ECU"}, {"amountConsumed": 30, "clientTransactionId": "yx9fbT63ShEh8PbG"}], "entitlementId": "ikLjgjcj34uulU6F", "usageCount": 47}], "purpose": "BZsWFbr3RSP0W9nB"}, "originalTitleName": "hvhf8Q0DtJMcYQdN", "paymentProductSKU": "66bswAgt65X4N1LQ", "purchaseDate": "ZmB61JMdtwCVUrYQ", "sourceOrderItemId": "ue84dwmbwFEnAZaW", "titleName": "sQJtRYoagRJK5PX9"}, "eventDomain": "UcOvhPyE11TRT2SK", "eventSource": "seoe8VLie0LBa36K", "eventType": "Nzjf005CXNGehQ2a", "eventVersion": 93, "id": "jjYgXchCbkXX26uE", "timestamp": "dCfQaMAQuTKfC0I2"}' \
    > test.out 2>&1
eval_tap $? 72 'MockPlayStationStreamEvent' test.out

#- 73 MockXblClawbackEvent
./ng net.accelbyte.sdk.cli.Main platform mockXblClawbackEvent \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"eventDate": "kNjCMDtDMrentgn3", "eventState": "DhqciwIeShF9RKb9", "lineItemId": "vvxuJlhXbWhbwPwT", "orderId": "oC6knjVwVnzaqSfJ", "productId": "iQFC2gXoda0kg16y", "productType": "USpSOAjHJWwfCjYw", "purchasedDate": "WkLob9gKLqs2nEZh", "sandboxId": "pByfHZinxNfgPAwk", "skuId": "MBsznlBUqnLT4AbG", "subscriptionData": {"consumedDurationInDays": 31, "dateTime": "Az0vJjFIYWOaNdsi", "durationInDays": 24, "recurrenceId": "fZ6rvgvEY3Hht1Sw"}}, "datacontenttype": "qTsKKKo37NHDOQe9", "id": "1Ps3ztUIV0dS6hIH", "source": "9c4VfkyrwpuXxbaE", "specVersion": "RbfgPmi0eHkt1mr9", "subject": "EOIFg0dnWIYN2NVL", "time": "70Iw157g00jr9b8M", "traceparent": "uYmmeKTmBNvGYxEQ", "type": "df3ewoGGoY7xmFNA"}' \
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
    --body '{"appAppleId": 25, "bundleId": "ltDxsbzxrlaKEfko", "issuerId": "YjY2o6ouRW9UtNqu", "keyId": "wC3WgumrIz4NhGzt", "password": "Zpr4U4fwQIiLXgmR", "version": "V1"}' \
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
    --body '{"sandboxId": "n2xaOBdPF0JmX8qw"}' \
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
    --body '{"applicationName": "U1cTuHHPB5S3DvPR", "notificationTokenAudience": "CzBrVUxmDOj3cvRF", "notificationTokenEmail": "aTC11W0TGTCm4fZW", "packageName": "uk6pQxDQpKqxLGeM", "serviceAccountId": "vr9TsvcMQ7dBsaIe"}' \
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
    --body '{"data": [{"itemIdentity": "cRxIsZvD6rmzVr5X", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"xw0v1dMQ9Rrbk6C2": "cVWf6ttvbU1PO6Ap", "CD2VXidT7w0Oc15N": "8WXBPp17PAewqSm5", "x3B4t7WQnp8jXZed": "gt5cyNe27HLtwtVO"}}, {"itemIdentity": "axgP6Jbct8puMybY", "itemIdentityType": "ITEM_SKU", "platformProductIdMap": {"BxjWOozGoDtsUuYo": "5p8ED5QZAufwNa8l", "zfjv9oYMXMjlVHY1": "AHwF3vGoav7MK0Pc", "LnEkcokKwcQ0baDT": "9OyJ2h23GUS2amU7"}}, {"itemIdentity": "syGlElXdEAOrVSnL", "itemIdentityType": "ITEM_ID", "platformProductIdMap": {"ade41s3rH34mB2yP": "lRpWjmHZAAvKTH8M", "uqIg0CzkguwuJCW7": "EEFB67AODbi9Bzup", "BsFpYc77GtRUcCFe": "Y5g4XgBsbfzqxBPN"}}]}' \
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
    --body '{"appId": "e8ae1Il4aAtEbu4I", "appSecret": "jGdqthRxTjQ7gkZE"}' \
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
    --body '{"backOfficeServerClientId": "Y8rG0q0Q2Qd2JzRb", "backOfficeServerClientSecret": "kF2I03dIjvBbA6bf", "enableStreamJob": false, "environment": "mQr17W65br34rBBN", "streamName": "9tU6TDm5GloFSKWM", "streamPartnerName": "1eym5ydC6p25xCWT"}' \
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
    --body '{"backOfficeServerClientId": "qUOYZENJ1QHZQxPR", "backOfficeServerClientSecret": "XH7uxBJEECQE1li3", "enableStreamJob": true, "environment": "bwwm5iGzXtcknrgi", "streamName": "dKupvXO6aj4hCmTC", "streamPartnerName": "34jxW4pIDwdqXpmR"}' \
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
    --body '{"appId": "mut9H9XyWI8bp8fQ", "env": "SANDBOX", "publisherAuthenticationKey": "338HS6CBgVRyihYN", "syncMode": "INVENTORY"}' \
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
    --body '{"clientId": "4CVhziXV8HwSmvcv", "clientSecret": "cDKF19yVRafCjOuS", "organizationId": "Yht83AdvBaagTiRJ"}' \
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
    --body '{"enableClawback": false, "entraAppClientId": "lzpiX0VuFpZum7iz", "entraAppClientSecret": "xe7NPzjOa8E7wY76", "entraTenantId": "PxLv9HBEUe89AwEw", "relyingPartyCert": "1HO4FnKtx4XLKAml"}' \
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
    --password 'Dr19uJ3nq6VerzVC' \
    > test.out 2>&1
eval_tap $? 105 'UpdateXblBPCertFile' test.out

#- 106 QueryThirdPartyNotifications
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartyNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'cI8y3Cz0YqCKUh5R' \
    --externalId 'D9vNAp4jinFpnQ5x' \
    --limit '64' \
    --offset '11' \
    --source 'STEAM' \
    --startDate 'wwbvMZyeDeRnVfPU' \
    --status 'ERROR' \
    --type 'i4tPAGfleyCA6jEt' \
    > test.out 2>&1
eval_tap $? 106 'QueryThirdPartyNotifications' test.out

#- 107 QueryAbnormalTransactions
./ng net.accelbyte.sdk.cli.Main platform queryAbnormalTransactions \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '12' \
    --orderId 'qsnzoVILjkwW61du' \
    --steamId 'F87aUyrdt4XSpWBA' \
    > test.out 2>&1
eval_tap $? 107 'QueryAbnormalTransactions' test.out

#- 108 AdminGetSteamJobInfo
./ng net.accelbyte.sdk.cli.Main platform adminGetSteamJobInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 108 'AdminGetSteamJobInfo' test.out

#- 109 AdminResetSteamJobTime
./ng net.accelbyte.sdk.cli.Main platform adminResetSteamJobTime \
    --namespace "$AB_NAMESPACE" \
    --body '{"env": "LIVE", "lastTime": "1989-06-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 109 'AdminResetSteamJobTime' test.out

#- 110 AdminRefundIAPOrder
./ng net.accelbyte.sdk.cli.Main platform adminRefundIAPOrder \
    --iapOrderNo 'yOVgvnWbfRJtsB7c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 110 'AdminRefundIAPOrder' test.out

#- 111 QuerySteamReportHistories
./ng net.accelbyte.sdk.cli.Main platform querySteamReportHistories \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '88' \
    --orderId 'CYPwaiBAxfYL8Avt' \
    --processStatus 'PROCESSED' \
    --steamId '0ZUT2fSk3LL0calq' \
    > test.out 2>&1
eval_tap $? 111 'QuerySteamReportHistories' test.out

#- 112 QueryThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --groupId 'xEewuGS469k2hG0W' \
    --limit '76' \
    --offset '67' \
    --platform 'STADIA' \
    --productId '71utjsQ4CrRb9gUC' \
    --userId 'eVz7fWbZIdhevfZv' \
    > test.out 2>&1
eval_tap $? 112 'QueryThirdPartySubscription' test.out

#- 113 GetIAPOrderConsumeDetails
./ng net.accelbyte.sdk.cli.Main platform getIAPOrderConsumeDetails \
    --iapOrderNo 'yV7AcodcZwKjYDdm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 113 'GetIAPOrderConsumeDetails' test.out

#- 114 DownloadInvoiceDetails
./ng net.accelbyte.sdk.cli.Main platform downloadInvoiceDetails \
    --namespace "$AB_NAMESPACE" \
    --endTime 'JOlzwm9Su4FnS98Q' \
    --feature 'qftSjq7sn8yreciP' \
    --itemId 'LfkVyyJsbGpO6Jge' \
    --itemType 'BUNDLE' \
    --startTime '4nGmWGgTJfHlJl4t' \
    > test.out 2>&1
eval_tap $? 114 'DownloadInvoiceDetails' test.out

#- 115 GenerateInvoiceSummary
./ng net.accelbyte.sdk.cli.Main platform generateInvoiceSummary \
    --namespace "$AB_NAMESPACE" \
    --endTime 'HGa4XfZcd9CVnGqM' \
    --feature 'X9FieeEssWEUl07b' \
    --itemId 'hwntCVqiYOJf5KwM' \
    --itemType 'OPTIONBOX' \
    --startTime 'QjzvjSozv6CTRDl0' \
    > test.out 2>&1
eval_tap $? 115 'GenerateInvoiceSummary' test.out

#- 116 SyncInGameItem
./ng net.accelbyte.sdk.cli.Main platform syncInGameItem \
    --namespace "$AB_NAMESPACE" \
    --storeId 'zp9CzHFwinkBNi4g' \
    --body '{"categoryPath": "vqgl6TZ9TGVPmv34", "targetItemId": "h6T7EsufmfxKYB4L", "targetNamespace": "M6H6QXmpZ9X3fUSR"}' \
    > test.out 2>&1
eval_tap $? 116 'SyncInGameItem' test.out

#- 117 CreateItem
./ng net.accelbyte.sdk.cli.Main platform createItem \
    --namespace "$AB_NAMESPACE" \
    --storeId '1l9xLPBsmAUrD9L1' \
    --body '{"appId": "IiD6MlcEPhMDFzjH", "appType": "DEMO", "baseAppId": "3sIhzOx2CXKlvIom", "boothName": "U3pIxM9n8D2eLMe3", "categoryPath": "lt9qfx2UDcgVE7L9", "clazz": "FK6e0MrPc4vtxk9h", "displayOrder": 98, "entitlementType": "DURABLE", "ext": {"KlG56HlzGr7XjdyR": {}, "JunZPkp6ccIBnWyP": {}, "w8mj7gyQ7XdIszGR": {}}, "features": ["0qHJCWEfOJpZm9yE", "YWNGMy2pgSGSUOK6", "j46COPipH1MWVTHG"], "flexible": false, "images": [{"as": "oxZEDxGiBnNbn0za", "caption": "f7CaOSlHXrUSA6sM", "height": 74, "imageUrl": "M2IwEsdOGBXBwnzD", "smallImageUrl": "X8v3xgC1Ge9PdbTT", "width": 54}, {"as": "i2RAMEX5RMjBFVZG", "caption": "YzQqV8d9mDdUIoiI", "height": 72, "imageUrl": "fXqjr8fS79En3wYo", "smallImageUrl": "wBdkaZ3y6i38XQjL", "width": 60}, {"as": "xP8xj1LyEirURERn", "caption": "EMzpImW6sjAHyCK5", "height": 41, "imageUrl": "rcyR0x3YiHF8ITGP", "smallImageUrl": "RQBCgIs1Q2lzxl0y", "width": 66}], "inventoryConfig": {"customAttributes": {"2IhErkNhNcECWwch": {}, "W6zL9SkbLlrNXnGa": {}, "nMazb8jvRWenURH4": {}}, "serverCustomAttributes": {"8aJuALEcSqcE15u6": {}, "D31DjOsrs3CUYATd": {}, "qnQGbqiqOkNeATj7": {}}, "slotUsed": 8}, "itemIds": ["HMkjzyBB4UFKiaoV", "0VOem2yqPsMFxKyb", "PkbuS6x9cLJ1APnN"], "itemQty": {"lsa2bRBr27fVMWuA": 11, "ReteIMgzISomCsod": 73, "VQXXOmqFHLbyXmgC": 81}, "itemType": "CODE", "listable": true, "localizations": {"XH8uenbC5CphgMwe": {"description": "exsIAP5vHLjBJ9iq", "localExt": {"McBL4BzhDUjhKPwb": {}, "wcvQU5kG8bXGFmPA": {}, "nOkDiJq4xQye7Hqn": {}}, "longDescription": "VK3YVeOWs9mfVQh3", "title": "jLBtn9pxpE7BYtzB"}, "0B4CxyQrUpIFvORx": {"description": "Ti79DpSjb39ukcR6", "localExt": {"c2E2r3vk3IfAKEbq": {}, "cNXSGCCvNowNmdpc": {}, "JgF88ySNq4Mj7mul": {}}, "longDescription": "P4tQ6R1OqKVOTniB", "title": "gLsNhdgQ0JWZjNRS"}, "zOTqcVNX3ahvxw9g": {"description": "wwhTnjN6wKZGW4y3", "localExt": {"f0R9s2kndhhZhwAi": {}, "LsZs4pmLDIQch4Ij": {}, "Dq9aT3qZyI0rYsWu": {}}, "longDescription": "cAkXsVJbXi7eRZa7", "title": "WwIc895ImqK6tVsa"}}, "lootBoxConfig": {"rewardCount": 95, "rewards": [{"lootBoxItems": [{"count": 34, "duration": 96, "endDate": "1999-05-28T00:00:00Z", "itemId": "pH16NUsVY21NVIs7", "itemSku": "NRen2Y3Ns0QJQeaW", "itemType": "ytPfds1BYx0EaURy"}, {"count": 8, "duration": 11, "endDate": "1973-09-22T00:00:00Z", "itemId": "ZyyZeHAWGgJUbUJR", "itemSku": "MbkcTglbU86FyOjA", "itemType": "pNHBVfNOURcjY3YY"}, {"count": 93, "duration": 50, "endDate": "1978-11-04T00:00:00Z", "itemId": "ynmfIuBWgJTNFfM8", "itemSku": "M0IW4oe8KDgy0xZf", "itemType": "AcNg14Ws8TIP1LKi"}], "name": "FQoLDvumfqrgSfnx", "odds": 0.8809947218913662, "type": "PROBABILITY_GROUP", "weight": 94}, {"lootBoxItems": [{"count": 59, "duration": 4, "endDate": "1996-11-19T00:00:00Z", "itemId": "9dN1MGRXBJ6mVV7J", "itemSku": "S9qjNLwvI8JdiY3R", "itemType": "RiLilmOGF6dLLIeI"}, {"count": 98, "duration": 39, "endDate": "1988-03-13T00:00:00Z", "itemId": "GlyZVQ4X67tPZSTp", "itemSku": "Pq3xjrElvvDgw0ag", "itemType": "7kSWE0Hiqm5IuLry"}, {"count": 17, "duration": 39, "endDate": "1986-07-07T00:00:00Z", "itemId": "XqvUWDjU1G0EVjVZ", "itemSku": "w1ToLuPakQN1MpOs", "itemType": "1RVFrcg2CXxepx78"}], "name": "fvsyhE2BKtyTDSIM", "odds": 0.9593426993405512, "type": "PROBABILITY_GROUP", "weight": 31}, {"lootBoxItems": [{"count": 21, "duration": 29, "endDate": "1977-05-24T00:00:00Z", "itemId": "vZ7Cmsh4US8o4jfM", "itemSku": "ANPpmZDdMiCxmuCC", "itemType": "VuFjS1GC1d2b92B4"}, {"count": 43, "duration": 27, "endDate": "1986-02-20T00:00:00Z", "itemId": "BTxaTIz0jcgDI8Pk", "itemSku": "z96vd80msqIm5buf", "itemType": "nBqrpLeqhwVhjnnj"}, {"count": 75, "duration": 46, "endDate": "1990-09-04T00:00:00Z", "itemId": "iXfLcxDC9Ynd02mE", "itemSku": "CIQhfIhHtADUQ9zi", "itemType": "mQTQT95pFJUAJsyA"}], "name": "feKOufV4f15NohXu", "odds": 0.9446473835499823, "type": "PROBABILITY_GROUP", "weight": 96}], "rollFunction": "DEFAULT"}, "maxCount": 9, "maxCountPerUser": 48, "name": "2znsqPzPkwCBo2Sw", "optionBoxConfig": {"boxItems": [{"count": 59, "duration": 59, "endDate": "1994-06-01T00:00:00Z", "itemId": "0ih2EQfY3XCv4hdO", "itemSku": "a6FdZhNMd1onFjGR", "itemType": "bxtABPXDmgNEJBhg"}, {"count": 67, "duration": 77, "endDate": "1979-08-02T00:00:00Z", "itemId": "GIDhNC66szbCCf73", "itemSku": "IFbRkPSSITz4TjCr", "itemType": "JHXGXku2YVuOzhxH"}, {"count": 26, "duration": 12, "endDate": "1977-05-25T00:00:00Z", "itemId": "shuLUk5WdpxjZx5n", "itemSku": "oXPhPUTKbonoucNm", "itemType": "zwOZOK56sDkci5rZ"}]}, "purchasable": true, "recurring": {"cycle": "QUARTERLY", "fixedFreeDays": 75, "fixedTrialCycles": 79, "graceDays": 72}, "regionData": {"lOuksQJCiRFiZWwJ": [{"currencyCode": "7NrTb1XTB9YQzUJ9", "currencyNamespace": "XlYJ8BzP6EUmUXGM", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1996-04-19T00:00:00Z", "discountPercentage": 70, "discountPurchaseAt": "1988-03-29T00:00:00Z", "expireAt": "1982-04-29T00:00:00Z", "price": 50, "purchaseAt": "1988-03-17T00:00:00Z", "trialPrice": 7}, {"currencyCode": "9lhbvuQdW2jwKUck", "currencyNamespace": "c794ryY91lX8DD4M", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1976-08-13T00:00:00Z", "discountPercentage": 35, "discountPurchaseAt": "1975-10-21T00:00:00Z", "expireAt": "1985-04-23T00:00:00Z", "price": 9, "purchaseAt": "1977-08-22T00:00:00Z", "trialPrice": 68}, {"currencyCode": "5weXJl7PeiMH8z8d", "currencyNamespace": "Vej8N2yv6VTnOK7x", "currencyType": "VIRTUAL", "discountAmount": 35, "discountExpireAt": "1982-02-08T00:00:00Z", "discountPercentage": 79, "discountPurchaseAt": "1983-01-15T00:00:00Z", "expireAt": "1981-01-09T00:00:00Z", "price": 43, "purchaseAt": "1988-10-30T00:00:00Z", "trialPrice": 7}], "81lsR7xxSVp3Gd2T": [{"currencyCode": "K0HzYviTgYmx82JV", "currencyNamespace": "BRLPZ6Iz8tne5dbg", "currencyType": "VIRTUAL", "discountAmount": 55, "discountExpireAt": "1980-09-16T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1974-09-29T00:00:00Z", "expireAt": "1996-05-27T00:00:00Z", "price": 2, "purchaseAt": "1982-03-16T00:00:00Z", "trialPrice": 44}, {"currencyCode": "E2opXtdsJQeJ1too", "currencyNamespace": "0qvxphTLEEBGTtZy", "currencyType": "REAL", "discountAmount": 63, "discountExpireAt": "1972-10-29T00:00:00Z", "discountPercentage": 16, "discountPurchaseAt": "1991-02-07T00:00:00Z", "expireAt": "1990-10-14T00:00:00Z", "price": 13, "purchaseAt": "1975-05-04T00:00:00Z", "trialPrice": 1}, {"currencyCode": "EEXBLIxGnNuhoJM3", "currencyNamespace": "WWPvvCiCf33ViEdq", "currencyType": "REAL", "discountAmount": 15, "discountExpireAt": "1978-07-09T00:00:00Z", "discountPercentage": 66, "discountPurchaseAt": "1994-03-24T00:00:00Z", "expireAt": "1995-11-02T00:00:00Z", "price": 100, "purchaseAt": "1996-11-19T00:00:00Z", "trialPrice": 77}], "izk5UcPAGv6c1ESC": [{"currencyCode": "6hZYTYZbzf5aANNN", "currencyNamespace": "s5kgSZZNUHbIT9sz", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1979-09-26T00:00:00Z", "discountPercentage": 24, "discountPurchaseAt": "1976-03-30T00:00:00Z", "expireAt": "1989-04-29T00:00:00Z", "price": 82, "purchaseAt": "1990-06-26T00:00:00Z", "trialPrice": 52}, {"currencyCode": "n1YXj5zFZeOCOR9N", "currencyNamespace": "vBQZSJPOIKrRBrYV", "currencyType": "VIRTUAL", "discountAmount": 0, "discountExpireAt": "1975-11-10T00:00:00Z", "discountPercentage": 42, "discountPurchaseAt": "1980-03-11T00:00:00Z", "expireAt": "1977-05-09T00:00:00Z", "price": 24, "purchaseAt": "1997-06-18T00:00:00Z", "trialPrice": 48}, {"currencyCode": "ozTt9TsH7A0TuU2a", "currencyNamespace": "L4bPkk11sys6GdkD", "currencyType": "REAL", "discountAmount": 43, "discountExpireAt": "1978-06-05T00:00:00Z", "discountPercentage": 5, "discountPurchaseAt": "1981-09-13T00:00:00Z", "expireAt": "1989-01-06T00:00:00Z", "price": 36, "purchaseAt": "1985-10-19T00:00:00Z", "trialPrice": 65}]}, "saleConfig": {"currencyCode": "fZ0jvA54CSqZFDsO", "price": 51}, "seasonType": "TIER", "sectionExclusive": false, "sellable": false, "sku": "RjOU1SMfQVQa6blj", "stackable": false, "status": "ACTIVE", "tags": ["dd85bdYUumPKVSZC", "g3XTc9vQe0dHJfF6", "KIuvnRCa9JktyBdx"], "targetCurrencyCode": "kZKrEWFw9GYxjiiO", "targetNamespace": "QAD77ci0vfWVZoRR", "thumbnailUrl": "MPi57HyKKz5nyI6u", "useCount": 24}' \
    > test.out 2>&1
eval_tap $? 117 'CreateItem' test.out

#- 118 GetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform getItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'yv6gFZXI5nXJ7hLi' \
    --appId '6HweweRmyo91dIn7' \
    > test.out 2>&1
eval_tap $? 118 'GetItemByAppId' test.out

#- 119 QueryItems
./ng net.accelbyte.sdk.cli.Main platform queryItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --availableDate 'qXBDXJcrqKmXDwoE' \
    --baseAppId 'V6tCdrxw1KOPhuvH' \
    --categoryPath 'uYrGWDK41uMOC0mR' \
    --features 'vSoaGk4ktF5wnJDg' \
    --includeSubCategoryItem  \
    --itemType 'COINS' \
    --limit '86' \
    --offset '100' \
    --region '3WXiydCOInVolsr6' \
    --sortBy 'updatedAt:asc,updatedAt:desc,createdAt' \
    --storeId 'jaGfsD1cfswmeFpv' \
    --tags 'tDtetoQVFL8LNW11' \
    --targetNamespace 'vtpaTxi7k489jRCn' \
    > test.out 2>&1
eval_tap $? 119 'QueryItems' test.out

#- 120 ListBasicItemsByFeatures
./ng net.accelbyte.sdk.cli.Main platform listBasicItemsByFeatures \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --features '48bvkCPfKofwXOIZ,ZQAJza84lKKmVOaT,S6xBbNrSUAW2ak7I' \
    > test.out 2>&1
eval_tap $? 120 'ListBasicItemsByFeatures' test.out

#- 121 GetItems
./ng net.accelbyte.sdk.cli.Main platform getItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SDrBVg6NuDZvPb1k' \
    --itemIds 'uUfNfUDe4g7q6PHE' \
    > test.out 2>&1
eval_tap $? 121 'GetItems' test.out

#- 122 GetItemBySku
./ng net.accelbyte.sdk.cli.Main platform getItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'aqbzHvDDl1jiLw3X' \
    --sku 'MGBA6JXDpA1tIC45' \
    > test.out 2>&1
eval_tap $? 122 'GetItemBySku' test.out

#- 123 GetLocaleItemBySku
./ng net.accelbyte.sdk.cli.Main platform getLocaleItemBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'C0oaGouFu4hXONgU' \
    --populateBundle  \
    --region 'wJnUpryDeRcpUvlr' \
    --storeId 'w2MwC1uuokpaIjL0' \
    --sku 'Vxe5n9Lx3QcFo9gx' \
    > test.out 2>&1
eval_tap $? 123 'GetLocaleItemBySku' test.out

#- 124 GetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform getEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --platform 'OgvDc7xMrRKvw8IS' \
    --region 'P2WKmCRRXBxlalCH' \
    --storeId 'tWlKxLpS8fLWoQ5n' \
    --itemIds 'uJhatQPxR7dvBVC5' \
    --userId 'zgOKLTDmHe8c1eJ9' \
    > test.out 2>&1
eval_tap $? 124 'GetEstimatedPrice' test.out

#- 125 GetItemIdBySku
./ng net.accelbyte.sdk.cli.Main platform getItemIdBySku \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'sde7Ryt4udIv22M1' \
    --sku '8uux9xBomQFPFWy5' \
    > test.out 2>&1
eval_tap $? 125 'GetItemIdBySku' test.out

#- 126 GetBulkItemIdBySkus
./ng net.accelbyte.sdk.cli.Main platform getBulkItemIdBySkus \
    --namespace "$AB_NAMESPACE" \
    --sku 'cwNPI6aFo0MVwDZC,IXFNEL3uWVRz3V7Y,bJM3bNLWHAbCZixe' \
    --storeId '2cQ6O30lpzcBQMAE' \
    > test.out 2>&1
eval_tap $? 126 'GetBulkItemIdBySkus' test.out

#- 127 BulkGetLocaleItems
./ng net.accelbyte.sdk.cli.Main platform bulkGetLocaleItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'cNcJqrKxnMzSYoc4' \
    --region 'ZjiMY4H34B6wVd8i' \
    --storeId 'pcKDwQeUWtjCC2UH' \
    --itemIds '6jzMO3AfmOS5mQNy' \
    > test.out 2>&1
eval_tap $? 127 'BulkGetLocaleItems' test.out

#- 128 GetAvailablePredicateTypes
./ng net.accelbyte.sdk.cli.Main platform getAvailablePredicateTypes \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 128 'GetAvailablePredicateTypes' test.out

#- 129 ValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform validateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --platform 'RPZFPNP56l1AT6OL' \
    --userId 'KmZhCZxxPPdPwOtE' \
    --body '{"itemIds": ["uWBSO2jJepUnEEgj", "a2mIE2kLTnJwc5Xm", "kCuL5W4tKt6G3j9L"]}' \
    > test.out 2>&1
eval_tap $? 129 'ValidateItemPurchaseCondition' test.out

#- 130 BulkUpdateRegionData
./ng net.accelbyte.sdk.cli.Main platform bulkUpdateRegionData \
    --namespace "$AB_NAMESPACE" \
    --storeId 'YdG7xVPqBqe9RDQM' \
    --body '{"changes": [{"itemIdentities": ["BSYAFLqp8PF5hCco", "ukWpnbz4ys7j6lxu", "U3u2HEG0qfKegvFT"], "itemIdentityType": "ITEM_SKU", "regionData": {"1yAB8Pa3uNGKhaLl": [{"currencyCode": "JzJMSnJIIgsAVmaG", "currencyNamespace": "YxUX1B9oVuzG2CnY", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1985-04-21T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1983-10-25T00:00:00Z", "discountedPrice": 14, "expireAt": "1999-02-20T00:00:00Z", "price": 93, "purchaseAt": "1974-09-14T00:00:00Z", "trialPrice": 40}, {"currencyCode": "Dh2kaZP7pnnVfxPw", "currencyNamespace": "c259HF9ejHaILQru", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1987-09-06T00:00:00Z", "discountPercentage": 50, "discountPurchaseAt": "1988-10-15T00:00:00Z", "discountedPrice": 41, "expireAt": "1990-09-21T00:00:00Z", "price": 42, "purchaseAt": "1979-11-11T00:00:00Z", "trialPrice": 45}, {"currencyCode": "ZLRxYlYqlpq03BGd", "currencyNamespace": "Ik4oEogFVGR71rJO", "currencyType": "VIRTUAL", "discountAmount": 17, "discountExpireAt": "1983-08-06T00:00:00Z", "discountPercentage": 23, "discountPurchaseAt": "1981-05-29T00:00:00Z", "discountedPrice": 87, "expireAt": "1975-04-09T00:00:00Z", "price": 55, "purchaseAt": "1988-10-28T00:00:00Z", "trialPrice": 46}], "GBjnHmaAu4YK87DY": [{"currencyCode": "AWWcbcbGWmKgE8CZ", "currencyNamespace": "4AELr5lraa5v5P5C", "currencyType": "REAL", "discountAmount": 72, "discountExpireAt": "1973-03-04T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1999-09-13T00:00:00Z", "discountedPrice": 53, "expireAt": "1980-03-06T00:00:00Z", "price": 34, "purchaseAt": "1982-10-02T00:00:00Z", "trialPrice": 75}, {"currencyCode": "C9h5JPiMEtgKuiGT", "currencyNamespace": "YgwWv5XldL6rOVGc", "currencyType": "REAL", "discountAmount": 55, "discountExpireAt": "1988-04-18T00:00:00Z", "discountPercentage": 93, "discountPurchaseAt": "1978-05-16T00:00:00Z", "discountedPrice": 35, "expireAt": "1993-01-08T00:00:00Z", "price": 55, "purchaseAt": "1984-12-17T00:00:00Z", "trialPrice": 56}, {"currencyCode": "Sxp4qTB54mKA3V9D", "currencyNamespace": "KlCeZ7mLYsHooOIa", "currencyType": "VIRTUAL", "discountAmount": 67, "discountExpireAt": "1988-12-07T00:00:00Z", "discountPercentage": 31, "discountPurchaseAt": "1979-01-11T00:00:00Z", "discountedPrice": 16, "expireAt": "1998-04-16T00:00:00Z", "price": 5, "purchaseAt": "1998-10-06T00:00:00Z", "trialPrice": 8}], "OJPS3lJ80YJ41U4o": [{"currencyCode": "oQ980ywmg1pWpWit", "currencyNamespace": "1QC7FKe0fnHUlmU1", "currencyType": "VIRTUAL", "discountAmount": 28, "discountExpireAt": "1989-09-19T00:00:00Z", "discountPercentage": 73, "discountPurchaseAt": "1989-07-27T00:00:00Z", "discountedPrice": 78, "expireAt": "1996-06-06T00:00:00Z", "price": 46, "purchaseAt": "1974-07-01T00:00:00Z", "trialPrice": 11}, {"currencyCode": "TX2bamSCvX1nwvSW", "currencyNamespace": "dDwD7WJHzgNZUKsI", "currencyType": "VIRTUAL", "discountAmount": 50, "discountExpireAt": "1981-10-28T00:00:00Z", "discountPercentage": 25, "discountPurchaseAt": "1985-12-23T00:00:00Z", "discountedPrice": 46, "expireAt": "1999-08-13T00:00:00Z", "price": 53, "purchaseAt": "1972-11-16T00:00:00Z", "trialPrice": 60}, {"currencyCode": "yTsftKqnsIJctAdx", "currencyNamespace": "yZVKHA9DkaSOWgtg", "currencyType": "REAL", "discountAmount": 51, "discountExpireAt": "1989-07-03T00:00:00Z", "discountPercentage": 81, "discountPurchaseAt": "1994-03-28T00:00:00Z", "discountedPrice": 24, "expireAt": "1988-09-03T00:00:00Z", "price": 33, "purchaseAt": "1971-10-19T00:00:00Z", "trialPrice": 97}]}}, {"itemIdentities": ["qzoKMRMG541PAiNj", "ULsx4SnKNXLMUaDS", "wwQlnNRZJHBSB4fZ"], "itemIdentityType": "ITEM_SKU", "regionData": {"EFIZs28Ff1kZp1Zk": [{"currencyCode": "tx3N7WNMYIfcDKbL", "currencyNamespace": "u8pnK34oA1keYXJv", "currencyType": "VIRTUAL", "discountAmount": 95, "discountExpireAt": "1974-08-08T00:00:00Z", "discountPercentage": 14, "discountPurchaseAt": "1987-08-26T00:00:00Z", "discountedPrice": 94, "expireAt": "1972-03-19T00:00:00Z", "price": 10, "purchaseAt": "1971-04-06T00:00:00Z", "trialPrice": 8}, {"currencyCode": "IlGJg9wdc8bihhWj", "currencyNamespace": "fZpfcFBUsnnDJlmD", "currencyType": "REAL", "discountAmount": 16, "discountExpireAt": "1988-09-08T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1993-03-24T00:00:00Z", "discountedPrice": 70, "expireAt": "1971-10-23T00:00:00Z", "price": 97, "purchaseAt": "1984-03-11T00:00:00Z", "trialPrice": 8}, {"currencyCode": "zCQh2iNTwtnohddM", "currencyNamespace": "zMTQ9P7sYLDWAJOA", "currencyType": "VIRTUAL", "discountAmount": 85, "discountExpireAt": "1989-08-03T00:00:00Z", "discountPercentage": 61, "discountPurchaseAt": "1985-10-16T00:00:00Z", "discountedPrice": 6, "expireAt": "1998-02-07T00:00:00Z", "price": 21, "purchaseAt": "1986-05-12T00:00:00Z", "trialPrice": 19}], "JoF2FI3vyyqRzc20": [{"currencyCode": "O7FdsJP1G9tyBTfE", "currencyNamespace": "RXdvgD1Qf7Ot2DkU", "currencyType": "VIRTUAL", "discountAmount": 42, "discountExpireAt": "1999-09-23T00:00:00Z", "discountPercentage": 51, "discountPurchaseAt": "1974-02-09T00:00:00Z", "discountedPrice": 47, "expireAt": "1982-04-17T00:00:00Z", "price": 56, "purchaseAt": "1972-12-24T00:00:00Z", "trialPrice": 44}, {"currencyCode": "ejmeZtzT0qj0ltsq", "currencyNamespace": "fiZrthVvyX0OCKDJ", "currencyType": "VIRTUAL", "discountAmount": 21, "discountExpireAt": "1999-10-21T00:00:00Z", "discountPercentage": 89, "discountPurchaseAt": "1997-11-11T00:00:00Z", "discountedPrice": 38, "expireAt": "1995-05-27T00:00:00Z", "price": 7, "purchaseAt": "1995-01-21T00:00:00Z", "trialPrice": 8}, {"currencyCode": "wSSgxCu8zru1DhGA", "currencyNamespace": "YOHR5BWa9VzIkaQE", "currencyType": "REAL", "discountAmount": 97, "discountExpireAt": "1998-02-21T00:00:00Z", "discountPercentage": 17, "discountPurchaseAt": "1982-02-03T00:00:00Z", "discountedPrice": 85, "expireAt": "1990-05-25T00:00:00Z", "price": 24, "purchaseAt": "1978-11-20T00:00:00Z", "trialPrice": 55}], "sY3SsTnDQY7kKU2u": [{"currencyCode": "06Q4veujxtyQENvJ", "currencyNamespace": "rBCqeg67d4RWOqO4", "currencyType": "REAL", "discountAmount": 2, "discountExpireAt": "1999-03-03T00:00:00Z", "discountPercentage": 11, "discountPurchaseAt": "1981-10-17T00:00:00Z", "discountedPrice": 81, "expireAt": "1988-12-17T00:00:00Z", "price": 50, "purchaseAt": "1990-09-14T00:00:00Z", "trialPrice": 51}, {"currencyCode": "Am3DQht4JwnPS2ur", "currencyNamespace": "JqerobWMZGVL5KLT", "currencyType": "VIRTUAL", "discountAmount": 34, "discountExpireAt": "1971-01-12T00:00:00Z", "discountPercentage": 15, "discountPurchaseAt": "1996-11-19T00:00:00Z", "discountedPrice": 23, "expireAt": "1975-07-04T00:00:00Z", "price": 6, "purchaseAt": "1971-08-19T00:00:00Z", "trialPrice": 49}, {"currencyCode": "aKSLCgOOPXM6XTUh", "currencyNamespace": "2dJ90yqHDNacl4F9", "currencyType": "REAL", "discountAmount": 87, "discountExpireAt": "1986-03-31T00:00:00Z", "discountPercentage": 64, "discountPurchaseAt": "1994-09-12T00:00:00Z", "discountedPrice": 68, "expireAt": "1982-08-15T00:00:00Z", "price": 58, "purchaseAt": "1996-03-11T00:00:00Z", "trialPrice": 69}]}}, {"itemIdentities": ["SEAzT7TOpyiuvvQU", "m29Iacq4XRLaA643", "nTMtXSAyejnny0Ju"], "itemIdentityType": "ITEM_ID", "regionData": {"3b6o5uB2XM6IHy7E": [{"currencyCode": "EvHyLmcvrZZOdwe1", "currencyNamespace": "x8RjU6Bi8JXE52sU", "currencyType": "VIRTUAL", "discountAmount": 44, "discountExpireAt": "1985-02-19T00:00:00Z", "discountPercentage": 34, "discountPurchaseAt": "1995-12-26T00:00:00Z", "discountedPrice": 89, "expireAt": "1975-07-10T00:00:00Z", "price": 25, "purchaseAt": "1997-12-14T00:00:00Z", "trialPrice": 88}, {"currencyCode": "N4UQ2fg3V1o2x0hL", "currencyNamespace": "5DuBDqMyIAzWze94", "currencyType": "VIRTUAL", "discountAmount": 97, "discountExpireAt": "1973-08-14T00:00:00Z", "discountPercentage": 74, "discountPurchaseAt": "1992-09-10T00:00:00Z", "discountedPrice": 55, "expireAt": "1972-07-25T00:00:00Z", "price": 35, "purchaseAt": "1999-08-06T00:00:00Z", "trialPrice": 73}, {"currencyCode": "XAupATO8uXsqVpdi", "currencyNamespace": "Wo8SjDAM0Riw8wLY", "currencyType": "REAL", "discountAmount": 27, "discountExpireAt": "1978-04-02T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1975-08-27T00:00:00Z", "discountedPrice": 77, "expireAt": "1987-08-27T00:00:00Z", "price": 87, "purchaseAt": "1998-09-04T00:00:00Z", "trialPrice": 100}], "DwBXw5uBYeQZOzAT": [{"currencyCode": "NSV9E9yyNb7yaLXz", "currencyNamespace": "AVYymOuhCkZu4htr", "currencyType": "VIRTUAL", "discountAmount": 11, "discountExpireAt": "1991-09-17T00:00:00Z", "discountPercentage": 9, "discountPurchaseAt": "1993-10-04T00:00:00Z", "discountedPrice": 72, "expireAt": "1987-10-11T00:00:00Z", "price": 90, "purchaseAt": "1974-05-01T00:00:00Z", "trialPrice": 65}, {"currencyCode": "vTGXaMsq8ePN1oco", "currencyNamespace": "2jx8Upe8SjMvpqM8", "currencyType": "REAL", "discountAmount": 46, "discountExpireAt": "1981-03-04T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1991-02-23T00:00:00Z", "discountedPrice": 56, "expireAt": "1991-09-06T00:00:00Z", "price": 22, "purchaseAt": "1972-09-28T00:00:00Z", "trialPrice": 17}, {"currencyCode": "47gD5i2Ni6AnWn3N", "currencyNamespace": "dEPhNHSH7eKDfRcn", "currencyType": "REAL", "discountAmount": 26, "discountExpireAt": "1986-06-16T00:00:00Z", "discountPercentage": 32, "discountPurchaseAt": "1971-07-15T00:00:00Z", "discountedPrice": 27, "expireAt": "1986-12-24T00:00:00Z", "price": 74, "purchaseAt": "1995-05-17T00:00:00Z", "trialPrice": 87}], "2qEAuJbpZSrcbc4L": [{"currencyCode": "WfKaY5c1tP5TDuI5", "currencyNamespace": "f6m4KC07CnsZe32h", "currencyType": "VIRTUAL", "discountAmount": 83, "discountExpireAt": "1986-09-13T00:00:00Z", "discountPercentage": 4, "discountPurchaseAt": "1985-06-12T00:00:00Z", "discountedPrice": 63, "expireAt": "1984-07-12T00:00:00Z", "price": 1, "purchaseAt": "1991-02-02T00:00:00Z", "trialPrice": 56}, {"currencyCode": "XZOYwbwjMNdxKWlB", "currencyNamespace": "fnRyFS0Ed7gTM5AV", "currencyType": "VIRTUAL", "discountAmount": 99, "discountExpireAt": "1980-12-23T00:00:00Z", "discountPercentage": 57, "discountPurchaseAt": "1989-12-13T00:00:00Z", "discountedPrice": 27, "expireAt": "1975-03-20T00:00:00Z", "price": 60, "purchaseAt": "1994-07-08T00:00:00Z", "trialPrice": 5}, {"currencyCode": "N7HDPTUEDPN1Kb4U", "currencyNamespace": "TPWDXTSb55g8LSTs", "currencyType": "VIRTUAL", "discountAmount": 82, "discountExpireAt": "1978-02-13T00:00:00Z", "discountPercentage": 29, "discountPurchaseAt": "1992-10-28T00:00:00Z", "discountedPrice": 23, "expireAt": "1977-09-24T00:00:00Z", "price": 23, "purchaseAt": "1999-12-01T00:00:00Z", "trialPrice": 19}]}}]}' \
    > test.out 2>&1
eval_tap $? 130 'BulkUpdateRegionData' test.out

#- 131 SearchItems
./ng net.accelbyte.sdk.cli.Main platform searchItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --itemType 'EXTENSION' \
    --limit '11' \
    --offset '85' \
    --sortBy 'obIdnI6Ag7eUYcYJ' \
    --storeId '4QzXCmqr6gmPGaHP' \
    --keyword '5SVPvRLiDi0mNHb6' \
    --language 'Lx8eq8SGNwEQO8dY' \
    > test.out 2>&1
eval_tap $? 131 'SearchItems' test.out

#- 132 QueryUncategorizedItems
./ng net.accelbyte.sdk.cli.Main platform queryUncategorizedItems \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --limit '43' \
    --offset '48' \
    --sortBy 'updatedAt:asc,displayOrder:desc,updatedAt:desc' \
    --storeId 'haBKoUfiHjGmCyPs' \
    > test.out 2>&1
eval_tap $? 132 'QueryUncategorizedItems' test.out

#- 133 GetItem
./ng net.accelbyte.sdk.cli.Main platform getItem \
    --itemId 'KCJTv1ic9gvagF2c' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId 'SuztsJ5tj64gV7nm' \
    > test.out 2>&1
eval_tap $? 133 'GetItem' test.out

#- 134 UpdateItem
./ng net.accelbyte.sdk.cli.Main platform updateItem \
    --itemId 'Dk29mcjSuz9vbNSt' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qPtQmQN6eKAGiZFC' \
    --body '{"appId": "ftT0RWECdjWYrnul", "appType": "GAME", "baseAppId": "ofwYLQcDvkaEIIPo", "boothName": "JT83zEGXmVBZLyrH", "categoryPath": "9J7BoysmaORLkP5h", "clazz": "c2Fh04JTsqDTynCe", "displayOrder": 45, "entitlementType": "CONSUMABLE", "ext": {"qJligLlRxOelKykI": {}, "CRxF6HtlER2txs4q": {}, "rNARATn6KXOutlYB": {}}, "features": ["cwWVRK6UKk5ozrXA", "dVBqQsBpCJBIXLGY", "bLhL8KXx25FZfQIo"], "flexible": false, "images": [{"as": "ZHNyq9odanhR1Zrm", "caption": "3thUvV87yfkycLSV", "height": 8, "imageUrl": "8TgfNu0rqXUOyToL", "smallImageUrl": "PIREGIKlJt3EP9kK", "width": 46}, {"as": "XEjrJMki8jvc3P8G", "caption": "wjg3IOH0SDHgYKqx", "height": 72, "imageUrl": "DXMzLSrzoiBnYi5U", "smallImageUrl": "Ws3tYlYeMoCimJyS", "width": 30}, {"as": "2vfJuje5cPnmGjTv", "caption": "Ya5Pqx1K7qcAoijB", "height": 84, "imageUrl": "9WpifqjNjLOtNQts", "smallImageUrl": "2yxf6MLZJ2jZfZbp", "width": 93}], "inventoryConfig": {"customAttributes": {"9DaMrc0WFgKjE945": {}, "x2CPVYYG9WvoGmAm": {}, "vaVV5YfxnUNcwjr7": {}}, "serverCustomAttributes": {"gSGhnfuF4WZiQVIC": {}, "VpWd3UM08gMXhdf3": {}, "juXW4JprIb3CJCAt": {}}, "slotUsed": 45}, "itemIds": ["4Z5f8nfaKqdZFLbZ", "EHxsDxeR6d7r1SQw", "80JfMpPrSqYypRUn"], "itemQty": {"q5o4ETeCUYG9ccTt": 15, "Wxw8OQ13t3uTw6zQ": 41, "0HATGylx2JG2KNGf": 16}, "itemType": "EXTENSION", "listable": true, "localizations": {"Nsg9ZKYCKoISyXtH": {"description": "zoWGdYohxMp3uOQI", "localExt": {"ybqWfG9BJ6FVKlbY": {}, "HtbPtaxvagSlpGgV": {}, "TF6VeDAPOGBwweyF": {}}, "longDescription": "fXEOEAEtbag82KgB", "title": "gyCd5vjkfz3eR4Dt"}, "Np129hzBw3xLUcCE": {"description": "t0DzmkJq1sml5bYt", "localExt": {"76BNsi4giR9434Wp": {}, "KKdzxoufCNlFoOcW": {}, "QQy4bjmQeEweoBHT": {}}, "longDescription": "dwAk7ZQnbqY1cQwV", "title": "EtAr5kKKAo9MM2Cq"}, "m84jVi9kIpqgrzpU": {"description": "kNOBWydXV0Fi02aF", "localExt": {"r8CDapjwNOl4k8rV": {}, "Nrm8drv8QD2JOe2N": {}, "tz7EFvowPgIGuetx": {}}, "longDescription": "FMqXCQMAqQ2ZRGzN", "title": "trThFa9XU8moslui"}}, "lootBoxConfig": {"rewardCount": 69, "rewards": [{"lootBoxItems": [{"count": 100, "duration": 10, "endDate": "1989-03-23T00:00:00Z", "itemId": "7O8sAQ32wj9uaDzs", "itemSku": "r9xYiWRuuzQJiLc1", "itemType": "eI9w3JEhxPGbEk7s"}, {"count": 12, "duration": 53, "endDate": "1982-01-20T00:00:00Z", "itemId": "7FlounC3vJKBC7Sw", "itemSku": "goViPeIB4Ehy0Y5a", "itemType": "SJVDginxAM77eY9C"}, {"count": 7, "duration": 88, "endDate": "1987-11-03T00:00:00Z", "itemId": "bfiI2NPvl1kCY5bE", "itemSku": "okxXxkWZbjf7GZxa", "itemType": "ossQmjo69wohJFyT"}], "name": "Nk5FGUPhR4LEZvz3", "odds": 0.49873398403836644, "type": "PROBABILITY_GROUP", "weight": 19}, {"lootBoxItems": [{"count": 64, "duration": 20, "endDate": "1993-12-24T00:00:00Z", "itemId": "96Ug5m4axDV5uTcY", "itemSku": "soahUrELQ1btjJOq", "itemType": "QMgZWAU6E92nHJzv"}, {"count": 46, "duration": 23, "endDate": "1993-06-03T00:00:00Z", "itemId": "Z9Z1JBrHRzEOtIxz", "itemSku": "Pqb6n73m0jiaDH86", "itemType": "d9rsKgzCsMulpB8H"}, {"count": 48, "duration": 95, "endDate": "1976-06-07T00:00:00Z", "itemId": "87b9Z5BTsEA3EdmW", "itemSku": "8saabP4xRowfNojz", "itemType": "PXI2v0prR3OEey0M"}], "name": "kZwS6TYwNN3UYhic", "odds": 0.8430896902167488, "type": "REWARD", "weight": 33}, {"lootBoxItems": [{"count": 71, "duration": 68, "endDate": "1995-09-01T00:00:00Z", "itemId": "6LQPHlaeYl4csFq6", "itemSku": "5cU66yJaj4ovoKWE", "itemType": "4EW0sw8v5peiuxoB"}, {"count": 73, "duration": 30, "endDate": "1984-12-11T00:00:00Z", "itemId": "TauyD3XCXVMiyEvM", "itemSku": "f9yilUEujk6oqYo1", "itemType": "HQYTFzwdOMdupwD4"}, {"count": 82, "duration": 78, "endDate": "1999-06-11T00:00:00Z", "itemId": "CBfGUdVEdvdQL7sV", "itemSku": "wcZ2PofaJoSqtrEO", "itemType": "qxH46fRTSZoDdT0f"}], "name": "efo74eg3Nt2c0r4G", "odds": 0.27273357434842627, "type": "REWARD_GROUP", "weight": 79}], "rollFunction": "DEFAULT"}, "maxCount": 81, "maxCountPerUser": 3, "name": "HglOVuNZ9LzNeJnB", "optionBoxConfig": {"boxItems": [{"count": 41, "duration": 77, "endDate": "1980-02-26T00:00:00Z", "itemId": "h54CWbYb0Pebyt8b", "itemSku": "4DGscjwrizsFUgYw", "itemType": "baLvqvQ2NbmDITuy"}, {"count": 25, "duration": 8, "endDate": "1994-04-26T00:00:00Z", "itemId": "Bjn3d2sFzMS3QaVj", "itemSku": "ZF7Ax6115Kg9U8vr", "itemType": "QJXQxoIbVi2CLEk2"}, {"count": 95, "duration": 32, "endDate": "1988-07-12T00:00:00Z", "itemId": "vjj1A647XQ3koaAf", "itemSku": "ZIim0sFPm1YN27bo", "itemType": "jDVaZLpx4kEWYkO6"}]}, "purchasable": true, "recurring": {"cycle": "YEARLY", "fixedFreeDays": 95, "fixedTrialCycles": 46, "graceDays": 80}, "regionData": {"bPZTlMlUvFEiGprc": [{"currencyCode": "NSQ9kEeXBZ6FVrBz", "currencyNamespace": "yhyhoS6a9oe0JaXF", "currencyType": "REAL", "discountAmount": 76, "discountExpireAt": "1973-04-10T00:00:00Z", "discountPercentage": 12, "discountPurchaseAt": "1978-12-11T00:00:00Z", "expireAt": "1986-06-15T00:00:00Z", "price": 13, "purchaseAt": "1996-01-25T00:00:00Z", "trialPrice": 2}, {"currencyCode": "8EMspOs8nkic9gj5", "currencyNamespace": "vyUMAAmIHYbsxG5N", "currencyType": "REAL", "discountAmount": 65, "discountExpireAt": "1991-01-12T00:00:00Z", "discountPercentage": 99, "discountPurchaseAt": "1993-07-15T00:00:00Z", "expireAt": "1971-07-04T00:00:00Z", "price": 76, "purchaseAt": "1991-12-28T00:00:00Z", "trialPrice": 30}, {"currencyCode": "21DiSFsm0XXQJWsz", "currencyNamespace": "vTQEuALzDNp1SZ58", "currencyType": "REAL", "discountAmount": 57, "discountExpireAt": "1986-04-03T00:00:00Z", "discountPercentage": 65, "discountPurchaseAt": "1977-10-12T00:00:00Z", "expireAt": "1982-05-16T00:00:00Z", "price": 53, "purchaseAt": "1987-12-22T00:00:00Z", "trialPrice": 26}], "Hak1MXxj7Esrg790": [{"currencyCode": "0nml5BidsK9dCEzh", "currencyNamespace": "VnOv0PQbVIaKiHfo", "currencyType": "REAL", "discountAmount": 29, "discountExpireAt": "1980-08-31T00:00:00Z", "discountPercentage": 3, "discountPurchaseAt": "1984-04-24T00:00:00Z", "expireAt": "1993-06-06T00:00:00Z", "price": 66, "purchaseAt": "1988-09-15T00:00:00Z", "trialPrice": 51}, {"currencyCode": "r1ta3m7jK5pxe82p", "currencyNamespace": "gFiAS6piIzmc8rKr", "currencyType": "VIRTUAL", "discountAmount": 63, "discountExpireAt": "1972-12-06T00:00:00Z", "discountPercentage": 77, "discountPurchaseAt": "1987-03-19T00:00:00Z", "expireAt": "1984-06-30T00:00:00Z", "price": 5, "purchaseAt": "1993-04-24T00:00:00Z", "trialPrice": 27}, {"currencyCode": "zfjDZZBmOau6syme", "currencyNamespace": "06c6SKLc2mEC3IXl", "currencyType": "REAL", "discountAmount": 59, "discountExpireAt": "1977-01-14T00:00:00Z", "discountPercentage": 22, "discountPurchaseAt": "1996-11-24T00:00:00Z", "expireAt": "1985-02-13T00:00:00Z", "price": 21, "purchaseAt": "1988-10-10T00:00:00Z", "trialPrice": 1}], "zjoSV31tvmMB6jzr": [{"currencyCode": "pRGESmooHiCV4GUO", "currencyNamespace": "nXpapXQGRakUbcG7", "currencyType": "VIRTUAL", "discountAmount": 4, "discountExpireAt": "1973-12-29T00:00:00Z", "discountPercentage": 87, "discountPurchaseAt": "1973-03-12T00:00:00Z", "expireAt": "1978-03-10T00:00:00Z", "price": 45, "purchaseAt": "1988-04-25T00:00:00Z", "trialPrice": 8}, {"currencyCode": "JcaRMEb15LBlTVuf", "currencyNamespace": "c5ZyODR2NVyn4PRq", "currencyType": "REAL", "discountAmount": 94, "discountExpireAt": "1999-02-04T00:00:00Z", "discountPercentage": 60, "discountPurchaseAt": "1993-01-10T00:00:00Z", "expireAt": "1998-07-09T00:00:00Z", "price": 34, "purchaseAt": "1975-08-16T00:00:00Z", "trialPrice": 81}, {"currencyCode": "AoKGcVCdMiSNV4qB", "currencyNamespace": "rt1kcLmRv6EJtl5x", "currencyType": "VIRTUAL", "discountAmount": 26, "discountExpireAt": "1978-06-02T00:00:00Z", "discountPercentage": 39, "discountPurchaseAt": "1971-02-28T00:00:00Z", "expireAt": "1978-01-20T00:00:00Z", "price": 99, "purchaseAt": "1976-05-12T00:00:00Z", "trialPrice": 95}]}, "saleConfig": {"currencyCode": "94RImNWVIJnhhwFD", "price": 98}, "seasonType": "PASS", "sectionExclusive": true, "sellable": true, "sku": "GcV8DY0XOkDstxZc", "stackable": false, "status": "ACTIVE", "tags": ["AJUg21Lt7JwgwMUS", "uC3Bajy3BcEMCtQs", "AnZV4IOglVLqb9lG"], "targetCurrencyCode": "2FcEcvVAyId6Cp85", "targetNamespace": "HVDsZBQgOnXuXsGT", "thumbnailUrl": "hYZrmm0wrFMnPpWg", "useCount": 37}' \
    > test.out 2>&1
eval_tap $? 134 'UpdateItem' test.out

#- 135 DeleteItem
./ng net.accelbyte.sdk.cli.Main platform deleteItem \
    --itemId 'kwxUNYyNwGiKrknH' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'ENTITLEMENT,IAP,CATALOG' \
    --force  \
    --storeId 'cMF7fuDbzRRYMNXW' \
    > test.out 2>&1
eval_tap $? 135 'DeleteItem' test.out

#- 136 AcquireItem
./ng net.accelbyte.sdk.cli.Main platform acquireItem \
    --itemId 'Usp1tOibJY9aL9ie' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 8, "orderNo": "vvMbiNURrlm88QlK"}' \
    > test.out 2>&1
eval_tap $? 136 'AcquireItem' test.out

#- 137 GetApp
./ng net.accelbyte.sdk.cli.Main platform getApp \
    --itemId 'yuoya4JgakZyUV7t' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --storeId '73VnSFbuxd4KYZ0j' \
    > test.out 2>&1
eval_tap $? 137 'GetApp' test.out

#- 138 UpdateApp
./ng net.accelbyte.sdk.cli.Main platform updateApp \
    --itemId 'k0UZdhtnKu9oTc8p' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VkiyGsj5JdXzRxfN' \
    --body '{"carousel": [{"alt": "EjUMTs8WIObJBTsv", "previewUrl": "sw76uISRX0bKVoWt", "thumbnailUrl": "oUW1P7ocuBAldDSU", "type": "image", "url": "7Haa6unq1yQOSRvy", "videoSource": "generic"}, {"alt": "ZNuysyM4OfCzdQCX", "previewUrl": "MAWnf87YPNOe9Eev", "thumbnailUrl": "f1fhMg1E2k7QLFrV", "type": "image", "url": "84DiZk6ySrB9SVFc", "videoSource": "vimeo"}, {"alt": "XyFFVpM87yqEwEac", "previewUrl": "QMTlqN4LKkxJ5v3S", "thumbnailUrl": "BafnKNiMPbFkFGA8", "type": "video", "url": "W3HJkqgS2B37wwoP", "videoSource": "generic"}], "developer": "OHiIsxmsLBPBJuNL", "forumUrl": "nWRrtW870qD88Zcd", "genres": ["MassivelyMultiplayer", "Indie", "FreeToPlay"], "localizations": {"Se7W20UZcDaiq0nE": {"announcement": "Z7PyhqFJkDClOsKm", "slogan": "fsgJdmzsDPsWh1k0"}, "cQ08NG6dX2TZkil6": {"announcement": "7kRngoUa83ECh1gq", "slogan": "PeS193TNNzot3sVl"}, "i3GN2XTrFibRAhzz": {"announcement": "EWzWlTY70qdgJRvp", "slogan": "ZrSpWX3KEe2BjV00"}}, "platformRequirements": {"ReCXFffjJJxlgjzI": [{"additionals": "hpgOoIOD74V21HWD", "directXVersion": "AfvXwdxbyp4HAPbB", "diskSpace": "bNPStVBUpKgOssFk", "graphics": "z0F36piDYXeHZ7FH", "label": "ls3nyvconqbHQqKL", "osVersion": "QKe3xmj6s0GqsWnc", "processor": "p5LrqbiKudv9z75S", "ram": "zoCV8ZMi2o1nR482", "soundCard": "D6gNClk9c87hosaP"}, {"additionals": "FC5zBW3ZgVZCj9Ob", "directXVersion": "VGT0Scwl4kNmCi15", "diskSpace": "XTJTgCNNH7RtG5Xm", "graphics": "o9Q0Wb07N17fkxZS", "label": "c6VbE0AGcekjMNHu", "osVersion": "PXtz8tXxrmzafMUg", "processor": "uyDoN91uc28HoSpG", "ram": "t1g0GGbT4Hf2PPKO", "soundCard": "ldkbgX9CWJKwXXSb"}, {"additionals": "v5eg9q86IaDFjjx6", "directXVersion": "uZerWbtwTX9gNRBy", "diskSpace": "jbE8lOLAfTXKLzbr", "graphics": "ddqcKLa7LevxNHOS", "label": "EhQRZIp693lRwtc4", "osVersion": "3atCuCFxbfbz4aQE", "processor": "RziPL4dHhOqG5KDd", "ram": "Uvk0LEi26Ls7mjRx", "soundCard": "NmvvNtjJNQepUTGh"}], "wlY4lPzlsCR5rVsy": [{"additionals": "fcH7WjP7HuGz3b5W", "directXVersion": "AEvdRF9bqMj4ro5B", "diskSpace": "19VE838c7OydVw0z", "graphics": "CqoMZvpIOO97DmQ5", "label": "ZOzx6iCJTu60Iifz", "osVersion": "Mhkk5PxsjqbCKpMv", "processor": "2Yky9DYkD2sIllFt", "ram": "BtXJKG3rqBmILhtW", "soundCard": "m8RQvRUbUDSiefGE"}, {"additionals": "dLucrtO2gCQD057D", "directXVersion": "rDlgC2nzS9SiGUjV", "diskSpace": "Aw4v3q6JRHcn7Kao", "graphics": "CEkRdo6qHYIZWnXq", "label": "Q1oHFJ9Q0vqsL9So", "osVersion": "mqWsGA76yxi0QzZW", "processor": "fmP2sx0KO5bEJaPn", "ram": "AFjsodyJQVVBrShG", "soundCard": "bIIuqK8C403HgoXC"}, {"additionals": "R6XOMXwKdfqk8T4Q", "directXVersion": "HK30EX0FclpDl5Hs", "diskSpace": "uracO5MnjnxD1OXk", "graphics": "xShFVQTRekLfjmy8", "label": "zosRCRgVwbrQKmb0", "osVersion": "1yA7U7dGMjupZkZQ", "processor": "Y8CNyT4k3DIbfT22", "ram": "G5NpE130YWSgxpKW", "soundCard": "tdtdtVW9anENmxb9"}], "e7vXZV3ig8Jg5VBy": [{"additionals": "eI3ycMcYYBixKJXC", "directXVersion": "ISQdwec1m8BusV9t", "diskSpace": "Uh74KVo6Xqjz2xUK", "graphics": "LNWSmYyVvyelIJ8Q", "label": "gaLMqi836ULa7cfZ", "osVersion": "l4VuY6rsZyo6CBRR", "processor": "noOikIxXKKIR6kPm", "ram": "swm5TCAU1cKApdJD", "soundCard": "nE73GLmSZns5owBh"}, {"additionals": "oUg4LsGP6KLPXkvU", "directXVersion": "v2XiXaBzsmaxjTZP", "diskSpace": "lLitytGka7Kv5Tac", "graphics": "QKF4OlRGdmXxETLE", "label": "Qrr3KCAV9alq3hK1", "osVersion": "G4kKooSNNUZuiynZ", "processor": "64IwncZPk82GF3eT", "ram": "C0vzZUDj9dzGgGVx", "soundCard": "o9OHgfHumyfuBNis"}, {"additionals": "ecYbcOpR45VDlvSc", "directXVersion": "0Mr7ImwCwGqOf0bN", "diskSpace": "s97KvKyj3MqS7Dcm", "graphics": "tfh50eObbrmgjhWK", "label": "0x0ZidAJ1CU1eD1L", "osVersion": "a16Bw3JbUnUDh5yG", "processor": "jjv4Mwrv2vancmR6", "ram": "Z7rb21A2E9pX0BWC", "soundCard": "MqPsRk5htdM5T3fD"}]}, "platforms": ["Windows", "Linux", "Windows"], "players": ["Single", "Multi", "Multi"], "primaryGenre": "MassivelyMultiplayer", "publisher": "rkoqv2mM6soMaTvQ", "releaseDate": "1979-10-14T00:00:00Z", "websiteUrl": "2a9YdFNtRVSO0js0"}' \
    > test.out 2>&1
eval_tap $? 138 'UpdateApp' test.out

#- 139 DisableItem
./ng net.accelbyte.sdk.cli.Main platform disableItem \
    --itemId 'hG9xmSnzd7zgUxAo' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'gcnGkXk17QPkJHRh' \
    --body '{"featuresToCheck": ["IAP", "CATALOG", "ENTITLEMENT"]}' \
    > test.out 2>&1
eval_tap $? 139 'DisableItem' test.out

#- 140 GetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform getItemDynamicData \
    --itemId '9IRIpDDubntPCFxf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 140 'GetItemDynamicData' test.out

#- 141 EnableItem
./ng net.accelbyte.sdk.cli.Main platform enableItem \
    --itemId 'eoW2NdSWzOXjO1NQ' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'UqWHBW78XREZCiTN' \
    > test.out 2>&1
eval_tap $? 141 'EnableItem' test.out

#- 142 FeatureItem
./ng net.accelbyte.sdk.cli.Main platform featureItem \
    --feature 'Axq26gZrPqCsSDsp' \
    --itemId 'vgM16sZ6rjnkH4Ex' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'ObppC6CMYDm5ge65' \
    > test.out 2>&1
eval_tap $? 142 'FeatureItem' test.out

#- 143 DefeatureItem
./ng net.accelbyte.sdk.cli.Main platform defeatureItem \
    --feature '9UDEOF6gp5Ufmjti' \
    --itemId 'VbqJnZcrqrPye7fC' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'wi7Il2wIFlHm9N6o' \
    > test.out 2>&1
eval_tap $? 143 'DefeatureItem' test.out

#- 144 GetLocaleItem
./ng net.accelbyte.sdk.cli.Main platform getLocaleItem \
    --itemId 'wMHMtJy1Oqn59tEG' \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    --language 'm9NYeUT5P0nx8TqS' \
    --populateBundle  \
    --region 'ZdZ5C8mFI9TnvzEq' \
    --storeId 'BNMF9CZvPxT5zbre' \
    > test.out 2>&1
eval_tap $? 144 'GetLocaleItem' test.out

#- 145 UpdateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform updateItemPurchaseCondition \
    --itemId 'Mc9fBoU3RHNDFjLK' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'Frepy56eW1kmb15Q' \
    --body '{"purchaseCondition": {"conditionGroups": [{"operator": "and", "predicates": [{"anyOf": 78, "code": "IQF51c4MqJzDSvEL", "comparison": "includes", "name": "lJGI2YYb6ajBjgq6", "predicateType": "EntitlementPredicate", "value": "t1efGJeJaxyHYutg", "values": ["1jxeWXk80y9uxgVL", "GgK8aVSCN6oCETQ8", "Xucx85vHA009FAb2"]}, {"anyOf": 14, "code": "MJbJIYLssMvy9gkf", "comparison": "includes", "name": "MRrXVRcAVRDX6gmD", "predicateType": "EntitlementPredicate", "value": "eToFmkHJ6BPOKFLx", "values": ["RufOUGfMjTU226l0", "7jPlcYaqYM7YfBmh", "IwKssw647YwDudnG"]}, {"anyOf": 20, "code": "AEl6A9sh2x2ur2cc", "comparison": "isGreaterThanOrEqual", "name": "KPCFUIeyYEymNXzN", "predicateType": "SeasonTierPredicate", "value": "6TGh4UdEweeBsJEv", "values": ["iDnc1NUb51lEgUwQ", "BbAvCmlh6Z1oz9Ba", "ixUUvmzbajE2gjoo"]}]}, {"operator": "or", "predicates": [{"anyOf": 39, "code": "L4axSPgPCiwLxCFL", "comparison": "isNot", "name": "918JaEBQBP766LUn", "predicateType": "StatisticCodePredicate", "value": "0oQgcHdGGK3x76U1", "values": ["eNLHkVrEFd8xArWJ", "0sMY8es36r1FgR70", "EIcklttmrpgF5szl"]}, {"anyOf": 41, "code": "JV5YqE2myQzl7X9f", "comparison": "isGreaterThanOrEqual", "name": "r6WvBxmBvNj3ktaD", "predicateType": "EntitlementPredicate", "value": "v12ZSRJkujxbCu1H", "values": ["g7Dc5APzfzXDELJF", "7H7yIS7b5TSDRIoM", "Faj6Vxs3GuA4S1dS"]}, {"anyOf": 1, "code": "os4qR8LaQzEb39sZ", "comparison": "includes", "name": "dFfC8x5aHLsXHlm1", "predicateType": "SeasonTierPredicate", "value": "JTTy9JrNz1K5M1qg", "values": ["niEHLbEQKc0aUvrK", "XDIjYC4df9qswSlp", "FddYvifGHawNx6yh"]}]}, {"operator": "or", "predicates": [{"anyOf": 72, "code": "5Q4ulonMFjmYqE1w", "comparison": "includes", "name": "p0DwUj2HKUvPYUcQ", "predicateType": "StatisticCodePredicate", "value": "Wn65Co0vdCk8so6J", "values": ["2SrEdN2tmGuX6r0g", "SaZAIadKDEZywonA", "BVUUeKKlPKtE6gnY"]}, {"anyOf": 48, "code": "D2bTcgaKoccaSwWc", "comparison": "isGreaterThan", "name": "uwWrCQt86Jrg8tLA", "predicateType": "EntitlementPredicate", "value": "WpcyNkUvqn6eXr6F", "values": ["ugIAknXcSaVYcAYp", "7qSiDvsfMUOpWv46", "NbKJ05Orya6LSSUl"]}, {"anyOf": 37, "code": "rPoWiywnxuDLLuIa", "comparison": "isLessThanOrEqual", "name": "nYoID2UqO0iAXA9d", "predicateType": "StatisticCodePredicate", "value": "0ZwosKhDlLfTKxpV", "values": ["u6FB0sL2xt6fX9j7", "rhZCAlDlVKBsLZiB", "OXvGSrdkqddI3ezq"]}]}]}}' \
    > test.out 2>&1
eval_tap $? 145 'UpdateItemPurchaseCondition' test.out

#- 146 QueryItemReferences
./ng net.accelbyte.sdk.cli.Main platform queryItemReferences \
    --itemId 'RXszE7CL1cQCSoqH' \
    --namespace "$AB_NAMESPACE" \
    --featuresToCheck 'DLC,DLC,IAP' \
    --storeId 'gkDuWS05m0pGzazM' \
    > test.out 2>&1
eval_tap $? 146 'QueryItemReferences' test.out

#- 147 ReturnItem
./ng net.accelbyte.sdk.cli.Main platform returnItem \
    --itemId '2BUXnzUEWTiKMJAf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "6AgbiEDMfCckWogE"}' \
    > test.out 2>&1
eval_tap $? 147 'ReturnItem' test.out

#- 148 QueryKeyGroups
./ng net.accelbyte.sdk.cli.Main platform queryKeyGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --name 'T3l1ut2oyolliYsT' \
    --offset '73' \
    --tag '6TKwdRMraDLrwh3d' \
    > test.out 2>&1
eval_tap $? 148 'QueryKeyGroups' test.out

#- 149 CreateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform createKeyGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "0ykRGkgqUNIbJMJ9", "name": "ABbKVWO2YEDiqkwK", "status": "ACTIVE", "tags": ["tQ92iD02YMvEUNfo", "L7JCcMo7GxxXdbYC", "RexPekTsQxMTfaSo"]}' \
    > test.out 2>&1
eval_tap $? 149 'CreateKeyGroup' test.out

#- 150 GetKeyGroupByBoothName
eval_tap 0 150 'GetKeyGroupByBoothName # SKIP deprecated' test.out

#- 151 GetKeyGroup
./ng net.accelbyte.sdk.cli.Main platform getKeyGroup \
    --keyGroupId 't7aohFYy4VxwHIJ9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 151 'GetKeyGroup' test.out

#- 152 UpdateKeyGroup
./ng net.accelbyte.sdk.cli.Main platform updateKeyGroup \
    --keyGroupId 'gzxqAw4vBGQAeh0V' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "TiTP4PSrXUS6jYI9", "name": "lsQFD43Df5qUZOFz", "status": "ACTIVE", "tags": ["sxYtgxplHTPLzynj", "FZgF3erw7UsyHq4b", "Bb0n1JhPUS8BRPGV"]}' \
    > test.out 2>&1
eval_tap $? 152 'UpdateKeyGroup' test.out

#- 153 GetKeyGroupDynamic
./ng net.accelbyte.sdk.cli.Main platform getKeyGroupDynamic \
    --keyGroupId '9n769zLJdKMexeJc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 153 'GetKeyGroupDynamic' test.out

#- 154 ListKeys
./ng net.accelbyte.sdk.cli.Main platform listKeys \
    --keyGroupId '7NvgTSgKjCxZjKf8' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '72' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 154 'ListKeys' test.out

#- 155 UploadKeys
./ng net.accelbyte.sdk.cli.Main platform uploadKeys \
    --keyGroupId 'YwqfSRy8GgVk77fd' \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 155 'UploadKeys' test.out

#- 156 QueryOrders
./ng net.accelbyte.sdk.cli.Main platform queryOrders \
    --namespace "$AB_NAMESPACE" \
    --endTime '1GS5YkyhAiAItnWU' \
    --limit '25' \
    --offset '28' \
    --orderNos 'D225fp1egsx3Erhe,Nwqd5priclNNqLyr,lzrJ4QHbfnAdtkuj' \
    --sortBy 'xHff7n1yaNCcjgFh' \
    --startTime 'S0URBhl0L5FCbOn4' \
    --status 'REFUNDING' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 156 'QueryOrders' test.out

#- 157 GetOrderStatistics
./ng net.accelbyte.sdk.cli.Main platform getOrderStatistics \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 157 'GetOrderStatistics' test.out

#- 158 GetOrder
./ng net.accelbyte.sdk.cli.Main platform getOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'W2B2uPQLrt2t6bVp' \
    > test.out 2>&1
eval_tap $? 158 'GetOrder' test.out

#- 159 RefundOrder
./ng net.accelbyte.sdk.cli.Main platform refundOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'CgKvPXSDufmKh783' \
    --body '{"description": "cV54JsVBRB0rY0xf"}' \
    > test.out 2>&1
eval_tap $? 159 'RefundOrder' test.out

#- 160 GetPaymentCallbackConfig
eval_tap 0 160 'GetPaymentCallbackConfig # SKIP deprecated' test.out

#- 161 UpdatePaymentCallbackConfig
eval_tap 0 161 'UpdatePaymentCallbackConfig # SKIP deprecated' test.out

#- 162 GetPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 162 'GetPaymentMerchantConfig' test.out

#- 163 UpdatePaymentDomainWhitelistConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentDomainWhitelistConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"domains": ["WddACyHSmo4KX9TP", "O3K1k5ZM8btmGsgX", "NXbpqxh76Af5JSwj"]}' \
    > test.out 2>&1
eval_tap $? 163 'UpdatePaymentDomainWhitelistConfig' test.out

#- 164 QueryPaymentNotifications
./ng net.accelbyte.sdk.cli.Main platform queryPaymentNotifications \
    --namespace "$AB_NAMESPACE" \
    --endDate 'w2fE2g6jXV7oai2o' \
    --externalId 'Dm9FaP0HJ98tE4Uy' \
    --limit '30' \
    --notificationSource 'ALIPAY' \
    --notificationType 'Qg0b0sGOkzxVt15L' \
    --offset '76' \
    --paymentOrderNo 'OutADrNGBWSJ1zQK' \
    --startDate 'xVmRTawjiZPMoZZc' \
    --status 'WARN' \
    > test.out 2>&1
eval_tap $? 164 'QueryPaymentNotifications' test.out

#- 165 QueryPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform queryPaymentOrders \
    --namespace "$AB_NAMESPACE" \
    --channel 'INTERNAL' \
    --extTxId 'EHxAKDQher3usApP' \
    --limit '6' \
    --offset '91' \
    --status 'REFUNDED' \
    > test.out 2>&1
eval_tap $? 165 'QueryPaymentOrders' test.out

#- 166 CreatePaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform createPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --body '{"currencyCode": "RiBq23kyH9jQbHWk", "currencyNamespace": "cVk0X28GS54vl7gI", "customParameters": {"KBc7OYTylFRAJKyS": {}, "nC0cfPl3Z2zSBbs4": {}, "PAV72u8AxE2IQeox": {}}, "description": "YV4UcYzswAGpXqQx", "extOrderNo": "ctuVaqPJGAHEZmuQ", "extUserId": "rZ8GaQ4OZ2nDodm4", "itemType": "SUBSCRIPTION", "language": "SFjM_980", "metadata": {"4uyzZo1rj0ZrLQjk": "4VoYfIksth24cZBp", "dDFfvzeU5iqhx6zv": "7EURTNIoG1DBdoKH", "6sREmmfwUZLZZS7s": "nx0Q2Gd8m7Y3wiNl"}, "notifyUrl": "oJfey3HXL6SjljNP", "omitNotification": false, "platform": "XA3qbg55SyienCOD", "price": 75, "recurringPaymentOrderNo": "mnOpPTVxEgBFzG8t", "region": "lkxWKCU1XN4gl7yH", "returnUrl": "vEqpJSrDXVwCkhOQ", "sandbox": false, "sku": "1TFjROYJm75VIuCO", "subscriptionId": "Ckt2W1DfI8QtgODk", "targetNamespace": "9K6DcMnyCPn1FylW", "targetUserId": "daNV1VaZTkbbuWii", "title": "A4UTDgS2SVEo5M80"}' \
    > test.out 2>&1
eval_tap $? 166 'CreatePaymentOrderByDedicated' test.out

#- 167 ListExtOrderNoByExtTxId
./ng net.accelbyte.sdk.cli.Main platform listExtOrderNoByExtTxId \
    --namespace "$AB_NAMESPACE" \
    --extTxId 'LLbku9GYH4ijqOVM' \
    > test.out 2>&1
eval_tap $? 167 'ListExtOrderNoByExtTxId' test.out

#- 168 GetPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '50tCqkZfsSxAbDJ7' \
    > test.out 2>&1
eval_tap $? 168 'GetPaymentOrder' test.out

#- 169 ChargePaymentOrder
./ng net.accelbyte.sdk.cli.Main platform chargePaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'sHCLup8pmEosOXgl' \
    --body '{"extTxId": "QwwdeLVpmXqRwVjc", "paymentMethod": "3W2ANmE3VVsQ1fm9", "paymentProvider": "WXPAY"}' \
    > test.out 2>&1
eval_tap $? 169 'ChargePaymentOrder' test.out

#- 170 RefundPaymentOrderByDedicated
./ng net.accelbyte.sdk.cli.Main platform refundPaymentOrderByDedicated \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '0GTJwEjoZrRtaeWK' \
    --body '{"description": "MC8wsOByQAMAgqFE"}' \
    > test.out 2>&1
eval_tap $? 170 'RefundPaymentOrderByDedicated' test.out

#- 171 SimulatePaymentOrderNotification
./ng net.accelbyte.sdk.cli.Main platform simulatePaymentOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'zEt8umj5XhKnw7MH' \
    --body '{"amount": 61, "currencyCode": "A1VynioJcAPwVHUG", "notifyType": "CHARGE", "paymentProvider": "PAYPAL", "salesTax": 17, "vat": 49}' \
    > test.out 2>&1
eval_tap $? 171 'SimulatePaymentOrderNotification' test.out

#- 172 GetPaymentOrderChargeStatus
./ng net.accelbyte.sdk.cli.Main platform getPaymentOrderChargeStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'ACMvoY4jWH9dFmOH' \
    > test.out 2>&1
eval_tap $? 172 'GetPaymentOrderChargeStatus' test.out

#- 173 GetPsnEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getPsnEntitlementOwnership \
    --entitlementLabel 'W0j9suukPE4JwQON' \
    --namespace "$AB_NAMESPACE" \
    --body '{"accessToken": "Q2vCbMn0Oia336ui", "serviceLabel": 17}' \
    > test.out 2>&1
eval_tap $? 173 'GetPsnEntitlementOwnership' test.out

#- 174 GetXboxEntitlementOwnership
./ng net.accelbyte.sdk.cli.Main platform getXboxEntitlementOwnership \
    --namespace "$AB_NAMESPACE" \
    --productSku 'viBEWpbusO6EyVqs' \
    --body '{"delegationToken": "tpgZpbz77y88rUFu", "sandboxId": "m2ZcA8iKcF0bkfjc"}' \
    > test.out 2>&1
eval_tap $? 174 'GetXboxEntitlementOwnership' test.out

#- 175 GetPlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Steam' \
    > test.out 2>&1
eval_tap $? 175 'GetPlatformEntitlementConfig' test.out

#- 176 UpdatePlatformEntitlementConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformEntitlementConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedPlatformOrigins": ["Xbox", "Steam", "Epic"]}' \
    > test.out 2>&1
eval_tap $? 176 'UpdatePlatformEntitlementConfig' test.out

#- 177 GetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'IOS' \
    > test.out 2>&1
eval_tap $? 177 'GetPlatformWalletConfig' test.out

#- 178 UpdatePlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updatePlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Xbox' \
    --body '{"allowedBalanceOrigins": ["Other", "Epic", "Steam"]}' \
    > test.out 2>&1
eval_tap $? 178 'UpdatePlatformWalletConfig' test.out

#- 179 ResetPlatformWalletConfig
./ng net.accelbyte.sdk.cli.Main platform resetPlatformWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --platform 'Other' \
    > test.out 2>&1
eval_tap $? 179 'ResetPlatformWalletConfig' test.out

#- 180 GetRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 180 'GetRevocationConfig' test.out

#- 181 UpdateRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"entitlement": {"consumable": {"enabled": false, "strategy": "REVOKE_OR_REPORT"}, "durable": {"enabled": false, "strategy": "CUSTOM"}}, "wallet": {"enabled": false, "strategy": "CUSTOM"}}' \
    > test.out 2>&1
eval_tap $? 181 'UpdateRevocationConfig' test.out

#- 182 DeleteRevocationConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 182 'DeleteRevocationConfig' test.out

#- 183 QueryRevocationHistories
./ng net.accelbyte.sdk.cli.Main platform queryRevocationHistories \
    --namespace "$AB_NAMESPACE" \
    --endTime 'M3J9G40Y62bCo941' \
    --limit '53' \
    --offset '58' \
    --source 'OTHER' \
    --startTime 'zsE8WObt6t0w8LOB' \
    --status 'SUCCESS' \
    --transactionId '4Q0B2Cj0oOmBmXu1' \
    --userId 'KiTTiz7yrIvQj2is' \
    > test.out 2>&1
eval_tap $? 183 'QueryRevocationHistories' test.out

#- 184 GetRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform getRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 184 'GetRevocationPluginConfig' test.out

#- 185 UpdateRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform updateRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "N7bRwcr16lW5YwgZ"}, "customConfig": {"connectionType": "INSECURE", "grpcServerAddress": "b4pUwnGptHUplxza"}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 185 'UpdateRevocationPluginConfig' test.out

#- 186 DeleteRevocationPluginConfig
./ng net.accelbyte.sdk.cli.Main platform deleteRevocationPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 186 'DeleteRevocationPluginConfig' test.out

#- 187 UploadRevocationPluginConfigCert
./ng net.accelbyte.sdk.cli.Main platform uploadRevocationPluginConfigCert \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 187 'UploadRevocationPluginConfigCert' test.out

#- 188 CreateReward
./ng net.accelbyte.sdk.cli.Main platform createReward \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "kQiKp2oac8QTNEuB", "eventTopic": "beuQqm9wM7mgTtUd", "maxAwarded": 86, "maxAwardedPerUser": 80, "namespaceExpression": "VcQijMBhs0kDP6d3", "rewardCode": "nuUZ41mSeS9SnGqh", "rewardConditions": [{"condition": "JOvykBcDpzD9zh6d", "conditionName": "tPK4fVHLMvrCsH3R", "eventName": "YxH2Up9VthPjFrK7", "rewardItems": [{"duration": 69, "endDate": "1990-03-10T00:00:00Z", "identityType": "ITEM_ID", "itemId": "p0eONFDgUPShG8ww", "quantity": 64, "sku": "LsBKGsALPuCOyphU"}, {"duration": 94, "endDate": "1983-08-07T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "V95708zaP0wpZgQE", "quantity": 44, "sku": "iFrQB1yUonirH4UR"}, {"duration": 47, "endDate": "1986-04-24T00:00:00Z", "identityType": "ITEM_ID", "itemId": "r8W97KBedcr6PM51", "quantity": 51, "sku": "cAFO5zEw8GENEJYP"}]}, {"condition": "KxxOw7xNQ98IEbc9", "conditionName": "YITN98j4P2AGeidX", "eventName": "RRnIAJfKVjOn6rtI", "rewardItems": [{"duration": 77, "endDate": "1996-11-13T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "Vv2DLLUyBt5hDs45", "quantity": 37, "sku": "8FgqG46RsFK7eYlS"}, {"duration": 95, "endDate": "1993-06-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "cHZZjFegVnZOn0tk", "quantity": 26, "sku": "IATSIefcqNEn4IZ0"}, {"duration": 60, "endDate": "1998-06-22T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "6b8WtaMVvLbG04KK", "quantity": 28, "sku": "PQlFAGbMtEybfcAl"}]}, {"condition": "0mnsAkRT2k0AzdgI", "conditionName": "unRkTxsGdrpNELM8", "eventName": "Lfkut0wnT24wh59R", "rewardItems": [{"duration": 67, "endDate": "1981-01-10T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "6bXxp0gYZyF9fJBJ", "quantity": 21, "sku": "boQqCCyJfThvCJie"}, {"duration": 35, "endDate": "1975-12-26T00:00:00Z", "identityType": "ITEM_ID", "itemId": "GN8Mm74HlSZzp4aE", "quantity": 99, "sku": "WkZObuvig8sMuss7"}, {"duration": 32, "endDate": "1973-03-29T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MiopQrVL3ZZTVxqa", "quantity": 79, "sku": "7HvUtPYONZdFk75l"}]}], "userIdExpression": "kjQNHrjaboGomguU"}' \
    > test.out 2>&1
eval_tap $? 188 'CreateReward' test.out

#- 189 QueryRewards
./ng net.accelbyte.sdk.cli.Main platform queryRewards \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'qeuZh5qtrRbNnGej' \
    --limit '6' \
    --offset '9' \
    --sortBy 'rewardCode:asc,namespace:asc,rewardCode:desc' \
    > test.out 2>&1
eval_tap $? 189 'QueryRewards' test.out

#- 190 ExportRewards
./ng net.accelbyte.sdk.cli.Main platform exportRewards \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 190 'ExportRewards' test.out

#- 191 ImportRewards
./ng net.accelbyte.sdk.cli.Main platform importRewards \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 191 'ImportRewards' test.out

#- 192 GetReward
./ng net.accelbyte.sdk.cli.Main platform getReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'vZgN5hshSe5YmZXK' \
    > test.out 2>&1
eval_tap $? 192 'GetReward' test.out

#- 193 UpdateReward
./ng net.accelbyte.sdk.cli.Main platform updateReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'EQLkM6o3eGSP4Htm' \
    --body '{"description": "r90TqGf0OyqJ9ibJ", "eventTopic": "MmRgoxNwp1lGkYoq", "maxAwarded": 81, "maxAwardedPerUser": 69, "namespaceExpression": "2lDvdh7okHl1wMht", "rewardCode": "2Izq7TCUJhDsDefA", "rewardConditions": [{"condition": "S09VyQB1vR1mx6K1", "conditionName": "7GL1CrO4ZuoGZSxT", "eventName": "zm8oMSPIHPtqzIWI", "rewardItems": [{"duration": 52, "endDate": "1998-02-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "pbjnt1iBV8DpbjGt", "quantity": 38, "sku": "ndlO6iPGC9RhzMC7"}, {"duration": 99, "endDate": "1983-08-15T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "VlgxUmnfdOAmu1dX", "quantity": 48, "sku": "NqD20RUvvYeJZw6Q"}, {"duration": 34, "endDate": "1987-10-23T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "wFCnqpvNesGiVnt9", "quantity": 32, "sku": "IYOLarmpWyvib9CD"}]}, {"condition": "W21ANrlpuXD9H1u1", "conditionName": "CvzWPcZwkj1l6bf2", "eventName": "F9EXOBj7v8LHYivm", "rewardItems": [{"duration": 61, "endDate": "1972-12-09T00:00:00Z", "identityType": "ITEM_ID", "itemId": "PyahppgxJhk4EdTZ", "quantity": 41, "sku": "00rS92594HLvWFsX"}, {"duration": 68, "endDate": "1993-06-06T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "MP0k9L5dREQbCqfh", "quantity": 38, "sku": "gpABFBER6WNcDOsR"}, {"duration": 51, "endDate": "1978-08-13T00:00:00Z", "identityType": "ITEM_ID", "itemId": "DSozCuFsrBMtoOeL", "quantity": 11, "sku": "szzQLZBktk0siMup"}]}, {"condition": "01kyaFwwD7wecuQb", "conditionName": "4GNQHVZMKGBnzh4s", "eventName": "uaGIzttTncVBf5g3", "rewardItems": [{"duration": 29, "endDate": "1973-09-27T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "WKpItMt4GszRufkD", "quantity": 64, "sku": "s5YmIejozmG5HlrI"}, {"duration": 11, "endDate": "1990-11-09T00:00:00Z", "identityType": "ITEM_SKU", "itemId": "AvvpkAHRJHZyfrXZ", "quantity": 26, "sku": "Q32UznXNd6ve29lq"}, {"duration": 34, "endDate": "1989-06-04T00:00:00Z", "identityType": "ITEM_ID", "itemId": "pJXTLbYWpqeXjaf1", "quantity": 11, "sku": "abyDnqXjXKPIcxh0"}]}], "userIdExpression": "x7T6RQGnnW4ugGX6"}' \
    > test.out 2>&1
eval_tap $? 193 'UpdateReward' test.out

#- 194 DeleteReward
./ng net.accelbyte.sdk.cli.Main platform deleteReward \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'mKBbgTD9xL07ZzzI' \
    > test.out 2>&1
eval_tap $? 194 'DeleteReward' test.out

#- 195 CheckEventCondition
./ng net.accelbyte.sdk.cli.Main platform checkEventCondition \
    --namespace "$AB_NAMESPACE" \
    --rewardId 's3Jke34ZAUuLP897' \
    --body '{"payload": {"ooMLnemwKAvgDXNr": {}, "FEE4Jf4hQpsLOcLt": {}, "Zw0efmEVcW7mxbS5": {}}}' \
    > test.out 2>&1
eval_tap $? 195 'CheckEventCondition' test.out

#- 196 DeleteRewardConditionRecord
./ng net.accelbyte.sdk.cli.Main platform deleteRewardConditionRecord \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'UOoICxQMit8555Ni' \
    --body '{"conditionName": "y4NNFpRE5pS85yTI", "userId": "RWvLRy58UKWPv3F7"}' \
    > test.out 2>&1
eval_tap $? 196 'DeleteRewardConditionRecord' test.out

#- 197 QuerySections
./ng net.accelbyte.sdk.cli.Main platform querySections \
    --namespace "$AB_NAMESPACE" \
    --end 'S0wCVlYQi9cfMCeN' \
    --limit '26' \
    --offset '52' \
    --start 'u6OIG1PPLRDEXLXZ' \
    --storeId 'WXvqNCHvNpeMjMzg' \
    --viewId 'uq6HFIqaqwH9J6JL' \
    > test.out 2>&1
eval_tap $? 197 'QuerySections' test.out

#- 198 CreateSection
./ng net.accelbyte.sdk.cli.Main platform createSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'b5f3SBMyJUdwEBRr' \
    --body '{"active": false, "displayOrder": 54, "endDate": "1988-07-05T00:00:00Z", "ext": {"UFqTooGGnPEgY0t7": {}, "QQWl42byOwXgKyPh": {}, "Xmcysae8HpWH4xiz": {}}, "fixedPeriodRotationConfig": {"backfillType": "CUSTOM", "duration": 11, "itemCount": 0, "rule": "SEQUENCE"}, "items": [{"id": "GnMt625bWHb5sbX6", "sku": "asrjV7XJUOtHlzXN"}, {"id": "HEPpzlMlx7b2H2TH", "sku": "LwZGikW7TFA9gE6S"}, {"id": "rYKq6lcVOhPJIcEH", "sku": "biKHW7flVolAWEMm"}], "localizations": {"QSPDTRqjlvwnnCA5": {"description": "tfK5ushaKTPVjyOU", "localExt": {"pR3uUdgNlyU4IJnq": {}, "trjCOsE8VjvzhJwN": {}, "X4bhqCjlwrmsSRV8": {}}, "longDescription": "6iic1FIMyF7CcNu2", "title": "DYn6E9Gk51kOTJZl"}, "uTekDMCGUJvERxNg": {"description": "8djSb4Vt2vKQ5vlC", "localExt": {"dI519Pf2iogwxM5D": {}, "ZM0dgozmco41750x": {}, "dYQg34WUV0WpmsQn": {}}, "longDescription": "p1n4YGumTKOlDOy5", "title": "vhSkxERZ2AQ1jvXY"}, "Bar5RMmmGdWl0wpj": {"description": "5tVfKU3D8WVPh0Z7", "localExt": {"YiGE2cyzTMBY7Xd0": {}, "OoENg2Lw7uepmahX": {}, "ojVZYz2zMU9jLzNV": {}}, "longDescription": "3GaG43R6nlRPrEAY", "title": "qRBeSc5uShoj3dGH"}}, "name": "Meoi5DBOsQ0Gax0i", "rotationType": "FIXED_PERIOD", "startDate": "1997-11-05T00:00:00Z", "viewId": "5IT9Agsjl5NmnSHh"}' \
    > test.out 2>&1
eval_tap $? 198 'CreateSection' test.out

#- 199 PurgeExpiredSection
./ng net.accelbyte.sdk.cli.Main platform purgeExpiredSection \
    --namespace "$AB_NAMESPACE" \
    --storeId 'xNmCe4txY0MsPc9E' \
    > test.out 2>&1
eval_tap $? 199 'PurgeExpiredSection' test.out

#- 200 GetSection
./ng net.accelbyte.sdk.cli.Main platform getSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'Mgf9JCJiEvhL8Zfw' \
    --storeId 'CVJW9yspUOyHC9eK' \
    > test.out 2>&1
eval_tap $? 200 'GetSection' test.out

#- 201 UpdateSection
./ng net.accelbyte.sdk.cli.Main platform updateSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId 'eXzrvzBllwzyC1aT' \
    --storeId 'WEmPgoy4TkpEw4Ze' \
    --body '{"active": false, "displayOrder": 8, "endDate": "1972-02-09T00:00:00Z", "ext": {"mRoFNxv10ckMQVjK": {}, "k3bWJ0ZuYSe3sI0x": {}, "2hc8vaN1Off5gRZZ": {}}, "fixedPeriodRotationConfig": {"backfillType": "NONE", "duration": 100, "itemCount": 91, "rule": "SEQUENCE"}, "items": [{"id": "huAIzBPWBYKAEFTd", "sku": "lKNh6GTzKjsCqxx2"}, {"id": "4QM35bSkFrvGciNH", "sku": "b7OY5YIpOLJW52uz"}, {"id": "3c8pz63M0g4xXT5T", "sku": "s4e0uR47OzUGHeBK"}], "localizations": {"tpvyRNgjZkdDppvE": {"description": "JiUiDGXgh8BKcLqt", "localExt": {"RZ93LuR8OEyICvwg": {}, "wBFehwtdJLdn3R2w": {}, "o8beVQvgeP9qOHaL": {}}, "longDescription": "wYnXxrz7sLmP70Lx", "title": "N0f3JA27Qz5SjzQf"}, "OLYu9O46OOzz9p57": {"description": "qSpHerzO87cg7Tqt", "localExt": {"MiQgi7Aj28qCRbww": {}, "Zc4ZS1NMkrnHs1Iy": {}, "hwqk140MolIrnlkR": {}}, "longDescription": "VbcX435TDYpkk2Gz", "title": "a6DrSycophHw3EoE"}, "EClTO9SDKnMlnKW9": {"description": "jiNMu9QVrMeD4bD8", "localExt": {"gISE34yIAZQeigiA": {}, "3wBrmBYIlZeheP72": {}, "AB8EO3YrlyrWowUp": {}}, "longDescription": "UDVLlTtuJJsHZVsG", "title": "6izJZruOJvSRFLDS"}}, "name": "dj8elbtHvDU91DmH", "rotationType": "FIXED_PERIOD", "startDate": "1979-07-07T00:00:00Z", "viewId": "rKWYOuITlYS2RYaD"}' \
    > test.out 2>&1
eval_tap $? 201 'UpdateSection' test.out

#- 202 DeleteSection
./ng net.accelbyte.sdk.cli.Main platform deleteSection \
    --namespace "$AB_NAMESPACE" \
    --sectionId '9WNKGhbLhjz1v0RB' \
    --storeId 'IO2rkJGmPaK6HEVI' \
    > test.out 2>&1
eval_tap $? 202 'DeleteSection' test.out

#- 203 ListStores
./ng net.accelbyte.sdk.cli.Main platform listStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 203 'ListStores' test.out

#- 204 CreateStore
./ng net.accelbyte.sdk.cli.Main platform createStore \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultLanguage": "QJd3930TGewjRyfo", "defaultRegion": "4nWVZZbKFsKOmgEh", "description": "jH2wFzCpxxJLfAg5", "supportedLanguages": ["cFT0gHAkltcR3eHF", "biAluHv7Hssd05pH", "BJX5ln8PZbYVD8Ri"], "supportedRegions": ["aTsdD4d3kSbTkHPM", "UvOAUXkw36cr2WJQ", "qS7Tq4YIyZAFQ6lZ"], "title": "fa2jdNvpWf32JS1a"}' \
    > test.out 2>&1
eval_tap $? 204 'CreateStore' test.out

#- 205 GetCatalogDefinition
./ng net.accelbyte.sdk.cli.Main platform getCatalogDefinition \
    --namespace "$AB_NAMESPACE" \
    --catalogType 'ITEM' \
    > test.out 2>&1
eval_tap $? 205 'GetCatalogDefinition' test.out

#- 206 DownloadCSVTemplates
./ng net.accelbyte.sdk.cli.Main platform downloadCSVTemplates \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 206 'DownloadCSVTemplates' test.out

#- 207 ExportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform exportStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --body '{"catalogType": "CATEGORY", "fieldsToBeIncluded": ["VNpVLT0LvqcfSdO1", "nAjY5FvADb3GUQgc", "i632w6LUrHuKBoNT"], "idsToBeExported": ["pPQXDNHto74GcmVf", "0fbCU9QdPuWeMEeL", "0EJG67g4W1eAmDxP"], "storeId": "23qstMuikKc6VNU8"}' \
    > test.out 2>&1
eval_tap $? 207 'ExportStoreByCSV' test.out

#- 208 ImportStore
eval_tap 0 208 'ImportStore # SKIP deprecated' test.out

#- 209 GetPublishedStore
./ng net.accelbyte.sdk.cli.Main platform getPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 209 'GetPublishedStore' test.out

#- 210 DeletePublishedStore
./ng net.accelbyte.sdk.cli.Main platform deletePublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 210 'DeletePublishedStore' test.out

#- 211 GetPublishedStoreBackup
./ng net.accelbyte.sdk.cli.Main platform getPublishedStoreBackup \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 211 'GetPublishedStoreBackup' test.out

#- 212 RollbackPublishedStore
./ng net.accelbyte.sdk.cli.Main platform rollbackPublishedStore \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 212 'RollbackPublishedStore' test.out

#- 213 GetStore
./ng net.accelbyte.sdk.cli.Main platform getStore \
    --namespace "$AB_NAMESPACE" \
    --storeId '570siWm3V9sirE0J' \
    > test.out 2>&1
eval_tap $? 213 'GetStore' test.out

#- 214 UpdateStore
./ng net.accelbyte.sdk.cli.Main platform updateStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'OQxWeHypqCWMDPRI' \
    --body '{"defaultLanguage": "2cCk8zHR8VyCC0EQ", "defaultRegion": "wE0cXokXbwKDtVmr", "description": "YQu7hZvHfiT9s9pK", "supportedLanguages": ["8HuUY1QQHQ0NCEdd", "Jtx6GV01vD7lNLxl", "pvqaB9P9GaukfCEI"], "supportedRegions": ["eSBLhTfzigzHcRuJ", "gYaj4I8Dzyh1N0JE", "KNoMtHvjM7X1fjzk"], "title": "nv2HZMIL2P2bh14L"}' \
    > test.out 2>&1
eval_tap $? 214 'UpdateStore' test.out

#- 215 DeleteStore
./ng net.accelbyte.sdk.cli.Main platform deleteStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'roFTnAuujPeP9N0v' \
    > test.out 2>&1
eval_tap $? 215 'DeleteStore' test.out

#- 216 QueryChanges
./ng net.accelbyte.sdk.cli.Main platform queryChanges \
    --namespace "$AB_NAMESPACE" \
    --storeId 'dVB5a2XkS3XQfMuz' \
    --action 'UPDATE' \
    --itemSku 'h4AhZRe2hgU56xty' \
    --itemType 'SEASON' \
    --limit '12' \
    --offset '41' \
    --selected  \
    --sortBy 'updatedAt:asc,createdAt:desc,createdAt:asc' \
    --status 'PUBLISHED' \
    --type 'SECTION' \
    --updatedAtEnd 'TDXu7FbleSP5PcdO' \
    --updatedAtStart 'uq0m0rvakR8rcwoj' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 216 'QueryChanges' test.out

#- 217 PublishAll
./ng net.accelbyte.sdk.cli.Main platform publishAll \
    --namespace "$AB_NAMESPACE" \
    --storeId 'LRjhcaJ56nGlYZ2t' \
    > test.out 2>&1
eval_tap $? 217 'PublishAll' test.out

#- 218 PublishSelected
./ng net.accelbyte.sdk.cli.Main platform publishSelected \
    --namespace "$AB_NAMESPACE" \
    --storeId 'od2BGBXjNyRCtPOr' \
    > test.out 2>&1
eval_tap $? 218 'PublishSelected' test.out

#- 219 SelectAllRecords
./ng net.accelbyte.sdk.cli.Main platform selectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId '1FU3QZy3gdDms3kb' \
    > test.out 2>&1
eval_tap $? 219 'SelectAllRecords' test.out

#- 220 SelectAllRecordsByCriteria
./ng net.accelbyte.sdk.cli.Main platform selectAllRecordsByCriteria \
    --namespace "$AB_NAMESPACE" \
    --storeId '1htW0UGJpwQZlXuz' \
    --action 'DELETE' \
    --itemSku 'FSMF0tfGIZCTNiIR' \
    --itemType 'APP' \
    --selected  \
    --type 'VIEW' \
    --updatedAtEnd '9fEjkZhEpAJMCxMp' \
    --updatedAtStart '2J0hDg2kMgkvhoQe' \
    > test.out 2>&1
eval_tap $? 220 'SelectAllRecordsByCriteria' test.out

#- 221 GetStatistic
./ng net.accelbyte.sdk.cli.Main platform getStatistic \
    --namespace "$AB_NAMESPACE" \
    --storeId '9gD9tGN0nE7M36mI' \
    --action 'DELETE' \
    --itemSku 'u3EeZtLQij2JXsqd' \
    --itemType 'SEASON' \
    --type 'CATEGORY' \
    --updatedAtEnd 'bcIMevTmC631p7q7' \
    --updatedAtStart '94bu49lINFTtERAX' \
    > test.out 2>&1
eval_tap $? 221 'GetStatistic' test.out

#- 222 UnselectAllRecords
./ng net.accelbyte.sdk.cli.Main platform unselectAllRecords \
    --namespace "$AB_NAMESPACE" \
    --storeId 'T2h3hcQ2wV3ZbBTn' \
    > test.out 2>&1
eval_tap $? 222 'UnselectAllRecords' test.out

#- 223 SelectRecord
./ng net.accelbyte.sdk.cli.Main platform selectRecord \
    --changeId 'NQnVUhA5WnzVZdj8' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'tsyzC4QaLXp3o4TD' \
    > test.out 2>&1
eval_tap $? 223 'SelectRecord' test.out

#- 224 UnselectRecord
./ng net.accelbyte.sdk.cli.Main platform unselectRecord \
    --changeId 'raEEaDNJbVd20FVH' \
    --namespace "$AB_NAMESPACE" \
    --storeId 'evCjthJUb7jKuMrF' \
    > test.out 2>&1
eval_tap $? 224 'UnselectRecord' test.out

#- 225 CloneStore
./ng net.accelbyte.sdk.cli.Main platform cloneStore \
    --namespace "$AB_NAMESPACE" \
    --storeId 'aoLulzp3sZxImVK5' \
    --targetStoreId 'yh2LcM8LaMW0Byjs' \
    > test.out 2>&1
eval_tap $? 225 'CloneStore' test.out

#- 226 ExportStore
eval_tap 0 226 'ExportStore # SKIP deprecated' test.out

#- 227 QueryImportHistory
./ng net.accelbyte.sdk.cli.Main platform queryImportHistory \
    --namespace "$AB_NAMESPACE" \
    --storeId 'RUrAHNRkIcC4wNFz' \
    --end 'sbrtYvLh56AWXoMi' \
    --limit '30' \
    --offset '67' \
    --sortBy 'wdWSs9DQ0VU1HED9' \
    --start 'CGo9aUXj3rh0Uyqx' \
    --success  \
    > test.out 2>&1
eval_tap $? 227 'QueryImportHistory' test.out

#- 228 ImportStoreByCSV
./ng net.accelbyte.sdk.cli.Main platform importStoreByCSV \
    --namespace "$AB_NAMESPACE" \
    --storeId 'VWlIMY5tTJw4KV10' \
    --category 'tmp.dat' \
    --display 'tmp.dat' \
    --item 'tmp.dat' \
    --notes '4MtMhKHmSjqPuQZX' \
    --section 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 228 'ImportStoreByCSV' test.out

#- 229 QuerySubscriptions
./ng net.accelbyte.sdk.cli.Main platform querySubscriptions \
    --namespace "$AB_NAMESPACE" \
    --chargeStatus 'CHARGE_FAILED' \
    --itemId 'KjdNrEwfWo2MwulL' \
    --limit '14' \
    --offset '37' \
    --sku '4bsO4YHEYLjTSNDf' \
    --status 'EXPIRED' \
    --subscribedBy 'USER' \
    --userId 'V4CXVMrDYKe2eTf1' \
    > test.out 2>&1
eval_tap $? 229 'QuerySubscriptions' test.out

#- 230 RecurringChargeSubscription
./ng net.accelbyte.sdk.cli.Main platform recurringChargeSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'axo16GqT2vSLLiMv' \
    > test.out 2>&1
eval_tap $? 230 'RecurringChargeSubscription' test.out

#- 231 GetTicketDynamic
./ng net.accelbyte.sdk.cli.Main platform getTicketDynamic \
    --boothName 'cu39YZJypWzpNXgn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 231 'GetTicketDynamic' test.out

#- 232 DecreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform decreaseTicketSale \
    --boothName 'oKIz8O8NglJtZTh2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"orderNo": "80vflFMxIhlIT8Ag"}' \
    > test.out 2>&1
eval_tap $? 232 'DecreaseTicketSale' test.out

#- 233 GetTicketBoothID
./ng net.accelbyte.sdk.cli.Main platform getTicketBoothID \
    --boothName 'yZJ16MMd2bzOrTn2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 233 'GetTicketBoothID' test.out

#- 234 IncreaseTicketSale
./ng net.accelbyte.sdk.cli.Main platform increaseTicketSale \
    --boothName 'huwPgyUzBUWiKoNG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"count": 41, "orderNo": "UESLlwHv3JgteOLy"}' \
    > test.out 2>&1
eval_tap $? 234 'IncreaseTicketSale' test.out

#- 235 Commit
./ng net.accelbyte.sdk.cli.Main platform commit \
    --namespace "$AB_NAMESPACE" \
    --body '{"actions": [{"operations": [{"creditPayload": {"balanceOrigin": "Twitch", "count": 24, "currencyCode": "p8a1VqxXnRhDd9TG", "expireAt": "1976-04-29T00:00:00Z"}, "debitPayload": {"count": 82, "currencyCode": "hewKkVuGv9fQXkEr", "walletPlatform": "Xbox"}, "fulFillItemPayload": {"count": 62, "entitlementCollectionId": "0drbYrrFQP6rW62C", "entitlementOrigin": "Other", "itemIdentity": "vC1cr5T1PSXhduTW", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 66, "entitlementId": "hzXDv3TAtBjP4HSu"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Nintendo", "count": 58, "currencyCode": "EQv2Oj8TFNeGtJGj", "expireAt": "1989-01-29T00:00:00Z"}, "debitPayload": {"count": 2, "currencyCode": "tU0CDrlQpKB8qoel", "walletPlatform": "Epic"}, "fulFillItemPayload": {"count": 87, "entitlementCollectionId": "KStqdKu4ROnONpJ8", "entitlementOrigin": "Nintendo", "itemIdentity": "9chqeiUGQMwNwDlY", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 23, "entitlementId": "F30RT9rBgM8o7lxX"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "Playstation", "count": 16, "currencyCode": "TkdM7FVDCBcvVegr", "expireAt": "1997-08-24T00:00:00Z"}, "debitPayload": {"count": 7, "currencyCode": "UGRGcCEPjbUy7F82", "walletPlatform": "Playstation"}, "fulFillItemPayload": {"count": 79, "entitlementCollectionId": "du9BYRHrVTehrqgv", "entitlementOrigin": "Steam", "itemIdentity": "bprKX68jTyRd3LrR", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 47, "entitlementId": "DoC9FnxqBlPBYJ7X"}, "type": "FULFILL_ITEM"}], "userId": "vPj90jmLTt5YQGaw"}, {"operations": [{"creditPayload": {"balanceOrigin": "Epic", "count": 19, "currencyCode": "omPoiYoQ1f1AYq30", "expireAt": "1992-05-13T00:00:00Z"}, "debitPayload": {"count": 50, "currencyCode": "JTUQY40Zrpn0vAD9", "walletPlatform": "Oculus"}, "fulFillItemPayload": {"count": 34, "entitlementCollectionId": "PeDWrAVQZSvgWuCu", "entitlementOrigin": "Twitch", "itemIdentity": "ig6YcDA8Z3g62oGY", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 75, "entitlementId": "krjLI4EHJEEWgki9"}, "type": "CREDIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 3, "currencyCode": "na8DdjtZhh6ofsUo", "expireAt": "1993-02-26T00:00:00Z"}, "debitPayload": {"count": 32, "currencyCode": "6r0e0J6vyqPw7Ylm", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 23, "entitlementCollectionId": "kES0Hi88UYgSV40O", "entitlementOrigin": "Other", "itemIdentity": "V29QsQk100eu5Ucx", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 74, "entitlementId": "XXpt0YSPX04uEIdA"}, "type": "FULFILL_ITEM"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 13, "currencyCode": "HMz9dddLWJWDuSYt", "expireAt": "1985-11-06T00:00:00Z"}, "debitPayload": {"count": 1, "currencyCode": "yH9kcSBdk7MwQzn2", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 29, "entitlementCollectionId": "neohqhCzroAzWQDv", "entitlementOrigin": "GooglePlay", "itemIdentity": "T0WK5ngNUxDKfZYo", "itemIdentityType": "ITEM_ID"}, "revokeEntitlementPayload": {"count": 11, "entitlementId": "PGUbSaA00nKxQjYU"}, "type": "CREDIT_WALLET"}], "userId": "KlavIiLxU2I1GyJS"}, {"operations": [{"creditPayload": {"balanceOrigin": "Playstation", "count": 68, "currencyCode": "ZLHW882riiPfRQ3r", "expireAt": "1989-08-09T00:00:00Z"}, "debitPayload": {"count": 13, "currencyCode": "f5lwXvRNDBnmL1KQ", "walletPlatform": "Nintendo"}, "fulFillItemPayload": {"count": 34, "entitlementCollectionId": "7hiP1lzkzjYDw6mL", "entitlementOrigin": "Steam", "itemIdentity": "iEUqnzxs2deMF8UA", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 61, "entitlementId": "9K9Yb68a8ygYx2Tq"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "GooglePlay", "count": 52, "currencyCode": "lqMnE9Wj90EQzOid", "expireAt": "1979-05-25T00:00:00Z"}, "debitPayload": {"count": 99, "currencyCode": "yt4XTNwpp0ni1YfI", "walletPlatform": "GooglePlay"}, "fulFillItemPayload": {"count": 57, "entitlementCollectionId": "LZ4YIzElrLZOBLHC", "entitlementOrigin": "Twitch", "itemIdentity": "5iasunESjcgr2drX", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 96, "entitlementId": "NkKCySLA8cKCs0dF"}, "type": "DEBIT_WALLET"}, {"creditPayload": {"balanceOrigin": "Xbox", "count": 0, "currencyCode": "KGRUMrimGAz6OhmH", "expireAt": "1991-05-06T00:00:00Z"}, "debitPayload": {"count": 32, "currencyCode": "LhMF2Pav11FuU8iX", "walletPlatform": "Steam"}, "fulFillItemPayload": {"count": 83, "entitlementCollectionId": "Rz8KgqgwijYxpGhs", "entitlementOrigin": "System", "itemIdentity": "4txul6VKYlNYYlHP", "itemIdentityType": "ITEM_SKU"}, "revokeEntitlementPayload": {"count": 59, "entitlementId": "KDpJmkeoAkp3Z4pg"}, "type": "REVOKE_ENTITLEMENT"}], "userId": "p6R8mYZwKftVqSEC"}], "metadata": {"sypS42NmYQ8HlHbH": {}, "nfs4tLVOYQCWMktm": {}, "iKd9vLPP0w52JRAZ": {}}, "needPreCheck": true, "transactionId": "qPNDqWrpkWnnova1", "type": "5WVuE5cYVP9tQSa2"}' \
    > test.out 2>&1
eval_tap $? 235 'Commit' test.out

#- 236 GetTradeHistoryByCriteria
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByCriteria \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '57' \
    --status 'FAILED' \
    --type 'TWjAh4gy41LLzQ2I' \
    --userId 'jY5PeNr4JmYxH2qs' \
    > test.out 2>&1
eval_tap $? 236 'GetTradeHistoryByCriteria' test.out

#- 237 GetTradeHistoryByTransactionId
./ng net.accelbyte.sdk.cli.Main platform getTradeHistoryByTransactionId \
    --namespace "$AB_NAMESPACE" \
    --transactionId '28hePJjMp0TKKUBf' \
    > test.out 2>&1
eval_tap $? 237 'GetTradeHistoryByTransactionId' test.out

#- 238 UnlockSteamUserAchievement
./ng net.accelbyte.sdk.cli.Main platform unlockSteamUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'PNI9f2oLWDPSZexf' \
    --body '{"achievements": [{"id": "KVxqdxmh5QWxuQuI", "value": 5}, {"id": "gdDTDb3WdnOpzTrR", "value": 52}, {"id": "OusNEHcI95GGdJvu", "value": 4}], "steamUserId": "wJZquMQSPp5XD4S1"}' \
    > test.out 2>&1
eval_tap $? 238 'UnlockSteamUserAchievement' test.out

#- 239 GetXblUserAchievements
./ng net.accelbyte.sdk.cli.Main platform getXblUserAchievements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ilfgff7Et4uY8nlB' \
    --xboxUserId 'wGNHgfgwZwVMvshG' \
    > test.out 2>&1
eval_tap $? 239 'GetXblUserAchievements' test.out

#- 240 UpdateXblUserAchievement
./ng net.accelbyte.sdk.cli.Main platform updateXblUserAchievement \
    --namespace "$AB_NAMESPACE" \
    --userId 'msg6ZJYnkHDnHTlR' \
    --body '{"achievements": [{"id": "ugM7a2UZgeesipbP", "percentComplete": 49}, {"id": "27okM5E8tAajVSvL", "percentComplete": 90}, {"id": "CJ7LzpFvOSF6xKA6", "percentComplete": 50}], "serviceConfigId": "YZBkatNLc42eq0O6", "titleId": "VsXtOlQwj5xPvm7c", "xboxUserId": "5nPR0Y1sffUaZ64d"}' \
    > test.out 2>&1
eval_tap $? 240 'UpdateXblUserAchievement' test.out

#- 241 AnonymizeCampaign
./ng net.accelbyte.sdk.cli.Main platform anonymizeCampaign \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fpiv8o9Gw4QtKgyI' \
    > test.out 2>&1
eval_tap $? 241 'AnonymizeCampaign' test.out

#- 242 AnonymizeEntitlement
./ng net.accelbyte.sdk.cli.Main platform anonymizeEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'eySoUxoMrj2J4JGQ' \
    > test.out 2>&1
eval_tap $? 242 'AnonymizeEntitlement' test.out

#- 243 AnonymizeFulfillment
./ng net.accelbyte.sdk.cli.Main platform anonymizeFulfillment \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZAtyjTxnlmSyjEaF' \
    > test.out 2>&1
eval_tap $? 243 'AnonymizeFulfillment' test.out

#- 244 AnonymizeIntegration
./ng net.accelbyte.sdk.cli.Main platform anonymizeIntegration \
    --namespace "$AB_NAMESPACE" \
    --userId 'H2DRN6HIEqIFEcS0' \
    > test.out 2>&1
eval_tap $? 244 'AnonymizeIntegration' test.out

#- 245 AnonymizeOrder
./ng net.accelbyte.sdk.cli.Main platform anonymizeOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'ynIMOYWpUYUQMooi' \
    > test.out 2>&1
eval_tap $? 245 'AnonymizeOrder' test.out

#- 246 AnonymizePayment
./ng net.accelbyte.sdk.cli.Main platform anonymizePayment \
    --namespace "$AB_NAMESPACE" \
    --userId 'KT57rmbjEnimeR7E' \
    > test.out 2>&1
eval_tap $? 246 'AnonymizePayment' test.out

#- 247 AnonymizeRevocation
./ng net.accelbyte.sdk.cli.Main platform anonymizeRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId 'FBz43E9FkOPVu2fD' \
    > test.out 2>&1
eval_tap $? 247 'AnonymizeRevocation' test.out

#- 248 AnonymizeSubscription
./ng net.accelbyte.sdk.cli.Main platform anonymizeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'tOjW1iSYQbcebBd5' \
    > test.out 2>&1
eval_tap $? 248 'AnonymizeSubscription' test.out

#- 249 AnonymizeWallet
./ng net.accelbyte.sdk.cli.Main platform anonymizeWallet \
    --namespace "$AB_NAMESPACE" \
    --userId 'wb5H3qppoCiHMD4i' \
    > test.out 2>&1
eval_tap $? 249 'AnonymizeWallet' test.out

#- 250 GetUserDLCByPlatform
./ng net.accelbyte.sdk.cli.Main platform getUserDLCByPlatform \
    --namespace "$AB_NAMESPACE" \
    --userId 'BK2O7qYtOHV5hnpj' \
    --type 'EPICGAMES' \
    > test.out 2>&1
eval_tap $? 250 'GetUserDLCByPlatform' test.out

#- 251 GetUserDLC
./ng net.accelbyte.sdk.cli.Main platform getUserDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'VylINJpxFY8E6pU8' \
    --includeAllNamespaces  \
    --status 'FULFILLED' \
    --type 'OCULUS' \
    > test.out 2>&1
eval_tap $? 251 'GetUserDLC' test.out

#- 252 QueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hjh0aTjIOaQt0snb' \
    --activeOnly  \
    --appType 'SOFTWARE' \
    --collectionId '3fjSRaXD4HDmdvhM' \
    --entitlementClazz 'SUBSCRIPTION' \
    --entitlementName 'jJiu7BIimNuwB3hB' \
    --features 'VhuSMHhf5R2MkxQT,AYGfE6hXZ7XLoWCG,f0dZEeXBd6mGG6SH' \
    --fuzzyMatchName  \
    --ignoreActiveDate  \
    --itemId 'cZbX2wNnT6A9zosm,DnXoncy7NZQ4PkAP,XBCfkE1Fb0y94eP7' \
    --limit '50' \
    --offset '6' \
    --origin 'GooglePlay' \
    > test.out 2>&1
eval_tap $? 252 'QueryUserEntitlements' test.out

#- 253 GrantUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform grantUserEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'fFnOfY9stXH6LYXX' \
    --body '[{"collectionId": "MndxBPKmHVB7cNzH", "endDate": "1974-03-01T00:00:00Z", "grantedCode": "vxc4xAPZ86WNnQOh", "itemId": "usPn4466u8agb5HP", "itemNamespace": "sBU0Eo6QJ9vBRJ4U", "language": "ouIF", "metadata": {"6LwcAg57BYBVCbi0": {}, "ifdPyKf3SwHekWIz": {}, "4rXlH5jw99HxCjXW": {}}, "origin": "Epic", "quantity": 84, "region": "aXBcfXXeV7BXefsS", "source": "GIFT", "startDate": "1997-12-03T00:00:00Z", "storeId": "xSYnVwXqF6K0WA76"}, {"collectionId": "Kl2mHHoz6qBQnEDg", "endDate": "1996-07-25T00:00:00Z", "grantedCode": "49n1xTDFcmOm1sqd", "itemId": "IWU6ERylESgf5dXM", "itemNamespace": "rPoYSohfrLyXMSrC", "language": "YTx_tGYM", "metadata": {"NGfufW5cWeg6eSCy": {}, "psceITTkJGGCVF6L": {}, "rILDLviUCzmDAaW5": {}}, "origin": "Playstation", "quantity": 90, "region": "z1c7ZuZXUCBYnkY0", "source": "REFERRAL_BONUS", "startDate": "1996-08-06T00:00:00Z", "storeId": "A3mcyMmX6WF8jtNA"}, {"collectionId": "VOYqSH533YlJ93CC", "endDate": "1987-07-30T00:00:00Z", "grantedCode": "BXv4fP4VPzhcH4UJ", "itemId": "rrCKvrOAi7lMgkVW", "itemNamespace": "JYzSCIDxWUxgOzeR", "language": "ficj-438", "metadata": {"1fHUyirMVMOFES2J": {}, "2OzNlJE3uqZz574g": {}, "31cA0PwZxTIZVSGQ": {}}, "origin": "Playstation", "quantity": 16, "region": "Tzhs9Asy4d629N4Y", "source": "OTHER", "startDate": "1999-04-27T00:00:00Z", "storeId": "sQuWUBBHZonSmzF8"}]' \
    > test.out 2>&1
eval_tap $? 253 'GrantUserEntitlement' test.out

#- 254 GetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '31vlCiZAZHCWMXxV' \
    --activeOnly  \
    --appId 'h8HTrKqVwnpPn8N5' \
    > test.out 2>&1
eval_tap $? 254 'GetUserAppEntitlementByAppId' test.out

#- 255 QueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform queryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'xMRgU7cPqNZrLCRR' \
    --activeOnly  \
    --limit '95' \
    --offset '53' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 255 'QueryUserEntitlementsByAppType' test.out

#- 256 GetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId '9IltQUku3n32atB0' \
    --ids 'QPQPEp5UtwUWGt6t,ooHP5kAww01zalTd,dhAQ1pwqnybvUIfu' \
    > test.out 2>&1
eval_tap $? 256 'GetUserEntitlementsByIds' test.out

#- 257 GetUserEntitlementByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'ulmeegRwPPbn7ltt' \
    --activeOnly  \
    --entitlementClazz 'APP' \
    --platform 'DN3Boi2sSAO2n4MZ' \
    --itemId 'Qt753XQB93rOW0gu' \
    > test.out 2>&1
eval_tap $? 257 'GetUserEntitlementByItemId' test.out

#- 258 GetUserActiveEntitlementsByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserActiveEntitlementsByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'PoQbYzc1RDVhs2lh' \
    --ids 'dzxxgibuqUuyW3cM,z9YyduMomEHcU15S,t4v8ry8IyqNVv0KV' \
    --platform 'pXJTMx3Y8Um1iqeh' \
    > test.out 2>&1
eval_tap $? 258 'GetUserActiveEntitlementsByItemIds' test.out

#- 259 GetUserEntitlementBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'Obg3OZ9j0HDtbqMF' \
    --activeOnly  \
    --entitlementClazz 'CODE' \
    --platform 'iKBGm5Cj7RqnJUmf' \
    --sku 'DmofxvN8pRGoUtmb' \
    > test.out 2>&1
eval_tap $? 259 'GetUserEntitlementBySku' test.out

#- 260 ExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId 'WZbEjPyq35BWDoc3' \
    --appIds 'qNcQFFyHv141NPqj,RUMKSQjFdjqTaZFs,WzbqwTZQIN5jC6a8' \
    --itemIds 'mEVCXHmFnrSL0PJc,ZQaCeNLYxMID9pqZ,5rryiMMt6fQtLhzy' \
    --platform 'laquioT3QBt29AiR' \
    --skus 'ASsuFM4ahGw7XcF1,Qwzz606UGXPhoNZl,XMef7AvS3TfKx6By' \
    > test.out 2>&1
eval_tap $? 260 'ExistsAnyUserActiveEntitlement' test.out

#- 261 ExistsAnyUserActiveEntitlementByItemIds
./ng net.accelbyte.sdk.cli.Main platform existsAnyUserActiveEntitlementByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'TygbtOtcQS4Cmgw1' \
    --platform 'wRUnIVYxY6OhdkrY' \
    --itemIds 'iCinoVOzo4Plv1Il,TpEhjTFYdzsUNvQA,n2LuMjLqwmVz3zKs' \
    > test.out 2>&1
eval_tap $? 261 'ExistsAnyUserActiveEntitlementByItemIds' test.out

#- 262 GetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform getUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fjz1mFkyxoUzfMFo' \
    --appId 'XCOguSq2A4R3wDdS' \
    > test.out 2>&1
eval_tap $? 262 'GetUserAppEntitlementOwnershipByAppId' test.out

#- 263 GetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'kNfHJtA3QiX9Zvty' \
    --entitlementClazz 'APP' \
    --platform 'C3I1SjkH42LtyZKr' \
    --itemId 'TJo0L5sHil4Q0mqa' \
    > test.out 2>&1
eval_tap $? 263 'GetUserEntitlementOwnershipByItemId' test.out

#- 264 GetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId '8GatrjbJ5YT7uvqa' \
    --ids 'rTvrG1DXZAWlvz3c,3XALMresGFfsH4aX,CDhshvEF8rHd250n' \
    --platform 'yihcUVGHQczI5ZoT' \
    > test.out 2>&1
eval_tap $? 264 'GetUserEntitlementOwnershipByItemIds' test.out

#- 265 GetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'RUkjGoRkPs2SO9Xr' \
    --entitlementClazz 'APP' \
    --platform 'C3rpWhSpq0InxMLp' \
    --sku 'P7n7M3JXjEvsj5Wc' \
    > test.out 2>&1
eval_tap $? 265 'GetUserEntitlementOwnershipBySku' test.out

#- 266 RevokeAllEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeAllEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q99M1yuXeqV31LX2' \
    > test.out 2>&1
eval_tap $? 266 'RevokeAllEntitlements' test.out

#- 267 RevokeUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'ehcMnM6QtjzQjDlU' \
    --entitlementIds 'MCGnxZwak7KHnzGA' \
    > test.out 2>&1
eval_tap $? 267 'RevokeUserEntitlements' test.out

#- 268 GetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlement \
    --entitlementId 'SmVzePIroz41oQCu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XeTRyJQrNLTcqLVT' \
    > test.out 2>&1
eval_tap $? 268 'GetUserEntitlement' test.out

#- 269 UpdateUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform updateUserEntitlement \
    --entitlementId 'N5Qf4tjPGpu27yxb' \
    --namespace "$AB_NAMESPACE" \
    --userId '1of79zVTWIfgdNph' \
    --body '{"collectionId": "qe9fS1m77MAg4KoZ", "endDate": "1992-04-02T00:00:00Z", "nullFieldList": ["PLhDSJx9jzxaRKph", "4kiIFgS4fLqlrKGi", "S3XxjkyNfj3XgTRT"], "origin": "IOS", "reason": "94flh775AQfzNjQ7", "startDate": "1988-06-11T00:00:00Z", "status": "ACTIVE", "useCount": 79}' \
    > test.out 2>&1
eval_tap $? 269 'UpdateUserEntitlement' test.out

#- 270 ConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform consumeUserEntitlement \
    --entitlementId 'SpMny0GrvKI5EVB9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZFzLNsjdCFtKY0Ks' \
    --body '{"metadata": {"xR0rCFkyiQZfMnTb": {}, "KdwNhiIP7dpJ8B8V": {}, "wFQnVco2oCn1KvJm": {}}, "options": ["bjapW9UlEqtzDd7S", "gxdxB5kvtM8ah9bP", "sksceGUEX8ERZcKS"], "platform": "YLo6y7yJMowQ6LpH", "requestId": "CvCYTgX9JQwErzjt", "useCount": 41}' \
    > test.out 2>&1
eval_tap $? 270 'ConsumeUserEntitlement' test.out

#- 271 DisableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform disableUserEntitlement \
    --entitlementId 'wB2TY4v9NNfQSYLF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KSl3FNFFJnt3rIwZ' \
    > test.out 2>&1
eval_tap $? 271 'DisableUserEntitlement' test.out

#- 272 EnableUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform enableUserEntitlement \
    --entitlementId 'dW02Su6aCnL816aH' \
    --namespace "$AB_NAMESPACE" \
    --userId '6gOBUIMeL0GL3aef' \
    > test.out 2>&1
eval_tap $? 272 'EnableUserEntitlement' test.out

#- 273 GetUserEntitlementHistories
./ng net.accelbyte.sdk.cli.Main platform getUserEntitlementHistories \
    --entitlementId 'SDME8X2MxILI42BJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MPkZmay4Csye3iJL' \
    > test.out 2>&1
eval_tap $? 273 'GetUserEntitlementHistories' test.out

#- 274 RevokeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlement \
    --entitlementId 'tjsu6ZJRCoDq3geu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HFFaZzPIjETqcKN1' \
    --body '{"metadata": {"gaQ4Bn0cPPtKaJlw": {}, "31pdDrXQ47WSGyDC": {}, "KF0LLhO3lGZ7eGOP": {}}}' \
    > test.out 2>&1
eval_tap $? 274 'RevokeUserEntitlement' test.out

#- 275 RevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform revokeUserEntitlementByUseCount \
    --entitlementId 'j2XoFug8BUQUmPHn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PumcazKAna0ji757' \
    --body '{"reason": "aNDFeKnQP2j2WsQI", "useCount": 25}' \
    > test.out 2>&1
eval_tap $? 275 'RevokeUserEntitlementByUseCount' test.out

#- 276 PreCheckRevokeUserEntitlementByUseCount
./ng net.accelbyte.sdk.cli.Main platform preCheckRevokeUserEntitlementByUseCount \
    --entitlementId 'duN4gx0UC6eWKCFG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S97Si6XyLVPrkUxy' \
    --quantity '22' \
    > test.out 2>&1
eval_tap $? 276 'PreCheckRevokeUserEntitlementByUseCount' test.out

#- 277 RevokeUseCount
eval_tap 0 277 'RevokeUseCount # SKIP deprecated' test.out

#- 278 SellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform sellUserEntitlement \
    --entitlementId '1OH5Nn4nMT8QOyTu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'USD9ImtaPAocOQcp' \
    --body '{"platform": "BWSNrCjSNEAdojkC", "requestId": "MmYyTGO07foRZ6Fu", "useCount": 19}' \
    > test.out 2>&1
eval_tap $? 278 'SellUserEntitlement' test.out

#- 279 FulfillItem
./ng net.accelbyte.sdk.cli.Main platform fulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId '9PSsquWUafwbFPX1' \
    --body '{"duration": 58, "endDate": "1990-02-17T00:00:00Z", "entitlementCollectionId": "3pFgA7i9tqvfHmFv", "entitlementOrigin": "Xbox", "itemId": "ZiUW5Y0CYw5OXSGw", "itemSku": "QkJuy9oLFcHHcraL", "language": "XR2n9JQvq7NKWIHY", "metadata": {"sii3fCh7sieJjZPA": {}, "kiWumllU31uXPwYx": {}, "edGHCIkmt4bfJOhN": {}}, "order": {"currency": {"currencyCode": "aIT0pv7XeqO8gY3c", "currencySymbol": "4SryWB4yRaDxvxwa", "currencyType": "VIRTUAL", "decimals": 79, "namespace": "EzHGTt9emdCLmzJb"}, "ext": {"dkykVAnmnRfUilcK": {}, "A84d9pMsl7zrNJvD": {}, "iP2hNNEI8QrQ6H1r": {}}, "free": false}, "orderNo": "3s9UyeaFi8OE7BCK", "origin": "Epic", "overrideBundleItemQty": {"FeVGrl5NpUG9zblW": 62, "6409vFd5z9r4nJWU": 43, "3slUe94NxhXsVcqT": 33}, "quantity": 16, "region": "3uIffkIpPmrWVxNZ", "source": "PROMOTION", "startDate": "1982-05-13T00:00:00Z", "storeId": "kiU2jXSwsBBRopVl"}' \
    > test.out 2>&1
eval_tap $? 279 'FulfillItem' test.out

#- 280 RedeemCode
./ng net.accelbyte.sdk.cli.Main platform redeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId '38d4NZGtk6EmWxC7' \
    --body '{"code": "5M88TKhFYkA9aRND", "language": "wj_nRuG", "region": "cg0OTT9JA0ll1Rim"}' \
    > test.out 2>&1
eval_tap $? 280 'RedeemCode' test.out

#- 281 PreCheckFulfillItem
./ng net.accelbyte.sdk.cli.Main platform preCheckFulfillItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'BCiQwuyrI87uSyXP' \
    --body '{"itemId": "6C0jXS8au2wcWYyj", "itemSku": "3JvHqXp4JR7xI59Z", "quantity": 71}' \
    > test.out 2>&1
eval_tap $? 281 'PreCheckFulfillItem' test.out

#- 282 FulfillRewards
./ng net.accelbyte.sdk.cli.Main platform fulfillRewards \
    --namespace "$AB_NAMESPACE" \
    --userId 'tfGVsglnOxOXBfgB' \
    --body '{"entitlementCollectionId": "Luglkd9LIoshGnFS", "entitlementOrigin": "Other", "metadata": {"PYpnPqGlPnhBDOWq": {}, "DU8N3DjVUt0n0jfy": {}, "DbtIXICLkK8ZvbnT": {}}, "origin": "GooglePlay", "rewards": [{"currency": {"currencyCode": "xbtpSKOfiIP3S6py", "namespace": "pZqISn3msrykQFtW"}, "item": {"itemId": "8QGKFZLrIfqrZuu7", "itemName": "IwKcT7sAsv2TKCbY", "itemSku": "MVkXEHmsHwIGGsus", "itemType": "S0zZRODEKPdudZsL"}, "quantity": 0, "type": "CURRENCY"}, {"currency": {"currencyCode": "f8aZrXW84dt0TSTm", "namespace": "y7XF26K2U7xttUz8"}, "item": {"itemId": "nWKJjv06PuffHghA", "itemName": "QfAsYXVzBenLtaAo", "itemSku": "YyRfiCWrm3s1Ah3T", "itemType": "II70MIcBMJ04508j"}, "quantity": 74, "type": "CURRENCY"}, {"currency": {"currencyCode": "LLoPZrkjRm5Ki0or", "namespace": "hXrISEaPZHLQkTHv"}, "item": {"itemId": "ndQsCKAO2JRz3CGw", "itemName": "tujkzxidLcAQWGVR", "itemSku": "g6DVso5TJCSugdo4", "itemType": "XTm8t1YTWqItjNWX"}, "quantity": 26, "type": "CURRENCY"}], "source": "PAYMENT", "transactionId": "sraeMA78YSRS2fPy"}' \
    > test.out 2>&1
eval_tap $? 282 'FulfillRewards' test.out

#- 283 QueryUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId '5fpbbbMIu9lu18jI' \
    --endTime 'MBUM77XmemN8LO03' \
    --limit '25' \
    --offset '28' \
    --productId 'G4v5D6ylZguO918X' \
    --startTime '7rLoexHBMBMMAYok' \
    --status 'VERIFIED' \
    --type 'XBOX' \
    > test.out 2>&1
eval_tap $? 283 'QueryUserIAPOrders' test.out

#- 284 QueryAllUserIAPOrders
./ng net.accelbyte.sdk.cli.Main platform queryAllUserIAPOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'AfYIyzHL8jxakuVu' \
    > test.out 2>&1
eval_tap $? 284 'QueryAllUserIAPOrders' test.out

#- 285 QueryUserIAPConsumeHistory
./ng net.accelbyte.sdk.cli.Main platform queryUserIAPConsumeHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '5r5B08VZxI4TU3ap' \
    --endTime 'nZXoJ4gI4EQKO8xC' \
    --limit '60' \
    --offset '70' \
    --startTime 'FsUo3IB2kX5REQZs' \
    --status 'SUCCESS' \
    --type 'STEAM' \
    > test.out 2>&1
eval_tap $? 285 'QueryUserIAPConsumeHistory' test.out

#- 286 MockFulfillIAPItem
./ng net.accelbyte.sdk.cli.Main platform mockFulfillIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'y5Ihr531Kajxq7lz' \
    --body '{"itemIdentityType": "ITEM_SKU", "language": "wDs", "productId": "EvhKIbrq1xsGpdob", "region": "Yun8hcO55hVjfWyK", "transactionId": "02w5QytAmkanukAz", "type": "STEAM"}' \
    > test.out 2>&1
eval_tap $? 286 'MockFulfillIAPItem' test.out

#- 287 AdminGetIAPOrderLineItems
./ng net.accelbyte.sdk.cli.Main platform adminGetIAPOrderLineItems \
    --iapOrderNo 'mLkkAMjHyI0e2Axj' \
    --namespace "$AB_NAMESPACE" \
    --userId '0nZHjmoKHJngwMe1' \
    > test.out 2>&1
eval_tap $? 287 'AdminGetIAPOrderLineItems' test.out

#- 288 AdminSyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'AnQVj6QQjZtkNJCn' \
    > test.out 2>&1
eval_tap $? 288 'AdminSyncSteamAbnormalTransaction' test.out

#- 289 AdminSyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform adminSyncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'DSrsSey2BqOxgwCy' \
    --body '{"orderId": "mCDYsuff3b7G5FDX"}' \
    > test.out 2>&1
eval_tap $? 289 'AdminSyncSteamIAPByTransaction' test.out

#- 290 QueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '4mu0qPHb9Ll2EFEb' \
    --activeOnly  \
    --groupId '8GnsthmQ2Y6ZGOiq' \
    --limit '35' \
    --offset '65' \
    --platform 'EPICGAMES' \
    --productId 'N5JL9M53Mg0MzWS9' \
    > test.out 2>&1
eval_tap $? 290 'QueryUserThirdPartySubscription' test.out

#- 291 GetThirdPartyPlatformSubscriptionOwnershipByGroupId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByGroupId \
    --namespace "$AB_NAMESPACE" \
    --platform 'STADIA' \
    --userId 'RzbhMxfEDE4TrtIH' \
    --groupId 'yyMq79EdB9MxaF8Q' \
    > test.out 2>&1
eval_tap $? 291 'GetThirdPartyPlatformSubscriptionOwnershipByGroupId' test.out

#- 292 GetThirdPartyPlatformSubscriptionOwnershipByProductId
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyPlatformSubscriptionOwnershipByProductId \
    --namespace "$AB_NAMESPACE" \
    --platform 'XBOX' \
    --userId 'gSj8kcNhoqcRZRNA' \
    --productId 'TojM7daV0VwR3yNK' \
    > test.out 2>&1
eval_tap $? 292 'GetThirdPartyPlatformSubscriptionOwnershipByProductId' test.out

#- 293 QueryUserThirdPartySubscriptionTransactions
./ng net.accelbyte.sdk.cli.Main platform queryUserThirdPartySubscriptionTransactions \
    --namespace "$AB_NAMESPACE" \
    --userId 'DtMqMrAGpdyF6WDH' \
    --activeOnly  \
    --groupId 'n3ePBxQNz2IUEHMz' \
    --limit '23' \
    --offset '27' \
    --platform 'GOOGLE' \
    --productId 'nEzoUlUWqP4ElzL4' \
    > test.out 2>&1
eval_tap $? 293 'QueryUserThirdPartySubscriptionTransactions' test.out

#- 294 GetThirdPartySubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartySubscriptionDetails \
    --id '4KEm3uHBMCP5ckjp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hURs4ksgsKJ2R6Ja' \
    > test.out 2>&1
eval_tap $? 294 'GetThirdPartySubscriptionDetails' test.out

#- 295 GetSubscriptionHistory
./ng net.accelbyte.sdk.cli.Main platform getSubscriptionHistory \
    --id 'cwwu8W1zvrKMRPvw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9k6yJz03NETdywP' \
    --limit '34' \
    --offset '17' \
    > test.out 2>&1
eval_tap $? 295 'GetSubscriptionHistory' test.out

#- 296 SyncSubscriptionTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSubscriptionTransaction \
    --id 'YerrpOm4M2pM4fIf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cHBWZM50aHbPXRns' \
    > test.out 2>&1
eval_tap $? 296 'SyncSubscriptionTransaction' test.out

#- 297 GetThirdPartyUserSubscriptionDetails
./ng net.accelbyte.sdk.cli.Main platform getThirdPartyUserSubscriptionDetails \
    --id '3qwYL6LwGlZGF7XQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PLAcIL7FvAMWqhyy' \
    > test.out 2>&1
eval_tap $? 297 'GetThirdPartyUserSubscriptionDetails' test.out

#- 298 SyncSubscription
./ng net.accelbyte.sdk.cli.Main platform syncSubscription \
    --id 'NZH1CducB5y5iMde' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BG7REG4meKEabfVX' \
    > test.out 2>&1
eval_tap $? 298 'SyncSubscription' test.out

#- 299 QueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform queryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJPIZqZC5d6JuFdc' \
    --discounted  \
    --itemId 'fiNf0DOHKwxDF5GJ' \
    --limit '14' \
    --offset '1' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 299 'QueryUserOrders' test.out

#- 300 AdminCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform adminCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'DWh9JV5oc5IFQsrw' \
    --body '{"currencyCode": "HqFqwVA5mozeeOjI", "currencyNamespace": "FQfXV3YW3ug3nCXh", "discountCodes": ["U5xJBhIpJ9b0Ap7C", "seIRXeoerZAxbDPX", "D7FUz1iOe0pHa0Lm"], "discountedPrice": 26, "entitlementPlatform": "Nintendo", "ext": {"iKPjcwAw5GdxpvLf": {}, "a4b4hTaZBGdX66Dq": {}, "PTdurR3MYda0Y0BC": {}}, "itemId": "O4qPnvxERWjKasq5", "language": "zQ6uZNwKjnX7vDIq", "options": {"skipPriceValidation": true}, "platform": "Epic", "price": 55, "quantity": 19, "region": "stguOdN0O7l3GbKP", "returnUrl": "HdDTQDEEE2mTsn1N", "sandbox": true, "sectionId": "txB10d4Q8nlBthUS"}' \
    > test.out 2>&1
eval_tap $? 300 'AdminCreateUserOrder' test.out

#- 301 CountOfPurchasedItem
./ng net.accelbyte.sdk.cli.Main platform countOfPurchasedItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'u4WNfTvD5UcES1eL' \
    --itemId 'MZs9lSQVDp16qVIq' \
    > test.out 2>&1
eval_tap $? 301 'CountOfPurchasedItem' test.out

#- 302 GetUserOrder
./ng net.accelbyte.sdk.cli.Main platform getUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XCK9dS5JTbdJEe6m' \
    --userId 'nkYAfw61kyKk0UXU' \
    > test.out 2>&1
eval_tap $? 302 'GetUserOrder' test.out

#- 303 UpdateUserOrderStatus
./ng net.accelbyte.sdk.cli.Main platform updateUserOrderStatus \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'F2523OTvOmfVNJND' \
    --userId 'aSO3FEkk4It6V8Bu' \
    --body '{"status": "REFUND_FAILED", "statusReason": "rIjGrxUMKbv60ixU"}' \
    > test.out 2>&1
eval_tap $? 303 'UpdateUserOrderStatus' test.out

#- 304 FulfillUserOrder
./ng net.accelbyte.sdk.cli.Main platform fulfillUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'uUhopdqGrqRZ124P' \
    --userId '7PauXTrpWAjwatSv' \
    > test.out 2>&1
eval_tap $? 304 'FulfillUserOrder' test.out

#- 305 GetUserOrderGrant
eval_tap 0 305 'GetUserOrderGrant # SKIP deprecated' test.out

#- 306 GetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform getUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'tPbAFn8oWQcmFkkR' \
    --userId 'X6EqadAEIzxld80Y' \
    > test.out 2>&1
eval_tap $? 306 'GetUserOrderHistories' test.out

#- 307 ProcessUserOrderNotification
./ng net.accelbyte.sdk.cli.Main platform processUserOrderNotification \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'nss7hc3VUxxZIgkT' \
    --userId 'LqMeJPCbs8jWmTte' \
    --body '{"additionalData": {"cardSummary": "JhwNbwHGG39YAZJ4"}, "authorisedTime": "1988-06-12T00:00:00Z", "chargebackReversedTime": "1981-02-24T00:00:00Z", "chargebackTime": "1990-01-12T00:00:00Z", "chargedTime": "1973-04-02T00:00:00Z", "createdTime": "1973-02-18T00:00:00Z", "currency": {"currencyCode": "aIDKn9qJXncm5igp", "currencySymbol": "AewbmnWk0E7YaPbl", "currencyType": "REAL", "decimals": 4, "namespace": "WEyNgvs5LEZrQXzS"}, "customParameters": {"QRWRs9EGnRPgYlJE": {}, "lgJ8kx1WEeDbql13": {}, "FtQMu41rnOzbsFBq": {}}, "extOrderNo": "g6dziWvdNcwfUBMd", "extTxId": "NuTaiLxFMXRpDP9x", "extUserId": "utntU8xHw4yYJOCV", "issuedAt": "1975-02-19T00:00:00Z", "metadata": {"HwunQwpC2eCFUAHZ": "aYSvsWiNJtqXltZF", "6aSRmHU5iR3hXIbz": "WPKOkzftOgDQAWhu", "lbrDf7q4cAnpmLiE": "u4CNtX2lnqi7cHTS"}, "namespace": "dGoLZbC3UJruU4uI", "nonceStr": "XBZsEYogFWiH9z4E", "paymentData": {"discountAmount": 77, "discountCode": "zmaZ5cg0REtUWY4f", "subtotalPrice": 98, "tax": 53, "totalPrice": 71}, "paymentMethod": "neXGgxNg33ZIUrIk", "paymentMethodFee": 11, "paymentOrderNo": "AeDCowR3MeCNL1oN", "paymentProvider": "PAYPAL", "paymentProviderFee": 65, "paymentStationUrl": "piT8VcrXLZnuMNpK", "price": 63, "refundedTime": "1997-10-05T00:00:00Z", "salesTax": 50, "sandbox": true, "sku": "ORFkN9EbKbTbrDzN", "status": "AUTHORISE_FAILED", "statusReason": "7MdKu9Xwn5GHJDGa", "subscriptionId": "trYOMO91CYEjX867", "subtotalPrice": 27, "targetNamespace": "UFQyVlt9jmxmxpfp", "targetUserId": "41k1uDg59PhdUXSh", "tax": 1, "totalPrice": 3, "totalTax": 2, "txEndTime": "1983-07-06T00:00:00Z", "type": "EJcKHE764EwhQfxF", "userId": "KIOGT1WKSmLoA0IL", "vat": 1}' \
    > test.out 2>&1
eval_tap $? 307 'ProcessUserOrderNotification' test.out

#- 308 DownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform downloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'XBFpUX9y4tY7o5FF' \
    --userId 'i1n10vDgyoHXIlrM' \
    > test.out 2>&1
eval_tap $? 308 'DownloadUserOrderReceipt' test.out

#- 309 CreateUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform createUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'l2RAukCL26ihdMy9' \
    --body '{"currencyCode": "YCLNJEkvq6SUSt8x", "currencyNamespace": "d8EgE15XNuw6Y7sT", "customParameters": {"oQNkuZzJ1XBxw01i": {}, "BBQukgQ94ZvPCWcM": {}, "X0ov3U2sKjIeyFS9": {}}, "description": "7dYD7LkcTKYpCfl6", "extOrderNo": "HPy5cJfAV5iOfzwt", "extUserId": "3bpxRNt6lKoMjCPt", "itemType": "MEDIA", "language": "lzE_vpNy", "metadata": {"8Fn8TvZVTe4L2lXr": "VPX6r5ZTcnVVOKMA", "pTcWsFRUlWBp4gBs": "9UufgsVbG6TUe3jb", "uQ7HMPO4ozK705yk": "RqSPYZgPm4JLsXVt"}, "notifyUrl": "BOEetHsxAJ8Ny1LR", "omitNotification": false, "platform": "qBIkUID0EE9InZNL", "price": 47, "recurringPaymentOrderNo": "YWdok4UnUEOyP0cP", "region": "Zf5OvolfI0mqZcto", "returnUrl": "hLheRaQkfMLFW9B7", "sandbox": false, "sku": "F0pD3NHU8iYUOtG5", "subscriptionId": "gbQSKW2MdgCH4bWx", "title": "RF6fBPa6GOuV5z0p"}' \
    > test.out 2>&1
eval_tap $? 309 'CreateUserPaymentOrder' test.out

#- 310 RefundUserPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform refundUserPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '8jaJs2duQqawPrxi' \
    --userId '6F4elhy9CZ94CAUV' \
    --body '{"description": "W8FoEf8tjCjWc22q"}' \
    > test.out 2>&1
eval_tap $? 310 'RefundUserPaymentOrder' test.out

#- 311 GetUserPlatformAccountClosureHistories
./ng net.accelbyte.sdk.cli.Main platform getUserPlatformAccountClosureHistories \
    --namespace "$AB_NAMESPACE" \
    --userId 'qDfNz59jHwSDQHad' \
    > test.out 2>&1
eval_tap $? 311 'GetUserPlatformAccountClosureHistories' test.out

#- 312 ApplyUserRedemption
./ng net.accelbyte.sdk.cli.Main platform applyUserRedemption \
    --namespace "$AB_NAMESPACE" \
    --userId 'mAo0lzhPm7RmaOr6' \
    --body '{"code": "TLwVyE42ApAb7CKt", "orderNo": "79wAopZL9Cw6K9h5"}' \
    > test.out 2>&1
eval_tap $? 312 'ApplyUserRedemption' test.out

#- 313 DoRevocation
./ng net.accelbyte.sdk.cli.Main platform doRevocation \
    --namespace "$AB_NAMESPACE" \
    --userId '5mwUvhdBOgumV4wA' \
    --body '{"meta": {"sd4ifGd0bkWrlhtf": {}, "TywRW4fmg6btk3mA": {}, "O4EtB0hn2x1oTOX5": {}}, "reason": "gBQlVDx9neFHWhDR", "requestId": "JtyYEt7ygZleAoUu", "revokeEntries": [{"currency": {"balanceOrigin": "Nintendo", "currencyCode": "KneoO10ytPdJ8SY3", "namespace": "qoogOxoPYvdIBJYy"}, "entitlement": {"entitlementId": "GURjEjnslEYM8ngV"}, "item": {"entitlementOrigin": "Other", "itemIdentity": "ewVxvgAocOqsd5v5", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 71, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "Nintendo", "currencyCode": "Co9gZWdxfIdW8fNA", "namespace": "M5YdHivK2Q0WwolQ"}, "entitlement": {"entitlementId": "y037hJMOEv5W0v25"}, "item": {"entitlementOrigin": "Playstation", "itemIdentity": "mAvxBxJNPlvvYZw4", "itemIdentityType": "ITEM_ID", "origin": "Epic"}, "quantity": 53, "type": "CURRENCY"}, {"currency": {"balanceOrigin": "GooglePlay", "currencyCode": "FTuNPf5JCSDyYy4e", "namespace": "5qoTZxSoZbQUnUxS"}, "entitlement": {"entitlementId": "6m68WL3HDL4yx5I0"}, "item": {"entitlementOrigin": "GooglePlay", "itemIdentity": "CSgQHvs25eiQO3oW", "itemIdentityType": "ITEM_ID", "origin": "GooglePlay"}, "quantity": 13, "type": "ENTITLEMENT"}], "source": "DLC", "transactionId": "7lloLgIYqxFfSNJl"}' \
    > test.out 2>&1
eval_tap $? 313 'DoRevocation' test.out

#- 314 RegisterXblSessions
./ng net.accelbyte.sdk.cli.Main platform registerXblSessions \
    --namespace "$AB_NAMESPACE" \
    --userId 'HCjxLNnYUlGQsFpy' \
    --body '{"gameSessionId": "9ZVlLIFwLgT78noo", "payload": {"tfUs9559ilm3cauh": {}, "rw9Yn2z5cnbm7z2A": {}, "a24yBTw3wfNGyWf3": {}}, "scid": "VujS7Bq5bcfPW4pP", "sessionTemplateName": "ZB9YXltCxyztUnj1"}' \
    > test.out 2>&1
eval_tap $? 314 'RegisterXblSessions' test.out

#- 315 QueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform queryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId '7t3gHBXvjvziexzO' \
    --chargeStatus 'SETUP' \
    --itemId 'OGfFBlu2ZP0IkiYX' \
    --limit '68' \
    --offset '54' \
    --sku 'k6BoBmSLi0R7zDFM' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 315 'QueryUserSubscriptions' test.out

#- 316 GetUserSubscriptionActivities
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionActivities \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQmlS8lMlY8Ujprh' \
    --excludeSystem  \
    --limit '59' \
    --offset '48' \
    --subscriptionId 'xhzW6ZM7LkTVrtVJ' \
    > test.out 2>&1
eval_tap $? 316 'GetUserSubscriptionActivities' test.out

#- 317 PlatformSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform platformSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZVhxCVdjPutJ8dkA' \
    --body '{"grantDays": 98, "itemId": "zJwKuc7EpiQEzz5N", "language": "5osRYO7wbYh7q02W", "reason": "8tkTURUFmqNc8xhQ", "region": "qptccNorRls7EC3n", "source": "DnhFvDlFd7iyZpvW"}' \
    > test.out 2>&1
eval_tap $? 317 'PlatformSubscribeSubscription' test.out

#- 318 CheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform checkUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'VJFK6ZuvlzGCII15' \
    --itemId '6hIg0g8HIxpzm9Ac' \
    > test.out 2>&1
eval_tap $? 318 'CheckUserSubscriptionSubscribableByItemId' test.out

#- 319 GetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform getUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'FhH4ZlYY3rEuHMWw' \
    --userId 'QNmCQmGCF963CbsO' \
    > test.out 2>&1
eval_tap $? 319 'GetUserSubscription' test.out

#- 320 DeleteUserSubscription
./ng net.accelbyte.sdk.cli.Main platform deleteUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'awlRBQJH6fNekhk0' \
    --userId '77gxaj55huTA6Avm' \
    > test.out 2>&1
eval_tap $? 320 'DeleteUserSubscription' test.out

#- 321 CancelSubscription
./ng net.accelbyte.sdk.cli.Main platform cancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'W0567BFqbrPIuxKm' \
    --userId 'BXLi6GpnqAeMvg3w' \
    --force  \
    --body '{"immediate": true, "reason": "1520WM3TxWXSdTiK"}' \
    > test.out 2>&1
eval_tap $? 321 'CancelSubscription' test.out

#- 322 GrantDaysToSubscription
./ng net.accelbyte.sdk.cli.Main platform grantDaysToSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dva2UREoBSFtCLy2' \
    --userId 'CqgCG7JwJCDqkzOd' \
    --body '{"grantDays": 64, "reason": "1f6P3D3rVcC2g6t4"}' \
    > test.out 2>&1
eval_tap $? 322 'GrantDaysToSubscription' test.out

#- 323 GetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform getUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '2jE1Wad232YV7A2z' \
    --userId 'HFGbN8AQaCaw9UF7' \
    --excludeFree  \
    --limit '4' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 323 'GetUserSubscriptionBillingHistories' test.out

#- 324 ProcessUserSubscriptionNotification
./ng net.accelbyte.sdk.cli.Main platform processUserSubscriptionNotification \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'dSDd99DQZ7vnTx8H' \
    --userId 'DXTJWiyw17ogzmbj' \
    --body '{"additionalData": {"cardSummary": "4SLYDrZJvDLGvn6q"}, "authorisedTime": "1981-12-22T00:00:00Z", "chargebackReversedTime": "1979-04-23T00:00:00Z", "chargebackTime": "1978-01-17T00:00:00Z", "chargedTime": "1971-05-07T00:00:00Z", "createdTime": "1980-06-14T00:00:00Z", "currency": {"currencyCode": "HKXX1ft5nBA9xNIJ", "currencySymbol": "VuMz04evSdE2FMcK", "currencyType": "REAL", "decimals": 84, "namespace": "c94rEmIYuAT5OAcU"}, "customParameters": {"wYHGmG5rNDBF1oU3": {}, "7vjfyX5YLaM0wmi0": {}, "i1WABBbq8IzZsMFL": {}}, "extOrderNo": "X9ZhFXcFtfBS3ZIH", "extTxId": "ofhwyM6Bw2sFGQ5D", "extUserId": "QoDwzrKPOZZnV3zR", "issuedAt": "1997-06-29T00:00:00Z", "metadata": {"xSu6addocg10Hy9j": "x7gBHTOHHArjld0L", "nREsrrB2pJ7V8BSr": "ucjO3zvSM5KeVNHU", "9GcOivIfcCJt4U8V": "SgXoi9Fw25b9qXzl"}, "namespace": "IK2G6AUjBCdf0Rp5", "nonceStr": "e5IvFuN1oUsCnBmG", "paymentData": {"discountAmount": 78, "discountCode": "iV9bQMHpPbvflI3L", "subtotalPrice": 22, "tax": 90, "totalPrice": 15}, "paymentMethod": "c1NgZaoYAaCCeRgt", "paymentMethodFee": 38, "paymentOrderNo": "996Mh1sQ3Dw3uyjg", "paymentProvider": "ALIPAY", "paymentProviderFee": 54, "paymentStationUrl": "8TTOVf6jrr1OL606", "price": 88, "refundedTime": "1972-05-12T00:00:00Z", "salesTax": 33, "sandbox": true, "sku": "wefF0CJlH55RLEge", "status": "DELETED", "statusReason": "FmrLT0HbvS4kSSt3", "subscriptionId": "CyDgf6eFAiqSkHi0", "subtotalPrice": 55, "targetNamespace": "fjkFd6MHo6gGQ5mC", "targetUserId": "hYoKD7yqCR03RovQ", "tax": 55, "totalPrice": 15, "totalTax": 76, "txEndTime": "1982-02-11T00:00:00Z", "type": "n478mhb2I2yBJeCJ", "userId": "ghTrk68FWFzuLBdl", "vat": 36}' \
    > test.out 2>&1
eval_tap $? 324 'ProcessUserSubscriptionNotification' test.out

#- 325 AcquireUserTicket
./ng net.accelbyte.sdk.cli.Main platform acquireUserTicket \
    --boothName 'uLufhQj2KP3LLxl9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hs2L2wlpKBVURxHe' \
    --body '{"count": 10, "orderNo": "sGyv1RuSNdycDssU"}' \
    > test.out 2>&1
eval_tap $? 325 'AcquireUserTicket' test.out

#- 326 QueryUserCurrencyWallets
./ng net.accelbyte.sdk.cli.Main platform queryUserCurrencyWallets \
    --namespace "$AB_NAMESPACE" \
    --userId 'eHiVDXzSJ8kbFAyi' \
    > test.out 2>&1
eval_tap $? 326 'QueryUserCurrencyWallets' test.out

#- 327 DebitUserWalletByCurrencyCode
./ng net.accelbyte.sdk.cli.Main platform debitUserWalletByCurrencyCode \
    --currencyCode 'dbnXdMSwmkBkKC1h' \
    --namespace "$AB_NAMESPACE" \
    --userId '6h45u0wuh9pY0011' \
    --body '{"allowOverdraft": false, "amount": 8, "balanceOrigin": "Xbox", "balanceSource": "EXPIRATION", "metadata": {"qguxvRwI9ZBTipMR": {}, "lhK9DMMaI4ryVDvN": {}, "aruZxwTfh9gEs6GF": {}}, "reason": "247cbBLjUr5z03wx"}' \
    > test.out 2>&1
eval_tap $? 327 'DebitUserWalletByCurrencyCode' test.out

#- 328 ListUserCurrencyTransactions
./ng net.accelbyte.sdk.cli.Main platform listUserCurrencyTransactions \
    --currencyCode 'B3E9hrE9f9COFrOr' \
    --namespace "$AB_NAMESPACE" \
    --userId '6wJDBwIDsJHNg6Tv' \
    --limit '82' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 328 'ListUserCurrencyTransactions' test.out

#- 329 CheckBalance
./ng net.accelbyte.sdk.cli.Main platform checkBalance \
    --currencyCode 'GjwI4TbTwBufUorJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ouduhCEJ5XiKDIE9' \
    --request '{"amount": 63, "debitBalanceSource": "IAP_REVOCATION", "metadata": {"V3wnTZTvYYf4ZFuV": {}, "6L2AldoWWRN5wNYl": {}, "FiliYmBrqrOc0NIl": {}}, "reason": "igBrOkBljwRENjt0", "walletPlatform": "Steam"}' \
    > test.out 2>&1
eval_tap $? 329 'CheckBalance' test.out

#- 330 CheckWallet
eval_tap 0 330 'CheckWallet # SKIP deprecated' test.out

#- 331 CreditUserWallet
./ng net.accelbyte.sdk.cli.Main platform creditUserWallet \
    --currencyCode 'ZpyTTZG1LxLdySvy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VqY8nxBZbHcPHEFu' \
    --body '{"amount": 64, "expireAt": "1995-09-15T00:00:00Z", "metadata": {"P9bF07gnWDULkJPQ": {}, "R0UJMr8ouccGH0B4": {}, "LCe2h0iFCCZgFWs5": {}}, "origin": "Oculus", "reason": "8sn0bVWRkvmAemh8", "source": "GIFT"}' \
    > test.out 2>&1
eval_tap $? 331 'CreditUserWallet' test.out

#- 332 DebitByWalletPlatform
./ng net.accelbyte.sdk.cli.Main platform debitByWalletPlatform \
    --currencyCode 'zYgnYTdim6PkRoq5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TO65KWh8ztRJkXxU' \
    --request '{"amount": 56, "debitBalanceSource": "EXPIRATION", "metadata": {"LRHd96dGLgkfrZve": {}, "FMWAFT7l0l1jaOAM": {}, "CzbsoIgmKwwMDQPj": {}}, "reason": "UIosq1l6xo0D4JRb", "walletPlatform": "Other"}' \
    > test.out 2>&1
eval_tap $? 332 'DebitByWalletPlatform' test.out

#- 333 PayWithUserWallet
./ng net.accelbyte.sdk.cli.Main platform payWithUserWallet \
    --currencyCode 'qO6IuP2PY5hhX6uN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ah9JoHPj7jFWxSv1' \
    --body '{"amount": 23, "metadata": {"eWPnVeFdy5ezlCU6": {}, "SGzkMpTL2wxobjxA": {}, "bagqEmXn6U2VeV2e": {}}, "walletPlatform": "Nintendo"}' \
    > test.out 2>&1
eval_tap $? 333 'PayWithUserWallet' test.out

#- 334 GetUserWallet
eval_tap 0 334 'GetUserWallet # SKIP deprecated' test.out

#- 335 DebitUserWallet
eval_tap 0 335 'DebitUserWallet # SKIP deprecated' test.out

#- 336 DisableUserWallet
eval_tap 0 336 'DisableUserWallet # SKIP deprecated' test.out

#- 337 EnableUserWallet
eval_tap 0 337 'EnableUserWallet # SKIP deprecated' test.out

#- 338 ListUserWalletTransactions
eval_tap 0 338 'ListUserWalletTransactions # SKIP deprecated' test.out

#- 339 ListViews
./ng net.accelbyte.sdk.cli.Main platform listViews \
    --namespace "$AB_NAMESPACE" \
    --storeId 'svdXGlD40xxIyVwY' \
    > test.out 2>&1
eval_tap $? 339 'ListViews' test.out

#- 340 CreateView
./ng net.accelbyte.sdk.cli.Main platform createView \
    --namespace "$AB_NAMESPACE" \
    --storeId 'jn6dlC9Kfh9gHulo' \
    --body '{"displayOrder": 50, "localizations": {"mrVrmTJwtBTzQTrN": {"description": "o1LcWNf7xHpi1JZJ", "localExt": {"jIRtCfqDHSlo54zS": {}, "nRN0zGMworzym1z3": {}, "ZdetOic9AQOFWpdI": {}}, "longDescription": "tLBhvKJq9tWz9yui", "title": "8a6jOflFJlZEhz1Q"}, "Deh05hj92bwVVxJ6": {"description": "2Q5AOAOyL65cPaOZ", "localExt": {"A8BG8KcVWOX9n3Ys": {}, "jJexnFA9Umz3KPIC": {}, "ya5Fk5TPaEbX29cV": {}}, "longDescription": "8v7MXctihtxMnIr4", "title": "b7jyfL3zMkklGCPI"}, "SlsnVA6z0uSfNNpJ": {"description": "UYzJxnOyvqmswrTo", "localExt": {"yBIQumxDfAxNqCUt": {}, "izYM97ebZcYqwfIH": {}, "PWMkOmrT5HL16jMw": {}}, "longDescription": "ECnmwJv4rpqtzDaz", "title": "0WUJlBCHzJ2v9K8c"}}, "name": "1zOlZg30pagfP0Ff"}' \
    > test.out 2>&1
eval_tap $? 340 'CreateView' test.out

#- 341 GetView
./ng net.accelbyte.sdk.cli.Main platform getView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'OMBOpeQT4zYIbU4i' \
    --storeId '9mLyX46Alt08rrnG' \
    > test.out 2>&1
eval_tap $? 341 'GetView' test.out

#- 342 UpdateView
./ng net.accelbyte.sdk.cli.Main platform updateView \
    --namespace "$AB_NAMESPACE" \
    --viewId '8y2ScXkwjpAp82pG' \
    --storeId 'cxvXaG9LzHpMS53j' \
    --body '{"displayOrder": 23, "localizations": {"8gx2rX5dck8NFKPg": {"description": "T6LMehg047axU5kt", "localExt": {"NywRIvO2Sgz30hej": {}, "qdktHIO1VdtMSews": {}, "1TrU4FhAfKDcDG5b": {}}, "longDescription": "MTba1tUlFGcP6eL7", "title": "EpWtPifmO0JK4dP1"}, "aZFiSkmhwVVMGkXN": {"description": "wMYwFyljy5bYQdQ8", "localExt": {"7hUHA0FJZwP8GslM": {}, "px3m7lEXTmnTbtjK": {}, "9RsyoqT3adB48Jxp": {}}, "longDescription": "2zaItg9jTNZvpFEU", "title": "I21aSaIsMyLKPPIZ"}, "x0zdNAagipZwiaBr": {"description": "FrXtGMjujfHZB1gM", "localExt": {"I1B8DXb37DffTZ7y": {}, "Qz337LLNCjIySe36": {}, "SA5dxATLv5PkLvra": {}}, "longDescription": "RzChdjDGdlk2A2jH", "title": "bAPNGInvbnf4ewKF"}}, "name": "FLoGggX4gQWyZocv"}' \
    > test.out 2>&1
eval_tap $? 342 'UpdateView' test.out

#- 343 DeleteView
./ng net.accelbyte.sdk.cli.Main platform deleteView \
    --namespace "$AB_NAMESPACE" \
    --viewId 'Yfr0Rnl02R1IVNna' \
    --storeId 'K6KS71Xs1BphA9BX' \
    > test.out 2>&1
eval_tap $? 343 'DeleteView' test.out

#- 344 GetWalletConfig
./ng net.accelbyte.sdk.cli.Main platform getWalletConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 344 'GetWalletConfig' test.out

#- 345 UpdateWalletConfig
./ng net.accelbyte.sdk.cli.Main platform updateWalletConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"enablePaidForVCExpiration": false}' \
    > test.out 2>&1
eval_tap $? 345 'UpdateWalletConfig' test.out

#- 346 QueryWallets
eval_tap 0 346 'QueryWallets # SKIP deprecated' test.out

#- 347 BulkCredit
./ng net.accelbyte.sdk.cli.Main platform bulkCredit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"creditRequest": {"amount": 51, "expireAt": "1990-04-26T00:00:00Z", "metadata": {"YgF9OuigDP0Vjmy7": {}, "j2BrdCAm3slCwaBq": {}, "HpE55sjxBGijw0dQ": {}}, "origin": "Other", "reason": "CULEMPaOU5nukycA", "source": "REFUND"}, "currencyCode": "JGyZS0I8FevJiT98", "userIds": ["5tPKPuK0K4PiMDTR", "7LxihuOn57io0d9d", "HUBp56Q4WETxtGMs"]}, {"creditRequest": {"amount": 68, "expireAt": "1976-01-09T00:00:00Z", "metadata": {"yzaNbGeASX83SLiI": {}, "bAP2qyUnHnfrEdDf": {}, "Y4TTxu8goZgsX4Rw": {}}, "origin": "GooglePlay", "reason": "yqwFVBd1ZjaRXEdW", "source": "CONSUME_ENTITLEMENT"}, "currencyCode": "Pob0YZEuXQACDDQr", "userIds": ["iXa9nUsHCVicuJ7o", "yNf9VGxbOeJe4n9e", "UlBQZ2UGePWXbAyG"]}, {"creditRequest": {"amount": 28, "expireAt": "1971-05-27T00:00:00Z", "metadata": {"SqqyAPha5b6PQTPT": {}, "ytHeeXo7gOFVLZCB": {}, "WuVIROZuqdJBi8pk": {}}, "origin": "Nintendo", "reason": "NDvValv3bkoMXNzl", "source": "SELL_BACK"}, "currencyCode": "SeSGXtZU5SuIhMSa", "userIds": ["VTqPbzY1yxl7zeEp", "eKpOxPrlG9svdqsi", "DRp17dUWHcjrb6qN"]}]' \
    > test.out 2>&1
eval_tap $? 347 'BulkCredit' test.out

#- 348 BulkDebit
./ng net.accelbyte.sdk.cli.Main platform bulkDebit \
    --namespace "$AB_NAMESPACE" \
    --body '[{"currencyCode": "mSPO6KwlJQlj9Ii2", "request": {"allowOverdraft": false, "amount": 9, "balanceOrigin": "Playstation", "balanceSource": "IAP_REVOCATION", "metadata": {"Rwzowk9OoiPdnq9K": {}, "BqBwiNCsnK8CcO1O": {}, "HbpQZtwW3EwLre1b": {}}, "reason": "L4dJnkRLJbMvOGSd"}, "userIds": ["3wnJyExuo5z9RAcY", "gYZb7cAakJpqN6eu", "7uMrmQ2SaLd6M7TM"]}, {"currencyCode": "bdp49JFwXG0EvoSH", "request": {"allowOverdraft": false, "amount": 60, "balanceOrigin": "IOS", "balanceSource": "ORDER_REVOCATION", "metadata": {"7eEyhnL1QH5AlYRA": {}, "qCAC2gy1WF9QLNgD": {}, "xAkwgfB8jIecOx5u": {}}, "reason": "gNCDd6jW6fjtBcO3"}, "userIds": ["SYijqEuMfuYFUS07", "7uykADFpinFcH2ZM", "fWq9qfmBv0XgJB6a"]}, {"currencyCode": "9tOpZYM1XV0Op0da", "request": {"allowOverdraft": false, "amount": 61, "balanceOrigin": "Playstation", "balanceSource": "DLC_REVOCATION", "metadata": {"pYaKTz1gcE2XCwTk": {}, "RUIX6IFHNmB9mYBv": {}, "tOwxjqyrjDApeN5e": {}}, "reason": "AfRqSgH5xIuBTYOd"}, "userIds": ["svNyk52MQFkVVEf3", "6S7yPgG48bk6PwH1", "tdEAJSqXA0Wv0zWG"]}]' \
    > test.out 2>&1
eval_tap $? 348 'BulkDebit' test.out

#- 349 GetWallet
eval_tap 0 349 'GetWallet # SKIP deprecated' test.out

#- 350 SyncOrders
./ng net.accelbyte.sdk.cli.Main platform syncOrders \
    --nextEvaluatedKey 'vkc6byp3mvyYT3Gu' \
    --end 'aZVTxBlw1IWeXKFT' \
    --start '4rfSbbSlDPGf9Fn3' \
    > test.out 2>&1
eval_tap $? 350 'SyncOrders' test.out

#- 351 TestAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfig \
    --sandbox  \
    --body '{"allowedPaymentMethods": ["2SJNPZkEfkAcJTMS", "4pVRcCHIGfmCMTr9", "ACnI2sMrEgl7ZR1H"], "apiKey": "Ckf2Sw78lLGKjDHu", "authoriseAsCapture": true, "blockedPaymentMethods": ["jA0ajvb7JcGUFgp6", "LkyXpxJeFxhgTwyO", "51CUpcdxL0a9VDhr"], "clientKey": "qWCTXOxQUpyFgZhN", "dropInSettings": "pOTE4toH57yr01N3", "liveEndpointUrlPrefix": "3p1Gha8HwpagvERZ", "merchantAccount": "I6CqhcknhecNv2Tw", "notificationHmacKey": "6YKhVrYkMqXkQ7ql", "notificationPassword": "aJjSYEseBYCFGoKp", "notificationUsername": "Xx60GmEX9x2BYpyK", "returnUrl": "EBQ7TW7lZvDbwFJJ", "settings": "hBRdq8BgAI81k4Gr"}' \
    > test.out 2>&1
eval_tap $? 351 'TestAdyenConfig' test.out

#- 352 TestAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfig \
    --sandbox  \
    --body '{"appId": "7jVVx5l3yrH9HR4r", "privateKey": "eG0HwUXxQTf5YpDU", "publicKey": "GYsJBEkYUrLv4qUi", "returnUrl": "TkFcLBrg2JB0WiCp"}' \
    > test.out 2>&1
eval_tap $? 352 'TestAliPayConfig' test.out

#- 353 TestCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfig \
    --sandbox  \
    --body '{"publicKey": "VBwvAffJ3btt0PpQ", "secretKey": "Y3Pnnic80yEO8dL6"}' \
    > test.out 2>&1
eval_tap $? 353 'TestCheckoutConfig' test.out

#- 354 DebugMatchedPaymentMerchantConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentMerchantConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'Jh10XMUGeDavCKra' \
    > test.out 2>&1
eval_tap $? 354 'DebugMatchedPaymentMerchantConfig' test.out

#- 355 TestNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfig \
    --sandbox  \
    --body '{"apiKey": "dJmJFUsU418vAlmf", "webhookSecretKey": "Gg9NO1Z2DvnAxH3p"}' \
    > test.out 2>&1
eval_tap $? 355 'TestNeonPayConfig' test.out

#- 356 TestPayPalConfig
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfig \
    --sandbox  \
    --body '{"clientID": "S3jyCkGKltBNE2Ub", "clientSecret": "hNtH3yYg4Qnn2uhd", "returnUrl": "w7C9Bx1LQOTCbAPL", "webHookId": "C3iqrkyJFOVaewFc"}' \
    > test.out 2>&1
eval_tap $? 356 'TestPayPalConfig' test.out

#- 357 TestStripeConfig
./ng net.accelbyte.sdk.cli.Main platform testStripeConfig \
    --sandbox  \
    --body '{"allowedPaymentMethodTypes": ["v9h31YxuZnoSesWp", "LUHjGaIcZN28gH4C", "d9xTdt2K1CzpQWsl"], "publishableKey": "NGnLYUYR0yOvJhUj", "secretKey": "zcMtwINUlrhIpnla", "webhookSecret": "m2EefVopbpPhsana"}' \
    > test.out 2>&1
eval_tap $? 357 'TestStripeConfig' test.out

#- 358 TestWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfig \
    --body '{"appId": "0uXG7GUTV1BwgkLD", "key": "j4pjVktyoNSsEHlz", "mchid": "yd0SarkhltUxgbN5", "returnUrl": "eElQNESFLD8hCc9o"}' \
    > test.out 2>&1
eval_tap $? 358 'TestWxPayConfig' test.out

#- 359 TestXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfig \
    --body '{"apiKey": "nSNjbQEqFGwnDG8k", "flowCompletionUrl": "z4kvEv6tNjGRhrmR", "merchantId": 55, "projectId": 48, "projectSecretKey": "OgzHypgsSeKCvtPz"}' \
    > test.out 2>&1
eval_tap $? 359 'TestXsollaConfig' test.out

#- 360 GetPaymentMerchantConfig1
./ng net.accelbyte.sdk.cli.Main platform getPaymentMerchantConfig1 \
    --id '7jagBG9a1TZ87ltC' \
    > test.out 2>&1
eval_tap $? 360 'GetPaymentMerchantConfig1' test.out

#- 361 UpdateAdyenConfig
./ng net.accelbyte.sdk.cli.Main platform updateAdyenConfig \
    --id 'lc3RDXF5055tUlen' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethods": ["imjIbm0riCaNp8dU", "BDinAB6HqIWIi5Bv", "b1rcuEtWAF763kci"], "apiKey": "7lT62BOHaso53W3U", "authoriseAsCapture": true, "blockedPaymentMethods": ["p7lUfQqXrqGadwvK", "lJFX1ZHV9yo9Ur1h", "fhmGEKuVUZdCacRG"], "clientKey": "ataPrcgTcA71dtqt", "dropInSettings": "SUN4zvBzGh3mhIDN", "liveEndpointUrlPrefix": "uMBZegHtB9uTCiiI", "merchantAccount": "oMZCjGiOZJpUf9Rp", "notificationHmacKey": "cfEQn0O6D8PGQuaz", "notificationPassword": "AypgWhTED5YmPTBU", "notificationUsername": "km2FyvdguCYVqFyI", "returnUrl": "Kh1YtTY4AejyQc5D", "settings": "ac7hSLldWx5DyniV"}' \
    > test.out 2>&1
eval_tap $? 361 'UpdateAdyenConfig' test.out

#- 362 TestAdyenConfigById
./ng net.accelbyte.sdk.cli.Main platform testAdyenConfigById \
    --id 'ESUgrROrP1ip3jNG' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 362 'TestAdyenConfigById' test.out

#- 363 UpdateAliPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateAliPayConfig \
    --id '68DByf2UMPtigq9z' \
    --sandbox  \
    --validate  \
    --body '{"appId": "OQOcAqBj0bXhOr9O", "privateKey": "Ht6zx1i2W3GY7tdh", "publicKey": "8hHlQyMlgfkTsATh", "returnUrl": "LyflAqqAP4M78smY"}' \
    > test.out 2>&1
eval_tap $? 363 'UpdateAliPayConfig' test.out

#- 364 TestAliPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testAliPayConfigById \
    --id 'dyge6DroOywOxI4G' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 364 'TestAliPayConfigById' test.out

#- 365 UpdateCheckoutConfig
./ng net.accelbyte.sdk.cli.Main platform updateCheckoutConfig \
    --id '6jZzoYIFAvYfT8XQ' \
    --sandbox  \
    --validate  \
    --body '{"publicKey": "w2EOq6BFjmN4OqKG", "secretKey": "LRpNWzKZtZnxgywm"}' \
    > test.out 2>&1
eval_tap $? 365 'UpdateCheckoutConfig' test.out

#- 366 TestCheckoutConfigById
./ng net.accelbyte.sdk.cli.Main platform testCheckoutConfigById \
    --id 'r4CYNGm7Tk1mMyeN' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 366 'TestCheckoutConfigById' test.out

#- 367 UpdateNeonPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateNeonPayConfig \
    --id 'RsjQuDEgO3MEQNL6' \
    --sandbox  \
    --validate  \
    --body '{"apiKey": "ijLRvQOgoaBooTaw", "webhookSecretKey": "HLMxhx9nC3o6pXU5"}' \
    > test.out 2>&1
eval_tap $? 367 'UpdateNeonPayConfig' test.out

#- 368 TestNeonPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testNeonPayConfigById \
    --id 'MDJLCB6WbXWIRpgj' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 368 'TestNeonPayConfigById' test.out

#- 369 UpdatePayPalConfig
./ng net.accelbyte.sdk.cli.Main platform updatePayPalConfig \
    --id 'ooaBVemsbkaXZQ6n' \
    --sandbox  \
    --validate  \
    --body '{"clientID": "Tj9rZpkSntuOeaPA", "clientSecret": "yPeEGBepK1Ix4Swj", "returnUrl": "CYjCHniVSn1gYGal", "webHookId": "5NrBtT0om9OlGzpF"}' \
    > test.out 2>&1
eval_tap $? 369 'UpdatePayPalConfig' test.out

#- 370 TestPayPalConfigById
./ng net.accelbyte.sdk.cli.Main platform testPayPalConfigById \
    --id '25qu98RhktX6qwkX' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 370 'TestPayPalConfigById' test.out

#- 371 UpdateStripeConfig
./ng net.accelbyte.sdk.cli.Main platform updateStripeConfig \
    --id 'bCLbh8t0zPkQWRUl' \
    --sandbox  \
    --validate  \
    --body '{"allowedPaymentMethodTypes": ["gE0kxzFMq9ttbEHA", "EV7C65Ans9SquNSJ", "Iay5VdUdYy9Y9OCS"], "publishableKey": "mmT3WKijbqhT3uyQ", "secretKey": "RXvvcUYDeWPZ8yhw", "webhookSecret": "Q0gIdj1lTJdNLmAv"}' \
    > test.out 2>&1
eval_tap $? 371 'UpdateStripeConfig' test.out

#- 372 TestStripeConfigById
./ng net.accelbyte.sdk.cli.Main platform testStripeConfigById \
    --id 'EdEBVAU3rbkv8V98' \
    --sandbox  \
    > test.out 2>&1
eval_tap $? 372 'TestStripeConfigById' test.out

#- 373 UpdateWxPayConfig
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfig \
    --id 'cupW0L5WsiuITRMS' \
    --validate  \
    --body '{"appId": "POUfWQwr4PYf48r6", "key": "6MaToxBiliy2vtRk", "mchid": "pqL6KrVcNz83J57t", "returnUrl": "6OcYPQ5bk5IeuAi3"}' \
    > test.out 2>&1
eval_tap $? 373 'UpdateWxPayConfig' test.out

#- 374 UpdateWxPayConfigCert
./ng net.accelbyte.sdk.cli.Main platform updateWxPayConfigCert \
    --id 'zWFGorCbncoj5RvE' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 374 'UpdateWxPayConfigCert' test.out

#- 375 TestWxPayConfigById
./ng net.accelbyte.sdk.cli.Main platform testWxPayConfigById \
    --id 'tXiKyUGdNfMiwgSv' \
    > test.out 2>&1
eval_tap $? 375 'TestWxPayConfigById' test.out

#- 376 UpdateXsollaConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaConfig \
    --id 'sTRmJsOm0wVFyHvF' \
    --validate  \
    --body '{"apiKey": "hRMCFJuA0DEMgykq", "flowCompletionUrl": "qjoHTpIPMSRAuPI7", "merchantId": 26, "projectId": 38, "projectSecretKey": "SZQ5UDm1q51PlW2H"}' \
    > test.out 2>&1
eval_tap $? 376 'UpdateXsollaConfig' test.out

#- 377 TestXsollaConfigById
./ng net.accelbyte.sdk.cli.Main platform testXsollaConfigById \
    --id 'G8LAiIzuo321Ll90' \
    > test.out 2>&1
eval_tap $? 377 'TestXsollaConfigById' test.out

#- 378 UpdateXsollaUIConfig
./ng net.accelbyte.sdk.cli.Main platform updateXsollaUIConfig \
    --id 'IBFsSb3FsV2PnCs9' \
    --body '{"device": "DESKTOP", "showCloseButton": true, "size": "MEDIUM", "theme": "DEFAULT"}' \
    > test.out 2>&1
eval_tap $? 378 'UpdateXsollaUIConfig' test.out

#- 379 QueryPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform queryPaymentProviderConfig \
    --limit '20' \
    --namespace "$AB_NAMESPACE" \
    --offset '86' \
    --region 'ZEwxcow6L7c3COEP' \
    > test.out 2>&1
eval_tap $? 379 'QueryPaymentProviderConfig' test.out

#- 380 CreatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform createPaymentProviderConfig \
    --body '{"aggregate": "STRIPE", "namespace": "TN56tJKwD8O07L9G", "region": "G1uenDihceaLdgPZ", "sandboxTaxJarApiToken": "I0fKW8LeQxItaK6s", "specials": ["XSOLLA", "PAYPAL", "ALIPAY"], "taxJarApiToken": "WB4XsdrxIF6kEAmK", "taxJarEnabled": false, "useGlobalTaxJarApiToken": true}' \
    > test.out 2>&1
eval_tap $? 380 'CreatePaymentProviderConfig' test.out

#- 381 GetAggregatePaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getAggregatePaymentProviders \
    > test.out 2>&1
eval_tap $? 381 'GetAggregatePaymentProviders' test.out

#- 382 DebugMatchedPaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform debugMatchedPaymentProviderConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'EmFPcUALNziO9Bz2' \
    > test.out 2>&1
eval_tap $? 382 'DebugMatchedPaymentProviderConfig' test.out

#- 383 GetSpecialPaymentProviders
./ng net.accelbyte.sdk.cli.Main platform getSpecialPaymentProviders \
    > test.out 2>&1
eval_tap $? 383 'GetSpecialPaymentProviders' test.out

#- 384 UpdatePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentProviderConfig \
    --id 'wx4kDAm8XIleiujt' \
    --body '{"aggregate": "NEONPAY", "namespace": "TCL467xHbAiD3Pr3", "region": "mXZO1PnbSlfVRlAI", "sandboxTaxJarApiToken": "8F2f3mEv09kAA5hn", "specials": ["PAYPAL", "ADYEN", "ALIPAY"], "taxJarApiToken": "4bcivHGIEplRpcHD", "taxJarEnabled": true, "useGlobalTaxJarApiToken": false}' \
    > test.out 2>&1
eval_tap $? 384 'UpdatePaymentProviderConfig' test.out

#- 385 DeletePaymentProviderConfig
./ng net.accelbyte.sdk.cli.Main platform deletePaymentProviderConfig \
    --id '9kOFBWhUTPiKR3qc' \
    > test.out 2>&1
eval_tap $? 385 'DeletePaymentProviderConfig' test.out

#- 386 GetPaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxConfig \
    > test.out 2>&1
eval_tap $? 386 'GetPaymentTaxConfig' test.out

#- 387 UpdatePaymentTaxConfig
./ng net.accelbyte.sdk.cli.Main platform updatePaymentTaxConfig \
    --body '{"sandboxTaxJarApiToken": "bHLGplYsS3jsRZff", "taxJarApiToken": "Cd00VrgPuNtOv3jb", "taxJarEnabled": false, "taxJarProductCodesMapping": {"s1E7sH2G9MJ6F7Rr": "7O15jqeKssQpme6e", "yM48tE7eJRsXNeve": "QXqnFRYmEIX40XOU", "oLOa7oDz00gxcoaH": "6u9TVf4DvEzpoPRi"}}' \
    > test.out 2>&1
eval_tap $? 387 'UpdatePaymentTaxConfig' test.out

#- 388 SyncPaymentOrders
./ng net.accelbyte.sdk.cli.Main platform syncPaymentOrders \
    --nextEvaluatedKey 'ClZ6rlwX99AHMLHq' \
    --end 'guYykVWzNwPcvGyi' \
    --start 'eBsRUduW5lxSlorW' \
    > test.out 2>&1
eval_tap $? 388 'SyncPaymentOrders' test.out

#- 389 PublicGetRootCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetRootCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'EGN5bPGSOSiiItrS' \
    --storeId 'rEJMBAIwTLkrMDFQ' \
    > test.out 2>&1
eval_tap $? 389 'PublicGetRootCategories' test.out

#- 390 DownloadCategories
./ng net.accelbyte.sdk.cli.Main platform downloadCategories \
    --namespace "$AB_NAMESPACE" \
    --language 'fpQ9o0GJMTfqRRaZ' \
    --storeId 'ozM8xCBoaS2FMwfW' \
    > test.out 2>&1
eval_tap $? 390 'DownloadCategories' test.out

#- 391 PublicGetCategory
./ng net.accelbyte.sdk.cli.Main platform publicGetCategory \
    --categoryPath 'NCbN5GelVOU0hHns' \
    --namespace "$AB_NAMESPACE" \
    --language 'Cl5k6Jxh5mkmQzKg' \
    --storeId '0jWCjpGwh7pLAi5J' \
    > test.out 2>&1
eval_tap $? 391 'PublicGetCategory' test.out

#- 392 PublicGetChildCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetChildCategories \
    --categoryPath 'mzvM6JFKB8ikHpl3' \
    --namespace "$AB_NAMESPACE" \
    --language 'sNRaDEC2OkXA3Wqy' \
    --storeId 'poOw0H2s0sibQNBz' \
    > test.out 2>&1
eval_tap $? 392 'PublicGetChildCategories' test.out

#- 393 PublicGetDescendantCategories
./ng net.accelbyte.sdk.cli.Main platform publicGetDescendantCategories \
    --categoryPath '81zRPntxpgi7tXIc' \
    --namespace "$AB_NAMESPACE" \
    --language 'NEcGJjOCXpuix5vn' \
    --storeId 'PeTu9evbRov7Bm40' \
    > test.out 2>&1
eval_tap $? 393 'PublicGetDescendantCategories' test.out

#- 394 PublicListCurrencies
./ng net.accelbyte.sdk.cli.Main platform publicListCurrencies \
    --namespace "$AB_NAMESPACE" \
    --currencyType 'VIRTUAL' \
    > test.out 2>&1
eval_tap $? 394 'PublicListCurrencies' test.out

#- 395 GeDLCDurableRewardShortMap
./ng net.accelbyte.sdk.cli.Main platform geDLCDurableRewardShortMap \
    --namespace "$AB_NAMESPACE" \
    --dlcType 'PSN' \
    > test.out 2>&1
eval_tap $? 395 'GeDLCDurableRewardShortMap' test.out

#- 396 GetAppleConfigVersion
./ng net.accelbyte.sdk.cli.Main platform getAppleConfigVersion \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 396 'GetAppleConfigVersion' test.out

#- 397 GetIAPItemMapping
./ng net.accelbyte.sdk.cli.Main platform getIAPItemMapping \
    --namespace "$AB_NAMESPACE" \
    --platform 'GOOGLE' \
    > test.out 2>&1
eval_tap $? 397 'GetIAPItemMapping' test.out

#- 398 PublicGetItemByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetItemByAppId \
    --namespace "$AB_NAMESPACE" \
    --language 'AJdkT7UYCV8agvwO' \
    --region 'I2LlOQNRN132Rdgw' \
    --storeId 'MXv9olKpRyWQim3q' \
    --appId 'lART9mPPmYUvlkBG' \
    > test.out 2>&1
eval_tap $? 398 'PublicGetItemByAppId' test.out

#- 399 PublicQueryItems
./ng net.accelbyte.sdk.cli.Main platform publicQueryItems \
    --namespace "$AB_NAMESPACE" \
    --appType 'GAME' \
    --autoCalcEstimatedPrice  \
    --baseAppId 'aFzkABC8zWMcYW5i' \
    --categoryPath 'Rrw32FRg8y4rOuj7' \
    --features 'J6ijJbcycXmBcrJL' \
    --includeSubCategoryItem  \
    --itemType 'APP' \
    --language '5YY6pYrmeMIHLS8e' \
    --limit '13' \
    --offset '9' \
    --region 'V8XhgDjbrum8Uxcu' \
    --sortBy 'createdAt,createdAt:desc' \
    --storeId 'wG7UQB9pXzuCK5qd' \
    --tags '2m8A5axixm9X9TXN' \
    > test.out 2>&1
eval_tap $? 399 'PublicQueryItems' test.out

#- 400 PublicGetItemBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetItemBySku \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'hN8y1PVriIyv9kju' \
    --region 'iAGiXx47etMikLFg' \
    --storeId 'gYDc2FMbzZoeKagn' \
    --sku 'Kf2Yifzvr9OqTsIn' \
    > test.out 2>&1
eval_tap $? 400 'PublicGetItemBySku' test.out

#- 401 PublicGetEstimatedPrice
./ng net.accelbyte.sdk.cli.Main platform publicGetEstimatedPrice \
    --namespace "$AB_NAMESPACE" \
    --region 'GzHFpFXYJtHtqwoI' \
    --storeId 'wQBeIALI8JNIII4j' \
    --itemIds 'rzrPsuMziNM8AB7R' \
    > test.out 2>&1
eval_tap $? 401 'PublicGetEstimatedPrice' test.out

#- 402 PublicBulkGetItems
./ng net.accelbyte.sdk.cli.Main platform publicBulkGetItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language 'RxiZH3ngnitURdMj' \
    --region 'ZLYCaeklQcFY1QIk' \
    --storeId '1h5EKvMGd6hQ2mHj' \
    --itemIds 'mLu4oFlReHy0JyZv' \
    > test.out 2>&1
eval_tap $? 402 'PublicBulkGetItems' test.out

#- 403 PublicValidateItemPurchaseCondition
./ng net.accelbyte.sdk.cli.Main platform publicValidateItemPurchaseCondition \
    --namespace "$AB_NAMESPACE" \
    --body '{"itemIds": ["7honqeiGTTqpgVsY", "1kPNdJiJXB3yjNUP", "IfvoXRO0CkW1ZcgU"]}' \
    > test.out 2>&1
eval_tap $? 403 'PublicValidateItemPurchaseCondition' test.out

#- 404 PublicSearchItems
./ng net.accelbyte.sdk.cli.Main platform publicSearchItems \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --itemType 'APP' \
    --limit '98' \
    --offset '3' \
    --region 'vrIAEehUV0jsjAyV' \
    --storeId 'gxS54NNs3XdhMbQX' \
    --keyword '9D1znEWw9p7g4UsQ' \
    --language 'CTKDh5n9yc34xF8q' \
    > test.out 2>&1
eval_tap $? 404 'PublicSearchItems' test.out

#- 405 PublicGetApp
./ng net.accelbyte.sdk.cli.Main platform publicGetApp \
    --itemId 'FllM1LTrl4MP3Nl4' \
    --namespace "$AB_NAMESPACE" \
    --language 'T3ujvV7W6ADLtn7o' \
    --region 'Inn1Bz3wM3BI51et' \
    --storeId 'n17OcmSVHZ6wtPVA' \
    > test.out 2>&1
eval_tap $? 405 'PublicGetApp' test.out

#- 406 PublicGetItemDynamicData
./ng net.accelbyte.sdk.cli.Main platform publicGetItemDynamicData \
    --itemId 'wgvxYxXJTduZp1nN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 406 'PublicGetItemDynamicData' test.out

#- 407 PublicGetItem
./ng net.accelbyte.sdk.cli.Main platform publicGetItem \
    --itemId 'YHREmm1cBuaRaGeM' \
    --namespace "$AB_NAMESPACE" \
    --autoCalcEstimatedPrice  \
    --language '8yxRfejqSbVgLd1F' \
    --populateBundle  \
    --region 'oyNFGpu5r2K0IvVg' \
    --storeId '5LwUygH98dzTL8az' \
    > test.out 2>&1
eval_tap $? 407 'PublicGetItem' test.out

#- 408 GetPaymentCustomization
eval_tap 0 408 'GetPaymentCustomization # SKIP deprecated' test.out

#- 409 PublicGetPaymentUrl
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentUrl \
    --namespace "$AB_NAMESPACE" \
    --body '{"neonPayConfig": {"cancelUrl": "KCCNBZpwRFNYxx2d", "successUrl": "r6DDuDHXcfvXPXJU"}, "paymentOrderNo": "RX3XwhOlgcpcOIxq", "paymentProvider": "WXPAY", "returnUrl": "53BYMBacQBIuDVs7", "ui": "U0AJtWPRteszMTd0", "zipCode": "R5Fsrf9xbVfgvG61"}' \
    > test.out 2>&1
eval_tap $? 409 'PublicGetPaymentUrl' test.out

#- 410 PublicGetPaymentMethods
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentMethods \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo '7GmxzClkR3M6Twpw' \
    > test.out 2>&1
eval_tap $? 410 'PublicGetPaymentMethods' test.out

#- 411 PublicGetUnpaidPaymentOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUnpaidPaymentOrder \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'q3nLwxnJKjOo9fvf' \
    > test.out 2>&1
eval_tap $? 411 'PublicGetUnpaidPaymentOrder' test.out

#- 412 Pay
./ng net.accelbyte.sdk.cli.Main platform pay \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'XF1VsikD3IphQQiR' \
    --paymentProvider 'ADYEN' \
    --zipCode 'jyGID39Ung1D57Fj' \
    --body '{"token": "YKlJiRIvhej77OSP"}' \
    > test.out 2>&1
eval_tap $? 412 'Pay' test.out

#- 413 PublicCheckPaymentOrderPaidStatus
./ng net.accelbyte.sdk.cli.Main platform publicCheckPaymentOrderPaidStatus \
    --namespace "$AB_NAMESPACE" \
    --paymentOrderNo 'wdzMSmrSvQdsAdTU' \
    > test.out 2>&1
eval_tap $? 413 'PublicCheckPaymentOrderPaidStatus' test.out

#- 414 GetPaymentPublicConfig
./ng net.accelbyte.sdk.cli.Main platform getPaymentPublicConfig \
    --namespace "$AB_NAMESPACE" \
    --sandbox  \
    --paymentProvider 'XSOLLA' \
    --region 'yRdiOikUdqGocLYB' \
    > test.out 2>&1
eval_tap $? 414 'GetPaymentPublicConfig' test.out

#- 415 PublicGetQRCode
./ng net.accelbyte.sdk.cli.Main platform publicGetQRCode \
    --namespace "$AB_NAMESPACE" \
    --code 'aRC7T5qSl7WN3ncP' \
    > test.out 2>&1
eval_tap $? 415 'PublicGetQRCode' test.out

#- 416 PublicNormalizePaymentReturnUrl
./ng net.accelbyte.sdk.cli.Main platform publicNormalizePaymentReturnUrl \
    --namespace "$AB_NAMESPACE" \
    --payerID 'kqiTKzz72PKXjShM' \
    --foreinginvoice '2DvesmMIbiQfaHxl' \
    --invoiceId '2YUNRLRjgKqSSYgZ' \
    --payload 'nVfa8govttlpFAq8' \
    --redirectResult 'oebnS4Y2zkGYTr9y' \
    --resultCode 'JIveX52r6Inl9VTJ' \
    --sessionId 'B9Al3mn2DsHDHzSV' \
    --status 'JzhU5Z44zgZ1fieL' \
    --token 'dl3Y82DOj5kPuNRZ' \
    --type 'ZaUccuBYep9n7b17' \
    --userId 'fsblalJrwQiU3DD0' \
    --orderNo 'xZFH1fHFLSr0O4rE' \
    --paymentOrderNo 'ZTbFDj2L2McvCrrR' \
    --paymentProvider 'ALIPAY' \
    --returnUrl 'NV00KVuLF9WDnGO3' \
    > test.out 2>&1
eval_tap $? 416 'PublicNormalizePaymentReturnUrl' test.out

#- 417 GetPaymentTaxValue
./ng net.accelbyte.sdk.cli.Main platform getPaymentTaxValue \
    --namespace "$AB_NAMESPACE" \
    --zipCode 'bpQWmnS52ZuuuI7F' \
    --paymentOrderNo '1xpVrcoXzSOEGEDY' \
    --paymentProvider 'ALIPAY' \
    > test.out 2>&1
eval_tap $? 417 'GetPaymentTaxValue' test.out

#- 418 GetRewardByCode
./ng net.accelbyte.sdk.cli.Main platform getRewardByCode \
    --namespace "$AB_NAMESPACE" \
    --rewardCode 'eRa1R6ksxLYGkOLg' \
    > test.out 2>&1
eval_tap $? 418 'GetRewardByCode' test.out

#- 419 QueryRewards1
./ng net.accelbyte.sdk.cli.Main platform queryRewards1 \
    --namespace "$AB_NAMESPACE" \
    --eventTopic 'Reff5IHxLJIemNHb' \
    --limit '52' \
    --offset '29' \
    --sortBy 'rewardCode,namespace' \
    > test.out 2>&1
eval_tap $? 419 'QueryRewards1' test.out

#- 420 GetReward1
./ng net.accelbyte.sdk.cli.Main platform getReward1 \
    --namespace "$AB_NAMESPACE" \
    --rewardId 'FjtjC7suvgIUkB2P' \
    > test.out 2>&1
eval_tap $? 420 'GetReward1' test.out

#- 421 PublicListStores
./ng net.accelbyte.sdk.cli.Main platform publicListStores \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 421 'PublicListStores' test.out

#- 422 PublicExistsAnyMyActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyMyActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --appIds 'AGJqOrkdlZB246OY,0dPVMd2WDUVEQTpf,yAIoF7qsANBbEKQr' \
    --itemIds 'gocpjGNenRlDORLv,P7ynTuXzafCqlMrr,VIehVCf3AwIzUdQ6' \
    --skus 'sTrUg7Z0SLrZraV3,NLBUSrFnzE6yR1wL,TgjsnB2LFVrZRrOn' \
    > test.out 2>&1
eval_tap $? 422 'PublicExistsAnyMyActiveEntitlement' test.out

#- 423 PublicGetMyAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --appId 'tm2KjbfCOuW3dBmF' \
    > test.out 2>&1
eval_tap $? 423 'PublicGetMyAppEntitlementOwnershipByAppId' test.out

#- 424 PublicGetMyEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'ENTITLEMENT' \
    --itemId 'Sk6suS90ZbDdmjU1' \
    > test.out 2>&1
eval_tap $? 424 'PublicGetMyEntitlementOwnershipByItemId' test.out

#- 425 PublicGetMyEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetMyEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --entitlementClazz 'SUBSCRIPTION' \
    --sku 'UppvO3QG68KeD7QJ' \
    > test.out 2>&1
eval_tap $? 425 'PublicGetMyEntitlementOwnershipBySku' test.out

#- 426 PublicGetEntitlementOwnershipToken
./ng net.accelbyte.sdk.cli.Main platform publicGetEntitlementOwnershipToken \
    --namespace "$AB_NAMESPACE" \
    --appIds 'QEEVDAg045BvtPd7,ibBA3sd51mDooH53,vibq3Qcrtt8L5dIe' \
    --itemIds 'bsw7EjkMnJSziEA4,3WqIMJdrqHIsJ98W,RjqYieXRthQZvzRi' \
    --skus '7pqpajYEHs9TIkcn,rJ64BOKqywS6DKNS,eb2UMWOgVeYkCvqq' \
    > test.out 2>&1
eval_tap $? 426 'PublicGetEntitlementOwnershipToken' test.out

#- 427 SyncTwitchDropsEntitlement
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement \
    --namespace "$AB_NAMESPACE" \
    --body '{"gameId": "0tO15pEVG7sNihxp", "language": "vVl-dXnW", "region": "zZnh8oBAk1MNCAUm"}' \
    > test.out 2>&1
eval_tap $? 427 'SyncTwitchDropsEntitlement' test.out

#- 428 PublicGetMyWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetMyWallet \
    --currencyCode 'dnLaVRUu5VbjwPa9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 428 'PublicGetMyWallet' test.out

#- 429 SyncEpicGameDLC
./ng net.accelbyte.sdk.cli.Main platform syncEpicGameDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'rYgHaxeTT3ebuaYP' \
    --body '{"epicGamesJwtToken": "NBp9wA4LxO2n7WJQ"}' \
    > test.out 2>&1
eval_tap $? 429 'SyncEpicGameDLC' test.out

#- 430 SyncOculusDLC
./ng net.accelbyte.sdk.cli.Main platform syncOculusDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'FzBCD9S03D7JLsIM' \
    > test.out 2>&1
eval_tap $? 430 'SyncOculusDLC' test.out

#- 431 PublicSyncPsnDlcInventory
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventory \
    --namespace "$AB_NAMESPACE" \
    --userId '3VOMRvvqkXDMPzOB' \
    --body '{"serviceLabel": 61}' \
    > test.out 2>&1
eval_tap $? 431 'PublicSyncPsnDlcInventory' test.out

#- 432 PublicSyncPsnDlcInventoryWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicSyncPsnDlcInventoryWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId '8tpk0qhZath4b4Ht' \
    --body '{"serviceLabels": [1, 45, 62]}' \
    > test.out 2>&1
eval_tap $? 432 'PublicSyncPsnDlcInventoryWithMultipleServiceLabels' test.out

#- 433 SyncSteamDLC
./ng net.accelbyte.sdk.cli.Main platform syncSteamDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'L4oAF2lqx8yneWKr' \
    --body '{"appId": "Oy4xcg30BqC5W7g7", "steamId": "hiwumJTI3jlZPjoC"}' \
    > test.out 2>&1
eval_tap $? 433 'SyncSteamDLC' test.out

#- 434 SyncXboxDLC
./ng net.accelbyte.sdk.cli.Main platform syncXboxDLC \
    --namespace "$AB_NAMESPACE" \
    --userId 'dGiIP6cB3Pj63MJX' \
    --body '{"xstsToken": "IuLWYb2iHHVN0ZBg"}' \
    > test.out 2>&1
eval_tap $? 434 'SyncXboxDLC' test.out

#- 435 PublicQueryUserEntitlements
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'vrigXUT4fRbawD5y' \
    --appType 'GAME' \
    --entitlementClazz 'LOOTBOX' \
    --entitlementName 'jgOopQfbXmtF0WFH' \
    --features '7F2InhxtynUjuBCx,kb2oF99xI1VVtVrV,T6Hn8B2d1hZUnoQw' \
    --itemId 'g5uqgoHaFyoczck0,qJsgZPfuelAiZBZc,QGHHGI7csI8ecZSv' \
    --limit '53' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 435 'PublicQueryUserEntitlements' test.out

#- 436 PublicGetUserAppEntitlementByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId 'XYOytshBcKQytQag' \
    --appId 'ui6lsKF28n7UC7y1' \
    > test.out 2>&1
eval_tap $? 436 'PublicGetUserAppEntitlementByAppId' test.out

#- 437 PublicQueryUserEntitlementsByAppType
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserEntitlementsByAppType \
    --namespace "$AB_NAMESPACE" \
    --userId 'MKYVeoGFrDb8unXv' \
    --limit '54' \
    --offset '17' \
    --appType 'SOFTWARE' \
    > test.out 2>&1
eval_tap $? 437 'PublicQueryUserEntitlementsByAppType' test.out

#- 438 PublicGetUserEntitlementsByIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementsByIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'kzTRNRVyeEGu1ICO' \
    --availablePlatformOnly  \
    --ids 'CmLAmcaEFBKgy92L,YqtQcDN7OMCehk42,acy8wsWaPyppR3zt' \
    > test.out 2>&1
eval_tap $? 438 'PublicGetUserEntitlementsByIds' test.out

#- 439 PublicGetUserEntitlementByItemId
eval_tap 0 439 'PublicGetUserEntitlementByItemId # SKIP deprecated' test.out

#- 440 PublicGetUserEntitlementBySku
eval_tap 0 440 'PublicGetUserEntitlementBySku # SKIP deprecated' test.out

#- 441 PublicUserEntitlementHistory
./ng net.accelbyte.sdk.cli.Main platform publicUserEntitlementHistory \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSALA8LlV2sccbVr' \
    --endDate '6HSiXVzrG4EdKn8e' \
    --entitlementClazz 'LOOTBOX' \
    --limit '31' \
    --offset '73' \
    --startDate 'TzI497DG0ZNoJvvi' \
    > test.out 2>&1
eval_tap $? 441 'PublicUserEntitlementHistory' test.out

#- 442 PublicExistsAnyUserActiveEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicExistsAnyUserActiveEntitlement \
    --namespace "$AB_NAMESPACE" \
    --userId '4Ys50iE7IjZoDzMm' \
    --appIds 'MgoMxZZ9AutWDfVO,INhql9CdDX4xiHpd,fKH35RWUUVEHCB5w' \
    --itemIds 'zF6oLIrAwjAsgo51,XHJBG2PmyeFaBiT3,SyLHXZSyfjukWmkf' \
    --skus 'kiF2GZPuyWBVH66J,U1IICVNNRV4lBToT,cn1l44ebrKEKdeo7' \
    > test.out 2>&1
eval_tap $? 442 'PublicExistsAnyUserActiveEntitlement' test.out

#- 443 PublicGetUserAppEntitlementOwnershipByAppId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserAppEntitlementOwnershipByAppId \
    --namespace "$AB_NAMESPACE" \
    --userId '79KG5yCz9jVs1lYK' \
    --appId '1Mx9rEFkDqb31AZz' \
    > test.out 2>&1
eval_tap $? 443 'PublicGetUserAppEntitlementOwnershipByAppId' test.out

#- 444 PublicGetUserEntitlementOwnershipByItemId
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'wiQBaGdS41VRIyAH' \
    --entitlementClazz 'CODE' \
    --itemId '8ZCVJtkxjBJrNeQR' \
    > test.out 2>&1
eval_tap $? 444 'PublicGetUserEntitlementOwnershipByItemId' test.out

#- 445 PublicGetUserEntitlementOwnershipByItemIds
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipByItemIds \
    --namespace "$AB_NAMESPACE" \
    --userId 'sqkkKK2qxqzy4KSA' \
    --ids '5UtSXWjANSWIT9TL,nuMLNJAEk3A6A6rY,iIu8eLdWykhBxLFn' \
    > test.out 2>&1
eval_tap $? 445 'PublicGetUserEntitlementOwnershipByItemIds' test.out

#- 446 PublicGetUserEntitlementOwnershipBySku
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlementOwnershipBySku \
    --namespace "$AB_NAMESPACE" \
    --userId 'KnSYC9yyBYepIqtr' \
    --entitlementClazz 'CODE' \
    --sku 'cSrZL2CgHxdmYDj9' \
    > test.out 2>&1
eval_tap $? 446 'PublicGetUserEntitlementOwnershipBySku' test.out

#- 447 PublicGetUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicGetUserEntitlement \
    --entitlementId 'vZNgfI1AeYHe8WPQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GPclChxLfbXrH6f2' \
    > test.out 2>&1
eval_tap $? 447 'PublicGetUserEntitlement' test.out

#- 448 PublicConsumeUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicConsumeUserEntitlement \
    --entitlementId 'GDrNbLOjGz34ct0c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tEeH43wYuLnI7cTz' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "options": ["UERPlQI99hMc4Nbi", "JWP5r9EwbIGMGJ70", "P9IqAyNlZ2OwFSeb"], "requestId": "BkXkaxtY97TMJH8b", "useCount": 82}' \
    > test.out 2>&1
eval_tap $? 448 'PublicConsumeUserEntitlement' test.out

#- 449 PublicSellUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSellUserEntitlement \
    --entitlementId 'LkxFnAqyvjBy0NXg' \
    --namespace "$AB_NAMESPACE" \
    --userId '7zd6SFpkV7cAICgW' \
    --body '{"requestId": "FJZGnNa5yOM68r4W", "useCount": 75}' \
    > test.out 2>&1
eval_tap $? 449 'PublicSellUserEntitlement' test.out

#- 450 PublicSplitUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicSplitUserEntitlement \
    --entitlementId 'fDZL80oPQ0s7QhC8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hgSgytNEojK3YgWH' \
    --body '{"metadata": {"operationSource": "INVENTORY"}, "useCount": 23}' \
    > test.out 2>&1
eval_tap $? 450 'PublicSplitUserEntitlement' test.out

#- 451 PublicTransferUserEntitlement
./ng net.accelbyte.sdk.cli.Main platform publicTransferUserEntitlement \
    --entitlementId '7qjDHMS49dkv8vxy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g6giNKzeFnlgGRgY' \
    --body '{"entitlementId": "K3SeYvULYNIhs5PZ", "metadata": {"operationSource": "INVENTORY"}, "useCount": 6}' \
    > test.out 2>&1
eval_tap $? 451 'PublicTransferUserEntitlement' test.out

#- 452 PublicRedeemCode
./ng net.accelbyte.sdk.cli.Main platform publicRedeemCode \
    --namespace "$AB_NAMESPACE" \
    --userId 'gofq7nlF5Ch8J2Qs' \
    --body '{"code": "990APOU4hcdwlnsT", "language": "UP_UNCz-839", "region": "hWmCCIrP0lJXexse"}' \
    > test.out 2>&1
eval_tap $? 452 'PublicRedeemCode' test.out

#- 453 PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'o2e6BCNJTTRIHDKd' \
    --body '{"excludeOldTransactions": false, "language": "pv-mBiN", "productId": "0n8MsRjaB8iurBWW", "receiptData": "5jSJi0seeGJIqnat", "region": "ME8GnNWfAY1yY6D1", "transactionId": "Euusf0eOzoSyKttY"}' \
    > test.out 2>&1
eval_tap $? 453 'PublicFulfillAppleIAPItem' test.out

#- 454 SyncEpicGamesInventory
./ng net.accelbyte.sdk.cli.Main platform syncEpicGamesInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUUlMRG8vO0OSsJm' \
    --body '{"epicGamesJwtToken": "hOJDUyyag9jBDJFJ"}' \
    > test.out 2>&1
eval_tap $? 454 'SyncEpicGamesInventory' test.out

#- 455 PublicFulfillGoogleIAPItem
./ng net.accelbyte.sdk.cli.Main platform publicFulfillGoogleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'GOEiWJ8cLrryS5a6' \
    --body '{"autoAck": true, "autoConsume": false, "language": "Tzm_RYwl_ul", "orderId": "VwPIt1hrg2mhbI0N", "packageName": "Dshb7ZzQuBPyNi1G", "productId": "hZHEj6p5grjk5wzd", "purchaseTime": 21, "purchaseToken": "HqlTTkL8cmpA0sZ0", "region": "tgeR4UV5SMZ8GUvW", "subscriptionPurchase": false}' \
    > test.out 2>&1
eval_tap $? 455 'PublicFulfillGoogleIAPItem' test.out

#- 456 SyncOculusConsumableEntitlements
./ng net.accelbyte.sdk.cli.Main platform syncOculusConsumableEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'voCmprkv7A8MRutC' \
    > test.out 2>&1
eval_tap $? 456 'SyncOculusConsumableEntitlements' test.out

#- 457 PublicReconcilePlayStationStore
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStore \
    --namespace "$AB_NAMESPACE" \
    --userId 'KCsqmx2zriOGB8b5' \
    --body '{"currencyCode": "qTFp3cIxOI33nt54", "price": 0.14207337998197156, "productId": "5hdAezedcppbujZh", "serviceLabel": 73}' \
    > test.out 2>&1
eval_tap $? 457 'PublicReconcilePlayStationStore' test.out

#- 458 PublicReconcilePlayStationStoreWithMultipleServiceLabels
./ng net.accelbyte.sdk.cli.Main platform publicReconcilePlayStationStoreWithMultipleServiceLabels \
    --namespace "$AB_NAMESPACE" \
    --userId 'fYXF6R9Rz3HVP2Y9' \
    --body '{"currencyCode": "WqSRiwV3UZg0UJLP", "price": 0.6279557206655192, "productId": "keUwa6OVKxCMxuf0", "serviceLabels": [37, 85, 63]}' \
    > test.out 2>&1
eval_tap $? 458 'PublicReconcilePlayStationStoreWithMultipleServiceLabels' test.out

#- 459 SyncSteamInventory
./ng net.accelbyte.sdk.cli.Main platform syncSteamInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'VpBmsUzx64Gr4XEm' \
    --body '{"appId": "0uYYuAmqhftIfe2z", "currencyCode": "dqZ7ht1vUiJ7jBXy", "language": "Ts", "price": 0.4179045896587755, "productId": "U8FwQtZpfUoyoiUj", "region": "mqOyQ7ammFgHprdM", "steamId": "9viFWmezrQOWH03z"}' \
    > test.out 2>&1
eval_tap $? 459 'SyncSteamInventory' test.out

#- 460 SyncSteamAbnormalTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamAbnormalTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId 'yr7kRbC31YMJfRiD' \
    > test.out 2>&1
eval_tap $? 460 'SyncSteamAbnormalTransaction' test.out

#- 461 SyncSteamIAPByTransaction
./ng net.accelbyte.sdk.cli.Main platform syncSteamIAPByTransaction \
    --namespace "$AB_NAMESPACE" \
    --userId '7djt1VeOFBDA3gvC' \
    --body '{"orderId": "RfoBijpbMblGWnp9"}' \
    > test.out 2>&1
eval_tap $? 461 'SyncSteamIAPByTransaction' test.out

#- 462 PublicQueryUserThirdPartySubscription
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserThirdPartySubscription \
    --namespace "$AB_NAMESPACE" \
    --platform 'APPLE' \
    --userId 'c00PA2ef1jFeqQ8m' \
    --activeOnly  \
    --groupId 'BpTuvLTJUzwXJFaW' \
    --limit '100' \
    --offset '44' \
    --productId '3JVdYpfHOYoLva2c' \
    > test.out 2>&1
eval_tap $? 462 'PublicQueryUserThirdPartySubscription' test.out

#- 463 SyncTwitchDropsEntitlement1
./ng net.accelbyte.sdk.cli.Main platform syncTwitchDropsEntitlement1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4JscEQfBFZXcSXpU' \
    --body '{"gameId": "81S5H9XsZyvZOFJ5", "language": "rSjg", "region": "BktqqAAF6YG1dD1v"}' \
    > test.out 2>&1
eval_tap $? 463 'SyncTwitchDropsEntitlement1' test.out

#- 464 SyncXboxInventory
./ng net.accelbyte.sdk.cli.Main platform syncXboxInventory \
    --namespace "$AB_NAMESPACE" \
    --userId 'ECBb01VFFhO5FcdT' \
    --body '{"currencyCode": "vIDQI2uIi2SNZKql", "price": 0.5755518367700988, "productId": "ZsdnY04DIyosprZP", "xstsToken": "BaERb7U9kK4VctUm"}' \
    > test.out 2>&1
eval_tap $? 464 'SyncXboxInventory' test.out

#- 465 PublicQueryUserOrders
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserOrders \
    --namespace "$AB_NAMESPACE" \
    --userId 'DhFVNa0JYzTbdnOn' \
    --discounted  \
    --itemId 'EarWP4nrJ5fNESRV' \
    --limit '66' \
    --offset '0' \
    --status 'CHARGEBACK_REVERSED' \
    > test.out 2>&1
eval_tap $? 465 'PublicQueryUserOrders' test.out

#- 466 PublicCreateUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCreateUserOrder \
    --namespace "$AB_NAMESPACE" \
    --userId 'WaGvrzBdLvFUBZDn' \
    --body '{"currencyCode": "VrcwbsD0RDLxWgEW", "discountCodes": ["PPAJ6Z9UzqIhZZiK", "woHpV8E1xQZLa7Kw", "77UpCxNyx1jjdxNe"], "discountedPrice": 88, "ext": {"qA1OiblWlz2LXQNq": {}, "cONcJIsYRQz97fRW": {}, "I17eNP3Y2nWlS9Sf": {}}, "itemId": "jh0htyVaGj4y9ahS", "language": "Hq_Ci", "price": 89, "quantity": 37, "region": "s5FVQSIqObR55tV0", "returnUrl": "BlN1iFvw0GSLBmie", "sectionId": "8SJckSRbu7hgmUm7"}' \
    > test.out 2>&1
eval_tap $? 466 'PublicCreateUserOrder' test.out

#- 467 PublicPreviewOrderPrice
./ng net.accelbyte.sdk.cli.Main platform publicPreviewOrderPrice \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVCUREDdoGatGQ1S' \
    --body '{"currencyCode": "eOXsg4jofp9PvlQ1", "discountCodes": ["xdmr4JDpvZgvPGHj", "VT0aWj58Othvd3jz", "V7MNTpM7fSods1zd"], "discountedPrice": 78, "itemId": "p5GJHHbsLJ73mCPh", "price": 14, "quantity": 69}' \
    > test.out 2>&1
eval_tap $? 467 'PublicPreviewOrderPrice' test.out

#- 468 PublicGetUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'mUyIwgQS9kVFUbeT' \
    --userId 'eB9KgnFZQ9lVMNyC' \
    > test.out 2>&1
eval_tap $? 468 'PublicGetUserOrder' test.out

#- 469 PublicCancelUserOrder
./ng net.accelbyte.sdk.cli.Main platform publicCancelUserOrder \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'iytnfMoO1I3KISTb' \
    --userId 'n4yEa2AaBRalz5HE' \
    > test.out 2>&1
eval_tap $? 469 'PublicCancelUserOrder' test.out

#- 470 PublicGetUserOrderHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserOrderHistories \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'm4Gant6aqjKzWDAa' \
    --userId 'uqLKarcLQRQtC927' \
    > test.out 2>&1
eval_tap $? 470 'PublicGetUserOrderHistories' test.out

#- 471 PublicDownloadUserOrderReceipt
./ng net.accelbyte.sdk.cli.Main platform publicDownloadUserOrderReceipt \
    --namespace "$AB_NAMESPACE" \
    --orderNo 'GneBM8LvzgyIVzGF' \
    --userId 'BLJ5vbC9NfLTFJGO' \
    > test.out 2>&1
eval_tap $? 471 'PublicDownloadUserOrderReceipt' test.out

#- 472 PublicGetPaymentAccounts
./ng net.accelbyte.sdk.cli.Main platform publicGetPaymentAccounts \
    --namespace "$AB_NAMESPACE" \
    --userId 'zAIAqpmkDdFSs4s7' \
    > test.out 2>&1
eval_tap $? 472 'PublicGetPaymentAccounts' test.out

#- 473 PublicDeletePaymentAccount
./ng net.accelbyte.sdk.cli.Main platform publicDeletePaymentAccount \
    --id 'u1VUuLmenyxTQVkE' \
    --namespace "$AB_NAMESPACE" \
    --type 'card' \
    --userId 'p0GXpM4nbG7aww2T' \
    > test.out 2>&1
eval_tap $? 473 'PublicDeletePaymentAccount' test.out

#- 474 PublicListActiveSections
./ng net.accelbyte.sdk.cli.Main platform publicListActiveSections \
    --namespace "$AB_NAMESPACE" \
    --userId 'ANW1Or7TvLoL0wwH' \
    --autoCalcEstimatedPrice  \
    --language 'oRMNexBOron8wIdU' \
    --region 'bp7xVMKfbAJfW4iM' \
    --storeId 'IC52NUedhhkME18q' \
    --viewId 'GpSsyEPDWHcqfYp2' \
    > test.out 2>&1
eval_tap $? 474 'PublicListActiveSections' test.out

#- 475 PublicQueryUserSubscriptions
./ng net.accelbyte.sdk.cli.Main platform publicQueryUserSubscriptions \
    --namespace "$AB_NAMESPACE" \
    --userId 'EFxEaEHCGtg812NQ' \
    --chargeStatus 'CHARGED' \
    --itemId 'TNqoLFFS4wB6Um7i' \
    --limit '36' \
    --offset '27' \
    --sku 'Uo1BO1rE7E12Fapa' \
    --status 'CANCELLED' \
    --subscribedBy 'USER' \
    > test.out 2>&1
eval_tap $? 475 'PublicQueryUserSubscriptions' test.out

#- 476 PublicSubscribeSubscription
./ng net.accelbyte.sdk.cli.Main platform publicSubscribeSubscription \
    --namespace "$AB_NAMESPACE" \
    --userId '5jo9nJoKEb8tHmFw' \
    --body '{"currencyCode": "LGan2SrKckNxLWH6", "itemId": "rjhRL9uxoV5Oe8kt", "language": "vE-dYob-613", "region": "tOXZy9cQ6B074dTJ", "returnUrl": "ZqeOllKQNwJUGtC0", "source": "tAhxn1ay6ruu7PYW"}' \
    > test.out 2>&1
eval_tap $? 476 'PublicSubscribeSubscription' test.out

#- 477 PublicCheckUserSubscriptionSubscribableByItemId
./ng net.accelbyte.sdk.cli.Main platform publicCheckUserSubscriptionSubscribableByItemId \
    --namespace "$AB_NAMESPACE" \
    --userId 'HODRb6skOj0lfYFG' \
    --itemId 'nQCAWidWPjYgyebU' \
    > test.out 2>&1
eval_tap $? 477 'PublicCheckUserSubscriptionSubscribableByItemId' test.out

#- 478 PublicGetUserSubscription
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId '6rHFirnUpZ9UJ4N7' \
    --userId '8qHTGdn7gE4bwLzD' \
    > test.out 2>&1
eval_tap $? 478 'PublicGetUserSubscription' test.out

#- 479 PublicChangeSubscriptionBillingAccount
./ng net.accelbyte.sdk.cli.Main platform publicChangeSubscriptionBillingAccount \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'Ew2PYt8x9SSaOZcE' \
    --userId 'vG6KZh954BmtuIFl' \
    > test.out 2>&1
eval_tap $? 479 'PublicChangeSubscriptionBillingAccount' test.out

#- 480 PublicCancelSubscription
./ng net.accelbyte.sdk.cli.Main platform publicCancelSubscription \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'lfSUnaUhC4x11AS2' \
    --userId 'jTKoTYeHaCuN7zpX' \
    --body '{"immediate": false, "reason": "vp4QJdCrwkz0nw2o"}' \
    > test.out 2>&1
eval_tap $? 480 'PublicCancelSubscription' test.out

#- 481 PublicGetUserSubscriptionBillingHistories
./ng net.accelbyte.sdk.cli.Main platform publicGetUserSubscriptionBillingHistories \
    --namespace "$AB_NAMESPACE" \
    --subscriptionId 'xKye8jZqj7k0YiLq' \
    --userId 'OUSBuwR388REDRuY' \
    --excludeFree  \
    --limit '56' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 481 'PublicGetUserSubscriptionBillingHistories' test.out

#- 482 PublicListViews
./ng net.accelbyte.sdk.cli.Main platform publicListViews \
    --namespace "$AB_NAMESPACE" \
    --userId 'nWiEsOnDfIAN04f5' \
    --language 'kSONmw1BDqqSctLL' \
    --storeId '4WfGq8JCDnwGWgcc' \
    > test.out 2>&1
eval_tap $? 482 'PublicListViews' test.out

#- 483 PublicGetWallet
./ng net.accelbyte.sdk.cli.Main platform publicGetWallet \
    --currencyCode 'uzuc6QDRMGdBPbUy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HTYPS8CGKXGon2ec' \
    > test.out 2>&1
eval_tap $? 483 'PublicGetWallet' test.out

#- 484 PublicListUserWalletTransactions
./ng net.accelbyte.sdk.cli.Main platform publicListUserWalletTransactions \
    --currencyCode 'c65YAFLweD9Z7U2l' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nkorrw9QH3rNhDep' \
    --limit '88' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 484 'PublicListUserWalletTransactions' test.out

#- 485 PublicGetMyDLCContent
./ng net.accelbyte.sdk.cli.Main platform publicGetMyDLCContent \
    --includeAllNamespaces  \
    --type 'PSN' \
    > test.out 2>&1
eval_tap $? 485 'PublicGetMyDLCContent' test.out

#- 486 QueryFulfillments
./ng net.accelbyte.sdk.cli.Main platform queryFulfillments \
    --namespace "$AB_NAMESPACE" \
    --endTime 'b3fHCIJZkwEcCRi2' \
    --limit '95' \
    --offset '37' \
    --startTime 'ifTd5nAOF9VV7JgC' \
    --state 'FULFILL_FAILED' \
    --transactionId 'jydyzGDZM4zTTYI6' \
    --userId 'O8coYDWUfcL1qseg' \
    > test.out 2>&1
eval_tap $? 486 'QueryFulfillments' test.out

#- 487 QueryItemsV2
./ng net.accelbyte.sdk.cli.Main platform queryItemsV2 \
    --namespace "$AB_NAMESPACE" \
    --appType 'SOFTWARE' \
    --availableDate '496H02yOVN1h41jI' \
    --baseAppId 'POMXufZPWSe20JfN' \
    --categoryPath 'vtNcWtpUkw98x3tM' \
    --features 'M1bFFDIqKD8HJ4X0' \
    --includeSubCategoryItem  \
    --itemName 'DetCeJ4x0wf5mQx6' \
    --itemStatus 'ACTIVE' \
    --itemType 'EXTENSION,CODE,SEASON' \
    --limit '93' \
    --offset '49' \
    --region 'apPMc8ZR3bPCJ5n5' \
    --sectionExclusive  \
    --sortBy 'updatedAt:asc,name,createdAt:asc' \
    --storeId 'Sw4twReM5DcHde3f' \
    --tags 'kHf7tH8WTOTeBOcY' \
    --targetNamespace 'hf6nGCnPjiIbJifs' \
    --withTotal  \
    > test.out 2>&1
eval_tap $? 487 'QueryItemsV2' test.out

#- 488 ImportStore1
./ng net.accelbyte.sdk.cli.Main platform importStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId '0arKxCcNv8FQCyQB' \
    --strictMode  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 488 'ImportStore1' test.out

#- 489 ExportStore1
./ng net.accelbyte.sdk.cli.Main platform exportStore1 \
    --namespace "$AB_NAMESPACE" \
    --storeId 'qKxayGvw7MqOsypC' \
    --body '{"itemIds": ["JmfRnW0spgvjt7eC", "LDu6PA3PRnQtB410", "iWT0SILVGXCWRucR"]}' \
    > test.out 2>&1
eval_tap $? 489 'ExportStore1' test.out

#- 490 FulfillRewardsV2
./ng net.accelbyte.sdk.cli.Main platform fulfillRewardsV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pP1Tq7uYXhB6FPfF' \
    --body '{"entitlementCollectionId": "5DvveMdBsPt19V2F", "entitlementOrigin": "IOS", "metadata": {"J7IIUXlBlZMQeSnO": {}, "g5gf1SwrbpmoF4Dv": {}, "NA1wo9IAxV5C71gT": {}}, "origin": "Other", "rewards": [{"currency": {"currencyCode": "gto2EhOlnsuDnkuO", "namespace": "JekbO0sk7o1z37uu"}, "item": {"itemId": "qLDQF12kYfBqeQxo", "itemName": "s58kVk7F1KKOfFFL", "itemSku": "vER3xqCwUgKa4oCB", "itemType": "oJDxGa1UuSr4ehnV"}, "quantity": 28, "type": "ITEM"}, {"currency": {"currencyCode": "42UuxEyfzZJsZd9s", "namespace": "B6CV9KiWkbdpGqWQ"}, "item": {"itemId": "IPK6mVytM5mBRT39", "itemName": "gKYLk9DmjJh6PnpT", "itemSku": "XWAUt8lgqNM4poGE", "itemType": "vIKCe3MrLxmnjmlA"}, "quantity": 41, "type": "ITEM"}, {"currency": {"currencyCode": "aBCdhzXb6cBMPNMm", "namespace": "jMi2uztFNfXg0Uvw"}, "item": {"itemId": "aZ0py16ShGomFzUa", "itemName": "ppaaODZaZ6Vzztnn", "itemSku": "toxwsNtNxWoH5wVH", "itemType": "JVaEnaycYsKkgX0R"}, "quantity": 79, "type": "ITEM"}], "source": "SELL_BACK", "transactionId": "dFn8sQ7yc8xLKyBf"}' \
    > test.out 2>&1
eval_tap $? 490 'FulfillRewardsV2' test.out

#- 491 FulfillItems
eval_tap 0 491 'FulfillItems # SKIP deprecated' test.out

#- 492 RetryFulfillItems
eval_tap 0 492 'RetryFulfillItems # SKIP deprecated' test.out

#- 493 RevokeItems
eval_tap 0 493 'RevokeItems # SKIP deprecated' test.out

#- 494 V2PublicFulfillAppleIAPItem
./ng net.accelbyte.sdk.cli.Main platform v2PublicFulfillAppleIAPItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'GLHEAKhp612Y2ncR' \
    --body '{"transactionId": "f7tEGzYqRoHm6Ety"}' \
    > test.out 2>&1
eval_tap $? 494 'V2PublicFulfillAppleIAPItem' test.out

#- 495 FulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform fulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'XqQbKWMJ0aODiWn6' \
    --userId 'bPmSa85Riu1alaVE' \
    --body '{"items": [{"duration": 15, "endDate": "1971-03-23T00:00:00Z", "entitlementCollectionId": "KeXUu9hINqKvoYKi", "entitlementOrigin": "Nintendo", "itemId": "ruYrVjX4HRTvm3Qr", "itemSku": "9IkuW6jjofc6itDE", "language": "sq0dHfYG6k853GER", "metadata": {"dJdphepF9dfsng9F": {}, "GGjJ0hRPUBFxM2Fr": {}, "3olO10RAyIZs2VfC": {}}, "orderNo": "RhzfKDAGIAJuPhQc", "origin": "Oculus", "quantity": 46, "region": "tIgVPb7hoo8YkNPW", "source": "PROMOTION", "startDate": "1977-08-09T00:00:00Z", "storeId": "WOJGtdXJGDsxRAR3"}, {"duration": 82, "endDate": "1991-12-05T00:00:00Z", "entitlementCollectionId": "bYp43YXMHqWeVjnO", "entitlementOrigin": "Xbox", "itemId": "RxGvOhz9s7ktWkJD", "itemSku": "aHg6kDVjxhxRxjeD", "language": "rqCfJEjrqJkFoZFZ", "metadata": {"ex0eOw31PXkVnetc": {}, "vAuim14Wdh1qKoSD": {}, "BbyqlJyfVgaW6ziZ": {}}, "orderNo": "F6ijZzA3MkosOcoA", "origin": "Epic", "quantity": 97, "region": "eLVWGk0GjYReIZaD", "source": "REWARD", "startDate": "1979-01-03T00:00:00Z", "storeId": "Au2bEpymbJ4dPJmk"}, {"duration": 6, "endDate": "1985-06-27T00:00:00Z", "entitlementCollectionId": "fAw30kOykBuDJ0IP", "entitlementOrigin": "Xbox", "itemId": "qa3lJMQ1sGlfqjDB", "itemSku": "zOjNeq8JJhbi7QD0", "language": "RW0qgxO0Y6TFpFSC", "metadata": {"srhSGeeExZYnGcrZ": {}, "HMKoTcIXeKZzZBo6": {}, "ARaQnNZQ1R0PGBFV": {}}, "orderNo": "nc37aWVjM3iVKjr5", "origin": "Steam", "quantity": 80, "region": "qakKdW767GAH1oiS", "source": "ORDER_REVOCATION", "startDate": "1989-06-17T00:00:00Z", "storeId": "l5J0IOZmnpzwHhig"}]}' \
    > test.out 2>&1
eval_tap $? 495 'FulfillItemsV3' test.out

#- 496 RetryFulfillItemsV3
./ng net.accelbyte.sdk.cli.Main platform retryFulfillItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId '9d6vdgfrNiGrH0hD' \
    --userId 'jH6IYpfINzNjk5V8' \
    > test.out 2>&1
eval_tap $? 496 'RetryFulfillItemsV3' test.out

#- 497 RevokeItemsV3
./ng net.accelbyte.sdk.cli.Main platform revokeItemsV3 \
    --namespace "$AB_NAMESPACE" \
    --transactionId 'T9pQjnGB83yonudf' \
    --userId '21g0NhuYvwCATIUe' \
    > test.out 2>&1
eval_tap $? 497 'RevokeItemsV3' test.out


rm -f "tmp.dat"

exit $EXIT_CODE